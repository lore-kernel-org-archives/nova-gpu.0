Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5042A7B2;
	Mon,  6 Jul 2026 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361822; cv=none; b=Ob8fXUgpmxPyuujnYa+SFzhmck3y+CSbUNDIWYeY1yEDAA7d6E5ZcsGnOl4wCd7pjSWN8X5M2S+e0gl16HXz/b7J5BVxtiQt07ppvSwUdFAgUpSoWKqvQr6aeM6SdIO6XHFyYMYinGtJqkzwriezt+Yq0Acxx62CLYKdY73IKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361822; c=relaxed/simple;
	bh=2kmvbpxMC0iGGpNhD67RXoVBmEqtuqUNzJ4U1fSzVes=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XdSvkRFkKKABWP9bSz19AHM6/3F3s+bdOBxMpisAlzQ1xwV4YAV8pcckv8Lmwdq0bWzL6opfrMWyDR5EJHLWb8tF4u4SnFMU5mucwl0++5czj3LMj3WZpeXX+6BgByscdh99elWaOQpIQmPXYu/91kJcrWoUlWYAEtMjzcSHj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVG5UHda; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVG5UHda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9349F1F000E9;
	Mon,  6 Jul 2026 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783361820;
	bh=93KArN1LqKTGY4T4BrpyuyWZ4ZD/QeNQn4N6asorlBU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ZVG5UHdaMVsLnpvJBAxJU1I8fsdezqMsaLNg/QQWX6K9QgQAThV0CvKIHZN9qC0E+
	 tJQkHnR6YxPN6p1AlkbVK2YaJPTlfa4Kxx8V9/Z3RLBhXuwA1roKSCxCIEWupTQ74E
	 jxY/NjUAWdmsDbx6E18tsA9GuEZrHxYDUKACNWbnySkonegoWO1yh4gFbxnTzyPH2r
	 wzDO7S4utW4j/F/pQM6M4rLjcNJMwDSQnHZo66Amwc3/L404ng/og4vynksNxp4a3+
	 0a9J0UU07X0Uo9abSNpcC5GgO4UFi/Z0+O8XtwWJJdTAWCZOitmZoQWnjff+Uz8BLW
	 fFbtWU8/oud4Q==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 20:16:56 +0200
Message-Id: <DJRP04MWOO7Q.3DD6YF37RS5K2@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/4] drm: nova: Add GETPARAM parameter to read the GPU
 chipset
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20260706053413.154135-1-apopple@nvidia.com>
 <20260706053413.154135-4-apopple@nvidia.com>
In-Reply-To: <20260706053413.154135-4-apopple@nvidia.com>

On Mon Jul 6, 2026 at 7:34 AM CEST, Alistair Popple wrote:
> @@ -31,7 +31,6 @@ pub(crate) struct Nova<'bound> {
> =20
>  /// DRM registration data, accessible from ioctl handlers via the regist=
ration guard.
>  pub(crate) struct DrmRegData<'bound> {
> -    #[allow(dead_code)]

Forgot to mention that in the previous patch, please use expect instead.

> @@ -12,11 +12,11 @@
>      types::CovariantForLt, //
>  };
> =20
> +use crate::gpu::Chipset;
>  use crate::gpu::Gpu;

Vertical import style.

> @@ -25,6 +25,13 @@ extern "C" {
>   */
>  #define NOVA_GETPARAM_VRAM_BAR_SIZE	0x1
> =20
> +/*
> + * NOVA_GETPARAM_GPU_CHIPSET
> + *
> + * Query the GPU chipset architecture/implementation.
> + */
> +#define NOVA_GETPARAM_GPU_CHIPSET	0x2

We could provide an enum for the chipset values and use it in the definitio=
n of
nova-core's Chipset type, which guarantees a single source of truth.

	define_chipset!({
	    TU102 =3D uapi::NOVA_CHIPSET_TU102,
	    TU104 =3D uapi::NOVA_CHIPSET_TU104,
	    // ...
	});
