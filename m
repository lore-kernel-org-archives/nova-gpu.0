Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3267373BF3
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652440; cv=pass; b=AC/M71WH3pMmgrWmwcNx+tYms9+sZjBN9CC+YBjd6a7HdfUxTuHSkI+CGlERkT3AfSaEjqhOZ7BBfA3zZ079Hfe9yN0vV1DoD7w0OOr9cYGb2MxtfA9ogVI/YUabikb/9rpTTXHXL3GOndQj6jBb68g4SAnqS6U/tUIRzBrZPaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652440; c=relaxed/simple;
	bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+CjZisFAzsQOjA5E51TpWUZXkKrpXcZUfiMUAFLYfhq134aPS7l0TD/yNSC+KApckcoBKG2DTMxgxvqWkTeUoferhJz1kGZZfTdNPpUH3Ygy5LqUwPkRh+ZJWijYZ/+UBUYSaCFEksMlGqzJ31bkCHq5OPoYNBTbyLRsJkpAv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwKe15eo; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwKe15eo"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca132e9c54aso20503a12.3
        for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 13:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786652438; cv=none;
        d=google.com; s=arc-20260327;
        b=ntx7yJltT94wdGCynkxcTjcvRTBdLwpVgLotGF/4fitYCXGskAAYEJ54FEgI9AaVq4
         LlbIU/zc4+AsJ0E0FJexXSHjyAglHf039M0WBgXS/xge9Y3IP+SNYfKtx7wW1l2iDIC8
         Z34+TR+U7qXAx4s+ATzqtKx/w+6c9ytt4Rd7PqCW1aq9CP9EJhQ73rLriDTRJRRwQuwh
         N5crpcqbCKGarV03TLFW3JXwreMVyCLfZqS08sOOAxrUbGkXbL4E14NVGx+0kCGYXjpW
         JwaXglrFJVcoUw7HejQwzg42tza34/Ggh7/MhSWzq5h2gBOISZT6coHEBog2SohzGLLD
         bd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        fh=j+SGjIN1H/4KDZwaaCrJ97D5OLompIZr9qvybDejP5c=;
        b=ln3A+Fdffaull49L4VPe3EzK0ix6Qybcx091Epej9aLw0eAr8AW92jp7KjRXHy5YgT
         xrbG7FxtFKKPlGBp1ws+y+CAh7kHjcImI4gKmKIcKCZWP+phUiwPnC7ubrsyntugC6MQ
         yJa0Uvt/gGUQewFRKG5eAib/jYyrjf3RJkKpQ5A0c2MO2pX9meKicAqbeY7YeEsHHgYe
         do4nnjPcYFYkDZAnd0Sw9KC4KkrDtTodhAN0lT6smqX6cievojtnHrDN5H5Wy7dMggFK
         oze7156ZW5bzoq0PaCwoXdciSdPfyZxSaLPvy7Iu9i4ignFAFQ9gwB9uCy1xIys1ioGC
         LzEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786652438; x=1787257238; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        b=dwKe15eokmkBckRoRfa70Ll74NFPialenYjywQWQuPVqbbCgCdfL2xwxJbFJoRDArs
         1lu/FHU9yHoTlBty+sC2yG69E1bKRGqPHPrwu0EMRZjOKTpVhNaHl9gRcxQkJ2JZS1Yt
         MijMiLpnBARqvz0jRpAv3i/fcIujdEWMDLtaUkzoxDmGnEt/9gEjLDX62ZecnCu4SQqD
         AS7PvfFJnugCv6rj4bNRaQzE0U7Vnk48COg5rDQASpRbbkKDo+5doqN/PpWjtPY1Kte2
         HbvUjTxvBzlmuDf+rvUuCJvWeUddJBq6wcwJPkxWK6tZ0uWZs8mGoRyKYYrqIFYK59wq
         NqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786652438; x=1787257238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cehTam5I/PsI0xQ5rE+zJQchPnCweU4qjkmMXExiRUs=;
        b=dBHBDiXoC+FmXp/MMq6dG3XiP6unwRjMsNNPdp0bokDoSEyrRwFPVDeLJnSjeWqQea
         gXJo1/MbHLUVe901pDcjhumoszr3jPbJoKxjm3pw5Ul6rvt/tnMx0q5rl5r7WISjklzj
         AcUkvGUJLe5i0tLOtCQt8kAMpKwxLWtDcrk3UWFpKQ5k/9ElVOpCVRa3oLOf5qmy9CPB
         Jtm3q3AIYBqhHJQQ8iWU9wMTYA6CBo6X9IbHX6UyC46spCkKxZb6K7Tg+1tM5OfwtJSW
         pNjj8ST8402qgLXJGOgmnC3NwqjnRxN9CU9iwjTMOQy9HRUCNFWXtxKoj2GNnZYcDLJA
         Epkg==
