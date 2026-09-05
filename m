Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751B445AFC
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595931; cv=fail; b=KiT87IzVwv79+15bI7AcMvBT6lwgpWuNyWrjO9M4Zs894NyLMA+w66QeJ+802t83xcj1rFZZcMBO3bfFm8spF6e3oUAoEvNaOzzN31cK1W2sXk4G34JGwZB+2qVSvlQY7b5Srt64WhKPSUmtoc19XaQs8Hqabj9YJ3qqkEkZ1wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595931; c=relaxed/simple;
	bh=fkdnXwijyk56Cqmb2CglJHNXy3bmK+IwlvUaREtY06A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yfw7k8XGvTCtT2OUxcVZPvVGa+++rOqTlz6RECnanQiWbg5JhI3iPbf2UeDespIbDcYJhiKwPhP2ovgBS+bRibZYnGhiz810xpiI3bfY60JL+CQEqDRx9rPDw+YZZdMKh4hCkl47ubYRTVDew5WBxV/D1EGbAUw1Vi0luLVC/hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ff6y+FDd; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ff6y+FDd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD55MiF1Wcinfb3pbD0H+hieq8UD4rcaa9l9Aitk7w8BmP9kne60ktF9EMOE+BWyhBYb/ydAD2jS9loUQDm74ydQKLZsFaznow3fimAe2dyeDxsCLAtfES8Qn5q1Vtlyka8hn0agwFtUQYuTr5iXWB8ali8F84fV8XxYnrTJ+0AJVah2OPSqNn6YLB1eIxSXsCcuYRW2BBJ5nnbA5fJIXDLMzsq9JlPLW+fwSg2+jLLNwH6D+zED+f7L15k9GFppkYEFFsv0rvaaMBJwOyCmPlTYOWDyfyyTWDLD8ttE/AOd6r1LJgLpKSvPtRtd9AmMwsTH+71wfAg5V7ZQS9Durg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLgepbeukrqZsTIMextLQ8luzarRFfO5/p+eDLqZ3ow=;
 b=V4z7DY3MC0AKrHtH6xFvqcxXoGwfCVfMcpk02l6KoP4NhW/3u2V/8/hyYe7IV7SlzOo0eHVAz7iNMt13JxJOc6obWNj95sZxbRe6RDySE/WdESErsxsCyvcoGEG/uzSV6/W4syHF1QHwwKZxPVnsM/JFq9pwNerZycEUQi4WgPcDeUQxRsUjKff2mEOLChdJdjD3+ySMOLfDE+BXXIoDbbZ8RFihLFzxIV96P5JFM26boYssYrJVotPIzUIrhW9Z6AU3tR7oHQRrVfKwg15598E7oRdSsvrchZ66pRNZ07JQsQOL0YltxnXJqeaP+SG8RynvuQDQPuq45M0X6efr1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLgepbeukrqZsTIMextLQ8luzarRFfO5/p+eDLqZ3ow=;
 b=Ff6y+FDdECKvpYXRv16nsdCnLM7X5PT7SaRC7th89Urv+R214NHA8RBsyslRxOs4A/uBYbxKFBhCdctOmq9P54jjF2QHkirm05t/QDVyQg9dwrSnfDJqG3IbtnUuEULYqrVFrA5D4jf6OiS7SPZNXOHQm0tkUw16WEtoaIMXmomleXVgkXcqp2ct0VkPs3/OYAyQfw8HGyYUidthUCB3rNy0dR8hzco0AGQ+Z72ySHe3jE0vxUHmOsDe5ioxBPmq9jB09a0IgQjIpNW/tvnG+ZCHaL5pg7HfhxiCxEIiSsmwrTP2tT7UNnZz8la+KKUyeWfSm2pTmqbRaUX7DH16fw==
