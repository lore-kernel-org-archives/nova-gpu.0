Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8733D6FC;
	Thu,  3 Sep 2026 03:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406098; cv=none; b=peiyQbmdziKjc3qbePpHR6wPaX7IVZO9XRkxtzuaQHM6qgljwCllx7UZ5Q5PHPJXaFXQEM8IR5C8Mv3pHYNFS4V2uuX2loTvixvJPCqDYM3r3UOySOtT2cnro8ZRMvi9hGsXozBHJZqtPzNyG43TJLNa7xoZHqgFBLtzQPJSY20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406098; c=relaxed/simple;
	bh=LLIeUWKOCk5otAaWlv4yCkq14xinl8AatPzj3OUkPK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HdHheiN/fGmbBoHrLz53bKn/F2mJqGT97iWBAkDSs3fLLRbm3bUrpzbtwTNqNifMdjgo7yVOxQ0kwLm0/tt4Hjq3KfcLZ60nYr33fs2m5Es+HF3I7iXHQgtnNUkyv5MmY3T4QTtDgwZocjbFSj/APgT2psejRuRO/4HsP4PAWpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3UAkRNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3UAkRNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDA71F000E9;
	Thu,  3 Sep 2026 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788406096;
	bh=jeUEOADsAwcYEqSMXSL1VYbix6SGg0JvaJgp2m5GgQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3UAkRNY19vffCfk13Gmn95QIv40+/+ujaxfNY8RR6kavCsD7e3tBwOyg0xhKdjOG
	 zwUZU9+lhn+3nM+HYD+mKozDYQk6WWR8beWJh0Xj0t7f2zbuEGHkx7nAXtkbiiHwXz
	 Ux132+yDqZ1U9Cy4YkfKET3LFSgHqwnCqnElNOymS+5FPGzdhN1cFrIswsiPyLcnO1
	 PMSnFaPu8kzRlev8DOOK7vDY6ICmXxmpgQjIUnrOTQ5giNMB6ncuC55f5BBTfywjE9
	 IWCBVlW6o+jAZKX7lu9KCUM94qL0QSzg28KGCQfvtHodFzUc7f6INSLKAVqRhYfA1P
	 W6fX6wO1ITgTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the
 SWGEN0 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Will
 Pierce" <wpierce@nvidia.com>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Trevor Gross" <tmgross@umich.edu>, "Gary Guo" <gary@garyguo.net>, nova-gpu@lists.linux.dev, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice
 Ryhl" <aliceryhl@google.com>, LKML <linux-kernel@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>
In-Reply-To: <20260903031514.1515905-13-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-13-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 03:28:14 +0000
Message-Id: <20260903032815.6BDA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unserviceable GSP falcon interrupts cause an infinite interrupt st=
orm and CPU soft lockup.
--

commit e6648318ceeb9312972b220805b21b9370c7409e
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: drive GSP events with the SWGEN0 interrupt
   =20
This commit implements threaded IRQ handling for the GSP SWGEN0 event in
nova-core. It replaces polling with an interrupt handler that drains the
GSP-to-CPU message queue and clears the GIN leaf in hardirq context.

> diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq=
/gsp.rs
> new file mode 100644
> index 0000000000000..174488565f790
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/gsp.rs

[ ... ]

> +impl irq::ThreadedHandler for GspInterrupt<'_> {
> +    /// Top half: clears the GIN leaf, takes every falcon cause pending =
for the host, and rearms
> +    /// PCI interrupt delivery.
> +    fn handle(&self) -> irq::ThreadedIrqReturn {
> +        let bar =3D self.bar;
> +
> +        // Only service our own vector: require the GSP bit in the leaf =
and clear just that bit, so
> +        // a co-pending vector in the same leaf stays pending for whoeve=
r services it. The subtree
> +        // stays enabled, so there is no whole-tree disable and enable.
> +        let leaf =3D self.tree.read_pending(GSP_INTR_0_VECTOR.leaf_index=
());
> +        if !leaf.vectors().contains(GSP_INTR_0_VECTOR.leaf_mask()) {
> +            // Nothing to service, but nova-core is the only consumer of=
 this PCI interrupt, so
> +            // skipping the rearm here would silence every later interru=
pt as well.
> +            self.tree.rearm_pci_irq(GSP_SUBTREE);
> +            return irq::ThreadedIrqReturn::None;
> +        }
> +        leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
> +
> +        let status =3D GspFalcon::take_host_intr(bar, self.chipset);
> +
> +        // A cause left latched holds the falcon's host-routed set non-e=
mpty, and the falcon
> +        // signals the tree only on a transition of that set, so no late=
r SWGEN0 would signal.
> +        let unserviceable =3D status.with_swgen0(false);
> +        if unserviceable.into_raw() !=3D 0 {
> +            // nova-core has no recovery path for a cause other than a p=
osted message, for example
> +            // a HALT from a GSP crash, so report it rather than discard=
ing it.
> +            dev_err!(
> +                &self.dev,
> +                "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
> +                status.into_raw()
> +            );
> +            GspFalcon::clear_intr(bar, unserviceable);
> +        }
> +
> +        // The leaf clear above consumed the tree's record of this inter=
rupt, and the falcon signals
> +        // the tree only on a transition of its host-routed causes, so a=
 cause that arrived while
> +        // this handler ran would never reach the CPU. Re-emit to supply=
 that transition.
> +        GspFalcon::retrigger_intr(bar, self.chipset);
> +
> +        // Delivery resumes only after this, so it must happen on every =
path that services the
> +        // vector, including the fault path above.
> +        self.tree.rearm_pci_irq(GSP_SUBTREE);

[Severity: High]
Does this lead to an interrupt storm if the GSP remains in a fault state li=
ke a
HALT or WDT timeout?

If there is no recovery path to reset the GSP, wouldn't the unserviceable
interrupt immediately re-latch after GspFalcon::clear_intr() is called?

The subsequent calls to GspFalcon::retrigger_intr() and self.tree.rearm_pci=
_irq()
would then force a new edge to the GIN tree and re-enable PCI delivery,
potentially trapping the CPU in an endless loop servicing the same unservic=
eable
interrupt.

Could the GIN leaf source be disabled here instead when encountering an
unrecoverable fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903031514.1515=
905-1-jhubbard@nvidia.com?part=3D12
