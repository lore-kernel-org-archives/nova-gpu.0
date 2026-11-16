Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833245;
	b=s63GKCf0mw2mkG+6ou2sP3/xpa4thgOcmDkTr9ZFg9LqZMbHlJgAdahubKcrXd7B2qvM
	 JoOc+8FrzxwfUllF4lWIzV33h/jfGWE7N1hYrX5P0kEUy9qUsIRpG9KgWKrnimPyEDuuW
	 JSSRNwEZIUiyjre1pgEo+cnOkCmHbWknzbGUcQxx7cRglUxn3+vAdDYD0K+F0FH8Pu8mY
	 T7Wkqo4OcDd4I+gOjAyeatWivR+sb7LVGGtKP5XEVKWHtj19KEmVvCr0FMKRop3kd3vyd
	 7uN5gDDTtjcPvP70VFOsBhqA6falYCMAEra04VBqx3sVUm0seg4EBhMT4TxeMsgTz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833245;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=+cDv/pKHxcNHjklS71gl29DbGDdZdz6UNn0YpVLmt14=;
	b=mIzA785b1g+3ZZIOJ99KvM1vtiiNuBkjN49vljrk60/O0AxUOiJnaPtjdOmyAU80c/R5
	 9bLSk3YF9e+30EO6loVwBXGWkNwWdBBD5r/0o+2BKJ9in+pR1Dd/tHk5c4pogsIq1sXRP
	 M6LBwuZEgBGxcrmxxcz6S2sCS6ijxolmiuj2m4jagm3S8fSFmg/2uJ5WrRGdPZXaBisGj
	 BmLMrh0SghtUmodzTdTnd4wIHYWsjjnWpEtOuS/YWEgPI6rhDXcvfkyFapKS9aMki7xCZ
	 TbAGsQfFgLWEH1texrF4hm7aL9Fi2PLVfNNpXuaX20LloDGUqibkLGWdAq1BTaYD+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kF82zkG/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF2606A337;
	Mon, 16 Nov 2026 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kF82zkG/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD70B1F000C4;
	Mon, 16 Nov 2026 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833244;
	bh=+cDv/pKHxcNHjklS71gl29DbGDdZdz6UNn0YpVLmt14=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=kF82zkG/Q/t6koMQVrwlYIC5NMCiFTq/yo3Q2orsUqZqqnFdC8NCyUPVeEhno4jHs
	 WfN3itAslWHNeQPNitouyQGmyQqVIyn/3c/JMCeGcw1z2+Ho+5kDQYv+ruGIZL4wag
	 mi6PG+tiTshNN87hswDC1TzoySq3IstjUIStzEtMUKZjqXP9YZxJZe1exgsewu1mMG
	 CfmwQplqcAIgvprEkT2ySgfn67Lg8X1JadvA1Sb/m5Z12IcNBBQlHIBJFW8yftH816
	 r8jWdcJpaMFo6U/nDPariIqPJooPUk6awzToz7m74bDio8J4HzsfE6mOXX1BLdytY3
	 3/CSn6Sq2DalQ==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 13:47:21 +0100
Message-Id: <DMWNA84XI432.TJG95PPPMGPR@kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: use pin-init self-referential
 support
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lossin@kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261111161935.750047-1-dakr@kernel.org>
 <20261111161935.750047-2-dakr@kernel.org>
 <DMWH39UWW4KZ.1C5B2M4W1V3CF@nvidia.com>
 <DMWM4KAYL7PT.2ECY3BSNIA2P@garyguo.net>
In-Reply-To: <DMWM4KAYL7PT.2ECY3BSNIA2P@garyguo.net>

On Mon Nov 16, 2026 at 12:52 PM CET, Gary Guo wrote:
> On Mon Nov 16, 2026 at 7:56 AM GMT, Alexandre Courbot wrote:
>> On Thu Nov 12, 2026 at 1:19 AM JST, Danilo Krummrich wrote:
>> <...>
>>>  drivers/gpu/nova-core/gsp/cmdq.rs     | 16 ++++++--
>>>  drivers/gpu/nova-core/gsp/cmdq/gmc.rs |  9 +++--
>>>  drivers/gpu/nova-core/gsp/cmdq/rpc.rs | 11 +++---
>>
>> The changes to these files look like they are a change on their own;
>> they are not using the self-referential support but rather change how
>> the queue lock is acquired. It should probably be a separate patch
>> before the rest (which would be the last patch of the series).
>
> This is actually integral due to variances, as the existing code more or =
less
> relies on cmdq being covariant unsafely. Pin-init is going to enforce tha=
t so it
> needs to be updated to use existential lifetime to make cmdq actually cov=
ariant.

Yes, those changes are related to the use of self-referential pin-init. We =
could
technically introduce the with_inner_locked() helper separately, but that s=
eems
excessive and creates unnecessary churn.
