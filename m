Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6E3A1A3F
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966589; cv=fail; b=BxcyaCw30RJRoBmIPOjL0UDxVYNtqd6BmA8k5rJwZTuheIjTgT/DKLH/vgysg4CI5ASPgEEhMpXrtX5Cff6zSUibJPHjwiN8HNqteEVn9olnLUiCRhDHieQqPElNMj3ZopK0ii9/coKHKXzC6GSdAcKg/MOD6YK+Z/SX9hMuXG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966589; c=relaxed/simple;
	bh=0jNIMZV7DddEdyE+9AoYVOLLDp4/aKaA6ojxdI/vWC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=loLd4FyjEXze/wKf0uXUbtIBJ+Hu0LQMSheMLtctZ14Awk232l9qJmCrNJDrr2/Yy0J6iwrngmeKtYJEQikyF0MQ5FTMjxC+O8ssKHqISBfzASKxtAgVEWzHqDD/J8GHfvul6p8+vRKmN843HgTXXLq3bBhi+sUbLuXk8aiq4K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o7TFt3YA; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o7TFt3YA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZphpruZn7V+Xh6opaFOxVpWosFiJ49HrxL9LAObCjEWy7MRhb5KoilWBq7MmQY6V5o7U3g0jfMggA8M7H3mY9nDetFl4dPZUE4AcUqWOemEGnYrfaoA+KbGBnzX/SnYYfnqOyrlcEceEWPYRytgbgDgdYOgGRCue8JkwwlIutFXc0j91P6uVjTiHRLNne0ZVC/J58pzhlzC1y7+1wBAbjpNl5Cd4l2n31am3dcbz1C9bdLzjoNGRbAwBZLvcQu48+8fQOTaBEk6DHjON61q87mZvngHu7ZC2TM7UCSy1QQymGXmMeG+PauhsCi6hIrKvMmtK0HU3+I0SSrs6EQwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhtvfWHqPYHrbizIucNd/EyShjvqWs0YJjFg8BRlFcM=;
 b=yau2b8zkJ+KiTaSA9qDd3pUmxZAgG1qHx3q/V1JMeR0NI+2X6ZPgUYO5P2mddqXH5Qy4ePiYFYmYAnofmALIK7ukx4p+jAfgWAWB0IJHJhRoV3dtZDI7Hb7g74us91r4XATAppejsuhWd0eq1OLMJaYbeNhj2ScYVB0W31GgLSD56QYphXKZpR/PoS/7xoBWt6O5GbC2DRSdPyxKLRKXhjK+H9uI1jdsEanGoP7D9AwHD2Oft/wMoVokTqPLEz9I7fZ31HNox/mbzWSF9qkwniANSbO2pUxIH5gkozyBiKmiGTXgn7ZjqFTkOgOzzANxXCcOue4LXbhVBGhFwJqlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhtvfWHqPYHrbizIucNd/EyShjvqWs0YJjFg8BRlFcM=;
 b=o7TFt3YAPyXqJ9SqAmrgfqlQ4/rJWJlPEgDkerLrH3VsXGdvzFv6kaa4VBnLSCkdyqS0v5q6vAwU5MBiDHPI1TxH52mwRU8hV7gaALVPvFbQpCNc/cdOoa5HPLCxtdZiQ9oPbWsGAy8HicdH6pb/ZM1fCPePffucVv3y60vAz33PPjZib4tziZezGb+utXaPIYikQ4Oel/TsPDbByg7N8ksoBiLVC43A8+OvaeLWHKjJEBJmvkyt/oAr84Q23AbfUCy6RhPhK/1HSdB85e3o2bn4DSF3FhTHfCdJy0e4boz8iiQVOTP4WFvQ2Yh532/4E1DeaTSk8s1WD/Y2Z9Qffw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:54 +0000
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
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v2 05/15] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
Date: Fri, 28 Aug 2026 18:22:33 -0700
Message-ID: <20260829012243.496697-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb4cb09-6473-4d12-f2c0-08df056c0cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+aQlEqvFDcY1A0YGH74wSTRr4A9/vfK2P+kVBhBV62H8hN+cgY4udtONoudWgU8ngeagYYIU0kCy8s+h381/fkGrrl4S6R1p/9HsU7xxRNP1ZVnjWYWVA8P6MUv1jV1oIBRHH9hLvTtOA8Tb6htcDXQ0Tjsoxkqyjn57qLkz/pgqBAWKRQhLi91sku5/szDUkDQ4J3a8XE/sW2te2SiXtJNkuk/mYm27sPbQll19Z/znq+Le4Z9XFZLRH/cnCX7Y/TqiJDolNvxoJtkZoVmiCwaPjtU9TmKWQBTLxxnEFNN65VSJ2pel7qpCXuqw4RdTP54h2CwyCJSx1MrtzdKi2BcT6x9+BTQrKW+4Iy+Ysy15U8T/r2qxC3fz4MxQFSSfeVua5+Z+7DG4Pp9yMXXhC8MJt6W+y8LQVFz4gRnoMrrE/INgoMnSHIUJgu5C2hJ5qE3sCWLaG2R7L0TasILL7Dj30vPMXwwIN7jnjsMfo7j/twIFOr0IqOO26k/TADBigYwFHzZ6g7RpworrOF2+I0eOm1g9qi07IQmFz5LwI9ubMZ1tzDqXPxbUty12yl5RFg2iwftleV9lp4n/jIyRqAElQg/gVOws4mLdbI3ApBxXbsgic3OaPoD2K8gi81Sv8dO4iBRDCCJyHEP9wSSWcp4qflCGkXwwp7eWG5OBZVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ONqkxFdOgPoy+2lC3FReXoaC6I4TfO9uw861nNDa+WV3Xbl8r19hObWRSEa?=
 =?us-ascii?Q?Dhx9EJVIEYPplum9pwLSQUYfbxve9ZhD/Ibtfz8R9txXcry9RLv8xuN5BUO1?=
 =?us-ascii?Q?/xT6PSLmxvOe+hrLd4VrhIl71FzO/wwZ39K++yoXM+ds8hELmKySqILCtED7?=
 =?us-ascii?Q?lZVuNKD0M2/Ul2G4+PAQnzuUVfLID1vVY1WP7vx6yIVSHOt0eutJycywKvp8?=
 =?us-ascii?Q?v/T5vQiMAE6P2mpfOl39XuNrUWmHWN7kW60dcGJJJ4LH7Rvp3xJtVa3tc14j?=
 =?us-ascii?Q?uhkFx5FSrm1TTzZ6nKNbhcXWBgloLdL+xI96PTJovM4EK2s96N6lc25ZH2J3?=
 =?us-ascii?Q?VXoI4Ni0FTjWs/LpYiQP2K80H65QkOcNLvxWwWvnLf60pTRIOtx20nW60jDF?=
 =?us-ascii?Q?+trh7CZoLcnfnmo6EaDAtP+bYI/vPEHZOwQW9p/WvZy/K1peE26+HAqmSsgy?=
 =?us-ascii?Q?mduOjgUelt9lJ8sq43TFO5EZk9jwghmrGwiGTkxtcBvklP+p0DccI8DA/HzM?=
 =?us-ascii?Q?AuU+Ha9A4kmmGhKFyeXW+Bn5g9Yr0U4VZilkBw8PkMaEuSmqIG+sifbuLaMD?=
 =?us-ascii?Q?Bt4sdKWt9QHblQ+DDtpo8pLnEd6Xhqi65WC+0B22c+Wi272ighpvjAqCrscO?=
 =?us-ascii?Q?bAeuRhU3uijgZVXvOFrRwZjCu31r8snZRkeTcGiE0HQH0PHRyq6yU9jiTdiZ?=
 =?us-ascii?Q?5lzcf4ZxB5zT4qYWN/kxES4XDdjLC2U2I8rra3u7/kPPMH6gfW/d44snQ6j4?=
 =?us-ascii?Q?cYsLT1V5cauyxw+/pDOacyyFsNQMaWrLhwsZzXT1j41/k7yqisd4Hc7+VQet?=
 =?us-ascii?Q?6bXtj7H2VrlhMcOkIpNL1kl06cJy4tyPjnZnnXOwY9Oi5WyRggKZvgolSGKt?=
 =?us-ascii?Q?Rfou5JFCmN6HUOsb76C77xrOS5QEldLN2dkjCdXOGp8V1o3Ewx/YEko9F5LT?=
 =?us-ascii?Q?Lv/VoZsbOUrgr79miw0kL9Pa8lYp6K5fwSxILeDV4n4i5R5zL3FbqeiR4Inf?=
 =?us-ascii?Q?ufJMTVcqHTj28fHKu33BNu2Au+Q9AuWN3ioSmfuonNVA0Rh8cEL8XZ4aA7Tt?=
 =?us-ascii?Q?J49WRY0iCUPdsnok7EMNJK3zK9kUELuSNCQGx3j6NfxMwozVFLcaUgC/f3Cd?=
 =?us-ascii?Q?wr4u0pwuHz6IYjtPfCv5gEXIZyXdoqG54+WLcE9taHTQctcxx75E9bCDjD+r?=
 =?us-ascii?Q?2b3v5DB1ckVO8LkUCFidF95e1F7RsVgNLPC9gacKgsUK+zmncTpQjDSxnPLj?=
 =?us-ascii?Q?WDahCyDNSB5gsjxS6trmwKt/s26ZK4nxfRwgCEUx/pwH99VNmIyPRSFe/5ft?=
 =?us-ascii?Q?kh4EYa5yuoVgilv6HX3ZL9rnPQF8+mZ0jZ41ECLsPc8cxDHNKTSjOhj+PFTa?=
 =?us-ascii?Q?IvWM0VPSH+1DmRIE2LCgZ+RNZu1UT+Kr5wFxR87RSOWKY9/Y+smMIOWQYINk?=
 =?us-ascii?Q?bOr5FoHOGufin1z9NJx2ReM5ELa3JTCqqic8H87iVW62Li7LX3nO/Mr/kYf1?=
 =?us-ascii?Q?rV2irq5E5ShehtV5EGua+142TprKuxylLgWjPI1VblAai5ImY4sBYvHGCOXA?=
 =?us-ascii?Q?7CdeohE6Q4IRpf/zUeVtNOpRQz1+87npIK0hWxtCc1lGBK/Ig9GsdBKvFPxp?=
 =?us-ascii?Q?48VS/K+IH84MtlQrth30Aq0KCU3Oh67O6gHbopIRxKRo4x9CO7X40kRV35F4?=
 =?us-ascii?Q?KdVCHA/GZeWxME5FT8kzEe7Qq32yfQNTb0Oi4WB31CctYI47mTGMwtuWton7?=
 =?us-ascii?Q?6KdEu+/ysA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb4cb09-6473-4d12-f2c0-08df056c0cf2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:54.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+0IlvAWm7lsWRQUDwCPSli+bMj/sZR/4TO26mcabZWiB3iZm0qKMD+LyzsR3eZ7CzcT3T3HJjkznrvTDSWXiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

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
 drivers/gpu/nova-core/irq.rs           |   1 +
 drivers/gpu/nova-core/irq/hal.rs       | 111 +++++++++++++++++++++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs |  31 +++++++
 drivers/gpu/nova-core/irq/hal/tu102.rs |  30 +++++++
 4 files changed, 173 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 3066ceeb850c..02ecfc47f4d0 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -8,5 +8,6 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+mod hal;
 mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
