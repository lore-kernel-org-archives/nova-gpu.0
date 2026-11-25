Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641922;
	b=4/qWqe7DEWKdeb1OncIRNE6pptBgstddfxTtNf+OC/bgqP0R8EB8Szkrgkj1GPq3/yit
	 VzpQTlb0jyso5preBqAz3816bFIAO51/4fYAL2gjoGAImimoLFoVriZQqqRcAhk3lVCMO
	 yFymvqOHj4AxROZVaFFavV5aRXB/K8CtLs/28oUsHXJ84pHmt/qEW3cU0RrPA3nB6eViu
	 ynrxlWT7asxTDrxoOhzD+Gi91bGou9cMyNXtBCRc+oFGCrAlSC6mUynKUWcU0AwbaLFzr
	 xzDNu513zM8Vw5e+U/Wfc8bxtq5B8a7Fan9Q7qzAKwZ2CYCG6fI8r8qTS7vgF386ZyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641922;
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
	bh=HpiD5ISFhj6pXMq0sxqVGd2kfR4K+ZBLSqEzWaLoUvQ=;
	b=rCEwHSODQfvKHbefPJK8ZiIpQBRTz7Rx9Gh2ZPhnCOHL/e5Y8SEQgMDPqd8f0WGp9XJt
	 BpSQtAuD6AmthgxAq1mwHwsikK4ytTOWq7XHn9DisPlWPn1iftWGPkEZHYe0/4tK4bgtB
	 2wdxNZJatTVvuZo4P/Ap2Del7v4v49HsVO+Wmf2ksXo/E4BmIKhY0EYsLOePnoqV/ngGU
	 Y2IX3GpxMKSGpkVD9/sH9SocB8FHYGI7kpcAUuU3+tIaLsfEMeasFKsISUa+qaVTLD4L1
	 pjlzA1T1esA/nyrFNraHhyHSH2go4WpNSotXiZ13uamybUCrK9tI8anzr6MWU9SOBeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PP4Gzoqk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.35
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9212606A321
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9212606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PP4Gzoqk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q08in+NsxzKW7kYavGPXrz2FKdchrfc7HOHHLU9a4fxbnVuU3T35+OpSdPX4m/lKLz7gVhi+8Qnq6uStVv3mAkvARdFJCrnQjiD0QnR11jQqJhogEeYX7zUvodus9smo2ev1dPOQEmiVjpCx3Lo4SAKxhWg5/hD1RAm8qYY6Z3+J7IsTX1n2Vas38XxQbh7GTVR1RRdE9W39cKglFMtuPBepuUc7PDffkkw5iriUexFEdjV/Kii9T1GnfQUAruL7GtrzE8AzIGDsV8Jh/uVbgn9scwLEeADPcM93pnARokoHY3spxQleO8esWsdPFHyPHJVFq0nTfZY2OiiU2/lv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpiD5ISFhj6pXMq0sxqVGd2kfR4K+ZBLSqEzWaLoUvQ=;
 b=Ux+bDCUoXDWnzzUllibcn7ar1NlfkqP0/7dbbB5jg78QSQPlqO/P16tfTyZx4fL7Gep6YkqmpVDDeRCBnI3XcV+j16apdQJD7ymGl7wBeB2vbb2Yw38C2VmrHvb95B6U5yzL7sn7cguz2aiccRoU8Tt7d9I12ArPDkyZHxkp7VD/6hfUCMO1SQdjbP7EkjhelOwo0Jm9Iol2Tti9zZDnqdDjcG70/Woh9bTWrfwjQa3yhVMWGs0qWfTbxs+rXxRZgc2AcV0oMpSYUoMjRUyH9c0NQaTREBFhvfl9wwgVmTFB1p3hof+nwpCthXzX1igTcFe5DDPWHI+5VOUzBjlUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpiD5ISFhj6pXMq0sxqVGd2kfR4K+ZBLSqEzWaLoUvQ=;
 b=PP4Gzoqk0n9Ug7A1bl+DlkeiPDHAD4GOCJx7wIOYHFF2QQj/bGcR5Ej8Xe43/WzfIuOckH3n4OwUXsG0m6QcRw8Px27fuNBg9tXVi9HcinjBvR+x1tO5d8TLA8qif4bZVf7eLt+laPXkhiNbn1s25lpxJ0+QgYdI/OPrXxVu/ta6ZT0j4pG6HtQpjs23czl8edhj6p53ig30tEm/fvg0oRf+hhvdSsU6634yhh/QskU1CLyjkNKWdjg2O3SQrnBtGLJ4Ol88IkIRQbcw5Wg0Quabg5/pZqaOHZvPV2o4cvQrBRqhoghQgIRbx5Exk8UMcRb1mNL/JA/jew7d79rgEg==
Received: from SJ0PR13CA0137.namprd13.prod.outlook.com (2603:10b6:a03:2c6::22)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 21:25:16 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::7) by SJ0PR13CA0137.outlook.office365.com
 (2603:10b6:a03:2c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 21:25:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:04 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 5/7] gpu: nova-core: add TLV versions of WPR heap size functions
