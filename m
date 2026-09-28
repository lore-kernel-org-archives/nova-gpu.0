Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F73C3F75
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591546; cv=fail; b=RfoBhlOGkUpE31xk58fwBfmNjw0JOZiU+fq1pF1OEkdeqoO2ot7P7L7jWmdKEVLksfKeQ1JSW59W4ZAhWrxmLXyW9q+A+7MOo2rv2IUcQ49nKOwTe5AzGuGKVwUkiEf0yxTn5lO80edWC8L9gKezY7A92rG62y+uQ9UcQWWscKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591546; c=relaxed/simple;
	bh=D0DvDt0GAExsZaWhhXiCNj+AajivCSnmjOGeuvdgBF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKbWUFoUD7RmuwaKCDkam1ZUP0tz8xqIgUZa8fzHhOJ9DEMWAJTTYGtKBPTBgCBPi7nIaIiBI+gVOXOPQfqiaDJPLFXNqPmgLd3mOhOfBqcD2/TkTl4DZg8Q7qHTEQH4EcMw/1XUGUoRGgctGRxfySO7Wt+HSWFx5JdcA7xJlQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q33zjm6L; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q33zjm6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eceCz3sZDFpm2eTPLQWMjDkt43JjqrwFAPi78xVi/mfjBI+36xiWM070CuGfH8UA5u9WCliv7V3sMtA9WCWEMdq2GI7fvcWSIZG0bvnL+FdKGJXvc9uDs2ZYiwKMr+VjzDy00miPcxwBN9lq5KdEAiYWDnN0ouBQqmZFuEwNiiABE6+krxRdluqZUaKDQsbd6rWvznWXZlIevW5mLNUIAxLydmi6CG76vLzAFYSVLkc3WWhTo5FSU/0vsVhXeyT8d2l3SgZ886HyfdSCRZk3h8+LCBhdx6ycQiMZHmrR+Y/QINE+ObXYCpeFH5ud1bFRkJ+wWwOzst5nnBATzlaTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSATkHtyK2gTkym+ka5zl0HXu/afWOldCBt27pnZQ8o=;
 b=MLEhyjSd8QcxFfsPtK7YtIAuLVt1VszHJliDsKfmFXa/cm8dPOdtgxyZcqSJ36rriEmM6Y2YyiJtgHzbFqSpQp77iOFW7cuSlxgfSixSKmRFqXReUm7sk8PHd0+qkVXDVmEuCbxJao69UdGluX3CpSOp3Lh14NJBHjLY8rFBcunelHMOJYesGEBcIS4ESi08nU2NUDT4G9bHWw4o1QgPD3e13czMzjIs1N0nP3ZGcgOyg8n4aNyR1DvfB69Qjh6IRiYBmOLYJC7R29lgk8ghMgj3blzFI9MLuRZvjx9D+9ycSzhXmREm02MZvq9oCC5o9ocooordmzrVm7PG2AIZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSATkHtyK2gTkym+ka5zl0HXu/afWOldCBt27pnZQ8o=;
 b=q33zjm6LBTuaYa6bP5eNDKG6O2HG9XSBIJTmaOLgoYY2716M/kf61UT5a2JcRa4QHaH9bJzpStCFi0h9E0EREDLfcOG8JNuHaDyP4TSCFZHjKufENvnBFIprCwTT9Lv4QfYVKEq3y58yB23JkEvhg6pRGkv90vCak+6JNk5r4gqrFkj3WBKzJxF4FFrObW8t0AR2jnbLT8pC9t5kNk9n1TRFNtX/s8GZ055OHk8/g7GjqC588+/gd5dm5nywO+qbxPoFTXND/bgKTPauktSt9DPgAk+oc959+EGfaKHo//pYaeUTGFy74kR/BKgfx96L+MEDVYdkMovA0+5u+RSWEQ==
