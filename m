Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252FADDA9
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591521; cv=fail; b=UJZRg3z9Qmo+BQg/7vkFoNbaSI3ih7uk+ioZmI+vk++Z2EchIvGHrqmG5jflM0/vEaPvFRhbFLHLn8LXJk4KNiRKvjXtajTwNqTrw/qZeIXXXVGo2qc0zl8kzmWOkTPF8yn0T15/ithTP/Ny/cUNfhqTyRmv19wPXbjEg0hyvlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591521; c=relaxed/simple;
	bh=2pBWN6kZSvMfCAEoF/f2eCJzphlEwZsjTvY9CPO6fnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubTC3bMPJJUSUDB4KQhdziOFuaDSbtO/Rgdlt08jruZ/7iUtPp5L5VpV484Wzu/0fTbDB7JdyTYPvybgBA4uT19Lepwf/gbbguhmrKiMztaCqSlKMTk3mRq+8eedWhHIBRu1R5VvYys8n9s9tqjLc07vf63mttOEOwj29Uc21Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OJnzKwsa; arc=fail smtp.client-ip=52.101.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OJnzKwsa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQrGK2U6xzZoKy3e4CWRjOzOUVfPIweQx1dif3UpfyEu1If2ETlcFb8836wVhIr1um5tNkGEbarfi8KhS4g9P3jsPi78kpGcMl8OPeVksa3n6JJMHF4HaKc3VdScRXVL1ndI2Rl5CFNiTehToeXSktsb3QVRzvxt87LtKay46Ogmcx/of/xUc8/u8DDb/Djxu3RlYBCCXv+3srx7nAue1J4fYUO/gdMJgK4255nF7GQpXNVxYIHvHGKT3CcTeRL9dmk3C+wBzOtTDVOyZ2ur2n+fQL+Ak7UpxOpiwSEsasX+N6UzqIvuWsMAqFMwSIGE26gyaHhcS5ALPjI8QqjW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJJIP96LOBuhcVilHf5E2lVLnXZ3D41DS0XtuSavkaQ=;
 b=YJ6HQ66dTPNk3qPosyePgqTrR2NdW9MhVJMPF3lent4dSrAVyWG/oWaxlHlq9U8VKT8kpP0mG/d+clTzBaR7X9NKmcvIh44fpUx5opaQM6F7IsnaDb0+o7yyE40wuG+mPS5C+LHQMNzKFAdn+Kc79hrAcDflop+VGMi4SyW7r0RVfwI5Pyvqw9unMou1uwO/KNjlXhTfqB/io8kjdEArNs7idc9lObkki9aWVz3+OzUzUG1NYln8Qg33iDTfyadxzsGkZ43GFdYPs0D0npKgxQVHs10KYutF427uqJyCszBfg5LgfIhHvl6BUQO4ifDKhKbx7S12yJAl7x+eoYny8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJJIP96LOBuhcVilHf5E2lVLnXZ3D41DS0XtuSavkaQ=;
 b=OJnzKwsa4SxWvLImTZvkl2fglFbA+Zc47ENvcNak+KvBbi4W9Eyniysir943fiLZDJ6GjCPuSIBcn54nBj6CfPf7EMphf50DrK0R0nOb9oRaU2jLdPU57snYKg7CFFioUCmsMK5wW6b+W9jxd/eKlKZZaGY8DS/tsphHuXf4in3vAQliEHutr7D6ahkBLFIdVCa/7H3WzwsYtIRpXSklu2ZtKckIux0/eeorX/lLzYdmllsmMPPJsflfcnfunB+wJS4F/K9RV55HFrSY4rRJLaDu8z7l5okWQdrJSL1RaXbcr4Z/jjRSRiDVwSbjUN+ano+XSYRvEwyT27GXEt95iA==
