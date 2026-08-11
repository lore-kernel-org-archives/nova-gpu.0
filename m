Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA529276028
	for <nova-gpu@lists.linux.dev>; Tue, 11 Aug 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451524; cv=pass; b=N/J3pX6+OzrQMOv5X6o+ZEUndGrPit41PcN9aJ9B9rCd5wGsd4IlOOacIX1YS9I7ZrxmMm0a/m0qZPePEg52BRG4ATdaoHR79K0R0YOPAON4k+7r2WyefedyqCYXwEc8lyzYjTmgrO8JT/qaozcOoyGfu0+PrW7bAq09ZtDu82s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451524; c=relaxed/simple;
	bh=VV7t6wHWEE7xZB0c0ALAUrHcYMkXiim8886mu4yeAcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzElrMreboC4rPliTddDZY3vuxTApm2KK014/f1i73zI5h0JBFZiRoOUwuEl5hrKuw3WFiax3N75TQ/wRHIYLadTlh7dwcYw/PPnnjBvgGaxrKHDQYRL/0wZAvraL8vZy7LcCmfEhYz9vbY8Tb9PBQgoMZ8EZKUWUOCX/VCN0u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mz/UtZuU; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mz/UtZuU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so2703945ad.2
        for <nova-gpu@lists.linux.dev>; Tue, 11 Aug 2026 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451522; cv=none;
        d=google.com; s=arc-20260327;
        b=f4CPh2I5aEAHbrrwGRAwMW8kPxg96ZSytn8yOWhUrsZTPVyAP9y08H9RognsW2LFTL
         VWWpXOjjRpJrw6XDXE++AxsyhuldgoTpNE2mvFAzbcNq2TtfVpVNxSExHsNaUjAja2px
         tAq6/J1zWZb60BPdDEtIdMqDisEVZt5n480/5gxXInmWsZrNVH2O8ntuRkNdgqO0dBhF
         UFf0ZAjOtlVWTx+TXexY8T2xXKqMeWxt/xKk3gihK4DwIakPfKvtkvWH0jmlcztrxk4E
         /nh793IwvvyZfgKMngZghaOWBUe9mIJ334qlKBmneyE5XM6TqMackvL3NxVsxZkfGRto
         h7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        fh=Ag3Fm4n2qr3ZloqKINa5k7xwKq4bqPgA11vVF9dZYdQ=;
        b=ZVuPACdN70BB4Vo+kF7VxFLKoVbEzFV73nEjdrV19RuQxD+q9lhG98L0f96xK6lDjW
         9jk/fIb0l659UTiz+tzeTWpRcHPKOBxPYEC4IzdeVfNYWXaDc25mkQ8fxE9z0pMus+g8
         soWovHerB0JF9lRrbetOaC9GVdGadU4Or7WQdr50BIUxXLh+iqbISjIcnf7eJViwKpeE
         WBCyG4OBqbXU9z/l7RJ4uJI2gQsZf8Z0j6gGYisMO7XdY0841kSpMzqz+fFMVWsKfGdy
         tv5KS0hK3jh4/KQjYiccMBwLnK4qeZykg+2Qza+c/ebbClJL7+WwqTP+QIMPUj1zvK2+
         2+Yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451522; x=1787056322; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=Mz/UtZuUly0dytp9R/6iu0dORtXxP6huN2iPGVFzjzwA5pT7KikINQUgozA6P/HsSD
         kDY8B2pjnA0YNB02lYNYmoWZ4TqWlSR+7VRSjR+q2YGcEHRNdyAOAQ3YrpVWxrxi79QB
         hqQ9nMXvuKBM7aMSXN0hybv/2hz0Ve3iNGchZnXTkpTeKviFQXcYMuz8eZE3ksIQpXJ8
         Y+zV+3kdkrESb5iHj9+gMXJk/Wlv++lSGkJubaty4Y8CPu048li0jrAkshTi52inHZRp
         Ev98NBF4mXZR1raJfNYe4EODLmcpVmu4wjAXW6Azw3V7bTjHiLlk9wkBRLFbe9xYHEdx
         P4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451522; x=1787056322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=phGsT939fubpIr6Cxf72RxiAL4Jd3H6jp81uFmR6y1pzBGrKbVmfxs6oYJLSq05o1H
         3XveIrzgLrCzDRyi0Si6Jjw9gPQCxDe078Ek/igF+HkwXgyYlqEPtrsPvbKQsJE4//vw
         g+W2U4eRV4/TSNhOciFgWhxGZrk/N32Io1jFvDZ1SI0dUnMwHMRssDVdVd00i7onckZk
         n2JeFZi7cC91LUxohJ2eSjbb9cudQ6TdQlc0NMQJgdII6RPz4gHaSsWnHp5lEK6WMALP
         0BubEjHQTIkFAIFru5oeXc7qhIkGBmjWl6fZKfiQb+x3uE21SIdyRt/ydBDgSBfY0l/F
         FV4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9nPdOpGrAi8UYLCof3FqtKEPtp9i89UAVAkiv+qUduV0BY7qfUBtKonVCKx6svHbOdEMLzm9OGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWnkaqUu9qkTsdCIK7aPOKoC+gF2a46UPakoAHrIrdKj7l5PmR
	DJYCwK6dKL/lg455hi1LeGaKo2TZwCxCYdT6xq4Js4Sru+2bakQEEkjdrB62eojACIffFrwVj0+
	LuBTqYgBOBDgcSfJQLSV8enDJYhwyHSYY/fpUO0mi9g==