Received: from BN0PR04CA0178.namprd04.prod.outlook.com (2603:10b6:408:eb::33)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:32:16 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::61) by BN0PR04CA0178.outlook.office365.com
 (2603:10b6:408:eb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:32:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:00 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:59 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:51 -0700
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
Subject: [PATCH v3 22/31] gpu: nova-core: vgpu: add instance shutdown
Date: Mon, 28 Sep 2026 13:28:25 +0300
Message-ID: <45e62548b38d08aa0411bc5264eaa628fd326e91.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: ab868b84-4f05-4e5f-4cb2-08df1d4bc442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CcVJfsyp8mQ/96iCoytjnx5q9P05jfBbS+3FEORCLeDkYRVjLQrtgrMCsMsnVYsdycoOFjKD/xwYG9vt5ZmPwg1UiTrVSWGSBbSze68aVU0BTkAlnsSKbBZ23hGzJIqjXcSamXV/BM0f7Lgt83Qdwrm0FInL2MUQ5TYSiELSQQXG/NfnNSDeyekdASLJEB0Md+KVFwwJyfLVeAO+qH6o3lQeiqFG7W6o2l74qdQrhyCORWZHSYEqylAFC81pFaI9gAVTyMmf8AEUSBoLAEYkcfhMaJ7NC7mMr8+pplxePND6m0wgQ/i8CdhOe/dU2YX5EK0l6cCyt9fAKhxmzH+y1YQCPTEohlT6Xz2/Z0BVs/5KrvYhWDndRXxhipzzLodUdl0x1jpQSt/dOL3ARSrllcdvsiYlurdST98NO/Yo4gIJjzZg51x0nkCoXfZEFj/IiG5yV/AqU+ZBo7V3uftmEJzLTB+nibJQIMLkY0/1LilA1Mbn+0E+4nf37Ix5FUWmGKAoeJB2p+OwWcUZu4ZDi3K7BaWkklJDjV1YDILI2oPb5RPShtxyrvhQ0pwBX8aUy5Z416phPZ40Qiedbngf7UukGnJJhRqxexOo0Mlms/mx4APa5jyIGfp4E8KEMQazcSDqqz/0QlDetwj0q/UNrNOOcSIdQrAmrKJ1UCiakU1Tm3XxsCQhSiWF0GPCsF6CC7n2s5uFuGII6SRJrdlSmA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TMKEpucO2U9fszRQTqz/jvXoEVH1TAyKXRDHG9G6uffZGvgs4TmkWJ3WLGF9dkthu6B9uoBH7ZYwwdMUM4dELrYobCbm426+/NkY7Z14zrjFGyb9eAjanYVHeEbmm6QMci0wTq7UyUbCPa7lZU3HUjAcDKFZRY8UNO7tMxSvHfaGlTBE+CUNpxNmURYPgamco5CIUQcQnK3cuDraHmUzZXO4n97sZjdc1Pe2J7/6aoW7CBS6VV/25WL+7Ncts8Du/KtYiqGV9PAl6ND+XvF9zBxxn9YzuW3tD382BOvtxwzjlUc1OiQu3C+JbJfrK2/eSfV5IN/J7OnTrcdQHviKhAEfQ/rvz/NCov7muq2ffXalEcA3xOmftr5w3W+KXWxbfFlG7oxSCxgFHJ2qRqzdfkjIMNtCccY2y5TK2xknstoeaMWoHPhf3aSsqmuROXMO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:16.0466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab868b84-4f05-4e5f-4cb2-08df1d4bc442
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

Stop the GSP plugin, wait for SHUTDOWN completion, and release its
firmware resources with CLEANUP before unmapping the communication
buffers.

Add PendingInstance rollback and manager teardown. Register host resources
before firmware work, and retain them until device removal if firmware
state is uncertain or teardown fails. Keep the manager's dependencies
alive until cleanup finishes.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/vgpu.rs                 |   9 +-
 drivers/gpu/nova-core/vgpu/commands.rs        |  55 +++++++-
 drivers/gpu/nova-core/vgpu/fw.rs              |   9 ++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |   1 -
 drivers/gpu/nova-core/vgpu/instance.rs        | 118 +++++++++++++++++-
 6 files changed, 182 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index abd9edadff64..8730fd0079c4 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -812,7 +812,6 @@ pub(crate) fn send_gmc_and_receive_timeout(
     ///
     /// Errors from initializing the request headers and from either callback are propagated
     /// as-is. The current valid element is consumed before a callback error is returned.
-    #[expect(dead_code)]
     pub(crate) fn send_gmc_and_wait_event(
         &self,
         command_id: u32,
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 84c4d0b3839d..f7184e7009a5 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -105,7 +105,7 @@ fn query_state(
 use self::instance::VgpuInstances;
 
 /// Runtime resources for an enabled vGPU boot.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct VgpuManager<'gpu> {
     #[pin]
     instances: Mutex<VgpuInstances<'gpu>>,
@@ -146,3 +146,10 @@ pub(crate) fn new(
         })
     }
 }
+
+#[pinned_drop]
+impl PinnedDrop for VgpuManager<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        self.instances.lock().release_all(&self);
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 2e9c250b65ab..52c6fc0ee335 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -28,9 +28,13 @@
             VgpuPropertiesSchema, //
         },
         GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
