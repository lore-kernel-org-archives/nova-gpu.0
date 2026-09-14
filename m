Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EF282F21
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372234; cv=fail; b=mMOvlMyGpO8TIiYCsVi5yxnBoTCLUe5J7R59wR0xp49/hOlIMBf6gzhgnpKl353KLOcCMP7kMuPVnzsf+SQj0bMm86DGLo+v/pj5ljxuLr9pKKi5sv81D6qjeeCDL7VyrnwiQ3zq8UljEtw5vozmMs0ADZgR+6k8pyx18aX4tM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372234; c=relaxed/simple;
	bh=BJrJHkHJAYVEfw02NqJMi903f1f5eexrYSI6vYNbN/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aV+nty9KF7/ZFFO7qznY25giScb9xnEvO9K9DWycmI/D+6TaZIpX/Hx3c5VduBLvZNjSw0nRpj6Q0RCTvOc8tFNcFsWlc93k/+iZcfmDARTz2zj0RRetQMYNd5whJsGRVujhhp+vn0Of633/CBWV/l+0nfPlbm/aq+D+qk2mZzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uRoj3UMV; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uRoj3UMV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUUM6ndqXa8y6Vf2mLqUjVD+1i079rSDyA0w/3T9y5rfmtQtkTLvk+CeEEJ6a8zB8K1oKwV4myqPanMrsP7WI2MGiahKCEFf372cBjJ1eZA2DZdUhVefDg7zson9JmN/wt1bzBeV9Tsfb2XJzEE9TXTDrFYpWev2wBM6b4tAJA4K8DnoGdDGhcsrey/gLIRYIFBKk4gr9YVHG9U1gEJT1TLlF/sNsSIXoyezSsLmeklqfK8UgiLH/dnvest2XzerPv2LsE2cbxxM0yhpV9NXITKuy3illz7/tEU3zJZJSiOPFvVpfQRJZKmyOTKvgWrBnTQQ7FfvJsdXD429lwTEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WaFj0TxJNJ3Vuyud6jZ7PGFReSsg8mXIrKoh74IJRs=;
 b=rVwvO28ge8YXHAxYyvzUth4V3j4QK1/MzR+Q9m3Djk/BznGLVVlNf3agcQsxwuyx4jGL2Ho2aT41SH8F6buduvccfpKrPZ69sTHVHebvT0yzRshOAjD44g6zRfP3gdCYnZuYl/qdsdflwWb916vUozfgPwljrhEbx1lPNbj2NxcByeS3dkVyqfEuGjFfJMoN+UwLGi0sCftksKHOc2T9bY9xeYbwnvsSIPcmt+liwNjbpS5jcNkQE27ntapKg9fQVn+8z1O/9ZLQdUbPf/zsEFMZDSllQSb/Pt1NWR6g7XZ466i86dffCiCnQdcfO76ZQaTYIUKrgFAvLFnlAVysng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WaFj0TxJNJ3Vuyud6jZ7PGFReSsg8mXIrKoh74IJRs=;
 b=uRoj3UMV3EybtT33c0WDL+51m/uo/lRsmm82nKmJ5PXojCFMxmrIM2DS7CCnKgyxCmIJjqhaQzvHtQ31LsnOeIAX+2/TKk0jvR0JngAQoVy8CmGf4p+mpO246jc8QoTTDIQUeOMT2IZSONB22SnD/5Vnt1eb1Q/Aq1lTJ2taYk9GXpKOF1xEBFPv1Prt+D7ZhUsnjW7VT/iH6gp+75oQ5j9dROZK+8jsskVTTM902Nu7zayCznKqmTRi8Pu6xfgM8jbilOV0GHnjzJ3IeRwcSC5ZzeC4qI7M/njCJ7Zhz6hm6KEgjxRFEbpXlcT60tU7biwZC/WoyBnFH2ck0aF1AA==
