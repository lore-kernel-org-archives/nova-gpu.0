Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BB3F412D
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372274; cv=fail; b=EPW0nEKTxHCqUxsmrYX8mWkAdnJNUquENL2j+MtqeKrpHSS0nn+QGwEg+v4C5ZTeRyHnqJ98m1+/tdU0wLW40WUet8l0cTItNmE/djtm2DwV+ZTbQ05xojtWk1cru91Ow/s/msi77zgeFfW6e0qqJ/ojY0Ruulsc5t29UZMbsFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372274; c=relaxed/simple;
	bh=BEnZ9y2kwDoQKvqE0EFF+q89bU6AkZjud4BrNh3PC4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7PH9fGKefd7tlpl1hBfybA56ugaxIQDqBaaipbQB9yNAqPcw/Ja+EXK4slUiOiJzaJYvY/CouPrbUpOS+yWbPqCeGXQwkTSSTWPcd/ob1HRuEH8UCNshrQvGnWo9CojMctvo01kXKl5HGgscUrZf0YRdXROQhiEenJ4x9lFIfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cti2SgqE; arc=fail smtp.client-ip=40.107.200.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cti2SgqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1WCX5IBrNZVEqtEHOS2c84I3UO9nxI8u93eAPHWCCFu+Bz9/IPGqNbDGpUR3gw7qg5c+ZdVZyt3MflWYyr0XGXVIW2N/2DW1FoRXuBYLaohTtf89AVzOBS8yOLUnzP1y8tV4G1uZNOLMS7xndZgizEUS0YCIFu8TBF4vV+kECHyvpTK9YENSoLtr2QvaEYS3wPJaXk7m/YyMl11Pqkj7P1H9srY1R1ZQfdvaq0tVqKOjUChZ3GQPgq4GAqXYZFa5ktd269cbxDJk3JUwoU8GMOsTsRyBH8fl8v1uFf2ZzMcArWt3NokhdEFji0iCYwAqLgSYg5RsMuqm0qlzLx1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmSTn4DBLqZVF2JzDeHUohqPQ8Q1VmArWPB8Y1avywk=;
 b=Kzn9r5AZ7gInZGz99VOUlt4y7EuVde1cJxqLFBKB76bP+y32ahShkvYxLO7P2JX9pgDj5cjOVbUpXrHqrdoqbAPGZ82eh4DTMlQsUlO0Eu6QjYWAOkx2OgeCxSLZ/sOyPKd23k7LU86CLUNa3KXjLeSO575YQJsQUACxmHS0l2ZXWdQIOL7ESHA+rMAHNLGp3cCa1J4WTkXNkJMXdtFOQeRKYXkASjtMKcwxZtN8SyMFuXU3glCcNH+i9TaFBL25zHrVgx05bHiEeLHrUEAIxRkzVcYbty/lyGMSmR6s2MHtghWw8KonRGm9u05WfDF4+sbLYQrSQX+mGWXGR1OK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmSTn4DBLqZVF2JzDeHUohqPQ8Q1VmArWPB8Y1avywk=;
 b=Cti2SgqESpUzFZUO18uXwjLzj0NZhpPl42ZjCWJIjkmhV7w8r/6TAX3faWlZ4WenNfHvgoGG7plu1tl4UuQxdu2a/5hRK2a3vjw1we6pNBqI7UDWCIiJKNAQsG1PlgytquBdNnpIHAQPF/DzVcTuXEAXB6JNJMK8FkvngeZHdXrc+cu8kHRJ1N8Dm2P72+2jt9/rxEg4Qnd9EWSAlje3cz8T9wYwUM38E0DG2/9k4dIdRJnfMHkNku54u2jt5q4IsORQrrRwQ03XDdJlQ625uIP9CyW8hJr5hZle4d8JjPGWr0yZCLHhSkV2wG4FUI4djwPSVGpj1O2Rp2pn03MEKQ==
