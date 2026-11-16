Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858918;
	b=FTa/dY7cz9PNw4PBYWXpBtDXoozjvMVZIDYSOY645dVrP0LdJlsbRWBrfvUnl4EAf7Z7
	 1SPKl1Vd9zO4rxGr1ZnaobdxcaBzoasKQK6zJQ09+qVVTK0rkzF/xoyp/DDe48E4FrvrF
	 ORTMjCTjchdqLIWxfJn3Ig8/pqiZnIFI1M4noq01X62W9fbPfkDBLfIifqbdL61czoCeI
	 yzvUSrYnjnH/yFCgi44rV3BYLmbTc7qW7TE+dRNPMCt2sLklivMWuB18i8BDTdKpUKsX9
	 7K9vmbjEfz39r6Bo2Vg2zORo2JlomhoHjDiWWWdzxQSb+NKSvtm2aSJDHV+ZR+K7yrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858918;
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
	bh=pYxodhZkI6ZKFaxczvyxDj41kxloHKaPmHIoqvCFptc=;
	b=YZ7s+/sU7wpG3cN/f0uUx9f/f4C4m0zsIrZSiBl9mSVzsPObBqrdWogWozrXKWqFdrGw
	 ElwUvoVpRZXoodR3z+0bwc1KOsstjt36/jIQlQHIEcaG8ukAM+6Fr5bo/b9NLarIWPQYF
	 QU1OXcQPIQ9PLs4WBo7bMPI9gZyeeBnyqh5KAtknNAs+bUz4wsnkrAN2GVtMx+y1OVUUx
	 +DhGwpraieirKCObM9FT42cDZsq3DIADYLm9B17hFlOQ+igFCLvm1dXmodu45Wxs+wwK9
	 bn8HJeQMhul23iGapO2es/MO6bOkFmle7/1c3dfzn9SicF0RVrj+JfWEXDfddlLyE3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cOTGjwng;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.64
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5153A606A32C
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5153A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cOTGjwng
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x27P13muIfh/7+QSB62Rf6gE75gzCPBXw/ZtfiwoamM+4m8YQPQMOEDTXWquL4iRYZoP268839e+ayALoK0xNN6XqiVYLdFsNk3uy3vSh6dWvbX3vrzHWAGApJn/hGryzE2ava+Iyg94Ge6EiMykaDYucifYBv39Y3KeM0+3Pw4AqFMo07SSZlPVl1BMzxoimIBR8y/Mc7/hrwhmR7abzspxQ8BrdviICRBJacjCyVkXIL+W8zxN68KW8ePbnfheOclaBtnxyxtxvwF9uj+d2TZf6RmOvL03PLI8j5lQo3F0KBa2Htb4wQezCq6aPsMZZHzEszm1BpFWEvrOHrRvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYxodhZkI6ZKFaxczvyxDj41kxloHKaPmHIoqvCFptc=;
 b=f5xGIFMUBk4pKrOZWg01JaqaH5kkOlNITfhrFEtDMrIKNyqgqv4krFs74rVH5qXUpOvE4OZEv7oT5UXvfXa4Ubu+fGBuco2Oj+5J5Lm9wrB79ZjV/gTceeKAXr+VCu1WocIv+JgkTP7i6J/e65lWDsm0T4QDAB16FD78+N0/9HJJMgN9LBsuvVMVgkvruJixHd0bFrhcWe66qQBLJgv6xO8utcr3959vEHr0vq1IZrYBtPCbI7XThz4kKRg4ZcftKM10HKqdETICqQQa9vA35w7ml+ERqPgVmvRakJCAJtpciy9r3+3AQWWNGuf6JQSLB2KGULjP9R8ZzhPU+UoTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYxodhZkI6ZKFaxczvyxDj41kxloHKaPmHIoqvCFptc=;
 b=cOTGjwngng7U/yP0Nzcib+QrJtDv751mDn/C5nW07SqXadnRz2n5Fm4uolAt7KIt0Nlo7t1FeVtgW4pZ9ryqt5mrfQZ4V3DdLCaYd55HJ295gZa//d1+zw8Bn9bAXSWcmw9E59meZgk5ird6iIccI5i9v9HqUaiIhbAAjbdExgCyTh3E8wqnf3mbBVGps/eY4YIpzcqCXcabXsoEK6slfDflrXUy+8Z2a0n6lgAS+B4sR7g9CUcr0vbgL9pzZs2aWE1pArKtpBw3uxoeywKnIG+8ZHZ0jFDFpVPqndYQUuj+mB7h1jFJZtpUIjMBbjTrsSupbXmhiRz9qW0JoUu10w==
Received: from DM6PR07CA0082.namprd07.prod.outlook.com (2603:10b6:5:337::15)
 by IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:14 +0000
