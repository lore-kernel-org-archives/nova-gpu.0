Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2533EF0AA
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372361; cv=fail; b=nmpZhkQMYsdpNah8iNPUkek0JjBtFauJgXv0L+th2NDMn/YdSRl5dob9xlJdGbuPJky7oIAG/Z7Z2ErKgAg2j2Jee8aFGSUQAnofKr4O2XxU9pYjz7qhYYzv9Fc1pNOnwRAhmRXcmoDD09FWsto5FozKNgqN85mabypSqnbdU94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372361; c=relaxed/simple;
	bh=tobCmZ/E/Kq2oZT+GUJ4jVoLUxUkj3RJqfPLbQmLY6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgjdFfTOAsAY6jm7DAtW2iV1x4iCvcKIS/nUTPnf09GRpvg89xM1qk9YfhFKCx16QDLwvpCLC5W1eMups3lVQNN0J10WtFc/+DlcqgSIkec2Wzzw69/aYzoP6bbF+Q1xeXrB4b6+0JC1eQoVNf8uT6vc4B2BIdj25CpzbVoklQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mMSTUWMI; arc=fail smtp.client-ip=52.101.52.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mMSTUWMI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq8yzW6p1h0kvdTnwrs7FKv2HDAvkrIdDEsJ2NNVv2dYMD5Qr6/aQdnV+qMwfIUSbhu9hQLLOJ4eFYK6pAiE1nSmGOf5JpF0aj29Y5dkZ1n/i6SulJNSslJr6iWO+loRSk7cASUm2B7tBQBUSLtZEkLB9xEA/H7hv7ixvCBIyUJKdbDyxpeC14fI8Ex5xihLkGNSa/d7cV2mDc87v9z2c7gnJrwSF/xirr0W4elIHyS2YjrDILDLSaS4fEPZutm1WD4O1hQlb0RG/dZmfybw6mnigEK7fQxZeICWL+zD2nBrkiZw0fp4lzgasaIlLleU3t6BCJRoh+XSmrenUaBmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTGPI/RcNBIjKHR3x0tlmAtBI9dwM9VS7xj9EdBLJGk=;
 b=ZTh9wHZMmPhheYvqAFgJ6rrDxNAFjYG5eILfZg7XhyhEJ/V+rP/4+JqpKWjv0iDYxRr/Xc/I7A+HvMYkIwNhLijm83tktgidBYS/GpEp3Z5n0EEH1nltZr0GylISPyDNbrdDJIdoqwD2OFHfhTi+obndg8qzO55LaFQFzNfhIahjXeG8MSbeNaQBromsiB/h0HrXUfhKJ9sLfkfOnFP3Jh1b6ErwxLES8fd38c3PmRcqg+3En1zPhAqTKxegKvMDCdW6eq1oii1vxsmLXTufdaqO3X9osVpkHh6t1/ZtsRF6SON6+MrJRvZIZ2zFSp4Myn7238NZR0n/4LHilROi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTGPI/RcNBIjKHR3x0tlmAtBI9dwM9VS7xj9EdBLJGk=;
 b=mMSTUWMI0ZhpO3ZKoCWPCfI5O0UWNuywuJFg9DETCVtjnXyIm5VkIVyrgIWVb93hUSf1eYgZ74OoHpCaZVOf8Cy3THTX1DX8vZUKKBshXZFHKQHq6VDtRaDx2rp6IygUBb1RAgXOCkTzz8pBc0UgfnF9kq/dm2MM3Rql445kvC2WyOSzUZq+5W2qfoTBt5zfC+i+p23wWBGYvsiFJgbxZ+dSjhIWmzds+TENFaZ3PsGhW5jCMZ2w4lb6QOhcCYJtHaoxPwLgGm1xfjwOBBF30az75V3O3YjzjSUg47CWVl8VQA/SfwzKiOQQ3RyeEx3IDEh6KkazKV9RSiEv0hDcsQ==
