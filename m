Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571C499F1E
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591366; cv=fail; b=aPCY+4tqurYuD2Liqg4YzEGfQy6G8B9354QflDkNc6qeddBrLTS2p9pG5ICrHq7AnM1JyqVTaaHrkqKPBVGwnHEFanVpFXcqP4/UjK1NwyiAI0RLlKNnC2dx4qf8kVABiag34Mg8szfZyKX4CGHeiJwIbyWusAJ8I7XrHjG9ROc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591366; c=relaxed/simple;
	bh=YNqtgkc0Ufc4+ty4EfPNvfFjz2DJtgyusyZq8lqefF8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=blitrhgdJCfgzPOmRRFpVSmI0/EHJbSHH6T/bEgcPycwxBCO4eqYHpzQ3LvKceFowSEQlbAlRzfPS+9Mk5/YSw8kqaV9ueotb2qrgZoUumB0q+shc0+UVKXgnLbI1m8AXlQzoaK0Aupr8HFlhCkhYdFqab86HidS0bGR7e3+xSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hBA1TrFS; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hBA1TrFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNrsNAT5ZEsg0wsz2dQVR//iAoDyOuQUrJSVkMtywFrAML2G89EkYRZ0s129lgozsd5t3ELfeLVxNKHoclfleYcQDkk/5s3PHsQBvZ1EpWEE9uPOg65RJFymjDb5tphh20GcebsM8YMk1CYfDaUrVblojVOZCO1K1n2FdZxWlR9rMHP2xNRzsOaddklqr3WjEYSbKPoob6KM+VgWd4hF1Wk/08q6R+sIzreT5jFoLG9qP+stFkw8/fFYurnSNgWsXyNcc5pau8E4r+lnvHg43+nksdm2ql3QC2+c9LOK6GF5vDHBqLesirNVZmNHIc58K6rPH/663RpbXB0jHqgRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HksbFAgHlQmqqHjFNq5XXWeUjqCi8XQ3y3a5HmYCmls=;
 b=lOOgitkCF3gIOYMotlKYBfB+rAxcwNoyf5/9jEh7TPeBLveDkds9e1h40htsj6GfADVp2xtUPgT8t8Goc/WlstynMHC7yqw1Codi9y1WHTb2+yaUofUNUi2yBo1BV6qeSWt2HDIzhr8JkJg173yzW+J6RI6PIByjP5ausUbU9lcb6Z4SJhjmJf8e2pIXVD4YWH5XQ/HnwQWZMIk+Um2/yjc7ssFyGZGJjaN177OICMCtq69VIYgLCs8bmthC3ubAzSdVzSpMz1AGRDvsGORbrchNgHL370d0QaOjo+EwB5CJX9F1RPiYuJoS3tteWovKaKP/tT6PkKFgCLaFUzrq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HksbFAgHlQmqqHjFNq5XXWeUjqCi8XQ3y3a5HmYCmls=;
 b=hBA1TrFSHrV32X8gCw3wu0bodtybMp313PQvkzckGzsxJ7exVyZCAnVPo4Q+T9FAGij/omdrjVJlw4rfKJ15jOD2VyiFifIG4r+0nmLQWvWAGkWw/O13xUMIAp68D3a83FS7265CudUPTTHlGuFGsXjc1zZd3hJxKFd7pKu4SaPkN/wA8QvfvaZeTkFkwMJUY4IBfk8ec005gV6QfLx02JownVbWh98pUYyy7CD0vBoNAVrRZOhZu2i/kfeFkvST/N0velbXMbiSfvH0jizMpxZZMF4tj9oBLQPEoSzjMMftZYwPT4K0U9a4RtgwaHXUwv49ZNEbhP080/SL/+OTqQ==
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:29:19 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::63) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:29:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:05 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:04 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:28:56 -0700
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
Subject: [PATCH v3 02/31] gpu: nova-core: gsp: decouple boot context from VgpuManager
Date: Mon, 28 Sep 2026 13:28:05 +0300
Message-ID: <78ff6a24cb06be02215a2e0a26153f5f5a2991bc.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5eb640-9de6-4ecc-72e4-08df1d4b5aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|23010399003|36860700016|376014|1800799024|3023799007|10067099003|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	H4ovBmFlm4pG3rRwWn3x6j18vzZL4jYdSYAnooIe6GhOdZrtzKznnJ4eFLq63+rGS2e5knDv/4EDv8cuDnl6kxDbjKC/u0A/PMVkefS+5S9+GnYOLgmv6vSdC2A6xS2sDt6wMrR9fUF3XQMuOpZoDSuePMcna92JfhZeejHxswb5pGGr9GYNsWhD57cHtVOioR+TtVSXEOZKFB3+AE3gF45pbRc+4RiCedKiU+t7fAQ0tklfURrsvtUq+0MoCTezziyWkvMepU0vMls8xvueOSoafECg4tIx+UV+xXVIEA/99yFEciTZ+SvXAoLq/JSAMOPh40e2HmH+Tw5rXeHP8Lq3GdlyCmmXbG5Mbedpzp/VacaNHSwwdxc4ABKuQFrGp7UWaDOA0GR2WfR24oj5d34irmMRpvj7LUOkd+VTfFS6xLPAp/35pPopIjYmreIezGMjpWODlFfE3tFosKzfdAYQoBRxkNqilfAOTW3LQNTU4ZLlEiyTDxOi/dQc4MqBCffWE5QKiR7+OwxKzITGtZsbg4lVAzrDn2cgzrh1krAkZBZMv/JMDWpz3+M7nbTx8husRqizcJv9liIVLD9hEKLGAgN6zvkFuFBC5J8Am0fvCAC7NP6r8w4LVtChewu3+NKIyH2yRoZpPxH5VyhPNSecueRaKg6+AXMGc3k3c//4yZwrCMvBPR5oH7SkgfFHIRdK7jv1aMsU1grBs4ND9g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(36860700016)(376014)(1800799024)(3023799007)(10067099003)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kOXwTON5/4RUGsg6I6PHNBb225jNCdGuP+VpxTY0KGCERIWTIi5g5QiFDdK+SLMD54jz0FTwtdhdPPihnf3Zbq+46cLlnAfWlwp90b0FF2BE5OWmGPglM8HArwUxCD1SFBuriZqrE4Gie4mQQZK/uKedLLZN7MeMEiB3Bdacz6WnBiYYlxLK5a61qvfwG6dV3xo5DsYlHKN4rDGOBmpz16pnbGOarXVlosJC/XUFDAs2yLwr2BHrm4bvv3wVg/6fDjncTtjt6Fvyh0NL8LEH1MssqN0EI9om5qgkGltqUSJiacONnE4zfAKrwDn1vA9DIJ33DrIg1QWi2xzrcwuZ40tdyvBtgMSVjeVx+/GQUESThiEwopnTNbkpO81SciL/dSprXe4iiGL92Ei0VZ7Yh0nKaYr0jzhPR2S9biIG44wTi2uHK9ePc7kzZBgb470U
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:18.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5eb640-9de6-4ecc-72e4-08df1d4b5aa3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676

