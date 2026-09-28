Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6249B465
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591431; cv=fail; b=mjkL2gPqO41MMwtQj2vBmH0ubp/DI8DsfRW/dEAyg31OphFxQm0PueB8CFd3mephD+I+BklUKwJnUDozfaO3+G/KDdCJgWEjuepppQadi1MhOuKQSa3ZPVEFBByDvzynwC302p2M/IYJVTY+ZlElYeGeBfTgFB/0ik6VK4ZveLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591431; c=relaxed/simple;
	bh=54LhS7hIlxIWqNlOMhzT7nGgvdq1bM02Nmdjcw3L1KE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwxeYNCSU6jqjmBiXh3nDMWqp8LCJ8s92+jH97T+xw9GPrjfxmwUqjbt89I8WFem5UgugkuhwccjZQMOteF7saippfrrnCZsEcj+wd8rfty/U5Lp2z2qmBaOKCIe/BXib3EDdSi9QM4JhUwtRn+6TG4yJe265EVBey/yxkC1VFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yc6zbEDc; arc=fail smtp.client-ip=52.101.85.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yc6zbEDc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZh68KorYuL5yCybPgJDOILqBgnFGI0av1z9FmFHbmVS96ha8ul2klNS/fasIO0NAXBEA5AacOspF51RSdq6SMIAvFOworUhjxD0/2QQqOyZmJopko/CJuJMGTbyKbNGnSWl89X+OkQGewKoUZ96lD+xBwoZLdqmuk+lteUUY7aDcTSCC5hsjUHWeINj6jTds5+nKHWIEOkMixpBL8kjn7qDJAIbgf+rzNaP4sH18wQbSyT5rSSRwm4uJ3sOMx97B+EQmn8GadEkHg4rfYdI3r3Kzna8AkfSrDd8LkOafXAy8aDvx+0++Y4q+TSq/v1OolF3pkX71SvPeYyLUKmW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af77Zadpl4OjgI6o1HTK6fmqhgul+jVtdUEl6CZ8gDo=;
 b=T47qlPvH5SZTqbRJIStFI+KBZ4RRoU+aK8TI06SvNAa9V+YxtSLcgg0qtR7o+QYpPzvWhNmnIwCdBs4lSbRpzLALvOcDfc7iC7BbNq/MbXilNBHKF4kJzEEKuZDqljSUk6bOoIwGJpPtrwMlZAIzsw4NsJnFCnSUhrsogBwT7zUHMmQZEeRmE8xsUJRGuXjbfxH58K4bnPwK7rBN/yVdTuGetzzrjCEVvRH3e+n2LpP02BZ1RXznMQa42Uw3OPraIsZ78Ve7hFQEU30tnilO6doy5nGX2mDop/89zO7gETQ4MEc9mYvWlKs8PlSiSlxHQICCKSPO3PQ1J7EIaGtT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af77Zadpl4OjgI6o1HTK6fmqhgul+jVtdUEl6CZ8gDo=;
 b=Yc6zbEDcHx4pehwjDKx+AocJ6L6+o63k6fvHRXt9Dp68E+qWrvwRCLFEjjXn5R+M1V3XNzDigcBDaxXBT8jzWS2CZCYJT0+X+K0zPhHF5d4LC4Xsjm38dfEQyucMb2Q7sUcPckiLlykr05FV9oGG7iS/+bJakoE8ItmkimwNrXuI3Z0rGvrnDtq4h4OOnc+ZQU+NhV1Z2UmdGUil3bPuOHqpfJzAYx8klI/sF9RJ25XhotCgFz8ZpGM8qcVUgfXG1+ZNkHptoiseu+VyuMXuh90zRPiJiYaJM/gkFTsxWVBTqjL63xbHTOpozesifMJHBscomLzLqMb/wcisRYsdHg==
