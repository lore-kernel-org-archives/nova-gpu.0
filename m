Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076430C17C;
	Sat, 25 Jul 2026 00:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784939262; cv=none; b=eAj8scZVDfmaCEJopt+Np59iUhXL4mx56CPQQMg4tafCSQZJNTQcwFOjHXAfXCv/VledwHfEBepbjDarZYIsHl9MS1H9C0BuSHV46Uu7Q1ftax6Pg2Dllg/Le79t84PZGpcgMc6zmbggvDwDksYtM57GwteyudRlvEtokNF3NIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784939262; c=relaxed/simple;
	bh=x58oxA3VeQVlOdDSR3PBBBlT0/UZLNRhOBoFeqVL94w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mP1RJQd4fOkvmEp+0shz065LNWLRgnELr2a8uMTf/XjSeU659evLFekz3DUPHs8wjqCoOT79dRpB0wFn924PcZ7Fca2dhm+rZYuq+cSBJyiY2mZwT8S1GxgFBBnXmPfHoQtpvax6cEN7zzAX3WH7pXfuxEpHpIEfyp7qdtgew/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+hxp7hD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+hxp7hD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCDA1F000E9;
	Sat, 25 Jul 2026 00:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784939259;
	bh=x58oxA3VeQVlOdDSR3PBBBlT0/UZLNRhOBoFeqVL94w=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Z+hxp7hD1HwXsVsTUiIJLQK8+VJXKQRdFydE1veSHuCGYBt2KQbCFOuXU+rpc4Xtt
	 6M3Nvw0QYXcq2+l5cFJGeAbqQFPEKtkGkDQ0YyiG4WBjmuj4DxARR9YpnrVkFd+QsD
	 zQbg9N6vMpeCAv0rFnR+tOyglKE1+kFbq9HMMC1wUJ+LDoi7TGsu5nrGwlMDLrRFb8
	 2fNxXJqFiug+5074iGlQ3LyLnRJKq2VQMLKV0A993sZFyShr73R4zcjLkEFVehPwyF
	 d8tFwxkIA5pN5ZZF818JxSYYGx5+aRk39W+kgFLnaPGrCguNgO1WBaL/xDglucqFfA
	 v1CE90wif1INQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 00:27:35 +0200
Message-Id: <DK75LUA4NLGI.3P29AIZQE20V2@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: falcon: use I/O projection to check
 transfer bounds
References: <20260724-falcon-dma-projections-v1-0-957028a7c0a7@nvidia.com>
 <20260724-falcon-dma-projections-v1-2-957028a7c0a7@nvidia.com>
 <e7ba2c90-6d4f-487e-bd25-56d568ba1f26@nvidia.com>
In-Reply-To: <e7ba2c90-6d4f-487e-bd25-56d568ba1f26@nvidia.com>

On Fri Jul 24, 2026 at 8:10 PM CEST, John Hubbard wrote:
> Sort of "conceptually pre-existing" problem, but "handle" doesn't
> quite work as a name, because handles are supposed to be opaque
> items that one just uses to find and refer to things.

This is inherited from the C API where from its perspective the returned ba=
se
DMA address of the allocation actually serves as a handle.

In Rust the actual handle is represented by different types with different
invariants and hence capabilties.

(For instance, dma::CoherentBox does not expose the DMA address at all, and
hence provides access to its contents through a direct mutable reference,
whereas dma::CoherentHandle only provides access to the DMA address and doe=
s not
have a CPU virtual mapping; dma::Coherent provides access to both.)

Both dma::Coherent and dma::CoherentHandle have a dma_handle() method which
provides access to the DMA address; this naming was taken over from the C A=
PI.

Given that the base DMA address serving as a handle from the perspective of=
 the
C API is just an implementation detail, we should probably just rename this
method to dma_address().
