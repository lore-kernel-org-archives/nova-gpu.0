Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E643C2BA4
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591527; cv=fail; b=kMVC6yaoE1d1FZCp89SYrEOyoRWAMn7D76TJsoi2psEX1wxuWp3Vp3lehIPL2NA+iQVv1xCkM1gNUeAbGDSYAuxPrwRkuJfzp4pOWc8Rk+Z9jvOyuWA8Jt04uY+OfbaAdkxbEhcT3ObjhHUQ2kTTTds/xzQC+H/uZVQyO4TOrA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591527; c=relaxed/simple;
	bh=R5LNdhq+UaAQ4mPIHeej/cMGT5G2s4ZFqlqeo7nOFA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2LK4uwSsVr6It2FBfgrb3YTTOqs/sOsIYGAA3BYpwdl7xu0CyhZKppAYdCrryrryza9BChtqVlJWEoXIJYgK2VGiP3Js0LdWLXguoR15eHcUdxdgeAS7B16BhZcAMC+NEsIbC3XiSzGdeYROlrmf86K3Ypd3FEeth/DFjev8f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nso9R09F; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nso9R09F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmTpB8GvaB4e/ucUrk4LGOVOwmLGAdeUFxA5QiGz4u2+aqGKUNTBSZCfqvemSEHk+Wgu+PwizgvEcsUeBj1AToY87bBwENs+MzYg8XzcWyDe29itZvWL/32GIdVlZwZ+Ziw49k9tH+xVwgrh7HmMWARUvK/BBaT1T417j6jtZVRY6sHBTYB+aaSF9Z17B6uhtgpLb2lQeN3dnPmJLV7vay9NGlO6nraHPIpJl2TCPG+ynBOrtaRmfHbZZrWs8Eku/CLjjjgSVcrUxnPhjK7Do+BsovJdNjjer0VG8W5R6j1iq+ShIsO+EwgZgpCf49UUBuhKQkonwXVKXaELrWacYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YnDHg7Gb+wVHy6hkTqEhioCfUpqq8ibg6qgk71C0Og=;
 b=ZrspJxeR6sVsCn4gHOFwLU8YLeDVufpKbPE6Epxy+A7VvhvC4cQscPRmKbMNJUt8qgM8zdfHFO7St1ipV9Y4GfZoT0BsfNePHQLfWcsgfjrGRE1F6Zzyd4ZWsGvKFcDeegRb6oNJ7I1TnGFUdPgcmaXnfm1eitO6+Yls1xkuBv7JxptqoDw1mXVCsI/bzk8StcbDgRCAjKW0rOpRr26TRz7F+1MbTlk+kPnQR2Pc7yMWKp5pmXCZtxPCZzKIpaygjSqxo0bSsYYfC29AaXwU+dNqv4Ayb0+uG3Ahu97o/IUt5R0l8MF/5Dix+wF6QnPCGLygLNwARb7QnxeQsLKsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YnDHg7Gb+wVHy6hkTqEhioCfUpqq8ibg6qgk71C0Og=;
 b=Nso9R09FCa72UCXbdMHlu8qfeK8KERiVyJFlyGjLHFO2Dftu8fdnTtHOUQpArIu8HsWZtMsdZe6IXl0KkazWIMtYdqyUTO65yItcaIpW48dCKClYtZQ6b1HaAvoKULKUGtfoKWm5Sx3HCyL3vSrZV6HnB6snWGE7ivjg4BLtlJAMiGG2osL0Uwyh+Ae7Zbun5gURBauhlXhm/3CDIv43CAOzJFYx34iHLxSnEG9/OpbeWFGBHOiUsa0AlQJYWfeKD7wDM5oag2y8E3F5pkmGIXFeHzlKk/IbVFwZwIMK/sKdX6WrMc6gQECGkHQ8Mq3kSIb7ByUJ0dbp6DhtX3fwJQ==
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by CH4PR12MB720178.namprd12.prod.outlook.com (2603:10b6:610:50e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:31:57 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::3b) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:40 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:40 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:31 -0700
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
Subject: [PATCH v3 20/31] gpu: nova-core: vgpu: add GSP plugin communication buffers
Date: Mon, 28 Sep 2026 13:28:23 +0300
Message-ID: <4cf544d3bdb06c9f39273699941de9c345c46ec6.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|CH4PR12MB720178:EE_
X-MS-Office365-Filtering-Correlation-Id: 39063c6f-1625-496d-5d0d-08df1d4bb906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kSHOJM2RwQiVNfhYJCIegFB57OSiry1dIS4lp/8AQiKTWTnpOYlh17akNbCEGxD04IuTA+5G3sRXxYJpjq+sOdZxn7wbUNOiC5qmPNm/KNM28iaKNQyeCq0ZvZtVlK0ivbElajWFTg9ufmh0uXvXg/THd3PD2DMFw2f9XqXwwGY6VlyOuLp8nIUj15PCSdU7GzQBR4271Ip8r+ot+L0h+cA0eOPpvhvalNJKYEV3/dezwaC/Ps+o7I6od1bLB5UDr60JirL61AMicSPivbj04f6S6s7nXiiWfoXeb2aoTq39bBkwPx1tLzb+xgGOt+gaG7V6X8XEORVWduA6VP5S/CCXW7IIWmOtMaSeSHz2PnbpQ+paKAyu03Tj36Zi0tjKHzNG4LBJAA0oHVFZETqgUmTKP8PEO0JdqpJ/gUUsJryTz74JUGvXFtVWl12tv/B6m4JoXhhW4os81J1TPct1wuCRowZCzx6j/8e3fhMDdX/IxtKdeoDuQNDYZ6aa7BOyoNihshsPBEAu9ckOZeFQkoEE+F4UN6G3G6uKw8lB2r5Pe1sC4L1sc/tfe4eeFS6faVRVxkSETskfRAGp4aH7BAFeCvl2L3M+7pFIk86P9tgBiUWhEPERcb4/UVHReCT1vbfQO3kYKfKnJwaH5QXW8AZ/iUJuoE/YBBdMgtoPGrTIz7+xgDzKlc0fhAbXHZPWoW35aXa8+G4pD787VpV1xw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mq8EZDSVjxqlbvxmwzPTcm+t+N4LeQIDOWgHLI2ov0282HpFl5uWUMQKI+pTVaBLq7uZQ+llcfFR0ojkScBQbTvsXU8qZmlnMrfLqP1grBtryV+6iAcxbDM8ikRPvXGwsHeVtvzgVo/8gmRKm9AUhI3JBztwtAljBc3gATHYrLDqvtGO0Tu4mpR2wu6EKxszALB+7RFsvjTqmPzxXcXSQti/iZ/xHmUhYmtFxg5RrrpjUs9tZXwZ3LFHj6BZuprhEq1WB+R36s8NbQQuKK111j71CJ7z2hcxCW16ycIpW+u/NIoFcqBYaJEwrzfyN/Q2LocdU1JQWLSk1wZHDccfKMOr/byOFO7Go4RA7cZAtWiQRXTJEbqbwM30Y04XH3P4CuW5lcofRzAkbpCMl+u1KpLWOmOVc6x5KAFsXgNJDiCsjWnrCwTRYdko//NFD4W/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:57.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39063c6f-1625-496d-5d0d-08df1d4bb906
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB720178

