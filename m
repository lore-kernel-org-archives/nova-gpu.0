Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AE363090;
	Thu,  3 Sep 2026 03:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406185; cv=none; b=tElZ0J4X4Gj8sgyY6i0sPjVYvzU+3YQ9Ggm/w128s8TNPN3mCC50IFr5DZUdWpLvheUVKDWkYzVdbfb1Qr7/M9qxBYBNRBekT085pTbgqijgY+Nei0wyt6d+vGaHRMa+exoRdFCCz8OmOn8k7D0DKU85GIstrp+Q0BflDdqbE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406185; c=relaxed/simple;
	bh=WtQED53sr+PQqXAcbFjxIuqVh8jO7xe4FRlTH3xXhWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TcEn6znHDjjSB2msrhCi+COM3BZFQEgJ92KzfcDCRVVS+TTLEGrX7m68HoI7cw6+JICZK02iKyteX4kRSs5daHi/MYRFL3W1crMUMy8sCV4nwnwdltmt7q/i5s0GySl2XdWGLWfdgNQyv4rfHWXYx0nkS22lIj3UZgkI6k5ZD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kd0L77x8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kd0L77x8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA621F000E9;
	Thu,  3 Sep 2026 03:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788406183;
	bh=xONfOGAmd1pVhxSdrwbZxTD9yz+LelsOgMqighMVnCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kd0L77x8a2OGmTVCEXAfCwNxzlw8HFzRnyGvEQjO7k4hLeJ6/u3VN9V/kP0CGMvXy
	 6ZLwCk9al6hOM05OUJmyFdr2E2IuaOFZk2R5rbfkEVTk7BzcJ2oVD7nHLRNXEh0l2p
	 4h/reKMvPJJLCoFEohkwq+GhaZTZWurnaGYO7zPkJG1eNzFI3gIdEi6/t/+ynteM71
	 7gJoxrln6pxELUoFWnnQU6K1QiDw744Q0/9WDM5d5/3CXGsR9zLniIu0ryGIIiHbs6
	 Zcm/WZ5h0Kzk9Upw69CcwTON04eqsyBnGeVVp9EMttmKnrKwx6z6C+xYhfO5O57DcP
	 Em9A2WHdaSz+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/14] gpu: nova-core: add an interrupt delivery
 self-test
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Will Pierce" <wpierce@nvidia.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, nova-gpu@lists.linux.dev,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>
In-Reply-To: <20260903031514.1515905-8-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-8-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 03:29:41 +0000
Message-Id: <20260903032942.2DA621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `vectors_ref` field introduces a self-referential struct using=
 a reference derived from a short-lived macro-local `&mut` binding. `try_pi=
n_init!` provides access to previously initialized fields via local variabl=
e bindings, which expire at the end of the initialization closure. Taking a=
 reference from this local variable and artificially extending its lifetime=
 to `'gpu` via `unsafe { &*... }` violates strict aliasing rules (Stacked B=
orrows / Tree Borrows). When the closure returns, the local variable goes o=
ut of scope, its provenance tag is popped, and `vectors_ref` becomes a dang=
ling pointer under the Rust memory model. Furthermore, the `pin-init` crate=
 explicitly documents: "IMPORTANT: You are not allowed to create references=
 to fields of the struct inside of the initializer."
--

commit 9bb2c0e6b8faa56d9fead3fb4f99c60340b45be0
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: add an interrupt delivery self-test

Add an optional probe-time self-test that injects the CPU doorbell
through the GIN software trigger. It confirms the interrupt reaches
the driver's handler to validate the PCI interrupt path without GSP firmwar=
e.

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index e1ac8ee9ba4db..8a9bc4baf9ac0 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs

[ ... ]

> @@ -330,6 +337,12 @@ pub(crate) fn new<'a>(
>          let dev =3D pdev.as_ref();
> =20
>          try_pin_init!(Self {
> +            vectors: crate::irq::alloc_vectors(pdev, crate::irq::SERVICE=
D_SUBTREE.into())?,
> +
> +            // SAFETY: `vectors` is initialized above, lives at a pinned=
 stable address, and is
> +            // dropped after every field that uses `vectors_ref` (struct=
 field drop order).
> +            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref()=
.get_ref()) },

[Severity: High]
Does this create a dangling pointer under the Rust memory model?

`try_pin_init!` provides access to previously initialized fields via local
variable bindings, which expire at the end of the initialization closure.
Taking a reference from this local variable and artificially extending its
lifetime to `'gpu` via `unsafe { &*... }` violates strict aliasing rules
(Stacked Borrows / Tree Borrows).

When the closure returns, the local variable goes out of scope, its
provenance tag is popped, and `vectors_ref` becomes a dangling pointer.
The `pin-init` crate also explicitly documents that creating references to
fields of the struct inside the initializer is not allowed.

> +
>              spec: Spec::new(dev, bar).inspect(|spec| {
>                  dev_info!(dev,"NVIDIA ({})\n", spec);
>              })?,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903031514.1515=
905-1-jhubbard@nvidia.com?part=3D7
