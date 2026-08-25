Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07263C9EDD;
	Tue, 25 Aug 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686864; cv=none; b=MfpFFG1cidnJwzasgGjZZutCVRvJkIJCU3X9toXI9q9KfvWhSjCfHqZSaIPk2WJPxUtuLXOTbd7QLU9pMXSQfn6AzJ8sXQeMx5wtGJJ6JHqe5RWphvahqt8rkFHNH4mVfcVOiQs+V3o8F7blNoB57Yt7qVpl/cU7PLF2U7Oa2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686864; c=relaxed/simple;
	bh=iIC94157v0mk+zcK4oZsYsWRO5nPBW/l3f/3bjxWVeU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VEeeB6l0v+yF5u1bMj21NjtOHfM/HCPGkyo4OV1i8YYQalhv8nx2t2NPeKK4gyd4jizmVP3KK9jkokqmab4VmLJ2XdmNMafXpPsYjc6FBm2Ckf4SFLpZKbkqs21wKKAe/8Vofb1H/HI3crEwwxSeR+MdsmgPX/vQJYPHtvcA8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkxj9LuU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkxj9LuU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E171F000E9;
	Tue, 25 Aug 2026 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787686862;
	bh=T+dlqjm0IAAgRcBNGorDzWu9/5/k2UBbyzCQOio8bMY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=kkxj9LuUL2n+8Rk0mHhpWZHGmUKuGCycQe7q6I1mcJ6XPc+9QG+BUtNQi/R1lNqLI
	 UE5N6jxvWipJfDfS7frWO/m5HyE4fszQnXE8bwXI8eBM3LaBzHL5RAjdUrFznaYJnO
	 d3LaF9KUNKt4LCQ9LrwhvRSM9ChzxfQazbaXoUNrAJvk5opY58q2HKFoyzuqIBg9FF
	 IZgy9OuHA+hhCqdPabeJ/rkFylYCgXrKmFVo3xAdwIHyK08j8jpSbO8FYOq3R8tLPw
	 VdAM//Viw2ct1JIE5p+0G2jvZqVobDISSDJJN++H57oRpfy/C2XBz6f8LzEP8ge9DQ
	 B5U64NxVQ8MjA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 21:40:58 +0200
Message-Id: <DKYA3P4E2CRC.3NVNCJ42J2FRN@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC
 firmware
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
In-Reply-To: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>

On Tue Aug 25, 2026 at 10:31 AM CEST, Alexandre Courbot wrote:
> The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
> itself as running on the FSP. This is incorrect: GSP-FMC is loaded by
> the FSP, but runs on the GSP as the loader and verifier of GSP-RM. FSP
> secure-boots on its own before the driver even starts.
>
> Correct the naming and files used to contain the GSP-FMC code, by:
>
> - Renaming `firmware/fsp.rs` to `firmware/gsp_fmc.rs` (as GSP-FMC is not
>   the FSP firmware),
> - Changing the prefix of some declarations in that file to `FMC` or
>   `GspFmc` (interestingly some were already correct),
> - Fixing a mismatch (FMC means "First Mutable Code") in `fsp.rst`.

Good catch,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

>       FSP (hardware root of trust, boots from ROM)
> -          -> FMC (Falcon Microcontroller, verified by FSP)
> +          -> FMC (First Mutable Code, verified by FSP)

That reminds me that I'd like to have a table in Documentation/gpu/nova/ li=
sting
and explaining all abbreviations.

In nouveau it's a huge mess and all the abbreviations became rather confusi=
ng.

I think we already have a couple unexplained ones in nova-core, such as ACR
(Authenticated Code RAM), if that is even correct. :)

Besides that I think it would also be nice to have a basic graphs of the
different boot sequences in the documentation as well, including the differ=
ent
firmware images and the purpose they serve, including sub-components.

For instance, I think we never mention where ACR lives (SEC2 before Hopper,
GSP-FMC since Hopper), if I got that correct.

We already have something is fsp.rst, but I think it is misleading and need=
s to
be fixed as well.

	nova-core                          FSP
	   |                                |
	   |  1. Poll scratch register      |
	   |  (wait for FSP boot complete)  |
	   |                                |
	   |  2. COT message  ------------> |
	   |     (FMC addr, signatures,     |
	   |      boot params)              |
	   |                                |
	   |                                |--- Verify FMC signature
	   |                                |--- Boot FMC
	   |                                |--- FMC loads GSP-RM
	   |                                |
	   |  3. COT response <------------ |
	   |     (success/error)            |
	   |                                |

This reads as if FMC runs on FSP and FMC (running on the FSP) subsequently =
loads
GSP-RM. Maybe it should be fixed by this patch, as it is the exact same mis=
take
this patch addresses.
