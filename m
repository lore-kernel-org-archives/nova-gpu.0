Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639BD33ADAE
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680527; cv=pass; b=FIFlcHs/aelvzJzmmn2V+SpegVMgFi0bA7nEJJKx5cekul5RgEzOTr2wpDVTWIRCrCQrS8BxZy3hgd2li3+E8kxb1zzqGSjH8sBYUswpzjhMlw8y09MerOWvCRUcpwf/HBvdkKnBdAv/kdQ2Ts4NHxBGeGS5qdLt1wDXbny1KPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680527; c=relaxed/simple;
	bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3S+mPrTDIPdQ4KivE5xX/YRqa49npbZZDri7Aj5nslIUJXI9BtYFTgvoG5DcD8wPDjJpeG6nMvvcAhqu+DBNaaRQuNugimfHbm71gxHZF+DtYOzqZyyFMo9XarqGZbHCHoGqsdCCptomw7VZoltzZRdzsMQnVhaM8lOOObnl2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjtcYQ2m; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjtcYQ2m"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso21213455e9.0
        for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 04:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790680524; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVJQ86EidX1DZo222tWA+Tsj/uHaI2GSxLp6YeDSR4dL9UiN3ZZtoa6B5iX8AfWOmq
         G8DbmvCyFbqRkyNZ/1454Pe6OgA9KvHVHNr0WL37tHlP/SKp0ZGYzbo7MHG64sakBJo1
         crUUvcG1cD5IgolP1NlnriFMTt+2j7ZKocSBY1arbdqyh7duG7UOEjxE6UH9pCOArFdy
         Feq0kjC7yAQqnlLLGX/P96InWPNXmplhJ0cdUzrH9mGwVkGvT1Z4gelPf+IhTmbzk2D/
         yn0Lt7BPA8LvWex8JuzWEV0L6YVHM3KrcDKFXORMVHY/uVvj951DaMfBs/z8hpEYv8Pw
         gmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        fh=TwApGLKEaOYZfEZEBO2xyNaTSRKWg7B5ugq+PAythtY=;
        b=IGQ7kUK1EVsAuBlI5IB/qaKDq9JS+kNWFbtuXf40EtEbcGVRafz2zBcYiHGqspLCV0
         NOpCF1BQWEth3kAqhVZzTp33Nb6oSjJJpm6FESFye5wSyVAKrs/MkXiGae2VO8CcckFl
         7FD/WQlWAY53qaB/3wmFS83IjoA61iN9qkQdjOOtTz+A/CdojCth9hPyPT26Ed44tFlH
         fK5/YZNgvlyas1g89WdMifyFOm89qGPwiCrOwTv4T4gnRxCQx9UpOIl79W4mMh8sZJrf
         Y62zNOAlXWHTdgYq7X4oVDDCogL3mm7jep+8p89OjzyQ/kVJNmxDaDQm8AikLV1GnQHq
         xduQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790680524; x=1791285324; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=bjtcYQ2mFR7MDmy9DiWU+9J4sBovF9BBqXWYzn1yttcLm+nruCR1aYjVzDT/9TzKSx
         EyhVivFNBbSPC12UgLzhnLmiY9iFOQcm2RIp5NXD1Zj0+v0tsiKpbs7p7fdzqVQiFeJ2
         +DFhf1NkLcEkbG7hr7u+C0szT8zSpW2kzKaEniVe4c9Xz8tyi4mHDFTl4GoZ9JqspfR+
         MRCeUMKlbPin1lWK5itCLEQrClJkPBALdAacPu6UGa1qiUT81LC2g/uy3y2ZcL+4oylN
         N21iQC1NPKBtzSF5ehjcDI7okDwRwfal9OZ+B4xEvzN8Jku+aAlnU3j8qyFX88YJ6SAH
         08tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680524; x=1791285324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Cw/IYS5ZpcKxcOuBKXbmCN8n5qb9dlHBJN4F23RgHI=;
        b=0+o8OletaBnAGxZggBpe8ty5Nshbmr4g411M1bdZ2FvD4R9pXNwO2qDxuPHiI4CL1e
         JFM6ZOPzT4tbknOW85y4/SW3dJ7/3kd4sFI06jeZ/YwbBavqlIK9soXMoIjeodmZSmvY
         GkAeGk4ZX/rbtaQ6jfGM6BTpkqLoW37bRsnLEnPkjj792S61sW8pnH0Q3Zqqf2FXd7Vh
         CCteWqRJk8qAsJ5CbnDH9R7BpoAuoPVNg0Mt4Jxf4M2jI/XuHNJQR2TjA3Mk/6DTd1R0
         YzoTkvezLTOg+tSRf8Ge/By6Dxk6UF+w5yF4ZmfSn7d2Z+rYZnq4cv2NToQO4tIM6zrW
         L8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwPgtEjuKNP5xvDGXpNmPS4AkoUrgHyp6GEBEhMbaGxidJXOVuu/sFrOr0oLq+fv+Dxqi24+DZt9A==@lists.linux.dev
X-Gm-Message-State: AFuF++kkYYuta5+4UsMd/yPYkCMdt+AJVhdzWo8Ec2vHqCATyOtC6KEn
	WyG6L4HHR6ixpuwljHQU5vaDa04ibWMszBDs3FT3peirP5qWDz6o6TTi9UynhYNlBIQ2WZq2BG2
	7ZfaR1QwIh1VY/ANpqK/cNeTFLl6jccqSLLVO4pay
X-Gm-Gg: AYBFou3IalUBvcX/Syrn64ZVJLu/yhBJNJQ64O5katIkfBx7sSW5C3oxA9XK6hFq1BQ
	57N8S9/veRtAQVPXHFwskWnSSBAvENMIM2mF/GNgex+97mLS2ctQHm1rXhYhE3fyV5BQKCEfDOL
	HtOKM8Y52xk/lge6Tj736li/uX28JdwFXSEOa3Ldf9aByh9B6TmX94S3uZnIm5lkJbxJZfHAgho
	Ii+wOsBrRVuMzeWMqS2cZsXWZqqRrnM3pw5sgi01ya3vrJUG5VWclIlWoHJOBnsTY7PIdLA12JV
	8iSyJRwTqjV3sn5oKoJgirjUibpIx6b0Quouo8nymLtiNRmE0dDrri3JAD4oq6NKuPbldCyBb0N
	ny0DrlX7SHf/9XiFlY4yF+vvj28K9sduCC1IGxOvfyZRQDKAHDiQo
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-49fe66f9fe3mr278996775e9.31.1790680523000; Tue, 29 Sep 2026
 04:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Sep 2026 13:15:10 +0200
X-Gm-Features: AclHuK9UFcxmG9GmUlSlAWSVdyiMyuABuak7MzbC2Kn8ucmeQP62kVdtbhyOryQ
Message-ID: <CAH5fLgjV=qMfG25TQnTruHeVQkVuitzAyUV7frsx0DyGFA8yUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
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
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
