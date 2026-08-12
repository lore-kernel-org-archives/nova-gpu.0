Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C843FD09
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552425; cv=pass; b=DIsONUYqkbwz9uA++WU6z9JUuV/4a1I+DeOVv+X0EJs6UZGiqSHErP+/9VpZbvm4vJoV6K5/qJo6JnTeBMlkHHA01v+3l5pqJpEdecQFd7EWxCHIX+T4gKsXKpYDhJ6Mjh13mNtKDIUYWWOhMPxftnLQk3dWyoVJadgcX6hn3EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552425; c=relaxed/simple;
	bh=gOIsyGGYeGZsd7+1t35VENt6hUZ6tCz5k0UwrPgrJB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVvvWg/retkM3IxYkuAO9E2shsz8keQn9rD8V2x1H6Dm8ztmWcqqcSxT30JfLJ07K3h86abyTBmWogCdPFqkFU5qupqPH/Bo1fW6+qSVU6NTjytC9ah+6ukIMwQ4zXCxHGQK0XUjp0Rsu6INwZADMtbMUwJcRbpFKx2eMzKRamU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6i7E+sg; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6i7E+sg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccae46de39so2130115ad.3
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 09:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786552423; cv=none;
        d=google.com; s=arc-20260327;
        b=ImSZUj8SlgezznlnDbea3z3XqkOcDtZaNBfBZrpCsBX2hKV9s+k3SIrVHL38LJkwkW
         2hCpwr4FRu3lqkvPWN1ZzHi/B4pB0yfUVb7eXrDhAWe395muo8YQixCkymmc+YXMUzQB
         6J+6QUVda2chpRXpBWkCtyIzg6Z20lhbDeucEvN++tPHWCxjYLQnKvO0M3t3Y3aUs+K9
         UQ5AghKyKeHaIAP1mMVytZ7kou+pTDGqFjm0ys7j2wFPr88ApbHXSswZFpuzLNQFiKk6
         a5A4qPBBhfxryCT9mT968AlNv3R3gkII1QJbivaibX4ZOC2XsSRVZyhmdFH5eWA3X/WO
         a0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        fh=VkKxxhCeOA28kLA1tY/S9ml6YxjrLYUGMj1RrQAyzlo=;
        b=ka09TaP4MgIxK4Hid/WqVOE+9cp+FHO8NkIPuZHIFZKFOrzNh1s6ONmK//Jh0TZsX9
         ocEUAT1wv2l+ZVsywRhRe52YlpgkcJ159w1+XxW8LDCOcVfF7AY6CszJJuefA5QMacJS
         6IsbObW5rVNt83vseqzXRh8aEpl589cx1BDEh7WacDKdgGRgDBX2/lNPGL9HHCLfbmvd
         nyc/sYyraX41BQGOvxubGKJug+oRemePDy86cw2vlbBV6WZT8zW8yNnA2nkn8cp/RY/B
         CXxUGF+IzuYdyUjTL0UgbRyrijhPqfdyuvkhs0vCIOaLZVdZe7EQbJYHIcbVkb+rty8u
         9J+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786552423; x=1787157223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=s6i7E+sgbDR0v8T1J0EsvXDnfgyA8SxXV0600GP3yAOPzqJ1NTFWVgOvkoxFLSokLy
         NMkaZIYVj9PQBIrP8jPMfeC5uHmOtJ/5PAYbM05SrMNJQpLATefB3qh8TBTB8MDe2EUM
         1w5elAJFx+4Yu1sZiUUpfj1ZVGhsaiabAx9Iuo/uz+CVWR4FcjXW/46XLaxX3810uZwS
         h8B/XXR6fa+3Mn0dBrlsQpikZZ0zk3BuP3+L8qrp0eIvMTy+XY9y/Nhc7KHuIF3/OkWe
         G+7cWLYWNCXgQ8zJr3Po9xuVLZgi70xu7jkUdjjaHBbHfWGxHSPVFuVAsjHChIpkW1YW
         Afqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552423; x=1787157223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=dBTtxM/OS31PsR67+LYuC8M2aqpzwdsEWdT4vfnH2fmB6W7fAUoxBcsoO8ghWo22vl
         MziuBP2IYGnblquLo2Mz/svAOW2Jx1sj2kjnq9KDZf2try/7aFOCkk/A3u7EYEpux4fF
         N0Q+fKdehNLocDnjiYXduGZKnfMgAsKSKSmWLD3Qx9m2diEFqsXmVOz4IGY8oIFPdV83
         dSvYAvy9T+pUlUVNdXmNzX+SkNw0Dtd3UX8k0cwVsdkAmbr/4FhTwsSdaALMg9XfUiN5
         990xeo9r0WVlzjo68beMLtOmqbntQXN/ysz8Lxtw+gn6cSDwSw1b4VvPh87NEPUEYFch
         StCw==
