Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074849BD8F
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591626; cv=fail; b=jB09e+0+7KLagpY6BQe6iXWWE0ezpM87X6XngBGAT/ryc3nl0yTCIFiXEsSsi1xyhe3aw7oUw+Gi/9LPSDkkThNB3ZhM24sBemtMCryzlnU0Ho/qPUH4n4PXlw9wyMiD7sb/vJ7ibBMLDZXuEuoZ7i8Zue3X3v/1PXTyIeFwrdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591626; c=relaxed/simple;
	bh=VM+T4Fj25NU0hVp672KDkUCuFRavVW0nlQyMMEPV738=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9w/yeGm+UUWK7FmIHyVTejMFdS1dAL3yURtRVdl40Dirbzm/4B+XtJlhgD1A+if0W76d78pfKO3CE2z5YgKcE9lbgTSS6D2ATaFaOTDRHEN84UN1CkrxjvM87vXbIzTxvpdUjfVbiGxE8jstl9VgxCHnQF9dBbRD0mJqzy5iAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dC909rpP; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dC909rpP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bj4T8WOeJ6h5TgEY02kPKJDYM844glWRMJ2YMot7eehPE+kbvf/Z6DTiQoZQWd6MI2HTSfLkz3U9eGbhpN/SWApeG1Oa+SxKJQV9UWci8bjjV7NKHE0L3Pfq2Jk0rc/Si3eywemM8FoB+cpo8RWSXcN7PTfMY4Rhie7P34/nJwjHd/7PBsJeA8Zic2BnomRIlSG8Q/++F9plbwOOpb2qShiNF/2ZhqkXwPBlPpTGOEVj3RX+IyZyeCwF6gVHSJ9qZao3GjazRXJ30KkA07WBRGbq/lROcikeELVhnrAZLoBrz1CvrXTqCj1uXTOWspct2cVqHH4qylrs4c8AqgKqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2y6GwC3DmVEbKUHmhmLOfjDZO5kLYmLYxliBJY0bCI=;
 b=IXy58Cwf6SnvGMfLQ/Txn5oiBr/qfZ+ORRLFXGFDHMqjcOMnwM/H9WVawt2V3Vs+q2NoNO8mbuf4NwawjUJy2KfI2Jq+bUmJTUzsbN6WOQ2gyE1L4SjUwIjCwuIAlOryb5ZXQ+5KymSaxzDCQ36e5u9K6T9FzuVpDsVn851zeROH3F0tSJbHF5PnHQe/fR0JkHxXRZPwo2WR7HA1uXHKmK5+KYQGXt/5r1tN4uLHa2BDAzJ/Or3+VuZKSADxsVfP+prYKMSeALdcDgCkhZXPX+Kg5+Nid1xCwPEoyr8eUbmJQgUmvZkuRSgfcj/Uy95rHOXd3S7pzy4G7csNiM5MXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2y6GwC3DmVEbKUHmhmLOfjDZO5kLYmLYxliBJY0bCI=;
 b=dC909rpPFLw51X4uWjXrXpFJG3m/1F87Pfywd6Rcm+AKtpfsrMqvnJoLJMZPQlenFDjqM7VYYgOyMR0mbrkzq0dXXC0P78DKCqkESKHBO0f/p553hzrNinfeetH3yFf7VxvGKqzOvTUXUN0kChi6m0OfcdcpVvcdNymAkJkS1AzQJbb3pclbBrqXCpO0BoTz6A0kLDSNHjY6uStqEMp1UpY/9D7PApFV268q0qPu5tVi50zlROxRfyQHu6JXlWo/Xd5eTzKP0erXuOSVMcyBi1lOj6TpeVejQl3S3POaHONYc4W0kd4nMblhn0KdnyoAsNV28P7+6xMtACenHELLDQ==
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:33:35 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::4c) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:33:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:33:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:33:18 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:33:17 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:33:09 -0700
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
Subject: [PATCH v3 31/31] gpu: nova-core: vgpu: introduce SR-IOV PF APIs
Date: Mon, 28 Sep 2026 13:28:34 +0300
Message-ID: <c9b16903302a1ddbe3ef4a2800a34d449d2ad8f8.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac6bd8f-4bec-4bfb-9722-08df1d4bf2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|7416014|376014|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a0H7SSxs1BextxUdPhSrWa9/9UFO+ayuTpdKovz6rU+765SO8jsVdTGktXXvt0jrITKTRXQqzBzOtPf2NhE27zGvY93DbSrp9TCMtDH+r2toc6mXRDoNHQyFJChOpTPZGO0uEOA0kA9P0tTSuVLlylSGdHLRKeMFz039S9gm26IvFGU4yug6eo/gn6qmWkCeOsGanwaUod9xMVAj9AEwAm0DzKohlybL10jhj5nrZhMS0WlQOzQ7NcdA0sxRRW2NDmLoPYdvnaZIq9e/ldBrhmtbFgohcJ9GSGfdOm1Eo21s42AY/J9nRW8pYu3D4haATa2t0WUodznJyxq+u0KiSCcTBTttrHJ2rZdxAlHlLhgtD29WRCCQz9Uq4F315A8kBOAjb6Ic3cQOuxbqDZn64ZVcsskgyYEjiSvTHmtxhHksyt4y5VcHOx/EdzhVI9nvKunAeNy1eZk6cLCClLFShAm1345DJUhXJ1HLTY5+Etn/eeOi5vAndgWJniTFxwd3rTapuv1DSE44FZNZILTtY4BPiz2yYup1OhcQL04YYgoq3t6OQmaetUe5aaujl0cSVnGua2tKjc2SXJjeyeOsIEwhc4KhyweMfgE9bkBlSMvcjZXkCictngO+2gcYgqi/HlfpUZw+7DCf5UXeyfSQnvoZnoLqGIvHfaNsT4CuYxnyvfkD9Vo7q+v2bMZ7hwPsygnw42Dldc/7/XZMa6HzuA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IwvOh788CYyodwBNTMKyNYyargTjNqOdsy9Mb+eQGQf27NEU+INB7bK/2HiXQj7HInA66iqXphsDEwHn0Z/huv/zP2x5FelK4c6lYpemEftDlPPmEktJ/jkxUaSpACBiMv4YmaRrfYJitOufv5Z6QNdbFTG1pZ+J7KcUAoPhY+DcXa4X/hFxBSWAXOC5vMAa9acmn+mVdZmZIrXI67fRPj0sJZ/D2vN6/W5Yd4RKy0bXopr69OyFQCyK5cc1j5XJ6iVY83fbbFZsXLj+76XXZMk9Cggj1DqMmUzgWm1F9Ei/h875dk4lkI3QrGQBaQTepv1ClA7KytUNDL1/aTcHAteCDY4fofzhmJayc8vu3LtaCynag3uo1PFHOA5WEnP3ETTDPzGHnSp0zRyJKovzI9Gj3y9oCAfo6NNR5oe+fKXUGxal5DJbKoLsxuPjya29
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:33:34.5230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac6bd8f-4bec-4bfb-9722-08df1d4bf2fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484

