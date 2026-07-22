Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DB446069
	for <nova-gpu@lists.linux.dev>; Wed, 22 Jul 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706033; cv=fail; b=BuKzjqashhe2fDWtr5wX5rT66CegP+vhwB4erB1jwbjykrikDMdVVk1pDrDwCpeQmq0tJF3bJY2EmAL8yZucQOpBP8Pptc2NE0jWU/p3zqMKAGh30JJjsEj+e9q69NStHe8Do/tS/FpOIj0p4uN3bWT+jTekyL4MlZqYax9Izhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706033; c=relaxed/simple;
	bh=9UkxoMYjaoy6lJ+7xwX8Z7H4rwG34G4JweP27cqrV4Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgOuX8p7upxYKiFQamofmds/5aVUFcX7dw7vv+zig4uOJX/prOK+3v26yr/RHLrDO2k9mHT880zTeD02NZkhk7fCRUpdfakxuNeWeR/DnrLll0us8qS8V4VA4VZ51And0KlX7JCoXQfpIudjkx7/9d2HZuKlPAbDUzgZQmT78CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jCdL1/a9; arc=fail smtp.client-ip=40.93.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jCdL1/a9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB+oPI/j54DJG7Kueu9N0TsnUADFRuzIctSA6dDl7tfuwoW5ijJ2FZjPPCY0oYn68QMLodPugk3nNB0Onhm3vHxEftbdvSPT4clol2ft7P9OmnL3Y7kzyVus+SWXGxM/b7+9gIjFLW1K2qLkBD3qRqErX8ocvXLxaLUTklYNT3yJMRJSm0y2hBcNeTBNQmYD+tYBa1yMe4xZ8G1egVo1ikxR0DL6dWf61c9z5mOdo5OSFuV9Ux5eTklUjJ4kOXnZJLQCB7UoW1QNSr3MlGQBYsyk0dQgniG9Qv8wK3ZxTf3UHdyuwk1SZMxINDJKTZAhmaQNkqhf1UvrUiStzeVdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qygh9AFoYL9hGcvqX4kiSForysiZ9hGbn5SQd9vM9wE=;
 b=rRKdLQGyIgfM3NH+MyIZOyaAkaA9+UIxJbB45bobcH7U6aPaz1HoslzNrsNOZuOt0A16c+6qqqmKoS5ZdHltOqr6sFgPCyFo5+Hdy+K/SgYolx8lJlrBtlKm7Z6bwV2zwaaMVg3K0IJENsiPYf3lK0QRmIJfFKqI7EXWD9NMNa7qO6PknTeLdpiGe4aEya2OnXIzXgGbG3H0SCSHjB5G0o6eM14IheCdUx63uAcL/B2ACC7/0SXiLukzL90Lx4egy3OnDI8XqQ/rMzzf8VhGt0A6AFJ+CgNtyUZW9Vrq78PuyFaHUgpUeo1KvLyuTnl+VHzls3VCa/Yi0VkPtZMefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qygh9AFoYL9hGcvqX4kiSForysiZ9hGbn5SQd9vM9wE=;
 b=jCdL1/a94Y81s9VeWsl0UX45LmaHk3ZJDHzLdcddXSRf4Rm6aF70Td63cDYMfIGQMESfG682KbSozk3wZqu6JjVCl38nDdKCE4WEJCSZC6Myam/6gVeL/KZRa8zLyukwJAYnjzx+UqrKyFqAdMHDQjRh8WQEqflF8JNAlcKnZ5sJE/h0Fum4PV7eme9q/2cWHrPQ+AZ+NVc7TtoOKw+JMsj1UGMojtdevE8NdBTCT8XsMWETu3QKdcv3bVTymn/8OR5p54ynWJq4O2Be4dPqnckc3KXWoYAbIV88pij08kuNJJmA0zFgMR9Vt0FfqZp+kpMF5t6PtiqgxMk7HyEmtw==
