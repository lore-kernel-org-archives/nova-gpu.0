Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909383ADB94
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887282; cv=fail; b=RxBTvo85uQXaygqZmE1eKh/nJFFic7O4L7gzKEZxhRm3ahrO8MJn6cbs30MbT7Zq61/UY0FtHMPiZ7/o0NWNg8nEyAv4yh9HbXlM1+DFWRnIQlYdOQbdE6FBFmlHcpZ8RgUtP+xNnXqEWkFpmVuE+fPBIWrICSFYZfNa+Owlspo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887282; c=relaxed/simple;
	bh=+KZHYeNhBmLBBxinaxvSMRAQE3s6laR0XZTXykQCwIk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bttkz7tgU9TPTyoDXr16Q6DXQfWW/UZvNdSz9PFPEC+TN7xxeQpP6VGTl24dP9shlHvRsAjuUHYJHZDhMPiz0Jg6vo62hb5WkuQtudBNR86aD1kM/WaH6naAlqX5L4ljP6zEH7Pe/Z0OyrtC7oVD9lI2zpuPdRLZr0wQki7iMbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QnSHMTcn; arc=fail smtp.client-ip=52.101.46.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QnSHMTcn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifJp/83/DhOf7on7FZ3ZAPvyyJEV8gha96u2eilIUGFZgHutqZ6A4Ucnp/Fs8ZPsIXzqOM1yFYhxDX2nMNK8Vvd4yFxSApAmYUtwxmLP+2ciHQukNrUVyWP8siv0v+EXLjFQ/+rnGkLgnziO5HoVj0QJUqSU4sVaHzDm7ShHhUaapp+FAOSb/FP5CMKRh3zJ1wtsOfFPptyrc4zlqr/kYibsDLMh+dhR4M7eS3xEldCZ/eN38xhfDgCw5z4U2PDiZqAbwMYsZCCZuy/WlzSLrHsEwe/dvBREsp2MQDvLXRF+YrJj6F0jauR6A5bMmdMEqb4KgZg8gGR28NS30z6cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuvxUWXo2FuLblF4C3bKx0d+lmdyHwOjsmSnT/GF+b4=;
 b=kLepoEnKMBz+7pD1gZsQEqmWctxtPGX4wgn4snirHbrMS0U0rfurNypeCmE6aM8VE6Bc5Z28l5lCWkN8ixSmZ6kfET+pwS6NLnAH5mYA5KDvmokE1RVaKFYU4qpEOcn9o/i1beAdoLLWRaX9bpyxf6fpfEzleQaxdYAdD5uPtAqaIvGBF9xS2qBW+qB6WVQRQUSfh7Uow1eFjRxKbSWy06Vn2gwhUXmLqDycvFQkGq7QOiXDrT1wDDnfGVNfqKpJoASLi4wkwjvk9SU4yWne40ZiP77b0vStlK9t2vrij5sh403H+QvPZx76/oTiBOZbPzTiZRz2cMlt5DDT1c3bEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuvxUWXo2FuLblF4C3bKx0d+lmdyHwOjsmSnT/GF+b4=;
 b=QnSHMTcnhiP51oDwuaEWiJ+VknWc8FXv20nNDhK4ku+st4SSGVrSTDpS1izYqi9l3Veb/BsubXdE+NWIitC1ruzPnGU7h6b14MRJp/ibVrIwP49RIzyWm3zjbEKz08hpSi6ppP+MQ73Oi7HnhAAToTpQh9QOnNewNgTFTIfmZ3otJx60b9FTKEbfo3/gprubPySR4rQysMdxMdQ0z9VC6FYifKsI92usI2Bn3DMb8hUMNXk9nqjj1Sm1e8acUHnTo/dBwcH05Wz4EoeYGkRmA4fchCbJmAIylr9ui14+grN2+0BGjTVw+6lvJkava3sjWkuzX6rSL0NTCWFHWEZTWA==
