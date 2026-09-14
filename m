Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43DA3E5A0B
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372223; cv=fail; b=U6SKBFnftsU0BTaciviqFWtJHponzxpqPSo39EyuH41ZJuSRDEKyY4iElfEmssiFFsoxyJxw6yWHslz8bQtgzqttDYx7uTVImWsWOJa9bhSX/5COKUm7dmbMnZWnlOnjjEKPEK44aqrnZYuTxUrsX/OOHumZwi/wr5f94Wp+pGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372223; c=relaxed/simple;
	bh=g7lCmH7zU8M6yMQjV5KeLvXdvuZojL6m16AbnCnRpO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qoQVOJ5zN7bPgAmvmC4z6VZMrqesdpXfOy9weeK0GNHGE+Ptw00VgAepYBtQg/BezmbokER3YHbdtuhZp8IMqX2usjC+IxEuv4eXJ5J5zkKqdq57UMLV808tRGVCbXUw9UvGg/eGLHeD/rpu0zC3UaVX06ix7adCyqw9+BdVvj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WPwwt+Ir; arc=fail smtp.client-ip=52.101.62.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WPwwt+Ir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPhu0zUOElA/d5/O3IDpS1fY6YryslUjpzYw+5eT9TnRKKd2rgls4lCGYy83DQ2uZPARKD5IeRbVXSWNGo7KjQaZE7Z78QMTf0cthufu3xdcRLl7JwEtrDeA34UPQvcIiXDl4JvFVgw+uL0kqELDpHh5fvBlBKEW98n+JugaS8JFASoF8qBunxC1duIluhUFy0eGchk+5Ce/RQdL+I6WR3e56C3LJTF/7FaG4hD+xqqEianpVCSULiHLYaOlCQpEFStRJSmXfe7z1MqivXdR8lmSfwV2zhwWv9dVPtT5feKoPV3R+jD992+XSNx9+e2DR9bu/ql6o2ba4Bo51oUnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEyhZsGiQZKzjjwO0RUuNmO4S2dtDuwkJgyzn6/BcSw=;
 b=gkJBNX/MhnGU5OvhwecNz0/7xnP+2Uc4bosIngRfGo3ze/eAKe5D0MPJ0EtMPI8BxvVJEOFsxksFVlSnAhBup0wWGw/+IKNUkaIJ14JZEgSagzHAtvfNO7M/C+wSATu3ZUrXB1bnDKu+Zga8vOCy7QEr2b70edBeI4S450geZ6CCAyb5yZwt/IEoV4Kosn3tcMPP1zbtXXACZ9bEbeBADji828mrUfyaPwlUE7M/XAoVyC3Gr9AcSdrg16hKW/ymh8iKi7FdFX28ku+HNFuUija9351vEJ0optN/2vt3n9ndbemr/8Qtzyujg8KCHXiI+Chn5yh77ixwdsknJdLU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEyhZsGiQZKzjjwO0RUuNmO4S2dtDuwkJgyzn6/BcSw=;
 b=WPwwt+IrwZ+pf6CSCzovFrPk6leESO+lDEBRR74BlCXxwB4rCwX3fcal7LwBt0rCx1XS4Vads4Von0hzHPNRQR5BEVxQYIiCpNttbVtCy4Vbsd+vU8xtu92/LP2GO/atjZVIV8Hn5LkK32NI974O9OaHgLS7uTBUNqc7e4ujDTfAWeEH0/48/oD/g7Hy+y/CA09gc6hm2G46WU9w4ypi+1sliXCqtdelCOjmfi7eONV8b9MsfW5qMpuNdQr+Qrs/+wBBIm30irmBDpn+00bZ4/6KCauR3PY8REo9rJag6NQ0BrMhSyVub59zfpo6gBDHsY3Jljk4cf1RT8H4xCJ2ZQ==
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by CHBPR12MB463627.namprd12.prod.outlook.com (2603:10b6:610:36c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:50:16 +0000
Received: from BN2PEPF0000A892.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::48) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A892.mail.protection.outlook.com (10.167.248.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:50:02 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:02 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:54 -0700
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
Subject: [PATCH v2 05/32] gpu: nova-core: gsp: expose the VMMU segment size
Date: Mon, 14 Sep 2026 10:48:40 +0300
Message-ID: <20260914074907.1399629-6-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A892:EE_|CHBPR12MB463627:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e7a302-245d-4c71-5444-08df1234d0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|7416014|376014|11063799006|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	haxqF1v8rD6N1S1O5vu7ZOcfBahFx1XZG+h9Vpddam1dnXX8gFqnUoPpexxux5wcvMRBUuSoag+pdwr5Os0C+tR/7GmnHoG3Osv3adOsvkW2b32hVWQRyxAXbpLW8jiKgqgks1mVYxK4uUvoN6LluzWi2OXN2JKQT69NRzHMnhrAqgXyj4jJQHdAmlDgqmoiPdbO7jtoZBlg8G4XV7UbtwBtgerbYbwGCrmL9rvoGLI0e5CmOvdkBlgMHa6LJyNpAweeb9ZepyGF/zcxJDTeeJ2G9LiS7rpcXZKz/egbjwOK99atfemhtzIV9zt+mgCHiA/i0axLczfQLLCvSm88uF2md1NDew5bGQzrMRsqZ6QHjoKPeOHuhB2cSfwIJDgfXyU9kwQmkS9doq/t6mdpjFQUCG4yHlYjjjex/xoXinEk+AR+ZAGAJd9zllUQtbun4ZWEvRp5FPmF9dg5ynvFZnZJdsmSLK0r0sfeuJHUMv8OoZ1w39r4xCoSBH3DC564jqAG0gRCQ4zUQeE0p+CR+h1aJRAnK6hv+hSAjbQCan8RA1d2su+hFbajY4h4cLH0ShZLNAbr0INODFrQKKarZn4hoPrqZeG7E68a5yskzB2zSGbYHPG05dlY5pEUNpqWmSa9hTa9kFgEG6CIybTp2MHthzyj2B6YVVGrDseusd+TRi+iY8Fg24MOT1du3PLOFPmAmMLAz4DYObw+W0pmOg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(7416014)(376014)(11063799006)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	73qUNBBCp3mfioVchwSW9vHBTeGnQnH/AwpEq4HMkK1rIq1MHredzlf5atlsmVD7NuuF1sIgJGGq+OYoTiZ1YVn3Upwj1wbbD5kvHJvJ1wIxHG5yAcXNzpW+aVD28mZ1c03qs7pe/MxqzMJwuZwWwHDnS14ShRCRmJQURUs7fjJ4Ufc6tGuY/YPdsGrtDRW/+iCyt+x1GI6m9V3Pun4kTg5sfjcvRW3A7+B3ICYr4YJkCVMGSUmKyZ3ZmoQw4aDXSj7DnFOLXK+/oK3eBIN18RvZlM6gLq9TC4QSnM8i2rNW3CFp0pZSSW0REbmfCgbA7UCrlYYbphYATv2FDsu/DEslwmU1/v3r8YsTKQLES5bvSyGRzyp2jT8sNcC+/K01hSn/Gq59HWqvLqFDsOfPWTSHxjvjG8Gm/IXGWTusnERhx2fSPF36IkcH56x9qsr0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:15.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e7a302-245d-4c71-5444-08df1234d0c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A892.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB463627

GSP_INIT reports the VMMU segment size needed to align vGPU guest memory
allocations.

Add a getter for the existing decoded value and propagate it into
GetGspStaticInfoReply. Keep zero when firmware omits the optional key.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 4 ++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 09223bc3b793..afc32c2a230e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -53,6 +53,9 @@ pub(crate) struct GetGspStaticInfoReply {
     pub(crate) usable_fb_regions: KVec<Range<u64>>,
     /// Exclusive end of the FB physical address space.
     pub(crate) total_fb_end: u64,
+    /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
+    #[expect(dead_code)]
+    pub(crate) vmmu_segment_size: u64,
 }
 
 /// Error type for [`GetGspStaticInfoReply::gpu_name`].
@@ -276,6 +279,7 @@ fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
         bar1_pde_base: decoded.bar1_pde_base(),
         usable_fb_regions,
         total_fb_end: decoded.total_fb_end().ok_or(EINVAL)?,
+        vmmu_segment_size: decoded.vmmu_segment_size(),
     })
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 2b9f8edb039d..c2e199688b79 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -367,6 +367,11 @@ pub(crate) fn total_fb_end(&self) -> Option<u64> {
             .max()?
             .checked_add(1)
     }
+
+    /// Returns the VMMU segment size in bytes, or zero if GSP-RM omitted it.
+    pub(in crate::gsp) const fn vmmu_segment_size(&self) -> u64 {
+        self.vmmu_segment_size
+    }
 }
 
 nvkv_decode! {
