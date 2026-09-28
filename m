Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F94349AB
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591419; cv=fail; b=DCNtaK2pAMF8WnZVPfo1LLPNjSS1wgFR9W5P91cUKoch1Xom6v4OzNxDfgCXOn56LN7sQJTvPyUi+FIL1vtNy33y4d9+8npxrVbspOysVTJeMZG4ewCW/gCWALyhJ2iSsepO1nvKHCYUpzjtp4cBmKBqdozrYv1YlC7pNY81Yw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591419; c=relaxed/simple;
	bh=K06IHv4Dy4B99VFF7MHCU3f2kw2JyCbpZv5zRZzm3C4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjLn1/nCBpFynRN6y/Lju3pm0DNNWK6ll5pLPYyYxJSSFmuKgxjLUAuEvEsSpQUzNEezRg+qrbRj9JqkI8F6eundcdPN79rooOBIBOIfbP/+rniXUQnx+oc98yE88J8mWjd0F+aBZ4alpmUHotbC/BqXdj/tbV0eDmBwKZdiLiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cXRxf8Pt; arc=fail smtp.client-ip=40.107.208.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cXRxf8Pt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy1jGWTZ9S8YZMyOYYOCzTpDh3IUME88nYjhS9YBt0grTZrTGbPSp52Dx6a07UykIX7p1dlH2T3mub0wA70JybPRKBg1TPKM4koZcjxIfDBVC5XbdrD1FL3oEBjhG3Z2SlmC5wK6m+25NniRrAt8UcTtZeFi46b1xw+GYBsoXTUAHH/IE8CqeHLvhu88q5wizeiHwtN2dt7vWYC0cUhvQJ6aQqoQnZaq/omM/PsT0AyuhRUge2fGOginaCrgxxZcn7NS9NcgWaneGdT7F+wub4JTusd8f95HAXPpsIjFHNEV0gUPVvAVPHEhQao2gM/1XuN92wP869t0QpOcjVilhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOFU9qnBZWHAkbeFWJ7OKiJSNdCtqD3pRi3SAlWVeUk=;
 b=c83o8taKpDxM6h3Zc8Dme50Bi4bnBap3laDZ7ammePIcRJQIj9LyyOioSZBVt0EitXTtlZDC1Y+vg0Aeg6n2w2VmqpRZPLT+UvEwnI7meKX3v5mxeF+2f1vTOpI/ZDcfBgjsMbIGPCsM9/4gyTkTZxw7/BKcBbJwEmGLTizB8xbt68obzZLPpIl1voYKZJddjrT71NIh0JS2ny0ZQR4AyME+IkmZ72pw7+HfZz/aozD6ytGMp6d5YEFdriv8YG0jc/Rtx8I2ci7KgmaDU6ezlUQuZ23yV8mR8v/IQZE4glawQQJ6agcoC6SvKSVko/STMhHx64DmaJ5TAosp91Rz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOFU9qnBZWHAkbeFWJ7OKiJSNdCtqD3pRi3SAlWVeUk=;
 b=cXRxf8PtHdsxkrvDh0EJKv1O677WPkBmDzMT7jmlPWS0Lmk1eiy86iYnJnob4KizB+fekgzLrIElzRfub3MEwaLF5WpZd9jAY/uN8fdXRtQ/+zdiJa5RhrF7cO+mBj0+SeGrLnavZgbUcpS6uPR91AdfH/v/Va7xcWI5XrLloZ0+oKoR1N5pHvjMvu4S+pfaDSaFiEPdj17tHx7FyhqBWhJJWLjmLIKwoswy9TYonZ7yxHkPFs+d0UkiHgnnlvefJsomwELVpt+yai8ETo9PkNKEIIiMnODF5GpMchjt/dO1iWc7XJEgVPOI2DQQu7meVuvgxtRkUmNz3kw96sn/6w==
Received: from MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::19)
 by DSVPR12MB999285.namprd12.prod.outlook.com (2603:10b6:8:41f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:30:10 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::25) by MW4P221CA0014.outlook.office365.com
 (2603:10b6:303:8b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:30:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:10 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:47 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:40 -0700
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
Subject: [PATCH v3 07/31] gpu: nova-core: vgpu: reserve the 48-VM WPR2 heap
Date: Mon, 28 Sep 2026 13:28:10 +0300
Message-ID: <e6334d750c07fef971f48f517449fc8d70be75b3.1790580105.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790580105.git.zhiw@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|DSVPR12MB999285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf77f7b-ab88-4812-46d8-08df1d4b7977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|7416014|10067099003|56012099006|11063799006|260925021911599003|260925021311599003|260925022911599003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0SugcizIdTxvACIVkLhlkTk3ppqXa5Fxzyp0A+3bJJfPgYipxb/ADWAnEPcBTYNRlyXS7mPVkn/FzX7fZuRKrtsGRtn6waXNsG5coVfhxtgKOerPH9Kyks18LQXHRhIYIL9VLetotiHaBXc7VMlllYda7FSryetPW01i0pGTbkfwMLe+N8BKk8Tw+jtQiyivIMbaNHY/agaOPV8ra9BIhcoawt3JYczfvKNUqIUzpXY5F8vk59HEdBUvBJgkjafRV2xFz6dcZgACOHw7S9ohVex7s8pkeHz1gDXCQ71f6mloKK7na2bjwtr+gPatAYubmnRaaCpVBoy7rErADctadVfcCY8Uop4bZGBnaHsrZG+wHK0wPxcNiFdS0g8G0oIdZ4jPe1g1N+iCClYQUw6GCGHYjhiIcuwu/G53c6AbxtbVRw0bOHv8le6OWTWl1iRMoAmTplCuKoOzcLbmyUHiS1ol6dv5KojwIgCVwuv6t58J4AJ3WkmXTxicvFbMrNeJKIm+43JM9rBjHbkVnkbHAZuNmL6fx8zddcAnfZkc9XkLHqhHTfR04muh0mEqf6cEp2boidfPB7bpibVQk/4OCazlXp5cvn+iVMIsb8qIkRfYsuCH2kOvQCQI2JgkHbGM2Syzm4lP18rB720YzHbwrKtQej37F5AaCP+JeaE+9gre0jukfQptjkKXdhczSc5v/g9scQCM6bpzqBvTM1qhcA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qXU9og4hCuc4cd12Tiz6xlm6LnBQiVG450zygJE1G5Aa8EF5o6M4kswSjBTO7uQpG7ojYjRdfczG61PWllomoRjTt7FvOkTHxXF0RTQJ5qyFmuSLm6FtCUglK70UcV2t/XSKWHIHjo7IgGOVbSTV56q4+lm5M6jLXtvTPgyWagLdCwQX9TBZcF9jhRa3q8fGTYNEYfR9jSy6/IBEf4mX4WvijcIZhcwOTIIbosRq5qsO3X83qhZRpECFBRvE8O3rvbwpVVGcT7p3lHG393DgIF8Jz+edTxcD2tuPhe+it0epju+YCCUIgWfH+uwQ/saEQssu3JCoPSYRPXk/jXbg5HmpC2PcuFfh0mHWcq++gLEDXrkXxCIIWkcfcBYdouwP7d8k2Gvt7Q2mIOpSruHS9U7OUH8momX4MCoxIsnIyo2PRm/EEKPFWsedIH9vPCJp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:10.6573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf77f7b-ab88-4812-46d8-08df1d4b7977
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999285

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
index 717ba1cc4bf3..90bb324666e5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -133,8 +133,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
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
