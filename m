Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D447729B
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591492; cv=fail; b=bQBGVKkrJvYcsf6vM5gO1ijfN8W6vLsLhNHPIK8qwkxu6U876AHMmtCJ7Uo2gZDolJp81EiL0RGVePt8bbiNRXHHkHkOMzrebUD4O5Ngco2OQaiEbjQOm6NYHj4irDXF96QRe4xWxA/NOkS/Pu5czd5AGN6E8mJixqtEVyGxyg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591492; c=relaxed/simple;
	bh=m49M8r0e/2sknWRFbT0smn7NmSLPO4qlSIe/FyAVW/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yp/9rPIq0LW4crrPQq9s+iOl0WdzaEit7UddaZDkq7VJsXly5dFj296ruA6XRsxNa+FU7BWPk4JQfTKDi37MHkrKUI3VElNS2lOEXqwbD0lqW7jFXj9D7hb0QYpyK7PBIkG4Xs9FqE5wpSWTabhMyp70kDbOcDoex5IR64/79xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Znq/gdII; arc=fail smtp.client-ip=40.93.194.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Znq/gdII"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIwmHIry8hXblPF72Gap2HhgYXH/MhuRh+UxhzdSTptIfJwGBM5touAXQy7/blGbgE2Rizqa10nnYsJ5Bu1eB6wsJJU3BKRyrSgw7R3Ej4lkYo9NveeN/zDXhMZE/wD/lM0h7ldVNnfI5v5GMqvdCPV2UvPO4mI1+UaLVb8p2LISw87vT8K/Oqv59/SNkW+O9OY4V+iDVPnhJyzqfk43MT/EuA5JQjPOLngVe2Yhp2TOU6yjePjB3sq2tHoDGTe4MNMEdhfHEY/x1WRftrycv2gEg1pPnoQW699HIS2rXLt0W+U6dPiNDkHcfPgWGhurDDsvcNzyBxZECTm3dqLzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaFoyoMa8tiG2c741tDI11auumP92MoRSjf/69P7PbU=;
 b=HmdtVjK79uOI537tAUnuoY2kWEdncyZ/na/AxjIJg7KjljLZU4hoLqkB3f7Ty3YO+kJRQRUJlQ+v7HFMH73kRVetR9fgSSt3tdmIAYkMlPmEqZWVY4j5h5XF9uZXjZYNtHX96nqu+8YwyP32W6BDvNTOAwZnK2dA4Wf5o70h7+LbI1VErULw1UQBgruKOvVMVGST36TfVVA9l+EVkopxI4DAgY91tg7CnpkQUZZP3YOy8Ect7HpXg7GAjCoSHevSCoC8NSwiVmkSZzTHabP8ohRhEswngnhFD+TNFRpTHBZfFZ/ES4MLgKWu93xOOjWHM5gsYS9cDvb2dBTQAheepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaFoyoMa8tiG2c741tDI11auumP92MoRSjf/69P7PbU=;
 b=Znq/gdIIE/SE8A48wTHmkUADGYDUXbGv0X6ebIcL8OtaW/AD5GdkUVy6DYu8y0SH0zgFfk9q4NeWBa2Zmni11IfUy5BjMb2yCZAtN/kEHj58Zw1tQ1uJnmgkFbKanbnDQFm/KIYRI4zZo2tSA7KdVlO3/j+OWoE68+AmfDahudygVk6bdRTFwYIbjOZDrbRzx53uP73pvE69meGSogX+yXNTvYcrlfkpxbKBFnBAlujuz/oVtVq+r6aQcHkdwD8nZ9kGsmLuV0+Fzr5Vnv5DzptPlRmVoT8p5oia7b/ENQjSuYiH7uUxke49V7y76bRn71Zu18Eq4oC/QjJIWqKJXw==
