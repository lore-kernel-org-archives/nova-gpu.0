Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443C49A3A2
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591426; cv=fail; b=TF2P7fmrWagQeGToeNkcgB8UVhBzNcV7WvlF+dRSUf6hQfYIHmeuPIDnIh3919fuF+Hpaa6pcaQ6jVlEFIRhjA8disEv6sMwdZS0FvGx0eZCgojjpFG6tSe+fRlCTd8y+8bcgOFqqhy7gc4XeD/JsIuXaZcHGHchfAsYYZlsvSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591426; c=relaxed/simple;
	bh=wCI7T48BiCUd9SEuipjaqZC08rGASyDcXhTALyDY6LI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwU/cJ4+wzvKMdFYh2FZw4C2Er+tuGIjqbM4itIy+4d8huq5qw3EYuBJm6Dz/jN/D9GvkHUs9LcOfFhQrYDiBPGlTilaAFQjYrMhLqGFI2LgqExUn+3+3ak13sENxCUrgqJowUd/J0k2ZDLL2vGmNdqGlvIJwklG3jyLdjs3kC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rDbUz91t; arc=fail smtp.client-ip=52.101.43.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rDbUz91t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEhLccrPs/PH6oHJksUlc0copvhjrngnm1UFCK5340hp9HVzuYaNNFoPeq+XpYg/e6OCuRzyxCWfdJE875IkFXN/FMFOw+CnSq+75adlIeS4/LzuAzedKeTHfRKIxHwLB9yioU104qh0th8GlIjegMY8SlEuZ8Zhyg243mBSVy0g2ZeZRHBG+yCKRSNnWKPxn2+fgtbqRUtsb2sbuRD0OleV/Kcjc5dvOoh5d31U2rjfCy2FNyHhq+FGVS+YsOiFrjNoQ9W9KQizpEEl1TT2Y9nJ36R5ht5eOlWSbyBg+Qxlqq18tlWVAoB358ioXu+8qc7Q8YD28w6yZxO5CcGinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBeSNWI/NrFIYvxRhnHcnx27ZxXUuamLj/xF0HV/jGE=;
 b=ITqL+KUn2I3j0HuiIjFX/zuoUSihkOguDXP/N8yHRMZWQMlPVchq8XB0pFk2sE8Zlr5ANVrzXRjyc8z9bAl/ui4bwxESxVZNILBf0d3v2VTUAi+lSxbZbFoaLri09NxDaRpxHRiOEwBR4OJkRYKZmlzl0PejAPSmp5drREmsIY8TBp6/y9Jieot/MyNTib+sCCIAABlWqfNOAWe7Y+BjmrYM7Ic7cw7klCdhj+pNlyow6dpHc7xBzQDLAjBaOOL3G0uTK4sGwlZpcDaKV3S0Jcr5fRTEQHjhjtoSafU2+8Md90GBp5WdPEQ2dksuHDsYviK4ZGuSnJLvrUrqUuX6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBeSNWI/NrFIYvxRhnHcnx27ZxXUuamLj/xF0HV/jGE=;
 b=rDbUz91tARAZTwL+bBwtlQLcOD/UPKI3FFLTxT28Yi0FjuBkWBV6FSSbR3dbsTZJkOjl0/ybJnBFmGSKkfcDLkxtE6X6tRGMoQmamBRKwedQebGw1dG8VFXgVysMj9vWOXorM8m4sn6DFBrB5OfBVl87i/VtF01LBfysmjWIh7zZxpm+hRD88gmW5VjX9J8A0AL1KV8OrJL3KKISJClTS2vxIxy+U4PR6732IS205ySuzQO4oNHlsBz9200yV+vWhW6b0nbyvvhnRkkXiUwu8MOhcWtdBwPsohcnWZYfu9m2tXMVpvqWnPKvAsxSLhGS9kdW9tfu50kMlLE1yzhsKw==
Received: from MW4P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::24)
 by MW4PR12MB6975.namprd12.prod.outlook.com (2603:10b6:303:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:30:15 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::d) by MW4P221CA0019.outlook.office365.com
 (2603:10b6:303:8b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:30:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:58 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:56 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:48 -0700
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
	<zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 08/31] gpu: nova-core: mm: borrow BarUser for temporary BAR1 access
