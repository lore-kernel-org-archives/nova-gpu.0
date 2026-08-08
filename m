Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43C385D86
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158704; cv=fail; b=A1XX0yVVQvHFzfAQ42hwAAK2YbwtD+IPfAWHxmSAiYvLaqkUTCoB3a+F7v7U/OfAeA/j+S3oEI0XcdUkfnD/B2E0e1jDlNMgP5M3sDPKEyTXFnlYlDxiDI9Jn/9jogxI8mSYaGVQFnn49pBj4cHkHvx6LHYlodfjdqjc8U7Ql1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158704; c=relaxed/simple;
	bh=rpz/zpn5KN4dvNZzKkLz8dhZ+IKLpV63LhpWYU4pFnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qt4P8tn8MlcWVPRaJ7I3rZUGYTUqAJlqPI/06xzNkZZEH8lklq4qmzdKBSymHbWYoskO+DqgONaaekEh4sMheqhOzwJ62CV427sGKMuZ4rJLCQ3Bj3RWyYY94Fs8FXMk8ENdmbhv0eL3LRmsh+kBKw4mozS86ep5OGlgSWbQx/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jfGMm9Iu; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jfGMm9Iu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsPkLmxD5kXIZRJipkbXQPJS9V1pBlKoW4OraEgjFT0m97wlnJIaRJ/NrjjmIF/I2g0AveagNAHQqIVtaTGnUk0Sm+iKylU2oADCCbcnJ1tPxSQXU/mmuO6xmFCZdml8l3wqf0AQnapJPpEGCpomhMvYrF/JcDxpFbW4ZWVMKPpQI7xXYqaNZSGj9h71it67D6UZRUNbU2pu4jzrXsyg2XUP49bjOWGZ4qlW4SfZRqpO3RI8dRs3NF8GVmScGbzxBCOyMpB0Mz+uoLDDoVTVjxqh2K4uG/AJ1Zin2VmgWwqGx8rPNgpLxClqjxxw5puedY1YjMmIlUxI5CVBdxbKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzyRTmlgi1WKG68wyPfL0NHQjFNuPBFMcKTYgjfJcgs=;
 b=F3vSjrl8x0vxgqCOki1k4+IWQIcTn7Kf7IctnLzFC6nH+RUNRpcHzl4Gn73lsE8eNQ65swAad/M4DMZEzHaAhXMpuhTcKM62EPnTrkMRJ551j+wl4Y00xVilCeVeGFFGghluKgDjeH4IbQJsMg4mPDYtzs27IT56yjWWODhgaRpyaq7CZGHcQkp9rtu20ss8tiZn//2FG5/KLnkvvuGVR5x7OA8HYMuplZfxsmrs1lsiQ3horzZE6phOQL8JcAg3uekdX6Cf0EqkykH1KzlXG4HzUqSxxT9PSPV2nyM3esMHtnZJQ1orc7iRt1k6UJhUwk4JfUAjdttueP2y/7s+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzyRTmlgi1WKG68wyPfL0NHQjFNuPBFMcKTYgjfJcgs=;
 b=jfGMm9Iu2+E220AqDyXFMl9Gf+i7Q9kDzVF+QkwbLI4HHEm7dEHAbnV3dCwnjm/AGapgUsP5+AYScnf31vzBfSCu/+rK2JE8DPElaAeEV2/j1ZXD0AHEfHYcjiDU39eM8VgX1RElFdfb2DkRxu+QHTwz2vz3OnD2xhK09ouibHVLEIwSF6AuYO7oMtL7RWeOSJsnPXAsyOjLIZ6PRTeUjZFXmZaep9911WRLzJ4n6akwoRPaAiQ11Tfnu1OwmGcWkhsEIK3EEQ5OZLG/DuVvnBle2RIY+2qgpwzWm1I97238haFfLvCJosoJaS1gGKzUIgh0kMkSa5sWRYfzIWBOEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:30 +0000
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
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH 07/17] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
Date: Fri,  7 Aug 2026 20:11:09 -0700
Message-ID: <20260808031120.363869-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 560c0f79-8c1c-4d7f-2859-08def4fabe39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eqT2DhZVP67QveHEo6JpgvU+Ul1d5GoOOeKjmWGH0mwpUKh0hkLVseTL66sEBFGVbGWP61UAKiqA/6IVTLGQC9idfd0yaFv3gPzX3V392NA1ctkRXHjBjl/vJri6ZWtvsg9KzsUJWD9dh10ID/wkdOWrMFEbjOc9pKsE5YV7RHaB0enuzazBUF49LG+7AJ7NseHwe5nmzjYePxvmzxpJXtpCsZ5M7zvcjG2hNauC7qv48dgXgoCipwll8uTt8lOJFNngGXJ6AwcuGhgtKMXLmZHFb5ztL/dftq8Ph72pL2mEvOHY1g46KNN6pcl/uFqaskDDyKsgg7jz69W5IvAaBzX7apbWjnP+i4WjJTh+pxcbI4HuGnnvMuCKR7RHIcf657q/bGxRBT89kAG77rG/B0IvDMDIyafzt+2q1My3EwkSemEsLlkCNWtnTw9Ex6omWBoHYoiCOR3eXu48oP3Gyky3Abu4VoBPlZF9IPzim2gz0zKPqFC8rtEHBSin0/j1fr+epQRNiArbHl/g6OMpoRgNiPT0pRpdP2ojY51Mpmdvwh4umWn2D5hKSUO6p8soS9l/bKLNc16ON9iyWavA7seKOPYHjV18rhqNGw1F+QWjzEnS+dEdr6F2Xw+k5PcYDmdoj5OY+HNvK8NPeLkQJiyXGT40fzP+zZ5C9jdFV24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L6U5wEkaT2vX3WDJlkDQ86j2OXErpoYAkiWH5ss7QIq5Smsai/xYND+3Y/sq?=
 =?us-ascii?Q?stbjD/DnQzJuqK7ViEqdOhpQvexWlb/s+r34DG04YvNWzxHS0MIB4VAXcvdJ?=
 =?us-ascii?Q?rF8We87sOjYkhBTg3izQ6AGqALnYlIFl2sLdHpkmhtP2E2c0zdxeG967lgar?=
 =?us-ascii?Q?8H+P3235MJFRUhLRljJaqCTIxEtIsCZ4rS4auSMNZA07eECN9VCp2EIjy8p7?=
 =?us-ascii?Q?lr3WcbH0Qzp3mYm21Cd/CHh3zPmCdFfM6vPQKEDhG7lj6jC/Nx39ZyhoSmvB?=
 =?us-ascii?Q?4Idj12MUzni83FM1VlwK6/x9sucemrS4o0KxYXEAa2y452uDqAt/XsRE7o7j?=
 =?us-ascii?Q?LDdPkG/csNFUwDiBB4DMzfbGeITEgDsvMRD/YwZBMJMpVBnw/4QVKdXKwfzA?=
 =?us-ascii?Q?9w8MBYoNXjSHrugwmjsdneCzrt5rJHSX8GwIB33SWjH7YGn+of4NWptAMlha?=
 =?us-ascii?Q?RsugcJMF4RPA4AyA7wGtwpgOmmZZKcBGOsJIwrS/WNhgaxuiPSpo1CJijboz?=
 =?us-ascii?Q?8mk5VlSvHIhaoFoqzLAruMAIaYlWclc4SI8lA2k5Xq7JdoSgzoK9fB6Hb6nU?=
 =?us-ascii?Q?gj88a45cvLEKqrncRWOS6RtWcMTzUcE79uNZj4ySlzfV8wwROZT3ofKH1tjk?=
 =?us-ascii?Q?wUlsGn5jEU8tBoJnOzb45orc4AlaX88wZKbHzp3QbtznAXEDmPKJ04fl+93B?=
 =?us-ascii?Q?6eyYZyULJ9AN/fCurn7R7BEUsFzt+8UV4VOKmBydObIgkwib/WGGziL0Q+/i?=
 =?us-ascii?Q?DcZ8chOHsMvVwDamAZyUyAMgxAc5FnyG4IJFWER5tQJvvqEhJDoz83lbsr6e?=
 =?us-ascii?Q?a9D9WjDwwbNmR9N3ZZ/aqEtrSt8zDHXYm2Av9qg6pzQkkrhY5LdyxOZ6UV8Q?=
 =?us-ascii?Q?He4ke3hLpSOHe7dYLofWxGB3CAI1h2LrKcAKjATmvq/WIsnUt+YoY+rrp6gJ?=
 =?us-ascii?Q?pvZt7fjcBvGQmJ95ElcAsDAeMINd6RiV8Jl7bosPiro9T+uIJl2lCaQV8pjt?=
 =?us-ascii?Q?IvnqsY/A5Lq+oB848MvWdCqFUvRDBLLCSqJlW7mXsTVYC4jVPGgzxSC8O1eP?=
 =?us-ascii?Q?T+H01iTpB3eLdQO0yQ6ej7jVCj2KSxKLwGdyI2Up61kt5gvn5ZUi1JL+abHw?=
 =?us-ascii?Q?AeA8Bj10LWT21Vu7/sv/WcRcgawSFTf4/E+2/+n9EUygDD8+4s/WV20QeoOm?=
 =?us-ascii?Q?WlwcfsSjoIxKrc161ZUz/c0MO3NQCFLKzH/ZRkGtIr8EOShiGe8p+kExjdCW?=
 =?us-ascii?Q?PU0GYekvL46FEu7Nu5XTSEW2ymc2Qvq9wKQhj91jPZcvl3QmTbULGM06InoR?=
 =?us-ascii?Q?eGLotQgWQBsxbuFic32tT2x6GAN4LU1PwPYwQa7seuwmm+Yl0LuJn0mvRa7m?=
 =?us-ascii?Q?fQxDPj7i6/ROHp8OPFsYCP3DpD3CMW5XOA5zno1RgwOo1AmPNFTQG1nF2dI7?=
 =?us-ascii?Q?cWoKDOmlhKq+NEWcwMtX4jQ2AsXvV3xC44f+ktRnllZNjyk+R+ZhdKwZg9KU?=
 =?us-ascii?Q?C/bIpKsgwP4d8H7SZmakAP33z7LeYY3BSDKFMFzH8rrg4jXm11qTdygmOWA9?=
 =?us-ascii?Q?VVqpVDzZrIMxFxNnEyegfc0S0s3GxMNiSEbuDc8MoA6JQV58xWFejRlSqqbH?=
 =?us-ascii?Q?okuJoddVZLyj/GNi2pO1usqrrXqQcY0yJCzkSXR+jWSw1K8gT1IvvwVvWeaF?=
 =?us-ascii?Q?XHs63oPp7Zo8hNWzJSUkfZycGJ6S1NEkmbm3aRY9bCmuofrogjhtPnIJiPR9?=
 =?us-ascii?Q?zcwxWrZ9fg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560c0f79-8c1c-4d7f-2859-08def4fabe39
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:30.5239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ALE3kIuTn15++ah2o7AlcTteoShRD3GgjO38VUkjGfxd7cv60VT0xi4qAsnBJa7RwuRKmXJIp43K6ROUoIwUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
controller. Each PCIe function has its own tree, whose leaf count
depends on the GPU family.

