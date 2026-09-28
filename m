Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE818E025
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591515; cv=fail; b=uxbBxFkOQEI/a5FEXKgZY7Iez0//XdVaiYVw0bR1zZwQUE9nx82nvIzICml/F1jFV0gGJbqHtu3dTvku2gyMq3yIHMMRySSWGDfJvaXpL9LMxWRxYVCnFSlCclzo8K+cP7pE8HNCJnDjzoZYkNHDQzqxZEciR5DB9/uXLqQR8C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591515; c=relaxed/simple;
	bh=L1dqbB4l99Q/HDzGNdbDqJgRUcE8jkjnrXPeL0Ibf8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTLCfHt6+ebpfTHX8RMFOxmYEsjEKqEGKR13zVjUBu9NF9LcI5OZx7fCJiPx+3Aby2/+3tdfsB6AZSSzz3hc3Me5Hz3Ae+4LfahN+YIuwLFEinxY1wkcWgGDJny7IyTGdtfHVqkyFgUwf0x8jjzBIuicmkSpO+AGhzXC2zxs+OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AiiJMkKz; arc=fail smtp.client-ip=52.101.53.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AiiJMkKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9D3viCk0as7QbuXAywnM63Om0GrjvrcCXBjnpHfSeOoS/UgX+csvmgNVAEWcWJ3/WkvGEMptqZE65AwEiMCMiwLDNGIIsX9yzSSAOKn/azbgPsgGHwvK66toU3sG/Lb0jO0leN2zbEBtks3+YpEXikf7ex1zgRW2UoLB3FxkrpUdb8Nz1Nbk3mndcrzGTLd4V2eCletIni4FAkPQNHqOe7fkFRE8F/4daYxNhxpDQoaEBZRsQ+vJftaLFtulzuCe0MzGVuFm+2/3IBBQi1tEw6hmMoQh9I1cbpJN/zvguLbrHnxrLfB+VtqBYyw+84Dl+mdJFCZ+3GJwlcUgtTKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgp3/YkVRCfI4icWY/nEHQJbc4ouuIBzjq1OsdvscQg=;
 b=VUb0OllW3ct4X8zPDkodGd8N1fE6qXMs8Cq7pSDrEDQhtNoKRv6MO2QhLQ9xUrY0BSBllmYWsLnC2IvPFMzI5CAscfCrHTeLDySImpQ6qEDXdvGSj/9+5E78vsHZAGbRGTs6W11t4sQfB9uOxVYmHkWIAO3tyQ4lI0rlOysx7NU34EIb0vrYH1oHjSvW3KhhSqlQJ+E3gVJPIbjKH3oIFUGvQHKwNEb+dlABPYgWg/pM5VTUaEwj8UIdfMcPRtM8pLH8b342Q5dFiZDOmUitqbDBRNpZg0TqSRmXopF8bAdZTLQH+bA2ryfJapNE2vAzOIhgjFoTefCS6XGO+ZaWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgp3/YkVRCfI4icWY/nEHQJbc4ouuIBzjq1OsdvscQg=;
 b=AiiJMkKzhbYPOWLYSqZ4tcuGns2AAYOHV1Iif1ymct58iEv4o9Ipa5ZcPfMGmJqbncEGbjMfePTRWUk3hIsqLNxFTgg6CRO1rxSGCj6Q+rEPIDSXfEptTcPFZ+7SemymlNw97ISvrKEc1fKsKhxUXgXN7VmAbPYfnv9N5T62E6Xp2RY25Yx7I8xFqYJO/9DkbVkLsNL+s7dr17WaQcFOP498OXtkdEDJsLhvVz3DZHMaVwnZoY7vJyf/7cKYF64906tpf5fjLNXsxGQcX+mIupTG1TVgJ6noBBxRRxSv2PGTil65crtHBrtIGLcJvaIEFyyGcUeJ3H8rgTkQ2d3OOA==
