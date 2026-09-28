Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290F29D281
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591454; cv=fail; b=nq9L+nWhX+VZcDjEY6Z7YAgm57fnzTE6EaBG1kGsHBfftGiYnYZ9SBvgC7ZydU9/XAxBceIcw0zqVnnMSbCdE07o6x3+2zssAEGF7ZFtqRtW+/CY2POHhQn2GE2kTO0RbkyLHsVzxPirm+URN324Z976Ztu4e9osReUEiaXD7BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591454; c=relaxed/simple;
	bh=KV9F/KVU0UnpzgqZFB1JUkBiGUgGeSMjq51KX6hP7fg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4HqxbC+svrm1MPSBW8UjkCL1OTB+DJ0zmdaf22gVaJ+eH2c9PQ7jozR7KtnwOkBKFadtWrPiIQPoXuvOQBZ85lrsKqFDvpGlDVrh7GcJO8tIsHlJDN+UpKdC2XQDIlfcgH8FHI9mLCdMZlawNwsFiwMedASwSJ7/+UcF08HToI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CSKP1JyN; arc=fail smtp.client-ip=40.107.200.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CSKP1JyN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO8kg3gXaxBuASQ+LYrMC6Ot120GuPlAg3ye7oQ8RX6RdONZqIW5l2XEBUQv9B3EuEUqyY5zuITNvBsEZbguWcx5rnVTR+VXX451yXhM2oVpJ0xqLfkLVgFbc7GgcorkaZ13ef0eEGEIn2QDo2JRqnAQRgIjMMGFKjNuiNk7ylYF0E3u/NHeAFR0TrGBTCX74X3rUA48lTgv3QgTNdX8tw/pACL1hOBZ2zwvWjzQZtgVllSKYy5YE1BJWwXFrS7BQNvXxVVwZJo68EsYi3IYIBxlE/RHtdAuc8LaEpA5ox78vAv/4PBajIS4eNUfyPA+hxpJ3EQNzbDKomCls2hPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mnan0PF3bLfX7NuhW/ML+AXj06C49E+Co8uU4xeHh4=;
 b=p16DrcXq0d8h0T8eF+MQCY36EtLvrGi+T+0UIONIUKc9vFcTXiZXT7zG+vOynyc5GFw1oyLmULjssDocu16MFG1auz1Fn5iw2gzq/AtHb/y7wbIVMByxGkmJAS+JpACmrmAP5eW6fh0jXLbpIAUdo2padPItB98RQsDgEq9HNr4Neezqz9s+Lk3TUkgSWU5ISmzN3Wp5o2zT4v6nCnIp3FlxE7bFavYkc4r/9M+wBgmgEMqpbHWhfzizviK/LaREfx2lPTZoZ71slV9PTFlkeqDZDdsUvJlsrfQuRRBsRnM1mvILrQIlH2oAQmBZc7SswFPeUrVENvP+2kLoBdyn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mnan0PF3bLfX7NuhW/ML+AXj06C49E+Co8uU4xeHh4=;
 b=CSKP1JyNN1w4LLJpAFsYc7u1WjdZ4dN7W2f6VhQOMCf6nLW2ETJDp515Ts1mixNghxFNFjcZaRZcTbZ61+hmzFuwpsOYuJ9Siar4WuSGmRRyaiuysQPG4gvRhF0KF5F8SC1RZCxEXDw4svytNtBXrrf7uMy3he2Rtm7ExfqKxrwRaEdDP759muKpZ4woZi8QZ5mu76ubZ08D5Nro4Wr3s6VI93vNo8PQOIV1fJ6nMjPIqskmAaS/wgmhN/xdqY3SeMx+VoGAuMFeb6XozWR9StTzdXbgtg7qA7yF2SvhiE0Lpj54dotuomCpE9FdOkWf0eu1JEFCKZAmYzrOKDg2pw==
