Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107A43EDE7C
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372374; cv=fail; b=AyutrJJxtWPF+vZ/djD1WjGkoSp+271djG+2+n+0Mm4zoiLM/4P/Q+w5qZrXjUETYXZjupkAFj9h2i+RvEAAfxRo35oW90CZRiCaW1QodA/lHWRBqaI/hK262icdZ36GnK8NorVju7AABCGfF9jPyuFXgnd5fq+HE+ajbLw/030=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372374; c=relaxed/simple;
	bh=Juu2be0TytALuLVYJ69xdYcSxkSga8PSslWwMc6gVL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmtmjQo1a7ulOsVjUO14i7n6VDq1BW3p6qR/gUJNZsuOSbR3jk9g9Y2gUy7afSUgrZh7vYhcYsg7qUko940qbiYJzvpIRuMpha3+FLW5pr+9pLbT72pNMmxUK1EWC9S9YX8SaHeDTBymZ5IKBO2dVm0M24HWFXbbA7HkZB6TyXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mwf+Qc8y; arc=fail smtp.client-ip=52.101.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mwf+Qc8y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtmvfhevFIf2p8DUM7tF6sQjm/moT49QO8GVvWEXob8sU9GzxT7Coil1ZzkbuPRFCkJ9Oy96Zcrzoq/5cCJK9b5SbItm3qrkjwuoIgtKhnt9bvRyIRDU1yUcQ7w4nZArVI1iKkofarnxvPfDpyKBzWChPe4PAVt17T9fXXisWCMVfiGKy1ryMDLfGed+evpIZFy+eoPuiBny6JukGK9xbn1/6dMDWFX68exWc+avmgJd+ieZ9X2eVbDN2/rUN+oqmr2ko2KJ4Uta8vKQ7uIXtRxyY4msNJ7z/Gtw7ok0TI8fnSolY5GpAeqYjk4FG/hL5jB0R06P0Wrsogo0m1l/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUAuoRYHOQe0DMrMbpa8M1vwwywut1zu7luM2ZZ/OxQ=;
 b=pblIg1JxmZADTwrJHeZreIw7s8vd+KiFdqOtqrUBL1rzLHQZF6ISK5OBb3cCgy7DuVMClHyNjwQu8dgMPEEYuGlTW5KCQQDP3aAhQGr3r0/eyqAZkonNHFhpHj9uPvui1j9hyCuQqtxRY1jYN10ROne/TSIA6oEj87QSW4UEeePDq2KrEQh3ZEcjPeCRuw6tgGiXRmozzGT0p13EDEmktEjgyEL/evroQlLMgClrVKpb1NP/ZoXC7UjypwhAdOtJGYyyU1TKaWm7VoBGverpEHgb82Qtx/v+l/CFuFztAxPoSY0+lCCC6wy/8s4RzBDNGbNon5mu5ZAOew/K+1A+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUAuoRYHOQe0DMrMbpa8M1vwwywut1zu7luM2ZZ/OxQ=;
 b=mwf+Qc8y1Qj11RpwrTJf0UpMbCGZmPYMHzL+GnywJbfZayybPXKytW7MW6W9D+xExwAu9kc1ruo80Bi9BBVs5wLaZhMrZ2iHW9Ov7w2oVA3VHI0TyK/0f0tTOp6268yyiTh5AOfSaIWRm1hTlcAZBsOiIJ7MKtAhBr3qwFm9USEDf3bTLos2e2mN38me0FqyFYJ7s5oSNy70hdOFFZf6deVBQN2+dqPXhKW41fer94JoFAsjhCWNHl92O98F62JyN7MOa+5gp1mngIwEeKQTshQDlrqy67PnFgNk2biz5SRjpNiaxFVZ/Mh71/5CSoa27axXpDaXYwnuCI4LWTGvJw==
