Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491325;
	b=vRjG0CJRnLmBd2wnpIVS92cFCodRhNF3Qo7nts1aJYGoKZ5SU9Rnrjvo34GetdUCsUVI
	 l2G2RQ7H4XSKqU2cauD/zvZQLZ27B1rL9D1rVRqKbtcFK9Qil/hDt3DKfmh9Jo6sqfin6
	 mauGa5LePO4zMQkQtaL/bXwVdxuqDuf0h8qNpsMZEifLnSLXdpIlksHfj2df/5VJZW479
	 q9yZAinWI6NytQOxI0mYL+QmgBwF3DqnbHxaxBSPaqQcnfN/3BMc+CyC+Er3g1zsm2+Nq
	 BE4SnbOLAH+je4PWfXppG/NEwbww8E8SxFT1vh5DbkP4whrkUh1o2BU/qvbFiZ/qYuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z8aoSraZUw7RtHVjQIDean+kwFhgokmYkufOMl94zx0=;
	b=WPOUrHwDaX6fy6tH+CZiUiQhOFbc03krNTdSeF3b2UWcLQS+JX3jJXIovlmY/wnFE6Si
	 LAcZLB+Fk6pmP4bgEMD516weZJLu/HR0cwjMhqqrbfJPlTYHVE0f/STHBJKkJXRhMFTAy
	 32HnhMO0NNm+wZ9E6RT3Ncy9oUqYx3183sc2PpaE027a8EmdzHOY1rt5BY39iN2OVb8WI
	 yFiFYR5teZ2o15jQiy+6JB/YxLQ8+VFyOPiFGI0WLtSZiVBglbwYDoIyGcAupEqk1mznh
	 aeLfG059X+Ese5YBUw30MPZ3/FsXMiHG4+q+ZZXOJgVjceytc6ts+v4xGqsY3Eaeeiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H77DKLIt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADF606A320
	for <nova-gpu@lists.linux.dev>; Tue, 20 Oct 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H77DKLIt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3AC1F000C5;
	Tue, 20 Oct 2026 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491324;
	bh=Z8aoSraZUw7RtHVjQIDean+kwFhgokmYkufOMl94zx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H77DKLItotKQo1hjJlX/JDuu0BxrtBptt6R65FoLj3Te2xrpFQ9xL7lNCT34V+YQJ
	 2dPvJ2nyNAY4rY0KFicfyLySTVYToA+PrKxcX7BPnNVf7GmOum6AEFLJ5X6N7QGNLH
	 UXZwHfZyfoBH5mY1rb/jZpDWB+oER2mELUKYqgMOHwCZFHVJ8XUYA5JNt9KxeEagwl
	 7FtQCRW2J37uz6BsK8zuEDgSrjQRSlifi45gIbEqRSfUSfNPXkSnZ6Cydj9jLs9etg
	 oAiSGcjE3orBL1OiJuMMP8wR/Ub8UHCKAxcxslQanwENTkkIlEM8vF05N6vqhOtc5b
	 9RAuaR7GqUjjA==
Message-ID: <sashiko-outbox-178817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/14] gpu: nova-core: gsp: cmdq: move the RPC code
 into a sub-module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, ojeda@kernel.org
In-Reply-To: <20261020-cmdq-rpc-v5-12-dceeb8f360ec@nvidia.com>
References: <20261020-cmdq-rpc-v5-0-dceeb8f360ec@nvidia.com>
 <20261020-cmdq-rpc-v5-12-dceeb8f360ec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:15:23 +0000
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
- [Low] gpu: nova-core: split kernel::time import block in cmdq.rs
--

commit 33237ce05e59a6a327898e33f27b96ad56cf0c7f
Author: Alexandre Courbot <acourbot@nvidia.com>

gpu: nova-core: gsp: cmdq: move the RPC code into a sub-module

This commit moves the RPC command and message types and methods from
drivers/gpu/nova-core/gsp/cmdq.rs into a new rpc sub-module.

> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 54e87fd7158cd..c5a2f08cda94a 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs

[ ... ]

> @@ -28,8 +29,8 @@
>          },
>          Mutex, //
>      },
> +    time::Delta,
>      time::{
> -        Delta,
>          Instant,
>          Monotonic, //
>      },

[Severity: Low]
This isn't a bug, but in the use kernel declaration in
drivers/gpu/nova-core/gsp/cmdq.rs, Delta was moved out of the time::{ ... }
group into a separate time::Delta entry above time::{ Instant, Monotonic }.
Should Delta remain grouped inside the single time::{ ... } block to follow
the kernel vertical import style?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-cmdq-rpc-v=
5-0-dceeb8f360ec@nvidia.com?part=3D12
