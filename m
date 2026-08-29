Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF21DDA18
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967218; cv=fail; b=C1MekCCQ+sW52ATYPw7iME9SRl+7weAZp6ouip0Wu2NyiT5Oc5DUN590GR1bClLwAX71vgbhIxcuFso+P8iDeY7I/dm9mOQc6SgdMRNhRKCd4YoRS93SfESDOTcJRWtH4/fmT7jJ1nKtzhlxmNVL+Ht/M5/kvT46mxE8Z3w1EzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967218; c=relaxed/simple;
	bh=w4sWyG+SxM6Q8F7vsIlgkiJHqvOFsKgcpBM7whEoVVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CrPPmTClR8YNyoV/l+iSHjAbGR+UBUxODsSNWsKvDWq4OPx93eRC8evB0opGWzSs0f1ikVFJpKYWX9GzU0qUInPXjJ5199SLTDtRonVMQYXz8wWeRGFz+bO5kN/hjhP4LA4m2FAfvcsz8W0oV5oYTwFrDi5lYjfPhKpXoypZl2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cpv60VHv; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cpv60VHv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD3BjaaWsEXHVXCeogcY6H2JBAuaup/1jnoyz+y3JuGCZLC9oapNEvftbphMps4bc0QcY0x84VkFr7lyuR/uHi6LaEN1bkXMHWVaEgo6S+piWWzNdOi/k87O33kVXzhMlSOam+Q4+gLLvlNiw2OS+vJHe6+QRmuQx3cIMW7Da8wDjM/5OK40tpgWPxQxM3NhU9NjqzoWbYSvS3778OHH3ZM+zc/4e92mCCxTM3hfgZ/3Qif4mAPrHvYs/cHfIxLPpHUGkLehfwHUX95FIuROGnmFpCqa5Dc/PLa9WE6uTu8zAbjCujDb03bLT4GtUQBk+3vx4ynH+y/1X37J4InaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOWkoMNv4jn5aRBD1G6M6IRId8wNLOa3O3Y/4Vsd3wY=;
 b=o8WUAN6fRJqCyejKwzscJ6PpM06eP5ZHdSUFt+3bKSCscoqu+mEzncGRJeWQDznAYyr3WK7BhWqDGk29NCFU/RprtDgJvxyCZbnFaeMeEgzAWuBrDzqRnJTqBEADzMNRYZx7ocjJ6DXDWFuUwGuft9FU45f0zs1IPxQy0SQ5N6KG7poweSUehkpe/5snNCJorpHs7LsMcYgsRDO8ANumkVGnv9WoUezuEVL6jkqq9dY7F8/ThobM2BPmPsGpRP3UQCOaW20y2f/cVmCASfiaRGeHUNQBzYZW6MN2OcDdWQyQbUCIohUKzgb+KhMa+O3FfdI1ATNJesuW8Qd4I2xYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOWkoMNv4jn5aRBD1G6M6IRId8wNLOa3O3Y/4Vsd3wY=;
 b=cpv60VHvhKnu7pUusTapZa5DhTQVKTzMBPCwbm+rhedOPgo50qjKKRLiyDwWHHxJZWoUJiKM3xJOb4ePNzedrKe6kaO252SyXUIVkHEAeOB3nCdpiJCd9ieZGZQlLNw0Mk0IAnmn7f8dmCKwDgbrfG14GnbTjoijC3nCMZhnUfm/1d+ok224+licVVKMBlWYI9V6v4QNCKGmZnWiiNuWkLvsEtW+UJip6MWWGhguHc3dBVyDRGh2CquzeFZcSHo07v4Uvlx+AvjEp2qVqqwIVq4F+uQm34VYiLO+Mxzen1YVlvcSUpW5mgv2vI48SiPv4fnsaOsQW5ZTIWm+42+Umg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:32 +0000
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
Subject: [PATCH v2 06/15] gpu: nova-core: add the GIN interrupt tree and allocate its vectors
Date: Fri, 28 Aug 2026 18:33:25 -0700
Message-ID: <20260829013324.499542-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d898e21-5b37-4462-1f03-08df056d88f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9IQIHpiFDD2dJY8xQU50mbEmjsamzBZ5x49OUDbuShCN0q+RBFs2pgwWRUa0/zJxk7pOTztSp3jlSYo4yTclkEy/sXgxOKdsfW1ZQbAK1Jfls5UlTodiLNF8xb30tlfVx2YmYK3mgfYP/45K4XkncOeMaAeThq6yen8+MLigLsRBoeAWumcsF5ub19JBIwUz/Mrl2MunDu/Cag/zQ45jHj6bH7DJcPpbsJOzg6i3msKbcuDYbN9s5q5MyQvpUuKcNC0S/cDEaoJ+1YxN3So6Ak+XGetbqHqjq+YlgDwkVrXMDUHVZT3OBU/QEXtueUux0R585+k94sv0aRpU/tamTGchFhJe02DBKGslgFxGA0OgGxD8RrgbaL+5cIgfoyQIB6TJt6eUtGyx09FQTOFVCeR5yoqRXYDSxzt92y/+qFCB21MlpJ/tfliafu2MB1whkv00xTI029+8DWxXXdMzmGHE0lKWempQjO830WeNQPRWwBiLZOXCDsUxgSan1nJy1ExX1fU5hdaVpg6a29ShaM/hcMA33JdLB3iipeL3QMQFPKfDedeo59/ljqJzhRnyRcG3nITBuJLOPsQQBwZIPP2Yfky0U5RxqmPLjNu2gETL/vBqMTdBWN0ZhTQDlc0kREdFp33T6Eok/W80gkjh42wWHq56HLUfYQ8W0o5CSb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSQ0pc5RmVUptZGnPEdtGj0i3fPXbCJWQZalULgTm6ZxMJkmddluJyHdhMkQ?=
 =?us-ascii?Q?efsFSCq2WO9Whf57V2hIVYYQSgl57HJx+xqkv+b41vWwF97piopDzsGe45bL?=
 =?us-ascii?Q?Jk827s4i29LXQuUR1RKSFYRx8A1sNXtt6MaQ4dXM+kQAb1u8mLxfxNiPQFkT?=
 =?us-ascii?Q?eLO3rVmlaVXETi+v7hK5xZiMPrNq1iQS3Ub/n5dAG/ezuVTVVCVxyRDMzWof?=
 =?us-ascii?Q?ZgV7g+TL0yo3Kh/blsQ/KrmiqgRBMosYgUQbd+9L9/XJAz8vuogn3U/K+LM7?=
 =?us-ascii?Q?BPaZleolFDrL17XX3Ti9R6eMsSbjjh600IsjspnTe6jbTPMOgE+NTHCsvN5l?=
 =?us-ascii?Q?owzzxBFMhJ5G8OSqhUcm1e7MqrzLtX8ala/y67215Qi3KQQTn1SDS9fVkiUc?=
 =?us-ascii?Q?ZL0UecDQMqDWu+53nKOgxKhfllYXM5MXVZw89j0zZzv1RCDvTkjowXWSAf9P?=
 =?us-ascii?Q?EqFXU/j2qUNufqv246cFx2ZYsFchw0ZFtyXvzqvXPxR6sCYdQbMocCXZVzjT?=
 =?us-ascii?Q?IJ+xt1+OIZKVcEleUbq5+VKT3jIbe24f6SjZzfWhEmtjLCfuQqvNsRW3sxpg?=
 =?us-ascii?Q?wUk8/1Ks0/JK2xOz4kKgvcNRUEb9xIPGPdFVGQjlROwCeQYCIvla4itleaZ7?=
 =?us-ascii?Q?JbZTLky22LODlnFfN+g4jK3ShQALm32NK1FgAmVCkUq6/ppC/dOr3txiPlV2?=
 =?us-ascii?Q?YaYblDv2B4VKuv89D5Kek677Cfa7Up9wGd9nDhhqZYOkqpFKnlQehcoWdbql?=
 =?us-ascii?Q?Zi+tSzZHfrhNYMqpMyO7yENMhDag94x6Wilh4gI+H91k3kXwgyG3jyvbiO5P?=
 =?us-ascii?Q?HvMb0n0nII1g0tJR86HB8qtX613qJD6Grfwic+2bzIyNfKQOmL4sC7HU34CP?=
 =?us-ascii?Q?yH3E4lF9+4mfQEDwRdrRt4b3saU3zzREvmcNMAOw34YoI5MTou4q/rZqEZ5S?=
 =?us-ascii?Q?YLl9a75OIFiP1sVIAkxh2Slw+rM47fhgATH+ps2hMxqUMjXFtOgU/qhuyG8q?=
 =?us-ascii?Q?gi370BpgLHQlf1tEsr2A+UYSqjRK5Cmnp+kuwAPLgs+j6NEKp3oqdTqkgBQg?=
 =?us-ascii?Q?kF4jYlIim487GsTGO6hXMCs3QDAo/o7za0LEXXY+xPD3TZRpBxjYjZJOhiZu?=
 =?us-ascii?Q?wwbNWvRYORMOYzap70Vg8ioQLZnQUDdZHiFl76lZXd4NvNffi8EojCMW9d/g?=
 =?us-ascii?Q?RnJFBzjYCR8/sgBrHR10+3ahvGCziRU5IkXoh691kwW9th/MLb8NSgDd7A5W?=
 =?us-ascii?Q?punLYh54J2B2W/4Az+8TSKFw/D8X0TRmFS2vPVHfffbbqoyL9Zy9QKTsDRQO?=
 =?us-ascii?Q?dyoGKHTddWmhum2GAjkzI12cMn6wfG2NCVucJ7wZG9YlLbMMzD+1ExgqC7s9?=
 =?us-ascii?Q?u5c814XvnQEU9MvluIrMSlpc6TuPV5OlyZ7hzN4rZfsRuBj6cBQaRbItmIgD?=
 =?us-ascii?Q?RStM3lrFnl2s4CaW4BzcpmEfvBJRd06nU0Xpr3az64n5acKEOxTS+NAiYGHu?=
 =?us-ascii?Q?TaaEJMUMdeUpH74mtgxyoO+YfPV/L4zYvvQvpuVfGWlNdj2TNTAaGMVGafUv?=
 =?us-ascii?Q?DnEoHpyMFMImSTgIpFDyyZzVZ1x4fy1GRRMKtcuMhZcqoxM3wAaND+eTltzR?=
 =?us-ascii?Q?auecbO3YDVMatCM0O3Ki5vHdQ1qao41YAjiF6S/mhAb2Ry7iaJ7cOPLCPCEW?=
 =?us-ascii?Q?6M+CySYF9wasTUE8H12LGMwJIY7TOU0vfnCgXAYfs4K6X6lWqa/z7RALkrC5?=
 =?us-ascii?Q?jS8ZvGHRHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d898e21-5b37-4462-1f03-08df056d88f0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:31.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1ZYUUt3O2mcKiF4onyTGricGequxZWhH96N64LQj58eDNnEEd02MZUUFO0f7ILhZry42toYsqlzKIpy7ankBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

