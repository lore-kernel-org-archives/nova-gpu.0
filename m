Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE94266BF
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573521; cv=fail; b=uhI4wNrj7f+0Zzj2e7RKlyfvWcfTo2/2y5vxL3cRCL1sDzAHjINlm5GZGORzm0hBlXSRuSjZhY7/ybEHO6NBvPjjWYmQgLdUJFHMRnDeIcFbr1l1UA/7tzg9hT3gmd/BWYpB0AcD2fAmZxuk8vOfKnVAfZsBdt3+UiLLL60WSDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573521; c=relaxed/simple;
	bh=FvPAVg4+AlyLPCDP9PvYG1XMYsxL42AzO8XUUSvUbLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iB8xEQhCTGrZePfCdUJ77SiWG0xPwwDgy2qxeoquX8QmlLdEj6+Fgqa8anqkOnUIm9aRXd4f8VUXTTufQ2Q9jQfSjiXWsMmgo+hbCW364w2HYe3R5Wv+Fghr48ykaereum9EZtxS0n45fiB7s7nRz77ksL3qjhu+wfRoOmBL6Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=evXU/Tu/; arc=fail smtp.client-ip=52.101.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="evXU/Tu/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEozaKgEttfN5J+79SmNZjcn9UCDsLNc7rZXIF/H1hmZe8JDyI5b/XV6kK98tucU772yHUmeTDGsk573WhWY/b5yIMTNTXXc+hPMs3e6pYjw/sjWw8Bm4vu2tUIThXzm5cLkeiRwNQgdVudrdBo5Gkjq3S3oBHNAb/5M2CXo1A4+xBYrO/YmT/hW6hgsTchVtfqiOjI9r/4XfHMPeGpe6w/o2QU2n1+Y7mKQD8qB8LtWtxA9QlHG4l265JSsIy5YtA76n/VtxJUbSqf8kRrf5/2IiB7Vmuli3vROjO1MmHkdqlIfcmyZuuAla38MfgGSEZP9fpoRUkZZ7x+et6e+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWhbtpcQOuj5xzXSQJgQw1pSHq50TayvM/GESzl1jI=;
 b=WyWEYPejtTMAJ59iAYVZ+liHbch1z9Mom+MLOTmobm8NbZHIOUdtuYaoEBzE/pjg1EJVSpfc3KgSNSp002XqRiiY4qSasnx1zn7+JYHJ1vI9fJQMZSooAav+V4Qj4hemyIcYQcjZmViZ1CSYleVPIwp0/bhG0intVrY/IULI+7Ft6a0eV/4icyYEY73UxDDp/+9I6zRMttKWp8VVHD6c25UjSRxKGTwd5ho6hoP3QnvQ8bT/wC9ncnrJOp1TYJuw4lQLQaol/vhwVJf5RaPlNXnUXI6FketDHKGKyWLEitib78vd4hyXRL76ww3rgYC9s5pZzB6FJxejMy+oHnIjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWhbtpcQOuj5xzXSQJgQw1pSHq50TayvM/GESzl1jI=;
 b=evXU/Tu/96+ZYE7orVlih2WdCx6CnYpmDmpu+5LSDTgWo8qqUzo8HwMFp2DzL9zbyk+t7QZbCOfd7rjmIugB9FxuY5skUFf1zvKImkGiQdBhish+CC0WTP3PCgfggr9sILjkGIz2DFMdsT2YnDahkENi/G+OtP8gJUBTC2UzA3pw2LUTI0Q/A8EOgjgH9RiQJU8v96kktURLxptYf+VrrUt0jdGGrPttw3oyIPBfEZ9iKX1U0yRE8bg4k9jLkiAko+LLg3sWYA4d/Hn7xrQbo4ZHYMgVAZuSxLiwFmLN0meZ715ilV5dYVY0zPEIMrWkWclAx5ugCFEukd6OxZ23eQ==
Received: from SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:45:10 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::85) by SJ0PR05CA0079.outlook.office365.com
 (2603:10b6:a03:332::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.2 via Frontend Transport; Thu, 4 Jun 2026 11:45:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:55 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:54 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:47 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 7/9] gpu: nova-core: add vGPU preludes
