Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7256442B3B
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595940; cv=fail; b=icEiyy9vAXcbA3nW8mEXaoe8+qiARChd+YEu1pHY9VD5hRa0KpVyc9EkCMLkY5wn2pM8Gy0Q1jWBnoisv9WSRma6fpW7V+o3rBp83SyzWu5hx9eBd9Mjzwghyv2rks4VGUfTq7qUcIj/2SBub8ZQJMhjhP4MizGpAAp+cXDGPFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595940; c=relaxed/simple;
	bh=NPZVXhDgup1NpZjAmqigQVljBrwK92OVIvenmj4F5cQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HD4AExM+0D6aYWpOiqOWb7mSOm57V4mFh6IsEdp1OxRR0V/fRZ7ohQZ8pzgmtOrSLZby8IxkZ3VtOp3B/TIggZEFw2OeZPbcbi9YFeYGByC8O5gS7oCOGdCPySwPHr6WDRbj2eFh4qPPjOSfSOxTSYBP9k1ms+5VRBdL8GjVhEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=blWKUGiU; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="blWKUGiU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPqsa1teqc9+r5SmM29rX5fHnB6gOclykK/Umz5W+vO7uGhrxTXHl2bAmM9RdKZskiaQ7vHWzRDmnjJbm+Qfboy2uATdTEy1vGLzupvj+wa3SzLpIXEC3tqfVPtp9Lehq5SzbHwF1NTOtxFLWGUUqbTEKaUE+Zl6ae+cXtmOEpLh/OhKKvGZc6r5Q7hg39fYHi3vhhD061y3O9bgyMwNc6btRSAodtyMue9+T4wpIaCnGF5ycIERTNLduNT0ixoR+i/aY0YYE7iCKt9NC1RxDVP3MPYmxah7MkBnvO7i1ixPA26W6lUqrwsFlDINAdZWU7JWNCQTTW4qh9hQrVtumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEZAnArd5mg07Do1fyDw6d92qX2/Z6+FIc82zuBpDhw=;
 b=LyRPfDHEaysOe45qwUhOhPNQUxuSJklvnt0wVJ1WJ+LDS93MIUS0Crf/30P240iu7W67oUPi/A//m767bWzL5qEND78TL+kSe05b/Y6Y+pbSoGf6HveoOOYLEQ7pMxwZP6IoPOoWq1iNavaJa0kOB3naLBA52BMW2FK1b+yOYSeK0+Vs2mKVvi342cP8UIQyC2KaVhe7xqNKuusxl+yl2CgchxrqBXWkL6CgVMiZuK0Wlol+bg9YsuE1ww2bVxmTct5Rqry0nTzmRQv4eBNp49Q0z96QrajpSN3mBhzABR3uN2p6UpN6JGjYuOiq1bl7m6v670oZUctcYcoExzIxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEZAnArd5mg07Do1fyDw6d92qX2/Z6+FIc82zuBpDhw=;
 b=blWKUGiUB/rY+874up8N7tw6sDPcQDKrbv3bGWPW22lgDb72pD1wquPV7H/maBHvAY5TWrH4bqmKTRfZISkTHfhnebVwpdlJ/PlMfYShjOjlOHUgMslo6OuvMcZh0jmZ2ajMYsUhQm0BMVnMb1gKhaqJ30hPASKIHytSc0RGf34kQzFoFyd2+ck/X7drvESOZeRSTLbwZ+myNiF1vuSIORGFle9aSw8wpd+w5ML1voDEr+CSaFVvnv3q7xcWxdoJWo8Qhpl1FZ1eg2AzVxKdXX1ty9ZTJ0nM+VK0B2I0mYN/OydhXHyygvTP5YhvwPeHRNJAU39R9B0zeqvtXYX2jw==
