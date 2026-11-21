Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220980;
	b=zhT18be5o6joAcmkBTWGoGIa0Coo+FuN+JOxWJ/96+LDYtS6rFBhSRkKKh+IlYq92scE
	 x/v4alShiIw43i/9W3nnqVDMLlk7/w/BWI9nrXvX78pUAbEZ3KG+nPPbS6fmHjCjXNITl
	 CwXxjO7HLBIszo5x32U+1SKR5PxYxcAZUF8pTKEmJuGQvWqyZz9CTNhlBHfPwWvy1wq6q
	 tMuw1fmmVqusV6/DfY1/lEWbafo+BDDUG/LHdS4vcMCNUD6sUfLL1/azwn4lgBcMX/Tbi
	 0jEKROsPe97+3jYMVN6ieiZO3LnEFyzff6kfqiWfE1NzA8c2PytXVxtdp3HoHenycMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220980;
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
	bh=zv9DH4T/lSrcEYorp/yNzTxgPhx+gYeqPcP6JSdMRhQ=;
	b=0hvVe5V6uPCRXh0hua6XCPcfVG/QNwiLTJWDqOUeuawIJI2knevXSKXBYUszarg7BK5A
	 VpvkQp6zn0CgouFa1OI+BnaipNKVa2LvE6Ul0rv39+SPO7ZjGPLNEFrWH6xfCXjaOf68S
	 s8zlklU0Xzzz/Uh6qAR8AcFGzmy5jvrTgD3YIoviAzTW/ldRzXgXsQNRSm9p970N4fCGK
	 KYxn6LAQmUNoEM2RRbL9GFgCBXubBmEl5bxxZZq5HV9uSemOouHgDm7cWcRIWE5Tkf2th
	 hk1QI8yxmRdlmdarUxxo6j8reKKFOF5uqKAckVj0WYso6gNHXAB73Ingi5aUPaptXhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="nlE/2z4S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.33
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE27606A339
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE27606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nlE/2z4S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFigRbufttiK1wNnN3g6lOyAQESaIua2ypyGvYWPijoTvA4sASA7xDGO1Duzx64wPl44n3AM8f4PGG79CVMp4H81l2bB6cZAA3KY2gy5xToLAEFV2iEgwZ0mM78Y3jP4Qu0bSgcHp1BX4WBHv8/rHTdiq0iCtvA+AiKbOzc1uCu2CJi3xzD7+Rp+qhNH25h2bqXCFvCyOQEBr5KCnnlJ31Qtmh246VKRrl7Ha5+VVUhrN2p6vOQ0CcPDYGHUS606Ci8ZimNmlO4Dm7a6PaOizfyRslrY44LQaVWn9AIqbfCsHii8Ez7vQSxIZvCy9SVjmKf4H3CeeSUhoce5LCXcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv9DH4T/lSrcEYorp/yNzTxgPhx+gYeqPcP6JSdMRhQ=;
 b=JvoezoFTZjIkNYuE/xs38y9JFiZ8GZYZ9UoQqci58+XjMT9FDjR21tF7cIozJa4w9RMYzUFGq4BADgJ8a1KBdPvCZORAcv6i0SDROtUuE6x/fW4tK3kJ0laxnY4hzxwqTYtcya2xq0zFbFnti6CCcNqXGJ/A2HirWYP1eD90wGuWFsym2hXen0YKH5uZlMk25aG93NM2jpVtkUkil7TjMuVsdo++Jy09KjBL0FGhPFvIpXra0FVxefA4kYWscOkppUnLgEJ/Bm47Zh8jpmI52m4rZ2VpxkVaEj/PVkOaO+BvfzkQnQd0Ot6cW6Sr9rBnw3j1oUEpo+uCQudIP1qqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv9DH4T/lSrcEYorp/yNzTxgPhx+gYeqPcP6JSdMRhQ=;
 b=nlE/2z4Stz2V/OkKRsikNOrTzYNKFTCyf6S4G3OAUVNsaIVmPo/HXAJZ0Awk58vgocQLglyDFR4CMFtsIidS9VmvGwOvQyHZ6XibsVoQJXct0dI3xsrGAY8wRLRxnDv2q7gWp69nikVdoNbz8wrQu8jb3qzYYcEt+o94Nd718Bn6zLLWI4MQRhJuGuD62o6y6MaCEPa3ZAySuU7oEYVhKFzotdzzEx+XtW+eGvvWPgarJTkVIWE5yuBlI/J3qwWg7O6wlxLe6T1naGhUHQ1e2AA1aCwKwmcmZOXltUpzsQp0vSzewwKImCUyvZi/YQQ15ksKm+DT0v+VCXW584cIig==
