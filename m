Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858921;
	b=USv2dYn00AeWbv6j9BADSNX0eBiwYfItU943avKxjJvIw+j/0pHV7x4w3ihMNvzRlXsb
	 pY7XpmPU0jrCmrCtmwwVfdvZgkv4tQcZJZH+6wQwYW4hrVCnJGzY+eJ5lNZa+lgGBsjHT
	 zIAvQqxWNqdxVX6rZUe4/QuG2souwjve8I2E6kov3yT6hlB1fmh5UGlmIKpvzbPOxTlSE
	 Hhi7w0++rDLE9nnQ1Ut2VVqrcANdG7b7Yk3qXSIU65fJmaE68qx2fcPLp6oMJUOMcT1Gc
	 FoqjuSaUsUExQ/XFQ4gYbs3eTAdxB3F+41BRA0HdKMlAEORvNsSsvf1VzBNJLTr18Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858921;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8oghfaelZIBBBTIQoMU3yMMh3RZExv3LFzb/L3EP8po=;
	b=xB5SaUXXGtt4cV+tFln1IB3bLzH9DqqFT7XlkbF6shhwvxsQVK4YF2rCagdJv4wpiPUf
	 UimTD8gqkcd5C/OQhkybRxX25+zvDY63CoKVvIO2lyEIebmEgSTWWnrvq3ZDCMSl+j2i6
	 bwKncFlTs7zCVrlv7wv7xVob4szxRdmq4meiZBeP7/xAYAPqLTi4p6feoDXAtnogfwiXp
	 klefZVjjXBQ0GK70YixNNExtjZ2Qt9bDTjsBCZGpIBqO8Eu7ein4Fhi/Zf1pCRaSOrnVZ
	 eu8qX6f71nBcf+tHxMROVjgoodH9cXVV5Mgia/kIh4i6y4E/2Z4ZyD43T6UCGTgc1sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t7b6bpTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.63
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52744606A330
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52744606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t7b6bpTm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZezGZxWZhpUhraKkSBZ03eovCnVB/oVHjqeG8pgTvCbhgBZp09kyVo92OtpitO2KAqcic2Xy9IAmuRmEOeyW4xvLexHPhe/DU1iwoapVXqcZFQUgW/EcwZo2tqXKOHIVTQDvsRyVAvZQ0flbq+0sThRLDzN1svL0SPNW6Kdlku2YFNXnfrhL5VTwlL27UhcJa+8atpyM18SAXxZ381uGQe9frzZiAfhnOy6935Hqg3o7CBrBQyyONYQsYPHzF8d3P3BoSV+8IlBGiAksg/s0rLy1kAJVXrCNdonVQhwAw/O0KJSSkCl5lw0Yn9EQQ6UR6WJQTQHhSWPBRIjXJzA9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oghfaelZIBBBTIQoMU3yMMh3RZExv3LFzb/L3EP8po=;
 b=Z1fQewh7PyVXCD/kaXo5jvzG+d7SbWZtkal0h/cjzJUhHXox/Uw7/6pDaudnmagyYDcn2rK8sJEO8JxpEpp/UDZb5Dn++qdQy8Og8/J/BtAjGECzLlS+RgR9wJ6Bwh8sl6vz3k1PKhRn8l6mhCdfMXle/V14U96RJPtIoNDb+tWUBXcaB9vHCxhPcUqkfd8D2PLEdwb3z1zrfCBPe0JVQcTedkDafbDQm+LwoW3DA4ecDqEgwDK9jn7F1A4Y6mI+1X6bRwgC6ESLmxUOJHNL4VSMOrh9Msj3VwUFjC4F+KAAF81WwTcoAuQI+dManXf8dGtin5j+yJKR+hs292/FcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oghfaelZIBBBTIQoMU3yMMh3RZExv3LFzb/L3EP8po=;
 b=t7b6bpTmLTAynP/v2DKbybprUduD0tRfSjVNwZTdunYFDPKXJNlxHYefwyZxDGCH4KKtJhgLNZX0aFfbjIV3JhA/Q8tRYU1EaqXRCEpmF1ju8eBfRGly49ComIkbBDTin4J6OcerXm+x/vRZvsDEABh6DNtTjm1yDupI3lp9N5E+IpqqZkex+0yaAIbafVfCpsL9MIIGlrfAxc1/g4IE0KNWBMPWpI4ttz6fV6JljkoIDTeFCSjr5NujBZO77EC8/vUISYFq80aAPyODdqrV/bv7ObpBZe0eO6JTGvk16o8gkIX7a2d5fSsPg1pY7TM8Y4jUlll6b1+UsFrIhVS7vg==
