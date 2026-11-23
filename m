Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447085;
	b=bx7yWGvme2A4CSBzcUd7QDPWJSRlVaMLA+YNwAdm7MVJuGiZeYAousF26VgwrtOh//ki
	 1DeLNrbduKNXbZt3i1VOXD4gKMPXLow4uc1nqg0gaoWEYVZnKgXWFhQ5+4xxVoDBCMygz
	 nZbrb5Nxhrv40eTVWXhzcXtt0NC4SH634V/mUq09ichV9pwednN3bCgUEcRl1eWcc6ZpJ
	 Nne3mHamNT1hOO3zqCfxwmkHr9keaOQ23X7P/c6fmcmCJJxl+lv/F4bA6wGdgFpDYnmZK
	 s9QMEApggnzBrS/6LyoacKhITdiIg4QF1q602o6uzgrh4wHZ1T88StJjLROjG0qUgeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447085;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=G9iGCdTHVNOkkxwHvzCGEJjHClrkvPwGhrJiFBV6j78=;
	b=LjuVRpXf1mTfVDa5+FY3s/c+0zEaPWFNHMqkisrwqkahLwye2lxvmVRsrrhU4+VUTmy/
	 yH03Qb26oEAl/ASHMmSMvaqTOyLiFeiIHu3CBy9zANsBtbVy0xgu0CXwA2Hf6eUwMlkpj
	 wCnn8RP1SByTpp8artA5AAt3mZ7/rSdMaQdBwMSHxOtQ0QCXOV9Pp+7aAZRhEryJFU8Jf
	 TCzpqe8RRnqB0pr3D0iZu2B0J0cxbvLtMiTebcjwDGWmMb1Skae58ZrzaeVoccBnZQNt/
	 jgXrFAEntb4fgiwkBz2fGqUCzzTn9BecUj6CB7mJ4iQN9Owr9is+3KhCZzXQcSlN0ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDHt02lu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4D606A332
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDHt02lu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4291F000E1;
	Mon, 23 Nov 2026 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447085;
	bh=G9iGCdTHVNOkkxwHvzCGEJjHClrkvPwGhrJiFBV6j78=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=lDHt02luN+rbyNDOYLLt/03CfrnpgtKSdawJ387ZpD1zhJgppetMxKDCQNR9MWcRU
	 NQ2dQLm7yaLAQZpvMfYO3Alwgie/C/s5WRpACna5Ry0XXOlxdkpSLFlJ1dEzZYYSgb
	 SqSG31c0fz4ffvCEmS3QDlbi8JDcgB1kBbKszQqnp+EPQYm3hbQ8+ivnnb0MCkJrPT
	 1CIaiWh+mOaNp7SEFIzQAMD8Gp9N7lknx+X2C63Xe5GSNhPypeq+tkzlxnzgcWm6tG
	 nNFU2heniloMOsQXXcAya8pWJTH59uaHSinm5i25oneaq2cNZm3MB+xRvObhBxs+6w
	 If4KFI0pCP6NQ==
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
Date: Mon, 23 Nov 2026 16:18:02 +0100
Message-Id: <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
Cc: <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
In-Reply-To: <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>

On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
>  	  logs its failure and lets the probe continue.
> =20
>  	  If unsure, say N.
> +
> +config NOVA_CORE_BIND_GSP
> +	bool "Make nova-core the default driver for GSP-capable GPUs"
> +	depends on NOVA_CORE
> +	default n
> +	help
> +	  Make nova-core bind to all NVIDIA GPUs it supports by default.
> +
> +	  By default nova-core does not bind to any GPU and leaves NVIDIA
> +	  GPUs to other drivers, such as nouveau. Say Y here, or boot with
> +	  nova-core.bind_gsp=3D1, to make nova-core claim NVIDIA GPUs
> +	  instead.
> +
> +	  nova-core is work in progress and may not be functional, so this
> +	  is intended for nova developers and testers only. When enabled,
> +	  nouveau must not bind to the same (GSP-capable) GPUs, i.e.
> +	  CONFIG_DRM_NOUVEAU_BIND_GSP=3DN or nouveau.bind_gsp=3D0 is required.
> +	  Otherwise both drivers compete for the same devices and
> +	  whichever is loaded first wins.

I think this is a bit unsatisfying, for the Kconfig at least it would be ni=
ce to
avoid the possibility of being able to configure

	- NOVA_CORE_BIND_GSP=3Dy && DRM_NOUVEAU_BIND_GSP=3Dy

	- NOVA_CORE_BIND_GSP=3Dn && DRM_NOUVEAU_BIND_GSP=3Dn

since I wouldn't consider them valid combinations of Kconfig options.

Maybe something like this:

	config NVIDIA_GSP_DEFAULT_NOVA
	bool "Use Nova by default for GSP-capable NVIDIA GPUs"
	depends on DRM_NOUVEAU !=3D n && NOVA_CORE !=3D n
	default n
	help
	  When both Nouveau and Nova are built, use Nova by default
	  for GSP-capable (Turing and later) NVIDIA GPUs.
	  When only one driver is built, that driver is used by
	  default. Older GPUs use Nouveau.
=09
	  Override this default using the nouveau.bind_gsp and
	  nova-core.bind_gsp module parameters.
=09
	  Nova is work in progress and may not be functional.
	  This option is intended for developers and testers only.
=09
	  If unsure, say N.

I think for the module parameters it is probably fine to not restrict this
ambiguity.

We've also discussed whether we can detect vGPU mode in order to pass GPUs =
with
vGPU mode enabled to nova-core regardless. I think this requires an FSP req=
uest
via EMEM (at least on Blackwell), so it should be possible to implement tha=
t
with the existing infrastructure in nouveau as well, but I'm not convinced =
it's
worth it.

> +	  If unsure, say N.
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index d6bc972d47c7..66208a244cab 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -105,6 +105,19 @@ fn probe<'bound>(
>          dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
> =20
>          try_pin_init!(NovaCore {
> +            // Only bind when explicitly requested through the correspon=
ding
> +            // Kconfig option or module parameter. By default, leave NVI=
DIA
> +            // GPUs to other drivers, such as nouveau.
> +            _: {
> +                if !crate::module_parameters::bind_gsp.value() {
> +                    dev_info!(
> +                        pdev,
> +                        "Not binding to GPU; make nova-core the default =
NVIDIA driver with CONFIG_NOVA_CORE_BIND_GSP=3Dy or nova-core.bind_gsp=3D1\=
n"
> +                    );
> +                    Err(ENODEV)?;

I'd prefer this to be wrapped in an associated function of NovaCoreModule, =
e.g.
NovaCoreModule::check_bind_allowed(). I'd also move it before try_pin_init!=
().
