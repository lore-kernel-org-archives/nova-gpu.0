Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86241393DF1
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595952; cv=fail; b=GL5fylGDpp3WhW+4b47e6XuvW7IOmjc4lpCS/WxQQcpUy/DT81sqRjPtGrl+VLdE1LgtaPsto8YV31CU8XTp9cK5I0yKs8mX7AJjzu1KvFkwS95iElukUMt8b45jVFl1IVE/zFK1r8YS8WEEa92hA1uesy9nWQ3kAKiD1dNRbzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595952; c=relaxed/simple;
	bh=hASzJSOQBgDaBz9jJayOMne0Sahqm7ekwDokkjDnTpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgkjMQfnfKoYuIhOetZsoSvDEBYgKGMkHs0hXofsRECgiZh2+/R6KDYFNn/W5iAgZBPOLbOCmxAlXCa/sRCv8a+yaRuvaQpSrfM51ZS5kXKPI4IoLbzUNKhOUiSWqQVN6nfW/ttE2IIbrYmOi8MtETRVruYwkpxvBMxE+yAFG+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k5CM2Z/O; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k5CM2Z/O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtKUXQTsvwOfY8PmWwEul9gDoEOm6v6T3jJcJYm6spygS+I000WGI9i333delJu+lLlJyoScW4FoX0vFWG1uyoF2okJFrdPa3LIMotrCsA4c9znBMJPzEEL1sorS0lCHlch+AJ+50eWSKZrvRfOF/tUfWaadBFyttzqQPRq1qI6KP1fwgfn1geNpSEcGAhT8rHK6I43mx8HgMFD1InJoCfw0KU3LZillC4QAKMzyr8fnXJmt22sITovYz+VJSz8LhTqe7NJKw/8r9JISn7dVNo39eOuqzGE1dYNE23UsS8ElnRhSKPvVsIQ+0Ij1lKXlJSV3+icbNLebZsQVU8bQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk+yfRSl40nPTsSG4616rASJcZw9kSp7Q5Xrobp7WtM=;
 b=AVSbef1v9nLz6HPYNPqqcLLj/zjGSSeYnL0I8jVHig9bkjqT3rkSwwj7g/Sz4nthYQeRz7tDfnH54vQww6WS8sUcC+HNLF3ul1cNCK1i9YtfaVw06G/GwsdwzU8y2iGQiEKTmiMXZ2gvSr3YuwAQecmHTV/AlXqiMucZhdwM+DfX4k4OvP+cqJqJtQaSw1y1HsOyNXByrPPF6h3n7LcPsJQEcLOmCpfb6Mxn2Dag5dDAIitVVb6YsVNxdbHlzE2jDj8VzKvqYBUkbLLqFXW4aTLId5CF5Edku1OWNLwTqkhk965vK7DcwzXSfqeixUSk8hhCRUur0suTUZ+2QL6s5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wk+yfRSl40nPTsSG4616rASJcZw9kSp7Q5Xrobp7WtM=;
 b=k5CM2Z/O87fet0RNtYcU9ugZrjx66RV8v6hP5j5KjB7y4wko2nR2Po2SfFzhDOjO2t4HhqPu6ftU7AAQwD5IUbxSO0EqPhVVAFhuKK/akSAVaYKkT+/fMRxvvJdtLI/eNZiVD6i/xxqIFByEMsXZuIg8V4y9l3rwpIrpPrteqIUX8G8lUeHoviPZX/rGvYwHZFsakPyEx8RPj8Xj956j/n8vrhVn+6O+6KyMt39hsCtRSCXavKsjv+rgzAMg86kAQi+tRXNkVjEyt6ceB1TvQ0/JcYdk/IY5kXAjBfN7reW16hOyrOrlFrH8X2mg6dIcx+HgvQJIJygAY64D5J/y6w==
