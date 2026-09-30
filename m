Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF9397933
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739804; cv=fail; b=SI9hltbpDZN4bqAXrw33yuAXtTLamOgQ9eyy2X6GvUBBY0J0hqeakYTTHt7F7zHVMwVqvp5eqTQqwtV/dmWNI2X90+CDdVnvUeTTraxQ2surAyhuw7MtG0TGUDbY6f53rioyseQXm5Sovlvf/UE9QF1LaGExJX7qyxHuzz+hZDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739804; c=relaxed/simple;
	bh=FVWhUmSd0SxEGUVx4tSVvwevpZ69i+ampnTCakXEGNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K8oMAIynTdLcoCE6lJLTPi3tq7WPFFyRKGKyHUo+gHLClB0HGP67h3ti1LqDlxXfUvyKrGAgBYnggB+OPIrsQB9kgJtd0eWutj4+gcYolcYqOOezIQBelGDyfRdlogzn9aSVHTNwTH5TPdg4A+jUOwnG1mvOr/q+7ERQ7+Cieww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DLMHrE3j; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DLMHrE3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeWPpHCvv20mZwobLcJTxHj+NU1DPTie87A7/Facz1pNb9SD94+2kyUDEsASywDf2iz+RG4sJndG2t9Us8EXb/nRfmpW+qDtsFOjrs0r5YVamg96+uDgIBcv9e3XgVCyOMnQK0DHHN40Rn9S2U+Gugjsh/3ljebHoJD94rPn/wL/8dGyPAhcpevN6nskyrRb4MqJOuW5w/nGwjoMoZi467oIbWJMYlLo2vacyfDcWa9yZ+LWbVX3xHNf7L3u+5kuywFQ71KiGL6FRI6bmahWrcQ4xy3NOjUY5pzUMSTxC30V7D3N8F7V4fX8JRLhC6vpHdZgfEg1AxetACv81ROAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho6StAlcm1htBHWlGuDoifK9WXX1zoWgXskF1xQLE20=;
 b=eC+FT4y1iKxS17DfaLtbnE/r3Ugrk6I8BXuZ29e/fIcjXA/9l8zbpZ+nDya9zmPZ6HV0aQkRwtHk+Te+kecm1JABQC+l99OO98lx4gOt4RFk6g8NjtkZFnc6us4gCtU1sOscvYqlGn8mAIOEmun0DQpToH6UGq/5d7YOtYbrMQxKIsdlXiKGnC1H2GbPcJyamj1rBGIuS/g88UImqBd4ctmJfQTZL2lMvLv2Uq+l2SitOlAnirJmFQsDXwAOIEf1Gl2Kv4V1w6QwygDEFuPjjQQ3DvGeqjttUSnR9D6vQrSUJWfN2c+YVKrGkFc/xL8GafuB/HF/9oEPDZ/Qg4Lr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho6StAlcm1htBHWlGuDoifK9WXX1zoWgXskF1xQLE20=;
 b=DLMHrE3jMH+NYn+edyhoOFbc6jiRxxyb0M3cJBCiS3yfiKHZrxcAaXCBha0hrlqw1s1548y5him+0cNYFWf6XxKqcLIxg5GeRumR0lnpqz7B3nxMcteSNW3p6Hm3sbCG4ShgWoerIY5abjqAoeS2CbixIjBanglKEnIPfwhX+7jLCFXZJYmEkpfEfEJ1d+8PX45nDWVk3UzuUJFQeNNHpc89K9KJHQyqdu1BtT0/C2EcXfsSjWrnBb0sXRFvenS4zilP6MP9EBQXa0dTYKA3oBCyAIyUzZZmW1BNjmAenZ5to7PBjWzeEKPX5NJqvEyrtU8SIBZBvzrjxJkkWA+hiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:19 +0000
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
Subject: [PATCH v5 08/15] gpu: nova-core: add an interrupt delivery self-test
Date: Tue, 29 Sep 2026 20:41:41 -0700
Message-ID: <20260930034148.590687-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: d080d597-fdcd-4413-00c6-08df1ea4d409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KJsCw6MOBrUkQAXj+CZ3X+ouRBpjSehI55f4IDnXzNs9RK4nCcaPCZIEnZL80Zp0ueSrHbW0/TyRIPXDBEcUyX4QZxYD4fW7+4tNqnw0oFojDMM5VDRvou9YAzDJ66kc0DARX6EGQh8vggbeZY8Nw0egw7Zjy8BVxNjY/Z5gcMSnPRXHPAfzeBsyeUCofZyXRlM8Hs8aMUVE8pj25L4Kht6/dgP0aTmeo3YSUewOl7hAFM+9/w+tLRb7vanZ02aawUMpkpm2hFLds/SyhayQt2z/xV9fr2yM7mtPsFxCbQBskHfjCYYws8kDejPMxq9q28n91FgjrJmcYk+YJnbxYgHiw5DcJq0XUg/+09DtKsoF67Dhr5wABoBYyIEdCIARyFZxclZd67s05UOm4BJLVFY+A9Q2A/kcf7oiI4fJ/819llIbfFHmxh+I1COfmpecuCRcl2z+mExfPNbJVWCsRzMwL8zwkAanKADau0/gU+lbjayi7sfM/2BxqVbywwCw3ESrryXPj36EzgIVpfKE4XJnu3MafkiSSRh68gNYBR+w7ZTVzy85iVq1+WZsrN40PhCMKj8kxQvI2BEbuEjHlhlmuZzXc6se3MeiYf4jGuVTIIaPbyhQIXrqW4aLTFcbj/3qE6uF0hcQSaw+L8GY1X8VTqWH1Ie1EQooqXVSeBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gKBE7nig8lzdmfRnsPy6Rr27UDXLODJbH+NIzW6qaU3mTx5Toftl0KYooE02?=
 =?us-ascii?Q?p94C/YgW5yc4Jx3Rzry74q4IA2p3ezZpTimgImeyxnKkwbbHIoxoEQlfCeOB?=
 =?us-ascii?Q?4o/6sKDmJ1HIAzZumM3HPMFoq5tnFHpxduNxJgs8PRiNfM6AOm4v5kA5qWKF?=
 =?us-ascii?Q?n7iToQpWgn/S8cYp7SEyFIZxjgPRX1KTAPVC212gE+JKmp+d5F0TkpnWNfLb?=
 =?us-ascii?Q?+W+MaA65Sq3/wCc84cqt7vTHTfXBSHZRUZ5DIVrLK0mfQR3S+D8X9CfeVh36?=
 =?us-ascii?Q?Sr+P9rRwMtZqLjt0lrpkBpjoGJpLZ94wnLWashCBO0ZgwGJiTYveHT3RqZrB?=
 =?us-ascii?Q?EzpQPc6ZVqa+CnKgOyXSHANDUBrbckIeDQm89FDi3w/bbL8O1iI4Ro9sTkHN?=
 =?us-ascii?Q?u8w0zJfw3Uc1deu1JZn/vGEksfozrm/C/dkpYya3r529HW+K4i+oX9+ywYwg?=
 =?us-ascii?Q?EAU8d+lX1jwc4On7JiC/R7ATRY+PCJ2IuwgRfspTkdEtM8ifbV+k+bn9UV9k?=
 =?us-ascii?Q?7DeL+mRWA7C/oexBzCp7HH2PeHct6xs8S3ZCfb+ZcgOOPRDm1aqd9BAQckJK?=
 =?us-ascii?Q?AnSyLZplXbTVXrkeXfYQdger1cn6UuZEFl4jKHkU7ez8ZQH/MZWUm7Jd5XhA?=
 =?us-ascii?Q?j7f47OireM4ZT5iNeQv1BIagqvKVGnyD+rT5jtILwn59d0E7yrhBTZM4mi6m?=
 =?us-ascii?Q?tYWwDC/SSKb+kxovv1A2NbXvMTIroxuZV4XWXXR92fRd6MeVBqmdti6a1ZBX?=
 =?us-ascii?Q?4Jhy9PPsrm8gU+DcjxtBvc0UikJ/t+TxU4/8jDlzb3+SEte9ECh4hpztrDBL?=
 =?us-ascii?Q?lNgaL6bVwwuqHb3cVw3gzE/hJlK7GZ+bYRhrbW4ELNzp09BcF4PlhR6xrne3?=
 =?us-ascii?Q?zl5/tXjwThLmgqAwfVg4NrYL7EIy4NayMRpllMVifpCqVBSspAKy14xZfc0H?=
 =?us-ascii?Q?G+kt6kYLkFRhe6eWveNaAGPvaSQrSbb++WJDypbeYGOmeqjnfP0O19dGsGAK?=
 =?us-ascii?Q?8/GQynrYEkCmtNTnziYXQIbL2KIsp/vFpm59Ka4E1cf+zKsizrkIjDQTIHbH?=
 =?us-ascii?Q?o4d35rg3tj5dtFDyiBb8Lpen/enSqhYpyrvcE8H4XrXBnoviNRXB0p5fwEXB?=
 =?us-ascii?Q?AzH/DwK5uf0nskz7DECPnuYseAexTeF2Z/sUybBKMxwg493xwqSVmqSJNiig?=
 =?us-ascii?Q?ESb8HcDj+niW0ZgIqKTWCFBRWV/JXedAxgPYuhx8mhrB8TJAkqHOhkSU3clt?=
 =?us-ascii?Q?UqbwvRNsB0VInikDR+XqjpiONSjkpoe05v1PPC9Y/0wdoGVs/l7wxObJrKY9?=
 =?us-ascii?Q?rL/IvldZi02J3HkpNZGs5sxSm5OyzNbl/Tp34spDLfadSPMFlIRvfdBWwNp4?=
 =?us-ascii?Q?d2zaJZMOPxxpzZ8TkpXaIEAMISP9G/dTISsjORaITcUXEkeemwCfUbQnK/D3?=
 =?us-ascii?Q?o77kS+e/WXPty12rzb3UNBvrTjqbyjt5KwQTax3l9AstkVPD6IGOcQ0fmi+K?=
 =?us-ascii?Q?puwSuWSpl14Knc4kUOnhTsNJc6GAH+tnNy76sQc8yjJ4CEVTNzOpH54OSu5u?=
 =?us-ascii?Q?rHgsgtio7uaR1knhNHbgXqlHobdWkh57py3q8ztwRQ016WCIuItCSUvRkO7C?=
 =?us-ascii?Q?ml1InP/mDeG7SeuLVdpfIjUfZV8rUeXAMeX5TMUj3nDoCZ/7c2b73YaCQDyV?=
 =?us-ascii?Q?/0GW8u0rfE7X7HlxocA5pqQprEP8LnwltEUXF+tEQ50sr3VGdVPPvUNhvrlF?=
 =?us-ascii?Q?V0UiASLPEA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d080d597-fdcd-4413-00c6-08df1ea4d409
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:19.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEXATZb1CXmXKSjPqnSrVWn4mi/2DnAYriu2uoTTKojBNR+z826YkOBo3O8chmiK5cfFOCvlPrNFt7MYKxqqIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
tree's enables, or in the rearm, and every one of those failures looks
the same: no interrupt arrives, and no register or log line says which
one broke.

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
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 257 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |  15 ++
 drivers/gpu/nova-core/nova_core.rs          |   2 +-
 6 files changed, 285 insertions(+), 1 deletion(-)
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
index fc321c6a10b0..6d45fec6d7cc 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -123,6 +123,11 @@ fn probe<'bound>(
                 // We must wait for GFW_BOOT completion before doing any significant setup on
                 // the GPU.
                 gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;
