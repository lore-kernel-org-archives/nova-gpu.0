Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028317;
	b=D7u1ZNyDVhxoXWwdEOn/cbP13zXcIhTRBsqnbfk3BBTWsgKZVuqOl8gwLhBIz67MPPz2
	 0Ur+n+yMoUBDS2LAvrh5/lVtej++0PejNhiz8D7zoE0YilI1L2qIZK2hm9x+/c44ptKSI
	 6ImNzref+c7Po3gWvZv+9QTIrJAJncbTD/AH3dzukDLKFv6M40qXaZCbDlUR0hhbDuM0u
	 3xgvdHz2JKGV3+8PyEGgUcPPyLxXe9F1X5qll8Ev0ug14Z5vqAJYU+CQr28RjSjYykASy
	 3bKoxWm8QyWCQSzZWhS0LHSD6eTaaPxLftkDLQSUVoLipGP2Gt1jIxUvLNubppyKscg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
	b=0Qa7MM6ZjLe3C3/qmtiPLdARKFT6+dVZ8vdv5+fg/lZgnzeqpbtMfjpH4AuTE7CcyJxv
	 qW0bSkUckV9UGDnLqHBTxEi73XDJYOZZPoPHywp+Y7KSeoWOOu3IkvJTALYDtNpMEhAWd
	 x3pd8ouTlZ1ntHsKqFnAI+mrPyuDPlXQw2IVPKy8uVCSpr1WAPsGCb5ToOWEIsri8IlcE
	 Dcem3Rvq8x+KnqkgugILuFC/9FOg5/AH9WdzPAtSvYP7ML72HmgmwhIN1SNPFCwmohUrJ
	 xMg9o6ntarjG66zUuZhqaOY+vW1KIWVJD2HrX17cNl7HWxAZGHgK3ZvIhU27iJz0IJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WIFyCbH0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229E60A2617
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 18:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B229E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WIFyCbH0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so5205e9.1
        for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 10:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795028315; cv=none;
        d=google.com; s=arc-20260327;
        b=sRx2rWczAy4Van0OuEku4iaQtACudLvRErU5wZnZRRHBht77ZFBmoIkHSDOCmmYyZS
         lTC81mA37fCEIrQTXuUgS8XUkAXnp74JOGgbiRNXaPX2NgKyIt2JFEPokCGkHhSTB2zn
         RVAO5i245Q/DRs8w0iUdT2aUusDsFRXwUsnHA/xkSuGMY2m1kKyE9F+VxvvqcAr+dDhP
         g8Kk06AEqh1kP4OYl048d8JN7LOEMwrDe7THvR0KPyB/wnD1+fJffjFK2nDm4yQ3Cdeb
         aPJpXGCAdsVDQBtMwPUhhICFOd62tfxrcz3Q2OjKh+S2FSln7O4ZyfsW3kQnYFzCC2eG
         LHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        fh=OlbCofviahWzmqGxmfON2uMq6WJfjwbgXtOMItO++Zo=;
        b=h4JM00gTlFuP9o4MJ0QTeCyAjIqR7Su6HlI0S0Hji48vpsxzZfLvyn/I6gixh1cPpL
         gj2+B/aSn9YDHRJbC3mXcysfWs9LvAIdFT9b8X6Aqiyad6jrrVC6tEc/JOnRRlbbNaFa
         N+gpN9y6tsMEo+dZgsNq9GwXncAnwxdmy/nPtUqMirs6A1V8kAcbCERkkfiVGt9KFyeh
         KkynSrI9/CaoB/u+EUCepmW7qb31feBpJXHKtCWrPAVjUcfjYvD1z9wEnG0XvKx7B19K
         EACGpH3Dkjl3x8gWAQmt/WgXReUTUchCexISLMufg7G3O0e1/EZAiYrVPUbCoP65yQRe
         Q1DQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795028315; x=1795633115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=WIFyCbH0ubttJjUw9wZAy5M3U+2mXYVrOWc1qwGQRmi7vEWHAi5oRJHUQp91qhrNP/
         y9Rfv8ndolGxtVwnO3G1nUaCg+hyF0u7o80Zm6n4obPZb9f0OVj3c9wlyyciA5Mr0o1h
         sres3N/KHGmTkHWhmwSLvVIMWLW8ONaVs/26TA638lRTNYL7G3/oxg+ZLbDXY84yZ7ju
         EIOCrz7xYfyscP4MPbPADDhDz8e/npFnk3fnr5xOxiGLmGNaswebm7BsvscYQviRObkG
         Zm0RwW1HcoMpPA7nvGoLLef9H+pu+8MosmUvOLmCtOfyriFGuSk6uq/YfmcLahwkQX/X
         /frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028315; x=1795633115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=HcrOCiLu/wq8uNmkNolmwLxPJXslnueYff0WSDqhisYyHxL/HoDt/UduRTqxIdvoi0
         Ejrb5fPPKz8lMoaqwcZkzryfMnxydcm4ZNdToHnRe9FC4HJ5pWW0711ki8BCLqi8JKAZ
         uuQvUuDPA8S5Dab69dgKmK6opyj420zxBH+uly8yV95puwDfeFyE812CYqOEivhRPBQB
         T3XptbgbT/4PAbKOgcNLZPLUrRMlkd1OyldQ2b2ZnWcMzXzRIvxuogstn+1nEol1TLj2
         NadBjobZKS+W6fTOaX05f3h0rkqvCzJn0/ptiqrv8ZinknTkWcsojAh3uBR1OPvbKy6u
         UGdA==
