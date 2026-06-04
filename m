Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852A423A79
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573518; cv=fail; b=XXXk1PrJD0H4GECKYYLp+K9DZxhhJPyX3qNrdUIfks2NV+aszkJXMPNWDCcHXLRkvJfdHRI2bcYIsXrXofyLo5O5aawmfAE6rGsWeb4KnFe6YxSZAQp3DNVemVNwSBJ2U6oUVEeFt1ih9nDlEaU1TPOUxrIXUYIP6vs+yb/hsGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573518; c=relaxed/simple;
	bh=rYamuohm8ghmvxO2Z25p/ctfJCFW7qKFnZuccl3c62Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RapfAX+EJS0xmcTG3ZgftdNjIgBd+ew7EC53iXTLkOT5vOK5migQ0FWft6iUgNh3zES4zOuQ19M/7M2uAM/HqJsdRL+ERG+i7wvWhN4SrVJBjkR1tS9p7kj9pqiIUT7lrxOos+QhD2feQhOTQKCk1Uq4RMqrxgEAjtOhomrYxAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OlDiy8c3; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OlDiy8c3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ99DLCd/en25qNSzBo7aDFtGUmK6z0adZj984ARNetObbyg5Dsx+XshWxijY1zSWPNj9nW9c6o5h+Hxjk69e8bRThOfLpLgm9xV00xKuWqgT71OtOop8Nf5M+1r3j9NDr3RGGVQoDgEFEOjflTgjydfePM5xPnH7h0E+jbPI7rVFmd1UNguZT+bdjTSJs0vob10smMzVxRfUTejEJAZDBrpOT2wR59KCh8U4eDDv8NyeV6LEdYui0EoCjsnAtshbXvWRMB+s8hHeQOqIxmVpf0rl2RYXqTdeAQGu2UvSq5h8otio1GpRh2bvSh8WXGg7h9I8Iik18zjHAj1onGjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RR4a7dWQXeGKuAkFTTx0tqG0xsKALvbnhWQ6tNA9KI=;
 b=IPMaQalvh81BJnz+omPQmX1tOEyEkAZTR5zNkPbxW/cNERWylhyrGuq281ZH5BDA4xDTW1yKkwFinS6cGYjyQILZ+s6yrdEa52wVLxq8WElllmxVLL/uZkvKsGqzLK2JPVwS32KuLHiOBg1lbGSywcNDwgjnseO7qOVkJNw/uBxp2mcNzArqaTRUTrEAsWcgks5Y4ICTPdsYGeiTf09j3H4jwkUacmZgha+OydI0/IpUaQpWV7KQCW/GTNIIXvQj8N71iLnrMQLViDt2cpSWwFeXHUxdbKeKulG2XonczX6iysemz6PCtZ1CStvGm3aTvuIzT0K5DD5MBj0/h8e+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RR4a7dWQXeGKuAkFTTx0tqG0xsKALvbnhWQ6tNA9KI=;
 b=OlDiy8c3W5DK7Ni4FpCHLzS3+vcH36MDCAYNrXNXPO6XshzVYlt7jaAI/7bei3FhsNOxlfUFxcAQZBKCPau1wta7mTvygCzqZO0TqVzbnbulS+ednne4Um+tu73SRXLbA6FXJ9BvybQQUKfPOOvm0zYyTMVCajG+m0y8r13/AX3jsLps6Z3coOTF9FluQAOIRNsDzsM4uVPvIG3Y9DB6e3ImHNvFbmgre4ZeV6ATpTNppUWkVUfnADqOK9oECmXzN1X3Buf8CT0KXaNTpCk13SiG6R6MzV+rhJxmGvWG9SjuLa4BV4ogX/wX4qGMLZCNZYW4RHev9X7qcd5fMoQ5ZA==