Received: from SJ0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:a03:3a1::31)
 by DM4PR12MB6205.namprd12.prod.outlook.com (2603:10b6:8:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Mon, 28 Sep
 2026 10:30:44 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::43) by SJ0PR03CA0386.outlook.office365.com
 (2603:10b6:a03:3a1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:30:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:43 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:23 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:15 -0700
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
Subject: [PATCH v3 11/31] gpu: nova-core: mm: add BarMapping
Date: Mon, 28 Sep 2026 13:28:14 +0300
Message-ID: <250befc607ce3af273d5e1cb361cd014f8423642.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|DM4PR12MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 146fd6f9-8a56-4c5e-4de5-08df1d4b8ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|1800799024|376014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5wLO+JGDBam8e45LNS1vAhhvqUChJd7G1zjihZa9FZCXLP0ts6lDSj05UP0BbSaro0nBESMHgTqf/4T90sZcWrNrhEF8j9C4/XUTvNRQL3bb63SgkEoBmB8CsiJRCZwCCXV7/WhZIIhofRXb6+fGGv6kVihEwowv+lsJbqq2Qg5jktI4ipsyglOI3UQYDPtBAw0c/K3SRm1hSBIQtw+xTdXcza2SaB6Ag4npPbZHXTctSXxNo4XTAHZq3fWjUwPjqXN/qgEWkP2bv6bAPTRh5d+EGSZTEgLE+MX5fsaIoyW5ViRYM1OuJ8fvElYE8uz/Cqfkk01NuqgZ40JQNyaXeMGXHMD5xXMBqqIWwwAKyFTLeSCU0cAf0Rifp6c2sOE1YgfTafHCYWtiID07anan4Sh904kRnmmesxY8a6ldCVf2URbItQ9snQM0CYFWSoqyE3KpaDM8bWpWUIov8SjhgSODyCC91MhNa2DlFCibKu7bd24TEOeNKjorpfisz1tRpZOWrkC9gLWJBH9S9Q0NNpIGH79kXnE56flXzEMa+d5RwC46mXPZRkuBWuKRj0tIQeKSre3reJ8onU6QltW+Mn1Xr3A2XKanjruK5L0tcG3vzjzS42AkhZIgiBWF0mSGt0BBf4QXnxams5JgHfyYcXfXO9GdIyXMGYmDdHVyhe88K3MkE8n6CvOeiHE8suyE1oFGKUGMD+VqcBfwdqThaA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5DFVEhQJK4A/O3KJQVj8b8IA/C2/McN5hHu39BfLF6DOQPVl3wgWnOv8zQyjb8A0jRnDYNF76Wvwe2X3NujYTfrsMwidwGSL0asS1MvFbgNVLPa6JtdDMTmiysoSALBm19wwu9bIpfBpjf32uhGzBFSgLAg3nJyZ5GtoEn+06bwPzAJagum1ImTxgBlAQk8RRXPZMiILvQvypph7q/7zMaxS9UlQk0piCFdNU/ftPnC+tgfwc6V3XslyJbHMjl19tPpBJ5auYkJ6e4wVOvlGWnkjDhxr8scZlflhm1psuvamK7aLrcJLVoc8YROd+0Q4s5tMvM80NmO3JQAUzR1zntDrv1K5neTsgmbal5T4kT1m7mmGUQqhQ4rXiuohz9ftqiIaV8KSfEO8O/E646t/rsfQ8V0Z8+hvng0YHH9dIPmX0JTJHAe269U2okf1unde
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:43.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146fd6f9-8a56-4c5e-4de5-08df1d4b8ce6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6205

vGPU communication buffers need CPU access to regions within their
VramBlocks. Add BarMapping to map these regions through BAR1, including
regions that start or end within a page.

Retain the backing region and borrow BarUser and the MM mutex for the
mapping's lifetime. Restrict CPU accesses to the region's byte range,
and unmap on drop using the retained MM dependency.

Provide an explicit unmap operation so owners can observe errors before
releasing resources. Keep the mapping and backing region on failure,
remember the first error and reject subsequent accesses. Owners must
retain failed mappings until device teardown; drop does not retry an
unmap that already failed.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm/bar_user.rs | 145 +++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 414c69e037ee..964aee8bfdb1 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -7,6 +7,10 @@
     io::Io,
     new_mutex,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
     sync::Mutex, //
 };
 
@@ -18,6 +22,7 @@
             MappedRange,
             Vmm, //
         },
+        vram::VramRegion,
         GpuMm,
         Pfn,
         Vfn,
@@ -176,6 +181,146 @@ fn drop(&mut self) {
     }
 }
 
