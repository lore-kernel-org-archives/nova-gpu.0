Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74373449B3A;
	Fri, 28 Aug 2026 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918963; cv=none; b=hfXHh+gmMcCBHtUsOLKbtdt+Yh4NvbXOVjy+vv3sLC+9LmyXLQwpP/dKNNuVkbmvLkwk9A35r13wV0octjkcwtRxn2UF4tFXwNgPDZ8pEQHvaZFPM4nq1LSEhY6fm5k80O8mTirEBhhg9nhTzlWdeY+DM/1DIXoUAMVKSln2MhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918963; c=relaxed/simple;
	bh=9n1l6qFZvjQm6gmTg2t4HsTbgGq2xX4QFcrc68Zzg8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QVccEWhJq6hkP1uks/rFqzygs9VZqiNm0ZFRIsItRyaeMyrJyhsB5tUblQiSG5LiLEV1ggjQon1ETu511vRj4tWM30ShCCm7pMZjvcSXD8Set8UpYM+aYKmwcVr62Yx8WSF2X4DTRkCgcamb3RxJzEWgdez7QDq4HgpgGVrRhbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+IwMLZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+IwMLZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673251F00A3A;
	Fri, 28 Aug 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787918946;
	bh=twoPQU5vTKg4nfajP+mzb8+VLElzhS+uBF362FjP9Tk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=T+IwMLZPEyxWNnU+xwFhUJdLWi6w4t3yXBg2lSwbGb0GeNTecwGG6aShfHFxkmzd3
	 o+QGtx2mMIJpF96FE1lasCwwaGCzJ9RsNuRbQZifnuVNa2y/QADtsAGt/h3plt0b8u
	 YNEUfTPwi/zJq1aOxYaWraTG+7+lFu+6JoBMTRmDhtasYtU6tqiWzqb3xqOYWAD7Ct
	 KJEINUykeoeIq5L7og3v8p4Xle4if9salg3nAucVkBygxPuAGgjmQlt/RK5TEGylN/
	 YVtelE+qdM+Pml74FZ6ShD3Z422nQ51FIuF87KztbqMdn+asIKqdvSl8F+X8lJawdb
	 GTwZjbNvm8CbA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 14:09:01 +0200
Message-Id: <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: use kernel lossless integer
 conversion module
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260828-nova_num-v1-0-e21f17ba4127@nvidia.com>
 <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com>
In-Reply-To: <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com>

(Cc: Miguel)

On Fri Aug 28, 2026 at 7:33 AM CEST, Alexandre Courbot wrote:
> The `kernel` crate now features a replacement for our lossless integer
> conversion routines. Switch to the kernel version and remove our own.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs                    |  12 +-
>  drivers/gpu/nova-core/falcon/fsp.rs                |   4 +-
>  drivers/gpu/nova-core/fb.rs                        |   2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs              |   6 +-
>  drivers/gpu/nova-core/firmware.rs                  |   4 +-
>  drivers/gpu/nova-core/firmware/booter.rs           |   4 +-
>  drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   4 +-
>  drivers/gpu/nova-core/firmware/gsp.rs              |   9 +-
>  drivers/gpu/nova-core/firmware/tlv.rs              |  11 +-
>  drivers/gpu/nova-core/fsp.rs                       |   8 +-
>  drivers/gpu/nova-core/gsp.rs                       |   4 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs                  |  22 +--
>  drivers/gpu/nova-core/gsp/fw.rs                    |  42 ++--
>  drivers/gpu/nova-core/gsp/fw/commands.rs           |   4 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
>  drivers/gpu/nova-core/mctp.rs                      |   8 +-
>  drivers/gpu/nova-core/num.rs                       | 211 ---------------=
------
>  drivers/gpu/nova-core/vbios.rs                     |   2 +-
>  19 files changed, 78 insertions(+), 283 deletions(-)

Please see the discussion in [1].

If we make this change, then the subsequent conversion to const_as!() would=
 need
to go through the Rust tree next cycle, which could be a bit of a mess, as =
I'd
expect a bunch of conflicts.

Alternatively, we could the the full three cycle dance, or have a signed ta=
g for
const_as!() and use it right away.

But honestly, the former would just be unnecessary noise. If we don't do th=
e
latter, let's just keep the nova-core num module until the dust has been
settled.

[1] https://lore.kernel.org/all/CANiq72k+-fNWZCwGuQ=3DFTchxgm-X-f6WR=3DtG=
=3DErcn19ic1edQg@mail.gmail.com/
