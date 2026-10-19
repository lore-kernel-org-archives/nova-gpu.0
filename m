Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447718;
	b=m3s54EM6Va5sLf0IMu11aENQJ0ypwwSfZl3pJ3jnQLfpLHR8d8zxo7MOiUwFSfggZ2Vv
	 FJ/Zpd1lugcq0Scd6bhxWMMrd17UDkVwF0j5pmBr6hOifnvQHH9NZRTR6DXj8ybq4V117
	 qYfE8X1lQAOIpWRldsbiN8PQyti9E6MLdAZfqmSSu+rcTFzOcwKAikLolWuAoaepLMbxn
	 9m56LKF4kYdViU1SqrCJu8+9FA46TGRuoexjMFvY+kMh8QHd5p//LpSB8kcBRMRuQHyzq
	 S/4Xg9SWmMu/fFsfYwt3buY24ctW5EhqS0zk/s+1sWOJUzrMyZhoqe7k2oEO/axFSuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
	b=LUtJiTiN56aWuLU/qmSy1UCfvlI+kMrVzCQ+n/42Cfo5qq7HOHjCF9typ3hXP1YfhfLz
	 o4u0KO8Ccj2DLVVXDXerMcJh90IlRAoOwUtfYv4VvbmGl1tQJPhsMq5suCRQ2iqjNBiVa
	 sj4hgs/km88nF8KEAysCPoXIO6q53UF4u/qhxF+79f+37g19FtgnkFmtoWZa9ww9xlatJ
	 l9zRg+dX4vKYHAxq/egqQZJW5vL+riHBr2G0ysHjk1Z/pNRqa7Byr1hJyaNt/XrGqAvv5
	 C9oziQJu7TAkDpxFLN9o4Db9s/v8jeCPwINg+2V1bf7omSMSGVpOBJp1rGHZscxtcYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=gfxstrand.net;
	spf=fail smtp.mailfrom=gfxstrand.net;
	dkim=pass header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=N9zeIVwB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8E606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 22:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=N9zeIVwB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f036b17easo1260828eec.1
        for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 15:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447716; cv=none;
        d=google.com; s=arc-20260327;
        b=FxMOQrtxAQx6C8VnPhF8/13Pl5BWuJAnxHEPuHGVa960FTqHtv4pas40cGFk3ODmtq
         KrkXNEdlnxtHqGQQrTcwBFtsZiiY+DBCDFdo6XU/KROf4dYuQoQUXiiSrrzhhXeC2VTJ
         vqIzeuhrU0w+MLE5vg0tPu305isH+LyxKl/Fs2JX4BTTJThGyHTjVfPzyg40S3Swx2Nt
         1Hjfb1jn7aiCqo6PV0LTcavpjkIIyNb81JqfvFz/6KrBpO852oVQ2zfYHuuWzQUh6lP3
         kEYI1KFu9a5SUqxOUogDOEavgJismv1aoQhOtK1LMiPk600XlzK99/kjJ86qecV/zYrJ
         n0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        fh=6B7CcXnBRMaoGb1WTaARS1bMgSt3BF+1nxrtE5llNTk=;
        b=NUvwwoj3688E0HGTYjvoOjEuxCeMwkZt3iJeTVnyA5GfZ29yIK5IZiJWhsxYRD59Zo
         7QSsjGly0lbW7j9hD/zFglqICsXz397e/31kt+/ho/oKwb9KP8iJrbpxQq7rMnBaj6wo
         SLhPXQV4/ldXAh8yL7m4G4NAoz9iDGSr6x5FjaRHQ98TF0RIW71AsNO72Mk6DH/czoPK
         uY1SIX8IQXwcVDpchH08mLzbZQs0IhrkLpY5ele+/mTSu9RMvar9GpC2cd9zgMj5ao0f
         slfm4KSCYq9eaOCxBEFhho+phUmcXmWuz64jOJPQBbPEC5ga4LD04OZ50ftztgM3VCCd
         UelA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gfxstrand-net.20251104.gappssmtp.com; s=20251104; t=1792447716; x=1793052516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        b=N9zeIVwB1clL+fRwySxbbV/Svy9l9zY0ix5Y1MArr1peYRxxuTvkQ3gvvFE6EQyD+2
         zvUPw5WMJV0xI7BCcGrSzMt/VUPHQoRRKFoKY9wZnv3X+omb/yn96nIqjnnX+u11yJyh
         axlwWy769OxuH5xfpgckZgZ6yU+Zj+81EkLSyCdDumlFfVvu//eSSFvzOsNdZBum3nea
         5jPcOuhQAsn45Dlj+fOrQ/I1dZNxydUHATEBhi7aqZb4JafcYf+sGkt39QlR7VrzQu/d
         tNK10ZlU8x47Fqvo3Oz/Vw4PXVPNySmw7UlXCcOVvaIvmyBUjCLGEkYPFj2iWxI7YCDn
         skwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447716; x=1793052516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        b=0ncK3DIXmz4iEBcmSchN6R+2tadtI3keUEB2vNIa4j2GPvUNCawftb9x1vttHo7z8D
         wt6NR/sEs2ASDJt6KWyfy4Lw6CZD5TXbIM1QeqMpqI75ml2z1eQp4WvN6sw7K0vwjz4E
         Y/CRdAar3PJVQ+6yZH5dafg7ANVhVgLDDRzX6T28vkoa6U5qkgGjEUf4fnXv1QNJnmpD
         1TMluH3xoXcrfdj/Fi3AkQ5ITKMNuAJotxE05GNS7VneKlcXEUoIu9Vaa7TbUio3Z0fK
         mDvnqVUcvbOiG9cal2hEB6X6408tT1CYBMTzkgJnXzqVEszDe84Bg4BGnl7dauEAqUiP
         WfHg==