+        GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
         GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
-        GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
-    }, //
+        GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
+        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
+        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE, //
+    },
+    instance::Gfid, //
 };
 
 pub(super) use super::fw::commands::{
@@ -108,3 +112,50 @@ pub(super) fn send_bootload(
     )?;
     check_status(dev, command_id, response.status)
 }
+
+/// Shut down a vGPU plugin task and wait for its completion event.
+pub(super) fn send_shutdown(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    let payload = u32::from(gfid.get()).to_le_bytes();
+    cmdq.send_gmc_and_wait_event(
+        GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
+        &payload,
+        Delta::from_secs(10),
+        |command_id, _max_response_size, _sequence, payload_0, payload_1| {
+            Ok(
+                command_id == GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE
+                    && payload
+                        .iter()
+                        .copied()
+                        .eq(Iterator::chain(payload_0.iter(), payload_1)
+                            .take(payload.len())
+                            .copied()),
+            )
+        },
+        |command_id, _max_response_size, _sequence, _payload_0, _payload_1| {
+            dev_dbg!(
+                dev,
+                "shutdown: ignoring unrelated event command={:#x}\n",
+                command_id,
+            );
+            Ok(())
+        },
+    )
+}
+
+/// Release firmware resources after a plugin task has stopped.
+pub(super) fn send_cleanup(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    let command_id = GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
+    let response =
+        cmdq.send_gmc_and_receive(command_id, &u32::from(gfid.get()).to_le_bytes(), 0)?;
+    check_status(dev, command_id, response.status)?;
+    dev_dbg!(dev, "cleanup: gfid={} done\n", gfid.get());
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 82c29dfb467a..1528cc56ce74 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -33,3 +33,12 @@
 
 pub(super) const GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK;
+
+pub(super) const GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK;
+
+pub(super) const GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE;
+
+pub(super) const GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index 0b4d03c5f0fc..a00f4d2affc7 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -210,7 +210,6 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
     }
 
     /// Invalidate the PTEs and release the communication mapping.
-    #[expect(dead_code)]
     pub(super) fn unmap(&mut self) -> Result {
         self.map.unmap()
     }
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index b2a0b25c0e15..bf02595590e1 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -31,6 +31,8 @@
 use super::{
     commands::{
         send_bootload,
+        send_cleanup,
+        send_shutdown,
         Dbdf, //
     },
     fw::commands::{
@@ -143,10 +145,12 @@ struct VgpuInstance<'gpu> {
     // Unmap the communication region before returning its slot and channel IDs.
     vram_slot: VgpuVramSlot,
     chids: ChannelIdReservation<'gpu>,
+    needs_teardown: bool,
+    /// An uncertain or failed operation retains resources until device removal.
+    failure: Option<Error>,
 }
 
 impl<'gpu> VgpuInstance<'gpu> {
-    #[expect(dead_code)]
     fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         let dev = vgpu.dev;
         self.bootload(dev, vgpu.cmdq, &vgpu.fifo_engine_list)?;
@@ -154,6 +158,26 @@ fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         Ok(())
     }
 
+    /// Tear down once, retaining all remaining resources if an operation fails.
+    fn teardown(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
+        if let Some(error) = self.failure {
+            return Err(error);
+        }
+        let result = (|| {
+            self.shutdown(vgpu.dev, vgpu.cmdq)?;
+
+            if self.needs_teardown {
+                send_cleanup(vgpu.dev, vgpu.cmdq, self.gfid)?;
+                self.needs_teardown = false;
+            }
+            self.comm.unmap()
+        })();
+        if let Err(error) = result {
+            self.failure = Some(error);
+        }
+        result
+    }
+
     /// Bootload the GSP vGPU plugin and wait for its BAR1 ready indication.
     fn bootload(
         &mut self,
@@ -192,6 +216,7 @@ fn bootload(
         );
 
         self.comm.clear_plugin_ready()?;
+        self.needs_teardown = true;
         send_bootload(dev, cmdq, &payload)?;
 
         wait_plugin_ready(dev, &self.comm)?;
@@ -199,6 +224,15 @@ fn bootload(
         dev_dbg!(dev, "bootload: gfid={} plugin ready\n", self.gfid.get());
         Ok(())
     }
+
+    /// Stop the plugin when firmware may own instance resources.
+    fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) -> Result {
+        if self.needs_teardown {
+            send_shutdown(dev, cmdq, self.gfid)?;
+            dev_dbg!(dev, "shutdown: gfid={} stopped\n", self.gfid.get());
+        }
+        Ok(())
+    }
 }
 
 /// Identity and firmware profile used to allocate an instance.
