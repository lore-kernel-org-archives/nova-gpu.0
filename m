Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E3313E2B
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385484; cv=pass; b=gqnFGuA4XqgSrCsfH0eOO4DvoeuL55kZg2SGAo42RXmw43rWxeFfdS0XVkcgJiEniYcXxdinYIOLA6kz7+mKLcdS/dleG0C9KGR08Y89gz4ywyONq4g8GL6MCP6oQ28me7Ji3+U2nC1kzH9sa8RKliT3AhlTuA4pfyRM1fKtIjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385484; c=relaxed/simple;
	bh=NhkAZd0x/lf+50BQDBhbsB++8vbqfuaPXXI7sbrZeck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuqY6NVqwJyn8F7uoCXUtGHItbFbCsAH97Ib7gdpjx2SKzaDJwCnPBJVF1bhrbIkHW7K1aetfWvr92hBZBm8ymmi5dCI7LtZXyHLvo8EJ1iNkaCTMGstePTmCl/R6GB/ijPK1PjSge+ljGTWP31V9FJ9qlCv+D3vuUl2NHw6X2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIYfQysc; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIYfQysc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d027b7c8easo3620315ad.3
        for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 00:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787385482; cv=none;
        d=google.com; s=arc-20260327;
        b=iKFSLzfV2KKcnj52v5KvOPq/oP/FjUNOCT9iL9+8i+8jqUvL6fWO6xdTrEMiE+mKV2
         9CFbq1AnaLjjUpKOGSHf+rR7DsDxZEIH9QdjOVdTaXDnsR2Gk6MHJdge+5WW3nXytkWY
         X0XnZWj0aW5yo2q8O0TG0EQ8QQxvipJOulSni0mEfd43kQXDluHfzY8A0smEnnnRAHHf
         IllfmP1qdjG5vnkOueW28kvBbRLcKbdCPXACt6JI46DqHIlJ3t39nmrNZVLq8r2HbZ9b
         apef2o0g3bRBbSXX5ULQEpSVkzWChEjKbayZ7HrHyL46iw2nDXTZi1I0jKo3MSZuyub7
         yBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5Bd+2mrf9sK6AU8rR4S1h5wVG10GYilxEU5iU0wRSQ=;
        fh=PB+QdMyuQgEuwUPl+ocmVpMtADKeGqfWI6V2+g9wlGc=;
        b=DvnuDue1P8xQjueVpCMObWebsGP7344NOwQgPt5Z7gLU91YkM+bNP5BMaDBdiUrcwD
         T1+rj94+fYRdhMoLzG+gxB9EYZ28pCovftA5u8/7rLV72oW1L1Qk7lRAIkfRu2/uRray
         YbNmpksMQQ0xS2fIyykOfDB3+EMTuWOJLIlHCVDKSGOvNcAfKK9juEqQNTH4bG+JUtgL
         KdoJrvKFIKwVCPkeVav1DoVp6F/TtY/ABAc4bW4cfxfZRuP8s5BjmIlkjRF88E2eTHho
         nb5i9cZQ8s+jC1Nvhd7TGSnJ6hAaBRfATDtTn49yy72BoIUCED95m9o7BdlXYyuQC9is
         VL0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787385482; x=1787990282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5Bd+2mrf9sK6AU8rR4S1h5wVG10GYilxEU5iU0wRSQ=;
        b=oIYfQysc6tdVI9odewvvxQsX6ts3xpZuIhHuv+BOjtXOUoyfwRg7ivky8JHbrqr0K7
         7dTASk637WzoBkIDZPo/KDHy85mVhdVfglr54mq6qujebHi5kfFL3SH/cg1aXABzsP7u
         5AFDc18PFx1CP1YVVUXM+9tUdvJv9RUEzs7ZcOw2SJNMaZGI2aG+m//RrxLqlwahJFNg
         zkauWx8Yhhr2eKFK9RSmlzpfFQF15JEc74Pqc5kw8AXOew7oILLRSFVZrrYQTANeJoyh
         /6v5yTzo4I4j86PAWOwXiYJjPEfAQdDl5i1GV1lZx1EE7drYsS6dIbgkY1xiibIDMHSX
         OxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385482; x=1787990282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5Bd+2mrf9sK6AU8rR4S1h5wVG10GYilxEU5iU0wRSQ=;
        b=svibDFhYzzFjIIp4sgBhGLxGmX9JzO7ZOvlHpiI6J3dG/OyCERZUO1wpn3pMw2gP5B
         hyOAt5k6tRJF3LGMFgIHpJMdkcJA2sTy1X3OlUbiyC374heWMH3y9OOQkXPekMCa3U3w
         J8iqLRwuZ1m9rfsKWRWuTyLzGa0pw6cNYJeatojzlnVlUd+ZTcNXE8LP2WbyEaHyVmsG
         ROP4zCzCjrXSJiWQ7eYjQgvmeh5PW3yYGaJkl/xWuxp6ay7gOpXSt+CohdzCCA+5MFwk
         9nUCOBqxIjIB9cyLRyvUx7ggmIG4gJYvSh9YfXX5idplW4Gy/Xhx/UXaKVfejpDh0S/Y
         Qsdg==
