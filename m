Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173A9235358
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157547; cv=fail; b=eUZGqsJO4dyqxtUtQske4znv7MvzkST0KDXgBrKVED9vd8xaK8KPPAKwv+Hg8yS7s3o1IF7PkqxUleYZ/fQaUMGbNT/DM1b1ywwd9wl8ryfhUIh5HcCpJA3ETjLf+iANu/37gqy4P8s+ZpKUnVtn6rIEJIEl/0+0FEtnbHwQkcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157547; c=relaxed/simple;
	bh=Y5i7vda1C7fr65F5UrVTS/8FA9BU5sDfSfCobX6mgHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkNP39FE9eZ9PyCyBLhsPG1cv6+Q2lySm1eFr4fJPlCads6vyvqMmThbRF7wDj6xauI5Tc6L9IThFuV+D9+frdDEvauKC5tWJA6H7xln8lCjdM4E5LdhymHkYD7bDrW3+Q8DKJQw3klP9OLLncKldunGheewxLz+4xUeAIlu8P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hceqm0Y7; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hceqm0Y7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPhvGdqKXcuJx5E03AUM5+DzMvveKyKMmh9wO2LKVNsIrzb4gJ2c/gOz01/5q0N02lk/aVHjOYCTuOYJd5SQv3Iy90yLeq8VtOuLUqXa+Vuayoh7WMmlZ3uHmXS36atGsgce7o7k/zoEcWV4ogkb9jx/Dn88iDTzNP3IA903dwUJYZib9YwgJcpTkZWb3R3+8FWuKrVZyOUldW3rzKU1iDEvU4xlVkSMQhx99bGKmwI52hRcxKzE/9XF6eIgMzAWNzlWOw5EcD37keaNj8yEx0FHTb+H0qkNYtzf7Fx19Rbhfba2uGmoXBT5NWVKb5AO6clp98L4UczFwJVpAEIMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tz8yylytS1HwOagIs7fqF7t0jNtCuGXbPaNfn5jVAl0=;
 b=pKLs7LGRuOzdqsnh5O5qYMQYurDFqhAS1wIP52xvLPZfsdm+ZZ3Q91H+kw3rLWHdefOP1Q74zUjWMlC0IngGZhII5LkaTeETzGcgdHg1tubNLWgurVYc8E7WLAhpOmzVzj4x3iLaFNVTeuDLOQ+wZcWP2p3oUSUWMwLsPjcvXDVcRAwVlYQLlMXilco+txWs9H1hFROtIZtCIcbxCKSrze2oVOdEhjBdzzI387uUtKpG7aJ2CrHqIibEb/ELHniv5nlfOcZS2g22pEsNKFQztkjNkNY9Nub+nWbt9mJOdfcHLLOEVwHwiofXBDaEB7J+lhQpZ7+graktwrLFpcyz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tz8yylytS1HwOagIs7fqF7t0jNtCuGXbPaNfn5jVAl0=;
 b=Hceqm0Y7QpUyqZiRoJNMwMEthH3Z/87LzLpING4i3VW4qv87nYPf1ahp/toMLOcVWNEPGMMGRJ3z3qScS1dlfG6ZypG126VTjceY9JL1/F3wAGiHpK6qfQoqj13DXyR10iTa0xofnd9zqlq8IJ55YCjTiurYaFIu5FTrDkeMWZqgv5PHP5FsJX+2Jj3D9u68Qc9P3Tz+N+vx481+P4rxw7kyWtVDhhKVGCaBuU4fXNncgGomPx+T8KRUHiCgZsuPrtIGRMo7OJ/gUxTR5UgywjZfKZfHdfwYxuug6sbaQr9buYKn2h1Y5/az+24kMWnx+xvl+FAwqtYhaIUChkuoLg==
