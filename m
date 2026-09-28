Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356440926C
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591623; cv=fail; b=NYN4IzTW5qTAjU6dHgRNnqjKN7xcx4UUlQg/hmCy0Aoqc+nAcf8Chb9VqobyGsb0HuLLRS2xWzCz4zmWMAQIgzglg6xPQHExbl1EpnV2kpeF1FQyiTEx/eeb2T78XySuHM2rvrW6fdLJ9JcI1GxqVyXuZsHSwoNnMzrELP7i0QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591623; c=relaxed/simple;
	bh=KMJplcLlsTfQKyv70X4ykq1f9+iaifzuo29OYtE/1nk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOl/7eMOVAGaPVyfLLfhETe+Td2PEs0cUtjKVGrjP3ta6Xh32YCMdeR6y4GZ48AbvwrNbgBJqirEyh+VF18TXgoZTJq7d9p6LFrxFgwGO5IK+QLdxnKAx2bAionNM23dJMpPRglmnxRpU/Athy+BX5vesZaJjqwur0wEoRBHZ6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GI5I5swg; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GI5I5swg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqZXb8mE5fXBWy9UHTWJsPFS4fyjj1AjANbA6kbb9C8GegEZD7vg9FEufmVr20n6L/5v4LzAG2s7JlJB2NtkJPkYdRXfYVFxd7GEQh5HaCmt16v0mFccYNpT+PHtqh27qbguTEVBti6/YEE6ZrAisanPdIdEhvVWK2oBNc+n6Rkk/JHBw0arN/liwWECJbkYQR/fYQTjRzgnVoQikEYZjHeOGbux4nSrRK7/t7RYbJNctZbD12ETOV3whh3DMXyde90kbrUY0/DqURhntGBDDBf7WZSgJCIdad8wNdAxlURAv6RjEcI3K6OIdct608Ex3axcUUTV4Xt82zvKRbDVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztfIajMVDZSlPIGoIHHsaYNyHAZmCaIdEv7X6OeyCBw=;
 b=wWeLiOWcPOS+gTUE8xZT3bp2vEIs2GuADqvFXb9D7MxOZGStmQA4wQr+6VOkXlvmNm3403o+hBydC0BoNsmuw2doDpZhF5POEiVez9N1sWeigV9sOn/nnUUKIVpUljllRGt1nLdv/N1zPog3TmJg3z6zevrnC+LwCJNuo1fcCj1ekGnwnvcfzPlhtqx65bRmX+RGfS/q/pzd0040m2JR9Wo2j89+j7I4Ozw9myc/ej2CL6SHN2HdiJTXiiMwEfQJFxxg38RbggJvdSqyde2ijazcbdfD5kam1NFEg2U8J1hMTn+uHyTKC3QUG4popEM8xUBSgNSXV65mHQzhKJHgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztfIajMVDZSlPIGoIHHsaYNyHAZmCaIdEv7X6OeyCBw=;
 b=GI5I5swgsXEhbqLmV9wj6l1UGoY3x2Tx0XiTeOt09oTWuCJbicm0DOMS3mYa/i/ue9Z8CJKoffHD/bWnPjoEwk22FiiGc1UGxxQVN4ZgGB5hOogNGV8auOhwhN6bGfkwgnem0Pw9i9zsj/G2J4G9pGxPJE9bNRjEwHSbEl8FRC/9d96QW/KHgAifffy37K9yZGAwNascvpUOEY9cvbPGNmg0PEc5kjQ6CgUy0PGRz1di28yNmo5fNyMPleJtuWUThswidAJP5vA0pFQqomXLBC5/6NV+e0FwghEKz0Pr5bbkPDtKdl2bQQzn3P1j6CGr3I7TSJTQIVutnAKuVBJScQ==
