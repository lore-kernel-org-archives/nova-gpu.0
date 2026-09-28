Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47B49B474
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591569; cv=fail; b=abK+X93QJ3t2O1EEvtXRUBpPC0guuzlijNtsidovaXPuBzK5nh7e76+PjUXdsS88QSb22fnn2mHBURu1+ocTT5WLeE9biI1Pxlmz7UMPb/rmAgpAB2w89m9w9YD0EpbrfwHZ1uGYbX0F2MJY76aCzyKJRKfJMaUPRwTzGvgvjKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591569; c=relaxed/simple;
	bh=p0WrMkbyOGMkXZZKtW9ax81iFvd8c5aPaKL3fpXayDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8/1SSdK95slSCG4YoxLGZCMSWxZsO1fYG/q7tYTW4bLburMe7+qdMnssk4HnVQbxZTsJ2BD2k8fDfgsDqgHRAyM66JcWicQZ7makRUZFAKZ7bk5pvZNWFeml/Rz55JDV4UigKydL+N3pqdG4e+xeq+gsNZNBNdmY2pE2HNgdwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAtoa/iS; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAtoa/iS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2zdyeVk+cSQ8EPzIDNGAf2tzAeFJFcvWBYedMqBwNFv09Sqwt6snq7V3BJv2JQTbmH/yb4A7HzWe6JbyvRdFO+jw4LNxXJBkuXilSl9zqughYhq+eGLXRP301m1bL4gH2ov/vaAlXb8nfTirRaW0tb/puJyQHD0ox6Byc0M9pXnV+0MhlUCAfAJndzZ4MEMFYLNYaa0g7/ZDYfgVPLqK1i2hM31ZcxVbh9aOGtzkYjQaztUUL/9dU5uKcpQ91PAlVlQaRXGw7dvR12PbK098SVphdktaU9GVP55rwW6D3HbTh7UNKzCkyd9zy6JsOOtDWlpP/Hsq0xEzYQgsT+vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtY6vV2LfHFSK2Qq7Hx4rwmyJ9//3uoJkTQf+6XV5QA=;
 b=QKW0BgFueoLwWEmKI40Uf9p2e1QcOERKIN4hD2NdYXWZw8XzCFdxs/YVTG0wJ1+Kmnwie7JkvcNQkfLpX51YuFImWxhKUO9vCLmLS7NHXJvoSiuL8Gpmj0kPowkdp5MG5OazXVRD5/d5FbdS9mz5GjHWmxihjNMdEYdi41BchNH/aZRFd6zjbz73QLoosoSyfDVUKIkiECNH+tCGfftgqeqZQM3cl1OsHWEsHNcumOZx6ebeMbUl8UniBERbF7XnZVNpnjwTJ8809+v+it9//fzlibRFLw9ZkimcS282lmh6I8JWxKAf4gifZngDT8sp3Wzy00NY7JD6+iHpmbwRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtY6vV2LfHFSK2Qq7Hx4rwmyJ9//3uoJkTQf+6XV5QA=;
 b=RAtoa/iS38A6UQusjLGR/ErosWmMswQPm2PAZJ8e7b7uldG6fZACtdq7wFQVnAAnkWjeU5z2Ne+GfNmQ2yYF5U4Tm5jhhuNPg2/E3gSe/mgTUYpp0ogBDxywRthMiqI2piwt9j7POye16b++fQEUHj3WfJMOckqXn1eUOIjFvCvUPoZu4NwH9WNH2qLXMii0oAmVp/70GOhgHMLnVir9wLnuGYYH5xs0t8KpEVOgbxLK4oS6F4coG35prHvAreFOnhzAVrt/RMg/BEontAbOqa4T+pFMwuvUQVKCK6wXtRpuTPP4NY7zeI7BOZbnbrwoOR8lb1h0kmNcc1A3i3HSgw==
