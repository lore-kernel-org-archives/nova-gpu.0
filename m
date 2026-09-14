Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2063ECBCF
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372268; cv=fail; b=JDzJVwqQ9h2bAcmKAhkuSuTGSi7tL2DYpAQ//l4p2MgY//4eO2dB6fDFiVKMXDFglOTK9QPgdNvNoTb0myuI/3vX9Z7TPZdyCqaSAX/5j4nURYUQuHwJHPUDYZZFgQZtc1HUyqPFfKg+2b+CT15qcU9zOJQiUnfFfslCz1LPfAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372268; c=relaxed/simple;
	bh=bqC6cGxzgozquakKX8563BGFsUwod76h8O6m6zVUKYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rV3d8chsRCXGGhuI84Y87rCY8Y3PE0EAr0X712N0kjaJnVADRhcgNA9eXHuNg+2RO8OoByNYkFCGXchYAabHMPokLF4O0jDoHpeEkDaKney0NPopx3kgSpuGAxli/N3R80IYzNLNqpw28Dh5RAnfXkCMHGSImm+6byDWX7LM9Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JaGb7x76; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JaGb7x76"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5Vior34/D2hU/8AM7qyK3kwrRxjDzbStcMEdxK7fdPAzxToRagVD5KKQLYeKEnseJbIm+9GG49Dd8yeWBZzMWlONWQHhbOaqYim44dw2gwk0p5dZxMko9mwKWG0NNnLsWhHnB8yL2f2UtJQvDr0uM5LqkMVAkhHm/FJbHfWNB1qSaJ5sOu5cVkgFMtnRq579JhR91qZexoACLnCIzaLW4gGQeOnwiU4j96T0Gc8uaEgFzKJAAbV9DjDGlS2Rz9jnOBaBsfgOy+vCGM0S5ynRA0opq/Hcx6cgPyrdq7aB2vIuh5FFJJHTSfHnUg1s3CUEq/AvwtzCodRaV4Y4XRxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKIFgrdhLIseUzDu9MwYpLHHcMsfAFCgnSs5hjJ4uUM=;
 b=inGM30XH6tesM8wVy03sb0eRmqprzsAnBhSAHk2SuP05yOTlKDtDuWn0KkUglRqjLUaqmeJIwj7k92o38L1jmjMCjxpMxK7J8ot2Bia+0tHGeoEIQ2GpSAj4oBMtRLyWMxLpHTEf7xPGYOx3/OoFtMITR+ectHbhEUSVOH+6Us9DQg4sgeK5dB+F3+fVIXJbTgwnxQskyiZUM5AhOhmzAeM9VgBB4XFncsghqNXYW+NsYLbCK1Re8tfwupTuox2Wj2RNvq5/lCXnO9Qxj5Uu9cqEDvSjpO9QwZ+gjVO3fpp3XrabrnbnFhm6T9mZ6c8+P1J5ovgaIWU9bZeGC+dcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKIFgrdhLIseUzDu9MwYpLHHcMsfAFCgnSs5hjJ4uUM=;
 b=JaGb7x76wt6cUkPtZX6cwKolz9idYjuq8z5VZoo7TpjX+m1/2XtefNmFmlqYcyfKbSoeh3cbLMvhabsVc2KgD6rRT4Dt4LcBvyD/Mx+KOdJgtoyzLDB1XOWlIA3PjezhAmcmlBePSBzeeyIaoCzCSR6ueuf1nk/7ifsqwD4QlTn9SmY5fdSqkMAWIK7ZIDHmW8F9sosgHLVMWeBmZ1U7Q9wo3b1jHQlfbgq8DEf39D+C4/VftAWESc6T+eTX/KGc0WdA9M1Bybg6J/r3IOwmNE32U2gWhhIILxlKin9v6Ca2r2YbA1oexejx2w1u9HqbIeKOk5leqAyBAWNowM2i7g==
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:50:56 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::94) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 07:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:35 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:34 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:27 -0700
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
Subject: [PATCH v2 09/32] gpu: nova-core: mm: borrow BarUser for temporary BAR1 access
Date: Mon, 14 Sep 2026 10:48:44 +0300
Message-ID: <20260914074907.1399629-10-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 67756681-2525-4c48-0455-08df1234e8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|6133799003|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WlhoqYg4SdtulgOKuG8Oe2yQFsEg1Nmu8PJDE68qCjyGMqvw9YdnpOvQ6Rn2bo3OwspB4QIjrU6OPAJPG65JaROvNxuQy08x/pBTgQ9rp+ySrBTN/g40oa0AbqbIu6+9uRU+7iqQ24jBbqrjGdcPL+CdrNJiO4CYf9XfMR/9NdJmykJ2044gzPDywmZ62BfI9K+j9LNjKAVcuGrWaugI7VJ8X5yxov8enud13kUm2pr2mySB7T/Pq1hXRuiYsW034PDHc7qIdXaeuzH/S1QY+dGW08xRuxRCvcM4Vg88AhGcZ1DYvZ9CEOly4Z8DoHjpiNCiag8/zrdxqUNwXaOl/jUlWCRsEzEnVQ8SIJPjfYupnXtBT714TPmkChyKuAUed9E7oYD+UUSYDukEMQgoIaM9ebBz+QH9bT9qdi03tA5Iy2m/VtRQQzBcqodisB+m3uZn1P/zV3fMk1eOZbpV8Sxwjxwr6+Jx7dHlO8en1WhWsLhyWQufK4Zf1glkRlVyQ0JmC7zTU+BCdcPdevQ0MkxgIm2YhpYQ0xwOn4Golvx9VarRmBmFzTEE0rcjQ216vTUSFQ1BWrIf5mOMbUjnbQkrJMbSQDRZuFKs7Lt3cnyc47lSzFbAwikIe6ouG5Qb+ScfvBsrlVdQIckx5XC4/J0b9FqwAU3XeMRp911EgEnLnxGVp/7/uzGMXXbNN7HzHnhiDYlpJveV8SMt5QkL4g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SXFxBKgIwi+s2AxlKK72hd6jORKIhfaU2a+ArX+pF6lMTgwG6PWittbZwGc2vkaTVvZo2UCTmpAKKzL0xoY2N8e2p0XhXnMeYEZsMMxiMLfKDIMXM6YaXQoqce0ut8ELB81O757Vq5bGDUMPTiDHRnZ1s1JPY3d+q3cCajg5cgJ2DvX0tt484W9PgFqIYvVLh2Bauu3C85VvVdpuoQbHGmHq3/4b2+YjXlOBnSstZRbXf9b3O5tA8XsC0n5Kodj3qYaKL4P7eDccsNrwunHUnqM5Gho9IEFDT98tEOj64SDG3a30ZFsXYEDyRS9JqRkiPrlg7jXVOdrjTfSuul/fQnO+no2heEiNYeDDRPIwhgvAws2RdtpSy1fU+IXB0Hiswp0BuLh+14keISZ5zHrqHFTo2nz3wDfJGfuXt48LKakxXt60FCAQyN/71BFwNKPh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:56.0205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67756681-2525-4c48-0455-08df1234e8ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784

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
index 227531b28541..ebf29b06a8e1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -16,7 +16,6 @@
         SizeConstants,
         SZ_4K, //
     },
