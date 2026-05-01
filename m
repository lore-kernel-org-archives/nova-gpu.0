Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDC339719
	for <nova-gpu@lists.linux.dev>; Fri,  1 May 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631099; cv=pass; b=uc0Vpu9bQ4f9oT2OPJiN/iZx2MoRLPG45JsDYF3EWpxofriC1hJ6SQuTvui3MXxGI7mYhIXoIIPHxkH1kV0xVMJPHwMNYVXeze3X9XUG7sLEcm5LqSxgZ/5wLMlQE7PZDDLo61nwAatnQFByetXnHlaK7t+9VoJw1aEsVgunaVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631099; c=relaxed/simple;
	bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtWq5ed2l4MAxBiZNptSBjK5o9dN79pFElicqbUumLiOeyPsOCR+x/DiGuMahWupTYb1lk0Slv080Z7OHdF1BrrAmeKpo6hJY0rrzCG4zYJMph/Da34Sv3UcvgtJUqfySREWkvUYPDMzpdZ4qRUdk6Du2/sxxWhzhD9ZoHsy858=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptetOv9D; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptetOv9D"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b8095668ebso94892eec.2
        for <nova-gpu@lists.linux.dev>; Fri, 01 May 2026 03:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777631098; cv=none;
        d=google.com; s=arc-20240605;
        b=iqrXdEp8pMdsjYi8e7ku+qOzOqdsFOXVJUTtlo2EBl6Z28/O+YNhzJGLMVqPPd2flm
         dwa2hHbfWBSTDvxjN9G0TlKnUYPy5oPwYQ3yD6bzQn9l/9VUl1K+ZK2B0HdBMan8hSHt
         SkCmTOcCo7lrqJOG3/Zopjf3E8KasgzKStQBtTeu3x66771xZ06wccrCScKsvUUZlDbk
         mqcyLK+zb6U+Oj5hGO11MAWaWca08rpEQIkrHTA6VEjTmnEU4ARfej1uOi6Uic2CkdbA
         9AIEsvzg3PIKRK4O5xVBtvMHJG/2h50Exbqr6xH26AosXySGSLAXuA5Lw4Ijtz51nRWk
         uFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        fh=8J9HSb36Lew9ETItNjPlCpPKX42aBFjGrcTrBYTIKvE=;
        b=FxbiOt0j3lCnAfQ7RjGREmFWCDiYuI6/Sodt0kNHoMq6jHLohy4r2oYaA3UVKX8Fy3
         s0OeGm6BBKGlWcCPTL3eBlpfbyJMjkfTw/2PTNXHgMo+UpF8gZsgcHiT0S1EOHk3gJyB
         PBKg4DWKmjdK3KWU0K+Cx/H/4L916gxAicJTwb32ulBCbFu3qrUgufYiMk4XyeJXFnAQ
         3laSfdv5sf6wWBazq4ZPc7DIpGKzv3FIDY1wCJx0wVbv12fVWNuGNvC+g6M5aCqCRq/R
         xECygogaGNVG7/sDn9qrMCBbS7vVaNYGOuge/pSl2Zzu6S1LJVQzfIcgsOf1qwbrAlQb
         OMCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631098; x=1778235898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=ptetOv9D2fWr/cBwlTrAT3sl2Qb5Tkq4e8dsoWurxdtBQGx+bqc0R46aKbDTSGZpua
         T1MgOD/v0FNY8TRiRK7CZZcFTR2ThsHcnb1R/CFBcF/Gti8a3noYMINvGw95bYq0jpdM
         m5lS8w+D4bag9mIjw2OqNMbeEWvCD5D8ZRYSVD16onyo9oUZWG+Js1GzW1TPIHLwSLYB
         gnM7dQ22yjHcEuLxAt16lKEDnZYNs1fc6W12yKaULpOVR9JovXqfGEtpb2431X0BB/ZJ
         K2LqENH8qvhcDMKNaVSprdPni9KGxStay5zd4jf03FQ87Q3bCvqVUWXBfw5SozcEJzlR
         dZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631098; x=1778235898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=Cq0kKKZfxaAqldYkSvNTA+zDQ0y0k3B8iXKxTGSSsgDcbYyJyTMR1/8TWaJ7lMLKzY
         L90iPmM0RXzJ0zbA04Rhkpc5s0fYq5tYm+2vt/PcfcpXOnLcJfkW9Jf1NjFHtKS/74y2
         BQsEAtUtc90pQJVslMuHZjcboBMPNCE4+MZwzH72w4eN1rxCDwpBQniNrvZt18JghVi6
         3UoDB9grnGOaBNDNaF0LWc9deA6yzEoKyVe8zHHKpCH+2obrzAVcuWtxPAfnyTF4rCgh
         q28B8HFkmypXk2kxrUVQeiGEt8pbQFh/zWKHo2vdi9H81zDbpJ3pxZcbQSVVeiigKXqy
         Hg+A==
X-Forwarded-Encrypted: i=1; AFNElJ/pG2szuImjgB55ix+Zpj4OCdfa/WHE+qyVyUuXMQbA9GmsCs+tC7QigooAdiwfxZAVDg3THtDZYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqx5grSQ9e7sEmi5/tQOOtZl35HLAGzILqrzCkXtTK6sIZtkWI
	PggNWC+BnuwsfPdbQCApDaVJctr8qE3EaZSIehGsbhNFK9BEqhkUtrMNc8N9gtvFTZqp+8mwTXK
	5mZBhOwPjOWQOTk2PAa37xIA++pE1XRQ=
X-Gm-Gg: AeBDietMJppvpYVtIsnzbdCnPTvk1c0sp9DVfgQYnUiChepdunQ76LAF1qHUqTj2eWM
	woerBsrkHeOTrwlOdoHL7q5RH3FnizshwgmHuocUbwe6mwLuLHsIk7B7Glj2z60edTXP013si8M
	h/9qLUYBtZsX1X7smjuxVkytW613U1oPJZPUrMuODdk6BlbvhVRXH/M7CmYoZ2Gd3JjMqKkuRGJ
	dLVPszaeyesU6VHD0jKOF68uQudAHwTPfIpeY4c5uOBnkDQP3/w6i1AZ0xw95wJFNXeSB3saote
	y17t1wflKdKWjAEnW+5JYHedixIuSOXor9ZShjdzCmLaWhQrZxoe1Yd5q1Qtoetq3Kr3N95Rwq1
	h4ISMUvLpHMR8pFl0AvMrDSx04oyVORc2ug==
X-Received: by 2002:a05:7300:e128:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed3e67f9bemr1559146eec.5.1777631097781; Fri, 01 May 2026
 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com> <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
In-Reply-To: <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 12:24:45 +0200
X-Gm-Features: AVHnY4JU-fOQK36-2tr5_8MPKm5fMckRl4BPWEv-q30y-1R-UoCYMfDc0_YhnfU
Message-ID: <CANiq72nuGa7x21DcKr22ghi8bfrbATrBhcq-40zQ=3XJEVV8tQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent modules
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:22=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> How does the rust compiler know that this function can be called external=
ly if
> it resolves to no callers within the translation unit?

Like Alex mentions, that information is what the `.rmeta` files
contain, which are generated by the compiler and consumed by the
compiler later on.

They contain stuff like generics that you point out, in order to
actually use them later on, as well as many other things.

In a way, you can think of them as opaque, generated "C headers" with
all the information needed to build later crates. Other languages take
similar approaches.

Cheers,
Miguel
