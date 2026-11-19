Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053134;
	b=zdY0U2Ibeu6ZVvpMrjR3o+vcFexUxbVqXcZIQw04T+4ybiL0UU8oN6ic+at3GOW2slm5
	 iJsisICGxnhb0By7CJCX6lRc+7szZmaF22gHZoNyeYE+jbME5iZBFTa+Oruuxm1GMQ/A3
	 J9pHMPKMoMPPLRrE1IvmJYzH2AqNoX/Seoha5Obh8uScuhUTiv4ZqAM1DdI6l51PbHbC2
	 sou9pu6GgtxH3S2jyoXfpvxivTxk9KgydPkts90kT4Tuf0CfhKh4KRmtLhbnpCvlAakdG
	 fYRQs+c+bwmHC7PFxWmSfxT0U4hn4x0lzo2SPgSMAhG+Jgo5uKkVJOy06dwAidkjUxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053134;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GDOheIw0XyESHKUJmb3R4hfMiS0jbOtm8JRApTUjWVc=;
	b=yR668iUdOD/ppmgqSiY47f0g4eD76/QBvL5GsU/kgTF0vlDQkETn6ufCMFdcqAvAJMVo
	 nuLGsHx7IxxoUI98fvAovouf//LO1Lg8u9yONMiDysM6G5qHf8jDqpKkt7tyWybeVMkze
	 rNEfQO5wDPc/6EC8QUlMfLh/aBdBhrGPSFoV1yT89QLj6/hMtfZ84s2A6ZaNRGhtCmCsa
	 ol3urZg7MJOCpm7dr/YV/KIqXzDWOpaVla2ijCbeJw97/sOe8hWLSCCDuNDQFK/7RBaDF
	 Nnpe9TRcFRkQZCtaQx0opDcRMIMEp1mrbUz8xfnU0PFHp5JLB7Rpf3VnmRqVz7Il3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG2XcNvz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAC5606A32F
	for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 01:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XG2XcNvz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218071F000C5;
	Thu, 19 Nov 2026 01:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795053134;
	bh=GDOheIw0XyESHKUJmb3R4hfMiS0jbOtm8JRApTUjWVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XG2XcNvzg/I/qPEHulzMBfCeTM4wOYHuWOz4Te2RjIwIt2muKsNZcmgf05+kM7mjG
	 HslV9yNwIha7iGIAsTxaZNMBin1NYZrPSs22VOiO+JH6BlIRpNd3tX8GO13cHW9dxW
	 ZCx8LS7ByKlrP6k9d2VHSQa/C2FzcE/Wketsq5UMaZDZlHVx917VMQBZrowRnqhZ6W
	 fc+lIHBOwSW8LkR/vErDNQdrsGl7uqHvHRZbXHT7kEdSQtwriPCGIjFs6FqibmpGsD
	 47OmONbSo0WTyg9YA6ZrFySxsmcXM5dj7xDUbSKvGljXPPUg8RIfZNbWDLKU+dhU0r
	 Pln2U88glzXkA==
Message-ID: <sashiko-outbox-222304@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261119-nova-nouveau-gsp-v1-1-4cde2bc41132@redhat.com>
References: <20261119-nova-nouveau-gsp-v1-0-4cde2bc41132@redhat.com>
 <20261119-nova-nouveau-gsp-v1-1-4cde2bc41132@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 01:52:13 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/nouveau: resource leak and stale list entry in
  nvkm_device_ctor()
--

commit 2b74a622d800f1d2cd12ecd10013a3d94e2a156e
Author: Dave Airlie <airlied@redhat.com>

drm/nouveau: add option to leave GSP-capable GPUs to other drivers

This commit adds a DRM_NOUVEAU_BIND_GSP Kconfig option and a bind_gsp
module parameter to let nouveau skip GSP-capable (Turing and later) PCI
GPUs so other drivers such as nova-core can claim them.

> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/base.c
> index a2ed8c4fe52a0..a027860fa8694 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
[ ... ]
> @@ -3381,6 +3381,20 @@ nvkm_device_ctor(const struct nvkm_device_func *fu=
nc,
>  		goto done;
>  	}
> =20
> +	/* Unless nouveau is the default NVIDIA driver, leave GSP-capable
> +	 * (Turing and later) PCI GPUs to other drivers, such as nova-core.
> +	 * Older GPUs are always bound.
> +	 *
> +	 * Reject before subdevs are constructed, as that would already load
> +	 * GSP firmware for GPUs that are not going to be used.
> +	 */
> +	if (device->func->pci && device->card_type >=3D TU100 && !bind_gsp) {
> +		nvdev_info(device, "leaving GSP-capable GPU to other drivers "
> +			   "(bind_gsp=3D0)\n");
> +		ret =3D -ENODEV;
> +		goto done;
> +	}
> +
>  	/* read strapping information */
>  	strap =3D nvkm_rd32(device, 0x101000);

[Severity: High]
Does rejecting a GPU here leak pdev, leave pci_dev enabled, and leave a
freed or stale entry on nv_devices?

Before reaching this check, nvkm_device_pci_new() calls
pci_enable_device() and allocates pdev, and nvkm_device_ctor() adds
&device->head to the global nv_devices list:

drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:nvkm_device_ctor() {
    ...
	list_add_tail(&device->head, &nv_devices);
    ...
done:
	if (ret && device->pri) {
		iounmap(device->pri);
		device->pri =3D NULL;
	}
	mutex_unlock(&nv_devices_mutex);
	return ret;
}

When nvkm_device_ctor() returns -ENODEV, the done label only unmaps
device->pri, and nvkm_device_pci_new() and nouveau_drm_probe() return
ret immediately without unlinking device->head from nv_devices, calling
pci_disable_device(), or freeing pdev.  This leaves the PCI device's
enable_cnt elevated when handing off to another driver and causes any
later nouveau probe of the same device handle to fail with -EEXIST.
(Note that calling nvkm_device_del() directly on this failure path would
also hit an uninitialized device->intr.intr list in nvkm_intr_dtor(),
since nvkm_intr_ctor() has not run yet.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-nova-nouve=
au-gsp-v1-0-4cde2bc41132@redhat.com?part=3D1