Date: Thu, 4 Jun 2026 14:43:37 +0300
Message-ID: <20260604114339.1565660-8-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604114339.1565660-1-zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 72838f75-bfc5-4f2d-56a0-08dec22ebbc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GkdePAsScXwFK+YAn6QMhrFApildWFnvQZJn+kEUmdwD6eh6vXsrNPG/edfBTsFCX1Hj828TO/JlHwfz8Yy2qvmpRpiCsuGhZ5BBtt5cXkLvA2BmDvNvlkKqmYLUu3D/POYmAfEV2QKTmwwGLfqCXBwoVwvct2y5p2iBeB2d4WiRogmTMPvl1PvbO5rmY3EDdPU//LH0Tah2GAYqTRKe5TbQCSeZwBhJp/eYPYTJLYlUxJXIi9J0CcJmi1LCcC9Y8754I8l/WZ8IiN0P99aM03OFVkMIjifRctBC/Kuh3QAb6Z5STYzA83OBLVcTewa6ss5XB2kFZ9FYMOZfYGqyIyURZDXRJFrM8lE/+Rtk1WQr6ebqFXEu1nQf1FUW23IjtZwM8H7Fd0q7a6sVN22LjcFZZVguzo5Pc5IA0DTcaUnKQ+2iBZO0GlbVIYCmx+YB8co9N/IUb2plNbh+L+Zb7iHOZFxcyWwYHv2vNwcVjhWKvTRt01hc+38/jok9UFxB4iDyOEUboxqVkUn7/V0POUk3s76f4WH+5qnl0b4/R2eRwjXVsA/MTQQDMFzkWVdOUBlIa6rWYi6Q4JWmdXsnSuJVp28F9/fnCB/WdcdJzLrwwdFyDM6j6URI2pwBeI7gBDZ6ZjxoDwnL3V26yGmGFIo3jt35W5p8q97/baDxYh9pBhpMd9iI7WqX+BtCGc+BgWw9vR5dA0qKUu+OB9NWHSmCPRBw5pw8zOR60rvZLz8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfkdmaJx4P3Ov9bqPgVPz7dr4C8zbYRtL6VFoeb8T65ApC477349ARmHGbzHTysgYVwyhczR1Fi0ZzWfA5F3UMbEpILJMar5RHg2C6+VDN2LBMogKK5xN7OvN8SKz+6jRvVLI9DvT/LEyJzwuqqfEHFUPR/tecJNWuy+4XnpOQtBTlYU6hoxHUaMVIHC+WyU2eE+wpdtYNOzDWt0Vbzdx8eNoEhKKdOefJRSlynsTautNjL76VYSn297JcYlRsnh9VS7QIh1QPvK+9xbCBhqbxqviBT+4NTmi8JVoJBDozzvD+UdSfg1BeE1UVMEbe+/rAomaPTS9RKNY4WPJ7do8SLy2V57aFWnzN+fG6qcFamqd6zAnshaJSql+rRwi+6f6vwyTpOjhgFy2zEyMStirWwSlyE0nw759HN5RAi81dCptmfM4wGqIQFC1ZfXhTAi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:45:10.6196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72838f75-bfc5-4f2d-56a0-08dec22ebbc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042

The driver needs to detect vGPU capability before firmware loading so
that the GSP boot flow can be adjusted accordingly.

vGPU capability is determined by two sources: the PCI SR-IOV totalvfs
count (whether the device advertises VFs) and the FSP PRC (Product
Reconfiguration Control) knob (whether vGPU mode is actively enabled
on this boot cycle). Both must agree for vGPU to proceed.

Introduce VgpuManager to encapsulate vGPU state detection and tracking.
On creation it queries totalvfs via sriov_get_totalvfs(); during GSP
boot the PRC knob is read from FSP to refine the initial estimate.
Extend GspBootContext with vgpu_requested and total_vfs fields to carry
this state across the boot sequence. The FSP PRC read is performed
inside the GH100 HAL boot method, where the FSP falcon is already
available.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           |  1 -
 drivers/gpu/nova-core/gpu.rs           | 24 +++++++++++--
 drivers/gpu/nova-core/gsp.rs           |  5 +++
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  8 ++++-
 drivers/gpu/nova-core/nova_core.rs     |  1 +
 drivers/gpu/nova-core/vgpu.rs          | 47 ++++++++++++++++++++++++++
 6 files changed, 82 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ce11efeba37e..c775e12c5451 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -329,7 +329,6 @@ impl Fsp {
     /// Queries FSP's Management Partition for the active vGPU mode knob value.
     /// Returns [`VgpuMode::Enabled`] if vGPU support is active on this GPU,
     /// [`VgpuMode::Disabled`] otherwise.
-    #[expect(dead_code)]
     pub(crate) fn read_vgpu_mode(
         &mut self,
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 69569e218d9b..6d8e60dd5292 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,7 +9,11 @@
     io::Io,
     num::Bounded,
     pci,
-    prelude::*, //
+    prelude::*,
+    sync::{
+        new_mutex,
+        Mutex, //
+    },
 };
 
 use crate::{
@@ -27,6 +31,7 @@
         GspBootContext, //
     },
     regs,
+    vgpu::VgpuManager,
 };
 
 mod hal;
