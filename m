Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639512;
	b=EkCh2Id7Skwone5FcxiOubaJ51xQxNEACW138zJIyHuwGElMvBug3U8RQfgw2Ql5MHEN
	 9+um2XQFx3kuoSelSVKj4NPYAi4kVD8Ed/nQDxA1NpC0wJu9c/0jOOxP4cpa6P7Ylz0Hr
	 pHYirboIzqFqlebZBqzriGecIQ3hBwXFZ5znCSNAV1WsPaUItauACVfLQGp6xWiytlyi+
	 dkr6FrjNY9uoE562DuO9hjqHSPcvGpKI0uAwrYOo0vD/DgDVszlG1jWFmErItbgNxm/EW
	 PEXZ4hB6/xoSzEcwctZlHD4jFzwbZd+OpLtZHtZYy9cu0gjukK/I2BFGmJ4x69FiX9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cuQWtJGwnvegdYikr8U6KKYKj8DR4nlIdjuO1a/b6fk=;
	b=T29Gx127kcg9SLLeX85tMwLoXz5PDFTjgIMxGMXiXOPDRxOs87LHsKUOD0s5Jx1lXL9d
	 Vn7+usoepjWIfkM81zokjuyVYzetMG5M8X3bLzYsnVaAF5y6bD0/5ucWqqpUoUPRnfxZY
	 34q1rkl1Kn6zT/Djl9Ma0bN8DobMLRMDcnRMJgt9d07gFdxuf5EoHLNvbRczw8ao6bp6z
	 SXShVhV7vojzcZZUrgnokLCUxBlOsS0ve6xIO+A3Hznkm34aUOJs+TFc24k+nP7VJSbgR
	 Sy7Pvh0mu2eTuWBX0oSsAxDlMmBrPcrcBVQYIwqKExuKwh4I4QBPY5DG0KBDtBooZeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TerN/uEq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54671606A33A
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TerN/uEq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC451F00A16;
	Mon,  2 Nov 2026 17:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639511;
	bh=cuQWtJGwnvegdYikr8U6KKYKj8DR4nlIdjuO1a/b6fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TerN/uEqB6ABewtwZ5RYEEmU6xQW54N2wIeB4MPLQPo2pilZkP0wJlGIV/UkBT1sM
	 ptH+43vrfTsWw6dpGlBuKAQmXJ+44Xx079Owk7FdcPf/MAOH+A3L88GtLcKm9c2gx8
	 dVsi0VISUH6fxxwzavTB48T8Z8nR6LU61o3oGMlbxjYbfYBOA9ecCazM/pTWtPjMc5
	 Coyc1uEvbWipeXistwcEVXOBKcfZjC723r0voETvaq/M1AnMmxzSCjAdLjG8eXQpbZ
	 85paAcGOTSU2hQDJvc86zUGBljuk9xZdg4YjVS5dR5M/twAfBjLtUXaxZ4YHeFaYE+
	 HIa2fI30AqJ9g==
Message-ID: <sashiko-outbox-193809@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
 (v2)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261102-nova-timer-v1-2-b347ead64469@redhat.com>
References: <20261102-nova-timer-v1-0-b347ead64469@redhat.com>
 <20261102-nova-timer-v1-2-b347ead64469@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:11:50 +0000
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
- [High] gpu: nova-core: GH100 FSP bug 3957833 WAR applied to Blackwell in =
timer_time()
--

commit fd289ae7ae729480f9ef4d6e43c04d6aa8f3dbe4
Author: Dave Airlie <airlied@redhat.com>

gpu: nova-core: add support for GPU timer block. (v2)

This commit adds GPU timer block initialization for nova-core to compute and
program the system timer offset passed to GSP initialization, with HAL
implementations for TU102 (Turing/Ampere/Ada) and GH100 (Hopper/Blackwell).

> diff --git a/drivers/gpu/nova-core/timer/hal.rs b/drivers/gpu/nova-core/t=
imer/hal.rs
> new file mode 100644
> index 0000000000000..7aeff6cdc6787
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal.rs
> @@ -0,0 +1,28 @@

[ ... ]

> +pub(super) fn timer_hal(chipset: Chipset) -> &'static dyn TimerHal {
> +    match chipset.arch() {
> +        Architecture::Turing | Architecture::Ampere | Architecture::Ada =
=3D> tu102::TU102_HAL,
> +        Architecture::Hopper | Architecture::BlackwellGB10x | Architectu=
re::BlackwellGB20x =3D> {
> +            gh100::GH100_HAL
> +        }
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/timer/hal/gh100.rs b/drivers/gpu/nova-=
core/timer/hal/gh100.rs
> new file mode 100644
> index 0000000000000..7f55bf04a3f35
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal/gh100.rs
> @@ -0,0 +1,76 @@

[ ... ]

> +/// FSP ucode version from which on the fix for bug 3957833 is included.
> +const FSP_BUG_3957833_FIX_VERSION: u32 =3D 0x44c;
> +
> +/// kfspRequiresBug3957833WAR_HAL: returns `true` if the FSP ucode preda=
tes the fix for bug
> +/// 3957833 and hence the sys timer offset must not be programmed.
> +fn fsp_requires_bug3957833_war(bar: Bar0<'_>) -> bool {
> +    bar.read(regs::gh100::NV_GFW_FSP_UCODE_VERSION).full().get() < FSP_B=
UG_3957833_FIX_VERSION
> +}
> +
> +fn timer_time(bar: Bar0<'_>, time_ns: i64) -> Result<i64> {

[ ... ]

> +    if !fsp_requires_bug3957833_war(bar) {
> +        let offset_ns =3D sys_timer_offset_ns as u64;
> +        bar.write_reg(
> +            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_1::zeroed()
> +                .try_with_nsec(((offset_ns >> 32) & 0x1fff_ffff) as u32)=
?,
> +        );
> +        bar.write_reg(
> +            regs::gh100::NV_PGC6_SCI_SYS_TIMER_OFFSET_0::zeroed()
> +                .try_with_nsec(((offset_ns >> 5) & 0x7ff_ffff) as u32)?
> +                .with_update(true),
> +        );
> +    }
> +    Ok(sys_timer_offset_ns)
> +}

[Severity: High]
Should fsp_requires_bug3957833_war() in drivers/gpu/nova-core/timer/hal/gh1=
00.rs
be restricted to Hopper (GH100) rather than also running on Blackwell?

In drivers/gpu/nova-core/timer/hal.rs, timer_hal() routes Architecture::Hop=
per,
Architecture::BlackwellGB10x, and Architecture::BlackwellGB20x to
gh100::GH100_HAL:

    Gpu::new()
      -> Timer::new()
        -> hal::timer_hal(chipset).init(bar)
          -> Gh100::init()
            -> timer_time()
              -> fsp_requires_bug3957833_war()

In OpenRM, kfspRequiresBug3957833WAR_HAL is an FSP HAL method implemented o=
nly
for GH100 (comparing GH100's FSP ucode version against 0x44c) and stubbed to
return false on Blackwell, which has separate FSP firmware version numberin=
g.

When running on Blackwell (BlackwellGB10x or BlackwellGB20x), if the value =
in
NV_GFW_FSP_UCODE_VERSION is below 0x44c, won't timer_time() falsely trigger
the GH100 workaround and skip programming NV_PGC6_SCI_SYS_TIMER_OFFSET_1 and
NV_PGC6_SCI_SYS_TIMER_OFFSET_0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-nova-timer=
-v1-0-b347ead64469@redhat.com?part=3D2
