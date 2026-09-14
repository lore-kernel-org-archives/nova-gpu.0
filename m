Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432B3F6C4F
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372353; cv=fail; b=ARuNfmwU6/m36H2sFRfpwb2xXk8/PAm/Q1/shelo/T77dPLEY+SZGeFDpkfh389UtedRyyNzdfnAMgzM4IuE2cIOBrEFWy0f0/FIprpTPZFdI/vRaonA6zwKqzyhMlk9Ux9NCaLPK0pqDLEtxV6ZwGIZxpPX0f7CNqhAsrJxbws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372353; c=relaxed/simple;
	bh=+Mp+ZFoxLT6p1+L495pPShg52kxcPnd3bhBz8Cx82MA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZTizPzvPAMlEtfBEWTMP72KrUxvPpUgxG5vHgP5hO+BV1uZvVkbS0Q2nYI38ypizCbSHIOlJRNwv7XWiPK4NbUjQ4YO9pAKrxYmFMTl7mJxMTW5s6RZMJOzg0j5LDzDoaR1rUV2fwsbXK3YHXZij0J9fTx3jjGYWyR9D7250bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XwN0SpwW; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XwN0SpwW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPDd32iH8zJIfwaJTIpL/a9KdAje4l7/OAXpXm+PDXBjnl4aZ2HGdzcqVGlcSv4kmYMT243J3DF+dwneI9sXbv9HLOShaB9jqFY1xPS9JFw6Nfrki198TFW1gWpLJk4MSP5rmslkcE3BQTH+0+vU2fnzB5nQdQpIwEYQ8jms94JSTYTJ8P4mGCO9OI5ujOzJLfleBPn2w+dswVfJltH1e+m1nDbY+9I9pM/LGwfHF3Yj1wLYzO+LEOIEBoyper0z+prrLIbYWK01DKD8HRBoGOn3S1dYjxXBhchZIbBDGCRw6dbFnNyN+EIK056RPgnujjazgyBkr34kxWOJFPNuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9IpiTPzyzgvmMzSGL3uPyJgy5xm9u/Rwm627UOMI6w=;
 b=qAzEskb5DxjHE1RNvnbfgcd9X5mpvM2m9Yxf0VM3UYIMDdgPx45ynL4K7i98XNgSxFx76tq6s9PaixZrXgHsbKbwvLeHlYd+4Nxwen2n7IGWArLzSH1ns4mdcU9SptyDT/taJCHJHNIJ/sDxD3GuZTMzNd3TzHQtu23vljlq8O7gMzXHQcQkVAfJ7QFQzkmobuBjQmm+k9kY70eUD3gAiQ62X1s/JQt3kVuI8xNS0a5P4S2z3mE1refQBuWHZp8LTDhpdP+dOK4DiJ2erG4H0vlAHQx99KmCd6Dg+klco8lzARNGFa2FzciV3xFHFEYWfCCLY9FXcv5K0AEVXjSXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9IpiTPzyzgvmMzSGL3uPyJgy5xm9u/Rwm627UOMI6w=;
 b=XwN0SpwWXCeQqaFia+x/CjEKYNp130EZe/eYCTybOXK+PjV8FbCKzQh81fh/1nkcUoWjy7vhg27WyOhgnNutKmzkQ2rkMiDfy+2VfH/hl/tj4v8hNqTbr1P5wJhTnFCAKtjnk8jmtAeC5E0YAQLfuBujY/MKSLry6FqXqwMm+2HJGJGERMiOnJofqO8phbwcoGN1HZZ/9yHsLjjr+5gFldrDTgU2hKQl3eiXg4eWy8BLsbzFA0KVuFWciO7VH0+RJsbtLRHh3RbqGVvsK7YFhkkAeZ0XEuSSM2BuTjKuWHF+tEl5P6JHRfrKU3b4l2yBfS1JQmjw8PnyaEvTxbxBzw==
