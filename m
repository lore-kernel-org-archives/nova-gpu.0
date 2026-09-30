Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9DE379EC4
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739795; cv=fail; b=WnwIWTIqNH7fH0MZZgQZ30UjJp5DmD+QQB/02B9tzFEm5Ae1Mab8r+/szZOjNGdAoyI37RylT022zJ4zz2IixpiEO434gu41HifOu9fvKnjdNsKJ4+2kiZoFbHJUnBjbaB0nRb1pzqjPxnD7IuTnSv7TV1WlreVeT2FCIPE4gnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739795; c=relaxed/simple;
	bh=KAxodlPE6bqpiwWCLbHY2NCa8InFSWHimOzTF5xdFIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KPR8mmDp1rty+H3+xq/ulku09Vhl6u3PMcf9gIunyxw8bbVO0nxntnL4cBS43EyERXlaxV8WWRIObMd9wxPH5mDHp+2mRMHkEhmGWjgL0WS/3NDYLf0oRTHwd3pXKadKyeg4PdjVtbk8QhClbH3UEEdsGGdT6Lw5onLZujpsSBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vesd2+vR; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vesd2+vR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2DkchECkMUxoRiBeVkPSa1gkjHPOdauuyLrrcAzUGgeawXlL6UJXSg6/YWkt/MrsdA3yQompCv1v+Pqyn/8EETjefdE7jXSUvXBlucp9idXTH+ijjQFbdABslyvadew7JNzbFs0zTCDQY0OD6hjOWbUHGU4YINqqSNoDzs9ejywzJa1zUq9u/MRO7oWz0lAhiIDc1BxzqJKI8nSJDXc9ElXlY13iA0A+hXQIoGKa7Dr/PTL/GF30/t/t5RzhOvEwyeZMRqEwBI/h+ATQzx5E9OjsIJC4+ux3TMgZsqeJj0raqKGCNRTwyuC5FIGlE47MAHE1bPJkf0W5RKhUN2cNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWKWRGTDc0vU9OB4itx4XwF+GsrQ54NBXSsi75MelWY=;
 b=iXFopP5SXZKdcGiK9it+KEwRyppVr6A5WTFyqCrbVTTeW+neDKtLv1mCZiQcRl0WTlMaRJzXAdXJtvV8/ke3Bw9ErI4hqEjSr3P18YcoVWhMG+Uf56VuyC8Y+ND+K9m8/FWF+d3QLlTjA/NVjugYK6zw0+FkNsibqbxdOUkaVjepb/JZiBnlJEhU9kfdcGZJMLSTCjPPJ+ByeSzZrTka1Gzc2yV0jN3REySP+1B/6OKMSs4zNQw8tvklvREHvrw+voY20/1/g6vmeGrAKuXwlhY+rEjEwF8AWtoVM8y42gTrhzX5jkNPIcjuqMot3umOJbOP0uXRbCDRRnWHHt5v7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWKWRGTDc0vU9OB4itx4XwF+GsrQ54NBXSsi75MelWY=;
 b=Vesd2+vR46ULfwNjDRSyQV0M9PHzlWNQHcg3qyxPYXBUPC1f51oow3turoK9aTWx1fNxvRy4xrkGeZUcVFx/BUvHZBg8pC+716pQtISTXWIUNQCgquEfHWP0GDkpDvDBqpkH6B67xHF4J+RJbKuCmM5l1JLIHcLpYjWBI1EQrs8Y6IrK5THA2kY9OqC3GO2GC25X5wHxeHJAnSiEWjgfxEzdzuPZktEFXg3UDMGsclpJnpkDqz/KbR4BgQAXDDcTic0u6WiEf/r6eVaa9WNTR20q1WlCgg/wUjOK5kz6ysA1ij9JCv/KajdIV7Ooo3tWZN8oX/dRXXWPxC71ZuO3gQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:16 +0000
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v5 06/15] gpu: nova-core: add the GIN interrupt tree and allocate its vectors
Date: Tue, 29 Sep 2026 20:41:39 -0700
Message-ID: <20260930034148.590687-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0055.namprd07.prod.outlook.com
 (2603:10b6:510:e::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: db0395cd-b79b-4e9d-c7ad-08df1ea4d259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HPtNqJbDodoKGkn9/2NqFEAgdbMdYGPpoQvAnEW081UVoeichLXZWaAqWezw7/4S6t6wgzBeJmB4uUoTYQJj5ubDirT8RZwLsiVFOBBrFkeWa2KAUncvX7Y85+Q3SGhkjCCiVYQ0vB3d2/r1tEXJ1Sy2E+ENdGgcwAA/LnZ5msJki1rISQsFEl7ebCpWjxfc1DKMzsM9bQD88xg55qxy9cEXi+Add5c7SLx4486jzvYMbq/18QrXeklEZNvK+IURva6l9/4/0LtCKN+wtfV/YcX0R9qZH8Arc39FruHExH/JHc+2D5EG8/LhMoMiGmAImltl26QWYowb5rGafqwnSZGy3a4pAnSwsgtaXHg6XRgwpxX8YEshe7ToDCipC9+AkODsT8ISUSzRNxehJPm5d9KFXVZu77PaBMxgpllJFKmdXYcBaPoyAMYdZXMa1qY6gPgdUap0lFd3in7qyaLtyK78VI1InY497uXFTJeYX+2HSeSuDeLP6naT/MeAJ7Z47IB0mxAmquYEC2jz2HL9zRxab0DPSdcye5dSpe2PvRIAvqLVGpJqL71IGu/3rmCCaaqmjVtU8P7mW92x+ALZPC3etM+hy5q9fYs6GMiboBBsq9ig2gXj+fLb20JiDXNb0Jw9t9dlzLCEH4RQXO1z5wHZEtSP1vjucgs8Tv2M2gc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m9nZgJvCDmGVcQY6UzsdbAh2g41crkyDCzQem9fwVb5piNGgIidvC5X47XQq?=
 =?us-ascii?Q?UqYiQvXPmSdU6cmAaAfr737vwvYcVhNdqBKqt6hb87UPxwXvOmvm40NVnORy?=
 =?us-ascii?Q?JzA0X0iHNov2cYTD6yeMYooelM99GbseCxniACwhGVHe8nzld+afYDO8YebF?=
 =?us-ascii?Q?Zw1nfSTmJY8XwmbQXRnmdJVTeeIktmyjZD65LK8Bl5N3mKmRlh02dl+I1/JE?=
 =?us-ascii?Q?3NyW1U2xn+Jtj4imw2XGGD0hzno95RIe0E0wWK4Hh5IDYRvfYHwS5HGtH+pi?=
 =?us-ascii?Q?jzDFZTw1G8AOcPr4Y0hwHt2nWn3FTQzqVD1RZ2ObGBeVo23mOMqcyAn0tdRM?=
 =?us-ascii?Q?e0Bft4yPOkJ1o5YgGX3FzNHlBdBP6P38FJoBo8FBx4mAGGL319REuTpy1a/J?=
 =?us-ascii?Q?xSncPJGamRUVvsyW69BKqNuXGt+n1e8sooGLfrzC3o0YXdrBlB3nSGwnvNO6?=
 =?us-ascii?Q?exzGWcu3LpcE+3yqKuc0ByorlrVEZt3PGy8DAk/c/0aWqaTb1zx+TWYIDPSG?=
 =?us-ascii?Q?4A0NNDkedbSgWJ/nhZa9ZtV0oYyfR8Lc3sZzhxmNo4+EhhzukxekvNfcEjCb?=
 =?us-ascii?Q?3TRfzqZsJ230j0LWTn/vSYmXw1K3tlEZjucKaIrVlyXs6ke/NZPyD+5r/zfb?=
 =?us-ascii?Q?AiqYTaJ5wqO4v1pfHm1CrsRXUEVuR+h4h0Js/NMcQ5nfBIS9SbJ+grDBg0tj?=
 =?us-ascii?Q?7Irkn1z6dPGUiuhTAsg9+Oec/9oGaWxJYeDi+/i9huZQyObDESIprKbqZeKl?=
 =?us-ascii?Q?ghHyT0Wcoq9YU3eyTEZWzefEgZnd8Pgi2uSsxA67o+qLxporPIIVbe0SQoYo?=
 =?us-ascii?Q?F1JOlGLiGG049XnvFEU9+CJpH7N7U2nHgAp8BSzvnQ8x8JqGqaYvs7gzm/Nb?=
 =?us-ascii?Q?I862nbnvqH6FWH8r4VfhA+IZLydWyHJ+tYJALyiAtQoA8mTnon3hwtSCcpTO?=
 =?us-ascii?Q?wbqRUMvt9PG0k32dmRIlR2ZYtDMM48Q41+fmwMdrNxQNfhBTPMQ08ohb+q4Z?=
 =?us-ascii?Q?vAVw4ag5QVP1zCq2hST95qzc8f1nrCSfwx2/vkBTjTd0lGHN5pBCpZagTucE?=
 =?us-ascii?Q?TMR1XUc4l8do837fUUtx7QVGaPw0DGQM98FHD55uvMRzsowUgORMpSwWZ2LX?=
 =?us-ascii?Q?OSfYbPaf0T+ekQUepkZwhePpWql91v6dvTtO5fdEHNcs4vS9DVv/tKigM6Cq?=
 =?us-ascii?Q?zmuYxtVNjYx9pUOxGZ8M/wVKgyWW2jvTmUUKXXppPySzAvmedLFCnwbVZZFM?=
 =?us-ascii?Q?kFBQZOoPBG2MqfGQ+W6/W37UY2loVqrCyQE3a+CZkGhDI4uSGWJFzPm9BCeS?=
 =?us-ascii?Q?aTCVWclXPl4hf6DrcMKQmU+bmoV/1jyblUXjadgbpT2D/s59zlb/exg5CqOn?=
 =?us-ascii?Q?x09SxQCYCZ+UCPHtmlpBuoy1F71h6bfNVdEa6caowURWMBbqTSdexIh1ooSb?=
 =?us-ascii?Q?DgxuKeK+cfZscDRrfh6QWLRIT7kRb73L+iEY4Kz0YmcGbayW8TctCB6LA22b?=
 =?us-ascii?Q?UHRRo1VpFrkFF0Y74oEN5LPyStxpV1cr8S8WUSqd+jRlm9kGS4CMD74LavPN?=
 =?us-ascii?Q?m6tBHHsdjq1FCWesmch8vuR3x5CZnbZe2UYoMVx4Oxuv59aK7e83quh3vrPA?=
 =?us-ascii?Q?XiqSO5YcaDHToCKWX3jtJ0VG56a92eVmb2vCUorIPS+wEETSf2tM7GIKowFZ?=
 =?us-ascii?Q?znUVnBg+0+l34qOGrj9dB3D+SHCawtdZwptLbd2/UvwT2khiuoRpkEyfNNom?=
 =?us-ascii?Q?khP8WNdjoQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0395cd-b79b-4e9d-c7ad-08df1ea4d259
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:16.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H7Y9UMFf0Ln9wrPjxeknUrIULedpXl9ZdfNDh54/TFeIRrqd8/quHJALn4eTF1lHYSNtbBGQTGCP5gtTnadxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

From: Joel Fernandes <joelagnelf@nvidia.com>

Servicing a GIN leaf has a required order: read its pending bits, then
clear them. Clearing a leaf first discards every vector latched in it,
and the hardware keeps no record of what was discarded. The interrupt
never arrives, and no register shows that it was ever pending.

Every subtree enabled at TOP also needs an allocated PCI vector with a
handler registered on it. Under MSI-X each subtree has its own table
entry. Linux masks every entry until a driver requests its IRQ, and a
masked entry sends no message. An enabled subtree whose entry was never
requested raises interrupts that never reach a handler, while the leaf
and TOP registers show them pending and enabled. Under MSI the whole
tree raises a single message, so one entry serves every subtree.

Add the CPU interrupt tree of one PCIe function. The tree allocates the
PCI vectors for the subtrees that it services and hands out the request
for each, so that the chipset is given once and the vectors live as
long as the tree. Reading a leaf yields the handle that clears it, so
that the wrong order does not compile. Building a tree fails if it
names a subtree that the GPU does not implement. A reset disables every
vector, clears every pending bit, rearms delivery, and leaves the
serviced subtrees disabled at TOP, so that a handler registered
afterwards receives no interrupt left over from boot.

Request MSI-X entries 0 through the highest serviced subtree, since an
MSI-X allocation cannot be sparse, and fall back to a single MSI
message, never to INTx.

Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: reworked on top of the GIN vector types: a leaf read yields
 the handle that clears it, enables are guarded, the leaf count and the
 rearm come from the interrupt HAL, the drain reads every implemented
 leaf rather than descending from TOP, the tree owns its PCI vectors,
 and a reset returns the tree to a known state before a handler is
 registered]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |   2 +-
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 298 +++++++++++++++++++-
 2 files changed, 293 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 62c242b71dc8..b2cfe73af114 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -10,7 +10,7 @@
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
 mod hal;