@@ -255,8 +289,12 @@ fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<
         Ok(slot)
     }
 
-    /// Allocate resources and register a new inactive vGPU instance.
-    fn allocate_instance(&mut self, vgpu: &VgpuManager<'gpu>, info: InstanceInfo) -> Result<Gfid> {
+    /// Register host resources before submitting any firmware work.
+    fn allocate_instance<'a>(
+        &'a mut self,
+        vgpu: &'a VgpuManager<'gpu>,
+        info: InstanceInfo,
+    ) -> Result<PendingInstance<'a, 'gpu>> {
         let InstanceInfo {
             gfid,
             dbdf,
@@ -316,23 +354,91 @@ fn allocate_instance(&mut self, vgpu: &VgpuManager<'gpu>, info: InstanceInfo) ->
             comm,
             vram_slot,
             chids,
+            needs_teardown: false,
+            failure: None,
         };
         self.instances
             .push_within_capacity(instance)
             .map_err(|_| EIO)?;
 
-        Ok(gfid)
+        Ok(PendingInstance {
+            instances: self,
+            vgpu,
+            gfid,
+            committed: false,
+        })
     }
 
-    /// Remove an instance and release its channel and VRAM reservations.
-    fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+    /// Remove an instance only after firmware and mapping teardown have succeeded.
+    fn destroy_instance(&mut self, vgpu: &VgpuManager<'gpu>, gfid: Gfid) -> Result {
         let instance_index = self
             .instances
             .iter()
             .position(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
+        let instance = self.instances.get_mut(instance_index).ok_or(EIO)?;
+        instance.teardown(vgpu)?;
+
         let instance = self.instances.remove(instance_index).map_err(|_| EIO)?;
         drop(instance);
         Ok(())
     }
+
+    /// Release the registry while the manager's MM and firmware dependencies remain available.
+    pub(super) fn release_all(&mut self, vgpu: &VgpuManager<'gpu>) {
+        for instance in &mut self.instances {
+            // Failed operations retain their resources until this final device removal.
+            // Do not resubmit commands whose firmware outcome was uncertain.
+            if instance.failure.is_none() {
+                if let Err(error) = instance.teardown(vgpu) {
+                    dev_err!(
+                        vgpu.dev,
+                        "vGPU teardown failed for gfid={}: {:?}\n",
+                        instance.gfid.get(),
+                        error,
+                    );
+                }
+            }
+        }
+        self.instances.clear();
+    }
+}
+
+/// Rolls back this creation attempt unless ownership has passed to the caller.
+struct PendingInstance<'a, 'gpu> {
+    instances: &'a mut VgpuInstances<'gpu>,
+    vgpu: &'a VgpuManager<'gpu>,
+    gfid: Gfid,
+    committed: bool,
+}
+
+#[expect(dead_code)]
+impl PendingInstance<'_, '_> {
+    fn activate(mut self) -> Result {
+        let instance = self
+            .instances
+            .instances
+            .iter_mut()
+            .find(|instance| instance.gfid == self.gfid)
+            .ok_or(EIO)?;
+        instance.activate(self.vgpu)?;
+        self.committed = true;
+        Ok(())
+    }
+}
+
+impl Drop for PendingInstance<'_, '_> {
+    fn drop(&mut self) {
+        if self.committed {
+            return;
+        }
+        if let Err(error) = self.instances.destroy_instance(self.vgpu, self.gfid) {
+            dev_err!(
+                self.vgpu.dev,
+                "vGPU creation could not release gfid={}: {:?}; resources retained until removal\n",
+                self.gfid.get(),
+                error,
+            );
+        }
+    }
 }
