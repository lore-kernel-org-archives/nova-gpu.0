Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EA4F85B4
	for <nova-gpu@lists.linux.dev>; Tue, 13 Oct 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897506; cv=pass; b=aTtIjAm6eOKBuaI4sv4/M5aNe/QIVuIOmyraP7VooV91xZpeeG9zYwMhRO1tDSyuKXZvTqyEo38DUhX1EA+mFYjWDwkcxYDa5OElWNG+4Zt4f2V9LPH5zT281TRCQTEv+yV/QCZv/w/ySVVwPKuWgkRw9zh/sPbtBmiwnAALSIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897506; c=relaxed/simple;
	bh=hJKIthmcoSQplDJE0ksiUJ2iIxFkUQVvqygF1wIyD9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajYdOGs8su2AYWi2RY9oltWPDO5B4PAkYE1kXxt0Qfkn0YGTl9JbtVGU4ipoRIc3mMsMA4/PFyRSnbaPbpMNrCVftgIm+N/IIcBR4nynjG05X9KK7Hf2IcpUhALctnWaDexT6KrDOqmjBLQuN4rOyEo4KRtbkRmNFEnVPzbBbTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0Mqxf/g; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0Mqxf/g"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-313bab9cfe7so313015eec.3
        for <nova-gpu@lists.linux.dev>; Tue, 13 Oct 2026 06:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791897503; cv=none;
        d=google.com; s=arc-20260327;
        b=D1YMc9PmCkXmV7FMyRGq3x1cNPGDJFcIDmzMB93flTBYqEv5kwLfK/cHQefxN2TrIP
         5zivW/J3upj+mXc4Im9Nh1MTSewoHsa9vnCI967yz30JM203sjRJljhjVCwEDAMLnOf9
         Z626njIv2nKDUCkq4cuZ4SxUuROQodfP2JYOl2EMLr4v0Zevlvmvv9x0u13ewtFMQJyg
         bkDy9rZ1HfPJ53lYiMAN4cC6fryjD0k34OOgunRBJ5hzqFQPpkY3sR/1ylkPmTuDcPcT
         mOqkTOetC8M1/rUtrmvAzF1gKEm0Nbizzi5l+1GG4MiCEkUQfOHuk+DyWKgQHuziPViC
         VKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        fh=JrHvzTDrzryL5SbhmDr5z4oTSNrnnMtEsZlQmo9kC9w=;
        b=CitprzMWQbvr8uvU0nCah/X2DGrXLMJlhuLajrBE8t7VAIZxOsRAEFjnAkeMDQc0X5
         vQoTXkX09EN8M+T0bSKiVxOu6m3QG5M0ERgQYVB2i/eXQuS2faNVPWLM1dk6psTpCBNg
         jtdPqpmYaHnhY1VkjgyMvjeNNinjzscnTG6W1aKUnEH1hnSgUbnFbvIBoh5eFakRQqCD
         F91rip2/QOb/xuhl8KrlUj80aFWPbwPIDsmQKVjVOaWAjdloTWB6lHkLsUnawFYJ5Wzm
         PGzKBAIdI8vxMKv2WwRyEmG00DqsnU3WE+bQXrSJOuejRYu6ZKyyUZfttZm3Fj3obKkF
         YRVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897503; x=1792502303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=c0Mqxf/g51Ne/hxAHwK+4CgkRqSrBa0VC52zwZZbHXedusdQ4eHFPT/sX7JImhtMk2
         0gewWj+T1+LL+TSQpgmQKVw/aTGVYCKFUfUyxLxTxx7OttGIq+N7io/7oJtfMsOVU/mQ
         hqQbZuqhpRJMfBQ7C9eQOmFw3yhO5v14Ue39U2sqQ8ExNLQQ4RjjLFAmQWyPtP98+M6I
         dqCFQyj0T+8jJ9HIcLG8sxGkgmO4xHgiTiVfT3rDrXInUQi84qq7uMloS28alA8Pu/Zx
         BB6ZqAdzidcpuI/ui4/vVDY5RdJawLNbWbaJosbpBQue0RzOogze1gxk9h383dxTObUP
         KpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897503; x=1792502303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=gTdLreME2mNQcUa7sNu1s1MUEFbgnwxhGhEAUF3esCk6s1AVXTu4uXBYZYXGRKckww
         Y0TXpLus+jkFaH8qHyOZq4HdVe+txDXugGg6eQHxVbGf99gHJo1BG7HjRELZQLwac9Fy
         S6ocHlSPHprwzG+QDWqJb/nJvqdzFAjzcmLPxllixlh9JYO2wBjhy6ep2ik5G5dTPjum
         TW6b0CWnlK3OGtsmbxbOJ7M+8oJ7bGwSMOAN3lqyybjWq2Tr6D9dSg5xu2I+8x0lcJWA
         mt3l3xWiKdPNNH4+f5efIQkXvaT7WQA7aX2mse8wO8f8avW2XwDmoeLITdEiV0NxlgNN
         yNRg==
X-Forwarded-Encrypted: i=1; AKwUvBzxnCmodlYZ8EmZV8mlYcVn/t4R3qpA4qDAWLGVE5TB2OJ90oK63yhKZnp2TWTYDL4+/32d/Y+9Cw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLhMgTrWvTdn+Q6b1CWD0adeqrriEQ+TBNQf+wIVunaDHXG2/8W
	ozn2+A6B7oS3GFXlLe8G3VYTx3TlT5gXmxn3Cr+ydDPx1vvktPkr10H+WvHbmVVaqeXFOhx8X0C
	bIMmuKvwEFLFQj0kvTeUEuhM1eiU1MK8=
X-Gm-Gg: AYBFou0hjR6xn37N3dUWuQ4gVNhPqkDpeGCXuCWM58JjsVKR07Yay289FTP1Mv3B5pB
	q8/7TBL9OdYVLuab2Gzyx3nd1VHDcYRCKL2rIddJaKi6cHMh8Rs8duFga21uly+sYdOgTohiANO
	6EZr07+VacORO66RRZQi398l5JFuDkzIAw+SBgGp8NsoY2/f+H34UiX4R8B6JMsryv/wJruzsSx
	X/vQI8i/tI6HTuy7ztpTfgVO6c5YpedbjlJyt2JvNai+2waDzXBtK724eN+xVDNjHhKO1bMuL8n
	JnV8HgPzW9uuL8VTRhLtndgHvecrFzCGq6BxodhIo8c27CTSDyf129krI7/h4riLYESslDz/zx2
	qluyju67zrwoG+YeflYZX0E73ecFhKwK3ws70hnC949eDSM7YxISADUPwhO8Pc5mvuLaxEs6Z/j
	wn+Hn2boYpupeAeP17BpbeTwgPnICfu1koTttDZPLuBHT9+jN+DWe0vlCGb4vvaw==
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-16b4f520f3amr27369676c88.0.1791897503344; Tue, 13 Oct 2026
 06:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-cv-v5-0-113a538dfaef@nvidia.com> <20261013-cv-v5-1-113a538dfaef@nvidia.com>
In-Reply-To: <20261013-cv-v5-1-113a538dfaef@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 15:18:10 +0200
X-Gm-Features: AclHuK_z220Bvz1iedMpcDzIc6RcPj5ZS2ls1iZZ_k6lRJyNsSKpCWB6rOoIE30
Message-ID: <CANiq72kccCL7DjBtLw7AF-nNcKo7OjjVwZ7Ba4fZAQXVZaMkMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:58=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
>
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added a few intra-doc links. - Miguel ]

And thanks Eliot for the quick respin :)

Cheers,
Miguel
