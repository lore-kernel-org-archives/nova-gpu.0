Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51549DBBA
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591586; cv=fail; b=kkHeYny/Wu8+1OcCwZN7I5n8YwNqjjofkMHoqOEsed9MTG+jqu8zVoqUJeOglv9HsbNcMabHWhyp1D0D21HmqsKu40oFYFgTgqR+ppTA2oaXwF5X6fl35RkbDC2Y/7/P0ruxL0YcY+sfNmA0pdgXpDjHjE0NpeoBL3LSfIV1+LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591586; c=relaxed/simple;
	bh=fTVS94wK0CjPQXBks2VnvbZTCfLz2SPZL4Yt5O9xKok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWC3gqP/3M0ntI2XI1sdn9Yb3i1r1hz89unueZow+RzcPKS/RymC1gNLDRYABPPW46IVyxnLXXApRgrTg/K4DrUM6gByf0SuiQ4u7MClHjXYa3LrgGu8b4+ASmyUOt7ZZYVMIqyCAe5+x1bf8ayHq7SFE+ea8hwhsCjP8RFMELY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G7CY2SR1; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G7CY2SR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1/Ra+CbubH9uwcuhgVmMxC1QRJ+iu4Pj4Pm5/qMzO1WzIxA0Z3LAiPYAHZDkp4t6Ot+IZAJX33ZEk/ucRLy2BH2LEiabC30UmboZvQdykVxjRhJhwuPZC54PwKwtbhZ001GRPrl3vJWWWT/0JsrJ/YBv7wtz0GJ2ozOy4gDSx6mOL0qTKmDyMF7OEPZakIHbMwBt7rUjTFqZO7k6w226w8K2of9DTbB/RHuWT9etIkI6+8tPdVi6LtevfEDA+cfaYfqc/XNd7U+yK3Ja7BeQFanQ4C0Y2mtaGul6QRuJUBJSG26breHPNnZoT+FISWhmpvKVXxAzqWkGYsynGZ6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a7B5hxG8Nnl6NtXAWYtbJBZSIAIc/LOk8mpMJnOBCY=;
 b=CwkFLW1SrA4CupE2umXxHeFfRdlxkN0eJIbF9pLE22CZGuYQhokW92mEi4N6rwkmnBNJKmiLnrotRln8vQZxbstBauxlu5HEwS84oCnNC38DX8LNihXxGrwRHBg9C4ku7IS4s4LBCBocg1ZyWAkTN/ILtMHc5BhYANVqwWzMKqeSy4nP3HIGzVPP81oKtDF6w8EYaULWShUhtlESaimOn0nKYLfj8eU0XtKRXUEJpp+LvqPZRATJSQObhnbz01aAML9DOfe+ElIdcePPD7GbNtaLpSpYguh6grft7Yly1W/QkyD2UaOdMg0xaToK2L09G6vXmOJ7AJDwNte5HijezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a7B5hxG8Nnl6NtXAWYtbJBZSIAIc/LOk8mpMJnOBCY=;
 b=G7CY2SR16iECUyJnSrllsyOViyKzSSmadqVx3ytgchR+FCLKnUTIdfELStr4C8qIUJ37+jukttzE6BaNxmG2Lah5gpp4uld9qMW90K/k/Z3rawBLdV7yzuO2X6036T0U+XxFyEjWBL099TAzR/D3X6G+g2+DseDEudZ4pki2P5BAWlTef2zyDSnFyb4vs7lQnCoauG3e2AwK1882E1M4h56BwWaoIJlQZLAqBgr5SOCVfrrVtnuQ/5XRp59VNXNgBMcHq+fBN0Yg+s2q1s+Azq8LnnLNM3TMmc2+KnMFj+8YGacwsO24E/GxDxHzSqYGN+KRlhpLpq+QCEBO3SJbVw==
