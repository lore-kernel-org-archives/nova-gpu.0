Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93241B4F1F
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370495; cv=fail; b=kOlXKK+A7cCxoFHlQ8BH9v85rBjG0o4hEg6yizU/nrJJMlqkgh9VNF7TFrNAifV5iF5j9uRG3i5jz8xV5Axqzr7vezKgSTZ0yvWFfTo2YwA1REKS45rXbbyiKC/t+lBFUlPXCAedWNP3yNtl+lxuIMczL9ODtWUPiUO36eMw724=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370495; c=relaxed/simple;
	bh=sL9Njh+ldn11mxMU0OckIpv11QUAwYrfMxNlUZLZPeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyBUT1qdlgN2+4l6Sgvp+fP+X05M87qjpJ4COS4rVEbQGN2iXe+vwCuoSXJUiOmJUsRHYlmljiF7TcLk5w99maNMCec7tnEMA8KSHJ4rx7UEkC3jyShDyLYdc2PSmBnQDB/OkHI+gWr6oL0Rrex4qpXf/9YNTWzxq9IUOmGBBaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tAIhHeVZ; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tAIhHeVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQITUkT3oozVZ5W9/iCBy4NRjINtNn+QWjGk0aqoBtv3UloMKvx7SN4BJmkQnI/5Qs59R/N/pA8OQOYPAPJoLHe6O6V6LqR/mfjCdpPqMBRYWSRBW3M9AZUK4M4v6YvE1fULOOc8DFqZZUU/wsBMkfNhoRkvsF8R5V2716z5FtTZHqPGm8uvWsBNPHo8FFgH23YKB+d/scABfGlCIKI8G5g6xNiXc5Lyp8ULx8G6kDTimCU+Z8Utw7NQBf6fl4Wd0a0kbgC/KLqLXIp0LuJ0yZUrXmMyWq+MzLOcnUxMD4htzCPYoJXfvPJH1QlzNhKmkDBNbLmOnQtjzwDKSKVEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+0t2+GBFGbYJyoLal0txPtaN+I3IDviwxGsScOW0s0=;
 b=qd6wRleBuwLBzuhRQhy+YyXmXQK8GsofHVtRbNCLAqJFVST0ToZubaS8a7Fl1556jXiBdGyTmArDU7ZEnqRlJ11IFI5MQab/rAFvJbjlNbEtnZC6IRVrKnuiST8/+rqGDrbK9gmg5VuLZAGxHSNSkPxuxYEkxw4TE8eWdAHUz1OQPHMmVTaWFZjQL9aQOKupIzPNqmOa0tKz8MC19TEFz6qHPx7J5JGeV18hWUdmV1O5R+92Zpn2xx7CGtheB9phxFWYfB0mQS38sfBsVd6aUvLrkeJfHfGCMoSqjI3qbk9IMgzi5JSSW4KEY60R5gtpB9kpNg53FBN2wTYbc4rvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+0t2+GBFGbYJyoLal0txPtaN+I3IDviwxGsScOW0s0=;
 b=tAIhHeVZzdAztO82OASi7ID+Q0sSUpniiVWYJcH+jgoIsqGl5Zd2hM+b+u54lHWX5nlOkwAfjz1PEXuc/5JVfBD3gYmvQCReWEw4Dvd7/lfi+52GyaoGE4FudoLcdviPsdJ1kdrFL3CoRyvFEDYW5UdbajjBIdaHi4Puivffq5kKVAtfzv7nMOskaTP/PiHAchkBYDY0v7ycdt6H9QF1K+NfsJrWtZcvdo5W+0FfykEsCLtHZ/YtGq8NVzSJDV8d7dSkaxYEAdv6NDxo25ioMdIQZr36fMLhlsjghaKsXktWaNaIhQkjV5t2IEVIyVovMYcJEO1LbTnyo2AjM6DkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:20 +0000
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
Subject: [PATCH v12 05/22] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Mon,  1 Jun 2026 20:20:53 -0700
Message-ID: <20260602032111.224790-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 32963b4f-9f26-4603-2851-08dec0560410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	IFWCx5H02byWgSwUNORE+urekzM/6mlbRamXpmcUB14zGRKeWYMeba2DxBvsK7L8+rfwMkC1rzl6IkkNiaUOWRflIPsu6dsbdnK84JjXckEMOdRnHY8DKwW6OSncY0I+X34vU83nr9EH5txoj+zb3f07ui9N1E/PCELHUtqLvLj67ii80GP5El3Wn4tZn13h6FpJomn/WETN0tKJDEQ/JdS+2W1DFrCI1xP63Snwur2Kb3TZ2aNVXJaTuBIZnhXzSErfhDJ7iWpyZseBlWUlTtY4cr1xty6jZPsCcEdGPSqwNRugZ7GYYs1YKbMdR3VqW3Mg8xE3ZOjbqeFMblHf6j8gX+AP1ljUtbnZWtWk4dkF9azYywLQkKNr3Uv7iVzjWYZ4i/cKhurPwYcdiTBh1JTwz5tfgZOVeQWkVwYsanEs2FFfWDeVgLzgCfHPpgog13mgDeFxQm1htEeRWRYEvOmDaKgMyNHWCiRgj3S+bKEgSxBVzWcBfMH1mh2fYtYXvSIg0fhBQY8QX721va+fpWveXS55IqmJQaFJ6o18x1uCOKc+Cq4RS7WQGfLCm5FOOSEdCb6nZGAo2ZD6qR8hVvqDLtadgrKgCmmjkagNHne/mz86CkDKnqnDTG5nH0pFpjm5P3MNXSXacuvQekFP5IrkKTCuWOL2WQXe0AzQrB5zXooWWfBxHkIuWZs0C1wa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uqQV3KuKSQRrOmjWAW4je97KOMUoohKSzbxAlUf79CyKbjBcTkRfnhe9eG1T?=
 =?us-ascii?Q?gTusg3cQ3WBcCdBzod9Momj/4jI0hvlyG9KbJcShqi9rNP0YqFZ8ps6aqSgO?=
 =?us-ascii?Q?ptmSj/4lRCUx0zCMVgnDmimDF06YLLnaugsvqotGYGBg4cAtW6u9yYODjDqp?=
 =?us-ascii?Q?+QC2bAXLhn3LADPlMIqt1gIOj/k7nAJABzsjWd/5KOAMg+bd+UrxLtSWgtlL?=
 =?us-ascii?Q?YVMZ9uL97PwUM607zxc8jam2kRP7T0t7uGdCG32wdvDFEwPhDkHY3vJPgzTT?=
 =?us-ascii?Q?3R1oHs84ILaYCzmEFjihXYNcb8r4njNb3QDkdf4ZcXTPltg9jkeb65GaC86x?=
 =?us-ascii?Q?mE4VXX2NdGE5XkT1dMwVdxGBbQddD9FHikgPaywKrQ28L1EslaSmakTLuRCO?=
 =?us-ascii?Q?h9zib4/ZoHdPSwGDANU4aVZyogpbNphgDARX6pBUPQwkcuCBzqdqRpKPYgMc?=
 =?us-ascii?Q?WnLUZv674uhFmPcJOUbyjAVkgu5JFDSKOtih6Zokq/3GGwpm5D4BlGnQvzN7?=
 =?us-ascii?Q?6MWA6pWLfwaZ6yctIT90HlsseqX+177MsOAOTb4kOU3E+SXX5REOkPmXebvK?=
 =?us-ascii?Q?m7HbsyjMA/3iL7ErkQm+KBpNjDmIpsTA1WTx/UVNEPhf8Fp1CeMLKwrC8GaX?=
 =?us-ascii?Q?JahHD+dsI6KiiKYVrehTnt5Q6eVqhJO1MGASIuy+YSZB6Hsp5XfJ6plzP31X?=
 =?us-ascii?Q?+BN6rjR/cFG23LwByZW+7uIXVn4hL9XlZULyWoqkdrwa4xF5U6jVwYhMjfCH?=
 =?us-ascii?Q?I0gK2/A3rvQDjrJAss8JOBhVG8T8WRnIFpCZWNs3Kpt907hhXEAkDWaN4Cmd?=
 =?us-ascii?Q?K/UFZoXmRQOkI+CLzGpAL1/5ciiozJnPUhEp/uDfSx6vXI5WIAK7ah5sAjmN?=
 =?us-ascii?Q?7OYUGtDG2MpEbQe0awkI7VgzbBNshM5oy9lxPq9DRaBiHsLX5DJwJhq+MdYq?=
 =?us-ascii?Q?yEqgMNhU/b2bJCwgCaq1Z+rRNJd+aiXgxT7XtW5xRUgM2gAPj0PiVBAtBAK5?=
 =?us-ascii?Q?jn5LmvadXx57PXMi/gnshwJZZSCF93ohF3TjSjjXZj4ME9UzSs9EP/Zb2WED?=
 =?us-ascii?Q?XjeeUrJ9qsdoNDVrWTqKiZe5dlXQKSjVrh1yZfRKiXk6WL2j+2hWZXl/3u+E?=
 =?us-ascii?Q?lsNW3LU4WkRrKgXTNx1wQtLBT4qyt55/N4boitwnHiiv8Gh7aq2ClDQY2hlx?=
 =?us-ascii?Q?nKMYQHA0jBhiI/Jg38rU7ZHOBFq8A0JH35x+iErATOY2w60if3CIe9L1DuCA?=
 =?us-ascii?Q?g5CRhouxgHmNGd8myGp+/Nd+JVcrQAuIGHD3DpWQn8j6Eb9IVNAtqFfGZKYx?=
 =?us-ascii?Q?SGhHw0tuixDhSqnI43Gr9YxNIjlokJQKaB9wuTVa9W89Ws9PqxeCsjyceerb?=
 =?us-ascii?Q?EBc1PiNmUHMyODwYwmq/bhjggh5P0MGy4Gd3/zVx7TqD1vq0cYVCsNVWlLBk?=
 =?us-ascii?Q?jR1GRlXxMDyV4rQiffPg+axzvOJJSCA9Bsomhitci6RrSOfamclSEFK4lZm2?=
 =?us-ascii?Q?cMsN4VpTvpfson/5sotcDLguMAeYDVuYX6UzdiP9HEgb5mXrCim9WKbtW11s?=
 =?us-ascii?Q?PZvmczSglznWl8YV2dEfFnWcpME12IvuTnCaPbh3zmlM5b1wvA/0cNSgV35M?=
 =?us-ascii?Q?Ay9/h+HM5eAPzGo+Jx8a806MbtJ5IFeqTDVQfiiavvSed9s8TujzldMt2z42?=
 =?us-ascii?Q?Opyqqls6g3cSUiS5V+noV78umnTLzkEwP4BKGGt2MtaBFLdNKSIMVaclq61i?=
 =?us-ascii?Q?M1Dxlm3ofA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32963b4f-9f26-4603-2851-08dec0560410
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:20.2562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWvMXeVtRFefCxjSwKfWCYyzWk2fmn9HdF84v62p52k/MGlBvnS2M3ykdRkY35LL3IxMNUKIQent1rHtHmlF5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

The GSP-RM boot working memory portion of the WPR2 heap must be
larger on Hopper and later GPUs than on Turing, Ampere, and Ada.
Select the larger value for those generations.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               | 20 +++++++++++++------
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 919d3ab00075..0c54e8bf4bb3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
 mod r570_144;
@@ -29,7 +30,10 @@
 use crate::{
     fb::FbLayout,
     firmware::gsp::GspFirmware,
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
@@ -106,11 +110,15 @@ enum GspFwHeapParams {}
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+            }
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+            }
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index f82ed097b283..1d592bd3f9ed 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -37,6 +37,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 = 14680064;
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
-- 
2.54.0

