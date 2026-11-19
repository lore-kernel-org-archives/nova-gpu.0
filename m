Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087071;
	b=MqWFQgk946lN4BRxmt0Lhk9/csExD+RGXZnK/R1Z0Ebj4JMmxY4efA+EL3gvF8hcKEVy
	 /hX7jeINAmSjwIgEdEb32ABsJtds7uPb/oLC0Z+8RDRlETto+E5aFwbmJrudAsixmE3Rd
	 f7PXUUIPkYLtRnYRjO23deiiGqyc3p1L4YR7GhCuKLYoPXpUDWr4bxSWeKhF2wRFDG8K2
	 712ABXGlDAlhis//LOx9K0xUlUMaFCn8v7v2nlP8vUizVXUfBgfgqEhpgpkNCjR1hf+0y
	 egdgzR3P781zD0n2xbPk5L+QXD91d8BKVKIvaGn+nNODy8lcgagK9l/eL51eWCMyLtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
	b=GNuqspqEKwWLxlJe4CrP5b3HsGvVCF4L0PrfUpEunMIhksWP6L7ckkoRlCpc/js0qwz4
	 lKrX3v/DBdCcG4+f/27q0hVJrXUar18LXHZyIPhAJhpDq7zgAut1tEKSIsx/Z35J00/K+
	 Vxm8vIE1CqUc/MaJXvLq0jIt3fGUN5Zd78i3366PZWTsyunoWUfMVFJPJJznvvsBZg6HD
	 X1UD8Pfhl8tMFD13E9ogj7lDJhdLO8bSjsA+5eFSlOjwAg3TxR6i+vbA752g2GrVVpr/H
	 iMPBWd5mB9++g35LZvDAnmyDQQiZ9KKKeTjEUt8y3V263MufkYcVv+sAeTLto+d1DNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEjyWt80;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE4606A325
	for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 11:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFE4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEjyWt80
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso334331f8f.0
        for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087069; x=1795691869; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=XEjyWt80eADkPRs9R5+/TWFJcD1/uKGF0nI+GsfKx+n8QVB5/LGdPrCFhU0GPN1gh5
         1EhWRFfeQuqiZnDkROkSS2vAVKhYcy16tpEXZUjzJv2ALfwFCL9gBUhdYE/NbCXFsX8c
         hC8LO7tmHvsbggegUYH9MMyrQopIe3BWFlLh0GCgCG6V1HG+cei8RV+Ldjiro3cb8J0/
         LE9gm87nVGNbVP7avYR3LYK7wTYVmCCWW+huro1SlRMJMMSP48K1CSPN7FJNOAiuROJB
         bfZlJ96aa6XZKeGYipcEVEFM99s/viABVeDO9FyAv8LSZSjxGHoj59+rNZdSPjQnTp2v
         8g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087069; x=1795691869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=pTDIxCoOPlB0PEYKMWY6BDUos3pw0rR09OrEJHY1AV7KrIBZZquJhLA6EnhqAYs+M6
         JJSRA29S+mHGbRqMggI9ALdb/KMRHJ2urg4+GZAXBJ4wJJxVhSEG6/rKMaoLaKTwElde
         Yg9vYoji19InLi13MGTyYE3TrRZXRjMm88Vl/pPQzGLHnaTqIiuDCfooHFE88F0ZmCCy
         JDtkvg6T3oXTa3koGcx7+qKYvYH4PFVPrvjv/6JZjD+AID5B3NlP26F8YKK20taVXcAn
         kosSGeCyRBnkyEpc3J0+qpiF17NOog2ROG7bfFexPNKxzWkWzLmP3ZuWHyfHoXJPAmLP
         rztw==
X-Forwarded-Encrypted: i=1; AL+hErG2tPT9CDKvhhJkKw+Dc/mPLfXYPkwvgxvCqjZ/j4nCpawncPf7T0alxv7tSD24ydd+KIzhv99SCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8efjRtj56pYDBSI51/flpTYH+VrYDFPXtLYpXQHnqZEsVLmBgU
	o8sMoT/h4M4IUn4lD+QpRp1oayGdTNYAtMSD9aeGYGxFc0eJSRE+xJUpKDTQR2zdfjdaJsq3EhG
	bYbDxuxQFwAPy8zhhkA==
X-Received: from wrwi10.prod.google.com ([2002:a5d:55ca:0:b0:4a7:4b90:c045])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0d:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-4aa544edba7mr2116016f8f.8.1795087068558;
 Thu, 19 Nov 2026 03:17:48 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:46 +0000
In-Reply-To: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111746.3049044-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> Driver::Data is owned by the reference-counted drm::Device and can
> outlive device unregistration and driver unbind. Driver state belongs in
> RegistrationData, whose lifetime ends with registration teardown.
> 
> The intended model is that, after drm_dev_unplug(), surviving DRM
> objects (e.g. through remaining userspace handles) no longer require
> access to the driver state. Thus Driver::RegistrationData is available
> (and sufficient) for all DRM callbacks into the driver.
> 
> Remove Driver::Data, its storage and Deref implementation, and the
> unused workqueue implementations that depend on it. Drop the data
> initializer argument from UnregisteredDevice::new() and update its
> callers.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Makes sense to me. Both in-tree users had `type Data = ()` anyway, and
nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this is
a pure simplification.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

One small suggestion below.

> -        release: Some(Device::<T>::release),
> +        release: None,

[...]

>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
>      _ctx: PhantomData<C>,
>  }

With `release` gone, nothing ever runs `drop_in_place()` on the Rust
side of `Device` anymore. That's fine today since all remaining fields
are trivially droppable, but it is now an implicit requirement on the
struct: anyone adding a field with a `Drop` impl (or a pinned field
that needs a destructor) would silently leak it.

Could you add a short comment on the struct along the lines of "no
`release` callback is installed, so no field of this struct may require
dropping"? That way the next person adding a field knows they have to
bring back the `release` callback.

(For what it's worth, I checked the lifetime-parameterized `File`
series [1] against this: `open_count`/`open_count_wq` are both
droppable without a destructor, and the two merge cleanly, so no
ordering constraint there as far as I can tell.)

[1] https://lore.kernel.org/r/20261118163203.2483856-1-dakr@kernel.org

Alice
