Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114B43E4BF
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595965; cv=fail; b=FN3DXjLFM9YfQiBXl+yw/4GCRgXbrKIj0GL6D5vQUvnAMR+U3OzA6MbxrigyMZr0nJza81zf9CoAqMDmZKv+bltIN3FMYDotETbWsES/9tOnaNxR490i9UvjeCkOlqIAl87BUw9wQhxFS+PJV1m7kxLZ1TkK/OUI+3pCgW5Ehv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595965; c=relaxed/simple;
	bh=4jTL3etnevye+v7Q5z1i63YfnocpKgUQp3T9B2KxqUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZN8b8fNem3d1givO+RPc6ZCpaV1LNRyO1bpnNQivH2hSwOAt9xr2x2HBlnM1onUmzH53kFYfTdwBIocWMjZEYD5aGBur5FQE7MSMp7CbHZufa+c1+5nJHl6pEkPqoE3hpzKXIiqfN+JKuygKH+ztDxz/6Ssr3xucAnr8uHNdzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aa0/zNR1; arc=fail smtp.client-ip=40.93.196.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aa0/zNR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET6eCnwysY8b1ubMRygDTokK2DlcQdAgjo3eNhkchth+JDf2xZwclDR+WsNqXlMeyrmdVoDFspO4D3hLzCjWKE+zPQo+VS6SBTp1iEwmu/W/2oIZIuoN7ucDnbGuFt/9/ahuExJx6CpmfTtTbIFQg3kG7obB1UCysZbgHK6EGYi58w9vTobudIXj+vECqIwYgATcU02Cjf0n9Bh1frqWMt3vennWrLkVNOm4uHCY0S2Bol+kstPciO0R3A54zmWiNiTNw2sgZnM/oh50idHi9DHwBiNEu9Emi2UEsQDhr+y9V/LeH5al5u8XNc0xaSTmG2h73/ONJV4Abc3JaLSJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoHGQ0BYbdB/AuwOxXemjLUJGvqsi9sLB8EU7EFFy/w=;
 b=bb40VBWdXUCM7TCf2MjTY7FAWkYFTUJGG7tBb7p3XKlkDVrTWdzIP/JPqyDUmRUbgaittONHj5t5i1aAzKRoR2+xB3A9mym0QoOUlUO8G8L6UfLGHzJwVpepHbUH4VDg4VMzWfVAcG7T7mGa4EeIUMNV6JYN1lB+eYTP8oDHys2dVgh6Q3uHWTOE9rn0UO/TAlT+UaLPUMFaBXyFwmzuEEl3eFQ1UklJ1G9VzF3RbYeT7z7Gj5Rmxj2zcAHtmc3CHaLR/oy7ojj6EvdhvyG6kYBkLVsJ20nVTlx03i5b4NrMWHyANJKbBxEf7WfNPCwTCfTrLU+SlT+qGp/+eyhmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoHGQ0BYbdB/AuwOxXemjLUJGvqsi9sLB8EU7EFFy/w=;
 b=aa0/zNR172+cFV9wyc1pSJzdHPrfd9niIuDI6gmvc4Htch5YvrDeEn7hB2x0UgZ+yrPXlke8V8aasB0xrFV46jkXj/egaJboDTirxKwBmmbexlMNTPXVy0KdfkeMTdIKmwBuWkAtBIEcXtcz02E8wgstoQLQiW1quNv7v1NjhKub8hNm/XpIpA8DIz02pNV8LQNjOTZK8hkog5vlc9g/WXxkTW+egksye7zuYTvAKW0GhfPoLKa10P3YXukXS/F8A2hJzmNWeDnD9MIge4ZJ+OYzq+cRkqS64geQxRXvwW12wWyUGhra6Cq9v6Ky7H1lykgJlD4u9a4FESsfLTbNKQ==
