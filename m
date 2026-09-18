Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1237E5F7
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693746; cv=fail; b=s3q2oIALscglqAOVaH+7VltB9FPOXgRQyFeEA5qsuok7ftNNAHkyBUWyv1SmFLQGFDrk0zLauzAAs6yh7WDQhizR65Dv9GqkUX1LE0xxXaO5ElUlKU1LdpGUevk4e4DCBADm/Wb2nUstuDidoFMofXxd4egJtOu96IEYXDCVyAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693746; c=relaxed/simple;
	bh=tMtaD5DtU0GC3aOGAJsX3r5vMD1DWFBj7lT5DbR8cSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzb7y2lxCIGVlould3pOIb9+CMmtZJhc7V5gqW3uPjKOjbKrbtnn+LJ/neq2DTprO0oRJvniQu2Yx+5jOIw0LVdILm60l/mGOKPDIZUErLSuZCiTgUYfyhCsuUBQO9vbknOQu2HPHvu4O70IsIuTj4V75+7iazpN4WKM1IVifCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=srjW6/Ru; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="srjW6/Ru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpc7YSFyu3yH8MMW+1ZwjHuiW1DArYDpGCVIgAflxSCiJHPeY0EY8FV2s7wPFglqJPS7fiHtDzCo2cgPlCajs54Oj8aKa5tDKiS8Mo6higxQ6Nmb1VrNxk4QTXXBKWNg2VqHo3bIcNbmIZ67IBC++0ZWyVXEUaoag6khFaV3P8usOJf3F1lQ3BLOmPmhyLPYQtjRZFfomyeJUXRJjWgE7sozmN4Cuuu3Hb9rDl12AxQB6QMLPbMQJsI2DMyULWXFwg+gZ1Ffe3EIvNVQD9benOU0v2eAH2rvIQFJVFtdmizX81Eu/Cu6s7iv4KmsJ8e3AL2QnjSIJ1lgXUACmnSonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ro+iUq0dtQAKjU3Iij+dXMIe+2rgMdYBdzzfBVUIpc=;
 b=fDz3CK3cBuy77L8V3nQ42nprD9G7LmWH2kQwkhLLm7O8VywEFR2xJzilAbqSzIyd6/BWwFt2tF7ck0iT8XFJEopIGn3WSvQFhSF8M6XWO507VLofoSAK2oeHLoGekBC9Xwx9YRCKUNTKXAodbIW0HaE3+6zzUQ5xfvh5bQo8k13Mg9GgzFtlxrj9EA+STsOLdQBddQ0qrhOYf4/6OTcbcgYc+zPJN8sxb68pOxFQXKN8GhlKcMTS/HZICPqGT2kKp5tMMZL++JEkKgFO8VX2adMsf7GkAoYn60EBiayvQ+co4KLpopIzpzZVRD9aMXGz78e2dMgFvz2LsuCcV1ShUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ro+iUq0dtQAKjU3Iij+dXMIe+2rgMdYBdzzfBVUIpc=;
 b=srjW6/RuFz9zpsluDwniGRtVTEhsB3vpEhjYJmqAesW6zyIuMjWQpAYSWB+nsFi7idoJ8V1Xb9vsgZ+GZNb/TtdvDQ2BpSLMWSAFcfFYXVo5Mk5pZOpyvDLM6Liv8oCKbqYLH6RF3I7d0IvpnBLwbEJL1RGG+lSqTtcpTWnXxo1QCD70mtwJ8rB9riRqLD7bSyvTxvzpvI168BlfqPZ3Ou0hTxCggAWfqg8nL+7lXp214zHg5ESTxD/pZKzg++Luuimu4CFE4lKfvrSUjBtNCnRAp9iRqnvPBOBovrDrt3nHd0/0x3EGZMQp1l9vpHJD0hYcV2djMQQr6tlgOMLYTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:30 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
