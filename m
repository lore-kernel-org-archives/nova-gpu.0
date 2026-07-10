Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD42F28FC
	for <nova-gpu@lists.linux.dev>; Fri, 10 Jul 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696173; cv=pass; b=fMoX+3aVkXKi4fplPO8Uy3XkaijawXA/WhAzpwvgJpWOFZDuoIen4vddRotSKQJOocZzT4jKFvlo/3Bbuisl5UYt1CUTZPt2Z4Vf0MturVuw5snA0Hs+shCswQA0FvefzMbHfF2rVOU1QHq8FbZZM9pVPy+YWQGRQl4Nj/Z+j8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696173; c=relaxed/simple;
	bh=wFZ3WcatDhR5uImQkZGjiMV/Fklf+6X2ZjKbOG/rOjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pv8GWtMSeJuQx6De8ecljLq2c/1qh00JVj/kNZ9J32DigTNRAB8Jq2jW/qGAAC9b9N/ejtZZSqv8O2/Ah0tjQj0YM2FXXph8vyKlrMkIHgDR6Hjd88M05PanC7Gh2msXVJuttt0BFvK5rm2gdw3mRpJO/iPV58oM2gj5SU7j0TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3B7C6fq; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3B7C6fq"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso442119e0c.0
        for <nova-gpu@lists.linux.dev>; Fri, 10 Jul 2026 08:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783696171; cv=none;
        d=google.com; s=arc-20260327;
        b=gnNlIgf+n2NFxqrsswznVWvc0ixDC1R58nhnEs+d3mk58k978712Z/g7dyHqkOT5xe
         dVU4y56iexDGFizJ5+Uvgul8NdgQH1c8y01M4K5LhwYQq3iKVryq+gZA/lW9sGPC1nAx
         Us+BqSZaL84+hqa0E/SY+2jrq77LOFGqN/tZdQ8Lg1xTRLtPxQTC/lQgGooSTyBG7Mil
         1IbIFiS/OvnxTz0GfkKdUaF0b/bXq/wd9sBBfHIfIKxd9bowfLNhtE5Vu61So1Zx4+SO
         NZQuzNwN8NVyXrdrFBuhrSFX7NtcVLAq3pq+bSikMKtnJngz0/CMPyqM3jtGmqZeFQ2p
         pyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        fh=qdtWzm8fSP6Jq/t0pZfsA19qt6PYeuorCTj7GdEEn8U=;
        b=Yz8kxmMlo46/26jQm89TfBQSX4msX0TMpeaTuHZ4NK2UP7IA4d1lEpR89YfF2OIm1O
         PwKvyVFdPrT0gyxbkvLz4Yg7ppUE4YsVm7+GcK43GLVswu/y0X3BNiwXKtiRDRykPnSL
         rg7WeREdxU+UYVKsDxjxsasBndLYT2PeDmgKCBYZ7xKU/BH83LoOS5Wq4wy219XNN414
         GYQv1LjXh3dD60C/TcXxxTqN3KTm80sBiTxx72iaOpDxZgVxpS4CMuPxmrs/3GFNzDkb
         xBMHoi4Gf894I5A9zwkbGCSd7Lx5QpK0p3kTWJk6b5H1TKD5Q1nap5Q2YiNXDvTxtJgx
         LDRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783696171; x=1784300971; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        b=X3B7C6fq47/lUzp0MVeW/lYgwbYgPXACwqC5G93prY0IU4JHGkYXdfuQ6q3C8cDQIi
         JsXL5hAwhnttB+aCkgeArWDToWU0i9+2DVAEEjNPMbsy/2WIthL09QSDh2W1EBWnSoqs
         5SZSinSh7bJm+nz6I1K5JWGJehGqdisJAVnqrSGLGyt+Yxk4sr3sdlqkpBkxe7fJVlnv
         sunvhXz250Tyu/Xttk5pdYjB+GjhBtIBw8C0/guijhEw0Bwxx1hP8KijSpkeAnXS+le1
         y7lF6rplk8Ho5kyY4aDBgQBJQ+HU0UjhfjDEvW96gK7KQd0xpdCxQcWpjNYHTSsNH1Dr
         kKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696171; x=1784300971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        b=Qz3yesDIXac3RQoz/oJ/XoRQ1N6D2czHEnKa190/bNjW1osqrdwuYn1YK4ZptlOQ2V
         GzpUTdpAq15K/t4q17SvIqEIKIk4hlORxYipFZVBXpsT02zGEoF/Wuq1X2pG8j/MIxls
         oXd5oJp5FO8VkESXshwQMr9ynpKVpAcLzFpytF9MCooXdzUEsanwoFyAu5D5BvRYbE0c
         yQgu8sx8oUN+TmBZjlqH1PQzoNgWhz9VBkAZfrQdh6dBaAOuUnOUm9o3U5S2xAdvpC8b
         HRS/+LyRBWTHt0aG7wXtfy+cc73Myb302mAde60z4l0Acivc+/e/nn2pECBbqHW+bFh1
         CCpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1MOz7iquuWZEbzAHgyUddamPmSavLJ4ycdmS+F2oSrcHxlLZodPSf8FLkNJdk4JMNlkuG/HlzLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1U2dVkYnBGt8r/YDx4JbVjDczj6rQb9/lWhcWDfhrivpM/+BD
	aBgUY6be0gacz6AzBOfda9sq/yPj6n3rIF6h35QdA1uB1kDKOxEk3cLJwMQOHO7CDpvyaQUExnG
	i2Qxr7vpBGYOYcs84fy+6rX11r/iS9BWGhEzufWGX8w==
