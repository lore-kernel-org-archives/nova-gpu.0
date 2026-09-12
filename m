Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F1737B3F2
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188269; cv=fail; b=S8LBgFPwIXUpLhjBRCmBFPVuPIRjOpSu3VSxkVnlf+MZ6p2KxpWEa2mC8wnnpijsq5hJ9DTY5ILmrXk1NzOyJMOlLDdA8Ns7P9xt1wHon4X0qFK+VXorqyIJQj8y1JHGfT+o4YkXN8GHuIQDw8tnGoazFoX0GJ5+pxirNY3ISBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188269; c=relaxed/simple;
	bh=UykTYG0YOkCHWffM1BBNClwMKLZe7k2Hvd5zZi/Iu+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugC6ZeNHp5mUE8qkFtdjjMzluzpvK4THI6f3fJveVyiR5lh+lyvsaEvtiGoyjz+YbEb+Ung0fYrmd/7X6trDnO3jL6UepDRnwRE0qT5b1sZ8t3a9m11W4MoWtshjDke2k49zK02mRH188eMhys1gcphdflt8fsh5cwpIPCrFxns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z5d7tTVN; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z5d7tTVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZGx+jR+ilx9O02QrEaRdvEqSe3MDzcmD5VkoD0+72FTKfRqv0EvL3ebx1oFPpy12a9719fIY/k9pdYeM6mRnr3IiNf3iCog667MJSxZeHc+HotCllysazSXtnpdah52MX1bZn2SEjJIfNM3BEQYzvCOvxV1KP7r43iYZ+Cylt31RTImky9z0R82TSCplghJco4Z6dsRBN3Y58eXMaI6geQAGCisRchI8IYAx4u1oa+cv9T/1vECpSLJ+pySAIS7RQfS7FbcaPlMfpP3lGSub5jMws4hd+G4v6ctKVkl27pO497UwJuTzrdojy7QBGsKPa3J7XSymxgiACUS/x4uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjlN/Wl8y8Qn7wapsG5i9DL8ekpxtTIrk45J+3qvNAs=;
 b=ibUkp+IhAp9BxUridc6d5trWb6K3nALqO4KuQysAdPPr+4CaujQkdGYre9A0QNzlsvOKI459F5A7s8QY28tm6qVYvl4yuvLA+a6EESu4aWVQZyGIk2tpSfku54pCmTx3EccLSzDrsC7h26EhTUO9vAmhuy1tG08Xg1EVHmn51eRyKPC2euEjw+1hMnIH9ZLYKsqMqN1HynOr8ybA8iSfmQ3Y1K9YtkH2xrd0336F8e3OLVLl2zjIUyYFDNbGrrs6F8EjalOI5uW0i5Me9fgVqZeyz1RAxHpevrLr/VpfabA6oDftK/Kb3hyGV3oU/bR0xqpYA1x5gpTHEgW63tAd2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjlN/Wl8y8Qn7wapsG5i9DL8ekpxtTIrk45J+3qvNAs=;
 b=Z5d7tTVN75tO2NlRFL/GVhYBw/CGBCglVLGzA1qzQKOXd3oj0YV/kvvCqu8z2qWtpHyY/MMQFjuchiUMMgg6pceQD8LfnuzONy0et2SHX5pTTlx3KfINMrEO7YUagDyh7GMJ5n8mwNjwiUcZ9wm6TS1nFJy4U9Dh0uJUIkmQyApwQfXwnEgjEEv0egA8FUH8kkQglHadEbYRBZYUBTZSUVWijDVE7BxV4bjmS7wQM1elV6ritgAfCQjnJiqe0EqmriDBY2R3z1DPgdJNfQdYTatJUaqiVN6Bov+TncNDIWDyIlRkLlP33gNYeMlXgyjVCza8GeFPXPRA5dwe8vWuYQ==
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
 04:44:17 +0000
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
Subject: [PATCH v4 04/17] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
Date: Fri, 11 Sep 2026 21:43:47 -0700
Message-ID: <20260912044400.677097-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 12292143-3f94-472c-171b-08df108880b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	K9vFKScVuZqnJ4ZBGbr/DpTkyKEUV893+tzZ0kxhw1ujgvjouT6R/50zhuGPHUGwFaujOeTaECw/TLt02on1snHK5dSGJ60Yw+RZcUtEtdfpc5xw7G7+nISqE6MfJGUTTjESJ8jk/rV4L+J+Gv0+HPmYXsvoBSCAE+IfNkjKzm7DpU1kIaxE+jnmIiHw18a7/M7i+opDOeBzLElSd+fHPN0Rd9bqbE2U0RtwOhH4nLG4NuRx7pUc6RWKPxOLR5elnCI8sl+1ehFqtF/VktZ/Z/2j2b06uar777cdQutoafFWZ7oCyimAs3Pn5GW40A078adkHL8oVkeBHabcSAM0DlRw96JgeVtMteo65DXwJ1Vc88qoqoYp21R50zskqdPQD8hGVq4eQBfkxISiaFxU+GXY5R0MK2oiZkcEeoEQ0JKtlqadLcYHhsSOwgUakh4SaLOcVmpXCwAW+0UmAqQq8A+sQT7peVJwK6CfJYla1fzhazkbz26JNxLl8nDurmNSg+XW49hda59HmT03UqYJi1O1SLUXmrOHa3Lgdxx6YRvtrKWsxiTgjJXeXagzwua15pLHeDqNTIXGiw9ReOgX0NmXD/4O3oiWHntTlvHRYRJ1tsOUnNxjgzqpVAuufuXpVHrz8LYPaLQ7ar0G7ZSqgF3S5lPzvl25i6pI968cifI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jj7EybpZ0Z6jvwO+wLwRCCCVu2/p/7vLNFTEXsvEopTQReHIrN86TU//lSWl?=
 =?us-ascii?Q?tFA2hgoGnRJLjMgcaF8+0iv/bgadZ0nMX0kskhoUpoF12JEE0UWzYpSpr8cV?=
 =?us-ascii?Q?C/D9bAgNnG8Qy/1mbqsQgZLG3NRMcMIlf0fk6WI4t6k4QQeNtgkMfhrkAcx1?=
 =?us-ascii?Q?cXxwEDa/qCgRb+tjgu6XvVAWlVR7a77rmtdsn8NNbkbWqa9hGwuPpCGKABNA?=
 =?us-ascii?Q?bBfAkEtN0HBi5+9XxRytxfXn0Xrw/Myn7GhnCD4tucS6nub8xormrQgbpgWU?=
 =?us-ascii?Q?A8vfX+jrOY+gj9iZt8B4rWyqdGNMJJOWUoN2p8d5Kt2MWp16cCZK85blLaOw?=
 =?us-ascii?Q?zYmYVOccBVDFwr5DV/ZSl9UyumcHiGnv1YvrEm7sstF6S/n5SIiyPwhGdQF/?=
 =?us-ascii?Q?59sR5wUUFEjbBCHH9iNXpoJY8Wrwa2lIc+9shEir4NwrCQZ6LZFnzORB4I0A?=
 =?us-ascii?Q?Ag+OUwHp0pbxOuBzCBv4vHCG7gYdhZ5rVPEuVBaKQGwqkrtTAsWI0Bw2cxT0?=
 =?us-ascii?Q?9Qoy3PaHZufoUNIs+s09ZrJaO7EwNbVV+FrzXkr5MlOD/GmpU4Mxg0VBe03d?=
 =?us-ascii?Q?s+6tpKOl2fQnokUy+RSvFhsogtLVtDXD96MH8gRW/nEjI1+flW1e6WZBKufq?=
 =?us-ascii?Q?pqJUnx3gLa2FUVHZNdeDxXmmkjdzMtQj1OEogj14kaxEj1hWD8Iw6gCbBztN?=
 =?us-ascii?Q?Py5duK9Slw+IHFXwRXyirAsZP1747Z9D4W1tk1bi2rY82tvYwG5tgmWF9cfF?=
 =?us-ascii?Q?ErhTS0OfYHuCo1mmYb/deckWRNlfYUU0YbIMdX/p0lRq4jYKxevQ8PlS2Fbs?=
 =?us-ascii?Q?kt5AhC/8/KwQWiEl/6pJAv2ye4MUkPCPCPsk5HQ0EdDF+MOaL3iceF8xpDta?=
 =?us-ascii?Q?/GTAQDNT/+O3bsqZoSUAedUguczvZAg5R52DFd33n6tuSledeDNNE8qCLgTN?=
 =?us-ascii?Q?utNtTkmzd5UH3OkT+4bpcEKOuYTyBMOkOeWPm3qN5liyG9ANMxn7a+xe34+e?=
 =?us-ascii?Q?b9hvZNHsZyzQOhP7cUn5kQmnACXtcob1+hHjWQFBK8AmxEidAt/ZPWUcWvNF?=
 =?us-ascii?Q?yDDSvv8pboukh5XdaoZ1e3IHd4MgwUhodHZy8KWDuGUkaKp7hsFRK0O39GyD?=
 =?us-ascii?Q?9/47k5SBnE7WyxgyNH142xj4p8H6gQWeoOO/KBx01r+tUOYm1zPqieG6tmi0?=
 =?us-ascii?Q?JjXh2iCEaxhfWQNSV8wbMenjk3ABeyc6oOo9vVTTKIIk/VWSMO6LPSRQxJuK?=
 =?us-ascii?Q?3YY9u9ZBEJu0qaeRJWrJP728Hwf1KetD5c5dg0df9wj7bDW0u0ppAMQKpd6V?=
 =?us-ascii?Q?1s3lnzb4Mn5tawc0xlikJPI9AJjQv18BCrG+R11L1W9cGElbe+zOmKXX7jhZ?=
 =?us-ascii?Q?HXvGK0Mad4uKwgS1RlLHzrSA2Z8K0hOuvtfk87pUIDAWLquXc0CmCDKxXPEm?=
 =?us-ascii?Q?tvxW8StUZEtp74ncWWcucxnxmytn/fRVkqA2uhvhPMCnQ5C9x+vPPuDyhjQd?=
 =?us-ascii?Q?YaoYZXas497Pu1f8lxaNU2Y/PiW/5Ci3f55oDkhn+Wn6yRKgFObrvZ7UPbcy?=
 =?us-ascii?Q?H12H9upowRVTQRrTgVNzyH9KSo+GfFcy2VPKNU7SssO8fbN9rfWv8wheo8pY?=
 =?us-ascii?Q?YU8EhRQraestx7ZMQ7glbTX//u4N4MdaZk+wr9uvNj6JoRsun8xZXPH54mci?=
 =?us-ascii?Q?ZWCWtw+WBGLgGC9U0l6pCnhrWqQJuR2l4B7BXX7PLoYdZ4wJjVn4vFmSh+lE?=
 =?us-ascii?Q?k5ERX+aTEA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12292143-3f94-472c-171b-08df108880b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:17.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N81cBd5vThFEe+kktIiWxUyaG2RsNJuk2y4/vvOJ/Lp+iLCXt0A5Au97Nu14nMl7SDWB8WIRUozVQUku/hmBbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

