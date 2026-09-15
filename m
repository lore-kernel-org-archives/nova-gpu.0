Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78454A3F2B
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505954; cv=fail; b=RTNUv80KvXwn5j4s7oBByY3brFI8johUcRhN3ph4eliU8+rEzHP0fSGipJM/GpVe9joIsJeM5xYmi79uUsN+5n9fV6kCt+XRRm7ojKbIQp4JEZn8CMdP6Lc9Q+SeN1XnMMoqar+ISA/FJuphP8n8+ZhqXetmY4q7YKFOLQdAxR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505954; c=relaxed/simple;
	bh=ZOscDNBBgmBiGa0M9iCngfWW5mJi4zATwb7ZkqqanvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTHSlXZz4DF2FHS+QWaXz//OJGjLilIQiwgBRp4qk5GbgmmEYuzvyJWi/wZ+oDGxK/x5IKrcWUSZPGdV8JTVmt/x4imJWMZTr6oylZXJT+Xdo/JdUTZmT4T51FP1JG2JY5HjNORXYyskenJwMLNWBcXwYKhPxOesrtqM721wwzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aY6tPo4D; arc=fail smtp.client-ip=40.107.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aY6tPo4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2ABh1tO+qB2rQgvuna4cWcfe5cywe4D3rdI37xz/7UIUPTYmnqyMUEcoKwiKjXBN6JkX61t0j5ZQ+asoL3rT9Wn29qYQW0xZkz4zZ+Inv3CdpF+oSY+kKTzWUvz4dHvUdtAHxWinFLdCU/UaEKC6idRhPvm0w4AyNRJFXaUg+6qaNOJrltKK94gOguIJsEya0Z0VkZ0I1b2HBZ9/1JGWICAI5Gapwu73LDYd7h1nsrLU85EsrDFcHKqnhP5Yis34sJnB8RAwsqqZoFFrLtd0QQoAGVkPFoBkrrwlq5ING6ZoTU217sbdSNhYrm0rQ5hzkM6D78/HIxNvdtlHmJwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lv9kmeqDQhMYynQH2CQDcdH1AfpdkKhV23DQhQJQFg=;
 b=BwjFAOFonT3KVGypUPYmwcq8qc3pKWAPfCh53uQ8ZMphXQjpANHKoxsgR+AgJ+/Nh5rEsZj/GkWsu6bkBAMMwP25vf88wlKUI6rTjb0bHB6JebGrgPcV4O+Ta808klINyY9NI5csGik6eqzPYVehfbgTvlWYk99eEXW/maPvvowI0WB7S3r31e0EUx0n1bEXUN5gfafulbwfLzsc0i3ANritgNH4hKbZ7wCUTypXfmVIV0MWYgrmsR8cnhv+D3ehwGwSW4eZof833nSdL2ShsljFZWvt3Ob5fl49DFBZOrrVuSUDYc8/sdSh+8rfWJR9/B8FnzOba2IVQjN7BLfi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lv9kmeqDQhMYynQH2CQDcdH1AfpdkKhV23DQhQJQFg=;
 b=aY6tPo4Duv3DM1tTHekHpudw/3weZK2sH0Jxvqs3hWTZd8CT+rbStPYpjuBLQQEDvvjXZiBHNBHCgxaIs2CWRMEoni+bWH5CAtrVIm+7LH+xSbi3piQVsEVfsPXFq953Rgps2qFN7hLTKHn8bawmuuF4addXDPqTmsqmJGju8JcYZJomjzWVNct9TPyRmH9YgTiEYvOLv6Z0wrCb77nWVNmlsEUQwBELe4P8e7irGaS4X8CHp4Cd2nCPSqZlcxJylLIbstQViOcQXyZ0L6MKon/J9JrVoKyxib/6qIDcsv06i+7mVlRR/DsGNXtczIOZa0DkxWrhSRB5f31vd3HoGw==