Received: from MN2PR22CA0004.namprd22.prod.outlook.com (2603:10b6:208:238::9)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:11:50 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::9d) by MN2PR22CA0004.outlook.office365.com
 (2603:10b6:208:238::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:11:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:11:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:35 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:35 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:11:27 -0700
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
Subject: [PATCH 01/13] gpu: nova-core: vgpu: add post-GSP-boot vGPU initialization
Date: Sat, 5 Sep 2026 11:11:04 +0300
Message-ID: <20260905081116.106613-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905081116.106613-1-zhiw@nvidia.com>
References: <20260905081116.106613-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: b9791f88-a883-48aa-6c97-08df0b255620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|56012099006|6133799003|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9ULiSAe2qTHj3zzoBHSRyjUaqCOluTsZt6aD0aB5F7e44SEvBLXKClQK3Y+JW6e1MW2CskGmOX5RjZRkRoZrooOAmPhiwQvLkAe2w5awat3KnKQNEz5ZZgBPtNOxMi1JMMFgfql4pKK14k293dk15zepXA/BhKkzvNIAVxHqPmqtPxmMEMANXvxyHT/i9Tljt6CTP+nS+rsFRdLNyVnogPuz/sYJnXjkcEsUFzeaHVB0l8YGezQGSxSJIhehFN85N4lr7dT66fFT2L0YhFOcHmomgqGKJSkHpDuH7jtYPHngneYTZBLVXXUPbpcUt111HOkvFkV8Z1vRzR/ACWUT8Fe4S7o0RRZr1Qemw4yUciXXIvBqvfoqLwqcrPGJF8FgPYrqhj3CctGlVrSiVjOGEOdvDwBGFpN/6qlr3LrPhiaImv+B7F/ScVD46CZcsweomBUWlSUnO1WRdKoZTGccWfBek7uDTOqIba6Y8vesNs0/EahOCKKp5CxoHF2FYjl5w6MoUMKReaxXoIDtDf5WK8m5Bsc834ViKNCEAV+9oMrEkpSq5cJVALncEyLzLdBrCwV5mhpcij/7JbrQz1tJaC2yxUlrwFeEWg21iiWD14w+7iJOwUi/1ivKaH2GV59a5FNoq+S5HDQLEBdaYLiB3hLVvFftsNgqnFHPA4Xl8OlEMJmH3awn2zBhGQ2w5IAofj3N/ecMAPz9LfhJOiFw/Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(56012099006)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nCaOocKd7xwD3PKADw0gHwWbLsXbZCqXuELMpXlSWt8BRP0Q7DOMkHNbETS/Gz26WElFcEzc3n9+azV9yumGJma9dyXYb+PwiQIYfPkl4yvaTHOAWfgy3DcYYPQMaraWLEqe7ihJeD3pgzHZKy9GbzClpubXvxuBGHCD3zFlulaWo31IRt12E0PuJqWKeA04zJAtBjkT4mo0i7p6/G64Y5sOZJmbPZuVW+vF1VadbXpn4twne93/iqJaFJqIBKRPTLUazJpK1qE48EZmBgYK2uGbtut7gwOZWyowlV66z6/DlCVOdM2VD0YjqN+uo7YITe3eYpGHJdEFvByt4IaVeuv0wLIJRuV9sHTErVrfFJ7BPmBYeH/rOVjls7goQW0uZQ8DOJCyuELtIuWIeDyLQSqqAGOtQ13QWw1/i92Vi6y4kJMAUTn60tw3DwrOGrCO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:11:49.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9791f88-a883-48aa-6c97-08df0b255620
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382

GSP-RM does not expose the parameters needed to divide resources among
vGPU instances until GSP_INIT completes. Before this point VgpuManager
only knows whether vGPU mode is enabled, so it cannot provide the engine
topology, VMMU alignment, or channel capacity required by instance
management.

Decode the VMMU segment size and ordered FIFO engine table from the typed
GSP_INIT NVKV response. Retain only host-driven engines while preserving
hardware FIFO order. After a successful GSP_INIT, initialize the manager
with these values and the 2048-channel capacity, but retain them only when
vGPU mode is enabled.

Move VgpuManager into Gpu and let it borrow the pinned ChannelIdPool.
Create that pool with the same channel capacity, order the Gpu fields so
the manager is dropped before the memory manager, GSP resources, and its
channel pool, and pass it separately to GSP boot so unload resources do
not retain a manager reference. Keep a copy of the detected mode in the
GPU-owned GSP runtime data instead of passing it through the HAL calls.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             |  53 ++++++---
 drivers/gpu/nova-core/gpu/channel.rs     |   3 +
 drivers/gpu/nova-core/gsp.rs             |  12 +-
 drivers/gpu/nova-core/gsp/boot.rs        |  13 ++-
 drivers/gpu/nova-core/gsp/commands.rs    |  33 ++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs |  36 ++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs   |   2 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs   |   2 +-
 drivers/gpu/nova-core/vgpu.rs            |  91 ---------------
 drivers/gpu/nova-core/vgpu/mod.rs        | 139 +++++++++++++++++++++++
 10 files changed, 274 insertions(+), 110 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/mod.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2105e993ee60..a2189589422a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -53,6 +53,11 @@
 mod channel;
 mod hal;
 
+pub(crate) use self::channel::{
+    ChannelIdPool,
+    TOTAL_CHANNELS, //
+};
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -291,8 +296,6 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
-    /// vGPU state detected before GSP boot.
-    vgpu: VgpuManager,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp,
@@ -304,6 +307,10 @@ struct GspResources<'gpu> {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    /// vGPU state and firmware parameters.
+    ///
+    /// Declared before MM and BAR1 so live instances are torn down before their resources.
+    vgpu: VgpuManager<'gpu>,
     /// GPU memory manager owning memory management resources.
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
@@ -314,6 +321,11 @@ pub(crate) struct Gpu<'gpu> {
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
+    /// Channel ID pool borrowed by the vGPU manager and its live instances.
+    ///
+    /// Declared after `vgpu` so the manager is dropped before the pool.
+    #[pin]
+    chid_pool: ChannelIdPool,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     ///
@@ -342,7 +354,6 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
-                    vgpu: &*this.vgpu,
                 },
                 bundle,
             )
