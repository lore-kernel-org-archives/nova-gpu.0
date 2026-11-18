Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002066;
	b=N7Tl/Kz1LT2lBs6+ZdT6r34m+bhS7drDSaM4OBJu7FWOAM6Tr0TuTYCAGtR0kfgRjv1X
	 HSy/ld8O3vUp7dDL6Gz435DPc2FF6KpRWw+OSByGuoo6Yk2AhqdsXen+B8fCOijvcgiaB
	 X3eoatu8KOffU8p/B2xpryLbiLiM39HyeKhFBQRmSAEsXrGFNK39bjBATvdwnoXwRccpO
	 Ez58rJ+nmkXuH8bIn82wkvJliwpD0BKYTeusz/vWbkXi628HizUNWvmVSyFX5Yt69FNUs
	 N7EtxuvhJRSx6AEZuy+EyA8otfYkmNvKkeWE8l7WFMvPfXs9FN80EQO9pL9njp++Aag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
	b=KgV7vjuw96bgPfRvdHsMi93uQNJ/49/U6RzkVO/C38njZXHh12Mi1S9zmSUIC2M7HYpy
	 OqhAmv2IkdVSu5tZGk+oRuwZShcTIDD6z7ZNDn1TzBbvOPfaTPO1l8k9raVn1TOl8d2tS
	 Mz8lpJrhiwb2QXBIQ22wVGRfTVrJPe1s0o7ZrN03d+5ZMnvCkTF2Vl8djXAdYx9BEeFNJ
	 2IMrgP5mF2iu2qQe/Y11mwF9X9tpPIEf985nOvPL2SD86P+Yiu18H1V//VGZSav+ljV4a
	 VPvG+sgQbINWh9qdtaYghYCAMRG7F72afaiNgSAiuN295qXsL7RE5U4TuUCulaARmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fJC6va6o;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E1606A32A
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fJC6va6o
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso6467505e9.0
        for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002064; x=1795606864; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=fJC6va6oAq4LMndab4UbQDarQG+0xe1hk7k7KUkekKozbdzyyD6Nwv9SsMxBz64KhF
         lXrzJDLl7mfArpWrz/lq81v586nGAvI35//LmlzLzMiZ+bjRmEcEvU3lgKVN0xC1wmfq
         tApw0sDQQbieiEsJKP2CBJGt///NsJbsLM2jS7MadWi2BqsvheUXsAMxAz0RBcz7XQJe
         95ElMtEynyEaG6hFzYNMKmKIM2GdJXH15lAzmWgOrizRnMU4gTXLjWRVBxJrh8LwDRaC
         u23Q8bDcAQQLtiDiFQ8lsj/nJC7ZoL6EXVFWZcd40s0RCXS1++26odkAiS05h2N9q+74
         cNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002064; x=1795606864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=TRpYZiVHLK18b4WiqBbIDvAhQ+hOABfIGXBAbGiVPL7Ro1T5WJ5jfv40ofu6D6eZPo
         w6tQQpVu6nmhQb18ELn1jcjNsDYGHyuyNQhel6WHv9XXkIMjrozTewZHM/mMhPU+4w6r
         rxLabrof4+vIA82+tdVlPtAlmvOQxMUdzebOC4CGYULVZhb44o3pDP7/YXgJmN1rMko6
         GyqsnJlX2Gpj8P+khH5LZl/ap5H2B7sMGEL1YvlmLTuEz8etoplMaGOQlFrznCteTxlQ
         D82fqD2pBP7Xl10YRhrPCefimgMKhV73sMNjDFlA6BdNfbmneTQ8BQXgMBtcahQzEEd+
         2GoQ==
X-Forwarded-Encrypted: i=1; AL+hErHHTXZqWhfNA6SYKuh4s2g1TogeS70N/dx7Kv1n3CUJeiYwPqjLp3EWU0aUPbLk2c1bXK5i1l5aEg==@lists.linux.dev
X-Gm-Message-State: APuU4Z93oNa0F1UeILdkJxrag5zjKOBr+i53IbRmS51/0lp2x4S+3IK+
	b9YoUKlcrrjML3zDMXreid6bnXmxgIMENAQ2FeWD4dlBaD9luPhsVXXKeFN+lf6ovuBQCVrhQS3
	aFqyT/cUS0SDESr++yQ==
X-Received: from wmbhb15.prod.google.com ([2002:a05:600c:868f:b0:4bb:5d5c:ab85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb7d6cd41amr41190555e9.4.1795002062763;
 Wed, 18 Nov 2026 03:41:02 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:01 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114102.490384-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> For a prime-imported BO with no `gem_create_object` callback,
> `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> wrapper. A later `container_of!()` from a `drm_gem_object` back to
> `Object<T>` then runs past the allocation and corrupts the heap.
> 
> Provide a `gem_create_object` callback that allocates the full
> `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> returned pointer is at offset zero, satisfying the `kfree()` on the
> init-failure path. This is now compile-checked with `const_assert!`.
> 
> Imported BOs have no userspace creation arguments, so extend
> `DriverObject` with a `create_imported(dev, size)` constructor and
> implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
...
> +    /// Create a new driver data object for a GEM object that is being imported
> +    /// from another driver (e.g. via dma-buf).
> +    ///
> +    /// Imported objects are allocated by the importing helper, which only
> +    /// provides the device and size. There is no driver-supplied
> +    /// [`DriverObject::Args`], so drivers must initialize the per-object
> +    /// state without those arguments.
> +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
...
> +        // SAFETY: We never move out of `self`. Ownership of the allocation is transferred to the
> +        // C side, which will run `__drm_gem_shmem_init()` next and later free us via
> +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init()` error path, matching the
> +        // C kzalloc fallback contract).
> +        let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: `new` was just produced by `KBox::into_raw` and so is a valid pointer to an
> +        // initialized `Self`. `obj.base` is the embedded `drm_gem_object` the caller expects.
> +        unsafe { &raw mut (*(*new).obj.get()).base }
> +    }

I ran this through a review agent, and it found these two things. As far as I
can tell, these are valid concerns.

1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create()`
   calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
   Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the slab
   allocation, but it skips running `Drop` on `Object<T>` and `inner: T`. If a
   driver's `T` owns any fields with non-trivial `Drop` implementations
   initialized in `T::create_imported()`, they will be leaked if
   `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
   fails).

2. `Object<T>::ALLOC_OPS` also sets:

       dumb_create: Some(bindings::drm_gem_shmem_dumb_create),

   `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
   `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callback()`,
   and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create`
   (not `DRIVER_MODESET`). So `T::create_imported()` can also be called to
   create a non-imported dumb buffer (`obj.is_imported() == false`).

Instead of implementing `gem_create_object`, what do you think about
exporting a `private = true` counterpart to `drm_gem_shmem_init()` (similar to
commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table`
callback on `shmem::Object<T>` directly, and setting `dumb_create: None` in
`Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Rust
across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` runs
normally on error and `obj` does not need to sit at offset 0 for `kfree(obj)`.

Alice
