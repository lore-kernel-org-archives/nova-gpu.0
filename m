Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E883B2FE3;
	Mon, 10 Aug 2026 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400734; cv=none; b=ehe0eQc1ZoFSx9TEbIrPn06rQRkgimECZq7zWRqAym8vpwYKl25RH7yTGv0es+IHYX0yZJmul2xAH1cDXuGRWqebd88WFODpntcRgiNASZ9jPwIz0ZRxTtaSECMrxvKwpQu8I/IYgI49B4SgoiNJj8xWc2bceeeu9/TgQ0rylok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400734; c=relaxed/simple;
	bh=ekDFqJQI2Yz8ZpLPXEvnu+7Loc6fimyyDwLc6ggBW8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dCbolPIimFxwHKpm61qf4S+gbWh/cU+JC/M7MoG9yXirvZAG3Bxo2CwT9sPf1qkg+XhoRYUDH6C01JISYspwNAKiNQumghzsJwqB0zuBIB800CU0MYa8SGxJN4yP0lB+aNd8w2MOv7fOZ1T3PQ/Z+at1fvwmZCgzh+gG9+va2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euduUV6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euduUV6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F098E1F000E9;
	Mon, 10 Aug 2026 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400732;
	bh=ekDFqJQI2Yz8ZpLPXEvnu+7Loc6fimyyDwLc6ggBW8A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=euduUV6IBiNgWrzraW66ig7gCW5o2VIUdZ2euN9+HH7E6efccB3fO4j6zzcciS1f3
	 DKBaIL4jNk+pJw67emLPjWIc7mraOA7G3VkG8Hcl4/m9HUTkaXeD6dNo+1TfheEhkx
	 h4oVbL00C4j19kowsBIz8Nmj4S8E7pU5PdvlqJW/1O4U/tsPVgYgZPI+wkItCKWG94
	 mQLahGMDdWjBSOHDWLMTDkVo2vABeP2kqRA4qjCsGIE3zVi6x32JU4/zrs2vVTfecq
	 n+MoS9opNV00kolJp/+w4YQn5KQKZAVrJWJBpdlMZ/KiKgUZjHZnqH0GhjbOLScAES
	 H6ou3ASQ7qT7A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:25:25 +0200
Message-Id: <DKLM7FX6EMYX.1Y5Z3QNH02T6M@kernel.org>
Subject: Re: [PATCH v2 03/12] rust: num: add Bounded::shr_exact
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
 <20260810-pramin-split-v2-3-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-3-65a00b3c7309@nvidia.com>

On Mon Aug 10, 2026 at 3:55 PM CEST, Eliot Courtney wrote:
> Add `shr_exact` in the vein of `try_shrink` which shifts a bounded right
> only if it loses no set bits. This is useful for getting a shifted down
> integer while simultaneously checking that it's aligned.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
