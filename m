Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3EA3AFB1C
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372285; cv=fail; b=SEEN6pi6nfE2tdJvduhs/MV/GvaCKLbxiEXQc95OhXv/vfvhGfjpLZEXxlwHmPbMcd+kpf8n+Q38QhYuzy/hXT6F0vzRmK0iYyb6OqKb7MXrAUxB++bl89qCyzZH7QvT1tjdznsfKirNnLmfg4RijYzGc7D/twE1Rt6C3iD9+/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372285; c=relaxed/simple;
	bh=mfXcIGdbaSRVftlmzzXwm8BGDzmSulxeSK30s/AjWIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUxLaBz+Z4h6lIJ26Dxxdb/dmvL7aCFdHWkWvhEqWR07HXXfFD2yPhG5ZXb58hF9uuMMkIxu8WRd9ry3/WJstO24cdOPCxelT1IL8QOOL8GhtGqjuKxuzzWayOeU4gKrqobZ9fobP8UguvR4DQbSKmG7JkcQ24K377G2bIpSReM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=roG8PYxJ; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="roG8PYxJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/VS4QDUwNgn30zHnxoscY3Y2Rd4kmSH3CSUo1HJTyjgQrdQQGsceL7ZGGFP3xU0f5qX2bp+7HmZOz/+dbm6pNqQZI+KnOmzsIR63vfwD4AYaK+BEO1MmvrfvLdRPUoZ9tbY9hR1pPE5qdTC8suwJ/jkxm0BOnjFHNKkcQ0zo2//gwnMYKTZqnrjON/XXc8cy0DbHdZexKy2s0V/PihIIk80EchCOpRSLpDeSCNzWwspuxquJj8Xb/ZWtqGwDdlIL5QliHrsIOnBTj02oTPeSjRVwBLfdCvht9Y0wbFS231NJ66IsOk41GJyvcwzfVZw/x1aW3EjtUYKsU0agTO0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Pd2Uc4T2DpRCIPK7uxVNy1mVATtp2wxzVQJuyIcZxg=;
 b=TTRy5mIdWSxAZ+dyTAsXOXAbLnERK0yiYlILmkMk/cLVr1oTfJ8ccwWh3O9uCcrLZIZ9qLymas+bykovzqepaTleqqkeaAMSTPh237v+SurlJ33w0VqBSK5xGrCxR8tbO6bCEYBpYP/qflvcJimyNGcoVp8sQ3p5ae1GW9OVsDqkIC1MMliD4K962Nm2MhJWGH2aTAOEFh6aTAFLO1Io9jN28KaUzJ1ajUtFLHxdPQdnV4KzYVWT9zLU662LL7mb0qmDr0Fvw3pbcxxza8QyolpLkGgHnJN2uMGinovALWLMLEz8kXiBxOw99zYOqr4SAMWEPoMBOG2F1JjVDNv/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pd2Uc4T2DpRCIPK7uxVNy1mVATtp2wxzVQJuyIcZxg=;
 b=roG8PYxJiqcBJFeVT4xu19ACtCQOiEYib6z+WkmQ34QcbOO2nZm96dSFw0fQsO9TlV3jjAbvgMOSk+++xRwDexd5F4jzHMf+lI3oW5DFUuwbluu/0G/RLe/2gS9Wmj15l1GK8F/urAwce4O1z8kQcnyjer8lhwfrASoMRtpqihrCX9Oz9SDbM4DgIIwQEZgoosVMkmT21WdGn4wlWpiRECG0CyoO6KaJstWIM+AeLBbmAksxmEPXGaU5AEuW78QbkIihHMnz08HQnsI/do+bvp9qsmHd7OAXLVyyCdhynAe66s7EoGhDt/D9EDw+f+ZUM+nxPf6rm+4NT7cJL1Fqng==