@@ -402,6 +413,18 @@ pub(crate) fn new(
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
+            chid_pool <- ChannelIdPool::new(cv!(TOTAL_CHANNELS as usize)),
+
+            // TODO: Use `&chid_pool` self-referential pin-init syntax once available.
+            //
+            // SAFETY: `chid_pool` is initialized before this expression and lives at a pinned
+            // stable address. Field order drops `vgpu` before `chid_pool`, including unwind of
+            // an incomplete initializer.
+            vgpu: VgpuManager::new(
+                // SAFETY: The lifetime and drop-order rationale above covers this borrow.
+                unsafe { &*core::ptr::from_ref(chid_pool.as_ref().get_ref()) },
+            ),
+
             gsp_resources <- try_pin_init!(GspResources {
                 device: pdev,
 
@@ -420,22 +443,26 @@ pub(crate) fn new(
 
                 fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
-                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
+                _: {
+                    vgpu.detect_state(pdev, spec.chipset, fsp.as_mut());
+                },
 
-                gsp <- Gsp::new(pdev, spec.chipset),
+                gsp <- Gsp::new(pdev, spec.chipset, vgpu.state()),
 
                 // This member must be initialized last, so the unload bundle can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
                 // is properly run in case of failure.
-                boot_result: gsp.boot(GspBootContext {
-                    pdev,
-                    bar,
-                    chipset: spec.chipset,
-                    gsp_falcon,
-                    sec2_falcon,
-                    fsp: fsp.as_mut(),
+                boot_result: gsp.boot(
+                    GspBootContext {
+                        pdev,
+                        bar,
+                        chipset: spec.chipset,
+                        gsp_falcon,
+                        sec2_falcon,
+                        fsp: fsp.as_mut(),
+                    },
                     vgpu,
-                })?,
+                )?,
             }),
 
             _: {
diff --git a/drivers/gpu/nova-core/gpu/channel.rs b/drivers/gpu/nova-core/gpu/channel.rs
index 485efaba059d..9bf2edddca03 100644
--- a/drivers/gpu/nova-core/gpu/channel.rs
+++ b/drivers/gpu/nova-core/gpu/channel.rs
@@ -21,6 +21,9 @@
     }, //
 };
 
+/// Total channel ID capacity available to vGPU instances.
+pub(crate) const TOTAL_CHANNELS: u32 = 2048;
+
 /// Pool for tracking reservations of channel IDs.
 #[pin_data]
 pub(crate) struct ChannelIdPool {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 700842240c22..deaae033a88f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -60,7 +60,7 @@
         fw::GspArgumentsPadded, //
     },
     num,
-    vgpu::VgpuManager, //
+    vgpu::VgpuState, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -79,7 +79,6 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
     pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
     pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
     pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
-    pub(crate) vgpu: &'ctx VgpuManager,
 }
 
 impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
