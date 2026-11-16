Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858933;
	b=IE9d3oUyt2HQiPIUNEWlUUSWrTQ42Q0/9bGjKTw7UfBOEehbaefOI3xfFXDdmHnLnnxa
	 UogK89Oq8z5hYsWzfwzV47ZqQvFQ1fmRzEadZvIxFeGDMmEM+xJmbLgkY3lsy0rTvnVEF
	 XKqtARvqOXgKkTSokyjAeqRmHED63V5GrFqdSj2X1wcYMuCbbLDvdIJhkBhxBzd6IYWli
	 F6bdPx/wL/jmqVMJrtBdFvJKl879wx8HkU9ue8Uav8LKy6zssPUqbnH8cULRymgJCvzUp
	 252WVMcr23CJenvR8iIipuwtHBypdh2QcxT6k185UVPKOFxW2ier4T3bm1y87gl+J5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858933;
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
	b=otVi73EjiJa2hJT19QpMogOoPdy4oCPdCs3k1ksyhhJ+IgNQIdcwtcLPYp6o0/9QI5XE
	 ZVNRDFgMzESh0OdgSuEQm1GUAzmz7N/3P7OR7JnzxU1KBwfKMnd6MQrhXyDFtLpj52ks7
	 rlrMyJMUJHPCeSDz0/niaHfvJHr9wBgbwpP5IVEBjN9/aH1GsKkHWeVUdUUg+o/UM3pnl
	 3hA0C7D9QeQh0vQrkRk6OUBa+vKsMQiBdj3ba6y4BSTFcN/FKvqe6unFq5cT07dG2tkds
	 ASLl11U7jDiQ9DQ4r5uaS1SVIL1JCg+zGzIYfG09qW01diCtx0n+kUYHDzGQDVDmx5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jrmX3+06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.0
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFC606A322
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAFC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jrmX3+06
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep8jqpUpR8P9WucwRFfYpbivNQq2Plsa1rD5slq9JswZ4a2yf2z4kEgWd0OpZieRNt8aOp7SGZRty97tni6gIcneLxj6ngUgrvUYidEgREZJQ03Qqm4vrhe9C3Uj2/M4mNkIs5hOhW/gtspk9Py6uj14aHgT74Oa0/GZGBDBof0HcTruhzFGnOy5P0CLQ8P/hFljer91Y3ZSHxuNku0TWMG8dJQ1t+FVQo6N0RyqMlcN1VlgdI645ATHcY6aVEnS9CWZ9UCmEDzBbgjECbpKWWBznHteeorumim9fuzHYpGV+NxpXcZaV9jZVlDRqNVWSoQULux/XpBGPCuxw3vy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ELYUe+TgspWfStrogdZb+jyTkObw1cMuNwy/ZiPoSw=;
 b=BfrtIW0TLnRL/Wj39bAxZWjhKdgJLOnh4BD8Fuc0egduj7/DKxaDVV3UDEyPBqS/sUbH3XOafdSzwE/gP2IQmYfXyljcgtLTOdixeYwj2COXknnLm2YSbQPGYl7tdDR+7Rsh3V7XP2QDyAnw9YMVvEv0YyWwkmhbnI0mDBIBY/8rZCmmLrnHZNFzYqTeQoHqa8TsBk63o46qlbomBOLRDOvdnMDVDTUAdqwAw2KwZbxP6HVJlbJDTa2oxQFdRXqaoJEjKb4VfoGmyj619aA+pTXq6AB9IBG1aD5NrA38jHctCVqyR8+B6slgkWa9B9P1YGDE6vWOoTq3gxmv18O6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ELYUe+TgspWfStrogdZb+jyTkObw1cMuNwy/ZiPoSw=;
 b=jrmX3+06LTco3/ft+iQsD0+E/vXTFJLmBf2oROSlLUUAmU5pQdB45oNOOibwZuZXgFMGlI9eyZFTioX0YgIu170z/djGjvYmjMxtxA1AUNpKXyJAeQQPypnxvGyXiF8+TVz6axgowM0QrnyDvZ0BQN0BdbfG3uGF82w4aJySxyl8vhpG7WsOR8fHnAnnKt9WyILswfRFjlk8kf3H+RvvCWWWFVs+uvwvisZo0UFxIyMEEIarO1djYyxJHqVz3GxW5FvAgxsjwgElExutyqGbEniw6jGUFl6Sg+wMfpSzZSVrFsBxOC/REFNoUxUBuqnv/Rezx1uayvxFGqrC9BkP9A==
