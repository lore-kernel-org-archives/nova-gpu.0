Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2BF4A3F2D
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505949; cv=fail; b=aARLf0B+3KyhjjlpRFHcojNqvan8OMskySTN4x0v+XY/lFHgPqbnUcHdNa8RRNcBU6/6Mu0HSVcFEpBhTR+XfNEYGYrxwOyREvsQDxCUXy8Dx7ewz8YgpDRY29f4BYUoMRRtLvKJGlkJ4I8nmxfeeEJiF9aGOVRygiwk95IMXuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505949; c=relaxed/simple;
	bh=9Vt4baizVfky/CNspr3mtc0sBizc+BiMIjfe/iD23GQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFlF3w5LCn6+AoYzPOaJGg6lSOHJ3rbjhk/EaRjuFMIo56grvr51o44afmY/Ags2vKb29I7zn+bY/oSY6Bxvt1xtZ7EWMwltIxTeOV4Q3doBh6f0e/EKLnZot8QImguQmwpMo3JmRXQE1ETdBiQIrQqt3Y8LcZlvj/bemCo3NIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pX/W40kT; arc=fail smtp.client-ip=52.101.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pX/W40kT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiOLxngw4VtAnJR2xoh44eJTjQrOH2szESghuCrp5J6cnG1B/+rIkNzAQT7D+5H2FfQB8LI16M3C73RLRm7GmiEuQBcOHmO4SNmwHsHUIaVi33+8+njT/kn2gn5zNK1b5jjywTPH0FQA/Thbw08uw14jrfShmZGz5SJVjPzZQobYDTcT17XEUtbUphxHOslwEN0nrIB6LKXrsaXMtdwnlZ72JPuM98ccBQyTkoHw+jgs/lGtnF2IiDewofaCZhOe31V6EvCn6K4/YBhxXhYAQYE1/FUk0t/THf8yLpAEAo7/axB1I0lHnMBaGQ2rjDSEmft8YKczt9jOk0DaiIKv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Yb66hh/wcjhZEhupPkdCOUGkHEFRiHJRZS3CCglUcU=;
 b=RcIAaE7uQnbePJXUD/y/rBhaXbyvmF6IZ4RUlIiOSNHHjclhVxg4l88Z/hLUWdsdaTzhcuSa6q79FeY/RoxHOJsQSVMIHAgFJMKEqSnwlt4t92PPG2YGcUQxnDtkt8g1a6+XcHwtd1R9XfF0iM/NuvlwgY+9QqpZym5PT1MuES0ODYEAHQK+b+cOBm1ywLTkw6tqv6yokvns9zduOm/Ch4V3f7v2batbII6aG1mj0g/yeY5qBdIt0UmFt9XbGOr/H/cCVFMl5QIXUUbN+064x+RSx1Sv8rgjnYsJbMY8vwz0eJhPD3FeGOqkVICZJwfSIdtKZSpGQOOkRDr0ybnbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Yb66hh/wcjhZEhupPkdCOUGkHEFRiHJRZS3CCglUcU=;
 b=pX/W40kTXw29WJUrY2S0lvfhbRmID8lxbTMegHT2fLV8nwdt9cJqckCe4bsWKVr52qPDMmOZTmG25FMf44ZByux44GBEhWMQqpvQIemGA815ZAMLatrhr8M3enHs6DO3tVZxdfN9vIKfS2J+gMuEYaXnX5DtPOnTAyYmS9kJthzp1nCxmg7yygyP9mrTjH14sbIbGSByoHGQDUN4Fd+FTLWJBmPPSgjUQq6K/Y/nZYKI3HV7nKUOjtGNIYWqefFKesMIJWwAJxggwCzxuEvFTJ67t7kJXWlTiao0WRfUQfmsptW88xz7GdIRemP+tOimsDi694dZ1xSUPv3ChoU8sQ==
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:58:48 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::1) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:28 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:28 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:20 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH 10/14] rust: add C-to-Rust FFI descriptors and trampolines
Date: Tue, 15 Sep 2026 23:56:54 +0300
Message-ID: <20260915205659.76841-11-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 357138d8-ad79-429d-08eb-08df136c2351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|13003099007|6133799003|3023799007|10067099003|22082099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	DNNX/8xdB3t8+PP75w327ztsPbDYAfffYkE/76L5UIK6M/cL3MRzJbdLGVCmb6ab96rPveA0Da0zkSKRA/fUgRe5bMW1EICWtqljavQOadiE6mYMtYPb89xriXDXD5obQ9nAcYOa5RzNd1yW8DYiJqLnOBIZCXHV/wm/5CElQGeyW5ocUj5MF5/Fc62tFIXCUIGkOAMFJAYTU+NqDPAlbrSqbMH3dLrguZi1SQNBPahjEj0XY2R3qRLpOlTXaRwQye1EJhj1xhiGs4V6+vCAGp80TYWzJrDPAs9LAhnSCbGCGOHX2nUVy0QEbEoFj9pCoZWukxH1WqB7a0xACOldAd3pNjb20JIrmx8nwY3dmV3pb/aNHgLa/xoTWeXZPzxkeGAIQaPvqKuYMUnPQMC4jX0z1pGzvVVxf+sZUUsQRnXN4LG9NSO0PlCODuD0IjDX9F6uW0T535HkCqA54/XiUCby214T8WXDVuVeXyKFa1zkWa6LFRJhwn0CS/k+sBMl4PYon7KoU0iyeG0UBmnbjmnvbxkqQmxfx3tx5AD17pSxkJN1uW4aCxsoUJk30i90ANFj6tvMxgXvkwqbMySP7tqNkGIovzoJkXT3XSfMVTO06SwRR6QnAydgfghQ94L/YigGgsPT0Svak7pVQEdkUXWsq0jOP8qyDDnzhqYDrdp8Ir4aRzVAb2p8cQzyiZlp7TtjgxqCwErAvgWsyUsVbw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(22082099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SAtE3mLAPHebqoUZSBrnplzukoUFeIn55PL1KXvvJRCVFtUCMM1Q6RGdPipY5joMRM9lEg6b2x5LSmhkdjMkyNTqnv9PWfiFuWMQga25LWMPqrmft8Zliup9RlrL79htzC8+ziuK2mcbCVp7gWZ58rcGi+L1LiZkbE0puFalIOJJ6/PjHxDo6PFFnQI4R1gmUXNTlW2Cs2X+Aod+S2HBriKHTP2XYhoirlxpBnPdQdLVa3bANzo6h348dj4KKW0W26MNGKaHZoMnWAMg1k1jIiS7i55RDKcV3B0TdrlTWmxyQyQ2f6NeeaRcZnKWizdo/sJPMElmHjTRjsoCNwZQyuVjNVXeKUz+xpQjcah84PsKROOxos8O489doDR3AD+eBHhwYbXcnsj870QdYkhTlTtzVsp5mgyDXXg8gxWn52MJeRQrQfzsyJVZNUEqKAiO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:47.9558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357138d8-ad79-429d-08eb-08df136c2351
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

Rust drivers may need to expose a restricted operations table to C
consumers. Passing an opaque Rust pointer alone neither identifies the
expected operations-table ABI nor provides type-checked C-compatible
trampolines.

Add `struct rust_ffi` with a stable 128-bit ABI token, version fields, an
operations-table size, and an opaque pinned context. Add
`rust_ffi_borrow()` to validate those fields independently of the
transport that publishes the descriptor. The token is an ABI type tag
and does not provide device identity, authorization, or lifetime
management.

Add matching Rust `Token`, `Abi`, and `Descriptor` abstractions and an
`ffi_vtable` procedural macro. The macro checks the complete bindgen
operations-table layout while generating private C ABI trampolines that
recover a `Pin<&T>`. A sealed return conversion keeps raw return values
unchanged and maps `Result<()>` and `Result<c_int>` to conventional C
integer results. The publishing transport remains responsible for
keeping the descriptor and context alive and pinned until every consumer
has stopped calling it.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                     |   2 +
 include/linux/rust_ffi.h        |  88 ++++++++++++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/interop.rs          |   5 +-
 rust/kernel/interop/ffi.rs      | 239 ++++++++++++++++++++++++++++++++
 rust/macros/ffi_vtable.rs       | 148 ++++++++++++++++++++
 rust/macros/lib.rs              |  90 ++++++++++++
 7 files changed, 571 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/rust_ffi.h
 create mode 100644 rust/kernel/interop/ffi.rs
 create mode 100644 rust/macros/ffi_vtable.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e168398e963..9f70dc14bf78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24003,8 +24003,10 @@ M:	Alexandre Courbot <acourbot@nvidia.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git interop-next
+F:	include/linux/rust_ffi.h
 F:	rust/kernel/interop.rs
 F:	rust/kernel/interop/
+F:	rust/macros/ffi_vtable.rs
 
 RUST [NUM]
 M:	Alexandre Courbot <acourbot@nvidia.com>
diff --git a/include/linux/rust_ffi.h b/include/linux/rust_ffi.h
new file mode 100644
index 000000000000..b3bdcb70ed72
--- /dev/null
+++ b/include/linux/rust_ffi.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_RUST_FFI_H
+#define _LINUX_RUST_FFI_H
+
+#include <linux/err.h>
+#include <linux/types.h>
+
+/**
+ * struct rust_ffi_token - Stable identifier for a Rust FFI ABI
+ * @high: Most significant half of the identifier
+ * @low: Least significant half of the identifier
+ *
+ * A token is the ABI type tag for the opaque operations table. It tells a
+ * consumer which C type and semantics may be used to access @ops. It is not a
+ * device identifier, secret, permission check, or lifetime handle. Providers
+ * and consumers must use the same pair of constants.
+ */
+struct rust_ffi_token {
+	u64 high;
+	u64 low;
+};
+
+/**
+ * struct rust_ffi - C ABI descriptor for calls into Rust
+ * @token: Stable identifier for the FFI ABI
+ * @abi_major: ABI major version
+ * @abi_minor: ABI minor version
+ * @ops_size: Size of the operations table in bytes
+ * @ops: C ABI operations table
+ * @context: Immutable provider context passed to operations
+ *
+ * Providers must fully initialize this descriptor before publishing it and
+ * must keep the descriptor, operations table, and context alive and immutable
+ * while it is published. A published callable descriptor has non-NULL @ops
+ * and @context pointers. A NULL @ops indicates that no C-callable FFI is
+ * available.
+ *
+ * Minor versions may only append operations to the table. Consumers request
+ * an ABI major version, a minimum ABI minor version, and the size of the table
+ * prefix they use.
+ */
+struct rust_ffi {
+	struct rust_ffi_token token;
+	u16 abi_major;
+	u16 abi_minor;
+	size_t ops_size;
+	const void *ops;
+	const void *context;
+};
+
+/**
+ * rust_ffi_borrow - Validate and borrow a Rust FFI descriptor
+ * @ffi: Descriptor to borrow
+ * @token: Required FFI ABI token
+ * @abi_major: Required ABI major version
+ * @min_abi_minor: Minimum required ABI minor version
+ * @required_ops_size: Minimum required size of the operations table
+ *
+ * This validates only the descriptor contents. The caller must arrange for
+ * @ffi, its operations table, and its context to remain alive and immutable
+ * for the entire borrow.
+ *
+ * Return: @ffi on success, or an ERR_PTR() value on failure.
+ */
+static inline const struct rust_ffi *
+rust_ffi_borrow(const struct rust_ffi *ffi,
+		const struct rust_ffi_token *token,
+		u16 abi_major, u16 min_abi_minor, size_t required_ops_size)
+{
+	if (!token)
+		return ERR_PTR(-EINVAL);
+
+	if (!ffi || !ffi->ops || !ffi->context)
+		return ERR_PTR(-ENOENT);
+
+	if (ffi->token.high != token->high || ffi->token.low != token->low)
+		return ERR_PTR(-ENOENT);
+
+	if (ffi->abi_major != abi_major || ffi->abi_minor < min_abi_minor)
+		return ERR_PTR(-EPROTONOSUPPORT);
+
+	if (ffi->ops_size < required_ops_size)
+		return ERR_PTR(-EMSGSIZE);
+
+	return ffi;
+}
+
+#endif /* _LINUX_RUST_FFI_H */
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 930e63290cdd..6a30455768b4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -85,6 +85,7 @@
 #include <linux/random.h>
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
+#include <linux/rust_ffi.h>
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/serdev.h>
diff --git a/rust/kernel/interop.rs b/rust/kernel/interop.rs
index 3b371d782a59..9241f3650468 100644
--- a/rust/kernel/interop.rs
+++ b/rust/kernel/interop.rs
@@ -3,7 +3,8 @@
 //! Infrastructure for interfacing Rust code with C kernel subsystems.
 //!
 //! This module is intended for low-level, unsafe Rust infrastructure code
-//! that interoperates between Rust and C. It is *not* for use directly in
-//! Rust drivers.
+//! that interoperates between Rust and C. Drivers should normally use the
+//! generated adapters and safe subsystem abstractions built on top of it.
 
+pub mod ffi;
 pub mod list;
diff --git a/rust/kernel/interop/ffi.rs b/rust/kernel/interop/ffi.rs
new file mode 100644
index 000000000000..a8c16a29110a
--- /dev/null
+++ b/rust/kernel/interop/ffi.rs
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! C-compatible descriptors for calls into Rust.
+//!
+//! An FFI descriptor contains an operations table plus an opaque, pinned Rust context. This
+//! module deliberately does not publish the descriptor or manage its lifetime. A transport, such
+//! as PCI SR-IOV, must keep the context alive and pinned for as long as a consumer can call through
+//! the descriptor.
+
+use crate::{
+    bindings,
+    types::ForLt, //
+};
+use core::{
+    ffi::c_void,
+    pin::Pin, //
+};
+
+/// A transport-independent token identifying an FFI ABI.
+///
+/// Consumers compare this token before interpreting an opaque operations-table pointer. It is an
+/// ABI type tag, not a device identifier, secret, authorization capability, or lifetime handle.
+///
+/// This is a transparent wrapper around
+/// [`struct rust_ffi_token`](srctree/include/linux/rust_ffi.h).
+#[derive(Clone, Copy)]
+#[repr(transparent)]
+pub struct Token(bindings::rust_ffi_token);
+
+impl Token {
+    /// Creates an FFI token from its most and least significant halves.
+    pub const fn new(high: u64, low: u64) -> Self {
+        Self(bindings::rust_ffi_token { high, low })
+    }
+
+    /// Returns the most significant half of the token.
+    pub const fn high(self) -> u64 {
+        self.0.high
+    }
+
+    /// Returns the least significant half of the token.
+    pub const fn low(self) -> u64 {
+        self.0.low
+    }
+}
+
+impl PartialEq for Token {
+    fn eq(&self, other: &Self) -> bool {
+        self.high() == other.high() && self.low() == other.low()
+    }
+}
+
+impl Eq for Token {}
+
+/// Defines the identity, Rust context, and raw operations-table type of an FFI ABI.
+///
+/// Implementations are normally paired with an operations table generated by [`ffi_vtable`]. The
+/// Rust provider and every C consumer must share the corresponding C definition.
+///
+/// [`ffi_vtable`]: crate::macros::ffi_vtable
+///
+/// # Safety
+///
+/// Implementers must ensure that:
+///
+/// - [`RawOps`](Self::RawOps) has a stable C-compatible layout and [`OPS`](Self::OPS) is a fully
+///   initialized instance of that layout;
+/// - for every possible data lifetime, every callback in `OPS` interprets its context as a pinned
+///   [`ForLt::Of`] value with that lifetime, only borrows it for the duration of the callback, and
+///   does not leak or otherwise extend references derived from it;
+/// - [`TOKEN`](Self::TOKEN) and the ABI version uniquely identify that layout and its semantics;
+///   and
+/// - changing `RawOps` incompatibly also changes the ABI major version.
+pub unsafe trait Abi: 'static {
+    /// Rust context type expected by the operations-table callbacks.
+    ///
+    /// The context may be invariant in its encoded data lifetime.
+    type Context: ForLt + 'static;
+
+    /// Raw C-compatible operations-table type.
+    type RawOps: Sync + 'static;
+
+    /// Static operations table published for this ABI.
+    const OPS: &'static Self::RawOps;
+
+    /// Token shared by providers and consumers of this FFI ABI.
+    const TOKEN: Token;
+
+    /// ABI major version, incremented for incompatible changes.
+    const ABI_MAJOR: u16;
+
+    /// ABI minor version, incremented for compatible extensions.
+    const ABI_MINOR: u16;
+}
+
+/// A C-compatible descriptor for an opaque Rust context and operations table.
+///
+/// This is a transparent wrapper around
+/// [`struct rust_ffi`](srctree/include/linux/rust_ffi.h). It neither owns nor borrows the
+/// operations table or Rust context at the type level. The transport that publishes it must ensure
+/// that `ops` remains valid and that `context` remains alive at a stable address until all
+/// consumers have stopped using the descriptor.
+#[repr(transparent)]
+pub struct Descriptor(bindings::rust_ffi);
+
+impl Descriptor {
+    /// Creates a descriptor for a pinned Rust context.
+    ///
+    /// The descriptor does not retain the provider's Rust type or lifetime. A transport must not
+    /// publish it for longer than `context` remains alive and pinned.
+    pub fn new<'borrow, 'data, A>(context: Pin<&'borrow <A::Context as ForLt>::Of<'data>>) -> Self
+    where
+        A: Abi,
+        for<'b> <A::Context as ForLt>::Of<'b>: Send + Sync,
+    {
+        Self(bindings::rust_ffi {
+            token: A::TOKEN.0,
+            abi_major: A::ABI_MAJOR,
+            abi_minor: A::ABI_MINOR,
+            ops_size: core::mem::size_of::<A::RawOps>(),
+            ops: core::ptr::from_ref(A::OPS).cast(),
+            context: core::ptr::from_ref(context.get_ref()).cast(),
+        })
+    }
+
+    /// Returns the FFI ABI token.
+    pub const fn token(&self) -> Token {
+        Token(self.0.token)
+    }
+
+    /// Returns the FFI ABI major version.
+    pub const fn abi_major(&self) -> u16 {
+        self.0.abi_major
+    }
+
+    /// Returns the FFI ABI minor version.
+    pub const fn abi_minor(&self) -> u16 {
+        self.0.abi_minor
+    }
+
+    /// Returns the size in bytes of the raw operations table.
+    pub const fn ops_size(&self) -> usize {
+        self.0.ops_size
+    }
+
+    /// Returns the operations-table pointer.
+    pub const fn ops(&self) -> *const c_void {
+        self.0.ops
+    }
+
+    /// Returns the provider-context pointer.
+    pub const fn context(&self) -> *const c_void {
+        self.0.context
+    }
+
+    /// Returns a raw pointer to the underlying C descriptor.
+    pub const fn as_raw(&self) -> *const bindings::rust_ffi {
+        core::ptr::from_ref(&self.0)
+    }
+}
+
+/// Implementation details for generated FFI adapters.
+#[doc(hidden)]
+pub mod __private {
+    use crate::{
+        error::{
+            from_result,
+            Result, //
+        },
+        ffi::c_int,
+        types::ForLt, //
+    };
+    use core::{
+        ffi::c_void,
+        pin::Pin, //
+    };
+
+    mod sealed {
+        use super::{
+            c_int,
+            Result, //
+        };
+
+        pub trait Sealed<C> {}
+
+        impl<T> Sealed<T> for T {}
+        impl Sealed<c_int> for Result<()> {}
+        impl Sealed<c_int> for Result<c_int> {}
+    }
+
+    /// Converts a Rust operation return value into the return type of its C callback.
+    ///
+    /// The C return type is supplied by the raw operations-table field. This trait is sealed so
+    /// generated adapters can select only the conversions defined by this module.
+    pub trait FfiReturn<C>: sealed::Sealed<C> {
+        /// Performs the return-value conversion.
+        fn into_ffi(self) -> C;
+    }
+
+    impl<T> FfiReturn<T> for T {
+        #[inline]
+        fn into_ffi(self) -> T {
+            self
+        }
+    }
+
+    impl FfiReturn<c_int> for Result<()> {
+        #[inline]
+        fn into_ffi(self) -> c_int {
+            from_result(|| self.map(|()| 0))
+        }
+    }
+
+    impl FfiReturn<c_int> for Result<c_int> {
+        #[inline]
+        fn into_ffi(self) -> c_int {
+            from_result(|| self)
+        }
+    }
+
+    /// Accesses a pinned Rust context through a higher-ranked closure.
+    ///
+    /// # Safety
+    ///
+    /// `context` must have been obtained from a `Pin<&F::Of<'data>>` for some data lifetime and
+    /// must point to that live, properly aligned value, which remains pinned and valid for shared
+    /// access throughout this call. The pointed-to value must not be mutated except through
+    /// synchronization-safe interior mutability.
+    pub unsafe fn with_context<F: ForLt + 'static, R>(
+        context: *const c_void,
+        f: impl for<'borrow, 'data> FnOnce(Pin<&'borrow F::Of<'data>>) -> R,
+    ) -> R {
+        // SAFETY: The caller guarantees a live, pinned context of this lifetime family. The
+        // higher-ranked closure keeps the borrow independent of the erased data lifetime, so it
+        // cannot escape or be stored in the context's invariant data.
+        let context = unsafe { Pin::new_unchecked(&*context.cast::<F::Of<'_>>()) };
+        f(context)
+    }
+}
diff --git a/rust/macros/ffi_vtable.rs b/rust/macros/ffi_vtable.rs
new file mode 100644
index 000000000000..ad3176d1f8e1
--- /dev/null
+++ b/rust/macros/ffi_vtable.rs
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro2::TokenStream;
+use quote::{
+    format_ident,
+    quote, //
+};
+use syn::{
+    parse::{
+        Parse,
+        ParseStream, //
+    },
+    Attribute,
+    Error,
+    FnArg,
+    Ident,
+    ImplItem,
+    ItemImpl,
+    Path,
+    Result,
+    ReturnType,
+    Token, //
+};
+
+pub(crate) struct FfiVtableArgs {
+    table: Ident,
+    ops: Path,
+}
+
+impl Parse for FfiVtableArgs {
+    fn parse(input: ParseStream<'_>) -> Result<Self> {
+        let table = input.parse()?;
+        let _: Token![:] = input.parse()?;
+        let ops = input.parse()?;
+
+        Ok(Self { table, ops })
+    }
+}
+
+fn has_conditional(attributes: &[Attribute]) -> bool {
+    attributes
+        .iter()
+        .any(|attribute| attribute.path().is_ident("cfg") || attribute.path().is_ident("cfg_attr"))
+}
+
+pub(crate) fn ffi_vtable(args: FfiVtableArgs, item: ItemImpl) -> Result<TokenStream> {
+    if item.trait_.is_some()
+        || !item.generics.params.is_empty()
+        || item.generics.where_clause.is_some()
+    {
+        return Err(Error::new_spanned(
+            &item,
+            "`#[ffi_vtable]` requires a concrete, non-generic inherent impl",
+        ));
+    }
+    if has_conditional(&item.attrs) {
+        return Err(Error::new_spanned(
+            &item,
+            "`#[ffi_vtable]` does not support conditionally compiled impls",
+        ));
+    }
+
+    let ops = &args.ops;
+    let table = &args.table;
+    let self_ty = &item.self_ty;
+    let private = quote!(::kernel::interop::ffi::__private);
+    let mut fields = Vec::new();
+
+    for impl_item in &item.items {
+        let ImplItem::Fn(method) = impl_item else {
+            continue;
+        };
+        let signature = &method.sig;
+        if has_conditional(&method.attrs)
+            || !signature.generics.params.is_empty()
+            || signature.generics.where_clause.is_some()
+        {
+            return Err(Error::new_spanned(
+                method,
+                "`#[ffi_vtable]` requires unconditional, non-generic methods",
+            ));
+        }
+
+        let mut argument_names = Vec::new();
+        let mut argument_types = Vec::new();
+        for argument in &signature.inputs {
+            let FnArg::Typed(argument) = argument else {
+                continue;
+            };
+
+            let index = argument_names.len();
+            argument_names.push(format_ident!("__ffi_vtable_arg_{index}"));
+            argument_types.push(&argument.ty);
+        }
+
+        let method_name = &signature.ident;
+        let rust_output = match &signature.output {
+            ReturnType::Default => quote!(()),
+            ReturnType::Type(_, ty) => quote!(#ty),
+        };
+
+        fields.push(quote! {
+            #method_name: ::core::option::Option::Some({
+                unsafe extern "C" fn callback<__FfiVtableReturn>(
+                    __ffi_vtable_context: *const ::core::ffi::c_void,
+                    #(#argument_names: #argument_types),*
+                ) -> __FfiVtableReturn
+                where
+                    #rust_output: #private::FfiReturn<__FfiVtableReturn>,
+                {
+                    let __ffi_vtable_call = |__ffi_vtable_this: ::core::pin::Pin<&#self_ty>| {
+                        // Infer the receiver within the closure's context lifetime.
+                        let __ffi_vtable_method: unsafe fn(
+                            ::core::pin::Pin<&_>,
+                            #(#argument_types),*
+                        ) -> #rust_output = <#self_ty>::#method_name;
+
+                        #private::FfiReturn::<__FfiVtableReturn>::into_ffi(
+                            // SAFETY: An unsafe method relies on the C caller satisfying its
+                            // argument contract.
+                            unsafe {
+                                __ffi_vtable_method(__ffi_vtable_this, #(#argument_names),*)
+                            },
+                        )
+                    };
+
+                    // SAFETY: The publisher keeps the context live and pinned while callbacks run.
+                    unsafe {
+                        #private::with_context::<::kernel::types::ForLt!(#self_ty), _>(
+                            __ffi_vtable_context,
+                            __ffi_vtable_call,
+                        )
+                    }
+                }
+
+                callback::<_>
+            })
+        });
+    }
+
+    Ok(quote! {
+        #item
+
+        static #table: #ops = #ops {
+            #(#fields),*
+        };
+    })
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 9b76efe1476f..c9bd09148301 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -16,6 +16,7 @@
 
 mod concat_idents;
 mod export;