Received: from BN9PR03CA0244.namprd03.prod.outlook.com (2603:10b6:408:ff::9)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:33:30 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::8b) by BN9PR03CA0244.outlook.office365.com
 (2603:10b6:408:ff::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Mon,
 28 Sep 2026 10:33:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:33:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:33:09 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:33:08 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:33:00 -0700
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
Subject: [PATCH v3 30/31] gpu: nova-core: vgpu: export plugin log buffers via debugfs
Date: Mon, 28 Sep 2026 13:28:33 +0300
Message-ID: <3ab20bcbb797c27002273cf2cb5575c82b24d65e.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3283cffb-bcfd-4da1-b714-08df1d4bf050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|82310400026|376014|36860700016|3023799007|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	knYCzq5qLetTpycYcoqUNmr6un6QafCg+0RBQ2VYUZX6Cn8eQW1w0NyODzfKHBmuIaPC4VYbeR3LmmUtFa1ARsiP0JgkA9F6d94tegjr+0Udi1D8f9iYKmOtzq6Inj1H+dU234aanBeiBPGckJL583FZRjCaHwAoZXlsRmo6wlAOaTdQ07l8sYJJYWCXNQiHKZGdLoKOLAA4sZ/GclI1YYasmTN41Nj2RAQFtxQD7kQ89Bu5BIwSmAWCtx27nj432Pv+3EsReA1hzby9bBK5vf2sPYrQbzAVNb6c1OaMS0Wmd3wvI2rqVlH53BWlf6Ky2COTKFeaim1yYE8bdrAeHbMAaTyOG/ySIc5IoZQBAf4ewjUXxCEALw9e6ZK5tv0NyB+amflKYg6JK1D7xBbymFYPXDbf9LYWZDqjLAm8Yf1GQrV1wR5J2oSSOiJ6/nDqk/4Q4KmJFZyoo1vkulJydFvbAfQJTmVbydRSrRhjgcGTPFYAkhJoPhTpGSaXxQOM6IolOoZVCzijOIGUtyTmE9EXC+rkK9fHsouKdbkSYAYmwEkQJYQ/kThzy7ybW7Zc730Oo7pKg9cgD3cB3HxP1urShieWqU1+Xf81qRKU1mSGh2t1axsBlmOyVq1g9ILHKBELbvZ/4nk7q8D73fNvCoeZg8Hz74LLbNEYW8Yptr0rDTq15RX3Vt7RwqYXqbQ4Jloy/8YTDIzompDEUQ2Kog==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(82310400026)(376014)(36860700016)(3023799007)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZkwYgPT9dhQzJTPipiTbGgiBY1KemFkuQO6JZfRLdBAkky3zZBt4fVEnxrJOWKXFrFboL2JfDrKvbiolrvSSI4MmFdWsUTV9HDmQvc5QTKSviiHGWCf1/0CKJsUI1qQvVQvVdjFZ16zyhq87VDlIjtOJpQtI87qOdkbd+Y9pomaY/Fv34iIZQ2ReJWUIjFm5CgLtptDVcQk1FjoVdUCeD6KmHpNLkEFGpHWP4bOIgb2UpgJdsAXwnHcNCVnzF3acUqo9atk1QFGUg+Il1o3reEI3DQVpGTXfM/hKmMB/PXdt874eKeXLw6DUje0vwalAjzSHjZ9jdAU/ZrutLyZoZVCifB6gr3F+r2yMi0bHFc8dsir0e/vHafkRFmPtY4D1lZgzfCvR2Tto3kXBe1+bxixlQUEMoesueXmOAB9MXxK6Qc82IOPmDPQlmTUFYQoU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:33:29.9573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3283cffb-bcfd-4da1-b714-08df1d4bf050
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

Expose each instance's init, vgpu and kernel plugin logs through debugfs
for nvlog_decoder.

Read the management-heap log buffers through BAR1 and reuse the existing
GSP log header when a firmware build ID is available. Use the INIT, VGPU
and KRNL task names expected by the decoder, and derive the instance
directory name from the typed DBDF fields.
Retain the GPU identity and firmware build ID in the manager for
per-instance log headers.

Retain the mapping while the files are accessible and revoke the debugfs
scope before explicitly unmapping it. Place the scope before the RPC
mapping in the instance's field order so device removal also drains
readers before the mapping is dropped. Preserve partial-read accounting
when a user copy fails.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                  |   9 +-
 drivers/gpu/nova-core/gsp.rs                  |  23 +++
 drivers/gpu/nova-core/mm/bar_user.rs          |   5 +-
 drivers/gpu/nova-core/vgpu.rs                 |  11 +-
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 116 +++++++++++-
 drivers/gpu/nova-core/vgpu/instance.rs        |  60 +++++-
 drivers/gpu/nova-core/vgpu/log.rs             | 171 ++++++++++++++++++
 7 files changed, 382 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/log.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 012c7e6abca6..d5ac779e3b0b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -558,9 +558,10 @@ pub(crate) fn new<'a>(
                         // SAFETY: These sibling fields are initialized at their final pinned
                         // addresses. The private manager cannot escape this `Gpu`, and is dropped
                         // before all its dependencies, both here on failure and on normal removal.
-                        let (cmdq, bar_user, mm, chid_pool) = unsafe {
+                        // The GSP build ID is not modified after initialization.
+                        let (gsp, bar_user, mm, chid_pool) = unsafe {
                             (
-                                &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                                &*core::ptr::from_ref(&gsp_resources.gsp),
                                 &*core::ptr::from_ref(bar_user.as_ref().get_ref()),
                                 &*core::ptr::from_ref(mm.as_ref().get_ref()),
                                 &*core::ptr::from_ref(chid_pool.as_ref().get_ref()),
@@ -568,7 +569,9 @@ pub(crate) fn new<'a>(
                         };
                         Some(KBox::pin_init(VgpuManager::new(
                             dev,
-                            cmdq,
+                            &gsp.cmdq,
+                            gsp_resources.spec,
+                            gsp.build_id(),
                             bar_user,
                             mm,
                             chid_pool,
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 45645bc7c9d8..ab3a7adbff69 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -180,6 +180,21 @@ fn new(spec: Spec, build_id: &BuildId, task_prefix: &str) -> Self {
     }
 }
 
+/// Size of the header prepended to debugfs log buffer dumps.
+pub(crate) const LOG_BUFFER_HEADER_SIZE: usize = size_of::<LogBufferHeader>();
+
+/// Builds a log header using the GPU implementation reported by the hardware.
+pub(crate) fn build_log_buffer_header(
+    spec: Spec,
+    build_id: &BuildId,
+    task_prefix: &str,
+) -> [u8; LOG_BUFFER_HEADER_SIZE] {
+    let header = LogBufferHeader::new(spec, build_id, task_prefix);
+    let mut bytes = [0; LOG_BUFFER_HEADER_SIZE];
+    bytes.copy_from_slice(header.as_bytes());
+    bytes
+}
+
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -368,6 +383,8 @@ fn register_debugfs<'data>(&'data self, dir: &debugfs::ScopedDir<'data, '_>) {
 pub(crate) struct Gsp<'gsp> {
     /// The GSP firmware's TLV.
     gsp_tlv: firmware::Firmware,
+    /// Build identifier of the firmware whose log buffers are exposed.
+    build_id: Option<BuildId>,
     /// Libos arguments.
     pub(crate) libos: Coherent<'gsp, [LibosMemoryRegionInitArgument]>,
     /// Log buffers, optionally exposed via debugfs.
@@ -383,6 +400,11 @@ pub(crate) struct Gsp<'gsp> {
 }
 
 impl<'gsp> Gsp<'gsp> {
+    /// Returns the GSP firmware build identifier, when available.
+    pub(crate) fn build_id(&self) -> Option<&BuildId> {
+        self.build_id.as_ref()
+    }
+
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
     pub(crate) fn new(
         pdev: &'gsp pci::Device<device::Bound>,
@@ -405,6 +427,7 @@ pub(crate) fn new(
 
             Ok(try_pin_init!(Self {
                 gsp_tlv,
+                build_id,
                 cmdq <- Cmdq::new(dev, bar),
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 rmargs: Coherent::init(
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index bcbef1571fb9..72c65702c58b 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -197,7 +197,6 @@ pub(crate) struct BarMapping<'map, 'gpu> {
     unmap_error: Option<Error>,
 }
 
-#[expect(dead_code)]
 impl<'map, 'gpu> BarMapping<'map, 'gpu> {
     /// Maps the containing pages while restricting CPU access to the requested byte range.
     pub(crate) fn new(
@@ -243,6 +242,10 @@ pub(crate) fn new(
         })
     }
 
+    pub(crate) fn bar1(&self) -> &'gpu Bar1<'gpu> {
+        self.access.bar_user.bar1
+    }
+
     pub(crate) fn region(&self) -> &VramRegion {
         &self.region
     }
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index f78a4621984a..2dbf95222d4d 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -11,13 +11,15 @@
 };
 
 use crate::{
+    firmware::gsp::BuildId,
     fsp::{
         Fsp,
         VgpuMode, //
     },
     gpu::{
         ChannelIdPool,
-        Chipset, //
+        Chipset,
+        Spec, //
     },
     gsp::{
         cmdq::Cmdq,
@@ -38,6 +40,7 @@
 mod gsp_plugin_rpc;
 mod hal;
 mod instance;
+mod log;
 mod scrubber;
 mod vram;
 
@@ -113,6 +116,8 @@ pub(crate) struct VgpuManager<'gpu> {
     instances: Mutex<VgpuInstances<'gpu>>,
     dev: &'gpu device::Device<device::Bound>,
     cmdq: &'gpu Cmdq<'gpu>,
+    spec: Spec,
+    build_id: Option<&'gpu BuildId>,
     bar_user: &'gpu BarUser<'gpu>,
     mm: &'gpu Mutex<GpuMm<'gpu>>,
     chid_pool: &'gpu ChannelIdPool,
@@ -127,6 +132,8 @@ impl<'gpu> VgpuManager<'gpu> {
     pub(crate) fn new(
         dev: &'gpu device::Device<device::Bound>,
         cmdq: &'gpu Cmdq<'gpu>,
+        spec: Spec,
+        build_id: Option<&'gpu BuildId>,
         bar_user: &'gpu BarUser<'gpu>,
         mm: &'gpu Mutex<GpuMm<'gpu>>,
         chid_pool: &'gpu ChannelIdPool,
@@ -139,6 +146,8 @@ pub(crate) fn new(
             instances <- new_mutex!(VgpuInstances::new(), "nova-core::vgpu-instances"),
             dev,
             cmdq,
+            spec,
+            build_id,
             bar_user,
             mm,
             chid_pool,
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index 3d2c69e8cd79..75739ddff58b 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -4,18 +4,22 @@
 //! GSP plugin communication buffer mappings and access.
 
 use kernel::{
+    io::Io,
     num::casts::u32_as_usize,
     prelude::*,
     sync::Mutex, //
 };
 
-use crate::mm::{
-    bar_user::{
-        BarMapping,
-        BarUser, //
+use crate::{
+    driver::Bar1,
+    mm::{
+        bar_user::{
+            BarMapping,
+            BarUser, //
+        },
+        vram::VramRegion,
+        GpuMm, //
     },
-    vram::VramRegion,
-    GpuMm, //
 };
 
 use super::fw::{
@@ -59,6 +63,97 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
     Ok(subregion)
 }
 
+/// BAR1 view of one vGPU plugin log buffer.
+pub(super) struct MappedPluginLogBuffer<'gpu> {
+    bar1: &'gpu Bar1<'gpu>,
+    gpu_va_addr: usize,
+    size: usize,
+}
+
+impl<'gpu> MappedPluginLogBuffer<'gpu> {
+    fn new(map: &BarMapping<'_, 'gpu>, region: &VramRegion) -> Result<Self> {
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
+        let bar1 = map.bar1();
+        if gpu_va_addr.checked_add(size).ok_or(EOVERFLOW)? > bar1.size() {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            bar1,
+            gpu_va_addr,
+            size,
+        })
+    }
+
+    pub(super) const fn size(&self) -> usize {
+        self.size
+    }
+
+    pub(super) fn read(&self, offset: usize, output: &mut [u8]) -> Result {
+        let end = offset.checked_add(output.len()).ok_or(EOVERFLOW)?;
+        if end > self.size {
+            return Err(EINVAL);
+        }
+
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
+            let bytes = self.bar1.try_read32(bar_offset)?.to_le_bytes();
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
+/// BAR1 views of all vGPU plugin log buffers.
+pub(super) struct MappedPluginLogBuffers<'gpu> {
+    init: MappedPluginLogBuffer<'gpu>,
+    vgpu: MappedPluginLogBuffer<'gpu>,
+    kernel: MappedPluginLogBuffer<'gpu>,
+}
+
+impl<'gpu> MappedPluginLogBuffers<'gpu> {
+    pub(super) fn into_parts(
+        self,
+    ) -> (
+        MappedPluginLogBuffer<'gpu>,
+        MappedPluginLogBuffer<'gpu>,
+        MappedPluginLogBuffer<'gpu>,
+    ) {
+        (self.init, self.vgpu, self.kernel)
+    }
+}
+
 /// BAR1 mapping of the plugin communication region in its management heap.
 ///
 /// r000 layout, with byte offsets from the management heap (not to scale):
@@ -218,6 +313,15 @@ pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         }
     }
 
+    /// Return BAR1 views that must stop being read before this mapping is destroyed.
+    pub(super) fn mapped_plugin_logs(&self) -> Result<MappedPluginLogBuffers<'gpu>> {
+        Ok(MappedPluginLogBuffers {
+            init: MappedPluginLogBuffer::new(&self.map, &self.init_log)?,
+            vgpu: MappedPluginLogBuffer::new(&self.map, &self.vgpu_log)?,
+            kernel: MappedPluginLogBuffer::new(&self.map, &self.kernel_log)?,
+        })
+    }
+
     /// Clear a previous boot marker before starting the plugin.
     pub(super) fn clear_plugin_ready(&self) -> Result {
         let offset = self.io_offset(
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 1ccf4309f2ed..82a568ee3779 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -7,10 +7,12 @@
 };
 
 use kernel::{
+    debugfs,
     device,
     prelude::*,
     ptr::Alignment,
     sizes::SizeConstants,
+    str::CString,
     time::{
         delay::fsleep,
         Delta,
@@ -21,7 +23,11 @@
 
 use crate::{
     driver::Bar0,
-    gpu::ChannelIdReservation,
+    firmware::gsp::BuildId,
+    gpu::{
+        ChannelIdReservation,
+        Spec, //
+    },
     gsp::{
         cmdq::Cmdq,
         commands::FifoEngineList, //
@@ -47,8 +53,12 @@
         BootloadInfo,
         ChannelMapEntry, //
     },
-    gsp_plugin_comm::CommBufferRegion,
+    gsp_plugin_comm::{
+        CommBufferRegion,
+        MappedPluginLogBuffers, //
+    },
     gsp_plugin_rpc::PluginRpc,
+    log::VgpuLogBuffers,
     scrubber::CeUtils,
     vram::{
         VgpuVramLayout,
@@ -150,6 +160,7 @@ struct VgpuInstance<'gpu> {
     vgpu_type: VgpuType,
     vm_pid: u32,
     num_plugin_channels: u32,
+    debugfs_logs: Option<Pin<KBox<debugfs::Scope<VgpuLogBuffers<'gpu>>>>>,
     plugin_rpc: PluginRpc<'gpu, 'gpu>,
     // Unmap the communication region before returning its slot and channel IDs.
     vram_slot: VgpuVramSlot,
@@ -197,6 +208,20 @@ fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         self.configure_plugin(dev)?;
         set_plugin_bme(dev, &mut self.plugin_rpc, true)?;
 
+        match self
+            .plugin_rpc
+            .comm()
+            .mapped_plugin_logs()
+            .and_then(|buffers| create_debugfs_logs(buffers, self.dbdf, vgpu.spec, vgpu.build_id))
+        {
+            Ok(logs) => self.debugfs_logs = Some(logs),
+            Err(error) => dev_warn!(
+                dev,
+                "debugfs logs unavailable for gfid={}: {:?}\n",
+                self.gfid.get(),
+                error,
+            ),
+        }
         Ok(())
     }
 
@@ -222,6 +247,8 @@ fn teardown(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
                 send_cleanup(vgpu.dev, vgpu.cmdq, self.gfid)?;
                 self.needs_teardown = false;
             }
+            // Debugfs readers use BAR1 offsets directly and must finish before unmapping.
+            self.debugfs_logs = None;
             self.plugin_rpc.unmap()
         })();
         if let Err(error) = result {
@@ -320,6 +347,34 @@ pub(super) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32
     }
 }
 
+fn create_debugfs_logs<'gpu>(
+    buffers: MappedPluginLogBuffers<'gpu>,
+    dbdf: Dbdf,
+    spec: Spec,
+    build_id: Option<&BuildId>,
+) -> Result<Pin<KBox<debugfs::Scope<VgpuLogBuffers<'gpu>>>>> {
+    let logs = VgpuLogBuffers::new(buffers, spec, build_id);
+    let directory = CString::try_from_fmt(fmt!(
+        "{:04x}:{:02x}:{:02x}.{:x}-vgpu",
+        dbdf.domain(),
+        dbdf.bus(),
+        dbdf.device(),
+        dbdf.function(),
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
 pub(super) struct VgpuInstances<'gpu> {
     instances: KVec<VgpuInstance<'gpu>>,
@@ -420,6 +475,7 @@ fn allocate_instance<'a>(
             vgpu_type,
             vm_pid,
             num_plugin_channels: PLUGIN_CHANNELS_PER_ENGINE,
+            debugfs_logs: None,
             plugin_rpc: PluginRpc::new(comm, bar0, gfid),
             vram_slot,
             chids,
diff --git a/drivers/gpu/nova-core/vgpu/log.rs b/drivers/gpu/nova-core/vgpu/log.rs
new file mode 100644
index 000000000000..30a33bd6723e
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/log.rs
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin logs exposed through debugfs.
+//!
+//! With debugfs mounted at `/sys/kernel/debug`, the directory uses the VF's
+//! PCI domain:bus:device.function address:
+//!
+//! ```text
+//! /sys/kernel/debug/nova-core/<VF-DBDF>-vgpu/
+//! |-- init_log
+//! |-- vgpu_log
+//! `-- kernel_log
+//! ```
+
+use kernel::{
+    debugfs,
+    fs::file,
+    prelude::*,
+    uaccess::UserSliceWriter, //
+};
+
+use crate::{
+    firmware::gsp::BuildId,
+    gpu::Spec,
+    gsp::{
+        build_log_buffer_header,
+        LOG_BUFFER_HEADER_SIZE, //
+    },
+    vgpu::gsp_plugin_comm::{
+        MappedPluginLogBuffer,
+        MappedPluginLogBuffers, //
+    },
+};
+
+const LOG_READ_CHUNK_SIZE: usize = 4096;
+
+/// A vGPU plugin log buffer backed by VRAM, read via BAR1 MMIO.
+///
+/// An optional header lets `nvlog_decoder` identify the GPU architecture and firmware build.
+struct VgpuLogBuffer<'gpu> {
+    buffer: MappedPluginLogBuffer<'gpu>,
+    header: [u8; LOG_BUFFER_HEADER_SIZE],
+    header_len: usize,
+}
+
+impl<'gpu> VgpuLogBuffer<'gpu> {
+    fn new(
+        buffer: MappedPluginLogBuffer<'gpu>,
+        spec: Spec,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Self {
+        let (header, header_len) = match build_id {
+            Some(bid) => (
+                build_log_buffer_header(spec, bid, task_prefix),
+                LOG_BUFFER_HEADER_SIZE,
+            ),
+            None => ([0u8; LOG_BUFFER_HEADER_SIZE], 0),
+        };
+
+        Self {
+            buffer,
+            header,
+            header_len,
+        }
+    }
+}
+
+impl debugfs::BinaryWriter for VgpuLogBuffer<'_> {
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
+        // Keep the staging buffer on the heap to avoid a page-sized kernel stack object.
+        let staging_size = count.min(LOG_READ_CHUNK_SIZE);
+        let mut staging = KVec::new();
+        staging.resize(staging_size, 0, GFP_KERNEL)?;
+
+        let mut written = 0usize;
+        let result: Result = (|| {
+            while written < count {
+                let chunk_len = (count - written).min(staging.len());
+                let chunk = &mut staging[..chunk_len];
+                let chunk_offset = offset_val.checked_add(written).ok_or(EOVERFLOW)?;
+                let mut filled = 0usize;
+
+                if chunk_offset < self.header_len {
+                    let header_len = (self.header_len - chunk_offset).min(chunk_len);
+                    chunk[..header_len]
+                        .copy_from_slice(&self.header[chunk_offset..chunk_offset + header_len]);
+                    filled = header_len;
+                }
+
+                if filled < chunk_len {
+                    let log_offset = chunk_offset
+                        .checked_add(filled)
+                        .ok_or(EOVERFLOW)?
+                        .checked_sub(self.header_len)
+                        .ok_or(EINVAL)?;
+
+                    self.buffer.read(log_offset, &mut chunk[filled..])?;
+                }
+
+                writer.write_slice(chunk)?;
+                written = written.checked_add(chunk_len).ok_or(EOVERFLOW)?;
+            }
+            Ok(())
+        })();
+        if written == 0 {
+            result?;
+        }
+
+        *offset = (*offset)
+            .checked_add(i64::try_from(written).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)?;
+        Ok(written)
+    }
+}
+
+/// The three plugin log streams for one vGPU instance.
+pub(super) struct VgpuLogBuffers<'gpu> {
+    init_log: VgpuLogBuffer<'gpu>,
+    vgpu_log: VgpuLogBuffer<'gpu>,
+    kernel_log: VgpuLogBuffer<'gpu>,
+}
+
+impl<'gpu> VgpuLogBuffers<'gpu> {
+    pub(super) fn new(
+        buffers: MappedPluginLogBuffers<'gpu>,
+        spec: Spec,
+        build_id: Option<&BuildId>,
+    ) -> Self {
+        let (init, vgpu, kernel) = buffers.into_parts();
+
+        Self {
+            init_log: VgpuLogBuffer::new(init, spec, build_id, "INIT"),
+            vgpu_log: VgpuLogBuffer::new(vgpu, spec, build_id, "VGPU"),
+            kernel_log: VgpuLogBuffer::new(kernel, spec, build_id, "KRNL"),
+        }
+    }
+
+    pub(super) fn register_debugfs<'data, 'dir>(
+        logs: &'data Self,
+        dir: &'dir debugfs::ScopedDir<'data, 'dir>,
+    ) {
+        dir.read_binary_file(c"init_log", &logs.init_log);
+        dir.read_binary_file(c"vgpu_log", &logs.vgpu_log);
+        dir.read_binary_file(c"kernel_log", &logs.kernel_log);
+    }
+}
