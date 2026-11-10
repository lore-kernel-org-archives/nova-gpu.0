Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352299;
	b=xdFtTq7qQYN9KZomz4LLpMETOtAsH1KahVeifZ+Y1bvsq5fN243NOcm0zld+OehxY0xy
	 07tbZTCpiXT9HEJ3fg608tr/PUpPjojz9YqvFD18FQUi+BeGS4D3xR2emk1twCP5k1hGY
	 1/L/anbsBiEu2CH1Mgb7zZjoaeUcVsfW5WT+ZVGzMtj5XDN3lehAAV+ji4larUdN72OCK
	 gF3bb9mJUB8yIUZWM/XTF8uyTEnSUeCGuht0QlsYB5IxIDyM0DQuQ2pmqWHPEW8rR+OcE
	 xLmTwm0fSjpDwqT0c/3GlG8m/DNWHG5szDt1Qg+J0/eNhWujG7dVirS4PpUfSeDh6iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352299;
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
	bh=12YIYxy0iUejQnJnhQsPgTsslTtpZK10DiOUbKgqJaw=;
	b=gVHjdhD529FKcf2wLkM70h45Ue+e+CfKN+B5gUqcqET5LKvEJlnpAP6Og2QikciYCMVo
	 Flq3XkKRVJOPBXVY3AWIjUcPRxqnVKZb/KxPmla761Ocg1Dv7Tot3UQSVC5Cj32e0HaE9
	 YwH/ZY0ur7fvILaRIEFEDwGmf0Erb0FjFfR8ujS5Une7wUW98WhQnYEcWveiCAHvoyY2z
	 0pDb5fEv4IRrE1tqHSNgmL7w6G7o086LUvntMAkhbd0jKD2xwuKldlFrxm6YEVXoqQvHo
	 XHX22hxjG9oFaY9ENPZVVjIMxDgmVlNtiUOBwWIeZKk2L6+C5+QtEroFPVMl9EO7q/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YpSk8Udk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.30
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F8606A31C
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YpSk8Udk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsaWD6t0shVeExZ6iE8coQ+OsNkWRbs0RSZI3+g6G8GW1NFMnmcDvc8aiWSut6nnnnfdl1C9fmXINy/WGMnXgYRo4aw51du0xDRteZ/CfDm7P0rjX8+zVO9mZ6e2a1wIy7siNxlPqpzyfo0gHAS8aeSQaBwIXzVmAWJFgDia0r7462QuCR6X7lrK/2eZu29Pr605odzHFXKBiSEERVaSIs50E78qQhjQWKM6X+RQXmxvy42CM/WwBFioXUR3v+46SO7yRIvlPE2s2Qxd6L8zsRRwQLOJS5ixgeBlDMCysLEBcQxy40rRbsF0bovLqqTNSGzVEoKXT55n7qqENdrEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12YIYxy0iUejQnJnhQsPgTsslTtpZK10DiOUbKgqJaw=;
 b=v4/D1JSp1JkQpj20SxwLQlQj+Zx0IoIu6Oz6V6oamQ3AjZy0LPMMH2PoTWWVzapoPWyLRAKaJhbKBVa0fsayvGtsDudja05X/lotFy6vszqJLp0bmbaE7nhzzG42qPrNKrz8FsIhVTdFNWZfi5DYdxUirlU/7K5BVPtGzJUL9XWBZXfnomYL5fMVjSiceAMsTbyXGBUCiOFtBa8b3mN8a89QVEQKa7GcVp2MWqzyl4A2W0Pnet2RUjhM6bAyTt2vhq8jX0JME6L+uxodBjvmIShooicajUPOiZb81dsS3hsFcHnKXdiJDfSNOtrMv3oI6FW+1j4Sa8/3rkV/OVpzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12YIYxy0iUejQnJnhQsPgTsslTtpZK10DiOUbKgqJaw=;
 b=YpSk8UdkhitGorQwUNV4QI1g5HDrFxjBkD9+m84wMjYjSu8+RL3w/kb9bW4Kw8b/z7Xf+ovKMF1gA1AzqctX/tce+qKPjHK8lQ8Gtat+g2y+xaHga5GlNxyd8T9wsqg2xnIUypKfmmfJbfEtrPd4+VzxZtH1aEHSAxjdvORdpOy5K64RMUTqxLF5d0d77wUuzYD8yhZoLejLnG0B/IStmmVEqAME2mXzNXQUCDtYOHK7F6QxYpIPHNmPo5w8KhP0ePROGuQMn4ilQvBtbbiQYp2a7F/cQNP7UEpsou00Znj4MIQDqlvWqVfJOdgjdS4eLinZNbSJR0Q/uIzFse88Yg==
