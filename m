Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D14946F4A4
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 04:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384676; cv=none; b=sQUkJgCDSOZa9z1EdSUXuR0nZeu1WZkb2I9TgbINuxYtJCT3Ex3bW+1r6ND5/9OZRnzPtwcOLn+7Qs6m9R/GZHIcPlHGVlYmxunEHIGuDsWjtteZGveDJdAB6PY3mw/1y7BaV8hLKPdbaShpFK88HZDn4UCwcVmFLPxGbEVGQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384676; c=relaxed/simple;
	bh=cO6goq4027r706qXfwzVEth0aI6OAe+j8CxRIg0EMr8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AaAztOZy19uwZeybPdn6DXeb+vyqH+SBexUVzbKUAChSYKTyaWWOtcMLB/w8wQtbS+J/6Br4EZmPnSe8pgwb9NWPazANBEvX1+iRZKALNTBLeA/1ZAtw3MLXnj51uYWgLUu0y+/9joJXGdrI4H1CdwI3eVNet/LSaaDQvGqOinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0HvTiXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0HvTiXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4C71F000C4;
	Mon, 19 Oct 2026 04:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792384665;
	bh=JLiYDv+iV8ZTsAXWw6zS9tWEJ0XwIEI9q0xb2IWt+6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0HvTiXTTb+fgyfMjZrkP+c3qyHBg11kE0aaAViN9Yt8s9lNI1YoJZ4W9AU0WHbkx
	 k7ncgPO7+HwHLGQKC9a6Mtk2WzuHonqaHUDsMIVF5Mw9QyA4GmRNhLTpn4Guw1Ljd4
	 qDi0V3cdbo/xQhYyq3K0+UWUcgiVWAvrQkuH4NnVT7QLsM8eALdJv4guIX/p1Fv0p3
	 sCMXsEECciqv6tvIpmQaZjvCVcMi3zP+PyNtUlIjp+vQnSfjnj5OfybhEznF9b7WDN
	 0QNgSiGM2hVjJkQtkw619IZ1XZ75B86fMnVKIRV9MmEqBHu6NyMRUB0r2IXYUzSCzm
	 q3E4wyrkF3QQQ==
Message-ID: <sashiko-outbox-176643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to
 BitmapVec::MAX_INLINE_LEN
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com>
 <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 04:37:43 +0000
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] rust: id_pool: panic in find_unused_id() on small or zero capaci=
ty pools
--

commit 018a4fbd0a161c3060c7581d4c4fd80bc70dcd41
Author: Eliot Courtney <ecourtney@nvidia.com>

rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN

This commit stops rounding small capacities up to BitmapVec::MAX_INLINE_LEN
in IdPool::with_capacity() so that capacities smaller than MAX_INLINE_LEN,
including 0, can be used directly. It also updates IdPool::grow_request() to
grow to at least BitmapVec::MAX_INLINE_LEN.

> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 384753fe0e44a..7bb8bb89297f0 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -106,13 +106,8 @@ pub fn new() -> Self {
>      }
> =20
>      /// Constructs a new [`IdPool`] with space for a specific number of =
bits.
> -    ///
> -    /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_=
LEN`].
> -    ///
> -    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
>      #[inline]
>      pub fn with_capacity(num_ids: usize, flags: Flags) -> Result<Self, A=
llocError> {
> -        let num_ids =3D usize::max(num_ids, BitmapVec::MAX_INLINE_LEN);
>          let map =3D BitmapVec::new(num_ids, flags)?;
>          Ok(Self { map })
>      }

[Severity: Medium]
With the capacity floor removed, can calling IdPool::find_unused_id() on a
pool created with capacity 0 (or any capacity <=3D offset) trigger a panic =
when
CONFIG_RUST_BITMAP_HARDENED=3Dy is enabled?

In rust/kernel/id_pool.rs, IdPool::find_unused_id() passes offset directly =
to
Bitmap::next_zero_bit() without checking whether offset >=3D self.capacity(=
):

    pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>>=
 {
        // INVARIANT: `next_zero_bit()` returns None or an integer less tha=
n `map.len()`
        Some(UnusedId {
            id: self.map.next_zero_bit(offset)?,
            pool: self,
        })
    }

In rust/kernel/bitmap.rs, Bitmap::next_zero_bit() asserts that start is
strictly less than self.len():

    pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
        bitmap_assert!(
            start < self.len(),
            "`start` must be < {} was {}",
            self.len(),
            start
        );

When a pool is constructed via IdPool::with_capacity(0, flags) and a caller
invokes pool.find_unused_id(0) before growing the pool, self.len() is 0 and
start < self.len() fails, panicking under CONFIG_RUST_BITMAP_HARDENED=3Dy
instead of returning None. The same happens if a caller creates a small pool
(for example with capacity 1) and calls find_unused_id(1).

[ ... ]

>
>
>
>
>
>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-chid-v10-0=
-67de9180b4ed@nvidia.com?part=3D2
