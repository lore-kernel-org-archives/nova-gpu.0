Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFCA3E008A
	for <nova-gpu@lists.linux.dev>; Wed,  5 Aug 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916698; cv=fail; b=gS2mGaIiPFBj5gXfIdE6/kRbsaQyxGEfiJaILJiRJBHad/LWkcKZpcop5LeG2MOd31w/LLKO4JViPoAWXMUY8vNVz4MbDdnVPvJYJiRjLdrL0J6xdKccOWJ72wx4O1VfY83TVCm88fBnDyb0K3zsHZAY6nJ8+XtdOZUqW6N16oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916698; c=relaxed/simple;
	bh=uRi5W495/9GkCKG2lr7VNKajo7xgEWBCYJyEmXQt7Jw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Efw8oV+9iaX4lIAQFpDn4eWRroe+TAC3qwadI9D2CgXB9MwjWAGB+sr2xHv6lOXKUPE4xgCydWK2bAxsYoH5dKG7/PHTp9kkcubLI5+C38Mm4YmyCMQl2r3PF2Lv+DRNtIQlkoXWOg3EkdjiA8jVDw+eHw1osEhu0VsCMZ2g0+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qM+uRRJj; arc=fail smtp.client-ip=40.93.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qM+uRRJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U601qomKKPWedAb86NRQV/3I8r+upA5yYYbEgxXh6mBHoFT6VL7h+pMZbW113Z3Mw98jwZMRIJTj3RC9GhxmS/qRqFtrg0W2GTKouJKNQzOpPoDV9GzkbFyUPxHNHWafNo+rABPiFIgS+ECufXU8s5AcHbiBV09q2B9ursUWTHgFlebfqKSX7OlffHmKV+n/T7J4jw6rRn8VUQV5c27k6w6vK7yO4qxqwHbys9ZJmchxXZO0IU931L5WlsGEiJIL6lGh95wBl6/jowQXgfQ3E/bQlXlWlPi7+Akn9SU9IJfn8CeOFn1pvgET+WaIG5Zg2mbOIbb2vI65DxoPFc1Oxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAGj3Sz2C/qWUVWVm7aOUlnBNcan6LZxqYkdCB36844=;
 b=DMAc4kBFpyS9PpAfNzFHF5c7jM7nhgFsdZtcnm2t0VkoiX8pXaXBp9UKnrtf5X2BeYMBywP/ImCcYUMQchHXLLZttgtNVjW+07XbQMNKPt//U+sS8BmhkQJzQ7uj66sqJl1pIDuWOQsQ47zDJwIIYKqsO0pSOUra6JOOvFa3xkMfQVALVMh29+N/iMNomZnSREa1igCQw9vmCvBCU5pKI5V9KuW1Z17zBOEajYfFParT4AyJALMXDYKFNN9vjX9QqIHuaPQG2GJ3jYxc6Cg4I0lMrKBiXwGWqobXyordLs3w1uIiVczp8SGUz10a90Cxsuf6R1ve1gXCfdFHmWX1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAGj3Sz2C/qWUVWVm7aOUlnBNcan6LZxqYkdCB36844=;
 b=qM+uRRJjSyvP2QDNvp4HnlIoRA6Vnyd5YHUTYGn8u7iwSFc9ZkUzHJdKCA+v+Omrgn6Bn5sqsYj7WWJK3WyGn0BD655AoDKsFP3ydsuGPJc6Boks+N1Z3JTrmlHmlVdc6NKnW/FW+5k4PWVWj3s5O/9zb5z5mkZGHjcRt2PPmxSKpmwr9e9hs26Wn1kDJhwJQ2VaVViASb7zcNBZy1wLyj26v/luoht69FwKBl+4eQ1Zcxws0cyKaWgQc2116wwUA0ZQxQmWjRMbVHZNDXr/p3Dd8CobwnWendC9SV9xJrsf4G5SAbph+X6xF7bTspn3tlKLcZ4rri9nkHV/nlE1Pg==
Received: from BL1P223CA0041.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::12)
 by CH1PPFB21296325.namprd12.prod.outlook.com (2603:10b6:61f:fc00::620) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:58:09 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:5b6:cafe::86) by BL1P223CA0041.outlook.office365.com
 (2603:10b6:208:5b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 07:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 07:58:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 00:57:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 5 Aug 2026 00:57:53 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Aug 2026 00:57:46 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 1/3] gpu: nova-core: add formatted tracing