@@ -180,6 +185,13 @@ pub(crate) enum Architecture with TryFrom<Bounded<u32, 6>> {
     }
 }
 
+impl Architecture {
+    /// Returns true for architectures that support vGPU (RTX PRO 6000 Blackwell Server Edition).
+    pub(crate) const fn supports_vgpu(&self) -> bool {
+        matches!(self, Self::BlackwellGB20x)
+    }
+}
+
 #[derive(Clone, Copy)]
 pub(crate) struct Revision {
     major: Bounded<u8, 4>,
@@ -278,9 +290,12 @@ pub(crate) struct Gpu<'gpu> {
     gsp_falcon: Falcon<GspFalcon>,
     /// SEC2 falcon instance, used for GSP boot up and cleanup.
     sec2_falcon: Falcon<Sec2Falcon>,
-    /// GSP runtime data. Temporarily an empty placeholder.
+    /// GSP runtime data.
     #[pin]
     gsp: Gsp,
+    /// vGPU state (SR-IOV / FSP PRC), behind Mutex for FFI concurrency.
+    #[pin]
+    vgpu: Mutex<VgpuManager>,
     /// GSP unload firmware bundle, if any.
     unload_bundle: Option<gsp::UnloadBundle>,
 }
@@ -319,18 +334,23 @@ pub(crate) fn new(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
+            vgpu <- new_mutex!(VgpuManager::new(pdev, spec.chipset.arch())?, "vgpu_manager"),
+
             gsp <- Gsp::new(pdev),
 
             // This member must be initialized last, so the `UnloadBundle` can never be dropped from
             // outside of the constructed `Gpu`, ensuring that the unload sequence is properly run
             // in case of failure.
             unload_bundle: {
+                let mgr = vgpu.lock();
                 let ctx = GspBootContext {
                     pdev,
                     bar,
                     chipset: spec.chipset,
                     gsp_falcon,
                     sec2_falcon,
+                    vgpu_requested: core::cell::Cell::new(mgr.vgpu_requested),
+                    total_vfs: mgr.total_vfs,
                 };
                 gsp.boot(&ctx)?
             },
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f0901bf86258..94cd4a784b79 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,8 @@
 mod boot;
 mod hal;
 
+use core::cell::Cell;
+
 use kernel::{
     debugfs,
     device,
@@ -56,6 +58,9 @@ pub(crate) struct GspBootContext<'a> {
     pub(crate) chipset: Chipset,
     pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
     pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
+    pub(crate) vgpu_requested: Cell<bool>,
+    #[expect(dead_code)]
+    pub(crate) total_vfs: u16,
 }
 
 impl<'a> GspBootContext<'a> {
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index c9fdc8cacedc..e133a92fb67f 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -24,7 +24,8 @@
     },
     fsp::{
         FmcBootArgs,
-        Fsp, //
+        Fsp,
+        VgpuMode, //
     },
     gsp::{
         boot::BootUnloadGuard,
@@ -174,6 +175,11 @@ fn boot<'a>(
 
         let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
 
+        let vgpu_mode = fsp.read_vgpu_mode(dev, bar)?;
+        dev_dbg!(dev, "vGPU mode: {:?}\n", vgpu_mode);
+        ctx.vgpu_requested
+            .set(ctx.vgpu_requested.get() && vgpu_mode == VgpuMode::Enabled);
+
         let args = FmcBootArgs::new(
             dev,
             chipset,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9f0199f7b38c..6f55a9242027 100644
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
index 000000000000..c8f1b74037c7
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::gpu::Architecture;
+
+/// vGPU manager.
+///
+/// On creation, performs platform detection to determine whether vGPU is
+/// requested (PRC knob + totalvfs for Blackwell). The `vgpu_requested`
+/// flag may be further refined during boot (e.g. FSP PRC knob read).
+pub(crate) struct VgpuManager {
+    pub(crate) vgpu_requested: bool,
+    pub(crate) vgpu_enabled: bool,
+    pub(crate) total_vfs: u16,
+}
+
+impl VgpuManager {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        arch: Architecture,
+    ) -> Result<VgpuManager> {
+        let total_vfs: u16 = if arch.supports_vgpu() {
+            pdev.sriov_get_totalvfs()
+                .ok()
+                .and_then(|n| n.try_into().ok())
+                .unwrap_or(0)
+        } else {
+            0
+        };
+
+        Ok(VgpuManager {
+            vgpu_requested: total_vfs > 0,
+            vgpu_enabled: false,
+            total_vfs,
+        })
+    }
+
+    #[expect(dead_code)]
+    pub(crate) fn set_vgpu_enabled(&mut self, enabled: bool) {
+        self.vgpu_enabled = enabled;
+    }
+}
-- 
2.51.0

