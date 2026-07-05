Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39364357CE8
	for <nova-gpu@lists.linux.dev>; Sun,  5 Jul 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253582; cv=pass; b=AnTG70VIpZkpT6WxVkIpTHw+eWQCUYGehoh3AF3HXvf7PcBBgx7KJvU+KX+G8l1RHxTKZvjvG42adDCXdwVoIPVPwPt2Ldezd6CpWmfVDZRf2ObWu3UIGtPD3n54sZuuuLUdaIr8z259uo81PgVNVlYUtWgwPGHvhxOTBve7bZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253582; c=relaxed/simple;
	bh=5ISwFpI0UbPRq9FTX8wSAZ5/fVWcYX66lDYusFmfZZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZQtzZWERSElZe6Wli53bnkYKZ+yn2qltoQ8A3X/iE0A46zhCTbcyI/XUCyX3vfzxD7Onl4KL4IdAsIbva5LKNCMjp451TmYwh6b5MJjYorKClhqoC+HuCUfYqneobJ+aeQOd0VpdfW2YYQHVgl3PzMulwrlTt++oQrfVKiWRtiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnxAPnUB; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnxAPnUB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso4885865ad.2
        for <nova-gpu@lists.linux.dev>; Sun, 05 Jul 2026 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783253579; cv=none;
        d=google.com; s=arc-20260327;
        b=KyUR5zZjpmzF5hMPIDawgPAEGXa5EjIllwHOZLJFFHFNcyuHN9BxRsBZm4lJbyyV8c
         olcszsJ26zuXLJ1igO36KcfSeIPTsXuT2TRe8J4NAYKsTEMQaBcamoIkQ8ol8Myg7Xw8
         z/06kr/dPdXfY9LeqaZDzGey2sXjRRQ0vRt8K74IhVi1qxjlxONXnBkrJJSd00uaUjPO
         20D+mnZCDvvQ//KFaSNcJGPpDrprafgv9uJRfwMph5qRUcQlaK1D3yO95EZZF1kdOoS1
         VHxzAA0x4uWOgw/92/p38V1P3Fo8eMC6214PT2DlPqi3Wj67tyzuf0HIIy1N+JrZtkEl
         RyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        fh=xIZIPspdmAvUtrepHkZNdhd9LatRQNY19vLEcdut/aI=;
        b=e160Owzkmm2nDEriP6SQPSbtdmL8igdP7aaAT0tLRKIhrRXp7xug1WNEpSitDY6z2g
         4ICxFoyD9HMB2/vsNQA0KGGSLojWPQUIUXYPdJ3Xx/sDoX4xpLmtzoWMwh/BrqJyipgn
         dtCSrejJhhXJGsEFoOIt2RMFJyr4ccTGiML/8lXMIa6Qvq+lS8t6mpp9TEKtfJFxXneh
         YrawEGLzzan0QDFakmkUYo69UbiFNENGHzLTgLxpjd1qpaUwKEPWeZzAnRNbF4dYgk/H
         2aZuetJzFanjzgcBpxv62KEFSRV6OXnizO/5eR/G623XdMHlU09fqhWHwt2wEZ1750tU
         wVsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783253579; x=1783858379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=WnxAPnUB8J5mJvEs3bTuzNM9fXEOncLTebda3jQOzY//y136D2cXAYO54HudAFkAci
         qXYxtMuwNEwD2kWTfCiA4bpiFZeTWgyhvUGlYQJxSutuqkSFSoEjI5v4aqy6e5rJ8G/p
         LoTAESv2vMxyLDACshFYEc1nkmurq2FIMP1XGNbOzylgCCU00COFKeXOvce0Gr8C4vna
         7ccr/VifzvbJK0rxSUCHJZqa5qO3Luc12pz8OK5KaWqLpTB1KUuH3XNrI18xNa47yL5y
         KQD5vmnp09lOWDUgYhL5bCj/5ZHkDiYmwv0LMa+hk0sEUYC3XVCL+Kcqm+zDU8WMBrGe
         TaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253579; x=1783858379;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=FTjRtXh9Rga7b1B02xcXFkO/pJBhjNdpSaUBrk8z4Xr/c6CfGNq4mJbedBFsAgLECK
         FuIyiJF5ia0tigpkBs0ZRmKmTF8VzuaAe9qS3OOQuHo3iXwAfcy9v5O2VhsmuOFRwFKB
         7Vt852/G9thMmsDdZWt1hDEXOXhPfJA41QeIKDZawUXOOPWUopZ4BH3RIcO7XxMFUhsU
         0J8/Oi90zIKQ1+SHIYLqpNYVi5z9Yp32YNro5HWBK9cvcsKZQ4o/Y/m1vsshTZVDJhaq
         Lk44sOKGlXYFIh7yFjeWpbp3zTrOUESJcAW2Ac1MjvObn97CeI+F44xtltD9KHH6nT88
         lpDw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/ch8Ln5ECFmBJ9Z4Fbkvjz05TvIONO8wg1hH5TDgQS/CtMp0t2XyrtgfiK7EPE/kGgX1xE1htoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Hy/dChIsuxGvUlwWF5+hcAO/oiGm3ncVFx09HKcyLngXWPnA
	NOIDomD6m1mlq9NnB4X0rGtaVQ4HAgUkRI8twWadn5KNHs1AuEEvunENjqFE50/zSmY0gBDQ0E3
	NBz43yKAGrBDX5AaRK6H5NMTpp3V+gzo=
