Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352288;
	b=e1CeyUWdE0Id4x8KFh/3b4s60HR1GbXstC754z5LY50P5WLIyMIzmqsxHuYgkRkXwR3V
	 vwR74Rhq3n/QNMJkaqLBKVDpNg+HpczVXw77Ucz7AuF2q4BaCoID3sQZhxpAQsYDO0Ijw
	 yGTobez1FStf7qfw24vNoQe2NA6xZ3+zRT/hBZwZtVf8FuTbuvyteNXzrE9WKrs1zoxSC
	 Bd80H4sq/5HKgkMcaRzLmdGFFBgIuqVeTBFRmsrx2sSbidgrnmpcYIff8fe9lcNDI00ih
	 gMAtDa0l3RM223ymaZeDmNhHhLzMvvsW7vVUSDyEFd6Rkctmg36aSc8gnc3MinngLYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352288;
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
	bh=e4K2oB+eTlS7VW9GJxcT+IbEWj9fR+4LM5sCR8kaDt4=;
	b=LtpOOYA9ehjp+u/g96EcAbLgQgULGkk7T0e29Gri2kxqCKuPrDrP/SVlpFP9rQ4WYFl0
	 NXfUiNaLzaUzZeFfqfrQ8X22MH4SSaSaL/nmpMp8zMDQQ2Ss/9wuRgdeEPcRurUIfLW39
	 cispKNADt5SfCQnf4u7fEBERtYsbcGVdTbEdTBi+Y9TSM0pXRXB0hCYIG0aUui3tVqmAS
	 oBthUNwMZz10Ft0Og1FYAEDi5IH0GeC8/ROE2j2fXEjtafA8pSPNrDCMGQBzVmQfuEMVY
	 H4Qs7/csZ/gOQGq9Iuazb6mwKa9hCyKbVodpPkZ/oD6r5mq1I0qva7CJe3Pu9IGipLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dvk8lmEX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.61
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA9606A321
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dvk8lmEX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3FrTlgUmFcAtAlDZkCMpcIG5JEBPELFC2lfiufRL0wBbn/A8BUVfPLKk2ksHAGZWd32Lw9kwetLC6KIuhqOZteMUVhnViCr2voGZsELsqn5GPQXttlYG4UsmzsxsDUyY5FZBMRrKXd/Q5ecKuNJMf9A54BhQTtcqPpYziRT8DdnIN+wgId214GD3q51gFWN5rpKHuu0CfeGF1Eqi1P5YW0N2apyHTS/WIFmjjzPRfu+od98Q/sNa4kf6yQjW1zcLJDLlslvnkjqY1H5B03Ni5PwglWwzsejvSOQPVf45wBoCEuRSmEZvqKdMSkBPo+JhML1mu+DaEdvYkMiAYVHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4K2oB+eTlS7VW9GJxcT+IbEWj9fR+4LM5sCR8kaDt4=;
 b=VmWedavxV6T3kMy9Ao1t8W0yZ0lKU6uucv5k71+oawiApGvSqZMTUL8HDdUvabeu36Vm76NrFpO//krGmeaoUIA9D6v9HC2C9TQnRg3s0HvxgJy93dgNPcGkg7PqtRvZzKHfuuwTT3RXYaITNcWgeKVSICz2hBpx0kmImNnuoQw35D5yOv0Zy0nCrsfA+x4aRc7dSsueqy2JFhRhBUEtJp28SMGSv1+tsKAysIRaGOnuR8pfY8eTilql8iGXoD+idhKlITkrPAdjs2RUHvj7JAktvn/mdstdcaAzYh8kkBhTSX5M1nBRsjPv1KPY8IThXO9VlecqsPIVmjH6HRpKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4K2oB+eTlS7VW9GJxcT+IbEWj9fR+4LM5sCR8kaDt4=;
 b=dvk8lmEXTqvM3W/tfM9YxmuB3QqlkhZ422KM/DGj2FArVe81OrHSgu+nry16hYODx4hiLL8WxZPuEAym4GzCfg1A9mD/N6Pe+2d33JIrS4nEQe5lYK5g0u+j04gtPr1p2YkKd9OdwYxnDVD1+lKT9wZaRJ4DwlApc1xmAVG9e5lkU1xNswYGNqdf4Un3XCT+6V1VApuuUxtV3tLeesMT9urea0QImODhsJPrMhVnemydUVY8AT7MSBrPYxFSDvhU9ampVb444RJkYJdg+rc0aDH1VOynF+m1AWhPh3sEEvDdUXtjWjN2QYo72VBcbCOZ3IzCN0uT56EC0FueNiQGCQ==
