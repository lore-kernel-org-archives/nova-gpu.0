Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B253E95B2
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372385; cv=fail; b=YxHqH6RT73tOYeFvz04mxpZOLNd/zP03ge1Al8SPqIDB3/3colVomfi4UyyqxHZuBJcxnmIBML11wpnjOjW3QfYnm8Cmd2fp1fMxDyRg2L7d0tEgOejVqLq88PEKYLF/SlRBrCLkCzZmswDr/3HzsvcKpKg6v/5A87rkWapHYxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372385; c=relaxed/simple;
	bh=Fc553FH0QBSxhAtg0hPd5kwEgiEjQE61tXXO5WjSwSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ge2CT8o96VKIB9STT9ofyUQa0SJmv508ABo4/GXPo/B+Oavf40gdQo3DWOQIMkvuBop7qnaALNYvbGt8wIRFPtwl5zhUiNUZGrFRTC/tLDle0QiMxJ4KEDFKrbsAysAD5M1nbhsOsWmvUXGawiTnzlQtBZTjvd1AQp0SQH7UmU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UrRRovCj; arc=fail smtp.client-ip=52.101.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UrRRovCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuBPYkrLI86a4uHJo+/kdJOre67Fwgd7/hCvQKGnDIslfKWM1H8XOJah31nqsQz6OZZMpAPDmXANGOuE/cqu5a4Z26xHYqW7r7SwyZQRnLMYSSnr4ZH2rXEX4MhThLHyipAe8FoUSzlm1XBzDDsiUBa0xhuvgjRYInXMekJcUkXmt7bQkOeI5Ht1NWVQFiiUhxaB17o+tDNpH7OrWgb2hn6D9Z4211/f1AgmUDDJso+Rye/bi5VCQkM/D6zZplURnEJlKG4g5rROxZjE/7x7bbvAbCqAIjcMz8caUcLln8r+GKPSWfkkK15jOcfvriwLlen0kUiwdpOYZjb1w89mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIrtK84VxfQ3zxDzUlxyb1aygxwXtDmcvLsxRAA6HLY=;
 b=VfpPX4ZdcvvOSWqK0rN9tK65i24DEiwOw3MlTE1rLc1iQe0Q7H+plgwHeB/YISZuqazS8VMKYvjPTzO8NAtzONnHZtvgvw/C43cNTVIgZW+HJgQNduFOoHBXFapW1foHhvZepjq5ejNC7rvQO+0DABW0zqaX3zIPx1RexCWtZcYh+ezuDLl55QRw2BT16hBxh+iQqNiv3Qo0tfi/ZX8Lb938os2CyGfpmdpGytSgG0VZCUAxuaUSJg7oLtYFZQT3kb/mN7f/+FiheOsOBzdrzFHYkzmAWM2etOOEuO7cq+kOsN9d1AyXoW1Ul6IOjX6cPzaWryOjY5BdSr7WXuepTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIrtK84VxfQ3zxDzUlxyb1aygxwXtDmcvLsxRAA6HLY=;
 b=UrRRovCjxNbVKiyeYOzO2fm6fakTU5PsUI8QH1m7vkinQHL+m9L8n+hjH5hmYUfMpBqnBbvrmR6Tnd+zTb4ThJWGye4WO+uTIBGBvSiH+rgBYov/WMCYDXeRrU0DEi0arXq1tY0W6Jjz3oEdNitoh1v19C88l2LCjAJjN+W9holGUyXr1IHMWkwsQQPcTrxLvQppfGEkFV10HSm6o5E75hLHgcylcX27rVz26EjY6fuponjsWbR/fudvTn7iqdkJ/DcaWN52LyKNTWu7GsI4XpAprEgJGRcmsRAMv63zzITZGsvnHNcoPE4ffWQt2wwG/exeYvnqmjHeasAjMMJATA==
