Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190249B46C
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591408; cv=fail; b=jX5r+bi6EzWqnlQqsENWMwGa9DsO/amM32lXy90b3Yy3oo7YdhMuNdi+KQVP+eMOO4iCDzLu1Fzb7aSU86NLC20z3SsYB1hgZc8bKnzQwjawztbUBU0l9880c/3U6wj4WF9Ah3EiKuicV/xEgr5/KI/zZDkPNHvytt+fvPPKyN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591408; c=relaxed/simple;
	bh=PATBpMyw57YDmYRgZ3CSE/3Itbs+6wdTQfYNdu2m9uA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAOX62mxmBCenTQdhyFV1cn0AyLVAhNTRw3gMcK7l9rkVG7tgqb/8VGhPqXc3e6tCHIUC3+61/NT6FUJBI2UBnl2R3LwGMNK/jC2dZf8Usm1Usnz9+aM4X3c+PJuBwGLo8e60IxzleOwZLgbibu1ZI8pwSK9g4VoQhr4P5/i7Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p+UHAzBd; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p+UHAzBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCzEXFF5jZwvREFBTu/lPQn6UWf60pdfhXqc+dw5XaN22/eLhr08yl6h0gIxnziG6hi+vXUsb5zTUO9sU+fJ9AP6Ej2bGmDTZASnQF/vEdeS/oR355i4lWfOwM3ghP2TGk7mzlb/gHokGVXGLtCEdWqVTOnW9EfE5QU8y3fCp3/wCPaZqpKRWwYhUmEXA7bbLtZQeHTX+qdv3CvakcLnPbjMiLX/GKkI0fCQmv83qCITO1Ww+MwpPIXsT0Ls//KbKWbaGuMW1YbWVvEv/nXKsWlLYnC8df8BNPjttFAuX6gV3noTtUIKwsUtWtZ674dMxASPg3Q9ED8ab9y3pX/izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDD1l2TYavOBbpcay+NRjvipIZnfubHjgTmZykCYOBA=;
 b=UAcqC+3pvTiOBpq3ZRkImrOvQbjvRxor8Tdjx3wrMXUmRcH3mSYzs+N+7gcxd/1svwntjcH66t/dpPkr4tv/j1M8w5Zag7dDzeUqLNxl41DPRXAyc+z7NFOPDHH6D+ADCermdBeHq93JexEDZDahhZDfOegLiFNhNtsKt5F6vz0QcjF7h6K71GjR9W6RWO+GymbZIlhpBNr8aD+kv/7ApssAtiUiyo8QZLoAPlxogATY+M93lYd63lRj6qI3Eu28qMNlq0RXelPhV8AQx/WKvqKORkH/wovHXP1XO5hyEsgvZ92uP0JH0KoCp8G+K6KX19qb0jnZjwHlnHV+Rw8rBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDD1l2TYavOBbpcay+NRjvipIZnfubHjgTmZykCYOBA=;
 b=p+UHAzBdOC5TMZDAufmq8EyTD9pLU4+vk+JRoY+qNNA8TTOv6GsAtQERVyRyuMdD8ZvPr2RKwugHKGYwt86HLhbwpFEGXczllHLk97yeQtqs4UhReIAUJfUH8vCQSByEZ8e5MvycwHYsCl1V1XXGVG3BVRmWUp5VvzZ7EBdoqeYvikXxWx/EWAQvktwdiLFTYlCr01L0YyqmnqwmPMSlIjoUAIx148IdkrL/ISjsDchX6ZYHr/AYQhzCu9cius3NddPMlQmlKaHYvK/5d2AO3+gQWs8ErFpMJEP4TIkvJBbbhlFG+55vQfair+APjzQey91isGCTTYvEBbZDlFhgXw==
