Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C738228A
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158706; cv=fail; b=f0PWHs9So9WhZLdVP+wsCCI2itWDyn5pqj57IPQ9JTk/zDj7GOUVL7X+KqrFO3C6AqRamfqAt55B5Dkaejh9tIKi5DzHGTP7Jl7JGrABXljXWeBnrvveCxt7hdVtOnpyjczKDP2hUE067iEZ2oAnsPbVcjiaRzvusSNbbm9wzrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158706; c=relaxed/simple;
	bh=h/OEvV6mHB2cRCJ1fu61N3g3vvab0X8aNxBLbhmM2Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=deAbvaDNsrUnDXzcsZya45PWG9yFDDmeGUp8+1stgjiSXnjzqfwpCCr9NJreObvYo497hL8iIedJHLA9Bz9xwMzbY4M3zalMpv29OMgSwjnk5UdOqVqDCiiTUNPqzV3xuGMIMzThjKkERXnJyBxmq7Ll03ugmF9K0bHSPlg6mJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cBMrV5jQ; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cBMrV5jQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5MtDcSZqB6LEYNvCm74ZZMH61qDlm5Hz8c/QxKSWib0JL5tFi78Y4AZP5SQ7lGRp3NCUiIVP8ZvrcGSovDfIPtoL2Jk36V2aaqTNnYRssrh6mxELDK9QgWKZX20U57HfSnBQ11NewXkdc2EEE/40NMNN405oDRp7fgJWs+DS938gppR4Sw8O7nBgR25qgH/c3msB5jSQOAblxYLNUJVPpES4GWNtrIMAMAdF084pRKfmXrGKezGaJbnFbJU8cU3u+NIX7FqP+eFpd5FbaRgMQN9o6aiC/Sd8UJ86UWDBEZZy/FQ1C74zVU5Y/MJ26gZqP3fWXBtKN8YTGTEWP1uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm/yXqP5fHfSDpWEZU7/kpj9Jsp8R4UxSErzsc6Id2E=;
 b=eFWYyuaCNA4Rl70dDM6jy3oDWzupV4n0PohdTAfwyKGkJQn4pJd5NQ9O8vdWchPH69MYoS7m7KoXEJ5k4ZomQiAImt6dE2e7sbSLpODStj/5DxZMnRMR4PjPQy4kfhjDqDL4YbnV+L2EjtGvnegi5XHP8xZyu0ob8uwErBK1wHTyDYDgfNegzCtx075lGCsOVhpMbwOk1Ztsq70awFva6g79hZirpWNP6fwi6KfjwCoqMRsq247kEJ8h5YG36pfGRO++rauCkFyiLsrL174zrbg/mOEFS5z+Kc7a+sAmv7hGAHRbLyrJKwxa1De1y/SIWsfohAxAxZK9BKAgSlYcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm/yXqP5fHfSDpWEZU7/kpj9Jsp8R4UxSErzsc6Id2E=;
 b=cBMrV5jQMiK8jIEUtMUPcnteo+U6jbyxy7NdW5G1l7rhMGWFtDkMaHqvWJrNQvuZc2RyqaWsg/TOIFcR4otjsMv7cfeTFXVPFVKTIzTMHtSaPrkkMFxQcne7LAqHWTcamI364hapX1xQ8/5ko66Yg6Xgrlf1AAK/6S7M2KGxMpCLLVNDrXTC01f5vw7iDTyY49Fkme400qG8b6udEACdhnuWI02Za6KMdVINWfN1gWAhWCTdMha04Fk3K4KiAG68H/DuNcqVvbMpN9yD8+lZGHi2l11apLESd5DGRD6rkLFQog53XceM2wPGhKdeBODZ6mG0VY61XwYsLOr2qlP9ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:32 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	Will Pierce <wpierce@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 09/17] gpu: nova-core: add an interrupt delivery self-test
