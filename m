Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E038F250
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595994; cv=fail; b=Jx3IOSQeYo4qIJV+cV/ot/58My9P+ae9VghHatHtu+DjT9lGVPjUJj4dDjxB8YD0wSD3cwrgvCBOAfQ0/dXS38BQv6lIDj52d/z9RipPfSvCUAL26mK8YN9cTSzHkpy2+Rph0U4Cggsq+kTRyBJ1Eu1XVYaCFks1ZmcmvvxaVQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595994; c=relaxed/simple;
	bh=7/nB6HM/oqoPH7OIik8Pcn+qW/0KLQAzYtBneRK1+hM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9UM+LTAVb299cFwNUcpTcymSErCKSxJqLZaHC68g6mGR8Wg5v6bLpfmp4I3gXIpzeLlv1TmD+Tn3CYdD2yf4BAQbFsgcB2MXioDpeiP1QTcgKO1+N+MqbVIysL2QWTyrgttbPZLal82uCbu5oWA5fnZLbIq1Xjt9OPC9cwQukg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yz7WIdtT; arc=fail smtp.client-ip=52.101.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yz7WIdtT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOAuAIXFaUeiSnxeJT7PbWE4JPGFFc8kiKah5yvGpBrjBW8BIc5CiP5TEI11nlT4aZVo/ZUQ+tZ5dBCmKoRhisFi11/Nfd5M7pvhEXl6qTNhO0i+I8GIwHykYzT974fAxDCCZ1sB+u/S4EfdJeesEwGswMhWCYVrS+pElGKNNDgP/guFegF9IrSOxHVuu/QhFlXDhooI88gjO99FDBApPF4mOGERKG1I19ieQq0VhTrUQzoKyjvzJ3xFYSfen2BSF2BkNUgEbemT/mS4CXhI3+7CgoyFv4w4LeuEBBcWurdOaCU6ktL34ZSJrAFcqVeFh7l8LgqQkHfjerbuenr1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfHeJrkdzk+fQ/IBiqSIcYx0wBMdgr1ZDAjybSL+qYc=;
 b=G5+w0PQoquDgyQErzSe186Df4gtgg2XYLjxVZJgQqHSoW5nH0VJ5nN7WNrOaYuRlHF97aTl0yPJRipYb4pVzvdxT2T3/hBvjGiSKIs0lQIvqjsro38g8hlUOT73/Hn7ydiuPvFU0iZDm3b3QCzLJq4Q043cw0ax7jbWpWda+8V+ieiTa4HOGAwIdnSnIM3Bt1T6aWXlk1y8414Utt24wISGinnzCo1zvXNYex6fdU7efxAVTWiYuRorBNBuIg8bQAdNknRM6xglkxrdy5r/TL1G0fpkoM9zKijkkJJF4KJ5ff/rWxXBNPh8x4RcUGTTEBcpMU2TVAgmgCseYa9UYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfHeJrkdzk+fQ/IBiqSIcYx0wBMdgr1ZDAjybSL+qYc=;
 b=Yz7WIdtTjU58Ngxb87Ilp2l2Va/7vE05bymOcPWJnM1Atw9lv3tGNxncPsDRBLCMRZISt3ST8STqsKlGPrcFb2x2Y40sdzagLidx5Ms1mUroGcUKo/4y/kcR3jlhg6uJLsYCooeKj/hCTBT9C570PK129PvMcti+DXpYBQPvEIdcjGzStCOmIDFMuez+XI0ov/wDi+P86mWEXum/qt/xCtaMbSC9GDdJnuJrc/hBC6Ln8+MADhrCeEi+5gWbTdviqynkgawCIaYeR0/9S1Og2H/0KGMt6rxM04I8QE5fQoqbiiTmj+YCCroB59yckZ+6/dcGXdDZ23evpoOPv3Qlow==
