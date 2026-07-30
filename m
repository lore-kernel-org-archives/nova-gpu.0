Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F3944E038
	for <nova-gpu@lists.linux.dev>; Thu, 30 Jul 2026 18:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435297; cv=fail; b=QvZIvGZOg8LZwl5oPibQIy9UqtA5iHvKv6e5KQKp6R0v8nNgMQTkCqk/U7shWBE7FR6eomgK/MCDC1jU/TbcZbzWmZrWUKGKFjagOaqayfbMfzH8WjEvdzSsjkiXHgnVl6vGJHS0to7+ZiwP54nlt2c9RkD/iMiPnk51CZalNOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435297; c=relaxed/simple;
	bh=bAV2xLdBnzx+bop5D7c0aEOesbr3NQ2ZI9Unw309XlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V89a1rqwrPQdiqEXyj9MD1QcHI5hM5Z7R2o9GohoSsiGryLPMTIzjJz8mqDotyrRH/h3haxrFx7y5oBH5rjnxIXtDs4s4OMwBxOHYzsI2Wd76GochA7N/elxqyKoiZxdIvf756/fA9ecmESoU+z1VG3C3S/pRK6/KXkiHAesFjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YqruaJk7; arc=fail smtp.client-ip=40.107.200.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YqruaJk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztx153759Ijydb3a05qrP/kxIITbB+xTkhD16OPmrJUyE6d9kfR2T0QpJZ8XWvlRV8GkcFagoStlQP5tk5RddAUzxSYIHc2X499Wiq/njDmxk4F4rNT23vSOAC7xvXB7t73N7nmSZD95k+VtqVAL/TiLFBaSXtNk2Qv0soH8Y7hjxZ0T6SDQDQKjOxqdR3PMK7XO6+MD0Z7katrxFlrJL0RndXwRl8wgDFTZ9YfNM5ATvnZxYq9MIYXY4f8s8h6JSZvw92SGCT6CVAbeb8NLpcsFrSE8AKx9coaK2z/6D9Vo6HqBa1F7EqrOr5MCyCTaqnb9UgeWK1rgULVgCyAV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xsGXL800OfX7dUCpmSnyrmWcEdTbQU3iRPa3DSdmYs=;
 b=eQh5clGdb19fUgqun+7MBGCms+ri+yauBwi6aCBMnDPTqcA7jjAl9dwB7gQeNUtQPXDGBMLEfNZLiWx59XKPHVBUj54F4KvhcPu5PhjDvWUwhqlxDy4Qg8gmBfl05pbsCRm1VsfQPkrRLfZ2gzHVA41c3PGPFTXF8867cA0IJRbt7Yzwmj40gZsFGllYeWzYJrh/zjWBw0S9KHc44thrCrnXv0t0px+w5zsJrNNQuEApnrSnplio0QYKB05lfPJ0oMyncHDazt5hCDZP0oAiOYgvDnh0ipRAaCVgtv0pEFOZgwcM3uFnQGdbxWtuZ6VmzN0b/uDPMfDnW61mfcvONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xsGXL800OfX7dUCpmSnyrmWcEdTbQU3iRPa3DSdmYs=;
 b=YqruaJk7uQVrPbyQLdiecDfFxdJNoNu1K9jFcuLJJ1ulp/O6XtHDkapthGocjfZrYc11t0ELArbLiE9mtKzxCopRh+rMARi6bP39hbhbJYFmEIIED2Ln7PiTPrnHnB4hD/ZC95FuGtnpe1OlehYI6W4FpL880WUJRG4GSNy0pZ8h9aYOkoaj5JRdyS0Mo17nF2rJaaAc+MOg4LmXMUZdPjz3EDWNRq+SIJnickK/gH25W44p+z/l1jjtxYqJ6XahLA3IGyiR61oummbitc5Rk5GIeoqB6eeoyE7t24s5OMxRIKMWMu5pXnTucoFxVY894F4gHL0lRYyJCxTzc/tNBg==
