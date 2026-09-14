Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494538DC72
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372271; cv=fail; b=CikZXsYGfnGyRbYgY79tDpgSQL181ckSSF5hTcKDg5jW2EwdyJRRIAAsKqSPzJ4THTD/AmS4MileWTRZEOdhKnkOcFNRlzgn8JlGMnRB0fTPD4G+TYjgj8PG1AUpjBrxF0QIKDEZm9vjg1gq0Ta/FWOwU2DSBFBcNh4GrxhE4l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372271; c=relaxed/simple;
	bh=8nhpYifx0NWyL0dsar5Nf3XxNtxbG3n+do8w0L9Ps8k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqUGuA3C0S1D+yTwuLsP4oQoYFaKhHFtc7aIrgBrO6zWjV8Sedzxp7VQf5ux40UPWIWAWjRHdazX5m4l5WJFV9MOw/hglyODGuT/Y3cfIU35/sh3DLcrIFD8WIwLkBUzPIGK3KgyNUNgMVbMSDAbuTAyRKcmaN/kTIUL4mEeZRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qgRSzvn8; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qgRSzvn8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6vFy/DJpEBHaQ9XKGqFkdTEea9X5PdbP+HMcE+DcGkPqI8KdUzRDhablNHt8MamjIBLuc9zWmIiV4G1+ZW/SdXsG3BfVJmjYTSLKC0/bK+1/g+28dgrvsWCHHc5Zu5IKkcaio0r82glioZyFC1jXvXq7MuPz50lretSeipgQ8Je9rsJ9teIKvT+8FCymTQrdtd4HePvQphZP02lMNqZ5/6J7O/X6jXqCwpsczgCYQmYaFjvH9RDTjBsf+Y1v6jljFEw9L0q10amS4P3AXZEpN0iolcKX6w8RQNlNu2llIxecELbKAq428bA1sJ7zhOXSpGPNXwmEzMB7oCmI6biDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgI0ew9AY8TJ6IWbSJzOcOPB+4nX8GISq2hZpBH6xmI=;
 b=gTtRxoY6iBq3vTFBrJFpZFRch9ZL/TyYX7qMACaquFHwcURN/UG+HwsqHXfeRb7/2IgCcbF0o5eiQmSqSSr6pb8b7EOfHhzF1btcAFlZjRktUsA/iYaa9Vo7bcbznHNrvDq/nYZqgRKdMzpWwdI04GaUbcJT8pPVFI27MBYKHbAPYq8/2GFkhxnIxY/zJ3aZgg8/f3dE0qaJRoX1Vap/AZCdxRSFC3QkoSq+ryTfG+GijN5liTy7Gd/xX2mZPqKMAeg0eluKXPkAxumrUEFFjBHUjvl3ThMdalUsrXY+SnsC82rYITAx5oKFW/ny9h+1PS0fb8Wp/7tHzRrsiTfhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgI0ew9AY8TJ6IWbSJzOcOPB+4nX8GISq2hZpBH6xmI=;
 b=qgRSzvn8ZaWDeq0AYr1/l245CzZccxNyGWiS8srfNO10eG3Enl61O+FIdh/ZmfrR+sb9ExOjbltj7k2hzlaZQHwblBlukFK8Up03+JzH8rjMVH+h19Ox+Ld1dF1GPUvayLlnqizThm0KMEmmxb+3ixBgkbAWDXmxBiC9MTuwnOQlbKCOquoWuWhRBhHWLWnt46Kv3T1afJanYzqJM7BZw9e5erahWat1sgPI39dpUN2ubyVCjj78MegRmxhdKNhSQMwDwr61xCZo1Q7q6skkubmH1cE3U2VbpViKvOWxXrqzitWaH860YDfZw26LgyWtBUwVZaGKxbfsL+eRVe563A==
Received: from BL1PR13CA0124.namprd13.prod.outlook.com (2603:10b6:208:2bb::9)
 by LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:51:03 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::1a) by BL1PR13CA0124.outlook.office365.com
 (2603:10b6:208:2bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 07:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:45 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:43 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:35 -0700
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
	<zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v2 10/32] gpu: nova-core: mm: add VramBlock
