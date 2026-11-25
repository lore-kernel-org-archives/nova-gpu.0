Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641920;
	b=TgZgQ+NIdyYJIXdf235Du2uR520TTf0C3alGaBbIe7AzNlouLwFODNtvK24S2de5TWY+
	 2ghNxMtVLuAvYtAip4HDkmBg1hjdH925fhCnrZPdicGJdC3pAOoUhFZEmq3DfSUE2rivg
	 riWcU88Hq1163T/GttHyv5CEsfbHgh+Eeff4u8W2BxYX/j7IGt7aFG+Pps0r1i9J3cydy
	 3R/kyo3a86fGNRksJEo5n9nBP971iJlidaQZSlZ7eR621HtK7oJOPwr+7gzUKQaDw2Nv9
	 LnFfhgriYeAzon1JeJiloX4uty1JIuzX71j0nZ3btn04TlinWl65SHrHFqeoEoGMC5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641920;
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
	bh=hTfst9rp7ertK90guOYfuDGGDIE9wygbpFMBIvg0kwM=;
	b=Z8FqiqHJKVaAy5FpT6naoB9bU2ib6A0xqiVtO+kr3gM5MZpi86InHoK6YqzeIwCmAOd1
	 mg4TLnFsMvvCfDGbYN4O/ygnoLeghj4VXfkU2YovSmVTANgfCTVorUASQBhJZ+wHdxhI8
	 xJUYfUBhJocPWshSebLwVppyTKUxaI+B25Ld+LMolO2nySV9yX4YoRbsi9AQg/DPJ2pZU
	 nDaBU/AsSgMPH2nO/wSUnLjIm3j1UuQrYvVnW0H/xkEus5yrFOVUL11r2YlzhfcKX9u6j
	 OCBXtEsjpKWtHQfX4/ZBBk1k2zWfjAPQfpilyCOaN24z6+5mAWS/8cR0gkzD7w0YE0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SXYFozzY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.63
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E58606A697
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E58606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SXYFozzY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btHsHriTz2t5l9lu5/OJ8Ji8zfWE24BajWLF9XjYcbpVOlil+jO7xFBTGqBRdyF3ajJGzKPxeU4z9ZLICQBLy0v75wzH2vaHXirYy0vCTtrX0jcWUIEVJXRGf1WgjlrEPgCfG+vbmcC9dHHOC9cAjuZWUK2jf7YcwZFyk2gnIjKW7yilfdmUyJZHbsEUAFGmuiB0Upyxcx/1IoHaSM6Z9oDa8cGhlbAUKOdzszryT6RImuq7/oCBOMXISdECnvR9BCqdO4lznTdpSYf3wsL3CB2r2WnFQ22S9KWa/h9ma/xjqCa4KBb1ZSVQJucCnb8ysvlsAffYyuGldeGETLd2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTfst9rp7ertK90guOYfuDGGDIE9wygbpFMBIvg0kwM=;
 b=Q7SZu2OI1zRp4G5xhPkRW012CtJbwcYZqWLl/0LM+7fRePbIAp0K+TcFF/jN/mOx6yegqJMTt8EklnFFIiVEpobdNPzZU5ycB64UppKOC+PySpl9u7zeXpqNBl2JhJDQ+ADXGIB8ziDMxulZZ3tjbiYgaZE3ymOdZQ2F9s94yG4bFqk7PCd/N8gHSLIEGPm84DAObod1FPgWQQf55MZnQrKZkQSBySqc1FJVYwRwD7PArB1x+a8CzJeh6HoUnJtZQXRdnMmcKcr0DR2Cu6JL7oowFge/jAC+qU4h7UZwYIPbB51AiyOmMxusagRy9g8Ej/dTwjh21zdRwZYxF9/sfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTfst9rp7ertK90guOYfuDGGDIE9wygbpFMBIvg0kwM=;
 b=SXYFozzYbj0ZJlZqY5ZElzHaSHvPMofk1hs5iq+9Immyb/6y89zPA5uPytOmrQQvznLFD0+pyNrNhYoosfSXCmM9Adwshsf1OW4u8oRVQgccyz/YvAJvs5K4+7s9/bN57DqZ6lywDSrxaC5cuXnCtZQMxdVMQb1YAsimOpcCC37DtJ5oHNizomarUEzoPE8A3o9xTwQujPyI+3I9oaZ9z6fAVPW/apZPa0Tx7/UKmFqkXaiNMoQ/4sNZ2HnCKZu9j+aB2N3WKZDfC6uIZsof8+o/z6YxedQncC77ndGlo9rYUuvY5RO/cZTUBzd+SFXJmzgwMs/Pe071v0X1kUC8Vg==
Received: from MW4PR03CA0126.namprd03.prod.outlook.com (2603:10b6:303:8c::11)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 21:25:14 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::5e) by MW4PR03CA0126.outlook.office365.com
 (2603:10b6:303:8c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 21:25:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:02 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 3/7] gpu: nova-core: use the TLV heap sizes for pmu and non-wpr
