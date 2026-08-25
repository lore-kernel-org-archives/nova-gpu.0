Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9F023EAAA;
	Tue, 25 Aug 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666553; cv=none; b=byfUqsFB9f7hpJiHoLJD6JkRVc6KVjScx9ekYPzyO3m/Z5r4AXVdpQKB0mpO73q+1gnm14WqPam+IbLxpf0P7C2MnWEmWQxbWF2rGWzVg5N8T6lEJgLGdlhb/pTln11JcFaRpRejWr14J6fBBZJB6LhrN0pPCtRaFhM+lQvYjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666553; c=relaxed/simple;
	bh=yDbM0jv/yYM2eisJ4otfKF2xbdKGTT3gkVh9LiNy0IM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nW4EraZCtv6O+M4kJQuB7Fikxq1f7HRYIHlb0TBorjKDMbBGzpljm4qxnB/jYL7NFFGEWcW7XxQ4pbLThOhBrBxSFD773ooDdQcJrJvbF7RQUC2PobzOPwQPV1To6OTtF+FirOjPrrxjdNgFgpYB9CghUn18rYEbS7rb8SAiNWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bnj3VUdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bnj3VUdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78711F000E9;
	Tue, 25 Aug 2026 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666551;
	bh=sL+dKVAl/FzulRvzaaGRosa9zpRB2CicSEckvkZ5a68=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Bnj3VUdd76zjYGShR/pbYCkV8JR+WexgOqNTDXvO7VcdPH4Ktf2t9YGcS0g/wb5kF
	 IK+Jdvu8LhI1GG/6Okm7jF4fdxhQrOoI+CrEm8JUx0x0bH7bvodM+w6Y3g41ILbERY
	 Phk931QIXHquwSPcwjZtH+fZvuCnDXISy6Zn7r3JUKrm8AL2QvfYgxuPBdikUX2xir
	 XX86kQSAnCiYzTLSsqRwq+99SEf/tlleLmqi1eoo5Ms0QTnLgkvxwchQQdzJ+ZOGkp
	 zat/w/5h3tq3GalCUut8BNGM5xS7DmioRVmNXKYV05kPMnVG9nlvzopcvJsKT03jLZ
	 nOHYEBi4NJX0w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:02:26 +0200
Message-Id: <DKY2WHYIIWOH.ATST6NOVK1PI@kernel.org>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
In-Reply-To: <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>

On Tue Aug 25, 2026 at 10:25 AM CEST, Miguel Ojeda wrote:
> On Tue, Aug 25, 2026 at 4:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT=
 }>();
>>
>> into
>>
>>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32=
);
>
> Having said that, macros have a cost too when they introduce new
> "syntax", so since the beginning we have tried to minimize their use
> to where we feel is worth it.
>
> The former line above is not perfect by any means, but it is
> nevertheless syntax that one needs to already know. Personally
> speaking, I don't care if I have to write the former or the latter, to
> be honest, so I am OK with both ways.

As mentioned in [1], I also think it's not great, but I also don't mind hav=
ing
it as is for now.

I guess my main question is how we expect this to evolve. How do we want th=
is to
look like once we have things like const function arguments or const trait
methods? Is it worth getting back and forth on a macro solution with this i=
n
mind?

[1] https://lore.kernel.org/all/DKX57FPE7DKY.1MVQBHYXKFAWT@kernel.org/
