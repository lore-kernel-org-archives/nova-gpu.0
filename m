Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594944DD3D2
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158892; cv=none; b=JVyy9A9zFV4xlpVxBYtQabua9+G7+nCiwe70tXP2YmhfQWhWSLE323QbNIJ00XELC60Eyl6y6KPCKLUq0eI6G1Z9yRRRDoPO7Wf9qnBMDUV9vz22HMD/u2lovhqujtiKz9N6hLiGfVZPWkKczhrS6slVejVIXxwsPz5Ncla0jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158892; c=relaxed/simple;
	bh=MtJ0ik1ndDavv9Uk8j5nIXbHkpxx1+MX3cuEVSVW2u0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ibyYlTasQJBVlPK991O33s9BOutkk4465CqjPX26BOgjrK4RfaewemCme87HKkFlx4j1ykbVp3p+iT4weC4oXMEYmRNyBPA5ib+A8ue1dIfwCJpbLpdKHHqZWslmBSG6RULSrwzWWWCHo5hn7iuWQBRhGL5mjU56VZsgXAigvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgRmnDFg; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgRmnDFg"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1af80b913so41010595e9.2
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158889; x=1792763689; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=cgRmnDFgm6p0AjE7KeJg7iYOkOy9WpMMpltarecD3RM9C4wo8GbcGP65F67etolceq
         Kl5CpPWBvp2N4/7HgT670oWL8khgoXm2B1R+97XLKBlqhfXMkk5a8h7f9NTxDTVrvCmJ
         qkS7qmdeuvSJu/zDJWnbARch1rMb+YbAbKg0L124WwcU78zHbfTKyCM+5yBTYYntvnjg
         dsHqS4Q6vSHNDtKAHpjPkq17mez/C42W5uYWc+DiTSTRrw6gMkDksIXYwVUZbLsVjdoC
         67XROCukGlycef4Pq3tIjumagDkx+RQIMJBQnUaxp4cPQIQ3hx2eYcOCTs7PaE96VhTV
         Fa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158889; x=1792763689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2telF00vVM3XLDo3RDg3FI1UZeVzx7pDk2LUXQEFH0=;
        b=GTUohUPGhh8pz8MVGBE7W3HQz16vXfNfQsOmPaClax540uVRnHTSS59rf5d3pwMF42
         dnYOq1N6lXN365KpJyjBPVAwxIF2BHPCOHcibaCTr4D3o2wBwueznI6yr5ZgXB+d0nJo
         qIjrBYmF0mI8VF84uWaoAdt+2im8LBLHosrGGjSlPIjGOyGblJE7/jUw46XiaCYQ+UMK
         gkCF5hojisf6XVTDCn2x1e94o/51C+tlckoW6j/3fhBg6eolETSLZkokXnhXp6lxIXfr
         GZZafp3082Z0ON/2m7SFbr7A3fUJaK86VhSNKwfkTuMrqimeEJa9OIn/eg8aHvoeVRig
         ZwOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeawMcMeITMkAaTipJHmCIRGr+zXHxtR35o8TSR84fmBm4Q40DQ3WqiUfcmRvJjkkNE7b3+Upu/A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIrcoPndp8d4mURjOPkS6ZMiP6JroVmA13GLOTgeJM24KK69qlh
	Fz0vCep+K6TjDtUPoBl7qbsEoNFlShjU1X3dRiamSgf5ugfLMjsFc3n6uEFueZ7XoTVC55W13Kb
	amvRq41CGvLjW7ksDdw==
X-Received: from wmf1.prod.google.com ([2002:a05:600c:2281:b0:4a1:91fb:4150])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr415823135e9.15.1792158888314;
 Fri, 16 Oct 2026 06:54:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:39 +0000
In-Reply-To: <20260814230923.1292966-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-7-aliceryhl@google.com>
Subject: Re: [PATCH 7/7] rust: drm: return impl PinInit from DriverFile::open()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:05AM +0200, Danilo Krummrich wrote:
> Change DriverFile::open() to return impl PinInit<Self, Error> instead of
> Result<Pin<KBox<Self>>>, consistent with how bus device private data
> works.
> 
> Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
> return an initializer and the subsystem takes care of the allocation.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
