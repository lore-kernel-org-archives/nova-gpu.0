Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744535F19D
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739796; cv=fail; b=ZDG8cgHjarcKFhAZ0krngga6UrgClp3XGYb4QCWjfKzO1nxuUkZfGx5ybvDbVBsUG8QdpE0cmyJOtLyfjS/Eh8zcoh5A0xFOyDcBzRZ8r4fOJ6JNefuBBGeVKOZS+eNqHTS5j3X4MS/BQc8tbdCQFEDUORTd5jJFFlEhPZUzYd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739796; c=relaxed/simple;
	bh=j3ebPshD/rSF4Pr+NgUdkPyyd04+APpu5PG/xfzx8Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iOu0xLB3zH6zuuxqYA/3YxQ0YB+aLDQJtA+6sip8mUAffkKzfmdYIvjP66zXdVZX1qfzAV2HVLSzKK84nENmnrpu0FdpAc3REKiwK3zbg1h/y9e0VT3QGZoYVl7ml81l0jLjjXq41UxGOP50d4EsppmujHckVYrqDB9qaDYqnIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cNLqq5+t; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNLqq5+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwa6eV0iNVM02woDwU9RyDIHUFBVqH9ZVrEDNdDIGKGy28LBHjCXZ+MHgmN7QkfM3huRrrUjBjeT8DpuWDDDd9RXCxWplAB5PWp6K3mjj8L6BeLQ46lOgi6ahRybFn00QzgoXeGj3/mDQ00u7dAJKQwhwDaSevy+BjZnrIOG+Nr0yxLSG/Z7q/FQ6lPuL86bhwINWhPLIwdtlZ1oBDHObn54aFOaYAau6KYOJ6+BZCwinfq+tJmniiue4V2Tp0VOtqs/u+9h4ZpU6NsRk8bDz6MtjPUrAhOT0GUtL1onA3rYWRj5BrJLLxFmGUcnx4EBRzjiFiEu9BWnvos+ohT0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2VWx/RFrbcot4atdTAqI6b6sI07VKnG8eXOO8rbh3s=;
 b=qa+Wgv0OMZO0ME2Vz/psMLqZaJ+gEOha4zMmB31VSqt4v8olVJRFN3VvzURh2gU3eX9hCHDLngDyWKoYFfIhy54ysws3ZYoOc+gS2JNKNM8QnELx1pZcXYynhiVJAyfstPLot2E2vktbkXaQqdKfnSeHUnZK7fHjG3ERBr5s7J+D8kVXbF7WNwDmOIPXFTS91OHQe7kv4l95FbSb+PoEgdb4sR/dxqqsb8TJgZWLb0xmfH/SV02L9D6ulLLPRppuMTNyNylyQK+jpT/7W3j/BVtkuQKLS7xdY+bIOSz3HsHv0oSRV7EpGZ1f7o2gJKRly0CGJuYvGmvtRwVwXRhm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2VWx/RFrbcot4atdTAqI6b6sI07VKnG8eXOO8rbh3s=;
 b=cNLqq5+tERo98Ol9/HOHjI/2jnakbbn8ULkUUaI46YY3I0YBVyc92g0xt+BikguJnUckuGzyhNGqz+9ugPVIa6rxPqx7v/1llEomzVWrX2fMR8GqV6T4M6W60PUQUKQCiIuFjYQvKo1Nxy9HpHQ+bI3ZXjyea4sqLnl6Uiqmxrsi42IKHmTj9bHEINoaJWv9783EThktRqmkvE1kp5LNSCGvJRxKY40edAZYj31QTwxmW+aMTMo9L0oVBIg1kYVTyUv/bi8bTpTFgoXxI5yqfkL4a7A9WYCz3EiUqemwFQi2SSQpphb/SNEtx+QK7t3yRNpM9DRzouM1nGMBbsCYPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:14 +0000
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
Subject: [PATCH v5 05/15] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
Date: Tue, 29 Sep 2026 20:41:38 -0700
Message-ID: <20260930034148.590687-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: e2433b64-5242-46ee-b56f-08df1ea4d167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RHhrdn2EYAkoB61jOwKvD+3vCHp6BDsollX7Y+aE7gBbAcoNgcVEdvhL7CEV9qqm2BgvEVvJAq/sm3snCB5uWHfK/YBADZICRCwYHo3i80IveqUJLrukVCRyiVhrVHsukMoWBjqdsEsPQVy47WbfgMTkD2QYrALsLJDPQkubjuZ2vcWNw+JvD6RYbEtvklOCFCoaYAuDXiXHW//0admZdpoZi/fRmFiWGBvqt395oNPTaPyjhu54DwYYNeU7+eruHCwOqBP01ou++WWfFpIpSEMrlZkyZMaN+KEMy5n93MrBwBEZ2e17JKYJUMMWSDULc7KP6GWFB0BPVnA3dtCZ9zJ0RtNRU2z2AcrpFpvwWkO/ta1Ab/z/aw2DNU9CunT+87iYpP36IvlokApoePlEJQCS2ZSoeZAwbdju9gOLfX0NcijoyUFdDQiQPv0sCh+9sCfi5doV7XgI+3P7oDdPUi6tNetq3ScBU1L3mCvVU72j5cT+RuZw5BAVj255bkSxobclYEu2s9+Y9+rGzrz+PABPd7f0XBj92d8PmPvoULfHr9EjREFyRuE1yZRgoVLqu2BQpRSYwkM0bzzL6aDQMkf2NbmH7hLha11TkoB9GMgNBkB57HnfbQNHgp/jIVgPY3geBY0xu/PwmZy96hxtxhI9Uk2C/uQoi58o213CjQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dxLVg/QwO8Dau8qddOtwZ+f0eP/o6xdPn6sY09fRJWIGjZhL4YIClfSS14Yb?=
 =?us-ascii?Q?HRjl2zYUAnGtyydFhGTf47dkjhNwdukP7gvJb6naSFVDXsFXDQuxmIpCz/iv?=
 =?us-ascii?Q?fAwGBhJldQK05TjP7DAA1Lja//cOt5r5Qll7iapKPvkliH2dvtEuzyqhRtCO?=
 =?us-ascii?Q?zBzKR5Vh3mU8GlZ4ti9sj/EZ2KzXL0bQES3avUHBhyE4VLDMaqjLxZ/KKabp?=
 =?us-ascii?Q?ap/GlwHAqekxkISR767ZyhfbVW7A5+jXfmJWiMlZTT1dapxFK153s9Wl45UL?=
 =?us-ascii?Q?ilLROuwfcX/zJJDpYlH5PHaEYEfIgsGdU2YrPALFfEVK9hfwnQ86Uo/GDlGb?=
 =?us-ascii?Q?GcQYsgrynlzuR5OQGnNbITc2R07dobvWU2/BdIT1gZwQHa4ePS7HW+VnAkSd?=
 =?us-ascii?Q?gsawdfldu//FCajCD41iklBkVwHR/FqdqUwS5MEV00vBwUuzsqjeCTIKLICy?=
 =?us-ascii?Q?lnfsYqKhKlyM+1pu0rQLXA1o+nqRx1rBPutNuVkCgqGXmZHa9aO+WwCv+6g8?=
 =?us-ascii?Q?Ebp+dVFpU1K+gIC6TtppPgxXLb2ArLsgq4TSVnBiO+3QAqAv/l4jSZNMKqyZ?=
 =?us-ascii?Q?qsi0JWAX74xA3WuCCyp/UoLIMTGKmTKebRXTcbJBPrhjr0RAmmuziHHE1eZZ?=
 =?us-ascii?Q?9RoPd51K2//xjefas6K45G0OB3SY0Ygf5nv+7fwv68D3E85QYAdz0+vlSYVx?=
 =?us-ascii?Q?ZD+zEtTIy3AE0eD+Zw+HetGMUdnxI2P9hSBI/m7NcAFjVs+ydVT1tRomMaA5?=
 =?us-ascii?Q?Al4vpQXneGRnAbTYZEgZ1eEO4mYVRIVBM7WPYl7BcsNYzWT/657lttpOlOmo?=
 =?us-ascii?Q?2RsnsOFOHu+uMb7RsQhuneHe3R2EVfIv6dHlFp+Una2bPNbrzm+0A3zn11Pq?=
 =?us-ascii?Q?/DewgKfcYs5UQXYLJVd7xPGLClY7dr2wGKIcX4rX6X8WjJJqHvnnm9uKKmrw?=
 =?us-ascii?Q?zbDgdAEmugG4I8Es5fRmgqkepBoR8csYDAmMKReVAb8Uydst9hgykH/Q1s17?=
 =?us-ascii?Q?pE0wbuBSfDBHB0K/WOq1YI5CsRSkpz2vuaTlziES+4qUUW3xhvfuQw25I4ni?=
 =?us-ascii?Q?GWaFn8phJC6/FsXPdVhUad0jHQA9E9arNsjMepd2MrUO0IqdrNoJ4rjY5cCw?=
 =?us-ascii?Q?4+l9rOnJmG53I0BzT32PoGVzWzgGBt2/pqPZCOfPA1wwVpsvQuMdWkCGmOPA?=
 =?us-ascii?Q?tDTD3YSM4ikA40qsrK1BLh2FxDPvC4M9qeD1MZHYvgw5FIGWDupIM3uSteef?=
 =?us-ascii?Q?jQig9S8yWSduFNb4ozAif7/snTpsjmagnwDs6E6FEpYjtl6x1ZmldsTgqOJM?=
 =?us-ascii?Q?RfYEV8rnDjJstEP79UHAXKLJ5lozuJ8+u3i7KGVR++M+gMZlRByEYn2zVxam?=
 =?us-ascii?Q?EosOCTxCLjTL73AsDPaBlAJks8z9urqtwmcTe+3Lfu07HO5NFQtGRbHC+RTp?=
 =?us-ascii?Q?GC7u9vyhBx5ybSRt02ORgjh9TPhXDkeN4516sIuu5WVjrnmjrkM+P6nhnFyL?=
 =?us-ascii?Q?qg2rATlo/pYXtmc/+OixGJCDs3yAmD1OR7Z9fvHs+/G9GQidE1GA2Y12c0Qz?=
 =?us-ascii?Q?eq5PzJj7LizXLw6VoYEpbJcCWMwyoUZV3N1rNNJNPmvnCbOTwWYe1qxtpHP+?=
 =?us-ascii?Q?o+zdNgwVPHm4rGWOFKd8GweUiyJFwOknN/XF0up9x6zrdQmThxhaRu5d6ySK?=
 =?us-ascii?Q?gULcYiwqjihe56F58DYMUUL2CQfkjcrqh2aFYTRBjbkdL3piuEzcAZm8+5HE?=
 =?us-ascii?Q?RXxavH88AQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2433b64-5242-46ee-b56f-08df1ea4d167
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:14.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTwjqFT5RFRONhMKwUApEWCpNUgpA8xFCU637O6DMisPWBNp6dy26MZ3PDuLE7DSfpqEjJmio4x96Sj/VMFTAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The GIN CPU interrupt tree differs by GPU family in two ways:

