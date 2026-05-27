Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C2405C49
	for <nova-gpu@lists.linux.dev>; Wed, 27 May 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888296; cv=pass; b=m54OSILuBRdt1wJOM1VsWj2Wb1kYm2+HWmo1sFlLbSDsUWz5ZQuB9vqWZoXY1UTrra9WpstXQPLf4zQ6gHL7b+yl0gfslFkYsEHcYdSVh31A4m5LfAnoScbknwIId9Ydfpq+fDTxIQOUxquxreQuhMml9DP0lPUBNwYcfds3Ukk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888296; c=relaxed/simple;
	bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6qfQmsNBRQDYM4LZDg5xL3R4/3PoztE4ZXO1srtkmZV+494l3hCzr2KTBbHeRUij2dimHQfSBfgGMqEmiSGwY6YrF3kmuGIMiHht9nfJWx91h5piWM6LccySJ7U+i3FR1H4JbDF+x9Zt++W6+F2tyeXjR4LNQFQNuMpu6nSDaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsoA+Ww+; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsoA+Ww+"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f114d129c0so986949eec.0
        for <nova-gpu@lists.linux.dev>; Wed, 27 May 2026 06:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779888294; cv=none;
        d=google.com; s=arc-20240605;
        b=Porkkt00WGu2t0sGWJvRG8/axh4JF6qWIsqmBfz6WY6z6+TijZqAqNkzl5KZT63nL1
         tBGF9MT+OeXc6O0hxLWFt+dVZjX2EszI34rDnOPKKmlPRIEE9Pee5gH0M9SRkADNArm3
         6v5ARwMDVLsRJXotGb4NRDEnOluBQVAUDgtimnvq6ufYYudrNAzGuRqkINpSNYxPTeLc
         0LpaNyp0H5LfzoglNaB8NM4grNtCnAb0oLFlU60N3BN8ogVmYNbtOntftg4TCUES8ruh
         G+c6uypDFyDTBalLCBw/3r2Z8jtjZhrgr7uxwyml2wa1jES3WeMTo4wSNK5Ho4RGLARS
         08og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        fh=WvHBD44Gv60dmar5RBxANqAsBhk5xWVkEQ0J7w/Nzqk=;
        b=cOvigs/n5zGLs0A/+sdylHiLegUQgG7ojg0lzdq1AsIgFO6B/0CzolmvGbblPw2yhO
         O+1wQA9wNQtPs2NrIoINqHkBQBvvyRCC560h9ACe6SJa984cyYeCHwnil0TsRPvBGA+p
         M1vM2lQhlMfUX8o4ngIxfq01j5oCODn2NFb4H8mEyURcj8rCNqLcKwGC1jGxGjPvUhiZ
         YTSHiJlWVHh0ECveLE1UQ6KDo0srhZARtGP7XMKNkHeV0GgAIg09pWR1XXl3OCBxbZrp
         VJygnUPD4o7iPorkcG8Chp5cBm6l9oN7H1ql5NkJUN6rF+bpAzvnGupL2T/XzrkVx3+1
         Fdkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779888294; x=1780493094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=AsoA+Ww+9joR4ArtdPH95uqnULTH+apqn/vZkYK41hojwd86Mr7WJ6Bnlqlw+ZVx58
         a/UuJD56DAVn3YhVgjMDKT8J6z8BPqc+J2X5YnIKoAPIG7TqMI2UjrNr7IYByMG0bOJ6
         mJj9ifgzimwjPN7J9rkIcbFCDGG+rMbSupBDA82hTou70qmZ2mxUPBZFt3AZZW7HuHb9
         nPngBGItK2p48FnIqGHdh5dWKsJFkyer1hd5IOC2FkFH4jPBYPDZjwIY1xwP+KPrVSw8
         df8EAnYre/cJ/uXquq9/5QpjGutBmeTg4m3IJM/KAOnDIZf3ktjI1NopXjRvpkuPnNvj
         vLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888294; x=1780493094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=iT7CMlsrOXcC3vrljYyHJ1pvEGo4jbXxb9ycLd4+juq/eWKFXoE+QWER9forMlcSbu
         41DpAPgfyT5VYce6egJF4wkJGbAcnwzKuDbK8X7XM9xiPqsJFkNU+lLGQVBNVWfr2dAp
         0yzImpqwgVW2YddBceRsBFxYIqGFs094y9d+fnXlntjratX3I/2QeGgToDZPxMSkhqZT
         C3dEWtgIrO6HDpfk/lGkxph/T6aokMpv5dTkCinuAiu6zdwX5/rhH+1+qJuL5XjSNu4D
         wBa0p928pGdJ97Rrr8m41a2HxixDQ2Zo5ogwB8+pG3O4xsRT+brYT1jcey+KQ8G+5m1Q
         H8gA==
X-Forwarded-Encrypted: i=1; AFNElJ/dOrNzzTGQOGSCJY04j4OIOKSWVeHW0UZRp7nCcLptyNoe59ohARY1vAah5s9OWXWL2hVnVOVUjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvYb4yC9pr+/Uh2iQdPlz3oMvPF4SvMHhavgvKKvv7dbVEUX8d
	YDbgsE5C0ngqlCgt0W0awJIMPJAPpuTeOFtQapu6Fbo/6bpQbU/hcNU7GMVNOSs+9glIBxfv20X
	ga0IIsbGCck65VyCqucM2ihGtuCEJxLA=
X-Gm-Gg: Acq92OFwxekGzzyLDSiYTZSihwy7aqlFj/HaBrXjSc60B2JnePM03yOVFv6EpWGjlbD
	bzo4gjcNvzudAScStl2NsWyCdqGAj1rAnq1gK55OwcvuVMb7HUHzukM6W+AfBNgGLmLkdniY4hc
	E0qGpRROgeGKSsXrZRr4+6EiwrhXd+btVGkhWAWgTf/q0xF4mq4iVEs4XTV80i0H1TD9Wextsuk
	/P+pKsBCkGSvPGCWC7COxIFhMHZTfP4HMWrJdp/2URMIC7FPt/gbbwrFNN+ronEqc4Ib766f03p
	pqyQ1S49uhVC0OTTs5ybZ3gNKE5lssbZwoEiVRzr5iCVlgH63WyX6ah+wlkJiXn8zCUB/K/qCgf
	58qHo7P6ld23pypjdTaJEiubzpo5jtfOUJg==
X-Received: by 2002:a05:7301:3d06:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-30449040654mr4461690eec.2.1779888294371; Wed, 27 May 2026
 06:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com> <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 15:24:38 +0200
X-Gm-Features: AVHnY4JsqmQr9qwBGoMiDhQionqiPv95QMqmQwU6hiT2GBpgjyTZd0EHweeVTfk
Message-ID: <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 2:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These types were not fully qualified, which could cause issues if the
> local module shadows them.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Should we fixup this into #1? (on apply maybe?)

Similarly, for #2, I guess it may separate to give credit to Gary (?),
but typically we don't create extra commits if it is still not landed.

Or what am I missing? Perhaps they are intended to show the changelog (?).

(Either way, thanks for this!)

Cheers,
Miguel
