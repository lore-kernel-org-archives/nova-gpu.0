Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E663381EB0
	for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096964; cv=pass; b=fMlFmjc+rkhC7bF7+SPLmqOE/uin9riVD1YKpNUoZFEzav68kB2K0rwIzwE2U1535mREEUiOWgbT1ar/um71kqiuD12IVSOBMmL2DPi30CvDWREiBDhvvlHuVuPqhHu4MsVn/T6G/WWMHnM3VQoN60q4wkvz3uyMA+mnq2JnXOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096964; c=relaxed/simple;
	bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDPsBAEfJ8jZPVxizlpgHGTXmmXCM+IH1M151Ckv4YwAF0kjkvrt8w6CtFOHnSp2Z+179fvNvdd4SMhMjhtgk+ixb+BWzxgUL9BtdiAdo3SoW9dcJvK0EwKLxiJU2pTBnrxdzfMseY/SXPc+dtsrjtV0JbbWp0y+MC5SMV40P7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1PNcm7G; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1PNcm7G"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso50856e87.3
        for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 16:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787096960; cv=none;
        d=google.com; s=arc-20260327;
        b=K5yGeGi4mm1Q75yn1g9Jhc9H+DlxfO581hnjIgnIha3jtkqVCfrV0Yod8RTQBxsX1f
         csKJsrLkFWyx+Xtf5XayjT/wTip7enUjR5Y5XKHQ+5sgHiwuCEN562RNZwQgU+7eCwK4
         nNO0+Z/ubPuRbfRJRjDJP4Fw1uCYbfz4YYQFbOGEALj3+Tfy0hX80K0lMyBPUWFmTCi7
         RdJBQFf3eMlDcctfQirMk1VBaEEMm1EFWNRUKQiC2m28FgH0GFAxHjCWm4cwgytp2qrU
         bvFB8Jm3o15gRNCH2V7uJSrMSGAHZFSb7Waasjl5sgW9o+npxE6YXpI3jEl4N151KtTR
         lbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        fh=0U8lu69sym++C9RmCtiOYMQydB4Mm894/oFOmZi2bBY=;
        b=Mkk4Q7WBeWh+PCfnuH0GE+u3FOK+TrHZ4WwRn5ad5IfUIrF1ZlPGtkOO1NJgrQXSsD
         xIRxocsX5zMkj8fORslsmQZAkVauL/ywRBXiZpnekoqyic93NnDLt3LUgG19r++SwNsu
         Pw3T1DuXm5APaEbPR3Jt7vM63bv8c+i9HmyBsl9D5Lam3Cwxz8/mOyeEal/JY5bwzqhl
         2cZjFkezehSL/QntmZoVzf9FMHQCeNUpztNTwhEjvwI13iobpUXS6/UTBoyhxwTuoH2q
         CwplJS0blnb/NXqTa3bt5wyk1DdpkhfT+rBrX/21m+wMV20MLGerRU1RqqvYAPXLFjnc
         Suvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096960; x=1787701760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=T1PNcm7Gs+A3djqpCSxevyPIvWsXzbWVNNrwppPusLrzsIzl9//XRdZPXDEYeEI95A
         kwY66IdHVq7+tFBUHPIdNbSCOe/0hrzjI8diOaggvAtnf6Jfjj18n6kJS6T76ybvGTgf
         Qbi83amWvkxtaJeOT7RM4rnrdsZhWv2raSRrR1bfWR2ObVcR501HzObuo67Po/obB/FI
         LHX2lMYz6PdqKnTJw2IZctk59dp8mIUEM6zJbwqnB8Tt8pG0J4kGLd+vznuyg4QNqt0H
         jwisDOalGZ/NpCiqKEv46hRVTBUEe9+XqXiu2zKdqGy74WJs+l0bsN5WywAPshCikiEE
         DzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096960; x=1787701760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=bj9EHh4r0UBfKEWVHQwSUfbYBBthi0jDj48VuqxbwOT3WDVtJgEXAaPDGvb95JA3pT
         QVqlOiY2RCZtkYUOmQ1ACspEK1JQyZJu0vKAg6uvEutVUEfoJfG1XGlxi0YjWFpKo7wO
         HNCZeGej9PntFtJ2tAgTvdzcNf5ZKdVDIo9ddgK/HFSHPPC/yak41ILRWNxXPujcEv2P
         f2aRkLo6TnCBHuejmD++v2r2dCb6Bm/cwy1K9VbOyvOsftNUS8QOXK6EAh0m8AzLJEkk
         eeQun5EktraJ5RpO50QqZm+sOsEuJnQZ7omSnqkNHpNoILNqQDfin11oETrU5HF5QRKS
         jIpw==
