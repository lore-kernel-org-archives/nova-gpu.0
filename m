Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648035CBCB
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609412; cv=fail; b=D6pyfJdAjc9lX15CA5m3TQq4aHI2LpvlwOVeMfrTTjQxhiJB6rUJDa2lZwEg1Wbux+/pFOuDh6C20Ijg4aYmG/nmYCMRJwJXt7LoFWByOl3gMH28p8cvb1i+yw3kU3QvHa6Slk99YqjgZN2uYRY3zVH8Z2leHJJStBCJ/f24SoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609412; c=relaxed/simple;
	bh=nhnEit6eY8q7yPKo5GptzNG1/vN26LV7+oSLNnwbbnI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtZYkmpbHH8Oju8sDOmvIs7SxkUhEhtKD+qlRytrUORJ7i8pCQS7uMAtRc7+RqSQHE0NL0xBdIDMMDdpdCNY4vpNGDAVN7MEFKdNEB0TUiQ+KtXFSWVEq1pNufd2lfA/pGQp/KleEp46QU4g3s/LpJDBHjZYqed986V52odNn7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t6gzPwLE; arc=fail smtp.client-ip=52.101.48.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t6gzPwLE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKBRsQvvNUl0Bosnd88lfjHpFLyqAeyG/EOJSY1b+ksWVcAlM1sQHWnSC0VR90WgL7ZMlEEMIpoGMFzSkjZVKgPx32b6fm6U/IVCMriI/tLhg45QSWnah2JGi+/GMwGU1IeJULVjs1w1l6x/YyX3UV3gUkCSQhd2cJ85p9QGnqlubrv3oh/slJFXnAr7B+eXxUv1HZEigz3yYN7jZSjgoXsbNB9twHWtyxw5UxKw5m6h2Z+xZIfIddLoBTJzQh1HoJFVzsQ/ZIBBERAuYjICAkxCrFdGglMWx+QC3JF9ysoGWGImGKM57QyqnmmW0JBEMcSUoa9NEHMt6SpGxEr0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSLTQNDjQW0f1FhbAszd1FC3KX3ZoYfptElIr0ApUcw=;
 b=mbMAFDwHld/K213ai3fT+QY/sVIx2NLn4f/n/iaVH6gtnAo7jBScR+r2snsQE/p9Spa0ab6O5/rcULa16qniEhkreOvuKRl9eG3K9z5QC2GIDt8X1MWO1opybqPfVnQBcyL6OBQgVE67xUtHwNcik4B38Ng+7QUMDzel8MejPaeAyAQQI4CkeYTyXvKLuWzUx9hroSfClk4+s46fMXN3j5oPvlghj32HiIPyRQwGzg26ymf+oObRiyQy9z2LmXksIl9u0CMaS1+U90qExCprXMpqzRdqpQexGClLBWY++z4RL5PtSRPWsVeVpfe2oTYe1pmrfjFoj0jBiQ2C2UdeEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSLTQNDjQW0f1FhbAszd1FC3KX3ZoYfptElIr0ApUcw=;
 b=t6gzPwLEnsOFK1RsS5fpnhmzumH91LmaXoRGkMjC+h+K0TjsgWONEBizP5Xkzv7ugntUdmxXHk3vdWL+ZSNZFfBIkzAcldNJQCpQfHwRBbq8RWQVDAQAblopi3iHlLpQHqSeDnWA7PyxgEO+SuuXiSZA5IGYs+XtSJCY7B25o9+W3WC06aktIGh9wCrzFiV0Kqc/1xbfSPvtqhylBc8O/bQjoEANBYjBT1gKgMGjuVOsNgWrIhi5geA4e6mAU3WE5/JwRSLaIB5eWRKzwEoLOtc/QE8O3Lb2sGgBiAImx4ZCksCbJ8buxycOgtOSk+FwIzYStfbfKJ3dUDtBF6aYNA==
