Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661884;
	b=4Ff2emZ01T83u+VKkrYvZY6uQSjQeh3swNst7G+yuVDYMxVYRfzVog8WNa7SSNgf2wJd
	 RQ0Isc9hkckVU7itXXHMDNOxZ+pqqpK/icE4/hKbf7puVPmUqQ4o3RSxIIvvqEgxgm0g8
	 5xwVPHbidDQMkaI41QskqkOGQz0KbEHhYlc+o24paK+b+8MDVr2ETTmGNLGEL/kODxes/
	 YiMUha3SAQBlKHMdLJnTgiUZ+eQOptM85AIOZKQXTyWZh17ujn9KKwdwe1mjDVdIigtLp
	 FjYIfnNASEo2LJ/xwakG207XP3xesqL4pbT4G420dhiRMGJ5xJ5qt/97LB5WC1p/mZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661884;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=fJCiqJRPGgAfSVN7RbM7iHySGCq41L373bwkKti7+4I=;
	b=eTTxLe8THQ1FZ3KsCvMjHC6PSyoxAxPaIerWcnQfO0V50YrsBQ3Arr7D22UoM1KqVe8u
	 l0qMhGYhquNlW5il9A/Fd2qTq3MYtzFI74Kfm38yQ5jJZJrNFK6jTQ+cEPdSK5ZhraHnB
	 A4JA+xBIv6cDDRCsogp1HB1/qOqdrCWb0peCju/Jdvd3Dj9HrVSl+FyU3YRIQQvH0nAzd
	 jGsA/uYX5RXkCAs41A/QFZboScSi/NdUgxoqBVd4+NuxcvHca4ACh3Tocwjsyt87MV/q4
	 qoGXR8pFsJkRMfd9B9V+Wu3uj230dht195CLYjtm1eKxd6Z2jtvdJbSATs2qr0ZpVnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KPzPoR/w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7E606A31A;
	Thu, 22 Oct 2026 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KPzPoR/w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67421F000C1;
	Thu, 22 Oct 2026 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661883;
	bh=fJCiqJRPGgAfSVN7RbM7iHySGCq41L373bwkKti7+4I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KPzPoR/wrjNNGbKIkqlMCH7CJUloCIWwrjPJzodjNYeKU3Ve/XXaS5wxkQckuueOt
	 R3EwVlkaTwaZAxVCAW0LmapgJ2a9lWtZBxLjZD1h3uPnKRl3f8WdlED65AcWmUQp58
	 s2P18JLCDr6LONj/VPojqKPBQRJaVml0ZrRgnWJOYYShV1g0YIf3IAcpU0R9DTVglE
	 yPid1dVogbCXY2+8v9y4Lo/UYyycv628hGEAbMPEviteTg/79AmEhMa1gbtF7nDsB5
	 zqRySub6a9kHn01RYLG6wi2lbf+tB4naNkfIhu2hsnvf1GngoPW/8cTVphE6Do0ckm
	 LrbG12th5iOUg==
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
Date: Thu, 22 Oct 2026 11:37:56 +0200
Message-Id: <DMB9LKZEM5I0.2NOCDMVFATD2P@kernel.org>
Subject: Re: [PATCH v4 4/7] gpu: nova-core: add NVKV decoder
Cc: <sashiko-reviews@lists.linux.dev>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>, "Roman
 Gushchin" <roman.gushchin@linux.dev>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261016-b4-nvkv-v4-0-e8b92b91aa5b@nvidia.com>
 <20261016-b4-nvkv-v4-4-e8b92b91aa5b@nvidia.com>
 <sashiko-outbox-173606@kernel.org>
 <db71fe6b-bc96-4d02-a139-2bef73f568a2@nvidia.com>
In-Reply-To: <db71fe6b-bc96-4d02-a139-2bef73f568a2@nvidia.com>

On Fri Oct 16, 2026 at 4:05 AM CEST, John Hubbard wrote:
> How do we update sashiko to make it stop reporting on this issue, which
> we have decided is a non-issue (Nova is actually configured to only ever
> be little-endian)?

There's a repository [1] to track the review prompts of subsystems, compone=
nts
and drivers. Those should be considered when Sashiko picks up patches for
review.

It should be as simple as adding a new file kernel/subsystem/nova.md and
referencing it in kernel/subsystem/subsystem.md.

(I have a few things collected I considered for adding them as review promp=
t and
I can send a patch in about two weeks, but please also feel free to go ahea=
d and
send a PR with the first bits.)

[1] https://github.com/masoncl/review-prompts
