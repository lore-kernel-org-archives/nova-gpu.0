Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997885;
	b=ysiz46e6id9q8rZgKtLKlFRHJRl/0EKzpn44NjJ7XAmKtQpAi6ddJ1MX0ihQnRVpLPk/
	 XbjZEu/ZsXmE8gDrBuNZ4Y639ByeibXrsccV3E47OcSZlxzc+rRwXyew6FRbVENOQKRUB
	 M416xZxj8a4ec9GWPhogHLI/i2seKz/AOhOElaR+bkt93wSAocTWzt0c+C8n6nkveYtff
	 VHlQa1TK03tAy1stlvz2ElmFUwN/uNb+LDzze2Vn1be7CY8XV8taXalMJu2jPxYDoMCDk
	 h7YB5TbFulL9qdIev2XcZeeN00k9qfQYCO5kne6MdMfc2xcsltcpN9zvYOvmeVLqdcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997885;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AbK87O2XyTNzCdq4XW1LsVZjCV0uMRGm8KEcoU6ddEU=;
	b=tbveTcRvBd7xWM3xY861QruyJoJL1gghP2NVfCAGR4C/l2jOt1VV5ddNATOT4sgGYpn4
	 UCbmU1FgNMqwbkKzXh+dThIBK+oT8roZrPpzZLa9of3zDihQjX1nXW4Zy8aNrRAlhz9I0
	 e98ex+ho3vEqB/5QETCPyckW+T8mCVrVjdIhPOeRwVfqkXiz5IfPgCV3kNyitvVCTPko0
	 4K/OofunBC1w1kjVtQonRD93qhdFnVtI816csT1PH3C9d0NHBnLyRjT95HsrdzbIzKcf0
	 qvW3H/qGPy9QtgsQa0KSKgp+jZFz7mE7pMbHjlKnDktQoBDC78oI++yF0ycYVCYWXfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYTs39fr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3BC606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYTs39fr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD35D1F01825;
	Mon, 26 Oct 2026 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792997885;
	bh=AbK87O2XyTNzCdq4XW1LsVZjCV0uMRGm8KEcoU6ddEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WYTs39frFypqbAcA/olYUVPDgFUrqLVO7XQgpqdc4GdR2G1Kj+dPtMMHr2zEomlnB
	 b2w97I+RirRq3p62CkNxn0XdcqI+fUfVbX2LUTfqjqsZapKwTuoFA/TDY1jUYY7Ib8
	 6GaPuw5sLsfivS5W1WKGM8qw92MB/3YWsQAUjCdgyzDWY+9pg9s9rheXIIlrodD7/V
	 X+Y9r3TvIVhx84UQl4Pau4By2BNI8mshQpSoVEAQ4k7hFTwkfJp0nrOvBJDs2zZ0c9
	 6ouJtdNulvFV5EjX0j2Jy6zSgNbI/faNFolsM/VmUR1mrztRacTZx9FBpgt39WJvdU
	 3biF0AnI/e1FQ==
Message-ID: <sashiko-outbox-184634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpu: nova-core: make pramin/buddy optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261026-nova-pramin-option-v1-1-d073b3f047fc@redhat.com>
References: <20261026-nova-pramin-option-v1-1-d073b3f047fc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 06:58:04 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpu: nova-core: Gpu::new() always passes Some for total_fb_end t=
o GpuMm::new()
--

commit c48efe432798819fed4e7632bc17f4fc720dd7e4
Author: Dave Airlie <airlied@redhat.com>

gpu: nova-core: make pramin/buddy optional

This commit updates GpuMm so that the GpuBuddy allocator and Pramin manager
are optional to support GPU systems with no framebuffer memory.

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 4e59072cab507..5d53fde2cdc1e 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -564,18 +564,19 @@ pub(crate) fn new<'a>(
> =20
>              // Create GPU memory manager owning memory management resour=
ces.
>              mm: {
> -                let usable_vram =3D gsp_static_info.usable_fb_regions.fi=
rst().ok_or(ENODEV)?;
> -                let buddy_params =3D GpuBuddyParams {
> -                    base_offset: usable_vram.start,
> -                    size: usable_vram.end - usable_vram.start,
> -                    chunk_size: Alignment::new::<SZ_4K>(),
> -                };
> +                let buddy_params =3D gsp_static_info.usable_fb_regions.f=
irst().map(|usable_vram| {
> +                    GpuBuddyParams {
> +                        base_offset: usable_vram.start,
> +                        size: usable_vram.end - usable_vram.start,
> +                        chunk_size: Alignment::new::<SZ_4K>(),
> +                    }
> +                });
> =20
>                  GpuMm::new(
>                      bar,
>                      gsp_resources.spec.chipset,
>                      buddy_params,
> -                    VramAddress::from_raw(gsp_static_info.total_fb_end),
> +                    Some(VramAddress::from_raw(gsp_static_info.total_fb_=
end)),
>                  )?
>              },

[Severity: Medium]
In Gpu::new(), the total_fb_end argument to GpuMm::new() is unconditionally
wrapped in Some(...). Since Gpu::new() is the only caller of GpuMm::new(),
won't GpuMm::new() always receive Some(...) for total_fb_end and
unconditionally call pramin::Pramin::new(), which writes the hardware BAR0
PRAMIN window base register via hal.write_pramin_window_base(bar, base) and
leaves GpuMm::pramin populated even on systems without framebuffer memory?

Also, in drivers/gpu/nova-core/gsp/commands.rs, GetGspStaticInfoReply::read=
()
still requires msg.total_fb_end() to be present when called from
Gpu::new() -> Gsp::get_static_info():

drivers/gpu/nova-core/gsp/commands.rs:GetGspStaticInfoReply::read() {
    ...
    let total_fb_end =3D msg.total_fb_end().ok_or(EINVAL)?;
    ...
}

When GSP reports no framebuffer regions, msg.total_fb_end() returns None,
causing GetGspStaticInfoReply::read() to fail probe with EINVAL before
GpuMm::new() is reached.

Should GetGspStaticInfoReply::total_fb_end be changed to Option<u64> (or
Option<VramAddress>) and passed through to GpuMm::new() without wrapping it
unconditionally in Some(...)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-nova-prami=
n-option-v1-1-d073b3f047fc@redhat.com?part=3D1
