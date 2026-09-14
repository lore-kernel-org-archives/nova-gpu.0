Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A940BCB0
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372452; cv=fail; b=TcWKhk/DX2QmRuWwqr/uzjUkM5BxKQrevYMbGqite1/69M44acN3OKRJlhERqkeiDqhA2WCcti2m35LDdYnar9LCnVaQfNX6C/m0jFknZI4ZftEMieEAbyaew9Grcro3KiO7MULVdaFsh1GrDgUK+meF9JQaYL2XHxr3yEUlpWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372452; c=relaxed/simple;
	bh=Y2ttJKNvie+Yp+U/gQIf0jDc6/cYUnCGBW90cQ4iZDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6UAmyNnuQPTrKSR4psjgVNrjjnh1unOWoMMYqKkopGaPHPSDXr1rDWOLCwHIoJQe1Mpa0PvmaVEPCE/FraTV8C4CZaaVI2soe0hW93MD/Xey60pdEWzqzyYXM8Es1wqvDPK3yh1z0gFkbZOq8I38xQ8bsLI2cRflxDqjfaw3gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EMRoQVrg; arc=fail smtp.client-ip=40.107.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EMRoQVrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC0mFtJmqQnou+yciOEOzwelG5aoC8VbSqLngGdg0Gt/faH/93yfmwHAY0fj4dUTKT4z5mk5j9xI07mMh5XtIC/pNE8DOCNn/HiIpUDnRsyLlTiGulGfBN5qgIT7ahJMGmmqVDWv/Jh9V9CxfGiROGhReuFKZ68STV8NZPBycZ1yggt3m26JXkiLNTYsaE1kViG3dE25gTsAnKUNAVBN3Yibe9jZWbisitHSLaUac/rmNC8KU5yW3oOyRJDkMrNnUZHzmlZPxkMSdS8th66BIIcwK4hIeAvHOe/AsrXK4Vk/s5VgaBkKxC/zNy87aM7kktgTUpkxS9u9tiyOmF0HgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ4Jh8xsaDBgQ7nuX/KUtmEOWQZISY3Al9lMEfSIE7M=;
 b=IPs22ambn3gxC6Vlhq20c3y6mmchnrAlACdfxioBu78DUJXllMLlJRG5X+QmbfuF5bfb+/la7CQCpj8Mf8RAfXYF/CxrlJYMD5/4ZqGlOc9CPrh0nx/LdvEXxWPbxYgiyLf5H5Rw19DephdKuXvi6MEceNAf5JEjaZAka6MKaVasdTIkfZQgalxUo+J2INvGm+O9a/tIGURjdntyaqLD1qiofFZn8NEjNeQ6nuuSU7JiTt6msel49jAlQPTnn0ky2b+PmkBVrbjXTfEF44QX9zObdym1YF0BjziYo6WxXlnNI82WPWDgaahtdb2vGSMpJvfq7WaE7DTz9GkVZW0JQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ4Jh8xsaDBgQ7nuX/KUtmEOWQZISY3Al9lMEfSIE7M=;
 b=EMRoQVrgnIbQdc2jhvC/zts9qhe7H5QK6RwGjDDDzH0426nfSztslVjt8BNV5sRIh7PaT9P1Y/42wn0qRq5MkLPU78NiuBEDsVli6Zy2RhlA/zU31ByKXUZKweeshE0upoZXa/5njDfGHnYIu1txpDd53sEa0J5bc4OmnclNIEVNS1PlxpJ9K9EfBhH++rwAQL2jKbCBvKOGgBujQiaZfULSiPYvI/hcxElsexWuH+7imHO3NtrIylpgm3U+PhBKw7VdqhYNMrVH3o08N0ZCNNDYi8Q8VAIKcjow7ORnj48p72iwGE+6nM/y8Rw6ccJh+eB8Cwi67q3s8wSyK+8iQA==