Received: from CY8P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::18)
 by PH7PR12MB8040.namprd12.prod.outlook.com (2603:10b6:510:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:11:28 +0000
Received: from PH2PEPF00048918.namprd05.prod.outlook.com
 (2603:10b6:930:46:cafe::8b) by CY8P220CA0020.outlook.office365.com
 (2603:10b6:930:46::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH2PEPF00048918.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:05 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 3/5] gpu: nova-core: read GSP heap variables from TLV
Date: Tue, 10 Nov 2026 17:10:51 -0600
Message-ID: <20261110231053.1352163-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH2PEPF00048918:EE_|PH7PR12MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 71aa5862-6977-4292-115c-08df3f7ff32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|56012099006|11063799006|18002099003|22082099003|10067099003|261009223027099003|261021121427099003|261028144727099003|261021123027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|3023799007|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	JqCZJijyDVlQ0HlRvxBLSkh1fQxGHDAHniv/LC521VhXRXhtMbBIE8qO+vDZU/mO4UjRk+ftT4+SUe1a5Vb9nX/A2ChNTywC5bwmec/AonkeToBix8uz4uEbxRPBz9t/UfYrOJlqfTku4ibhW/05Z4w/E9FeR210K/oYjYJLc/QjPdKXl1JhoCpCxtiXY7S/2DmfkTobaWPNM0pgVRelHI/aVGlf8KnnhS6w1zg8XiFd7HLfqBnJHppLlC2Zg8xNrDiHXTuJLW6y4ES8nDn7ZtbxEnH6jtgBEMjZqtyYrUiE+5+q5Qt2epAwM+2ot3WFk5M7cwf/T/p08aMxP1diwe9zGd3dyQY+EmwS8fDZoKGpuZ+7sZHjbH1sa0To8cIn5EB1kdY5nsoxW9KwVWE02jUx8w/3Ac/zn6xbrve2CPdy17OVVe2wQm1l/u0Ake51/B579QS4EwBzmo6FQgj6tq6XPZbzu1rY2Ia2e5IBqaDbfnmb9QXY5C7AI0de+I7nzq0wdKux8sc/fZ0LwnPG5VzztVzkiE27f7gog1U6yoX6k040So6yimUqGsW0Pq1gRZeQTWN6r7NUQyX6gYuqPhfB3+dh4Z0ZfYWA/BTsAWDgoCxn9AQw6qSAwVBwrFqbqHHh+U58GUjXsSbrnw5H4J455j3BbPU6xQbjyIcmV9tPS0LwwlmXDtd7PP4qlcR9Dn3dAFieZOrTsjnTOb9k3w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(3023799007)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LOOYjFmFPJU6ymyl/jKWyjP5tLJdDbWOLhYpindVKOnKTzOUrm77DrSY0yJX/vwyqZZr2uM+BNk3S0DwZH8PSgf1J8aAFMQgY9XcV+3zruRTKlrvanPWS8CBmeUhjQX3PInqpaitkwOkMppndZm9UJ+kkDROQSVz1eMcPGLWhW+YMIkPC1Br/egtUvj3abUORORUQjC7+u5ybQfat01T5cn93G+bnI3tlUBkUD8e3WORAe1T/J88ZEGLK6TEDzZ+siybPWeWyJ3AP5oeMe6xm5gte63n4QgkBgqpKgB2IXmTDOrQSF+M3KKCLefS3m1EqckNkReq7+Cb+wVkEye+MS0ziKHOvD5InAcmrZdXx/Jsilsd7vO1CfFLmspsSPd+0lWzZt+gssirn8SaQMtgoK8ohMZH3ZENgmf8LjQy2GNFV6Mw9LQ2TpsXQi0CLdHN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:28.1983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71aa5862-6977-4292-115c-08df3f7ff32b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048918.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8040

Update Nova-core to read and store the new heap size variables from
gsp.tlv.  This change adds code that reads and stores the values and
also provides a constructor that uses them.

GSP-RM firmware TLVs (specifically gsp.tlv) that are based on r615 and
later contain an additional six variables that contain values used
to specify various heap sizes that GSP-RM needs in order to boot.
These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree, just like every other
TLV variable.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/tlv.rs |  1 -
 drivers/gpu/nova-core/gsp/fw.rs       | 56 ++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 75d8f907421b..0b79268c6dfb 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -258,7 +258,6 @@ pub(crate) fn load_file(
     }
 
     /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
-    #[expect(unused)]
     pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
         let value = self.get_bytes(tag)?;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f30819fd89c2..f0edae9656d8 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -37,7 +37,8 @@
     },
     firmware::{
         bindata::UcodesImage,
-        gsp::GspFirmware, //
+        gsp::GspFirmware,
+        tlv::Tlv, //
     },
     gpu::{
         Architecture,
@@ -74,6 +75,19 @@ pub(crate) struct GspFwHeapParams {
     carveout_size: u64,
     /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
     allowed_heap_size: Range<u64>,
+
+    #[expect(unused)]
+    tlv_gsp_fw_heap_base_size: u64,
+    #[expect(unused)]
+    tlv_gsp_hw_heap_size_per_gb: u64,
+    #[expect(unused)]
+    tlv_gsp_fw_heap_base_size_vgpu: u64,
+    #[expect(unused)]
+    tlv_gsp_fw_heap_size_per_vm: u64,
+    #[expect(unused)]
+    tlv_pmu_reserved_size: u32,
+    #[expect(unused)]
+    tlv_non_wpr_heap_size: u64,
 }
 
 /// Minimum required alignment for the GSP heap.
@@ -88,6 +102,13 @@ fn libos2() -> Self {
             allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB => u64)
                 * u64::SZ_1M
                 ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB => u64) * u64::SZ_1M,
