Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FF3749E4
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609419; cv=fail; b=DKjCa8B5XhxEZ1UhIz4fuM8If/scad5fa+iNZ1bGKfBrK0Nq28pvL39BW9GmARwcvNFbYdC3HN7s/L4YthHYjdOgritBU6s4TbGTX5FGyfpe5180rxJmGY205b9MKwqeWW0PNkFSd1bRUcJRY2uAv/ho2qlqsAe2cmybyMv5ymQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609419; c=relaxed/simple;
	bh=w6ZO+VcFXn23lCLcyfT9iFZ8eE6edEo03oIPakQLsV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+zEDQrEIxaebbY+xd/RfDC9fgPf0YlE9Zrh2jtYFv46y2BrzVA8GEFiBsL0cdXXQg/VL5AQ3GU9WIs+uuG/6MpA+aOlVvxbG2+BzFJZ3W1buXUnxGYuUsYeTCg/JwPaUD19hjEMKi973u5an29BRMTJ9KrfU1UpG6xHPrBeV8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tGtKhF1n; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tGtKhF1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaqjZzluf8HmpRiDvmWQshN3J582lIuWmqJzZzKhC+Ng9QqazzhLtTeENswvIEf1e7nqnScd7mXFUYaf3gTo+5ASqVGwqGXo9IaqKKdMnxs2qMNqRtCTbI6IjQZ/K+5Nio3SFmhgorasg9FXecH1pT6snbTSs/2a5tw4U2UZJsCkrFxuirEUyaXYxNgMNyJcGWEgZVJ71Bk+gV79Rr+xG5itWYoO2IDYsepkihWfketWOuI6aGbzch23eSEjKrtbo59jL3C4XBQqNEzRMnyqB94QYvS6ZqEVNUNsCWfL5ln8LcR7GRug6oyyj8Di3JNUUBB/my9pOZp7yjQhWiIcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI6DEsiugZ8c8s8AQ+udZaMz3D4XQiJYPyHf69IgQYU=;
 b=jRX9hguaJZYmIS3a/oMhNrASV528+6Q38tWzopgVt9Aq2VciRqU7ANpIL4V6fIT1oD/HpwgN1z7nXfI//6sIrnvKHpPIQKjEjKnRIfi1vPloI29K0w2X5MItBOo7X88/Q/XtKpySTw6AcjCKQbqnGN9LYxZVjvi8GO5ghibsSyyuQLXK7gnnrtSWhrsKlURuPc2x26A4z6fEQzLjPol68QcM15YOWurMloQyNb9Ht/kxAaYkFjv0+HYPuBEX7X0W4X/PRi7m5O1sbZVDa/pe4M9g/MMH+YFvC25QAAebQqVD7dsIHLLvnwANMLLM9lYDjVJ0uiZnFZFova3aXAo/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI6DEsiugZ8c8s8AQ+udZaMz3D4XQiJYPyHf69IgQYU=;
 b=tGtKhF1nUIq21P+AZ93AsKehc8UVmqn84sqAtwGo3FRwMrS38C6v5nHnLM7RuichT1gFQjXqJUvWa+z1Fq4BEqKfDpOJFMXCghr1KhwCKdMYWZURE871PDyoH7KFKvhIvEIF6UyIyF9057iitObVVWlvWKk8UZgjBRYyHl7j1gXgqCMmnM1D2Ds3VhnIx9QmxvrYOiFk1BjR7AdOFz9n8v/x3dYiJYJ7icHnWf1R+d+tu+VAXRCcUT9AJnB1speRGyzGpDwzg4ttHxr0WAOZFEsL7tJl1gmPliWuN4m0rQ9MI+Tq3dj5rEXnsLqFUQL4BhiB/E3VLKgDg/Fkz9UsiQ==
