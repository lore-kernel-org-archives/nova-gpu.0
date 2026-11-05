Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848875;
	b=PkCzheWIqNKs75Srp0BVtlBM2t/9nq9cNVJ0APo4pTx+6HP3/BRGQJQ48GLEXEr09KA4
	 Bm1BXKvoFJuM+toTucdzjXTotoGSSkcytIXaHeDud8Ww8+7hJLRhTj200UxfcaaWWPzlJ
	 vFHerVCJhbheMQYKYupVqUonU99rdEk+3kBe4ci888PL/qKrSaRUb0gaj711PcaX7zy67
	 uyANrpid9kqFGwT+XlZKZ8v0/1kTOYGwwGAShSA7o1Ub7HdQE2id0pEx/XcqEcAODdAs/
	 JsEAh9GeAg6e/T+OiJ63V4F21YppM1YUkcS9Bw3eENLuDSE7O4CNGlWXHFIJlrR37Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ahle78czmMQmNJ8RshHP9Py04n+M5+FjBAsg5ZyW7Mo=;
	b=NdNvlgFuEDcrVd8xsQuEbqrM1vEvDVzuLcllQ4rU2GFh0xzemGzuzqbIXxSwGD3dKVFZ
	 ws8L+eSiJ5F7XnI1V3ueTboh3nvN35LfQrSGNuUP3brZtQGaGRnlg6wRgSZSwp0x4gpEB
	 A1y1ge7asG3XH2FnZWNzDQUmFLIlGAjLbg0KjJ/pKqy4NZWkkcAZJS7PBNLDPD7eS6qdJ
	 iAX2oeK+ZdlZvsLPEy+BhQzOYc6KEZZPvXs3CZUpks5+nNwv1Kiw87qKDAnbUPYnVMbyY
	 6UfU+A2oJPodXDRtV7szQyOvTYHKcwFqPbWGY8I7LFvwwwfNcrLoLPVOACvaP0Wyu/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cdKi9lsl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B722606A31B
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cdKi9lsl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342B21F000C1;
	Thu,  5 Nov 2026 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793848874;
	bh=ahle78czmMQmNJ8RshHP9Py04n+M5+FjBAsg5ZyW7Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cdKi9lslvbsbrLrUtAiMrIhGKK6ZWRB15QH8mj/eczCg7fhaOrZvjQWLWvmR63mHu
	 O2o812G/+EzeH3SFgaNQNUU/BBVBwY2TmCAO7ScapT67TUCddB9EfxrkcDCItUHdvb
	 8OU3+4zeNPyh/KkPqJN25jGaOvMwQqKJYSnABv/M24mFX5mZsCP7DkulT55XwN2DJK
	 0eubiN//ImtOmIOUCkzdXo/Mko4j8F87c6CSqeSISrdAwEK4gocW3q9d1/6JKUfaKM
	 ZPxsLG2eO4fveniI3hBSWUQgwgVbfGWTUpjr8ckYw4b55kC4eNu8ZFH99lb3/+g6R+
	 82EH05Xltnaww==
Message-ID: <sashiko-outbox-198510@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] gpu: nova-core: add support for GPU timer block.
 (v4)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261105-nova-timer-v4-2-45a7c121d4de@redhat.com>
References: <20261105-nova-timer-v4-0-45a7c121d4de@redhat.com>
 <20261105-nova-timer-v4-2-45a7c121d4de@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 03:21:13 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpu: nova-core: u64::checked_sub() fails on negative offset in tim=
er_time()
--

commit 8e6e7110b2947fca24843940e52d712c197357df
Author: Dave Airlie <airlied@redhat.com>

gpu: nova-core: add support for GPU timer block. (v4)

This commit adds GPU timer block initialization support for nova-core across
Turing/Ampere/Ada (tu102 HAL) and Hopper/Blackwell (gh100/gb100 HALs) to
compute the system timer offset passed to GSP initialization.

> diff --git a/drivers/gpu/nova-core/timer/hal/gh100.rs b/drivers/gpu/nova-=
core/timer/hal/gh100.rs
> new file mode 100644
> index 0000000000000..0486df5889647
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal/gh100.rs
> @@ -0,0 +1,79 @@

[ ... ]

> +    fn timer_time(&self, bar: Bar0<'_>, time_ns: u64) -> Result<u64> {
> +        let mut sec_hi2 =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_=
SEC_TIMER_TIME_1));
> +        let sec_timer_ns: u64;
> +        loop {
> +            let sec_lo =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_S=
EC_TIMER_TIME_0));
> +            let sec_hi =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_S=
EC_TIMER_TIME_1));
> +            if sec_hi =3D=3D sec_hi2 {
> +                sec_timer_ns =3D u64::from(sec_hi) << 32 | u64::from(sec=
_lo);
> +                break;
> +            }
> +            sec_hi2 =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_=
TIMER_TIME_1));
> +        }
> +
> +        // The system and the GPU timer are both free-running with unrel=
ated epochs, so the
> +        // difference can be negative. Both operands are < 2^62, hence t=
his cannot overflow.
> +        let sys_timer_offset_ns =3D time_ns.checked_sub(sec_timer_ns).ok=
_or(EINVAL)?;

[Severity: High]
In Gh100::timer_time(), both time_ns and sec_timer_ns are u64 values. When
the difference is negative (time_ns < sec_timer_ns), u64::checked_sub()
returns None, causing Gh100::timer_time() to return Err(EINVAL) and abort
Gpu::new() -> Timer::init() -> Gh100::init() during probe.

Since the comment notes that the difference can be negative and both operan=
ds
are less than 2^62, should this use wrapping_sub() (or signed subtraction)
instead of checked_sub()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-nova-timer=
-v4-0-45a7c121d4de@redhat.com?part=3D2