GIN is the GPU's interrupt controller. It latches each interrupt source
in a two-level tree of LEAF registers summarized by TOP, and raises the
PCI interrupt when an enabled vector in an enabled subtree becomes
pending. A message-signaled interrupt is delivered once per edge, and
pre-Hopper MSI rearms delivery by writing the end-of-interrupt register
in the BAR0 mirror of PCI configuration space.

Add the CPU tree registers that receiving GSP interrupts and running the
software-triggered self-test need: the leaf pending and enable arrays,
the TOP enables, and the leaf trigger. Add the end-of-interrupt
register, NV_XVE_CYA_2, alongside them.

Use the NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_* names on every part. The
pre-Hopper headers call the same tree NV_CTRL, but each function reaches
its own tree through this aperture on both families. Declare the leaf
arrays at 16 entries, the widest tree any supported part implements.
Later patches bound every access by the part's leaf count.

Leave the read-only TOP summary undeclared. A vector that latched while
disabled does not appear in TOP, so nova-core never descends from it and
reads every implemented leaf instead.

Declare each leaf field as a set of vectors within one leaf and each TOP
field as a set of subtrees, so a set of subtrees cannot be written to a
leaf register, nor the reverse. The trigger register's vector field is
12 bits wide, wider than any GIN vector, so a vector converts into it
infallibly.

