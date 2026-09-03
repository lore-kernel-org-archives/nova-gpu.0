Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A734A78E
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405336; cv=fail; b=apwkvd2IhAedBFY7I+qSjcMVx+QUGeHmSJhvMCM2DCKq2Os9CSlf5LN4lURTua9ejQ3mKctVQkJNLfSOirJ1X2jK4BpPoZvOAauh5Vg0j9JMcsHttj7fQqlRP+f8X2iiiSd5tIx0khsBeA5dVzaNHCTcPestrvySQlYt8Lul/Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405336; c=relaxed/simple;
	bh=yS53EgqjqKyUK5jYULyrqnUrVQW3g3NFYjbSM7NLF5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=smiZUUa6/FrCTzq+T4Nis9bwUZlHJ0A11zmYkgTMDQExrqrJ77YDam9f3vJyGS2Edkxs93H1rVfntedaurkLz6B0rz/2t7Nhw5FyLhQkr3CUBIcHe7MUI6Aj4hGoTbX4p1960MLQ3873/POnNjnP4wpwdXnPM3S9CxWNVX/h2xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LTNWD4OZ; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LTNWD4OZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sns1tZb35XYlPYAUhI7zEr01BpHEzk+SoJXKZRdd8i1iGKRNaxohm/OLdYTPl4dPTyX/+qpHYIduPxnRVCkkJ3udYi2HGGhxYOCjezMeE2TVMkagcYw5mMF8UAVb7w0h11Es4vbvbIRt3HtwP0QT9NZ6u2V+AyuN2lf/dKT3pg8/5YcWcErXisZ9/PSfovxxWFiCd73Z8gCtrzCyzYkAuiuWJnmEUemA+cQhheplzqWhgZx0MBpaZ1QBSkBLygY+Piwt37kTjL/w8c8PZwHCtBLR6heTZUMg0L/4vFPvAZ8QFGpLTcPoEEHC/srytOmAGa5NX1OKMogT4lFlH3QJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnMB7KFYkBt2xjdwExTVtqDdPU3xb3s3mhNfx8vasm8=;
 b=DWpwC8gRgphKT4O8JtxZYUeLzSLxB4QIY37IBUmGCetlfwkoJ9Il/EI5gMN3f3pKxTCaKXfnqsPUK6QhgMRJQgydkXqLA4zXia4mKJe2utPTfNxTghU/hnObCgBbrdEixmwjIBG4kwzl1RT4ULNreZeoU0RSUBBtTYeXSjfo1RK1xKkEPr8FuGE6QejfGFci/aqdW9OIl1gfCTOFIjKIm1OId0xXo3YzsXzcIynBZs6xpps9TRkNPy/ZvmwF+8jZvI9WBsXVY7UaUe2ir7JPs0Gqhe4aZQRvMFuUQmyrcbxmS06vt11ZC1fdhfLbjjzFs0Zejsv60RYpumwrswUzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnMB7KFYkBt2xjdwExTVtqDdPU3xb3s3mhNfx8vasm8=;
 b=LTNWD4OZ6HWVVZ+cKLknsjop7qu2rdlHJx1k2R86z6Mr+cbGVYNlmB4NbQFcyMtGqqhr9ejBJDVScL4vniNJoaA8qOOKCh1EjqHl9/7gZ/e2xGu2CuaiOGOH00vS1sk6/ZUuCnV/13yeYyvm/atLeap9O/SpB5D+KQXu8uan/dyP85pDwUcH2HrFJMU3hFSxdpGk0yMxX4fP+MsJYc/netdgOR8yM35iGmuWyksIzo9HRFVu3oU4Olf9xPSl03fB+TIZSquv/8NGaxgPVAhV2bC2kV/MI17s5FpJK8u0QcyGyHMMRAmJEUlQh2KP6yElYyVTTylbRR5vGPfRvsDoqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:24 +0000
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
Subject: [PATCH v3 05/14] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
Date: Wed,  2 Sep 2026 20:15:04 -0700
Message-ID: <20260903031514.1515905-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 96314496-591a-464e-02c4-08df0969985d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	ES1ePwF7CkzoG9UD9AmMfspL5PaxarIXWKc8ja0zQ/zJRRUWublWR2zvtesJotKNf3mC9Rjcun7nhoBDQQ+x+c0DXbZoWqkTFeGz7snvgVJYUKsz6lEN8ihNVojVbuKMa0/0hadJZFGD4n8daY5z16TsvTxtw/KDi1L3enA7XR+eUTeT3eBb22tbmEpVMaKQoFzYwYuHb05lyNXhRnisRNNaWCjGTZ95DTQx37Z9FOPGODLL7uvxZCwvDQyM3rFcn7lKUI5kG0kR8Khkj+p2NbUIqsyJw36wQR+FPQyYY05fDQjRifU0aSzrQ0XrgS/QMH6T3PjvcY0oUuLos6T8vrVFsrcPXtm4PwJMtxotIXaPY7gXHp5wvw1JR22qcphApiBxXz/rbj7MWXaoUBzrfZFaAjihhhxLd6O4k3UMJ7UXNRPxMwjmvc4mHqcSuUfkQcId2FSQpSANvTZMPAXt20LVCWixD07DycfkfTrhmKm4IbjhptDehZnDu/LBOjdE2nLIB4wbUIgVWwID+8sNRY9hEA63SPEhOX3oxHfLL+5zVBqyrUkpFfPMfQuqUlUygcnVQ9vOld8uZc651Mf/Os7uFV52sn5MNiktHpb3NVdvTt5GoxqFoCarQG0LSiXExW++ii9JOucAkcF945wWADT0DaONfll6se8QOHntC00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UOkSlFE6WadkiBtMIa7Ofvti8ZgCz+V+H5spaiROi4wqfOUe6s/ganGpcLZ5?=
 =?us-ascii?Q?mWbUlXgT4+xMvpQVM2fV2D32gsBZwHa8KuPnWnTBQjBGgVSLGpcrc54og4gt?=
 =?us-ascii?Q?9uSoNMPwnNjY6R9KemorLQaKyC5/bfNfsh6pQDjhhtcTiF0uKFlU6bGij466?=
 =?us-ascii?Q?jHbT++xvQTlGwMlqen6/VFXjU1oxhmBAy6ZLc6jqg51aiGV36r9wcygi61qb?=
 =?us-ascii?Q?kxpadWSwgxulb3XK4+rbkpindfGzGJOs5HydZkvBtucFmLy6BacAoyZvt3hg?=
 =?us-ascii?Q?cAo/NV14BBevczsCuhCSuvDjYiOCNOPrfV5ghUgbgZJ/zwCR/60ruImrj9mK?=
 =?us-ascii?Q?jikovzq9fMFZT9zuwGAKZtQJK/y0Ba9hmciO4xmX35nIKvv+tHWuVTx7XPzY?=
 =?us-ascii?Q?bQg0y+zwrecWTbLVxrK+Z3JkhbjzvgQ7rCOkp+AQK6Pj0XDAcIUvT66pPBn8?=
 =?us-ascii?Q?Ce0/2gOec1o1dOnrAIlAZlDMJanXTDNJtY1pLj0eHZ9lkv6gnmOgXU4C385N?=
 =?us-ascii?Q?Io/bFfEZ87QjlebGfujlE06kRa80gPqizLgbiU6tdKPPZG2Mmem/3iIX8f5f?=
 =?us-ascii?Q?/HpCDFawP85WmaVsUI5886sTYJoxUC1uJ6bz+FaSKFOMJ7ZiDx6x8Q5IbEKE?=
 =?us-ascii?Q?xdQZBjzFjwaTA2gld6nYrck1jiBZ51D58i8SqQp4bLJDO1yzuxPVwJJ8/E/Z?=
 =?us-ascii?Q?IcP5HNwaHl9HbCKj9ingWYX7l7KpOGnv0RIQbxLBDMSPFdMhWFMR8/g2piq2?=
 =?us-ascii?Q?cT9jkwOtDoXOF25kdssXawuPuLg+Dl2mEvoG2ABxHmyJqb2eLGXqQhIWu/x8?=
 =?us-ascii?Q?3tP2NSOXyDoAkI6q5EFBPDTVnOvV8e6ej/66Mle1AifXrPPHDmgMLV9ZVe9W?=
 =?us-ascii?Q?BtkKzsy89bsuUaeL2lucquDvuwPvRabAXAny5zIS+SdpPbWT8GpgYXwfAont?=
 =?us-ascii?Q?aY/A52hlOn0n8YBNE3dECUHBCeqZpX93e7o65tTf1+Bls8PfW9xkHba5t38p?=
 =?us-ascii?Q?9Heu940Hs6PLQ4WWSKElRgjsaCW8n7G4txd1ju/QA73L5weSslmw2EpEI+q5?=
 =?us-ascii?Q?eKIg8I3pRfBQqpPRF9yUERdkfXhyJPYb8omydNINJihl0RUTt0zqLnnX0Tz5?=
 =?us-ascii?Q?ghBGTopr3z74GHaPf4ZWn476OYyfME3qlrl9VbQMavSBv8awdAQAGGv6Gpgt?=
 =?us-ascii?Q?K6CpnOi9vOJ3xMX1UIghw5IlYuUlcoJ9utf9wEyAt9SkaLdauoxtw0Oeu2J2?=
 =?us-ascii?Q?yLa30/nwT6X3puNUejA2wtRO0ZouA3fPjDOh+tUJmGPbkx4mBSOShRUxsWZ0?=
 =?us-ascii?Q?QS1/FawqT4Zv5jl0+IOh82kI6JmOsCkf6m8hzn6ojdAwlePt+hXCFK2dXVnr?=
 =?us-ascii?Q?yxiMFiXP8fEwSS4PRqOB028AhYvvfWtqSs4mJ/z7z+8QvU5RW35kIIp/640y?=
 =?us-ascii?Q?67QEI24RAGmPpjelJ/lh6DA2dbhHm3KSU4aYxXsM/ACmAiCS0jWKHzFZ/mlK?=
 =?us-ascii?Q?ey4dCpV46LC9v9Zy6oSpN3S5PfUDV58POYYBRoQfD4lP7R3U16NPcyYdzrJF?=
 =?us-ascii?Q?AbCyQMnIj3jf0OZQB8B6kHibalLmrSI0G8cw+tXc2MOAGRq2eePwuK+2uKJ3?=
 =?us-ascii?Q?MSF0bCn9xbjoChPtxH6aGkwnNiZEY7haUq8ZJ2AU7T1zNX3/IjfofGsax/4V?=
 =?us-ascii?Q?gPZbkLg7UEprXLkl4EyEXXeotDoHZBwCP5FYMJKCBE1mr5q5ufvCv9Vd7UbU?=
 =?us-ascii?Q?jvA5OYMUww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96314496-591a-464e-02c4-08df0969985d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:24.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suxZsT31Q4ua212xLmkDi5lyxoJClLN9IYGCeslVJMt8RuM5qj9a5sbpYMoRVEI6KM1N30AOrb3eB51oYnXZ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