X-Forwarded-Encrypted: i=1; AHgh+RqXA2TnJ7OnKvxaiuVg9yM2KpOock0KiNYdx5RNctbzFiwmv8nu7DzWxx2qbIR9zE7aIw3xIBr6fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZk+na2iGfzBuoFVXHxpp6eqVpdTebyNeGoQ1+GoYqVnxna2ir
	kveGriTRCYhMV5+gG4ceSpJrmoYNXvpqclHOhOw3shsqqNewrYDaRb0rGl+/nrR8A1JeShkR7QW
	I3Te6tPNK+chVRfZbpLUd23A1ZpFvHmo=
X-Gm-Gg: AR+sD13PEUBkUY5ZlKo1B+t314f0rbmXdP1R16eAnjqWSxMHLoOzV5Utc595El0TinN
	G8JoEfhjBYchV4LkKCVXeSAx3xfFHUQkdmHqfr78mQaZzpW6JMNgRP+Pv37zCcHQ08BdW8TBxHG
	4BvIom7FSdMdsNBwvRUP2Fq3TJGGzBDxFgpSF4q6jgwP48lF3/cbTVzI9Bd7ifI8Kdq7nou3tmn
	nhmLATWmQ1xpLoYyXMNeK2UOufZtuT67KaE3kt02Xhr+StJ5VlbE+/uFK3G6voqNTHopGrTSoQL
	xDTDOA8aT5a7u/MadflR2yYIuC1GE5QfMWRs8Uhi59CJpAFibmUuHHEXSPprjwHG54KONYen1Bt
	BdE+ZppzIsUlPppdiMAfAZETxKatDykFVqctpgilVhdzwlry5Ae5qCujSW0VL
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d3b0d7af99mr4135785ad.2.1786652437935; Thu, 13 Aug 2026
 13:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com> <20260812-chid-v5-5-6c767770b3f4@nvidia.com>
 <anzxKO0X1OrNRD32@yury> <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com> <an4NvQBt3389jP6E@yury>
In-Reply-To: <an4NvQBt3389jP6E@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 22:20:24 +0200
X-Gm-Features: AUfX_myQRhMg_1RjW0BdPohelYryX955pzu-Kspe5KhUk7UGyWS_4IH5HccmtXA
Message-ID: <CANiq72mDrC+43kbj-X0dpSKP6zFM61R3QFPa+2_xKEP-RHUppw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Yury Norov <ynorov@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
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
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 8:32=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Not OK is complicating interfaces and life of your users.

No, we don't want to introduce interfaces with unconstrained integers,
especially so when we have already types that express what we want.

In other words, we don't want to introduce impossible states and error
paths that aren't needed -- we want to rule them out statically. That
is the point of all of what we are doing with Rust.

The unconstrained interface you are proposing is actually the
complicated one, because it means now you have to provide more
documentation about both the allowed input values and the new error
cases. Not only that, you have to provide more tests for all that. And
you have to duplicate information that types like `Alignment` already
explain if you click on them.

And on the callee side, similarly, if someone already has e.g. an
`Alignment`, then we don't want users to be forced to convert back to
an unconstrained integer just to call the function that requires an
alignment to begin with.

Now, if a function is truly something that we want to call with e.g.
integer literals all the time, then maybe it is worth a workaround --
but those cases are rare, and even then it is likely to just be a
wrapper to the normal interface.

Cheers,
Miguel
