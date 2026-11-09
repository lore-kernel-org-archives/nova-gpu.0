Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190188;
	b=xpHbF9mzKWs37iohnPJ+NZxJgzsUEP1dPSS4Ht8NTH9OZlqsrKq4Kjg1nnxlRyRRvAJb
	 ze3aM6F5Se/YTihjkt2BbvgYkpXCNu1VfoRgNcnlP8Q5Fm9tQeudnsTeQWz6N8yO0QZcT
	 dcrmctZUCroC8AULka79zndWDDtquYExEN3N79EmvlFygYLCKLC0xx0BR5/bN/KUhkv2u
	 YMKPkEQghKJvO9qxZocLJeeZWq7X4bPkXkS0bmpVQg2sUk5nFBsCI52aOc1/SPY8ZS49K
	 49tfHfjf1Dnfyly0EENu/IFU6MOV/Lwo7ulQsWIwQ4rnG3eTq5dZq3jBWVrZZzeK+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AGlA800/A1ayCVptXG9KT/P7KQrv/2x+66sQSAFdyOY=;
	b=3OAjvEtpCA57+CD8yVChFczOat/Oeyu0Chme5n2yasmmQ0FXv90zl0fRy3Y41oq+Nnu9
	 Cj3dMxffrjPtTPh/IR/sUUGYRfxwJ2KORhoIl5O+3z3ry2wgj3G/bUus4pN7bqPdE7h/h
	 RmvlCwUw/Ly+v5Jji8J0I7BiuwdEHHYf/3DEr+HaMIzPMuRcDo4awCHj0iUhEbYB+szKD
	 Gtg6oCdFfq5URNDEzXEClEJbOcsJK0wPKuxpMgyWvlmACN0T2S49B+7r9m9/3k9tX2sGT
	 OB8SPKDDTS2SJ/SPNhCT/D/tyUMQD9oCbG8GOula8KeKcU1a0Gp0yXh8Mc08LwTub2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVVM4NSf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE5606A31C
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVVM4NSf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AE81F0089F;
	Mon,  9 Nov 2026 02:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794190187;
	bh=AGlA800/A1ayCVptXG9KT/P7KQrv/2x+66sQSAFdyOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVVM4NSfe9RiSG+B2HBbNRu2xYaywBPuAqT+22NA+bz+m+vjt93lIMgOrUKELKmO+
	 ROCv58H8v0pUjFgI8cO099czmgNc0X3Bqt40thISG2fRdlYws4xqaT59rq0qM2X3TA
	 CsSQoeO/YYTCUWfZCmdaFh3MqHDgKAq+tZcZJZBjwvaf9Q6tJ26+HOjRBuXWnip1IW
	 puQKiIydj5hcPCKrZrjuPtFmz4AfLwDrwh2V1XShnS1syAa111hr1wftNCGbyHTInn
	 qj7v5Rd8uGeHzV9vcPs4JLYtewtotnz3+xHY8uOUIGxGE4/6EPGJDWXLkID4KBK8gi
	 U9350heq1pucg==
Message-ID: <sashiko-outbox-204344@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] gpu: nova-core: add support for GPU timer block.
 (v6)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261109-nova-timer-v6-2-5544a3bd8b28@redhat.com>
References: <20261109-nova-timer-v6-0-5544a3bd8b28@redhat.com>
 <20261109-nova-timer-v6-2-5544a3bd8b28@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 02:09:46 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] gpu: nova-core: wrapped timer offset programmed in
  set_sys_timer_offset()
--

commit 7d2284f17f67e098294d4252bcce87d29a2a59b1
Author: Dave Airlie <airlied@redhat.com>

gpu: nova-core: add support for GPU timer block. (v6)

This commit adds GPU timer block initialization for Turing through
Blackwell GPUs to compute the system timer offset for GSP initialization,
including a GH100 FSP ucode version check for bug 3957833.

> diff --git a/drivers/gpu/nova-core/timer/hal/gh100.rs b/drivers/gpu/nova-=
core/timer/hal/gh100.rs
> new file mode 100644
> index 0000000000000..154c7a301a0c1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer/hal/gh100.rs

[ ... ]

> +fn set_sys_timer_offset(bar: Bar0<'_>, fsp: &Fsp<'_>, time_ns: u64) -> R=
esult<u64> {
> +    let sec_timer_ns =3D sec_timer_read(bar);
> +
> +    let sys_timer_offset_ns =3D time_ns.wrapping_sub(sec_timer_ns);
> +
> +    // Don't set the timer offset registers on buggy firmware
> +    if !fsp.is_bug_3957833_affected(bar) {
> +        bar.write_reg(NV_PGC6_SCI_SYS_TIMER_OFFSET_1::from_nsec(
> +            sys_timer_offset_ns,
> +        ));
> +        bar.write_reg(
> +            NV_PGC6_SCI_SYS_TIMER_OFFSET_0::from_nsec(sys_timer_offset_n=
s).with_update(true),
> +        );
> +    }
> +    Ok(sys_timer_offset_ns)
> +}

[Severity: Medium]
As reported by Alexandre Courbot on v4 [1], can set_sys_timer_offset()
program a wrapped value into NV_PGC6_SCI_SYS_TIMER_OFFSET_1 and
NV_PGC6_SCI_SYS_TIMER_OFFSET_0 when sec_timer_ns exceeds time_ns?

If the host wall-clock time is behind the GPU secure timer, wrapping_sub()
produces a large wrapped u64 that nsec_hi() truncates to 61 bits when
writing the hardware offset registers while returning the unmasked 64-bit
value for GSP initialization.  In OpenRM, tmrSetCurrentTime_GH100 verifies
secTimerNs < osTimeNs and returns early without programming the offset
registers if the delta is not positive, with the caller logging and
ignoring the error.

[1] https://lore.kernel.org/r/DMO7FUYY05LK.123ZPLIW24C2S@nvidia.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-nova-timer=
-v6-0-5544a3bd8b28@redhat.com?part=3D2
