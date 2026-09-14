Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E73EEADF
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372401; cv=fail; b=f+jOIqwqOYnZxSut1snIw76RTZLGqIuSceI/I4YMUxaXuuq+IDgOQbJKhlIeerUGuBP9taSqzGkpz2LA6DYquV5CYqlwh1SZza5AHrGMOl+2jIJZDEAFZjXALfEkl6XORlS1EZiWUkyjXk9F0hkdyDwpVnF7d/uoOGu6VtnM6qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372401; c=relaxed/simple;
	bh=70bnHkJFpUCCXu+j9B1n+5atmRiolOLq4l7B4iX6KPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohgFKVUw9DO7BEk0VPSMIWrnimLwJ0Q/VJjTNztRdsxBmosJX/Zg6cTzRA3WinQn257Mb4BbbeBDJYxZIXaTGzT15taPwO3goZPtGfb8PcqTGJAwaHhFyAPVbl+Ytq78/KR88AZsunJRO+c4DKovLOm2m9X7BtUnjZlZ3p0UgRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iNBs+N5Z; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iNBs+N5Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBjlNhcH/RQLE0yAUP5QD7sbFLVb1VKrzQBSH+IYOlx1TJEo1yNfiuSR2arZLTYN193jrxiV2m9Pb3vBUm0uxz58KWD5CP0I2ibVNM7M/oxM6xz/Q8bJmjazlsTBPsPNmLZMaJx4OPEW3i89X98XK4U5n2gatuLLIYRu9OsT3yVN6kqOsdpdNz6ewDUVRfnPZ1cysqpGqFsb4rSWZSUCrEhJyFc6sugiounDoxdVmhRFvO1jcmnR+97zN7Ifsnkv+QjzUuRT+nnfexGBsUIlIMA0g9S1QxXCm94hoesJ92mDCjKM9Q82Ppe4ZZFIZnOjQ/wL1PKggtJJUVPaeAzWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AkKcKzPp75EWIb+lktDkDn8tHIBhE0/qiGIeR3H0Ps=;
 b=cUu9qLW/Fzh1bRLPHlkUB++u38x/aP/aFRbvC4KsIYQo3qP7jXHLIhvmDAskcLCneFFiXpBcLQ+RiUaAS+HCct/CoxhxzvWwe818vc9prtqlRToOGrP30RTah86S0TBcqHvORG9Zn5ApNdaGAY9pJ9D+sSULjBQEC9Nob+GEHrq8EkBJ+7nZCaEii2JrKkyHWUT/fWrElZ8JyGstgqA1YAy2IA9UT1XNniGXiczsaYCinXuIe+98WaOmDPtsSW+P5ASv5FV8f8At5vrKJQYroL74EHUHoaPkrjGcHcBt/YxYiK37mXU7sZnA0g0XyOvFmgc0SFIGR42BCvwF+2LgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AkKcKzPp75EWIb+lktDkDn8tHIBhE0/qiGIeR3H0Ps=;
 b=iNBs+N5ZrL1vAxJ0HNS9Y7q8RAJ+Gm39no7swHJDqsi1SAY6XUwLkKI8Tw/Sh6mCZvYx0OEI9TglWCNP1/8ys9HvpMz96dTZ/Ds/7HjHEshDgikg9TnZhOnZpDnUX4Nyu2bKOIjizxqDsm+HRUw1nW2jBPOOl+0wwnw7cTWPVr/6ERHQPPdEnEJ+Zvw1NlZZyxYIQEQ31rPli4da2eVyzVTuLCe9ET9b+h6PM3zDfcRj9Fub2AM7VRYzhXZOBjky23OMynZ6DHYbiRHZQwmdh7R5MEJI5eeKKereZZYEWcBbenir13Ug2k+TcI+xR/lCRYUlbLKxMWXKSgg6rbZhQQ==
