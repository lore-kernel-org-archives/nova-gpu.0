Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002086;
	b=sic4zj+7r9VZwuUqGFnikNi/JwNrxqo5sECQo8zScm8YXzNzf+y5CR/m7fkC2SUhjFz/
	 WuAGlGNv4OA5ahvDHCmIjzeqdvVgnm8R63VvcRtflTJqwI3mbTp0prlNJ39S3mT7jbdKV
	 75n3yVZC9Z3apCfq+T7Jh6Ndb6bysl8f2PNFSHtUONTo3P25BtoBgdNycxfcPjDhh/QA4
	 03bpgVqo20xLWgR3A7HtWg3Vwr5wpygtZdncFmyXYQC51QpjqfSlEaUfSidfdilMTMrdg
	 uthixRkbLxrN/pMuDkfO72rDQeLXm13ZWsEnYlyNutPujkm2tX4zyJ+zp1UAFxz0fkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
	b=Lrr8JcZ7NoSq09oNVWAD/Dp1IIBGaeJ2jowj7iqyfkRTVUxg2cwR4CIcmd/sS5JzzUdj
	 VIxqp3rn4C9zV4B0wHim+ItHrZAtxQW5Kg/wtfsM1E6fyJRzRmujcSwA0haUYIrQnUYA4
	 7zk4qNAGENiJ0gdRjxTPlYmgvCWxaJoAVN4slioTWZYG+Gec+uY2LtSbrK5U6HbP6dcaA
	 5wEH8AagyIj2j3SGCmmYYgf0oEHNFxy7Xvkc8n3tdYiycLX6vHhaDppPVnx5IXO5Mudxx
	 ravvWRRXfKBeOIchK90GH3DR3rrIiYi58o8DnsVVHv1pFfyf8AVTvxDEWrUnYgzDumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJjZSGRv;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAF60A2604
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 11:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80BAF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJjZSGRv
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so562069f8f.1
        for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002085; x=1795606885; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
        b=dJjZSGRvq8pgp9iBOIrIjuCaAYKdDr6jXImvaNPVWhqaMIW7JmLfgC8m4bUGH+CBKf
         I9BXKjE8K3ZerjY1sxDHjmi5UN8hdvNnJcq2gW8Ao54easeyrMFmMwt8ROZTyVgLe+zl
         R1ldFPxZbJD/jzNyeQ2lznAoUkHWTodrXn7oAvY/AvKFVzxqXHnZsD/j6KzmsB9/lFlh
         KtVUojcwYGXLFzEuTaQurZtwilTJTYnVFfnz7A6UCtbvIDmQC4FRSvG6OmNnwCHNrdQC
         s/1KhfCgbtQ2XUbeQ/x7j2K2kpD2TrqEReCYls0ed8YJIqljOBXyNqrVouZ1tnSy18JB
         quZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002085; x=1795606885;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
        b=hNhqYm50IflJeQAdYX+3ntcUgfws3QmmVVWMvDq+sSkwqkElnzYSscf1PnSauDabxk
         xt9lAsZJux4NPXg0nZda73BYKOAYBPyxyVXncq3VWUxBdiHd7qx3xDxzaONiS8VTT6Ip
         qe4DdW+X/vZnw+IbPjPUmA0C4CeelCsuj/T0VkjqUtWOGMY4jh5KNjc2usjAgtk3mR1F
         xrLNUbR5pMMWc47uPaQk+MwAmcGFm0ZiuufZm095W4L8vgTRu8myUI5WcgZpajCEitDI
         /mdRHT9bZ/m4EArIGuBaMSELpLRrqjYt7QO0WFLc6catfMfY2Mvbs4vPi67FDnKfnh44
         BeAg==
X-Forwarded-Encrypted: i=1; AL+hErEH8d8bu7qpLYwLgJib1RXnhrfVD5s7Ece4FmIcgzPFQvFyk6xrVQc10nR/r3czSHuhfSyfhN/7Tg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9QHMUK9jgTJ2/rjTLIKLMiBrvhag5TJK/W9MQb9kpIWBeNsUqF
	ZODEmyVWJO+WWAqXvQY2/HjCy8rZhW93g9XSL1hMCiLw2zVYC3Eq4MyEjWF4q9GdtsYqsF2CyWC
	GPN6dAEYLZiFhN5zjgA==
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:4b2:3c81:ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b84:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb7da2243fmr49551165e9.9.1795002084674;
 Wed, 18 Nov 2026 03:41:24 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:23 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114123.490870-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/3] rust: drm: gem: shmem: Do not free SG table of
 imported objects
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:10PM +0100, Janne Grunau wrote:
> GEM shmem objects imported through gem_prime_import_sg_table wrapping
> drm_gem_shmem_prime_import_sg_table() do not own their SG table.
> SGTableMap::drop() must not free it since it will be freed on exporter
> side once the DMAbuf is not used anymore.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Cc: <stable+noautosel@kernel.org> # no in-tree users
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
