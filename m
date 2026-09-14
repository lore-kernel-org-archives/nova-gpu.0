Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017393F787E
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372421; cv=fail; b=IN1PdVAq8cw6lT1COa9RZWqZBuUnDgfT+D4t3Kon1+t7oq31kftCZ+veHkfiY+0eIUkoS5aZRjGvfgGA6eINQ9xp8mm3lez1mMKTa/IjAR1vseRlpGsSFz6sHmLPB552qTXKOO0xF8+FLUwjvWX8+pXNHTLFQSdB1+tCtu5woCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372421; c=relaxed/simple;
	bh=o+4RUkIuY6+QNQF3WuvVwcYaTgI7d8vyubIjehA/Ico=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STvsIW3jFLOK6tP5IUui5ruYaXA1tmT119XtDK5SnGweKeXhPu1mAhx495SaMiM6cCHrcUOBebLpMosGl/Nde0otwwmZsr0MtuUv3ToEiEMBO/uXtvTZnqhFEixTYSVAYy2SV7ew2zBBojsJH7t8phqy7IXxNnXWcfgW+ihb7Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BJU5AB+t; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BJU5AB+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMK0M6hAD6ebLSzcCIWLeXj4Hwad3wfKMh/vrJw+HOAYEMaDJcQZvw44vEIYGIrAfx7Rfd+Bxkjq5iXTdAbTKwno6WvBxrAbB2LWNoP8s27v6nRAd/jkPVUU06zZhFysQdW5qO9L1X+A4aCnflI6mzW6OsE6UEPL98UXFEmxQtSwnUvd2c55ggb4Six9nb95b4MUz//bGQ4uw2hwafmAptXgxnQwIq7RlOETQQt9pPxAN7guaGtmYXGmqT4N/y24o47nCGxhsNMvnCcHRe93RU0lCe3HrykGa2PGL9wDBFTcYNol+8oWfkXtz9f7FC33K6ly3yKjHcCKULEqzMrAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A9500rDLY/97PT1YiZWJcyf/7CwwWikj5H8N0i/LY8=;
 b=f6eAToljmYSqVWv1F7ihVAC6PsgwKuecvcUtfe14tPrcXovEU4DRtBk91Ag5rtSAgfve5OyW2Vknk6suAdlfh2SSY3jicVaqZbUPFf+14dFMeG1MHWmQGsiOtKFzFYq8xQr1KskKeZdb1Vnpd6iekAW/+dKQUvNk+Ib5oQSWpmahGgJeLsiY1kYTcx/PpCGz2//oaxPsE0CMFj/lydLbTKHg/0A8yTYeq16Jh0TxtsOeGLa+U6hSuqy21+HYin8wj6AeDIaKPVAWuMcMMYZXt9R2x3oxTH4/lXnzw5EM7M9ZBwv5aSAAE6w+7fgU/0CmXeDiufndFZ6iG9X1XIjm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A9500rDLY/97PT1YiZWJcyf/7CwwWikj5H8N0i/LY8=;
 b=BJU5AB+tknFmQ7TNG9UoL6bSbBJmqKoxVckQxMiNOGNokrJLKjiadEZz5ixRYFPsLsJMBwLtqOabRXqqCvIdmgPHxWQP/tPa9rh76ZVIZGvrgAIggOQ09ETWzh9RfzmN3OJhYYFBL4xf/OvYVBJYpq5CC+zKsG2eHeO1vz1Oml9R6X3OTCi5XXTyr4npHh4E9FsWgwl6mp+1PErsb3rwtM4FZDfB/OQnlrgg01g7HYqjK4SI5Pa56ViKGY5RFqFJaysegzSROIVCnPxNyJF4y0rcW54K0p3BT9Gv8AGt8YIJ9lUWPclIg509BkJoOlW87iUj+2XU5ZGpMVVI0hbVIw==