Received: from BL1PR13CA0235.namprd13.prod.outlook.com (2603:10b6:208:2bf::30)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:45:33 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::2e) by BL1PR13CA0235.outlook.office365.com
 (2603:10b6:208:2bf::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 19:45:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:45:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:07 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:07 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:44:59 -0700
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
Subject: [PATCH v2 4/7] gpu: nova-core: add vGPU preludes
Date: Mon, 22 Jun 2026 22:43:50 +0300
Message-ID: <20260622194353.1308872-5-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 581f738d-2377-4b82-e5d5-08ded096d1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|23010399003|36860700016|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vTDlC1ckVTgNvZhBpAdng5TvjkkVArD4GIa43Xt+cpIvxUnmb6hQn7V/aM2AMM0IyivOcF6B5sq0q9TtDRrQJbtIPOHv6cqw0wHth7tszf7ewAGQ/P7DFO/DUk5H9D5E20crlxwpG7H7abskTzysz5Ks4oIveqSNu5tQO8PRrBCI/TLumdAAgDatuJj80nMTQ5ftbbEfJuIZonntF6947r554b65lhkCVHYpcEwFUXaTdMjiuXn49kl4RISMFlZts2aspaks/AuwV2ChRzJ4zJy+CMfO9tELU5vqRVBOcG8C3AkbByA7iNx9+05X0Q/BVne8bsgqB0zFt5Vjh+KlmWQV9N5Kk7gIECgU+Xdhw2N55aWwYRW3fVSjm6NTkwCU1/jGexKDTcgWSNZ++uDRSpxFey4pY0otzSR1r/NKCI36G7WuHVeaNdyiqUO9YLaeKrqi72u+TjwM/rE5XliqT6SIs+j75znIzV/JIUfTiUoRgumhlXptcQ2JERgttQMYUoXvHXoomB7a56g4mbLq6Cks/Cfw4OAP93xYJTG8gtf47MO3rRYYTJ7dTkr2QXcBEZkoPMzioePu524yv5Cv3iDH2HwS+ryfhkr9USJ5kb7Dm7vMN4K49gwL8wjJvyAjf2aEK1iotWVXMam25AkSybX0NF5RNTkbTeHtEy+6Dw0LVd6YV5GWPEpcC0rsfIp3dC6MWcjKRgfruoL7oIoaWQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dXuVMaf6/BpqaXG02Vz+A37VJFPoEBhCR/NMjX3oxcPy6lVqFf1zD/Ab4zBFV9YJHCz9rbYaOEJYmEG5dSb0Yzlfb7Mr95uGFLmbXzFcw8nDz5dvcB+282jRwswI1ImBdKzhJxwKR1wn8rtXwqykZMHJbet/GzsD6YMow6a22WWuaRhG8p0a6NUxWtZOEUYX2eXWzYFIoF22BKlss+hP7j19yrm+qyNwL4FpjKbjYKZbFDwzdG85nFhA+dy29JPv0hULpmrx7GDr88Azm6C/2CGgyXMRStZCp/tBjUBiDJJONvDwouCsp4fbFh1kUUmS2n+7tYBPuZ2YhAP6dEsc2YeJLYDDROnTbnuwFZRYOcrHFPDRh8x2PlUBK5URjVgTZgXZYsWy/ZrvHeGpKev1PrINBEmVopKQ2BjTK21fJOQfmdr9hqCPIOc0Qf8EO6YZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:45:31.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 581f738d-2377-4b82-e5d5-08ded096d1b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393

Detect vGPU state before GSP boot so later boot steps can consume a
stable view of whether vGPU is enabled and how many SR-IOV VFs are
available.

Introduce VgpuManager to keep the detected vGPU state. The manager uses
a GPU HAL capability gate, pci_sriov_get_totalvfs(), and the FSP PRC
vGPU mode knob to decide whether vGPU is enabled for the current boot.
vGPU is considered enabled only when at least two VFs are available.
The state is read-only after construction and is referenced from
GspBootContext instead of being copied into it.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           |  1 -
 drivers/gpu/nova-core/gpu.rs           | 12 ++++++
 drivers/gpu/nova-core/gpu/hal.rs       |  3 ++
 drivers/gpu/nova-core/gpu/hal/gh100.rs | 12 +++++-
 drivers/gpu/nova-core/gpu/hal/tu102.rs |  5 +++
 drivers/gpu/nova-core/gsp.rs           |  2 +
 drivers/gpu/nova-core/gsp/boot.rs      |  7 +++
 drivers/gpu/nova-core/nova_core.rs     |  1 +
 drivers/gpu/nova-core/vgpu.rs          | 60 ++++++++++++++++++++++++++
 9 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 2bf01c2d1175..3b5006750693 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -469,7 +469,6 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) ->
     /// Reads the active vGPU mode from FSP using the PRC protocol.
     ///
     /// Queries FSP's Management Partition for the active vGPU mode knob value.
-    #[expect(dead_code)]
     pub(crate) fn read_vgpu_mode(
         &mut self,
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e5ebd79c9020..646eb6c63c21 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -30,6 +30,7 @@
         GspBootMethod, //
     },
     regs,
+    vgpu::VgpuManager,
 };
 
 mod hal;
