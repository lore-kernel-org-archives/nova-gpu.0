Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769D470130
	for <nova-gpu@lists.linux.dev>; Wed, 22 Jul 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706020; cv=fail; b=Vbmq+LfgA64RmTuX5tdHc4E1j/+8PLaP4EZT4uz+C7IPvobAl0kDT4MgC0+UbaN5pljDcbqbeOz9xRB3pbhrxQ1hAhtAP9YgBfUvh/Wgy6vQNP6lun24uQW1X/OTPFWrs5INDomdPwhr8xCr0+iPZBQVN6OAuvi+rcUBdQZsrfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706020; c=relaxed/simple;
	bh=C1drvNtyLS9h7JbHdYjUxXbDmelUr9xewzt6jqqIQI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syVA8Tu3rCgcw75iolk3xCMZ4979AwGi5/ZmfmgPriuQKrl8/1HIQ17dLlVFBeeEw1k89FJeof08LWh6lw8UDOWM3NCBTdCCaahlO+K0HwK14g/zqhT9YLAnLmha6g4/lgOAVrMaOYQQIr4l9pBpGmw8kC/erL8lMUnRXWhVZkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DIhjAeyr; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DIhjAeyr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd23l4jxQds1ggniQsI9CuBXuZJ9N05RNb53/Lw+iABznYaCz1RUHGrlV0fWUNjKtFfEdy7znW12gg2EXu5wBXl8lvqC4/ifvpZRFssp0T7vZlqUYuCPrIFs+5sOhgCE6tVnInL/0272Zk5Tgr1Kvg94AIFlYBxjGEcFTbTi2oHfx2EHn779xFbn5K+cV5/qQm7Dh5b6XAYcZzuWKZbjcpG+wkUVQLUpR5YnhW+vzfu61GMGiw+61ARvI+gfQor5daz7xe5ev4JyyGDhwf9kG3hRz/byQP1MQiDs6dQ8jijbrKrC0Iw4HWPGhO395Ke0U5aTkPH7Q2qO65USNhJQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV7F217Xp8oXWwf76BEwETjDc4OENvYuOBY3OP6+OTY=;
 b=i3r4wrh90btrWHnkDUfoXvZ82ciauGZe4IMcvZDKCpjNUPJuLhJNOrEMnTHGOr+UKFOSgNIPJL2UoYGo09RD0J1vTNSvco3CXRttfQFuWHUVrf/+irhuHceFsQaHKE+FO+1FiOU5gfJSW2tIV1jhLb+P+yzJDHbPXHIhe/t49RqH5RuKiwhHzC/Im242zd8Gq18vZybhK/mAV/zTVVjLjrNGTEcV7Un+aCMMomH0xaO0ziZ0Nh3pWMHqs54Yvzep/Q3y3FtCRHvpeUXx7c1k22l9ARF9fvD9EszWLHOt86+G7YEe34ZbaNyLqiL+HoUhnNRvcoGY+ChSSwvI8PAIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV7F217Xp8oXWwf76BEwETjDc4OENvYuOBY3OP6+OTY=;
 b=DIhjAeyrFZ2UOGm7RFV8jDExBG6BmaLd1uNUshLpIyhj/0BUzofmzMv03W0fCc0bfdsTm5Mes6zQUvFygHfQcy1jP+lhdAjOWwT5mHO9IgZdjAvK8op0R90WA9B0e/rPsQFXkQHmT1JRZu35eA945CaF7oOy1FOR0VlxfPCLlt7oXe8ZA2vbDxrVYjxOWQDoR3QEvk67mhydiaJesbz/cv9J16b61CrGkRaksSfDVI6z2MEo8fubngHkXZTT3+orVpS6th1Y7kBPuDgDKmQqLEVqRnkkD4EZDEaAVCpv+PGJIW06PJlLcBDGarcbdA4Z3vP4sQh/nsls12/P1pEI7w==