Provide PF operations for querying vGPU availability and creating,
closing and resetting VF instances.

Validate VF identifiers against the PF's VF count and route lifecycle
operations through the manager. Retain the GPU context needed to create
plugin RPC channels and return guest PCI properties after activation.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs              |  26 +++-
 drivers/gpu/nova-core/nova_core.rs        |   6 +
 drivers/gpu/nova-core/vgpu.rs             |   2 +
 drivers/gpu/nova-core/vgpu/commands.rs    |  10 +-
 drivers/gpu/nova-core/vgpu/fw/commands.rs |   1 +
 drivers/gpu/nova-core/vgpu/instance.rs    |  93 +++++++++++--
 drivers/gpu/nova-core/vgpu/vgpu_api.rs    | 158 ++++++++++++++++++++++
 7 files changed, 281 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/vgpu_api.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d5ac779e3b0b..df9037d8965c 100644
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
@@ -35,6 +38,7 @@
     fsp::Fsp,
     gsp::{
         self,
+        cmdq::Cmdq,
         Gsp,
         GspBootContext, //
     },
@@ -397,6 +401,25 @@ fn drop(self: Pin<&mut Self>) {
 }
 
 impl<'gpu> Gpu<'gpu> {
+    pub(crate) fn cmdq(&self) -> &Cmdq<'gpu> {
+        &self.gsp_resources.gsp.cmdq
+    }
+
+    pub(crate) fn vgpu_manager(&self) -> Option<&VgpuManager<'gpu>> {
+        self.vgpu.as_ref().map(|vgpu| vgpu.as_ref().get_ref())
+    }
+
+    pub(crate) fn vgpu_total_vfs(&self) -> Option<NonZero<u16>> {
+        match self.gsp_resources.vgpu_state {
+            VgpuState::Disabled => None,
+            VgpuState::Enabled { total_vfs } => Some(total_vfs),
+        }
+    }
+
+    pub(crate) fn bar0(&self) -> Bar0<'gpu> {
+        self.gsp_resources.bar
+    }
+
     pub(crate) fn new<'a>(
         pdev: &'gpu pci::Device<device::Core<'a>>,
         bar: Bar0<'gpu>,