Received: from BN9PR03CA0973.namprd03.prod.outlook.com (2603:10b6:408:109::18)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 18:14:50 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::46) by BN9PR03CA0973.outlook.office365.com
 (2603:10b6:408:109::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Thu,
 30 Jul 2026 18:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 18:14:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 30 Jul
 2026 11:14:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 11:14:25 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 30
 Jul 2026 11:14:16 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is enabled
Date: Thu, 30 Jul 2026 21:14:04 +0300
Message-ID: <20260730181404.776028-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730181404.776028-1-zhiw@nvidia.com>
References: <20260730181404.776028-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 09839318-a86a-4f9d-0f0b-08deee6671f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|10067099003|11063799006|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ddIBS0R/3+7p94GEZXvYFAVBY9GJrwiXqMiLhaXC1g1Uaymjv2bhZBWkGvfiOGI1p8vsS5MiIMLth3QhL7BZRzpIvQB3ltK7xvpWSTvL14ICvARUKa46NWYHsK5XxRvSdNCwCRAMbuNr9HPIb1SceU0Sk9gsNEFQSDhiky+X2Q02SWrWXRFp7kttvrBk+loQrEMzwxlxYpMWMsPhl3rQHXt+SOMF9vbcG2ifeyX1B2lWJ7KVtHp0Mr8VgBOsd4q21kRwTF8eYEBJQzzlBv5miyOMMMmjp3YPdqZ6+4L/9uzVk20LAl33AbhJbwEhrPE3eSCcSBBjLRUaGjZFIx/FhROuSO1mA6MGqyqgUCjRJpPeG2hLJcUOUIznK2tz3FEjlXjQySQbu0XfsYtVQAvZyl3uMKTiUAXfCwoMegPfErfe3pEGgoffM/KdrJStcflIkxjzA5tN7uW2MvxytWP6tV64ElI5Pn8YiqxOxMK0BoQ6G9tjelPHxA15lExJ36EwdKGYJR7rWDfiw22pWSEVAVK0HW373ebttT/p2aBW1HIOlbg7A8VY/3lf8R/ltElvYFphcNgAxZTyXe6qJlB7n8fIpQuX99r10KqPq8J1EZmRHI++vOtDCA1eBUrQvBA8Yc+/+SUgZyKYxVBz1pXT1y3WjMsAaTQxjR/yPO5nmAmdvE/imrC0GjUMIonfonn/VJ+LnfZsLAruNtKapDGvyw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NOdU9LGI8W9WlUmuCg2x91D3Ayrgacnc3PPw5DutnjO9gneF6jUzXBcGwhFAR1BdpEtLWCpelUxRZ6P9SunfVGGTxBmFS0KwsW1anAtAARYBx+lp68GTRB/yOXY9Ez3CUhI6DnF3VJBKHf0HwJCKqr9qpry8/QsvB48olU2Yb5RRBmFP98Y80UwaeduRfa8bQGur/dqfi0usKBDeztuOg5wXp1tZ4lZETorzGoT5QjAxEc3zDKbUOFejVkku5vBq04TgA/QBudi71Qbl2XANH4JXXm+A1iX+TPYcXDQe1UzvycaDsr0FBjWXqbuPHnoayoWYv49YEvP99PmNAHN2FcUMSCdqonBnNz49S/ldeVeFT7Og1WGhjhbIKwqbIP2PbKg4UDnJBvdxQwcM1B4mWZV7fC+jedSIiVVG2Fz+pbq2I50i4ih/qHktVdkkW5bl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:14:49.7672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09839318-a86a-4f9d-0f0b-08deee6671f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443

GSP firmware requires VF BAR layout information to correctly route
interrupts and doorbell events to individual virtual functions.
Without this data the firmware cannot set up per-VF event routing.

When vGPU mode is enabled, read the VF topology from the typed PCI
SR-IOV extended capability and populate the GSP_VF_INFO embedded in
the GSP_SYSTEM_INFO command.

Register GpuacctPerfmonUtilSamples in MsgFunction so the receive path
recognizes vGPU perfmon sampling events from GSP-RM.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  6 ++--
 drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++--
 drivers/gpu/nova-core/gsp/fw.rs          |  4 +++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 35 +++++++++++++++++++++++-
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 727b8ae4bcb7..c086026dc2d8 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -86,8 +86,10 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+        self.cmdq.send_command_no_wait(
+            bar,
+            commands::SetSystemInfo::new(pdev, chipset, ctx.vgpu.state()),
+        )?;
         self.cmdq
             .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index ffc25fd8c47b..11d0c7ec371e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -41,12 +41,21 @@
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
     chipset: Chipset,
+    vgpu_state: VgpuState,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
-        Self { pdev, chipset }
+    pub(crate) fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+        vgpu_state: VgpuState,
+    ) -> Self {
+        Self {
+            pdev,
+            chipset,
+            vgpu_state,
+        }
     }
 }
 