X-Forwarded-Encrypted: i=1; AL+hErG64/f1gtjXf6DDfRmXq8gtk98sgcCaKKE6gIPj4KbVVEIEodCqlLCn4++zItyluzXRW3cm+pyr9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BOIPSOKrrJ3S0jWejX7lLizOkza42bg2xkh7y4JdX6iQoDy46
	szBPK8BSXfgxGolW4MKCuEZgFrlZ5hheJPzLZqXYuRgAfwdhjo0fhLtBqwpJap4l5w/5Ak9554Z
	ov6AkEtDU2RJB7AEoQoTAFEX4GH2p73ch3QZxb9RL
X-Gm-Gg: AYBFou1ZQwZbQEt2ZgPfoxDSvmxzT1v63R+cY3jct80iYQ4tdKysxtFWBkmKzUokcSq
	qbsz2TLfNdWDv/o+aJ+3sNtqBNQ7Xe4ObZipBDdeRMiktvC7WnedkztlOFqNOEIwwcmD/qiV1XZ
	BTbG8wz1uw4dFNbKD9jOzTXdavFrHh0nNDjbJEFdHgYo91qk/SW109qPIjzlxfw8pTDpL6xGu1B
	V9JsyC2krYXyYoLlWp9Wm3y2LQ7uk6lzMbDjL2sUr6DDbi440d+BF+CheUpoSuCvFn9eCUPQ7MD
	IUdU91xT5/6S8fLR7IUIb6nwth6doHG+i/h4xcFcEePQuv1nE4LfvJu010vJT4XwhF62nfHP4Js
	zhzyk4U7DyS5GmlL2XxwtUMkZM7pOcoBMlmZacMokMqjZz5uw/qXMGxwRPqzOPfc2UU+Ov+JLbB
	kkI+aBtzVQfgGA
X-Received: by 2002:a05:600c:840c:b0:49f:ddcf:45b7 with SMTP id
 5b1f17b1804b1-4bb83c9025emr23355e9.10.1795028313968; Wed, 18 Nov 2026
 10:58:33 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net> <20261118114102.490384-1-aliceryhl@google.com>
In-Reply-To: <20261118114102.490384-1-aliceryhl@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 10:57:56 -0800
X-Gm-Features: Aa3M54rtfthEgFiAPOcV53y3ZwydiRtVUQnZ06u4pa0OMeOurh1hyDTgkerw9LE
Message-ID: <CABCJKudrDOu3sD6J5LN4o3XF9JrU85pZK4DUXNH4d9iC363bEA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Janne Grunau <j@jannau.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > For a prime-imported BO with no `gem_create_object` callback,
> > `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> > drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> > wrapper. A later `container_of!()` from a `drm_gem_object` back to
> > `Object<T>` then runs past the allocation and corrupts the heap.
> >
> > Provide a `gem_create_object` callback that allocates the full
> > `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> > returned pointer is at offset zero, satisfying the `kfree()` on the
> > init-failure path. This is now compile-checked with `const_assert!`.
> >
> > Imported BOs have no userspace creation arguments, so extend
> > `DriverObject` with a `create_imported(dev, size)` constructor and
> > implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
> ...
> > +    /// Create a new driver data object for a GEM object that is being=
 imported
> > +    /// from another driver (e.g. via dma-buf).
> > +    ///
> > +    /// Imported objects are allocated by the importing helper, which =
only
> > +    /// provides the device and size. There is no driver-supplied
> > +    /// [`DriverObject::Args`], so drivers must initialize the per-obj=
ect
> > +    /// state without those arguments.
> > +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -=
> impl PinInit<Self, Error>;
> ...
> > +        // SAFETY: We never move out of `self`. Ownership of the alloc=
ation is transferred to the
> > +        // C side, which will run `__drm_gem_shmem_init()` next and la=
ter free us via
> > +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init(=
)` error path, matching the
> > +        // C kzalloc fallback contract).
> > +        let new =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(=
new) });
> > +
> > +        // SAFETY: `new` was just produced by `KBox::into_raw` and so =
is a valid pointer to an
> > +        // initialized `Self`. `obj.base` is the embedded `drm_gem_obj=
ect` the caller expects.
> > +        unsafe { &raw mut (*(*new).obj.get()).base }
> > +    }
>
> I ran this through a review agent, and it found these two things. As far =
as I
> can tell, these are valid concerns.
>
> 1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create(=
)`
>    calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
>    Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the s=
lab
>    allocation, but it skips running `Drop` on `Object<T>` and `inner: T`.=
 If a
>    driver's `T` owns any fields with non-trivial `Drop` implementations
>    initialized in `T::create_imported()`, they will be leaked if
>    `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
>    fails).

I agree, this looks like a valid issue.

> 2. `Object<T>::ALLOC_OPS` also sets:
>
>        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
>
>    `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
>    `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callb=
ack()`,
>    and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create=
`
>    (not `DRIVER_MODESET`). So `T::create_imported()` can also be called t=
o
>    create a non-imported dumb buffer (`obj.is_imported() =3D=3D false`).
>
> Instead of implementing `gem_create_object`, what do you think about
> exporting a `private =3D true` counterpart to `drm_gem_shmem_init()` (sim=
ilar to
> commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
> drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table=
`
> callback on `shmem::Object<T>` directly, and setting `dumb_create: None` =
in
> `Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Ru=
st
> across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` r=
uns
> normally on error and `obj` does not need to sit at offset 0 for `kfree(o=
bj)`.

A later commit in tyr-dev lets drivers opt out of dumb_create, which
addresses this part. However, your proposal sounds cleaner and fixes
both issues, so let's go with that.

Sami
