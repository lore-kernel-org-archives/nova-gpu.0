Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F6045041A
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759557; cv=pass; b=GYwFYOXnpz4bNnPKAngeHRe0qN2OJwrkef7EiAWwXTmv8jxjU3AytTJzsE43rVtKfRap8VrEkb7qSaRGpkzGj7OiSZggpvSkhQL6oXoYPcTi0kzltj1HHep3mdP+KsKTQi+PiWpgGvCoDrdhK1k9GWC7B7syCCD5dZOJN2hccoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759557; c=relaxed/simple;
	bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+8Su1DET8G6JvS+YqHPYG84+eAMnmCo7bVL5zk844O93nS5YE+aLPs5WYdYc+kV0sns71WLTo6Ms4Ojs3KM01Hk4HNiY3usbzVoxLnvgIffHOJhGpLajY1VsrwkO+dvrXbTSWIuMRtfdCkUEpevQwdMUVzwVoCaAtDLVWTzDeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY0JRve/; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY0JRve/"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so548903eec.3
        for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 02:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759554; cv=none;
        d=google.com; s=arc-20260327;
        b=I2/yQb6WqcXURM65HqSgOhVkYHr9+qtPWdXLVD1WW23H8xehNRTnVWWcrdrYSdia7N
         hH7vKhm2yU6NC0GaFfVNj/EQWzJFWSmkgLxtdDcoL5tEyyiQMqcbqqNb4eJa0PF8Z0Pc
         NcWK3hq6oBXdVksLStx/+1s+ky79iCDTLxCY/pwJccmh8gTrivCj2pTEFxEFo0vkds73
         8m/hjSQhBAOsrmtwUsQItQPPeWfTMFMU+9Sa5Pc5ctk0RGHmZu2nHtgCSUpEuhLaYmT7
         hqBNtgzTAwVXtQqMi/uu5TJH68T5wKfHabshHoCIkS6NsQXxZmst+CJNcb96fwmnH2HO
         3QWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        fh=hIilx2pB1VbXJn5CNn3Bc+B5oPrnI6xq0brMGpz4/gs=;
        b=av39YdtN/l51NbbS/ItTd+XZ4nokfv6ODUHC0ga4bnWSJ3JS4JI86v2zOAdYdgoEAr
         lm6SlEozqEYkhnNXqHM02AUx55bnz1jzf2xpbrm2G+VS36coOhf+t18B8bb8YE5qqFEh
         un73vzcX+23ax+Yw2sK6Ijao9R3c+0viHWZwGu6htxHfIyu/T9qB7hBFiSbp4UDWuKBx
         cjzUE1WDa2ojpi52wGiJ72Lj9cSrG3dP20nBNL6bRDHjMbyvByx97lmNxF4Vv38lr39m
         nMSkYmXY5Wuk+yigH5s/LmXd9xo7x9XcE+OL4pwzPqGF6JbKpO1+Kpsu6j9hwzVb/3WL
         sf6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759554; x=1791364354; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=PY0JRve/vMGGRFsG1FLoU0//Ut+u00cIxm0xQVw9FcAZDT3C/cqHASX0fxwq5CmLFW
         03b+FIlDqlm6LToZj4H7i7SwuKHpYajPELSvyKG+5YOot/9EHpHaLcqw/dm2qtnmFROr
         RUVfbB1SD/3AoZIpRrN3Eg+jVYVwCaNZsX+i0+cUoMoqwYgrLgZ+qN1yJjlpE6QgyXIo
         LP/MCly6NnWXh5SsLvsZQlUIVpPVO33c3Vjj5KaOfvp+0uMR09d0tQcQUGdX2vOLfzeo
         ze+cUAvsJCk4fGgHH0GXSkZh6iNMqjgGrrjLWGXgplnslj4bdE+AhnKh6ogK3mYSgUWk
         bg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759554; x=1791364354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=F+WQxNQkbSLdFn1+PkZtpmX2nSkuzjcGucITGHgEE3CXDRSxvEmwrW6NxuoP/yvVh/
         ENLBnY3OrqmrQ/WBjHfaBsdk6Lnes6Crq+QLPwg0qtTqaFtL3oV4hHrGfCO7KVfKUDRd
         I6gEemFpuBg92/5Y4z8ZpMtkfqR/Fn3+bij1eoPRFWaj/BJnqf5x2nSept6D8B1VPYuT
         6Nevg8Y9lnMXmCK6lQSW6FoUxRHd16Bd0wOGS30frV2NIcqT2nBhOl2j46nv2EpNjzdf
         7K6eBxo2TP9bobwylDzSIhNQFB/lceidfdzLe05yafN4j5YGbnnNO3P817yN+8l7V22+
         qPwQ==
X-Forwarded-Encrypted: i=1; AKwUvByXERRVtVQ0UsHz7DEMtzpmvEbeFxZKs5IBcz/cslRxNcU5/lGq1ap1cXIL8hgVUnODSKEbYCVmLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIPye+7pwIaHQ6oA4iIRtEhXlzmxroEuUSOQQzQjkHFyc8w6BXj
	ftbyWCEvjH8Mtw15Q8wOdBsL2LCgTyJIKrzgBA+rCl7TCE2HAvTensFYN2l3enN8bm9r5A6cBJq
	aKX4T/cgu8VSkr3rZOnfJiruaOWOIaIQ=
X-Gm-Gg: AYBFou0cutkaqVIuBVIvcFXUN6XDnKdPJ5beqvvC1vfuHBOh41psxlw7CTmnq9HicCC
	Aix33BeIkG0tqv1J8gB9c8dl3D1ml+DtPpZh4Ou08URs+Bc9sdNyGc36WqITwU8YsB1qLKyJDNW
	gjMTaR6RnmkfXsXU621NmPmyyaGwGP/zqXDY+ulCPHRgwJIhO8/0KVTUOaY57c56Nab0Yjm8NTT
	fyjuyZDvAgaLQ3CSkDog6fOT3t6CKrXHivjDccwX2SNAjwwom/WreY2XK2cf+3z6DFRIpJtVvVb
	N8uZU7LukGWcUaZxp3N2z6XuX/ydOOYxUolVEBLCN26nIEVVTRxXx9Yk+j2vabdtkyJc+mFBDbW
	s2YXwxRF8qyjBjdSsxxE93vPc6hipluK8pLX4rhqr/shY1SLyn7UUMfqbSXvxCKvcLJcZ49fsgA
	GuZDfx2fu7m5LmJDuOWrm8tm+cI9BiAoI3tII42afLRN/eQyR2ncVQ28gT4KyCnQ==
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34cdbecb18fmr1744208eec.2.1790759554357; Wed, 30 Sep 2026
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:21 +0200
X-Gm-Features: AclHuK-0KwyFg0Dwivk-_8qXi4qsCxM4xdJVFSz7hSpIH-HUHIS-SB0FCeiFTpk
Message-ID: <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add some more size constants, mirroring include/linux/sizes.h. This is
> useful for making `Alignment` implement `SizeConstants` in a following
> patch, because these are more common alignment values.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel
