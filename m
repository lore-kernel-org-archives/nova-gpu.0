Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2104E46AA7E
	for <nova-gpu@lists.linux.dev>; Tue, 21 Jul 2026 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648829; cv=none; b=QNGhQIRI4ysOVjb9RucCl4u3OOY272aRnO+rRKlHh/t4MlBC3Nk1lGW92CnanZR6AhUN5g/fIn3FMxt22H3CuxtxVnXOGADJ7QX+YvxX/Rs85LSokZZjyIsE6x3988SUqwE/XngPro6+BFMKdQJ6Th0aloX4Gibae4Vkx+8zqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648829; c=relaxed/simple;
	bh=Tvspvt2GGB5WeJMf3tziUwgpyawLuiKlqpdsJaZrv0U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G20JA3xyA5qA2kmODrWyPOPM+NJD4M6X6yZeo5YcWqNlPl1PUt2taaMjwhZLJ0mE7GZQiQxvipW/HiB/9GbSmrQIj51FqWi4UEqhgofxj+CNu7wI9fLNd0kNwwVe7FsZrSbsyRFndG7/RPlMUxSmI2J/+aJKJ8nWMgFYxGphkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=dDtaIwDV; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="dDtaIwDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1784648822; x=1784908022;
	bh=sejJ10464xWNGyKrf8hceYDLJk0iFdB37wranr0KVcE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dDtaIwDVdKjz6jQlhpmx3Qjgmmz/1WWdhLYDDS3p909+rbY7oRFUMNTVmmCW9MdEo
	 nGjvXU7pRJ5mIFBb8N2FMi9k6CwRIcoUTvaO11oR0Zh2Vmo9mJcE1MHZpMbr9GQCFl
	 hs+3Acr8FZZFjc3o6eKWKufWx8OCbp5qS5LENb9rHdttoggTaHHVHFCxfruL167LOJ
	 rPcEUHFkN6D6KQyYE2ffMqflQH7T/NE7MmrlURt6w1WLDyvzRu7/TtQPJEGiDf7Rpc
	 YtZALD3CB1c1w/4hPxIMEh7GfXTEtmrj5rt3ylhfee8j676E01xlQ8VXYz+gvpVLiJ
	 Uz4DU1LwqvLTw==
Date: Tue, 21 Jul 2026 15:46:59 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 0/3] gpu: nova-core: Move PFB and PBUS register
Message-ID: <OprRCKDmuvyHtJbjO71JS5CO4up4JGOsy85dYGzOQu6mwC8N-9dihiX_h-NmEcCoxb2bUVDb_kGcpA-H58Y6ZOrumPp_Dj5X3iUa4AjZLts=@nanonej.com>
In-Reply-To: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 62932c73e2bbd3959f507078ac28bf6b08bdc139
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------3095c324009ef214f1bf2869700201677b558d96d572de11cafb61feb736ed1b"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------3095c324009ef214f1bf2869700201677b558d96d572de11cafb61feb736ed1b
Content-Type: multipart/mixed;boundary=---------------------b6fea5139d6c13f745785138f2175e27

-----------------------b6fea5139d6c13f745785138f2175e27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> There could be a function in the `fb` module that reads the registers
> and returns an `Option<Range<u64>>` - `None` if `is_wpr2_set` is
> `false`, or the WPR2 range otherwise. Then the GSP TU102 HAL would just
> use this function instead of poking the register as it currently does.
> =


> Doing so would move the WPR2 registers to the right place, and provide t=
he
> right abstraction for the WPR2 region.
> =


> A patch series doing this could look like this:
> =


> - Add the `fb` module function abstracting the WPR2 region registers and
>   use it in the GSP's TU102 HAL.
> - Move the `NV_PFB_PRI_MMU_WPR2_ADDR*` registers under the `fb` module.
> - Move the `NV_PBUS_SW_SCRATCH_0E_FRTS_ERR` register under the `gsp`
>   module, since it is clearly themed after `FRTS`, which is part of the
>   GSP boot. But, without moving `NV_PBUS_SW_SCRATCH` (the actual
>   register being aliased). I expect you will hit a bug of the `register`
>   macro when doing this one - I'll try to address it, but the first two
>   steps should be safe to do and correct.

Thanks for the plan Alexandre, worked like a charm.

-----------------------b6fea5139d6c13f745785138f2175e27--

--------3095c324009ef214f1bf2869700201677b558d96d572de11cafb61feb736ed1b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmpflFsJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeAsFbFD8EepBCx9XY+x0Eu6GhsEMYdWe02x+Kx
lamwiRYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAADy4AD+KhUkNxpNcXkcZ2p+
wA47FeTA/Z1+LqsetiGdBFiHtEwA/2DzSUFqPoZKYx1BWMbg1cMUcTuxIobW
45ZN2/TlVasH
=PPKZ
-----END PGP SIGNATURE-----


--------3095c324009ef214f1bf2869700201677b558d96d572de11cafb61feb736ed1b--

