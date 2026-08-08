Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F693845D8
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158701; cv=fail; b=g7rGxc3jCyaIH6yuyY2XxyEO0t0b/jtM3O5s8LlTOCR6ieENlsJTq0WJb5OQFnsgOJL4+ffC97aaOpt2H2zdG1WGZv9GyD2dgkXQGK+h0sm3fMhFdca1Gs5jdR3HSGZEsicRcdIVkYnWdU5a7iETMTzxxRruf0sPXnTZIzITeEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158701; c=relaxed/simple;
	bh=9RKvGvjfIUD8hTkV+kAGEqWuENZFuGHDKDrmSgbvQME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kh3u5RY4HDp12G2zBVKa13c75UgZJTr5XDLHFGrmhZLf9qbrQ10Xh7l+8LyyVZXDeinjiIi5hDnO5lDbpbuGj/i+MfxDaF2z9YWoC4ozL85sWIT3upHU0/0hKhlpz7KumfKUwFNHuE7yh2IEyDRQkDXBZ7oDPZTgkD9bI8VG39M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rWPROYt6; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rWPROYt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4dcIpb8EQ2/2szoWMEaIADR4wZG+nDCdCVW+9M+DHvEm32uWsDcY7O5DVojbX3rBDmURMavtoeOm1vR3Iy/Xl0Cd1WeZHZYP4xU8+qkKOuEYwSkRYXKjPwEzLkc77aecp1SSFs8KduzxhGk4jtU7lRApQeK6TF2qaT0O2DDaKKddaO5Aq+d9fnwQD3H+w6M8uML3tx+bKGzVlq31KPV6SR3U1yRuXppBoSNrhu3FDzXoH989Zo30wPhB0FUOnmgoRazfKKq7KSYqw/MqTChDZhA6RetVN5RC6dnYY2xfWlqxgni0qXi4yG++JcyiVgJi1rvu6E6HyuB0EafF2Z80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK64GauwbJsSoSvWAOkiD2Jj9LRTrLTXTuHkHcAV3Uw=;
 b=dTWA8Nv3pBGd2JFWWvAJqczrxkjb54I1Ut/OkjGT9W+P6Z5b0euzU+lWlntv/coZnTv7ERlwass6UiWGFt0jlRE38uz6T1CtSZe7lkbL7E/5C3nEIVE926H56vnPqOKzQSbA6RZJjch07xH+sMNjknyXHcTzPkvae6zsF2VR8+s/9vwi0F0gypE8QgaEFO8lMHapV8r4MtBZYCcZVOt1LmUhaJhDHBq7K7APY0CZW4O1hNUoqBZ1lno2qMZnNB6ha4hE30lw4op6VUUUURzB1F4OEpYHrr1Ee+wDeXLDUQzyfFAd338s557qExWVKyiF8d690VU9jr11O5Y9sBtVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK64GauwbJsSoSvWAOkiD2Jj9LRTrLTXTuHkHcAV3Uw=;
 b=rWPROYt6b+vxVYGycC+vVDmDYeBd7XDo13U3sIAfmKrIMc0hOpM5oRDF6d0AEpociA3+XU5xt+UheU6gvinLUghW8PjAFWeG+n5c7vdqLw9l5NgBsaTNrVwMxfBVXxT16uwM22KfQyUUaioXBwbYS78ONGBy+VE1WLNv/5br4c/a0FQWbQvMGbjN62hSB+VGooDA9+V/cDSeOHuVs6upczo/dwHS0Q+urSzyfHsUmt721ywyzROSqwZTkJhCimfFH52OUj26CbX5C8pFv6L3YxarpXAhEXyouPW59LD5nJJGBSZY3wN4hvLe+8ZNBzC07T1eM8uBCfPlcD1DjCSW6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 06/17] gpu: nova-core: add the GIN interrupt tree API
