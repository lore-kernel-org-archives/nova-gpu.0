Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888137E5E3
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188271; cv=fail; b=qs4PJ5sfBak47GKeZFqhScaRvYxayPNX7dUr5y6rFftIiQJhfISZPT81jRD6JJu9S0mPM3UQqSkbj+fmdHh6lq6aMWmePFfPGxPE9NFOxNqnr+m1RFp8iW2sLP3V8kCEoMGGT2TnJseQE+kjQgdgH0zVL3IEQYTYOZ5npE285VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188271; c=relaxed/simple;
	bh=EBHFwJ7BHDAuR0RzIDavJ41sbypStEcdPgX6ApNtB6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJOwUaM6McCTI3K1NXol4aqH8Kn0RM9WKZ7Hgh16DxcvXucNONnsQ6D6gqAbDwtaum3vVkzoOu/wu6GWTsUwC1n4VVkDdKrk3sBPEdH0AY1qm12T9OBsgRvApLrzEK0A1XdHxZybi1gtOhpdszQPbglZrsLLUL/MvIV/1eLUwUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YF9u/Wf3; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YF9u/Wf3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq1b8/h2zOKzBUWde8umtwvE0/pZRiTsJW/P4XnksQ+WUAEMnp3+1wGjGHwZCQU4iIxquNJ1XrhChMi95ZpkTvuJGxkrpDEQRseKjI07UnuKdpZ7Se0YCa0Z9g3Itv1W9tW390s4226CgVqnVOz1YJkYu5slgREwo1AEpDONdUM981V2N6s/wZwfLtx1p9DFInrIohL9Ikr9w1ZjopUUNdF0ElkTpLHe+ywRuIt4uri9CpwZOSQcumy/ReCav68XK3lMjNHNqBLVbG8vREYSqazkVCV8svv75eTtiMa3D+xCwsrHP5R9T6hf52urn55zR2JLtCDVExYIwrzqEaB1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgzhN9a2rZNUYk5btN/VPDiHOOMOd24ZRtOy5I2DGb4=;
 b=iyj1BmjSp9cltBmhRauvt9lZ3GxXXoqi/eqy41f+ine9+enbuB31yNbWtsHQ5MLGmtJ8c8oAKajkUFJa2ecRLCqoWOxeZxUCu9Z2KbwFZ9+0wfYbJurGxly0GaKW+ptNixUngTDxpBxywWXM7xxK8k6nkADhxb12XxoJgbAAZcwJo7W+D0YSRUHrCwNgKq12Zt9KvU384l7oIMcmcTeuq86IaDp4IVG4+kQDXYL6lUM4jbHMuuIiHEB+zhu0OvFz2m3oE03dGk94sSKN4JMoTiPY0STXxl2ExZm+CsgAOwbY6LgBTjqr95Hf6GpHKN/gOSHchCE3TTtvKVUxHYUvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgzhN9a2rZNUYk5btN/VPDiHOOMOd24ZRtOy5I2DGb4=;
 b=YF9u/Wf3IzWmXxKKevvioEm8Hu68vVrj0DSrwd41rwQ8dYA6LqG2yAP9vjGnrj3U5ldIZJXntpcLIcyiMKt/qlqk31Rr4BLcsWuB9APigvQbWq+TG+TiCXzO0LU1C/T1ZjFjmVvNnz9h27RzlULhenuRCbCt2lfNbyZif2kSoWJxfAuIGNruQCRZ0RYJVSp/jV8UZe+Retg4H0nZbXShI6lFcrcui+2fO1T+meLDb0r+f3ZF1b3Mo0qMoUq8rl8qb6FyPLAg1LJaBwKUQjiJa21I+h9fa0FLc82hAAnorC8TwXyBx4qZgTP/dgH55XymAHjnbH9j+KTfTTk1oqLI/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:19 +0000
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
Subject: [PATCH v4 06/17] gpu: nova-core: add the GIN interrupt tree and allocate its vectors
Date: Fri, 11 Sep 2026 21:43:49 -0700
Message-ID: <20260912044400.677097-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c880dd-008f-41d2-7b90-08df10888212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	qiMg85cYYmur8V1o8n6Bwnd9+X53pOmBHgROcMK0ObhlQxxytr4x4DCRLpM64SyksiPQWOtDRZ9eFFmRN8KbPqa+uzrvzcfNrHDsEdsY9o0rRRLlNyJ/KaKRgNzepgOI1A+iw/lgqD35vWkHYEAD2ko1iQGIR9DS5LhNWvcE3qEF0MBtzBtG3XCsXuDrt9thok2AcpgH/IzNkew+c+nJJZjc3QmMMLLllmElPic+SGV406chjaVUuvpSTtbpTr6LAiA9la7JAb3uhcKYZawUTEGgz4prRAXPDBAApg8VTEJDk1WL9KqD+yMLDlDZVK9ILiA+VnRcSo67TbZJbgCHkEuo5EVLqzC4GVwYAOP6X8a3RNf/bLmVCqKT0nSsvbR6FqRJVbrAxUK6SgkSHJDqwgGmRFp+N84hvPnjAbopazb2O6OfU2r2QjczaYuhXz+4VaMJkJXL9wgyUt6FYHDUQDEtrZcu4tfH+NSInIcehUcuiXV0S0sqyYEf+3Jubd1Uox/pfIyodDoiwqG23qMIJ9viSjPyoRK8b3OAJbVYxEAWjUFS/x+lDM/38CMAh9x0LkNGm0QrpaVN9pNHFQjDS/Q9HvgZxUUxH6x1y4RBW2QHUy2NgzZNatPZfYgIE9y8tK1Hn4SsE9EuXBb1apC3CbHUecDpB/pxtirA93pb0xo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yoNblMvN80uEkt4Lo3qIOJvu5lx5jMH/b7tqLBMMN+a4tTHjGWW8V/FDCWQ+?=
 =?us-ascii?Q?R9rWZWYSfgzfkmc27iJxnS3bS7Tn63tDTVFAmDy0KB6HOhdPVKsWiVkVlnYY?=
 =?us-ascii?Q?1w0mlRwOUCAcNaWJKAN9aUSRuLO+TExhTfrBcsRr7OVzF7QSeL2TzhSvNU2R?=
 =?us-ascii?Q?F5Whs7fSyOvClhq5TClvp4fm47hKV/SPEeFQ9CDrskQCFb8Z6FATcjyFat0t?=
 =?us-ascii?Q?+YxsGbnhd1q5nvXtSlIZfg+nGtuBEsQmz+iFD62F419vuqFs8xl87pxzVrxy?=
 =?us-ascii?Q?ZEvbj9pJb4/DJKeaQuYYj4qfwg3RyOJ79XR5aasgUkVxITgJmurry0jy7c3Z?=
 =?us-ascii?Q?+2vl223zNlU86kEoxpt0XgkrUSr42QyadDfJ2apczifDnDkboPUHxRIomKg1?=
 =?us-ascii?Q?XBc1siYR6F/S89BX+OC80xKctC0a+cUrFmbRifpmtWyHCG2c1DZj3iJoWvip?=
 =?us-ascii?Q?DqSUADQJoPUXDvMjWQ9ZJhye2HnHavdKTcCbKDStDUg4gHbBVBZ0GRvE9mMh?=
 =?us-ascii?Q?CDe3kZ9UFW06IkMEuabCxJGO/TVZ523Q/fCCUy8pucbeJGN61Fk6tTaXl9+6?=
 =?us-ascii?Q?RNJAt7mMqjvOD+sbCAKYEB+mmSrn6+uTX0YgXeeIFear7qzA0QHxx0KLN3n1?=
 =?us-ascii?Q?uswW4RsHToiJytL8ZBcZfPNWB/q+x60S5IhWte3lDvHdY8RFRHICEzqbSyGF?=
 =?us-ascii?Q?WKE6CbM/CW8V4qxSJ4UGKuPEWYrimuiOY4Znqvb9mmASyFgIGB2q0dluCrna?=
 =?us-ascii?Q?m1Y++xkqjj8tCrUZBIUoOP7mAYw5YIw1Qv5sTKzl2z955fDmc4rl0V5lDe+H?=
 =?us-ascii?Q?h+hHO6l98Iq2ltY6Y/mQoPwKrLPHFKfsR8tjFTX/9GSrBjJXPV/EPLU/mZAR?=
 =?us-ascii?Q?ZR4z6LkP6aq2f4TW+9s2Vf2APH0rLDAUNvULyTkDdciYrIGapwTJ0Z8eN6ue?=
 =?us-ascii?Q?qs4fAkoO5WrXQEZCe0nhq4RsAnGv6UZMO+EQxwZE4NvH/o/VTCSJ6WaVDAB0?=
 =?us-ascii?Q?mRjmZTs9ZFe5Lt8w1+7PuwLWhJPzZkHaWPp6gmvBFisBPndmpVmzKUvPToCy?=
 =?us-ascii?Q?EIwm1KyES/lk4XkJwcJTfQxrQHQC3Kay80aToN8IlZmGHQknqoyxKCCPnq4o?=
 =?us-ascii?Q?cvV4Tp14w2YkLiX9VfJ18mGMcwBoDFUcVSRhJABnjF7yDk2wYdCJz3FawcLd?=
 =?us-ascii?Q?00YF2wqHYiOlxMdbgdg0juKlr23957t/kC4+mAWXhtOgR7I5UjuelW85/++W?=
 =?us-ascii?Q?Vd9NP45Znk+V1US/BT8euLSYj7D/XcKnSGL6SdL9KpEABZPTnEX0lf1+i4pp?=
 =?us-ascii?Q?KedG8jq9X22/6lsA6qKkejf2O4zjhmRzLB6MUAg/sW2wTo2HVoIpuJucteHE?=
 =?us-ascii?Q?gbtoF/O37c3kr591dwJZGpOQO1VU4fSVWOuRGhrMUcnFSPYsWg4BJf4+zwHR?=
 =?us-ascii?Q?WM885SgpLcJzuzqb6a8/hzQkAr+34Y3h/bF0oOQpIQErn3bkGkp/2vI7fp/u?=
 =?us-ascii?Q?XYsQ45K2nFyKZ67a89Vwkb7sycvKorvCm/bTNDhPY0TmN+aZaswboBZVQMmw?=
 =?us-ascii?Q?zlM7d8WWx79RSFnE+bL+SBNHyrVimjNqaoo5D+fU2nZxezt57PFddcU9knKp?=
 =?us-ascii?Q?Bw4JkkM50lMatg4wtpVnPYpOtO6DNo9RiC3+PgD7GgJrRIej407XEv/wr4hk?=
 =?us-ascii?Q?w3JQZKEODX8ZMmnq55sWO3CWPIHj6+zN56XW/SHTvOrlDNEbq87cDlGXpQq3?=
 =?us-ascii?Q?bPEJzTY1Ow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c880dd-008f-41d2-7b90-08df10888212
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:19.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbrA4pz9qF4ocdncnMJYYKX2LloLhdmSzE/c02JbxPWWvN4hQ/AyRmKJZVQF6kq1W9pdl4uEXBgoZRhBARA7Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

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

