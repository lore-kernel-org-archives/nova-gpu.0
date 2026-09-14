Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA353F7A98
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372404; cv=fail; b=qFZ1JKTitWTb8NrkCrF5Y6LbOnZTBkNaSY7lNp629Mk1P0xpmK7zPb/9UYgnu6pu+w48MmfqAnturhQKtqd+/tpeizeUv0I0Q1WBs96WbW6/+nc+z+Emk9xnlpycPzLHnvyZSo3gAAR3+iwU5UAc+2hAAJsO7hKK96VBzTIxgGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372404; c=relaxed/simple;
	bh=hk5KQa0u4cCBq3OzJsaZ1EYOsx+sv1WXDwQy2RHn1YM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sx0BMhHNhjmoDyH2g6LvgQia9/ZPitDNKNKeofKXtSELb6yaVcbUubYSmVav2AwgPrZ8vlSMPn84STpQh0iVKRuzIUoqe33pGM2AQrS7iSlLeSMp7it3GMardZ1qbNGp3qr/bu9UXVAy1bInkGAeTTh0iioNhwLmPgbcza67w3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QgxjpMHP; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QgxjpMHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBIB5Awcgif407H9UfDDlblVkUySdTopgq3v4mK9l5kiR2rgMkn0OdhFjOhYeBlKMeJDsx3FlulT+nD3cVYtl5fdF3pgEsizHrgVU42kcTP2MJYi2bv+4ZRfTjrvvcU0Nu5smKdlw5WtQzmVLp9fmkUcfjrCsRk9FfNbBC2m/ZKqvCPKcR46QFx/CSo3B/rbBTIFQfl5riUhPnDSKUkemh+/J7bgk9Ckyh9n3EbTT2WmNe7yEgPdR70jLF7/FfqsGHolSfIAYOTpWTd6kW4+gUIpkG1jaq2N/ijEqXbg/dKJrc643SCCW67eDsHVl04IKSV5/U6C0ki0V0m7bMatTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIUCCeECdpimSiEQRiY+oPrF8SDcaN3HRsna9DsFyHE=;
 b=VBOy+loaR1P372vSU5J43XP2Mmcy3lLFNlQYHMPNV2srhmI/IBGFg5xQYyta2I/7GMeOOZcuZVhUOPNPeDPfEMEArKr5xuKo8CL/r+r9TYdG5wfomxCvbNpwnqMU4/JS08L7d1BMzydGbDR+UkV9xlPetcrTcW9UoyXc+Qrv7gN79WqUk63xE6o6S/w/S0iaUwIgnNmWEelc9ZD01Rc2kvgpltXHoQFEvf8uXeALo+5q+SxPZQWcVKSIp1u/wci/YJOv26AYzowjPJnaT9KGbL4Ybk/9nRu9APM83SAKpK68YGqeBxDYeTsPgffbMGq4QtK5WAOpQhMFTt5VjnhPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIUCCeECdpimSiEQRiY+oPrF8SDcaN3HRsna9DsFyHE=;
 b=QgxjpMHPNlf2d50eIwFZ84IdUerhsXd/syFMcUvZrrfGoxUiZr/ArvM0/UNukSKfvs1OWptnR2DUxo80ODeCbu47YDW7nZiZLzQjMaDUHwB9RW+VZBl8o0EV4fQbsUcW8h80LtUA4CqsufQkuwg3HMQdfxH+3/qgTt4Vyw433gRKnz7LyLWMiwuQXGwneo7nUqO3brfm6yS0jzJwG4QQrm8rFG2nL17ciYNtJ1vro+VQwjhbhfk609AYeH4sLxT5NruT8ZKohiNA+MLp5SHz0qPWRFW2WPuvMToVlg5/zGZV+uD2Axw69ePOxXAO1U2KqgYOnXH2Hd7IuKRrFS2X9g==
