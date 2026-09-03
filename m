Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47412360EC5
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405332; cv=fail; b=scPisbjjyql2rPDg+tOCcDW7GsMdJP8XlkI7JXpR1pAzPorpqrrFfCouzaNXV2poaB56kZ2Q2FoTeFItgBDjtMYX1Cn7DoqOl2sushdvPwCbaxbgvGbQQIaTDmX+n9gRc49CFMwTdzl382BKs+IpNCMfQtut0CJpBbb6UY8TiJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405332; c=relaxed/simple;
	bh=TMCtK3bhy6CDfQh/0VCfVadB3nSflrRkl6GD9Y9iFng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KHpfE3K71y04g0pdnIdJg9rVl3/F7SWj+Ikn5/InwLtQn3lGeXWd4rLVa156Jyn5vuReFtaPgINvcFDnYPlQfA5xH+6L7E+3lEo3JcQiJjSzERVHYXoa1QAjPZiacagsfCWi5G1vcvod5jAQXIEP0Q/2ALP04d/ugN5Shfq5OF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CmqxuXKw; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CmqxuXKw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc3pnxavs4xuIV4nzr173vNKGfHfHSBwHLiOS5nwLIxWyN9XaclWtZ6BbWTgkEFbg6NNshdBGFvc6M7KFyqyGvcWzacDJ01gEdITP6OZV3ygG0TACBZfqXE2urr+dPScCJ/Na/qvtMgAEGWO3aZmmHXxdT3lNmELuQ4jJE5gp2MovrGeznlJHFaLGl7N69lVHGKqcPVSoSdqS3nOpaq5LEa3iAXTHKmPMmPEvFFRUsTw7mEA7QeYsfqQVLXBkCmRj6h7Fly/xe3/S0c005Iv6msJYMcXn9NFU/HCatHYzV74j3C4qN0ANqepBGk55+1GnUp+ZGaxpUJZlSAm2zvkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRcAed072HK8PIwEgS6Atlmjfvm0yhBIa95GgSyYudA=;
 b=nGYB1K7ldoUSShW3P9e14w5CXTcJpTOBRH+bgyxpYE81SUIO2mpDjpeS5lm1PhSpkqrEAPKSukjXDbOVOnNHCj7KipaxXKKTzkMsAoXbfqEIZqJ4fzBTc3JE4M9FhxAJ/xEhOByZuIH9O85qLfeclR+phAoQ3Nj3BgmdEa88GJ3hcZ2R5y6j2lzFz+tIrBXpQZ1fa2wNagvjsWhEuPsO3cu8Jg5b6i1ELZMV0jv4apaHxes6ezCgol/6833V2mQvbB7WjuU3G6tf9lhA8HO6R3MDYOpruFZVdXNuwerwNW6DDm7obmeRPPzHlAExrVNqIicl2q3qBuuzQdcC99BQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRcAed072HK8PIwEgS6Atlmjfvm0yhBIa95GgSyYudA=;
 b=CmqxuXKwyaVSyQ4ocMfsLZ5hnozp/wDO+JuxCFG2NWfMMDZm41iippFr0SD1wn37FqY2KOSuefd1HpzLeEDdeWaDZtNEPteftvcOlNQ+Ut/xUbNpEaUZ7SLJmVYer1E5zEDfwBeZgC/YWKouuxrCh/ax9GDIVoJtkGt0RtkUvk0oU/eDw9w+h95pVcGCpzH+suHq/vmcNkweaP/wchz5A9DAuLs56dIKHLFB8tRl32qg7e4QMWz+Sp14Ur1TeIr615jlVf6Wi6Le76zfKjQpv85QHmX49lbuo0FLgLt0XRLied5Ui2k4rloAx88t3Bctd/D7Rhk8ABGISmnMGChHdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:22 +0000
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 03/14] gpu: nova-core: add the GIN vector and subtree newtypes
Date: Wed,  2 Sep 2026 20:15:02 -0700
Message-ID: <20260903031514.1515905-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 37db1177-4471-4e2e-5ca0-08df096996df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	775EZc+kBbqNCmL9XjBZBuvrzULd6lir9bvk89O+u+nMQgl77VBe94kNO2umVlCgyO+RqXTZWxqeLo+EOdqx3YaEGW1j9x5UQ2JullT/uXqJVYZ5zeW09rleV0gVOUElMDf/URSc0qAx8/ix9ikthObrAmZ4pl7bnHkvc1ZLRtgyQrRqRno6O7e2aPp8s/GJKYdnQ8avCT98nfCbdsMDv8nUcyZNlJnGOOErbjAwSVP3kIYnBAjU3pJk3ie7ejVueFtDa5Cp05d1SGePTnaT4XoZoBfc/70K9FE2iniF2qcSoZ3YIXEOHz0I7uyROmlGUTnfpJEIlY5wLV3UhwPeld7Ss8rlNI7x4K+gpAv2pxGXPwLkZP5ONJ7A6g6Qmol8qliiYmtglEwnIPymr9EJJzNyrmEZBreezhcaxZYwlkOz6NXMPAhDdDjkq0M7SpHhhQOo7Hot1BShi0+wIBtqkdMDVLx5ugk+ZIZ4aP9Dt7eKBD4/Qg7bMwhVO5UcPatej+xF/ovw4QGfZ/N6bzXChPLtuY8X7eHakeln48WpH546PmpxppUFAKmitD10N3ZhnLfiaYcD77KBgekKzQob96/MdbQwNc+Kc5Zw631SVZOHg/fVPFFLYPOxgd7LxLFNEDwVd7Td5EOb0DrJJr0c/w6hlyI4IuyWvqsW+AKPEo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k25R72raHA7WfxTVChhvMIgsrM/xZc4jZU3B0z1CpOjSpIdW3Wwn3nGF0it9?=
 =?us-ascii?Q?dEBt2hmVdk7EkfDLIRclEBs5IR3ZGJ0UaZHLZni9o/7dU+iO+noCgLG76b6j?=
 =?us-ascii?Q?yiPoGUh+VFble/ulMjpIjxNm6djRVoaBIIpqW0Be0a7DOOfZ4X5ZIg3ASyLe?=
 =?us-ascii?Q?U/0PjF3DXFxWpnajKZ+MHrNRdrcBt3cdBCul0LWTf2gmmEDOHtRoWRDN+olt?=
 =?us-ascii?Q?3mSvzf+T1sLg9QWX/ExTZ1pKNLip21ZKFUDlPV6BYNOOJXBBeeQMVZxqFsV8?=
 =?us-ascii?Q?mLh8tICfsQR9UQ5NWZFomG3XU2pFS/bdtLBqLr1lk+qSb74MWx/GBR2hpTq8?=
 =?us-ascii?Q?Z4bkKod+aG8esNqg8faRgkGzdD0I0HZ8FZ+RLz0+5tzOB3Tm3MV8ucZBHsv7?=
 =?us-ascii?Q?7Z11RfVb2cdjIbH8x9NAAet/UTCmx/K5tsnrJPLo3TV9bnycr2Gb1Dpv4iGy?=
 =?us-ascii?Q?aoICmzyNVYxjAm1ANloarXeRAJYYMryVuf04BP78Y3BK/+OMkR3Ay3aANL50?=
 =?us-ascii?Q?kx9c3k1sCVdvcpqCDKyAv372+2ku+HvvXHsCKxmorXsXvZ1CZEGjHUpOUOwN?=
 =?us-ascii?Q?Cm9hMou0h4oSHisKScCuKR9dQPZLaTW56rRTMsbFuoAw288pNl4bOUOB7BDa?=
 =?us-ascii?Q?nzu91g5EEpMBzPOpeIfCP0l3lH15QARIVfkT5xgjusCgHr08lTjEQO94xZsv?=
 =?us-ascii?Q?BDmIjCmhhWuSi3XVW4c2whWAPNutgR8lK7ysP7OMNQhfyk0Ix+OUadiQDXN/?=
 =?us-ascii?Q?iVxDTYLrZoV0jZ6VPR4ciugA8Hz5tWza2tEJGhq18J65r7QVuS3oOJXcSUQO?=
 =?us-ascii?Q?1i1MVzMnpcBOfD6EkAP7EvlbBpMxE5K4CU5G0qAVM9dBb0UEnx29VRQ5VB5p?=
 =?us-ascii?Q?G7g+nz9gBXGajoTpezTNDCfpPDBZO3pPDfqTzRdbpq767Q6KrP0ECnj0dEGL?=
 =?us-ascii?Q?nEbLhfPBYBYRIAd8FrfMl7OfdRll9KPktyjIBJPh9G2YaqjxbPshdleN0ZY6?=
 =?us-ascii?Q?mMTzYwpxHMb9kj1okoznFlYo3girgIvMfygumHOqqqOgCCtRhZdv7pI40Xuy?=
 =?us-ascii?Q?f67BJwZdS463fy0pviEbINVX7vAj+AcsHQwI960xEwE2OPP8doO7D1gGL65L?=
 =?us-ascii?Q?Q6XXq8/pLVrQBWB+j1zLx07/LWC/BwCEA0mJzABOw8V8hfkS6IRpRu9b/iPb?=
 =?us-ascii?Q?3qR8McnFt6wkvxYylzyc3cYfxHKFmtX1+loxmPgosAeaDtfbhOzzWPmVh7ZP?=
 =?us-ascii?Q?kPUIvuVbiTKf1TLo+zLHkF2QKOhR8k3k9P0NFIplifpyYeTee9lIcT9HqAJW?=
 =?us-ascii?Q?ot7VbIeqGbSYipmG3OFV92aPDZ19ypzB7Fq4VIPGW1uuQSm6A5N7ANSGJg0Z?=
 =?us-ascii?Q?932H5y/EhXnC1iSly9kbyOO5cnVnCSe8/h9/9D7B0/GnLLqT2rsTY5Ak03uU?=
 =?us-ascii?Q?ednGUZc+z93SN4vJwGS9Zw7+aUw9pD7DOqegx/PxIi4mpyLRiXEZ+Or5me+z?=
 =?us-ascii?Q?60aQPayh5RPBWMzDbLWvFCN4lPfw2vK5WD2f9GENrRpuy2vc8rNfjAn2cud9?=
 =?us-ascii?Q?NB4AldOogRdBWBPOom+AF935si7XnOyxwcbzfd9aWLPIPfw40zkVGieZoZAS?=
 =?us-ascii?Q?PVJ1A6iYf8zGFkGasRzMnPmCmWnB9g0tURy8mKdBxFFkjtM+ji2/spfPiV5P?=
 =?us-ascii?Q?eU2qyPFQ1wv0YPsZK3h62qxBfOt4YfT6Fa07k94s+xORlAn83Ie+ewFMHej4?=
 =?us-ascii?Q?YgD0accvkA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37db1177-4471-4e2e-5ca0-08df096996df
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:21.8446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbRPgvXLhzwkK0OV1ztp3QMjPl1VJlHX+oDn7zjv5ZQY4mTCxaJcNasnXSWwd2BHV/rPU288dvw7QjwA34NKbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

