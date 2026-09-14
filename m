Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D83B71A4
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372425; cv=fail; b=qe+AtcUTSkwsYITHlXPuEkwh+gkj/tHKjcVeNr/F9m0XcGckHaeYU16VA0L/GscHHY579hA9P3VQgbDLeDz7rsBkUvXJWaigUWtj7ie0KLU3/QP1EucqjmygEeTGD7lUXwKUYNor6bARUneHUPyOAwMRj5DqedJFAiW5X44fVRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372425; c=relaxed/simple;
	bh=CqGeEl3RisK1wJv338XIY5gySdTbAFct9PeJGP1cuoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBz9dmWo4IRZO7r8VxcDxA4T1guA8as7vRaYOMWRj7w7Vj8wUgHVQEsXHOSQycHjyNun0/uYVTzOrF+/69DAK4uS4ANRZY8HkGAsoSJco0vGh7jmXEbDrKFFlEpAQ2ejqdLCkBVc9bAWtT9x05Zj+BK+V2iOV59OPwPQBr+Qzo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sr++l1nW; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sr++l1nW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+GvFJ0fp8yCynlY65XKROM+kSqeY5yR5Gra0qUeGSEI5f9R+DzePgT3K5wPTUwxV4msE2pzZh8YCNh8vzZ/PTPbWtp+jEUNpp13qg4e+eoY3MKjMq5YmdDLA1b+HYT4dqbx5xKTUjXPXftc6Tqny5eqyaOhR/z63FXrnaBRTyEhr0FQrjdR1tjQKApBBGy0B/ePd5pOYjjCxo4zGPpC9BtqieaMEgB4WtKD/hfYTO0tO68Fg85UmDciApFa2J2TLkj4ulrSZabIQJd3tFrbVDRH3QsynfU6xm3erQQ7wvRixha6qmtHZ7FFvx5wUn2ocw4nMf5D3zDpcbduBgRtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgPGKaJaQzedG7v4BORr9/mIwwZKzUMtc/1VBN7IcYo=;
 b=Tx3s6AgcglvSNOyecvg2OBKYdeY8TibXdFNuAyjHvbuAHhrKYCqVzCF7KWvBr+VwciUs58kfWSOUKMZzAyZK6/t1ZK7wJupqv/AyqP0s+8PmHSO2ejSWzPWgvOiaZWQnLkeiWwP4R+oseTTgsAPNd0YeO1dpi6OtrH66Z4R/xWklOisji2W8pkiG8+/4d4IDOjM+eycKGNlDQVfc/BK2MzfvGCUePBJ+HyN4w4g3tma0Lx50G/kZuhjuR2quLvBFPzxN7z9e9ZV7mhb0eZx6acFNxf0o3jYTykhgNmi9+t0M3n/VJmqnHYjC6QQnl5m0gKeiMjov7qK6ofYuaGmotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgPGKaJaQzedG7v4BORr9/mIwwZKzUMtc/1VBN7IcYo=;
 b=sr++l1nWeVHea3xDpsUs8bqw61DcndxLu6qcmCo7bqllxfHdAkKSvbZ8/MqyvHd/mL7OCAVpa9BWW50+EssAW6GImJ94GwEJjsEWhVRFW3h6gd1GTNwOdWnXu2hd6m9r0bMhi1q+Sd98eiltykQJMkDd71zo8ZDNe4y0W+JdKrTxQEB1KCS2nOc08DByMxO3SDN6P+hsQwNJNLhlZHAlOqqVPhctXmlPckG7t8oMBhpyr0tDjOLVKvrk4NfpM+r1xwXi46INqZNF8pg4gOfRirPENtDgQ2D97dloPk6KxxKc7f/twF1am9ARBvn3UgJkGfzv1OfvGU9ubttAWsSYcQ==
