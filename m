Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11436BCD7
	for <nova-gpu@lists.linux.dev>; Wed,  5 Aug 2026 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916706; cv=fail; b=TyPFIQuL+v8yTESqw8txhVyvt9oLLJMdnhcXKVe9GzlofI9YzFyAszEap5NmX9KD1bG3cQFAzvA4W9Y+lAasdGm8Fsb4ndn651rL0lVMm9e4ix8YGwk/4ThgcXu0x08oArxof49sAlFuE20JZWBJ/NTY3cW68mJ8z+rLdZsGO24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916706; c=relaxed/simple;
	bh=jWVH8tpRz1MyEwBhjLlZmR1eWKrsFLErn8DH2rd79FA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQJgkGNo2KszX8JKcuTxx1VzFh5kh/LWYxdfz131zAaDbEFV7ZazB64wuyPIVGQZVEEA1vmKQN7VqPtZsz5DaJZDAe1IHrapdypOgDzhQ0fHoA80NlcOMlK9CP+0vsUc06vdN1O40j0kcmV9MTU0u91alQK7bNOnEfJLx0Vnmks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dU3vTY+l; arc=fail smtp.client-ip=40.93.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dU3vTY+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf9dDTyMDwLgDwhzfHdjVz9JcN8R3EnZU8cEHE/260q8i8eyZpCvBr1hXfBDKGn2MXVlkmYVesoOoBwKGdatOTsdXNxQiwLac0aRA6uxH8LAq69xotZcA8pgQH18CHSeeClhSLhlPlm51A6s758x0sRIAk/BpY1ALCbod+4gGLGZFk9gLlpApA0A9pMyd9J8u3Ne5w6DEp+mSEvElX471VEoOdTKDfkuSPdNHhZOslremcf3W/YDN9pXED4PJpIv3Nz6nEODDMvRprnfre/E6UcV8aAU2icRLhiaNyWtfUiswcA8PJhKf4UjW0yE8BPgjkTeyxx0/X4e5QelKXOImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr2ejSlAB5Zfo2Kub9mhi/D/JSp62YB1o6jF4+OMpBQ=;
 b=aRC4radzrqDDNjFK+WYtgZUuBZRoGjJTaDX7wiH14I0bj+qfA4JLK8PY5C37oVxrkIBru2cO6SE9MeTzrSqesCAoGp47NSaAZngLXDgIMhy20NXbLaOMylRFqmBLcjmzMvQx+9InmuQAZrbYcS9fLg8ZMUe+Asdcb7ISBNuPtdVUAhQh9BinmL9kMX9XHLMMV3rQA3SSuyrImt8m74M6ctMxvoa93A20fJ45VMvQwMHZ9dDNtQYwyRPPZBf69Smh9WauhN0E3Wi0HYgh8j+7e3N/c42XaH7Dh680lQ5+ggZcoG4xddJGSkzRA7mgN9unqq09zYpOPojWWcVVTAs11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr2ejSlAB5Zfo2Kub9mhi/D/JSp62YB1o6jF4+OMpBQ=;
 b=dU3vTY+lYDDhrKRkhQ3v4kV8wTjB7kM9xIxeuXhAPG01oNJmubSIdi10J+a9b1Dz5bIJoztDgUjfDovrQnDZnblgAQetbuV27IHPMaa3VWdhDgQKPrf9PqeiEOPm/rL+qiC1CgMF84p1EJhCERghJB5PNGmDzjOFBYaQcDQqzCPKzK9pWOhjt04G+TwpzcXsyyRRDEaJKbeSgKSBJgiz8UaaXBm+VmaptupBcJhlHlthBwWtYs5qatifYbEAtLImr62Rg7+Ugpb6NmKA0Njb/milOqAcZteq02MkXLJK5he0tfIMQkgC4N3ME2NdTiSr3l/ZxdsqKrPtr7wX3+ipGw==