Received: from BN9PR03CA0549.namprd03.prod.outlook.com (2603:10b6:408:138::14)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:51:17 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::69) by BN9PR03CA0549.outlook.office365.com
 (2603:10b6:408:138::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 14 Sep 2026 07:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:02 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:01 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:53 -0700
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
Subject: [PATCH v2 12/32] gpu: nova-core: mm: add BarMapping
Date: Mon, 14 Sep 2026 10:48:47 +0300
Message-ID: <20260914074907.1399629-13-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: ea93cce7-a2be-450f-b4b4-08df1234f574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lzTAoVW6HLUw7Aw92ZH2mg9Z6BYEOobZASZLGpjKtgDzjweQxfSMFgZtwloLreCyhlSTt3qKeb/mVb6jeBM3kKMlElQoYxLIYmiFj4LO5YOo706fT7gGuRx4MgF/VI5RyE5eljPhiosODMBFxAnsTWQYvp568LcRT71bQhBYbJui4feDhgQgeE4DpaR4bUh/IlnXdOHmzIm7pCjc7jcIFaH2UmF7s9QiyfW2Ycbkm4y6yJggKJ2bXDJGhxIy9pKr+VTw8A762y9WVHz2VYYpPORsWFUsdeWbx2/Dpbiep1xmVsot2VygPZ8mDZ2SjRRD3lf0slmcuKyetQoOZUT+9ccUCNIEwHA33rvoFb+xtskP/wolTmY+DAzk/uQNLBh6uublaAS6Q0cgpo394kQq+eIqso+PDB86+QA746N0yk6oPla6ibpICol6J8vIEU7DmnuPr09azgh8y/YdFTDFuViZs8/+i26soXP4sKlHMUVz6LdPZ9FolHJsLw1ilRmvcDf9z7a0iFG4Kjqh/indn/y0F569aw6z7QdiQTqWx6FCxY22Nx0GB2J6rCWn8EA8j17v41TnK3YLML3ejfrzo/c4RqYVM8+54v3cq9v3KJtb1KZ06OSC7I0wofjJKPDnyOQreRjYitrrcXa4x6a5LYUExH811Wwkvm5u8UdL0YfO8udugPqZS+rW11xh7H4WRDfVMHgaq3Hytb6lLpHWAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	slUGZr4RF032i1AJPKbhTYGRHPgIVJB6qYRz7tFADyIux9u8uhYDkc80cvEBlDVpiVJKwjgP4wecSnybzRYjfBH2NNdB1u0FxmXQgTbp50piDrZk5O7hQBIZeenOCVo/6GkTnAq40eNrVL4dEEaM7bk7VuHul3BBQhFc+D0g1aU5UKvlO5epnlEKydvaZ+gVFr/v/a8Py7A9D4XEE4VmjZb9QzxkZM22ZCG4TGVlwbZYLE1W3GcrJBhnJpZH+u5nvHLIc1m7Loc0amEqDUe/iRXi10z8mB3HOkyYubnrgTqGDe6wVlHDLh2vUZhi0bC3m7sJ1KZPNF7LMtCeEdgyezLwhB12f2iZhlf4pGRbVnCQu8NXbfYBIEb8ROlk7tLpt1NS1Fqa6C2VSA6PkglBQ2rALTPWsYJNalebon2Wc/ob4N5dP1bXje0e94ByusIY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:17.3701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea93cce7-a2be-450f-b4b4-08df1234f574
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384

vGPU communication buffers need CPU access to regions within their
VramBlocks. Add BarMapping to map these regions through BAR1, including
regions that start or end within a page.

Use BarUserAccess for the mapping and retain the backing region until
destruction. Restrict CPU accesses to the region's byte range.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm/bar_user.rs | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 2e6d229b1a23..ef357fd516b7 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -18,6 +18,7 @@
             MappedRange,
             Vmm, //
         },
+        vram::VramRegion,
         GpuMm,
         Pfn,
         Vfn,
