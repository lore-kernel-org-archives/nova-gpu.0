Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D0375F95
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188265; cv=fail; b=Qk/IlYpciAtnmqve/kL6XiR1Q6jndb1lipM8BZKR+YFXDFkp01grr0xtKLXjbXKcINqvnxChzIKSBklJ3h6VE4RV7YVkSH/ri7fJSL1uNJYiweMEmrD8Xv2mPIkvbi6iGXkeP9g6q63w7aeqWIKrN9kcKvv0GX3H5a5z0kcMxyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188265; c=relaxed/simple;
	bh=KQ75yHSFfpsOyDfBhLjPMYd6QBwvnzKlPz0Ws/YtzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GiJZhp4GJIhryD39i1Y+4m5yB9R5oTDk5NcABZgFtV+vmm/qBi+yrCxvVPOBYYhkIiKkPdVZtoxl/tiudVoif8SOGdVbnSlEUXXGrZwfzHvVyolXKYQQ7XX8TR3zvFzMXb/cB58fxY6JFbC5Oltk3K3ncdpajvH6yDZlJWTx5AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DAxZ1zde; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DAxZ1zde"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIB1EG1YES5LXPULnfLbCVU5B2lbS9gVNXyTknPKKHkoz/wwBVfGC/S3RmxVtZzIKAaX3kVPEK/cBiu7H2xys3VbmE/wD0/RoXVfDFPqu/62LZPp7CD4j17s9vdBJL314VUjTYjFOpVy0P8LEoj/Q4+E4fcVFtxuVCBTeCmr0LpY+0uaMPqorMpnIQTruCh9XY5AGGZ+IaFLdDa96AzCLgKrwBhFD7ATTr3YlsObD4+IGj0ErDyeq1kpJR19Ds5xcuE1g0TKw853MLYMnk+3FnCEV+WroUUipU9buDBKKK6qlB+ywJnKFtmGbQghRjOUyDw7V+Tqm5HMFhpElANb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=TFw6ME5ubhmmVT878MeCNf4Cxf4kGqT3g+RRy6b6zPfrgc7ZHOcXM3fek1Eb4HDb223hs2XkPPsBBTuWpYuEE4X/Ben3m921JAo2bQBs4AuXR6nxMcY0ufA4ec0H6lVVmOC+Kfdb0d57mdwTL7nz7l7XVW23Fc/EwFqtu3V9UB/00SpUz9ARWrZl2a5Xg4bqwULBb/lUpSAIluY0zaUR4gLYWOoV7pOA+6cVcfxJ9pfOp97jRvcNvKmn3fEQnO/AjH4Rd0QG60rMESFXQ9iwomkVxFS0DfM4WQqU2HrcWeQ8FQHnyU3WBD4oFKq1mpOezZnM635kw7RS785FDnPX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE7LgGKlb/RH7lO7LGEGY+pNReRwFNpYsAGsVgNJLsY=;
 b=DAxZ1zdeuIjaDJDyir8HNPYbBDAFO9i/CqHaHfs/2t/zIIBUkgsnu+KqMJMrX0zq1RZFh37jlgS5SR9UepXyTWd/uEpmjzAaPAu4g2DIKCWa/z+hWJivwNWMRztU1K3E1YlvnhhyiWMbNwNsy0zpI157fSOSXooxeFldgweQQzRVQZUvrrbSEGimSsepAsucYhoKeIKWQCUzxX9Km57Sb61MIbm4WvhfZvaJFAFaFCkO10zOaq4G+l9cLrbgjnpltRwoOJV1NorBXOHl1Ym8ja03YBWLG2eRokPXevpw29U0YNvUozknp8D/sRnE/KMNWqEnTZ4ajVFC7P1qjB6d0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:16 +0000
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
Subject: [PATCH v4 01/17] rust: pci: declare IrqType and IrqTypes with impl_flags
Date: Fri, 11 Sep 2026 21:43:44 -0700
Message-ID: <20260912044400.677097-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4254eb-57da-47b7-f4f9-08df10887e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|3023799007|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	wxeVgriYkhv2zlzSJysltazAFPdhZKE/cn6Zz2l28AGEUNyWIagf/LQY83uSsTWHYVsPrRsaafm/xBykgkWqJT14IKjLUXhW0wDI0pcyeEPp8hbPa1eMW/rWtpxx+LTCANV9XBAsIwOW+xuKkIbn2uZNC/U2o3mThbL/zSY4wa+K0MNits4g98euPFrjaYROS0QcxLiLrlmAxD/tvDQCTUgSbQmWeSzOmVrODQ1zGdo4Xn/V5X8v1eMczo+BvSfXryi/INe2esMO0fqReFJRpRjMaE9WoR4WFnPxgPCnMz4FDkKGkB+RBUnCbybwNCvWi4Ih66pJfeCjMwSsqoDlpOUopNNvHVxmk2q2oEfSoimoin4HfBROXQHvG+8J2BG4RTyPo1v9hWRI+1C1OBuD4rnq9tAaAuAv59TX/U7UyOzHnhlwK5xiwbrqz/bnpVjJx+8y/9yk7ava20fhnkx4mAg/Dcz5f7Vv0WOGxZ4S+ZaCjb2Xtgo0Znq3W/x421kcO6rbAGH8wGCTmW4gjjWrou7EbeX47CmBlrK/V16mbKmFmL0LJtyxzul4ujGGlyfNb2cWz3/TkS36gaBPKvhjX8DGqb8w0iOGZjdjoB8S7KpKLXpNcfL2zmzxMZNIyrjnxzwzrlSpiF3rt8bJ1u9r1QG8qNSyn7Jlmnm3iNPQ+1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bGRGf++SNv+MmqPGNRmiCa+uYJk+7+zjpkq2NpH/d3BI+QhJUG8e7oaQ+RY6?=
 =?us-ascii?Q?CCOLwjqu1wnQrwZCMhwNuoA1slhdzwdRh9qSa6OyG/eEH+hEMNfhJkH8ChXT?=
 =?us-ascii?Q?2FsPGY5rB0bJJEqKd2sCU5kJY25+fKrtb9rIGXAZcwcB+kcPWoJ6UucnR4Zw?=
 =?us-ascii?Q?7BxQEY2xJJAg7AFP67X98RjcbsTlyjpV41MvpADvSYcUrCGKwC47dmCrUtlJ?=
 =?us-ascii?Q?+SyS52jK80bMWUOInBPvjDl01RsOTkitWYdmZyy0NQOYn06nZTu2hW+CCDDU?=
 =?us-ascii?Q?WD/qW0bYkbJM8CAaC5zx5U4vrYlGwGJ9ec3vrroCqck1GeFO7m/CyByrLehV?=
 =?us-ascii?Q?lSyHvjKZwQvXB51ih6iI2fsMNNfNyhvKV41YVW5+Ci9cmZ9VOJznWJyOYtE4?=
 =?us-ascii?Q?ZsxG5wX0MM1RE3057ERs3kFCnAmpsDwkhvE4dUmtnjOXrbFdSs6ZgxcF3l++?=
 =?us-ascii?Q?4FoQ9Si0JgBepYtBH1Bf0qbDjRGS2wUoCgemu5lm4zX3a6MIpsovYj7jesmT?=
 =?us-ascii?Q?+nLYtNQOQ/Rher+nutYUasE1ybjO81jjxf3XbIhg/pdy9oyqNvZ9rwkJvaWl?=
 =?us-ascii?Q?KBZPnW5ZZytCm8UIXxthMcvzJMP6dq0Ks5rFmzOFK71aDxYfysRnAPbw5MoP?=
 =?us-ascii?Q?PgTWEbBdqxEVpkUyoTO1N6iTeSqTkpKWy45o/n1emblHSOSB3cBjUXFjlApl?=
 =?us-ascii?Q?vqthMchod1O64X29QF0EFU+eOx/ShkSLB0IJt0TbSzGZ6fBEWYJUMej7Sdmo?=
 =?us-ascii?Q?J7o69HH1aaE+6VJMsebGXZ62Xo3S7HMlqmEpR45J07S1UTIbvdxK6A7VEOXf?=
 =?us-ascii?Q?qoEE9rfdZ9+fgFiLI968CZR3l/x8AfKgk/R3BsG0h/2UpWKY+IXHK+HZlX5R?=
 =?us-ascii?Q?9s33GyLadi5J0aq6HHE2XOLSuQV4dTCyjMRHyc627yzgKaL6fnuU+AvfXanb?=
 =?us-ascii?Q?kQQgt2c0jEhGVONO3O/q52VZn+QydxXduFxUb9wSZKk02A/96ot8EJRNYNl7?=
 =?us-ascii?Q?joUIM4zQxj2G4XYlivx1uJnGF1WGpCuTKvYmDfq2snY9ObfGqPF1aZZqWjUq?=
 =?us-ascii?Q?wfWCM9AYUbHrb5UGVg1eNTmcn6Lz6oE34XatnpsTtc6xiU7gYFA80ZAU/8NI?=
 =?us-ascii?Q?dXh+Uk7P7XlaGjF98rBx0t7OhDLuSR17V+xfA+ftIajKDKPbkKIAJ0JLQie8?=
 =?us-ascii?Q?Zm7LIGhJs95UTqyA/K9gLq60YWAq5HOOCBhRFikCEPF8/k7dMsmHy43whp9G?=
 =?us-ascii?Q?f1NZcTnENW78LXjMSXRZKw2hERlY+AbqXA7XPn8ZC7DiWWSTA24efUcDnvWe?=
 =?us-ascii?Q?nzaQSlenBe/hM2ZLbKdhBu+7z0KmeyN4WB6VNi9ApFNUO70PU7H5wdP2HVNu?=
 =?us-ascii?Q?2NNUH5nSKDGpRFfzdUVt/NVDc2TVcjfos6+COvWbosxecwPQwXqnPGTALx2z?=
 =?us-ascii?Q?6y3C74j1nX5cxPKewXxkyHL34DIKf9aWSGjBS6yvrK2joMVeD+ygvigtEroE?=
 =?us-ascii?Q?SEdfVc8YVi/z5Qr40QfENCeKghdkWhN/2vJIvDsUXgjYw6kSR3YG7jDwJ5QF?=
 =?us-ascii?Q?QWv/vi0c9jimvTvkXsWMkY/eykooKP/Vbd43kVph0BK4Vc32tEs4yDJSZNjz?=
 =?us-ascii?Q?o/hlCYQ6Qiu2+M1mD3qHmQef6uZl9S0OAMNiaTLf1T56Qxf1yMgO8rg+YDzw?=
 =?us-ascii?Q?8O2YjksdTI5U5FKMTTAHfKBZ67GhxF8q3A5Paq+qBxSPNIS7ZBo++uwdCXEj?=
 =?us-ascii?Q?yURbxeMWIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4254eb-57da-47b7-f4f9-08df10887e97
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:13.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwBD8x7HJHA75CzRIIMNwbr7OsnKMUEtdjrwT7yvKomMkijEFtszsuu/ZWudMPY1mDDA+RQ6mnxPiSR/gqvhwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

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