Received: from BLAPR03CA0060.namprd03.prod.outlook.com (2603:10b6:208:32d::35)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:52:55 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::62) by BLAPR03CA0060.outlook.office365.com
 (2603:10b6:208:32d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon,
 14 Sep 2026 07:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:30 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:23 -0700
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
Subject: [PATCH v2 23/32] gpu: nova-core: vgpu: add GSP plugin communication buffers
Date: Mon, 14 Sep 2026 10:48:58 +0300
Message-ID: <20260914074907.1399629-24-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 1127b997-4138-44bd-35e5-08df12352fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CfQ435tNDFdcrzNS96JomNv3K8PAHjpVPmmQ/ii3FZON3q9wXyPOqb8VnwhYZ9220LASBrsViZ3mbqeIf1/7wcANr5fP1PIYf4btWRZl0ZD0VcZec4cFMZ8Zv21k/p+Qii+DaHFWOk1qCpWTIf0N3GcNoFQvbfMBindy8tEX/etKKysavyt2RSm3Cqi5D1QODS6axZtp5nZhO9BSp3QjcZI0zf0vUzgaEzE0gU+KfHSyoxihbJ1E0gMnmcnuqiN7GA7vIxYH4YN/gDTkl/58BTZA8KggeeRJeM2ASN7cttVJO/6/lWfl6j/nqa1oykTSXQXLI/tqNYXHXfeORUuYejhBKFWf2vXvaT7Uy8teFmMVOz5s4Yxk8Bv8/BtCGHx6SViqGRtzjo10WZAhcEEfMQWCsqvnoFesNjDzkficGsmVwlRvgst8CVZPpYkwRUvU77Q87Eo3M6ghZXesp0wld/eE9d1HMXD1wc7zg1ynmjMyDdlNlpzq2qTBVjv+dsDLMW8bHVv5tTeDrwzGAr4KM6B0YE/g1u7D/O1kjl4L278Z6nyijoht+S2Dmr3KVKrvQ/YIoJ4R2bxngUJAeHnCGPIUkHEuSW2x2LTJEDyXrzPIy+oPUkRIKzu2J0REJ/h5pYuqOd77fWkkbZ4DUL+Oi0bakkExjVLadtEXwQ5+r8ssvjWJjL2vgZ/OhXV81s1YIJrSSHFD97p3h0k75fn6kA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1f3y/2OU/aUcb5KMkWUs9/ITM5gOYDNl6lgmTuvp2JyidtxSUBg4bOrB/YkzHRlhQX/LNKKLLcOx4bLABI9dfG8fi8qTOZAxN+t3qeHo2Icos/Aqcp1qakTSOQccwtZsViHVWP3qyeTJNi11GfHAOERZ/Wrn/5reYc2wRecOeA29gxaHMb9ggXnMfWbX9/K1hwQA6p7kOh14LuTNFb4Xn2Sjps5TQ/LSTIy7tkDocAXz98dWl6wMtNG5eXGrI+pUyYr9XhjFttJaIny4M2Uolz6CbeSmaqDJpF5IGqPqsg81IWVoppdHC7QTCwL26W8Qa1jGWg/2N3wCeoM1V8JiOgbLaprJrwFACaKnPPIET6SOj8wH3DnhH+9rlL06xHOfBxJSRoHTXNirBMsvOOihlqfVQSPknEwb8be88b/hRwLCnopPOvw08eFud0fX809i
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:55.4146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1127b997-4138-44bd-35e5-08df12352fe5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279

The GSP plugin uses a communication region in its management heap for
control data and logs. The vGPU manager reads its boot-ready marker through
BAR1.

Map this region with BarMapping and expose the firmware-defined control
and log regions. Keep the mapping's BarUser borrow until explicit teardown.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs                   |   1 -
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/fw.rs              |  15 ++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 204 ++++++++++++++++++
 4 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 016d99608aeb..d1cad5ad52fc 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -67,7 +67,6 @@ macro_rules! impl_pfn_bounded {
 mod regs;
 pub(super) mod tlb;
 pub(super) mod vmm;
-#[expect(dead_code)]
 pub(crate) mod vram;
 
 /// GPU Memory Manager - owns all core MM components.
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index f3e40e6de6f0..8919322dc057 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -24,6 +24,7 @@
 
 mod commands;
 mod fw;
+mod gsp_plugin_comm;
 mod hal;
 mod instance;
 mod vram;
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 23097cb13121..aabe114b55c2 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -10,6 +10,21 @@
 
 use crate::gsp::bindings;
 
+pub(super) use bindings::{
+    GSP_PLUGIN_BOOTLOADED,
+    VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
+    VGPU_CPU_GSP_CTRL_BUFF_REGION as RawControlRegion,
+    VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
+};
+
 pub(super) const GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
 
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
new file mode 100644
index 000000000000..d2139309b6be
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin communication buffer mappings and access.
+
+use kernel::prelude::*;
+
+use crate::mm::{
+    bar_user::{
+        BarMapping,
+        BarUser, //
+    },
+    vram::VramRegion,
+    GpuMm, //
+};
+
+use super::fw::{
+    self,
+    RawControlRegion, //
+};
+
+/// Physical VRAM regions containing the vGPU plugin logs.
+pub(super) struct PluginLogRegions {
+    init: VramRegion,
+    vgpu: VramRegion,
+    kernel: VramRegion,
+}
+
+#[expect(dead_code)]
+impl PluginLogRegions {
+    pub(super) const fn init(&self) -> &VramRegion {
+        &self.init
+    }
+
+    pub(super) const fn vgpu(&self) -> &VramRegion {
+        &self.vgpu
+    }
+
+    pub(super) const fn kernel(&self) -> &VramRegion {
+        &self.kernel
+    }
+}
+
+fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramRegion> {
+    let end = cursor.checked_add(u64::from(size)).ok_or(EOVERFLOW)?;
+    let subregion = region.subregion(*cursor..end)?;
+    *cursor = end;
+    Ok(subregion)
+}
+
+/// BAR1 mapping of the plugin communication region in its management heap.
+///
+/// r000 layout, with byte offsets from the management heap (not to scale):
+///
+/// ```text
+/// 0x000000 +----------------------------------------+
+///          | Control (boot-ready marker)      4 KiB |
+/// 0x001000 +----------------------------------------+
+///          | Response                         4 KiB |
+/// 0x002000 +----------------------------------------+
+///          | Message                          4 KiB |
+/// 0x003000 +----------------------------------------+
+///          | Migration                        2 MiB |
+/// 0x203000 +----------------------------------------+
+///          | Error                            4 KiB |
+/// 0x204000 +----------------------------------------+
+///          | Init task log                  128 KiB |
+/// 0x224000 +----------------------------------------+
+///          | vGPU task log                  256 KiB |
+/// 0x264000 +----------------------------------------+
+///          | Kernel task log                 64 KiB |
+/// 0x274000 +----------------------------------------+
+///          | Guest RPC trace                 64 KiB |
+/// 0x284000 +----------------------------------------+
+/// ```
+pub(super) struct CommBufferRegion<'map, 'gpu> {
+    map: BarMapping<'map, 'gpu>,
+    control: VramRegion,
+    init_log: VramRegion,
+    vgpu_log: VramRegion,
+    kernel_log: VramRegion,
+}
+
+#[expect(dead_code)]
+impl<'map, 'gpu> CommBufferRegion<'map, 'gpu> {
+    /// Map the communication portion of a plugin management heap.
+    pub(super) fn new(
+        bar_user: &'map BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        management_heap: &VramRegion,
+    ) -> Result<Self> {
+        let total_size = u64::from(fw::VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE);
+        let region = management_heap.subregion(0..total_size)?;
+        let mut cursor = 0;
+
+        let control = take_region(&region, &mut cursor, fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)?;
+        take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
+        )?;
+        let init_log = take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        let vgpu_log = take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        let kernel_log = take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
+        )?;
+        take_region(
+            &region,
+            &mut cursor,
+            fw::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
+        )?;
+
+        if cursor != total_size || control.size() != u64::try_from(size_of::<RawControlRegion>())? {
+            return Err(EINVAL);
+        }
+
+        let map = BarMapping::new(bar_user, mm, region, true)?;
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
+    pub(super) fn plugin_logs(&self) -> PluginLogRegions {
+        PluginLogRegions {
+            init: self.init_log.clone(),
+            vgpu: self.vgpu_log.clone(),
+            kernel: self.kernel_log.clone(),
+        }
+    }
+
+    /// Return whether firmware has published the plugin boot marker.
+    pub(super) fn is_plugin_ready(&self) -> Result<bool> {
+        let value = self.read_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+        )?;
+
+        Ok(value == fw::GSP_PLUGIN_BOOTLOADED)
+    }
+
+    /// Invalidate the PTEs and release the communication mapping.
+    pub(super) fn destroy(self, mm: &mut GpuMm<'_>) -> Result {
+        self.map.destroy(mm)
+    }
+}
