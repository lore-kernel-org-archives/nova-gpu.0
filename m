Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005637;
	b=nru/zPJvYTMZDypLA3TEJUrjRDrq1XKt8eiGnW3MdYqzYDLSvOogHDPnwuhT/hGL4rB+
	 2/6HGW+GrXQWeSpBohH6ATpMQ61+XjsajZrKfrhp1rA627seBc+kACkTNaz8YL04L5I5Y
	 q1XtEGmW8OPBIWFegp5wJz9TRoEwB7DVveTL4e5MFiMf+rlo7zcd8fnDLAc8bmOaR9hIQ
	 EEGSWPrrY2H3ZxBhPRwcMi3Gdf8Z+YUX0kzGdm72jrQu6pxBZ0URwPLmnlzDYb1yRWBR4
	 6TduLtH9W6EOG2cBvB0gBoSVWhcOefHjZS38VMiIDIpWuKDQjYd6BJXWrpudfNSlcnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005637;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2BAfWj5In4zi2COtui7ffzfJ9oPvJuwKlQmiIC6Rk/A=;
	b=QHv+SdZ5dZWoArzcd0Q6cYavtbD8v4HAKmMJ3sy+gmzvCoV9KU34/MyG3uLC7c3m4fSH
	 8vuHGRSBiYG1iqyOzQDwJz3YEPP5z29emF3GAOP7U/IuC5ODval8LFFI3PHcsNm07H05C
	 2/MpXD4ahfuydQ4jAGuUGMGh2lQP1Hh45zkZzdtDGi3Q4g3/2M+q6HajS91UfI9CkGoxf
	 4GtTF7QskKJLvdBcF+d+oERPJHz6q8qgzID9VFX70KYUYj3pDtPPucYeZY7f77d56W/Ad
	 R5pMxq3UqOpgFqYJDogbIKg9mk1kUx0ZrURE0VIK8fF7vhFgwzTkmglQupQbabxBtsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRYNaxPa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82205606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRYNaxPa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946861F01825;
	Mon, 26 Oct 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005637;
	bh=2BAfWj5In4zi2COtui7ffzfJ9oPvJuwKlQmiIC6Rk/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CRYNaxPaGKKLrmN/XXFq1o6TdaMdDnvbwk25ybq+CEnlimD7M69AIAJGwERte5F1x
	 WcnJMN5YkVd9V2rzpwduJ9VFyNPKPCl4Ea7kY+vJgmdk+NdennddHULCGSTZ3gQlvL
	 oSTtwe5pNidc20xruw1bML219NoazZie5i5SL62sc7Gr3gIwYJ/r2SpwJ597GTY3Nc
	 tg5eqq/MCVlLgl8M5hcWCSZGsGBMjczBwtpbTOIPjVmi3sl6TMWnxDwIiNCwvLAwdb
	 3GfiDI4L0DCUJ0M8A1nVUBlaNvgb2ky4LUcsnHjFDVeH78YJQJeRxp3vfakJP3ZHjp
	 S5O5KeB+O2sag==
Message-ID: <sashiko-outbox-184734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Lyude
 Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, ojeda@kernel.org
In-Reply-To: <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:07:16 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] gpu: nova-core: infinite loop on rollover in timer_read() and time=
r_time()
- [High] gpu: nova-core: unshifted nsec value in timer_time() causes EOVERF=
LOW
- [High] gpu: nova-core: wrong value and missing update bit in gh100::timer=
_time()
- [High] gpu: nova-core: u64 underflow on negative offset in gh100::timer_t=
ime()
--

commit 5b1f5a3805c6ab01f8b19ff029b873428252d6b5
Author: Dave Airlie <airlied@redhat.com>

gpu: nova-core: add support for GPU timer block.

This commit adds GPU timer block support to nova-core with HAL implementati=
ons
for TU102 and GH100 to initialize the GPU timer or calculate the system tim=
er
offset for GSP initialization.

> diff --git a/drivers/gpu/nova-core/timer/hal/gh100.rs b/drivers/gpu/nova-=
core/timer/hal/gh100.rs
> new file mode 100644
> index 0000000000000..e917446e7b01e
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal/gh100.rs
> @@ -0,0 +1,61 @@

[ ... ]

> +pub(crate) fn timer_time(bar: Bar0<'_>, chipset: Chipset, time_ns: u64) =
-> Result<u64> {
> +    let sec_hi2 =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_TIME=
R_TIME_1));
> +    let sec_timer_ns: u64;
> +    loop {
> +        let sec_lo =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_T=
IMER_TIME_0));
> +        let sec_hi =3D u32::from(bar.read(regs::gh100::NV_PGC6_SCI_SEC_T=
IMER_TIME_1));
> +        if sec_hi =3D=3D sec_hi2 {
> +            sec_timer_ns =3D u64::from(sec_hi) << 32 | u64::from(sec_lo);
> +            break;
> +        }
> +    }

[Severity: High]
Can this loop in timer_time() in drivers/gpu/nova-core/timer/hal/gh100.rs
spin forever if NV_PGC6_SCI_SEC_TIMER_TIME_0 rolls over?

During Gpu::new() -> Timer::new() -> Gh100::init() -> timer_time(), sec_hi2
is read from NV_PGC6_SCI_SEC_TIMER_TIME_1 once before the loop and is never
updated if sec_hi !=3D sec_hi2. If the lower 32-bit register wraps around
between the initial read of sec_hi2 and the in-loop read of sec_hi, sec_hi
increments while sec_hi2 remains at its old value, causing the loop to never
terminate. Should sec_hi2 be made mutable and updated to sec_hi at the end
of each iteration?

