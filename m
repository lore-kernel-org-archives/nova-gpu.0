Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010039.outbound.protection.outlook.com [52.101.193.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F3448B83
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595985; cv=fail; b=cjjyKXT1ctRH4+ozU0OfrK9gKc42pZy5C76yWhAVmjAXRz7BFPe1vR4PNZNSdNfG8rT7yPnrBbKYhHlGlRoP92uOmBxXtcjhGX597asjJxDwC32nhULrskONkC2Cb+xbdbTydFt/xIu7ZwZANCG4qgPbnIQ6dLvjHGmscPBkakg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595985; c=relaxed/simple;
	bh=Ui/SDB8vm2213PM62i1l9SBUSXCsGx4eBVPWStgcg7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkBYAm5lIlXwRE/NS3aaWR9bQVT/5/af4F/17088yWr17JFuvGCWIWDS2dan/2+IH28EJuDoBE1UfUu6VYU9++TssncMMrp7rB9MTeDoi9tVbw9h1ZkKg0LbwKRZMBdLaQVZenyLSHZ65Ob4DjS0XkLNhem8hB+EUrnN4NTdTv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z5IIyqvS; arc=fail smtp.client-ip=52.101.193.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z5IIyqvS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COu2plDyYB9FakhsYCndFVtySt/fwrOttyAP55vsIwD64u8aGDv9xTPQcfP9e80+ynvKwHJxaLvhCnAYhXh3sivRgUwbkKpxbpl4y77t6nmA5jAjRJytTAzLxXsvfFKCP2JenDYj7hDJOPWLJiqSbUq5NxvxZ/CReeUaOEEcTTjN3b3tq3ngDR9LpHGj9xxRVsv9CREeTvnUKQFauQUl9fTaZswWQre9aMRIvJ/d+Lme1M5n6h7i2WHU7prUb2yqTE/cbJoo3gwkm0H9odnqL/d7ULbGuH9Tnl2uv26YoF0UQGCWpubQNrrwLogPzfxlEpFvlKEMNmAt+x8sHiBVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ingBitExWoe4T8PPakYonJ/ti/6wrhvbHlllleknNyU=;
 b=P2U11+0L5inIEELGo4UxRBoR9Smj4Q1jTLKkIlL0icY/DwCXIgv4g44EXzv3cXIaqxoanuXbMAn/v1Jr6HUaZV1L3oadj0mnoRlvtFIFgVBS7cc80IxdvXQiF3muDNwLsWVSIXHf+3FeULqhuaAJgi/zwxO/KPDuO9jQVuQJnLZAqxiVBfY8qiPwJEoW2gOxV0fEm8F9IbdHPjHMmSsukVsojI9cBSBiTqDuK2HYVLOcNUglIjlgT1+a3i+CxPKej/7nu0FL2yk2VqPsk8blc29sOHcNocrdqWUsGSLiY2XuW6OornNnrogDQrRtwPJg/aNsdgCsNqsSuiG2FOjIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ingBitExWoe4T8PPakYonJ/ti/6wrhvbHlllleknNyU=;
 b=Z5IIyqvSqQ7euWjqK8awk0b4+jFeh8ZG1qIL6IcyWqu9HL9voiU/Zz68o5AtLl2nda/v8qGLWwjHL3gomvyepxe6bofZ3BgvXaCIEb5dGMVJ+WQsrzFI9gvBp41UvYccQ43tNoOdXV0/UmPERNlJE+Zt5q2Bzl2gUL8FnePafWO+lziN/HL5Z7Ra6WhsdgGjPq6x4OUC+H9+5Gygx7uSF6rTf09kl2iKDNJyTSrTCmBuyWKDV4FP0+i/ALAGkhI3kMZ5RB1WIjm8bcG9etj/R8sd5hCIMFk8gHNImgRj8IryTGIpOB/yHFAWS3WDjkwNI4Pe0XvqgJpoq93xiL9d1Q==
Received: from BN9P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::14)
 by CY5PR12MB6382.namprd12.prod.outlook.com (2603:10b6:930:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:12:41 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:13e:cafe::4a) by BN9P220CA0009.outlook.office365.com
 (2603:10b6:408:13e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:28 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:20 -0700
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
Subject: [PATCH 07/13] gpu: nova-core: vgpu: add vGPU bootload
Date: Sat, 5 Sep 2026 11:11:10 +0300
Message-ID: <20260905081116.106613-8-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|CY5PR12MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cf1baf-e2a0-4e0e-91d9-08df0b2574dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|7416014|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RrcJ/BLg7l5mdk8oR8AG/oNpQN4R6CyvEtE89t79X/p6DjYU/9KjVgNGAYX/CQE54ZbtYmDeLnsaLI61L3qtCM0vUjgKqiv0yHwf9Mo9wGcmshiXhQX9o+8E8HzZJoUPX9hSoW1y3o1DfmmmjfS5fKS0V/XO/iWD/41JbmE7jey0sKDFwRkL2HXIT9XPfWDddg7rUYiCUJOEgrX4Y1Sv9dzxYlaUN/dsoHR5+Oqvcg8HwD+TbH3sMSkF3Uqj9qbPO43SPuuy8Dv8QUL3z1udTyvpyvIWvBh+NxKfUxZGQpuWxmNkH/8rUruQyJaWYdtMNb5GNBIogOsq/zlVJbWsYlOc3mq7FmmD4QKOBfgiShVjAOfx+VmcFKjeDegBYLBx5pIiME/0fQJPA3EY2h7r2trDmlG3ZbPuZgtKawhvkMP8oyjddkS8s4iMxP9tI0VT/H6sFMwbjau23MMq+uQXOcs/69AAxusR5ANmZGas02CSYxBKJ/EMmBkhmmLKm8/8GYWSknwdP8tYs+fm27Vcw1uqUtVNUZlfVkZSpU4T+VB+WWZBlQbc27FIWQcFNeV3o5Jd7YDmQg4mptjuznhMIVjZcbaH9XlA/anee+e1GURJBqJmINaBoxR8yBagZpIhl+Jp1euMmEQgcw48B9Auafl+9rpTKL0Y/8HQKPUd266aTd74aCOw2z5dZwwKbf1sFV1vbJ9hZUvR3tB9xb+VbA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(7416014)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I6JgC3mNmloZFCrFMzqZOkEkkNqXudh2LcAhP9Nm+MdU1SDCdsruQ75xN8EZbc9YGcY0Zx4IlOUqDKKrHZFe8hdEikWAWGqlURrBxR6D+qviId0vVA6GMYibPMfcAVKohEcAd+ksryOdxMBpwAXcb+f8vD7mu7e/+o0upobv/stQ5bEc6PAM1E4EFwcKiEBhbmw/kaS7j2h/LTHVLaR0FWSxG/LAJi+TtLjcdgzZ4fm/81d0/ZU6n9Ii3JXJVCNDEnINpjRiMHH2LuinYA39l0O68EZYVbBGPUq5evsXXc/H6xhzi6lXoHq6N1MEvULTqxIDlyjXkqjgAWEeCHJfUwNAPdsUWxSoO1N6PnrNp0vk2EPI3VBL6cplLYKOV30uKwI2Kl82yt4msLl64OD872evQMbSHyiQubOf8tfc0BzTte6L2fJANIygj9kdrq1P
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:41.0337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf1baf-e2a0-4e0e-91d9-08df0b2574dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6382

Implement the GMCAPI VGPU_BOOTLOAD command that boots the GSP plugin
for a vGPU instance, together with the VGPU_SHUTDOWN and VGPU_CLEANUP
teardown sequence.

Encode the typed channel map, framebuffer, management heap and log
locations, then poll the PluginRpc BAR1 marker for boot completion.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    |   2 +
 drivers/gpu/nova-core/gsp/fw.rs          |  18 ++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  60 +++++++
 drivers/gpu/nova-core/mm/vram.rs         |   3 -
 drivers/gpu/nova-core/vgpu/bootload.rs   | 162 +++++++++++++++++++
 drivers/gpu/nova-core/vgpu/consts.rs     |   8 +
 drivers/gpu/nova-core/vgpu/fw.rs         | 193 +++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/instance.rs   | 100 ++++++++++--
 drivers/gpu/nova-core/vgpu/mod.rs        |   2 +
 drivers/gpu/nova-core/vgpu/plugin_rpc.rs |  65 ++++++++
 drivers/gpu/nova-core/vgpu/vram.rs       |   2 -
 11 files changed, 598 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/bootload.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/plugin_rpc.rs

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index bdb358a19738..481ec8e221ce 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -54,6 +54,8 @@
 };
 
 pub(crate) use fw::commands::{
+    encode_vgpu_bootload,
+    ChannelMapEntry,
     Dbdf,
     VgpuProperties, //
 };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f8c6fc5ea8a7..d68b790533af 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,8 +7,24 @@
 /// Raw firmware declarations used by vGPU management.
 pub(crate) mod vgpu_bindings {
     pub(crate) use super::r000_00::{
+        GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
+        GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
         GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
-        GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
+        GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
+        GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
+        GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE,
+        GSP_PLUGIN_BOOTLOADED,
+        VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
+        VGPU_CPU_GSP_CTRL_BUFF_REGION,
+        VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
     };
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 0603fbde172f..fe4a7af88ec7 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -537,6 +537,13 @@ pub(crate) struct ChannelMapEntry(u64) {
 
 impl ChannelMapEntry {
     const KEY: KeyId = 0x1001;
+
+    pub(crate) fn new(engine_type: usize, index: u32, chid_offset: u32) -> Result<Self> {
+        Self::zeroed()
+            .try_with_engine_type(u64::try_from(engine_type).map_err(|_| EOVERFLOW)?)
+            .and_then(|entry| entry.try_with_index(u64::from(index)))
+            .and_then(|entry| entry.try_with_chid_offset(u64::from(chid_offset)))
+    }
 }
 
 impl Encodeable for KVVec<ChannelMapEntry> {
@@ -611,6 +618,59 @@ impl VgpuBootloadRequest {
     const MIG_RM_HEAP_LENGTH_KEY: KeyId = 0x100E;
 }
 
+/// Encodes a `VGPU_BOOTLOAD` request using the typed NVKV schema.
+#[expect(clippy::too_many_arguments)]
+pub(crate) fn encode_vgpu_bootload(
+    dbdf: Dbdf,
+    gfid: u32,
+    vgpu_type: u32,
+    vm_pid: u32,
+    num_channels: u32,
+    num_plugin_channels: u32,
+    channel_mapping: KVVec<ChannelMapEntry>,
+    guest_fb_address: u64,
+    guest_fb_length: u64,
+    plugin_heap_address: u64,
+    plugin_heap_length: u64,
+    ctrl_buffer_offset: u64,
+    init_log_address: u64,
+    init_log_size: u64,
+    vgpu_log_address: u64,
+    vgpu_log_size: u64,
+    kernel_log_address: u64,
+    kernel_log_size: u64,
+) -> Result<KVVec<u64>> {
+    let request = VgpuBootloadRequest {
+        dbdf: dbdf.into(),
+        gfid: gfid.into(),
+        vgpu_type: vgpu_type.into(),
+        vm_pid: vm_pid.into(),
+        swizz_id: SwizzId::WHOLE_GPU.into(),
+        num_channels: num_channels.into(),
+        num_plugin_channels: num_plugin_channels.into(),
+        guest_fb_segment_count: 1.into(),
+        options: VgpuBootloadOptions::zeroed().into(),
+        channel_mapping,
+        guest_fb_segment_phys_addr: Array::new(&[guest_fb_address])?,
+        guest_fb_segment_length: Array::new(&[guest_fb_length])?,
+        plugin_heap_phys_addr: plugin_heap_address.into(),
+        plugin_heap_length: plugin_heap_length.into(),
+        ctrl_buff_offset: ctrl_buffer_offset.into(),
+        init_task_log_offset: init_log_address.into(),
+        init_task_log_size: init_log_size.into(),
+        vgpu_task_log_offset: vgpu_log_address.into(),
+        vgpu_task_log_size: vgpu_log_size.into(),
+        kernel_log_offset: kernel_log_address.into(),
+        kernel_log_size: kernel_log_size.into(),
+        mig_rm_heap_phys_addr: 0.into(),
+        mig_rm_heap_length: 0.into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
+
 // VGPU_MGMT_QUERY_PROPERTIES
 
 nvkv_decode! {
diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
index 87b7ce7f2c93..4a4bd42c9f18 100644
--- a/drivers/gpu/nova-core/mm/vram.rs
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -86,19 +86,16 @@ fn new(backing: Arc<VramBlock>, range: Range<u64>) -> Result<Self> {
     }
 
     /// Return the physical address of the first byte in this region.
-    #[expect(dead_code)]
     pub(crate) const fn address(&self) -> u64 {
         self.address
     }
 
     /// Return the region size in bytes.
-    #[expect(dead_code)]
     pub(crate) const fn size(&self) -> u64 {
         self.size
     }
 
     /// Return a checked subregion relative to this region.
-    #[expect(dead_code)]
     pub(crate) fn subregion(&self, range: Range<u64>) -> Result<Self> {
         let size = range
             .end
diff --git a/drivers/gpu/nova-core/vgpu/bootload.rs b/drivers/gpu/nova-core/vgpu/bootload.rs
new file mode 100644
index 000000000000..0d382af46158
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/bootload.rs
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::{
+    device,
+    prelude::*,
+    time::Delta,
+    transmute::AsBytes, //
+};
+
+use crate::{
+    driver::Bar0,
+    gsp::{
+        cmdq::Cmdq,
+        commands::{
+            encode_vgpu_bootload,
+            ChannelMapEntry,
+            FifoEngineList, //
+        },
+    },
+    vgpu::consts::gmc, //
+};
+
+use super::instance::{
+    Gfid,
+    VgpuInstance, //
+};
+
+/// Build the typed channel mapping from the GSP FIFO engine list.
+fn channel_mapping(
+    fifo_engine_list: &FifoEngineList,
+    chid_offset: u32,
+) -> Result<KVVec<ChannelMapEntry>> {
+    let mut mapping = KVVec::new();
+    for &gmc_id in &fifo_engine_list.gmc_ids[..fifo_engine_list.count] {
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
+/// Bootload the GSP vGPU plugin and wait for its BAR1 ready indication.
+pub(crate) fn bootload(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    instance: &VgpuInstance<'_>,
+    fifo_engine_list: &FifoEngineList,
+) -> Result {
+    let fb = &instance.vram_slot.fbmem;
+    let mgmt = &instance.vram_slot.mgmt_heap;
+    let logs = instance.plugin_rpc.plugin_logs()?;
+
+    let payload = encode_vgpu_bootload(
+        instance.dbdf,
+        instance.gfid.0,
+        instance.vgpu_type.vgpu_type_id(),
+        instance.vm_pid,
+        u32::try_from(instance.chids.len()).map_err(|_| EOVERFLOW)?,
+        instance.num_plugin_channels,
+        channel_mapping(
+            fifo_engine_list,
+            u32::try_from(instance.chids.start).map_err(|_| EOVERFLOW)?,
+        )?,
+        fb.address(),
+        fb.size(),
+        mgmt.address(),
+        mgmt.size(),
+        0,
+        logs.init().address(),
+        logs.init().size(),
+        logs.vgpu().address(),
+        logs.vgpu().size(),
+        logs.kernel().address(),
+        logs.kernel().size(),
+    )?;
+
+    dev_dbg!(
+        dev,
+        "bootload: gfid={} sending {} typed NVKV bytes\n",
+        instance.gfid.0,
+        payload.len() * size_of::<u64>(),
+    );
+
+    // BOOTLOAD completes synchronously. The receive path dispatches any RM RPC
+    // frames that arrive before matching the response by command and sequence.
+    let response = cmdq.send_gmc_and_receive_timeout(
+        bar,
+        gmc::BOOTLOAD,
+        AsBytes::as_bytes(payload.as_slice()),
+        0,
+        Delta::from_secs(10),
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+
+    instance.plugin_rpc.wait_plugin_ready(dev)?;
+
+    dev_dbg!(dev, "bootload: gfid={} plugin ready\n", instance.gfid.0);
+    Ok(())
+}
+
+/// Shut down a vGPU plugin task and wait for its completion event.
+pub(crate) fn shutdown(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    gfid: Gfid,
+) -> Result {
+    let payload = gfid.0.to_le_bytes();
+
+    cmdq.send_gmc_and_wait_event(
+        bar,
+        gmc::SHUTDOWN,
+        &payload,
+        Delta::from_secs(10),
+        |command_id, status, _sequence, payload_0, payload_1| {
+            if command_id != gmc::SHUTDOWN_COMPLETE
+                || !payload
+                    .iter()
+                    .copied()
+                    .eq(Iterator::chain(payload_0.iter(), payload_1.iter())
+                        .take(payload.len())
+                        .copied())
+            {
+                return Ok(false);
+            }
+            if status != 0 {
+                return Err(EIO);
+            }
+            Ok(true)
+        },
+        |command_id, status, _sequence, _payload_0, _payload_1| {
+            dev_dbg!(
+                dev,
+                "shutdown: ignoring unrelated event command={:#x} status={:#x}\n",
+                command_id,
+                status,
+            );
+            Ok(())
+        },
+    )?;
+    dev_dbg!(dev, "shutdown: gfid={} stopped\n", gfid.0);
+    Ok(())
+}
+
+/// Release firmware resources after a plugin task has stopped.
+pub(crate) fn cleanup(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    gfid: Gfid,
+) -> Result {
+    cmdq.send_gmc_and_check_status(bar, gmc::CLEANUP, &gfid.0.to_le_bytes())?;
+    dev_dbg!(dev, "cleanup: gfid={} done\n", gfid.0);
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/vgpu/consts.rs b/drivers/gpu/nova-core/vgpu/consts.rs
index 7ec577ec12f2..2ebbf2a0daa3 100644
--- a/drivers/gpu/nova-core/vgpu/consts.rs
+++ b/drivers/gpu/nova-core/vgpu/consts.rs
@@ -9,4 +9,12 @@ pub(crate) mod gmc {
         bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
     pub(crate) const VGPU_MGMT_QUERY_ASSIGNED_VF: u32 =
         bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
+    pub(crate) const BOOTLOAD: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK;
+    pub(crate) const SHUTDOWN: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK;
+    pub(crate) const SHUTDOWN_COMPLETE: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE;
+    pub(crate) const CLEANUP: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
 }
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index edfb0f984b6d..3cd77f0cd62e 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -1,2 +1,195 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::prelude::*;
+
+use crate::{
+    gsp::vgpu_bindings as bindings,
+    mm::{
+        bar_user::{
+            Bar1Map,
+            BarUser, //
+        },
+        vram::VramRegion,
+        GpuMm, //
+    },
+};
+
+type RawControlRegion = bindings::VGPU_CPU_GSP_CTRL_BUFF_REGION;
+
+/// Physical VRAM regions containing the vGPU plugin logs.
+pub(crate) struct PluginLogRegions {
+    init: VramRegion,
+    vgpu: VramRegion,
+    kernel: VramRegion,
+}
+
+impl PluginLogRegions {
+    /// Return the init-task log region.
+    pub(crate) const fn init(&self) -> &VramRegion {
+        &self.init
+    }
+
+    /// Return the vGPU-task log region.
+    pub(crate) const fn vgpu(&self) -> &VramRegion {
+        &self.vgpu
+    }
+
+    /// Return the kernel-task log region.
+    pub(crate) const fn kernel(&self) -> &VramRegion {
+        &self.kernel
+    }
+}
+
+/// Take the next firmware-defined subregion from a communication buffer.
+fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramRegion> {
+    let end = cursor.checked_add(u64::from(size)).ok_or(EOVERFLOW)?;
+    let subregion = region.subregion(*cursor..end)?;
+    *cursor = end;
+    Ok(subregion)
+}
+
+/// BAR1 mapping and semantic regions of a vGPU CPU-GSP communication buffer.
+///
+/// The host and GSP plugin exchange control, response, message, migration,
+/// error, and diagnostic data through firmware-defined subregions of the
+/// management heap. Firmware accesses that VRAM directly; the host accesses
+/// the same storage through the owned BAR1 mapping.
+///
+/// The firmware bindings define each subregion's size and order, but are used
+/// only to describe the layout. Field accesses must use the BAR1 I/O accessors
+/// because bindgen does not preserve C `volatile` semantics. Keep this object
+/// alive while the plugin or a host reader can use the buffer, then consume it
+/// with [`Self::destroy`] after those users have stopped.
+pub(crate) struct CommBufferRegion<'gpu> {
+    map: Bar1Map<'gpu>,
+    control: VramRegion,
+    init_log: VramRegion,
+    vgpu_log: VramRegion,
+    kernel_log: VramRegion,
+}
+
+impl<'gpu> CommBufferRegion<'gpu> {
+    /// Map the communication portion of a plugin management heap.
+    pub(crate) fn new(
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        management_heap: &VramRegion,
+    ) -> Result<Self> {
+        let total_size = u64::from(bindings::VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE);
+        let region = management_heap.subregion(0..total_size)?;
+        let mut cursor = 0;
+
+        let control = take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
+        )?;
+        let init_log = take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        let vgpu_log = take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        let kernel_log = take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            bindings::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
+        )?;
+
+        if cursor != total_size || control.size() != u64::try_from(size_of::<RawControlRegion>())? {
+            return Err(EINVAL);
+        }
+
+        let map = Bar1Map::new(bar_user, mm, region, true)?;
+
+        Ok(Self {
+            map,
+            control,
+            init_log,
+            vgpu_log,
+            kernel_log,
+        })
+    }
+
+    fn region_offset(&self, region: &VramRegion) -> Result<usize> {
+        let offset = region
+            .address()
+            .checked_sub(self.map.region().address())
+            .ok_or(EINVAL)?;
+        if offset.checked_add(region.size()).ok_or(EOVERFLOW)? > self.map.region().size() {
+            return Err(EINVAL);
+        }
+
+        usize::try_from(offset).map_err(|_| EOVERFLOW)
+    }
+
+    fn io_offset(&self, region: &VramRegion, field: usize, width: usize) -> Result<usize> {
+        let field_end = field.checked_add(width).ok_or(EOVERFLOW)?;
+        if u64::try_from(field_end).map_err(|_| EOVERFLOW)? > region.size() {
+            return Err(EINVAL);
+        }
+
+        self.region_offset(region)?
+            .checked_add(field)
+            .ok_or(EOVERFLOW)
+    }
+
+    fn read_u32(&self, region: &VramRegion, field: usize) -> Result<u32> {
+        self.map
+            .try_read32(self.io_offset(region, field, size_of::<u32>())?)
+    }
+
+    /// Return the physical regions occupied by the three plugin logs.
+    pub(crate) fn plugin_logs(&self) -> Result<PluginLogRegions> {
+        Ok(PluginLogRegions {
+            init: self.init_log.clone(),
+            vgpu: self.vgpu_log.clone(),
+            kernel: self.kernel_log.clone(),
+        })
+    }
+
+    /// Return whether firmware has published the plugin boot marker.
+    pub(crate) fn is_plugin_ready(&self) -> Result<bool> {
+        let value = self.read_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+        )?;
+
+        Ok(value == bindings::GSP_PLUGIN_BOOTLOADED)
+    }
+
+    /// Invalidate the PTEs and release the communication mapping.
+    pub(crate) fn destroy(self, bar_user: &BarUser<'gpu>, mm: &mut GpuMm<'_>) -> Result {
+        self.map.destroy(bar_user, mm)
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index ed304945330a..834b647e254a 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -4,6 +4,7 @@
 use core::num::NonZeroUsize;
 
 use kernel::{
+    device,
     prelude::*,
     ptr::Alignment,
     sizes::SizeConstants, //
@@ -17,12 +18,23 @@
         commands::{
             decode_vgpu_properties,
             Dbdf,
+            FifoEngineList,
             VgpuProperties, //
         },
     },
-    mm::GpuMm,
+    mm::{
+        bar_user::BarUser,
+        GpuMm, //
+    },
     vgpu::{
+        bootload::{
+            bootload,
+            cleanup,
+            shutdown, //
+        },
         consts::gmc,
+        fw::CommBufferRegion,
+        plugin_rpc::PluginRpc,
         vram::{
             VgpuVramLayout,
             VgpuVramSlot,
@@ -59,6 +71,10 @@ pub(crate) struct VgpuType {
 }
 
 impl VgpuType {
+    pub(crate) const fn vgpu_type_id(&self) -> u32 {
+        self.vgpu_type_id
+    }
+
     fn from_properties(properties: &VgpuProperties) -> Self {
         let mut name = [0; 64];
         let name_len = properties.name.len().min(name.len());
@@ -99,6 +115,24 @@ pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) chids: ChannelIdReservation<'gpu>,
     pub(crate) num_plugin_channels: u32,
     pub(crate) vram_slot: VgpuVramSlot,
+    pub(crate) plugin_rpc: PluginRpc<'gpu>,
+}
+
+impl<'gpu> VgpuInstance<'gpu> {
+    /// Unmap the plugin communication buffer and return the slot release token.
+    fn unmap_and_take_slot(
+        self,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+    ) -> Result<VgpuVramSlot> {
+        let Self {
+            plugin_rpc,
+            vram_slot,
+            ..
+        } = self;
+        plugin_rpc.destroy(bar_user, mm)?;
+        Ok(vram_slot)
+    }
 }
 
 /// Identity and firmware profile used to allocate an instance.
@@ -166,10 +200,13 @@ fn release_vram_slot(&mut self, slot: VgpuVramSlot) {
         allocator.release(slot);
     }
 
-    /// Allocate resources and register a new inactive vGPU instance.
+    /// Allocate resources, map the management communication region, and
+    /// register a new inactive vGPU instance.
     pub(crate) fn allocate_instance(
         &mut self,
-        mm: &GpuMm<'_>,
+        dev: &device::Device<device::Bound>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
         vgpu: &VgpuManager<'gpu>,
         info: InstanceInfo,
     ) -> Result<Gfid> {
@@ -220,6 +257,21 @@ pub(crate) fn allocate_instance(
             fb_align: vgpu.vmmu_segment_size().ok_or(ENODEV)?,
         };
         let vram_slot = self.alloc_vram_slot(mm, layout)?;
+        let comm = match CommBufferRegion::new(bar_user, mm, &vram_slot.mgmt_heap) {
+            Ok(comm) => comm,
+            Err(error) => {
+                // A failed page-table update may have installed a partial mapping without
+                // returning a handle that can unmap it. Keep the slot reserved so its backing
+                // VRAM cannot be reused while stale BAR1 PTEs may still reference it.
+                dev_err!(
+                    dev,
+                    "allocate_instance: retaining slot {} after BAR1 map error {:?}\n",
+                    vram_slot.index(),
+                    error,
+                );
+                return Err(error);
+            }
+        };
 
         let instance = VgpuInstance {
             gfid,
@@ -229,26 +281,40 @@ pub(crate) fn allocate_instance(
             chids,
             num_plugin_channels: 3,
             vram_slot,
+            plugin_rpc: PluginRpc::new(comm),
         };
         match self.instances.push_within_capacity(instance) {
             Ok(()) => Ok(gfid),
-            Err(error) => {
-                let VgpuInstance { vram_slot, .. } = error.0;
-                self.release_vram_slot(vram_slot);
-                Err(EIO)
-            }
+            Err(error) => match error.0.unmap_and_take_slot(bar_user, mm) {
+                Ok(vram_slot) => {
+                    self.release_vram_slot(vram_slot);
+                    Err(EIO)
+                }
+                Err(error) => Err(error),
+            },
         }
     }
 
-    /// Remove an instance and release its channel and VRAM reservations.
-    pub(crate) fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+    /// Shut down and remove an instance, then release its reservations.
+    pub(crate) fn destroy_instance(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        gfid: Gfid,
+    ) -> Result {
         let index = self
             .instances
             .iter()
             .position(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
+
+        shutdown(dev, cmdq, bar, gfid)?;
+        cleanup(dev, cmdq, bar, gfid)?;
         let instance = self.instances.remove(index).map_err(|_| EIO)?;
-        let VgpuInstance { vram_slot, .. } = instance;
+        let vram_slot = instance.unmap_and_take_slot(bar_user, mm)?;
         self.release_vram_slot(vram_slot);
         Ok(())
     }
@@ -286,3 +352,15 @@ pub(crate) fn query_vgpu_type(cmdq: &Cmdq, bar: Bar0<'_>, type_id: u32) -> Resul
     }
     Ok(VgpuType::from_properties(&properties))
 }
+
+/// Bootload the GSP plugin for an allocated instance.
+#[expect(dead_code)]
+pub(crate) fn activate_instance(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    instance: &mut VgpuInstance<'_>,
+    fifo_engine_list: &FifoEngineList,
+) -> Result {
+    bootload(dev, cmdq, bar, instance, fifo_engine_list)
+}
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index 320230ddd1dd..1c67d7afbe56 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -3,8 +3,10 @@
 
 use core::num::NonZero;
 
+pub(crate) mod bootload;
 pub(crate) mod consts;
 pub(crate) mod instance;
+pub(crate) mod plugin_rpc;
 
 pub(crate) use self::instance::VgpuInstances;
 
diff --git a/drivers/gpu/nova-core/vgpu/plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
new file mode 100644
index 000000000000..d6077a468672
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+    mm::{
+        bar_user::BarUser,
+        GpuMm, //
+    },
+    vgpu::fw::{
+        CommBufferRegion,
+        PluginLogRegions, //
+    },
+};
+
+/// Host-side ready limit from `vmiopd_negotiate_cpu_gsp_version()` in
+/// `vmiop-vgpu.c`, which polls the same boot marker for 10 seconds.
+const PLUGIN_READY_TIMEOUT: Delta = Delta::from_secs(10);
+
+/// BAR1-backed channel used to communicate with the vGPU plugin.
+pub(crate) struct PluginRpc<'gpu> {
+    comm: CommBufferRegion<'gpu>,
+}
+
+impl<'gpu> PluginRpc<'gpu> {
+    pub(crate) fn new(comm: CommBufferRegion<'gpu>) -> Self {
+        Self { comm }
+    }
+
+    /// Return the physical regions occupied by the plugin logs.
+    pub(crate) fn plugin_logs(&self) -> Result<PluginLogRegions> {
+        self.comm.plugin_logs()
+    }
+
+    /// Poll the control buffer until the plugin publishes its boot marker.
+    pub(crate) fn wait_plugin_ready(&self, dev: &device::Device<device::Bound>) -> Result {
+        let start = Instant::<Monotonic>::now();
+
+        loop {
+            if self.comm.is_plugin_ready()? {
+                dev_dbg!(dev, "vGPU plugin ready after {:?}\n", start.elapsed());
+                return Ok(());
+            }
+            if start.elapsed() >= PLUGIN_READY_TIMEOUT {
+                return Err(ETIMEDOUT);
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    }
+
+    /// Release the BAR1 mapping.
+    pub(crate) fn destroy(self, bar_user: &BarUser<'gpu>, mm: &mut GpuMm<'_>) -> Result {
+        self.comm.destroy(bar_user, mm)
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/vram.rs b/drivers/gpu/nova-core/vgpu/vram.rs
index c646511b6fd6..bc7283abba29 100644
--- a/drivers/gpu/nova-core/vgpu/vram.rs
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -3,8 +3,6 @@
 
 //! VRAM slot allocation for vGPU instances.
 
-#![expect(dead_code)]
-
 use kernel::{
     bitmap::BitmapVec,
     prelude::*,
-- 
2.53.0

