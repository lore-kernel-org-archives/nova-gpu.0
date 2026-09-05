Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7245041C
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596033; cv=fail; b=CpGjV1FygrLrKTcL20VwFn9zDOX/LYN+AZ0EQUnCUePNZcec4ReTe14g4bYkXD2q47ZOI+3lbv8HIjqW5M8KjxdBtEYgD6nmuj08n7D/cv1AocAhXdECvx0XYd/RiWxmu2ppTUKdPtxz+YkyOB4haI79X9+JtxbH3lXl6mToviE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596033; c=relaxed/simple;
	bh=odYB29p9G/GgjGcfFqo/yQjMt2iRyu+7nTKPsqoQemE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbR5QWcZ6o5c6iqsbPdvwWnrbqE+0kxHIGn4giBLdxaJyLwuNd4M9Wg2oATatxpyO1lm6s9rFRxGFNEUctOnbOhop4Y4EfWC4HZfzVlymj4D7KOdwPutwi+YsPWGu08gntAfU2dk/qE+56SwNTjnmbL6mKX50tf4ABXoANhq7wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QnAIUqh/; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QnAIUqh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA6S5gRALkVNegR9iRV35FV1CDFvp0nYwsaEMSLgJeRJt9QjWxoEKtB+dWPNkk1WFDJRGe4Xil0QyDkauru9d55QUhK2dh2XpUHGmwmPMsXj2uX+x0T0vZOikQabwBXFzy3Tw8w7dTiH5stZcLBm3b/WhlTzNV4pAbIonUkYRXPwtu/u/5ZB/p7wmrmcc6hJxhAsbc4dfkO0otNBTBs06q7TQ3HcUu+qg/VR3agr/LQw8+mAmGj8DIgYdMfNzYxszRRP139C2nj3H+nq33K3Pzng7aiOO1nDHPWDKnf+h4fLdxoPPoqIcpzhI9QEOqJcjgmG/aNXW0wET/lQH4R6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CBBJAwDu4ParXXrvmS1aoOvw40cm5YNvhzwPaqYNgs=;
 b=C29Xkw9EFj20sPf4HyumSi4nmr11mD+maLoWysbxDa/ezcXSRIcqa97uSl5C0P4VG2aWtqvj4a/Esy21qHJztYC7VMukIHRN8DcRwRSCjUYn+0t/ilHmnIMDBqHOOcuE360URfj/howng61U9jJBz2agz3vJB/+DWoikGwTUsKsLyX+D+WtVKSPWOt/BF2iYchVhUtIWopCxtza/m0fmL0vo1x9ihqtd7k8FdcdH+g2Qbw/cfCiqwvoqS0XL+HGxb/r8Wb7vEdLmpaQQqDGB3Byvbs8zOV9xRsRCsfAhTl/eeLzVf624mOivNvi1WQ1v2ZjUMa0FUcZ5vs9LqwiODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CBBJAwDu4ParXXrvmS1aoOvw40cm5YNvhzwPaqYNgs=;
 b=QnAIUqh/x6RF7g6KTfFXGpYfvo/o7zVuR+fPg2zWydc5ykRzzkWo6Pqo4ptX/98y+cvU0VCuVywAmLHtMXh6fAOUWv9XrA1Wxs8/aZrDZABmYOLUlZb1qipuhVNydK/o35WplbgVyMZel9IxqVicEdfn2xFGeQ6hhg9Td31aV3jgEhyb39TdkR5zXSd5HpIAz6060YmXly5Ccyhxij4sTow+1/sBbQEzRFRZEUb4UFSh59Lr7vhV2HvU5Ssg3eL0Terg50lrppi8Gn8RM75FG8CZVmI7b8focKpu4mmUyGpEVsoH+IHG3KbWlqlE+cbQfmBHH1ZUG6HioBLTfCnISQ==
