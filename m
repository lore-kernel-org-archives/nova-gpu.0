Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9A7360EE1
	for <nova-gpu@lists.linux.dev>; Wed, 22 Jul 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706020; cv=fail; b=hn8QF8QiQQsZfj2dsIKsNuJ5vRBw+cIRGpDbmHaO5XKFhbz7C1DNhz0ov4WjQoZEdvPkTU3vXokwyREz7Crv/PwjV29AJIv9TUpRCEQCoWWYRiQpoTyr3wqAJCvxXnitPmH8KQsB4kce5RrQBleQek4zd2x6i0ldO2PSOEal1WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706020; c=relaxed/simple;
	bh=5XWM2R24Ui6LM0a12AwuleRITIGgerh8dbG2xLqkoBw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWT/VhmF2sNFp/C+jhabY2Ea6yP8EdmfgDYFedy7U60356QrFtpFcDwxAtYGe9NInXrj8A9WdqsQ5Ue0v3xZTcBFXXW3sjrHpmV/6IB5WZMcM6/gvOr5rQSa6fGcmGOGbMHea0ZDLwwE5ehpcfh8VcCjWIRe6LwSSqRx5K6mUuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=otjz/YJ9; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="otjz/YJ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTFmq4GDoVuAeKgXiY2vh2ai1wuF8MQEdY+knWm3Nr6KwXWLW+Db41rHMZmH76mvcQ8XwKB8RXgRfIEon5+p89+y+C8OQ3XB7imVl4XIePs/ZcmnuOWFhtpPDthrmYE2cW5UKyn35LI+dQGYHtWqjWrau/hdd6ll2UAEMkXYhd+4DzGHWWX9yALDHMhgkny0BavRH5OUTD7+OmTIcYdJqv/dUPDkcBwGq4RLNDsf+NJsaXKCeSsHPjo6VPEEWZ1878Ld5tqyQkANWu7TlsibwBoMvByA/Tlv08Xp1ooPEu4A+rGL7l275EtKr8uykVGNa/VeHkgTDw0Nh2g0M5xaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=414dHjPJ7FT0Hn/WTVPtAqMgZDPH6Zw5ZM3hFqi7d+4=;
 b=dmYXlMBukZAIpuCX9Ks0jPl2bC3sCJP8VUGo5qXvINu7LyU83QHGwrtZOub0fC76P5bqu+wBQmVN1ssM1Ywi41VtH6Klpfxvu4zzebo6K5WiMI25XkyQIGRBMrTeLMJ8eAv/y/ivt2A6OnPzzq+9GatLb/9kcBu2/3WBGjp/a2zGXFNXMkU/RKIgKMTrM6boUSyHRB9hrdBt9iKyJR/G1IX2aXqH991BHqYwHBV2tSCjtC7kw/aITytDF7tdwqep5hJACr6UL13YU+XdkUfp/zmIDN+II3Y+he6Gl4/gcjwpA2HSqr1sJhucZSsD1LuaF+SZFxqAN+ueGhIdlyU45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=414dHjPJ7FT0Hn/WTVPtAqMgZDPH6Zw5ZM3hFqi7d+4=;
 b=otjz/YJ9UG6YuSqtCtbPtJL0y+6DQ5HdGZwi2VSKlu9eY4zCzqDhPxtJkrpoF+3vrMCxtf8TNM0A929VfdY3DB41FPjSZC63oET2riXFFnqkJvajjBb7Bkc5WZHg+JABW7eIMbimJDs61fhMl3T7k6wDIuLWf+h91Y3KyivLHlVkQihIF7BXr483TbrZHzyRNr0ON8xUZ4HBJCLsmEaBMgDG+Db2QtCTgYDVwJBmox/cmrjrevIXHKkiimRiIq02OK3b3Am4zh7GUtmRupNAYLy0RRI/8E0gsuxkidT0bgAtkylz7qjIPnFPjxZIa/AD1H8gCwCWQJ1jYedQuy8HJw==
Received: from SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12)
 by CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:40:10 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8f) by SJ0PR03CA0127.outlook.office365.com
 (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:40:09 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 00:39:56 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 00:39:55 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 22
 Jul 2026 00:39:48 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v5 4/6] gpu: nova-core: detect and store vGPU state
