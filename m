Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82703A8FE9
	for <nova-gpu@lists.linux.dev>; Fri,  7 Aug 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122761; cv=pass; b=B2ViUtnKMBk+0Tzs+0zl8u9rAzJTCjfLAzjQ3BabNJkPErADo9j02Co4q7dLgnupf2+hfWXtENPrju+N2cBOAeatSJPaSm2ivVoZCAw4gjGaVtCxCM1t1iOqbB5+mTXvaoTsC7mI5xwWxOQfcXxYKhI5QQQyjaTsgrwVT6Lnido=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122761; c=relaxed/simple;
	bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ2cF/pNHw9nYqsOvPiQ79qnckdFiO4/zPx8bg3vlcd16A5vNhlWMCiJT3WMs0szkx94ItVRWvZLpf64TjInoHXvhgmCY1SCIhIzm8zcoA1jRgMMseRkgSC27TesToBu9HiHAAQAb74gFrFJHrWie8BnstlpRTBpoYcbIyT3e6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebfDng22; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebfDng22"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso445768a91.0
        for <nova-gpu@lists.linux.dev>; Fri, 07 Aug 2026 10:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786122759; cv=none;
        d=google.com; s=arc-20260327;
        b=Q64rpYYc9A4pXsp2yWhUwsFeBKyKtIImfeC0FXIDUPMCT24dC7v3bW17NUru9X78MO
         KiX6CHd6PNEKHgjiaP+xICyVl61s2+8mzrWUbsA7lripvpPWtLV/jz7H7dE/0ej60D15
         tDSqc59lUz0YFOuyqCSEA2aHClYH75XwOIv6hJvQ84q+FSovuHoqSQKC5knM6AwX+yz2
         +g0H2GQ8Uq4uP/gmqpmyKtUMgVoqCAjSKfwruz4vBe+iTmwKXeB37Cg57tAKDg/8WifV
         DEpMNH3Pd/Q7r7O0DO1S+w0r1LVffeGK25Tpi/PD8uwfxVaD93dwKa2wVmcFrUljD9RD
         mZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        fh=MGw+xf5RDTE1inCD3oRUtiYys0oFHWsDfjEpKGe0n1A=;
        b=DUysU0u6HXI7U5b4Y8LYl94RnKOoFXdLuqMKcX6mxXz0L+5YPs/UgeU5MyDFYSFZPM
         qBYOInC3mnTjiJny0Ew8OaZimFRhV68am85o+HFNNU6TpWP8Guk2GdL+HT8jIk/54CIi
         Avl0tUnf6m3aJgl0vzbTdDIkwenEEbDutG4ea1jDSHdCU2Ia1hhDGuzuG6fH1tvZEL8G
         of4fWvN0Q4DBomVV5qz6c8J1Xf0Ct8SUW50qZgjfwJ82Sv4agmPNdfjnJeR/Rg2cvJ2W
         XA1g/2YC/CjALwNTOTHkrUPRLoy0IXkJq8iVjsYwcJVjJO1UC559RYpYT0Vlp05JsqFL
         vdhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122759; x=1786727559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=ebfDng22CIBVPF1OX378SD39Ymr4slNGko1jXrZQNWj2iGtcmCOUFGt82mt2OlwzqE
         LjRahJ5MX9gg6Bt+zu+yeeTJ2ST9sTn59Y/iWpOyIJnRIt8PgubvEUswZDEHgaJV4oyc
         U0fK6dADJ0ShO833mxPK82u0BEjlwoLn8TdqEReE799s4I/BxNQxC7/7gQDUZtRRTSwM
         EGXiNIzaIBKcxSnsXRit6pFsYavjED652qX6klROFwIDj08Lb0E+xQvFO7gvcnqM4Eo9
         lY/mbrlXFWfBtpz+vftNOmRHak54iSULRYnh8SOw22SMZAoOFHty/R8pCAr61G/1kCGp
         wSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122759; x=1786727559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=FBikxxsZGzpHP6A7fVoPFDYd86OOO40mxGn9czeneCcw45Po7MdjlpxYMTFRIufyFY
         SIYEzXBP/roxeHv13mDv4Dw99N87mRKBRBWLQmdSIgrKanuUL0AGGK5Hlx2BqXcfxZLZ
         VaapDhwzE6jcdKnfR9SCFn6jsLHUHpHyeY1dDsdcJmYeVLbKW4bEh2PFHDFSMw9oqWlB
         frm1Q3SgHnR5DHhjmr6fWxMZBhejio0vuTFbUwj+hid+DL8Cxn13ZqRndbM6FxGxyYfP
         GphHgRfE88F7D5Txa8Syk4+ViZA0dxKu5reWnt3xo7HQEgIwlNK7I5weDFjwnUuSEMXZ
         gJyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+y4opxQeUu4/urEh/SlrVxVUT4qCF0xLWUnYfx1YPT2WqiGODgfvqqELYHNGc5gitFjpwSRsR4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNf76oHKgIeBA8Cv8phMYJ/C93kHSR1dnIo35vXwI1sLl7XDJx
	W2zB3nCj96zHIXithfF78oMBr7qx3PpL5AlrRH6rITR0Qfyx+rh7PfS/gzbdMX6aggoXpf8BWW8
	jM+pZHVup5k9sNqPfwdypzzKS41/MUsc=
X-Gm-Gg: AR+sD123AHdFNfN8Bo+KCsZUsxh12bRZULDno8Bvfx8c/oxL4nairf64P5nNybAVnZP
	6u47ZqbGCGYKDiN+r46cMs3N7yr4TOc/LqIby036piRbXWL+uRRbWvsk8TJHzhXOX9pJmgc6U8I
	acSqsyLCqE2Iov0lv4otXPcxRBKMM3J37FYHibNYIBthHKUQWg1iULqbVJ3yarX2hCNo8rgIAJU
	AyFbUwM7aXx9Y44/k20iTMf2s3stLSYy5c4YKagrxc5BEE0diRHJA0SZ1qa9mDtB1ROzZGLcoUr
	yNPZ1WJkP5+U+rVrZD3XVRd8AQpKJn++Lcq65nB7q4c1Np4JUSt6OruLhDkzK6w+4Jc3Z6EKeN6
	Bz4m7Ag0Oc5LObsuH+HY0m1JZ2SaggHVtp2hG+nY372S7CKmTAMSFWSbLNe5w
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-3903c628181mr18187876a91.2.1786122759120; Fri, 07 Aug 2026
 10:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-pramin-split-v1-0-ff3e84a75dac@nvidia.com>
 <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com> <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
In-Reply-To: <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 19:12:25 +0200
X-Gm-Features: AUfX_mw-cYa1MKRYuhH-uVGjXrAOGt3b9pyVqsuViit8BjsQ3XkXMD2u-qTWwOs
Message-ID: <CANiq72kYqPySwS8ci84CEsvjJqCTBjrveSx14xxnNWJZWRFAuw@mail.gmail.com>
Subject: Re: [PATCH 02/12] rust: num: reject Bounded::shr overshifts at build time
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Yury Norov <yury.norov@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Indeed it looks like this would panic with the kernel build, and can be
> easily caught at build-time since `SHIFT` is a constant.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Do you want me to take it this cycle? And maybe the next one too?

Cheers,
Miguel
