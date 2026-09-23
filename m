Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A374C309EE2;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124087; cv=none; b=Pa9s70umcj1TckU0Uiuv7kFr4n8XbnixuoJb35teWoncRlmTAcyBhgoQuc8e02aR/l2nkC85QZ/gSHkSaRyQLiz9O1qkCd7DH1DBg0c+GGuPkzmmxYO1crfxPCIsDguxuDcGsigkS/DGwlCQa4zSSCHUmZV0uDKqnbc1lZWOMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124087; c=relaxed/simple;
	bh=u2BQLYb5Pe7p9uQA31o/pds/NqQH0xcvLTkP6iycN5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfpQcl8t1Exe5qZsNcw/TmiS8jt4V1i1CykyIeHu0UcvuSCRCSKFztOsLvlvoSPAttrZJhJDV8k+Xg/6JIFuF9EJsVUkfrH6FjYpH4mBVCRp8JijhC/WN+sPSpMZG2HyQmKXltxkzqeDEgVu5DjxAUC0A4kVGlUYQauA04t9wtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMJh2vhA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMJh2vhA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61195C2BCF7;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790124087;
	bh=u2BQLYb5Pe7p9uQA31o/pds/NqQH0xcvLTkP6iycN5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cMJh2vhAt5CnUwAnubJ51lVwF8c3p3AznYXc33gDO6G/3prfZ2embfgHHzBaHj6x8
	 AhHXJJaSk/JLOFb1WJ5PneiSp2XnlTWWZXtrGxRHK3dXI96cpP6MqYIWnClSx81xcb
	 78ghKXz8YeYOaziSWpCkdjSuRLVebm121WCQWHFxZ23symNwOXfCXAemkWd4rSN5TY
	 fVl1B4U7q9sTNX5PnxoKXiErrBiZzRaD57InTe3GCbK1kUvyFrXeNfEngddjFGjDIn
	 8vBUfB/8PveHzPJIsjWRuEq4Wg42ql2QWCffchd8sCkinF27fJIXqllxL2Oos/HifE
	 uv4WV186NUyag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDFAC982FA;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Wed, 23 Sep 2026 02:41:07 +0200
Subject: [PATCH v2 1/4] gpu: nova-core: Extract PFSP register definitions
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-extract-pfsp-registers-to-falcon-mod-v2-1-74600fc068c4@nanonej.com>
References: <20260923-b4-extract-pfsp-registers-to-falcon-mod-v2-0-74600fc068c4@nanonej.com>
In-Reply-To: <20260923-b4-extract-pfsp-registers-to-falcon-mod-v2-0-74600fc068c4@nanonej.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5168; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=QnqNTv24qeNXGniIj9tTorKIt90fuqIyOniUCAem2As=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqsyA1wdExC/qVxRtEpe3hRuhY/ZrHVs3jzJDWx
 lq08C4WPGeJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCarMgNQAKCRBmh/EjChUV
 /cPED/0S9iD2+UbXTcVguvt5hBwa/Z2pcnMKFuiM+eaRkEwInFuNpFtlkFTWzxCOhSKm1tRz5I5
 iEs6x2Ozrcx7YUaVUeOC9Ccyf5SYLz9hpWd/U9d6p6tQani0tDwRGutCuTDYw+vkZBO2rJQUAap
 dKk7qces0jt10wWMnYHA7cy+O4utJrUw6zU/MqlB02Xcv8/lrhKFfCOqOWZZZbXY860xKkkdKuX
 jEP0Rvl5Q2q6I4PKLq2rUbjVHbOT6xtvWC6+G+zDOCK99KS8Rkl1j95ffahl6wkTuQLkUNnPZqM
 VOV8F8l7KqY446Deabr1lHwEttWo4gAlOIXZplf3Wv5dhqKmIrbCuqQjnilRbZN88Vp5C1ItTlh
 amIZfTviBaP86bX+ikRx8V6AhVaBtRh4u/WErmbRo6/nWtrhV8gn3GJj4HKxm9XwLHyAv63YKCQ
 Q62t3HyB2nEtjC6ZcaV3RlrXdi50ICX9ube14WN6DFdF90P65BLf8d/ELlOIZ6ZQvXAdqX44QHZ
 4R7nqd54PEX2C1N0JMTM3V7+aE26L74ZuvTjwzRIRSAovKheOBfcGHuRu7N2tDx9pWxjtyJojd9
 QWuX9OX+NFjvoPOpTxDm4/Lss2aBJGybT+2uqcM/6ZiCyKGP1L8SJe9pctSW8df+FfeAyux389P
 oxDzQYo+OZS7Ulw==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Move PFSP register definitions from the root regs.rs file into the