X-Gm-Gg: AfdE7cnBXq4i6FySdZjTg+RERqyDEda7gWpkhRUCsI9AY1DMbVRGULWvzWhsuoT3b8X
	njrepdxdvU+FLFBKu4ylgSL89CSK471SJVXuYXBjy7O3Y1KQYsO5vgCohoHSEpH0LrOXI2wMy+R
	1ukJrlRZppZ7iz2UKPGHfl38l7kEfhlICYdovLSQ6/MW3bmcwMoHX9VyFeuLslwe2QB+vqxg0Ox
	UETUxNU0igAXTMUb9M/9oa9DNslQY7ZUxK+Yx5yGkqNqPB9WPlAWx99sADbVZduksqEBx/YrvIQ
	y+6D4BWjcpz7lJYBHoEjZtm9dbz34IU0caqZRw==
X-Received: by 2002:a05:6122:2883:b0:5bd:81fc:ebe9 with SMTP id
 71dfb90a1353d-5bf75a9fa9cmr6210645e0c.0.1783696170828; Fri, 10 Jul 2026
 08:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <ak61Embrj0qH1vas@yury> <ak68PmjY97BHOZOd@google.com>
In-Reply-To: <ak68PmjY97BHOZOd@google.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Fri, 10 Jul 2026 17:09:16 +0200
X-Gm-Features: AUfX_mz71O6wKNiBjknUzlHPuRHRfhmrp1Ke1wablmRwTKjPL09QiGzeg2wSZG8
Message-ID: <CABwQupO-vow5+SqHUpyXZouP=rjNL3cuV=yWkK6v=xLt0MKEAA@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <ynorov@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 11:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Jul 08, 2026 at 04:37:38PM -0400, Yury Norov wrote:
> > On Wed, Jul 08, 2026 at 07:33:16AM +0200, Greg KH wrote:
> >
> > ...
> >
> > > > I asked exactly the same question when Alice and Burak added wrappe=
rs
> > > > for bitmaps to implement their ID pool. This is the answer:
> > > >
> > > >   An alternative route of vendoring an existing Rust bitmap package=
 was
> > > >   considered but suboptimal overall. Reusing the C implementation i=
s
> > > >   preferable for a basic data structure like bitmaps. It enables Ru=
st
> > > >   code to be a lot more similar and predictable with respect to C c=
ode
> > > >   that uses the same data structures and enables the use of code th=
at
> > > >   has been tried-and-tested in the kernel, with the same performanc=
e
> > > >   characteristics whenever possible.
> > > >
> > > > And now it's in a commit message: 11eca92a2caeb
> > > >
> > > > They measured the affect of their wrapper on performance, and it ap=
pears
> > > > to be ~5%. See lib/find_bit_benchmark_rust.rs.
> > >
> > > You are comparing the C vs. Rust data structures here, which is not w=
hat
> > > I am proposing.
> > >
> > > Also, is this code being used on a "hot path" like the binder stuff i=
s?
> > >
> > > > I didn't see any side-to-side comparison between any native Rust AP=
I vs
> > > > imported C bitmaps. I'm sure, I asked for that, and I still believe
> > > > it's the important piece of data to avoid this back-and-forth type =
of
> > > > discussions. So, Alice, Burak or anybody...
> > >
> > > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm ask=
ing
> > > to use the C structures like maple-tree and idr instead of open-codin=
g
> > > logic around the bitmap code.
> >
> > I understand your point. I asked both questions: are they sure that bit=
map
> > is the most optimal data structure for the ID pool, and if so, why not =
use
> > the built-in Rust bitmaps? The answer was: yes, it's the most optimal, =
and
> > using built-in bitmaps is suboptimal overall.
>
> The Rust standard library doesn't really have a bitmap abstraction to
> begin with, so if we want to use bitmap then it's either handrolled
> bit-manipulation or the C bitmap api.
>
> cc'ing Burak's new email
>

(Thanks, I will update my email in the MAINTAINERS file.)

Binder needs to acquire bits *while holding a spinlock*. This is the
biggest constraint.

My understanding is that the IDA API call might need to allocate
memory (and sleep) when getting a new ID, as a side-effect.
So for the binder use case, it was not an option.

@Yury, about the alternative of vendoring Rust bitmap crates: that
would have duplicated the kernel's C bitmap functionality.
There does not seem much point in duplicating that, and opening the
door to have Rust and C code differently named API functions and such.
So beside performance, maintenance and coherence are also a factor.

The Rust ID pool code is merely a port of some existing
bitmap-specific binder C code (that can hopefully be deleted one day)
that deals with spinlock allocation fun. If the constraints match, I
think it is good to see it generalized and used elsewhere. That is a
conditional statement, I am not familiar with the nova use case's
performance/allocation/sleep constraints.

-- Burak
