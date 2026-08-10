Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC8396D25
	for <nova-gpu@lists.linux.dev>; Mon, 10 Aug 2026 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386764; cv=none; b=O0OvVPv9jJGx2Hj1SwVSvrtKd4Slbhpl7yNaH6aqdOQLHvbZYLq+257PQk9FJ00ZYSs7IcW26nCT1GpUWg9hDmLCBHNwzy0VvT8x+y+hb3BGTaKUwQPU+AMBkVv2Xm1tSOCVtc2rVhuvpSmHlR5TQg/GBmBMRotPEkjposykXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386764; c=relaxed/simple;
	bh=DXRCF+T8drYeR0RWclKWiJwOos2G/PlC0LcaCm2MVnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hwircvP9KLDB6f0/y0yY44bA84uFJJF8ih4YvrrhGFXDsN7dg5Hen0SJqAvcRD44gFXdKaS/PWxIY+L0EkMdadEp/1DnsQvfP9K0KBcQg/fzhwGEuGtW3juNBybwr7t1Mesj1bngPgNvDLVSPqA/ifF05g60zHjxOgCLbNltPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMe3b7qz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMe3b7qz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2121F000E9;
	Mon, 10 Aug 2026 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386763;
	bh=fCtDeT1OLSlnJBw8Oz1bhhtvTSSk091xicyujmltBgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMe3b7qzBLK/IWkZp8SEsLqd2vwezMW8U3nSJIR1pCekQk71WKQxZRv3ce1sz8Uw3
	 WYF90m03fuQ698d44ssTUQuWkyWKcwCH2zcjNnlkV62DUq6iVIik2HZruYoPUJhnnA
	 IUPaXDZMPh6bcuTgojPzUYXICnqlKwJS6UWHVkYRWivRhZx/3iHwI10G4mhJ0jbTDl
	 kliKjw1XWdPM90XdaPwaKbJygdnRzbud4RWyXs2oyCyWDSHNE/LD8f0tkMnSPYxrPX
	 ROaQUFbRl2KHwmaRXAAfbMB+Rt6WCm654bLVj+M7+R7ltE2UqK3wNvAtp+cvERtGDQ
	 zNhE8Kt5S0XtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpu: nova-core: write initial RPCs before booting
 GSP-RM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, nova-gpu@lists.linux.dev, "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
In-Reply-To: <20260810181243.3036669-1-ttabi@nvidia.com>
References: <20260810181243.3036669-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:32:41 +0000
Message-Id: <20260810183242.AF2121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing release memory barrier before updating the CPU write point=
er, allowing the GSP to observe uninitialized or incomplete command data.
- [High] Missing acquire memory barrier after observing a new message in th=
e queue allows the CPU to read stale payload data.
--

--- Patch [1]: [PATCH] gpu: nova-core: write initial RPCs before booting GS=
P-RM ---
commit 3ab88c6e4aa22a470f9df92e225ac238c75c0482
Author: Timur Tabi <ttabi@nvidia.com>
Subject: gpu: nova-core: write initial RPCs before booting GSP-RM

This patch writes the SetSystemInfo and SetRegistry RPCs to the command
queue before booting GSP-RM. This ensures the messages are present when
GSP-RM processes the queue early in boot, fixing a failure to initialize.

> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index e03700ee7beaf..874f6e9499f01 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -44,6 +44,11 @@ pub(crate) fn boot(
> =20
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset), GF=
P_KERNEL)?;
> =20
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
, chipset))?;
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vg=
pu.state())?)?;

While reviewing this code, I noticed a couple of pre-existing issues in the
cmdq implementation being used here.

In drivers/gpu/nova-core/gsp/cmdq.rs:advance_cpu_write_ptr():

        MsgqTxHeader::set_write_ptr(tx, wptr);

        // Ensure all command data is visible before triggering the GSP rea=
d.
        fence(Ordering::SeqCst);

[Severity: High]
This isn't a bug introduced by this patch, but is the memory barrier placed
incorrectly here?

It looks like the fence is placed after the set_write_ptr() update. Should
it be placed before the pointer update to ensure preceding payload writes a=
re
globally visible to the GSP when it observes the new pointer? If the GSP
polls the queue, could it observe the new write pointer before the payload
writes are visible, leading it to read uninitialized or corrupted commands?

Also in drivers/gpu/nova-core/gsp/cmdq.rs:wait_for_msg():

        let (slice_1, slice_2) =3D read_poll_timeout(
            || Ok(self.gsp_mem.driver_read_area()),
            |driver_area| !driver_area.0.is_empty(),
            Delta::from_millis(1),
            timeout,
        )
        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flatt=
ened()))?;

        // Extract the GspMsgElement.
        let (header, slice_1) =3D GspMsgElement::from_bytes_prefix(slice_1)=
.ok_or(EIO)?;

[Severity: High]
This is a pre-existing issue, but is there a missing acquire memory barrier
here?

The read_poll_timeout() observes the updated GSP write pointer via
driver_read_area(), but there doesn't seem to be an acquire barrier before
GspMsgElement::from_bytes_prefix() reads the payload. On weakly-ordered
architectures, could the CPU speculatively read the payload data from memory
before the GSP's write pointer update is strictly observed, resulting in
stale memory reads?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810181243.3036=
669-1-ttabi@nvidia.com?part=3D1
