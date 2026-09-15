Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD80305699
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507144; cv=fail; b=h8LkeEzO7dSYxQix2w7TE6BdVKL3TkP4VBMNi0Qjvla7vhAXbeYx5Hto/TSI6DgaChjHCFhgES5G3uAUAPsZpw6eDIZYHXaAay15aB0cicTqmZuLHbEJ8JiCXQPPu9t0YIsDhpb9xjRiinYsyimWhEIX9ocojynKYZ28UJecs2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507144; c=relaxed/simple;
	bh=XZLGSF3DGsqC8NJh7Ls6MycipeP+LXoiFH6t7FabU9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JlUi6hYoauCQvN8uvfSxlsMEJFs2u3WklHHyMuru3tyHdxwgEEBy7oB+6vBYwHxFNf6RKn+054RCKK6og7ADC7bXsRvf0BwD7n0Z4IkQoYs8FW7GnNy7G8iquPngr05PQ7IuZE9PBBo6M4TvaOR67epKfYC7nDqVPEcRFNdgeR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UnbxXm6q; arc=fail smtp.client-ip=52.101.43.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UnbxXm6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/JMssG9hbxZymMKcuD9kE4fC26MmZGyzlMPW3xznyzLVFDdY77knij7wj/HDaUuLlE/PtISxJc8Ms5TT5BPKAvUpFpsAKO1pQ6QU/iTVqFxg2qckf6s8Mw+dLJVemkj18fIZot50o/toLj5WJPkbx7sR+eT0iUGbDGCheemJPCGB4VptToTopXv7jNIz/ljRsmidKA7V7FyaQ3rq3jZXWVc8oqbbqw59zPMDIUMSxsHpmB/phZLl8A5nUNFTVgxnWkkGwkxBjsjfi4eJVd0LauPJ2+DuVpdbQnw6e08qGyzogrMUoBR02TRIoJcJvIEC0hM3jcGk2AKkuZzD5D4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUg44PugxkZv++9OHjFtF49Wj5/UCQo/OA95IJ0S5ok=;
 b=I4rc0S7oF+ABCzHmYmImKf9T0mLag+cVJTx+HmUQxZSxfywSQJnwoag6R0Esq8HPXbI0usHJMh1zFh/l5deU7LrazRJIougKsoBURwb7tNe58y9rIqGFc7GkxQ43+rKYEIuSK0Vfp8qn9N/lW4T143BB+4v+96LTGCPUFCsN/yGJ65rvy+invKtLFtYOrMXMwTtVnAWM222PEpkSqpzGlljSCqV4PMIYyO/pmqT7XmnzlisS0n9gzMHfRwyCWgr3PI2jHG7rXn10vGrF9krL987p55MvQKyIw/pNW9cymQitONlrjDpCgaHWYaY1o1JHGG7MZW6j/oLFrG9DpzbWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUg44PugxkZv++9OHjFtF49Wj5/UCQo/OA95IJ0S5ok=;
 b=UnbxXm6qLS4A+cyilnkCdnVPg5Upav2R1xBdCsWFaJ6eP8/+wVKBj/m8/V+aj/vPKBmqXctHOpzLPvxVlGpbOIS9jKogumcTbOdsoWrCiP3VnqSYv5wryhtZGB2WvYN1nJRgFhl0Ss/DX4+rOybLOu32iHtXNM9eYgchPiKwfqfKM8wBEiB8CFVGOpKyfX2gNNbAWu2jJ6e9wMhiyL1iF7NUsRdhSuAyr0whAXtEm50OFy4xmZ/H1xsYyt5R8wqOWUYuDMLdX5bd7HzE+gEbllFRdIG0kqeixmZeVmD5UB1Ufj8p7RGPHGMaJ/c4GDPsOLjGyMvQybsnq0x28b+FPg==
