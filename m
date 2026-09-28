Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C503DE441
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591437; cv=fail; b=jYgX9p6uG0gQ6g8fSj7gWjbrh7QM7cuT5iOpC2KSoYFLGd9PafnbuY2bTmKyrhLcQuHW3GloL+TXvc1Xuk4Ao1/o2h+LiCMU6HytoNYQlJWfuhxAEcuivN8ykTrIjRL88TkDHjD1QfWRENNcvxt6c5WBgcbCuVg+xRHZZtJRXoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591437; c=relaxed/simple;
	bh=fGQbiKzWMs0uojDs1hZxSWVaIlgtC00/oQEdZawCjMw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOqI8heN7AapC2lONJYIznRG1VD6+RAW890kUK6k6AqqU6gHIwmPucMXsBErw3+Xi7Vj0K1m9EF0x3EFKA0CgOgOQs40i2BPB7OTSwFF7eDZajFBpuKg1rHqMVUnmyqly6gECS+bU/7YorgfjCsFNHBytXlDLC1ynmHBhs9AQKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LR1vsquK; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LR1vsquK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkrorQCUZJ08uvWWCiLarGtaSa/AlUmPwyM28OxTjJbEzpj8zEuYr7gJKZ/LZrNdQQ2PcmENhUOlIjXR6iEc9FPp3vCMlciDHd8XTa6YlEs3slq8ZAKO281tm/OLmRq8eKksoMuW8ipfCCUWK6BBJ9VVBjO7iND8xV6aXK8yOgLul0cpDKo1xamwoVCM3Zvv6hBEP8MgmDDC5Dvia3Wf5adRDoJmezod8R5tx87JtRbNtIa6kiPqsJIRkfQr0aHiM8lAatEvwXAV6ZptSem1eJU3G8N8En9s7768+oFF6RFCbiHnALesWJ8GfH+FRfsYahuvwgZcutB84Awom4Ip3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlq5+P9wij7+1VtlAMtn4h1CMIjskudK3m+gYobok7k=;
 b=LSCx1XlYKgVdqcljbDihwUegUfvcHEKNDBS6Qc2XTBZ2a3mWv8/8kT8SXDd26DP6cFBt9nJmHqz2TbP5LS5Xy7QvCjDd2oICtKuTxyKoiunthplPkAPzEJE7a8qvgYAuAkksgKA99J0IJjgos5iszxLxw3CDzhyxj8l0guF1RD22X80mi/Uk0qrCaKHX5OibczoJ25dp9eiKLqwPNpcZ6hNnGmQ5eT/9J50fVLH6rgGwrA7UrUHp1vTzJ3hehkvK09YRYsdHYFAkFuNqjJNCTFQdm7AomzAz6REJ0TLLNlfsEWwLkueDITuG/DSgrfgLpRlfhnEbUQwDHNqT6VaewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlq5+P9wij7+1VtlAMtn4h1CMIjskudK3m+gYobok7k=;
 b=LR1vsquK8/qGGrPdxstgGkTYjdLWUPeZKDrzK1xHKmbsYDz01YWm/oK/rr/MsacSM4ry1oLCGUAx/KkRZM7OysHECZ8Oy9170rUztFsC5cE29xlkdu8Wy8Fs5MkHqTrpinJfQ5b4fm/CGVPc3R/ACCPeFrcL8RHZYCyf3V8zreON1eelnUv19mYn1MsywxEsD4ekClY6BhT97PzqoL54UgYQiD6kNMqTPibRwzv3zoYbK/CxE7Absp0qWuL98UkQDrWpFxa22Q0VJWiAH119CY+YsN4Pzgp7pvzAJWoyFdMQu58GV9aKce56ZYu0z5m1p1OFYy6PJm2jnnQjEiewXg==
