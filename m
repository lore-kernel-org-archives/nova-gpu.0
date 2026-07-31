Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285BF341660
	for <nova-gpu@lists.linux.dev>; Fri, 31 Jul 2026 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480383; cv=pass; b=YhTe891yhzsNXhZ9T6v44ukb+czCitPZ7TsN5XOyk43ega2ysA9bhEBPgGrHhTnyNTSHc0Kv0kIAuUCoge+Shju6vvd4oJee6S2iIny3LPsRvDEYBu1XpCgTmccUVmvYuqmNDRCrKnqURWWWSJRIs9ojCXGijquoNdgcVddEMI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480383; c=relaxed/simple;
	bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbERnLClxch1xZQTvW90dSX/wjL1buglF35wn7xuj5XDx8sgwP6O/5IhnE9MxQj6uAFPvK3Ng1pYNz8x2fMqmS59Pn2XWBcten8ZQtovmGtnOLvJaXfD+ye51v1amvvS0LPZD/s5ooXYgVlVzo1W/oy/NV34w1bs4j+XiUrvDTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpyNAIGn; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpyNAIGn"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e2061eed9so94265b3a.2
        for <nova-gpu@lists.linux.dev>; Thu, 30 Jul 2026 23:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785480380; cv=none;
        d=google.com; s=arc-20260327;
        b=RQH8mtJEn7IrtwBm5khz8mRrd2TK50ES8dz5OJjd6MlRQMvkW0G5Es37VePQto0AV5
         ly3KxAgQThaopl0koXogleZulcqqKS2RtPHa9IhLVRRoZWtpzkTPdAXw0WIl8Oio85nQ
         pvzmzcoHUQ6nSH2WAXSxVDZA3wvXlu+ZmyjZm9FeldS+BC8onDneYhCe8JU+2R+nH3Go
         DqGGpgSA/sXW46P2NwzK2+tCWMC+3m7ghfUKwwlphQxVzcOLtkT8eCu7yUyu12b1pBXq
         k4RuoudtAQn1lR9m2EELknlPBiLxfGUZ26NkjZeiNQiGpxMmCvJpsInsY/wtyvrs3mSo
         nloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        fh=HIXbFk2L5Uy8xfI41tDcsIyKk4G7dRWFSVlR9gbFv/Q=;
        b=WVwy/pSO2Y9ftwjTV2rxVufW7XXeb4/okZC+fhP7/xXytSaVhql2V5uKXpHBGf6RR8
         vc5DNcDNKuuDqVHX6HTTjHnewaB+DhY7qxWoj7YCL5qMqGHrOLxpvaSxsvRtHDnXU9tQ
         zqLT5Ntx3UNlLxRTlcc/eP/B+fFKnqVTQ8OUui1RWY7kZdphnRXMzmMfYvp9BkFRgWU0
         jWd5TmO6Nd3VPE9Sgbyw76TFRocn7ePuQZNp1Mo1P01YH4JFyppU1fDIPW0zSM+TF1DX
         UBDN/9x0695ZgAIMiVtW9RDoA96uLjOnBKAESQrIytFll/1/QnLSWRqS5EJo8JtOm8wX
         4NOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480380; x=1786085180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=DpyNAIGnL3HHQWCY3lq2mBt+B7PwKaJ2Fe9UKhRYySc6IUC0fXQyJLnA29tDZQQeDC
         ovZcN2chXdGH6Py0JhyerFsnblc7ZzgD2AOk7OYkXjZlPw5AR2n+U7gi58XNzch5SDeo
         iAnCh9IMLJ7ZD4BXZwg9ND8n1RvBySBUmRxsG8c61Jj+Qqg/cwrD8NdqXDcA9P3qJfvw
         AhmJ4Mw81uYuwgd3Le7FAll3fQxYpf0DDaR1S5bKDVnM2z/lpMbYTQu71rm0J+kDG50O
         JR4bfmj2pPPKTf99jRwOrNM7Bp/QlvDsHoZPTQpCe0rbAd6xYcptGbpPtIyC2pNcvUaB
         T9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480380; x=1786085180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=CFbaVdsHx5vh0Dk95m0HGPFOd41YNRONSMENDilt9iS5oB7gIc/BHHqwCDvAlCTfGA
         wMeJw39XUUNJVZaYWTcLmbfitrJ1ev2mW4hPvgCTQaG6J6F1I6Ps2AiSUGp+dQsbzDXS
         DMiDFi4NykLUDZcK185hlO2oqclO8N9cBhEXmrs0dOIzUZcUkmK0C7cnFAngx/7N7D3q
         G4bGKTIiv9t5H7j5OaKJzLgNyfnHTHZq6N2L6K/3X+t9Qf1hjrG9t+SyRgZvzl8n2pwL
         u4ZqbOw95zN8DIeeFGcIkHD7QMgHzxlYre+21MfDNGRwSg3rVM4agUFP77XcgUXWJB4O
         l/KA==
