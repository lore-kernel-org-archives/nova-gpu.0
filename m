Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D01F09A8
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157558; cv=fail; b=BTkNRK8rFYHKNHYGFIHAoV7KzvUc+P1wC3TWpQgaaVqylmNyhRrR3LhvHwkIuXXA5zqd2bHaTxOddFjPNCtVCBUesjy3lB4R7u6yelX+RKmhkV52NBoEqSIB5OuAjb0HkUHEuu9IvGu+GKLqG56fVSlfVudzgueWvKeV3f6+Lj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157558; c=relaxed/simple;
	bh=B7D3dLaRvXwz7dc8N65+C0iXaRCsiBAVDPp3oygCSUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANySFHJIziujwIZOLR/ko05+txUDQ4h10Lv0cGV0b2W/066lHgb7s3AtkSu7rB/LYMOOG+6Ipiuj66aSXQeFqSnWj6xjRGmu21QA14ElYAqJ9RDgaTDLD42QcMEsh7/geCYgGtzR59fL66z+KNRqs8GNoWAJYccPn5XztEBlVM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X6hlDpYj; arc=fail smtp.client-ip=40.93.198.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X6hlDpYj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRyy3vJ7Xm60kmSL8LyxrvjDSUn+1FiDm2z4moFnCjaG98JLmwHYU+Xi4zpoECj4qYPr7rycK6W0MdR+EmEB2/LCcNwJO1dfJ6tEFjckUAxpQgeDT9PEm+V281S+Sefny53pxFd7iKGjJhus7KtOx9u6In8+FF5TpUYV8yOOl6tzuwIq7ZfeEYUWGgoIJAVFBWvodoxxIkcJWwcatx/v/Qec7PPJ5ypE8+FwxFpnuAzbLI2Gu/4SVh6IteBScy4y/qDLx6EZGt/i3jXzV+OVjIRSuvP6P+9XZjcvr2tkCkjpJ4l6f8K8WZomo08HVBDS3gMbXytl75YbGIxQX5lJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lrawUy2sbVme7NLwz84KC/AHwxxJlAgrnvjX/Y4BBI=;
 b=vBe1t8KEc0mCVzIx6einY/6jNk+GS+pL5mXcIUYje3DqJ1qNZnX9tJ9fdmpf27BAR6Pb2wCzbAKWwoHhAOxEQeAzu+OstQes6FcOAIW7QbFxipOvWJBpVy3Q8q+Sm3dGMKCYI5Hy4t+1rVK7bdkYB0o0BZG7HASI6rcPm8g78PFubb9ae46jzTm4nLBoKTGibdpclhRXq+AZFTn4llmcS24AFMbNNJHDi27zsSlmow3lrLOIzE1sL2k7Mfu9XGg5/sXigiSjvvAQ/iiwqiZ4/BkBpGcuML8Sb9eu6KUccB+ApBuWhilzKQxml8LPFccEVBUSiLYqZ1W3PjmyZjlP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lrawUy2sbVme7NLwz84KC/AHwxxJlAgrnvjX/Y4BBI=;
 b=X6hlDpYjf/j+GstuusrxLpbMNNj64m6+EX4gAVQ7UmvCTqUa7xf1dkTjjH3XtZIMN97ZMD7q3BqqzRbhjLc0Aldqjm96xISKxyJZL8VXqmodtHIhE/qhe+6vhfOBH4WfC0brVUglz6anRVsQciy9zv89nZG5AlVc0ztouKodGZiiwY7ETz7Bi0LMcKyZyhknm1eAwabGKsTh2Vq06MWuUhnbywysbR1Smi41S7eR+VQ+iKhC0Fi0ogN8t79/7LgT8cTAQvOFeRZ6s0WP7SkQkhmQcLuAv+rz2IERc1Z/VlpqAZ16Aefc9T4mNiA/cnxRdMlH0ISOf92z0x0P0GdjUg==
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 19:45:50 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::42) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Mon,
 22 Jun 2026 19:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 19:45:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:25 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:24 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:45:16 -0700
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
Subject: [PATCH v2 6/7] gpu: nova-core: set RMSetSriovMode when vGPU is enabled
Date: Mon, 22 Jun 2026 22:43:52 +0300
Message-ID: <20260622194353.1308872-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260622194353.1308872-1-zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9d5b13-7741-48e5-d891-08ded096dd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	42GL545w4/VCD5vzFLZyAQJ0yK4FxHSiSqQYXwjFNof78kWokWZnLQxiPdBkfaZcPuHakpR+kVWGjmF971T+M3Q+QL2u1sOr/bBSRjbEO5U2dQgklyYNfa98WyE+yfbFta2KffiedxhDkaxvm3VILJlc4VjLhLrVGj24INoUF2oDpHAsSbgxQWVWzmUJsDN0IlUql94ZzFLbv9mguLZhDTzH0DGuktLae8tNp7OrPK9mYh89eZPouza8bANWbtzhQHMEjScvRR6l/R2Vti6fVyCdc0VG4lt+cC32rHRr1hAaxfTYAAnelrmfo5VhYK92KBVvWf8s1HsWpO1av8Id2mCKF0s9QFRFjo73w/V/4g4/v6zdhMeFdRKFAg6yyLI9QTlXzR84aXAf28T06lsfP+lqmz4RCoTtE1wbEzDcqXb0wSabiuN8FdPASY0kgeB6AhL7Ltwi2KMYa7N51yscsD2cAilrY/wPTvuOrhIp/ZMHTatHd0fDnEEDKNIABiIL9V4UPmKFq/+eRCOXv/6RBPCmrTXhGwWSDlvy5nF4JWNbWFx8OCeD7fbJJC8h8kpFbsvTxzSuIYN5BHC4Z6baHYvv6xUnObnoCYDYBpifnwz7m8LbiBQPIMMzXxaziTaBkiSLfb586IJqDvXrgjbNM+KkJgQySmfA2MWdvCpLqhQjh+fWHtpND3EDamsrtW9cIP8la2D5oAuTtTLB83z4aQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T5c3T/4mxM2vBTQU7TCmPX2OpFrAui/UObfosQ+NB25oX+P7t1Z0jKg+tMjUmvnmnMQ3yqduoe1WUdIfYM9nbzVtZTNUv3TPyLAuvQrmiYYvYjEQZPe+6ZsfZaeJyR39rt5hBWeayK9F9U0UoAEWZbfEJQaAJhlpptTgdeqcHng9sLJ4670CZracqOeCBZz/VA0tTXy29k96+6yhupsaTda8I6C7d52LvnQelenCVuTMu1PP2wg7bp7Z+fk4PTPpIxFp33fnKxHAlD5bpYBUT7a6AcZrZFMh39aveECDdt00uXR0oXUWUHU9HdthmDCZF6fKZ3RRKYCCNiL2TVxz2XyWyIOzoe3q5iNv+OOrm4omRYEeH3Lg1wrBgdONPAy/Z1c1iRts7vX/J5uObNk6s33IjB8122lry6ji+I74NM8oFRQ7Gp4PTZ1BiGrw9qDB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:45:50.3312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9d5b13-7741-48e5-d891-08ded096dd07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333

