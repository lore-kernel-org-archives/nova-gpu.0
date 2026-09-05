Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9B448399
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596019; cv=fail; b=hibd4gR5Y/wzezGnWTRk1neUVj0s59yADXYqPS+AlehXz4K2bQBs84jQNQgGxUjv9UyOoKlGBHFGt43PIblebLsyeSmKG87xzawl+hc4dl+NbAKHDMKLaEcMTN4p+uChj8Leln1ENJUUIOAsHHG8tZW+8wjGcDJlSqVxFb7bCAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596019; c=relaxed/simple;
	bh=8Ez5Uzh1rYHX+cQVuhoKvP0RMaZOwWKxu+qTW62bPc8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZK8sI0ZFKh8cFeMZ8KdGUGir2j41ZDiTRFOs/aXth4atXwW4sykOM8f/WHliWH7HEl1nFSd0cjlfjKso6/6YDUsMd/Qf8PdI5EXpg3HUmWjKZeDtjGS+MIdp0EdNdcVm5AiHrU2C+g+DXe/aaqqeNLv99n+0uKyBn5RrjGzFS9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=himGbHXh; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="himGbHXh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgjgVtNLbkaCmloSWqIjkBQ/Rm6Lg5AtQO2tp3rt7Nhw3ZooiLLqUQbR85+L+XpXXhYiUPsCxMBxX4QjT45u3a+3fg/MI8hmIIzaShIxAHAvgoArsNQ+F6MKTyytG49nvVEDrlgEwJe5jR2PDwk/Dw5iafySzpHGOJ1HOB3e/+MeHC+tbTVsWRZI422X3xFMS3/mI2c0t2Xvn5+vI1ZYrd/T4izgR5rY0dm7x/s7dkGnjMmZAY6z0u5Lq8PDm+WF/vBiQ05kYsRzPzassW/tryi33gxUeDp2jjZh+hJPhi4Tk13Wa3zXEClt1iwDLxTCE2VupUgSrDOW4boKQ3iXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYWTinNkxwjDJTlGNNcToO6GxKbXo5OxbTr5U0s63Ww=;
 b=BZE1r2c+b2aX3urSTTbSpvV752TashV2uL1J5gUZK1N871g+CoVkRsQfTfUaIAkrAdJPTXnAZkq/3Eyk8JxgaeGF4NNBVuZXjOOGzpbJq5iSa9pxPOW8yyQgijdzwuWFsHaONGseiAbT9KhxSb9zw9RqsQ0rsvdL9D/4xK6KIGNwIwSMA+IHgzdN0T9rt4OXyotYNCNpggPVqc1K4LLeZQOI5m9MJ33KySC/X8Mzl4rvKn5KVFyf+vFm6tnGBbYX8oT8Me7yF1MWEbBvK/gzrgXEJv09byKPhGnjUgU5GkG7yYFprT7NJksixUSJehKLdxFyFYOrjeFeyJxu0l6y4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYWTinNkxwjDJTlGNNcToO6GxKbXo5OxbTr5U0s63Ww=;
 b=himGbHXhhwpUysKpHDplxQKSNUcZIWiWIQTtN8x7CPkVWRCnAS7zCuq8CFN3dswLc89by8fdCLZxcjYaybT6yp3Q6e/5wnqFrn/D9Sck6hQfmEgf0YvNYaaUZzIZPPhfydN9lRXNstS7BcD4sQSK4EP2VL2wyuM30dnAeJFRcZ3nTO5CjAQ8+zFH6JN+6HIMLwsk7waDTUcfgMv+OboMc876GlHxT8WdXI6drmCYVjvlAAXTei2pWRFwfPfQQuztSQBHDA4iCQp1u5Sg0RBzuGGIVQfc17/UUbOidEkBBJMDDNkiSe3cNHBPCcOirQYZvxQA6rZYDWQqkEsDfdmYiA==
