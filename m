Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618996;
	b=arGMchNBg1Wh0UzroFePxsolZodDLsY9iC5PGuJhRgE+Sb3gD3LZkRS9EDXUilo/K4nH
	 bObIIfxP47ji5yP0O8soaRf/gLbaJYNnpegKK/MYbutMI7KWQFLJ13e5FDA9S/5cWMfIr
	 v+1j0fFP90nwCImO8W9dcLli9c2GLyVmOzhxAsyFkKqIRhzsuEzi0XDhhtYRq3AWdPQIB
	 y/MpR2sCbpru9qxs57IWBxdtOkuhhJ2LtHHwc3NHg98VtQ6AxI5d/+wbqZ52/+8YawEgB
	 tZP34Dz3zIxMqRZoSB3dBHrWjJKQf2bvnjms4hREvi1CXm4detDOeoCGq8EBNdQcmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
	b=QbCkg7SEN1DF8Da32VjFw6jPJ2vGH9yStm/A2kDsfMczwhS2AIcREy23DKNiA5s9WZ1m
	 cxYOQdJRse+a4dqeWYfQOiAIhXF2Sv567CVB5Rpiu5U0Xn7051JZrhAySHdPGxdXz7AdC
	 UEJElvUN/zQFwKE2CqfZvIDyhDqBM9nka/LGBDUQl8/bM/JUKr/Z674IXpgYhfqFrlbh8
	 3RrCfQWW2rcyN24o6SEDtsM8yLMb4RLM0auMoZh3wa4eEgs8ppeAr4adgRQyuBxxjp7li
	 PBQw4b/GReoGIS4XhEkdrktRLz2CiCBZJDl/dh2od78hIcjZ2rfoQmXu7DH0KI4glyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p2sFB7yj;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C75606A326
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 15:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C75606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p2sFB7yj
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a370217dcfso5463178f8f.1
        for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618994; x=1796223794; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=p2sFB7yjmhON8ocg0CrghBTsPWDuVLQ6bzV6JncPuKlgss5hHYM+tsuNuGONK9aw61
         o+1L8GyqejM+uJDAyoMg4bQbJN1LWLdOuvriDpFVaKSWJjzPHioTQ+q6RisRCxRnjIhh
         QOj3/zk2BClU7cAiawqj4pnvdhEdKOCYcJ5G28ymTa4lL6+v4iZX+Atwg6HqMuqQlxPR
         ysqV4/NN2bTWKRr9X0qWjRcFn9Lv6dxBzgpTgrDWfMDnoAasyaJtDWK4eHIUiA8OVjUe
         nmVAF5nX8AJAUXO0W6k3G9DAVxTpYT1mUCyW6UajXer7cjtFgg/bQ3RH3BNlUtbjVDkU
         xyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618994; x=1796223794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=bLGtNftFdGgFqpsyCK/1z3mqkRY61aH9BH2kVCpNEi4+rpVFN/VEJNJ8ZdD1lG0/4K
         sEx926dc7rS9Xk7Q3xDT7caweo29esZqt8WEzY+6OTE+OSm9Lgrp+biVGjGAMMNNEFBv
         YRAYlx9/frb0sDVyJJhxXE3pu3sv4XyIaFXfI4PoTZb8PA1BftYPHY2B7mG3ftkNgwVK
         9sYG78KT7tqE5Cex2/BgRxaTplkQT52BJcgCaJOkG3DC2079CFoCpxLcabKqj9bGaaRR
         V0W5zI5EEvuHyI0o9XTGmPbgsBgFbnlrL2+fK4ouWHOD8Coop+jcqcYmeRvd3XdvKAhn
         JJaQ==
X-Forwarded-Encrypted: i=1; AL+hErFV6kzAiy9vWjGIUQOrG+uaeHgJV18gzrlR5V++3zyJFeOshPHucU7MRkAklf5+OVLH2ZvwSsOp/g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3R1GiqlkMcjdFr5qcJGQZGxW/VYcO7W5E1UeL1vCZH5RLfoYX
	fiRVA6fzmJKr+2kDIAqS1XQkYcIShiXk/+6kaUhOwtTCa9ete7kVoEsyZe6/09x3JFx4y6O9QcF
	/4vvaA7VIT/Q44a7a7w==
X-Received: from wrzt4.prod.google.com ([2002:adf:e104:0:b0:4ac:99cf:5a0e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29d3:b0:4a2:6542:989a with SMTP id ffacd0b85a97d-4abb4b85a5cmr21029290f8f.52.1795618993824;
 Wed, 25 Nov 2026 07:03:13 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:12 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
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
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150312.1587642-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 1/5] rust: drm: gem: shmem: Do not use drm_gem_shmem_dumb_create()
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
	nova-gpu@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:43PM +0100, Janne Grunau wrote:
> The existing gem::shmem using Rust GPU drivers (Ashi and Tyr) are render
> only devices which should not set the dumb_create callback. When a
> driver with KMS functionality is added it probably will not be able to use
> drm_gem_shmem_dumb_create().
> The Rust gem::shmem::Object<T> wrapper should be allocated and destroyed
> from Rust code. DRM drivers have a `gem_create_object` callback which
> could be used to allocate objects from Rust. The C code will "destroy"
> objects with `kfree(object)` on error paths which is unsound if the Rust
> object's DriverObject contains fields with a non-trivial `Drop`
> implementation.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 80df573af9ef ("rust: drm: gem: shmem: Add DRM shmem helper abstraction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
