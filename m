Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352288;
	b=lp4kBEsi6atbwQCVFquX1Yq9/z41dfOAWTBxbk2Zslrh2y0JX2yk/F7iQKI+HFOnSCBi
	 5KSmCsdiasA2HFr43YZE2/zSYtGeCtiM1RdpwfVWz0+kkocbMzyMMYSs6nE9+RnC9Jd3S
	 eLM3+twJaQ/rSx2O0LTzwqlI579D67sLwMXMlZaJ3vrM3YttjTDsQ3o4I9QckWpkAsiQt
	 wCkwDcXVZ4vq/htZH8iEENu7BTcCTRaXF7xpDDaIS5pG4w6pzkewqbRj7clWogMOBim91
	 j968MelNbOPzhdTWZBLWHMUV1R7TyFcIM5q0TkmVgjzYSrWAr9eN7DqYcPrID8IGNhQ==
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
	bh=otysLC2cnE5lNa7I3rA9e0h2/o0FhdFPcOw7gMAbJcQ=;
	b=vVjK6Mb6cM8/XzACDRy6p4c1MWEgbjIybHrJK9kauCGt2E/51eKWxphzdEMDDNs/+mhj
	 YiPoAUX7TyxwgziisEtT3UahRuyADr7de3jklqHTg5gcDJNQlnTneTLuyiWZ1MqbTXFmH
	 1JEcgTpxcRQZMPc3FwYjogqlGfG57P+/Qtno2VrRoyPrP0Wv5qq4qJFVGd94k8yhgpO7j
	 ROCgg0p/8bBAuddTRfpNb2HvQQ5nAJ/Q+M5BZFyhA/iBJfUGNSDptLlcMAIKjJ4Yr0JPM
	 7vzMa6fYkmc8GmXBPwFkhZiDaLCnMQzMw3TZSMTJy1YTX5l+a+92XcAL/CwlaOhLNsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zpz2m0d9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.33
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C69606A320
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zpz2m0d9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPxX6KaprSGiXWDxgf4OhAPJH7TRahhAE7x0ySYgBTVybQLk8tkAnSt1XNJPoqnNEF5IJH1cwYzSUS8+oMjo8HleZ1GYFdSncj2ITGkyGp35QMAZUH6o7BlC9JGHMEQ2XvH2LmTy6zW3iY8sWDxoYgo/tlifFjfrtIpaBIkx2xi2SQ9QWxu3IneU+5u7tKR4AKMfTcIiETr0GzuN/86ifAoPLTEiFwSAUdBM0E/orjmERd5a0HeZyFra246CuOYXUX3b+bCovxD1FH/IMtO+exWeVrgDEtpSZL2/bsOl5MzcUM/UcSQbyhiEOe5t6bff9g3MdPcn+pjGY4XEDV0jMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otysLC2cnE5lNa7I3rA9e0h2/o0FhdFPcOw7gMAbJcQ=;
 b=NuhC3BrW4X+E7XIeLqTya9H7jIqU5UGXJigZheyyFOe+Cm2/frlGtSeuaH4t+hucZDuysAAEuKnr4iLIR0xMFKq2Yy4n49gWoa91ny7w4AbfVbAmALFhUYsMYqLn3VwzJhSehX5xbc4lCf/MxaOMJ/lfZiNfe0ZXvlaR1XeaQ4PAruV2kVr1sVqw/E4BtP04+BxBmN7LUVT8DsWOnr0XAmdSJ5FYTsAxvIo2vwo2ck+ADzcxAVM/xUlWBgLifsdhd+OAniLTj9DK9RTp5ZCo7Di63/tECMOR3bgtWZ6vAT2O0RJ82CBmZx9XWCD0fgWqe5DS1XnOH8D4OZos6fE5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otysLC2cnE5lNa7I3rA9e0h2/o0FhdFPcOw7gMAbJcQ=;
 b=Zpz2m0d90YapIhgtpPlTEbXp98Dbehv23uv5xDkz1tL1MlO5BRvpw4SJzB5qnfXGhxzFmJ5Yc8LnDvjU1D1YCezzfSsvu2CQdX5R6Snj1TtUIgg5z85JPhpmFb+gv5Hxs9qYQkgkqIE+76im5VTwdMmzMtyIWsuk23y6PsLkRakE/Ts6u7abSE7t0RaLCMp5YNQ7dNYU2NSOvOLwN1aEbCrG0hrs8TTq33IKnDIQJ+iNRiL5TatokJ4yzsDaptkAvaKe+6BnnT1rKKq/Q/wG2h8PdKdYNzjSvAG9XWgNKDlwBDGEZNc0HVtS6GQRPHm49w/lxGLAPHphZbrMUxNskQ==
