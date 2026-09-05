Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA244AB62
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596013; cv=fail; b=HTml7lJeNNsGrJ8qjoubofLiWDAH4Ekucsilkhz7e+xERnas378GykpM1pJkMWzDh+FNac88vPRapwGTMZVWMAO5O/Wy6PRZ0mV9CshPNWEdWXTqpG6oHUZAsFY/Z8rtcqETN3aP01dS6JwXXTUofo6OoX0zU3LrhhW9I2ILj5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596013; c=relaxed/simple;
	bh=WjhtAjzUYG2KyygxwPvALZIJwIGosDffct+wLAgPY9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGbZz/DD64+/qG3NNrc0Z6+UVJNQYf35fXX/NUQ4wGMLhFmBxp5JRdmq9fnLnLZconDF2Vf/1oGFjHF7tJsz4UU80NfuZ2KLTcWF7VxnhTx10UoI7mna1t5wL1lLXNzYqmgPhJEiqb/Qvx9aczIkpdF82qmfskbjfQCvlgcOiwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QQT50Dm6; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QQT50Dm6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx6yCXIz4gVqTnqpGGrEuY5OflIRjJvIqNCq0+2CFYYB2W5anjATeGtPWX42KiBeO1qQEmDWV0Sy4YdG+jm1qtrcv0074lL/PvYinJ/c2zqTmZ20p0ESno2Ub07EjBK85HY7QYW7EBbVcl1tWXcvAw7Mt8MGHk1J6yXzSf+cl9e0DZVyEcKVKEpQv+rPhFwKqiwSBqiFu5ykANVMoGOitLjB/fBvgQAN3dnwjqE3gXHn2/KLAUh88AbLlvJfBa7lTQFxauboXkpNuuhB/DMB8EntrwcCvG/gHrP0LXlrb+RhZTW5/ZJgZVCAua2R1axPoQwnYsKUH+Y8+2ROZOqFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RgnUeffuONX4IJCeoMdhbSiZpgIognEjAQCYcLs3JQ=;
 b=T0VnlKr5OXA+RlOQV2mq8FgOVxFs+ITSDvCjUCQpiV/XydKPZzUgA3VQFoX99rqUatlrm1g72g1FAIC68u7jag2jagegsbnoiBlPk+Iuxgy8I83wU63u0jRseNNFMHBaJkUMwUbKB29MXq2F+SVK64hLuvtPxa1mLbNaY8rfzilEk7eCUnkhDoNKXJFOGu4MTCDxdEdmts1G9HPOOIdssAgJel1FCjdAZbyF0wV3vkeic/HU/fYwFenquiDqoyhFPsk85ni5Qfddrl9HctFfJHkadiu/KooTOfUGOV+xDZWfExOosPk+Aw+ZEYduOE3lO81IvdHU9R762/xgB+xK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RgnUeffuONX4IJCeoMdhbSiZpgIognEjAQCYcLs3JQ=;
 b=QQT50Dm6BCJmHiG6nzaGrYNn/74IeAEDvf+1dodGiHvci9RFTmJbkbnHaUf7qWygY6JKdf/J8vgvu+v+Epqi5OAzV2IBuvHyinfFGGc25Bmsr5sytsl2pRcG5f3dm/tQ0Pc63QPN4mfYfNf4ScYlt3bq+Ns0Xxct18Ci+zM6yiIvCv4XYccaCgw9zO5ZeF4llrz35C2+txr26EeBQR5i+jNnWH4Faekw+kjLnteKuaouXD9qquHYXD1ZbtKV3bcpfZ3LBN8bGF8WTMCqCfDP/2tI4JUWSPlWtwfEZc1KhvGlo7Dl4b2umKw5Kw5YxdNW0tZzT/92k2gBpY8w7Af8lQ==
