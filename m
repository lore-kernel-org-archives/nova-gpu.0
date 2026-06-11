Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10030155A5D
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214560; cv=none; b=BLo0s7geWjoLu9K0wEzCh50kumN9EJtmsr2Ts9qTcIwzV4afYVBETfwBdKySd+PF58ONceTtbG1nO/08NYAr7LJbcvWsikqK/BPeryhcZjKqxKm8whbii4MDjZLTJ4aLUxTaBZiHkbrz0b539rE+3LIjEYObTKEEJqVgUi3Fh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214560; c=relaxed/simple;
	bh=Ssa7yqrgn91VRrCpQaUZra8j+b1/9F9+gSpeaDTuypc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NewqeW/Gf9pvvoAKJIEtnWcy06rcmGv1rpYXyWnzsM6bSw86jqyN0JNCANcTYN5ey2oDr/h01QLwIbPs4GapLlZSCMV5Gr0yhAxrMx8CytrG15PBNzfVJxd9+gkZAxg5UgcWi8HZqrvUa96XzcGo+8VW70oaRlfx32QyIYRF9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfqZO7XE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfqZO7XE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5C71F00A3A;
	Thu, 11 Jun 2026 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781214559;
	bh=dDXUZXWqih+PeF21dQH4raXTJWLOUHtvw4390D7Pw7Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PfqZO7XE3jjOCGlCa3PhzBfUz3UGvvA48h+ZkyatRPLL8LAjUI+EMI5VAGUIEv2iQ
	 NPrxZuF+WExT3wb2HXJUegKqkQuWaGFD9hJgcU+sufDrHNs82uNLJ21J+YLBqqnbnF
	 aHWdX/5BDAspFDP36cBJSkQLdhtm0C8A01EHnDjtzWJotDxqsRAeW7i3PTG9e/eooV
	 nYW7Pj6Ux4hIr9AZxDYfiYsBZ3sFP2Jyzvg3NECzGCyJMiiHXkNt1ovrwrxG/bCgqM
	 A23nrqchbRTTrkzHQbyd8k8+Yk9+DQDx+MUpAP5SdKzE/Oz23HGC1uZs4X2c5rZwyb
	 vvqLDAYL4B88Q==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 23:49:16 +0200
Message-Id: <DJ6JV2QQY0QD.1ZK1PRRBN5BRP@kernel.org>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
In-Reply-To: <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>

On Thu Jun 11, 2026 at 9:28 PM CEST, Timur Tabi wrote:
> Is having the caller create the subslice on its own such a big deal?  Giv=
en
> the returned `size`, the caller already has all the info it needs.  Most
> likely, the caller will want to verify `size` and still use the original
> buffer.

My answer was more about addressing your questions regarding why the approa=
ch
would need a lifetime and why it is the better option if you want to do
something with the data before passing it along, and less about expressing =
an
opinion.

That said, the whole point of the API is that the caller already knows the =
size
in advance, which is the premise of being able to provide the pre-allocated
buffer in the first place.

For validation the size alone doesn't seem to be overly useful as it is jus=
t an
indicator. Either the hardware can report a corrupted image, or you probabl=
y
want to do an integrity check in the driver.

Hence, I think this should either return just Result (as nothing else is ne=
eded
for now) or a sub-slice. Either is fine with me.
