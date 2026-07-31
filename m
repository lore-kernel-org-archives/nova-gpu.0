Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15783101A5
	for <nova-gpu@lists.linux.dev>; Fri, 31 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479405; cv=pass; b=c+jAa62ueIrhjbBY/1Sa4PCzYYSen/D89TSvO38oHxywnpbwfYta04PI1rDJ01gxP8VlzfRVJupbkFW3/Z/CRgIhbNQRpgM7mUjVCnkI2QaSenvmLzO0jREPT0S5fZaUqbb8bZNWCeufm8MhvfcL4Vzrj81uUypPjv7MbxinbzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479405; c=relaxed/simple;
	bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL8kNlFe/7kANx7N4BNJfUU+si4YsR6d+spJGz+nTaAW6NL6Dl7GJDZi8+vtPjm+OXN5ZM3Z0oDNU9U3u/dBtiOQVzfogSmEAm5K9HYfTsrLy4J3ncyAlnmR1oM0Bt3hRSz3HESk1y1RUTUJhJoMHcAOZ0JRkWMbQsfH2q5WF6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5PxaE5y; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5PxaE5y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceeee8c46bso1190495ad.2
        for <nova-gpu@lists.linux.dev>; Thu, 30 Jul 2026 23:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785479403; cv=none;
        d=google.com; s=arc-20260327;
        b=M+bWRn/GewfLV9HU1m1jfR7YQf3ekiiYZb3D8Bp6OJFC5YODLSI++PpYI3SmZ7dm6B
         YvtpQNozlhgvKUseWz9xE9jVZeOogEICVhT4TVtllAlQVCsOHW7tqFLqzwafXyl9OAjh
         fXlAwdv3xMYpqJy2q2ZDqzEg+YEw3753eYYjbgONrqy1WfPf5feClVtBYCQNlYwvDIum
         gClOB8sSB5Mu6wVeaCxsHxuvEL67Aof20HIxy6DXWDVdJgZ4xJPMUUtT6pi9Z4X9Bmy1
         rpdKhndpg6hc/DDd/gaZQ3+SF/f+fn4h5M8gbbxipbV7bRIlcQ0I6rQdjg/Q1BaKspjR
         CKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        fh=xCn6Vr6DEEXZtBzzNMaoA7NMoeqcuW4DJZP6TN1jE2Q=;
        b=Xne52C12lInw0EfLNPnNz5sn6NIMIgv8T4ew9+z0EzMI8RjLJSgkzgUGhQXDxMeywq
         D8Bh/NRiYWGMqJbuxXq9v6iT7PMNXfLjxfRysU0VyfmYIs+T6Qkce3mTVv08mWs+JVxz
         6+EDvKeBR7SHnEBuJZH/+L434+TD/0WeS20LRkaJmDKbLuDJMx8vA7giLVv/CUSLpyjZ
         lFt1Eq8+x4ZQK0ETETqNg6t5KnCQPcrLURXqwMDHrpwAhe0Mqu1YBakH1yt3mGA6dV/y
         PWXlPA9wCzJesXRtpBVznw3I2/H39j3G9FWuayK4GAkLupeOPTMlu5X4Ymzj7FPAU+Dn
         iq4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785479403; x=1786084203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=l5PxaE5ylQ8VdYHV/Otfn/4nzvIT93fmj0whG3vNHWrY7Ur+XXYdr1vYIi4OEGApAu
         n7VXw43GqKhyjtOqfQEpR8ulswGrW8jXnx5iOnf4F4H+owRrIlg2Pg9JwHm0UMlu/IoW
         6EJi2FM+xh0RrdHHg3v8C6l5R+Ktt5JszSWgsMcDHYmigUteEi4dTavwFwdXaUjVtSQ0
         x87uFj5jWco6ctb/JqZFn1pJIEjfR4vdxNwWU1M0uyLY/CIegN/xv+zyRvf10nKZpiGQ
         el3wwt6CZHVAT324TnTZz7nRlIzslgZYH8XvjhKtFypAAio4Oi515HLEvisNmgqKH+2j
         Mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479403; x=1786084203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=FtErcH0PBhDpR2KStOlQ2/Hp3+U9GAWBtrJTvClDrBkT22Y4rk4Kgzqmi+LJ3LTl4g
         9MbWPqM4vsrrnSQrgVrkYuC+tqmHmIwgS8oF/OVHFg85ahppm1xFdmc/8tJOX6OX4A36
         v/i6dWdWBHaYyTPP5zFTCHCZ/wyAvmz/j92Px9/M/ivra/s0c5x8sWhi9uLDR1GlHTZ5
         fRQozi1UW+vw9PSkYlvDAHSjxxA4bX6ZLUYCGIIQ//iGH/9kxWPSRk/pNvrDxqMzUzAm
         RXsKdZ076tP5GgLSuUdVdsGn13mk5xCUhmaKlGaz0+3mwhdzANlD0TO5G3SMvGRiZzfE
         HPZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9tHh1OrTnrtx0AieGWH01Vj9B9tpD9Sw9HeWHz4fKpBk6rBIUFAkR40CJNDJnZdypMDyE1Oci6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDG22GssZ5Au/QD0LwGVbjsMmGEaYuLvuEj5Kqb0WtP6UO7RuU
	kE3aoVVk19vsSr7UkGV+i8Gal9z2D0A4P6aEs5vsiQxWTNzuVQDG7+S4MsfrlatNNsW4oVZvl5W
	mTzwoX+cjOHrg+AqB9sSpo/WByZwLZ/w=
X-Gm-Gg: AR+sD13Ou2S2X+2UGjIKr+6Hm0qN3mEsrTNF/RB9Z+CZUAFtPXm4IgVWOVLvlVm2pVC
	p6Wqmqi+WvG1zlwyJq6c9/f7y99U9jbEXwochhlneGUIzI+V7iXsWxCsxQWws71dgqvY2iycQzz
	+92JPywzv31qdLjQ2Ar4DQyi/vqEvOt/9S5ntOdwc4dg9U7h2Pt2qN6BPg1eO0ERQWgYGwAXDQm
	9zBH1qUVQ2p0g+46KTj4d9nkINTZ1m2wl2W0OndFHxdBtzjMKWs5Nx1IjHNstNmPIo7x7fNwiiO
	uWTfDv8TwSkVyDtO2ccwqY12fFmppykagGQdxYvK8ocLrhnxrmjElmRagPUnDIWrIsBgTISfPmC
	gb+5IB0XbtAM8p24sNOVaf3PxpTMMvxgpwYx3YZedj3SBKNotpi4XVm01oCLp
X-Received: by 2002:a17:902:ceca:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d046ef0048mr13066585ad.4.1785479403240; Thu, 30 Jul 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev> <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
In-Reply-To: <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:29:50 +0200
X-Gm-Features: AUfX_mxTwoRg7YuTGPUdUHKCs3gSMN4l-jXSn1vTLDoexparxESqmVPaSYuvKs8
Message-ID: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:39=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Back in v3, Gary suggested this series go via the rust tree.
> Would you be happy with that, or would you prefer a different
> path? If so, is there anything else needed from my side?

That is fine with me, but let's see what the modules maintainers think...

Luis, Petr, Daniel, Sami: what would you like to do? This touches your
entry, so it would be nice to know what your thoughts are /
Acked-by's.

Thanks!

Cheers,
Miguel
