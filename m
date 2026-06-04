Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B4425CF0
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573547; cv=fail; b=IEb/g/H7/v6ogibfLP6FOyItAhCf3jc4H8qAT6laJRUF11KLCjVBN0TUIV8dVPEGq8S8to0GQyB4CM22uLx9jAvLgg5lYZVJF1KxMVzlzwTKVvxiHKK8+HCkP2RpGY440ZHcSHoGqyZ5ygwLNUcQYwN+J3mSZyvYfpplOoaznQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573547; c=relaxed/simple;
	bh=tqyHzVR09Is9CjwLbEnixQPQ3zTEQOnWKmtpb169c0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxs1rdOGrXfK50oKW5+J2klJthzlqseWwRJmDxbyANMg733+OhOGJSSfBHWYO4hgDcn0o9bgSd2XiTqtZNxMVDA0xS7Tia1+N2HZW3112SYRQ1KNvK3EPQRh5E+3d8cI6u5l8EuykowK3w7SyytfydMI/gp39yrQ9j3w8IKRPVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rMk61rjt; arc=fail smtp.client-ip=52.101.61.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rMk61rjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJhvvRgRUW2sivdE+/KSqMzl0N70+7z/jdnYuCMMvSvb9MdvAMVJOBWiTP5jiP7DstzvDK5Q7dGQxECQZKYccPE5KpzRZBY3ggSZyNNyg4BucwlgRgBzRIZGCBqJ+atmmX9490O/2Pakl8lP4yCIFTLXF+oreiNywtv0MqpkiD4zEwfPdlIDjzKK38k48gJgbas0HoQFB0AQ7sFsVS5ZPWRfnPugFdAoUVI5LHJfcTcKIvtYOFkxE9UxA07LoHJ2IyFbRFLYmJ7Uii5yEpeH49cDR6Y1wGAyeLIRTKS5wdayQEmCw1jdlkpqoexxwidijF5YLGJ9JiHflE7tlX/Zig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE6ab6MRgg663SRz4TyeW8izh7DtPgXOKFQWwUVNEV8=;
 b=ae4Xkkw5o0sZnWZBuA6MnV4zapvG+bahn2Gghjz5bH8T8eYghrz8FTh4sskBO1vJENoc77G998zKKC3FhenLGu2X70sieDQYXB6/aHNfD8EkE2Uik7qGTB05mgfOLPG1GoqE98iho+ZsG5tziCeLrpfYmznGljrgOULwn+XQ3JWvgXRDNAwI1kiaEjDjuMH0b8jl1/bc+DCKFDLS0qY+lL2pRQ2E4eHs9OUk+gBBMMb+bzlxRBB3kmGefrSBlQ832pZB+zj3tcB+czxjiuBMPQ61rIliTY/ghAoh3nAQb9w9ckxIrNK9AgqYlW1m1lAQM70PTocXAnruAgpQ6eX23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE6ab6MRgg663SRz4TyeW8izh7DtPgXOKFQWwUVNEV8=;
 b=rMk61rjtSo/xidJcUvYnDUMgAbkRJvofcoua+wIh8Sni1I1pLofv7w63LQD3C+puDVqHxDAUbwZnpxsI4K+wB1ycbCHAcs6tplLLWac++rT23AF1S0+L7QSdNOXyk5dey0DLUHaqgz3g/PHKpJZca6Z82G9IhYqzwsouuRfVHFYTTdOyhv03hWggIq37qIZq4eaeFXQPzcNUoHOmVzUuh2r1JS0fcEJLXvDsf3hLPajfD2NFIbfiQasQ0qPztADznXDjmMfZr8mQyc8FTEgtsJh1dqtueeH5HyxJ7+GYXzxKs1OEVvXvtBbx6jGFPFk+Bol/0TcnpQ8LtxYYvLOZ0Q==
