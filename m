Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551083E9C36
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372395; cv=fail; b=ELcWLWG8U0YTuXPj7OBV7osEUwQyMNbAMfeThTFv0P6T5yPxyJ/AabOIy3tqpwmsnFGfT71wHZoCAllOwTFXboAwdyU7BfYqY6SExKfGPKH1OLuSE1NmruwLPtxvjrgnDclLFfcLPA6lOROqziKncmM1ls+ZpqGL/benkFJHrnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372395; c=relaxed/simple;
	bh=RbyB7KoldSjxTYtceuHFnM9CSiEO/9KBzYYdSRFU9jQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIsY9DOLLmmw6uicmMSd0jCRSvr7du0ibtjCrzlJxmCM1ocxo8xsg8Jurr5MrOJkYAwMsvlqn2ndR80mOnEkwOphZtXYSIqVQM+mDHvH9c76a0mQ4avow9V+do7yOM4jsFfXNSVk+27oaLV2V+N7qAnq87bFY8kuQAp7hE3gtTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OgG1ZkOk; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OgG1ZkOk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEQXO825vdc8Zcz2t1EnLmtmNxaPa2G+WDGwiG3RuzEdl8xzO0BNwrOOGbnitDFIlStgicoZGfpLiK/VOhyO70XNwtfHybDo7uCLUF9w54yzBeeu+vP4WxnFcY+RODqFr0VAQrcUigHzqVOUQduAHV+B9Eehpb5nUiGg79m8vj59OQen6sz9C12KzfaA83JPPQBiiXBYS9ZeBH7yCxJtvQqOPmtzvhBu7/x6faRsT8RNMTSLkOwmruiQQ1BlDyFR4jOJay+HaHhb7O1fur3jfBIjHeky5bLe2N1zbhyn+UbcyOOqOXt0iQDNaqEsm/tPNcYl50QLSfZwC4xeP/VfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpixQe/cGf1djTNpqbGghcVYkVb7A2gVkQa2Vc/4qZQ=;
 b=PCSfSbq02hSaVih5YavXjg6ZiZjHjMUQAktmMscggGO1+9aS36qtUsZr6m/zysAFLLWQKrjUxWzSDf0k23iLGi3Aax5SrPfCyPs1o+YidMP0fKjZ79D34dl64dKOB98TPS6zUCgfkvCjbsgthtQcbyOCKtaWuvSpoF25PguWcSDgiRzkNcSJC23sPW8UisYfDg56/mv0IFQZmhpuUcpO7FAU83EvNPtRowJ52I4wJt2PGR+QKfH7L0bnJFHNQwzv0b8GnF2r8iRtTXjhG/mqlXnSy1Zq0hgb9D1B8uqqmR4oK04Ye2PuQC94BJsdhw2wWJJGRn8KNvRVcOYRFVhNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpixQe/cGf1djTNpqbGghcVYkVb7A2gVkQa2Vc/4qZQ=;
 b=OgG1ZkOkm4myOatOxBdA1JTF9u0r9nNy7gCZthNJEHL0eI+nRsDTV5CEzLz9GhxVsmcWyf0UrqtrR+TEDyNYMVlfRfuqMlTKG/YlZiZOWzZlYIWgY9h4aNqDvP/ljs+zgtp52cjTfF68TIXvyQ8ef7XMVOLSE0/Ww782N9berBBKq/1Rt7SDbHtx3gHAyp0tjsFgPa78hKX9Xtv/UEW3pSgDnrdLpMo8Lz4Ue466qG71Fk1JQSmqVB8DJw2IUPFJXQYFptMBr6cliufo/vCnBS0dTm6VGpkVI/jHPPY4ef2p3755nwcFjP16FZgjavJ9ZWLCWbAvJbMD6OdROalQcQ==
