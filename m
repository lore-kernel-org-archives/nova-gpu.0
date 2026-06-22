Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E8235358
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157566; cv=fail; b=pETKtoCwmRFAP60rUSshj96q+k+DqSIOqRiMDwE3M1f89tnUVQ1G+P/sDv1GRtKM5tWdcrg7L89x2peyyzLutPVj3vhfZHciL55SMJtAPWYKe65qlMcHOqUB3Lq6uese01L8ROGqIyxEgA8/GR/FvTN5ZK4DIDAREHArGujKaf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157566; c=relaxed/simple;
	bh=d69+mvNzFZmr+DJYf1krxROWr5DFpbXx+/bl68AQcpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+V+dA1Y4cv2c4W6H1chr6hJjRD5bssj1Svh1lXOI2Py8OZLZh4eBVt1uD30D3zoUJi6+m/e5ZZebhwDMVFEri14qKKTw612DMBZu0lk29HdYNqdiZ8WtUYehZTDYgZD2Hx5EBM/ju9epPBamtsuLLRfNr8qR0D60p9GNc+3q/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=htB2JJJI; arc=fail smtp.client-ip=40.107.200.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="htB2JJJI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiPiWJ5SVk7i2YZGNTiVB7XuoA8mCYFZ+vi4db5ear3+f9W2K/SqjBwouB8ci7IBUiwYUMBJaYbLRgI+4E5gOZ5Q07oksXqW9uKSXHwR7hPw807543I31N29fhJv+Q4KwBaP5xpaHpKGvH7tcb9KXf59esSsqXRMaDn4ats3CJvJ3vFs1dl6fWPZCY7vp/zOhX6YSBSc6/wd0ruVXtABfz5cYtwYtcUAsBFXVGWV7MFler9wQ+esxFvmjxY815abaVOUnJsOji5lZHkTlstOXa3mgBRvN5QlXQqzuGP1KtXpjkOVgKORaRLv4CMRlwylOazqaxlkS75OhGXXEppFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGX3t9dO+kp0ccRzaZNDjZxr1EsE5gihAu/h5syVl6A=;
 b=QIGsYHmf8cu3RX3kw+BFnAOVk6+fjbhF2MJMp7CO9/zqFVlFQHo316TKClCrVa2T8DCyTx3laBYORpdKYgKyBQv/TaQQhdKNLkxByT7ACNCa8x9wZS5ZLzBQ5K8X7OT5FlyQBtqmjxOfr5QDJi+t+iWDhjBUdAKjRy3/Yt8DbMe09GYjH/MzjZfyxlrLnuFmjVmQdz431/OU1Xgf4NfMFTexg8hbM1hEQhINQM8M9vKZi1OJA85IPNfrbdE/3+LbeDFmc4FjgGwaOJF9DumF/yH13i5QB9CbvnZ7vpDrtPIY2MHHW0WL0JraGvWPgpnP91Kp1Gy/wjpScywGNpNZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGX3t9dO+kp0ccRzaZNDjZxr1EsE5gihAu/h5syVl6A=;
 b=htB2JJJI4NCiLdIBLsSuTIdwaxQvEqswqSJa8Vxe9w/59hTjghD9QuAFAGIAB5Cgp5PDoJ0OGXeJv0YX9o9k6XHXjFAAgEIqQhd1ieVleICX20PEpoHlQFmOvTPMrJId7NdJd4rgvlVu8l9BzbpnNnaet+dIgU8a+azmONOKXsi4nMAYZSs4AYa614qxqgZ8tISBTjkcrC93kr1GW1iRqQtf9Gk32ThNb+M1SL/RBu4YJMTSeYL5ffdaaXo04JN/Vst1sZr88BXsXqEWHe4vK9xcoO9hzE9WxsK/Klu3cF1SfWnocdtmKfF66cJIgXPcnLUvgzJCcxL3khbVD7QkCg==
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:46:01 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::59) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 19:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 19:46:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:33 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:32 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:45:25 -0700
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
	<zhi.wang.ai@sent.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v2 7/7] gpu: nova-core: reserve larger WPR2 heap for vGPU