Received: from BL1P223CA0043.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::9)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 07:58:17 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:5b6:cafe::16) by BL1P223CA0043.outlook.office365.com
 (2603:10b6:208:5b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 07:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 07:58:16 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 00:58:03 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 5 Aug 2026 00:58:02 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Aug 2026 00:57:54 -0700
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
Subject: [PATCH 2/3] gpu: nova-core: trace driver probe and firmware messages
Date: Wed, 5 Aug 2026 10:57:22 +0300
Message-ID: <31b82553743082add89f2e4434b82c6a291cac71.1785907106.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785907106.git.zhiw@nvidia.com>
References: <cover.1785907106.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d902b8b-10dd-4836-c570-08def2c74f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|3023799007|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	OEZNUp6iyG9Zc7QtQmMlmdSEl4wR3bfj3c1QBc6WL8ugUH1SkBIdvXPJdMdl2tCja0r39qFA09vI01b6kJrAQVo5ixXXpUSkr0I/dHVz+PAo5WcCNaQPTXNBdFcv9pRgRy7qwL9eHOzhLQSxuHHAWhNRLYFQAgxfXN9ys7BGH5kIO0rZfOsPoWBF5/2YarNiVMxK91lFodvIRgGXST9scwV/FG77etD1ruOcs7W7Bwbw3SBzOOFQwvLc5DzCaw5Ww3dNZQ2aHbHjewdEwKJLdJhDpzKDV4jvW8S6LJ0gadtBEwDkZjg9nV1zHWsNntJrcJBjzdF6ftyKKxm7d0Hy5KOYyoRuq3RcIUKc1ZaHNHlK5nWWp75eVToA4D0bsJDTxuqsbzzEHOB3bm46bTtDflr6IKoOP/GXW4k6YPhVZeXBSr4r5NISg4KZjdfzqZir6L2Ws1VbenNTtBT7bREaYQ7DD581cRaWdcpdy9JQ31jqPRiFgkX/t64wn5in3ZkxdVov/XKn/yF/nHG0kppkhTxZiX9OrUQgFXked13KRq6D+14ZeRAmsD9Tjv+Ynye0D6HK1EhDGymdtEbCzQqYnl1SeY9r3y/CaL+O155vLZXkMHCeb1g3lHjcUhiEgsg0RQ9u7isJ/I7gxaDzrHsfR1yFfvKssqW8kZo8psAo+r44xvcHyCF7DcIy6TAsVHc7PPERqOuQui+CkkFG5EFOLg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6F4UmquL9bJkraKaZqxpuy3BVyJlOHiKcNpGHC2sAAF/tycjjJznnQO4RSTgzG8t3FUV6nPZLRpZGyf39sBO7fg/++N0hfTdRJaHbrC0eIclxHSHQHC2jDGc8blf1sS2/729ksHOf0O2Qo7O+hIWKVmXfwAXeWFnaf4kdiPaNuONNjF4FC1QaHWHr0NussbV27CQK4x6Jk29/hF9dPTNDk9V9xsOTQJ+kPQkzOooymOcvs4k9ioyZdpWTYOSezinjlTDxprF3WiclXO1OooSz4jjBkjXiO9Xmaa4iF68tgxb2QB3o0s5On3b2vu4Zgm8Z6StWsyPL9AKMT4vXluFSR8GE6IdS4WuHElxz9n/ZXsOXPvWg2ARnw4ubxyP4yIPtuM61IX9MWD+IodfmeATZ6aCQvCKgDxB5YqfjTe/4JriO/lJwGQa4aIxl+VDrkBt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:58:16.9222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d902b8b-10dd-4836-c570-08def2c74f00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715

Use independently selectable trace streams for driver, GSP and FSP
activity. Replace the probe and GSP dev_dbg() calls with formatted
traces, and add FSP NVDM send and receive traces with the message type
and length.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs   |  7 +++++--
 drivers/gpu/nova-core/fsp.rs      | 16 +++++++++++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++-----
 drivers/gpu/nova-core/trace.rs    |  9 ---------
 4 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5738d4ac521b..cb92ce9a594e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -18,7 +18,10 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::{
+    gpu::Gpu,
+    trace::nova_core_trace_driver, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
@@ -73,7 +76,7 @@ fn probe<'bound>(
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         pin_init::pin_init_scope(move || {
-            dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
+            nova_core_trace_driver!(pdev, "Probe Nova Core GPU driver.");
 
             pdev.enable_device_mem()?;
             pdev.set_master();
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ba4544210e40..9dc919de2200 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -51,7 +51,8 @@
         NvdmType, //
     },
     num,
-    regs, //
+    regs,
+    trace::nova_core_trace_fsp, //
 };
 
 mod hal;
@@ -434,6 +435,12 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
     where
         M: MessageToFsp,
     {
+        nova_core_trace_fsp!(
+            dev,
+            "FSP NVDM: send: type={:?}, length=0x{:x}",
+            M::NVDM_TYPE,
+            msg.as_bytes().len(),
+        );
         self.falcon.send_msg(msg.as_bytes())?;
 
         let response_buf = self.falcon.recv_msg().inspect_err(|e| {
@@ -489,6 +496,13 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
             return Err(EIO);
         }
 
+        nova_core_trace_fsp!(
+            dev,
+            "FSP NVDM: receive: type={:?}, length=0x{:x}",
+            M::NVDM_TYPE,
+            response_buf.len(),
+        );
+
         Ok(response_buf)
     }
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index cd844fe48f05..6137c60b6231 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -58,7 +58,8 @@
         GSP_PAGE_SIZE, //
     },
     num,
-    sbuffer::SBufferIter, //
+    sbuffer::SBufferIter,
+    trace::nova_core_trace_gsp, //
 };
 
 use super::regs;
@@ -675,9 +676,9 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
                 dst.contents.1,
             ])));
 
