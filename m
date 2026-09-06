Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B13DA5B3
	for <nova-gpu@lists.linux.dev>; Sun,  6 Sep 2026 00:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788652906; cv=pass; b=a0w2VRVjeKXAk1W1x95MxG3KNDxGJ1ieViIAlUFcO5IQF3DPu6IBiyVqhbERNxtW5LKqGjcfB0d3mAdW3dCNDBqStvPpVLudDqpx5ZwHEhx+WAgwwG6P+SYuRLVX5zQVU//FeBA8MciTUbPBDew+HNtBq6fwIqF6wMv8NlIwwaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788652906; c=relaxed/simple;
	bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy9xjIdvfu/BHv76brWMVnz4Y+cUOE7fkMSBJyA3VauTngRydVuXNkJ9iuq6l2llGd5KQ+oYwiZ0wP/M5jM8/jtzv5A3nvfDIoFGXeWwwVopw2jzawpmBM8+v7eJFUWaR6UFEzfaazlmjTG0co6Iovc9ZRbG5hzk+jyoWQnY2eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9vOx79Q; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9vOx79Q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so234249a91.1
        for <nova-gpu@lists.linux.dev>; Sat, 05 Sep 2026 17:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788652905; cv=none;
        d=google.com; s=arc-20260327;
        b=XDKaUcJVpYhLs7pMcvO5I4BAzkrgPJeuSMHAJHpqEYdWME+R9tVNcJyCK5ZQx9cR/J
         q2HRiU0kq/buUltCgaqoY9hqJAifMhoZVWkqCGBCR7o16F2EjGBZdwCJS6tIFIX6nAZc
         71NHUXXdULL7gPKQsCKgAXvP1KKL/TwQYXowwDzmR+GbQLuCtYO39q3FNBvJmbbZTaal
         wBvb4TXutAaO1KqVpznckXZg5Ebc5oN6PyaLdrmfU2rOAzybWtyX48Wvq5av88gnnQ6n
         J4FMbl8E1eh3FkhF7DXQSeH5z+2EvC2XO9m/JCDjQ2LmHLPxoSSkl1ur362kig9HB8KR
         nwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        fh=B2R4OCnMLoyOgjlAhJEAEwwY78104Le9nIA5b7YTcMM=;
        b=rTimdrkpQZltHcJu7lRi8K/qdpE/wnZOcBvMF0Szen5dncVvBhluzLgtuldcsZ2s51
         hvNDgqje2E5Nrvu4DNjiT3WG6vx9iUmDQ44rMw71XPc7eIDTCegcdCrp37E76xsySjLE
         ZOVlQojlIdDw1iINsXICRNOJLh8inzhf4v4XjyftQuu5qiLPltKsTRVr3vPwZU9hG0E3
         ew7D9tq+3HpTu2eBC2WJad61N68FIw5+t5p7nbOC9YFFm4nxZkE+c4+0QsO75zDpLxZj
         +1PIWUeqDxfiGFLN4BMo156g6pXNAMfK+lYn8yl2dWj4PZmZo4hDkbAZ1KxQvcfkdtRk
         DapQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788652905; x=1789257705; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=B9vOx79Q+EPdXo0OF6g2Mr3sG315yXYg1UL4HGbt110g25F0YkgZb3qlwOfXXBB2Z5
         9WImc4ZEs4XVbeXMqmvy3gwUIMiQ4enIuEG/EXNI8dpOXsLEygAe+lmoatQ1Ynf/MgXO
         5X6/3OIakvLUWSlUQBVa7KQyv/jhYV2aVL7cMzelzH8mqKaP8fYINON5MRWSum7iJYbY
         hcxIcdaViRors25TD5qniyh5289mkrDwjiwZWukFIn3kT0l4uYWT+nLsnVB4e14+e+3C
         KF5Q1QpDKTmQjEeIx1NJU2ZSx1olLg4wBiWTKszeFzWaGEtI+hOTti2PGHKNc6bun9br
         U1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788652905; x=1789257705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=oqADLqzbl07ckDcXMehuxaoeTyg0Ce5D1Q/td7t6NsX1qQRJl3ecy6X1wEs/FH8zb+
         dcbMO+XPY5lzUDQLrk5Kuq3CXH+FH+vfwXA+zaKSPV06K0YEhRCxiaaxQfVlxerRme8W
         WM/O/FodyKavaeaW3wl6aHZwR8EHAXoA3ucNv9HS/CA12bssD6YUAqrdOscay/b+q89L
         bl51HTdAqosvtzsQE3DaYfgl4z5Eq8Lg7D/Lzr7L/bGe8KhWiTnUxEeRSUcav73rjcuZ
         qnfLG4DeF4OFigIKGBFQn9z+XCSCuxv9Voe1dUY9XKBhUlPNvBsTUG7n/ZVF0/lxuxAZ
         KJUA==
X-Forwarded-Encrypted: i=1; AKwUvBwGFKDodphk1bt+YmtrrOIUfDFWFQZdF8XXdsd7UzgMFZZvn4j/obB3KkXMrWNgRseaS2uty9hoSw==@lists.linux.dev
X-Gm-Message-State: AFuF++lejw6w+CPkehlso3WPrnO3QgLgIEwyt2D+y1bL7xR6vU8qZieS
	u9CvbZyZdRKsIQf+zCNVDl+UhMTyrSRDgVRZ+s4DmverzbXLzMvtbu9pjN1Np0QnU6wfeR0G186
	pElkZq0oA6yMis3evrMVEoyRNeLNpzdI=
X-Gm-Gg: AYBFou0C0Z2CZarLbmNmCW5ivIGxx4+qFo7Km90exvE8lu5/2QNzAm7pqtJI4n3Uk/u
	9KJeyIvzkIT8bqW6xJFLYyaKsuygCZjQhSKHRPoxNI1lhAPZIspI9PRY4L7C3yLRFoSgWkDEYTJ
	3PyFlSjjMxZhc8dTI1tfuElFD/q1w6+N6Um3gcauH5jHnVxtBi/QB/Qen4+cdR3K3ZWfip9DS9X
	ZzaqDOd6efFdd07IksAIsmcqI1axA0/EozB/D1A0yy82ZWqTeUavnlogRN54UpJI3apLCo0ypYM
	6cltCj67A3gacM2yNicX8NsWdFD/guu6hZyHDOzBV7fVXYbLpIoLLhgbfaadjEt8wO1HGWLs7DY
	JO0Qxm+FlI3lD8uhS0+3RlNEsedbXMFXVBmCaFWWZm5OwCYFcniiB39YVFeka
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr7786501a91.6.1788652904655; Sat, 05 Sep 2026
 17:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260901-typed_register-v4-3-5552b1d59525@garyguo.net> <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
 <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
In-Reply-To: <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 02:01:31 +0200
X-Gm-Features: AcwNN1XKuKFBV9qEAm_z4sB5Fo2qHcAE7av8dqRfbpy9oR-6X3rQ---1a2fINJY
Message-ID: <CANiq72n2B=7TXtmtQXEC-VZQNZ6NQTkPsxnnNCiWWYb=U4TyZQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure why we'd want a self link.

It is to follow the guideline about using intra-doc links on things
that can be, which prevents mistakes and improves consistency, and in
this case, for huge traits, it may help readers of the trait
implementations section a bit.

Cheers,
Miguel
