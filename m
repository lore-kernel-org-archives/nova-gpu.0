Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC249D593
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591578; cv=fail; b=mQNZ85kgMXyrDLOpvUch7uvLPbL29dv3u/Mjxu4Hy5TKSp4Y4XtWmeIwd93ygSlDnBM5nyuMnramKVZ3pCuyHzmeRI6BVpkm2mGcAx1ITf/nv7gcclAr3cN3ZZSLrI9NRmAKipqrXtZ7dNKBNIdg7eUgOZK7HFcFlBLeX+68nhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591578; c=relaxed/simple;
	bh=PnBN/qALLm1649inD+HAMhoQncDg06lUmu0ns3QW7aM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTl53/onKeYS5010E3q6eCqEOExTuLjQ9P7BU1rfHLUv1Rj51T9sjY/5AqYa4yiWQj3x0zKX4p/JelwSke+HqkJPTZFThXrTfTUMb2tnks37Jnfd/UdhzZXSW3yGDjcx55dP7d77t+EYaifp96UeGWtgjbec5EnhAKiw5gfWnSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jnQynnbA; arc=fail smtp.client-ip=40.93.195.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jnQynnbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIRDv+lpLubJHaSdVFy2B2mx6pOubk7Htd2Dcu2aw4THq+upZNT0T24kZnrIZzCx56jpvc+YQW8+euz51FreQ+d9F3iAkHeiEQwq7VLGsSC4cE0KsJPWVDZQeM4l6oTl8GZL5xhTxssdQ8qm3i5qZ2zsItHo7zmgGsXmBvBdlBKgbF+jg07REVFEgNvcnLPOUBiRLdL0jG4kgynl09KRUPd2jVHKj71bOfe+lUdknkRUgFTkSkZWU5Z+e7rmjvb9l3Z9LwWBXcQX7zujc/aPqQCBLwcNJz291kdYdmWWbNdYx0jK88ba7IDppJq5a5YbJuLZIdkEk58uc1i8VRBwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gof7WUwr3VVBMh2kdAPxGyaX61A+49ec8DmA+LAK4j0=;
 b=gZgfqYVqwee3OKWC6O3k3mckhOgFgyU/mDiCkpmGsNbux5OQNYc6IerGxJZUI6nH8gHJU0E1eeG0MzI55/etcVIFy0y42jVdHxqwYFkR/9SVIRocT0O9dh9E+F2YQimoW10AIXDhMPzti7XkO5IvDUIF939pq4eCs1DsRPj10Oc2nAHmbQKl/iO8rRMGG869yUeCAgYqyL4XKcuqv18zQfrIlwsKmd3z+CnRzvEnDqwVtyZf2wIFbEA6QiarEm0+9WcIULfoqRs/nUQ/s3sJya+pCWqjthMy4CAhxVkUcU6Wir6RT2Xikpg+DxHtH9Y0ELCmwC3jy+Cd1zWtSjUb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gof7WUwr3VVBMh2kdAPxGyaX61A+49ec8DmA+LAK4j0=;
 b=jnQynnbAWOgP9arkh0YkHtaOr3kIKRPZ3OW7L58zRTpK7eEY04pMyw4cMuLT/rhx1Y0BXD1cp9N1ji8dTwsUwwF+Xux2I5bk5P31DLtJcPd3bjqyJgiV4t9ePSfi4SWfeiRDxewq3kkZ3XBk4EVGDm1X8Qq+zgzeTn9baUfS6Jv/l2ZjXkpieL6XSbp8q4fkS/cDGFO/7hzoSWORPeXfiNFWYrXp7DJvydgenC5vv5fiJ7NbHwihmyH8cDNi/jZIc866G1gJyTu2hilyM5CkQseI0X75jH/pkLOyUw5AzuF7lTvmUSIAxLL5w7ds+5VVlw+UPWcCz0wn+r/FcbvHcA==
