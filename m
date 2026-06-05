Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0547CC6A
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649308; cv=pass; b=B3a0xeViwjcXqrDABZNMnx168bJYymbJAfZzsaQrIecOL9GxgEDAbqwHLWGdTqsbe7jDot3rn8a7cP5dj2OtWmjwGIst0B4+ZADh1EDtRTHT3lZ0MEtDSEZsCLiyhERQTN7hFyagXROW8vtBLZLQka8j0hf6mIsGz7ETc3LFx6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649308; c=relaxed/simple;
	bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K05XnZ6YuZThtrEzzf+vQ/x1KJ/6BlXPLMXMUhwdvlPt83dxtTTgETHzJP6bfyIhYhGoy3uHbzuB5mLuG9rpwxp8TNLi79rz6LTIZmP9o6CIO/ExO9i2wk+ZJkMnBlE9Kh7rWCYBnFlvD2yWDUaES49vd61L5SrxwcoqmTFPdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTX6umgv; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTX6umgv"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so143682eec.0
        for <nova-gpu@lists.linux.dev>; Fri, 05 Jun 2026 01:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780649306; cv=none;
        d=google.com; s=arc-20240605;
        b=AGty/q8q512ZavGy4A82AOyTYxKAVVR7tiWiBaBrSmmqSPHB5d9aB+cYATUoXXhvd7
         KIfnprUMu1TFjkK6Lb2Xy5B+OT6qyv8ZFDDVT8BypDyZ9B3zc7tRg6mi1lA+IxlwcPjm
         f0V5N8If+4BdCqjd1vV5c48XuCsgo3TY7CYLF+V8ktcmgH3W3NVRo3l6mLeb6VeXGWVl
         Sd5hJQa+Cm7DEYxbE2NfwCqZS74MgP4TsxNFeizH3Yd9aokEeHjKTsUy7+RHVy9QRw6D
         5xsRBsi25z+5SKWY+rzEtptv2dgiCYJpg3Jf/dahbEuFCk7kI4Q9gdzdlWvnuY3CrXUp
         ECfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        fh=Ghbkika50P0xQn2MAMvvpIIfDQIeshxb7zoG4OUB75U=;
        b=G9+su31AzrqDBn5LBAfLRW7V+MEKiPxumU5oUnOVr4Y0SiI56tbE6h/Ihp4xERyLP4
         5Ghb2PiaI4FmgUQHf6QIyD4rw9ZalW/Gz+HgVm/uOdCX2qC5hWddH0VbF0VqR+yFdNP8
         a7zTgml1RBnxy2eiSEMDrZIpF7Zo1prNysKu5OU5+AbJ7j4+bT5nKvr22Vz22Cza5TXT
         TBoIlY6E4sYdsjL9m6FVhY5ekj6n4rL43FJc/bWZSptxU+QJ75NcXR/mdG5TVtaXWpJk
         5T979g20QuvGkr2ltMVLWE/JSnvTDf/PEw7NJTfxTQV1POcZQOruesscqY+XkyEiIRhX
         y8QQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649306; x=1781254106; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=mTX6umgvQNIZnblTEgD3yRh0nMgkLORvaaQU9FPkL9weQU0lfBrmXu2qaoFyh56kFo
         Hg0wAGKmwL45ENdZZSqLvEVSLG3cPbZSz8Gimi5/31+Iaob5vh7RtiJrE96H+j0Au2RE
         3V+baq9fLB1/67KQJV7BYPYsfqxD5zIqelgOwJbI3cV7DqYi9p2l209VvGw8iM8vcxjR
         FKpXP96ODfIIc5CcyLEsuX1KHNHI2o4ZbpE4SkCoRmMiXgf/aP94XUUX1y6cNsKbBxVc
         vrX/8XJSI40U5hjii5CGmDkK/fZ3aEfKT8g9tigW0ghzM9CJA9Bh4JeJykMgolZC304K
         9LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649306; x=1781254106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=jbRZf17BAZBMc+UQH0748Gt90mxeBw58ge8JgvQtSvODr0BHfs+eBIaMoW2BLCqnGL
         bcnRg3IecWUkebapoo0X38IZe0TJ5CsX9qusVg69f7dgP6jqfC356lhsD7GzUFNh5Efu
         bew2TI20XtXqXiO/VducOpJoT2yPiGg9amORrjJDfzb94hMbL2DKnmyUbtLB48W7/zRs
         aA4MkfPC3sgcfejL7V5hIvHvuhHTItcMUUFb41AZdy3WZmuq3/FXAm9g6Y0B6/vG2G4R
         U+82bgoYGE2hZO58LcXCCaTju0m2lNCKzaH/Tr9f/jmap/IuOTZVAJp3sBwv8Lx4732u
         HD1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8AZZpk/R0RIJj1laeIUlrO80WFZsO29yoCgBHwjWtpHnzXDSRFatCy6O3o6jm1u9fQelWyrlPg/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd2JYRGigdIIOlBo0KU8zFFE+jbsMzjQumIThKAzgvED38BYbd
	g/m8wwiY++YGGjxQo037Tku3cTsEIavGQfm9xP4qwDd2enjTonAw58PYFUrga2wGXgkjJVf7hjA
	0dPhr+bOFA6cdVqxnK15pP66EQzo8dAk=
X-Gm-Gg: Acq92OEJqDXSTBG2tgLuhbO74n38m+rMg+Lu7O0siPt0qZpKvz6paw3w52/Q80n4HqJ
	VHIj7utDvq8u23gYYF13EvimqG2f0su6BQzQYD3Jcwbku+HezZtdt3AmyrEb/OEgOG7tYmsAEl+
	qiXIOBJ3zWPLy0q3kRHmpprS8mcBrR03NYj/HocWlwv5U/GwnsLxnc2h/LBzYBPIoYJjZgPRNX1
	z6rtZoWsyj/sc2J24uHQKMD7rJ/mhCr0Kmoox1hX4s/7wnjTqr6fxjKidQRzAGhFqLx7qWu7NQD
	ZIJlXUUOUEClfvggIWOsvPdU9XYdbtJ1HaE2yf1cjdnRGCgbvpVIWs6DnBbDPOeq0i0TpkMUOhP
	0j9yshFekz1Ouk/V1gOEq2T7yPsyEgdpQww==
X-Received: by 2002:a05:7301:1e4a:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-3077b3668c1mr552123eec.3.1780649306414; Fri, 05 Jun 2026
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:48:12 +0200
X-Gm-Features: AVVi8Cc74TRwhc7yjE46MLUkC2_0K6dWthB_1BctPYhz93WSvkLnW5tntk2yBNE
Message-ID: <CANiq72m54FU+zqhhGCXC_v2TyBA2LjpgHbU_J=AFfpWZLM_6_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This series is based on `drm-rust-next`. The current revision includes
> the feedback received on v3. In particular, moving everything to
> `drivers/gpu/Makefile` simplifies things considerably, and I have tried
> to align more with what is done in `rust/Makefile`.

Thanks for reworking it!

It looks indeed way simpler, and is pretty much what tried when we
discussed this a few months ago (well, speaking from memory), so I am
glad it works for you.

And now that it is also closer to `rust/Makefile`, it will be easier to rep=
lace.

So thanks again :)

Cheers,
Miguel
