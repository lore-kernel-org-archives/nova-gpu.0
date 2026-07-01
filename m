Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7653ADBA1
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887306; cv=fail; b=Gcm9YCu3Rj+7u+stHV3CPdjq8T+dNIJ7jP6es4Mi282FH6IyHI4UodND//LvKvUV/TCIPisp+yypgOWNBbHJR9yp9Nn6Mi2kf/opw3RzRM+ABpTRpv/9H80n2XDIaTkLhx34jDO6GjH08YrsO0MeNcmevfv/wmL20dCG9DPicLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887306; c=relaxed/simple;
	bh=ry7bZJkI1J6mGY+zxDqDLKynFMQAadgMg7h4Py66Z30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7fXNmuSAqCeEDa0vUrCyYpnzlHRZKqWyrIuoq0X9OIX9wO2w4VqsgYfWlMWzg3w2BCM3q/bfZ9FYhiA67NeUiNsP8cJlsk5lb4ZLq+1CLLjFGZYOANB68lhwfocb7yorB0b3raF6a3o82X65LvnHaD8R044sgrnOK87udFNe+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NHWPKXlJ; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHWPKXlJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF0xi+CcUep6Xb2gWZPJrVTCbJnwi0zOzHdnftY9cgvWuybQWGYbxFlai33Zcn0+THD8SpF2E4O3vogU7UP1Pppc4FuL/pDa6ttYtxi1zzBE0W7mpjJ4RjV3Eu8rM1JwsJtTEUZS0Ze0FQFb68c6G2uH9Ev0RLFENxOqlS+ZlLivQ3E6W87LDvY9RAq6Jc+Z1DYtQnoFsbwet0In6y8jbQNncxh4ffnvwycjuebR69WShsBFw8US4CgEAPUC0xCAeM4zJjwTwLWyS6+jybswX8XA1Sf3qsjWB4Zn+F4Xq7vk+oxuEKOL7IP90r0SaBFIf87KGEyIXUnAgpCsymv7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXVU9m2Os0wEI8hz5AajAjbyO4QHP6jGbkaGtccHR30=;
 b=MpBgb6m3coYqxp7jqfz2v/nsjfE6JSYH93jZoGW2Gm1Itv2+MwfAlwJS65lazvYekM/l8T9Y7QN9rmwPhp8kHnqLSFg1yC93z+50x+KbRns3m7yEM1EonodNqQnl/DwMW0x848suWWxaRLrEoDfqayr/v5mZUjRbJlJ8rDjh6qxzJgT0I2+K084kyYnT5KXnv4M8R7DSvEYWrhoGALV43IHS1W+VuN4UxWHcWapiUu9pE2431aYfHtpUXeAyK8m45ZfK+t+PqQXgQE5t3BdGaOw4W07WwBYYHSTCkoqK2TUgMKxAKZ8M2nCi3YAVOXoGNC8lOhQTQpj7VgYueE/W+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXVU9m2Os0wEI8hz5AajAjbyO4QHP6jGbkaGtccHR30=;
 b=NHWPKXlJoJIOIIBv0whSY0PRuCLL1u7pV1/koP5hUrx/t3+Qj/8HerKhafbLz8Waxz9OB1XmpQXOKLBEreUWSpntAgZIlKQr51Byouvp2OmIVaNrEUO78+LQfk/vwofUhc9eRmYMwiheoOk5cGOwWVGJfYK4kuQIJtxkuAqhIxRM9+bpUWMQJNYusF9c6u5urzYtuP60LmF1CZv5RkPNsgGk3QUqP8WFzrpevbORK8bwlxZkasskuH8lyyo7YHANluE38Z4cHYQ3xFd2dUHAIwze4AzJfMRspA1Z6RuAHvgFivu13lqO6eKiXTv61yEABiC750rELHqXQVNYRSARKA==
