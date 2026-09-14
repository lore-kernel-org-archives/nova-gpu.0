Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D293905F4
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372198; cv=fail; b=CsEuoT09vvUStZRKTP2vSA/dwIMyjGA6Vw6OmHKKRSqw60LNft+aDovxkvwR6e+++Er9eQlYPyV4+XdESZGGSDeq08CzI/AsjWtzB/EghPY03PcUCCKvWU9dnrdOdihaPTXfYQVdmncEY8fxlxykjj/D874E3N+C46X3Xp136BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372198; c=relaxed/simple;
	bh=qvWNNcZ70sQmvwi5pltV22bZXwYvRigRZ2cogFzCEm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=haCE6aJH/aQUO+tX/ci5UhIW2FeZZ+8p2n+viJXIfhhzJvbMqC4M6E5jk6qW163fG9JAN8eSMXvZozaqUii67/FImkOuVC8wFiKtF0vXG+eYrUz01GXv1b3j4/2UclyOOlxaNbctj5wDcHu/b9NxuF78HSDtFZIvyl9cNQ0fYX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HOgPlXU+; arc=fail smtp.client-ip=40.93.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HOgPlXU+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slNG3jVsOFGtg60PlHJOGRXOI6uuptaa1NQpLy8wI4n5AlT2nq/y2ZaZ8ZZAaB8K3/re5Xn2gXXIk6IOL2ZxjVb24uzzZtajfAw7V37Qd2KSiAQ/dgdnvyhPliGxvtBTIatSlVYD0RenvCVjG/Nv5Nw8ioPWV9TXs3Ai5tJVMjubZB5zwGDcOnkbWoyb3BLakON0yZmW7OzQcYqSJHfvdConKrPWn+FwWQ/HeNbozGaQGp/hL8kNkafKEgsGCqZkfoCGUx2ucvnWzQA8Df9GCPHkXfIT4vLU4Tuf4XWhEygWugE4YDWKUMxX57PqRIys/ICJhGnLNt3BfFAa/cu70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3ZBzRfd3bVu7x6HteFzJvPiWQqOLJwEh7AgJNPdAaM=;
 b=EWaBhTDpfdTobhyVOx9K2DeTl6Ien2M2ICXhT2s0JRTx5mfFpkXHopYmkUb54UXmLZrlaKJ67o1nt2AjDaqnDJhwRyAvzg/OrlJyoV3BjqBPdqxO8mDD0xHIuKG7lb5AeOOgGxy1zXf/g+dkR3nUmgcJu1Z1i5Y30Od7rP6PkfUgJbwUuHjShItSIwEYcohANzhUAahYbVunpSnMrj62IRF63AJRS6dAs7Z6F13cvJVHYjoFPHMZnvFsyivMD3us6+nYPeVdNTDj0ICnUpTTe00LF5mHZLqwbCADCEX5JHgEXbjv9P5XI2izc24uA4twB/DCcXwn8lTexnFbjaQXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3ZBzRfd3bVu7x6HteFzJvPiWQqOLJwEh7AgJNPdAaM=;
 b=HOgPlXU+7xA9yoh5uwaCHncQRRDH0rzR9AUsKC4tiG4H9R5lbSeYi1hQMNdo6JgW0kBaAJLCC/NyZejA5oKn63vhgQiE2uEz7Cqz16XXLdpn9VdSoVHIIhzYN9NJBTodajiq1+bCTlf+qKyYXCgiHdYJ09toHUeTn5BsptCmWJzsRLKipxz4I1ORwzffVu6QMG2xJExA7ZzlcqImQhyG3lwqpPqlGCT9omD/4Jbl3ROiLPOCmu9/zjK/w5JNNjvHbLXkodlaw12CUmrhjqLnuimsUNanqsx01oUw3SqsH4xtpNM/zQMPH/N7SoJKvlhmBbCKxHoKkzNtp+1wkJiaGw==
