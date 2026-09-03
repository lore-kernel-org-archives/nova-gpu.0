Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD5364E80
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405341; cv=fail; b=bfwEwrXskoosAuxZzyCF3N7NVgmxQqnQ2uP13bx++/zJpFh9j7RPonZUDFHH3dzyOXlZjMxuyMwaIgMuJH9FIJvjDD3I+CHSno5grZXZ3rvtxn3IhhKcJwdSTxa6+zk9Te5FT/k2/RPVKhFz+q10iuD+MeMQpQRjiBZgAWBsr/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405341; c=relaxed/simple;
	bh=MY30eNGtjWkcQDDgdObkpfKys/WRo7YOpD1yjYJHjQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iAzqHsd5rGm328/SHL4/xXUHslyumvQDXVYz8PTE5Si2bWrIeRaztCP8e5FJTipZF02E62YF2Wjx6OLOE33Ttw1IOna/7s+18xPil8+xVa5GFcJku8zh8sJ5RFzM4emAiwD+XiLy0VQJ75BEj41yDv13GKClbSscfHLBnOvim88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uhIMI9Bg; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uhIMI9Bg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7hhIxtmK6ZdFrb2SxT4Y2W/Rwlr2t9IR4zHuQXmSgPzCaFHRKm8y3gL/mAgahmnd/50gFnpfIcWjFODms5aCXc1lJF8CNNF1bRvszCxBzc/Y3X0OurXoGaSosgPrwPv3LK3Lvw2sT4GRCPyAVA9xkh7tQWKk91Z1zkxTWj26/3vhdyJ+REYU2sqK/4K4v5z89ySoHr2mCTuUY+uFLC4HIFmhBWn59OMJLaAVyz2KghjRRFuTWt+/YhExe1l3eTBuSOKYanmFJ+BbynxPQZdMTqoCCTioDJkp5sP6d7FFWqGF87u8b7RNVu2fqODZWGYWc2BYzls37aDAZU+Cl9MrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxxxT3H5QFYg9jSerL7EjghzHTsRmGNKX/NkXvyKkYk=;
 b=X7ULnRFOvdAiZ9/58q/ZnJq1BAapMmdB6XeOuiGKE8HwHQg4RiLPgqb93CVufhaFUStX4X9V7/BHoqwUfKrb88p/5RZIB7W9GTj3+NUIaeN2L1kfUaN/2VzRJgRB6CYDF4GnUXr3nvyWB1w9TEFeuO9XjIAFDpytADBuBIsEJ6GAwElyP+lyKeqALeFroJ2c+VkWCSYaIrwo6AkRSZyJJoB6uOF7u3oBALFgSYpDezvEAK1bGA+AmhFv1DQgvJTVYZvwwBLgtuARGKNeNGTRg8BrWs6fts1Cw33cEnk/3Xc5oHbu8xRA3MCN3l0qfOFXuWnTwiHkhoJF1Bj2lDNATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxxxT3H5QFYg9jSerL7EjghzHTsRmGNKX/NkXvyKkYk=;
 b=uhIMI9BgzK+jn6Nd5Y3Bjp3QpUEWqMf5I2k2vc6v+lkt3fgJC+EE1h4RUA1WP5hhWoN+qW2Unidza8rbm5Iev46FrKeZHxv0N2xym6TosWAbE86SgvYKrllsLnuCyEE0dEjVjhwyeTDmpa2Kdd514t4n0yXHAa5rSF49NiBALJ2Kw57gd0VLkEPOBsae7LXgLXLbbhhAlXLbHKPG3bou1jhi64eMWNoB5kqwH5+hpbNL2io32avOD9oBDNa488ZgWQG2tEZYD02CnjmPayOzYLEEYksPuDSa8cZd+rMk+s/3OVQabNhFtYvEUbF7cPjDOKEe41c5OnYAVOTN3dJ1Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:25 +0000
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
Subject: [PATCH v3 06/14] gpu: nova-core: add the GIN interrupt tree and allocate its vectors
Date: Wed,  2 Sep 2026 20:15:05 -0700
Message-ID: <20260903031514.1515905-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: fe73c6f0-4323-4ab4-01eb-08df09699909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	bBcRN58l1pPziDvxuiV37zCDwsGqkZTXJB2Ckc89WlJ7DFfZzxf4ui9H59F6CC3cI1X4UcKG0fWD0YmVMAsFvBWMNLT0cuu/9gyb710z1vIgSjv8qJiFehqOO8Vv9vMKIE1Pcxp5mYXEmGRBrEkp6kt14SRZGDrv4UWONBsk3EKR+tyN+1roRfLEOQCV3SBj3fhGynOH2IAArMLii+rZUogSudJcT0zw+BZ60xZk4FS2AUH0DwOz5I74LSUSWYvntvbpYwsnTcuF5mVc92JwQ8H/0/RccTkcZRwlk1Xju2Fdb2mQHbxxqknH/ivSCp4wXRVyS94+xYjLX3tu7Ae4kk0t8hp2EeZAaEBm2TOTIqgLiLR4xjSRtS3B2aEbjVG8w11OYpnp0RPctS+Bemlrp5P1uYUaUYyXIRcYpI4lcPgt+Yt7z6wXNdt3SfEXZlMgK2W8vx74H6Gt9dWOBZY9oCLC5Pb7x7fGhGY2yviX/iRL4nev5mNHmPE1MfcncRJ5jhTVYANMosP7VC0Vf9RSxb4esxi8j1BCY6CyTbjxN5y/QFBp0ws4GdL0mLPHxXh2zJj55dH3y31UlVG8Y38H0GWR0sU11tavCLrSwxf5OTtyDDXupmPNlCGBUX3El4+s7eaZvgMKd4KVc7pJHrAEbUiTRRSK1yMsgRDux2Uz5W4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ecctG0O44RktHRcm7gSoVgIYgkAwTJ9k4SEdc2my8UASVLzpyW3wP2rgcx9?=
 =?us-ascii?Q?aJXaZEc6mfX2I+DMNBGnCImRjxLPfaxM83pIYZ+T6dTx1iML/BJBtmM1ooci?=
 =?us-ascii?Q?bnutczJCDx6zs+ZKKKI828hy8HNLFbwxros14jp7yUBNb+RJeqzRod5++8E0?=
 =?us-ascii?Q?+i7HIeMDTFhuWgC489GNEdVjJFqXKLH/X9t8zjDLvn/wTyBdI9zqZ8RbOdLN?=
 =?us-ascii?Q?gvX8VSF30G7XpSXgk23r4gL0GYtAZmIrj/Y7dWWwq1aSEU+rj8l5OkNsrntP?=
 =?us-ascii?Q?po+YbrW3mYEYzSVIRU1sYGoFiUI992j5KRjI+sJVrFR7Hn8/LB82kK6ZOn87?=
 =?us-ascii?Q?yalXFQkwaec8BHZX7hgRBhk7wyS2JcisuWqd8yWeP9tthM+wPT0Ib4U6WrJU?=
 =?us-ascii?Q?9mfn9M85Bc10G4UJm37+Dw0/dH1ex3uOlclOhNZckPdg/RK+2CstfX+XbNaJ?=
 =?us-ascii?Q?69XoZtxckYdoQKyNXef8mdz/DmEMF/j1PI38ZxFIoxa+1TsjFEQ3eaJzY0ZP?=
 =?us-ascii?Q?fr2bTpGZgNNBdMv4DHhgAwffYfJ9uDRvtSPzL2RhYQda1vYZucGu4B5oR6I1?=
 =?us-ascii?Q?dy96GOku/NUGjcevYo3l4PQabLry9cS7SQJfZN48VGJx42zNlci5P/gpeB3/?=
 =?us-ascii?Q?Dew3rI9Fyf+Ux7tgfeIXM3CfVNQ8BQOm/q5ZrLr5murD3KeTlAVgw51klZGn?=
 =?us-ascii?Q?sWZvQGiUr0Zyv9Sp+woQD5d+clTL2Y95hEurpW7OSp028iHRe8hVERzrrGZi?=
 =?us-ascii?Q?dQEHlr7fGPm8/M9TSPvXvuZ1zIK7XFCz2iNsC5gmXlGSApvqwj4LVFdchgeV?=
 =?us-ascii?Q?BBhPgk3IQpeYatVfE0LO+hG03+les9RQyaOX/RDDjvC9k0knGY4jN01UrZ/m?=
 =?us-ascii?Q?nCMdZI7xuEktmFhKsjLRFuDym02Z0djOHDuDsk7v99uT5Ax1nx6MBGKgNEnV?=
 =?us-ascii?Q?06zTUq6afkH8jrjr8ZveoSg6kV3FkQ9rfCZFXSceUELnTRrwDlbeo3JLNYxm?=
 =?us-ascii?Q?ua278W2uX24V2Wa2Hu4/wDxegYy3cS1KS8NpLFzUHZIwH385gQFBz1PK7pUi?=
 =?us-ascii?Q?UJipcqDdT8EVbrMPYjSuyDN47P0/gyYOaGJh/GgKl+/LXrh+CmNcg+XApQz6?=
 =?us-ascii?Q?frFrGJ8JLLVvFaj9sO7USffRskgItQig69ee4GkDdMzc660J+CoV3XSmn90d?=
 =?us-ascii?Q?D9ZRE++LnOiMvR0AcKWO8H5ZjX2WOd38psg+fS0YIzYA/gvQk2ETZKQW19Yp?=
 =?us-ascii?Q?oClR57wh9IwiR9MfV5Ge+0SDbypLuezF64Q7JGXGUFxi/CbXUB9PEtoOrE3d?=
 =?us-ascii?Q?NQMsQra6TKscVdfRFhbYVt2YkXa+JPcdE+m7yY/eBvZFpKSPB2E4retXgNvN?=
 =?us-ascii?Q?cJLCU3kXeN87Lnb13dcJMTniOaANfhTdYtxaLsiYq7izuGsHj50bQdhn/PlN?=
 =?us-ascii?Q?QtZWeRxo95LIwkpdKBKgVo03J+nsIoTteFADE5bReRFPrU7/URyruXrBeEFe?=
 =?us-ascii?Q?9z1SvY72hVCFDdvKj2zQWjvkFhXg8QxXiuKqvk4rCaeAITAU75jcfV9tVUod?=
 =?us-ascii?Q?wDNiO9cElDBn29Z8B+awoM/913vS7QaQUH0hGPNP9IicqdLqSLlzc1MwH4Ju?=
 =?us-ascii?Q?ZXuMhpTVLv4wqBfa1YjjwgHy5HiC8wG8Zg2oRYznPpyMc4QL96aHxQbtwX99?=
 =?us-ascii?Q?K6eq0o11vXPXQzmZJ8p5885b6zuPqqsqD7CMvbVJMvEhvaMCWI4dHvrVNg57?=
 =?us-ascii?Q?TlJ5ZwoHvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe73c6f0-4323-4ab4-01eb-08df09699909
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:25.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayy6RJIDvzL7w94zz+mhdpvaVnsCTXeWQRTi7vyeN8aLRW0be4gSinPduEKRnbY5wO6qGNEMxcIukgLAG0UTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

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
a leaf yields the handle that clears it, and building a tree fails if it
names a subtree the architecture does not implement. Size the vector
allocation to the serviced subtrees, requesting MSI-X entries up to the
highest serviced subtree and falling back to a single MSI rather than a
shared INTx line.

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
 drivers/gpu/nova-core/irq.rs                |  95 +++++++
 drivers/gpu/nova-core/irq/hal.rs            |   8 +-
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 291 +++++++++++++++++++-
 3 files changed, 386 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index d21dee1b89a0..f6ba883d72c5 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -12,6 +12,23 @@
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
 /// The message-signaled interrupt type a vector allocation obtained.
 ///
 /// nova-core allocates MSI-X or MSI and nothing else, so the level-triggered INTx that