Assisted-by: LLM
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  1 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 14 ++++
 drivers/gpu/nova-core/irq/regs.rs           | 87 +++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index f1323f633a03..1ec0bb055d3b 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -10,3 +10,4 @@
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
 mod interrupt_tree;
+mod regs;
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 24976a3146be..5c7829ea3bc5 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -16,6 +16,8 @@
 
 use crate::num;
 
+use super::regs::*;
+
 /// Number of vectors one leaf register carries, one per bit.
 const VECTORS_PER_LEAF: u32 = u32::BITS;
 
@@ -31,6 +33,12 @@
 /// Number of bits needed to address every vector in the widest supported tree.
 const VECTOR_BITS: u32 = (MAX_NUM_LEAVES * VECTORS_PER_LEAF).ilog2();
 
+/// Width of the vector field in the leaf trigger register.
+const TRIGGER_VECTOR_BITS: u32 = {
+    let range = NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER::VECTOR_RANGE;
+    num::u8_as_u32(*range.end() - *range.start() + 1)
+};
+
 /// Index of a leaf register within the widest supported tree. An 8-leaf tree implements only the
 /// lower half of the range.
 pub(super) type LeafIndex = Bounded<usize, { MAX_NUM_LEAVES.ilog2() }>;
@@ -236,3 +244,9 @@ pub(super) const fn validate(self, leaves: LeafCount) -> Result {
         Ok(())
     }
 }
