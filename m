Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9401A49739A
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591492; cv=fail; b=na4HZ2QuodJ6TUT0iFLLLNFIO2ScmcUwlhfK/ICgneh6VO8u2nutV+Mbvl5/8QpR89LveCWRNk0fLINx6VhifUo93LanSGrlOwf1pjEN+zgOMfjC1ysh0sMDlKS4kOogQkvVKvsgAwZgYAKNeUvYRNrhxkCfUxO/gYVQstdvLX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591492; c=relaxed/simple;
	bh=aF2L/7TZRD620MqGYxi6nydePm24Jhhns/xELnDi2dU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYOZZRTNDFaWiva5Tm6SqUJ8TIOnzv6gwtMeJOMhnlbVmgUfdO1hJE3Bs+fm8ODTNVmAX5hPZSNT8lM73mqG59w2Q2pKr5v/8i8YqQ/3FwQtcuyOHddkmloQrvNY2Pk3vCRQdsnPUwKuymOqZpBdh6llmNgKzyWPqvUFabS5nBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VdD1YthC; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VdD1YthC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxmUWbAzdhTEKHqO/WH2YDTgsRJ8mIs3nwQARGPZN9cs8LbXoBoimZ28QWRSIrpaY9HcXMhknGApZuNTSahsJ6z4DdRrbuoHGCHLH4dWyXcunJAO6FGaoIwEutbItCWKJCP9wRuV5VjR0UZkZR8Dj5XtxDvuy0TJNKh125LX7ESQlEY+wbWzBwL6tTkwGvt2ruABxVkF6yOOS1w80nd3nQoUqxynzpv4KVCqWVxr3Q6ipDwokMRkBQtuou68H+d8btrfdbwVIBN8gbZ+BYdLFb6O6Av1LEcZ5kM46nxGKGqPG4r7dW7cgiDeBMse6n1K3j7PF+U1C3sZWmctwdZV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK0janomBS4FDi2NSVODdZmbtMIEOcYHuBGwhyozNlA=;
 b=fkHpOjoQ2eyV+fD4inpcjS+1XZDWAs6P5elFyJpYldLxgnNbIOMuhLRSNf2zwX7YIrIEymmqK6LZcTPP5D6dLgukkh+fTYscAw9lV/8GCR4wc6pGhF+Pl2zBmOy+IhuFH/GZ6NLQL3tfCvkGKs7BH2zr1FTx2T/Cj7wDic6BrHU6MG7ZAMmKPXs9binuzPyz4hYH4oFSjMSnrTbHg/55aE9PtiO1nNcdG5TaH0+HzyIarmXwJua/KtldSBa7CdjvYqK3eJp+s50AvLs0HSVzV0gtb7/ldQH/G7FuwWTMp0Frs2VJh2Mym+Gz6DsjrV/pExjU0iz025+hDhzDJubTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK0janomBS4FDi2NSVODdZmbtMIEOcYHuBGwhyozNlA=;
 b=VdD1YthCi+VnCttPMOusYyq0EDXe8QxoBqUfBpohAa2fUfIwlN5BeW+fV1GJBmCJQUbflsWWbPwPng5gyES8Hxfwu5irVYJkQeE3KkUaFmLsb/KFVi7pbahMZoZcX26kclgbZR/utgjC6r9o1hLckORQElCMe0qbE2FBZiY8d6RgfcPmv733xjGqpEkXXtHc5S//9+6H9Wxxp9qUx20qMr8PzXYwfVEiady1uIyzfYwJCw1yOgBdxzHDZKSDctHBxUn1AsqQ+77lGo/zU3I1GKFJWACX0zWlBI42hgZJO/wtFVT3ci8jUCJUuxfwDRo7TiUWRpdp1wTCXKvuVhGZyQ==
Received: from SJ0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:a03:3a0::31)
 by DS6PR12MB152050.namprd12.prod.outlook.com (2603:10b6:8:410::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:31:11 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::50) by SJ0PR03CA0266.outlook.office365.com
 (2603:10b6:a03:3a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:49 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:48 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:40 -0700
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
Subject: [PATCH v3 14/31] gpu: nova-core: vgpu: add r000 plugin bindings
Date: Mon, 28 Sep 2026 13:28:17 +0300
Message-ID: <dc6209545947c9ca01cb01cb2b4c7a43e178ad3b.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|DS6PR12MB152050:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff1b039-74b4-41eb-9f02-08df1d4b9d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|260925021311599003|3023799007|6133799003|10067099003|260925022911599003|260925021911599003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z2fIBzYw3qEUUbmhH8fZUNVd/WVyxCfD05DrQykZcknzb47r7+nQ88/mUk8iY9pxRaiJCXqIsaHh2MqjTByVPQLh1hIonwvXaTqTfy+t/fWqZ/vaFE4suwzsdFQJP7YSywWMlwhMecUzTn5sJdEMDbm4y1pQohfLt2cotKIxpZ78GQBeZ8TdhrOODT6ZklEVaXzVjys3lfq/b1XvfCfic/sIdvO60e+szreFGSB7at/G7qmqrWAB4MmXG2szoqjw9G6627jOBi4/1OuxnUtA8awVDN4GtQj+L9JwJD9CaXeHML2sJhCJBDlcAmDYiNfJN4BTuu31zuZcdlgX4H9adLYtYUI+ZRlfNLcaC9m3Q7FP9QdlkJqqHicJsluuOVjoD5eZEtUOePeZeMRIxrEh6YE3FCuy619nqb0Uqyj94NjXNOsddeqE4nZ8S+u0P7/cr1LLLKbP+Nt2bdBa7dUDcNe0q4b04/CKe1gmeyjx3tZlno7bgptPGu4/MYDywX+3Db9yjbOjJqU07ENd7s6vML9JKMmwhS2lKRzEOe4sCrx1Pw/LfAv5+0vJiDfMUBUyMYHC2iZr1InZxmiXEAO+EHUW+UwGJ9eaHh9R2SKLxkH560u8Jneq7+YA3e9ERWVJAp3n+MJYsabZvhVTRLgqnAZ+C8iH+M+bIa+pqz2J49TnphHHA+jiscXSw3Bds33heN9WHpPNGtnrnHUE9BwHpw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(260925021311599003)(3023799007)(6133799003)(10067099003)(260925022911599003)(260925021911599003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EEDPH75rZV5TVRDfC3KoPsadE+fqHCP9imcyswCLjpn5Yg7/WGN1AuF1IN/2tpPjy5m00UEwrWz2KEYHVY8niqeFDIevOrUk+xmnYXjr7LaLx3fEBKYWiKHzgwJRS7f0YYeduEdCIGOpJn9soo+did45c5Q9cJ8zHsS8bpBvwC4TlhGvu4KLxcDzL1AhkTju8FuTO5wmdAziwb0tNXbc5/l+6iZ0eXziTpzg3T/FNFFAT7blbr+ZYXRFeg2lIUDre9VNvL/3lOQDZYdzsrC5TDZYQsagoIxexyzEfFYXBTEgGj78jiVs0O8jvn0bYymthOs8Hsk1KeEIjsstx6XW5Rn1QHsKDuS3/lNvhijy6W4a0mCTqipREy3yK/DBEUh0CkZbJwwsC/LbGNCWCy1jD8X38VNM53Y500c1U6AiydHoBRB2mcVHv7yT988ZilwN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:10.9955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff1b039-74b4-41eb-9f02-08df1d4b9d6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB152050

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