Received: from MN2PR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:23a::7)
 by CH1PPF4CBE7339A.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:13:19 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::93) by MN2PR03CA0002.outlook.office365.com
 (2603:10b6:208:23a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:13:16 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:13:03 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:13:02 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:54 -0700
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
Subject: [PATCH 11/13] gpu: nova-core: vgpu: export lifecycle operations to VFIO
Date: Sat, 5 Sep 2026 11:11:14 +0300
Message-ID: <20260905081116.106613-12-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|CH1PPF4CBE7339A:EE_
X-MS-Office365-Filtering-Correlation-Id: 944ad1a5-5cb2-4ab7-9f81-08df0b258a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|7416014|376014|22082099003|18002099003|56012099006|3023799007|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5/uMI/i1s78o6VVMRFlILPfIULF3T5KP1SWnGIbz7NG3I4I9oRkuGGD3FPvJjUFV4otj9ofQ/+grq66CqvSuQ4sCI4yFmXQkEP8K3B6PQuaYMcy9PgkUIhfdbyRFBs/X7UPzVZPs6YuyMSGyxVW0eMr5Pom2Sp128kxxmf6dAUh0kv8v7uHYZo4M9k9c1PD/YxzUtK5Tu9jW4R+DwUnCyiXz/9rTp9fSFG8tfJq3uy2R67+FGPs7gx15ns8gpeB8IQfbJcnOxLTVSXCOUKBk3hvnVRYiQYLqh3Mj9av4Ah3hXocU1+yM8aypUGEHcdK+Kpzj4O54IHYXtXWrSEpBb/RWJgyFXOrx2rIxlnkogpx+XMKrPnKbHn3G9pSHy75uYP6XtLW+PITlaKNHnulSORR7UmmZWfOPEr3XpsEUnBJuJ/shV2zVqeDhSCmgW9aOn6x/FHdti1ens+/eKAxrcGS9SkGQjPXVJCmvndFqB3Q5Cn13uL9T6coZk6Wexqx59KGu/jO3qZK4hLjSmmC7oSy+TDgBKCMG2/Pv/DSul245mVuM58rjSS7/e9UtZeiX1b2ym+2FuCTOK4zeJdcd96TEbxUjyCiYGnRTA5Hc4JeKo8zvVRnSl/A4Hg9qnKPG7mY3GfHj7D4zWCr2fTYMRcr0rkx1UnmoFXNtk6H9Woqy4srsL5zuUd7rlZOAzVDKfMX2QjjaBVcHZdVuhti8/A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mb5lk/ushlCXCf+cxG5tDbke4qrAmdMuVIcXTo9VRKBmYeUFpBcgV7jEyv5Dx4TpU9KCHXzv6eyuHu+BGKQRWqDwou/dYrsZHZlnFNMwrVsVUQMCiYCPKTdG5w50Qdrumi0kFQPseiZzpmEa9roXjEz5pj/d//TKZcTGK9aA4UnJA4TIACQ/Su7XIRVWQd025fYPbdUIrMWl4M9+tzoSP4SAhjycIXvbQ6hsKQKvb+d5EwBghpskMLwA6CSo3Vw3aV/aomo7Ra2/r+v3quTRf8hk3X52hhWG22LMtrVnVVGRbgvFZamxzIKVO5N/HtemDhe8tLW/dbVfZFvOCkxyPJwFbyP6IdYt4uCCfKXXaPzVxdEB/ME1wSyblxqtvdkfG83ha0OQKzqZlAR00WzcGe9tz+foAgqrYxIhTIru01E9zrgbG9/Gd+P5JCGtwnsy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:13:16.6028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944ad1a5-5cb2-4ab7-9f81-08df0b258a0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4CBE7339A

The NVIDIA vGPU VFIO variant driver needs nova-core to create, reset,
and destroy firmware-backed vGPU instances on behalf of virtual
functions.

Add an internal C interface for these operations and implement its entry
points in Rust. The open operation queries the profile assigned to the
VF and creates and activates an instance. Close and reset run the
corresponding teardown and reinitialization sequences.

Keep registry locking, allocation, activation, publication, and rollback
inside VgpuManager so the VFIO caller does not coordinate manager state.
Extend the existing C export shim to publish the three GPL-only symbols
in the NOVA_CORE_VGPU namespace, and use the Rust #[export] attribute to
verify their signatures against the C declarations at build time.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs              |  55 ++++-
 drivers/gpu/nova-core/nova_core_exports.c |   5 +
 drivers/gpu/nova-core/vgpu/fw/commands.rs |   1 -
 drivers/gpu/nova-core/vgpu/instance.rs    | 145 ++++++++++-
 drivers/gpu/nova-core/vgpu/mod.rs         |  11 +-
 drivers/gpu/nova-core/vgpu/vfio.rs        | 282 ++++++++++++++++++++++
 include/drm/nvidia_vgpu.h                 |  28 +++
 rust/bindings/bindings_helper.h           |   1 +
 8 files changed, 504 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/vfio.rs
 create mode 100644 include/drm/nvidia_vgpu.h

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f88be4ca6ea5..b0b1f26c47ba 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::{
+    num::NonZero,
+    ops::Range, //
+};
 
 use kernel::{
     device,
@@ -9,6 +12,7 @@
     fmt,
     gpu::buddy::GpuBuddyParams,
     io::Io,
+    new_mutex,
     num::Bounded,
     pci,
     prelude::*,
@@ -17,7 +21,10 @@
         SizeConstants,
         SZ_4K, //
     },
-    sync::Arc,
+    sync::{
+        Arc,
+        Mutex, //
+    },
 };
 
 use crate::{
@@ -318,7 +325,8 @@ pub(crate) struct Gpu<'gpu> {
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
     /// the GSP is still operational.
-    mm: GpuMm<'gpu>,
+    #[pin]
+    mm: Mutex<GpuMm<'gpu>>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
     #[pin]
     bar_user: BarUser<'gpu>,
@@ -377,11 +385,30 @@ pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
     }
 
     /// Returns the firmware build identifier, if one was reported.
