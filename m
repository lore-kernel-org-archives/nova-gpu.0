Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618998;
	b=jds1hOmhjwfRQIADlTsLmcTvlNbonbt/ijfhRqS2JKhXIF+qr2rV4T1pjyjntaBFhuPB
	 RjoA32TRtu/nb8QbMwv8pxijnt6pzGaeanoID+GN4FUpB8LYWsIYYo1+RyprfVQjfeYb4
	 kvGeI4BRIKZzQr7yVjC/cYrrW8eCn9iVys7Yk2BSHD+HatpVq8h7VuYf0oNP+X2fc9OfJ
	 rfPNmTuA7zN4HpEoJFb0fayfhJqAIN0RtWXABJqgSbsiVCPkWBAMMIDH1E5/Xt+Au5ao4
	 DdCG2gYRey4fS6f7Zc+pXpDVTk9u23JJxq6ryPGycVNRopWGblsx3ETBalCxByAogig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
	b=o3uzrCreA3ksM7AMZ+saXR72zxHzsNyUbWmupVd2DWEPp88USPGIUomchlyKyOWHJ3yr
	 18c8F2SuLIeCJGybXpwdP9/chOa2BuH5cvPePpDTbOdtCi9Bpzkp37psSnHqKxEuzkS+v
	 vJeMy5M0P2WmbgZd99PWkDCBYvPqe//AlbEb8cefba9Nf3AsvoXjRpxdI9vh4cPSN6rn/
	 BRJZmNfmCTZ9TwdtBn6tO4xQnlv3sG+Z8xygaVw5ubINNuw9yWqLD12T2Cw/dqRSOcx1I
	 ksjCOWF0LaspA3pF/Cby/hngv2PKcbcjopv5tJGJgDXJONvWVI84SRYEiLjTGFWZd6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YAlLMuSy;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B587606A682
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 15:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B587606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YAlLMuSy
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so40745225e9.0
        for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618997; x=1796223797; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=YAlLMuSyN8As3N03pUi4MDEaD9rC1Au255aPk3JtODxa3aZGMRuztcw/+mwTyWmt6d
         lO49vqdVocDeJZIbP5UwnGVvXm3H/eA4OnNNVKmmOlbKZWB75hfAWHwQZqCkr4sPH5oh
         6Uupi2UvXr/lD73yyBK7GALAykj4OTenACATBtyIPl24rcf/CoEpeSZ12GG348RA51gv
         fiJvUlVCBN40JF1D5qlbGninOOzMcF87R2STZBM1ThBfFpmIs0b3j3Lm7whgAdpxK5OT
         o1IlN9l1PR+HalLppZTyusWpsb1RgnKG+5BIkwJ1tUrThA6F0sDDQ/xgRAoVIgBOAv7H
         YiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618997; x=1796223797;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=0MLQ9GyYeFdN7CjJrQ88Aj90Dv+eBn6jjwcqCB8rQEdam9gmdQbvU33bWSkFPxHQwQ
         XylbCxpHQVgGLX8yKIOKR8N89PRsZd99feCToSpHrpj6evIAKGvJ+9O1RjTs8Gjl9kOy
         CEu1+CPFvYDXPOcAzUv0izzaNvmX5smkbBSZMdZPSihqwXXuIZNIdHKANKjN6R9mnOTh
         RXp/be+Dr4y9Qj4QYNhl2Oq4y1lPmpU0QBK1JHM4m6jIOn1riXFzX3ff/a8TvELFNyYd
         gGQHf8rkXp++LbKMwnaVVBo8lvrVU5fMEBKeVXB/gbp7Oag26xPRkU6tHk87Dkm9Wz1T
         pZuA==
X-Forwarded-Encrypted: i=1; AL+hErGHAo+Jspt0We5yNwyKhfS6WPJI5jt3ngLMyFjclR7DIdtVduFFxNRD3Ed6+cjiFyjg8QKfpJo3YA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0Tjm+3aY+4kTXwh2dGdRugnUo+9St+F5oCeG1tY6S6zEegLWm
	CQ5bpsA29X++PFGg0OfcGKX+a7hWb0Lx9YvTSY2fQtrH4v/v486qqT6bDo9uee1uZRk1EOpHMzY
	Lfg1PdNpYUgMMqL6CDA==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:4a2:e03:1f55])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb8882bd7bmr363816705e9.28.1795618996639;
 Wed, 25 Nov 2026 07:03:16 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:15 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150315.1587936-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 4/5] rust: drm: gem: add an is_imported() accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:46PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
