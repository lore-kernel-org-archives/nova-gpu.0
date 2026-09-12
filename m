Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DF37F729
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188272; cv=fail; b=to9R4QCidjFj9mHv72SkUv4trxLe42+hli+fuJ6Kzf9nfEZYzir+Z5SZqovZ49hVzKZoc0OTP40U5vbdD/TpoptgcqUkaRHBvuX7FS8+q3BLxdXrSqiDZdsagxmTKPv3Gq29+ahK+AwMSc8J7rGXKkrlGNv/PoJhElK9dEXOGVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188272; c=relaxed/simple;
	bh=ncuORM5I/wFkLOtgfTahuV/b6wiNVmajwVj2Dxq4fDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IzHFZuIDBqixLgwkQmEM4n+b048N5EP8w4HEGfAnIX0RzOuSc1oRDsklwwn7waFHSrxEmM9PyijXPJklralW07yqcX4AAuRlj6hTQW5ezDe+i2uKKLsYld1b+IYeixzQW5mybVhrYX0AChMsMVIvswl81tGJ4zPIrEbX7pvGxe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GhUQseT9; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GhUQseT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxDVf6q7JQ6iI8XJbKGwGk99RKQYkhUF352b+URLUxYwfPbFS9oMuHLiTQTK2oYxtR1BpDwt7F/Gjo6Ag5w2iVGpiiWzEfSjpUrTsK3wYm/ncv9tEsd0rYFWWvkLrRQT0vR1OATs6ei6cwrWPr6uaGMsWP8tlW2BH+njmiOb/5N4y+fTdeaMzJ1MTLg/QD5Uuxoctv3hkZmbsHF5AlB43ZRJGAivDRJn7MKXTwdTWG43dEJwhlg7iAWvol2e1zhSMsMdDUDdXTeBLjDzxzOXcpZDsC1JKS2N9iWFrYGJhcOf00Nhx089x9LXS6c3lYS0d5aBxAxTRcpIBdzplVq0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXNSJIo648/BsZ8HBIDYNokMrPkgxRiMuNd3BXsEtBQ=;
 b=pieMwp2g7iLB+NtjiogEWWBfM0UKZ/bnMvc5vKVGwdiovYn/c40e/4PaMufVu0hcb8isFysKQgrsCGSdSOKu7MTvnTH5xvia8A5FkiPWG7ZUlKj9iX+HQn6mrP6rOK/HCmL2P57Y9xOW8fhiixQeoCByk9ofOX68797t2pDaYlZ9Rp72KCaDVYShxSfB80X2LA9jUKyvF9HfCAUf0JZU6YXWXxsfs/DlDCGV2xnKGW7/TUusCXxJ/6sAt8RGtKZ8BN1PoAsBznRYjzJblYvZZSQbaB/e+fdqvTjzr+f2q1VlBWm1ZdJvtvclW55O9KzwhViKi4Gdq12l5mOhh+LYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXNSJIo648/BsZ8HBIDYNokMrPkgxRiMuNd3BXsEtBQ=;
 b=GhUQseT9jq0itR1MW0p7IBVSfdtW+8IhCpfYHKNw/sLKATcvTr0MZlDbhQZaFbE/xzA/QYlfr5TMTpbUre+YjPr67YuBVUNqonCLFDp6kygF/k+P3ycjb34QwEAgAK9nPVoYRrfxfOOtYO6TzxQsNGjJLicFOl26nXhFPUbZmsmpGDG2QZbHe7uazP87RHKsrWEGNkj2xIXeM4dmUmJsnXV1ZJH450AS1CzCLC5hVPLa2QII61ORXToPdtJQZIBJTJrMQL4FHyNFQsAGvDDbYh5eO9ZHtTIdBbB5kXZ1xm9MoHr0t3NI7tUzRT//QOJ++w9toBrVSEzODZ2Lrc0l6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:18 +0000
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
Subject: [PATCH v4 05/17] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
Date: Fri, 11 Sep 2026 21:43:48 -0700
Message-ID: <20260912044400.677097-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a7e667-4dc8-4681-8a5a-08df1088815b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	lh7b7KqV+on2D0Tc9arNiLpGCF+D7hw4skDhnSmbleY78ORFxvzQCdYU6vPt//BkbDux/Xf0otgqEBLPDxMQqitCCuJxXh4bz8ZgOeHBMmC6jJgQcxzctv9f/9qMF2P9QNRNN9lmp8YOOxrEp6Ct7OgFRHm9vpIhLoorH5rua/jKXxJlZkbHFX2R1JkvKKX/DQWIRzhmpYFpFeT0whjfCs0hh4ND2y2/TxlNJ5mJtNqBk30itry2WVnB5mKUYI/c6DYnuWzrwzNHfBbgbup+tD8x45N22eZCBviFw+leXsh8yHd9SvSg/gRC9FIfy9YrHgaNUIhawSxX9i9R1SlLs6nhzY+7dR6JM3ML3D2sTdzP4eKCBtBFnAYxSZ/4ZGJAnwN65r8vUKAlN/5VZHW0r8XgYSo82Re5qnqSIKEfWayigZJVIZWVOCtb4d8NpUawehDGWhBXYLdxXFcU3mA/5RpNrYrgg2jIWIX50we6B3bPo8SNXaJ0qqSnRocunt9syCLUqxKmmw3tPfcAGJjCFOjeJR6h8NHmS/RhlLIzoWZoqdfdkOSLcUHVKzzzEJg+b56VwbFPzSGxbAQiuC3cK/HqfqSyd7/DcFoyRIJkznH0t2f0xnDfaFiSZElkKyjG7C8POgtghDtJV+OeEKojFH9+POsAdMQUODUoMTiwYj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1axgLAAQ9AFK3IGOq1LSvQ+ISky3oJCTxjbDt/BNr0TEgguwnjuhCxkgvdlB?=
 =?us-ascii?Q?oF6TZH10PIB2dpC9X7GUe5uvqRRXlDkt2PXX7uoiQQmGb9EEVxa0xpln2G31?=
 =?us-ascii?Q?ZyDOoVF8xpjDYRnzJCVBfPz01ZNyQ/hIuofs01RqtdjagZnns2G2ufXqYzfi?=
 =?us-ascii?Q?DQrWBvMHfQgbsP1ZAtj6gfzEqBkJ12/7OteS2kuHrnmSgCvCcPcxHjFadf4C?=
 =?us-ascii?Q?AygePB4b/lI2hNSZDuzXJTGLntcirIUh0MtFp1FYaPbQOU0c/xkDxeaeJqqt?=
 =?us-ascii?Q?Me4QJCFfJknIqrc+Kd4hu8YT+vqAemJxCMgco0YsKW/ERFtPk9ux4JqCuGQf?=
 =?us-ascii?Q?xKPCfD3hZ5w0sPdOEtZtgnUlRuq8UlK1Ci1DT/8qo1+1Scuw9+/rO5cmXQ7G?=
 =?us-ascii?Q?9vm8ipeCLEAdjnSrWwocxneIyPi9urqzZjwNo/h2uhbqp4Zx45GXVyZFOqff?=
 =?us-ascii?Q?lT/DwRJ2QMt3Ur2944iqugWkeyYVap89IjcMchr9d1v89SXGB0nyK0eXP0bJ?=
 =?us-ascii?Q?JJp/q2p3uQbok+hOUucFRzCKVWoH+71dpKYRY+Dbdn2XPAuU3RD/snkgTbWy?=
 =?us-ascii?Q?KeJIRIfLlDJoB6weNvoYsYGbAnHEhIiYC8eKIPeKhHO/iANkh4KIL+5ONwfi?=
 =?us-ascii?Q?vaWnewODi+r3LiiUIr8AG1ZBsd3Nqn66hZyxQmQu66NQK53W3fMxFpu3mquA?=
 =?us-ascii?Q?BXiPj+tDxtNYjsob/58NTdqaYfjw6ikgtddDbA8an0TS1IDulrwF068Bmg3a?=
 =?us-ascii?Q?/25YAn+29zcROIFzeXO8FaudBr0sgWjxfL/H2O15u3CM5DnyUYZLYD4I+0Ke?=
 =?us-ascii?Q?A4fu3hOu2sE0E4DTS+JgPbwC6uGEkAgCe9woYmEx8ew2gqmKKAT2jTLIFiFG?=
 =?us-ascii?Q?qd43wJFW1hKTiKp10yJEBlecMDtS/nY7VI0rC4h7d6lq6RkZYSz0ZXI3rNv+?=
 =?us-ascii?Q?S2hCMs4HMBn2M7AcMwGVmQIA8Kzd1xrrvfmKc+en0vZKOYZGP8NUmEuI+/xc?=
 =?us-ascii?Q?DQFTYrt8lc56RMWmLmIxSk5CobzMWw/DuhafkLMHMDwKGJ3sO5DRNH0YIimj?=
 =?us-ascii?Q?K/wGB48kOsJrbim/bDA6K67Msmyu1hI/g3gqnVyCz2nnSc+yQjE3ua+bvzun?=
 =?us-ascii?Q?CQ91L+ZAy7UxHY09SgBh2oitSzpw+lDuvCmV3B0AS7ITj3NrFGQuXut6mUzf?=
 =?us-ascii?Q?H+cUski8yKQT/UafRYU3WoBglqjF36OKOSRp1WhCs5lSbC4gM2vl6TA82PTZ?=
 =?us-ascii?Q?mUeLLAp+TjUMuQVEFgVY6CM9KDwWOuF4Zllbggu+BTmCH3r+KIWR/xvr7eEi?=
 =?us-ascii?Q?4FFGavxl3xH3tqTbNxpfO6kFQt+2kDs6iQXIz6nb+3dNLoBlJeM6E/2WdoXI?=
 =?us-ascii?Q?u88Hwm3WunvDFRC1PAS2IUjAQiqIwcbbFyFgyhiHrqfYrhxeMFaBWzLctBU4?=
 =?us-ascii?Q?RYgFBwHqo87T1nWhjA+Fb3LAORrp9zzAMKPhaMCuw8d6Qgs8bvl6yKrkVfkm?=
 =?us-ascii?Q?KnlVeXJYm+7+d5xjUR4PTXcZ6OQXJfgAKUoZReJcFDuZeXAIJfcCqyqHtRaz?=
 =?us-ascii?Q?1umqblOtkmsShtlZmuyeLcHTKscUyxfW1GiA8+kd2/nNxtuZbWhfzrAmHmX3?=
 =?us-ascii?Q?vUrpwb9TSsm+Ii+4Nx8F9KqW274MpaXAoWXT5S80n+SmchM4EqmdA5sWVcNZ?=
 =?us-ascii?Q?flcTy9dbBmzTx/sc8tNVZ5q0xtfyNmPguVQ8B4dX4jnybjOq1mtg4SJXajh+?=
 =?us-ascii?Q?KvNBC88avA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a7e667-4dc8-4681-8a5a-08df1088815b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:18.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6lDPbIPBfpeDW23J9c/p8H+E5XjKDspsTQSKXIyDUGSOyvNuN5T8hXguuy+uhbwaekj6yYB+hf7fH5RU+TMWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GIN CPU interrupt tree differs by GPU family in two ways:

