Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA5155A5D;
	Tue,  2 Jun 2026 03:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371063; cv=none; b=N+u5dDQWPx5kGdfeVZU9OU9dU4WlI/KN2vw3D8RK0Py0rDE/PFiwY23CguLRYsPc23cvk5Y5SN6T/HF7eGC/55yXDld4pIXEb4r10IVWP7YpTYKJgWQbdZbLbp2LZcWWqz2G3bpNFfiRhXsMLw9xlXvkj0NI3QvCZWp+kKR3+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371063; c=relaxed/simple;
	bh=V0drM4ZDfrWx7NfGz/VdtGJt4X/z67ApqLWldIvQfDw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1lFhpDOUE+8S7jpJGf55s/+Vkov/HsfOaP9JrIR2WinuYStPNKoj4GJXu0wI40xihjqUfY5DL1j5qYnF5SOv6PYyPy1rTECgN/k2yQP/eMPdU2bO0XYxGPcYZwtALmfy0UH9LrCd5ekdteb8F0YuHFVOaOMHfbG2nuOdVfvwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l800dIcT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l800dIcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1571F00893;
	Tue,  2 Jun 2026 03:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371060;
	bh=Z8LZzXtjw4l5Nnh39fjjdcIP/R5naz4FlC5P4z9O3zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l800dIcTdgXKfcU6X/YiiV9fWKaMJVH5WRD/iC8FiMEB3RuDbjoYRW2F9npSiLVou
	 ByucftT6b4J9uUivmd1sU9xXeMf1oVnuXVI9wFrBc2T85cY1eIW5Uf/dz3SJCDRB3c
	 vokMR/82j9VqWn55oAPcZVzTcFUmh3/S6tfoX2BW4Hop8wiK1LDCE/yw1B9+jufuQC
	 6xr1G9uB8Q0PZJbSAUpVXqIFC88KvuAzKbBrudm9J4AG6WTTb5+yaItxxuL46krgIg
	 Wd/H9BoNGp9/bxNQ3iPBjZBolbIfZTRsqsX8t5v/rtISkF0w8WluFOvLXfQBqNoR3D
	 WHBdrV0FdlaLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Shashank Sharma" <shashanks@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Timur Tabi" <ttabi@nvidia.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, nova-gpu@lists.linux.dev, "Benno
 Lossin" <lossin@kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "David Airlie" <airlied@gmail.com>
In-Reply-To: <20260602032111.224790-7-jhubbard@nvidia.com>
References: <20260602032111.224790-7-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:30:58 +0000
Message-Id: <20260602033059.2B1571F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware match requirement violation during sysmem flush configura=
tion on GB10x.
--

commit 4c62a61ec72a7cc29b5d20a82279ea5490f2e759
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Blackwell: use correct sysmem flush registers

This commit updates the Blackwell GPUs to route the sysmem flush page
registers to their proper locations. It defines the registers relative to
HSHUB0 for GB10x and FBHUB0 for GB20x, and implements the flush paths in
their respective HALs.

> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb100.rs
> index 8d63350abf8aa..ecea4ff446fff 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs

[ ... ]

> +/// Write the sysmem flush page address through the GB10x HSHUB0 registe=
rs.
> +///
> +/// Both the primary and EG (egress) register pairs must be programmed t=
o the same address,
> +/// as required by hardware.
> +fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
> +    // CAST: lower 32 bits. Hardware ignores bits 7:0.
> +    let addr_lo =3D *addr as u32;
> +    let addr_hi =3D addr.shr::<32, 20>().cast::<u32>();
> +
> +    // Write HI first. The hardware will trigger the flush on the LO wri=
te.
> +
> +    // Primary HSHUB pair.
> +    bar.write(
> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>(),
> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(=
addr_hi),
> +    );
> +    bar.write(
> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>(),
> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(=
addr_lo),
> +    );

[Severity: High]
Does writing the primary LO register here trigger the flush before the EG
registers are updated to match?

The comments state that the hardware triggers the flush on the LO write, and
that both the primary and EG pairs must be programmed to the same address.
Because the EG pair is written after this primary LO register write, could
the hardware perform the flush while the EG registers still contain their o=
ld,
mismatched address?

> +
> +    // EG (egress) pair -- must match the primary pair.
> +    bar.write(
> +        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>(),
> +        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_a=
dr(addr_hi),
> +    );
> +    bar.write(
> +        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>(),
> +        regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_a=
dr(addr_lo),
> +    );
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D6
