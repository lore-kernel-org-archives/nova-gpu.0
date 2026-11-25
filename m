Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641929;
	b=HVgfVIMU5BVKwpcsXpVtQTlN6c6iEAYCfz8lFevcKS4bVfTjkN4cKtvh8RSC+tEWoN+R
	 qCjoJ3Q5Z9Nh71f9bLmuSQmySAZTMTjiBmx7mAbkBFEZSHpLuN2qSdbt9U8gKhGTv05YC
	 4qzfs6B7hg3pp0wi8dM+476QX7MyYdRVNRj6b8lrmdur3D5yl1vgzrC4dr/+UeYgVIYk3
	 cLqdQb18nfjZw84ppivEwJ7ahwFkVK067gSeQoogOFOXDAyNnN3KeCtEzQiMuMNeQwNCF
	 XOmOFm24U3iR+OZTgszYxQW/QUffdhtCf3WQ8D1JOcB9YS9z4saomF69HUll3kl6krw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641929;
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
	bh=boq9bVcECC9WxEYK5tfztEmIFTmDBbS5hBwaicj8I9s=;
	b=TCrlulD0HTwrDMj8TWxAn+ti5Qa3QbUGIpr3K18TZnDRHxSrn+GvGkSiktmR2Bi0ytcw
	 5vu+G44YsNoxHABmYZXNqXuZEgqB6g0EY+UX0qNi8j2shjNL1ib621Ct/70kLu0+kQVX5
	 ytXe3C5YzqsHWNbiD3EK/NTnnOkMriqCTRm0RVbabIyD1V0FFXh4MwKquAimObS5EZ51L
	 3bsrfLsnsjVAM5Oj0zDytMxVFfhWgPJqInyGeF8f/+fCvRDGpdGCSKroGc4OM8d/Lu+8Q
	 hWyWA7s2iz1HZndzcsEtoQBLkAdWJpa47nDL1Wmj2D3PYxe7QeBMn0GIrDdAiIgpkIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LkFtdgp8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.25
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F14606A31E
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LkFtdgp8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy5/ZicGI4Rd7PrrQFJG1q4Izogtj+C03OAeZC/7UeOgK8kyNXh4LmUX9927scwQF2BlV49QSrF0Gwdl2Lrmh19uFcrbCxpvLl5p8YWBf6e5GxR53qKm7ZKgbNbol5HvxtIJCAVuucg1JKoOUL/LJR/R4K6d6s1iU6hPgXmaC75uRechEzpvFSgZzyWOLo4pzYHn1lOoMOKwRJ4RyKft0zK77VNzayd9xdxpO9K16gCOo8uFBUAFo342VCrt41STa9ngpC0mEHw89vxsJYielVdTBYF5ePcj7C3hA0ZjeJLaRqaHxgh8lRTXgi1qJSkMWfOEAi0nLxKQ7mNNbA1DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boq9bVcECC9WxEYK5tfztEmIFTmDBbS5hBwaicj8I9s=;
 b=H1kEWRhHZCW2r2xSNQlSQVNwr15pnY7UOB4RZ0ic+jNNZrLQvXvON4G3gKnyYooOQU66RpaVO9UYC7k49O/Ie3ECJdz3KOzMXvmHH2J55d+rN1bOZVHfvEY5HM1ahqEqTAY6ah4YltQTgZ/28cMa4HI6e3xPXzl6I9ZXLt8wLmIn0yQohjW+DE8iH5FhXAeboiUTFT0r+0i6/NeAj31Xppr15JH6Wx/Q28XGGOu4cMdDd5+lxvQEF3MVDb9kqsU+hONtU7NnGJWdOlO+GBKczpA5ccwFRbSR9h0l/UxeyqMm643GLVjupaJkBHmTVGnbGyiohaHPDUd1XgqgRROyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boq9bVcECC9WxEYK5tfztEmIFTmDBbS5hBwaicj8I9s=;
 b=LkFtdgp8tQe/9laoqf2PSAwJ08DD7b1jwL1ehzfzpDx41PLrF8nW6c9VKPj0hdmyHKvwizFE/OUdRV4e9yDi6dtCnVAVKirJ/Bng3rkH281nsxvNUHLYRkd98u0WA9tSIDL42+G4BbDKvQda5RfxPcvRv4xzR/NaFd56thuMmdlnvAlVoYaFEp2NJezCywCEepAh66fnlfZbxVDsnfI6bp/eqhz/my4QBWnQmsloXxuZ/Rn0bkTWz3FRhTVr5VMLU1Hz7GQvC7eL5Fpl67m2rgi1rxrEkMsXe8hNlRKGCccSGROC1bfZz/J0/KUSNms8j/H3cNGs3QEWzwhdlxYTSQ==
Received: from SN7P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::24)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 21:25:19 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::88) by SN7P220CA0019.outlook.office365.com
 (2603:10b6:806:123::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 21:25:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:03 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 4/7] gpu: nova-core: remove heap size related HAL functions
