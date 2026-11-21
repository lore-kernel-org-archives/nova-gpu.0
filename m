Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220971;
	b=M38fjZOmoCSHJWUwZKP6lwXXKbZb9wrLgKlUSPVs6sCtLuBI5mbAUu1OCzWjh1gYXZeY
	 75deoQphfxO6aJFviLPuQf2Oi75JpY2BU/O1oXwWWlAf2CNvy5MphOP79B2CyM1Qk+VGh
	 4VDtNkHJGPmKY8UDavuMzTxQ1TCtRFxR+0+I2x/IwQ6qQRy6qjsxc0osFq/zmk0CmW9xa
	 rCEpReFEF5QgR5qn2z1W3zJrwu+TxrVKzNOrsmFu0ZKQo09KIUeR0Gft90IaPjIXaw64d
	 BLbO8h+PQyG29haYwq1pUKqkAzSnE0pLEOkVqb+vCQ//SNsAMjqVZrF8K0XdJXNykPQ==
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
	bh=WOjIyJ36erxE+tRqdIbTwNLwTuWn8UOW9LV3uldRD9A=;
	b=xodyPaKZFo8+uYX1ukoFX4cP0LK4Hm5yL0A1FVYfubqHSjVfiLS0lPqSqJQ5aKWxGXwW
	 Q1hUTuDGZjGam/q4wsMa3fXn2Keq8wCLzYykECQ6SM17bSUkd5zJoyoPIZKhZh3l9Cneq
	 TxNeOCVSWfI3PcBQwEIY9QL72s/bMcQFpj9vamtkK2/TZwS06ZaWqqd4D76P3NYP3RyPu
	 zy85iScYUwC5PAZgH+MZjqtB0zTSQjJt4Bntk7K8r3XzNlIPXBouvj3zM1AheMB3hC7oa
	 zsihf1uLy/OiphEJdKxq6gt7SyWu4989wW46pmvt3HeSZ9nhYYD7tlyup31dYG+sa5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kZypgHQI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07C606A33F
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C07C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kZypgHQI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0jwfMughz3cEKrdLcFLG4dE8td/kYabAWyyNe6VT49tpkuYP/8Tyy49zCjG5NiqZP6UfQAYNuiJzr0LAuGSsoe60SNPh4nKHDDqrgCzrAOgiwiExIZ3//5D3mU2xSK1f+VYPff0Bf+sSl0+r+KNAE/ytCOQEzRlN7wHijELq6Hl0AWTPO6zld85lA6CRLhBZO7OptSJs60DicwHYjhwc1HOZvBoa9eUsROQ8l/x5F0KCQSxvP2aVFA5NlfVwBdCgQLI3uYnDF2EIaq1VCRwY2E1r2GjoZnWYVvMnIuGqtvMMGEXse47gV9b02hYx7NOlmqCvqBiBmDbc6btzp4CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOjIyJ36erxE+tRqdIbTwNLwTuWn8UOW9LV3uldRD9A=;
 b=SyR95HdTbEeYc5Pwo/BephFJyVAFNSM+YU2UJwDvF2WL07ARVTboRGFkF4Dzbg2VC0vXNfgjJc8j1sAArd/nLSznoE2SR0UHCWhHCj36nF9fDa2nqz6Uxpv0I031lku9ghYdFlYKyQA0l8CqGSWiqattOTQU6Jz1/zWQ9adwDuO6QeYwa8vf2QJS86qJxd9nL+X/BIOLhpfC41aSXNH9/xC7PYGNQwNzkKZOMotzxfFtHzbvz5FXkWhitrnIjeAQtH5HankB99bqCGmo++XB1qVraiFcqmAbHW4IXy+5FyOIXdnUfIAXYV8/t6H81eYaL5MDowL3G7Ss3Pl6pSHIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOjIyJ36erxE+tRqdIbTwNLwTuWn8UOW9LV3uldRD9A=;
 b=kZypgHQIzAh/MSu9IlwNIIFkNWj9FsBNwS/Sz3vd+TFELIVbZxODTB5Hcpd2RfjS30rCyxygv8MzKLUJbgyJFQwUpahIMaL9cBZRJtjjohLQFN2Oxrb/DzeBmUxamtU7W2NpheAiJAcdQt6OPCNgtWWgbJZ7L+Yz5Y+JIxDlGPUXx/CI6TwZkKykZ6hgEITE+plO+UMgKw/Ijv348z3x2vCJf9Y/F1hsa59uBCL5UPlBIXhliaAWXPZSc4P+hlXPcTPkMUiHUPs3D+DP+JMvikg+tUAssIO2VcBUimCggRW/Y31oMmo6wVvNLDXSI1BTihD7NN8BL4tnZ3CPlwM56Q==
