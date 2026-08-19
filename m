Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E63C2B9B
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111573; cv=fail; b=pxFpF43HhLASbG9o+4K1OPYWIJIRoJArMPyC9fDewd7zrJtdfSpIAd1VXA4pS7K92b4bNEBLP0D5jLH1QfYog/uu/8KZUJTLQr8AYwSu2s3hGU3QYAOZH6wesTor+DhecPuoIdIMXZAnSbRxeWgBh77o8q/MjKjaGmHFnFFWO3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111573; c=relaxed/simple;
	bh=8QTFKLhm849213o6N4ebAp7jCSvMZuPIc/ZwfsOB7FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGdcOwOHF6n4aBkKLOc7uDFxXc7UmwjTL8qFSXbqsjNfYdlJcPBislwPnsNWo03PrNnXJvqvD2bLNy6SARtPx8an4OXHww7S8Miml+a6oglW/IE4RS7W+1o2nfCIo0+ncb+rKz5S/XCFO87u6F0V33C/OOuHovFRiuhHzsRkjj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JyCepNil; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JyCepNil"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlugu1/FzGgl1MltU2gvSjn6Gxt5UNGhfTxk4KrZSLtn4chboJOod8XjkUy1hiPIemMk0ojmQQ68UDSZI3j7zjpWXEussUJeMh06coYPUDFnhhltrHMJjci/hYRUuafSyHzSmfjyFwTRFa5b95PL9JJ2iyZbt+jkF9TPlibzguY4e1byAPyj3p2+xiz9Vb3eyRU+h8etJbUsOu1pvgOQ3Z0RdNbhnTrKsCnNjuuz2hY3Ufkfz7kdmW0FNYyst91y5DGpilmgqPNRwLZbAijLShJOyI5BAfY4fMbdJ7+HUlqgf6llzOdd0mIaMUmIKqziS0JMZsJ5CS7oFcT//p3i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+2jtvsZx3WfouFA/ZDP4WyCkygX2kmYZchG66sbX0g=;
 b=YjvQAr5dWKcHBqpagdnbZzqNtVHzYqBVyLvscoF5ErycC3fJB5se07/yPN0321Ff6n0FukDGCpBwHyPZXa2xG2qU64uXs4dlYrPon8m4dAJEYiNT1Hcnxhf7A9KUgZi4pJ0/o3b+zdQLbmVELIYVPIfoMCgmu2mky5Vy22UlXp4cF6OVaN7gNnW32pTsoa4Fl+K+5dmdz9wtTZNCOS9ONWgO0THDswZ2HXIIGknPUg6bqMnNRtqXyRdE1+ybOCgw68J/VH3PGxJbsKuL/vX8jZtZWoHnNP/QYK8o/RADEVjp/82ygfl6ed1iz92Y7ALeLA/DkwuPn8CMecKojmji6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+2jtvsZx3WfouFA/ZDP4WyCkygX2kmYZchG66sbX0g=;
 b=JyCepNilTk3MXrGzwfknxBqO3o7bOrTOrfd9JZsjxVNSUo9+LmBptp8cYxRpJUMSqDANBLgfv5o85zf2lRQJUpu90d//MxznWKZn5Urttcz+dCCp918dn/3UhHwwOj58Z0ee2HqbDyKrDSwD5PEM9f+DwYdOJy2xmPlOMmYWgJPwyABO1ZEmofSUu+zGR96ImMyLhEilrXcWCHQmDiML3hjBTWLQA75bIELA4P4S+u31iIHjBnxQZ52jvm/N+X+zF0rKVrRL/+G+vYv/RHkxgnjbwFV5DtyfopFWYOREgN4lElY2q0aEXH9q1DdOn0wMuSzEXdEgNZ/UB0dTIn1mcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:34 +0000
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
Subject: [PATCH 10/27] gpu: nova-core: rename the FbRanges elf field to fw_image
Date: Tue, 18 Aug 2026 20:52:03 -0700
Message-ID: <20260819035221.336390-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ead2f39-5bec-494c-253c-08defda54d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9/GTIbNZYn5o+B2fW30Ugcwdd27fHTYIECjxAZkCbS8M8lVdqo05yh5tb7/1DsDswArlrLWE2PztjMzMHW8aEGvTyA/w0TJr4sLe2vCdfBgVY8G3HTYe6n049GDXosxGQ3hMs/Wrwoy6D6Bz8pW64hxG+udv1LR0KTLxWRx+Rmdg1M4NltRCWZe/r8gaeKIysk+SophY/UFxkhzHzRaS4ieqoDJXd23S5R1tYjx9MTnqchjMpaxX9XU1/KAR+Xi3Ugr7jhkI5aJouinN6UD/uG93tlD+9q4vgC7QoPfqyDvGkc+lac5eBJJC9S3b6Zivtf3bvRI8Lub7eQQbMdBw3GBMGpgQyw2iUF5xmZV610bvR9HhrZvBQDFUhF46ynDS/ZUVckMg+usoV64IS02ksZS3nBhCW0C6p1DVRmkqqoOI0sCITetxQgvCZTufPyMN1ZSie8iCtSGT3Ipf/AjNyWUW2YZBwkWd1IgGu7F/NYQTSd81L17kwJqCH63VWenN9/XwtFce7Ke3Un0OLHP4toxdyV9+eNZTXHQVJJSdEgKbEH2ca4luAvtkX2MI6h8wNQ9S90XNG8zA5QnLRQVwvqqkLhpaF9g4+xYojDkPo+W0DsJF66BSF/GwMZEU5ccZfdP4JrVNoowH/pEflIM4atLR9OVWvjWO2f8sgd1RbUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jIVuIdq30xE1z4eaHr9gWZcLhLF4Fb5H0Ae24EsQ71XxUzJL1MI2bPtyLfiX?=
 =?us-ascii?Q?z+ITyV97942ejsxTDjT96ebimD6+dwWvw408yqCEDwgjH29XPgS/kgEhR0Dk?=
 =?us-ascii?Q?U1dYu8/nafGv7ZFrtfliWd3Ntqfw25P+sPhcbt+RRHVvAnAkRwihI4I6wtRu?=
 =?us-ascii?Q?CcjPHgBj6M1yjd/2DW3Xrm1YAdqi5/reJRMSFYIfoDQTFiDSyXPIe3ZLur2x?=
 =?us-ascii?Q?dyK42KKWSdtpDCDEBI2EnjmSFF6jU4ZXLjKCYBr2cqiQpToRK8rhZStjRdYu?=
 =?us-ascii?Q?aWza34wG7Wx1JlOUuxXRWrzQsLWpK1aXqTFhLebzHBMZCqyG86oBScFgz+6K?=
 =?us-ascii?Q?yR94vTagtiG94Gq9yMvFCZ/Oorn3lcmV1I/uH7UGIECxrLPEI+bu6iooMa0y?=
 =?us-ascii?Q?oKVhQBO9IRxwF56jWhc/DoaSv3q66n6He7RHc65SL44bL78HsuRh/eMkz3o6?=
 =?us-ascii?Q?EKKE7kwVQq4JxvP/31kTYy4/X37+uKf+cxKuGRwpK+AhFUritrIx5oZh46In?=
 =?us-ascii?Q?FpbAlAAI28INzYI7EJyATF41+JvI669+akxoPDklEvwItzZ8WZ5DnJBPKv4N?=
 =?us-ascii?Q?HyjMOQndW4eWCQOpPr+yYKcANaIByfPgRuGRvr9jSgZGeeI9QLoYxMbeRYlZ?=
 =?us-ascii?Q?5eSVLjvGu9x86PfTwNygfPxKHtwhANaXu87BmuHAcGMwldW8aSZF/j+PUVVR?=
 =?us-ascii?Q?p/1gONjx5L6O5okrbtTis1KEgN2Yso//P8AqrcSaWfOIZoG10vaDH1Pm45HQ?=
 =?us-ascii?Q?Mph3AJsOuzGkS1LiaPctL8ZkSDBW8X7vzqUXhlV/IXfLHNKpzsQwWMX4onFD?=
 =?us-ascii?Q?A/woLjue/aZ2jjeKBMSmjv5HY12cphpTrptA27ZEm0nMaVPfdJ21Lg9NVDwU?=
 =?us-ascii?Q?0EXNhfv1qJCcHXlOTi51MHTL74YICEuIVMNvq/lf/kBtS73I6jsBeztuHEvW?=
 =?us-ascii?Q?H9p+w5TqHXm0jO2p+leYCCUOK3udlvw8yN+H2PPJnHT8BInsGguUa5cL1ZwI?=
 =?us-ascii?Q?81Gd4fV7yALghavMOYcWRtKSRuw81d/wTXjIQismVWREBUNy0CFOdcK1Lefg?=
 =?us-ascii?Q?vnFMJeRxRb9bahS86ZGP4ovue7KOMqn0U/ZQkdk8agE+ikmHdbmNVAQR2d39?=
 =?us-ascii?Q?rvIIHBMpS5P/v3ZCxPKi++qlNFolZ+V+VwQlgzcI0VcFkiHRLHb1oYbHpJc/?=
 =?us-ascii?Q?8OhZzb8ijvPjx8aj515GMCX2AIy9yO5RZqjY7Sk5ex+7yVfb29T9E5UoaA/L?=
 =?us-ascii?Q?M2Li2sF1UkN/pmBItVnhkx/amh47+Gqvu9SZQK//KSzU1z+/NZko+1A5GSAH?=
 =?us-ascii?Q?z+6eubJ8jG08FrDTYpCerWOs9ENkWyVhtPecd/pDxJfvIJWJUE7AXOql9bfC?=
 =?us-ascii?Q?kCubDmI8ZQHUeX45fCfXGIudtk7gpfl3vlmCQiAs+d7MrgmN+s7sPPSr77rF?=
 =?us-ascii?Q?WLRwhRrRS6jPQ4sSbxzqrbwZ1ELsZRIxDtyG0wjcfZyHm0JJ/nINPckElmqN?=
 =?us-ascii?Q?zzJCOugT1Gj8jdCSYxM4BfHRcvu3lQzCAQ0Sl9RPM6ecGY4Yc5F5VBMRk33m?=
 =?us-ascii?Q?qhGPQIHN40AAvyt/DG/Nex9h50wUdYkqguVGxdJPKfFAaevEKBoFsiCvm7IW?=
 =?us-ascii?Q?ikSEZA0OpNT0/ghe0GfU8kICoc/UMb7tElefHQGfSnRxdoR/+sgLmlLCBKhH?=
 =?us-ascii?Q?mldkQZnIsL+fLpkfD5XZVHEAsSlMq7eXT22Fvp+Hy+aBK/sGAStbVW4OpEed?=
 =?us-ascii?Q?noygA1LZpw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ead2f39-5bec-494c-253c-08defda54d72
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:34.5044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyOsCymPyChuIKzJBR3qJ524fpRdl+ftivAM46pC4tZWnHhvXxYKBVnBEf8VJCv0+90S3qxHe+l3qnyau3fukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The framebuffer region this field describes holds the GSP firmware
image. It is an ELF under 570.144 and is not one under the firmware this
series moves to, so name the field for what it holds rather than for its
current format.

No functional change.

Assisted-by: Cursor:claude-opus-5
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