Received: from BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::14)
 by SAWPR12MB999270.namprd12.prod.outlook.com (2603:10b6:806:562::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:52:33 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::26) by BL1P223CA0009.outlook.office365.com
 (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:15 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:14 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:06 -0700
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
Subject: [PATCH v2 21/32] gpu: nova-core: vgpu: add instance create/destroy
Date: Mon, 14 Sep 2026 10:48:56 +0300
Message-ID: <20260914074907.1399629-22-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|SAWPR12MB999270:EE_
X-MS-Office365-Filtering-Correlation-Id: daa9c234-67bc-4457-bdb5-08df123522c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|5023799004|11063799006|56012099006|10067099003|11062099010|22082099003|18002099003|6133799003|7136999003|3023799007;
X-Microsoft-Antispam-Message-Info:
	L8GrUdVKGAjn3oAT/JQN0+9wzV43VxRWt5tohUkIjzq/SnszWozx007iCtGB+NyN6oYIp8FpklstbFOVsZGcHfNo9N+1StfYo7ZCvq1jJlTxaZkjd+z+mb0llgPuEtn71Fzkt0NWCX8PWAaC8CxzQvkt4Felw4K72A5C3H9xs4qaKzfiCbpWzDk/ASf8v/XZysBqjBtvEPNo7t6IUTb4kTo/rErAfzY92/KuSlEywsqJ3hC7kvo/KpATDFdrjAKic4hleYJ36W0Hgo8DXrotskdMm/qE9ob63267ykMfBN8n9Zyv/7LCFMWj3oOEqOv0GB/cPBW5et8fINhPdPVRikn6PRYh52we44AdCCzUXQvCBC5H2xnu5o2TffWO5tpFwDB6WfFoqrGcTNQlvdxC78rEh566kx9UYV9cdnQzwhb1sPjf7gIL2ZdmleFE3nHj+TZLc2gUDckicP6zq4deBvqwISlsjRInUNA4qZRXRHgkjt6RWcDLToB1C/YC/salzPnHv7GbAJ9nrK9KiHqm+D1Jfv+TLGiALS2P+6H2wwmlO9zL3twQnLfsMYX6yPhM3qwBkCGj67jhuQiBEay/LJAqrIi8VVN72J3IwkJOyXNDPsDrOcCYmhuFo7j0opaiQkLVhBKkaPnfnHpiG3dwpkGpF4qp8hd/jXbnBTafPz2EnhZdDbzOwpxqBTllq59iEV5ZF/HqA14/VoyMNEwngA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(5023799004)(11063799006)(56012099006)(10067099003)(11062099010)(22082099003)(18002099003)(6133799003)(7136999003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bvKJpahGmHe1PJTBYdpObqSPKa9wspRriIyOoobuqjakYAqAzem5zahPhl53CVxeRYsV2Keflk4cRWIYXoIFGvpRxNSiQM7cWV3WOsq71bMRTrTXrPqbD+ktWz48VnxZ/BBZQShbHoSjqa6PcETEi5Xb00KRVMX63pVe36OPDMMFb1hpKggDFuSP+sqFhSVMPxKyvLM4rE9Fze/OCnx7Al8oB0AkVcnCLtBdVbS5dGvumBRuzCOXNIPSvHK04Gx0NscR2u4i448GblLZPzxI52CXrcunmVe2eWkZVxXdGNZGf1KnAWDvJ9WlYrPpwI4geaJ9wZbTDRTi/+tq5/0amkBS78EburzMMA28T4ba2LvIsYH6wb5WF6n1AkGvTbU71J7W2gjD8ND8Wsmgv9U21EiiiGJTdggrCWGQQVJbAmIElxhG9P27fnB3dAvlaiqU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:33.3872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa9c234-67bc-4457-bdb5-08df123522c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999270

A vGPU instance holds the resources used by a VF. The VF must have a
vGPU type assigned before instance creation. The instance lifetime is
intended to follow VFIO device use: create it on open and destroy it
on close.

Add an instance registry to VgpuManager with creation and destruction
operations. Creation reserves channel IDs and a VRAM slot according
to the assigned vGPU type; destruction releases those reservations.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs           |  12 +-
 drivers/gpu/nova-core/vgpu.rs          |  23 ++-
 drivers/gpu/nova-core/vgpu/commands.rs |   1 -
 drivers/gpu/nova-core/vgpu/instance.rs | 225 +++++++++++++++++++++++++
 4 files changed, 247 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/instance.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ebf29b06a8e1..61adf412bae7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -54,14 +54,16 @@
     },
 };
 