-        dev_dbg!(
+        nova_core_trace_gsp!(
             &self.dev,
-            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
+            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}",
             self.seq,
             M::FUNCTION,
             dst.header.length(),
@@ -754,9 +755,9 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         // Extract the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
-        dev_dbg!(
+        nova_core_trace_gsp!(
             &self.dev,
-            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
+            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}",
             header.sequence(),
             header.function(),
             header.length(),
diff --git a/drivers/gpu/nova-core/trace.rs b/drivers/gpu/nova-core/trace.rs
index 893479b3fcb5..db975804f855 100644
--- a/drivers/gpu/nova-core/trace.rs
+++ b/drivers/gpu/nova-core/trace.rs
@@ -55,7 +55,6 @@ pub(crate) unsafe fn $event(
 ///
 /// `trace` must synchronously consume `dev`, `message`, and `message_len`
 /// according to the `nova_core_trace_class` event prototype.
-#[expect(dead_code)]
 pub(crate) unsafe fn nova_core_trace_fmt(
     dev: &CStr,
     args: fmt::Arguments<'_>,
@@ -81,7 +80,6 @@ pub(crate) unsafe fn nova_core_trace_fmt(
     }
 }
 
-#[expect(unused_macros)]
 macro_rules! nova_core_trace_impl {
     ($event:ident, $dev:expr, $($arg:tt)*) => {{
         #[cfg(CONFIG_TRACEPOINTS)]
@@ -121,24 +119,20 @@ macro_rules! nova_core_trace_impl {
 
 // Frontend macros expand in their caller's module and invoke this helper by
 // path, so the re-export must be visible from the parent module.
-#[expect(unused_imports)]
 pub(super) use nova_core_trace_impl;
 
-#[expect(unused_macros)]
 macro_rules! nova_core_trace_driver {
     ($dev:expr, $($arg:tt)*) => {
         $crate::trace::nova_core_trace_impl!(nova_core_trace_driver, $dev, $($arg)*)
     };
 }
 
-#[expect(unused_macros)]
 macro_rules! nova_core_trace_fsp {
     ($dev:expr, $($arg:tt)*) => {
         $crate::trace::nova_core_trace_impl!(nova_core_trace_fsp, $dev, $($arg)*)
     };
 }
 
-#[expect(unused_macros)]
 macro_rules! nova_core_trace_gsp {
     ($dev:expr, $($arg:tt)*) => {
         $crate::trace::nova_core_trace_impl!(nova_core_trace_gsp, $dev, $($arg)*)
@@ -152,11 +146,8 @@ macro_rules! nova_core_trace_vgpu {
     };
 }
 
-#[expect(unused_imports)]
 pub(crate) use nova_core_trace_driver;
-#[expect(unused_imports)]
 pub(crate) use nova_core_trace_fsp;
-#[expect(unused_imports)]
 pub(crate) use nova_core_trace_gsp;
 #[expect(unused_imports)]
 pub(crate) use nova_core_trace_vgpu;
-- 
2.53.0
