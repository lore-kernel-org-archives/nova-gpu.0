Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403657;
	b=hai9jZTgPiN6Gn6mU3mQknMbdcGs9w1vGXqwPGZtIs+TMe19tQMY0GAKRctQhhONgRZH
	 HNJr6PTZPy8XpJGyO7x2WTX1T8d7SED4XibXKTV4XeQlYFGIE80wxx/tmXHQnaMlS6p7F
	 WMO1Dgy1yWaUFLhHlVWHOSFV4jYULVeSMHtFBPEzCupLGXmCujM26MeWGpOT4k+nkbNIE
	 BBKa0E49ismUZhRBC8FCSs4RqZxpYlpyEo+e48C5bIuQeYreTBzWsEOK55UdREHmuRyQC
	 J9RdhLeP+GrMmrp8OHOV8FXERy37oQ59Q9uAonkWd/J9mwyrrbibNLaxVAjOASzhmag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403657;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F18jJBiugrFWz5QsBQAFMKZkjEyXbl946fOrf6JPf/w=;
	b=YSM9byuIOwqzYtfmhs2Lrkxg1XtMeXBlKgwoiPB07q37c5rK9STuI0tvZ40As7Ti+zoE
	 2I6AUq4tyBhUVrSxDHOq00fZVYra3NxF9hdLrObbYDSFyEEFDe2+xgcMY2tM+1lYtS5xh
	 iMCrOAgJP4vXhNV+ryvhr3FT5H2c5fGxJ5tQFGaX8AXwcmL8fSQoWloe2o6gWERK66mHa
	 DLQndl1y//3PdvsdEQYfzYloJ7VY1ph5mntAo7Uvb1Q3a6eRshAL5dh8L1Acxqit6Y8DS
	 Qf+Gb6+wyTO3n83GitbbGhARk7akONJPekTOVQen2/AaZ7NARa/l9e2GoPv5M6CVMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdPJw5kT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F0606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 03:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdPJw5kT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFC1F000C0;
	Mon, 23 Nov 2026 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795403657;
	bh=F18jJBiugrFWz5QsBQAFMKZkjEyXbl946fOrf6JPf/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QdPJw5kTBAjWRahyRBVBudVNVsZjdjPmVWxMHaG4KLZnR2o+TkbQ6b7K21/Mpfctd
	 h7ubBo0AoO7khX8ikhVAQaUaa05LKBr08EXdUCxHqph7Q6LBk6WO0aNO2hAEcynNoy
	 t6tnG8WkTlsh5NoEZUtjbFVx7jxd99snkuMiJ4lsVcrLC62atafoESFa4D13bQciBG
	 gal2xx2Mx8gJFUiYZsjJeFeJagHMsLya7NNEntoFGNItPEZ/RYRG3b74L5sLIuZLBs
	 zfpmD8NSsI07s4nvX1XadOcs0pkPXpVQDZrdbkla6uDu+uV11ooZx6KOha7mlkjy35
	 NmApgyf9/V9gA==
Message-ID: <sashiko-outbox-228586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/nvkm: fix device leak on ctor
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261123-nova-nouveau-gsp-v2-1-5e8c27aa8555@redhat.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-1-5e8c27aa8555@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 03:14:16 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/nouveau/nvkm: missing Signed-off-by trailer in commit
  message
- [Medium] drm/nouveau/nvkm: NULL deref in nvkm_devinit_dtor() after
  ctor iounmap()
- [Medium] drm/nouveau/nvkm: NULL device->dev in nvkm_device_del() on
  ctor failure
- [Low] drm/nouveau/nvkm: Fixes trailer cites unrelated commit
  0d5dd3f301bb
--

commit 9d8c7debf78767e0a5b65084a841f14aa7a58bd6
Author: Dave Airlie <airlied@redhat.com>

> drm/nouveau/nvkm: fix device leak on ctor failure
>=20
> When adding a new failure path from device_ctor, the missing
> clean up paths in the current code were uncovered.
>=20
> The device_del path doesn't work because it relies on initialisation
> that hadn't been done yet.
>=20
> This patch cleans up the failure paths and initialises the
> things needed for the nvkm_device_del path to work.
>=20
> Fixes: 0d5dd3f301bb ("drm/nouveau/lib: various tweaks")

