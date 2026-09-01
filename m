Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0139A048
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 23:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304762; cv=pass; b=M9b4J880ABxQ3MCPBcCfh7jKR2diV68iZZgY/ikCEjvygjlwTbVD4ah5d8cucJCfvBJjOlJAJ6jpa8gIzkpVcMpG9tSOg/sYAnSfxF+0IQxpqyrNG+6U40SKaDZNz4THIKM/FSWDKzSPQoHX9z71mhZBmle03Ji7da0Ut3qOXoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304762; c=relaxed/simple;
	bh=e3eIoE3QbpFgDPEvZO1d9sR5o5XokHbUYC1b4+KVcrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdMrjaIX/zJkRbyT78LnqeFhQjQk2f3pjtMdxbaEtZL116vZAIzHe4QgaSpxrhMMcNFUnn+ax9yQMH4O6nkgpUyCNVB+yYFV0ZjkbMgX3CuUV9KsERDfa9+410YGejrfggtzjCIbbqiwPeFsyb1LYm5yvoNSgIDBwsK3peEb5iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqJ1bAG3; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqJ1bAG3"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-855c3981b0eso42926b3a.2
        for <nova-gpu@lists.linux.dev>; Tue, 01 Sep 2026 16:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304760; cv=none;
        d=google.com; s=arc-20260327;
        b=CJ71G1NJe/gke+BybS+ToBUPxWkjKXYm5ML6yPkpGd5beWX0zVmmPUb3NbCeL5eg21
         AD1BF8n1IsNAWVeOG7WFSSkLECIEzJuHRV9zvOVCN/C4HbxfJkFD35XcMjpLDm2ILAxU
         yPkaVM1WC0MuEWBLt7xl1U/mTTJ3Rl0KSmB6U0IFioTLbd/OYwWqR+nFHaIxNChUPiG5
         wTISjzitluE/pIla8ZOPrlO+exW+aBtPW7Ppm/qwOLGfWPPzyGCY3nfVQElNjokv/lu1
         Q7nYi8Xl1pK+nuCGKmM577vuBZyzH1tCn333wYFwldDv72h0S61i/d35wf2w0HxCv6R0
         dZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        fh=D0dRGf7mS3pvGdQv0w6wGlznrQ7JpJRrts7zlrP4mJQ=;
        b=R87kDAf70YI6gaaPXna1nSTt6cExDmZurRWZw81oRpoxMpJqqIMF+0T0Iz4YLI99VQ
         IIuAHMJWRdbfw2sdUPIIOOr3ZJQbV2Bfq/ODoIrmq+0v+GKsV2CHUDZt+93+osede2Q+
         HIRfLQtlFiiCBZvGGjM4mNx7x63R66/Qn8vM+d5LRXJXphdbFXGhn7tvg3XQLHfrtTt6
         ep3M/KQ9k6EBzduR5AeLwYBHV9ktMfZB4Nj7QhukSqixyLwDRb/oxmAAKNGimNhht9uN
         0VpnxOOtqUmnuOHlpoMrg3HUQumL9m63K/VbGf5BD2H0xwZOfgR/Sif3K47WaT3ENRuC
         D1VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304760; x=1788909560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=rqJ1bAG34OghaPhhaj4EM6ptU4MdDgi1IyF48Q6zQ7rkP3DfnYakci6/M+DL1bmALm
         9qit26JP8DBUrud+jeyq4RdmNYVciiKaN+ofQbHDiuGlly7Us8fjtC9Lc7nyK6VH5TAU
         7UwIVNXM+14H9n1DHgNoNfO1R+YsIKufCN8P7ZK8QH6QWc8bLv9063YMNtlOIkA0jSMS
         Be3An8SfSgk9pfxUjx+TPIuAc1rB4wtixj0YCxuToi8ACwb1m51Vr+qqZGCeArDqri9+
         Z6kcfGm8IbiG6aJ2o7AXe/2uvBvx3IpwqdhiePUk77XTQFj1CPzRVAdKDrPtQt643ZAT
         A+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304760; x=1788909560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=VrSWzm9pAmfXoE5iNVVllYQNd317sI8/c3m1FS2cNEpDozq68f4feBRGLI87cQAwM0
         4N0hrn3vLTuikWScVpnodbE0WnqyVeUQCec9TKb4uSo/FutAkEntv6B5OvGNv1ZDoDrW
         rm9R2D4MB+V3DCPhogrWszir3UAoOQU6zoUxnHBeOfxGKNYQFWgqSyFA0CS+MqaOpI5e
         s2FkL4PEnU2sLB40CahWkvH0DCizkb8+EbNKb/BJV3/8E0cl2iVNmraOHvXOH/yQdEFV
         hgNeiyeoZ6bxWD5SA3yP5OSkGseaFnrjV6Gqx8ez267LzD9x3WDReXBA6ajpNB9AOWke
         yqgw==
