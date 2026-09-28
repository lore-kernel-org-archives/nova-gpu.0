Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D249E15E
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591587; cv=fail; b=o0j+tXA8Z9iWd6RkwfOomI8ffToiJOZD8kQQclH0uQxLm1OUmChSAWOuV3XvtR1Enj/Z6nlZRmTL/9/R+PmgAfC79tj07BXT+YiDvg5HBVVJ+cBk02c1j1rQT92ayZ7WkxVnSgpJAV5I6EtHv6V9+sg5kdLmOuvfCUzn2N196A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591587; c=relaxed/simple;
	bh=029C8UjrV4EH5k/J9337LaoYG9wzKKaOP3CH3/vqgS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgIxu2A83fw49pA/DwnGKscJM30AwE2TQGgIMX++i8WsTUoxf7WFgUM2Om+dniu/d/9Vyn2WSBNIiON+GRLGYNHlC/pp6INdAkO5NPCadJUgqBh6Zxr7GUUvTJ3zit2VAsS0GbUWurNQQlRimNoH97poNjJnL8TPgW1auEgzWYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SW7e7dzO; arc=fail smtp.client-ip=40.93.194.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SW7e7dzO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCR4fp77Mv1ZHoIU4ED/kB6pkiNu+5Q+85PhT7P9Vo/BD+6+ldbBawztoUM99hku34ri07j0fFB1TDSHdhJ3FpAAACaCIScfx7LkD4jQSQ7fCCGhjJuidNhgV1zY/pXHH/Be4EATP4EX119SlIUHigmPdb7Cj0DG/sRj/kR4wmbbcyabyveNENVIwkBN3CX2rG8b9xIb0BGDH30/R9FfTmUk08XBlMOVKzoIb22nm9ZlxP8EmnAFzP/R11tVtM3HqratOMOvyHi8b051a5J+P7zr8/OZuOFM/HreO8AcdJd9xK/zzLRe1Vnz/okKXrfhIonaT7f2H3MWJhNEVyUQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ytz82JXxsY/gcGPZE1kEEdBqIA3mHfzW12qT7ktkMRg=;
 b=fx0tFuiK3podtfQU2gDX8d6wr1SgAp34emwto6migSPUwd4DmlxLdM6y5dmFZyJNoML6pgsiYuIa2489Pveen+VQkOU+bvmzuEL9xo4ed0epHGkzCKyo7T1XhcllebqvA1kX8QZ9RedezARPHEbvow/lsX/2xpR/I/bxko0xvasVQyVOXdtiiIr4AkK3MYEKu8IgRMeBNmyc0z+dgIhcJp9YYdn+v9FGUDBriX5WO1POTm1w0gjnRMxyDi+w47yKXRQZCMQvp2l6QRAhkjwWpmGUln9oQJTDMb4JunBv3UjtQbJKIzF2EUAiEZkzDoZ1gR0MyClTNi5Ea8IfKqYsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ytz82JXxsY/gcGPZE1kEEdBqIA3mHfzW12qT7ktkMRg=;
 b=SW7e7dzO4E/ZFijBAzp4FtS8GFg7hOA1gGpU9k2Zxej18Uq6CJmQjrkbsXUgmQIJjjyy4ZjPl+DCQWVWb0QJ0FLfvhHTC/ApolPWfnsdalci3wBqa2KFKVJS4LKl1vlc1/IxT0oPl6eQJbI1HZYMIEQ0Omog7ZMndinNoDFjJV8A3/pLI7MxZC0epuswDL3yrLJb+ckJqQHa4x3s6TuC0izHFj/G2YtjbccaQLnf8h86ztfemoGpInpluVkXOvanNdWvOZpXEOlNAtZ+AXV+wX+BF+BEHeRTJeC6VDrBPU8IYscupjYHZVIRgnhwwZZLsBhDNQNBkw+PZGCgMt46Jw==