Received: from CH0PR03CA0321.namprd03.prod.outlook.com (2603:10b6:610:118::17)
 by SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:45:34 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::8e) by CH0PR03CA0321.outlook.office365.com
 (2603:10b6:610:118::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 11:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:45:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:45:11 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:45:10 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:45:03 -0700
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
Subject: [PATCH] gpu: nova-core: reserve a larger GSP WPR2 heap when vGPU is enabled
Date: Thu, 4 Jun 2026 14:43:39 +0300
Message-ID: <20260604114339.1565660-10-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SJ1PR12MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e7df1a-0006-4399-fa7f-08dec22ec9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DKXFB1D/hzvyDzSnN9FtSOa0Mc7mH7eDhSWDaTuJCHfwJi6sRu1MVE1W4881DG+9oihZnkxquA9p5TiFbGTuTfCYE/LmbVhVyJYlMie/LJswd+2WH6k8bzlQnmUzVG7GOB9nDtTM+lVDspeNQf7bfmqtfWAcNTcrKmlY+YN9BvWL1NXvR8ZKzb3NrfhW5SU25f6ZIIAuAUfqvTqPxR9b5bJlTdPIyOUtZLv3z6s666Me8lGVESC2Ov825givZYzGtDiPScU2uPHwfsMdroPtKJ9xkcET4c+nsPvDZ5kYB/zwTtqENvnCMZAg1lDndDQd4ojBkr7+Q+Va8JSg/BqPiHRlsfEvLz6OXC9KRFfer91m8Uv651WGA7Q1whaKQa673mxvJwdi4FiCgzCSQBamOJ60hpBDskNI0ONXVgAKq+1TtmXj2CvEBWYvUZPX/hsBhPsTSqLIIkbuzuDkCf9ErdCKly5YAcW+e3bCmjgrnQm9OpVd0YmOgHlgnY65LpaHhkZmQWvBCS/Xr01gw+CJR9PMskvob25X0iKVDjHSaRD2ZpVCoUhx3znaq3WXnKvvhkDfQ3uH/GbUOcgpNgr41M4u5rqIcotpespIeRptz2GR9ZiK1oE11UHw/KLkrK/ug94+nvYypEQV1f9bbNSDgZAG39wgzq0X+8r+q1zc8/lfjt0KSVCx0ubgCht5mLosHBTMolJPECPe0fb/O+btc/6bD9mhjo8YJcKVYXKCyFI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R7w9Rb60Rw16rntwfle3hoZxTjnjhioisjuesZytBswS3w+eJxEl5oO8sduT99fZi9ChSIehHDejtKciS3UZmEzVU4ik5adNCpRFi3VmIkx/ei92CrStGmTcif5UYqoT8JDCd8YyZckvHU/6s77Q27TIjm2VBvAH17YUUIOFOaaaZdmt/9mdoWHbAPQd/6Osse/YCNipWOURlp7y7vhhP4moJhHHgdhIPlLW38zAP9d/CJlIABd7RoSU+rxyLRfZCM/5XPnxywO0mdSeJH9TSMsw9ThISdVYl0y9bkzn2rCDYblY2scRkAYrDILmZcrT6/zELEiEe0WqGN3rPbFf4qfW3vUO2+wYmOiq48w+r21Af1ND/hfK7nqZ20uUYG4qOgM/e88sPMkibNDxuMBm3TFtS/MKpkCGkoTbCE45lVghCYhaiMHHLNqSRCaWZYIL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:45:34.0455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e7df1a-0006-4399-fa7f-08dec22ec9be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292

GSP-RM allocates independent RM sub-heaps for each VF partition inside
the WPR2 region. The default baremetal heap sizing is far too small for
vGPU instance, causing GSP-RM to hit out-of-memory failures during VF
initialization.

The host driver must reserve the correct heap size before GSP boots,
because the WPR2 region is locked down by the hardware after boot and
cannot be resized at runtime. The firmware determines the per-VF carve
from the gspFwHeapVfPartitionCount field in the WPR2 metadata header.

Select a pre-calibrated static heap size based on total_vfs (174 MB for
1 VM, 581 MB for 2-32 VFs, 1370 MB for 48 VFs) and set
vf_partition_count accordingly. Extend FbLayout::new() and
GspBootContext to propagate total_vfs through the boot path.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 17 +++++++++++++----
 drivers/gpu/nova-core/gsp.rs      |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++++++---
 drivers/gpu/nova-core/gsp/fw.rs   | 12 ++++++++++++
 4 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 725e428154cf..fb4e6aa9fda4 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -171,7 +171,13 @@ pub(crate) struct FbLayout {
 
 impl FbLayout {
     /// Computes the FB layout for `chipset` required to run the `gsp_fw` GSP firmware.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Result<Self> {
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        gsp_fw: &GspFirmware,
+        vgpu_requested: bool,
+        total_vfs: u16,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -236,8 +242,11 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
 
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
-            let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
+            let wpr2_heap_size = if vgpu_requested {
+                gsp::vgpu_fw_heap_size(u32::from(total_vfs))
+            } else {
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?
+            };
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
@@ -265,7 +274,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             wpr2_heap,
             wpr2,
             heap,
-            vf_partition_count: 0,
+            vf_partition_count: if vgpu_requested { total_vfs as u8 } else { 0 },
             pmu_reserved_size: hal.pmu_reserved_size(),
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 94cd4a784b79..921b92c9eb92 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,6 +27,7 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    vgpu_fw_heap_size,
     GspFmcBootParams,
     GspFwWprMeta,
     LibosParams, //
@@ -59,7 +60,6 @@ pub(crate) struct GspBootContext<'a> {
     pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
     pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
     pub(crate) vgpu_requested: Cell<bool>,
-    #[expect(dead_code)]
     pub(crate) total_vfs: u16,
 }
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 2981d02d15ad..7c1f3f962fbe 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -111,7 +111,13 @@ pub(crate) fn boot(
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(ctx.chipset, ctx.bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(
+            ctx.chipset,
+            ctx.bar,
+            &gsp_fw,
+            ctx.vgpu_requested.get(),
+            ctx.total_vfs,
+        )?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
@@ -138,8 +144,10 @@ pub(crate) fn boot(
 
         self.cmdq
             .send_command_no_wait(ctx.bar, commands::SetSystemInfo::new(ctx.pdev, ctx.chipset))?;
-        self.cmdq
-            .send_command_no_wait(ctx.bar, commands::SetRegistry::new(ctx.vgpu_requested.get())?)?;
+        self.cmdq.send_command_no_wait(
+            ctx.bar,
+            commands::SetRegistry::new(ctx.vgpu_requested.get())?,
+        )?;
 
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 14424a2c2d83..2f3cbc5d5114 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -101,6 +101,18 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
     num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
 
+const GSP_FW_HEAP_SIZE_VGPU_1VM: u64 = 174 * u64::SZ_1M;
+const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 = 581 * u64::SZ_1M;
+const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 = 1370 * u64::SZ_1M;
+
+pub(crate) fn vgpu_fw_heap_size(total_vfs: u32) -> u64 {
+    match total_vfs {
+        1 => GSP_FW_HEAP_SIZE_VGPU_1VM,
+        2..=32 => GSP_FW_HEAP_SIZE_VGPU_DEFAULT,
+        _ => GSP_FW_HEAP_SIZE_VGPU_48VMS,
+    }
+}
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
-- 
2.51.0

