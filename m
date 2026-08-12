Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C62D94B5
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550931; cv=none; b=dDyiD1F+YdTpu9Whvg7EFIWi8nCG3OtjV5QrthTNtfqf0/wZaQxk8a3gGTlqfu4CbU5MRI11Yi1GEXm6ZCeAlYwAngQF6yikeHx8dAuqwnw+avauTziO76ZCET0W7YW/msQw4pU1S45rrUsmSzmIl8zN45s0YP+nBcKKixR1q2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550931; c=relaxed/simple;
	bh=oNJRftlCpqAuhIcSsEDeWbYcn6HY6cIaqGW1v3wUJm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCSFB0iyQ7dskkcknxaREAroDxk0vMjGaJvkzXOEZWvAAnBysD4ndcKShhlCQtFe2pHDFe0vHq31y1W9UFAmF3/nVK7hyyE7lBUzRLDAXer5fXARfdqEbW3Jg5yvyLyZUfscKBVP8o4CaiJ3oKn9QR4WHtjBadyIwECT/5PVZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHmffQ/n; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHmffQ/n"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39db07589caso10974281fa.2
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786550928; x=1787155728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNJRftlCpqAuhIcSsEDeWbYcn6HY6cIaqGW1v3wUJm4=;
        b=NHmffQ/naHLutJeWZVRdSqiK9jV/UbVr5FzqJ+i52dwkBOLGzPeSqjPpVJ4gixaT2V
         ZMSr9Sa1hYD3vj6mMQVmx7W9w+D95BEWgTDBaplAK8TMQZ+lAFg0StsQOkFXCUwxFEbI
         r0MJ+wC9yIEen7AM27IgrqV2dflN+QekO28iPBKFxUjxppfDsDdFWTFTVTosyjLAs7uC
         VpDlBTCGx7aUQCXy7/sWaK+SPzUCa1qGDFFo/bkpAZzxAnm5q4o+OU5/bf8QYhQq4XDh
         /lDYuzEBffVmOgTadArHwnfV/2czttglHdVP5QwavV9cVaXdLdtrqB4BVSxMj2X3B+73
         Tc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786550928; x=1787155728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNJRftlCpqAuhIcSsEDeWbYcn6HY6cIaqGW1v3wUJm4=;
        b=ATjqINWFSY+qZxlvvv6bWBZxMD/6qmpPiTrxKceSPJsG98LweytDHcFFopckKAH5Dx
         AQud+rDJBYkk9/kILhn67VpbWeCgjSmnOghMPJJHXgMkwnoloGDq8nnQdGDwoqlSxdvE
         Gk0ZLTNEt4qRH+n/SrSXu1c0JSNNi3ooVtsU/PCDge4yxVhOYR9EiyNo2oo/cn97/SmR
         O/Z6P41jJUHzLMo3RZJMFWn8iOKa28H/0xBv8kpegmLI3kYNaFJsanqGkFFMkkbudLkm
         0Gxcib1IG4fHumzUpm4UTmjzV5V5bRu2Eb6SI/eVRqbBziz5d1zYdM+IPGx9CsuzSnNG
         A4TA==
X-Forwarded-Encrypted: i=1; AHgh+RoCaJ9HrzRSDQ51MmWEPcs5x5NfmncBkl1A8HoracHCCzM7szwSnOhOPg2FIVxN6qFOchNm0y9u1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFIMT3NemXnzhnI2Ukk1BQL3E/B8GoihWancAlnpA3bFTYcuOF
	N9GmDWn31GPBzq/UY3bh8ksP5/gXklG8cuAX6DjBbFU+Ccd0IWgdi46Y
X-Gm-Gg: AR+sD13AZlhKv2cZy5Ph1NnkH/fN6G8MGJMmv4XwG86tzK/B8LCqGeG+rniPolkoRK3
	VwHo5o7vLmiRSjf1/E5aqv2C9+FNh0RQ2VZyHcnt7WC2BQp8dTDAAg76axFpphNTUssXfx2zE5m
	DuKw3LPP1BF7NNSBliURmrz1EZw04DQ+V0p5pIdu9gpNNPbWN1Kyzcnh8RW45syDmZNJ49GLNSx
	tA+piepQ1hTJLGGGE04Upxpms0NQsP+jQv7LlSlSAHeoEnX9pO8aK/DtSi/wGXGTaDNbvvvSTkD
	PYuQ9enz48YezW1slsk9R1/hhlvMTCBUudm2l51K1w79iUFXLm4T2XM8KaP7fs/PBjNOY9/kPdV
	zY2N5Pq9CP6B+irI8aEVEG3xWMmkNJhxUre/1IDapJt6vbeHBB3x1O5qQMgqA03A2Q7bSjo3KCL
	1Ed637OeX6ovbqfL+8/xvQvRYmCm/jqSiwZSN0kjyyI64cwxzvuc9AKaYi0MReJWHdDwM=
X-Received: by 2002:a05:651c:50b:b0:39f:bc94:eb9f with SMTP id 38308e7fff4ca-3a10d575723mr7410061fa.14.1786550927596;
        Wed, 12 Aug 2026 09:08:47 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1084da93esm5290891fa.39.2026.08.12.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:08:47 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpu: nova-core: retain the GSP-RM log buffers
Date: Wed, 12 Aug 2026 23:08:45 +0700
Message-ID: <20260812160845.2017730-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DKN35E0L9X9L.RSVUGPFWRV69@kernel.org>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com> <DKN35E0L9X9L.RSVUGPFWRV69@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed Aug 12, 2026 at 5:54 PM CEST, Danilo Krummrich wrote:
> Unless you already know and decided against it, a firmware archive containing
> the compatible firmware for the current tip can be found in [1].
>
> [1] https://github.com/ttabi/linux-firmware-nova

I did not - I only found that repository after sending this series, so the
older base was ignorance rather than a decision. Thanks.

I will install those images and re-run the same checks on top of the current
tip over the next few days: unbind, a probe made to fail after the GSP is up,
a second retain for the same device, and module unload. I will report the
result here.

Beyond this series: I have a GB203 (RTX 5080) here running nova-core, so if
any pending nova-core work would benefit from being exercised on Blackwell, I
am happy to test it and send Tested-by.

One last thing: English is not my first language, and I use an LLM partly as a
translator. If you would rather I did not, I can write these mails through a
plain translator instead, though some of the meaning will be lost that way.

Thanks,
Vladislav