Received: from BN9PR03CA0635.namprd03.prod.outlook.com (2603:10b6:408:13b::10)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 07:49:46 +0000
Received: from BN2PEPF0000A891.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::97) by BN9PR03CA0635.outlook.office365.com
 (2603:10b6:408:13b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A891.mail.protection.outlook.com (10.167.248.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:49:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:49:29 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:28 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:20 -0700
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
Subject: [PATCH v2 01/32] gpu: nova-core: gsp: pass boot context through setup helpers
Date: Mon, 14 Sep 2026 10:48:36 +0300
Message-ID: <20260914074907.1399629-2-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A891:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: a86dcf38-89b5-434b-c34a-08df1234bf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|3023799007|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GjakcYiFF9TOXuWyEQWknvHLBSIVWzJrOMWqLwCdbKYXAyQxQDY+Mia0ckcSVUNrLsV1ydKnJHFRL3NwmMozzmLrdrVhxJbFMPpJ8obAC2Ae00HAHIITKKoUd9F3IwBwHc0PQB9AlpmcTrbt6O7fH8fLHVMW76zRRFXl3rdhttsH9NROJs87Vk+H30jA/OLXAWADBptJT2uByrlsFyDRhR7a0isEB07JHGlPJ8ZVSAoiHigyXcntQJDXCwUWv5j51zExRY7nlHirF3Xgf9x/bHRhjpmlZqIdau5AhzjirRoSNwesbKiSjnuYSwMYA2puTXZ+i6aEvRxgCZVp4/IdhOBPITVsw5QNB8vtXijMPu03LHYj3VPN4IRCND1mwty+VjjVPtuHwgjW4jxkowTcOue5OMz45ZDecemWJ9j6U6q8QG2cGrzmkwSAbrfuYJEjzzHE2XYAVPJfz0cS0aRHaZako4GN2WNeYnjshsRDoIOunj7RGDgf3w6uA/7/Ymi2QVrCk+gOTOVC9jXczW1+7lZo9k6hUBEwu6h2nwibONhd1fk7vt7jZPbQZ6DNb509seA8dOSq6TL6zCXc8PIW81TwZhUPj6xhoLksWb9Rf+nfFEs6PEyWQZL5cZX8VogrtZv956jJ+f/iUvM2CuqRJeKWNrD5k4CSgfw0KF7eEJZOUmmVf35dldm9Sj6/jbzxBUv92PUj5Jo6OM70criCHA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(3023799007)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fYH3CMbT1GdjhvS6vDpaYOkV61gGHn08Ed+ooFiWWXokNnFEkIttDYaoZJ0fpYrpzldmZCzk+K+n6mRlJ1ovQEZgxhnEWb9v9+XvyXwpHpQT2NcZ9jmtMjXGEpqpMdam43NND8A1/EuM4L+Q33JozRevxrysKICDFvtIz4Y5lfVkqYmSF6tMB3X7m6RoFfyznaT3XQntO+NUQ0BluC3Ra5NDVZP2jePlVC6YiUXz+DHcPx8E8QYHZvASN3UnX/gRy92GDaw1dqVWEl1Ds8xwW7zxZ8PkNLQDZfmuOf6D1Y1euUTp6fNMZPE55nGnaj7qWgM1T5s1xE10doZ2A+30oiAknVmVdgM686IgC8SoOE6kiaUSwt1y3Su8NxjYHUw/TnqCreigAHWho5ncODjSY70W9UxI1xCMyxM3bOFp4kYXAWnqMzDsSAwfLtcRuiQx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:49:46.0695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a86dcf38-89b5-434b-c34a-08df1234bf07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A891.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

GSP boot unpacks the device, chipset, BAR and vGPU state from its
context only to pass them to framebuffer setup and GSP_INIT helpers.
The callers duplicate which context fields each helper needs.

Pass GspBootContext through the framebuffer sizing and GSP_INIT payload
helpers. Read the device and mode where they are used, including the
VF topology and WPR2 heap helpers. Keep mode detection, ownership and
firmware values unchanged.

No functional change is intended.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs            | 26 +++++++++++---------------
 drivers/gpu/nova-core/gsp/boot.rs      |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs  | 25 +++++++++----------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  2 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  2 +-
 5 files changed, 23 insertions(+), 34 deletions(-)

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
index 38ab737ad798..fa879685bac5 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -123,7 +123,7 @@ pub(crate) fn boot(
 
         // GSP-RM discards any RPC that reaches it before GSP_INIT, so the system information
         // and the registry keys go inside that one request.
-        let init_payload = commands::build_gsp_init_payload(pdev, chipset, ctx.vgpu.state())?;
+        let init_payload = commands::build_gsp_init_payload(ctx)?;
         let bootloader = if super::hal::uses_generic_bootloader(chipset) {
             Some(GenericBootloader::new(dev, chipset, gsp_falcon)?)
         } else {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 6d250548c165..ce1761c2f398 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -8,14 +8,12 @@
 };
 
 use kernel::{
-    device,
     pci,
     prelude::*,
     transmute::AsBytes, //
 };
 
 use crate::{
-    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -40,6 +38,7 @@
             Encoder,
             UnknownKeyPolicy, //
         },
+        GspBootContext,
     },
     sbuffer::SBufferIter,
     vgpu::VgpuState, //
@@ -103,37 +102,31 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 /// - `ENODEV` if vGPU mode is enabled but the SR-IOV capability is missing.
 ///
 /// Errors reading the PCI configuration or decoding the VF BAR layout are propagated as-is.
-pub(crate) fn build_gsp_init_payload(
-    pdev: &pci::Device<device::Bound>,
-    chipset: Chipset,
-    vgpu_state: VgpuState,
-) -> Result<EncodedStream> {
+pub(super) fn build_gsp_init_payload(ctx: &GspBootContext<'_, '_>) -> Result<EncodedStream> {
     let mut regkeys = KVVec::new();
     for &(name, value) in REGISTRY_ENTRIES {
         regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
     }
-    if matches!(vgpu_state, VgpuState::Enabled { .. }) {
+    if matches!(ctx.vgpu.state(), VgpuState::Enabled { .. }) {
         regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL)?;
     }
 
-    let vf_info = build_vf_info(pdev, vgpu_state)?;
+    let vf_info = build_vf_info(ctx)?;
 
     let mut encoder = Encoder::new();
-    GspInitRequest::new(pdev, chipset, regkeys, vf_info).encode(&mut encoder)?;
+    GspInitRequest::new(ctx.pdev, ctx.chipset, regkeys, vf_info).encode(&mut encoder)?;
 
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
index bbdcf754ec13..c3a87e5c7e0b 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -259,7 +259,7 @@ fn boot<'gpu>(
         let gsp_falcon = ctx.gsp_falcon;
         let sec2_falcon = ctx.sec2_falcon;
 
-        let fb_ranges = FbRanges::new(chipset, bar, gsp_fw, ctx.vgpu.state())?;
+        let fb_ranges = FbRanges::new(ctx, gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_ranges);
 
         // Declared before the unload guard so that if Booter fails while running, SEC2 is reset
