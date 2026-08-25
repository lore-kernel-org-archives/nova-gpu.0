Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC83DDAF4
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646316; cv=pass; b=PdQ77+Ch5XQ15mj0WlULg1KgMiFp46xUGN8tMNUG3qyoDg2JFBZfoiuAWbaCk7gs0V2ADYrOVMCbTVSqVx+i3VK0IlR0OrVXr/Dia3nl5WONQztd3njAVxJwyG0sh6/1NCVpdcJCpi4vW7KabHjEKPtl+Dc1SIEUNF69FQLmAjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646316; c=relaxed/simple;
	bh=vN+lqQ1cw8Q+rzycmYP3JO5Z+XAODVd6qviDwRWW+fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTuIHUzcAgF2DS0pJAnkF5CTgiWxWpv6hmUXmP9PckX16faVWZ3z46Yfmj4TJgDaaKKQNeV/GsvwLjM7Vm7osgCX2jkVL/EyEEYmEaa7+WwGIMCzwPuTx97w2e9GZhuQv00glF/a67zq3hbBTC/SnQfj8Q0ud3O4kqJFdUNTLoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzsgiyaZ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzsgiyaZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf110997efso7089085ad.2
        for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 01:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787646314; cv=none;
        d=google.com; s=arc-20260327;
        b=PgneX+1QIzY+xpOtDE3VeqK7ka6J3Ay8YkY40XZiJ8NQHzCTTlDL09NI9j7d/D+Fhp
         aJ9j8UisexmG7qQ9hD/NUwc+aOSCveajiD70bgqdGN2yUGnEHXO8Z56MYXSNvOuNNPrP
         MPx98lwHSdfiOohzCnQtc2vv03cw0tidCfNTX3qT/T5CRDqqi4P0MQRVTvkVbrceyjuM
         4OJXKLMoNKWYh41ymGKcMTP359CSw2nfHYRpB/EfbTK8i3C86OrtbF89539pPqGva6Hz
         Mgeyn+f1KOb9IZxGKKy5sC915b4S3V6Itd+/u5CWL2Q3SVabQuJMAQzn+VZp7+WujA+r
         SKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        fh=aMQ9hg7QvzoMKmci4J9U3S1CzpR/K0TtJcjTpo4yqHY=;
        b=JiK2mrT3hhqtW6Lo0WD9bd7lwZh8WBHzu/1moceCn3SqERfcNnClCu0GLJjlOFoBJx
         oloZQrv1eyhgt9QTWO3BCe8xFTB/glkUj60C1urj1LoHfmUcK7aJ4biuLSVqZto5xcZn
         Cd6wskyFLydNoRWbuSqWAFaPlnjsoNlfqP+bzP/LMAflLKQ7pSYRIvQleEERrWfLEXSv
         vCg9UuFBKjPoyAUOmN07mVb+l7kRfdfloBZU83buqFHV7/qTRwSY738apZEJUL3Ab0oL
         0L/ROlRO7Dnn2+RBFIdqpX9azRsPdVAddZyvPRlFyB1zShsOjyIvTUXkdC32bOHkjZhO
         fWIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787646314; x=1788251114; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        b=KzsgiyaZzWqqdqzOwOrE2cSIjPRNQzRA/svVEE2sryMjYCKlFGQZTY44AkO/ny/6bW
         gQ2a05PbeSpQCb6uSWbnmzpCa+bZqFTJZ7AgR24WBJXgPcOpumQEtfKAwBwvXmgZ2qtZ
         6ivnaA4n1ZpCq6Q8KGWtWiv4k7tfqrAq0E0nbkF/lWKvplRySPRqrBO8nEHNMw7oukIz
         pPpgZ740j8gC3ekJNyY33T1y3mxi/I+LI2iu4DITb1Eb856a48be0M4ZPifqSFcV2M2g
         exjeoFM7Byyo+y2BRqE96uWiUirMD6e1lXP1zmc45tXrXfAEflqf88WoCBnafWl2cZFQ
         CJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646314; x=1788251114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        b=qmeNBgUPah2ZPbv9pZ9G8kYp2nprtcTiDGtYnDI2izA7EVI1cvBXnjf12K9hmI9CAp
         zJOpjZfSG1/DgrXGQeln75z+PdglkZO2ax5EHb1nILIzuPE01UIgxyAAyODbXkj6HAQJ
         4NBTa5X55IVQe64LeS0+caA9jRH3RnXpvqsLzdxeVXt2vI1ubS29ww1+6RzdSiYgrTr1
         5sq3Gz9NTWEnYEtA2guTcVcV6go6UrU2I4jA+Ld9jMjJ5vNe02iCl/co3Ah2lasPcmgk
         YCvQgUI3xhT4OxpYxKS2/VAv4HFOerzRJfWfGeWR1zObqFQHu3VYynoeGuH6gfRqiBdz
         R5tg==
