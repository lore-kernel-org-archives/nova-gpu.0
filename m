Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858926;
	b=ykq9Wp4W80iqlSuqetnLmI1Wu7fp8zy5+2RaAzArE/CIUxuPpXOyPEB78DuYAkqQ4DSo
	 Ev744YQ88mvIbng/U9Cbfc8ZQR5F5JASkSbm4VKXTuhekhuZ8VHLpmrvyl/aBZwr9LnTT
	 lJEBByqrchw5P2N537BRnVOm1BOvttFt+ZwG1fkIweTj87fJewVL80DLJgqYBOVR4AjQj
	 dBLQ5a2rKhIVgTLgqo+Y8VHZwJi7y3W2VNzceBcCVd+XCMurppyKa85vKjWj/2LX9a5am
	 2kNE1RKjU4/MaO4ijEbn35ORMpBqC8tyRLJgK9x689UKdwsZf8hoeEs4XeCxwOy0iXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858926;
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
	bh=JdgI/HxVCg1n3xxN/aIULIYmp8jZdipbbr46Cpine24=;
	b=EkTGlStxKfuokGBuxGuZZgtyaNK9lWFY7ic2MuercSZtS0FtalZJ5KEpbNHamfYWvmZg
	 oEsKYfBD/1e9i3Lm7ujiol9VrGi3mscMeqPAKe1GDL87Kdhl5m45I/hsdI8uX5vF0z3ao
	 +bn8s4RKwUIdqY9q2fEsLmf9XkfPjsWDJCrMERxTBWZIu8sRjjKQ2KClaSQDTygGULyC8
	 FU0TUcdxj1L8HR8HIJIS918qfGSaBY0mfyKg5G8KUgDVcTFehC+d0lDHWoXickOIvC9p/
	 fc1KSJAyWXfhvD2E6ivtKoUm2NqtxFel4TnlOUNmPij58jX4+dzAlE6skNZnLQKlcRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SBo5xUPm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.12
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636DE606A329
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636DE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SBo5xUPm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FU/v0mfAlCoSnvYZ0OuOHj490naY1seU8R9qB0W96W7lazs3HniW5gEr7cJMPR6DcexDUuvqOVDAZZK467EAQ7b0pftHWVmeqJ8zf58xziUHQJtppak81vjTJGnxkOdmTRcVA/KqSb2LnI3D7O9ie+1GhC6PfbsJbgv0eEyfz6liXE4JA/vdTaFkm4xW3QuAf5eNb0qbRNcjpgvfRlDNte5+z2T1QPkPz03NN7VApLp+QckvFXz0amZJ0LHgNxu43I7yoPkesu+LeDSfkfehX67IYMIyi2ce9UBgbvENwO2j6tXSneEBWvvCDn821V5h+PajIs4Z32wHnrpteDFz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdgI/HxVCg1n3xxN/aIULIYmp8jZdipbbr46Cpine24=;
 b=sUBgtYZgMe8rI6sRjHBNvxYZnARi9FTY2UiayCWA6+HW4mh6HBoRZzqOGK467DLGbgXL/fS3RrNQk9pBbFziBULaM5W+6i5FX2qR+jHljzN852lxpAwYWuUT5srjpD1qHGGcrQJFXNNSP5Jdq7v2e/DRdSyAZN5ZsbqbafJWSNF/qVd6U2ODLwuErmFm8D0V5z245TGKaiVYwPEjnfHdrOMrAKD0udvpfzRkaWqT0Syh/oDk2/dJn6dv9+FB++/vku13IRIJIG1WshTs++lBqKtOF5kn5m1NfyFF82X3CsvlosKtgReVOctksra5IzLnT+mz/uJgIUsVEpCl92YQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdgI/HxVCg1n3xxN/aIULIYmp8jZdipbbr46Cpine24=;
 b=SBo5xUPmDToeoFxxMgeDkoGlA+gOn/mBqSH77EudJs7fIRe7nTDoxsmdFJsoGFefqW6D9nopEZJWRGG8lqzoq77/CrSF/ARNOcwntCridbagWO+DWAPofJPZIOohD39pdtXNtr2n+ExlW2xioOVM0Mj2pvFcxRzwbJNQIn+yTmHa/8TjntK9olxVbGAwlE42oA20anf+KhML6/FKgshzpApkYX4zbmBILw39ehMSfR4Akv5h6VT8vI6wrsww/vwvI+7wiwnXDgvYVTflwE78QDj6tuVdot5lYpUWfO3JtjSG1wq0yUgjX8q5yU3/Gk32Zm9trhKHCP0BVh52lLaqcQ==
