Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220971;
	b=SQK4ssxosJpfMgzI+ZLvU/BmzLCclDFaiKhHIYPh3lWTmlibI8Pq6E3ou99hvIJNjqHa
	 PcIerXJtbuFp7z/n4t5vtuaT1ogmVyvwrcZkGzdBLw8NdJiUcSfb8rSpyl41GMavlLMLd
	 FFRQsA3JVm6+dpEeg+OO0vq1hfYTYpp9Ie/j0p8Wl4a+IRbF/s6tN7n2qnKoHH3Ifn3pk
	 3V4Zby8+mPdFahTr9aWjMk3VIGrs1+TXPo3iUWkvvFI9OBWWcg8mmy3uKZn8IBhTqNjSb
	 Lj1vjOdiPF/Z9vVbOQv/75G66xGLhPL7ZZnXxCyqgpBmCLTGQZfkrVlF2LlWHJU3YGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220971;
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
	bh=xoRrJyUYJXsZfqEEqiHlxE6N490394d3KBv3oxRcML4=;
	b=YNbPrnKEUjUz+ojETHoMUyxKbS1N/kuUisk/byoOionSwm9R8NXXbetX4l/sjZTJEWpN
	 iR9E6Aogl6nQK1UUTjzrcZe1BeVKmaYU/TbIqPWewtXpY/maiJoL30BDBdw8A5cBUSgNI
	 /YJYaRN6FFpd0ajVkhugxNGkr8rL2TQi9JikAR3rJeD7V8mTjNLrbLKnmQzAPOQIMvo0G
	 ggCc44DQWgznit7A2MQgOQfPP5che25gAyrvYWSmvS0nTZVhAisi0Wxj47RobFf2GB+X4
	 miNWslFlLsmwrAdA9IXtlgdgOQBx3qwMLoZbpmvH4aBv6hcTuhrHHv4ivalwiTtGA1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="uqN1f//e";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.19
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276FF606A336
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276FF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uqN1f//e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3BfZON9Vdo+MKZuC5p/0QfMJ/GbOJyEnanp2D/sYUd9mg4Em8KhIBr3T20+COeAhnC3hsouemCe0PFpiMU4BFqcz61EYO7YyvzpI91bF/1MbVuTfcX+9NomnhBmKqyl7iHvRGR0Q9g7YCTDdwnYPzG5mvwL9/GH0ZDjiKtRNnubI2yN+L2FGeacxi2Qagw+XpDxrZVRL5w04UYtyVerPzjnAkA0KdxtHv/IOSET5hGcJ6oe/9y9XO801sA4UfXWSnAWm/DsT2kF0oFqmEM+eenOTXA8DJTJH3YARGiw1yuPok0AcH8pdmGb4ggZKjQUo500kTJnQjxbKJi1FTwnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoRrJyUYJXsZfqEEqiHlxE6N490394d3KBv3oxRcML4=;
 b=y6OcHKIUEBWqjVO7kvDVp9yfp5tf1btdnWCtSFvKJJ33x2EW5oMYk4OZ1Gy9hGxfe9lcjMbPTTkzBu5ql1XmoLTXsQefZaKOgAv3m1xUTDwpecrrRNjCneA5rjso6tfBroKiTZqP7criqIvQPy9v4E492fKvRvuzPLczbMP0/bHDw2GiSDnIUg9u+ZsHaYPjzwl2ILpMorV1aXM0KcYyUJ+iyNfAuLhLrKXv9lDbogtdTyB4yw8PBoiYsc35dIJMPfz6UJhJXPAgN9e5GMNqI1K6rQdkKXH8RMBK6E8uLiZG9apiQ9CYyE1LIqFt6AIfmUmKelPu4IG0d7ya+RU3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoRrJyUYJXsZfqEEqiHlxE6N490394d3KBv3oxRcML4=;
 b=uqN1f//eHe4UXdDoiVckKfu2sVCmUbG+eHjGsKH+QXGDmV2dr0nlaIn31JVpQeKxuVIK0zX2tVDmoALbrLwpbsqTVq5h6nwJeWFnJqXBcwBHattozAmxd9VrfKrx2Ph2vieCWNS0L/v7YduJ+us0xMzGOt8wR7FlEezvkIxhWFQRXBBXbaNeoynj11d9cCxFMgRLMj9DrCk7GjeZPTbzqQchuMqJKNBPQavv1JuWDcOetPVzlM5G1U/is1XqnvFc7jJ1XqRztDB+jfl+/9fv6wsLKxYoXRwDMpAJ+cisQGm4DOZOov/VwUkh2MZR8UDdZbHHAQvujJRPkvdr+gDiqA==