Received: from MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::19)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:38 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::1d) by MN0P222CA0018.outlook.office365.com
 (2603:10b6:208:531::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:21 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:53:13 -0700
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
Subject: [PATCH v2 29/32] gpu: nova-core: vgpu: update the GSP plugin BME state
Date: Mon, 14 Sep 2026 10:49:04 +0300
Message-ID: <20260914074907.1399629-30-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fba326-a7b5-449a-a55d-08df1235497f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	o8KV3rI7SyJnbIFwhm38x05/X6CUyG4A9NSdTK39l+/7Jzp/Ho1zvBnVb7CuLYEazNUX7t0EtRbGF5/hvlgcLqBvbtL8vfW3XOKnVZN0ayUYtFYywiEg+EjnqadxfWLsspwduPVc25nLvUsnDSi7IA5kU+kxsp8ZQRj48B5/dfKvrZ5A95/NWnzdTom3z8Quu/ryPVDHxo0GBU0PUe6oTAygDXzgLjv4LnKfe/Z8o0RiJoejhzteHiijmazRrZU4X7akdDcwqplw78IQNnPZEJsyquetVnoYMS9Th/5JB+HUzjLGpUDqq1SRwU6kV+THPPPgPyO1vFST+0XdRoxuYoAwDaapfEVCqAdNuVPE9NsIjV9LwqiezJ/ozr8K0ZCMm37KMht5bzMuLqo5InjkS3ffli8jpQjGZJKXfpybBeB8fCO3iTffglnJ8y1lL5FsPrxIb93njnvnGAOzFdurBdAB7LLRIILvOjY7yQlLddzD9Z9SZeRZK+95S4YhJAx3Qqsdnn/OWfiQ0bToJX6ly1hPbpOsGNYgPNt3ioSCXdcAIiChriE8cicJ6PCrIrZ6JmT0MqP8PsmAUVJBJ1kW4c4dWSl3yXmH22VJKsRHJUPE6QHwcKM2WhkAAzDuOrNzjccZR/bbeJlWuDBGgERUW+oITZdNqMtTNuXYltaFbfJH7TFjgUq4M1sVGFLMMCzXIuQDyuaVixxSHkhxNTkN/Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FVUroLh0QzilGKQZ/clD+vd37Upqdr4pTk+ewfjt5qivhf66qgWsBsds4KcHzRvJ5X6uc2N2eTA4MXgNwlY3xPGgGHJj0LenoqJ39WQvd/u7tDZoXBwXLpv4Mw+IrVtaR7R/JMCypgBAuMNT7chJgVYfG/KJLQ9/v2+8jID2OoJaD6Ye8edcBFaMKQ69jHXvXwQM+QBKWe2ARPIQxn3W6ZwHUO8QBZaEWT4FpBeemLCCyzBSyxbf0sBT2kQMfLp+5ikVXBu81eVW883xgSyc0hu4e2Fc/6+cPRdtlcFFTc4nucmIs8vd+OkQswwBOh5EjLTix9/Qj/c7FDh9/D1T+Fxb3E9hBwC5kURs1QbT0LZI7/CB67g4Wb5Zb9joismlGGAZ3yEz80wYWfGO6It2Q90FhbKj62+EnpGTwpVFKey5ThEgGH2lrLgQEw2ChVlC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:38.3684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fba326-a7b5-449a-a55d-08df1235497f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301

The vGPU manager reports the enabled bus-mastering state to the GSP plugin
after its initial configuration. The guest can then use the vGPU from now
on.

Add the BME state request and NVKV encoder, and send the enabled state
after configuration succeeds.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs    | 14 ++++++++++++++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 22 ++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/instance.rs    |  4 +++-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 2089c91b648e..7bfde85ad35a 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -37,6 +37,8 @@
     VgpuProperties, //
 };
 
+use super::fw::commands::encode_plugin_set_bme;
+
 use super::fw::{
     GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
     GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
@@ -177,3 +179,15 @@ pub(super) fn send_plugin_config(
         config,
     )
 }
+
+/// Update the bus-mastering state reported to the GSP plugin.
+pub(super) fn set_plugin_bme(
+    dev: &device::Device<device::Bound>,
+    bar0: Bar0<'_>,
+    gfid: Gfid,
+    rpc: &mut PluginRpc<'_, '_>,
+    enable: bool,
+) -> Result {
+    let bme = encode_plugin_set_bme(enable)?;
+    rpc.rpc_call_nvkv(dev, bar0, gfid, RpcMessage::UpdateBmeState, &bme)
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 0386c8178962..7030479441e8 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -33,6 +33,7 @@
 pub(in crate::vgpu) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
     SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+    UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
 }
 
 bitfield! {
@@ -385,3 +386,24 @@ pub(in crate::vgpu) fn encode_plugin_config_params(
     request.encode(&mut encoder)?;
     Ok(encoder.finish())
 }
+
+nvkv_encode! {
+    struct PluginSetBmeRequest {
+        bme_enable: Key<bool, { Self::BME_ENABLE_KEY }, u32>,
+    }
+}
+
+impl PluginSetBmeRequest {
+    const BME_ENABLE_KEY: KeyId = 0x0100;
+}
+
+/// Encodes a plugin BME state update using the typed NVKV schema.
+pub(in crate::vgpu) fn encode_plugin_set_bme(enable: bool) -> Result<EncodedStream> {
+    let request = PluginSetBmeRequest {
+        bme_enable: enable.into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index c3ec24f48682..5d71de0ad108 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -48,6 +48,7 @@
     send_cleanup,
     send_plugin_config,
     send_shutdown,
+    set_plugin_bme,
     Dbdf,
     VgpuProperties, //
 };
@@ -390,7 +391,8 @@ pub(super) fn activate_instance(
 
         instance.plugin_rpc.init_rpc()?;
         negotiate_plugin_version(dev, bar0, gfid, &mut instance.plugin_rpc)?;
-        instance.configure_plugin(dev, bar0)
+        instance.configure_plugin(dev, bar0)?;
+        set_plugin_bme(dev, bar0, gfid, &mut instance.plugin_rpc, true)
     }
 
     /// Stop the plugin and release the instance's firmware and host resources.