Date: Fri,  7 Aug 2026 20:11:08 -0700
Message-ID: <20260808031120.363869-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ab554c-f383-4d25-b300-08def4fabd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QP7mtFgGcpiBwSJ3EboCyf/y6CkFG14a6ql80wMROyRPjdDD/RxhQzsG57Mo/fGCiC67hnK1R7WM1gEAE73ATwD7tUVCwFDPqRAD/lye3/xXMyOLudvQQvh3U6v/Mw8gaPuHxQBvmSspfhtIf+Kd2D5b6SGH0pvarCf8UWIBwV/yJ+KdIPMK/7o+3brScyCdHu4cEKCGhFX7O7gSF1ZamWQus94IQDtYCNF+rkPxKRUdSNooPilzKFuR56Jgb6RVFSO45KK12h0ySiO03QPW7BqjibaC3duif1obqihC6Sg/gg6YaStD+cx2LQwzBMkdoPjaTBwSMaPHlEGvzGETfUWDJRyAldEk44XoqaAh9jx+E15VjYzeWCEpZxrfDDwnx+kjBM25TvASmpUF75vBRb3g9pRtvpdZREg8x8erpYG7SJawqhvS+G+u3zaYuRQk/ZqVrkHfRafRk7H+5DblGeh6Fw9nXHEGnwNROUMO73cRNOVF45Qfj+3MmskPFWZm9hNBZaYcScufs5xkf4QTLhK9x+r1QsjRN/5W6qynDTtBKGCS4JbkqXr1hoCmZMPNCFIumD2KmgngkBVnrNeoCaStO98A8zIdO09HgzMI4u/qGTcw8UjnYIOKXUGDHv5tHdX2B2BuFEmEPLEit1ZYiB2GENEszuj4pYFBV3PfSh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSK2OSn34wK4XxF58hM0G05UUzapOI4ee76MYiu2lj91OxeXLIvn8uaOWxl7?=
 =?us-ascii?Q?rwVOZ6AMXS9a/sxyKkyR01mi0Id9LVFDQ2rql0QNPIlQm0pH9lzyPz3TA+L0?=
 =?us-ascii?Q?RsvK/khb1s9JJYwxJ53bmaAJlpZy1NymuvpfU/UfJWMhyIM95teheqUZOG5S?=
 =?us-ascii?Q?XmlNDONEjxE5Emb4KfdFcDNGl2zBJOwRLDP+LW1Y5BXA0c11V3G4+hV0uzsP?=
 =?us-ascii?Q?tvDzZmqPHkhwXe9tD9yUjBHzB1g1wIyCSW0PQfn6T/hU1pxAhbN1j1wBCuy2?=
 =?us-ascii?Q?w1S9zp89SFUUxV/pSSEBAH7ol2vxKz9lnlDuIzvaJxbreXHmde/aQ7k1fW/4?=
 =?us-ascii?Q?LYMLw3L46tiJ94ui9GgOgWmFjEyn/uGgKx56Yus6TlWgKQ4VJHQe2SPyXCG7?=
 =?us-ascii?Q?MgoehKPKKY/IGujfqoNnjKV+DZtnh4p5vFYmN20QH2MKZM31d6GgzdXn72sh?=
 =?us-ascii?Q?zuL77W5fYsL9v5Y69R9y8JCzR233ug1xnDT/ELmI7g1i7meAPVy3RNopAg6t?=
 =?us-ascii?Q?VEtWPRV8mrf3hGTOvEd2+lYo1zze1R6RR+iL1K7XVyrJrTvmsKiiMDzSSLfJ?=
 =?us-ascii?Q?AC699SR1oEB/EA5K9+d1gV8iNP22jOEHgDe5doKB0UYAbOo47zfzJ0P8zKdt?=
 =?us-ascii?Q?byYVDbIhbd7gkUSxszo7kenY0FV8g7dChKAJebSSJKK4DajwEulVpR78XH8E?=
 =?us-ascii?Q?kof4E0jZiGcq8+gFd/mfobOblwWPY3JLMbYAyhqdSCGIGqqT8TNtuT570DVL?=
 =?us-ascii?Q?rVoiFWuso24twmfcee2vMHn/QCDVu0l+3ilo27T6DC+dKSmP9mfLNqbaMrQC?=
 =?us-ascii?Q?IVqXGuwrNYs+g6Rhgg4t/ZUPB177hb+1nuMkkctQ6GSV94hcQMT6BHkk7d5u?=
 =?us-ascii?Q?e4if/gSJCEwDrwuGJ1p/f04fggrgoxNH0yJ3pJXs7I33WkMViR8Rm1EuclCL?=
 =?us-ascii?Q?ETwVNhqrts+6m7gDc2Ybgt8YQq5SQShiccDbUOsmcBNT08/g+R4B4yb9j7nZ?=
 =?us-ascii?Q?Ik/PWhqAPRMppqiVewDby9Oq/uOJnpjLLWaaqpS+eHkFZshYElHSpnShPRR6?=
 =?us-ascii?Q?pTJoG3SYt6ik9okWTtXSwDUDAsHSzV+UVy8Jebr55n5Prk4ZncKpiHU6Sj7e?=
 =?us-ascii?Q?7tfx/a3gYiTTyovshTaFlxtUMS1jXcyctJIpa9aJtun9w0qJ7Tj56p+L7euo?=
 =?us-ascii?Q?TF94WYP2km4is/fE4zxJvbefrVlgPgUP3tWHFaxzzwT820NpubwL4dpZ4op5?=
 =?us-ascii?Q?ugknbfPXnDV+zNDwWO11Xw6PIlpHnXqLdfaO4R8BVfQctX0a/Rss4o2HPbLW?=
 =?us-ascii?Q?Yw/XxzzTtoVuHQQEitD4fAQscR+NYeUYOEAjrH5RKIkcmHafi4/GZsuR/36s?=
 =?us-ascii?Q?Ffz4wAcB+cfg1BAW2ip9i6PUwvbFo8IO97U7vXghnqmNZ17lP2rPPSU3e1Th?=
 =?us-ascii?Q?G7Ldp424KC4+Qd4BQVqacKYWNlSZ0tsgZVJ6W5dvLF22BIrMguHf345QI8om?=
 =?us-ascii?Q?iPu2Hij4abP6ITCtdzDTqXU+qeo3S53qHuZmxx4JIt6kV2Tn/pbJJf0buQBT?=
 =?us-ascii?Q?WR2qT7tzEsKqZmxxIRO0hZPHozfTBrKkir68X/QhnO15Ja7qJ2yqYLx4pn6e?=
 =?us-ascii?Q?tr+DIE8uY5fpMV5HTVFhzsS1kMkHWgxj0/Wg6mePZqq/A4GxrRRrLqvNBSso?=
 =?us-ascii?Q?QdF/wJUxI1Lh6a3k+0A+M8ePIazvn1/WWFFG0e1qKexaeX4BqC66aH1S+99w?=
 =?us-ascii?Q?TrRLAaLmGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ab554c-f383-4d25-b300-08def4fabd7f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:29.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8YYWk+Tudb8vjTA15j1k9g1XPztEUh6031okYh/Ers4RORGa55VRZ4hYm7UcYuSU5KNtduYxUd1xhbSVefEqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