Date: Wed, 5 Aug 2026 10:57:21 +0300
Message-ID: <cdb03b9b0262ef59f3dd93ee3c7bfaa38312ddc4.1785907106.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785907106.git.zhiw@nvidia.com>
References: <cover.1785907106.git.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH1PPFB21296325:EE_
X-MS-Office365-Filtering-Correlation-Id: a599658a-b1df-4b98-2a8d-08def2c74a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|23010399003|6133799003|22082099003|18002099003|3023799007|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	h9E42RadYx8+iHAdS34Xp13RfwTcy+MDyIxOQSlkk8wDgnjG3CcgvqJ81MgeIXWWqkklT+fHsO767px5HaEb+2DVXK1o/g5XyGLX4S66nv5nYkrvh7TGIohDvxOYIxu7nhFOmwNeXW99mni5s7ffjnr/TsHkD/W1dhh57LKP0qGO0mqfRKRCBpcAX/GkQ43Fy0xY+Q15Ccz4b/FzIBaVBfqhv3cbxQhzbPbEPVr4hWS3wCcy7vSSgr3C9RHuj8u9rZVDYVyojjbOIyjKnQ5otieUGpsjJILto0a0kAIL9NyYHXOzyzWS/omFvi69MwseGLNTue+FD1b2fuh8+NWbNEPdnN8YkVkc7YZF65hwuDhElSCDztq0DzwqM58AbO+OBXjyqolXCxFaKc5v6RCNDTThktEAIwho3Tnj3UW+8JS/54uzpBUMVVG/Sx/ozU/ECDBbOsOzwan9w5P4Zvk1gb17al4H+XZmPw3g/kBG5um38REpmUDpZq4N0jwR0HhEE/cwO+pxvSlY6x5MWZQDqj0uIfJ/yg6ohqjaBVmFwWJ5f/G7y8rc6IN7ShqncsU+ZNaKdVL55PdTcMrw2saKW7/ZE6aybup7NerxWMwuNcriAypsRs+yWfnUz1IiSiyZ72ngtNXQTWeEB5YUdJSvaRsJ70TlQFd+4XqAbh6Fd7kZGqAGulV2/Q30KtG+ZdNUb/2BX3JcoToLSX/xv2iAaQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BjMw3wSwAxQri78TAiBW4Gsl5BaA2DlrL/J7V9jyt2ixRFKTq8xnWlzxbDmJuoVI5RLAT9tSNm/H8CjwhSl9f1PGQ3YLd0o8TRurhdWyMSz5qD0Vt9ir68wXFhB0z9i47USnr3oXsIMvIXo3z22C6AVpwCD/06ZL/wXUxNT3UDDHTprokQ7ii9REq2H1iS38gUs4ltL7YZlsS99IBhS/oQaAI9nF4H5tI7pzTDtpJwYuK0glyoiVxQsADRpilXrfVA0EkZGxUQ/vjrRIjpBKlEdX9/ewfGsbv5WDLTkFj6MChXAWl6Syy9w0MriQLySzO+cAdd0u2zumz5shOTvATWBXvKuZAFzdNc9AUBJUi5/0mkks20SyWgXciUQYHODmIQA2mHwsQzhixRtdkvuedvwvIjZR599jlAkKtwWzzkUejIigUOjdjA4Cnoxs5VQx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:58:08.7798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a599658a-b1df-4b98-2a8d-08def2c74a27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFB21296325

Provide formatted trace events for general driver, FSP, GSP and vGPU
messages. Add a shared event class and a formatting helper that avoids
formatting disabled events and uses a fixed-size stack buffer.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/Makefile               |   4 +-
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/trace.c      |   5 +
 drivers/gpu/nova-core/trace.h      |  52 +++++++++
 drivers/gpu/nova-core/trace.rs     | 162 +++++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h    |   4 +
 6 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/trace.c
 create mode 100644 drivers/gpu/nova-core/trace.h
 create mode 100644 drivers/gpu/nova-core/trace.rs

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index e372fc02139f..d26e7dea9e66 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -14,7 +14,9 @@ obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 # system supports cross-crate dependencies natively.
 
 obj-$(CONFIG_NOVA_CORE) += nova-core.o