Received: from BN9PR03CA0374.namprd03.prod.outlook.com (2603:10b6:408:f7::19)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:51:07 +0000
Received: from BN1PEPF0001854B.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::5e) by BN9PR03CA0374.outlook.office365.com
 (2603:10b6:408:f7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:51:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0001854B.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:53 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:50:53 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:50:44 -0700
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
Subject: [PATCH v2 11/32] gpu: nova-core: mm: add VramRegion
Date: Mon, 14 Sep 2026 10:48:46 +0300
Message-ID: <20260914074907.1399629-12-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854B:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: e3118039-f2bf-4b1e-f118-08df1234ef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uj5hKIQWCnsPYnqvp/bUDwzB2K/G5cQOWWZEBEGcWWXiEiAWPViXMEA/koIrkgwBH2zCOWooilUB7vXGL0S88Us2HI9Mc5VCR5a3WN3vPZcnlS2p8OrVuGd6a1bEnGUsCFkW572NQG2tir9s9qR0ZvgN5YkFCw64ZoSJSMAECUBRoFmccLSeY9R/ouX9hvdUGfZLFr0hFr46PIAKQlGZMHje/4vNEfD8plsXerg1Ixl3wv/7dRn82dUBy62WutSvmgwHQ1PxcMvoZq6gu+GRqIluG/MQ4nkol5y8tAyQOUjcd41sxRD8VCDir3RThtKBKgbBtsJCDKvrARm8Zt78yANXL1Ads1+1CkihlBI1lx5lTHnaLGqnw3znFQQSOOrpR7if9S0P0cJkD4RDo60oSx1p1P4/j4EJNqcG2mleSgms0NWS0Wx8/ocrNjaWJGj2ZQllS5ibKmtX9HYVIXCcwzTqw+35qI/yI3mD2bRqzJxgtciZE84W0nuNaPH1TJgQRkN1yWvwuD6Tbf/yML1MjtbO+GRXokzWiqK76NN80cmieJblDnm/lWuusYrk05k/bRxYit8Hj08TeSeZFv6lQVaiT1egkrChsvFBmMUpEI/6m8OIv3LH/IOl/YZlpqBdl7IE9K/ml367xrZd9DaiD79T+sSviVXHXc/hhJBUm1UlzTscHl4BmHKieeT+ez5JTHGeDHyYaqTxm1C6kO+3MA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z+UbeTa50VV2EyC5d7eQO7dFyvC8MdlAUuWBCIQjiIh+E5IKFLSlki10T4gKcqtOeXPb0euqLn67Jz5hHivFK/GBA6zVBLK35ox1y5X+fjaGtZPT6B+8RtNMaWafzvi3QgcHIl79NMOhqUrwkFozv8KWR/QVhoKIr/Le+lxRaUpaKDEApuFy20oT3FAIaLG+4A1aQETqdtYoZNDmKC0oTTiBpyOx6hYf0nS1aecIxLCbuvZNQk6tsxml+CtdCGBjG+UdAOR/JlYG1zJxCVmhdQ3M0XqSlsrWdVy2urcdRmf15X9bQQF+Sryz3ABboYvHuPbUrdar6Okl1wY9JnmLjTnlfRiRMXQ/t6UZoQTjx6YY5RpK90tZ4h/WHR8/wNqzzlsjnG2D3YjsYro5zUZ9Glx7nAz5wfiRP487YxrfrrkGqoHZbBQzHppK1/qki3aF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:07.4843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3118039-f2bf-4b1e-f118-08df1234ef90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919

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
 drivers/gpu/nova-core/mm/vram.rs | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/vram.rs b/drivers/gpu/nova-core/mm/vram.rs
index 743a2a163318..2c7183f08027 100644
--- a/drivers/gpu/nova-core/mm/vram.rs
+++ b/drivers/gpu/nova-core/mm/vram.rs
@@ -34,6 +34,68 @@ impl VramBlock {
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
+        let size = range
+            .end
+            .checked_sub(range.start)
+            .filter(|size| *size != 0)
+            .ok_or(EINVAL)?;
+        if range.end > backing.size {
+            return Err(EINVAL);
+        }
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
+        let size = range
+            .end
+            .checked_sub(range.start)
+            .filter(|size| *size != 0)
+            .ok_or(EINVAL)?;
+        if range.end > self.size {
+            return Err(EINVAL);
+        }
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