+/// A BAR mapping that retains its backing VRAM region.
+#[must_use]
+pub(crate) struct BarMapping<'map, 'gpu> {
+    access: BarUserAccess<'map, 'gpu>,
+    mm: &'map Mutex<GpuMm<'gpu>>,
+    region: VramRegion,
+    region_offset: usize,
+    region_size: usize,
+    unmap_error: Option<Error>,
+}
+
+#[expect(dead_code)]
+impl<'map, 'gpu> BarMapping<'map, 'gpu> {
+    /// Maps the containing pages while restricting CPU access to the requested byte range.
+    pub(crate) fn new(
+        bar_user: &'map BarUser<'gpu>,
+        mm: &'map Mutex<GpuMm<'gpu>>,
+        region: VramRegion,
+        writable: bool,
+    ) -> Result<Self> {
+        let page_size: u64 = PAGE_SIZE.into_safe_cast();
+        let page_align = Alignment::new::<PAGE_SIZE>();
+
+        let region_start = region.address();
+        let region_end = region_start.checked_add(region.size()).ok_or(EOVERFLOW)?;
+
+        let map_start = region_start.align_down(page_align);
+        let map_end = region_end.align_up(page_align).ok_or(EOVERFLOW)?;
+        let map_size = map_end.checked_sub(map_start).ok_or(EINVAL)?;
+        let num_pages = usize::try_from(map_size / page_size).map_err(|_| EOVERFLOW)?;
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        let region_offset = usize::try_from(region_start - map_start).map_err(|_| EOVERFLOW)?;
+        let region_size = usize::try_from(region.size()).map_err(|_| EOVERFLOW)?;
+
+        let mut pfns = KVec::with_capacity(num_pages, GFP_KERNEL)?;
+        for page in 0..num_pages {
+            let page = u64::try_from(page).map_err(|_| EOVERFLOW)?;
+            let byte_offset = page.checked_mul(page_size).ok_or(EOVERFLOW)?;
+            let address = map_start.checked_add(byte_offset).ok_or(EOVERFLOW)?;
+            pfns.push(Pfn::from(VramAddress::from_raw(address)), GFP_KERNEL)?;
+        }
+
+        let access = bar_user.map(&mut mm.lock(), &pfns, writable)?;
+
+        Ok(Self {
+            access,
+            mm,
+            region,
+            region_offset,
+            region_size,
+            unmap_error: None,
+        })
+    }
+
+    pub(crate) fn region(&self) -> &VramRegion {
+        &self.region
+    }
+
+    pub(crate) fn gpu_va_addr(&self) -> Result<u64> {
+        self.access()?
+            .base()
+            .into_raw()
+            .checked_add(u64::try_from(self.region_offset).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)
+    }
+
+    pub(crate) const fn size(&self) -> usize {
+        self.region_size
+    }
+
+    fn access(&self) -> Result<&BarUserAccess<'map, 'gpu>> {
+        if self.access.mapped.is_none() {
+            return Err(ENODEV);
+        }
+        if let Some(error) = self.unmap_error {
+            return Err(error);
+        }
+        Ok(&self.access)
+    }
+
+    fn access_offset(&self, offset: usize, width: usize) -> Result<usize> {
+        let region_end = offset.checked_add(width).ok_or(EOVERFLOW)?;
+        if region_end > self.region_size {
+            return Err(EINVAL);
+        }
+
+        let access_offset = self.region_offset.checked_add(offset).ok_or(EOVERFLOW)?;
+        if !access_offset.is_multiple_of(width) {
+            return Err(EINVAL);
+        }
+
+        Ok(access_offset)
+    }
+
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.access()?
+            .try_read32(self.access_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.access()?
+            .try_write32(value, self.access_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.access()?
+            .try_write64(value, self.access_offset(offset, size_of::<u64>())?)
+    }
+
+    /// Unmap while retaining the mapping and its backing storage on failure.
+    ///
+    /// The first error is retained; later calls do not retry the operation.
+    pub(crate) fn unmap(&mut self) -> Result {
+        if let Some(error) = self.unmap_error {
+            return Err(error);
+        }
+        let result = self.access.unmap(&mut self.mm.lock());
+        if let Err(error) = result {
+            self.unmap_error = Some(error);
+        }
+        result
+    }
+}
+
+impl Drop for BarMapping<'_, '_> {
+    /// Drop unmaps the region and may sleep. Call [`Self::unmap`] to observe errors;
+    /// on failure the owner must retain this object until device teardown.
+    fn drop(&mut self) {
+        if self.unmap_error.is_some() {
+            return;
+        }
+        if let Err(error) = self.unmap() {
+            kernel::pr_err!("failed to unmap BAR1 region: {:?}\n", error);
+        }
+    }
+}
+
 /// Run MM subsystem self-tests during probe.
 ///
 /// Tests page table infrastructure and `BAR1` MMIO access using the `BAR1`
