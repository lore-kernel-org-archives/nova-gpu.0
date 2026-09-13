Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587CE3F926F
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329273; cv=fail; b=dC21R266R2J7s6UVa2N53gQQFvGyvoSOmcSP1wury7IuqT1ffKzKj5cvMCpra4yi5pUT+pPtR2HLhDNFwetWrzK/LNueZ2YNTQ+fCeQdmSKX/Vw3jpAsElMQSLpXs+9o8Ec7SJNytzQbPhXDyrDDCrnjjMO2dhuZ9ML1stxxFnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329273; c=relaxed/simple;
	bh=QHhK6cA2AIHElx85id2NgxZUlGcOBuEOYH4TQP1iIbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/ycsnx9Ia4Jnl7f23QCSm1HXs1roA5cIvX/lNlSdh8GGK7NG7Zt9UfYU/FUsbdRNbd9BGdo3o9XlyKw9QZkUfkenej4IRFoI7OiWupklB5fxgsX+4r0vGalbo+6QPuH3GFdLxwmCsHM/DAewMVO1s2Wp+zNqiqLtUdYbKB1r+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rF8ttHIV; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rF8ttHIV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN5s1dJEO0EgPa7GRWXJvFs6ubUyxTtBkBKjf1H7Y2gjg1jw5Htj7jjumXB8NJFGHTYsUx/rR12lldH7HmFtcEfIPELp0zu5DXoW790DIi6JcO8/g9uAt9OOdInTMz7RK99cmcrHdx/nx63MYQel9VG+mCvE52a+53XsqxU4bmQO1OwNVfX9Hx+S4Yvp2156KlSNdJNwroUcTWCpXon4Hs5xj2SGBWzsPPKi0npXMlk6PQR9nj4WnSizhZguJd+A8MJNsHjzR0zCOdciXEdS3ra5Yjp05QaMTeLaZjD+BcuLhEihKAHeAf/7muva3gGEVZgbzbAFSY/hNXkdkhc28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ywGS2gmhnS4HbGH3xV6D1D/Y2mOKJS09pD3kGKSGtE=;
 b=Junt07ZDDx/C7fYSEkicNrnZvxbR56dIe47rvOXuFcSdGzixHmS3TF4CA5FYLXQYfPP/gu/rLkWqR0Dzw3zoWhkWpPTQGYYN0UPW4JqW+WImbG3OdqjzjXKLeboV1uWugz2uo7V2pqTGrwwfzEtRtop9WltrJAPSgljazWnbwUykOz99yy4mbLRXoi5IlIscWxCQikJa6xl3HTXBQr48seIeMvDSmALxXSA9pY8JmGs6gN4Qj8q0y4zrEaH2h/c9xSwt5IlIdJ7P/DOeVidc2DpjUu/9jcGiPA6fQuq95+RIum9CEGxgM624Ukn0ECAOp9Eio3SE5bbLy31wSkcw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ywGS2gmhnS4HbGH3xV6D1D/Y2mOKJS09pD3kGKSGtE=;
 b=rF8ttHIVb22rpo979EYPQwwIdZFlf/wCeoP4iC4+p2fneQQ02pnyFPZjCVAkOBa82FI1/Nl7USunGOxwnysdRhUL5J10FqOgDW4EKl93SvdPazYbWSv4+9FqXjcRL2eODe+RUrjWbZ5k11XZqBRbrLIcxB/vkFWYSr45WpzQGTOzU4faOse8oZsKKpg/edbXpxHJlyyKyGGLpr4hwcRq+8FeQSBQGlW5hj3JdX+BtJCZC7Qk7d8wRb7X6Jg5Q/dw36+rG6lqp11KjuWDNPTnWszFw7QwI/0p1DA79QrQ3qAmUBbWhuLVTe7a+G3xje/85D/uRwaMRYWDpQKfpMSTCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.8; Sun, 13 Sep 2026 19:54:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:54:24 +0000
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
Subject: [PATCH 3/3] gpu: nova-core: rename the FbRanges elf field to fw_image
Date: Sun, 13 Sep 2026 12:54:13 -0700
Message-ID: <20260913195413.742143-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913195413.742143-1-jhubbard@nvidia.com>
References: <20260913195413.742143-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aa7b4b-201c-4cbc-39ed-08df11d0cfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|7416014|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	c2xqI1Xp2LrxRTTP4gxIISwKoImAsBMgzNb2M7GtfQpfdDz70T3hxtQYC3g8v/C5vibzNf7y96eX74ru/O9aCRnN/DmIWXaMq6b2ETRvovQ/yuRWlr9al6lpdqULNVpdle5Q/W+4oMbkxLlGbKWxyG/fZ7lZ5VNeWjDj8MU2plnNwaEKPwxRJyEJIvwUYAfLNZARZXekUhdrF98Q+lubX2TChBMgrSl4iDQtsPBoJeAMLAvdDg/pS/tF/+gQovhgDmnMgvpBJZZ7g4LfIBGN8kyPxE7QJ4qivwT0yGzc5ak0T4ivme4oUWGMdnNhP2mp0W1mTuewdjuKm/kaGb4YZHIeACd1MW9E/TwNxCQ9bMzs56blHgeeFQ5sfyGaU4KUAz4/6te/OEq6cWB8g09mU2EoIDLVq+r/faJuUXtQ/NS7dkq1e8dgnQMbOlOS9eSS1lQiz92B0+8J8gifQGxoAeyKgeoVySKSVDpjwSDtUeCQS1bom3TIxRZK9xjw2+y9smcSoYRVNH4AD6Z5tjiTdHvGPjx+I/bqIGRptDKjiVwft7NCwQ1+aWh/GYkf0DcM2WoKaMk8ExAEnNk9j2By9tnksLfHkq9AvWhWPyC+htg6FZCB9TyLm4pmJtDYAvKV/lPPNUK95uTQSiQSKR9JUBdJ3Gj34FAIz1aoR0+rVoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(7416014)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxyAHR/ia+T+owskygNrDS47CaWBIf0wRs1M+WkecN/w+VpyJSqngGOqNXgw?=
 =?us-ascii?Q?3/wQdjg26lj9L/PLjAnvSi5bR/cO8SCgylk6O8ETsI5I4xuw9n7ydzb6NMX2?=
 =?us-ascii?Q?VAbOY0Ty8HCFwkfQhw2liWmH08oAqGG0ARGgFmfgVLf7p6b40IOqrSmLUjxX?=
 =?us-ascii?Q?mwr+NDXARDAV3y4/PZzCHkc9WWijRFJHfwYBh4AKhqP2XsQANMPR+Z300UiK?=
 =?us-ascii?Q?J0k6thO9Ri2nmollQqBZLemknD2k7Xo/MR4ZPdIIPNm2JnalF/LJrNfWQie6?=
 =?us-ascii?Q?w3pKk27KYPhEtUdacePU/sVgmgBA1tAbgX1KTnEHOh/GAutzzXvSAPVXJIZ+?=
 =?us-ascii?Q?48BlfXyVrhWQlr8H7HAzLjX02dam/GlRdVxeJGp+r0Vs57qW8ZBBNFefV2Xv?=
 =?us-ascii?Q?EtFh8oUKaqmnFz9WbBfZJYUNQ365zfHTHvTXF4zDRtG3dzApq6Xr2k9Jmryj?=
 =?us-ascii?Q?q+GsiredkWc508tHVubv48h026kalVofWf47zuHKBl+9q1qKoilcsMPFa2up?=
 =?us-ascii?Q?MYqfb6B07qEnPhw2abidXcqQi/7mOeiNqf0uZUbHfd5oOpUOnzfhYl1VBrPx?=
 =?us-ascii?Q?zqzxc/88GA4oONaYRX4IwhWN0LppGcPJ5mhZX1zEMGwwzOaTttwnIQ089tcO?=
 =?us-ascii?Q?34HwKrPcdk26PI+LZIdzNpCpS0TpTAJk1ze8Mxw8GgiY7/CndpjSko8FcJQB?=
 =?us-ascii?Q?Lqk8BMZILzXYAxlAy1Q3vhre0QpM5JdRThSjD06RVQdAU3fuecOrQ+0+j20Y?=
 =?us-ascii?Q?krjv0laujamAOcmB+rieN+k3+0CyRtbJfffijsDWgwydxBiGBFEnXM9a5d4K?=
 =?us-ascii?Q?WpHvRUgtCWucsx7K4nloDwzMy2RMaNVtuBY7Y+4AJ8aA2Lqnu4mx3GKs0ALy?=
 =?us-ascii?Q?R5PfmwxNFeTvTIx4wl1LNwAWytU94QKBfcYLWA2CIiHxggYjptVD60raCde3?=
 =?us-ascii?Q?fhYMCdO/clnPlbcFCk2qMTnXW5Q1UWOichvCDfWBGtuoUuOBNP41TgfudwG/?=
 =?us-ascii?Q?dwjRkoO5o5B9cwdCuurlkX5qw1HU5MuYrAvsFW84BwWAf4uPNhC1GWa54+7F?=
 =?us-ascii?Q?uT6SIvJWFHRgwyVeSv+iXxzqE4OoJpzlE7p6AXp+KoA0I4NoGZ3gxu8dzk97?=
 =?us-ascii?Q?cCSJI0/IL1b84vcoV+sZqxTK5d+dtrte5Clc45KS3tY7e+md2d9tCA/0koVU?=
 =?us-ascii?Q?mCfMnDNmc5b6BTeLCqAZbLICQ6VszQYdqRGomuBYVcUDzxhwY6VIAfPlLm6q?=
 =?us-ascii?Q?DMO0jM3XaRBT5aqhPWAGMQBwGWkYe6R+2ZP2a+EyYVpYyOIEyDqUQIZ88Dwv?=
 =?us-ascii?Q?q1CvF/4b2PNCSDnEMmtVId4INWJMRTunHv+ZTqU6BXuQlUORVN5GIxwXJ9/8?=
 =?us-ascii?Q?rmS0VOSIX00Eo4z7nN3omDr7LyAbbeUBMnldr27suJ0o2mk8atF/SjgIqtkd?=
 =?us-ascii?Q?FlGc1kg4Ap+t2duMAQ6eQp3cKlSmh4EMcQW+sHQm46AiyQGyZazH7FG9kDbZ?=
 =?us-ascii?Q?wUlDDQ1apK/vFNKhlfQCc3L5WSEOSIeRF2fYUcqi7I1hVX4wfyhwvtJrUlcf?=
 =?us-ascii?Q?oGES9ejzMc5BsYxp7sGOx/A2olS8MsD1vbjnW4gA9z2dbebKBX6+TKF3Snlz?=
 =?us-ascii?Q?E4Art2AHaZBkmiVKdgH8/Mt080nm1abE/ABv7o1QlAAcY7oYZQEX6PVYLGM/?=
 =?us-ascii?Q?goQV1J+3kr3hBHmbeMf2baJsRWvlVy2f+zHm6HZdKvoyVrNdJ9NMQoE5IfRE?=
 =?us-ascii?Q?viMIzVro3N0afwxhZdENgOw2vSZc9Ug=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aa7b4b-201c-4cbc-39ed-08df11d0cfb1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:54:24.6386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byuJGZMjLVZmZ2PUU882oWXGoVeexnpnnHQqY8n9GQB4poYycwE3RHQt9b215fRH3JJVZWs9/81mMzRsY5s0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