Received: from PH8PR22CA0019.namprd22.prod.outlook.com (2603:10b6:510:2d1::28)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 15:03:23 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::12) by PH8PR22CA0019.outlook.office365.com
 (2603:10b6:510:2d1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 15:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 15:03:22 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:52 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:52 -0700
Received: from inno-dell.vdiclient.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 08:02:45 -0700
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
Subject: [PATCH v4 5/6] gpu: nova-core: set RMSetSriovMode for vGPU
Date: Thu, 9 Jul 2026 18:02:05 +0300
Message-ID: <20260709150206.1046839-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260709150206.1046839-1-zhiw@nvidia.com>
References: <20260709150206.1046839-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9208b3-69ac-48c7-8460-08deddcb387f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Im9I6e22B/Uqsb3SD4zhKFficxBluPm1btzzYgWmpmCTeSOvtNYY1FvgndzoxTbg1ETZsr+rkVX9Xyh5oBi5hDKcedzqfMbbD5w81ByLU+UCEFlY84uWgavoEW+/iAsATN1M3zehnmzRye3IR5QOM8A0UzVqTQHHxqbZ99ZIeVIaWAJKkZXhdQlZ0va0xmB0ant0CKkVOWvICv7kfEtiq+6IM8TE63239al1v1VKnZHg1FthfEgImWEg5TGdMkhlp0RyfnpqADf2FN8RG7qf3Jt353rUWL4yM26PoGuyWF4pkyrDJwXQQlP6Z424A+a+tccqIRBbnUYSHHa0YB2IeDMdwNNgBi+q4d1gWFqimoVElL3ABd2sz306QMP6QNL3Z8fklEb6mEkmdzf8TQog9TQ22KRrjiCzjtHG5l0f4gz41eB7zk84Nw/Yc+m5kLq63ZhrvRBgpigPw9WSugvYabtL6IPIuDjrU3xF5fahurVYrt997mbU2wn3haOhbxFdMW/mbdh/btroRHsGIN1qmeRF7/NyqLK7ttV0EUOM6zLNQoYaYtenpOJnu3pclHc8PJPLC45Q0gMXfoG7RrdMK82NrP96MUiKZlm1mgMUQCITDj3tZWFZ+3JB8QjT8RAfW3SVoEq4MYoohP5TAJmT4rlWDPNLuFjSlWEzWTsxlhdG1HLCYB2D5l43bB6rsqRJO7LHNQaX78TLisSfTmv4ZQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uVNpIX0ueypu/a9aq/JVrrlE7VJxB2e3idl1Spvs2In48fUwyAUO/5/2Gxs6cAbw/lzVx6GOJtOl+P6pKp4lWHjmwJco4hsjb9+0v+dCtskMfdiM/go91o8H3RVyXi2DugTHum4r1XcqvWZ47qNewNeYPSWVElZKU10fE2p1xYEiVua9p297/dVwCDG3DUvnkM5UJBwK/oPjDI+UBNZqhK77Bf0fnD0pkWj95Fdint1k7l3nbGFg//jD9LXRfJThngoCUUssSQv95PZ6J/gXATFwWZZNOFL9q7dcEtJGSb0ahmJIORD0Xg8c8+RmuoHSsom2o68faT376GnTrVKd3rE5hFfrKGKJoOHNsLfT2O5d0s3l7qppc/zN3XNNv8TtfkKVyu373twAdy77ZrXLfbekMvT2zoGDoxbZlP/RN5q+rj57vl0oST1ZU0kaztLI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:03:22.7982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9208b3-69ac-48c7-8460-08deddcb387f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773

The GSP registry setup needs to advertise SR-IOV mode when nova-core boots
GSP for an enabled vGPU configuration. Without the registry entry, GSP-RM
is not told to initialize in the mode required by NVIDIA vGPU.

Append RMSetSriovMode to the SetRegistry command when the vGPU state
detected before GSP boot is enabled. Keep the existing registry entries
unchanged for non-vGPU boots.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

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
-- 
2.51.0