Add the CPU interrupt tree of one PCIe function. Reading a leaf yields
the handle that clears it, so the wrong order does not compile. Building
a tree fails if it names a subtree that the GPU does not implement.

Allocate the PCI vectors from the set of serviced subtrees. Request
MSI-X entries 0 through the highest serviced subtree, since an MSI-X
allocation cannot be sparse, and fall back to a single MSI message,
never to INTx.

Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: reworked on top of the GIN vector types: a leaf read yields
 the handle that clears it, enables are guarded, the leaf count and
 rearm method come from the interrupt HAL, and the drain reads every
 implemented leaf rather than descending from TOP]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  82 +++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 252 +++++++++++++++++++-
 2 files changed, 327 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 62c242b71dc8..28f147641024 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -13,6 +13,23 @@
 mod interrupt_tree;
 mod regs;
 
+use kernel::{
+    device::Bound,
+    irq,
+    pci::{
+        self,
+        IrqType, //
+    },
+    prelude::*, //
+};
+
+use crate::num;
+
+use interrupt_tree::{
+    Subtree,
+    SubtreeSet, //
+};
+
 /// The message-signaled interrupt type that Linux granted.
 ///
 /// nova-core never requests INTx, so this has no variant for it, unlike [`kernel::pci::IrqType`].
@@ -24,3 +41,68 @@ enum MsiType {
     /// One table entry per subtree.
     MsiX,
 }
