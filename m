Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731A3D88E7;
	Thu,  6 Aug 2026 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786050634; cv=none; b=ZusYAR82q6++qdPebVbeWjRmPFRA1CLkJE/K9yLeaAbkco/kv7zn+5CW9xOk3t6nLf3iY6tuiKoQzXc7MFv13u0XPBl0695AQ1GX7QFQZLehU2Y9iF0jtJqfXr7jk10yOJy0baWQuCfGw0EQEMAVOpTBga/602EWrRoOuv6gRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786050634; c=relaxed/simple;
	bh=FS+7TawYwzQVrDijTxZcjXDpiIhf9B0F89jYkJ55Ito=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=S5UFdh6Ir7mPGF7E7JllNQeMSLvEnVuW3AbYqszEZzWZCmV5dUHjiF+hk8WhzbA/FHl5LoP5bbe+Zkp2cgz1mJqeFrp69PeMd+Vl51j2KXRNbwbCobmRSzof4pJLBWwuCUYw/mdy040c6i76mEwmNaU8oIGg/hI6nAg+JqXpp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6aIvd/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6aIvd/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866DC1F00A3D;
	Thu,  6 Aug 2026 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786050632;
	bh=aPit3AqpEpHocssBZXpj0d77/btUoL4yO0l85om5cAU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=F6aIvd/ubPJ7QRzrJzn/D3Iz2bvGeVvI7TmdLFbkG5MTBebhHoI/97wUWaL1BK8KC
	 ofWlS24sEpLfP2UiTt3jhDK9zC6U8RmipSTzPYSskAWlfx/ub+tNT2rAIfOTRm3kC6
	 JIYaoWBJPenL7szmPlD5Us/if/r3bHqrNLfMy2fqoyliGqo1vFXI2BnNrqnBdHHqxS
	 UULWdYVTcstKgThZ0jj3jg47Nh0kMj9PkPaxlklVDBDA3OXp4CaSbF9qKccMJqbPtk
	 oJxqbjqfP0eExdWw0Fqt+HmG68d/NYo8cs9uP+Gtp5LUE0vav3d8DuRp4UkC0NDyle
	 AxmMvUdux0sOA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 23:10:27 +0200
Message-Id: <DKI63UYZ600R.2M9IMDUGV4QTB@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/2] rust: add functions and traits for lossless
 integer conversions
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>
In-Reply-To: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>

On Thu Aug 6, 2026 at 9:35 AM CEST, Alexandre Courbot wrote:
> Alexandre Courbot (2):
>       rust: add functions and traits for lossless integer conversions
>       gpu: nova-core: use kernel lossless integer conversion module

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
