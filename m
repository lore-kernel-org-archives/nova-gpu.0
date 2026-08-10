Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138643B27F6;
	Mon, 10 Aug 2026 22:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400689; cv=none; b=YSaRzk8bSDCh0IBFndcSwB4yMJ7eG9Hihws+nCDR3UeffCMyvy1X6fFD+ffS3J8lMZHBPU+9EXacvEFCBuYqTqFYlo5tvzPbtZYZKW6fQIWuzLIFwNI8CJODg8pZdmWh2zrJkyjglp5y9e53g0AjA3IK/1glku4nx9pV1naBQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400689; c=relaxed/simple;
	bh=FI+QEvHaJfs+rB3erfK08nuwK2MZ2xUllGkJ76apD/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rT7js7FxL/QMXNwyDNOxKIUIEgrH9lfbzDUv5X97ltrdZfk+CJodIJKSdRrHOn7HyHWSq2pMuAhpNa9YiS/twc8Fo8n0tXbTwuKqQUv7K29ZhrfkvzmG+WeqSbBIH1ggrlslwpUdrpZX5EM00mId2UiXXdZD1rN2zMAWJGwVRTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iM57X0TP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iM57X0TP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5821F000E9;
	Mon, 10 Aug 2026 22:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400687;
	bh=FI+QEvHaJfs+rB3erfK08nuwK2MZ2xUllGkJ76apD/s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=iM57X0TPSPGu5vzBZK8rTJXuOLnPi16/A99NKabmzXHoCOKKN8hVjJH8MjIFQGteL
	 4gxhW9FeYNWvYzMv2QokA5XCoxTPlSx6rVZ0xwBrIDk3WEDUqPBcDnADOlN2v54lmR
	 7kqoy2o2TNdEsQdf21FmHoxCh0j1SlSA31sgx/xKn2F7L9vqbUdo9JdDoRShM3rqOE
	 EbIpz0nVjZNX7KWE0QNWKnIwMF/Yj1yIqwi4VdJicoDdSxyTyrcVcLEdqIj67bMXaY
	 m55uw0LxsUUD63+PxQ8WOHO1lcgxLfot/NYUMG1Xh4/EZ9M6em2DlOkgRyObJ6Z7zv
	 czkcMzRLGa6rw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:24:40 +0200
Message-Id: <DKLM6VGASU6I.11XJUXXC41OIQ@kernel.org>
Subject: Re: [PATCH v2 01/12] rust: num: use const_assert! in Bounded
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
 <20260810-pramin-split-v2-1-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-1-65a00b3c7309@nvidia.com>

On Mon Aug 10, 2026 at 3:55 PM CEST, Eliot Courtney wrote:
> Convert the const-block asserts in bounded.rs to const_assert!,
> matching the rest of the file.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
