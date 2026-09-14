Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B03F12F9
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372337; cv=fail; b=O5/j2EW5CoQjXV/FPicSBYAHbII2yRixSU98mpDvAINlL9lvnEuRcQKm/hY++hKBEGvX6BBmu7RjWyC/NvpV6bx9uXUtrGG3S/BMDT3aIy4MngqwiJ5FAr4TG+ec8U5oy0DAcuRf0bzyKjHDYnC7mmNd3sMGmzTGOtluHsU679w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372337; c=relaxed/simple;
	bh=V6NyWZmYhfYM7T5r/Mm7VENiVknDB0s+8Bgwa3eN64M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJqSAZarf8mOYQmDytlEni7dpuJ0Sjwe+tmdwO8pq2NYtCUHCvtkLRD6AB1OwBrcc79usqWFCYnLgFeKJHIgjmMJntZbN6KcXKDXwuY7Y6g2zV/Glmw80eEeBXRttha2GytjBQnqh+mjU0JxiPx5FwCadwBg7m8XF/Su6F8r5Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PM2ilXpS; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PM2ilXpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDET6D5/5zKcv4yOFer2jJ6TejQKDVU4x+PzHoZwMEJOrO2xwcX1ZIJLdT689XZi/Vid6JaGkr0MAXZTNYMdR8mWObMTMIfZIC87uJNERGo01IwSbAV+Ykuyq2RE2tZU6SOC54AVBTPLlwBagm74CEtvQT+ps2ezGcMGW+jzqO4PaAmihTWEdocYz8/4uYTwdzEr38Sq0EURrFLkd+O2dYVAs/cqaSHWZMhtrhIwKdr5H4IXnnoMD3cEqjsgyQCyCxizrimbnHKWcqrK90TqxejqMhgAtIWJPI+Y9kx7oZGt1yw9BF7VEu5ezNASpDYiJcr/5h8u8yuw1E2TKPqV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP2gb2V6G6/zTJMwVKH4cD9GrOqTcsphCp8BTTIr8Ig=;
 b=MNJYBj4/giA4vfP4uZ+1+60nZ58AZXRyJkuuDyFj3O4sv5kATKkm3hNniX0Ue2n/AIrVHIqB9TGDcc+cIff7BqxwRjiENG7DvmaHJLWRuPduSQh4JRMJxRThplVGR+pWIwicIFOZ4U68vwQPqs3tFFhvJ+mPaNY6joSwJXG4+4J17g5xhM43zpgz+BuuqJKKh2IWVWKXbNN78S+YcoaUtY0Bbh8BqgTMwi89qR2AKDTVWVhEHGlLCXVU2Pl++xoV+BSSAc8VENz1oMi3zlttKBPB6IoxRH0R+W3bV4DijBRKD5MQPFtbFTydLCr1dDzEKPx6unYLrWX8AbCjSJFAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP2gb2V6G6/zTJMwVKH4cD9GrOqTcsphCp8BTTIr8Ig=;
 b=PM2ilXpShbNEi44PGueDl37e+vLAVrKXNXSVu11h+pcOv4nK0UuPOmyIhbhsTrhEBIQ5xmJyjYf/fdzS48S76/IkVaHZOcHYbuxlMkX8Yn/aNPk7DsGy1ZeZOMcM5meMrgYA3PGQVwSAa/wAbBZiZu/M+eSDalK83Lv8Xlehl4NbwWgd4st1d6NeWy8k7BOB5EGehWycss/xn7DncUM6wa5NePweZOdDSMWaa5ODrO8kT9VK/H6UN1LG5zyXYWpNtVSvZMg2//nyYyRkXF4873IlbzoF82qaC67j4wC1gRkSPKucMMxL0vQKLVuAkgU55iL+h3YcmR5fmYKNauQC4Q==
