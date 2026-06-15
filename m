Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDE3FC5C5
	for <nova-gpu@lists.linux.dev>; Mon, 15 Jun 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534528; cv=fail; b=doKKimqxx04bykcLQFx14omvPNTIK8iilRw9PCqiWWkzM7Et8FNQ56GF3rnEmXXsmWSG/pBVoBVIxW5xolfIqDMDCyeoHlw59/1x1fUJh9GRkZXHjuizQ9v7vax8+rmFvwqghA8KSjtk2SA+m/DwW6yjJJyCO1pRgCyAo1+Qh3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534528; c=relaxed/simple;
	bh=LywQkq0LlHlweCPnqnz22ft/QWcvGaxXn6rsaF8ALKM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=opaFiIOF3hl1uXz5uO49BBg1oKzfeWUSVKsuHJEXMZS3lC6RPpSfGWchVrXG+zSUOrGctqxZ75tUE7hGb/QVgQZU/63639Qgp8OT77FH+jTneDv4nj7Lw7ICKxZsfq2l53ubSGJy9RzyEtMyySisYVNU8StyFXBXpOt6PkVcG0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AHXbasqP; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AHXbasqP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKbFmP5aPnXtboUL4stR8Y3Zx84+xh0VSqZ9hZsTMrieAoLp5Yy+QuS6BzzSkr5kdjwHeHVD+vfPMjaPvIoP5uh9nlUs8QNUtJTopDcmFnBsHDh/EjRoagu4wMbPvv/s7TPH+IlyxrJGLLONZWSsXttlR62w27LpnJ0IIIKyAkREsPlZsNKwZqzq+OQILhd0chNRnrbKQAT2+gX6b6GxC9ZarCTOQ2Y85mWrt5isox+S4NjIGnSiGZW/UG/gl9QOeRz6sob1lquvKG9Qb5Ym5Si1Xb7pVfuXEhUjbPnCsam3MjsMvJ7YSoKGdbTNFqgjn3mGmIjsLaP0GvG5bHHilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejD4V1AU/G3gZs8fwjn/7BL84V2WzZ6G1g2IZI3hl0g=;
 b=gSuRIegZufLWdmELyGKTR2M3wZwrJCQHJS7DVHJojsF8bDvvwlsT2cXanihfy8KjHuPv1GQmrzf4l09KwyrwTlBLOxb2BqNWPh49mEpkygmMwNp0W8nHRbY/LZHfxnDDsKdFrwRwG18M9JfqmyKpt7brSiM+raMzPnc+7dheLNjdbjn4dyITuIeqlyzoqgT554F4nkXEU+z4vvAia/GkVPDgqte+X5XWjtTiIxGkGNEMVSAKR1nGoIEoGSMCkSEg2o1pBu6nvYHx2yWcmO286K9N9SnCVj1BOkYA3mQ5JMTJ36jMY2SMjye4YQRIhxExXre1gx9uTAswMfJ+EO+7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejD4V1AU/G3gZs8fwjn/7BL84V2WzZ6G1g2IZI3hl0g=;
 b=AHXbasqPUJ+6m6J5zxtcVrhYqOdQLmRp7E51/oo0DP0/gSAHPT0hgnbfaUQlOF3TfPAXH7EisA0VcFq5j5UxU6zYA1B6u1GtITxtH556yATxuc9P9wWsAEdp2Ps1FFeQEr2v49W8UDr58ik5gWoMmKRD1aiWnzTubTKtbcC3XLHb6dEpZl5Ydva/aoYiS+lsjM/eL26ahQMRo2pd/qoyGn8A0Q/HZJlw9SrwC00b5GXls6dE/+HIOhTdcGyR8CPoLlNE8aZoYHc51fmzUnOCynJm1H5OLYlqQqnbXkPfWtBHsKMk/ozGGB11yXIn7ow2MXj/MFSXX2y3yP8MYVTmkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV8PR12MB9668.namprd12.prod.outlook.com (2603:10b6:408:295::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Mon, 15 Jun
 2026 14:42:01 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:42:01 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 15 Jun 2026 23:40:47 +0900
Subject: [PATCH 07/13] gpu: nova-core: gsp: ensure lifetime for FMC boot
 DMA allocations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-blackwell-fixes-v1-7-f2853e49ff7d@nvidia.com>
References: <20260615-blackwell-fixes-v1-0-f2853e49ff7d@nvidia.com>
In-Reply-To: <20260615-blackwell-fixes-v1-0-f2853e49ff7d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: DUZPR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::21) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV8PR12MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c100a78-bf91-4501-ee37-08decaec426d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|23010399003|366016|1800799024|11063799006|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	soNzdCsPxILXOMP1ugqB0zloStnDUAUbYJIiiLZuLXnzGONUJfC45odYiOLTeLvVPJvbXpWxjWM8iqfFT1PuKDQJLnGqx/eICftGtamgDpR9oYxtUDFcv3quEQ10o6A6b598Q+02BTa+/fnHBu23LD5mXdGJw37G2GWfBgmx5uMnju5sWs826usvgk07ZdgyFt0l7fYtrsFUKk5WcrVPhFXkvYC1LBI0ehfIQGM/55/DMxaCqO0xldvadvDkbUZ2PEKDo37BY3oGOcb9A9raRy3ohhMfMOA2Xsqm7kZhwqnBlsra6okgoYx6e7Qvg7drx0ekRZ57MV6rWc0OQ/Eq2pnqyKxvnNDLXaQ0yY/EMjEQCkixJbULJhCZUz+pXJ3Ikg6CCcmM8+qnvKQHDn6TSSCtOKFm7u678a7NedNCi/nXIEnQWTHSFKhhgBaCmMSmKM3oQVjOiI+Eh/3BCsBptbL/8eZmYMkpI5mjK/DAQ9wXcIANnKEYc8b1/CdzCy1e6i+iXU422sY+qUFvJM89rHNW7+VJKeFCbZoXrwlrFE/ZSyO0OJcbqA1zakNUzuIQiqavnW4b9la3jiEz7QW6gA2TOoybIbO7WbVFlaZon/kBI4WHnpps8sBJkr8kBokSsh7x1GqIpQpfzmNMgJo4OC5wgqy+UGjyo8J4Boc8JYzb2A0Jbcx3nqXorIgcOFHq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(23010399003)(366016)(1800799024)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU1QUStzYUx5djhZY2JWYTdrS0dWNmNqc2hBaGJFTEpiNFBldjdtSXZDYzl0?=
 =?utf-8?B?VjBwek9FZDV1a0Y1RDloYjVRbHZtcmM5TWFaOHBNRGF1SUlFTk8rWWRNVXVY?=
 =?utf-8?B?VXNReUFmeG9ERkhSdVZqek4xd3plUkI1MTZEYmU3Vkc4UkZZbGdTYURBK1Av?=
 =?utf-8?B?YWdOcHNvbzRnUmVqbEd4SzA3b0ZrdytMbnFFNnJsamtYR0ZxNEtUU2UzM1Zq?=
 =?utf-8?B?cnpPelhEdnhUSGx0OUdtQld1YnRJZjAxbEVpSWF0LzFZUXVTeFJ5Yk45Y2FY?=
 =?utf-8?B?d3YzeG1PQWlvMXdqcllPaDVaNVZVb0JlNEIrbU8zM05iQlg5WG8yOWJ0QnY3?=
 =?utf-8?B?a2VqdklHY0cvZTlmZVRBZDZQYk5NdVVmSUk0QVVnZEQvemRvUi9UVUlpMmdF?=
 =?utf-8?B?YlpCdUFiM21ST1k3WFp6WnRCNWJOaHV6dnJoSVlFSG83R3U3cS9INzJWZE5Z?=
 =?utf-8?B?NFMwaGN0d0dCQVJvWE8yeGdyME11SlNGN3VxRjh1WUU4SUR3b29yeHVqb0Zv?=
 =?utf-8?B?cmZmaHhaWm04OTlLUk9NQnBEeVJrbmxsaUNNRm91bjZ6djh6dExJbTZzUFNP?=
 =?utf-8?B?M0NGdXljL1ZTTXNRbDJyTnNqNHFBbk8vd0VvQU5paVZBREtnZlRGVG0vM3dD?=
 =?utf-8?B?NnFoMkRsa3NuU1ZERUg0V1ZCZExia3EzRWd3MzYxYjhPVm5ZbVB1eWw0MlJE?=
 =?utf-8?B?c09KclZmbW9NYjlmSUZxbTloVUJuK3NUcWdFcG9wK2ZQL2U3UjFuVFBkZ1Va?=
 =?utf-8?B?djZGN1Y5NmRhcEwxcmNVNXhvTUY1b0xDVktZdWJBVlZyNHp2TGp5Sm15Q3pK?=
 =?utf-8?B?d0J6STdnS0RFdndTQWhZV3EyQkM0RWp4Ly80ZHl2MjlvYmlzcUk3RlN0d2c5?=
 =?utf-8?B?KzlsZUQ4SjZRVEgwdERMajRwL1pRSjRZUHZhSnkwZGp3dkE3aWlhNGcyZDVZ?=
 =?utf-8?B?emhVUkFNTEwydDRleUJjYTJRVlVXKzZyTkV0TU43cFlXR0dvRDFJMzZZSStU?=
 =?utf-8?B?N29RME5nVWVTZGNtTG15OGxEUlpSSlZ6NkxDbWt0Qm9Jb3JUNW5iMUR2dnEv?=
 =?utf-8?B?b0tVMXVnSzFkTWNVZmFudDR1ZzZjZzVhNXRkRmR5YTZHQ2hVNExNYXJDRjlq?=
 =?utf-8?B?ZUNvWmJzNjdVTjJyWHBpTU9IVmVrZGI2Z0pIRFlaaWNoRXdZWjIwZUJNa0Va?=
 =?utf-8?B?T2pIbWJHT2Q2ZUtiVWVQbldPNWVVL3IvM3pXOXJsejAvSHNhK0lNcjZrSWw3?=
 =?utf-8?B?N3I4WlNtZDZEeG81VXNzdmJXbitrRHppZzFZYktpWE1DZG1tVlJwQnQ1NytS?=
 =?utf-8?B?UWRKR2plMFY2WVN4SGRPcS9xdkV3L2lhRzVTYXg3OGQ5UkRGallFV2hiaXBQ?=
 =?utf-8?B?NTh5QjJGbUhtVXRpWTBjNkRENE9vdDlyM2xITXJ0b2dmVXhtK2tSczllOU1R?=
 =?utf-8?B?MjhsRGNseEpQb0J4U0EydW5vSTBTZWtudWY5amJQUGdDUjNZZC9FMDFJT1FW?=
 =?utf-8?B?bWFpdWk4RjIvc1dsNU1vV0pwQjJvQlNGMTd4ZVQvS0FuNU1UMk14Q3U3RnZ2?=
 =?utf-8?B?NFNUYnZlMlQ5eGVFZzVzVW1SMlRzOWJTdFhhc3lFdFVBNlJpbW5XYmZsQm51?=
 =?utf-8?B?OE9LYmFTVEVGa2VpeUptVEhwMVVLQTcwRitnYUR6cDRHRTZFbGJMWnBuc1Yw?=
 =?utf-8?B?dmNnSzdVeHludGFJTVBUQmYzL2x4dkxtN29rN0RMUVZVbXZXVkROMzJPR0R6?=
 =?utf-8?B?UmxCbFJRejNTNjNENVZwVEEzS2YvallpMThqYy9yb2wxWmE0ZUxYVllZN0xI?=
 =?utf-8?B?MjNwampWZ2ZkRVhpalkzNGpyVnNNS1NQMnIxQ09uZTlTUjJVRHAyTklZL1o4?=
 =?utf-8?B?Y3c5SkJ3bW1VYTI2cXAxMEdWQXhidXJMWDQyc0V1S09MWUNGSXlXelMrSTF0?=
 =?utf-8?B?VzVxQjVlZldPVmhRSldMWlZiOTJmZWk3c0dVSEdXb3F2YktPODloMDFRY2FM?=
 =?utf-8?B?TGdUQVBzcE43Ymt5ZFVuL05DS3BIZU5XUlhnWGRSdmt0Q005clFSem9SMDk5?=
 =?utf-8?B?SVBTY0xYOEhjL2lPdGIzd3VSNHFMWE02eTRMeW94MVRWNFc1eFZSdjVWdGRz?=
 =?utf-8?B?dU5ydW03U2pnTmEyY2hFdHlQM2ZGMTZzVktYcEp2bzBwckk2OVg5YXlSZ0pz?=
 =?utf-8?B?UnFFQWcxVjZyWXlVNVRQWjNvK1F5Z2wvQUhtR2hjeC94QzZ1dTNZNUxTR3Vn?=
 =?utf-8?B?L3l6VXFTZ1RKVjhkVXJZTHpLc20ycDFzTklycS9PVjlxalRQenIrdzRxbWth?=
 =?utf-8?B?Q2N6Tk9lRmVCSHAva2dUYjRRWTVSaElUSm9zQUl1T1JXck9YdUErMzdYNzZp?=
 =?utf-8?Q?zAvNJwrlzNd8e7KCZmCQAeoqG4s7uVOrbMEAv50DcpZkV?=
