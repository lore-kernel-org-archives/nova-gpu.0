Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594502E542C
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363739; cv=fail; b=SRHF6iSJ+iyHaY/rUthbYduJeSa1Ff/0YRytDCLag7NsD+MvGCDXQsgtlidn4G1DjfmqXTUcg1xK3fmxLbhOO2OPX8SXjTnmeUELUr3nAQpDGnmkjJvt+J+UEDqm4rK0kBz2w1JVA3m3TL4CxkoM/7V9whGKO3KA91IWpzjQuz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363739; c=relaxed/simple;
	bh=sUWoS6qF9LuHZSra5BqYgrxPCB93w8wFrMO7OGy0ekk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TikxkF8v+yoteJ+c+KQzo0f0xh9lDlupmtwYkwYDaluqMKekCZADod1JsXYxw1Cvq2D9FvEX8SFAoRcJHaI52JBwxHz/IkCSB6IOknialyRtsLM85x4h3K+Oq2DhZghkvqRb3Ki8kzdQkE2gGDZVn7DV289/dUIOvOKp6E4fb2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ROo6n4ui; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ROo6n4ui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4A7GCXxB2RT8igglJjwnzkfUAb1z59IhG5kiPltdnGIcqbawsiU9SFPr2fa5h0vUBmPa7rMvsSQwf9yBwOzbFcl4Jy0FEAHzcNJyUhfRIxjwYVMYkol+ZzAHQz+cYJ2YJznbOFPPgAdG8uqtCbA1KwjuOG3DGMS7ZOxRrw2S77w8RvchFX+1hDoBayr+Nbl2G9J29DnAo299GR3x5LkWqdBrbeRH333P7dOn8TQffH/GgkQFjJsY5poqxZCKz67mp2Igi6nNMWDwHnD1TCUDQgahBHCIqH5Tq21CesmD1f/D8LJYJgr6T3UKr0BKseTqqmbgajGzFMZBhpRFV75Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByDSJUA5SanP355JXeYXnGcDdcWmoShMM7IcYt5bZXQ=;
 b=Pg/wkuHzhvVipTwPxXxekV5cwmfaAgHmsP1FSTFnqXk7KgNeWHdHQh/G55mcaM+4XZ31xWay0TFOlJzPdfmohVq56OnXSspDnA9LWmWnhHeQF7SLNDji1sHTGPD0lHlhZvmsbZA6Ek4XrQa9UyHJQTybvoos0Chu9v+RcbgPlSg/YVnTWAlzzuGTmES8UjI/XyB6h9WtpO0RyFftL4UeNMKmTW53gJOxYfw3/S9OGEygr4lw86zpcwjtb7DKtWz0rgUPkzWMUglvj7rJjXVG/TJL+bDJqswe4RlGMiGQizzr4lauUjYFPs+pGkXAkhx0rw0NfL96fuhwuwNLb1vcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByDSJUA5SanP355JXeYXnGcDdcWmoShMM7IcYt5bZXQ=;
 b=ROo6n4uizJToNtcSWaQc/9UcorJ33w2zQFUgHUohUzg47uW/XqGWWvMsd+S8FehKhNTbwlgQ2TtN+b7gAD7GCmNipn/UKXoTW+bH3tCxfZaSFVrSdq72spdW91qEnSgzouI8RgUgYXvB8YkAcdXUgvINLMb7yH752ZqQJxTEz+XGAbDQsg8i5TLNXr9F/vE1tzIq117OOY5GOrjsy7/h4etMNAcxrGdbmRXO/J+a1vfyhef+719QezdT1iZu1TaFnWycZZ8EI69LmoWtN0dS54jWD5X6cpRm3YQb+LCDDg1olLADsMGJCE46abcbVbduqjJx4Lmx96QAMIR0D7btNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:29 +0000
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
Subject: [PATCH v2 11/31] gpu: nova-core: rename the FbRanges elf field to fw_image
Date: Fri, 21 Aug 2026 18:54:28 -0700
Message-ID: <20260822015448.238214-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: a56c09bb-bfaa-402a-3615-08defff07176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XKQtEyIQqP/C3MM2xW5LGXvcDJl5KsPIAEWaqiQT94eAbpD0Zb5SGuJaId/HcbLM/DzQssEB1r0nl7kjgQATyaJA4sLPVXyL5NHejR7OqLRSYIBBEt/Mp7vA8Eb7nKshED33e3C7mTkCJlzymfMkgb8SatQYkl2YlFqRwE/STA9X3anFRhwd5xT7LRtN7QGeblXwPMzFIenGqzKtbiupbYy3bYWnTlPjg315ajWv2QXg6PmOIz6nutF1tm0uhDeTfgXh51razFSyNoTUVcDhYZDHLmJu2a9S8NWnnh0eawYwL/yWQwc6nvN+3HwX5zanHSiF/3qEYKeI+t4IazQw3Cxz9SN6Uvrlcv5+KDw2D2KRMlLLVmXHCZapnVgjFmPkj5FEKeSB8QruE2DfBim4bohhSHb3mcPs1cHmsKE+ToF7u/VSusrM8VHQBSQVW4RVlXpq6vEu7krEkex1xmzlBCYmlaBeGuydJuyn4L5/9tE289Ty6Gcp0B0wiZUVzg7C3PTbExNJMFPoeuS+9PPUJ0/VIaYjbzbR6y5nmAexbHX398neJqwrUTHylgkG7m4zUF6yJxPon2ltm7heOpkuwa6CAaaLyosy7sZGcO465rtI+2aZdrvq39t5Hxt1phpnybDggKuIPtPmp0dgrEWr6h8vSrwDBcJ4XC0pcBbszgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s+MyAbD9ljcAa5IJ1nN2ViuQmSUKjMkVj4Cwp8sUkVHvuR2/3USg0/Ffb9ZD?=
 =?us-ascii?Q?MMLVS+br8L2o9Dx8ENn8u/48Gyk9NRRWNPXMqgnN3sd9Vcu94ZSGDy/6prDt?=
 =?us-ascii?Q?Jd4LNdSqkuHva8l7roqONb2Gd7L2mKjtyZ/C4nf6/lrToanY0kqMZnLjjlv/?=
 =?us-ascii?Q?gQsOeANPyzvoRaEcXNLO0UrANm6KVTNS8k9GBbSS4kaLxNxCTlHMK0x3r7hX?=
 =?us-ascii?Q?ZMsz+0YRaCPj1Zo4L/eUeP2gpcEDknsDvwuYbFQ0HdI81NNc0Vt+Sl9JM5WX?=
 =?us-ascii?Q?GvRYF6FPllKzBf8OfUCf2nIZDwy4FV8M+qZM8An0d+lzrVLsdBr7ee1e/TGL?=
 =?us-ascii?Q?kGsapFi485J3sLdbDC9llUENDZ29RJQqvzAmOegsl9fvR34s2Z5K2JxwlPEN?=
 =?us-ascii?Q?pPveR4dquQSGTsYk8o04X7nFc5LSAg6LHBebBz5mgGYY8RBcbzWFDAwwfZqq?=
 =?us-ascii?Q?cnba2DRD/xM1lKWEz26HegWrrMwVNoxkmWG6j8BLBs1xuWLmi8Chp/nkio5Z?=
 =?us-ascii?Q?2uVCLwT5OdznjNmE/kiuvzVO4VHXzVn1RS1RKZ7nafme+WQQX19dj3g3keRE?=
 =?us-ascii?Q?V8H+Eh49Kw6nQ5GIGhdGi8YAaE880rVA3lC1BPUymOLk3M8xs6eVJrJd6Shg?=
 =?us-ascii?Q?CpMQe+jSJkQ81jgJhq14X4euFBcgiW+BezMbLl2piLdlfAdEMrsS67w2Wl9A?=
 =?us-ascii?Q?rZQjOnpegOTOKkr3QGE++4fBUhpQpIeBJi0YdVsukXjj2IaSThpEOmr6/u5J?=
 =?us-ascii?Q?XOoDyS1ZDqYJuOWzcTIcdDvKUs5NHgETH1vtoQtsBoc4HzUW6/RpQV5UYiDz?=
 =?us-ascii?Q?uem10+9RvMS1I3hea4/S18+rd8/rrj3LD8vuAUo/DGKvBbROUo+VRp8Y7Slr?=
 =?us-ascii?Q?uxDByh5LyKjKUv67NeAv+YP3XymEwNQhnXwnCGVM/UuLr085/7hSMSZltLAN?=
 =?us-ascii?Q?P110jlAbfiSSd+CCyHKUuzA0YpETcUdv6i/lSZouzww5Jz1kaAfruNXb+mMZ?=
 =?us-ascii?Q?qPGZ69Je+2ophW4BzMXpIJ9Ag6EMv+6wbv0iNC9vEjhFbToDpvl1qOh1i6/N?=
 =?us-ascii?Q?r40dgIiifOK4VA8asLZU+JAnly59rimjuAWqn1b3cABfKHPta3gq7KjHMvkw?=
 =?us-ascii?Q?J3sM//NKu7tOF/LnsuCpXjwU2SA68W0MVPf8o9IxvQACaJeXjnAeImDO4BUz?=
 =?us-ascii?Q?33NFSvoMh8ar5mBAq8x9CTlaOov0gOTNVa8Z6zHofU+CNa7efU2I8ZKDgbA3?=
 =?us-ascii?Q?N12brhiVxLrmsegNUrLYxtjESZ+4zDJj2VwaILRrnQmkG8BmA8av/NTvZ/K5?=
 =?us-ascii?Q?QivJjxKpqq5z41DhQopvzTYU0nvf5W8NT/H3FHXUKFWii4KJPs/zPumQsZKt?=
 =?us-ascii?Q?VBFJCCgxmMPrnvIwu2bAhBN0jD3zuGrm2vYPwyhJXEs9uCw/OvWh2yTqELxs?=
 =?us-ascii?Q?GZdapvkftoSwe4LB6EyrCYEdZEqb0WJ2IE/wGr7KQ8S+WtgEttQCbIYGJhhq?=
 =?us-ascii?Q?eqwK5OgrfBYHNXjzT+foxlhXnsB1pflVanax/wrrf3NHsifTORDvbIC/K3P0?=
 =?us-ascii?Q?uqSvRJc3F/8svmpmzvWqHZ37L8cU/tM+n4MMHVbakh3xu2XRnRsd+FnSN8Kb?=
 =?us-ascii?Q?FEWxRIEe/uzwlUB3xlBbzwUxAi3EjsIrnzaH9Hqj+Wi5pLStbDQcMfB6X9Qv?=
 =?us-ascii?Q?/ErNw2Z02YpA+Has/ywCp1OjyRPUXxYhFBMxN6QhhGZ4D4Upk53q/YjqXHxU?=
 =?us-ascii?Q?3OPKt4d3SQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56c09bb-bfaa-402a-3615-08defff07176
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:29.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZZ2d70owJBqQHxIiI0wW27oD1qAxsFUlWxKOaAGeTvE3xnADr5IjQnCrCYZo6Z0nvw5uL5HavsPDo+onMhdVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The framebuffer region this field describes holds the GSP firmware
image. A TLV firmware image carries the section extracted from the
original ELF, and that section is not itself an ELF, so the field name
has been wrong since the driver moved to TLV images.

Name the field for what the region holds rather than for a format it no
longer has.

No functional change.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 +++++++++---------
 drivers/gpu/nova-core/gsp/fw.rs |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index f208d6deb5e3..6952f8a6bf9b 100644
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
index 857d53c77297..d10677e277c5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -206,7 +206,7 @@ pub(crate) fn from_ranges<'a>(
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

