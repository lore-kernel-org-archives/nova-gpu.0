Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF323BCF7;
	Sat, 25 Jul 2026 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991319; cv=none; b=CWOUaPMKDRa+6vaNVXE3R0mehDIsDsqyAYREHV1JTJNxueXFLPqXumvcirX+khZgG8OLBWUw7w9REgHgs1YjvSlfWrYDC7zdHcOODc8hLLLfUtp+hJJcsRHQHZmYOr1EoERiHShcyW9xsJHrcSjAmj6YEKTZVAneAumIVKSND00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991319; c=relaxed/simple;
	bh=R6kF/9pHHFoGHWbdpYq6oQRMo0UPm2TQ1j5ie9fDIuw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GIeX9m8dy8gd21LPvEtJOfRv9pg3WUyTZISjDwByNHc/34POAEYbggwFkQIeK1Kpd0xCIPtIQHUBRdDAthKabrQ3ydW7t5Xgh+C35QCMy1lXVk9wWwjz8JdUHJ5bJZsU4Tl6mPMrLUVYd1R//80a8BmspO5/cjt5Rxtu8lmLQ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekzlWlIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekzlWlIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768E71F000E9;
	Sat, 25 Jul 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784991317;
	bh=R6kF/9pHHFoGHWbdpYq6oQRMo0UPm2TQ1j5ie9fDIuw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ekzlWlIXBIJZW+0J2SypDW/dRhdM/VIqrfh/0AqqJUNEs1D98vXIpy9CJO/IWzS66
	 ARPYt/WkPdqiv2M4yUcNdoeTF+UObhmz5veR8EQu390D5PgP0XwCgK6Uh5hMQW1mRy
	 OfkDgm6JEXl44q4Q8Tl/me0oZR/kuwh7RMJEol4Od161WQeT7y5MdQJSX3ld691bbp
	 nfPZviZ4O8ApqMjhL/xIOHftE2cbMR1wGHr5P0gCgi+TcGZAThprJiKx6pltj5kyvY
	 /4g1jaD/Tb4JuqQy4rBth7zoIi5HO/xBxLucsR/R40Myboh6pEfjDo59UN34WGejAq
	 jNZ0pKcjozXhQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 16:55:13 +0200
Message-Id: <DK7QM16RJ2UX.U6YCRAT2HTV8@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: falcon: use I/O projection to check
 transfer bounds
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260724-falcon-dma-projections-v1-0-957028a7c0a7@nvidia.com>
 <20260724-falcon-dma-projections-v1-2-957028a7c0a7@nvidia.com>
 <e7ba2c90-6d4f-487e-bd25-56d568ba1f26@nvidia.com>
 <DK75LUA4NLGI.3P29AIZQE20V2@kernel.org>
 <DK7DKIDW14CO.1PJO3G4OGD4LN@nvidia.com>
In-Reply-To: <DK7DKIDW14CO.1PJO3G4OGD4LN@nvidia.com>

On Sat Jul 25, 2026 at 6:42 AM CEST, Alexandre Courbot wrote:
> On Sat Jul 25, 2026 at 7:27 AM JST, Danilo Krummrich wrote:
>> On Fri Jul 24, 2026 at 8:10 PM CEST, John Hubbard wrote:
>>> Sort of "conceptually pre-existing" problem, but "handle" doesn't
>>> quite work as a name, because handles are supposed to be opaque
>>> items that one just uses to find and refer to things.
>>
>> This is inherited from the C API where from its perspective the returned=
 base
>> DMA address of the allocation actually serves as a handle.
>>
>> In Rust the actual handle is represented by different types with differe=
nt
>> invariants and hence capabilties.
>>
>> (For instance, dma::CoherentBox does not expose the DMA address at all, =
and
>> hence provides access to its contents through a direct mutable reference=
,
>> whereas dma::CoherentHandle only provides access to the DMA address and =
does not
>> have a CPU virtual mapping; dma::Coherent provides access to both.)
>>
>> Both dma::Coherent and dma::CoherentHandle have a dma_handle() method wh=
ich
>> provides access to the DMA address; this naming was taken over from the =
C API.
>>
>> Given that the base DMA address serving as a handle from the perspective=
 of the
>> C API is just an implementation detail, we should probably just rename t=
his
>> method to dma_address().
>
> I was also thinking about using `dma_address`, so let's do that!
>
> I guess the pieces required to support a proper DMA range type are also
> starting to fall together.

Yeah, I proposed a dma::Range type a couple of times, but never actually fi=
led
an issue for it. I now added one in [1]; it should also cover getting rid o=
f
dma_handle(), as it would be dma_range() instead. The corresponding address=
 can
be derived from the Range instead.

[1] https://github.com/Rust-for-Linux/linux/issues/1248