-nova-core-y := nova-core/nova_core.o nova-core/nova_core_exports.o
+nova-core-y := nova-core/nova_core.o \
+	       nova-core/trace.o \
+	       nova-core/nova_core_exports.o
 
 obj-$(CONFIG_DRM_NOVA) += nova-drm.o
 nova-drm-y := drm/nova/nova.o
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..85ee5067ef56 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -22,6 +22,7 @@
 mod num;
 mod regs;
 mod sbuffer;
+mod trace;
 mod vbios;
 mod vgpu;
 
diff --git a/drivers/gpu/nova-core/trace.c b/drivers/gpu/nova-core/trace.c
new file mode 100644
index 000000000000..c72cb0f65b47
--- /dev/null
+++ b/drivers/gpu/nova-core/trace.c
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define CREATE_TRACE_POINTS
+#define CREATE_RUST_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/gpu/nova-core/trace.h b/drivers/gpu/nova-core/trace.h
new file mode 100644
index 000000000000..a8e5181ba302
--- /dev/null
+++ b/drivers/gpu/nova-core/trace.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM nova_core
+
+#if !defined(_NOVA_CORE_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _NOVA_CORE_TRACE_H_
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(nova_core_trace_class,
+	TP_PROTO(const char *dev, const char *message, size_t message_len),
+	TP_ARGS(dev, message, message_len),
+	TP_STRUCT__entry(
+		__string(dev, dev)
+		__string_len(message, message, message_len)
+	),
+	TP_fast_assign(
+		__assign_str(dev);
+		__assign_str(message);
+	),
+	TP_printk("%s %s", __get_str(dev), __get_str(message))
+);
+
+DEFINE_EVENT(nova_core_trace_class, nova_core_trace_driver,
+	TP_PROTO(const char *dev, const char *message, size_t message_len),
+	TP_ARGS(dev, message, message_len)
+);
+
+DEFINE_EVENT(nova_core_trace_class, nova_core_trace_fsp,
+	TP_PROTO(const char *dev, const char *message, size_t message_len),
+	TP_ARGS(dev, message, message_len)
+);
+
+DEFINE_EVENT(nova_core_trace_class, nova_core_trace_gsp,
+	TP_PROTO(const char *dev, const char *message, size_t message_len),
+	TP_ARGS(dev, message, message_len)
+);
+
+DEFINE_EVENT(nova_core_trace_class, nova_core_trace_vgpu,
+	TP_PROTO(const char *dev, const char *message, size_t message_len),
+	TP_ARGS(dev, message, message_len)
+);
+
+#endif /* _NOVA_CORE_TRACE_H_ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/nova-core
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/nova-core/trace.rs b/drivers/gpu/nova-core/trace.rs
new file mode 100644
index 000000000000..893479b3fcb5
--- /dev/null
+++ b/drivers/gpu/nova-core/trace.rs
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova tracepoint helpers.
+
+use kernel::{
+    ffi::c_char,
+    fmt::{
+        self,
+        Write, //
+    },
+    str::{
+        CStr,
+        CStrExt,
+        Formatter, //
+    }, //
+};
+
+const MESSAGE_MAX: usize = 512;
+
+// To add another formatted Nova Core trace event:
+//
+// 1. Define it from `nova_core_trace_class` in `trace.h`.
+// 2. Declare its Rust entry point with `declare_nova_core_trace!` below.
+// 3. Add a public frontend macro that passes its event name to
+//    `nova_core_trace_impl!`, following the examples at the end of this file.
+pub(crate) mod raw {
+    use super::c_char;
+
+    macro_rules! declare_nova_core_trace {
+        ($event:ident) => {
+            kernel::tracepoint::declare_trace! {
+                /// # Safety
+                ///
+                /// `dev` must point to a valid NUL-terminated string, and
+                /// `message` must point to `message_len` readable bytes for
+                /// this call.
+                pub(crate) unsafe fn $event(
+                    dev: *const c_char,
+                    message: *const c_char,
+                    message_len: usize,
+                );
+            }
+        };
+    }
+
+    declare_nova_core_trace!(nova_core_trace_driver);
+    declare_nova_core_trace!(nova_core_trace_fsp);
+    declare_nova_core_trace!(nova_core_trace_gsp);
+    declare_nova_core_trace!(nova_core_trace_vgpu);
+}
+
+/// Formats and emits a Nova Core text trace event.
+///
+/// # Safety
+///
+/// `trace` must synchronously consume `dev`, `message`, and `message_len`
+/// according to the `nova_core_trace_class` event prototype.
+#[expect(dead_code)]
+pub(crate) unsafe fn nova_core_trace_fmt(
+    dev: &CStr,
+    args: fmt::Arguments<'_>,
+    trace: unsafe fn(*const c_char, *const c_char, usize),
+) {
+    let mut message = [0u8; MESSAGE_MAX];
+    let message_len = {
+        let mut formatter = Formatter::new(&mut message);
+
+        let _ = formatter.write_fmt(args);
+        formatter.bytes_written().min(MESSAGE_MAX)
+    };
+
+    // SAFETY: The caller guarantees that `trace` synchronously consumes its
+    // arguments. The device name is NUL-terminated, and `message` contains
+    // `message_len` initialized bytes.
+    unsafe {
+        trace(
+            dev.as_char_ptr(),
+            message.as_ptr().cast::<c_char>(),
+            message_len,
+        )
+    }
+}
+
+#[expect(unused_macros)]
+macro_rules! nova_core_trace_impl {
+    ($event:ident, $dev:expr, $($arg:tt)*) => {{
+        #[cfg(CONFIG_TRACEPOINTS)]
+        let should_trace = {
+            // SAFETY: `$event` names a real C tracepoint static key.
+            unsafe {
+                kernel::macros::paste! {
+                    kernel::jump_label::static_branch_unlikely!(
+                        kernel::bindings::[<__tracepoint_ $event>],
+                        kernel::bindings::tracepoint,
+                        key
+                    )
+                }
+            }
+        };
+
+        #[cfg(not(CONFIG_TRACEPOINTS))]
+        let should_trace = false;
+
+        if should_trace {
+            match ($dev, kernel::prelude::fmt!($($arg)*)) {
+                (dev, args) => {
+                    // SAFETY: `$event` has the event-class prototype required
+                    // by `nova_core_trace_fmt`.
+                    unsafe {
+                        $crate::trace::nova_core_trace_fmt(
+                            dev.as_ref().name(),
+                            args,
+                            $crate::trace::raw::$event,
+                        )
+                    }
+                }
+            }
+        }
+    }};
+}
+
+// Frontend macros expand in their caller's module and invoke this helper by
+// path, so the re-export must be visible from the parent module.
+#[expect(unused_imports)]
+pub(super) use nova_core_trace_impl;
+
+#[expect(unused_macros)]
+macro_rules! nova_core_trace_driver {
+    ($dev:expr, $($arg:tt)*) => {
+        $crate::trace::nova_core_trace_impl!(nova_core_trace_driver, $dev, $($arg)*)
+    };
+}
+
+#[expect(unused_macros)]
+macro_rules! nova_core_trace_fsp {
+    ($dev:expr, $($arg:tt)*) => {
+        $crate::trace::nova_core_trace_impl!(nova_core_trace_fsp, $dev, $($arg)*)
+    };
+}
+
+#[expect(unused_macros)]
+macro_rules! nova_core_trace_gsp {
+    ($dev:expr, $($arg:tt)*) => {
+        $crate::trace::nova_core_trace_impl!(nova_core_trace_gsp, $dev, $($arg)*)
+    };
+}
+
+#[expect(unused_macros)]
+macro_rules! nova_core_trace_vgpu {
+    ($dev:expr, $($arg:tt)*) => {
+        $crate::trace::nova_core_trace_impl!(nova_core_trace_vgpu, $dev, $($arg)*)
+    };
+}
+
+#[expect(unused_imports)]
+pub(crate) use nova_core_trace_driver;
+#[expect(unused_imports)]
+pub(crate) use nova_core_trace_fsp;
+#[expect(unused_imports)]
+pub(crate) use nova_core_trace_gsp;
+#[expect(unused_imports)]
+pub(crate) use nova_core_trace_vgpu;
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..d1e0a60e370f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -165,3 +165,7 @@ const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DI
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
 #endif
+
+#if IS_ENABLED(CONFIG_NOVA_CORE)
+#include "../../drivers/gpu/nova-core/trace.h"
+#endif
-- 
2.53.0