+
+            tlv_gsp_fw_heap_base_size: 0,
+            tlv_gsp_hw_heap_size_per_gb: 0,
+            tlv_gsp_fw_heap_base_size_vgpu: 0,
+            tlv_gsp_fw_heap_size_per_vm: 0,
+            tlv_pmu_reserved_size: 0,
+            tlv_non_wpr_heap_size: 0,
         }
     }
 
@@ -101,6 +122,13 @@ fn libos3() -> Self {
                 * u64::SZ_1M
                 ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB => u64)
                     * u64::SZ_1M,
+
+            tlv_gsp_fw_heap_base_size: 0,
+            tlv_gsp_hw_heap_size_per_gb: 0,
+            tlv_gsp_fw_heap_base_size_vgpu: 0,
+            tlv_gsp_fw_heap_size_per_vm: 0,
+            tlv_pmu_reserved_size: 0,
+            tlv_non_wpr_heap_size: 0,
         }
     }
 
@@ -112,6 +140,13 @@ fn libos3_gh100() -> Self {
             base_rm_size: cv!(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100),
             carveout_size: base.carveout_size,
             allowed_heap_size: base.allowed_heap_size,
+
+            tlv_gsp_fw_heap_base_size: 0,
+            tlv_gsp_hw_heap_size_per_gb: 0,
+            tlv_gsp_fw_heap_base_size_vgpu: 0,
+            tlv_gsp_fw_heap_size_per_vm: 0,
+            tlv_pmu_reserved_size: 0,
+            tlv_non_wpr_heap_size: 0,
         }
     }
 
@@ -127,6 +162,25 @@ pub(crate) fn from_chipset(chipset: Chipset) -> Self {
         }
     }
 
+    /// Returns the heap parameters from the TLV
+    #[expect(unused)]
+    pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
+        Ok(Self {
+            // These three fields are not used for TLV-based implementations,
+            // so assign dummy values to them for now.
+            base_rm_size: 0,
+            carveout_size: 0,
+            allowed_heap_size: u64::MIN..u64::MAX,
+
+            tlv_gsp_fw_heap_base_size: tlv.get_u64(b"HBSZ")?,
+            tlv_gsp_hw_heap_size_per_gb: tlv.get_u64(b"HSPG")?,
+            tlv_gsp_fw_heap_base_size_vgpu: tlv.get_u64(b"HBSV")?,
+            tlv_gsp_fw_heap_size_per_vm: tlv.get_u64(b"HSPV")?,
+            tlv_pmu_reserved_size: tlv.get_u32(b"PRSZ")?,
+            tlv_non_wpr_heap_size: tlv.get_u64(b"GNWH")?,
+        })
+    }
+
     /// Returns the WPR heap size to reserve when vGPU is enabled.
     pub(crate) fn vgpu_wpr_heap_size(&self) -> u64 {
         u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
-- 
2.54.0

