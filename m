Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E82365A12
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 05:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154597; cv=pass; b=HI08qiK/sV1xg7tl4lK48UEeY5TIk+2CMeR3kOAqP4XHItULDMRIBoTniOFsl84/eSS7w6N/8MazhNb6o8wUOUDNlHZHYYOllp7XtXyn+O5XzwsZ9N0asSsBJaLlDA+mHvCf3VzZp4eKxKBSKo88CiNiNosGLbmERc595US3k6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154597; c=relaxed/simple;
	bh=8CQLlPE10gtfc+80LGNUmW64kb5+lwCt/hJuXkDKz8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zt36tYqgyQXYWMZcoAstv58t0JRinmOIIRJwlT4p7cWe2Xp4PQis7k+p4Ot+5UM5LzXOTz/l/00pStQefn6QQXf0IGM98B7RiQs4qVHi2fdrmiNylysNL9D0QJijip8mwQq5OlqDu4MTHIP1r14MCIyPMoL80nGh3HwY2kReu7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN5LWP4w; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN5LWP4w"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304cf9a02f9so444271eec.1
        for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 22:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781154589; cv=none;
        d=google.com; s=arc-20240605;
        b=kVKkdSMiFuTyzRdBcK7CNX+51NepR3gkOdD2u1V1aoJ8+MKvKmm/hwkfuPn0xClfBI
         jMxE48lSxUVA8PdlGPB4dBc7qbYq1b6rzDggBFXO9IZLwoUPgOFXMOvB2xJVEpYgu9ur
         NiE3x1N1qoW+UFVS/PAIBlWdOQyXT1L0bp+FMHua6WqY80YBMyK+pqj7P9cscsg6jy6y
         UsfP5N8tEzaV3+GGMRqp3h0XefWl1e1n4WjG8CSIllEjeAqo+WsqOr7Rg5Ls/XMRZ1vf
         dCfJ3CkbUMSyrSzT/Km0HKW88m5Glx13UM50U98pztqRuXltjQBtkaucfX0GHU7vBJlv
         6Zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        fh=TyA2HZnUzNvM3ZwFA/PXUoUYPNiUq2hGx3B3jzDrqbg=;
        b=Skp1Ig+EFwWt6MfuUaQRb7KTvsSThNyR+kYlIYlXyZKpOMuaZEpEl8RmW4Uq/50Ju8
         GA3KpotiEVOMQPgcEL/zF7j4GGSjeVWqvddnoVbedgIVaWOjSMMMDszSJu45aGopriOn
         mdDTEPKtgTHJDq2WtVMKby0iMSmx/CiDewbTvR8ceqwylb5WIAudu0aoDPIebj5Upf/8
         yNHlm/UM4lV9md9OQuDO3d7Wm02dyQ47iKvC/eYUuK7r6CTazEa+Tx7wTkYEDXLlgzFp
         JlXPWGGgZ7X4oylRCLiGk+7W3N6Or6vRCCVjKVxX/26iCMKX9mr/nDAC6K6CfwTL/nzc
         eH7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154589; x=1781759389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=WN5LWP4wJjst7PLke9zvRSLycrTw6/1EO8VfQZhNHXS5fgbgU76HdJTGCQFUwA92tb
         qGjPLY/WS5+DRKZ0jxxSCRW4gHrkNpLA+gwK0KY1jnmnD0pcge9Sw+nOT7Hpw4Nij7Vv
         +kQ9gx2Dq2Rwn5G5rjsvbWfZIQje4gOifnabzdyPdezQSKJ3nBr8rAx9XhuctJZ5E/b6
         k+nz/tRTX+oO37T6MzljRhTPncBTXyYkMOexBkiaDQ37qsvTTr/j8maL737t/ABXC01+
         k/ajXsCtlHBZ7jjPWo5t5eNT5D0dGdQWoXamPEwGErU3IMAcX/hrsySdkFJ2HZEHojAz
         APaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154589; x=1781759389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=YxsHrAQ8oazH8UMUYse199ylxT+Wgo59peKWF4NgqsHZoyBchpN66aDndfy/3IORBp
         AGQ8oEMosiXcEASpqxu+lpsHVQ98LF+gJh77rGghs9Wg60zP3By/IWHebgohF7ygKUi5
         OQ83/rd+O8lYHmRqL87DDmoP31auZQx8/fKHQtfLDvPvj3cgR3gT594eQFLHXVYqXubB
         M1CZ4x8o7DZclBoF1MgbDSwYof8YoBk4foOLFsf2DkXvlO7DyVi8NgSVL0sbT3QnMLV2
         dWz2xqvvHNmp/UYEy88l0edyPcFFyoseJKqb9Je/6zcw5mUi4mywgKF2M+wX08pIaYzK
         BZbg==