@@ -57,7 +66,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev, self.chipset)
+        Self::Command::init(self.pdev, self.chipset, self.vgpu_state)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6e8e7d822ef1..6afe08abd868 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -254,6 +254,7 @@ pub(crate) enum MsgFunction {
     GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
     GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
     GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
+    GpuacctPerfmonUtilSamples = bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
     PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
@@ -303,6 +304,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
             }
+            bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES => {
+                Ok(MsgFunction::GpuacctPerfmonUtilSamples)
+            }
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
             bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 6dc31d1bf5ae..edf21aa8c61b 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -16,11 +16,42 @@
 use crate::{
     gpu::Chipset,
     gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
+    num::IntoSafeCast,
+    vgpu::VgpuState, //
 };
 
 use super::bindings;
 
+/// Builds the VF topology passed to GSP-RM as part of the system information.
+fn build_vf_info(
+    dev: &pci::Device<device::Bound>,
+    vgpu_state: VgpuState,
+) -> Result<bindings::GSP_VF_INFO> {
+    let VgpuState::Enabled { total_vfs } = vgpu_state else {
+        return Ok(Default::default());
+    };
+
+    let sriov = dev
+        .config_space_extended()?
+        .find_ext_capability::<pci::ExtSriovRegs>()?;
+
+    let bar0 = sriov.read_vf_bar(0)?;
+    let bar1 = sriov.read_vf_bar(bar0.next_index())?;
+    let bar2 = sriov.read_vf_bar(bar1.next_index())?;
+
+    Ok(bindings::GSP_VF_INFO {
+        totalVFs: u32::from(total_vfs.get()),
+        firstVFOffset: u32::from(kernel::io_read!(sriov, .vf_offset)),
+        FirstVFBar0Address: bar0.address(),
+        FirstVFBar1Address: bar1.address(),
+        FirstVFBar2Address: bar2.address(),
+        b64bitBar0: u8::from(bar0.is_64bit()),
+        b64bitBar1: u8::from(bar1.is_64bit()),
+        b64bitBar2: u8::from(bar2.is_64bit()),
+        ..Zeroable::zeroed()
+    })
+}
+
 /// Payload of the `GspSetSystemInfo` command.
 #[repr(transparent)]
 pub(crate) struct GspSetSystemInfo {
@@ -33,6 +64,7 @@ impl GspSetSystemInfo {
     pub(crate) fn init<'a>(
         dev: &'a pci::Device<device::Bound>,
         chipset: Chipset,
+        vgpu_state: VgpuState,
     ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let pci_config_mirror_range = chipset.pci_config_mirror_range();
@@ -54,6 +86,7 @@ pub(crate) fn init<'a>(
             PCIRevisionID: u32::from(dev.revision_id()),
             bIsPrimary: 0,
             bPreserveVideoMemoryAllocations: 0,
+            gspVFInfo: build_vf_info(dev, vgpu_state)?,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0

