Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE984ABBC6
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003609; cv=none; b=uwY9iExmvCe0LQE5nfr4RJmWKrYlRavd5XTutyHMQWNcrNk+SqWc4L/bXUq8LhqORHnxUmVu54wNomLApd0nMYPwn5T8h5Sh5NOrKwWQ/9mRrmOAH4aohOv7PDZqjHgbLzs3lxfgYMrncOScXrGixiY9SQUVSwgSpQ4XKEz6XLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003609; c=relaxed/simple;
	bh=d1D6q7cPYgUYmn8Y+4GOIUPx8mwQ6rbFeFOEWhn9MvY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBmQaxdW4Popedc5RsHZ1VMbFh9Lp8jje2JsPsG8/jpJEHs/xXCth7HDRr0mCfQoLTfnmRVInQbfnMPvresWiZZuKH5rU3jzeQLer5AizZY2J9z4h2kBWVfFyLtK2C2rO32k+qouJgpHzIVAOrGijxu9AFAMi5Zd/ESd0fMZAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=AeCL4Ki1; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="AeCL4Ki1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail3; t=1790003592; x=1790262792;
	bh=IEWMdJz9YAjjdToPx03hIHKOvrYcQfh3pyhTvkyPGLY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AeCL4Ki176gOLOE0FuZ4scb2t7W8piULV1nmviKUgKnMkdxzOoQB6H91iPYmUNihS
	 G/58oYGeX2Y1cwGK1sg8RSYI03LkTI+sCBEbl0KGF3NTiqL9d8VEtE8/2M4nIdF0mg
	 HAA0FIzasQcT/I7rJOC/H6pznBQpA0+TmupgltMpuKcux6Eycwf5N0ssqR75FlDPpt
	 J5OxEKskiTyN8Gvkz5mXQlEz+NYo6D5ZOw3fv2tT4AqMyWE5N4SsHiy/dvBa9zT8iQ
	 jeWwTPFQ1yuo3z2VA4R2CvnbWBUr/KqgEwOy8sUn/5J47plahik9PwKhtO4hTBdStH
	 pBl3VJelGL3IQ==
Date: Mon, 21 Sep 2026 15:13:07 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] gpu: nova-core: Extract PFALCON register
Message-ID: <2jQVZV73cgrJOjnRVQ-gT1k4iBhKks2rB7H2doPH0l4zkbumXvnyoLEIFmATkIhpfwxRBwOFClJrf0f_iM7-mHyvYFbgyXt25Aqqp50vm18=@nanonej.com>
In-Reply-To: <kIdb8vQDIzXcbzWMhRY98VQbxMOEgAco-4AUdcK8u3YM1WP8XCjdrqTEGfj3PKMcahDDiizBwLFH6JwMlcUxuIkjsacGqNd7W8YJKeRqmFA=@nanonej.com>
References: <20260826-b4-extract-pfsp-registers-to-falcon-mod-v1-0-38351df09084@nanonej.com> <20260826-b4-extract-pfsp-registers-to-falcon-mod-v1-4-38351df09084@nanonej.com> <DL06EAP0GF04.2X3P68IPD0Y7X@nvidia.com> <kIdb8vQDIzXcbzWMhRY98VQbxMOEgAco-4AUdcK8u3YM1WP8XCjdrqTEGfj3PKMcahDDiizBwLFH6JwMlcUxuIkjsacGqNd7W8YJKeRqmFA=@nanonej.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 31651d218434a189031e1a0140893ceba17db1bf
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------7b53ba318633761f155271ac5e47d80a75b0cb03fcc7ffeae3511ada91d502b2"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------7b53ba318633761f155271ac5e47d80a75b0cb03fcc7ffeae3511ada91d502b2
Content-Type: multipart/mixed;boundary=---------------------fb4e9f4b0b317602eaf5f3b1553d6975

-----------------------fb4e9f4b0b317602eaf5f3b1553d6975
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8


> > I'd like the method to look at bit less
> > ad-hoc and more confined. So would you:
> >
> > - Move it to `falcon/gsp.rs` and implement it only to `Falcon<Gsp>`, a=
s
> >   that's the only case where we need it so far,
> > - Make `ctx_dma` a `usize` (it's the caller's problem to provide the
> >   correct type),
> > - Add the `FalconFbifTarget` and `FalconFbifMemType` as arguments of t=
he
> >   method,
> > - Maybe rename it to `set_fbif_transcfg`, because the fact we touch
> >   registers is an abstraction detail.
> >
> > As a side-note, the series is going to clash heavily with Gary's, and
> > will need to be rebased on top of it after Gary's series is merged
> > (which as far as I'm concerned should be the next version).
> =


> Thanks for the review I'll refacto on a v2 like that then and wait for
> Gary's series to rebase and send it.

I see the patch have been merged [1], so I'll rebase and make a refacto fo=
r a v2

[1] https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/ea79a501243155=
89da68cbcaf518455a142d6d23
-----------------------fb4e9f4b0b317602eaf5f3b1553d6975--

--------7b53ba318633761f155271ac5e47d80a75b0cb03fcc7ffeae3511ada91d502b2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmqxSWgJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeQvgvyV3yUJoCsLgAeC4wVDMe8MWuRIVetwT3P
x/inKhYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAACeaQD8CKS7AOQBshpxYI7B
0JUvIAKddHMLcTccNUgI/3ohueoA/i5KATberrMvAS5ERECh+sy1VHAtGQAS
JiTYHBI/w/cL
=fE1V
-----END PGP SIGNATURE-----


--------7b53ba318633761f155271ac5e47d80a75b0cb03fcc7ffeae3511ada91d502b2--