Received: from BN0PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:e8::29)
 by SJ0PR12MB8092.namprd12.prod.outlook.com (2603:10b6:a03:4ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:45:04 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::90) by BN0PR04CA0054.outlook.office365.com
 (2603:10b6:408:e8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:45:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:47 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:46 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:39 -0700
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
Subject: [PATCH 6/9] gpu: nova-core: consolidate GSP boot parameters into GspBootContext
Date: Thu, 4 Jun 2026 14:43:36 +0300
Message-ID: <20260604114339.1565660-7-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SJ0PR12MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b38b42-3940-4177-63de-08dec22eb74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|6133799003|11063799006|3023799007|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	UONAtS33NSCzrvDmNhao+TwuxyCd/EWUvr9oMGeLtNDURnG0lRvarx33GfBxmfguozP0kwgkPG4C+2IpBQQJ8vxUaJ0PvCJIlOOuB1fbGwlVj96Rg42iEewBRSc5lXNC39CA8S2CUGVGdNLh1Eqcby52OPob6SjDYJkrq3flocZhE6RopVAmrdfZCM0gjDoNlf3dMZB8UUdDctLu4DfEdiJ99usQ7eRWbleGuSxV/OmLhVxhEzkuunrCD4v/L41cXa8B8lM8XyFU/zBAke7a0sX90org+t+BfhOKAVSICvkxbcqK51tosLevGigfU1+/yohWM8oJJuLVWBN8WNPaxgLwic/mopD/vQgX0QqC4yACztThwbuWGJls5yk8simxQefHxfzVyo5MC6/Bo0+nXmtZkXwn/LzOZcT64GNqxZqU7ASGX8anMtgfSqMAkz06F+31Bz1ASOsO3o++tZUmbz0svmI0A9DpHTrB+sx+3ZLwTwq2SrW33QhS1WI/dlEnSJZaKZivKKz0NtostlIABIcRoLWw7OJfaaJTIXmwRzipaykGR9VwnZQqbW7Z6vkFPVFF5zosAaDs0Qj95MKdx2JAfNFF02TSpyfGcw55z43FTEW/Fpj5n1HCICLf9NOW5WCdDrHZQmL+MnetWqfi5oGgGeMUdl0H6N8I70dks6rK4djvOql26eVxJ9SY12RruP1yHZZAE++ow0fEDsradjUVho2LxNS2iSWQD9qhg3o=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(6133799003)(11063799006)(3023799007)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dj2wbG00GTLcraiz5RZE+ErhhrUu3KvcWfqkZWijkweb0cLW4kvyI8H0VJrfbol/sLGMM11/MrIez46u0ozNhy4+/ZDrrENeQ7UcqwfL5LGZUG9UPbbjAncTL9RU3PJDcd7sd68IeObejLAn4pqLtx+Lpp2OWz9Nac4vDfARzBJYjuPDB8eZu6MGq24yOmNkOlFbRe1DiyKObeIeA3PDmbUpSD7n3qkSlcDi5GdiYGpmRueDQzO/2Ctx0xs1QFAgXw43TqIqKGiT0uUDP8mVcQue6f2m7aNhsxk2GjV0Badzv8XpSiOe2vkSQp27cF/tN4ExY4qJ+Juh6aj+EQWa2hiwIA4KdmmmTG8wGjOBk1pWy/G+g5KWDGlH45YBJ5K9T1cyZuRUB/RRvzeHZSC/+SfnwNFAsBro8Ksmg0ynriIIuVl5ts2ZtjbytlK8QM0G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:45:03.0516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b38b42-3940-4177-63de-08dec22eb74b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8092

The GspHal trait methods boot() and post_boot() accept a long list of
individual parameters (dev, bar, chipset, gsp_falcon, sec2_falcon) that
are threaded through the entire GSP boot call chain. This makes the
signatures unwieldy and difficult to extend as new boot-time context
(e.g. vGPU state) is introduced.

Introduce a GspBootContext struct that bundles the common boot
parameters into a single object, and refactor the GspHal trait to accept
&GspBootContext instead of individual arguments. The struct also exposes
a dev() helper with proper lifetime annotation so that HAL
implementations can extract the device reference without reborrowing
constraints.

Update both TU102 and GH100 HAL implementations to extract their
required parameters from the context struct, and simplify the call sites
in Gsp::boot() accordingly.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs           | 14 ++++++-
 drivers/gpu/nova-core/gsp.rs           | 22 +++++++++++
 drivers/gpu/nova-core/gsp/boot.rs      | 55 ++++++++++++--------------
 drivers/gpu/nova-core/gsp/hal.rs       | 23 +++--------
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 14 ++++---
 drivers/gpu/nova-core/gsp/hal/tu102.rs | 31 ++++++---------
 6 files changed, 85 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b3c91731db45..69569e218d9b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -23,7 +23,8 @@
     fb::SysmemFlush,
     gsp::{
         self,
-        Gsp, //
+        Gsp,
+        GspBootContext, //
     },
     regs,
 };
