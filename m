Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34E369D6E
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966587; cv=fail; b=nyQoEglKmXiPTR7ddqhJsPre2rEgaoPMEfEeJrvDpaNOvpbU9zlEZHWWJUQFnth1jrY6gunr54HIDeqoTMjzCfUV49090bxuBDGwyRmRDBXp1DV5V5lQr7ne5e/WR1bMb5HeAG1LeAQ8sUxvnNralLcmPOildl70CZEqcfZVVvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966587; c=relaxed/simple;
	bh=Y9pYXxJkCbYlEc042YAi7AgL6rDsJigXtGMdc+z0ZXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ma8oXzhHkRsO20TFYzFfhYALgpCM79sWbLOqksCoGMrTv0V5xHYCvMXX6BG6KQcCufRty5r0D0mB1Lpq7rForJu7eMUHYVOxJ72BWKvSEeAf5D//Y41+LgvGaH2nJr6HpwIN1/V8Mn/X+0uOHwcImPekVu8f7zgXOPOFV8GMjQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h/b3i0lZ; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h/b3i0lZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBtoBaRhG/C1/UACt4G5sYIlmvOmVQRg+o8bm2Cm55/Kk2OUqymeOmX9zFk3Hp6cDPUURul+lP8nyG99wUPv4S4sOzQS8MZHfLXz44tiZb7s8+MThKM3Ohfbyt19T04oktuTNaiDVnY9V7G3XXfRagyh8RpUby57K/WvAbxB2fz8BUx/R1XbANF83l8WmX++g6Z3ywz1Y27G6WnfyDUZbH/ahigI61ywPCDcwO01VJRW2j5JOwwDirkNNat/CxNKTL8cgFclLjDzYYfHsDVxX7yo3NLm2jRSqd2h+GmTlyThpbssuURluXqO1DxttabKf5zXdx+W2E+jqdWaJctnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo984nfQGR/pb/88cAxFJxt4MakBkDZR+7JRFkqMggE=;
 b=otJ7ZAim54ZnKzaTK3PeLZDNjtJBj8Gf1T8WCVlWuTWtJnuCXZN4r+gBjiefdRuFfcw2P9eG/h0pmZ2g4rrokUdGOiLJsdVlpExfeUm/PHP8oxLsdaCiTabzVs2Im4KD5gSKztAftypv9aSP+GzFpdKBzXGYsMIjR7tjr4Qf+768CARXVRoCELI+0E7sEi+ms3TiK4Z7OIzmpP7WZQxAKvNi+v5e/7TB1j/qA1cjaI7FKigj8GnlgXrVUw/1x5jNUqry6bkFCrOXpzSOHbGz/HXjGOyxE9ju9TAVKgQqO1MklEV3n7G6X/dL5n2/krfYYWd4VMbemZunozfHdzOHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo984nfQGR/pb/88cAxFJxt4MakBkDZR+7JRFkqMggE=;
 b=h/b3i0lZ9ojiTyaR7Hx8Aqj5EermbN6L3btC3UR8nWZ/CI7PeoAETpoRtkkQt5qkNCJs8A22FgiYrXD5vd5g2vpmcXKAglK+qzZO4U8ptc6IIMqs3hvLmBOojGNInN8iBSEKAGdpUF8ppJXdRLxkqZCxZaFYCBg3HoXxYq1lZXLSoFPuQxtM1Ok60VjBP4spWCrRTf3ZPDueW0HULbde6r+lllgGWNgdof9kzcdkdkxh76epmB7jXy0W3Em3N7flVBzU250HaArOzEkaD5zPSLo2cyxAu/xO9ZDtIDvFGeRKjInZuQLBhwkc/doql6G23BgdnrUS8CaVVifvT3Kb2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:53 +0000
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
Subject: [PATCH v2 04/15] gpu: nova-core: add the GIN vector and subtree newtypes
Date: Fri, 28 Aug 2026 18:22:32 -0700
Message-ID: <20260829012243.496697-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb54699-f3f3-4823-92ec-08df056c0c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R7vQZPeyVaLC5l6ypguq3CwwDjBCcA8GXoO8xrgJuabLxwOckzRPQKh/HWRhqpAeMvlTy8//+AsIzkMJGHECLxc97uJpPLdYUuo7SbZYDAFlrD6cdUuLlmo8CXjeymdGLGmK0v4hHrOD+1TztX40SbNaVI5sodXPZx3SAJI86jO5JE9wfAwZd2eixaNYl6Cuf9jNuxoSWheZU2wqlQZY0qMaewUhG/gbGzT2Fn0KEXK5fdjb8OY5FJ8IgNv81yp8ncCQnDgZCloV1JDNIBZEoiMG4HSmt7BHasng018ZCWQ2u+vKTMTA3XO5ubWOQUnqXO+G1Ceij9sC2skvurDgTSXV+ZB7pgOoBQvZVgIJtCjbcOg3AGKxsYUy78DkeYQFvYmFDAqVjt7phM8D35RExTjcJHgor70LbK8DCnhqaZAmvyuCvUsclh6hHXOGd86aB4MIa+vHqoNgxA0hDlvrjHzJ+7zzjFR6OoskaIa7NIwq/+z1qkFcP7Lq8UbVC3506x7rXyRqQjoRuKAfphSeMX/2npbuHiBe76eOYaagZ8lZG/CgdCLuy63y3ro/3Yut/+/KIimOAWFb1V5egvMjXCn3WskvHOhh5phNEZ+5dH0IffiCh3Tm34iTn8t9ZZ0ZWlye2Vb0nRKYjE2fllFsh3Tja9Rlc+9tVNppjjvBi4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M0A2mLt4nFpJWmFWoeL2Zava5AKorF4wAxFQaCU1udNYc2gQMOx6fSup8AFS?=
 =?us-ascii?Q?ztrj5DIGGvC6I1B64Nq4Vde+L6u2omFdEYl2BA60It34tIq0/MjYHN4NZXUm?=
 =?us-ascii?Q?rtN9PulH9Xdii5XSzI+D0ijIiDihBSTZDtUTwIeCpEp0dOqG5/iHA3ZeQs81?=
 =?us-ascii?Q?GaJcr4ZSray63zqtsXbm7lGc6N4CJGbYPI3uqwb4yZRZkgpasEHGOGmg3rA1?=
 =?us-ascii?Q?xvEiS2RmdIqtzqHGX12W9plG8T1TJUSzF2OzE+Sc9yB4DRhaSLrXA2a1H1zW?=
 =?us-ascii?Q?IUG98FsiwDROU8oZ6oZRvdpJV2IJTFtfX8Oj+ZPX1fhYahPnCUj/ZyTdrv0W?=
 =?us-ascii?Q?IyFslPrpKaiJlxvOq+PSjHTuj/QQp36DGMFqI4D7KT35OzuItW7o7K93UnwJ?=
 =?us-ascii?Q?lmIi4BcBEEIwmcCvqLLynQGtuEINMO5AzihbReu2HEXtTJcFgGidId7yWrUm?=
 =?us-ascii?Q?we0n2cpgIobZvH4lI38Dfhw0RP1MOFnOfEe/BUypY+/GqOHczSZ57sU1Ef4D?=
 =?us-ascii?Q?tTmM4AnFE43WOb6fSNeYgnjfmeg55m+bZk9OcMcs1ch/v4l2jNOGjctle/LX?=
 =?us-ascii?Q?aKp6+FlLPYkksLySUjS1NoqpPXD57HGEG0YwwmLFgCDta9V1IwKaSRl0R44f?=
 =?us-ascii?Q?1YCB/CCDngWMSWcfS59ZU5L6gqPyjCe7zmgd/7iaGz7xACNckJu7Uay/4Cqp?=
 =?us-ascii?Q?jV0NU/0tT5KR3Hau/4zpUmyQQ4D8IEW/Ohcb2dIJDh/MNUeosvIiowj5pat4?=
 =?us-ascii?Q?UDWubzB3cKKyzbMitBqcoV9EA0/pjFT11V5mihK+H+LSiJF08lFboX2nA5SJ?=
 =?us-ascii?Q?m34vTn4roK5UTnZV9KuafWMrPYmWhtml/VX60PQB0B+ureFNpe/tlVL7eOfj?=
 =?us-ascii?Q?V9HZN0QcxdJVCXoTfYYskprZA7ykQZdnZykRG7GXbBRws1x1q54PT3kaip2F?=
 =?us-ascii?Q?Z1cvuFFi4IWpggUZJipGrpd8didkaXaC9T3Kdv/vN9w9tBoorN6fWkoCfg6z?=
 =?us-ascii?Q?X2LZ4UEixtYjXG14t7L7Z4t0NHxWRTWP+rOlQ9w2StJbKDUQxIOY7/bjpnE6?=
 =?us-ascii?Q?P9W4LXaVZIQQlnlxcuYbAM8TJxbZ7AJBGGg5OXlC9aeuWoZVlBepHiNkKU38?=
 =?us-ascii?Q?A9jBGH0869ps/ThYkLxyz0igtajVJBNOQx0ha/GG4obKPPT0AE+U+uKa4BQR?=
 =?us-ascii?Q?bgG8l2uj5+OjiPE9yHM4asjzRmHsBsKPh40VagUAfUhoYwe23vXyfEM++OV0?=
 =?us-ascii?Q?sw49Bg6ZOxp6M5RpgF7VKJ+t0c61Ktk65hCIsSZIAFTwx01CUMhePUAru9wE?=
 =?us-ascii?Q?l5WKuTTpf3dygSC7DvcvVukVtSIB9PhJJ7TNKWizWzf5T9Z3OrCD4hTfqt3g?=
 =?us-ascii?Q?mSWrF9jY1lq/XWOGxLUE/1QKCz1epv0WfljMeHZi2UmQOi60rv2Qbw2j6Hk6?=
 =?us-ascii?Q?FqYkhUPvPJCeBGQ15mNuU2trJHAgG1a/jl0w0MU0qejFCGJY8VPZSLGvIGlq?=
 =?us-ascii?Q?SRWg107Y/w6NPXY3iscXd/5AHJwOXsyjQaNDd3kEnQIAz+pMQCHbDIV4wXk4?=
 =?us-ascii?Q?+9CwvhxNKoKWMMVZZPp3iW5YGYwbRGusa0eIRRnhTCp04elsodCKfiAp8Omq?=
 =?us-ascii?Q?3kcEvpLUOsLQdRRNwQZyY34ePZbB5xDbPCv8SviKUbhXGIwE+v2+cOmupoIC?=
 =?us-ascii?Q?WmlYw5Q32fl79yitQYJ3QTuUC29ZiYQ9SKpJ/LhKAtBauucE82kl3rUHFjm4?=
 =?us-ascii?Q?oWJf8LPgNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb54699-f3f3-4823-92ec-08df056c0c1c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:52.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA6vQ2tSPi0Rat8xZk70Hh2vbQY40DwJdUHfnBI+q1ItHqgCmAp42iZbzFVk8zP3fuCmayoTXijW96tpdH9mGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

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
 drivers/gpu/nova-core/irq.rs                |   1 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 209 ++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 3 files changed, 211 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 6656a1a23d59..3066ceeb850c 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -8,4 +8,5 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
