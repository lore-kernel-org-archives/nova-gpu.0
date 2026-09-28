Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37549B475
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591604; cv=fail; b=MQpcPFrb5WzbkrKshZ4p0f6Rc1ACEbCbCxGFt4T2U6unN3mGVAIbqzbXWMe3ruZ0BKxQcc5LhzLfyha7qtACqHqPi8CXJQ3ofK81QT7znJzgBfE3KDQHZdAzdfPJlCDNxV4w8M9s+h0eSUdtDCxVfhdh9gH26oTy9Bwk/ZLNVzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591604; c=relaxed/simple;
	bh=MvejJufMpk2kuipft9fP3IhB3rxzw/uVVylpF8P+yfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ds795rY5+oyOzB2+w7lcirs6d38McdjBndB1TgvTkvWBrjVriW1D7oqPBRCbz9i951NWr/KLiawehSCPRb4DtS6xGyz2MqgLRTXjXx+lXvuaLJ0fvyqhysG9vx24US7F7CLCJKJKQuc11W50XH6y1HSgbvnXbP5SJXWi3K7i9iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FErEME0A; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FErEME0A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BolASCVHcdFCHPsNOcgWNNbHJXKP/a9ojRy2EnRw3e5xX0a9et91V2KYlr7IlpETgX1SLvt1gopNi+NQOP193rEPNCnOOFAIRrJc52l2tioCUOovajA7SOFE7OVc83UkPLTzJIZAjOST0Xy7e61MWKO6/c0sBU7fmQSacx4rlVQMKjVFYRjiR0Ba5SZX+NHoBRl3fgS69NDeh6L0JrgkIKvvdwnC5r3oTy2M7HrqWHaiqk60XcfcbPtSF+d2V2+WtfOYx6EK5Wi+ss1fDF2MvJuNxQA/tLnpMhLRAS3fQ3liKa1i2VxXgcFCpdXwwzmvny+EdbbKXk4ZbpuJyCnJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfVe9Vu0GSLBi2Wld9ZCdzh4gnr/jqJGkN2dvNdwvF4=;
 b=nFwq5R+Sp6kYD+z2H3uo8/97BYBbkFBooW8jH6Sn8h3kXWqm1dGyAP2DK8oELj/s8u/hw2BSzfvZFC5KR+EgThMXtSPf7xUQyq+L5ZqCeeCCsgmbXLRe0spNAIC6oPqMIYBDtmVuRfIFJmX4S3Igyhn6OQDFn50Lab+DxZ0Dr9JymgePtiaJw25u5d83x9Dihuf9j4T01395x1JQT34oL6WO8DEfPxsAhqAZge4rRaLsSK6rMRx0Y1RejbXFNzm6Y7EFwgfxLijdIXIpUvWIybMEHfunJ0efamxxXudgwG69uQ7uLykVMj5Q/+hXKaV3BPy4/1AS4Yofe78D7pn7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfVe9Vu0GSLBi2Wld9ZCdzh4gnr/jqJGkN2dvNdwvF4=;
 b=FErEME0AXHPYa/9r4HyCqTU9K3+vf3TVCFF9QEM6N+uvt+GaJXttwI7Pk/4LYziT/QIGnoQTSUJk+UjZnUQbyNGDviw7NLrGeAwahMCABe2jR+Iwa2CFggOLKWRtr/NgJIlthnO+bR1cI6QcWlF4QIonL3Zb0Cyk2VgARj0s0P8j41GMPrqha8IZ4vfNweEm7RxHCatUtYdEIK+I0r85ujB+RXfluougkX3KM4dnhk2RwDMTMq7wNbp7jLIzT0iNoGCtvberpS45hCCFFi9pnc6Cw9IyXKd+yqXz1f5I0vtS4f0Wy2ooLsPtkRqWpcIAE7CuM6s+URAPEcrK6PxutA==
