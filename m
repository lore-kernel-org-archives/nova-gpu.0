Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013059.outbound.protection.outlook.com [40.93.196.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40E40B110
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372448; cv=fail; b=fb9S5m4Bo0CdFY6wzV4k1a7VTZTeMvuItniIf7YF+CMCOOErkl5uoOL+eEcFI+UGoblS+ph5y4vK0IVMAZI8TnJplwoHkKwZ9EEhwQa16VhCEACcOHMJ5PKs3kFLJJVq9bfYRk5CSC70Rx44JYjD2FvzCaJXaZSZQAxKnLJ9BZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372448; c=relaxed/simple;
	bh=Pbrg6QKyq7c66a97m1unLkIdtPFqbTxjaNaNtvrdwUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSB0BPIrDZ0xO2iVlATFuGBnxkcsqpaQelVfULac9lUYIX40/rZUXXtHwuHyjJA7Js/5ulwlwivZc6gKOO0A/0Q07kwmhMIwMkq4L7Xf/7WGU7C/uQYRfyjyOU1UtqlxDC6jM//pJpMet52naoBxUr7auqcfpfsPoRLLeeyeLjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVmHDtfv; arc=fail smtp.client-ip=40.93.196.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVmHDtfv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZK5zFsZvD+3CGGvvJ2vgipFH1KT9IJ1vCN9JpKg3qwXF9zusonWdMvtsaQ9N1ghI6Jcozq5L0nRMz2wt/rMJk13yaHtzNVhvVWeuDJmEXljOY2i67LmKhfOZbcUoym3sjCrRcpxZchZVZkytCrA25+IG1TFqfZUeR6SVg3vye1B17GP9Bu21A/x6PDZU7Q9JsW0B0G0pi2zigeBkQPtRiRfVldJsEZs+QjzIgdnM+5nvqucerDQIkacKC9CPPMZa2jTgFWnmPoWUv96OyolBWz/hfgDzpMItBT355JaM2KgOIuv93uNYdDY9L1dECTZv8m8/eGIVo6fLLlbR+8EDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIv5VwTkgIqWecryJN/7UPNAEOiSDGtQwoMh5lbiwCo=;
 b=pyPqIMqUyh81lglsA4/36BZ+pHpzAaKenbDJ37TMrvYpi3c7Ofvkcr6GQYZrLcLPQAko9PnKS48iv87SoMxl7tmQejapw6mlLvE20WyDBtg9mGvJ5z0zdqCq4iPGWhmbur5DOvorMNOH3J0rvHARU5TBSHTKe8fP4Os+UUUo6qZCZwer61RmSKgYdUrhkNH5K1pJQEUzKO0q1d8nIYPQCkcVxnjiP/i1i+yhqFrNc52Df1kl0yT1vYJHXPqVrC1pPUH4RyWS2d4rwfbXv/pI0siLFNG1AsV9XyiRX00Xomb93xOXZ+M7dvpkfjgnQbqoJUgpt3Xu8W0dI9udg4NmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIv5VwTkgIqWecryJN/7UPNAEOiSDGtQwoMh5lbiwCo=;
 b=bVmHDtfvH3V1TsSXN75pN6YX2qxiA2+tnBIo/NeyR+y/PHWBwF4fjaO8RV86HYF4uK1q2nWfETeHiBd4XqfloPckCmnFhPz+cPULtojJ0dtwaHRX56b1c57hqFbIsSc8M3O6ixYSNbkXLNkYq44A7A65KgXQkz357KeCbGHPgfM/nNw3/a/6Z8mYUGmKStzFr2j5J5LCRPfpse/vv24hcHQ7XfH+CmF6XI1qHRbJMbXajmjp5AWwo5qDfRhznHZGue+3eD30Pw9yZlGm+j616IHg0bZfYCJhdmx79PewqsDZlm3ne1AX4oNYSDFVN1O9XIo9wYzh9Sto0ElCzoMzlQ==
Received: from BLAPR03CA0180.namprd03.prod.outlook.com (2603:10b6:208:32f::10)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:57 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::2) by BLAPR03CA0180.outlook.office365.com
 (2603:10b6:208:32f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:39 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:38 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:53:30 -0700
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
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Timur Tabi
	<ttabi@nvidia.com>
Subject: [PATCH v2 31/32] gpu: nova-core: add build ID headers to debugfs log buffer dumps
Date: Mon, 14 Sep 2026 10:49:06 +0300
Message-ID: <20260914074907.1399629-32-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e34d1b-40b6-4f82-02be-08df123554cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|3023799007|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	VtSuYQYTxStjyRJPMGbYQB8rZrpmSq1+91AomLHE3Cl9nQwxI3qrtKfNCTNnNfGTCNUTCKseb8+LJcPY++c+vg8ejxhepONwsXRB8So0nhTxDfKq6Q9N4xoF704tLUo6f7+G83Y5AShCsbEvTLDPWNwHloD4Tjt9l1axyPAZ3DLfZ6yIOGptqLGbbjtoZ2zQJNn3eXfPlYAVwfVHcAsds5saWhS3+r8rd9OL2Jucc4OVErRtNFRTWx+80eiwZl3Dzgdq8nCOB/rQR1DjHD/QDyAbXGyrKOPt5t9Z0UKw5S+nx44m7A6G+dYR9uXQDCjN/kxSSGIMoWPaD/BPtM/Bmd6zJbzZlICldFLgiq/K6+nXdlaSpqDsjRPShqJIoybnG3DL/Mrgd9aGXnA/dNPhMcuRpqd5MigQYptotyxvzgeeYmNLuq+jXX7qd3U8R7UDRTv8AN+3Vzj0HkGe/iIp8kVlvPUFvI5XOAq8xoZM/mbNV8XZZaVEeqvGL4sDXzibTjqjbi77vRxDchXTZBtmLRSaBSVh+JeHJGpDgp4SriJNsBmwTVIlVl5vXThRSMAof3X6Ph4PeL3WaVywRBnKfoMKi8ouyvtv5JNQgVoNCiIfy8nSKMAWbvvHfOraH2YLFvZJfdSyWc6sBRjYWIHpDcIShwcVF9Fn/Pxt8bh/0m1rH+0QmFmtuyLuS317eMeASb1btsHOmcrFwK+n3U4EFQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(3023799007)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gTYJ1urjxpv4w8VEhiMMOT8GrblLKhmz5pcH6iZSxV+WoIl2EnJgLzImuMWWDC4nyg/jk9UI7TkkO63XIzR8lkmKK86PU9i8YMFTuGmrPCccmor8t7M+4Zr7jQ7u2jqT8nYeMvTgnmFG2OkFlt/rjeCHK6aBQ9bqFsfR5ac8viAU6app0UOWLa39x54ZurxT7zf+AMC6CTdDPOzM+JUhMoaF0swDDddtAs8FbBq0i+JbeR/nDdSO5ofLgmvwRxNzesim1sZfq5LNnB7O57pvyNjV2UikaTkLfe5EjqbnTUHJS8FjhhCR7ZhyC1q+0offkILfvKJZshpIagX1PLcddARvEgMyI2eV8/05Rw/9W6yhSyBxgB2yel2ZWl0bbWzUqm3siovGcoAD7afjRD5H/VaMU55XNOSIxgZt/iCSXXWK22apCNItO7blLMFRiDWh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:57.3404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e34d1b-40b6-4f82-02be-08df123554cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

From: John Hubbard <jhubbard@nvidia.com>

A raw log buffer dump cannot be decoded without knowing which firmware
build produced it, and which GPU and metadata format it belongs to.
GSP-RM's own decoder takes that from a header ahead of the data, in the
LIBOS_LOG_NVLOG_BUFFER_V2 layout.

Prepend that header to each debugfs dump. The build ID comes from the
BLID tag of gsp.tlv, so request the metadata once when the GSP manager
is created and hand it to the firmware loader rather than requesting it
again during boot. A buffer whose build ID is missing serves its
contents with no header.

zhiw: Keep this tree's borrowed DMA and command queue lifetimes and all
six LIBOS log registrations. Borrow the preloaded TLV for initialization
independently of the device lifetime. Retain the completed header byte
count if the following DMA copy fails.

Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  34 +++++
 drivers/gpu/nova-core/firmware/gsp.rs |  16 ++-
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          | 199 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs     |   2 +-
 5 files changed, 217 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index ff5b6d79de22..86c1eb459192 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -32,6 +32,40 @@
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
+/// Maximum length of a build ID, matching Open RM's `BUILD_ID_MAX_LENGTH`.
+const BUILD_ID_MAX_LENGTH: usize = 32;
+
+/// Build ID extracted from firmware, used to correlate debugfs log buffer dumps
+/// with the correct firmware symbols.
+pub(crate) struct BuildId {
+    bytes: [u8; BUILD_ID_MAX_LENGTH],
+    len: u8,
+}
+
+impl BuildId {
+    /// Constructs a [`BuildId`] from raw descriptor bytes.
+    ///
+    /// Returns `None` if `data` is empty or exceeds [`BUILD_ID_MAX_LENGTH`].
+    pub(crate) fn from_raw(data: &[u8]) -> Option<Self> {
+        if data.is_empty() || data.len() > BUILD_ID_MAX_LENGTH {
+            return None;
+        }
+
+        let mut bytes = [0u8; BUILD_ID_MAX_LENGTH];
+        bytes[..data.len()].copy_from_slice(data);
+
+        Some(Self {
+            bytes,
+            len: data.len() as u8,
+        })
+    }
+
+    /// Returns the build ID bytes.
+    pub(crate) fn as_bytes(&self) -> &[u8] {
+        &self.bytes[..usize::from(self.len)]
+    }
+}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e641f4879a42..5b2f765e77b4 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -6,6 +6,7 @@
         Coherent,
         DmaAddress, //
     },