Received: from DM6PR02CA0147.namprd02.prod.outlook.com (2603:10b6:5:332::14)
 by DSVPR12MB999150.namprd12.prod.outlook.com (2603:10b6:8:388::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 23:11:21 +0000
Received: from DS8PEPF000000E3.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::7) by DM6PR02CA0147.outlook.office365.com
 (2603:10b6:5:332::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS8PEPF000000E3.mail.protection.outlook.com (10.167.23.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:04 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 2/5] gpu: nova-core: merge LibosParams into GspFwHeapParams
Date: Tue, 10 Nov 2026 17:10:50 -0600
Message-ID: <20261110231053.1352163-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110231053.1352163-1-ttabi@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E3:EE_|DSVPR12MB999150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6becf1fd-4d81-453b-ac2c-08df3f7feef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|56012099006|261022075727099003|261102123227099003|261009223027099003|261022105027099003|261021121427099003|261028144727099003|261021123027099003|261021135927099003|261026140227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	QW4tcToYW/xd5sA1qyf9Cl4BkTFVx9FW8h/8+xMdR7QN4UkLFlk7gntNvu3nZ/HhUIMQ4dFZSEK2gP8j93+FDZ3/JgMF7eGaGggm1pwfjjYaftxfeH6ODcrltmVeeDA8J3XQcnCT0O16F/sk1jj21evtbpZZhacXN+wS3NUv+OuKDRamhsGb+CF4sTIsiTC3sv6zl9yeDLQYJd6txbzGiHPDE35QIi6pMWTVq0IM2o09UTPWHEJqZWYVG6EOUu7Cz+k62rjch/OCcNNuWftqBz0OpN4cA6fjYECnILrb5+R0UZ/fvBJtbX8wDEPPhW7f1AFYI5qIoAw75W2XauOAyRYN6zBEc7UG6DWyXeSFilrFFuxASdb7w9Gln5XxwRPME+jDReV+NEptraKpEcqhJIvJHEXqPjleJMG2VWUAjiikyiYfJWRzvZwDmHdR6YJjo4BgVObRq5fF7ZIAAYKpkWhKxLRqJVFGgyTw7ynEw7jQsSrlb0Z/AECFmclX4v4z3/QolbE6hRAdOjCHT/sqFszi352kJffI9qTGNZ/i1Wjflcv9h1Xou+V8ZLV9OajZnPKaeF14nhtj58r0emqy+KWiilpLXB+mlzC3Bv6VskTxYoWSph6ptQ2p1ZzKjLzYosL2SA5kxFcehH2nPWDDeNM3wDlOvA82mR2po6IyYo9V/vtHTB6qTHlRgeX3zP7yAqKIv+Yf4eCbxMcKPQoj1Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261021123027099003)(261021135927099003)(261026140227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ooQg/lc27MwFRG5lySeiU8SG8Rg+S6YMTfBWBojh+4ctD8yXS29ouLV0Tc7KRkNJ63xmJ4rWHvJHJUllrZo8XU9jagR3bdAOOKAvok5BGXz/+HGRqKwpAZNq3AJWdDYYlcboEs4jCmqp0cnGFok149tuaJJM5JvHTQQ+OinA+LLUJ5WXwAlFiRIW5aWQXmiUpvLszWM271uFcLX5bWkQMmUqupLhNhqCc2ZN/BzHa/IoM0jB8otWUm2a7RuD4ucKXCvlevUAWgegaGeHQXZMgO0UCWFwHg6buUSg772yE5mhjUkIIXtd5X/kJvViYc662jBlHuBDyouq8CCTyjZJCFP/97zVZyGd15CbPSgT4lNF5M1MrMgxGWW+5SmkKoYJJDp03Ap54T0+RF4X6aKMmDXqaJ977fCcfXfNtWoV7e/p661keEKLHkex62I4t/Vf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:21.1232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6becf1fd-4d81-453b-ac2c-08df3f7feef9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999150

LibosParams and GspFwHeapParams are two types used to hold data and/or
methods for calculating the heap sides that GSP-RM needs for booting.
Although they technically represent distinct parts of the equations,
they are always used together.

A future change to this code will introduce runtime calculations based
on values extracted from the GSP-RM, replacing the compile-time
constants currently used.  Merging the two types in this commit keeps
the current functionality while providing a foundation that simplifies
future changes.

For the same reason, the LIBOSx constants are replaced with variables.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     |   9 ++-
 drivers/gpu/nova-core/gsp.rs    |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs | 119 +++++++++++++++++---------------
 3 files changed, 69 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b0c0b8fe6008..9a3314768385 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -299,14 +299,13 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
 fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Result<(u8, u64)> {
+    let heap_params = gsp::GspFwHeapParams::from_chipset(chipset);
+
     Ok(match vgpu_state {
-        VgpuState::Disabled => (
-            0,
-            gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb_size)?,
-        ),
+        VgpuState::Disabled => (0, heap_params.wpr_heap_size(fb_size)?),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            gsp::LibosParams::vgpu_wpr_heap_size(),
+            heap_params.vgpu_wpr_heap_size(),
         ),
     })
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 908d4ea72ad1..85ef94a8b5c7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -29,9 +29,9 @@
 
 pub(crate) use fw::{
     GspFmcBootParams,
+    GspFwHeapParams,
     GspFwWprMeta,
-    LibosMemoryRegionInitArgument,
-    LibosParams, //
+    LibosMemoryRegionInitArgument, //
 };
 pub(crate) use hal::boot_firmware_files;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c396daf06f1e..f30819fd89c2 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -65,26 +65,73 @@
 /// build-time constant, so the driver chooses it, and this constant is the one copy.
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize = GSP_PAGE_SIZE * 16;
 
