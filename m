Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14F5616AE
	for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992794; cv=none; b=pCpEurUntCIPkWKmrV/e8aHKRI9axisP6cu5XuMUUcinkKLz9QeWoI5uSDpglEwbMZuZapQwYccBVTaRlNtHYl7BgjRqevzrEoJzPIZ+xGDZWpi1ojyDojkAiq1VNYeE5bLp4A+mYNBDei7mN0ohJD4Q2d5fbnsLN04oBZOkr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992794; c=relaxed/simple;
	bh=IYTAljIE09eUQdv5gBp+pN3vSrMjNBjKLSQgelcAn4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+Al872IY0vUDNiVtdY8e27W+ndvQ9n/6nxiuHYIToGB0Xk5fBoVAes0Pl0MmxwGq03wrcBzsubYxYmoBap4pfATpHGg8WhAsFz5A2LLcYNMqUL16HiKERSvJZ/ynKzjRvz9F+AnWqjkwFV/vl/2hfENC1yKnq0AFflPmP9iBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlEPGrA4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlEPGrA4"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1573459b3a.1
        for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992791; x=1792597591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=SlEPGrA4EFJiIkS+fhkzYag13wGA7DJvv0afv1BvwOaE+EOyOubHVRjsdDiAKk3Lfo
         yBecJenpE9f+drxhqwZRdWCJs3KOfW3TaCLcpiMqSn85hbARyF62nwVkHe68VGpz7cNm
         CAJTwCydVI5fStMQO8ieeqQdjI7jZspV7sAhyUs6UNV0/WxdOd/Y3s/jqlCyP11MLfPN
         R3u+HGuH5pnY8HNyayM9C6qxMagZKuD0Qwa7AvZuMpXXJwIGwhbZp+Uk2fZn3kT09ALk
         NrxRkncvrb70KRnTDiLGOaMBgAu9R1VU3Ga78lfs3j+lcL3WRGGlQQLpd1Ld3gf6UN7G
         BZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992791; x=1792597591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=rjZDis6KH6F85sxMbVmtaMVbh22Fpb00A4bnUt9VTo1UnQCYmSQfeB6UYMakf4tZxr
         OmI++CL9ITQ8dhhItu8Yq7Ezli5YubTNvMG9365ToJggP9wglPOz22T0pizR6qdQwSdb
         FM2zJ8lSOlHn0lMCsiwifHQqKGlvb+MKibABHtwW7o9U/GMUuaRGRHYh+lSEGkTfdBhq
         24lr6f/qUHosUrBTx8GW+OqgGW3oA7LGJsIvRglG73hOmXwzLxYki8uAw0q92M9p9fNd
         bP3QbBtUjtih9gIwQwXmEMZrigN/m4wFU4a4hrbRsbV3Nbz32M4tqm220/APeQBFSRkV
         AZkw==
X-Forwarded-Encrypted: i=1; AKwUvBzSmS0jIMC4jt6dHAw6VgRSG9jiMRD9wcBs467qSQkh6ELX5Gs0VnA6xLkJeBo0xZ3xEWLZnFnG0Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKhwJCTgpBXSHGHx8FqsmYkBPD0AHsb0Tppb2YBuZlTjq9WLGRi
	Mz9KMOsVDjU4g80pfQxTJVxrR+ijqsIEMypMREIyeBuznnQkD+0z5s9m
X-Gm-Gg: AYBFou38Y81vIyr3goIJzHuOwSFmu2yaJsjpr3wIAgKEDOzgL+dDem1lPc0kTLAUw3b
	eLA0YLpqO7VwTR5O1W8iVOhqX6wySezm8vcb/CzcmOAtqDf+Cvn8q5KL4AbaKKdwNA2oSDIV5a8
	hCkRbMopctLqTC0Goo7LZ4HCMgjD6NvHYFsGDYed8P46d62duaYlHfrADkMfZV/xf1Wzz+kzdKX
	YH7h0FBXckK1D3nU7dyySeYgxPaOwltuRp7HqYTFyx3PariCrggqaPuEyFLFw7WwhcloLmLCnQb
	JbGJezBH5i43lp/u7Jp6RlxcoHUrsPtB4xhDT83cCkuUWewlAVuJaGkDwHK4c0kddSi6EOYLilG
	OElzN6+kRacsRGKPlqsbIfvLxkCaisAtyhEh3erm1j+5pUkswrHuXn13BYqbRV6VOj0ltOmsBiQ
	yzGsh0rWxXuRrzd+FVZ+eIUP5g8NXkuOb79R8xVoFftnPXTUJ1b5y6pt8714Ytid/eDgjkUZ0dz
	WBq
X-Received: by 2002:a05:6a21:6813:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e1bb354babmr5956800637.72.1791992790646;
        Wed, 14 Oct 2026 08:46:30 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:29 -0700 (PDT)
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
Subject: [PATCH v6 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 14 Oct 2026 22:45:54 +0700
Message-ID: <20261014154554.231015-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014154554.231015-1-vladazaharova2018@gmail.com>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
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

Assisted-by: LLM
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

