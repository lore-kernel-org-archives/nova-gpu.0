Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CBF3EDE7D
	for <nova-gpu@lists.linux.dev>; Wed,  8 Jul 2026 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544898; cv=none; b=NHlwUu/eVWKVQZrlvdp6eA2W4tNUcIA6HLMkd9za4+j6HcK8etmwSlJYUS0/eUJaLh3OwOpj5ZWq+s7Ip7J8rmzSJzT7DJ8eG2h+h80WJck01vWYXDDx6UaGTjnk8SgEm7dLgU3IJ8Iuna9Ri1Q9GNdLKVv9fL6u/Dz57JhEp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544898; c=relaxed/simple;
	bh=biBH4PA9f5DhTc+4g0UROR8IKEhkILOsC139oJpGl6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bcQ7NGaUB/751TY4Hd2xwA8qXFP69Cw320XdMDG3BkQAFA9wr90N90OT+QhTyVF+t9kvitTwelFxN9pQZoNuiZsDhhWxG+A5Dl6xEOdvKeC91uhZiPaQnP52kGuTUCtivY+fJIo0VfIuH3DHJSIaU/gdRIdQJdGm+5GUUQMWjxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwEbupbd; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwEbupbd"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-69aa09b90a1so1043692a12.3
        for <nova-gpu@lists.linux.dev>; Wed, 08 Jul 2026 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783544895; x=1784149695; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsxGWakqJeFwM90VS2bi5xlkNUrqBNf1v+hlTXOW8K0=;
        b=DwEbupbdBQC/RST/h3Z87/QxMKUyV41697idgMssxZyVqw0N7k3VMpKyHPb0VT3yHW
         sWodHzdYbhU4KriRNuqtvvmCYpPmUqtZly/Rs5p8PKHKpCsmbc8IikEWw+7OQlzav6yn
         4drUIo4TjCRWmnYOIJMIR1jy/LJDdlMg6i66jYZlvBSpXvQ0lgZzOpR17I31XmD7CwG8
         U5wMeFlg5PN9XPUiMAaDjDVOcgZ38/R+LifgfAd7Yuzw3z0KRV3pBdfIKWJSVSZaHfWY
         3xrS638Q/Ch/soITGiBVht7zurIzgruVM+q2RT2vhMRctXRyxp4CkgjefuYFhpOZ0AQw
         SGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783544895; x=1784149695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsxGWakqJeFwM90VS2bi5xlkNUrqBNf1v+hlTXOW8K0=;
        b=pGlywhHEWHg5Mb09Cn/WizZQnh3yrEO0YqONQSBTQA4GkFoHSAun8JT9k88xLXMR8R
         sGlbZf6ytFsnTjYRPe3hrX57t9YAtaNT5QWXF0Xk2ehc5TVBE+YVVPQwz+f6redM7dVt
         Xsu/BKmtxmdtjfNcqEOQOI2PA45hcaOZbk7B5F6LeX3cnSOx/9nykK8DH8TYkWXfODf2
         kqlnkhXhj+VG4VzYETJTfzNvGFceqeE+lvb98uUyUaCH2lhqmkBsq1o5lOw2CvlAYp0I
         s7v75/zV7FFoDACWPtTNO2/hc/1hfWqS0NW4sxN+a40OAtr7qeGrTmDzzi/ZuQ9HMDMw
         vAOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxp1XU7deYBp8gSJiBu9xOWBgGHZz0TGQv6vgS85TeUb2ZFuDwmo5QkC87wUCAstGRrm3XXYwMLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdiW4VsZVMKFdFrMKD8KctgsatGBiYzlD5I//5VZ5n2zuCgNne
	a1wGOgLW6YEWBvGOfe7FlrD/67+IOcG/5PTCAlZZc4WnR5syot/N64lOuuJKr4MkuHfJL+r/3Il
	+N+kYs1uQuEztvW1XHQ==
X-Received: from edaa23.prod.google.com ([2002:a05:6402:24d7:b0:698:c1e2:568b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5114:b0:698:5f89:9a51 with SMTP id 4fb4d7f45d1cf-69ab4453a86mr1833185a12.5.1783544894902;
 Wed, 08 Jul 2026 14:08:14 -0700 (PDT)
Date: Wed, 8 Jul 2026 21:08:14 +0000
In-Reply-To: <ak61Embrj0qH1vas@yury>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <ak61Embrj0qH1vas@yury>
Message-ID: <ak68PmjY97BHOZOd@google.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>, burak.emir@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>, Eliot Courtney <ecourtney@nvidia.com>, 
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
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 08, 2026 at 04:37:38PM -0400, Yury Norov wrote:
> On Wed, Jul 08, 2026 at 07:33:16AM +0200, Greg KH wrote:
> 
> ...
> 
> > > I asked exactly the same question when Alice and Burak added wrappers
> > > for bitmaps to implement their ID pool. This is the answer:
> > > 
> > >   An alternative route of vendoring an existing Rust bitmap package was
> > >   considered but suboptimal overall. Reusing the C implementation is
> > >   preferable for a basic data structure like bitmaps. It enables Rust
> > >   code to be a lot more similar and predictable with respect to C code
> > >   that uses the same data structures and enables the use of code that
> > >   has been tried-and-tested in the kernel, with the same performance
> > >   characteristics whenever possible.
> > > 
> > > And now it's in a commit message: 11eca92a2caeb
> > > 
> > > They measured the affect of their wrapper on performance, and it appears
> > > to be ~5%. See lib/find_bit_benchmark_rust.rs.
> > 
> > You are comparing the C vs. Rust data structures here, which is not what
> > I am proposing.
> > 
> > Also, is this code being used on a "hot path" like the binder stuff is?
> > 
> > > I didn't see any side-to-side comparison between any native Rust API vs
> > > imported C bitmaps. I'm sure, I asked for that, and I still believe
> > > it's the important piece of data to avoid this back-and-forth type of
> > > discussions. So, Alice, Burak or anybody...
> > 
> > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm asking
> > to use the C structures like maple-tree and idr instead of open-coding
> > logic around the bitmap code.
> 
> I understand your point. I asked both questions: are they sure that bitmap
> is the most optimal data structure for the ID pool, and if so, why not use
> the built-in Rust bitmaps? The answer was: yes, it's the most optimal, and
> using built-in bitmaps is suboptimal overall.

The Rust standard library doesn't really have a bitmap abstraction to
begin with, so if we want to use bitmap then it's either handrolled
bit-manipulation or the C bitmap api.

cc'ing Burak's new email

> > > > > > Why isn't the built-in idr library being used here instead of rolling
> > > > > > your own data structure?
> > > 
> > > Now having more context, the ID pool's primary goal is to allocate
> > > individual IDs, which naturally lays on find_bit() API in C. The
> > > native Rust alternative is considered and found 'suboptimal overall'.
> > 
> > Allocating IDs is a probe() thing, which can be as slow as it wants,
> > right?  Or is this some other hot-path where performance matters?  The
> > patch was not very specific as to the tradeoffs needed.
> 
> I am a bitmaps maintainer, and I want them in Rust to perform equally well.
> The ID pool case was just the first user. Even if bitmap performance is
> not a critical path for ID pool, my role is to make sure that bitmap in
> Rust is implemented well, including the performance part.
> 
> Said that, I recall that bitmaps performance was important for the ID
> pool, and Alice and Burak spent some time optimizing the ID allocation
> path. Particularly, added a logic to avoid allocation of small bitmaps.

Yeah the Binder use-case is not the same as probe(). It's a per-fd data
structure used to give names to kernel objects that userspace is
manipulating, and the mapping is per-process.

Alice