+mod ffi_vtable;
 mod fmt;
 mod for_lt;
 mod helpers;
@@ -263,6 +264,95 @@ pub fn export(attr: TokenStream, input: TokenStream) -> TokenStream {
     export::export(parse_macro_input!(input)).into()
 }
 
+/// Generates a C-compatible operations table for a concrete Rust implementation.
+///
+/// The attribute declares the name of the table to generate and its bindgen-generated raw
+/// operations type:
+///
+/// ```
+/// use core::{
+///     ffi::{
+///         c_int,
+///         c_void, //
+///     },
+///     pin::Pin, //
+/// };
+/// use kernel::{
+///     macros::ffi_vtable,
+///     prelude::*, //
+/// };
+///
+/// #[repr(C)]
+/// struct ExampleOps {
+///     submit: Option<unsafe extern "C" fn(*const c_void, u16) -> c_int>,
+///     reset: Option<unsafe extern "C" fn(*const c_void) -> c_int>,
+///     version: Option<unsafe extern "C" fn(*const c_void) -> u16>,
+/// }
+///
+/// struct Provider;
+///
+/// #[ffi_vtable(EXAMPLE_OPS: ExampleOps)]
+/// impl Provider {
+///     fn submit(self: Pin<&Self>, requester_id: u16) -> Result<c_int> {
+///         Ok(c_int::from(requester_id))
+///     }
+///
+///     fn reset(self: Pin<&Self>) -> Result {
+///         Ok(())
+///     }
+///
+///     fn version(self: Pin<&Self>) -> u16 {
+///         1
+///     }
+/// }
+///
+/// # fn main() {
+/// assert!(EXAMPLE_OPS.submit.is_some());
+/// assert!(EXAMPLE_OPS.reset.is_some());
+/// assert!(EXAMPLE_OPS.version.is_some());
+/// # }
+/// ```
+///
+/// Each method becomes a field of the same name in `EXAMPLE_OPS`. The generated C callback has an
+/// additional `*const c_void` context as its first argument. It recovers a `Pin<&Provider>` from
+/// that context inside a higher-ranked closure and forwards the remaining arguments. This also
+/// supports implementations such as `impl Provider<'_>` whose data lifetime is invariant. The
+/// closure keeps that data lifetime independent of the callback's borrow. Return values are
+/// forwarded unchanged, except that a [`Result<c_int>`] is converted into a `c_int`, preserving a
+/// successful value, and a [`Result<()>`] is converted into zero on success. Both return a negative
+/// errno on failure.
+/// Initializing the raw bindgen type with a struct literal checks the field names and callback
+/// signatures at compile time.
+///
+/// The attribute supports concrete inherent impls. Methods must otherwise use ABI-shaped argument
+/// and return types. They must be non-async, non-generic Rust methods with a `self: Pin<&Self>`
+/// receiver. A method may be safe when its arguments require no validity assumptions beyond their
+/// Rust types. It must be `unsafe fn` when calling it relies on additional C-side guarantees, such
+/// as the validity of a raw pointer argument. Every field of the raw operations structure must have
+/// a matching method; optional methods and conditionally compiled impls, methods, or arguments are
+/// not supported yet. Argument and return types must spell out concrete types instead of using
+/// `Self`.
+///
+/// [`Result<c_int>`]: ../kernel/error/type.Result.html
+/// [`Result<()>`]: ../kernel/error/type.Result.html
+///
+/// # Safety contract
+///
+/// The code publishing the generated table must pass a non-null context pointer to a valid pinned
+/// instance of the implementation type, with the same lifetime family, and keep that instance alive
+/// and valid for shared access for every callback. Callers must uphold the safety contract of each
+/// unsafe method. The macro emits private function-pointer callbacks and does not export symbols
+/// for them.
+#[proc_macro_attribute]
+pub fn ffi_vtable(attr: TokenStream, input: TokenStream) -> TokenStream {
+    ffi_vtable::ffi_vtable(
+        parse_macro_input!(attr as ffi_vtable::FfiVtableArgs),
+        parse_macro_input!(input as syn::ItemImpl),
+    )
+    .unwrap_or_else(|error| error.into_compile_error())
+    .into()
+}
+
 /// Like [`core::format_args!`], but automatically wraps arguments in [`kernel::fmt::Adapter`].
 ///
 /// This macro allows generating `fmt::Arguments` while ensuring that each argument is wrapped with