Date: Wed, 22 Jul 2026 10:39:11 +0300
Message-ID: <20260722073913.1807677-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CH2PR12MB4232:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cadff6-d413-4ce2-348c-08dee7c47524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|3023799007|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0CdHJ7oToVBrAMUdOa8j7YNcw32ksWgtvvTLmyeH39hDcyyYi+50RRs4bYk5qpj/k6LoFuvNvSjd6MygxikS+OKu4neXIxg7D/FQfb3fAJxQ3Vh9ban2AckeG15GzZ1VCIBL9GXVrPqrBoAEinVOqGK4tv3xJfldn5yxBUNp5zeQ84AMAvK8Xr6fGKs+xQQZ9yVO/QEd3TmZuBtm8v5VX1Tm7ruFdlPJ0qrEJY3JGBxhP8cvzkU20TJVWefED/XeSQOS0YDRt+GhM7Ow4cDSayN3CVpgJ79qcnxffLxd73KRyQ/YEdfQcYhcX3mT1/4BvEdQ2MTBb42wK16YxLcwO4xw2qDhttqkUBzhENOfOpA0uuTU0cou+31L2lNMOqndT6n3iQAYQMp5k79Wgryt9IHTN6P0vKwx0Zy9Kn8SmnMfFTvwbH8aZT9YDj54JNGH3QzJpTT8iOZiDgHyfX2pEYQYk8JV+RB9rsu8/ATywytTtBnSrHCUWmDJlJKdv5rS3KTQMvw1pr85iBtPlWaE/fmzDTwXwIj2v+Ev6IDjjvFx7pxS7ETmhLCjtELo5/aSzxafmexyUtRk+dY1WqY8tSh99vOZsVRvKzRuySdprHip0xWvsRojUQv/nzyLfd3bJLjuI6P4F0bVL+WbUmrOrCvZmknFsgI4ql9jB4JBKy0geI5lpZgeZeKn52jJ2jva99y8FvV+6rqOjYSk+8CVJg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ccx434NgsT370ytvH18CtAaIK3uSmSjM9zcugTKbREFPTbIFx/wO9xPT8DnTH0jLHJfGBo6lHvNjWdp2Ox35QNYqvpTR7b/dFhCNuT4mljAszhkZK69BnHNiDA+KMcEusqE2C4zaZIV7K+cpGi8ZGT7CQqn0r5L+Lh3TFXSFu07aHlU4/qMXS6WIrq6hWJpLHKG4E076C1L7nw6uQWqOluRIO68mp1rcpYzCsWCcQ8lCNEqgqLMYM+mBVy7mHn6oC87+wZVM/H+X2v8+0h38iM1oKEsL93j/XuU0V2FyqKJeycuaAHJWumJtOcGthqgHqbFTgk1MlcDEc6vcLaLbkdsfYs82KIkqslFC/yKwFVOCCgTXJqwE/vxT1Qt8wGJvrDQ9fLo3zHDlUtfJyrdmizX8JorLUjSwCxMZdXLoIhmXetge3gcY5Otk2FSNi7L6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:40:09.7972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cadff6-d413-4ce2-348c-08dee7c47524
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232

GSP boot needs a stable view of vGPU state before it starts building the
boot-time data structures that depend on SR-IOV and firmware policy. That
state must be derived once from the PCI VF count and the FSP PRC vGPU mode
knob before booting GSP.

Add VgpuManager to detect and retain the vGPU state during GPU
construction. Keep the manager separate from the detected state because
later vGPU milestones will add vGPU resources and lifecycle state to it.

Keep the vGPU capability gate local to the vGPU module with per-chip HAL
modules. Treat failures to detect the optional vGPU state as disabled so
they do not prevent a bare-metal probe, and log both the failure and the
detected state where the manager is constructed.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs            |  1 -
 drivers/gpu/nova-core/gpu.rs            |  7 ++
 drivers/gpu/nova-core/gsp.rs            |  3 +
 drivers/gpu/nova-core/nova_core.rs      |  1 +
 drivers/gpu/nova-core/vgpu.rs           | 93 +++++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/hal.rs       | 25 +++++++
 drivers/gpu/nova-core/vgpu/hal/gb202.rs | 15 ++++
 drivers/gpu/nova-core/vgpu/hal/tu102.rs | 15 ++++
 8 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 3a6b02f0dc11..abc161c4ba96 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -487,7 +487,6 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
     /// Reads the active vGPU mode from FSP using the PRC protocol.
     ///
     /// Queries FSP's Management Partition for the active vGPU mode knob value.
-    #[expect(dead_code)]
     pub(crate) fn read_vgpu_mode(
         &mut self,
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 442c0979f9c6..42a4cd7971fa 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -30,6 +30,7 @@
         GspBootContext, //
     },
     regs,
+    vgpu::VgpuManager, //
 };
 
 mod hal;
@@ -267,6 +268,8 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
+    /// vGPU state detected before GSP boot.
+    vgpu: VgpuManager,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp,
@@ -311,6 +314,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
+                    vgpu: &*this.vgpu,
                 },
                 bundle,
             )
@@ -364,6 +368,8 @@ pub(crate) fn new(
 
                 fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
+                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
+
                 gsp <- Gsp::new(pdev),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
@@ -376,6 +382,7 @@ pub(crate) fn new(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
+                    vgpu,
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f38630026e5d..0480881d437f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -51,6 +51,7 @@
         },
     },
     num,
