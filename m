Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F63F4831
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372415; cv=fail; b=X7QICY8+Uv6eEyUHaOO7s003AeHYmLOcM8sFj/YngPTWEeXqLsWxzZ1yC2m58WMqnirbiUO1mKoUazgE5c4phZyQDYXB3KBoMtfg/QYtywdHBb9WWQS+GbqXaLwPrGFtbnbYJCXQMyn0RTubACufSKLbRGAr6LmLXf4n6UabZDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372415; c=relaxed/simple;
	bh=GgZeBTnBmeYridzCo6T0UEX5+HFGSKLo11mkraIl+0w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5pRv9iAjFo9tMiHlyvVysDmKgxFmQ5quCl0tSY6erAjyTDaeBSPHhsrVCMtdDlIhBrkqwqBkaBxEtoRbtassoFU9DaVPd92Q5t7URLQMALJye5Q7eZmJBKn2cyS298tb0SuYRo2VMZ7gF7BtSme+ric/vhxsUuFTXR4+DlOOu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hAhvYsQz; arc=fail smtp.client-ip=52.101.85.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hAhvYsQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaOZvCQqavV8D2+AC6fu5YFu0sEzG3AzYRE+y8jaab1gmn15qaEFqIjxaKfss0pjlySr4kuBxkEgYEc2e5DNtTVmQBonxYoEWKVpTdSPkaW7TZftL7FONL4CgLbEOlwgZIBXampPvN3Tu7zCMzxUXW8V0LJkIxBwrTH/vi/SDcg7jwcXVCSm7CqdTslIrO5XhA3yP8MvFQLCe+t/AyMutIYP0iY1iQqjSeY7EVjfMDl1tbnW4rFtUCX4ZXPNyETv2XIJ12TueIl2fhPryNML8PCiaiYEUlWUDfGsppPw9g83An/yUcDO4Lowm0o7WtNoTpFsbJvDscST8/TtgE9hoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgSphZpe0LvR6POEtpGPsU73y2yJsswNY3X+27/2His=;
 b=yqsHcFS80Eupvz8Au9WSKJCnekWLvBDtQ0Rp2tp0rajTW09tR0DHc7qfgfe2DR7vergq9y6KB+RwKol4Zz+rVWiWOmS2SibKDoMJMgn7kHYJZ9IABPRSwT7NcC7Ci/4dgrw3qZU3q7qxndZjepQeFwaJkOkTsyj4igSzW+IDKNHuxvgKIPTTSuuN/1elUf8f/RX5ajqfGM7VC79qFNXRG6acqAnJLYDH5kEm2//oBiYm8RkiNA96V77/W14zn0Vj1Dg9RznCm5BFsdGoxp9X77rFVUiTjLntj1WC4d/A2WqodRf+NAXmsCk8RpBGnin8FsuQs3lZXuTZIXbsRRX7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgSphZpe0LvR6POEtpGPsU73y2yJsswNY3X+27/2His=;
 b=hAhvYsQzeBdi3sen6Ra6BLF+537Q+jKyBndugdjlpzNo5uSWAThk0IGulbhK/myM78Vr52Qw6CTDHnftBExUuyXezWCxwsj0jRBolxqXSF8BbTVYWdvETy+SPLKloFBnxxmqpzf3iXRJZJWvjngDUM+TGNDXmRmFKz0DMEecft1UJHCE+9odkuLKxtl/AAL+noyCgqMwzVF+Vz4AxILr1A0EVYO7DmHM0+t3qv1bLJO+/IpWlxCEgnD6TXH82v5L3cZuJ9uRnb4ChGkgbYKCyppRNdIs/w+HbcPZaRO4ygNEpF5Et3SPHruoNdSrKzS/H16t6J5srNXZ21TPMITrug==
