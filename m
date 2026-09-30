Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082BF4E73D3;
	Wed, 30 Sep 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772709; cv=none; b=PogBm1AsQql0L+AQNERTdbRu3HGraLh0QA/UtbSteeZJ9gyhsZcI0KhnnTf4p0zRkKDjld0zbwGBw9Ru8c7nqibdRJBARVETWGxWoJwAMibOBZB4+xgoSJpxba1RmKxCb30hsCoCnMaq3RROOOxV47msAOFSt8bBDUsOf3y8EzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772709; c=relaxed/simple;
	bh=QxHUjEqNNe7RMAaAj3xQobPFYKOPL0m80zff2N+Cjdo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Yj/p95KmGQEbdok21BJpIen6HOSiaMdpoNk1lf0wJxE3PR+3wqNR5wgK6ilLIFa3EH+msWI3GTsJt9wyr7HQS6d4SSIxSTIJYp6SDVpztaX3Hq4dGD3k3SZD+B1Y3jDDBFqlUKsNVUqHV2jbfXaof2rXhrKjjlfeEvxNP+JxuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUYR2r+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUYR2r+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CDA1F000FF;
	Wed, 30 Sep 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772699;
	bh=CQpG+P530RxPFSP0FViSAaWSuxATCRl8mcOZOSkm/fw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=GUYR2r+U8txbkma9EciXQENw03fi2xzl5rz7ma7NoVdpwWTDC9gTvBiNW+hCtafZY
	 ow8UG9Gs7LSXm5iJvcJF4N7Q4Tw+xZDiiXunzghkvK668aRb5fPruWgPRw1Ql0wR8x
	 XkFLMLaZ1GJbhMk3gdiGY3JX7Vl9bFTeJiMXq29a+X5XU8X5DTBpSDrMglBDWKwiCn
	 P1n3r7Htbod1GvWKBgR+sLY7crZ9dIfroMAwDEAL4vBWqMwIr8zG5FqiSuxv9Olqq9
	 DV49D6F89PY5VfIDmmgC8OuJxUzE4+bTnx0K41dtNC8fa7UzZY70G5gRDQpikAoCW8
	 szXDFJ5eOLrZQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 14:51:34 +0200
Message-Id: <DLSNXUU1UXIH.JG4L0L5ZFV89@kernel.org>
Subject: Re: [PATCH v5 07/15] gpu: nova-core: wait for GFW boot in probe,
 not in the Gpu constructor
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-8-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-8-jhubbard@nvidia.com>

On Wed Sep 30, 2026 at 5:41 AM CEST, John Hubbard wrote:
> @@ -113,6 +117,14 @@ fn probe<'bound>(
>                  pdev.iomap_region(bar1_idx, c"nova-core/bar1")?
>              },
> =20
> +            _: {
> +                let spec =3D Spec::new(pdev.as_ref(), bar)?;
> +
> +                // We must wait for GFW_BOOT completion before doing any=
 significant setup on
> +                // the GPU.
> +                gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.c=
hipset)?;
> +            },

So, apparently this is done in order to be able to add this

	#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
	crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;

in a subsequent patch.

I prefer to make wait_gfw_boot_completion() an associated function of Gpu, =
keep
it called from Gpu::new() and guard the whole block with
#[cfg(CONFIG_NOVA_CORE_SELFTESTS)], such that eventually it becomes:

	#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
	_: {
	    let spec =3D Spec::new(pdev.as_ref(), bar)?;
=09
	    Gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;

	    irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
	},

With this Gpu::new() remains self-contained and we don't build up corss
initialization dependencies.