Received: from MN0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:52c::32)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:13:02 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::44) by MN0PR05CA0024.outlook.office365.com
 (2603:10b6:208:52c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Sat, 5
 Sep 2026 08:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:13:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:46 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:45 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:37 -0700
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
Subject: [PATCH 09/13] gpu: nova-core: vgpu: scrub guest framebuffer memory with CeUtils
Date: Sat, 5 Sep 2026 11:11:12 +0300
Message-ID: <20260905081116.106613-10-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d19846-0055-43b4-e453-08df0b25816d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|7416014|82310400026|11063799006|6133799003|5023799004|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qoBGEIS/PpLfxuIGEoUfGjzOli7BZAKOZFlcbEofYe6rOEFnSbwwMXrm93E0WaAcGr+m2peBkmJ2SzhSpVWx1zTago4lcZ4iUc3rFnySlRs7V/29fF1MYj03Eg+bF4rxJs95WjWdLp1E1fHvlBvLb+4mSK7o7QJ8GIs2ienUT/7eEQex/rCXO3JKbsuLAe8JKovPA1J55AAhrLw2NwAu8ug+A6poMzVxGzXlYjtzJ1fLlcUcO+gh0Z3hVaFhLGm5jZj9SnY59V9zrWM9SQ1ujRvcqyalL8mGtw8+ub7QcX+l43vDRUEWDmaoz0qOW02B8eA0TEM3ovpxY447ZleBW/uGaDhwos9PxTAZpLkEdIR3BZp9FwUqTH8iM6MkllJekoBvitAg7jUWBaWPUyU1Ctyhniv9ewSF9/nPYEpyhPlkerdTITHBX6KAtaeH32/5gCm8D0xgcmRUhzpuZW4djS1B26K/nuIogoAYjFrBgfeOuXJAQFfbSvPGcc9+TcRqHkLPkSvNbpu5zdrgSjmFMTgYtMa/fwhyF77MP2TIs00I1K3pWc4nlFYnIRYFA3egt2ewffVmZc/GM1UHh4x3nIBj1+6Ryb8SAoz8qyn4FON4Tt0LHAXzuG11tGanGIsIgQVYO27iSL95zdnDsg/MhekHOnBlPBNGkjtp1yg2nZE8NtplLI55+fpwutd72ixU3LyMzR6YeNM5LvKXwAlD+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(7416014)(82310400026)(11063799006)(6133799003)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zk6palEzRTyIna7jPADXagbkXWxd+KNrRkDy6mAysKfp6OAhZr5d+MNRb6dKsFPqHEGS4zKOJaqzMzf2/Lx8NusB/tfguRAI/AKlFTy0cIwUovjn7fZ6qYqUC5YLXlcWW1SQ7lx95fsxtUAUauzOCYjyeMaOI5ljTW+lRitl+1+pw8JSxdE0osSwJTuNbvjUl3egyG1fPQQ0RKdP0woGuDXS77FhVrBpJgV46iODCor4Jny3JHuh16Ayh6blNNFKgOY1kAl40x3YMch+Xa+ixCUnah6kfutdQxDdifE6FAkOmWuZSXhw3nJpenY7UWiedKLXIvdHbUfnm7ZLkRT48A3dmcEEDyk1RZeyogVkS9HtkLO1Rfdoik6pyFM6kK7BkAOd/d0AZ9+6ND6aPhv3dIR6pi4qfwF8GUk+PQrqee5pLIdkewu7na5ZN1SlRBy9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:13:02.1091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d19846-0055-43b4-e453-08df0b25816d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

A vGPU framebuffer can retain guest data when an instance is reused.
Add a per-instance Copy Engine utility, CeUtils, that asks GSP-RM to
scrub the framebuffer and verifies completion through a hardware
semaphore page.

Scrub a framebuffer immediately after allocating it and after shutting
an instance down, before returning its VRAM to the allocator. Reserve
the last channel ID in each instance range for CeUtils and report the
remaining channel count to the plugin.

If firmware ownership or scrub completion cannot be established, retain
the affected channel IDs and VRAM instead of allowing another instance
to reuse them.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               |   4 +
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  |   1 +
 drivers/gpu/nova-core/vgpu/consts.rs          |   6 +
 drivers/gpu/nova-core/vgpu/instance.rs        | 141 +++++-
 drivers/gpu/nova-core/vgpu/mod.rs             |   1 +
 drivers/gpu/nova-core/vgpu/scrubber.rs        | 474 ++++++++++++++++++
 6 files changed, 615 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/scrubber.rs

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 686120224d0f..e6c0fac55bad 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -13,11 +13,15 @@ pub(crate) mod vgpu_bindings {
         GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
         GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE,
+        GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS,
+        GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS,
+        GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB,
         GSP_PLUGIN_BOOTLOADED,
         MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
         MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
         MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
         MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+        NV_ADDR_FBMEM,
         VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
         VGPU_CPU_GSP_CTRL_BUFF_REGION,
         VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index dcb44a403469..01e84dfc4b88 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -858,6 +858,7 @@ pub struct rpc_unloading_guest_driver_v1F_07 {
     pub __bindgen_padding_0: [u8; 2usize],
     pub newLevel: u32_,
 }
+pub const NV_ADDR_FBMEM: u32 = 2;
 pub const GSP_PLUGIN_BOOTLOADED: u32 = 1315261039;
 pub const VGPU_CPU_GSP_CTRL_BUFF_VERSION: u32 = 2;
 pub const VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE: u32 = 4096;
diff --git a/drivers/gpu/nova-core/vgpu/consts.rs b/drivers/gpu/nova-core/vgpu/consts.rs
index 13aabefa4ecf..3b3e8b239ac3 100644
--- a/drivers/gpu/nova-core/vgpu/consts.rs
+++ b/drivers/gpu/nova-core/vgpu/consts.rs
@@ -17,6 +17,12 @@ pub(crate) mod gmc {
         bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE;
     pub(crate) const CLEANUP: u32 =
         bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
+    pub(crate) const SCRUB_GUEST_FB: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB;
+    pub(crate) const ALLOC_GSP_CEUTILS: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS;
+    pub(crate) const FREE_GSP_CEUTILS: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS;
 }
 
 /// vGPU plugin RPC values not provided by the firmware bindings.
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 161b49d93de5..d6938cc65bf9 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -38,6 +38,10 @@
             PluginConfigParams,
             PluginRpc, //
         },
+        scrubber::{
+            CeUtils,
+            CeUtilsAllocError, //
+        },
         vram::{
             VgpuVramLayout,
             VgpuVramSlot,
@@ -117,11 +121,22 @@ pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) vm_pid: u32,
     pub(crate) chids: ChannelIdReservation<'gpu>,
     pub(crate) num_plugin_channels: u32,
+    ceutils: CeUtils,
     pub(crate) vram_slot: VgpuVramSlot,
     pub(crate) plugin_rpc: PluginRpc<'gpu>,
 }
 
 impl<'gpu> VgpuInstance<'gpu> {
+    /// Request the idempotent firmware release of this instance's CeUtils.
+    fn release_ceutils(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+    ) -> Result {
+        self.ceutils.release(dev, cmdq, bar)
+    }
+
     /// Unmap the plugin communication buffer and return the slot release token.
     fn unmap_and_take_slot(
         self,
@@ -136,6 +151,47 @@ fn unmap_and_take_slot(
         plugin_rpc.destroy(bar_user, mm)?;
         Ok(vram_slot)
     }
+
+    /// Scrub the instance framebuffer with its owned CeUtils allocation.
+    pub(crate) fn scrub_guest_fb(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+    ) -> Result {
+        self.ceutils
+            .scrub_guest_fb(dev, cmdq, bar, bar_user, mm, &self.vram_slot.fbmem)
+    }
+}
+
+/// Keep channel IDs unavailable when firmware ownership cannot be determined.
+fn quarantine_channel_ids(chids: ChannelIdReservation<'_>) {
+    // A failed GMC response cannot distinguish a command that was never
+    // executed from one whose reply was lost, and there is no ownership query
+    // for CeUtils. Running the reservation's destructor could therefore let a
+    // second owner reuse a firmware-owned CHID. Skipping it leaves those bits
+    // reserved for the remaining lifetime of the device's channel-ID pool.
+    core::mem::forget(chids);
+}
+
+/// Keep an invariant-violating slot and its backing VRAM unavailable for reuse.
+fn quarantine_vram_slot(slot: VgpuVramSlot) {
+    // A live slot without its allocator should be impossible. If it happens,
+    // stale BAR1 mappings may still refer to this VRAM. There is no recovery
+    // path without the allocator, so permanently retaining the backing
+    // allocation is safer than exposing it again.
+    core::mem::forget(slot);
+}
+
+/// Preserve every guard when publishing a fully built instance unexpectedly fails.
+fn quarantine_instance(instance: VgpuInstance<'_>) {
+    // allocate_instance() reserves registry capacity before acquiring any
+    // resource, so this is an invariant-failure fallback. If firmware release
+    // is also unconfirmed, retaining the complete instance prevents its CHID,
+    // BAR1 mapping, and VRAM from being independently reused.
+    core::mem::forget(instance);
 }
 
 /// Identity and firmware profile used to allocate an instance.
@@ -195,9 +251,7 @@ fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<
 
     fn release_vram_slot(&mut self, slot: VgpuVramSlot) {
         let Some(allocator) = self.vram_slots.as_mut() else {
-            // A live slot proves that its pool exists. If that invariant is ever broken,
-            // leaking the slot is safer than allowing its backing VRAM to be reused.
-            core::mem::forget(slot);
+            quarantine_vram_slot(slot);
             return;
         };
         allocator.release(slot);
@@ -205,9 +259,12 @@ fn release_vram_slot(&mut self, slot: VgpuVramSlot) {
 
     /// Allocate resources, map the management communication region, and
     /// register a new inactive vGPU instance.
+    #[expect(clippy::too_many_arguments)]
     pub(crate) fn allocate_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
         bar_user: &BarUser<'gpu>,
         mm: &mut GpuMm<'_>,
         vgpu: &VgpuManager<'gpu>,
@@ -246,12 +303,14 @@ pub(crate) fn allocate_instance(
             .total_channels()
             .ok_or(ENODEV)?
             .checked_div(vgpu_type.max_instance)
-            .filter(|count| *count != 0)
+            .filter(|count| *count > 1)
             .ok_or(EINVAL)?;
         let chids = vgpu.chid_pool.reserve_ids(
             NonZeroUsize::new(usize::try_from(num_chid).map_err(|_| EOVERFLOW)?).ok_or(EINVAL)?,
             Alignment::SZ_1,
         )?;
+        let ceutils_chid =
+            u32::try_from(chids.end.checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?;
         let layout = VgpuVramLayout {
             type_id: vgpu_type.vgpu_type_id,
             max_slots: vgpu_type.max_instance,
@@ -260,12 +319,58 @@ pub(crate) fn allocate_instance(
             fb_align: vgpu.vmmu_segment_size().ok_or(ENODEV)?,
         };
         let vram_slot = self.alloc_vram_slot(mm, layout)?;
+        let ceutils = match CeUtils::allocate(dev, cmdq, bar, gfid, ceutils_chid, 0) {
+            Ok(ceutils) => ceutils,
+            Err(alloc_error) => {
+                let error = match alloc_error {
+                    CeUtilsAllocError::NotOwned(error) => error,
+                    CeUtilsAllocError::MayOwn(error) => {
+                        if let Err(release_error) = CeUtils::release_gfid(dev, cmdq, bar, gfid) {
+                            dev_err!(
+                                dev,
+                                "CeUtils alloc {:?}; firmware release unconfirmed: {:?}\n",
+                                error,
+                                release_error,
+                            );
+                            quarantine_channel_ids(chids);
+                        }
+                        error
+                    }
+                };
+
+                // CeUtils allocation never receives the FB address, so the slot is safe to
+                // recycle once its local regions have been dropped.
+                self.release_vram_slot(vram_slot);
+                return Err(error);
+            }
+        };
+        if let Err(error) = ceutils.scrub_guest_fb(dev, cmdq, bar, bar_user, mm, &vram_slot.fbmem) {
+            // This error may be an unmap failure, or firmware may still be scrubbing. Keep the
+            // channel reservation and slot out of their allocators in either case.
+            quarantine_channel_ids(chids);
+            dev_err!(
+                dev,
+                "retaining CeUtils and VRAM slot {} after scrub error {:?}\n",
+                vram_slot.index(),
+                error,
+            );
+            return Err(error);
+        }
         let comm = match CommBufferRegion::new(bar_user, mm, &vram_slot.mgmt_heap) {
             Ok(comm) => comm,
             Err(error) => {
                 // A failed page-table update may have installed a partial mapping without
                 // returning a handle that can unmap it. Keep the slot reserved so its backing
                 // VRAM cannot be reused while stale BAR1 PTEs may still reference it.
+                if let Err(release_error) = ceutils.release(dev, cmdq, bar) {
+                    dev_err!(
+                        dev,
+                        "BAR1 error {:?}; CeUtils release unconfirmed: {:?}\n",
+                        error,
+                        release_error,
+                    );
+                    quarantine_channel_ids(chids);
+                }
                 dev_err!(
                     dev,
                     "allocate_instance: retaining slot {} after BAR1 map error {:?}\n",
@@ -283,22 +388,32 @@ pub(crate) fn allocate_instance(
             vm_pid,
             chids,
             num_plugin_channels: 3,
+            ceutils,
             vram_slot,
             plugin_rpc: PluginRpc::new(comm),
         };
         match self.instances.push_within_capacity(instance) {
             Ok(()) => Ok(gfid),
-            Err(error) => match error.0.unmap_and_take_slot(bar_user, mm) {
-                Ok(vram_slot) => {
-                    self.release_vram_slot(vram_slot);
-                    Err(EIO)
+            Err(error) => {
+                let instance = error.0;
+                if let Err(error) = instance.release_ceutils(dev, cmdq, bar) {
+                    // Firmware may still own the final CHID. Keep every host resource
+                    // quarantined rather than returning any of them to an allocator.
+                    quarantine_instance(instance);
+                    return Err(error);
                 }
-                Err(error) => Err(error),
-            },
+                match instance.unmap_and_take_slot(bar_user, mm) {
+                    Ok(vram_slot) => {
+                        self.release_vram_slot(vram_slot);
+                        Err(EIO)
+                    }
+                    Err(error) => Err(error),
+                }
+            }
         }
     }
 
-    /// Shut down and remove an instance, then release its reservations.
+    /// Shut down an instance, scrub its guest FB, and release its reservations.
     pub(crate) fn destroy_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
@@ -315,6 +430,8 @@ pub(crate) fn destroy_instance(
             .ok_or(ENOENT)?;
 
         shutdown(dev, cmdq, bar, gfid)?;
+        self.instances[index].scrub_guest_fb(dev, cmdq, bar, bar_user, mm)?;
+        self.instances[index].release_ceutils(dev, cmdq, bar)?;
         cleanup(dev, cmdq, bar, gfid)?;
         let instance = self.instances.remove(index).map_err(|_| EIO)?;
         let vram_slot = instance.unmap_and_take_slot(bar_user, mm)?;
@@ -376,7 +493,7 @@ pub(crate) fn activate_instance(
         instance.dbdf,
         instance.vgpu_type.vgpu_type_id,
         instance.vm_pid,
-        u32::try_from(instance.chids.len()).map_err(|_| EOVERFLOW)?,
+        u32::try_from(instance.chids.len().checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?,
         instance.num_plugin_channels,
     );
     let gfid = instance.gfid;
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index 1c67d7afbe56..17e6d8d37af7 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -7,6 +7,7 @@
 pub(crate) mod consts;
 pub(crate) mod instance;
 pub(crate) mod plugin_rpc;
+pub(crate) mod scrubber;
 
 pub(crate) use self::instance::VgpuInstances;
 
diff --git a/drivers/gpu/nova-core/vgpu/scrubber.rs b/drivers/gpu/nova-core/vgpu/scrubber.rs
new file mode 100644
index 000000000000..0a5d60b7ea4a
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/scrubber.rs
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-VM CeUtils guest framebuffer scrubbing.
+
+use kernel::{
+    device,
+    prelude::*,
+    time::{
+        delay::fsleep,
+        Delta,
+        Instant,
+        Monotonic, //
+    },
+};
+
+use crate::{
+    driver::Bar0,
+    gsp::{
+        cmdq::Cmdq,
+        vgpu_bindings as bindings, //
+    },
+    mm::{
+        bar_user::{
+            Bar1Map,
+            BarUser, //
+        },
+        vram::VramRegion,
+        GpuMm,
+        Pfn,
+        VramAddress,
+        PAGE_SIZE, //
+    },
+    num,
+    vgpu::{
+        consts::gmc,
+        instance::Gfid, //
+    },
+};
+
+// OpenRM `channel_utils.h` defines `NV_CEUTILS_SEMA_PAGE_MAGIC` and places
+// `NV_CEUTILS_SEMA_PAGE_PAYLOAD_OFFSET` immediately after it.
+const NV_CEUTILS_SEMA_PAGE_MAGIC: u32 = 0xce5e_5ea0;
+
+#[repr(C)]
+struct CeUtilsSemaphoreHeader {
+    magic: u32,
+    payload: u32,
+}
+
+static_assert!(size_of::<CeUtilsSemaphoreHeader>() == 8);
+
+const SEMA_PAGE_MAGIC_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, magic);
+const SEMA_PAGE_PAYLOAD_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, payload);
+
+const SCRUB_REQUEST_SIZE: u64 = 4 * 1024 * 1024 * 1024;
+
+/// OpenRM uses a platform-dependent GPU timeout. Nova instead applies a fixed
+/// five-second host policy so that teardown cannot block a VFIO close forever;
+/// this is not a firmware ABI value.
+const SCRUB_TIMEOUT: Delta = Delta::from_secs(5);
+
+const MAGIC_HEAD: u32 = 0xdead_beef;
+const MAGIC_TAIL: u32 = 0xcafe_babe;
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+struct AllocCeutilsRequest {
+    gfid: u32,
+    fixed_chid: u32,
+    force_ceid: u32,
+    swizz_id: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsRequest>() == 16);
+
+#[repr(C)]
+#[derive(FromBytes)]
+struct AllocCeutilsResponse {
+    semaphore_address: u64,
+    semaphore_aperture: u32,
+    _reserved: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsResponse>() == 16);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+struct FreeCeutilsRequest {
+    gfid: u32,
+}
+
+static_assert!(size_of::<FreeCeutilsRequest>() == 4);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+struct ScrubGuestFbRequest {
+    gfid: u32,
+    reserved: u32,
+    fb_offset: u64,
+    fb_size: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbRequest>() == 24);
+
+#[repr(C)]
+#[derive(FromBytes)]
+struct ScrubGuestFbResponse {
+    work_id: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbResponse>() == 8);
+
+/// A firmware-owned per-VM CeUtils allocation.
+///
+/// The owner must call [`Self::release`] before returning its CHID or VRAM to
+/// their allocators.
+pub(crate) struct CeUtils {
+    gfid: Gfid,
+    chid: u32,
+    semaphore_address: u64,
+}
+
+/// Whether a failed allocation may still have transferred CHID ownership to firmware.
+pub(crate) enum CeUtilsAllocError {
+    /// A matching firmware response explicitly rejected the allocation.
+    NotOwned(Error),
+    /// The request may have completed despite a transport or response-validation error.
+    MayOwn(Error),
+}
+
+impl CeUtils {
+    /// Allocate a CeUtils channel and validate its semaphore description.
+    pub(crate) fn allocate(
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        gfid: Gfid,
+        chid: u32,
+        swizz_id: u32,
+    ) -> core::result::Result<Self, CeUtilsAllocError> {
+        let request = AllocCeutilsRequest {
+            gfid: gfid.0.to_le(),
+            fixed_chid: chid.to_le(),
+            force_ceid: u32::MAX.to_le(),
+            swizz_id: swizz_id.to_le(),
+        };
+
+        dev_dbg!(
+            dev,
+            "alloc CeUtils: gfid={} chid={} swizz_id={}\n",
+            gfid.0,
+            chid,
+            swizz_id,
+        );
+
+        let response = cmdq
+            .send_gmc_and_receive(
+                bar,
+                gmc::ALLOC_GSP_CEUTILS,
+                <AllocCeutilsRequest as IntoBytes>::as_bytes(&request),
+                num::usize_into_u32::<{ size_of::<AllocCeutilsResponse>() }>(),
+            )
+            .map_err(CeUtilsAllocError::MayOwn)?;
+        if response.status != 0 {
+            return Err(CeUtilsAllocError::NotOwned(EIO));
+        }
+
+        (|| {
+            let bytes = response
+                .payload
+                .get(..size_of::<AllocCeutilsResponse>())
+                .ok_or(EMSGSIZE)?;
+            let response = AllocCeutilsResponse::read_from_bytes(bytes).map_err(|_| EINVAL)?;
+            let semaphore_address = u64::from_le(response.semaphore_address);
+            let semaphore_aperture = u32::from_le(response.semaphore_aperture);
+            let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
+
+            if semaphore_address == 0
+                || !semaphore_address.is_multiple_of(page_size)
+                || semaphore_aperture != bindings::NV_ADDR_FBMEM
+            {
+                return Err(EINVAL);
+            }
+
+            dev_dbg!(
+                dev,
+                "alloc CeUtils: gfid={} semaphore={:#x}\n",
+                gfid.0,
+                semaphore_address,
+            );
+            Ok(Self {
+                gfid,
+                chid,
+                semaphore_address,
+            })
+        })()
+        .map_err(CeUtilsAllocError::MayOwn)
+    }
+
+    /// Scrub the complete guest framebuffer and verify its boundary markers.
+    pub(crate) fn scrub_guest_fb<'gpu>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        fb: &VramRegion,
+    ) -> Result {
+        write_markers(bar_user, mm, dev, fb)?;
+
+        let mut offset = fb.address();
+        let end = offset.checked_add(fb.size()).ok_or(EOVERFLOW)?;
+        while offset < end {
+            let size = core::cmp::min(SCRUB_REQUEST_SIZE, end - offset);
+            let work_id = submit_scrub(dev, cmdq, bar, self.gfid, offset, size)?;
+            wait_scrub_complete(bar_user, mm, dev, self.semaphore_address, work_id)?;
+            offset = offset.checked_add(size).ok_or(EOVERFLOW)?;
+        }
+
+        verify_markers_zeroed(bar_user, mm, dev, fb)
+    }
+
+    /// Request release of the firmware allocation.
+    ///
+    /// Firmware treats this operation as idempotent, but the GMC transaction
+    /// can fail after firmware has acted. An error therefore means that release
+    /// was not confirmed, and the caller must not return the CHID for reuse.
+    pub(crate) fn release(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+    ) -> Result {
+        dev_dbg!(
+            dev,
+            "free CeUtils: gfid={} chid={}\n",
+            self.gfid.0,
+            self.chid,
+        );
+        Self::release_gfid(dev, cmdq, bar, self.gfid)
+    }
+
+    /// Attempt an idempotent release when allocation ownership is uncertain.
+    pub(crate) fn release_gfid(
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        gfid: Gfid,
+    ) -> Result {
+        let request = FreeCeutilsRequest {
+            gfid: gfid.0.to_le(),
+        };
+
+        dev_dbg!(dev, "free CeUtils: gfid={}\n", gfid.0);
+        cmdq.send_gmc_and_check_status(
+            bar,
+            gmc::FREE_GSP_CEUTILS,
+            <FreeCeutilsRequest as IntoBytes>::as_bytes(&request),
+        )
+    }
+}
+
+/// Submit an asynchronous guest FB scrub and return its work identifier.
+fn submit_scrub(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    gfid: Gfid,
+    fb_offset: u64,
+    fb_size: u64,
+) -> Result<u32> {
+    let request = ScrubGuestFbRequest {
+        gfid: gfid.0.to_le(),
+        reserved: 0,
+        fb_offset: fb_offset.to_le(),
+        fb_size: fb_size.to_le(),
+    };
+
+    dev_dbg!(
+        dev,
+        "submit scrub: gfid={} offset={:#x} size={:#x}\n",
+        gfid.0,
+        fb_offset,
+        fb_size,
+    );
+
+    let response = cmdq.send_gmc_and_receive(
+        bar,
+        gmc::SCRUB_GUEST_FB,
+        <ScrubGuestFbRequest as IntoBytes>::as_bytes(&request),
+        num::usize_into_u32::<{ size_of::<ScrubGuestFbResponse>() }>(),
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+
+    let bytes = response
+        .payload
+        .get(..size_of::<ScrubGuestFbResponse>())
+        .ok_or(EMSGSIZE)?;
+    let response = ScrubGuestFbResponse::read_from_bytes(bytes).map_err(|_| EINVAL)?;
+    let work_id = u32::try_from(u64::from_le(response.work_id)).map_err(|_| EOVERFLOW)?;
+    if work_id == 0 {
+        return Err(EIO);
+    }
+
+    Ok(work_id)
+}
+
+/// Poll the GSP-owned CeUtils semaphore page through a temporary BAR1 map.
+fn wait_scrub_complete<'gpu>(
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    dev: &device::Device<device::Bound>,
+    semaphore_address: u64,
+    work_id: u32,
+) -> Result {
+    let pfn = Pfn::from(VramAddress::from_raw(semaphore_address));
+    let semaphore_map = bar_user.map(mm, &[pfn], false)?;
+
+    let result = (|| {
+        let magic = semaphore_map.try_read32(SEMA_PAGE_MAGIC_OFFSET)?;
+        if magic != NV_CEUTILS_SEMA_PAGE_MAGIC {
+            dev_warn!(
+                dev,
+                "bad CeUtils semaphore magic {:#x}, expected {:#x}\n",
+                magic,
+                NV_CEUTILS_SEMA_PAGE_MAGIC,
+            );
+            return Err(EIO);
+        }
+
+        let start = Instant::<Monotonic>::now();
+        loop {
+            let value = semaphore_map.try_read32(SEMA_PAGE_PAYLOAD_OFFSET)?;
+            if value.wrapping_sub(work_id) < 0x8000_0000 {
+                dev_dbg!(
+                    dev,
+                    "scrub completed after {:?}: semaphore={:#x}, target={:#x}\n",
+                    start.elapsed(),
+                    value,
+                    work_id,
+                );
+                return Ok(());
+            }
+
+            if start.elapsed() >= SCRUB_TIMEOUT {
+                dev_warn!(
+                    dev,
+                    "scrub timed out: semaphore={:#x}, target={:#x}\n",
+                    value,
+                    work_id,
+                );
+                return Err(ETIMEDOUT);
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    })();
+
+    let cleanup = semaphore_map.release(mm);
+    match result {
+        Ok(()) => cleanup,
+        Err(error) => {
+            if let Err(cleanup_error) = cleanup {
+                dev_err!(
+                    dev,
+                    "failed to release semaphore BAR1 mapping after error {:?}: {:?}\n",
+                    error,
+                    cleanup_error,
+                );
+            }
+            Err(error)
+        }
+    }
+}
+
+fn with_bar1_map<'gpu, T>(
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    dev: &device::Device<device::Bound>,
+    region: VramRegion,
+    writable: bool,
+    operation: impl FnOnce(&Bar1Map<'gpu>) -> Result<T>,
+) -> Result<T> {
+    let map = Bar1Map::new(bar_user, mm, region, writable)?;
+    let result = operation(&map);
+    let cleanup = map.destroy(bar_user, mm);
+
+    match result {
+        Ok(value) => {
+            cleanup?;
+            Ok(value)
+        }
+        Err(error) => {
+            if let Err(cleanup_error) = cleanup {
+                dev_err!(
+                    dev,
+                    "failed to release temporary BAR1 mapping after error {:?}: {:?}\n",
+                    error,
+                    cleanup_error,
+                );
+            }
+            Err(error)
+        }
+    }
+}
+
+fn marker_regions(fb: &VramRegion) -> Result<(VramRegion, VramRegion, usize)> {
+    let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
+    let tail_page = fb.size().checked_sub(page_size).ok_or(EINVAL)?;
+    let tail_offset = PAGE_SIZE.checked_sub(size_of::<u32>()).ok_or(EOVERFLOW)?;
+
+    Ok((
+        fb.subregion(0..page_size)?,
+        fb.subregion(tail_page..fb.size())?,
+        tail_offset,
+    ))
+}
+
+/// Write and read back markers at the first and last framebuffer dwords.
+fn write_markers<'gpu>(
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    dev: &device::Device<device::Bound>,
+    fb: &VramRegion,
+) -> Result {
+    let (head_region, tail_region, tail_offset) = marker_regions(fb)?;
+
+    with_bar1_map(bar_user, mm, dev, head_region, true, |map| {
+        map.try_write32(MAGIC_HEAD, 0)?;
+        if map.try_read32(0)? != MAGIC_HEAD {
+            return Err(EIO);
+        }
+        Ok(())
+    })?;
+
+    with_bar1_map(bar_user, mm, dev, tail_region, true, |map| {
+        map.try_write32(MAGIC_TAIL, tail_offset)?;
+        if map.try_read32(tail_offset)? != MAGIC_TAIL {
+            return Err(EIO);
+        }
+        Ok(())
+    })
+}
+
+/// Verify that the first and last framebuffer dwords were zeroed.
+fn verify_markers_zeroed<'gpu>(
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    dev: &device::Device<device::Bound>,
+    fb: &VramRegion,
+) -> Result {
+    let (head_region, tail_region, tail_offset) = marker_regions(fb)?;
+    let head = with_bar1_map(bar_user, mm, dev, head_region, false, |map| {
+        map.try_read32(0)
+    })?;
+    let tail = with_bar1_map(bar_user, mm, dev, tail_region, false, |map| {
+        map.try_read32(tail_offset)
+    })?;
+
+    dev_dbg!(
+        dev,
+        "scrub markers: head={:#010x}, tail={:#010x}\n",
+        head,
+        tail,
+    );
+    if head != 0 || tail != 0 {
+        return Err(EIO);
+    }
+
+    Ok(())
+}
-- 
2.53.0