[Severity: High]
The commit message is missing a Signed-off-by: trailer.

[Severity: Low]
Does the Fixes: tag point to the right commit?  0d5dd3f301bb
("drm/nouveau/lib: various tweaks") only changed list_add() to
list_add_tail() in nvkm_device_create_().  The split into
nvkm_device_ctor(), nvkm_device_pci_new(), and nvkm_device_tegra_new()
where ctor failure paths skipped nvkm_device_del() was introduced in
7974dd1bdb43 ("drm/nouveau/device: separate construction of pci/tegra
devices").

> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/base.c
> index a2ed8c4fe52a0..625bb019736af 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -3152,10 +3152,19 @@ nvkm_device_ctor(const struct nvkm_device_func *f=
unc,
>  	unsigned chipset;
> =20
>  	mutex_lock(&nv_devices_mutex);
> +
> +	/* Set up the state that nvkm_device_del() relies on before anything
> +	 * that can fail, so that a device whose construction failed can be
> +	 * cleaned up by the caller with nvkm_device_del().
> +	 */
> +	device->func =3D func;
> +	INIT_LIST_HEAD(&device->head);
> +	INIT_LIST_HEAD(&device->subdev);
> +	nvkm_intr_ctor(device);
> +
>  	if (nvkm_device_find_locked(handle))
>  		goto done;
> =20
> -	device->func =3D func;
>  	device->quirk =3D quirk;
>  	device->dev =3D dev;

[Severity: Medium]
Should device->dev =3D dev also be set before nvkm_device_find_locked()?

If nvkm_device_find_locked() returns an existing device on Tegra,
nvkm_device_tegra_new() now calls nvkm_device_del(), which runs
nvkm_device_tegra_dtor() -> nvkm_device_tegra_remove_iommu():

drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:nvkm_device_tegra_remove=
_iommu() {
	if (tdev->iommu.domain) {
		nvkm_mm_fini(&tdev->iommu.mm);
		iommu_detach_device(tdev->iommu.domain, tdev->device.dev);
		iommu_domain_free(tdev->iommu.domain);
	}
}

Because nvkm_device_tegra_probe_iommu() has already attached
tdev->iommu.domain before calling nvkm_device_ctor(), leaving
tdev->device.dev as NULL causes a NULL pointer dereference inside
iommu_detach_device().

[ ... ]

> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/device/pci.c
> index 248623b91e295..269ccd4b482e9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> @@ -1705,8 +1705,10 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const=
 char *cfg, const char *dbg,
>  				    PCI_FUNC(pci_dev->devfn), name,
>  			       cfg, dbg, &pdev->device);
> =20
> -	if (ret)
> +	if (ret) {
> +		nvkm_device_del(pdevice);
>  		return ret;
> +	}

[Severity: Medium]
Can calling nvkm_device_del() after nvkm_device_ctor() fails cause a NULL
pointer dereference in subdevice destructors?

When nvkm_device_ctor() fails after constructing early subdevices (for
example, if a later subdevice constructor or nvkm_intr_install() fails),
its error path unmaps and clears device->pri before returning:

drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:nvkm_device_ctor() {
	...
done:
	if (ret && device->pri) {
		iounmap(device->pri);
		device->pri =3D NULL;
	}
	mutex_unlock(&nv_devices_mutex);
	return ret;
}

nvkm_device_del() then destroys the already constructed subdevices on
device->subdev.  When it reaches nvkm_devinit_dtor(), nvkm_lockvgac()
attempts MMIO accesses through the NULL device->pri pointer.  Since
nvkm_device_del() already unmaps device->pri after destroying subdevices,
should nvkm_device_ctor() leave device->pri mapped for nvkm_device_del()
to clean up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-nova-nouve=
au-gsp-v2-0-5e8c27aa8555@redhat.com?part=3D1
