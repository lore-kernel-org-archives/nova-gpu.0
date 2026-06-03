Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC81C5F27
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530646; cv=fail; b=mH/oNqpTzrzDf+o/c0mKSHXUbs+zPoHER5QmcYV3IzSEW76EXDe9kpEGe/V+/okqPRbMekPfJ76XahnKyR+q2/meN2mhb3/oKodwhNzCtonmSAStltDyVeKfYD6VC6/GTwlg3ED+U968RpuaRkCpy+tfz69T3w8mXE1oTEyDavE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530646; c=relaxed/simple;
	bh=gX4kl3wv7ARiIttH7sP88DF3BwB/qMKml70vmKYZOtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=goG4W1BuZrMZqg72InxNuv32ylxz3BttBcLTMiR7gQjRo6kgj3H+rTay/47JZcuLw6lTtzdYYjQbZFpWbEWHEJTDhLfyQ7yY6lJ1v/X+KOgr5paKYKf+DyHBGTnpLmrH0LtXI6LO8n3Rcw9suxGCLbPaF6dP81oOAfN3oD5go+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iqWrDn+H; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iqWrDn+H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7i0hi9g20uZj0JXmusZul5qSpBSfqfM4fU4EHyGUgCsMhiEISuEt8x4QXP8uyan3lEXYV7Re0efSyazMpMUOwVswfVx8iNRVic8Wf/cbUJRxW8ywEaT8DwpsC+ZwMrSi3ZkK/LnndQ6YjJ+PWPdkUq5Rv4veIG131movv1/039HMEDprc0LrPDT89k8myJQn2pPfUG6zf3VWVdTGms562hrTC2MKnoAOmxQfqKVdaIl6HaetF3rPLzczfMNjXkkgHCi/REU3oxQoT/MTtRmFAsqx49bhaWhutmhlAfHRK8oXl+WEvTv0DnS4yGOSzD3Of6IY+9Vm+qTNKpFwqI6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpShhzjyjW0wT7ha15QiuMmz4kDSNK8V46cDGcdi8io=;
 b=JithnpIWA0WnL84DETv5l+JzQSmAaOLOT6Df/LWiqX0R3z2FNgXJdAAe0Bwi0Ccl0BXV8X9Bug4HSK00uDCMW34jRnofolaEQ888Bv406l7UXu1Qwdqxlv8xQ9shHfOvWM1+LBdaXbTu+qsHAzgfpNN1jsWOjq8ghOZAoIdKYDsZKe7oAMFZMYRyGt5V5Z80EZm4AFBwVavH1QufJcypToAiKioPmgBEwxiPr5Egdd9iWExZjlPCZGNqT2gHxK1LeTIj3TFzFd/hNIC7vRSK/duuZS0f0bpxzu2rn3mjrnmfUNzI15l7eCJcJEQXLJT3jITV54pG6pw9m4Y0IPoxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpShhzjyjW0wT7ha15QiuMmz4kDSNK8V46cDGcdi8io=;
 b=iqWrDn+HF2+D6wpvJwLCJfCF0VgYHB8tV+NiFsIxkhjJaFKthIgECEL8NakBWwg/vmc7srnDVOiF6D3bT5ZDumkkyB//njqFEUABDaDj9+m++ZcEL54+w07tJ5ZHV1TApponhXdk9ZE7J+49cET6jhUzE/4gfYkTvFQIZEKxdlCFfYvJq+eu7iI/POzEhZNQ0BLtONdcX2tXh+4Ek4SwE8rkAw3mkw/Bu+Yw2RFkcWn3XQIwA+e/5NYanRMy9bjIjCdLwsZydC64WIqHpRHo3TOW+0slqHIRMR1SiOSxcrVR68fyc2UVB6HJUmHw6dDf2u3TPTaUP3IPRr3h0nGzmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 23:50:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 23:50:37 +0000
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
Subject: [PATCH 1/2] gpu: nova-core: Hopper: use correct sysmem flush registers
Date: Wed,  3 Jun 2026 16:50:33 -0700
Message-ID: <20260603235034.131354-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603235034.131354-1-jhubbard@nvidia.com>
References: <20260603235034.131354-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: a859dca6-bb18-4c68-012d-08dec1cae918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	E2TZaQxlMg7lV/DmGxY+g9bXz8CS77OTgx5Kw6GgYN50Z4tFT/aTpaf6fPsI5YxfdfduMDGwzMH7YdVtQQ2rdef89mrQklgY/XdrUPwODvxsiY74ypxszBisMmRICo7bTtPKQeX/7WoGqHvzz1667vAt0IEAOoKU5ujGPa22DzzHc4c20wOdb6PXgiwW0/0BB/QlxH3X/EaF83bauFZ1xlBPY50l06IvRagJ5qw2jpMoF3rvUypctrAHvqlbJ5r3zOGye0tALyp86Yh+f5vL5PZ8v8iaeoviDMrrpqwmtDFcX29EXZwghO09c9LgI/rSbMzSx6/YkP6ZUylsooL2yv1HsyYJ2HxMKbDPTYZ1Pal4M2D6Rr5b+EoO6OrpVQRY3SEuPECyQMV0OhWKsUTpIcuUM7ST3i5227+3RPKb5EZvTtYHZ5wcd6rGc7Z0TS1FT2E11AbuFIchNeGYTJc3fr3U4bb1odJGHeMstP6DVvvVKX09lBrTS5AFStP/WGKhMjIZHOpdEm0r5adeSewj9uWkqgOrNOG1pq4c+9wFGNd6oNqesnqc4IkTbNzqzO1pr/q/kolLVzr9PwAJ0qWkseYxKIys0nAmL6Lec+N7v/J2o9GmduByATaKRakOXCNHl36v7Yis3yKIbhW2Sv+ga+PfuYeiZUmU1Xi5Gyg/9zZiGAR4+ErpOh80gq+goqki
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FIXSyHcx5aB7lJJ2tycCtDxKKbKxV9qjKx2hgMm+ASLGsSBNJMyWl6LW1gTL?=
 =?us-ascii?Q?u4Bfw9jH2673lLTT77TW49QZzI9VPhqPL5j/UsNTSqLxU0n3b8eiOeCY4yuM?=
 =?us-ascii?Q?C2KQQUI/Qm+H21+8GlGouou+IXztCFu5/G8TRVwK8ReD1ncNybieiJbpCFai?=
 =?us-ascii?Q?rM0I9HL+cT/GI3D6wh1K5uQR5KSljBDf0wqiZo+0Ib9ckHF+EJED6iUUT54O?=
 =?us-ascii?Q?fh9U7GpLWfFQsymLTJJ+0l12Yh6RDica4E2isZS+haQgs+3j7vq/a8XDZuuq?=
 =?us-ascii?Q?sSCOX4cs4gT/kZs/fZCfsO1sd4ycwEIxubxYpTHv+UG1rSkbPuE48Jrqj+d3?=
 =?us-ascii?Q?INuKdNJNLnNW0PiNPmO3CgkhId5F7qmFalenigHalT4xYFsind6fsJmoxnfC?=
 =?us-ascii?Q?vhzuH4OooHs9X2sO4n9VQ0q1mqkREYQQNnFTw69r6VF2RlHi0vYXYE4lx5er?=
 =?us-ascii?Q?cfAEe9tMXNYOv9DujwAQmQhap6/pJh8xmUNzZPmFm0ycLp+0BpI6+95vzHWx?=
 =?us-ascii?Q?tBoFbfS9DXNG5IVHs4Z5VMMVp7z5wWu6q25NJ3zbWLPod1htMwdpfONl0YJq?=
 =?us-ascii?Q?JJIhaZKZnnAB0q9xApFZpsP63nXFywwyk4cgyZ87gUjZFBHDEgOn5UjE2crc?=
 =?us-ascii?Q?SZHLlpfHTxqToqIWjRd6kWUTFJuBtflslJQDFvi1pK3e08rM6xlq5Y5cxEc0?=
 =?us-ascii?Q?1B6mP7lwbYV1SORJ/gwacW8/ZTNGMDnJvYwfEcs6axx6IvZZ7K6GvOrZk8fq?=
 =?us-ascii?Q?S6Tr7mhjPb7Pl5xdfKhPwndhIkF9RQP++3qVVKL8Df/KBrqPlnLXqoynO4nX?=
 =?us-ascii?Q?VqVw/DtuRJydoKI+9OFHHdw7BIzeMOsixoA3YTsbtLpKLYIV0LJw55S7sgb5?=
 =?us-ascii?Q?SBpd0wjVxBsCJA6GfKFLVF76V/j5LWjR5MRp5/jPvfWheNu9IKHfXawDySju?=
 =?us-ascii?Q?j/xxt1bLXyw6unj49CesRaAeSNWsrx4QOrW8Tkc80Crg5ZD13CZkTcjUvKa5?=
 =?us-ascii?Q?IOnmaChSleJbNo59d2/KLffeGtSywh9n/vMmhJze7loWZ1e3cHPKvjl0PLRR?=
 =?us-ascii?Q?Ei+h6LjUvSyY1zPkXmv4RCy6uMMaTRPUNrVxsNcvGns8K67FY58VpF1xBAsV?=
 =?us-ascii?Q?OY2VGZjze89t5uQiEPnC9mSFeFikOogdSBYpv1aP9pD81aSptcmtfTNBA2m9?=
 =?us-ascii?Q?DvypH5DfHPddyIEW3scjFYuOToa8MayuJh2cARDOTYmg6OR6921tqjIandHm?=
 =?us-ascii?Q?y/8R6NebVazIVsgM1fiJ0S4k+ZSdSwraDnsPmnYFxVP8yUo/tg3oF8j3tXSg?=
 =?us-ascii?Q?6mE72lv1myTSTmQzWNp3iH2tD4DHXQM/HCJ3MoA6wtgTEEPKz2vWoc9My6xC?=
 =?us-ascii?Q?AAx1WEoySmy7QHXxx8GW8Ecldo68ezcxSTYN9RWbq+8bOxlS04qHiv+Xtmtl?=
 =?us-ascii?Q?FfnrjLAZq7iDuRQeKkpb1QpU0NKrKs/yep91xA5sT3XTYLjFQgN8bjfB5Gty?=
 =?us-ascii?Q?IeNgsgI+23C5AAAFPpHSaXjKErpyPLLylsFzP2vBPLu8V5Nrqo/HjdFEa1FF?=
 =?us-ascii?Q?VoixB2y8XYp3bKh4AsUetf32PV8JJLeKD+upd6eA2elWpQDHZXcQgwc+qSnX?=
 =?us-ascii?Q?Ig8LHzWKvPXskvCjtx0RWJZQJzPofM+3uycy2yHTvu2bG5WUTnKQ/Z4QAD8G?=
 =?us-ascii?Q?MHbhrUvOGncnOCjaYaQvmYAczcUvGpoqsSIfX5aXNg+Bv8Kouvqtna3Uf/nT?=
 =?us-ascii?Q?0i4KkH5q2w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a859dca6-bb18-4c68-012d-08dec1cae918
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 23:50:37.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0wxNqzabt+4IWuBcIXHQ8aZj39w4z3PM/TIBRzBdFEDrX6vNLA7SmIRtC1HtLsBDumUto8TNenZXHcGaVmjwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

