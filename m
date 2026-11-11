Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395703;
	b=5VO3ORJ/r62lZ0Kr/kykQnpM4ZZFK7v/ofQmBiQjRcep/0+kf2vaPVn9NNgVXgiLKZJK
	 hVu4dovbFesORAB1Z9m3xZgP7j8KDLz2A48LwbsjxzBzbj1MVYeCD3NPBaRcx3A5xItBU
	 sKA/zbo6qkbRxSEqSNXL83eFjBJpmuNj9hAvvG4BNC7S1UBpAv8gQksez1HPWTmKFy/cP
	 w3+WJaWh5WrKnEMaV6S0VCFtFkTkItGxjgdiy0bQgxiQXGneKvc1A2WbNT540SJYtcTIX
	 roudfn+Qi9mymkjSyFD7Uz2FuXd1xiQqpSVbvv9tjmGX7WK9I1kvnd/GwX/arkkPKhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395703;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To;
	bh=tAx/ZFlsqXKWFenehZ/MbbfKdZYuT66fnAo6orVBCkk=;
	b=ADxgLU5EZz3HNGhErDS2Bemis1ad9mxLsWKkBzMDFrlmnxp92cuQ7OBJZQ4YzAND6X1M
	 D49Aoe6DR8wOXb6lu/jVs0XYzdR5iXQfD3he4IxmgYA9MW3EWBjmRPv3pKHWlLio4fnat
	 jyyd7T4RmGK931xOv76+ZUl9oMREOasoEhcv5l942rl5B6mVFN7N44I/sykoZEbYuNXJg
	 DdrxwNirW8FbMjTT8COoB8mHEwJRjF4Xm/4V75kQANBb5FicfVHUBnnobpjC3LiW47XlM
	 Qz2pPJVekzdbi0NHAS9dEJuw04g2m0Wh56j40Iwxf7FrPJxWikZlpGi+WQ3ZJ0SADPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XBN881Uo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D6606A330;
	Wed, 11 Nov 2026 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XBN881Uo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23161F00A05;
	Wed, 11 Nov 2026 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395702;
	bh=tAx/ZFlsqXKWFenehZ/MbbfKdZYuT66fnAo6orVBCkk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=XBN881UoloAl+qdmKmPVrH4Sn4mrZ+nDx2hDHv8pvgq3leTwmjlP2OasxRSnWu6j3
	 uHEogUzELOrIsIZghOIZKs4GSyulW+2Vib3GHirLE8fCWtj758itIRfrnuLNvnyoLs
	 nq5Bf3G4qrFaKndvZZVT+FHiYQ/FVdQyfCWhnYeCImhzuagHE6tnxBPQxfV/Zc1gfu
	 qF4dSMTJrPHA/KKdiAyL9eDe/xhrDf/4/eH09PJ7xsaZvvTUFTwSzo5K6/GhrtmZ4e
	 KUXb/5YEClBabd5qR9xw31E3v/SiKbKwxaPazwx4mFeOSPFjrF6hgosYbJYCJjNUbp
	 Qw/BuuECr9HXQ==
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
Date: Wed, 11 Nov 2026 12:14:59 +0100
Message-Id: <DMSC6S86RQ85.36H8JJYBI79L4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use pin-init self-referential support
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lossin@kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20261110152746.140351-1-dakr@kernel.org>
 <DMS93G8MYB71.3HF96QRH1AUN@garyguo.net>
In-Reply-To: <DMS93G8MYB71.3HF96QRH1AUN@garyguo.net>

On Wed Nov 11, 2026 at 9:49 AM CET, Gary Guo wrote:
> On Tue Nov 10, 2026 at 3:27 PM GMT, Danilo Krummrich wrote:
>> Express all self-referential borrows through pin-init's self-referential
>> support [1], replacing unsafely derived references.
>>
>> Cc: Gary Guo <gary@garyguo.net>
>> Link: https://lore.kernel.org/all/20261008-dev-selfref-v2-0-e280b3c8fba5=
@garyguo.net/ [1]
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> There is already
> https://lore.kernel.org/nova-gpu/20261019133647.1279779-1-gary@kernel.org=
/

Ah, apparently this one has fallen through the cracks on my end, sorry.

> It doesn't include GspSubtree though, I suppose that is relatively new?

Yes, it is.

Given that this patch already covers it, mind if we just keep going with th=
is
one?

Thanks,
Danilo
