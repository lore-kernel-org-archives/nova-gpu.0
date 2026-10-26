Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015613;
	b=qKrHvgyH8dT3gUpS4zEXc3rvHJKkFMjOX70x75vvY5+YqwWdEadisjTWavUBVFHlOdsB
	 GQX3xJKP/4CdX2Te9zy/Ek6TCdWE+yTE6UtuPs0NLNP8/y+Po+JpD5ETrjnGOUQyMWttq
	 BMfirWGOVxbMHgMlYvheolbF7c00wMBY7RIi0WYci2sz57gpzl2TZELHLqymfW1cH7ALZ
	 JhP9O7Ibgg4aBmisl0vVZAVKLjH3o48/aQ3U90YbZpBcWab65G73nrCnZZqyY/riB2eIM
	 BOYYGyDqh8EX3xZiAxA0LW8VZpTLhpFiq6jVzrv88mJuKAoNEEY2w2PEFf/SaSu9/9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KPI6HH/W/aEYa7420sHzRciVfHFyHqvQMBmPbXCoemQ=;
	b=uLGyE4l/TfZyPgD6FOjcCedFF8JoCHmX/n1MbBP8GLJTHVwbnzKlN69QIlogVSkjoNzO
	 Z2+Qe7HfRH+qqf1By5sgrqW/JQ/xAhWvWATv4VNdUWY7xPTMnu03o2hT9OoY+Ln2qzKpk
	 ly7zCG+etjPJ6+z37V/9wlLLankYZEskxGc7ZUo5HOHq4PbZLy8DAGPx0htcy1f/iX6QZ
	 SGtcpbHfX0m1aipNLJhtw5TK9PAnTBUxigzlMQlCTKKuQsKDALb5RRwjxPtgjYMQfRNjz
	 Hv9X45uzIlU6nvV8kihNhsG3opQAbFDIAoc7cU0C4da3+nrFjYvYuhPQVCbghQboBJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDG7W1ed;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBED606A31D
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDG7W1ed
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201031F01825;
	Mon, 26 Oct 2026 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793015613;
	bh=KPI6HH/W/aEYa7420sHzRciVfHFyHqvQMBmPbXCoemQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDG7W1edYi8C7nc3DQyr0o6A5MiIWhWSwuUTmKlYz04He39jhnaqgNntu5ToF8Jkt
	 fjNho7pst4At49tdy30Q2wAuA4sM7OSM0ZEeZX+bEhcPiS4BWDY/QShDGHRsfYabq6
	 8Al9Unsw6ovlLd3anVAej3yE7YYfmYxEotaFcU+/occrEO+zihLOwhF1mbpcHqAvUD
	 sEOZqyOHYxNYpD//ukPOCBLG7UEiIbbEoi9xsGvaNNjiDnLiTWptvQMn/cGgmqKx1b
	 VmTjywDtv0uOTqfR5UDA4OKMHNnKciXjZ5CJCsV5I4UknDM+J5GuN8iWHEdlEIEx3H
	 P/gvcR9/WIcKQ==
Message-ID: <sashiko-outbox-185127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] rust: drm: gem: add an is_imported() accessor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, =?utf-8?b?Qmo=?=
 =?utf-8?b?w7ZybiBSb3kgQmFyb24=?= <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Janne
 Grunau" <j@jananu.net>, "Sami Tolvanen" <samitolvanen@google.com>, "Lyude
 Paul" <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:53:31 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] rust: drm: gem: missing #[inline] on BaseObject::is_imported()
--

commit 870fd74aba497ab1671a05a6bf7eca2012bd1ed7
Author: Sami Tolvanen <samitolvanen@google.com>

rust: drm: gem: add an is_imported() accessor

This commit adds BaseObject::is_imported() and a corresponding C helper
shim to check whether a DRM GEM object is PRIME-imported.

> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index e01b8311dd895..5da8627275a29 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -187,6 +187,13 @@ fn size(&self) -> usize {
>          unsafe { (*self.as_raw()).size }
>      }
> =20
> +    /// Returns whether the object's backing buffer is imported from ano=
ther
> +    /// driver.
> +    fn is_imported(&self) -> bool {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        unsafe { bindings::drm_gem_is_imported(self.as_raw()) }
> +    }

[Severity: Low]
This isn't a bug, but since BaseObject::is_imported() in
rust/kernel/drm/gem/mod.rs is a small abstraction method in the kernel
crate that directly forwards to bindings::drm_gem_is_imported(), should it
be annotated with #[inline] per the Rust coding guidelines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-rust-drm-g=
em-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net?part=3D2