Subject: [PATCH v3 28/33] gpu: nova-core: gsp: make the GSP_INIT reply the static configuration
Date: Thu, 17 Sep 2026 18:07:14 -0700
Message-ID: <20260918010719.1176945-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c759c8a-4670-47f5-559f-08df152147b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	B9ui5PRlUzQL5gN6Mvq/qbMFZx83NRTLhq61AFd7mjggHwXIs/SopnF+L5ms0LYPGHqeQblinB41KsNzYX0etS80Zgfte01iJ38Og1j6nLqmgw7H1mgbKH8lUTDuE0zj4hT7EhjwdiLEYVChTuruAVgF0057NX/bFco4XYwZmIf4vh0WVEo6qyoCHEvYkr+ZQhfsHaObZ8HbBWxg64xSKEKH1opHIlu6AdSeMejwf7ZG4N6KRYJurEUshtbJgFkZZym42duxcq9iysjUIWyOQVDj3RZB+A0H+Luedbl75RSyvtbn55BKjdDy2txe9JDvUByuVhmyRAnfoid1FllB+0hbrPiY+e/SFLp3CHARvgPT90TlajobfUOTM0FjrP2OAUeh6vwFtzYcZN/JDFDjJcFR+otCFny5jQ7JmVqj3NMzCd7aFiKh2Fi/DrUWyeJrcU5+QnxP/RxPF+TSpEmBss/nQ2eerS74t1KIk1dM/Op5zySERHZ05Q26dG0WSXYe5BdZF0RC0oJXAjorx/feyzHSNlBNeT8J0C+8JTasRqHk8CHCZOFUawjQqVFAVLeZkTzqkhHJjomGKZRf23piBlfFmabShQYj0PE5hK2fF2rShUftU7R25cydnuUXnlHjnqb6q+E5xngSmcd8+v9fpPWHCD7THu92wvPtWrhuW/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HTc6+wn7Xza44eddPiWmLAP8rDYyiF8sQCit2rubShwLlmWTfbF3Z/0ma7Ne?=
 =?us-ascii?Q?wnCzhz2eJqKfkddgfRRLfeWczDh7ts/hqtNoaP79mTf3SgnmqumRS5krzYxD?=
 =?us-ascii?Q?47dWSeb6k3tJAKzAX6Pal1OG0o8Tw1iJ8+3z+pzJm3hq6YApJWL9L4eZBw4x?=
 =?us-ascii?Q?tzLw0WqyRKSACRWKMwEiar33fy8tWzyYbcA0Dw+tLNYOfjqhruuS1N5gxuD2?=
 =?us-ascii?Q?9L6u3iWSirw1Gr7exOPWX26AoJlIMtBpaQeSbuxN/KG99+ukoFnVbtxsa0yY?=
 =?us-ascii?Q?KYA8nlW2X6ev4Ew7m2s71H0sBk9sRwvsACx+M+nm5DguxhNUVxOWMBZxV9Np?=
 =?us-ascii?Q?9qYDkpTjBFk/VWYsyQfOycwmEnDoM55sVFMDihNS8kKN5kJJgyB65rZ3jXel?=
 =?us-ascii?Q?vX/wMtOMM/ucCwAPTQCBacVtMIGFtO5SlEFTpOKADTtiA69TLrtm6cbmXcP9?=
 =?us-ascii?Q?NFuBpR1/g4DIIWeQ6K1/Yt63AATwQinCVkMuvuoecdc0V+T6DkbeplyjFFNg?=
 =?us-ascii?Q?lAmFp3BdUoTWUJQG9Gu0HOTQr6EBS8QUPZTj4csGfLXrBtvIDU5RBA2VE5xr?=
 =?us-ascii?Q?T+MANhIwIP06jxyxOr0cZ+qOzrCM8zJIqBxOsfWgftawF/hikDKv/iIoYyEn?=
 =?us-ascii?Q?6jNkju22Y+HgUz+niHMsGnDlejfha6+K8R4RLKipV9h0aGUD1dXRD4UWXhFA?=
 =?us-ascii?Q?KshSQieC0WzpEZdFhzwC/ymwIYUW0e1y3dKmzk7ftV5TOcYAYNyl1wJZgSJW?=
 =?us-ascii?Q?u5JaSsTeH6TPATtBbbX9kbV1z+Gr/llMM9jYnwdOa7lwZ/Szwthz24EuHzMd?=
 =?us-ascii?Q?1W83vSLORhuCbUIUjNYMzn1+ZUr7wugeiHeeu1ugVDP6g0YVFOSzi9kMIb3C?=
 =?us-ascii?Q?wnun96F7Lhy0jX5rfR7Wp7SDHVVQceHKSyyr8AHU6N0yDvpNjU91SlRRxQIu?=
 =?us-ascii?Q?N7t7lrnnNhRckMIYeSyKQ2RqvVg+mhZKc4xAawaM2vhwhv4DogxhMLxYv8+Y?=
 =?us-ascii?Q?Og4YhoBxSNjTBz7DysUaI/ZG9ALcj18+rzQwp3wVDxscU7e74rIaDG6N/xV3?=
 =?us-ascii?Q?ARKuB1nXp8dq0x3Zz/awmH/Hkm8F4EFhiPoI47qedHWR+Bbt6Otln4YWezyY?=
 =?us-ascii?Q?xvVRNLkpHrgpk5b2XzjXN9/SOz28XKVq/vrPlLJrDrpnJsFw0m0ToZP6dTlF?=
 =?us-ascii?Q?PybEq+8NoOPmLhM0G2slFO6knqrD0pn8W0LO1dzrm8p+wG5dycaj1Qe0o55M?=
 =?us-ascii?Q?Eflmx+sxk9UNbojcRcucohpig+M5+PZtPB3VXwTtaIVIzhV1teo8xs9LZOBm?=
 =?us-ascii?Q?r6ndgYcw/OGsb7LmechyEDYemoQp3a1MB8sG1Q/Smh0kCsIaQPcRIAk/Uj/+?=
 =?us-ascii?Q?IP9/9JidaRrz20UKW4pJYx9yNBbk5g1K6Pj9twJ4QzajpZpdqGQH6/qnVfUq?=
 =?us-ascii?Q?lo+hn4W3dKj4Xaoxx4oRGvz5P2Y2zsicRTsujfuclFPXjC4/b64iM+PbYpzz?=
 =?us-ascii?Q?9TPTAW4UPZS9Vs9zHKUA8rlGrFRoh/YdDlFZCM+S1UkRXbbtjVyhVgrBaMrL?=
 =?us-ascii?Q?21VMskggNK9dh1JvHKRl4+E8ZDE6Xo2sS60EtyY8CFdBWVehBf8bgC/zZlzU?=
 =?us-ascii?Q?4QEiCfyQP4xabmwFBKfU9amLF1i17TrNTQA1qZuSK1Yi5PQrW8rZFrXmJpI1?=
 =?us-ascii?Q?ksTjB4HlvEdfeZvBTxGfx4VSMSldM19PNbYIlHDkTiPYeVKn4l8DIBNuRoMf?=
 =?us-ascii?Q?KkZkmbQLqg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c759c8a-4670-47f5-559f-08df152147b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:59.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mQnGAQPzM9z16OIsmtzuRB87bkhBfD0s6i1vuglYFi6EaVQE9F/zSbJ/2Di4bYd6QNEKV6JTU74gvoEeCOrXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The boot sequence returns the static GPU configuration, the GPU's name,