Received: from CH0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::29)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:01 +0000
Received: from BN2PEPF0000A891.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::77) by CH0P220CA0014.outlook.office365.com
 (2603:10b6:610:ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A891.mail.protection.outlook.com (10.167.248.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:52:39 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:39 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:31 -0700
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
Subject: [PATCH v2 24/32] gpu: nova-core: vgpu: add instance boot and shutdown
Date: Mon, 14 Sep 2026 10:48:59 +0300
Message-ID: <20260914074907.1399629-25-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A891:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e51a9d8-9fcd-4e33-f95a-08df12353394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|7416014|376014|11063799006|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IDIk+FBqEYAY3maV849WrPkZImlkWn7alzR6L02dRXXYRwUmWIQHZElsm9c147CWPewg10VBFqbS8498IPNjzH6g5PfAhAJ7z4O6gRNMghc1xWbBW7ji+5xFqf7NcTmc/+5qFlGMUkHm/mg5Lg3pGK6u1PIapIWwabVieWRRg7KBprEG2qrFA0tAynQe5MRw1qzLx4Hqxmb1QVmBP6SQmzrbnyQ98ZRhHi+8/329k8izpiz+WmIFv1FwSOimo3IbbHnMZlAWxR9UE7Vll4pQHkaDKHQRbz1LIPmhsThClULN3nRCViLQd90Ev7ERoN4LeC4Udzb5IveoQs07mHH6j8IxxVdkL70nHMmr/RypSSmCMEvrOgDG8uCbP0EqwKH3T+4gqiGhmzccF7Yddq844vHxI7uFAjwoB2N0qkeUVnBxSbhLFENKbKcOWg3rRtsXeGOadPkWmzLRU1BauaysfLlQhDUTBdl6QoNf+UvKw5DoFZGwHJekb1AhMbH5Xlt4mZXNk746EjkJ5TFC5RYE2IE6a+aFVYRD+9ETwvR0MfIQupfz50HoR9Uzu1Nf31sAUC3vunp+dIHy6yDDMIiPikUFhhZviMejfQfrTtLFfIDavcEYCTRaRQSl8tywfGfAmZdDSWtT5k7k+PJ+2hPohNqaRaeZVw552i23i5g8gmxCE66SdugsT7bfTLFsCfRzxRPEzdQVFCRUaftYpRoT1g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(7416014)(376014)(11063799006)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HZ6g53M4b55UXXY5auo9LlqsYOQ4UyhH/8PnuMIb2wXeyZELIG41l3RPvux4uXRYNTSMCQWcUu9Il0T87eHmyEuW9dOfhAaw/61GucxaHRw5uNPcqdtagtf5umKmD0CMqslZztOu0doZT9lCTVdusSYzgQhs7g3LkH3HHTTm7MbrqYImlAIW+dB/kCRoJ6ZJJqWCqtQVIgnAmna0s/WGASKcnaEAN639Y/h8cmgKn93q7JoDepIglm6yOjKzE3qOE3RW6vt6OTR8ua6NIxyndI3sqYKjd6c8n1iTLd+j43cNdR8hBHuNi2pOC28k6YACEytzHyKUkxWT5GcHqNyrDtVGRK4UJFfeOGQE3z0OqzcHMf/aB7bCE7C4LvGk0FM/gqoJJvgcmYrUxrIADJotWi5w/qE0+Uv9Vb4GU3iGZfK4W7aSEXH7jZTjQCk5zysz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:01.5954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e51a9d8-9fcd-4e33-f95a-08df12353394
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A891.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134

Once a vGPU instance has been allocated, the boot command registers all
its resources with the GSP-RM and GSP plugin, and starts the plugin. During
vGPU shutdown, SHUTDOWN stops the plugin before the instance's resources
are released.

Start the GSP plugin with the instance's channel map, framebuffer,
management heap and log regions. Clear a reused slot's ready marker
before boot and wait for the plugin to publish a new one.

Wait for SHUTDOWN completion and CLEANUP before unmapping the communication
buffer and returning the channel and VRAM reservations.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs             |   2 -
 drivers/gpu/nova-core/gsp/commands.rs         |   1 -
 drivers/gpu/nova-core/vgpu/commands.rs        |  80 +++++++-
 drivers/gpu/nova-core/vgpu/fw.rs              |  12 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |   2 -
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |  15 +-
 drivers/gpu/nova-core/vgpu/instance.rs        | 194 +++++++++++++++++-
 7 files changed, 287 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f4a0c8671bc8..62b97a43fefd 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -734,7 +734,6 @@ pub(crate) fn send_gmc_and_receive_timeout(
     }
 
     /// Sends a synchronous GMC command and checks its status-only reply.
-    #[expect(dead_code)]
     pub(crate) fn send_gmc_and_check_status(&self, command_id: u32, payload: &[u8]) -> Result {
         let response = self.send_gmc_and_receive(command_id, payload, 0)?;
         if response.status == 0 {
@@ -753,7 +752,6 @@ pub(crate) fn send_gmc_and_check_status(&self, command_id: u32, payload: &[u8])
     ///
     /// Both callbacks run with the queue locked and must not reenter this queue or reset it.
     /// Their second argument is the raw `max_resp_or_status` word of the event header.
-    #[expect(dead_code)]
     pub(crate) fn send_gmc_and_wait_event(
         &self,
         command_id: u32,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 7945a191bd08..769ff6aea748 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -60,7 +60,6 @@ pub(crate) struct FifoEngineList {
 }
 
 impl FifoEngineList {
-    #[expect(dead_code)]
     pub(crate) fn gmc_ids(&self) -> &[u32] {
         // PANIC: The type invariant bounds `count` by the array capacity.
         &self.gmc_ids[..self.count]
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index bdedd7fc21ad..a2df36b901a8 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -6,7 +6,12 @@
 //! Sends requests, checks responses and coordinates the firmware command
 //! sequences used by instance lifecycle operations.
 
-use kernel::prelude::*;
+use kernel::{
+    device,
+    prelude::*,
+    time::Delta,
+    transmute::AsBytes, //
+};
 
 use crate::gsp::{
     cmdq::Cmdq,
@@ -17,6 +22,8 @@
     },
 };
 
+use super::instance::Gfid;
+
 use super::fw::commands::VgpuPropertiesSchema;
 
 pub(super) use super::fw::commands::{
@@ -25,8 +32,12 @@
 };
 
 use super::fw::{
+    GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
+    GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
     GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
-    GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
+    GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
+    GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
+    GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE, //
 };
 
 /// Query the vGPU type assigned to a VF by its DBDF.
@@ -68,3 +79,68 @@ fn decode_vgpu_properties(payload: &[u8]) -> Result<KBox<VgpuProperties>> {
     let properties = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
     Ok(properties)
 }
+
+/// Send BOOTLOAD and check its firmware status.
+pub(super) fn send_bootload(cmdq: &Cmdq<'_>, payload: &[u64]) -> Result {
+    let response = cmdq.send_gmc_and_receive_timeout(
+        GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
+        AsBytes::as_bytes(payload),
+        0,
+        Delta::from_secs(10),
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+    Ok(())
+}
+
+/// Shut down a vGPU plugin task and wait for its completion event.
+pub(super) fn send_shutdown(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    let payload = gfid.0.to_le_bytes();
+
+    cmdq.send_gmc_and_wait_event(
+        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
+        &payload,
+        Delta::from_secs(10),
+        |command_id, _max_response_size, _sequence, payload_0, payload_1| {
+            if command_id != GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE
+                || !payload
+                    .iter()
+                    .copied()
+                    .eq(Iterator::chain(payload_0.iter(), payload_1.iter())
+                        .take(payload.len())
+                        .copied())
+            {
+                return Ok(false);
+            }
+            Ok(true)
+        },
+        |command_id, _max_response_size, _sequence, _payload_0, _payload_1| {
+            dev_dbg!(
+                dev,
+                "shutdown: ignoring unrelated event command={:#x}\n",
+                command_id,
+            );
+            Ok(())
+        },
+    )?;
+    Ok(())
+}
+
+/// Release firmware resources after a plugin task has stopped.
+pub(super) fn send_cleanup(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    cmdq.send_gmc_and_check_status(
+        GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
+        &gfid.0.to_le_bytes(),
+    )?;
+    dev_dbg!(dev, "cleanup: gfid={} done\n", gfid.0);
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index aabe114b55c2..1528cc56ce74 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -30,3 +30,15 @@
 
 pub(super) const GMCAPI_CMD_QUERY_VGPU_PROPERTIES: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
+
+pub(super) const GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK;
+
+pub(super) const GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK;
+
+pub(super) const GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE;
+
+pub(super) const GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 3af84c584dd6..2e6518e2460b 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -58,7 +58,6 @@ pub(in crate::vgpu) struct ChannelMapEntry(u64) {
 impl ChannelMapEntry {
     const KEY: KeyId = 0x1001;
 
-    #[expect(dead_code)]
     pub(in crate::vgpu) fn new(engine_type: usize, index: u32, chid_offset: u32) -> Result<Self> {
         Self::zeroed()
             .try_with_engine_type(u64::try_from(engine_type).map_err(|_| EOVERFLOW)?)
@@ -136,7 +135,6 @@ impl VgpuBootloadRequest {
 }
 
 /// Encodes a `VGPU_BOOTLOAD` request using the typed NVKV schema.
-#[expect(dead_code)]
 #[expect(clippy::too_many_arguments)]
 pub(in crate::vgpu) fn encode_vgpu_bootload(
     dbdf: Dbdf,
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index d2139309b6be..af7a396021bc 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -26,7 +26,6 @@ pub(super) struct PluginLogRegions {
     kernel: VramRegion,
 }
 
-#[expect(dead_code)]
 impl PluginLogRegions {
     pub(super) const fn init(&self) -> &VramRegion {
         &self.init
@@ -81,7 +80,6 @@ pub(super) struct CommBufferRegion<'map, 'gpu> {
     kernel_log: VramRegion,
 }
 
-#[expect(dead_code)]
 impl<'map, 'gpu> CommBufferRegion<'map, 'gpu> {
     /// Map the communication portion of a plugin management heap.
     pub(super) fn new(
@@ -187,6 +185,19 @@ pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         }
     }
 
+    /// Clear a previous boot marker before starting the plugin.
+    pub(super) fn clear_plugin_ready(&self) -> Result {
+        let offset = self.io_offset(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            size_of::<u32>(),
+        )?;
+        self.map.try_write32(0, offset)?;
+        // Complete the posted clear before firmware can publish its new marker.
+        self.map.try_read32(offset)?;
+        Ok(())
+    }
+
     /// Return whether firmware has published the plugin boot marker.
     pub(super) fn is_plugin_ready(&self) -> Result<bool> {
         let value = self.read_u32(
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 99a8f47e72d1..535e5ab7c2ad 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -4,19 +4,33 @@
 use core::num::NonZeroUsize;
 
 use kernel::{
+    device,
     prelude::*,
     ptr::Alignment,
     sizes::SizeConstants, //
+    time::{
+        delay::fsleep,
+        Delta,
+        Instant,
+        Monotonic, //
+    },
 };
 
-use crate::gsp::cmdq::Cmdq;
+use crate::gsp::{
+    cmdq::Cmdq,
+    commands::FifoEngineList, //
+};
 
 use crate::{
     gpu::ChannelIdReservation,
-    mm::GpuMm, //
+    mm::{
+        bar_user::BarUser,
+        GpuMm, //
+    },
 };
 
 use super::{
+    gsp_plugin_comm::CommBufferRegion,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -27,10 +41,56 @@
 
 use super::commands::{
     query_vgpu_properties,
+    send_bootload,
+    send_cleanup,
+    send_shutdown,
     Dbdf,
     VgpuProperties, //
 };
 
+use super::fw::commands::{
+    encode_vgpu_bootload,
+    ChannelMapEntry, //
+};
+
+/// Ready limit used by `vmiopd_negotiate_cpu_gsp_version()` for the same marker.
+const PLUGIN_READY_TIMEOUT: Delta = Delta::from_secs(10);
+
+/// Build the typed channel mapping from the GSP FIFO engine list.
+fn channel_mapping(
+    fifo_engine_list: &FifoEngineList,
+    chid_offset: u32,
+) -> Result<KVVec<ChannelMapEntry>> {
+    let mut mapping = KVVec::new();
+    for &gmc_id in fifo_engine_list.gmc_ids() {
+        let engine_type = (gmc_id & 0xffff) as usize;
+        let index = gmc_id >> 16;
+        mapping.push(
+            ChannelMapEntry::new(engine_type, index, chid_offset)?,
+            GFP_KERNEL,
+        )?;
+    }
+    Ok(mapping)
+}
+
+fn wait_plugin_ready(
+    dev: &device::Device<device::Bound>,
+    comm: &CommBufferRegion<'_, '_>,
+) -> Result {
+    let start = Instant::<Monotonic>::now();
+
+    loop {
+        if comm.is_plugin_ready()? {
+            dev_dbg!(dev, "vGPU plugin ready after {:?}\n", start.elapsed());
+            return Ok(());
+        }
+        if start.elapsed() >= PLUGIN_READY_TIMEOUT {
+            return Err(ETIMEDOUT);
+        }
+        fsleep(Delta::from_millis(1));
+    }
+}
+
 /// Guest Function ID. GFID 0 is reserved for the PF; VFs start at 1.
 #[repr(transparent)]
 #[derive(Clone, Copy, PartialEq, Eq)]
@@ -49,6 +109,10 @@ pub(super) struct VgpuType {
 }
 
 impl VgpuType {
+    pub(super) const fn vgpu_type_id(&self) -> u32 {
+        self.vgpu_type_id
+    }
+
     fn from_properties(properties: &VgpuProperties) -> Self {
         Self {
             vgpu_type_id: properties.type_id,
@@ -63,14 +127,79 @@ fn from_properties(properties: &VgpuProperties) -> Self {
 }
 
 /// A vGPU instance and the resources reserved for it.
-#[expect(dead_code)]
 pub(super) struct VgpuInstance<'gpu> {
     pub(super) gfid: Gfid,
     dbdf: Dbdf,
     vgpu_type: VgpuType,
     vm_pid: u32,
     chids: ChannelIdReservation<'gpu>,
+    num_plugin_channels: u32,
     vram_slot: VgpuVramSlot,
+    comm: CommBufferRegion<'gpu, 'gpu>,
+    needs_teardown: bool,
+}
+
+impl VgpuInstance<'_> {
+    /// Bootload the GSP vGPU plugin and wait for its BAR1 ready indication.
+    fn bootload(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        fifo_engine_list: &FifoEngineList,
+    ) -> Result {
+        let fb = &self.vram_slot.fbmem;
+        let mgmt = &self.vram_slot.mgmt_heap;
+        let logs = self.comm.plugin_logs();
+
+        let payload = encode_vgpu_bootload(
+            self.dbdf,
+            self.gfid.0,
+            self.vgpu_type.vgpu_type_id(),
+            self.vm_pid,
+            u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            self.num_plugin_channels,
+            channel_mapping(
+                fifo_engine_list,
+                u32::try_from(self.chids.start).map_err(|_| EOVERFLOW)?,
+            )?,
+            fb.address(),
+            fb.size(),
+            mgmt.address(),
+            mgmt.size(),
+            0,
+            logs.init().address(),
+            logs.init().size(),
+            logs.vgpu().address(),
+            logs.vgpu().size(),
+            logs.kernel().address(),
+            logs.kernel().size(),
+        )?;
+
+        dev_dbg!(
+            dev,
+            "bootload: gfid={} sending {} typed NVKV bytes\n",
+            self.gfid.0,
+            payload.len() * size_of::<u64>(),
+        );
+
+        self.comm.clear_plugin_ready()?;
+        self.needs_teardown = true;
+        send_bootload(cmdq, &payload)?;
+
+        wait_plugin_ready(dev, &self.comm)?;
+
+        dev_dbg!(dev, "bootload: gfid={} plugin ready\n", self.gfid.0);
+        Ok(())
+    }
+
+    /// Stop the plugin when firmware may own instance resources.
+    fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) -> Result {
+        if self.needs_teardown {
+            send_shutdown(dev, cmdq, self.gfid)?;
+            dev_dbg!(dev, "shutdown: gfid={} stopped\n", self.gfid.0);
+        }
+        Ok(())
+    }
 }
 
 /// Identity and firmware profile used to allocate an instance.
@@ -132,10 +261,20 @@ fn release_vram_slot(&mut self, slot: VgpuVramSlot) -> Result {
         Ok(())
     }
 
+    fn release_instance(&mut self, instance: VgpuInstance<'gpu>, mm: &mut GpuMm<'_>) -> Result {
+        let VgpuInstance {
+            comm, vram_slot, ..
+        } = instance;
+        let result = comm.destroy(mm);
+        self.release_vram_slot(vram_slot)?;
+        result
+    }
+
     /// Allocate resources and register a new inactive vGPU instance.
     pub(super) fn allocate_instance(
         &mut self,
-        mm: &GpuMm<'_>,
+        bar_user: &'gpu BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
         vgpu: &VgpuManager<'gpu>,
         info: InstanceInfo,
     ) -> Result<Gfid> {
@@ -185,6 +324,13 @@ pub(super) fn allocate_instance(
             fb_align: vgpu.vmmu_segment_size(),
         };
         let vram_slot = self.alloc_vram_slot(mm, layout)?;
+        let comm = match CommBufferRegion::new(bar_user, mm, &vram_slot.mgmt_heap) {
+            Ok(comm) => comm,
+            Err(error) => {
+                self.release_vram_slot(vram_slot)?;
+                return Err(error);
+            }
+        };
 
         let instance = VgpuInstance {
             gfid,
@@ -192,28 +338,56 @@ pub(super) fn allocate_instance(
             vgpu_type,
             vm_pid,
             chids,
+            num_plugin_channels: 3,
             vram_slot,
+            comm,
+            needs_teardown: false,
         };
         match self.instances.push_within_capacity(instance) {
             Ok(()) => Ok(gfid),
             Err(error) => {
-                let VgpuInstance { vram_slot, .. } = error.0;
-                self.release_vram_slot(vram_slot)?;
+                self.release_instance(error.0, mm)?;
                 Err(EIO)
             }
         }
     }
 
-    /// Remove an instance and release its channel and VRAM reservations.
-    pub(super) fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+    /// Bootload the GSP plugin for a registered instance.
+    pub(super) fn activate_instance(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        gfid: Gfid,
+        fifo_engine_list: &FifoEngineList,
+    ) -> Result {
+        let instance = self
+            .instances
+            .iter_mut()
+            .find(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        instance.bootload(dev, cmdq, fifo_engine_list)
+    }
+
+    /// Stop the plugin and release the instance's firmware and host resources.
+    pub(super) fn destroy_instance(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        mm: &mut GpuMm<'_>,
+        gfid: Gfid,
+    ) -> Result {
         let index = self
             .instances
             .iter()
             .position(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
+        let instance = &mut self.instances[index];
+        instance.shutdown(dev, cmdq)?;
+        if instance.needs_teardown {
+            send_cleanup(dev, cmdq, gfid)?;
+        }
         let instance = self.instances.remove(index).map_err(|_| EIO)?;
-        let VgpuInstance { vram_slot, .. } = instance;
-        self.release_vram_slot(vram_slot)
+        self.release_instance(instance, mm)
     }
 }
 
