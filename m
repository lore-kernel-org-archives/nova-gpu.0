Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BF336881
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534682; cv=none; b=tgOV/EmDAfkAtEgDx7whDrOObjlnUdGDMx4x43l8/vlns21LxS44SHoiaFIbKtnYgAgRSENXahNIPTu387xAgEwyT0Rij82ugq8Q1x4ViVuMqoaycjYmp2Q+KHYltej0t6MswKGeTMX4d/UtNx0fWnv+OmWxUyqBm+MNTTay6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534682; c=relaxed/simple;
	bh=jDfIbzSqGcbqJ/gqdcs2ubDNX1rWm1iyF+1niHiRsgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CU81pxDMFoHQHeiyGbb+lo50/SsJzGT0KhLiA5Sonn39vOsI7v686h66tjdzCLuhoDcniaXLDqiZ+8Vo2/54B4dIjZdQSjjrC+VGp46d3ZG3Gde8cybKgJIkSC/fRevWuU5mPFQW+v9Ist67cxKROeXhkKqklUwGgQwK2xjUfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXgV4j1F; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXgV4j1F"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c9452244aso6091861fa.3
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534678; x=1787139478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeOecHaUfHefnAFIhbafWVLtAYJ8GXSjd2T8fSVMv8s=;
        b=gXgV4j1F3q+UTYYGmRF41TQXbMPaO+X8g3xqzDSISmLF6A3Y3UK0aE5WiS1gf1FS9y
         WBRxP3NYqe6zEqo6n/dfEB5QhlyRYtGOWqedJbKShohIv6Ce6bcJLuwUR+JKEsD/vCwb
         hfXEuL7tY4W17S80HKlWYc6TuB6/ET3gK1dPxtLXMWm4XzPV3qwVM2kn61gmX5XLJRds
         GhwxWnmyDoxkdp6s4crla8h+1iNi3ufHokvyK/Zqt4vAL8wedVjWRQLe8Io5cRuw8F33
         4OkLv7O9xZR0lEDVOFBnaFCeUARq5t0rU7aBHw1WY6bnOywSVM5OphCdxpuahRH8UVOE
         90Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534678; x=1787139478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeOecHaUfHefnAFIhbafWVLtAYJ8GXSjd2T8fSVMv8s=;
        b=XqYSGAvHxBxGb/gYja8TNxxNrqf4OoAGgA8jK9lA/ux+YP8tz5g/ozAZvHd87k17CG
         lAKFkieyruyVtDQdV0OCO7iBkEN8hHL2E5I2nL71mequSlUmf7HcqRPpPF5omx1xBqCE
         cc9MoMxDuk9EMCi51FFddqn6eZFWL8H+AjOvfYSGTSEWpRTDAJIot/g4tIV8TjPR+d64
         60BZDRII45qCj8AT7frleIi63b4zmFPdOICzaZz5A1Z5bL8r8Ne1v03jFxH9UH/fAjeX
         ZEl7SWkdxABNuaXfVFGhHvhT15fCTj3AeLBKld7+rdGC/AtBhFwbbrObhwCG52tm7GCe
         9n8w==
X-Forwarded-Encrypted: i=1; AHgh+RoLl2XQaJnxX6oATDdfEVX8pnbpWD+Hm05K4QIxinjiVxGA1JbnqecMCxAHqmebQ65cihUmMZttIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybt5PnTOSywYgy6u1EdN0tKuCQSIRJHt9Y24D6DswDRcGc9WiX
	j+OQOQfmCJ1DPFXsSATvydffgNzwgsYTS4U/Va1pAaOHH0PNu3aWaILZ
X-Gm-Gg: AR+sD113n/c1ORYmsLcLkkJpkeG5vS43e5tsv0wF0DdmbkrCDeJHhEJH72u8Z94cZwC
	TWc7GwMQoE6fmRtjRSL1Y2joarwlz7OQYo/vVGi2OGVv2hdVLt1owqQZIaEV0L2WG0cbDsKTVhx
	paD5zsPurcNjdyUaQ6bie7RLPHqglZRbKxaDNZrieLiKw21Xo0ie/xQ0nEDGmEU2iOzKYCoPCG4
	snOOXBNyz4zZyfCo3Ka+OgMVu67Mf5iS1fNEXuYyu0rytS+i5g/134HyqTFZNaCf62hvpNehI+M
	EAb5vHvwwYCZm1kBOml44C7T9wz3XN9O8JgsLaPet340E2lNUC5H3eiCldGt5FBSlHxavzB/fh5
	dJLjO01hSskkTi68m/aohe4y1h/q1A9nrfE5NKRAD28vbMqY21VmFN10L3fzD9/lfH06a5+18kM
	9cvXeeRJay6H6FO1uNWbYD6QBuyovwV6/FJgnKwW2v1CaeXl1SGnfb8Pceg3Tlvw01on+2j2G/8
	KeYMRI=
X-Received: by 2002:a2e:a9a5:0:b0:39c:7200:b9b9 with SMTP id 38308e7fff4ca-3a10d53515emr4862991fa.13.1786534677463;
        Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
Received: from localhost ([176.210.177.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082d11b9sm3881101fa.33.2026.08.12.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:37:57 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ttabi@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH 2/2] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 12 Aug 2026 18:37:52 +0700
Message-ID: <20260812113752.532537-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812113752.532537-1-vladazaharova2018@gmail.com>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
CONFIG_NOVA_CORE_KEEP_GSP_LOGS they now also survive a failed probe,
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

