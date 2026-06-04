Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E43DA5D2
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573477; cv=fail; b=oKYEBRkflkleY8SqZW+fIRHMNMd4A3MEcS14B7Hgdt1EXQUaASiqF30Jj2r+/pNQapl4mAD9QhTYo+HU5ML8ihXq+NoHiy59q367AcLBSz2JDV54iseExzlgRQrdAwKGrBMvxdQHTXEXS2w9JkXFch1DR/kmELUhqWL2IRjCzLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573477; c=relaxed/simple;
	bh=yplRFwmH2jpyhFrNmDPZiE2BWal9EOows+lYvkQWMqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4JBgB/pmkB5ngLIdsL6FMN2MMVz2ZEgEiK99xH8zmuZizictQpTMOzN6P84qDRh85yUWJIxCUbnce/8PT1RD7ZxicrTxDrAVlbt8UENauKcyt2jJVbS/J9ghmAidd0t3JBhDTLB/fU5ppc9U9i2u3Ep4jWUoCvSxOqkVCJSs1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AycyFcsc; arc=fail smtp.client-ip=52.101.56.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AycyFcsc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJpo0zXAzn+hAVxhNmo4vf0ARZi5jfLN4rC44mvOHYQXqxLKMxwmmTNGDzcbrqy/g+qIiXsGYTFA5buua2opLFnHYefI5gt5E0DgcmJwevPk0VGHdWox1SPjSzNO7q0Y01B1h/pdqPphXejSQhA6QVsE8PT9y3jndSXI15c17WhmqYYv8MO9sN1BCfe2/v0k0JOfUJEpy+lmZVo+6f72A1MxGb+MI2WmI1Ug9SAa9w1aazcTUYqzEENlSmSyKz85wOcjY9mInP4D9XuTSyTZy4nMA9xhwpkAZ7BBIkVNmbqBIFgU7M8aKpRRx0QjMI8zA1qcPG05yqjSU5cevgQ6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1uSOZ4M23VB1ujrVyTSvP2f8wy5uE/dGqNT/pUT+a8=;
 b=FqKMjlgrfiHXzle0CqqkGpQqrKSTkUsquOUv/Mz8pscsCZmAtTmARPLmZYIzIL09pdV2xRvkA2+A5iDL+YUbS5gy83wHSlkoPX+792GGMFj4Qq//2u7ApQURbi8jRyfSrbYx/panPG7+hdaFBZLXZYrsB+e0OLagGPsuBmJ7bTHGS+M8D7cTGXljPPq9MdiIDVGZUD0fRLwVyKu/pF/2D6iZmG1dB9PoTr3DxdzBTw5Km8io+2GQHQV/potIIjZfQic1Ksak76m4uiIbQQ9lTnEitc/2ITtRH8mIvmupw/8+tlJSMpCc98f1pnZ5gfIDuR2JchmfxRMpxZ6XuYKfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1uSOZ4M23VB1ujrVyTSvP2f8wy5uE/dGqNT/pUT+a8=;
 b=AycyFcscO7bR/1zQgH38AxLw5fno5zwA6SRZC/hpaZ4KxN/QTqZa4CXEXRZctDmBkDhyjiVSM8sUAV3wzTlyfn6xNjC/LdzOy5AWpSduZiFOgq5A8+EKW5kcoRluazq0gadyWS0q3CNR33KXlmSOVwxEwvzKE5FeI6uhlqpefGTm+ueqlCFn0ENNaXTPh6ljqSDEnSeOm+lxghQTplTa22TWImBCVVjdanHtuNvGetMcbUOFtVioTt98k4wnfLH9QL7sjwJ5eYVwf+jEU9oGTewcApHLNT4+pyBk2ifUl7ejgdjG5jfNZgVuXzLPBi59WK4+9N64AJz9SJi8umug9Q==
Received: from BN9PR03CA0200.namprd03.prod.outlook.com (2603:10b6:408:f9::25)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:44:29 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::5b) by BN9PR03CA0200.outlook.office365.com
 (2603:10b6:408:f9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:44:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:14 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:14 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:06 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 2/9] gpu: nova-core: factor out common FSP message header
