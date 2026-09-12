Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7A38423B
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188275; cv=fail; b=ABtpXW4kd/N2MbgpvVAPn9pBss+X2KNkmGFHS8Ze2sRGjzzn3Sd/bZh2rbQIEMPbhZPPuZslOfEP+2/QLV59XLO939fXt5rM/odapxpojH2KvvkltjeKUkoMHPFD42/KWLsyQXZzv/f2Olb0WpeSAxdiTdkvWVaCLWowDRkNJGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188275; c=relaxed/simple;
	bh=uucBPYsjvpMs6BC5eyn0gPXfCxhvFZNXXDxp+AJM3O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lKNrWt/A1L6dkU6/J7Yh7l+6z++fZX1JXunOhIkqTJj1zivasuTPcOti0oDmwOWFSZ70ANJiNKFrlrZQaa4S6jOdYaRKxILtipav9C3PCHaGXCVWZIIf4vvE0Tcq9itnHK8+PFiExuOmPdf1s7oHdJZotK4Ou/AAszIXlqFVQxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PbvvHv3a; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PbvvHv3a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ1M+GY07orA0BPQdyaAx++/iJtdl77bpp7hx0NWmWENjYeKsDrrlH8msXej48ypPz+8j95PRldIukneP4+apuo1A3OvsU6TTREkDgLCUz7lZ9rVot+qXGN4UWq3LQzJmo4tAFLq5k1IpDT3nA5rdXfVQNzC+I31yN53hZggc4lkssddrA3HyoFuB9EayPD8RZ/N72HgDTicGdSgoeZHnQBJ4YZuwU379TSfvJBNH+itSF1jFFDotwY4B0EsSdElGi0ZPIIfUUCmazpb15yn+cNDcIR1A+FhHqQ3bH/aOo3mau73sN6jW/fIAzMAxFFFuUtr1rWCXvrCbzxk2V3oHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dphgfae5pUaEKkRSGAjpjvZmaXfOQ0U4XEQOTzzDNsk=;
 b=a1MfWm/201LxvG0GH+SBzNZNcw+jBSJ/+GTRVXO5hg9VPk1yOnfBeoxeHyYjDC7n7cCleWpW3gaNEDH6fK2ZIKV2yHuS1d2wY4fhlbeFjRo9FGem1L3AVBGz+4ry45JnA6bYIn3ZOlqDTiWu2FYlwrMTPmyJEYOCCJFozSgxaUBv6DzyVvbdqUdEITYi4c8T8kYpeXLTo5DztHztzZOJwJViTqT7iK8RullJcZIHRfF2UqLXlz/XDAvaM/Aws0okfoj/J/OSFzS/z2mbGmmf7LepGFF5sH6zGIqvEvNas5FxaQ5gKCV2dZW3VQJZLVy5PoN9vmqgqq3O6DLRB9bk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dphgfae5pUaEKkRSGAjpjvZmaXfOQ0U4XEQOTzzDNsk=;
 b=PbvvHv3aCtMZf59oU3WekOGn7iaca3g+yv8iejfTdZ3v9WSpDWOXJk5HVR3lbV+cKN4xjksQYnL1NPgTXFwcbXitnB7DRs7JHoBs9/K7Es14CmQK6QPkVhSr3UVZqHiLfQM9s7dr4BoMrEWBfVTex5JTl8JNKCxDJWrcjmR7Ax7sqyTGjDXOgNldTQTJA8iXU8fAFDN3HM1GczZNozgtdJMryfjgHY31pFpMKo5Ih4p8tMBTCF3EhDbSwQtA4g2Q+YTZbu6RC2pGQjDqp3BAch86rMBKpVzD+HYyArQmj9TaUgL5dAslhaHHmPVHC4rUv20L3SQB5NX7ZSNNct88Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:22 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 08/17] gpu: nova-core: add an interrupt delivery self-test