Received: from MN2PR22CA0012.namprd22.prod.outlook.com (2603:10b6:208:238::17)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:50:26 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::3c) by MN2PR22CA0012.outlook.office365.com
 (2603:10b6:208:238::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:26 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:50:10 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:10 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:02 -0700
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
Subject: [PATCH v2 06/32] gpu: nova-core: gsp: decode the FIFO engine table
Date: Mon, 14 Sep 2026 10:48:41 +0300
Message-ID: <20260914074907.1399629-7-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc6aa0b-3912-49ce-6419-08df1234d710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TuslLbuZzM5vqAsqCxaK9ChYWHEdyd8h2SsSb5c470JUIgVi0TzQpo25Qgn/eRm36xvB7vAooUu5FYA+7MoYQmCUrM/WragFyf7iWk+Xxp+hyrYwD58Nk/09qU8QUZJWZJXWSu17KE/U145lrKoweLaU9Tf1C2RF8gTwaDgpiaQvEYLBP53UXdGireITUVGvPYh6ky6bzqYSJMKUBBsEFwEB/CHascctKT1/fzqBx2bf6iSUk8/LWh5PuHBNKytjAkTtnIL3Y7qCERwKkG0dUHinQFlManYKz5prvcrmLKbNLWPJ8h6pnQTEIsxyxaFqKgKqV1or993SRilVMYaKlGwpoQloQNIwdFkTtDdb8vQ0ZjCasW2a+6JfRCLbdTDVsUepf1o4ZbMUBSx6QSNlDO/4mphLtkfNWGvF83ZOv6r24lyjwDdwd8OG2JE/rGrzvLOgBFw4wWBOmo3wZYEp3o+Ix6DXnleB4TsqQ/YlCzvY5pCDJJOfLtB71Z5Mx1DbbO2zWiDFhL9ZmJzef7vOyqo4Eds5Ti7AIDmVYVyQIGjlzdhReUY8+n0mSL1wQFvM7+vbslIBA/JjDGSkCNh6YNXnNnJiTkk91Q0lKHHeyQDy7e5z0gFg8eWtpXW8EbjIPxpWFiY+1h0dXe4dchO6AnuKT8VPAN4KMLey/B+gpPuE0pTPL8akdfIGQrGazNlD5Rs+WjTc7LiAQfYM7qx7Jw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nHX863ipi6MD4caI4c4DK1Xrax03f1msU+iP7lJxSTdkFZyZHOhjlC7DVo5M9J5+s3Fw+AgM8qANvA2ZYwKL9xMLP4HF2MM8c0A7rgeBEf2JSNUEtiu05i2BGvxyQGoNJSP6uRDkapc36wRwfqvcPgM0DtO2uoKkGbzaWfCIZIDNj4O+i66JZD6zTXqIFh8bbm7J9Tv3+hCFIVlbFIkk7qVAk38XEb1y6mt/WEWAnzKuPLx9ZX4KnGxwv5+NZDpdkQTiTktL4QtPn5e9y3qxUwGMA/oNXlqGEtnD4KdUKzrQm93T+rFQ3dciCWWzmRoZvqekPevoKIDpOcllgQVqjGqNvLiWtahugr3VwkIrVEkdI0ss1Trf8RN5VGRmJuvNPKtDjy7uIWXcQRnmLYpMjpEEQL3zS8IVOAW2URlcYaweuPG27lzebtZZuxgLibyP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:26.3905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc6aa0b-3912-49ce-6419-08df1234d710
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

From: Alok Kumar <alkumar@nvidia.com>

GSP_INIT reports the FIFO engine table needed to build the engine bitmap
used during vGPU instance creation.

Decode the engine count, GMC IDs and flags, and expose host-driven
engines in GetGspStaticInfoReply. Preserve firmware FIFO order and
duplicate IDs while filtering on the host-driven flag.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 47 +++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs | 34 ++++++++++++++++-
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index afc32c2a230e..3820320dcb34 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -26,7 +26,8 @@
                 GspInitResponse,
                 GspInitResponseSchema,
                 RegKey,
-                VfInfo, //
+                VfInfo,
+                MAX_FIFO_ENGINES, //
             },
             GMCAPI_CMD_GSP_INIT,
             GMCAPI_CMD_GSP_SUSPEND, //
@@ -44,6 +45,28 @@
     vgpu::VgpuState, //
 };
 
+/// Bit mask for `NVGMC_SC_ENGINE_FLAGS_IS_HOST_DRIVEN`.
+const ENGINE_FLAGS_IS_HOST_DRIVEN: u32 = 1 << 0;
+
+/// Host-driven GMC engine IDs in hardware FIFO order, including any repeated IDs.
+///
+/// # Invariants
+///
+/// `count` is at most [`MAX_FIFO_ENGINES`]. The first `count` slots are the retained engine IDs.
+#[derive(Copy, Clone)]
+pub(crate) struct FifoEngineList {
+    gmc_ids: [u32; MAX_FIFO_ENGINES],
+    count: usize,
+}
+
+impl FifoEngineList {
+    #[expect(dead_code)]
+    pub(crate) fn gmc_ids(&self) -> &[u32] {
+        // PANIC: The type invariant bounds `count` by the array capacity.
+        &self.gmc_ids[..self.count]
+    }
+}
+
 /// The static GPU configuration, as decoded from the `GSP_INIT` reply.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
@@ -56,6 +79,8 @@ pub(crate) struct GetGspStaticInfoReply {
     /// VMMU segment size in bytes, or zero if GSP-RM omitted it.
     #[expect(dead_code)]
     pub(crate) vmmu_segment_size: u64,
+    #[expect(dead_code)]
+    pub(crate) fifo_engine_list: FifoEngineList,
 }
 
 /// Error type for [`GetGspStaticInfoReply::gpu_name`].
@@ -274,12 +299,32 @@ fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
         usable_fb_regions.push(region, GFP_KERNEL)?;
     }
 
