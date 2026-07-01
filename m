Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F7481A9D
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909448; cv=none; b=LcxYX87d1hqTgyeHt17IBkf4DclzCwnQU66wq6ydZ4zoQidwetYGcVpbpIOKIfzJFPN9xjQbY1nuRJ14ipD3Hu//aBUtYP/JQ2d1Ck1NxwROtqYAm+Lh7C17YFxWbgdlIm8adCHRlSeA8TQCxqH/YMeI/FcbImMyo2t8nZCL0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909448; c=relaxed/simple;
	bh=hTEE+EgB8OlGblDLMAJL8/mGO6jM2Zwg6u4Z+yrmyMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6yEUwGE+xN8n6RS+LtpJQtcgEnRyltAa1W4yBXnu36ehVNNd80ZuyoAmdSrRIeDf8VpRn4vv+iKellLY0yZOpbMPeIVCEt1669W+bS+M5UJX1ZUWXpZRl+lxbdl7BM2XcAj+iTOxlN2weF3nvuzvcJqxOh7YS/1T9jtVI6AcW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=VN/bf7rv; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="VN/bf7rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1782909429; x=1783168629;
	bh=vd+JtZoymPGMmIm+DJ/AcnDJyGa66n9Fi50sV46bo4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VN/bf7rv+s0EQF2y73L/Gpa9MHcVLpKerpXyF3cN+NQvQp9XKZVBU/ohAalS2S9V8
	 0LVBYcRNeZn0PB4BGViLGAZyu1ZAvSyhWlPzPgsnmurqYFIg4LC9ezIpF1hbhYtz+y
	 ZV7kqCh2vljlzAO363d8gd+29MoeAUu4gdvddGh9akZZszymrKHITRVuJBgK1uGi5y
	 jlPH/DcvuHvnzKP4UdjT7zd3zhiEuQ5A+oh1FF4veu653uCvq1mV00Gmo91+WIJ/bg
	 3wYkZ+hHvVgTFvoJzlRN5P0az4ZygP3GwjmbIJVA+cLPs0zXxie4QeRTd/8SY6M7hO
	 W4Fzz2vOLvKIw==
X-Pm-Submission-Id: 4gqzzj4kWcz2Scdd
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] gpu: nova: fix rust-analyzer generation
Date: Wed,  1 Jul 2026 15:36:50 +0300
Message-ID: <20260701123703.152958-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
References: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 01 Jul 2026 15:40:51 +0900=0D
Alexandre Courbot <acourbot@nvidia.com> wrote:=0D
=0D
> The rust-analyzer generator script recognizes a crate when its=0D
> corresponding `.o` appears in the Rust source file's immediate `Makefile`=
=0D
> or `Kbuild` file.=0D
> =0D
> Commit ca524e273c43 ("gpu: build nova-core and nova-drm from=0D
> drivers/gpu/Makefile") moves the build rules for `nova-core` and=0D
> `nova-drm` into `drivers/gpu/Makefile`, which results in the generator=0D
> script ignoring these crates.=0D
=0D
So this regression shows that generate_rust_analyzer.py should probably han=
dle=0D
this case better e.g. by checking and understanding parent build rules too.=
=0D
=0D
> =0D
> Fix this by naming the crates' module as a comment in their respective=0D
> `Makefile`; this is enough for the script to pick them up and restore=0D
> `rust-analyzer` functionality on them.=0D
> =0D
> Fixes: ca524e273c43 ("gpu: build nova-core and nova-drm from drivers/gpu/=
Makefile")=0D
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>=0D
=0D
That said, this is a reasonable quick fix for the current generator as it f=
ixes=0D
the rust-analyzer functionality for nova, so:=0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
=0D
> ---=0D
>  drivers/gpu/drm/nova/Makefile  | 1 +=0D
>  drivers/gpu/nova-core/Makefile | 1 +=0D
>  2 files changed, 2 insertions(+)=0D
> =0D
> diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefil=
e=0D
> index b9fad3956358..6355f7502c48 100644=0D
> --- a/drivers/gpu/drm/nova/Makefile=0D
> +++ b/drivers/gpu/drm/nova/Makefile=0D
> @@ -1,2 +1,3 @@=0D
>  # SPDX-License-Identifier: GPL-2.0=0D
>  # nova-drm is built from drivers/gpu/Makefile.=0D
> +# nova.o (rust-analyzer marker - DO NOT REMOVE).=0D
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makef=
ile=0D
> index 4c15729704a1..216329760a5b 100644=0D
> --- a/drivers/gpu/nova-core/Makefile=0D
> +++ b/drivers/gpu/nova-core/Makefile=0D
> @@ -1,2 +1,3 @@=0D
>  # SPDX-License-Identifier: GPL-2.0=0D
>  # nova-core is built from drivers/gpu/Makefile.=0D
> +# nova_core.o (rust-analyzer marker - DO NOT REMOVE).=0D
> =0D
> ---=0D
> base-commit: 431f10ba13a964c146ae05728e42e4074bf735ab=0D
> change-id: 20260701-nova-rust-analyzer-8dd146dc53a3=0D
> =0D
> Best regards,=0D
> --  =0D
> Alexandre Courbot <acourbot@nvidia.com>=0D
> =0D