X-Forwarded-Encrypted: i=1; AKwUvBw8gPnXnLOvNP1xarf5LbV5t36w8AzzfTEaWB41inn8S9Wd5BT/cXU3Ooo5K4xb2O9WYR33EIt+fw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJAtkj02Xg9pgj599K0emYUCEwqFFXLQxIg4W1n1h//ummL/Ezd
	z8wA0yK3543G1is63gE0ZVEAsL8CeeN5mQfmPaqbascouwsqbVg+4nahh32AG2B1YjCouMulFBy
	6mFNZ+xBS/uX8CsvMrYRDxAYm3/NYirZK6Zto61GBFw==
X-Gm-Gg: AYBFou1CUdu6DHKV24bXBlfQ53KCTzQ+kjDEJf8G++2MDLbpZkvQGC+oiMjekRPaZqM
	LEBvj8kbyH16p2p81oBX6dwME8hRqlPjLsQ1awdmG6vZadVLS6UJGkvZL9iBUWv9+WdbPzGI85Z
	l64tLwgYsiPK3clN9ih8ftDTzU9C9v9PgkOul2WsdE/+kqS44HfQsxOYyzabsnfDUqQFaxTAidM
	v5mQXEeVFr1MTFBr4qE1R6bjCe/r5Xk9vaVZOx/JD8TKzZ07y5u17+Txrc89LGr7H3Ga5GOwJw+
	BSDxjtAuJ1IapPBzxaA85RC5LJ6nh3mcXasWQyrOPTlP/BzOvSbW
X-Received: by 2002:a05:7022:f512:b0:16b:fa6d:b11f with SMTP id
 a92af1059eb24-1850ce9b5a2mr12535516c88.6.1792447716400; Mon, 19 Oct 2026
 15:08:36 -0700 (PDT)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019212535.88390-1-dakr@kernel.org> <20261019212535.88390-2-dakr@kernel.org>
In-Reply-To: <20261019212535.88390-2-dakr@kernel.org>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 19 Oct 2026 18:08:24 -0400
X-Gm-Features: AclHuK-qE8LmEGdwibwHGL6oFYAXR5b0DqizYeAXVyUgVX--Coo1a8MpQKVbO6Q
Message-ID: <CAOFGe95z69uc802-DWwhBqED9VB9ZSts2GL3UZ93frgOHc0akQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nova: mark the uAPI header as unstable
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, jhubbard@nvidia.com, apopple@nvidia.com, 
	ecourtney@nvidia.com, lyude@redhat.com, kherbst@redhat.com, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The header already documents that its uAPI is unstable and intended for