Received: from BN9PR03CA0122.namprd03.prod.outlook.com (2603:10b6:408:fe::7)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 08:12:25 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::7f) by BN9PR03CA0122.outlook.office365.com
 (2603:10b6:408:fe::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:11 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:10 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:02 -0700
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
Subject: [PATCH 05/13] gpu: nova-core: vgpu: add instance create/destroy
Date: Sat, 5 Sep 2026 11:11:08 +0300
Message-ID: <20260905081116.106613-6-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b4fe56-b842-4f9c-0004-08df0b256b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|23010399003|82310400026|22082099003|6133799003|3023799007|10067099003|5023799004|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	tFIUjq+a+KJs/badD6WH/BP6ypd7MSi6Ce2qxGVNYbkjWJ7OFwO32Yp16KufdQbxAwS2ZXVf/cHOoQIrsARlCtP+K9dWDUZJkp2ZqNt/ZRkZAqY2Agn2RTcD8NxRw9I0cIfBpyN6RFgwVlbf3XrcAHWlLy+KJd5ZL36EjYGMwWVoA02XjRHUHsFe+p0lLh8zl0MjEZuP4RpgjK/pA/mf20h2ii3xBFmB24QQuYT36kRWL9g6fTZ2od8MVRg6DflECvEuIR+uhxI2IJQ0m0/v5uWvV6PAHBAEdnN42RO4VL+Wzaqhoh6fC07H2iGJLRlDqTYSNJ3Pn0V/vyxhuol6wNxw40NdnUxNWCvl6hYwqLCUcZnBgioSZJkxXX0OeAURMgiHZ+zM1l8ihGTjK7RFb8yS0eywm2PRpdIb3h2Jd6D4Kb4SNnDATSMKx110cOzGSIlbUV5I+AiO6JIfVU+5SbnAsZeDR7pOduC3U2rIkKg79uJJHGQth5SJVuRUrsHUnPfG4YEI3FBXJT40nAFeWjH5MyqlYq7SkryhcxxA91dXjKgXjukM3CshKStYktLyWK5h0pi2fhMxBpIA2H3f4BRj4JbzKunSNrBwDQA38JXVVVQTid/qZ2X8Ek+0LtJ5jEsfvqY7qE1syuHPH8z9npmEQjw1I4ffQgfg5ODwzfQ+fpZ6TnUR5d5n3J0dXtPLked49bIEipViHCtPMadeYQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(22082099003)(6133799003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Wnb1+ZUs1ioUhtxFrD4nJs6IujZ9JgobEblkxN9xbECma3yfNZUVkWh2V+eFU8XvRrq8CfUBMUI/kWDd+Re9E0oySjnemFHNIiOUnhty/00WAWCj2jyRgdXdExPKVnc4Ffl4FmSaB26jQoahwzrZ4j248T/7eLTAvQH54twKYgrKR9A1wHWgyaSVNzE9Es1q90zad/OoFZVkq+vNLoP4VIpXCd7N4jlI/hsx732gkIYOJ4Wdd04XGPU1j1VZQGCz++tDRPv6dujHgnABZAYbd/G4eBCVofoCnoMvlvKJZFhwWRcyFweKIgCNYRqpLxBQbGKd95y2nYX6+edTQE2He7ZqWk8MRYR3FD6In/+4SSziyn795++Fxu+AqhzALaRDkEcdbQsvE+4sghHNuWHwb9LRObDq/N/trS9CcgLEvZ2rPvQwC+RIUY0krv6o7pO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:24.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b4fe56-b842-4f9c-0004-08df0b256b3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162

Add the instance registry and the resources needed for an individual
vGPU. Allocate paired framebuffer and management-heap regions from a
profile-wide VRAM slot pool, and reserve channel IDs through
ChannelIdPool.

Keep mandatory allocations as non-optional fields, enforce
profile-specific instance limits, and group the firmware identity into
an InstanceInfo. Add typed NVKV GMCAPI helpers for querying the VF
assignment and vGPU properties.

Make VgpuManager own the instance registry. Each registry entry keeps
the instance's channel reservation and VRAM regions allocated until the
entry is removed.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             |  72 +++---
 drivers/gpu/nova-core/gsp.rs             |   1 +
 drivers/gpu/nova-core/gsp/boot.rs        |   4 +-
 drivers/gpu/nova-core/gsp/cmdq.rs        |  63 +++++
 drivers/gpu/nova-core/gsp/commands.rs    |  11 +
 drivers/gpu/nova-core/gsp/fw.rs          |   8 +
 drivers/gpu/nova-core/gsp/fw/commands.rs |  44 ++--
 drivers/gpu/nova-core/mm/vram.rs         |   3 +
 drivers/gpu/nova-core/vgpu/consts.rs     |  12 +
 drivers/gpu/nova-core/vgpu/instance.rs   | 288 +++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu/mod.rs        |  48 ++--
 11 files changed, 486 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/consts.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/instance.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 430d0cc12546..5c12847c19bc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -49,12 +49,12 @@
     vgpu::VgpuManager, //
 };
 
-#[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
 mod channel;
 mod hal;
 
 pub(crate) use self::channel::{
     ChannelIdPool,
+    ChannelIdReservation,
     TOTAL_CHANNELS, //
 };
 
@@ -310,6 +310,7 @@ pub(crate) struct Gpu<'gpu> {
     /// vGPU state and firmware parameters.
     ///
     /// Declared before MM and BAR1 so live instances are torn down before their resources.
+    #[pin]
     vgpu: VgpuManager<'gpu>,
     /// GPU memory manager owning memory management resources.
     ///
@@ -421,50 +422,55 @@ pub(crate) fn new(
             // SAFETY: `chid_pool` is initialized before this expression and lives at a pinned
             // stable address. Field order drops `vgpu` before `chid_pool`, including unwind of
             // an incomplete initializer.
-            vgpu: VgpuManager::new(
+            vgpu <- VgpuManager::new(
                 // SAFETY: The lifetime and drop-order rationale above covers this borrow.
                 unsafe { &*core::ptr::from_ref(chid_pool.as_ref().get_ref()) },
             ),
 
-            gsp_resources <- try_pin_init!(GspResources {
-                device: pdev,
+            gsp_resources <- {
+                let mut vgpu = vgpu;
+                try_pin_init!(GspResources {
+                    device: pdev,
 
-                spec: *spec,
+                    spec: *spec,
 
-                bar,
+                    bar,
 
-                gsp_falcon: Falcon::new(
-                    dev,
-                    spec.chipset,
-                    bar
-                )
-                .inspect(|falcon| falcon.clear_swgen0_intr())?,
+                    gsp_falcon: Falcon::new(
+                        dev,
+                        spec.chipset,
+                        bar
+                    )
+                    .inspect(|falcon| falcon.clear_swgen0_intr())?,
 
-                sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
+                    sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
-                fsp: Fsp::try_new(dev, bar, spec.chipset)?,
+                    fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
-                _: {
-                    vgpu.detect_state(pdev, spec.chipset, fsp.as_mut());
-                },
+                    _: {
+                        vgpu.as_mut().detect_state(pdev, spec.chipset, fsp.as_mut());
+                    },
 
-                gsp <- Gsp::new(pdev, spec.chipset, vgpu.state()),
-
-                // This member must be initialized last, so the unload bundle can never be dropped
-                // from outside of the constructed `GspResources`, ensuring that the unload sequence
-                // is properly run in case of failure.
-                boot_result: gsp.boot(
-                    GspBootContext {
-                        pdev,
-                        bar,
-                        chipset: spec.chipset,
-                        gsp_falcon,
-                        sec2_falcon,
-                        fsp: fsp.as_mut(),
+                    gsp <- Gsp::new(pdev, spec.chipset, vgpu.as_ref().state()),
+
+                    // This member must be initialized last, so the unload bundle can never be
+                    // dropped from outside of the constructed `GspResources`, ensuring that the
+                    // unload sequence is properly run in case of failure.
+                    boot_result: {
+                        gsp.boot(
+                            GspBootContext {
+                                pdev,
+                                bar,
+                                chipset: spec.chipset,
+                                gsp_falcon,
+                                sec2_falcon,
+                                fsp: fsp.as_mut(),
+                            },
+                            vgpu.as_mut(),
+                        )?
                     },
-                    vgpu,
-                )?,
-            }),
+                })
+            },
 
             _: {
                 // The `GSP_INIT` reply already carried this.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index deaae033a88f..2521d7331996 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -32,6 +32,7 @@
 mod regs;
 
 pub(crate) use fw::{
+    vgpu_bindings,
     GspFmcBootParams,
     GspFwWprMeta,
     LibosMemoryRegionInitArgument,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 2d027d2a9a35..659f3783ed13 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -74,7 +74,7 @@ impl super::Gsp {
     pub(crate) fn boot(
         self: Pin<&mut Self>,
         mut ctx: super::GspBootContext<'_, '_>,
-        vgpu: &mut VgpuManager<'_>,
+        mut vgpu: Pin<&mut VgpuManager<'_>>,
     ) -> Result<super::BootResult> {
         let pdev = ctx.pdev;
         let bar = ctx.bar;
@@ -158,7 +158,7 @@ pub(crate) fn boot(
                 )
             })?;
 
-        vgpu.init(
+        vgpu.as_mut().init(
             &static_info.fifo_engine_list,
             static_info.vmmu_segment_size,
             TOTAL_CHANNELS,
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e6931f65b167..e472ec94691d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -517,6 +517,14 @@ pub(crate) enum QueuePointers {
     Reset,
 }
 
+/// Response from a GMC API command.
+pub(crate) struct GmcResponse {
+    /// Response status (`NV_STATUS` code). Zero means success.
+    pub(crate) status: u32,
+    /// Response payload copied out of the message queue.
+    pub(crate) payload: KVec<u8>,
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -680,6 +688,61 @@ pub(crate) fn send_gmc_no_wait(
             .send_gmc(bar, command_id, payload, max_response_size)
     }
 
+    /// Sends a GMC API command and waits for its response.
+    ///
+    /// The queue stays locked for the complete transaction. A single deadline bounds all queue
+    /// elements observed while waiting.
+    pub(crate) fn send_gmc_and_receive(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result<GmcResponse> {
+        let mut inner = self.inner.lock();
+        inner.send_gmc(bar, command_id, payload, max_response_size)?;
+
+        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                return Err(ETIMEDOUT);
+            }
+
+            let response = inner.receive_gmc_and_dispatch(
+                bar,
+                remaining,
+                |received_command, status, payload_0, payload_1| {
+                    if received_command != command_id {
+                        return (None, QueuePointers::Unchanged);
+                    }
+
+                    let response = (|| {
+                        let mut payload = KVec::with_capacity(
+                            payload_0
+                                .len()
+                                .checked_add(payload_1.len())
+                                .ok_or(EOVERFLOW)?,
+                            GFP_KERNEL,
+                        )?;
+                        payload.extend_from_slice(payload_0, GFP_KERNEL)?;
+                        payload.extend_from_slice(payload_1, GFP_KERNEL)?;
+                        Ok(GmcResponse {
+                            status,
+                            payload,
+                        })
+                    })();
+
+                    (Some(response), QueuePointers::Unchanged)
+                },
+            )?;
+
+            if let Some(response) = response {
+                return response;
+            }
+        }
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 89369ff23b85..417df31988c2 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -49,6 +49,11 @@
     vgpu::VgpuState, //
 };
 
+pub(crate) use fw::commands::{
+    Dbdf,
+    VgpuProperties, //
+};
+
 /// Upper bound on entries in the hardware FIFO engine table.
 pub(crate) const MAX_FIFO_ENGINES: usize = 64;
 
@@ -281,6 +286,12 @@ fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
     Ok(out)
 }
 
+/// Decodes a byte-oriented GMC vGPU-properties response with the typed NVKV schema.
+pub(crate) fn decode_vgpu_properties(payload: &[u8]) -> Result<KBox<VgpuProperties>> {
+    let words = nvkv_words(payload, &[])?;
+    VgpuProperties::decode(&words)
+}
+
 /// Decodes the static GPU configuration from an NVKV stream.
 ///
 /// # Errors
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c2869c7fdf2a..f8f7f85d2df0 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -4,6 +4,14 @@
 pub(crate) mod commands;
 mod r000_00;
 
+/// Raw firmware declarations used by vGPU management.
+pub(crate) mod vgpu_bindings {
+    pub(crate) use super::r000_00::{
+        GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
+        GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES, //
+    };
+}
+
 // Alias to avoid repeating the version number with every use.
 use r000_00 as bindings;
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 1610b005199f..0603fbde172f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -22,6 +22,7 @@
     Accumulated,
     Array,
     ArrayVec,
+    Decoder,
     DecoderValue,
     Encodeable,
     Encoder,
@@ -29,7 +30,8 @@
     Indexed,
     Key,
     KeyId,
-    Required, //
+    Required,
+    UnknownKeyPolicy, //
 };
 
 use super::bindings;
@@ -653,27 +655,33 @@ impl VgpuPropertiesSchema {
     const FB_RESERVATION_KEY: KeyId = 0x310F;
 }
 
-struct VgpuProperties {
-    name: ArrayVec<u8, { Self::STRING_LEN }>,
-    class: ArrayVec<u8, { Self::STRING_LEN }>,
-    type_id: u32,
-    bar1_length: u64,
-    max_instance: u32,
-    ecc: u32,
-    profile_size: u64,
-    max_fps: u32,
-    num_heads: u32,
-    max_res_x: u32,
-    max_res_y: u32,
-    dev_id: u32,
-    subsystem_id: u32,
-    fb_length: u64,
-    gsp_heap_size: u64,
-    fb_reservation: u64,
+pub(crate) struct VgpuProperties {
+    pub(crate) name: ArrayVec<u8, { Self::STRING_LEN }>,
+    pub(crate) class: ArrayVec<u8, { Self::STRING_LEN }>,
+    pub(crate) type_id: u32,
+    pub(crate) bar1_length: u64,
+    pub(crate) max_instance: u32,
+    pub(crate) ecc: u32,
+    pub(crate) profile_size: u64,
+    pub(crate) max_fps: u32,
+    pub(crate) num_heads: u32,
+    pub(crate) max_res_x: u32,
+    pub(crate) max_res_y: u32,
+    pub(crate) dev_id: u32,
+    pub(crate) subsystem_id: u32,
+    pub(crate) fb_length: u64,
+    pub(crate) gsp_heap_size: u64,
+    pub(crate) fb_reservation: u64,
 }
 
 impl VgpuProperties {
     const STRING_LEN: usize = 64;
+
+    /// Decodes an NVKV response using the typed schema.
+    pub(crate) fn decode(words: &[u64]) -> Result<KBox<Self>> {
+        let decoder = Decoder::new(words, UnknownKeyPolicy::Ignore);
+        KBox::try_init(decoder.decode(VgpuPropertiesSchema::default())?, GFP_KERNEL)
+    }
 }
 
 // SETUP_CONFIG_PARAMS_AND_INIT
diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
index 4a4bd42c9f18..87b7ce7f2c93 100644
--- a/drivers/gpu/nova-core/mm/vram.rs
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -86,16 +86,19 @@ fn new(backing: Arc<VramBlock>, range: Range<u64>) -> Result<Self> {
     }
 
     /// Return the physical address of the first byte in this region.
+    #[expect(dead_code)]
     pub(crate) const fn address(&self) -> u64 {
         self.address
     }
 
     /// Return the region size in bytes.
+    #[expect(dead_code)]
     pub(crate) const fn size(&self) -> u64 {
         self.size
     }
 
     /// Return a checked subregion relative to this region.
+    #[expect(dead_code)]
     pub(crate) fn subregion(&self, range: Range<u64>) -> Result<Self> {
         let size = range
             .end
diff --git a/drivers/gpu/nova-core/vgpu/consts.rs b/drivers/gpu/nova-core/vgpu/consts.rs
new file mode 100644
index 000000000000..7ec577ec12f2
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/consts.rs
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+/// Development OpenRM GMC command identifiers used by vGPU management.
+pub(crate) mod gmc {
+    use crate::gsp::vgpu_bindings as bindings;
+
+    pub(crate) const VGPU_MGMT_QUERY_PROPERTIES: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES;
+    pub(crate) const VGPU_MGMT_QUERY_ASSIGNED_VF: u32 =
+        bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE;
+}
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
new file mode 100644
index 000000000000..ed304945330a
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use core::num::NonZeroUsize;
+
+use kernel::{
+    prelude::*,
+    ptr::Alignment,
+    sizes::SizeConstants, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::ChannelIdReservation,
+    gsp::{
+        cmdq::Cmdq,
+        commands::{
+            decode_vgpu_properties,
+            Dbdf,
+            VgpuProperties, //
+        },
+    },
+    mm::GpuMm,
+    vgpu::{
+        consts::gmc,
+        vram::{
+            VgpuVramLayout,
+            VgpuVramSlot,
+            VgpuVramSlotAllocator, //
+        },
+        VgpuManager, //
+    },
+};
+
+/// Guest Function ID. GFID 0 is reserved for the PF; VFs start at 1.
+#[repr(transparent)]
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub(crate) struct Gfid(pub(crate) u32);
+
+/// vGPU type descriptor populated from a typed NVKV properties response.
+#[expect(dead_code)]
+pub(crate) struct VgpuType {
+    name: [u8; 64],
+    class: [u8; 64],
+    vgpu_type_id: u32,
+    bar1_length: u64,
+    max_instance: u32,
+    ecc_supported: u32,
+    profile_size: u64,
+    max_fps: u32,
+    num_heads: u32,
+    max_res_x: u32,
+    max_res_y: u32,
+    pci_dev_id: u32,
+    pci_subsys_id: u32,
+    fb_length: u64,
+    gsp_heap_size: u64,
+    fb_reservation: u64,
+}
+
+impl VgpuType {
+    fn from_properties(properties: &VgpuProperties) -> Self {
+        let mut name = [0; 64];
+        let name_len = properties.name.len().min(name.len());
+        name[..name_len].copy_from_slice(&properties.name[..name_len]);
+
+        let mut class = [0; 64];
+        let class_len = properties.class.len().min(class.len());
+        class[..class_len].copy_from_slice(&properties.class[..class_len]);
+
+        Self {
+            name,
+            class,
+            vgpu_type_id: properties.type_id,
+            bar1_length: properties.bar1_length,
+            max_instance: properties.max_instance,
+            ecc_supported: properties.ecc,
+            profile_size: properties.profile_size,
+            max_fps: properties.max_fps,
+            num_heads: properties.num_heads,
+            max_res_x: properties.max_res_x,
+            max_res_y: properties.max_res_y,
+            pci_dev_id: properties.dev_id,
+            pci_subsys_id: properties.subsystem_id,
+            fb_length: properties.fb_length,
+            gsp_heap_size: properties.gsp_heap_size,
+            fb_reservation: properties.fb_reservation,
+        }
+    }
+}
+
+/// A vGPU instance and the resources reserved for it.
+#[expect(dead_code)]
+pub(crate) struct VgpuInstance<'gpu> {
+    pub(crate) gfid: Gfid,
+    pub(crate) dbdf: Dbdf,
+    pub(crate) vgpu_type: VgpuType,
+    pub(crate) vm_pid: u32,
+    pub(crate) chids: ChannelIdReservation<'gpu>,
+    pub(crate) num_plugin_channels: u32,
+    pub(crate) vram_slot: VgpuVramSlot,
+}
+
+/// Identity and firmware profile used to allocate an instance.
+pub(crate) struct InstanceInfo {
+    pub(crate) gfid: Gfid,
+    pub(crate) dbdf: Dbdf,
+    pub(crate) vgpu_type: VgpuType,
+    pub(crate) vm_pid: u32,
+}
+
+#[expect(dead_code)]
+impl InstanceInfo {
+    pub(crate) const fn new(gfid: Gfid, dbdf: Dbdf, vgpu_type: VgpuType, vm_pid: u32) -> Self {
+        Self {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+        }
+    }
+}
+
+/// Registry of live vGPU instances.
+pub(crate) struct VgpuInstances<'gpu> {
+    /// Declared before `vram_slots` so instance regions are dropped before their backing pool.
+    instances: KVec<VgpuInstance<'gpu>>,
+    vram_slots: Option<VgpuVramSlotAllocator>,
+}
+
+#[expect(dead_code)]
+impl<'gpu> VgpuInstances<'gpu> {
+    pub(crate) const fn new() -> Self {
+        Self {
+            instances: KVec::new(),
+            vram_slots: None,
+        }
+    }
+
+    fn alloc_vram_slot(&mut self, mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<VgpuVramSlot> {
+        let replace_empty_pool = match self.vram_slots.as_ref() {
+            Some(allocator) if allocator.is_empty() => !allocator.matches_layout(layout)?,
+            _ => false,
+        };
+        if replace_empty_pool {
+            self.vram_slots = None;
+        }
+
+        if let Some(allocator) = self.vram_slots.as_mut() {
+            return allocator.alloc(layout);
+        }
+
+        let mut allocator = VgpuVramSlotAllocator::new(mm, layout)?;
+        let slot = allocator.alloc(layout)?;
+        self.vram_slots = Some(allocator);
+        Ok(slot)
+    }
+
+    fn release_vram_slot(&mut self, slot: VgpuVramSlot) {
+        let Some(allocator) = self.vram_slots.as_mut() else {
+            // A live slot proves that its pool exists. If that invariant is ever broken,
+            // leaking the slot is safer than allowing its backing VRAM to be reused.
+            core::mem::forget(slot);
+            return;
+        };
+        allocator.release(slot);
+    }
+
+    /// Allocate resources and register a new inactive vGPU instance.
+    pub(crate) fn allocate_instance(
+        &mut self,
+        mm: &GpuMm<'_>,
+        vgpu: &VgpuManager<'gpu>,
+        info: InstanceInfo,
+    ) -> Result<Gfid> {
+        let InstanceInfo {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+        } = info;
+
+        if self
+            .instances
+            .iter()
+            .any(|instance| instance.gfid == gfid || instance.dbdf == dbdf)
+        {
+            return Err(EEXIST);
+        }
+        let profile_instances = self
+            .instances
+            .iter()
+            .filter(|instance| instance.vgpu_type.vgpu_type_id == vgpu_type.vgpu_type_id)
+            .count();
+        if vgpu_type.max_instance == 0
+            || profile_instances
+                >= usize::try_from(vgpu_type.max_instance).map_err(|_| EOVERFLOW)?
+        {
+            return Err(ENOSPC);
+        }
+        // Reserve registry capacity before acquiring resources so publishing
+        // the completed instance cannot fail due to memory pressure.
+        self.instances.reserve(1, GFP_KERNEL)?;
+
+        let num_chid = vgpu
+            .total_channels()
+            .ok_or(ENODEV)?
+            .checked_div(vgpu_type.max_instance)
+            .filter(|count| *count != 0)
+            .ok_or(EINVAL)?;
+        let chids = vgpu.chid_pool.reserve_ids(
+            NonZeroUsize::new(usize::try_from(num_chid).map_err(|_| EOVERFLOW)?).ok_or(EINVAL)?,
+            Alignment::SZ_1,
+        )?;
+        let layout = VgpuVramLayout {
+            type_id: vgpu_type.vgpu_type_id,
+            max_slots: vgpu_type.max_instance,
+            fb_size: vgpu_type.fb_length,
+            heap_size: vgpu_type.gsp_heap_size,
+            fb_align: vgpu.vmmu_segment_size().ok_or(ENODEV)?,
+        };
+        let vram_slot = self.alloc_vram_slot(mm, layout)?;
+
+        let instance = VgpuInstance {
+            gfid,
+            dbdf,
+            vgpu_type,
+            vm_pid,
+            chids,
+            num_plugin_channels: 3,
+            vram_slot,
+        };
+        match self.instances.push_within_capacity(instance) {
+            Ok(()) => Ok(gfid),
+            Err(error) => {
+                let VgpuInstance { vram_slot, .. } = error.0;
+                self.release_vram_slot(vram_slot);
+                Err(EIO)
+            }
+        }
+    }
+
+    /// Remove an instance and release its channel and VRAM reservations.
+    pub(crate) fn destroy_instance(&mut self, gfid: Gfid) -> Result {
+        let index = self
+            .instances
+            .iter()
+            .position(|instance| instance.gfid == gfid)
+            .ok_or(ENOENT)?;
+        let instance = self.instances.remove(index).map_err(|_| EIO)?;
+        let VgpuInstance { vram_slot, .. } = instance;
+        self.release_vram_slot(vram_slot);
+        Ok(())
+    }
+}
+
+/// Query the vGPU type assigned to a VF by its DBDF.
+#[expect(dead_code)]
+pub(crate) fn query_assigned_vf_type(cmdq: &Cmdq, bar: Bar0<'_>, dbdf: Dbdf) -> Result<u32> {
+    let request = u64::from(dbdf.into_raw()).to_le_bytes();
+    let response =
+        cmdq.send_gmc_and_receive(bar, gmc::VGPU_MGMT_QUERY_ASSIGNED_VF, &request, 64)?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+    let bytes = response.payload.get(..4).ok_or(ENODEV)?;
+    Ok(u32::from_le_bytes(bytes.try_into().map_err(|_| EINVAL)?))
+}
+
+/// Query and decode one vGPU type using the typed NVKV schema.
+#[expect(dead_code)]
+pub(crate) fn query_vgpu_type(cmdq: &Cmdq, bar: Bar0<'_>, type_id: u32) -> Result<VgpuType> {
+    let response = cmdq.send_gmc_and_receive(
+        bar,
+        gmc::VGPU_MGMT_QUERY_PROPERTIES,
+        &type_id.to_le_bytes(),
+        4096,
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+
+    let properties = decode_vgpu_properties(&response.payload)?;
+    if properties.type_id != type_id || properties.max_instance == 0 {
+        return Err(EINVAL);
+    }
+    Ok(VgpuType::from_properties(&properties))
+}
diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index a96d0018fa3d..320230ddd1dd 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -3,10 +3,17 @@
 
 use core::num::NonZero;
 
+pub(crate) mod consts;
+pub(crate) mod instance;
+
+pub(crate) use self::instance::VgpuInstances;
+
 use kernel::{
     device,
+    new_mutex,
     pci,
-    prelude::*, //
+    prelude::*,
+    sync::Mutex, //
 };
 
 use crate::{
@@ -38,9 +45,12 @@ pub(crate) enum VgpuState {
 }
 
 /// vGPU state manager.
+#[pin_data]
 pub(crate) struct VgpuManager<'gpu> {
+    /// Live vGPU instances owned by this manager.
+    #[pin]
+    instances: Mutex<VgpuInstances<'gpu>>,
     /// Channel ID pool the per-VF areas are reserved from.
-    #[expect(dead_code)]
     pub(crate) chid_pool: &'gpu ChannelIdPool,
     state: VgpuState,
     vmmu_segment_size: Option<u64>,
@@ -50,19 +60,20 @@ pub(crate) struct VgpuManager<'gpu> {
 
 impl<'gpu> VgpuManager<'gpu> {
     /// Creates an empty vGPU manager for initialization during GPU construction.
-    pub(crate) const fn new(chid_pool: &'gpu ChannelIdPool) -> Self {
-        Self {
+    pub(crate) fn new(chid_pool: &'gpu ChannelIdPool) -> impl PinInit<Self> + 'gpu {
+        pin_init!(Self {
+            instances <- new_mutex!(VgpuInstances::new(), "nova-core::vgpu-instances"),
             chid_pool,
             state: VgpuState::Disabled,
             vmmu_segment_size: None,
             total_channels: None,
             fifo_engine_list: None,
-        }
+        })
     }
 
     /// Detects and stores vGPU state before GSP boot.
     pub(crate) fn detect_state(
-        &mut self,
+        self: Pin<&mut Self>,
         pdev: &pci::Device<device::Core<'_>>,
         chipset: Chipset,
         fsp: Option<&mut Fsp<'_>>,
@@ -91,7 +102,7 @@ pub(crate) fn detect_state(
             }
         })();
 
-        self.state = state.unwrap_or_else(|e| {
+        let state = state.unwrap_or_else(|e| {
             dev_warn!(
                 pdev,
                 "vGPU state detection failed: {:?}; disabling vGPU\n",
@@ -99,7 +110,9 @@ pub(crate) fn detect_state(
             );
             VgpuState::Disabled
         });
-        dev_dbg!(pdev, "vGPU state: {:?}\n", self.state);
+        let this = self.project();
+        *this.state = state;
+        dev_dbg!(pdev, "vGPU state: {:?}\n", state);
     }
 
     /// Returns the detected vGPU state for this boot.
@@ -109,26 +122,31 @@ pub(crate) fn state(&self) -> VgpuState {
 
     /// Initializes the runtime parameters returned by GSP_INIT.
     pub(crate) fn init(
-        &mut self,
+        self: Pin<&mut Self>,
         fifo_engine_list: &FifoEngineList,
         vmmu_segment_size: u64,
         total_channels: u32,
     ) {
-        if matches!(self.state, VgpuState::Enabled { .. }) {
-            self.vmmu_segment_size = Some(vmmu_segment_size);
-            self.total_channels = Some(total_channels);
-            self.fifo_engine_list = Some(*fifo_engine_list);
+        let this = self.project();
+        if matches!(*this.state, VgpuState::Enabled { .. }) {
+            *this.vmmu_segment_size = Some(vmmu_segment_size);
+            *this.total_channels = Some(total_channels);
+            *this.fifo_engine_list = Some(*fifo_engine_list);
         }
     }
 
-    /// Returns the firmware-reported VMMU segment size when vGPU is enabled.
+    /// Returns the live-instance registry.
     #[expect(dead_code)]
+    pub(crate) fn instances(&self) -> &Mutex<VgpuInstances<'gpu>> {
+        &self.instances
+    }
+
+    /// Returns the firmware-reported VMMU segment size when vGPU is enabled.
     pub(crate) const fn vmmu_segment_size(&self) -> Option<u64> {
         self.vmmu_segment_size
     }
 
     /// Returns the number of channel IDs available to vGPU instances.
-    #[expect(dead_code)]
     pub(crate) const fn total_channels(&self) -> Option<u32> {
         self.total_channels
     }
-- 
2.53.0

