Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422C3F12EC
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197533; cv=none; b=bB0pp3H32K7F8mv7qtzX59+L07CSF9bEqdjspCmzAV/AaBQcJzB0m0tVg4e1e/t/ba3ZBy76eVONGe1mxwsrZUIfx4uCrzPfp0ewJyyyCD3Lud3U0Ih2pcF8Pf1Lrn6VEiF+9xvtqUayRP8TpoWL8cYiij/YYQV3sCaf3Bn0CXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197533; c=relaxed/simple;
	bh=RNy0Oc1b5YVJpZS5AO65ioCXwPG1K+v8mTvUlX+rTyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjNx7bzBA2Gk//V3ThxhDE61MtFtzvwD/f4LYsbnXg0hRwF14rKtAo6tAhahblm6Omhkhci0kuUnUeBm7KyBRvfGqvTsO/Fsb+0GW28INvfF7s62bhDHRXP8lHubCx0+y6zacfixiBOfy+I+kMZ8h9j3FOocrzma5jF6N9USXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReIXcSzA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReIXcSzA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2584268e87.1
        for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197529; x=1789802329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=ReIXcSzAEi/36GaDQhtETOY0KYU3fo+n3jo4R31S4AtY5Nncx0n17uwJ9SAq4R06Qn
         y0Wua8ANop4Y2YLhDPaNZwDmuM+UKY3tlO6ARD8srQklE3QdqfnP9kaWtMgKx2W8Oga6
         Yxz8E9TzQmJwHn7ywoAyUTw2+FVBnfZ2zGwbZV7zifsOGiw/KdI/SZJ2BlpClWkHAPoz
         jQaYYXZSWr29yVtVg1pJOVY5XnWJIrpz9DYHf9ZchpKCKHQ5OysTtYkR+tij1RcmzfGf
         0nnHs2LsPU7glhn12FTH6ypML1HWtEHtW91R2g8DyEL1iIGkn/1rBzRthc/le65uxiGa
         /Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197529; x=1789802329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=ltA5WDubcVvV8Z198WKWLy6SjAXOpE6N99WaX3nyhRIBRebNtRhzeXGJUfctPbmiEt
         4Van3NnkPZoHhR5ZLDX0UPf89FqgWN9Oe6SH6ZhDsHXbAt02Q08U/rFO2nUVXWpP1LVi
         5F1gEOA6nvYqVCAS7zTefLZZBJTFiV8i92lCwLPrf5mAGtWjawbMTm8vZXWMhtNRSrtV
         qCuOhW7tT+5g1KQkcOgNcbZDlPdNwTu8bLMLvRBDhXN9z2MslRSN3NSfktIXdRhPe/gB
         FpKgpragv1CHpkaoZXTiKnBr4VlexyCW8CBao+nWUCsQ0iAhTaqCcwKDsyplTIIcpBt7
         Db6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMKm8Im5Zxj1kbJC8nhRTGIj+KuwFNxstXhpQV0e/fyoWfO45cWYHpwuQFdTdqgvKSYtiMMOx6WA==@lists.linux.dev
X-Gm-Message-State: AFuF++lhrKBDJSlkdt3lF7S9NsnxAqdodrkEajq9D5VBd8NJAcaIMAY8
	cPOUKtInshqKNec6c3+F2R7Ide61y90a4vOu4vfPlWtGMfUKI1uySmk9
X-Gm-Gg: AYBFou112VwERsW/f6RCnTgANvZMjSWBWdgiqBmivI++8kKpICgT5LoH7GC3+YhpY72
	fgJVX+LAmpbtDAa9LIQd7n+vwQA5Ikwoguaig0Pfx4O2Ph7XKalko+4fHL7I+sO5Jo78JHvDw1V
	4UuHnjw1KQ3D9LZyDUVs8YsNb/2Ag7vUqfYeKibwh+z9u4e7zWFp+VHjAh4Gib+ug39e/jPjuXl
	ekEJVnkZfa0hbk4Zj6bbZ5jnJgzYYDk2QboCPrH1Pn+pMQRa60s7nVuGo2WE51rStTBCLLtp2Wh
	txu0WgAoY3ccvVAx7NDnSGvcZcrhhFdIb/WCqaixK+qtvoma9dP8s7H8NdyP/AdyeiZRtF0lTgn
	ukKItV2oiEnyfXJMdAiwnXx5PdXbPNLdygxg85QPlwDOxTLMfYlG08LP/Fj8EbbmW4InLiSnMGj
	sjJSKRynJ/3p1bN4jfOtabwUXv1rl1FWn4bLZuXo4yceU9NzTPs6lmXOjFjjWfQ0WctvC3XS7oH
	AVhCQ==
X-Received: by 2002:a2e:a596:0:b0:3a4:68f1:8bee with SMTP id 38308e7fff4ca-3a59108ac42mr14680391fa.6.1789197529066;
        Sat, 12 Sep 2026 00:18:49 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 12 Sep 2026 14:18:42 +0700
Message-ID: <20260912071842.622696-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..cae0578d32f1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

