Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352290;
	b=5iIOhkkT8fcxrWW3clxuEODcm5mACZGk5dB+FiLuOyXfIV4+qys1mj0bYZfFQAma9xKY
	 yAqkiP3FGubFS4d2WlXDKrafd/UmcQ3SXd/iifqMSVPV1kf5SYohjUuBPjuM0f6fGJMsQ
	 6KeQ1TOlZEsWSkLH03mvZZ9OuULofCegCgLck5jKl0+lPdnMx75hiHAOuKJd4bcYXXGbR
	 hHSsJAiT5WiOa2/yTEIn/1UvdvXmLMCoJFB/Ou+Y7mL8XWE6kXd2643fS1QUXdpF5+KAe
	 FbAgKc4Bfd471RpLVidx4X/ZoGZdq33yfkGNjedTukHllYbYt9ZichrfZjjCLXKD8uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352290;
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
	bh=5ELYUe+TgspWfStrogdZb+jyTkObw1cMuNwy/ZiPoSw=;
	b=smU0U+z2ozYEczq6n55ow4vCOymhg0QdYRk0VkyI57AaK/OJYlGzV8Uj+MYrzLsMgabs
	 nX34dE66K8uYhKUKaCDpw1g5j+ojzN91bdkaIL+TJ6X35zXbMYxFCH+i+mDEip064m0+y
	 ob9vR6PRAk6zybFPuodV3/mNMBLVXryIP1ncJAqz+56Lkr6mLl/GJLMqhOONorpbCJQZk
	 JeqBy/htXAgm83w5disKk7/bc7Rg5L7aI7T1nVABiZl4mpdd88FGHxDpj/10ilrUYm2fP
	 uGD10W2Lerpvi8hyWUqqpxxAX/d6sIljjalLCJa4NRx+BQgcTwRFZn8uzXvZVm07pYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=glgqnXZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D7606A320
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=glgqnXZk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQzZF/0TULNsXPaw1jLVvMvMPMffDLsAhU4uF3WJPfRQTHQncJact0u40bBe9hOc0tuB2bGh112t9ZRJOkJbiOduBkUhWrz97+SZniLM4ZOs0V+xEF8VjRxT1KvFZVnqNcm/AR4n1YpLzxXowjKU6VNtNTRA6Au/FViT6L9ZBF3e8NuCbE1vKNMCyB5Ldk+3KhhMUzMFjDcECU35hXir8CmNzTfGKOzVa3pe8ds62Xb8YM9T7LO+jUg5ZV3I2F1r0PmwCdPyA8FXMFBUYoYPZeUKfhsvPJ+WOlGHJk3Fv/IkQUeueUweN9iZVCHTagoa2KlBtsNq+4V1VPVAfiWvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ELYUe+TgspWfStrogdZb+jyTkObw1cMuNwy/ZiPoSw=;
 b=Thy6PP4plFxMVL1qoJtj0z3TSlZCbSwj/1CS7FragKrItTpsriPyogSLMatXsBSwvOV6b9L99WYX/2K0OAm7D7O9kuy9onX/TodT3Vd8DRaG3wBWlnnx/fSB2yoYDaKyf/oadSiAXDr/auQ2B2O3Xfkz2dnLldk7BqR0Yl+lWenwLLI4R4hbaYYGmbsWHX+1SwS1/dK9pke6LLRSNfGJha9rw+JGX5g0ZuaccoL/Vh3fDpv/GdJj4ORI6GONmudPXT6P4giGLsI1CVaAtaDQmSORkDEkSMgdPCLD12ziSqU0MUCc2ADKHrjgkaYHVEcKs7PEj1HgCLX62F8G8BU+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ELYUe+TgspWfStrogdZb+jyTkObw1cMuNwy/ZiPoSw=;
 b=glgqnXZklu961wF2TpytrALPimASybcRJwyj+SFMRd43oEibTnl92qnbF3hlgh1SF/xuJkwl6KArvooHnjaJ9RjoYhSmvNvwxAG+4Wcvy1FFesFUzTihVJP3v5/4dS8cdVFSubAccwElcHjOemy23Y3EvbDuEtmIhaFllgZciAjsqPVtlr+i04j58cPAd3+iiPn9Incui6l05DW5kvUI2QbghpdctV4Y8fRAmwW8HHbhctR3D8bukPsL+/6kIUHonFXHns8vqxFdbiIgQrRp2EV5+G/cBBfdhEqkt0SkMBFyAbe151LtgT8yVw2FSV1r0J591kyF2UzaMBM34jCjDg==
