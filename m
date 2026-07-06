Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381F3822A8;
	Mon,  6 Jul 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362393; cv=none; b=V/yLw0rlB1pkEgfoa7VO0lZhga/OxDIvNx+QlAeEtYr2zT7a1p1rKepgC3cHQBQZ7i0tX2u0Tt3Bpf7Y9VAPk1Hoob+vVY39ZGQlWrdhgMRROkOKM6N89vq+bceMPEgBiYWV6EsblILJ973/g4yOZbC5P8vQyDEqB00r6Do1tC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362393; c=relaxed/simple;
	bh=G7bRRrHBHQQOk23S8y49wtgfbI2K7Nj1otl04h5p360=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PYDW/4qivkHenr7qEueqQTGjYencSn/9+2vHiOe61xXJmGp03gbS9Xfj5QwdLsQWy36ciK4wRAPhEuLbnMvlwgxTkmLgfGKZYTY8/aPWsT+bk0o+Tgu19xreVXac731taMA1oaYagxVxDtb49ooorwzuO34CQJN8ls0RtjxQSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBj1061w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBj1061w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA2C1F000E9;
	Mon,  6 Jul 2026 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783362392;
	bh=FDm++NGlD0X7G8TNYLMh0qBiFiboZhD4zWY4vRQWYW0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=MBj1061w1YwYlxADS2WvGpXlKBKSiez16AzyzSwz6FJKF0U1rqz2+buK+hUDd9Bhr
	 KestkTbRojdCTh/94OP9cX1ey/OK02DwuosR5sLekFBmpbkEzt2rBfVpl8alZt0etU
	 be3rWO289HxL5nsqAP+eMM6j+Z9SesBBg0H1bWM5ObEWpUpIZe3po5+0zmDNIms9++
	 4nR8oAqyrbixaMI+1B2DlTWIGutuFbt5AVSzsAAWGLQ1rRBfueCX9E9zQ+vhaNPFWe
	 T7pH0ptu8VzM48xiM90WOLx80tP/uueT/5320eVFBw2+aIGc7RiqZnlnuIaPduL/AC
	 48SBV0DstyBJg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 20:26:28 +0200
Message-Id: <DJRP7FAGEEWU.26PMTHSN6MWMU@kernel.org>
Subject: Re: [PATCH 4/4] drm: nova: Add a GETPARAM parameter to read usable
 VRAM size
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260706053413.154135-1-apopple@nvidia.com>
 <20260706053413.154135-5-apopple@nvidia.com>
In-Reply-To: <20260706053413.154135-5-apopple@nvidia.com>

On Mon Jul 6, 2026 at 7:34 AM CEST, Alistair Popple wrote:
> +    /// Returns the total usable VRAM size in bytes, i.e. the summed len=
gths of all usable FB
> +    /// regions.
> +    pub(crate) fn vram_size(&self) -> u64 {
> +        self.usable_fb_regions
> +            .iter()
> +            .fold(0, |size, region| size.saturating_add(region.end - reg=
ion.start))
> +    }
>  }

Please make sure to run the rustfmt make target.
