Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB9328635
	for <nova-gpu@lists.linux.dev>; Mon, 27 Apr 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302553; cv=none; b=D9QUKDjcynfsbSeM8/NJxCZPic6T7e9viErG+RJSQp6nAYrKfyJ9irqBtzRocw2xAqa6X2INsaI8NnTa9+hRGFj1bTt225HUj1PTd9Iudh5wWEJ60Q1GaCx3eEwdquMm6taqf99o/M7g3IiwKawXqugv832pIXG37BIIUZLsXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302553; c=relaxed/simple;
	bh=lNKb4snvjqRMKQYaIpBcH2PhBjl9EZzLDbXz2fxIvOo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DStyjzDhOkpWF7Dgq9UzBcdgJ9BYeIFQkjUEVeOKpHV8efK8gcSUg2Hr8/M6JdGinkpEVTEXsy+Sdi4aVA3Sp5lqSyR+MHNRSHU4xtQFrN/dy/NzSKdPwWohxWN0jraCN5T1EN1mp5MYfewuhS95emIdnctsYWtY1SZO3h+FGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvmjsZCl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvmjsZCl"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4440c5944fbso1259587f8f.2
        for <nova-gpu@lists.linux.dev>; Mon, 27 Apr 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777302548; x=1777907348; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aZLrgPpUjEtLxFuX+Sy4zfRa+tymO29iiPdGcgeT0lY=;
        b=DvmjsZClucHAmayquDoMZHS+snPAKgJpAiTXC4YJ+cuJA8zi6Qv9ZwOaEqaHLVsDuK
         70nZ6AkDEujFxrcTT9zs45vaxGHh2A5K9bLtra2w7KWKz27lP+gfwoFuYHlACo16NCKf
         rGoj3ovd9HhbdDXnw4Y0KvGi0uclhheDvfciEhryq68ulK/tOixmp/TFMfFEqyKNzuBR
         qc0qcOv0JJL1qgaslP430wzABiAnl4kiO1Ag/13djX9vsHBUijqgKxlEWgloD2tFghFN
         Tv2/6KI7Q5/+vdnKnPWYkqfgNJysx1WK73GC2BOBZpHcVDeS2vKlbkZ7ytEMkFb+qLRt
         thug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302548; x=1777907348;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZLrgPpUjEtLxFuX+Sy4zfRa+tymO29iiPdGcgeT0lY=;
        b=k4jaEv+GExX1dtOMblKt5uyk1zrEw+F4li3CtFKWI/dMoljUQlYTewmUx7dylh+LPW
         DQNuiXpGoI0sys8tiK7pj8E2+lyD3t7nUtNRAvhFGX8fTOLItp+DGv43yR7EobPTlvub
         Fp3WHgG6qiO3mejgS+LMyYB7MZnsJilSWASo36KDMc40pT3US299t5DJUWrOBXbPZPyC
         az86qp2kCX1v4qd40W9rxPch4LZ0m+GhWL+j+S2BRlyVxIrrMkelkhH8PjE6TKmK9btG
         apSnZA6/TfZRzCmCo4ych0bWrQOUo+923jKRmWey8AOzAa1PTwZLaJ4BKqcjzVmlaPtJ
         u0pQ==
X-Gm-Message-State: AOJu0YyNHafGMZnunmvFAeJi4khTxPtSiScqJuEcPBpcme0w6+Xbsj/Q
	jHBtgYV2xceojXJEx5gdj0uLNAyOhUgyKu5HcX5e+wnPOQS5nefHArpt2csNlqPfT4q5IrNp5Bg
	Rqj3Bs9h5b4uc9d48UA==
X-Received: from wrfo12.prod.google.com ([2002:a5d:58cc:0:b0:43d:7aa0:a21a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f43:0:b0:43c:fde6:212d with SMTP id ffacd0b85a97d-43fe3e13d46mr67938941f8f.33.1777302547448;
 Mon, 27 Apr 2026 08:09:07 -0700 (PDT)
Date: Mon, 27 Apr 2026 15:09:06 +0000
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <ae98EolO8LU0rZ5R@google.com>
Subject: `Option::filter` in nova-core/firmware.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Hi Nova folks,

I'm seeing this clippy warning with latest nightly rust:

error: manual implementation of `Option::filter`
   --> drivers/gpu/nova-core/firmware.rs:391:14
    |
391 |               .and_then(|hdr| {
    |  ______________^
392 | |                 if hdr.bin_magic == BIN_MAGIC {
393 | |                     Some(hdr)
394 | |                 } else {
...   |
397 | |             })
    | |______________^ help: try: `filter(|hdr| hdr.bin_magic == BIN_MAGIC)`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_filter
    = note: `-D clippy::manual-filter` implied by `-D warnings`
    = help: to override `-D warnings` add `#[allow(clippy::manual_filter)]`

Alice
