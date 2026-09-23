Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8F3E5EF5
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 04:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139408; cv=none; b=Erku9sBfQBzGXl8OWEKEM9N9+FF032h1zZABD23A9CpKaYxnyYaO4L7QiwIhlVxb+ooX70bubG5jLdzralSlj73BdIey6aS9kKYYjXihVmR1Sqp3/I/PLM+NkSeIeze+YoFbwsiKHMKHf+mevYI09A9zaCsfPL1Lm9Mk6mnL5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139408; c=relaxed/simple;
	bh=i+9Kd1wcuXXlxSDwbur+MJoqMUdg4kpmkXMrI0+T3eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeD6cG8cxgR+jju4Y5mRgFNN5qV3B91MC7XQISUjLLSr+SGX8xnjBzcBJPp4PrNXuhwtBEMq+r3GmdEO7hqz+jc22QZsK7ASGY5TMou0sU62vbdyBLyDJMZmdZZkY6Eg4Cl8jjRUle+wpvOykForX/1Matzmi4DY4K1Bok0LF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6FLF8Mb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6FLF8Mb"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso321032b3a.3
        for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 21:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139386; x=1790744186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=e6FLF8MbbcIH6AbKwHbRWGBdAWTxhXbCHrP3/0OScRY1tuB38G1a2VcbRoEtU2HRQl
         4iECpwCh1veop9jrqo9BYDxls7WDcODVhISZP7MJ6Adjj2NeOUSGfUOtJlY3Iq3/p4wO
         XH+CUEwIsqddhcEkpANL4dXJR+DLs6xQKSz4oFQJAGrCd5T05kijgil/PE5zWj3oY76O
         BEoaCST0eJM+qFXTTShGcmqFTt8J5K8gHKPTrohig2GcBumTC9POBZJI13JRiNYgTgLQ
         OL7rXPkI5YQfTZRK81DDgd61vK+u4IfnE01p27Xog6Twn854Q+eNN944P5OV46GNcDWq
         QGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139386; x=1790744186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=jZKptjX5vK3FHsTlM3wWyEU5JhqYT/UfOVok3UH8kYWr4rHXN5zTYcHvd+bJ/jy2Yr
         A6zVrf8FR4eZF8cegRlkdIwsm2HC32mi29wq2JPyM4bCYv1bL+rhtzjmMhqdlVRY9L6C
         V0NG+oYUxUqbY5QTAQ7UQFLnBmUS13aNchuMSXVIsWENNIAatjPmI9ZHeaGFqS6b4TIH
         Pkz5J718WkGWgMm409NXxNSWy992uPAUPNIfDxfL5H3fiK2xw3Kh47vylMQz/2C4ZyLw
         h/ZCNNj7QblI0r2if6lZn0+oznUmWCnh4cbqihNxMyvRgA9rR/psQBLf8/J5TZoEmYUF
         frFQ==
X-Forwarded-Encrypted: i=1; AKwUvByAdXI6qqm1XNCqLQpzA7lsW45vrFqvnJNsYzy8ifDDHDyR59giW7kvLIEb9cwRFD7t0umGpqJICQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lMwSZHPExjRL0MAxSvhQ3cdTdAXDh+VMXmfvul8WVZvMTdphU3
	f4Zbo6fQmiifkt6NcnHERR5OCI13EjMqlNSA0RzrRS4a6TnhfsNyWhkN0xqunYIanjuR4g==
X-Gm-Gg: AYBFou2q5oxIJ7HhXxVPjlK9Qww8gmamIJgYiN9eCuLTLKF++Ct9eYEF6MboXWut7Gs
	unndfaIFhd1TxHiWwTkBaCyVX53vKGc3L+N9T9dx4gbR378U+mqeFU2asEyPg7xuvilT12FcM5Q
	kYW0FcLFqcRsboplDmRseLvyXN6yBkCu3d8bpYZecMjRAObZGNM3UkXO/1of2VKdNRLl82oobkS
	sX020SmEA9M5Xg9UY8Rnto/S/MiKGLmDMuICMOSy48RO4BpUuHdI+I+kYaJ2kmqunJKIVvzwnUe
	PvD8fUo8iv+ZXRPzXTDY2F77kYNRL01qJPw1NHGplwXhs+W1AGsHz9iLiQWzSJD1QJeS6fQEbHc
	DNZIxfj930C0Z+lyiGKhCXKFLSfB/UgV3qE4Efvnl3ngT2kTNCLF4UlfLLxFg8aoH4by9ArcN4H
	tzknf6p+Gr9BMR/pTcb4wITm7ADYkoWj8GLTlVlErNcfeFWPoe/jXnkLzD1D9xrQL+QDwiRte6L
	nvj
X-Received: by 2002:a05:6a00:2354:b0:87c:d00a:f350 with SMTP id d2e1a72fcca58-87d1d6c1be0mr1485300b3a.48.1790139385958;
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
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
Subject: [PATCH v5 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 23 Sep 2026 11:55:51 +0700
Message-ID: <20260923045551.229259-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923045551.229259-1-vladazaharova2018@gmail.com>
References: <20260923045551.229259-1-vladazaharova2018@gmail.com>
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
2.55.0