X-MS-Exchange-AntiSpam-MessageData-1: 9ZdkGG8aAOv9+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c100a78-bf91-4501-ee37-08decaec426d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:42:01.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93/ui040AhwcjxEh2UWqeIwYy/ziznB0GHKItDuU4TdP8Sa5RtsVa8vLd2H7qTZYQ4W9G3uLLWmJBn4IsokB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9668

Currently, `FmcBootArgs` takes DMA handles directly, rather than
references to the `Coherent` for them. This is error prone, so instead
store lifetime'd references to the `Coherent` allocation.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           | 32 ++++++++++++++++++++------------
 drivers/gpu/nova-core/gsp.rs           |  8 +++-----
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 19 +++++++------------
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 4b97d1fb505e..3f3211eae4d0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -39,7 +39,11 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
-    gsp::GspFmcBootParams,
+    gsp::{
+        GspFmcBootParams,
+        GspFwWprMeta,
+        LibosMemoryRegionInitArgument, //
+    },
     mctp::{
         MctpHeader,
         NvdmHeader,
@@ -133,7 +137,7 @@ impl FspCotMessage {
     fn new<'a>(
         fb_layout: &FbLayout,
         fsp_fw: &'a FspFirmware,
-        args: &'a FmcBootArgs,
+        args: &'a FmcBootArgs<'_>,
     ) -> Result<impl Init<Self> + 'a> {
         // frts_vidmem_offset is measured from the end of FB, so FRTS sits at
         // (end of FB) - frts_vidmem_offset.
@@ -187,35 +191,39 @@ impl MessageToFsp for FspCotMessage {
 }
 
 /// Bundled arguments for FMC boot via FSP Chain of Trust.
-pub(crate) struct FmcBootArgs {
+pub(crate) struct FmcBootArgs<'a> {
     chipset: Chipset,
     fmc_boot_params: Coherent<GspFmcBootParams>,
     resume: bool,
+    // Additional dependencies required to be kept alive for FMC boot.
+    _wpr_meta: &'a Coherent<GspFwWprMeta>,
+    _libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
 }
 
-impl FmcBootArgs {
+impl<'a> FmcBootArgs<'a> {
     /// Builds FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
-        wpr_meta_addr: u64,
-        libos_addr: u64,
+        wpr_meta: &'a Coherent<GspFwWprMeta>,
+        libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
         resume: bool,
     ) -> Result<Self> {
-        let init = GspFmcBootParams::new(wpr_meta_addr, libos_addr);
+        let init = GspFmcBootParams::new(wpr_meta.dma_handle(), libos.dma_handle());
 
         Ok(Self {
             chipset,
             fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP_KERNEL, init)?,
             resume,
+            _wpr_meta: wpr_meta,
+            _libos: libos,
         })
     }
 
-    /// DMA address of the FMC boot parameters, needed after boot for lockdown
-    /// release polling.
-    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
-        self.fmc_boot_params.dma_handle()
+    /// Returns the FMC boot parameters allocation.
+    pub(crate) fn boot_params(&self) -> &Coherent<GspFmcBootParams> {
+        &self.fmc_boot_params
     }
 }
 