Date: Fri, 11 Sep 2026 21:43:51 -0700
Message-ID: <20260912044400.677097-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 003087e6-1039-42d3-4ebd-08df10888389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	uVBHHBvnNV+1nvpXy+6/KxV0V9YtQIuJRrfhwzAhfU31YAmBqW1xkggd4jbRhrOsCii83jVerpmSdjVjpug2g8Q55uTnaLr5DAAZGinN2/oxFbdjIYB5yEpryiIVw3JtdhjdPrfVQNUxD29E/WHbnG311sFXXL9DZPFocrnKC3WLblDypw1ZvJzIXL52hDWMdHysQ67BawyrvZkD8GcBPL4EQ5hcnvyiMD4S97P4UFaitH/AkVoh97RA9BF6FHuSIFo7b1njvIZZWcrztfd6kv5JUd1zITw48d++J7EYwIhz9LKRIh2lSxV3cFeMg+g/Oo6zCGMWENWY9ezoRDzn8Am+xXldd++jYru99CZhxBiIgTzIAo2afJ3yT56bWJny5/tkkIAdengIgMiofCf+Dt8zH+4t3JwNoQGGhaGIkYKxzVcxCmv1yre3s0vuI7PsO6G6mI54omuHXW0IGhrd7EREVf332fy7KP009Ej6q1RSiaoKk6p8vRaaTFUF42z2LamVXdSBzNVUKud/QTPPGy3bBacK5eMV7o83pnYYhUjxkZVYKLn3p/3PMpaB1+h/qR6JZq/iXka+FKuMtbI36frTuVhoDowZ+1snbvyb3UYNTUE14g1ip9GVtPcQWcWs1TccDYzX8GW5EqA+u5vZE3gBm0DZ/Y0j1TI5iSQmn7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8BBdDn09UcIKpdy3r3FM/sRELP/McmtpDHbbO//By4c/B5fHIZcx4jbb8+Mq?=
 =?us-ascii?Q?0pBrKhhK81lsUxH31r5PbWYIIXJzuH2WCkGENYSPKLymPWDEUlbHauLHhuNf?=
 =?us-ascii?Q?6jIP6m6VTJggiVgu1mfySYf9yjN9xQPG33sr5F35MEUdbkiBYTr6kULfNm9g?=
 =?us-ascii?Q?ihtpihaoxg9KBwRFbLyDIJZ/U/jRwhEYbvoBozpZ3Hj8NcAGfGb9CcBs3wRW?=
 =?us-ascii?Q?ZUbC+HRoKU+v29A0X2Tu8QoQv2yAnDnlwKhZhcivvW1ylnDDaDafXW8QsP0z?=
 =?us-ascii?Q?xi9vShL7x8yVrpC3RbJmtmoyPt0cqJCxi7IUHyoubbOB1HGDS8lKRKU/8Wh/?=
 =?us-ascii?Q?EAL42M3hpR41t09bUzvFMLo5njj54eZLHgzVJymV7qzYR6Rm4xIycJwwTqU5?=
 =?us-ascii?Q?6yKhzYA9+naTglJNkVXDPLAwz6Yi0qoDxFMpGRbU5H5pYLOhLyQ9I2lnCQax?=
 =?us-ascii?Q?9//m+CQGlvg7XEPFHuyL2Ebyl6ypF+7S71fNFf5aFC4q4wdyN6ZuUEa7wc/s?=
 =?us-ascii?Q?71m1MgCyNbX7nevapkNp68ouiVx1rjA6KQVLGzmj57tTQH/NxgIL+ctREWHe?=
 =?us-ascii?Q?HZKnOnr0ot8ZycF/TJxZDxOAlgHUFjg38ZM3tYcp2E/r+6o1/SGW+n3cfrGh?=
 =?us-ascii?Q?5JShtd+oaYfVBlQTR3AbiCg2QD8xol+cUB4QK4sCZJPJKREZI3sNDX73tjvV?=
 =?us-ascii?Q?tsPDeu8CSGwolVjzFycL1rWv8ihoHOSS5QIC0aDHDFPEdcgRUhSw+MfUj6Ob?=
 =?us-ascii?Q?TgANCj0mPkSSkMuqAOaC63wB26eo3cj9OQFF4Y+jhuR7ejOeYqLjfAkMakan?=
 =?us-ascii?Q?Rsj5IiV7aJuClA34nnYFHrlfaDfoq0JaNil53oJ6VCTfz4778u/0fpd3UB06?=
 =?us-ascii?Q?n8+sFpMi9LgqIgrgPyIvVdtLkll7qlZ2/iMfR9vIKT19IN4SbhsY1J/C+AIv?=
 =?us-ascii?Q?wrqe/vXvRKwoBoI9ij85LjT+xOK7wwRhGF06S4BKLjNUU5h/6h3xxPj4lOaQ?=
 =?us-ascii?Q?OjKEYtWuL33LaQlyYaXHH9gu9zg4u7mNgGXuVwP+n5sFS/VkAvgP+VK0n6hl?=
 =?us-ascii?Q?7h34V8L0Mw+9RQqYs+yJfRClSXq7tOOx4+afpK65+L25Q+Cp2sacXlvnh5c9?=
 =?us-ascii?Q?BnXoLOPAay155TrIbDD818rXfG9uMK4IoRv3kExccycGlyB0dz1lhM4Bdjtd?=
 =?us-ascii?Q?IZuzyNlCV6mmjFJ/kN0rUFkNegbwPbz/9W31Mo9lPC5pKviyUbCKHLI2FuKt?=
 =?us-ascii?Q?lRvypEtNw4RAfmHQ0qDXabwm4+MNHUUqPVq5j0sOLIWlJmVZOxdXzP2b1PSR?=
 =?us-ascii?Q?LyFI2YA76go3sWHPD2T5MD6sHlbYSj2n7wd/UVANPWex980w/VF3V8GraVEU?=
 =?us-ascii?Q?qhODrhGmbERh0Arrd2MTxjywd8o97u8762hMZH+Y70iN+rNg4owCTeRaitRp?=
 =?us-ascii?Q?x7SgCiIQh0ocG7Hwov2kvCSEVlm7E1cQP3oPq65cjxzxPSQAJD/KApEiwe4v?=
 =?us-ascii?Q?DeeN7z2Uk/TLyJwTqMyTiZclsz+g50YXIbCAXekHPA64LSiD5pJXfzNiWC1x?=
 =?us-ascii?Q?UKURaUQeXYzJlDKDC5r6yeP2p1zAyfzEBTl/DXT4Fz7seVVjamWjKm6XDv9q?=
 =?us-ascii?Q?pwbjLQAJ1K9jLC+dm8L6Jyd3i1JYKwtuQXTNmjXYRYw7xPcFCxPeUaUDBBxX?=
 =?us-ascii?Q?kiD7sjiX8o99VJ9VYUa0MjZCcho4uvLgqNUNLTSUn9Gvp2raGGro1vZzQq3O?=
 =?us-ascii?Q?uYplFbISlA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003087e6-1039-42d3-4ebd-08df10888389
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:21.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJrHoQHht2lxI15q5r6CYhM2CcU80n2ZvvB11A6rk8yM0G/6xVf4QC+xGC0Jxj2as79ZsklxjR9SIGA6gOnUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
tree's enables, or in the rearm, and every one of those failures looks
the same: no interrupt arrives, and nothing says which one broke.

