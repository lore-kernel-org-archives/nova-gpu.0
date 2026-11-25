Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641922;
	b=mi0TYB1QCw1Rt47ovhqaZUr7Mw5hNyU0nhhrc2Fb8veslOeaH8wMMUWWBW1A6cOuBLkW
	 LUQegq1J+thg0gkcrTBEBzY4MyKHEIyDJAzXEC8dhm2tIuzVaj6hATWhINzo6FbEaj/oO
	 d938xAylF7mf2w7ZMnoXiBp2txSXIgjMisqDkqfMmMif5ej5f+GTLszeLo3yg8LXWwMiX
	 Fwqku9rXmcClBuz0FCOtfgkxHB5zn5UUdHQMnCub+VZEesmirzs8i80ku3xq4JJ7GJ/f4
	 1Duo5b5tAysnZWV8wbWg+gQ24S62sHrR78YndUm1T3YImiKTJZkId3rTUZgvB7Oxtvg==
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
	bh=LSKlnxZcz62H7aD755oHf4SB84DsKj/loI4WL8/FfKk=;
	b=3tB+cwa6aqPm5vqfA8xNnbfaWa3XtsqrMQxbHObQ60TKEXuGt5toKo56KS8YF7VZX7o6
	 RafBwM5kwB9Gci24BjyJsSxw4eNhV4Zq3p1KAN6qHCXPMLj2FUiCotCwB9e0QndWRNQEp
	 pSKiotY83wMiHchXNbaIMAlbBIF38mK/BBCkVj25AvQiUEJaA9DCz4eQgJ+jry3Bu2w7I
	 Yn4iJglVJfzoakJWF74lXGXofACMRCG1/GnU6GZ0ZkpwcYiNPKoZp4hljL0bz2ZVEAntk
	 tlr1HSvkSf0vmk+DwRQyIcFJtp7XnNcd6/kY8sxCll9SmnVf6ppzw6zH/XUAXH2rBjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="MwgOS/u1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00393606A327
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00393606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MwgOS/u1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGosZpTuQRhpOb5AUQks//K++HJZdIecpxkbjq0QCC4nv/CyzExFX4yIaKItr1AvHTj1HinIz2KGKQCnlwOWVqx6lYYhtrGRw57ygCtMyTTGVLBa4FsdJVDz7FQA8yXYuu80f308m6Fr80JT1yavZUviMyaAZhdXRWB3fs/ax9tOyzhVwZ7dOfKFvjtA0ycc+YkXxZ7X+D7BkBNXLnx/OGV/mP2GNILI2KT+0P+akJCFwgx91kFKMZdbOw+FPQW7Qf0ToqHVFL4COIGIuisuycRaXzU5cnsUZpYOLnvWru1xIoIR8SRjvLkR+fGF/0cti9UI7T4fl4c6KEqNKiGxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSKlnxZcz62H7aD755oHf4SB84DsKj/loI4WL8/FfKk=;
 b=d9TaHUgRI8O1gp6SNf/ws3KdunD5bSR3HT4eMBsyHuL+ryGECp+RqpHh7ELuqnbEf4dxHAzeeZ1uTixc0Veg6Hf2VZYeHb3CgBX62hnSsAIvpE6LVg3od6avMM5MUip95gfYiFmHrU23KRMGnBP5yX0B1oAyScHwjJY6TS7kG/yuaxjX871XFANnrYSJVpZcZyzxlOE1pH/7R48io5uShaMyUDxAFse6hYxsJJQLjl+B4SjF09N8Emcp39j1h+TuyE/UElDrsfiFvJu1S2GbccqkBlcN+Lb8NMvN+TJ7cxNoq3nLEhV16uH7e5QfkigmGjlxOtYFhvefHKO7haIK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSKlnxZcz62H7aD755oHf4SB84DsKj/loI4WL8/FfKk=;
 b=MwgOS/u1B1XnFElLodYMSI9iBa8cM4cflw+hvhxg6UiJN6YAi+pBJVSV55d8oGwHDgqOUCz6/sgVmIdP3Be8XCqCpmCd0xM9owKklQArOV1ZnNom80529OubzHopxNbGZ4I9SjcyG5TCLBzQVpUMHQvsmTh1KjKERn/gPQKhksxkNwSSb4mkQi6rru3RSNwdFmJp2b8xdHO8JEnq6r/aw0+Egma7IDxZafsX1fLd2P0rC7WthXBD/nQ0HS9N1e5PdqJvgikIxA1Mitt8DwPek9V9hUeeR5xzItAc7MMIx44uBFUpvrjCfsF0kL28pZE4ru4ZlMXQJidpEbTUwMMD/Q==
