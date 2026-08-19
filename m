Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A745C713;
	Wed, 19 Aug 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138636; cv=none; b=tZmbQlt0TujC0jvjxtdZY+hG5HmXvs9OclxFG2ahSpkamrJsAS+F7prgmGOM9wjaz7eHrV27tX0y6LWp/62/XWgKaHnWBgnTzY4Uj5TdW4K+iQh02whfPDcKlYSPggBKsPJZUJ1OxY8VlgYnbx3cOT20UsSZ1W/v2xFFMUPsPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138636; c=relaxed/simple;
	bh=aRdMLh7UP2MhicwcvC1u1hRVnrNju1HDVz0utZU5byU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=laKFwYNgrLMMr6jUnJdbRvznkAo6QjLoL2/kSsojGNqS68K7pJa8RvJ/rbN1DoXIkv1xuqNdk1PYEdp18HIDK03/LHd6/tT72P4CCUoFPWkyVBqXWEl7VYtMrQSuHVpFyEkwyKR4PZrTybBv4WSl6MkIutmwZ7XrSJGJ3dFTj0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcBjsKaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcBjsKaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D2C1F000E9;
	Wed, 19 Aug 2026 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787138635;
	bh=QgvazMJHmYfZ8Q1rsg6DrrOav9bRml6UL8M0L4LzXNM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PcBjsKaHg0Gfg6eN15Zexqs8qukqL+KSCvY7Uk72YD7wocrIPqWQXPUEdel8lKduT
	 tSbv5XZheBupNwIp+EPPL4BzLCaAMVlcdxiJ4Io3efcWjUyjXNeYiq+q5JTejqcosf
	 D2hLfRmXzc0QPHiGXOedg4Nwb9lYxxhV6Xd5eHmVFKrZKRKQSPuGAonx6kAXfUNxs7
	 AMEqlNvtFbzA6ULNzRabj+v5XvWqMxZpc8mrlyk0QMLSdAuDTFjI+qRDgc1pI4M32V
	 pI2hBdDAvEGExS8v+hP2aiSVAnH9Qc9hlgfnYtLbhZAL2OGuupIBmUl+5Q4BNqnev/
	 qKS6qhHIKM2kg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 13:23:49 +0200
Message-Id: <DKSVRS7UAL9U.3RUTW74RVSEHQ@kernel.org>
Subject: Re: [PATCH 1/6] rust: alloc: add Vec::push_init
Cc: "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260817-b4-nvkv-v1-0-b84db5e84b67@nvidia.com>
 <20260817-b4-nvkv-v1-1-b84db5e84b67@nvidia.com>
In-Reply-To: <20260817-b4-nvkv-v1-1-b84db5e84b67@nvidia.com>

On Mon Aug 17, 2026 at 2:56 PM CEST, Eliot Courtney wrote:
> +    pub fn push_init<E>(&mut self, init: impl Init<T, E>, flags: Flags) =
-> Result<(), E>
> +    where
> +        E: From<AllocError>,

This signature rejects impl Init<T, Infallible>, which is the reason why we=
 have
e.g. Box::init() and Box::try_init() with different fallible signatures.

So, if we follow InPlaceInit, it'd be

	pub fn push_init<E>(&mut self, init: impl Init<T, E>, flags: Flags) -> Res=
ult<(), Error>
	where
	    Error: From<E>;

and

	pub fn try_push_init<E>(&mut self, init: impl Init<T, E>, flags: Flags) ->=
 Result<(), E>
	where
	    E: From<AllocError>;

In theory we could also simplify it to

	pub fn push_init(&mut self, init: impl Init<T>, flags: Flags) -> Result<()=
, AllocError>

and

	pub fn try_push_init<E>(&mut self, init: impl Init<T, E>, flags: Flags) ->=
 Result<(), E>
	where
	    E: From<AllocError>,

However, InPlaceInit actually achieves more with the init() and try_init()
distinction:

  What init() accepts, but try_init() does not accept:
    - impl Init<T, Infallible>
    - impl Init<T, E> where Error: From<E> but NOT E: From<AllocError>

  What try_init() accepts, but init() does not accept:
    - impl Init<T, E> where E: From<AllocError> but NOT Error: From<E>

So, with the simplification we'd technically lose out on the

	impl Init<T, E> where Error: From<E> but NOT E: From<AllocError>

case.

In any case, init() and try_init() seem a bit mixed up on their purpose
regarding fallibility and error type strategy, but in order to really cover=
 all
cases I think it is necessary.
