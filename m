Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509E32ED40;
	Mon, 17 Aug 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969001; cv=none; b=pzMske3U6dRSYi4iUNm5AddiSHIXMVX7Dw1qbcSoy2tJukfeOckaWvot66MDTm9GvsFylpluLi2erfbCdvjm9Xa/JRt7i49fpjdhnZZK1iyR+6ziKqPxZXaWiWkKhQ863jzmNg4Fo9B2QzMTdXQEfc1eBQQHbvHsWG4IP7fXdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969001; c=relaxed/simple;
	bh=YsFezqXngYw0ipBV8w0+hVr74IpQ/Tubdp71JF7fU+4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=i85q8/v0rJNDCcsIkEIePcHIusMg40rqejX591CkIfojpt7GfGAnIWwIpA3+ZPDaBmr+VhVjeE5fejICVJHhggDURJFeNbGWIfUPRS7sQJViY4zU9fnNfW7RSM9tAM6BfYpC+WuaK1kIav44U9bHLGLo3Idbnl2zu3wsaFuRvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnR8+8TT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnR8+8TT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0514C1F000E9;
	Mon, 17 Aug 2026 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969000;
	bh=YsFezqXngYw0ipBV8w0+hVr74IpQ/Tubdp71JF7fU+4=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=JnR8+8TT8uZAWGwezJSIUHQXW4d7xO4f5D5yisaphhSfbjr/4KkG7Nlnk2148OEXE
	 WVA29rCZXOrWRiT2jRtnBTAqqpBXfmTYvNbcObGZFP2SFPoFDM1wAHAAPYV+4sg7wp
	 fsZk/p3vrfJAnQTgNIt6Uk1D3AHH0tHJQsgbhm+jS51edmjUVju8QPHwdk8a05/s1r
	 GyIj2O2ODldEBlGAFvPGHc5t/mJ6oeESONEpop/27+JuZJTCcxOMdWitqHQs4H4ajB
	 5B2EBj2UfimDYqETjkl/BTxWjeycwpCIf00ihNFnUzQnJjan6p/s4n4GiIXoVmwVJN
	 acrLFrncRw18w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 14:16:33 +0200
Message-Id: <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Yury Norov" <ynorov@nvidia.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Yury
 Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com>
 <20260812-chid-v5-5-6c767770b3f4@nvidia.com> <anzxKO0X1OrNRD32@yury>
 <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com> <an4NvQBt3389jP6E@yury>
 <DKO414SNC0B2.248FUBGJGSPLU@kernel.org> <an4xDp29VX8Am0uR@yury>
 <DKOAY7J1IFTP.DMKSXK625EW5@nvidia.com>
 <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net>
 <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com>
In-Reply-To: <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com>

On Mon Aug 17, 2026 at 1:49 PM CEST, Eliot Courtney wrote:
> On Mon Aug 17, 2026 at 8:18 PM JST, Danilo Krummrich wrote:
>> On Mon Aug 17, 2026 at 12:54 PM CEST, Gary Guo wrote:
>>> IMO we can just support zero-sized allocation by always succeeding, sim=
ilar to
>>> how ZST allocation is handled in memory allocation.
>>
>> Probably, but in contrast to ZST allocations it wouldn't be very useful,=
 so we'd
>> silently succeed on something that never was a reasonable argument in th=
e first
>> palce.
>
> Yeah I agree that supporting a generalised zero sized alloc is in some
> ways conceptually nicer, but I also can't see any good reason why you
> would want to do it, it sounds like a bug. That's also why in the latest
> version I made IdPool also not allow a zero capacity [1] (incidentally
> required to not have to change the grow code to avoid trying to double a
> zero capacity thing every time).

(I assume this is more a reply to Gary?)

> Tbh, I feel that NonZero (and Alignment) is hard to use currently
> because of these ergonomics issues. But I reckon they're useful, so I
> like the idea of trying to making them easier to use. Maybe you can make
> an argument to not use NonZero here, but what about all the other times
> we will want to use it?

Personally, I don't see the argument for not using NonZero (or Alignment); =
the
invariants required by the API are expressed very well by those types.

I also don't see a reason to step back from using those types for this API.=
 If
we'd do so it would question all the other new types we have over primitive=
s
carrying certain invariants to a certain extend as well.

I understand the ergonomics concern, and I also see that for compile time
evaluation turbofish syntax is not that popular, but this can be improved.

The fundamental value remains that it nicely separates the invariants calle=
rs
need to uphold about certain arguments from the API itself. It makes the co=
de
more maintainable (e.g. we don't need 10 different variants of a function
depending on whether the value is a compile time, build time or run time va=
lue)
and it makes the code more readable and robust (e.g. the semantic meaning o=
f
arguments is very obvious and confusing arguments becomes almost impossible=
).