Received: from SA0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:806:130::19)
 by IA0PPFD7DCFAC03.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 21:25:16 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:130:cafe::2c) by SA0PR13CA0014.outlook.office365.com
 (2603:10b6:806:130::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 21:25:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:01 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:00 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 2/7] gpu: nova-core: read GSP heap variables from TLV
Date: Wed, 25 Nov 2026 15:24:40 -0600
Message-ID: <20261125212445.620391-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|IA0PPFD7DCFAC03:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3c2f01-7aac-4bad-4411-08df4b3a9934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261026140227099003|261102123227099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|10067099003|261021121427099003|11063799006|56012099006|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AczvdQug2cdcCm8t8HEONumyZ/QAQ7wYfqTdiv0VGIO74txgGKobKEukJHwh4Z6rfyz1LPh/Ug5g11Lsyvtv0L+qEc09HCnqlOqYRT70MtgMzMsqAO/4pMkmDBUb++51B28FqlZU5elfZ3xuL+DznKw0BqQY/FD4Zw805Ps7fUwMdfngiHIXboKRri2aadj+ILtpETs9WrVwgvHpmNk3mhAPQDOOBlVny2W7MdOW6yhrPMTvkgSGIOJQB/thWQllYCR00Bw6hVM5HAfdxw+dJQeSoJvY6VF2azBUHsoCBK0Eun2nkp+RNPXtxN14NUdte6yoqaqKcGfaabOgoC7m3DZqkLZ6n+VImtfGHguvUsSh4uNcBSeBHsRTs6mSc2zEZYoPWSEhyjiQcayFjrIRQiy5ull5NrB+A1UjCZVMGs7mu6A0V3qbL6vcFQf0e6AnaC+p26GBybheFZg2zz/FbUxW0w4paQ4gxZMQCvwDU5Nea3xfN6zoVwLa87TstXeDEdOp/yyoDdtVehpy93QUV+wMFQkTExnd97vUUKdbN5RQPrnrplh258VYAjyChMWCdE1CiuPJyLYzPpULVntWRMvjr7RAhhqhvRyld6g+N8jeervSWc7kwNtKuYuRP1ozPxMK6TeBbpcchka7MW9YSXcmImttqVfG4Xn91ZJojsBMbKhdEG+QNAn2i6Rb3m6jamUnsd8bhwMhLd8PiCNf9w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261026140227099003)(261102123227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r11dXHO1V0FU/FOenWy3h2f0DQw7YSRhUDLcvJ+XLBgeSKHLgIAtOxqAmdzuziHEzZhbLP1lZGXY4UBHc7nwvJTFWPjuqK1Zb6B9mjN8TX3UWkfg76Cb6L++Fcggrglb9R9kM/6FCI3f+W7e2FBGBQfNcydYdNPbJfkVxbrvn0xo/czsAllZ2nDHT/7YZ2kNytX+tmQTz05cK3EacD+zpjq1LXhnNyyGCDycBUAcTHmM1J3CWKe3S85r1Uz1Ues8t8yDyXmufUK+fxkOvHblyac1We+S63Sp8cNaw95CoHhTPcy2gk607heJ0PmNREEz/P/k8F9E8XaU4NrMSS45msLNQiYONoExY75W+RjK/D2TtJ6gFrd6hJ13CW+Za8lcqTvju3kfb7JaMd4viukeWUzLjzvzWD9vgCVIVuTWq92LytfEHEYJI52dc2KfcG9G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:15.9128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c2f01-7aac-4bad-4411-08df4b3a9934
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD7DCFAC03

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
index c396daf06f1e..c74234a1a4c6 100644
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
+    wpr2_heap_base_size: u64,
+    #[expect(unused)]
+    wpr2_heap_size_per_gib: u64,
+    #[expect(unused)]
+    vgpu_wpr2_heap_base_size: u64,
+    #[expect(unused)]
+    vgpu_wpr2_heap_size_per_vf: u64,
+    #[expect(unused)]
+    pmu_reserved_size: u32,
+    #[expect(unused)]
+    non_wpr_heap_size: u64,
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
+            wpr2_heap_base_size: tlv.get_u64(b"HBSZ")?,
+            wpr2_heap_size_per_gib: tlv.get_u64(b"HSPG")?,
+            vgpu_wpr2_heap_base_size: tlv.get_u64(b"HBSV")?,
+            vgpu_wpr2_heap_size_per_vf: tlv.get_u64(b"HSPV")?,
+            pmu_reserved_size: tlv.get_u32(b"PRSZ")?,
+            non_wpr_heap_size: tlv.get_u64(b"GNWH")?,
+        })
+    }
+
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-- 
2.56.1