* The size of the tree. Turing, Ampere and Ada implement 8 leaves.
  Hopper and later families implement 16.

* The write that rearms delivery. A message-signaled interrupt is
  delivered once per edge, and the PCI side delivers nothing more until
  the CPU rearms it. Before Hopper, MSI rearms by writing the
  end-of-interrupt register in the BAR0 mirror of PCI configuration
  space. On Hopper and later, MSI rearms by clearing and then setting
  the TOP enables of every serviced subtree, which produces a new edge.
  MSI-X rearms the same way on every family, but for the handler's own
  subtree only, since each subtree has its own table entry.

Add an interrupt HAL that provides the leaf count and performs the rearm
for each family. Name the interrupt type with two variants, MSI and
MSI-X, since nova-core never allocates the level-triggered INTx that the
kernel's PCI interrupt type also names.

The HAL has no user yet.

Assisted-by: LLM
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs           | 13 +++++
 drivers/gpu/nova-core/irq/hal.rs       | 67 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs | 40 +++++++++++++++
 drivers/gpu/nova-core/irq/hal/tu102.rs | 43 +++++++++++++++++
 4 files changed, 163 insertions(+)
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
index 000000000000..387695cca37b
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-architecture differences in the GIN CPU interrupt tree.
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
+/// Clears and then sets the `TOP` enables of `subtrees`, which produces a new delivery edge.
+fn cycle_top_enables(bar: Bar0<'_>, subtrees: SubtreeSet) {
+    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees));
+    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees));
+}
+
+/// The leaf count and the rearm of the GIN CPU tree, which differ by GPU family.
+pub(super) trait CpuInterruptHal: Send + Sync {
+    /// Returns the number of leaves the tree implements.
+    fn leaf_count(&self) -> LeafCount;
+
+    /// Rearms PCI interrupt delivery after a handler serviced `subtree`.
+    ///
+    /// `serviced` is every subtree that nova-core services, for the Hopper-plus MSI form, which
+    /// cycles the `TOP` enables of them all. See "Rearming PCI interrupt delivery" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    fn rearm_pci_irq(
+        &self,
+        bar: Bar0<'_>,
+        msi_type: MsiType,
+        serviced: SubtreeSet,
+        subtree: Subtree,
+    );
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
index 000000000000..6e307c8d120b
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::driver::Bar0;
+
+use super::{
+    cycle_top_enables,
+    CpuInterruptHal,
+    LeafCount,
+    MsiType,
+    Subtree,
+    SubtreeSet, //
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
+    fn rearm_pci_irq(
+        &self,
+        bar: Bar0<'_>,
+        msi_type: MsiType,
+        serviced: SubtreeSet,
+        subtree: Subtree,
+    ) {
+        let subtrees = match msi_type {
+            MsiType::Msi => serviced,
+            MsiType::MsiX => subtree.into(),
+        };
+
+        cycle_top_enables(bar, subtrees);
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn CpuInterruptHal = &GH100;
diff --git a/drivers/gpu/nova-core/irq/hal/tu102.rs b/drivers/gpu/nova-core/irq/hal/tu102.rs
new file mode 100644
index 000000000000..7e3aea946d05
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/hal/tu102.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::Io;
+
+use crate::{
+    driver::Bar0,
+    irq::regs::NV_XVE_CYA_2, //
+};
+
+use super::{
+    cycle_top_enables,
+    CpuInterruptHal,
+    LeafCount,
+    MsiType,
+    Subtree,
+    SubtreeSet, //
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
+    fn rearm_pci_irq(
+        &self,
+        bar: Bar0<'_>,
+        msi_type: MsiType,
+        _serviced: SubtreeSet,
+        subtree: Subtree,
+    ) {
+        match msi_type {
+            MsiType::Msi => bar.write(NV_XVE_CYA_2, 0u32.into()),
+            MsiType::MsiX => cycle_top_enables(bar, subtree.into()),
+        }
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn CpuInterruptHal = &TU102;
-- 
2.55.0