Received: from SJ0PR05CA0176.namprd05.prod.outlook.com (2603:10b6:a03:339::31)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:32:38 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::5e) by SJ0PR05CA0176.outlook.office365.com
 (2603:10b6:a03:339::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Mon, 28
 Sep 2026 10:32:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:16 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:16 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:08 -0700
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
Subject: [PATCH v3 24/31] gpu: nova-core: vgpu: add GSP plugin RPC transactions
Date: Mon, 28 Sep 2026 13:28:27 +0300
Message-ID: <2120238cd478ecdbaa83c96a15bd0d3732d5e877.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae45cc7-1cb5-4211-36df-08df1d4bd0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|10067099003|3023799007|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bfh9o9YTx+nSMsX2MkbdV0wa7KEs0es0X8wPk+cjUilgaoo31MD5wRiQwf2dUfXqACkwY0J13Dv0QyzbpMIuHnWT0ugAFLmbzpWqo0T4mHiacwtv6gEYq8bi/C4FS2FTPYeoDOJNNFCI87GHTPgkisSHmmx9b3/DSJa8mAemud5P/J+m3Pl7zHbcrdADDXlbEiwrE6wR22FH9+8NW2PrH6XGpilxFYmPgHPXZBSE3t5os8ddqDRQaQOuDnACv5QlLZZucxdh3NIA6aY3pC4kPM8wUV44XVTpQR/x1e8wM6f4D1fVG35/XWKVfLPyXY8AKE6AMMx3vVGgfDOrZJB+pNPWLJ/C53Qm3c7BOZd+0AwHwM3fMKCnOthH+GjZvc/Ny6+zZ6FnW372mAFJWRFx9aejuI55vycogaRTL4EykZ8rSKz75/5/FkeLoJAJ8F2Nl+1VKwgEf/1/c9q3Q56B+YRco/UPPyGbdXgcspVzltTBrSZzYGlHgqmAEQIPuwxDhek9jvMzSlubkMFXzWs0rsmf3rnZDSd4yUgmuXkVPxqV3StQwVF/6CvSgdl2cKD1ORwP+mlFgDuHUQF/xKzHxM6sw/TO7P/tjsnYFnBnidhAUArQ1145IL5dhqu7/6q8fTseFP4IH0v3TPXnnInIn/tJ/rSgqZm5EpcW4vBuNCAP+659GhD4hpnIWvvfAE1t6UGahubDE5IrVzJxAI10Tw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(3023799007)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	56Iqm0ThNRabFoWRUC3tjarvrNXRoyjGvnXm/qHnZXtElbP3XUB0iqsoXW0+5j+UrTwZpSLRWQm5vbot2Y2N5UMUYRJ16RLl8XrlEKl9zYi1bj+tT++XPDPt5m3wFCdBnnUM/4g2xR6TQ6x4ms9GoEe1qedK6P20rwW4EPasqUE1aYZV9kcHJUdP7e+IpMAewwuW6/qnKYMPXzI0gZKcWVg1WXdfNPz3iJ8JuDiplRt7IPX9GUCLmglmMK5uEfFFG1/QXh68Y9QLk8xOdnYe97XOLG3DF5qJ6pAnRToWbay6DX6087N6hZMf4s1gJSBVArEbQkNYi0Mw6G0dOPyKCnqcUZHXBHYl7Wc0ehs3p71DI+WUIeKQKsI5IfvaTiUhT/Jw2Q9fP7aHCJ6ahupxIEF7pjp/oB9ewsdWbX2b4gM/6YDn0x1seyRxcUgu8xco
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:37.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae45cc7-1cb5-4211-36df-08df1d4bd0ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252

A GSP plugin consumes a shared-buffer request after its VF doorbell is
rung and publishes completion in the response region.

Add PluginRpc to own the communication mapping together with the
instance's stable BAR0 and validated GFID. Accept typed RPC message IDs,
copy the payload before publishing its sequence, advance the local
sequence, ring and read back the doorbell, then wait for a matching
completion and check its firmware status.

Keep one sequence identity for each published request, including a
request whose doorbell or wait later fails, and bound completion polling
with the RPC timeout. Delegate explicit unmap to the owned communication
region so teardown errors retain its owner; ordinary drop releases the
mapping through BarMapping.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs                 |  31 +++-
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/fw.rs              |  13 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |  10 ++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |  51 +++++-
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs  | 155 ++++++++++++++++++
 drivers/gpu/nova-core/vgpu/instance.rs        |  15 +-
 7 files changed, 267 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ec8e05dc3351..cadaa3495b4e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,13 +7,17 @@
         Io,
         Mmio, //
     },
