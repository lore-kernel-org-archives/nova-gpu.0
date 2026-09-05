Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D23D5673
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595940; cv=fail; b=WBd+VjGhDoYJYbyE+jcPCvmcxDKZzOQXpJxCAl7TDqZ4SDMlCBrHYzwkX3eYY0GOKREp5rOcEbg1A4DTBe6lAPbwKGdLW5BgevUqh2HhVNLMquA1tOwWO1IvDdJPRLWab5dLHE5SH71dyNKNObuw1erNX4ZjoF5/lpeDjHx8n9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595940; c=relaxed/simple;
	bh=fG1Fj/18HA8NVhE0WxRnxhuAFS3jt1Ve1P7F01ovY4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJxJ+KjPtsymlbKgGpbHwNdfCaW7XgNxACadUJmZp8K/VyMiL60kcWjOe5mF/CxjQ5HoII04IK2+Dwp7RN64841H2974r5cyYVv5juTaJUbdLFeFHYvshUzeq4BNXUvlmvkEgZB5rL9jOLGHPH88xf8uV5CM2N39UR7Goc8j3fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uar0329b; arc=fail smtp.client-ip=52.101.46.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uar0329b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNUWuyrTnpCHFmCPkCNeGe8Tw4C+osKVGwzBPyUOK4tX7DR42v3D4fXzkV/sZzm0bPDILCKvrQOUhc+1mC+hUQZaW95HBOWFL9mPV2zF/2M2sOy4XtGURbzMdNlsL4XARiSrRCryHhOBU6Poa/0zK109YjhwQkBSR1eMMta4pZbsZUMz64U0Bm4PFEqKKQZzKtBl621niEk6XOPStgdbLy32ZwrtwREl3Av0Pt+djqZr6yALdGFuUdMqRTtAtjU+Hi7GPg/f2bSrNtCGzWe46CVl7J6IlvreZBDuC9TmpQiL03paTmZRkc4XIUoS/FvgZXVIHrTJv8bYnGG5+o7Tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy22BD7eAwztVbh64K7JK4bBoNJCCSsa8cuqdKSY+uU=;
 b=BIejw3HQFwu/u4vr/EOP07ZcuHaf1umq9RFI3H54hCxEpOhi03qCLKWuJxB1cpMNr6ajBnzgvTvJqyUeosmkbLnTRJV/HomoUXeed2Lp/mVx06xd1CA8N9xMipUTM0rdsvZSVXQ6I/oW2iOMUNYUXbLNlkpLqFt9/GkI2YoXIm0j9MaSfvEdKcNaKMPcoSFUO9utE3S5cLinxUqIgbi9kvzlsaNlnhSNtkzwW3tmMAmcT1tED0+OtplM3U42vRX7GVhcRqARO4k/BaLXFrIQJRCOBJzlQmIn7Qt8MxqoWtW8JmuXz8bUnZFCFHjmam9kcLgTmH9FysDSAZEVSzeduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy22BD7eAwztVbh64K7JK4bBoNJCCSsa8cuqdKSY+uU=;
 b=uar0329b4FX1MsCACjSuMz7wjyEhDhOOuIHNC1BeJniaVBjf9gQ68x/2xZfx4e26yJFAuWZ1cV7WcAT0q81ncxLk+8EMPmhIyoZO9cQM+x7USjq6ojOkew5vFbMjU559tEPt6J9n6Ba81M1YR+fxSYTEWUeSfcPZWRV1fXw3ZRC+S0lv/YEfs2iPZVYkSL7cmgFvlGHTjY5IMyk7qGekJEn+4n1Ch1MtgEE1e0PPXzg2Q+doKgDiKoXignJ1Oa2XzbaTaG8P3fCrfkvEzGpV70RHLpGxzwTzFyrjfgOrV+OuMCJDCkgNOD+0cufvmKwuYwjRHjU7mKgytAfGAQBD9Q==