Received: from MN2PR22CA0012.namprd22.prod.outlook.com (2603:10b6:208:238::17)
 by MW9PR12MB999209.namprd12.prod.outlook.com (2603:10b6:303:301::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:52:10 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::4c) by MN2PR22CA0012.outlook.office365.com
 (2603:10b6:208:238::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:51:50 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:50 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:42 -0700
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
Subject: [PATCH v2 18/32] gpu: nova-core: vgpu: add VRAM slot allocator
Date: Mon, 14 Sep 2026 10:48:53 +0300
Message-ID: <20260914074907.1399629-19-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|MW9PR12MB999209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9861c4aa-1de1-483d-c7c4-08df1235148f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9ecWjH5mVuu9LhmKb67Jxet+ZTD/bdLYnR2FljlGXwzCrLKnkyRlNbPpP21bIrMjTOVXpd4nneJbgLYTpxHcWROCLMyRNTKC2lnfECMC5b1I/BNNY+YhrhK4Vz/YWUl436hunXMaZwi8ufOVPiF2bCHKOJjKwGfVqwuJIHD2Fw0ASAqW1/5GIimyt/LgxxoM800gd1uPWP4/+SQafmIbkfHCTH/N7SFuJw74Na+EI1JMVv/0iiKtSfNO+gBd8jOBZGAGYO2nnn6tp1aZORp8N3JHugEVvXshRXzKCg6iTTRjWrZpD6fMRZ/3ZXNkP6uAU6/NZYhN7y/1t2GoqSEXnkxdbXOTVepdFAsmByewUMImeGYwAEJoazi1VBfJAvS8Gp1oa/nYwRKsrDG1j7b3Xv1lBOnAQY0ug09vsV95TU+zx5C8jcZTKctanNKVy8wWd56BklEpQdSPttA6em1X0nmO4UX3CRuDuFVP7Pm/IFF4F7D8X8baWHOGivMhuAg9nTdCq891WLN8WMjjsrVuTXd24vDBVK9gPBQDcYB19Oi/EY+z8FiDo0yU0b+G9uw9l3PKKXLHGgDbi+98sAT/ekE53Qt1Vujd0SRIa6oAqNmAzpDgT6LqJ3sikGQqcIKbij9WGEaXEwpdNT/wS2rwB/WTjDA/zDp+239UcKheoHIYGkZxSHfNwRiJz2z+o95wbDzYUVsO2NebpgeHJr/piQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S93UsrbM/1eby5T8XdlWLDvqyqfsIeEOVtW3lvP3laR9a5HyhrbD0HFmUOJ3Yb9AI9UCaMCS4kUbxxyH6/j4BChmVY5nWox8vm4S8smo8HHPGt6i58iPyy4uvhesksRNZNcPLglQNlZdEnTPcItS+re6eTfsHjATsGE4qbBOwCoTS8X74RNIS2Zq4+s2u2q/Qce9OQ+xmApEZWuaOsIkjXEa1fQk96+CvrdKa7l+lIUMfWQNYqlH3BxJBFHIfHOM/aKobf2ZNDfVOth9m2LPY4KfKgNu9aAS7UTaEb610DzpvLfh/kMktEaYpjL0ZxPrFv1JJplExmduE7TzSLSmj05sZpKexNMtfE44I34syW5hBt/sEJIuSxk6j59ymFIXKxpZtZ8oG5w0YUbjxoQn4YPddxqndQAC9OXVLH8rfOWWkoxg2yvxVyXClMOETugt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:09.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9861c4aa-1de1-483d-c7c4-08df1235148f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999209

From: Alok Kumar <alkumar@nvidia.com>

A vGPU type specifies the guest VRAM and GSP plugin management-heap
sizes for each instance. Allocating these regions independently fragments
VRAM and does not preserve a stable layout for the vGPU type.

Add a standalone slot allocator that reserves one exact VRAM range and
tracks assignments in a bitmap. Validate the vGPU type's layout and reject
an allocation request whose layout differs from the active pool.

Lay out all guest VRAM slots first and all management-heap slots
second, pairing them by bitmap index. Require the guest VRAM stride and
pool base to satisfy the required VMMU-segment alignment.

Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu.rs      |   1 +
 drivers/gpu/nova-core/vgpu/vram.rs | 146 +++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 drivers/gpu/nova-core/vgpu/vram.rs

diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 348af9ea3fc2..6a876f8539f0 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -21,6 +21,7 @@
 };
 
 mod hal;
+mod vram;
 
 /// vGPU state detected during GPU construction.
 #[derive(Debug, Clone, Copy)]