Date: Mon, 22 Jun 2026 22:43:53 +0300
Message-ID: <20260622194353.1308872-8-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260622194353.1308872-1-zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: dab560f5-ee40-439f-1250-08ded096e2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|22082099003|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	/w4tnpoCPeDShvnzr1TcesweEQW9rHtI/cwyEk2j9oVj2CpBYhh9O/fox2hdMfw0rSOxDddc272/fkguZPg+EOund1arzmplod3mCVcgoRQDGUCJyeF6y4CjaJFKapDBLm2w1gzywjJNK985PI8XQnpSzhFdqSylsuGtzNAQpxNtOucZi3q5X8gYu6RIXDj9ylaICbzytcVKJyQvtcwFNPQ148rZoh1zcMTr4aSxaqlAQay8mWiCXQNzAd4JrsfYfJlVpcEuiezl703VmE63lUIAyq7QTUvgoUi/10EXi2/eTIzQC2DaMg4wTqVgHpcy/bo5/kDjA0/eyONGVTlKHIT7/Tbb14BqEWFKFlICJvd2bX03cW5LWgcXXEIpHYY0PEoYPR2PCKGYPjEITn2Kgx1R1L4AuHzHQLhxkNDitmCaPzsYVWuLCrhl0EoOxeLUtYE7ty/QYj3r+u6IQCDVEwXrI+gmmHQPqZ6Z3EklT7V9q+3FBwJ/pEtvRdeZUJKvu+epY9Bta5hixiswiEnMZFYPmLXCh2z+eQgHDz5KviJWJmiP/CzTynCQOyre9W+udn6xkuYeWWbSJmQUXE3wt4FnphnN478EA1471fUbW3uFBlrHFHtzAokwhyHmjyeJluhw99OfIcgWu5BPoimn/U1DYdVzCQJ0yPfCEpD6Ar9aDBj4f4QT8Ul8gIbA+0mZzI0daB1O/NwvN34xtauNrw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vITJAFI6yJ5PjwfxCpD0czSa1lGV6/efwrvWg4LFmlwj/SYVOoj3GsTu9itgwmb8P44gBFv9jOh4RzuEkPP1rbbjNEPWCg8rR8gsK4tT7pTz/C1/r+T2T1ifosgi2QktvDiTlgErAf7yIhBVBYS77UtL4ENkgmCs9EN6SQqyFR9AhHBILwmA5sUo9rYINMwrCp358VhSmLyKgA3t1l01SawUvZsSFZ9KlGPezMTHZVx19LgIIs3D3t2TWvBn/bPcd1g0f1FjkYXp58k6gLJa87L35QM1F58p3vUmwGXnv/O89VDV7AemcUmtVXaGiaPjVLPS/cTN6B0wP+zg147+CtMWQtRFS+eIfVFOzd5KmFoJKoafs8C4ibd1opi9ACAfTPG/U6AuViH42LJ9wZJWldLr/iuq3mPKjae7q1tTzzdC4xkK5g8JZo+QQFIlwPi+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:46:00.2493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab560f5-ee40-439f-1250-08ded096e2f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425

From: Zhi Wang <zhi.wang.ai@sent.com>

Reserve a larger GSP WPR2 heap when vGPU is enabled, using the VF count
reported by VgpuManager to select the heap size and to populate the VF
partition count in the GSP WPR metadata.

Use the baremetal heap sizing path when vGPU is disabled. For vGPU,
reserve 581 MiB for up to 32 VFs and 1370 MiB for larger VF counts.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 25 ++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp.rs      |  1 +
 drivers/gpu/nova-core/gsp/boot.rs |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs   | 10 ++++++++++
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 725e428154cf..b5b1f6c13edc 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,7 +24,8 @@
     gpu::Chipset,
     gsp,
     num::FromSafeCast,
-    regs, //
+    regs,
+    vgpu::VgpuManager, //
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
+        vgpu: &VgpuManager,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             FbRange(elf_addr..elf_addr + elf_size)
         };
 
+        let vf_partition_count = if vgpu.enabled() {
+            vgpu.total_vfs().try_into().map_err(|_| EINVAL)?
+        } else {
+            0
+        };
+
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
-            let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
+            let wpr2_heap_size = if vgpu.enabled() {
+                gsp::vgpu_fw_heap_size(u32::from(vgpu.total_vfs()))
+            } else {
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?
+            };
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
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 6821008d48d9..a159f36bf704 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -26,6 +26,7 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    vgpu_fw_heap_size,
     GspFmcBootParams,
     GspFwWprMeta,
     LibosParams, //
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c607081e8242..dea028f4b434 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -56,7 +56,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4db0cfa4dc4d..2fb72f8dc3c9 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -101,6 +101,16 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
     num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
 
+const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 = 581 * u64::SZ_1M;
+const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 = 1370 * u64::SZ_1M;
+
+pub(crate) fn vgpu_fw_heap_size(total_vfs: u32) -> u64 {
+    match total_vfs {
+        2..=32 => GSP_FW_HEAP_SIZE_VGPU_DEFAULT,
+        _ => GSP_FW_HEAP_SIZE_VGPU_48VMS,
+    }
+}
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
-- 
2.51.0

