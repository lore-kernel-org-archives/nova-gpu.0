Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C34379C3C
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739791; cv=fail; b=OT4Kfbz7FqPP+hOjY1U4psRIuEFicpqWmb8nkHoClS7LLIvw4CoJBMFqXIVPY8PgysZVhKsuJ9YSpEQQRgaq/dkUaGMDZCKLriiD4MI1vpei1FFPkIadJPR6kMKp/MzjBPXml1Hg0RrpWz7TRUEUjOgPOMaZAl6/Kv8iZMvPaVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739791; c=relaxed/simple;
	bh=sIEYod+YQt4Hh34VWRpSxJbbkhfzwD2cAcCxhOTGxpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=glY5nuKtMCVvr5AA+rptplJbYKSZOpSthTbucY1JeR+8CgLE5ZYXsQbNnTcVRW47qPzO87ZOWKpHL8iGt83bUJKnEmFJJTkdSUNE4Rs5m0sCowWOq4WvLXiCEmI0FCMCgg3IBto5KN8wRbajHZB1+c/vdN5HlDQ1h7EV5qkY9Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=taTbGREX; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="taTbGREX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZXJKLjNjn4BtLE9gYISQiWTB5Espo19z2eGZdOErnNVpxk0H6BR9nru4SP8Bc6aBaMhSiIxtPSd6T3YoUtVTrvAhRFekCWYWHaraibGnjnsXwRNQqsuuerGKzcEgx3FTyJRVgzv204w8KOdbxvH1AFNL+tC2ebgVqn0KGYfP7ReyLtkkOG2t1QAtah28cgslghehuaHOt41XFcZCBiP/YWFvcm9K1RYagOFkakWd0hzH7TIUKuLbf68cfogjdf8fu1TA09/f6IeI46o6309zrfTgYMHPaFOpjNGK2NM41bzNlxqLK6Yu+bSOrAwyuBxI/NtaH6Zi23jgJljDI0y+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQctFBIhTHElMhQZDAbG0RPRPrZw5FwMzc5atf+bgRg=;
 b=Zxr9EFtIgAkMGk+J6GKWtbFB9YxSCOmFqergcNxQql7GecKFhgEVaucCazxlKe4btIh0K/H0oXmaah+mF/o7wZMwd9I4cWQlbirEniJAAeRv1CdFIIf1TLHFw9dNVwGTUv5uQRFq+d6ipxujlAedTe5xlZ1yaR5+zRDlNqurTAKNxyOv63+tNtCTznHL1kReGMiCRuZxmpsjsA9YKQTjBvSbVOxjirfcMU5K0LTe0qZPbb70AyUL7n2M94eiJh2//W9b9KScAEjSLr09DuXyxIJvbmInTEzHr97oOkGjoM/qP+L0ZQLXdSO9ohDL99ydDqoEMrcrU7m6PfrAvgO+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQctFBIhTHElMhQZDAbG0RPRPrZw5FwMzc5atf+bgRg=;
 b=taTbGREXQfKzPsudnIu9KJjW3InVim4oR5+Hb5ES5UZs5WVBwvG5w1zMDXrecCiBB/TTTA+sG3zvvDg871rYJee/RfkDYNpmxCfrPwY2+gpy6dgjuVr26JRTMbS6SSyb+u0EH6CVIbvtPzkgVJ7tYnYjCKb8/GI1uV3Km7rnTB64mxUGb03i0Az8w6krimzvYvEGv5kbuVZqnlSe9OcMhBX2irONqEK1sfD1I6Qko5akp4QIy3ndvcDkoEO9fscDVCoxujWf/xnMJgKHcTjCG7GBdrUIq4fzZk1Htg8KmRDrfpiXP+n0WdW8GRor0y5ytXi2pZp65F7QtZmG6Ois9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:13 +0000
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
Subject: [PATCH v5 04/15] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
Date: Tue, 29 Sep 2026 20:41:37 -0700
Message-ID: <20260930034148.590687-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:510:e::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bdf11a-d7d3-44d4-0224-08df1ea4d096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XXW1E/u1ZNAMJavjBxBy0lam4z8VLuj1HA327EcYn3JibE7mefBY0lH4o7Agpjr9dHLc7l5u78eNhdWt60tpJsOzlW9Qq8o9rthIkN1+ghgSkkMC+ahF9N5nVua/QQtopd7p8yByTcaQnPmE1JQuaIbBzvPVveQk/X73hIg9j83Mu/T4TzUj3FuBOQRvkVDRyvyPCsPtPxO+MPC5i3QYkl4Zl/nUpqtzWJJnwO1wwMmhTZ4xRO1RyXvfKFh5lEvFvqunW82M9bK+FCxZJAINH9Ekqi+Qix52lk11JLzqyOaJOg6WWt41M7aIs4ZmZeOycJlji2GmM9uyvMuRPVU1Dj72iijLDCtEe9MpMuHAzH03D5ywVIKwVozD2G2wSwYdGrrOsnWPQ30Az4lLVe5OW0SLx0da5RWnFDCU8K5/vB2FOWNDzlaYvNfrs5GdzJGyP7Iu2NQP7vJDyb6jrWTmc1E6SDmVcOmn21R7wg+d0spgbokqE5x3rhPMl/sH6cOnorsjsvZT+4erT6KxzI50N1I1a800bTGYNboyV7tKwXOwxRnv6ZQumST6jJr/XH7ZHdolGYkUq+B3LRGAtYWenhoXaSiCpUOJ/geKbageVoYZTPYspzthqkDcHzgqHVlFqoRDWQnGfFXmW3uNczjFaeE4BpDM8drP3J41GcpHtNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGFvKBZfryGCFTLhocmh/RnHcn3zWUJc3v2MEKl9L3doBN6J0OJy26oNnSZo?=
 =?us-ascii?Q?JGkLoXSnA0aG49caCkJwn1AVnaNYeSgBZUIryEPhjUIpPO1VnXX0B6e3pkdu?=
 =?us-ascii?Q?t0fvKUAI10KBxpIAIb7rqVPThII2KWTN6MdLTT9exyNTdCrF39ejNizEcSVS?=
 =?us-ascii?Q?2eQHRKU7kh3CakKfLGqEnzgpBoIjvBFNkxCmbwdYk1OhJNWukTmO+SVzfbVh?=
 =?us-ascii?Q?TOPUi1+YquuonTlbkMC7StOi8W53UYpQ1B88ZrNRvAjzyiBl53e8kqvpcsGS?=
 =?us-ascii?Q?Yt0gU9+PJ+FvVsWw8pfO3tXP9nnDPUGppAO8fYcg56+Jvkj3+gL08HIhcDZy?=
 =?us-ascii?Q?yynRZBuaYz5GHHOMmsBecmznNTLHL5Ra/WHtOnjCsD9Ssn6NBDz9NlAJmUF2?=
 =?us-ascii?Q?lHqz0OnFeyLk7hE1/7uXZJFMeuuuanNpYTEqJGHS2CWP0nDM68iB/HO8cRZr?=
 =?us-ascii?Q?lNAZVegmV+dDX1ZMFx+u2+69IUsDOWlZn5E4g8IXEEGSEyAUKHohxjXyJT4R?=
 =?us-ascii?Q?axwBl90K5twmDELvEppRZ6ZScWjKDYwKRyLuLzJMqY9WPuiMux/CVqxDuPrb?=
 =?us-ascii?Q?LMxti4VLDpXUo7f/Q4Z6EzqAhsKohk4ShhEdIDw6WWcjsJOQZWBHk6sdECHO?=
 =?us-ascii?Q?nTj4QqyWcTncS2Ok12SRDFAQAHOGpiVpJfXw9FHQAAwzLu9kl5KBi/uNYhkm?=
 =?us-ascii?Q?wwXuuil9PF6yLaJ5avo0zkTn6USiKXyqZGakE3GaJOQ+fj3FUSsOECeG3hlr?=
 =?us-ascii?Q?+pE+o877CjHIR4So0lN7un6RjkNGnVI/lPQsvXQX2W9fT4tjj1FgcJ8VkdVi?=
 =?us-ascii?Q?bDX9epUcQlaEQBJn5FnJdJ8X9WTT1bekfe/8Y6dDgbKugE+FzS4FQ/BAfsRF?=
 =?us-ascii?Q?x2/rLpVCFz+SMtGTqK3eUihwh+NHf0hVLlUReXe+BvgJvYCMPfpyw1sBYuGS?=
 =?us-ascii?Q?OGAa4vL7X85diy4E6OKz40N7PE14t1CykmNNSEcg69xjMYwmDY3lHUIQBTTF?=
 =?us-ascii?Q?NQCWTzROm301L4mE3LhGEUK6itzMlFqlqZ5PF7QfI+EwPyZoIj9Kn2W3fJRN?=
 =?us-ascii?Q?rfnZ+9UpTw/X4IepnpKJ9WhgUQTDMgadRAHmcBFZQ+DmDVOUofbuu/9I/JZT?=
 =?us-ascii?Q?0cVrOv9BMZE5xoJ5sZgaLvLx9tnvp7gT1muP47N4hhXCfmQTks53Ym9fdtuR?=
 =?us-ascii?Q?0ZSk82aEV7ejoew0EA2afmFp47d1izsF/JEaECyf06H/WRmrAuf5R+4dqqrZ?=
 =?us-ascii?Q?CbxNiXuetxqu3aSeGaRAq+05PHbEHou5pfpTHGjPS000rtAvR36LEGILwo1z?=
 =?us-ascii?Q?EHBY2YlbkMQNHis84mAimgFAjkuDjJc9+C/MglwvU1V1BRnAPUIpEBHMxKiP?=
 =?us-ascii?Q?Fj381a9+CXrLwtESz0j7VNDhnPvezZs269rIWfWUUR7wlqQAYM2P557tFCJM?=
 =?us-ascii?Q?Vpd79d1pjdYEIy3nCA5J7mWE1k04CHkBHfBfeWqpyJX/MSvoS1Z8tajLhZFN?=
 =?us-ascii?Q?Ua9dRQp5HHaNl390FkT067OocjmqGf5ly7HItTzwDIYLhNUPOg+DhQPzDkFL?=
 =?us-ascii?Q?nsRrRuSUay80fHYUi61Eddg4jD9Odllc4ImYxfW+P/ozg949Dz+onXMCEhid?=
 =?us-ascii?Q?aND96uQsNGfsBd8+BKdyvkhrBlevgW4Ywj/wFezUVOFTPVk/9ZtoJy+xPx82?=
 =?us-ascii?Q?dVH8yO6uRlftqe1L2/+4pkna2q0SMoEW19EzwgLBl4+k8bMwlGkmn4JdbS1S?=
 =?us-ascii?Q?f/dsftp3WQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bdf11a-d7d3-44d4-0224-08df1ea4d096
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:13.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or/cYGOcmkPbqlyGsdWlvjCzM4jWB6Pf4h+ymwi5/7r9v0Yr3DBN5YS9unRhMqsfkal/WSO2Raj9c3oox4UZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

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

