Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220976;
	b=U0NPbQ/ZiwmiZGMzQwToq5M7f2CqSkfC7JM5Zlc4ha6DIMnq1idwvUtq7vCFKsY0+pyj
	 bO3tNXmkjhrvFsJg7AfM1/0CPmi6usdNXeUUbr27+5FZJc6H5wp/9njolKvW+78GiowYX
	 t4qunS0JPNm68OKLvlRFBDrnS4IMPJ4CbYMxAuMeihhzXqOaeooEUKNTlabwncb9QSxBg
	 7bfAxkSK200uuxlhNAHSY1tvlqcXXAAhROlQCTRmMQtQz2ndcrXlp4R2ShBFumRLP9371
	 +WV2WcfI5LXOnIqkUHMmDDssi7ygkbRv5Mubu3uPUp3Fk3W0Z79n3mpDiuaPCvbIZsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220976;
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
	bh=w58deCTkJdBhvMUWziDDAvn/nV6H8iFJqvDT2aB+OLU=;
	b=b8aV6b9rsy5anhgeazLOMWPGsm7Pf3z4EEt4YIwCIkZ0/LbEqMjdZe8erc4LjyTDysa6
	 /tbqvtF9lv0oogegU4hEunTRGdAG/U6jwY5Ilkm5dplwGWLw++7n4o18ex5qYCUvQdLMS
	 8bZMnE+iDTwK8SK4cVjQgmi2Mt/cO3u/LfLQok/kGAc6gbbYMSzvyJ8lwja9NHluavXCn
	 vqRBnH4wtLCaqso1y/eEgvKwzlMOSxodRTbrQbg2eAc+dJNwdKtNsexxwIL2DGDEA6pHK
	 BIuaRvKHCGeqGwnDA4cKrxYqB8nQo0zpfA86r3yE5Dp0bMaDWhLV5YAvqtNfd6jI6TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iXtbueeZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.27
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C596606A686
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C596606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iXtbueeZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvSygNpljkLFJDRgyyr2NOGQ7Qt9jNtKEnNP9gj/IDZHMMGd8l936yrxsgwcm8vchjeU0xOJ58t+m8UbmrkAlfNEbiFV9UdHAzekKBAfXGbmyLixAgpmDaeshdWuOHY6qBmYDO8FAFOSfqihk2kCVdzjvU65ginc2YepgZu6l+4JmCzhc05i00I1r1U9LDoQMBQ+IfioUePf8QT87H1Igr8MeKkgcggRDlRDcdsgxshdH/7tlREKweZ76kVesWTCxRtt97qZSoWypp3oRVOcNBA0xjGH9BiwyAnlhJS9zi7XKS3n/Qvgwodu7k3IR0cC6ddDJ3pLJBi+B8jpVYjt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w58deCTkJdBhvMUWziDDAvn/nV6H8iFJqvDT2aB+OLU=;
 b=DrFdQXRGUm3dCptmV2R9Ok4XLaIl/rBDdHZBIJb5fE7ekJvLKT05d1TDfydhuI08ZPOhZXq/jswUSPx/C2gLxZ4Sbpd9q9rRTEHqYQV9SdlU0xHjIJ0nkKxu0yCkt6jA9QBsLfsSuhnQWtGnPfCqghbZhK/vcd1EX7rs0lN05LFXftIQaTktUFN4Mx9yl22/NmZKNjLvUq/ygECdPsF2IqFeWW7BiE0F6fK3+zG0dfjn8/mnhbhhRfykYjvEaCprCKijmD0g+SkuTvNGuXfAZsv+bs4m2DK4qwQBqdpKUecQfc38tkLomRkQ5Qq1aiTMErxgukj5se3JBAT/Cg+wyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w58deCTkJdBhvMUWziDDAvn/nV6H8iFJqvDT2aB+OLU=;
 b=iXtbueeZ87kulpn4M0gt3N+xkkHSHz/xw9ADStwTa+jjMFyt3azUWK/jJs+dnDIs7gpL5ERLcWIqYqqIoVOBkrdSXUGbjfAOGIGnRGeWO76IN7IESURli5BYTLtMdEA4mZQHak2rdto3zSUJA8fp3TOJpznaJllFh3xZITCg7Kh2UdDjOmMIBs7LN2CVlu9iIqTDqMppXVoSIe+P2S6pAKSjKwylDyAbtHExa0gonkwrM+OJxYLPfiyU1xdS5ZC5JrXPwF89waFAOYgiL8MrbBmMT3gBJWOGVGMkEom9vJ49WSrf2nLBLdj7O1auDR45a6lQd8yqQrk4OHJL7cTyWA==
Received: from SJ0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:a03:39e::28)
 by SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 00:29:22 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::58) by SJ0PR03CA0293.outlook.office365.com
 (2603:10b6:a03:39e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:04 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 3/7] gpu: nova-core: use the TLV heap sizes for pmu and non-wpr