Date: Mon, 14 Sep 2026 10:48:45 +0300
Message-ID: <20260914074907.1399629-11-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: 6febbdbb-5b85-428f-c35b-08df1234ed1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hNKpLh9zysKRlXrNaTYR+oPUYAZ/d9ZxhO8TKbdpQhhZeTUtqro7w9Yi/Rn5RWHyNAQYG1O3gV+6CuC1HJ6HhOs6v01OSjRjSaMqqpHgKYsF9674LI1WEp8BojT0zJDR2d5lVRx+QgiVjd/WW/lch4RkLp75LCbwsvYBGFv4/k+01eq8wgOZrtKzlH0gQYJ0s2lNNYFxwxMtA2FkgvCzMBWXDm1f/ek1BK59gqgsErDbw6qQrzqs3YqmnrhDR385sxlg69XEy7hmgrIH8OV73kRziwadfIQGTGtYoxfJ67tnohpVhmUPVi7sCF7oFScfEpY9jd7enwb91enWl+PvFdc+CpSZgL8bcsjO58m/5RIqNKMNmXrYoZeTDhh6PMq44nAKcwntBdQU7lrJhvnRBGB4PjCE+uexW7BCq2bVUz+lz45uteMEnypZK0exfyd4R/0FIfGC6iZoCCEEaIySqa40vJeAGgmMvN0sN7NBmjpNthKc4mogSFKL6tucer9rDzqLAKF3rBWqq7sghDR9xYkDgTAFdWg1JghaK3BNMTqqUd8UvkVxdZfv/WmfF/Ohg0zxwExjSPDz8rwQ/lHtVoiR12QGzmspXb8Mv2HqVxUr+wLFjNRAYQMzBmypXctPpMEf/KDwq8hiebx5Z4mJf5/u5kSMlg+6/SQanyXqfbv06gvlUeIHR1tmZYsVoxl2
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Xgu2HLvPXli57on9jpBohrnH+9H6UECgdLL+Li3TzlikxTRjia1Zvd1L/svTb1zvP/ok+ks3FIZ8lBzPACa0H/zs5tHlPmer2gDuqcx9MJuBwC9BGfi8Gf+6jJMliHl/PloaaHCrlRhgnm7xU/0yDemGBbq6jJvA1Ry/3qTFXDfNd4sp8UaJXXqIsrELQVtVSIKNvWWr0kTqLBNz9wQvA8bJEbYbhqZvOITsenyeKZQCjbtXLM+iT8jDsnQf0w7KN9TGGWUtfPlV14leoGamKqee7V4u/ildVcXaxA5U/3MKTjOOZpWjNmirbttYOVSOvKxBvImkCW4Xqsmqnx9cTyyD7njgDmJOMTM0irJdCxk2vFiM+Q4MxbWGt9uMy1tB7XfeMGjMvIvKAwIppqbIOswqMwzquszewpPJjH0Om340vOvJi3zHQ93HVEaG29W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:03.3754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6febbdbb-5b85-428f-c35b-08df1234ed1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120

vGPU memory slots need allocations at fixed offsets within usable VRAM.
Add GpuMm::alloc_vram_range and VramBlock to own these exact allocations
and return their storage to the buddy allocator on drop.

Use the buddy allocator's range validation and retain the checks for
absolute physical address overflow and alignment.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs      |  2 +
 drivers/gpu/nova-core/mm/vram.rs | 78 ++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/vram.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 8a934c55169f..016d99608aeb 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -67,6 +67,8 @@ macro_rules! impl_pfn_bounded {
 mod regs;
 pub(super) mod tlb;
 pub(super) mod vmm;
+#[expect(dead_code)]
+pub(crate) mod vram;
 
 /// GPU Memory Manager - owns all core MM components.
 ///
diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
new file mode 100644
index 000000000000..743a2a163318
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! VRAM allocation.
+
+use core::ops::Range;
+
+use kernel::{
+    gpu::buddy::{
+        AllocatedBlocks,
+        GpuBuddyAllocFlags,
+        GpuBuddyAllocMode, //
+    },
+    prelude::*,
+    ptr::Alignment,
+    sync::Arc, //
+};
+
+use crate::num::IntoSafeCast;
+
+use super::{
+    GpuMm,
+    PAGE_SIZE, //
+};
+
+/// A physically contiguous VRAM allocation.
+pub(crate) struct VramBlock {
+    _blocks: Pin<KBox<AllocatedBlocks>>,
+    address: u64,
+    size: u64,
+}
+
+impl VramBlock {
+    pub(crate) const fn address(&self) -> u64 {
+        self.address
+    }
+}
+
+impl GpuMm<'_> {
+    /// Allocates an exact byte range relative to the buddy allocator's base.
+    pub(crate) fn alloc_vram_range(&self, range: Range<u64>, align: u64) -> Result<Arc<VramBlock>> {
+        let size = range.end.checked_sub(range.start).ok_or(EINVAL)?;
+        let align = align.max(PAGE_SIZE.into_safe_cast());
+        let min_block_size =
+            Alignment::new_checked(usize::try_from(align).map_err(|_| EOVERFLOW)?).ok_or(EINVAL)?;
+        let buddy = self.buddy();
+        let address = buddy
+            .base_offset()
+            .checked_add(range.start)
+            .ok_or(EOVERFLOW)?;
+        buddy
+            .base_offset()
+            .checked_add(range.end)
+            .ok_or(EOVERFLOW)?;
+        if !address.is_multiple_of(align) {
+            return Err(EINVAL);
+        }
+
+        let blocks = KBox::pin_init(
+            buddy.alloc_blocks(
+                GpuBuddyAllocMode::Range(range),
+                size,
+                min_block_size,
+                GpuBuddyAllocFlags::default(),
+            ),
+            GFP_KERNEL,
+        )?;
+
+        Ok(Arc::new(
+            VramBlock {
+                _blocks: blocks,
+                address,
+                size,
+            },
+            GFP_KERNEL,
+        )?)
+    }
+}
