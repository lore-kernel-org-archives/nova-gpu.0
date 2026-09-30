Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB9377A93
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739788; cv=fail; b=YvbcE1fvmsTpdmfdGlfl5dphXCyC9iSDff9KRJlOdrBv9Nx6bnstCatw+RKWVbFv+a4k/keODHQXQaN74Xp4hdt/+KzDY3G8lik6TlXT6/HwE/niSYbje/rh+kgNLGcqF0tp2zE+/HfmPebGEEq5xAJLrww4pIUy46IOFd9RnwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739788; c=relaxed/simple;
	bh=KQ75yHSFfpsOyDfBhLjPMYd6QBwvnzKlPz0Ws/YtzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pT2Q4KP2PPRBN3XGyvdET+m92hFiSuIIqNkN62SosXz0oPytsZN0mPkhnWuq1GXusDOWJeACla6WnA0q5MDNe61pMEPBL6O9WyYHwk5qrYNQS0F1k1TOTg5hPBt6rIpcGl6+RntW6D3xuD5FBZnjUA6OwtxPP+d+c9vTedb/ULc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ADbH/+Rd; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ADbH/+Rd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwYKEZ3MlMAFU4EChgNG/B15gVbApjg6O0mMXmXFxBGAuBJkzC7LsrnlKRtK3DSU9/3Od5TYX4RDTKCnFxunyrEZknwVFmZtZP5DGA7ICGExQh76ryDunT8HusAnT3FU5u7HXhptJqM4fN5wpq3qPs5WEOa9XfwcaRQTx3pTF0ukxUpn6n5jUbqVHSR1YZcfqg6i3xcr0Ku222LU/jILMjKgjorFb6OvAK06QfvLY7VvgPcd5IsqOL/1q0WWpRaBcIDUYQLxbplY5XrpItMhQp6h0l9YI90QWTQHs+KAZzVHwCPvb5nlzI4Q3q13cqfVu9TpqaJ+jD/AwAD2dgzxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=yiQJU2N922C5bJ32kL8nIc7dqbCuI88NdbP8awyMrP3D+QXuuU+8pAMGZkuvT6PucutuXbCKxul38M9xX6Y6vNqRgGUjgbbjdgPGEcvUB1YI3PY3HBNelvMrvoq5WdV/+PymOzc1gcfLItif4LC71n9rzR24vEKXZuXy1B9TFn4HqI55ZUrdHnmcKeaDoWSv47xtMLaMVpkM215cKiwvkk31r6N+kSi4RYthuPjbuEfwnuGm/n4bQDh2tHM9E9G4DxplgmOJoylyR6kUrUdapWmAkWyI5YA0rh7sAQRQahvHasKgmRNkJGQFF/dAA4K6ancRERf0KExjJTYROV+rrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=ADbH/+RdJrBtwZd03wHM/HYBax3trqw/2+UGl4XGQJhWt8izx8FpkRbqqtMMbjJ+Mo8Iu46QtJ2CUEaQwsonSPRbbiKh9GlqoRT0woSEXpyDWMpQ3IzpxzQfGLtyH3+god7eDKtOkZulFTzflt9ek25wVFftm2bTQXp2d6+BReKM3tTQg/BStbT/GZK9EmLkzT/YszKeeqnMSbv/lvT9YqbpWQpAjRXvAtyQVYmyAhy/KLtIYu0bxqWHE5xJKq+OIqJsAThwenv08FvbusmO1K2xEvjFZpVuIn6IW5iMHR/pvh3BCVn9ddulhbHToeNZFVnqiXjdQIuOByKoW4qI1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:08 +0000
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
Subject: [PATCH v5 01/15] rust: pci: declare IrqType and IrqTypes with impl_flags
Date: Tue, 29 Sep 2026 20:41:34 -0700
Message-ID: <20260930034148.590687-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e54a56-0d07-4aee-c9fb-08df1ea4cdb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iezeGlWoXp5jswcO8rXzLnqRWIb96lJGWZqe98SqTlhNGN9s2LZW1njRlM0+GJQCzWnDEHExentFHZeCXtmdL5G1WfcT0TKqm6lU3HglWAuEDw88e6XpFUWGNauUC7CcXmqR5TDt5M9PI/n2rrT5LThYhDVGWUt9Im7/BKWkwvYWi/5SKDFTbQjWinPxNJJjbjQGyjkFqFaqHC0oNGd/Op/8ZDqbsbJ7SB5y6VlXQZRCrMGy6H0oUKlXHRLkwuMn5KEmWIr46GF6YoIeSMRdc5XqYG2zj+SnQeN2YLprhjUW1EgmLGQdBV6pKqesbP+Rufd6W9QctQaqyPUmcv3TytaBBuscXwaCkUzr0GSY0iyv5k+/AbFD5gPDNtSZ7rPcj/0BaHAC/nBypBZXF1gH3ox64uzKeDkWFQunoTEdTVxXVFZtYw4RIBdkMEK/M3gbHCPZxFRUtBAETVTFf2aJfhqKDF6OgFAKUU0H1yMCCAlaJXIEsuFUtsZingkXDmPRGRtK6z0JLdUNU2XrvFkmtns3P+2T/sUbFX2DTHoEMHb1N6Ei7CUNntITr0ynOne69OWZb/LJVEcyOVGbNgMaSJQstoh2CFbGuiDIieG1IhMGh2/Kx/k+aMCDqHEsX6A4RGusJlfGWlZDeaVsRvzszd3cdBqp6Rf9upwXnYhII/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fi3K8i3WL28t+EUfqzt2TdkA8Ea9Z5DowlrTWnBjiZ7LLsYWbgkWVY48c3jT?=
 =?us-ascii?Q?GVrRwd0YsYBi6LjGjA8lcLsGt0zpbe2qemRrKTEW/RR07UmNWczkKLyLaQpT?=
 =?us-ascii?Q?0sucQJacE5lcXIZuT5TMjxnhM25HYTpBRKpBCadffuaquu/5e4/EIPAByn4w?=
 =?us-ascii?Q?lZi3LlL3onajAXuPN6sBZ+PLafsXiz7Z9E6unPIQ+nWnveMrM4f2TcbTFlJO?=
 =?us-ascii?Q?pOhqsWvSNxLI9aZkTowpT+ta5qRX+dLiqljdP0PIBO6yGdRPcPmEQvv7ohBN?=
 =?us-ascii?Q?FAQg2zgKZYpfVDM2EBfTQZUAWuu0mxZ60KlEompt2dzbX9+v9DkOOeaSYPHQ?=
 =?us-ascii?Q?5tB3jovSanYAf4NMKoEN2Ji6sN/QpUsbX1elhUPN1duqp5eUwZ2Hecdxh+YH?=
 =?us-ascii?Q?eg4WfWQNugD66l07saQeujn4hakX93jgXHIdbcn1Z6Ct+W6OcqRbmyPkQrbw?=
 =?us-ascii?Q?nI7HED7Wd/x3cFqCW2zQKRLxwCRBlO9l43oUQkf+hWztCyJEQgOCTkTbv/dm?=
 =?us-ascii?Q?Q6D3dwP1VG1U73h/j+xJc516eQwTSe6GBvadOIiKPjmYLOQWb0EFCL/R3yYu?=
 =?us-ascii?Q?2PRmeAA2zY8m90WIVQXi/HjyALH3NXAxgkjewIugCcqbBy3OuzOQXAbv8pHE?=
 =?us-ascii?Q?D4qtO1Jd4F62DDmsRPBZsOxvp7Hj9byKN+msetd9SsMOGrmskFHFt4cGCekw?=
 =?us-ascii?Q?TEJaluuzwaZsvyt9Ol70mkp/u3tDMsqeQbBOY9KtBRUn4rAc9r2KJARFykzK?=
 =?us-ascii?Q?tU6yoBFv1fEb87NBKTD9zTUoJNDxkPkbnH6ETwr3oxLtqkr6wz5cLDILGgBn?=
 =?us-ascii?Q?j70jqmkpcx+FC3taAd0kAuGzO4TQSZ2lOWll4zsRF/pAt3Xz9bX6hvC9ZO4Y?=
 =?us-ascii?Q?fVP+4HB/J4SmrZoUVlSrljjgdpw1lqCCBd9/yPGh8o+GuRY5W3LV7Z/aHj84?=
 =?us-ascii?Q?2zFRhJZqOkNVL2jDP49zhm05WwtxDP6gzRZRf80x2azKHHj5FipmJ31o6AbD?=
 =?us-ascii?Q?SbvyL5mkX5cwl7eaadkMvSGZDKTkbIsfnfXjgzMxsRC0sGeXrx6/qBvHhofG?=
 =?us-ascii?Q?L/0Me7nb4ZXVXI3juxbHLTVT42VSF+tyeOcvhygHBtokR9F8rjm6OfOJvh7/?=
 =?us-ascii?Q?5UlBcnGmXsk8XIKLm6QIzy7MkMjsxKhLFGM/HxL74WPR9fA6f2YhdW0+J6pl?=
 =?us-ascii?Q?73zurhv9HXR5vg+M7w6gI7+hDg0Q26x+Agvjdc0ADeWyqAjrEinbFkFmS+CA?=
 =?us-ascii?Q?aNG2PNoIh8DYdNa6mGnpqNGgQQ/QsId2nVn4iDqmswwdGvLGaC8bd3DmDU/w?=
 =?us-ascii?Q?gXJlzwzNJpYOocaJE3EefSSVssBlkdXjrPuVgUdAnaUYIJI21VgwidIbi4Bl?=
 =?us-ascii?Q?Qca6W8umQntoxltUE2P+b5WJGoF1Dr/qKEhhqOVqsTDdd6SYrrtALQ6jZBql?=
 =?us-ascii?Q?fQ3Wzw73ykBTAI6w8mT7ughqQ6gq6qn2S4Sg3J2YMd4Mr7vLjqWHqA6J8zKh?=
 =?us-ascii?Q?PoRisY/KgSjYv4tZI58DbG1+5HmUMR8evuqcXoH8vmxP08M2PG5gs3txO9yM?=
 =?us-ascii?Q?slr+GuW6YwJz4kvEbEv5neIodYWAat15jokzbyOh4AlhVPQLVg35Lm4+WHss?=
 =?us-ascii?Q?kzt+5sJ1In53xgqBzzo2y+RXPcCGqX/t/TIMa+UYXCrCr68RAOeR3UeEL5xy?=
 =?us-ascii?Q?r6e9bF3p2C+ZoGl+SdA8GpYyNAKO7MV8Nj9X9qXlzsoxNhI4nIgoGOK+w92+?=
 =?us-ascii?Q?nWCd9z6Mmg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e54a56-0d07-4aee-c9fb-08df1ea4cdb3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:08.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frPmRXVzQAGzup7tmTUSItRMuackn2IxIYtn+DGoKyzm14N0rgVrg8y8etdAVsd/aj7U76Y4j/kKRIttNBthkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

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

