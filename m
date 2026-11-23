Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441648;
	b=geOKYpOwr3qmcb/tz1ub0wk7RBPMZMuUJG6A/Cr1t6jbB43gH0JfKq4ezGLFZQSB4Tf5
	 iFTyhFJPgwDYFoFNrvkZG+zS3FVjURtjGrV+zA83iwJM2wjtFluEesJTXQc++GIxLk13G
	 LnoSdDDG9oywRQIsgDht7q4O4S6eFEJCmurzO2pfhNug5XS3jwTJRJYtTDuRlUi/6vmrt
	 BBbvlH1M1rB3eMnWnrylD7EFmQNM3+yj8M0EnmRvjwkpnxxI4dZaLIEp/RDwdejMucVJe
	 CmuF9OTus6aXhD8B3+AGuTM+jetTFqmBO/F2p3HlCNcoo8ll8yBS9H893opty8VLG+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441648;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=h1J6ES90Ui+125Ezoufs+mkbEvU0WCcZ9YzsdwLAzoE=;
	b=fs7JZOngnYhTeBEEYHYSGEE8lCv9qYJndx75r4l0yz04l6jjBxyHe1oJ7xRlYBDK9cI0
	 dwGLGAQUpRAIHui3ghjvX5UF8yVGFx47G2MSxNqZnRBmP5PxZJwtNtKXbziZ4wHSC5yFL
	 0iFz8tobLVwWaiM4FlMBC537b8EOMFJ1mWNUCC+SY/DCoCgZqdpNvIZGXjaQ61iv/NpFy
	 KVltW5bIXDL/SIplqhev62UYAtF3yNL+BccSMwuGCUTJY7giQqDiGTJtp/UwH2ust3tHt
	 mLohQbk8KD/vBU3nP5yHy4FMpnZgkIZg4lMM169AQuEhcc5HDwL7wN3djcwQlULWQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmW1vQ9Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E8606A31A;
	Mon, 23 Nov 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmW1vQ9Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12091F000CA;
	Mon, 23 Nov 2026 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441647;
	bh=h1J6ES90Ui+125Ezoufs+mkbEvU0WCcZ9YzsdwLAzoE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=MmW1vQ9Q4pdQkjWW9lb+wCVb4gcyLaNlXdoA10AwwnUA67osPbBz5DOAhtYckaaxC
	 RV4rKalLyusYVtFXAn4DAWC9OybQy3gAKdLtYIL9Z3UuAO+uh416ST5n2sW0hgk/q2
	 V3ToKN4LssUKS03V3P8EXALS0bVUZrehPE/S3Q1fOE5eKqhiszSm4xePw+NHZx4B1d
	 sDAJ7Bl9kD8Ryi0+VV0YYzN8JNKPFBXMQu6I5hLTiLFMJUP9PGSCLWBBM0chgzRUbt
	 AAhMGDdSqzX0PM5ot5nM24kRiO2rkk5NcYZMef79+mWndVBgdi4COftMokBPeDr31L
	 jOwxzg1HHITaw==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:47:24 +0100
Message-Id: <DN2MY0QDBWUK.2F9NT145RIG9B@kernel.org>
Subject: Re: [PATCH v2 1/3] drm/nouveau/nvkm: fix device leak on ctor
 failure
Cc: <sashiko-reviews@lists.linux.dev>, "Dave Airlie" <airlied@redhat.com>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
To: <sashiko-bot@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-1-5e8c27aa8555@redhat.com>
 <sashiko-outbox-228586@kernel.org>
In-Reply-To: <sashiko-outbox-228586@kernel.org>

On Mon Nov 23, 2026 at 4:14 AM CET, sashiko-bot wrote:
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/device/base.c
>> index a2ed8c4fe52a0..625bb019736af 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
>> @@ -3152,10 +3152,19 @@ nvkm_device_ctor(const struct nvkm_device_func *=
func,
>>  	unsigned chipset;
>> =20
>>  	mutex_lock(&nv_devices_mutex);
>> +
>> +	/* Set up the state that nvkm_device_del() relies on before anything
>> +	 * that can fail, so that a device whose construction failed can be
>> +	 * cleaned up by the caller with nvkm_device_del().
>> +	 */
>> +	device->func =3D func;
>> +	INIT_LIST_HEAD(&device->head);
>> +	INIT_LIST_HEAD(&device->subdev);
>> +	nvkm_intr_ctor(device);
>> +
>>  	if (nvkm_device_find_locked(handle))
>>  		goto done;
>> =20
>> -	device->func =3D func;
>>  	device->quirk =3D quirk;
>>  	device->dev =3D dev;
>
> [Severity: Medium]
> Should device->dev =3D dev also be set before nvkm_device_find_locked()?
>
> If nvkm_device_find_locked() returns an existing device on Tegra,
> nvkm_device_tegra_new() now calls nvkm_device_del(), which runs
> nvkm_device_tegra_dtor() -> nvkm_device_tegra_remove_iommu():
>
> drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:nvkm_device_tegra_remo=
ve_iommu() {
> 	if (tdev->iommu.domain) {
> 		nvkm_mm_fini(&tdev->iommu.mm);
> 		iommu_detach_device(tdev->iommu.domain, tdev->device.dev);
> 		iommu_domain_free(tdev->iommu.domain);
> 	}
> }
>
> Because nvkm_device_tegra_probe_iommu() has already attached
> tdev->iommu.domain before calling nvkm_device_ctor(), leaving
> tdev->device.dev as NULL causes a NULL pointer dereference inside
> iommu_detach_device().

I think Sashiko is right about this, but having an API contract that relies=
 on a
struct being partially initialized on failure isn't great at all.

I think nvkm_device_tegra_remove_iommu() should just not rely on struct
nvkm_device being initialized. struct nvkm_device_tegra already stores stru=
ct
platform_device, so I think we can just use &tdev->pdev.dev in
nvkm_device_tegra_remove_iommu().

More generally, can't we keep the semantics of nvkm_device_ctor() to clean =
up
after itself and not guarantee partial initialization to reuse
nvkm_device_del()?
