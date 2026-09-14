Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF013E6DF5
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372241; cv=fail; b=k+j+KlzF4sY8w57uZI86A+Cu/6e80D5oLEsCjniOX0NTlMDgGuL3OlS0NL+KVLIy08eHcG09fUPYqKLRNwMjxBZjIVZzsSYkDRZkBwmonOBymyJEoO8LBZewx8SXIVNa2tYcYsj5kjIlOehyJo5WDTnOJvMJTv+4bAB5FtSrVpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372241; c=relaxed/simple;
	bh=oxPLRXvRXJ3MdVkkgAPNBDY0hVMgDjtWUSwCglZxoyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/WTcdTuhB1FXzm28inD+0Mu2s+KsL8UBIxkNKQCcFPWea4gv2JSJp13bemh8/LACw2hl074bw8CbjrZUVIAgmCWMeHSQSQcqQkG34c9EhSS4ZS1PzV4+SxcMYkkeRD5ayqR3pF6KfJO0q+xnrLbycWD6/5PE9rKFb2WpePPEdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JieFknNl; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JieFknNl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms4keGkjq3zqSKPP9O5At6LIwKgElwPKmjnaV+wgRH3oNbzlMlO5vdrj5t5IMsVDDFBr4nTD/oCBImASoyszounP7H+1cP+N98CnU3EtJYnRTIbcRwksyJY2PGxHh5pP8rLyoch6quwS3E7SXu2QcNLPLnps6752EyzeKX6JD/ZJAWMyujvPwEAkN8mcuwkF+NCt4c3DV54xAEYDKar0J5rP83r+yVr4rWaVkmdvTXSmQup4qVfJfs3hW84l9/eZmp/kLxbcd9Bevxwf4Ot0eTYBhmpIhTMsApmIdBVhA7uXNFrvuBSf7tRnxd8gf+1aAOp1hpQ9yzSsUm6u3BaflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCr8SEjrGel8Y7+Q1TytAvR9130OejryzA3Ey+rmcjY=;
 b=gT4J6AIO3sJiEmxvZAgndCal0E2s7GiS7R4uw/f+6Rxd3PZWsUf0cjgLEWzeV0Da2kW7BfrAS4uElskvnrh32D6xwNbntJiRj4e8Hwj2ZETn+rPF72vKsQkKswCLhLJcAJwRege+mBTRdbQd0d6sqrTniBojkrWv25Q4PPv1bDJ5HCzQGm5q1W3Zwa1WX/VDUXRFMn4ItlqwxOB3f7xVbJ8Y75BulVogN5ql7VeG3UIXZ+MvQOCkNQIAkrBlRDPgozi9pDRzH+gugPXITiRsviu/tqLGMEVbloph4tBsJw1vvJzZpOh8CX8B/v5nIoNa/wfSFM/WjegKtio7k5EfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCr8SEjrGel8Y7+Q1TytAvR9130OejryzA3Ey+rmcjY=;
 b=JieFknNlLtKhs6iujf8BHO0RHLLJEtmt/+khGyc25+saz7dLl/KZQ3VHe2YWh5zN1YT4+8HAqSLmhB/RZCsRP+/icVr0ScB/QUxI+teiBlgG0IpGOc+jBn59xE2yNlGRK3kRcYfGYd+f+6dIbpAm7aQMr0IoLe28mF8n+YyDJ3IlTcyP4WJ8aOj7Q/aiJI4THPyU3I2En8HIids/1IO7CAcNz7xE7QeixpYY2jDc2m/d4gZ2FNLMGquKbvk7t/zvtYTQh/P8EuLxqH++UtCPH9Tv2Qa418Meu2JZKXx8e3d8PoMTsEoEYZTjC4DJvmjrOE5Q8j0yOEAPFyroVczFvg==