X-Forwarded-Encrypted: i=1; AFNElJ/nOfhNy3prlCe8XLuMdVcgwnN5pGxMXSJVYQ4S+McKQ9H9xd/AtdclnMjY2XRA7mgRhB0CG/YzUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLqtGGL1GO/DuRUZZF+1Po0Qu5fU6TVmcnZwzfDctKsJz6EF5G
	9y3gdU9x3XJzLt03ZswX8v6aMe70FWhuSrL9d6aDlZOFewYKDqf8mYJDGTbXkYmw6gLJBhwtf53
	Q9LNKF+xsy97IlnXPTwcdvq0kGSdaud0=
X-Gm-Gg: Acq92OEEh1pFXcB7Cef4etnpI74Hx/jpRTReNvnc5EwjAxS9lnuqBvMmpjfolg02ycr
	EBq56VmeO5ZbK9xiZrQ9+t5i4vuIzc/8yYUR8PCr89u8/plODvpkTHJ/5El8yP5xJNAqY7+GcIO
	Ji7H4oIbjxv6yeXiikd8h9YaQGbUqT2V68ZfNomShe6YYLhamwaDg1gWP401K0l8r/IO30DXWfR
	yC2K81rHYSVtpM7F4+UKry8/F/qjhwoCCYZdpIececP36HgD975BAm7PLNsHcuoFc3ovVmT6Ktn
	a6Y2fTVT/Ki6aacumSQy8so6mhK7bWV1LsmCL+kBLgt+8bLqaAHrw5hSvrkYpSlkdkAEXog976I
	pxRg30oLcvd89Hbn5DBbcvOjA4/z3O9yPfw8OewsYeGWJ
X-Received: by 2002:a05:7300:aca2:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30804a5f5e2mr536231eec.3.1781154589390; Wed, 10 Jun 2026
 22:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-io_projection-v3-0-c5cde13a5ec4@garyguo.net> <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
In-Reply-To: <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 07:09:36 +0200
X-Gm-Features: AVVi8Cf920yVhFg_hQqFb2LNc7XWN7dI5ldNW7tmfqMVwtmKAogJd1U0zilXmbw
Message-ID: <CANiq72nLZPG_Cnf+R5B4CoxzbLpOWy39A+hiVtetDD7zT6MgRQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] rust: io: implement `Io` for `Either`
To: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// General purpose sum type with two cases.
> +#[derive(Clone, Copy)]
> +pub enum Either<L, R> {
> +    /// A value of type `L`.
> +    Left(L),
> +    /// A value of type `R`.
> +    Right(R),
> +}

[ A summary of what I mentioned in the call yesterday so that others
can see it too. ]

We had `Either` in the past and we ended up removing it in commit
28753212e0f9 ("rust: types: remove `Either<L, R>`"):

    This enum is not used. Additionally, using it would result in poor
    ergonomics, because in order to do any operation on a value it has to b=
e
    matched first. Our version of `Either` also doesn't provide any helper
    methods making it even more difficult to use.

    The alternative of creating a custom enum for the concrete use-case als=
o
    is much better for ergonomics. As one can provide functions on the type
    directly and users don't need to match the value manually.

We also wanted to try to get developers to provide more concrete
enums/names for their use cases, instead of using `Either` whenever
they may have two symmetrical values.

Anyway, if we want to re-introduce it, we should likely add what we
had when we removed it (possibly just reverting the commit), which
included examples etc.; and probably add in its docs some guidance on
when (and when not) to use it.

Cc Benno.

Cheers,
Miguel
