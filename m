Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD1B33A9C1
	for <nova-gpu@lists.linux.dev>; Mon,  6 Jul 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338497; cv=none; b=jzJ13yJ9r4dSzyTcp5NpPC750sckIjbljNwb8CnaBCFbkIarwOk04YBc4fbSXInlTPdopv7SG8ROl22WmJE+aPs75lwTJO4pMotrXc4AR2nkqsP0dfIFHfyNpoeDbeC/05zqw0SV9uUDDsKPxrBAmV4KaVHKcYuQxn3+pfz9rX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338497; c=relaxed/simple;
	bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RhFhqkxfpoy9E+4v7HA2jGOBOaVNLwuHOzNLxHAs2+rtwaM5LA5hEhMhdOwggsZCjnJK2JF7l73H45Xe5yrfrlilZ8I40VNWdGxeRX59TlcMUHdFIcUschHDBW35FfYff64ErprUjmIUj4ijA8wsQoS31fA8M3FAZX4NTW2lemU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d1HSBwP5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d1HSBwP5"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493bc2b376fso15009525e9.3
        for <nova-gpu@lists.linux.dev>; Mon, 06 Jul 2026 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783338494; x=1783943294; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
        b=d1HSBwP5hwLtzUgSbApg+idyp5MWbuI+AmNBYX39bYG/Q+PcEDOojvtUZw0hSxxnBr
         KTVjLYpPc3MkXwdzXdNulyO38nVWob29Xm8X4WQFeKW6shm2DYmxT7jXfqGCz25LxZGO
         fsW9otq/gbQXtpsJKXV4Gzc0A1UgoIJXz9rASXOthF694sQCPXVKLOaFjWC7wB9Bz4mF
         LeGjjRWhX6QYJebqe8nJOVmo//LambruKIzIRUnmGJY2BqA9lxo4q0ac4VZc7sW6mxpl
         dn1N27gHSO541Gg+59Nu1WTmhqUWoZp4uu+xC3ByiDVI9XxyujRvMXh0F3oaap6o0vAc
         aEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338494; x=1783943294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
        b=k1bAeGcXDnR9z7qn/gI3Ppv8jG6kicSKIkx/fm0C+4BfcKXhODXV91qCHCAqT+56mk
         U/o40G/giHzEBXDQhXsP5+TdrTkCZ3egESfoou0qMamwQnmXZIvXXetE2FktMtrl1x1W
         /tG4wa6Kd4xo3XeJk4xNrrYQEMXigY8KHxh/0t779i9u33Mt/9I6PaN1LN5jFJ8jSwDi
         9FFziy5nTuQxpMzIMl4rAYfDio+XmcHl9WqPdtVJmMe46TRCjPQI0WcN3K4GNsWTQL9D
         f+TH3SrYS0eR4v6h0whYdlOZ89KgpO8ix7VJH6tWBl5bnzmkuWLlZIwBbbFBZFUOAam/
         zq3g==
X-Forwarded-Encrypted: i=1; AHgh+RopuWzB8UCfOq+/G2N+sobnFpK49hDqLdyH3ll2fhrdL9HSlz8mVm2fhY9BNu/9QCM6sDyQ3O7a4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpgV3N1MR6tvT3MHxOY1HEuCjBvvR5vONSOHetbHLXe4rEXhrM
	DgbhCDrsv6TqZH2OXJQF7nrV/8DChcYr7+RhgzwCSJQS1advItTg3uhqgvMSdI4ELtN7BNvnjAP
	Zs+wqTVo+dLQbM3uX5A==
X-Received: from wmdd24.prod.google.com ([2002:a05:600c:a218:b0:493:bb1c:478d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b66:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493df08b4camr610775e9.9.1783338493893;
 Mon, 06 Jul 2026 04:48:13 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:48:12 +0000
In-Reply-To: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
Message-ID: <akuV_GRAM4QPqf-o@google.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> Add support for reserving of ranges of IDs, with a usage in nova-core
> for channel IDs. This entails adding the helpers+users of the C bitmap
> API for ranges of bits, then users of that in `IdPool`, and finally a
> user of `IdPool` in nova-core, `ChannelIdPool`.

If you need ranges of IDs, perhaps you want the maple tree instead?

Alice