Received: from MW4PR04CA0331.namprd04.prod.outlook.com (2603:10b6:303:8a::6)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:58:59 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:303:8a:cafe::5) by MW4PR04CA0331.outlook.office365.com
 (2603:10b6:303:8a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 20:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:44 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:36 -0700
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
Subject: [PATCH 12/14] samples: rust: add C SR-IOV VF driver that calls into a Rust PF driver
Date: Tue, 15 Sep 2026 23:56:56 +0300
Message-ID: <20260915205659.76841-13-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d84cea1-3469-4a2d-40e2-08df136c29b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|1800799024|36860700016|376014|11063799006|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	0tLC9rtTHlYW7+VZCK0fNlwYxhMy1U0ALq7pFcXPHVBuvRflA5CsMn4BGr/G8Mw3xncZFNejWVDNzYmcoSjkDELLJyKFZTdW348NypxuW73Gbf1YjdCiV6lsC/nVIyIVL7iXew4q6iE7SdaLu7ckRDMv5mSEoA/TF5dTY/xfzXtZ6nMygDJoFiWXj4LcPsWUreSj8vWEOXctW2mDqUzr9dPllgK8xe/LsMkErjCmeZF9lHiefwNsbGbNW/9rO1NB9KhgFU9enKwSzUwntigg2nLZg4+ZJwK6f4R1E/9zGPYXvBcwdlaprH0kyCf8WGI/D5GeVLa0AFrKeBa6ntbjan9/Ds61Qh2eLZLaVLPcTIB2dAEwDtzhLPthofnqb5x5YzsUfyoVuRup/PSLRZQNeoFchyu3ol8WKuJP5hbPvUSNKGjuqb+U484B4SebTQrGuhNvCNXIH6iUY4vpTysN6iId3SSLvOTUppRDRFkvmjr2NqX2nmLdPmL556H/zj9HZntpbF7MMb/f6bu7FaJUrLfVNSpGIAhYUzJWDel+UB8sGHnuIqw02YMAnJ5aK5uKrOP4wAkwx24GG2U1kg6E1maii051DaZNwqpkb4eoHbdFtkiFM0oYJeI7pIth/xlyH50gdaSJOvVAKgr2rlIb1mqePPuosCGdN4Z5niF4FPSHi3S4yZLEta+1eJ5jYc+evbB8KDAXEjluthCUsoO7XA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(1800799024)(36860700016)(376014)(11063799006)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o09t4W9W/2jiAhPnp3981dej4qDlaiGpVaCkkODCVKgJ7oxm4RmjHV5IUY7+UayzSTw7Mk+YnWzuy6wrPYYlVYUFrgMV/dmPrxv0OVVfFVAdXQnHL25PcVzcoVBUnfBtfHS+FE+jpBHsZSIIHLU05uPsAkKD5x5GSlIja5C6pqZKTC3/PKGwg+jPQCyf5xpbgxsXgmZSZrH4su/SngjbOCxZkzo1AOv4ZVSS4Dxz7m+6kiQIZJ3oMiCWex7/GPfCpFhl8DPDBPGTFKlGe+fCzeISame1M4qSRbYZhLkc4Rqkh8bXmHqRQ5qU1WAMXwk2vH+ygKtdDW7yDHIAr13JK09VxaZOFh3vdPkHRhq2IF2AGSJKroDvb4XYLd4rDTCCd63N8kgws3RccIXrqErYVNMjJ7ybQdWFPNCS5nJdJwcAkZ08MOocTVaIdc1kSOeL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:58.6614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d84cea1-3469-4a2d-40e2-08df136c29b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707

C drivers need a type-checked way to invoke functionality implemented by
Rust PF drivers without receiving the PF driver's complete private data.
The Rust SR-IOV sample currently demonstrates only a Rust VF consumer.

Add an optional C VF module that borrows the sample's published PF data
through a `struct rust_ffi` descriptor. Validate the ABI token, version,
and operations-table size before calling an automatically generated Rust
trampoline.

Route Rust and C VF requests through the same PF handler. The generated C
callback forwards the requester's PCI ID and translates the Rust `Result`
into the C errno convention. The C driver uses the borrow only while its
VF remains bound, so all users must be drained before its remove callback
returns.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                           |  2 +-
 rust/bindings/bindings_helper.h       |  4 ++
 samples/rust/Kconfig                  | 17 +++++++-
 samples/rust/Makefile                 |  1 +
 samples/rust/rust_driver_sriov.h      | 27 ++++++++++++
 samples/rust/rust_driver_sriov.rs     | 43 ++++++++++++++++---
 samples/rust/rust_driver_sriov_c_vf.c | 61 +++++++++++++++++++++++++++
 7 files changed, 146 insertions(+), 9 deletions(-)
 create mode 100644 samples/rust/rust_driver_sriov.h
 create mode 100644 samples/rust/rust_driver_sriov_c_vf.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f70dc14bf78..e03ebe44c341 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21141,7 +21141,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
-F:	samples/rust/rust_driver_sriov.rs
+F:	samples/rust/rust_driver_sriov*
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 6a30455768b4..2467305c4842 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -112,6 +112,10 @@
 #include <drm/drm_panic.h>
 #endif
 
+#if IS_ENABLED(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)
+#include "../../samples/rust/rust_driver_sriov.h"
+#endif
+
 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
 const size_t RUST_CONST_HELPER_ARCH_KMALLOC_MINALIGN = ARCH_KMALLOC_MINALIGN;
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 737670fd68f8..3747f3fe23dd 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -132,13 +132,28 @@ config SAMPLE_RUST_DRIVER_SRIOV
 	tristate "SR-IOV Driver"
 	depends on PCI_IOV
 	help
-	  This option builds the Rust SR-IOV driver sample.
+	  This option builds the Rust SR-IOV PF and VF driver sample.
 
 	  To compile this as a module, choose M here:
 	  the module will be called rust_driver_sriov.
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV_C_VF
+	tristate "C VF consumer for the Rust SR-IOV driver"
+	depends on SAMPLE_RUST_DRIVER_SRIOV
+	help
+	  This option builds a C VF driver that accesses PF data through FFI
+	  published by the Rust SR-IOV PF sample.
+
+	  To compile this as a module, choose M here: the module will be called
+	  rust_driver_sriov_c_vf. Load it before rust_driver_sriov and enable
+	  VFs only after both drivers are registered. Ensure that no other VF
+	  driver has claimed the device; driver_override may be used for a
+	  deterministic test.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 238a11d5ec39..b52f07df52de 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV_C_VF)	+= rust_driver_sriov_c_vf.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
diff --git a/samples/rust/rust_driver_sriov.h b/samples/rust/rust_driver_sriov.h
new file mode 100644
index 000000000000..1d4dff4e3414
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SAMPLES_RUST_DRIVER_SRIOV_H
+#define _SAMPLES_RUST_DRIVER_SRIOV_H
+
+#include <linux/rust_ffi.h>
+
+#define RUST_DRIVER_SRIOV_FFI_TOKEN_HIGH	0x6c8686c04f7a4ba1ULL
+#define RUST_DRIVER_SRIOV_FFI_TOKEN_LOW		0x77ab9a3c4d3cfb34ULL
+#define RUST_DRIVER_SRIOV_FFI_ABI_MAJOR		1U
+#define RUST_DRIVER_SRIOV_FFI_ABI_MINOR		0U
+
+/**
+ * struct rust_driver_sriov_ops - Operations published by the Rust PF sample
+ * @submit: Submit one request for a requester ID and return 0 or a negative
+ *          errno
+ *
+ * The context passed to each operation must be the context from the borrowed
+ * struct rust_ffi. It remains valid until the VF driver is fully unbound,
+ * including the return of its remove() callback when present.
+ *
+ * @submit may sleep and must not be called from atomic context.
+ */
+struct rust_driver_sriov_ops {
+	int (*submit)(const void *context, u16 requester_id);
+};
+
+#endif /* _SAMPLES_RUST_DRIVER_SRIOV_H */
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
index ae1e1babb66b..f3e37586b0f4 100644
--- a/samples/rust/rust_driver_sriov.rs
+++ b/samples/rust/rust_driver_sriov.rs
@@ -10,15 +10,24 @@
 //!
 //! and append `intel_iommu=on` to the guest kernel arguments.
 //!