Received: from DS1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::18) by
 PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:27 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:455:cafe::5e) by DS1P220CA0014.outlook.office365.com
 (2603:10b6:8:455::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:53:04 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:04 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:56 -0700
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
Subject: [PATCH v2 27/32] gpu: nova-core: vgpu: negotiate the GSP plugin RPC version
Date: Mon, 14 Sep 2026 10:49:02 +0300
Message-ID: <20260914074907.1399629-28-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8d1596-5e56-4817-e36f-08df1235427b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3sxYv81wEE2fH4+P2viB8ILWg1qYTpZBoBXtT7ZqkqBkFg9Y4c+GBsb/TL83asXYmbNDhWYViIORqkCfE12IG7UNuVxjg78bWxgV1zW1w1elxYjyQk1saqVVqaqYH14DIg70+Iwkt6EvG9rZBnuML3qe/774tWXDosSvtSpiofC5fV24CBLu+nx59Mlwozb53ekqOdlBg+qdzPmlSkYACXeJqnRpJXJv6Z00SGymBuXnM4y4z8Fn2RAmzVEwbNq4+KWlXSCmuqWXobGVKbXqDaWQYc5JPRkHBJxarw7IFW4JF2JcS7XWY204YljW/xs5/Kt86e+qr+8jGJBEVhowuxesrx7nyELgcJWc5qHZtEJuQ1EuD99i01lx07UZCgjN+A13s0GzbnX6xZpEe26dHj0IfLuYDd8hWt+jHZlC3k7GqqSfaYs/IjX1WfOamKM8Nmc2PIA170gEYaMGoe1SyzgNp7aFDLY//kw2oGTuZVIOvU9w0C2crnWOkonoo5Yl0dfZk6bJt4VDQP/tSckPEwwOoyEOkceSy+p5V6mf2bLCKPRiY+rW2QBmV1DtfsLjUURrj37vQM9xSquC+rdfRpmkIdcPOPMTiCPKI0aOG71wWmGFVRNdyXnrmqhL73rb7kIVvdy2Yh65H6niU/p0usWl6m4siY/johzK+cZCv5nyLAzkDgUTvj6vtSdWtK1GGUgvlHfgyd31I1LJiUtjrw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yftMzyEWUy8WRr4NOhGz7bie24ZUd29X3Eul2lAVtvwr+QeTih5CIgXKJh+JGtBGo72er7KJjr7PODhTY4XAgh8+YToWLSLdcSwB6tX2OawPffigpijRugg/Is5A7nrGN3+obR0TZY1qefPmOCk6ghSJnZVsfgIiX01pSe2dbLo1ueZEW8bPR3DYNr3UaDSGHCiiDqS6geleeFLt3Tx1Q73UXB2mwy6J9FrQqpGlmrCVusYYoTOW2F0IxQAqs8vb03zsieYyDg4MredzCUPkqKxiO4OZr4qZkjx6QGsKTLdLWSitp+WDHJSY1CDdCibeE9JFqeWNHjBPTGlx7cLgOmCEUu9Qt5MhxVfsARv4b8GLqgAwrUBvy3yTROvc6yUbYgMbeIIH1OwdcQYSzrXWLd8y/usOKz4/hyG/n/Wi4uXvr1V3EcjPTV5MVfaXcMk+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:26.6459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8d1596-5e56-4817-e36f-08df1235427b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

The vGPU manager negotiates the RPC protocol with the booted GSP plugin
before sending configuration parameters.

Add the version-negotiation message ID and typed RPC submission.
Initialize the shared RPC buffers after the plugin reports ready, then
send the negotiation request.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs        | 18 +++++++++++++++++-
 drivers/gpu/nova-core/vgpu/fw.rs              |  2 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |  9 +++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |  5 +++--
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs  | 11 ++++++-----
 drivers/gpu/nova-core/vgpu/instance.rs        | 10 ++++++++--
 6 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index a2df36b901a8..abc85b0365f2 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -22,7 +22,13 @@
     },
 };
 
-use super::instance::Gfid;
+use crate::driver::Bar0;
+
+use super::{
+    fw::RpcMessage,
+    gsp_plugin_rpc::PluginRpc,
+    instance::Gfid, //
+};
 
 use super::fw::commands::VgpuPropertiesSchema;
 
@@ -144,3 +150,13 @@ pub(super) fn send_cleanup(
     dev_dbg!(dev, "cleanup: gfid={} done\n", gfid.0);
     Ok(())
 }
+
+/// Negotiate the host protocol with a bootloaded GSP plugin.
+pub(super) fn negotiate_plugin_version(
+    dev: &device::Device<device::Bound>,
+    bar0: Bar0<'_>,
+    gfid: Gfid,
+    rpc: &mut PluginRpc<'_, '_>,
+) -> Result {
+    rpc.rpc_call(dev, bar0, gfid, RpcMessage::VersionNegotiation, &[])
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 9925d5ccf71f..6cec92c9b505 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -27,6 +27,8 @@
     VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
 };
 