X-Gm-Gg: AR+sD12uMtTxBHlRdPUjlPgbZtFLMZ8AN5SqPu6m0rceJzGQfHcAlX4NFzoHOao7UqG
	/o6EqUxfxTLRk5tpl6i+RQ4A9aPkFVAK+VegT1ok5bJkRUB+QaAJj8tqVxDZZzRxScNFNUFwqr+
	ZdfX/Dx4xTY1a/CL1q7YglzzK5s7pQwIoPjlItgjGGQRvL4Pyu9858gECcddehfbLRvbD8xq/Us
	sQreo5jX9H+H/7otqqJnG+IthoVxDXYw36L1W2kE7YReaankh2igi4y4pE0CXK4sZrNGeb4gcrD
	xGN61MXLBCJJ+uog+pW4wOYwch+E13umviwijhzi9a2w8deJ0OyVJrFCxZVfMa4+FR47fddYFOw
	qbtbiBbdraSByBvDtPATh1GKWVPuAGiB6ook3hkUKNtYJar36bCiEwlpT8IWO
X-Received: by 2002:a17:903:950:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d317790400mr26287245ad.1.1786451521959; Tue, 11 Aug 2026
 05:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:48 +0200
X-Gm-Features: AUfX_mw-sYa6mBs4ValMgNlBU-v6shu4N24mrRNJSqO0XtM0upSdH02iosArTGY
Message-ID: <CANiq72n9TaUgWgZYg3Xzm2mn3Ed36B7O+f544a5BXik_XUh8FA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:57=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
>       rust: num: use const_assert! in Bounded
>       rust: num: reject Bounded::shr overshifts at build time
>       rust: num: add Bounded::shr_exact

Applied to `rust-next` -- thanks everyone!

Alex: I didn't add an implicit Acked-by to the first one but I assume
you are OK with it:

    Suggested-by: Gary Guo <gary@garyguo.net>
    Link: https://lore.kernel.org/rust-for-linux/DKIY9YGIPUUE.SZD2DUQM9NGK@=
garyguo.net/

The second one is actually fairly important so I did:

    [ This implies we can break the type invariant, which in turn means
      we can trigger UB via `Deref`, e.g.:

          rust_kernel: panicked at rust/kernel/num/bounded.rs:528:22:
          unsafe precondition(s) violated: hint::unreachable_unchecked
must never be reached

        - Miguel ]

    Cc: stable@vger.kernel.org
    Fixes: c59a2d14cd24 ("rust: num: add `shr` and `shl` methods to `Bounde=
d`")

Cheers,
Miguel
