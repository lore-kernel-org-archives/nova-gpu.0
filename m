Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EE4323416;
	Sat, 25 Jul 2026 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993018; cv=none; b=LBlJXkmktraLomyCO9wPjnbZHw1Hdo1Xg6UJ/gfaISyROpssIPXorPcV99iTfQRmwQ5T/MoAKKwHqIBHYBW2PTWnxzA3eZt0qSbAJnXAMZTapdQ55pPPnVZC48+KKfrD7Xk4npsVsGPvZRN37X16TTQ0dcul+14fG8DEoC64cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993018; c=relaxed/simple;
	bh=ZcgzwgMiJtFKlLzJ6HrXkRjKlHdZhWd3PC2Aq3orTa4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=flLuzyNM950L7X+IshLFExSRYlKpxYXJ+DQCzhc9T6pd6iqfp1xUKwCeJhswGa0ulicDNtSW2pT57JuakVGVfvCC37G1ZiVdov0EJFJvBHg/aPxEzo74Q1AKnNYoFRQJqHSOhHcUpb8klrwv1LQw0vBBhDE4R4ur/rQfSz6bA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHuD8L+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHuD8L+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB611F000E9;
	Sat, 25 Jul 2026 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993015;
	bh=CJA8AnR7IyOSaYTKRrEPye1/I9BoP9b2B7+UX5L96zc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=AHuD8L+nrVv7cwi+/uowvZKQrfIAPqOFDErney/lCl8ITTfFrXm/eioyZpvknxKIB
	 gR9ymLfYak9p0CvTtgAtznPom4VazOLPcnrz0gpoZOckDMoKVuFcmZxXQkZPbNuLD+
	 2HNig/fWasqU3g88S9otx6iQLtQIT88N8/GRr/Gq969Kzip+cDan46zC8mot2Gj5DD
	 XtL/QfpVpcqxPUXnimwxtyik2Mypcy3aFcGMFW1mWXVpDfrGEde5DkjpB5odyvLTNK
	 LjQ8RISmEqfbQmPTgYfpRR40qlHw82nD7khBquv32fT4NleyLXRv0DJVSmcH9SI49Y
	 UUv5gHQAQPObw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 17:23:32 +0200
Message-Id: <DK7R7PB91GUE.1PS77AQM8ZR99@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 3/7] drm: nova: Add chipid enum to nova-drm UAPI
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20260723063046.1265791-1-apopple@nvidia.com>
 <20260723063046.1265791-4-apopple@nvidia.com>
In-Reply-To: <20260723063046.1265791-4-apopple@nvidia.com>

On Thu Jul 23, 2026 at 8:30 AM CEST, Alistair Popple wrote:
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index 3ca90ed9d2bb..cb13fba6b952 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -25,6 +25,39 @@ extern "C" {
>   */
>  #define NOVA_GETPARAM_VRAM_BAR_SIZE	0x1
> =20
> +enum drm_nova_chipid {

It seems trivial, but let's add at least some documentation.

For instance, what's valid for userspace to extract from this? Given chipid=
 is a
composed value, is userspace e.g. allowed to make assumptions on extracting=
 the
architecture? Or is this something we want to expose separately and tell
userspace that the chipid is an opaque value identifying a specific chip on=
ly?

> +	/* Turing */
> +	NOVA_DRM_CHIPID_TU102 =3D 0x162,
> +	NOVA_DRM_CHIPID_TU104 =3D 0x164,
> +	NOVA_DRM_CHIPID_TU106 =3D 0x166,
> +	NOVA_DRM_CHIPID_TU117 =3D 0x167,
> +	NOVA_DRM_CHIPID_TU116 =3D 0x168,
> +	/* Ampere */
> +	NOVA_DRM_CHIPID_GA100 =3D 0x170,
> +	NOVA_DRM_CHIPID_GA102 =3D 0x172,
> +	NOVA_DRM_CHIPID_GA103 =3D 0x173,
> +	NOVA_DRM_CHIPID_GA104 =3D 0x174,
> +	NOVA_DRM_CHIPID_GA106 =3D 0x176,
> +	NOVA_DRM_CHIPID_GA107 =3D 0x177,
> +	/* Hopper */
> +	NOVA_DRM_CHIPID_GH100 =3D 0x180,
> +	/* Ada */
> +	NOVA_DRM_CHIPID_AD102 =3D 0x192,
> +	NOVA_DRM_CHIPID_AD103 =3D 0x193,
> +	NOVA_DRM_CHIPID_AD104 =3D 0x194,
> +	NOVA_DRM_CHIPID_AD106 =3D 0x196,
> +	NOVA_DRM_CHIPID_AD107 =3D 0x197,
> +	/* Blackwell GB10x */
> +	NOVA_DRM_CHIPID_GB100 =3D 0x1a0,
> +	NOVA_DRM_CHIPID_GB102 =3D 0x1a2,
> +	/* Blackwell GB20x */
> +	NOVA_DRM_CHIPID_GB202 =3D 0x1b2,
> +	NOVA_DRM_CHIPID_GB203 =3D 0x1b3,
> +	NOVA_DRM_CHIPID_GB205 =3D 0x1b5,
> +	NOVA_DRM_CHIPID_GB206 =3D 0x1b6,
> +	NOVA_DRM_CHIPID_GB207 =3D 0x1b7,
> +};
