Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455533E95B2
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372253; cv=fail; b=sfg4eWzEIAqqCIyD75y1daYIKzCijlTinwdYcbyCraSwhWdkf9X71LKOa+jPAE8lDWRMmCKRuds4kbt1qBqIiuWnv1ktDoa6nomVT2rovg+impSdcfdizhkj2tfyXCwOHe3VUSBRqaA/9V7x7xG44YrlIPGzTc5aBD/IodxXC5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372253; c=relaxed/simple;
	bh=4XLk+N/zsiIteLPIszblBhSORJJtRLNWgbuT7OPKUQI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipiBDVySFLCRVnB8gVQK2zdomSIG7ahlYG8IO4V42mtqg/K9NRep17R5++pThXZyPHClCCLgLR+OvZf8uC02zQbrjCHenCaPufVJe3Mz3TSv9GLPd4gdqOSDyjnEn6eUJJkOelziZii5x2kpjmBGxI/YnvC+cRKbk1kOaHZuGVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UfyKHQJX; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UfyKHQJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjDuB5/Fz5GxHfFkAVTarmy72ys0J8nd2pYDuMV+yI/8fQmMlm/MdSOcKjcFHI15NONSasIID8kcLnl7sotD2m4R1cPa6LxiEWBnWAoly5kmU3pSERWHPD1W4w+Yc4TuV3W1FieOUUh9tQo3NHfRmkfnnz3efUGukRPMgIvYjfkPOCY7hge/hXlnSBeul81pBGt4OGamwd3YTD5s2rJUzmMcOqRcCFt2ZTzCULmEKxIFK7WL+vL3qQj3iR1pYkevOv9ayQHvZO6o48cYkLPzNbaiADLdHkzsEGo4lt5oW9fkg6c4Ynop1Bg5XkRH9oWwGnZpOEoveA1qdC5JxTyE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sR5DfVOlU8Ib/I7w2xfmirMsgTD7B4vL/zoEebFIyg=;
 b=oRZFlC1Luk08sjbiKvZeB6pGLp1kcnn6asZVJ2iWGID6YuvLfmGtJnbLLfVXI9DHG/j/wru2OWgK2xElDtlAf6XyHn1b7zkEnCL8BrvLgAjv/saMYIg2M+imin0Mhd5LnCcVHtXg3pzHSu4FyC3M6iwfmCmBwA/5NLeyhCpyusqgZLF+07ylh+8fie3siy4cu9CgQ3htKfbJD/jIeD9NQRHLC6R2EaZRO1Kc9+iiHrRlP+EIC/1AYZEPuYME53SapdDyCW5wver6TaBSNN82XyZxj3wvC72LQ9N6IRYg5XAbu7hqhi5fAA4HoGfW+rma5GX1ztXSg2BPfolWGk1G6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sR5DfVOlU8Ib/I7w2xfmirMsgTD7B4vL/zoEebFIyg=;
 b=UfyKHQJXgo37/bRVol3mQG1LVVFbrDc48QaRebyw3DwEvtflSE+X/wqjHXU6lv7Prp9OKhyhKc1vVvc3CbmZ36AVqwdY8gNxZTInTbG8nsdovfk3RLiH7/HVJAV0cyqS8932QL4FjU8mkgg6GHw7/Hqj3uCfu2UYmPw2AyZ23KcO7zsr2KTRdULEHmVvsEL2Y//1fJZRVeyuray43HhGY1RzlCBLln4jpBPvb66b54L27IaYUTDPLMs+litiwmhNA6VC340UAURWrt2RPa8RjCjCUh9G9JG/kDW3jLTkWCSwf8MmOLwLbGL5YP4+wJmvSc8vGQ2s2NHyiG8qDKpSfw==
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:50:43 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::87) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 14 Sep 2026 07:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:26 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:18 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 08/32] gpu: nova-core: vgpu: reserve the 48-VM WPR2 heap
Date: Mon, 14 Sep 2026 10:48:43 +0300
Message-ID: <20260914074907.1399629-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: ab734036-8ea1-43b7-4279-08df1234e12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|7416014|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GQjvdz9PvUyEFShBg2posUHRNsHYh5y2oyl8eaIHyOW6HjgTz7JmdW++pupWMkame+8lnNSI91hCWZvbTAJbBtYyfxp0f0HAypHuP4e+HbHW12bqlYqXBSxUdIPAPIcs+uaZdM/+pYhAimnbfG1srnwCPLN4PKM3INRnFXLt1S1K81UEuEtSKER5NNzrZkjnZ184C0kY0NbTeiT+AE8nWHlOEyw8NFBzNK07ubPEZPD5Zogr7qCVeV7uLStyWGHmJe9yO2Jkj/a8KVQdZElUCYsHzXacF8VjCawDyiQOxRQ19qcMbhJtV+scfQUfmTZiPpe+BwpqsA12D8uwql5Tfr3C5Gzr2NqvTBTZcZykX07E7pYfoHSPp80gSkNEkfh4kyKkKuDnFIjrq7IZ8kcFqVuNP/fh8WqTOOan5vRupnYSCm8CI2wI3uyZk2DctNgYfJkvHKezINvqnWWutDST8StC20hSJdOCLwwVEj9j3Gd+5PIA4l4niairEPM+YQm1NxaT8C15Fcz0IaJkqaSVxLsiK4VganCwVSN+7eBb0WlyufEiok0z9IuDwvMnxB7Qr/G+QzgkNuzs9lZbEmtIyVp/w2KInQL3wEgsbNoqdN9vktqnOcacriY5eqzu98CGB9bItrmM7j/379h4gVUrsnjMa0Sh4bR2BMZwGMslDtOqo9srebOSYJzpzpFR7oMScfSWDFBjUsAmqTbGZTveYw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f6NOPrLLuQWQyLU7Ol11bvJakpqoOAyir35+58xXm687QFK4z2cP/gxJW1Z34kWUWgtwhHkAmVU9etdrptWv04upyjixqtQVnJu48sWoaq9lo0gKqq+tyYDSJAqJBeyPsA+1yBUE0p/cpKlzzAILi0Dgg1pMfowAIGexx+cK1AsIlak9iQ/qLkVZOqX9fzzy34aZZVO9onhaqCLfaga2OhBf3vAFcyPiiRSR9nhySzvTaBJxxa16REy6Ud1SApJHmYrrRLb8PIWUHxPs72TRWk0H8/GAweU/OWnhQ5601pXAqCvQ/LLtmqfKp6C+4r+s0vDVnUD71AgzH2BimSnRNpOy+JOIyVOzEWbNVm2cmtyo/g5+YGayeFQjA4McdzzZeimhGM6VkjY8skrBtqSEFAmNe+6FxWPz91vygMl5N4v5wa6VveeErOtX9U2XsKTy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:43.3327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab734036-8ea1-43b7-4279-08df1234e12b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265

