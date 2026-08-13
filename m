Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A51432E9E
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613784; cv=pass; b=kBvko1jbESNIEBG43V/Lq01sPj/myHI9ZEhQUt73Z1ZYh91xQw3I0kb4ZwlN0P0ct1E4i1js+teey/wcDqScdtKHoV+G7P1YPznpNsy58OJvJAoPqPI56uVN+pqjjqKKewp0ogNS+a1XDHy2RHREe0JhU8awhdYoHTKsbs0MPAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613784; c=relaxed/simple;
	bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgtKF0ZKCSe1O6cn1QW29arzqDxTB9UK9/LmVTbzsZiBHM+D4qYAB/HAfwUwasbg+6U9iGoRJn5nDP10Z8Utn5z7YyXuRpYtPDCNCv+e3+6BmK3JBzeaw0kP3XFccKvwS3irdNM6OrK1mKHI6Go0+paVmcJzJXdH2hNlwbVFp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFMEYCOY; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFMEYCOY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccdce28edeso3400855ad.0
        for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613775; cv=none;
        d=google.com; s=arc-20260327;
        b=RR/WXf8Uy6Xz8AA8fI6BoUW95ffeuHLs9coYO/nxnAfanohdGiPlZb8kRMN1QoYWHA
         oZSs53M2bWOLeHCFLqEjp1zi3gVFs9lms9HpffOZV42rBD+00kTp515lOEYwDPPzFDaD
         n/8fdLRWqZuxyvSLCGKaealLZkrLKoiTlr6LEkz7psnKmvWIdjrRkc60d/2lpb9IBSzX
         OcuHt6INsOPjbxIZ4yIS8MMPWurG9xaAxkh16LGX2wObPKrL2Sli4HJY/mhX5FeVWy9k
         FEA0iRYjdsh9uY2NNbzsw0yhf1NpAHk9zDhbVjc3RKc0z6B8MlIVX4+jb+tr4+OB9N2i
         O1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        fh=4WQtzTla8+zXIVvp0FoTMP9MaVNeKT7VaXB+ACxQo94=;
        b=pd4Tbssz/FGH3sZaAXAyCucnZXymnhjgPAPBBwnJLrQv00X1ohl+68ekzenuT80Pvk
         H5KvyCWzETRkrKuC07w0nsv3brxhqImrcZHWjcYb4On9/oMwcTyb7jX6LW31PWt//f02
         CB7eoG9TRkPASc8qsLgXMHl3G2IXKFyH657/Zcw4aNHOEuZoYS3n0WbqUBzpQr0rOhsS
         diviVMmkVH7P4oVk+l9d86T4G/E4Gdz2hsXUPzUYg8xezgzZ01/A6TQI5zX2Z7gW/bzv
         EUaQ3YfRnZSg89mojEBqmqMH3K59EBqZcJyrsRIZw24s5jWY5umKToYJHYeV285YKtGA
         zDYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613775; x=1787218575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=fFMEYCOYjXix3pa07usucniAF+uYOdXHvXSk0pwssM1Zq3CZSaXwV6dHwrUBPlMj1X
         wMPAPmDeI7n7xK0H+I7xpoEz/Gh//C0QXSYwrtMWLwRA/8xKKyubKyVb4JZikLxWfkmJ
         CJUmVLGXOu48/6mEwwsCayNY7OQrdVyNwp5d5MoczXwW730I7LV3BPVyJXB3KAGW5CZK
         6znZ288p/+NPJ6z8cyOfsgxAUdjdOzltnmM3XW5tseojA83f7u3rPmfz2cmZ7jeWTK55
         SzuPS0Lu6cyZQtZDZigy7+4o1tQL/VQ/xy+Dsuafu25bqdqWdJ9hVBzXhD5c9MBhtBXT
         aofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613775; x=1787218575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=djnREkibuPrStf9BWD+wnvCdq2+477rD58gsgu8elbzL673oMjWoaJN89oHBcRd3qj
         8U2UEAZhIG9occIeXBnt6RNAfjKJaThhgkfe3NIy0OawrzoAgTrLg13DEbjS1TcVySa1
         tsYJJw+0unENgqdP1JQEqXT3Zuf4i8nOAIBOh28sI/UUm2i/iI7GDgzUMwsI54cHVtLn
         mbUZF9ya0VADx6Vk1wMoRFtAKWZnEONw0vKAkip8pdFk4V/ScP8oUwEm3dG4rPMNua6h
         9rTrZAhndSz1MMK7qDlHucPNNG42wDQPHsZj7VtJw52XUz562tHyWPaKt8A/a2uIkvI/
         zYrg==
X-Forwarded-Encrypted: i=1; AHgh+RqCJ3hAYmQqqM4USlllA4ypmUm00spIBFg/oL1mPhMybd/AoEpYyL67v3HDAv3aXKizZ8m/K0K/Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze+gu/Y8PnBB1cPd9yYWoYwx93vQtoxcfxnsj4olLSOGOl/17P
	j/zov/lpAEXBg5q/RhlZOoVaQksnXqjMvykq0DQoURnXW0PV5lVLM82wkDDz4XBCHl9iCo4jtm3
	qD698KCykHwi0eTvX+deV/dCKr/D9IXo=
X-Gm-Gg: AR+sD13BjMqmZBCxpZah/xYzvBqS3mIq+mB6Iq1lrNZT2LoEmIS2bNPTkLNZjeqfVaC
	5VCQ3g6DxyUhA8ZVQXlEcZMrUL4s30jUGnEQKnO9iWPfLysfmP+YCUiJUhYYnz4VmkL3bP6pq1n
	r7m9UubF+XNCB3Yx0nDroY01wlIXSvru+1l86NfRk70Z3eDCbFTCvwJPWakBnaNC9hpTl/wt4c7
	EoMVysvc9speAy0wod41tabkp3F4LRpbiRC40qO2e1sBGZw1y2XoWemZUWFTqujCDGygF5VnC8t
	HZUCVdudRjcq5r1YnQ3jHtap71JfKkJnQ9C8/8IFx2Y1GQQRt3MY4gz9kcEuQske3bQh6CDUIev
	/Ds8Qew//4EmD8C+Op0GxypZQ2+G9Q8/KriaN55p9F3WubcUpiZCm+E1T/7T2igbwoxpOic8=
X-Received: by 2002:a17:902:ea0b:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d389b9107fmr28401875ad.3.1786613775343; Thu, 13 Aug 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
In-Reply-To: <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:36:01 +0200
X-Gm-Features: AUfX_mydrO4nx0TADc_1KF-ELy8K1d4zi4yvOYINpS4bHvyjdnsvoZ1CepMueE4
Message-ID: <CANiq72nR3K9d0Y--FyUm1yAkww2LaAuYQZ3yHXjYxxfztgMMYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
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
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 11:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> This series has a semantic conflict with both the driver-core and the drm=
-rust
> tree:
>
> @Mark: When you merge driver-core-next after rust-next (which I think is =
the
> case) then you need to include the diff in [1] into the merge.

Mark: in case it helps to make it clearer and so you don't have to
read much, that [1] diff still needs to be included (i.e. the rest of
the discussion and the commit I added is independent).

Thanks!

Cheers,
Miguel
