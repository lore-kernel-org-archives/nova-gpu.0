Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002083;
	b=ecVOcqAFG01nft/bF+MRoPm+oxKX+2IRBGjAcBxNBYR2rNl6Fqcuc/JhbJRJW776XAG3
	 ep1jrc+5a3OIiAbd3jPBdt2hWjANaZioG6lWYfj5Il/TA26XNurrCAMMHV2OTUhgbzynb
	 ZXrozTaCNnyY2WklsfjOwxx3x/hKfWomeHB3mOyc/Ip9biqty9jT00QN8f4Js8IQaoBPb
	 YdER6+f7sOpHtoCn9aTeUAC0FYP4cHxnB9v3nPCcT7fVhURTAeZ9cx3fEgKO2CDgoNYpy
	 wf8iV5zXdLb/ZnojBwVJL0MmwpvytvCfLSoKeP3yru7YsW9HuUptPZH3hDnuIelKBUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
	b=p+jnkN4RZip7twY3t7IBTSqL9L25YdXAvpkUm+3Cb/nuCJ/ujLgGR5X6H0N0brmt5u2t
	 IuxMVgy5WezgrcRXHAk1m9TGOgwPxc62DnVcDuxxvvb7zlwq32OnqpPTeSfRYV2zvLasr
	 zJyZgIVBOEADR3TFrRVweCpjaaxLq9Uw6eytqm+lPLHbLS2e9ekxF8CnLuAyVT1GhRrcC
	 icJPlMCckLlshR1VaFrU/tQEXRdERfFPZLm0VWOWAkb0/NPfIDtyw+RU+9k1y9nqEakWQ
	 iCZgdxtptQO7OVxquQA85SzgZfgiyGa558wbkylWcN+0G9fFFopCb0dzMLST02D6IxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PCXme4Rl;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306AE606A320
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 11:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306AE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PCXme4Rl
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49205554e17so586326f8f.1
        for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002082; x=1795606882; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=PCXme4RlIPJ0VNSRFLFOKKF3U5v2WlpE/3o4VrncJk6stEs4AlU6NOy44Rb+fQA8vE
         KXR72xGk4Oe+q1/5k4N8rIwS7ZBEqV9yXS7Db8gXAKGViKrkRvr+TByL/AUTPIbvJ6jZ
         VVsK1+6zvFXzKEtRBnaLwOKP+E9ceeXUlL4o8BqqB55j7ImRY3Xul/J3PnMQD8IbqS9A
         knMyGEAUtaI8m+aUwIHhfmJFnngUt6usF/iCIsjaNZ617LwUycZZZUGoFvVJMW3dfIsY
         0EAUl3OD6jUxL4SIxbTP0BS+pHgp+jpNynUXzRfmMQLK+EenCwymsypLOUaDHVcSO98q
         /3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002082; x=1795606882;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=zEL4KopcbJ4h44nD4ug9O2hgiIkrNPk5spPZeD9y48XgKuWZtqSH9aomElky0wmwB3
         J9NoF7ED9rp56s0d3mDnEe1CoMyHMPT3rz23iA8q4ROc/UQke0EUPtYFu9Jlm6GasbZ8
         29kHNzAesOD1AMF+iPutWY0yRB26nR1bEvxTJd6VrxlyKq+g69Ri82wTZczif5VaD38i
         VDbQogFn65X3C5OVn0MW4nDrRz3FQYInsaJegVeAa6zFXovD8wdgv2aRDUxyp22zJNEy
         X7+xLFdtfusGa7t3YyFFCnmDCIATIldLDCApMvTEfP9BtKaU4SGlsU8lqP/n/v2JHvzN
         6jdQ==
X-Forwarded-Encrypted: i=1; AL+hErE67pOrSMKbmdPMncRrSnyhq2xQ/IiS+qkqqUxtkT0Pg20FzoeQPm4GLYnJPJwmzFuOXBVQV/id4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8jkrUbZ4D0jZ5uX3uDxw43TWBriCSRzf2PUb7bzsfDo1ptnKSB
	5hNZ9KTydDXsFk4jNeIgj7Ej8VzAoz27iLBDXeFQNcnQPUjbGiv6u7Dw864m2Fl4SD1N/HPZr83
	rbhvwDf0IDt2sjTP6Zw==
X-Received: from wmix22-n1.prod.google.com ([2002:a05:600c:e556:10b0:4a2:11fa:1981])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e56:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb7da1b40amr42014765e9.13.1795002081244;
 Wed, 18 Nov 2026 03:41:21 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:20 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
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
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114120.490722-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: drm: gem: add an is_imported() accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:09PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