X-Forwarded-Encrypted: i=1; AHgh+RpfHZN3TC0hhaLyPdSh2wy9jWZQWmLJ+3k2eBJpy8JbJ7H/W7X+hWyj/bhZim6zCjLgTc/hlG/IKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx8mOnmUDKtodexcU/i1C8QyrkFywogYtHjs+BYrvMDdwHy36v
	kZhzMWKiz4SpI/FlsdQIz5waybLsGuD4qPx5yTQXS8re4JQSRb9Z2aahriM3rg9e0A20hFXyenV
	gr8b5Xk2ScDyUDTXk8H+niInXYB1U5/Y=
X-Gm-Gg: AR+sD11QhYZ/5lmLbLeiOslTV1amlm0EJnxAVF6oNYXElhTSqnP1hv+fWb4CrRFZ+G3
	mlmg74AckPuqEQrjLXSbmkSp/I7y0fOXF8/BRucnHYyqWE9sUfNAWikZe2CioNNUg2VdElReAOI
	iC9FA4N+fH8IRnpLmehaZZ7DXDmZPA3bHyEOdpuk2vdNZdRMDxbBkFFpBEQQwSLNggHqrNElixO
	fS/hbQUY9EN0LU9FVxmwBiuN0phjuV2NrGVyL9+ag47lkF+84oMJjJcyLR2/qHsH9TAM3aaA4la
	yiTFRL2258HkoH/YI7jHlcyqFPVQgT0qTgva7eP+Tt4wqLcjQq1xNzfSJom0FsVwHB1UMwrAcQ9
	cTyzs0IjLGFy4PIHbGFP04lYlMfkGOgzM2u1tTp9tP/MBZbH4N6HyO8fvXmuU
X-Received: by 2002:a05:6512:3409:b0:5b4:740d:6daa with SMTP id
 2adb3069b0e04-5b478b82ec3mr66034e87.1.1787096960202; Tue, 18 Aug 2026
 16:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com> <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net> <aoTjHtiSHJAuDQ7B@yury>
In-Reply-To: <aoTjHtiSHJAuDQ7B@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 01:49:05 +0200
X-Gm-Features: AcwNN1WRSakbfVQ8U0riTSPzb9OJF0aufUcbMY-OEMi-rmUv3-QMTzisl7KpfDU
Message-ID: <CANiq72=9X_WmkkRrrBKvLKBatgOnmAO2L=LbijzwzTv_Xoc5Hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:56=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> If there's something more complicated... Let's wait for at least one
> real test like that, and not speculate on non-existing cases.

I asked because the issue is that this enforces a policy early on,
i.e. if a user happens to need it, then they will have to dive into
the implementation to change it or, likely, work around it or assume
they shouldn't do that.

In other words, there is a cost to enforce something too early on.

So it is a balance, depending on what we expect, which is why I asked
David about his experience here.

> This series begins with "enforce", so it's not about being nice. The
> generic kernel tries to save every single bit of memory and nanosecond
> of runtime. That's a secret of Linux success IMO.

It is great to save bits and nanoseconds, but KUnit is explicitly not
meant for production.

> pay for the functionality they don't need. In Rust, before e74b7a3f5a
> there was no way to throw the tests out. And even after that, we still
> have such tests.

False, you could disable KUnit (or make it `m`) -- which is what you
are supposed to do in production.

So, no, we were not bloating every Rust-enabled kernel out there with tests=
.

> This is not a coding style, it's a factual error. So it should be
> caught at compile time as an explicit error.

Klint and lints in general are not just for coding style.

And lints are also compile-time, and they can stop the build too.

Cheers,
Miguel
