Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AF39A807
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966577; cv=fail; b=NdMAfOPHtop/pYUu+udLOeQzqiZqxwhjzfeBrQv4+QVWdE2p1HajmW31qDqHrnSTCNhR9J2IjCBkblwq2Um6FeWkf42x8tyjJnoxVeqKujPmpj0CtpXL98O73WCZQy8rksB4dsm2YQ8+6VvZrb0uZnbRgNuHOBTrRXCn3hN8cPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966577; c=relaxed/simple;
	bh=WkY53zfBN72vENaBP3QCBQHjLgA8ZVx/UUIpI017P6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZU6EIpJaGSfGJ7Hw6QQ7FrH+ihKJTxBsh64KI4+/IcOL3ogomCVMQuppRCdvVYGN2r28O7d65GdpZLPdXaMlhRWNmh2YJRVKGtOuAbVTUe0ckXdEbb6T6Qjr0SRYmKSL73dWQhuyxaQXdsml6FgxCbH6o6WRn9u8eIZofglm9+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=frT9EQfc; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="frT9EQfc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXYNMR+QlXnZ5Se1L7l1M5YtagqkSOej0VZI1KGeCrhV3UXtiyypIVToxwKxSLg5AOpkVU9Nv3/ZG96z+hK02uncTJ2tyrasmAq1LOPNgsS1idbKYnc93L9xvbHXoKscuCaMimXVxNdsFee1IVSRi+1vws99f4ME7zDd+ieQJStp3cGIcuIKSU1niS+w4jN6XAxdiOS9inbp9vEO+zzVk6RSmqVnuiPnd/REd4vahZMGRV85OtmlDDCunPwSG5tdoP3n3zuz/MWngVbrxSddT91c3wZxg2qNNxaLc/w5YnNtJ2cfOEkSh85HzppNDkhZd6Zyve5rmpK1LVA0uwHnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GBQaYsl+PMy2uTAaFVICPzfYTzKtoK/yBqaPJKCyow=;
 b=JxcrzhLzKOQ/euBYwuxP4pjDMBaLbqcgdrOrvE17bG6apk0wn2IWEEo+uMz0rf3DwJeME4JETPM+fx9+DdOcLUtu3FeRiFwMRi+xrGbXYI9om9/B9U5FeDUlMZJ7c0y6ZyDSlMIQzSScDniueizOvWhkcchWUU+A9O1nJDol7QuRlw9tMpP7DXFWCb+S5u2TQGC0EqLmfPDscqnF+3bHCaBlMv7ZqiNqBiOosK5178T+z+4gTHtpt0FLXDNohqb92q3/tAhtrQ8s5KN2wgAv6ez3bMpYUCsmz/nLgVwGZBLFRwSQtJ54p5GXUlbiw4siL1EyM+5UCNy4VNIfdRAptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GBQaYsl+PMy2uTAaFVICPzfYTzKtoK/yBqaPJKCyow=;
 b=frT9EQfcoXwWcadFl062vyFxA0vtnjLqeVHRtC5WTBlNl6+E5qjMLZF39nuEtrgJuSLVO8L806IUIuYNRcoc/oLueGqK5/VnqZPty2nxxgxu8tfcMnfMgKQVXbHdiwXIRp0IQMUF4jKDQlwyI0Qd69Cue7HdHSKbM/O4F8ygEtt+SEySXLJ1/5t0f4IwtwISewhVwqHtEV3FDG7cSCh7lY7A+Feb+MSr07M4OAO7rDsCyg6w0Li+CGB9E0fvaxhcVo909rFbq2WQiXb8b5h0paFetY7SdtsYuuLjZr4V4+LQayS6u19v0G9yQ5k9xVEykYVw1nxwNQdY6LxpBuql9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:49 +0000
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
Subject: [PATCH v2 01/15] rust: pci: declare IrqType and IrqTypes with impl_flags
Date: Fri, 28 Aug 2026 18:22:29 -0700
Message-ID: <20260829012243.496697-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdd7ac2-ab0c-4f89-8dcd-08df056c09e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XlHLgdRzh2Ne0wm/X4jKYRxN+ctenmgHMnUENhxPiGcbck5BbJMz1/3NKEP8WbVOH4kPi60e8l2qr46Y/7enJ5VKti9LPEj12GnN0y3I0x6ZLK98BI0Ewl9zTyK/VFazLa74m6dxQVOZ5UtkYn6vnTBd+oIRJIppBIobiWZpPDcP8FpR56GNqtPxbSd5fkezNu42o3u/o+91u7Y1ITDIIjg05FBNUrbvziIXYkLw6F1RHZwb/kogf1l+hok04olXrOpCPzZDrY8vcQsqMi52N+cxueIo4In8waaR3IXxh5ZHWZFlva+ScmDVJvzwN1ZgU3ziw5tqJE6/fRSPVeMhlcm7/uJ8LmbJA1LxBu+tiKJVSvgCe/vSMmRdD83DHKrOxPNq8cFq/IIPbYaBXfjlvMukFVAp/w0YKfAZYlCD0iSUBetCDTXVi39J+VFB0X9s5FTuznkNMF5UH78xt34vFuO1phC0UvIl8u3Kzmhzd9jsTfmvMN3nCy3pwmbkkaXt269/R4w7VaoKP0nrnaOrhphQdbDZaU0MtVe9Q29Ho8MwVnVSoO1XhhA3CBS1qAvZVPep6dQvVue0XD4nzBqQurEutxbWu61HZhvZzbFHC+dUtC4lINBSZ0y9iQ9oKGgU0ALBmy64HPJh7inMv47bAO3/+0kkhYJrGKdTGHJTR5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9gWwUvvGzp1waGwkGrKH32LLjW6xIlaWZQ2Ihgsrt1ZdyN1VoWSxky9/Jc1z?=
 =?us-ascii?Q?U8SnsWqxJVi1DLtjPyuQumT3GQB77fDAg2tQhJcyhzyNgB98oDZ2AEq4PMWq?=
 =?us-ascii?Q?whq25v5i2z2bcQ8dsNa6M/3LE54EAi9wY7GpfwA4iMltwnzsr/CHz+uyPFyg?=
 =?us-ascii?Q?+LkREZV5cgXuVE2i/ddj4b2TXe5iAmMdCDZCpOmsv3O4sJ/mx4dswbPwFPvE?=
 =?us-ascii?Q?X4t8iIRzPe4Uu3jScrhWa4rSqC5GuiRfAiwC58LTKVkaSankuzGpedIwg2vr?=
 =?us-ascii?Q?VdNoEtVn35SHPmAEAZjUGAzfLMekgir9wbLwgjEHUS0EY3DRhzVFMuhZm02H?=
 =?us-ascii?Q?+KzR05xzT9a8snO0tO3av05jhNokxN9Cr3QkVIXpacI8Zg6TXwuObgnjsxx+?=
 =?us-ascii?Q?BWIWRbsNaRF8WfIuVxcgUwxyw+tIOI83A4YSmImqYYR3McdCBwNiV/YcR8bo?=
 =?us-ascii?Q?dw++BTBbb3WjPAu8aEVYUkUDEcjDjzBwuXktOa4sfdXUIhmGChAUPOGPGNSo?=
 =?us-ascii?Q?BVq8/HozS/q/9dKJYfm0LlxykSvhPyoRUIa0pIKjvmJNYVBbxq5G+Un/sNpm?=
 =?us-ascii?Q?6g/V7o8NbQ/5ZTU9Nl/S2isLZPQOGo2M+3pVZ4rCMZH3pHFdsP5zV8rXAKN0?=
 =?us-ascii?Q?SisrZj9t0tF8aNvkx96RtED/8cuP/skqoNSIaBIDG5PjHqXVzcUMmEr9OOWl?=
 =?us-ascii?Q?Pv2KgTI7RFhz66Lf91YG9ij7Z66R4Dw8sMm9I1FKf1lMKF1SrcATKRhm1KmY?=
 =?us-ascii?Q?/E305CbGJsimMvPxjWaWtzg7J3AayxNyTi66ML98+vh8euhU5UFXG2R1Y5bW?=
 =?us-ascii?Q?F8ji6seJLhPWkURHv7eEKa7H9B9MlVLZGyzbmfTnP2G/ewRwZZKmbxg7ION/?=
 =?us-ascii?Q?X4Jsoi36RJEu3331dsoyYKLp1ybSc31f/nRBh2QdGltANqQkxC8jNotEh470?=
 =?us-ascii?Q?oDxP+MLb6DC8zhQJAicA95mvTeqgjIKI0tUo+QM/OzyS505Y38KueK6R8Pd4?=
 =?us-ascii?Q?THRjnm7B8eVOKDOZCgzGZL/rVIDjs7BcebiTlACNhH0X1XixUhjUV3Yx41qG?=
 =?us-ascii?Q?QGolMASpfkGJDvKQOK1ZXXfR0cIS6EsANTq5GTZR51Dw2DktQUekhiZ71YGe?=
 =?us-ascii?Q?b2iZGQxD76W5OmojLoq++Z2rBj40PSUuqIAg5XxqPE8cTYkZNg5hlNtAbjTH?=
 =?us-ascii?Q?1uHLIEV0kQd3my4wrXyCiBORcIExta+4ZdoemKe9jmsPwh05hpOG19XGPBzk?=
 =?us-ascii?Q?siXAoi+nXzC/9zHN+AUjvbLGEgujOXAXF7l8DCfNN89usdqRGBk3rpTk2QB+?=
 =?us-ascii?Q?/k+i4+/5Ajk2bAJwfiSqscwlbtosja67jvTRtjit5yrTQOtPe/6+YoqgSkyh?=
 =?us-ascii?Q?160w4RvQUnOpbpY0doi4S10tnTME8HDKYVS3mQAOWUzqXUMVCuYJf6wSoWAy?=
 =?us-ascii?Q?8pX/A5rUxWSv/YodNCXEkuuf/CX/7jZ3NLSdGxWObSLtj1uT6zhySNY/xEY8?=
 =?us-ascii?Q?10PQxp1xj1dr6L0/aN3s9ucpK3a42Lg76hunMKLl+iw1U3ANbZrDdGDhjBRZ?=
 =?us-ascii?Q?tFsRDoAs+U8Hxi9pTrosFVbLsKC+iFebAq1cduENWo7FDa6O8k6es8kqTmeW?=
 =?us-ascii?Q?G0Q39YooGgQZombnvSNUMnTZ8LzseLtYJtH7SEjqrzTok8//RsCAag5I3L3r?=
 =?us-ascii?Q?IRyzMIuWBkfaONWlcRPOfx3BnmgkVHheF2Ou9ldD6UE2AQ5+/UABv2S7FTRp?=
 =?us-ascii?Q?GL3mIx7TYg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdd7ac2-ab0c-4f89-8dcd-08df056c09e5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:49.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+Ohs9Ib9j3FJJXDre4jcVr/Z6OjucCs7i4Ue6o8Co+wFRgObxB7sTWyNCjtoBSK7o0mapn6ck1vppRGWy6IbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

The kernel provides impl_flags! for declaring a bitmask type alongside
the enum of its individual flags, generating the bit operators and the
containment queries.

IrqTypes open-coded that pattern with a with() builder, so a caller
naming two interrupt types chained two calls onto IrqTypes::default().

Declare both types through impl_flags!, so the same set reads as
IrqType::Msi | IrqType::MsiX.

Suggested-by: Gary Guo <gary@garyguo.net>
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