Received: from DM6PR08CA0066.namprd08.prod.outlook.com (2603:10b6:5:1e0::40)
 by LY0PR12MB120611.namprd12.prod.outlook.com (2603:10b6:408:3b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 21:18:51 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:5:1e0:cafe::63) by DM6PR08CA0066.outlook.office365.com
 (2603:10b6:5:1e0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 21:18:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 15 Sep 2026 21:18:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 14:18:27 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 14:18:27 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 14:18:20 -0700
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
Subject: [PATCH 1/2] gpu: nova-core: vgpu: export lifecycle operations to VFIO
Date: Wed, 16 Sep 2026 00:18:09 +0300
Message-ID: <20260915211811.84790-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915211811.84790-1-zhiw@nvidia.com>
References: <20260915211811.84790-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|LY0PR12MB120611:EE_
X-MS-Office365-Filtering-Correlation-Id: cc71e7df-67b9-4825-463d-08df136ef02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|6133799003|18002099003|22082099003|13003099007|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	S3XNnGt02bqBc9SebDjXPyRLAvHk1vc5NDMv9nZFXb8xixNbazBovuKzWeTjiGuSo8JnaZbqZrkcliJNUR/QfDtijKrHIiY3ZgD3Y1SscFJXbWCLTKc9yhzFu+WCXAEzABOjQoJuOuEYaPwoA5zygbal65j+miL8JgNZmFP+ZTzU1L1xoipeYMbSQoZBoEf0clDY6tHLBuhpIH+55qRY90jIxlnBytVN509eMvurLZ0dtAz6WFuhuo4XKonikmiFLgjlA8Ze4FsUorcwEmLaBrAiO+7NO/pCUIabuWG7K9wcywhkzYf6jNs87WGgzIOhcE6vClgq59iZKDp24aicvyBMWAe6jASRjp2tzTRpUFa8gDHMYil4OS1Ubfe67YYKvsecT9wZkHu9u/YesbsgZ1zAP0veg7NRVgacIWjvtyyxe4WSjtjSpwr2Pnsg3mglppAgRfKcj94sAXzYF0jzF0D22yGUKuNIO74TZHH+OCQTDGhME1U+xqKocv1IVycY6uH8Q6r3akhY5exr02GgoNz1zUwJAu+1XeoYbsvbbeKrVmftGo2mvfJXV4fDF4Ob/mrJkTLHf5x6vA++Zi0rAJUehXymiFL/ePHn7rGGxPJhpa6HxY+g55TpcHPivUtNtUzYCtJIRklhhh5M1th4VeHkDnf5AFpmFtPx37kHBkOqXMwLgXQXYAvAoDfKggDQxQJuiFf5UweDLdQ/Uu2SHQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(6133799003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vCM30+TCilbngPZZ9Nk+lrVhd22aPMAfj9wGMHnKjzmvAA4+nGAaD8N5zG5o/gDEJXhwjq101fyxgb2nJuUMxxgr/L9BMQCu79hi+1TIBKYUomQ0MavEIHAPErWl3/J8JL7meADFl6t3zm9TLiakma2fBa8sh8wfiZxq/Z+0c47M8aJS/huCoFi8FIvuDLY+03yJhMBCX/IJzvuz5nMU75996I6S79f1NjSlHaskz643zlaQERXOD+LvGRqStxUXt8AJndQul+keLoOPNIodOgA7kXMQB/cqEyIlxpa5JkzhB0Vy4u3eAK6s4OO9eQFFvYHlaSRKcYPCfo++CeJkgiUcsFmHNj2YheDlhIBNC108fkDGqlntKpRUmuQhd1BgrcugFUfxsA98ZE0n4Zk1rliqS3JJP0iDrYYmRezirUlPF7rjnnLOwMWxyl1gkkrc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 21:18:50.4627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc71e7df-67b9-4825-463d-08df136ef02e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB120611

VFIO open queries the VF's assigned vGPU type, allocates its resources,
and boots the GSP plugin. Close destroys the instance, and reset resets
the plugin and scrubs guest VRAM.

Expose these operations through NovaCoreVfApi, embedded in the PF's typed
SR-IOV registration. Its C operations table borrows the API until VF
removal. Keep instance locking, activation and teardown in VgpuManager.

Leave the C descriptor empty when vGPU mode is disabled so VF drivers can
select their ordinary PCI passthrough path.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                               |   1 +
 drivers/gpu/nova-core/driver.rs           |  59 ++++--
 drivers/gpu/nova-core/gpu.rs              |  58 +++++-
 drivers/gpu/nova-core/vgpu.rs             |   7 +
 drivers/gpu/nova-core/vgpu/commands.rs    |  11 +-
 drivers/gpu/nova-core/vgpu/fw/commands.rs |   1 +
 drivers/gpu/nova-core/vgpu/instance.rs    | 153 +++++++++++++-
 drivers/gpu/nova-core/vgpu/vgpu_api.rs    | 235 ++++++++++++++++++++++
 include/drm/nvidia_vgpu.h                 |  51 +++++
 rust/bindings/bindings_helper.h           |   1 +
 10 files changed, 548 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/vgpu_api.rs
 create mode 100644 include/drm/nvidia_vgpu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 922cfddcb2dc..92d5c0424452 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8383,6 +8383,7 @@ C:	irc://irc.oftc.net/nouveau
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
 F:	Documentation/gpu/nova/
 F:	drivers/gpu/nova-core/
+F:	include/drm/nvidia_vgpu.h
 
 DRM DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 1373417386a2..67ac3b348f38 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -30,6 +30,15 @@
     }, //
 };
 