-#[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
 mod channel;
 mod hal;
 mod regs;
 
 use self::channel::TOTAL_CHANNELS;
 
-pub(crate) use self::channel::ChannelIdPool;
+pub(crate) use self::channel::{
+    ChannelIdPool,
+    ChannelIdReservation, //
+};
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
@@ -313,7 +315,7 @@ struct GspResources<'gpu> {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
-    vgpu: Option<VgpuManager<'gpu>>,
+    vgpu: Option<Pin<KBox<VgpuManager<'gpu>>>>,
     /// GSP event interrupt registration.
     ///
     /// Declared before `gsp_resources` so it is dropped first: `free_irq` runs, waiting out any
@@ -444,7 +446,7 @@ pub(crate) fn new<'a>(
                 let info = &gsp_resources.boot_result.static_info;
                 match gsp_resources.vgpu_state {
                     VgpuState::Disabled => None,
-                    VgpuState::Enabled { .. } => Some(VgpuManager::new(
+                    VgpuState::Enabled { .. } => Some(KBox::pin_init(VgpuManager::new(
                         // SAFETY: `chid_pool` is initialized above at its final pinned address.
                         // The private manager and its pool borrow cannot escape this `Gpu`.
                         // Completed field drop order drops the manager before the pool; on failure,
@@ -453,7 +455,7 @@ pub(crate) fn new<'a>(
                         &info.fifo_engine_list,
                         info.vmmu_segment_size,
                         TOTAL_CHANNELS,
-                    )),
+                    ), GFP_KERNEL)?),
                 }
             },
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 0f9f5be752b5..f3e40e6de6f0 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -4,8 +4,10 @@
 
 use kernel::{
     device,
+    new_mutex,
     pci,
-    prelude::*, //
+    prelude::*,
+    sync::Mutex, //
 };
 
 use crate::{
@@ -23,6 +25,7 @@
 mod commands;
 mod fw;
 mod hal;
+mod instance;
 mod vram;
 
 /// vGPU state detected during GPU construction.
@@ -88,9 +91,13 @@ fn query_state(
     }
 }
 
+use self::instance::VgpuInstances;
+
 /// Runtime resources for an enabled vGPU boot.
+#[pin_data]
 pub(crate) struct VgpuManager<'gpu> {
-    #[expect(dead_code)]
+    #[pin]
+    instances: Mutex<VgpuInstances<'gpu>>,
     chid_pool: &'gpu ChannelIdPool,
     vmmu_segment_size: u64,
     total_channels: u32,
@@ -104,22 +111,22 @@ pub(crate) fn new(
         fifo_engine_list: &FifoEngineList,
         vmmu_segment_size: u64,
         total_channels: u32,
-    ) -> Self {
-        Self {
+    ) -> impl PinInit<Self> + use<'gpu> {
+        let fifo_engine_list = *fifo_engine_list;
+        pin_init!(Self {
+            instances <- new_mutex!(VgpuInstances::new(), "nova-core::vgpu-instances"),
             chid_pool,
             vmmu_segment_size,
             total_channels,
-            fifo_engine_list: *fifo_engine_list,
-        }
+            fifo_engine_list,
+        })
     }
 
     /// Returns the VMMU segment size in bytes, or zero if GSP-RM omitted it.
