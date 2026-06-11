Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99F37B402
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 21:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215021; cv=none; b=uqwpG7TQtWt0RMHCfPc55EEOOo0Y51s1XettRkmnI0yNlBVjNyZaLD7KVaJpxQqoTlm/bQum6q/vYcEAX7sXTxEPZ3+P/VAbq6naV7R1/AXDdHDWGnqDmgSuqowlYb91+SPTHih3urbVXvh4TPkljhPyZGF0Vq1InrwtVEOzhLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215021; c=relaxed/simple;
	bh=gKz81SuLd9PIMXomMoxs0YH0Apu/uhewrcEjgATQ0Ao=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=danZgcb9ZTzvOsrtj4diac4f7MUiUMi1L0weG/35L+GM/Bc9hlySnojEhMl4nihrRb65zzKSLXigtKwJqhNIBcS9zUSNP/v6I9R1t0TTbPfC9mPseNXn/YfKqsTeYCSPXdqSwlVJMFhuzfxQefHhzGXSOYXVFDTC4QA8ecGfaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwG6Syfr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwG6Syfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198331F000E9;
	Thu, 11 Jun 2026 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781215020;
	bh=gKz81SuLd9PIMXomMoxs0YH0Apu/uhewrcEjgATQ0Ao=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=IwG6SyfrdQY+UrvcYpK3VNAM0YWIGwg6OVVJsOfWSqoYaS3yInAca5d9R97b6g2H7
	 fPUgx0rJhzy5etaUs5bhiBx2YdAueRXv9GUlmx7rpNU880QzNEdznL3YfeNXzSQTPO
	 hLxY8mg+Uqj4SoXMS5taDmGlGhmIelFHi/SCYeTOzuUcDnRfgKATL2L+fBt21DpQT1
	 yzBn0KK7lUNIBqvMlnpDBlYLTrvOiy6Z032jeJ8ygSL6i0zwhlJqOxd/MxVKZe075y
	 WNeG5t5uuWZb/heQ06c/BZfv6ppwgpwfGqjHyGm/+XGX4N93/x1loEbA4slWim6FJD
	 aI9KclNkpm1gg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 23:56:57 +0200
Message-Id: <DJ6K0YNPYAFD.E8WTCUI3K9BL@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Cc: "John Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
 <fb77efd6-1a38-4f81-a493-02268be6bb38@nvidia.com>
 <e61af16615724d751ef6e2d176c057797d2c7530.camel@nvidia.com>
In-Reply-To: <e61af16615724d751ef6e2d176c057797d2c7530.camel@nvidia.com>

On Thu Jun 11, 2026 at 10:01 PM CEST, Timur Tabi wrote:
> The code will ignore the returned slice:

And currently it does ignore the returned usize. :) Please see [1].

[1] https://lore.kernel.org/nova-gpu/DJ6JV2QQY0QD.1ZK1PRRBN5BRP@kernel.org/=
.