Received: from BN1PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:e1::16)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:50:34 +0000
Received: from BN2PEPF0000A890.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::22) by BN1PR12CA0011.outlook.office365.com
 (2603:10b6:408:e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A890.mail.protection.outlook.com (10.167.248.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:33 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:50:18 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:18 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:10 -0700
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
Subject: [PATCH v2 07/32] gpu: nova-core: vgpu: initialize runtime parameters after GSP boot
Date: Mon, 14 Sep 2026 10:48:42 +0300
Message-ID: <20260914074907.1399629-8-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A890:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: ae390fee-8055-4f81-8ac9-08df1234db80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|36860700016|82310400026|7136999003|11063799006|56012099006|6133799003|22082099003|18002099003|11062099010|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	baaeg8Befe1Rs8oHAqoszypLAMNALK3VUOC6rwQR32V2rxafRjlKsvIsjY3eO96LT42sCKvBEHkwLE7uTODh48c5G05rdduH9qgsMzbmoA2E6btcUVs8uzr7SWxAFQW4Bfg7U/OENkJ6LPBN3PP+zegjPJ13YX++Qpi/SQ7jHti74VY1iTmK2JN1naqL8IMGfNNzChUfQbk2EcA71FEr3rN1g/H/jSN+xFj7eLPSE3DpcMneH5E2yzFTQAFTtXYhu4/1nwwmkZeFAcekIBH1BBe16jTRKHdS+gZrnSsQdGCBHABCjqq8whNQTOBuPpmioADgmv1Rh28Pin+R3967O5rxQ7cIglfKWzPLyv8FrfYCPoDMoXJ2mukC/pejQ0Gnn69e59c8ZOyYU4arzEY+qfvd5TXkyddOeZ+eKZqIy1hl+EEEpZ6HMbyQrBeye3GlDnYw/oCHp6w5+7M4kYsFgcY9/skflDbWuvhYzCpT6+B02K2YHGhfJ/ol3HUpsLNbWUmpj7JnY2pdLsUpuJYKUhni/COMIwoF8U6fhtPVOIPSUmRo+5CZNEFaOSpZR/caeP7BgaLo/t9lYcCYeJxmFPuhO6VS8coMN5OtVWSXRL5rPGW24Cs1PeAHEAXvz58yiy72OxraSeU4ISSVCd4YlwYCH+YvznawBs3CfT0cW4KN6b6wVVfvpJFBxamY1Bm3wla8cAEoWUs366VGRVKX1w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(7136999003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(11062099010)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cd7VdvDvHtZ5V9r8m74isFA9C0ZZoP696kv5coSYWqWakuSWCPMuZOnL54ADtECPnGwf1Uq7yEPxoK1C/RpetJiF4usJG5H/a0oUoprrFuco7L00xS1fx/CqSfmWPBtHOC9QQFE7aZAPcWLLsjw1R7m6BVr8UzMRoiXv8mfyfUMMNaiofW+aaEUabgDq2UwEMb6lygT8CI7LI+wINOLwnBcGURFFrMqlyHNS0OcUPgUROWVf5iPvQwVh0jo3ADT+r7lXZVWBZ1BpIMv0RX80kh234Ca9yEVgHsZbfKr/n3xk3Sj7mXX7xWykR0O/VlF1ns7xA+HyOUxJTBFrqQXhyBLNLOCho3Ky9Eb6quXAWQAfLddTnR5jJY4ki3eguN0JLJj7NYfbyk3hscrhH3b6btnfBt4h/du+b8h5yAmizoRSNJB+ztpJN9ypOIugKIgE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:33.8351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae390fee-8055-4f81-8ac9-08df1234db80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A890.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

GSP_INIT reports the VMMU segment size and FIFO engine topology needed
to divide resources among vGPU instances.

These resources are only meaningful after a successful vGPU-enabled
boot. A disabled GPU should not construct a manager, and a constructed
manager should always have its complete runtime parameters.

Have Gpu construct an optional VgpuManager from BootResult::static_info
after GSP boot. Copy the ordered engine list and VMMU segment size, use
the pool's 2048-channel capacity, and store them directly in the manager.
Expose read-only accessors tied to the manager, preserving a reported
VMMU size of zero.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 23 ++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs |  2 --
 drivers/gpu/nova-core/vgpu.rs         | 48 ++++++++++++++++++++++++++-
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 733a2c09ec01..227531b28541 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -49,7 +49,10 @@
         VramAddress, //
     },
     num,
-    vgpu::VgpuState, //
+    vgpu::{
+        VgpuManager,
+        VgpuState, //
+    },
 };
 
 #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
@@ -311,6 +314,7 @@ struct GspResources<'gpu> {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    vgpu: Option<VgpuManager<'gpu>>,
     /// GSP event interrupt registration.
     ///
     /// Declared before `gsp_resources` so it is dropped first: `free_irq` runs, waiting out any
@@ -436,6 +440,23 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
+            vgpu: {
+                let info = &gsp_resources.boot_result.static_info;
+                match gsp_resources.vgpu_state {
+                    VgpuState::Disabled => None,
+                    VgpuState::Enabled { .. } => Some(VgpuManager::new(
+                        // SAFETY: `chid_pool` is initialized above at its final pinned address.
+                        // The private manager and its pool borrow cannot escape this `Gpu`.
+                        // Completed field drop order drops the manager before the pool; on failure,
+                        // pin-init drops it before the earlier-initialized pool.
+                        unsafe { &*core::ptr::from_ref(chid_pool.as_ref().get_ref()) },
+                        &info.fifo_engine_list,
+                        info.vmmu_segment_size,
+                        TOTAL_CHANNELS,
+                    )),
+                }
+            },
+
             // GSP boot left the SWGEN0 latch set and pending bits in the tree.
             _: {
                 irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vectors_ref)?;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 3820320dcb34..c2faa825a849 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -77,9 +77,7 @@ pub(crate) struct GetGspStaticInfoReply {
     /// Exclusive end of the FB physical address space.
     pub(crate) total_fb_end: u64,
     /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
-    #[expect(dead_code)]
     pub(crate) vmmu_segment_size: u64,
-    #[expect(dead_code)]
     pub(crate) fifo_engine_list: FifoEngineList,
 }
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index b405ba49c490..348af9ea3fc2 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -13,7 +13,11 @@
         Fsp,
         VgpuMode, //
     },