Received: from MN0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:52c::7)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 08:13:10 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::ae) by MN0PR05CA0013.outlook.office365.com
 (2603:10b6:208:52c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Sat, 5
 Sep 2026 08:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:13:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:54 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:54 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:46 -0700
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
Subject: [PATCH 10/13] gpu: nova-core: vgpu: export plugin log buffers via debugfs
Date: Sat, 5 Sep 2026 11:11:13 +0300
Message-ID: <20260905081116.106613-11-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: e453398e-6e4b-493a-8622-08df0b258649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|23010399003|82310400026|22082099003|6133799003|7136999003|3023799007|10067099003|56012099006|11063799006|18002099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	RAn7WYZ/Eus+nxhTqUwEXDWyETkYFj565l2j1yau+WpuOwyFAH5g5oUR7fXSkjAfrQR7m8vTCnIASmjxpZZADqhR/LDKOT/gOaFImH6hgJjspXKvkJx6IcmSK5g3i8j2pcgavDqHrp8u5udWlT1N7GuRz4b2aykBH8M2eHq6VSY/+H3Q3FmE7sx7UxS/rMjTfPMBFgUxyPJPShUcD+ECKI14DKECwRCc64Dq3ORdY1n7cggYVg7HKi7S3uH9ksSKlFhjArZFvKA6oaNVzsgQIVdedJM/uAPY36QZCUcOPW5yvg8qzUD3occsLIT1VjRcUjyebdEJ8hc0kNK5tpnB0phVlwlxKw00vQI/J7dC047JSOeD8iGMG6VMTONett+mpiou1ZMsLr+nzWU8ZRGFrwfLyQuScGJLCD9gT5tXVzvwY6HGUK7KnaQt0gdM4IBfyBXjalsA2dj0xIOkLUhSafSJ93/gwigUKlgjcWVPRoP8RPl1Osv80cpi9BVcxSTPzeBqISxLS9k0e5dNdYcAMYnCjCj6YXLU1lqmOea3bpqTkWKtInfSBrTqfYcwknZEHMv+hkJDspyPl+yRh7ASur5mIQK4mnAPGozp9zb2eFcfU2z4OVu0sfsqyuCFL60BeDWD+tUVKTjj0bIziIPBzVvUYmWh1Y8BG8Swgf09IEHzE+y6KHdMNqpXCYb2zx0t4TKhmejKT6GuGBjXwrEEGg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(22082099003)(6133799003)(7136999003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sf8nUrLGiGZ0epgy+cp6/9zCkponQdIcH9vMQHGmbQNKOW7c5h4o4f6Cxc8V1IwEZSyxLNqUTkALXEy0WDiwUZYvRT4f1MhywAL8Fzs0jz4Chqsm7c/aVULyZK+OGOCK8zfsDXkG1ASOb/A1dZLUeGToIUcSP7Gtv1hGBePS3O2qTYW0lDPyLSUEEd1UG7gH+ZnIZzHOGr807Fp2mISSPR0tf2I/0X2FsPnqsybz6p9xpkl/6kOYRtZG8yiHLfAFS1DHO/4hWxGEyuLmV8MpL+OgbYghuzGTd0AHcbtoIXSYaCUGLhL7935Gbk2FBfYQESWuDnzWVWtwn19mLcfTpZ7DY769BTubtTvRCn/sH0s5iIFEX0cCvE4G3eZQ/4FiDFkjAhzuyxvsDgdNX9XuI9s9sR2/0aMV8SKgEVUS/thgOKNBzolg9Py/TyKRSFeo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:13:10.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e453398e-6e4b-493a-8622-08df0b258649
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506

Expose the three per-VM GSP plugin log buffers (init, vgpu, kernel)
through debugfs so that nvlog_decoder can decode them at runtime.

Each log file is backed by VRAM in the management heap and read via
BAR1 MMIO.  A self-describing header (architecture + build ID) is
prepended so decoding tools need no out-of-band metadata.

Make gpu.spec and gpu.build_id accessible to instance creation, and
promote LOG_BUFFER_HEADER_SIZE / build_log_buffer_header to pub(crate)
for reuse by the vGPU log module.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs          |  42 ++++--
 drivers/gpu/nova-core/gpu.rs             |  10 +-
 drivers/gpu/nova-core/gsp.rs             |  16 ++-
 drivers/gpu/nova-core/mm/bar_user.rs     |  61 ++++++---
 drivers/gpu/nova-core/vgpu/fw.rs         | 117 +++++++++++++++-
 drivers/gpu/nova-core/vgpu/instance.rs   |  79 ++++++++++-
 drivers/gpu/nova-core/vgpu/log.rs        | 167 +++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/mod.rs        |   1 +
 drivers/gpu/nova-core/vgpu/plugin_rpc.rs |   6 +
 9 files changed, 458 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/log.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index c4b9ac03d3a1..4648f4a2e089 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -6,6 +6,7 @@
         Bound,
         Core, //
     },
+    devres::Devres,
     io::resource,
     pci,
     pci::{
@@ -15,9 +16,12 @@
     },
     prelude::*,
     sizes::SZ_16M,
-    sync::atomic::{
-        Atomic,
-        Relaxed, //
+    sync::{
+        atomic::{
+            Atomic,
+            Relaxed, //
+        },
+        Arc, //
     },
     types::ForLt,
 };
@@ -35,18 +39,28 @@
 
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
+    /// Auxiliary DRM-device registration.
+    ///
+    /// Declared first so consumers are unregistered before the interrupt and GPU resources are
+    /// torn down.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, ForLt!(())>,
     /// GSP event interrupt registration.
     ///
-    /// Declared first so it is dropped first: `free_irq` runs (waiting out any in-flight handler)
-    /// before the GSP is unloaded (`gpu`) or the BAR mapping is released (`bar`).
+    /// Declared before the GPU and BAR resources so `free_irq` runs (waiting out any in-flight
+    /// handler) before the GSP is unloaded (`gpu`) or the BAR mapping is released (`bar`).
     #[pin]
     _gsp_irq: GspIrq<'bound>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    bar1: Bar1<'bound>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(())>,
+    /// Device-managed BAR1 mapping shared with debugfs readers.
+    ///
+    /// Debugfs file backing types must be `'static`, so readers cannot retain
+    /// the lifetime-bound [`Bar1`] reference used before log export was added.
+    /// [`Devres`] revokes access during unbind, while [`Arc`] keeps the handle
+    /// alive until all scoped readers have drained.
+    bar1: Arc<Devres<Bar1<'static>>>,
     /// Self-referential borrow of `vectors`, so this does not have to be repeated in the
     /// constructor. Will go away with self-referential pin-init.
     vectors_ref: &'bound SubtreeVectors<'bound>,
@@ -129,17 +143,17 @@ fn probe<'bound>(
                 // is dropped after all fields that use `vectors_ref` (struct field drop order).
                 vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref().get_ref()) },
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
-                bar1: {
-                    let bar1_idx = bar1_resource_index(pdev)?;
-                    pdev.iomap_region(bar1_idx, c"nova-core/bar1")?
-                },
+                bar1: Arc::new(
+                    pdev.iomap_region(bar1_resource_index(pdev)?, c"nova-core/bar1")?
+                        .into_devres()?,
+                    GFP_KERNEL,
+                )?,
                 // TODO: Use self-referential pin-init syntax once available.
                 gpu <- Gpu::new(
                     pdev,
                     // SAFETY: `bar` is initialized above, pinned, and outlives `gpu`.
                     unsafe { &*core::ptr::from_ref(bar) },
-                    // SAFETY: `bar1` is initialized above, pinned, and outlives `gpu`.
-                    unsafe { &*core::ptr::from_ref(bar1) },
+                    bar1.clone(),
                     vectors_ref,
                 ),
                 // Quiesce the interrupt tree before registering the handler below.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5c12847c19bc..f88be4ca6ea5 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     device,
