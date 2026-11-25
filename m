Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641925;
	b=QvzJxGYQJy2lXqchZC4Bq8uQDj+gLz7+AqRvw36NDD4SMwT4AoWhOkPOml+aMphBNQkX
	 xJHD4+/wKbdfuI+YnSMvTkZ7PbEICCer7cST2UtBe591SBocLT+p8PIcznBWOAIu7SqnY
	 ZBM783WdlhATo0RRyREDfJN4Sigfd1tC20RDfSCFbpq0HlLKeqWFzkoqtGMlPIzCRv9DX
	 /xREU6mz0LLR7djS5m1An/J4ET7rUgNqSwzhSsXopkyq/y08iGJ5nnvIrBjwGjQvBIA4E
	 qrnu7I35v1yQhl3qdqrEi79h4/kVmokmaHAVRoPsvnxH4wzJ2UnP5dFIDAkDyA5XgBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641925;
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
	bh=LwI4S78NDZ3inrjkjNWeLC2njpKBB9BKuEEFNlhyvUw=;
	b=u56NmWf4vxcl1BujEkSEF3OFn6+qgOFuSR4HOf7rJ1+U8kUjhUnJVS9wfKTlnapkKEcr
	 STZUoO9Z3zlEMPFOsaK0+dhOD2AVvbtQqqxGNdetCh/KPeMrLcBMIYht2SqRSG0D8bPuJ
	 FDlNYQrC54Yqh2gWww1A4+2VEsZ2w8mHGVeCo2Bp2nmSAGhpAgODgr1gj4xPjabQT6PY2
	 ojL91FErDoy5eJcPiPZwyy6KtINL1R0NqFNsBM0qpVHzyMqd0tG4lz6QvH8++qpSHjH2E
	 7WK/8hHLAkci/4WzJxFKXX3dtl1aTuCTARVqhgbSnh5FTYjjtzzRWEIR0mwh4JWfe2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tBU9COwn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.55
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349CB606A327
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tBU9COwn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM47rNQ2CEmhyowgxJT2sTiXOFaEl8Y3XJQGX9GXMA1zxFxOSBVmgZjs2Ujz+zKhRAJPRiljfv8sTT5igHBVUXyDcT7/yZkY8ex1rO62pOrW1dSfmXbxL9EBR535C3daPjkwYBdUGCMnPLdVf5myv84sDEjWCIq+ic3H7MQJdnbqHVdcRqsNxoW67PSm7hqikKZv4a+PjEHUX8Xc523XrjH1jfsG+EXrcx4720WSek0yI5YZS00Vc+209TXkeUKAAb9wR1ITEGlZSFbo+MJilubYvY/e4pPpMTRm65SkpPNjXCPt+yNpi6DHjPToQYMGLly49M5JopCZ3b218Y+WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwI4S78NDZ3inrjkjNWeLC2njpKBB9BKuEEFNlhyvUw=;
 b=hkn1X+9kGQZsv4IcaTtihUEb4nOJcAChzDoj7joV2ML6y8+H4QkCuetrhES+8AEFSPPsVI8I1GIAFRnAZjj2MOYf2Kk8aZsvA+zljHQKzyjpRodG0n4QT+ZhCwabpdhWPdJeyS92sgpZSER8d33qgKMU4uDybuSRVK7Iu2dvqbYrp27NuKkUwahJ1KZolUjgEMETFzst0baB4qA5bt8fEQIYxo46BuFSIYxT/R/zlIM+Eip+Q3wkbfOIHgZKg19U+FUA6fNg52bc42FMtB8/KAMLBAONDcGxq4t27sh+XIVuFAcnJZ+NS0nlMlCFVrIFcXmvg9+k3TFHzdKnl0cUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwI4S78NDZ3inrjkjNWeLC2njpKBB9BKuEEFNlhyvUw=;
 b=tBU9COwnSwff2BmRAR2WDxDd7FD9X0dPQ/YlPNfPjvjkumtH2wgvuePKZtPiSuQqaHakjZrxGSFmPqqdyoJG137xd7XmUt0dHK1V18bGqyPvxOR5I4mwBzO9HX+eQ5AVXoVKmOUI5hEe6ghak023Ea7L1D1LP+d7QlsxDbGfXn86+4P4P+qiE9Ifr4ZmUZ7Mja8DwtsD18ibQPaDL1VIpn/Phm1g2Gx7X0v/4PBP8SzW0rHfncnOhmL0Bu5bHR/JujDCVBuMadz8vxnNBonsuIYJCxB0CeDPIJsVKSq9Oh4iQZdZ4swoNn+QuE6G7BfyfhxlOZOl8jw1CG6MqrXb2g==
Received: from BY3PR10CA0017.namprd10.prod.outlook.com (2603:10b6:a03:255::22)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 21:25:20 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::90) by BY3PR10CA0017.outlook.office365.com
 (2603:10b6:a03:255::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 21:25:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:06 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 7/7] gpu: nova-core: remove LibosParams
