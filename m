Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5161352025
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636274; cv=pass; b=hpl9VQaDDOWHjs6ir29ManvMjVSwnegSmoFZSc45hRslwb+Xcr2gj/Ni95IVsKlBpMCCIAQs44S12b97GIxUiinJxn9/uF8PvB7i3zfxRASQOj3t5b3j78irREZPDDs9d4dQX28PU6Xwlcmdc9+M2jjSUj/rOLLpPIue3IVNu0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636274; c=relaxed/simple;
	bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3Lcs7S4MsiVRxVRojff+Fw1jSzr9UkKle9Ig5fS1qF/dSmJDK8DDklWC6pYd5Dd79V9VS+oguG3QIQ6teBOzas8Giey1iH1XGkdxQ1iHX5D2qNRR6dt/KdAjBsJGp3Y+GkkmELXtc7zzQ1xr71Qd7D03G1D93Lla05FnM/Kcls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIZkNvkl; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIZkNvkl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2565so280103a91.0
        for <nova-gpu@lists.linux.dev>; Sat, 05 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636272; cv=none;
        d=google.com; s=arc-20260327;
        b=kY/Sy41CnDSdAdW1Uiw/GcvfLN7lgRKbz1HhkkX+Lej/mfpRU3aQE4Oct6fxzhOQbR
         Zx1u5SS5oEcWAlYjVpykjBVhMEPTHzmK4qviDZ1VXP4iGmWzjOTiGEi1d5HVX5ek/csn
         EA0UOMKEUOBOSqow5bGYYuwN2M3RKS+mSqem/SqN4KPgtIZ1zW+rvuGr9aJ6o+9yrf1p
         PZwAYef+THChcxkeYArO5vCY0H8vLu/Zl9uKGiIo3vXrh+S7j6q9XkwEMINwR0Zt4Vis
         qtgYh8MbLLBk1eXQjikIDfs9YemNTbOJNcMph76GcaqQh+Ul3mfcuLxrYZibmT8c3A4C
         muyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        fh=BbTFPclFin3kRh1n+wIUiVQ0/c/CxvX4HvjUCEEvo8s=;
        b=E61a5as5Uqg9/eppW3xNdNo6NIHGV33qkgutssqwZN7BRa57uuN1ksl441DHX1SZJP
         tNdQbqX/Od0tyHIPnQjq25/FVGvDkEccygODce93vdvX4W8it3ikbV6qH9Oztkosp+pt
         yF+IekbdIvV+gEmQxkwF4I+8cflgY5dHUw+noMke/2Kw9WSRJpehpwvrtRLKpYZgOiQ5
         UTf+mkqDoJcqoY+YlIS2sgn9YpmIS9F2aCykTwOfK4AZpynkx7GLem6D2Wzk87ckBu7h
         Vgyfy6EbS1nXSE6G6yV5x4f1onSQcbcXpWDL9vVRx+AV1WVzdPnEm/n4GqiFCLE0rrJp
         WyOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636272; x=1789241072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=UIZkNvklRXOiw9dBGugRwIbwgf5SP2T08jNMCga2H4iJTEJuNE1XEVUxyNleTcfsq6
         ofU889c73wtHaUm0xuIK0kw5IqopXJnqKFG5qfxFqM2k8xK4VI1CKIB4LhMy2c28zzi8
         4nvuQkSFZjLGJeVhTEYRK8Kq2Ff3fc+QMiVbklcjOqWyjaJn866RagzIWH91YZ8c2oN0
         jhyAQYqr20gBvWzLonPONI99k2LsmXR2g1KCVy8/An5VjOxYhFl85MzAxXK6s8Arx7b+
         RwNqWmEGHv/gIb1GfiycTwKqu/kscfKB6U/jjQXglCDoQv1jOhk+irXDnoddp/dOo7iJ
         cltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636272; x=1789241072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=j2qjCxSGO/sNv84psFIhWV14iLkU8btcJpn4JuZCWodJe8OQ0+CCBPgSpdSlrFUDT1
         5lzlsei44ReV3/yxvn3DioOUqN0sVtr9fVxMH6T1mc5m+nsaPr7DbGZEyQSYeJfP6cSx
         Bx79C2j2+V+KM20/odt2ca0ftsmSiYdBAcgekS/jwVUw6mMZoMLEsxsh6intosTpoqJX
         hII3smLPTE0JIvvSMMmXs+gcW4QQJGt4ru7R1Dcz/xY/W6oRLmM+NdUY+l/qFrVgFphm
         W1KUufQ9rhXykrhs/U8wb4hsvqgAhgChsJFqDD1YJNwr+AMro3c4ScbyX4JVwhX8YpjH
         v1dA==
X-Forwarded-Encrypted: i=1; AKwUvBw5biuQKI+fe2S1NmLTYOlG7CbwMRBXSD2McgY6l/fI6CDWdVv7CzxOfCXJ0IQax7VTBTum+k8A2w==@lists.linux.dev
X-Gm-Message-State: AFuF++kknpQINDIjO8zTswkf5Eil49VccjB+SBjDLSq2pk4Q48vvip+W
	nFkq9N9GuUHvg9iNmpo/01aTYwkNxqojIc91miqlbtzoc0QzapaEnkoLMxdIwQhWfTWtKKMXvmK
	lpf7y1vfsRt7SKZ584U5AHy+qI7NWoxA=
X-Gm-Gg: AYBFou3UkJ/GqbrURCAyPH5j/7ny1Arqd5yHmgG9J5JKo6TCYfRfxI6UL91bxynmFW0
	hHRS8yA3omdhNZvTpLuZzgzP/6QjYfb3n2XeTISsY1rl7jnlP/KcB+D0pMs9IbVXICo2d0Rzupw
	0v8eFzNbE3XucsqI83MJTBbhj6BNmH/H5f9+UPbZfKjVYNsUmPVQ31yFxssRQU+3mNFYHE1KlYn
	cEK8lEFmnsKtGcbWo7f0EWJDUj4PnBmsw2aeoSiWXlbu4ei2Bql/xQM4NGxNqkW4N95EAEyMcfR
	tO0fCvy3+15DuekPQKshYhP+bntWCT8tBAajjD0BDEvgeAyI7mlwWXU08frBaV49N0Od5PHNdux
	6a/BlbHkLltTJwQZofV/1kiMt7nZR+YniOBdk1a6wFat2cDvsrNydBFpVU/WD
X-Received: by 2002:a17:902:ce90:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2db2776adbbmr63554785ad.2.1788636272311; Sat, 05 Sep 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260903192248.2248560-1-dakr@kernel.org> <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
In-Reply-To: <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:24:19 +0200
X-Gm-Features: AcwNN1VrVIX1rn-ymHE6KZVlOZK2RCfm_y-i_dbObCbOpleHp8K2ryo0MaspaGI
Message-ID: <CANiq72m1ZxFtQjm4fUAt6Y1MFE=ww6jx+dEg3F4Bqbki=ndO=g@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] rust: io: support register projections and
 remove relative registers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Thu, Sep 3, 2026 at 9:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Miguel, Boqun: Please let me know if you are fine with the two
> rust/kernel/mem.rs patches.

I see you fixed a few nits -- I pointed a few others in a couple replies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

It is nice to get a slice of the future of the standard library a bit soone=
r :)

Thanks!

Cheers,
Miguel