Received: from MW4PR04CA0041.namprd04.prod.outlook.com (2603:10b6:303:6a::16)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 1 Jul
 2026 06:28:17 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::ab) by MW4PR04CA0041.outlook.office365.com
 (2603:10b6:303:6a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:28:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:28:17 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:28:02 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:28:01 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:52 -0700
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
Subject: [PATCH v3 8/8] gpu: nova-core: reserve vGPU WPR2 heap
Date: Wed, 1 Jul 2026 09:26:22 +0300
Message-ID: <20260701062622.3499033-9-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f71cb18-8aab-4449-14ca-08ded739eff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|3023799007|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	QvlpWkPRk9bmPfYYITzNh49NLxLCTd10vg/GzTxDxXDFj7RbXarFwaKQmdkIst/+KXahC4QwYbybBmf1lugEpZ41MYEHAd/13WDF71wcat5SqmK7CAj24smhopmJxDVUz7asll79WVhMgZ8yw37PJBL6JSGymHSDn0imkjVaKkVBEIXBs4TYusXyTJi0o8sui6f5iyqitPznuOx0QsskF8ge6m9q3TeC2F6FVjELZ+HGhEEdQCnJgTBVOij22tVMqeCTqagkFqQ4dbliFNPKLhX4+dq9ncVj5342za+0VDS8FFQoXPvIOzXCxhf8+wotAvX7B1ymZQj8jy0vALFl7Qun0ATz0KhS6Dm3UiTDDVMiSOzGH42poe/yo6tfDm1E9X1lSbxaFzjCNtKV3Ac3x8DpcByorbJI+UNMTxxGd0fejKFlqcNH/cB7DhZermNQ5auHR/Wp5AvZsCIwl0gIewTwo+61HNNtAnoA4gn7fXQYQBWTmRaEwY/0YLPv703d4/GvhMMSc9n4kSnqSEqcwY7d7+u5ib2YHb7iI4DVejgKImPRM2lTP8OLpE4sqkZFNDIfPrQuTjUwX66ZLFzYv84JMF1XJKyfC3bLeBYGhKyqd9AvouPOhoWT4yjKh0HHw3e31oAUUddD4BUSzThbZYw9BoWyL42WVZYf5DYr8dT9Z4aCIGDtUD2p/wVJZqunMT8+Szpua9lanrAkAcIjdQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(3023799007)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	quTY0Hv56zutbFdpx7byeHZgJhzT1Zcv3MTwJt2X+pJS5zkqMf82b7nkLuWabaamaqUhotKsLCyO2xA8JIzN21aW3YwtqV5tJ97L2Jl842XjAtOVq80G9+VuqxZv3b/qNX117Dwkjwrx9UiOQgHmumI85TWz0bR/DMhV+W40Mpyyy/jYpnpPcOGoVr3qjLZImtVkxhMLbmmDkvatk3AwW5V33CgoP8VHByq/fpzcuHV8e5FkD9+4YGJVjvYpneSlOuE7rhEjzLhjomZa4/vOXsEvHiQcU1Amu/JAVVvJsEXg+MFz1Oi3nUllhOkE0/hjRaw0VZM6IA48/s332agRU+53F/qovcHKXaxXU7ekvxIHQfuVJ7zD/ciqwPO4/eBHWaCOOKt8Ii3G45uiOvy0SqHNJ8tmeyY98HyanP2DU6tIDQw5zZFdVH1DfzKV71Ft
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:28:17.1552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f71cb18-8aab-4449-14ca-08ded739eff3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602

GSP-RM needs a larger WPR2 heap when booting in vGPU mode. The heap size
is firmware-dependent, so it should come from the generated firmware
bindings instead of being open-coded in nova-core.

Pass the detected vGPU state into the framebuffer layout calculation. Keep
baremetal boots on the existing heap sizing path, and use the 570.144
vGPU default heap binding only when vGPU is enabled. The same state match
also sets the VF partition count, so disabled and invalid 0/1-VF states do
not enter the vGPU heap path.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                   | 25 +++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs             |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  5 ++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 273cff752fae..e93ec46a6602 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -23,7 +23,8 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::FromSafeCast, //
+    num::FromSafeCast,
+    vgpu::VgpuState, //
 };
 
 mod hal;
@@ -171,7 +172,12 @@ pub(crate) struct FbLayout {
 
 impl FbLayout {
     /// Computes the FB layout for `chipset` required to run the `gsp_fw` GSP firmware.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Result<Self> {
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        gsp_fw: &GspFirmware,
+        vgpu_state: VgpuState,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             FbRange(elf_addr..elf_addr + elf_size)
         };
 
+        let (vf_partition_count, wpr2_heap_size) = match vgpu_state {
+            VgpuState::Disabled => (
+                0,
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?,
+            ),
+            VgpuState::Enabled { total_vfs } => (
+                u8::try_from(total_vfs).map_err(|_| EINVAL)?,
+                gsp::LibosParams::vgpu_wpr_heap_size(),
+            ),
+        };
+
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
-            let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
@@ -265,7 +280,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             wpr2_heap,
             wpr2,
             heap,
-            vf_partition_count: 0,
+            vf_partition_count,
             pmu_reserved_size: hal.pmu_reserved_size(),
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c0513ab7f4c1..bbc4505763a9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -63,7 +63,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu.state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4db0cfa4dc4d..e8b33eaa97e7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -177,6 +177,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         }
     }
 
+    /// Returns the WPR heap size to reserve when vGPU is enabled.
+    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+    }
+
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes) for `chipset`.
     pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index ea350f9b2cc4..afe3e007f088 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -40,6 +40,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 = 14680064;
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 = 609222656;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
-- 
2.51.0