A TLV firmware file carries the GSP firmware image as a section
extracted from the original ELF, and the section is not itself an ELF.

Before the driver moved to TLV firmware files, it parsed that ELF
itself, and it named the framebuffer range that holds the image for the
ELF. The range kept the name through the move.

Rename the field for the framebuffer range that holds the GSP firmware
image, from elf to fw_image. After this, the following:

    $ cd drivers/gpu/nova-core
    $ grep -iw ELF

comes up empty. :)

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 +++++++++---------
 drivers/gpu/nova-core/gsp/fw.rs |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b18dc5447a73..b0c0b8fe6008 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -159,7 +159,7 @@ pub(crate) struct FbRanges {
     /// Memory area containing the GSP bootloader image.
     pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: FbRange,
+    pub(crate) fw_image: FbRange,
     /// WPR2 heap.
     pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
@@ -234,25 +234,25 @@ pub(crate) fn new(
             FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
-        let elf = {
-            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
-            let elf_size = u64::from_safe_cast(gsp_fw.size());
-            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+        let fw_image = {
+            const FW_IMAGE_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let fw_image_size = u64::from_safe_cast(gsp_fw.size());
+            let fw_image_addr = (boot.start - fw_image_size).align_down(FW_IMAGE_DOWN_ALIGN);
 
-            FbRange(elf_addr..elf_addr + elf_size)
+            FbRange(fw_image_addr..fw_image_addr + fw_image_size)
         };
 
         let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb.end)?;
 
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
-            let wpr2_heap_addr = elf
+            let wpr2_heap_addr = fw_image
                 .start
                 .checked_sub(wpr2_heap_size)
                 .ok_or(EOVERFLOW)?
                 .align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
+            FbRange(wpr2_heap_addr..(fw_image.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -273,7 +273,7 @@ pub(crate) fn new(
             vga_workspace,
             frts,
             boot,
-            elf,
+            fw_image,
             wpr2_heap,
             wpr2,
             non_wpr_heap,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ae98da42410b..918a7ae809eb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -205,7 +205,7 @@ pub(crate) fn from_ranges<'a>(
             gspFwWprStart: ranges.wpr2.start,
             gspFwHeapOffset: ranges.wpr2_heap.start,
             gspFwHeapSize: ranges.wpr2_heap.len(),
-            gspFwOffset: ranges.elf.start,
+            gspFwOffset: ranges.fw_image.start,
             bootBinOffset: ranges.boot.start,
             frtsOffset: ranges.frts.start,
             frtsSize: ranges.frts.len(),
-- 
2.55.0