Received: from SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::18)
 by MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:32:57 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::44) by SJ0P220CA0027.outlook.office365.com
 (2603:10b6:a03:41b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:32:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:42 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:42 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:34 -0700
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
Subject: [PATCH v3 27/31] gpu: nova-core: vgpu: update the GSP plugin BME state
Date: Mon, 28 Sep 2026 13:28:30 +0300
Message-ID: <d894c0c64ea7ca895ab22e5b46895a96af963c65.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 949cdcdf-71af-4338-a4bd-08df1d4bdc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|3023799007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zpwgO40AFZbmvnJpqdL8WeMGGb12Cm6+Rr7vJxKPhFD6JQPpC7dox5ayrLgX+RiNkvmRLxzvVimJvsYkqhAvAvrBGlCZLqlq9pWvStplY32fiM+0Q3fAiwZyNDtYPGjOY11uEMAm/skpeI06u51GNIbbpdxrlg92T5YA0nq2M5ZAAq2zy9pq/rKgOeSC4UnfaGtqfb93zuwzwSh8TzmbBWABa1EPQ4O3jIi9uoVuCKlYJxfBDcvL3dXtJSBn05qOHFJkl+usu4dciWHi0YCWgTAIhJRa347sLR4722src4E2YgS0u3/DORRuy7dpiVNNH6hRaSsFNsrs6bYtFLhQN5O87sL0CklpRHmG2WihDhwIBky2ezavr/vKElpBTBZZmoPM+u/YFS7rnyOt1+Zc+BBTw1S2HfUD7ru70CZNeNNaaGiGXYIhlvEXypTZ5PLJJkN2byjdT92H9WKfZ7EynKsWcwOdFKJQWCfc089dC1NuOMNupqsV6h+UwoaLFfG3h3C+KkwRyWw2lmZxG5e1y6LKnEaUPU+Rgvfr0ki42KROOOZ63LywA3V9ZU0D1ZwpvTqJ854QHgTJjtFg8rpb4SoNPqddxSM49/aNpoxv+lMJK9kfrLQcjsA+yWJALrU+HgDUfh+u3B78s3RtB+LUQuLUSYbPuBALePDXPNWHQcjESb7CpkxBYRClTurdo7bHJkm1MjGd8mBG5o+H4PZT1g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nCJpZ25ayPLNaaUbmbVU9nXR9wAVhv0OFoUmQGEOJ538n6KCDfvvvIFCgJvK6QEhBRpe3K8G49obF9oSSfUy37HZiFw/TTkXx6t0A/KEA/OZnzctRr+3sek8x3mwlwW4eu5snOxjwxQQxSmYbX7vDxy1QraI3VB1tXtr5CyuYYVnwzm7AY8Hhpo4BalgggFQlu85W0z0NaTWEnrhPKnVEO4I4h/deV8SE0vaROnm36AkIX6ZpXJtXcQ/33e6S++upO6hinsc7SsXvUmUwSLxoDR+mvYoQViQdMnbXJy8WQ/EOij3Vuo3v581qndbGtnMEp10cV93bZwlqBlI4QVaoyN5jW1vDzAHhs0iP5TBl36AB9WF/RcP5wAHuPmTPoN+SIw2+rNa8TAPZMAgWUBGCmS2BgO+WFwNCY297cxa9D73JMW1kmQiJ316HS8lfUXT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:56.7271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 949cdcdf-71af-4338-a4bd-08df1d4bdc73
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422

The vGPU manager reports the enabled bus-mastering state to the GSP plugin
after its initial configuration. The guest can then use the vGPU from now
on.

Add the BME state request and NVKV encoder, and send the enabled state
after configuration succeeds.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/commands.rs    | 11 +++++++++++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 22 ++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/instance.rs    |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index ec40a960069b..bfb033e5eb37 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -25,6 +25,7 @@
 use super::{
     fw::{
         commands::{
+            encode_plugin_set_bme,
             VgpuPropertiesSchema, //
         },
         RpcMessage, //
@@ -178,3 +179,13 @@ pub(super) fn send_plugin_config(
 ) -> Result {
     rpc.rpc_call_nvkv(dev, RpcMessage::SetupConfigParamsAndInit, config)
 }
+
+/// Update the bus-mastering state reported to the GSP plugin.
+pub(super) fn set_plugin_bme(
+    dev: &device::Device<device::Bound>,
+    rpc: &mut PluginRpc<'_, '_>,
+    enable: bool,
+) -> Result {
+    let bme = encode_plugin_set_bme(enable)?;
+    rpc.rpc_call_nvkv(dev, RpcMessage::UpdateBmeState, &bme)
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index e3b5198e9c80..cc2298c3679c 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -37,6 +37,7 @@
 pub(crate) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
     SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+    UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
 }
 
 bitfield! {
@@ -398,3 +399,24 @@ pub(crate) fn encode_plugin_config_params(
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
+pub(crate) fn encode_plugin_set_bme(enable: bool) -> Result<EncodedStream> {
+    let request = PluginSetBmeRequest {
+        bme_enable: enable.into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 247e88bdc82f..23c2b791aa25 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -36,6 +36,7 @@
         send_cleanup,
         send_plugin_config,
         send_shutdown,
+        set_plugin_bme,
         Dbdf, //
     },
     fw::commands::{
@@ -162,6 +163,7 @@ fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         self.plugin_rpc.init_rpc()?;
         negotiate_plugin_version(dev, &mut self.plugin_rpc)?;
         self.configure_plugin(dev)?;
+        set_plugin_bme(dev, &mut self.plugin_rpc, true)?;
 
         Ok(())
     }