Date: Mon, 28 Sep 2026 13:28:11 +0300
Message-ID: <7d3fb1c09f9c93b440cb5d83dd9665e6a4e39096.1790580105.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790580105.git.zhiw@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|MW4PR12MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcb925a-34af-4eb6-a747-08df1d4b7c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|23010399003|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y2WK8eyQiPJl65Iq1127vwdhJlET5M+u4jk9nXPBMy9Iti7eXaDR571P9Kwf1Shxvmv+hnU4IcLjc/5MSnojiwgikYXuI1eBEvapmYqiB8snya8RZkMzCWCDwdsvju+Gyi3bokSxFvMm/O1Ij0889bGbKKUbAPhWTriAqwiVPutQiezT9MsIeYJ2LmZ8Up+mic03t2XaZTfvix0H0IJN48GJ08A1jhSvh3W0oCYUreyY39zZAZSEro3WbsypJXoYdW2NgEiTusguJnidpobIZZ03hN9Nre0SseQiKOel3g6jqFDffi9t41/AT5PcLtIIF9ean1deV3cfHcMicOHaks5QHyffbqfiCfdlbVp67PWBcu6uo1OhYcMdE/vYlr/wgEtGJtS3nQ+PDttV0XFV9OIguVtaycuGDUqCUVCAliYZdCPO8j2D1VhzUCV74i3bNQE45MGJNqbZe8Dtmu8DWU4xKPfqa7KQ84ZG1ABFMMDjYK2ATyagvpUKQl/qt9jwTHVe+THGJHOtZJnABgNgRu+sCoJoZsQrVYRupKSCn7wkdpZbZDrdpRa7eK8uvxuoL5X2bxEOMsxJXhykGGcuGQ7TmS3UA+PJlifkLcqNB3CJpy8gtJsbeCGTyY7ok91XdEiq+cYlXL0D/alv8KBE1Hgsc9dtOLcosyrbeHlAR4xzVnhTCkFrCwQvcas6225Pjvops0ZmaLNIs03t4SXDjg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(23010399003)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wpuM8WZukss3nvd17gcwYPEcTboLCoNeaGMko2AO4dDPgA5CjVNwWVBW8lbGedu5kcnWZlWRdUmkp/AnNWW83fA4J/M4bSMNVlebX6d6RwdRMdJSpVEaTugFpY0sPjtRQQfRKSTkudg3H6II6FRbu1RNEootA2pDeFqNiXon3THPZLF/o15Rnwz7PwQDhV65U3vNlJM/yj/EN66RdHDOfGKHxvuV+zQGD7H+pZjWsHo0+DsyBBkb1YVmp2PmnWxqICgTURsrxwGTyT1tsJ05uqouoX+XlCEvVpsnxhc348ir38l3CBx75nDnmJx3iqyvDJlYSvAQQiYGGYBBIpi9UI97OjmyojHdigNtgxhiHbjkH8iPX6sLKqgUKA0DSJlp3pM6jFQKUwR+1B924lN1vrYZVBeuABnq2KycyctURGky+KCocCaxilavlNcGlLda
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:15.7478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb925a-34af-4eb6-a747-08df1d4b7c81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6975

Temporary BAR1 access needs a borrow of the GPU-owned BarUser. Store
BarUser inline in Gpu and borrow it in BarUserAccess, avoiding a separate
allocation and reference counting for these accesses. Update the existing
self-test entry points to accept the borrowed interface.

No functional change is intended.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         | 21 +++++++++------------
 drivers/gpu/nova-core/mm.rs          |  5 ++---
 drivers/gpu/nova-core/mm/bar_user.rs | 27 ++++++++++++---------------
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 11d9986c4b19..97b33d4b2631 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -16,7 +16,6 @@
         SizeConstants,
         SZ_4K, //
     },
-    sync::Arc,
 };
 
 use crate::{
@@ -340,7 +339,8 @@ pub(crate) struct Gpu<'gpu> {
     /// the GSP is still operational.
     mm: GpuMm<'gpu>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
-    bar_user: Arc<BarUser<'gpu>>,
+    #[pin]
+    bar_user: BarUser<'gpu>,
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
@@ -545,18 +545,15 @@ pub(crate) fn new<'a>(
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
-            bar_user: {
+            bar_user <- {
                 let pdb_addr = VramAddress::from_raw(gsp_resources.static_info().bar1_pde_base());
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
@@ -573,7 +570,7 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
             dev,
             this.mm,
             info.usable_fb_regions(),
-            this.bar_user,
+            this.bar_user.as_ref().get_ref(),
             info.bar1_pde_base(),
             this.spec.chipset,
         ) {
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index ea85c821f0e2..a835180db6c5 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -298,8 +298,7 @@ pub(crate) mod selftest {
 
     use kernel::{
         device,
-        sizes::SizeConstants,
-        sync::Arc, //
+        sizes::SizeConstants, //
     };
 
     use super::*;
@@ -309,7 +308,7 @@ pub(crate) fn run(
         dev: &device::Device<device::Bound>,
         mm: &mut GpuMm<'_>,
         mut usable_fb_regions: impl Iterator<Item = Range<u64>>,
-        bar_user: &Arc<bar_user::BarUser<'_>>,
+        bar_user: &bar_user::BarUser<'_>,
         bar1_pdb: u64,
         chipset: Chipset,
     ) -> Result {
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index cd2d0271e64c..414c69e037ee 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -7,10 +7,7 @@
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
@@ -60,12 +57,12 @@ pub(crate) fn new(
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
@@ -73,21 +70,21 @@ pub(crate) fn map(
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
     /// Cleared only after PTE invalidation and its TLB flush succeed.
     mapped: Option<MappedRange>,
 }
 
 #[expect(dead_code)]
-impl BarUserAccess<'_> {
+impl BarUserAccess<'_, '_> {
     /// Tear down the BAR1 mapping.
     pub(crate) fn release(mut self, mm: &mut GpuMm<'_>) -> Result {
         self.unmap(mm)
@@ -167,7 +164,7 @@ pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
     }
 }
 
-impl Drop for BarUserAccess<'_> {
+impl Drop for BarUserAccess<'_, '_> {
     fn drop(&mut self) {
         if self.mapped.is_some() {
             kernel::pr_warn!(
@@ -185,10 +182,10 @@ fn drop(&mut self) {
 /// address space. Uses the `GpuMm`'s buddy allocator to allocate page tables
 /// and test pages as needed.
 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
-pub(crate) fn run_self_test(
+pub(super) fn run_self_test(
     dev: &device::Device<device::Bound>,
     mm: &mut GpuMm<'_>,
-    bar_user: &Arc<BarUser<'_>>,
+    bar_user: &BarUser<'_>,
     bar1_pdb: u64,
     chipset: Chipset,
 ) -> Result {
@@ -401,7 +398,7 @@ pub(crate) fn run_self_test(
     drop(vmm);
 
     // Test 4: Exercise `BarUser::map()` end-to-end.
-    let bar_user = Arc::pin_init(
+    let bar_user = KBox::pin_init(
         BarUser::new(pdb_addr, chipset, SZ_64K.into_safe_cast(), bar1)?,
         GFP_KERNEL,
     )?;
