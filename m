Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610638F941
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786600250; cv=none; b=lK/IXUipR4xFn9khaSnNarNJ0vwrLtn8T1cPOw/S1I2HDubLIFD6CDlP3CMXg7AWdEmrr3Ft8D4paASXFPcsLwZbnc2gEmUoFUnWtO85+aJ4z+3QMCSX5oFnZdCflrXYrVs8l1PAQ4TLIDREYKPUuhUEcd6FaMtCqsoOEIrkIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786600250; c=relaxed/simple;
	bh=V3JEh31WwDsNrUS7v93z2nbzGko9efY4jXQ8adxryQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF7Degy4d05NY/paM0TH1mbFSNrcIpUSTE6y2TvWw5p9reDEUPjzP+NGbF/Xlw7fKX6JDJq6QXDCKFGp2/Cq86jCzZL5H9WPGF3V2+FH6GsbNbMkCnmxhpzr0sh6H2ZfxxapHS0Fd7C1bEJ9ATR/Cs2FfZpZDOET9s3DJTkKdyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQnkMO9k; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQnkMO9k"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so1315340e87.0
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 22:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786600247; x=1787205047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3JEh31WwDsNrUS7v93z2nbzGko9efY4jXQ8adxryQQ=;
        b=iQnkMO9kcQIyCMegJZLS4wycr5hTUxHjVYe1N0V2jGZbsuzu6fv0QBzHjnPD4l1lxh
         +2lMFPdP7ygAih0VD1wEaXyhMDQwcQHKlWJDjOr1EV9W8lUVxA7FgR7wa47QkHXr6XfM
         axQ04lC1FLErLsvb73BOhJiKh7ds+D/0orx6MoNkGTzQuJjCK4v5mXUjY8cmX0ZYnGH7
         Urr54/4PTS7F7oS9n/laBXDfXoWhJQ3VD1V9JhzZLFkAJ3jza3W9bCsQb8N4JykI6NTe
         p6MQp/clNNYj8cNyEzKR6YTh4FZrK7aXQyp5jZ3oBsTUzqpAbC+Q8+QblvqJmaRJQs4V
         0NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600247; x=1787205047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3JEh31WwDsNrUS7v93z2nbzGko9efY4jXQ8adxryQQ=;
        b=aZ/ow6OBRvl75qkekdNoKKh1MQJlo0fRE2pMoSCbi8CqYLPB3D5OTkuUXuGAT1oe/H
         lrKKZ6xRfAx0DdbAR4JwqPHNIvzvUoQ+wrVlAUNQti3V62CpiB4nzWSoI3TTTPunzjR9
         46fvU2xwZT91cCwvmlv1fqLGIJZ9VNr+eqQJnBhPv1tL7vjz0+luqCgGU0+e5UGF1qkm
         JRD5YUNk6u0OL8BgInIjuoT0N6F61mVvY0PqpA4e5aE+lkdVYA73OhNY2aCID1ZnI997
         c3iLE4s1b1ZkOSVtfgXrDimz7AfL3NpekMxLetOZvWGZT1KG99vVDuG2jwdbGlodIH2c
         9ZrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpANODdMgNKaLrE1L0zK/5DNZqiZjx/RPCH0c9ZyP10RlMgLmZNC0CIjoWPzsTXPAPCWSsj/gsgdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywia7yub19GBM0+TPgcMcod5geRM/0NMpPRYbJ1NxdMUEzYME4H
	Rc4xdE4JxF4K58Il+Gz836kLMVzmu0pQi2SyxfFtffIW3oV865eTEZxA
X-Gm-Gg: AR+sD11tazPcd7TlDjD+a3OAK+Nwu1MrO+79YoTv4RuXPr+J49liHTLTLTax70kDBUW
	YUMgclRqchl1fgwG59s0BiFPPOcTSNOyiYYBbTMGWyLk/cwnCeHne9CQehdl3kXPxTgpqBKSSjd
	Jac3qJFJy6cMGwuA5rWplz6EK8PSDPQMiBV++UC+2VN58G8cuaXzKimonN0tv4GTtB7sUt4ZWAH
	iP9K6PTCoYRNa0sQAPyEMqi0xmw9ZQAD+F2lPugmfy1uKFaR+4f7+bXvOBhmKycdlViDhRU9DLs
	C0LKfXQ3e+RCCdKgKvIWIIpsEKbryAYOMbuVFeEqTOIJY8+WnteMkpsCHZhgpvPaXAXnOcalTNd
	RHSqm0+tnqIjASdpSW7BP0TLZv8oN+NlMof/dENerp/atp0Srz3cWF8rFFmqkSZSNUvqDY7jqP5
	Hh5YdpcbMq2ZNy5k9D3QnN9qITTbqagi4A9tc0ewCsxcVPP+eAQsKwXERmq73qcrVzAaw=
X-Received: by 2002:a05:6512:2c8e:b0:5b3:e02:b398 with SMTP id 2adb3069b0e04-5b453f9f805mr407533e87.44.1786600246595;
        Wed, 12 Aug 2026 22:50:46 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e1866sm249783e87.6.2026.08.12.22.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:50:46 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Thu, 13 Aug 2026 12:50:44 +0700
Message-ID: <20260813055044.98486-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DKN35E0L9X9L.RSVUGPFWRV69@kernel.org>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com> <20260812113752.532537-2-vladazaharova2018@gmail.com> <DKN35E0L9X9L.RSVUGPFWRV69@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu Aug 13, 2026, Danilo Krummrich wrote:
> I think those should use VVec.
> Let's move all the LogBuffer code into gsp/logbuffer.rs to keep gsp.rs clean.
> I think we can avoid this additional unsafe if we just create the retained dir
> right away in module_init().
> dev_dbg!() should be good enough.

All four make sense, thanks - v2 will have them. Creating the retained
directory in module_init() also removes the only reason retain() had to look
at DEBUGFS_ROOT, so the unsafe block goes away with it.

On Thu Aug 13, 2026, John Hubbard wrote:
> I'd *much* rather use a kernel parameter: keep_gsp_logs, instead of
> requiring a rebuild of the kernel.

Agreed, and it makes the patch smaller: with a module parameter the cfg gating
disappears and the code is simply always built. I used a Kconfig because of the
"the only Kconfig needed is for retaining the GSP log buffers after driver
unbind" remark in the earlier thread, which I took literally instead of asking.

That one needs a decision, though. The Rust module parameter abstraction has no
bool: rust/kernel/module_param.rs only instantiates param ops for i8..u64,
isize and usize, and rust/macros/module.rs panics on anything else. Nor is it
quite a one-liner to add, since bare bool parameters rely on
KERNEL_PARAM_OPS_FL_NOARG, which make_param_ops! cannot currently express.

I am happy to write that prerequisite patch, but it would pull this series into
rust/kernel review. So unless bool support is already in flight somewhere I
have not found, I propose v2 uses u8 for now and moves to bool once it exists.
Say the word if you would rather have it done properly first.

The re-test on top of the current tip is still owed; I will run it before v2
and report the result in its cover letter.

Thanks,
Vladislav