GSP-RM needs the larger r000 vGPU WPR2 heap on devices that
advertise more than 32 VFs. The default heap is too small for the 48-VF
GB202 configuration and GSP-RM fails to start.

Select the firmware-defined 48-VM size from the detected VF count while
retaining the default size for configurations with 2 through 32 VFs.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                      | 2 +-
 drivers/gpu/nova-core/gsp/fw.rs                  | 7 +++++--
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 882827bcfd3a..ba68a812b095 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -302,7 +302,7 @@ fn wpr2_heap_params(ctx: &gsp::GspBootContext<'_, '_>, fb_size: u64) -> Result<(
         ),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            gsp::LibosParams::vgpu_wpr_heap_size(),
+            gsp::LibosParams::vgpu_wpr_heap_size(total_vfs.get()),
         ),
     })
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 77a66f77f4b2..309f9296ebc8 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -129,8 +129,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
     }
 
     /// Returns the WPR heap size to reserve when vGPU is enabled.
-    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+    pub(crate) fn vgpu_wpr_heap_size(total_vfs: u16) -> u64 {
+        u64::from(match total_vfs {
+            2..=32 => bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT,
+            _ => r000_00::GSP_FW_HEAP_SIZE_VGPU_48VMS,
+        })
     }
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 454d0ea9360f..fa17d3e2edf6 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -84,6 +84,7 @@ impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
 pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 = 609222656;
+pub const GSP_FW_HEAP_SIZE_VGPU_48VMS: u32 = 1436549120;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