Date: Fri,  7 Aug 2026 20:11:11 -0700
Message-ID: <20260808031120.363869-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c241bb-0b6b-4ae0-3f7b-08def4fabf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qIMqoXxOJ5rlsTIVPSc9GN85eVykDnkfkKkrjqLckqAFSP8AewSKpBGd+F0Nfc44Ms6tVrpgxlUJ6Jw255FAOX0wwl/8BCO57CS4qye4aHyeg958HHZZV9MXlDgIcXQ/54ZMRs+WZ17K01NBfq7k5BVrnjpQeQ+ybuItWYQ1JvdVpHExCwZUX167xCQOTmeIOilH+TRTixjzhmWMG5sFidF04cwVP992ic5NCr3mbDD+crfzYf6qMpTmOWiUWRuCvKFbvEbuhxXu5R4PwFvmaAcjJ3v5nuftbASL7YnZkAUkAAxtmh8FhdA3ee1DN3phRboTIk7Y1EGs9eAp4WaaqfJjhHYXMRjYVLHnnkln+YvkLxE7LQY+nbZfEqttqt1jy3WM21LZfKyTft9rUHTjsTX2K8h6CJPBmUvgjvmvNATfCzF6598zPwPeMHAs+NXa8LRd393ruyblVOv8Ag9Gq3CaqXH9Gjmtoe5zoE6/WyKumZaa6K198KlLQAkXnFNzQ6ArBMJt5JwV99vz62AeMz0Ul+NKE2f00DjIS5RD7ANPgct+rhB/ouYWrT9r3ZAqI0SxhEd55q26opBS7emDrJ+MTkf0eTRBogiX9LddBdE81bHaGYMELPxth0K4a5QJ0360COQZLVi+t09c5cbmEqZQ3updoOO6Z0ommLWHdSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7zlOpZctvk1b140lXaj9mVOcXSEX1MyxQfIzMS9Jafl1qUs50wiSNiNb+xX5?=
 =?us-ascii?Q?mV/MwO/E8mffk46otcc9CWKNUCzrNTjFz0zIy/5LPdV6HiM3A0BEhDhheRoq?=
 =?us-ascii?Q?iCN10tuCZcWm3Bkom8VDJx65KqknCtMy//qWkzXl1pUML0XqdhVaJd5DltJQ?=
 =?us-ascii?Q?dsuubXpA+GFe9266sTXLfNd2kjUZvYEzyT0Rg3r+i1pag1YEpaopWHPdzb4A?=
 =?us-ascii?Q?OQRRFbKNdNXzMbXCJnaAq2f8/ozElvRc10dCUQkLExOBryyOs7nbDgLfndoG?=
 =?us-ascii?Q?qrtNOAiq6oczcHyQcuTlGp3njfb9+JAupniQdj+s01j3w9wDQXf+9Yd50lOY?=
 =?us-ascii?Q?MGVQ602U6oqQUdZgsDsbtioH2GxYmPAp95KL1L4UrRmxSZqOnZi5fJowp/At?=
 =?us-ascii?Q?PGxOPTcV4ahDstsCIoif0DBkIfF4IsHbltEFyIRavxYDpTSNEkYFQNDbAeQ0?=
 =?us-ascii?Q?wIC2PW95nGrYP2IzXs2+77AvVwjkwJ5tewRoqJPQNYsK4rXqfiF3fzOdC3D8?=
 =?us-ascii?Q?ItZ/Hy5fUtPSDpeOHjWwiVcdX9KRVJo/kK1+Habeo08wTTTEB3GVsp78A9e2?=
 =?us-ascii?Q?Vn79hKvdyzfYb4BNuHm8g/DlirNSWg3UqSIsmCEz+WL5oSxXpMn0bemLBUZT?=
 =?us-ascii?Q?R09tZTgiHptdbSM2aMOu+va8RoiiZBfdO3RoFG8ly08HnCyh4DPz28VEO6Eh?=
 =?us-ascii?Q?7IfNNt9fEqFo1pJURuxLZq+KxlvvmxNUo/L8MCsysdOJYwryW2kBazp1FgyC?=
 =?us-ascii?Q?xB9EZrCQv+GaQIEUM/RPFIDpOV8XNjJyTtsC4a30PsPXMcPKPnqIeD2K+N85?=
 =?us-ascii?Q?55PTFkFbcr7KLataW4jj6NWhZzn0uvpYDza5QEakpZgt+/EmtScqBVegvIlt?=
 =?us-ascii?Q?lAPgne+7/ZwxxW4gYMw5xsUb5NZ3iKV+ta+GSKNoXcTZahfJrsdwb8XLIzvg?=
 =?us-ascii?Q?1KwTg4GaRgqyxeGPvvb8uO70TYdVsrT5daF4EnKFWA5EPwPxTW7vrASjkI3y?=
 =?us-ascii?Q?vg22DYpPl3wOV3hm4eMISQqTUkuge6jnd1ozzfaBzq+sF3633uH0zzVEa/3Q?=
 =?us-ascii?Q?NjMf1jce3W176rcuh2NlG6ItnOZUM/0C1giHqa68SzUQfaWVX1OOGUW/gXsy?=
 =?us-ascii?Q?hp82gk/Ofw++uEEio0BAi9S142ZeexviO24DR/UIiTPTJk0o+cP5FFr8sbgI?=
 =?us-ascii?Q?Xj9RyLjdUik1CIDV1bBnGB6S01eHeW0ESmhBHp/3bdUYpkqgMbBYmmp6/0zP?=
 =?us-ascii?Q?HdyK0nKP0MM9fJ3bSJi2j7Qp54y0DGqJfidkRn8le3NOFy1UqoOziiv1I6zD?=
 =?us-ascii?Q?N/28yYW6sH6H1T2X6GVdg4kO9RCid4xMS/ZAY3uGoWGBtz9BcyRIxnEWiTi4?=
 =?us-ascii?Q?0hJCcoXBj1Flu3/ZBDvIhLpFATX7F5e3QDyQxl92UPaWb5RPRPwoXhmMQ6xQ?=
 =?us-ascii?Q?9WIATqIlKvKjX8g978bylXzeSCtfmgq2J0+U7P1GDxBzPw3QJQ3HhRJF4r8r?=
 =?us-ascii?Q?lrHlA2L13U3DvydRkLv2wg8xj29ppwuNisd2kaWGzHsYHewUptVYfhI+Jmbh?=
 =?us-ascii?Q?g9DRBipEf3Rp0r30ThMQI4VfI2rngNaNKIPb6Xj7PsSDdfx+moa1uTx80XWc?=
 =?us-ascii?Q?ySui1zvLaSRwfpmcYwdF91TG4imMpBl/DSSbzpC2V2hSIYye6J4hp9JcH1BR?=
 =?us-ascii?Q?wBNe/T/5AiQrZB91tDL+azBok5D+KZ4hNCgPJArbnmtZaG/INL0BLbD7YNsZ?=
 =?us-ascii?Q?6d4kq1Db8w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c241bb-0b6b-4ae0-3f7b-08def4fabf9d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:32.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPO39b2j1ud7h6yypK8Mf8mtAkoG3to4EAhlpjQvEbN/yxGKdOR1/UhzBnSRLoPkhmUKvGsBr3713Hnj26rBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