+    vgpu::VgpuManager, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -69,6 +70,8 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
+    #[expect(dead_code)]
+    pub(crate) vgpu: &'ctx VgpuManager,
 }
 
 impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a61406ba5c0b..35a8b1214b0e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -23,6 +23,7 @@
 mod regs;
 mod sbuffer;
 mod vbios;
+mod vgpu;
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
new file mode 100644
index 000000000000..71fd0fe879c2
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::num::NonZero;
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    fsp::{
+        Fsp,
+        VgpuMode, //
+    },
+    gpu::Chipset, //
+};
+
+mod hal;
+
+/// vGPU state detected during GPU construction.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum VgpuState {
+    /// vGPU mode is not enabled for this boot.
+    Disabled,
+    /// vGPU mode is enabled for this boot.
+    Enabled {
+        /// Total number of SR-IOV VFs supported by this device.
+        #[expect(dead_code)]
+        total_vfs: NonZero<u16>,
+    },
+}
+
+/// vGPU state manager.
+pub(crate) struct VgpuManager {
+    state: VgpuState,
+}
+
+impl VgpuManager {
+    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU knob.
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Core<'_>>,
+        chipset: Chipset,
+        fsp: Option<&mut Fsp<'_>>,
+    ) -> Self {
+        let state = Self::detect_state(pdev, chipset, fsp).unwrap_or_else(|e| {
+            dev_warn!(
+                pdev,
+                "vGPU state detection failed: {:?}; disabling vGPU\n",
+                e
+            );
+            VgpuState::Disabled
+        });
+        dev_dbg!(pdev, "vGPU state: {:?}\n", state);
+
+        Self { state }
+    }
+
+    /// Detects the vGPU state from the chipset, SR-IOV capability and FSP PRC knob.
+    fn detect_state(
+        pdev: &pci::Device<device::Core<'_>>,
+        chipset: Chipset,
+        fsp: Option<&mut Fsp<'_>>,
+    ) -> Result<VgpuState> {
+        if !hal::vgpu_hal(chipset).supports_vgpu() {
+            return Ok(VgpuState::Disabled);
+        }
+
+        let Some(total_vfs) = pdev.sriov_get_totalvfs() else {
+            return Ok(VgpuState::Disabled);
+        };
+
+        if total_vfs.get() < 2 {
+            // The current vGPU path does not support single-VF SR-IOV devices yet.
+            // Treat one total VF as vGPU-disabled for now; single-VF support can relax
+            // this gate once the manager handles that topology.
+            return Ok(VgpuState::Disabled);
+        }
+
+        let fsp = fsp.ok_or(ENODEV)?;
+
+        match fsp.read_vgpu_mode(pdev.as_ref())? {
+            VgpuMode::Enabled => Ok(VgpuState::Enabled { total_vfs }),
+            VgpuMode::Disabled => Ok(VgpuState::Disabled),
+        }
+    }
+
+    /// Returns the detected vGPU state for this boot.
+    #[expect(dead_code)]
+    pub(crate) fn state(&self) -> VgpuState {
+        self.state
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/hal.rs b/drivers/gpu/nova-core/vgpu/hal.rs
new file mode 100644
index 000000000000..456f8fe27582
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/hal.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::gpu::{
+    Architecture,
+    Chipset, //
+};
+
+mod gb202;
+mod tu102;
+
+pub(super) trait VgpuHal {
+    /// Returns whether this chipset can support vGPU.
+    fn supports_vgpu(&self) -> bool;
+}
+
+pub(super) fn vgpu_hal(chipset: Chipset) -> &'static dyn VgpuHal {
+    match chipset.arch() {
+        Architecture::BlackwellGB20x => gb202::GB202_HAL,
+        Architecture::Turing
+        | Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::BlackwellGB10x => tu102::TU102_HAL,
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/hal/gb202.rs b/drivers/gpu/nova-core/vgpu/hal/gb202.rs
new file mode 100644
index 000000000000..3add8af26616
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/hal/gb202.rs
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::vgpu::hal::VgpuHal;
+
+struct Gb202;
+
+impl VgpuHal for Gb202 {
+    fn supports_vgpu(&self) -> bool {
+        true
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn VgpuHal = &GB202;
diff --git a/drivers/gpu/nova-core/vgpu/hal/tu102.rs b/drivers/gpu/nova-core/vgpu/hal/tu102.rs
new file mode 100644
index 000000000000..baeea3ac5754
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/hal/tu102.rs
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::vgpu::hal::VgpuHal;
+
+struct Tu102;
+
+impl VgpuHal for Tu102 {
+    fn supports_vgpu(&self) -> bool {
+        false
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn VgpuHal = &TU102;
-- 
2.53.0