+pub(super) use commands::RpcMessage;
+
 pub(super) const GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
 
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 2e6518e2460b..b765d30a1d61 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -25,6 +25,15 @@
     Required, //
 };
 
+use super::bindings;
+
+/// Message types supported by the nova-core plugin RPC channel.
+#[derive(Clone, Copy)]
+#[repr(u32)]
+pub(in crate::vgpu) enum RpcMessage {
+    VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+}
+
 bitfield! {
     pub(in crate::vgpu) struct Dbdf(u32) {
         2:0 function;
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index 20695929a58c..e385ecff43fa 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -18,6 +18,7 @@
     self,
     RawControlRegion,
     RawResponseRegion,
+    RpcMessage,
     RpcResponse, //
 };
 
@@ -337,7 +338,7 @@ pub(super) fn initialize(&self) -> Result {
     }
 
     /// Copy and publish one RPC request to firmware.
-    pub(super) fn submit(&self, message: u32, sequence: u32, data: &[u8]) -> Result {
+    pub(super) fn submit(&self, message: RpcMessage, sequence: u32, data: &[u8]) -> Result {
         if u64::try_from(data.len()).map_err(|_| EOVERFLOW)? > self.message.size() {
             return Err(E2BIG);
         }
@@ -352,7 +353,7 @@ pub(super) fn submit(&self, message: u32, sequence: u32, data: &[u8]) -> Result
         self.write_u32(
             &self.control,
             core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
-            message,
+            message as u32,
         )?;
         self.write_u32(
             &self.control,
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
index bc5d576d8601..ff009f241c32 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -35,7 +35,10 @@
 };
 
 use super::{
-    fw::RpcResponse,
+    fw::{
+        RpcMessage,
+        RpcResponse, //
+    },
     gsp_plugin_comm::CommBufferRegion,
     instance::Gfid, //
 };
@@ -59,7 +62,6 @@ pub(super) fn comm(&self) -> &CommBufferRegion<'map, 'gpu> {
     }
 
     /// Initialize the control and response buffers for the first RPC.
-    #[expect(dead_code)]
     pub(super) fn init_rpc(&mut self) -> Result {
         self.comm.initialize()?;
         self.message_sequence = 0;
@@ -76,13 +78,12 @@ fn next_sequence(&self) -> u32 {
     }
 
     /// Write one RPC message, ring the VF doorbell, and wait for its response.
-    #[expect(dead_code)]
     pub(super) fn rpc_call(
         &mut self,
         dev: &device::Device<device::Bound>,
         bar0: Bar0<'_>,
         gfid: Gfid,
-        message_type: u32,
+        message_type: RpcMessage,
         data: &[u8],
     ) -> Result {
         let sequence = self.next_sequence();
@@ -93,7 +94,7 @@ pub(super) fn rpc_call(
             dev,
             "vGPU RPC: gfid={} type={} bytes={} sequence={}\n",
             gfid.0,
-            message_type,
+            message_type as u32,
             data.len(),
             sequence,
         );
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 994b046802c1..a65b95d11f88 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -22,6 +22,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gpu::ChannelIdReservation,
     mm::{
         bar_user::BarUser,
@@ -41,6 +42,7 @@
 };
 
 use super::commands::{
+    negotiate_plugin_version,
     query_vgpu_properties,
     send_bootload,
     send_cleanup,
@@ -355,11 +357,12 @@ pub(super) fn allocate_instance(
         }
     }
 
-    /// Bootload the GSP plugin for a registered instance.
+    /// Boot the GSP plugin and negotiate its RPC version.
     pub(super) fn activate_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
         cmdq: &Cmdq<'_>,
+        bar0: Bar0<'_>,
         gfid: Gfid,
         fifo_engine_list: &FifoEngineList,
     ) -> Result {
@@ -368,7 +371,10 @@ pub(super) fn activate_instance(
             .iter_mut()
             .find(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
-        instance.bootload(dev, cmdq, fifo_engine_list)
+        instance.bootload(dev, cmdq, fifo_engine_list)?;
+
+        instance.plugin_rpc.init_rpc()?;
+        negotiate_plugin_version(dev, bar0, gfid, &mut instance.plugin_rpc)
     }
 
     /// Stop the plugin and release the instance's firmware and host resources.