Received: from BN1PR12CA0026.namprd12.prod.outlook.com (2603:10b6:408:e1::31)
 by PH7PR12MB6658.namprd12.prod.outlook.com (2603:10b6:510:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 08:12:51 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::25) by BN1PR12CA0026.outlook.office365.com
 (2603:10b6:408:e1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Sat, 5
 Sep 2026 08:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:37 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:36 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:28 -0700
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
Subject: [PATCH 08/13] gpu: nova-core: vgpu: implement PluginRpc channel and config params
Date: Sat, 5 Sep 2026 11:11:11 +0300
Message-ID: <20260905081116.106613-9-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|PH7PR12MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: d8acf7ab-57dc-499d-e4a1-08df0b257aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|10067099003|56012099006|22082099003|6133799003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	F1DJeoLUh+U6ifSo1UzxehUfSFd79SmKMp4HCGDFQ+NGbFv9+Osih0nEN1vNuaUT4sJxyKWdRymRGB/0HmK/UKzWoHvgO56HIrdoGR3tizVb0JTqY82MYjOBhgFV6s2UScXJoPLIynsexhlnWCBBJHAgjFpxWXbQane7Rei7pA2HpkjDpy6M+Eo1XH79CPjsP2L0neorLvtxlvid/VF34XJl6KjnQNihmA83zgK62rTm/RlhZphw7Fpw7siHUNnhgYLLFcpshBi7OFYOkkal52cJuNaT5Qe91W5yKSBkRT7bMuKH2cnmfLzQtNsvD8KXe9WmuCsyGPoP/A4qkD5CzELzTnnOCo6MTZZaNlFwCmNt6dxKqEMerbp02ABAVnCiuhB+LqWglCAPGsn3l8jieZHglKVk/MxAtdZWbsriMO1VWCPwXxEqTAmhy5N1qiOgOS2a6SY2wa6FTOF18MSCev2KmNIzMuTR1/txg1ia5pmjcu7zdWKk32y0eky8A+8V6OCFkpxTmXQcXeMZ3bJsLVgzMu2mTz0jthkMvkF3j22dI9MVft2TZZyrCu696adkPmG5fSnBE6dfoPFPlNnDcumiYz75Dy8H5vqHqAJmmYv96z1KdgcWiomOt4RHppuEp+PAwF89zEfK8g1dmCEZlED5+43voHYUm7vd6ej3BJ6GUq0t7534/ih1tHpEtJ4BpROLKi+JMzsTjNjCnU2fEA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(6133799003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZpO1s61rBxvrRgxfoQ8jIhfKYTvaEvol57H6srDdiA2gqGZam+RVDVnogRIrhb0GU+l2QFg1GXklKpPep966lCRGUdV6/t/Tzl23XD8KOlmj4g8RrUhiVpYEPi+BsAsFDAbC+RJtSB/fG6IIt5PNa87YD6O+cbekZhW5XpQsM/ZLA583Sq//cHuxymFfauDV6WEvXnI3xtjgrNhw6E24Dprb0zaPctOd2ohQqdAL7Nij0+dFhFQAdHUuuOXWpkAdoS8jf8uODZiUXDCPk59VVFQxDzf1L6LwMvy1cEoaB0D9/HIXHE0BkoBgxXgsXx2p2FxddTmlFIyPRm4pHrn8LGuNeo9YSRhN2NwUTgGxFN8rTcn2LlWK9Cyjo3r+sq8LcDXbcwzh/9BAKMDI2tDwU5UlIJQbn6U69z3Fe8XqRTTgzI3b1ALzqG2IpefMYJ5k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:50.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8acf7ab-57dc-499d-e4a1-08df0b257aa0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6658

Extend PluginRpc from a boot-ready poller into the BAR1-backed RPC
channel used by the vGPU plugin.

Initialize the control and response regions, publish NVKV-encoded
messages through the message region, ring the VF doorbell, and match
responses by sequence number. Negotiate the protocol, send the VM
configuration, and enable bus mastering after the plugin starts.

Keep raw firmware message IDs in fw/commands.rs and retain ownership of
the communication mapping in PluginRpc so teardown can release it after
firmware cleanup.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs     |   2 +
 drivers/gpu/nova-core/gsp/fw.rs           |   6 +
 drivers/gpu/nova-core/gsp/fw/commands.rs  |  45 +++++
 drivers/gpu/nova-core/mm/bar_user.rs      |  11 ++
 drivers/gpu/nova-core/vgpu/consts.rs      |   7 +
 drivers/gpu/nova-core/vgpu/fw.rs          | 192 +++++++++++++++++++-
 drivers/gpu/nova-core/vgpu/fw/commands.rs |  29 +++
 drivers/gpu/nova-core/vgpu/instance.rs    |  30 +++-
 drivers/gpu/nova-core/vgpu/plugin_rpc.rs  | 209 +++++++++++++++++++++-
 9 files changed, 519 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 481ec8e221ce..fbbff257300f 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -54,6 +54,8 @@
 };
 
 pub(crate) use fw::commands::{
+    encode_plugin_config_params,
+    encode_plugin_set_bme,
     encode_vgpu_bootload,
     ChannelMapEntry,
     Dbdf,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index d68b790533af..686120224d0f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -14,15 +14,21 @@ pub(crate) mod vgpu_bindings {
         GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE,
         GSP_PLUGIN_BOOTLOADED,
+        MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
+        MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+        MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
+        MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
         VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
         VGPU_CPU_GSP_CTRL_BUFF_REGION,
         VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_CTRL_BUFF_VERSION,
         VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+        VGPU_CPU_GSP_RESPONSE_BUFF_REGION,
         VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
         VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
     };
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index fe4a7af88ec7..d7d52fa33d29 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -784,6 +784,40 @@ impl PluginConfigParamsRequest {
     const FEATURE_FLAGS_KEY: KeyId = 0x0030;
 }
 
+/// Encodes plugin configuration parameters using the typed NVKV schema.
+pub(crate) fn encode_plugin_config_params(
+    uuid: [u8; 16],
+    dbdf: Dbdf,
+    vgpu_type: u32,
+    vm_pid: u32,
+    num_channels: u32,
+    num_plugin_channels: u32,
+) -> Result<KVVec<u64>> {
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
+        migration_feature: MigrationFeature::KVM.into(),
+        hypervisor_type: HypervisorType::Unknown.into(),
+        cpu_arch: CpuArch::X86_64.into(),
+        page_size: 4096.into(),
+        feature_flags: FeatureFlags::zeroed()
+            .with_enable_uvm(true)
+            .with_vmm_migration(true)
+            .into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
+
 // UPDATE_BME_STATE
 
 nvkv_encode! {
@@ -798,6 +832,17 @@ impl PluginSetBmeRequest {
     const BME_ENABLE_KEY: KeyId = 0x0100;
 }
 
+/// Encodes a plugin BME state update using the typed NVKV schema.
+pub(crate) fn encode_plugin_set_bme(enable: bool) -> Result<KVVec<u64>> {
+    let request = PluginSetBmeRequest {
+        bme_enable: enable.into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
+
 #[kunit_tests(nova_core_fw_commands)]
 mod tests {
     use crate::gsp::nvkv::{
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index adc23ac6d467..158160fbf352 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -141,6 +141,12 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
         self.bar_user.bar1.try_read32(off)
     }
 
+    /// Write an 8-bit value at the given offset.
+    pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
+        let off = self.bar_offset(offset)?;
+        self.bar_user.bar1.try_write8(value, off)
+    }
+
     /// Write a 32-bit value at the given offset.
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
@@ -270,6 +276,11 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
             .try_read32(self.bar_offset(offset, size_of::<u32>())?)
     }
 
+    pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
+        self.bar1
+            .try_write8(value, self.bar_offset(offset, size_of::<u8>())?)
+    }
+
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         self.bar1
             .try_write32(value, self.bar_offset(offset, size_of::<u32>())?)
diff --git a/drivers/gpu/nova-core/vgpu/consts.rs b/drivers/gpu/nova-core/vgpu/consts.rs
index 2ebbf2a0daa3..13aabefa4ecf 100644
--- a/drivers/gpu/nova-core/vgpu/consts.rs
+++ b/drivers/gpu/nova-core/vgpu/consts.rs
@@ -18,3 +18,10 @@ pub(crate) mod gmc {
     pub(crate) const CLEANUP: u32 =
         bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
 }
+
+/// vGPU plugin RPC values not provided by the firmware bindings.
+pub(crate) mod plugin_rpc {
+    pub(crate) const DOORBELL_STRIDE: u32 = 32;
+    pub(crate) const DOORBELL_VECTOR: u32 = 17;
+    pub(crate) const NV_VIRTUAL_FUNCTION_PRIV_DOORBELL: usize = 0xb8_0000 + 0x2200;
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 3cd77f0cd62e..db6f535998a9 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -1,6 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
+mod commands;
+
+pub(crate) use commands::{
+    RpcMessage,
+    RpcResponse, //
+};
+
 use kernel::prelude::*;
 
 use crate::{
@@ -16,6 +23,7 @@
 };
 
 type RawControlRegion = bindings::VGPU_CPU_GSP_CTRL_BUFF_REGION;
+type RawResponseRegion = bindings::VGPU_CPU_GSP_RESPONSE_BUFF_REGION;
 
 /// Physical VRAM regions containing the vGPU plugin logs.
 pub(crate) struct PluginLogRegions {
@@ -64,9 +72,14 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
 pub(crate) struct CommBufferRegion<'gpu> {
     map: Bar1Map<'gpu>,
     control: VramRegion,
+    response: VramRegion,
+    message: VramRegion,
+    migration: VramRegion,
+    error: VramRegion,
     init_log: VramRegion,
     vgpu_log: VramRegion,
     kernel_log: VramRegion,
+    guest_trace: VramRegion,
 }
 
 impl<'gpu> CommBufferRegion<'gpu> {
@@ -85,22 +98,22 @@ pub(crate) fn new(
             &mut cursor,
             bindings::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let response = take_region(
             &region,
             &mut cursor,
             bindings::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let message = take_region(
             &region,
             &mut cursor,
             bindings::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let migration = take_region(
             &region,
             &mut cursor,
             bindings::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let error = take_region(
             &region,
             &mut cursor,
             bindings::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
@@ -120,13 +133,16 @@ pub(crate) fn new(
             &mut cursor,
             bindings::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let guest_trace = take_region(
             &region,
             &mut cursor,
             bindings::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
         )?;
 
-        if cursor != total_size || control.size() != u64::try_from(size_of::<RawControlRegion>())? {
+        if cursor != total_size
+            || control.size() != u64::try_from(size_of::<RawControlRegion>())?
+            || response.size() != u64::try_from(size_of::<RawResponseRegion>())?
+        {
             return Err(EINVAL);
         }
 
@@ -135,9 +151,14 @@ pub(crate) fn new(
         Ok(Self {
             map,
             control,
+            response,
+            message,
+            migration,
+            error,
             init_log,
             vgpu_log,
             kernel_log,
+            guest_trace,
         })
     }
 
@@ -169,6 +190,21 @@ fn read_u32(&self, region: &VramRegion, field: usize) -> Result<u32> {
             .try_read32(self.io_offset(region, field, size_of::<u32>())?)
     }
 
+    fn write_u8(&self, region: &VramRegion, field: usize, value: u8) -> Result {
+        self.map
+            .try_write8(value, self.io_offset(region, field, size_of::<u8>())?)
+    }
+
+    fn write_u32(&self, region: &VramRegion, field: usize, value: u32) -> Result {
+        self.map
+            .try_write32(value, self.io_offset(region, field, size_of::<u32>())?)
+    }
+
+    fn write_u64(&self, region: &VramRegion, field: usize, value: u64) -> Result {
+        self.map
+            .try_write64(value, self.io_offset(region, field, size_of::<u64>())?)
+    }
+
     /// Return the physical regions occupied by the three plugin logs.
     pub(crate) fn plugin_logs(&self) -> Result<PluginLogRegions> {
         Ok(PluginLogRegions {
@@ -188,6 +224,150 @@ pub(crate) fn is_plugin_ready(&self) -> Result<bool> {
         Ok(value == bindings::GSP_PLUGIN_BOOTLOADED)
     }
 
+    /// Initialize the shared control and response buffers for plugin RPC.
+    pub(crate) fn initialize(&self) -> Result {
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.response_buff_offset),
+            u64::try_from(self.region_offset(&self.response)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_buff_offset),
+            u64::try_from(self.region_offset(&self.message)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.migration_buff_offset),
+            u64::try_from(self.region_offset(&self.migration)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_offset),
+            u64::try_from(self.region_offset(&self.error)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_offset
+            ),
+            u64::try_from(self.region_offset(&self.guest_trace)?)?,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.migration_buf_cpu_access_offset
+            ),
+            0,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_migration_in_progress),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_cpu_get_idx),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_cpu_get_idx
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.attached_vgpu_count),
+            1,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_gr_init_done),
+            0,
+        )?;
+
+        // The heap is not guaranteed to have been zeroed. Clear both sides'
+        // sequence state before publishing the control-buffer version.
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(
+                RawResponseRegion,
+                __bindgen_anon_1.message_seq_num_processed
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(RawResponseRegion, __bindgen_anon_1.result_code),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.version),
+            bindings::VGPU_CPU_GSP_CTRL_BUFF_VERSION,
+        )
+    }
+
+    /// Copy and publish one RPC request to firmware.
+    pub(crate) fn submit(&self, message: RpcMessage, sequence: u32, data: &[u8]) -> Result {
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
+            message as u32,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            sequence,
+        )
+    }
+
+    /// Read firmware's response for an expected RPC sequence.
+    pub(crate) fn response(&self, expected_sequence: u32) -> Result<RpcResponse> {
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
     pub(crate) fn destroy(self, bar_user: &BarUser<'gpu>, mm: &mut GpuMm<'_>) -> Result {
         self.map.destroy(bar_user, mm)
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
new file mode 100644
index 000000000000..8527e2c430bf
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::gsp::vgpu_bindings as bindings;
+
+/// State observed in the response buffer for an expected RPC sequence.
+pub(crate) enum RpcResponse {
+    /// Firmware has not completed the expected sequence.
+    Pending {
+        /// Last sequence completed by firmware.
+        sequence: u32,
+    },
+    /// Firmware has completed the expected sequence.
+    Complete {
+        /// Firmware result code.
+        status: u32,
+    },
+}
+
+/// Message types supported by the nova-core plugin RPC channel.
+#[derive(Clone, Copy)]
+#[repr(u32)]
+pub(crate) enum RpcMessage {
+    VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
+    SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+    #[expect(dead_code)]
+    Reset = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
+    UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 834b647e254a..161b49d93de5 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -34,7 +34,10 @@
         },
         consts::gmc,
         fw::CommBufferRegion,
-        plugin_rpc::PluginRpc,
+        plugin_rpc::{
+            PluginConfigParams,
+            PluginRpc, //
+        },
         vram::{
             VgpuVramLayout,
             VgpuVramSlot,
@@ -353,7 +356,11 @@ pub(crate) fn query_vgpu_type(cmdq: &Cmdq, bar: Bar0<'_>, type_id: u32) -> Resul
     Ok(VgpuType::from_properties(&properties))
 }
 
-/// Bootload the GSP plugin for an allocated instance.
+/// Start the vGPU plugin and establish its RPC channel.
+///
+/// Ask GSP to create the plugin task, wait for its BAR1 ready marker,
+/// initialize the shared RPC buffers, negotiate the protocol, send the
+/// instance configuration, and enable bus mastering.
 #[expect(dead_code)]
 pub(crate) fn activate_instance(
     dev: &device::Device<device::Bound>,
@@ -362,5 +369,22 @@ pub(crate) fn activate_instance(
     instance: &mut VgpuInstance<'_>,
     fifo_engine_list: &FifoEngineList,
 ) -> Result {
-    bootload(dev, cmdq, bar, instance, fifo_engine_list)
+    bootload(dev, cmdq, bar, instance, fifo_engine_list)?;
+
+    let params = PluginConfigParams::new(
+        [0; 16],
+        instance.dbdf,
+        instance.vgpu_type.vgpu_type_id,
+        instance.vm_pid,
+        u32::try_from(instance.chids.len()).map_err(|_| EOVERFLOW)?,
+        instance.num_plugin_channels,
+    );
+    let gfid = instance.gfid;
+    let rpc = &mut instance.plugin_rpc;
+    rpc.init_rpc()?;
+    rpc.negotiate_rpc_version(dev, bar, gfid)?;
+    rpc.send_config_params(dev, bar, gfid, &params)?;
+    rpc.set_bme(dev, bar, gfid, true)?;
+
+    Ok(())
 }
diff --git a/drivers/gpu/nova-core/vgpu/plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
index d6077a468672..f1fa6fe238fb 100644
--- a/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
@@ -3,6 +3,7 @@
 
 use kernel::{
     device,
+    io::Io,
     prelude::*,
     time::{
         delay::fsleep,
@@ -10,31 +11,80 @@
         Instant,
         Monotonic, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
+    driver::Bar0,
+    gsp::commands::{
+        encode_plugin_config_params,
+        encode_plugin_set_bme,
+        Dbdf, //
+    },
     mm::{
         bar_user::BarUser,
         GpuMm, //
     },
     vgpu::fw::{
         CommBufferRegion,
-        PluginLogRegions, //
+        PluginLogRegions,
+        RpcMessage,
+        RpcResponse, //
     },
 };
 
+use super::{
+    consts::plugin_rpc as consts,
+    instance::Gfid, //
+};
+
 /// Host-side ready limit from `vmiopd_negotiate_cpu_gsp_version()` in
 /// `vmiop-vgpu.c`, which polls the same boot marker for 10 seconds.
 const PLUGIN_READY_TIMEOUT: Delta = Delta::from_secs(10);
 
-/// BAR1-backed channel used to communicate with the vGPU plugin.
+/// Values sent in the plugin's setup-configuration RPC.
+pub(crate) struct PluginConfigParams {
+    uuid: [u8; 16],
+    dbdf: Dbdf,
+    vgpu_type: u32,
+    vm_pid: u32,
+    num_channels: u32,
+    num_plugin_channels: u32,
+}
+
+impl PluginConfigParams {
+    pub(crate) const fn new(
+        uuid: [u8; 16],
+        dbdf: Dbdf,
+        vgpu_type: u32,
+        vm_pid: u32,
+        num_channels: u32,
+        num_plugin_channels: u32,
+    ) -> Self {
+        Self {
+            uuid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+            num_channels,
+            num_plugin_channels,
+        }
+    }
+}
+
+/// BAR1-backed channel used to communicate with one vGPU plugin.
 pub(crate) struct PluginRpc<'gpu> {
     comm: CommBufferRegion<'gpu>,
+    message_sequence: u32,
 }
 
 impl<'gpu> PluginRpc<'gpu> {
+    /// Create a channel over the mapped communication buffer.
     pub(crate) fn new(comm: CommBufferRegion<'gpu>) -> Self {
-        Self { comm }
+        Self {
+            comm,
+            message_sequence: 0,
+        }
     }
 
     /// Return the physical regions occupied by the plugin logs.
@@ -58,8 +108,161 @@ pub(crate) fn wait_plugin_ready(&self, dev: &device::Device<device::Bound>) -> R
         }
     }
 
+    /// Initialize the control and response buffers for the first RPC.
+    pub(crate) fn init_rpc(&mut self) -> Result {
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
+    pub(crate) fn rpc_call(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+        message_type: RpcMessage,
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
+            message_type as u32,
+            data.len(),
+            sequence,
+        );
+
+        ring_doorbell(bar0, gfid)?;
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
+    /// Negotiate the plugin RPC protocol version.
+    pub(crate) fn negotiate_rpc_version(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+    ) -> Result {
+        self.rpc_call(dev, bar0, gfid, RpcMessage::VersionNegotiation, &[])
+    }
+
+    /// Send the NVKV-encoded v2 configuration message.
+    pub(crate) fn send_config_params(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+        params: &PluginConfigParams,
+    ) -> Result {
+        let encoded = encode_plugin_config_params(
+            params.uuid,
+            params.dbdf,
+            params.vgpu_type,
+            params.vm_pid,
+            params.num_channels,
+            params.num_plugin_channels,
+        )?;
+        let payload = nvkv_rpc_payload(&encoded)?;
+
+        self.rpc_call(
+            dev,
+            bar0,
+            gfid,
+            RpcMessage::SetupConfigParamsAndInit,
+            &payload,
+        )
+    }
+
+    /// Send a Bus Master Enable state update.
+    pub(crate) fn set_bme(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar0: Bar0<'_>,
+        gfid: Gfid,
+        enable: bool,
+    ) -> Result {
+        let encoded = encode_plugin_set_bme(enable)?;
+        let payload = nvkv_rpc_payload(&encoded)?;
+
+        self.rpc_call(dev, bar0, gfid, RpcMessage::UpdateBmeState, &payload)
+    }
+
     /// Release the BAR1 mapping.
     pub(crate) fn destroy(self, bar_user: &BarUser<'gpu>, mm: &mut GpuMm<'_>) -> Result {
         self.comm.destroy(bar_user, mm)
     }
 }
+
+fn nvkv_rpc_payload(encoded: &[u64]) -> Result<KVec<u8>> {
+    let word_count = u64::try_from(encoded.len()).map_err(|_| EOVERFLOW)?;
+    let mut payload = KVec::new();
+    payload.extend_from_slice(&word_count.to_le_bytes(), GFP_KERNEL)?;
+    payload.extend_from_slice(AsBytes::as_bytes(encoded), GFP_KERNEL)?;
+    Ok(payload)
+}
+
+fn ring_doorbell(bar0: Bar0<'_>, gfid: Gfid) -> Result {
+    let value = gfid
+        .0
+        .checked_mul(consts::DOORBELL_STRIDE)
+        .and_then(|value| value.checked_add(consts::DOORBELL_VECTOR))
+        .ok_or(EOVERFLOW)?;
+    bar0.try_write32(value, consts::NV_VIRTUAL_FUNCTION_PRIV_DOORBELL)?;
+    bar0.try_read32(consts::NV_VIRTUAL_FUNCTION_PRIV_DOORBELL)?;
+    Ok(())
+}
-- 
2.53.0

