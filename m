Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0D3B2D18;
	Mon, 10 Aug 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400713; cv=none; b=AqPuIFKJ5DwZUHhaIlahrIMNu+07nIC+OpuA8l70SK6T57uQEjE5k7/3VuPuVewrt3ypLoWrHCQJ5pS17xF2uy6u2qStHBNiKyHvg04YHr/35KG2+00RTs/+Mj0K090NnCitTYn1byFINTe0xcocozJmrna+jg0IlaYflWQKwrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400713; c=relaxed/simple;
	bh=qYaE3B7aOUmyA0TEQgnnYXSIII483soKiTQbsNWoDLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LOZjwy4FfaSovw5emP49mh7uPmMcbm9TGfa64G5yZsSaQK7e60xnRfostl/V7cRwzFia6woRplJzS1PfB3XW22oUGZ2/q2ZgHxGMQtNXPUXnkt8pKQIV3ScWY+YnvMPfBJDjtStmn0ZqwDUkBkEDA8cWLk/QOeAXS1WeTq/UiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoyYYVzu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoyYYVzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5822E1F000E9;
	Mon, 10 Aug 2026 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400710;
	bh=qYaE3B7aOUmyA0TEQgnnYXSIII483soKiTQbsNWoDLk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DoyYYVzuk6qp1L9JJMydpGXVcJW8KsPViFTJS7lsd0XSRsFFPN91NJJD47KuY2K3e
	 XITR/e/4PFUqWr4XXeqML/TTelfmd17ei6tC1PpGGpQU/h1wGPkMmFtvmDvtuEk0L1
	 B5XAeyud45ExxID6tWpBg+8b4VI4mCsbMZuUpqkx/u+4atExl/QUCUgzTL7l5/6mkI
	 guWHUjRSUY7DQ6ve2DX5xT358fDtlgtOfaCC1BhpJcwGl4+jteTaXjP9T0GEaDUIq4
	 10CVHzEisEQiGFHALgtdRUUAWInDOKk1KPO0FroBFS7SVlEpHiWUwSfI+Ox/AT23sR
	 rhHOtt5onvHBw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:25:03 +0200
Message-Id: <DKLM760O3TCZ.25MJBWQR2JOCY@kernel.org>
Subject: Re: [PATCH v2 02/12] rust: num: reject Bounded::shr overshifts at
 build time
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
 <20260810-pramin-split-v2-2-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-2-65a00b3c7309@nvidia.com>

On Mon Aug 10, 2026 at 3:55 PM CEST, Eliot Courtney wrote:
> Make `shr` reject shifts of at least the type's bit width at build
> time, instead of panicking or masking the shift amount at runtime.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
