Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEA70836
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370488; cv=fail; b=W0zLfwuLX5Ug1sXNViVHnfT3yzRZBL/msFSfXzLn+8o8KTMEaWXo6K+T1kMik1DKkZ3uL/x9/P2LlnWVmmBTHBSaTsJSXsRSFaNXntItFohHaxF0cG2CHdZSo6jnoTp68pO7YPyGHkMOHgemHtRtOApd0B5WjK1udGOQGIBOb5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370488; c=relaxed/simple;
	bh=A0B7x0M88aiqBVxq1DQpSmdVFrxRyXtbiQq9txwzx2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fh9mYKzVHmW1pZiXdiSc/spAsGmHUdZnaXxca6Qbmhf6pGcSgsATG09XQInlqJYexqbc7urJANA8YbF19Tss6cYjW8KE7fzGs6ARTFeQg/hMU979T3EVr3rtgsLtaOXWT1XuLLlWoDvOnuA5UhnqDPdUmeLOfPm9TVw+lH0fpRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fCaAQ/+S; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fCaAQ/+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZK/YHpm0VzNgAkY2Y2ERJkWC9ZauQQ+jUjW+J8r+3kt2WmjUNx8Xxoa7gW4K24P+/XVBxjoZEpbynXPRmQEpM1RBLEgQGuXLuzm/sH1JBvKd1M4wHZoFgsRMmnDnjbL3REBmTDgj43RB08IV1aZWaGzyx4ZBF7nB0KGxMLsLLJl34I4moe9lk3PRDY0wXAke0sT3AZY74X3k9UkcgnUVBs3Czc1UyvXMe696g95/NgEzFZsA4fHl95tm3eDyAlVD9ssOP63BVQZhuio6i7qXn6v2CFH4sCYfqGVj3Uz3yN7dB5m8IxyaId4+dpBawL+fhKr2ZHLJKb2Bz2kDf/fneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1mGJPqK5B323OTwdC/dEd1FBq26ohgmp4fBVGjKlnU=;
 b=pqDX5dlkNcslqhCq04liJrcYc/M7MqorWFHMGAyOizEIWzjZUbotWsBlHDNwcVCkmDg3NfVfMsijW+Rc7tZvivmJ0bVU+dFPQvumtvB79PWkxeasQbf2VEk2wooe7C8cPcC3Ws1Jt6i+3P7ou7pIIWj+uYcfkG0FSgzCl14YyvERwWCvFmYzlpHnU5aN25R9buzSNqiaZB/q0W6AeKPP1QgKFFStGII8MABoKgM9bspklsIzLpuEP3qOtmS73+Q0ODP0Rfe2UIX+j+wYd8e/CrUW727Zqn5zJp583NevOUdrUYOULNCT5LXp/iHSD8vT0yqKq6vn6DEqY+LgUS3tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1mGJPqK5B323OTwdC/dEd1FBq26ohgmp4fBVGjKlnU=;
 b=fCaAQ/+SFROAx/3tUWF1JtSz6G5OTHxYYs6+/hkeSMH5P38CI3huljIi0Z/s6eDWYK86hmnmrrkhRwOQF3t6k/wWFU/z0a3yXCHIUYVN8In4Ev+TCVzd18XzDI43cvMfm8OpFAiZln1EFY6Fe+j/3IYPyckMra6JuS6i6OmLhX/Hu6hnLv7mH/ZCEZoeljhC8zpP4dVqeGFEpD24N0Lw6bWrPewL97cnsy1kG+P23q6IeHwTHE5jIDqUVnYMUTGjsRp2LQpobU0/bOjgJvC06kCwXXDbMlhf9l7lALlspLZtzElRMW13tXfiA5P8UNgmmoxB4t9s4CYwUjsUpIXWdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:14 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v12 01/22] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Mon,  1 Jun 2026 20:20:49 -0700
