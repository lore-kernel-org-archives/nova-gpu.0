Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F7448CEC;
	Thu, 17 Sep 2026 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635071; cv=none; b=fFxOpE7kylSH3P/GFXLFq0sMDyq8VXeYf3pDQ4sEYnNCLrEKgBAHorhBhBA8s7uUoD5SqsOTgZIvzCXlOGuQdW73RdMrWjc0Zw2HQTBKItEGhmwp/Tygc6K0hB3v61nRrJTtiQqTlKM2KIBhOhNz2aAszGYp5zWEFxQWBMAZlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635071; c=relaxed/simple;
	bh=ZhuQHomawxLk9rQqvM39AmBak2r/Ub1GZwtl/wLVXyk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Frf1Mb5EatlwYzWiU63COAeXEGOiZHkmFbypvVvOoZQWM8hclsGIM5LVTCFUjhUZ1fvIIe3wfFAmY0GLn1oJvAlnB+Fbai+VW0rVJb55MvOltNrbUEzqwMaXRu+DhtOC2fGP3qjjyOlVe5Jd0SeZlTSHdjicMQBIeTyN8VDEJfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K16aZhmh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K16aZhmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4585C1F000FF;
	Thu, 17 Sep 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789635064;
	bh=ZhuQHomawxLk9rQqvM39AmBak2r/Ub1GZwtl/wLVXyk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=K16aZhmhKthNV915bJgiNIphPE26uyCyZSe3Qniutu0IGBLXxBYinl9yY8x/sFM0l
	 sbu7oVMWCQFB41/9l9uhSh3vrkWYMRpZBzvVDdhOUrnA27NAyleyMFrFRTUoVgU60X
	 KZ0AKyxDko99+ePCJy1tHIAhAyEzouaAKJ5TMXxBTQXzDodnoZMTvFCAjCw9qHIMeT
	 QWPPNV4KLsY0+193h9mmXAEUxHbPDYqR8BlxoIPqFwiCENDmNnbtQiD28Saexi9X+A
	 w3rK2aVyegcU6pbnUPv+IExie1oO9qBLzuKtCmMMkq3ssYqnuvxZXC79QaWPbZhca3
	 yf1qIN0nnc84g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 10:50:58 +0200
Message-Id: <DLHGOK4T4SCX.37QOVMLFTYFFQ@kernel.org>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260917-cv-v4-0-547ef5727451@nvidia.com>
 <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>

On Thu Sep 17, 2026 at 10:34 AM CEST, Eliot Courtney wrote:
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> +/// use core::num::NonZero;
> +/// use kernel::num::Bounded;
> +/// use kernel::ptr::Alignment;

NIT: Let's use the kernel's import style.