Received: from BN9PR03CA0944.namprd03.prod.outlook.com (2603:10b6:408:108::19)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:12:14 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::77) by BN9PR03CA0944.outlook.office365.com
 (2603:10b6:408:108::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:12:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:13 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:02 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:01 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:11:53 -0700
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
Subject: [PATCH 04/13] gpu: nova-core: vgpu: add r000 plugin bindings
Date: Sat, 5 Sep 2026 11:11:07 +0300
Message-ID: <20260905081116.106613-5-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec47902-96df-4cb0-097c-08df0b2564b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|22082099003|3023799007|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	aiAirtAqyev1B6f/qWjjApg9UTkJpUaMHZTNRkcMpvxRa8rAHWVi2oBHNu7YFOiod+VLHzw30aXDX++0o0Z5a0gDIV3Fz1jGw3dlLXrAFnJpzSQYhApH3Sffp6gcscaPwcn1V/Wr/4LIW6UE695DsZipjJLjiZaJCNjCA1rvqwIOrWzZEWGuFn0rxK9iXFYsuE9WbnMmazqbVflKMUDnn4sD74VliUS7vBwtV0Q5yYaCD9eCMqNzqXxJBXCwL9RIDTnGxwUUKevxSJ+Gbc8eH9xb8DNOvCZqnV0fM0NCdvDxfPdqPZRSKRyMerpLgONBB4LNHoIOkCKmvnXGF7nRcwMn/j4RzAQwUAPpdhAEmjjZozlk4wnVV418ACnpgs9Ce9W1pJw2bm3KI3BjHTDNFO5Rv8d6YTvP31hrULVHaEhL1HoHyzPHDXIeGMqdpGhwtzuSfHMGJH2LSwhuFvcQqBrf3whzmlhRveuhxPTxiTZkcp4ngFJ7mkxyWG1PZ34XbSzqKEBfviCz11Oy6/9JpinuOyQhaaH8Iwd9nvpmyuRq2LYDnE9uznwYxShhf/c4C+D5WViyuFimWlU6Rs/++SjMkKPSLlNWspvNxnUOS7X0iXkf6rH88J4DCcxvgWX9LlDCyxbzq4tyfmDdmlB5CwG3OoXhCMk6YQps2SHprfuk7ko4f/G+Qa3cbIAWbBL2WqiEDit1z0ut6wndcPp/Hw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i+LDPsZURRajcR8aH/2a3AfK4X8IqcABa/ULOGpSSV2sPZ+qYZ8SyqZvzMY/JnftUnqCE4OABJ3HOb9t66h7cvqPb/u1tJJ1aggHi1VQqJOlx8jeQN7R3K6aFHDa9Ae1hVi3vlAYG7t82pfGsDenfudTis/YDtP1XYyEp6kULLcv5cBNyXlNbPt5ZPh2HNGdMxVxFjAtzmHynv3pt5bnyddjwFqLYDPEzWshJQ2LbGsx9nMs5tw0RpZB+1NbSymau9jUBOOrNJ7p/k7P+P6RiohReEpBWz/Hag+NwbCrB6q43rhIncCsGOaO3bRVCxLCkI/x+jMz5fIoOMlBBmfZq1u9oYJOvacjqYxXDHzkfSyFLYQ2Dbni54Yek+R6x4BNGWt4kxUFwVGyQAw2fepS0bRN5FjPscRfQgBh0TZ7FAysT0SaaKo/pSWD4E6T3T3K
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:13.9599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec47902-96df-4cb0-097c-08df0b2564b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305

The vGPU plugin communication area and RPC protocol are defined by the
r000 firmware interface. Keeping local copies of that ABI risks letting
the host driver drift from the firmware layout.

Extend the existing r000 binding set with the nova-core subset of
dev_vgpu_gsp_shared.h. The bindings expose the control and response
region types, message IDs, and firmware-defined region sizes. Keep the
raw declarations private and expose only the symbols needed by the vGPU
plugin communication layer.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 173 ++++++++++++++++++
 drivers/gpu/nova-core/vgpu/fw.rs              |   2 +
 drivers/gpu/nova-core/vgpu/mod.rs             |   1 +
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/gpu/nova-core/vgpu/fw.rs

diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 4861500b2747..dcb44a403469 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 #[repr(C)]
 #[derive(Default)]
@@ -857,3 +858,175 @@ pub struct rpc_unloading_guest_driver_v1F_07 {
     pub __bindgen_padding_0: [u8; 2usize],
     pub newLevel: u32_,
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
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
new file mode 100644
index 000000000000..edfb0f984b6d
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index a9d4860f18e3..a96d0018fa3d 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -21,6 +21,7 @@
     gsp::commands::FifoEngineList, //
 };
 
+mod fw;
 mod hal;
 mod vram;
 
-- 
2.53.0

