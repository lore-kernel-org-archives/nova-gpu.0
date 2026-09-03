Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175931F991
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405328; cv=fail; b=i2Jx+nUf20zvB8DZtoc+Lqo+sWJfOWvCSMkAIvUvUMo11gnY8d6MzfmWFbk6owU7K8Xsx3l9hwxJn3Uc2Gk+WBm5FVJt4ZKVwIDGU/8NJ75C4ClcfS1ohRwS+D5RZFsP9wdM3MgbTfhTglhxg202yEaJHLpJYp1yjKIq57aFkkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405328; c=relaxed/simple;
	bh=KQ75yHSFfpsOyDfBhLjPMYd6QBwvnzKlPz0Ws/YtzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C1yP7hYXQ8LUxyrkQJsPO8rc3axSnwnuP0l0+nQM8QrfjN7Gq/ZrcGtQG12S5CLaFjylpzcfkRyngISuQyeVVLgNjUfbu7t3mPaUwypVm7foxZQMa9isIyUhXFvN4mYxt7jLrv5U3kRD2F/iSyCsumM47RJpAfmqpdUuy8k3KxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EISpLgEm; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EISpLgEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czP1lrvGl2i4cDuen37FmiyvcDOL1Jr6MuzpH5T0kAlK709oQj5QkTToBdUtudWLCiw7YOUdxlJ2JEn62vbtYb2ZmsP76vNlchD3dzpfdspplYax2d/tGUVn+jJW1tKfC75IR+Wi1BOEPgrsRHvLByFPgW7EFVFP21bu8tnpfP5Nn64NWV5d4fftIEu+kvDNb5JXERjLKBaoibTIetxAhNm+Yo/uulDEwtfMF/Ht1fPEcZhJBAbNfON4v0ZibG67sFTypDR0KkCwsVrNYZi9qSUm88b+0zThlP47c2qf0dICuvEXJGaERNHGAYj8wi96yj4SH8l2sykmUEm7LP0w+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=WwTDeNvt5DDrAccdOy4BGTB/gQVf6GhGCA9/1nCiSBNz5e2EF1oRVqKvUvcdBzzOsx3qcMI3EpJJTgzSVsWzgxoPr5gG5Q1CBe8FmDIXGALTW5iiWpG0QjzbgamFTY+3Gyr1Ep2SsQQLT02C5zc5pDPhxda4vXLPHEvlX4/PgH0DJo5bGOO9NMN2mE/VaKkA7dqhmQRU8ZVJNsgoMSbeTqDv/B4l+JM7AReq+NG+mmgtMCra0wpIiNz4r6g1LlpGX7MAMSOmqNNHAXQQ6y/Yp9SPua6Tz7GHHsOut4OsHBPZ357AJez+Dsal8hoU+ot/Y9eSWjvb7DPJYIxiB6Hr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=EISpLgEmtgbSzhitm+Gl6pvddE3YIeds0tVWOmemOw1ak0dw7O31l589vN/4/pIf2GJG5iO56M8327DZHEZQbMqhao6eSRe50Mynw3/oHSCy99Kr8nESgidmn7HbeR2CHemIPjtq+Qs2nByY/hsuRE2B0fNpByIvIndi91KmfUZbRtS3xaHyUDlFQH4XZByovEd1Ksfj0M1W5J8tMclqx+ik9X53BCXicAtH3kbkQQWPcSOWswAhleZvi+tfEx8Ne76FIxswX2ArzR8+EQ6/MFLihZcsVGYsv54Pp7ZZeEeLqg77QlslLbFMyXSUm5/7KlcgvlEybOCo79eQotXf6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:19 +0000
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
Subject: [PATCH v3 01/14] rust: pci: declare IrqType and IrqTypes with impl_flags
Date: Wed,  2 Sep 2026 20:15:00 -0700
Message-ID: <20260903031514.1515905-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cae20ec-3143-4c0e-4055-08df0969959f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XYlWSKQfq8vUflb+HDMk7AK31qVjDU1LDTGDJlol6Lf8e1QZYTVLPgmZTUjPcSlYxDkejXtk8BJwWpCL9IOB7kPdhfAeyZzZ5oUxlihR/3sjjo4EvZzZ8JOBEN6K3B5q81dMah8shMum5Mwx/IN7fuSvW8/BaQp5n653poCI5j2n7R20z6I5YOM0Uu9GHUWyzLjXovR6gSWM8lpXZ2KVprYiZWwtKNY+Zg6DjLWnMhRNsBNR1POXb3qSRvSGdRBa44kbkfDpG7yEBUDggnsxsBo2Y9BKMdcNFaBgLGRYJR3b6HhLRlc+Obwufqf/yaZCTSTxqdZZfQbTf5948ZppBawXmA+ylHQNz017nogzedruGjNDuUFKdlE1u8U8ua7pWUmOI2gBqlBUrUX4v4ZCL8iVWCppcQdV0SSbvLwwyVRg1WqT4zb0wNHiwJY43t/3Lg0HCzSK+6rUQ6eJdHbt/uMYsZs/mmCTbe+rKbiRgzcGl1U6IU9+QJy3QdUKS8iA02iHuNzUadDn2jWb+IO+3UuWJ7EE4ZBy8ydxH36DlTECaddh2XdRJzYgIsuzrF75GEyFrqjtWis46ubWZocUvMALUpls1a0NC2YD32+6+UB3lnXqh4M8hhUGsI72807nj511PvcXqb2w1ub2ZRl+OyUD7GEXznK/dKIKSG0T774=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8g7uXTAQPohhilXJoer9jhTlo1kYZ6KM8EJCkq9cFNklMG9onL9XwOOzeACG?=
 =?us-ascii?Q?zsCNwMAilby4rKkQZ1CSrxWX+oPXhU2pzeIYyBkaJ/VOsL5o9rhWNQb9MJ4c?=
 =?us-ascii?Q?uljNWZP8rR931tRhv2RiSABpsJ6+WK+4dt50zh1CuGP2ofcFtKFOmRuApMqN?=
 =?us-ascii?Q?Stro8fOzoDLsfkjR0c7kVToOvla5BR8ZZ/vW/saaTql6Qh0/9melPWUomt1e?=
 =?us-ascii?Q?CEORyL1kGsHNrf7cQ/uoidhIRGcfTuo1/BRuvPjBQVjSjJYQbdx8q+/MNmq/?=
 =?us-ascii?Q?NmgjdzWTNHozfv1e3jmaMDbvU43WWUhuKc3z49ihHwXumVhNI14dcqlJOCFw?=
 =?us-ascii?Q?+4gQy59ez0OQ6SU9H8Q5uUi9Pe+KfOwTj7GqKmZQ8uhJE0s/dGIn2SmQQ3H3?=
 =?us-ascii?Q?Tl+LzRK1sp6oSZuQOM4w/rsZpE2ROtzaP6xcvyBDbM+Ba+rW9HSENCLEq+yP?=
 =?us-ascii?Q?ccBZtjcGdLh8HX5V7ylG6yy9jk4Ne8L0Xfhnc5Ql4Once9RJOp+6am2tN+LX?=
 =?us-ascii?Q?Wpozz8thCgMvVTNGKEEjRrZSSCxHqHEmvlc/18T1r5adGaMS7D+DsmsvVDFB?=
 =?us-ascii?Q?L2lWF/0UI1pbTj5IGlzLIryGkH8tEmO6mstcfJGS0RjUvvsWa3mWnnnBbJzn?=
 =?us-ascii?Q?09HmzkKnag1wsXUsIUb/Cl8Gmka2i3lcZgR9yg0tTbdyPbXbsPN14Kk7PxHX?=
 =?us-ascii?Q?/jqjMxD92ddZ0YK6GpYlq0fgWm1onbU/9RiNXdNlVOGCZU58XhxIkzDhVZ1C?=
 =?us-ascii?Q?7XdJvAZ/MFRROy0Nh2c73dTHJg7F/XQy+Qnba62l2dh6Q26Mx+xsrG2tVfFg?=
 =?us-ascii?Q?OLdzbvNJ84G33f3KqY5Gl+GBLV9fEkJUa46CQVL2uz5kjQrOwKh+mmtwoJ+T?=
 =?us-ascii?Q?poWPYglzr5dnUh3TyW7V3aoMDGC3plh0MvSZ5na6fxh1erP/yG/uo7ZyMwZH?=
 =?us-ascii?Q?qUrd+MSnM8cpZi7rb0mzay4eFmEQZ+kJi+YlJP73NaVDJuZvJ5FRj9p0WYRq?=
 =?us-ascii?Q?aau3URzA23vvjdilpeC7TviEVP6CG9Nl2bR1h4BLgfQpNcQhGhTIHCIpaS2z?=
 =?us-ascii?Q?TeLf667TlupMPJMFy+325jmdUIbHCFcfPdjbTANjHoi7EiSiYinAyVZwNuNJ?=
 =?us-ascii?Q?5v5WRNB/rbw+OLKBzwwDbUSDAR0QYwOpn/LP70az+RSCe5E2g0qpMpk7zrtP?=
 =?us-ascii?Q?ppxtnjsIipZHJZigNVt4kw4z+JE1eKVNH4M9J3J2Ic6qPwvGcDWOX4gqoCZS?=
 =?us-ascii?Q?wp7XfA1fEkeI6N4lj4TKL/VIB5WHNZSIWykJh8YCKGEMDKaDYO0pOLOae1aO?=
 =?us-ascii?Q?1PrCRsOcUhz5IPdC32oqD8rK7LTOZc7RDPjJHBVznpgOcy5k1jNyYSdpKBFr?=
 =?us-ascii?Q?4chdTnz0JJ5R2IAUP+yGZUGJ6iPdhcME9eMS/E41ptArgjiaw1POXnH7EDTi?=
 =?us-ascii?Q?Qvi5RSRo4PLc4/pzy+QoTLsvjeqH0WIAceHmB4166KPz4z8GfkkPUcy0lWXM?=
 =?us-ascii?Q?lSQZEgJzIpyz0iaHlf3rGJCxd+qkTP0uJ+PgswjnhRWiTcLk9PpavDA2nMcv?=
 =?us-ascii?Q?5TxOYYTBMeEiTYXiZ5JaqrTS9so9jr72DWS0ZE/mZYSQpSxQuLntBAnePQ9S?=
 =?us-ascii?Q?klr6xDnuCW+Pz06tilaPxIZM5FG/Kx6fhrMMqW6to6PCLgTRqQEx4hzLuZLJ?=
 =?us-ascii?Q?gaPHBy2ffWI4hA934CUxFgqAEv/WqQMum9dYM0QnL1vFGRo84p38e/mbQA3n?=
 =?us-ascii?Q?mUao14m8GQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cae20ec-3143-4c0e-4055-08df0969959f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:19.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/FEpnMNc18otZg/MQtEVSLOuLxGhRknGbY4dgxBwTYdvginU+/vZtWqgcAtxFjxTpZMkpr5UXR2eczbbdfbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