Date: Thu, 4 Jun 2026 14:43:32 +0300
Message-ID: <20260604114339.1565660-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604114339.1565660-1-zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: a3997da2-7774-412e-1eab-08dec22ea2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	RJimeTy6LkMrRkFB2R76WdnI+f1RS0Bu6JyqNbFPRfv0glOcT9JBNTsaFFpA8IwC0v1wfnTwzQXIo1YvNbGGXakv6h/JS3fr5DAe/4zqI9KGfOTURgbw4f7OGLpKKXqoivGRtZJlqjfic2KjUKjVCOTW/bRsF+cyPu4KaSCZ7ddYBVs3ctQlu+INduY5AR7ewLtCkelDSF7PKPwAq8OsO3bT+pzJMvrVxwSZF8w5jMNMt88XSu72hMy30nPI5tROfeNEveIezzPhigTD/Fxx2jLUtu118szw36Ca3b9IlOryP8RTKSjujB6e00/IpcEk0GkVATueIo0vD8uOi3TZpUQwh6RleZUELXfIE21XZy4G1lct71s53SSKV1mG9KDXLEvZjIKSrIUjB3x0xC8uzn7n2THQhAGRJdBYGnJ888RGmrUETuT8OA1JTQiOofZRPenI106tJjFHRIc2X3/HS1bBrDMPCK/k3mLcErjTv9wyTfL3BIxWSg/EMLJXuCwAxOnNanqzWVr21rhHIQVfAkrxzw5zGhIBJay/be4TXKe1LXWdKP6fmyFMSH2x/YA1jk+yQ+CgqOTX/sCAROCzhHZJHPEDjJSMytHx3oA2PQuQLia3T/4jWWtlrYBKYcVsF2ZV7I8YUd7nkxvRBXzk+L0Vvkhvl9VY8QsMUNCkWImpoes4XbvoDBDTITYDo9kgcd/2VzHorQKesO+WqfI4LwTcVu/Yt0cCmKWkzSdI7Lg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6EGPgB/7+51NziyWi2+7N4KkHyH2x0Joj5yQpPW2V23j6jiv/RRawLI8fAwDx+qiWvfDADJ/hOywk4BQgmoPhJp9fX2L/bHQW6MfcoALN95Q/RquO9N4xIwJc/hR1CYu/Bl4DWduRcBblSiPcAwawf0UIKCIp5KQAjX0z4teCmH1N7Ft0ua4NS+EKPQzMM7s94Gd1JoI3YbsNiTqMB1E9Q+AyFTU0O+G7Bc5zPGYo3fqs8KUAnr3oNpjMzGGQaDQCv7Smj2lal1h3cLStLft+W6NIzCvdh1VaK3pU4udtNZ8VUt80+U4tZYw8vGpvlXSPCoypnHbajBVx4UqIuj8CCQOzk+OcX0BZlQ4T3EiAnXOj/SIXiz1ivKPympZD6k0NGuErtA9Er4AlRqDwiWViOjO1AP+0pVvY6dSjtN77iheL5KyalzbIo7b/YDOOw2b
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:44:28.8147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3997da2-7774-412e-1eab-08dec22ea2e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955

Extract common MCTP + NVDM headers into FspMessageHeader, rename
FspMessage to FspCotMessage, and update FspResponse to use the shared
header. This prepares for adding new FSP message types.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 56 +++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8fc243c66e35..78b90bfbfba4 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -57,12 +57,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
-/// Complete FSP response structure with MCTP and NVDM headers.
+/// Common MCTP and NVDM headers shared by all FSP messages.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-struct FspResponse {
+struct FspMessageHeader {
     mctp_header: MctpHeader,
     nvdm_header: NvdmHeader,
+}
+
+// SAFETY: FspMessageHeader is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessageHeader {}
+
+// SAFETY: FspMessageHeader is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspMessageHeader {}
+
+impl FspMessageHeader {
+    /// Construct a standard FSP message header for the given NVDM type.
+    fn new(nvdm_type: NvdmType) -> Self {
+        Self {
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(nvdm_type),
+        }
+    }
+}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    header: FspMessageHeader,
     response: NvdmPayloadCommandResponse,
 }
 
@@ -94,17 +117,16 @@ struct NvdmPayloadCot {
     gsp_boot_args_sysmem_offset: u64,
 }
 
-/// Complete FSP message structure with MCTP and NVDM headers.
+/// Complete FSP COT (Chain of Trust) message structure.
 #[repr(C)]
 #[derive(Clone, Copy)]
-struct FspMessage {
-    mctp_header: MctpHeader,
-    nvdm_header: NvdmHeader,
+struct FspCotMessage {
+    header: FspMessageHeader,
     cot: NvdmPayloadCot,
 }
 
-impl FspMessage {
-    /// Returns an in-place initializer for [`FspMessage`].
+impl FspCotMessage {
+    /// Returns an in-place initializer for [`FspCotMessage`].
     fn new<'a>(
         fb_layout: &FbLayout,
         fsp_fw: &'a FspFirmware,
@@ -131,8 +153,7 @@ fn new<'a>(
         let size = num::usize_into_u16::<{ core::mem::size_of::<NvdmPayloadCot>() }>();
 
         Ok(init!(Self {
-            mctp_header: MctpHeader::single_packet(),
-            nvdm_header: NvdmHeader::new(NvdmType::Cot),
+            header: FspMessageHeader::new(NvdmType::Cot),
             // The payload is packed, so we cannot use `init!`. Initialize it member-by-member using
             // `chain`.
             cot <- pin_init::init_zeroed(),
@@ -153,11 +174,11 @@ fn new<'a>(
     }
 }
 
-// SAFETY: `FspMessage` is `#[repr(C)]` with no padding, so all of its
+// SAFETY: `FspCotMessage` is `#[repr(C)]` with no padding, so all of its
 // bytes are initialized.
-unsafe impl AsBytes for FspMessage {}
+unsafe impl AsBytes for FspCotMessage {}
 
-impl MessageToFsp for FspMessage {
+impl MessageToFsp for FspCotMessage {
     const NVDM_TYPE: NvdmType = NvdmType::Cot;
 }
 
@@ -251,8 +272,8 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) ->
             EIO
         })?;
 
-        let mctp_header = response.mctp_header;
-        let nvdm_header = response.nvdm_header;
+        let mctp_header = response.header.mctp_header;
+        let nvdm_header = response.header.nvdm_header;
         let command_nvdm_type = response.response.command_nvdm_type;
         let error_code = response.response.error_code;
 
@@ -310,7 +331,10 @@ pub(crate) fn boot_fmc(
     ) -> Result {
         dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
 
-        let msg = KBox::init(FspMessage::new(fb_layout, &self.fsp_fw, args)?, GFP_KERNEL)?;
+        let msg = KBox::init(
+            FspCotMessage::new(fb_layout, &self.fsp_fw, args)?,
+            GFP_KERNEL,
+        )?;
 
         self.send_sync_fsp(dev, bar, &*msg)?;
 
-- 
2.51.0

