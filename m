Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB63CF05E
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591540; cv=fail; b=nfobfhzF0h9yw+115uIANz8dbaLuGAlkBMu85nbcQACNkQoXVmcuX748l1CmndQuxRm4rOLMRwKEqB5eatlPdFhsrsWnpJGuOEVEQxT8vOPZ/Z+xJa3iGfQM2DPDbYT+EW9qVvj972E/sSvs3kt6+zJUwQDm5fBGX/k7R0bTPgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591540; c=relaxed/simple;
	bh=sumCsyzMrBrTQvKa6uF8SZHOxxSkiAZCvFnHVsNCDlQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OajNLFqSQ+PZi/QmdbPuEEFfxim8UJ7ucUWOQA0B7Pmd5CAMmNEm4jh6q6gAeawvKaI3qanSIyVaumjWo+sMrVgcqdGWlRNXtL3v6qV4LK8REWrQDsfOB4MSD9+yLRYyH6jGdMEFhFgRL7Am0HJreTotO8ORL3v61ri7L4g/MvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CtiS3piV; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CtiS3piV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce+n5J6xbqzURGSMURidxYck4317MZ/BWH8MNFJggjx9T0uNJbZ1/OZSVgEWa/jZz8LQGOwnaoJTkNnLgVS4ipgDPL20K859LMWiULDHcdhPyDmvBVWi7pP+iYknTcJeIBQgc01V5NJWPiS4gO4LRQRnk/kQI3pZnjFPNuVJ5o+XDbLM3FrGahDQsr3cn4XvXQDWZOlhcJtatzX2OtW7WboYbge4i3Fcp2MLmGmakKycYfNZsQB0bV8ikbPNV98WdVk5uKNsWPUYEuwB92A6kw936h3cVzAKIM2G2zBkBHEUF/aGZJaI+PBHRjLooaYgZ8wICdLEGPM0/BkGUFbI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vxa6RNi0qqpVZ2aM8x/dsh/9o9NS14KwtoTvQiy2CB0=;
 b=PouxU62BA/gtOa302DlFs62nNsMy7atofMMmf0pf20eJHwIC85RoPiUNZCTwyCR88JJzntHNw9dgXPYY0S3l4D75MSXdk56Cj+XLj8U/P5qkprcLro3VXJpIQyRnOmXGVD59cYQOB9FpgfpQ5l43T5zkKwBVAJIQFkK3nK4ndNYctNJYfJ+adksppk3bG6JqkLMS+3F6KW0AZbBuc+PYqKv5nUu9ev8R3LOi5I4tBackkSFVZfy2LqFGbqorxg/KZsRE00z7dZB2JcL48Sf2T0mtKX68kiGcwnnLiectNdr9VMN/slTY6kysK6hucS09CemlQ8U37PHffPfgMjQFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vxa6RNi0qqpVZ2aM8x/dsh/9o9NS14KwtoTvQiy2CB0=;
 b=CtiS3piVlFN/UrodqkWXSr/Q6yiv9nwei+wMPQTeLPqp3qP+0E22d/u38OF7+kJM4MNGzNGaBNt5URe8Goe/Yc490ogR9Q0NIPni4bNwn9SVotmdav1xgfFc14QaQjBjQfQG3TAZ5n4uaDfZDXNueLC7sgr9O7RkFY3GpL2luzVIPKP/4aUOioeinzairJuplZD5FOQ41qsuPcLjXF0PR89pkr354NioNICTIDqZkmdwopUyDPVamy0OLbZzDo/OVsvyXkqqEJKfYDHjVPvFSkxl3ttdhrTTzAWJ37vQBai1eEua4pxGtHPHKk+947edkf5lQk8wZNeWpuSTLXBhvw==
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:32:08 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::5) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:32:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:48 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:40 -0700
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
Subject: [PATCH v3 21/31] gpu: nova-core: vgpu: add instance boot
Date: Mon, 28 Sep 2026 13:28:24 +0300
Message-ID: <e2056e8cec4ce6b68a16d6b64e1640c1ce03598d.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5875dd6b-2568-4ed4-8d7d-08df1d4bbf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|7416014|376014|11062099010|18002099003|22082099003|3023799007|10067099003|56012099006|5023799004|11063799006|6133799003|7136999003;
X-Microsoft-Antispam-Message-Info:
	6/0rb9qUvms62XzqSH0iQ7Mmgh/tc8Ea9Njdw4vI8n3DHGmCM8hXyz6a1hkOUy8+IX/gfmQAqZPJhFcN+bC9Fc4v+9ThOU2s/7CeX+lH4S0Az7Hd8InrlXyvjBHiMXDaggY2Eq8Ayb92UaLtc7ZAj7/kisM02LVGWaXAn3GAmytXUWxu8GeVqN9LnSyWTObxUgZE1FMqIn2ZwjCNJ9ul/zLcI//fcAY6499tk6X4DY/6Gv4N4rRCEVyn0F4fKP6kryyiwIESBgHysX6yPVMa+xQ6gnXKaSXeg4jnYYYjbn3YSdUQzhyao4SbWwItWusFOi6TsUlwC3qvlpNlZhNRthBrSxR8drX0XqQMUTBQr3o2hVWPIdNa66O2PumJT43QflVT5zKbfhoWg6Q41pgfaojQJEqndLlShWB6iFLAgCmrOYW7L/FQPzn5TyW28VsXlHj1p6mpK3MPY7Gj1ayS+rRUQmnIuet2sEnZMT4VK5+YIr51Gw5Xu0vkhBO5rMOZ81rQ7xXDfjvOmLdZj+Mo3ZoyjGu9hi4YzwkJZIwVHfqy6nwyostpZPpdyltw8AGv/0x4wFWqpbSkRF+vq1rNjSxzgDOKlmlSs3BS75xFVWD4Q/6iS/XfSGh9VXDX38dYuzs64UzItUzudKVg76DbviNvHceWqYZfJ6eNFJugsZnp95UDxARX9UT35HYaEb+cqSIao34ppS4ylBh4eyQJtw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(7416014)(376014)(11062099010)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5KjOifoAzAi9AZNu4Emgro8r8ASeUJb9h0hKzrucsgAqTsyOTEeVBy1rEt7M/rqp+NOE5JLwx06UfXpRje6VbIzbA1siEtJr9LWDviDmfj/tKeNveTC7mz/7HRm5Dfyw7uj9BS3eRgZTRdPMWM6iX/jgEUlVjUjZfVFVnvNOTmkKawnL4DzMbBlB3Lp0VB54qdhFTG5plOU6qw8dISIp1eAsiIvS95PJmicDWWoa0JQd8lhPgPdJ+2hqe4hgQBxrUXS5kf+WC/3vhUrEbYlwla31NmrzHcCKJisy1HDI7YgAXnPEly3yY5E2vp4Or9d9Li9OpeWG/u72UsGCm4POeYcde0UbxFEVgkkah4HyVZShnhVXwganC9R0OjASQMJ1WVIAGHkfwU2pysniOGFTnFtQOtg45XrVkBE0oENNtKEIAC3hLMEOqQInGoc/vpF4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:08.1186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5875dd6b-2568-4ed4-8d7d-08df1d4bbf7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389