Hopper has its own sysmem flush page registers, but the Hopper
framebuffer HAL was still programming the Ampere registers, so the
flush address landed in the wrong location. Program Hopper's own
registers instead.

Open RM and Nouveau disagree on how these registers encode the
address. This commit follows Open RM's approach.

Note that this is still yet to be confirmed (tested) on real Hopper
hardware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 12 +++++------
 drivers/gpu/nova-core/fb/hal/gh100.rs | 31 ++++++++++++++++++++++++---
 drivers/gpu/nova-core/regs.rs         | 27 ++++++++++++++++++-----
 3 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 038d1278c634..00554e349bde 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -30,11 +30,11 @@ impl RegisterBase<regs::Fbhub0Base> for Gb202 {
 
 fn read_sysmem_flush_page_gb202(bar: Bar0<'_>) -> u64 {
     let lo = u64::from(
-        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>())
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>())
             .adr(),
     );
     let hi = u64::from(
-        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>())
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>())
             .adr(),
     );
 
@@ -45,14 +45,14 @@ fn read_sysmem_flush_page_gb202(bar: Bar0<'_>) -> u64 {
 fn write_sysmem_flush_page_gb202(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
     // Write HI first. The hardware will trigger the flush on the LO write.
     bar.write(
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>(),
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>(),
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
             .with_adr(addr.shr::<32, 20>().cast::<u32>()),
     );
     bar.write(
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>(),
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>(),
         // CAST: lower 32 bits. Hardware ignores bits 7:0.
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
     );
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
index 5450c7254dad..6fd4f967cea5 100644
--- a/drivers/gpu/nova-core/fb/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -2,24 +2,49 @@
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
+    io::Io,
+    num::Bounded,
     prelude::*,
     sizes::SizeConstants, //
 };
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gh100;
 
+fn read_sysmem_flush_page_gh100(bar: Bar0<'_>) -> u64 {
+    let lo = u64::from(bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO).adr());
+    let hi = u64::from(bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI).adr());
+
+    lo | (hi << 32)
+}
+
+/// Write the sysmem flush page address through the Hopper FBHUB registers.
+fn write_sysmem_flush_page_gh100(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    bar.write_reg(
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
+    );
+    bar.write_reg(
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
+    );
+}
+
 impl FbHal for Gh100 {
     fn read_sysmem_flush_page(&self, bar: Bar0<'_>) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gh100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: Bar0<'_>, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr = Bounded::<u64, 52>::try_new(addr).ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gh100(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0f49c1ab83ad..a57e95140ec0 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -131,6 +131,22 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         23:0    adr_63_40;
     }
 
+    /// Low bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
+    ///
+    /// Unlike the Ampere `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` registers, which encode the address with
+    /// an 8-bit right-shift, the Hopper FBHUB registers take the raw address split into lower and
+    /// upper halves. Hardware ignores bits 7:0 of the LO register.
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00100a34 {
+        31:0    adr => u32;
+    }
+
+    /// High bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
+    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00100a38 {
+        19:0    adr;
+    }
+
     pub(crate) NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE(u32) @ 0x00100ce0 {
         30:30   ecc_mode_enabled => bool;
         9:4     lower_mag;
@@ -179,15 +195,16 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         19:0    adr;
     }
 
-    // GB20x sysmem flush registers, relative to the FBHUB0 base. Unlike the older
-    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an 8-bit
-    // right-shift, these take the raw address split into lower and upper halves. Hardware
+    // GB20x sysmem flush registers, relative to the FBHUB0 base. Like the Hopper
+    // NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR registers, and unlike the older
+    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers (which encode the address with an 8-bit
+    // right-shift), these take the raw address split into lower and upper halves. Hardware
     // ignores bits 7:0 of the LO register.
-    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
         31:0    adr => u32;
     }
 
-    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
         19:0    adr;
     }
 }
-- 
2.54.0