Received: from BN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:e4::33)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:16 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::2a) by BN0PR02CA0028.outlook.office365.com
 (2603:10b6:408:e4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:57 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:55 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:47 -0700
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
Subject: [PATCH v2 26/32] gpu: nova-core: vgpu: add GSP plugin RPC transactions
Date: Mon, 14 Sep 2026 10:49:01 +0300
Message-ID: <20260914074907.1399629-27-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f04ffcb-de0e-46c2-635c-08df12353c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Wi+EZ6rFtNBAH5vuZMpZVdezi89e+FFzBKRFoq1sID6GyHfbGzS24VJBWkhHSm9MxdpAJpveujC2GRFQcmTZnw6vQiO1ExWYe5B1T3PdMJV0PuD3qzuPEAX3wahiOO/x1Rd/7CU1WO0kpCUbj9zDBJdD6ErDqborVfPpKpjZb5hhbUqngJqdC8BItbIMKf+DaTfEiAigzP2vRFuo0kAWkEfYhvl9yFUs2rAWjz1j10OUd46jEIPjZ8gibSeCLWM3C9VScuQcVxeKfkiQC5vgvYf6WO/hQ+dvobINCJOJc/Z6KEkJC8QAV2Lz+cWMf8HAhP+36TiUJW9u/TTml7rOEVVpW34OJchQliL6nw7XrCBgtwha8PqO6qzjEay2RWqXatGK7rCru3N6ldQCYzoyPSCLZJA9a0BGP+BXljLJztexCJ+n+1yiHyxTvrps7qDN0EfQ/MS+krVB66j7abCPYD88Mgru2X2Md4zi3pMNHyYv89Tas9Log0gWj1kEblL9CV/iCT9WLSsWx1VTQO6SrK5K4XsFejS0hwKQ4LA/ItilRlB37eW/XMd4kR7trcAwK+3kqVXSEJLMuixAUzN5DJ9lXd0vh0Agz4+6h1T6qByZr0mowZGSPuSN5+1dpFdtibE0MSdz3PVbZb59/1u0ltsAOnqUg1N50DfvKH0WF3XqMiLs4QFWVuMB43XDf9JaFsqsWrE764xmH0NDMHRcKw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pUG9GQApjMnWgrVi1vbC6DdFXjpfrWbRKB3h9H9eX0KNZnGw1SsLe6T4ChU4p6NgzPHxsAqQESU5mZyRc51LyEhWdsEkoqJHOB6T8a3j79teh866M5UDmcSQ2f1czumdpfrsH5sjhNkaSIbKOZqhawnYeleCLycOX4eXtsnINr7TJyJi+MwfAWasW3sk7JrAPt98MgaWiZtYYhUjlgUw8r4EOr+v2Uwh8ZRpp2ncuwtaRTH2z7zKtVvr0Q9liUjkP/fDfv/G8krUiteGJek7hmk9eaT0Qq7JU7UfrBdxX2VbejKPrv/CEGMnkxUdrJWoOW3kErFo7w/7wakgNIwhQ12hEpL9KDc3u7N3T/q5HZ5IQhKPdub7vElp5VikSOu41jLiByFe2iIB/z/Cfjr+4Hu7rL6t1NVeso6kL2CWcxl1KImr2yxzie1edWuYLtjT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:15.7616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f04ffcb-de0e-46c2-635c-08df12353c04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303

The GSP plugin processes requests after the vGPU manager rings its VF
doorbell and publishes completion in the shared response buffer.

Add PluginRpc to own the communication mapping and track request
sequences. Copy each payload before publishing its sequence, ring the
doorbell and wait for the matching completion, checking firmware status
and enforcing a timeout.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs                 |  33 +++-
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/fw.rs              |  11 ++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs |  49 +++++-
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs  | 150 ++++++++++++++++++
 drivers/gpu/nova-core/vgpu/instance.rs        |  17 +-
 6 files changed, 251 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index bf43c71a53ee..af953aedb87b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,13 +7,17 @@
         Io,
         Mmio, //
     },
+    prelude::*,
     sizes::SizeConstants,
     time, //
 };
 use pin_init::Zeroable;
 
 use crate::{
-    driver::NovaRegisters,
+    driver::{
+        Bar0,
+        NovaRegisters, //
+    },
     falcon::{
         DmaTrfCmdSize,
         FalconCoreRev,
@@ -39,6 +43,33 @@
     pub(crate) NV_PBUS_SW_SCRATCH(u32)[64] @ 0x00001400 {}
 }
 
+// VIRTUAL_FUNCTION
+
+register! {
+    base: NovaRegisters;
+
+    // PF BAR0 exposes the virtual-function register window at 0x00b8_0000.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_DOORBELL(u32) @ 0x00b8_2200 {
+        31:0 handle;
+    }
+}
+
+impl NV_VIRTUAL_FUNCTION_PRIV_DOORBELL {
+    const DOORBELL_STRIDE: u32 = 32;
+    const DOORBELL_VECTOR: u32 = 17;
+
+    /// Notify the GSP plugin for the given guest function and read back the doorbell.
+    pub(crate) fn ring_gsp_plugin(bar0: Bar0<'_>, gfid: u32) -> Result {
+        let value = gfid
+            .checked_mul(Self::DOORBELL_STRIDE)
+            .and_then(|value| value.checked_add(Self::DOORBELL_VECTOR))
+            .ok_or(EOVERFLOW)?;
+        bar0.try_write_reg(Self::zeroed().with_handle(value))?;
+        bar0.try_read(NV_VIRTUAL_FUNCTION_PRIV_DOORBELL)?;
+        Ok(())
+    }
+}
+
 // PGC6 register space.
 //
 // `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 8919322dc057..221a2804f5da 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -25,6 +25,7 @@
 mod commands;
 mod fw;
 mod gsp_plugin_comm;