+
+/// The PCI interrupt vectors allocated for the subtrees that nova-core services.
+///
+/// A subtree may be enabled at `TOP` only once a vector is allocated for it and a handler is
+/// registered on that vector. See "The serviced-subtree invariant" in
+/// `Documentation/gpu/nova/core/interrupts.rst`.
+pub(crate) struct SubtreeVectors<'a> {
+    vectors: pci::IrqVectorRegistration<'a>,
+    serviced: SubtreeSet,
+    msi_type: MsiType,
+}
+
+impl SubtreeVectors<'_> {
+    /// Returns the [`irq::IrqRequest`] for the PCI vector that delivers `subtree`.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `subtree` is not one of the serviced subtrees.
+    fn request_for(&self, subtree: Subtree) -> Result<irq::IrqRequest<'_>> {
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
+}
+
+/// Allocates the PCI interrupt vectors for the subtrees in `serviced`.
+///
+/// Requests MSI-X entries `0` through the highest subtree in `serviced`, since an allocation
+/// cannot be sparse, and falls back to a single MSI message for the whole tree.
+///
+/// # Errors
+///
+/// `EINVAL` if `serviced` is empty. Otherwise, when neither type could be allocated, the error
+/// from the MSI request.
+pub(crate) fn alloc_vectors(
+    pdev: &pci::Device<Bound>,
+    serviced: SubtreeSet,
+) -> Result<SubtreeVectors<'_>> {
+    if serviced.is_empty() {
+        return Err(EINVAL);
+    }
+
+    let entries = serviced.span();
+
+    let (vectors, msi_type) = pdev
+        .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
+        .map(|vectors| (vectors, MsiType::MsiX))
+        .or_else(|_| {
+            pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())
+                .map(|vectors| (vectors, MsiType::Msi))
+        })?;
+
+    Ok(SubtreeVectors {
+        vectors,
+        serviced,
+        msi_type,
+    })
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 5c7829ea3bc5..2583b006019e 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -1,22 +1,40 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! Vector addressing in the GIN CPU interrupt tree.
+//! The GIN CPU interrupt tree for one PCIe function.
 //!
 //! A [`GinVector`] names an interrupt source, a [`LeafIndex`] the leaf register that latches it,