@@ -332,7 +340,7 @@ pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: Bar0<'_>,
         fb_layout: &FbLayout,
-        args: &FmcBootArgs,
+        args: &FmcBootArgs<'_>,
     ) -> Result {
         dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 385b4c09582b..b93c1fe8461e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -28,16 +28,14 @@
 pub(crate) use fw::{
     GspFmcBootParams,
     GspFwWprMeta,
+    LibosMemoryRegionInitArgument,
     LibosParams, //
 };
 
 use crate::{
     gsp::cmdq::Cmdq,
-    gsp::fw::{
-        GspArgumentsPadded,
-        LibosMemoryRegionInitArgument, //
-    },
-    num,
+    gsp::fw::GspArgumentsPadded,
+    num, //
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 3e499563c9bc..31498ae7abd2 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -30,6 +30,7 @@
             UnloadBundle, //
         },
         Gsp,
+        GspFmcBootParams,
         GspFwWprMeta, //
     },
 };
@@ -62,13 +63,13 @@ fn lockdown_released_or_error(
         &self,
         gsp_falcon: &Falcon<GspEngine>,
         bar: Bar0<'_>,
-        fmc_boot_params_addr: u64,
+        fmc_boot_params: &Coherent<GspFmcBootParams>,
     ) -> bool {
         // GSP-FMC normally clears the boot parameters address from the mailboxes early during
         // boot. If the address is still there, keep polling rather than treating it as an error.
         // Any other non-zero mailbox0 value is a GSP-FMC error code.
         if self.mbox0 != 0 {
-            return self.combined_addr() != fmc_boot_params_addr;
+            return self.combined_addr() != fmc_boot_params.dma_handle();
         }
 
         !gsp_falcon.riscv_branch_privilege_lockdown(bar)
@@ -80,7 +81,7 @@ fn wait_for_gsp_lockdown_release(
     dev: &device::Device<device::Bound>,
     bar: Bar0<'_>,
     gsp_falcon: &Falcon<GspEngine>,
-    fmc_boot_params_addr: u64,
+    fmc_boot_params: &Coherent<GspFmcBootParams>,
 ) -> Result {
     dev_dbg!(dev, "Waiting for GSP lockdown release\n");
 
@@ -95,7 +96,7 @@ fn wait_for_gsp_lockdown_release(
         },
         |mbox| match mbox {
             None => false,
-            Some(mbox) => mbox.lockdown_released_or_error(gsp_falcon, bar, fmc_boot_params_addr),
+            Some(mbox) => mbox.lockdown_released_or_error(gsp_falcon, bar, fmc_boot_params),
         },
         Delta::from_millis(10),
         Delta::from_secs(30),
@@ -156,13 +157,7 @@ fn boot<'a>(
         gsp_falcon: &'a Falcon<GspEngine>,
         sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
-        let args = FmcBootArgs::new(
-            dev,
-            chipset,
-            wpr_meta.dma_handle(),
-            gsp.libos.dma_handle(),
-            false,
-        )?;
+        let args = FmcBootArgs::new(dev, chipset, wpr_meta, &gsp.libos, false)?;
 
         let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset)?;
 
@@ -176,7 +171,7 @@ fn boot<'a>(
 
         fsp.boot_fmc(dev, bar, fb_layout, &args)?;
 
-        wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, args.boot_params_dma_handle())?;
+        wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, args.boot_params())?;
 
         Ok(unload_guard)
     }

-- 
2.54.0

