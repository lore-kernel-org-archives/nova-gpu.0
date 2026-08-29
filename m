Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B513ACEE9;
	Sat, 29 Aug 2026 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030880; cv=none; b=MUIjtrGf/u62CqNi+FiZGcoDRrl3lCpGlXCy4LndJHhTqote8F7lPgbonl9lVtD1AZmeTelGU52grIbYHJDAg+6cNTRpqGTe4FO4mh2xgDQSbNuUWkdi8gcSPYA1x7jA89M82e9jzUfsetgFK8JzVbbtMwZVjDfRynRowb/G9iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030880; c=relaxed/simple;
	bh=rm6Zra25rFQi1Uy2T+X5ylmOKh5Y+pThpZean8unTrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=EUAnORy4phJQ0kWrFd0ipuCnuitMpN8GWC87V2KARb/ijN/I1yVtA5FJ+gwfgxgWGM5EzLNm1CdCPj5JUu9uZ/c9nbOmJ0L8hg/COreW7MU7CcHw2Rje/sHDyw3QYnnj3HYJZQMxVOrIzi3LMH0/xdr2grLxVlGT4kbOkq8/EWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbQWb2JE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbQWb2JE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B351F000E9;
	Sat, 29 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788030877;
	bh=uFSAQBNlSCr6Z8wJaIeKFDqKOuLHcGqGVoKW4G1mPFw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=SbQWb2JESZH/tzjTxWL774/1DKvZZXGetGKyDmxevJZglvxS4g+ild9AXHt1vHdaG
	 KUYitJYwdwqBUzhHWiPpt0pnkWIdikUjMkPjHnsZHUXqwm3M236MEhmKNxNqZjS455
	 k842ghknIyIKBqB5rSWaHPXkXquykkgtq+6xiHpKNoZTM1I22NcPGnQCjQsGJUYt0i
	 MUAi2a+f5/WSfi1bmKK/5AP1ugbGnPTTR/nPU/bpJ7efQNzmhe4As0zPZvoi/ltws0
	 95uznd6dVM0DqZinWDlA/rl2Qg5G0lhrNwLt3R2tv+p6WGt/zp5bNDMK/zVAL9rKAh
	 WUJ2+tKZSD72w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 21:14:33 +0200
Message-Id: <DL1O1NFXUX6N.1LFASWF425I4Y@kernel.org>
Cc: <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: use kernel lossless integer
 conversion module
References: <20260828-nova_num-v1-0-e21f17ba4127@nvidia.com>
 <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com>
 <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
 <DL142442KXHA.3VFWP2DHD7H2E@nvidia.com>
In-Reply-To: <DL142442KXHA.3VFWP2DHD7H2E@nvidia.com>

On Sat Aug 29, 2026 at 5:34 AM CEST, Alexandre Courbot wrote:
> On Fri Aug 28, 2026 at 9:09 PM JST, Danilo Krummrich wrote:
>> (Cc: Miguel)
>>
>> On Fri Aug 28, 2026 at 7:33 AM CEST, Alexandre Courbot wrote:
>>> The `kernel` crate now features a replacement for our lossless integer
>>> conversion routines. Switch to the kernel version and remove our own.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/falcon.rs                    |  12 +-
>>>  drivers/gpu/nova-core/falcon/fsp.rs                |   4 +-
>>>  drivers/gpu/nova-core/fb.rs                        |   2 +-
>>>  drivers/gpu/nova-core/fb/hal/gb100.rs              |   6 +-
>>>  drivers/gpu/nova-core/firmware.rs                  |   4 +-
>>>  drivers/gpu/nova-core/firmware/booter.rs           |   4 +-
>>>  drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
>>>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   4 +-
>>>  drivers/gpu/nova-core/firmware/gsp.rs              |   9 +-
>>>  drivers/gpu/nova-core/firmware/tlv.rs              |  11 +-
>>>  drivers/gpu/nova-core/fsp.rs                       |   8 +-
>>>  drivers/gpu/nova-core/gsp.rs                       |   4 +-
>>>  drivers/gpu/nova-core/gsp/cmdq.rs                  |  22 +--
>>>  drivers/gpu/nova-core/gsp/fw.rs                    |  42 ++--
>>>  drivers/gpu/nova-core/gsp/fw/commands.rs           |   4 +-
>>>  drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
>>>  drivers/gpu/nova-core/mctp.rs                      |   8 +-
>>>  drivers/gpu/nova-core/num.rs                       | 211 -------------=
--------
>>>  drivers/gpu/nova-core/vbios.rs                     |   2 +-
>>>  19 files changed, 78 insertions(+), 283 deletions(-)
>>
>> Please see the discussion in [1].
>>
>> If we make this change, then the subsequent conversion to const_as!() wo=
uld need
>> to go through the Rust tree next cycle, which could be a bit of a mess, =
as I'd
>> expect a bunch of conflicts.
>>
>> Alternatively, we could the the full three cycle dance, or have a signed=
 tag for
>> const_as!() and use it right away.
>>
>> But honestly, the former would just be unnecessary noise. If we don't do=
 the
>> latter, let's just keep the nova-core num module until the dust has been
>> settled.
>>
>> [1] https://lore.kernel.org/all/CANiq72k+-fNWZCwGuQ=3DFTchxgm-X-f6WR=3Dt=
G=3DErcn19ic1edQg@mail.gmail.com/
>
> Maybe I am missing something, but wouldn't the following work?
>
> - rc1 gets tagged, `drm-rust-next` gets the `num::casts` module,
> - This series gets applied to `drm-rust-next`, then `cv!` (without the
>   nova-core conversion patch) in `rust-next`,
> - We wait one cycle for `cv!` to trickle down to `drm-rust-next` before
>   converting nova-core to use `cv!`.
>
> Would that work? This series doesn't overlap with the const conversions
> that `cv!` covers on purpose, and it would have the benefit of getting
> rid of the local `num` module in nova-core quickly.

Take casts::usize_into_u32() for instance, drm-rust-next replaces the usage=
 of
it next cycle, but rust-next wants to remove the API from
rust/kernel/num/casts.rs.

In this case rust-next would need to get rid of the users (including nova-c=
ore),
but drm-rust-next will likely do different changes, so we'd get unnecessary
merge conflicts.

You can resolve this either by keeping casts::usize_into_u32 and friends ar=
ound
for one additional cycle, so that all users we introduce now are gone. Or, =
since
there's no rush anyways, we just wait one cycle and use the real thing righ=
t
away.