Date: Fri, 20 Nov 2026 18:28:43 -0600
Message-ID: <20261121002847.3358679-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121002847.3358679-1-ttabi@nvidia.com>
References: <20261121002847.3358679-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: af16b504-2542-46d1-b205-08df47667cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|18002099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|22082099003|3023799007|261021123027099003|261021121427099003|261022115727099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+Ae9YjThfqDhl+tti/wwcp8GEhU6XyS/fnA+8cyqKj0FFAJgk4MIxruyZ9QuDdsFMhemvWIRI3/0b16vEHBOIkWzF3kPDl5aEapidyQgQH9fekwxjD39jtz9V10al/AJCk+aHcsJyHhsKFCdBuBYd8h3jk5e26AK2YrTt/nIivJgYrp83voknYEj22MYL/Irq9XaA8ss47BtQVofTvqWo18aQXOHsmKswC4uPntWltKoJAG66IfU0WlKAl8GuIzV5kQ/zTMMqD9ZX0f8HpmaUmj8S9k+yjEyETnykwK/wq1Y53bpiRqRaIw2MKOWaFOz9mtrh155zsC1pcuAozs5UdwWqJWclTokr4E8/LZywa4apaxNFBtcbmo+Uh8MMRO54eUkP1LbQJev3Mtx4jhucgGTMUhZnwrw5LDtE1ZaoDdWDoi8QL1IsnxNJAXcO+9xOsM/YP3UxidXHQXdCjGr+pldo67SAFRi3p5IqpRvK7MlZiv0YAUyntS9tQ3jka/PQNvM8mNS0m1KZIQTjuFb9symObR7NQa3BeQBqKnts9+e2dgDgfz+gwXAT4EQd/FdYANXYBHcc+e4xqHvRINuES6Fp9eUq9tdk32yTqaALHw1QlwcwAa/oWBvxd5zJe/0Vj5uaLsCnZRhe0KmAquUEe8rL3zCLodA1DPnF25fZTG9aWmhsWGpZrQYiVIaeGqtqrNxOFCktB4nazG1O4WZ0g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(22082099003)(3023799007)(261021123027099003)(261021121427099003)(261022115727099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2COk/4dQkmtZn4g4Q2aE38xL3TFP62Xx+xQqP7ds7G1FWdgBS3y/xzN2U/twLdgBCflqNEcMZWzrXRQP3R0OK8dLSck62xB9633bzg+xnh733OVDd3dRVxthpL3VUel/XTcY1+kErmkHMWB630lPIua0GDw5CiNTbsQD0GEe4SfMOwIoYJXyYfhGmJLe2IdPn4zXS9Oj9ucbGE+RE0jsL4oU7Cp1kh1NmHKrsDilOCDSwIEdz9Soq2Unvkb7W0AhEXP1Rayqfg9YfS8rf+UjXNsNxw/MRBN+N9UdeEfqf6qm4XRDIhyzJTmsYYLbNAsBcx0xVzTwcE1foCWXBGbzNIgGZPh9ygL0mr3m7/gn5+u8qsabdyVd+Gyy2so/rmCJ//c85jzWkWnL0yCMTxP32mifwqHiPVoBkNb54ZZ2oDpSfiydPGBKVgim+7/wDoX2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:21.3786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af16b504-2542-46d1-b205-08df47667cb8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781

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
index b0c0b8fe6008..b6ee4e48d5f6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -264,8 +264,12 @@ pub(crate) fn new(
         };
 
         let non_wpr_heap = {
-            let non_wpr_heap_size = hal.non_wpr_heap_size();
-            FbRange(wpr2.start - non_wpr_heap_size..wpr2.start)
+            let non_wpr_start = wpr2
+                .start
+                .checked_sub(gsp_fw.heap_params.tlv_non_wpr_heap_size)
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
+            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
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
+            non_wpr_heap_size: gsp_fw.heap_params.tlv_non_wpr_heap_size,
+            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
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
index a44550b70d44..837f7a522429 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -76,10 +76,8 @@ pub(crate) struct GspFwHeapParams {
     tlv_gsp_fw_heap_base_size_vgpu: u64,
     #[expect(unused)]
     tlv_gsp_fw_heap_size_per_vm: u64,
-    #[expect(unused)]
-    tlv_pmu_reserved_size: u32,
-    #[expect(unused)]
-    tlv_non_wpr_heap_size: u64,
+    pub(crate) tlv_pmu_reserved_size: u32,
+    pub(crate) tlv_non_wpr_heap_size: u64,
 }
 
 /// Minimum required alignment for the GSP heap.
@@ -100,7 +98,6 @@ fn base_rm_size(chipset: Chipset) -> u64 {
     }
 
     /// Returns the heap parameters from the TLV
-    #[expect(unused)]
     pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         Ok(Self {
             tlv_gsp_fw_heap_base_size: tlv.get_u64(b"HBSZ")?,
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
2.54.0