Date: Wed, 25 Nov 2026 15:24:42 -0600
Message-ID: <20261125212445.620391-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: d3be7960-a45e-4738-bd97-08df4b3a9ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|6133799003|22082099003|11063799006|261021121427099003|56012099006|261102123227099003|261022105027099003|261026140227099003|261009223027099003|261021123027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	AX29vBoLu5BLI+kb36EnrOCjoy57OawePc6HkJRGzf1x2FLUia1djGHw6pJ4X0K009WdLfXqn7RzLjDEesEPZpJ2w+xwlAWn1aUMVboFxJI1FVG3tb5v74W1KPVXHmiKx4MBynavSXas/qr24tk0qXNvWe8sQbr9qzzXJueCfRY8yLeqZK4sNGeLvMd+JYMbDxvYWyae3N21jaswUZub0GJESW0p/3f1LowMWwOfd5QWc/RDk0lKhuIhHgWssPYwd1MrQ16lP4B5L8ERFaDhEHR8ZyoLh9tngglK1OvZo2VoL1e5lj1NX0hijWXaFCSb8ARDuPNSjn6eOHnSc7AP3Pv1A4SqipAkAcMKpzfz8HDhunx8AmW9bG9bK4RbVPTvKuZ8XW3Hh8mRWj/ztmwpfllO32kW8xNnAysJ2hk6qY1H5MJVc6ghKgVbb3ru4l7Uz4iTc+GQBsY7Cve0gAh9UpDTQYIrdSCJDf35Hlck9JUx+yIvwKvYG6yXfqtOMLrdBibK1YU4DgVeZBcTFKqmA6RLpRw/bTrJvyruEDuwmaOwjgbAjBrzNKk8c6h40mLQGpfz0lIdaW+1JWQB5PC18zE4hgqSyTc5e26+DRmJ4OKqQHC7F9JsH1SQSKSaW63LsmTXHm9ggSbyjDJiQDI+e2J1sLH6VsDpUzKpxqTFouQrmJehnauFB+fdcXYny3zlbwDF9+hnVtMSzUwfYXrEbA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(6133799003)(22082099003)(11063799006)(261021121427099003)(56012099006)(261102123227099003)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zVtTuIiuoEY8icwAoSK2/mvVFFIF1v8PFsPpU3p9Zlv60ggqmRtNxPnEbAYHeTlwyQkpfBBKarRdN2hUeHPJkDVGmUziH74rWwBGm4FnXb2rEugbhtAfUTAPXkYqk7p4SkhVqEfAOQYXB/il7/X8sW75J7GXU/BD6u1lFb1T+/MAl68J130fpCXmhwxQLL8PmcriZu2akykPKnzg1vBMtWX3TWjTHX9u9aMCyK2bNcClzApsAt+qY/E1O29F2g2XiSxy8P9R8jsPNgbB8Khg/nz66byT5I5qRDNrH3Z1iVClAGvaIL+AEIbsDzy5Qg9fB6NabvW3BMgT4yZdJPqwoNZlimR9SjZZixWBzdMsjnF71Agn8r4bgBHAraCMggJg4bD2iKJLIlRZVnINaFxGJj3iqFKxyMxynDzPhIiEBMHyZLXF0I4GKvC8zw6pUsFM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:18.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3be7960-a45e-4738-bd97-08df4b3a9ada
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529

Now that Nova-core reads all heap size values from the TLVs, we can
remove all of the HAL functions that used to provide that data.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       |  8 -----
 drivers/gpu/nova-core/fb/hal/ga100.rs |  8 -----
 drivers/gpu/nova-core/fb/hal/ga102.rs |  8 -----
 drivers/gpu/nova-core/fb/hal/gb100.rs | 42 +--------------------------
 drivers/gpu/nova-core/fb/hal/gb202.rs | 13 +--------
 drivers/gpu/nova-core/fb/hal/gh100.rs | 12 +-------
 drivers/gpu/nova-core/fb/hal/tu102.rs | 18 ------------
 7 files changed, 3 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e30eb7de2a1c..53821e4a70dd 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -33,14 +33,6 @@ pub(crate) trait FbHal {
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: Bar0<'_>) -> u64;
 
-    /// Returns the amount of VRAM to reserve for the PMU.
-    #[expect(unused)]
-    fn pmu_reserved_size(&self) -> u32;
-
-    /// Returns the non-WPR heap size for this chipset, in bytes.
-    #[expect(unused)]
-    fn non_wpr_heap_size(&self) -> u64;
-
     /// Returns the FRTS size, in bytes.
     fn frts_size(&self) -> u64;
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index a81b3e42ae41..d0950d1f2339 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -70,14 +70,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        super::tu102::pmu_reserved_size_tu102()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        super::tu102::non_wpr_heap_size_tu102()
-    }
-
     // GA100 is a special case where its FRTS region exists, but is empty.  We
     // return a size of 0 because we still need to record where the region starts.
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index a5eeddb8a1ae..837bac1b7b2c 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -37,14 +37,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         vidmem_size_ga102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        super::tu102::pmu_reserved_size_tu102()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        super::tu102::non_wpr_heap_size_tu102()
-    }
-
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index ff04cd25fad9..53d403d9487b 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -11,12 +11,7 @@
         Mmio, //
     },
     num::Bounded,
