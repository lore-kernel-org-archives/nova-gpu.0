Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066182;
	b=nutSYmOrVb/QDA5sO4b2oHXk9NprS9nPmYAaAV1DT21OmSDKh1mgRbnE7GwS7dhu1G/n
	 Stzpp8R9mSWmEbo/QbqGe39gVU2oCGUsc0MvZtLnF58IU1BQ8jDxlOD8nKNvwooAJQeeL
	 we6WFWd63DDvoYVpz9c4URKqU2XW0IuPWzNjcEsSdtEzkK3Dl2TCB5iIfAmzi0lxE/PGS
	 AjWTcs52tE+3Cr1PNDzONS2EPcBq/cq0e/TX1DCIyU7wT6nMrxhUby/WHjSHktTUlHfzb
	 U1iNtpSUbuNl+t18Zy7h1KTFgEzQAqOS2eeM4iCEfy/1I+Sj5ZLyixzGWCRVwRhZLmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
	b=d4JrxGVPoAY4tyPYGUpiqc5LZTQ2VDLty0P+oMeTKeN8GOR+rvGgsqDLWFjPwuFRUIoW
	 MbLlXAWj/k05fbDyvrt4Rc23SNkZTiqThZTocKLXYRATthYUCMe8I/xWpRI4RhQdyupEO
	 Ml7f1C7VmbW0XV1l0OeRpivs5jFavE5J+1TKAiEWRWop0qvwgv5SyBDMuA0/9OzLv5nH0
	 i2xqUvv2qacb6Ra8E2nMaf+Orlud+YvLEg+G9KMg+ncI8m+Yq5rztTib9522AGt3P18Fr
	 fzIm3VCci9MhF68/AH0KgDQeO7xYSZLpS21vrUjH4BwJrz7RL5IA7/QCu7DVYw3ONeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SknAZ5YR;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B1606D804
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 15:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3B1606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SknAZ5YR
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1312327f8f.3
        for <nova-gpu@lists.linux.dev>; Sat, 07 Nov 2026 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066180; x=1794670980; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
        b=SknAZ5YR/U6viq++NZWgyPQFzyjfyr6VxbTHS91m4b4GkgGOLhyABjs7JCLfiuAaY5
         03ZH7ZoxIj0SeNAlTerLFqhaHo1g1QcJT815yH68F8PQL9lM4wOi/VydNQJg8Q3cPK2W
         OPT+Q1UiWE9dJKdPHgDNFbeasJ42jeI4/kfA+is0ttbUvCVZ5jZtU4BNNM9XORPhyMwu
         tx3KiSQQTElwYzeZFSgDD3DiPAslOlflYVwP51/9VoLZYa4m8RRxE01f4ednZDqcA/ae
         Czau+D6cJeyuU4Gelj7rBCjk24hmeoIy9AZNF7sOYMnXhiDEw+bOByTQvnIJ6u9GBUfV
         ohDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066180; x=1794670980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
        b=Ie/4MEMVVEvih71pUFhQIkTtt87lx7IhKI5aUbxnNHlCgs8dTstDUTHQNzsIsnzQ3N
         K/79gHA3FFrRj12NFL11LUCHWzOAEj3zqJsUCzWchhkNPVmYZHHXwgvve3+GA9GU2wiF
         gXgl3IuObOQMNwm6NsbgMFDyahsSBTbN1zy73bLgAcZJwMWppYYxN7i1jWSITj9NLg9X
         NzMR4inSQSo5fYV9SsFgJQEQZKGfAiRHQLoqN/Hg3v348qMc6/R7SsG6rDYJuTBXIMAV
         /HE45ADZ4/JNZCHXGhkJlV8CU18Hy3OyO+dihRxbqVH0i9S8bdGwPpklY6OZqhUqQt8J
         zn2g==
X-Forwarded-Encrypted: i=1; AL+hErHJWKQvLg1PHZgMALry81MQEvlmnW1J0YRfZu/DGbPYukjtFCvTyotA7iJ+nEtTEjFsgpc84HuACg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vUPKM17OKGteeR0vZGspUmku9x3CMy9GjcHHVT6V33i3GGnmN
	OEVbcov8ftHvifAPYnQrbiRxL0CibZWzZF9IL6LAkM9S9dxnCsNwdDXfUGpGhL1O4Gvfg15VvFw
	/G4o4fim4emNhraPVFw==
X-Received: from wrsn15.prod.google.com ([2002:a5d:484f:0:b0:490:3c0:b998])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ce:0:b0:48f:e879:5890 with SMTP id ffacd0b85a97d-492760da597mr10504618f8f.32.1794066180064;
 Sat, 07 Nov 2026 07:43:00 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:58 +0000
In-Reply-To: <20261019-chid-v10-3-67de9180b4ed@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-3-67de9180b4ed@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154258.3547690-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 3/3] gpu: nova-core: add ChannelIdPool
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 01:29:28PM +0900, Eliot Courtney wrote:
> Add `ChannelIdPool` which adds automatic tracking and releasing of
> channel IDs on top of `IdPool`. This is necessary for apportioning
> ranges of channel IDs to be used in e.g. vGPU.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