controller. Each PCIe function has its own tree, whose leaf count
depends on the GPU family.

Message-signaled delivery stops after each edge until the CPU rearms it,
and the rearm write differs by family and interrupt type:

* Pre-Hopper MSI writes an EOI through the BAR0 PCI configuration space
  mirror.

* MSI for Hopper and later cycles the TOP enable bits of every serviced
  subtree.

* MSI-X on any family cycles the bits of the handler's own subtree.

Provide the leaf count and the rearm method through a per-architecture
interrupt HAL, and name the interrupt type with nova-core's own two
variants rather than the PCI core's three, which include the
level-triggered INTx that nova-core never allocates.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs           |  14 ++++
 drivers/gpu/nova-core/irq/hal.rs       | 106 +++++++++++++++++++++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs |  29 +++++++
 drivers/gpu/nova-core/irq/hal/tu102.rs |  28 +++++++
 4 files changed, 177 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 3066ceeb850c..d21dee1b89a0 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -8,5 +8,19 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+mod hal;
 mod interrupt_tree;
 mod regs;
+
+/// The message-signaled interrupt type a vector allocation obtained.
+///
+/// nova-core allocates MSI-X or MSI and nothing else, so the level-triggered INTx that
+/// [`kernel::pci::IrqType`] also names has no representation here.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(crate) enum MsiType {
+    /// One message, raised by every subtree of the tree.
+    Msi,
+
+    /// One table entry per subtree.
+    MsiX,
+}
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
new file mode 100644
index 000000000000..1ea677e37e56
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -0,0 +1,106 @@
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
+    prelude::*, //
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
+    regs,
+    MsiType, //
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
+        bar.write_reg(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
+        );
+        bar.write_reg(
+            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
+        );
+    }
+}
+
+/// Per-architecture properties of the GIN CPU interrupt tree.
+///
+/// The tree size and the method that rearms PCI interrupt delivery differ by family.
+///
+/// See `Documentation/gpu/nova/core/interrupts.rst`.
+pub(super) trait CpuInterruptHal {
+    /// Returns the number of leaves the CPU tree implements.
+    ///
+    /// [`LeafCount::subtree_set`] gives the subtrees behind them, and
+    /// [`LeafCount::vector_count`] the vectors they carry.
+    fn leaf_count(&self) -> LeafCount;
+
+    /// Returns the method that rearms PCI interrupt delivery for `msi_type`.
+    fn pci_irq_rearm_method(&self, msi_type: MsiType) -> PciIrqRearmMethod;
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
index 000000000000..10744ac3ab77
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use super::{
+    CpuInterruptHal,
+    LeafCount,
+    MsiType,
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
+    fn pci_irq_rearm_method(&self, msi_type: MsiType) -> PciIrqRearmMethod {
+        match msi_type {
+            MsiType::Msi => PciIrqRearmMethod::TopEnableCycleServiced,
+            MsiType::MsiX => PciIrqRearmMethod::TopEnableCycleSubtree,
+        }
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn CpuInterruptHal = &GH100;
diff --git a/drivers/gpu/nova-core/irq/hal/tu102.rs b/drivers/gpu/nova-core/irq/hal/tu102.rs
new file mode 100644
index 000000000000..fb8ded59c792
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/tu102.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use super::{
+    CpuInterruptHal,
+    LeafCount,
+    MsiType,
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
+    fn pci_irq_rearm_method(&self, msi_type: MsiType) -> PciIrqRearmMethod {
+        match msi_type {
+            MsiType::Msi => PciIrqRearmMethod::ConfigMirrorEoi,
+            MsiType::MsiX => PciIrqRearmMethod::TopEnableCycleSubtree,
+        }
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn CpuInterruptHal = &TU102;
-- 
2.55.0