Received: from PH8PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:2cf::21)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:03:19 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::83) by PH8PR07CA0026.outlook.office365.com
 (2603:10b6:510:2cf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 15:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 15:03:18 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:45 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:45 -0700
Received: from inno-dell.vdiclient.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 08:02:38 -0700
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
Subject: [PATCH v4 4/6] gpu: nova-core: add vGPU preludes
Date: Thu, 9 Jul 2026 18:02:04 +0300
Message-ID: <20260709150206.1046839-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260709150206.1046839-1-zhiw@nvidia.com>
References: <20260709150206.1046839-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ce2a4f-e362-45d7-320f-08deddcb35b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|82310400026|1800799024|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	OeBsZZgalS2pWE0sAus407T4aeJMJ6q2P5/vrLWkCnsCLxtuyHGWy1cSU8p9akeiX4hDSdRzTJ8mqVdpegVf4cdMKq2LD9oYsnpS1RIrFA9+DILRndaIWSeF0d033eCOJzQqQKa4qPBqSkQMQxijjVe46drA/QZznplzlHVIRsXinQkRBV9hh4rboU6O7yCmxQKzjgEguNHIccoC2X3vXDCWlZGNL2blmx40NT/t0LN/xyLXfo8lFt9ZjZwUc6r4ij93G6V0ygHXHb1ASQ+1eK0crrN9M9QdKHZYuBb7RFKnV0zSgxl4X61uvWIuVEJtPczcQsoMpVk8Z4Ncj5qdkojoaVq9ffBYWCvTpQuBbntGVPrBOGpLnCiCuCF6Uv2PeU8uFCx4/XNReqP+1uCXHR67e4148R9lNl7wt6XIfOkgQ5fFEziqble+I5LDu8nlv90Y1yetCYnXdwYYNEiCNHshJ44eaKQd01er2Tu3QY0bLVPOplGhPFXQ/PGAqcTzM2kgWgxYyBsZXj/3dTg7rbtco5jfKEdhS84gTtvDn6i5O633WwuDfjHHUjT+j0mA0Q51SHTr/IPJSDAfHU6T2S8TB3UJxJTMfXPzwj8sqHJr/7Gm7SLIa5izKCyqJXIsu2DfCw3tZhBLDAh+L3EdInr/uetmw+nF/c5atK9hLFvoRm0llwvyXZXMeOoc7euGopOjx9QprqrBtGPB1yeFgQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HUiLlDXkqSjh55m+vNjS67S3qIluYbgrGkopnLrfntYDimAQXZoTMb8HuTosMAvxAFl8wz7fV1kyohB+dB5w+J9/gP1fSe2QcbO1SdY7FsmBCvtchteDQ9hIR971lJFKTO11nqdeVaTchoJCNb+lCbvAYYI/cpVIv7MpMhEeysXv+APQKAccPskqG/iOOryEp8N3aM1o2ldSAhaBTc6zjHPRZVr+xAKG53Mx5OaxFg+97q2sKLLkVB1A+vsp+r4RQbYTcSZWKJFsQI5bC1C3ih0ZFH3VOr3rwrQfV36jzHOL+bNrspT9psN+niIDVmqRJqu909zWt3dVPOGNu+CJkSgSG2TLCj8VKnax+Ztsa4Xh4RIXVaQIhYkPYpl/WqRaIqZpt+srtTQ+vTCzlOoSuceY2OxQe0LT8x2tI0eh1YTt9/MoOqWT2R2ilmdojVpO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:03:18.1412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ce2a4f-e362-45d7-320f-08deddcb35b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800

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
 drivers/gpu/nova-core/gsp.rs            |  2 +
 drivers/gpu/nova-core/nova_core.rs      |  1 +
 drivers/gpu/nova-core/vgpu.rs           | 90 +++++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/hal.rs       | 25 +++++++
 drivers/gpu/nova-core/vgpu/hal/gb202.rs | 15 +++++
 drivers/gpu/nova-core/vgpu/hal/tu102.rs | 15 +++++
 8 files changed, 155 insertions(+), 1 deletion(-)
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
index d89cc3ba7c72..164bae8b8524 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -49,6 +49,7 @@
         },
     },
     num,
+    vgpu::VgpuManager, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -67,6 +68,7 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
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
index 000000000000..fcc15bddd53e
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
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
+        total_vfs: u16,
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
+        pdev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        fsp: Option<&mut Fsp<'_>>,
+    ) -> Self {
+        let state = Self::detect_state(pdev, chipset, fsp).unwrap_or_else(|e| {
+            dev_warn!(
+                pdev.as_ref(),
+                "vGPU state detection failed: {:?}; disabling vGPU\n",
+                e
+            );
+            VgpuState::Disabled
+        });
+        dev_dbg!(pdev.as_ref(), "vGPU state: {:?}\n", state);
+
+        Self { state }
+    }
+
+    /// Detects the vGPU state from the chipset, SR-IOV capability and FSP PRC knob.
+    fn detect_state(
+        pdev: &pci::Device<device::Bound>,
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
+        let total_vfs = total_vfs.get();
+
+        if total_vfs < 2 {
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
2.51.0

