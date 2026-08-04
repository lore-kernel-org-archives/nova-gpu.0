Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02C47F2CB
	for <nova-gpu@lists.linux.dev>; Tue,  4 Aug 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862934; cv=fail; b=fbMfcH0OSVgJhVAVbi3gcOXj8dNizs6eqgA/CHf3Ojaj8/WUnkdD3eF+mMaEvY1vM0NW1Gixvi3pZ8ZXgxYNEY4P3JVqCXw8P6Z1mrdZz0lbggcVcTktXAXOWdM7u1qfzFIEWKn4bROqqlEcMEeMAIg18JyeB/IKMQzYjAcdTUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862934; c=relaxed/simple;
	bh=KmqBXM374rEwFRDCehOCzZorePFP7m5ai7eH3ZaRkXg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3chmhvlOHTvXbmCyVyPqpvsqSo8HBOk9ZPDY7OzgMeczJGUwhrGs7siybVNSHmAMBQu7atyjFmsQ9JVjET/qFbd8SwO3da/hrTVjRG15LQhsqa+NvXiCSULat3R/3rdww7JxSD8J/3Ea7zyX/kFoZeby9KRPhD0C2sCqGqmlIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UMnkgWd1; arc=fail smtp.client-ip=52.101.57.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UMnkgWd1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeoiHsm11blMajVR2HAk4S3SC2oSg9WguCupRxmvkp050G5ed+EAtHA7Ub9V8fIL3yOB3M77oXMR2lg/WCGYery6uXo/jpSR38Dx2ctiEsaiCCtmcWA25QNnINNvLU8mXvOS3PUujkWh/ub6KtHqJsHhvaXNwSKvo+cBdMUOSJavrGGEYqNkmoELbFmBTmfxG6z9blzCK6HMHuHPOKFOKv/v5yimUuMuTim2a12m45kon0sjl1oAfyeiwRtp5T5xTOy+k4UPoFe6Qt+ehljYnpFY9zIa4B5dhLytJ5YsllEUvyusz4+b1cgcOk4MBhyM8bbsxE5pvORzz7y8yulbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91+KZ/PuEt8mkOw9D8Ru+Ldm+Z2F5FDgEPVqaqc+AY8=;
 b=HPsf552+zGkDd9Lv3beneOVHEuSzi0e0+ozWK/F63hBo2orpk9XkP3QltEjEzK7TG3so5KBFN/H6aUjgkrc7PZrl/Ue2KypDLJS+bf/JU8U3QLfbcOp7AUKLF1RyhrUQ3zjJfE0IcrIl6EKOlqT5wyeliFIS4F0NLbXl+eEvemjvcjpMQ1TuhB6lyBO1Kr4JwsR59cLX53qdxsXpLmX5xPF0XiKfmjctpKdEiqfBV6jsSpTt3JrQaVhVXgJOCAVszflVT8NDjEKa5NLDUJDxQY2wCgJ8xLCNcVz8N55mWqAtBGjH1i8fCJ7Bc6JDkI23I9Ol8S5cS0RPCo/Wzr8pJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91+KZ/PuEt8mkOw9D8Ru+Ldm+Z2F5FDgEPVqaqc+AY8=;
 b=UMnkgWd1/lyrV34Uni5q9RWriAPI9S4ej3r1tBfr7SE7aixBmGbdjVc8iMYcefVN4To50s/fx9H3iszgrDSBYwU9gY/A6dwyd4/SE5GXAZO1XcOcMYIKRltPAHWVWlS1jF3dN/Q2VxLeqsWN7OGIklgmi5IzLiobWMLocIta6bPi+loY9x4SDQBYg7+2bGhknwkuJZmq3O3SrKve8xex4sG5Ij3/sYWRSbZgnIpn2s9E4BuTHTU9dPPyFUlejqAWoKv1d8y3K04aHYYRwgQiavf6OvWMyhVgySqSMtIDxwLMzR/FhU5BNXKkkt5e+TrMHVZQrqUv9/qfNKEFcN+VDg==
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by CH3PR12MB8756.namprd12.prod.outlook.com (2603:10b6:610:17f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 17:01:35 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::8d) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 17:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 17:01:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 10:01:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 10:01:05 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 4 Aug
 2026 10:00:57 -0700
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
Subject: [PATCH v2 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is enabled
Date: Tue, 4 Aug 2026 20:00:45 +0300
Message-ID: <20260804170045.902069-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804170045.902069-1-zhiw@nvidia.com>
References: <20260804170045.902069-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|CH3PR12MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: de0172a6-3681-4bc2-7d93-08def24a0a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|13003099007|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xOBjPhM55XZtYrCr09v/cQ4UyMz966tAgxaev7n3qCDxSWpuy2BMFshQ6bmcFc+PJVve8HVP2uoJedZNKHbNCHPhTuyXg12Zmu0N+pZ545JGodw4bnayrC6eZTviFOcMgfzTXys1qU95eIRYAASbap1Oy6bp1ttvQVfSwFDPc+5jOq0/FtS/hq9+bekxbUi7EhNIAU2JNw1Uzf257nwJlVkEtGArtc55a2geWEDfDNApSVrQOq1/WHwzAVz7GWAy2wDMt96rIvt3bo6HEEhwAWhLy11sGEOSXvctRyBx88dfdPS8xsKSBelITaBMlqV2zQE9q4szl2DvCi2ezm0Neqx2D7iQEdLhfZs4v2/2RRbiyd7N1Wex99GnwJV6H9gm+1iiZceaK3F5/uHvyA2LkZKDG+iBCIme1sIqZ2/EhszvDn0uxfvvF08phDPo44DdAP/GfpBHDOzSWjRQdIZmu7lKYNRc+tcbBPVCDb4qa4xyLa/yUF0dhwwH4No4hggr947UUNlyLKelgDtOsGuB0Ux0w50g8HqnJ/6IZbG3bXYgsE0FDS26C4wqckEFu8genPpjsZj2fBMmusnSfQcXJq9nrhIh/B2sjsr+1/xICXnJWJlcHF5pMe9aZuRKECL35m9jOP471o6PhrEEYEraJwMvzg0yeIpnuBjP0PT1l3R/aa33yYhVjOrLsInC8VeG1lftjeiUbv9psZzqEeuK2w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(13003099007)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uoO8zXhehkx48BdLT/PZv7FBoG6x4WGsY0bNoMu3lZQ2fAGm9wkyq5+b6ffQ2rTCuuwdnys0KmwCHhFux32EL1LQ/lVxZvgmGT5YzRmS6G+yzSyx5N6Kda5JjqeiFi1+1X1fqGA7HsjaRbyQh1dfqSiRfHLDD3hfPew73RXR2fA71UvaCnAtJ5yu0MH1T5RhHQm6R63BhIATg8K6rQSfhVbvSv6lNek7eGQn3oJjCdGb2+tmD+uLf/3XuHvav6q+aid+k+6cEAwOS8OXG22UUNrmkRnMzphsC9e9HZuZllR+rHhxwGqrGheVoLiM/N6aVeMWELBcQaGNj5uZLlWskku96vuTJ3D0MEP4/Nw1xl9SsJORgn5LEQsJrmh7o/MbFtnZX2NCpysA/PutrNrHSPlUAPBdw5Ds74H6czcdTiN9/nz3IAxOEnLNTYEocrxZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:01:34.4609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0172a6-3681-4bc2-7d93-08def24a0a3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8756

GSP firmware requires VF BAR layout information to correctly route
interrupts and doorbell events to individual virtual functions.
Without this data the firmware cannot set up per-VF event routing.

When vGPU mode is enabled, read the VF topology from the typed PCI
SR-IOV extended capability and populate the GSP_VF_INFO embedded in
the GSP_SYSTEM_INFO command. Keep the VF information builder associated
with GspSetSystemInfo since it is only used to construct that command.

Link: https://lore.kernel.org/nova-gpu/20260730181404.776028-2-zhiw@nvidia.com/
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  6 ++--
 drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++--
 drivers/gpu/nova-core/gsp/fw/commands.rs | 37 +++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 727b8ae4bcb7..c086026dc2d8 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -86,8 +86,10 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+        self.cmdq.send_command_no_wait(
+            bar,
+            commands::SetSystemInfo::new(pdev, chipset, ctx.vgpu.state()),
+        )?;
         self.cmdq
             .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index ffc25fd8c47b..11d0c7ec371e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -41,12 +41,21 @@
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
     chipset: Chipset,
+    vgpu_state: VgpuState,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
-        Self { pdev, chipset }
+    pub(crate) fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+        vgpu_state: VgpuState,
+    ) -> Self {
+        Self {
+            pdev,
+            chipset,
+            vgpu_state,
+        }
     }
 }
 
