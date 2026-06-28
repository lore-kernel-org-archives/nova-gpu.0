Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12492F6911
	for <nova-gpu@lists.linux.dev>; Sun, 28 Jun 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782670970; cv=none; b=leyU9hyb/976hgYZWhaxljJ8/CMkj5odnK0zQOYgDSrmidtNtlvauX2uSuQuhvwOUIMGVuEVGeOJTCLj4veqvbRbRqQKHnB6H/Q0Z0F9z87bGjjsYnL05hnFFfwZEJL36x2WI0Lxce5Yfzg0Uq2vw2Uk9kzbx6JJV5+icW+1NjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782670970; c=relaxed/simple;
	bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3Y6Ss5QSppKnsaGH6tzzta1vDEXWmQs0liwZ0dXcOL9pg+Su4Oc7isVZB3k5Dyjwxf4xYz1L0wWU85I4DfpURcrgMqwr32eV5e2960SJl4hOEJxbAZE1n/4exVFmuMq9I/4bOUXgaqBCZoBQ01j/Xg5j8VGr99UyQcRO1ONQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JygIFmjo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JygIFmjo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1084266a91.2
        for <nova-gpu@lists.linux.dev>; Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782670969; x=1783275769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=JygIFmjovCFvbmuKUejeCytkGwXTlX/oDC3q45OjMYBA4bQvY9fhCp/2vJlPm09FAz
         JU7qrjmp2Vu0JHzF1daYiFBxorTNarOdKNLuofVwkSJkhdatgdDu9TSYWKpHUV6HbY7l
         is8T6Ii6yzSE6b7Nh1OLaG65KSrcTijbuCxDNA8B7HHUUNGF5c5XSxEvc8Yt2q4qOTl1
         Q7hjMhY+BsGPB996Q2vE8Y8w4oVclrB6RFVBudQHu7HMGUOw6QZV6yfSTvDMw6QjFQj5
         lbY8eqPsspbbQw4gMn8acwzPhI0avF72rQejy5fBxwnhR4mPvk6vl9mlYV/I7PijB5Pi
         Wz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782670969; x=1783275769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=akKKGPwjJ04dB4+lghVlCZa2iUPjdwnpnXeLm4oSy7AinrcqGMSh/5ZRRXj6ZFNum1
         G9AkNQ7x/q4kEf5cSAgHu578LZrxtOyur7PLXUcne8s0pVXruMreqFqhV9IOBQJ9Vcvt
         QaMLxY5c0U19Hs0P9CWtVQ6oTcmhNmKNIVlqUo1ViVgsdmQF+wSIhKgjqjzJdLqUnh7P
         8Kb3fMPTVXTjJ1ZPPvgkdZ9iPfJV64rwJewO5fbNx34Ea/hPXRjcAFK8977eMsSXr4bO
         FPyDlDOFFD4WQulE/xycGbH5VO+YhACWUfemIjIxv9WJ8H6EdVpzgUMQLDeHX3DLq04O
         qetg==
X-Forwarded-Encrypted: i=1; AHgh+RqbUYDh5LlcYLiZCuE1mR+ZBELTLKfyI9Red84hlmWf3r5vLT9Hy00S+UckpgIFhu59CxhDc5mp5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlaMi7Cwuz/bUdHktbadB035Pno77bCrEI2Hz0GyipmuVxjNhp
	Ghn5cL9hdpDa7+vRFRXyFNXWp3zaCU0OT2xULPKTAQrj45frf5TKSnxL
X-Gm-Gg: AfdE7ck/kvhEKY79z9d034cguG0G2tQmWHFhRHoiRTeh4hnUxXJww7/ITgkWr43RMen
	GCsfBbCj3gxm06xRTqnfmGbD7LatiGLL5ULuKiBT0p+lzzxLBnH8zo884k6kcY5ZK/94Ym2Hg/N
	bPN5RwsVsnahzj+i77xgrYFTAvELfO9+fv0a1YV9wyxe91vmXbwEZj5Xdv277L2ztbiAe9elLQG
	yQqb8g8nreoBjGOeRqH2JSt0nG4U8QklObwqUi2oQ4PPBQnddJpoETEWkJFnOnBWnGwHix6R2Qq
	e8lso0ehNWaL4Npmb9MWM20TErUXcPI2CsNXr824nwSLUM7Bw+kRgkODRHObWAmQUo6Iu6UFzfk
	c+JOXu/b9eKL3zM/W0AaCUzz8xpo6mbpYtik/KnIOY0tltp/Yr0SHzVF+Uoatn9Xw93vaEeq6Ep
	Jsh52ebWEx7ITp1UOYO6CvD5syDBAmUBfBn51suD8sq9C4sdeCb540W0j1eiTgZG8wkVdJcYpMJ
	8NB5uvWLdZ4FwY7ahoSq+5Za4NiQyikEG2ccQ==
X-Received: by 2002:a17:90a:da84:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-37fa9151d83mr6068848a91.19.1782670969047;
        Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
Received: from libra11 ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ffdc238c8sm781779a91.6.2026.06.28.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:22:48 -0700 (PDT)
From: SeungJong Ha <engineer.jjhama@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org,
	dri-devel@lists.freedesktop.org,
	acourbot@nvidia.com,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	SeungJong Ha <engineer.jjhama@gmail.com>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy via the transmute bridge
Date: Sun, 28 Jun 2026 18:21:54 +0000
Message-ID: <20260628182154.712621-1-engineer.jjhama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172200.B116D1F000E9@smtp.kernel.org>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com> <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com> <20260628172200.B116D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is pre-existing and not changed by this patch: it only makes
explicit (via a checked `zerocopy` derive) what the previous `unsafe
impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
layout is byte-identical and the message-handling path is untouched -- so
it neither introduces nor addresses this. I'm not familiar enough with
the GSP threat model to judge whether the TOCTOU is in scope here; if it
is worth noting, I can add a TODO comment near the affected reads.
