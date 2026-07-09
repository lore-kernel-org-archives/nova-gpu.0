Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9812D781B
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571511; cv=pass; b=oN5VNBnH1JeBN8omVI5V0kbwYMWHDYo/DRXGnx82GGUd8CtVr4GYQ06S0KAM92RVOrRUYBb1zYGiKYGsKVkEvFfzMhw33C6+hU+6bsoFUSMJi0UG3sPKCxsFdzsJAcfQELx9TaujOvepR14WP2O4m3KWGXh5DJrBeIGie3FRFeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571511; c=relaxed/simple;
	bh=AvguVC5ElsFKrLiOmDna/dkCPOkM1bTUcTiPIw+P/Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acHzYnxoeUeXAsFcYkyRIf3efnRACEim6eJ/h04gkzX9m2HtqNhxVx+qe6162o9+PXLmJCT3X6Q71w6zOzfbF/e83y3wL2RnQ5WeAvpnvpYwjxbj5BZ02skD3NZTajbj15ApxEPg5WNz5ahdzMu9gks9hOWeEoljEi3pFhqlHkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qy3pDbRL; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qy3pDbRL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e6f0b4610so1835437b3.2
        for <nova-gpu@lists.linux.dev>; Wed, 08 Jul 2026 21:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783571507; cv=none;
        d=google.com; s=arc-20260327;
        b=J89XGWr7Iq0wqf4AeySp6sZC+3LIpi6HIKC6OABM+23Z71fzfRVLxp/bCn5jk6GcXv
         O4kg0HIRXyGqu37F6/pyT20EsGXi6hWNLFoi5DXcTvlA0MXpwUp+lmftkN+v8rQbOCv0
         cBY3cJHF80JBoaTTQp+l7O2ipZD2KRaoDaeuqtHDq/SmpBd0BN1eG4I1vhtStRQH4Vu4
         qYFSlNTuZRKebqmG4QHq9mR9fkk8zjpSfktZORPpTccRtlrE5uHhGsbhlX16AK1ixq9K
         dA9cTKzKyli3ydDMBBqcoPTfDgFC4h5Yoe6urci31sFCcc+NasUPJwYbN44a0GCukMjy
         L7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        fh=A0wtx0QY76YOMC4WPFRlzIP0meQ70Cu59TEYGIXcsKU=;
        b=cSBb7LzjffseR4pfO4HwVhJf/9mkMKH5eS5eqq6mduJo9MOqUAuBhGd9bynprrBF/r
         6EDly0DZCTVPAfELuPUiSRTmpO2ncPQix9/HRydsWtzReN8bUtLQ/RxJhIgERf9gDVr1
         m//6yNRu9D7eJmj+HyO7MLkoSlQCSxbvdqJB29bxBuBVgfrjr5rJSEv9GdJKdJjYjmJI
         hVwDHx1podbdbLpAq5+80VyAY8lMsLgYc10cwgMX7Zqv4yoYVkLfgHHrBwxs3Y33DEQS
         ZAdkF1wKYhmQLRXjkRDf73bv2xuLCMnOXUVew3gw5oNG9FodB/Y0CDX7/WAE+MbkIpIT
         aqcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783571507; x=1784176307; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        b=qy3pDbRLdIXHqKL5zA9clwnc4J4fXWd/NK7VJKl7DD+FX2tjJQuQ0smKLJwidWHqzV
         HhHWu+dBG4QLRbjunFym+2Id+me6H8IYRB7gZKGuJTtW+V4K97riLzAubElKzkUjfYVx
         mQWRDyRzXfPVEK5o3YplPDRS8OqNnFXBScuzErtE18fKa6Df2Mqtx4263ZpDxqeRwdVA
         efY40UcrAW1/gdXWhz2xwNmCaPdUfLc6H79dKBRs4tPkW9i5I1uatDFJUDk6OBxMB9CI
         dHSIkJcoelR7vyvEyVGFl82Wcb/c/3fEq1DN26UoKeKC11mR6XDteBMvGCY5TA84PkVX
         dwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571507; x=1784176307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        b=NLPmLXaU5LRjS/K29PB6g95eLmZGv8y2ys5HpVt7oHZCTBGxAMmAAu4uTqwaQIh+3q
         PHfT2Y+LHXBAioEB038ON8ogTrrLv3Xw1hAhG5dCOBlLQ7Cr+uNV7vWy7cYBPALopT5B
         soqZO2tHgD6MBKMlFKkjmt7JL+EGAiJt6SGYd4sNJh79LcIHl2WycfOguWHWTmTY8aPd
         Z3ShbHu4MgpXRfY64GjeHVf1vVDmXvi9fLgbTer5XCzJlhq2aW246pO+7QNwXclVJapx
         QBj6NDx8Ki3cpHT5+SFPQgEGm62QtQYOka9pBqFulX0WcOdJxaBQj677uPGgzTi1AV9A
         98Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpQWzbFgonoDTK6sCN/ZX9uPmShnek361KIQDqk7HUIt3j8xf+oZS8yvhJWOMrrkIfVeW/iy2T7Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx31IMDtsCDWT0sXHxz2yy7mZQsWB0XIf2ig4Xw32EQQpgq6NfK
	89iiDsCP7A6hxC+nGoYtC8Cl+5qStaW9+l5SPZWQt6/rfgCgEbX0Lz+YU37pzM5WTmUMmNRT3yB
	CVPiIuKK42Q2X1tchaqBNwIUxOxpkJwY=
