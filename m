Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC123770B
	for <nova-gpu@lists.linux.dev>; Tue, 21 Jul 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649071; cv=none; b=oUwG+R0iAWGBLUMRY/ySBclfdyONkcUMWHvhB6PxXjGeXLabYJKMMcZiU5mMvFI9EbiuKjqK6tkSa60tBg2p0D0seGzh7s41qeQoO01fvPO7seV9bKzwliAJqvbu/+wnmVLWLxSRutmFTBhra1HBZ6UnGlyazCJH/GWRsWbd0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649071; c=relaxed/simple;
	bh=aeXRMbSVwJegW2hyKG/eSe1/9Gc20TbzuggZXGs8EXc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQ3iJq+dW5IRSTeXLoZLVZ0v3Jcy+BHxmokBYWMj0NH6YANyzBa+mI3mWZBI7LVCg1C+mTfxVEG0m7RYl+jaD+2GRmY9oy2stif43VmWqHnY2hXEcxgz/AoTr17eurA6uL+pEPtGDf6N52DSZ2Oks58TORvYHf0/U8Ju6dKs1Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=RITv0cPo; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="RITv0cPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1784649067; x=1784908267;
	bh=4xJdf7VXivw/wmWg7N3kuh9PsFrCjXHEJpgiZKPVOoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RITv0cPoav8kjkOZduD2wA3VWlIWqR0QQLXZeNAesxuutc8FhpHzT4NJqE5G0BZOD
	 hRUJz6gFgCbK6bnYhW5yFZpz+jMfkBxo995/q/xDvoMqn75BklpIaExf2SOcclEzDp
	 js3M/HwdE41w5CqHxloA9UraDefXS0fYEoxpNILCMzKNLOuNERal1FpwCDNgytTcoC
	 OkU5uGcS+29840CmC3JQp8TnDWIZ0bdmbsSSgy1YDrDq7i5ijBvEIbf0kFSO4jaMdN
	 GPKJN1ySBFUvmMwSFAMk/mS55kgasZ9tAq3rUHQ9YX+outBKYZ1QCAXrkovPR/gKi9
	 rq4QUGLrmq5fw==
Date: Tue, 21 Jul 2026 15:51:04 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 3/3] gpu: nova-core: Move one PBUS register definition
Message-ID: <TPL-Nmz1jd_sB3sr_x-746jIwTxY7IRTMU5b8jwBv1ice0C31BNvqzUzo3s68ZkE1-mfZHAx2SURO54hHnbR8CUPo3rNLnfHIs_ujtl8D_Q=@nanonej.com>
In-Reply-To: <20260721-nova-core-regs-split-v1-3-384fa2a42244@nanonej.com>
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com> <20260721-nova-core-regs-split-v1-3-384fa2a42244@nanonej.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 3cbe4f318882a5b26acc02f784099a943722e458
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------90ec2874e62782a973c832ee1cb04ece76142ec267716d49afc83988116fa4c7"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------90ec2874e62782a973c832ee1cb04ece76142ec267716d49afc83988116fa4c7
Content-Type: multipart/mixed;boundary=---------------------caaab8e2f47728585588c4be9d747c1d

-----------------------caaab8e2f47728585588c4be9d747c1d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> - Move the `NV_PBUS_SW_SCRATCH_0E_FRTS_ERR` register under the `gsp`
>   module, since it is clearly themed after `FRTS`, which is part of the
>   GSP boot. But, without moving `NV_PBUS_SW_SCRATCH` (the actual
>   register being aliased). I expect you will hit a bug of the `register`
>   macro when doing this one - I'll try to address it, but the first two
>   steps should be safe to do and correct.

You told me that I would hit a bug on `NV_PBUS_SW_SCRATCH`, but as far as =
I compile, I didn't. Anything I could have missed?
-----------------------caaab8e2f47728585588c4be9d747c1d--

--------90ec2874e62782a973c832ee1cb04ece76142ec267716d49afc83988116fa4c7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmpflVAJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeO7oAu5DM/5lP6bIP2W+HspMUPayb2ZPEYyasl
PmwVbBYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAADS/AD9EpYBfq9Kr+a39+kQ
akbqa9xwLHWgaL4MEK4wf7bbpCgA/RyEo4HklPGFdn5zLDzNb7te8K4qYiHa
YJma6b43vjoC
=WCSH
-----END PGP SIGNATURE-----


--------90ec2874e62782a973c832ee1cb04ece76142ec267716d49afc83988116fa4c7--

