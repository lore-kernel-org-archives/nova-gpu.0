Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93333C2BA2;
	Tue, 25 Aug 2026 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691227; cv=none; b=NufaluP+B0LvkUUpapcYJJHX2NiAINHH78mlc2HQYSphXm14vWS/hCP1Bd4AIVz/Dp0ouNWzGPlu0eNNd/3nimzExpgB/YUnSeeJquum+bDFSEH3JQuG0K3WTDKFVEufbMYH8kJidTsSYUW0BJNB685Bd1IPPS5V7Wm8sLnjee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691227; c=relaxed/simple;
	bh=aRUFBypKvRub3FzBctIBL4ktL7Lh8LotGRWs4+9I9lY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=khK/TVJoaf3y/gTmueaG7XfD96wuNeqwbDRtbPVxfxP8MUVMeUFN0dUgQTyrKRFoJCGAzPOSImo26RX2KondZtAdeMq5V6XMi2SYLch9Y4sSruQRWS3RrvPISaCH2qA+bZoX94Hr00nh+lefvLzOKkWgYeReaTDFQgce55LGE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/CNsTzJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/CNsTzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C761F000E9;
	Tue, 25 Aug 2026 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787691226;
	bh=Px83rT8Kti/M0gKeu2hRIclgFO0h7OSpSA2HNIO3oB8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=I/CNsTzJMIDlPbngb0R6oIqJIJ4tFU87EXWW2slp54p+l2LhPyaSESsUerHBtva5F
	 qN1+mKP8iE/47xcyVOb5LqwBtAR4cZvcMBml6O0v/9jQUQFJoVqNMWxIVnDZRi+Bvc
	 FizX0pz/2XWTey01n3goV/dhV6SddOnuaN68rxKObhv751EwYlcVXuXWNT6f/FVJhU
	 Yejoxjt/O/c5KiUXH5melYCsiczpF95jTdujDALriwc5q+iT32Wxxo6T/694QgF//Z
	 SYkKmHbP3Da8siOpVUBX/Lg+2els1rHFxul67grtKPdgSA9eP0pQ5ZSOM35DWB+CQl
	 kumaw2bzkacMw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 22:53:42 +0200
Message-Id: <DKYBNDXB14FY.3JX6GHMFIERO8@kernel.org>
Cc: "M Henning" <mhenning@darkrefraction.com>, "nova-gpu"
 <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 3/7] drm: nova: Add chipid enum to nova-drm UAPI
References: <20260811050657.646799-1-apopple@nvidia.com>
 <20260811050657.646799-4-apopple@nvidia.com>
 <CAAgWFh0VvY4D=-Se+bVO1YonRNFEa28nc7+ZbxEbv6en7oPaDw@mail.gmail.com>
 <DKXF49DF656E.XB24SXGL3RLE@kernel.org> <ao062w9fdaQEEYHy@nvdebian.thelocal>
 <ao1_ngqj2a2XB3h9@nvdebian.thelocal>
In-Reply-To: <ao1_ngqj2a2XB3h9@nvdebian.thelocal>

On Tue Aug 25, 2026 at 2:03 PM CEST, Alistair Popple wrote:
> On the other hand we don't need to ignore the lessons of Nouveau either a=
nd try
> and refactor everything - I agree there are plenty of UAPI choices that s=
hould
> and will be different and we shouldn't limit ourselves - but if an interf=
ace has
> been working well for 30 years and hasn't been causing anyone any issues =
then
> perhaps we should just stick with it for Nova as well?

IMO this answers the wrong question; I think the questions should be:

  - Why should we expose an encoded register value to userspace now that we=
 have
    the chance to not do so and hide that implementation detail?

  - What happens if it ever breaks?

As for the first one, I don't really see how it is a benefit to let userspa=
ce
decode it independently. It's better to have a single source of truth.

Besides that, we may also need to expose the chip major/minor revision at s=
ome
point, which can't be decoded from the chipid value. For this we'd need to
expose the full BOOT_42 register. Which is where we already have a preceden=
t
where things changed from BOOT_0 in the past.

More in general, passing encoded values from registers to userspace isn't t=
he
best practice.

Of course, userspace has to know about how the hardware works - I mean, tha=
t's
why we expose chipid, arch, etc. in the first place - but it doesn't (and
shouldn't) need to know how the parts work the kernel is responsible for.
