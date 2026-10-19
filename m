Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445555;
	b=nitrt9rRnWMUoQl3pI3CYthV1MxMNqtyE427ke9t0n37/dFnAkZEYYhBxjhlObq+pj9y
	 UMOs7ajPhzm8gLYAS9iXBHKwCBMmVTPU1EJqCLM6vn/xBFRe3SAkOxBAF6J6LrIF8eq2a
	 pklIacWQn4noZSxZTmGDyvuQMu0X5sYXYMLq97q7d1TNXQPndzyOzZBFzt6eUapDwfjg2
	 tjdOh0tYQ0MZPgNP/u2/l6CPyL9//E/Uh8jJD9csQYVI2MeZRJXsjk39EONc7hdhFefUG
	 COCa713QV828Fc/EpQXHKnjebEzKCc62FNTRplcDZ3ysp6A4i1VyaHlS+xXuQJ40uWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9OcFbVag/FzKGgBjOFYPG6g00PSytS5iMG3sHfxdxl4=;
	b=0V858Xre4/kCqMZbhpJAIA7O4xOws1pR1BgVz+5qcnN229MUE8LPmhT9e8DcPyTBYu9v
	 ErXB3bVo8gXCABE2ut+8aYsWfwl4u5MA4H5kx8uRhoMJrtmXC+qfNCiY6ZzYRNAp4cu7f
	 kWZM/OTPWFakM1rfgiA5V7cWiWCt6ja3qfT0Ea2E31dP6iqAE1yDbhgGO2uF4oKyKaQL5
	 GNSvSWHtOpr3CqB8ikRMO6GtVfyfq21HAWN4wp/hLRdAF2xcLDNYZiNYpm81W2q/dTguP
	 4FeKGLAhobAHD3TZBVl7ndyZ2aeB9cLhnfaXCOoxaIIOdf3ulevB4xhksclaBcUi9uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7VEPr79;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113F606A31D
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7VEPr79
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08FD1F000C4;
	Mon, 19 Oct 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445555;
	bh=9OcFbVag/FzKGgBjOFYPG6g00PSytS5iMG3sHfxdxl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7VEPr79C8yPzgS+1UlyFBjRrITeZB5XxrL0e7a43UHZUsA5+L1f8o37YQ6Tt0UWp
	 PF2lvDwXNjVTMIxq3PapytDS45WcwhBOkQFgfIBEClSiBe/SesSXGMwGC+tVoTmcPF
	 mXeH4oVX7CFrZI2BqYKacVVEmVeYGkZuk6pc0E+MUQ5DbCAj+pRVzthOmjIY7Jzzxa
	 dW6rjOv9IHMq2eS/1c94wD2YJO6A4uQdTn01ucTZrZ3QCSDu6p2OTmk4gYWQxvlfEy
	 LujyVM6winsQThsDw/N3X+Ty7Dl8qmSE+j5aA3szRcIsQag2Sj5u0c9cnxBqElQGem
	 Mh+Lag03VbsWw==
Message-ID: <sashiko-outbox-178261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/nova: require explicit opt-in to unstable uAPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, jhubbard@nvidia.com, apopple@nvidia.com, ecourtney@nvidia.com, lyude@redhat.com, kherbst@redhat.com
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261019212535.88390-4-dakr@kernel.org>
References: <20261019212535.88390-1-dakr@kernel.org>
 <20261019212535.88390-4-dakr@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 21:32:33 +0000
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
- [Low] drm/nova: missing kernel-parameters.txt entry for acknowledge_unsta=
ble_uapi
--

commit 77a1b4c686914a70a5ae235e8e03b1e3542d6c45
Author: Danilo Krummrich <dakr@kernel.org>

drm/nova: require explicit opt-in to unstable uAPI

This commit adds the acknowledge_unstable_uapi module parameter to
nova-drm to require users to explicitly opt in to the unstable uAPI before
enabling the driver, and taints the kernel when enabled.

> diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
> index ba16c74401f8f..2cb62517b2f9b 100644
> --- a/drivers/gpu/drm/nova/Kconfig
> +++ b/drivers/gpu/drm/nova/Kconfig
> @@ -12,6 +12,15 @@ config DRM_NOVA
>  	  Choose this if you want to build the Nova DRM driver for Nvidia
>  	  GSP-based GPUs.
> =20
> -	  This driver is work in progress and may not be functional.
> +	  This driver is under active upstream development and may not be
> +	  functional. Its uAPI is intended to be developed upstream alongside
> +	  the driver and is not yet stable. It may change incompatibly during
> +	  development.
> +
> +	  Loading requires the acknowledge_unstable_uapi=3D1 module parameter, =
or
> +	  nova-drm.acknowledge_unstable_uapi=3D1 on the kernel command line when
> +	  built in.
> +
> +	  Enabling the driver taints the kernel.
> =20
>  	  If M is selected, the module will be called nova-drm.
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> index 1fd454c7e0dfb..ad68f6e1a613b 100644
> --- a/drivers/gpu/drm/nova/nova.rs
> +++ b/drivers/gpu/drm/nova/nova.rs

[ ... ]

> -kernel::module_auxiliary_driver! {
> -    type: NovaDriver,
> +module! {
> +    type: NovaModule,
>      name: "nova-drm",
>      authors: ["Danilo Krummrich"],
>      description: "Nova GPU driver",
>      license: "GPL v2",
> +    params: {
> +        acknowledge_unstable_uapi: bool {
> +            default: false,
> +            description: "Acknowledge that Nova and its uAPI are under a=
ctive upstream development \
> +                          and the uAPI may change incompatibly; enable t=
he driver (taints kernel)",
> +        },
> +    },
> +}
> +
> +#[pin_data]
> +struct NovaModule {
> +    #[pin]
> +    _driver: Registration<auxiliary::Adapter<NovaDriver>>,
> +}
> +
> +impl NovaModule {
> +    fn check_unstable_uapi() -> Result {
> +        pr_warn!("Nova and its uAPI are under active upstream developmen=
t\n");
> +
> +        if !module_parameters::acknowledge_unstable_uapi.value() {
> +            pr_err!("Driver disabled: Nova's uAPI is unstable and may ch=
ange incompatibly\n");
> +            pr_info!("Set nova-drm.acknowledge_unstable_uapi=3D1 to enab=
le (taints kernel)\n");

[Severity: Low]
Since NovaModule defines the acknowledge_unstable_uapi parameter in
drivers/gpu/drm/nova/nova.rs and both DRM_NOVA in
drivers/gpu/drm/nova/Kconfig and NovaModule::check_unstable_uapi()
instruct users to pass nova-drm.acknowledge_unstable_uapi=3D1 on the kernel
command line when built in, should this parameter also be documented in
Documentation/admin-guide/kernel-parameters.txt?

> +            return Err(EPERM);
> +        }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019212535.8839=
0-1-dakr@kernel.org?part=3D3
