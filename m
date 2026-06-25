Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44675332614
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414388; cv=none; b=oShFQZamUOHsgRmdh6py6KDfkyL99HFNKvHNyJ386mkdLZUmGdnkprYVyrUZgHP96cdct+FeEtroG5Pa7vv5hVvp1pobxdtp9YNt9MNw6WftHc5hRawdvzXceglIkONGdAaC1MtyuR8SIQww3nyN/p+6kGILTkGwumQox9lUbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414388; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FL7nA7wkOlY6B8vlZT9naQymzDNiBrqyJnG9HDJ9+yl0Ok4Vae01fkYwpruVUCucIwUsXo+DVcBOgBY8yPjlw9ip9NJUqkO3mQTqHRYk6LMp6421/VNcwQu52KMmewqgJLgkS9QD29gIx/5tpkehKLvnI9/YAq90flKuKSrM9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=he4dlYwC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="he4dlYwC"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139b914bab6so330148c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782414385; x=1783019185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=he4dlYwCacpM1Bli0yurri1YJowJYmrsj3ymaNOEyijp3LW1FNABwl5zzFAeWUKZmv
         CRZyWjnoFVsVq840RJId6uaXya6o30RUHTcfsDCnfmwV8w12osanKZK37XZfHJdqb45C
         JaHPdRbfcaagqJqpEbsOoaqPawVGrjAa4YE1yqaU1ROrSRCBPY7WCdqgHYmMWWjeAIYE
         6HLYyOfWfRJCMcwMhYToZFeqImDct/qV4ogoDtMEWjT/vQKiZYOu/TznctPLK+NBx4+6
         d/K3K19A6MV0vz6exKNePjPTZUF9gyr9dOdigPjoTvg7P+00kBNsWlkkf9s5iFgf2mY5
         rkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414385; x=1783019185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=GnZEsAoTIqeCfKoHiNNDE6JyIclr9UPGXaREO7TPQRlI0Kp36sSe4vXgqjfLo3zY1I
         9V2+9l4Xvfn4MNVq24eXyh37frl2JBBJMKSnIitvrBa3WZwfx9IhBFkka7JEvckXPZTv
         5++Kijfd5bUO3ImwBgSKt7ATA4s2rSTted0nFSKsZLhY9wq6TcSmU/u3jzi5uN+qDVwQ
         wXj1vOWpwm2LN70/MUIHLhMpPC0w+qnmSfvw3NRhj0Ilvg4RO87MgzTBDbGUdo6XtoT5
         5v7aUkJy6SK7OJ/Q/ZtQ2o887OAP/Cb8Iv784A9SfDFOb1HYQbmQawoOtUoy1PnQDGBw
         h0WA==
X-Forwarded-Encrypted: i=1; AFNElJ/AgZBGBYpVl1yM7kJLgOnDB6TW4S/2OBSobgQx3cd7bQO6A0vfKG4OKSkStL6J00YnWq/p+s/W8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGsIlNgTbAllmjsT/5fvBiphIRU7XRhTsWIr5lhjGv6oZiAlc
	XBJHHnaa3o3FZamwNs1NLTS+Z9vLBPdRg7509w5hbXOv2RJ9/JTiHmjcBcqSkCCdShY=
X-Gm-Gg: AfdE7cl7d5D/8vTb8Of60HxEqBxKgdrxP6CmHQqg/9dOf84rwkxnOG/ep+Sr2gGzGn8
	RAmvbmXw07Hq48Vcgqcos8pwXTgcp2cZDF7zb1BoKZI5QmQNnPrH5/YovdjoEjDANxPmhgDoWKQ
	xwkbLxbFCNy/9eE6kR78PMwzG0GrDUWqi1v2jCEVUjlZGt+aNfMYU9bqUBHwdGITOWuoDFC+ynE
	eDqN9fJSH7j2BQeNlQXovvbB/kTM9BH1O7lBi1prwHK13RfLX11XFCcgZpkoXBnVt+51Q+Tjuv3
	k6/TmAB0/rdVf/kktou3yUJRQVrKvw4rFpzbreiSD2l5/dVEtzsZE78EnPitAC9R5bgWkn3hfzf
	GTDpdX3sGEI8zk6ork5FGqtsV5jozUYdoBa2A7k3Wcx6dEKbwbyIg/ca0BpHc+atsmMexxLQ1va
	Sd23EiJSM8ACt2VLw=
X-Received: by 2002:a05:7022:6a6:b0:138:12fa:377e with SMTP id a92af1059eb24-139dbb8ff32mr3631680c88.20.1782414385281;
        Thu, 25 Jun 2026 12:06:25 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm10742999c88.6.2026.06.25.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:06:24 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvida.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vgdm.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 6/7] drm/nova: use `zerocopy` in riscv.rs
Date: Thu, 25 Jun 2026 16:05:52 -0300
Message-Id: <20260625190553.7245-7-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625190553.7245-1-niyudi.honda@usp.br>
References: <20260625190553.7245-1-niyudi.honda@usp.br>
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