+    prelude::*,
     sizes::SizeConstants,
     time, //
 };
 use pin_init::Zeroable;
 
 use crate::{
-    driver::NovaRegisters,
+    driver::{
+        Bar0,
+        NovaRegisters, //
+    },
     falcon::{
         DmaTrfCmdSize,
         FalconCoreRev,
@@ -39,6 +43,31 @@
     pub(crate) NV_PBUS_SW_SCRATCH(u32)[64] @ 0x00001400 {}
 }
 
+// VIRTUAL_FUNCTION
+
+register! {
+    base: NovaRegisters;
+
+    // PF BAR0 exposes the virtual-function register window at 0x00b8_0000.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_DOORBELL(u32) @ 0x00b8_2200 {
+        31:0 handle;
+    }
+}
+
+impl NV_VIRTUAL_FUNCTION_PRIV_DOORBELL {
+    const DOORBELL_STRIDE: u32 = 32;
+    const DOORBELL_VECTOR: u32 = 17;
+
+    /// Notify the GSP plugin for the given guest function and read back the doorbell.
+    pub(crate) fn ring_gsp_plugin(bar0: Bar0<'_>, gfid: u16) -> Result {
+        // A `u16` GFID produces a handle of at most 0x1f_fff1, which fits in `u32`.
+        let value = u32::from(gfid) * Self::DOORBELL_STRIDE + Self::DOORBELL_VECTOR;
+        bar0.try_write_reg(Self::zeroed().with_handle(value))?;
+        bar0.try_read(NV_VIRTUAL_FUNCTION_PRIV_DOORBELL)?;
+        Ok(())
+    }
+}
+
 // PGC6 register space.
 //
 // `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index f7184e7009a5..d6bcdabafb42 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -35,6 +35,7 @@
 mod commands;
 mod fw;
 mod gsp_plugin_comm;
+mod gsp_plugin_rpc;
 mod hal;
 mod instance;
 mod vram;
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 03225b9833c3..d80f36465296 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -10,6 +10,8 @@
 
 use crate::gsp::bindings;
 