> +
> +    let sys_timer_offset_ns =3D time_ns - sec_timer_ns;
> +
> +    // kfspRequiresBug3957833WAR_HAL
> +    if chipset !=3D Chipset::GH100 {
> +        bar.write_reg(
> +            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_1::zeroed()
> +                .try_with_nsec((sys_timer_offset_ns >> 32) as u32)?,
> +        );

[Severity: High]
What happens in timer_time() in drivers/gpu/nova-core/timer/hal/gh100.rs wh=
en
time_ns is smaller than sec_timer_ns?

In drivers/gpu/nova-core/timer.rs, get_cpu_time_ns() returns monotonic time
since OS boot via Instant::<Monotonic>::now().as_nanos(), whereas
sec_timer_ns is read from the always-on PGC6 timer which persists across wa=
rm
reboots, kexec, and guest VM restarts.

When time_ns < sec_timer_ns, the u64 subtraction time_ns - sec_timer_ns will
underflow and panic the kernel when CONFIG_RUST_OVERFLOW_CHECKS=3Dy. Even if
wrapping subtraction is used, a negative 64-bit two's-complement offset has
its upper bits set to 1, so passing an unmasked (sys_timer_offset_ns >> 32)
as u32 to NV_PGC6_SCI_SYS_TIMER_OFFSET_1::zeroed().try_with_nsec() will
exceed the 29-bit (28:0 nsec) field and fail with EOVERFLOW.

> +        bar.write_reg(
> +            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_0::zeroed()
> +                .try_with_nsec((time_ns & 0xffffffff) as u32)?,
> +        );
> +    }
> +    Ok(sys_timer_offset_ns)
> +}

[Severity: High]
Are there a few issues with how NV_PGC6_SCI_SYS_TIMER_OFFSET_0 is written
here in timer_time() in drivers/gpu/nova-core/timer/hal/gh100.rs?

In drivers/gpu/nova-core/regs.rs, NV_PGC6_SCI_SYS_TIMER_OFFSET_0 is defined
as:

    pub(crate) NV_PGC6_SCI_SYS_TIMER_OFFSET_0(u32) @ 0x00118df4 {
        0:0 update;
        31:5 nsec;
    }

First, this call passes (time_ns & 0xffffffff) as u32 instead of the lower
bits of sys_timer_offset_ns, and it does not set the update bit (0:0 update)
to trigger hardware latching of the offset.

Second, because nsec is a 27-bit field at bits 31:5, try_with_nsec() checks
that the argument fits in 27 bits (< 1 << 27) and then shifts it left by 5.
Passing an unshifted 32-bit value causes try_with_nsec() to fail with
EOVERFLOW whenever any of bits 31:27 are non-zero, and shifts the value left
by an extra 5 bits when bits 31:27 happen to be zero. Should this pass
((sys_timer_offset_ns as u32) >> 5) and set update?

> diff --git a/drivers/gpu/nova-core/timer/hal/tu102.rs b/drivers/gpu/nova-=
core/timer/hal/tu102.rs
> new file mode 100644
> index 0000000000000..06ef88171f587
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal/tu102.rs
> @@ -0,0 +1,55 @@

[ ... ]

> +pub(crate) fn timer_read(bar: Bar0<'_>) -> u64 {
> +    let hi2: u32 =3D u32::from(bar.read(regs::NV_PTIMER_TIME_1));
> +    loop {
> +        let lo =3D u32::from(bar.read(regs::NV_PTIMER_TIME_0));
> +        let hi =3D u32::from(bar.read(regs::NV_PTIMER_TIME_1));
> +        if hi =3D=3D hi2 {
> +            return u64::from(hi) << 32 | u64::from(lo);
> +        }
> +    }
> +}

[Severity: High]
Similarly, in timer_read() in drivers/gpu/nova-core/timer/hal/tu102.rs, hi2
is read once before the loop and never updated to hi when hi !=3D hi2. If
NV_PTIMER_TIME_0 wraps around between the initial read of hi2 and the in-lo=
op
read of hi, won't this loop spin forever?

> +
> +pub(crate) fn timer_time(bar: Bar0<'_>, time_ns: u64) -> Result {
> +    if bar.read(regs::NV_PTIMER_TIME_PRIV_LEVEL_MASK).level0() {
> +        bar.write_reg(regs::NV_PTIMER_TIME_1::zeroed().try_with_nsec((ti=
me_ns >> 32) as u32)?);
> +        bar.write_reg(
> +            regs::NV_PTIMER_TIME_0::zeroed().try_with_nsec((time_ns & 0x=
ffffffff) as u32)?,
> +        );

[Severity: High]
In timer_time() in drivers/gpu/nova-core/timer/hal/tu102.rs, NV_PTIMER_TIME=
_0
also defines nsec as a 27-bit field at bits 31:5:

    pub(crate) NV_PTIMER_TIME_0(u32) @ 0x00009400 {
        31:5 nsec;
    }

When called during probe via Gpu::new() -> Timer::new() -> Tu102::init() ->
timer_time(), won't passing the unshifted (time_ns & 0xffffffff) as u32 to
try_with_nsec() return EOVERFLOW whenever bits 31:27 of the low 32-bit
timestamp are non-zero, and otherwise shift the value left by an extra 5
bits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-drm-rust-n=
ext-v1-0-14a4ae469175@redhat.com?part=3D2
