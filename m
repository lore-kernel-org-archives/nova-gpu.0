Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332E43F0AA
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615460; cv=pass; b=N2DVvqcsvvTgf/M7FfVuWW1P2IijCO/utM+kF1a3BUiYM+6Z9CtvKyr7aF9h5NmS9+CcLFjWInVKlGdkLR9j17lL8+gLMoP2JPJJj+ye58Iv/9mkRDLnocqB74IVmozd88A8EK9vqy7x3a0/FkjtAw2zKbL+HbAdH9acEeT7JII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615460; c=relaxed/simple;
	bh=izncAFina5udvh82qhiR9A/Ymo2QgJMmGzIkcJM+wME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPt/JDmOpuphN+WdZ5bULvCYWwAgrywjveQ/15n4mqr/efTmS6RoSggsZpOZtDkhxVHjOFYzzWQqx5eJD3hqN8zMW0zPicgqE1L6/l3fR6/vrA1ndW02N6wgw5ama0hzQhP7KLGugne6a7seEikluhcUaYPHjdNhKnW6unPJyPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5vY6kTo; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5vY6kTo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3653955ad.0
        for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 03:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615457; cv=none;
        d=google.com; s=arc-20260327;
        b=PL7/OqNJFcB8Ag+wBrhZNW88SpJYQb5YyJWQD3izs54zGKeN8uubWT/AHX1cu9DPnT
         NBBoFwKS4CX7Hnwhf8HNn3XTDhfs5kRBPiHB487QhJQoHyHzx3aU/LgmrJe2hs0GARma
         OgLeGO0mlW9/h16zfluLUhUW0j/Rl/EvPCWEmOVeHtMwg0P1DmsJPrt0ixHaaEFB/+rg
         VhxAW2iFGef3XBXPjPlKXA95ECIAs0Dmmbn2eeE9Nl7j7LguhIZANy2BXdn683xQSZAn
         58qQYwiI0fxacQBr1c+hmEjZG4FOW2DxuqXE8ZcjS87PKozkR9shrUC+ahqPA0HsfBBK
         OxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        fh=RBLmaUOUgMRQBRabGTdyDP9eEsSX4EzuyYJF8lCqhnE=;
        b=sEja8eD4eQDRQNjP5qsjpvUuL9Iby1DBOwBgAr+uO19vw6EmLwN+gQeK7uuG31PcCv
         0oUQRqRchAt1EYqrjkqUpxRozJEPw5gCeJFXr/4vYZDKPR3X53I2Xqj1LlFf9ZlcRIcY
         JFUfOoO/xEuvYky/OhYpqWjAfthODuoHsRuUv/1byBsrxYwXOa2tA05pMx4RiVdHrfRu
         /N7Zd01s6mPNpJprkyZSbYWvbUutgvuT70498EU23ibKKEEuAP78xlWhJVLrfhKh46Ws
         1n2Kqn6kmlXaS7siNWVh0s5uyLBF6XvkVZuzA2ee5dCxRSR+PBoNbbQk7GES6/h0Addj
         xmMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615457; x=1787220257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=d5vY6kTo0yC5982dRWXyfhAlkZRqvIkldUCA7tJB0Ro4ikfexyGJ0i00FsanHC7WFQ
         nSP4qR/JhNQ8tsqKmb+2+4ow7Wqa4QGQGcaOBXVxh/3xGiZ9J+gXwqmThJUTUBmc6KZU
         Rw/puK7/WLDWoWw+WTsp91zL4qPis6FcfghSR6eYYe/1OwuXvLejlnxoDvpPxvJnuYVu
         k1md90GAiHLByHqUzMiLBV7HU28s1Jd1dRf8Ou3lh5kudN+PSD6NRX+I6eQHI0N3gMFX
         F2FkuzHzDkgFQI/imtfcWNb/2HhYUeSpngMtriAxh38ouOeoV7nXcnRaPAXawFb22IRk
         fI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615457; x=1787220257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=BQ63pFRM2YtwpZrxFE/85MRxMsUvyyAikn//ECGc6E6CG8/UHj8BtB+yT8erxIK1ux
         oa8O5Cle4KSJa6Y46+T411av61IESRWXg80vqiKPSqYU8aDXqztQpQSBySi+Te3djWYT
         Dn4auQcJVsh8A5WbEPoR1okTmzcBIHBRTUbTAIl+1nf5cp4zDLCpdBkHltl/GNUp10iH
         QSYYfUME8AwrRHBy3VkMZp2LXcT1XCDfnIIF9oEEjEsFFb/Wg7Ovwn0GZg9op4WEjmjP
         IBAwZu7FoAl3wcZI2W9089CsiMpzz5vVWL2hY5uqD40uSKTgIkx79auamcPAv17ngHS/
         70UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Sa2xFeqL4VrvWp1tO3h3aoq0ZFguswYHb/YCYAwnOqc0ONLWOJfFfsWfC0sKy4P9jVJsR8oT5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+W8ZB+NAySWMh/n6pYz150EuhRFashApgUDjFLyDqFhrGKtUY
	7BCJRtoO4Uddozomc+HWnTyDh7gOOVDjs7Z/s9VPse7GBZI7ftfq0LiOKS+I/jnM4CV8ML/JNZC
	wp7/QOyCkBBWcLgGqdKMiKp9+/PQxuK4=
X-Gm-Gg: AR+sD13ZBRZ1czFXYm8VUGm35nFd39uxlaFpWAQij81qTV9wThgqMS1N74iM92o2FbS
	Jfihlkrbaf+6GX8OpBevOSVlKfNeMVwFu3NgshP65O4oxNdqe0lKB56tramcfaRTeE7+xxZU4R4
	QDyK0HLVwEX2pc6U/SGdyNdsQ+6rmGFB5feY00ZpcxXUvSstPKMvP4hTxE5RDAqdZ0YacpTzeAH
	bruVfh+hu613t70/y+/ABEkCWGkMPLY74alneGI3SV9J/eNUbRX+TIYobHMkY/4h7XBj/a24Dn9
	gHm+hvpdpMwj7vunpakA9ozBhBOjd3CcItH3nd6FTCcPFKUADSKmjfwhoTYkmdb8sV3NebrQv84
	JCNEf+ObmX6X6QROgDivYwf21ChmQjnl7Toj2k0r05wYqO2/iGeehVtcsc0Ak
X-Received: by 2002:a17:903:19e6:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d389b61bdemr35547795ad.3.1786615457444; Thu, 13 Aug 2026
 03:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
 <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
In-Reply-To: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 12:04:04 +0200
X-Gm-Features: AUfX_mxe0Lg9da-FioFXEgvJltaWUVJqtXi0b-R5y4sq5pbip1KqobICrYsDddk
Message-ID: <CANiq72=Whd+u0cA88++KyeOQQrsBK+NqK-586jNX7L=_Ocixrw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Thu, Aug 13, 2026 at 11:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, done -- Danilo, I took your diff and converted it into a proper
> commit, please double-check you are OK with the Signed-off-by:
>
>   ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
> `#[vtable]` `impl`s")

We also need an `allow(dead_code)` until we actually use it
unconditionally: a2595ed13816 instead.

Cheers,
Miguel