+pub(super) use commands::RpcMessage;
+
 pub(super) use bindings::{
     GSP_PLUGIN_BOOTLOADED,
     VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
@@ -44,3 +46,14 @@
 
 pub(super) const GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
+
+/// State observed in the response buffer for an expected RPC sequence.
+pub(super) enum RpcResponse {
+    Pending {
+        /// Last sequence completed by firmware.
+        sequence: u32,
+    },
+    Complete {
+        status: u32,
+    },
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index bf8d44819e13..91d43cf6dd85 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -28,6 +28,16 @@
     mm::vram::VramRegion, //
 };
 
+use super::bindings;
+
+/// Message types supported by the nova-core plugin RPC channel.
+#[expect(dead_code)]
+#[derive(Clone, Copy)]
+#[repr(u32)]
+pub(crate) enum RpcMessage {
+    VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+}
+
 bitfield! {
     pub(crate) struct Dbdf(u32) {
         2:0 function;
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index 31da31de4fd2..3d2c69e8cd79 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -21,7 +21,9 @@
 use super::fw::{
     self,
     RawControlRegion,
-    RawResponseRegion, //
+    RawResponseRegion,
+    RpcMessage,
+    RpcResponse, //
 };
 
 static_assert!(
@@ -240,7 +242,6 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
     }
 
     /// Initialize the shared control and response buffers for plugin RPC.
-    #[expect(dead_code)]
     pub(super) fn initialize(&self) -> Result {
         self.write_u64(
             &self.control,
@@ -338,6 +339,52 @@ pub(super) fn initialize(&self) -> Result {
         )
     }
 
+    /// Copy and publish one RPC request to firmware.
+    pub(super) fn submit(&self, message: RpcMessage, sequence: u32, data: &[u8]) -> Result {
+        if u64::try_from(data.len()).map_err(|_| EOVERFLOW)? > self.message.size() {
+            return Err(E2BIG);
+        }
+
+        for (index, chunk) in data.chunks(size_of::<u32>()).enumerate() {
+            let mut bytes = [0u8; size_of::<u32>()];
+            bytes[..chunk.len()].copy_from_slice(chunk);
+            let field = index.checked_mul(size_of::<u32>()).ok_or(EOVERFLOW)?;
+            self.write_u32(&self.message, field, u32::from_le_bytes(bytes))?;
+        }
+
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
+            // CAST: `RpcMessage` has a `u32` representation.
+            message as u32,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            sequence,
+        )
+    }
+
+    /// Read firmware's response for an expected RPC sequence.
+    pub(super) fn response(&self, expected_sequence: u32) -> Result<RpcResponse> {
+        let sequence = self.read_u32(
+            &self.response,
+            core::mem::offset_of!(
+                RawResponseRegion,
+                __bindgen_anon_1.message_seq_num_processed
+            ),
+        )?;
+        if sequence != expected_sequence {
+            return Ok(RpcResponse::Pending { sequence });
+        }
+
+        let status = self.read_u32(
+            &self.response,
+            core::mem::offset_of!(RawResponseRegion, __bindgen_anon_1.result_code),
+        )?;
+        Ok(RpcResponse::Complete { status })
+    }
+
     /// Invalidate the PTEs and release the communication mapping.
     pub(super) fn unmap(&mut self) -> Result {
         self.map.unmap()
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
new file mode 100644
index 000000000000..0ee32f011f63
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin RPC.
+//!
+//! ```text
+//! Host (PluginRpc)       Shared RPC buffer (VRAM)       GSP plugin
+//!       |                           |                       |
+//!       |-- BAR1: payload --------->| Message               |
+//!       |-- BAR1: type, sequence -->| Control               |
+//!       |                           |                       |
+//!       |-- BAR0: VF doorbell ----------------------------->|
+//!       |                           |<-- read request ------|
+//!       |                           |                       | process RPC
+//!       |                           |<-- completion --------|
+//!       |-- poll processed seq ---->| Response              |
+//!       |<-- matching seq, status --|                       |
+//! ```
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
+    regs::NV_VIRTUAL_FUNCTION_PRIV_DOORBELL, //
+};
+
+use super::{
+    fw::{
+        RpcMessage,
+        RpcResponse, //
+    },
+    gsp_plugin_comm::CommBufferRegion,
+    instance::Gfid, //
+};
+
+/// BAR1-backed channel used to communicate with one GSP plugin.
+pub(super) struct PluginRpc<'map, 'gpu> {
+    comm: CommBufferRegion<'map, 'gpu>,
+    bar0: Bar0<'gpu>,
+    gfid: Gfid,
+    message_sequence: u32,
+}
+
+impl<'map, 'gpu> PluginRpc<'map, 'gpu> {
+    pub(super) fn new(comm: CommBufferRegion<'map, 'gpu>, bar0: Bar0<'gpu>, gfid: Gfid) -> Self {
+        Self {
+            comm,
+            bar0,
+            gfid,
+            message_sequence: 0,
+        }
+    }
+
+    pub(super) fn comm(&self) -> &CommBufferRegion<'map, 'gpu> {
+        &self.comm
+    }
+
+    /// Initialize the control and response buffers for the first RPC.
+    #[expect(dead_code)]
+    pub(super) fn init_rpc(&mut self) -> Result {
+        self.comm.initialize()?;
+        self.message_sequence = 0;
+        Ok(())
+    }
+
+    fn next_sequence(&self) -> u32 {
+        let sequence = self.message_sequence.wrapping_add(1);
+        if sequence == 0 {
+            1
+        } else {
+            sequence
+        }
+    }
+
+    /// Write one RPC message, ring the VF doorbell, and wait for its response.
+    #[expect(dead_code)]
+    pub(super) fn rpc_call(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        message_type: RpcMessage,
+        data: &[u8],
+    ) -> Result {
+        let sequence = self.next_sequence();
+        self.comm.submit(message_type, sequence, data)?;
+        self.message_sequence = sequence;
+
+        dev_dbg!(
+            dev,
+            "vGPU RPC: gfid={} type={} bytes={} sequence={}\n",
+            self.gfid.get(),
+            // CAST: `RpcMessage` has a `u32` representation.
+            message_type as u32,
+            data.len(),
+            sequence,
+        );
+
+        NV_VIRTUAL_FUNCTION_PRIV_DOORBELL::ring_gsp_plugin(self.bar0, self.gfid.get())?;
+        self.wait_response(dev, sequence)
+    }
+
+    fn wait_response(&self, dev: &device::Device<device::Bound>, expected_sequence: u32) -> Result {
+        let start = Instant::<Monotonic>::now();
+        let timeout = Delta::from_secs(120);
+
+        loop {
+            match self.comm.response(expected_sequence)? {
+                RpcResponse::Complete { status } => {
+                    if status != 0 {
+                        dev_dbg!(
+                            dev,
+                            "vGPU RPC: sequence {} failed with status {}\n",
+                            expected_sequence,
+                            status,
+                        );
+                        return Err(EIO);
+                    }
+
+                    dev_dbg!(
+                        dev,
+                        "vGPU RPC: sequence {} completed after {:?}\n",
+                        expected_sequence,
+                        start.elapsed(),
+                    );
+                    return Ok(());
+                }
+                RpcResponse::Pending { sequence } => {
+                    if start.elapsed() >= timeout {
+                        dev_dbg!(
+                            dev,
+                            "vGPU RPC: sequence {} timed out; last response was {}\n",
+                            expected_sequence,
+                            sequence,
+                        );
+                        return Err(ETIMEDOUT);
+                    }
+                }
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    }
+
+    /// Release the BAR1 mapping.
+    pub(super) fn unmap(&mut self) -> Result {
+        self.comm.unmap()
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index bf02595590e1..8a2d8e3970a3 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -20,6 +20,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gpu::ChannelIdReservation,
     gsp::{
         cmdq::Cmdq,
@@ -41,6 +42,7 @@
         ChannelMapEntry, //
     },
     gsp_plugin_comm::CommBufferRegion,
+    gsp_plugin_rpc::PluginRpc,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -141,7 +143,7 @@ struct VgpuInstance<'gpu> {
     vgpu_type: VgpuType,
     vm_pid: u32,
     num_plugin_channels: u32,
-    comm: CommBufferRegion<'gpu, 'gpu>,
+    plugin_rpc: PluginRpc<'gpu, 'gpu>,
     // Unmap the communication region before returning its slot and channel IDs.
     vram_slot: VgpuVramSlot,
     chids: ChannelIdReservation<'gpu>,
@@ -170,7 +172,7 @@ fn teardown(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
                 send_cleanup(vgpu.dev, vgpu.cmdq, self.gfid)?;
                 self.needs_teardown = false;
             }
-            self.comm.unmap()
+            self.plugin_rpc.unmap()
         })();
         if let Err(error) = result {
             self.failure = Some(error);
@@ -187,7 +189,7 @@ fn bootload(
     ) -> Result {
         let fb = &self.vram_slot.fbmem;
         let mgmt = &self.vram_slot.mgmt_heap;
-        let logs = self.comm.plugin_logs();
+        let logs = self.plugin_rpc.comm().plugin_logs();
 
         let payload = encode_vgpu_bootload(BootloadInfo {
             dbdf: self.dbdf,
@@ -215,11 +217,11 @@ fn bootload(
             payload.len() * size_of::<u64>(),
         );
 
-        self.comm.clear_plugin_ready()?;
+        self.plugin_rpc.comm().clear_plugin_ready()?;
         self.needs_teardown = true;
         send_bootload(dev, cmdq, &payload)?;
 
-        wait_plugin_ready(dev, &self.comm)?;
+        wait_plugin_ready(dev, self.plugin_rpc.comm())?;
 
         dev_dbg!(dev, "bootload: gfid={} plugin ready\n", self.gfid.get());
         Ok(())
@@ -293,6 +295,7 @@ fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<
     fn allocate_instance<'a>(
         &'a mut self,
         vgpu: &'a VgpuManager<'gpu>,
+        bar0: Bar0<'gpu>,
         info: InstanceInfo,
     ) -> Result<PendingInstance<'a, 'gpu>> {
         let InstanceInfo {
@@ -351,7 +354,7 @@ fn allocate_instance<'a>(
             vgpu_type,
             vm_pid,
             num_plugin_channels: PLUGIN_CHANNELS_PER_ENGINE,
-            comm,
+            plugin_rpc: PluginRpc::new(comm, bar0, gfid),
             vram_slot,
             chids,
             needs_teardown: false,