X-Gm-Gg: AfdE7cksYpRXeErR1pf+JIp0+yoN6qs2ZTNLmUHcZyko5geNOsEx5RAo8vnEEiNtoxn
	Rpeh7UYxi2CDGz0NPQRd4n4z3RLiXLG5jr/46nPyd19O7SUj6fl3eoeIi8ZVnJHagZNJ4OrA/WC
	1EeLLODuJDQkRI8eTm6Jx2vNdbxZovKj+/fXA5dJJGN9VUIB1B2otvjGl6TW0K8eaVH34PH2GkO
	MkVV/31p0MNgFPluJlD1ult+sh7Vkv7QWTytvN8Tb0JOt7EOZmCIWHzfjmrn6h4Iexps0kv+mfr
	EkOOVRKGwv/sePRIYh8UWLMLzgMUuRe1QLLPXRP5cQqKTgt09lYj63Anv0+iSkHOl1NRyKSNVf3
	LhQY/heuDwjTk
X-Received: by 2002:a17:90b:268f:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-382802beaa9mr4128789a91.1.1783253579563; Sun, 05 Jul 2026
 05:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
 <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com> <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
 <akmtA7EbVBdhRAOq@gurudas.dev>
In-Reply-To: <akmtA7EbVBdhRAOq@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:12:47 +0200
X-Gm-Features: AVVi8Cfl7DMeNQYuJP9tYThrU-TabLAul_khYoWVx5WCyAQG55ujZm7jKpKar4U
Message-ID: <CANiq72nESZyX95XSKC3zaog=XSQF09bYJmre0mUbtQ42-Ly6tA@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 3:02=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> But unfortunately, since `imports_layout` is an unstable option currently=
 [1], it
> cannot be used straightaway.

Yeah, we are trying to get that one stabilized -- upstream `rustfmt`
is aware and working on it. More context at:

  https://github.com/rust-lang/rustfmt/issues/6829
  https://github.com/Rust-for-Linux/linux/issues/398

> However, .rustfmt.toml already has a section of commented-out unstable op=
tions kept
> as a reference for when they stabilize. Would it make sense to add `#impo=
rts_layout =3D
> "Vertical"` there? If so, I can include it in v2.

That may be a bit confusing, because we still need to add the `//`
comments. And if you add them, then `rustfmt` will format properly,
i.e. you don't need the unstable option.

Put another way: the intended workflow is to add the `//` and then to
run `make ... rustfmt`.

I hope that clarifies!

Cheers,
Miguel