Received: from PH7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::20)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 00:29:20 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::61) by PH7P222CA0017.outlook.office365.com
 (2603:10b6:510:33a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:03 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 2/7] gpu: nova-core: read GSP heap variables from TLV
Date: Fri, 20 Nov 2026 18:28:42 -0600
Message-ID: <20261121002847.3358679-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4ded35-a60d-4569-7bfa-08df47667bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|261022115727099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xfAYTqartErJ1oVAkHz0NN78dSwl/FDoxlicqzlEt0rE6V2SOPQYdj10Ikr9VDoHVZlBOBuvIGtXugQslUW3ormaa8VIFMKrJJQgd5gytFR30hkg3czpO8QstSIvfe0CL4yDkHGnHdDxCxNA5EqRDOCn3mN/VxX+gdacZ1BRQIintIBi4nGuED9GsVl7oGE+WkxUSOR0WIEDEAQk7pW/7k3XOfOX7iisq1drGRANxbundcMCP5vGR/d5J8SQA2eW3+AWiDoLK589aV7gtR4IL7NRjUQjWOPRSqEW7ya6xK464SYuOuEOIP5OfEwrSfIxx04D2Ib+WJrX38dpxPm5W91TyNM8oOI2OMO45/I55DJWdZr7Nh9p7Ei9BmFkJUPJuz5NeCwhHmikRyH2H/9EpJuoH3nKjhmB29RiLwhx+yH8Tuz8i3oKUA+f6oJMucBqR2NFZpHyUeHVB3Rh0F/YhkGaYYNuDZ6d8phuqaRLVFkHDtUzgH+j2nqXLPhMhpvOa+fpT8NIDEW20iGnvEc5njhlR8VymB7fdyf3xTvoxC2DLiKj3TZuN+zoZLw/MyreHVFVBN3bqh8ppf4NIzkaPtfo5zhvbo5uWTK7XDJAxyec2XwiJFbssvT3wYYVFDlZhbvQUnU9rhYxgtkYPmGI2OS27qrp0MF7rCSyRpoZPjL7qvkz/3KMhVPvJkFiufUPfs5+DkSPd9rKm1giz8bKdg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261022115727099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0VqsY4ai8ymMkerJNrCWxWWYv5R2xhVIlocPf7EqYoqWrbInrkvEEHnls03rL8P+2uBGqBpU5ZWoHENm6m48LFUXeBEReYV2bHVA33187XcfCMG/yuNNMfB9kdD9N2BNny6RMgsCvxAwPQPZJ25FTcILRaEQzuX2A6LaqgTuQ5d2fdXCGuMgitatei/Y/3gpFN980P3FT8sJSV9IvOyQluOg/IRw8S4+h5muxpMALlHrU4tczBaQSnCznLp1+2UAstK1aeLvHKx85MwJa/OBd3UBXfNSx0Cuq1HmZDAzN1Y/a8rt1JeM6SXO9b7xPxgX0rQNXhbU3Nl1orhxC+/OCZDnbhrbW8gxrfRIYEyJz++RxGEKcq6Jvr5MdjAEYPt+W1TQPP1yKu+cfCg5O15CsB2D0wNSZXDDbtmlHHwPoK8wtBXXd8geNHrtm79ZKMZw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:20.1383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4ded35-a60d-4569-7bfa-08df47667bf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345

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
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
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