Date: Wed, 25 Nov 2026 15:24:41 -0600
Message-ID: <20261125212445.620391-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d27644a-8591-492b-e0ba-08df4b3a9808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|260925022911599003|56012099006|11063799006|10067099003|260925021311599003|261026140227099003|261022115727099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|260925021911599003|261102123227099003|261022105027099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gss9mz5hsH98iCrd/VArUhaCWchGlVEk/xBwg6SDqCTJbqHj/pD8ST41B1kQimRwC2vuKKC/lhEcTDqzidxetNcbtlQfc9AF/CwgdCPIDBLB2DcuFmtRk37qgFucOmF+WM12cP7mE3fpjaRATNSw44Ciu6A6VdGiaARD3bPx+cVZYzv9ltVjSu8zCiz0q4g6/l09BYc1jnkyPPfwpGWHtasSlEvEqvZt2/ag7mQDPXK37l347iXlzkakEb7y954rQqQr5Dt6lcF+5v3L3xb0d5I6zNmm8ClGBrSsNNeiLSIurO5GCJBVLw21tzkytT/VSO8Hohfb6inzYtBdH4Yy9vIEfIF9Zh/KfPnAXIZBzeCJOvfPuu3EgYOwvTEWewKFP3N29HgXk/0mCheDbsXP7AVqVf0JlqhIamiCV+6vBFJDhwVEOQEdHVT9fb9saOd2YWACBArSiNMDMbFo8zFBu1OaYGvZNZz0IBkfpShDPgv64ixu+ylJTMpwl8Kjr+BclvNuszMeGlSuZeMyO8zghBf3YzRpK22OAu0GQJFLpQNL14qdW6w9He0cFzrHskeAoDDUBQkLBgFBAYSCNgmForH4wE2bGA4+0F8ZBGyQZxTpEkBRBfOXDwZCfKYe0ZDeuS7zZJr/8dU1wK/j5o6JNg6rINJYs3oi45zCHs7x6E/NxizFQhQLGz1uGHxOROWJppgnOf5fe1uYJOnxwcYo1A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(260925022911599003)(56012099006)(11063799006)(10067099003)(260925021311599003)(261026140227099003)(261022115727099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(260925021911599003)(261102123227099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jcd9R9EFs0sGZGG8NyGSac5wAKI8MBZf/Z7+e4CdvZ6xiM8HyOPiBvygfnDGsYqnNjTcyRrka6jMZl1oh8ZpSdOTfQUhh/+Cv+VLOBemOV0ZXefZvd0FmIbc2J0NrR9aWN0iagu7yb1MT2ocYdOedZzFRgRwmlXXjHaxqfCnC30LaaTmKR3Xw1Zo1dZQc3PLD8yVPUJKWFCTEm3Ooqn6/7Ie2rnyZ2vhfeEMF+1VQwFUgvjLZqYgw4gszGeWrLRQiTmIeEVwtyu7fA+Fcrv4zV/FIJDWpiLtW2/MtUm/NKBG3vQqk81HyX6+pocYUhIfMI7QHSQWfuf+R0MGN6PSY73zyaXeCTtcjruQ+m7cZ4BYydOKz73UyyMvk3tFYEw5OTS9BM5zIC6faAJeWRhkXpxGAww/UUQUX/8g8+cmre+UvgK+k0pvFomMxS7tbnhv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:14.0533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d27644a-8591-492b-e0ba-08df4b3a9808
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

Instead of using hard-coded per-GPU values for the Non-WPR heap
size and the PMU reserved size, use the values from gsp.tlv instead.

This change will allow us to remove those HAL functions from FbHal.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs            | 21 +++++++++++++++------
 drivers/gpu/nova-core/fb/hal.rs        |  2 ++
 drivers/gpu/nova-core/fb/hal/gb100.rs  |  1 +
 drivers/gpu/nova-core/fb/hal/tu102.rs  |  2 ++
 drivers/gpu/nova-core/firmware/gsp.rs  |  8 +++++++-
 drivers/gpu/nova-core/gsp.rs           |  1 +
 drivers/gpu/nova-core/gsp/fw.rs        |  7 ++-----
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  2 +-
 8 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b0c0b8fe6008..ab427c2dbe90 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -264,8 +264,12 @@ pub(crate) fn new(
         };
 
         let non_wpr_heap = {
-            let non_wpr_heap_size = hal.non_wpr_heap_size();
-            FbRange(wpr2.start - non_wpr_heap_size..wpr2.start)
+            let non_wpr_start = wpr2
+                .start
+                .checked_sub(gsp_fw.heap_params.non_wpr_heap_size)
+                .ok_or(EOVERFLOW)?;
+
+            FbRange(non_wpr_start..wpr2.start)
         };
 
         Ok(Self {
@@ -278,7 +282,7 @@ pub(crate) fn new(
             wpr2,
             non_wpr_heap,
             vf_partition_count,
-            pmu_reserved_size: hal.pmu_reserved_size(),
+            pmu_reserved_size: gsp_fw.heap_params.pmu_reserved_size,
         })
     }
 }
@@ -328,7 +332,12 @@ pub(crate) struct FbSizes {
 
 impl FbSizes {
     /// Computes the framebuffer region sizes for GSP-FMC boot.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuState) -> Result<Self> {
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        gsp_fw: &GspFirmware<'_>,
+        vgpu_state: VgpuState,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
         let fb_size = hal.vidmem_size(bar);
         let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
@@ -336,8 +345,8 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuState) -> Res
         Ok(Self {
             frts_size: hal.frts_size(),
             wpr2_heap_size,
-            non_wpr_heap_size: hal.non_wpr_heap_size(),
-            pmu_reserved_size: hal.pmu_reserved_size(),
+            non_wpr_heap_size: gsp_fw.heap_params.non_wpr_heap_size,
+            pmu_reserved_size: gsp_fw.heap_params.pmu_reserved_size,
             vf_partition_count,
         })
     }
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 99363cfb116b..e30eb7de2a1c 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,9 +34,11 @@ pub(crate) trait FbHal {
     fn vidmem_size(&self, bar: Bar0<'_>) -> u64;
 
     /// Returns the amount of VRAM to reserve for the PMU.
+    #[expect(unused)]
     fn pmu_reserved_size(&self) -> u32;
 
     /// Returns the non-WPR heap size for this chipset, in bytes.
+    #[expect(unused)]
     fn non_wpr_heap_size(&self) -> u64;
 
     /// Returns the FRTS size, in bytes.
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index 7e6dc40dff32..ff04cd25fad9 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -99,6 +99,7 @@ fn write_sysmem_flush_page_gb100(hshub0: Mmio<'_, regs::Hshub0Registers>, addr:
 )
 .unwrap();
 
+#[allow(dead_code)]
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
     cv!(PMU_RESERVED_SIZE)
 }
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index bf5967cbffd3..d3c3c1adb9ce 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -42,10 +42,12 @@ pub(super) fn vidmem_size_gp102(bar: Bar0<'_>) -> u64 {
         .usable_fb_size()
 }
 
+#[allow(dead_code)]
 pub(super) const fn pmu_reserved_size_tu102() -> u32 {
     0
 }
 
+#[allow(dead_code)]
 pub(super) const fn non_wpr_heap_size_tu102() -> u64 {
     u64::SZ_1M
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a2db7b6ba131..f1124238071c 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -18,7 +18,8 @@
             Tlv,
         },
     },
-    gpu::Chipset, //
+    gpu::Chipset,
+    gsp::GspFwHeapParams, //
 };
 
 /// The GSP firmware image, its signatures, and the GSP bootloader.
