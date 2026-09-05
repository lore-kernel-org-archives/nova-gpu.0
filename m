Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060C25A2DD
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635932; cv=pass; b=fUgdxuaYv0xn06J5uJhS/JB9vDwBNek8JD1mA2DsnGNcnc/qAmTDNZ1Q5vDcYGcPAJWeDuLqSVZ9G/ktGnj16j6xiDtumhP8R6hFR336at8A0DKpQeVDCP13KV0XVFnKuavDilhCEf7ogtjnb3cWeiX/o8vi4J8cAx+Sgzl3V+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635932; c=relaxed/simple;
	bh=1A9tdM4UxvEUDadWxG3NZidYXbKcok5wvUqTQR6GVlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvKO0+GTxpd8S8gcUhAQcrVLJTg2wtSkf+qruVJKnSuGUwm6Hq9QKHUqiXWxFvyMCZeCOkwF6kgCc/W+86/e2jV4Pu5aGPpkJWC0+mA72qcnc7SZwnMqBlfbKL6VJ4SKo1Ji8IZh8izv/c5cxPazgVXqMTf+yY5gkRtyOWxNgd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9Pei3Qo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9Pei3Qo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so244241a91.0
        for <nova-gpu@lists.linux.dev>; Sat, 05 Sep 2026 12:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788635931; cv=none;
        d=google.com; s=arc-20260327;
        b=LPSVgdnZ1ESi8f+z/Zynf3hxz7dX2f82TmrzL42vbUoQOohSy1wBQ/8PuPLrf/zN2E
         tOX1DGqPmmhHdI+cpQFQ8eIjkNsOScy7lWSfQN78negyMTdBl9qOqO9D2ZlsMDoxAF6B
         WveKzceundsdEQIDLnkVnSlfp+ilyRhKSkElxEAsZ3tgF52F4f4lFTPWFVFquJ3oTt3Y
         86Efj8FuN3g/q557dE8U0sOj6+lbhuLgclvvat+NOXsC6aPGtRp7jF6tAmk+/OKdauPO
         1bY9Z4hoPxv6iamLUZ1jyjU2plID30jdIQdWarBQKJITxc1EoJ+bP7LfVjxcRxNWMQW/
         EkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        fh=SfWM5fIsyUsxfsfD6a785LyGMwgflYM1/tPIR7AQpZU=;
        b=RCoCYwV7D2YF9Xpob3hQFtfWScTO83IUhvLj8KNaCSGTgRGXPYn+NR0FIc/8SVfeeA
         LKBIdeH4MQy53nohRu6S6KbYYlQDDW+m4oaguanqhUn9nz+MTZzdf+AKgtylyJBLpKgR
         g9uoIFBnon7MQJH5b6Ps7ESi4+jkucQ+Wp197mTl05PAxRtMADIoChAfM033uLerYxhP
         pv8u+DKKKeHhds77FKHsu3y4eRDmm/cRiq0kyBOyHKYXZy0XqYTS+QjFyNmse8Kc+rFB
         vCCebec1Yt4vuGVCdK5gEVGnK2StaFCdYlwouSSWOXCQXgTBxQF2JWrgGZRC+j145XzF
         SvHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788635931; x=1789240731; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=V9Pei3QoiFmHeUCk3mwRXF9/718n8xpxO5dDGDt83k4Vl6XxNvO9FalqExCz8izFZS
         ogDeLb9a6fCp9Qgbw53kt39rXqh8uHGXpQ2J+Y8W80uRIxbbC1zOxhNggxGEq15suhpz
         7af8eerdWMxY4iPUgTS/lSrhLftK64NXCD0J4B/dFPPMU+FwiJWa05ZqQnk8dDRYhZUZ
         3RHFmkKweqivyOTScK0oV1mS9fIa/zL12C8sJyBtGo0psEhDyNnf4Eff/UUl8cZlvCRk
         561XwrZ9lqzW8eIHR9urzTUINryfyNvcavCerNV5jPLi6+0b/pzCICeaUBy8FbUeR61g
         s/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788635931; x=1789240731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=qYxxnVdVWrhirImLl0Kx12QpeAn0QCMv+HL3F5yed/AXZYLEja1uRujrMfyTokNVVW
         3tKMqvnvFPv6KySClINyBbjFDPJi1sV+cK1jheXA2nDLihgW+tjGY0Y9WFcWEchmVci9
         BDhH5pyVz+6a1bWRMEhcibd6fa1DvMPGUMPfToD7R3Rz7ppDY86FTTybJdjia5LafvTB
         UBgqCLNP4lznaboCZ84fT2ZOMEDDZ66ikDRksFmU2mGVfI52bQYmxgX3I3YZQKIrMPTK
         azhQ2mA+fUILLgYJ68nVD5vNTzy+OpEfG6Dqek3OTYn5vFuMCi7HG+ynu/bYMhG3ubDJ
         yEhA==