Received: from MW4PR03CA0096.namprd03.prod.outlook.com (2603:10b6:303:b7::11)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:31:42 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::a6) by MW4PR03CA0096.outlook.office365.com
 (2603:10b6:303:b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:39 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:22 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:14 -0700
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
Subject: [PATCH v3 18/31] gpu: nova-core: vgpu: add instance create/destroy
Date: Mon, 28 Sep 2026 13:28:21 +0300
Message-ID: <4d3459f59e011b2af70903f0efc52b41f6e3e026.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f97fe9b-7179-4e40-a78b-08df1d4bae49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|7416014|10067099003|56012099006|5023799004|11063799006|3023799007|6133799003|7136999003|18002099003|22082099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	oqiRe5iqTXaJjE7crU6eP0K9DdtFmwtOaSsr6FIqD/UC8FhB5tAHvp1xrEzVJvO/+UJFVan7sy41SDflyWPl8W636vt9J2Ce5Lue2kCTdybwGvZ0EGpc4XZPjKYM1vr6iZoj0pPKM+MDznlTyG+u069pmKySLlnuaai0qeMSaBJEy1yXuInMjDuVu1S9AOoXIEqpEOnzrbStPMdYT4IUHGfnrwMh9TDWVDTADTtBdPPcV+sDmxebbEw7oxm5pILJK6zB1bYqBoTlIKGkeya7V48d7E3eg11WB99gI97Jq+foQ8AJIRhzXcf6CcuekUGsefskSmRg79jk6KLO9Z+J8eRU074F4/Z+4f8Z9/pJhgH7SGPD/REJGz4LhAVIH1jzttH+7D8Y6Ojf7E0Jswn/fwjlAoVrSLuu2DsKdYuRCUr6NzYFPcn5mfcs70gCnkpUQIxOSbPFSH8XoygHh6pNlxeKdY+zl4tsSJciIukjoRxnOlhqzpH9W+5R851A93KkXwhiw69oi6jNFlnEduHxlDtOPFlVWRhaqJtpIjn1wMXZfwgAHGNhVaabd4C4Gq9LTL1e0zvEwWkHDEewCodpHWcjH6YxBHkrrYKSnOYDv7IwQpzrh+ezYXLTmzFzlvrPYwy02cwma/8UQovAepdfqR/cxObEAbKuDDrr68W/ztIRskmp/mwViIJCr6DiNiqQPU0eeRDWnzIprdTMT78g5w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(7136999003)(18002099003)(22082099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VBgZK+7kaS1LXqID/A7gzvyUbdgUHA/CaOPmeJrYEWDGuhElEa8JDBN6m6Omx3bAk1iI+N1ZlQXEefc420buEBQGjHGEaAOlbEjtaCC+47Q8gkiYu4o3+VxhwkgZNp7r9C0bQFabTJJ3XRoA0kVNqpJwNF2Qu8P4eyzxEaD8j/F2w8qtkplbqs60BzP22Nw0sNZWA23nYpXN9Rv+0m+BEL3uxAEtgMaJdkJf0qd2rZf7OqLcIUkRwBkis8P+x2v6eK4Tllxspg+OxPKVE11h3L3Qs8wN5MG63/SfzClKRCKEpnTDu7TAE0GoBv0wEwQi/HWyeOT+oV4fkxmJi07hz0UB82TbHtaDQ0oMB8Bbtax6gPSjbgnvMKqU1Oqx3uOs5FXgoV43ddok8jLnU0oe5Vc3ygBAMrvrMBya579Nhr7/IqDv53tSRnqARMI9pMXC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:39.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f97fe9b-7179-4e40-a78b-08df1d4bae49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177

A vGPU instance owns the host resources reserved for a VF. Its assigned
type determines the channel range and VRAM and management-heap
reservation.

Add a manager-owned instance registry, reject duplicate GFID or DBDF
entries and enforce the profile's instance limit. Reserve registry
capacity before acquiring resources, then move the channel and VRAM
reservations into the instance. Removing an instance or dropping the
registry releases these host reservations through their owners.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs           |  12 +-
 drivers/gpu/nova-core/vgpu.rs          |  24 ++-
 drivers/gpu/nova-core/vgpu/instance.rs | 218 +++++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/vram.rs     |   1 -
 4 files changed, 240 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/instance.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 97b33d4b2631..b41a9921381d 100644
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
@@ -325,7 +327,7 @@ fn static_info(&self) -> &gsp::commands::GspStaticInfo {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
-    vgpu: Option<VgpuManager<'gpu>>,
+    vgpu: Option<Pin<KBox<VgpuManager<'gpu>>>>,
     /// GSP event interrupt registration.
     ///
     /// Must be kept declared *before* `gsp_resources`, so that the handler is unregistered, and
@@ -465,7 +467,7 @@ pub(crate) fn new<'a>(
                 let info = &gsp_resources.boot_result.static_info;
                 match gsp_resources.vgpu_state {
                     VgpuState::Disabled => None,
-                    VgpuState::Enabled { .. } => Some(VgpuManager::new(
+                    VgpuState::Enabled { .. } => Some(KBox::pin_init(VgpuManager::new(
                         // SAFETY: `chid_pool` is initialized above at its final pinned address.
                         // The private manager and its pool borrow cannot escape this `Gpu`.
                         // Completed field drop order drops the manager before the pool; on failure,
@@ -474,7 +476,7 @@ pub(crate) fn new<'a>(
                         &info.fifo_engine_list(),
                         info.vmmu_segment_size,
                         TOTAL_CHANNELS,
-                    )),
+                    ), GFP_KERNEL)?),
                 }
             },
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index d910445dd2b0..fb4f1b5f7754 100644
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
@@ -88,16 +91,17 @@ fn query_state(
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
     /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
-    #[expect(dead_code)]
     vmmu_segment_size: u64,
-    #[expect(dead_code)]
     total_channels: u32,
-    #[expect(dead_code)]
     fifo_engine_list: FifoEngineList,
 }
 
@@ -108,12 +112,14 @@ pub(crate) fn new(
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
 }
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
new file mode 100644
index 000000000000..a90aaef28b35
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use core::num::{
+    NonZero,
+    NonZeroUsize, //
+};
+
+use kernel::{
+    prelude::*,
+    ptr::Alignment,
+    sizes::SizeConstants, //
+};
+
+use crate::{
+    gpu::ChannelIdReservation,
+    mm::GpuMm, //
+};
+
+use super::{
+    commands::Dbdf,
+    vram::{
+        VgpuVramLayout,
+        VgpuVramSlot,
+        VgpuVramSlotAllocator, //
+    },
+    VgpuManager, //
+};
+
+/// Guest Function ID validated against one device's total number of VFs.
+///
+/// GFID 0 is reserved for the PF; VFs start at 1. Keeping the nonzero `u16`
+/// preserves the PCI SR-IOV range when forming a plugin doorbell handle.
+#[repr(transparent)]
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub(super) struct Gfid(NonZero<u16>);
+
+impl Gfid {
+    /// Validates an external GFID for a device supporting `total_vfs` VFs.
+    #[expect(dead_code)]
+    pub(super) fn new(gfid: u32, total_vfs: NonZero<u16>) -> Result<Self> {
+        let gfid = u16::try_from(gfid).map_err(|_| EINVAL)?;
+        let gfid = NonZero::new(gfid).ok_or(EINVAL)?;
+
+        if gfid > total_vfs {
+            Err(EINVAL)
+        } else {
+            Ok(Self(gfid))
+        }
+    }
+
+    #[expect(dead_code)]
+    pub(super) const fn get(self) -> u16 {
+        self.0.get()
+    }
+}
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
+/// A vGPU instance and the resources reserved for it.
+#[expect(dead_code)]
+struct VgpuInstance<'gpu> {
+    gfid: Gfid,
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
+    /// Allocate resources and register a new inactive vGPU instance.
+    fn allocate_instance(
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
+        let instance_exists = self
+            .instances
+            .iter()
+            .any(|instance| instance.gfid == gfid || instance.dbdf == dbdf);
+        if instance_exists {
+            return Err(EEXIST);
+        }
+
+        let type_id = vgpu_type.vgpu_type_id;
+        let num_type_instances = self
+            .instances
+            .iter()
+            .filter(|instance| instance.vgpu_type.vgpu_type_id == type_id)
+            .count();
+        let max_instances = usize::try_from(vgpu_type.max_instance).map_err(|_| EOVERFLOW)?;
+        if max_instances == 0 || num_type_instances >= max_instances {
+            return Err(ENOSPC);
+        }
+
+        // Reserve registry capacity before acquiring resources so publishing
+        // the completed instance cannot fail due to memory pressure.
+        self.instances.reserve(1, GFP_KERNEL)?;
+
+        let channels_per_instance = vgpu
+            .total_channels
+            .checked_div(vgpu_type.max_instance)
+            .ok_or(EINVAL)?;
+        let channels_per_instance =
+            usize::try_from(channels_per_instance).map_err(|_| EOVERFLOW)?;
+        let channels_per_instance = NonZeroUsize::new(channels_per_instance).ok_or(EINVAL)?;
+        let chids = vgpu
+            .chid_pool
+            .reserve_ids(channels_per_instance, Alignment::SZ_1)?;
+
+        let vram_layout = VgpuVramLayout {
+            type_id,
+            max_slots: vgpu_type.max_instance,
+            fb_size: vgpu_type.fb_length,
+            heap_size: vgpu_type.gsp_heap_size,
+            fb_align: vgpu.vmmu_segment_size,
+        };
+        let vram_slot = self.alloc_vram_slot(mm, vram_layout)?;
+
+        let instance = VgpuInstance {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+            chids,
+            vram_slot,
+        };
+        self.instances
+            .push_within_capacity(instance)
+            .map_err(|_| EIO)?;
+
+        Ok(gfid)
+    }
+
+    /// Remove an instance and release its channel and VRAM reservations.
+    fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+        let instance_index = self
+            .instances
+            .iter()
+            .position(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        let instance = self.instances.remove(instance_index).map_err(|_| EIO)?;
+        drop(instance);
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/vram.rs b/drivers/gpu/nova-core/vgpu/vram.rs
index 65e6a945ea6f..faaeea106009 100644
--- a/drivers/gpu/nova-core/vgpu/vram.rs
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -116,7 +116,6 @@ pub(super) struct VgpuVramSlotAllocator {
     slot_bitmap: Arc<SlotBitmap>,
 }
 
-#[expect(dead_code)]
 impl VgpuVramSlotAllocator {
     pub(super) fn new(mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<Self> {
         let layout = layout.validated()?;