> development. It may change incompatibly as it is developed upstream.
> Rename it to nova_drm_unstable.h and move it out of include/uapi/ to
> make this more explicit.
>
> As individual interfaces become stable, move them to
> include/uapi/drm/nova_drm.h.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>

> ---
>  drivers/gpu/drm/nova/nova_drm_unstable.h | 212 +++++++++++++++++++++++
>  include/uapi/drm/nova_drm.h              | 204 +---------------------
>  rust/uapi/uapi_helper.h                  |   2 +
>  3 files changed, 217 insertions(+), 201 deletions(-)
>  create mode 100644 drivers/gpu/drm/nova/nova_drm_unstable.h
>
> diff --git a/drivers/gpu/drm/nova/nova_drm_unstable.h b/drivers/gpu/drm/n=
ova/nova_drm_unstable.h
> new file mode 100644
> index 000000000000..3577dede15a6
> --- /dev/null
> +++ b/drivers/gpu/drm/nova/nova_drm_unstable.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __NOVA_DRM_UNSTABLE_H__
> +#define __NOVA_DRM_UNSTABLE_H__
> +
> +#include <drm/drm.h>
> +
> +/* DISCLAIMER: Do not use, this is not a stable uAPI.
> + *
> + * This uAPI serves only testing purposes as long as this driver is stil=
l in
> + * development. It is required to implement and test infrastructure whic=
h is
> + * upstreamed in the context of this driver. See also [1].
> + *
> + * The uAPI in this file may change incompatibly. Stable interfaces shou=
ld
> + * be moved to include/uapi/drm/nova_drm.h.
> + *
> + * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/
> + */
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * enum drm_nova_architecture - GPU architecture identifier
> + */
> +enum drm_nova_architecture {
> +       NOVA_DRM_ARCHITECTURE_TURING            =3D 0x16,
> +       NOVA_DRM_ARCHITECTURE_AMPERE            =3D 0x17,
> +       NOVA_DRM_ARCHITECTURE_HOPPER            =3D 0x18,
> +       NOVA_DRM_ARCHITECTURE_ADA               =3D 0x19,
> +       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB10X   =3D 0x1a,
> +       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB20X   =3D 0x1b,
> +};
> +
> +/**
> + * enum drm_nova_chipid - opaque GPU chip identifier
> + *
> + * These values identify the chip a GPU is based on. They are otherwise
> + * opaque: userspace must not assume the values carry any particular mea=
ning
> + * or encoding, only that they may be compared against this enum.
> + */
> +enum drm_nova_chipid {
> +       /* Turing */
> +       NOVA_DRM_CHIPID_TU102                   =3D 0x162,
> +       NOVA_DRM_CHIPID_TU104                   =3D 0x164,
> +       NOVA_DRM_CHIPID_TU106                   =3D 0x166,
> +       NOVA_DRM_CHIPID_TU117                   =3D 0x167,
> +       NOVA_DRM_CHIPID_TU116                   =3D 0x168,
> +       /* Ampere */
> +       NOVA_DRM_CHIPID_GA100                   =3D 0x170,
> +       NOVA_DRM_CHIPID_GA102                   =3D 0x172,
> +       NOVA_DRM_CHIPID_GA103                   =3D 0x173,
> +       NOVA_DRM_CHIPID_GA104                   =3D 0x174,
> +       NOVA_DRM_CHIPID_GA106                   =3D 0x176,
> +       NOVA_DRM_CHIPID_GA107                   =3D 0x177,
> +       /* Hopper */
> +       NOVA_DRM_CHIPID_GH100                   =3D 0x180,
> +       /* Ada */
> +       NOVA_DRM_CHIPID_AD102                   =3D 0x192,
> +       NOVA_DRM_CHIPID_AD103                   =3D 0x193,
> +       NOVA_DRM_CHIPID_AD104                   =3D 0x194,
> +       NOVA_DRM_CHIPID_AD106                   =3D 0x196,
> +       NOVA_DRM_CHIPID_AD107                   =3D 0x197,
> +       /* Blackwell GB10x */
> +       NOVA_DRM_CHIPID_GB100                   =3D 0x1a0,
> +       NOVA_DRM_CHIPID_GB102                   =3D 0x1a2,
> +       /* Blackwell GB20x */
> +       NOVA_DRM_CHIPID_GB202                   =3D 0x1b2,
> +       NOVA_DRM_CHIPID_GB203                   =3D 0x1b3,
> +       NOVA_DRM_CHIPID_GB205                   =3D 0x1b5,
> +       NOVA_DRM_CHIPID_GB206                   =3D 0x1b6,
> +       NOVA_DRM_CHIPID_GB207                   =3D 0x1b7,
> +};
> +
> +/**
> + * struct drm_nova_gem_create - create a new DRM GEM object
> + */
> +struct drm_nova_gem_create {
> +       /**
> +        * @handle: The handle of the new DRM GEM object.
> +        */
> +       __u32 handle;
> +
> +       /**
> +        * @pad: 32 bit padding, should be 0.
> +        */
> +       __u32 pad;
> +
> +       /**
> +        * @size: The size of the new DRM GEM object.
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_nova_gem_info - query DRM GEM object metadata
> + */
> +struct drm_nova_gem_info {
> +       /**
> +        * @handle: The handle of the DRM GEM object to query.
> +        */
> +       __u32 handle;
> +
> +       /**
> +        * @pad: 32 bit padding, should be 0.
> +        */
> +       __u32 pad;
> +
> +       /**
> +        * @size: The size of the DRM GEM object.
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_nova_info - query device information
> + */
> +struct drm_nova_info {
> +       /**
> +        * @id: The identifier of the information to query.
> +        */
> +       __u32 id;
> +
> +       /**
> +        * @size: The amount of space allocated by userspace at @data. Th=
e kernel
> +        * will return the number of bytes it wrote, or the size of the q=
ueried
> +        * information structure if @data is NULL.
> +        */
> +       __u32 size;
> +
> +       /**
> +        * @data: Pointer to the userspace buffer into which the queried
> +        * information will be written. May be NULL, in which case nothin=
g is
> +        * written and @size is set to the size of the information struct=
ure so
> +        * userspace can allocate a suitably sized buffer.
> +        */
> +       __u64 data;
> +};
> +
> +/**
> + * DRM_NOVA_INFO_GPU
> + *
> + * Query GPU information. The result is returned in a
> + * &struct drm_nova_info_gpu.
> + */
> +#define DRM_NOVA_INFO_GPU              0x00
> +
> +/**
> + * struct drm_nova_info_gpu - GPU information
> + */
> +struct drm_nova_info_gpu {
> +       /**
> +        * @architecture: GPU architecture identifier.
> +        *
> +        * See &enum drm_nova_architecture for currently known architectu=
res.
> +        */
> +       __u32 architecture;
> +
> +       /**
> +        * @chipid: Opaque GPU chip identifier.
> +        *
> +        * See &enum drm_nova_chipid for currently known chips.
> +        */
> +       __u32 chipid;
> +
> +       /**
> +        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> +        * regions.
> +        */
> +       __u64 vram_size;
> +
> +       /**
> +        * @vram_bar_size: Size of the PCI BAR aperture used to access VR=
AM, in bytes.
> +        */
> +       __u64 vram_bar_size;
> +
> +       /**
> +        * @gpu_name: NUL-terminated full GPU name.
> +        */
> +       __u8 gpu_name[64];
> +
> +       /**
> +        * @gpu_short_name: NUL-terminated short GPU name.
> +        */
> +       __u8 gpu_short_name[64];
> +
> +       /**
> +        * @gpu_gid: 16-byte SHA-1 GPU identifier supplied by GSP-RM.
> +        */
> +       __u8 gpu_gid[16];
> +};
> +
> +#define DRM_NOVA_INFO                  0x00
> +#define DRM_NOVA_GEM_CREATE            0x01
> +#define DRM_NOVA_GEM_INFO              0x02
> +
> +/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> +enum {
> +       DRM_IOCTL_NOVA_INFO             =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_INFO,
> +                                                  struct drm_nova_info),
> +       DRM_IOCTL_NOVA_GEM_CREATE       =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_CREATE,
> +                                                  struct drm_nova_gem_cr=
eate),
> +       DRM_IOCTL_NOVA_GEM_INFO         =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_INFO,
> +                                                  struct drm_nova_gem_in=
fo),
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __NOVA_DRM_UNSTABLE_H__ */
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index d7017ed17143..ad362301e3b1 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -3,207 +3,9 @@
>  #ifndef __NOVA_DRM_H__
>  #define __NOVA_DRM_H__
>
> -#include "drm.h"
> -
> -/* DISCLAIMER: Do not use, this is not a stable uAPI.
> - *
> - * This uAPI serves only testing purposes as long as this driver is stil=
l in
> - * development. It is required to implement and test infrastructure whic=
h is
> - * upstreamed in the context of this driver. See also [1].
> - *
> - * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/=
#u
> - */
> -
> -#if defined(__cplusplus)
> -extern "C" {
> -#endif
> -
> -/**
> - * enum drm_nova_architecture - GPU architecture identifier
> - */
> -enum drm_nova_architecture {
> -       NOVA_DRM_ARCHITECTURE_TURING            =3D 0x16,
> -       NOVA_DRM_ARCHITECTURE_AMPERE            =3D 0x17,
> -       NOVA_DRM_ARCHITECTURE_HOPPER            =3D 0x18,
> -       NOVA_DRM_ARCHITECTURE_ADA               =3D 0x19,
> -       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB10X   =3D 0x1a,
> -       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB20X   =3D 0x1b,
> -};
> -
> -/**
> - * enum drm_nova_chipid - opaque GPU chip identifier
> - *
> - * These values identify the chip a GPU is based on. They are otherwise
> - * opaque: userspace must not assume the values carry any particular mea=
ning
> - * or encoding, only that they may be compared against this enum.
> - */
> -enum drm_nova_chipid {
> -       /* Turing */
> -       NOVA_DRM_CHIPID_TU102                   =3D 0x162,
> -       NOVA_DRM_CHIPID_TU104                   =3D 0x164,
> -       NOVA_DRM_CHIPID_TU106                   =3D 0x166,
> -       NOVA_DRM_CHIPID_TU117                   =3D 0x167,
> -       NOVA_DRM_CHIPID_TU116                   =3D 0x168,
> -       /* Ampere */
> -       NOVA_DRM_CHIPID_GA100                   =3D 0x170,
> -       NOVA_DRM_CHIPID_GA102                   =3D 0x172,
> -       NOVA_DRM_CHIPID_GA103                   =3D 0x173,
> -       NOVA_DRM_CHIPID_GA104                   =3D 0x174,
> -       NOVA_DRM_CHIPID_GA106                   =3D 0x176,
> -       NOVA_DRM_CHIPID_GA107                   =3D 0x177,
> -       /* Hopper */
> -       NOVA_DRM_CHIPID_GH100                   =3D 0x180,
> -       /* Ada */
> -       NOVA_DRM_CHIPID_AD102                   =3D 0x192,
> -       NOVA_DRM_CHIPID_AD103                   =3D 0x193,
> -       NOVA_DRM_CHIPID_AD104                   =3D 0x194,
> -       NOVA_DRM_CHIPID_AD106                   =3D 0x196,
> -       NOVA_DRM_CHIPID_AD107                   =3D 0x197,
> -       /* Blackwell GB10x */
> -       NOVA_DRM_CHIPID_GB100                   =3D 0x1a0,
> -       NOVA_DRM_CHIPID_GB102                   =3D 0x1a2,
> -       /* Blackwell GB20x */
> -       NOVA_DRM_CHIPID_GB202                   =3D 0x1b2,
> -       NOVA_DRM_CHIPID_GB203                   =3D 0x1b3,
> -       NOVA_DRM_CHIPID_GB205                   =3D 0x1b5,
> -       NOVA_DRM_CHIPID_GB206                   =3D 0x1b6,
> -       NOVA_DRM_CHIPID_GB207                   =3D 0x1b7,
> -};
> -
> -/**
> - * struct drm_nova_gem_create - create a new DRM GEM object
> - */
> -struct drm_nova_gem_create {
> -       /**
> -        * @handle: The handle of the new DRM GEM object.
> -        */
> -       __u32 handle;
> -
> -       /**
> -        * @pad: 32 bit padding, should be 0.
> -        */
> -       __u32 pad;
> -
> -       /**
> -        * @size: The size of the new DRM GEM object.
> -        */
> -       __u64 size;
> -};
> -
> -/**
> - * struct drm_nova_gem_info - query DRM GEM object metadata
> - */
> -struct drm_nova_gem_info {
> -       /**
> -        * @handle: The handle of the DRM GEM object to query.
> -        */
> -       __u32 handle;
> -
> -       /**
> -        * @pad: 32 bit padding, should be 0.
> -        */
> -       __u32 pad;
> -
> -       /**
> -        * @size: The size of the DRM GEM obejct.
> -        */
> -       __u64 size;
> -};
> -
> -/**
> - * struct drm_nova_info - query device information
> +/*
> + * Stable Nova uAPI. Interfaces should be moved here from
> + * drivers/gpu/drm/nova/nova_drm_unstable.h as they become stable.
>   */
> -struct drm_nova_info {
> -       /**
> -        * @id: The identifier of the information to query.
> -        */
> -       __u32 id;
> -
> -       /**
> -        * @size: The amount of space allocated by userspace at @data. Th=
e kernel
> -        * will return the number of bytes it wrote, or the size of the q=
ueried
> -        * information structure if @data is NULL.
> -        */
> -       __u32 size;
> -
> -       /**
> -        * @data: Pointer to the userspace buffer into which the queried
> -        * information will be written. May be NULL, in which case nothin=
g is
> -        * written and @size is set to the size of the information struct=
ure so
> -        * userspace can allocate a suitably sized buffer.
> -        */
> -       __u64 data;
> -};
> -
> -/**
> - * DRM_NOVA_INFO_GPU
> - *
> - * Query GPU information. The result is returned in a
> - * &struct drm_nova_info_gpu.
> - */
> -#define DRM_NOVA_INFO_GPU              0x00
> -
> -/**
> - * struct drm_nova_info_gpu - GPU information
> - */
> -struct drm_nova_info_gpu {
> -       /**
> -        * @architecture: GPU architecture identifier.
> -        *
> -        * See &enum drm_nova_architecture for currently known architectu=
res.
> -        */
> -       __u32 architecture;
> -
> -       /**
> -        * @chipid: Opaque GPU chip identifier.
> -        *
> -        * See &enum drm_nova_chipid for currently known chips.
> -        */
> -       __u32 chipid;
> -
> -       /**
> -        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> -        * regions.
> -        */
> -       __u64 vram_size;
> -
> -       /**
> -        * @vram_bar_size: Size of the PCI BAR aperture used to access VR=
AM, in bytes.
> -        */
> -       __u64 vram_bar_size;
> -
> -       /**
> -        * @gpu_name: NUL-terminated full GPU name.
> -        */
> -       __u8 gpu_name[64];
> -
> -       /**
> -        * @gpu_short_name: NUL-terminated short GPU name.
> -        */
> -       __u8 gpu_short_name[64];
> -
> -       /**
> -        * @gpu_gid: 16-byte SHA-1 GPU identifier supplied by GSP-RM.
> -        */
> -       __u8 gpu_gid[16];
> -};
> -
> -#define DRM_NOVA_INFO                  0x00
> -#define DRM_NOVA_GEM_CREATE            0x01
> -#define DRM_NOVA_GEM_INFO              0x02
> -
> -/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> -enum {
> -       DRM_IOCTL_NOVA_INFO             =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_INFO,
> -                                                  struct drm_nova_info),
> -       DRM_IOCTL_NOVA_GEM_CREATE       =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_CREATE,
> -                                                  struct drm_nova_gem_cr=
eate),
> -       DRM_IOCTL_NOVA_GEM_INFO         =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_INFO,
> -                                                  struct drm_nova_gem_in=
fo),
> -};
> -
> -#if defined(__cplusplus)
> -}
> -#endif
>
>  #endif /* __NOVA_DRM_H__ */
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 489748ef642c..44fb6203c0ad 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -6,6 +6,8 @@
>   * Sorted alphabetically.
>   */
>
> +#include "../../drivers/gpu/drm/nova/nova_drm_unstable.h"
> +
>  #include <uapi/drm/drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
> --
> 2.56.0
>