Received: from BN9PR03CA0900.namprd03.prod.outlook.com (2603:10b6:408:13c::35)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 07:52:44 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::24) by BN9PR03CA0900.outlook.office365.com
 (2603:10b6:408:13c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:52:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:23 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:52:22 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:52:15 -0700
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
Subject: [PATCH v2 22/32] gpu: nova-core: vgpu: encode vGPU boot requests
Date: Mon, 14 Sep 2026 10:48:57 +0300
Message-ID: <20260914074907.1399629-23-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 57007c50-be4d-4544-9d4b-08df123528db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|10067099003|3023799007|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	b6W8lc977XtE8r7aT6xSyHovS5cTQQliiwMgZDQvJGdktlMzxKlwtReK4ybCrl5sRS6f4Rr2soj7ZpK08XPwn+UaJ7Q7eRNv3ESxZfCkCh7TnkvUIQTtcnNcAlAQ5qYF2ejcNRcjE/itAO5DSZGhisa5iFQPllMzYqFta2ARqHmRfQUL6pPHOmvJTl1o8QQZL7qM3dMjkZUS7S/RIeELa92hBc1Dl04+Hc5NwJw5CRQsug0IazVYDTWCRbnpsIXjRPaOx5JY/HufOqwkQLm2ninjQl+BseWzwz0u+L85K7HYA/nypBFUOAx9ctXt9UbL1y9eutLCyJXysHeGFVgeb1bDc63Y7GOUHgkAc69ZLOq8ZjJWNyEG2huUupGUICbESg20D9cHc+M9+pMc0XQvHdcficIgTR3bFELbfZkOyQIOdWwrofrmLVuFwOjj+6iEEcGiArPxGk8ZRwkB3JO1CWQNsDjQ+5OfisdbUd4e1+mnbf1RxuX/VsD5WphEX8AoPhvfY06zPQgIT/7n18D8l9JqXvxiRJ4Yfsemr327UKbXj4NiZ3QttsQLBhBK+hH4j/i2MVYseU8c4Clnx9eLWtYSiMMHeuIbABSgQmSKrmPMyFxDRZfTo/SzDSamDEQM9oqVxz88vB1eutNdAJh4VVNcg+4ere7RUCPxOoYcxu8vEWlStnV7zvVW/QqokmdjQko20c430BSbT6buqoPcQQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pJuBgzdZUK7LHLNndVoaXApJ/GcrdV8L/zbEQlNKER58jZPKMTbXNgFPba09s9Z+gvsi0TsIyPbW0YCeuZBDsFe7JPaaLzRrkyUb/ijeUNtiZ9M0E3L2+uXdZOVSqdE0MLHbCE6gg5V3rSj4P1d0LnjbVorYZrEoUOex0YAo+i/dnza/59m89PW+njB0Fh9De6U1OGZIj+qVXeOrojo8xntS++Iijn0K1Mzt230FDMYjQlfPMnIA7r+UE+sxCLRBv8Wh137rEs0bbxU6ujZfkg8R3xvpSjf4iekscBAJ8hFKQCGNWlY5IaOrR1QONgnmeGTiTwsYZD9kIJnv+aAvvBTyyuyqJPbntnDbZpOrUm1Lt4VSxnc5vuJpbag4GWty+AkKjhSxI5vvHqMsk1bPULp3zcdyi7OOtihDTFqOvCLkosTVYNEoe/2a1ILzlsWt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:43.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57007c50-be4d-4544-9d4b-08df123528db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106

The vGPU boot command describes a vGPU's channel assignment, framebuffer,
plugin heap and log buffers to GSP. During vGPU instance creation,
once all resources have been allocated, this command registers them
with GSP-RM and boots the GSP plugin.

Add the NVKV request schema and encoder, including the channel map
and guest framebuffer segment arrays.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/nvkv.rs         |  11 ++
 drivers/gpu/nova-core/gsp/nvkv/encode.rs  |  12 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 163 +++++++++++++++++++++-
 3 files changed, 185 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/nvkv.rs b/drivers/gpu/nova-core/gsp/nvkv.rs
index 9f2119b98b26..8d8dd4435354 100644
--- a/drivers/gpu/nova-core/gsp/nvkv.rs
+++ b/drivers/gpu/nova-core/gsp/nvkv.rs
@@ -168,6 +168,17 @@ pub(crate) struct Array<T: Default + Copy, const N: usize, const KEY_ID: KeyId>
     vec: ArrayVec<T, N>,
 }
 