-    #[expect(dead_code)]
     const fn vmmu_segment_size(&self) -> u64 {
         self.vmmu_segment_size
     }
 
-    #[expect(dead_code)]
     const fn total_channels(&self) -> u32 {
         self.total_channels
     }
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index b5fa3575b1d7..bdedd7fc21ad 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -43,7 +43,6 @@ pub(super) fn query_assigned_vf_type(cmdq: &Cmdq<'_>, dbdf: Dbdf) -> Result<u32>
 }
 
 /// Query and decode the firmware properties of one vGPU type.
-#[expect(dead_code)]
 pub(super) fn query_vgpu_properties(cmdq: &Cmdq<'_>, type_id: u32) -> Result<KBox<VgpuProperties>> {
     let response = cmdq.send_gmc_and_receive(
         GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
new file mode 100644
index 000000000000..99a8f47e72d1
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use core::num::NonZeroUsize;
+
+use kernel::{
+    prelude::*,
+    ptr::Alignment,
+    sizes::SizeConstants, //
+};
+
+use crate::gsp::cmdq::Cmdq;
+
+use crate::{
+    gpu::ChannelIdReservation,
+    mm::GpuMm, //
+};
+
+use super::{
+    vram::{
+        VgpuVramLayout,
+        VgpuVramSlot,
+        VgpuVramSlotAllocator, //
+    },
+    VgpuManager, //
+};
+
+use super::commands::{
+    query_vgpu_properties,
+    Dbdf,
+    VgpuProperties, //
+};
+
+/// Guest Function ID. GFID 0 is reserved for the PF; VFs start at 1.
+#[repr(transparent)]
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub(super) struct Gfid(pub(super) u32);
+
+/// Resource requirements and device identity for one vGPU type.
+#[expect(dead_code)]
+pub(super) struct VgpuType {
+    vgpu_type_id: u32,
+    bar1_length: u64,
+    max_instance: u32,
+    pci_dev_id: u32,
+    pci_subsys_id: u32,
+    fb_length: u64,
+    gsp_heap_size: u64,
+}
+
+impl VgpuType {
+    fn from_properties(properties: &VgpuProperties) -> Self {
+        Self {
+            vgpu_type_id: properties.type_id,
+            bar1_length: properties.bar1_length,
+            max_instance: properties.max_instance,
+            pci_dev_id: properties.dev_id,
+            pci_subsys_id: properties.subsystem_id,
+            fb_length: properties.fb_length,
+            gsp_heap_size: properties.gsp_heap_size,
+        }
+    }
+}
+
+/// A vGPU instance and the resources reserved for it.
+#[expect(dead_code)]
+pub(super) struct VgpuInstance<'gpu> {
+    pub(super) gfid: Gfid,
+    dbdf: Dbdf,
+    vgpu_type: VgpuType,
+    vm_pid: u32,
+    chids: ChannelIdReservation<'gpu>,
+    vram_slot: VgpuVramSlot,
+}
+
+/// Identity and firmware profile used to allocate an instance.
+pub(super) struct InstanceInfo {
+    gfid: Gfid,
+    dbdf: Dbdf,
+    vgpu_type: VgpuType,
+    vm_pid: u32,
+}
+
+#[expect(dead_code)]
+impl InstanceInfo {
+    pub(super) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32) -> Self {
+        Self {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+        }
+    }
+}
+
+/// Registry of live vGPU instances.
+pub(super) struct VgpuInstances<'gpu> {
+    instances: KVec<VgpuInstance<'gpu>>,
+    vram_slots: Option<VgpuVramSlotAllocator>,
+}
+
+#[expect(dead_code)]
+impl<'gpu> VgpuInstances<'gpu> {
+    pub(super) const fn new() -> Self {
+        Self {
+            instances: KVec::new(),
+            vram_slots: None,
+        }
+    }
+
+    fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<VgpuVramSlot> {
+        let replace_empty_pool = match self.vram_slots.as_ref() {
+            Some(allocator) if allocator.is_empty() => !allocator.matches_layout(layout)?,
+            _ => false,
+        };
+        if replace_empty_pool {
+            self.vram_slots = None;
+        }
+
+        if let Some(allocator) = self.vram_slots.as_mut() {
+            return allocator.alloc(layout);
+        }
+
+        let mut allocator = VgpuVramSlotAllocator::new(mm, layout)?;
+        let slot = allocator.alloc(layout)?;
+        self.vram_slots = Some(allocator);
+        Ok(slot)
+    }
+
+    fn release_vram_slot(&mut self, slot: VgpuVramSlot) -> Result {
+        self.vram_slots.as_mut().ok_or(EIO)?.release(slot);
+        Ok(())
+    }
+
+    /// Allocate resources and register a new inactive vGPU instance.
+    pub(super) fn allocate_instance(
+        &mut self,
+        mm: &GpuMm<'_>,
+        vgpu: &VgpuManager<'gpu>,
+        info: InstanceInfo,
+    ) -> Result<Gfid> {
+        let InstanceInfo {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+        } = info;
+
+        if self
+            .instances
+            .iter()
+            .any(|instance| instance.gfid == gfid || instance.dbdf == dbdf)
+        {
+            return Err(EEXIST);
+        }
+        let profile_instances = self
+            .instances
+            .iter()
+            .filter(|instance| instance.vgpu_type.vgpu_type_id == vgpu_type.vgpu_type_id)
+            .count();
+        if vgpu_type.max_instance == 0
+            || profile_instances
+                >= usize::try_from(vgpu_type.max_instance).map_err(|_| EOVERFLOW)?
+        {
+            return Err(ENOSPC);
+        }
+        // Reserve registry capacity before acquiring resources so publishing
+        // the completed instance cannot fail due to memory pressure.
+        self.instances.reserve(1, GFP_KERNEL)?;
+
+        let num_chid = vgpu
+            .total_channels()
+            .checked_div(vgpu_type.max_instance)
+            .filter(|count| *count != 0)
+            .ok_or(EINVAL)?;
+        let chids = vgpu.chid_pool.reserve_ids(
+            NonZeroUsize::new(usize::try_from(num_chid).map_err(|_| EOVERFLOW)?).ok_or(EINVAL)?,
+            Alignment::SZ_1,
+        )?;
+        let layout = VgpuVramLayout {
+            type_id: vgpu_type.vgpu_type_id,
+            max_slots: vgpu_type.max_instance,
+            fb_size: vgpu_type.fb_length,
+            heap_size: vgpu_type.gsp_heap_size,
+            fb_align: vgpu.vmmu_segment_size(),
+        };
+        let vram_slot = self.alloc_vram_slot(mm, layout)?;
+
+        let instance = VgpuInstance {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+            chids,
+            vram_slot,
+        };
+        match self.instances.push_within_capacity(instance) {
+            Ok(()) => Ok(gfid),
+            Err(error) => {
+                let VgpuInstance { vram_slot, .. } = error.0;
+                self.release_vram_slot(vram_slot)?;
+                Err(EIO)
+            }
+        }
+    }
+
+    /// Remove an instance and release its channel and VRAM reservations.
+    pub(super) fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+        let index = self
+            .instances
+            .iter()
+            .position(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        let instance = self.instances.remove(index).map_err(|_| EIO)?;
+        let VgpuInstance { vram_slot, .. } = instance;
+        self.release_vram_slot(vram_slot)
+    }
+}
+
+/// Query and decode one vGPU type using the typed NVKV schema.
+#[expect(dead_code)]
+pub(super) fn query_vgpu_type(cmdq: &Cmdq<'_>, type_id: u32) -> Result<VgpuType> {
+    let properties = query_vgpu_properties(cmdq, type_id)?;
+    Ok(VgpuType::from_properties(&properties))
+}