Received: from BL1P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::22)
 by CH8PR12MB735095.namprd12.prod.outlook.com (2603:10b6:610:32c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Mon, 14 Sep
 2026 07:52:25 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::85) by BL1P223CA0017.outlook.office365.com
 (2603:10b6:208:2c4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:06 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:58 -0700
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
Subject: [PATCH v2 20/32] gpu: nova-core: vgpu: query VF assignments and properties
Date: Mon, 14 Sep 2026 10:48:55 +0300
Message-ID: <20260914074907.1399629-21-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|CH8PR12MB735095:EE_
X-MS-Office365-Filtering-Correlation-Id: b40ef9c2-9352-4b4a-b6d0-08df12351dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|7416014|376014|10067099003|56012099006|11063799006|6133799003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	H2eNpo01WvRExkSA46J5yXqlwaS/7OC0ImYPUwxfB7OFtj3sCe0lP1pdaJrUHH0B43FhtJenDYiyDwLo6zgnIsyozV0AnqMsghLdDtNSwIgo30+ZzTHNcKPUcwutJ8HmazUQfcAEKKRtenXItBwMtJacgMxvJn/ZUu2/KSiteOnX+FDBOyVkEiCxUFb5M4QfgTCHcWmCaKE1yBduTkVRNTdA3TyEuiWMBYpkqsmv7wIWpXsh3UuheKwS5mMODirOUlmf7/T/Xo9UMr4gtR8ksm45qaCPA7C7ZU5vtZmgFEPRtNWrRAyVu38DDePoxkKTvpGeHLdtkLwFY7vLYyAvJqgino6ZSrb+5GidkOy6JCg3FugFNp+iGf+G4tMqdfSi+wLuc1H4kCJNEjlWvfZfEM7VlIb9FEHi2WdAFQthiu9kfWwzGrSZ4crkakFUEktwKCm0gjfxDOH2Tv8DB0pcdi6Q/j1EqJNuUeKSUqXbFFZ820T8bdX3TfIPSwMWUWiFoz1Y67yFm7PBD6+kWwo3sQxwkC4S3PRYi9VKXq+toJMCOLtL2BtIGlyR4CjpGgU1YFQY/9n4trOGfiyu1Sxw/wn2ECoqgm4pZbEfiIQ6vqGtOPn4SxGlUeugNfcbT4PUIXyCzFsOG0DbHZKdgC1NMbVqHtQcNNKdM1bumMU17H8t2xA8W90lOyXUJiGwGZ9zMWbFabJNmtOVoYEVQZwQWw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	49aVDtvhdRMLLCja9+P3XcX61VtUP4YoPIRP86bOIUXUlNQqMEtFlIcwWkEjzdTVSCeuBIFz3p4wR1QpCud6g/gAqJQAMUflKJWHuGmzXmcpcJqPr1AZx5UzkyVFHpSziqR6wOl5yO4aiKCouOLXmthe312SZ2fN5KTzx2WlAed8wEDLgeuww3hxKg99EM5KcuE8Kw0p0ZTnEzSBEMvRephnXtLbLY+LE37+UIKdPw3C59np/6ANkV/lhsa5nuh3zXtWfz2XMAzImb7crNAtV+hp5ngrbmXRLzvhTLi9Wabuu9esuSmzivIuFzirvG1eD3NqmPFDHr4zTacDZyjkuudwujseF7q6yWIj3eDK+hcdrz4uSJ5OncmLkxcgKpN/fZa7lRX2XbWiZDV8dZgX0KnIC7WnHP5hxW4UX/Ko+erMryfaR7RRi0li4lx132Ni
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:25.0891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40ef9c2-9352-4b4a-b6d0-08df12351dd0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB735095

A vGPU instance is created in the VFIO open path. Before creating it,
the path queries the VF's assigned vGPU type and its properties to
determine how much of each resource to allocate.

Add GMC queries for the assigned vGPU type and its properties, decoding
the NVKV response with the vGPU properties schema.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs              |  1 +
 drivers/gpu/nova-core/gsp/cmdq.rs         |  1 -
 drivers/gpu/nova-core/gsp/fw.rs           |  2 +-
 drivers/gpu/nova-core/vgpu.rs             |  2 +
 drivers/gpu/nova-core/vgpu/commands.rs    | 71 +++++++++++++++++
 drivers/gpu/nova-core/vgpu/fw.rs          | 17 +++++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 93 +++++++++++++++++++++++
 7 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 5b1e4eb7cad8..c961ea029fed 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -28,6 +28,7 @@
 mod regs;
 
 pub(crate) use fw::{
+    r000_00 as bindings,
     GspFmcBootParams,
     GspFwWprMeta,
     LibosMemoryRegionInitArgument,
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 137242ca0b11..f4a0c8671bc8 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -505,7 +505,6 @@ pub(crate) struct GmcResponse {
     /// Response status (`NV_STATUS` code). Zero means success.
     pub(crate) status: u32,
     /// Response payload copied out of the message queue.
-    #[expect(dead_code)]
     pub(crate) payload: KVec<u8>,
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ac94fb564bfd..882780f38ba6 100644
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
index 6a876f8539f0..0f9f5be752b5 100644
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
index 000000000000..b5fa3575b1d7
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! vGPU firmware command operations.
+//!
+//! Sends requests, checks responses and coordinates the firmware command
+//! sequences used by instance lifecycle operations.
+
+use kernel::prelude::*;
+
+use crate::gsp::{
+    cmdq::Cmdq,
+    nvkv::{
+        nvkv_words,
+        Decoder,
+        UnknownKeyPolicy, //
+    },
+};
+
+use super::fw::commands::VgpuPropertiesSchema;
+
+pub(super) use super::fw::commands::{
+    Dbdf,
+    VgpuProperties, //
+};
+
+use super::fw::{
+    GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
+    GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
+};
+
+/// Query the vGPU type assigned to a VF by its DBDF.
+#[expect(dead_code)]
+pub(super) fn query_assigned_vf_type(cmdq: &Cmdq<'_>, dbdf: Dbdf) -> Result<u32> {
+    let request = u64::from(dbdf.into_raw()).to_le_bytes();
+    let response =
+        cmdq.send_gmc_and_receive(GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE, &request, 64)?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+    let bytes = response.payload.get(..4).ok_or(ENODEV)?;
+    Ok(u32::from_le_bytes(bytes.try_into().map_err(|_| EINVAL)?))
+}
+
+/// Query and decode the firmware properties of one vGPU type.
+#[expect(dead_code)]
+pub(super) fn query_vgpu_properties(cmdq: &Cmdq<'_>, type_id: u32) -> Result<KBox<VgpuProperties>> {
+    let response = cmdq.send_gmc_and_receive(
+        GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
+        &type_id.to_le_bytes(),
+        4096,
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+
+    let properties = decode_vgpu_properties(&response.payload)?;
+    if properties.type_id != type_id || properties.max_instance == 0 {
+        return Err(EINVAL);
+    }
+    Ok(properties)
+}
+
+/// Decodes a byte-oriented GMC vGPU-properties response with the typed NVKV schema.
+fn decode_vgpu_properties(payload: &[u8]) -> Result<KBox<VgpuProperties>> {
+    let words = nvkv_words(payload, &[])?;
+    let decoder = Decoder::new(&words, UnknownKeyPolicy::Ignore);
+    let mut schema = VgpuPropertiesSchema::default();
+    let properties = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
+    Ok(properties)
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
index 000000000000..51226bbca757
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -0,0 +1,93 @@
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
+use crate::gsp::nvkv::{
+    nvkv_decode,
+    Array,
+    Key,
+    KeyId,
+    Required, //
+};
+
+bitfield! {
+    pub(in crate::vgpu) struct Dbdf(u32) {
+        2:0 function;
+        7:3 device;
+        15:8 bus;
+        31:16 domain;
+    }
+}
+
+nvkv_decode! {
+    pub(in crate::vgpu) struct VgpuPropertiesSchema => VgpuProperties {
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
+pub(in crate::vgpu) struct VgpuProperties {
+    name: ArrayVec<u8, { Self::STRING_LEN }>,
+    class: ArrayVec<u8, { Self::STRING_LEN }>,
+    pub(in crate::vgpu) type_id: u32,
+    pub(in crate::vgpu) bar1_length: u64,
+    pub(in crate::vgpu) max_instance: u32,
+    ecc: u32,
+    profile_size: u64,
+    max_fps: u32,
+    num_heads: u32,
+    max_res_x: u32,
+    max_res_y: u32,
+    pub(in crate::vgpu) dev_id: u32,
+    pub(in crate::vgpu) subsystem_id: u32,
+    pub(in crate::vgpu) fb_length: u64,
+    pub(in crate::vgpu) gsp_heap_size: u64,
+    fb_reservation: u64,
+}
+
+impl VgpuProperties {
+    const STRING_LEN: usize = 64;
+}