+    devres::Devres,
     dma::Device,
     fmt,
     gpu::buddy::GpuBuddyParams,
@@ -31,6 +32,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    firmware,
     fsp::Fsp,
     gsp::{
         self,
@@ -374,10 +376,16 @@ pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
         self.gsp_resources.gsp.cmdq()
     }
 
+    /// Returns the firmware build identifier, if one was reported.
+    #[expect(dead_code)]
+    pub(crate) fn build_id(&self) -> Option<firmware::BuildId> {
+        self.gsp_resources.gsp.build_id()
+    }
+
     pub(crate) fn new(
         pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: Bar0<'gpu>,
-        bar1: &'gpu Bar1<'gpu>,
+        bar1: Arc<Devres<Bar1<'static>>>,
         vectors: &'gpu SubtreeVectors<'gpu>,
     ) -> impl PinInit<Self, Error> + 'gpu {
         let dev = pdev.as_ref();
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 2521d7331996..210bf8de0633 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -116,7 +116,10 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// This header makes each dump self-describing so that decoding tools can
 /// identify the firmware build, GPU architecture, and metadata format without
 /// out-of-band information.
-const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
+///
+/// `0x48` is the offset of `data` in `LIBOS_LOG_NVLOG_BUFFER_V2`, as defined
+/// by Open RM's `uproc/os/common/include/liblogdecode.h`.
+pub(crate) const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
 
 /// Build a log buffer header from GPU and firmware metadata.
 ///
@@ -130,7 +133,7 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 ///   0x20  buildId[32]
 ///   0x40  flags (u32) = 1 (packed metadata)
 ///   0x44  reserved (u32) = 0