X-Forwarded-Encrypted: i=1; AHgh+RpzuLBEcyqF5C62PCK3QdgsNgGNWPxn5oT9cs/V3cctTpTpJ5jGBK681ETBjTPPYoKlr71NHxDb8w==@lists.linux.dev
X-Gm-Message-State: AFuF++lbT3ZOvemnDWnt44QU9YfItX8tVnZZbarslFNKirIk8pPJbFdT
	AORaMQMaB6G9Gw041K+uE7wRzarT8J0+kXtx1zHuLPREapmahS9fRoRrcXauHc5hiYd+e0mg7SW
	59rSLRvR/qR+sttfH6G1w2t+jhl3Dgc4=
X-Gm-Gg: AR+sD13QmvBjaRtN08ysQymdBlRWweQqIyb24mzMmYH5eX+Ym49PAyoIZPO2lgoDxIl
	oaYheg897dGsivFG7r/esqdOVH1aquw2vyD+KoWUR3MyKc2qW9VIzhfBUvzPGRlzfH23dSytMbZ
	kOrIxkvNpcZEx4gWtF0/EmvsjbBz4x84Tm71PyOdPcA+h/l3+hZGPRBf5e/bjiJ76jXIT+v8SRV
	dheY3ZdG8lGX87Xtra3yFMRe5srEyOETWyxJCUT6LF0HKYzIAd/foixSI7sP5tMTbD3lj49ReGf
	xsGqg8QKIzSkikZTgRTxCjN3m0yhwb/8EbQLiX/5oLq5qlLxgRrBprQJedoCTJ2rGrxgjoHbCsb
	+/0bx+WGM89Xp5tC+EOoaWyZPldRSQSFhL1bkpm2ESQg1MSaPmP5EvyFedUHr
X-Received: by 2002:a17:903:291:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d64b189ed8mr108096625ad.4.1787385482509; Sat, 22 Aug 2026
 00:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260822015448.238214-1-jhubbard@nvidia.com> <20260822015448.238214-2-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-2-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Aug 2026 09:57:47 +0200
X-Gm-Features: AcwNN1XmQH4h2jTTd6C_qCBxKK4MdosfXo22fzDqRzp1cx150-rC4kJrHKVFNhI
Message-ID: <CANiq72=Loa21e-pywymk+KcQ+8p8NuqYQc79XDKduQh6f8TnxQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/31] rust: pci: add domain_nr() accessor
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 3:55=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> +        // CAST: The C function returns `int`, but a PCI domain number i=
s always
> +        // non-negative, so this cast will not lose any information.
> +        domain_nr as u32

What about

    debug_assert!(domain_nr >=3D 0);

?

Cheers,
Miguel
