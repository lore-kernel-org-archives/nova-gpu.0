Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8543F4C5
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609163; cv=pass; b=J6LrIHKe6sIoz3wQHiy8lGDjIiCC6ImIbBnx3ZB3nFUJYfUzseqsO/2z6Ecpss0J6pVkzXn/X50nTquh4T9hbNBZtGLdHABj/RnB3+u6S6BVBs5FAhkKr18tOHS7jNsoXjDL0Os+iJrJJpod2M0lYutfg6bML6Gek4pCXSp/kVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609163; c=relaxed/simple;
	bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+HibVZ5zdOaxSnDuQRaz2adc29nAwIAj7Vx9zkdfkt6EnqXEbsnNQMCJQixnNxbzb9Ykm0+jNYOM7QPsY0zTZjJrY0V1fLN4wsXUmuX7tzspzKwkgNNhGCWTIR4RH1NQxcLWHcBjannqrGeM4ZQlnijR0+jWaP2E/gVdwOcm+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jziny5VG; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jziny5VG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-392af6bda98so354690a91.0
        for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 01:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786609160; cv=none;
        d=google.com; s=arc-20260327;
        b=dTUQVjs4/YyfkmDBNz7qEUnWRyXhgxqygCpBX4KCLU0ZKVqqwlGSnPSbi595lPr7PN
         Fx4D5r/n+UfwCzd5cBJ9H00zb8mjUfixpkJrfC6RpBorFxS9U3QZtTmYIPxydieMl8Ji
         vM7z/bIYo42SR9KE46z8pQxCCFMC4ShaYz5/j/rTYLlDgWJk+n5kPEOyFhoOJSIbyMb7
         PJt3b7AwhXnNsyot/KC0IZVF3wPi8et5IXiR4BUw2KQVbHkPTRT5cBg01XYvsiT8lUVA
         gt1VIdvBXZQRmhJ+GVzZ6n4ZuDtSJfgYUrdjADQEvC00HEh1duITFUjBfOMpg9ycjFAM
         zMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        fh=4E8GUCL2DD+oYQki1n+O9rp8iV0rl0AoVZC/v+MjpCE=;
        b=VU8lr2GPaUXywcs1MTLImp8MEmMoYRHd0jNWW/1Q8bKpfE69Fa3jmPybjXqh6InS46
         RNIOmi1Wzsa4iMrJ3Jgn6ZBeZ1X8TRioElqXcvBQLsEQVt96z/OglB5CaXwprrnW6xu2
         2g/SBSGgvIW8xE6MIr+f6NbxHi8b5Sb2ws6KStCXJl/N4kpUpTr6Uot4EFzglcIIVZ62
         j4s/IAEuL1D0w71XgfHiKlHbWxzCcBLMdSivwMK7bzkgKcsxYgwBg72K87TwVCKpLdht
         abIbpBzeasAzLil+UB/17Pfxtll3VpcLoq1VSsYsZKJOTJw5UnhHuW5Nt6EYUTgPMZ66
         QWqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786609160; x=1787213960; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=jziny5VGnsIQvdKTfJJ7/M+xc1PifpW7XG+rcxBFm/mdBFt0BmrEk/n978xEb0Bf/9
         jFiIf5YSmBuXMjJmgx1sxWp1QfNUGZ2KoMcMAYiF20HRfsHWLQ3ux/+5CzqcWa2XWGQD
         T87yO/IYXAg/yQUuFJ7MQsHdfin7Df6Dv8qbeZ+VIHGcRNQ03SDMH8Oa6gTpXU/YMM1m
         V7BQNFi04+jwBjI5eUXcTIno6KiWNT/rcL0Bk4nrG3q24woeoA9mnDpOcOSXGJ+ji8bq
         cjyvrk/iCu/nUh+xQicvG9em7LTziDDaSlK48z7UzbTe7dFvL6Yrq76TPKQdHN3xm199
         zpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609160; x=1787213960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=Ol09mZyEKat31HqnimDp5wx9xK8UVugwOcE627Q5hjWigApAL6G6vNbVmXv4Chb6xF
         ywWfv5/0EvHZAHzvlZKl7C40Di5sb2vLCb1Dk4LpHKNihEIEESKXiU/Lei96l8BLUQ9W
         +D11+ukuqr6yY+0UbHi6cnAHscUhYEAycL+6ANIpgJaBcqyV9qReqc1THsnd2eefHTvJ
         x6uM7s537fOwnNh/RJdJ16tTo3wxCtftcAIJ9jrOPJwa7lfevmsUSHY2oQ+wy3WLVjs1
         zSkiwJ0TOk6AaGnbVaGsw4AruejJTD1D9vmHmAam5DETujXZqxObnAovoq94JHA9oiHf
         2Xrg==
X-Forwarded-Encrypted: i=1; AHgh+Rrkjhr4KAx2iSpus5DixbZFwuaVXA7wv7qF0+Xi0TC5JqPWuig8M0lEuSOkoxwj7baTtvfmUhfELA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaf3I8NKi5LEsuLlTeJFspozxe9YzRlPcSenN80sELaFqd0mDv
	p2vm0Ntsv68DviD9OSYYAjXi2QFXS4dSAJFsZdSX2u9ILLT3ceIQq+59tBngA0FxL/H2u0BQLLF
	NOsn0svYjMc9hIdbd8ZKrQkFwqxGc/U4=
X-Gm-Gg: AR+sD12qpu5Sw7N3sIcEdURFffHabefQ57jh5/Y9YEGeHf4zdKIFrlFGHFq+iNhyD9l
	/2Xs31TE+Rws9dmaqP5lDzwfhfD8chab9F45v2DT/mI3XbCFMIyFW0QC4/ux5HPrjxY0i15/b1U
	+4XxJquBkxE9ruSopH0rA8vax3adgGPK6mebK5vD5ulwROWruuT+Luy18b5PF/52jCdYSJLUf2u
	PWbsbin+XZic5U2oNr6JC3IFge3A4D4DD83O7PTseO80X1ghvhfyjFUkgExRb/744TAmYpghKYK
	yqwkiWAoy2aUEzx3rVHAMMuFYUBvyneU0FfOPJTWWLHpkg7CT6uQFbgYL3bN8B8r4ASo9xCgNoG
	oGRWN58odkfH+uwziHX1uxRhyldnv4CtPHcOgGAWA9SVAnm+xEwS3hGPqv2KG7F/VxpyZmkU=
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3931e2aa828mr3336244a91.3.1786609159836; Thu, 13 Aug 2026
 01:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
In-Reply-To: <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 10:19:07 +0200
X-Gm-Features: AUfX_mwh5p3w0RKVhg92eH8jsf5k7VluJKRFIvAAaH6tiIul7a7G8q8L9_4Mlig
Message-ID: <CANiq72mcFp-MODPkNGPcufxb0YhPDO_eN8J-ZFVzkd2-W6VK6A@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:15=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Thanks for applying the series and catching the stray Acked-by.
> It was a v5 series-tag, from before the MAINTAINERS patch existed,
> so no need to re-add it. I'll be more careful with tags in future
> submissions.

Thanks for confirming! :)

Cheers,
Miguel