-/// Empty type to group methods related to heap parameters for running the GSP firmware.
-enum GspFwHeapParams {}
+/// Heap memory requirements and constraints for booting GSP-RM.
+pub(crate) struct GspFwHeapParams {
+    /// The amount of heap memory used during GSP-RM boot and initialization (up to and including
+    /// the first client subdevice allocation), in bytes.
+    base_rm_size: u64,
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
 
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 impl GspFwHeapParams {
-    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
-    /// and including the first client subdevice allocation).
-    fn base_rm_size(chipset: Chipset) -> u64 {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    fn libos2() -> Self {
+        Self {
+            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+            carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
+            allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB => u64)
+                * u64::SZ_1M
+                ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB => u64) * u64::SZ_1M,
+        }
+    }
+
+    /// Version 3 of the GSP LIBOS (GA102 - AD10x)
+    fn libos3() -> Self {
+        Self {
+            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+            carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+            allowed_heap_size: cv!(
+                bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB => u64)
+                * u64::SZ_1M
+                ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB => u64)
+                    * u64::SZ_1M,
+        }
+    }
+
+    /// Version 3 of the GSP LIBOS, (GH100+)
+    fn libos3_gh100() -> Self {
+        let base = Self::libos3();
+
+        Self {
+            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100),
+            carveout_size: base.carveout_size,
+            allowed_heap_size: base.allowed_heap_size,
+        }
+    }
+
+    /// Returns the heap parameters corresponding to `chipset`.
+    ///
+    /// The parameters reported by GSP-RM are initialized to zero.
+    pub(crate) fn from_chipset(chipset: Chipset) -> Self {
         match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
-                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
-            }
-            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
-                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-            }
+            Architecture::Turing => Self::libos2(),
+            Architecture::Ampere if chipset < Chipset::GA102 => Self::libos2(),
+            Architecture::Ampere | Architecture::Ada => Self::libos3(),
+            _ => Self::libos3_gh100(),
         }
     }
 
+    /// Returns the WPR heap size to reserve when vGPU is enabled.
+    pub(crate) fn vgpu_wpr_heap_size(&self) -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+    }
+
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
@@ -103,60 +150,20 @@ fn management_overhead(fb_size: u64) -> Result<u64> {
             .align_up(GSP_HEAP_ALIGNMENT)
             .ok_or(EINVAL)
     }
-}
-
-/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
-pub(crate) struct LibosParams {
-    /// The base amount of heap required by the GSP operating system, in bytes.
-    carveout_size: u64,
-    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
-    allowed_heap_size: Range<u64>,
-}
-
-impl LibosParams {
-    /// Version 2 of the GSP LIBOS (Turing and GA100)
-    const LIBOS2: LibosParams = LibosParams {
-        carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
-        allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB => u64)
-            * u64::SZ_1M
-            ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB => u64) * u64::SZ_1M,
-    };
-
-    /// Version 3 of the GSP LIBOS (GA102+)
-    const LIBOS3: LibosParams = LibosParams {
-        carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
-        allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB => u64)
-            * u64::SZ_1M
-            ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB => u64) * u64::SZ_1M,
-    };
-
-    /// Returns the libos parameters corresponding to `chipset`.
-    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
-        if chipset < Chipset::GA102 {
-            &Self::LIBOS2
-        } else {
-            &Self::LIBOS3
-        }
-    }
-
-    /// Returns the WPR heap size to reserve when vGPU is enabled.
-    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
-    }
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
-    /// of `fb_size` (in bytes) for `chipset`.
-    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
+    /// of `fb_size` (in bytes).
+    pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
         // The WPR heap will contain the following:
         // LIBOS carveout,
         Ok(self
             .carveout_size
             // RM boot working memory,
-            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            .saturating_add(self.base_rm_size)
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(Self::client_alloc_size())
             // Overhead for memory management.
-            .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
+            .saturating_add(Self::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
             .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
     }
-- 
2.54.0