From: Joel Fernandes <joelagnelf@nvidia.com>

Servicing a GIN leaf has a required order: read its pending bits, then
clear them. Clearing a leaf before reading it discards every vector
latched in it, and nothing reports the loss.

The driver must also allocate a PCI vector for every subtree it enables
at TOP, and register a handler on that vector. MSI-X gives each subtree
its own table entry. Linux masks every entry the driver did not
allocate. An enabled subtree with no entry of its own raises interrupts
that never arrive, and its leaf and TOP bits stay pending and enabled.
MSI instead has one message that the whole tree raises, so a single
entry serves every subtree.

Add an API for one PCIe function's CPU interrupt tree, in which reading
a leaf yields the handle that clears it. Size the vector allocation to
the serviced subtrees, requesting MSI-X entries up to the highest
serviced subtree and falling back to a single MSI rather than a shared
INTx line.

Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: name the module interrupt_tree with a Tree type that owns the
 BAR mapping, use the canonical NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*
 register names, express vectors, leaves and subtrees as newtypes, let
 the read of a leaf produce the handle that clears it, add the enable
 guards, take the leaf count and the rearm method from the interrupt
 HAL, and read every implemented leaf in drain() rather than descending
 from the TOP registers, which cannot see a vector that latched while
 disabled]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs                |  89 ++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 284 +++++++++++++++++++-
 2 files changed, 369 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 02ecfc47f4d0..c6bf1dbacabe 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -11,3 +11,92 @@
 mod hal;
 mod interrupt_tree;
 mod regs;