Received: from BN9PR03CA0744.namprd03.prod.outlook.com (2603:10b6:408:110::29)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:33:14 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::25) by BN9PR03CA0744.outlook.office365.com
 (2603:10b6:408:110::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 28 Sep 2026 10:33:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:33:14 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:33:00 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:59 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:51 -0700
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
Subject: [PATCH v3 29/31] gpu: nova-core: vgpu: scrub guest VRAM with CeUtils
Date: Mon, 28 Sep 2026 13:28:32 +0300
Message-ID: <ae524f2b9a3240880ccba895826a60ce23b2a77f.1790580105.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790580105.git.zhiw@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: b0011baa-77d3-45a4-d10f-08df1d4be731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|10067099003|3023799007|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rdIStRPpuZQNwtxhzpoxxELNldP4SuWM56oVNoTZj5A3AD89Q1X68171Fj1DG7GcS2yz024uBTgTeZRiDKxYiNL0mDySWosR2mlH4tsFSialu23e4VqpakMdK4NyXiowv0nJZsA9LEqe/cRtkwbEgCAzEnKslE+9tQQG5yL8+QWDBO3MEiN5jbn/sy/5daqETElRHiT9gv+X5eNLrY1DCvBNKeX2WRTQf8qYqRSTFAFSz0wc/ITHNN/jKCm97wBjNDsRma0zoAWy9XSxtxlzrh0b/1UWGbvbx6VQGJsPATcsijPim9Z5GLiP3ReAL2jGehDt7GBbmhiLOewzdpqFEMNYe8pHOX2X6rvcI6/U4aCk2BPPbCaE2GtZr/g0pO1zzSdba9KcYsZaT/pn814feMNrPUj3DVR4uYLnQ++jLbJ3dR/cgxJLX02co956tdPOgg9rKbXawKi6js0zQV+TZaU2SxbxMxYX9A4TaAYc7JMHeUzxC1Y2nj9TMHsW9Oa1Eu2GLl2Gr/XUXOK05T1GSU0E3nkwVGNMt+t5Ow9GxAy1qYXoI7VAN4qaFJYaw31n/Q1oIBmzaUpRzzdUflucxsPKM424KEwud/F9ItDvOeylJqKITDaQqptv3Oh9Ly++yvgxpoeMDsBMwJE6L7OsVKIVi476P9z/mzct83SoHsY+BTxP6CAUTFJ4rgPGCMLXYifLhuPQK/eNhqj8cJDw/A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(3023799007)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bj3mk1jIGXptjRcfTXjOTJ1mmKehlwQGAO3qmcpt3XJ2FCf6ohAOROLIkNwLR6hdgGkXxGnbeS63U+4wB5c4abC4iYTG2+JU2gep76ifV7ASA6NDo/jP9PAiULK0lXt9/OCODssZUK8R3H52g8U1MOul3A1o896u6HhDDJQMSE9zfmXB9jmdbCeySEkgyeX2kliIlu4x4DdGjCsPyi3vgBLLSvB4VEK6XZVGhtXUlwzie4rOW59qbnLlX06NwswszrI1AVIa5nUerBuqMC4a6Eiy+FdPPbSAsEkck+ayciY2e9Fa5JB2hIxBzxRjgegw+k13hNMUMPZLHpz6CiV2HIg5Df2rFPErorkvZH6uLI0x0/Z11wNZQCF+rZX9GezPXPeUq/LSh9JkAl2zyL6KAUR4OUsCo7RKAaboG+vYh7ID6LHGMQqw9wasFY5BhsIW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:33:14.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0011baa-77d3-45a4-d10f-08df1d4be731
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009

Scrub guest VRAM before plugin boot and after plugin shutdown, before its
slot can be reused. Reserve the last channel ID in each instance range
for CeUtils and give the remaining channels to the plugin.

Submit scrubs in chunks and wait for completion through a temporary BAR1
mapping of the CeUtils semaphore. Release the mapping on both success and
failure, preserving a polling error if unmapping also fails.

Keep allocation, scrubbing and release within the instance lifecycle.
Retain host resources until device removal when firmware ownership is
uncertain or a scrub fails, and do not retry a recorded teardown failure.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu.rs          |   1 +
 drivers/gpu/nova-core/vgpu/commands.rs |   4 -
 drivers/gpu/nova-core/vgpu/instance.rs |  51 +++++++-
 drivers/gpu/nova-core/vgpu/scrubber.rs | 173 +++++++++++++++++++++++++
 4 files changed, 223 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/scrubber.rs

diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index d6bcdabafb42..f78a4621984a 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -38,6 +38,7 @@
 mod gsp_plugin_rpc;
 mod hal;
 mod instance;
+mod scrubber;
 mod vram;
 
 /// vGPU state detected during GPU construction.
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 704d13259cf3..52e8339504c6 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -207,7 +207,6 @@ pub(super) fn set_plugin_bme(
 }
 
 /// Whether a failed allocation may still have transferred CHID ownership to firmware.
-#[expect(dead_code)]
 pub(super) enum CeUtilsAllocError {
     /// A matching firmware response explicitly rejected the allocation.
     NotOwned(Error),
@@ -216,7 +215,6 @@ pub(super) enum CeUtilsAllocError {
 }
 
 /// Allocate a CeUtils channel and validate its semaphore description.
-#[expect(dead_code)]
 pub(super) fn alloc_ceutils(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq<'_>,
@@ -265,7 +263,6 @@ pub(super) fn alloc_ceutils(
 }
 
 /// Release a CeUtils allocation, including one whose allocation reply was lost.
-#[expect(dead_code)]
 pub(super) fn free_ceutils(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq<'_>,
@@ -282,7 +279,6 @@ pub(super) fn free_ceutils(
 }
 
 /// Submit an asynchronous guest FB scrub and return its work identifier.
-#[expect(dead_code)]
 pub(super) fn submit_ceutils_scrub(
     dev: &device::Device<device::Bound>,
     cmdq: &Cmdq<'_>,
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 23c2b791aa25..1ccf4309f2ed 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -31,12 +31,14 @@
 
 use super::{
     commands::{
+        free_ceutils,
         negotiate_plugin_version,
         send_bootload,
         send_cleanup,
         send_plugin_config,
         send_shutdown,
         set_plugin_bme,
+        CeUtilsAllocError,
         Dbdf, //
     },
     fw::commands::{
@@ -47,6 +49,7 @@
     },
     gsp_plugin_comm::CommBufferRegion,
     gsp_plugin_rpc::PluginRpc,
+    scrubber::CeUtils,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -151,12 +154,41 @@ struct VgpuInstance<'gpu> {
     // Unmap the communication region before returning its slot and channel IDs.
     vram_slot: VgpuVramSlot,
     chids: ChannelIdReservation<'gpu>,
+    ceutils: Option<CeUtils>,
     needs_teardown: bool,
     /// An uncertain or failed operation retains resources until device removal.
     failure: Option<Error>,
 }
 
 impl<'gpu> VgpuInstance<'gpu> {
+    fn initialize(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
+        let ceutils_chid =
+            u32::try_from(self.chids.end.checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?;
+        let ceutils = match CeUtils::allocate(vgpu.dev, vgpu.cmdq, self.gfid, ceutils_chid) {
+            Ok(ceutils) => ceutils,
+            Err(CeUtilsAllocError::NotOwned(error)) => return Err(error),
+            Err(CeUtilsAllocError::MayOwn(error)) => {
+                self.failure = Some(error);
+                dev_err!(vgpu.dev, "CeUtils allocation failed: {:?}\n", error);
+                return Err(error);
+            }
+        };
+
+        let result = ceutils.scrub_guest_fb(
+            vgpu.dev,
+            vgpu.cmdq,
+            vgpu.bar_user,
+            vgpu.mm,
+            &self.vram_slot.fbmem,
+        );
+        self.ceutils = Some(ceutils);
+        if let Err(error) = result {
+            // A failed wait does not establish that the submitted scrub has stopped.
+            self.failure = Some(error);
+        }
+        result
+    }
+
     fn activate(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         let dev = vgpu.dev;
         self.bootload(dev, vgpu.cmdq, &vgpu.fifo_engine_list)?;
@@ -175,7 +207,17 @@ fn teardown(&mut self, vgpu: &VgpuManager<'gpu>) -> Result {
         }
         let result = (|| {
             self.shutdown(vgpu.dev, vgpu.cmdq)?;
-
+            if let Some(ceutils) = self.ceutils.as_ref() {
+                ceutils.scrub_guest_fb(
+                    vgpu.dev,
+                    vgpu.cmdq,
+                    vgpu.bar_user,
+                    vgpu.mm,
+                    &self.vram_slot.fbmem,
+                )?;
+                free_ceutils(vgpu.dev, vgpu.cmdq, self.gfid)?;
+                self.ceutils = None;
+            }
             if self.needs_teardown {
                 send_cleanup(vgpu.dev, vgpu.cmdq, self.gfid)?;
                 self.needs_teardown = false;
@@ -241,7 +283,7 @@ fn configure_plugin(&mut self, dev: &device::Device<device::Bound>) -> Result {
             self.dbdf,
             self.vgpu_type.vgpu_type_id,
             self.vm_pid,
-            u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            u32::try_from(self.chids.len().checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?,
             self.num_plugin_channels,
         )?;
 
@@ -352,6 +394,9 @@ fn allocate_instance<'a>(
             .total_channels
             .checked_div(vgpu_type.max_instance)
             .ok_or(EINVAL)?;
+        if channels_per_instance <= 1 {
+            return Err(EINVAL);
+        }
         let channels_per_instance =
             usize::try_from(channels_per_instance).map_err(|_| EOVERFLOW)?;
         let channels_per_instance = NonZeroUsize::new(channels_per_instance).ok_or(EINVAL)?;
@@ -378,6 +423,7 @@ fn allocate_instance<'a>(
             plugin_rpc: PluginRpc::new(comm, bar0, gfid),
             vram_slot,
             chids,
+            ceutils: None,
             needs_teardown: false,
             failure: None,
         };
@@ -445,6 +491,7 @@ fn activate(mut self) -> Result {
             .iter_mut()
             .find(|instance| instance.gfid == self.gfid)
             .ok_or(EIO)?;
+        instance.initialize(self.vgpu)?;
         instance.activate(self.vgpu)?;
         self.committed = true;
         Ok(())
diff --git a/drivers/gpu/nova-core/vgpu/scrubber.rs b/drivers/gpu/nova-core/vgpu/scrubber.rs
new file mode 100644
index 000000000000..dc62ddc1ef01
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/scrubber.rs
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-VM CeUtils guest VRAM scrubbing.
+
+use kernel::{
+    device,
+    prelude::*,
+    sync::Mutex,
+    time::{
+        delay::fsleep,
+        Delta,
+        Instant,
+        Monotonic, //
+    },
+    types::ScopeGuard, //
+};
+
+use crate::{
+    gsp::cmdq::Cmdq,
+    mm::{
+        bar_user::BarUser,
+        vram::VramRegion,
+        GpuMm,
+        Pfn,
+        VramAddress, //
+    },
+    vgpu::instance::Gfid, //
+};
+
+use super::commands::{
+    self,
+    CeUtilsAllocError, //
+};
+
+// Semaphore layout from OpenRM `channel_utils.h`.
+const NV_CEUTILS_SEMA_PAGE_MAGIC: u32 = 0xce5e_5ea0;
+
+#[repr(C)]
+struct CeUtilsSemaphoreHeader {
+    magic: u32,
+    payload: u32,
+}
+
+static_assert!(size_of::<CeUtilsSemaphoreHeader>() == 8);
+
+const SEMA_PAGE_MAGIC_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, magic);
+const SEMA_PAGE_PAYLOAD_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, payload);
+
+const SCRUB_REQUEST_SIZE: u64 = 4 * 1024 * 1024 * 1024;
+
+// Host timeout policy; not a firmware ABI value.
+const SCRUB_TIMEOUT: Delta = Delta::from_secs(5);
+
+/// A firmware-owned per-VM CeUtils allocation.
+///
+/// Submitted scrubs must complete before releasing this allocation or its VRAM.
+pub(super) struct CeUtils {
+    gfid: Gfid,
+    semaphore_address: u64,
+}
+
+impl CeUtils {
+    pub(super) fn allocate(
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        gfid: Gfid,
+        chid: u32,
+    ) -> core::result::Result<Self, CeUtilsAllocError> {
+        let semaphore_address = commands::alloc_ceutils(dev, cmdq, gfid, chid)?;
+        Ok(Self {
+            gfid,
+            semaphore_address,
+        })
+    }
+
+    /// Scrub the complete guest VRAM and wait for semaphore completion.
+    pub(super) fn scrub_guest_fb(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar_user: &BarUser<'_>,
+        mm: &Mutex<GpuMm<'_>>,
+        fb: &VramRegion,
+    ) -> Result {
+        let mut offset = fb.address();
+        let end = offset.checked_add(fb.size()).ok_or(EOVERFLOW)?;
+        while offset < end {
+            let size = core::cmp::min(SCRUB_REQUEST_SIZE, end - offset);
+            let work_id = commands::submit_ceutils_scrub(dev, cmdq, self.gfid, offset, size)?;
+            wait_scrub_complete(bar_user, mm, dev, self.semaphore_address, work_id)?;
+            offset = offset.checked_add(size).ok_or(EOVERFLOW)?;
+        }
+
+        Ok(())
+    }
+}
+
+/// Poll the GSP-owned CeUtils semaphore page through a temporary BAR1 map.
+fn wait_scrub_complete(
+    bar_user: &BarUser<'_>,
+    mm: &Mutex<GpuMm<'_>>,
+    dev: &device::Device<device::Bound>,
+    semaphore_address: u64,
+    work_id: u32,
+) -> Result {
+    let pfn = Pfn::from(VramAddress::from_raw(semaphore_address));
+    let semaphore_map = bar_user.map(&mut mm.lock(), &[pfn], false)?;
+    let semaphore_map = ScopeGuard::new_with_data(semaphore_map, |mapping| {
+        if let Err(error) = mapping.release(&mut mm.lock()) {
+            dev_err!(
+                dev,
+                "failed to release semaphore BAR1 mapping: {:?}\n",
+                error
+            );
+        }
+    });
+
+    let result = (|| {
+        let magic = semaphore_map.try_read32(SEMA_PAGE_MAGIC_OFFSET)?;
+        if magic != NV_CEUTILS_SEMA_PAGE_MAGIC {
+            dev_warn!(
+                dev,
+                "bad CeUtils semaphore magic {:#x}, expected {:#x}\n",
+                magic,
+                NV_CEUTILS_SEMA_PAGE_MAGIC,
+            );
+            return Err(EIO);
+        }
+
+        let start = Instant::<Monotonic>::now();
+        loop {
+            let value = semaphore_map.try_read32(SEMA_PAGE_PAYLOAD_OFFSET)?;
+            if value.wrapping_sub(work_id) < 0x8000_0000 {
+                dev_dbg!(
+                    dev,
+                    "scrub completed after {:?}: semaphore={:#x}, target={:#x}\n",
+                    start.elapsed(),
+                    value,
+                    work_id,
+                );
+                return Ok(());
+            }
+
+            if start.elapsed() >= SCRUB_TIMEOUT {
+                dev_warn!(
+                    dev,
+                    "scrub timed out: semaphore={:#x}, target={:#x}\n",
+                    value,
+                    work_id,
+                );
+                return Err(ETIMEDOUT);
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    })();
+
+    let cleanup = semaphore_map.dismiss().release(&mut mm.lock());
+    match result {
+        Ok(()) => cleanup,
+        Err(error) => {
+            if let Err(cleanup_error) = cleanup {
+                dev_err!(
+                    dev,
+                    "failed to release semaphore BAR1 mapping after error {:?}: {:?}\n",
+                    error,
+                    cleanup_error,
+                );
+            }
+            Err(error)
+        }
+    }
+}