X-Forwarded-Encrypted: i=1; AKwUvBxDOmSVE1td3dtYPK0948QvUpiez3WWAA+TBfXTS61ZI1X7/WobD+zT5Ua3qjoYeRtlGtqBU1Abcg==@lists.linux.dev
X-Gm-Message-State: AFuF++nxgcwEcjD42egdL5EcOflHGRZZXc19tOJP1VjRYm7RPvzU82iB
	wsE0cLLejwuvW66WzLQt2BqeXK9Mv+KRHvdePfEotDTDcyi3h6PCnnA7bB0UlxGfByse4Cw8u2F
	kb/kJL7uYBKyl3Ve1njmVOZr+cMygl+0=
X-Gm-Gg: AYBFou3BXsaBE9RE4gMROuStJoPf1GUTKvhN7uWG3CLU7WANc/8ZvH0TGQu1kNTiyoR
	U/Lr2fceotGx9XkJ5ZVlAsjpXLrW64lyup5OofPEa2o4ysOcX2hGIS2mZ5YwMGRNCQF+1J3MY7l
	gbcIFHeeDJhNVNM5USa0gJfIg4bz5typSrxXczYwlDuxn1STH91qFoppq46t/M8gfoiwvLGiTqs
	a1aBOX9VoCnbrxKSvBE/r4PYuywZG0hnf0X2wvw5QAtn/cp8xY49hKhzupCUa+YtjDBdjzuVZwu
	UEiB043nUcsHK+TFgmBa3RiT6XkMq/1macPz5sNr37D5SPpSs//Fg1N7ctTbW2AWh3yHMfm61BK
	qxAGCQrRd6+PBiqbOaRmVQrOkdOWBv5lkAJIoo7p6+dbiKck9c9jWinzHlTAx
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr6481594a91.0.1788635930630; Sat, 05 Sep 2026
 12:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:18:37 +0200
X-Gm-Features: AcwNN1W_ZpD7BnW-6N9vI0Wb1kb0jyPzchOyBf701rQL7ntZoTH7GyzL5sIHsSA
Message-ID: <CANiq72k4NQ6yJByyb73Sy+iwqVc=i5CuZy2b5uRVksA+gkr9qA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] rust: mem: add `transmute` with deferred size check
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

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// This can be used when types are known to have the same size, but onl=
y at runtime.
> +/// ```no_run

Newline between them.

> +///     // SAFETY: We've checked that `T` is u32!

`u32`

> +/// This is typically used in generic code where it's known that type wi=
ll have the same size, but
> +/// the compiler cannot prove it generically.
> +/// ```no_run

Same.

> +    // SAFETY: transmute is safe with `IntoBytes` and `FromBytes` bounds=
.

`transmute`

I think we could also link to the intrinsic and the `_neo` one,
perhaps with a permalink to avoid drift if they go away, but not a big
deal of course.

Cheers,
Miguel