@@ -24,3 +41,81 @@ pub(crate) enum MsiType {
     /// One table entry per subtree.
     MsiX,
 }
+
+/// The PCI interrupt vector that delivers each serviced subtree.
+///
+/// MSI-X raises a separate table entry per subtree, so subtree `N` arrives on entry `N`. MSI has a
+/// single message that every subtree raises, so all of them arrive on the one allocated entry.
+pub(crate) struct SubtreeVectors<'a> {
+    vectors: pci::IrqVectorRegistration<'a>,
+    /// Every subtree nova-core services.
+    serviced: SubtreeSet,
+    /// The type [`alloc_vectors`] obtained, which fixes both the entry each subtree raises and the
+    /// rearm write its handler owes.
+    msi_type: MsiType,
+}
+
+impl SubtreeVectors<'_> {
+    /// Returns the interrupt type these vectors were allocated as.
+    pub(crate) fn msi_type(&self) -> MsiType {
+        self.msi_type
+    }
+
+    /// Returns an [`irq::IrqRequest`] for the vector that delivers `subtree`.
+    ///
+    /// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one message from every
+    /// subtree, and nova-core allocates a single entry for it.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `subtree` is not one nova-core services.
+    pub(crate) fn request_for(&self, subtree: Subtree) -> Result<irq::IrqRequest<'_>> {
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
+/// Allocates the interrupt vectors that the subtrees in `serviced` require.
+///
+/// Every subtree nova-core enables at `TOP` must have an allocated vector with a registered
+/// handler, or the interrupts it raises are lost. Linux masks every MSI-X entry a driver did not
+/// allocate, so the MSI-X request covers every entry up to the highest serviced subtree. A part
+/// whose MSI-X table is smaller than that falls back to a single MSI, which serves the whole tree.
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
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
index 1ea677e37e56..07604458dbbb 100644
--- a/drivers/gpu/nova-core/irq/hal.rs
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -25,7 +25,7 @@
         Subtree,
         SubtreeSet, //
     },