Received: from CH0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:610:77::16)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:15 +0000
Received: from CH7PEPF00000019.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::3b) by CH0PR04CA0041.outlook.office365.com
 (2603:10b6:610:77::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:55:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH7PEPF00000019.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Mon, 16 Nov 2026 19:55:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 11:54:54 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 6/7] gpu: nova-core: change wpr2_heap_params to use TLV values
Date: Mon, 16 Nov 2026 13:54:40 -0600
Message-ID: <20261116195441.940595-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116195441.940595-1-ttabi@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000019:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bc22b3-f9db-4d86-5047-08df441b8855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261022115727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IM6t6tFrz0BOhgjKSzTmN/MvcZa0Du1JQ584WzJrMOlgo4P7onqUrV0d91HW1MvY+W9p0pfiOVYuhIbEbufOw6gRHyruIPPinTbBjfN1HF+Dk6oSOm49/kUPY8PHeZKTIYTUzp0pbXNdGTkJW+kuOEbMVSifrPbU1ksFsrL6mgKSHn03DaWP8cyHtk+YYxDnGavlyP56NpXyP8Lld2IUCFgJ+uMrq5BPEIsIqOqhCl1+AkUizDtyBr1P5ycX14pvc8lSbssPcZo+B6OFpJpN09Nl6O3nJZIxwgYcVEXNM9HN+P5twSpcQFmgMUzUwMl+cW67B/S+lMy1DikQi1s4E7FNeKjtxzzjH6XLVYaVUatyno22pP1TiqoqWRbwozBN7mP3oAZbRURDjSRiuQI/TLz/pCgEgn8TXHOaHCQ+hE7bglok8aJayIwySJAvP+VT89DTIi09+jW0GF1uKHihdBHXDb2MlBaGRnwZWzGTVHCjxbjz3L4dBPIwEY1XUmq/EiYDpi0CE0N+Zw/7LE3uTiWKu8ZegIVX0jUPGCocDJl/w7sqLeA2VQYicj4XiCJfthcsI+gZ9TcLqvWb3fKEMJGcpkdD+OfkQ02mLvnXqIn0ItjMPXz0Zxsaj1R0h/XD9h7zJzeump7MC1VbMBXR2VyC0BrwGui/awUwyxmFRS48ppQkQs64qjcFtIzhtONIC/8eR0gSHlhVjgX4XSYFKw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022115727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AoRoG01nm1V8KxSJ5rHUBPv/v2+XyDRwXVWnCZRGx7hDi89Fr4QUoIBcwy06sMwrSbV4qntOiwZTKbORE3XJkGCbG0JAMzLALkqBIuIm4SmPubfP0kKaqqavHH8d50lBNBVdUHvBagBxbsuJU6jPY22ZzDq+FqwZzrpiZo0FShe+f7nzgG+zX4H2pOyjtnY92F66/psTQkP6ydu3cpLx1Fl1r4XM4zqdvbwRv7qpYPK31PIrawQv7dXznjonyBycay+qPnS+uyFuE688UtoZfn7NjPm3g6BUbkv3oSHDykNSwBhBWiKCRt1AdwXFTo5YcSyjKdUhtodbm9dVORG6JrYjVAWr1SWtuQW3dixK883u3hGVmuiY+DGrWF8v/yxN6rk7gBBZmfBkTOGi/zeFtGjVClqJCq9KJR5h0B9v3SDtG3f4lPYbO7kel60kJYa+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:15.0376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bc22b3-f9db-4d86-5047-08df441b8855
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000019.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

Now that GspFwHeapParams has TLV-based implementations of wpr_heap_size()
and vgpu_wpr_heap_size(), change wpr2_heap_params() to use those
functions instead of the LibosParams versions.  This renders LibosParams
unused, and it is marked as such.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 20 +++++++++++---------
 drivers/gpu/nova-core/gsp.rs    |  3 +--
 drivers/gpu/nova-core/gsp/fw.rs |  3 +--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 048d3c5e655f..ca1cb4af9ca5 100644
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
@@ -298,15 +299,16 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
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
@@ -332,12 +334,12 @@ pub(crate) fn new(
         chipset: Chipset,
         bar: Bar0<'_>,
         gsp_fw: &GspFirmware<'_>,
-
         vgpu_state: VgpuState,
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
index a0277ba6dc88..03deabfc2f06 100644
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
         let management_overhead: u64 = self
@@ -162,6 +160,7 @@ pub(crate) struct LibosParams {
     allowed_heap_size: Range<u64>,
 }
 
+#[expect(unused)]
 impl LibosParams {
     /// Version 2 of the GSP LIBOS (Turing and GA100)
     const LIBOS2: LibosParams = LibosParams {
-- 
2.54.0