Received: from BN9PR03CA0938.namprd03.prod.outlook.com (2603:10b6:408:108::13)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 08:12:01 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::48) by BN9PR03CA0938.outlook.office365.com
 (2603:10b6:408:108::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Sat, 5
 Sep 2026 08:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:01 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:11:53 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:11:45 -0700
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
Subject: [PATCH 03/13] gpu: nova-core: vgpu: add VRAM slot allocator
Date: Sat, 5 Sep 2026 11:11:06 +0300
Message-ID: <20260905081116.106613-4-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 1982af0b-cf11-416e-28be-08df0b255d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|5023799004|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Szb6cnZJyvCdFgc2+dvWXLtugNPmNSjejvvicR6rSF5v9OC9ZRUlXR2AJaeRf7mgxWUeZG3yylNNWvsVG184ueUo+Ei7H7Uk0TcbYbrOJglK6iOIE4CQj8S1ZQqBCeSycB31bgZu89plDjMVno17cL7sB0Qp7zzPbYpqmuxpfGqL1b+y3jCcXyxtbV9WEX8jfwo+WwpUj40v60t7Bq5aT/LbQdGnG9osk/xXXKgJMQNqLQ/IkxhaqTD6B4MimJdI9nW4Cm/++W7j9L2pfHNq4S8Eo2H4VzwrwM6UkCcYK5J3XJyt3DLQRWo5B4CS/18TZEGRu/sLL6C/k2l49O+wbYXur/0C7jBeUwP+psFFa0LQD8VHYP58NvbxzsZyYPqU7BW9iE7Ug8sWtSqkrADh3B9jjGU9lSYN4YhIH0paSNWBnzDuRYSszfKnOBZF/uIpbBUBN/AnGomTYviYVPmC0+9KbgKaw/wDHUPslZSrNhdcwJDjFr2Puw2mYaFAAZ9wavz9lKxoQI5kpzWv6V0X2debOPerCU2ivlV23R99jhd6NeRBF15cHTYqgP1EwfROrH7dER+ylzmiPC0IgFsP+D84yeC9/k2LpiQv54GFj6lTh5DMBpIYbvZmuBrLaR6PArb2En5pbojkwM67xuS2OC2+as1SwnN/rPJTQx3ASkm0rnnX1omsT1TcE1M8B5+U8SdxtESMocvypEnATwQqQw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(5023799004)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ySMzGZWrOAfD+C6hyLfk0iM3dE4zDZk51ZCLcH3Wm7pESYHqSC53vhRUp9HmnGlvFsBRvysUkywfd4p7MlR0+ZY+7WyL7ZvNNh9P7X9c821fvUuZCu+Qedf0Y4be5uaeMznLJ6o+KwuEZxq6QScQl+ehvXL2NiJyVNtYpPdTCBq2SJ27L8awmLLCpYlAAYs3/l1gI4bqlx/pf1z+of+HL61LklRo1KY+vNdbi4e1KzGXMAXLNk8dFCRwEKOjIE86NPbpV4MFVkRKkTB54WCrdUcVHmn/a5Sg9Zdi92q0vGYKNZdQCObwZZqQwYr5oK2+DdWuJSj2P9cVWAUvz8eR8LXcjDn22Jhry3a0FWxtw6sh95mQYMg5XaO6oBe921KoMrkKTmcocptmBxHTEEfqQzL9VDtEa/RMQhzLZoVF71Iff+cpRSCP0pfiQ1j61L4O
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:01.1616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1982af0b-cf11-416e-28be-08df0b255d18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595

From: Alok Kumar <alkumar@nvidia.com>

vGPU profiles need fixed-size framebuffer and plugin management-heap
regions for each instance. Allocating them independently fragments VRAM
and does not preserve a stable profile-wide layout.

Add a standalone slot allocator that reserves one exact VRAM range and
tracks assignments in a bitmap. Validate the profile layout and reject
an allocation request whose layout differs from the active pool.

Lay out all framebuffer slots first and all management-heap slots
second, pairing them by bitmap index. Require the framebuffer stride and
pool base to satisfy the profile VMMU-segment alignment.

Keep the pool in an Arc<VramBlock> and return checked VramRegion views
for each slot. This lets consumers map a subrange while retaining the
complete buddy allocation for as long as any view remains alive.

Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu/mod.rs  |   1 +
 drivers/gpu/nova-core/vgpu/vram.rs | 142 +++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 drivers/gpu/nova-core/vgpu/vram.rs

diff --git a/drivers/gpu/nova-core/vgpu/mod.rs b/drivers/gpu/nova-core/vgpu/mod.rs
index 1354c662a507..a9d4860f18e3 100644
--- a/drivers/gpu/nova-core/vgpu/mod.rs
+++ b/drivers/gpu/nova-core/vgpu/mod.rs
@@ -22,6 +22,7 @@
 };
 
 mod hal;
+mod vram;
 
 /// vGPU state detected during GPU construction.
 #[derive(Debug, Clone, Copy)]
diff --git a/drivers/gpu/nova-core/vgpu/vram.rs b/drivers/gpu/nova-core/vgpu/vram.rs
new file mode 100644
index 000000000000..c646511b6fd6
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -0,0 +1,142 @@
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
+        alloc_vram_range,
+        VramBlock,
+        VramRegion, //
+    },
+    GpuMm, //
+};
+
+const VRAM_SLOT_MIN_ALIGN: u64 = 4096;
+
+#[derive(Clone, Copy, PartialEq)]
+pub(crate) struct VgpuVramLayout {
+    pub type_id: u32,
+    pub max_slots: u32,
+    pub fb_size: u64,
+    pub heap_size: u64,
+    pub fb_align: u64,
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
+pub(crate) struct VgpuVramSlot {
+    index: usize,
+    pub fbmem: VramRegion,
+    pub mgmt_heap: VramRegion,
+}
+
+impl VgpuVramSlot {
+    /// Return this slot's index in its profile-wide allocation pool.
+    pub(crate) const fn index(&self) -> usize {
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
+        // Keep framebuffer slots contiguous so each starts at `fb_align`;
+        // interleaving page-aligned heaps could misalign later slots.
+        let fb_region_size = layout.fb_size.checked_mul(max_slots).ok_or(EINVAL)?;
+        let heap_region_size = layout.heap_size.checked_mul(max_slots).ok_or(EINVAL)?;
+        let pool_size = fb_region_size.checked_add(heap_region_size).ok_or(EINVAL)?;
+
+        let used = BitmapVec::new(
+            usize::try_from(layout.max_slots).map_err(|_| EINVAL)?,
+            GFP_KERNEL,
+        )?;
+        let backing = alloc_vram_range(mm, 0..pool_size, VRAM_SLOT_MIN_ALIGN)?;
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
-- 
2.53.0