Start an allocated instance's GSP plugin with its channel map, VRAM,
plugin heap and log regions. Clear the old ready marker before BOOTLOAD
and wait for firmware to publish a new one.

Retain the command queue and memory dependencies needed by the instance,
and map its communication buffers before boot.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                  |  71 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs      |   1 -
 drivers/gpu/nova-core/vgpu.rs                 |  30 +++-
 drivers/gpu/nova-core/vgpu/commands.rs        |  21 ++-
 drivers/gpu/nova-core/vgpu/fw.rs              |   3 +
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |   2 -
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |  16 +-
 drivers/gpu/nova-core/vgpu/instance.rs        | 152 ++++++++++++++++--
 drivers/gpu/nova-core/vgpu/vram.rs            |   1 -
 9 files changed, 245 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b41a9921381d..012c7e6abca6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -8,6 +8,7 @@
     fmt,
     gpu::buddy::GpuBuddyParams,
     io::Io,
+    new_mutex,
     num::Bounded,
     pci,
     prelude::*,
@@ -16,6 +17,7 @@
         SizeConstants,
         SZ_4K, //
     },
+    sync::Mutex,
 };
 
 use crate::{
@@ -327,6 +329,7 @@ fn static_info(&self) -> &gsp::commands::GspStaticInfo {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    /// Drops before the MM, BAR1 mappings and GSP needed for instance teardown.
     vgpu: Option<Pin<KBox<VgpuManager<'gpu>>>>,
     /// GSP event interrupt registration.
     ///
@@ -339,7 +342,8 @@ pub(crate) struct Gpu<'gpu> {
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
     /// the GSP is still operational.
-    mm: GpuMm<'gpu>,
+    #[pin]
+    mm: Mutex<GpuMm<'gpu>>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
     #[pin]
     bar_user: BarUser<'gpu>,
@@ -463,22 +467,7 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
-            vgpu: {
-                let info = &gsp_resources.boot_result.static_info;
-                match gsp_resources.vgpu_state {
-                    VgpuState::Disabled => None,
-                    VgpuState::Enabled { .. } => Some(KBox::pin_init(VgpuManager::new(
-                        // SAFETY: `chid_pool` is initialized above at its final pinned address.
-                        // The private manager and its pool borrow cannot escape this `Gpu`.
-                        // Completed field drop order drops the manager before the pool; on failure,
-                        // pin-init drops it before the earlier-initialized pool.
-                        unsafe { &*core::ptr::from_ref(chid_pool.as_ref().get_ref()) },
-                        &info.fifo_engine_list(),
-                        info.vmmu_segment_size,
-                        TOTAL_CHANNELS,
-                    ), GFP_KERNEL)?),
-                }
-            },
+
 
             // GSP boot left the SWGEN0 latch set and pending bits in the tree.
             _: {
@@ -529,7 +518,7 @@ pub(crate) fn new<'a>(
             },
 
             // Create GPU memory manager owning memory management resources.
-            mm: {
+            mm <- {
                 let info = gsp_resources.static_info();
                 let usable_vram = info.usable_fb_regions().next().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
@@ -538,12 +527,15 @@ pub(crate) fn new<'a>(
                     chunk_size: Alignment::new::<SZ_4K>(),
                 };
 
-                GpuMm::new(
-                    bar,
-                    gsp_resources.spec.chipset,
-                    buddy_params,
-                    VramAddress::from_raw(info.total_fb_end().ok_or(ENODEV)?),
-                )?
+                new_mutex!(
+                    GpuMm::new(
+                        bar,
+                        gsp_resources.spec.chipset,
+                        buddy_params,
+                        VramAddress::from_raw(info.total_fb_end().ok_or(ENODEV)?),
+                    )?,
+                    "nova-core::gpu-mm",
+                )
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
@@ -558,6 +550,34 @@ pub(crate) fn new<'a>(
                     bar1,
                 )?
             },
+
+            vgpu: {
+                match gsp_resources.vgpu_state {
+                    VgpuState::Disabled => None,
+                    VgpuState::Enabled { .. } => {
+                        // SAFETY: These sibling fields are initialized at their final pinned
+                        // addresses. The private manager cannot escape this `Gpu`, and is dropped
+                        // before all its dependencies, both here on failure and on normal removal.
+                        let (cmdq, bar_user, mm, chid_pool) = unsafe {
+                            (
+                                &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                                &*core::ptr::from_ref(bar_user.as_ref().get_ref()),
+                                &*core::ptr::from_ref(mm.as_ref().get_ref()),
+                                &*core::ptr::from_ref(chid_pool.as_ref().get_ref()),
+                            )
+                        };
+                        Some(KBox::pin_init(VgpuManager::new(
+                            dev,
+                            cmdq,
+                            bar_user,
+                            mm,
+                            chid_pool,
+                            gsp_resources.static_info(),
+                            TOTAL_CHANNELS,
+                        ), GFP_KERNEL)?)
+                    }
+                }
+            },
         })
     }
 