Received: from BN1PR10CA0003.namprd10.prod.outlook.com (2603:10b6:408:e0::8)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:24 +0000
Received: from BN3PEPF00022BC7.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::6e) by BN1PR10CA0003.outlook.office365.com
 (2603:10b6:408:e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:55:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC7.mail.protection.outlook.com (10.167.248.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:53 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:52 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 4/7] gpu: nova-core: remove heap size related HAL functions
Date: Mon, 16 Nov 2026 13:54:38 -0600
Message-ID: <20261116195441.940595-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC7:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c4fb1b-2e48-45d4-5146-08df441b8e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	r1tTyLEVdM5EjEk2M3F3NKDNV80RErxY0Qj+2JNios4ww2SFuzuY4zH1d4q1jNeJOdAFXNtoUxdfVm6dxELA1tiYfb95WspecLkoMI56t37TvBAAhIBP954E7RWFLhLHvDqb/klc1B91bU+LRE66ASFXGXAWBx41Ebxs8Y0QBdWEOt1f2f9BYOQS6GN2jF9Uz0ticWObFFP/4hsswttGWxFKRjCNpKehi67UyXI9p4dRK5QeojQ09TMVnzkYNMPu1Ms8kaa8aESVIVI+h5ZktKMnSeBLZWxgsSTewVcOgMgCDEKNTCFO0w9zgA7c2q53qU3ECP3CgnFPTlOgHnbyI0wKNthwLi4dsIbRmK4195ibYpGaVHw4W5jwt8VgyclMm/hXqDGEjgi3FikRsG1MhulR7g5Zy1/Lbw/odtowp4DcC/uE3kawbumRaLNGPqfXUI3mH1G0GEAI4Rg4xR3p0TsX3ELnEeOsJCUlJCRtWIomHPKk2/7lk4pc+kW/mF4S6VV4DWeAGbQI3ff/63vzOyqH/eu+MpVwrY00AstPgaByEw6dsEb25QjPdlMXXjEAhmyL1AMgVFI5FgJw/AV840/kBG7KD3S/ll+aA3QMIJ3MT08J9lQW0CpsYiquplFhElyrOC6FUYbnOWB6KfQEkXZIwASOMgYC97j4IQaZ6QQqc4W11C4P1rJYONq+38c9QeIA9LtzA6tMPxZ3Ck6cbg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nwB3Xl5c6BtkIIGaRA6L85NhvT/AxsUa9PxK4YKw3wcOXR+y6Whu0eOyO5oTmYGTsXWtI8lOYePu7nC61Q+Mkd2CLS70GC+UWkBbQiGvuAvSQYmenYhyWNILiW4nOW9Ow5nOa+/Iavgl80J8yfUCTGYdHqn9/ZGm0JQOh3lbf6mT0CA2r4wOZhbrdEJw5I/RsZSEg+A8uZCryk63sGbDXO8VJBMEl8PQuoyw1P/n/6GEJ1eGh24ZuTUg933le4D99pcrDiOPYGErtqLkbhOq35ObZzKqshIZ4l3kDx4DQC84TVLji7czQW60CVNOl19aDagJgRaXyyii/kkvdlYYdbMwJzB5ukNRL1huVlEvDq2BDqOK2PUrD/vqiXeDF7d2yNdk+Tfkfhr3uzNP/2k50H7N7N9TOTCBzIdvNSmprmm/1NhMI78KNAUiAhzNNfnz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:24.5756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c4fb1b-2e48-45d4-5146-08df441b8e05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

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

