Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69953AE6E4
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887303; cv=fail; b=aBTxCF+L9egcqzKpKNDuQAWBAo1+yeXSnZotQcNg/rmhBDFHbkfk2PWACIE5nqVcReUTL7TnVulqg+8vSAbpEryk9rhA9/PHYZwpgHX7jwM1Y3Nyq/+5S7LOOdv3H4AbnKNlKVvuGCp8RBtueUJw8B0CfCxIArVGmwl8M+qKRJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887303; c=relaxed/simple;
	bh=K7NFk1C5DmNZRhTwXZy8DIjSb9h6rU54n5UzJfsSxu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BCkFs88y8PhHUJaUrHu+rThHtxA9oE6EelJNmnPhbHVqMwXfGxcYgrZFR6WVCE8bisw6k6kCg26Z/9dNwRhF7pg/x/Mg/jTZ9PXZ3wPXatPk25/fIqMxjUpV/fnNXPXwUiWraokpXTBlRmXAE64oz0cCuoEfi+Oh5Bx+4/Lbnb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rKb8knZp; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rKb8knZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdB/4BaQqh2PtAd5DRWaQWcgU8ggxI82TOOepjdzlstK6meZt+4iMQOcAhvMkXJGsCq182KzkQ9jh1D21YnECGvhWrIZy0RPlMFTO7x5so1MaPlJbLy6e8QPfYdOoyF8cZ4VIiCrqyFs/Puy1MRDkrCOGdBgzwd8dmUUjlbtw05XeVz6U0B1piLWOr0XZO7M+4umSt3YumyALJVs0r7ViDcdNLKwlZ8sYpRIqc/01xokG5wVGg+cZbZi170IN+G+a/guQm+lAi2KQJW4BkXuzT0ImRoeEIY0M1dayAehws3VPj+8PNGHWe5NKF/DSueo8SfvAhu1hbMNdxb48GHrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3AHOoCJTZKRJ6MEOwCGrsbuLus5u2dh4f+4SgYqf28=;
 b=ZyOu/KeiA8dxyaD83umT5CHVnYGGVjWRA6zdZTGHsU4fBoJwk5scaFJ5aJDknmCaZSrgCsiqke+DfLb84ph32Gly+C2hG8is1Lw+ZxBv+p4UhV3BxjM+jAzn/mUmzt1uU9tSj3zFS8WBeZPzSdtkaVyHv1lK6W9g/OnW9u4ZJC7GTr4VV0wPSUg88NYsplZIYGbNdcsihABDQhoVpXB/jlyqcJwYHbyk3dRooEPLtNL8R3AC+e3cyLHmxNi9ICXPxZ9ULnzO6Q4cwB39pe6F9X3e41sXeMkLqxLZfmNjaSN6SEnzA31zs/vKZcZZ/iyAiOhPyPM4PcT3t54OZCjwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3AHOoCJTZKRJ6MEOwCGrsbuLus5u2dh4f+4SgYqf28=;
 b=rKb8knZpjpgnbcl+9IjOBZzMLB4JqTRag8y5KSrTFqX0IQ6oHh795cF6L7NYyorJA5zkk/c2AR3rPe5AwDakvH5uACcGBPc7oI/5pTIS46oY4Z5Gc56mzC9VtTre6F49Zl+V/EBg3kSrKLTFZemSZrYwUxzNMOxuCYNcwjX0CsPqgw8UnLIsuqWvW2uMB7o94z+J2xleFpws3D7EWtkoY1A6Ecv0dBJLCj00E/52jmmFAUGeJiX4iN/m66CBsm+ZMDIdeADUm1e4mO1cpq0fIOsCponMsnTuphsIdiaQjoj9bKJh4ZUk2OWJrKOQaMXumWpN0nWOe+VAIx7r1s2pCw==
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:28:16 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::3b) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:28:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:52 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:51 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:42 -0700
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
Subject: [PATCH v3 7/8] gpu: nova-core: set RMSetSriovMode for vGPU
Date: Wed, 1 Jul 2026 09:26:21 +0300
Message-ID: <20260701062622.3499033-8-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c01f45-31cb-4adf-de75-08ded739ef4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|18002099003|56012099006|11063799006|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pXP8Bt+nz9e0qT+kojb0vrHIU8C+atpMQGwgf8fQiGGkzFJsKvXkHxq7MktE2BL2RfBn4EonLqxjC9LPeVlfbfJtdjker9DKw1n5m8wv8vdCoBp5csWh7i9FyAdS/HA0pYbUAw3lomAII37Ffsr6zGMmvyd58PF04JCxWfV9fLVonhUpHNYpEfNc7ShM1klcmmSTAmEOcjdWrnn+BWKfoF+5O7DT5aC1B6MKmRchhAwz4a4e8XlsOQv//2RNY6oAKx97MyMm/IM0jPRmxjfdkGd1yaz0rOSQ1qC+HikXxACLeN8QV219EpDiWJl1rolN7kbVxmXQwFNZ22r+i+uH16CEUVDUktWxGg03SGPneTUgWUVtuccU8MisgCydMtKYeQD3ZronVe3i8lfwekNzFa6DsbCQwCQ8BlJd++IN1y6JF3Cd3kNdTEiAzGTZvTNdVrl52SVDrTrC2jaWVGGHOZ9ihqtbAkVIKUV7MdhVYlY2qxyEGZ291ztWx0t6YTfx7hjk/qVPw0JwVYBPrpdSHH67DhXnkIXjJT7R/M1jh9OKzPd8LDDz7lS4/tFXDUEbD94wi1lc1RMsDGx5Uuf8+LRnrhN2Iyn4mdi5997KBlACTjktxjr2TG6FMO5G0wf1a/XbDuhOj3SYQUJbFmwdjPVPNeF7N1YtwhLyAbNLQ3aBcz/MH3ViepI+KM1SCPFNYwbMCrlCfGnhHnXyVNDXGQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(18002099003)(56012099006)(11063799006)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gn++o7bWxFojZFR7jwAqN/6HLebe3Vj/x6utbWi7z7UG8KMsNKl3pt+n0r49K4GqPoqISDtp3GLbdiznmKSdP8At3x8gSzruyknrD5K7GR7OhLGa5xBuebCBtZylaMLTfSVDB1NuCSkgujZYDUm529CrDdfMiRcqahGdQ5e7lraX9rQMTqb4GQlEeNt6PEGq4KbQr074Fs/WESEEyZXC2vQ7FO8iYybhMUEI0r6NEiT4arwaDOAIIm8iHEc2wIf9vtjeyMkcStdY+B6D1Iabnn3rHkXXtOWW17bj2HPeewRl2yhgdCNYM+wNbSSbajWMz/Znd+lEk+K7xRUgfHaeUBHaalDODr5AU+9+In5c440c41kD9XOmLBpF8Q/9x5pSS1KFcj5EQ0GSQ6x3sIipq8xlKOyGHGtiIL5IIYoGMWoneMABU7G0hnRr92n6vhsg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:28:15.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c01f45-31cb-4adf-de75-08ded739ef4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

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
 drivers/gpu/nova-core/gsp/commands.rs | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 139cedacffd2..c0513ab7f4c1 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -102,7 +102,7 @@ pub(crate) fn boot(
         self.cmdq
             .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
+            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
 
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index dfb9f04e284d..07712957a5a9 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -34,6 +34,7 @@
         },
     },
     sbuffer::SBufferIter,
+    vgpu::VgpuState, //
 };
 
 /// The `GspSetSystemInfo` command.
@@ -73,8 +74,8 @@ pub(crate) struct SetRegistry {
 impl SetRegistry {
     // For now we hard-code the registry entries. Future work will allow others to
     // be added as module parameters.
-    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new() -> Result<Self> {
+    /// Creates a new `SetRegistry` command.
+    pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
         let mut entries = KVec::new();
 
         // RMSecBusResetEnable - enables PCI secondary bus reset
@@ -106,6 +107,17 @@ pub(crate) fn new() -> Result<Self> {
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

