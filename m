Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C14908DB
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591502; cv=fail; b=ustBTIvtSYiy1Cz+QLY2gryribwOC1wwcWsYPMzq6Lk2YCXuf4KNcynqZJ6xd7M2Uaay98hTdCo5WrVwnOhiu5Ii2GFKN5h/Rpyhud11FvFz/s1YsFATyCsWNHATIlXGb/2S3fFTO7wjVIss2HIQSy8+ddbOy7tNSkE6Lqzqd2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591502; c=relaxed/simple;
	bh=FE9u7Ij8GDUXjHe0MlJjn/SV/+E8NMQAHRQtxREH79I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkd94jwK5EqDPnnMvwzNROpnSMVD0CM+KAY+qj7RgSKzGv5dpdWsmtfo1chJFu2sP6tEql/36KMtDjbvXDdG4H2cJmiCoHeFweglguHsJwicWvENjPzyw4Zf8kBh4fNhiyNj6QqoRia4pBToExyh4o6T8ZWL6yBfILyirjg1mM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kf5NL/xI; arc=fail smtp.client-ip=52.101.193.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kf5NL/xI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1NdqRTKa/GTmjdtkYj8y6izwum70UBi9O2Hn5XZIssL2z0SfhdEXotWbdZxb3uVyA/Pd4wM2eC0M4OPJKN48KCEPpIID8bUbm8DxbNNdXmPF/dvmc35ySv3qEBCgaX25qJ+1myqmv/IA4DzuTrSFlDS5QfIlZu7c23I+qWQJLLiD3/YyraNGfvWKscChtPcLm+UY662ExUpqDwiXxG5yUhFp17uno02TUN6ztQHjRjRI8j0wviLL8yMMUQ/NSaKEr9mdAd3kp9+9i2qgV7VP+8CXenMRHIPwcsOleYZZ6LW+umVYTlGp6SMvqm9PO8U9bMDd35CDNHEQjGEBSAvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sP2RdyLmypT41HoZwzM5dZmqs9UqQghs/20I/fx8ow=;
 b=LZ1BPLlysA6hFxwIOH3zyaHsVjUI1YWTGmnbwNgvb78/aTRhhZL5mRuDdj6v/1Uvj8iBZkwQNmLSfHl/7qyGbuUQ7yTuupcNb1sgNjnU6zYBt09iLZV9HJ7/j3yuSQNBEqqo/lvIpnVajDT+hAq3UzG6dCs/yypO/et8nzLdEdBTgifi/DLDNIv1il4S7Usd1qJs5+F+bODNVSx9RhgHLnWyx1lI71nULOaN06BfqcopdkoqNXCKwcWJzhexTVHIAOGRNebo/+yu2VF3nj1VNgilcu6uUMrzqHRUoXM1400ZOqhZU7rjI8ElNhtfGZJD2SNWw1qitBhdVh1BYZ5q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sP2RdyLmypT41HoZwzM5dZmqs9UqQghs/20I/fx8ow=;
 b=kf5NL/xI4UkJkk6c5CcgeX4SVFg3PUYtJ5ggmtuHRqjy7z+7Cee8cA+jqXLyOc3kUYTwE6m/wbpNutfV/XILFSVlbIugfoeorv2Dyw0nLzqCN5HsLCiMESt6Lrm7Pe/tMCU6x6Lwx5pxi0meh523/utq8xm7YzDFa9DzZJ8YbWbdyFIROOKs8y1bDHp0QbWzxjPY7/bWa+8VEsfgOcDJFKbv+DBSyDP7MDGmoIA0yDFLKsGmP0xmHlIhLRPBgv9JfPDmypjoaNdYbQD8LCeQ30PYa3JRtxEbyd/cCPgnCPBxdKZhOqIZ1QAiEQI7kkvgQD0KtkW95TuYKyymU0ylJw==