Received: from SJ0PR05CA0157.namprd05.prod.outlook.com (2603:10b6:a03:339::12)
 by DS4PR12MB9795.namprd12.prod.outlook.com (2603:10b6:8:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:32:46 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::4c) by SJ0PR05CA0157.outlook.office365.com
 (2603:10b6:a03:339::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 28 Sep 2026 10:32:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:25 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:24 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:16 -0700
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
Subject: [PATCH v3 25/31] gpu: nova-core: vgpu: negotiate the GSP plugin RPC version
Date: Mon, 28 Sep 2026 13:28:28 +0300
Message-ID: <fa037193331752a98cb864a574c3e262424a1d49.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|DS4PR12MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 8746810b-eed2-4991-ae2b-08df1d4bd615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|3023799007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NDGGSRoeu7wM1XIwy6V4FW9X1pPetYfOx2zcdKs4er6AnXIx0pf4WZ107o120rD/xT+lOFxY02DJrPjhEqTlLjOwxGxuVe6d2dYpxN3gooefQZMfeNR4fXchiRQQH86qMOFyWatvMpM4ahv1LlTuaC77hLhOsQ7twluyTQXuGnWqtsIc6uBnepA+oGUoKi+12l0D8+m4UxMTn/RDoe82s+6VPp6PWz0NGqqcYHeAiX+rSJcGgM7KSIHOzTFp8dcFXyWPld2gxNQoSgXfxE7fDOmDJnmEmz7z6BjKmyzRFH1ysCfiUH8G1b2+RaDmIn8n6olZBr7HvsnpKI0UkFGF4CXbHpPreQMQErjB8xMzzjo+Ucmsk6G5Aos0ZjcnbvR1mm7Wf8cj30O78OUftDU2O3a2N2B4jDuTBsWN+Kgo1md7Nj5viNp5F+6y/78i3cRa8yQsHrui7X1LOnpxaODhebMY7PBXyJkgZvewWXryocdv1pWhbnUqCzvIgr3cXg9LpTEZvNxkZ7GPwOgcu/IpSLDV0tlmjmLAYcKlkUl8lkq7YHZ5gU7MEVLH/I9DhEY+kz76xNa+NX3hVw1e25wAd9/e9STU8N8JrL0RGNPCekwZkBifRcuKe7o1gRrilCNDJC7Am9nvioewqClbBHTvNFbezoWVGCeJHCCgWd/irhBoPnk54Ph9DHju1JMomr+n8obJB8cCeFXZ/sjDdojksw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qll6w6iTmFNpwV0pQ0adfZScqBrr4doZ6NIVvkNt/GSFKLwcKAENbxEI/nyde2DDuDMQUC5qLsi8NM+/3qmvcw7GJxk6b7bDK7RGwgD7tLXMxygSWtTAj/82g6Jy1LzkWrRlooJ7DNvn6/F/LrS8btQN5PvRbA8rDSTCc+w7oIuNT4syplUzlGJtyxDmmTMfHpp+sR4oZnX11eKRHz+AfY6mH7Cs+10pw1l/TvxtSzgbNaUt3Vf+3ezmf7zst068PIoxCQt2xsio0y28hhvIFOPbmbGh0ZKEaDm3tM74Svu0z6vHpstFk87+HschBEIp1p8MPuOSc0c0T5+JHdzHgA/s8dDGb3bX712TLIOn8OCoL59ZLDJ53Fg6zlaijHKA7qPWvtgMhZo/3oSef1CbCFMHvVf0xhfEdlWnMbB+lOAmp455bzoIgs9rFEp3Q7tA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:46.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8746810b-eed2-4991-ae2b-08df1d4bd615
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9795

The host must negotiate the RPC protocol with the booted GSP plugin
before sending instance configuration.

After observing the plugin's ready marker, initialize the shared RPC
buffers and submit the existing typed version-negotiation request
through the instance's PluginRpc channel.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs       | 12 +++++++++++-
 drivers/gpu/nova-core/vgpu/fw.rs             |  4 ++--
 drivers/gpu/nova-core/vgpu/fw/commands.rs    |  1 -
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs |  2 --
 drivers/gpu/nova-core/vgpu/instance.rs       |  3 +++
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 52c6fc0ee335..268c3043d88b 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -27,13 +27,15 @@
         commands::{
             VgpuPropertiesSchema, //
         },
+        RpcMessage, //
         GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
         GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
         GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
         GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
-        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE, //
+        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE,
     },
+    gsp_plugin_rpc::PluginRpc,
     instance::Gfid, //
 };
 
@@ -159,3 +161,11 @@ pub(super) fn send_cleanup(
     dev_dbg!(dev, "cleanup: gfid={} done\n", gfid.get());
     Ok(())
 }
+
+/// Negotiate the host protocol with a bootloaded GSP plugin.
+pub(super) fn negotiate_plugin_version(
+    dev: &device::Device<device::Bound>,
+    rpc: &mut PluginRpc<'_, '_>,
+) -> Result {
+    rpc.rpc_call(dev, RpcMessage::VersionNegotiation, &[])
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index d80f36465296..6cec92c9b505 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -10,8 +10,6 @@
 
 use crate::gsp::bindings;
 
-pub(super) use commands::RpcMessage;
-
 pub(super) use bindings::{
     GSP_PLUGIN_BOOTLOADED,
     VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
@@ -29,6 +27,8 @@
     VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
 };
 
+pub(super) use commands::RpcMessage;
+
 pub(super) const GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
 
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 91d43cf6dd85..915585706174 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -31,7 +31,6 @@
 use super::bindings;
 
 /// Message types supported by the nova-core plugin RPC channel.
-#[expect(dead_code)]
 #[derive(Clone, Copy)]
 #[repr(u32)]
 pub(crate) enum RpcMessage {
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
index 0ee32f011f63..696127c7169f 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -65,7 +65,6 @@ pub(super) fn comm(&self) -> &CommBufferRegion<'map, 'gpu> {
     }
 
     /// Initialize the control and response buffers for the first RPC.
-    #[expect(dead_code)]
     pub(super) fn init_rpc(&mut self) -> Result {
         self.comm.initialize()?;
         self.message_sequence = 0;
@@ -82,7 +81,6 @@ fn next_sequence(&self) -> u32 {
     }
 
     /// Write one RPC message, ring the VF doorbell, and wait for its response.
-    #[expect(dead_code)]
     pub(super) fn rpc_call(
         &mut self,
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 8a2d8e3970a3..445d7f513fdc 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -31,6 +31,7 @@
 
 use super::{
     commands::{
+        negotiate_plugin_version,
         send_bootload,
         send_cleanup,
         send_shutdown,
@@ -156,6 +157,8 @@ impl<'gpu> VgpuInstance<'gpu> {
     fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         let dev = vgpu.dev;
         self.bootload(dev, vgpu.cmdq, &vgpu.fifo_engine_list)?;
+        self.plugin_rpc.init_rpc()?;
+        negotiate_plugin_version(dev, &mut self.plugin_rpc)?;
 
         Ok(())
     }