@@ -171,6 +172,110 @@ fn drop(&mut self) {
     }
 }
 
+/// A BAR1 mapping that retains its backing VRAM region.
+///
+/// Unmapping requires [`Self::destroy`]; dropping this object does not unmap it.
+#[must_use]
+pub(crate) struct BarMapping<'map, 'gpu> {
+    access: BarUserAccess<'map, 'gpu>,
+    region: VramRegion,
+    page_bias: usize,
+    logical_size: usize,
+}
+
+#[expect(dead_code)]
+impl<'map, 'gpu> BarMapping<'map, 'gpu> {
+    /// Maps the containing pages while restricting CPU access to the requested byte range.
+    pub(crate) fn new(
+        bar_user: &'map BarUser<'gpu>,
+        mm: &mut GpuMm<'_>,
+        region: VramRegion,
+        writable: bool,
+    ) -> Result<Self> {
+        let page_size: u64 = PAGE_SIZE.into_safe_cast();
+        let region_start = region.address();
+        let region_end = region_start.checked_add(region.size()).ok_or(EOVERFLOW)?;
+        let map_start = region_start - region_start % page_size;
+        let map_end =
+            region_end.checked_add(page_size - 1).ok_or(EOVERFLOW)? / page_size * page_size;
+        let map_size = map_end.checked_sub(map_start).ok_or(EINVAL)?;
+        let num_pages = usize::try_from(map_size / page_size).map_err(|_| EOVERFLOW)?;
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        let page_bias = usize::try_from(region_start - map_start).map_err(|_| EOVERFLOW)?;
+        let logical_size = usize::try_from(region.size()).map_err(|_| EOVERFLOW)?;
+        let mut pfns = KVec::with_capacity(num_pages, GFP_KERNEL)?;
+        for page in 0..num_pages {
+            let byte_offset = u64::try_from(page)
+                .map_err(|_| EOVERFLOW)?
+                .checked_mul(page_size)
+                .ok_or(EOVERFLOW)?;
+            let address = map_start.checked_add(byte_offset).ok_or(EOVERFLOW)?;
+            pfns.push(Pfn::from(VramAddress::from_raw(address)), GFP_KERNEL)?;
+        }
+
+        let access = bar_user.map(mm, &pfns, writable)?;
+
+        Ok(Self {
+            access,
+            region,
+            page_bias,
+            logical_size,
+        })
+    }
+
+    pub(crate) fn region(&self) -> &VramRegion {
+        &self.region
+    }
+
+    pub(crate) fn gpu_va_addr(&self) -> Result<u64> {
+        self.access
+            .base()
+            .into_raw()
+            .checked_add(u64::try_from(self.page_bias).map_err(|_| EOVERFLOW)?)
+            .ok_or(EOVERFLOW)
+    }
+
+    pub(crate) const fn size(&self) -> usize {
+        self.logical_size
+    }
+
+    fn access_offset(&self, offset: usize, width: usize) -> Result<usize> {
+        let logical_end = offset.checked_add(width).ok_or(EOVERFLOW)?;
+        if logical_end > self.logical_size {
+            return Err(EINVAL);
+        }
+
+        let access_offset = self.page_bias.checked_add(offset).ok_or(EOVERFLOW)?;
+        if !access_offset.is_multiple_of(width) {
+            return Err(EINVAL);
+        }
+
+        Ok(access_offset)
+    }
+
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.access
+            .try_read32(self.access_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.access
+            .try_write32(value, self.access_offset(offset, size_of::<u32>())?)
+    }
+
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.access
+            .try_write64(value, self.access_offset(offset, size_of::<u64>())?)
+    }
+
+    pub(crate) fn destroy(self, mm: &mut GpuMm<'_>) -> Result {
+        self.access.release(mm)
+    }
+}
+
 /// Run MM subsystem self-tests during probe.
 ///
 /// Tests page table infrastructure and `BAR1` MMIO access using the `BAR1`