falcon module that own them, in the new falcon/regs.rs file.

This follows the same pattern established by previous commits for
GSP, PDISP, PFB, PBUS and PMC registers: register definitions move to
the module that interprets their service, visibility changes to
pub(super).

Since PFALCON registers are defined in the root regs.rs but are
also part of the falcon interface, accessed by the whole falcon
module. They are re-exported in falcon/regs.rs so falcon code can use
a single regs:: prefix.
Once the PFALCON family moves out of the root module, these
re-exports will become plain definitions.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
 drivers/gpu/nova-core/falcon.rs      |  4 ++--
 drivers/gpu/nova-core/falcon/fsp.rs  |  6 +++---
 drivers/gpu/nova-core/falcon/regs.rs | 42 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs        | 23 --------------------
 4 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9015de965a53..1900d642baa1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -31,13 +31,13 @@
     num::{
         self,
         FromSafeCast, //
-    },
-    regs,
+    }, //
 };
 
 pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
+mod regs;
 pub(crate) mod sec2;
 
 /// Alignment (in bytes) of falcon memory blocks.
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 85f9c8c5d60e..2bd8674f27a1 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -17,7 +17,7 @@
     },
     prelude::*,
     sizes::SZ_1K,
-    time::Delta,
+    time::Delta, //
 };
 
 use crate::{
@@ -26,11 +26,11 @@
         NovaRegisters, //
     },
     falcon::{
+        regs,
         Falcon,
         FalconEngine, //
     },
-    num,
-    regs, //
+    num, //
 };
 
 /// FSP message timeout in milliseconds.
diff --git a/drivers/gpu/nova-core/falcon/regs.rs b/drivers/gpu/nova-core/falcon/regs.rs
new file mode 100644
index 000000000000..5ccb10946ec4
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/regs.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::NovaRegisters;
+use kernel::io::register;
+
+// FSP (Foundation Security Processor) queue registers for Hopper/Blackwell Chain of Trust.
+// These registers manage falcon EMEM communication queues.
+
+register! {
+    base: NovaRegisters;
+
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8] @ 0x008f2c04 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8] @ 0x008f2c80 {
+        31:0    val => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8] @ 0x008f2c84 {
+        31:0    val => u32;
+    }
+}
+
+// PFALCON registers are defined in the root `regs.rs` but are part of the falcon
+// interface, accessed by the whole falcon module. They are re-exported here so
+// falcon code can use a single `regs::` prefix.
+// Once the PFALCON family moves out of the root module, these re-exports become
+// plain definitions.
+pub(super) use crate::regs::{
+    NV_PFALCON_FALCON_BOOTVEC, NV_PFALCON_FALCON_CPUCTL, NV_PFALCON_FALCON_CPUCTL_ALIAS,
+    NV_PFALCON_FALCON_DMACTL, NV_PFALCON_FALCON_DMATRFBASE, NV_PFALCON_FALCON_DMATRFBASE1,
+    NV_PFALCON_FALCON_DMATRFCMD, NV_PFALCON_FALCON_DMATRFFBOFFS, NV_PFALCON_FALCON_DMATRFMOFFS,
+    NV_PFALCON_FALCON_DMEMC, NV_PFALCON_FALCON_DMEMD, NV_PFALCON_FALCON_EMEMC,
+    NV_PFALCON_FALCON_EMEMD, NV_PFALCON_FALCON_IMEMC, NV_PFALCON_FALCON_IMEMD,
+    NV_PFALCON_FALCON_IMEMT, NV_PFALCON_FALCON_MAILBOX0, NV_PFALCON_FALCON_MAILBOX1,
+    NV_PFALCON_FALCON_OS, NV_PFALCON_FALCON_RM, NV_PFALCON_FBIF_CTL, NV_PFALCON_FBIF_TRANSCFG,
+};
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 9978fb2803b0..693b5148b1d8 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -372,29 +372,6 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-// FSP (Foundation Security Processor) queue registers for Hopper/Blackwell Chain of Trust.
-// These registers manage falcon EMEM communication queues.
-
-register! {
-    base: NovaRegisters;
-
-    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
-        31:0    address => u32;
-    }
-
-    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8] @ 0x008f2c04 {
-        31:0    address => u32;
-    }
-
-    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8] @ 0x008f2c80 {
-        31:0    val => u32;
-    }
-
-    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8] @ 0x008f2c84 {
-        31:0    val => u32;
-    }
-}
-
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 

-- 
2.55.0


