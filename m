Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7449892B
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591358; cv=fail; b=q8SRGFbOkRkcRs5I3CuZqoSOB6CeAi1ohMZMpi6JSQPfv612TkiYadntryrSGdPkjfwe66WYRtIiMLbCoxWzrojQbNAZFr7gOrfKudP0dtcw4lKVu2IMa21aYfIDtbzc5+DSXAef87SdZdHnLJynXPBLFYM1zlpP56xLu1QdNNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591358; c=relaxed/simple;
	bh=pZHQMJhw5Sj9sYwN6VS+5VSEm0vM2nWialF8Yfful6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRufb8NOId7ZFSd81h1nR2I88QCw4+5zOutyhrh9BLRYKen8xpnlYbazLIsJ/RS5hSV0odwrRO7IJ75qc8b1RO41vIJRTfbaCVM1b/ASuvAAxNl/5ZJU9ZwGv+b+g79q6ETI8ddkRb6vhn3UaX7I4R/aYGL32ZgZfk0U6O1ZIvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kAWI1+6D; arc=fail smtp.client-ip=40.107.209.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kAWI1+6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DghRR2NE3d6lgaIz0GQ0vwH6WZ1fqWJeu3JK33RXIzmruGQnDcQLPe3iR5y88IKDZdGk4SrMP6aHJO4Koik0ZZ6+IsTkXGaFqcg7dWfj68V6/CIbsSSMx4yRLLsMoLnKKVSqln+c7Kv0bggKxSX/dBteGZ+nBmgje1bQZFah8ONg78ZeX6PX/0TqlZR1HlNmxyOZ1yzsuKFEt49tnWCcdLCy/UdnMoV3tnuo5hc/a53DOHiRe3kN/9/VkKBwnqhOc7sHrGvi6frCQ100LtkTAiPDFtrOhGrmB6wEfgfREFO2GQqqrBRqkrUuuiln2SWGEkLhCxPoDBpIfEbORu2q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XQCmSotnbX2BNGcYjwoXMPtrPbwrDjVZTOP/5kLGvw=;
 b=kwUOviRFPEXYVz4H7/a1UNTBKxlghkQSmAOwJk08pq9/MhjyjsodZjyujvKepjOCoExM+OMHVTCK3n2F2C/WKTEhDOfI/QEJkV/9M+NWoaMjYML7Yd2PeyP+Bb+9DFF9sEwyiQAnbEV5MZJpQeDiSYZ1bsR5EHUXs2VO5pmgz8DhiEaSVK52oclOuAzcPmtcS6/ICEFwQZ8U6gPwBMwQg4yjMNMwj+tONmTA5QCTLpEcLGX47jMqkj6ZDdx6NB4AagUZ0rjeOYWkcKZrqpv0udy6PllZgGUSP5i58SLkkrc8jwRxBh6BncIm0jWWf3ZwIAR3Ad+4+zsMawvMCiTPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XQCmSotnbX2BNGcYjwoXMPtrPbwrDjVZTOP/5kLGvw=;
 b=kAWI1+6D2kKk9lVpTB0smUIdrp6p0FVuc39QDNQhf19EjQUk2Te+cKmJDUC4Fh8U6HblX8Q6PIgDSB/vDeGraThR3mIyitSZcKeH/ahN8pC9/CibM8C3WymkCZzOtslODlRa4f5v0dh/w+DkwDCptAt8d37FKu6JuMwJ9lOvH16Xy11qjH6UDBrodk73u4hD2fPBm+rRlQnEoA0R+6EWD5TaEaxtoRv9Sgzu2LyJ2bkic9aF1tkM0ywlnaZlSZ97Pd+a/3299sHhZ29D4wzko8kBfDwvyDsskn9/FS49w69QHOARhx90P1WkEfNi46xule7Ipn7zOk24wDcRSFOj+w==