-    gpu::Chipset, //
+    gpu::{
+        ChannelIdPool,
+        Chipset, //
+    },
+    gsp::commands::FifoEngineList, //
 };
 
 mod hal;
@@ -80,3 +84,45 @@ fn query_state(
         }
     }
 }
+
+/// Runtime resources for an enabled vGPU boot.
+pub(crate) struct VgpuManager<'gpu> {
+    #[expect(dead_code)]
+    chid_pool: &'gpu ChannelIdPool,
+    vmmu_segment_size: u64,
+    total_channels: u32,
+    fifo_engine_list: FifoEngineList,
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Retains runtime parameters from a completed vGPU-enabled GSP boot.
+    pub(crate) fn new(
+        chid_pool: &'gpu ChannelIdPool,
+        fifo_engine_list: &FifoEngineList,
+        vmmu_segment_size: u64,
+        total_channels: u32,
+    ) -> Self {
+        Self {
+            chid_pool,
+            vmmu_segment_size,
+            total_channels,
+            fifo_engine_list: *fifo_engine_list,
+        }
+    }
+
+    /// Returns the VMMU segment size in bytes, or zero if GSP-RM omitted it.
+    #[expect(dead_code)]
+    const fn vmmu_segment_size(&self) -> u64 {
+        self.vmmu_segment_size
+    }
+
+    #[expect(dead_code)]
+    const fn total_channels(&self) -> u32 {
+        self.total_channels
+    }
+
+    #[expect(dead_code)]
+    fn fifo_engine_list(&self) -> &FifoEngineList {
+        &self.fifo_engine_list
+    }
+}
