Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5277B3FB067
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150669; cv=pass; b=JmCGldS4GuTYcNJix+0QLZHkp6Q7X5IeBABk23h3R3p7lRRs6/w+4HbUGVpxWycfPgC0sfqOVnz35I6V8T//RZpoD4U4r8AVSgK0SP7Aq7nHwlkY9//F7hH1gXDeFZ1gYYbMq8ejeZtD0dd0Vx5hiQuz9Dav/jDCCYtsEsLvFgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150669; c=relaxed/simple;
	bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIujZ0OspiVFpX9A2ivrH46yLI14MGw1Z6d/d5fXssy8MknGh3+Tk6AnAalitoEFmHxtmDN6zb3J88SM+Pi+ar7V1kTPzyoeAA2xCGOs5sl+nZLHkDioybdK7Zaak4ELQL4ibuN5FIto9jbe00dZjEg8r9zWb62sPvdu3gl0zx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRl7NL8B; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRl7NL8B"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96d7933910so233237a12.0
        for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 04:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785150667; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2yTzjzAauZ3F+ShmHpIH522XXjYl+pqKBxGhxEL9sdU1bUZO3hCzE87mLlMV3U2JB
         9lWDX97Kkv1xuQsKeQ2BtujAYun30JqlOEV61CqgonYNvhbi0tw6PLc0LV4PbrGjYelx
         F0hKBZXruLpNir9vdrR+GUzQSzye8TyHWIayByW+Pznsymoqu28D3ycoHNXBvUxBFnXZ
         jm8b4JjipkQlj8UvkbaEFzHx31lYrxJC0H4RycQd+T8/3mC90YRywmQ96RWteqbdRHFZ
         gl8HMDJsze55ZM64SK5rFgX6AeFNguc3vnuXUg1G1omwI1ZHw2UTPcnVphUz+IuT188D
         WbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        fh=tZHoKoDTER4IGqjRGdjw499FjcgZJNmnerdfJshlLVs=;
        b=ipyOu6H9LFqfXFENtQIoygC9DrqRonYB+zPZmAYq/2HPg7CavGBRaUt6xM5YDrTdaq
         cswu873PKH5tKxW9g+vu+vryd9mi3uuvS6m71apoOpdEnCNyNM8SSMrizXNSDmVzePUw
         BodSjyuDkQb76Ipk83exhhR3skgqB/ocs2RK9ZI42yHCRiZEVHnWkhZ3MLTrMEFiSb3c
         GQQ55d3X3enWTMoCfL4l9k2eOxDNqqwmEJRYg411ihel2KuC/uVOdXh2p4UXR2kZ7F69
         fhlg24AB+V5o3L2NarkIE1L7v6mhxEROLmmXqFPMEqDyIQvpRwMVXvGjY9FEbHAPvwsV
         f1+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150667; x=1785755467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        b=bRl7NL8Bg+I5hRwD4YIHaQPE09Uhi9b+IY9q4kKJ75acHMUu5c01h5qWGxhBPfMkNu
         btiBjRBI4uwUlpmHIrnyvVX5T0DMNznGT7bqitLqOL+GVVeL7G0DCbl9guIuWe6x+KdW
         vjnF64SI7Bkd8SDlHbbdTZnoZBHK+4CgeVc2e9gBxxhxEVJO3vFrXfv604/uqXFENCJr
         9KNiDQzye6uMMrbykhBgz1OKcLUZYwtM8d+kvA1dgzoZJAFlm4htTzyILUpad+Dg31hL
         TkOmsi1SfFbxzzn7MeTxRdnNGCewEmHhLAoaaIVZsA9bz16qPTHb8tRwORugUVsmkjtv
         CMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150667; x=1785755467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3UbNAChy9UhbUV9nZPv6nu7odgfx8msewsJ3NP1OyA=;
        b=hCRhncSTtnHXBm145vRrFzCS62U2BVNlaiJ8X8GVhJEj2olb85/7+tDzHISYSYCxtQ
         bdvYq1GQfNTgu012P3L+ty3yYVCQoua+ZeNIV2WJ2ddl4aUoIB8TcyCFgZRx7xw6dr7G
         kfM68KXBEeH7yrby+/pvRxjW2R2y6x8GXbBOgPBm8EilmvZ1n1H/aW6lhpOJhreXDS6D
         tWPfpm6c8c1SWYOO6T/K1mNrJipYJ4FdQmZoRNMhmpkn/u0Y9KbqOVfqCogjssvnW88M
         2zXqf/2MK4tANRx1541MsY/aVAvLUBBqlJOsZO1B5sB3ihI/XVulK2aUM6SjvNlZLkjR
         R4/A==
X-Forwarded-Encrypted: i=1; AHgh+RqCDnX52FhSdqzTtG2PH0WYi2FgcF4qj6STCwiVVZVtaj0Bgs78ijDXfNYx++sw9NNVGP6X/Yr0OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Ya7oF0tqykQnnOec1bXjj0OVjy4ienzSZBREVfL+dJUH1zF3
	WWFsJXirOzTuPAiqo0uSOPLTsvDzB/DJJTGqVEese7eZp7aM7ZNMZSq/XxzJuJ0O3OurPclFEVJ
	mwkVbc27gfQ9PYKXZeO+seG1lFuYcmzI=
X-Gm-Gg: AR+sD117j0wvw5SEcfVPGONPTiZRUv1Drtrh3jzWAe9mKvq8OBg1GXWdXo0EGLAgdYC
	bMiDOtQTu84dSMzrBD5pETr4jpjfa6wsb5P4R9dQHbiuvvoab/0TgmXc/uNMiK9vU1XPMCOXzFE
	/RplYWgSmSHMlCqdogDoGCcjtDumyOKBtfkxgorVch1RSeMu/PWdlLsbLQbdgaEmWllpHYnbADa
	gkX0eUqMnVFHTmmzVWqrnbJ7XA5pP0hj6z1nuR6Ine7IAEK+bGRVJBnFdhNvHOC1bu16l/1bGzY
	hL7ok8QdFx6m39p0yEtmAKfhd0w4cJI/GpA48R7ehmtr4y+oNoQWtQQzgdmavGycPwBu84j/ubY
	pOw==
X-Received: by 2002:a17:90b:2ccb:b0:381:1ffc:7d35 with SMTP id
 98e67ed59e1d1-38f2963f51dmr5698501a91.6.1785150667519; Mon, 27 Jul 2026
 04:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
 <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com> <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
In-Reply-To: <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Jul 2026 13:10:54 +0200
X-Gm-Features: AUfX_mzAAHSnDIUmHWOprFaPHGHzt8pY7YaTmVoYf1E0kimJ5FRbov43CIm97I0
Message-ID: <CANiq72nwo=NSCOaafPc_4beonpJO3x6Njj-GKcW7q3Hk8P80yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add functions and traits for lossless integer conversions
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 12:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm okay with having u32 -> usize casts and usize -> u64 casts, but havin=
g
> usize -> u32 and u64 -> usize casts like this series do is worrying as it=
 can be
> misused from drivers that are supposed to be supporting multiple platform=
s or
> core subsystems.
>
> Pointer-size dependent drivers that need these casts should define them l=
ocally.

Ideally we would define it once, but nevertheless make it explicit
enough (somehow) that this makes one not build in certain configs, so
that we get no repetition and no confusion.

Something like splitting the non-portable ones into a different
trait/`mod`/method name/... so that it is very clear that it makes you
(i.e. the user) user pointer-size dependent just by e.g. `grep`ing for
it.

Cheers,
Miguel
