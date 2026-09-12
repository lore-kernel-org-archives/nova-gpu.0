Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECB37B00E
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188267; cv=fail; b=VUgzQHQ7t/TFejcVi3cIPa3lpyr7zZDvvcG1HqZ79sQ9jqBscwM4vy0HAkb+XvfB0bK+Ib5QWMgTTR1YnthjLh9Q0v4YU9yRmKacSsTpJ+tNN1E4+tCyZ9b482eeYZEGkyFawwRTr04JYTKBENSTGLikdpa514kVx0ntZonnZtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188267; c=relaxed/simple;
	bh=+mp8ZRl04h43XtWeAqrNHsVOLkPUIp350sUE5zCJze0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PwLSsQUaEzYgCPGeUYPmYKi9A/H6oEmM8j8NdLL8bF+v8D9Uahw8fZ3DWNtHpngKzhcoMV0s9sfv0y+g74c9SNRfdrlqbBqKBbt7hOLgHkRNhBRAtpeyo4RKYx1k+Pjy4hpGDz5rnal2LP6XP5dAII+xC2gyGazbvyzbDShKNE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tP7AuieW; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tP7AuieW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6xj5NRHYFVFkqGliPgpr2f9+87yc4ktsbyQMcg+0XAB+GtHcGoy92I1De6XahJxD37518CGr7CDOtLjo3WenS9QJzETSRqrZ3q5OzZVTHKdDiLwzsrOfhPFmc0/d30x09iPOzDV2mgwWTYnZSNvn8deN4RNV/4+RMGW+zmv6qTVfYrWDNSEGHj+koGgiWKsH4SMxRn55ryGd/Jz50dFiu0E+mVZtRk35o6PpT88FdJsDnWCIwv1Bq1oMu/POhVl3JmCQiRluEZx4vxL9JCLdfd8dmGsCgPL6u5JoxdsraTJDwjDToFpqy2vxduHaBdUTKXyEqFoFGH1fFsrZ1RIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU8LWOQ81VC5ZAl1EvvDhpf1y1tsO4SubFFK1IPSW4o=;
 b=pqokwsCyYquzZqu4EqbE2gQwut7YXByKrsTVIIHMYYpe4RRWhDjWiVJ6n+knd61X4pzX2qcNSfvbgRhZfpd2bV5eU757LliGRoM2YS1MjzSRGSGlbwQB8QLvoAvWLpF1YZ7OWUSGuoriCOStgtm5pFJt1BhK0QiLaUX0hRyZ3XrG32lqP+9z9nwlVb4t3ca89akSeXSJkymuKQp1fZOQAJPkogo6+LqnML1gHmNsRh6p/VJB33PyiMI80G/iqCfdeXw6E9mQEC3AtIuBwo267qYEczkrSuG6sTEsjDI1UTQVRifFC89KuwuCez6d9C53SPR8oBwUt+Y18UszW5o5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU8LWOQ81VC5ZAl1EvvDhpf1y1tsO4SubFFK1IPSW4o=;
 b=tP7AuieWyybNA2tU4avMNzWSXB8y+dvnL4TqFemPR0gJlqCXvO+L9yTlBr+OvlJ87kjFkxT3KvBwx2g1uO/OfY5pHuqKI5HMjubKI38x/Qp51JNmiSoX2hHbD0BvRIhSthK7RBK6mo/aKENAy/Cl2ohn5zUzrRJ/gdcvd6OgMYHihujU1/UpdFZx/IDVrRQq58+xR+7d/I+FMlTg5BcYR21XNLToy0U9wdV4jBGdcgfUY40C2E35yaExRJZhEojYzFdE2P8ER8Zdnb+BBqa7WxInpastLR7YA+0t9OYuQOO31ku140h4AmnkgRpNsR03WDft9iYIDjdgVXrEErO3Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:16 +0000
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
Subject: [PATCH v4 03/17] gpu: nova-core: add the GIN vector, leaf and subtree types
Date: Fri, 11 Sep 2026 21:43:46 -0700
Message-ID: <20260912044400.677097-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe62112-8652-4baf-a3ab-08df10888005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	tzUXNGFr+c8EWigLLyzS5tyfzRY7t4VCPH1HOHNgYr874zWJvBbMnB8fwNheCghiTDXUbjWtJJGPCBKzeIesQH1ixQRMRxx4/nzoFelMKANVALFuxR0Ga0b1ZG/oWUfGTFftmhQBDy279v09l4O2rxJU7QqQ+OrivHUmYEItkrCEvh7sWJK4/CJntQhaUSZvP7J4sZaWXQED4CJDawPqB03dsMnu4szeHEfdEpm0Fhns+behCJ4zTYf2FrXAtRI3BYhDq37PhtGBejK71IV4vDc6g+eEMo2o5Rjf/dIP7gyW1hj7q7jYxS+owsT5gzyhbzqmxUYcdn/pBsale06psfYjDW/xxzcYUtVqDjbkb3QRSDpapZsL3G2A44xcN1bjSRzZXKMslT3zVIBUHBIhmORKoW0Uljl+0RqRGa/8cgqT19152OLTcT+bNn3+wDlBfgdqX45ZJWMAbAEIUPogFONfkzesU3Ura61rfAN6V/TzZZV9obbJ0cXgt5KEj4j1mIPQNdsjC0A+jBMRFzEtODI9T6m5MrzLegealUGSeFj42th7fQ+DlFIwhvb6Sf7uD+Pybj/+w3C5vANeQqm79XVf7oYtul2wk5vTtSa1NxA9FrWtbvVTARPu6xDY5htxdaE7+Th0tZHSqW2ZJ99m4+gnr+bqYUHeNOH0hyB34to=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CwYvyQlskQfPn71R6LEoM7x1VYetQV9BMhG15c5jMizMgNRnvPHT237iM+Yc?=
 =?us-ascii?Q?I4bcI1nuU37uh3hOsunl7rZszadco1NR8Sxdktzui0g8QtbABQ2JAzHlAcvl?=
 =?us-ascii?Q?lukaiBBduZWWDrM+dldAPMkc/uYGc9fLFVdrJYnIUND6n3x58cjzAlIF3jJJ?=
 =?us-ascii?Q?Tzl6oGBrNtZfSMvpIK7FldBHHcszyokv3OwS3doLfJg0F1H8WDUF6kOLi4+e?=
 =?us-ascii?Q?7qt4gMwdPJQRr2LGdealqPItCk7IOU4ojinCXrZDjgVEg3e2Xs/1uytDeB72?=
 =?us-ascii?Q?iKYzPTnp/RcXikgipYMV6oa5nvm1Eb3fILhAJ0t3yUPOdvOpZWRBktEv7Leb?=
 =?us-ascii?Q?cLQRfXkl68heFTPrsy2muX2gC3iMPOuYufmPKBZFYBezQApYsU5sMLDqiHfz?=
 =?us-ascii?Q?puiodA36GoeS4sRhrzIxRtDrkYw0hlTB9g/DSQMFXMlqY5yGpeGO7Dg+/9bV?=
 =?us-ascii?Q?IysKNsBw9pMyRqh3aCiyC+SHQ0dpTa7P/N7VYleQGGLsPrV7MEwf6PEJCk3j?=
 =?us-ascii?Q?eWHDR535DlSK6ivu4CT40gijTAp8KNymotzGRnuc4D9+BX5d8jASUMR85bvL?=
 =?us-ascii?Q?RI7ubv6Sscsfuhl6UTgeSFj53sKt9hBD89VUk5P/8NeLoJrbBav1q9B0ToGo?=
 =?us-ascii?Q?Mj23nHGqBiKMun5Xg0gj+L+54HuWIL3rBLQhmUtl6h9U1pKaLl5OHrfDnxd/?=
 =?us-ascii?Q?gY4L2zFq0MQQPA8oN/RvaPT57lFPinEbsMjHoq7kzaK9ualWkxyqpAjMgf1D?=
 =?us-ascii?Q?HM2WVLgO3jv05n+0aF3ivg+X2WSD7/3y/gpRqB4lQw6KGUQLlEfurSHhmqai?=
 =?us-ascii?Q?coCa8jvzpVTsOcJjOoAbxIeFUS2+YLeyGwaPCsvTF0B2iuXVbjDOf/Tb+szN?=
 =?us-ascii?Q?utPZ4jxPouJ2hXXFVXkYFzvU1sWLuPquF6ypK+MSMn0B0vcUq8EOVT/XVtMY?=
 =?us-ascii?Q?5bqdnVNwASePuQQcsrbWZ07hXGsmOLOwatiL02bGm7A3NvrTLJPrZ2akX9Lr?=
 =?us-ascii?Q?zmfrnwqDyDfmcZ7I13+oBB1qe5F+NDTmwpXamxPtv98tSjWILsHuL/8xIV8J?=
 =?us-ascii?Q?/XUBTJYynS/IbkPweNzb6J/IC9hF8N8rApcIFaf5fI5uy9GRxa/LS44LihdL?=
 =?us-ascii?Q?gflbK8L7Zhh6czZl02kiXOaEEX7Fiav3C1RZZz6G2nEInO61FqnL+iuhSDYD?=
 =?us-ascii?Q?HBkeJlmlmQyvSrbvmqLKFSPgKHLKaDG4P58OwZcKevgvdhSCtjBlDyOnyiG1?=
 =?us-ascii?Q?DU54PgSKWDklt0ZebBiEKtby+nU9+3kHnWbV2rYSFYoNWAPDEiJsJadbKYKS?=
 =?us-ascii?Q?UGZGWYmm54wxFF5DKnX9LzZ1edyEvZ3tdZBW5xfHpBpljlKrFeHgzfZNtTRy?=
 =?us-ascii?Q?8DTWbMPaICXZxktKS74zzXeIrNrVOaHvnkDXF6EaqUl5A1zvoVSyeiWZg4I7?=
 =?us-ascii?Q?2BbT1q4TpEB0qAKzEOAoryTjA6YamLUhFQh7Msn0ir6ZK0qnSj2xxtTkyqQH?=
 =?us-ascii?Q?GtYdiNGUM01rDdvrtUNyHgc9es3mSjwSPDPgcSRjPAgvPyf1/R8e2vEj5NhZ?=
 =?us-ascii?Q?/VJiHgASfm0RFK2K7ftlPQSgFeXsGPLT/pBa/9p5qREk5Kjt8tIUIXt0bE22?=
 =?us-ascii?Q?edQdj1cOq48KahesHN6Ep5nKUKlSN4rV0gN9he0Ymz/Fuu3ZQ8Vb+tcD0wke?=
 =?us-ascii?Q?PeusEUNMBX2+QSopVbsnkJYp5Da6jzPlaaSbc/sDjejZhE0v70+BPpe2q3/O?=
 =?us-ascii?Q?2waG9MskcA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe62112-8652-4baf-a3ab-08df10888005
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:16.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UinGMVJupliC8RoSbuvp3wO91/HKWrdolL8b8MeXol3XB8G4IwRwXf4NbXiuxatEiEQ4CATpCS1vVcgfyFSAaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
controller. Each interrupt source has a GIN vector number, and the
controller latches a pending vector in a two-level tree: one bit of a
LEAF register, summarized two leaves at a time by one bit of the TOP
register. A vector's number fixes its position in that tree:

    leaf    = vector / 32
    bit     = vector % 32
    subtree = leaf / 2