Date: Wed, 25 Nov 2026 15:24:45 -0600
Message-ID: <20261125212445.620391-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbd946c-0607-4ba2-6792-08df4b3a9bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|261021121427099003|10067099003|261102123227099003|11063799006|56012099006|261022075727099003|261021135927099003|261022105027099003|261021123027099003|261026140227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+fW4sAzbeOb09+YlQUeAkDodQBoKmGqkN0Stg3Wo+tbn1SmxC5PTqnOwTXdBJPArzJl7qudpX5x9fF+DYDOrAzGXgj/3obFNNIPZFjMyPkMrgM/HlgljezTDA8MY0Bu/p2NWOUYkBVG3vH6tuLUkOIIjjdRoVy2p+WfGg7Vf6kpgmwUp1OC+xvna8J79Qsxtkz9ruNSriB81oJyu4aMK1KT7XT1LsC8wu6qSf9DCAt4nDOUuYZEWT8o5EKG/Hz+AtGSp0m/YMI8VSSsoor6/w24UhFCBYb7J+Htv5IumbEqZgjMNbBX28QX0MRSEbJIqy3DKmK666GR89ZG0dxn+nF1ZVUzRBXNLatx+D43qpTKfgzNGj1bxFQ2kGrz5OwDZwqhwQGQiHoZbVUkvGyzcp/AwqjxbNoVPhXEkwO159qApYpfP/ItzWdh28SVrfgbLWNCG93jX1iE7zWaJx+3xavdYaBFZkZVZFPTpyX/UmQltFMXJ9d10hkXhMHpmJ5BMIHNcbH+1s3Y2xyF52K3hAfpOpfO5GvJh6bwRj7frIg5ZZgCV3qgaZlycOJzekhXhWG9R6iXnTxL33D4BSynjjEdCdh9lvP5gFU8lKih8RQcIhf7JIFCtcpASRqXTaRpBn4YVfOXi7wVSp3fKIXSVgAnXck3TpaRhwM+4OcubNHNbJ+/EIJGbyUDk3fFJND7CIip/9yFDlzunLOGsXk2u+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(261021121427099003)(10067099003)(261102123227099003)(11063799006)(56012099006)(261022075727099003)(261021135927099003)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Vna+AmKR24yKpqZlqHqPAmywPJ9ORMvPH8080lzjP0tqYSG9dDr/iupMncPzwc1uWepE3ENMpbmE9+TBaQTR3hgXwEosmAuTfJpB22m1OsyOzp8pj1TMxdhtEzc4H8+Y8gbYXr/FsMKpCMzgy49hs89du42Ynb2dJOaviYa2K7J9SY6ZezzgZm0rkq683kKlXPvUkq/n4QVj0ozASflB76zZjhrX/0gZ6/zkTZwUghSSM5ioasB9dFE27OT3upQ+ka4eoUJh9uRA8VTRBIFA0D4vJg5Ld94CGzppf5rj9hi2I01mFoF/NGAWtkCJIXL94BFcYoL8bKHmRMl1tfq+q89HBDe0YbMBa6DJTAb90n0FJhC9jD7Nz9sdue5I/pqUtCLsCvWzfN3d0d/Qv7TIzLMOiMR1mDyX342LpAzMJem+BrmlM2wKdd9UmiGzd5u
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:20.2463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbd946c-0607-4ba2-6792-08df4b3a9bb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388

All functionality that was provided by LibosParams has now been replaced
with TLV-based implementations in GspFwHeapParams, so we can remove
LibosParams and all its dependencies.

This also allows us to remove the legacy methods base_rm_size(),
client_alloc_size(), and management_overhead().  These were used to
calculate intermediate values that are now represented by TLV values.

LibosParams and GspFwHeapParams were two types used to hold data and/or
methods for calculating the heap sides that GSP-RM needs for booting.
Although they technically represent distinct parts of the equations,
they were always used together, so it makes sense to merge LibosParams
into GspFwHeapParams.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 96 ---------------------------------
 1 file changed, 96 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 9ef37e4f511a..db4da6a2ad93 100644
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
@@ -80,19 +74,6 @@ pub(crate) struct GspFwHeapParams {
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 impl GspFwHeapParams {
-    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
-    /// and including the first client subdevice allocation).
-    fn base_rm_size(chipset: Chipset) -> u64 {
-        match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
-                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
-            }
-            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
-                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-            }
-        }
-    }
-
     /// Returns the heap parameters from the TLV
     pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         Ok(Self {
@@ -105,25 +86,6 @@ pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
         })
     }
 
-    /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
-    }
-
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
-    }
-
     /// Returns the WPR heap size to reserve when vGPU is enabled.
     pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
         //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
@@ -152,64 +114,6 @@ pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
     }
 }
 
-/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
-pub(crate) struct LibosParams {
-    /// The base amount of heap required by the GSP operating system, in bytes.
-    carveout_size: u64,
-    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
-    allowed_heap_size: Range<u64>,
-}
-
-#[expect(unused)]
-impl LibosParams {
-    /// Version 2 of the GSP LIBOS (Turing and GA100)
-    const LIBOS2: LibosParams = LibosParams {
-        carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
-        allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB => u64)
-            * u64::SZ_1M
-            ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB => u64) * u64::SZ_1M,
-    };
-
-    /// Version 3 of the GSP LIBOS (GA102+)
-    const LIBOS3: LibosParams = LibosParams {
-        carveout_size: cv!(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
-        allowed_heap_size: cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB => u64)
-            * u64::SZ_1M
-            ..cv!(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB => u64) * u64::SZ_1M,
-    };
-
-    /// Returns the libos parameters corresponding to `chipset`.
-    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
-        if chipset < Chipset::GA102 {
-            &Self::LIBOS2
-        } else {
-            &Self::LIBOS3
-        }
-    }
-
-    /// Returns the WPR heap size to reserve when vGPU is enabled.
-    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
-    }
-
-    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
-    /// of `fb_size` (in bytes) for `chipset`.
-    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
-        // The WPR heap will contain the following:
-        // LIBOS carveout,
-        Ok(self
-            .carveout_size
-            // RM boot working memory,
-            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
-            // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
-            // Overhead for memory management.
-            .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
-            // Clamp to the supported heap sizes.
-            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
-    }
-}
-
 /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
-- 
2.56.1