Received: from BY1P220CA0046.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::8)
 by PH7PR12MB6609.namprd12.prod.outlook.com (2603:10b6:510:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:32:51 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::7a) by BY1P220CA0046.outlook.office365.com
 (2603:10b6:a03:59e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:32:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:34 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:33 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:25 -0700
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
Subject: [PATCH v3 26/31] gpu: nova-core: vgpu: send GSP plugin configuration parameters
Date: Mon, 28 Sep 2026 13:28:29 +0300
Message-ID: <bce58d597d03e212398fde58eb935c2aed560cd3.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|PH7PR12MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abb5729-8075-4679-7e06-08df1d4bd939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|3023799007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0QhspRyINaWfp9sAOASyuMn+2nkD74omvpc2HazYNkXOZaVaB3hJFS5XbmsZm3PDDr00vskaNjev3QgPAn5Zc2h1W5YxAaCmVYU2TGdQ0IuQz601mU1sdS3jwtcYqp+347Fjl5Q7iR3z2w47KKVpIx0x1SribjmR8I2kj3Ocuo28CJMgYnO1/rQlpwvMBX7ogALrtmMLIDB8Oz0q0tN14YL8pyAcy5eCQ08jMHukY9nRE/nwCooK3+Gor8ELZb8mE3Fyx9+pZWnYNWQRYTHziltI/SlaieeAOxI5vaG/j4S/odZow7JOQPaLLNPoR0Wulkg9hrPu5/KRZuCPsc/ZXNMLVYN/uBA5S2Xoe5vZeTVS5YRVplGDOu/QM76N1lt2UbfXa48w/tRt0oLZdSHUAJOV68s7jULjIv6Mg9EFYG4GkwGh1jPovtRf0iAYslbJX0OTH+T5giyX1D/Q93hN89o8/ff99ZWhaeZPJj0y6REiDQDNRHc23WTdrreGkMFC3o4h/yspGox93RPAKLDw/gofNR6qg5qUCw0pAZBqJRlipy0X0G1C2FJUKYplehdQKIK82UNJTk6m8EbXbGqFaucSZeFlZFV8c0RYH+UWfaIEgU1nIjxI3EHhO9+aJ0Gp8YsDsH0uwd6KumIHZ/6pl891Nv0LZ5bvZevUwiH6BBWwnKdzEeWQAMHRiqWD/bYds7AxLNpEqHMvEeCOAdSy7A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2EGSnSStWA3MhJK8wKXw1wEi3JKLhxn9REEdIZrFMHdHRBy9hdS9s2RnQw7f1GT8Y93NCrpPinQKP6RdTnEJaS0EblR0u6CcFmMEPDTDG4xKZaee9PjJRRgUYFF/GqWQ9yWKFpO5lfXvXLH1d/ahGSkU1G8k9MdyBofOOONPKGH2SmD9dQ06VdVjUrbvOHIBz9l8+qZzrAf1UhNXSAKkr3FVYvi1nsHBhO05QYm4OLyVHwdZcEEpG5C0BUr3edzLwIR6nc7lypoUDKHZUAZ8vJ9hOdZvlMhtsng0le2qXDhkXU1gLp0mTi630MmG9aHztwbnvI1A+o21iSNhLfZKgR7NWQpPs8wWCxOiPRC4jnjRuK4RTwtWToElq4+GTpd6xk9n4bSeEgsksCIeGgr4e2A6suIhTGGagDQ4LhCwkQZseGFIUCu8hNJqQMfJILtU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:51.3163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb5729-8075-4679-7e06-08df1d4bd939
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6609

The GSP plugin needs instance identity, channel allocation and host
parameters before it can serve guest requests.

Encode the configuration as an NVKV stream, prefix it with its word
count and send SETUP_CONFIG_PARAMS_AND_INIT after protocol negotiation
through the instance's PluginRpc channel.

Derive the host's opaque device identity from the VF DBDF within the
supported 16-bit PCI segment namespace. This identifies the local device
without imposing a migration-persistent identity.

Describe the supported whole-GPU configuration and distinguish the
optional VMM capability bitmap from the separately reported migration
features. Encode the host page size with the kernel's infallible
conversion.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs       |   9 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs    | 135 +++++++++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs |  17 +++
 drivers/gpu/nova-core/vgpu/instance.rs       |  16 +++
 4 files changed, 177 insertions(+)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 268c3043d88b..ec40a960069b 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -169,3 +169,12 @@ pub(super) fn negotiate_plugin_version(
 ) -> Result {
     rpc.rpc_call(dev, RpcMessage::VersionNegotiation, &[])
 }
+
+/// Send an instance's encoded configuration to the GSP plugin.
+pub(super) fn send_plugin_config(
+    dev: &device::Device<device::Bound>,
+    rpc: &mut PluginRpc<'_, '_>,
+    config: &[u64],
+) -> Result {
+    rpc.rpc_call_nvkv(dev, RpcMessage::SetupConfigParamsAndInit, config)
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 915585706174..e3b5198e9c80 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -9,6 +9,7 @@
 use kernel::{
     alloc::ArrayVec,
     bitfield,
+    num::casts::usize_as_u64,
     prelude::*, //
 };
 
@@ -35,6 +36,7 @@
 #[repr(u32)]
 pub(crate) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+    SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
 }
 
 bitfield! {
@@ -263,3 +265,136 @@ pub(crate) struct VgpuProperties {
 impl VgpuProperties {
     const STRING_LEN: usize = 64;
 }
+
+#[derive(Clone, Copy)]
+#[repr(u32)]
+enum HypervisorType {
+    Unknown = 4,
+}
+
+impl From<HypervisorType> for u32 {
+    fn from(value: HypervisorType) -> Self {
+        // CAST: `HypervisorType` uses the wire field's `u32` representation.
+        value as u32
+    }
+}
+
+#[derive(Clone, Copy)]
+#[repr(u32)]
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
+        // CAST: `CpuArch` uses the wire field's `u32` representation.
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
+        device_instance_id: Key<u32, { Self::DEVICE_INSTANCE_ID_KEY }>,
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
+    const DEVICE_INSTANCE_ID_KEY: KeyId = 0x0004;
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
+pub(crate) fn encode_plugin_config_params(
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
+        // The full host PCI address distinguishes VFs within a VM, including VFs
+        // from different PFs. This opaque identity lasts for the host device lifetime.
+        device_instance_id: dbdf.into_raw().into(),
+        vgpu_type: vgpu_type.into(),
+        vm_pid: vm_pid.into(),
+        swizz_id: SwizzId::WHOLE_GPU.into(),
+        num_channels: num_channels.into(),
+        num_plugin_channels: num_plugin_channels.into(),
+        // Advertise no optional VMM capabilities (vmioplugin.h VMM_CAP_*),
+        // independently of the plugin feature_flags and migration_feature below.
+        vmm_cap: 0.into(),
+        migration_feature: MigrationFeature::PRESERVE_CTX_BUF.into(),
+        hypervisor_type: HypervisorType::Unknown.into(),
+        cpu_arch: CpuArch::host()?.into(),
+        page_size: usize_as_u64(kernel::page::PAGE_SIZE).into(),
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
index 696127c7169f..48977cd67792 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
@@ -19,6 +19,7 @@
 
 use kernel::{
     device,
+    num::casts::usize_as_u64,
     prelude::*,
     time::{
         delay::fsleep,
@@ -26,6 +27,7 @@
         Instant,
         Monotonic, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -105,6 +107,21 @@ pub(super) fn rpc_call(
         self.wait_response(dev, sequence)
     }
 
+    /// Send an NVKV stream prefixed by its word count.
+    pub(super) fn rpc_call_nvkv(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        message_type: RpcMessage,
+        encoded: &[u64],
+    ) -> Result {
+        let word_count = usize_as_u64(encoded.len());
+        let mut payload = KVec::new();
+        payload.extend_from_slice(&word_count.to_le_bytes(), GFP_KERNEL)?;
+        payload.extend_from_slice(AsBytes::as_bytes(encoded), GFP_KERNEL)?;
+
+        self.rpc_call(dev, message_type, &payload)
+    }
+
     fn wait_response(&self, dev: &device::Device<device::Bound>, expected_sequence: u32) -> Result {
         let start = Instant::<Monotonic>::now();
         let timeout = Delta::from_secs(120);
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 445d7f513fdc..247e88bdc82f 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -34,10 +34,12 @@
         negotiate_plugin_version,
         send_bootload,
         send_cleanup,
+        send_plugin_config,
         send_shutdown,
         Dbdf, //
     },
     fw::commands::{
+        encode_plugin_config_params,
         encode_vgpu_bootload,
         BootloadInfo,
         ChannelMapEntry, //
@@ -159,6 +161,7 @@ fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         self.bootload(dev, vgpu.cmdq, &vgpu.fifo_engine_list)?;
         self.plugin_rpc.init_rpc()?;
         negotiate_plugin_version(dev, &mut self.plugin_rpc)?;
+        self.configure_plugin(dev)?;
 
         Ok(())
     }
@@ -230,6 +233,19 @@ fn bootload(
         Ok(())
     }
 
+    fn configure_plugin(&mut self, dev: &device::Device<device::Bound>) -> Result {
+        let config = encode_plugin_config_params(
+            [0; 16],
+            self.dbdf,
+            self.vgpu_type.vgpu_type_id,
+            self.vm_pid,
+            u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            self.num_plugin_channels,
+        )?;
+
+        send_plugin_config(dev, &mut self.plugin_rpc, &config)
+    }
+
     /// Stop the plugin when firmware may own instance resources.
     fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) -> Result {
         if self.needs_teardown {
