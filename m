Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094D9263F5D
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363726; cv=fail; b=Sbk5cSwMBGGNE/Kd6WTDSxCg+x0/tUaRMBMq3wqJb9SxVcCU/RZzQxAL3jju6ZvY6cUsA81/ghmpU4YF6VsX+C7aJB20AKhflfbC67ORQ7s96V24ItYOzRoCf/S4tD/obGrtm8xnewMVV/hZx7VeSlIMB5VX2/28wlc0NLfELfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363726; c=relaxed/simple;
	bh=1CQuIw/9q8Lv1Hr059TJWuXDuKm3QAlaTiMXGAGIr+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ra2uA+emrVqt8VyzLuKyuQuzzburQbr0OILBRJwv4WRtoTfQoIsxHCgbjMtY/EFHoffqthsK5Kxlqcd+d2uV9KKFGvhgTLRwWweLWd0Uugs7dWEv1culzOzxh1X/f8JrhrRVNEYccdi8yqr4t13/cm2xwMpDblcz4rCmTUqXEYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GWr/0yNe; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GWr/0yNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvR1ArXLNEh7ddKGITbLa77E9VdY1M4HguKxvO7pfqvAUgnvS1fWt4nkzVDvGqZgwAqa8cDKD3yc7ZKTpuprLl6XzY8ZT/9PRtQ9yAwlgGJZakl1f6UCeZEaYOIGbc6WjWh4HCrJVyUIjZS2bX8G2JEw2g+00hhpV2rTjqRSaPACODfg4wlgQa6/XwZHjr+HbPEELS6cIL4rhS2e/Y3ORw7CFuzjdgs/iqoNjIwufPGY16pst950zBhjJMwJTjNnf9uOr70lDFI9IFHVmsBFZpf734l7sT+X7rkWgKfW0WrziRLHsM5KQ0O2x7r7POGixlvPCDEbDdjavjIhV710Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKIoOIgRiSzjKXYo/yOsYcimsSuzdv8N7JrugyG+8XU=;
 b=OjbhGXIDxqtDH2uj0x/JGj3Cl0KFvXJPPi4sKuzfnl2iCWoeZO6C0yirAD0tw6JogDQCYhsg9ZUgH0wYvpvKRp3q2mY0Uk9LERbWIgcLNJG6wUX278FBNzGdJwQ38ct6B/MOfZ3JH6mh0omg1NjRYcYjtlNwsrqp7Ku2OrCktgitdkDQgnYqvyDTunPkHD8T07GO7BrDd6QGlqjXalc6dV7OpTbLy0FYECADxIKP4QgJ7x0bYBNOVI1RJthP6gMp0Z8SiiS0e3EvEIup9mvt9RH8hr69SxuRSWkJww0lifdLzh7WkVmfaBUPzkRJ0rAU2srTvu6RLc/d+p3OPZIj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKIoOIgRiSzjKXYo/yOsYcimsSuzdv8N7JrugyG+8XU=;
 b=GWr/0yNeM30BHcOJxuPFif3CeJKalidRR3fx5/Odk46FmtbPyZO1SncH/MsZVEEDzsFq5niTaoHo4sJ4K0b96vt9Z/92Kg13HpzYimHmMjt/TMKh9rH+bqdtvHLyZGCjnT6l5ZYipR0as4NsxYd9bIotZvIa5chTiCfqP+Ft1cs2IUiwddS2wLYJYsBoUM3nKNmrQ388aTqo/pDKT4+2j06ykKvktfiN1adBEN1gbbeJB82TcTByKkfBDxeJR37U/9H+BdUn0JI2yLLZYFi0Zt9Jw4z9gTpf9ZFeHqc/LusNv4kev/0leFdgHxnhH4lXV53zl5xO4E4pLnPK5P682w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:12 +0000
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
Subject: [PATCH v2 06/31] gpu: nova-core: zero-pad radix3 page table levels to page boundary
Date: Fri, 21 Aug 2026 18:54:23 -0700
Message-ID: <20260822015448.238214-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5414f3-4601-46c9-ba97-08defff06780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9MuZuoKc+rR02pbT+8To16H4y/t9tTmoe0BU4F55iOP8t/xhBb8Burfl7zDYdSz3Siu5AY5QwvR9YwLzBVlfqadFlb9PrecQdjl5kIyXafic2afl97mU5mFvIGHcla7sisdKmiioKgLhdG/tqZQhN1kxamZJoYs+anMy5joo1raRkHGGd2aCdeBEwUKxnTUbGDkyZg08ac1d0jRivhWFQ3zPmYFz+AxAeRCS9DeTNZSGUHsgk6s9GUYkD9lByEXAeWcf5GriIHhpWCOOuNZBtiuqBji06HWpMUUZqx6p/qIVNnRsQKj8inprfJGaWB6z7MGwGEJ/q16iliB96rq2nv49MTNDNYQA6d1JagyFaRBeA7i4REbhGJrRcEGQsEkFxniueg7ysU54hEG5ynqo0y2seiwh5SG6xGAeiu/BQ8U8UP6ZRtfvBVH1pTPf6Y6O+pfjwnUiMVwqfvDe2y6eBOObsPGM8EnUhgGHhxli2zah85kAldOhYboD+DpgeY+9JfEtNjYG4BVLO8DYimr+lqCPfCoc7uf7bxbP2XTyz1K97W81ywlz6SCzDAr0nucFAS2cQ96X8lp2IPpOskOf75vhY/bgOodapOxcUCwAscH1tfPDjqRZlBJsUMHJx5fUsdixfbXpIwWW6PTokK+d+xp0licVszbD9pgrjBCJ3Mk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?10XyT3RCDzWz2LjOj9j9ClyMZvxCsqADNvCShjTE2L9/1xSIqKQIBlmqi10h?=
 =?us-ascii?Q?GbGob/uMvV5t6dL7EsvoqSpSaecbumSprSXGyJoPSd2G9SV3h8S2Et1BfBM2?=
 =?us-ascii?Q?9VL+U7PMc7DaRETvPhmMaVHg6QKk+hjWslZJRJZAu+OaP0WAwNw0B+Zhnf3P?=
 =?us-ascii?Q?zth5F5Jy5wZIJ3bjr47SPSt4PC72TqbQ8xRC+ScgRBj/qv33noU8m0tYQQ4k?=
 =?us-ascii?Q?OsWwWVcHNa43Vv2Dd9rqptsNu9byhvL+4TqWlPXmTe69YjRomVWdDU7ZLudA?=
 =?us-ascii?Q?i2vcR40kaPOvacZulLiXDIyLGogMDGfzcy/qfyZ96pCGmYE5CSEugyo3T6nY?=
 =?us-ascii?Q?6SSqUTEbzeDad9ApohUh1ZqlBSo6/8XoZ6sC6RrKqieEt2ZrKsWMA2tJHdok?=
 =?us-ascii?Q?tpgpnWNkJ7SwuB9sjk8I2RtYkAVl1YmaPOpfxcFuVnSyCc37sJpAG0ySkCt3?=
 =?us-ascii?Q?shn0B/xmOSKfV/IndXK5oCLSi0m0y+tJtdYqwQl5c7WCMjI3iZfspjo9l0dd?=
 =?us-ascii?Q?WGITz4OagoAkVI8KFIOjLyQNM2YdGqrs5YUQQrvHMQ5sacnyzWpVLRpt288l?=
 =?us-ascii?Q?WTDKlohQmRVp8Un1WQxVkihqXLXu0cjRfOaaqFDsVRxhJoKBbrIIiwNJJsYJ?=
 =?us-ascii?Q?ddV/swUMDexiDSScSsCW1ZRaQMAGdkNno2uQxjtbxDkQUxYjeGueeNH1j2R4?=
 =?us-ascii?Q?637Qa7KgHjHouUZyQdqtX07/8VFImxU4Ly7ZXXnUJX/Z0/VfI/5roX+5NE6x?=
 =?us-ascii?Q?GB7Rb++ul7DEgbd2+mK2TFRt7MJcZErzMaWMHCX7cXqJuVk1Vcl9ane/WqHS?=
 =?us-ascii?Q?B8iUXvrHK0DPlto/3m5jG8DjrYTlQnxChrGer/aP1WsQap2zxhbnC+xo8d+c?=
 =?us-ascii?Q?PS4033V9pD0zybOsnO2ARoyDO9dUVo1qI/wxqUE/iGyV53hzqhaVYlwSpsjE?=
 =?us-ascii?Q?Wa6zlayR4uxEtINnoKW1O9hS7clU6OEesiSKAIllBiYVflEAxi0plBDDSfgt?=
 =?us-ascii?Q?HsZra+7KVN56pB5W/wuvIGm4oxpojXlqKgLjb2R/Iq8vRbX+65RdO4xCw5TC?=
 =?us-ascii?Q?r5aMKHaa5JkLdep4YXQKKBVTOR+a3vguFUwKsqFMRTe/R+MyIOTDl5GBWR8K?=
 =?us-ascii?Q?1QOAWnLyt3Qt7Yr2fCOR8X4GeRprftbYmqEuW8mdS+rBEHYsM83MSg0Zzguu?=
 =?us-ascii?Q?mvklo2kkoQVZQoiHanZ9BtEp2KRFIHcTNrb18qq3Glw+qcEvbc895iVpEEAe?=
 =?us-ascii?Q?/5i2oxi86S0iyvfz7TWH/V+D6wIkcuQA8IpSo26wvkU4cRErJYpYPHnWGO91?=
 =?us-ascii?Q?oYL8e60KNS+t2GvnfPn4nwgP0r3C2ER4dyuZjD5nr9bWATlepoMBPAro9lbl?=
 =?us-ascii?Q?J4d+NM6dZKxQ/ouJLctZdqGbLOzpFrryhzBGNHKsCr5M5DUilFu0azMal4xF?=
 =?us-ascii?Q?ZDnF92I3D/4r5nTZiSavpfARMC7BOx0ihAf8mzzd+pJaTec+wjlZYAtus+F3?=
 =?us-ascii?Q?QtNFjcT+46+qqpnmUkqYnbLzPgC9G4MtVLSKm1KkYcmGYXTq0VVFzOF/VK9Z?=
 =?us-ascii?Q?JwvEMn3rr9VJQPBufjWhcjfTPa9q9jkFbsK1+P4kp+X9hbQ3gJOE+df1UIdz?=
 =?us-ascii?Q?CG6Uo4CW1hPyLGRlQe70IseD/MnSqEPHQLDxxFivpvbdDVnBzjzQi5/6m5Pp?=
 =?us-ascii?Q?mwP8SqLGpVYT2gzGTAH2t/7bk2oQiUWppIuOEY3Bb7Nt2snUud7yGVF/YbCY?=
 =?us-ascii?Q?NB8ZCgGqRw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5414f3-4601-46c9-ba97-08defff06780
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:12.8610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QLlsDUMslw+4ZmD9A5C27hctpmNJnAIgyHIHISqMGrrSZSHOyHJI04TEJhZ4zXp8kQeiiFaxAmqI3PsUAeFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