Received: from BL1PR13CA0319.namprd13.prod.outlook.com (2603:10b6:208:2c1::24)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:11:59 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::57) by BL1PR13CA0319.outlook.office365.com
 (2603:10b6:208:2c1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Sat, 5
 Sep 2026 08:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:11:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:44 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:44 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:11:35 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 02/13] gpu: nova-core: mm: add VramBlock and Bar1Map
Date: Sat, 5 Sep 2026 11:11:05 +0300
Message-ID: <20260905081116.106613-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905081116.106613-1-zhiw@nvidia.com>
References: <20260905081116.106613-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 875a1c70-315e-44f8-f26a-08df0b255b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|7416014|10067099003|11063799006|5023799004|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2prCZseyBMd3Igc4ShpOIQjJHxlNU8gxxR/AVrQ02mp9TdR8NDvN54T9aQrRffP4GVDdOcyq+Mh/9zYAl6iPbPcD/MGDASEiPGslZF5nUmqJSSeon+b4V3wfwUmMBCG9/YQF8wr1Dcc1p9dewi7L1/ldX2KiJczNSoAuXir57WVUeUHL38ma7KxvIQ9hKDkow0+NeBOl17EAYE4XGXRqyt7eNjNEK24ry3lgnW1tRjN0q0gzliNUL9qWeij8W/D+kcMOWSPqDoc89V5LqdUsaJ7xJHMrpUqXaJzyaAGq+5cCJHLcW9X621A9444oPkrpVlkml3TqxBKqw1WfWr/RmjWzjdkGj1+sBkrcfS8bmv651t3FgeSZsKW1P4xyw2+I5H64NepAFbiLoKf375yXXkOpcen1rFiOVlKNU6MCXkjGx0qrSdk1t7o2SZi9+NymRHgh8RHWgQvvuN/f68MlsV4N9yNdqpXBNt3/m1BoQe44/XUPAhxogQzHFCt/CMTVHNIFWqZdzfpCCxOQQmNo22uaCrczvN/3mp/r2+KI4YMjW0jRk8YfqRqDwllxbUlSPJzTEfi6KEjHbO16P1v0g5yTUd959pHMzMS07RkRkCB7P8FTU+XA/QH7dCTVBBmoBL8qM41miqXSnNQvilxAafaQcJLtMhOZrQ96MW6bIuBOBJJhN/yXTT4PHfpB6qZk60iIaRg93A0L/5wbE+NIVg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(7416014)(10067099003)(11063799006)(5023799004)(6133799003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6s6AGNaW+S5zAA6m6a0L4RblFFue03OPRP2XKer9fyBbm27Cz/sJ/s6HFEckNjL3F2QX+nJHfZidx2gQV9i8F6TXvrk+8uErXN/wsbCA939sOXwBPjObOqvHSuWCHMh55rwr5XCI9Gz1KVZlQ9J1JFoOU85FCZdMRTjw4/eGUSzC3yzWoaZr6nfnfQjVQOZOqkuG05YDvHWfYJWsTr5nl42Ckr+EihGIRjw3p/eg2rAwsz0g+ZX+gRJ+VyhOtWJa9tNmlU4NpqGqaMffVOACXjhjKw8EBNAd5dQuhrWD63sUO8BALclClvWlYJeWEmxatmrr0h7DPkWM4650umifu/9WAtPNKQJfyvJPvZfpZM3nQ5xz7O8XmcNfu6MLQ7o/Uw6uUg4+hxUzJNpolTHUjL+pktTTTR30JEOHS39KIpgMLZckmX2KInr2u1MsoKlO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:11:58.6221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 875a1c70-315e-44f8-f26a-08df0b255b95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

GPU page table setup and VRAM-backed control structures require the
driver to allocate physical VRAM and map it into the BAR1 aperture for
CPU access. These operations are common to both the base driver and
vGPU paths.

VramBlock owns a buddy allocator allocation. Shared VramRegion views
keep that allocation alive while callers select byte ranges within a
larger preallocated block. Bar1Map retains one such region while mapping
the containing pages and bounds all CPU accesses to the requested view.
The mapping must be explicitly destroyed to release GPU VA resources and
invalidate PTEs.

Keep BarUser inline in Gpu and let short-lived BarUserAccess objects
borrow it. Bar1Map owns its mapped VA range and borrows the driver-owned
BAR1 mapping; explicit destruction returns the VA through BarUser and
GpuMm. Its MMIO accessors remain runtime checked because BAR1 and the
logical mapping have runtime sizes.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         |  20 ++-
 drivers/gpu/nova-core/mm.rs          |   6 +-
 drivers/gpu/nova-core/mm/bar_user.rs | 143 ++++++++++++++++++--
 drivers/gpu/nova-core/mm/vram.rs     | 187 +++++++++++++++++++++++++++
 4 files changed, 329 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/nova-core/mm/vram.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a2189589422a..430d0cc12546 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -317,7 +317,8 @@ pub(crate) struct Gpu<'gpu> {
     /// the GSP is still operational.
     mm: GpuMm<'gpu>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
-    bar_user: Arc<BarUser<'gpu>>,
+    #[pin]
+    bar_user: BarUser<'gpu>,
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
@@ -508,19 +509,16 @@ pub(crate) fn new(
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
-            bar_user: {
+            bar_user <- {
                 let info = &gsp_resources.boot_result.static_info;
                 let pdb_addr = VramAddress::from_raw(info.bar1_pde_base);
                 let bar1_idx = crate::driver::bar1_resource_index(pdev)?;
                 let bar1_size = pdev.resource_len(bar1_idx)?;
-                Arc::pin_init(
-                    BarUser::new(
-                        pdb_addr,
-                        gsp_resources.spec.chipset,
-                        bar1_size,
-                        bar1,
-                    )?,
-                    GFP_KERNEL,
+                BarUser::new(
+                    pdb_addr,
+                    gsp_resources.spec.chipset,
+                    bar1_size,
+                    bar1,
                 )?
             },
         })
@@ -543,7 +541,7 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
             dev,
             this.mm,
             regions,
-            this.bar_user,
+            this.bar_user.as_ref().get_ref(),
             info.bar1_pde_base,
             this.spec.chipset,
         ) {
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a5bc4042577b..d1cad5ad52fc 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -67,6 +67,7 @@ macro_rules! impl_pfn_bounded {
 mod regs;
 pub(super) mod tlb;
 pub(super) mod vmm;
+pub(crate) mod vram;
 
 /// GPU Memory Manager - owns all core MM components.
 ///
@@ -298,8 +299,7 @@ pub(crate) mod selftest {
 
     use kernel::{
         device,
-        sizes::SizeConstants,
-        sync::Arc, //
+        sizes::SizeConstants, //
     };
 
     use super::*;
@@ -309,7 +309,7 @@ pub(crate) fn run(
         dev: &device::Device<device::Bound>,
         mm: &mut GpuMm<'_>,
         usable_fb_regions: &[Range<u64>],
-        bar_user: &Arc<bar_user::BarUser<'_>>,
+        bar_user: &bar_user::BarUser<'_>,
         bar1_pdb: u64,
         chipset: Chipset,
     ) -> Result {
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index fb2129c47f47..adc23ac6d467 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -7,15 +7,13 @@
     io::Io,
     new_mutex,
     prelude::*,
-    sync::{
-        Arc,
-        Mutex, //
-    },
+    sync::Mutex, //
 };
 
 use crate::{
     driver::Bar1,
     gpu::Chipset,
+    mm::vram::VramRegion,
     mm::{
         vmm::{
             MappedRange,
@@ -60,12 +58,12 @@ pub(crate) fn new(
     }
 
     /// Map physical pages to a contiguous BAR1 virtual range.
-    pub(crate) fn map(
-        self: &Arc<Self>,
+    pub(crate) fn map<'access>(
+        &'access self,
         mm: &mut GpuMm<'_>,
         pfns: &[Pfn],
         writable: bool,
-    ) -> Result<BarUserAccess<'gpu>> {
+    ) -> Result<BarUserAccess<'access, 'gpu>> {
         if pfns.is_empty() {
             return Err(EINVAL);
         }
@@ -73,22 +71,22 @@ pub(crate) fn map(
         let mapped = vmm.map_pages(mm, pfns, None, writable)?;
 
         Ok(BarUserAccess {
-            bar_user: self.clone(),
+            bar_user: self,
             mapped: Some(mapped),
         })
     }
 }
 
 /// Access object for a mapped BAR1 region.
-pub(crate) struct BarUserAccess<'gpu> {
-    bar_user: Arc<BarUser<'gpu>>,
+pub(crate) struct BarUserAccess<'access, 'gpu> {
+    bar_user: &'access BarUser<'gpu>,
     /// [`BarUserAccess::release`] [`Option::take`]s this; `Some` at
     /// drop time means `release()` was never called.
     mapped: Option<MappedRange>,
 }
 
 #[expect(dead_code)]
-impl BarUserAccess<'_> {
+impl BarUserAccess<'_, '_> {
     /// Tear down the BAR1 mapping.
     pub(crate) fn release(mut self, mm: &mut GpuMm<'_>) -> Result {
         let mapped = self.mapped.take().ok_or(EINVAL)?;
@@ -162,7 +160,7 @@ pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
     }
 }
 
-impl Drop for BarUserAccess<'_> {
+impl Drop for BarUserAccess<'_, '_> {
     fn drop(&mut self) {
         if self.mapped.is_some() {
             kernel::pr_warn!(
@@ -174,6 +172,125 @@ fn drop(&mut self) {
     }
 }
 
+/// An owned BAR1 mapping of a region within a live VRAM allocation.
+///
+/// The mapping retains the region's backing allocation until its PTEs have been removed. A
+/// logical region may begin or end within a page; the containing pages are mapped while CPU
+/// access remains bounded to the requested byte range.
+pub(crate) struct Bar1Map<'gpu> {
+    bar1: &'gpu Bar1<'gpu>,
+    mapped: MappedRange,
+    region: VramRegion,
+    page_bias: usize,
+    logical_size: usize,
+}
+
+impl<'gpu> Bar1Map<'gpu> {
+    /// Maps a VRAM region through BAR1.
+    pub(crate) fn new(
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        region: VramRegion,
+        writable: bool,
+    ) -> Result<Self> {
+        let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
+        let region_start = region.address();
+        let region_end = region_start.checked_add(region.size()).ok_or(EOVERFLOW)?;
+        let map_start = region_start - region_start % page_size;
+        let map_end =
+            region_end.checked_add(page_size - 1).ok_or(EOVERFLOW)? / page_size * page_size;
+        let map_size = map_end.checked_sub(map_start).ok_or(EINVAL)?;
+        let num_pages = usize::try_from(map_size / page_size).map_err(|_| EOVERFLOW)?;
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        let page_bias = usize::try_from(region_start - map_start).map_err(|_| EOVERFLOW)?;
+        let logical_size = usize::try_from(region.size()).map_err(|_| EOVERFLOW)?;
+        let mut pfns = KVec::new();
+        for page in 0..num_pages {
+            let byte_offset = u64::try_from(page)
+                .map_err(|_| EOVERFLOW)?
+                .checked_mul(page_size)
+                .ok_or(EOVERFLOW)?;
+            let address = map_start.checked_add(byte_offset).ok_or(EOVERFLOW)?;
+            pfns.push(Pfn::from(VramAddress::from_raw(address)), GFP_KERNEL)?;
+        }
+
+        let mut vmm = bar_user.vmm.lock();
+        let mapped = vmm.map_pages(mm, &pfns, None, writable)?;
+
+        Ok(Self {
+            bar1: bar_user.bar1,
+            mapped,
+            region,
+            page_bias,
+            logical_size,
+        })
+    }
+
+    /// Returns the mapped physical VRAM region.
+    pub(crate) fn region(&self) -> &VramRegion {
+        &self.region
+    }
+
+    /// Returns the logical GPU virtual address visible through BAR1.
+    pub(crate) fn gpu_va_addr(&self) -> Result<u64> {
+        VirtualAddress::from(self.mapped.vfn_start)
+            .into_raw()
+            .checked_add(u64::try_from(self.page_bias).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)
+    }
+
+    /// Returns the requested logical mapping size.
+    pub(crate) const fn size(&self) -> usize {
+        self.logical_size
+    }
+
+    fn bar_offset(&self, offset: usize, width: usize) -> Result<usize> {
+        let logical_end = offset.checked_add(width).ok_or(EOVERFLOW)?;
+        if logical_end > self.logical_size {
+            return Err(EINVAL);
+        }
+
+        let access_offset = self.page_bias.checked_add(offset).ok_or(EOVERFLOW)?;
+        if !access_offset.is_multiple_of(width) {
+            return Err(EINVAL);
+        }
+
+        let base_vfn: usize = self.mapped.vfn_start.raw().into_safe_cast();
+        let base = base_vfn.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
+        base.checked_add(access_offset).ok_or(EOVERFLOW)
+    }
+
+    // BAR1 and the logical mapping have runtime sizes, so these accessors
+    // validate the offset, width, and alignment before performing MMIO.
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.bar1
+            .try_read32(self.bar_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.bar1
+            .try_write32(value, self.bar_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.bar1
+            .try_write64(value, self.bar_offset(offset, size_of::<u64>())?)
+    }
+
+    /// Invalidates the PTEs and releases the BAR1 virtual address.
+    ///
+    /// The backing VRAM region remains alive until unmapping completes.
+    pub(crate) fn destroy(self, bar_user: &BarUser<'gpu>, mm: &mut GpuMm<'_>) -> Result {
+        let mut vmm = bar_user.vmm.lock();
+        let result = vmm.unmap_pages(mm, self.mapped);
+        drop(self.region);
+        result
+    }
+}
+
 /// Run MM subsystem self-tests during probe.
 ///
 /// Tests page table infrastructure and `BAR1` MMIO access using the `BAR1`
@@ -183,7 +300,7 @@ fn drop(&mut self) {
 pub(crate) fn run_self_test(
     dev: &device::Device<device::Bound>,
     mm: &mut GpuMm<'_>,
-    bar_user: &Arc<BarUser<'_>>,
+    bar_user: &BarUser<'_>,
     bar1_pdb: u64,
     chipset: Chipset,
 ) -> Result {
diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
new file mode 100644
index 000000000000..4a4bd42c9f18
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! VRAM allocation and allocation-relative region helpers.
+
+use core::ops::Range;
+
+use kernel::{
+    gpu::buddy::{
+        AllocatedBlocks,
+        GpuBuddyAllocFlags,
+        GpuBuddyAllocMode, //
+    },
+    prelude::*,
+    ptr::Alignment,
+    sync::Arc, //
+};
+
+use super::{
+    GpuMm,
+    PAGE_SIZE, //
+};
+
+/// A physically contiguous VRAM allocation shared by its regions.
+///
+/// The buddy allocation is returned only after the block and every region or
+/// BAR1 mapping backed by it have been dropped.
+pub(crate) struct VramBlock {
+    _blocks: Pin<KBox<AllocatedBlocks>>,
+    address: u64,
+    size: u64,
+}
+
+impl VramBlock {
+    /// Return the physical start address of the allocation.
+    pub(crate) const fn address(&self) -> u64 {
+        self.address
+    }
+
+    /// Return the allocation size in bytes.
+    pub(crate) const fn size(&self) -> u64 {
+        self.size
+    }
+
+    /// Create a checked allocation-relative region.
+    pub(crate) fn region(self: &Arc<Self>, range: Range<u64>) -> Result<VramRegion> {
+        VramRegion::new(self.clone(), range)
+    }
+
+    /// Create a region spanning the complete allocation.
+    pub(crate) fn full_region(self: &Arc<Self>) -> VramRegion {
+        VramRegion {
+            backing: self.clone(),
+            address: self.address,
+            size: self.size,
+        }
+    }
+}
+
+/// A byte range within a shared [`VramBlock`].
+#[derive(Clone)]
+pub(crate) struct VramRegion {
+    backing: Arc<VramBlock>,
+    address: u64,
+    size: u64,
+}
+
+impl VramRegion {
+    fn new(backing: Arc<VramBlock>, range: Range<u64>) -> Result<Self> {
+        let size = range
+            .end
+            .checked_sub(range.start)
+            .filter(|size| *size != 0)
+            .ok_or(EINVAL)?;
+        if range.end > backing.size {
+            return Err(EINVAL);
+        }
+        let address = backing.address.checked_add(range.start).ok_or(EOVERFLOW)?;
+        backing.address.checked_add(range.end).ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            backing,
+            address,
+            size,
+        })
+    }
+
+    /// Return the physical address of the first byte in this region.
+    pub(crate) const fn address(&self) -> u64 {
+        self.address
+    }
+
+    /// Return the region size in bytes.
+    pub(crate) const fn size(&self) -> u64 {
+        self.size
+    }
+
+    /// Return a checked subregion relative to this region.
+    pub(crate) fn subregion(&self, range: Range<u64>) -> Result<Self> {
+        let size = range
+            .end
+            .checked_sub(range.start)
+            .filter(|size| *size != 0)
+            .ok_or(EINVAL)?;
+        if range.end > self.size {
+            return Err(EINVAL);
+        }
+        let address = self.address.checked_add(range.start).ok_or(EOVERFLOW)?;
+        address.checked_add(size).ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            backing: self.backing.clone(),
+            address,
+            size,
+        })
+    }
+}
+
+/// Allocate an exact VRAM range relative to a usable region's buddy base.
+pub(crate) fn alloc_vram_range(
+    mm: &GpuMm<'_>,
+    range: Range<u64>,
+    align: u64,
+) -> Result<Arc<VramBlock>> {
+    let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
+    let size = range
+        .end
+        .checked_sub(range.start)
+        .filter(|size| *size != 0)
+        .ok_or(EINVAL)?;
+    if !range.start.is_multiple_of(page_size) || !size.is_multiple_of(page_size) {
+        return Err(EINVAL);
+    }
+
+    let align = align.max(page_size);
+    let align_usize = usize::try_from(align).map_err(|_| EOVERFLOW)?;
+    let min_block_size = Alignment::new_checked(align_usize).ok_or(EINVAL)?;
+    let buddy = mm.buddy();
+    if range.end > buddy.size() {
+        return Err(ENOSPC);
+    }
+
+    let blocks = KBox::pin_init(
+        buddy.alloc_blocks(
+            GpuBuddyAllocMode::Range(range.clone()),
+            size,
+            min_block_size,
+            GpuBuddyAllocFlags::default(),
+        ),
+        GFP_KERNEL,
+    )?;
+
+    let mut address = None;
+    let mut allocation_end = None;
+    let mut covered = 0u64;
+    for block in blocks.as_ref().iter() {
+        let block_address = block.offset();
+        let block_size = block.size();
+        let block_end = block_address.checked_add(block_size).ok_or(EOVERFLOW)?;
+        address = Some(address.map_or(block_address, |start: u64| start.min(block_address)));
+        allocation_end = Some(allocation_end.map_or(block_end, |end: u64| end.max(block_end)));
+        covered = covered.checked_add(block_size).ok_or(EOVERFLOW)?;
+    }
+
+    let address = address.ok_or(ENOMEM)?;
+    let allocation_end = allocation_end.ok_or(ENOMEM)?;
+    let expected_address = buddy
+        .base_offset()
+        .checked_add(range.start)
+        .ok_or(EOVERFLOW)?;
+    if address != expected_address
+        || covered != size
+        || allocation_end.checked_sub(address).ok_or(EIO)? != size
+        || !address.is_multiple_of(align)
+    {
+        return Err(EIO);
+    }
+
+    Ok(Arc::new(
+        VramBlock {
+            _blocks: blocks,
+            address,
+            size,
+        },
+        GFP_KERNEL,
+    )?)
+}
-- 
2.53.0

