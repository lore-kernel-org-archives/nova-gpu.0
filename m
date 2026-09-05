Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D03644D4
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636166; cv=pass; b=nl/+Ia6aCrE//Uj/n3n0XdJzWBIiX48lZAhb0zGKJLzwyEx9jZ0l1NM5bQl48GsYW5C02DvIBrg4daZ7aSUTPupM40EHOpbkz6hJKc8st8v5c5gehWlSM7xAwiyrjwoKtCYWFgBbYvdFIuWFLUPzACmtAlBg0EsevX1R3ytSkeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636166; c=relaxed/simple;
	bh=yF37/Nza90qpovsTyPIotV3GHJX8YLw3YQa4ToPG68s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUAUQ7VBf45wNBrIVnvT7hSxkBDYGjChVGGFDTX6G1mH7e+c1cblV8fa7wyAF7ZCM77ls0INb3CN2KRgkRMOiHHqfVrwkZ22j+qMexbjaPsjDs+Cni9w1KAYBcO0CzKHmfmNFNnLuiWNPPFok2ZFNp75zzndjGNpJnQIeQirOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAQUYjhb; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAQUYjhb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso1433875ad.0
        for <nova-gpu@lists.linux.dev>; Sat, 05 Sep 2026 12:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636163; cv=none;
        d=google.com; s=arc-20260327;
        b=MsknlyvwyxD/mFXcQtNRSEul5JR6XA9nMsXu5aZMbW65BmnxhY9ciwMCNmX9IHyg6A
         l8/Pib7l4zci6jhtzgC6xtF2vbiRvnzQvcOXKUjpAlAugX42UwdJHfMnIu9fUyJA0mbd
         8ujQ2NLWeCKdHkPz8aDIWzHFVBoH25GKbJHiCmrz5vGY1ex+hY5zsP6k/k+DkJbvVnyY
         nKTW997h/GBykiYGFbK1Tcd8RLumJlxWLVjJmjS29wzVAsm1+/LNGtIMItqs7XD/yn1p
         nDaA1GP0hxgw+mrg4EMWuvMBQfEKHOWosE2HVwwAaDtrd1yJDXeoUBUOjm3bOnN20mHc
         pWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        fh=efqkf7wn9IupB9IylZAmAZ3hTq9jjRsjH9IMYBYaJVo=;
        b=ZJ48AU8ZM6OYUEhhF52V42ErGampxv4ok1arzUThXPG/WaG/IqLODK9YafppSC0UZW
         TE5Kyw1+KcjZ49vsaq9aDsjYye94Wjki75q0FJnWdFKsL3amnBgIdesPXz/CpBwas0jk
         +w5o1KrB2b5o2CEdbjpKMl3aNHNCezdhXXI9RGDZ5acteDXww2cM2BJKfT3OV77dniGO
         RBIZVtGsydMiIyqVzKRcqNdHW0J8L+MCU+IVFqvp3exavq5bsuD/wkT7oZuONsyVgFJ3
         nvzZ4/EIx90TA1Yb6RmNPtXT4uRXujEizl7lVMZVYnVrx1GU9MYcXy3/FfwlgwX/LM/i
         sgeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636163; x=1789240963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=rAQUYjhbyfzNpF5LPki1fkEAyufgIGeHcEB8+IXqh7/eRI99JascqJebopU9IxdTi0
         B4h7R/u659M4LVs4Bsjd3v6PnO21F8+cEV05riMu429O3x9J6vrsaLqRNpKiKJMY9b9L
         VsqC0MVvOcVKEhwm1S3T+0EIq1oH1MfTLxtMZNWWk5rbTa1FrqIMVvPu1v9g9UizCj+0
         lJB+raBK3VUZlMzKZHxlBl9xOmF4oHKjUxi/aNeHHcCg/XhEIy8LnzDgK8kg/mOgTvW0
         ajCnKikaxGb7R9m004+6zuQBz4DZmlEl6eW3B9o4dE6jVMtlQklG89mV+OfhOBiEALRX
         IXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636163; x=1789240963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=sk3sNddPcu/pIdKlYEqht+M03XMa/bdMmE+1b8OhJDqJSoepWF0/qDeD+Bu+7nLYbW
         sq1gpZndDRKNhHLbKF4Zp12JWMfIVeUf2N8AaisZz8InuWVhTvXfzIwn0XcdYCqAAz84
         JqEGPhwdqmVBllO2QFBoAgDIwotajyPVRNlMbwLIWAhdXdP6SscFXeC36tEBIZA1WLKW
         9wtH7JXtnaI3qpta6NOzhuQcK8qurIFhThe7bMr9JBzwNpMvJqiHwwbLGm2/MUW9Qxq7
         PQJJMgW1ah7r9Ljm+tj7clNWMQj6FUqZ5c039yhdAYS2VkYzdy2ej1KQaWyFFD8BHeAm
         b9eA==
X-Forwarded-Encrypted: i=1; AKwUvBwhOU8LWvPw/ASou3KhnVZu6CQA5i6j6UGvZtBintpqTmRzlJbhhUtIJZ+TWZmn9zL2bQ+mQC8FJw==@lists.linux.dev
X-Gm-Message-State: AFuF++kBkDbDPLNssNsNkufFjra7c40jOw3qy+PYYNqIVAU7IxxjgYZd
	zJo19qDX1eAcVocsOiZ7xTxDV2J/uqHQ1l1TQhIJGqMbFcscpXmmob4zOkkJqyA1m4cayT+G6i4
	jENbKcL128Vntq3T2LIeEzTWCa0w2rKA=
X-Gm-Gg: AYBFou34/T7Xe2vILfnKFTTwM16C8oymKBDPgCMWJe8vsSHlnWt7D1sQIvHiLw/0Xiz
	ucMay6giIXaVLdvROn2GoauwXl66Na9bYW7SaXl7jE1kJKlmDHbTcOd1JxfQ5bsdsToNJpLnAdX
	8vxLdiMopaba3pZ1BCpUS1cqbFIsT/n7OmlxTKTcqAB/EtqiCvCseJEuS/x35XTEOsoKe+EKzVZ
	VOt8vyMzgejtfCknj7lkXCEH58SYQNS2eG1r/kb75h0ais7rwT5ci/Ega/z98gt8AwuDmuE8Sdd
	nZKe4f3YDJK1l9cV6flS93RyHfYqf+kQ+wyRe5TjkxQVkzCF9IBtEBp1TJNILJDNMGkStcqXatA
	akl1ZYkCKSVE1l5TT1VW5TGzwnThZ5QR6NB6/C2zy52h2o49ILgvI85wXeS8d
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr7470429a91.6.1788636163260; Sat, 05 Sep 2026
 12:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:22:30 +0200
X-Gm-Features: AcwNN1XYNGZeZdAbyqW_MpHHmRnUCoTfhvfgQ1L93n760L7NneO9Fvtxk2YGC7Q
Message-ID: <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
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
> +    /// Convert from `Self` to [`Self::Repr`].

I think [`Self`] etc. work too.

> +/// - [`Self`] must be [transmutable] from [`Self::Repr`].

We say "can" in the `AsRepr` one -- we should be consistent.

> +// SAFETY: `bool` has the same size and alignment as `u8`, and Rust guar=
antees that `bool` has
> +// only two valid bit patterns: 0 (false) and 1 (true). Thus `bool` can =
be transmuted to `u8`.

`false`, `true`

> +        // SAFETY: $unsigned has the same size and alignment with itself=
, and is transmutable to

`$unsigned` (a few below).

Cheers,
Miguel