@@ -282,6 +281,8 @@ struct LogBuffers {
 pub(crate) struct Gsp {
     /// Preloaded GSP firmware TLV metadata used during boot.
     gsp_tlv: kernel::firmware::Firmware,
+    /// vGPU mode detected before GSP boot.
+    vgpu_state: VgpuState,
     /// Libos arguments.
     pub(crate) libos: Coherent<[LibosMemoryRegionInitArgument]>,
     /// Log buffers for all LIBOS3 tasks, exposed via debugfs.
@@ -300,6 +301,7 @@ impl Gsp {
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         chipset: Chipset,
+        vgpu_state: VgpuState,
     ) -> impl PinInit<Self, Error> + '_ {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
@@ -323,6 +325,7 @@ pub(crate) fn new(
 
             Ok(try_pin_init!(Self {
                 gsp_tlv,
+                vgpu_state,
                 cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 rmargs: Coherent::init(
@@ -398,6 +401,11 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the vGPU mode detected for this boot.
+    pub(crate) const fn vgpu_state(&self) -> VgpuState {
+        self.vgpu_state
+    }
+
     /// Returns a shared handle to the GSP command queue.
     pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
         self.cmdq.clone()
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 9c4d25f609de..2d027d2a9a35 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -37,6 +37,7 @@
         gsp::GspFirmware,
         radix3::Radix3, //
     },
+    gpu::TOTAL_CHANNELS,
     gsp::{
         cmdq::{
             Cmdq,
@@ -52,7 +53,8 @@
         }, //
     },
     num,
-    regs, //
+    regs,
+    vgpu::VgpuManager, //
 };
 
 impl super::Gsp {
@@ -72,6 +74,7 @@ impl super::Gsp {
     pub(crate) fn boot(
         self: Pin<&mut Self>,
         mut ctx: super::GspBootContext<'_, '_>,
+        vgpu: &mut VgpuManager<'_>,
     ) -> Result<super::BootResult> {
         let pdev = ctx.pdev;
         let bar = ctx.bar;
@@ -128,7 +131,7 @@ pub(crate) fn boot(
         // the registry keys ride inside that one request. Its reply is also what says GSP-RM has
         // finished starting, and the load-and-execute events it raises first are dispatched as
         // they arrive.
-        let init_payload = commands::build_gsp_init_payload(pdev, chipset, ctx.vgpu.state())?;
+        let init_payload = commands::build_gsp_init_payload(pdev, chipset, self.vgpu_state())?;
         // Only the chipsets that raise `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` are shipped a
         // `gen_bootloader.tlv`, so requesting it elsewhere fails the whole boot with `ENOENT`.
         let bootloader = if super::hal::uses_generic_bootloader(chipset) {
@@ -155,6 +158,12 @@ pub(crate) fn boot(
                 )
             })?;
 
+        vgpu.init(
+            &static_info.fifo_engine_list,
+            static_info.vmmu_segment_size,
+            TOTAL_CHANNELS,
+        );
+
         Ok(super::BootResult::new(
             unload_guard.dismiss().1,
             static_info,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 02bb9d653253..89369ff23b85 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -49,6 +49,19 @@
     vgpu::VgpuState, //
 };
 
+/// Upper bound on entries in the hardware FIFO engine table.
+pub(crate) const MAX_FIFO_ENGINES: usize = 64;
+
+/// Bit mask for `NVGMC_SC_ENGINE_FLAGS_IS_HOST_DRIVEN` (bits 0:0).
+const ENGINE_FLAGS_IS_HOST_DRIVEN: u32 = 1 << 0;
+
+/// Ordered list of host-driven GMC engine IDs from the hardware FIFO engine table.
+#[derive(Copy, Clone)]
+pub(crate) struct FifoEngineList {
+    pub(crate) gmc_ids: [u32; MAX_FIFO_ENGINES],
+    pub(crate) count: usize,
+}
+
 /// The static GPU configuration, as decoded from the `GSP_INIT` reply.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
@@ -58,6 +71,10 @@ pub(crate) struct GetGspStaticInfoReply {
     pub(crate) usable_fb_regions: KVec<Range<u64>>,
     /// Exclusive end of the FB physical address space.
     pub(crate) total_fb_end: u64,
+    /// VMMU segment size reported by GSP-RM, in bytes.
+    pub(crate) vmmu_segment_size: u64,
+    /// Ordered host-driven FIFO engine GMC IDs.
+    pub(crate) fifo_engine_list: FifoEngineList,
 }
 
 /// Error type for [`GetGspStaticInfoReply::gpu_name`].
@@ -289,12 +306,28 @@ fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
         usable_fb_regions.push(region, GFP_KERNEL)?;
     }
     let total_fb_end = decoded.total_fb_end().ok_or(EINVAL)?;
+    let vmmu_segment_size = decoded.vmmu_segment_size();
+    let fifo_count = decoded.fifo_engine_count();
+    let raw_ids = decoded.fifo_engine_gmc_ids();
+    let raw_flags = decoded.fifo_engine_flags();
+    let mut fifo_engine_list = FifoEngineList {
+        gmc_ids: [0; MAX_FIFO_ENGINES],
+        count: 0,
+    };
+    for index in 0..fifo_count {
+        if raw_flags[index] & ENGINE_FLAGS_IS_HOST_DRIVEN != 0 {
+            fifo_engine_list.gmc_ids[fifo_engine_list.count] = raw_ids[index];
+            fifo_engine_list.count += 1;
+        }
+    }
 
     Ok(GetGspStaticInfoReply {
         gpu_name,
         bar1_pde_base: decoded.bar1_pde_base(),
         usable_fb_regions,
         total_fb_end,
+        vmmu_segment_size,
+        fifo_engine_list,
     })
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 22e4546142f0..1610b005199f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -26,6 +26,7 @@
     Encodeable,
     Encoder,
     Index,
+    Indexed,
     Key,
     KeyId,
     Required, //
@@ -295,6 +296,14 @@ pub(crate) struct GspInitResponseSchema => GspInitResponse {
         fb_regions: Accumulated<FbRegionSchema>,
         bar1_pde_base: Required<u64, { Self::BAR1_PDE_BASE_KEY }>,
         vmmu_segment_size: Key<u64, { Self::VMMU_SEGMENT_SIZE_KEY }>,
+        fifo_engine_count: Key<u32, { Self::FIFO_ENGINE_COUNT_KEY }>,
+        fifo_engine_gmc_ids: Indexed<
+            u32,
+            { GspInitResponse::MAX_FIFO_ENGINES },
+            { Self::FIFO_ENGINE_GMC_ENGINE_ID_KEY },
+        >,
+        fifo_engine_flags:
+            Indexed<u32, { GspInitResponse::MAX_FIFO_ENGINES }, { Self::FIFO_ENGINE_FLAGS_KEY }>,
     }
 }
 
@@ -303,6 +312,9 @@ impl GspInitResponseSchema {
     const GPU_NAME_STRING_KEY: KeyId = 0x2000;
     const BAR1_PDE_BASE_KEY: KeyId = 0x1020;
     const VMMU_SEGMENT_SIZE_KEY: KeyId = 0x1050;
+    const FIFO_ENGINE_COUNT_KEY: KeyId = 0x0500;
+    const FIFO_ENGINE_GMC_ENGINE_ID_KEY: KeyId = 0x0501;
+    const FIFO_ENGINE_FLAGS_KEY: KeyId = 0x0502;
 }
 
 /// Payload of the `GSP_INIT` response.
@@ -312,10 +324,14 @@ pub(crate) struct GspInitResponse {
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
     vmmu_segment_size: u64,
+    fifo_engine_count: u32,
+    fifo_engine_gmc_ids: [u32; Self::MAX_FIFO_ENGINES],
+    fifo_engine_flags: [u32; Self::MAX_FIFO_ENGINES],
 }
 
 impl GspInitResponse {
     pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
+    const MAX_FIFO_ENGINES: usize = 64;
 
     /// A region with no tag is general-purpose memory. A tagged region is reserved for a
     /// firmware-internal use that the tag identifies.
@@ -358,6 +374,26 @@ pub(crate) fn total_fb_end(&self) -> Option<u64> {
             .max()?
             .checked_add(1)
     }
+
+    /// Returns the VMMU segment size reported by GSP-RM.
+    pub(crate) const fn vmmu_segment_size(&self) -> u64 {
+        self.vmmu_segment_size
+    }
+
+    /// Returns the count of FIFO engines reported by GSP-RM.
+    pub(crate) fn fifo_engine_count(&self) -> usize {
+        (self.fifo_engine_count as usize).min(Self::MAX_FIFO_ENGINES)
+    }
+
+    /// Returns the raw array of GMC engine IDs from the FIFO engine table.
+    pub(crate) fn fifo_engine_gmc_ids(&self) -> &[u32; Self::MAX_FIFO_ENGINES] {
+        &self.fifo_engine_gmc_ids
+    }
+
+    /// Returns the raw array of per-engine flags from the FIFO engine table.
+    pub(crate) fn fifo_engine_flags(&self) -> &[u32; Self::MAX_FIFO_ENGINES] {
+        &self.fifo_engine_flags
+    }
 }
 
 nvkv_decode! {
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index e283429a95dd..41c18d623b7a 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -151,7 +151,7 @@ fn boot(
         let chipset = ctx.chipset;
         let gsp_falcon = ctx.gsp_falcon;
 
-        let fb_sizes = FbSizes::new(chipset, ctx.bar, ctx.vgpu.state())?;
+        let fb_sizes = FbSizes::new(chipset, ctx.bar, gsp.vgpu_state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_sizes);
 
         let wpr_meta =
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 74ea172726cb..bd47787348c8 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -259,7 +259,7 @@ fn boot(
         let gsp_falcon = ctx.gsp_falcon;
         let sec2_falcon = ctx.sec2_falcon;
 
-        let fb_ranges = FbRanges::new(chipset, bar, gsp_fw, ctx.vgpu.state())?;
+        let fb_ranges = FbRanges::new(chipset, bar, gsp_fw, gsp.vgpu_state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_ranges);
 
         // Declared before the unload guard so that if Booter fails while running, SEC2 is reset
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
deleted file mode 100644
index 6b7e045acea8..000000000000
--- a/drivers/gpu/nova-core/vgpu.rs
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-use core::num::NonZero;
-
-use kernel::{
-    device,
-    pci,
-    prelude::*, //
-};
-
-use crate::{
-    fsp::{
-        Fsp,
-        VgpuMode, //
-    },
-    gpu::Chipset, //
-};
-
-mod hal;
-
-/// vGPU state detected during GPU construction.
-#[derive(Debug, Clone, Copy)]
-pub(crate) enum VgpuState {
-    /// vGPU mode is not enabled for this boot.
-    Disabled,
-    /// vGPU mode is enabled for this boot.
-    Enabled {
-        /// Total number of SR-IOV VFs supported by this device.
-        total_vfs: NonZero<u16>,
-    },
-}
-
-/// vGPU state manager.
-pub(crate) struct VgpuManager {
-    state: VgpuState,
-}
-
-impl VgpuManager {
-    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU knob.
-    pub(crate) fn new(
-        pdev: &pci::Device<device::Core<'_>>,
-        chipset: Chipset,
-        fsp: Option<&mut Fsp<'_>>,
-    ) -> Self {
-        let state = Self::detect_state(pdev, chipset, fsp).unwrap_or_else(|e| {
-            dev_warn!(
-                pdev,
-                "vGPU state detection failed: {:?}; disabling vGPU\n",
-                e
-            );
-            VgpuState::Disabled
-        });
-        dev_dbg!(pdev, "vGPU state: {:?}\n", state);
-
-        Self { state }
-    }
-
-    /// Detects the vGPU state from the chipset, SR-IOV capability and FSP PRC knob.
-    fn detect_state(
-        pdev: &pci::Device<device::Core<'_>>,
-        chipset: Chipset,
-        fsp: Option<&mut Fsp<'_>>,
-    ) -> Result<VgpuState> {
-        if !hal::vgpu_hal(chipset).supports_vgpu() {
-            return Ok(VgpuState::Disabled);
-        }
-
-        let Some(total_vfs) = pdev.sriov_get_totalvfs() else {
-            return Ok(VgpuState::Disabled);
-        };
-
-        if total_vfs.get() < 2 {
-            // The current vGPU path does not support single-VF SR-IOV devices yet.
-            // Treat one total VF as vGPU-disabled for now; single-VF support can relax
-            // this gate once the manager handles that topology.
-            return Ok(VgpuState::Disabled);
-        }
-
-        let fsp = fsp.ok_or(ENODEV)?;
-
-        match fsp.read_vgpu_mode(pdev.as_ref())? {
-            VgpuMode::Enabled => Ok(VgpuState::Enabled { total_vfs }),
-            VgpuMode::Disabled => Ok(VgpuState::Disabled),
-        }
-    }
-
-    /// Returns the detected vGPU state for this boot.
-    pub(crate) fn state(&self) -> VgpuState {
-        self.state
-    }
-}
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
new file mode 100644
index 000000000000..1354c662a507
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use core::num::NonZero;
+
+use kernel::{
+    device,
+    pci,
+    prelude::*, //
+};
+
+use crate::{
+    fsp::{
+        Fsp,
+        VgpuMode, //
+    },
+    gpu::{
+        ChannelIdPool,
+        Chipset, //
+    },
+    gsp::commands::FifoEngineList, //
+};
+
+mod hal;
+
+/// vGPU state detected during GPU construction.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum VgpuState {
+    /// vGPU mode is not enabled for this boot.
+    Disabled,
+    /// vGPU mode is enabled for this boot.
+    Enabled {
+        /// Total number of SR-IOV VFs supported by this device.
+        total_vfs: NonZero<u16>,
+    },
+}
+
+/// vGPU state manager.
+pub(crate) struct VgpuManager<'gpu> {
+    /// Channel ID pool the per-VF areas are reserved from.
+    #[expect(dead_code)]
+    pub(crate) chid_pool: &'gpu ChannelIdPool,
+    state: VgpuState,
+    vmmu_segment_size: Option<u64>,
+    total_channels: Option<u32>,
+    fifo_engine_list: Option<FifoEngineList>,
+}
+
+impl<'gpu> VgpuManager<'gpu> {
+    /// Creates an empty vGPU manager for initialization during GPU construction.
+    pub(crate) const fn new(chid_pool: &'gpu ChannelIdPool) -> Self {
+        Self {
+            chid_pool,
+            state: VgpuState::Disabled,
+            vmmu_segment_size: None,
+            total_channels: None,
+            fifo_engine_list: None,
+        }
+    }
+
+    /// Detects and stores vGPU state before GSP boot.
+    pub(crate) fn detect_state(
+        &mut self,
+        pdev: &pci::Device<device::Core<'_>>,
+        chipset: Chipset,
+        fsp: Option<&mut Fsp<'_>>,
+    ) {
+        let state: Result<VgpuState> = (|| {
+            if !hal::vgpu_hal(chipset).supports_vgpu() {
+                return Ok(VgpuState::Disabled);
+            }
+
+            let Some(total_vfs) = pdev.sriov_get_totalvfs() else {
+                return Ok(VgpuState::Disabled);
+            };
+
+            if total_vfs.get() < 2 {
+                // The current vGPU path does not support single-VF SR-IOV devices yet.
+                // Treat one total VF as vGPU-disabled for now; single-VF support can relax
+                // this gate once the manager handles that topology.
+                return Ok(VgpuState::Disabled);
+            }
+
+            let fsp = fsp.ok_or(ENODEV)?;
+
+            match fsp.read_vgpu_mode(pdev.as_ref())? {
+                VgpuMode::Enabled => Ok(VgpuState::Enabled { total_vfs }),
+                VgpuMode::Disabled => Ok(VgpuState::Disabled),
+            }
+        })();
+
+        self.state = state.unwrap_or_else(|e| {
+            dev_warn!(
+                pdev,
+                "vGPU state detection failed: {:?}; disabling vGPU\n",
+                e
+            );
+            VgpuState::Disabled
+        });
+        dev_dbg!(pdev, "vGPU state: {:?}\n", self.state);
+    }
+
+    /// Returns the detected vGPU state for this boot.
+    pub(crate) fn state(&self) -> VgpuState {
+        self.state
+    }
+
+    /// Initializes the runtime parameters returned by GSP_INIT.
+    pub(crate) fn init(
+        &mut self,
+        fifo_engine_list: &FifoEngineList,
+        vmmu_segment_size: u64,
+        total_channels: u32,
+    ) {
+        if matches!(self.state, VgpuState::Enabled { .. }) {
+            self.vmmu_segment_size = Some(vmmu_segment_size);
+            self.total_channels = Some(total_channels);
+            self.fifo_engine_list = Some(*fifo_engine_list);
+        }
+    }
+
+    /// Returns the firmware-reported VMMU segment size when vGPU is enabled.
+    #[expect(dead_code)]
+    pub(crate) const fn vmmu_segment_size(&self) -> Option<u64> {
+        self.vmmu_segment_size
+    }
+
+    /// Returns the number of channel IDs available to vGPU instances.
+    #[expect(dead_code)]
+    pub(crate) const fn total_channels(&self) -> Option<u32> {
+        self.total_channels
+    }
+
+    /// Returns the ordered FIFO engine list provided by GSP_INIT.
+    #[expect(dead_code)]
+    pub(crate) fn fifo_engine_list(&self) -> Result<&FifoEngineList> {
+        self.fifo_engine_list.as_ref().ok_or(ENODEV)
+    }
+}
-- 
2.53.0