-mod interrupt_tree;
+pub(crate) mod interrupt_tree;
 mod regs;
 
 /// The message-signaled interrupt type that Linux granted.
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 279a43514b1f..6e97828bbd42 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -1,22 +1,47 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! Vector addressing in the GIN CPU interrupt tree.
+//! The GIN CPU interrupt tree for one PCIe function.
 //!
 //! A [`GinVector`] names an interrupt source, a [`LeafIndex`] the leaf register that latches it,
 //! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] one `TOP` bit. The types
 //! keep the four from being confused with one another.
 //!
+//! Servicing a leaf requires reading its pending bits before clearing them. Only
+//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`LeafPending`] clears a leaf,
+//! so that the wrong order does not compile. This module does not serialize access to the tree.
+//!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
 use kernel::{
+    device::Bound,
+    io::{
+        register::Array,
+        Io, //
+    },
+    irq,
     num::Bounded,
+    pci::{
+        self,
+        IrqType, //
+    },
     prelude::*, //
 };
 
-use crate::num;
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    num, //
+};
 
-use super::regs::*;
+use super::{
+    hal::{
+        cpu_interrupt_hal,
+        CpuInterruptHal, //
+    },
+    regs::*,
+    MsiType, //
+};
 
 /// Number of vectors one leaf register carries, one per bit.
 const VECTORS_PER_LEAF: u32 = u32::BITS;