Received: from BN1PR12CA0001.namprd12.prod.outlook.com (2603:10b6:408:e1::6)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:53:09 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::8a) by BN1PR12CA0001.outlook.office365.com
 (2603:10b6:408:e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:52:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:47 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:39 -0700
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
Subject: [PATCH v2 25/32] gpu: nova-core: vgpu: initialize GSP plugin RPC buffers
Date: Mon, 14 Sep 2026 10:49:00 +0300
Message-ID: <20260914074907.1399629-26-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 2497d26c-0812-4fc8-0bd6-08df123537ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|56012099006|6133799003|11063799006|3023799007|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rYzsd8eYXaEpD1F30/Q8f+prx8BNNO5l7l9Jc42jrqEeRqjWXlmEAeSmjYQiQDr0veEAVMV8oRgX3RW+2qP8+fyM4mCtF8wJl58nODNnpWFZaBS5MSkU3obLaCapegdjHkBhr2TSGfjfGJ3RbBOLLJQgAID1/EXbOAFxJqFe8t2RCj5PieAKl98YNe5p9ppiItFo4HKHYqCjQCYUIMBt1jn5KKXeneBg2HIHQzJcDC3bQScHHuGaVkSFmyHg81FD+2A9B+kdcKFk+VFLBMGxqbPYnYPY+ZcUgx+ktgfxryKrDcNhWhJrpuu5xYkkFSJ4pVDL54RXyGQ2t+p9HGqTlsvXHvWRPRSN2V/AiT9fC1rbiodKgoMXwMi0qgEQ4EzLuuSyF/QXcACh5LSm2EwS9xQBvgLY+jCHk5CIX2T8kaJJuOBmUGxLAbm7FBbF51bT9GKs2GhJTtort6LKjYOmGN3cuQrcvCeoaOBxMrjPq0ZNLTfeIlN5xBze38qkdw6l+BXh6zz7sd5YTqO5redeo/3g4uDR3WXrrzTqeHOKLKbIFTdMcltYgqUFXgb9+tkgWCrsQAgp8PZgIo0ip85nTPmexj75+cbFNfE3qShiqgg+bd6ZPgQgpY7CFaPNabbPJKl9nDtj4adcqzrGcuGo35GJB8iwLHIqkXk5aV4v+ViRKOsJnDY6zds9J5S58rrbvbgu4xwNV0SCWj0xhcgXLQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(6133799003)(11063799006)(3023799007)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HQc7AV1PS/M8fuhtuk1EtgZKpH52EXvkYTA4IfD5uHGpmlosja55OMUrZ5NiJAXI/fq5b5bBf22BFyuAQ0NJldwHbBFZta8HJgnVxqu5x1h5UG7JkTJPWE6GSbUUvbTNYTsaeIR2DtREWEUwbZiomCb4FvIyhUnbw9mDoyY3tBZDrBAXwPf7xyaNAV6+U4Ex8zm72wxY3B65auTnWQ8k+YWXyd6/qj5cMulFwY7RiL6VOeMkmyaYMRhr96KNDArh1hJPoQ9VGkZ2bExpEToPjQprgvylBvWF/vekWtdhMOULJkm3I8Y8lFk5FMU3bAWng963Yl52Eiw42NQRCeWTro8V5EpljpLicds+CJRZTOqWNS9aPVWcqcFdwQbdCvajYnSC2SqOIT7qYRaAKO3RCmlO7Nzut7KZ2hkkHPrLhV+a4sTpTj8u8ThYx7UVUgeq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:08.6673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2497d26c-0812-4fc8-0bd6-08df123537ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316

After the GSP plugin has been successfully booted, the vGPU manager
uses the GSP plugin RPC interface to communicate with it through a shared
RPC buffer.

The shared buffer needs region offsets, a protocol version and initial
control and response state before the first request. The control
sequence field also carries the boot-ready marker, so initialization
must follow the plugin's ready indication.

Add BAR1 accessors to initialize the shared control and response buffers.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm/bar_user.rs          |  10 ++
 drivers/gpu/nova-core/vgpu/fw.rs              |   2 +
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 142 +++++++++++++++++-
 3 files changed, 147 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index ef357fd516b7..b7b4bf14b56d 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -141,6 +141,11 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
         self.bar_user.bar1.try_read32(off)
     }
 
+    fn try_write8(&self, value: u8, offset: usize) -> Result {
+        let off = self.bar_offset(offset)?;
+        self.bar_user.bar1.try_write8(value, off)
+    }
+
     /// Write a 32-bit value at the given offset.
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
@@ -261,6 +266,11 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
             .try_read32(self.access_offset(offset, size_of::<u32>())?)
     }
 