-fn build_log_buffer_header(
+pub(crate) fn build_log_buffer_header(
     chipset: Chipset,
     build_id: &BuildId,
     task_prefix: &str,
@@ -411,6 +414,15 @@ pub(crate) const fn vgpu_state(&self) -> VgpuState {
     pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
         self.cmdq.clone()
     }
+
+    /// Returns the firmware build identifier, if one was reported.
+    pub(crate) fn build_id(&self) -> Option<BuildId> {
+        Tlv::new(self.gsp_tlv.data())
+            .ok()?
+            .get_bytes(b"BLID")
+            .ok()
+            .and_then(BuildId::from_raw)
+    }
 }
 
 /// Opaque bundle required to unload the GSP. Created by [`Gsp::boot`], consumed by [`Gsp::unload`].
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 158160fbf352..e7db8c5f1232 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -3,11 +3,17 @@
 //! BAR1 user interface for CPU access to GPU virtual memory. Used for USERD
 //! for GPU work submission, and applications to access GPU buffers via mmap().
 
+use core::marker::PhantomData;
+
 use kernel::{
+    devres::Devres,
     io::Io,
     new_mutex,
     prelude::*,
-    sync::Mutex, //
+    sync::{
+        Arc,
+        Mutex, //
+    },
 };
 
 use crate::{
@@ -39,7 +45,8 @@
 pub(crate) struct BarUser<'gpu> {
     #[pin]
     vmm: Mutex<Vmm>,
-    bar1: &'gpu Bar1<'gpu>,
+    bar1: Arc<Devres<Bar1<'static>>>,
+    _gpu: PhantomData<&'gpu ()>,
 }
 
 impl<'gpu> BarUser<'gpu> {
@@ -48,12 +55,13 @@ pub(crate) fn new(
         pdb_addr: VramAddress,
         chipset: Chipset,
         va_size: u64,
-        bar1: &'gpu Bar1<'gpu>,
+        bar1: Arc<Devres<Bar1<'static>>>,
     ) -> Result<impl PinInit<Self> + 'gpu> {
         let vmm = Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?;
         Ok(pin_init!(Self {
             vmm <- new_mutex!(vmm, "bar_user_vmm"),
             bar1,
+            _gpu: PhantomData,
         }))
     }
 
@@ -138,31 +146,36 @@ fn bar_offset(&self, offset: usize) -> Result<usize> {
     /// Read a 32-bit value at the given offset.
     pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
         let off = self.bar_offset(offset)?;
-        self.bar_user.bar1.try_read32(off)
+        let bar1 = self.bar_user.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_read32(off)
     }
 
     /// Write an 8-bit value at the given offset.
     pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
-        self.bar_user.bar1.try_write8(value, off)
+        let bar1 = self.bar_user.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write8(value, off)
     }
 
     /// Write a 32-bit value at the given offset.
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
-        self.bar_user.bar1.try_write32(value, off)
+        let bar1 = self.bar_user.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write32(value, off)
     }
 
     /// Read a 64-bit value at the given offset.
     pub(crate) fn try_read64(&self, offset: usize) -> Result<u64> {
         let off = self.bar_offset(offset)?;
-        self.bar_user.bar1.try_read64(off)
+        let bar1 = self.bar_user.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_read64(off)
     }
 
     /// Write a 64-bit value at the given offset.
     pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
-        self.bar_user.bar1.try_write64(value, off)
+        let bar1 = self.bar_user.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write64(value, off)
     }
 }
 
@@ -184,11 +197,12 @@ fn drop(&mut self) {
 /// logical region may begin or end within a page; the containing pages are mapped while CPU
 /// access remains bounded to the requested byte range.
 pub(crate) struct Bar1Map<'gpu> {
-    bar1: &'gpu Bar1<'gpu>,
+    bar1: Arc<Devres<Bar1<'static>>>,
     mapped: MappedRange,
     region: VramRegion,
     page_bias: usize,
     logical_size: usize,
+    _gpu: PhantomData<&'gpu ()>,
 }
 
 impl<'gpu> Bar1Map<'gpu> {
@@ -227,14 +241,20 @@ pub(crate) fn new(
         let mapped = vmm.map_pages(mm, &pfns, None, writable)?;
 
         Ok(Self {
-            bar1: bar_user.bar1,
+            bar1: bar_user.bar1.clone(),
             mapped,
             region,
             page_bias,
             logical_size,
+            _gpu: PhantomData,
         })
     }
 
+    /// Clone the revocable BAR1 mapping used by debugfs readers.
+    pub(crate) fn bar1_arc(&self) -> &Arc<Devres<Bar1<'static>>> {
+        &self.bar1
+    }
+
     /// Returns the mapped physical VRAM region.
     pub(crate) fn region(&self) -> &VramRegion {
         &self.region
@@ -272,23 +292,23 @@ fn bar_offset(&self, offset: usize, width: usize) -> Result<usize> {
     // BAR1 and the logical mapping have runtime sizes, so these accessors
     // validate the offset, width, and alignment before performing MMIO.
     pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
-        self.bar1
-            .try_read32(self.bar_offset(offset, size_of::<u32>())?)
+        let bar1 = self.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_read32(self.bar_offset(offset, size_of::<u32>())?)
     }
 
     pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
-        self.bar1
-            .try_write8(value, self.bar_offset(offset, size_of::<u8>())?)
+        let bar1 = self.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write8(value, self.bar_offset(offset, size_of::<u8>())?)
     }
 
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
-        self.bar1
-            .try_write32(value, self.bar_offset(offset, size_of::<u32>())?)
+        let bar1 = self.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write32(value, self.bar_offset(offset, size_of::<u32>())?)
     }
 
     pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
