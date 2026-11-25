Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641933;
	b=mR9lXSzJoRmkKdsHutEpnA2ZVmapXMl29M7ut6aOA0T3pSwmHUpaJ6okPBTAJ1c5fDwK
	 2sN50K7BRJJMvJKITLkbiP3TBauhCFXHD1VGW/mzegReqKPu/w91jLK5lr4xUylE0AdUg
	 8GKbtQYkjoDhdbVNC6TEfUT78eIUhBrbra7N0HW+SH+OXswAHzn7XWqFsxcjhDYUBe7QN
	 1QzyHuGjvWPu8RUtu1YVS8p+74PqJuaEcG7Kj7YikIXcdF6y9DJwgh14X/WkMH9DrNRz7
	 W/Xyknk+LgAukbQj6K418awoZeTWm1hP+u7rObkh3MkrpSI6JwM6EP/6YYeNoz7uphQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MOIZfuT7bvwT2+Fe0Ib5T9+3YIpuhqZLinE+n9UMJ14=;
	b=MBsniK8ez4sqywrB1ueMft7w8YK9bnax18h5MpeElDHBcr8J1W4oYOXsWfveWTGNPzwi
	 2uU0rmbyVD4wOwwwrL6oF1xVa5DakJY6TXoJSGO/pXMm4fzfGrCL8nqSmPb0ynIFTUwE2
	 xOL+d0Liw7lxomVJsooCAiccK6nldXoL+3Lsec02BhvSKMxsyD3i0cdX8mwtIz3sViLN3
	 PfJiD13NELmr8fmlo0IecegQSpGEiZm8iAKHk+i0IxsXfB3dDBkeIHJCBX1yeQyryyKyx
	 JuGOSgCI2QBkZYvAse1BFjnC8w+YXNj5GSjbW8F8D/uICpuI0zBT/pibsawBPalJW0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K9lUYUD8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.13
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B7606A330
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540B7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K9lUYUD8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYtRPLtikM2YFJe6kXSoBwI2L82iMP66Dpu9z9x324T1FFgIpIlafJbsIt9uxBeq+aY4fX05cj8KOwibGeeqbGepVh1jmbDoXglj3FicysQq3HJV1VosWWH4mwWm4zfG2i9S29krFR8HKgS3JZNERynvJxEyg4ooE49hY2yZSXOZmCL4zrjU7Aw3FYTLs6EziJqQ/QWOqCRZopd4hIpD0Qc3e+ON4u6jkOCmF55cP6l2isVMN4kjk/pQeyjE5bNN8HkPNW70uDdTFZXGi2eXaY7edmETR8zmtba1G/Qlvmfdncj67sg02LR72VwkX2Nlrm9yaN9mhHl91be2/bONGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOIZfuT7bvwT2+Fe0Ib5T9+3YIpuhqZLinE+n9UMJ14=;
 b=K5JrxC9CUd8uq0FUvyE813y6OHq/ri9hTlmSJyShX/Lhb4WYCjkiR+TB7q+rmJgiXAHTbpX7LkSPL4Jd16BHp/bcxpdITn0JfQOdkFOGQgof9YbSMsYu/JXoqJEEVgN8C54xtaqm4JUmU+ad2GPWAUJIhp4T3g7qXlIvnyLctV0+yc7rtzj8732nSYyJcujKJMPZgIWHn65P94Mg4AnAVPjzoJ6LAqnSx2CEJ43DmhLMzjmMj9yNXumWZ7IU1D9Jmnq8JZtrcSCAjxS2Td5l1RB04TfVXq0dKAR92yDA3OFgg2SOlMpUnh79TZuSKfZSPlHsrAxUD1cIRSKAZn9Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOIZfuT7bvwT2+Fe0Ib5T9+3YIpuhqZLinE+n9UMJ14=;
 b=K9lUYUD8GJfQvHDaSYql8AalG+mnfvxJw73aawGZ9xVq7DoAA9m+AJ/gsPNR+16D6fp+OJz3YDMVI55OgJwfvlFGvbn2s8Mt/og0jlcK1GxW2CArrGqVWirn5+jeug8FWrUH25k7GNup0cHRd5SO785yyGBaHjyXxka4LK/vTPyvLyGST/Mo5/u/lwv3loSWODr6YElsY+WVwqGp0PytOavAqhuHVRO1wIjA0uL9EUtflDvbAbYgyEi65UVYhILIErPIwZzCOM0Tb5yqOedUS8t9nuY1CK4GZCeTBbKZCxG8oMwaTmLRfoIkjCuQ/gTgH/1zQIqzz/9+xSBfJ73IEA==
Received: from SN7PR04CA0216.namprd04.prod.outlook.com (2603:10b6:806:127::11)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 21:25:21 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::18) by SN7PR04CA0216.outlook.office365.com
 (2603:10b6:806:127::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 21:25:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:05 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 6/7] gpu: nova-core: change wpr2_heap_params to use TLV values