+
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
+use interrupt_tree::{
+    Subtree,
+    SubtreeSet, //
+};
+
+/// The PCI interrupt vector that delivers each serviced subtree.
+///
+/// MSI-X raises a separate table entry per subtree, so subtree `N` arrives on entry `N`. MSI has a
+/// single message that every subtree raises, so all of them arrive on the one allocated entry.
+pub(crate) struct SubtreeVectors<'a> {
+    vectors: pci::IrqVectorRegistration<'a>,
+    /// Every subtree nova-core services.
+    serviced: SubtreeSet,
+}
+
+impl SubtreeVectors<'_> {
+    /// Returns the interrupt type the PCI core selected for these vectors.
+    pub(crate) fn irq_type(&self) -> IrqType {
+        self.vectors.irq_type()
+    }
+
+    /// Returns an [`irq::IrqRequest`] for the vector that delivers `subtree`.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `subtree` is not one nova-core services.
+    pub(crate) fn request_for(&self, subtree: Subtree) -> Result<irq::IrqRequest<'_>> {
+        if !self.serviced.contains(subtree) {
+            return Err(EINVAL);
+        }
+
+        self.vectors
+            .index(entry_index(self.irq_type(), subtree))
+            .map(Into::into)
+    }
+}
+
+/// Returns the index of the allocated entry that `subtree` raises.
+///
+/// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one message from every subtree,
+/// and nova-core allocates a single entry for it. nova-core never allocates INTx.
+fn entry_index(irq_type: IrqType, subtree: Subtree) -> usize {
+    match irq_type {
+        IrqType::MsiX => crate::num::u32_as_usize(subtree.index()),
+        IrqType::Msi | IrqType::Intx => 0,
+    }
+}
+
+/// Allocates the interrupt vectors that the subtrees in `serviced` require.
+///
+/// Every subtree nova-core enables at `TOP` must have an allocated vector with a registered
+/// handler, or the interrupts it raises are lost. Linux masks every MSI-X entry a driver did not
+/// allocate, so the MSI-X request covers every entry up to the highest serviced subtree. A part
+/// whose MSI-X table is smaller than that falls back to a single MSI, which serves the whole tree.
+/// nova-core does not fall back to a shared INTx line.
+///
+/// # Errors
+///
+/// `EINVAL` if `serviced` is empty. The error from the MSI request if neither type can be
+/// allocated.
+pub(crate) fn alloc_vectors(
+    pdev: &pci::Device<Bound>,
+    serviced: SubtreeSet,
+) -> Result<SubtreeVectors<'_>> {
+    if serviced.is_empty() {
+        return Err(EINVAL);
+    }
+
+    // One entry per subtree up to and including the highest serviced one.
+    let entries = serviced.span();
+
+    let vectors = match pdev.alloc_irq_vectors(entries, entries, IrqType::MsiX.into()) {
+        Ok(vectors) => vectors,
+        Err(_) => pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())?,
+    };
+
+    Ok(SubtreeVectors { vectors, serviced })
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index da24f3d35893..523b26d55137 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -1,17 +1,49 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! Vector addressing in the GIN CPU interrupt tree.
+//! The GIN CPU interrupt tree for one PCIe function.
 //!
 //! A vector's number fixes where it latches: leaf `vector / 32` at bit `vector % 32`, and that
 //! leaf belongs to subtree `vector / 64`. The types here keep those three views apart, so a leaf
 //! index, a set of vectors within one leaf, and a `TOP` bit cannot stand in for one another.