@@ -323,7 +324,16 @@ pub(crate) fn new(
             // This member must be initialized last, so the `UnloadBundle` can never be dropped from
             // outside of the constructed `Gpu`, ensuring that the unload sequence is properly run
             // in case of failure.
-            unload_bundle: gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?,
+            unload_bundle: {
+                let ctx = GspBootContext {
+                    pdev,
+                    bar,
+                    chipset: spec.chipset,
+                    gsp_falcon,
+                    sec2_falcon,
+                };
+                gsp.boot(&ctx)?
+            },
             bar,
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 69175ca3315c..f0901bf86258 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -31,6 +31,13 @@
 };
 
 use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp as GspFalcon,
+        sec2::Sec2 as Sec2Falcon,
+        Falcon, //
+    },
+    gpu::Chipset,
     gsp::cmdq::Cmdq,
     gsp::fw::{
         GspArgumentsPadded,
@@ -42,6 +49,21 @@
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
+/// Common context for the GSP boot process.
+pub(crate) struct GspBootContext<'a> {
+    pub(crate) pdev: &'a pci::Device<device::Bound>,
+    pub(crate) bar: Bar0<'a>,
+    pub(crate) chipset: Chipset,
+    pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
+    pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
+}
+
+impl<'a> GspBootContext<'a> {
+    pub(crate) fn dev(&self) -> &'a device::Device<device::Bound> {
+        self.pdev.as_ref()
+    }
+}
+
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 8afb62d689cb..6e170401d616 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -6,7 +6,6 @@
     device,
     dma::Coherent,
     io::poll::read_poll_timeout,
-    pci,
     prelude::*,
     time::Delta,
     types::ScopeGuard, //
