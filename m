Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE33471269;
	Wed, 22 Jul 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706759; cv=none; b=abJYN+Ro6iz8ywyyxgJlhhDbq5ng71Jei8R+20Y0BG6Igh37bDB5ZVt9ZW89bUBl7RsReqUHjXh5bmw4IJMplRcGOWPpROdiOgIiaVniUFL+DiiJ+dpKMw1+uN2/BWf5KaZdsn3TQrWuvyoHhhrl8geTGePtRwqwrVrKOJaFHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706759; c=relaxed/simple;
	bh=8SkULKYuqqptWq5ufk4EKspa06wrwbS/keY1eUAZjYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJ5mRrrijAmGa93W5q3u16mGTpESXSBMcBuQHCk5aLRYlQpoFTF0vCXIlgKhFsjr8HzHyl0BewTTbngO0s7m0h/wfTcO8Z8oEJm2mOqrFj1CvZHKNye6FFBtXkgM+bbVxQ4PchrJrVMCrIf+SzI73jQoZKI48N8650nNdRLzmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caZw4OKI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caZw4OKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9E91F00A3A;
	Wed, 22 Jul 2026 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706756;
	bh=p/gDdS45MIZfHRCEr6LvOkGLvxg96/oVkAvBvfCRyIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=caZw4OKIwPExdgb9ayjdtyJmY2fKgX9CL8PcIfshiKptfKWqm5Ez5ico7/KcnneO/
	 P65vthZ9f2SBhoAhli9TgYFkqVWwGfS3/iK3ujd8pdifFKfbMPvm0f/xG+cRvmVQIk
	 0WjLJKzLt9nI1xEwdeuy5ZN8rmvWbgBn7KEmS1l/4o010C7Tmbsd0nKRiKT2MXLe0C
	 4BHx6t3ZpJm+33n+IILaq65fF/FVxWmN4hSP1AV2VG6QpiYZGzs7ncEb1ZGyh2EiPI
	 8DiFQXlPpwELxl5h/K7IC4XS1GzyRjBKRxML893WI5xkpEYSm0SoFlIMoPLk9+i2NJ
	 ps/Fq34vSAcbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] gpu: nova-core: reserve vGPU WPR2 heap
Reply-To: sashiko-reviews@lists.linux.dev
To: acourbot@nvidia.com, dakr@kernel.org, "Zhi Wang" <zhiw@nvidia.com>
Cc: ecourtney@nvidia.com, joelagnelf@nvidia.com, "Alexandre Courbot" <acourbot@nvidia.com>, boqun.feng@gmail.com, zhiwang@kernel.org, linux-kernel@vger.kernel.org, a.hindborg@kernel.org, apopple@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, airlied@gmail.com, ankita@nvidia.com, aniketa@nvidia.com, tmgross@umich.edu, alkumar@nvidia.com, gary@garyguo.net, kjaju@nvidia.com, kwankhede@nvidia.com, "Danilo
 Krummrich" <dakr@kernel.org>, ojeda@kernel.org, targupta@nvidia.com, lossin@kernel.org, bjorn3_gh@protonmail.com, nova-gpu@lists.linux.dev, alex.gaynor@gmail.com, simona@ffwll.ch, jhubbard@nvidia.com, aliceryhl@google.com
In-Reply-To: <20260722073913.1807677-7-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
 <20260722073913.1807677-7-zhiw@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:52:34 +0000
Message-Id: <20260722075235.5C9E91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked subtractions during framebuffer layout calculation can u=
nderflow if the device's video memory size is unexpectedly small.
--

--- Patch [6]: [PATCH v5 6/6] gpu: nova-core: reserve vGPU WPR2 heap ---
commit f23fa75b7168b0143fdda0d52c83938a849ca02d
Author: Zhi Wang <zhiw@nvidia.com>

gpu: nova-core: reserve vGPU WPR2 heap

This commit updates the framebuffer layout calculation to pass the detected
vGPU state. It keeps baremetal boots on the existing heap sizing path and
uses a firmware-dependent 570.144 vGPU default heap binding when vGPU is
enabled.

> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
[ ... ]
> @@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, =
gsp_fw: &GspFirmware) -> Resu
>              FbRange(elf_addr..elf_addr + elf_size)
>          };
> =20
> +        let (vf_partition_count, wpr2_heap_size) =3D match vgpu_state {
> +            VgpuState::Disabled =3D> (
> +                0,
> +                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?,
> +            ),
> +            VgpuState::Enabled { total_vfs } =3D> (
> +                u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
> +                gsp::LibosParams::vgpu_wpr_heap_size(),
> +            ),
> +        };
> +
>          let wpr2_heap =3D {
>              const WPR2_HEAP_DOWN_ALIGN: Alignment =3D Alignment::new::<S=
Z_1M>();
> -            let wpr2_heap_size =3D
> -                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?;
>              let wpr2_heap_addr =3D (elf.start - wpr2_heap_size).align_do=
wn(WPR2_HEAP_DOWN_ALIGN);

[Severity: High]
This is a pre-existing issue, but could this subtraction underflow if the
hardware or a hypervisor reports a malformed, undersized framebuffer?

Since this patch introduces a hardcoded ~581MB requirement for
wpr2_heap_size in vGPU mode, the risk seems significantly amplified. If the
hardware-reported video memory size isn't large enough to contain the
bootloader, elf, and this new large heap, elf.start - wpr2_heap_size will
either panic or wrap around to a massive out-of-bounds address.

Should there be a validation check against the total fb_size before
allocating these ranges backwards from the end of the framebuffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722073913.1807=
677-1-zhiw@nvidia.com?part=3D6
