Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128363612F3
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887265; cv=fail; b=tjuunpq8U6qXbmy2gPQfWzP5hLkSIHH59KJrDR8/faPWnAIPaCDUTPQfMxgF0HlC1mphFVG2m3o+Ir4J5yRgTr8VbH31fNzVjKabW8VskU9FUHPc9c8HUh79ntkej4L1FDQmXIBLG60o1Ia9aImIzieNMAgYUF4ESzWm+Ol0kJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887265; c=relaxed/simple;
	bh=eLuXwZFJnFzBKaw7dgiihZbnmr8vGgrKDZuNxO8bbIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PojKeQtLd4bm1JdyFc0ZH5OYXEEaJgppj8OZI7LYL2BpJJ4EIrgzBy4tKs3+YfrDODkEF/SOC7GCUy7lh7GQ5izFDfRKJddC8K7vBvC0Pp/p0i9bpzZhexGCX5gOXd3ArGtdSEtDbBbo4bZhKZHq/NwsUJPLBEWlGuSfGctSLPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T0SHPB3Q; arc=fail smtp.client-ip=40.93.194.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T0SHPB3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFo/bQZePYi8sEB4ur4FUs1c+eFh1c5cGknHYjTRBpFl8xfp6XZl2OnQETYc9Brf5tg3drGorqQO0aTX2UXqp4JpOMDEDChqmiE+3J8iFA72h/IDtbZkZYLdvQjkwPeVKoyx7eE5ibo1x1DLAjRi1JCr2WVC61W0qYiW2TEYy2T+ADXhnHVADwjkTOBs3kEC9wIleS5ysQkskHoMUrJIhBJem0ko4FvhM1wfWMHhTCEI87+NxdAjnfIYXoogW89T80wQdM841RdWiag9mJ6onYUpSek+uCmKwzPWm7OerSk7o4hBdbCBRNQiBtkxLqHO6XAyBIUPXlpa90UfUTcxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y258TkIk/px93mvbBHMi5fyDVghRyMBCuQ5RVECcBrQ=;
 b=s+RBTEN5kPxm/MpwHvGb9YCXNpMosY+95/sREcZx0iRlbEGZwZ0CoGPPL6emEdzZ3k1gh/1Jhp2GPZCO1be3jkGVLBJTbaO3IEobFGaVywug5t0xGqiy5hYMfd9PBgAOrLBDHEeh3gwbLdjvQndHYEEGrIi77aTuq5HiGtG/PB7zqlao1BakqlFgqaNA7UyZ+TUMeetJAIaJSIrnYmVSfLtTMeKX4dU1Ege496SSb/14lBTZnfISWlLT/yf+F1CD9itzeCNlSb+pxzy5rUSULKuK8LOgD6iMwWRToGbnd//GXK/USMBrieGJ0Sv7g6zOnSReAXpdPlmm1is6GLbSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y258TkIk/px93mvbBHMi5fyDVghRyMBCuQ5RVECcBrQ=;
 b=T0SHPB3Q34iNwFV8An3eB+gPAmsSWAYOImYfw3EIPgzsDQonQX+sdh4B1TPX4CfDpN9P7lbgiQDfFPS/58Zxhet+qZcMEWtQpzWAt6CPtsCH/jYC6OngWpCcx0cXAuYcUkJ3G1sglxSK/C+OemgBg5GWnvowV4dPZZ0lSkKNQonVCwVojQTZ+uNPOdWKCBeEUh/uvaX3QUY0v2v//c1sXrPBAW36TZal2Fpd5YIFkHwp0Dg8Cn6K0WhhIWj70XSG+AjRjMi/KYkGmc9tAD9EDm8D2VL1qIHI2QbcbgBVa3FCMmtj0W05EkaQVem8aXHo68L1O1ALRbZa1XolEBW9kQ==
Received: from MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::25)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 1 Jul
 2026 06:27:37 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::3c) by MW4P222CA0020.outlook.office365.com
 (2603:10b6:303:114::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:27:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:13 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:10 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:01 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v3 3/8] gpu: nova-core: fsp: rename FSP response header type