-        self.bar1
-            .try_write64(value, self.bar_offset(offset, size_of::<u64>())?)
+        let bar1 = self.bar1.try_access().ok_or(ENXIO)?;
+        bar1.try_write64(value, self.bar_offset(offset, size_of::<u64>())?)
     }
 
     /// Invalidates the PTEs and releases the BAR1 virtual address.
@@ -331,7 +351,10 @@ pub(crate) fn run_self_test(
     const PATTERN_PRAMIN: u32 = 0xDEAD_BEEF;
     const PATTERN_BAR1: u32 = 0xCAFE_BABE;
 
-    let bar1 = bar_user.bar1;
+    // A matching bound device proves that devres cannot be revoked while this
+    // self-test runs, so this reference may safely span allocations and other
+    // potentially sleeping operations below.
+    let bar1 = bar_user.bar1.access(dev)?;
     dev_info!(dev, "MM: Starting self-test...\n");
 
     let pdb_addr = VramAddress::from_raw(bar1_pdb);
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index db6f535998a9..af7e86405b9e 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -8,9 +8,15 @@
     RpcResponse, //
 };
 
-use kernel::prelude::*;
+use kernel::{
+    devres::Devres,
+    io::Io,
+    prelude::*,
+    sync::Arc, //
+};
 
 use crate::{
+    driver::Bar1,
     gsp::vgpu_bindings as bindings,
     mm::{
         bar_user::{
@@ -57,6 +63,104 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
     Ok(subregion)
 }
 
+/// Revocable BAR1 view of one vGPU plugin log buffer.
+pub(crate) struct MappedPluginLogBuffer {
+    bar1: Arc<Devres<Bar1<'static>>>,
+    gpu_va_addr: usize,
+    size: usize,
+}
+
+impl MappedPluginLogBuffer {
+    fn new(map: &Bar1Map<'_>, region: &VramRegion) -> Result<Self> {
+        let start = region
+            .address()
+            .checked_sub(map.region().address())
+            .ok_or(EINVAL)
+            .and_then(|start| usize::try_from(start).map_err(|_| EOVERFLOW))?;
+        let size = usize::try_from(region.size()).map_err(|_| EOVERFLOW)?;
+        let end = start.checked_add(size).ok_or(EOVERFLOW)?;
+        if end > map.size() || !start.is_multiple_of(4) || !size.is_multiple_of(4) {
+            return Err(EINVAL);
+        }
+
+        let gpu_va_addr = usize::try_from(map.gpu_va_addr()?)
+            .map_err(|_| EOVERFLOW)?
+            .checked_add(start)
+            .ok_or(EOVERFLOW)?;
+        if !gpu_va_addr.is_multiple_of(4) {
+            return Err(EINVAL);
+        }
+
+        let bar1 = map.bar1_arc().clone();
+        {
+            let mapped_bar1 = bar1.try_access().ok_or(ENXIO)?;
+            if gpu_va_addr.checked_add(size).ok_or(EOVERFLOW)? > mapped_bar1.size() {
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            bar1,
+            gpu_va_addr,
+            size,
+        })
+    }
+
+    /// Return the log buffer size in bytes.
+    pub(crate) const fn size(&self) -> usize {
+        self.size
+    }
+
+    /// Stage a range of log bytes in a kernel buffer.
+    pub(crate) fn read(&self, offset: usize, output: &mut [u8]) -> Result {
+        let end = offset.checked_add(output.len()).ok_or(EOVERFLOW)?;
+        if end > self.size {
+            return Err(EINVAL);
+        }
+
+        let bar1 = self.bar1.try_access().ok_or(ENXIO)?;
+        let mut source = offset;
+        let mut copied = 0usize;
+
+        while copied < output.len() {
+            let aligned_source = source & !3;
+            let within = source & 3;
+            let bar_offset = self
+                .gpu_va_addr
+                .checked_add(aligned_source)
+                .ok_or(EOVERFLOW)?;
+            let bytes = bar1.try_read32(bar_offset)?.to_le_bytes();
+            let chunk = (4 - within).min(output.len() - copied);
+
+            output[copied..copied + chunk].copy_from_slice(&bytes[within..within + chunk]);
+            source = source.checked_add(chunk).ok_or(EOVERFLOW)?;
+            copied += chunk;
+        }
+
+        Ok(())
+    }
+}
+
+/// Revocable BAR1 views of all vGPU plugin log buffers.
+pub(crate) struct MappedPluginLogBuffers {
+    init: MappedPluginLogBuffer,
+    vgpu: MappedPluginLogBuffer,
+    kernel: MappedPluginLogBuffer,
+}
+
+impl MappedPluginLogBuffers {
+    /// Split the aggregate into its three task log views.
+    pub(crate) fn into_parts(
+        self,
+    ) -> (
+        MappedPluginLogBuffer,
+        MappedPluginLogBuffer,
+        MappedPluginLogBuffer,
+    ) {
+        (self.init, self.vgpu, self.kernel)
+    }
+}
+
 /// BAR1 mapping and semantic regions of a vGPU CPU-GSP communication buffer.
 ///
 /// The host and GSP plugin exchange control, response, message, migration,
@@ -214,6 +318,17 @@ pub(crate) fn plugin_logs(&self) -> Result<PluginLogRegions> {
         })
     }
 