GSP-RM allocates the whole radix3 page table region in one block and
zeroes it before writing entries. The booter reads each level a full
page at a time when it walks the table, so every byte of a level page is
firmware-visible whether or not it holds a valid entry.

The driver allocates each level separately and writes only the valid
entries, so the last page of each level is only partly written. The
booter reads the whole page regardless, and a non-zero word in the
unwritten remainder is indistinguishable from an entry.

Allocate each level zeroed, sized to a whole number of GSP pages, and
write the entries into it.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/radix3.rs | 50 ++++++++++++++++--------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
index b60611c7bea0..b0630fd96c01 100644
--- a/drivers/gpu/nova-core/firmware/radix3.rs
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -67,22 +67,14 @@ pub(crate) fn new<'a>(
             Ok(try_pin_init!(Self {
                 data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
-                    VVec::<u8>::with_capacity(
-                        data.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level2| map_into_lvl(&data, level2))
-                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+                    let level2 = build_lvl(&data)?;
+
+                    SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL)
                 },
                 level1 <- {
-                    VVec::<u8>::with_capacity(
-                        level2.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level1| map_into_lvl(&level2, level1))
-                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                    let level1 = build_lvl(&level2)?;
+
+                    SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL)
                 },
                 level0: {
                     let level1_entry = level1.iter().next().ok_or(EINVAL)?;
@@ -113,19 +105,43 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
-/// Build a page table from a scatter-gather list.
+/// Returns the size, in bytes, of the page table level that maps `sg_table`: one `u64` entry per
+/// 4KB page it spans, rounded up to a whole number of `GSP_PAGE_SIZE` pages.
+fn lvl_size(sg_table: &SGTable<Owned<VVec<u8>>>) -> usize {
+    let entries: usize = sg_table
+        .iter()
+        .map(|sg_entry| usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE))
+        .sum();
+
+    (entries * size_of::<u64>()).next_multiple_of(GSP_PAGE_SIZE)
+}
+
+/// Builds a page table level from a scatter-gather list.
 ///
 /// Takes each DMA-mapped region from `sg_table` and writes page table entries
 /// for all 4KB pages within that region. For example, a 16KB SG entry becomes
 /// 4 consecutive page table entries.
-fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+///
+/// The returned buffer spans a whole number of `GSP_PAGE_SIZE` pages, and every byte past the
+/// last entry is zero. The booter DMAs each level a whole page at a time.
+///
+/// Returns `ENOMEM` if the level cannot be allocated, and `EINVAL` if `sg_table` spans more
+/// pages than [`lvl_size`] accounted for.
+fn build_lvl(sg_table: &SGTable<Owned<VVec<u8>>>) -> Result<VVec<u8>> {
+    let mut dst = VVec::<u8>::zeroed(lvl_size(sg_table), GFP_KERNEL).map_err(|_| ENOMEM)?;
+    let mut entries = dst.chunks_exact_mut(size_of::<u64>());
+
     for sg_entry in sg_table.iter() {
         let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
             let entry = sg_entry.dma_address()
                 + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
-            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+
+            entries
+                .next()
+                .ok_or(EINVAL)?
+                .copy_from_slice(&entry.to_le_bytes());
         }
     }
 
-- 
2.55.0