@@ -468,7 +491,6 @@ pub(crate) fn new<'a>(
             }),
 
 
-
             // GSP boot left the SWGEN0 latch set and pending bits in the tree.
             _: {
                 irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vectors_ref)?;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cbaef6d3d9f1..4e074e014f8b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -29,6 +29,12 @@
 mod vbios;
 mod vgpu;
 
+#[cfg(CONFIG_PCI_IOV)]
+pub use vgpu::vgpu_api::{
+    NovaCoreVfApi,
+    VgpuTypeInfo, //
+};
+
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
 // TODO: Move this into per-module data once that exists.
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 2dbf95222d4d..47a27236a086 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -42,6 +42,8 @@
 mod instance;
 mod log;
 mod scrubber;
+#[cfg_attr(not(CONFIG_PCI_IOV), expect(dead_code, unreachable_pub))]
+pub(crate) mod vgpu_api;
 mod vram;
 
 /// vGPU state detected during GPU construction.
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 52e8339504c6..ba8848211e44 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -77,7 +77,6 @@ fn check_status(dev: &device::Device<device::Bound>, command_id: u32, status: u3
 }
 
 /// Query the vGPU type assigned to a VF by its DBDF.
-#[expect(dead_code)]
 pub(super) fn query_assigned_vf_type(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq<'_>,
@@ -94,7 +93,6 @@ pub(super) fn query_assigned_vf_type(
 }
 
 /// Query and decode the firmware properties of one vGPU type.
-#[expect(dead_code)]
 pub(super) fn query_vgpu_properties(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq<'_>,
@@ -206,6 +204,14 @@ pub(super) fn set_plugin_bme(
     rpc.rpc_call_nvkv(dev, RpcMessage::UpdateBmeState, &bme)
 }
 
+/// Reset an active GSP plugin.
+pub(super) fn reset_plugin(
+    dev: &device::Device<device::Bound>,
+    rpc: &mut PluginRpc<'_, '_>,
+) -> Result {
+    rpc.rpc_call(dev, RpcMessage::Reset, &[])
+}
+
 /// Whether a failed allocation may still have transferred CHID ownership to firmware.
 pub(super) enum CeUtilsAllocError {
     /// A matching firmware response explicitly rejected the allocation.
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index ad2b29340986..3738beea0463 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -37,6 +37,7 @@
 pub(crate) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
     SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+    Reset = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
     UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
 }
 
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 82a568ee3779..c887ccd7db7e 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -39,13 +39,16 @@
     commands::{
         free_ceutils,
         negotiate_plugin_version,
+        query_vgpu_properties,
+        reset_plugin,
         send_bootload,
         send_cleanup,
         send_plugin_config,
         send_shutdown,
         set_plugin_bme,
         CeUtilsAllocError,
-        Dbdf, //
+        Dbdf,
+        VgpuProperties, //
     },
     fw::commands::{
         encode_plugin_config_params,
@@ -124,7 +127,6 @@ fn wait_plugin_ready(
 
 impl Gfid {
     /// Validates an external GFID for a device supporting `total_vfs` VFs.
-    #[expect(dead_code)]
     pub(super) fn new(gfid: u32, total_vfs: NonZero<u16>) -> Result<Self> {
         let gfid = u16::try_from(gfid).map_err(|_| EINVAL)?;
         let gfid = NonZero::new(gfid).ok_or(EINVAL)?;
@@ -142,17 +144,30 @@ pub(super) const fn get(self) -> u16 {
 }
 
 /// Resource requirements and device identity for one vGPU type.
-#[expect(dead_code)]
 pub(super) struct VgpuType {
-    vgpu_type_id: u32,
-    bar1_length: u64,
+    pub(super) vgpu_type_id: u32,
+    pub(super) bar1_length: u64,
     max_instance: u32,
-    pci_dev_id: u32,
-    pci_subsys_id: u32,
-    fb_length: u64,
+    pub(super) pci_dev_id: u32,
+    pub(super) pci_subsys_id: u32,
+    pub(super) fb_length: u64,
     gsp_heap_size: u64,
 }
 
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
 /// A vGPU instance and the resources reserved for it.
 struct VgpuInstance<'gpu> {
     gfid: Gfid,
@@ -166,6 +181,7 @@ struct VgpuInstance<'gpu> {
     vram_slot: VgpuVramSlot,
     chids: ChannelIdReservation<'gpu>,
     ceutils: Option<CeUtils>,
+    active: bool,
     needs_teardown: bool,
     /// An uncertain or failed operation retains resources until device removal.
     failure: Option<Error>,
@@ -222,6 +238,7 @@ fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
                 error,
             ),
         }
+        self.active = true;
         Ok(())
     }
 
@@ -323,6 +340,7 @@ fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) ->
             send_shutdown(dev, cmdq, self.gfid)?;
             dev_dbg!(dev, "shutdown: gfid={} stopped\n", self.gfid.get());
         }
+        self.active = false;
         Ok(())
     }
 }