-    #[expect(dead_code)]
     pub(crate) fn build_id(&self) -> Option<firmware::BuildId> {
         self.gsp_resources.gsp.build_id()
     }
 
+    pub(crate) fn vgpu_manager(&self) -> &VgpuManager<'gpu> {
+        &self.vgpu
+    }
+
+    pub(crate) fn vgpu_total_vfs(&self) -> Option<NonZero<u16>> {
+        self.vgpu.total_vfs()
+    }
+
+    pub(crate) fn mm(&self) -> &Mutex<GpuMm<'gpu>> {
+        &self.mm
+    }
+
+    pub(crate) fn bar_user(&self) -> &BarUser<'gpu> {
+        &self.bar_user
+    }
+
+    pub(crate) fn bar0(&self) -> Bar0<'gpu> {
+        self.gsp_resources.bar
+    }
+
     pub(crate) fn new(
         pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: Bar0<'gpu>,
@@ -505,7 +532,7 @@ pub(crate) fn new(
             },
 
             // Create GPU memory manager owning memory management resources.
-            mm: {
+            mm <- {
                 let info = &gsp_resources.boot_result.static_info;
                 let usable_vram = info.usable_fb_regions.first().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
@@ -514,12 +541,15 @@ pub(crate) fn new(
                     chunk_size: Alignment::new::<SZ_4K>(),
                 };
 
-                GpuMm::new(
-                    bar,
-                    gsp_resources.spec.chipset,
-                    buddy_params,
-                    VramAddress::from_raw(info.total_fb_end),
-                )?
+                new_mutex!(
+                    GpuMm::new(
+                        bar,
+                        gsp_resources.spec.chipset,
+                        buddy_params,
+                        VramAddress::from_raw(info.total_fb_end),
+                    )?,
+                    "nova-core::gpu-mm",
+                )
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
@@ -550,10 +580,11 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
             .boot_result
             .static_info;
         let regions = &info.usable_fb_regions;
+        let mut mm = this.mm.lock();
 
         if let Err(err) = crate::mm::selftest::run(
             dev,
-            this.mm,
+            &mut mm,
             regions,
             this.bar_user.as_ref().get_ref(),
             info.bar1_pde_base,
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
index 6e80ca9792ee..cda87dfbfcdd 100644
--- a/drivers/gpu/nova-core/nova_core_exports.c
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -8,8 +8,13 @@
  * dependencies natively.
  */
 
+#include <drm/nvidia_vgpu.h>
 #include <linux/export.h>
 
+EXPORT_SYMBOL_NS_GPL(nvidia_vgpu_open, "NOVA_CORE_VGPU");
+EXPORT_SYMBOL_NS_GPL(nvidia_vgpu_close, "NOVA_CORE_VGPU");
+EXPORT_SYMBOL_NS_GPL(nvidia_vgpu_reset, "NOVA_CORE_VGPU");
+
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
 
 #include "exports_nova_core_generated.h"
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 8527e2c430bf..d378f2615084 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -23,7 +23,6 @@ pub(crate) enum RpcResponse {
 pub(crate) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
     SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
-    #[expect(dead_code)]
     Reset = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
     UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
 }
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index ed715951e92d..65abe45b8a2d 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -9,7 +9,8 @@
     prelude::*,
     ptr::Alignment,
     sizes::SizeConstants,
-    str::CString, //
+    str::CString,
+    sync::Mutex, //
 };
 
 use crate::{
@@ -41,7 +42,8 @@
         consts::gmc,
         fw::{
             CommBufferRegion,
-            MappedPluginLogBuffers, //
+            MappedPluginLogBuffers,
+            RpcMessage, //
         },
         log::VgpuLogBuffers,
         plugin_rpc::{
@@ -92,6 +94,22 @@ pub(crate) const fn vgpu_type_id(&self) -> u32 {
         self.vgpu_type_id
     }
 
+    pub(crate) const fn bar1_length(&self) -> u64 {
+        self.bar1_length
+    }
+
+    pub(crate) const fn pci_dev_id(&self) -> u32 {
+        self.pci_dev_id
+    }
+
+    pub(crate) const fn pci_subsys_id(&self) -> u32 {
+        self.pci_subsys_id
+    }
+
+    pub(crate) const fn fb_length(&self) -> u64 {
+        self.fb_length
+    }
+
     fn from_properties(properties: &VgpuProperties) -> Self {
         let mut name = [0; 64];
         let name_len = properties.name.len().min(name.len());
@@ -127,7 +145,6 @@ fn from_properties(properties: &VgpuProperties) -> Self {
 /// Field ordering is load-bearing for drop: `debugfs_logs` must be declared
 /// before `plugin_rpc` so that debugfs entries are removed (and in-progress
 /// readers drained) before the underlying `Bar1Map` is destroyed.
-#[expect(dead_code)]
 pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) gfid: Gfid,
     pub(crate) dbdf: Dbdf,
@@ -139,6 +156,7 @@ pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) vram_slot: VgpuVramSlot,
     debugfs_logs: Option<Pin<KBox<debugfs::Scope<VgpuLogBuffers>>>>,
     pub(crate) plugin_rpc: PluginRpc<'gpu>,
+    active: bool,
 }
 
 impl<'gpu> VgpuInstance<'gpu> {
@@ -221,7 +239,6 @@ pub(crate) struct InstanceInfo {
     pub(crate) vm_pid: u32,
 }
 
-#[expect(dead_code)]
 impl InstanceInfo {
     pub(crate) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32) -> Self {
         Self {
@@ -273,7 +290,6 @@ pub(crate) struct VgpuInstances<'gpu> {
     vram_slots: Option<VgpuVramSlotAllocator>,
 }
 
-#[expect(dead_code)]
 impl<'gpu> VgpuInstances<'gpu> {
     pub(crate) const fn new() -> Self {
         Self {
@@ -444,6 +460,7 @@ pub(crate) fn allocate_instance(
             vram_slot,
             debugfs_logs: None,
             plugin_rpc: PluginRpc::new(comm),
+            active: false,
         };
         match self.instances.push_within_capacity(instance) {
             Ok(()) => Ok(gfid),
@@ -466,6 +483,31 @@ pub(crate) fn allocate_instance(
         }
     }
 
+    /// Reset an active instance and scrub its guest framebuffer.
+    pub(crate) fn reset_instance(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        gfid: Gfid,
+    ) -> Result {
+        let instance = self
+            .instances
+            .iter_mut()
+            .find(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        if !instance.active {
+            return Err(EBUSY);
+        }
+
+        instance
+            .plugin_rpc
+            .rpc_call(dev, bar, gfid, RpcMessage::Reset, &[])?;
+        instance.scrub_guest_fb(dev, cmdq, bar, bar_user, mm)
+    }
+
     /// Shut down an instance, scrub its guest FB, and release its reservations.
     pub(crate) fn destroy_instance(
         &mut self,
@@ -483,6 +525,7 @@ pub(crate) fn destroy_instance(
             .ok_or(ENOENT)?;
 
         shutdown(dev, cmdq, bar, gfid)?;
+        self.instances[index].active = false;
         self.instances[index].scrub_guest_fb(dev, cmdq, bar, bar_user, mm)?;
         self.instances[index].release_ceutils(dev, cmdq, bar)?;
         cleanup(dev, cmdq, bar, gfid)?;
@@ -494,7 +537,6 @@ pub(crate) fn destroy_instance(
 }
 
 /// Query the vGPU type assigned to a VF by its DBDF.
-#[expect(dead_code)]
 pub(crate) fn query_assigned_vf_type(cmdq: &Cmdq, bar: Bar0<'_>, dbdf: Dbdf) -> Result<u32> {
     let request = u64::from(dbdf.into_raw()).to_le_bytes();
     let response =
@@ -507,7 +549,6 @@ pub(crate) fn query_assigned_vf_type(cmdq: &Cmdq, bar: Bar0<'_>, dbdf: Dbdf) ->
 }
 
 /// Query and decode one vGPU type using the typed NVKV schema.
-#[expect(dead_code)]
 pub(crate) fn query_vgpu_type(cmdq: &Cmdq, bar: Bar0<'_>, type_id: u32) -> Result<VgpuType> {
     let response = cmdq.send_gmc_and_receive(
         bar,
@@ -531,8 +572,7 @@ pub(crate) fn query_vgpu_type(cmdq: &Cmdq, bar: Bar0<'_>, type_id: u32) -> Resul
 /// Ask GSP to create the plugin task, wait for its BAR1 ready marker,
 /// initialize the shared RPC buffers, negotiate the protocol, send the
 /// instance configuration, and enable bus mastering.
-#[expect(dead_code)]
-pub(crate) fn activate_instance(
+fn activate_instance(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq,
     bar: Bar0<'_>,
@@ -576,3 +616,90 @@ pub(crate) fn activate_instance(
 
     Ok(())
 }
+
+/// Activate an instance already owned by the live-instance registry.
+///
+/// If activation fails, attempt full teardown before returning the original
+/// error.
+#[expect(clippy::too_many_arguments)]
+fn activate_registered_instance<'gpu>(
+    instances: &mut VgpuInstances<'gpu>,
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    gfid: Gfid,
+    fifo_engine_list: &FifoEngineList,
+    chipset: Chipset,
+    build_id: Option<&BuildId>,
+) -> Result {
+    let index = instances
+        .instances
+        .iter()
+        .position(|instance| instance.gfid == gfid)
+        .ok_or(EIO)?;
+    let activation_result = activate_instance(
+        dev,
+        cmdq,
+        bar,
+        &mut instances.instances[index],
+        fifo_engine_list,
+        chipset,
+        build_id,
+    );
+
+    if let Err(original_error) = activation_result {
+        if let Err(cleanup_error) = instances.destroy_instance(dev, cmdq, bar, bar_user, mm, gfid) {
+            dev_err!(
+                dev,
+                "vgpu_open: cleanup failed for gfid={} after activation error {:?}: {:?}\n",
+                gfid.0,
+                original_error,
+                cleanup_error,
+            );
+        }
+        return Err(original_error);
+    }
+
+    instances.instances[index].active = true;
+    Ok(())
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Allocate, register, and activate a vGPU instance.
+    ///
+    /// Keep the registry locked from allocation through activation or rollback
+    /// so duplicate checks and profile limits remain stable.
+    #[expect(clippy::too_many_arguments)]
+    pub(crate) fn create_instance(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &Mutex<GpuMm<'gpu>>,
+        info: InstanceInfo,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+    ) -> Result {
+        let fifo_engine_list = self.fifo_engine_list()?;
+        let mut instances = self.instances().lock();
+        // Global vGPU lock order: instances -> MM -> BAR-user VMM.
+        let mut mm = mm.lock();
+        let gfid = instances.allocate_instance(dev, cmdq, bar, bar_user, &mut mm, self, info)?;
+
+        activate_registered_instance(
+            &mut instances,
+            dev,
+            cmdq,
+            bar,
+            bar_user,
+            &mut mm,
+            gfid,
+            fifo_engine_list,
+            chipset,
+            build_id,
+        )
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index 61f799c2748e..34ab7eaed55b 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -9,6 +9,7 @@
 pub(crate) mod log;
 pub(crate) mod plugin_rpc;
 pub(crate) mod scrubber;
+mod vfio;
 
 pub(crate) use self::instance::VgpuInstances;
 
@@ -124,6 +125,14 @@ pub(crate) fn state(&self) -> VgpuState {
         self.state
     }
 
+    /// Returns the number of VFs available to an enabled vGPU boot.
+    pub(crate) fn total_vfs(&self) -> Option<NonZero<u16>> {
+        match self.state {
+            VgpuState::Disabled => None,
+            VgpuState::Enabled { total_vfs } => Some(total_vfs),
+        }
+    }
+
     /// Initializes the runtime parameters returned by GSP_INIT.
     pub(crate) fn init(
         self: Pin<&mut Self>,
@@ -140,7 +149,6 @@ pub(crate) fn init(
     }
 
     /// Returns the live-instance registry.
-    #[expect(dead_code)]
     pub(crate) fn instances(&self) -> &Mutex<VgpuInstances<'gpu>> {
         &self.instances
     }
@@ -156,7 +164,6 @@ pub(crate) const fn total_channels(&self) -> Option<u32> {
     }
 
     /// Returns the ordered FIFO engine list provided by GSP_INIT.
-    #[expect(dead_code)]
     pub(crate) fn fifo_engine_list(&self) -> Result<&FifoEngineList> {
         self.fifo_engine_list.as_ref().ok_or(ENODEV)
     }
diff --git a/drivers/gpu/nova-core/vgpu/vfio.rs b/drivers/gpu/nova-core/vgpu/vfio.rs
new file mode 100644
index 000000000000..967f74ba8ea4
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vfio.rs
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FFI exports for the VFIO variant driver.
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    driver::NovaCore,
+    gsp::commands::Dbdf,
+    vgpu::instance::{
+        query_assigned_vf_type,
+        query_vgpu_type,
+        Gfid,
+        InstanceInfo,
+        VgpuType, //
+    },
+};
+
+/// Transparent wrapper over the C `struct nvidia_vgpu_type_info`.
+#[repr(transparent)]
+pub(crate) struct VgpuTypeInfo(kernel::bindings::nvidia_vgpu_type_info);
+
+impl VgpuTypeInfo {
+    fn from_vgpu_type(vgpu_type: &VgpuType) -> Self {
+        Self(kernel::bindings::nvidia_vgpu_type_info {
+            pci_dev_id: vgpu_type.pci_dev_id(),
+            pci_subsys_id: vgpu_type.pci_subsys_id(),
+            bar1_length: vgpu_type.bar1_length(),
+        })
+    }
+}
+
+/// Run `f` with the nova-core driver data and bound device for a PF.
+///
+/// The higher-ranked callback prevents references reconstructed from the raw
+/// PCI device and its driver data from escaping this call.
+///
+/// # Safety
+///
+/// If `pf_pdev` is non-null, it must point to a live physical PCI function and
+/// remain valid for the duration of this call. The function must remain bound
+/// to nova-core, without concurrent unbind, for the duration of this call.
+unsafe fn with_nova_core<R>(
+    pf_pdev: *mut kernel::bindings::pci_dev,
+    gfid: u32,
+    f: impl for<'a> FnOnce(Pin<&'a NovaCore<'a>>, &'a device::Device<device::Bound>) -> Result<R>,
+) -> Result<R> {
+    if pf_pdev.is_null() {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: The caller guarantees that `pf_pdev` points to a live PCI
+    // device that remains bound for this call. `pci::Device` is transparent
+    // over `bindings::pci_dev`.
+    let pf: &pci::Device<device::Bound> = unsafe { &*pf_pdev.cast() };
+    if pf.is_virtfn() || !pf.is_physfn() {
+        return Err(EINVAL);
+    }
+
+    // Before interpreting drvdata as `NovaCore`, verify that this PF is still
+    // bound to the nova-core PCI driver. `managed_sriov` keeps the PF bound for
+    // the lifetime of its VFs.
+    // SAFETY: `pf_pdev` is valid and its `driver` pointer, when non-null,
+    // remains valid while the device is bound.
+    let driver = unsafe { (*pf_pdev).driver };
+    if driver.is_null()
+        // SAFETY: `driver` was checked for null above.
+        || !unsafe { (*driver).managed_sriov }
+        // SAFETY: `driver` was checked for null above.
+        || unsafe { (*driver).name } != crate::MODULE_NAME.as_char_ptr()
+        // SAFETY: `driver` was checked for null above.
+        || unsafe { (*driver).driver.owner } != crate::THIS_MODULE.as_ptr()
+    {
+        return Err(ENODEV);
+    }
+
+    let pf_dev: &device::Device<device::Bound> = pf.as_ref();
+    // SAFETY: `pf_pdev` is valid, so its embedded device is valid too.
+    let drvdata =
+        unsafe { kernel::bindings::dev_get_drvdata(core::ptr::addr_of_mut!((*pf_pdev).dev)) };
+    if drvdata.is_null() {
+        return Err(ENODEV);
+    }
+
+    // SAFETY: The driver identity check above establishes that drvdata was
+    // installed by nova-core as `NovaCore`. The caller guarantees that the PF
+    // cannot be unbound during this call, and PCI driver data stores the
+    // pointer returned by `Pin<KBox<NovaCore>>::into_foreign()`. Lifetimes do
+    // not affect layout. The callback's HRTB prevents the reconstructed
+    // reference, including NovaCore's bound-device lifetime, from escaping.
+    let nova_core = unsafe { Pin::new_unchecked(&*drvdata.cast::<NovaCore<'_>>()) };
+
+    let total_vfs = nova_core.gpu.vgpu_total_vfs().ok_or(ENODEV)?;
+    if gfid == 0 || gfid > u32::from(total_vfs.get()) {
+        return Err(EINVAL);
+    }
+
+    f(nova_core, pf_dev)
+}
+
+fn nvidia_vgpu_open_inner<'a>(
+    nova_core: Pin<&'a NovaCore<'a>>,
+    dev: &'a device::Device<device::Bound>,
+    gfid: u32,
+    dbdf: u32,
+    vm_pid: u32,
+) -> Result<VgpuTypeInfo> {
+    let gpu = &nova_core.gpu;
+    let gfid = Gfid(gfid);
+    let dbdf = Dbdf::from_raw(dbdf);
+
+    dev_dbg!(
+        dev,
+        "vgpu_open: gfid={} dbdf={:#x}\n",
+        gfid.0,
+        dbdf.into_raw()
+    );
+
+    let bar = gpu.bar0();
+    let cmdq = gpu.cmdq();
+    let vgpu = gpu.vgpu_manager();
+
+    let type_id = query_assigned_vf_type(&cmdq, bar, dbdf)?;
+    dev_dbg!(
+        dev,
+        "vgpu_open: gfid={} assigned type_id={}\n",
+        gfid.0,
+        type_id
+    );
+
+    let vgpu_type = query_vgpu_type(&cmdq, bar, type_id)?;
+    dev_dbg!(
+        dev,
+        "vgpu_open: gfid={} vgpu_type={} fb_length={:#x}\n",
+        gfid.0,
+        vgpu_type.vgpu_type_id(),
+        vgpu_type.fb_length()
+    );
+
+    let type_info = VgpuTypeInfo::from_vgpu_type(&vgpu_type);
+    let build_id = gpu.build_id();
+    vgpu.create_instance(
+        dev,
+        &cmdq,
+        bar,
+        gpu.bar_user(),
+        gpu.mm(),
+        InstanceInfo::new(gfid, dbdf, vgpu_type, vm_pid),
+        gpu.chipset(),
+        build_id.as_ref(),
+    )?;
+
+    Ok(type_info)
+}
+
+fn nvidia_vgpu_close_inner<'a>(
+    nova_core: Pin<&'a NovaCore<'a>>,
+    dev: &'a device::Device<device::Bound>,
+    gfid: u32,
+) -> Result {
+    let gpu = &nova_core.gpu;
+    let gfid = Gfid(gfid);
+
+    dev_dbg!(dev, "vgpu_close: gfid={}\n", gfid.0);
+
+    let cmdq = gpu.cmdq();
+    let mut instances = gpu.vgpu_manager().instances().lock();
+    let mut mm = gpu.mm().lock();
+    let result = instances.destroy_instance(dev, &cmdq, gpu.bar0(), gpu.bar_user(), &mut mm, gfid);
+    if let Err(error) = result {
+        dev_err!(dev, "vgpu_close: gfid={} failed: {:?}\n", gfid.0, error);
+    }
+    result
+}
+
+fn nvidia_vgpu_reset_inner<'a>(
+    nova_core: Pin<&'a NovaCore<'a>>,
+    dev: &'a device::Device<device::Bound>,
+    gfid: u32,
+) -> Result {
+    let gpu = &nova_core.gpu;
+    let gfid = Gfid(gfid);
+
+    dev_dbg!(dev, "vgpu_reset: gfid={}\n", gfid.0);
+
+    let cmdq = gpu.cmdq();
+    let mut instances = gpu.vgpu_manager().instances().lock();
+    let mut mm = gpu.mm().lock();
+    instances.reset_instance(dev, &cmdq, gpu.bar0(), gpu.bar_user(), &mut mm, gfid)?;
+
+    dev_dbg!(dev, "vgpu_reset: gfid={} done\n", gfid.0);
+    Ok(())
+}
+
+/// # Safety
+///
+/// If `pf_pdev` is non-null, it must point to a live physical PCI function
+/// that remains bound to nova-core, without concurrent unbind, for the
+/// duration of this call. `gfid` is the Guest Function ID (VF index + 1).
+/// `dbdf` is the VF's Domain:Bus:Device.Function encoded as
+/// `(domain << 16) | (bus << 8) | devfn`. `vm_pid` is the thread-group ID of
+/// the userspace VM process. If `type_info` is non-null, it must point to
+/// aligned, writable storage for a `struct nvidia_vgpu_type_info`, and no
+/// other thread may access that storage for the duration of the write.
+#[export]
+unsafe extern "C" fn nvidia_vgpu_open(
+    pf_pdev: *mut kernel::bindings::pci_dev,
+    gfid: core::ffi::c_uint,
+    dbdf: core::ffi::c_uint,
+    vm_pid: core::ffi::c_uint,
+    type_info: *mut kernel::bindings::nvidia_vgpu_type_info,
+) -> core::ffi::c_int {
+    if type_info.is_null() {
+        return EINVAL.to_errno();
+    }
+
+    // SAFETY: The caller upholds the exported function's contract. The HRTB
+    // callback confines all references derived from `pf_pdev` to this call.
+    let result = unsafe {
+        with_nova_core(pf_pdev, gfid, |nova_core, dev| {
+            nvidia_vgpu_open_inner(nova_core, dev, gfid, dbdf, vm_pid)
+        })
+    };
+
+    match result {
+        Ok(info) => {
+            // SAFETY: `type_info` was checked for null above and the caller
+            // guarantees that it points to writable storage.
+            unsafe { type_info.write(info.0) };
+            0
+        }
+        Err(error) => error.to_errno(),
+    }
+}
+
+/// # Safety
+///
+/// If `pf_pdev` is non-null, it must point to a live physical PCI function
+/// that remains bound to nova-core, without concurrent unbind, for the
+/// duration of this call. `gfid` must identify one of that PF's VFs.
+#[export]
+unsafe extern "C" fn nvidia_vgpu_close(
+    pf_pdev: *mut kernel::bindings::pci_dev,
+    gfid: core::ffi::c_uint,
+) {
+    // SAFETY: The caller upholds the exported function's contract. The HRTB
+    // callback confines all references derived from `pf_pdev` to this call.
+    let _ = unsafe {
+        with_nova_core(pf_pdev, gfid, |nova_core, dev| {
+            nvidia_vgpu_close_inner(nova_core, dev, gfid)
+        })
+    };
+}
+
+/// # Safety
+///
+/// If `pf_pdev` is non-null, it must point to a live physical PCI function
+/// that remains bound to nova-core, without concurrent unbind, for the
+/// duration of this call. `gfid` must identify one of that PF's VFs.
+#[export]
+unsafe extern "C" fn nvidia_vgpu_reset(
+    pf_pdev: *mut kernel::bindings::pci_dev,
+    gfid: core::ffi::c_uint,
+) -> core::ffi::c_int {
+    // SAFETY: The caller upholds the exported function's contract. The HRTB
+    // callback confines all references derived from `pf_pdev` to this call.
+    let result = unsafe {
+        with_nova_core(pf_pdev, gfid, |nova_core, dev| {
+            nvidia_vgpu_reset_inner(nova_core, dev, gfid)
+        })
+    };
+
+    match result {
+        Ok(()) => 0,
+        Err(error) => error.to_errno(),
+    }
+}
diff --git a/include/drm/nvidia_vgpu.h b/include/drm/nvidia_vgpu.h
new file mode 100644
index 000000000000..d49bb57db6f4
--- /dev/null
+++ b/include/drm/nvidia_vgpu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+#ifndef __DRM_NVIDIA_VGPU_H__
+#define __DRM_NVIDIA_VGPU_H__
+
+#include <linux/types.h>
+
+struct pci_dev;
+
+/**
+ * struct nvidia_vgpu_type_info - vGPU type descriptor returned by open
+ * @pci_dev_id: PCI device ID to present to the guest
+ * @pci_subsys_id: PCI subsystem ID to present to the guest
+ * @bar1_length: BAR1 aperture size in MiB
+ */
+struct nvidia_vgpu_type_info {
+	u32 pci_dev_id;
+	u32 pci_subsys_id;
+	u64 bar1_length;
+};
+
+int nvidia_vgpu_open(struct pci_dev *pf_pdev, unsigned int gfid,
+		     unsigned int dbdf, unsigned int vm_pid,
+		     struct nvidia_vgpu_type_info *type_info);
+void nvidia_vgpu_close(struct pci_dev *pf_pdev, unsigned int gfid);
+int nvidia_vgpu_reset(struct pci_dev *pf_pdev, unsigned int gfid);
+
+#endif /* __DRM_NVIDIA_VGPU_H__ */
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3d0511e4ab4f..d4540e719421 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -37,6 +37,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <drm/nvidia_vgpu.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
-- 
2.53.0

