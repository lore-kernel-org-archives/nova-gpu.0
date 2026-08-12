Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C779B3A9630
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536372; cv=none; b=Dfe6qcFs7CvrJaZN2hxJiFIhgG6i/SfjO1d7a2mhwPGR5pOoc0XctrSWFIDm24B7mOxAzTdrlht9t09WDwFO+lybIgGVFeQZ3ZIOEF2V31+AMEyYcvCudkuxUewGmzoc/3BLBzEmWDMVWrSBuHxKR5ctlFa+3TVuC1siElzkdWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536372; c=relaxed/simple;
	bh=jwQe5AqkZRV6AycdDoCBJdkEwP9l6TMebpmQtJszUio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S18/hQsnHeZ0mv9459nY37dE1yXnHx4F3o0qHKTuNJYbKKt+/JocNeZL7egleKHRxy3JAZ1lcGYg81+fpicXk5APTojQy1v7KidjH4KkBBLhyWME821+cv+gzYjVCzidE3sdw1fjUsGbo5hLtkvFnpD9Z80bv1y7V0YoCZXXWD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6tXXcR5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6tXXcR5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1194319e87.1
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786536369; x=1787141169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwQe5AqkZRV6AycdDoCBJdkEwP9l6TMebpmQtJszUio=;
        b=E6tXXcR5M/8j2XyYtXn1pGSfcCHCfNmXIzhDJOuEqFW8DMeIvAN4SU9nlnxt4fU58C
         A3mZNUdF/aZhzkVXuz+ps5UCC6ZPAx/YPzIjsEldReELlBP56jPFPBRXxWIAnoS+2JJT
         DC7OPAEt/MStbvPZ3sCzG9HXXYrnqnHL9kyRuveKuEM/jz1AtHtnbNd9NVK00WoH8fZc
         bn+/0hNxpuL7hfT8PW84HjquKjbWmwBc/PbqvRXUk/vwmfoK4U8gmo6sZqoF4go9r8FW
         fjT6NISVl7L5Gi6jECJvThqzxbNvrhZH55n6qgQzVdwc2u7RT4wHlioMbEPsOqApFE+7
         dEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786536369; x=1787141169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwQe5AqkZRV6AycdDoCBJdkEwP9l6TMebpmQtJszUio=;
        b=AEDWlWHB8pjy4o2605AyjTNF57tboI/d3ommBlInlfJAi5oz/V7jzxyU43Rd/L2zNg
         4rvo+N1BJPaun5RPvNAI7qjQRu1uIIy49q8WOMka6mikP85nrU7RXwf5eqrrAcEbMQkg
         judaSOBZQjr9sA4xJ1chRhiBclOCTv+WH8kFac9toMCffPHH0HYMhFy2FEH+I8hByCq+
         XOvBxqm3Ogl0lkTRcfNXetgAFJEl2V8J8tICbGI6HbRKor8PhqSk36SBuPJKDKpMBbkf
         6NQLMy+ASqpIBiX7Qs70EJKd+cJXAoN/xXjgfOatuHv44CnPg9DRY39w+f87mZJSKB9+
         ruxA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0asuv8o3LzbK8fqt5jwW4ssu2pBQmLaI/r8GMSLx0ymXyttknQGNR5VPxVlDs8dsVJlnNMhV3nA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGEy2QiqYxw2YniOiNaZdynXLX8bhnqKId76KpemH/VWzjDb7n
	3CR1EvG7rBJsIl2uKcRPKm3WtEgR7L35b0471mnxgyHSBW34W1xW2Gnf
X-Gm-Gg: AR+sD11MVFJ4b2S9zu+BfoifIrzutSK6wBkQFJag8incCXYeQTagJjaa2DnC/ZRdo+b
	S6nyRTGxwnM4EBxb5LvoKVvmbBxVurLZfVd9UuC04VtOJ+Jfq/ot6AtisZNx10gkobo2ii3BCnA
	/3KC/nTO/ZWN0XHpOWlEfYRlZl6WV+/srLhuTEKdnRLF8p4ZVwcmJi8rZBC2q0Qkg+lkAg0rbvu
	WKDHuycLcteevRbfMnrbhLmkRpatBSnw2nQDwFF8za48IPgXGzYqR73O/9hVkwosgJxMCWGyhl6
	Oq+/VHNlTqImpicGrEga0/NCT9AJbYXxzSHb9JCgaVjMFcqvJPxeYx2MBaBhuRvlHYqIYfJOhx6
	UrmwdAL4weMh+2vikW0ssULSUJSQYJjBU/rl66V/cIUddhYMbq6LdXXJxQjIlKWGhbpiGFwZSik
	RdOe5tts/sQyFt4XNTnvJAGUG3IM0EU23/3iNOluEQARkgu8HmeHkj9OQ+r1EvehVOhQ==
X-Received: by 2002:a05:6512:a34d:b0:5b2:aa5d:9ce7 with SMTP id 2adb3069b0e04-5b44bb2312fmr944010e87.10.1786536368688;
        Wed, 12 Aug 2026 05:06:08 -0700 (PDT)
Received: from localhost ([95.190.105.95])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d04903esm447818e87.76.2026.08.12.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:06:08 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: sashiko-bot@kernel.org
Cc: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Wed, 12 Aug 2026 19:06:06 +0700
Message-ID: <20260812120606.191456-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812113752.532537-2-vladazaharova2018@gmail.com>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com> <20260812113752.532537-2-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sashiko-bot@kernel.org wrote:
> Does this code need a memory barrier (such as dma_rmb()) between reading
> the 'put' pointer and copying the buffer contents?

Not in the path this code is written for. snapshot() is called from the
drop path of the log buffers, which is only reached after PinnedDrop for
GspResources has run the GSP unload sequence, so the GSP is no longer
writing to these buffers and there is nothing to order against.

The one case where that does not hold is a Gsp::boot() that fails by
timing out: the GSP may then still be alive and appending while the
buffers are dropped. The copy is best-effort there - it cannot be made
atomic either way - but reading a non-zero 'put' and then reading
contents that predate it is indeed the pattern dma_rmb() exists for.

I am happy to add it, but there is no dma_rmb() abstraction in
rust/kernel at the moment: sync/barrier.rs only provides the smp_*
family, and smp_rmb() is not a correct substitute, as on arm64 it uses
the inner shareable domain rather than the outer shareable one that
dma_rmb() needs.

Would you prefer a small prerequisite patch adding dma_rmb() to
rust/kernel, or is relying on the unload ordering acceptable, with the
requirement spelled out in a comment on snapshot()?

Thanks,
Vladislav
