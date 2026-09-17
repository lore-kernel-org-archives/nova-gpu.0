Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B33955CD;
	Thu, 17 Sep 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635435; cv=none; b=BV6igoeX1QB+oeS1BARUCTU6diMWgjELJ0wllAm4rpbmv1FSMeAvS6F2tPCECAbp3nWFTRJU1tKI3dFGgSzZ6KXYIGJtGKAZT+forxv2oyPJ78vy0LecG+sfbg4jwbUO6ooVJ0pjBZczoJAmvx0uWCanH/8wM6nLktaDYCL+7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635435; c=relaxed/simple;
	bh=185K7E+yDGpdqm72K1yyJEdvhz2PLVSX2+A8CdqzS6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bPcTpheqh6hMx4BgA8YVkz09TZiPL7aAiRscYgNg5V3tr1vCgDh2vdfz4KU4XQF7uGa+a0+HOCnL+FKayDctALIqM8uBLhN7DReHwzbjUslAYjZxL7/GGSPaJfTOyJLFptxACJiVmVJu7LZ8MWJMECCVKEZaGmCGlI/5JVBBnwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPwotUdR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPwotUdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767731F000FF;
	Thu, 17 Sep 2026 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789635433;
	bh=185K7E+yDGpdqm72K1yyJEdvhz2PLVSX2+A8CdqzS6I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lPwotUdRj/KhDUwr6PxOoMJXRA3U3CJGfvY955sz8mLgUGfdhysIeIfTAN+uLZSXb
	 luvwBhp6oqA53N6tbBpBviSzZWlcMa7CzlKasGyxkvRTfrYbYT4o/6mYEYlyxZf4r4
	 H5nI9/akUADQ3NHayuTtYJw3/zOMLYR+mYC2pqfeGpkHZL4M5VbwtUEuY1G48+cGz9
	 HUr3w5hczsSFKBMQKX1IebxiASM0Mr0+xIfbBOfZsFY5UsIpTruW2aZBK8xDUezhTG
	 9V7nBw9s2Wq5fvtqtQ2JZrpepVHc7NAUgXkvEWum7ZzFZQSUHT41PJSy4n02ZHuk3y
	 qtlwfNC3ew7mw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 10:57:08 +0200
Message-Id: <DLHGT9SR5T1E.2Z3D1088WA64H@kernel.org>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use cv! for constant casts
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
 <20260917-cv-v4-2-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-2-547ef5727451@nvidia.com>

On Thu Sep 17, 2026 at 10:34 AM CEST, Eliot Courtney wrote:
> The new `cv!` macro allows safe casting of constant expressions in a
> const context. Update code in nova-core to use it.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