Date: Wed, 1 Jul 2026 09:26:17 +0300
Message-ID: <20260701062622.3499033-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701062622.3499033-1-zhiw@nvidia.com>
References: <20260701062622.3499033-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0b749e-bd49-4a0b-efb6-08ded739d7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|56012099006|11063799006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	iEkX74RCFsX63aqe1ilBAaoKAiNRZBZkTWP5+yjM2vMm/H8puTMnSSXpcY/xS7oJWTcIOubTG0Gup0lqM9DDnj3kph3X2GidovXvIKz4Uu6k+ao6FIQ+W/L2fbkbvIbABMG6n0GB01fnmDPrJ4n+UCB/1g+eb4wuSN4vrWJ2+OToXE3aMeFX7ph2qCJzA+iA6/BEoz3BAkxCW38tNG3geb0U9jfkBBnu91m9Kfa8spF8oOfbwAAAtwWvcpvNBstCYhqZqBHLkkM26sBFwvG9CjTMNUWouc5FQBhfhRYmCs75UkLUuuSI0FVp6f7/X8tHRkOruywUlWlu9+NvIFyoowifKvpmjBhE49b7VXNaanAbI6T0dLk2xY7LQ1edOaNGDik4wuvQVwFtD72/ODF62dycvBhihWCVFkYgw+rwOhIkf5rd8OVjEJ5jceU8jr8lwwv73nnjyPNVtCi0P7VRSA6hj10VF938ZneZg18WfYb+HJBvWvDscjmT4//ND5wEAP6U+WYeoM/RIOicgEgqUd735EIBDeMm6KsA7JA88iCaHPzQALl4I/jyd0wBf6Y6C23DMQywDrOQtj9Oom2CIEYm84sntUTawfKqrpVR47GuLyCvORyYRZylQiQwOvQs38di76TbZ7jF8sB5xdhGfFUHSGSTWOEI4NNDYN3152oy+hlP73p1kXSPb+yvxVgz4PJah03gL7YQ+lmrhjdRgQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x207GPpxRoo2Qe90lXERrSA68GcSD3CUUKm+qinXVUyVBW4l2sE6zEGdjGdiHDcVYfAaxXsjb4EGAqQvAcoiW0edUhSsQFsf2NkEbOUot60hQz3L6Hw5jjLogLaMgm40y6mLTkQib9g6aodubTxfLaalU4ZtUPUw1MjJvUCnRQwcc1ZswjMCdamd0NqiQo56uasxdXdjwl9zUk/RWwpvyqZfr3xlXagPiIc2NyIA1gui6NpL6BDH1VIR7DLGHqu+hiTPgLlMzQ7DCx7mbI/QXry+4LeUCglxYJCEpJ25gE4lU+whz+Vpu9eLyYmRe5Oxv1MS6MGB9EAc/kOxZZVRH8mYTH0IcxHfCbPz/Cqa91datC/LWgIDzFYoyPft4ukRGfZoVae3X6XW7KzdpQTikoR9iy8uTMNQemBzxcsRK8XHkcNCsnPsJShw9ZmKN2iZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:27:36.7160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0b749e-bd49-4a0b-efb6-08ded739d7f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396

FSP message handling currently uses FspResponse for the common response
prefix containing the MCTP header, NVDM header and command response
payload.

That name is too broad once other FSP response formats reuse the same
prefix and append protocol-specific payloads. Rename it to
FspResponseHeader so subsequent response structures can embed the common
header without overloading the meaning of FspResponse.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Link: https://lore.kernel.org/all/DJMBI9CN2Z67.2T02SR8TAWEC5@nvidia.com/
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 574e1627e63c..a555c5290baa 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -84,16 +84,16 @@ fn new(nvdm_type: NvdmType) -> Self {
     }
 }
 
-/// Complete FSP response structure with MCTP and NVDM headers.
+/// Common FSP response header with MCTP, NVDM and command response payloads.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-struct FspResponse {
+struct FspResponseHeader {
     header: FspMessageHeader,
     response: NvdmPayloadCommandResponse,
 }
 
-// SAFETY: FspResponse is a packed C struct with only integral fields.
-unsafe impl FromBytes for FspResponse {}
+// SAFETY: FspResponseHeader is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponseHeader {}
 
 /// Trait implemented by types representing a message to send to FSP.
 ///
@@ -272,10 +272,11 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
             dev_err!(dev, "FSP response error: {:?}\n", e);
         })?;
 
-        let (response, _) = FspResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
-            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
-            EIO
-        })?;
+        let (response, _) =
+            FspResponseHeader::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+                dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+                EIO
+            })?;
 
         let mctp_header = response.header.mctp_header;
         let nvdm_header = response.header.nvdm_header;
-- 
2.51.0