Received: from BY3PR10CA0006.namprd10.prod.outlook.com (2603:10b6:a03:255::11)
 by BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:27:54 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::25) by BY3PR10CA0006.outlook.office365.com
 (2603:10b6:a03:255::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:27:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:32 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:31 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:22 -0700
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
Subject: [PATCH v3 5/8] gpu: nova-core: add vGPU preludes
Date: Wed, 1 Jul 2026 09:26:19 +0300
Message-ID: <20260701062622.3499033-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701062622.3499033-1-zhiw@nvidia.com>
References: <20260701062622.3499033-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f85f5-2cc1-4827-ee56-08ded739e268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|3023799007|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YzYL6m9R15xMx2Z9cecxQtLyPinDA/U3JH14pm77TedHol+OHw3NUQW/hD3l069tl6RfsUTedoBPHlO3ZzrGR+jxvlEYwjlfIwHpTdgbkMd5hyUFJBuhiOQAkpNmw55uz/uu2ZItrPiHpQiyje1OJQN2uvb/HHCg0fL/Qq8w9NUi94RpfSKpkOHn4rSlhIwthiiHbAYFr+xyXtMoaYyssDYCXTGpICMrOCfxYKyw0otrrY2M1vvH5bCVPDRYuVoFJIv3fS+lT+jYiIRkfcHXsTbxVN/NnqKo6uxxlyKm5UaysruHDqnXGI/ENMc65mVQbW1pW5Hg2YxvbyozvkeI69fa9MTCHgrbM+PPvWoaBwMShGLHW1qwtkD/KqrSQJgMk4KJaZ/anTWbhm8q5mcHR1MOUhgGO55bFDVx24AB1h8zM7gPXVUDh5MX/Uu1yr9xzqdzUsxJivTzKxfPgOcMonFWGCwA96uS397EeyhhLJqGQLBtyT/UkHsfbLsGXnBrqqrDq0sre39hFpJbzou6EHDZRfdM9cc7bcnthhh1Kna+cX4xWiPIXZM4JKyFLTRst625kMFnmPLlGLwSez6J3ArkwDwqgLt3PuJ5Hm8RwdiyEYbCRJjh7zhRwLrZQvdXblWkKLh9eQ5FrYzaEYLIxwCHClbNROgAap/R2DRTc/6lpD3Idk0PckacvCtU6y/rI60pZbiCuGIksTlQQMYsGw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2StEhahYMmmP2JClDaWUdlO2LZfjwg10fx7Z0YqsMPE3ljT3j/dBqvA09UctYDZztQotZI4gfQNO8yag4rKIpsV1tT20ncNzZL9sxUPXPP5pnh1fzH3kURY9btIEbMnpA0Mkva14iq4gnSvZbS9hbMJq3weUl2YJ5zB6QPpDURl/4u5XE4yUpns8l877N6fk0XtC2x/pJXQREtjz8ssAI49Jo15FEDtB3V8h1KY4dHYHbjDforNi+k+7FgL+XUuSNdi1d1H3PgTQ3riFD0SmroM5m1IswX539Vm22EE9vPqviD9pnxQyKzso8aM5ELdhGYT5i7IvZpuKSLvlm4336iGmZmRXOzdxsgTXWRt6vxV+ynoCz1yJo4wx16pitIu7i6WnyUJ8rRfa2FDZz615eSZ85RmnBU3cryPOfEOVyIC4dk5Rn28md7aP8uY8TirJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:27:54.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f85f5-2cc1-4827-ee56-08ded739e268
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130

GSP boot needs a stable view of vGPU state before it starts building the
boot-time data structures that depend on SR-IOV and firmware policy. That
state must be derived once from the PCI VF count and the FSP PRC vGPU mode
knob before booting GSP.

Add VgpuManager to detect and retain the vGPU state during GPU
construction. Keep the vGPU capability gate local to the vGPU module with
a small vGPU HAL.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       |  1 -
 drivers/gpu/nova-core/gpu.rs       |  7 +++
 drivers/gpu/nova-core/gsp.rs       |  2 +
 drivers/gpu/nova-core/gsp/boot.rs  | 13 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/vgpu.rs      | 79 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/hal.rs  | 45 +++++++++++++++++
 7 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 52eeee82f75e..3ce90d447685 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -469,7 +469,6 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
     /// Reads the active vGPU mode from FSP using the PRC protocol.
     ///
     /// Queries FSP's Management Partition for the active vGPU mode knob value.
-    #[expect(dead_code)]
     pub(crate) fn read_vgpu_mode(
         &mut self,
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c0c0c82e3e39..6d6fc7d723e2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -31,6 +31,7 @@
         GspBootMethod, //
     },
     regs,
+    vgpu::VgpuManager, //
 };
 
 mod hal;
