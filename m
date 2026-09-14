Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F423E6DF5
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372331; cv=fail; b=bNVeWzDiMxUULv/k8rl2VfrONcGSyG7N+XUkKTfcRoxa/pCBmG+fmzT1raBS2xS68Z59GE2tEDbSjA98wpldSDvcNCMc7Rq++300xwIAdzA0Zd6CdgKsnITstCKFJPFmQ4cJET0V7Ez6usAz162A8fVMXJ/FkeU3QbAfTMg9HbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372331; c=relaxed/simple;
	bh=aF2L/7TZRD620MqGYxi6nydePm24Jhhns/xELnDi2dU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYKOobIUZSDkKoXgQQeGqSOPsuyGeh3nIEQbtj97+q6hNFUpQ+AlTfINhZOhWoH/l118sG7iobukxM66bmkMzDA+LDTFrAOpQ1yrpt5bOarPjRN1pESDo2I34y161uNKhUV1PQ9VaXSICGvMy1ZlH1gYl4Y9hUF3EklrfxuXAXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JLI/kp5o; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JLI/kp5o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCn3sPZ3cX+b1wdr4VY+SW+MCQG0DEww+ywD6hoqRXwXsjlB+jRzFVUImyAADWrL/D9XDU2e5newjeSLGKs1QIhc1JZZiTRi+kBEr8KzasY0Xhz/y4p8jQ5wx5iah2dBsj3uMYdMOiFMeK7uCfnfV7/1A8TmYyjaPbrYJJ4WT2k9IVyZ7BXdZr7um3fxv/Ovn22nZPZaUW3aQKM+4RUYzsi+Fh5iKKEw3kjGU9NDrGuY/6BV6I2vqtzzmQobSe9bVBTVe8HaR0fZ6YtLflTaD9z+r8W+4/vGQEtsKAcvnEJ/cR7GY9YqTiwAAvJmyH+oViUEqYZ8CQR88DNigxVtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK0janomBS4FDi2NSVODdZmbtMIEOcYHuBGwhyozNlA=;
 b=sGOM9cLYSBnxTOtUDX8SI6r9cBnO2aDCRd7KIZvivEHqWrC/qE7xKpHjzgE2qwVilgfJLvYfW2IEYOjDLwleS0qB0qfzqnwhaQA3F3kUN6FX9TYHKH8O5NMZzVGxXa5VCL2JtLCptuKdI/cgAgL1eOKdjQNo5ScCr5MJAWeiQNCpqMhODW+w0ytJSsoP/4VZ9fdumcppIRDfCPV3Hi/EOnwYKAEWIrLuzDP8nZD67LNZmBXj5KMuBUiOrzFiJnFaaSIsI5ya6tL+xCbsB6e0fGZ7mwqMHqfesVG6GrzA/m+0IGbvENZDHgGRM2Ax141GcYY9RF0dniBKzxCLSd7O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK0janomBS4FDi2NSVODdZmbtMIEOcYHuBGwhyozNlA=;
 b=JLI/kp5oRqJQgRdt9h0oWVCHR8R0DUIfOLlgnmoUNtG5bxINNyh/Ra5OE9Z1Xo9LIrkq/YRjd9SxTJ4KvelcvinP+R5aWSJkOoZhf+5A7LnmFP6h6scixMz6LqO44rTY2TrRChHph2tnpC1+qZVGwgL+CMtBTai0fytVXci7BRhN50oxjQeJ/YncrkXSCcW3zLKuriFs0HFntlQQO0TjLB3P94DXiXVkG74XhleBBVmXBqJc57QFRthMYvkBlmMiLfxMuz6RkPJOagxbyd5FJyulW4FP7FwRMPIU8divqXXFzXkZulLEGBz+o4X3D+QaloIK6Wg804x9esQa1HIQjA==
