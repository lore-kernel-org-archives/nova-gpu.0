Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858929;
	b=Gs7AemQYoulph1B1JCMK7saPi8qeF52xVk1fqU1mINkgrIzrPPTdx9FSXRzGVTHQek4I
	 fFNGF6Vp8M5yoGja9JDGsi4dfpiwjNOMVUJbZ4ivATbmsiPx8D2iDQrofVX5/oXnyQrVT
	 4GMHb+P8JIEx8zU2Ov59DczoAC2NEy6pHixidWoAu8EctngkfrEJNMH6j9lZXGZV1JCpi
	 ekgGh3RVCR7RWEM7fuebwSbmFvzEMUf0YWOGfhvScze3u1tuylS3EfJ0fBdQNE69yanYh
	 SYWl7paj2r2IGW7e9uwB6sUUGnwH4JdX6rEq8JAR78umlFP51zqzSPAEYo6kBWjB0PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858929;
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
	bh=sNiU9IqJgmTAgwU4CY5bJNbXQGUHBmraSw8wtcP+/24=;
	b=1RzgdqwRz3Bsub1VVj1q/9SAR9gjiRY68etmrBDMYBlHu+Hfbr6j3FL3aDuLhaiNj64L
	 vzfMpwbC5BXTE/zn/SvYqfaAPQbZiJhytgTTqzWlWrHe8tIw2ohvq5sUGX4dD9T+7cC2U
	 OVAiZdZFyK9K86bw640Cpo7Y6pLf4MN3jwYOrpkfqQ5raLKAWPDsVP+gc3q4NMdjvJd9K
	 9bbSMFiwHTw9ISsWjGmPc3iM8MMUtffRAI51ulemUvrQbayzLffZvCF/6SqYc9CqNmy+2
	 7s1U2u24znSSO31ITRUagyVCE9PgjRjEoqefhTiaU1b5Nm7GJjQYPBmHA4MnilCa6cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gdijHA77;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.14
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012014.outbound.protection.outlook.com [52.101.53.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF2606A32F
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BF2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gdijHA77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ar0PAcMVKZx4FpguELYEn9Ae7d/b5sUwQi/heaBUrDu382DmWeqVSN1AMAGtsiZyi7LgYi5Hn/gSQpQjrtrnaRUtULj7AzJw4DNdex2zHwhrrP/P5Qmh3lPjx4pAFtFIydtQ3seJHwHc+rpMSFoAScjQdZSglTFgelYH0035lgPKRg29GmidXQz6F5vTEjLpGV74E3K0CZItCVRKZoJQB0JSk9EI6i1xQQtbYpKew1bk74GymvvjmuWe+olxG2mAj7EYaZfXlk3hvgj4P+2vfDrnFnzDup3qdTHLi2H09dMRPqwQT4YmavXEvedeswkO6E11V8nFIg7CHSStfoDC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNiU9IqJgmTAgwU4CY5bJNbXQGUHBmraSw8wtcP+/24=;
 b=oDVC0mh+QFsTDLSIQQEi0gID2uyXhwW5LnBSAf7aXkrB/EEBxmS1N0iWh8kCtGm/L5YJZV2xnHyCxevd4sTQZRcY8zndySsHHCoPTF1MtSMfn89z+D5SUApsLUoAQ1Ag+Po7H1yjq7/aZTtpWiXyRRBa+1ad3B9PZ5qL3rfCMN3V+v6dgelCJ9CfqZLeN90i1qHCZDPx32UXoN63u/siIvH8yRtUp2Y0uTf5VvBD5WYUJdKuhjC97z4hhKF40JdUPDhutvti8FaIRrenZutxyQzkkkZYW4vZ3muJIp0J5ZULQRN7tUd2Ehov0bAnH5T/FbWUOYAlU6PX52oCpViQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNiU9IqJgmTAgwU4CY5bJNbXQGUHBmraSw8wtcP+/24=;
 b=gdijHA77I+uOp1GecIzr12DpPQ1lsQwhAqpvM7bXmF9zJaPMBlPHppe72xlcKrcA5Yt3jGPTCyX7j0ihLV2IWQnxDU8hEZrMWRp+018fabKItOMG0XK/ghguAF71Jdsp6w2QbNGUm4aYBZaBySHsWiKexdcKvCjS8vCeWlYZ2iNy+21SCwcERz1LqQLPVVXX4PpC6Ledpk57nC/eSTw7W+TZsyMiJO9ujrzr7H/ntZ+fDuioUtbD+BPmjUxa6TWMVrPz1IYA6/+95fnLP+40KlOyE/AiYiqN6A9wlLD1RIlO9eqKdmr36DwJgglVDM7gmosRf7X854aUZMLwdd+jKw==
Received: from BL1PR13CA0436.namprd13.prod.outlook.com (2603:10b6:208:2c3::21)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:22 +0000
Received: from BN3PEPF00022BC6.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::29) by BL1PR13CA0436.outlook.office365.com
 (2603:10b6:208:2c3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Mon, 16
 Nov 2026 19:55:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC6.mail.protection.outlook.com (10.167.248.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:52 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 3/7] gpu: nova-core: use the TLV heap sizes for pmu and non-wpr
Date: Mon, 16 Nov 2026 13:54:37 -0600
Message-ID: <20261116195441.940595-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC6:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 3304c5e6-57f0-408c-636e-08df441b8c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|261102123227099003|10067099003|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006|261028144727099003|261026140227099003|261022115727099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0kOIX2m6wvGjoXNqwYNcGYNhYZhT3O3V/h7rXZB6VacP97yuY/tafL9lSUazUa/ARYQMKEXRrWE8O3cA6x2YhT7SV5/Hz4oqk8m9rmKLieMEQC4NDhJcurscNrRp0rPQ3mKSwi1yOr7RDKVXC82U5mdLmCdoLD8T/wmLUJ0v97t+gCz1ENTf6ewfnF9+JzYk5B51ecei5Qf2yWEV8RzEDH+wTHmOj8c7tGvd8/B4IOiKJ/+7hwyXfbRWcccIusRXF9x8gpzZ39T2FAE5Bva8lAbyq9NWg7UOLCCgr1SJdBPFI6vXvSuocf6EDWI9QfpOVGHQA9FDpRb8KxSqfSsbxzakqQ2EyFSE0Pf1hDTaxsCEiZSlAjmHZda+ygDBBlNXnjAwROucm9ynLJ2x9tJCTJGP79JDcwRc4fMn0+m8G32N0PU4ir6r0XCP2yCbE6oce4zlKyi79BtrFBVzQMAIbXULdobK2TGawfw2qNP71z+eI9Pwx8RPkqs+NHxW8TVPDWjuP6be/8OYMV3wcuHfcPdDz9SWLkMDc5Jwn3BrIk5olTR0yc4+4SZL4S84mJ7U8KeryyDxE+/ovafWCHfehD1wvi+KxNCgk7nBsajdhlM6nsJFw0UYjbI2A6b9ArDDTYX1rsZgSMWqzWGgNTbH6XvVSZXnXCai9BeICg1OQgl5dgKA3tdG7XinjyvjicmUUt07HjgvKd4YFvHXBjvV0Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(261102123227099003)(10067099003)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261028144727099003)(261026140227099003)(261022115727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PwA/YBSma4D/xsnGVXxwZoNDJRTcNScdcmP8rTlBedIhjtCitKGNucqcXZ8JlE914WlIoAGbvC5qSkuOajg6pAbP9Ux9vWl3YN2qsCJnosxe3TkLcy7gOB4eWzvrqTN9sHgsh3ouDIV+K+ntlvF4VvQuFEe1by2Bme5PD+JBU4CTcTDXH88OFcVVZ9e8m7LEsKnlGt8EL1wpJ4j0RqSqFDPOBQCW/Z06NyDGxBp3skqTFZRxSBNpYLIoYvrsmumwfhBesHMk0OQqlZQiEzqOphPHrVD+qUBzfTRKrBTuBAkOeECtFrgoV1zfvhJPet43gh7m1MHgGjMHCgZ8CCHy3ArVaF91zSGvdRAYTZuNDoQm2EUX+h+5XzyfTNeeq6rH+c+0oN6tsPNrxFbNzrp+4jkhpNzH0zimYDmZfLdGNC9t3Lay2GS6IdU5Fk5hLZYG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:21.6649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3304c5e6-57f0-408c-636e-08df441b8c4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410

Instead of using hard-coded per-GPU values for the Non-WPR heap
size and the PMU reserved size, use the values from gsp.tlv instead.

This change will allow us to remove those HAL functions from FbHal.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs            | 16 +++++++++++-----
 drivers/gpu/nova-core/fb/hal.rs        |  2 ++
 drivers/gpu/nova-core/firmware/gsp.rs  |  8 +++++++-
 drivers/gpu/nova-core/gsp.rs           |  1 +
 drivers/gpu/nova-core/gsp/fw.rs        |  7 ++-----
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  2 +-
 6 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b0c0b8fe6008..048d3c5e655f 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -264,7 +264,7 @@ pub(crate) fn new(
         };
 
         let non_wpr_heap = {
-            let non_wpr_heap_size = hal.non_wpr_heap_size();
+            let non_wpr_heap_size = gsp_fw.heap_params.tlv_non_wpr_heap_size;
             FbRange(wpr2.start - non_wpr_heap_size..wpr2.start)
         };
 
@@ -278,7 +278,7 @@ pub(crate) fn new(
             wpr2,
             non_wpr_heap,
             vf_partition_count,
-            pmu_reserved_size: hal.pmu_reserved_size(),
+            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
         })
     }
 }