X-Forwarded-Encrypted: i=1; AHgh+RonrS67zc5dK4rcBOkj9UX730wnFXQTmy8UShhgSqDVdwV6aculCJ4noSbHMiHM1+0wsHtnSklC7w==@lists.linux.dev
X-Gm-Message-State: AFuF++kkrf5kSFpkeyTKQrVd07FwR2DZkrMqc16ceYmJrLWHwC41VMcV
	oF+GHlza6NP32x3aYD3f3NuKNPKjnzy/5LDY0MyUltx4Smf6AUN/MPb0Hb6aUCLM8pLtVpoYXEW
	kIkKTxFrT4X0lXU3HBRE7LQ64bxnxMsY=
X-Gm-Gg: AR+sD13Oj50KMnORTj5o/HX6Ten2okYClZj2IN2hP6BIHdWYF3D2UO1vo0ihc2EwNH8
	IEdFvjAzqSDVrWdCM//vGzZ1PUUrqxItj2h74B569a/BhkiLs6EW+XSpqnkG4Gb8xAbZMGU+HC1
	7NsjITf8D991iQX5jaUzLkAzbjFz/mCM/aBMxbM/DmxShwx8+nAMTRy/c+GaeW7TGBgF5sZoZwG
	JBwR6zWyAuMXMpGssGNyPiVk8xZDX5vLSJPIFp8zpu7YjBd8Zte6JTKeKTFMWJ8QItWutL+DYFz
	VYYUcUe3J3ORVjoGXbmFJcYwfAiQFmGNwJ7Zq32b77LOJ9AB0+TNf5D/QuGZ3l3n71qtgZst6QN
	wrB6uMXPuaRmg4xn4xuIrhg57KlZ6SlParUrO4PalqPcIzvQC3qme6mZ1fmSq
X-Received: by 2002:a17:903:234a:b0:2d6:3c1a:85ef with SMTP id
 d9443c01a7336-2d6e3711667mr34626415ad.4.1787646314097; Tue, 25 Aug 2026
 01:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com> <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Aug 2026 10:25:00 +0200
X-Gm-Features: AcwNN1WiqBK6DPw3KNUBUFoCCm95GG9T8sdCr01st0jWIRGTbY2d4Hbg3YnemNM
Message-ID: <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 4:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT =
}>();
>
> into
>
>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32)=
;

Hmm... I have been following the discussion and listening to both
sides of the argument.

The macro interface looks obvious enough, and we could consider adding
it to the prelude.

Having said that, macros have a cost too when they introduce new
"syntax", so since the beginning we have tried to minimize their use
to where we feel is worth it.

The former line above is not perfect by any means, but it is
nevertheless syntax that one needs to already know. Personally
speaking, I don't care if I have to write the former or the latter, to
be honest, so I am OK with both ways. But I worked with C++ TMP in the
past, so my eyes may be desensitized. :)

Apart from readability concerns, we are saving here a few characters;
getting possibly different codegen (forced textual inline), and maybe
having better or worse compiler-side time/memory/disk numbers. Is that
about it? It would be good to measure any actual difference.

What I wouldn't want is a raw `as`, because the point of the saga we
started a long time ago is to introduce better tools that allow us to
get rid of the almighty `as` into weaker (i.e. safer) options, even if
some uses of `as` may be "obviously right".

Cheers,
Miguel