-    sync::Arc,
 };
 
 use crate::{
@@ -327,7 +326,8 @@ pub(crate) struct Gpu<'gpu> {
     /// the GSP is still operational.
     mm: GpuMm<'gpu>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
-    bar_user: Arc<BarUser<'gpu>>,
+    #[pin]
+    bar_user: BarUser<'gpu>,
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
@@ -523,19 +523,16 @@ pub(crate) fn new<'a>(
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
-            bar_user: {
+            bar_user <- {
                 let pdb_addr =
                     VramAddress::from_raw(gsp_resources.boot_result.static_info.bar1_pde_base);
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
@@ -552,7 +549,7 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
             dev,
             this.mm,
             regions,
-            this.bar_user,
+            this.bar_user.as_ref().get_ref(),
             this.gsp_resources.boot_result.static_info.bar1_pde_base,
             this.gsp_resources.spec.chipset,
         ) {
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a5bc4042577b..8a934c55169f 100644
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
         usable_fb_regions: &[Range<u64>],
-        bar_user: &Arc<bar_user::BarUser<'_>>,
+        bar_user: &bar_user::BarUser<'_>,
         bar1_pdb: u64,
         chipset: Chipset,
     ) -> Result {
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 1bef01d147ad..2e6d229b1a23 100644
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
@@ -73,22 +70,22 @@ pub(crate) fn map(
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
@@ -162,7 +159,7 @@ pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
     }
 }
 
-impl Drop for BarUserAccess<'_> {
+impl Drop for BarUserAccess<'_, '_> {
     fn drop(&mut self) {
         if self.mapped.is_some() {
             kernel::pr_warn!(
@@ -180,10 +177,10 @@ fn drop(&mut self) {
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
@@ -386,7 +383,7 @@ pub(crate) fn run_self_test(
     drop(vmm);
 
     // Test 4: Exercise `BarUser::map()` end-to-end.
-    let bar_user = Arc::pin_init(
+    let bar_user = KBox::pin_init(
         BarUser::new(pdb_addr, chipset, SZ_64K.into_safe_cast(), bar1)?,
         GFP_KERNEL,
     )?;