The registry object "RMSetSriovMode" is required to be set when vGPU is
enabled.

Set "RMSetSriovMode" to 1 when nova-core is loading the GSP firmware and
initializing the GSP registry objects, if vGPU is enabled.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 55ea8e38aa79..c607081e8242 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -94,7 +94,7 @@ pub(crate) fn boot(
             self.cmdq
                 .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
             self.cmdq
-                .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
+                .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu)?)?;
 
             hal.post_boot(&self, &mut ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 3dccb012a37e..bf2b569f5578 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -33,6 +33,7 @@
         },
     },
     sbuffer::SBufferIter,
+    vgpu::VgpuManager,
 };
 
 /// The `GspSetSystemInfo` command.
@@ -70,8 +71,8 @@ pub(crate) struct SetRegistry {
 }
 
 impl SetRegistry {
-    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new() -> Result<Self> {
+    /// Creates a new `SetRegistry` command.
+    pub(crate) fn new(vgpu: &VgpuManager) -> Result<Self> {
         let mut entries = KVec::new();
 
         // RMSecBusResetEnable - enables PCI secondary bus reset.
@@ -103,6 +104,17 @@ pub(crate) fn new() -> Result<Self> {
             GFP_KERNEL,
         )?;
 
+        if vgpu.enabled() {
+            // RMSetSriovMode - required when vGPU is enabled.
+            entries.push(
+                RegistryEntry {
+                    key: "RMSetSriovMode",
+                    value: 1,
+                },
+                GFP_KERNEL,
+            )?;
+        }
+
         Ok(Self { entries })
     }
 }
-- 
2.51.0

