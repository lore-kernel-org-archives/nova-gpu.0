Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFB3815D8
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739795; cv=fail; b=LwKp/F6vp3dR5rP/gZyiZyfbn6KrRzC9Nx75uCTPuJF6DCtumhI+m2g9g5j2Yn+qcWl3SP0xcf8kOHDqhM6AkTjaU4STRl8GceIjzljArvlPUmnvXE5Up97K8oTWRDTFPtWk4PcTYnA5ivwjaYwA66dqM05OtrwnzY/2qbvBeNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739795; c=relaxed/simple;
	bh=u8Eir1BSZBSWu/deF06yKDypVIrGd7EbBlGDtJDxuEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rJserDmCfhIuIlBJ6+LY77kPNipgIo8DOlZxNGlpCjPwtuQwHR7NYIO78ByvepEfhI62XSvqpuUJS6wiInemhiLq022FdX3tT6+0uSubjY62kejiL2JphNFpkv8e5/jzpjI6Rcia7kt2+fmn4Fo3URlPGzao/ZYS0JHymKFwy7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nqFyywEG; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nqFyywEG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK6u8fV15NJtBjGwldKadsjJo+9u24MDv4NJk+HSD0d3ak7okmWA/6j8mlzOlbq3oEBunuVlgcy6t4FdCck64mFt3el4RuPDdyGM7qtBUoV6brg+0sTsYnM0G1znzpwgf75Ky0nmj3n2DA88DxNCPVfAx6qrsCtHPz8X4kMmv6hinq3mF6FRZ/Nr/SoX0V7H8mMGEDaJU9Htqmg+w4uT1/B39WEpvYazSywkaGdToWqxhqDjNRdOc6WLFJrrX3g5s7JVpcEN1zRKpmL0p5S113iM0S4A5HNXA9ckbz+8e9dgzmEUVYVOW0tlHgZ3+9dxG2RLxfHiC+TXrDJGoNMaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LHFaBseORITmWpcVLnDveaGrc21ORrvUOoPIQCVxj8=;
 b=wufVisfDW92tZ69mnL2LEPxTjtkdnXmdF/dQcZW3+dLJ5Jzv94kVNYkHqzZCDwcO3Pr/Bajvq5gdVBhRDS7+6XinxbrkdKxEqqN9jVZAXRGXN1FUgdNyMK2SLi0A9Vbd7nDlygCr/CbDvBrYDTVpmr3bz774vd733DdrmkfuW08cShCN0kleyOfnRmD14WAHEfCeMDhX8XZunRFYnZ8DhWfBHFnpMp5PRvyVqhcFr9DHYUDmXQyqcpAxbm1QibWZ+RMwMSAXLpQfeXhT4BLa+WQrK7K0qsaF9rxKFxagkxEXFnFaBU8hugiWWWwav5gZRyh1pfktxbb4/aaWd2AYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LHFaBseORITmWpcVLnDveaGrc21ORrvUOoPIQCVxj8=;
 b=nqFyywEG3fVGe1+cLg5BSaTg1HvoBVBB38UbesTyWUMsO4lBv2y0eQWjjT36M7OZsGEp7+6JQppJ4JmUNGoZjsMyrDonRp1CWQP0w+nrkKNz6hVeQx5k64k5p+ei8pK0gfJpYsXy6CqiCyRnUqtrjPCX0ewx3aVo3SmUI/OW9xGGbLty9pev3GReJjRl7X5gdrE9sL4g7qidNzcBv6jAcE3SGdd2AhZ0ZD3MLdPVlKB+zHQ9hD/+g+ZWpSRszjR5DsjrdUf6PwhtyyozC4H3xnXN3/44rayr1P7/M7WIWhXAf/iUoTzqdr9/g9hOpm+6IttTg+KbrhlDdGdixGAEgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:11 +0000
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
Subject: [PATCH v5 03/15] gpu: nova-core: add the GIN vector, leaf and subtree types
Date: Tue, 29 Sep 2026 20:41:36 -0700
Message-ID: <20260930034148.590687-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 515f8086-df2d-4c41-e7a8-08df1ea4cf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9bwakWAx+7ED4UMSuVpNIcSIQOWzicQ/KQaLS3Dl24mpKmOwDn2L+8v1LyId2UnC36COPXGgYo+NpFx3UZpjBTSVZh5dnBcFbhXYTryE8cH8p3MoCUFmJRRY4K49GhlHkoHfomoPte7qrj2i0IuaRrfjDJwhqAlkREHtZ9tsqddVJOwUVh1yuWPn3mjL3afcqHumX3l1jUExrAjotHayoHeo+fXRv1HWClfqaQjLhhaItoLC+5iEV8pH2DJagrIZpdeSxufj0jegw+t6iiiFQFAY7SgUeQI9CP4X3NRm2OMMhitB/7bYrTVOykFoAeYrv9kidebQSsckG6cOC0In/8jvEM4acum6lEUV2dLkGZaAC5uUv41D9AfAovqkpmOREjhUX6xeCsq9G85/u7S9IzLG7zsCRQsxRbKNyiyc3v2yq7shRntZBiOwVG+UMueqFyAfhqACiPzxpWXhtFZseu9Qe+4PvY8aifxk2XmpvBK64DpeMp8PEnlzhJdC96pntJgqqmWQX0JK2uCtxOZNRRsyJL6MzXxIBUMBiU9qbk60K+DRTp+wTu9YW4vJ6IktCx3py8MpMC+qK9PBOWJf2vRFS/dRd7V8wpOv5W7NtIz2KViVDTR8OB87SwJ/r0buzaBnJNN+VfjOeb87T8z92ZV96sP0QEUoASy4s1YenHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/QLQpVot40RuY07HoZRYkaveZPgx89V9PO04ugWAKIZ4Q6s5lDJCNVbIE+zC?=
 =?us-ascii?Q?Qp2B3JR1cmAC6Wp8XEhGmKtCf9RDfwNaU7daBtEeVRa9mPDWsyYxrTCpfSgc?=
 =?us-ascii?Q?KGZZRCeYEgi9IFtiPPHdrLyE0Ez7/zqRtTs00q5/yy+21K/zv4mvSwKGlgEj?=
 =?us-ascii?Q?2BTY3BOqCYK+0Iap3CuoCfR3xQ7LZjqqZoGu83eR7v0So7EwS555FeAmTMdL?=
 =?us-ascii?Q?OKLgYGikFpQKtaopYSNXbVtlSaz58WyPMNcU1IfbodWNSe1jpYEbzkzWFsIx?=
 =?us-ascii?Q?JKauWIpae8KtOabGBrMav8UaVNslzUAjKehPSd2A7KSoTELUzvLyWB0cuU0O?=
 =?us-ascii?Q?tYiyfPT0wy2n/Vl6820CWtTB+DnSzmCqigQr+AnxzMfc3C4pwjO8MyEeU0jR?=
 =?us-ascii?Q?dOZpBDa0REWvclRLGyD7EGnsmXgtT77VopBsW/yiYeJezxrXxXpAt37w9nRd?=
 =?us-ascii?Q?kmjotCcuA3Ov7XFojzKMjRQwR8nFmXqmJ2y4NdIFD1PzOEGr8BukJ4GVqAY3?=
 =?us-ascii?Q?w/5Ie5iCeJoGrZmQF9LhMz3U1qC24HvYVHJoOaxK3t7/+V74hyZGjdU9jwXs?=
 =?us-ascii?Q?phwtq4Sl/F67l0ROQVak0TN1ISniAvXGR9+u9fO0qhEVHOmCjFGFCQGYY/Dt?=
 =?us-ascii?Q?trDJLsEN4twvYPZxldn90VyYdpHUMRgCs/lUvmYy2Rgm96oURT7ORnQogoKi?=
 =?us-ascii?Q?6NWgWk+Nui+m6HUWFsgz7l/lT9ApoiZdYlpQu4wx37uHM9USwefftAdrnpun?=
 =?us-ascii?Q?F5KcGjBk1J0rEuEszEcDQ65nK0/Puk/Wy2n2U1k2BgwsnzDsJIryBf6I5fF1?=
 =?us-ascii?Q?GFf7/OWDzXnIlKoqHBiL3zLukMGZfYky1uOGoVha0YtlK0nWDHynsvEfJX0+?=
 =?us-ascii?Q?c8unzHxQvFX0Ix4di/y6ZKF61aK8haPa1d8YquHqlu0qHomqafawhTOuabMT?=
 =?us-ascii?Q?fEt4ugrIqUTPWfeAhh/c0QrOl+fLcDro7hroatYkxVHeafhVU7y2GaMvPuQ6?=
 =?us-ascii?Q?O3pj4toDxS0xQeufpFQrFdoJYmNUGEbYm9NEFySD3MDd/Rf+jItXd+bWfLvS?=
 =?us-ascii?Q?sn/7pBF/sRDBcog1iwc785QK12hzMhCAu6Lwqkj4OD6/HszsisrXhbwXSyWN?=
 =?us-ascii?Q?oGbNvE1cxiESx/Xuxf76R/LaRf1MrnVczWZG4J4CLCeWZh06zc2RhHpa2KOW?=
 =?us-ascii?Q?Ym04sJ7r8oaqqkMt+HTV5DpUHCWuoLbsvif64xXIIiqcEloyYcqksgoEo2Xl?=
 =?us-ascii?Q?aAMxvtH1QqyZZY2JsM1iYktxhjGnknrHAzyeMmLshKJ/q7tMWqxtPyLfXEsM?=
 =?us-ascii?Q?RFJyxKwdP+3C5tfriAREEyiWZU+thB8Roa4Q+sZvyBCtjiYs67WvpKCXMT37?=
 =?us-ascii?Q?YlM3RCq8fyhirMkFwx8/Cs/JnnKq2zbNN/3BsAr/W5GBnthSw0kXNbAwJg6w?=
 =?us-ascii?Q?nAv8mh2TIR8F2yDEIAtXnYzZbWl1GLg6PbJLMTQVvOHF/W6yT93kQ/DgUfw5?=
 =?us-ascii?Q?e6tpxlElwlPug0Yzp2glsqCfxvNgmffeOqxvzroXUTAB1dDtTKhcKBdSIo7B?=
 =?us-ascii?Q?3eZkmB/gc30b41XJv/Yeyk2XLt5Gtps1xLz2faV9g2ilnn4mWNW0osKtkUdf?=
 =?us-ascii?Q?uo4fTZxqZ+Vf9nMpkCLnExNAzlhMtTTtk3TV6uwysfXqUlz5090gd22QVx1W?=
 =?us-ascii?Q?st2G9EtYZwlPLzlmvD6qZyJ+YYj5FNxq2GI/hieFO0XdgsLxSF0V7sdRAVRS?=
 =?us-ascii?Q?0tnN8C4+YQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f8086-df2d-4c41-e7a8-08df1ea4cf90
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:11.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0REyKxa88phhklJdpksBQvLlIeJkxz76+iYof6TqYKbSgrwKIEF5c2tGpwzWhwlZHj7dGg+tTKjKeQSm222H8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

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
that the tree carries.

Without distinct types, a vector, a leaf index, a set of vectors within
one leaf, a subtree and a set of subtrees are all plain integers. A
caller can pass one where another belongs, and a register field can
accept the wrong one.

Add a type for each of those, and for the leaf count. A vector converts
to its own leaf, bit and subtree. Its constructor rejects, at build
time, a number beyond the widest supported tree, and a validation
method rejects, at run time, a number beyond the leaves that the
current tree implements. A leaf count yields the set of subtrees that
it implements.

The module has no user yet.

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
index 000000000000..206e6940ce77
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
+#[repr(u32)]
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
+        // CAST: `LeafCount` is `repr(u32)`, so the cast is lossless.
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
+/// A GIN interrupt vector, bounded to the widest tree that any supported chipset implements.
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
+            Err(EINVAL)
+        } else {
+            Ok(())
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 4f8ce4e4c187..8202c4982efa 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,6 +18,8 @@
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

