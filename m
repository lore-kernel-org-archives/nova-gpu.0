Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16E3AEF3A
	for <nova-gpu@lists.linux.dev>; Mon,  6 Jul 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358523; cv=none; b=G9XM8wZ8kdSMGFjSn5wREXJCXn/o7xbOHSd9KRL0oI9WRTYsEnJ+RVgi948vWaa3KS8bpKAALRaL/65TceyWWrbtTuI6rGSY+Vk7lbxQnWHt6J57JNpgyyEETng/M/Rdto/cZbVNBhD9acSECVKVyuOq3zAt4IVuD1wzyRZSnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358523; c=relaxed/simple;
	bh=gIkLlslL6KZpSvz2JbX07p9zcm1UCvMKeL89sVuBJYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RkQDPn2sfA06ZYjNuMYWA3CBKBCT6bax+y+Gvyuti6F4T8VPzuQr8suNhA3EEKNiKRSYU9v6TKtqUHHMsR8CElVq5I1b3RpPqHOO0+1rZXFDRPdfN7gMC5tSPiE2qL+o96Af6kP6t6SBmc9f08Qe0sas2a/+DaWe8VWKaU7hCI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WFVb2fe/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WFVb2fe/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4731a357b0aso2938608f8f.2
        for <nova-gpu@lists.linux.dev>; Mon, 06 Jul 2026 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783358520; x=1783963320; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltyx4avvqap+Z6tBDQrFmfqB8UZWvDnSqPOqoXvmQP8=;
        b=WFVb2fe/FfQUJEJ2GPLP+0A1rPIJmadj1VnqsP7pSF+wG/Ks8/nLqOAyv/jgo1D+Di
         YplU9Vm6GevKNqz+7aAWsrX1NrCaokiCW7jXqN5oTPMKwiZZVyuFKNIujz2/0ChJtB9T
         nLd3xgtkxSX+Rx+KDU6WXc061hWlZizfWMQzcFpew0S++RXbnWnBx+Boa2sRgZMU9DV6
         rq5MgpDX2Oq3g7RYpqnGAzPAnemkwjVDVcQn+9T1LnxciJ4ntbiDJlFu/0/mkg73U9UQ
         PLJlc2JO4Sfi4IhU25Vq07VUWffvdhDTLkVsmxLUujlHMzCa9/yXIKYEStF6aEAZtPCr
         Rnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358520; x=1783963320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltyx4avvqap+Z6tBDQrFmfqB8UZWvDnSqPOqoXvmQP8=;
        b=cYBHY2Jko3+XvAva08lqjh12NrUqSF208W2cvDbsT7BPJnNFUbo9RRVxv4c+2/iFb/
         7i5kSShY5u1wuUt3SUN7B5l4J2PStBx059YrwZpj7RWqccXNkHyNlujMmCrvus4SPeB2
         EUC0e5R1PuU/DX4dEtaGy5OVlNcVCXZi79Aa7BvUYuKBLUkPf39caKaiuiE+qVcjJ4QB
         DfJHlwL4yrJi/SJ7CbAYsJIfosuceyGA5di0fcRo0NtoVr3wcFQGMIbA8NBd/YKzfVYr
         48GWrQ8ybFhw4mTjHkVVasO0oilZIN86dhs/dfOdJ1xPt/Fix4foO/D9zMcpUWBuXr6G
         S/FQ==
X-Forwarded-Encrypted: i=1; AHgh+RraP8YWx0Tt2LMs4cbc/GPBL3x4/YL/xwAuro3IfWUXIbdTGfGupT4v7ZCt7YXNzq7Qqi60MyOO6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQJKJlEF+a7tuyK6hfVKZw+YwxDsZWQvoE7/A1MEIVy/JbftLk
	h+wpayXNjvw5O0pJFS1maVK1wDYvPhMZVMhmXXxusndd0WEtqdBs8qzF81LiJxKkpF88mZsB0RN
	jc6Xj5wRghLF4Kv04uA==
X-Received: from wmri23-n2.prod.google.com ([2002:a05:600c:8a17:20b0:493:d884:f722])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6692:b0:493:ca3a:d738 with SMTP id 5b1f17b1804b1-493df055a84mr19308675e9.7.1783358519892;
 Mon, 06 Jul 2026 10:21:59 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:21:58 +0000
In-Reply-To: <akvXzPd169ahMuCi@yury>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-2-84fe8259e46e@nvidia.com>
 <akvXzPd169ahMuCi@yury>
Message-ID: <akvkNuh2bHhFwmQM@google.com>
Subject: Re: [PATCH 2/4] rust: bitmap: add contiguous area operations
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
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

On Mon, Jul 06, 2026 at 12:29:00PM -0400, Yury Norov wrote:
> On Fri, Jul 03, 2026 at 07:16:05PM +0900, Eliot Courtney wrote:
> > Add bindings and helpers for area operations on bitmaps. Each one is
> > made safe by adding some extra checks compared to the underlying C code
> > (for example, checking bounds) and with additional checks to catch
> > likely erroneous usage if `CONFIG_RUST_BITMAP_HARDENED` is on.
> > 
> > The C code uses signed integers for some parameters, for example the
> > length for `__bitmap_set`, so bounds check against i32::MAX. We can't
> > rely on `BitmapVec::MAX_LEN` because `Bitmap` may not necessarily be
> > backed by `BitmapVec`. There's also a few cases where a non power of two
> > minus one `align_mask` can cause an infinite loop in the C code (can
> > happen on overflow), so check for that.
> > 
> > Add tests demonstrating the edge cases.
> > 
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> > ---
> >  rust/helpers/bitmap.c |  22 +++++
> >  rust/kernel/bitmap.rs | 219 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 241 insertions(+)
> > 
> > diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
> > index e4e9f4361270..dac5c03f2448 100644
> > --- a/rust/helpers/bitmap.c
> > +++ b/rust/helpers/bitmap.c
> > @@ -8,3 +8,25 @@ void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *
> >  {
> >  	bitmap_copy_and_extend(to, from, count, size);
> >  }
> > +
> > +__rust_helper
> > +unsigned long rust_helper_bitmap_find_next_zero_area(unsigned long *map,
> > +						     unsigned long size,
> > +						     unsigned long start,
> > +						     unsigned int nr,
> > +						     unsigned long align_mask)
> > +{
> > +	return bitmap_find_next_zero_area(map, size, start, nr, align_mask);
> > +}
> > +
> > +__rust_helper
> > +void rust_helper_bitmap_set(unsigned long *map, unsigned int start, unsigned int nbits)
> > +{
> > +	bitmap_set(map, start, nbits);
> > +}
> > +
> > +__rust_helper
> > +void rust_helper_bitmap_clear(unsigned long *map, unsigned int start, unsigned int nbits)
> > +{
> > +	bitmap_clear(map, start, nbits);
> > +}
> 
> All three are the wrappers around the regular outline functions:
> bitmap_find_next_zero_area_off(), __bitmap_set() and __bitmap_clear().
> 
> The inlined version in headers is optimized for small bitmaps. But the
> optimization is all based on inlining in the C code. It doesn't work
> if you wrap it with a rust helper.
> 
> There was a discussion about the similar find_next_bit(). The function
> itself is an inliner, but it's a wrapper around the true outlined
> _find_next_bit(). So we decided to minimize the binder size for that
> type of functions.
> 
> Please, keep the binder minimal unless necessary.

If we can just call __bitmap_clear() without any downsides, then I agree
we should do that, but we actually do support inlining the helpers now.
See CONFIG_RUST_INLINE_HELPERS.

Alice
