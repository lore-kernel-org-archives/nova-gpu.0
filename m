Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220972;
	b=XU7ve3kJYTOWmX0i7WXSkv/hhCmzBxK9C/e7bJfiKgi+gHU6jp151qmcVbE7MAPBYQf4
	 l9Q89PJkKwTNT045xhWTLNpeiillPem0X/Ujg6dhg5Y2x47HpcTgC9cxe8ipUF2uhdSwN
	 vTu6aeeJo7C7Ztkj/QEYdBZjkejfJYAOoWnUYLMjSICHQXg0WUISrFRqlbsu6ir7lnDkf
	 kz6B4hicsBziq6pvU80X8r7URoi1zAkY/DYYGirtLpHvF137O9tsRmuyWoSronqW1YGzs
	 LeHUlfZOLFN8L5sNAguiga4x0KZTT15KiE/7GvLJxEdFN6F77JwcGhnl9yOHJqVYBtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220972;
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
	bh=42VWc6CXJPc1rofF+ztslCFsCx30n1g//YywMAAfQ5w=;
	b=VjZn/qFIHOWsMRkAP757xkD91WrAMNCwHgeuzqDBRfaAiJUMRC2gYm+j07O+cj6c8aQu
	 SmIdbMJtzuTzYPWT8wQfrFE2xNW90J8Ewa9VDMKRWKsAMxFSvIabWSjtWxlER4RaOMcRH
	 LG4W7TqE8mcNyXUiOFHl6Hv27zpWNzcQLTArknq9hd984HtIl+NIwIvWRT103ifdsyZu5
	 kwKPbEPgYi9npmgTRQOn6aSsBpa6/JqXBBDLHpGapYxiLi0QWY2+SDPoChsdLwOcfbO8a
	 Eq5p3hKtrck14aeHeydhXWpZIAItQApmc/dferjhDgctU4BNZbsH2CyFtoZhk3/CsYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QdeLisxP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.35
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A88606A6A8
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A88606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QdeLisxP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9NqtC8eUzAOT+7dOKzrfLhbXQO0LnckTuDZgzfXjr7Xcgy6k3p7n+pQsbOPmEtgTilq8RilgKc/0F5ZDbl+40JckaUUQRcKgdTWLjKhi0UPLxf12LlTc849ZpUGyj+OEd32WehzU6Ar+fSRbJd2m2pV+Lr1OjOMsm9eMoVAAffQNrB2tgyU5KqTz18T6o0YlR+cb9M9H4geTGmikbYhQkLwApHu5eSn4RSZsu00SoGfJAG/DRmcXF24UejyJY+aukSimUJM4MNdVujt4lCXO/d0xlOpOW4JJftQ1I5YDWMaLMsatAH1IYY28xnerIZjv4WHqnMsAxIGcyPo0jonPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42VWc6CXJPc1rofF+ztslCFsCx30n1g//YywMAAfQ5w=;
 b=De6Kj4yuvE5rFGpyjwebNQIz15yvYJsLYq89sXsvy4eWK4CXGeeYCHbFs0ClAlLhlUH3M2mvxCL7qhm0dl5Ukr1KcFohhhtvq9UlZQW4S12jSHCMuTSejZKRUkzIpk1cpWwbPfx2lY56KY98CPXnqBAcCVAFtE9CGVGW15QA6DmQri0l4DX9u5u97azTmj55mJyA2xWUDQkLgNe22wzfBBUFTnJItmgnZHZkRE9Eaf/aQcYXxopTAPIY//OjBfG2kOhnKzhBtRHgyFIc5QQYKhJYR0h6sfmatPAEZL46199QP+N6vbpItqdyxPrTpLPe3olvwPT14Mm+tBBKWtx+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42VWc6CXJPc1rofF+ztslCFsCx30n1g//YywMAAfQ5w=;
 b=QdeLisxP/KyQ4pWBOLYoPaSHGaUhEXN/rEDpR2TZf+eTv6eTP92epCPZ1zRjyFpEKAEjjB02dH9YIJtNHdLKsxnfBDwTlrCUdoz+Xm1GURZmfyKnUKjomt4z7/RGQEUq9s6vdsRyMRKDPuV3O4lR3rfsL9n4kUewU1FDcZqSL1iUWCDtoigkHLPnHKy46XYJi5AYlZ9czHVNHl7cJIj6KCAirc4EY0XwFzwlxBUzWwYkQDXKrOAb1LdLU5vqDBXAjuL/THCgGeN/6gvVY+HH87rP9XMumFHjtQuV3FKa+u66tXd3qiYoI0lTTSo4VmUwj6KG3Sk0E5NvpWs84rnBWg==