+    firmware,
     prelude::*, //
 };
 
@@ -14,8 +15,8 @@
         radix3::Radix3,
         riscv::RiscvFirmware, //
         tlv::{
-            request_tlv, //
-            Tlv,
+            request_tlv,
+            Tlv, //
         },
     },
     gpu::Chipset, //
@@ -36,13 +37,16 @@ pub(crate) struct GspFirmware<'a> {
 impl<'a> GspFirmware<'a> {
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new(
+    pub(crate) fn new<'fw>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
-    ) -> impl PinInit<Self, Error> + 'a {
+        gsp_tlv: &'fw firmware::Firmware,
+    ) -> impl PinInit<Self, Error> + 'fw
+    where
+        'a: 'fw,
+    {
         pin_init::pin_init_scope(move || {
-            let firmware = request_tlv(dev, chipset, "gsp")?;
-            let tlv = Tlv::new(firmware.data())?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
             dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
             let (_, fw_vvec) = tlv.load_file(dev, chipset)?;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 61adf412bae7..a750d808fd5b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -426,7 +426,7 @@ pub(crate) fn new<'a>(
 
                 vgpu_state: VgpuState::detect(pdev, spec.chipset, fsp.as_mut()),
 
-                gsp <- Gsp::new(pdev, bar),
+                gsp <- Gsp::new(pdev, bar, spec.chipset),
 
                 // This member must be initialized last, so the unload bundle can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index c961ea029fed..0bf4c8ee96ee 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,13 +12,15 @@
         CoherentView,
         DmaAddress, //
     },
+    fs::file,
     io::{
         io_project,
         io_write,
         Io, //
     },
     pci,
-    prelude::*, //
+    prelude::*,
+    uaccess::UserSliceWriter, //
 };
 
 pub(crate) mod cmdq;
@@ -43,6 +45,13 @@
         sec2::Sec2 as Sec2Falcon,
         Falcon, //
     },