+impl<T: Default + Copy, const N: usize, const KEY_ID: KeyId> Array<T, N, KEY_ID> {
+    /// Creates an array filled from `values`.
+    ///
+    /// Fails with `EINVAL` if `values` is longer than `N`.
+    pub(crate) fn new(values: &[T]) -> Result<Self> {
+        let mut vec = ArrayVec::default();
+        vec.extend_from_slice(values)?;
+        Ok(Self { vec })
+    }
+}
+
 bitfield! {
     /// The op word that starts each NVKV operation.
     struct Op(u64) {
diff --git a/drivers/gpu/nova-core/gsp/nvkv/encode.rs b/drivers/gpu/nova-core/gsp/nvkv/encode.rs
index 0047be65e8a9..1f4df24d8c9c 100644
--- a/drivers/gpu/nova-core/gsp/nvkv/encode.rs
+++ b/drivers/gpu/nova-core/gsp/nvkv/encode.rs
@@ -6,6 +6,7 @@
 use kernel::prelude::*;
 
 use super::{
+    Array,
     EncodedStream,
     Index,
     Key,
@@ -145,6 +146,17 @@ fn encode(&self, encoder: &mut Encoder) -> Result {
     }
 }
 
+impl<T, const N: usize, const KEY_ID: KeyId> Encodable for Array<T, N, KEY_ID>
+where
+    T: Default + Copy,
+    for<'a> IndexedKey<&'a [T], KEY_ID>: Encodable,
+{
+    #[inline(always)]
+    fn encode(&self, encoder: &mut Encoder) -> Result {
+        IndexedKey::<&[T], KEY_ID>::new(Index::new::<0>(), self.vec.as_slice()).encode(encoder)
+    }
+}
+
 impl<T: Encodable> Encodable for Option<T> {
     #[inline(always)]
     fn encode(&self, encoder: &mut Encoder) -> Result {
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 51226bbca757..3af84c584dd6 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -8,12 +8,18 @@
 
 use kernel::{
     alloc::ArrayVec,
-    bitfield, //
+    bitfield,
+    prelude::*, //
 };
 
 use crate::gsp::nvkv::{
     nvkv_decode,
+    nvkv_encode,
     Array,
+    Encodable,
+    EncodedStream,
+    Encoder,
+    Index,
     Key,
     KeyId,
     Required, //
@@ -28,6 +34,161 @@ pub(in crate::vgpu) struct Dbdf(u32) {
     }
 }
 
+#[derive(Clone, Copy)]
+struct SwizzId(u32);
+
+impl SwizzId {
+    const WHOLE_GPU: Self = Self(0xFFFF_FFFF);
+}
+
+impl From<SwizzId> for u32 {
+    fn from(value: SwizzId) -> Self {
+        value.0
+    }
+}
+
+bitfield! {
+    pub(in crate::vgpu) struct ChannelMapEntry(u64) {
+        15:0 engine_type;
+        31:16 index;
+        63:32 chid_offset;
+    }
+}
+
+impl ChannelMapEntry {
+    const KEY: KeyId = 0x1001;
+
+    #[expect(dead_code)]
+    pub(in crate::vgpu) fn new(engine_type: usize, index: u32, chid_offset: u32) -> Result<Self> {
+        Self::zeroed()
+            .try_with_engine_type(u64::try_from(engine_type).map_err(|_| EOVERFLOW)?)
+            .and_then(|entry| entry.try_with_index(u64::from(index)))
+            .and_then(|entry| entry.try_with_chid_offset(u64::from(chid_offset)))
+    }
+}
+
+impl Encodable for KVVec<ChannelMapEntry> {
+    fn encode(&self, encoder: &mut Encoder) -> Result {
+        // SAFETY: `ChannelMapEntry` is a `bitfield!` over `u64`, i.e.
+        // `#[repr(transparent)]` around a `u64`, so the entries are
+        // layout-compatible with `u64` and can be viewed as a `u64` slice.
+        let slice = unsafe { core::slice::from_raw_parts(self.as_ptr().cast::<u64>(), self.len()) };
+        encoder.encode_array64(ChannelMapEntry::KEY, Index::new::<0>(), slice)
+    }
+}
+
+bitfield! {
+    struct VgpuBootloadOptions(u64) {
+    }
+}
+
+nvkv_encode! {
+    struct VgpuBootloadRequest {
+        dbdf: Key<Dbdf, { Self::DBDF_KEY }, u32>,
+        gfid: Key<u32, { Self::GFID_KEY }>,
+        vgpu_type: Key<u32, { Self::VGPU_TYPE_KEY }>,
+        vm_pid: Key<u32, { Self::VM_PID_KEY }>,
+        swizz_id: Key<SwizzId, { Self::SWIZZ_ID_KEY }, u32>,
+        num_channels: Key<u32, { Self::NUM_CHANNELS_KEY }>,
+        num_plugin_channels: Key<u32, { Self::NUM_PLUGIN_CHANNELS_KEY }>,
+        guest_fb_segment_count: Key<u32, { Self::GUEST_FB_SEGMENT_COUNT_KEY }>,
+        options: Key<VgpuBootloadOptions, { Self::OPTIONS_KEY }, u64>,
+        channel_mapping: KVVec<ChannelMapEntry>,
+        guest_fb_segment_phys_addr: Array<u64, 8, { Self::GUEST_FB_SEGMENT_PHYS_ADDR_KEY }>,
+        guest_fb_segment_length: Array<u64, 8, { Self::GUEST_FB_SEGMENT_LENGTH_KEY }>,
+        plugin_heap_phys_addr: Key<u64, { Self::PLUGIN_HEAP_PHYS_ADDR_KEY }>,
+        plugin_heap_length: Key<u64, { Self::PLUGIN_HEAP_LENGTH_KEY }>,
+        ctrl_buff_offset: Key<u64, { Self::CTRL_BUFF_OFFSET_KEY }>,
+        init_task_log_offset: Key<u64, { Self::INIT_TASK_LOG_OFFSET_KEY }>,
+        init_task_log_size: Key<u64, { Self::INIT_TASK_LOG_SIZE_KEY }>,
+        vgpu_task_log_offset: Key<u64, { Self::VGPU_TASK_LOG_OFFSET_KEY }>,
+        vgpu_task_log_size: Key<u64, { Self::VGPU_TASK_LOG_SIZE_KEY }>,
+        kernel_log_offset: Key<u64, { Self::KERNEL_LOG_OFFSET_KEY }>,
+        kernel_log_size: Key<u64, { Self::KERNEL_LOG_SIZE_KEY }>,
+        mig_rm_heap_phys_addr: Key<u64, { Self::MIG_RM_HEAP_PHYS_ADDR_KEY }>,
+        mig_rm_heap_length: Key<u64, { Self::MIG_RM_HEAP_LENGTH_KEY }>,
+    }
+}
+
+impl VgpuBootloadRequest {
+    const DBDF_KEY: KeyId = 0x0001;
+    const GFID_KEY: KeyId = 0x0002;
+    const VGPU_TYPE_KEY: KeyId = 0x0003;
+    const VM_PID_KEY: KeyId = 0x0004;
+    const SWIZZ_ID_KEY: KeyId = 0x0005;
+    const NUM_CHANNELS_KEY: KeyId = 0x0006;
+    const NUM_PLUGIN_CHANNELS_KEY: KeyId = 0x0007;
+    const GUEST_FB_SEGMENT_COUNT_KEY: KeyId = 0x0008;
+    const OPTIONS_KEY: KeyId = 0x1000;
+    const GUEST_FB_SEGMENT_PHYS_ADDR_KEY: KeyId = 0x1002;
+    const GUEST_FB_SEGMENT_LENGTH_KEY: KeyId = 0x1003;
+    const PLUGIN_HEAP_PHYS_ADDR_KEY: KeyId = 0x1004;
+    const PLUGIN_HEAP_LENGTH_KEY: KeyId = 0x1005;
+    const CTRL_BUFF_OFFSET_KEY: KeyId = 0x1006;
+    const INIT_TASK_LOG_OFFSET_KEY: KeyId = 0x1007;
+    const INIT_TASK_LOG_SIZE_KEY: KeyId = 0x1008;
+    const VGPU_TASK_LOG_OFFSET_KEY: KeyId = 0x1009;
+    const VGPU_TASK_LOG_SIZE_KEY: KeyId = 0x100A;
+    const KERNEL_LOG_OFFSET_KEY: KeyId = 0x100B;
+    const KERNEL_LOG_SIZE_KEY: KeyId = 0x100C;
+    const MIG_RM_HEAP_PHYS_ADDR_KEY: KeyId = 0x100D;
+    const MIG_RM_HEAP_LENGTH_KEY: KeyId = 0x100E;
+}
+
+/// Encodes a `VGPU_BOOTLOAD` request using the typed NVKV schema.
+#[expect(dead_code)]
+#[expect(clippy::too_many_arguments)]
+pub(in crate::vgpu) fn encode_vgpu_bootload(
+    dbdf: Dbdf,
+    gfid: u32,
+    vgpu_type: u32,
+    vm_pid: u32,
+    num_channels: u32,
+    num_plugin_channels: u32,
+    channel_mapping: KVVec<ChannelMapEntry>,
+    guest_fb_address: u64,
+    guest_fb_length: u64,
+    plugin_heap_address: u64,
+    plugin_heap_length: u64,
+    ctrl_buffer_offset: u64,
+    init_log_address: u64,
+    init_log_size: u64,
+    vgpu_log_address: u64,
+    vgpu_log_size: u64,
+    kernel_log_address: u64,
+    kernel_log_size: u64,
+) -> Result<EncodedStream> {
+    let request = VgpuBootloadRequest {
+        dbdf: dbdf.into(),
+        gfid: gfid.into(),
+        vgpu_type: vgpu_type.into(),
+        vm_pid: vm_pid.into(),
+        swizz_id: SwizzId::WHOLE_GPU.into(),
+        num_channels: num_channels.into(),
+        num_plugin_channels: num_plugin_channels.into(),
+        guest_fb_segment_count: 1.into(),
+        options: VgpuBootloadOptions::zeroed().into(),
+        channel_mapping,
+        guest_fb_segment_phys_addr: Array::new(&[guest_fb_address])?,
+        guest_fb_segment_length: Array::new(&[guest_fb_length])?,
+        plugin_heap_phys_addr: plugin_heap_address.into(),
+        plugin_heap_length: plugin_heap_length.into(),
+        ctrl_buff_offset: ctrl_buffer_offset.into(),
+        init_task_log_offset: init_log_address.into(),
+        init_task_log_size: init_log_size.into(),
+        vgpu_task_log_offset: vgpu_log_address.into(),
+        vgpu_task_log_size: vgpu_log_size.into(),
+        kernel_log_offset: kernel_log_address.into(),
+        kernel_log_size: kernel_log_size.into(),
+        mig_rm_heap_phys_addr: 0.into(),
+        mig_rm_heap_length: 0.into(),
+    };
+
+    let mut encoder = Encoder::new();
+    request.encode(&mut encoder)?;
+    Ok(encoder.finish())
+}
+
 nvkv_decode! {
     pub(in crate::vgpu) struct VgpuPropertiesSchema => VgpuProperties {
         // TODO: `name`/`class` required?