A tree implements either 8 or 16 leaves, depending on the GPU family.
The leaf count sets both the number of subtrees and the highest vector
the tree carries.

Without distinct types, a vector, a leaf index, a set of vectors within
one leaf, a subtree and a set of subtrees are all plain integers.
Nothing stops a caller from passing one where another belongs, or a
register field from accepting the wrong one.

Add a type for each of those, and for the leaf count. A vector converts
to its own leaf, bit and subtree. Its constructor rejects, at build
time, a number beyond the widest supported tree, and a validation
method rejects, at run time, a number beyond the leaves that the
current tree implements. A leaf count yields the set of subtrees it
implements.

Nothing uses the module yet. The following patches declare the tree
registers and the tree itself in terms of these types.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  12 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 238 ++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs          |   2 +
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
new file mode 100644
index 000000000000..f1323f633a03
--- /dev/null
+++ b/drivers/gpu/nova-core/irq.rs
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GPU interrupt support.
+//!
+//! GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt controller. It latches
+//! every interrupt source in a two-level register tree and delivers the tree to the CPU as a
+//! message-signaled PCI interrupt.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+mod interrupt_tree;
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
new file mode 100644
index 000000000000..24976a3146be
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Vector addressing in the GIN CPU interrupt tree.
+//!
+//! A [`GinVector`] names an interrupt source, a [`LeafIndex`] the leaf register that latches it,
+//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] one `TOP` bit. The types
+//! keep the four from being confused with one another.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+use kernel::{
+    num::Bounded,
+    prelude::*, //
+};
+
+use crate::num;
+
+/// Number of vectors one leaf register carries, one per bit.
+const VECTORS_PER_LEAF: u32 = u32::BITS;
+
+/// Number of leaves one subtree covers.
+const LEAVES_PER_SUBTREE: u32 = 2;
+
+/// Number of subtrees the widest supported tree implements.
+const MAX_NUM_SUBTREES: u32 = 8;
+
+/// Number of leaves the widest supported tree implements.
+const MAX_NUM_LEAVES: u32 = MAX_NUM_SUBTREES * LEAVES_PER_SUBTREE;
+
+/// Number of bits needed to address every vector in the widest supported tree.
+const VECTOR_BITS: u32 = (MAX_NUM_LEAVES * VECTORS_PER_LEAF).ilog2();
+
+/// Index of a leaf register within the widest supported tree. An 8-leaf tree implements only the
+/// lower half of the range.
+pub(super) type LeafIndex = Bounded<usize, { MAX_NUM_LEAVES.ilog2() }>;
+
+/// Number of leaves a tree implements.
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
+    pub(super) const fn into_u32(self) -> u32 {
+        // CAST: both discriminants are 16 or below.
+        self as u32
+    }
+
+    pub(super) const fn into_raw(self) -> usize {
+        num::u32_as_usize(self.into_u32())
+    }
+
+    /// Returns the number of subtrees a tree of this size implements.
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
+// `VECTOR_BITS` and `LeafCount::Sixteen` are written separately. This assert keeps them in
+// agreement about the widest supported tree.
+static_assert!(1 << VECTOR_BITS == LeafCount::Sixteen.vector_count());
+
+/// Set of vectors within one leaf, one bit per vector.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct LeafMask(u32);
+
+impl LeafMask {
+    /// Returns the mask with every vector set.
+    pub(super) const fn all() -> Self {
+        Self(u32::MAX)
+    }
+
+    pub(super) const fn from_raw(raw: u32) -> Self {
+        Self(raw)
+    }
+
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+
+    pub(super) const fn is_empty(self) -> bool {
+        self.0 == 0
+    }
+
+    /// Returns whether every vector in `other` is also in this mask.
+    pub(super) const fn contains(self, other: Self) -> bool {
+        self.0 & other.0 == other.0
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
+/// One subtree, held as the `TOP` bit that covers it.
+///
+/// # Invariants
+///
+/// Exactly one bit is set.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct Subtree(u32);
+
+impl Subtree {
+    /// Returns the subtree at index `idx`.
+    const fn new(idx: u32) -> Self {
+        // INVARIANT: shifting `1` left leaves exactly one bit set.
+        Self(1 << idx)
+    }
+
+    /// Returns this subtree's index within the tree.
+    pub(super) const fn index(self) -> u32 {
+        self.0.trailing_zeros()
+    }
+
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+}
+
+/// Set of subtrees, one bit per subtree, in the layout of the `TOP` registers.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct SubtreeSet(u32);
+
+impl SubtreeSet {
+    pub(super) const fn contains(self, subtree: Subtree) -> bool {
+        self.0 & subtree.into_raw() != 0
+    }
+
+    pub(super) const fn is_empty(self) -> bool {
+        self.0 == 0
+    }
+
+    pub(super) const fn intersection(self, other: Self) -> Self {
+        Self(self.0 & other.0)
+    }
+
+    /// Returns one more than the highest index in this set, or `0` for an empty set. An MSI-X
+    /// allocation that covers the set needs this many entries.
+    pub(super) const fn span(self) -> u32 {
+        u32::BITS - self.0.leading_zeros()
+    }
+
+    /// Returns the subtrees of this set, lowest index first.
+    #[expect(dead_code)]
+    pub(super) fn iter(self) -> impl Iterator<Item = Subtree> {
+        (0..u32::BITS)
+            .map(Subtree::new)
+            .filter(move |subtree| self.contains(*subtree))
+    }
+}
+
+impl From<Subtree> for SubtreeSet {
+    fn from(subtree: Subtree) -> Self {
+        Self(subtree.into_raw())
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
+/// A GIN interrupt vector, bounded to the widest tree any supported part implements.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct GinVector(Bounded<u32, VECTOR_BITS>);
+
+impl GinVector {
+    /// Returns vector number `VECTOR`.
+    ///
+    /// Fails to compile if `VECTOR` is beyond the widest supported tree.
+    pub(super) const fn new<const VECTOR: u32>() -> Self {
+        Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
+    }
+
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0.get()
+    }
+
+    /// Returns this vector's leaf.
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
+    /// Returns this vector's subtree.
+    pub(super) const fn subtree(self) -> Subtree {
+        Subtree::new(self.0.get() / (VECTORS_PER_LEAF * LEAVES_PER_SUBTREE))
+    }
+
+    /// Checks that a tree with `leaves` leaves implements this vector.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if it does not.
+    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
+        if self.0.get() >= leaves.vector_count() {
+            return Err(EINVAL);
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..5176a5fe2da2 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,8 @@
 mod fsp;
 mod gpu;
 mod gsp;
+#[expect(dead_code)]
+mod irq;
 mod mctp;
 mod mm;
 #[macro_use]
-- 
2.55.0