Received: from DS1PR03CA0011.namprd03.prod.outlook.com (2603:10b6:8:450::13)
 by CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 23:11:22 +0000
Received: from DS8PEPF000000E0.namprd05.prod.outlook.com
 (2603:10b6:8:450:cafe::58) by DS1PR03CA0011.outlook.office365.com
 (2603:10b6:8:450::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS8PEPF000000E0.mail.protection.outlook.com (10.167.23.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:06 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 4/5] gpu: nova-core: use the TLV heap sizes
Date: Tue, 10 Nov 2026 17:10:52 -0600
Message-ID: <20261110231053.1352163-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E0:EE_|CH8PR12MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 758ad26b-1690-4aaa-e7ac-08df3f7fefa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|260925022911599003|260925021311599003|260925021911599003|11063799006|261022105027099003|261026140227099003|261021121427099003|261021123027099003|261026121527099003|56012099006|261009223027099003|261028144727099003|261022075727099003|261022115727099003|261102123227099003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nMqmmOdsoH/Z0m5+0c7WSKdG2+ho9FQk/C+rXhh1pSXA72iMkiTp/e+rrzvY/pyTcKkaFG4foK76OBn7y/DpR6u6qQPKpqfGzk+RKUd890JfEFB6LHdgivg8ynfOkqc9J9hxPUsYveCEKQ9Lt46iWTdNyuDF5RPIQXs9uyzMSdV8FHvptEokKSQfEa05C7D50HLf6aCIR13H/HeTL41w76o9QEME4SWVW4+ZjQY+Uho3z8a/dQuDqDIt77cxonJ8f+2QVQD6T4Nx4QsH83a49l0sOjbktJPhPztJBY2IFYRS0rZs05/MrlgPfOomuDZ6RfZkEkfVUwwDD6qnfLOSUpDNGS7wGk+92ncvWBWkg4ogkLhBShDwPcjTi75qKe+k5wQd87STb77CPxz8aUjhXHSbRUkLEny5l9MT2NfadFxtCj8TFhb+ADS0oBeoDAOOCGeVcatDZYbOiJ2iLGtzNEgNhbpktdEPWT3j5MfG0tFJRo0mC0iZesT4fVRRZ9G7vvi1Ytfxri7yKVAOLXf1Eai7e07JiEH5BqNUN9gc6OmV57WGao5ZrSagEo4OoNcMS7W28mrGZMuOgba9ZnHpYzx445I7CXAA5YVbNVQKwkHSm5FfUavprtqKSXuIrRdFOMgyqQizduyt77TZzp/pnFw5KJCqCMJS+vHHjleVr1vpUE6Zn/dwZlCZZO7TtLO1ik8j13tE4ZKveLzuJ/hChg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(261026121527099003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261022115727099003)(261102123227099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HgNA0N/4cs5graKourfSI7Ha10jl/CClW3I3XTw2X3v2PG0v4ORE6rtTkkpBSAU/qJ/3LCoLo5ckR7ZaPOHHNPJYi7Cf08YDHu0J40Ue2P+VoYGANGKPTrzMJR+3kaHM9Sey8yIgIwPg8XS3Avw2ltR7D3NnzrmSCjEpUy4RVVfLrn/3fJGammuMLXEMfHJfBqIuY9I6WY7c3wcJeyQ4EY2t7y6u+CjC8z0s1eok22Isgimo69NPMpdwoQwChAjhMU6LfT1096eIK/qtmpCSZGuXjN45BAasHUUyYLsGGK0naxzwaW3u18MVTc7IDSpEkgZ2YLlnfqX7E1u4JBWZ0Iyq/pjKiTBLWYWDDm6+0jh74UG61gVmZJt369GQ+8Jg3BlgDfnUOxJSMPSgR/RfDPwQBGwUhlx+zirNEyPUZxPiIUFpeybv5raLqxp03K+5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:22.2819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758ad26b-1690-4aaa-e7ac-08df3f7fefa9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9815

Instead of calculating the various heap sizes needed by GSP-RM to boot
from constants and HAL functions, use the heap sizes read from gsp.tlv.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs            |  31 ++++--
 drivers/gpu/nova-core/fb/hal.rs        |   2 +
 drivers/gpu/nova-core/firmware/gsp.rs  |   7 +-
 drivers/gpu/nova-core/gsp/fw.rs        | 143 ++++---------------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |   2 +-
 5 files changed, 47 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 9a3314768385..ca1cb4af9ca5 100644
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
@@ -264,7 +265,7 @@ pub(crate) fn new(
         };
 
         let non_wpr_heap = {
-            let non_wpr_heap_size = hal.non_wpr_heap_size();
+            let non_wpr_heap_size = gsp_fw.heap_params.tlv_non_wpr_heap_size;
             FbRange(wpr2.start - non_wpr_heap_size..wpr2.start)
         };
 
@@ -278,7 +279,7 @@ pub(crate) fn new(
             wpr2,
             non_wpr_heap,
             vf_partition_count,
-            pmu_reserved_size: hal.pmu_reserved_size(),
+            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
         })
     }
 }