The GSP plugin keeps its boot-ready marker, control data and logs in a
communication region within the instance's management heap.

Map that region through BAR1 and expose its firmware-defined subregions.
Check fixed layout totals and the control structure size at build time
while retaining runtime checks against the allocated heap and mapping
bounds.

Own the BarMapping so dropping the communication region unmaps it, and
retain its BarUser and MM borrows for that lifetime. Expose explicit
unmap to report teardown failures without consuming the owner. Provide
the ready-marker access needed to boot a reused instance slot.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs                   |   1 -
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/fw.rs              |  15 ++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 205 ++++++++++++++++++
 4 files changed, 221 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a1e0bbffc460..72e96a1dde5a 100644
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
index fb4f1b5f7754..024cb13694f4 100644
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
index 000000000000..b945e216a1d6
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin communication buffer mappings and access.
+
+use kernel::{
+    num::casts::u32_as_usize,
+    prelude::*,
+    sync::Mutex, //
+};
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
+static_assert!(
+    fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE
+        + fw::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE
+        == fw::VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE
+);
+static_assert!(
+    size_of::<RawControlRegion>() == u32_as_usize(fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)
+);
+/// Physical VRAM regions containing the vGPU plugin logs.
+#[expect(dead_code)]
+pub(super) struct PluginLogRegions {
+    pub(super) init: VramRegion,
+    pub(super) vgpu: VramRegion,
+    pub(super) kernel: VramRegion,
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
+        mm: &'map Mutex<GpuMm<'gpu>>,
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
+    pub(super) fn unmap(&mut self) -> Result {
+        self.map.unmap()
+    }
+}
