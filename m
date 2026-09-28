Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A03C3F75
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591558; cv=fail; b=N0v61R4Mps1+06nKO4c0mXsZb0XIGndWqDXJLKoAnj1GoEcxNfB0/lGXsqgcaxn858SsK4Xo3cH7KJQNmYnqRFn48VUGCvqpHmGZU/TQm65QQxC+Wc1lpD6HCiZbN0+tdwzNwBjKZQUhQc3e0g32p1e3P2QE/c5TShVXjNlTME4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591558; c=relaxed/simple;
	bh=xBKReQ1suWwUEY7TYjK4UUaloZowrqdzbbbZuEP9YDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXSVWQonfqef271b/38HSjlUkWBmOa/oukJEj+TiZeIAVE6K3cT9pgYiyXKPwB5V54P3RdbikQVseR7OzTgQkYZIu/+5RXF301JcpYcrqxv+9REwAMhb2sUGsuLccs+9RrBjUPtImbYIrOJ5uwjyPB0uHJxEUEkbxRjM6RfvTv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZyvMx/M6; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZyvMx/M6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liUrpiGQ1Jc2teB4pz44hDWQ00ppmL1lEyaBRcIjYgCYfHIlRqMCzv0yxCEci118jurVd93J4trGmeO3Qg0lVr2Unxicqo+8guyETyPIeGDd2NmaCdPyzRtxx0XCWeNpJO6SEl/iyPP87n+ObKOND9ylnqa2RnnwstjRvWF59VLbZABdWXreDQmykZ2zyOK+FSXx5hppqNUEkONXoPaRdAnG4KmOgybesCSmbOTDDLBeqd4eUrNavLTAz7CaX/Rd8Ho2ahtiRYpsZHXAduMQRGTioRUmYD2kOX2OGqN4CWGvv1SQHC1FsZVJ3j7Z1BVi5JPDud2EE/g2pW0ZLhKZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW/LvIIfvz7Z/M5LScndgMGvog9EMSigqWluEmHRwO4=;
 b=omp4f0uRQgJZJkFxXrZN5oYstqRHD3OOxGGumsFuuTszS9IYQJzaoXdeKHPIE9SQMVSvxfdbrQGkkPCfsa9+riIBYcaQDHDqxZejXe+KGPXIgIc2HwoypR4AIX/KIHDrjBzPUIj9fXWwMIpH6ki9zac4jOn088oNOw4D9VxA0C66Ke0A8Zz+guqXv4J82/mkSH1JRMCCtnjm09YNnprXweGOXf4uWgvhzxfi9wuFB3318bJkClJiwU8To0JoaS8ynhoh/BtznHifTDkDYrRA+aDu47dUM2fGPfLPQZ/mQVQPwwbVnUDUvGefs+2zuvXbPklHo28ONoO3DU3iR2ix7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW/LvIIfvz7Z/M5LScndgMGvog9EMSigqWluEmHRwO4=;
 b=ZyvMx/M6ZHgJszAWCmfXKl2qXozx/s4ts/NjuT01S1qxkEAy+LHVQ2rtuXuh6VIndyq5RUiZcpij2DQFeK9kcW4SIhaFBmRClRg+pSmEdbnpNs3gn4Y4OfU5X6/y7i3LQlhnFSs1cU7bcw0vYqSf620lzkeu2FrNK95mFLoi5R4Sa4Swt3JAdoFEErKJh6YbXcw4MrCSCx3+siFboMvJ22Cu0zi7oFCq9jBYp2+mtKn5fEGqJ0Vcsauwm1LOc9uaussZrlu55dBNc/lzSrUItFW2Q5zn8LMnj6/R3wPlx2YgHiKEwc+GRWbxQXgyCidLwBqvoJjILOrXF8EenMFg6w==
