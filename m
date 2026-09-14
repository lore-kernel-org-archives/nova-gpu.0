Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF173E49DE
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372206; cv=fail; b=If1L7WqJU2Bqxego1QBWZl9ug9FWpad/ZjZ1ef0rNX7uCN+UztbuLdnIPShIHxTWPopasQvPs/T1IXELikXjiBcFP0Uz0nsLd+UD669hg6P6HbklJJHE0ytm0q1smbLm9Cvn08q1kSsNqzc4Qcip87wttEDCZJeAFwiUOHq32wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372206; c=relaxed/simple;
	bh=yPNKaN3X7yIKW4EKQu9X5cgI+FuH29w/QATnXpN2gGc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6wgwJ+4EqEaD2HKtBLpZD54MI65yTK8I5vRy6w0auXlqviM9amHituBAZaB1z5u57sSStvylV1ijjnrX+/JqKToI4Dt82ye6KM4VODwCBHGTveAnzWo1Q4JxSD62cxBOwAkA4CnytnKNCuy+WzhzJZF3zCDDzMOm3RSvJReEhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f2ygSC9E; arc=fail smtp.client-ip=52.101.43.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2ygSC9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJeNwA5jpXVoLZQaOFfdX7Y/YZasESFSCMWZysSElLtbjYRG6ytJqhf2YWx+yi1vu+VNeNcYm0ejryc4Mbj9hE849mF94HO4BcZGy1HZ2xqysJtziV6O0iGnbKfOoTpG3UdNUmoMbXpPIE8Q6zEVYFTxZQs+xRMqm8oTCCbehMOQ83xCHkfGK7q8MLYzpF2Qw6UuTeNf/OdcrgLzLzvgmjVGRsE2IZVPB4H/eHLvJ4u4AkSWNEy3BvozEdN+cIhNKh6lnV66lt99oPr5xwJpdb4DYiq1XgaY60oKpS+5rmQYxQTLI7f6fsjPmfx2fe9YJyaOSoKG1PGT2P8c7vRiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl+TwmJzmUM6T63IGRO5Mj9RX+XnrSVbB6W5Tg+cxiA=;
 b=JucT66DSQqXK6fRDlivhiAUN53gvkYoH3BSSrZAq5BD1qtG5JkOXW7Olhqq3d1Wj1I97pxc3C/l7wxdhfOo82LgeVdWxhprMxc5hQXoIlLzbIqjev1gY+9nmNRcja5LwqDSGq1HROjcAiub4Ihkn3H+ulDwK+D7MQakqZy8zaZuQllyW3wApioK6vI7dOBg6LvQ183gZAMGUiT8xYIJbEuCHl2RTJNqqtLMXvQ/JPIwtMe3PU4+hQccJFzBmZy0uBJDlUlxm4C/P/GM1IOMRI16bHUABh+3v/5YSh8o+JqU/U+u41NHkwVMNSVV5BC2PAvJx4Zj+v00gWG+lNhg+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl+TwmJzmUM6T63IGRO5Mj9RX+XnrSVbB6W5Tg+cxiA=;
 b=f2ygSC9EkeyXCcZuZGAQnLyrHvE/NWRVq5pEJ1znew2HZN8IFNebFhUfgLxEfE0r5utnmqtBxvgPa3E2WdeEiXytaZxuj98ePJaywcr6XCs29+x7KIMcVi6NK//zx0GhrPLV6OIPDT82svu74gcOOVeUv+dEi0qEi/IBlWejoNv6Efdq0t9Xy3YPEQaoZ7uoFH3JiM7qCKIma5ERyoitvM794hAEG3RujYK28RQaizQZbiZxUYnL/3jBpEzigfefmRcgHqWoBMNxyNhCaTnaVtCvPTqgJtSbIgMsSuOxvU/dFF9I+qmvcfv2pmZaGWsn2zXn+/6E/weX0cLWeu3EKw==