Received: from BL1PR13CA0152.namprd13.prod.outlook.com (2603:10b6:208:2bd::7)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:52:01 +0000
Received: from BN2PEPF0000A88F.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::a2) by BL1PR13CA0152.outlook.office365.com
 (2603:10b6:208:2bd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 07:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A88F.mail.protection.outlook.com (10.167.248.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:51:43 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:42 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:34 -0700
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
Subject: [PATCH v2 17/32] gpu: nova-core: vgpu: add r000 plugin bindings
Date: Mon, 14 Sep 2026 10:48:52 +0300
Message-ID: <20260914074907.1399629-18-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88F:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f3003e-e23e-41b5-50d6-08df12350f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|6133799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TIlqzuJKOc2np2whxNqqKWE6JL3w1T2D4+9piCwmsPzGy/JW2zpWmoWtIAUUHarwn6pzp1z9zEZK4MY/B9B7WE+Db2M6Pq6DXFg8beXIcRGSH6blXWULQjI8e7K8mkj5s7zbdWjM7fgasa3MipGqRLxxDrFzMBMzbmTfelYuSutPYgF1d/5P6On/H3aklvDWafMadvZeGBoVDQqShJjrzAD7crBJ3VZKWs/XsOHZ2Fg3PI6vejqjzb7p3Hhy1wBdQhV4/Oqu7FXiaS14jaZhqAsczlzZhQ+SNY2qHaOYoFYUwDSy71Z6ACKxlKYnXYBQVDM1zwCTYanEyCFxl9W8ehe9g6L8rb/mXcmOQVxIXMm59Co6wXYBH2ASGTikWmulbPnhrfLQvH/Z28qvF/z20EvNf9vpqkPdmHJ+2S1RWZ5XN79TF8NWitodFpyNCDUzZi4QzhWeHzOkRga3rNbZPlcVmaDGyxr6oALW2cnik1oJTTA347fDVHDTOn4Eb5EEmQbT7jid2VVT7RaDM+ROI1t1aza0jt6tqsdfBIuowCOvncQixrwvPtacG7vVxqxE8P9as0quRc6iPqWxzli+gfuznugaflqfRpkr6Dc602ly6wOVaauG/C6/OK3OsJR4kp0nmX9BIyjCPsRNGuRd21FF4+9fHEnV++sL1Lvlu0TSV+uy3R5cxaFUCcqx56nvFJWjfS/28mVlH65YangYyQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yxL8raFUKDWOoIYzJrO7vJVtsFTNNKHUo+SF6NVmrkKuszTeeSkCmsMDMXu1x0E85wWYPyABvXmlxSbvAEr1U5iL/vmPdMDYKdYfC9UrFVu85zad70O0mq7uvS4UbZ4TNc1KE0MGcRPI9n/uPTJd4C3JJBnbmgm0C4SVr4XzQXVyIMBvWxmWr+cJMrq+5orYpgG9OQmIkWaIRT7bW0Y3G7IMZ5yxa/hb6AmNsg7e9ea0sHaLjEGYJHbxIA+kAN5NV1fLtrRDcgDit8zel0OpksDjtVU3c6dN9c55rvvC9uxlkcsHR4V+ChxXxoJ4dmc5vWBaDmVRMof70B/TgDuVxwE39lymwUuZa+mkKSYDT6+7dQjPz2I+tA64LMZKcDkL7A7UMnldzcFgxog6e4qR4icWoUz8AI6F8cVaJM5wA2gWf1gG/wYHzopUjUzV6bXG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:01.1034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f3003e-e23e-41b5-50d6-08df12350f85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766

The GSP plugin communication area and RPC protocol are defined by the r000
firmware interface. Keeping local copies of that ABI risks letting the vGPU
manager drift from the firmware layout.

Extend the existing r000 binding set with the nova-core subset of
dev_vgpu_gsp_shared.h. The bindings expose the control and response
region types, message IDs, and firmware-defined region sizes. Keep the
raw declarations private and expose only the symbols needed by the GSP
plugin communication layer.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index fa17d3e2edf6..3cc718bb2ab8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 #[repr(C)]
 #[derive(Default)]
@@ -850,3 +851,175 @@ fn default() -> Self {
         }
     }
 }