@@ -335,7 +353,6 @@ pub(super) struct InstanceInfo {
     vm_pid: u32,
 }
 
-#[expect(dead_code)]
 impl InstanceInfo {
     pub(super) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32) -> Self {
         Self {
@@ -381,7 +398,6 @@ pub(super) struct VgpuInstances<'gpu> {
     vram_slots: Option<VgpuVramSlotAllocator>,
 }
 
-#[expect(dead_code)]
 impl<'gpu> VgpuInstances<'gpu> {
     pub(super) const fn new() -> Self {
         Self {
@@ -480,6 +496,7 @@ fn allocate_instance<'a>(
             vram_slot,
             chids,
             ceutils: None,
+            active: false,
             needs_teardown: false,
             failure: None,
         };
@@ -538,7 +555,6 @@ struct PendingInstance<'a, 'gpu> {
     committed: bool,
 }
 
-#[expect(dead_code)]
 impl PendingInstance<'_, '_> {
     fn activate(mut self) -> Result {
         let instance = self
@@ -569,3 +585,58 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Query and decode one vGPU type using the typed NVKV schema.
+pub(super) fn query_vgpu_type(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    type_id: u32,
+) -> Result<VgpuType> {
+    let properties = query_vgpu_properties(dev, cmdq, type_id)?;
+    Ok(VgpuType::from_properties(&properties))
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Allocate, register, and activate a vGPU instance.
+    ///
+    /// Keep the registry locked through creation or rollback so duplicate checks and
+    /// type limits remain stable. MM and BAR-user locks are acquired only within
+    /// individual memory operations, in that order.
+    pub(super) fn create_instance(&self, bar: Bar0<'gpu>, info: InstanceInfo) -> Result {
+        let mut instances = self.instances.lock();
+        instances.allocate_instance(self, bar, info)?.activate()?;
+        Ok(())
+    }
+
+    pub(super) fn close_instance(&self, gfid: Gfid) -> Result {
+        self.instances.lock().destroy_instance(self, gfid)
+    }
+
+    pub(super) fn reset_instance(&self, gfid: Gfid) -> Result {
+        let mut instances = self.instances.lock();
+        let instance = instances
+            .instances
+            .iter_mut()
+            .find(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        if instance.failure.is_some() || !instance.active {
+            return Err(EBUSY);
+        }
+
+        let result = (|| {
+            reset_plugin(self.dev, &mut instance.plugin_rpc)?;
+            instance.ceutils.as_ref().ok_or(EINVAL)?.scrub_guest_fb(
+                self.dev,
+                self.cmdq,
+                self.bar_user,
+                self.mm,
+                &instance.vram_slot.fbmem,
+            )
+        })();
+        if let Err(error) = result {
+            instance.failure = Some(error);
+            instance.active = false;
+        }
+        result
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/vgpu_api.rs b/drivers/gpu/nova-core/vgpu/vgpu_api.rs
new file mode 100644
index 000000000000..f9f3e527bdc0
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vgpu_api.rs
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! PF-owned lifecycle operations for Nova VF drivers.
+
+use core::num::NonZero;
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Gpu,
+    gsp::cmdq::Cmdq,
+    vgpu::instance::{
+        query_vgpu_type,
+        Gfid,
+        InstanceInfo,
+        VgpuType, //
+    },
+};
+
+use super::{
+    commands::{
+        query_assigned_vf_type,
+        Dbdf, //
+    },
+    VgpuManager, //
+};
+
+/// Guest PCI properties of an activated vGPU instance.
+pub struct VgpuTypeInfo {
+    /// PCI device ID to present to the guest.
+    pub pci_dev_id: u32,
+    /// PCI subsystem ID to present to the guest.
+    pub pci_subsys_id: u32,
+    /// BAR1 aperture size in MiB.
+    pub bar1_length: u64,
+}
+
+impl VgpuTypeInfo {
+    fn from_vgpu_type(vgpu_type: &VgpuType) -> Self {
+        Self {
+            pci_dev_id: vgpu_type.pci_dev_id,
+            pci_subsys_id: vgpu_type.pci_subsys_id,
+            bar1_length: vgpu_type.bar1_length,
+        }
+    }
+}
+
+/// PF-owned operations available while a VF driver is bound.
+pub struct NovaCoreVfApi<'gpu> {
+    pdev: &'gpu pci::Device<device::Bound>,
+    cmdq: &'gpu Cmdq<'gpu>,
+    bar: Bar0<'gpu>,
+    vgpu: Option<&'gpu VgpuManager<'gpu>>,
+    total_vfs: Option<NonZero<u16>>,
+}
+
+impl<'gpu> NovaCoreVfApi<'gpu> {
+    #[expect(dead_code)]
+    pub(crate) fn new(gpu: &'gpu Gpu<'gpu>, pdev: &'gpu pci::Device<device::Bound>) -> Self {
+        Self {
+            pdev,
+            cmdq: gpu.cmdq(),
+            bar: gpu.bar0(),
+            vgpu: gpu.vgpu_manager(),
+            total_vfs: gpu.vgpu_total_vfs(),
+        }
+    }
+
+    /// Returns whether the PF booted with vGPU support enabled.
+    pub fn is_available(&self) -> bool {
+        self.vgpu.is_some()
+    }
+
+    fn gfid(&self, gfid: u32) -> Result<Gfid> {
+        let total_vfs = self.total_vfs.ok_or(ENODEV)?;
+        Gfid::new(gfid, total_vfs)
+    }
+}
+
+impl NovaCoreVfApi<'_> {
+    /// Creates and boots an instance for a one-based VF ID.
+    ///
+    /// `sbdf` encodes the VF address as `(segment << 16) | (bus << 8) | devfn`.
+    /// `vm_pid` identifies the VM process's thread group. This call may sleep.
+    pub fn open_instance(&self, gfid: u32, sbdf: u32, vm_pid: u32) -> Result<VgpuTypeInfo> {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+        let dbdf = Dbdf::from_raw(sbdf);
+
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} sbdf={:#x}\n",
+            gfid.get(),
+            dbdf.into_raw()
+        );
+
+        let bar = self.bar;
+        let cmdq = self.cmdq;
+        let vgpu = self.vgpu.ok_or(ENODEV)?;
+
+        let type_id = query_assigned_vf_type(dev, cmdq, dbdf)?;
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} assigned type_id={}\n",
+            gfid.get(),
+            type_id
+        );
+
+        let vgpu_type = query_vgpu_type(dev, cmdq, type_id)?;
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} vgpu_type={} fb_length={:#x}\n",
+            gfid.get(),
+            vgpu_type.vgpu_type_id,
+            vgpu_type.fb_length
+        );
+
+        let type_info = VgpuTypeInfo::from_vgpu_type(&vgpu_type);
+        vgpu.create_instance(bar, InstanceInfo::new(gfid, dbdf, vgpu_type, vm_pid))?;
+
+        Ok(type_info)
+    }
+
+    /// Tears down an instance, retaining resources if firmware cleanup fails.
+    ///
+    /// This call may sleep.
+    pub fn close_instance(&self, gfid: u32) -> Result {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+
+        dev_dbg!(dev, "vgpu_close: gfid={}\n", gfid.get());
+
+        let result = self.vgpu.ok_or(ENODEV)?.close_instance(gfid);
+        if let Err(error) = result {
+            dev_err!(dev, "vgpu_close: gfid={} failed: {:?}\n", gfid.get(), error);
+        }
+        result
+    }
+
+    /// Resets an instance and scrubs its guest VRAM. This call may sleep.
+    pub fn reset_instance(&self, gfid: u32) -> Result {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+
+        dev_dbg!(dev, "vgpu_reset: gfid={}\n", gfid.get());
+
+        self.vgpu.ok_or(ENODEV)?.reset_instance(gfid)?;
+
+        dev_dbg!(dev, "vgpu_reset: gfid={} done\n", gfid.get());
+        Ok(())
+    }
+}
