Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA385367F31
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165482; cv=none; b=dnzNDhDdJvYKwiNiXRsa6fWVxB9ygEE8Y8JeMaddkBTASE2i4Zt3nx7gCN1FYZ3+5AZInymQZNLdWFmafGqHnfZe57m4mRnOxqqmwQuYarTQeCYEuitQyUx2/E5RCIri7/+jQBB+bbl9dSdElwFzc4XDaNuvA0ac1aQnq8cyLjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165482; c=relaxed/simple;
	bh=xGEwWjcvmhqyJlo7tPYR7Vxyx4ELoWw7nbEoSG9TT+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzJjaPKi4AYYMWTCBRdo8zZ0sQurB/EE8VPm+q6wCDUiTH1ekSOwpEuOfXgr3hodw76Ha1P5EHeVkOvVd/I71heHE8v42kj/NpB5TwbqFyw7n7YNqq7fX8oqkvNSloBzPVmYw2zHYB3cN9TP+MT/a3UtImM7le6V2bt2R825YW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=N9/u+lxe; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="N9/u+lxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1785165478; x=1785424678;
	bh=xGEwWjcvmhqyJlo7tPYR7Vxyx4ELoWw7nbEoSG9TT+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N9/u+lxeNj0d34+PTcqC+OPR+9hHFG8Cr5ZQve3DxFE1zEsC2p1ql9eIufrm96xaU
	 ASY5hsAfE0/zWCpvHYIX6GclvpnTHrhH+zbgimqQKSA0D7T/TY9Z5y5iakbwRHXB+j
	 sriHH0WSzCwPJEfynKg//dzM6sfQUxr1dQxucgQKjttPubC1CYPVLOaWZx8t5ih0nk
	 Nz7LDi824vf5AtcTwZkXuQzAc9eV6ocp2eMPrL7oJ5XamUSnnmujsoMu0I7Xlv1Cy+
	 C7voaxZcJDwVj2bQmX4cNq6DEfjr9yOhmaLslli9+JaICF0OK+bgXOgOtPqXMfBngH
	 Ow6M/p1UkX51g==
Date: Mon, 27 Jul 2026 15:17:53 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 2/3] gpu: nova-core: Move PFB registers definitions
Message-ID: <cN4Q2hbbRw9FAjcXaAsublR_qeeRSpeV4MYDxyR4lZet4wMCdudh-4NZ1omxTpA-q8ZkDmpwmpBRnpwbm3Fa-Z1kxH-Z2ga4L3iZU3FMt5I=@nanonej.com>
In-Reply-To: <DK7OQQAYBCQV.3PKBRU8CYCUNG@nvidia.com>
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com> <20260721-nova-core-regs-split-v1-2-384fa2a42244@nanonej.com> <DK7OQQAYBCQV.3PKBRU8CYCUNG@nvidia.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 2d3853188b6656ddb0d50f11b1c2973d9f48822a
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------062b81900832d9fd48c31af0f76290d25e570df9d84b46b45996312013de7305"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------062b81900832d9fd48c31af0f76290d25e570df9d84b46b45996312013de7305
Content-Type: multipart/mixed;boundary=---------------------78f145c0554e067b9125a7fea6ccbc39

-----------------------78f145c0554e067b9125a7fea6ccbc39
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> Every patch needs a commit message, even if short.

Ok, you mean a body then I guess?
Cause my commit have a message but b4 turned it in the patch subject, so I=
 guess I must also add a body.

> (also please check whether the issue raised by Sashiko [1] has merit)
>
> [1] https://sashiko.dev/#/patchset/20260721-nova-core-regs-split-v1-0-38=
4fa2a42244@nanonej.com?part=3D2

It make sense, but I didn't find how to check the generated doc in docs ke=
rnel rust [1].
So for my fix I just reverted to the absolute `crate::fb::SysmemFlush`, bu=
t if it is really tied to rustdoc I would be glad to know how to generate =
it and check it correctly.

[1] https://docs.kernel.org/rust

> One more comment inline, but this is pretty much what I had in mind; so
> looking pretty good imho!

Ok, happy to read that, thanks!
-----------------------78f145c0554e067b9125a7fea6ccbc39--

--------062b81900832d9fd48c31af0f76290d25e570df9d84b46b45996312013de7305
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmpndooJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfMcgiZCeO+WFZOOPtgJE0EeVkZIxfONYkoYotV
bRmwEhYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAAAtDAD6ApGHfXvnPCd+17Xu
Hy2gSlxiu2Lpvpa/GFNpIqJVlcEA/RFS+K2l8LG6/DY3Xm5YMrfC04Z4zjlS
BJVWfH1Sb9kP
=c9XG
-----END PGP SIGNATURE-----


--------062b81900832d9fd48c31af0f76290d25e570df9d84b46b45996312013de7305--