its usable framebuffer regions and its BAR1 page directory base, to the
rest of the driver. On r000 that configuration is the decoded GSP_INIT
reply.

The configuration type came from the r570 boot protocol, where the
reader of the r570 static-info reply filled it from a C struct. The
GSP_INIT decoder filled the same type by copying the name and the
usable regions out of the decoded reply. The decoder failed the boot
with EINVAL when the reply reported no framebuffer region. With the
r570 reader gone, that copy was the type's only purpose.

Make the decoded reply the static configuration type, and read the
configuration through its accessors. The accessor for the usable
regions yields an iterator, so the regions are no longer copied into a
vector. A reply that reports no framebuffer region now fails with
ENODEV when the driver creates its memory manager.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             | 16 +++---
 drivers/gpu/nova-core/gsp/commands.rs    | 70 ++----------------------
 drivers/gpu/nova-core/gsp/fw/commands.rs | 41 +++++++++++---
 drivers/gpu/nova-core/mm.rs              |  4 +-
 4 files changed, 48 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0ed0f4722dc5..fd1a74913d7c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -465,16 +465,16 @@ pub(crate) fn new<'a>(
                     Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
                 }
 
-                if !info.usable_fb_regions.is_empty() {
+                if info.usable_fb_regions().next().is_some() {
                     dev_dbg!(dev, "Usable FB regions:\n");
-                    for region in &info.usable_fb_regions {
+                    for region in info.usable_fb_regions() {
                         dev_dbg!(dev, "  - {:#x?}\n", region);
                     }
 
                     dev_dbg!(
                         dev,
                         "Total usable VRAM: {} MiB\n",
-                        info.usable_fb_regions.iter().fold(0u64, |res, region| res
+                        info.usable_fb_regions().fold(0u64, |res, region| res
                             .saturating_add(region.end - region.start))
                             / u64::SZ_1M
                     );
@@ -484,7 +484,7 @@ pub(crate) fn new<'a>(
             // Create GPU memory manager owning memory management resources.
             mm: {
                 let info = gsp_resources.static_info();
-                let usable_vram = info.usable_fb_regions.first().ok_or(ENODEV)?;
+                let usable_vram = info.usable_fb_regions().next().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
                     base_offset: usable_vram.start,
                     size: usable_vram.end - usable_vram.start,
@@ -495,13 +495,13 @@ pub(crate) fn new<'a>(
                     bar,
                     gsp_resources.spec.chipset,
                     buddy_params,
-                    VramAddress::from_raw(info.total_fb_end),
+                    VramAddress::from_raw(info.total_fb_end().ok_or(ENODEV)?),
                 )?
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
             bar_user: {
-                let pdb_addr = VramAddress::from_raw(gsp_resources.static_info().bar1_pde_base);
+                let pdb_addr = VramAddress::from_raw(gsp_resources.static_info().bar1_pde_base());
                 let bar1_idx = crate::driver::bar1_resource_index(pdev)?;
                 let bar1_size = pdev.resource_len(bar1_idx)?;
                 Arc::pin_init(
@@ -527,9 +527,9 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
         if let Err(err) = crate::mm::selftest::run(
             dev,
             this.mm,
-            &info.usable_fb_regions,
+            info.usable_fb_regions(),
             this.bar_user,
-            info.bar1_pde_base,
+            info.bar1_pde_base(),
             this.spec.chipset,
         ) {
             dev_err!(dev, "self-tests failed: {:?}\n", err);
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 24f80c449c13..128d6f8dcb43 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -1,12 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-use core::{
-    ffi::FromBytesUntilNulError,
-    ops::Range,
-    str::Utf8Error, //
-};
-
 use kernel::{
     device,
     pci,
@@ -22,7 +16,6 @@
             self,
             commands::{
                 GspInitRequest,
-                GspInitResponse,
                 GspInitResponseSchema, //
             },
             GspGmcMsgElement,
@@ -41,40 +34,7 @@
     vgpu::VgpuState, //
 };
 
-/// The static GPU configuration, as decoded from the `GSP_INIT` reply.
-pub(crate) struct GspStaticInfo {
-    gpu_name: [u8; 64],
-    /// BAR1 Page Directory Entry base address.
-    pub(crate) bar1_pde_base: u64,
-    /// Usable FB (VRAM) regions for driver memory allocation.
-    pub(crate) usable_fb_regions: KVec<Range<u64>>,
-    /// Exclusive end of the FB physical address space.
-    pub(crate) total_fb_end: u64,
-}
-
-/// Error type for [`GspStaticInfo::gpu_name`].
-#[derive(Debug)]
-pub(crate) enum GpuNameError {
-    /// The GPU name string does not contain a null terminator.
-    NoNullTerminator(FromBytesUntilNulError),
-
-    /// The GPU name string contains invalid UTF-8.
-    #[expect(dead_code)]
-    InvalidUtf8(Utf8Error),
-}
-
-impl GspStaticInfo {
-    /// Returns the name of the GPU as a string.
-    ///
-    /// Returns an error if the string given by the GSP does not contain a null terminator or
-    /// contains invalid UTF-8.
-    pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
-        CStr::from_bytes_until_nul(&self.gpu_name)
-            .map_err(GpuNameError::NoNullTerminator)?
-            .to_str()
-            .map_err(GpuNameError::InvalidUtf8)
-    }
-}
+pub(crate) use fw::commands::GspStaticInfo;
 
 /// Builds the NVKV-encoded payload of a `GSP_INIT` request for `pdev`.
 ///
@@ -128,13 +88,12 @@ pub(crate) fn gsp_init(
     )
 }
 
-/// Decodes the `GSP_INIT` reply from its payload, which the ring may have split in two, into the
-/// static configuration type that the boot sequence returns.
+/// Decodes the `GSP_INIT` reply from its payload, which the ring may have split in two.
 ///
 /// # Errors
 ///
-/// - `EINVAL` if the payload is not a whole number of NVKV words, if the stream is malformed or
-///   omits a required key, or if GSP-RM reported no framebuffer region.
+/// - `EINVAL` if the payload is not a whole number of NVKV words, or if the stream is malformed
+///   or omits a required key.
 /// - `ENOMEM` if the words or the decoded regions cannot be allocated.
 fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStaticInfo> {
     const WORD_SIZE: usize = size_of::<u64>();
@@ -154,26 +113,9 @@ fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStatic
 
     let decoder = Decoder::new(&words, UnknownKeyPolicy::Ignore);
     let mut schema = GspInitResponseSchema::default();
-    let decoded = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
-
-    let mut gpu_name = [0u8; GspInitResponse::MAX_GPU_NAME_LEN];
-    let name = decoded.gpu_name();
-    gpu_name
-        .get_mut(..name.len())
-        .ok_or(EINVAL)?
-        .copy_from_slice(name);
-
-    let mut usable_fb_regions = KVec::new();
-    for region in decoded.usable_fb_regions() {
-        usable_fb_regions.push(region, GFP_KERNEL)?;
-    }
+    let info = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
 
-    Ok(GspStaticInfo {
-        gpu_name,
-        bar1_pde_base: decoded.bar1_pde_base(),
-        usable_fb_regions,
-        total_fb_end: decoded.total_fb_end().ok_or(EINVAL)?,
-    })
+    Ok(KBox::into_inner(info))
 }
 
 pub(crate) use fw::commands::PowerStateLevel;
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 9792cea36770..60edbb12627f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-use core::ops::Range;
+use core::{
+    ffi::FromBytesUntilNulError,
+    ops::Range,
+    str::Utf8Error, //
+};
 
 use kernel::{
     alloc::ArrayVec,
@@ -288,9 +292,9 @@ pub(crate) fn new(
 // Should decode with UnknownKeyPolicy::Ignore.
 nvkv_decode! {
     /// Schema for the `GSP_INIT` response.
-    pub(crate) struct GspInitResponseSchema => GspInitResponse {
+    pub(crate) struct GspInitResponseSchema => GspStaticInfo {
         gpu_name:
-            Array<u8, { GspInitResponse::MAX_GPU_NAME_LEN }, { Self::GPU_NAME_STRING_KEY }>,
+            Array<u8, { GspStaticInfo::MAX_GPU_NAME_LEN }, { Self::GPU_NAME_STRING_KEY }>,
         fb_regions: Accumulated<FbRegionSchema>,
         bar1_pde_base: Required<u64, { Self::BAR1_PDE_BASE_KEY }>,
         vmmu_segment_size: Key<u64, { Self::VMMU_SEGMENT_SIZE_KEY }>,
@@ -304,8 +308,8 @@ impl GspInitResponseSchema {
     const VMMU_SEGMENT_SIZE_KEY: KeyId = 0x1050;
 }
 
-/// Payload of the `GSP_INIT` response.
-pub(crate) struct GspInitResponse {
+/// The static GPU configuration, as decoded from the `GSP_INIT` reply.
+pub(crate) struct GspStaticInfo {
     gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
@@ -313,16 +317,35 @@ pub(crate) struct GspInitResponse {
     vmmu_segment_size: u64,
 }
 
-impl GspInitResponse {
+/// Error type for [`GspStaticInfo::gpu_name`].
+#[derive(Debug)]
+pub(crate) enum GpuNameError {
+    /// The GPU name string does not contain a NUL terminator.
+    NoNullTerminator(FromBytesUntilNulError),
+
+    /// The GPU name string contains invalid UTF-8.
+    #[expect(dead_code)]
+    InvalidUtf8(Utf8Error),
+}
+
+impl GspStaticInfo {
     pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
 
     /// Tag of a general-purpose region. Any other tag marks a region that GSP-RM reserves for the
     /// use that the tag names.
     const FB_REGION_TAG_NONE: u32 = 0;
 
-    /// Returns the GPU name, which GSP-RM sends with its NUL terminator.
-    pub(crate) fn gpu_name(&self) -> &[u8] {
-        self.gpu_name.as_slice()
+    /// Returns the name of the GPU as a string.
+    ///
+    /// # Errors
+    ///
+    /// - [`GpuNameError::NoNullTerminator`] if the name that GSP-RM sent has no NUL terminator.
+    /// - [`GpuNameError::InvalidUtf8`] if the name is not valid UTF-8.
+    pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
+        CStr::from_bytes_until_nul(self.gpu_name.as_slice())
+            .map_err(GpuNameError::NoNullTerminator)?
+            .to_str()
+            .map_err(GpuNameError::InvalidUtf8)
     }
 
     /// Returns an iterator over the FB regions from which the driver may allocate: the
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a5bc4042577b..ea85c821f0e2 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -308,7 +308,7 @@ pub(crate) mod selftest {
     pub(crate) fn run(
         dev: &device::Device<device::Bound>,
         mm: &mut GpuMm<'_>,
-        usable_fb_regions: &[Range<u64>],
+        mut usable_fb_regions: impl Iterator<Item = Range<u64>>,
         bar_user: &Arc<bar_user::BarUser<'_>>,
         bar1_pdb: u64,
         chipset: Chipset,
@@ -316,7 +316,7 @@ pub(crate) fn run(
         // VRAM span the self-tests are free to overwrite, from the chosen test base.
         const SELFTEST_SPAN: u64 = u64::SZ_64M;
 
-        let base = usable_fb_regions.iter().find_map(|region| {
+        let base = usable_fb_regions.find_map(|region| {
             // Tests rely on this being 8 byte aligned for checking misalignment handling.
             let base = region.start.align_up(Alignment::new::<8>())?;
             (base.checked_add(SELFTEST_SPAN)? <= region.end).then_some(base)
-- 
2.55.0