Received: from SJ2P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::19)
 by MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:30:01 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::25) by SJ2P220CA0006.outlook.office365.com
 (2603:10b6:a03:5da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:30:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:00 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:39 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:39 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:31 -0700
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
Subject: [PATCH v3 06/31] gpu: nova-core: vgpu: initialize runtime parameters after GSP boot
Date: Mon, 28 Sep 2026 13:28:09 +0300
Message-ID: <6e4c39ce64df8fb9fe90640f2dc1330cee5ae8b3.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 634ff53c-f0d1-4e4c-f91e-08df1d4b73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|11062099010|3023799007|6133799003|10067099003|56012099006|11063799006|7136999003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SwHXZJzKlP806GudHBZ4UPP4e8mhGx43KROKeul8Y2HHeS0OLKfWAv7fP2eq+LJLZqP8ENYRNaxe/8NGIqwO/HLNsUdQMluI5ua7Q59EmLzp8sR37yWTvFSK2liP69SZkSK1BHdMO7fmL2Qz+AotLILAwkZo1NAw/ZYI6mwLF00aZ3x/Sc+RO9G97QHenbuydln6p1Kx04ZPhw6rixiuKtO8jTMqs0q7xkAKqI0zQUzbdhkf7t4Wh9QI190k97+Z7ealY3FGCsUKwBCXd+RSU1hjyDuzK4h4pKRcYkh48t2dyTC8cjxnWLgbqg2kspxlN1RctJW852OBqJwKAiT6B7fc/OoHqqqzCoM2w+39Fbs+V/Ha8nbfzBldsWRLrrSFuuZRSDcOE2/QIWUuQ2R2q0xlQGzL6QRKglNyYA6nwQTiDNvAyo3zqz4Lians6fcURqXxy5klDZUYv7bfsH5J802+kB7DNg82kM7dh7rxslm2Q76N60L02A5boztMj78otgq7M2Xv07j4QasMDvqy3txDIyFBdcRqJSg9JvSF2hwk6kHZ5RvpCpi6UAbpXUB5PAmuPVpSyIkaOz8ZgY/C7oAuzYN+lbF9Lkr7f+89jQfed/sFJPsIRcJG1R2oH3eNtQV6x3Frb9sXi2v+ayI0sWk3EIIehTnzQxvVlZw9gxoBTSMBlfv3ukvbP3xmllXSQS1WR1jf/JlCDpNUlc/vOA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11062099010)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(7136999003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QIACJiw9GEXkSb99PjqYGjAnWxl1IMXxfZPfwhebiqijuMfSxpkAOjUE+bY7Dpt5u1OXDktWxKoBKyZjNhwJL5UnOf8IsTnBeigxBrLwKIhcBFie+UqUl2ES4ADSKGZfpWL7+72IAumVM/eZcL9dSpI81rTkntaOvivDHOf0pDFwXkyTl5CV5nLvQE7rtOyqT3ayiWg2iMVNiYq4Zkm8N1DSiWQsewDLHLVlLdoeqeT5rGvDWN7wOmmhvwJWCIQMfjeG6Y4sGXOwOHg2aP7GTV3HCB1mirtJ/Fax9pvEBShC5x04ADB98j/VMroflVMOLfIKW8Or9527KjL4Gg5zqirBEfRGdZzwYD+EGZzDmQcq+xcSPDDk5ecdmfVaHs5uA8B2AzgAPJmLphu8Eq70QIXbCv4pebxzTQFxtAvQ2MIVOUmwBUrZ5vF6xBZVLvlC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:00.9572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 634ff53c-f0d1-4e4c-f91e-08df1d4b73b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

The vGPU manager needs the VMMU segment size and FIFO engine topology
returned by a successful GSP boot to divide instance resources.

Construct VgpuManager only for a vGPU-enabled boot. Retain the GPU-owned
channel pool, the ordered host-driven engine
list and the VMMU segment size. Expose the existing decoded VMMU value
from GspStaticInfo at its first consumer, preserving zero when firmware
omits the key.

Keep the runtime values in the manager for its instance module, and drop
the manager before the pool and memory resources it borrows.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             | 24 +++++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs    |  5 +++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  4 +--
 drivers/gpu/nova-core/vgpu.rs            | 36 +++++++++++++++++++++++-
 4 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c239b6614d44..11d9986c4b19 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -49,7 +49,10 @@
         VramAddress, //
     },
     num,