Add a probe-time self-test, built under NOVA_CORE_SELFTESTS, that
latches the CPU doorbell vector through the GIN software trigger and
waits for a registered handler to service it. One delivery would pass
with a broken rearm, because the first message-signaled interrupt
arrives whether or not the driver rearms, so the test triggers twice and
waits for the first handler to finish before the second trigger. It runs
after GFW boot and before GSP boot, on a quiesced tree, and fails probe
unless both deliveries arrive, each finds only the doorbell pending, and
the leaf ends clear.

The doorbell has the same vector on every supported GPU, so the test
names it without asking GSP-RM. It allocates the PCI vectors for the
doorbell's subtree and releases them before returning, so under MSI-X
the delivery also exercises that subtree's table entry.

Assisted-by: LLM
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig               |   5 +
 drivers/gpu/nova-core/driver.rs             |   5 +
 drivers/gpu/nova-core/irq.rs                |   2 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 266 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   2 +-
 drivers/gpu/nova-core/nova_core.rs          |   2 +-
 6 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 1934f17baa8b..2e11e46c99c7 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -24,4 +24,9 @@ config NOVA_CORE_SELFTESTS
 	help
 	  Build the driver self-tests and run them when the GPU is probed.
 
+	  If the interrupt delivery test fails, the probe fails and the driver
+	  does not bind to the GPU. A broken interrupt path would otherwise
+	  show up later as a hang, far from its cause. Every other self-test
+	  logs its failure and lets the probe continue.
+
 	  If unsure, say N.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 15a44f9a6441..4400cae8c8ce 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -119,6 +119,11 @@ fn probe<'bound>(
                     let spec = Spec::new(pdev.as_ref(), bar)?;
 
                     gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;