The kernel provides impl_flags! for declaring a bitmask type alongside
the enum of its individual flags, generating the bit operators and the
containment queries.

IrqTypes open-coded that pattern with a with() builder, so a caller
naming two interrupt types chained two calls onto IrqTypes::default().

Declare both types through impl_flags!, so the same set reads as
IrqType::Msi | IrqType::MsiX.

Suggested-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/pci/irq.rs | 68 +++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 47 deletions(-)

diff --git a/rust/kernel/pci/irq.rs b/rust/kernel/pci/irq.rs
index 6741046ec1c0..f074aad7f1d8 100644
--- a/rust/kernel/pci/irq.rs
+++ b/rust/kernel/pci/irq.rs
@@ -13,27 +13,26 @@
 };
 use core::num::NonZero;
 
-/// IRQ type flags for PCI interrupt allocation.
-#[derive(Debug, Clone, Copy)]
-pub enum IrqType {
-    /// INTx interrupts.
-    Intx,
-    /// Message Signaled Interrupts (MSI).
-    Msi,
-    /// Extended Message Signaled Interrupts (MSI-X).
-    MsiX,
-}
-
-impl IrqType {
-    /// Convert to the corresponding kernel flags.
-    const fn as_raw(self) -> u32 {
-        match self {
-            IrqType::Intx => bindings::PCI_IRQ_INTX,
-            IrqType::Msi => bindings::PCI_IRQ_MSI,
-            IrqType::MsiX => bindings::PCI_IRQ_MSIX,
-        }
+crate::impl_flags!(
+    /// Set of IRQ types that can be used for PCI interrupt allocation.
+    #[derive(Debug, Clone, Copy, Default)]
+    pub struct IrqTypes(u32);
+
+    /// IRQ type flags for PCI interrupt allocation.
+    #[derive(Debug, Clone, Copy)]
+    pub enum IrqType {
+        /// INTx interrupts.
+        Intx = bindings::PCI_IRQ_INTX,
+
+        /// Message Signaled Interrupts (MSI).
+        Msi = bindings::PCI_IRQ_MSI,
+
+        /// Extended Message Signaled Interrupts (MSI-X).
+        MsiX = bindings::PCI_IRQ_MSIX,
     }
+);
 
+impl IrqType {
     /// Construct from raw value.
     #[inline]
     const fn from_raw(raw: u32) -> Self {
@@ -45,33 +44,10 @@ const fn from_raw(raw: u32) -> Self {
     }
 }
 
-/// Set of IRQ types that can be used for PCI interrupt allocation.
-#[derive(Debug, Clone, Copy, Default)]
-pub struct IrqTypes(u32);
-
 impl IrqTypes {
     /// Create a set containing all IRQ types (MSI-X, MSI, and INTx).
     pub const fn all() -> Self {
-        Self(bindings::PCI_IRQ_ALL_TYPES)
-    }
-
-    /// Build a set of IRQ types.
-    ///
-    /// # Examples
-    ///
-    /// ```ignore
-    /// // Create a set with only MSI and MSI-X (no INTx interrupts).
-    /// let msi_only = IrqTypes::default()
-    ///     .with(IrqType::Msi)
-    ///     .with(IrqType::MsiX);
-    /// ```
-    pub const fn with(self, irq_type: IrqType) -> Self {
-        Self(self.0 | irq_type.as_raw())
-    }
-
-    /// Get the raw flags value.
-    const fn as_raw(self) -> u32 {
-        self.0
+        Self(Self::all_bits())
     }
 }
 
@@ -203,9 +179,7 @@ impl Device<device::Bound> {
     /// let vectors = dev.alloc_irq_vectors(1, 32, pci::IrqTypes::all())?;
     ///
     /// // Allocate MSI or MSI-X only (no INTx interrupts).
-    /// let msi_only = pci::IrqTypes::default()
-    ///     .with(pci::IrqType::Msi)
-    ///     .with(pci::IrqType::MsiX);
+    /// let msi_only = pci::IrqType::Msi | pci::IrqType::MsiX;
     /// let vectors = dev.alloc_irq_vectors(4, 16, msi_only)?;
     /// # Ok(())
     /// # }
@@ -222,7 +196,7 @@ pub fn alloc_irq_vectors(
         // - `pci_alloc_irq_vectors` internally validates all other parameters
         //   and returns error codes.
         let ret = unsafe {
-            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
+            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, u32::from(irq_types))
         };
         to_result(ret)?;
 
-- 
2.55.0