+//! The optional `rust_driver_sriov_c_vf` module demonstrates a C VF calling the same PF data
+//! through an FFI operations table.
+//! Load that module before this one and enable VFs only after both drivers are registered.
+//!
 //! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
 //! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
 
 use kernel::{
+    bindings,
     device::{
         Bound,
         Core, //
     },
     driver,
+    interop::ffi::{
+        Abi,
+        Token, //
+    },
     new_mutex,
     pci,
     prelude::*,
@@ -45,8 +54,9 @@ struct PfApi<'bound> {
 
 type PfApiForLt = CovariantForLt!(PfApi<'_>);
 
+#[kernel::macros::ffi_vtable(SAMPLE_FFI_OPS: bindings::rust_driver_sriov_ops)]
 impl PfApi<'_> {
-    fn submit(self: Pin<&Self>, vf: &pci::Device<Bound>) -> Result<u64> {
+    fn submit(self: Pin<&Self>, requester_id: u16) -> Result {
         let mut requests = self.requests.lock();
         let request = (*requests).checked_add(1).ok_or(EOVERFLOW)?;
         *requests = request;
@@ -54,15 +64,34 @@ fn submit(self: Pin<&Self>, vf: &pci::Device<Bound>) -> Result<u64> {
 
         dev_info!(
             self.pdev,
-            "Handle PF request {} from VF devfn {:#x}.\n",
+            "Handle PF request {} from VF requester ID {:#06x}.\n",
             request,
-            vf.dev_id()
+            requester_id
         );
 
-        Ok(request)
+        Ok(())
     }
 }
 
+struct SampleFfiAbi;
+
+// SAFETY:
+// - `RawOps` and the token/version constants come from the C header shared with consumers;
+// - `SAMPLE_FFI_OPS` is initialized as that raw type by `ffi_vtable`; and
+// - every callback recovers the context as the pinned `PfApi` published below.
+unsafe impl Abi for SampleFfiAbi {
+    type Context = PfApiForLt;
+    type RawOps = bindings::rust_driver_sriov_ops;
+
+    const OPS: &'static Self::RawOps = &SAMPLE_FFI_OPS;
+    const TOKEN: Token = Token::new(
+        bindings::RUST_DRIVER_SRIOV_FFI_TOKEN_HIGH,
+        bindings::RUST_DRIVER_SRIOV_FFI_TOKEN_LOW,
+    );
+    const ABI_MAJOR: u16 = bindings::RUST_DRIVER_SRIOV_FFI_ABI_MAJOR as u16;
+    const ABI_MINOR: u16 = bindings::RUST_DRIVER_SRIOV_FFI_ABI_MINOR as u16;
+}
+
 #[pin_data(PinnedDrop)]
 struct PfDriverData<'bound> {
     // Keep the device alive until the registration stops exposing `PfApi::pdev`.
@@ -125,7 +154,7 @@ fn probe<'bound>(
                 // - no other registration is created for this PF; and
                 // - VFs are enabled only after probe by `sriov_configure`.
                 _registration <- unsafe {
-                    pci::VfRegistration::new(
+                    pci::VfRegistration::new_ffi::<SampleFfiAbi, _>(
                         pdev,
                         try_pin_init!(PfApi {
                             pdev,
@@ -191,8 +220,8 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            let request = pf_api.submit(pdev)?;
-            dev_info!(pdev, "Submitted request {} through PF data.\n", request);
+            pf_api.submit(pdev.dev_id())?;
+            dev_info!(pdev, "Submitted request through PF data.\n");
 
             Ok(try_pin_init!(VfDriverData { pdev: pdev.into() }))
         })
diff --git a/samples/rust/rust_driver_sriov_c_vf.c b/samples/rust/rust_driver_sriov_c_vf.c
new file mode 100644
index 000000000000..50df98867361
--- /dev/null
+++ b/samples/rust/rust_driver_sriov_c_vf.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "rust_driver_sriov.h"
+
+#define E1000_DEV_ID_82576_VF	0x10ca
+
+static const struct rust_ffi_token ffi_token = {
+	.high = RUST_DRIVER_SRIOV_FFI_TOKEN_HIGH,
+	.low = RUST_DRIVER_SRIOV_FFI_TOKEN_LOW,
+};
+
+static int rust_driver_sriov_c_vf_probe(struct pci_dev *pdev,
+					const struct pci_device_id *id)
+{
+	const struct rust_driver_sriov_ops *ops;
+	const struct rust_ffi *ffi;
+	int ret;
+
+	ffi = pci_iov_borrow_rust_pf_data(pdev, &ffi_token,
+					  RUST_DRIVER_SRIOV_FFI_ABI_MAJOR,
+					  RUST_DRIVER_SRIOV_FFI_ABI_MINOR,
+					  sizeof(*ops));
+	if (IS_ERR(ffi))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ffi),
+				     "failed to borrow PF FFI\n");
+
+	ops = ffi->ops;
+	if (!ops->submit)
+		return dev_err_probe(&pdev->dev, -EOPNOTSUPP,
+				     "PF FFI does not implement submit\n");
+
+	ret = ops->submit(ffi->context, pci_dev_id(pdev));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to submit through PF FFI\n");
+
+	pci_info(pdev, "submitted request through Rust PF FFI\n");
+
+	return 0;
+}
+
+static const struct pci_device_id rust_driver_sriov_c_vf_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, E1000_DEV_ID_82576_VF) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, rust_driver_sriov_c_vf_id_table);
+
+static struct pci_driver rust_driver_sriov_c_vf_driver = {
+	.name = "rust_driver_sriov_c_vf",
+	.id_table = rust_driver_sriov_c_vf_id_table,
+	.probe = rust_driver_sriov_c_vf_probe,
+};
+module_pci_driver(rust_driver_sriov_c_vf_driver);
+
+MODULE_AUTHOR("Rust for Linux Contributors");
+MODULE_DESCRIPTION("C VF consumer for the Rust SR-IOV driver sample");
+MODULE_LICENSE("GPL");