Message-signaled delivery stops after each edge until the CPU rearms it,
and the rearm write differs by family and interrupt type:

    * Pre-Hopper MSI writes an EOI through the BAR0 PCI configuration
    space mirror.

    * MSI for Hopper and later cycles the TOP enable bits of every
    serviced subtree.

    * MSI-X on any family cycles the bits of the handler's own subtree.

Provide the leaf count and the rearm method through a per-architecture
interrupt HAL.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs           |  12 ++-
 drivers/gpu/nova-core/irq/hal.rs       | 113 +++++++++++++++++++++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs |  30 +++++++
 drivers/gpu/nova-core/irq/hal/tu102.rs |  29 +++++++
 4 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index b70efc239334..ef77066e0514 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -1,6 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
+//! GPU interrupt support.
+//!
+//! GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt controller: a two-level
+//! tree of pending and enable registers, one tree per PCIe function.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+mod hal;
+mod interrupt_tree;
+
 use kernel::{
     device::Bound,
     pci::{
@@ -11,8 +21,6 @@
     prelude::*,
 };
 
-mod interrupt_tree;
-
 pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::IrqVector<'_>> {
     let msi_types = IrqTypes::default().with(IrqType::Msi).with(IrqType::MsiX);
 
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
new file mode 100644
index 000000000000..8de2f6e536c2
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-architecture properties of the GIN CPU interrupt tree.
+
+mod gh100;
+mod tu102;
+
+use kernel::{
+    io::Io,
+    pci::IrqType, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    regs, //
+};
+
+/// Register write that restores PCI interrupt delivery to the CPU.
+///
+/// A message-signaled interrupt is delivered once per edge, and the PCI side delivers no further
+/// interrupt until the CPU rearms it. A handler that returns without this write receives no more
+/// interrupts.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) enum PciIrqRearmMethod {
+    /// The MSI end-of-interrupt register in the BAR0 PCI configuration-space mirror, used by
+    /// MSI on pre-Hopper GPUs.
+    ConfigMirrorEoi,
+
+    /// A clear then a set of the `TOP` enable bits of every serviced subtree, which produces the
+    /// edge that delivers the next interrupt.
+    ///
+    /// MSI has a single message that every subtree raises, so the rearm covers the whole serviced
+    /// set.
+    TopEnableCycleServiced,
+
+    /// The same enable cycle, restricted to the one subtree the handler serves.
+    ///
+    /// MSI-X gives each subtree its own table entry and its own handler.
+    TopEnableCycleSubtree,
+}
+
+impl PciIrqRearmMethod {
+    /// Performs this method's register write.
+    ///
+    /// `serviced` holds the `TOP` bit of every subtree the driver services, and `subtree` holds
+    /// the bit of the one subtree the calling handler serves. Each method uses whichever of the
+    /// two its interrupt type delivers on, so both are required.
+    #[expect(dead_code)]
+    pub(super) fn rearm(self, bar: Bar0<'_>, serviced: u32, subtree: u32) {
+        let subtrees = match self {
+            // The written value is ignored, so any write rearms delivery.
+            Self::ConfigMirrorEoi => {
+                bar.write(regs::tu102::NV_XVE_CYA_2, 0u32.into());
+                return;
+            }
+            Self::TopEnableCycleServiced => serviced,
+            Self::TopEnableCycleSubtree => subtree,
+        };
+
+        bar.write(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR,
+            subtrees.into(),
+        );
+        bar.write(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET,
+            subtrees.into(),
+        );
+    }
+}
+
+/// Per-architecture properties of the GIN CPU interrupt tree.
+///
+/// The tree size and the method that rearms PCI interrupt delivery differ by family. The tree
+/// walk, the vector encoding, and the read-and-clear sequence do not, and are in generic code.
+///
+/// See `Documentation/gpu/nova/core/interrupts.rst`.
+pub(super) trait CpuInterruptHal {
+    /// Returns the number of implemented interrupt leaves in the CPU tree.
+    ///
+    /// Each leaf is a 32-bit register, so the tree carries `num_leaves * 32` vectors.
+    fn num_leaves(&self) -> usize;
+
+    /// Returns the subtrees this architecture implements.
+    ///
+    /// Each `TOP` bit covers two adjacent leaves, so the tree has `num_leaves / 2` subtrees and
+    /// the result has one bit set for each. Bits outside the result are not meaningful in
+    /// `TOP_EN_SET` or `TOP_EN_CLEAR`.
+    fn implemented_subtrees(&self) -> u32 {
+        (1u32 << (self.num_leaves() / 2)) - 1
+    }
+
+    /// Returns the method that rearms PCI interrupt delivery for `irq_type`.
+    ///
+    /// `None` means that `irq_type` needs no rearm write. That is the case for `INTx`, which is
+    /// level-triggered, and which nova-core does not allocate.
+    #[expect(dead_code)]
+    fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRearmMethod>;
+}
+
+/// Returns the [`CpuInterruptHal`] for `chipset`.
+pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInterruptHal {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => tu102::TU102_HAL,
+        Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+            gh100::GH100_HAL
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/hal/gh100.rs b/drivers/gpu/nova-core/irq/hal/gh100.rs
new file mode 100644
index 000000000000..69bd092e38b5
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::pci::IrqType;
+
+use super::{
+    CpuInterruptHal,
+    PciIrqRearmMethod, //
+};
+
+/// GIN parameters for Hopper and Blackwell, which implement a 16-leaf CPU tree. Only 12 leaves
+/// carry sources.
+struct Gh100;
+
+impl CpuInterruptHal for Gh100 {
+    fn num_leaves(&self) -> usize {
+        16
+    }
+
+    fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRearmMethod> {
+        match irq_type {
+            IrqType::Intx => None,
+            IrqType::Msi => Some(PciIrqRearmMethod::TopEnableCycleServiced),
+            IrqType::MsiX => Some(PciIrqRearmMethod::TopEnableCycleSubtree),
+        }
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn CpuInterruptHal = &GH100;
diff --git a/drivers/gpu/nova-core/irq/hal/tu102.rs b/drivers/gpu/nova-core/irq/hal/tu102.rs
new file mode 100644
index 000000000000..590f0dc9a701
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/tu102.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::pci::IrqType;
+
+use super::{
+    CpuInterruptHal,
+    PciIrqRearmMethod, //
+};
+
+/// GIN parameters for Turing, Ampere, and Ada, which implement an 8-leaf CPU tree.
+struct Tu102;
+
+impl CpuInterruptHal for Tu102 {
+    fn num_leaves(&self) -> usize {
+        8
+    }
+
+    fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRearmMethod> {
+        match irq_type {
+            IrqType::Intx => None,
+            IrqType::Msi => Some(PciIrqRearmMethod::ConfigMirrorEoi),
+            IrqType::MsiX => Some(PciIrqRearmMethod::TopEnableCycleSubtree),
+        }
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn CpuInterruptHal = &TU102;
-- 
2.55.0

