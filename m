Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005525;
	b=kSB7gWIZ48sLPZi1hkcV0qOiNAcs6uRgdms+Nn3CAfURPT1rHQi2vOQPc3DEJdU3thEQ
	 WzWU+0ki1WS7ZUlXQLp0HhrMReW+xCGuhDy+YGLuaJinLk/2D9ZvfJYkbVMprCQ7Hifo1
	 +gKjKQlCe7o+iyIPBVb0labS31Z0EprR89qEs15r0knIGmElX1TeddXTyr7GaxeRmkLvs
	 pwXxO6IjXEUaE3KHY+JgIcXtTU/nkdEXCQQThLr71x1hMsJnmYKzEfoo2qP/YNQBS3EAU
	 +Px/3u2dnHt5Ub/cydZ4I4yfimEsq+tBMR0O2dqulk7rUg4iC1TUrhmzmJAO8cSlseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005525;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=NRJtjZhe6COOthmpVzgm2wGUmf0pbmHHsfeoCtwibtE=;
	b=voQ0Un9SqUK/Lv4m4m7NHYUTjxp/cuf/7w+Eek66leb01+2TzJGFLwHYQz96rtup6blK
	 h3dOUGWIwc3Gn9BkOKVRsO81HKL3diJGAhdOhmrAiVK9KGP0rOqaodUzXB2I8Gba0tCw1
	 AULNpJinozmBHRgjwz4jZUHewJ2yRjP+oYIJOaWclbBx9CBPHoXiFIdtdQjU+wuQlXEgb
	 BqZeIwZUT+1/b72mUylptKmUeufdurqqG+TdziSbE1yG+hKRvdRpZrY93O8dAZIKn872L
	 y1IWASIpWP7bxE8LgxHlQ4NpjiR/DZAV1peDfeSVGHEOINddvehU1uCxloIHQV5kOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OARTMpnc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D296E606A326;
	Fri,  6 Nov 2026 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OARTMpnc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F911F0089F;
	Fri,  6 Nov 2026 22:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794005524;
	bh=NRJtjZhe6COOthmpVzgm2wGUmf0pbmHHsfeoCtwibtE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OARTMpncVGspn07uAf6Gv2Y//iYfaIfYprs8MVU8i/iVhNtD8XxKYi7fw/4Lnzb8c
	 HJQocSQRjO5nwuNe6TyglHGIVtRsJ21gaW8eFnibkO9YIdkkbjIdej00Lp8/SttgI/
	 MzL6GmV4SvOyobYM6Z7f+nYRrJyPoLf8mw8mpMgayKyBIeTtL1XzL5+CNc93SjMcKp
	 nc2Pjelr5ptyQkSb6Z6MW5BJLaZ331jqfhstaWIe3fc3l2SuMHzx7lqQXVsqHPkswB
	 RyYWTZ/WuygD20z4+OsJDLuZCflVqDFCcT/ady9kYxuyzYpc2xyXQb5tpa9bYajqwp
	 BDt4fRZlSNROA==
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
Date: Fri, 06 Nov 2026 23:52:01 +0100
Message-Id: <DMOHVQREU4JM.1A6IV5O5VMXKZ@kernel.org>
Subject: Re: [PATCH v6 0/3] gpu: nova-core: retain the GSP-RM log buffers
Cc: "vladazaharova2018@gmail.com" <vladazaharova2018@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
 <b2ff5c437c41ba4f8c1a8f354d24d7e68517fbf3.camel@nvidia.com>
In-Reply-To: <b2ff5c437c41ba4f8c1a8f354d24d7e68517fbf3.camel@nvidia.com>

On Fri Nov 6, 2026 at 9:51 PM CET, Timur Tabi wrote:
> This tree is the future of rust-drm-next, and there have been some signif=
icant changes to
> debugfs that result in a lot of merge conflicts.

I know what you mean, but just to avoid confusion for people new to the
community: It's not exactly the future of drm-rust-next, but work that is
targeting to land in drm-rust-next in the future.

As for this patch series, it sits on my list of patches to deal with (for
probably too long). It also has been on the list for a couple of month now =
and I
don't think it should be delayed further, so I'll pick this up after some s=
moke
testing.

Thanks,
Danilo