Received: from SJ0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:a03:33e::28)
 by IA5PR12MB999325.namprd12.prod.outlook.com (2603:10b6:208:603::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:32:30 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6c) by SJ0PR03CA0053.outlook.office365.com
 (2603:10b6:a03:33e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:32:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:32:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:08 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:07 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:31:59 -0700
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
Subject: [PATCH v3 23/31] gpu: nova-core: vgpu: initialize GSP plugin RPC buffers
Date: Mon, 28 Sep 2026 13:28:26 +0300
Message-ID: <1ffd2814f3adb7657f2154d9799e5492fc5c4a99.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|IA5PR12MB999325:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7911dd-0c1b-46fc-f19b-08df1d4bcc1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|3023799007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EYJDF5NmnDmzPfx5iSNkvwzkKfmqA/sSFqCDg3VM8+o8/CikUcOzcbuRs+3iO+cRlGx0wGp/WxetVPrU+8LR/HNQ2tb9qucXFYh2aC7jO3CigqOKRaTdy3g5LkF1KdHOgWXKBou+UaAW/FJ7k7H+EGQm5N8VGisUK97/fHtr4xO1coOyZBXPdRgd/CYECg1iM4nzcMSaRXuPZsR9EQ6Q8U6+tO4RUcHXoM62ZMaCdi8WMAXBhAcN2y/2cvv1I+a9FoTkwDitpR+yqcZ6PZrXwk2hAasudb4bxn9/Hz6R4mqc2sn2qOFQALcUQ5Yc3JehqUCbTHMwSTZxUtn1JVdCMO9AnS7TjcHW6q+87UOwlRPZgyuDgjJ7p7OwuoXMxhiu1o8eXyPWOcnCfqz3epO7fvWd8AH9wgYU2DtZO7Mf2i339O/rmi1XpDHJ0vf738+/XZjFtvFPxJDbAngNzyIXrl0ZeRR6LZ9M5cx2elKdrbfbpTVdF2+JKJPX51UGRvHnqaYpuXaT716Vpo6zXDGSvCGafi6WO12i+CjclhmxT9vt6Equ1j0xtNbROzUjwxL8Mdq2xaPGH183Vhq3n5J0YT+CumfhKLmu3JQS1RGJuRS8MZTANH3dvELn5+zmN4H9gzuuPGLbS0r33yQNrDHxvlBNidMb9LoR3Y26KdJg1q3shNE6bYvVOKj7E46CgO+l4tzN5ThoR4Y6XMDCQO+loA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ubkz5uZSqsG+1dj79UPUF9HGTeH7Z/b88vAwOdiUud/R8K22BBCTO0Nfdi95uQmww9mwwtnMQ2e0VMDGBc65PfNfel4i92ESS4onhiqEGmxw7msZtldykYuZJcgEQLL5qTIw+jFVELTauLkxbMAPP8A9tMnG3XaHdOH8u9I5MDA8xWHvmfhxJrpYz4JPMMMTe/KIVaTfNLg3wfvSAnU3w7h4hlErFdJMUK3/FCs2cdBRet9BMtHi6/muZwRdrmFd3c1CwHSR6mAKPmB5754VXcZZvze+kLo6qmRrRfa5llerbN7bSeHkVqH3xFuCoHLCmexfb+HXI3Kcrc1tNLzxzaH00guZ//Zl4KjGd2gEKUi2KVsF6AYb3cu+wkaHtERy9w5v/QAZfF10ueuz8ga5kkrX0aDEKeLKlzfXwz8TB+ah+8nfh1eV0arOnhbTcH/5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:32:29.2964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7911dd-0c1b-46fc-f19b-08df1d4bcc1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999325

The first plugin RPC needs region offsets, a protocol version and
initialized control and response state in the shared communication
buffer.

Add BAR1 accessors to initialize those fields and verify the fixed
response structure size at build time. The control sequence field first
carries the boot-ready marker, so RPC initialization must follow the
plugin's ready indication.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/mm/bar_user.rs          |  10 ++
 drivers/gpu/nova-core/vgpu/fw.rs              |   2 +
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 141 +++++++++++++++++-
 3 files changed, 147 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 964aee8bfdb1..bcbef1571fb9 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -150,6 +150,11 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
         self.bar_user.bar1.try_read32(off)
     }
 
+    fn try_write8(&self, value: u8, offset: usize) -> Result {
+        let off = self.bar_offset(offset)?;
+        self.bar_user.bar1.try_write8(value, off)
+    }
+
     /// Write a 32-bit value at the given offset.
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         let off = self.bar_offset(offset)?;
@@ -283,6 +288,11 @@ pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
             .try_read32(self.access_offset(offset, size_of::<u32>())?)
     }
 
+    pub(crate) fn try_write8(&self, value: u8, offset: usize) -> Result {
+        self.access()?
+            .try_write8(value, self.access_offset(offset, size_of::<u8>())?)
+    }
+
     pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
         self.access()?
             .try_write32(value, self.access_offset(offset, size_of::<u32>())?)
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 1528cc56ce74..03225b9833c3 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -15,12 +15,14 @@
     VGPU_CPU_GSP_COMMUNICATION_BUFF_TOTAL_SIZE,
     VGPU_CPU_GSP_CTRL_BUFF_REGION as RawControlRegion,
     VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_CTRL_BUFF_VERSION,
     VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_INIT_TASK_LOG_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
+    VGPU_CPU_GSP_RESPONSE_BUFF_REGION as RawResponseRegion,
     VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
     VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
 };
