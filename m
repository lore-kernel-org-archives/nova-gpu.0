Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CB4B4873
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596849; cv=none; b=ONkaKNQbZh7rI1VJ9mIQ5jUhwehxQCCL9fuUXYDg8UCQ9RhZ37CVTxTd+/t3TdBzuzR/+ZQR+sMNLFq8CI+BWjdfLIOlPSpzQyNvvuTCicLYI45RP9rvxbUWjhC+U3DW/a4MIAnISBrl8Oz9SgV2Z7Yy9RRvtGb1xJjxA/iqv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596849; c=relaxed/simple;
	bh=zePnwwaq+pwl1NuzSNorSB/v1txm3z7HVFcgVbolPoU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=YWxRl9hfkVvtQjGpwuXB1yB1IhaCt675FEPONpCWVNCsuMIka5O+hm7JBNBCSMyx3I6j/92Y0BTL860NHwVAklY+IZB1BlExiVrmUZJu8mcfzFwNcR+lj8Qum471GfMbLEtZrezJf0goGnHobO368DMcNQGiiFeJlVyT6OxT1wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUuITdhl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUuITdhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8486C1F000FF;
	Mon, 28 Sep 2026 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596848;
	bh=wQNBXbzxJrFugBqSjapF3Y1Rp5E/yX+U3qLamlmKpMc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ZUuITdhlIyOTk+ZxLPSOoTMypDCEEKAhTUV1VJ4AqoedJhS83RLm7CN+Oy+0YkpSd
	 6c8UTOkIrot6mkURHNtYQ+ujJUy4YdXQKjxf9upDm2kldr/Dqo3PZ8EB7fBw/nXcSv
	 q/r94Re9qmpaL2v/S85c4RRsOReefpi+qWy5qlJaLKtrOEUbDpFcoaTJsxVTafbBMM
	 nPOjOf1zPVSI6zl35OmMBatNkCOMkhp6+sGHrgVHd1ODIruzUIdGkAoMrDwMPf22Y7
	 e6z4ePww0RVPnGqT2D1eMppKcnXEldAd2u3pYb/62UBDu85yxxTgAHiF/baU/MXLZy
	 X7/nv4a8SeAfw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 14:00:45 +0200
Message-Id: <DLQXLV1FYMQS.JBP531K4P4T8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use a single try_pin_init!() block in
 probe()
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260927144417.1280385-1-dakr@kernel.org>
 <DLQX3FCYMAGD.3MS8E1JK5J7D2@garyguo.net>
In-Reply-To: <DLQX3FCYMAGD.3MS8E1JK5J7D2@garyguo.net>

On Mon Sep 28, 2026 at 1:36 PM CEST, Gary Guo wrote:
> I think this doesn't need to use `pin_chain`? You can do
>
>     gpu <- ...,
>
>     _: {
>         #[cfg(...)]
>         gpu.run_self_tests(pdev);
>     }

Unfortunately, this produces the following error.

	error[E0382]: borrow of moved value: `gpu`
	   --> drivers/gpu/nova-core/driver.rs:140:62
	    |
	119 |             gpu <- Gpu::new(
	    |             --- move occurs because `gpu` has type `core::pin::Pin<&=
mut gpu::Gpu<'_>>`, which does not implement the `Copy` trait
	...
	129 |                 gpu.run_selftests(pdev);
	    |                 --- value moved here
	...
	140 |                     Pin::new_unchecked(&*core::ptr::from_ref(gpu.as_=
ref().get_ref()))
	    |                                                              ^^^ val=
ue borrowed here after move
=09
	error: aborting due to 1 previous error