Use the NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_* names on every chipset. The
pre-Hopper headers call the same tree NV_CTRL, but each function reaches
its own tree through this aperture on both families. Declare the leaf
arrays at 16 entries, the widest tree that any supported chipset
implements.

Leave the read-only TOP summary undeclared. A vector that latched while
disabled does not appear in TOP, so nova-core never descends from it and
reads every implemented leaf instead.

Declare each leaf field as a set of vectors within one leaf and each TOP
field as a set of subtrees, so that a set of subtrees cannot be written
to a leaf register, nor the reverse. The trigger register's vector field
is 12 bits wide, wider than any GIN vector, so a vector converts into it
infallibly.

Assisted-by: LLM
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  1 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 14 ++++
 drivers/gpu/nova-core/irq/regs.rs           | 88 +++++++++++++++++++++
 3 files changed, 103 insertions(+)
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
index 206e6940ce77..279a43514b1f 100644
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
         }
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
index 000000000000..4ddd01bcbb23
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/regs.rs
@@ -0,0 +1,88 @@
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
+// with 16 entries, the widest tree that any supported chipset implements.
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
+    /// The write sets the pending bit of the vector in its `LEAF` register, as if the vector's
+    /// source had raised it, and the vector reaches the CPU under the same enables. Implemented on
+    /// every supported chipset.
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