+
+impl From<GinVector> for Bounded<u32, TRIGGER_VECTOR_BITS> {
+    fn from(vector: GinVector) -> Self {
+        vector.0.extend()
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/regs.rs b/drivers/gpu/nova-core/irq/regs.rs
new file mode 100644
index 000000000000..eef28425a74a
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/regs.rs
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::register;
+
+use crate::driver::NovaRegisters;
+
+use super::interrupt_tree::{
+    LeafMask,
+    SubtreeSet, //
+};
+
+// The GIN CPU interrupt tree, reached through the `NV_VIRTUAL_FUNCTION_PRIV` aperture. See
+// "Register naming" in `Documentation/gpu/nova/core/interrupts.rst`. The leaf arrays are declared
+// with 16 entries, the widest tree any supported part implements.
+
+register! {
+    base: NovaRegisters;
+
+    /// Pending bits of one leaf, one per vector.
+    ///
+    /// Vector `v` is bit `v % 32` of leaf `v / 32`. The bit is set when the vector's source
+    /// drives it, whether or not the vector is enabled. Writing a `1` clears the bit, and a `0`
+    /// leaves it as it was.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF(u32)[16] @ 0x00b81000 {
+        /// The vectors pending in this leaf.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Enables vectors of one leaf.
+    ///
+    /// A `1` enables the matching vector, and a `0` leaves it as it was.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET(u32)[16] @ 0x00b81200 {
+        /// Vectors to enable.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Disables vectors of one leaf.
+    ///
+    /// A `1` disables the matching vector, and a `0` leaves it as it was. A disabled vector still
+    /// latches in `LEAF`, and `TOP` does not show it.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR(u32)[16] @ 0x00b81400 {
+        /// Vectors to disable.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Enables subtrees.
+    ///
+    /// Bit `N` covers subtree `N`, which is leaves `2N` and `2N + 1`. A `1` enables the matching
+    /// subtree, and a `0` leaves it as it was.
+    ///
+    /// The hardware headers declare a one-element array, so nova-core declares a scalar.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET(u32) @ 0x00b81608 {
+        /// Subtrees to enable.
+        31:0    subtrees => SubtreeSet;
+    }
+
+    /// Disables subtrees, with the bit layout of `TOP_EN_SET`.
+    ///
+    /// A `1` disables the matching subtree, and a `0` leaves it as it was. A disabled subtree
+    /// delivers nothing, and `TOP` still reports it.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR(u32) @ 0x00b81610 {
+        /// Subtrees to disable.
+        31:0    subtrees => SubtreeSet;
+    }
+
+    /// Latches a vector from software. Write-only.
+    ///
+    /// The written vector latches in its `LEAF` register as its own source would, and reaches the
+    /// CPU under the same enables. Implemented on every supported part.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER(u32) @ 0x00b81640 {
+        /// Vector to latch.
+        11:0    vector;
+    }
+}
+
+// PCI configuration-space mirror in BAR0.
+
+register! {
+    base: NovaRegisters;
+
+    /// MSI end-of-interrupt register. Writing any value rearms MSI delivery.
+    ///
+    /// Only pre-Hopper MSI rearms through this register. See "Rearming PCI interrupt delivery"
+    /// in `Documentation/gpu/nova/core/interrupts.rst`.
+    pub(super) NV_XVE_CYA_2(u32) @ 0x00088704 {}
+}
-- 
2.55.0