-    vgpu::VgpuState, //
+    vgpu::{
+        VgpuManager,
+        VgpuState, //
+    },
 };
 
 #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
@@ -323,6 +326,7 @@ fn static_info(&self) -> &gsp::commands::GspStaticInfo {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    vgpu: Option<VgpuManager<'gpu>>,
     /// GSP event interrupt registration.
     ///
     /// Must be kept declared *before* `gsp_resources`, so that the handler is unregistered, and
@@ -457,6 +461,24 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
+            vgpu: {
+                let info = &gsp_resources.boot_result.static_info;
+                match gsp_resources.vgpu_state {
+                    VgpuState::Disabled => None,
+                    VgpuState::Enabled { .. } => Some(VgpuManager::new(
+                        // SAFETY: `chid_pool` is initialized above at its final pinned address.
+                        // The private manager and its pool borrow cannot escape this `Gpu`.
+                        // Completed field drop order drops the manager before the pool; on failure,
+                        // pin-init drops it before the earlier-initialized pool.
+                        unsafe { &*core::ptr::from_ref(chid_pool.as_ref().get_ref()) },
+                        &info.fifo_engine_list(),
+                        info.vmmu_segment_size,
+                        TOTAL_CHANNELS,
+                    )),
+                }
+            },
+
+            // GSP boot left the SWGEN0 latch set and pending bits in the tree.
             _: {
                 irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vectors_ref)?;
             },
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 436ea52689b9..97e32f81a39b 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -34,7 +34,10 @@
     vgpu::VgpuState, //
 };
 
-pub(crate) use fw::commands::GspStaticInfo;
+pub(crate) use fw::commands::{
+    FifoEngineList,
+    GspStaticInfo, //
+};
 
 /// Builds the NVKV-encoded payload of a `GSP_INIT` request for `pdev`.
 ///
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 17ae4224e214..7381b30f3680 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -394,8 +394,7 @@ pub(crate) struct GspStaticInfo {
     gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
-    #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
-    vmmu_segment_size: u64,
+    pub(crate) vmmu_segment_size: u64,
     fifo_engine_count: FifoEngineCount,
     fifo_engine_gmc_ids: [u32; MAX_FIFO_ENGINES],
     fifo_engine_flags: [u32; MAX_FIFO_ENGINES],
@@ -464,7 +463,6 @@ pub(crate) fn total_fb_end(&self) -> Option<u64> {
     }
 
     /// Returns the host-driven engines in their firmware FIFO order.
-    #[expect(dead_code)]
     pub(crate) fn fifo_engine_list(&self) -> FifoEngineList {
         // INVARIANT: The list starts empty and appends at most one ID per supported input slot.
         let mut fifo_engine_list = FifoEngineList {
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index b405ba49c490..5cd82adeb0f8 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -13,7 +13,11 @@
         Fsp,
         VgpuMode, //
     },
-    gpu::Chipset, //
+    gpu::{
+        ChannelIdPool,
+        Chipset, //
+    },
+    gsp::commands::FifoEngineList, //
 };
 
 mod hal;
@@ -80,3 +84,33 @@ fn query_state(
         }
     }
 }
+
+/// Runtime resources for an enabled vGPU boot.
+pub(crate) struct VgpuManager<'gpu> {
+    #[expect(dead_code)]
+    chid_pool: &'gpu ChannelIdPool,
+    /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
+    #[expect(dead_code)]
+    vmmu_segment_size: u64,
+    #[expect(dead_code)]
+    total_channels: u32,
+    #[expect(dead_code)]
+    fifo_engine_list: FifoEngineList,
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Retains runtime parameters from a completed vGPU-enabled GSP boot.
+    pub(crate) fn new(
+        chid_pool: &'gpu ChannelIdPool,
+        fifo_engine_list: &FifoEngineList,
+        vmmu_segment_size: u64,
+        total_channels: u32,
+    ) -> Self {
+        Self {
+            chid_pool,
+            vmmu_segment_size,
+            total_channels,
+            fifo_engine_list: *fifo_engine_list,
+        }
+    }
+}
