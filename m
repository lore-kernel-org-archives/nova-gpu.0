Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2851E25A359
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103441; cv=none; b=W2LXVQUEP08s7QD7WP6VZQSf8ZDibjO98okfJxtuPgSKCq/tYjhTXx4Xsp+iXjcIh2eB1uPHhaBopgkCe+ODsGtxDIE6e0rCzE/PWWFm9ICLpFdht8VHi2Av7hfJE1s5xP4NzliR/sJsbtMB9AgzUistJ2FP3fz0CT+1ynlBnM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103441; c=relaxed/simple;
	bh=hN4HB0wveqRjI+QBe3T5XjkoyfTnMz3MKvUaoiWWG5o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZa9yMquRrFAQQyPPocWIai9iQT+jrzVBKOz7OjMiFOBbbji5mkbbXjwEP0x1swvqDlKMor3AFmAvtAn9j6ZmHgwYXw1k1fmcqEzMNWS25aTWbbc3fU7WOJUMGTESwoWbUHZGY7Q43uNqTNMMMbtSeXk3Zwe6kRU2ANxD2AyGiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=Elvr4coA; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="Elvr4coA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1781103434; x=1781362634;
	bh=CYM/9yIKBVNxTxn6rupbHx/wVh5qkEewMV2Q/xxSdaM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Elvr4coA8Tn9Fe36RR2j+/h9X/Tht9xtuqRCIl1fL+N87VhYNrMkaXZbzLgGgxxMz
	 naI6gY1nW2fghufHczxsVay3kEsb6P86lH88onaSR8vW8LjhepVTgEdOYZxRkDWdO5
	 /h8QVAk0M13+13rPNGMDItPB6mGLmBUx9YIKc7tqKLEDd5aVTd+Pgyqx2nPvxKEfXo
	 iBdYY8ERRk9IoU4+0t9tFZYlQ7zQbHc99wQaE8W1QqUKFzT5CA9qnU8atBN+IWIz/j
	 p6ZjPGgjbKYBwAchjOdypU66kEEPWGlZ+xZyV1sXLa8i7vv85+iHCffw+b2HVce4gL
	 0qFldWIYo9zOA==
Date: Wed, 10 Jun 2026 14:57:09 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module
Message-ID: <9B2MG9ICH2MOGGwTsi0aCGBlEyEO3p-VTk7iR0wgDgBkAYKEu9GC2mc7eAODT5nilASpnSaPdZZjliM9HcvEY96LscSKHF2iDXDXCESptAA=@nanonej.com>
In-Reply-To: <DJ5EN9YOZOVF.RZ2WJGSB0L6G@nvidia.com>
References: <20260607140949.152575-1-dev@nanonej.com> <DJ5EN9YOZOVF.RZ2WJGSB0L6G@nvidia.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 296c75c6f05a1c5bad7c9d09aba6658f8816d35a
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------bfca68cb955be91c902c6aca2f3f65aefd2883d5667ad55d53ba90b10f70acae"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------bfca68cb955be91c902c6aca2f3f65aefd2883d5667ad55d53ba90b10f70acae
Content-Type: multipart/mixed;boundary=---------------------91294a86a2c4c6a7bf592b5b9524db95

-----------------------91294a86a2c4c6a7bf592b5b9524db95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Oh! Didn't think to add this extra tag since your review, sorry! =


Can we add it now? Should I do a V3 to add it? Or not that much of a big d=
eal this time, but should think about it for the next time? =


Anyway let me know and thanks for the feedback!

Also, I check for Proton Mail, as I understand they don't support `format=3D=
flowed` so except using there "uservoice" service to ask them to impleme=
nt  it, I had probably nothing else to do. But I found a git-protonmail se=
rvice dedicated to use proton mail with git send-email, so maybe it will w=
ork? I have to try as I don't know the email protocol well enough to under=
stand on which layer the patch get mangled and if this tool can proxy arou=
nd the Proton implementation.

Antonin.

-------- Original Message --------
On Wednesday, 06/10/26 at 15:31 Alexandre Courbot <acourbot@nvidia.com> wr=
ote:
On Sun Jun 7, 2026 at 11:10 PM JST, Antonin Malzieu Ridolfi wrote:
> Split the gsp register definitions grouped in nova root
> register file to the gsp module which actually use them.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

-----------------------91294a86a2c4c6a7bf592b5b9524db95--

--------bfca68cb955be91c902c6aca2f3f65aefd2883d5667ad55d53ba90b10f70acae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmopeywJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdoGz9SJO9jIAAk5e3fijLm5NChLQbGiwDFSblI
+TN25xYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAAC4uwD9Hj5+Ay5n6IMEGbCj
4gYCW/0xe4gw6tnrFNsXjAx95PwBAKsw/9hyVzo5Ahlm3p0Y5THU0tU6dggD
tNHLJMpYYMYJ
=i/eO
-----END PGP SIGNATURE-----


--------bfca68cb955be91c902c6aca2f3f65aefd2883d5667ad55d53ba90b10f70acae--