new file mode 100644
index 000000000000..ee354859b965
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -0,0 +1,111 @@
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
+    }, //
+};
+
+use super::{
+    interrupt_tree::{
+        LeafCount,
+        Subtree,
+        SubtreeSet, //
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
+    /// `serviced` holds every subtree the driver services, and `subtree` is the one subtree the
+    /// calling handler serves. Each method uses whichever of the two its interrupt type delivers
+    /// on, so both are required.
+    pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree) {
+        let subtrees = match self {
+            // The written value is ignored, so any write rearms delivery.
+            Self::ConfigMirrorEoi => {
+                bar.write(regs::NV_XVE_CYA_2, 0u32.into());
+                return;
+            }
+            Self::TopEnableCycleServiced => serviced,
+            Self::TopEnableCycleSubtree => SubtreeSet::from(subtree),
+        };
+
+        bar.write(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR,
+            subtrees.into_raw().into(),
+        );
+        bar.write(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET,
+            subtrees.into_raw().into(),
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
+    /// Returns the number of leaves the CPU tree implements.
+    ///
+    /// [`LeafCount::subtree_set`] gives the subtrees behind them, and
+    /// [`LeafCount::vector_count`] the vectors they carry.
+    fn leaf_count(&self) -> LeafCount;
+
+    /// Returns the method that rearms PCI interrupt delivery for `irq_type`.
+    ///
+    /// `None` means that `irq_type` needs no rearm write. That is the case for `INTx`, which is
+    /// level-triggered, and which nova-core does not allocate.
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
index 000000000000..32b9b4a01adb
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::pci::IrqType;
+
+use super::{
+    CpuInterruptHal,
+    LeafCount,
+    PciIrqRearmMethod, //
+};
+
+/// GIN parameters for Hopper and Blackwell, which implement a 16-leaf CPU tree. Only 12 leaves
+/// carry sources.
+struct Gh100;
+
+impl CpuInterruptHal for Gh100 {
+    fn leaf_count(&self) -> LeafCount {
+        LeafCount::Sixteen
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
index 000000000000..e22eb37906a8
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/tu102.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::pci::IrqType;
+
+use super::{
+    CpuInterruptHal,
+    LeafCount,
+    PciIrqRearmMethod, //
+};
+
+/// GIN parameters for Turing, Ampere, and Ada, which implement an 8-leaf CPU tree.
+struct Tu102;
+
+impl CpuInterruptHal for Tu102 {
+    fn leaf_count(&self) -> LeafCount {
+        LeafCount::Eight
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