Received: from BN9PR03CA0870.namprd03.prod.outlook.com (2603:10b6:408:13d::35)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:30:30 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::4e) by BN9PR03CA0870.outlook.office365.com
 (2603:10b6:408:13d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:30:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:15 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:14 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:06 -0700
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
Subject: [PATCH v3 10/31] gpu: nova-core: mm: add VramRegion
Date: Mon, 28 Sep 2026 13:28:13 +0300
Message-ID: <bb5e2b702b4045ffc246f2f51742cba4f046ad6c.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f604dda-8fcf-48d0-eb74-08df1d4b8468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D8/D7J6HDX5fAM/j2a2lahLu/5BK/GY8yooRt8XfrjVc9LzF4ogN7otJqHOAruzlsCu2/ZZTc1Vz8nAwHfqA7M6NypPxbRKcd4Xe39Qv9DURLBQcoznQJ6S7ELxHeQXZMhhlCbPbSwFMez9oxw3miGa0fIhSqvzei96WxLNx4iJj4PU+hK3yf+uy/x2RpA1gogsCU3FdoRphwW2S0MhB1wd0Nta9ciPikGh0I6g1z1P10oykMBizmEoAN1iBxYR6mNZ1bIMZa+HAlVIhRqAaB276ULjm5aKKsFnP51TFhLijiKvwidmigULponx8ahzJrPsCoivSF26YPwhNmNriMKycocQtUzAjcC2Xwq+5J1IVZlk5+VYJ8iVkSRe6wLBx85s7QJ2LV6Gh9r6WZIXmtWaWEQkHytCROnl5keWSiYlq281G2jkSZQzK+S+4Ww6d10cWtAfqscpFsTA0L9y7LVFl3qH+7kNkdC+UkpCadojmc7LeEtXC2xfsYgTBFfy/51xYFVUkyXf1svGFppiNIw2cuMRPvgj+ratqVNINPuJpIRtzsLviEiYvlNkKmeTX0GbH2rfgu5aZ8Nsq7w58/VNUyD+4M2FuHSXfCYmx15/FNUKK7EueparpYX5aTqGOzuixqs9QuG0LvU4a7lGg9kZPlacrG4J5qvJhJgGoe5oHgCt2wKdlcYEVReRI7DbLcrjyty0BuJ6gV2byIrMx4g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MC5slCKHckunH4NvVSZB5f6kgV9Jeeqm6mSnEZSQJavE/f8slnBFOqT2nu8KirZwR1T7Kv5FkdN1TPf8X681YT2olIf4mtN1lZHu03mCkSZqUCtj/F/L9Ry5RUaIMcMJqTRgycmcRWjWGSVIvrS++tnDhDvBda7oKhs42W7LdrwWDF38hCxKkA4Nd98PMF56cGzL56jEkOa0H88McwwfCNPYvoaUm/tLgfNaWX1zWrQ+CWUtWmI/xqjAWvGYoaE5RSWgOHqlsXXfq07qidIuYcfy/wrkRzo4NdQAW0l9jrgCYEAEweO/tNrzDwXAe2bozJHFx39gH68FhQZRZSTtQPjzTcUsAK8p+dH7BsGWtK6BWlczHMDgZxI4THOJmhzbCqU3f8N+yZDzeV7cB5x/HP0LH0/pSiCEm7rskqITB8izs7qUmWXXARVPHN5dQLe8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:28.9323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f604dda-8fcf-48d0-eb74-08df1d4b8468
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B

BAR mappings do not necessarily cover an entire VRAM block. A region
layer lets a mapping select a byte range while keeping the underlying
allocation alive.

For vGPU, communication buffers occupy only part of the management heap
and need a BAR mapping of that range.

Add VramRegion to describe ranges within a shared VramBlock and support
bounds-checked subregions.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm/vram.rs | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
index b6cc177825d7..bed90a3de8bd 100644
--- a/drivers/gpu/nova-core/mm/vram.rs
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -34,6 +34,62 @@ impl VramBlock {
     pub(crate) const fn address(&self) -> u64 {
         self.address
     }
+
+    /// Creates a byte range relative to this allocation, retaining its backing storage.
+    pub(crate) fn region(self: &Arc<Self>, range: Range<u64>) -> Result<VramRegion> {
+        VramRegion::new(self.clone(), range)
+    }
+}
+
+/// A byte range that keeps its VRAM allocation alive.
+#[derive(Clone)]
+pub(crate) struct VramRegion {
+    backing: Arc<VramBlock>,
+    address: u64,
+    size: u64,
+}
+
+impl VramRegion {
+    fn new(backing: Arc<VramBlock>, range: Range<u64>) -> Result<Self> {
+        if range.start >= range.end || range.end > backing.size {
+            return Err(EINVAL);
+        }
+
+        let size = range.end - range.start;
+        let address = backing.address.checked_add(range.start).ok_or(EOVERFLOW)?;
+        backing.address.checked_add(range.end).ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            backing,
+            address,
+            size,
+        })
+    }
+
+    pub(crate) const fn address(&self) -> u64 {
+        self.address
+    }
+
+    pub(crate) const fn size(&self) -> u64 {
+        self.size
+    }
+
+    /// Creates a nonempty subregion relative to this view's start.
+    pub(crate) fn subregion(&self, range: Range<u64>) -> Result<Self> {
+        if range.start >= range.end || range.end > self.size {
+            return Err(EINVAL);
+        }
+
+        let size = range.end - range.start;
+        let address = self.address.checked_add(range.start).ok_or(EOVERFLOW)?;
+        address.checked_add(size).ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            backing: self.backing.clone(),
+            address,
+            size,
+        })
+    }
 }
 
 impl GpuMm<'_> {
