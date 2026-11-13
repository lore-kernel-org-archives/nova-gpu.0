Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556442;
	b=KaTj0+BZ9eEgnga2hxdyJ3Dx3TtUJ5hFq9zhWi+sWWtOBofRKgvtFLBSyvbkz0GM5OU2
	 k3V6Bi8jwRZfl3aenWUpZxmcR2tUjQn8IPMS6hyDZPfBRCTDpnX3Godn27iFKZ7WZOJ8e
	 Gs1xBOjDQgWLqdPcx/T4jvxS5kraoRwu0De1MZ56EpILMT9pZPFnAb/RQKJH74+A8lrT1
	 8I543DOWD5AdGdepUMzypeCO6q8QenahYLID0ZJqoPDlnbl9XCNC/F2gIUwTZtMROguhN
	 jbTU9WzqilfewmdCqzx03GmRIB9tYDS+JOxKNC6WvDgMwCg9Z6/dwoHnDJA5dFdCFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=nbX7P5ihNzjEiV+bSMtt5VO4JcENVekwX/gv45gp6fNkFGFxGz7bvvbhxzVMRfn6R23V
	 1+hy+z8PkjbNE2qJi+f75xl4j7Xz18SLAe7vQ2My3M09hR3gzvj+y5q9VsT35gw08i7AY
	 7tp8Y6MhSoQo4f5OtbILY3Q1ABXk0AG+o9/aX6Gu+y9DVJ5r6dTK7jlT/ChwmkgXVy10/
	 i/yK4eBwwuOar8td4Gm0+/P9gMWd1JoZNhAOuezjQIDW1X86pF4CZqWFvxKcj2ssU7o0C
	 pNB2tjlZp9hmRhnjhmSjDOuCdIfnM4H4+yFypTQS/G12CGCQvLYTGVwlIMBMc3MgUwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOasCV+N;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB333606A337
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB333606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YOasCV+N
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e96502e447so10392695ad.1
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556441; x=1795161241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=YOasCV+Nf2VU89ul1t15q2vcQikA2KeCntOVFYy+19d/cpt3XbNt1DWPS6dl1S9NH9
         CBC639ulP5k5ZALucOxQF+IyZU3ImJF/cJMac9oY7qXHJ/A2s88YYBG7vQqlIgm81lxA
         Zu4xjUef0ulh4VFHTRRelSnDL+DH+BqrQf4iazWIiODVgsMFE+u+0C3fYj0CAjBwxzrE
         PoJnzTN5/xsinoTMpY8juBuXnfe+xMSAdgouqPQI3FRDpw7pljpION/LMICzFY4cubdu
         0SBvfH8PbS7JjjflnC5eYk+6OLqPFK2Zdcp8gLR/uOKyDNKBxmD3uDyJzosHbyz2p5CZ
         mfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556441; x=1795161241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=UWHWM1qnXG5vrKAlHckt9Lh8aXKFIcbKBXoGi0z1OHPNXsq0KNodHKUAXCD8r75pMV
         C5MSbtGa97c8rB5snoNj6GFMfrlZDDAJHw0kMBRhP0Vr2wakxGR+NJyB8bXWhuVU5kEM
         TWls0UH/zn2iZEFo/I6u1rRaW8q9ktAyfXML3B1urAYyLNlo7bQwkNQkov0SFCHCQJq6
         SGhwApeqzxhIWHHDRkByLcIHFwFJZTdPi+pOjpcs0w67buWp9hJl97pGPDZDgr1pDwPh
         ld6QQImVjoM1TwHA6j1MCP46TYqqRYZlCBVdNtkioNXQLmQDc9orRTMNYb4qVJH1fdmc
         wiTw==
X-Forwarded-Encrypted: i=1; AL+hErGsLbNAR1VAOTZKB6tdFSABKoQvdmEgzZSOxwqGuB2N4HI7rYYMcJSg9dBRn3ES0CleRyVUv1qrRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8z8OI0X5xLiJ4Bj6iyqjmw5zf2ThstnEjxifvUZv1aWpXnAjh/
	+4mr/HN7VWKlz5IDvFigRp2G8nrRq9ROqlxhnY4c6kCabnETTS1SQlz+
X-Gm-Gg: AYBFou1KJVa+3YmwL5D1n+aEuCqaQ2hKP6A8Vh3Kj9YG/Q/7UeTe/OR9ogqjHVAbB+g
	7EeNZL10XoarRi9/MwLsa71coODELygmjoCWexAwZ4bibuFbkGJZia8fJwOlnlZhKxb8gEP6IJc
	1oAN6F+IGjk6AdDxLB6EsbHs88e10f1xZLQ4IX50C6ZBcYEJwCnISPRMmDiPe/9/zpAhy5Ccp7q
	kaTntNAeMyVr+qD8R0fqzfC7cw4f+WC+/oG4ammhr5ukxqJQbn4z4yyK0A+fFJN56RxFxsL5gYa
	NjmE69KuLOg6M9Tdcv9WnK01rJAEZqQYihpZBhooF4JcNfUZEvTMBxA81vzoCW2wGfaGyuUQ3WW
	YTQ2AHtL9mgcwZB6FlUu1SOqOqVF300GYh0lXj/6gCdXUH4ukH6BABwhzyFTy9Gr+MM1b/heNuP
	LZqGSg9N0xyZR+MRn4kvu+CfdRb8P6pkwd5a3Dbp4RkghtO5D4N7f9vYKvhwMzbk2ttgLTopdHV
	7MWiw5LuMdjKct7/I1bJHgNNrbI5cADT5hSwzQzrQvL+yf5e1awihKZqzUrRuxfE/SDGTfuOQPW
	GAJGhe7SUY6uHdbbaQX4sM/JWXwN4Ct8P+c=
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3b1b087a23amr1392750a91.4.1794556441256;
        Thu, 12 Nov 2026 23:54:01 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:54:00 -0800 (PST)
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
Subject: [PATCH v7 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Fri, 13 Nov 2026 14:53:17 +0700
Message-ID: <20261113075317.934264-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