+
+                    // The self-test disables and drains the whole tree, so it has to run before
+                    // `Gpu::new` boots the GSP.
+                    #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
+                    crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
                 },
                 // TODO: Use self-referential pin-init syntax once available.
                 gpu <- Gpu::new(
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 28f147641024..7fb7d9f2e237 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -9,6 +9,8 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
+pub(crate) mod doorbell_test;
 mod hal;
 mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
new file mode 100644
index 000000000000..a1f8b3cc377b
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Interrupt delivery self-test.
+//!
+//! The test triggers the CPU doorbell vector from software, twice, and checks that each trigger
+//! reaches a registered handler. It runs during probe under `CONFIG_NOVA_CORE_SELFTESTS`.
+//!
+//! See "Self-test" in `Documentation/gpu/nova/core/interrupts.rst`.
+
+use core::pin::Pin;
+
+use kernel::{
+    device::Bound,
+    irq,
+    pci,
+    prelude::*,
+    sync::{
+        atomic::{
+            Atomic,
+            Relaxed, //
+        },
+        Completion, //
+    },
+    time, //
+};
+
+use super::interrupt_tree::{
+    GinVector,
+    LeafEnableGuard,
+    LeafMask,
+    Subtree,
+    TopEnableGuard,
+    Tree, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    selftest_assert,
+    selftest_assert_eq, //
+};
+
+/// The CPU doorbell vector. Every supported GPU uses this number, so the test needs nothing from
+/// GSP-RM, which is not running yet.
+const DOORBELL_VECTOR: GinVector = GinVector::new::<129>();
+
+/// The only subtree that this test services.
+const DOORBELL_SUBTREE: Subtree = DOORBELL_VECTOR.subtree();
+
+/// Time allowed for each delivery to arrive.
+const DELIVERY_TIMEOUT_MS: time::Msecs = 1000;
+
+/// The self-test's interrupt handler.
+///
+/// It clears only the doorbell's bit, rearms delivery, and never walks the tree. A missing rearm
+/// shows up as a timeout on the second delivery.
+#[pin_data]
+struct DoorbellTestHandler<'a> {
+    tree: Tree<'a>,
+    /// Completed by the first delivery.
+    #[pin]
+    first: Completion,
+    /// Completed by the second delivery.
+    #[pin]
+    second: Completion,
+    /// Deliveries that found the doorbell bit set.
+    irq_count: Atomic<u32>,
+    /// The doorbell leaf's pending bits, as read by the first delivery.
+    first_pending: Atomic<u32>,
+    /// The doorbell leaf's pending bits, as read by the second delivery.
+    second_pending: Atomic<u32>,
+}
+
+impl irq::Handler for DoorbellTestHandler<'_> {
+    fn handle(&self) -> irq::IrqReturn {
+        let leaf = self.tree.read_pending(DOORBELL_VECTOR.leaf_index());
+        let pending = leaf.vectors();
+        if !pending.contains(DOORBELL_VECTOR.leaf_mask()) {
+            self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
+            return irq::IrqReturn::None;
+        }
+        leaf.clear_vectors(DOORBELL_VECTOR.leaf_mask());
+
+        let count = self.irq_count.fetch_add(1, Relaxed);
+
+        // Rearm before completing, since the waiting thread triggers the next doorbell as soon as
+        // it wakes.
+        self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
+
+        match count {
+            0 => {
+                self.first_pending.store(pending.into_raw(), Relaxed);
+                self.first.complete_all();
+            }
+            1 => {
+                self.second_pending.store(pending.into_raw(), Relaxed);
+                self.second.complete_all();
+            }
+            _ => (),
+        }
+
+        irq::IrqReturn::Handled
+    }
+}
+
+/// The self-test's handler registration and the enables that deliver to it.
+///
+/// Drops in the order that "Enabling the GSP event" in
+/// `Documentation/gpu/nova/core/interrupts.rst` requires: the vector is disabled, then the
+/// handler is freed, then the subtree is disabled.
+struct SelftestResources<'a, 'r> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    reg: Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>,
+    _top_guard: TopEnableGuard<'a>,
+}
+
+impl<'a> SelftestResources<'a, '_> {
+    fn handler(&self) -> &DoorbellTestHandler<'a> {
+        self.reg.handler()
+    }
+
+    /// Disables the doorbell vector and waits for a handler in flight on another CPU to finish.
+    ///
+    /// The handler's counters and the leaf's pending bits are final on return.
+    fn quiesce_source(&self) {
+        self.handler()
+            .tree
+            .disable_leaf(DOORBELL_VECTOR.leaf_index(), DOORBELL_VECTOR.leaf_mask());
+        self.reg.synchronize();
+    }
+}
+
+/// Runs the interrupt delivery self-test.
+///
+/// Call this only during probe, before GSP boot: it disables every vector in the tree and clears
+/// every pending bit. On return, the doorbell's subtree is disabled at `TOP`, and the test's PCI
+/// vectors and handler are released.
+///
+/// # Errors
+///
+/// `EINVAL` if `chipset` does not implement the doorbell's subtree. `ETIMEDOUT` if a delivery
+/// does not arrive within [`DELIVERY_TIMEOUT_MS`]. `EIO` if a self-test assertion fails.
+/// Otherwise the error from allocating the PCI vectors or registering the handler.
+pub(crate) fn run_selftest(pdev: &pci::Device<Bound>, bar: Bar0<'_>, chipset: Chipset) -> Result {
+    let dev = pdev.as_ref();
+
+    let vectors = super::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?;
+    let request = vectors.request_for(DOORBELL_SUBTREE)?;
+    let tree = Tree::new(bar, chipset, &vectors)?;
+    let doorbell = DOORBELL_VECTOR.leaf_index();
+    let doorbell_mask = DOORBELL_VECTOR.leaf_mask();
+
+    dev_info!(
+        dev,
+        "interrupt self-test: starting on vector {}, subtree {}, with {:?}\n",
+        DOORBELL_VECTOR.into_raw(),
+        DOORBELL_SUBTREE.index(),
+        vectors.msi_type,
+    );
+
+    // GFW boot can leave vectors enabled and pending. Registering a handler unmasks the PCI
+    // interrupt, and they would be delivered to a handler that services only the doorbell.
+    tree.disable_all_leaves();
+    tree.drain();
+
+    // A delivery proves nothing unless the doorbell bit starts out clear.
+    let pre_pending = tree.read_pending(doorbell).vectors();
+    selftest_assert!(
+        dev,
+        !pre_pending.contains(doorbell_mask),
+        "vector {} already pending, leaf[{}] is {:#x}",
+        DOORBELL_VECTOR.into_raw(),
+        doorbell.get(),
+        pre_pending.into_raw()
+    );
+
+    let handler_init = try_pin_init!(DoorbellTestHandler {
+        tree,
+        first <- Completion::new(),
+        second <- Completion::new(),
+        irq_count: Atomic::new(0),
+        first_pending: Atomic::new(0),
+        second_pending: Atomic::new(0),
+    }? Error);
+
+    // Registration must precede any enable, or a delivery reaches no handler.
+    let reg = KBox::pin_init(
+        // SAFETY: this registration is dropped before the enclosing function returns, so its
+        // `Drop`, which calls `free_irq()`, always runs.
+        unsafe {
+            irq::Registration::new(
+                request,
+                irq::Flags::TRIGGER_NONE,
+                c"nova-core-selftest",
+                handler_init,
+            )
+        },
+        GFP_KERNEL,
+    )?;
+
+    let resources = SelftestResources {
+        _leaf_guard: reg
+            .handler()
+            .tree
+            .enable_leaf_guarded(doorbell, doorbell_mask),
+        _top_guard: reg.handler().tree.enable_top_guarded(),
+        reg,
+    };
+    let handler = resources.handler();
+
+    handler.tree.trigger(DOORBELL_VECTOR)?;
+    let mut completed = handler
+        .first
+        .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+        .is_some();
+
+    // The second trigger waits for the first delivery, or the two could coalesce.
+    if completed {
+        handler.tree.trigger(DOORBELL_VECTOR)?;
+        completed = handler
+            .second
+            .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+            .is_some();
+    }
+
+    resources.quiesce_source();
+
+    let count = handler.irq_count.load(Relaxed);
+    let first_pending = LeafMask::from_raw(handler.first_pending.load(Relaxed));
+    let second_pending = LeafMask::from_raw(handler.second_pending.load(Relaxed));
+    let residual = handler.tree.read_pending(doorbell).vectors();
+
+    if !completed {
+        dev_err!(
+            dev,
+            "interrupt self-test: only {} of 2 deliveries arrived within {} ms\n",
+            count,
+            DELIVERY_TIMEOUT_MS,
+        );
+        return Err(ETIMEDOUT);
+    }
+
+    selftest_assert_eq!(dev, count, 2, "delivery count");
+
+    // Every other vector in the leaf is disabled and was drained, so require the exact mask.
+    selftest_assert_eq!(dev, first_pending, doorbell_mask, "first delivery");
+    selftest_assert_eq!(dev, second_pending, doorbell_mask, "second delivery");
+    selftest_assert!(
+        dev,
+        !residual.contains(doorbell_mask),
+        "vector {} still pending, leaf[{}] is {:#x}",
+        DOORBELL_VECTOR.into_raw(),
+        doorbell.get(),
+        residual.into_raw()
+    );
+
+    dev_info!(
+        dev,
+        "interrupt self-test: passed, subtree {}, {} deliveries\n",
+        DOORBELL_SUBTREE.index(),
+        count,
+    );
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 2583b006019e..f77920a3b30a 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -402,7 +402,7 @@ pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a> {
     ///
     /// `EINVAL` if this tree does not implement `vector`.
     // The interrupt self-test is the only caller.
-    #[expect(dead_code)]
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) fn trigger(&self, vector: GinVector) -> Result {
         vector.validate(self.leaves)?;
         self.bar.write_reg(
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5176a5fe2da2..abafe4f2968d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[expect(dead_code)]
+#[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
 mod irq;
 mod mctp;
 mod mm;
-- 
2.55.0