Received: from BL1PR13CA0438.namprd13.prod.outlook.com (2603:10b6:208:2c3::23)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:20 +0000
Received: from BN3PEPF00022BC6.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::86) by BL1PR13CA0438.outlook.office365.com
 (2603:10b6:208:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Mon, 16
 Nov 2026 19:55:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC6.mail.protection.outlook.com (10.167.248.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:51 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:50 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 2/7] gpu: nova-core: read GSP heap variables from TLV
Date: Mon, 16 Nov 2026 13:54:36 -0600
Message-ID: <20261116195441.940595-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC6:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f6b18f-9992-477a-de62-08df441b8b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022115727099003|261022075727099003|261022105027099003|261102123227099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+YVinxGA8tPcSs3Ff3NECaTq7sBLzrRQYdD3tX6u3EbQM7EV9FMcSRfd2xLdh8ZPqduHNAkfkAw25HjxR/tFl1T/L0LHElyD0VPOgN8Dxd1t7T1JLEuEJLUrjFJlFD4NNMbIpjt64nUQXy/OXQpMKg/MoQTh6s/b7IIibAdasQVlEQRANPrOKxtPLGb58K8WMGEvbppNnGda+pLBlUZdmfVAmgsDSzXAw+oS9EaEaYPdVM05oeueGJKXn+KCXEWAXtcQBg0EP7YR6deWl7ACpa0DdJi0lrJwFHY08NlR/SG6MQBPii2FqBsuT++aZninQTdgdmGxiu1RmQQTZ4RGBWuO04+slM0KcBACRfIZ/0s3/RurdTQvtDjTCoZ8k8cYTJN9qkQlYDteXeEWjQHoUVodPB/l/dJbiJzklEYBwBSn8BeBDgD/4GmB8fr9YptsPBIJUPFRQoDvLpyJ0kPRhXmMB67ZxRXD2CzdQj0yngULljH6N7P4u7V0p5k3Wqx8tNd1+QvM9krRA6qi/gNhT2DxcPGhaoGZ4od7Fq++dtC4fZAEAeCT50L1J50/c9w0udX+LYBsek7h0rGym7Qt0lQdt03xWZfs+zs6Gmavg28cia0xMMTwuw5mjfas/WbKXDJpPO9rGqRicezKWRzIBWrZVqDb9SQUJDB5q4vezfmr2LV0iWknjfDMBa8O8P0pzVcfd6h6NWyB0KAcHxWVKA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022075727099003)(261022105027099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jqzSc5XufAL3DSSgwc+nETRH3hY4JH2A2TeQym3akpMRsMZ0KLyQttwOOK4fQYcnoydCTfbI2xPdXlPC6eTTnPHQ9sJP0A3cWi5z0DREY5ldGGGN2MPE46WcscG+yew1690tnRyRZBjZ6MdfNQGyc5Z5SissXp34YkVBde3uwiDOVvbIlXqjcgSxjvKGPRV30alAmVYDlM27ANLDIbygBTct8pU6xt4V7+nBRYdqz8qMmYN6LXUrSe2MMPIn7LjyQF+X1190Kec663lKnkw4/wq1WZQQrBko1126nBq4C0DnqZjaXjWtEzw0MH7ZQ10gma2c9tCkJYU/gqL8+zQClZ9gq4hCHfrRhmVl15NYNeMSrY342nsK52hNdBefexdSIf109wNqhy50KiUQFKCIDc+AF1flaZDbaRIoPTTpclfP9n3TaVchchP3jQxoOR7K
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:19.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f6b18f-9992-477a-de62-08df441b8b3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

Update Nova-core to read and store the new heap size variables from
gsp.tlv in a GspFwHeapParams struct, which is changed from an enum.
Also provide a constructor (currently unused) to create a GspFwHeapParams
object from the TLV.

GSP-RM firmware TLVs (specifically gsp.tlv) that are based on r615 and
later contain an additional six variables that contain values used
to specify various heap sizes that GSP-RM needs in order to boot.
These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree, just like every other
TLV variable.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/tlv.rs |  1 -
 drivers/gpu/nova-core/gsp/fw.rs       | 33 ++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 6a9b318454c4..024b456a0a85 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -258,7 +258,6 @@ pub(crate) fn load_file(
     }
 
     /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
-    #[expect(unused)]
     pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
         let value = self.find(tag)?.value;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c396daf06f1e..a44550b70d44 100644
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
@@ -65,8 +66,21 @@
 /// build-time constant, so the driver chooses it, and this constant is the one copy.
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize = GSP_PAGE_SIZE * 16;
 
-/// Empty type to group methods related to heap parameters for running the GSP firmware.
-enum GspFwHeapParams {}
+/// Heap memory requirements and constraints for booting GSP-RM.
+pub(crate) struct GspFwHeapParams {
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
+}
 
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
@@ -85,6 +99,19 @@ fn base_rm_size(chipset: Chipset) -> u64 {
         }
     }
 
+    /// Returns the heap parameters from the TLV
+    #[expect(unused)]
+    pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
+        Ok(Self {
+            tlv_gsp_fw_heap_base_size: tlv.get_u64(b"HBSZ")?,
+            tlv_gsp_hw_heap_size_per_gb: tlv.get_u64(b"HSPG")?,
+            tlv_gsp_fw_heap_base_size_vgpu: tlv.get_u64(b"HBSV")?,
+            tlv_gsp_fw_heap_size_per_vm: tlv.get_u64(b"HSPV")?,
+            tlv_pmu_reserved_size: tlv.get_u32(b"PRSZ")?,
+            tlv_non_wpr_heap_size: tlv.get_u64(b"GNWH")?,
+        })
+    }
+
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-- 
2.54.0