Received: from CH7PEPF0000001A.namprd21.prod.outlook.com
 (2603:10b6:5:337:cafe::54) by DM6PR07CA0082.outlook.office365.com
 (2603:10b6:5:337::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:55:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH7PEPF0000001A.mail.protection.outlook.com (10.167.244.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Mon, 16 Nov 2026 19:55:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 11:54:53 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 5/7] gpu: nova-core: add TLV versions of WPR heap size functions
Date: Mon, 16 Nov 2026 13:54:39 -0600
Message-ID: <20261116195441.940595-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH7PEPF0000001A:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 29240d76-4aee-4254-b5d5-08df441b877a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261021121427099003|261026140227099003|261021123027099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AAGKUs9IcVogj5cr5Uz2L/j4KnN4srNHmYacVgDmaGdfdH/6CC/PoHCyc61hSnSlgne1OP0MbhLR9Yz0lXW2TWZqGAeh6yqML2USQCyQuaNrqyMRyKOjWEq2M2yAfAm1TX48RdIFA/m0cKNiSSJkFNgFHRSu8Jzl4Xv7WCqA/jVwmT8oE5sDV7+q9U4BKmK9DXkyJZOff5G+t4ROSmhIiN+OnxxhLHUcxE0Q+D3vHk5ajEhvPD+WcGyas5xcFoeh1nvrpUXyEng5kRbIjXihy1KwlXXcvtE0uZKxrwP7lyYHWsPde/lX8UrpreTpn9/6V/fGTrLcrh2MhxwlMSwTTvWKmqtnd5roEbppXC8vm4JfEbwL38V0oVHfWVhNAO4PcxSoSQQNo920lGMJ25/Tg+W0NiG0WQ5tcd7LDQ4Qd1r/A7kBI1miiPlmRsz45kbCA82Dz9RdFLpLKb90K9ytD3v6ODfCuXcCUe3G3Krmr1/AzN6dXwkL2Ms5T3nWg7cRkw5Vh07wx5yQd/Jae7yHCvRonV92xp/pf35kMfMkAobyLjz6uwPxZsmtn55EFCi4HFB71c/8TZKfOtOeHQLEC5GsXdmswYLJHeeQDLiSnL4zhkkzjozv3vplWpXhp8r3fVdpwqEiZOfzNf8WV0/eWtuf/Slma+3OmveA1912WyLC6Vx6LqEbJm+idGzR+wHo
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026140227099003)(261021123027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D2w3z55nn3RClYK9Cv93sLdHe1ModM8+n9QCBhxhPi92TOxtOgJJ5KNleDFxCQai8AGk3IT64XJ1zZMx9y6JXJNtkFMdNzBbDkr3nTft1ASPSdlSmpNyp8CGa9CQrAFLYKLsEyBGkt/q8mCJTqSFgAQ6+xdssaG9bbXOh9wi9/UrKFxdbcehnS07j2cgWwXB5Qri2dWVkF/lH4+jkcTVBOWRS6LkRAiu63O2NscZOir316JJgc1MLz5MjdrtwJA6ugGcqiQVZY6PpsN22AGqRudCZ5CUxSH7jr1lM8XWEkKbvazRner2ilBlhwwu9B/hSEzpZYXwikYYvL2pGnR4UEKI3ysZzCe9/YUrWqp+/c31mpo2V1poY8uQ+ffJRvKpeXHH4vmuilcgcQs6uTUiUGGuZiU1YAwT+L3cr51WhzQOSjvgEs+qDOeQHoV3bbfw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:13.6170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29240d76-4aee-4254-b5d5-08df441b877a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF0000001A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493

Add TLV versions of vgpu_wpr_heap_size() and wpr_heap_size() to
GspFwHeapParams.  These complement the same functions in LibosParams.
We add them to GspFwHeapParams because LibosParams will be removed
in a future commit, and the driver will use the GspFwHeapParams
version instead.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 837f7a522429..a0277ba6dc88 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -68,13 +68,9 @@
 
 /// Heap memory requirements and constraints for booting GSP-RM.
 pub(crate) struct GspFwHeapParams {
-    #[expect(unused)]
     tlv_gsp_fw_heap_base_size: u64,
-    #[expect(unused)]
     tlv_gsp_hw_heap_size_per_gb: u64,
-    #[expect(unused)]
     tlv_gsp_fw_heap_base_size_vgpu: u64,
-    #[expect(unused)]
     tlv_gsp_fw_heap_size_per_vm: u64,
     pub(crate) tlv_pmu_reserved_size: u32,
     pub(crate) tlv_non_wpr_heap_size: u64,
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
+            .tlv_gsp_fw_heap_size_per_vm
+            .saturating_mul(u64::from(total_vfs))
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .ok_or(EINVAL)?;
+
+        Ok(self.tlv_gsp_fw_heap_base_size_vgpu.saturating_add(vm_size))
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes).
+    #[expect(unused)]
+    pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
+        let management_overhead: u64 = self
+            .tlv_gsp_hw_heap_size_per_gb
+            .saturating_mul(fb_size_gb)
+            .align_up(GSP_HEAP_ALIGNMENT)
+            .ok_or(EINVAL)?;
+
+        Ok(self
+            .tlv_gsp_fw_heap_base_size
+            .saturating_add(management_overhead))
+    }
 }
 
 /// Heap memory requirements and constraints for a given version of the GSP LIBOS.
-- 
2.54.0

