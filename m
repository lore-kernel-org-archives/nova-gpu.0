Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618997;
	b=YvGJyzadzmuLXvxCx0N0YhYlpqJWnk9q4shdD3ro2TYOO1p9LchQVXZZIo1Ps7tJYWDg
	 8yTAFGn6pNFt2hSa5A7PiH0eagtuPZ0Y5O0pc11yVLjQ2AtFGrpYoXThV4bYQL7WIaB+2
	 D4uecXyJ/YdtdiLivAdkXmrvq0XrxY0PMXFy8LPuXz0E6rQrx79vToiYsTVNNKu6L/I7d
	 6RSGfyiHor0vipKK/QZ2A7AEApk804Xg2ySOz42Yvs+DBAga/t59xd3fLLJJRnRVZVCvs
	 WDMKt/HbW/WNEBxYzIqr4v8VDxt6v1Ggef+DRKcq4nOJKKywSkNOVGgJ/uSfeK87NYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
	b=3qf0RGrEJEiUqswIHZtN9RzMxVvBJ0mMPuX9J/5BdEajuKtXQF1/ZrjWF0bXbBOgs7q/
	 5NqNGrV+SkAHGhG7AV+QU18PtEOzPf4l4zYuKmfhPlGPKOMFbqKXlWcEGn8QK3yHImfOa
	 FDYI+mYtMlNMH2c9rqSE5400YOBLU3yral31gmwWC08aZs4jjnG77jPyNIldPzocddOTE
	 hPUl6+i6k+K8h64PI2RMgQXUwtU0PQlZbUFYnWbvtHAS9RYP8gTeBlqcmlpET/vH3Fgu3
	 oeTw58Fcq82x8Ne1Wwwqvr1HhLFNOobErV+lxsXpdM+3Np7c6V6IEXT2ckk/niKA35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJbjOgpb;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B1606A334
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 15:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6B1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJbjOgpb
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so49208705e9.0
        for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618995; x=1796223795; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=IJbjOgpbSuaIQOWHrCSkq2DhGgKAoh5FoqEKC8Ai+xxxsKueyE45GNFwGec1vYYGlk
         v1qtmSBBtkCR29Ix2Iq9HTr6ZAirx+EWDUpryXPNRSWYtMMi43A5+vSlxd9WQSqj1Xmh
         oj/o6vmZGkmc4UedvLpvtuCn7Y3vIZQ+ys99NIX0y3PE7NLX4UZvwTOWlLBKdwWqjeio
         8olNatkj4HD6h0P+5U4kL1T4PXutzcubr7FiwdkPcnKAxYFJ9shA/DDSRZD8LOUhy45r
         yYL5Ymhq+EdB6aZFN3EgqK6yNfCCbwdqaXxp/ahFgWE1CZdZLXxYqpaWFX51YpPtnbSo
         +2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618995; x=1796223795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=hvX5OPqNMG+b4jdiAX7IC5Nm0X6U/lVNOv9UNWtWDDQOYEUS1G4Bn6x2U+5TnQcBCz
         IwSV5/uGQsxmNl5oXcyEzigA9tF/qayLZ35lJ3lZu82Fc0p/pyBW4e2DodVghQAdmhkD
         5XRA74CyEPL6faiwZAynp4oi9p3DdXY5eGTZnnMQicwvrQqF5pb2dO8K0kNS8siHj2UA
         bPdBiw36Jqk/MFvd19+KUPV6btRd+NxqSDdXhUmoALcKXejNJbBIqPgHMQSEl292mA/A
         bEtc0C5Ewszx+cwnGTP5hTx9JX9SZcSE+QDUADK7xg74I9tPPPjROOgwKJwqZ0tjf2cT
         QNAw==
X-Forwarded-Encrypted: i=1; AL+hErGYXh3qGthcMA70XDl3ScxugXh8FfOdB2ZNk3FjnaOaaozUYxLPqlH+AXPB0vNS9YMnL8sfKZ3dyg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3EOkyb0qiXQdZucfNPns/qLDE2o/czNeRDjtswnFaHIRB+GrL
	YfmPSm0150IAUZdFSgGGcGc9C/T5jU+MAltWvSTZexkrqAGbiLy1EujYm7+tcZBKdJHZ2Bm9524
	eQ0iQotSBvurZ2cOPew==
X-Received: from wrpy15.prod.google.com ([2002:adf:f6cf:0:b0:4a4:8614:8907])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb888251bfmr350875475e9.14.1795618995334;
 Wed, 25 Nov 2026 07:03:15 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:14 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
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
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150314.1587795-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/5] drm/gem/shmem: Initialize private objects via
 drm_gem_shmem_init() too
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

On Tue, Nov 24, 2026 at 12:37:44PM +0100, Janne Grunau wrote:
> Rust drivers need to initialize private gem objects when importing
> DMA-bufs. As with regular objects the ideal way is to allocate the
> object in Rust and initialize it via the DRM gem shmem helper. Expose
> the `private` to the exported drm_gem_shmem_init() function.
> 
> Link: https://lore.kernel.org/rust-for-linux/20261118114102.490384-1-aliceryhl@google.com/ [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