Received: from PH8PR22CA0015.namprd22.prod.outlook.com (2603:10b6:510:2d1::23)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 00:29:25 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::a7) by PH8PR22CA0015.outlook.office365.com
 (2603:10b6:510:2d1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:07 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 7/7] gpu: nova-core: remove LibosParams
Date: Fri, 20 Nov 2026 18:28:47 -0600
Message-ID: <20261121002847.3358679-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 277acd6c-13a4-4997-4f09-08df47667ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|6133799003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261026140227099003|261021135927099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UozfHH4J1lsTvM9crVeLHSCTgAvsdpQqmgfrDsDB+T2S6V5YH2r4mtejXlEo/hj0p13p1Fv6ACZP2AcddP2wfM2Vbz+UVnMKOqI09tSp2OQbYSFymIfkZvwk4e4Lxo5pm1U7HebyJozm4PBQVyHJMeKC8ghsAxJWv84leJ3Hr8xv4OBB38Pl4Hm84lAlLfdNNYBlr0U91u/QR5Ij0K/p6EszkJpP5w14fli0VJJ8eGmo/SerFBBvn6uBJhKNmb6r+SbbxaxoQCf0n4XHdZiXjp5GEcXeDfgAw+Tw/2ll6DRbFaOvDgAY7zey/AvsF4YdL5ff+m8fjv6xuZAip5FDWqfNjpOYBAwaGIhsHMqgfar8Q89h+6ojALyVQq6IEwGGOtj2+fiSwm4tD40PwcK23xNO54615hyyoN0ck+eo0yhOZNP6gX0iLzgCgXQyF8ZmXbEcrH32zr/uMXxQtUEZ2Lzo6wDIj659CJgkYOrqL8VWkDSZN1nTvXhfI1mQhHHDsEOUjyfMbLIyRKHLfswbrjnJrXsger85qlO6MuIziSErQ9Fd2Jl1/e/0af78WKnwtl21rCW28itTun3u7VuKwoxmyGEJsDc/ohhKuIQFeQeukfXavmcXyDkPJI1B5//gNaIxtesHuE1daLrLIlMFFVuRDjotv/Y7X++DWdLMH83b8S1vnYONEAQ/7YbB+P3e9aLE79ARwbV3MfPHHvze7A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261021135927099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OgmBaW5w+l9bb2ChBBXOGHiqqQdkvY5uv6PcLDQ8CdIt/PXnUOsp7flDtsb69YOlW3MANNWJasWIhKWC07//cGG3+ExH36l3LIZGv0xoLcZ/mqnsKZ2DNtL4YMi6VSyXZDLsGaH+z4SWFKPSlg8dHT620fZmT6aat1nKFGarl9oii6182VKW5ZCBcKxueTEGimJhogruiu4OlfG7EiyCu15PZaxPi+Z5Exj83MZ4a8OPiRULNzWusWynjcxS/Lmc8W1TB9f8dK6K8RcP2QxQ3j99e3UE8Y9tocT0rKBpoEuMOZkY/CPBo1mO5uTfDHVeE0jJ45Lgj0cmMCI+YuP3l/uzWOYAvaASB7/ehxSJS56KDkh2gX51axub0ArwtxN1rDwbH5HxfTIu3LJmNPd+6/TAGxT2HsKi0C2sGjqwA4AtigR/iP7IE+sEg7i6THS/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:25.0632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277acd6c-13a4-4997-4f09-08df47667ee2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

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
index f185f1bb5ce4..6272984a4f1f 100644
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
2.54.0