Received: from PH7P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::6)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:29:22 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::54) by PH7P222CA0011.outlook.office365.com
 (2603:10b6:510:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 21 Nov 2026 00:29:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:05 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 4/7] gpu: nova-core: remove heap size related HAL functions
Date: Fri, 20 Nov 2026 18:28:44 -0600
Message-ID: <20261121002847.3358679-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d95493-a69d-4dab-9baa-08df47667cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|6133799003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|56012099006|261026140227099003|261102123227099003|261028144727099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	LTFzvMMVZnI6xRDGWxI36/LnhqWDweNRAbUy2dIhbSwYrlQvyQwAOI7GJoAbuY9tOGgWiYwXOFh+090AlyAVhdYyFJKRZaFaxjLWu6RAwQx9golC2BRGMUgO3GUro9JUVpiz6mmg2J/CSoe9bi5CMfHyDwmhweOFCLZ+0sSWLa+vdnwCXRmQRrhqLvzWsGsqX3yKZMseKGgTmVmIngG/HDQeGgBynXIPTnaGs2EsOLtf7khXaex1V9NHkF4w8uqmNJdUWQJg9ijpWZol/9/x8KgxCYkeIKYIMcKpscfyxzVr9yg9Ms0Jf/U4iEF5Cg2Gae64KXpt4U0N28J+rSEiyIiDBO1sNJ90AA525AWjRCS5Ihnm1AVSYLyuSlq3Izq4AyNqaikIycP1XneO0uMQUoyBgRIC5b/t73sA4g1zGt8kgodmWddlODrZtDQ1z/qF/skNi2KadaQjXAeS7Vy7l+PfWQXrc6zekj1Dg8jzP2L7iYKy7xfH2MhlOCvrGbOrppj4rGNQyh7C5/kOMmvDkE36RKvSB5uXxKT5DT5hOstCeaoGEz/ls8xwOnrkWTNaqm2ca0IpBbsdgTdzGDp/Jcb0Ygc1alB5PUm01e77/eYD8W9kYnxoczHXBG1+kBulsbSsceZNtn2SvtqHS6WFxqXA0AeFjGnzyuU5vHcJTpFGufs7kJKxxThTwGOEhyenenGIK7M0bwk4e77dwie3dA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(6133799003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JbYrYsTh0vW2EXsPCAen3by1OSKQSqam88pHk4iauWbu1EEajzOSxNknOEpc12TUL7SnvUo8PejejxALcRtXWG9H97jL9wqrp2EXI+1gdI77sFPzY56EHA17fp/XpNy6loZARu6iGCC7riWyaOrfh9nVw82fjiKVYz0gVe0dsi9+AawTAD5WFDWaN0bYQcGuqdPr+eVq7nQjt7eyyE+jMz460v7cFZtG1GIwrUVu/4u4Ruirv9cxdBz6UvJYW7bL8/LaqDCrEYPxlc+OetpD4OEiiHZGOJGJmsP9vWBvb0O2nWLeeUj98aGAE1GcVlavoy6AO37NTUoDnRaNqC4ZyglIUI84cQ57g6J14+m/jVbHKFgThfFMyfMxdupT/OJp+hSiDqJ+KH8UHpLUz/nMjFZNo/7pUYASBmR5HDhNF9xxO6dPJzuqWxMlkw5+JEO5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:21.8647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d95493-a69d-4dab-9baa-08df47667cfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668

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
2.54.0