tree's enable bits, or in the rearm. Every one of those failures looks
the same to the driver: no interrupt arrives, and nothing in the symptom
says which one broke.

Add an optional probe-time self-test that injects the CPU doorbell
through the GIN software trigger. One injection would pass even with a
broken rearm, because the first message-signaled interrupt arrives
whether the driver rearms or not. The test injects twice, and waits for
the first handler to rearm before it injects again.

Run it before GSP boot on a quiesced tree, and fail probe unless exactly
two deliveries arrive, each delivery finds only the doorbell pending,
and the leaf ends clear. Under MSI-X the injected subtree has its own
table entry, so the delivery exercises that entry too.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig               |  15 +
 drivers/gpu/nova-core/gpu.rs                |   8 +
 drivers/gpu/nova-core/irq.rs                |   2 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 324 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |  13 +
 drivers/gpu/nova-core/nova_core.rs          |   2 +-
 6 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index f918f69e0599..7198fae6b6f4 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,18 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova-core.
+
+config NOVA_CORE_IRQ_SELFTEST
+	bool "Nova Core interrupt delivery self-test"
+	depends on NOVA_CORE
+	help
+	  Run an interrupt delivery self-test during nova-core probe. It
+	  injects a known vector through the GPU interrupt controller's
+	  software trigger and confirms the interrupt reaches the driver's
+	  handler, validating the PCI interrupt path from the GPU to the CPU
+	  with no dependency on GSP firmware. The result is printed to dmesg.
+
+	  If the test fails, the PCI probe fails and the driver does not load.
+
+	  This is intended for driver bring-up and for debugging PCI, MSI, or
+	  passthrough setups. If unsure, say N.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 42a4cd7971fa..d5df0ebf67ae 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -347,6 +347,14 @@ pub(crate) fn new(
                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
 
+            // Validate the MSI interrupt path before booting GSP, when the self-test is
+            // enabled. This runs on a quiesced interrupt tree with no GSP state present, so it
+            // never observes or clears GSP or PRIV_RING interrupts.
+            _: {
+                #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
+                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
+            },
+
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 2f0e2644b9bd..5b449759b333 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -8,6 +8,8 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+#[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
+pub(crate) mod doorbell_test;
 mod hal;
 mod interrupt_tree;
 
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
new file mode 100644
index 000000000000..fae770339fd7
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Interrupt delivery self-test, driven through the CPU doorbell vector.
+//!
+//! Exercises the whole PCI interrupt path (GPU to PCIe to CPU to handler) with no GSP dependency:
+//! it injects a known vector through the GIN software trigger and confirms the handler runs. Two
+//! interrupts are triggered one at a time, which also covers the rearm that every delivery after
+//! the first depends on. Gated behind `CONFIG_NOVA_CORE_IRQ_SELFTEST` and run before GSP boot, so
+//! it never observes or clears GSP interrupt state.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
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
+    vector_leaf_bit,
+    vector_subtree_mask,
+    LeafIndex,
+    Tree, //
+};
+use crate::{
+    driver::Bar0,
+    gpu::Chipset, //
+};
+
+/// Fixed vector for the CPU doorbell.
+///
+/// The resource manager pins the CPU doorbell to this vector on every supported chip, so nova-core
+/// uses the constant directly instead of discovering it at runtime.
+const DOORBELL_VECTOR: u32 = 129;
+
+/// Leaf and bit index of the doorbell vector within the interrupt tree.
+const DOORBELL_LOC: (usize, u32) = vector_leaf_bit(DOORBELL_VECTOR);
+
+/// Leaf holding the doorbell vector.
+const DOORBELL_LEAF: usize = DOORBELL_LOC.0;
+
+/// Bit of the doorbell vector within its leaf.
+const DOORBELL_BIT: u32 = 1 << DOORBELL_LOC.1;
+
+/// Subtree carrying the doorbell vector, and the only subtree this test services.
+///
+/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the allocation, the subtree it
+/// enables, and the handler together.
+const DOORBELL_SUBTREE: u32 = vector_subtree_mask(DOORBELL_VECTOR);
+
+/// Index of the subtree carrying the doorbell vector. Under MSI-X this is also the index of the
+/// table entry that subtree raises.
+const DOORBELL_SUBTREE_INDEX: u32 = DOORBELL_SUBTREE.trailing_zeros();
+
+/// Time allowed for each of the two deliveries to arrive.
+const DELIVERY_TIMEOUT_MS: time::Msecs = 1000;
+
+/// Interrupt handler installed by the self-test.
+///
+/// Services the doorbell the way a notification source is serviced: it clears its own leaf bit and
+/// rearms PCI interrupt delivery, leaving the rest of the tree untouched. It records the leaf's
+/// pending bits seen on each of the first two deliveries and signals the matching completion.
+#[pin_data]
+struct DoorbellTestHandler<'a> {
+    /// Borrowed BAR0, for register access from interrupt context.
+    bar: Bar0<'a>,
+    tree: Tree,
+    /// Signalled by the first delivery.
+    #[pin]
+    first: Completion,
+    /// Signalled by the second delivery.
+    #[pin]
+    second: Completion,
+    /// Count of deliveries this handler has serviced.
+    irq_count: Atomic<u32>,
+    /// Doorbell leaf's pending bits observed on the first delivery.
+    first_pending: Atomic<u32>,
+    /// Doorbell leaf's pending bits observed on the second delivery.
+    second_pending: Atomic<u32>,
+}
+
+impl irq::Handler for DoorbellTestHandler<'_> {
+    fn handle(&self) -> irq::IrqReturn {
+        let bar = self.bar;
+
+        // Clear only this handler's own bit and leave `TOP_EN` alone. A full walk disables and
+        // enables the tree, which produces a delivery edge by itself and would hide a missing PCI
+        // interrupt rearm.
+        let leaf = self
+            .tree
+            .leaf(LeafIndex::new::<DOORBELL_LEAF>())
+            .read_pending(bar);
+        let pending = leaf.pending_bits();
+        if pending & DOORBELL_BIT == 0 {
+            self.tree.rearm_pci_irq(bar, DOORBELL_SUBTREE);
+            return irq::IrqReturn::None;
+        }
+        leaf.clear_vectors(bar, DOORBELL_BIT);
+
+        let count = self.irq_count.fetch_add(1, Relaxed);
+
+        // Rearm before signalling, so delivery is possible again by the time the waiting thread
+        // triggers the next vector.
+        self.tree.rearm_pci_irq(bar, DOORBELL_SUBTREE);
+
+        match count {
+            0 => {
+                self.first_pending.store(pending, Relaxed);
+                self.first.complete_all();
+            }
+            1 => {
+                self.second_pending.store(pending, Relaxed);
+                self.second.complete_all();
+            }
+            _ => (),
+        }
+
+        irq::IrqReturn::Handled
+    }
+}
+
+/// Teardown guard for the self-test.
+///
+/// Owns the IRQ registration so that every exit path, including an early error, tears down the
+/// interrupt in this order: disabling the leaf stops new deliveries, dropping the registration
+/// runs `free_irq()`, which waits for a handler still in flight, and only then are the tree's
+/// subtrees disabled, so a late handler cannot rearm them.
+struct SelftestGuard<'a, 'r> {
+    bar: Bar0<'a>,
+    tree: Tree,
+    doorbell: LeafIndex,
+    reg: Option<Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>>,
+}
+
+impl<'a, 'r> SelftestGuard<'a, 'r> {
+    /// Returns the registered handler.
+    fn handler(&self) -> &DoorbellTestHandler<'a> {
+        // `reg` is `Some` for the whole lifetime of the guard. Only `drop` clears it.
+        self.reg.as_ref().unwrap().handler()
+    }
+
+    /// Disables the doorbell source and waits for a handler already running on another CPU.
+    ///
+    /// On return no further delivery can reach the handler, so its counters and the doorbell
+    /// leaf hold their final values.
+    fn quiesce_source(&self) {
+        self.tree
+            .leaf(self.doorbell)
+            .disable(self.bar, DOORBELL_BIT);
+        // `reg` is `Some` for the whole lifetime of the guard. Only `drop` clears it.
+        self.reg.as_ref().unwrap().synchronize();
+    }
+}
+
+impl Drop for SelftestGuard<'_, '_> {
+    fn drop(&mut self) {
+        self.tree
+            .leaf(self.doorbell)
+            .disable(self.bar, DOORBELL_BIT);
+        self.reg = None;
+        self.tree.top().disable(self.bar);
+    }
+}
+
+/// Runs the interrupt delivery self-test.
+///
+/// Quiesces the interrupt tree, registers a temporary handler, and injects the doorbell vector
+/// through the GIN software trigger twice, one delivery at a time. This validates the PCI
+/// interrupt path from GIN to the ISR without GSP firmware, including the rearm without which only
+/// the first interrupt would arrive. The handler, its IRQ registration, and all tree state are
+/// torn down before this returns.
+///
+/// # Errors
+///
+/// `EIO` if the doorbell is already pending before the test, if the delivery count is not two, if
+/// the doorbell bit is still set once the source is stopped, or if either delivery found a pending
+/// bit other than the doorbell. `ETIMEDOUT` if either delivery does not arrive within the timeout.
+pub(crate) fn run_selftest<'a>(
+    pdev: &'a pci::Device<Bound>,
+    bar: Bar0<'a>,
+    chipset: Chipset,
+) -> Result {
+    // The allocated interrupt type decides how the handler rearms delivery, so the vectors are
+    // allocated before the tree is built.
+    let vectors = super::alloc_vectors(pdev, DOORBELL_SUBTREE)?;
+    let vector = vectors.vector_for(DOORBELL_SUBTREE)?;
+    let irq_type = vectors.irq_type();
+    let tree = Tree::new(chipset, irq_type, DOORBELL_SUBTREE);
+    let doorbell = LeafIndex::new::<DOORBELL_LEAF>();
+
+    // Under MSI-X the subtree index is also the table entry the delivery arrives on, so a pass
+    // shows that the per-subtree routing works. Under MSI every subtree shares one entry.
+    dev_info!(
+        pdev.as_ref(),
+        "interrupt self-test: starting on vector {}, subtree {}, with {:?}\n",
+        DOORBELL_VECTOR,
+        DOORBELL_SUBTREE_INDEX,
+        irq_type,
+    );
+
+    // No delivery may reach the CPU before a handler is registered. `drain` enables the top level
+    // as the last step of its cycle, so disable it again afterward.
+    tree.leaf(doorbell).disable(bar, DOORBELL_BIT);
+    tree.drain(bar);
+    tree.top().disable(bar);
+
+    // A delivery can be credited to the trigger below only if the vector starts out clear, so
+    // refuse to run otherwise.
+    let pre_pending = tree.leaf(doorbell).read_pending(bar).pending_bits();
+    if pre_pending & DOORBELL_BIT != 0 {
+        dev_warn!(
+            pdev.as_ref(),
+            "interrupt self-test: failed, vector {} already pending (leaf[{}] pending {:#x})\n",
+            DOORBELL_VECTOR,
+            DOORBELL_LEAF,
+            pre_pending,
+        );
+        return Err(EIO);
+    }
+
+    // `try_pin_init!` moves its captures, so the handler takes a clone and `tree` stays available
+    // for the guard below.
+    let handler_tree = tree.clone();
+    let handler_init = try_pin_init!(DoorbellTestHandler {
+        bar,
+        tree: handler_tree,
+        first <- Completion::new(),
+        second <- Completion::new(),
+        irq_count: Atomic::new(0),
+        first_pending: Atomic::new(0),
+        second_pending: Atomic::new(0),
+    }? Error);
+
+    // Register the handler before allowing any source to fire.
+    let reg = KBox::pin_init(
+        // SAFETY: the registration is owned by `guard` below and dropped before this function
+        // returns, so its `Drop` (which calls `free_irq()`) always runs and the registration is
+        // never leaked or `mem::forget`-ed.
+        unsafe { pdev.request_irq(vector, irq::Flags::TRIGGER_NONE, c"nova-core", handler_init) },
+        GFP_KERNEL,
+    )?;
+
+    // From here every exit must tear down the source, the registration, and the tree, so hand the
+    // registration to a guard that does so on drop.
+    let guard = SelftestGuard {
+        bar,
+        tree: tree.clone(),
+        doorbell,
+        reg: Some(reg),
+    };
+    let handler = guard.handler();
+
+    // The handler is registered, so the source can be enabled.
+    handler.tree.leaf(doorbell).enable(bar, DOORBELL_BIT);
+    handler.tree.top().enable(bar);
+
+    handler.tree.trigger(bar, DOORBELL_VECTOR)?;
+    let mut completed = handler
+        .first
+        .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+        .is_some();
+
+    // Trigger the second interrupt only once the first handler has cleared its leaf bit and
+    // rearmed, so the two cannot coalesce into one delivery and a handler that never rearms
+    // cannot pass.
+    if completed {
+        handler.tree.trigger(bar, DOORBELL_VECTOR)?;
+        completed = handler
+            .second
+            .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+            .is_some();
+    }
+
+    // Stop the source and wait out any handler still running, so the values read below are the
+    // final ones.
+    guard.quiesce_source();
+
+    let count = handler.irq_count.load(Relaxed);
+    let first_pending = handler.first_pending.load(Relaxed);
+    let second_pending = handler.second_pending.load(Relaxed);
+    let residual = tree.leaf(doorbell).read_pending(bar).pending_bits();
+
+    // The self-test runs before GSP boot on a leaf that `drain` has just cleared, and nothing
+    // triggers the vector after the second delivery, so each delivery must find the doorbell bit
+    // and nothing else, and the leaf must end clear.
+    if completed
+        && count == 2
+        && first_pending == DOORBELL_BIT
+        && second_pending == DOORBELL_BIT
+        && residual & DOORBELL_BIT == 0
+    {
+        dev_info!(
+            pdev.as_ref(),
+            "interrupt self-test: passed, subtree {}, {} deliveries\n",
+            DOORBELL_SUBTREE_INDEX,
+            count,
+        );
+        Ok(())
+    } else {
+        dev_warn!(
+            pdev.as_ref(),
+            "interrupt self-test: failed, {} of 2 deliveries, leaf[{}] pending {:#x} and {:#x}, \
+             {:#x} left set\n",
+            count,
+            DOORBELL_LEAF,
+            first_pending,
+            second_pending,
+            residual,
+        );
+        Err(if completed { EIO } else { ETIMEDOUT })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 51add9f33c89..73f5afadea3e 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -270,4 +270,17 @@ pub(super) fn clear_pending(&self, bar: Bar0<'_>) {
             }
         }
     }
+
+    /// Clears the vectors set in `vectors` (write-1-to-clear), leaving every other pending bit
+    /// set.
+    ///
+    /// A handler that services one vector uses this rather than [`Self::clear_pending`], which
+    /// clears every vector the leaf had pending.
+    pub(super) fn clear_vectors(&self, bar: Bar0<'_>, vectors: u32) {
+        if vectors != 0 {
+            if let Some(loc) = CPU_INTR_LEAF::try_at(self.index.get()) {
+                bar.write(loc, vectors.into());
+            }
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index dfd11dfe562c..65ce547bd44e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[expect(dead_code)]
+#[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
 mod irq;
 mod mctp;
 #[macro_use]
-- 
2.55.0