diff --git a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
index a00f4d2affc7..31da31de4fd2 100644
--- a/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
+++ b/drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
@@ -20,7 +20,8 @@
 
 use super::fw::{
     self,
-    RawControlRegion, //
+    RawControlRegion,
+    RawResponseRegion, //
 };
 
 static_assert!(
@@ -38,6 +39,10 @@
 static_assert!(
     size_of::<RawControlRegion>() == u32_as_usize(fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)
 );
+static_assert!(
+    size_of::<RawResponseRegion>() == u32_as_usize(fw::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE)
+);
+
 /// Physical VRAM regions containing the vGPU plugin logs.
 pub(super) struct PluginLogRegions {
     pub(super) init: VramRegion,
@@ -80,9 +85,14 @@ fn take_region(region: &VramRegion, cursor: &mut u64, size: u32) -> Result<VramR
 pub(super) struct CommBufferRegion<'map, 'gpu> {
     map: BarMapping<'map, 'gpu>,
     control: VramRegion,
+    response: VramRegion,
+    message: VramRegion,
+    migration: VramRegion,
+    error: VramRegion,
     init_log: VramRegion,
     vgpu_log: VramRegion,
     kernel_log: VramRegion,
+    guest_trace: VramRegion,
 }
 
 impl<'map, 'gpu> CommBufferRegion<'map, 'gpu> {
@@ -97,22 +107,22 @@ pub(super) fn new(
         let mut cursor = 0;
 
         let control = take_region(&region, &mut cursor, fw::VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE)?;
-        take_region(
+        let response = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_RESPONSE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let message = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_MESSAGE_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let migration = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_MIGRATION_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let error = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_ERROR_BUFF_REGION_SIZE,
@@ -132,7 +142,7 @@ pub(super) fn new(
             &mut cursor,
             fw::VGPU_CPU_GSP_KERNEL_TASK_LOG_BUFF_REGION_SIZE,
         )?;
-        take_region(
+        let guest_trace = take_region(
             &region,
             &mut cursor,
             fw::VGPU_CPU_GSP_GUEST_RPC_TRACE_BUFF_REGION_SIZE,
@@ -143,9 +153,14 @@ pub(super) fn new(
         Ok(Self {
             map,
             control,
+            response,
+            message,
+            migration,
+            error,
             init_log,
             vgpu_log,
             kernel_log,
+            guest_trace,
         })
     }
 
@@ -177,6 +192,21 @@ fn read_u32(&self, region: &VramRegion, field: usize) -> Result<u32> {
             .try_read32(self.io_offset(region, field, size_of::<u32>())?)
     }
 
+    fn write_u8(&self, region: &VramRegion, field: usize, value: u8) -> Result {
+        self.map
+            .try_write8(value, self.io_offset(region, field, size_of::<u8>())?)
+    }
+
+    fn write_u32(&self, region: &VramRegion, field: usize, value: u32) -> Result {
+        self.map
+            .try_write32(value, self.io_offset(region, field, size_of::<u32>())?)
+    }
+
+    fn write_u64(&self, region: &VramRegion, field: usize, value: u64) -> Result {
+        self.map
+            .try_write64(value, self.io_offset(region, field, size_of::<u64>())?)
+    }
+
     /// Return the physical regions occupied by the three plugin logs.
     pub(super) fn plugin_logs(&self) -> PluginLogRegions {
         PluginLogRegions {
@@ -209,6 +239,105 @@ pub(super) fn is_plugin_ready(&self) -> Result<bool> {
         Ok(value == fw::GSP_PLUGIN_BOOTLOADED)
     }
 
+    /// Initialize the shared control and response buffers for plugin RPC.
+    #[expect(dead_code)]
+    pub(super) fn initialize(&self) -> Result {
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.response_buff_offset),
+            u64::try_from(self.region_offset(&self.response)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_buff_offset),
+            u64::try_from(self.region_offset(&self.message)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.migration_buff_offset),
+            u64::try_from(self.region_offset(&self.migration)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_offset),
+            u64::try_from(self.region_offset(&self.error)?)?,
+        )?;
+        self.write_u64(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_offset
+            ),
+            u64::try_from(self.region_offset(&self.guest_trace)?)?,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.migration_buf_cpu_access_offset
+            ),
+            0,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_migration_in_progress),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.error_buff_cpu_get_idx),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(
+                RawControlRegion,
+                __bindgen_anon_1.guest_rpc_trace_buff_cpu_get_idx
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.attached_vgpu_count),
+            1,
+        )?;
+        self.write_u8(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.is_gr_init_done),
+            0,
+        )?;
+
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_type),
+            0,
+        )?;
+        // Replace the boot-ready marker with the initial RPC sequence.
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.message_seq_num),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(
+                RawResponseRegion,
+                __bindgen_anon_1.message_seq_num_processed
+            ),
+            0,
+        )?;
+        self.write_u32(
+            &self.response,
+            core::mem::offset_of!(RawResponseRegion, __bindgen_anon_1.result_code),
+            0,
+        )?;
+        self.write_u32(
+            &self.control,
+            core::mem::offset_of!(RawControlRegion, __bindgen_anon_1.version),
+            fw::VGPU_CPU_GSP_CTRL_BUFF_VERSION,
+        )
+    }
+
     /// Invalidate the PTEs and release the communication mapping.
     pub(super) fn unmap(&mut self) -> Result {
         self.map.unmap()
