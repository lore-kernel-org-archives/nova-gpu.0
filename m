Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858933;
	b=XnUO+PYPmyXZJ2sZvMd5EU4Mb/gXj1kgPNwAQXzj4WlCengFf+mwv1BzMJq73ox30hQN
	 1Jd4ywO5qYD+hN0hSbxH1bumu7hVErJGAM3iI0C9rDbZtSjF1dpwXMiHwEekOVD81dwct
	 7q13gFDjL3LECdabb+Kj4cblPtyxjsRfN45NYe0lExBDXZ7Itr3gkXOrJHTwGdJEexffq
	 dZRNsQ3QdYK7kJViPxcv2UGjyI4zBe7amq4tWYGovcNKnF72FaNoK+QRRRkkOjTfMZP4O
	 BxmzYDjNmPaUbTe8ySiLyP+YwbP3bj9sjATRLPiR+hZRwemiOm6yhB5DKgMhnba1K1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858933;
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
	bh=fJH6bOy26cjhAAoiNUGsNl0lnhLlXQ3fDO6OIlhU918=;
	b=LXqJpu4b95wQbdjzz9Ajw09PjxyUVo+QVAUT9DpKjQUOAuHYlJRJkZoGy6P/FkzrYJPb
	 NmJWCtlGnTw2EujG4W8ZIlBEWCjUrnJv4maAYKiQctg6tkAOPJ/lHCR6FO0Bacu12mTE/
	 USVS4oxTETezerKHLgCohjlWGA/+nLJJqESu9L8Pw3WGyOZG5PSB1PMRU+Cf9h/TuGow9
	 ZG+SHN2HMlWk60nnyWYmXlMRjUeXgzmx4dXG3FK0PfRIDmdRN2fTcTD91Ee4xyyEJ2xC6
	 H9Vct42fBM8lpHyJN/HEQER9svYnIAjiCsPV6w7JLkfUAy0QfAHciDEPTTdoZEb5AUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Tm0CZnEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.67
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC4606A31C
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECC4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Tm0CZnEw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+LP//2JRuCoUyQvb7TLFTrLWqXg2qzie1V/E50FJnLXNY/n3xsGeDC72JTRcMamymNxynYoEuqbOiUkJxo0X9IGp9B9E6q/pRU6NEhpCOFrTWLN7ybu4m3XXujzDTh2si345kpEBWe/x4qY21pv0abZrkwkn2W5ZqhWxmamzH0WbfNgFfsO+FkBjZatO1e43zdWZl0hCUn883Z9IuyauZ3HCeRMM0tFRpoES9iwklysxHdkPoeAzxoQisiJ9u+2mvgCmdiwtQWan9KvK6ampYRkXe8pv5ZRz1RRrM/xuwpHaZNnF0puEaGj3/NKPPgtDrvVTTevScWhka0Ni1pP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJH6bOy26cjhAAoiNUGsNl0lnhLlXQ3fDO6OIlhU918=;
 b=RReRHLyeSJjnhqCHdaX+zPJ+KIV2Q/+XDCOIzJ2f1XW8XbbSYhDmthG8Oiw2yHyhVn3QhohIjIQrU5KHqimcReREBH8+qfOJfGPiiW63PSR21ILufgb2byEvGD3dVe8c4ojJC2sJM0iwNJ0SjIZomV8+sU8i+NcjUWJP5uha3TC41OEwIEDyTbmSlP6Y1UnBIM0IAtPC5Hn76OkhcvKsN7jW1DYybEt11dFTGuFQXljOW3lzn6Xa4u66iU6Onpf32t8HiTD030DAFqd5JrE+mCRpShXYydcuaMfn0CCfM9RMOy1MYqWIuTqMr5N6OKW9fETHQ5A4K0nFet9+plYapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJH6bOy26cjhAAoiNUGsNl0lnhLlXQ3fDO6OIlhU918=;
 b=Tm0CZnEwoEYng38HDseXW9WsvA58wsSa82crkGcUkuOPUFq+15FjbKzJFBK/YqTbZ7gXouR14A9gifA1yYxheBtRnoS96K91mfot4WFUokcwzQkd27GLNRfFi2kQDSDGNbjnUMeGk/uMr9Gk2YOtqPrgthcZpujiFB1k49yhZdGPnsKYdOVWPaIZXQ5lKE7sgne/v73SoRCV8Y7QwKqssc+hR5dxhMZZey+8stCbwKohm7HB8+0hKeEgYUmNaorzOcqsMMNFPTlGq6a35OJHnKB8ZowEY6OVk2ic9wJqfj/HlE8sEaAhLhrUTgEVtUu8G6p8iQ/jMQE207BlWvO2mg==