Received: from CH0P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::16)
 by SJ0PR12MB6687.namprd12.prod.outlook.com (2603:10b6:a03:47a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:31 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::1) by CH0P223CA0005.outlook.office365.com
 (2603:10b6:610:116::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:53:13 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:12 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:53:04 -0700
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
Subject: [PATCH v2 28/32] gpu: nova-core: vgpu: send GSP plugin configuration parameters
Date: Mon, 14 Sep 2026 10:49:03 +0300
Message-ID: <20260914074907.1399629-29-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|SJ0PR12MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1a427d-05b0-4aaa-2a79-08df1235453d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|10067099003|3023799007|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	K5G5OFsgGsM5szRoBYqWEPLZl+s1LRFOLEHDcjgI/AkeLyZIg4xxHydvykBtA9okDKQxVP7ShkzRFQpXQ91oDfTlEfIlr8YcITf+gqoqxUneKpuvNKwYBv5wBLculBnXwMt9Sec3qXIvn9nbejHtKUYeWJ+3BV8tuVB63ni6BVxtb4OxTCjhzD6enqeZSo7u/SRgyNPM5UwKGXOrkuag8b8WUR+m+wxJLNpeNUGtQUdZV9rQzeELIShY6jukGfqVxkYz9teRjcg//OAGOu5T7XzEVWR9WGqbEoiwGqYlClzic0xcXx9X5QYsF4buxTb5BCmyoiNiiEatbECWJU6gkzgVjVbkF+D30QNiwic3PiConkfcGt1yPGCPGlcirXa7ZVKDGlv1U0HmkPVhfuiVeFLXnoH6z9C/bnL8rypdNjBN7/nS0z1ymgxZyX5X1BFP2+DFgbUR/0HgehACBp8+FYfb9sVp0q+hbUG3uRtR8OC4iMsiq45CdOa/qfvqbXSSu+GkBXxlqTakAZgLeqJXuDy8mkObUurUUoNocXHUOb3bJli+hsTUkWMlB567jthgt83iX9JC91W2iReRCilS7KiK7+Itt1CJYl+a5W+/S+ODpyfAV0J4iXb6DglQLO7iMk/gwxB6lGIBlM/XRE4KYLxlchuisX2aFi+FS5EhhZvAlY7/0d68ioMqTHXmKdpgULPjUVq7qW85u/eSMTU9sQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x5odYu5bgFE3X7Js3/jINp4zACBI1vGPEwDcJ0xBsCYirojDBDY+SmRMobzDXl0Irea56ky4mDVWIfmWCZIbWCKNRmq7ji4tjplwc20oGRpYwLKPn5689RNPhSpF/Soel0K86QQ+iG3jM29oZWVq5RlZ+udMEiZ5Swi9454p3wX1JBSZi/3vYZu/lKOdYmwosKnlv2kny1xhQOrot+CZA0a6tWqsdt+IOjEJzQv7IEoRGdRwlbdxZBULZn5mqtfOlX2JSJrGPZ547jXM2nX/oZHTG9DoHuZtPzGAf33/mbmShi44Sk5XKOkVP9HUHrAii02MSXSLwgadhTamZmPp5LPWaqVepkjQGMmoOv3eVOXbDvgJF2vM8eooVtV6SFt0w2RohO/VieiWaH0YefaLUfCB6aois5kz8iUKVpI6BMtDAIjuFsj5A5Aea9ffBQyI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:31.2635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1a427d-05b0-4aaa-2a79-08df1235453d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6687

The GSP plugin needs the instance identity, channel allocation and host
parameters before it can serve guest requests.

Encode these parameters as an NVKV stream, prefix it with its word count
and send SETUP_CONFIG_PARAMS_AND_INIT after protocol negotiation.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs       |  17 +++
 drivers/gpu/nova-core/vgpu/fw/commands.rs    | 126 +++++++++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs |  18 +++
 drivers/gpu/nova-core/vgpu/instance.rs       |  20 ++-
 4 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index abc85b0365f2..2089c91b648e 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -160,3 +160,20 @@ pub(super) fn negotiate_plugin_version(
 ) -> Result {
     rpc.rpc_call(dev, bar0, gfid, RpcMessage::VersionNegotiation, &[])
 }
+
+/// Send an instance's encoded configuration to the GSP plugin.
+pub(super) fn send_plugin_config(
+    dev: &device::Device<device::Bound>,
+    bar0: Bar0<'_>,
+    gfid: Gfid,
+    rpc: &mut PluginRpc<'_, '_>,
+    config: &[u64],
+) -> Result {
+    rpc.rpc_call_nvkv(
+        dev,
+        bar0,
+        gfid,
+        RpcMessage::SetupConfigParamsAndInit,
+        config,
+    )
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index b765d30a1d61..0386c8178962 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -32,6 +32,7 @@
 #[repr(u32)]
 pub(in crate::vgpu) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+    SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
 }
 
 bitfield! {
@@ -259,3 +260,128 @@ pub(in crate::vgpu) struct VgpuProperties {
 impl VgpuProperties {
     const STRING_LEN: usize = 64;
 }
+
+#[derive(Clone, Copy)]
+enum HypervisorType {
+    Unknown = 4,
+}
+
+impl From<HypervisorType> for u32 {
+    fn from(value: HypervisorType) -> Self {
+        value as u32
+    }
+}
+
+#[derive(Clone, Copy)]
+enum CpuArch {
+    Aarch64 = 1,
+    X86_64 = 2,
+}
+
+impl CpuArch {
+    fn host() -> Result<Self> {
+        if cfg!(target_arch = "x86_64") {
+            Ok(Self::X86_64)
+        } else if cfg!(target_arch = "aarch64") {
+            Ok(Self::Aarch64)
+        } else {
+            Err(EOPNOTSUPP)
+        }
+    }
+}
+
+impl From<CpuArch> for u32 {
+    fn from(value: CpuArch) -> Self {
+        value as u32
+    }
+}
+
+#[derive(Clone, Copy)]
+struct MigrationFeature(u32);
+
+impl MigrationFeature {
+    const PRESERVE_CTX_BUF: Self = Self(0x4000);
+}
+
+impl From<MigrationFeature> for u32 {
+    fn from(value: MigrationFeature) -> Self {
+        value.0
+    }
+}
+
+bitfield! {
+    struct FeatureFlags(u64) {
+        3:3 enable_uvm => bool;
+        5:5 vmm_migration => bool;
+    }
+}
+
+nvkv_encode! {
+    struct PluginConfigParamsRequest {
+        uuid: Key<[u8; 16], { Self::UUID_KEY }>,
+        dbdf: Key<Dbdf, { Self::DBDF_KEY }, u32>,
+        dev_inst: Key<u32, { Self::DEV_INST_KEY }>,
+        vgpu_type: Key<u32, { Self::VGPU_TYPE_KEY }>,
+        vm_pid: Key<u32, { Self::VM_PID_KEY }>,
+        swizz_id: Key<SwizzId, { Self::SWIZZ_ID_KEY }, u32>,
+        num_channels: Key<u32, { Self::NUM_CHANNELS_KEY }>,
+        num_plugin_channels: Key<u32, { Self::NUM_PLUGIN_CHANNELS_KEY }>,
+        vmm_cap: Key<u32, { Self::VMM_CAP_KEY }>,
+        migration_feature: Key<MigrationFeature, { Self::MIGRATION_FEATURE_KEY }, u32>,
+        hypervisor_type: Key<HypervisorType, { Self::HYPERVISOR_TYPE_KEY }, u32>,
+        cpu_arch: Key<CpuArch, { Self::CPU_ARCH_KEY }, u32>,
+        page_size: Key<u64, { Self::PAGE_SIZE_KEY }>,
+        feature_flags: Key<FeatureFlags, { Self::FEATURE_FLAGS_KEY }, u64>,
+    }
+}
+
+impl PluginConfigParamsRequest {
+    const UUID_KEY: KeyId = 0x0001;
+    const DBDF_KEY: KeyId = 0x0002;
+    const DEV_INST_KEY: KeyId = 0x0004;
+    const VGPU_TYPE_KEY: KeyId = 0x0005;
+    const VM_PID_KEY: KeyId = 0x0006;
+    const SWIZZ_ID_KEY: KeyId = 0x0010;
+    const NUM_CHANNELS_KEY: KeyId = 0x0011;
+    const NUM_PLUGIN_CHANNELS_KEY: KeyId = 0x0012;
+    const VMM_CAP_KEY: KeyId = 0x0020;
+    const MIGRATION_FEATURE_KEY: KeyId = 0x0021;
+    const HYPERVISOR_TYPE_KEY: KeyId = 0x0022;
+    const CPU_ARCH_KEY: KeyId = 0x0023;
+    const PAGE_SIZE_KEY: KeyId = 0x0024;
+    const FEATURE_FLAGS_KEY: KeyId = 0x0030;
+}
+
+/// Encodes plugin configuration parameters using the typed NVKV schema.
+pub(in crate::vgpu) fn encode_plugin_config_params(
+    uuid: [u8; 16],
+    dbdf: Dbdf,
+    vgpu_type: u32,
+    vm_pid: u32,
+    num_channels: u32,
+    num_plugin_channels: u32,
+) -> Result<EncodedStream> {
+    let request = PluginConfigParamsRequest {
+        uuid: uuid.into(),
+        dbdf: dbdf.into(),
+        dev_inst: 0.into(),
+        vgpu_type: vgpu_type.into(),
+        vm_pid: vm_pid.into(),
+        swizz_id: SwizzId::WHOLE_GPU.into(),
+        num_channels: num_channels.into(),
+        num_plugin_channels: num_plugin_channels.into(),
+        vmm_cap: 0.into(),
+        migration_feature: MigrationFeature::PRESERVE_CTX_BUF.into(),
+        hypervisor_type: HypervisorType::Unknown.into(),
+        cpu_arch: CpuArch::host()?.into(),
+        page_size: u64::try_from(kernel::page::PAGE_SIZE)?.into(),
+        feature_flags: FeatureFlags::zeroed()
+            .with_enable_uvm(false)
+            .with_vmm_migration(true)
+            .into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
index ff009f241c32..2b9bccd8acb5 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -26,6 +26,7 @@
         Instant,
         Monotonic, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -103,6 +104,23 @@ pub(super) fn rpc_call(
         self.wait_response(dev, sequence)
     }
 
+    /// Send an NVKV stream prefixed by its word count.
+    pub(super) fn rpc_call_nvkv(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+        message_type: RpcMessage,
+        encoded: &[u64],
+    ) -> Result {
+        let word_count = u64::try_from(encoded.len()).map_err(|_| EOVERFLOW)?;
+        let mut payload = KVec::new();
+        payload.extend_from_slice(&word_count.to_le_bytes(), GFP_KERNEL)?;
+        payload.extend_from_slice(AsBytes::as_bytes(encoded), GFP_KERNEL)?;
+
+        self.rpc_call(dev, bar0, gfid, message_type, &payload)
+    }
+
     fn wait_response(&self, dev: &device::Device<device::Bound>, expected_sequence: u32) -> Result {
         let start = Instant::<Monotonic>::now();
         let timeout = Delta::from_secs(120);
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index a65b95d11f88..c3ec24f48682 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -46,12 +46,14 @@
     query_vgpu_properties,
     send_bootload,
     send_cleanup,
+    send_plugin_config,
     send_shutdown,
     Dbdf,
     VgpuProperties, //
 };
 
 use super::fw::commands::{
+    encode_plugin_config_params,
     encode_vgpu_bootload,
     ChannelMapEntry, //
 };
@@ -195,6 +197,19 @@ fn bootload(
         Ok(())
     }
 
+    fn configure_plugin(&mut self, dev: &device::Device<device::Bound>, bar0: Bar0<'_>) -> Result {
+        let config = encode_plugin_config_params(
+            [0; 16],
+            self.dbdf,
+            self.vgpu_type.vgpu_type_id(),
+            self.vm_pid,
+            u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            self.num_plugin_channels,
+        )?;
+
+        send_plugin_config(dev, bar0, self.gfid, &mut self.plugin_rpc, &config)
+    }
+
     /// Stop the plugin when firmware may own instance resources.
     fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) -> Result {
         if self.needs_teardown {
@@ -357,7 +372,7 @@ pub(super) fn allocate_instance(
         }
     }
 
-    /// Boot the GSP plugin and negotiate its RPC version.
+    /// Boot and configure the GSP plugin for a registered instance.
     pub(super) fn activate_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
@@ -374,7 +389,8 @@ pub(super) fn activate_instance(
         instance.bootload(dev, cmdq, fifo_engine_list)?;
 
         instance.plugin_rpc.init_rpc()?;
-        negotiate_plugin_version(dev, bar0, gfid, &mut instance.plugin_rpc)
+        negotiate_plugin_version(dev, bar0, gfid, &mut instance.plugin_rpc)?;
+        instance.configure_plugin(dev, bar0)
     }
 
     /// Stop the plugin and release the instance's firmware and host resources.
