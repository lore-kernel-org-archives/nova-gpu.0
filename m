Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018032;
	b=fvkZ+5kGxlyuMK4v1TRErrtLijmrm70+GtgL9P1TDzBqtjmGeeDFtkZ5pThIwc9IbF1Q
	 JMMkk+7Vqv+xvq2MRA/ljMAPDn2GA2qdiKSqk9+0JYJhO1Pv0gYHBq66fwhY4OOmz2ZwH
	 Bu8QZoPChSntkWOCu2RN5gHIJq4L03rdjKsS0F0zN7s0YicNrXh29gGSGGJ9/TYj9uDNi
	 96qMI6T0NOcSitjr+f194q/6BSQXE2bR1paYVKMnhBNq6K232G9UU4h+fVTVHp67rQUbZ
	 D2ESYPqOamba+YcMghwRLZz/q0/3ZjPAafIgt5THLp5n+TmxuctVATEMpzb50frbxHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018032;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=TFPuilWXCXfwg8PUB55ZTfR6U0KsGixzyEBhZTSwGeQ=;
	b=wTW8OG2Cm2104p8OLQdwAz8IdMtyLdRYyXnt6cn5xet8rr6LOutm3bzSPW5qWvTQlqTt
	 NPgG9O4wc04+iUpG7fn+LFxb2A2wBcdWTpVo5UhAzG7o5gU280/vgUfMVhsdIx4PmWVyN
	 SU6JYtBLKqEGf8GOzPC98Fas0RWtWfVT84gsDRXImUjQpJibpS48OYwgIQMGLVkuv+v+f
	 8loMQgCMSmSY/bLExvljYcbe2I92FohfF2/PpGo3mX0vkP+QnHekfHRwJOzpQH3LfJ6UP
	 IhdAz1yMdxe5J4RUW+1c8oFw9NwfIxNa8S4gku+nEX+TgWNDiR7D7eIUdcz0vD3O/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaAOD35E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBFE606A31A;
	Mon, 26 Oct 2026 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaAOD35E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159161F01825;
	Mon, 26 Oct 2026 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793018032;
	bh=TFPuilWXCXfwg8PUB55ZTfR6U0KsGixzyEBhZTSwGeQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=LaAOD35EOJqJ4/PiCPhJSiggVxHHw9TGsC8KDmXDDHOVhyg0eCTWiHy5UiC7bNNj9
	 9YWY5x5blQh1qKrYR9c4BK9Cb246ve7D8tcPvk91ETzxSvul8As2C6vnYCkD3X9e2W
	 o91erdDeGSEI1TZwtSOiKyHaweTl6skyRWFBhFSnz26ZWikoJxGE/PJdJmryJEZjSn
	 WQ1niuevvqgleJgsppmZx18jGdm9MZMOF3gj3peyVwuv/Q2K84Ih/FFqD7Q7n+4KiP
	 YhrwkRI97ixaemKh7IqUC/JFXDluEEZeYn0trJRepve2jQYJUQ/Qqt1PCqlGAi8PBG
	 o+60uNsI5Mh5A==
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
Date: Mon, 26 Oct 2026 13:33:48 +0100
Message-Id: <DMERUEZT5R3O.2K65JB1FXYVR4@kernel.org>
Cc: <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Lyude Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com>
In-Reply-To: <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com>

On Mon Oct 26, 2026 at 3:56 AM CET, Dave Airlie via B4 Relay wrote:
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 88662da634dc..d5c67625b561 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -419,6 +419,24 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      }
>  }
> =20
> +// PTIMER
> +
> +register! {
> +    base: NovaRegisters;
> +
> +    pub(crate) NV_PTIMER_TIME_PRIV_LEVEL_MASK(u32) @ 0x00009430 {
> +        4:4 level0 =3D> bool;
> +    }
> +
> +    pub(crate) NV_PTIMER_TIME_0(u32) @ 0x00009400 {
> +        31:5 nsec;
> +    }
> +
> +    pub(crate) NV_PTIMER_TIME_1(u32) @ 0x00009410 {
> +        28:0 nsec;
> +    }
> +}
> +
>  // The modules below provide registers that are not identical on all sup=
ported chips. They should
>  // only be used in HAL modules.
> =20
> @@ -520,6 +538,28 @@ pub(crate) mod gh100 {
>              31:0    fsp_boot_complete;
>          }
>      }
> +
> +    // PGC6/TIMER
> +    register! {
> +        base: NovaRegisters;
> +
> +        pub(crate) NV_PGC6_SCI_SEC_TIMER_TIME_0(u32) @ 0x00118f54 {
> +            31:5 nsec;
> +        }
> +
> +        pub(crate) NV_PGC6_SCI_SEC_TIMER_TIME_1(u32) @ 0x00118f58 {
> +            28:0 nsec;
> +        }
> +
> +        pub(crate) NV_PGC6_SCI_SYS_TIMER_OFFSET_0(u32) @ 0x00118df4 {
> +            0:0 update;
> +            31:5 nsec;
> +        }
> +
> +        pub(crate) NV_PGC6_SCI_SYS_TIMER_OFFSET_1(u32) @ 0x00118df8 {
> +            28:0 nsec;
> +        }
> +    }
>  }

Timer specific register definitions should go into the timer module.

> +#[pin_data]

Why is this #[pin_data]?

> +pub(crate) struct Timer {
> +    chipset: Chipset,

Why does this carry the Chipset?

> +    sys_timer_offset_ns: i64,
> +}

More generally, what's the purpose of this struct? What does it represent?

Nothing seems to tie this object to a particular GPU or prevents constructi=
ng
multiple instances for the same GPU.

It also doesn't seem to provide any access to the underlying HAL's function=
s?

> +impl Timer {
> +    pub(crate) fn new(bar: Bar0<'_>, chipset: Chipset) -> Result<Self> {
> +        Ok(Self {
> +            chipset,
> +            sys_timer_offset_ns: hal::timer_hal(chipset).init(chipset, b=
ar)?,
> +        })
> +    }
> +
> +    #[expect(dead_code)]
> +    pub(crate) fn sys_timer_offset_ns(&self) -> i64 {
> +        self.sys_timer_offset_ns
> +    }

What do we need this method for?

> +}
> +
> +pub(crate) fn get_cpu_time_ns() -> i64 {
> +    Instant::<Monotonic>::now().as_nanos()
> +}

I don't think this helper adds much value, let's just make users call
Instant::<Monotonic>::now().as_nanos() themselves.