Received: from BN9PR03CA0359.namprd03.prod.outlook.com (2603:10b6:408:f6::34)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:27 +0000
Received: from BN3PEPF00022BC5.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::57) by BN9PR03CA0359.outlook.office365.com
 (2603:10b6:408:f6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 19:55:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC5.mail.protection.outlook.com (10.167.248.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:55 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:54 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 7/7] gpu: nova-core: remove LibosParams
Date: Mon, 16 Nov 2026 13:54:41 -0600
Message-ID: <20261116195441.940595-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC5:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: dc353f72-d519-4337-2ec3-08df441b8ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021135927099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Q2IN8o4v4rjWlu5l6IuWoQ0jV/6nSzw2mVhE0l4xtMdsQ2mvfdjVxiK60LuXpiaTy3JzrhLCRXVV/Y2g8X+X0x4SBkHkoElvaC0AYfNdqR1tGHaCNRuBOIMyMzE583/UFi3qt08MnY4um8DwEH6l93iF2UbtQoHU52Xs4khG0z6HMijExOPem9nRwPEdBW7I4m1PDcVRwLVSaLbvv0O8/LNpW8HBErBjwhWepOgp9cCxbzci9NM9rpBy5eV9ztn5qI1636AXgLjzblxjYguTv8+17h7AON5wpjt/FY2s87PbAUQhqYNfHxAMbMHHtxKpzB4HesHxahzUcPDMFa5Zt4/fQe1KsWaBS6KIS3aqWxowryr+UQuLIuQafQep8u20yzaGtRhyRDWkOcdbMhTaPtk8RPD0qhQFhhTiIu2Drj+Zn6WgioXeQO34J5S6hZYDPl6mlbM4Wc/phDVTphL/Uxyi75ycG7MAr0nQ7Cw17Nefn8F31Yh0KqhkKCzQofhlb9hYTyOuPayDKmZfFzea2GL2moaxPTxUZfbd2ocmLn8a2ZWv3QjPWzTmOoUJirxshSWY+5vb4oMJUWom7v1UHFNJEp2WpiuQOSf4XZuAmY/zU7HmgSXR3i5frXjLb7dsr26cUW6tslJKDoCmFfj3hHfOO+6N68t5NI0O3Y5dDot8rSCEYc0TaZdIJoBnmPLM7AI3sbDmqHyptC+krU65kA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021135927099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gWb79NXGziO1Ctcs6G6huSqUBJXfGlzB7HGloLxsCc+HoI42+M5Zldof1FxTaBgT0+8h9chaj1dUgh+iWWu/gvqkNqjsADy91ftFp+YmiIQlpp/Vq19dTMZY+x24SQjic+zi5fqiZd9UHNZWqIKfJAdUc2vq/Arbrfxc7ZDGQ/BYdiZ947lr5BmDkskRdqRYukvSrvmbMIqjDNE6+zaxxQS2v2Wut409PgMX1M//sxSFsqjJNES6MU289GxTD2jUXfb9LCw3j++mw0G1JVCF21+I8gCmP8kcqhTN6+B0ics+LuI+pMDDMFlDmh6N0umJANo734LlzOqY6PfqOH34djg8IVZgAxCxoaXpfnqeJqmposCU7k0wMYe4x0S/tHki27FLTtoMn0GzuVMqR34yO909INCOUTCOmhZym99mzwZE9hOz5O1mpbb9hQnOuQC0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:26.1312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc353f72-d519-4337-2ec3-08df441b8ef7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942

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
---
 drivers/gpu/nova-core/gsp/fw.rs | 96 ---------------------------------
 1 file changed, 96 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 03deabfc2f06..a979e6a8d385 100644
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

