Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045304;
	b=GwCd5lue3ip6bsiGr4CdWnPTQIgGn6U7WCVFfEucFR0NZSLz2a6bHf0feFLS590eCP/O
	 6dJNrHnzPGW6X1mx2uin3ocXiYXJ4b1AKzCd0F8i9kwSbbA9V9Lsu82IrAPoF1tx8iYt0
	 BXqZlxwKh/EQJZtjiMGkkDhz54Abw7e/5ByH3roZr4KB9i0Yh4K7vu3HvfKdXqKdIUfHL
	 CDwStNFD6wQnpqcyPYZZsPl5317EA4z1C4PAGjZIl13sEYhGTEwEMUUlpl1SbbrWliMBO
	 V+vn92ChJ/3cLIstq1/7MjFQcas32sNc+xqb2tnryWEpsvmjRSyA34ySPBXJEQmmqdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VzZ/dTAQyR5RtMi2z2Wd4SfFRdhcrQU8foaAcXHdi5U=;
	b=4ikFQqqcEGD6huLTiJVR/fE0myVvKTN0nQSkHQvdP0quC1muSLIoJiYszPGmQ5AJceUD
	 pkGjafASTBcxepM01oTd2tu4XFuJ61yfj8Mq9lkV/taz45giWpLn4XUv1x+ShVnjZCiEb
	 URgYplN1Ulj11bxZeFZsfsUvtqNeHPXa0eOTZ1J9eBIb11omei83HmHEqbkbbsvwm+dqC
	 qdWILkOHS9hYqBPSt4/Vgx4UDgi3iKWQfA6ciHT5VKH7AKAWZtwMWnvDdao1kDbtGs808
	 kRTzztnajrMaQYwVOuqCS+sOzcuTntJlmX5lXcS1B852Zk/4GWWhx64Uwg3j2ryl/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZ8UshTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4D606A326
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZ8UshTh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2428B1F0089F;
	Sat,  7 Nov 2026 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794045301;
	bh=VzZ/dTAQyR5RtMi2z2Wd4SfFRdhcrQU8foaAcXHdi5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KZ8UshTheQuqOngDwwObnilReu/gyYqh5dpAfg9659wNCtxq+wHC9SHRZggMZfE3S
	 FWGTGpeOqw36eaIZslOWjqPaq75U6M+vMZTb+A5Q+6fxfufAxrrL6V/iarBexTll+8
	 0qza8mM910yFBjPzf9s/YqcvAHDQo+XjZrRleerboeZ63e70rxAhN24reViYPTB7g3
	 OlM2ixs6wvvjB7nh+IIbEZkyTLzZV5EPZFLGFh621+rf34WCHxiEpsCFbJROf/vZsP
	 3nsQiWcZyxDNwDBpLGoJVPHcy2yPtlJ7DdOTmZrGTo5lVk7BoCkNOjQJhe6pQR/2H4
	 JlMuVHNnClZAw==
Message-ID: <sashiko-outbox-202791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] rust: io: register: implement Copy and Clone
 for RegisterArrayLoc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary
 Guo" <gary@garyguo.net>, ojeda@kernel.org
In-Reply-To: <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 09:55:00 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] rust: io: register: missing #[inline] on
  RegisterArrayLoc::clone()
--

commit bf14039e845ff1b0df72a205d4992beb78cd56a0
Author: Alexandre Courbot <acourbot@nvidia.com>

rust: io: register: implement Copy and Clone for RegisterArrayLoc

This commit implements Clone and Copy for RegisterArrayLoc<T> so a
validated register array location can be reused across multiple I/O
accesses.

> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> index b6513fa0f412c..9e31e68d02cde 100644
> --- a/rust/kernel/io/register.rs
> +++ b/rust/kernel/io/register.rs
> @@ -194,6 +194,14 @@ pub fn try_new(idx: usize) -> Option<Self> {
>      }
>  }
> =20
> +impl<T: RegisterArray> Clone for RegisterArrayLoc<T> {
> +    fn clone(&self) -> Self {
> +        *self
> +    }
> +}

[Severity: Low]
Should RegisterArrayLoc::clone() be marked #[inline], matching the rest of
the kernel crate abstractions and the other functions in this file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-r000-fw-v2=
-0-fb37cc5b20cd@nvidia.com?part=3D6