A GIN vector's number fixes its position in the interrupt tree: it
latches in leaf vector / 32 at bit vector % 32, in subtree vector / 64.
A tree implements either 8 or 16 leaves, which sets both its subtree
count and its highest usable vector.

Each of those is a bare bit pattern, so a leaf mask and a TOP bit are
interchangeable to the compiler.

Add a type for each: a vector, a leaf index, a set of vectors within one
leaf, one subtree, a set of subtrees, and a leaf count. A vector
converts to its own leaf, bit and subtree. A leaf count yields the
subtree set it implements.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  11 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 242 ++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs          |   2 +
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
new file mode 100644
index 000000000000..f27952ff747b
--- /dev/null
+++ b/drivers/gpu/nova-core/irq.rs
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GPU interrupt support.
+//!
+//! GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt controller: a two-level
+//! tree of pending and enable registers, one tree per PCIe function.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+mod interrupt_tree;
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
new file mode 100644
index 000000000000..5aa447cf0ec4
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Vector addressing in the GIN CPU interrupt tree.
+//!
+//! A vector's number fixes where it latches: leaf `vector / 32` at bit `vector % 32`, and that
+//! leaf belongs to subtree `vector / 64`. The types here keep those three views apart, so a leaf
+//! index, a set of vectors within one leaf, and a `TOP` bit cannot stand in for one another.
+
+use kernel::{
+    num::Bounded,
+    prelude::*, //
+};
+
+use crate::num;
+
+/// Number of bits a leaf index occupies, covering the `0..16` leaf register arrays.
+const LEAF_INDEX_BITS: u32 = 4;
+
+/// Index of a leaf register, bounded to the `0..16` range covered by the leaf register arrays.
+pub(super) type LeafIndex = Bounded<usize, LEAF_INDEX_BITS>;
+
+/// Number of vectors one leaf register carries, one per bit.
+const VECTORS_PER_LEAF: u32 = 32;
+
+/// Number of leaves one subtree covers.
+const LEAVES_PER_SUBTREE: u32 = 2;
+
+/// Number of bits that address any vector the widest supported tree carries.
+const VECTOR_BITS: u32 = 9;
+
+const _: () = assert!(1 << VECTOR_BITS == LeafCount::Sixteen.vector_count());
+
+/// Width of the vector field in the leaf trigger register.
+const TRIGGER_VECTOR_BITS: u32 = 12;
+
+/// Number of leaves a tree implements.
+///
+/// Every supported part implements one of these two counts, and the interrupt HAL names the one
+/// its architecture uses.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+#[repr(usize)]
+pub(super) enum LeafCount {
+    /// Turing through Ada.
+    Eight = 8,
+
+    /// Hopper and later.
+    Sixteen = 16,
+}
+
+impl LeafCount {
+    /// Returns the number of leaves.
+    pub(super) const fn into_u32(self) -> u32 {
+        // CAST: both discriminants are 16 or below.
+        self as u32
+    }
+
+    /// Returns the number of leaves, in the type that indexes the leaf register arrays.
+    pub(super) const fn into_raw(self) -> usize {
+        num::u32_as_usize(self.into_u32())
+    }
+
+    /// Returns the number of subtrees, each of which covers two leaves.
+    pub(super) const fn subtree_count(self) -> u32 {
+        self.into_u32() / LEAVES_PER_SUBTREE
+    }
+
+    /// Returns the set of every subtree a tree of this size implements.
+    pub(super) const fn subtree_set(self) -> SubtreeSet {
+        SubtreeSet((1u32 << self.subtree_count()) - 1)
+    }
+
+    /// Returns the number of vectors a tree of this size carries.
+    pub(super) const fn vector_count(self) -> u32 {
+        self.into_u32() * VECTORS_PER_LEAF
+    }
+}
+
+/// Set of vectors within one leaf, one bit per vector.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct LeafMask(u32);
+
+impl LeafMask {
+    /// Returns the mask with every vector of the leaf set.
+    pub(super) const fn all() -> Self {
+        Self(u32::MAX)
+    }
+
+    /// Returns the mask holding the vectors set in `raw`.
+    pub(super) const fn from_raw(raw: u32) -> Self {
+        Self(raw)
+    }
+
+    /// Returns the mask as the value the leaf registers take.
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+
+    /// Returns whether no vector is set.
+    pub(super) const fn is_empty(self) -> bool {
+        self.0 == 0
+    }
+
+    /// Returns whether every vector set in `other` is also set here.
+    pub(super) const fn contains(self, other: Self) -> bool {
+        self.0 & other.0 == other.0
+    }
+}
+
+/// One subtree, named by its `TOP` bit.
+///
+/// # Invariants
+///
+/// Exactly one bit is set.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct Subtree(u32);
+
+impl Subtree {
+    /// Returns this subtree's index within the tree.
+    ///
+    /// Under MSI-X this is also the index of the allocated entry the subtree raises.
+    pub(super) const fn index(self) -> u32 {
+        self.0.trailing_zeros()
+    }
+
+    /// Returns the subtree as the value the `TOP` enable registers take.
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+}
+
+/// Set of subtrees, one bit per subtree, in the layout the `TOP` enable registers take.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct SubtreeSet(u32);
+
+impl SubtreeSet {
+    /// Returns whether `subtree` belongs to this set.
+    pub(super) const fn contains(self, subtree: Subtree) -> bool {
+        self.0 & subtree.into_raw() != 0
+    }
+
+    /// Returns whether the set holds no subtree.
+    pub(super) const fn is_empty(self) -> bool {
+        self.0 == 0
+    }
+
+    /// Returns the subtrees present in both sets.
+    pub(super) const fn intersection(self, other: Self) -> Self {
+        Self(self.0 & other.0)
+    }
+
+    /// Returns the number of subtrees counted from subtree `0` through the highest one in this
+    /// set, which is `0` for an empty set.
+    pub(super) const fn span(self) -> u32 {
+        u32::BITS - self.0.leading_zeros()
+    }
+}
+
+impl From<Subtree> for SubtreeSet {
+    fn from(subtree: Subtree) -> Self {
+        Self(subtree.into_raw())
+    }
+}
+
+/// A GIN interrupt vector, bounded to the widest tree any supported part implements.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct GinVector(Bounded<u32, VECTOR_BITS>);
+
+impl GinVector {
+    /// Returns the vector numbered `VECTOR`.
+    ///
+    /// Fails at build time if `VECTOR` lies outside the widest tree any supported part
+    /// implements.
+    pub(super) const fn new<const VECTOR: u32>() -> Self {
+        Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
+    }
+
+    /// Returns the vector number.
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0.get()
+    }
+
+    /// Returns the leaf that carries this vector.
+    pub(super) fn leaf_index(self) -> LeafIndex {
+        // CALC: `self.0 / VECTORS_PER_LEAF`.
+        self.0.shr::<{ VECTORS_PER_LEAF.ilog2() }, _>().cast()
+    }
+
+    /// Returns this vector's bit within its leaf.
+    pub(super) const fn leaf_mask(self) -> LeafMask {
+        LeafMask(1 << (self.0.get() % VECTORS_PER_LEAF))
+    }
+
+    /// Returns the subtree that carries this vector.
+    pub(super) const fn subtree(self) -> Subtree {
+        // INVARIANT: a shift of `1` leaves exactly one bit set.
+        Subtree(1 << (self.0.get() / (VECTORS_PER_LEAF * LEAVES_PER_SUBTREE)))
+    }
+
+    /// Checks that this vector lies within a tree of `leaves` leaves.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if the vector lies beyond the last leaf such a tree implements.
+    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
+        if self.0.get() >= leaves.vector_count() {
+            return Err(EINVAL);
+        }
+
+        Ok(())
+    }
+}
+
+impl From<Bounded<u32, 32>> for LeafMask {
+    fn from(vectors: Bounded<u32, 32>) -> Self {
+        Self(vectors.get())
+    }
+}
+
+impl From<LeafMask> for Bounded<u32, 32> {
+    fn from(vectors: LeafMask) -> Self {
+        vectors.0.into()
+    }
+}
+
+impl From<Bounded<u32, 32>> for SubtreeSet {
+    fn from(subtrees: Bounded<u32, 32>) -> Self {
+        Self(subtrees.get())
+    }
+}
+
+impl From<SubtreeSet> for Bounded<u32, 32> {
+    fn from(subtrees: SubtreeSet) -> Self {
+        subtrees.0.into()
+    }
+}
+
+impl From<GinVector> for Bounded<u32, TRIGGER_VECTOR_BITS> {
+    fn from(vector: GinVector) -> Self {
+        vector.0.extend()
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..dfd11dfe562c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,8 @@
 mod fsp;
 mod gpu;
 mod gsp;
+#[expect(dead_code)]
+mod irq;
 mod mctp;
 #[macro_use]
 mod num;
-- 
2.55.0

