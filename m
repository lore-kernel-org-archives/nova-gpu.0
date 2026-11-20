Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168417;
	b=ZioRncCNKccvR85o3IiS3J6Zeq9nA18zcKEkyDe3slh8ul/bNrFJMoWsdkoywQwBy8om
	 cdU/kM6WrD2rWab0Ea/C/HT+8/KUd2/vriceeu0bNnl+1Jbyd5LEwauNRedIs1VdcjmIK
	 aFtrh0VaWXglycR88X/3lJz7bES4J1LcqSRCS151uIE5XuCE9S+k4CbVBdpeu4UGykrXF
	 Sgm3VCgfKAD9QvqjXZJTBVRaz6Z27ToK2IvqG5vcMBH1WpXoOUL/bVM4N0jzFBprtiKYk
	 AdJy6e06LNjWQUIxl3HW1EF607ouLKj46F2YyKZQKdxXNITPbDPnitID66J/oCoulwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
	b=XDCGKDhaXAW5CW5HB4fwZyMIYiAPtHID2Pvm2SXKTQRwSo0pWqo+crSIm/b3G0FyYLmM
	 tP6M5xaAU8SvNmLxi4Dd0WoTxAFcruEvjpF5Qfi5ZseqGf1nxHqs5fsD7FNRz+H0ZfRzL
	 I9RC7PwTUUmso+0Ig+sKogKZGIhLgQE6fulmEOKtvCaJPf8baI8446lXApJVXRWKJfjKA
	 ZWbvHJ7bg+eWa7biof2HNfcOkoyAF+XXMytO8egiHOZXrwYoppFCZj9Mkp7RWn1pGado/
	 6m2U/yO8Oh6mwSP9ltp7pA4en+1FK8KXxohB+EkLoBXCrsL6kChas+sPiUQgVe+zeDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMobkgpZ;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9E606A33D
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 09:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB9E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMobkgpZ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so4780465e9.2
        for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795168414; x=1795773214; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=OMobkgpZIieE/adI/7aK/fwDuDT+4J18ibaZOwsVbqz4DBnjN208TW1UksHAAAlusX
         iB3m8AigJMuLymep/V+jtZiDUWoBxAEwWS80DQLBiGuII9FxKfyjAsrmGUqnwzqRfg65
         cR+W2OI87QsfW1A04T+Xea+udwe/+MJ1NzrwiY/nkNxjkUqkJvRD3LWiIoapuS1dJtY9
         Kc7V2ztoEjv0wVAW1tQ5A5eYeUk+Q8vInd5V2AawgcdmtnehWjbg1Ov10rglX4cwCAMN
         PtQYJ6oHU6Kpj58JdPibeYStR6gPOOn3O7qRUB5/NCxnHrsJGJezvHIyImqgpvsLjsms
         UktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168414; x=1795773214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=wu4XD2l1NR8DQYC8apjkAJwMDlsl3SWIX0C5xJxlovieaLFF8JR5RKufdDk91MfoPv
         gOFghjUKU26SY9+PdrrY/RVbqNoCglVw/obBKzS/bmdWoNAUCYSGUDOzf5dGNSFXO2xw
         HN6jLNDl5+wxGaQDHsdKKxFnCFUjkcovp9EE7If3BRqLrv1cNmOB5jGiTROA4tyrDfRe
         7MqvN76RNHwmO45siy1LVcJvbAEh+BUVn7rXsJlVKrgHhbFlW3ug48XwYr4IhG4h7zeY
         EKnnA1jZsTMKmpb18Fdd88LDX86+G1pmt9Dt0ZfW58Dnvqx/h2p1B3qSXg6WZhNGVAyE
         sXwA==
X-Forwarded-Encrypted: i=1; AL+hErEgOY3gCYDud4PX5kyNG5t9BuMmoaueuEn27k8zuC1fFSSMwpqSGTMaxLLK773M5BrDTmtFV42l0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8db5SVUvOXZsJQJT362zY5U/bcljIqBLYU1rmpBHj3eBskfTa1
	lVoRrV8e0AhCuZQntJZZrolfTljhVvtEG40Xa2SUQ1DoadDh4ieCS9L7SOIH4Co/9o/1pr2wx6C
	+AqjKtORS13h8W5BMrQ==
X-Received: from wrud2.prod.google.com ([2002:a5d:4f82:0:b0:48e:3c17:c059])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4c:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb88807dcemr52539295e9.10.1795168414195;
 Fri, 20 Nov 2026 01:53:34 -0800 (PST)
Date: Fri, 20 Nov 2026 09:53:33 +0000
In-Reply-To: <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net> <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
 <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120095333.2135217-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	simona@ffwll.ch, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 06:28:07PM +0100, Danilo Krummrich wrote:
> On Thu Nov 19, 2026 at 12:49 PM CET, Alice Ryhl wrote:
> > Good idea
> 
> Indeed, what do you think about this?
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 774db3acb15a..8c48dcfdecec 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -158,7 +158,11 @@ const fn compute_features() -> u32 {
>          open: Some(drm::File::<T::File>::open_callback),
>          postclose: Some(drm::File::<T::File>::postclose_callback),
>          unload: None,
> -        release: None,
> +        release: {
> +            // The DRM core frees the device without running a Rust destructor.
> +            const_assert!(!mem::needs_drop::<Device<T, Normal>>());
> +            None
> +        },
>          master_set: None,
>          master_drop: None,
>          debugfs_init: None,

Looks good to me.

Alice