+    firmware::{
+        tlv::{
+            request_tlv,
+            Tlv, //
+        },
+        BuildId, //
+    },
     fsp::Fsp,
     gpu::Chipset,
     gsp::{
@@ -101,6 +110,50 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
+/// Size of the header prepended to debugfs log buffer dumps.
+///
+/// This header makes each dump self-describing so that decoding tools can
+/// identify the firmware build, GPU architecture, and metadata format without
+/// out-of-band information.
+const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
+
+/// Build a log buffer header from GPU and firmware metadata.
+///
+/// Layout (all little-endian):
+///   0x00  gpuArch (u32)
+///   0x04  gpuImpl (u32)
+///   0x08  version (u32) = 2
+///   0x0C  buildIdLength (u32)
+///   0x10  taskPrefix[8]
+///   0x18  localToGlobalTimerDelta (u64) = 0
+///   0x20  buildId[32]
+///   0x40  flags (u32) = 1 (packed metadata)
+///   0x44  reserved (u32) = 0
+fn build_log_buffer_header(
+    chipset: Chipset,
+    build_id: &BuildId,
+    task_prefix: &str,
+) -> [u8; LOG_BUFFER_HEADER_SIZE] {
+    let mut h = [0u8; LOG_BUFFER_HEADER_SIZE];
+    let chipset_val = chipset as u32;
+
+    h[0x00..0x04].copy_from_slice(&(chipset_val >> 4).to_le_bytes());
+    h[0x04..0x08].copy_from_slice(&(chipset_val & 0xF).to_le_bytes());
+    h[0x08..0x0C].copy_from_slice(&2u32.to_le_bytes());
+
+    let bid = build_id.as_bytes();
+    h[0x0C..0x10].copy_from_slice(&(bid.len() as u32).to_le_bytes());
+
+    let prefix = task_prefix.as_bytes();
+    let prefix_len = prefix.len().min(8);
+    h[0x10..0x10 + prefix_len].copy_from_slice(&prefix[..prefix_len]);
+
+    h[0x20..0x20 + bid.len()].copy_from_slice(bid);
+    h[0x40..0x44].copy_from_slice(&1u32.to_le_bytes());
+
+    h
+}
+
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -115,7 +168,13 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a, const NUM_PAGES: usize>(Coherent<'a, [[u8; GSP_PAGE_SIZE]; NUM_PAGES]>);
+///
+/// When a build ID is available, the debugfs file for this buffer prepends
+/// a header so the dump is self-describing.
+struct LogBuffer<'a, const NUM_PAGES: usize> {
+    header: Option<[u8; LOG_BUFFER_HEADER_SIZE]>,
+    buffer: Coherent<'a, [[u8; GSP_PAGE_SIZE]; NUM_PAGES]>,
+}
 
 /// A log buffer at the default size, [`RM_LOG_BUFFER_NUM_PAGES`] pages.
 ///
@@ -130,19 +189,71 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 
 impl<'a, const NUM_PAGES: usize> LogBuffer<'a, NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
-
+    fn new(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Result<Self> {
+        let buffer = Coherent::zeroed(dev, GFP_KERNEL)?;
+
+        let start_addr = buffer.dma_address();
         let pte_view = io_project!(
-            obj.0,
+            buffer,
             [build: 0][build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
         .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
-        Ok(obj)
+        let header = build_id.map(|bid| build_log_buffer_header(chipset, bid, task_prefix));
+
+        Ok(Self { header, buffer })
+    }
+}
+
+impl<const NUM_PAGES: usize> debugfs::BinaryWriter for LogBuffer<'_, NUM_PAGES> {
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
+        let header = self.header.as_ref().map_or(&[][..], |h| h.as_slice());
+        let total_len = header.len() + self.buffer.size();
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
+        let mut written = 0;
+
+        if offset_val < header.len() {
+            let hdr_count = (header.len() - offset_val).min(count);
+            writer.write_slice(&header[offset_val..offset_val + hdr_count])?;
+            written += hdr_count;
+        }
+
+        if written < count {
+            let buf_start = offset_val.saturating_sub(header.len());
+            let buf_count = count - written;
+            match writer.write_dma(&self.buffer, buf_start, buf_count) {
+                Ok(()) => written += buf_count,
+                Err(error) if written == 0 => return Err(error),
+                Err(_) => {}
+            }
+        }
+
+        *offset += written as i64;
+        Ok(written)
     }
 }
 
@@ -168,9 +279,11 @@ struct LogBuffers<'a> {
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp<'gsp> {
+    /// Preloaded GSP firmware TLV metadata used during boot.
+    gsp_tlv: kernel::firmware::Firmware,
     /// Libos arguments.
     pub(crate) libos: Coherent<'gsp, [LibosMemoryRegionInitArgument]>,
-    /// Log buffers, optionally exposed via debugfs.
+    /// Log buffers for all LIBOS3 tasks, exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers<'gsp>>,
     /// Command queue, borrowed by the GSP event interrupt handler.
@@ -187,18 +300,30 @@ impl<'gsp> Gsp<'gsp> {
     pub(crate) fn new(
         pdev: &'gsp pci::Device<device::Bound>,
         bar: Bar0<'gsp>,
+        chipset: Chipset,
     ) -> impl PinInit<Self, Error> + 'gsp {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = TaskLogBuffer::new(dev)?;
-            let logintr = TaskLogBuffer::new(dev)?;
-            let logrm = TaskLogBuffer::new(dev)?;
-            let logmnoc = TaskLogBuffer::new(dev)?;
-            let logroot = SmallLogBuffer::new(dev)?;
-            let logrmon = SmallLogBuffer::new(dev)?;
+            let gsp_tlv = request_tlv(dev, chipset, "gsp")?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
+            let build_id = tlv.get_bytes(b"BLID").ok().and_then(BuildId::from_raw);
+            if build_id.is_none() {
+                dev_warn!(
+                    pdev,
+                    "GSP firmware build ID not found, log buffer headers omitted\n"
+                );
+            }
+
+            let loginit = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INIT")?;
+            let logintr = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INTR")?;
+            let logrm = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "RM")?;
+            let logmnoc = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "MNOC")?;
+            let logroot = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "ROOT")?;
+            let logrmon = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "RMON")?;
 
             Ok(try_pin_init!(Self {
+                gsp_tlv,
                 cmdq <- Cmdq::new(dev, bar),
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 rmargs: Coherent::init(
@@ -213,12 +338,30 @@ pub(crate) fn new(
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    libos.init_at(3, LibosMemoryRegionInitArgument::new("LOGMNOC", &logmnoc.0))?;
-                    libos.init_at(4, LibosMemoryRegionInitArgument::new("LOGROOT", &logroot.0))?;
-                    libos.init_at(5, LibosMemoryRegionInitArgument::new("LOGRMON", &logrmon.0))?;
+                    libos.init_at(
+                        0,
+                        LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.buffer),
+                    )?;
+                    libos.init_at(
+                        1,
+                        LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.buffer),
+                    )?;
+                    libos.init_at(
+                        2,
+                        LibosMemoryRegionInitArgument::new("LOGRM", &logrm.buffer),
+                    )?;
+                    libos.init_at(
+                        3,
+                        LibosMemoryRegionInitArgument::new("LOGMNOC", &logmnoc.buffer),
+                    )?;
+                    libos.init_at(
+                        4,
+                        LibosMemoryRegionInitArgument::new("LOGROOT", &logroot.buffer),
+                    )?;
+                    libos.init_at(
+                        5,
+                        LibosMemoryRegionInitArgument::new("LOGRMON", &logrmon.buffer),
+                    )?;
                     libos.init_at(6, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
@@ -244,12 +387,12 @@ pub(crate) fn new(
                         .expect("DEBUGFS_ROOT not initialized");
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
-                        dir.read_binary_file(c"logmnoc", &logs.logmnoc.0);
-                        dir.read_binary_file(c"logroot", &logs.logroot.0);
-                        dir.read_binary_file(c"logrmon", &logs.logrmon.0);
+                        dir.read_binary_file(c"loginit", &logs.loginit);
+                        dir.read_binary_file(c"logintr", &logs.logintr);
+                        dir.read_binary_file(c"logrm", &logs.logrm);
+                        dir.read_binary_file(c"logmnoc", &logs.logmnoc);
+                        dir.read_binary_file(c"logroot", &logs.logroot);
+                        dir.read_binary_file(c"logrmon", &logs.logrmon);
                     })
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index fa879685bac5..a35a25cac9db 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -77,7 +77,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, &self.gsp_tlv), GFP_KERNEL)?;
 
         // GSP-RM reads the ucodes image through a radix3 page table, so the mapping has to
         // outlive initialization.