@@ -57,7 +66,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev, self.chipset)
+        Self::Command::init(self.pdev, self.chipset, self.vgpu_state)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 6dc31d1bf5ae..71feda9c1e69 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -16,7 +16,8 @@
 use crate::{
     gpu::Chipset,
     gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
+    num::IntoSafeCast,
+    vgpu::VgpuState, //
 };
 
 use super::bindings;
@@ -29,10 +30,43 @@ pub(crate) struct GspSetSystemInfo {
 static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
 
 impl GspSetSystemInfo {
+    /// Builds the VF topology passed to GSP-RM as part of the system information.
+    fn build_vf_info(
+        dev: &pci::Device<device::Bound>,
+        vgpu_state: VgpuState,
+    ) -> Result<bindings::GSP_VF_INFO> {
+        let VgpuState::Enabled { total_vfs } = vgpu_state else {
+            return Ok(Default::default());
+        };
+
+        let sriov = dev
+            .config_space_extended()?
+            .find_ext_capability::<pci::ExtSriovRegs>()?
+            .ok_or(ENODEV)?;
+
+        let mut vf_bars = sriov.vf_bars()?;
+        let bar0 = vf_bars.next().ok_or(EINVAL)?;
+        let bar1 = vf_bars.next().ok_or(EINVAL)?;
+        let bar2 = vf_bars.next().ok_or(EINVAL)?;
+
+        Ok(bindings::GSP_VF_INFO {
+            totalVFs: u32::from(total_vfs.get()),
+            firstVFOffset: u32::from(kernel::io_read!(sriov, .vf_offset)),
+            FirstVFBar0Address: bar0.address,
+            FirstVFBar1Address: bar1.address,
+            FirstVFBar2Address: bar2.address,
+            b64bitBar0: u8::from(bar0.is_64bit),
+            b64bitBar1: u8::from(bar1.is_64bit),
+            b64bitBar2: u8::from(bar2.is_64bit),
+            ..Zeroable::zeroed()
+        })
+    }
+
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     pub(crate) fn init<'a>(
         dev: &'a pci::Device<device::Bound>,
         chipset: Chipset,
+        vgpu_state: VgpuState,
     ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let pci_config_mirror_range = chipset.pci_config_mirror_range();
@@ -54,6 +88,7 @@ pub(crate) fn init<'a>(
             PCIRevisionID: u32::from(dev.revision_id()),
             bIsPrimary: 0,
             bPreserveVideoMemoryAllocations: 0,
+            gspVFInfo: Self::build_vf_info(dev, vgpu_state)?,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0