+#[cfg(CONFIG_PCI_IOV)]
+use kernel::types::ForLt;
+
+#[cfg(CONFIG_PCI_IOV)]
+use crate::vgpu::vgpu_api::{
+    NovaCoreVfAbi,
+    NovaCoreVfApi, //
+};
+
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
@@ -38,7 +47,7 @@ pub(crate) struct NovaCore<'bound> {
     #[cfg(CONFIG_PCI_IOV)]
     #[allow(clippy::type_complexity)]
     #[pin]
-    _vf_registration: pci::VfRegistration<'bound, CovariantForLt!(())>,
+    _vf_registration: pci::VfRegistration<'bound, ForLt!(NovaCoreVfApi<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
@@ -111,18 +120,15 @@ fn probe<'bound>(
         pin_init::pin_init_scope(move || {
             dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
-            Ok(try_pin_init!(NovaCore {
-                #[cfg(CONFIG_PCI_IOV)]
-                // SAFETY:
-                // - probe has exclusive access before SR-IOV can be enabled;
-                // - the registration is pinned in driver data and is its first field;
-                // - no other registration is created for this device; and
-                // - the PCI adapter uses managed SR-IOV.
-                _vf_registration <- unsafe { pci::VfRegistration::new(pdev, Ok(())) },
-                _: {
-                    pdev.enable_device_mem()?;
-                    pdev.set_master();
-                },
+            #[cfg(CONFIG_PCI_IOV)]
+            if pdev.is_virtfn() {
+                return Err(ENODEV);
+            }
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(&this in NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 bar1: {
                     let bar1_idx = bar1_resource_index(pdev)?;
@@ -149,6 +155,33 @@ fn probe<'bound>(
                 // Run optional GPU selftests.
                 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
                 _: { gpu.run_selftests(pdev) },
+                #[cfg(CONFIG_PCI_IOV)]
+                _vf_registration <- {
+                    // SAFETY: `gpu` is initialized at its pinned address and
+                    // outlives the registration and its borrowed API data.
+                    let gpu = unsafe { &(*this.as_ptr()).gpu };
+                    let api = NovaCoreVfApi::new(gpu, pdev);
+                    let publish_ffi = api.is_available();
+                    let data = Ok(api);
+                    // SAFETY: Probe has exclusive access to the registration
+                    // slot and no VFs are enabled before successful probe. The
+                    // PCI adapter uses managed SR-IOV, and the pinned driver
+                    // data drops this registration before its borrowed GPU resources.
+                    // Each branch initializes the supplied pinned slot exactly
+                    // once and delegates error cleanup to its initializer.
+                    unsafe {
+                        pin_init::pin_init_from_closure(move |slot| {
+                            if publish_ffi {
+                                pin_init::raw_try_init(
+                                    slot,
+                                    pci::VfRegistration::new_ffi::<NovaCoreVfAbi, _>(pdev, data),
+                                )
+                            } else {
+                                pin_init::raw_try_init(slot, pci::VfRegistration::new(pdev, data))
+                            }
+                        })
+                    }
+                },
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 289cbd171250..f28cd4611633 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::{
+    num::NonZero,
+    ops::Range, //
+};
 
 use kernel::{
     device,
@@ -8,6 +11,7 @@
     fmt,
     gpu::buddy::GpuBuddyParams,
     io::Io,
+    new_mutex,
     num::Bounded,
     pci,
     prelude::*,
@@ -16,6 +20,7 @@
         SizeConstants,
         SZ_4K, //
     },
+    sync::Mutex,
 };
 
 use crate::{
@@ -33,6 +38,7 @@
     fsp::Fsp,
     gsp::{
         self,
+        cmdq::Cmdq,
         Gsp,
         GspBootContext, //
     },
@@ -326,7 +332,8 @@ pub(crate) struct Gpu<'gpu> {
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
     /// the GSP is still operational.
-    mm: GpuMm<'gpu>,
+    #[pin]
+    mm: Mutex<GpuMm<'gpu>>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
     #[pin]
     bar_user: BarUser<'gpu>,
@@ -380,6 +387,33 @@ fn drop(self: Pin<&mut Self>) {
 }
 
 impl<'gpu> Gpu<'gpu> {
+    pub(crate) fn cmdq(&self) -> &Cmdq<'gpu> {
+        &self.gsp_resources.gsp.cmdq
+    }
+
+    pub(crate) fn vgpu_manager(&self) -> Option<&VgpuManager<'gpu>> {
+        self.vgpu.as_ref().map(|vgpu| vgpu.as_ref().get_ref())
+    }
+
+    pub(crate) fn vgpu_total_vfs(&self) -> Option<NonZero<u16>> {
+        match self.gsp_resources.vgpu_state {
+            VgpuState::Disabled => None,
+            VgpuState::Enabled { total_vfs } => Some(total_vfs),
+        }
+    }
+
+    pub(crate) fn mm(&self) -> &Mutex<GpuMm<'gpu>> {
+        &self.mm
+    }
+
+    pub(crate) fn bar_user(&self) -> &BarUser<'gpu> {
+        &self.bar_user
+    }
+
+    pub(crate) fn bar0(&self) -> Bar0<'gpu> {
+        self.gsp_resources.bar
+    }
+
     pub(crate) fn new<'a>(
         pdev: &'gpu pci::Device<device::Core<'a>>,
         bar: Bar0<'gpu>,
@@ -509,7 +543,7 @@ pub(crate) fn new<'a>(
             },
 
             // Create GPU memory manager owning memory management resources.
-            mm: {
+            mm <- {
                 let info = &gsp_resources.boot_result.static_info;
                 let usable_vram = info.usable_fb_regions.first().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
@@ -518,12 +552,15 @@ pub(crate) fn new<'a>(
                     chunk_size: Alignment::new::<SZ_4K>(),
                 };
 
-                GpuMm::new(
-                    bar,
-                    gsp_resources.spec.chipset,
-                    buddy_params,
-                    VramAddress::from_raw(info.total_fb_end),
-                )?
+                new_mutex!(
+                    GpuMm::new(
+                        bar,
+                        gsp_resources.spec.chipset,
+                        buddy_params,
+                        VramAddress::from_raw(info.total_fb_end),
+                    )?,
+                    "nova-core::gpu-mm",
+                )
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
@@ -548,10 +585,11 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
         let this = self.project();
         let dev = pdev.as_ref();
         let regions = &this.gsp_resources.boot_result.static_info.usable_fb_regions;
+        let mut mm = this.mm.lock();
 
         if let Err(err) = crate::mm::selftest::run(
             dev,
-            this.mm,
+            &mut mm,
             regions,
             this.bar_user.as_ref().get_ref(),
             this.gsp_resources.boot_result.static_info.bar1_pde_base,
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index fdcf22fa4415..7075d4e32cae 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -31,6 +31,8 @@
 mod instance;
 mod log;
 mod scrubber;
+#[cfg_attr(not(CONFIG_PCI_IOV), expect(dead_code))]
+pub(crate) mod vgpu_api;
 mod vram;
 
 /// vGPU state detected during GPU construction.
@@ -142,6 +144,11 @@ const fn total_channels(&self) -> u32 {
         self.total_channels
     }
 
+    /// Returns the live-instance registry.
+    fn instances(&self) -> &Mutex<VgpuInstances<'gpu>> {
+        &self.instances
+    }
+
     fn fifo_engine_list(&self) -> &FifoEngineList {
         &self.fifo_engine_list
     }
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 63b6f0e3d862..2a9f7ec18ae6 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -67,7 +67,6 @@
 };
 
 /// Query the vGPU type assigned to a VF by its DBDF.
-#[expect(dead_code)]
 pub(super) fn query_assigned_vf_type(cmdq: &Cmdq<'_>, dbdf: Dbdf) -> Result<u32> {
     let request = u64::from(dbdf.into_raw()).to_le_bytes();
     let response =
@@ -210,6 +209,16 @@ pub(super) fn set_plugin_bme(
     rpc.rpc_call_nvkv(dev, bar0, gfid, RpcMessage::UpdateBmeState, &bme)
 }
 
+/// Reset an active GSP plugin.
+pub(super) fn reset_plugin(
+    dev: &device::Device<device::Bound>,
+    bar: Bar0<'_>,
+    gfid: Gfid,
+    rpc: &mut PluginRpc<'_, '_>,
+) -> Result {
+    rpc.rpc_call(dev, bar, gfid, RpcMessage::Reset, &[])
+}
+
 /// Whether a failed allocation may still have transferred CHID ownership to firmware.
 pub(super) enum CeUtilsAllocError {
     /// A matching firmware response explicitly rejected the allocation.
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index aabbf0987daa..c5e5c1eb714e 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -33,6 +33,7 @@
 pub(in crate::vgpu) enum RpcMessage {
     VersionNegotiation = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_VERSION_NEGOTIATION,
     SetupConfigParamsAndInit = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_SETUP_CONFIG_PARAMS_AND_INIT,
+    Reset = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_RESET,
     UpdateBmeState = bindings::MESSAGE_NV_VGPU_CPU_RPC_MSG_UPDATE_BME_STATE,
 }
 
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 95d300803ef6..e1fa128ce70a 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -9,7 +9,8 @@
     prelude::*,
     ptr::Alignment,
     sizes::SizeConstants,
-    str::CString, //
+    str::CString,
+    sync::Mutex, //
     time::{
         delay::fsleep,
         Delta,
@@ -56,6 +57,7 @@
     free_ceutils,
     negotiate_plugin_version,
     query_vgpu_properties,
+    reset_plugin,
     send_bootload,
     send_cleanup,
     send_plugin_config,
@@ -116,7 +118,6 @@ fn wait_plugin_ready(
 pub(super) struct Gfid(pub(super) u32);
 
 /// Resource requirements and device identity for one vGPU type.
-#[expect(dead_code)]
 pub(super) struct VgpuType {
     vgpu_type_id: u32,
     bar1_length: u64,
@@ -132,6 +133,22 @@ pub(super) const fn vgpu_type_id(&self) -> u32 {
         self.vgpu_type_id
     }
 
+    pub(super) const fn bar1_length(&self) -> u64 {
+        self.bar1_length
+    }
+
+    pub(super) const fn pci_dev_id(&self) -> u32 {
+        self.pci_dev_id
+    }
+
+    pub(super) const fn pci_subsys_id(&self) -> u32 {
+        self.pci_subsys_id
+    }
+
+    pub(super) const fn fb_length(&self) -> u64 {
+        self.fb_length
+    }
+
     fn from_properties(properties: &VgpuProperties) -> Self {
         Self {
             vgpu_type_id: properties.type_id,
@@ -158,6 +175,7 @@ pub(super) struct VgpuInstance<'gpu> {
     pub(super) plugin_rpc: PluginRpc<'gpu, 'gpu>,
     ceutils: Option<CeUtils>,
     initialized: bool,
+    active: bool,
     needs_teardown: bool,
 }
 
@@ -233,6 +251,7 @@ fn shutdown(&mut self, dev: &device::Device<device::Bound>, cmdq: &Cmdq<'_>) ->
             send_shutdown(dev, cmdq, self.gfid)?;
             dev_dbg!(dev, "shutdown: gfid={} stopped\n", self.gfid.0);
         }
+        self.active = false;
         Ok(())
     }
 }
@@ -245,7 +264,6 @@ pub(super) struct InstanceInfo {
     vm_pid: u32,
 }
 
-#[expect(dead_code)]
 impl InstanceInfo {
     pub(super) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32) -> Self {
         Self {
@@ -296,7 +314,6 @@ pub(super) struct VgpuInstances<'gpu> {
     vram_slots: Option<VgpuVramSlotAllocator>,
 }
 
-#[expect(dead_code)]
 impl<'gpu> VgpuInstances<'gpu> {
     pub(super) const fn new() -> Self {
         Self {
@@ -420,6 +437,7 @@ pub(super) fn allocate_instance(
             plugin_rpc: PluginRpc::new(comm),
             ceutils: None,
             initialized: false,
+            active: false,
             needs_teardown: false,
         };
         // Register ownership before firmware work so an uncertain result leaves
@@ -503,6 +521,35 @@ pub(super) fn activate_instance(
         Ok(())
     }
 
+    /// Reset an active instance and scrub its guest VRAM.
+    pub(super) fn reset_instance(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        gfid: Gfid,
+    ) -> Result {
+        let instance = self
+            .instances
+            .iter_mut()
+            .find(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        if !instance.active {
+            return Err(EBUSY);
+        }
+
+        reset_plugin(dev, bar, instance.gfid, &mut instance.plugin_rpc)?;
+        instance.ceutils.as_ref().ok_or(EINVAL)?.scrub_guest_fb(
+            dev,
+            cmdq,
+            bar_user,
+            mm,
+            &instance.vram_slot.fbmem,
+        )
+    }
+
     /// Stop the plugin and release the instance's firmware and host resources.
     pub(super) fn destroy_instance(
         &mut self,
@@ -534,8 +581,104 @@ pub(super) fn destroy_instance(
 }
 
 /// Query and decode one vGPU type using the typed NVKV schema.
-#[expect(dead_code)]
 pub(super) fn query_vgpu_type(cmdq: &Cmdq<'_>, type_id: u32) -> Result<VgpuType> {
     let properties = query_vgpu_properties(cmdq, type_id)?;
     Ok(VgpuType::from_properties(&properties))
 }
+
+/// Activate an instance already owned by the live-instance registry.
+///
+/// If activation fails, attempt full teardown before returning the original
+/// error.
+#[expect(clippy::too_many_arguments)]
+fn activate_registered_instance<'gpu>(
+    instances: &mut VgpuInstances<'gpu>,
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    bar: Bar0<'_>,
+    bar_user: &BarUser<'gpu>,
+    mm: &mut GpuMm<'_>,
+    gfid: Gfid,
+    vgpu: &VgpuManager<'gpu>,
+) -> Result {
+    let index = instances
+        .instances
+        .iter()
+        .position(|instance| instance.gfid == gfid)
+        .ok_or(EIO)?;
+    let activation_result = instances.activate_instance(dev, cmdq, bar, gfid, vgpu);
+
+    if let Err(original_error) = activation_result {
+        if let Err(cleanup_error) = instances.destroy_instance(dev, cmdq, bar_user, mm, gfid) {
+            dev_err!(
+                dev,
+                "vgpu_open: cleanup failed for gfid={} after activation error {:?}: {:?}\n",
+                gfid.0,
+                original_error,
+                cleanup_error,
+            );
+        }
+        return Err(original_error);
+    }
+
+    instances.instances[index].active = true;
+    Ok(())
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Allocate, register, and activate a vGPU instance.
+    ///
+    /// Keep the registry locked from allocation through activation or rollback
+    /// so duplicate checks and vGPU type limits remain stable.
+    pub(super) fn create_instance(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar: Bar0<'_>,
+        bar_user: &'gpu BarUser<'gpu>,
+        mm: &Mutex<GpuMm<'gpu>>,
+        info: InstanceInfo,
+    ) -> Result {
+        let mut instances = self.instances().lock();
+        // Global vGPU lock order: instances -> MM -> BAR-user VMM.
+        let mut mm = mm.lock();
+        let gfid = instances.allocate_instance(dev, cmdq, bar_user, &mut mm, self, info)?;
+
+        activate_registered_instance(
+            &mut instances,
+            dev,
+            cmdq,
+            bar,
+            bar_user,
+            &mut mm,
+            gfid,
+            self,
+        )
+    }
+    pub(super) fn close_instance(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &Mutex<GpuMm<'gpu>>,
+        gfid: Gfid,
+    ) -> Result {
+        let mut instances = self.instances().lock();
+        let mut mm = mm.lock();
+        instances.destroy_instance(dev, cmdq, bar_user, &mut mm, gfid)
+    }
+
+    pub(super) fn reset_instance(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar: Bar0<'_>,
+        bar_user: &BarUser<'gpu>,
+        mm: &Mutex<GpuMm<'gpu>>,
+        gfid: Gfid,
+    ) -> Result {
+        let mut instances = self.instances().lock();
+        let mut mm = mm.lock();
+        instances.reset_instance(dev, cmdq, bar, bar_user, &mut mm, gfid)
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/vgpu_api.rs b/drivers/gpu/nova-core/vgpu/vgpu_api.rs
new file mode 100644
index 000000000000..c60e31ba2623
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vgpu_api.rs
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Nova Core VF API and its C operations table.
+
+use core::num::NonZero;
+
+use kernel::{
+    bindings,
+    device,
+    interop::ffi::{
+        Abi,
+        Token, //
+    },
+    pci,
+    prelude::*,
+    sync::Mutex,
+    types::ForLt, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Gpu,
+    gsp::cmdq::Cmdq,
+    mm::{
+        bar_user::BarUser,
+        GpuMm, //
+    },
+    vgpu::instance::{
+        query_vgpu_type,
+        Gfid,
+        InstanceInfo,
+        VgpuType, //
+    },
+};
+
+use super::{
+    commands::{
+        query_assigned_vf_type,
+        Dbdf, //
+    },
+    VgpuManager, //
+};
+
+#[repr(transparent)]
+struct VgpuTypeInfo(kernel::bindings::nvidia_vgpu_type_info);
+
+impl VgpuTypeInfo {
+    fn from_vgpu_type(vgpu_type: &VgpuType) -> Self {
+        Self(kernel::bindings::nvidia_vgpu_type_info {
+            pci_dev_id: vgpu_type.pci_dev_id(),
+            pci_subsys_id: vgpu_type.pci_subsys_id(),
+            bar1_length: vgpu_type.bar1_length(),
+        })
+    }
+}
+
+/// PF-owned operations available while a VF driver is bound.
+pub(crate) struct NovaCoreVfApi<'gpu> {
+    pdev: &'gpu pci::Device<device::Bound>,
+    cmdq: &'gpu Cmdq<'gpu>,
+    bar: Bar0<'gpu>,
+    bar_user: &'gpu BarUser<'gpu>,
+    mm: &'gpu Mutex<GpuMm<'gpu>>,
+    vgpu: Option<&'gpu VgpuManager<'gpu>>,
+    total_vfs: Option<NonZero<u16>>,
+}
+
+impl<'gpu> NovaCoreVfApi<'gpu> {
+    pub(crate) fn new(gpu: &'gpu Gpu<'gpu>, pdev: &'gpu pci::Device<device::Bound>) -> Self {
+        Self {
+            pdev,
+            cmdq: gpu.cmdq(),
+            bar: gpu.bar0(),
+            bar_user: gpu.bar_user(),
+            mm: gpu.mm(),
+            vgpu: gpu.vgpu_manager(),
+            total_vfs: gpu.vgpu_total_vfs(),
+        }
+    }
+
+    pub(crate) fn is_available(&self) -> bool {
+        self.vgpu.is_some()
+    }
+
+    fn gfid(&self, gfid: u32) -> Result<Gfid> {
+        let total_vfs = self.total_vfs.ok_or(ENODEV)?;
+        if gfid == 0 || gfid > u32::from(total_vfs.get()) {
+            return Err(EINVAL);
+        }
+
+        Ok(Gfid(gfid))
+    }
+}
+
+impl NovaCoreVfApi<'_> {
+    fn open_instance(&self, gfid: u32, sbdf: u32, vm_pid: u32) -> Result<VgpuTypeInfo> {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+        let dbdf = Dbdf::from_raw(sbdf);
+
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} sbdf={:#x}\n",
+            gfid.0,
+            dbdf.into_raw()
+        );
+
+        let bar = self.bar;
+        let cmdq = self.cmdq;
+        let vgpu = self.vgpu.ok_or(ENODEV)?;
+
+        let type_id = query_assigned_vf_type(cmdq, dbdf)?;
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} assigned type_id={}\n",
+            gfid.0,
+            type_id
+        );
+
+        let vgpu_type = query_vgpu_type(cmdq, type_id)?;
+        dev_dbg!(
+            dev,
+            "vgpu_open: gfid={} vgpu_type={} fb_length={:#x}\n",
+            gfid.0,
+            vgpu_type.vgpu_type_id(),
+            vgpu_type.fb_length()
+        );
+
+        let type_info = VgpuTypeInfo::from_vgpu_type(&vgpu_type);
+        vgpu.create_instance(
+            dev,
+            cmdq,
+            bar,
+            self.bar_user,
+            self.mm,
+            InstanceInfo::new(gfid, dbdf, vgpu_type, vm_pid),
+        )?;
+
+        Ok(type_info)
+    }
+
+    fn close_instance(&self, gfid: u32) -> Result {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+
+        dev_dbg!(dev, "vgpu_close: gfid={}\n", gfid.0);
+
+        let cmdq = self.cmdq;
+        let result =
+            self.vgpu
+                .ok_or(ENODEV)?
+                .close_instance(dev, cmdq, self.bar_user, self.mm, gfid);
+        if let Err(error) = result {
+            dev_err!(dev, "vgpu_close: gfid={} failed: {:?}\n", gfid.0, error);
+        }
+        result
+    }
+
+    fn reset_instance(&self, gfid: u32) -> Result {
+        let dev = self.pdev.as_ref();
+        let gfid = self.gfid(gfid)?;
+
+        dev_dbg!(dev, "vgpu_reset: gfid={}\n", gfid.0);
+
+        let cmdq = self.cmdq;
+        self.vgpu.ok_or(ENODEV)?.reset_instance(
+            dev,
+            cmdq,
+            self.bar,
+            self.bar_user,
+            self.mm,
+            gfid,
+        )?;
+
+        dev_dbg!(dev, "vgpu_reset: gfid={} done\n", gfid.0);
+        Ok(())
+    }
+}
+
+#[kernel::macros::ffi_vtable(NVIDIA_VGPU_OPS: bindings::nvidia_vgpu_ops)]
+impl NovaCoreVfApi<'_> {
+    /// Create and activate an instance, writing its vGPU type information on success.
+    ///
+    /// # Safety
+    ///
+    /// If `type_info` is non-null, it must point to aligned, writable storage
+    /// with no concurrent access for the duration of this call.
+    unsafe fn open(
+        self: Pin<&Self>,
+        gfid: core::ffi::c_uint,
+        sbdf: core::ffi::c_uint,
+        vm_pid: core::ffi::c_uint,
+        type_info: *mut bindings::nvidia_vgpu_type_info,
+    ) -> Result {
+        if type_info.is_null() {
+            return Err(EINVAL);
+        }
+
+        let info = self.open_instance(gfid, sbdf, vm_pid)?;
+        // SAFETY: `type_info` is non-null and the caller guarantees aligned,
+        // writable storage with no concurrent access.
+        unsafe { type_info.write(info.0) };
+        Ok(())
+    }
+
+    /// Tear down an instance, retaining resources if firmware cleanup fails.
+    fn close(self: Pin<&Self>, gfid: core::ffi::c_uint) {
+        let _ = self.close_instance(gfid);
+    }
+
+    /// Reset an instance and scrub its guest VRAM.
+    fn reset(self: Pin<&Self>, gfid: core::ffi::c_uint) -> Result {
+        self.reset_instance(gfid)
+    }
+}
+
+/// C ABI published for VF lifecycle calls.
+pub(crate) struct NovaCoreVfAbi;
+
+// SAFETY: The C header defines the operations layout and ABI identity. The
+// macro initializes that complete operations table, and every trampoline
+// borrows the pinned `NovaCoreVfApi` published by `new_ffi`.
+unsafe impl Abi for NovaCoreVfAbi {
+    type Context = ForLt!(NovaCoreVfApi<'_>);
+    type RawOps = bindings::nvidia_vgpu_ops;
+
+    const OPS: &'static Self::RawOps = &NVIDIA_VGPU_OPS;
+    const TOKEN: Token = Token::new(
+        bindings::NVIDIA_VGPU_FFI_TOKEN_HIGH as u64,
+        bindings::NVIDIA_VGPU_FFI_TOKEN_LOW as u64,
+    );
+    const ABI_MAJOR: u16 = bindings::NVIDIA_VGPU_FFI_ABI_MAJOR as u16;
+    const ABI_MINOR: u16 = bindings::NVIDIA_VGPU_FFI_ABI_MINOR as u16;
+}
diff --git a/include/drm/nvidia_vgpu.h b/include/drm/nvidia_vgpu.h
new file mode 100644
index 000000000000..4a1579a9044d
--- /dev/null
+++ b/include/drm/nvidia_vgpu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+#ifndef __DRM_NVIDIA_VGPU_H__
+#define __DRM_NVIDIA_VGPU_H__
+
+#include <linux/rust_ffi.h>
+
+#define NVIDIA_VGPU_FFI_TOKEN_HIGH	0xa70c87381a844092ULL
+#define NVIDIA_VGPU_FFI_TOKEN_LOW		0xaeedbe595835927cULL
+#define NVIDIA_VGPU_FFI_ABI_MAJOR		1U
+#define NVIDIA_VGPU_FFI_ABI_MINOR		0U
+
+/**
+ * struct nvidia_vgpu_type_info - vGPU type descriptor returned by open
+ * @pci_dev_id: PCI device ID to present to the guest
+ * @pci_subsys_id: PCI subsystem ID to present to the guest
+ * @bar1_length: BAR1 aperture size in MiB
+ */
+struct nvidia_vgpu_type_info {
+	u32 pci_dev_id;
+	u32 pci_subsys_id;
+	u64 bar1_length;
+};
+
+/**
+ * struct nvidia_vgpu_ops - PF operations for NVIDIA vGPU virtual functions
+ * @open: Create and activate an instance, returning its vGPU type information on success
+ * @close: Tear down an instance, retaining resources if firmware cleanup fails
+ * @reset: Reset an instance and scrub its guest VRAM
+ *
+ * Each operation receives the context from the borrowed struct rust_ffi and
+ * a Guest Function ID (VF index + 1). The context remains valid until the VF
+ * driver is fully unbound, including its remove callback. The VF driver must
+ * drain all calls before returning from remove or a failed probe.
+ *
+ * All operations may sleep. They must not acquire the PF device lock because
+ * disabling SR-IOV removes VFs synchronously while holding that lock.
+ *
+ * @open receives the VF address encoded as (segment << 16) | (bus << 8) | devfn
+ * and the VM process's thread-group ID. Its type_info argument must point to
+ * writable storage with no concurrent access. @open and @reset return zero
+ * on success or a negative errno.
+ */
+struct nvidia_vgpu_ops {
+	int (*open)(const void *context, unsigned int gfid, unsigned int sbdf,
+		    unsigned int vm_pid, struct nvidia_vgpu_type_info *type_info);
+	void (*close)(const void *context, unsigned int gfid);
+	int (*reset)(const void *context, unsigned int gfid);
+};
+
+#endif /* __DRM_NVIDIA_VGPU_H__ */
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2467305c4842..1cf79bec756a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -37,6 +37,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <drm/nvidia_vgpu.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
