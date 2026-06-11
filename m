Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7089363C61
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205515; cv=none; b=R2wVDb3SqQpvnfdeN5qL6WAMnFDJWzXWlUBt/wYhzypyHUNKi+jCF2J1NcDB2FQiPQr8Rpt10mYN1ZeWUpREY/AHhQ6Rljr2uoWyvYatmtmQPaxcCOhu9m1DJsqIxqzPfaSWLjM6NFK+bL3S0EnLYuGAoS+R9tZTzmsHlGx48YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205515; c=relaxed/simple;
	bh=npXZeVbmiBreUjjuRsKqhKTJ528kQ5CHScu1IpIrYSc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=iaYgxpqbdOyb4lgHvooDGLU4Hs1xqCwYmXQh6Y0WnSpjCzpy7tR1JupNCCDBVNdE5v5ZrgWv6rKlECZGbpu5+CYIe6rOaRuF82Llfiw3RPNmlMM/Q6lq3tX+0uImqCFRsC8fjIeQtRpEYsoC9fJYhIz5cvz8cr7vLO9VtdjTNYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtWtrd/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtWtrd/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066851F000E9;
	Thu, 11 Jun 2026 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781205514;
	bh=Lx7YYJRZNUm5YNRfrWEdGrA1628/HV17tHDh2Cne5SY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=DtWtrd/dJc8J87DKeymPSsAvT0PM5VINq/hvN7+G3EP3JAc87z7FmPfwqZUwoXq3t
	 ZJ0b39N+uQvQzWB8VFG47Lot3YnbM3l7wTnEPC18GZBlVzxP0YpWEsEDIrGZTiwJlO
	 3al0kTSTaaDOom5Ie7ls5JSqjh/8dlee9ptsg8xMiSE0DmQd7esU0uO8kObzraWj7r
	 /MFY+D9Y7BtpFsl+gGieEe5RI4dARg9jrcR79CWWfXvVMB2+N3nA88TFKOdD63kX4q
	 RU8X6nKNUmE3+/4BgdKuQkee8CnvhGK9qmu7gn9claV2JraR1nbyZ1YpuGdJuYRlrj
	 lizdYbtDRiBKw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 21:18:31 +0200
Message-Id: <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
In-Reply-To: <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>

On Thu Jun 11, 2026 at 6:32 PM CEST, Timur Tabi wrote:
> On Thu, 2026-06-11 at 15:49 +0900, Alexandre Courbot wrote:
>> > +/// the caller could mutate `buf` while reads via `data()` are outsta=
nding (and
>> > +/// `release_firmware()` does not free `buf` anyway). Releasing the b=
ookkeeping here and
>> > +/// returning only the size leaves `buf` as the single owner and acce=
ssor of the data.
>> > +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) ->=
 Result<usize> {
>>=20
>> By adding a lifetime parameter you can return a `Result<&'a mut [u8]>`.
>> This is more sound as the caller cannot use the unwritten part of `buf`.
>> It is also more convenient as there is now no need to create a sub-slice
>> manually.
>
> Sorry, I don't understand.  The caller allocates the buffer any way it wa=
nts and passes the
> slice.  This function is basically a gloried memcpy, it doesn't care abou=
t lifetimes.  Why would
> I want to add one?  It even releases the `firmware` object before it exit=
s, so there's no
> kernel-allocated data to retain, which is why it's not part of the Firmwa=
re struct.

It allows you to return a &'a mut [u8], where this is a sub-slice that is
already "trimmed" to the length of the actual firmware image loaded. This w=
ay
callers do not need to bother creating a sub-slice themselves.

The lifetime is required to tell the compiler which argument to infer the o=
utput
lifetime from.

	 fn request_into_buf<'a>(name: &CStr, dev: &Device, buf: &'a mut [u8]) -> =
Result<&'a mut [u8]>

This tells the compiler that the returned sub-slice must not outlive buf. N=
ote
that the compiler does only look at the signature, not the function body.


>> "the caller cannot use the unwritten part of `buf`"
>
> Sure it can.  It allocated the buffer, and passed a slice of the whole bu=
ffer or just a portion.
> After the function returns, the caller can do whatever it wants with the =
buffer, since it owns
> it outright.

True, but there is no reason for the caller to create the sub-slice on its =
own
anymore, i.e. the correct usage becomes the "path of least resistance".