-    regs,
+    regs::*,
     MsiType, //
 };
 
@@ -63,7 +63,7 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree)
         let subtrees = match self {
             // The written value is ignored, so any write rearms delivery.
             Self::ConfigMirrorEoi => {
-                bar.write(regs::NV_XVE_CYA_2, 0u32.into());
+                bar.write(NV_XVE_CYA_2, 0u32.into());
                 return;
             }
             Self::TopEnableCycleServiced => serviced,
@@ -71,10 +71,10 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtree: Subtree)
         };
 
         bar.write_reg(
-            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(subtrees),
         );
         bar.write_reg(
-            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(subtrees),
         );
     }
 }
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 5aa447cf0ec4..0b4dc2fc8ea8 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -1,18 +1,42 @@
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
     prelude::*, //
 };
 
-use crate::num;
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    num, //
+};
+
+use super::{
+    hal::{
+        cpu_interrupt_hal,
+        PciIrqRearmMethod, //
+    },
+    regs::*,
+    MsiType, //
+};
 
 /// Number of bits a leaf index occupies, covering the `0..16` leaf register arrays.
 const LEAF_INDEX_BITS: u32 = 4;
@@ -113,7 +137,7 @@ pub(super) const fn contains(self, other: Self) -> bool {
 ///
 /// Exactly one bit is set.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct Subtree(u32);
+pub(crate) struct Subtree(u32);
 
 impl Subtree {
     /// Returns this subtree's index within the tree.
@@ -131,7 +155,7 @@ pub(super) const fn into_raw(self) -> u32 {
 
 /// Set of subtrees, one bit per subtree, in the layout the `TOP` enable registers take.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-pub(super) struct SubtreeSet(u32);
+pub(crate) struct SubtreeSet(u32);
 
 impl SubtreeSet {
     /// Returns whether `subtree` belongs to this set.
@@ -240,3 +264,262 @@ fn from(vector: GinVector) -> Self {
         vector.0.extend()
     }
 }
+
+/// Clears the enables of the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
+///
+/// Shared by [`Tree::disable_leaf`] and by [`LeafEnableGuard`]'s [`Drop`], which has no tree to
+/// reach through.
+fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
+    bar.write(
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::at(*leaf),
+        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_vectors(vectors),
+    );
+}
+
+/// Clears the `TOP` enables of every subtree in `serviced` (`TOP_EN_CLEAR`).
+fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
+    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with_subtrees(serviced));
+}
+
+/// Clears the pending vectors set in `vectors` for `leaf` (write-1-to-clear).
+fn clear_leaf_pending(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
+    if !vectors.is_empty() {
+        bar.write(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::at(*leaf),
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::zeroed().with_vectors(vectors),
+        );
+    }
+}
+
+/// Returns every leaf a tree of `leaves` leaves implements.
+fn implemented_leaves(leaves: LeafCount) -> impl Iterator<Item = LeafIndex> {
+    (0..leaves.into_raw()).filter_map(LeafIndex::try_new)
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
+    /// Method that rearms PCI interrupt delivery.
+    rearm: PciIrqRearmMethod,
+}
+
+impl<'a> Tree<'a> {
+    /// Creates a `Tree` for `chipset` covering `serviced`, with the rearm method that `msi_type`
+    /// requires.
+    ///
+    /// Each serviced subtree must have an allocated PCI vector and a registered handler, which
+    /// [`super::alloc_vectors`] sizes the allocation for.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `serviced` names a subtree this architecture does not implement. Such a subtree
+    /// has no `TOP` bit, so nothing would deliver the vectors behind it.
+    pub(super) fn new(
+        bar: Bar0<'a>,
+        chipset: Chipset,
+        msi_type: MsiType,
+        serviced: SubtreeSet,
+    ) -> Result<Self> {
+        let hal = cpu_interrupt_hal(chipset);
+        let leaves = hal.leaf_count();
+
+        if serviced.intersection(leaves.subtree_set()) != serviced {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            bar,
+            leaves,
+            serviced,
+            rearm: hal.pci_irq_rearm_method(msi_type),
+        })
+    }
+
+    /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the one subtree the
+    /// calling handler serves.
+    ///
+    /// A handler must call this before it returns, or it receives no further interrupts.
+    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
+        self.rearm.rearm(self.bar, self.serviced, subtree);
+    }
+
+    /// Enables this tree's serviced subtrees (`TOP_EN_SET`).
+    pub(super) fn enable_top(&self) {
+        self.bar.write_reg(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(self.serviced),
+        );
+    }
+
+    /// Disables this tree's serviced subtrees (`TOP_EN_CLEAR`).
+    pub(super) fn disable_top(&self) {
+        clear_top_enables(self.bar, self.serviced);
+    }
+
+    /// Enables this tree's serviced subtrees until the returned guard drops.
+    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'a> {
+        self.enable_top();
+
+        TopEnableGuard {
+            bar: self.bar,
+            serviced: self.serviced,
+        }
+    }
+
+    /// Enables the vectors set in `vectors` for `leaf` (`LEAF_EN_SET`).
+    ///
+    /// This is the per-vector counterpart of [`Self::enable_top`], which enables whole subtrees.
+    pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        self.bar.write(
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET::at(*leaf),
+            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET::zeroed().with_vectors(vectors),
+        );
+    }
+
+    /// Disables the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
+    pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
+        clear_leaf_enables(self.bar, leaf, vectors);
+    }
+
+    /// Enables `vectors` for `leaf` until the returned guard drops.
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
+    /// Reads the vectors pending in `leaf`.
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
+    /// Injects a software interrupt for `vector` via the trigger register.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `vector` lies outside this tree.
+    // Only the interrupt self-test injects a software interrupt.
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
+    /// Disables every vector in every implemented leaf (`LEAF_EN_CLEAR`).
+    ///
+    /// Boot, or a driver that ran before this one, can leave leaf enables set for vectors
+    /// nova-core does not service, and such a vector delivers to nova-core's handler once its
+    /// subtree is enabled.
+    ///
+    /// This clears enables outside the subtrees nova-core services, so it is a probe-time
+    /// operation only.
+    pub(super) fn disable_all_leaves(&self) {
+        for leaf in implemented_leaves(self.leaves) {
+            self.disable_leaf(leaf, LeafMask::all());
+        }
+    }
+
+    /// Clears every pending bit in every implemented leaf.
+    ///
+    /// Disables this tree's serviced subtrees at `TOP` for the walk and leaves them disabled, so a
+    /// caller that wants delivery enables them itself once it is ready to receive. The leaves
+    /// cleared reach subtrees the driver does not service, and the `TOP_EN` write does not.
+    ///
+    /// Call `drain()` only during probe. It must not run concurrently with an interrupt handler.
+    pub(super) fn drain(&self) {
+        self.disable_top();
+
+        // `TOP` summarizes enabled leaf bits, so a vector that latched while it was disabled does
+        // not appear there.
+        for leaf in implemented_leaves(self.leaves) {
+            let pending = self.read_pending(leaf);
+            if !pending.vectors().is_empty() {
+                pending.clear();
+            }
+        }
+    }
+}
+
+/// The vectors read pending from one leaf.
+///
+/// Holding one is the proof that the leaf was read, which is what [`Self::clear`] and
+/// [`Self::clear_vectors`] require.
+pub(super) struct LeafPending<'a> {
+    bar: Bar0<'a>,
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
+        clear_leaf_pending(self.bar, self.leaf, vectors);
+    }
+}
+
+/// Keeps a leaf's vectors enabled for as long as it is held.
+///
+/// Dropping it disables the same vectors, so an error path cannot leave a source enabled with no
+/// handler behind it.
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
+/// Keeps a tree's serviced subtrees enabled at `TOP` for as long as it is held.
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