@@ -328,7 +328,13 @@ pub(crate) struct FbSizes {
 
 impl FbSizes {
     /// Computes the framebuffer region sizes for GSP-FMC boot.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuState) -> Result<Self> {
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        gsp_fw: &GspFirmware<'_>,
+
+        vgpu_state: VgpuState,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
         let fb_size = hal.vidmem_size(bar);
         let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
@@ -336,8 +342,8 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuState) -> Res
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
index a2db7b6ba131..f1124238071c 100644
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
@@ -49,6 +52,8 @@ pub(crate) fn new(
 
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
+            let heap_params = GspFwHeapParams::from_tlv(&tlv)?;
+
             Ok(try_pin_init!(Self {
                 radix3 <- Radix3::new(dev, fw_vvec),
                 signatures,
@@ -57,6 +62,7 @@ pub(crate) fn new(
 
                     RiscvFirmware::new(dev, &bl)?
                 },
+                heap_params,
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 908d4ea72ad1..e487efd90b22 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -29,6 +29,7 @@
 
 pub(crate) use fw::{
     GspFmcBootParams,
+    GspFwHeapParams,
     GspFwWprMeta,
     LibosMemoryRegionInitArgument,
     LibosParams, //
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index a44550b70d44..837f7a522429 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -76,10 +76,8 @@ pub(crate) struct GspFwHeapParams {
     tlv_gsp_fw_heap_base_size_vgpu: u64,
     #[expect(unused)]
     tlv_gsp_fw_heap_size_per_vm: u64,
-    #[expect(unused)]
-    tlv_pmu_reserved_size: u32,
-    #[expect(unused)]
-    tlv_non_wpr_heap_size: u64,
+    pub(crate) tlv_pmu_reserved_size: u32,
+    pub(crate) tlv_non_wpr_heap_size: u64,
 }
 
 /// Minimum required alignment for the GSP heap.
@@ -100,7 +98,6 @@ fn base_rm_size(chipset: Chipset) -> u64 {
     }
 
     /// Returns the heap parameters from the TLV
-    #[expect(unused)]
     pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         Ok(Self {
             tlv_gsp_fw_heap_base_size: tlv.get_u64(b"HBSZ")?,
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