Received: from DS7P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::12) by
 SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:54:01 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:25e:cafe::4) by DS7P221CA0030.outlook.office365.com
 (2603:10b6:8:25e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:54:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:53:47 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:46 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:53:39 -0700
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
Subject: [PATCH v2 32/32] gpu: nova-core: vgpu: export plugin log buffers via debugfs
Date: Mon, 14 Sep 2026 10:49:07 +0300
Message-ID: <20260914074907.1399629-33-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 102c7826-2167-481d-6a07-08df1235573a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pzaY1DHzfi56VC5mB/GyUhjL1kaTl4B+rCK6t1FIWiQTRk7J/+jSbasKHhgzGjI5aWQWCzdQ8BjUiLHaS4SoP478598f4Qm4YxSRetnYjE3NytYTknT6jb0G8HaFCPts4rfo05izN/I1Xj7HyyNzW6QOOghyDzE8zBN97nLbhfS8tdGA3ghPg99AQM5oD4IXISc4aehmjW5eY6nE9xGWIjbwSf4I0NhEHmaqoEmz0r8sIu+gQpl115Yw1dmV0DtEbmQnWzXRS2O+8cweIaVX/jLxIWCUbxHXQ1//ujwxkExXwItK9Rmojq3o2mB7PLVANL0iE1qqwUupBKVP5aXQMPAQ4FsAhNb2VYfR5wIfdMM0jsBShr/1aUoSTuIHQS3Ac7s5gFeLIrppHftgrgZm+0utye2JZ6QygKqJjHCbTsOrIvGFoE7e9suRcxJ0L/Cog8ziQz6CdZtbR4aIWHuXXYcGUPTA7Uvpa7DcCLTr7OYOaBIPVKWqR4ts7tPsAlGB3cLZHrp2UZTqTxgB6v4/etxq0Bj1ErDmIUwfXXmFsuIn+lbHSOskfBlWOS6U0Zczi8i6uCByQB0PWPHDo8PEBFZR66pzRv5cUfYMR4Lp5WHdO+LFGQIajokxURIRZ6IzGJNDhzThXR1PlKBobn4gc+LuURzJ0NlQBvsdnoke+53/if0HtjLMS7drKf5ExJb2kEoDqM8zXQQMB335t7HukA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H+qJttyrrvID8/qSoyFVSZHxLzxMUmvUJ8iFDGC1RrB0Sjy+oVpN7ns41om9FR991eLtmuUEdgu6kTFkCdZNgIE2o4bsAEsS35ND3DSUsQxQkuHVDvXR7V/Z+LcmiRXL1dkUTIPcC4U70RV88vaCF5sJCs03cYmOZMllEfwZyir42yB4sqZHWrMTkSbqZGINyTOJOvutGN5pOF8hMqtBf3DvKh/Do2QGkeFdS34ptuMBRNMv81ZWlFy5UVvFlrath19TsoAd8Sh4mWeT3TFh0FVDaz7LT2wYysltHqSB2/TL8ucXxmBazDZCfSjCG90IJbF/gt9EvWAE7Fy8yh15YZz8W2OLts2pJtivPmIs8WgUvOCUHKV2fzItuDzGwBcnbg109QILdb3zbDvStuBYwDK+cFdzM6eFBEGnLEogg5IIx2/0pQ0P+ARfezMgtw6P
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:54:01.4267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102c7826-2167-481d-6a07-08df1235573a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787

Expose the three per-VM GSP plugin log buffers (init, vgpu, kernel)
through debugfs so that nvlog_decoder can decode them at runtime.

Each log file is backed by VRAM in the management heap and read via
BAR1 MMIO. Prepend the GSP log header when a firmware build ID is
available.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                  |   4 +-
 drivers/gpu/nova-core/mm/bar_user.rs          |   5 +-
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 120 +++++++++++-
 drivers/gpu/nova-core/vgpu/instance.rs        |  77 +++++++-
 drivers/gpu/nova-core/vgpu/log.rs             | 171 ++++++++++++++++++
 6 files changed, 364 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/log.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 0bf4c8ee96ee..96ee879ce268 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -115,7 +115,7 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// This header makes each dump self-describing so that decoding tools can
 /// identify the firmware build, GPU architecture, and metadata format without
 /// out-of-band information.
-const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
+pub(crate) const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
 
 /// Build a log buffer header from GPU and firmware metadata.
 ///
@@ -129,7 +129,7 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 ///   0x20  buildId[32]
 ///   0x40  flags (u32) = 1 (packed metadata)
 ///   0x44  reserved (u32) = 0
-fn build_log_buffer_header(
+pub(crate) fn build_log_buffer_header(
     chipset: Chipset,
     build_id: &BuildId,
     task_prefix: &str,
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index b7b4bf14b56d..2e9482256b16 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -188,7 +188,6 @@ pub(crate) struct BarMapping<'map, 'gpu> {
     logical_size: usize,
 }
 
-#[expect(dead_code)]
 impl<'map, 'gpu> BarMapping<'map, 'gpu> {
     /// Maps the containing pages while restricting CPU access to the requested byte range.
     pub(crate) fn new(
@@ -231,6 +230,10 @@ pub(crate) fn new(
         })
     }
 
+    pub(crate) fn bar1(&self) -> &'gpu Bar1<'gpu> {
+        self.access.bar_user.bar1
+    }
+
     pub(crate) fn region(&self) -> &VramRegion {
         &self.region
     }
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 407accc05139..123f5a20986e 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -28,6 +28,7 @@
 mod gsp_plugin_rpc;
 mod hal;
 mod instance;
+mod log;
 mod scrubber;
 mod vram;
 
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index e385ecff43fa..7aa9e9caaa49 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -3,15 +3,21 @@
 
 //! GSP plugin communication buffer mappings and access.
 
-use kernel::prelude::*;
+use kernel::{
+    io::Io,
+    prelude::*, //
+};
 
-use crate::mm::{
-    bar_user::{
-        BarMapping,
-        BarUser, //
+use crate::{
+    driver::Bar1,
+    mm::{
+        bar_user::{
+            BarMapping,
+            BarUser, //
+        },
+        vram::VramRegion,
+        GpuMm, //
     },
-    vram::VramRegion,
-    GpuMm, //
 };
 
 use super::fw::{
@@ -50,6 +56,97 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
     Ok(subregion)
 }
 
+/// BAR1 view of one vGPU plugin log buffer.
+pub(super) struct MappedPluginLogBuffer<'gpu> {
+    bar1: &'gpu Bar1<'gpu>,
+    gpu_va_addr: usize,
+    size: usize,
+}
+
+impl<'gpu> MappedPluginLogBuffer<'gpu> {
+    fn new(map: &BarMapping<'_, 'gpu>, region: &VramRegion) -> Result<Self> {
+        let start = region
+            .address()
+            .checked_sub(map.region().address())
+            .ok_or(EINVAL)
+            .and_then(|start| usize::try_from(start).map_err(|_| EOVERFLOW))?;
+        let size = usize::try_from(region.size()).map_err(|_| EOVERFLOW)?;
+        let end = start.checked_add(size).ok_or(EOVERFLOW)?;
+        if end > map.size() || !start.is_multiple_of(4) || !size.is_multiple_of(4) {
+            return Err(EINVAL);
+        }
+
+        let gpu_va_addr = usize::try_from(map.gpu_va_addr()?)
+            .map_err(|_| EOVERFLOW)?
+            .checked_add(start)
+            .ok_or(EOVERFLOW)?;
+        if !gpu_va_addr.is_multiple_of(4) {
+            return Err(EINVAL);
+        }
+
+        let bar1 = map.bar1();
+        if gpu_va_addr.checked_add(size).ok_or(EOVERFLOW)? > bar1.size() {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            bar1,
+            gpu_va_addr,
+            size,
+        })
+    }
+
+    pub(super) const fn size(&self) -> usize {
+        self.size
+    }
+
+    pub(super) fn read(&self, offset: usize, output: &mut [u8]) -> Result {
+        let end = offset.checked_add(output.len()).ok_or(EOVERFLOW)?;
+        if end > self.size {
+            return Err(EINVAL);
+        }
+
+        let mut source = offset;
+        let mut copied = 0usize;
+
+        while copied < output.len() {
+            let aligned_source = source & !3;
+            let within = source & 3;
+            let bar_offset = self
+                .gpu_va_addr
+                .checked_add(aligned_source)
+                .ok_or(EOVERFLOW)?;
+            let bytes = self.bar1.try_read32(bar_offset)?.to_le_bytes();
+            let chunk = (4 - within).min(output.len() - copied);
+
+            output[copied..copied + chunk].copy_from_slice(&bytes[within..within + chunk]);
+            source = source.checked_add(chunk).ok_or(EOVERFLOW)?;
+            copied += chunk;
+        }
+
+        Ok(())
+    }
+}
+
+/// BAR1 views of all vGPU plugin log buffers.
+pub(super) struct MappedPluginLogBuffers<'gpu> {
+    init: MappedPluginLogBuffer<'gpu>,
+    vgpu: MappedPluginLogBuffer<'gpu>,
+    kernel: MappedPluginLogBuffer<'gpu>,
+}
+
+impl<'gpu> MappedPluginLogBuffers<'gpu> {
+    pub(super) fn into_parts(
+        self,
+    ) -> (
+        MappedPluginLogBuffer<'gpu>,
+        MappedPluginLogBuffer<'gpu>,
+        MappedPluginLogBuffer<'gpu>,
+    ) {
+        (self.init, self.vgpu, self.kernel)
+    }
+}
+
 /// BAR1 mapping of the plugin communication region in its management heap.
 ///
 /// r000 layout, with byte offsets from the management heap (not to scale):
@@ -216,6 +313,15 @@ pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         }
     }
 