Received: from BY3PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:39a::16)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:29:10 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a7) by BY3PR03CA0011.outlook.office365.com
 (2603:10b6:a03:39a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:29:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:10 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:28:57 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:28:55 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:28:48 -0700
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
Subject: [PATCH v3 01/31] gpu: nova-core: gsp: pass boot context through setup helpers
Date: Mon, 28 Sep 2026 13:28:04 +0300
Message-ID: <80a98b89479beff4ce263c2f12dac54998827ec0.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 652299e4-3408-4c9e-f7e5-08df1d4b559a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|10067099003|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rMbxEm6K5diwyPIUSTE+wJeGRU9efFx8ZwM+hreL7pXr/tJWo/EOh2vNSK0uuTooCNbnpiGDfZ3skYaMcPWzLfMiBRrZHKL4Hm4CBnLT2g3t3mn9cMeEabYAc1hm+bzPIxATqnscw6soZHAScFWFqnVFWPlDlYOguDhWHnLw8GACAhlRs6xuTpe5XhRwYWlcnUqxtSGqyQyfQXS3jucBShxWaIC1FuP1LhA7NnNgmnwYp8KSqWwlT+ODu1y0NwSRUfooz16razdV4wYT/kNP6KU1BJHMqV1Og7zAFqw9bxV6lxfQ4oSRHu3Xgbie59Q3duPlxiaHDXLeFiPDCCkqo0+MvUx7x7vbSdeTMKPjs0g+ORG53FSND2rEaFh7Gneyf4YPyYccxc+ZHQClE1klW0blLkG0poFj+rstQ14oQDPX7r+ldCBOzcG2lJSVOrWewCiRR9c4LXHAbIBVJjkoKn/lVizFaopvEIZvtvJB/AQ4pJ2X6zTP2l9MuwFoa9lH4cwYYEicCepq9fm16NzS67BncVpUrSfOv1Sy9l2/xoURKgERlYHFdlFlEdT7wJRd1FXSqpGgZuRuZruzoN5etkTZJo0suCvfcW/DgDc4FurXlPHXSrp8ODJn5rBDMjdx1b2TV21oSsXGEmdAIkCTi+H1mDCpUszNFb1Nc6gZVcIOG4o7xjSAh6kgaUIu1tcbp/Kr0VMfV9sfpLIcnDoqg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c7hObS0WcETwYJX+b90uH2yLKq0Dttzi63SkK+jstY7AyZcRIkaQ34wnaa3gm68hcwfLRBxi/gVRrMRPY7l+nraFI3IEDy9rbF++fXno0ma3P6xmlCy5GOZpCmq7U/vXpaTkI6uqRGnezXxh74tJg+RdlAKujI24mYmP9y98kUkHmbU9nv34LNm554o9TIa8jsziQVeuyMGwRrUEtxRPJu+aF7mVZMFlRa6TG88FMucKMqnebeGPDodSO19InNA/djmJigw2c/PeW9omVGcpKBVG1AEAN55YL4XUIIj0TsGnYL45DkQDBCIpvEQJo1GaNiFH3eflH5aA7KZw/fNv8X1rmcyJ57oYjge/oqNRoEaIZj1x5QuuV9ZMnbLRK13JsTl6mCQhVVMHM8nNjsWRyCpbBFiMhy3szZnK02g/uKld8BclCG3ozMH3XArfjDp3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:10.4454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 652299e4-3408-4c9e-f7e5-08df1d4b559a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

The GSP boot paths pass the device, chipset, BAR and vGPU state to the
VRAM layout and GSP_INIT helpers as separate arguments. These values
are already available in GspBootContext, and some are forwarded again
to the WPR2 heap and VF topology helpers.

Pass the boot context through these helpers so each can read the fields
it needs. This simplifies the helper signatures and their call sites.

No functional change is intended.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs            | 26 +++++++++++---------------
 drivers/gpu/nova-core/gsp/boot.rs      |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs  | 26 +++++++++++---------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  2 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  2 +-
 5 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 5ceb7760c78e..26e94d908b77 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -174,13 +174,9 @@ pub(crate) struct FbRanges {
 
 impl FbRanges {
     /// Computes concrete framebuffer ranges required on non-FSP booting architectures.
-    pub(crate) fn new(
-        chipset: Chipset,
-        bar: Bar0<'_>,
-        gsp_fw: &GspFirmware<'_>,
-        vgpu_state: VgpuState,
-    ) -> Result<Self> {
-        let hal = hal::fb_hal(chipset);
+    pub(crate) fn new(ctx: &gsp::GspBootContext<'_, '_>, gsp_fw: &GspFirmware<'_>) -> Result<Self> {
+        let bar = ctx.bar;
+        let hal = hal::fb_hal(ctx.chipset);
 
         let fb = {
             let fb_size = hal.vidmem_size(bar);
@@ -242,7 +238,7 @@ pub(crate) fn new(
             FbRange(fw_image_addr..fw_image_addr + fw_image_size)
         };
 
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb.end)?;
+        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(ctx, fb.end)?;
 
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::SZ_1M;
@@ -298,11 +294,11 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 }
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
-fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Result<(u8, u64)> {
-    Ok(match vgpu_state {
+fn wpr2_heap_params(ctx: &gsp::GspBootContext<'_, '_>, fb_size: u64) -> Result<(u8, u64)> {
+    Ok(match ctx.vgpu.state() {
         VgpuState::Disabled => (
             0,
-            gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb_size)?,
+            gsp::LibosParams::from_chipset(ctx.chipset).wpr_heap_size(ctx.chipset, fb_size)?,
         ),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
@@ -328,10 +324,10 @@ pub(crate) struct FbSizes {
 
 impl FbSizes {
     /// Computes the framebuffer region sizes for GSP-FMC boot.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuState) -> Result<Self> {
-        let hal = hal::fb_hal(chipset);
-        let fb_size = hal.vidmem_size(bar);
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
+    pub(crate) fn new(ctx: &gsp::GspBootContext<'_, '_>) -> Result<Self> {
+        let hal = hal::fb_hal(ctx.chipset);
+        let fb_size = hal.vidmem_size(ctx.bar);
+        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(ctx, fb_size)?;
 
         Ok(Self {
             frts_size: hal.frts_size(),
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 8848feebb9db..510d32212d41 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -401,7 +401,7 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        let init_payload = commands::build_gsp_init_payload(pdev, chipset, ctx.vgpu.state())?;
+        let init_payload = commands::build_gsp_init_payload(ctx)?;
         let load_exec = LoadExecContext {
             bootloader: generic_bootloader.as_ref(),
             gsp_falcon,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d12f90d94eb6..d6895dc5207e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -2,14 +2,12 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
-    device,
     pci,
     prelude::*,
     transmute::AsBytes, //
 };
 
 use crate::{
-    gpu::Chipset,
     gsp::{
         cmdq::Cmdq,
         fw::{
@@ -30,6 +28,7 @@
             Encoder,
             UnknownKeyPolicy, //
         },
+        GspBootContext, //
     },
     sbuffer::SBufferIter,
     vgpu::VgpuState, //
@@ -42,28 +41,25 @@
 /// # Errors
 ///
 /// - `ENOMEM` if the request or the encoder buffer cannot be allocated.
-pub(crate) fn build_gsp_init_payload(
-    pdev: &pci::Device<device::Bound>,
-    chipset: Chipset,
-    vgpu_state: VgpuState,
-) -> Result<EncodedStream> {
+/// - `ENODEV` if vGPU mode is enabled but the SR-IOV capability is missing.
+///
+/// Errors reading the PCI configuration or decoding the VF BAR layout are propagated as-is.
+pub(super) fn build_gsp_init_payload(ctx: &GspBootContext<'_, '_>) -> Result<EncodedStream> {
     let mut encoder = Encoder::new();
-    let vf_info = build_vf_info(pdev, vgpu_state)?;
-    GspInitRequest::new(pdev, chipset, vgpu_state, vf_info)?.encode(&mut encoder)?;
+    let vf_info = build_vf_info(ctx)?;
+    GspInitRequest::new(ctx.pdev, ctx.chipset, ctx.vgpu.state(), vf_info)?.encode(&mut encoder)?;
 
     Ok(encoder.finish())
 }
 
 /// Builds the optional VF topology portion of the `GSP_INIT` request.
-fn build_vf_info(
-    pdev: &pci::Device<device::Bound>,
-    vgpu_state: VgpuState,
-) -> Result<Option<VfInfo>> {
-    let VgpuState::Enabled { total_vfs } = vgpu_state else {
+fn build_vf_info(ctx: &GspBootContext<'_, '_>) -> Result<Option<VfInfo>> {
+    let VgpuState::Enabled { total_vfs } = ctx.vgpu.state() else {
         return Ok(None);
     };
 
-    let sriov = pdev
+    let sriov = ctx
+        .pdev
         .config_space_extended()?
         .find_ext_capability::<pci::ExtSriovRegs>()?
         .ok_or(ENODEV)?;
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 91201b51030e..f91cdd061706 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -151,7 +151,7 @@ fn boot<'gpu>(
         let chipset = ctx.chipset;
         let gsp_falcon = ctx.gsp_falcon;
 
-        let fb_sizes = FbSizes::new(chipset, ctx.bar, ctx.vgpu.state())?;
+        let fb_sizes = FbSizes::new(ctx)?;
         dev_dbg!(dev, "{:#x?}\n", fb_sizes);
 
         let wpr_meta =
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 265039b8ff55..c221797d6f3c 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -260,7 +260,7 @@ fn boot<'gpu>(
         let gsp_falcon = ctx.gsp_falcon;
         let sec2_falcon = ctx.sec2_falcon;
 
-        let fb_ranges = FbRanges::new(chipset, bar, gsp_fw, ctx.vgpu.state())?;
+        let fb_ranges = FbRanges::new(ctx, gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_ranges);
 
         // Declared before the unload guard so that if Booter fails while running, SEC2 is reset