Received: from SJ0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:a03:3a1::16)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 10:31:32 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::53) by SJ0PR03CA0371.outlook.office365.com
 (2603:10b6:a03:3a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:31 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:14 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:14 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:06 -0700
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
Subject: [PATCH v3 17/31] gpu: nova-core: vgpu: query VF assignments and properties
Date: Mon, 28 Sep 2026 13:28:20 +0300
Message-ID: <0141df169a72e603ea1df4f94916edd55c6cb6d4.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 85401721-8bd2-45da-7c6f-08df1d4ba9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|10067099003|11063799006|6133799003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RZc/8FZ4ocArMMCql6UJYi0Veplg2q5AICVfgj9Whm3F+/37ep4iO/2tLVnFSzFqc/wmrk2i+qSo9DIw8ham2zC7WP2A+mHMxd//hJ5tfLZq4fugefCrgbRKkliuJxlpiMB+4qVMRle7l0N8ppbrvi1VqC5ZcRcH7/HpnXeh4sPIX2D/GioCbHrDcvQhsKpJd7aa3HCH2ftYC/UlD3mF5lBuZTFe0/JpCOBnuf8I1Avkf9Wth/7usMcDWJEhHXIcV6jL8b7f+tQBWjilnkLUo0s8wxLxII5hTCWhCqlk/JPI6aU2imgklwY0DDkw6LZ9I+s5x3NybriiXMmR9n7ZBDW4PitB31kC8lYWQUy7IX5xMIsVD7Ynx6Oni16mCbvcf4w32tOkV8ZFkdsT4c4T14OGWBab8U4SsCEZbNRjWLOokNHjYUVLQPDFCadUpQllrqMB4WIMfLRhE3jTLq7+6TKgyG7ENN10NLxLpedktfhEhUqzw+eyYzsUvBLUB2y3Kd/2lAc4Bpdlw1kUCN2JND4mZ1ishA6S/RCMOBJBImr5nLuQD1izMYlVfHGr+rwA7skq7fbw6ESpLjzf9m/jQBtpK816MwHWrqOH7QKVq30yIpvHX5YjBK46+s/7kPosfCnXrTdatEm6ciq8gDXLFncgWJak18DK+A7Os9uFocTFQyxLoOnZZyYu81+vC5IOXQIjFhOZHlfMq8DnR/E+4A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(11063799006)(6133799003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K9MKYPFg0586me+peUwHBL2+W3iTWOF9Qu1QOcs/8Nqst1Gg35ivp377HR2kSHDnFuPYTkiSeBXWYyj8903Yg2lMDKTJEZArNU4naWX2/Kq/ZsrnqX6SJv0gj5hx5Rqn8cW/kCGVCT/gl+GRo9vXOTZNuoFz4R0SZjS2W6Jd0oWUi4MIlSuZYkAfqnLUqscm5znTSvrOFCHWXDFRTHr30h8+xBvED8BGSefhW2GYu1NmtHDiBdyT+waOoJ6VJmi2osGmlhwhtegVH5cXxkdnAhgEl4KBxaNIWKBQKmDafGDWdU1oSsB50T40ZR+Ed9pRaxxpJQNiqct0QwZz2wwVB7teeyQHR+zx6WUOXGI3IPk8QnBOxzjAnb404xUvSQN/l6BR2wz3Xhy/9TXPUlUpklA3D+YPFx1CISrBdW5lZ8ub9kDPLSdY/xQtE/GMFQJ/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:31.7324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85401721-8bd2-45da-7c6f-08df1d4ba9ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134

Creating an instance requires its VF assignment and the corresponding
vGPU properties before reserving resources.

Call Cmdq's synchronous GMC interface with each query's command ID,
request payload and receive capacity. Check the matching reply's
firmware status before decoding it, and report the command and raw
NV_STATUS when firmware rejects the request.

Decode the VF assignment and NVKV property replies at their query entry
points. Validate the returned type ID and nonzero instance limit, and
initialize the decoded properties on the heap. Keep the raw queue
interface available to firmware-control clients.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs              |  1 +
 drivers/gpu/nova-core/gsp/cmdq.rs         |  3 -
 drivers/gpu/nova-core/gsp/fw.rs           |  2 +-
 drivers/gpu/nova-core/vgpu.rs             |  2 +
 drivers/gpu/nova-core/vgpu/commands.rs    | 91 ++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/fw.rs          | 17 ++++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 95 +++++++++++++++++++++++
 7 files changed, 207 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25b4bf6eb848..45645bc7c9d8 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -32,6 +32,7 @@
 mod regs;
 
 pub(crate) use fw::{
+    r000_00 as bindings,
     GspFmcBootParams,
     GspFwWprMeta,
     LibosMemoryRegionInitArgument,
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 43038c7fe823..abd9edadff64 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -551,10 +551,8 @@ fn payload_length(&self) -> Option<usize> {
 /// Response from a GMC API command.
 pub(crate) struct GmcResponse {
     /// Response status (`NV_STATUS` code). Zero means success.
-    #[expect(dead_code)]
     pub(crate) status: u32,
     /// Response payload copied out of the message queue.
-    #[expect(dead_code)]
     pub(crate) payload: KVec<u8>,
 }
 
@@ -708,7 +706,6 @@ pub(crate) fn send_gmc_no_wait(
     /// # Errors
     ///
     /// Returns the same errors as [`Self::send_gmc_and_receive_timeout`].
-    #[expect(dead_code)]
     pub(crate) fn send_gmc_and_receive(
         &self,
         command_id: u32,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index a416826737bb..aef283dda087 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -2,7 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
-mod r000_00;
+pub(crate) mod r000_00;
 
 // Alias to avoid repeating the version number with every use.
 use r000_00 as bindings;
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 1402e37541b7..d910445dd2b0 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -20,6 +20,8 @@
     gsp::commands::FifoEngineList, //
 };
 
+mod commands;
+mod fw;
 mod hal;
 mod vram;
 
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
new file mode 100644
index 000000000000..679c22b0381a
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! vGPU firmware command operations.
+//!
+//! Sends requests, checks responses and coordinates the firmware command
+//! sequences used by instance lifecycle operations.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::gsp::{
+    cmdq::Cmdq,
+    nvkv::{
+        nvkv_words,
+        Decoder,
+        UnknownKeyPolicy, //
+    }, //
+};
+
+use super::{
+    fw::{
+        commands::{
+            VgpuPropertiesSchema, //
+        },
+        GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
+        GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
+    }, //
+};
+
+pub(super) use super::fw::commands::{
+    Dbdf,
+    VgpuProperties, //
+};
+
+/// Reports a matching command's raw firmware status before translating rejection to `EIO`.
+fn check_status(dev: &device::Device<device::Bound>, command_id: u32, status: u32) -> Result {
+    if status == 0 {
+        Ok(())
+    } else {
+        dev_err!(
+            dev,
+            "GMC command {:#x} rejected: NV_STATUS={:#x}\n",
+            command_id,
+            status,
+        );
+        Err(EIO)
+    }
+}
+
+/// Query the vGPU type assigned to a VF by its DBDF.
+#[expect(dead_code)]
+pub(super) fn query_assigned_vf_type(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    dbdf: Dbdf,
+) -> Result<u32> {
+    let command_id = GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
+    let payload = u64::from(dbdf.into_raw()).to_le_bytes();
+    // Preserve the firmware receive budget; only the leading type ID is consumed.
+    let response = cmdq.send_gmc_and_receive(command_id, &payload, 64)?;
+    check_status(dev, command_id, response.status)?;
+
+    let bytes = response.payload.first_chunk::<4>().ok_or(ENODEV)?;
+    Ok(u32::from_le_bytes(*bytes))
+}
+
+/// Query and decode the firmware properties of one vGPU type.
+#[expect(dead_code)]
+pub(super) fn query_vgpu_properties(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    type_id: u32,
+) -> Result<KBox<VgpuProperties>> {
+    let command_id = GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
+    // NVKV replies vary in length. This is a receive capacity, not their encoded size.
+    let response = cmdq.send_gmc_and_receive(command_id, &type_id.to_le_bytes(), 4096)?;
+    check_status(dev, command_id, response.status)?;
+
+    let words = nvkv_words(&response.payload, &[])?;
+    let decoder = Decoder::new(&words, UnknownKeyPolicy::Ignore);
+    let mut schema = VgpuPropertiesSchema::default();
+    let properties = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
+    if properties.type_id != type_id || properties.max_instance == 0 {
+        Err(EINVAL)
+    } else {
+        Ok(properties)
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
new file mode 100644
index 000000000000..23097cb13121
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! vGPU firmware interface.
+//!
+//! Exposes command constants and communication buffer layout types from
+//! raw firmware bindings.
+
+pub(super) mod commands;
+
+use crate::gsp::bindings;
+
+pub(super) const GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
+
+pub(super) const GMCAPI_CMD_QUERY_VGPU_PROPERTIES: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
new file mode 100644
index 000000000000..a4d23eae8233
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Wire types and codecs for vGPU commands.
+//!
+//! Defines request encoders and response schemas independently of command
+//! submission and instance lifecycle operations.
+
+use kernel::{
+    alloc::ArrayVec,
+    bitfield, //
+};
+
+use crate::{
+    gsp::nvkv::{
+        nvkv_decode,
+        Array,
+        Key,
+        KeyId,
+        Required, //
+    }, //
+};
+
+bitfield! {
+    pub(crate) struct Dbdf(u32) {
+        2:0 function;
+        7:3 device;
+        15:8 bus;
+        31:16 domain;
+    }
+}
+
+nvkv_decode! {
+    pub(crate) struct VgpuPropertiesSchema => VgpuProperties {
+        // TODO: `name`/`class` required?
+        name: Array<u8, { VgpuProperties::STRING_LEN }, { Self::TYPE_NAME_KEY }>,
+        class: Array<u8, { VgpuProperties::STRING_LEN }, { Self::CLASS_KEY }>,
+        type_id: Required<u32, { Self::TYPE_ID_KEY }>,
+        bar1_length: Required<u64, { Self::BAR1_LENGTH_KEY }>,
+        max_instance: Required<u32, { Self::MAX_INSTANCE_KEY }>,
+        ecc: Key<u32, { Self::ECC_KEY }>,
+        profile_size: Required<u64, { Self::PROFILE_SIZE_KEY }>,
+        max_fps: Key<u32, { Self::MAX_FPS_KEY }>,
+        num_heads: Key<u32, { Self::NUM_HEADS_KEY }>,
+        max_res_x: Key<u32, { Self::MAX_RES_X_KEY }>,
+        max_res_y: Key<u32, { Self::MAX_RES_Y_KEY }>,
+        dev_id: Required<u32, { Self::DEV_ID_KEY }>,
+        subsystem_id: Required<u32, { Self::SUBSYSTEM_ID_KEY }>,
+        fb_length: Required<u64, { Self::FB_LENGTH_KEY }>,
+        gsp_heap_size: Required<u64, { Self::GSP_HEAP_SIZE_KEY }>,
+        fb_reservation: Required<u64, { Self::FB_RESERVATION_KEY }>,
+    }
+}
+
+impl VgpuPropertiesSchema {
+    const TYPE_NAME_KEY: KeyId = 0x3100;
+    const CLASS_KEY: KeyId = 0x3101;
+    const TYPE_ID_KEY: KeyId = 0x3102;
+    const BAR1_LENGTH_KEY: KeyId = 0x3103;
+    const MAX_INSTANCE_KEY: KeyId = 0x3104;
+    const ECC_KEY: KeyId = 0x3105;
+    const PROFILE_SIZE_KEY: KeyId = 0x3106;
+    const MAX_FPS_KEY: KeyId = 0x3107;
+    const NUM_HEADS_KEY: KeyId = 0x3108;
+    const MAX_RES_X_KEY: KeyId = 0x3109;
+    const MAX_RES_Y_KEY: KeyId = 0x310A;
+    const DEV_ID_KEY: KeyId = 0x310B;
+    const SUBSYSTEM_ID_KEY: KeyId = 0x310C;
+    const FB_LENGTH_KEY: KeyId = 0x310D;
+    const GSP_HEAP_SIZE_KEY: KeyId = 0x310E;
+    const FB_RESERVATION_KEY: KeyId = 0x310F;
+}
+
+pub(crate) struct VgpuProperties {
+    name: ArrayVec<u8, { Self::STRING_LEN }>,
+    class: ArrayVec<u8, { Self::STRING_LEN }>,
+    pub(crate) type_id: u32,
+    pub(crate) bar1_length: u64,
+    pub(crate) max_instance: u32,
+    ecc: u32,
+    profile_size: u64,
+    max_fps: u32,
+    num_heads: u32,
+    max_res_x: u32,
+    max_res_y: u32,
+    pub(crate) dev_id: u32,
+    pub(crate) subsystem_id: u32,
+    pub(crate) fb_length: u64,
+    pub(crate) gsp_heap_size: u64,
+    fb_reservation: u64,
+}
+
+impl VgpuProperties {
+    const STRING_LEN: usize = 64;
+}
