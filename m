Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49D3B440E;
	Mon, 10 Aug 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400814; cv=none; b=nCpsHx/9/Xd77QWxsGORPx2JVzntSFEGZVNwgu3Mwoy8M1r2R3gkA9hjHGx7D3tpWg75cR9ZAljwwOGnNnEJ4ouXXGmNjG4tOMxeZjXwj/WXRs2mK89dZEyqQShi0WVLrUcvyk7Cp+7xwgfb7WCC6ajU6hcr441YWCtLYfp1zwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400814; c=relaxed/simple;
	bh=HG8sNycY7/JdHWzt4BeJ0OP8oxY3IOv4RnkBpAYb5ys=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mLmhIqJIKzvXy6tDQHJt4KeLnVqYfnWyOF30HE0BUhsGi7CcdzAaWyVUN80g3VKSZ4h6DN3fELZFz/CvZGaV+zUD7819h7Wrr9NxiWx1sjj2KlkISAGIbgas/NCGhtBHnfYSi5uJvV0bcMviLc7fkBeV+bMctQ69e2dVqyubCXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXN6S5Kt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXN6S5Kt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1031F000E9;
	Mon, 10 Aug 2026 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786400813;
	bh=V6cX6xgSezSyWDmsfBjBZGliDfZrSefjTO1zwyWhJYo=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=jXN6S5Kt74HF5r2Mst7/RNL8JAqZtlICJpbKwcELfu+w5Q6f7mHYUfVgDiw7Jy1CK
	 kktHtWvduuoWzqIxF6a3CDKcWbl+10S37gVBqY1bnAsLphmKtDqzLDI/fO2/tvMnPP
	 L7j1KVRYxLVZt7kn5OKHdaX6w0v4EA6I6ooXt93TEDSm5hvy+5bzrOMw8+6PXYRuE/
	 bxZph8bXbPd91beUTxanGDAHnk98FLhy6d+xwEPa9YIc5X/sYqtER9j8S+YxgYnJy+
	 ogQ5i9P3itg6aMZJ5v97zd9YZpa03PVVgQ88JmL7AAkswb4vdYTzSd8TTFIqUjEMEx
	 /8Eyqmyxy5PnA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 00:26:46 +0200
Message-Id: <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
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
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>

On Mon Aug 10, 2026 at 3:55 PM CEST, Eliot Courtney wrote:
>       rust: num: use const_assert! in Bounded
>       rust: num: reject Bounded::shr overshifts at build time
>       rust: num: add Bounded::shr_exact

I think it would make sense to route them through the Rust tree this cycle.