diff --git a/drivers/gpu/nova-core/vgpu/vram.rs b/drivers/gpu/nova-core/vgpu/vram.rs
new file mode 100644
index 000000000000..2dc751b28ae3
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! VRAM slot allocation for vGPU instances.
+
+#![expect(dead_code)]
+
+use kernel::{
+    bitmap::BitmapVec,
+    prelude::*,
+    sync::Arc, //
+};
+
+use crate::mm::{
+    vram::{
+        VramBlock,
+        VramRegion, //
+    },
+    GpuMm, //
+};
+
+const VRAM_SLOT_MIN_ALIGN: u64 = 4096;
+
+#[derive(Clone, Copy, PartialEq)]
+pub(super) struct VgpuVramLayout {
+    pub(super) type_id: u32,
+    pub(super) max_slots: u32,
+    pub(super) fb_size: u64,
+    pub(super) heap_size: u64,
+    pub(super) fb_align: u64,
+}
+
+impl VgpuVramLayout {
+    fn validated(mut self) -> Result<Self> {
+        if self.max_slots == 0 || self.fb_size == 0 || self.heap_size == 0 {
+            return Err(EINVAL);
+        }
+        self.fb_align = core::cmp::max(self.fb_align, VRAM_SLOT_MIN_ALIGN);
+        if !self.fb_align.is_power_of_two() {
+            return Err(EINVAL);
+        }
+        if self.fb_size & (self.fb_align - 1) != 0
+            || self.heap_size & (VRAM_SLOT_MIN_ALIGN - 1) != 0
+        {
+            return Err(EINVAL);
+        }
+        Ok(self)
+    }
+}
+
+/// Dropping a slot does not release its reservation.
+#[must_use]
+pub(super) struct VgpuVramSlot {
+    index: usize,
+    pub(super) fbmem: VramRegion,
+    pub(super) mgmt_heap: VramRegion,
+}
+
+impl VgpuVramSlot {
+    /// Return this slot's index in the allocation pool for its vGPU type.
+    pub(super) const fn index(&self) -> usize {
+        self.index
+    }
+}
+
+pub(super) struct VgpuVramSlotAllocator {
+    backing: Arc<VramBlock>,
+    layout: VgpuVramLayout,
+    fb_region_size: u64,
+    used: BitmapVec,
+}
+
+impl VgpuVramSlotAllocator {
+    pub(super) fn new(mm: &GpuMm<'_>, layout: VgpuVramLayout) -> Result<Self> {
+        let layout = layout.validated()?;
+        let max_slots = u64::from(layout.max_slots);
+        // Keep guest VRAM slots contiguous so each starts at `fb_align`;
+        // interleaving page-aligned heaps could misalign later slots.
+        let fb_region_size = layout.fb_size.checked_mul(max_slots).ok_or(EINVAL)?;
+        let heap_region_size = layout.heap_size.checked_mul(max_slots).ok_or(EINVAL)?;
+        let pool_size = fb_region_size.checked_add(heap_region_size).ok_or(EINVAL)?;
+
+        let used = BitmapVec::new(
+            usize::try_from(layout.max_slots).map_err(|_| EINVAL)?,
+            GFP_KERNEL,
+        )?;
+        let backing = mm.alloc_vram_range(0..pool_size, VRAM_SLOT_MIN_ALIGN)?;
+        if !backing.address().is_multiple_of(layout.fb_align) {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            backing,
+            layout,
+            fb_region_size,
+            used,
+        })
+    }
+
+    pub(super) fn matches_layout(&self, layout: VgpuVramLayout) -> Result<bool> {
+        Ok(self.layout == layout.validated()?)
+    }
+
+    pub(super) fn alloc(&mut self, layout: VgpuVramLayout) -> Result<VgpuVramSlot> {
+        if !self.matches_layout(layout)? {
+            return Err(EBUSY);
+        }
+
+        let bitmap_index = self.used.next_zero_bit(0).ok_or(ENOSPC)?;
+        let slot = u64::try_from(bitmap_index).map_err(|_| EINVAL)?;
+        let fb_offset = self.layout.fb_size.checked_mul(slot).ok_or(EINVAL)?;
+        let fb_end = fb_offset.checked_add(self.layout.fb_size).ok_or(EINVAL)?;
+        let heap_offset = self
+            .fb_region_size
+            .checked_add(self.layout.heap_size.checked_mul(slot).ok_or(EINVAL)?)
+            .ok_or(EINVAL)?;
+        let heap_end = heap_offset
+            .checked_add(self.layout.heap_size)
+            .ok_or(EINVAL)?;
+        let fbmem = self.backing.region(fb_offset..fb_end)?;
+        let mgmt_heap = self.backing.region(heap_offset..heap_end)?;
+
+        self.used.set_bit(bitmap_index);
+
+        Ok(VgpuVramSlot {
+            index: bitmap_index,
+            fbmem,
+            mgmt_heap,
+        })
+    }
+
+    /// Drop a slot's region views and return its reservation to this pool.
+    ///
+    /// The slot must come from this allocator. All accesses and mappings of its
+    /// regions must end before releasing it.
+    pub(super) fn release(&mut self, slot: VgpuVramSlot) {
+        let index = slot.index;
+        debug_assert_eq!(self.used.next_bit(index), Some(index));
+        drop(slot);
+        self.used.clear_bit(index);
+    }
+
+    pub(super) fn is_empty(&self) -> bool {
+        self.used.last_bit().is_none()
+    }
+}
