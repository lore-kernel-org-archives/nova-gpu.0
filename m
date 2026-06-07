Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806D322B72
	for <nova-gpu@lists.linux.dev>; Sun,  7 Jun 2026 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873549; cv=fail; b=pWP8W2NIvVKUYc1mdP8Mi0UtBUxSYZgJuvC7Gbk8qSv9gbVv8jhSO9ht4I4Hg19oENkicf+a3TEgyMbUw/OBF2NT7z3mt8nfDvFVljnDNwXHpTo5P4X3+1jExjnvyjFkdxDpOMuL58/8GJ3sjjw9NhSjl5JAzs4yqT1zoRygYqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873549; c=relaxed/simple;
	bh=VNzEwyrTUVAy7zPhNnCYYKQzkg6bNPMVZZjBnkIMmDk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nVL36DnbeM5ZEyJtyETRo+vYWWbFOnrkAXzciRCQFwxllDcIiq8kNMY1yHZsEqVOZ81/gAuHV7vb0I6Uq8e72Rs0+YtaVbOkormsq5wxCeEHpd+alt0vxftYblecEKO//txEPWeMB2ASr/6aySq7aGHbnHxigdEJNoubbK7OHwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j4LEpSlO; arc=fail smtp.client-ip=52.101.62.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4LEpSlO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lln56tYH45KKTcyf7Y9W4fcILmnebAaitcC3qK2cCsXlI9M3TIYX3XUlDJe4USu6ZkpVAj6eUhZ6YgUOeWzmGn3uS8RW8JffSW3LfzBFMS0jEwNNwZ91t/e53iz3qG08HIJZwzUwCfuLGR606OEdod7vVvtl21KbcKhy/y1ZE5RUYMgfN6yPFqj4k6eNgDtsvLwQQvzorct3KH4Bg6EeqsjU3zc0uo9weYpE3qMkEtZAqiC4lIQHMh5z6HHt0ag2iMbBFje4rMzIg2e7c4/z0VIQl8JAfoyp1G1sO2RVu35rASJ8DdD+SlU7+m6K+QWPZnIMaEe2/3qCyrrq18/Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzsi56JdcOzjx4egT7mLx3yhz4AiXuDwxc28jUrilG4=;
 b=id1w3QD+/EgatyISntAmP2cANeNQLBOYuKW/S620QpGEMgTjoI5DumBg/24R/gA1OtfxIDNZMXHbY52aZx2M8cGBRQKfpB2roGSt1rpMW+yEcE8dyaO7C95WkeYAbLI+n4pHb4OS7sP5PbJmn1MHr1VYi9YPSqewg534DM+vnHD+9L5fN2uopIER3nHtstzuaJ+cqMkVx2dnRYaOqZbVf/P74UxXtZRIvpXbmF4T7L8N50vT0UDXF8KYdFWMn0eSYVsL4WG0OEWpY2CLzTbcUQ49syrEyq3OR3i3MKiVIxO18g+Lzom+6GuPzgjotxeVEZREiTyff87fPLHC0DP1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzsi56JdcOzjx4egT7mLx3yhz4AiXuDwxc28jUrilG4=;
 b=j4LEpSlOYLf4rfrxP9UmSx8Bldhsfr0uHm0Yzw0lPr+B7fPXIYrEd2so9d065TktTfzcnwhahSzb3LuUCsEZ7kW/BfzKA7Mtv3vZ7UVJYiJAL9+w0cl1POs+UtxuY1/Y733a482gwEzVFHJbzre175B03aJadoCP0pCtq4fgPq/tsfinWCwiBs5eVU7kUGsbWKUKmipYdHeVN4Ga3K3YmmHd6TrhQPxx9cjli9SUv2EHbamFR9kfCOG+VUSEGd36GGi6XxyiZhnE+N3c+WRgP4IXceyMX0p54Dfy34kJkuU70G71Uk5JFh4DlKhK0OOwym6comFJVoGG1l8RVDPdWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Sun, 7 Jun 2026 23:05:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 23:05:43 +0000
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
Subject: [PATCH] gpu: nova-core: don't declare booter firmware for FSP chipsets
Date: Sun,  7 Jun 2026 16:05:39 -0700
Message-ID: <20260607230539.144382-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0405.namprd03.prod.outlook.com
 (2603:10b6:408:111::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf20ed-9128-4995-b907-08dec4e94cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EY40nl9jQfUc0dVJ6HoiLFbZQ5TFIaF6qOUHld+5/lzltxsPj7gKbrFjmbz5hewBv8fiUqjaiwVPV1eiV3OP1lcFMmE4Fd3YW85nouryixfm86AqhRR0xuDV6mS0IEinNBnG2cKEdrWpazbAbs77wdKcfCIEHW6VD+AkColr9y6Trnrjv0z4ffCHhzlbkhlcoGkOYXoqs2SVo9uAq6riuI/2sP9yYOP7jGXxUrBuGOVQ8fbzgCGsYFBdxBeU1dfyS4Cphf1jViQeoMxY5onG1I5HZZHTV5UWHIFFtgxL7QJiYFPQX/ReHtIXQrW8ljQJ5ENHHcECeSoNC+0tU5QVEv2if/BPZOojJWPa+DfCgQrIZShj6YWMsjiSasEFDZPVFQyIjgvegULjsqTeg1/CGZz2XpVMVpJ/ClO6LrHkHNm6XPfMuC6o6SeAdwbreV2PJj4EF5BbBICClVri4StLVUA1NjbLUGfG+iU87VXQ0vcpPl8MHTNErAC76PLDtNBuDBjD7uaifLR2pfyiTlKKqD3aKl32oEuyP42R9Fy6outVttyV3fxCOCuEntC2pkQ5C80QietOSOEhdvfJmdR9e80CtriPOsenH187YiutwnnDyAldYNNhp0OGu+oLtYr/Bm09Rx+gYhtEksnDjAJDE/+EixnT+aCuROcu85r6HXwikHHKsje6rqT+L5y9vs4b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GZ6hu0+EnMo41uYIw2SjpsHiC6jOLvfn4SjoQ0t7KPNkvqrRuDXvDWEOaBTV?=
 =?us-ascii?Q?CmK06Co8HlVAruFv2TOH1dOf9pc5DZh0REzgRmJoUkOGqT9CJzEZTXHY7L40?=
 =?us-ascii?Q?VNX0b4yt86qrgedJH9JB8ak/CcXk/TZuGMXxbvZDyPBoxPIiL1hKdIYSQwPH?=
 =?us-ascii?Q?L2yA5ySXNqYqMcLpzaktwocB1/FS3C4S9XO/5rHwbIaayYRT8VAceKRfVTO6?=
 =?us-ascii?Q?SZGV/uJDsdaRUHONhWksgtHu+VrKSXiJtXowojlvr44G8WGb0B45fo07FXWt?=
 =?us-ascii?Q?uQzL5a+MTg6vEom2lSgVo+3UHIbwF5K8o9weGYZzA8jmt8MbaIIcofJeaqEA?=
 =?us-ascii?Q?o/OsA89R1vGIuFzINR/x4knp7GACy6ew+k4P94mFx1xKfKhIwTEzde4Gej1u?=
 =?us-ascii?Q?S9UbuhdaB0GNoZJHh0cvKf3Ni8yL+RFnmOqGR40PKcfFzo9/KK1X1wUu/Kfi?=
 =?us-ascii?Q?3eYaDFGSgJfMo5JZ9cLBxbWYS0j2/56h9xliZRZEKEDPtpo1l2uye9VRlOrG?=
 =?us-ascii?Q?b/fTFVGysAUVMHuwrvdryVcDGSaW3SQ/op8+KYopJmEV8Bcjd+IDNN7PHLdz?=
 =?us-ascii?Q?6vgNM3nlWJN+eTv+Cslhn1MaU3QqPPaug9JjRj3gHeIeCo67ghEKi/hU6z0W?=
 =?us-ascii?Q?H7b3ZkBPZNLNLpCRWz++3Xqkh+S73gSwsYrSjZbAjLlcGA3vtx3w2S0NderD?=
 =?us-ascii?Q?9AQlFzMv4bquq9gYEdc67nTmlbfYjCqwKXMAkdt0Yi8NZgtabUO3Ln71VgW5?=
 =?us-ascii?Q?nMwuwe+m5ZI+B4UwJYZMKqKGCBv/8epa9awyqJdwX/xgq13eoJSSpObcxL07?=
 =?us-ascii?Q?fFip3t6lJMOi4VQW776rPp5bTjM982FNB2XkTeB+q17mVkTqwiluZA1/Mqg6?=
 =?us-ascii?Q?Grm1wQC9Mm+6iYQUrCMlRAyZYKaYlpqHX0/ArKjW07aD84883zPYecKzuSGr?=
 =?us-ascii?Q?KSCle1NbrTKIIrPjj0wdjVeqqjBGoNKG0SJP5hOPfa32XDxOASq5jR9aFh/O?=
 =?us-ascii?Q?FUwHvIOkPJAb73wvF+XQIYRKDgFwg0bhXJD63tDU6o9vsGBBJ1x1v+Yz7SQ9?=
 =?us-ascii?Q?b27sY8ocEqhDiq+hUiJyVwJcECIe63g2SSqQZQg/S3Ygu9so0cqfe++5iv6M?=
 =?us-ascii?Q?3gOO5kxeS7EE8QG3rQ4YgmBT8jStH40J6wg7GD7W6xadX4pxtbmE+k3a+ckt?=
 =?us-ascii?Q?FRez3JHCAjrPEkpsj3CYWWa8mu15Qz2DXL3MbaX76R+NiL/Kbues0ijSkEjW?=
 =?us-ascii?Q?PxrbjeMXGNMPg8ibBowNkBbPCCFOaXeX795Bi8tZpQUtvRSZTbp8vfrA1oqi?=
 =?us-ascii?Q?R56QADGH5CNg43RuQTi81YB/K8wzIzgfFk1iPZxTf1rDGOoHbgc9AmrJh+bA?=
 =?us-ascii?Q?sV2NQFHeSkzxNfLEyMsXl7esT5kGHY6ruSFi+IQs3MGjmwHGxPP7l4pCZ2LL?=
 =?us-ascii?Q?8hOKVLd6k7N/5lj0GLojWIZzGH6axrtvm0ro/ur7LP0HdqFjHTCbDUTKlVzt?=
 =?us-ascii?Q?uSz2T34sfkAqxhaDgtSbQCUkrWvBVMiFS0dchtpLSQyeBNpCr/2z4vrMX7gy?=
 =?us-ascii?Q?INHt/6Y9lzFC78UUEY9hfY0MhvOHjCI1pub7t/vBaQwXjJWJr04Y1ZlRtDPC?=
 =?us-ascii?Q?FHUj3rrfuNhiR4gUPV++65ljNqj4gq5iiQ3vadCZMNSf9j7CleU3eSkOKxS4?=
 =?us-ascii?Q?iLzBuM2h9R2NP9eZQe71AI/kBGs4M/bbp0Hf2EpQztleUwHSvVTtuUerAG5x?=
 =?us-ascii?Q?xrr3FYllWWHZn/16aG8mNOurA04W7vfYp6hOaKkhmoRck5FlJxy9SyRB7vQ4?=
X-MS-Exchange-AntiSpam-MessageData-1: uJpSFZlAmzdKRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf20ed-9128-4995-b907-08dec4e94cfc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 23:05:43.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvk397UbGGar0pdaISY3BqjccDtWBxcu82iB4WcBu/D1bXBIQOaszu6aMDtOsCM6An3S35Iinfnf3AfjMdeC+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171

The module firmware table lists booter_load and booter_unload for every
chipset, but Hopper and Blackwell boot the GSP through FSP and never
load the SEC2 booter. Those modinfo entries point at firmware files that
are not shipped for FSP-based chipsets, so initramfs tooling looks for
images that are never used.

Declare the booter only for chipsets that boot via it, matching how the
FMC and FWSEC bootloader images are already gated on chipset
capabilities.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 366d3b76360e..977a306ed471 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -427,19 +427,20 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let name = chipset.name();
 
         let this = self
-            .make_entry_file(name, "booter_load")
-            .make_entry_file(name, "booter_unload")
             .make_entry_file(name, "bootloader")
             .make_entry_file(name, "gsp");
 
-        let this = if chipset.needs_fwsec_bootloader() {
-            this.make_entry_file(name, "gen_bootloader")
+        // FSP-based chipsets (Hopper and later) boot the GSP via the FMC image
+        // loaded by FSP. Older chipsets use the SEC2 booter instead.
+        let this = if chipset.uses_fsp() {
+            this.make_entry_file(name, "fmc")
         } else {
-            this
+            this.make_entry_file(name, "booter_load")
+                .make_entry_file(name, "booter_unload")
         };
 
-        if chipset.uses_fsp() {
-            this.make_entry_file(name, "fmc")
+        if chipset.needs_fwsec_bootloader() {
+            this.make_entry_file(name, "gen_bootloader")
         } else {
             this
         }

base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
-- 
2.54.0