-    prelude::*,
-    ptr::{
-        const_align_up,
-        Alignment, //
-    },
-    sizes::*, //
+    prelude::*, //
 };
 
 use crate::{
@@ -78,32 +73,6 @@ fn write_sysmem_flush_page_gb100(hshub0: Mmio<'_, regs::Hshub0Registers>, addr:
     hshub0.write_reg(regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
 }
 
-/// PMU backing store, `kpmuReservedMemoryBackingStoreSizeGet` in OpenRM for the chipsets whose
-/// PMU initializes itself: 9 MiB + 320 KiB.
-const PMU_BACKING_STORE_SIZE: usize = 0x95_0000;
-
-/// PMU surfaces, `kpmuReservedMemorySurfacesSizeGet` in OpenRM.
-const PMU_SURFACES_SIZE: usize = SZ_16M + SZ_256K;
-
-/// Miscellaneous PMU memory.
-const PMU_MISC_SIZE: usize = SZ_4K;
-
-/// Alignment of the PMU reserved region, `KPMU_RESERVED_MEMORY_ALIGNMENT` in OpenRM.
-const PMU_RESERVED_MEMORY_ALIGNMENT: Alignment = Alignment::new::<SZ_128K>();
-
-/// PMU region above FRTS: the backing store, the surfaces and the miscellaneous memory, aligned to
-/// [`PMU_RESERVED_MEMORY_ALIGNMENT`].
-const PMU_RESERVED_SIZE: usize = const_align_up(
-    PMU_BACKING_STORE_SIZE + PMU_SURFACES_SIZE + PMU_MISC_SIZE,
-    PMU_RESERVED_MEMORY_ALIGNMENT,
-)
-.unwrap();
-
-#[allow(dead_code)]
-pub(super) const fn pmu_reserved_size_gb100() -> u32 {
-    cv!(PMU_RESERVED_SIZE)
-}
-
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: Bar0<'_>) -> u64 {
         read_sysmem_flush_page_gb100(hshub0(bar))
@@ -125,15 +94,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         super::ga102::vidmem_size_ga102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        pmu_reserved_size_gb100()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for GB10x (see Open RM: kgspGetNonWprHeapSize, GB100/GB102).
-        u64::SZ_2M
-    }
-
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 1d36954a2776..90673ef4a05a 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -6,8 +6,7 @@
 use kernel::{
     io::Io,
     num::Bounded,
-    prelude::*,
-    sizes::SizeConstants, //
+    prelude::*, //
 };
 
 use crate::{
@@ -67,16 +66,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         super::ga102::vidmem_size_ga102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        super::gb100::pmu_reserved_size_gb100()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for GB20x (see OpenRM: kgspGetNonWprHeapSize, GB202+). This size is
-        // r000-specific.
-        3 * u64::SZ_1M
-    }
-
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
index cf8e6403ef98..945760953ee4 100644
--- a/drivers/gpu/nova-core/fb/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -4,8 +4,7 @@
 use kernel::{
     io::Io,
     num::Bounded,
-    prelude::*,
-    sizes::SizeConstants, //
+    prelude::*, //
 };
 
 use crate::{
@@ -59,15 +58,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         super::ga102::vidmem_size_ga102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        super::tu102::pmu_reserved_size_tu102()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
-        u64::SZ_2M
-    }
-
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index d3c3c1adb9ce..fac30be446c7 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -42,16 +42,6 @@ pub(super) fn vidmem_size_gp102(bar: Bar0<'_>) -> u64 {
         .usable_fb_size()
 }
 
-#[allow(dead_code)]
-pub(super) const fn pmu_reserved_size_tu102() -> u32 {
-    0
-}
-
-#[allow(dead_code)]
-pub(super) const fn non_wpr_heap_size_tu102() -> u64 {
-    u64::SZ_1M
-}
-
 pub(super) const fn frts_size_tu102() -> u64 {
     u64::SZ_1M
 }
@@ -75,14 +65,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
         vidmem_size_gp102(bar)
     }
 
-    fn pmu_reserved_size(&self) -> u32 {
-        pmu_reserved_size_tu102()
-    }
-
-    fn non_wpr_heap_size(&self) -> u64 {
-        non_wpr_heap_size_tu102()
-    }
-
     fn frts_size(&self) -> u64 {
         frts_size_tu102()
     }
-- 
2.56.1