X-Forwarded-Encrypted: i=1; AHgh+RoIDbEX5wMdc1r1Al/cSAFxNDghyLpjV8mBT34LYxcVga4DDSP9Trduxndawq7oZ9Pvmn5sxbBl7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGdCV8FteO5R3zVPfT8fzXGCJyZqSDLbDCIW1tClHnHWSIhKm5
	uuLBaBwU+/MAmZCKz8bjTo/lwM5CAD40nkpFyS6czZbAr5qK8dVs0OExP8vs58tV6XxSMTCG10z
	vwRUQFPYZMW+0YwVmwtp4TmRNl40bi/4=
X-Gm-Gg: AR+sD13JsXyShbqUk51UAUnWcTmUJ9X5XN7KlUDUrKbb//+3Rvj+7JiqUAY0JAEYzgM
	oUyRUYhhU1qJ4WwkA1M5NOi7log/TnYKS1SSIJbasWLxzazAb8hNksSyCk2g/SmoZpRNCsYIdKC
	r5VIVALBWNWVaGFmFp8I2RAmETWEf/85NFTyGVjzE/WCjlQ8JeyvMuoDKCze2PvnH4ss70zbGoJ
	zDEbOcunVnjP8xZqpsvIa8sUfaKUeYLfet3I/silarVCwrmbIVb2UOq5wT5/zoO+pcBSdhQrQ+V
	VEKjAzuMcmSnxko3L34CWM8qxrMWwkQhKR9v0piVldywVhGpM5YkH5GvoT/sOExoGWsaPZQdKxu
	hDRKlKGAS0+oZGfhGwKb4Rz5mvsn91f0lqT+zEUld5o8T9NRodOASziZuEYDD
X-Received: by 2002:a17:902:ce08:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2d046b459b3mr15748155ad.0.1785480380480; Thu, 30 Jul 2026
 23:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
In-Reply-To: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:46:07 +0200
X-Gm-Features: AUfX_my5gmBTyBxP6uEcBbaVDtTCrtAGlQbEryzjfR6FoeX2UBUc_vHFPgNtGlo
Message-ID: <CANiq72m59O-ruHUvUcZC7yCvu0KV0w_m5vMO4e0rxyHdRmihJw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 4:11=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> base-commit: b7e5ac83cb16f7ffd11dc23736f84276602100ed

Was this old tag used for some reason?

> prerequisite-change-id: 20260519-miscdev-use-format-9ab7e83b1c11:v3
> prerequisite-patch-id: 405b334ff0d48ad350014f05a2321bdbaa025400
> prerequisite-patch-id: 604b631c81d5423f4ebb2e12ba2d22e9ce371bfc
> prerequisite-patch-id: cb550d94cefe01920e0d3ced2b2bcbecd76f3907
> prerequisite-patch-id: 3bc830839742591460cb86d9472c04f4686dc600
> prerequisite-patch-id: 571058244bc8c7088638d2e3225713011246c7e9
> prerequisite-patch-id: 347c5a3c6dbef9832bfce8419fc23e6e08ba477f
> prerequisite-patch-id: 3e202d988b56b88446f7535e90d3f00cf5f15701

Are all these actually needed? Some seem unrelated (some were already
applied too). The only one that seems needed has Andreas' Acked-by, so
I guess it is fine.

(By the way, I will use this second message to take this chance to
move the modules maintainers in the To: in case it helps, since I
didn't do it in my previous message)

Thanks!

Cheers,
Miguel