+    /// Return revocable BAR1 views of the three plugin logs.
+    pub(crate) fn mapped_plugin_logs(&self) -> Result<MappedPluginLogBuffers> {
+        let logs = self.plugin_logs()?;
+
+        Ok(MappedPluginLogBuffers {
+            init: MappedPluginLogBuffer::new(&self.map, logs.init())?,
+            vgpu: MappedPluginLogBuffer::new(&self.map, logs.vgpu())?,
+            kernel: MappedPluginLogBuffer::new(&self.map, logs.kernel())?,
+        })
+    }
+
     /// Return whether firmware has published the plugin boot marker.
     pub(crate) fn is_plugin_ready(&self) -> Result<bool> {
         let value = self.read_u32(
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index d6938cc65bf9..ed715951e92d 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -4,15 +4,21 @@
 use core::num::NonZeroUsize;
 
 use kernel::{
+    debugfs,
     device,
     prelude::*,
     ptr::Alignment,
-    sizes::SizeConstants, //
+    sizes::SizeConstants,
+    str::CString, //
 };
 
 use crate::{
     driver::Bar0,
-    gpu::ChannelIdReservation,
+    firmware::BuildId,
+    gpu::{
+        ChannelIdReservation,
+        Chipset, //
+    },
     gsp::{
         cmdq::Cmdq,
         commands::{
@@ -33,7 +39,11 @@
             shutdown, //
         },
         consts::gmc,
-        fw::CommBufferRegion,
+        fw::{
+            CommBufferRegion,
+            MappedPluginLogBuffers, //
+        },
+        log::VgpuLogBuffers,
         plugin_rpc::{
             PluginConfigParams,
             PluginRpc, //
@@ -112,7 +122,11 @@ fn from_properties(properties: &VgpuProperties) -> Self {
     }
 }
 
-/// A vGPU instance and the resources reserved for it.
+/// A live vGPU instance with allocated resources.
+///
+/// Field ordering is load-bearing for drop: `debugfs_logs` must be declared
+/// before `plugin_rpc` so that debugfs entries are removed (and in-progress
+/// readers drained) before the underlying `Bar1Map` is destroyed.
 #[expect(dead_code)]
 pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) gfid: Gfid,
@@ -123,6 +137,7 @@ pub(crate) struct VgpuInstance<'gpu> {
     pub(crate) num_plugin_channels: u32,
     ceutils: CeUtils,
     pub(crate) vram_slot: VgpuVramSlot,
+    debugfs_logs: Option<Pin<KBox<debugfs::Scope<VgpuLogBuffers>>>>,
     pub(crate) plugin_rpc: PluginRpc<'gpu>,
 }
 
@@ -144,10 +159,14 @@ fn unmap_and_take_slot(
         mm: &mut GpuMm<'_>,
     ) -> Result<VgpuVramSlot> {
         let Self {
+            debugfs_logs,
             plugin_rpc,
             vram_slot,
             ..
         } = self;
+        // Remove the files and drain active readers before tearing down the
+        // BAR1 mapping that backs them.
+        drop(debugfs_logs);
         plugin_rpc.destroy(bar_user, mm)?;
         Ok(vram_slot)
     }
@@ -214,6 +233,39 @@ pub(crate) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32
     }
 }
 