X-Forwarded-Encrypted: i=1; AKwUvBxfisAqUDUzB9EpOV2vZXEv5Y84SaqldJaG/gKnG0ilSnFO61YXpeskBLuZFwr29ARehMEk2fQOzA==@lists.linux.dev
X-Gm-Message-State: AFuF++k9KG+UIzEpqUuCPTQo+aH1/+0J7EJyQ6vdg8bV+EpTSfyKgKcs
	RiIveGNHwn4H7tKwQjBcK/t1nxUQr997EWC5W0PBImGXbs+TwEncnSqLHuA4st81TUEb3wbWkN0
	JwIRTRx2A4xuh6y1Knpsddv0tvj7WJ+A=
X-Gm-Gg: AYBFou1BSpbGP+8gAMtl5AFiTjN1TwrWoa2hwnPjZOr2zQEbwNwhuu1qkXM/58MQSAB
	owIwfbblrEcgT+j1SdcuLms+vfVY8odJxVGX6orDuOoMX/8B6sHTx1Euvnjdp84XEcSFOvDAOVf
	BwMFjPd81wCGxMUTM7iPQgFbuT5n6DaBmu/n8EiVxwUhmcJxenF4PaUrrtr57yOqNpmUK0ZuTB8
	XmtMEeiZ1UcaiWmUXP5KdKbliy6WjDPeOoG8tSf3iRKvd8sLku7d0P1RUyuZsHzqz7cSB8hxh2w
	4WXH2CGICCzW1TEDg+F6/stVaMFaPn1FgTLPaQA/DbkPB70mpMPJKh3wm9P8vab5i1uWbjXsosr
	/Aqv0WFs2MxG+WWEjm1AH/YCWpucOUDC4nsA8KM9EA1/E1CK5+8ZEyDzRWe+K
X-Received: by 2002:a17:90b:4486:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39aee22219amr330724a91.5.1788304760234; Tue, 01 Sep 2026
 16:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-cv-v2-0-446bc69d2ade@nvidia.com> <20260901-cv-v2-1-446bc69d2ade@nvidia.com>
 <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
In-Reply-To: <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Sep 2026 01:19:07 +0200
X-Gm-Features: AcwNN1XNkEF1AhN8yU_Q6na6OP_zes3C1-Rjq21wcY7gsKXPtUmdPm79OvrMDS0
Message-ID: <CANiq72=k3O03vh+2EbTamAZHOZebOZ1-X8=qiyHWX+YhGsocfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:19=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Remarkable, in the sense that it seems like an oversight at the Rust
> language level.
>
> Alex, Miguel, is this worth mentioning at Kangrejos?

Yeah, it wouldn't hurt to discuss it if we have time, since we will
want an improvement here one way or another.

I raised it to upstream Rust in our last meeting last week (we also
discussed integer casts), i.e. they are aware and they agree some of
this can definitely be improved. It is of course not a new thing for
them, e.g. this issue:

  https://github.com/rust-lang/rust/issues/69329

I also have it in our usual lists ("Better `NonZero` ergonomics
(`f(1)` integer literal coercion, `1nz` literals or other
solutions)"):

  https://github.com/Rust-for-Linux/linux/issues/354

I hope that helps!

Cheers,
Miguel