@@ -31,6 +32,8 @@ pub(crate) struct GspFirmware<'a> {
     pub(crate) signatures: Coherent<'a, [u8]>,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub(crate) bootloader: RiscvFirmware<'a>,
+    /// Heap sizing parameters reported by the firmware metadata.
+    pub(crate) heap_params: GspFwHeapParams,
 }
 
 impl<'a> GspFirmware<'a> {
@@ -49,6 +52,8 @@ pub(crate) fn new(
 
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
+            let heap_params = GspFwHeapParams::from_tlv(&tlv)?;
+
             Ok(try_pin_init!(Self {
                 radix3 <- Radix3::new(dev, fw_vvec),
                 signatures,
@@ -57,6 +62,7 @@ pub(crate) fn new(
 
                     RiscvFirmware::new(dev, &bl)?
                 },
+                heap_params,
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 908d4ea72ad1..e487efd90b22 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -29,6 +29,7 @@
 
 pub(crate) use fw::{
     GspFmcBootParams,
+    GspFwHeapParams,
     GspFwWprMeta,
     LibosMemoryRegionInitArgument,
     LibosParams, //
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c74234a1a4c6..fdb7f9625686 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -76,10 +76,8 @@ pub(crate) struct GspFwHeapParams {
     vgpu_wpr2_heap_base_size: u64,
     #[expect(unused)]
     vgpu_wpr2_heap_size_per_vf: u64,
-    #[expect(unused)]
-    pmu_reserved_size: u32,
-    #[expect(unused)]
-    non_wpr_heap_size: u64,
+    pub(crate) pmu_reserved_size: u32,
+    pub(crate) non_wpr_heap_size: u64,
 }
 
 /// Minimum required alignment for the GSP heap.
@@ -100,7 +98,6 @@ fn base_rm_size(chipset: Chipset) -> u64 {
     }
 
     /// Returns the heap parameters from the TLV
-    #[expect(unused)]
     pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         Ok(Self {
             wpr2_heap_base_size: tlv.get_u64(b"HBSZ")?,
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 91201b51030e..f43fbe3dd798 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -151,7 +151,7 @@ fn boot<'gpu>(
         let chipset = ctx.chipset;
         let gsp_falcon = ctx.gsp_falcon;
 
-        let fb_sizes = FbSizes::new(chipset, ctx.bar, ctx.vgpu.state())?;
+        let fb_sizes = FbSizes::new(chipset, ctx.bar, gsp_fw, ctx.vgpu.state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_sizes);
 
         let wpr_meta =
-- 
2.56.1

