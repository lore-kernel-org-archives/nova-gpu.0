Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC79522D7A1
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116251; cv=none; b=f/el3nP9ZMtFXuoqW88oOCvBXWhs0YBqgg7xxrDJFSdp7tImDDqfJqkdj4Lu2sHNL86GFke010zLCezpMH4eP2l+15ajskh2PzENgAqGXi3B8rPb6Gb9ZC0pFnI+7vj2PC5yLCy5k/8foClask0TI3kcBAlQ31PTtdbC1Eyk83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116251; c=relaxed/simple;
	bh=whK1kzqNTUtgYNhGpO+UCDkaRfOrKLJR9bmPht6cElI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tGhElZnXAid4hdJruwaNzUhQrS1sk8ketkemh+y4suS9T+ze5zm8O6pUFUl+I+mhMR3pdZny7uiv/axGR+K3bajMUqk+WgxuuY6SYLgKNfQax8p7gX2RkZujD0ee5q6rSJpN0i5m8o+JZqkGH6CLIBERDo/xe11iewbQ1ua8PQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m95yRK1K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m95yRK1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B95A1F000C4;
	Fri, 16 Oct 2026 02:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792116250;
	bh=FdcxFEgwdi/jPH2odXcF0/cWQyZfYLZUXFYMLgg4+hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m95yRK1Kzpql9elHQ1PS0ZaWk51AoTopIjkKU1g98fPc+7OfwMngviuK+APm206Cc
	 506q7RmMWl0yWcAmti7ugnNUJ52oKeaVLPu8qvxWKm6XXZsL0R5J+J30iI0m5K/HB6
	 YVam613WRCQLgacOPML3UaVFjH3qP/2BwD2TAQNnd+/9h7Ttc7GyCiofBy1ubooEHD
	 H4UX9ShiD2T9Jc9OrhfXS6RLxnbveEu9+Fa9BntPxYrS9i0xS0mRNuHNbvAFfpd217
	 Me8EO5l1gKNcSV9lhJTXFNA8/jSR7ClmYSqH+5lxYmKr9o32H8sjIIJ82pyAWixM7r
	 H4ztFvAV0hMjA==
Message-ID: <sashiko-outbox-173611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] rust: alloc: add ArrayVec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261016-b4-nvkv-v4-2-e8b92b91aa5b@nvidia.com>
References: <20261016-b4-nvkv-v4-0-e8b92b91aa5b@nvidia.com>
 <20261016-b4-nvkv-v4-2-e8b92b91aa5b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 02:04:09 +0000
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] rust: missing #[inline] on try_push_init and extend_from_slice
--

commit 83efda44f14b36e4aab4040f689c08677c6c23f1
Author: Eliot Courtney <ecourtney@nvidia.com>

rust: alloc: add ArrayVec

Add a fixed capacity vector backed by [MaybeUninit<T>; N]. The ArrayVec
is also initializable with a closure, returning an Init instance, to
avoid constructing it on the stack.

> diff --git a/rust/kernel/alloc/arrayvec.rs b/rust/kernel/alloc/arrayvec.rs
> new file mode 100644
> index 0000000000000..8793adf4d27b7
> --- /dev/null
> +++ b/rust/kernel/alloc/arrayvec.rs

[ ... ]

> +    /// Appends an element to the back of the [`ArrayVec`] by initializi=
ng it in place.
> +    ///
> +    /// Unlike [`ArrayVec::push_init`], the initializer may be fallible.=
 If the [`ArrayVec`] is
> +    /// full, the original initializer `init` is handed back in [`TryPus=
hInitError::Full`]. If the
> +    /// initializer itself fails, its error is returned in [`TryPushInit=
Error::InitError`].
> +    pub fn try_push_init<I, E>(&mut self, init: I) -> Result<(), TryPush=
InitError<I, E>>
> +    where
> +        I: Init<T, E>,
> +    {
> +        let Some(slot) =3D self.spare_capacity_mut().first_mut() else {

[Severity: Low]
This isn't a bug, but is try_push_init() missing an #[inline] attribute?
The Rust subsystem coding guidelines state that small functions in abstract=
ions
should be annotated with #[inline].

[ ... ]

> +    /// Appends a clone of each element in `slice` to the back of the [`=
ArrayVec`].
> +    ///
> +    /// Fails with [`EINVAL`] if `slice` is longer than the remaining ca=
pacity.
> +    pub fn extend_from_slice(&mut self, slice: &[T]) -> Result
> +    where
> +        T: Clone,
> +    {
> +        let Some(dst) =3D self.spare_capacity_mut().get_mut(..slice.len(=
)) else {

[Severity: Low]
This isn't a bug, but is extend_from_slice() also missing an #[inline]
attribute? The Rust subsystem coding guidelines state that small functions =
in
abstractions should be annotated with #[inline].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-nvkv-v4=
-0-e8b92b91aa5b@nvidia.com?part=3D2
