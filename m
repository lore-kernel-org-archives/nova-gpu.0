Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631429;
	b=2wlIKNylG5VkgPVCg/QlyCfF3m9ADuUPY7DFWJke6qUBxvZNoBVaA14XNVevdAZte4/g
	 WKTgnvWug9Z6oTbzcJDwqkhmZOBP9VbG26nfPyLeXShO43hXtoc6RRPPXVR1tg4N8uZnG
	 jGPac6VWL1XeU0u4rYDzLBrVzgSFafhPOevO42UBYShtASsGVa7U5hkZrt+Om6leFMfGt
	 u1i7bEOxpilNLXPfqNiCR1jeowQqyuve1WGts8s/b5gz8dgEd6p3wjL2vgoWRxJ01Q+PJ
	 BmlPaQ27+L2Ecz23/Upr34hMjqlpSg06QmBvm+CIy+DlxDH2NC2wERh2GOBMg4WzQyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=wA3IpKBaw7csMmvcOjjClqpVzeG1rZjMT3Zxo4wFAO/cB0vYD5tGfT8RPvv7jC81QaO2
	 5z9XV2GXDmaqmy3rZB6DKN2UkTD2bmOitKDANKeTDSIvfmcpaH1m/3CphOJQTYRyT1pV7
	 fkN3idPIo9KcOkA9APqJltGpvbnYennFYeuEd7vCyHYm8bwjBnLgVwRrt5UyX+/JO6RmJ
	 wmttM1Pxy0SACXcjcQkA1X0AgEip1lb01msJjalJ6hi2wOC0U8Qm1nPBWqGeXcO5vUfpw
	 12GbPc7Y7L6OF9FWy2wxGYj1MAqzYTsstCtRLaJwm6Ow+B3mXV9rTGYZjCcr/QvnNgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgOJ1Z3M;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F796606A327
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F796606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgOJ1Z3M
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2393030a91.2
        for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631428; x=1795236228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=XgOJ1Z3MHGggRjW6xwbPd1dDEwu7SY9szlvDwpV/MbrAjT2IbRi1Y1nqpJgfqgaQMv
         ig8B5p1RXMamw0Pd7yqJtiw/rrQFIX9+ZHD8AFfVETJN/TVymM8zvtSpvK0XYZ05XSGO
         A5mh5jKPgbhInuPk4sVU8ITjWbLcT2fZ6BxwJZrJ5a7h7FhUxGe1hgnfiG/WIzNTWJ9F
         WjGJ0xQz05D5FGSHcJUWL4NoecU09oM1JCwgAGszckmqF7NIcA46QnN/SAPD3seGW/RE
         leEG1rrr2bC9TG+Xv7+XlWWdy+RmH+2c8tmO8w8/4sBTDiVWL9Y4w8ARCUouNbiHIN+h
         FHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631428; x=1795236228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=Y92Jv2TX2RmaXRhtEZoEq33GMMBJFCECbXjnUf84bg31engJCSY8GHK5RSg090LY50
         5ICd3xp+OGxvUvVqac6WjNKLGvAce/dY6QYt0/nB9vSBrg9/wEIQk9O9LFdKc07/78jG
         mt0IeUSLw3xPxXebG7e7fjlP3/Ndux4iEeKV8mBDFg6TAuEGNp12iBMAmuY7uaplDGq6
         griy0QIWTcvmx87sOpYd75iVo8RbGcx8OY2I99BLnCBCxlIY32gCTtGg763VHGPgmjAL
         4l2gmdbYkiP0w5E92trm7cug0TaSH9gsMVRw/fMmeQqBvqM5fEK5Wo97F61Uv6HKu+1C
         /nCw==
X-Forwarded-Encrypted: i=1; AL+hErGcFpnNcMZxOEy91l+O0YrunpM0e3Hc2xnjPWfhbUlvl/UVTYLg0hfv9njlsvDEEJxXwP5ipfgrrg==@lists.linux.dev
X-Gm-Message-State: APuU4Z89hhfGxCvRTD9bRtyX1vkhrRqb7p8INuZGAl7VvpeXqOMKnoZG
	NnfypeFjoHWv0tfFfyA/YLxjs1RalRjV8UnGnnXys8qlOuj7U6ioscbm
X-Gm-Gg: AYBFou3Du/UdIjHEV9cknr3BbQE1snh7ATOC+Tia6vN8fQ0HB1+SdyUgRjQFhX4m+TC
	/5dK60pcQfg1/tY0XRotOGaB2Izs7uUrahLESU2jEJcHsnwflyE9n2gTSwz83Mr2+izrTGE1E3M
	e6bo9b7TwaQRalw9ONCUl666kYPAw27F3p0iQ5UpRH2pBcfEKETkRt0twn+Cxie4Q4e3IJ3Iy2G
	lANh1q8Uk5KVgPHZ9UC7wO3+9r1X7u+xEDh0wUMfi2Qde1MYnJ2xCnmiKQP+W4IyNJ5Gtnn4q9+
	UATYOfSU3+PGSpkcuuHtHCjE+uqCNNAT5EJPkOSahZd3awecr4dDgFGvJyElvvDwsREr5HPeyWT
	kXxSsHHevHnV6K2e2IqXHBTVs8TXFVDqGKIIR5Zq4HXUC4Ew5dXfdr/eckIT0nmGoXAgLfG1Ks2
	ZOftdWbAFUW9f7IArKKzvdjFc9fXDQEyE8bLW5Dh52LARazcOuVErR1rseScDBWbcf9ihK3cYlc
	j/NZceWW0xnAQ89bjIPupworOFfRKX8kFmbsnx2ut/3mj2ucy2L3Tmrjzya9JkDWkNKQhpLhG1U
	ftXBstgBkI5AJDB4TD/CSozFaGYSwhZaGkA=
X-Received: by 2002:a17:90b:590d:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3b1b087b76bmr4366544a91.7.1794631428549;
        Fri, 13 Nov 2026 20:43:48 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:47 -0800 (PST)
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
	vladazaharova2018@gmail.com
Subject: [PATCH v8 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 14 Nov 2026 11:43:04 +0700
Message-ID: <20261114044304.245684-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed in debugfs, and with gsp_keep_logs
they also survive a failed probe.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
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
2.56.0