X-Forwarded-Encrypted: i=1; AHgh+RqBxeKSF92H5sGjC6p2KprSwim3EHC1EyzmFzgAcsvRYXXXXQ6O9pHE/xKi3gS2jt2j5gzTDtGvQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAWaqbrnnAs7YeWjc6Lbrm8WEuqg/p61EPkz33zpfoErVxDI8F
	0B+HwNLwfT28zcUexijdAmQs5ocYnZBQO/eecjFOW4uQzg/TWR9Fhmp8o9+iTUNfqz8gxL1ycI2
	vorrAkKvg7kgrUfGv08Oglaj6W0mUJxs=
X-Gm-Gg: AR+sD121zQ95Jb6zieIhGJOln3LW4lwijjVekNCB0JS7tX8Q00ercSGtRSdcBF7lk8W
	yc/bnNKM7uIB+DKdXJCeEtamB0p06kDNB02ULVkDxvpJARPjBuQSpX0iK5f56PzjBV2grzUZxJO
	lJcYai89w8YJ/mF94kTM1gLPmzslb3V6MASYW/h4H2NsozdNM7nA5hZ1qG6KCJlXCawPd5DWqVs
	1zkvA6c9y7rdz0M2XKd/5fzh/LMgWbtQFG7yFsPrs6RavkP51PC9rVTnfnmBz8wmKPn+bG/zmIq
	MkrHSbn7WDDb5p6Ir+8XT02puUp3I4+gSh0zppkPY1XwkBlixfV/RMZC5PPjl4EYPYafAvIZWW5
	LawNgbTqZ937FodlT5BsAg6fP1R70TT7HoNcR2GzqmNZsyJCVTSXXS8y9B6Jd
X-Received: by 2002:a17:902:d552:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d3456e7622mr58880125ad.4.1786552423044; Wed, 12 Aug 2026
 09:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
In-Reply-To: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 18:33:27 +0200
X-Gm-Features: AUfX_mzHM3XF1m8TGRbbbrVs79_o_CCgi7jI9gpogE6umN7ICq8ixcdhm-skrqA
Message-ID: <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Tue, Aug 11, 2026 at 8:41=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> The series moves `THIS_MODULE` into the `ModuleMetadata` as a const, thre=
ads it
> through `#[vtable]` to set `fops.owner` in DRM/miscdevice, and updates co=
nfigfs
> and rnull to use `this_module::<LocalModule>()`.

Applied to `rust-next` -- thanks everyone!

    [ Fixed `clippy::undocumented_unsafe_blocks` lint by wrapping with
      a block. Added interim `#[allow(dead_code)]`. - Miguel ]

    [ Fixed `rusttest` by adding a dummy `LocalModule`. Removed interim
      `#[allow(dead_code)]`. - Miguel ]

    [ Rebased to avoid the imports cleanup patch. - Miguel ]

    [ Removed Acked-by and Cc. - Miguel ]

By the way, I removed the Acked-by in that last patch since I think it
came from an older version as a series-tag that didn't have the patch.
Please let me know if I should re-add it.

And since I was editing that commit for that reason, I took the chance
to remove the Cc because Petr already gave the Acked-by which you
collected, so normally you don't need to keep both in that case.

I hope that clarifies! :)

Cheers,
Miguel