+    // INVARIANT: The list starts empty and appends at most one ID per supported input slot.
+    let mut fifo_engine_list = FifoEngineList {
+        gmc_ids: [0; MAX_FIFO_ENGINES],
+        count: 0,
+    };
+    for (&gmc_id, &flags) in decoded
+        .fifo_engine_gmc_ids()
+        .iter()
+        .zip(decoded.fifo_engine_flags())
+        .take(decoded.fifo_engine_count())
+    {
+        if flags & ENGINE_FLAGS_IS_HOST_DRIVEN != 0 {
+            // PANIC: At most one slot is filled per input, and the input has at most
+            // MAX_FIFO_ENGINES entries, so the next retained ID always fits.
+            fifo_engine_list.gmc_ids[fifo_engine_list.count] = gmc_id;
+            fifo_engine_list.count += 1;
+        }
+    }
+
     Ok(GetGspStaticInfoReply {
         gpu_name,
         bar1_pde_base: decoded.bar1_pde_base(),
         usable_fb_regions,
         total_fb_end: decoded.total_fb_end().ok_or(EINVAL)?,
         vmmu_segment_size: decoded.vmmu_segment_size(),
+        fifo_engine_list,
     })
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index c2e199688b79..706ecfa63c01 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -12,7 +12,10 @@
     transmute::AsBytes, //
 };
 
-use crate::gpu::Chipset;
+use crate::{
+    gpu::Chipset,
+    num, //
+};
 
 use crate::gsp::nvkv::{
     nvkv_decode,
@@ -22,6 +25,7 @@
     DecoderValue,
     Encodable,
     Encoder,
+    Indexed,
     Key,
     KeyId,
     Required, //
@@ -286,6 +290,8 @@ pub(crate) fn new(
 
 // Decode:
 
+pub(in crate::gsp) const MAX_FIFO_ENGINES: usize = 64;
+
 // Should decode with UnknownKeyPolicy::Ignore.
 nvkv_decode! {
     /// Schema for the `GSP_INIT` response.
@@ -298,6 +304,9 @@ pub(crate) struct GspInitResponseSchema => GspInitResponse {
         fb_regions: Accumulated<FbRegionSchema>,
         bar1_pde_base: Required<u64, { Self::BAR1_PDE_BASE_KEY }>,
         vmmu_segment_size: Key<u64, { Self::VMMU_SEGMENT_SIZE_KEY }>,
+        fifo_engine_count: Key<u32, { Self::FIFO_ENGINE_COUNT_KEY }>,
+        fifo_engine_gmc_ids: Indexed<u32, MAX_FIFO_ENGINES, { Self::FIFO_ENGINE_GMC_ID_KEY }>,
+        fifo_engine_flags: Indexed<u32, MAX_FIFO_ENGINES, { Self::FIFO_ENGINE_FLAGS_KEY }>,
     }
 }
 
@@ -306,6 +315,9 @@ impl GspInitResponseSchema {
     const GPU_NAME_STRING_KEY: KeyId = 0x2000;
     const BAR1_PDE_BASE_KEY: KeyId = 0x1020;
     const VMMU_SEGMENT_SIZE_KEY: KeyId = 0x1050;
+    const FIFO_ENGINE_COUNT_KEY: KeyId = 0x0500;
+    const FIFO_ENGINE_GMC_ID_KEY: KeyId = 0x0501;
+    const FIFO_ENGINE_FLAGS_KEY: KeyId = 0x0502;
 }
 
 /// Payload of the `GSP_INIT` response.
@@ -315,6 +327,9 @@ pub(crate) struct GspInitResponse {
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
     vmmu_segment_size: u64,
+    fifo_engine_count: u32,
+    fifo_engine_gmc_ids: [u32; MAX_FIFO_ENGINES],
+    fifo_engine_flags: [u32; MAX_FIFO_ENGINES],
 }
 
 impl GspInitResponse {
@@ -372,6 +387,23 @@ pub(crate) fn total_fb_end(&self) -> Option<u64> {
     pub(in crate::gsp) const fn vmmu_segment_size(&self) -> u64 {
         self.vmmu_segment_size
     }
+
+    /// Returns the FIFO engine count, limited to the supported table capacity.
+    ///
+    /// An omitted count is zero. Indexed entries outside the capacity are rejected during decode.
+    pub(in crate::gsp) fn fifo_engine_count(&self) -> usize {
+        num::u32_as_usize(self.fifo_engine_count).min(MAX_FIFO_ENGINES)
+    }
+
+    /// Returns GMC engine IDs by hardware FIFO order; omitted slots contain zero.
+    pub(in crate::gsp) fn fifo_engine_gmc_ids(&self) -> &[u32; MAX_FIFO_ENGINES] {
+        &self.fifo_engine_gmc_ids
+    }
+
+    /// Returns per-engine flags by hardware FIFO order; omitted slots contain zero.
+    pub(in crate::gsp) fn fifo_engine_flags(&self) -> &[u32; MAX_FIFO_ENGINES] {
+        &self.fifo_engine_flags
+    }
 }
 
 nvkv_decode! {
