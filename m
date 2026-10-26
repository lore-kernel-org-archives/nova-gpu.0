Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016711;
	b=QNDf9v6W4kRdpPyyNp+zMK4TzlYHBCLM+2ghuruVYuwFdE3CtEY4VYlaoi5O/uhJol/b
	 a2oOyYRFKJSMktDMWHq8P7pjPWXv4CFBBk1KKpxAag4sY4/TtpIMkSeyQOmbpjhJbx/mm
	 539tqL1skJCjmmYNGgCHVqAscINjuQ18l1qnsmAkppuFXT5++YTmBswqydwYVpXT8BHKC
	 kTm3kfIpNDHk6OpVxM/ZlqLgx6mAtBp9SrUf5aKu7X7xwvWQwlDZmTaLHvCCXGQHiFKfp
	 qcZ7QwUS7ICLFX1iWqQ3RYtxayGVvT5hqpVFr9Tx4IJK95sF92KVWiQTiMy9Z3uZlBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016711;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=mPNitt3FocwblgeYuJE6oudtAZGn2jwvulIUmLU4VCo=;
	b=HFXZ1wt+XgckJ/ycTjCOZZqEpN7Arl5m/PIaDISybKaMz45vGxVE/2vaJRBtfGk7JR+I
	 TwFLPkrhZvWQoIVDbFaQo4gMxvMRyzIkNRlfGERkK3n2EXjGhZqbMRxwnvhEShvEghjqb
	 XxeMZ9g/p0BjRxPZ2+dVFKWnxMUXF/fur8ZPWFWI7B6Nf7t+4XvgKdP9uHjRrkLuv721J
	 wjPJMuUITHpW4q+BpTGIjEreYlNj33R+1+h3J7Qqo018TzmWnUrqm6dZMbm2/xnCspbMx
	 JuE9mvecUoqmfIoZrnMT0E0BqEgnFtcvs9eCtfLYhWvpe3RG+hWnN2aC1S6vaPCEUUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2znGfjk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA5606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2znGfjk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C885F1F01825;
	Mon, 26 Oct 2026 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016710;
	bh=mPNitt3FocwblgeYuJE6oudtAZGn2jwvulIUmLU4VCo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=V2znGfjkBCROQXAUh7afWPb23gOk8nQqUx0kNFHExrfr/dX8k5FcEKWk2dGaGepcm
	 QvJdfMNHqWTowjQsLTMOptXSmVINZm8MR7Jgd3OEJZ7VK/tZxuC69zx0bCSxQADBU6
	 akAKnt3VUAQiKfUElxWc+/pbBG12bVW1EFNaBQ6LUSb3oS7GDr7lqG5p38+y35BhVY
	 L+Bo/9vPKcgMXw9QNZ2l4RsTF/VJoQInzykW3cl9Ai/oeXtJjJ8lROFR8+Ev8ShZdg
	 JvM+V1BRIzJwnJv3ZhPNy7VK2YL+NFQEPUWvp0/RWmKmQ/veCJ0BbyevWKOrh+th2/
	 WJm3M9XZ9sVSg==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 13:11:47 +0100
Message-Id: <DMERDJZTGIN2.3GG2GSRWTLE2X@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: make bar1 optional
Cc: <airlied@redhat.com>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261026-nova-bar1-option-v1-1-8b43585881a3@redhat.com>
In-Reply-To: <20261026-nova-bar1-option-v1-1-8b43585881a3@redhat.com>

On Mon Oct 26, 2026 at 4:50 AM CET, Dave Airlie via B4 Relay wrote:
> @@ -135,7 +139,12 @@ fn probe<'bound>(
>                  // SAFETY: `bar` is initialized above, pinned, and outli=
ves `gpu`.
>                  unsafe { &*core::ptr::from_ref(bar) },
>                  // SAFETY: `bar1` is initialized above, pinned, and outl=
ives `gpu`.
> -                unsafe { &*core::ptr::from_ref(bar1) },
> +                unsafe {
> +                    match bar1 {
> +                        None =3D> None,
> +                        Some(bar1) =3D> Some(&*core::ptr::from_ref(bar1)=
),
> +                    }
> +                },

This can just be

	bar1.as_ref().map(|b| unsafe { &*core::ptr::from_ref(b) })

> +    /// BAR1 user interface for CPU access to GPU virtual memory, if the=
 device has BAR1.
> +    bar_user: Option<Pin<KBox<BarUser<'gpu>>>>,

Can we please add a TODO to replace this, once we can get rid of the extra
allocation?

> +            bar_user: match bar1 {
> +                None =3D> None,
> +                Some(bar1) =3D> Some({
> +                    let pdb_addr =3D VramAddress::from_raw(gsp_static_in=
fo.bar1_pde_base);
> +                    let bar1_idx =3D crate::driver::bar1_resource_index(=
pdev)?;
> +                    let bar1_size =3D pdev.resource_len(bar1_idx)?;
> +
> +                    KBox::pin_init(
> +                        BarUser::new(
> +                            pdb_addr,
> +                            gsp_resources.spec.chipset,
> +                            bar1_size,
> +                            bar1,
> +                        ),
> +                        GFP_KERNEL,
> +                    )?
> +                }),

I think this could also use map().