+fn create_debugfs_logs(
+    buffers: MappedPluginLogBuffers,
+    dbdf: Dbdf,
+    chipset: Chipset,
+    build_id: Option<&BuildId>,
+) -> Result<Pin<KBox<debugfs::Scope<VgpuLogBuffers>>>> {
+    let logs = VgpuLogBuffers::new(buffers, chipset, build_id)?;
+    let raw_dbdf = dbdf.into_raw();
+    let domain = raw_dbdf >> 16;
+    let bus = (raw_dbdf >> 8) & 0xff;
+    let device = (raw_dbdf >> 3) & 0x1f;
+    let function = raw_dbdf & 0x07;
+    let directory = CString::try_from_fmt(fmt!(
+        "{:04x}:{:02x}:{:02x}.{:x}-vgpu",
+        domain,
+        bus,
+        device,
+        function,
+    ))?;
+
+    #[allow(static_mut_refs)]
+    // SAFETY: The root is initialized before driver registration and cleared
+    // only after driver unregistration has drained all users.
+    let root = unsafe { crate::DEBUGFS_ROOT.as_ref() }.ok_or(ENODEV)?;
+
+    KBox::pin_init(
+        root.scope(logs, &directory, |logs, directory| {
+            VgpuLogBuffers::register_debugfs(logs, directory);
+        }),
+        GFP_KERNEL,
+    )
+}
+
 /// Registry of live vGPU instances.
 pub(crate) struct VgpuInstances<'gpu> {
     /// Declared before `vram_slots` so instance regions are dropped before their backing pool.