@@ -567,10 +587,11 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
         let this = self.project();
         let dev = pdev.as_ref();
         let info = this.gsp_resources.static_info();
+        let mut mm = this.mm.lock();
 
         if let Err(err) = crate::mm::selftest::run(
             dev,
-            this.mm,
+            &mut mm,
             info.usable_fb_regions(),
             this.bar_user.as_ref().get_ref(),
             info.bar1_pde_base(),
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 7381b30f3680..b1087d950b30 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -335,7 +335,6 @@ pub(crate) struct FifoEngineList {
 }
 
 impl FifoEngineList {
-    #[expect(dead_code)]
     pub(crate) fn gmc_ids(&self) -> &[u32] {
         // PANIC: The type invariant bounds `count` by the array capacity.
         &self.gmc_ids[..self.count]
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 024cb13694f4..84c4d0b3839d 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -19,7 +19,17 @@
         ChannelIdPool,
         Chipset, //
     },
-    gsp::commands::FifoEngineList, //
+    gsp::{
+        cmdq::Cmdq,
+        commands::{
+            FifoEngineList,
+            GspStaticInfo, //
+        }, //
+    },
+    mm::{
+        bar_user::BarUser,
+        GpuMm, //
+    }, //
 };
 
 mod commands;
@@ -99,6 +109,10 @@ fn query_state(
 pub(crate) struct VgpuManager<'gpu> {
     #[pin]
     instances: Mutex<VgpuInstances<'gpu>>,
+    dev: &'gpu device::Device<device::Bound>,
+    cmdq: &'gpu Cmdq<'gpu>,
+    bar_user: &'gpu BarUser<'gpu>,
+    mm: &'gpu Mutex<GpuMm<'gpu>>,
     chid_pool: &'gpu ChannelIdPool,
     /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
     vmmu_segment_size: u64,
@@ -109,14 +123,22 @@ pub(crate) struct VgpuManager<'gpu> {
 impl<'gpu> VgpuManager<'gpu> {
     /// Retains runtime parameters from a completed vGPU-enabled GSP boot.
     pub(crate) fn new(
+        dev: &'gpu device::Device<device::Bound>,
+        cmdq: &'gpu Cmdq<'gpu>,
+        bar_user: &'gpu BarUser<'gpu>,
+        mm: &'gpu Mutex<GpuMm<'gpu>>,
         chid_pool: &'gpu ChannelIdPool,
-        fifo_engine_list: &FifoEngineList,
-        vmmu_segment_size: u64,
+        info: &GspStaticInfo,
         total_channels: u32,
     ) -> impl PinInit<Self> + use<'gpu> {
-        let fifo_engine_list = *fifo_engine_list;
+        let fifo_engine_list = info.fifo_engine_list();
+        let vmmu_segment_size = info.vmmu_segment_size;
         pin_init!(Self {
             instances <- new_mutex!(VgpuInstances::new(), "nova-core::vgpu-instances"),
+            dev,
+            cmdq,
+            bar_user,
+            mm,
             chid_pool,
             vmmu_segment_size,
             total_channels,
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 679c22b0381a..2e9c250b65ab 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -8,7 +8,9 @@
 
 use kernel::{
     device,
-    prelude::*, //
+    prelude::*,
+    time::Delta,
+    transmute::AsBytes, //
 };
 
 use crate::gsp::{
@@ -25,6 +27,7 @@
         commands::{
             VgpuPropertiesSchema, //
         },
+        GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
         GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
     }, //
@@ -89,3 +92,19 @@ pub(super) fn query_vgpu_properties(
         Ok(properties)
     }
 }
+
+/// Send BOOTLOAD and check its firmware status.
+pub(super) fn send_bootload(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    payload: &[u64],
+) -> Result {
+    let command_id = GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK;
+    let response = cmdq.send_gmc_and_receive_timeout(
+        command_id,
+        AsBytes::as_bytes(payload),
+        0,
+        Delta::from_secs(10),
+    )?;
+    check_status(dev, command_id, response.status)
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index aabe114b55c2..82c29dfb467a 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -30,3 +30,6 @@
 
 pub(super) const GMCAPI_CMD_QUERY_VGPU_PROPERTIES: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
+
+pub(super) const GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK;
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 83048473d35f..bf8d44819e13 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -61,7 +61,6 @@ pub(crate) struct ChannelMapEntry(u64) {
 impl ChannelMapEntry {
     const KEY: KeyId = 0x1001;
 
-    #[expect(dead_code)]
     pub(crate) fn new(engine_type: u16, index: u16, chid_offset: u32) -> Self {
         Self::zeroed()
             .with_engine_type(engine_type)
@@ -159,7 +158,6 @@ pub(crate) struct BootloadInfo<'a> {
 }
 
 /// Encodes a `VGPU_BOOTLOAD` request using the typed NVKV schema.
-#[expect(dead_code)]
 pub(crate) fn encode_vgpu_bootload(info: BootloadInfo<'_>) -> Result<EncodedStream> {
     let request = VgpuBootloadRequest {
         dbdf: info.dbdf.into(),
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index b945e216a1d6..0b4d03c5f0fc 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -39,7 +39,6 @@
     size_of::<RawControlRegion>() == u32_as_usize(fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)
 );
 /// Physical VRAM regions containing the vGPU plugin logs.
-#[expect(dead_code)]
 pub(super) struct PluginLogRegions {
     pub(super) init: VramRegion,
     pub(super) vgpu: VramRegion,
@@ -86,7 +85,6 @@ pub(super) struct CommBufferRegion<'map, 'gpu> {
     kernel_log: VramRegion,
 }
 
-#[expect(dead_code)]
 impl<'map, 'gpu> CommBufferRegion<'map, 'gpu> {
     /// Map the communication portion of a plugin management heap.
     pub(super) fn new(
@@ -188,6 +186,19 @@ pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         }
     }
 
+    /// Clear a previous boot marker before starting the plugin.
+    pub(super) fn clear_plugin_ready(&self) -> Result {
+        let offset = self.io_offset(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            size_of::<u32>(),
+        )?;
+        self.map.try_write32(0, offset)?;
+        // Complete the posted clear before firmware can publish its new marker.
+        self.map.try_read32(offset)?;
+        Ok(())
+    }
+
     /// Return whether firmware has published the plugin boot marker.
     pub(super) fn is_plugin_ready(&self) -> Result<bool> {
         let value = self.read_u32(
@@ -199,6 +210,7 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
     }
 
     /// Invalidate the PTEs and release the communication mapping.
+    #[expect(dead_code)]
     pub(super) fn unmap(&mut self) -> Result {
         self.map.unmap()
     }
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index a90aaef28b35..b2a0b25c0e15 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -7,18 +7,38 @@
 };
 
 use kernel::{
+    device,
     prelude::*,
     ptr::Alignment,
-    sizes::SizeConstants, //
+    sizes::SizeConstants,
+    time::{
+        delay::fsleep,
+        Delta,
+        Instant,
+        Monotonic, //
+    }, //
 };
 
 use crate::{
     gpu::ChannelIdReservation,
-    mm::GpuMm, //
+    gsp::{
+        cmdq::Cmdq,
+        commands::FifoEngineList, //
+    },
+    mm::GpuMm,
 };
 
 use super::{
-    commands::Dbdf,
+    commands::{
+        send_bootload,
+        Dbdf, //
+    },
+    fw::commands::{
+        encode_vgpu_bootload,
+        BootloadInfo,
+        ChannelMapEntry, //
+    },
+    gsp_plugin_comm::CommBufferRegion,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -27,6 +47,52 @@
     VgpuManager, //
 };
 
+/// Ready limit used by `vmiopd_negotiate_cpu_gsp_version()` for the same marker.
+const PLUGIN_READY_TIMEOUT: Delta = Delta::from_secs(10);
+
+/// Per-engine channel budget reserved by the full SR-IOV plugin.
+///
+/// The supported GB20x path keeps firmware's non-heavy default, which uses
+/// `PLUGIN_ALLOCATED_CHANNELS_PER_ENGINE` rather than the heavy-mode budget.
+const PLUGIN_CHANNELS_PER_ENGINE: u32 = 3;
+
+/// Build the typed channel mapping from the GSP FIFO engine list.
+fn channel_mapping(
+    fifo_engine_list: &FifoEngineList,
+    chid_offset: u32,
+) -> Result<KVVec<ChannelMapEntry>> {
+    let mut mapping = KVVec::new();
+    for &gmc_id in fifo_engine_list.gmc_ids() {
+        // CAST: The mask leaves only the low 16 bits of the GMC engine ID.
+        let engine_type = (gmc_id & u32::from(u16::MAX)) as u16;
+        // CAST: Shifting a `u32` by 16 leaves at most 16 bits.
+        let index = (gmc_id >> u16::BITS) as u16;
+        mapping.push(
+            ChannelMapEntry::new(engine_type, index, chid_offset),
+            GFP_KERNEL,
+        )?;
+    }
+    Ok(mapping)
+}
+
+fn wait_plugin_ready(
+    dev: &device::Device<device::Bound>,
+    comm: &CommBufferRegion<'_, '_>,
+) -> Result {
+    let start = Instant::<Monotonic>::now();
+
+    loop {
+        if comm.is_plugin_ready()? {
+            dev_dbg!(dev, "vGPU plugin ready after {:?}\n", start.elapsed());
+            return Ok(());
+        }
+        if start.elapsed() >= PLUGIN_READY_TIMEOUT {
+            return Err(ETIMEDOUT);
+        }
+        fsleep(Delta::from_millis(1));
+    }
+}
+
 /// Guest Function ID validated against one device's total number of VFs.
 ///
 /// GFID 0 is reserved for the PF; VFs start at 1. Keeping the nonzero `u16`
@@ -49,7 +115,6 @@ pub(super) fn new(gfid: u32, total_vfs: NonZero<u16>) -> Result<Self> {
         }
     }
 
-    #[expect(dead_code)]
     pub(super) const fn get(self) -> u16 {
         self.0.get()
     }
@@ -68,14 +133,72 @@ pub(super) struct VgpuType {
 }
 
 /// A vGPU instance and the resources reserved for it.
-#[expect(dead_code)]
 struct VgpuInstance<'gpu> {
     gfid: Gfid,
     dbdf: Dbdf,
     vgpu_type: VgpuType,
     vm_pid: u32,
-    chids: ChannelIdReservation<'gpu>,
+    num_plugin_channels: u32,
+    comm: CommBufferRegion<'gpu, 'gpu>,
+    // Unmap the communication region before returning its slot and channel IDs.
     vram_slot: VgpuVramSlot,
+    chids: ChannelIdReservation<'gpu>,
+}
+
+impl<'gpu> VgpuInstance<'gpu> {
+    #[expect(dead_code)]
+    fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
+        let dev = vgpu.dev;
+        self.bootload(dev, vgpu.cmdq, &vgpu.fifo_engine_list)?;
+
+        Ok(())
+    }
+
+    /// Bootload the GSP vGPU plugin and wait for its BAR1 ready indication.
+    fn bootload(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        fifo_engine_list: &FifoEngineList,
+    ) -> Result {
+        let fb = &self.vram_slot.fbmem;
+        let mgmt = &self.vram_slot.mgmt_heap;
+        let logs = self.comm.plugin_logs();
+
+        let payload = encode_vgpu_bootload(BootloadInfo {
+            dbdf: self.dbdf,
+            gfid: u32::from(self.gfid.get()),
+            vgpu_type: self.vgpu_type.vgpu_type_id,
+            vm_pid: self.vm_pid,
+            num_channels: u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            num_plugin_channels: self.num_plugin_channels,
+            channel_mapping: channel_mapping(
+                fifo_engine_list,
+                u32::try_from(self.chids.start).map_err(|_| EOVERFLOW)?,
+            )?,
+            guest_fb: fb,
+            plugin_heap: mgmt,
+            ctrl_buffer_offset: 0,
+            init_log: &logs.init,
+            vgpu_log: &logs.vgpu,
+            kernel_log: &logs.kernel,
+        })?;
+
+        dev_dbg!(
+            dev,
+            "bootload: gfid={} sending {} typed NVKV bytes\n",
+            self.gfid.get(),
+            payload.len() * size_of::<u64>(),
+        );
+
+        self.comm.clear_plugin_ready()?;
+        send_bootload(dev, cmdq, &payload)?;
+
+        wait_plugin_ready(dev, &self.comm)?;
+
+        dev_dbg!(dev, "bootload: gfid={} plugin ready\n", self.gfid.get());
+        Ok(())
+    }
 }
 
 /// Identity and firmware profile used to allocate an instance.
@@ -133,12 +256,7 @@ fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<
     }
 
     /// Allocate resources and register a new inactive vGPU instance.
-    fn allocate_instance(
-        &mut self,
-        mm: &GpuMm<'_>,
-        vgpu: &VgpuManager<'gpu>,
-        info: InstanceInfo,
-    ) -> Result<Gfid> {
+    fn allocate_instance(&mut self, vgpu: &VgpuManager<'gpu>, info: InstanceInfo) -> Result<Gfid> {
         let InstanceInfo {
             gfid,
             dbdf,
@@ -165,8 +283,7 @@ fn allocate_instance(
             return Err(ENOSPC);
         }
 
-        // Reserve registry capacity before acquiring resources so publishing
-        // the completed instance cannot fail due to memory pressure.
+        // Reserve capacity before acquiring resources so registration cannot allocate.
         self.instances.reserve(1, GFP_KERNEL)?;
 
         let channels_per_instance = vgpu
@@ -187,15 +304,18 @@ fn allocate_instance(
             heap_size: vgpu_type.gsp_heap_size,
             fb_align: vgpu.vmmu_segment_size,
         };
-        let vram_slot = self.alloc_vram_slot(mm, vram_layout)?;
+        let vram_slot = self.alloc_vram_slot(&vgpu.mm.lock(), vram_layout)?;
+        let comm = CommBufferRegion::new(vgpu.bar_user, vgpu.mm, &vram_slot.mgmt_heap)?;
 
         let instance = VgpuInstance {
             gfid,
             dbdf,
             vgpu_type,
             vm_pid,
-            chids,
+            num_plugin_channels: PLUGIN_CHANNELS_PER_ENGINE,
+            comm,
             vram_slot,
+            chids,
         };
         self.instances
             .push_within_capacity(instance)
diff --git a/drivers/gpu/nova-core/vgpu/vram.rs b/drivers/gpu/nova-core/vgpu/vram.rs
index faaeea106009..bd7d1b4bf039 100644
--- a/drivers/gpu/nova-core/vgpu/vram.rs
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -102,7 +102,6 @@ fn drop(&mut self) {
 /// All device accesses and mappings of its regions must end before dropping the slot.
 /// Clearing the entry locks a sleeping mutex, so dropping the slot may sleep.
 #[must_use]
-#[expect(dead_code)]
 pub(super) struct VgpuVramSlot {
     pub(super) fbmem: VramRegion,
     pub(super) mgmt_heap: VramRegion,