+
+                // The self-test disables and drains the whole tree, so it has to run before
+                // `Gpu::new` boots the GSP.
+                #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
+                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
             },
 
             // TODO: Use self-referential pin-init syntax once available.
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index b2cfe73af114..ff8b00a82442 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -9,6 +9,8 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
+pub(crate) mod doorbell_test;
 mod hal;
 pub(crate) mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
new file mode 100644
index 000000000000..aef9f4c7f2e8
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -0,0 +1,257 @@
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
+    tree: &'a Tree<'a>,
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
+        // Rearm before completing, since the waiting thread triggers the next doorbell as soon as
+        // it wakes.
+        self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
+
+        match self.irq_count.fetch_add(1, Relaxed) {
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
+    let tree = Tree::new(pdev, bar, chipset, DOORBELL_SUBTREE.into())?;
+    let tree_ref = &tree;
+    let request = tree.request_for(DOORBELL_SUBTREE)?;
+    let doorbell = DOORBELL_VECTOR.leaf_index();
+    let doorbell_mask = DOORBELL_VECTOR.leaf_mask();
+
+    dev_info!(
+        pdev,
+        "interrupt self-test: starting on vector {}, subtree {}, with {:?}\n",
+        DOORBELL_VECTOR.into_raw(),
+        DOORBELL_SUBTREE.index(),
+        tree.msi_type,
+    );
+
+    // GFW boot can leave vectors enabled and pending. Registering a handler unmasks the PCI
+    // interrupt, and they would be delivered to a handler that services only the doorbell.
+    tree.reset();
+
+    // A delivery proves nothing unless the doorbell bit starts out clear.
+    let pre_pending = tree.read_pending(doorbell).vectors();
+    selftest_assert!(
+        pdev,
+        !pre_pending.contains(doorbell_mask),
+        "vector {} already pending, leaf[{}] is {:#x}",
+        DOORBELL_VECTOR.into_raw(),
+        doorbell.get(),
+        pre_pending.into_raw()
+    );
+
+    let handler_init = try_pin_init!(DoorbellTestHandler {
+        tree: tree_ref,
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
+        _leaf_guard: tree.enable_leaf_guarded(doorbell, doorbell_mask),
+        _top_guard: tree.enable_top_guarded(),
+        reg,
+    };
+    let handler = resources.handler();
+
+    tree.trigger(DOORBELL_VECTOR)?;
+    let mut completed = handler
+        .first
+        .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+        .is_some();
+
+    // The second trigger waits for the first delivery, or the two could coalesce.
+    if completed {
+        tree.trigger(DOORBELL_VECTOR)?;
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
+    let residual = tree.read_pending(doorbell).vectors();
+
+    if !completed {
+        dev_err!(
+            pdev,
+            "interrupt self-test: only {} of 2 deliveries arrived within {} ms\n",
+            count,
+            DELIVERY_TIMEOUT_MS,
+        );
+        return Err(ETIMEDOUT);
+    }
+
+    selftest_assert_eq!(pdev, count, 2, "delivery count");
+
+    // Every other vector in the leaf is disabled and was drained, so require the exact mask.
+    selftest_assert_eq!(pdev, first_pending, doorbell_mask, "first delivery");
+    selftest_assert_eq!(pdev, second_pending, doorbell_mask, "second delivery");
+    selftest_assert!(
+        pdev,
+        !residual.contains(doorbell_mask),
+        "vector {} still pending, leaf[{}] is {:#x}",
+        DOORBELL_VECTOR.into_raw(),
+        doorbell.get(),
+        residual.into_raw()
+    );
+
+    dev_info!(
+        pdev,
+        "interrupt self-test: passed, subtree {}, {} deliveries\n",
+        DOORBELL_SUBTREE.index(),
+        count,
+    );
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 6e97828bbd42..4bb27cc8b6cd 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -444,6 +444,21 @@ pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a> {
         }
     }
 
+    /// Sets the pending bit of `vector` in its leaf, as if the vector's source had raised it.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if this tree does not implement `vector`.
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
+    pub(super) fn trigger(&self, vector: GinVector) -> Result {
+        vector.validate(self.hal.leaf_count())?;
+        self.bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER::zeroed().with_vector(vector),
+        );
+
+        Ok(())
+    }
+
     /// Disables every vector in every implemented leaf, including the subtrees that nova-core does
     /// not service. Call this only during probe.
     pub(super) fn disable_all_leaves(&self) {
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 8202c4982efa..8c0761dedda4 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,7 +18,7 @@
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

