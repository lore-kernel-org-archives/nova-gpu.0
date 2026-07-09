Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D73EBF13
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587691; cv=none; b=Z++MRf9NXcwdYpEdvO9Wg0rnAWWgTThd+zgF0T/9FYbDeZSeZjMZ+AoXLKGZ5jLomNSfgbyp44NED1EY+9HNNpVhxA3u0G52MW3Nv1D9HPn1gLrQBTl/j33tbRf6kLE1GJhLAku7/pyX4GGJD8RuFHbuX+jZpG4Neg+N9w8CW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587691; c=relaxed/simple;
	bh=zGyveR2WbexIXAL5cH6LAz1O8Yy1Bgi6o6rA6JtFqEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ayrx7KCM2VGBX5xjx94jqK2QvzBPwSdI26Eqq9gH1F6t8aRnrEaiYoUp6q5YCyJ0i2+7sUJlAvEMXO805GaU7hroYKS7wtJNuhyHz2aWu2EVNwXfqMmyYO8+VGoFrXzy4DFOIezUVeCmwoLlfTirf7nozLxyPa2ur2yufZZE+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F1a5p5H5; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F1a5p5H5"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-698a99b6140so2311221a12.1
        for <nova-gpu@lists.linux.dev>; Thu, 09 Jul 2026 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783587688; x=1784192488; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKWh2FN+uopuAMuLcrvUAZLjx2pCwGenf//G8cQsjMQ=;
        b=F1a5p5H5HQSBU1rjt/3+m1k9m0WhV6cYakxfwc1P923EAJFqWaOzrgoZCP7aGjXJhE
         +9B/XdUpVNelTz3J6GVavS9wSOxyEiXv3syethmnsM21Fupw47uEel+yk04ZkufRDnTu
         WYuoSI7psQK7BC2hyaHjQfVvDKSRTKd78h076gkdvAfJvfMG6/LCSNlVPIGWoufjCfZ5
         2cw3+DF1PQjLJQvwLm7Ni7NkMIMRHJFfvJB1qGqJKNn+Dxs2YEjWm/aympkMIz6uH1HH
         7iXc0sUsGlX5DID03XagNi417zW2AIXeozNFFOcxI/r/NuEDe2cyD6j66fuzXkw4xG45
         xdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587688; x=1784192488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKWh2FN+uopuAMuLcrvUAZLjx2pCwGenf//G8cQsjMQ=;
        b=a5MKJZylIuFQGMDRIlufY1RuBtiSsj2VwZq6hDrD4KWXG6WQB5ZIicY6S7G77FMQl/
         BH35mwEDyARgb3dztLGaWsEKl+gkHk7MG2HHzDNsRa/Ot5xLMfNk/zEtaMTULr1KLtUT
         1Fwh4T7E+2VIN4rwqSTxwun95zRBL6IHpSKaNIbCK1BGIHgLsHYBhJgS8OPSXqUUPxgT
         HTmwqSo2Q5Aj+LNym7eLC5TbFpvqUtIk3M2/JFg+2cwziVx86fZq8WQ7BGUrS8KdQR3j
         SL+31kjI7fgUZbu+ZJXScVGn48asFBjTBtBz2n+lwpoOc1jssKmIZeGCVBJ4zWVIXa/A
         2f2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7OLyiktuGpFBmhGp7ckei29jpXmZIHtlOXQ+L8OA9f5Q6RIhOG5jgjQNTkMM/LRee/1OM4DgatQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGjXX65cLiQvOkVIE3QdHT9r7aurXBGAAO4gZQXgfk5SPQlD0m
	4TpzAelsTGUgqLLOrqRUehVG2W+uQVbAqUEB0G7iBnzgXTFGlyWtL8zxOxaMdrf1wrD5Owfahag
	r4OTBOOflUGgA8XgU2A==
X-Received: from edfg18-n1.prod.google.com ([2002:a05:6402:a252:10b0:69b:3a15:6755])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2b9b:b0:69a:57fb:4783 with SMTP id 4fb4d7f45d1cf-69ab445ed4cmr2326024a12.13.1783587687331;
 Thu, 09 Jul 2026 02:01:27 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:01:25 +0000
In-Reply-To: <DJRP4CD15MC5.J47HDEUJS7V1@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-2-84fe8259e46e@nvidia.com>
 <akvXzPd169ahMuCi@yury> <akvkNuh2bHhFwmQM@google.com> <DJRP4CD15MC5.J47HDEUJS7V1@garyguo.net>
Message-ID: <ak9jZe11r-A4oVf0@google.com>
Subject: Re: [PATCH 2/4] rust: bitmap: add contiguous area operations
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 07:22:27PM +0100, Gary Guo wrote:
> On Mon Jul 6, 2026 at 6:21 PM BST, Alice Ryhl wrote:
> > On Mon, Jul 06, 2026 at 12:29:00PM -0400, Yury Norov wrote:
> >> All three are the wrappers around the regular outline functions:
> >> bitmap_find_next_zero_area_off(), __bitmap_set() and __bitmap_clear().
> >> 
> >> The inlined version in headers is optimized for small bitmaps. But the
> >> optimization is all based on inlining in the C code. It doesn't work
> >> if you wrap it with a rust helper.
> >> 
> >> There was a discussion about the similar find_next_bit(). The function
> >> itself is an inliner, but it's a wrapper around the true outlined
> >> _find_next_bit(). So we decided to minimize the binder size for that
> >> type of functions.
> >> 
> >> Please, keep the binder minimal unless necessary.
> >
> > If we can just call __bitmap_clear() without any downsides, then I agree
> > we should do that, but we actually do support inlining the helpers now.
> > See CONFIG_RUST_INLINE_HELPERS.
> 
> bitmap uses __builtin_constant_p which will only work with pure C inlining and
> not LLVM IR based inlining.

Ack in that case using __bitmap_clear() from Rust definitely makes sense. Thanks

Alice