Message-ID: <20260602032111.224790-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 017b13ea-32b9-4892-058c-08dec05600bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	aZ1HMtBURqQ3i6ei0g/j56VJ9QoWgwTSGYgqO0nmdA2o0kkoI43WyRni1csjP97SyDUDPOWyvt1ZSY9Yj3iXkYGvcAJHAl83IAKHjtuaeZkW9RnQhdzh4Z3uqz4buQCItlDkpqDbfl7QhXoqAYg5Hur/YE6uGB/DiUoBvUUbFCZhg6Y7TZBE/xZosSfbPVM5SNC8hpzLxWUfqFInRnbDaIZzs5flsFWfrf6oH8Z/f4yoosoIXo6vbqFUOJwx63RSNujAd8aIVRSVn1BCp6yiqeIOlfjHLp5nVtMhF1DrjqLW+79HUqms2+3qN39hNYeHG4IlS4KrgSp87UAqnpB1udRQfx4dAGE650rSd1nn5ufelKey/X9zLzVIMminsztBy7Yk/g+QCptl5uq45CqmGixWbJK384wbTPDUyLEaWEZAxbMiN4JzBkBVZBSOxmoM37sYi3YmxB3HqLxiXrP7wuiX8sUSh0x3p1cHR2K59TjtEMKDkteb9de/wTYCiFFVr+V+og6AAkHlOG7dACju2Bm4X2g3URmAFgIeMm78ZUDAsQlsfJaKsCXw3MiQBbNNq4I2OocvqJtUMll5sHkp1MV7Ok0MYApIYvHa1HATNcTolb3NU/WW0FsZx5V3P+H/9upuCSSLzkRN4gXFX/IyMixMhiPgSM6fz8aJ8vrXgiIe37T9xAnTlNboi5kt6y0i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G6uvmipADnHqbgBKLoq68z+2OmTze6ArbRtsHocPStcyzRMxIfGg8x+vW8mR?=
 =?us-ascii?Q?5cnlRBoFBQMaCA22krF6UNusU3w6tVCdDEfaMKfBscAGyhd5L11I69jhJCqC?=
 =?us-ascii?Q?OnjupgBySptAoKLBmUzJZulCQFwP8QpKLbVUkDlcpmlkAT669eusCS6ppg+D?=
 =?us-ascii?Q?FGQL2AAIWLSQv+en1q3/NycOFXie/6F2aPW5XeerghzJVevKrmsE8rrfWWcQ?=
 =?us-ascii?Q?auqWvGbvyARW7VAwFwlovooW8LLMGgQz3sHqGEzG5u6GOt8ss0Pi3bjE00x3?=
 =?us-ascii?Q?a+gSreGqyJ9H13VNoR7nhPA68FFBklSh+qys0G7eqe3UMy/L18y4JSJNjf7g?=
 =?us-ascii?Q?NWX45sIJHls393ShGYE8YvIYC3pVkPhIBqayfK2LRCG2TSoWVgBag6ky+AkY?=
 =?us-ascii?Q?Zyz+hoRU4PfloB7ksPVo+9pHxacC/N2mGiCxnPPLx3PP3tvXorYYxVW3Dk2c?=
 =?us-ascii?Q?fndVabgLJSvcomfXYgKlieUETiFh0d361SuzepB6j689Ka9CKXn0J4NLrEXv?=
 =?us-ascii?Q?/NmtelYZgv3P7bTely2dpbLH3+LEfMH+tsorEoKsUPXuw5V6zpSviMPQ4qsM?=
 =?us-ascii?Q?Mi7bIbvaKohsXsGiUJb6sFNexa/IZnxZx/ItlGyAKdclhznGOlID5sdNHagT?=
 =?us-ascii?Q?VQZ+/tML3Htgkvv1e0r3jDtsDl+GB6UAQROb9oeIJeSQVUO2TfXZnu/EyUWb?=
 =?us-ascii?Q?1oNC6sr974n9orwxEEBfjP8nKm2oLCR4KMtvcqZWO/gWPE7vUvSmzpnFFalr?=
 =?us-ascii?Q?F425alqg2SuYS1QXdo5aHqoIOPOLRyNt9LShNSLOFzJ6iu2jaMOdX4zSGzCR?=
 =?us-ascii?Q?rV36xg2Bx4WDBM87TvClrvEdncK8dvhpEf5+VYIQjV/oSsKiL9M5IqImLGNx?=
 =?us-ascii?Q?I7MeGbUFqm5tMfVB9yMAtcAXZK3UOMKDVQB99Z0fchszDImPPgJoKYVXfaRo?=
 =?us-ascii?Q?C2RoHXvYTlIclYg/Mx6WGbkyIeZ3vhySoSoYXASnuMMySU4QAdGxzOVukLar?=
 =?us-ascii?Q?ukflr/TIYJMmt3wymaG6jpRNtiHmiC9drFgLGP4FVqzr/M1ER3f3DgjXRUNP?=
 =?us-ascii?Q?E46X4dO2xzi7IiatUsQQxsmf7x8I1qjc8yAMXxVM1qV02RdfS5WCiYVqZPdf?=
 =?us-ascii?Q?9EvwcsyjKojZhwjfeciJmIiMX/AIRpHzkREMxcNV8oB1qIP44X27Sn7RuPaH?=
 =?us-ascii?Q?Yt7PhAVpKetwSDbd0QQ/xAACk1/sHzmgYIEILOmZ6w4wiRIz6Jkcpr12yanY?=
 =?us-ascii?Q?yDdjmulbVyydMAr59hD7Iyv09OLOBjmD2iL+/botmxfJ7AACpRjqBykLRu14?=
 =?us-ascii?Q?3HBT9BBWho+So8TyPGMgxreUaqz9vdewRo91BxRQl5yp8ku2IS8dxyFeesuT?=
 =?us-ascii?Q?1I7JVKM5PtFi6hYlhU8q7xcluZi5+JoWTBLKrM9aKuJ01y8c3SjCE/8iBwGz?=
 =?us-ascii?Q?Yh5l00uW3IZwE1htm4D39zf04rTHmdPf4D9GwJEb3YtLQGIUrEKEFL5cbmE6?=
 =?us-ascii?Q?w/lp4uOFnq41yKOxQyTYTrgxsx07W3+RRNR/H9Fu3wtMFULjST/hbEVUWWh1?=
 =?us-ascii?Q?gXF9LEzDVfm9IC1xqfs0gCW1FYEPFD7nLVFW7CDMOIwwUn9jd/uqeaZWOYy8?=
 =?us-ascii?Q?Hd4vZJFm/YF5fQ9TRFGqyPd6blh1wlDAQuH53bTVzKhNFjsV2zLwT+WR+ZSn?=
 =?us-ascii?Q?Xw0s4LjmoU/CGwvH0iK4troa+nC7BlCuS2G7IwxTUHJGURtletKweekw7Ysr?=
 =?us-ascii?Q?viRg5aKQ3g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017b13ea-32b9-4892-058c-08dec05600bf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:14.6847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAPTvfSrn1tDk1qfO7R6uUS5sqDpYfup2YWX1RQUQ5wx2AJrTJ//4ur5fIPFYqEiuRSeWzar4r4+TI3wDdgf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Replace the hardcoded 47-bit DMA mask with a GPU HAL method that