Received: from SJ0PR05CA0175.namprd05.prod.outlook.com (2603:10b6:a03:339::30)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:40:13 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::9) by SJ0PR05CA0175.outlook.office365.com
 (2603:10b6:a03:339::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:40:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 00:40:03 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 00:40:02 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 22
 Jul 2026 00:39:55 -0700
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
Subject: [PATCH v5 5/6] gpu: nova-core: set RMSetSriovMode for vGPU
Date: Wed, 22 Jul 2026 10:39:12 +0300
Message-ID: <20260722073913.1807677-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 75651c3c-cfbe-4523-f6d3-08dee7c4778a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Y1zh00XcXFh6jbaTO7WzZKkSov4HrMyEAsdPwSMkMyVFfs/TwsPvK815LHteBtGZfSvCacMWDcI25WEoGBvssOz5LlmzF9IEfsUh/Wk8uPw5eVPToS+GcbbMHUH/OXAcqA9gL/v8+Q2mV0VCYKOBmVwii/H168/8rf+yZDWXZ6dW/A0KKk9tUYHmHloATuk7cwGRdYo91x8N8CiTjyYV203M7wtCYWAJICfuvvnssuzLj+jQO9yhHCIO6XUaS2EY5CHeo24d8R3heJ7du04abHuKsSFBay55UAdQ1Yv2iquUulInSNSW1/ymgYrCM9j8SjN2haEo2HZbLGIcwj3uigUkFMcEREUpAS7my6ydtu6tA5d79phO8H5pBcuyo83nGOBOBUjc531psmbCMlxVls0GgVIJdfm8SHtgmo+53zDoV70nmdKv8hZfPCxjEJ3cNc4TPpxM8mvS/5BJHjC8eLTe9W/rm5IFbv2d+uhOY2S5mnMMh1d+i0Fe5XsUlxmyhKgtN1I+Sa44Qb5B0U1pVy5K7Tp5lqwzxVTJ1CI5DeRQ48uLGHC/nptJFPoUh4gJlcU2y+eJvMt8Dg4ojYvqWst4BZmHot8PE66H/Ul6atbEotWq9Hyt/BAJrfE45Adn/xEicEdnWWmoMu3yJem84ixFpXkk0JRVFl5NpczVd39YoHV91A5hVij70nx1UQfKurM4uGhNzk30Ze5xTfmN+Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PMdNslMeR2bCEzeL35nf+UcP3GqoF7z3eEMNEDbUj1pcJE2ao3Y9vAck1PCuoFfevyiRSsvhRl8+/hH+pznug0akaHahfr1UYZE6vnJqSI+3ktDDHFqVEQckWwOyy7INQhscOO4xRDWr3uzCDMteVRL+lTekqdEav2ikAd6XaUY+Dhe/4z6/ruBxzxBRoErkPT4r8CPzrcF2NGi8WIEbruAtKstZGcTf3rFahupAtrdo9dj4TR+++VymwsoZ50mvCcMQPyXKAFF776iQWKsEAbTh0CAqNjDECtRV7ct/2YJCnTS51OctVqGmi1ahGOjMg1v2YwOEqa1MjWyKD5tr3opXOw/ycyDY1qt++iUlb+dj7pWjs3o53O4JuGTatiBckLraYVHhbYqQh/sT15tNwEjkax5uoxo32LDyBjwi8Ed9nKcdcYqG9euuxdB0MD3n
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:40:13.7936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75651c3c-cfbe-4523-f6d3-08dee7c4778a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383

The GSP registry setup needs to advertise SR-IOV mode when nova-core boots
GSP for an enabled vGPU configuration. Without the registry entry, GSP-RM
is not told to initialize in the mode required by NVIDIA vGPU.

Append RMSetSriovMode to the SetRegistry command when the vGPU state
detected before GSP boot is enabled. Keep the existing registry entries
unchanged for non-vGPU boots.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs          |  1 -
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 14 +++++++++++++-
 drivers/gpu/nova-core/vgpu.rs         |  1 -
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 0480881d437f..70123dc54981 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -70,7 +70,6 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
-    #[expect(dead_code)]
     pub(crate) vgpu: &'ctx VgpuManager,
 }
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6b7d00205000..a2e8342e7760 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -89,7 +89,7 @@ pub(crate) fn boot(
         self.cmdq
             .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
+            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
 
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 08380de39048..134f34b19174 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -34,6 +34,7 @@
         },
     },
     sbuffer::SBufferIter,
+    vgpu::VgpuState, //
 };
 
 /// The `GspSetSystemInfo` command.
@@ -72,7 +73,7 @@ pub(crate) struct SetRegistry {
 
 impl SetRegistry {
     /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new() -> Result<Self> {
+    pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
         let mut entries = KVec::new();
 
         // RMSecBusResetEnable - enables PCI secondary bus reset
@@ -104,6 +105,17 @@ pub(crate) fn new() -> Result<Self> {
             GFP_KERNEL,
         )?;
 
+        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
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
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 71fd0fe879c2..5359847e2eb9 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -86,7 +86,6 @@ fn detect_state(
     }
 
     /// Returns the detected vGPU state for this boot.
-    #[expect(dead_code)]
     pub(crate) fn state(&self) -> VgpuState {
         self.state
     }
-- 
2.53.0

