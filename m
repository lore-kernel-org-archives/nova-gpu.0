Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7D292B2E;
	Sun,  9 Aug 2026 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786282051; cv=none; b=YMJIKJQNiPC6I1wBjTMS2uEkJJh0L5/mHJteCh5Z3n8OGo6o4FpZeKzd5RCjva32NkdiV2KWM2TrgLSKN1HemDEGbDr8rc2+2W5etSgktIEiIXuRho9I/EIPnI/y/L5DK7OgQfU7lE4CY1+G2KY77jutBY+j9w0I3nHcC2r4dCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786282051; c=relaxed/simple;
	bh=sEFSV12SJCA2zg7qQt7NpDC+5BIlPLAKxIjnGuWslTU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=KV0J/MOG37PCm4Wb70LCUoycBo1Irup4CQgnBFHCjbnFVNZWl8bB81zkkrafrv931loJz7hSmbWf6WTYsPMY/d6kFB+S4EHaGz2opblyfZdAVmCNYgFp7rXjX0l4FubY7en7rM/DhINEf+fYDJlSyUZcIa0mZp9tMHfzZtt+AKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZF/yS/aR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZF/yS/aR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D71E1F000E9;
	Sun,  9 Aug 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786282050;
	bh=VqwANH9E5kj/voUSAmaE/45uw2Oe8Zyh2njFhwNg9ec=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ZF/yS/aR48ZcAxzM4PtT2molmNScL8dNqtVhzhQDER0oHhjS+M1sxs4s6HVnVG2Hw
	 QW1JtHJ/2p0nxlMEmUKWKiUV6e4Lh2n7bkTBLkHpTyt/wiE+0+ph8PA6za9iFxzXGg
	 Cn0cV+Pw3KxeJLL+r6Nrw3X3JnfXnqtxhh7H1GNgK7pMyoug29m1p5/X5ZzXucIZfP
	 pvtoY6T+93aOjf9HCGfbC56pEHLRkK07DjI6qhQzhXTFQn6MXyYl292Zd6E+y7wo0+
	 NFBN1aq9vk0E/1sOVloHGmPP8Xxlw/26KABKWM1Hn7Caw0sI3VelJCJIjfJRYeKdjr
	 gNAPzYDxdcsXQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 15:27:25 +0200
Message-Id: <DKKG4YVPV3HK.8S3VXDIH14Q9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 02/17] rust: pci: expose the whole interrupt vector
 allocation
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-3-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-3-jhubbard@nvidia.com>

On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> +/// An allocation of PCI interrupt vectors for a device.
> +///
> +/// [`Device::alloc_irq_vectors`] allocates the vectors and returns this=
 handle. The vectors are
> +/// numbered `0..count`, and [`Self::vector`] resolves one of those indi=
ces to the Linux IRQ
> +/// number that delivers it.
> +///
> +/// # Invariants
> +///
> +/// `dev` has an allocation of `count` interrupt vectors.
> +#[derive(Clone, Copy)]
> +pub struct IrqAllocation<'a> {
> +    dev: &'a Device<Bound>,
> +    count: NonZero<u32>,
>  }

[...]

> @@ -128,13 +156,13 @@ impl IrqVectorRegistration {
>      /// Allocate and register IRQ vectors for the given PCI device.
>      ///
>      /// Allocates IRQ vectors and registers them with devres for automat=
ic cleanup.
> -    /// Returns a range of valid IRQ vectors.
> +    /// Returns a handle to the allocated IRQ vectors.
>      fn register<'a>(
>          dev: &'a Device<Bound>,
>          min_vecs: u32,
>          max_vecs: u32,
>          irq_types: IrqTypes,
> -    ) -> Result<RangeInclusive<IrqVector<'a>>> {
> +    ) -> Result<IrqAllocation<'a>> {

Please see the second part in [1].

[1] https://lore.kernel.org/all/DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org/
