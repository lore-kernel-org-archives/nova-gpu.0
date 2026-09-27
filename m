Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4A93BE17D;
	Sun, 27 Sep 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511907; cv=none; b=EcEpBrMQMPc77N+q1DmYameCTQqSxEBAeOrlF3QZ1St4IuHIwLV3kFG6iztuqgaawAIVt55cWQzmDFK0EkXHovD0G0CfcGOcS/2/lE/eZbykT0+LYXRkPUFpFZ88OAsN9mK+i+rboBKXZYIKj8Bv+CCRJeH3btdZRCqruh8bSsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511907; c=relaxed/simple;
	bh=kKFsmDtE7IWmUq7SNnTfR0mTvUaq6kPbmgcf0aPvZ8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=c5kYp3djcYERZpmsPXNI9Ng08tQEdMLMgODyTSvHc6FeGhc2DoAerQq2VJAa02+MBoatjfpSOLB7n0RaOmqBAJkLd7GQXofXdYxBL75SB0Yq3mfLGGeLZyxT4OMXc3RVOk1OsumWnUnNzOgimkNYn/nwj0+XW2vYCtAT8tBivsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG1WIzN4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG1WIzN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECD21F000FF;
	Sun, 27 Sep 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790511905;
	bh=P+NipuqQkuCS9MH+5kBtkFCHseN5UDLBNuO8qD87n6k=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CG1WIzN4huTUPod30NAXzBZn1rf+q72ZPod8MC+wGKVFx0mRCkF2HxW5ed89z6G8w
	 NLoIqwT15WzWhH3dDuZ1r1PiMq9SFC/lfXqShjySKKqhBcGFOEHiECXTQN9gDV8B7d
	 Ju/gWjjsKBDB43tuL1xGsnKTcc+K1pNyxEpcmBxhfxysxxZrmSmRJs/elJZepgww/B
	 hN+SzVZEfzUh5Sdma9smqRCxocAFsu9wV0df/W6AEwjhOF07B0RHgoS56Ho9cRk6bv
	 LW/fijZAHYsOOS9uHbyZ9Eip6fM/KnBRBbL77uKMrKN2xIo8OlT4xi3Abmr+SdA7FC
	 am0qLOGO0AaFg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 14:25:01 +0200
Message-Id: <DLQ3HW61LAW1.FLV9E4Z9B5S@kernel.org>
Subject: Re: [PATCH v6 00/13] gpu: nova: Export parameters from nova-core to
 nova-drm
Cc: <rust-for-linux@vger.kernel.org>, "nova-gpu" <nova-gpu@lists.linux.dev>,
 "M Henning" <mhenning@darkrefraction.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260909064506.910162-1-apopple@nvidia.com>
 <20260927121736.1186364-1-dakr@kernel.org>
In-Reply-To: <20260927121736.1186364-1-dakr@kernel.org>

On Sun Sep 27, 2026 at 2:17 PM CEST, Danilo Krummrich wrote:
> On Wed,  9 Sep 2026 16:44:53 +1000, Alistair Popple wrote:
>> [PATCH v6 00/13] gpu: nova: Export parameters from nova-core to nova-drm
>
> Applied, thanks!
>
>   Branch: drm-rust-next
>   Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git
>
> [1/13] rust: auxiliary: let registration_data_with() closures return cova=
riant sub-fields
>       commit: 4075acc9d489
> [2/13] gpu: nova-core: Add public driver API to nova-core
>       commit: 6e70b1719991
>
>       [ Rebase and use pin_chain() for Gpu::run_selftests(). - Danilo ]
>
> [3/13] drm: nova: Add DRM registration data
>       commit: ecedc604e0aa
> [4/13] drm: nova: Add GPU architecture enum to nova-drm UAPI
>       commit: 342aaa7bb3cc
> [5/13] drm: nova: Add chipid enum to nova-drm UAPI
>       commit: a1678ed1f8a3
> [6/13] rust: uaccess: add UserSliceWriter::write_truncated()
>       commit: b40f5ed85c5f
>
>       [ Inline write_slice_partial() and use it to simplify write_truncat=
ed().
>         - Danilo ]
>
> [7/13] drm: nova: Add an info ioctl
>       commit: ce6e59897ba5
>
>       [ Avoid 'as' casts (add From<Chipset> for u32, From<Architecture> f=
or
>         u32 and use IntoSafeCast, IntoSafeCastArch); improve / simplify a=
 few
>         comments. - Danilo ]
>
> [8/13] drm: nova: Add usable VRAM size to GPU info
>       commit: d9886a1a06cd
> [9/13] drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter
>       commit: 7edc491f6fca
> [10/13] drm: nova: Expose a render node
>       commit: 843bb3ccde8e
> [11/13] drm: nova: Report GPU name in GPU info
>       commit: 391cc215d22c
>
>       [ Use ..pin_init::zeroed() instead of ..default::Default(). - Danil=
o ]
>
> [12/13] drm: nova: Report GPU short name in GPU info
>       commit: e6d9c5b08c23
> [13/13] drm: nova: Report GPU GID in GPU info
>       commit: 10a6623a24a8
>
> The patches will appear in the next linux-next integration (typically wit=
hin 24
> hours on weekdays).
>
> The patches are queued up for the upcoming merge window for the next majo=
r
> kernel release.

Alistair, I've also updated and merged your drm-test changes. I've also add=
ed a
patch for a Chipset type with strum [1] (it would be nice to have something
similar in the kernel as well).

[1] https://docs.rs/strum/latest/strum/