@@ -390,6 +442,7 @@ pub(crate) fn allocate_instance(
             num_plugin_channels: 3,
             ceutils,
             vram_slot,
+            debugfs_logs: None,
             plugin_rpc: PluginRpc::new(comm),
         };
         match self.instances.push_within_capacity(instance) {
@@ -485,6 +538,8 @@ pub(crate) fn activate_instance(
     bar: Bar0<'_>,
     instance: &mut VgpuInstance<'_>,
     fifo_engine_list: &FifoEngineList,
+    chipset: Chipset,
+    build_id: Option<&BuildId>,
 ) -> Result {
     bootload(dev, cmdq, bar, instance, fifo_engine_list)?;
 
@@ -503,5 +558,21 @@ pub(crate) fn activate_instance(
     rpc.send_config_params(dev, bar, gfid, &params)?;
     rpc.set_bme(dev, bar, gfid, true)?;
 
+    // Publish the log files only after the plugin has initialized its
+    // management heap. Debugfs is diagnostic, so failure must not undo an
+    // otherwise usable vGPU instance.
+    match rpc
+        .mapped_plugin_logs()
+        .and_then(|buffers| create_debugfs_logs(buffers, instance.dbdf, chipset, build_id))
+    {
+        Ok(logs) => instance.debugfs_logs = Some(logs),
+        Err(error) => dev_warn!(
+            dev,
+            "debugfs logs unavailable for gfid={}: {:?}\n",
+            gfid.0,
+            error,
+        ),
+    }
+
     Ok(())
 }
diff --git a/drivers/gpu/nova-core/vgpu/log.rs b/drivers/gpu/nova-core/vgpu/log.rs
new file mode 100644
index 000000000000..6da92b0fd789
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/log.rs
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::{
+    debugfs,
+    fs::file,
+    prelude::*,
+    uaccess::UserSliceWriter, //
+};
+
+use crate::{
+    firmware::BuildId,
+    gpu::Chipset,
+    gsp::{
+        build_log_buffer_header,
+        LOG_BUFFER_HEADER_SIZE, //
+    },
+    vgpu::fw::{
+        MappedPluginLogBuffer,
+        MappedPluginLogBuffers, //
+    },
+};
+
+const LOG_READ_CHUNK_SIZE: usize = 4096;
+
+/// A single vGPU plugin log buffer backed by VRAM, read via BAR1 MMIO.
+///
+/// The GSP plugin writes encoded log entries into the management heap in
+/// VRAM. The mapped buffer retains revocable access to those bytes without a
+/// device reference.
+///
+/// A [`LOG_BUFFER_HEADER_SIZE`]-byte header is prepended so that
+/// `nvlog_decoder` can identify the GPU architecture and firmware build.
+pub(crate) struct VgpuLogBuffer {
+    buffer: MappedPluginLogBuffer,
+    header: [u8; LOG_BUFFER_HEADER_SIZE],
+    header_len: usize,
+}
+
+impl VgpuLogBuffer {
+    fn new(
+        buffer: MappedPluginLogBuffer,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Result<Self> {
+        let (header, header_len) = match build_id {
+            Some(bid) => (
+                build_log_buffer_header(chipset, bid, task_prefix),
+                LOG_BUFFER_HEADER_SIZE,
+            ),
+            None => ([0u8; LOG_BUFFER_HEADER_SIZE], 0),
+        };
+
+        Ok(Self {
+            buffer,
+            header,
+            header_len,
+        })
+    }
+}
+
+impl debugfs::BinaryWriter for VgpuLogBuffer {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let total_len = self
+            .header_len
+            .checked_add(self.buffer.size())
+            .ok_or(EOVERFLOW)?;
+
+        if offset_val >= total_len {
+            return Ok(0);
+        }
+
+        let count = (total_len - offset_val).min(writer.len());
+        if count == 0 {
+            return Ok(0);
+        }
+
+        // Keep the staging buffer on the heap to avoid putting a page-sized
+        // object on the kernel stack.
+        let staging_size = count.min(LOG_READ_CHUNK_SIZE);
+        let mut staging = KVec::new();
+        staging.resize(staging_size, 0, GFP_KERNEL)?;
+
+        let mut written = 0usize;
+        while written < count {
+            let chunk_len = (count - written).min(staging.len());
+            let chunk = &mut staging[..chunk_len];
+            let chunk_offset = offset_val.checked_add(written).ok_or(EOVERFLOW)?;
+            let mut filled = 0usize;
+
+            if chunk_offset < self.header_len {
+                let header_len = (self.header_len - chunk_offset).min(chunk_len);
+                chunk[..header_len]
+                    .copy_from_slice(&self.header[chunk_offset..chunk_offset + header_len]);
+                filled = header_len;
+            }
+
+            if filled < chunk_len {
+                let log_offset = chunk_offset
+                    .checked_add(filled)
+                    .ok_or(EOVERFLOW)?
+                    .checked_sub(self.header_len)
+                    .ok_or(EINVAL)?;
+
+                // The mapped buffer drops its revocable access guard before
+                // the potentially sleeping userspace copy below.
+                self.buffer.read(log_offset, &mut chunk[filled..])?;
+            }
+
+            writer.write_slice(chunk)?;
+            written = written.checked_add(chunk_len).ok_or(EOVERFLOW)?;
+        }
+
+        *offset = (*offset)
+            .checked_add(i64::try_from(written).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)?;
+        Ok(written)
+    }
+}
+
+/// Aggregated log buffers for a single vGPU instance.
+///
+/// Each vGPU plugin produces three log streams within the management heap:
+/// - `init_log`: init task log (128 KB)
+/// - `vgpu_log`: vGPU task log (256 KB)
+/// - `kernel_log`: kernel task log (64 KB)
+pub(crate) struct VgpuLogBuffers {
+    init_log: VgpuLogBuffer,
+    vgpu_log: VgpuLogBuffer,
+    kernel_log: VgpuLogBuffer,
+}
+
+impl VgpuLogBuffers {
+    pub(crate) fn new(
+        buffers: MappedPluginLogBuffers,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+    ) -> Result<Self> {
+        let (init, vgpu, kernel) = buffers.into_parts();
+
+        Ok(Self {
+            init_log: VgpuLogBuffer::new(init, chipset, build_id, "INIT")?,
+            vgpu_log: VgpuLogBuffer::new(vgpu, chipset, build_id, "VGPU")?,
+            kernel_log: VgpuLogBuffer::new(kernel, chipset, build_id, "KERN")?,
+        })
+    }
+
+    /// Register debugfs binary files for these log buffers within a scoped directory.
+    pub(crate) fn register_debugfs<'data, 'dir>(
+        logs: &'data VgpuLogBuffers,
+        dir: &'dir debugfs::ScopedDir<'data, 'dir>,
+    ) {
+        dir.read_binary_file(c"init_log", &logs.init_log);
+        dir.read_binary_file(c"vgpu_log", &logs.vgpu_log);
+        dir.read_binary_file(c"kernel_log", &logs.kernel_log);
+    }
+}
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index 17e6d8d37af7..61f799c2748e 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -6,6 +6,7 @@
 pub(crate) mod bootload;
 pub(crate) mod consts;
 pub(crate) mod instance;
+pub(crate) mod log;
 pub(crate) mod plugin_rpc;
 pub(crate) mod scrubber;
 
diff --git a/drivers/gpu/nova-core/vgpu/plugin_rpc.rs b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
index f1fa6fe238fb..4b759ec0bf42 100644
--- a/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
+++ b/drivers/gpu/nova-core/vgpu/plugin_rpc.rs
@@ -27,6 +27,7 @@
     },
     vgpu::fw::{
         CommBufferRegion,
+        MappedPluginLogBuffers,
         PluginLogRegions,
         RpcMessage,
         RpcResponse, //
@@ -92,6 +93,11 @@ pub(crate) fn plugin_logs(&self) -> Result<PluginLogRegions> {
         self.comm.plugin_logs()
     }
 
+    /// Return revocable BAR1 views of the plugin logs.
+    pub(crate) fn mapped_plugin_logs(&self) -> Result<MappedPluginLogBuffers> {
+        self.comm.mapped_plugin_logs()
+    }
+
     /// Poll the control buffer until the plugin publishes its boot marker.
     pub(crate) fn wait_plugin_ready(&self, dev: &device::Device<device::Bound>) -> Result {
         let start = Instant::<Monotonic>::now();
-- 
2.53.0

