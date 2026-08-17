Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581143E073D
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786996302; cv=pass; b=HWzal7xAaAZMDUQ1kqhYJoTSba5yo3NP7VWdh8NlhUgV9dIfqD1rlxmIOuM/jKyysCFNHN53k5CoMoGAhyJ6O5Eu1ZtMf61V6w9DK1WsEK0gqdXpfZo/Sk1J2sBEav/EL6jr3HZv1nkrUDOhrhyK8kLljEHqCsA+IXC/HpWFiD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786996302; c=relaxed/simple;
	bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeRCAguZBO18wBjYoxyXuWnhTeSCxG8rhNlCdaExaXt8me0qtOQIvbvJUfSc26oV/NhR4qUrVNWo2NjTsw39VGitw99gvTkAeUEAEZziMnT3kGYqb1KqmIHb+0v2Z+paorvGu/W7h19u4MM9K3CKk5ZnXI0FWzzln8niy36U8x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6IwT1EE; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6IwT1EE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ced3386430so38185745ad.1
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 12:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786996300; cv=none;
        d=google.com; s=arc-20260327;
        b=n7qamtcIF4mqfgtHlQn4n9vfxhfmtmpmNYRliBDhGuKkX7yesb23vrqwba4smdHihG
         7Ce4OskuQKZ16yR9qVAem4jPHZ8JG7fAYFUhyOYznbRVe2pB98QMRP+2IzADBWX2eQub
         pKL6DK+kCtiry84FypuYhtAAAZAFWlpx+UyxcaWw/etss0nFf5yIBIBI4dDI75lyrOgW
         mWECKsUWwDAA6VdfbC5pM+5VSfuzQ/uTdt0+FArz5YahpqpxCgub92ZALRrUjnqJ0i/o
         zJLZK1l0XRgzFnIekb5TRZPxCKCKLbdXpraxQ6pxTI9wKHTVCsolSoW91pvIwHfR/7LA
         dgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        fh=PBTkWeVuH/BFaQBmuXteUSV/SKvLKAkVvsxod4tZV/c=;
        b=f7DdkM/gtR/Unqs5RPbBdCEUcYa4aZ1C/BcQEigDfCsqxMHin5y8NH2USKvam7blOU
         0ge1HPkaudsvzBufx5fYAmuP5TUiruCsQOY+8lNBAd4xZ8Sc3+oRbdF5fXx921TpD6pb
         SxcknS25MpodhJeWBzG/51m5Fp16kFg8TnT9SBqukX2B+a1nfdezI8TkiPxDbwnt5cta
         3HZG/p10ZY9Kj92y4Mdn0zBxfrmzOfjLRCXVPVr2u/5iQ46gCEdk2lRzRTBroJo8dIKt
         V+bC2IMJm++7UMpC7aPwgsccXVI1Z22MB+sDeyM18srY1tT40Kx62BTkI3+T/n1F3HeJ
         KbEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786996300; x=1787601100; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        b=o6IwT1EEw7ykP7CyI3ngWTvlVbM4yIWsx2RkW0OErD0J2l+atPkUo2HlyovrTChwi5
         A0FhSzgdM0EmK/uxcFD/OZkfPDOr9U5xI1+iW6oGZsDb7XXJvZlq8eAU9HosPaQWIK3K
         asbsqZD+Q3H95EvS1ic7tJR5fY9bnneM/XMfmwSICvRT0B4u0qpP1+2j2vH6bXNUletw
         1ia6VY455oX0J8f624m5QcgSMqDf9lAfM7HvQlmLmgrfZbVxQnyB1eIh5Sa2ee2D4y4k
         7fN4fPckaVBxO4R+1UFXFCvMLVUdmeis/9DXWgWvWFlWs/AOukwyZLttadjopCDv5rpS
         6Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996300; x=1787601100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        b=Z8PgCjHUgiLdQG9RsKwC39IT+KYn52xVcehTXNBa52Bf0IJ5PIWNzy4yPGbCaH9agI
         OFYj+93yt8BSbos79N5L6xUiDLY4SxSoxhDi5ILAGxSHAx0wGleo4DsoAxu6miyFSr3p
         ymmJglgI6v/8Juexvqg5tmjpP2H4IrrMjYp0p9oodIjeQOurkJktCV6EChwXbjdYkGlA
         2lu9zPPql5Yz7Dd0zaqqqqc//D1eX1D4tWOCzuqE5jMkKYyKio5f/IZoIf6NyZz9oqhK
         V1ifh4wTswwllHAjbsnzBEnFABuo9amwJxwTgrfTwj5wK2MrMaW1033yycheo9+qno11
         hgAg==