@@ -24,7 +23,6 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
     gsp::{
         cmdq::Cmdq,
         commands,
@@ -103,61 +101,58 @@ impl super::Gsp {
     /// [`Self::unload`]) returned.
     pub(crate) fn boot(
         self: Pin<&mut Self>,
-        pdev: &pci::Device<device::Bound>,
-        bar: Bar0<'_>,
-        chipset: Chipset,
-        gsp_falcon: &Falcon<Gsp>,
-        sec2_falcon: &Falcon<Sec2>,
+        ctx: &super::GspBootContext<'_>,
     ) -> Result<Option<super::UnloadBundle>> {
-        let dev = pdev.as_ref();
-        let hal = super::hal::gsp_hal(chipset);
+        let dev = ctx.dev();
+        let hal = super::hal::gsp_hal(ctx.chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, ctx.chipset, FIRMWARE_VERSION),
+            GFP_KERNEL,
+        )?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(ctx.chipset, ctx.bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
-        let unload_guard = hal.boot(
-            &self,
-            dev,
-            bar,
-            chipset,
-            &fb_layout,
-            &wpr_meta,
-            gsp_falcon,
-            sec2_falcon,
-        )?;
+        let unload_guard = hal.boot(&self, ctx, &fb_layout, &wpr_meta)?;
 
-        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+        ctx.gsp_falcon
+            .write_os_version(ctx.bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before continuing.
         read_poll_timeout(
-            || Ok(gsp_falcon.is_riscv_active(bar)),
+            || Ok(ctx.gsp_falcon.is_riscv_active(ctx.bar)),
             |val: &bool| *val,
             Delta::from_millis(10),
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
+        dev_dbg!(
+            ctx.dev(),
+            "RISC-V active? {}\n",
+            ctx.gsp_falcon.is_riscv_active(ctx.bar),
+        );
 
         self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            .send_command_no_wait(ctx.bar, commands::SetSystemInfo::new(ctx.pdev, ctx.chipset))?;
         self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new())?;
+            .send_command_no_wait(ctx.bar, commands::SetRegistry::new())?;
 
-        hal.post_boot(&self, dev, bar, &gsp_fw, gsp_falcon, sec2_falcon)?;
+        hal.post_boot(&self, ctx, &gsp_fw)?;
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = self.cmdq.send_command(bar, commands::GetGspStaticInfo)?;
+        let info = self
+            .cmdq
+            .send_command(ctx.bar, commands::GetGspStaticInfo)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(ctx.pdev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(ctx.pdev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(unload_guard.dismiss())
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 04f004856c60..51a277fe97bb 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -4,11 +4,10 @@
 mod gh100;
 mod tu102;
 
-use kernel::prelude::*;
-
 use kernel::{
     device,
-    dma::Coherent, //
+    dma::Coherent,
+    prelude::*, //
 };
 
 use crate::{
@@ -27,6 +26,7 @@
     gsp::{
         boot::BootUnloadGuard,
         Gsp,
+        GspBootContext,
         GspFwWprMeta, //
     },
 };
@@ -53,32 +53,19 @@ pub(super) trait GspHal: Send {
     ///
     /// Upon success, returns a guard that runs the GSP unload sequence if GSP boot does not
     /// complete.
-    #[allow(clippy::too_many_arguments)]
     fn boot<'a>(
         &self,
         gsp: &'a Gsp,
-        dev: &'a device::Device<device::Bound>,
-        bar: Bar0<'a>,
-        chipset: Chipset,
+        ctx: &GspBootContext<'a>,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        gsp_falcon: &'a Falcon<GspEngine>,
-        sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>>;
 
     /// Performs HAL-specific post-GSP boot tasks.
     ///
     /// This method is called by the GSP boot code after the GSP is confirmed to be running, and
     /// after the initialization commands have been pushed onto its queue.
-    fn post_boot(
-        &self,
-        _gsp: &Gsp,
-        _dev: &device::Device<device::Bound>,
-        _bar: Bar0<'_>,
-        _gsp_fw: &GspFirmware,
-        _gsp_falcon: &Falcon<GspEngine>,
-        _sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    fn post_boot(&self, _gsp: &Gsp, _ctx: &GspBootContext<'_>, _gsp_fw: &GspFirmware) -> Result {
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 98f5ce197d13..c9fdc8cacedc 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -26,7 +26,6 @@
         FmcBootArgs,
         Fsp, //
     },
-    gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
         hal::{
@@ -34,6 +33,7 @@
             UnloadBundle, //
         },
         Gsp,
+        GspBootContext,
         GspFwWprMeta, //
     },
 };
@@ -152,14 +152,16 @@ impl GspHal for Gh100 {
     fn boot<'a>(
         &self,
         gsp: &'a Gsp,
-        dev: &'a device::Device<device::Bound>,
-        bar: Bar0<'a>,
-        chipset: Chipset,
+        ctx: &GspBootContext<'a>,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        gsp_falcon: &'a Falcon<GspEngine>,
-        sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
+        let dev = ctx.dev();
+        let bar = ctx.bar;
+        let chipset = ctx.chipset;
+        let gsp_falcon = ctx.gsp_falcon;
+        let sec2_falcon = ctx.sec2_falcon;
+
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
         let unload_bundle = crate::gsp::UnloadBundle(
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 2f6301af7113..5b4325f16930 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -42,6 +42,7 @@
             GspSequencerParams, //
         },
         Gsp,
+        GspBootContext,
         GspFwWprMeta, //
     },
     regs,
@@ -258,14 +259,16 @@ impl GspHal for Tu102 {
     fn boot<'a>(
         &self,
         gsp: &'a Gsp,
-        dev: &'a device::Device<device::Bound>,
-        bar: Bar0<'a>,
-        chipset: Chipset,
+        ctx: &GspBootContext<'a>,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        gsp_falcon: &'a Falcon<GspEngine>,
-        sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
+        let dev = ctx.dev();
+        let bar = ctx.bar;
+        let chipset = ctx.chipset;
+        let gsp_falcon = ctx.gsp_falcon;
+        let sec2_falcon = ctx.sec2_falcon;
+
         let bios = Vbios::new(dev, bar)?;
 
         // Try and prepare the unload bundle.
@@ -321,23 +324,15 @@ fn boot<'a>(
         Ok(unload_guard)
     }
 
-    fn post_boot(
-        &self,
-        gsp: &Gsp,
-        dev: &device::Device<device::Bound>,
-        bar: Bar0<'_>,
-        gsp_fw: &GspFirmware,
-        gsp_falcon: &Falcon<GspEngine>,
-        sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    fn post_boot(&self, gsp: &Gsp, ctx: &GspBootContext<'_>, gsp_fw: &GspFirmware) -> Result {
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
             bootloader_app_version: gsp_fw.bootloader.app_version,
             libos_dma_handle: gsp.libos.dma_handle(),
-            gsp_falcon,
-            sec2_falcon,
-            dev,
-            bar,
+            gsp_falcon: ctx.gsp_falcon,
+            sec2_falcon: ctx.sec2_falcon,
+            dev: ctx.dev(),
+            bar: ctx.bar,
         };
         GspSequencer::run(&gsp.cmdq, seq_params)?;
 
-- 
2.51.0

