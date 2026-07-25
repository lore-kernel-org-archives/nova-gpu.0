Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674421B4156;
	Sat, 25 Jul 2026 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993009; cv=none; b=Jm73E9Kc+Nt6Qbz12aEmp1BzdsOdjPu7CCoTfVrzYqzYMlYf6g7DMFjLRETWBhju9bmE7zalWQ+GkQi1LYuPxX9KNVA5K5rFY+USvS9eJ74Sj/bOpOo8ADaw7mjt2alYco7XYa3BTRDti+kiLaMOmwyGLqNhxzuYyael4exfXgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993009; c=relaxed/simple;
	bh=Lq3HWfsk7yj15TftSg7GBWMre63PAJIyQ1xpe/iHQn4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=E19ISHIWkYUvurIT/P2Z8Fzr3Z9jnbsIplhQaOUBC7Dn8iJDMrQnkZH8P8lgnbVQG70pT77q38ghkdSMHHuBfqpzD0eNVhNP7kI2S/R15XQpkd4E7XEuC9CJ/aEjnvrgL8QESFUUiBZlOSiOxeT+mWLEVbL6XrVoDPiHL6dq8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbL2n5Ny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbL2n5Ny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954EE1F000E9;
	Sat, 25 Jul 2026 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993007;
	bh=uM33LkmJJlLhfgTVLUYI9dVj4Xvgi0/eSvsHodxfJbo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=NbL2n5Nyyr4JknDJvpB0pkwO+3n+G1y877w/oARXZF7drW4mNoanfHPbgUCfhvFh1
	 sQlK7qhCl3LTiW1TV7/X5QGnlCHciyXw+rCws9FEwKIhRBVovoJGX4ydoY8WoPep0e
	 KMVBE/oVol5wQuWNXBouV5NIaU1hfRpT3k5pbBef4gOfxRhZwp2dl/sK2OcMOYkbPi
	 J3h+eyUBEIVbE+fvfHkFSdSW/iWqzA8pCESK21VxY5V4snBL4FQuVuo+xvhtrQ/H4g
	 ZoBcJaE1iR1YDRuBR5zUElF5tHiWD1y2RbWTIvSyj+n/jtDfIiyh5lkHtbc2qGPP8y
	 74FDJ7jPe9o/w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 17:23:24 +0200
Message-Id: <DK7R7LQGT6KQ.1PW82XC9K2JNG@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 2/7] drm: nova: Add DRM registration data
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20260723063046.1265791-1-apopple@nvidia.com>
 <20260723063046.1265791-3-apopple@nvidia.com>
In-Reply-To: <20260723063046.1265791-3-apopple@nvidia.com>

On Thu Jul 23, 2026 at 8:30 AM CEST, Alistair Popple wrote:
> +/// DRM registration data, accessible from ioctl handlers via the regist=
ration guard.
> +pub(crate) struct DrmRegData<'bound> {
> +    #[expect(unused)]
> +    pub(crate) api: Pin<&'bound NovaCoreApi<'bound>>,
> +}

Same as in the previous patch, please use another name than 'bound; 'drm ma=
ybe?