new file mode 100644
index 000000000000..da24f3d35893
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -0,0 +1,209 @@
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
+/// Index of a leaf register, bounded to the `0..16` range covered by the leaf register arrays.
+pub(super) type LeafIndex = Bounded<usize, 4>;
+
+/// Number of vectors one leaf register carries, one per bit.
+const VECTORS_PER_LEAF: u32 = 32;
+
+/// Number of leaves one subtree covers.
+const LEAVES_PER_SUBTREE: u32 = 2;
+
+/// Mask that bounds a leaf index to the leaf register arrays.
+const LEAF_INDEX_MASK: usize = LeafCount::Sixteen.into_raw() - 1;
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
+    pub(super) const fn into_raw(self) -> usize {
+        self as usize
+    }
+
+    /// Returns the number of subtrees, each of which covers two leaves.
+    pub(super) const fn subtree_count(self) -> u32 {
+        self as u32 / LEAVES_PER_SUBTREE
+    }
+
+    /// Returns the set of every subtree a tree of this size implements.
+    pub(super) const fn subtree_set(self) -> SubtreeSet {
+        SubtreeSet((1u32 << self.subtree_count()) - 1)
+    }
+
+    /// Returns the number of vectors a tree of this size carries.
+    pub(super) const fn vector_count(self) -> u32 {
+        self as u32 * VECTORS_PER_LEAF
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
+
+    /// Returns the set as the value the `TOP` enable registers take.
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+}
+
+impl From<Subtree> for SubtreeSet {
+    fn from(subtree: Subtree) -> Self {
+        Self(subtree.into_raw())
+    }
+}
+
+/// A GIN interrupt vector.
+///
+/// # Invariants
+///
+/// The vector lies within the widest tree any supported part implements.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+pub(super) struct GinVector(u32);
+
+impl GinVector {
+    /// Returns the vector numbered `VECTOR`.
+    ///
+    /// Fails at build time if `VECTOR` lies outside the widest tree any supported part
+    /// implements.
+    pub(super) const fn new<const VECTOR: u32>() -> Self {
+        build_assert!(VECTOR < LeafCount::Sixteen.vector_count());
+
+        // INVARIANT: `VECTOR` is within the widest supported tree.
+        Self(VECTOR)
+    }
+
+    /// Returns the vector number.
+    pub(super) const fn into_raw(self) -> u32 {
+        self.0
+    }
+
+    /// Returns the leaf that carries this vector.
+    pub(super) fn leaf_index(self) -> LeafIndex {
+        // By the type invariant the quotient is already below 16, so the mask changes nothing. It
+        // is what proves the bound to `from_expr`.
+        LeafIndex::from_expr(crate::num::u32_as_usize(self.0 / VECTORS_PER_LEAF) & LEAF_INDEX_MASK)
+    }
+
+    /// Returns this vector's bit within its leaf.
+    pub(super) const fn leaf_mask(self) -> LeafMask {
+        LeafMask(1 << (self.0 % VECTORS_PER_LEAF))
+    }
+
+    /// Returns the subtree that carries this vector.
+    pub(super) const fn subtree(self) -> Subtree {
+        // INVARIANT: a shift of `1` leaves exactly one bit set.
+        Subtree(1 << (self.0 / (VECTORS_PER_LEAF * LEAVES_PER_SUBTREE)))
+    }
+
+    /// Checks that this vector lies within a tree of `leaves` leaves.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if the vector lies beyond the last leaf such a tree implements.
+    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
+        if self.0 >= leaves.vector_count() {
+            return Err(EINVAL);
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 68b5abfe494d..dfd11dfe562c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+#[expect(dead_code)]
 mod irq;
 mod mctp;
 #[macro_use]
-- 
2.55.0