Received: from SJ0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:a03:3a0::7)
 by SN7PR12MB8789.namprd12.prod.outlook.com (2603:10b6:806:34b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:31:48 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::85) by SJ0PR03CA0242.outlook.office365.com
 (2603:10b6:a03:3a0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:47 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:31 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:31 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:23 -0700
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
Subject: [PATCH v3 19/31] gpu: nova-core: vgpu: encode vGPU boot requests
Date: Mon, 28 Sep 2026 13:28:22 +0300
Message-ID: <473ff4cbabf401357934a611c0310499130d9efe.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|SN7PR12MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0fbd89-5f43-4685-5d33-08df1d4bb35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ovSHx7aOLrjRJu1d52y6MPXIq0swfFf+naxqP11BmJM+Bl+yRhSUkA8qiO+ecQmZuZs5RAgegRF9hdxS2NzTWGCQGfJhlLOfdUlU0C5aIYP+OQm2p5crYOfodq4dmI7mHEtDDbB7vkPHQ/e+9ToAjk3IUDcqwyOIx50aEwt3jLPw+zKBT752/jlX/yYsTx218Ru2MNkl0gzWlh1EdntueTjBeYPHCvoRJpwGwrb5Z2vr+RLPxVlQ4SSkd5G3zrs2UD7psPONKQvRGtYymtFYIbZN9Wng/Mm6fymsXHmOvK+FYfx+8DCjVFhp43GfSg9Jmr2FuhB3iWTAyDxvrhVWD4H41ConqESJWtzFlQ8hrRWA5pwmxtS/kcb2FCjR6iLr19qqoKZSmFdmTQXkuhTFO09dScdsgJzILw7Xn9Tk/Cd1nM4obYkW0zw+8o927jn2ZVNBPTdBWqdvoytIEQzcPH7ruc2YQGz9R/iAfEpjvXnTP07uJts2Qevhd0oQ1qWzn+3siQKFUhcYO/LT7Y3urlg729Fk9GaKNC54rviuemP6WVeXIcrG5JgWUtQkRVu3Xg3lSTQOMQNQW5/LiazVvky5oxTMPnMXyHQFhCWyOcWZEtLnU3S95KzXSMp1Hqrq1En5yYZ0QPq8ExU1kmV3T2eh6xHHJ0SbFxLmXgH1E9Eoj3r44hoHVMg+ebKH4GuJLLbY+FZFi65FgQf5G2C3yQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iAUlZDi8JKHzoJUp/jO7h2M2Sp5NZ4CIX9jXdnpJhtiLAtbusEdGMRJLkjq+U7MQrxmVkmR9Eq6NfA33vkBsdiKqJFe/O5BMgU+D6qFd3iHU7xnvP1hpnans3YWTbW7azowiE46zcU0RYBocUpRe/Z7eeTwASeHydfbHW9QVX72bmwqgaZM/T3mRotP7j+H0kKfT3osSPJ88W9DerN69N66qI55jP/a+V0q3lqUD+yA5uu9Nv4wljPV09q1p2yiP8OtHs8pZsC9riHL4znq0QIjyK93eVIlW1a2MiqsNZ/tbrKYzc5FKDJ1e2LxS9uZ/zJYREzZ1iq/S8Ef2+CBOnXkJqaax88fZn6yExGcsijoNlXSCWNaJWIvu7GgQXb1MncsixRziQ+6DrGhGoIqnv5MZ4+YxNa5xFVqD/r+hP7+4xtS29ZJ8j/wn9nnfCkl1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:47.7840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0fbd89-5f43-4685-5d33-08df1d4bb35d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8789

The boot request describes a vGPU's identity, channel map, VRAM,
plugin heap and log buffers to GSP-RM.

Add the NVKV schema and encode it from a named boot description. Pass
VRAM region views so each physical address stays paired with its length
until encoding, and retain the control offset relative to the plugin
heap. Represent channel-map engine and index fields in their 16-bit wire
domains.

Describe one guest VRAM segment and the current whole-GPU,
non-SMIG resource layout. Keep separate MIG-RM heap fields zero for that
supported firmware path.

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/nvkv.rs         |  11 ++
 drivers/gpu/nova-core/gsp/nvkv/encode.rs  |  12 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs | 169 +++++++++++++++++++++-
 3 files changed, 189 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/nvkv.rs b/drivers/gpu/nova-core/gsp/nvkv.rs
index 05b1ba5a4f39..02a12bd831d6 100644
--- a/drivers/gpu/nova-core/gsp/nvkv.rs
+++ b/drivers/gpu/nova-core/gsp/nvkv.rs
@@ -172,6 +172,17 @@ pub(crate) struct Array<T: Default + Copy, const N: usize, const KEY_ID: KeyId>
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
index a4d23eae8233..83048473d35f 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -8,17 +8,24 @@
 
 use kernel::{
     alloc::ArrayVec,
-    bitfield, //
+    bitfield,
+    prelude::*, //
 };
 
 use crate::{
     gsp::nvkv::{
         nvkv_decode,
+        nvkv_encode,
         Array,
+        Encodable,
+        EncodedStream,
+        Encoder,
+        Index, //
         Key,
         KeyId,
-        Required, //
-    }, //
+        Required,
+    },
+    mm::vram::VramRegion, //
 };
 
 bitfield! {
@@ -30,6 +37,162 @@ pub(crate) struct Dbdf(u32) {
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
+    pub(crate) struct ChannelMapEntry(u64) {
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
+    pub(crate) fn new(engine_type: u16, index: u16, chid_offset: u32) -> Self {
+        Self::zeroed()
+            .with_engine_type(engine_type)
+            .with_index(index)
+            .with_chid_offset(chid_offset)
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
+/// Identity, channel mapping and VRAM regions passed to a GSP plugin at boot.
+///
+/// Region addresses are physical VRAM addresses, including the log fields whose wire
+/// names contain `offset`. The control-buffer offset is relative to the plugin heap.
+pub(crate) struct BootloadInfo<'a> {
+    pub(crate) dbdf: Dbdf,
+    pub(crate) gfid: u32,
+    pub(crate) vgpu_type: u32,
+    pub(crate) vm_pid: u32,
+    pub(crate) num_channels: u32,
+    pub(crate) num_plugin_channels: u32,
+    pub(crate) channel_mapping: KVVec<ChannelMapEntry>,
+    pub(crate) guest_fb: &'a VramRegion,
+    pub(crate) plugin_heap: &'a VramRegion,
+    pub(crate) ctrl_buffer_offset: u64,
+    pub(crate) init_log: &'a VramRegion,
+    pub(crate) vgpu_log: &'a VramRegion,
+    pub(crate) kernel_log: &'a VramRegion,
+}
+
+/// Encodes a `VGPU_BOOTLOAD` request using the typed NVKV schema.
+#[expect(dead_code)]
+pub(crate) fn encode_vgpu_bootload(info: BootloadInfo<'_>) -> Result<EncodedStream> {
+    let request = VgpuBootloadRequest {
+        dbdf: info.dbdf.into(),
+        gfid: info.gfid.into(),
+        vgpu_type: info.vgpu_type.into(),
+        vm_pid: info.vm_pid.into(),
+        swizz_id: SwizzId::WHOLE_GPU.into(),
+        num_channels: info.num_channels.into(),
+        num_plugin_channels: info.num_plugin_channels.into(),
+        guest_fb_segment_count: 1.into(),
+        options: VgpuBootloadOptions::zeroed().into(),
+        channel_mapping: info.channel_mapping,
+        guest_fb_segment_phys_addr: Array::new(&[info.guest_fb.address()])?,
+        guest_fb_segment_length: Array::new(&[info.guest_fb.size()])?,
+        plugin_heap_phys_addr: info.plugin_heap.address().into(),
+        plugin_heap_length: info.plugin_heap.size().into(),
+        ctrl_buff_offset: info.ctrl_buffer_offset.into(),
+        init_task_log_offset: info.init_log.address().into(),
+        init_task_log_size: info.init_log.size().into(),
+        vgpu_task_log_offset: info.vgpu_log.address().into(),
+        vgpu_task_log_size: info.vgpu_log.size().into(),
+        kernel_log_offset: info.kernel_log.address().into(),
+        kernel_log_size: info.kernel_log.size().into(),
+        // The current non-SMIG firmware path does not map a separate MIG-RM heap.
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
     pub(crate) struct VgpuPropertiesSchema => VgpuProperties {
         // TODO: `name`/`class` required?