X-Forwarded-Encrypted: i=1; AHgh+RqmjzI66pcb+3p1QzBpmOX+dS6kz6nEIQLA2+/plkBHHweAwABDOBisX6jZdjcBf41+z8xVVZGrOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEcKwz+9+DNE2tMeRd/0EcsGgGoawDfpOf10qjULMq7GoN2SXf
	jffNhuXr0BKeyodLmCJZ7OJv67MZDCUDzTpeqmdkjtSAtX6FLzEp+UtQyy11ZoZainm87ECZbd9
	9+w1DM39eY8/jf1kqxQDxHv72ISWYLPM=
X-Gm-Gg: AR+sD11uR2y70lGzm8W79IgjD6AkBSoWyACNnDuOAD6mUI7Pt2BTQzJNGr0onUDk0AR
	T0hmfJ1rRi2eOJm0lrEHSMN+qMne50y1zoYJC4wmglcTS7K/e69uZTYfOkS+CXpmGSlbFBM1ZSd
	JxEha13EHYv3mbAw86L2E4Eo9pKLufojhit8QOW48NjPabOgcaZ6204vLGbwv67iR1IkxuAPRbz
	1C3Qnhno6Tq8HUmdtvpphN143XYaS5ZByUyBwnHZfkU+v5YY3tWWz7A2jl/WOYyUHWBBa80/Gx/
	vvK0o063vnZuEPADo6O8MQ8Ikxxu4nMC5PQcOge2VxdlgOfGxevA7kJKSJKDbOCTffIUZ9t/f7S
	W4cAMvFrXj5Lyqu+rdCUGUUyIi10eEUY=
X-Received: by 2002:a17:903:3905:b0:2cc:aa36:c046 with SMTP id
 d9443c01a7336-2d3b0c5dad4mr315279655ad.14.1786996300433; Mon, 17 Aug 2026
 12:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-2-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-2-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 21:51:28 +0200
X-Gm-Features: AcwNN1V4RUrrEQgmScJR1GkvVYLA4gn02X6StFpnyno6RAn1uKgn5cwzljFUwlQ
Message-ID: <CABwQupP-qu9S--ob82ZPDuiNH3LMwqZpjZ2LENg3hsGFGvr1Jw@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] rust: bitmap: restrict bitmap length to at most i32::MAX
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> It is currently possible to construct a non-`BitmapVec` backed
> `Bitmap` using `Bitmap::from_raw` that is larger than `i32::MAX`, and
> it is not part of the unsafe requirements. Restricting all bitmaps
> (even non-`BitmapVec` backed ones) to a maximum size of `i32::MAX`
> simplifies a few things and matches `BitmapVec::MAX_LEN`.
>
> Add that requirement to the unsafe requirements on `Bitmap::from_raw`
> and `Bitmap::from_raw_mut`, and to the invariants on `Bitmap`.
>
> This also fixes u32 casts truncating in `copy_and_extend`, which could
> otherwise lead to OOB writes.
>
> Fixes: 11eca92a2cae ("rust: add bitmap API.")
> Link: https://lore.kernel.org/DKG0U8RLO7LZ.2I1AIH0S38PAP@nvidia.com
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>

> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
