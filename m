Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67448BD44
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993965; cv=none; b=evE8l5EL5l+xw8P6cbLkNHhK5KEiabgqbzr4VkbxD47RXLerxHEzVhB16nhNqu+mHwRbHIYsnd3niCC+ht/6lXk6AFSj+csnpACZaTXAOpn1vEQxdEmahP/ydmkH07PMbZxKFnMz2r3gbrn7+RrJ62Xxob6CBbt3t9AyS2Ut3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993965; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PX+O6XCZUyQtPAW4/oFs9GJF0K3xO0vFoxDIXVd9MXP7lNFYAqPAMv1bckSXzicOWba/BGmPej/jZanbNUR2uqzWm/UAXhRps8E3Vo3mhPWwhUDRuc5yGz8G9niRAFPSolgPpcMT360TfF+Nd5xpl1TgxkP8MDiABoARxj9bdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=g0fpeBae; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="g0fpeBae"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9670c11410cso722454241.1
        for <nova-gpu@lists.linux.dev>; Thu, 02 Jul 2026 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993961; x=1783598761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=g0fpeBaeM0iFjcvzkBp1plWUSnKKnvuGF1qQXA6WSc9ukApoHqfvYHDVH0w3XYyhIQ
         skavPh7bruMZ4AgeSP6k24tNzAm4RVgkWtYtfR0P5Zom3Qz6oK4pp11TNzx6cSrirCjp
         6c56cxc/ak+M18/oHaJfJxBRcwpvB6zv/ByB0ncuYnFnA99Nh6o4+ns9YATpKuf8AYxi
         Xx2Z64u7qvyLEzZShQgCaDc8DSbMNY6W1oZRfvejXPgUAWaSX8uoMbXPoEz7I6FSaFKf
         2YcXIcwUwEeQWfqB3nv8ra4EwYQiA6Jwjo6uK6n/UCxV5QGRscQrisf/7TcDAvyHP2f/
         lD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993961; x=1783598761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=sPx+8H3rSYjJZl/jLWFNl/KkPgEF967Hiiz1k7MjXoxk/RUufhGS+Q6sGkTLRcEODi
         PRoIxV1DD1cg3xuhUfidT/Lj2otSIJy3Du7AdJ0hLxdNhqJJfkQtbC8xZwzb8Bm0znC4
         euXJBFdjGkRxhQDz7McqZycTCX0riilg4zoF1UQknFPOVkY5kivkyihBvMIvQp5I8bDp
         XglnhdkH37t6Tp+gUBo1Q/NFiDwTQTGRgpBq3aDe9xE0He9oWyCvMA2vDT2HXpRg7sOF
         8ZJ2AWAkbvzeSmUw2zhCllrqlQMABx+vF/ILjfaX3ZJIGKZO3AU0CU04xZ9Y7TLWocxU
         wcQg==
X-Forwarded-Encrypted: i=1; AHgh+RpZXxwV8c9mpBQQzlxD6t9VsttMd0kI5MBYtlxAMaEVnPWqxMEmjNiknngeNEBPeZbnOhyQ68xSXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwZEiF/apfM7+uG77cQEKFGEKJcQC+5I7lnab4kko1hmt6/YQi
	a/HUTHSsA2f3b5Wkj06OqthgDC6XwtVozMtdW8M8RBEAYIt0Znb6GlCDqWv91hOaPws=
X-Gm-Gg: AfdE7ckgrC2mAdWRjQqsU516jekJEWScgv8f9Eon+YWZOR7wn/WaYBneNNzrRK2GL5Q
	gv6lC2i6J6zOI6WhKhkZk/8P7RZC0sL6Ib6NRbGudDjpZByUEwHBn3ljz7kDH5y6D46y25BZi3t
	MmJJ+JOtO3LbrUuF0ltuUfm4XuWrs44fjYxs7es9HJ9vVdQft/6BibCu2d3CBunIfSQMKK6oZwG
	wPtQ7k95s4J6cbOdh9jqk23+r0u2MPsYflagThmh+Pn7fwywmnlz6DZnHPPN2fRubzkmr+k9v4R
	Pi6JNSfVLtKDEpWDWy32BjFkSR2eoTtn0vQQlsNafgDuUpsJVHTQa/cr6YnNco5UrIOxeXc4gwU
	y/Rm78DQKi1WjkTBiaUE0X+Q4kZ58S/beNA0rBeA392/ceCKL8XvBzelrieZzBoBZ182GVfH77n
	zhiZYJMVg0re91Z4E=
X-Received: by 2002:a05:6102:304c:b0:737:783d:1912 with SMTP id ada2fe7eead31-73dbe560d03mr2566154137.12.1782993960866;
        Thu, 02 Jul 2026 05:06:00 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:06:00 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 5/5] drm/nova: use `zerocopy` in riscv.rs
Date: Thu,  2 Jul 2026 09:03:24 -0300
Message-Id: <20260702120324.40388-6-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In riscv.rs, replave the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/riscv.rs | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 2afa7f36404e..ba56bc7d4188 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -7,8 +7,7 @@
     device,
     dma::Coherent,
     firmware::Firmware,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
 use crate::{
@@ -18,7 +17,7 @@
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct RmRiscvUCodeDesc {
     version: u32,
     bootloader_offset: u32,
@@ -36,9 +35,6 @@ struct RmRiscvUCodeDesc {
     monitor_code_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for RmRiscvUCodeDesc {}
-
 impl RmRiscvUCodeDesc {
     /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
     ///
@@ -50,7 +46,7 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
         bin_fw
             .fw
             .get(offset..end)
-            .and_then(Self::from_bytes_copy)
+            .and_then(|b| Self::read_from_bytes(b).ok())
             .ok_or(EINVAL)
     }
 }
-- 
2.34.1