@@ -138,6 +139,11 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
         hal::gpu_hal(self).pci_config_mirror_range()
     }
+
+    /// Returns whether this chipset can support vGPU.
+    pub(crate) fn supports_vgpu(self) -> bool {
+        hal::gpu_hal(self).supports_vgpu(self)
+    }
 }
 
 // TODO
@@ -267,6 +273,8 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp>,
+    /// vGPU state detected before GSP boot.
+    vgpu: VgpuManager,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp,
@@ -311,6 +319,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
+                    vgpu: &*this.vgpu,
                 },
                 bundle,
             )
@@ -366,6 +375,8 @@ pub(crate) fn new(
                     GspBootMethod::Fsp => Some(Fsp::wait_secure_boot(dev, bar, spec.chipset)?),
                 },
 
+                vgpu: VgpuManager::new(pdev, spec.chipset, bar, fsp.as_mut())?,
+
                 gsp <- Gsp::new(pdev),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
@@ -378,6 +389,7 @@ pub(crate) fn new(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
+                    vgpu,
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index 3f25882d0e56..2116c71242ec 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -27,6 +27,9 @@ pub(crate) trait GpuHal {
 
     /// Returns the address range of the PCI config mirror space.
     fn pci_config_mirror_range(&self) -> Range<u32>;
+
+    /// Returns whether this chipset can support vGPU.
+    fn supports_vgpu(&self, chipset: Chipset) -> bool;
 }
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
index e3f8ba0fab33..8e18206961ae 100644
--- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -7,7 +7,13 @@
     prelude::*, //
 };
 
-use crate::driver::Bar0;
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
 
 use super::GpuHal;
 
@@ -28,6 +34,10 @@ fn pci_config_mirror_range(&self) -> Range<u32> {
 
         PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
     }
+
+    fn supports_vgpu(&self, chipset: Chipset) -> bool {
+        matches!(chipset.arch(), Architecture::BlackwellGB20x)
+    }
 }
 
 const GH100: Gh100 = Gh100;
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
index b0732e53edea..1e2c7bbdb4ad 100644
--- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -32,6 +32,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     regs, //
 };
 
@@ -94,6 +95,10 @@ fn pci_config_mirror_range(&self) -> Range<u32> {
 
         PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
     }
+
+    fn supports_vgpu(&self, _chipset: Chipset) -> bool {
+        false
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ff438506070a..6821008d48d9 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -51,6 +51,7 @@
         },
     },
     num,
+    vgpu::VgpuManager,
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -64,6 +65,7 @@ pub(crate) struct GspBootContext<'a> {
     pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
     pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
     pub(crate) fsp: Option<&'a mut Fsp>,
+    pub(crate) vgpu: &'a VgpuManager,
 }
 
 impl<'a> GspBootContext<'a> {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1e0d4793e96d..0a33cf4dd975 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -47,6 +47,13 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
+        dev_dbg!(
+            dev,
+            "vGPU enabled: {}, total VFs: {}\n",
+            ctx.vgpu.enabled(),
+            ctx.vgpu.total_vfs()
+        );
+
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 735b8e17c6b6..2df2f773ec8e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -26,6 +26,7 @@
 mod regs;
 mod sbuffer;
 mod vbios;
+mod vgpu;
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
new file mode 100644
index 000000000000..08fa37d80b28
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    fsp::{
+        Fsp,
+        VgpuMode, //
+    },
+    gpu::Chipset,
+};
+
+/// vGPU state detected during GPU construction.
+pub(crate) struct VgpuManager {
+    enabled: bool,
+    total_vfs: u16,
+}
+
+impl VgpuManager {
+    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU knob.
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        fsp: Option<&mut Fsp>,
+    ) -> Result<Self> {
+        let total_vfs = if chipset.supports_vgpu() {
+            pdev.sriov_get_totalvfs()
+        } else {
+            0
+        };
+
+        let enabled = if total_vfs < 2 {
+            false
+        } else if let Some(fsp) = fsp {
+            let mode = fsp.read_vgpu_mode(pdev.as_ref(), bar)?;
+
+            mode == VgpuMode::Enabled
+        } else {
+            false
+        };
+
+        Ok(Self { enabled, total_vfs })
+    }
+
+    /// Returns whether vGPU mode is enabled for this boot.
+    pub(crate) fn enabled(&self) -> bool {
+        self.enabled
+    }
+
+    /// Returns the total number of SR-IOV VFs supported by this device.
+    pub(crate) fn total_vfs(&self) -> u16 {
+        self.total_vfs
+    }
+}
-- 
2.51.0