@@ -268,6 +269,8 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
+    /// vGPU state detected before GSP boot.
+    vgpu: VgpuManager,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp,
@@ -312,6 +315,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
+                    vgpu: &*this.vgpu,
                 },
                 bundle,
             )
@@ -368,6 +372,8 @@ pub(crate) fn new(
                     GspBootMethod::Fsp => Some(Fsp::wait_secure_boot(dev, bar, spec.chipset)?),
                 },
 
+                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut())?,
+
                 gsp <- Gsp::new(pdev),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
@@ -380,6 +386,7 @@ pub(crate) fn new(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
+                    vgpu,
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e89366b425fb..0012bcc6dc9a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -51,6 +51,7 @@
         },
     },
     num,
+    vgpu::VgpuManager, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -69,6 +70,7 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
+    pub(crate) vgpu: &'ctx VgpuManager,
 }
 
 impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c347558aa8e5..5abab54639a4 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -26,6 +26,7 @@
         commands,
         GspFwWprMeta, //
     },
+    vgpu::VgpuState, //
 };
 
 impl super::Gsp {
@@ -48,6 +49,18 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
+        let (vgpu_enabled, total_vfs) = match ctx.vgpu.state() {
+            VgpuState::Disabled => (false, 0),
+            VgpuState::Enabled { total_vfs } => (true, total_vfs),
+        };
+
+        dev_dbg!(
+            dev,
+            "vGPU enabled: {}, total VFs: {}\n",
+            vgpu_enabled,
+            total_vfs
+        );
+
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 735b8e17c6b6..2df2f773ec8e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -26,6 +26,7 @@
 mod regs;
 mod sbuffer;
 mod vbios;
+mod vgpu;
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
new file mode 100644
index 000000000000..d2f311a8b2d5
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -0,0 +1,79 @@
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
+#[derive(Clone, Copy)]
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
+    ) -> Result<Self> {
+        let state = Self::detect_state(pdev, chipset, fsp)?;
+
+        Ok(Self { state })
+    }
+
+    fn detect_state(
+        pdev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        fsp: Option<&mut Fsp<'_>>,
+    ) -> Result<VgpuState> {
+        if !hal::supports_vgpu(chipset) {
+            return Ok(VgpuState::Disabled);
+        }
+
+        let total_vfs = pdev.sriov_get_totalvfs();
+        if total_vfs < 2 {
+            // The current vGPU path does not support single-VF SR-IOV devices yet.
+            // Treat 0 or 1 total VFs as vGPU-disabled for now; single-VF support can
+            // relax this gate once the manager handles that topology.
+            return Ok(VgpuState::Disabled);
+        }
+
+        let Some(fsp) = fsp else {
+            return Ok(VgpuState::Disabled);
+        };
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
index 000000000000..e6fb6cec2599
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/hal.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::gpu::{
+    Architecture,
+    Chipset, //
+};
+
+trait VgpuHal {
+    /// Returns whether this chipset can support vGPU.
+    fn supports_vgpu(&self) -> bool;
+}
+
+struct Tu102;
+
+impl VgpuHal for Tu102 {
+    fn supports_vgpu(&self) -> bool {
+        false
+    }
+}
+
+struct Gb202;
+
+impl VgpuHal for Gb202 {
+    fn supports_vgpu(&self) -> bool {
+        true
+    }
+}
+
+const TU102: Tu102 = Tu102;
+const GB202: Gb202 = Gb202;
+
+fn vgpu_hal(chipset: Chipset) -> &'static dyn VgpuHal {
+    match chipset.arch() {
+        Architecture::BlackwellGB20x => &GB202,
+        Architecture::Turing
+        | Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::BlackwellGB10x => &TU102,
+    }
+}
+
+pub(super) fn supports_vgpu(chipset: Chipset) -> bool {
+    vgpu_hal(chipset).supports_vgpu()
+}
-- 
2.51.0