From: Joel Fernandes <joelagnelf@nvidia.com>

Servicing a GIN leaf has a required order: read its pending bits, then
clear them. Clearing a leaf before reading it discards every vector
latched in it, and nothing reports the loss.

Add an API for one PCIe function's CPU interrupt tree. The leaf handle
carries that order as a type state, so the wrong order does not compile.

The CPU doorbell self-test added later in this series is the first user.

Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: use the canonical NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*
 register names, name the module interrupt_tree with a Tree type, drop
 the type state from the Top handle, take the leaf count from the
 chipset, define the vector encoding here, reject a trigger for a vector
 outside the tree, and read every implemented leaf in drain() rather
 than descending from the TOP registers, which cannot see a vector that
 latched while disabled]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |   2 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 257 ++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 3 files changed, 260 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 48900c734cb6..b70efc239334 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -11,6 +11,8 @@
     prelude::*,
 };
 
+mod interrupt_tree;
+
 pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::IrqVector<'_>> {
     let msi_types = IrqTypes::default().with(IrqType::Msi).with(IrqType::MsiX);
 
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
new file mode 100644
index 000000000000..9f6cfed89bec
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Type-state API for walking the GIN CPU interrupt tree.
+//!
+//! Each PCIe function has its own interrupt tree, and this module drives one function's CPU tree.
+//! A [`Leaf`] carries a type state, `Idle` -> `Pending`, so that clearing one before reading it
+//! fails to compile.
+//!
+//! The type state orders the operations on one [`Leaf`] value. Serializing access to the tree is
+//! the caller's responsibility.
+
+use kernel::{
+    io::{
+        register::Array,
+        Io, //
+    },
+    num::Bounded,
+    prelude::*,
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    regs::{
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF as CPU_INTR_LEAF,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR as CPU_INTR_LEAF_EN_CLEAR,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET as CPU_INTR_LEAF_EN_SET,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER as CPU_INTR_LEAF_TRIGGER,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR as CPU_INTR_TOP_EN_CLEAR,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET as CPU_INTR_TOP_EN_SET, //
+    },
+};
+
+/// Index of a leaf register, bounded to the `0..16` range covered by the leaf register arrays.
+pub(super) type LeafIndex = Bounded<usize, 4>;
+
+/// Maps an interrupt `vector` to its position in the tree: the leaf that carries it
+/// (`vector / 32`) and the bit index within that leaf (`vector % 32`).
+///
+/// The returned leaf is a raw index. [`LeafIndex::try_new`] bounds it to the leaf register
+/// arrays, and the architecture's leaf count is a separate, narrower bound.
+pub(super) const fn vector_leaf_bit(vector: u32) -> (usize, u32) {
+    (crate::num::u32_as_usize(vector / 32), vector % 32)
+}
+
+/// Maps an interrupt `vector` to the `TOP` enable mask of the subtree that carries it.
+///
+/// A subtree covers two adjacent leaves, so the vector's leaf is in subtree `vector / 64`. The
+/// result has that subtree's bit set, in the form `TOP_EN_SET` and `TOP_EN_CLEAR` take as a
+/// value.
+///
+/// The result is not validated against the subtrees that the architecture supports.
+pub(super) const fn vector_subtree_mask(vector: u32) -> u32 {
+    1 << (vector / 64)
+}
+
+/// Type state of a [`Leaf`] handle: `Idle` before its pending bits are read, `Pending` after.
+pub(super) trait State: private::Sealed {}
+
+/// State in which the handle holds no pending bits.
+pub(super) struct Idle;
+impl State for Idle {}
+
+/// State holding the pending bits read from hardware.
+pub(super) struct Pending {
+    pending_bits: u32,
+}
+impl State for Pending {}
+
+mod private {
+    pub(in crate::irq) trait Sealed {}
+    impl Sealed for super::Idle {}
+    impl Sealed for super::Pending {}
+}
+
+/// The GIN CPU interrupt tree for a single PCIe function.
+#[derive(Clone)]
+pub(super) struct Tree {
+    /// Number of implemented leaves in this tree, either 8 or 16.
+    num_leaves: usize,
+    /// Mask of subtree bits the architecture implements.
+    subtree_mask: u32,
+}
+
+impl Tree {
+    /// Creates a `Tree` sized for `chipset`.
+    pub(super) fn new(chipset: Chipset) -> Self {
+        let num_leaves = match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => 8,
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                16
+            }
+        };
+
+        Self {
+            num_leaves,
+            // Each subtree covers two leaves, so one bit per pair of leaves.
+            subtree_mask: (1u32 << (num_leaves / 2)) - 1,
+        }
+    }
+
+    /// Returns a [`Top`] handle for this tree.
+    pub(super) fn top(&self) -> Top {
+        Top {
+            subtree_mask: self.subtree_mask,
+        }
+    }
+
+    /// Returns a [`Leaf`] handle in the [`Idle`] state for `index`.
+    pub(super) fn leaf(&self, index: LeafIndex) -> Leaf<Idle> {
+        Leaf::from_index(index)
+    }
+
+    /// Injects a software interrupt for `vector` via the trigger register.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `vector` lies outside this tree (`vector >= num_leaves * 32`). `EOVERFLOW` if
+    /// `vector` does not fit in the trigger register's vector field.
+    pub(super) fn trigger(&self, bar: Bar0<'_>, vector: u32) -> Result {
+        if crate::num::u32_as_usize(vector) >= self.num_leaves * 32 {
+            return Err(EINVAL);
+        }
+        bar.write_reg(CPU_INTR_LEAF_TRIGGER::zeroed().try_with_vector(vector)?);
+        Ok(())
+    }
+
+    /// Clears every pending bit in every implemented leaf.
+    ///
+    /// The walk runs with every implemented subtree disabled at `TOP`, and every implemented
+    /// subtree is enabled on return, whatever its state on entry. The leaves cleared and the
+    /// `TOP_EN` writes both reach subtrees the driver does not service.
+    ///
+    /// Call `drain()` only during probe. It must not run concurrently with an interrupt handler.
+    pub(super) fn drain(&self, bar: Bar0<'_>) {
+        self.top().disable(bar);
+
+        // `TOP` summarizes enabled leaf bits, so a vector that latched while it was disabled does
+        // not appear there.
+        for index in 0..(self.num_leaves / 2) {
+            for leaf in (Subtree { index }).iter_pending_leaves(self, bar) {
+                leaf.clear_pending(bar);
+            }
+        }
+
+        self.top().enable(bar);
+    }
+}
+
+/// Top-level view of the interrupt tree, enabling and disabling whole subtrees.
+pub(super) struct Top {
+    subtree_mask: u32,
+}
+
+impl Top {
+    /// Enables interrupt delivery for every implemented subtree (`TOP_EN_SET`).
+    pub(super) fn enable(self, bar: Bar0<'_>) {
+        bar.write(CPU_INTR_TOP_EN_SET, self.subtree_mask.into());
+    }
+
+    /// Disables interrupt delivery for every implemented subtree (`TOP_EN_CLEAR`).
+    pub(super) fn disable(self, bar: Bar0<'_>) {
+        bar.write(CPU_INTR_TOP_EN_CLEAR, self.subtree_mask.into());
+    }
+}
+
+/// One subtree of the interrupt tree, covering two adjacent leaves.
+#[derive(Clone, Copy)]
+pub(super) struct Subtree {
+    index: usize,
+}
+
+impl Subtree {
+    /// Yields the two [`Leaf`] handles covered by this subtree.
+    fn iter_leaves<'a>(self, tree: &'a Tree) -> impl Iterator<Item = Leaf<Idle>> + 'a {
+        // A `Subtree` is constructed only for an implemented index. `LeafIndex::try_new` drops
+        // any index beyond the leaf register arrays instead of panicking.
+        (0..2usize).filter_map(move |offset| {
+            let idx = self.index * 2 + offset;
+            LeafIndex::try_new(idx).map(|idx| tree.leaf(idx))
+        })
+    }
+
+    /// Like [`Self::iter_leaves`], but keeps only leaves with non-zero pending bits.
+    pub(super) fn iter_pending_leaves<'a>(
+        self,
+        tree: &'a Tree,
+        bar: Bar0<'a>,
+    ) -> impl Iterator<Item = Leaf<Pending>> + 'a {
+        self.iter_leaves(tree).filter_map(move |idle| {
+            let pending = idle.read_pending(bar);
+            (pending.pending_bits() != 0).then_some(pending)
+        })
+    }
+}
+
+/// View of a single interrupt leaf.
+pub(super) struct Leaf<S: State = Idle> {
+    index: LeafIndex,
+    state: S,
+}
+
+// The `try_at(...)` calls below cannot fail: `LeafIndex` is `Bounded<usize, 4>`, so its value is
+// in 0..16, and every leaf register array has 16 elements.
+impl Leaf<Idle> {
+    /// Creates a [`Leaf`] handle for `index`.
+    pub(super) fn from_index(index: LeafIndex) -> Self {
+        Leaf { index, state: Idle }
+    }
+
+    /// Enables the vectors set in `vectors` for this leaf (`LEAF_EN_SET`).
+    ///
+    /// This is the per-vector counterpart of [`Top::enable`], which enables a whole subtree.
+    pub(super) fn enable(&self, bar: Bar0<'_>, vectors: u32) {
+        if let Some(loc) = CPU_INTR_LEAF_EN_SET::try_at(self.index.get()) {
+            bar.write(loc, vectors.into());
+        }
+    }
+
+    /// Disables the vectors set in `vectors` for this leaf (`LEAF_EN_CLEAR`).
+    pub(super) fn disable(&self, bar: Bar0<'_>, vectors: u32) {
+        if let Some(loc) = CPU_INTR_LEAF_EN_CLEAR::try_at(self.index.get()) {
+            bar.write(loc, vectors.into());
+        }
+    }
+
+    /// Reads this leaf's pending bits and transitions to [`Pending`].
+    pub(super) fn read_pending(self, bar: Bar0<'_>) -> Leaf<Pending> {
+        let pending_bits = CPU_INTR_LEAF::try_at(self.index.get())
+            .map(|loc| bar.read(loc).into_raw())
+            .unwrap_or(0);
+        Leaf {
+            index: self.index,
+            state: Pending { pending_bits },
+        }
+    }
+}
+
+impl Leaf<Pending> {
+    /// Returns the pending bits read from hardware.
+    pub(super) fn pending_bits(&self) -> u32 {
+        self.state.pending_bits
+    }
+
+    /// Clears every pending vector by writing its bits back (write-1-to-clear).
+    pub(super) fn clear_pending(&self, bar: Bar0<'_>) {
+        if self.state.pending_bits != 0 {
+            if let Some(loc) = CPU_INTR_LEAF::try_at(self.index.get()) {
+                bar.write(loc, self.state.pending_bits.into());
+            }
+        }
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