-//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] one `TOP` bit. The types
-//! keep the four from being confused with one another.
+//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] one `TOP` bit.
+//!
+//! Servicing a leaf requires reading its pending bits before clearing them. Only
+//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`LeafPending`] clears a leaf,
+//! so the wrong order does not compile. Nothing in this module serializes access to the tree.
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
 use kernel::{
+    io::{
+        register::Array,
+        Io, //
+    },
     num::Bounded,
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
+        PciIrqRearmMethod, //
+    },
+    regs::*,
+    SubtreeVectors, //
+};
 
 /// Number of vectors one leaf register carries, one per bit.
 const VECTORS_PER_LEAF: u32 = u32::BITS;
@@ -78,6 +96,11 @@ pub(super) const fn subtree_set(self) -> SubtreeSet {
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
@@ -130,7 +153,7 @@ fn from(vectors: LeafMask) -> Self {
 ///
 /// Exactly one bit is set.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct Subtree(u32);
+pub(crate) struct Subtree(u32);
 
 impl Subtree {
     /// Returns the subtree at index `idx`.
@@ -151,7 +174,7 @@ pub(super) const fn into_raw(self) -> u32 {
 
 /// Set of subtrees, one bit per subtree, in the layout of the `TOP` registers.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct SubtreeSet(u32);
+pub(crate) struct SubtreeSet(u32);
 
 impl SubtreeSet {
     pub(super) const fn contains(self, subtree: Subtree) -> bool {
@@ -250,3 +273,218 @@ fn from(vector: GinVector) -> Self {
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
+/// The CPU tree of one PCIe function, and the subtrees that nova-core services.
+pub(super) struct Tree<'a> {
+    bar: Bar0<'a>,
+    leaves: LeafCount,
+    serviced: SubtreeSet,
+    rearm: PciIrqRearmMethod,
+}
+
+impl<'a> Tree<'a> {
+    /// Creates the tree of `chipset`, covering the subtrees that `vectors` services.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `chipset` does not implement every subtree that `vectors` services.
+    pub(super) fn new(
+        bar: Bar0<'a>,
+        chipset: Chipset,
+        vectors: &SubtreeVectors<'_>,
+    ) -> Result<Self> {
+        let hal = cpu_interrupt_hal(chipset);
+        let leaves = hal.leaf_count();
+        let serviced = vectors.serviced;
+
+        if serviced.intersection(leaves.subtree_set()) != serviced {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            bar,
+            leaves,
+            serviced,
+            rearm: hal.pci_irq_rearm_method(vectors.msi_type),
+        })
+    }
+
+    /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the one subtree that
+    /// the calling handler serves.
+    ///
+    /// A handler must call this before returning, or it receives no further interrupts.
+    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
+        self.rearm.rearm(self.bar, self.serviced, subtree);
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
+    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'a> {
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
+    /// Latches `vector` as its own source would.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if this tree does not implement `vector`.
+    // The interrupt self-test is the only caller.
+    #[expect(dead_code)]
+    pub(super) fn trigger(&self, vector: GinVector) -> Result {
+        vector.validate(self.leaves)?;
+        self.bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER::zeroed().with_vector(vector),
+        );
+
+        Ok(())
+    }
+
+    /// Disables every vector in every implemented leaf, including the subtrees that nova-core does
+    /// not service. Call this only during probe.
+    pub(super) fn disable_all_leaves(&self) {
+        for leaf in self.leaves.iter() {
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
+        for leaf in self.leaves.iter() {
+            self.read_pending(leaf).clear();
+        }
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
+pub(super) struct TopEnableGuard<'a> {
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