provides the correct value for the architecture.

Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
the device, so no concurrent allocations can exist while the
constructor is still running.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs        | 15 ---------------
 drivers/gpu/nova-core/gpu.rs           | 12 ++++++++++--
 drivers/gpu/nova-core/gpu/hal.rs       |  8 +++++++-
 drivers/gpu/nova-core/gpu/hal/gh100.rs |  9 ++++++++-
 drivers/gpu/nova-core/gpu/hal/tu102.rs |  5 +++++
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index cff5034c2dcd..ade73da68be5 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,8 +3,6 @@
 use kernel::{
     auxiliary,
     device::Core,
-    dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -38,14 +36,6 @@ pub(crate) struct NovaCore<'bound> {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = kernel::io::Mmio<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -88,11 +78,6 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
             Ok(try_pin_init!(NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index aed992488db3..38c75df77e16 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{
     device,
+    dma::Device,
     fmt,
     io::Io,
     num::Bounded,
@@ -269,7 +270,7 @@ pub(crate) struct Gpu<'gpu> {
 
 impl<'gpu> Gpu<'gpu> {
     pub(crate) fn new(
-        pdev: &'gpu pci::Device<device::Bound>,
+        pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: &'gpu Bar0,
     ) -> impl PinInit<Self, Error> + 'gpu {
         try_pin_init!(Self {
@@ -280,7 +281,14 @@ pub(crate) fn new(
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
-                hal::gpu_hal(spec.chipset).wait_gfw_boot_completion(bar)
+                let hal = hal::gpu_hal(spec.chipset);
+                let dma_mask = hal.dma_mask();
+
+                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
+                // still constructing it, so no concurrent DMA allocations can exist.
+                unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
+
+                hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index 788de20ab5d3..0b636b713593 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    dma::DmaMask,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -16,6 +19,9 @@
 pub(crate) trait GpuHal {
     /// Waits for GFW_BOOT completion if required by this hardware family.
     fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
+
+    /// Returns the DMA mask for the current architecture.
+    fn dma_mask(&self) -> DmaMask;
 }
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
index 1ed5bccdda1d..41fbabb04ff8 100644
--- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    dma::DmaMask,
+    prelude::*, //
+};
 
 use crate::driver::Bar0;
 
@@ -12,6 +15,10 @@ impl GpuHal for Gh100 {
     fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
         Ok(())
     }
+
+    fn dma_mask(&self) -> DmaMask {
+        DmaMask::new::<52>()
+    }
 }
 
 const GH100: Gh100 = Gh100;
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
index 08dd4434bd72..2881ab03dbcd 100644
--- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -19,6 +19,7 @@
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
 use kernel::{
+    dma::DmaMask,
     io::{
         poll::read_poll_timeout,
         Io, //
@@ -80,6 +81,10 @@ fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
         )
         .map(|_| ())
     }
+
+    fn dma_mask(&self) -> DmaMask {
+        DmaMask::new::<47>()
+    }
 }
 
 const TU102: Tu102 = Tu102;
-- 
2.54.0

