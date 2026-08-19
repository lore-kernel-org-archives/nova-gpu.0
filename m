Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69E3CFF4A;
	Wed, 19 Aug 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165996; cv=none; b=II8dF07tNLsd58kXDidliQNWhtOnAlUxEmOPpQzNgOtOah6CA/jnvE4d/2tdUuRcWEz7axzifWT6eW7Ib50wP81sXOSRlAWxRtiLGaLBTgzFhrpkdqZsjShl1Dlj9oRZria66KUj2yl/p8892KgpvUcRIhTAwC+0hQhIt6/G5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165996; c=relaxed/simple;
	bh=xycLBwHrG7ZYBmnmXZC0Sei+Vv6+/1t+nZK2QYpF0PI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=it0T8yzJQ6s6cmb2JzEcB/EaenB0ed2X8n0TPwk+rpWEAdQbrEpxS7yYBHAcwkgzJaoQfPrC9yah1kk6/PwpWMccZm3UBZEaIGyuYZiGu3Gi/bcCeXJWxR9ZyI4/kFiRhsarpo9Z3dmA2QjPkRMHGR7+lYKLsIs5VnZiZqnaOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le0+TpKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le0+TpKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0CA1F000E9;
	Wed, 19 Aug 2026 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787165994;
	bh=xlf0k7UvPh5SQZZCy8DxBAo/+dbt1EPzI1dcAJ7/Pmg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=le0+TpKWUK+cUmt+SDybCSey3/D3ij6vKjNZKTkxVIr4sprZwiXXOKYV43rkqABHC
	 S3zWjMmZkmHanXEfm9Vo2h4RzFu4VoBiw6ee7aXLDoMH5tD1lQDqD/co4WIKaqN31B
	 A8b+9DD+vjZIdw7xKEn0yQBNVKdIe+EVqLrOhKU/PLEaXnF0YYjZFFhDaTyp4C9feP
	 N8kI59rfmyN6XJFgWjYeSJoEAi+D7P7zwNyIVEOqUDisi5xL5hIqIewFr2D8oudEUP
	 6gjNv7TjgU6wV3eQ5NLo9DcEZVEDhI2Dp6fYyedq0idVEFHbssymv18zJjd+vw533C
	 D6TAFNiKt3GJA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 20:59:48 +0200
Message-Id: <DKT5GWU3ARFG.25B1BCY0A3RS1@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 5/6] gpu: nova-core: add NVKV typed decoding
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
References: <20260817-b4-nvkv-v1-0-b84db5e84b67@nvidia.com>
 <20260817-b4-nvkv-v1-5-b84db5e84b67@nvidia.com>
In-Reply-To: <20260817-b4-nvkv-v1-5-b84db5e84b67@nvidia.com>

On Mon Aug 17, 2026 at 2:56 PM CEST, Eliot Courtney wrote:
> +/// A fixed capacity vector that holds at most `N` elements.
> +#[derive(Debug, Copy, Clone, PartialEq, Eq, Zeroable)]
> +pub(crate) struct ArrayVec<T, const N: usize> {
> +    data: [T; N],

This should be [MaybeUninit<T>; N].

> +    len: usize,
> +}

Let's move this into the alloc module.

> +impl<T: Default + Copy, const N: usize> Default for ArrayVec<T, N> {
> +    fn default() -> Self {
> +        Self {
> +            data: [T::default(); N],
> +            len: 0,
> +        }
> +    }
> +}

For anything that actually constructs an ArrayVec we should probably consid=
er to
restrict its size with a const_assert!()?

For an initializer approach that'd be not an issue of course.

	fn init_with<E>(f: impl FnOnce(&mut Self) -> Result<(), E>) -> impl Init<S=
elf, E>