Received: from SJ0PR03CA0058.namprd03.prod.outlook.com (2603:10b6:a03:33e::33)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:31:15 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::5) by SJ0PR03CA0058.outlook.office365.com
 (2603:10b6:a03:33e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:57 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:57 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:49 -0700
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
Subject: [PATCH v3 15/31] gpu: nova-core: vgpu: add VRAM slot allocator
Date: Mon, 28 Sep 2026 13:28:18 +0300
Message-ID: <668bb06e6fa996314d27b048e1df286b2795173f.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bcfceb7-73cb-43e8-d00c-08df1d4b9fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|7416014|36860700016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ysibx/liZmH0nNrMlAiuqrPr6OBvNxGlr9GqYPEFuuYSxFCS/1XPJGHsGSsMKkCV+xyahP4Ww80Jy7MJTZSnXY63J+wAtu+6ubvr+mviETnNu2zqZZh8s3+WLnHXQzZqJLr4ULKfnoQJEAoCbToWjZqgfOCLGJB/wukcmDoj2IOZYltQkHe9pPvFb3vYKhhZKFQRhF/+FMiqN9Qvo8Bp2/9FZfUJYuZQB3zqzNe2vhC8vkqer8zZNGG4OBbu0GiFdpzHxyl9ir6crriS6SMF6fJaBixTzIdXMT0ES6Wz6KxGcC+lV3Zj4DGYm/KtUP3qMCgdLVSO72B44fMrcWBLux0/0sksIaf8GxeZ5DZvWLELYwG8jlYWLCFcQwANfXkzgJxh5vn/jhnuv1VwTmmbWT6C5tZOgMVjv2m7/j79/RbALPo3R5R+6Y/wSzOD4aPx0Hq2hlzRtc+tKRgrtu4iK0ZuYEyJc97bR/6Cj9jc56VYa2pcbPfGsybU/ZiNQldUx2iax0fu5bLk+EKtuF8kJPVsm3fTD/rSpNxBViO365jUeXd2THkV2GjLo+evrQdTG8svPpOZ9kqB+b/cbjULHDmtHTjDxeb5yKGHMrMKGv5Ot1ahc6tsH+JmYzgcPcOP3LsgHqsXdEkNwji8s3PVyZqjyNAnHzbYJGWfHcTnKE6SukMdC8yCLtQP42IdrL+/+V7MCyA301E7NkcNyIWi3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(7416014)(36860700016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bfvIkiEeyovfUyK/rQur/wdJ/jWVLwXhmeDMPUYiMnRRpHpQEqFlCKXE6L+ZIXwftVuy4iqEIFNp89bzKSd1Z2hCjgP0pSEQeJLmXjIWOiA1xe9AGzqbVqlzPmHx+UlmqbULz2t958y3TuD3ssKBa4QDOMUutoM7Yy/94JtuyjKpIy8lgbdVJowD9oMgvW9KAJpFrwCbffEPrR8pYF2eFo6dBOu1ohE0siOCQYwaAiHxcMY5OmkO07m6Mbx4LB7bhCJDqgeqOPHcuQ3mQ8ZLGmW6kI1FC3eFqp8nrEiTkXZ/GeGJKxkIpaJCF/40M9+ksFMUktDWx8NvuLNFDWNJPi0qjzs1X7hyRUONOib9pX+Qic+vM0qx3DuF/winy35HONb1OlFUAVRgW7puOLpMcoyd/0LfwiA6ZqN6OXHrlOFbgIh5UkdCLhaMH0bk54GX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:14.8570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcfceb7-73cb-43e8-d00c-08df1d4b9fbc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

From: Alok Kumar <alkumar@nvidia.com>

A vGPU type specifies the guest VRAM and GSP plugin management-heap
sizes for each instance. Allocating these regions independently fragments
VRAM and does not preserve a stable layout for the vGPU type.

Add a standalone slot allocator that reserves one exact VRAM range and
tracks assignments in a shared, mutex-protected bitmap. Validate the
vGPU type's layout and reject an allocation request whose layout differs
from the active pool.

Lay out all guest VRAM slots first and all management-heap slots
second, pairing them by bitmap index. Require the guest VRAM stride and
pool base to satisfy the required VMMU-segment alignment.

Return an owned slot that clears its bitmap entry on drop. Keep the
bitmap alive while slots exist and release the entry if constructing
the VRAM regions fails. Require users to stop device accesses and remove
mappings before dropping a slot.

Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/vgpu.rs      |   1 +
 drivers/gpu/nova-core/vgpu/vram.rs | 181 +++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 drivers/gpu/nova-core/vgpu/vram.rs

diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 5cd82adeb0f8..1402e37541b7 100644
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
index 000000000000..65e6a945ea6f
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/vram.rs
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! VRAM slot allocation for vGPU instances.
+
+use kernel::{
+    bitmap::BitmapVec,
+    prelude::*,
+    sync::{
+        new_mutex,
+        Arc,
+        Mutex, //
+    }, //
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
+/// Slot bitmap shared by the allocator and its outstanding slots.
+#[pin_data]
+struct SlotBitmap {
+    #[pin]
+    used: Mutex<BitmapVec>,
+}
+
+impl SlotBitmap {
+    fn new(count: usize) -> Result<Arc<Self>> {
+        let used = BitmapVec::new(count, GFP_KERNEL)?;
+        Arc::pin_init(
+            pin_init!(Self {
+                used <- new_mutex!(used),
+            }),
+            GFP_KERNEL,
+        )
+    }
+
+    fn alloc(self: &Arc<Self>) -> Result<Slot> {
+        let mut used = self.used.lock();
+        let index = used.next_zero_bit(0).ok_or(ENOSPC)?;
+        used.set_bit(index);
+        Ok(Slot {
+            bitmap: self.clone(),
+            index,
+        })
+    }
+
+    fn is_empty(&self) -> bool {
+        self.used.lock().last_bit().is_none()
+    }
+}
+
+/// A slot that clears its bitmap entry on drop.
+struct Slot {
+    bitmap: Arc<SlotBitmap>,
+    index: usize,
+}
+
+impl Drop for Slot {
+    fn drop(&mut self) {
+        let mut used = self.bitmap.used.lock();
+        debug_assert_eq!(used.next_bit(self.index), Some(self.index));
+        used.clear_bit(self.index);
+    }
+}
+
+/// A VRAM slot that clears its bitmap entry when dropped.
+///
+/// All device accesses and mappings of its regions must end before dropping the slot.
+/// Clearing the entry locks a sleeping mutex, so dropping the slot may sleep.
+#[must_use]
+#[expect(dead_code)]
+pub(super) struct VgpuVramSlot {
+    pub(super) fbmem: VramRegion,
+    pub(super) mgmt_heap: VramRegion,
+    _slot: Slot,
+}
+
+pub(super) struct VgpuVramSlotAllocator {
+    backing: Arc<VramBlock>,
+    layout: VgpuVramLayout,
+    fb_region_size: u64,
+    slot_bitmap: Arc<SlotBitmap>,
+}
+
+#[expect(dead_code)]
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
+        let slot_bitmap = SlotBitmap::new(usize::try_from(layout.max_slots).map_err(|_| EINVAL)?)?;
+        let backing = mm.alloc_vram_range(0..pool_size, VRAM_SLOT_MIN_ALIGN)?;
+        if !backing.address().is_multiple_of(layout.fb_align) {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            backing,
+            layout,
+            fb_region_size,
+            slot_bitmap,
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
+        let slot = self.slot_bitmap.alloc()?;
+        let index = u64::try_from(slot.index).map_err(|_| EINVAL)?;
+
+        let fb_size = self.layout.fb_size;
+        let fb_offset = fb_size.checked_mul(index).ok_or(EINVAL)?;
+        let fb_end = fb_offset.checked_add(fb_size).ok_or(EINVAL)?;
+
+        let heap_size = self.layout.heap_size;
+        let heap_slot_offset = heap_size.checked_mul(index).ok_or(EINVAL)?;
+        let heap_offset = self
+            .fb_region_size
+            .checked_add(heap_slot_offset)
+            .ok_or(EINVAL)?;
+        let heap_end = heap_offset.checked_add(heap_size).ok_or(EINVAL)?;
+
+        let fbmem = self.backing.region(fb_offset..fb_end)?;
+        let mgmt_heap = self.backing.region(heap_offset..heap_end)?;
+
+        Ok(VgpuVramSlot {
+            fbmem,
+            mgmt_heap,
+            _slot: slot,
+        })
+    }
+
+    pub(super) fn is_empty(&self) -> bool {
+        self.slot_bitmap.is_empty()
+    }
+}
