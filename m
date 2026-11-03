Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702677;
	b=VyxmIffygG5TsP5VCl+/yeK1DcQ8pU9pBeIzzwdowtiL8olrj9mW5Hz+ij97bhphuAng
	 djjUjlUzNCqsvUuOPRypM62xc8h4FF55b1JnGUMweZzL9RhTwPD3ykxxuO/6JNHhXkr5K
	 ri2xtU1OaAgUfg0yGnmuhZiEs1iJZLjK141TEh20Pt+MLNNbUk/EdpKMAlsNO61ycli4z
	 KEkE60uLaI/usrOvpOiPWAZzartsJPRteFDSUH0YaNHbXyVXUSbJHoaCah4V/VMvagAbB
	 HM3BIEoVC++S0zcTFcJNu2OBo2TgyJ2ikox7ZIZBguWqLgR/hWo8UxoIlx+7UapJtIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nlED7dlu79l3RaF1ppwE3YPFTjOR/6T8L55YQhgA6wU=;
	b=iRMxs6hPR6tzDwQhMpTuHlcrpxJW5QU7lYOFCEFIhZqe1UzFcJ2ALq0RVM6dEFV/US2+
	 CLee9DAKtRRosdS9n5QZlEy4Ph+YEvo06fbzHYgrd0dsKuWyESMikupZCegaObEUbwwDk
	 gYV49g0sx8GjLc7r7UWrzDept4oDMA0t+SrAHfabrsp6UQex5U5p40GNMUCEFZiLYzCiV
	 9tBTQ6OEZIkFfWZek5xpM2hXls3m+n/mxuYewS9/IJl5i8Re3UPp37YISf6q0Zy2ZEKN5
	 xLul9AaAwxqLSRhYqDfaVmw07sx776TV4zVd+J4YnirjQ86EVunc/ZwM0BemuIJIy+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVSiMqye;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE906606BF97
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVSiMqye
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB41F000C1;
	Tue,  3 Nov 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793702676;
	bh=nlED7dlu79l3RaF1ppwE3YPFTjOR/6T8L55YQhgA6wU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVSiMqyeKTk8SqEjkTa+HUueUYgh6q3wrQR3MmYldnTUNDFP9cEMEoTZveLrw90s/
	 9rtGK3nYUJAq9Txdur9u0cSCBHbqP8+w1luoaxEJh6frxOArLAfF9IUV/gPTAUsJNk
	 h0tSrkxs1Wydy3yiSrxFjE3ciniPyB4p34a1z3MaAVOKoDXNh6XnaNy3djOWmRTWYE
	 BjpjypqSptigK07hzEzIh+KDfLnNnEIH2lnd+pfaCJGxii+Kx7lDLMQGnaqUgSGSoF
	 DT/JqE0/z8eOv7kbK7rvuz9kOeDFWnO4QbDBzZcdf+bALxe6FmAawi7pjsNabtakct
	 c5PmJ0dTV26wA==
Message-ID: <sashiko-outbox-195064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] gpu: nova-core: falcon: allow DMEM DMA transfers to
 request tagging
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:44:35 +0000
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
- [Medium] gpu: nova-core: falcon: dma_wr() tags DMEM from 0 instead of src=
_start
--

commit 56cacdd1fe2703c8ab2ff5d3ae42bbd82138503b
Author: Alexandre Courbot <acourbot@nvidia.com>

gpu: nova-core: falcon: allow DMEM DMA transfers to request tagging

This commit adds a tag flag to FalconMem::Dmem and uses it to program the
DMTAG bit in NV_PFALCON_FALCON_DMATRFCMD during Falcon DMA transfers.

> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 1bceb38c33c66..f48f2eabab0f4 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -131,8 +131,9 @@ pub(crate) enum FalconMem {
>      /// Non-Secure Instruction Memory.
>      #[expect(unused)]
>      ImemNonSecure,
> -    /// Data Memory.
> -    Dmem,
> +    /// Data Memory. If `tag` is set, a transfer into DMEM also tags eac=
h block with its source
> +    /// offset, which is then the DMEM virtual address of the image.
> +    Dmem { tag: bool },
>  }
> =20
>  bounded_enum! {
> @@ -529,9 +530,9 @@ fn dma_wr(
>          // code addresses in the firmware (and the boot vector) are virt=
ual.
>          //
>          // For DMEM, the start offset is folded into the DMA address.
> -        let (src_start, dma_start) =3D match target_mem {
> -            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load_=
offsets.src_start, 0),
> -            FalconMem::Dmem =3D> (0, usize::from_safe_cast(load_offsets.=
src_start)),
> +        let (src_start, dma_start, tag_dmem) =3D match target_mem {
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load_=
offsets.src_start, 0, false),
> +            FalconMem::Dmem { tag } =3D> (0, usize::from_safe_cast(load_=
offsets.src_start), tag),
>          };

[Severity: Medium]
When Falcon::dma_wr() in drivers/gpu/nova-core/falcon.rs is called with
FalconMem::Dmem { tag: true } and a non-zero load_offsets.src_start, does
this end up tagging the DMEM blocks starting at 0 instead of
load_offsets.src_start?

The comment on FalconMem::Dmem states that if tag is set, each block is
tagged with its source offset as the DMEM virtual address. However,
Falcon::dma_wr() unconditionally sets src_start to 0 and folds
load_offsets.src_start into dma_start for FalconMem::Dmem { tag }, and then
programs NV_PFALCON_FALCON_DMATRFFBOFFS in the transfer loop with
src_start + pos:

    for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
        self.pfalcon.write_reg(
            regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
                .try_with_offs(load_offsets.dst_start + pos)?,
        );
        self.pfalcon.write_reg(
            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_st=
art + pos),
        );

Because the Falcon DMA engine uses NV_PFALCON_FALCON_DMATRFFBOFFS as the
block tag when set_dmtag is enabled, setting src_start to 0 tags blocks
with pos rather than load_offsets.src_start + pos. Note that follow-up
commit 5a1fab864a35 updates the VRAM path to pass src_start, but still
leaves src_start as 0 in the FalconDmaSource::Sysmem arm when tag is true.

Should FalconMem::Dmem { tag: true } keep src_start =3D load_offsets.src_st=
art
and dma_start =3D 0, matching the IMEM path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-r000-fw-v1=
-0-e3d38fc130e3@nvidia.com?part=3D5