Received: from SJ0PR03CA0336.namprd03.prod.outlook.com (2603:10b6:a03:39c::11)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:40:24 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::9) by SJ0PR03CA0336.outlook.office365.com
 (2603:10b6:a03:39c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:40:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 00:40:10 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 00:40:09 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 22
 Jul 2026 00:40:03 -0700
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
Subject: [PATCH v5 6/6] gpu: nova-core: reserve vGPU WPR2 heap
Date: Wed, 22 Jul 2026 10:39:13 +0300
Message-ID: <20260722073913.1807677-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: c8acc0c9-6fcc-4239-bad5-08dee7c47d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|3023799007|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1p7QSc8Ac66fyBWmnmREaH135R53bUgWHFzg6RyQlPOdpIfVKAbiOzLovbq9ZmXIhscLEK62cQSJfOiIM4B41BLE/YuVQEQ06l8Bk7N2f1Q/10vdjS59yFhEOO6dNy5ta4jQ6dyPLJCSmdDMzIZHvqUXlOEd792RyjLpLxd5NK+1dj1VYs2rTl8Rd1U7rPBKbKmup9wcsisQWrOmEwsCe1p4QZgPZc+APN4IcjinoOu+N0jV//5DBVVhD4VVHouQSXHf97NPMrkgwlaqXPvo88XfptLu8wFDRGRimZDsq30rJIN5+s1l7ienD7yiSN0UOOyI1gDEjKwIBySk8acIL6rdek8GjbeL61EAu8pWdTS4rZiiu+AV5Ghllzew1GcCdNkidjTYCkNT2iNZnXGlB8Y1jWKaGPyqpL10j2m7E0wA+a3CiysAIWS9nU68E53kX25znKG06Xxx5e93Hsj3CAfcbGzq9pLp60H0WjAX1qE1nCVGqlQCyyCDFWs7F+oZnz+/HX8iVabLBEcizcqDjukQ0F/z4U6MJosF3rmldZ1F4V2AGwaTmHpuRHRTNYEA6bM2sCfcXtD61M59EmGX4tINPVhw2ieLxyuHFDNZHeW8ztsdIcc9HbXy4nOCtXLuzCrJIG7c2uQXp9ql8yeaT1lXCc2AVdChM7a5yTJpe7nO6/RqTnpIcu4PGjxK8qycNV0G1CZ3Xh8L1vHNx8a6Sg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o9tFduBnlmuFNhTqVjaZTYUEaJATqKOAEL/3SNBlN46BZPsCE83bvV8GQm3mwyrzkaN2OJNj3ERO6HLWNkfWVFVzxlx9/1CG5ceF3TZg6dQbZbZBcdQ5FwIVu/yV2X+YeGhSlDEqnm6OV53JS+rWmYp9Z3NXTKT1i0YAlR1EgZs2ITYB0EHIJr6sCpJIDX40xzVCWqBdgPHDsfPM48E+nudVR1Cqm78xvauSreN4YXr+X0mtqDwDkCjyjd3d2dd7jJRYnO6/T64mK2DTi+JF0uOvcI0EQc468Ng4YbQsxMgA0PDFqrWPoMnWoly7S2z8sa1rGk99pDefxDAG7K81ZJJfrOrn8cNPIY8dNNFWVWKFR1CKNyPIhB4LCmKyfhNf3gBF+Tylu44E0OY7S6g2N2vmmxnxXhtIWIhUGErax5ZVrsI/4LqtNw1R2ez+EQdg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:40:23.7840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8acc0c9-6fcc-4239-bad5-08dee7c47d7f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191

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
 drivers/gpu/nova-core/vgpu.rs                 |  1 -
 5 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 273cff752fae..fee6a3e11dfb 100644
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
+                u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
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
index a2e8342e7760..727b8ae4bcb7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -50,7 +50,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu.state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 166b0c69edb7..6e8e7d822ef1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -132,6 +132,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
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
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 5359847e2eb9..6b7e045acea8 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -26,7 +26,6 @@ pub(crate) enum VgpuState {
     /// vGPU mode is enabled for this boot.
     Enabled {
         /// Total number of SR-IOV VFs supported by this device.
-        #[expect(dead_code)]
         total_vfs: NonZero<u16>,
     },
 }
-- 
2.53.0