Date: Wed, 25 Nov 2026 15:24:44 -0600
Message-ID: <20261125212445.620391-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125212445.620391-1-ttabi@nvidia.com>
References: <20261125212445.620391-1-ttabi@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 0442f8a2-e104-4824-d47e-08df4b3a9c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|22082099003|6133799003|18002099003|261022075727099003|11063799006|56012099006|261022115727099003|261026121527099003|261009223027099003|261021123027099003|261021121427099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	y4QA0y33wFu05eq9/aJtoDGQ5SI2f030Oy5dWwF8xmfRtVQHrcHyaEiJi1hoiXHbsKmJxTizPeMS/JbxeJJ6MUISWxjNfaIIaetpO96vTF6J2AOyp1J+p9RMWemZBriWZluGLXA6oKFoVnLA8kz7UsrlqvjNpaDmhaqYSb/aCuRjoV91lafuo3IKx4Js2NdbgMtmf2oyk1EPuH0jJzHh4wOusaN6XKK2Zec6va8WOdDd0pbD4c1zr9xAsThdHUjf1B867hXAnVSaKiiHnL/dxkoHUBO1t8JX940DBX0tgmnsX2A4gkwzfUwcAzMjDswt2e6OfKsjOOrFyfJanqkLrazSG9xFiIlb+ITIyPFF4cNBSo5K3Cgkov30xPCHhOXx8EBCMdnDl6YZgaUxvcg1P7M/22NhRpawMFRjrPvcVJLgbbeqD86NriyA2AMdJbuwK7DWjaSwrP3yJ5OF/2ae55Mwi3blr6802YnTk4DLBfA879Qe65ElVXSEUFoY+jXjCN7EyKHWpM/oVudz8VNBEWS0+a9+wAud0CAw2wdTbqa8zj4fQsE8w5UdeSUan9W6aKtlIoYcQg8xvklEsfsj37zO5ifq+/WwVoCrMly5ydMEmInHI6IJXmbQd/VxtIHMvWew196INo6+NM+dXrybid9UXbdbLzMP70qBjSaJlHe24bna7OClqKp5tqCkWjND/1TNwtwG80QYswa/lAmiKQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(6133799003)(18002099003)(261022075727099003)(11063799006)(56012099006)(261022115727099003)(261026121527099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ocvs06ZDbi3grFia4NcxNOtnaneL1brgG+pu70m8mjLBXed96jKjMZPiWGR9eNta/ChpnqMCtpdexyGcK8DwIakYqiyrNP/7B6UFc+0Iv3qKnYYK1a7kPlsdQArjOZZKwLOGbOzncfM39RigjHwWxPN4QQPTIEnyTHl/BbCT2IpKAHA85p+qlmMlBqnEXEoJg42Rhc7GgPCj9fbXkZXuGT9E1ZmyzLM8S530rpF7hQnfqeEKifMAeFgMLjJW7vEuGPPACBWp6yP+QMDdVE8BjGenFxWfJflvKUqOQQvcatQ77XpmSqPs1ZQz6K4NQiSGZBdqTu7wieY09YJ/KtS3escwF7m2/97Oj6rMKW1iTYy8I2MeH1wCpJxMKln6YKxRD8mDqql52yrg2R+Xx7MXmyTa9l4Pg0Bfr6hmdBLcOzdssgEKZrWdqTXLSWR3kNgX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:21.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0442f8a2-e104-4824-d47e-08df4b3a9c63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418

Now that GspFwHeapParams has TLV-based implementations of wpr_heap_size()
and vgpu_wpr_heap_size(), change wpr2_heap_params() to use those
functions instead of the LibosParams versions.  This renders LibosParams
unused, and it is marked as such.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 19 +++++++++++--------
 drivers/gpu/nova-core/gsp.rs    |  3 +--
 drivers/gpu/nova-core/gsp/fw.rs |  3 +--
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index ab427c2dbe90..f1f4d1c30f9f 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -242,7 +242,8 @@ pub(crate) fn new(
             FbRange(fw_image_addr..fw_image_addr + fw_image_size)
         };
 
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb.end)?;
+        let (vf_partition_count, wpr2_heap_size) =
+            wpr2_heap_params(&gsp_fw.heap_params, vgpu_state, fb.end)?;
 
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
@@ -302,15 +303,16 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 }
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
-fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Result<(u8, u64)> {
+fn wpr2_heap_params(
+    heap_params: &gsp::GspFwHeapParams,
+    vgpu_state: VgpuState,
+    fb_size: u64,
+) -> Result<(u8, u64)> {
     Ok(match vgpu_state {
-        VgpuState::Disabled => (
-            0,
-            gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb_size)?,
-        ),
+        VgpuState::Disabled => (0, heap_params.wpr_heap_size(fb_size)?),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            gsp::LibosParams::vgpu_wpr_heap_size(),
+            heap_params.vgpu_wpr_heap_size(total_vfs.get())?,
         ),
     })
 }
@@ -340,7 +342,8 @@ pub(crate) fn new(
     ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
         let fb_size = hal.vidmem_size(bar);
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
+        let (vf_partition_count, wpr2_heap_size) =
+            wpr2_heap_params(&gsp_fw.heap_params, vgpu_state, fb_size)?;
 
         Ok(Self {
             frts_size: hal.frts_size(),
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e487efd90b22..85ef94a8b5c7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -31,8 +31,7 @@
     GspFmcBootParams,
     GspFwHeapParams,
     GspFwWprMeta,
-    LibosMemoryRegionInitArgument,
-    LibosParams, //
+    LibosMemoryRegionInitArgument, //
 };
 pub(crate) use hal::boot_firmware_files;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index e59a10beaa94..9ef37e4f511a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -125,7 +125,6 @@ fn management_overhead(fb_size: u64) -> Result<u64> {
     }
 
     /// Returns the WPR heap size to reserve when vGPU is enabled.
-    #[expect(unused)]
     pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
         //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
         let vm_size = self
@@ -139,7 +138,6 @@ pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes).
-    #[expect(unused)]
     pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
         let management_overhead = self
@@ -162,6 +160,7 @@ pub(crate) struct LibosParams {
     allowed_heap_size: Range<u64>,
 }
 
+#[expect(unused)]
 impl LibosParams {
     /// Version 2 of the GSP LIBOS (Turing and GA100)
     const LIBOS2: LibosParams = LibosParams {
-- 
2.56.1