Date: Wed, 25 Nov 2026 15:24:43 -0600
Message-ID: <20261125212445.620391-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 08138258-7aa5-48ba-63cb-08df4b3a9920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CbaJU7CxA0EcrXxmDbvTAtukWvm/bJzEBgvgVZLsDS1R4n3g/zYaGzVy08eKveC3muFSt2SVuASyCeLGQOCcW74lOc2mKfr8/eCrjZ+EhMz7B68fyPvoBwanrfmCKezrjramulRYUp982kFQBTS1GQe8IF8tH7PBPCKSDkBaD/Ll+5VCa8RxRz847xZYajipLW408g00Y6ZShz1y9eAafGWECRVSIH1yDPxx2gLtz0RrFMULNck3Q0wPqK8JQP6n5coffsTdUxVJiABiM541U8IGBYyl2LRRDC5Wi/OYbij6cNtOljli/ReuTlDv+55lQB8Baa3/dK1KNAnLmD3xujjA7YBbEVX6IcLh9ivWjNmU0LUUN5KjfAjfOjLdxH7o0nOEfEpFvNTbv0EhZS+9Ni25kOku7K/x/71PFyFhgMgBma19/4qmTSjsiKzeDbtBiooim4fC64jx3NdkjSHoBta/pMXcDs+J8EFfGvNC7I9XvCRSWrAk1agkrYsqtgc24DOpfv7IrVv2jtlP3VV5lAVZhkexuZhJ8p9L+7baksdFHFL1dZY3gTWeSuniE4VZ1uaFVgiXjnsu6s42DEt/St94zcEGmR1TS5mgBo5xEuaeQIdY/+VqGFpCW/1AK/urywv1x72Ttak03SlvEiHyhtPIaH+yk0E2k7QC9ndtXroY5A1KPush8FQZOM+GHGRAGibODz5SrTc6RDavVY5XLA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b4NwFKETZmEjVCYtvZZU6g6ZcADCwhri/vaYaeU3Xo1ynBjPSJhKbER0Z/AYfKZKrYxeQrLknLctYqEUDYURnNZOMEmNy27YUo2B6X+Hk1KN/ZqAycVW8TlcRqiPK72L6nOGap0wp9jd5vr7dYTbk36XX1FvFGWcbZqovR69kuG75Sh1uBJ7TSJxF1VSyTm6h37UP7JtNQQ1TimDH7U4Cy1AuaL3b04Lbb8zkHe6+Fo4OnlELq+YavqsJHPJjaxywpgWoIcs3NiyYbu66RX5PywWhaZ60ENN0yAJWHrBgrp6DP6LIZAitCkdz6F3QVeqiHTYn/iWA8isk2JypW4eno4NRs5na8mYSn0Ivt9mQ59n2CMx+xduHF1AN43ERIVpUAeXVvOehISjgfvCtgWyOy3FaArcxRIcAbghJTAPZvslTFwnuE4R42yVQpKcWmFw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:15.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08138258-7aa5-48ba-63cb-08df4b3a9920
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457

Add TLV versions of vgpu_wpr_heap_size() and wpr_heap_size() to
GspFwHeapParams.  These complement the same functions in LibosParams.
We add them to GspFwHeapParams because LibosParams will be removed
in a future commit, and the driver will use the GspFwHeapParams
version instead.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index fdb7f9625686..e59a10beaa94 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -68,13 +68,9 @@
 
 /// Heap memory requirements and constraints for booting GSP-RM.
 pub(crate) struct GspFwHeapParams {
-    #[expect(unused)]
     wpr2_heap_base_size: u64,
-    #[expect(unused)]
     wpr2_heap_size_per_gib: u64,
-    #[expect(unused)]
     vgpu_wpr2_heap_base_size: u64,
-    #[expect(unused)]
     vgpu_wpr2_heap_size_per_vf: u64,
     pub(crate) pmu_reserved_size: u32,
     pub(crate) non_wpr_heap_size: u64,
@@ -127,6 +123,35 @@ fn management_overhead(fb_size: u64) -> Result<u64> {
             .align_up(GSP_HEAP_ALIGNMENT)
             .ok_or(EINVAL)
     }
+
+    /// Returns the WPR heap size to reserve when vGPU is enabled.
+    #[expect(unused)]
+    pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
+        //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+        let vm_size = self
+            .vgpu_wpr2_heap_size_per_vf
+            .checked_mul(u64::from(total_vfs))
+            .and_then(|size| size.align_up(GSP_HEAP_ALIGNMENT))
+            .ok_or(EINVAL)?;
+
+        Ok(self.vgpu_wpr2_heap_base_size.saturating_add(vm_size))
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes).
+    #[expect(unused)]
+    pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
+        let management_overhead = self
+            .wpr2_heap_size_per_gib
+            .checked_mul(fb_size_gb)
+            .and_then(|size| size.align_up(GSP_HEAP_ALIGNMENT))
+            .ok_or(EINVAL)?;
+
+        self.wpr2_heap_base_size
+            .checked_add(management_overhead)
+            .ok_or(EINVAL)
+    }
 }
 
 /// Heap memory requirements and constraints for a given version of the GSP LIBOS.
-- 
2.56.1