X-Gm-Gg: AfdE7cmew48OZ2n+LA/1ppKH9Ktq4CwyJwfnaDuSmp4Q2FfGjH/PGWkIdw4X9BnV++2
	p2ixCCAJI0HfVT6pw2U5MJokm4k5JypCsS5O4KkiNC3hVAjaUJA7kwzbqOpiJg8fEuIKK+8f6Gf
	QhD1y5n3BgS7xDFFfL5akziK93GhkRj7dghG+evIWXoEYE5g4ImmQfZuzc9XdupnG6tAfGqx2R2
	apiJgWPTeLuiI62IhRS3Mkjq36Tjn/HUwUGVzLgKaML6WcUYZAT7bjVc7lA4Dgi/l8lENOmi660
	R1DYLNYRr5qYfpgNUCHsJg5HQ25oISj+5D9DngnO9e8XZJ9wW9SVOkRzJw==
X-Received: by 2002:a05:690c:3747:b0:806:b6ab:a410 with SMTP id
 00721157ae682-81dbbbc3e84mr46430647b3.0.1783571507606; Wed, 08 Jul 2026
 21:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706053413.154135-1-apopple@nvidia.com> <20260706053413.154135-4-apopple@nvidia.com>
 <59948bff927bd4ad3af5fbe68d5d5e7565c5f729.camel@nvidia.com>
 <DJRP5QO5JKVT.Y7LCZARVCWJ8@kernel.org> <ak7lU9X4pTwx5NDB@nvdebian.thelocal> <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>
In-Reply-To: <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 9 Jul 2026 14:31:35 +1000
X-Gm-Features: AVVi8Ce52HUzDIAE6RQvUKGgLY8vfZ1_RiXa4OKoXWiwiGWM8AqznZHsuXPRA0w
Message-ID: <CAPM=9tzdBWOhPpO_JffaWvkuz7SejfZL=XAbwxrt0gt3xaDKGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: nova: Add GETPARAM parameter to read the GPU chipset
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>, 
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "gary@garyguo.net" <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, "lossin@kernel.org" <lossin@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 10:49, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 7/8/26 5:16 PM, Alistair Popple wrote:
> > On 2026-07-07 at 04:24 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> >> On Mon Jul 6, 2026 at 7:35 PM CEST, Timur Tabi wrote:
> >>> On Mon, 2026-07-06 at 15:34 +1000, Alistair Popple wrote:
> >>>> @@ -38,6 +38,7 @@ pub(crate) fn get_param(
> >>>>
> >>>>          let value = match getparam.param as u32 {
> >>>>              uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
> >>>> +            uapi::NOVA_GETPARAM_GPU_CHIPSET => reg_data.api.chipset() as u64,
> >>>
> >>> Can we assign these IOCtl values to match Nouveau as much as possible?  I think it would make
> >>> everyone's life easier if we could use the same user-space tools/libraries for Nova that we do for
> >>> Nouveau.
> >
> > I debated this, for the same reasons. However I came to the conclusion that it
> > wouldn't make a big difference - Nouveau only has a handful of GETPARAMs and
> > we already know we're going to need a lot more for Nova given the increased
> > scope of features it needs to support. The rest of the API also needs to be
> > sufficiently different so I didn't see any real practical advantage to keeping a
> > couple of parameters the same as tools will need updating anyway.
>
> Unless all, or nearly all of the ioctl values would be the same,
> there is absolutely no value in trying to make a small subset
> match.
>
> Let's not get distracted by this. Nouveau is sunsetted and we need
> to focus on building out Nova--without artificial constraints that
> don't add real value.
>

Yes it won't be possible to keep much aligned with nouveau's api, so
let's no bother, nvk already has an abstraction in place that we can
fill in at least.

Dave.