+pub const GSP_PLUGIN_BOOTLOADED: u32 = 1315261039;
+pub const VGPU_CPU_GSP_CTRL_BUFF_VERSION: u32 = 2;
+pub const VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE: u32 = 4096;
+pub const VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE: u32 = 4096;
+pub const VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE: u32 = 4096;
+pub const VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE: u32 = 2097152;
+pub const VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE: u32 = 4096;
+pub const VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE: u32 = 131072;
+pub const VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE: u32 = 262144;
+pub const VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE: u32 = 65536;
+pub const VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE: u32 = 65536;
+pub const VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE: u32 = 2637824;
+pub type VGPU_CPU_GSP_BOOL = u32_;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_VGX_VERSION {
+    pub major_number: u32_,
+    pub minor_number: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_GUEST_INFO {
+    pub vgx_version: VGPU_CPU_GSP_VGX_VERSION,
+    pub guest_driver_version_buffer_length: u32_,
+    pub guest_version_buffer_length: u32_,
+    pub guest_title_buffer_length: u32_,
+    pub guest_changelist_number: u32_,
+    pub guest_driver_version_buffer: [ffi::c_char; 256usize],
+    pub guest_version_buffer: [ffi::c_char; 256usize],
+    pub guest_title_buffer: [ffi::c_char; 256usize],
+    pub guest_branch_buffer: [ffi::c_char; 256usize],
+}
+impl Default for VGPU_CPU_GSP_GUEST_INFO {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union VGPU_CPU_GSP_CTRL_BUFF_REGION {
+    pub buf: [u8_; 4096usize],
+    pub __bindgen_anon_1: VGPU_CPU_GSP_CTRL_BUFF_REGION__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_CTRL_BUFF_REGION__bindgen_ty_1 {
+    pub version: u32_,
+    pub message_type: u32_,
+    pub message_seq_num: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub response_buff_offset: u64_,
+    pub message_buff_offset: u64_,
+    pub migration_buff_offset: u64_,
+    pub error_buff_offset: u64_,
+    pub guest_rpc_trace_buff_offset: u64_,
+    pub migration_buf_cpu_access_offset: u32_,
+    pub is_migration_in_progress: u8_,
+    pub __bindgen_padding_1: [u8; 3usize],
+    pub error_buff_cpu_get_idx: u32_,
+    pub guest_rpc_trace_buff_cpu_get_idx: u32_,
+    pub attached_vgpu_count: u32_,
+    pub is_gr_init_done: u8_,
+    pub __bindgen_padding_2: [u8; 3usize],
+    pub host_info: [VGPU_CPU_GSP_CTRL_BUFF_REGION__bindgen_ty_1__bindgen_ty_1; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_CTRL_BUFF_REGION__bindgen_ty_1__bindgen_ty_1 {
+    pub vgpu_type_id: u32_,
+    pub host_gpu_pci_id: u32_,
+    pub pci_dev_id: u32_,
+    pub vgpu_uuid: [u8_; 16usize],
+}
+impl Default for VGPU_CPU_GSP_CTRL_BUFF_REGION {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION: MESSAGE = 1;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT: MESSAGE = 2;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET: MESSAGE = 3;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_STOP_WORK: MESSAGE = 4;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_CANCEL_STOP: MESSAGE = 5;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_SAVE_STATE: MESSAGE = 6;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_CANCEL_SAVE: MESSAGE = 7;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_RESTORE_STATE: MESSAGE = 8;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_RESTORE_DEFERRED_STATE: MESSAGE = 9;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MIGRATION_RESUME_WORK: MESSAGE = 10;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_CONSOLE_VNC_STATE: MESSAGE = 11;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_VF_BAR0_REG_ACCESS: MESSAGE = 12;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE: MESSAGE = 13;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET_MIGRATION_BUFFER_PTR: MESSAGE = 14;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_RELEASE_CLIENT_DATABASE: MESSAGE = 15;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_CHECK_IS_ALIVE: MESSAGE = 16;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_SEND_STATIC_INFO: MESSAGE = 17;
+pub const MESSAGE_NV_VGPU_CPU_RPC_MSG_MAX: MESSAGE = 18;
+pub type MESSAGE = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_DISPLAYLESS_SURFACE {
+    pub sequence_update_start: u64_,
+    pub sequence_update_end: u64_,
+    pub effective_fb_page_size: u32_,
+    pub rect_width: u32_,
+    pub rect_height: u32_,
+    pub surface_width: u32_,
+    pub surface_height: u32_,
+    pub surface_size: u32_,
+    pub surface_offset: u32_,
+    pub surface_format: u32_,
+    pub surface_kind: u32_,
+    pub surface_pitch: u32_,
+    pub surface_type: u32_,
+    pub surface_block_height: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub is_blanking_enabled: VGPU_CPU_GSP_BOOL,
+    pub is_flip_pending: VGPU_CPU_GSP_BOOL,
+    pub is_free_pending: VGPU_CPU_GSP_BOOL,
+    pub is_memory_blocklinear: VGPU_CPU_GSP_BOOL,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union VGPU_CPU_GSP_RESPONSE_BUFF_REGION {
+    pub buf: [u8_; 4096usize],
+    pub __bindgen_anon_1: VGPU_CPU_GSP_RESPONSE_BUFF_REGION__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct VGPU_CPU_GSP_RESPONSE_BUFF_REGION__bindgen_ty_1 {
+    pub message_seq_num_received: u32_,
+    pub message_seq_num_processed: u32_,
+    pub result_code: u32_,
+    pub guest_rpc_version: u32_,
+    pub migration_buf_gsp_access_offset: u32_,
+    pub migration_state_save_complete: u32_,
+    pub is_migration_allowed: VGPU_CPU_GSP_BOOL,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub surface: [VGPU_CPU_GSP_DISPLAYLESS_SURFACE; 4usize],
+    pub error_buff_gsp_put_idx: u32_,
+    pub grid_license_state: u32_,
+    pub guest_os_type: u32_,
+    pub frl_config: u32_,
+    pub guest_info: VGPU_CPU_GSP_GUEST_INFO,
+    pub is_guest_info_populated: VGPU_CPU_GSP_BOOL,
+    pub guest_rpc_trace_buff_gsp_put_idx: u32_,
+}
+impl Default for VGPU_CPU_GSP_RESPONSE_BUFF_REGION__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for VGPU_CPU_GSP_RESPONSE_BUFF_REGION {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
