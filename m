Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7D45DF44
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545506; cv=none; b=jIZKgGJ4zL5t1/Xw8RmF6f8ecrF8oucczTMM99Mx0c/cqkg1JJVgc1Q29lgS18F48pfpT3Tf0cLkCiEAOIqXqjBCkVcecLDPYarh6tDReSlXB7Hy3/xBuyzs2/K4SKR0KyomsFLJpk2mk1DvaFD8JkkBscPl1FHCdMZ5VXW30TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545506; c=relaxed/simple;
	bh=Jad1CR0C8Q0HksEqx6zI+IQmNo9dkOO0wB0n04Xx9DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEt4DTd+4jp2QXA6CvjkkM0hwwOFmBMD1Lpvw40dOez/HzQ8RHbjog+kPu1i7TCyDakGIklNfLPRFPU9VW7IPX6XjH5JAOs6XwuYUJW9LrECMJjy/xD4nJ9VTdj1U22QWBNhysmAua0SOsk0Vvg7H5lFYy+hOI+DiI6iyBOCI/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GitkXmWi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GitkXmWi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b01cb18515so964685e87.2
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786545501; x=1787150301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jad1CR0C8Q0HksEqx6zI+IQmNo9dkOO0wB0n04Xx9DY=;
        b=GitkXmWi/oNWmFvjvurgvesY1lf94BNmiR9sluQPtki25Sg+qnBRXNZyjxAFS1krkN
         9hyfnhUaws9pYTsJ0ElBHgw53Rto2NFvUoa453FlBxVzBfswvIz0bNbiF+mswWovApMb
         +vyPD8x8/zQSPUCfVlFPaczlJoU5CGZlEewt7MTw9LMKlBALUfbL3CHj3lOn+00W0reE
         Q2lt7iPjLSmzB0qKWSOAuffNU6JqocOcwOq583XESsaFW/BsVBlctqZsoYRQ/tIXaVsE
         MCo83C0aGpH1dqRLUdgEPGaIWE9E74qXeVtTlwV9YzGU8M56iTnTTFST+88OWPQhuL1U
         xLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786545501; x=1787150301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jad1CR0C8Q0HksEqx6zI+IQmNo9dkOO0wB0n04Xx9DY=;
        b=Be1Mw7s2O95uPk8NCtyRToH2RNJcDCBXvfFxOAYI/ja8AsXBttgS0NKXmqmzWsB0Xc
         Kxxlkv45GkUpLAyk+W+gPi3EHz9gvc+0GyV8nOJ6n5FPCj7sYJC3Rf7scHPWZMpZQ2ZV
         aTryl04dSbcmpmBGzyVszMCIfQzzNXNEeqgR7Y3gnoZSNM+sl4SmTQtlm7nxNO0Nidv3
         kBHqdeeaRtMHjC+6Ybb25ydQa2UQqkYZlZc3EEBhB4dbBBH4mbOSHtyz+e/8Dprkez7S
         dco4JHlUN9aJs7CgfA7C+qNZ6+SOUe/ZjMUb5ixvEfkHmX3U70bOmz77biOHtlEgALPB
         6N6w==
X-Forwarded-Encrypted: i=1; AHgh+RrgIZjV6TxSjVOSjYvWGWxUDanZqg5BK9sxuborD76RgJDkBolahCAz7/vUtpRhKR2wv0HTAG/Y6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/9CTGNz8vjz6LDUh8cUEQHR3f1iDxxJRJxB3pP2A/1WXbjA1G
	hP2CQC0iflS1e7aZTeiLfIiNCMXUtFg/L4p5ZIcI+cg43pXTEO+kyIT7
X-Gm-Gg: AR+sD11/BEAXYrMZrbayi8GULp2k6iAu2FsviLpRmmWOcoDGqoO9OzG6LTawWLnhz9+
	RvnGQQtaz91MwLviJdLIKWqNjIn77u5H2+6a2lT42cE5pkmURnxcIm3yLlLs18J0GrFtGCey91+
	npZK1PWg8FYk0ArkadYcrcNVj/CJAZY9ReKx7M1QcZy9l7PKkmpiafSWtzRPB8ikYH8fFRAzbTF
	BEMyP4VjsdIZ+nzrRmbrCaPMTP05f55T2zUNZnjxsPeE19+asXxm4Be6MMdvhFUD/fbIC8/3CxZ
	5hBJ/92dfjDdc128QtBJWxo+A1cBLU6Ae7EzWoUq52wp92U4oa1KoH1l+LsJefx+VldGgZiORFK
	zZ5j1tOvtCdlwetXO5pA/ofE5AKUy7A+ftMSSQln3nWug5uWh1bgx9fDnnxUmUkcXChOU2YPcD5
	53nrQ8wrCSodeqAELpV03BE/dErFtAjVqnc5+pd0yeS4obNyul7oT/73qXIBfHVdUd0II=
X-Received: by 2002:a05:6512:3184:b0:5b2:a68d:2763 with SMTP id 2adb3069b0e04-5b44e0ddffbmr1014753e87.12.1786545500989;
        Wed, 12 Aug 2026 07:38:20 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d024bf4sm564235e87.43.2026.08.12.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:38:20 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: gary@garyguo.net
Cc: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Wed, 12 Aug 2026 21:38:19 +0700
Message-ID: <20260812143819.1330350-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DKN0Q8TTO2AN.1FSUS3RCSAB2U@garyguo.net>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com> <20260812113752.532537-2-vladazaharova2018@gmail.com> <DKN0Q8TTO2AN.1FSUS3RCSAB2U@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed Aug 12, 2026 at 3:00 PM BST, Gary Guo wrote:
> The abstraction part is being upstreamed via tip tree, so they're not
> currently present in drm-rust.next. It'll be there when the next
> backmerge happens.

Thanks - I only looked at what is in the tree today and missed that this
is already in flight. Then there is nothing for me to add: I will wait
for the backmerge and use dma_rmb() in snapshot() in v2.

> Sashiko is a patch review bot so you won't get any response by asking it
> -- although I suppose this message is written by a LLM too.

It was, and so is this one. The patch carries
"Assisted-by: Claude:claude-opus-5" for that reason, per
Documentation/process/coding-assistants.rst; the sign-off and the
responsibility for the code are mine. Fair point on addressing the bot as
though it would answer.

Thanks,
Vladislav