Received: from MW4PR03CA0149.namprd03.prod.outlook.com (2603:10b6:303:8c::34)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:29:23 +0000
Received: from CO1PEPF0001886A.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::a3) by MW4PR03CA0149.outlook.office365.com
 (2603:10b6:303:8c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF0001886A.mail.protection.outlook.com (10.167.249.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:05 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 5/7] gpu: nova-core: add TLV versions of WPR heap size functions
Date: Fri, 20 Nov 2026 18:28:45 -0600
Message-ID: <20261121002847.3358679-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001886A:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: b19b6d85-ad89-4b44-df42-08df47667e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|261102123227099003|56012099006|261021123027099003|261026140227099003|261021121427099003|261028144727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	QYgkHMW+A4NrIT5c3GwDTUwEGJLBQw4y6pRe0YJJnUxuMovdaDelemqPDH+FdlH4SdAwadyr+LoO7Yk6nAcSJiMGO0C+SOjTJcEP43yAS6xoLW1tNDg069u2TLovaUFfY/14MX1sQ3s3whBnnWZK6nUZDKGSrw1v4PaMPW1qw/P05GcbKRBGZ/SI0YI6KbyonK5HuDZN+N1fTOgyx6aMtKjzpyZCL1z01cHm9iFweaGTHxnPvaCZ+kWW8bl2oRJWzU3TlM6p+A3W8FDO1Cmp6YycwyfpBBwKtOXcYUupIOkQxE3p9GopwsCPGWF0H6S6jb9F+6FMJ6NK5pTBLTxb/tU4h0YIYgknE9/+sCrRHuCXzJGtiTYoksSNUndIbiZBDk98q8rykw9Z/FfoXg/3OXB4rQuFkkx12lZjWYniv54LBgFRK6UF+MfRmv79ulNUU+7Pg3256Nic3GBwWZpKkEmupZlJH9isED/7/xMEv8BtuhoZMSUzIHgoVMLrBSN2MgjIXpnjUBITANNAFG49IWrRUofODHAvs4rT2lDExViivGaWIOe0pau3KurGrPMpQlBXoFdn5GwRqhnnWxF3/VUGBhxRRaHO6Sf4s7kZkRroHRdXP3Ejr3zqEhFfVQKIOXUV4hXMDSX36NQEpqVVqPOW0SxAAUWUIOM0oXvT/+0HMTgNCBgOvoGy5740hw35dKYcqHa/i5hM+jE9HafB2A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(261102123227099003)(56012099006)(261021123027099003)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S9NVa3HBVwNWwZS3yIC1k7Woqx3DGTn6Qkaaavyldxi3a814BaeeUd7AaYIHucVtv+vNhdmz60HOezk+1wcih3475FDU9fRGVf9PVceVUnVjvsUY+VNsyXyZiAI5HpwV1Krif1bwRgn5lhT/2UfiFiNkth8dSfoCovwbeMSDcAYU5EqonlfM3nJj4RweR9J3fS1ORaGws8eHJvbCgOFh2HoWKJisFVia/+XxsJd6fie9s/emib4ijyv0S6/n0au1Z6MkH+G4d67/SXJeA0JUnxYBwEjBo7R1IsAKMDfrW+lWnY6CITSLYo/Jlre4klKD0pr/e1Me00KSrvBw7H5aJhIIZs9Nawa1NRRwE2LZ/UHCrUv7cq+3cDGZkbR4IUiiR6Nce7NcGxEyCUtCaL9uZXKshlIGHt3CxN/EJQyRlHiKDyS4yKikWsXzcoKSr+Au
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:23.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19b6d85-ad89-4b44-df42-08df47667e00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001886A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290

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
index 837f7a522429..66f5bb1d0a8f 100644
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
+            .checked_mul(u64::from(total_vfs))
+            .and_then(|size| size.align_up(GSP_HEAP_ALIGNMENT))
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
+        let management_overhead = self
+            .tlv_gsp_hw_heap_size_per_gb
+            .checked_mul(fb_size_gb)
+            .and_then(|size| size.align_up(GSP_HEAP_ALIGNMENT))
+            .ok_or(EINVAL)?;
+
+        self.tlv_gsp_fw_heap_base_size
+            .checked_add(management_overhead)
+            .ok_or(EINVAL)
+    }
 }
 
 /// Heap memory requirements and constraints for a given version of the GSP LIBOS.
-- 
2.54.0