+    pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
+        self.access
+            .try_write8(value, self.access_offset(offset, size_of::<u8>())?)
+    }
+
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         self.access
             .try_write32(value, self.access_offset(offset, size_of::<u32>())?)
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 1528cc56ce74..03225b9833c3 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -15,12 +15,14 @@
     VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
     VGPU_CPU_GSP_CTRL_BUFF_REGION as RawControlRegion,
     VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_CTRL_BUFF_VERSION,
     VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_RESPONSE_BUFF_REGION as RawResponseRegion,
     VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
 };
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index af7a396021bc..5d129a1b908f 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -16,7 +16,8 @@
 
 use super::fw::{
     self,
-    RawControlRegion, //
+    RawControlRegion,
+    RawResponseRegion, //
 };
 
 /// Physical VRAM regions containing the vGPU plugin logs.
@@ -75,9 +76,14 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
 pub(super) struct CommBufferRegion<'map, 'gpu> {
     map: BarMapping<'map, 'gpu>,
     control: VramRegion,
+    response: VramRegion,
+    message: VramRegion,
+    migration: VramRegion,
+    error: VramRegion,
     init_log: VramRegion,
     vgpu_log: VramRegion,
     kernel_log: VramRegion,
+    guest_trace: VramRegion,
 }
 
 impl<'map, 'gpu> CommBufferRegion<'map, 'gpu> {
@@ -92,22 +98,22 @@ pub(super) fn new(
         let mut cursor = 0;
 
         let control = take_region(&region, &mut cursor, fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)?;
-        take_region(
+        let response = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let message = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let migration = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let error = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
@@ -127,13 +133,16 @@ pub(super) fn new(
             &mut cursor,
             fw::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let guest_trace = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
         )?;
 
-        if cursor != total_size || control.size() != u64::try_from(size_of::<RawControlRegion>())? {
+        if cursor != total_size
+            || control.size() != u64::try_from(size_of::<RawControlRegion>())?
+            || response.size() != u64::try_from(size_of::<RawResponseRegion>())?
+        {
             return Err(EINVAL);
         }
 
@@ -142,9 +151,14 @@ pub(super) fn new(
         Ok(Self {
             map,
             control,
+            response,
+            message,
+            migration,
+            error,
             init_log,
             vgpu_log,
             kernel_log,
+            guest_trace,
         })
     }
 
@@ -176,6 +190,21 @@ fn read_u32(&self, region: &VramRegion, field: usize) -> Result<u32> {
             .try_read32(self.io_offset(region, field, size_of::<u32>())?)
     }
 
+    fn write_u8(&self, region: &VramRegion, field: usize, value: u8) -> Result {
+        self.map
+            .try_write8(value, self.io_offset(region, field, size_of::<u8>())?)
+    }
+
+    fn write_u32(&self, region: &VramRegion, field: usize, value: u32) -> Result {
+        self.map
+            .try_write32(value, self.io_offset(region, field, size_of::<u32>())?)
+    }
+
+    fn write_u64(&self, region: &VramRegion, field: usize, value: u64) -> Result {
+        self.map
+            .try_write64(value, self.io_offset(region, field, size_of::<u64>())?)
+    }
+
     /// Return the physical regions occupied by the three plugin logs.
     pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         PluginLogRegions {
@@ -208,6 +237,105 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
         Ok(value == fw::GSP_PLUGIN_BOOTLOADED)
     }
 
+    /// Initialize the shared control and response buffers for plugin RPC.
+    #[expect(dead_code)]
+    pub(super) fn initialize(&self) -> Result {
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.response_buff_offset),
+            u64::try_from(self.region_offset(&self.response)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_buff_offset),
+            u64::try_from(self.region_offset(&self.message)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.migration_buff_offset),
+            u64::try_from(self.region_offset(&self.migration)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_offset),
+            u64::try_from(self.region_offset(&self.error)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_offset
+            ),
+            u64::try_from(self.region_offset(&self.guest_trace)?)?,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.migration_buf_cpu_access_offset
+            ),
+            0,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_migration_in_progress),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_cpu_get_idx),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_cpu_get_idx
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.attached_vgpu_count),
+            1,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_gr_init_done),
+            0,
+        )?;
+
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
+            0,
+        )?;
+        // Replace the boot-ready marker with the initial RPC sequence.
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(
+                RawResponseRegion,
+                __bindgen_anon_1.message_seq_num_processed
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(RawResponseRegion, __bindgen_anon_1.result_code),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.version),
+            fw::VGPU_CPU_GSP_CTRL_BUFF_VERSION,
+        )
+    }
+
     /// Invalidate the PTEs and release the communication mapping.
     pub(super) fn destroy(self, mm: &mut GpuMm<'_>) -> Result {
         self.map.destroy(mm)