Received: from DM6PR02CA0156.namprd02.prod.outlook.com (2603:10b6:5:332::23)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:11:23 +0000
Received: from DS8PEPF000000E3.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::ac) by DM6PR02CA0156.outlook.office365.com
 (2603:10b6:5:332::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS8PEPF000000E3.mail.protection.outlook.com (10.167.23.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:06 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 5/5] gpu: nova-core: remove heap size related HAL functions
Date: Tue, 10 Nov 2026 17:10:53 -0600
Message-ID: <20261110231053.1352163-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E3:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: d71c9520-2aaf-41e1-f309-08df3f7ff059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|261009223027099003|10067099003|261028144727099003|261102123227099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kR9Um5DdUgGYD6v91s3wzJtKXvigzTo+v7+W73r5d6fKnFIN4IiGz5luJFFaPI6ourlsC3X2uGL3GbWGxfkBNSEwcIVrr2W5PsFduVWgVHz/qChYOw+nBsIEVRQ0fjSykS6Jpw6dIxzv8u84BshApHkNm61BO75+Fkzc28+J+69peu/3Fp0XfNBgfb28pkV2/UwmvVLY7ZrlT6IsHPp3QtJEbs+YVh4e2Sx1Q1lkmjghOxu2Ie0J3L3D3fE0YbviaR8iFI+elNA9LiQe6CFOyQjTeoOPwi9ggKvESuL1BDFSNcdWiOjJVwHNc+gYn0ApDLP2Oegq6Z35WPDdMEAm6hAJHp5w4Ki1TZharP0ktJkC05LIdRFQ97Ocr2gpxaPbkPfISnO1rmumB8Jsh5bSaYHr7Se2wl61Lh9w3HCim/PxqlAP4YUFDq2bbGfTOooWpjoS8EG8h6ozgMvyv5yAu35Ruxh0/o6zoRiqyuwmve/RhzhQh0SIlL8j7jT0JKJPZzaUgxfQ+2+uErpAK2wh43E3w6zDA4qAOP96TmqIT2Nf+DyqRgqApGodPY0AnskzWt/UVEfjXCMI4boJa7pJ+0eSgCKSINCzopGSCjLWceuokYvqXRU3marnTEv9p+AvQhnhtnkhs55DaTXP+7QSoNnMVz/kmEyRUX23DkpyXuDoCBkbFP7Pq6Bqx0iX7VSXDdgf4Xrlq/Wur6oQ+HvSmg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261009223027099003)(10067099003)(261028144727099003)(261102123227099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0koD6tL/MdJriXKCfZ46cr/H02MFgoXSy4Jibj1okb3j2NGwcfvOQDZCn4OP/tFQwojWC/K2RCaTnATZ1Kp1DCF1I27TecWcIdtdteVr54vwfOFm9LAR+fOE8EfGYo3JFGEjlq0e26p9nGoMw9lNgRnZU7ecyzgRUhX1a/8VKLeWbmh771b+yzZSUfP/eRmyb8QV6NJEG3DWdO9OX41Yt4NScVj3XIGF0f7qcYS0kbnyqmK7gb/8MxqGOuggvzxRVl+30cr1I/+2HyFUmEm17nDbWyT9bdDNupA9Veh7DvURdqXe3pEF3nZqMdyO6ZH0QzJP+1zQ0HHmUfz7Nm3n1sxLMGt1BgeONjqnCJaVZF8IYca/zDK/NKyJdaUd9IK2s98garD2yvwDhpcUuiPxzGPXCQHbh0C1YscobgBZsfEkWd8J6n8mpx13UjdzoqIG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:23.4222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71c9520-2aaf-41e1-f309-08df3f7ff059
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445

Now that Nova-core reads all heap size values from the TLVs, we can
remove all of the HAL functions that used to provide that data.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       |  8 ------
 drivers/gpu/nova-core/fb/hal/ga100.rs |  8 ------
 drivers/gpu/nova-core/fb/hal/ga102.rs |  8 ------
 drivers/gpu/nova-core/fb/hal/gb100.rs | 41 +--------------------------
 drivers/gpu/nova-core/fb/hal/gb202.rs | 13 +--------
 drivers/gpu/nova-core/fb/hal/gh100.rs | 12 +-------
 drivers/gpu/nova-core/fb/hal/tu102.rs | 16 -----------
 7 files changed, 3 insertions(+), 103 deletions(-)

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
index 7e6dc40dff32..53d403d9487b 100644
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
@@ -78,31 +73,6 @@ fn write_sysmem_flush_page_gb100(hshub0: Mmio<'_, regs::Hshub0Registers>, addr:
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
-pub(super) const fn pmu_reserved_size_gb100() -> u32 {
-    cv!(PMU_RESERVED_SIZE)
-}
-
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: Bar0<'_>) -> u64 {
         read_sysmem_flush_page_gb100(hshub0(bar))
@@ -124,15 +94,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
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
index bf5967cbffd3..fac30be446c7 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -42,14 +42,6 @@ pub(super) fn vidmem_size_gp102(bar: Bar0<'_>) -> u64 {
         .usable_fb_size()
 }
 
-pub(super) const fn pmu_reserved_size_tu102() -> u32 {
-    0
-}
-
-pub(super) const fn non_wpr_heap_size_tu102() -> u64 {
-    u64::SZ_1M
-}
-
 pub(super) const fn frts_size_tu102() -> u64 {
     u64::SZ_1M
 }
@@ -73,14 +65,6 @@ fn vidmem_size(&self, bar: Bar0<'_>) -> u64 {
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