GSP boot uses the detected vGPU mode to size firmware resources and
populate GSP_INIT. Carrying the whole manager in the boot and unload
context couples these operations to its runtime interface.

The boot code only needs read access to the mode, and unloading does
not use the manager. A short state borrow is sufficient for both
context construction sites.

Make GspBootContext borrow VgpuState directly and read it in the
VRAM and GSP_INIT helpers. Return a state reference from the
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
index be212bbf724f..3272afdb7d1e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -372,7 +372,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
-                    vgpu: &*this.vgpu,
+                    vgpu_state: this.vgpu.state(),
                 },
                 bundle,
             )
@@ -445,7 +445,7 @@ pub(crate) fn new<'a>(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
-                    vgpu,
+                    vgpu_state: vgpu.state(),
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 5b57be7f2d42..3dbc37a3b35b 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -66,7 +66,7 @@
         fw::GspArgumentsPadded, //
     },
     num,
-    vgpu::VgpuManager, //
+    vgpu::VgpuState, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -85,7 +85,7 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
-    pub(crate) vgpu: &'ctx VgpuManager,
+    pub(crate) vgpu_state: &'ctx VgpuState,
 }
 
 impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d6895dc5207e..9473004a0921 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -47,14 +47,14 @@
 pub(super) fn build_gsp_init_payload(ctx: &GspBootContext<'_, '_>) -> Result<EncodedStream> {
     let mut encoder = Encoder::new();
     let vf_info = build_vf_info(ctx)?;
-    GspInitRequest::new(ctx.pdev, ctx.chipset, ctx.vgpu.state(), vf_info)?.encode(&mut encoder)?;
+    GspInitRequest::new(ctx.pdev, ctx.chipset, *ctx.vgpu_state, vf_info)?.encode(&mut encoder)?;
 
     Ok(encoder.finish())
 }
 
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