* The size of the tree. Turing through Ada implement 8 leaves, and
  Hopper and later implement 16.

* The write that rearms delivery. A message-signaled interrupt is
  delivered once per edge, and the PCI side delivers nothing more until
  the CPU rearms it. Before Hopper, MSI rearms by writing the
  end-of-interrupt register in the BAR0 mirror of PCI configuration
  space. On Hopper and later, MSI rearms by clearing and then setting
  the TOP enables of every serviced subtree, which produces a new edge.
  MSI-X rearms the same way on every family, but for the handler's own
  subtree only, since each subtree has its own table entry.

Add an interrupt HAL that provides the leaf count and the rearm method
for each family. Name the interrupt type with two variants, MSI and
MSI-X, since nova-core never allocates the level-triggered INTx that
the PCI core's type also names.

Assisted-by: LLM
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs           | 13 ++++
 drivers/gpu/nova-core/irq/hal.rs       | 90 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs | 28 ++++++++
 drivers/gpu/nova-core/irq/hal/tu102.rs | 28 ++++++++
 4 files changed, 159 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 1ec0bb055d3b..62c242b71dc8 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -9,5 +9,18 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+mod hal;
 mod interrupt_tree;
 mod regs;
+
+/// The message-signaled interrupt type that Linux granted.
+///
+/// nova-core never requests INTx, so this has no variant for it, unlike [`kernel::pci::IrqType`].
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+enum MsiType {
+    /// A single message, which every subtree raises.
+    Msi,
+
+    /// One table entry per subtree.
+    MsiX,
+}
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
new file mode 100644
index 000000000000..ede9a10ccda6
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-architecture properties of the GIN CPU interrupt tree.
+//!
+//! See "Per-architecture differences" in `Documentation/gpu/nova/core/interrupts.rst`.
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
+    regs::*,
+    MsiType, //
+};
+
+/// The register write that rearms PCI interrupt delivery after an interrupt.
+///
+/// The GPU family and the interrupt type that Linux granted select the write. See "Rearming PCI
+/// interrupt delivery" in `Documentation/gpu/nova/core/interrupts.rst`.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) enum PciIrqRearmMethod {
+    /// Writes the MSI end-of-interrupt register, `NV_XVE_CYA_2`. Pre-Hopper MSI.
+    ConfigMirrorEoi,
+
+    /// Clears and then sets the `TOP` enables of every serviced subtree. Hopper-plus MSI.
+    TopEnableCycleServiced,
+
+    /// Clears and then sets the `TOP` enable of the handler's own subtree. MSI-X.
+    TopEnableCycleSubtree,
+}
+
+impl PciIrqRearmMethod {
+    /// Rearms PCI interrupt delivery after a handler serviced `subtree`.
+    ///
+    /// `serviced` is every subtree that nova-core services, for the method that cycles them all.
+    pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree) {
+        let subtrees = match self {
+            Self::ConfigMirrorEoi => {
+                bar.write(NV_XVE_CYA_2, 0u32.into());
+                return;
+            }
+            Self::TopEnableCycleServiced => serviced,
+            Self::TopEnableCycleSubtree => SubtreeSet::from(subtree),
+        };
+
+        bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
+        );
+        bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
+        );
+    }
+}
+
+/// The properties of the GIN CPU tree that differ by GPU family.
+pub(super) trait CpuInterruptHal {
+    /// Returns the number of leaves the tree implements.
+    fn leaf_count(&self) -> LeafCount;
+
+    /// Returns the rearm method for `msi_type`.
+    fn pci_irq_rearm_method(&self, msi_type: MsiType) -> PciIrqRearmMethod;
+}
+
+/// Returns the [`CpuInterruptHal`] for `chipset`'s architecture.
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
index 000000000000..dd3d0d12d779
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
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
+/// The CPU interrupt tree properties of Hopper and Blackwell.
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
index 000000000000..121f5779accf
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
+/// The CPU interrupt tree properties of Turing, Ampere, and Ada.
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