+    /// Return BAR1 views that must stop being read before this mapping is destroyed.
+    pub(super) fn mapped_plugin_logs(&self) -> Result<MappedPluginLogBuffers<'gpu>> {
+        Ok(MappedPluginLogBuffers {
+            init: MappedPluginLogBuffer::new(&self.map, &self.init_log)?,
+            vgpu: MappedPluginLogBuffer::new(&self.map, &self.vgpu_log)?,
+            kernel: MappedPluginLogBuffer::new(&self.map, &self.kernel_log)?,
+        })
+    }
+
     /// Clear a previous boot marker before starting the plugin.
     pub(super) fn clear_plugin_ready(&self) -> Result {
         let offset = self.io_offset(
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index bb01d4088b5e..7f47c158d407 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -4,10 +4,12 @@
 use core::num::NonZeroUsize;
 
 use kernel::{
+    debugfs,
     device,
     prelude::*,
     ptr::Alignment,
-    sizes::SizeConstants, //
+    sizes::SizeConstants,
+    str::CString, //
     time::{
         delay::fsleep,
         Delta,
@@ -23,7 +25,11 @@
 
 use crate::{
     driver::Bar0,
-    gpu::ChannelIdReservation,
+    firmware::BuildId,
+    gpu::{
+        ChannelIdReservation,
+        Chipset, //
+    },
     mm::{
         bar_user::BarUser,
         GpuMm, //
@@ -31,8 +37,12 @@
 };
 
 use super::{
-    gsp_plugin_comm::CommBufferRegion,
+    gsp_plugin_comm::{
+        CommBufferRegion,
+        MappedPluginLogBuffers, //
+    },
     gsp_plugin_rpc::PluginRpc,
+    log::VgpuLogBuffers,
     scrubber::CeUtils,
     vram::{
         VgpuVramLayout,
@@ -143,6 +153,7 @@ pub(super) struct VgpuInstance<'gpu> {
     vm_pid: u32,
     chids: ChannelIdReservation<'gpu>,
     num_plugin_channels: u32,
+    debugfs_logs: Option<Pin<KBox<debugfs::Scope<VgpuLogBuffers<'gpu>>>>>,
     vram_slot: VgpuVramSlot,
     pub(super) plugin_rpc: PluginRpc<'gpu, 'gpu>,
     ceutils: Option<CeUtils>,
@@ -246,6 +257,39 @@ pub(super) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32
     }
 }
 
+fn create_debugfs_logs<'gpu>(
+    buffers: MappedPluginLogBuffers<'gpu>,
+    dbdf: Dbdf,
+    chipset: Chipset,
+    build_id: Option<&BuildId>,
+) -> Result<Pin<KBox<debugfs::Scope<VgpuLogBuffers<'gpu>>>>> {
+    let logs = VgpuLogBuffers::new(buffers, chipset, build_id);
+    let raw_dbdf = dbdf.into_raw();
+    let domain = raw_dbdf >> 16;
+    let bus = (raw_dbdf >> 8) & 0xff;
+    let device = (raw_dbdf >> 3) & 0x1f;
+    let function = raw_dbdf & 0x07;
+    let directory = CString::try_from_fmt(fmt!(
+        "{:04x}:{:02x}:{:02x}.{:x}-vgpu",
+        domain,
+        bus,
+        device,
+        function,
+    ))?;
+
+    #[allow(static_mut_refs)]
+    // SAFETY: The root is initialized before driver registration and cleared
+    // only after driver unregistration has drained all users.
+    let root = unsafe { crate::DEBUGFS_ROOT.as_ref() }.ok_or(ENODEV)?;
+
+    KBox::pin_init(
+        root.scope(logs, &directory, |logs, directory| {
+            VgpuLogBuffers::register_debugfs(logs, directory);
+        }),
+        GFP_KERNEL,
+    )
+}
+
 /// Registry of live vGPU instances.
 pub(super) struct VgpuInstances<'gpu> {
     instances: KVec<VgpuInstance<'gpu>>,
@@ -287,10 +331,12 @@ fn release_vram_slot(&mut self, slot: VgpuVramSlot) -> Result {
 
     fn release_instance(&mut self, instance: VgpuInstance<'gpu>, mm: &mut GpuMm<'_>) -> Result {
         let VgpuInstance {
+            debugfs_logs,
             plugin_rpc,
             vram_slot,
             ..
         } = instance;
+        drop(debugfs_logs);
         let result = plugin_rpc.destroy(mm);
         self.release_vram_slot(vram_slot)?;
         result
@@ -369,6 +415,7 @@ pub(super) fn allocate_instance(
             vm_pid,
             chids,
             num_plugin_channels: 3,
+            debugfs_logs: None,
             vram_slot,
             plugin_rpc: PluginRpc::new(comm),
             ceutils: None,
@@ -407,6 +454,7 @@ pub(super) fn allocate_instance(
     }
 
     /// Boot and configure the GSP plugin for a registered instance.
+    #[expect(clippy::too_many_arguments)]
     pub(super) fn activate_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
@@ -414,6 +462,8 @@ pub(super) fn activate_instance(
         bar0: Bar0<'_>,
         gfid: Gfid,
         fifo_engine_list: &FifoEngineList,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
     ) -> Result {
         let instance = self
             .instances
@@ -428,7 +478,26 @@ pub(super) fn activate_instance(
         instance.plugin_rpc.init_rpc()?;
         negotiate_plugin_version(dev, bar0, gfid, &mut instance.plugin_rpc)?;
         instance.configure_plugin(dev, bar0)?;
-        set_plugin_bme(dev, bar0, gfid, &mut instance.plugin_rpc, true)
+        set_plugin_bme(dev, bar0, gfid, &mut instance.plugin_rpc, true)?;
+
+        if instance.debugfs_logs.is_none() {
+            match instance
+                .plugin_rpc
+                .comm()
+                .mapped_plugin_logs()
+                .and_then(|buffers| create_debugfs_logs(buffers, instance.dbdf, chipset, build_id))
+            {
+                Ok(logs) => instance.debugfs_logs = Some(logs),
+                Err(error) => dev_warn!(
+                    dev,
+                    "debugfs logs unavailable for gfid={}: {:?}\n",
+                    gfid.0,
+                    error,
+                ),
+            }
+        }
+
+        Ok(())
     }
 
     /// Stop the plugin and release the instance's firmware and host resources.
diff --git a/drivers/gpu/nova-core/vgpu/log.rs b/drivers/gpu/nova-core/vgpu/log.rs
new file mode 100644
index 000000000000..6f58f8ae9bf0
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/log.rs
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP plugin logs exposed through debugfs.
+//!
+//! With debugfs mounted at `/sys/kernel/debug`, the directory uses the VF's
+//! PCI domain:bus:device.function address:
+//!
+//! ```text
+//! /sys/kernel/debug/nova-core/<VF-DBDF>-vgpu/
+//! |-- init_log
+//! |-- vgpu_log
+//! `-- kernel_log
+//! ```
+
+use kernel::{
+    debugfs,
+    fs::file,
+    prelude::*,
+    uaccess::UserSliceWriter, //
+};
+
+use crate::{
+    firmware::BuildId,
+    gpu::Chipset,
+    gsp::{
+        build_log_buffer_header,
+        LOG_BUFFER_HEADER_SIZE, //
+    },
+    vgpu::gsp_plugin_comm::{
+        MappedPluginLogBuffer,
+        MappedPluginLogBuffers, //
+    },
+};
+
+const LOG_READ_CHUNK_SIZE: usize = 4096;
+
+/// A vGPU plugin log buffer backed by VRAM, read via BAR1 MMIO.
+///
+/// An optional header lets `nvlog_decoder` identify the GPU architecture and firmware build.
+struct VgpuLogBuffer<'gpu> {
+    buffer: MappedPluginLogBuffer<'gpu>,
+    header: [u8; LOG_BUFFER_HEADER_SIZE],
+    header_len: usize,
+}
+
+impl<'gpu> VgpuLogBuffer<'gpu> {
+    fn new(
+        buffer: MappedPluginLogBuffer<'gpu>,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Self {
+        let (header, header_len) = match build_id {
+            Some(bid) => (
+                build_log_buffer_header(chipset, bid, task_prefix),
+                LOG_BUFFER_HEADER_SIZE,
+            ),
+            None => ([0u8; LOG_BUFFER_HEADER_SIZE], 0),
+        };
+
+        Self {
+            buffer,
+            header,
+            header_len,
+        }
+    }
+}
+
+impl debugfs::BinaryWriter for VgpuLogBuffer<'_> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let total_len = self
+            .header_len
+            .checked_add(self.buffer.size())
+            .ok_or(EOVERFLOW)?;
+
+        if offset_val >= total_len {
+            return Ok(0);
+        }
+
+        let count = (total_len - offset_val).min(writer.len());
+        if count == 0 {
+            return Ok(0);
+        }
+
+        // Keep the staging buffer on the heap to avoid a page-sized kernel stack object.
+        let staging_size = count.min(LOG_READ_CHUNK_SIZE);
+        let mut staging = KVec::new();
+        staging.resize(staging_size, 0, GFP_KERNEL)?;
+
+        let mut written = 0usize;
+        let result: Result = (|| {
+            while written < count {
+                let chunk_len = (count - written).min(staging.len());
+                let chunk = &mut staging[..chunk_len];
+                let chunk_offset = offset_val.checked_add(written).ok_or(EOVERFLOW)?;
+                let mut filled = 0usize;
+
+                if chunk_offset < self.header_len {
+                    let header_len = (self.header_len - chunk_offset).min(chunk_len);
+                    chunk[..header_len]
+                        .copy_from_slice(&self.header[chunk_offset..chunk_offset + header_len]);
+                    filled = header_len;
+                }
+
+                if filled < chunk_len {
+                    let log_offset = chunk_offset
+                        .checked_add(filled)
+                        .ok_or(EOVERFLOW)?
+                        .checked_sub(self.header_len)
+                        .ok_or(EINVAL)?;
+
+                    self.buffer.read(log_offset, &mut chunk[filled..])?;
+                }
+
+                writer.write_slice(chunk)?;
+                written = written.checked_add(chunk_len).ok_or(EOVERFLOW)?;
+            }
+            Ok(())
+        })();
+        if written == 0 {
+            result?;
+        }
+
+        *offset = (*offset)
+            .checked_add(i64::try_from(written).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)?;
+        Ok(written)
+    }
+}
+
+/// The three plugin log streams for one vGPU instance.
+pub(super) struct VgpuLogBuffers<'gpu> {
+    init_log: VgpuLogBuffer<'gpu>,
+    vgpu_log: VgpuLogBuffer<'gpu>,
+    kernel_log: VgpuLogBuffer<'gpu>,
+}
+
+impl<'gpu> VgpuLogBuffers<'gpu> {
+    pub(super) fn new(
+        buffers: MappedPluginLogBuffers<'gpu>,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+    ) -> Self {
+        let (init, vgpu, kernel) = buffers.into_parts();
+
+        Self {
+            init_log: VgpuLogBuffer::new(init, chipset, build_id, "INIT"),
+            vgpu_log: VgpuLogBuffer::new(vgpu, chipset, build_id, "VGPU"),
+            kernel_log: VgpuLogBuffer::new(kernel, chipset, build_id, "KERN"),
+        }
+    }
+
+    pub(super) fn register_debugfs<'data, 'dir>(
+        logs: &'data Self,
+        dir: &'dir debugfs::ScopedDir<'data, 'dir>,
+    ) {
+        dir.read_binary_file(c"init_log", &logs.init_log);
+        dir.read_binary_file(c"vgpu_log", &logs.vgpu_log);
+        dir.read_binary_file(c"kernel_log", &logs.kernel_log);
+    }
+}
