Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EF481246;
	Tue, 16 Jun 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653707; cv=none; b=eupg690RhjjDw/CGYTOzeiwZWeNuLK4YjhSFH5CFm6TZhjVkmd5miymDgKMl2My59G4262A6QBelyd/KPsmcjAu/tvQr+QwtNKRQKRCO2NbyMppYiSfsAjYZS7Ce1paE6RNWYCVb6qP8W10GQZP1Fru1H6pV6j+oYxXn7Tz4lLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653707; c=relaxed/simple;
	bh=R/dPhydugb82yP3bSoWG07FHhwtHFJwKwoxbhoTSuWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDdkxJkluDMfSRCupNiSKSGThrRcdKcha+EQE9GeMrm2UNUjm4JWd61eZch+inUV7JFhJvl2AH+KjjrO32J18QAShBTaI6RfB96ETjtQ5cMLHJDpB9BvR3RE4BqCWGGzcpind9W5upwVrf3bBB2zRyvASRdZnes9mrIKqR1YQUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqNi/MG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqNi/MG4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AC3C4AF0E;
	Tue, 16 Jun 2026 23:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781653706;
	bh=R/dPhydugb82yP3bSoWG07FHhwtHFJwKwoxbhoTSuWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JqNi/MG4GGShFIFnBgreI/7r27szXKsy2IHrinyCQWszOi0hpiP2swXHaUwjcyI3o
	 iIPBeu7nikh3JP1z67Ug+LbUrLYlYP7OIdWnSVcf1qDtH8DgIyQchhWLbjUILfcmaT
	 jOVY9m/1Kjh9/mIgMQ+onOyr/5PP1xjo7drrY/yFK33+6Ie25JZbOZEGDdAWK3tqAM
	 aR4zPHa0i33CftHlghHTuZ//8sG2EInYn9uaE9OlX5HzFSdVneG+HPker7F9tDc0G4
	 rNIjckTPkAsk7pkNI97Mn4MoyRupZ3A+dxKpcQt7ZIaiwDLDmUl75lO0JilWJsSgAG
	 gMn5FD4R0UvhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEE4CD98E1;
	Tue, 16 Jun 2026 23:48:26 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Wed, 17 Jun 2026 01:48:12 +0200
Subject: [PATCH 1/5] gpu: nova-core: fb: Move PDISP register definition
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-nova-core-regs-split-v1-1-4c7dc4450ea7@nanonej.com>
References: <20260617-nova-core-regs-split-v1-0-4c7dc4450ea7@nanonej.com>
In-Reply-To: <20260617-nova-core-regs-split-v1-0-4c7dc4450ea7@nanonej.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonin Malzieu Ridolfi <dev@nanonej.com>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, daniel.almeida@collabora.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=gfZ8p0lcgJadZ5MMUJuVLlpeInmCNJQIxDjgT106Pck=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqMeDImgHNj1U3GHegI63rytAyZVE1xsHPS2Q2z
 sgomRE6sXSJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCajHgyAAKCRBmh/EjChUV
 /ReoEACYsKid5SSONiRqQ2WbnmeF5NibxXQxRTdhTFqROcLGcn2YyyRQv5aV6R5UjjUGgN/ABSO
 B/cRnUq8oVjdFVd+qcNew3sIPs4LPIFSzseb0kRwA8HekerPUKOpQHJhIdFTSuGxnFVaLB/oc/y
 ASxiEV3NJ5DPG2acTlI4sJgh98UgLpZfeciIMv7ED176uuTABlmlO90E2mJpgPQSoakP0tXoU3K
 rrMcE3/fs/WX1E0QxQfiQWkpjxLy2tOkI3F/9M3dvj6unM1oEOdFoGPuZ3zuw1XhIErw/iBa05f
 UBNAaTUY8jX9SaG1H3dzQanHJW/gI14idHIsh/k3cIf8Yul2WNGdPEi5u78S+/dm9PLowzN62TC
 GJuIUzLqePtnjc019F7eXGtUkxc8nHKZ7Pu2MgOlib72zeGdY0aDeqR3eU6fTAQ+JXFxzVl37Nu
 gyQeYYyaHQBGompzFOqY0YtSOhqLPr/upCbHaOGmzrk+Xy8tgobCyBTX5KGFUxcmG7RkeWTNXTD
 DsV0mW/x/54zpT9wiOmII+IEVZeGq6AY0LcnbRoT4ZsuJlK7dFzCzpK6tBUF8pONF6XOsuh96RZ
 UMGoRp9Q4/9Wpcd9s4IQ/bSq1z20w7XZCwkRp5s/SDuJYUSWkWFw4nyh/lngg5ZD45ZLYsXtTBN
 AmZCT9TFgqIOcKg==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Move PDISP register definition into fb module and update register
visibility.

Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
 drivers/gpu/nova-core/fb.rs      |  4 ++--
 drivers/gpu/nova-core/fb/regs.rs | 25 +++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs    | 22 ----------------------
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 725e428154cf..4385b5d53e85 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -23,11 +23,11 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::FromSafeCast,
-    regs, //
+    num::FromSafeCast //
 };
 
 mod hal;
+mod regs;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
diff --git a/drivers/gpu/nova-core/fb/regs.rs b/drivers/gpu/nova-core/fb/regs.rs
new file mode 100644
index 000000000000..b2ec02f584be
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/regs.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::io::register;
+
+// PDISP
+
+register! {
+    pub(super) NV_PDISP_VGA_WORKSPACE_BASE(u32) @ 0x00625f04 {
+        /// VGA workspace base address divided by 0x10000.
+        31:8    addr;
+        /// Set if the `addr` field is valid.
+        3:3     status_valid => bool;
+    }
+}
+
+impl NV_PDISP_VGA_WORKSPACE_BASE {
+    /// Returns the base address of the VGA workspace, or `None` if none exists.
+    pub(super) fn vga_workspace_addr(self) -> Option<u64> {
+        if self.status_valid() {
+            Some(u64::from(self.addr()) << 16)
+        } else {
+            None
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 73339a0cff99..6a86ac05e59f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -286,28 +286,6 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-// PDISP
-
-register! {
-    pub(crate) NV_PDISP_VGA_WORKSPACE_BASE(u32) @ 0x00625f04 {
-        /// VGA workspace base address divided by 0x10000.
-        31:8    addr;
-        /// Set if the `addr` field is valid.
-        3:3     status_valid => bool;
-    }
-}
-
-impl NV_PDISP_VGA_WORKSPACE_BASE {
-    /// Returns the base address of the VGA workspace, or `None` if none exists.
-    pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
-        if self.status_valid() {
-            Some(u64::from(self.addr()) << 16)
-        } else {
-            None
-        }
-    }
-}
-
 // FUSE
 
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;

-- 
2.54.0