Received: from BN0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:e7::15)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:49:55 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::89) by BN0PR03CA0040.outlook.office365.com
 (2603:10b6:408:e7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:49:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:36 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:28 -0700
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
Subject: [PATCH v2 02/32] gpu: nova-core: gsp: decouple boot context from VgpuManager
Date: Mon, 14 Sep 2026 10:48:37 +0300
Message-ID: <20260914074907.1399629-3-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: b85af9ea-44d9-46dc-fb79-08df1234c458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|23010399003|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KSyKJbIQHiLu0ZUJgiYfzcSJZTWJBnjik+LDNtOdkumuk1oVN2u/I6bkImIgvSrODdetVbI/75L5KqoqtyJVX8u4FFtXdwq1qqXpOlmRoE9p/1fHoG3HGZl/OJbUpOunzfMudaXR6EtWq41MoMsaO1EDzx4YchGhIVMHB6e5b0gVvDu+s1kHBOaBWGhrr1QNTVJehIIrvDJ/2xIVcU0+N747KwoBxvn//sWmosE5EuLpLDg27VnFITKISDISQKNup6Ke8M8uXMN6FrH312o5RdtEbfRs7RhVLo9S7Wv4T4xq4OQkasgSRn/jGoX9pUDozj4O5uQ3/6tHsjbZpPi8qkrVUVvp2pHO0JJWhxxJb/NZSG+ceTK1TGJng75wR/ZBw46j/frhE9BF5ccEZ2oMKe9fGCAvvDgVA17fX2NYgQTzMlwdyWEKOZ8JAz5YUFZdcbP9UO8LfUWe0Y7efA7ui9fG7SFzxzmmv/sz83wjTH/ny+qmwhJf1MIOStw46fkL96bi9rRrvVv7TYw3D3FbRQHcFGbdM1fxVX66BQcnvZJqOzjHlDi9qt1OuSXtP18FojngqcxrQZOS2YqesV7F94gmR4Aok/C11NdiDbesVDor1GTT0Uy7AF/4LXXpeMT6FeVZ3cg5+KcsGZGM4dmL1dFLAeGMRPObVf+Xo9SBv4mU6c6YSrtuFZHZJVVegijNpzz+whduCM8NpbwyUDtIMw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	flhnLWz56uYWUMO0A43/2NvqNM+lt8u9B1on3fzjdFCNjEWiImSo1rs+OEwN5WFUbHdyXMm07Q0v9U/hhJmOz4Kf5LmW7iJMK36LWq3PWGiF0mzLHFcZJ3b4KOXxsKW8PDRodfIqkiCzTs3o3cLMxBA5RXOfWc4zBeOxgISgr2jmrWPIwxcNu560uXlEghfgY/5+4IFiuTP1QPqdiITozeeL27J/D6gpgBCmv2e0k0DXaQ+xAGzc45so1pFb2QAfyycBXZeUD6qzzjbJzUzP78vaQvBTK2UxxOaMu/HErzp2vLnPWXm62vaw4dCQanFzDCNdh3MSGG5lCmetyObu2gAZkUsvT/ig6jmsO6XuE8bHxN5IpIq1yZCTcCYrDqOoH2879BDTHOflH8P184vnnIrC1X3qD0UShAjWMEG9jkjkO933lmLyDwXxOLjxnM7B
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:49:54.9888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85af9ea-44d9-46dc-fb79-08df1234c458
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358

GSP boot uses the detected vGPU mode to size firmware resources and
populate GSP_INIT. Carrying the whole manager in the boot and unload
context couples these operations to its runtime interface.

The boot code only needs read access to the mode, and unloading does
not use the manager. A short state borrow is sufficient for both
context construction sites.

Make GspBootContext borrow VgpuState directly and read it in the
framebuffer and GSP_INIT helpers. Return a state reference from the
manager without changing mode detection or the values passed to firmware.

No functional change is intended.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 2 +-
 drivers/gpu/nova-core/gpu.rs          | 4 ++--
 drivers/gpu/nova-core/gsp.rs          | 4 ++--
 drivers/gpu/nova-core/gsp/commands.rs | 4 ++--
 drivers/gpu/nova-core/vgpu.rs         | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 26e94d908b77..882827bcfd3a 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -295,7 +295,7 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
 fn wpr2_heap_params(ctx: &gsp::GspBootContext<'_, '_>, fb_size: u64) -> Result<(u8, u64)> {
-    Ok(match ctx.vgpu.state() {
+    Ok(match *ctx.vgpu_state {
         VgpuState::Disabled => (
             0,
             gsp::LibosParams::from_chipset(ctx.chipset).wpr_heap_size(ctx.chipset, fb_size)?,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4b562a8687b6..cf24c0d00173 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -359,7 +359,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
-                    vgpu: &*this.vgpu,
+                    vgpu_state: this.vgpu.state(),
                 },
                 bundle,
             )
@@ -424,7 +424,7 @@ pub(crate) fn new<'a>(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
-                    vgpu,
+                    vgpu_state: vgpu.state(),
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index d043954fe4a7..93291c67d6de 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -49,7 +49,7 @@
         fw::GspArgumentsPadded, //
     },
     num,
-    vgpu::VgpuManager, //
+    vgpu::VgpuState, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -68,7 +68,7 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
-    pub(crate) vgpu: &'ctx VgpuManager,
+    pub(crate) vgpu_state: &'ctx VgpuState,
 }
 
 impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index ce1761c2f398..09223bc3b793 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -107,7 +107,7 @@ pub(super) fn build_gsp_init_payload(ctx: &GspBootContext<'_, '_>) -> Result<Enc
     for &(name, value) in REGISTRY_ENTRIES {
         regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
     }
-    if matches!(ctx.vgpu.state(), VgpuState::Enabled { .. }) {
+    if matches!(*ctx.vgpu_state, VgpuState::Enabled { .. }) {
         regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL)?;
     }
 
@@ -121,7 +121,7 @@ pub(super) fn build_gsp_init_payload(ctx: &GspBootContext<'_, '_>) -> Result<Enc
 
 /// Builds the optional VF topology portion of the `GSP_INIT` request.
 fn build_vf_info(ctx: &GspBootContext<'_, '_>) -> Result<Option<VfInfo>> {
-    let VgpuState::Enabled { total_vfs } = ctx.vgpu.state() else {
+    let VgpuState::Enabled { total_vfs } = *ctx.vgpu_state else {
         return Ok(None);
     };
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 6b7e045acea8..905b3a7331fd 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -85,7 +85,7 @@ fn detect_state(
     }
 
     /// Returns the detected vGPU state for this boot.
-    pub(crate) fn state(&self) -> VgpuState {
-        self.state
+    pub(crate) fn state(&self) -> &VgpuState {
+        &self.state
     }
 }