@@ -78,6 +103,11 @@ pub(super) const fn subtree_set(self) -> SubtreeSet {
     pub(super) const fn vector_count(self) -> u32 {
         self.into_u32() * VECTORS_PER_LEAF
     }
+
+    /// Returns every leaf a tree of this size implements.
+    pub(super) fn iter(self) -> impl Iterator<Item = LeafIndex> {
+        (0..self.into_raw()).filter_map(LeafIndex::try_new)
+    }
 }
 
 // `VECTOR_BITS` and `LeafCount::Sixteen` are written separately. This assert keeps them in
@@ -130,7 +160,7 @@ fn from(vectors: LeafMask) -> Self {
 ///
 /// Exactly one bit is set.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct Subtree(u32);
+pub(crate) struct Subtree(u32);
 
 impl Subtree {
     /// Returns the subtree at index `idx`.
@@ -151,7 +181,7 @@ pub(super) const fn into_raw(self) -> u32 {
 
 /// Set of subtrees, one bit per subtree, in the layout of the `TOP` registers.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct SubtreeSet(u32);
+pub(crate) struct SubtreeSet(u32);
 
 impl SubtreeSet {
     pub(super) const fn contains(self, subtree: Subtree) -> bool {
@@ -173,7 +203,6 @@ pub(super) const fn span(self) -> u32 {
     }
 
     /// Returns the subtrees of this set, lowest index first.
-    #[expect(dead_code)]
     pub(super) fn iter(self) -> impl Iterator<Item = Subtree> {
         (0..u32::BITS)
             .map(Subtree::new)
@@ -250,3 +279,260 @@ fn from(vector: GinVector) -> Self {
         vector.0.extend()
     }
 }
+
+/// Disables `vectors` in `leaf`.
+fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
+    bar.write(
+        Array::at(*leaf),
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_vectors(vectors),
+    );
+}
+
+/// Disables the subtrees in `serviced` at `TOP`.
+fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
+    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(serviced));
+}
+
+/// The CPU tree of one PCIe function, the subtrees that nova-core services, and the PCI vectors
+/// that deliver them.
+///
+/// A subtree may be enabled at `TOP` only once a handler is registered on the PCI vector that
+/// delivers it. See "The serviced-subtree invariant" in
+/// `Documentation/gpu/nova/core/interrupts.rst`.
+pub(crate) struct Tree<'a> {
+    bar: Bar0<'a>,
+    hal: &'static dyn CpuInterruptHal,
+    serviced: SubtreeSet,
+    /// The interrupt type that Linux granted for `vectors`.
+    pub(super) msi_type: MsiType,
+    vectors: pci::IrqVectorRegistration<'a>,
+}
+
+impl<'a> Tree<'a> {
+    /// Creates the tree of `chipset` and allocates the PCI vectors for the subtrees in `serviced`.
+    ///
+    /// Requests MSI-X entries `0` through the highest subtree in `serviced`, since an allocation
+    /// cannot be sparse, and falls back to a single MSI message for the whole tree.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `serviced` is empty or names a subtree that `chipset` does not implement.
+    /// Otherwise, when neither interrupt type could be allocated, the error from the MSI request.
+    pub(crate) fn new(
+        pdev: &'a pci::Device<Bound>,
+        bar: Bar0<'a>,
+        chipset: Chipset,
+        serviced: SubtreeSet,
+    ) -> Result<Self> {
+        let hal = cpu_interrupt_hal(chipset);
+        let num_leaves = hal.leaf_count();
+
+        if serviced.is_empty() || serviced.intersection(num_leaves.subtree_set()) != serviced {
+            return Err(EINVAL);
+        }
+
+        let entries = serviced.span();
+        let (vectors, msi_type) = pdev
+            .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
+            .map(|vectors| (vectors, MsiType::MsiX))
+            // Every subtree raises the one MSI message, so one MSI vector serves the whole tree.
+            // See "Delivery over PCI" in `Documentation/gpu/nova/core/interrupts.rst`.
+            .or_else(|_| {
+                pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())
+                    .map(|vectors| (vectors, MsiType::Msi))
+            })?;
+
+        Ok(Self {
+            bar,
+            hal,
+            serviced,
+            msi_type,
+            vectors,
+        })
+    }
+
+    /// Returns the [`irq::IrqRequest`] for the PCI vector that delivers `subtree`.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `subtree` is not one of the serviced subtrees.
+    pub(super) fn request_for(&self, subtree: Subtree) -> Result<irq::IrqRequest<'_>> {
+        if !self.serviced.contains(subtree) {
+            return Err(EINVAL);
+        }
+
+        let entry = match self.msi_type {
+            MsiType::MsiX => num::u32_as_usize(subtree.index()),
+            MsiType::Msi => 0,
+        };
+
+        self.vectors.index(entry).map(Into::into)
+    }
+
+    /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the one subtree that
+    /// the calling handler serves.
+    ///
+    /// A handler must call this before returning, or it receives no further interrupts.
+    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
+        self.hal
+            .rearm_pci_irq(self.bar, self.msi_type, self.serviced, subtree);
+    }
+
+    /// Enables the serviced subtrees at `TOP`.
+    ///
+    /// Each of them must have a handler registered on its PCI vector.
+    pub(super) fn enable_top(&self) {
+        self.bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(self.serviced),
+        );
+    }
+
+    /// Disables the serviced subtrees at `TOP`.
+    pub(super) fn disable_top(&self) {
+        clear_top_enables(self.bar, self.serviced);
+    }
+
+    /// Enables the serviced subtrees at `TOP` until the returned guard drops.
+    pub(crate) fn enable_top_guarded(&self) -> TopEnableGuard<'a> {
+        self.enable_top();
+
+        TopEnableGuard {
+            bar: self.bar,
+            serviced: self.serviced,
+        }
+    }
+
+    /// Enables `vectors` in `leaf`.
+    pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        self.bar.write(
+            Array::at(*leaf),
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET::zeroed().with_vectors(vectors),
+        );
+    }
+
+    /// Disables `vectors` in `leaf`.
+    pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        clear_leaf_enables(self.bar, leaf, vectors);
+    }
+
+    /// Enables `vectors` in `leaf` until the returned guard drops.
+    pub(super) fn enable_leaf_guarded(
+        &self,
+        leaf: LeafIndex,
+        vectors: LeafMask,
+    ) -> LeafEnableGuard<'a> {
+        self.enable_leaf(leaf, vectors);
+
+        LeafEnableGuard {
+            bar: self.bar,
+            leaf,
+            vectors,
+        }
+    }
+
+    /// Reads the pending bits of `leaf`, and returns the handle that clears them.
+    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a> {
+        let pending = self
+            .bar
+            .read(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::at(*leaf))
+            .vectors();
+
+        LeafPending {
+            bar: self.bar,
+            leaf,
+            pending,
+        }
+    }
+
+    /// Disables every vector in every implemented leaf, including the subtrees that nova-core does
+    /// not service. Call this only during probe.
+    pub(super) fn disable_all_leaves(&self) {
+        for leaf in self.hal.leaf_count().iter() {
+            self.disable_leaf(leaf, LeafMask::all());
+        }
+    }
+
+    /// Clears every pending bit in every implemented leaf, including the subtrees that nova-core
+    /// does not service.
+    ///
+    /// The serviced subtrees are disabled at `TOP` on return. Call this only during probe, with no
+    /// interrupt handler registered.
+    pub(super) fn drain(&self) {
+        self.disable_top();
+
+        // A vector that latched while disabled does not show in `TOP`, so read every leaf rather
+        // than descending from it.
+        for leaf in self.hal.leaf_count().iter() {
+            self.read_pending(leaf).clear();
+        }
+    }
+
+    /// Disables every vector, clears every pending bit, and rearms PCI interrupt delivery.
+    ///
+    /// The serviced subtrees are disabled at `TOP` on return. Call this only during probe, with
+    /// no interrupt handler registered.
+    pub(super) fn reset(&self) {
+        self.disable_all_leaves();
+        self.drain();
+        for subtree in self.serviced.iter() {
+            self.rearm_pci_irq(subtree);
+        }
+
+        // A `TOP`-enable rearm leaves the subtrees that it cycles enabled, and a subtree may be
+        // enabled only once a handler is registered on its vector.
+        self.disable_top();
+    }
+}
+
+/// The pending bits of one leaf as they were read, and the handle that clears them.
+pub(super) struct LeafPending<'a> {
+    bar: Bar0<'a>,
+    leaf: LeafIndex,
+    pending: LeafMask,
+}
+
+impl LeafPending<'_> {
+    pub(super) fn vectors(&self) -> LeafMask {
+        self.pending
+    }
+
+    /// Clears the vectors that were pending at the read. A vector that latched since stays pending.
+    pub(super) fn clear(&self) {
+        self.clear_vectors(self.pending);
+    }
+
+    /// Clears `vectors` and no other bit.
+    pub(super) fn clear_vectors(&self, vectors: LeafMask) {
+        if !vectors.is_empty() {
+            self.bar.write(
+                Array::at(*self.leaf),
+                NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::zeroed().with_vectors(vectors),
+            );
+        }
+    }
+}
+
+/// Disables a set of vectors in one leaf when dropped.
+pub(super) struct LeafEnableGuard<'a> {
+    bar: Bar0<'a>,
+    leaf: LeafIndex,
+    vectors: LeafMask,
+}
+
+impl Drop for LeafEnableGuard<'_> {
+    fn drop(&mut self) {
+        clear_leaf_enables(self.bar, self.leaf, self.vectors);
+    }
+}
+
+/// Disables the serviced subtrees at `TOP` when dropped.
+pub(crate) struct TopEnableGuard<'a> {
+    bar: Bar0<'a>,
+    serviced: SubtreeSet,
+}
+
+impl Drop for TopEnableGuard<'_> {
+    fn drop(&mut self) {
+        clear_top_enables(self.bar, self.serviced);
+    }
+}
-- 
2.55.0