+//!
+//! Servicing a leaf has a required order: read its pending bits, then clear them. Clearing a leaf
+//! before reading it discards every vector latched in it, and nothing reports the loss. Only
+//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`LeafPending`] can clear, so the
+//! wrong order does not compile.
+//!
+//! Serializing access to the tree is the caller's responsibility.
 
 use kernel::{
+    io::{
+        register::Array,
+        Io, //
+    },
     num::Bounded,
+    pci::IrqType,
     prelude::*, //
 };
 
+use crate::{
+    driver::Bar0,
+    gpu::Chipset, //
+};
+
+use super::{
+    hal::{
+        cpu_interrupt_hal,
+        PciIrqRearmMethod, //
+    },
+    regs::{
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF as CPU_INTR_LEAF,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR as CPU_INTR_LEAF_EN_CLEAR,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET as CPU_INTR_LEAF_EN_SET,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER as CPU_INTR_LEAF_TRIGGER,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR as CPU_INTR_TOP_EN_CLEAR,
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET as CPU_INTR_TOP_EN_SET, //
+    }, //
+};
+
 /// Index of a leaf register, bounded to the `0..16` range covered by the leaf register arrays.
 pub(super) type LeafIndex = Bounded<usize, 4>;
 
@@ -97,7 +129,7 @@ pub(super) const fn contains(self, other: Self) -> bool {
 ///
 /// Exactly one bit is set.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct Subtree(u32);
+pub(crate) struct Subtree(u32);
 
 impl Subtree {
     /// Returns this subtree's index within the tree.
@@ -115,7 +147,7 @@ pub(super) const fn into_raw(self) -> u32 {
 
 /// Set of subtrees, one bit per subtree, in the layout the `TOP` enable registers take.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct SubtreeSet(u32);
+pub(crate) struct SubtreeSet(u32);
 
 impl SubtreeSet {
     /// Returns whether `subtree` belongs to this set.
@@ -199,7 +231,7 @@ pub(super) const fn subtree(self) -> Subtree {
     /// # Errors
     ///
     /// `EINVAL` if the vector lies beyond the last leaf such a tree implements.
-    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
+    pub(super) fn validate(self, leaves: LeafCount) -> Result {
         if self.0 >= leaves.vector_count() {
             return Err(EINVAL);
         }
@@ -207,3 +239,247 @@ pub(super) const fn validate(self, leaves: LeafCount) -> Result {
         Ok(())
     }
 }
+
+/// Returns the leaves that subtree `index` covers.
+///
+/// An index beyond the leaf register arrays yields nothing rather than panicking.
+fn subtree_leaves(index: u32) -> impl Iterator<Item = LeafIndex> {
+    let first = index * LEAVES_PER_SUBTREE;
+
+    (first..first + LEAVES_PER_SUBTREE)
+        .filter_map(|leaf| LeafIndex::try_new(crate::num::u32_as_usize(leaf)))
+}
+
+/// The GIN CPU interrupt tree for a single PCIe function.
+pub(super) struct Tree<'a> {
+    /// Borrowed BAR0, through which every tree register is reached.
+    bar: Bar0<'a>,
+    /// Number of leaves this tree implements.
+    leaves: LeafCount,
+    /// The subtrees this tree enables and services.
+    serviced: SubtreeSet,
+    /// Method that rearms PCI interrupt delivery, or `None` if the interrupt type needs no rearm
+    /// write.
+    rearm: Option<PciIrqRearmMethod>,
+}
+
+impl<'a> Tree<'a> {
+    /// Creates a `Tree` for `chipset` covering `serviced`, with the rearm method that `irq_type`
+    /// requires.
+    ///
+    /// Each serviced subtree must have an allocated PCI vector and a registered handler, which
+    /// [`super::alloc_vectors`] sizes the allocation for. Subtrees the architecture does not
+    /// implement are dropped.
+    pub(super) fn new(
+        bar: Bar0<'a>,
+        chipset: Chipset,
+        irq_type: IrqType,
+        serviced: SubtreeSet,
+    ) -> Self {
+        let hal = cpu_interrupt_hal(chipset);
+        let leaves = hal.leaf_count();
+
+        Self {
+            bar,
+            leaves,
+            serviced: serviced.intersection(leaves.subtree_set()),
+            rearm: hal.pci_irq_rearm_method(irq_type),
+        }
+    }
+
+    /// Returns the subtrees this tree services.
+    pub(super) fn serviced(&self) -> SubtreeSet {
+        self.serviced
+    }
+
+    /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the one subtree the
+    /// calling handler serves.
+    ///
+    /// A handler must call this before it returns, or it receives no further interrupts.
+    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
+        if let Some(method) = self.rearm {
+            method.rearm(self.bar, self.serviced, subtree);
+        }
+    }
+
+    /// Enables this tree's serviced subtrees (`TOP_EN_SET`).
+    pub(super) fn enable_top(&self) {
+        self.bar
+            .write(CPU_INTR_TOP_EN_SET, self.serviced.into_raw().into());
+    }
+
+    /// Disables this tree's serviced subtrees (`TOP_EN_CLEAR`).
+    pub(super) fn disable_top(&self) {
+        self.bar
+            .write(CPU_INTR_TOP_EN_CLEAR, self.serviced.into_raw().into());
+    }
+
+    /// Enables this tree's serviced subtrees until the returned guard drops.
+    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'_> {
+        self.enable_top();
+
+        TopEnableGuard { tree: self }
+    }
+
+    /// Enables the vectors set in `vectors` for `leaf` (`LEAF_EN_SET`).
+    ///
+    /// This is the per-vector counterpart of [`Self::enable_top`], which enables whole subtrees.
+    pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        if let Some(loc) = CPU_INTR_LEAF_EN_SET::try_at(leaf.get()) {
+            self.bar.write(loc, vectors.into_raw().into());
+        }
+    }
+
+    /// Disables the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
+    pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        if let Some(loc) = CPU_INTR_LEAF_EN_CLEAR::try_at(leaf.get()) {
+            self.bar.write(loc, vectors.into_raw().into());
+        }
+    }
+
+    /// Enables `vectors` for `leaf` until the returned guard drops.
+    pub(super) fn enable_leaf_guarded(
+        &self,
+        leaf: LeafIndex,
+        vectors: LeafMask,
+    ) -> LeafEnableGuard<'_> {
+        self.enable_leaf(leaf, vectors);
+
+        LeafEnableGuard {
+            tree: self,
+            leaf,
+            vectors,
+        }
+    }
+
+    /// Reads the vectors pending in `leaf`.
+    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'_> {
+        let pending = CPU_INTR_LEAF::try_at(leaf.get())
+            .map(|loc| self.bar.read(loc).into_raw())
+            .unwrap_or(0);
+
+        LeafPending {
+            tree: self,
+            leaf,
+            pending: LeafMask::from_raw(pending),
+        }
+    }
+
+    /// Injects a software interrupt for `vector` via the trigger register.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `vector` lies outside this tree. `EOVERFLOW` if `vector` does not fit in the
+    /// trigger register's vector field.
+    // Only the interrupt self-test injects a software interrupt.
+    #[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
+    pub(super) fn trigger(&self, vector: GinVector) -> Result {
+        vector.validate(self.leaves)?;
+        self.bar
+            .write_reg(CPU_INTR_LEAF_TRIGGER::zeroed().try_with_vector(vector.into_raw())?);
+
+        Ok(())
+    }
+
+    /// Disables every vector in every implemented leaf (`LEAF_EN_CLEAR`).
+    ///
+    /// Boot, or a driver that ran before this one, can leave leaf enables set for vectors
+    /// nova-core does not service, and such a vector delivers to nova-core's handler once its
+    /// subtree is enabled.
+    ///
+    /// This clears enables outside the subtrees nova-core services, so it is a probe-time
+    /// operation only.
+    pub(super) fn disable_all_leaves(&self) {
+        for index in 0..self.leaves.into_raw() {
+            if let Some(leaf) = LeafIndex::try_new(index) {
+                self.disable_leaf(leaf, LeafMask::all());
+            }
+        }
+    }
+
+    /// Clears every pending bit in every implemented leaf.
+    ///
+    /// Disables this tree's serviced subtrees at `TOP` across the walk, then enables them,
+    /// whatever their state on entry. The leaves cleared reach subtrees the driver does not
+    /// service, and the `TOP_EN` writes do not.
+    ///
+    /// Call `drain()` only during probe. It must not run concurrently with an interrupt handler.
+    pub(super) fn drain(&self) {
+        self.disable_top();
+
+        // `TOP` summarizes enabled leaf bits, so a vector that latched while it was disabled does
+        // not appear there.
+        for index in 0..self.leaves.subtree_count() {
+            for leaf in subtree_leaves(index) {
+                let pending = self.read_pending(leaf);
+                if !pending.vectors().is_empty() {
+                    pending.clear();
+                }
+            }
+        }
+
+        self.enable_top();
+    }
+}
+
+/// The vectors read pending from one leaf.
+///
+/// Holding one is the proof that the leaf was read, which is what [`Self::clear`] and
+/// [`Self::clear_vectors`] require.
+pub(super) struct LeafPending<'a> {
+    tree: &'a Tree<'a>,
+    leaf: LeafIndex,
+    pending: LeafMask,
+}
+
+impl LeafPending<'_> {
+    /// Returns the vectors that were pending.
+    pub(super) fn vectors(&self) -> LeafMask {
+        self.pending
+    }
+
+    /// Clears every vector that was pending, by writing its bits back (write-1-to-clear).
+    pub(super) fn clear(&self) {
+        self.clear_vectors(self.pending);
+    }
+
+    /// Clears the vectors set in `vectors` (write-1-to-clear), leaving every other pending bit
+    /// set.
+    ///
+    /// A handler that services one vector uses this rather than [`Self::clear`], which clears
+    /// every vector the leaf had pending.
+    pub(super) fn clear_vectors(&self, vectors: LeafMask) {
+        if !vectors.is_empty() {
+            if let Some(loc) = CPU_INTR_LEAF::try_at(self.leaf.get()) {
+                self.tree.bar.write(loc, vectors.into_raw().into());
+            }
+        }
+    }
+}
+
+/// Keeps a leaf's vectors enabled for as long as it is held.
+///
+/// Dropping it disables the same vectors, so an error path cannot leave a source enabled with no
+/// handler behind it.
+pub(super) struct LeafEnableGuard<'a> {
+    tree: &'a Tree<'a>,
+    leaf: LeafIndex,
+    vectors: LeafMask,
+}
+
+impl Drop for LeafEnableGuard<'_> {
+    fn drop(&mut self) {
+        self.tree.disable_leaf(self.leaf, self.vectors);
+    }
+}
+
+/// Keeps a tree's serviced subtrees enabled at `TOP` for as long as it is held.
+pub(super) struct TopEnableGuard<'a> {
+    tree: &'a Tree<'a>,
+}
+
+impl Drop for TopEnableGuard<'_> {
+    fn drop(&mut self) {
+        self.tree.disable_top();
+    }
+}
-- 
2.55.0