Received: from BN0PR04CA0170.namprd04.prod.outlook.com (2603:10b6:408:eb::25)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:30:23 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::71) by BN0PR04CA0170.outlook.office365.com
 (2603:10b6:408:eb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:30:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:05 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:57 -0700
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
Subject: [PATCH v3 09/31] gpu: nova-core: mm: add VramBlock
Date: Mon, 28 Sep 2026 13:28:12 +0300
Message-ID: <5dfa551cff300e34420b67571ee111774f42338b.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c2c2a8-8f25-4116-11dc-08df1d4b807e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|7416014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lrSIL9L09ST0WDv6kB7WBD93pgNjO+1M7iEfdWqi7WllK7lmipZFHoUqws1kigzlojjAyr+pkho3eVnLPeF34F40h98k/oXdmV86wNGRLqaU9apgZBWzcysuCJNFGxc2nt1f0AiDuuZnJzxDyUqOaC9o5LKFHZkGizJuhIXWJNlUaQ2TXJHd7vntKoBLL9XZJR4iFdJKniVuR0/CRur+GGf3LvAjozvWw2kfgUhDGSnDJyXmtLPSkL02QAGL51CCSZ88qgCRouaS0uAwb4UzgjsRI6y8I00lbvSl0UYvTMX2y5WVvwduMxW+lZLeW3CQrgKTv3IXCc9+Wk80jtuEKWukpscTMaor8ubuyZvjBh+8tHLx9B1VE/P4D3nmxpNAhuM+CKEZhxSfxVQ6KaKIXJFbZ2UFTMaFdRxYpzFWi5/t/Lmu89/ANG6K5XrQSMoDsnVQQ+rSgM3KRTBI52GuvDJqtLEcgDQ9gGko/Fswo4i+EPGOK832kk5VhEveWcuxq/uNNO2txBSyb7ZftIzz+t5aiWbKsqbUhNQPuq8vOe45jYZ3tG8ZYf631Lq8yjwo4GbNREY2NYE9QSEUW+M7Tzx4swxE6NK0WlixvdhU0ftqu4/KTszixvu1JxGyY/eWMZgeIG0soy+22wFci7QQxP760z54BqU7W+xFZexU/QBUloowhDrIPXh2hfbI707B
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(7416014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E2bIU4J0gn13YsqWCb1/+F8C+B/NcfGfsNLcc3nOEC1HL34+AneMmHyUxWm1B8Icg13bekESrlUqJ3qKMx3FKVX/mvlraxLvaqG8mHbKUWC2Uzs0OyB9LdsOPQyIYmm8VxTqIkBmJWerdWi8XW4aj754H+wsqg2jwTHb8BYkOm1jO34w0v8J+ZQRt3x/Lz7HY0rCXSXCghmcLI5SVw4BODJHupoxi5ugB0dvOEoEpe+yFKSdg+hJjG7T6vbPqcaxrnzBATxkaUsMCaBZVQnG9RtcY51j0W5AhVWsPDz1yNuaPjkHRr42DKQnJccgpybdBUG1cHdZSdOZLNvN2YXWKcBPAphTKZWZq9MunpocdosjHASlgaRf/XxweodgumkUz7oW+nzhLDfhAUM7+PSi1cUyojzeGGa+P6YUXLCSjKpt4COyiTEZ8FoJxIoKVgdC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:22.3291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c2c2a8-8f25-4116-11dc-08df1d4b807e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795

vGPU memory slots need allocations at fixed offsets within usable VRAM.
Add GpuMm::alloc_vram_range and VramBlock to own these exact allocations
and return their storage to the buddy allocator on drop.

Use the buddy allocator's range validation and retain the checks for
absolute physical address overflow and alignment.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs      |  2 +
 drivers/gpu/nova-core/mm/vram.rs | 75 ++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/vram.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a835180db6c5..a1e0bbffc460 100644
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
index 000000000000..b6cc177825d7
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -0,0 +1,75 @@
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
+
+        let align = align.max(PAGE_SIZE.into_safe_cast());
+        let min_block_size = usize::try_from(align).map_err(|_| EOVERFLOW)?;
+        let min_block_size = Alignment::new_checked(min_block_size).ok_or(EINVAL)?;
+
+        let buddy = self.buddy();
+        let base = buddy.base_offset();
+        let address = base.checked_add(range.start).ok_or(EOVERFLOW)?;
+        base.checked_add(range.end).ok_or(EOVERFLOW)?;
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
