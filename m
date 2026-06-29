Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334430EF9B;
	Mon, 29 Jun 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723461; cv=none; b=UV/dNYwqPMfow8FQIQXhWjWDT4Xsik9KDvtxalFOgD+bzn/ybcMffS9S4PKqLx5skVJpF8bMRH3Ncda5H/5DMiaECju2FBN0YFrXYFLlk/HdGFSeGbx5u0eG7qa3TKHCVM/RXxKcZ0s6iolEVdBS8EpWlKTQPZEz0EqF1hnOag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723461; c=relaxed/simple;
	bh=QTibYdJqVWSTGzvV/onMSu755yQ9D+ntsE5qpG8XJu0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=QlwTv73ZAWCCt7dWuaJFvh3EVz3BIETbs/9CaLPfXBd3mzX2jX6l7kIWABzeb9s/SQd+HjqOQHTH/2lRh9xSJTS5FIRPzZ6pw6b0eKMM68xMD2OrZd+lBXWdSzD/mYHn/ZMWoYjBPPPzoANQjMQF2qVc/jBlbtA3Ya3ihRm1T/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxGN01TN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxGN01TN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64781F000E9;
	Mon, 29 Jun 2026 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782723459;
	bh=QTibYdJqVWSTGzvV/onMSu755yQ9D+ntsE5qpG8XJu0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=IxGN01TNcsg1xJOrtvaKfEkVrKhRCnfkwmM6SfAxXxVEyK/8k/fEQs+tWKZqV4xlN
	 l39SwKbo1C+4lKQUZl2bxevVn4ymAR7SDJ5mglfQPPrePMshdMS+OaCV5E+6yrL39x
	 co7U1EQKHKJXByQlL9GvJil+DVdy1CEW3BgPHqrxvt62jAGXLC9w+fXCDL4rMc2qi0
	 DV3wAYZOhmHRj/RwNnEXYcimAnbyPjDhIjxEsZsSvdH5Rz3lmOuEgx6/aFghSJcQWb
	 T2gL0BLJYGgKrrF+ul/Bb1IpBkZ5p0a9BW1zqbqSnihvm6zRu3QdLCrqXQkPfjjaiN
	 ACRM5ovHObfhw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 10:57:34 +0200
Message-Id: <DJLEQ0UIBOQ4.2AQ93XKMH49X0@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH RFC 0/4] rust: dma: bridge zerocopy-derived types into
 the transmute byte-safety bound
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha via B4 Relay"
 <devnull+engineer.jjhama.gmail.com@kernel.org>,
 <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>
 <akIpejFWuKZ61n_v@nvdebian.thelocal>
In-Reply-To: <akIpejFWuKZ61n_v@nvdebian.thelocal>

On Mon Jun 29, 2026 at 10:20 AM CEST, Alistair Popple wrote:
> I think the context is in the description for patch 1. It's not directly =
related
> to the bindings generator. Basically the problem is that these bindings a=
re a
> little bit unique in that we access them using the dma_write/read macros.=
 In
> other words we use these with Dma::Coherent which still requires the tran=
smute
> rather than zerocopy trait bounds to be implemented.
>
> That said I think the correct long-term fix here would be to fix Dma::Coh=
erent
> to make it work with the zerocopy traits. Not sure if anyone is looking a=
t that
> or not.

I think it can just be done short term, please also see [1]. We can just co=
nvert
the DMA code right away, no need for the proposed indirection.

[1] https://lore.kernel.org/all/DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org/
