Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB702DCC13
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420770; cv=none; b=VP8fZAguu7nDZ6pxKvT/4BSMUlAGBIopLeH7dAgftpJJPXLITTd+M8Tcr2ZSacVHJ/3f6dhQU3DBJsgqK+3UCip2S0YjbYzJzq/j/K0LBWP4sqBwIlTMYPJtli0aq7wFUrDlv7Z3Sw0BR5X+HiQLBb0gaRLtoN+5BwSrlrHnW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420770; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4ZaezMyoLMGfobyTuUMiLsO5+DkSEaC/PxYwEL5VHhS0XoExuVBjC35Xda1h2PtSxnwrUTZXN/uEuLTwCllhuxHNFVhz9flPZIf8Hf2LsEFC/JpslzXjWeudZZURvnT2pzXJ9OpZHHFyLGgOdoyj5j4XvhJ8DeWdnexOWZvypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=yw+TGW33; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="yw+TGW33"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c965eab27so864088eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420768; x=1783025568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=yw+TGW33bGFaOSgBELYHJRnZQxcUgKJQpFuuAgg7qXn2QQ3XNunG8de3KGc3rcd7C7
         vrJTXhbzVaLc2Smz0HRSJKUawq61PkfwpufZqQwf4JRGM5TUjlfFaXhB+k7rldEXsrwG
         Tj6GDwRbJpaZw0HBVHDn0gFKY1MXFfV9m0GWzvszqmum9/6ZjAhhT/Z7bOtTYfV7BRqx
         paI1ZGoJLbp12CYjyvcR1kEvxiaDz8lzLnBmn20ad+3sdxtBwq/cfdxnrLHGqQC+AWvs
         nyJlTJ1j5X7MZ0tkQCi6w/5+fYwXSCtrEQZ6JLspQJfDq8eCI9z/l+x+7tCH3mfNB1o1
         73mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420768; x=1783025568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=iKWRYMUM9mTxgF+qHziUGTxR+zRgJvgKJGtieZzNGEw1Xp5WBoopzHBWeg27jaQhDT
         Iu/+aSCT+3EoYcrDEf6xXBnSPpdFL7TKKZsT1ILFR34oLfpyRndNzO4jjldS637K82Yr
         F9Hv1Howa5M0L3Sk5JxZ4y8+wVIpYQ16dcgP5EpHvNeDXWI2fjmD04TO5tqds4SzOcAF
         5jYa5vD2fy6YkDnaNsrGA3jMME1vrVlSJiAuaVuCZdXADYVwRAUkEKMlrgrelY5dsXQR
         XAncfU1WaJYYY0bnvujNG8nOkXlak9Oz3IF38YwMSD++bNGtYibQRKyhB/rt4A5Vaa4R
         PF+g==
X-Forwarded-Encrypted: i=1; AHgh+RqGFmCVguJrr9wdxx1zdriHp4EfGJVjNntuZmhOUm6IybwIK9eEKvL/DOgAkwujJV1sGc/7kik/VA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrq5UcFM6K11T1+4E0L2kPd8WXfaRsKNu/kqcz/Y6pVjl/3tWG
	SH53k/i2lWdBGFFbGaQHsCDQucU5AhVznSqTuJXZCJo9TeTQrMnFpRvTH0dsFlEcmN8=
X-Gm-Gg: AfdE7cnya41jTIT1VDt+eu18PViVxBBydRc4hyRUHIfvZgE3Kk7dYP4WJ/P21/J+mYS
	twZEKFufsYFk80MszXN8JOUS8t7Fzb60PhijLS0J/b/Q1dXteTmgVjup7qfHK9eZdfMKJziwUhW
	2vOGKxGBueOfJXUtw5hsdNChnAtvHGjlKByTTuH5UX37DlDs/W+hC3yQs9TGm0lTOa0sqe5uvps
	pxxPMLNiU0fo3dzaNJ49jvyKKAgpgvYhEgOl+mLhKaK4dhS6OJOGKUfsAYkSoYMmSO/+q4TS6oy
	X6B3av+oxpnxL8e0kM24oLeCYd+M5iC4w9I4b3tHk/z9K9D2MiK3EiUWgKFYCWxhj2Ugf8YD60N
	XwbZ7ThetzZ91LQotOG6aC9+93GGoVG1gEctZkACjH1ROCUrbAf7dt5HQYNc0GlVfdmEa7CceUe
	7H8kAeAsQjmAayl+zdq2CmiiNvfsTG9IfQ0C78
X-Received: by 2002:a05:7300:a497:b0:307:3a6c:ecea with SMTP id 5a478bee46e88-30c84b95570mr4109057eec.1.1782420767666;
        Thu, 25 Jun 2026 13:52:47 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:47 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 6/7] drm/nova: use `zerocopy` in riscv.rs
Date: Thu, 25 Jun 2026 17:51:45 -0300
Message-Id: <20260625205146.5047-7-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
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