@@ -298,14 +299,16 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 }
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
-fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Result<(u8, u64)> {
-    let heap_params = gsp::GspFwHeapParams::from_chipset(chipset);
-
+fn wpr2_heap_params(
+    heap_params: &gsp::GspFwHeapParams,
+    vgpu_state: VgpuState,
+    fb_size: u64,
+) -> Result<(u8, u64)> {
     Ok(match vgpu_state {
         VgpuState::Disabled => (0, heap_params.wpr_heap_size(fb_size)?),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            heap_params.vgpu_wpr_heap_size(),
+            heap_params.vgpu_wpr_heap_size(total_vfs.get())?,
         ),
     })
 }
@@ -327,16 +330,22 @@ pub(crate) struct FbSizes {
 
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
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
+        let (vf_partition_count, wpr2_heap_size) =
+            wpr2_heap_params(&gsp_fw.heap_params, vgpu_state, fb_size)?;
 
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
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a2db7b6ba131..7fd518af9dba 100644
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
@@ -48,6 +51,7 @@ pub(crate) fn new(
             let fw_vvec = tlv.load_file(dev, chipset)?;
 
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
+            let heap_params = GspFwHeapParams::from_tlv(&tlv)?;
 
             Ok(try_pin_init!(Self {
                 radix3 <- Radix3::new(dev, fw_vvec),
@@ -57,6 +61,7 @@ pub(crate) fn new(
 
                     RiscvFirmware::new(dev, &bl)?
                 },
+                heap_params,
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f0edae9656d8..8873282ac4cd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,8 +7,6 @@
 // Alias to avoid repeating the version number with every use.
 use r000_00 as bindings;
 
-use core::ops::Range;
-
 use kernel::{
     bitfield,
     dma::Coherent,
@@ -40,10 +38,6 @@
         gsp::GspFirmware,
         tlv::Tlv, //
     },
-    gpu::{
-        Architecture,
-        Chipset, //
-    },
     gsp::{
         cmdq::Cmdq,
         GSP_PAGE_SHIFT,
@@ -68,110 +62,23 @@
 
 /// Heap memory requirements and constraints for booting GSP-RM.
 pub(crate) struct GspFwHeapParams {
-    /// The amount of heap memory used during GSP-RM boot and initialization (up to and including
-    /// the first client subdevice allocation), in bytes.
-    base_rm_size: u64,
-    /// The base amount of heap required by the GSP operating system, in bytes.
-    carveout_size: u64,
-    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
-    allowed_heap_size: Range<u64>,
-
-    #[expect(unused)]
     tlv_gsp_fw_heap_base_size: u64,
-    #[expect(unused)]
     tlv_gsp_hw_heap_size_per_gb: u64,
-    #[expect(unused)]
     tlv_gsp_fw_heap_base_size_vgpu: u64,
-    #[expect(unused)]
     tlv_gsp_fw_heap_size_per_vm: u64,
-    #[expect(unused)]
-    tlv_pmu_reserved_size: u32,
-    #[expect(unused)]
-    tlv_non_wpr_heap_size: u64,
+    pub(crate) tlv_pmu_reserved_size: u32,
+    pub(crate) tlv_non_wpr_heap_size: u64,
 }
 
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 impl GspFwHeapParams {
-    /// Version 2 of the GSP LIBOS (Turing and GA100)
-    fn libos2() -> Self {
-        Self {
-            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
-            carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
-            allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB => u64)
-                * u64::SZ_1M
-                ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB => u64) * u64::SZ_1M,
-
-            tlv_gsp_fw_heap_base_size: 0,
-            tlv_gsp_hw_heap_size_per_gb: 0,
-            tlv_gsp_fw_heap_base_size_vgpu: 0,
-            tlv_gsp_fw_heap_size_per_vm: 0,
-            tlv_pmu_reserved_size: 0,
-            tlv_non_wpr_heap_size: 0,
-        }
-    }
-
-    /// Version 3 of the GSP LIBOS (GA102 - AD10x)
-    fn libos3() -> Self {
-        Self {
-            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
-            carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
-            allowed_heap_size: cv!(
-                bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB => u64)
-                * u64::SZ_1M
-                ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB => u64)
-                    * u64::SZ_1M,
-
-            tlv_gsp_fw_heap_base_size: 0,
-            tlv_gsp_hw_heap_size_per_gb: 0,
-            tlv_gsp_fw_heap_base_size_vgpu: 0,
-            tlv_gsp_fw_heap_size_per_vm: 0,
-            tlv_pmu_reserved_size: 0,
-            tlv_non_wpr_heap_size: 0,
-        }
-    }
-
-    /// Version 3 of the GSP LIBOS, (GH100+)
-    fn libos3_gh100() -> Self {
-        let base = Self::libos3();
-
-        Self {
-            base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100),
-            carveout_size: base.carveout_size,
-            allowed_heap_size: base.allowed_heap_size,
-
-            tlv_gsp_fw_heap_base_size: 0,
-            tlv_gsp_hw_heap_size_per_gb: 0,
-            tlv_gsp_fw_heap_base_size_vgpu: 0,
-            tlv_gsp_fw_heap_size_per_vm: 0,
-            tlv_pmu_reserved_size: 0,
-            tlv_non_wpr_heap_size: 0,
-        }
-    }
-
     /// Returns the heap parameters corresponding to `chipset`.
     ///
     /// The parameters reported by GSP-RM are initialized to zero.
-    pub(crate) fn from_chipset(chipset: Chipset) -> Self {
-        match chipset.arch() {
-            Architecture::Turing => Self::libos2(),
-            Architecture::Ampere if chipset < Chipset::GA102 => Self::libos2(),
-            Architecture::Ampere | Architecture::Ada => Self::libos3(),
-            _ => Self::libos3_gh100(),
-        }
-    }
-
-    /// Returns the heap parameters from the TLV
-    #[expect(unused)]
     pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         Ok(Self {
-            // These three fields are not used for TLV-based implementations,
-            // so assign dummy values to them for now.
-            base_rm_size: 0,
-            carveout_size: 0,
-            allowed_heap_size: u64::MIN..u64::MAX,
-
             tlv_gsp_fw_heap_base_size: tlv.get_u64(b"HBSZ")?,
             tlv_gsp_hw_heap_size_per_gb: tlv.get_u64(b"HSPG")?,
             tlv_gsp_fw_heap_base_size_vgpu: tlv.get_u64(b"HBSV")?,
@@ -182,44 +89,30 @@ pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
     }
 
     /// Returns the WPR heap size to reserve when vGPU is enabled.
-    pub(crate) fn vgpu_wpr_heap_size(&self) -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
-    }
-
-    /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+    pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
+        //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+        let vm_size = self
+            .tlv_gsp_fw_heap_size_per_vm
+            .saturating_mul(u64::from(total_vfs))
             .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
-    }
+            .ok_or(EINVAL)?;
 
-    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
-    /// `fb_size`.
-    fn management_overhead(fb_size: u64) -> Result<u64> {
-        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
-
-        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB)
-            .checked_mul(fb_size_gb)
-            .ok_or(EINVAL)?
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .ok_or(EINVAL)
+        Ok(self.tlv_gsp_fw_heap_base_size_vgpu.saturating_add(vm_size))
     }
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes).
     pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
-        // The WPR heap will contain the following:
-        // LIBOS carveout,
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
+        let management_overhead: u64 = self
+            .tlv_gsp_hw_heap_size_per_gb
+            .saturating_mul(fb_size_gb)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .ok_or(EINVAL)?;
+
         Ok(self
-            .carveout_size
-            // RM boot working memory,
-            .saturating_add(self.base_rm_size)
-            // One RM client,
-            .saturating_add(Self::client_alloc_size())
-            // Overhead for memory management.
-            .saturating_add(Self::management_overhead(fb_size)?)
-            // Clamp to the supported heap sizes.
-            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
+            .tlv_gsp_fw_heap_base_size
+            .saturating_add(management_overhead))
     }
 }
 
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