+mod gsp_plugin_rpc;
 mod hal;
 mod instance;
 mod vram;
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 03225b9833c3..9925d5ccf71f 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -44,3 +44,14 @@
 
 pub(super) const GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
+
+/// State observed in the response buffer for an expected RPC sequence.
+pub(super) enum RpcResponse {
+    Pending {
+        /// Last sequence completed by firmware.
+        sequence: u32,
+    },
+    Complete {
+        status: u32,
+    },
+}
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index 5d129a1b908f..20695929a58c 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -17,7 +17,8 @@
 use super::fw::{
     self,
     RawControlRegion,
-    RawResponseRegion, //
+    RawResponseRegion,
+    RpcResponse, //
 };
 
 /// Physical VRAM regions containing the vGPU plugin logs.
@@ -238,7 +239,6 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
     }
 
     /// Initialize the shared control and response buffers for plugin RPC.
-    #[expect(dead_code)]
     pub(super) fn initialize(&self) -> Result {
         self.write_u64(
             &self.control,
@@ -336,6 +336,51 @@ pub(super) fn initialize(&self) -> Result {
         )
     }
 
+    /// Copy and publish one RPC request to firmware.
+    pub(super) fn submit(&self, message: u32, sequence: u32, data: &[u8]) -> Result {
+        if u64::try_from(data.len()).map_err(|_| EOVERFLOW)? > self.message.size() {
+            return Err(E2BIG);
+        }
+
+        for (index, chunk) in data.chunks(size_of::<u32>()).enumerate() {
+            let mut bytes = [0u8; size_of::<u32>()];
+            bytes[..chunk.len()].copy_from_slice(chunk);
+            let field = index.checked_mul(size_of::<u32>()).ok_or(EOVERFLOW)?;
+            self.write_u32(&self.message, field, u32::from_le_bytes(bytes))?;
+        }
+
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
+            message,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            sequence,
+        )
+    }
+
+    /// Read firmware's response for an expected RPC sequence.
+    pub(super) fn response(&self, expected_sequence: u32) -> Result<RpcResponse> {
+        let sequence = self.read_u32(
+            &self.response,
+            core::mem::offset_of!(
+                RawResponseRegion,
+                __bindgen_anon_1.message_seq_num_processed
+            ),
+        )?;
+        if sequence != expected_sequence {
+            return Ok(RpcResponse::Pending { sequence });
+        }
+
+        let status = self.read_u32(
+            &self.response,
+            core::mem::offset_of!(RawResponseRegion, __bindgen_anon_1.result_code),
+        )?;
+        Ok(RpcResponse::Complete { status })
+    }
+
     /// Invalidate the PTEs and release the communication mapping.
     pub(super) fn destroy(self, mm: &mut GpuMm<'_>) -> Result {
         self.map.destroy(mm)
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
new file mode 100644
index 000000000000..bc5d576d8601
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin RPC.
+//!
+//! ```text
+//! Host (PluginRpc)       Shared RPC buffer (VRAM)       GSP plugin
+//!       |                           |                       |
+//!       |-- BAR1: payload --------->| Message               |
+//!       |-- BAR1: type, sequence -->| Control               |
+//!       |                           |                       |
+//!       |-- BAR0: VF doorbell ----------------------------->|
+//!       |                           |<-- read request ------|
+//!       |                           |                       | process RPC
+//!       |                           |<-- completion --------|
+//!       |-- poll processed seq ---->| Response              |
+//!       |<-- matching seq, status --|                       |
+//! ```
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
+    driver::Bar0,
+    mm::GpuMm,
+    regs::NV_VIRTUAL_FUNCTION_PRIV_DOORBELL, //
+};
+
+use super::{
+    fw::RpcResponse,
+    gsp_plugin_comm::CommBufferRegion,
+    instance::Gfid, //
+};
+
+/// BAR1-backed channel used to communicate with one GSP plugin.
+pub(super) struct PluginRpc<'map, 'gpu> {
+    comm: CommBufferRegion<'map, 'gpu>,
+    message_sequence: u32,
+}
+
+impl<'map, 'gpu> PluginRpc<'map, 'gpu> {
+    pub(super) fn new(comm: CommBufferRegion<'map, 'gpu>) -> Self {
+        Self {
+            comm,
+            message_sequence: 0,
+        }
+    }
+
+    pub(super) fn comm(&self) -> &CommBufferRegion<'map, 'gpu> {
+        &self.comm
+    }
+
+    /// Initialize the control and response buffers for the first RPC.
+    #[expect(dead_code)]
+    pub(super) fn init_rpc(&mut self) -> Result {
+        self.comm.initialize()?;
+        self.message_sequence = 0;
+        Ok(())
+    }
+
+    fn next_sequence(&self) -> u32 {
+        let sequence = self.message_sequence.wrapping_add(1);
+        if sequence == 0 {
+            1
+        } else {
+            sequence
+        }
+    }
+
+    /// Write one RPC message, ring the VF doorbell, and wait for its response.
+    #[expect(dead_code)]
+    pub(super) fn rpc_call(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+        message_type: u32,
+        data: &[u8],
+    ) -> Result {
+        let sequence = self.next_sequence();
+        self.comm.submit(message_type, sequence, data)?;
+        self.message_sequence = sequence;
+
+        dev_dbg!(
+            dev,
+            "vGPU RPC: gfid={} type={} bytes={} sequence={}\n",
+            gfid.0,
+            message_type,
+            data.len(),
+            sequence,
+        );
+
+        NV_VIRTUAL_FUNCTION_PRIV_DOORBELL::ring_gsp_plugin(bar0, gfid.0)?;
+        self.wait_response(dev, sequence)
+    }
+
+    fn wait_response(&self, dev: &device::Device<device::Bound>, expected_sequence: u32) -> Result {
+        let start = Instant::<Monotonic>::now();
+        let timeout = Delta::from_secs(120);
+
+        loop {
+            match self.comm.response(expected_sequence)? {
+                RpcResponse::Complete { status } => {
+                    if status != 0 {
+                        dev_dbg!(
+                            dev,
+                            "vGPU RPC: sequence {} failed with status {}\n",
+                            expected_sequence,
+                            status,
+                        );
+                        return Err(EIO);
+                    }
+
+                    dev_dbg!(
+                        dev,
+                        "vGPU RPC: sequence {} completed after {:?}\n",
+                        expected_sequence,
+                        start.elapsed(),
+                    );
+                    return Ok(());
+                }
+                RpcResponse::Pending { sequence } => {
+                    if start.elapsed() >= timeout {
+                        dev_dbg!(
+                            dev,
+                            "vGPU RPC: sequence {} timed out; last response was {}\n",
+                            expected_sequence,
+                            sequence,
+                        );
+                        return Err(ETIMEDOUT);
+                    }
+                }
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    }
+
+    /// Release the BAR1 mapping.
+    pub(super) fn destroy(self, mm: &mut GpuMm<'_>) -> Result {
+        self.comm.destroy(mm)
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 535e5ab7c2ad..994b046802c1 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -31,6 +31,7 @@
 
 use super::{
     gsp_plugin_comm::CommBufferRegion,
+    gsp_plugin_rpc::PluginRpc,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -135,7 +136,7 @@ pub(super) struct VgpuInstance<'gpu> {
     chids: ChannelIdReservation<'gpu>,
     num_plugin_channels: u32,
     vram_slot: VgpuVramSlot,
-    comm: CommBufferRegion<'gpu, 'gpu>,
+    pub(super) plugin_rpc: PluginRpc<'gpu, 'gpu>,
     needs_teardown: bool,
 }
 
@@ -149,7 +150,7 @@ fn bootload(
     ) -> Result {
         let fb = &self.vram_slot.fbmem;
         let mgmt = &self.vram_slot.mgmt_heap;
-        let logs = self.comm.plugin_logs();
+        let logs = self.plugin_rpc.comm().plugin_logs();
 
         let payload = encode_vgpu_bootload(
             self.dbdf,
@@ -182,11 +183,11 @@ fn bootload(
             payload.len() * size_of::<u64>(),
         );
 
-        self.comm.clear_plugin_ready()?;
+        self.plugin_rpc.comm().clear_plugin_ready()?;
         self.needs_teardown = true;
         send_bootload(cmdq, &payload)?;
 
-        wait_plugin_ready(dev, &self.comm)?;
+        wait_plugin_ready(dev, self.plugin_rpc.comm())?;
 
         dev_dbg!(dev, "bootload: gfid={} plugin ready\n", self.gfid.0);
         Ok(())
@@ -263,9 +264,11 @@ fn release_vram_slot(&mut self, slot: VgpuVramSlot) -> Result {
 
     fn release_instance(&mut self, instance: VgpuInstance<'gpu>, mm: &mut GpuMm<'_>) -> Result {
         let VgpuInstance {
-            comm, vram_slot, ..
+            plugin_rpc,
+            vram_slot,
+            ..
         } = instance;
-        let result = comm.destroy(mm);
+        let result = plugin_rpc.destroy(mm);
         self.release_vram_slot(vram_slot)?;
         result
     }
@@ -340,7 +343,7 @@ pub(super) fn allocate_instance(
             chids,
             num_plugin_channels: 3,
             vram_slot,
-            comm,
+            plugin_rpc: PluginRpc::new(comm),
             needs_teardown: false,
         };
         match self.instances.push_within_capacity(instance) {
