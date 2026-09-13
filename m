Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B143ED3CE
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 19:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329272; cv=fail; b=uN5EbDWjz926/ABawg+KKSWTIJnpui2VcWHi/PWeJD01PfgDnLkZrCgoT48F3QCS7WI9ZulV+q0m9nvZy5YcITDXGYmkzQkYzKhlFIcjYvnG8jP3qwJ4/KAVGNRdXWwAQEBIg+fqRFMRHjaM5uYXcWp8c2F3Zy43nF9zrN9HTz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329272; c=relaxed/simple;
	bh=wbPd8aQ50MffYhIrUlrxxk+a6t/kKsAjxB2+agmn/Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ATFtCk+VYQfmo9iK2pMHy9FLBAIAM2FVDeuJb/gpoWKrnwSAs91Ux6xYHRQ52s7motHQYmbWv4JDv3/0OAAlgTOhqSUpLTjIBxcxs1zq2cgsUseMT8ebGslPmI4BZ0dh1cpx9UsH3Rr1ScVAIgd1kzKTEhrudeVPFk2v3zSQ7bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GIRwUv0M; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GIRwUv0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLwVULdzlusES8b1FY+toWn2pmhEMotSouytFm04wyZea1VprUu+BqzfwSzBhwYc8aPorF10qqxHgRBjOYXLV8MOQCnohM+/FsFTbGmnhWTH40ojaTGHFyu9Rik+wRliVCj2p12x8b1bziDyEatVdh+4/7/VJdm67N51Ft0JVo5jejPeGp/mNnrKqJE1NyH5BdWeQPAmpEroXSXBF114zTekJV/+/8G8iSKSW3CPjl4yWLf/5NJhCH++pqROOxnQdqCalvxMmY+BH2Wl0nXE83rpt0H4pfqnhJMZRIJ/+3bmnWQF2uXUshJRZd/ywL1xbZ5eCyh7x2qjV77A1SRvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0FTsXBeyXKu4R7xYZN8GPk6t58RyuwCecpHDErdSH8=;
 b=ssqd1TkYWOyw8X3DHXt2Gh2WyepUdYHlNpPMsCFzlIUrrRWqreR3OCC2xtWag76LAPCRfGwAde07mOnOBBZoHoS/Nmo2EBAsfwY0+zEaIwzq1IshI7V4EsvQqnu6YUylaQeM0L1bneP4uIs0GBPPv5tCFZoV71eDyhlD0RJA3qD1UIFQKdYEc2YVh/VX1X+zclIg5XblxC07b25+a/jpId9/JOiYsgcdXDIsOufC5MRJYIjNKP9YVN3Brleb7Q55zk9cnh2y/LHthufMFZ821q4emdiXuRBZsUnc2Zn5PIE/pbjX4Zyq/ihqa4QEzTXbaPy4f7x2Md52ALkMIgksYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0FTsXBeyXKu4R7xYZN8GPk6t58RyuwCecpHDErdSH8=;
 b=GIRwUv0MIfkujYcOD1YA8xAAuepSCEPv5ojIbIxDPrZwfQA78mMkP9jl47/JBFPX8D+XhFksH8+xXw0Q9ifV1Cd12FaspVyQHdSvXZdY91TyKGhQGVLhW7zoYcc0LtrlUP4VrW2AYrO+Hpgmi+B5m7rKAkhU3lN6wLSdEUVmdtLd+oMvGPHk+JnfdKGKreAsdd2aBRikChVSunPv9ZT2Cv4CZASGyD6AT/J5m1Jl/nShch67/scUqub6bv2SF7eXIONRjsqjZj5zwRs9IAWi4DumBG3YeWcDq/UGXC1iomWdzFDFOwLeqlXbux8py58TXnwtOAE0cRZpCwQjEAUJyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.8; Sun, 13 Sep 2026 19:54:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:54:23 +0000
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
Subject: [PATCH 2/3] gpu: nova-core: zero-pad radix3 page table levels to page boundary
Date: Sun, 13 Sep 2026 12:54:12 -0700
Message-ID: <20260913195413.742143-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913195413.742143-1-jhubbard@nvidia.com>
References: <20260913195413.742143-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe25c64-c1e6-498e-d9f6-08df11d0cef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|7416014|11063799006|10067099003|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	tKnZrQTqjogkP8p75WtPlOBvQmMMr1SMJMrZD1COr953WdeP6MSwwuPQZm8W2duNvc2ScgYg2jr+nuRqe9GapLKXud5OBBv7wUc2iwDzzEIw0RVZTkRN86alXc4ufujwlaUbB4vmCz3+bhHBSvy0UaPGzsSM5iuC4W3OFzMbfdGLGmUDApY3EPafFnKMkPLDDKAM3Ys3nFm6uCQvlMZSiYl5cneE1iL2EiBqvQnfKGoiNhdoYyRn5AJ9wpdopaynOCAKg0jDfhjZn8UM5YwXvRuNmcAB26SBTkWFLufNnTxwTdFa0MOjn0c+k9A/UDBQvh9EjYFrU5JNQ7PHpqiJ7qfdAv/2chVzCHYdrT62aer18to4f2YXdFrA3atv6OOQgaIUg5IJsN0ZOHbf6VUzNXPU+kfFxJ4+hpenk38/BTlZJKvgG4HDYCp2yK2xZWUiXkBdCHQBGkK/A3AtBy7ZERl4yaH2OBU3Lynf9ILjMpIvOCQPzLZkhjMNZiE5e+McTJdOkx4Tr651PcT6AeCKFRY8Jmkgio/eHQ9od2aSk6YxA2rF/wK2A4z0lb3jiAGVsdTgK2Vo3Z1NPUabw4WQiXQkMOF8k8/xKFda8L1aECEuOjuzL/jK08Y6AZ6x8pF45b2k8SBu4CtmUInYgD+c19Wv/0L3UP10FIqRPkp6URY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(7416014)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CBBz0UHUGKt5KMQNSXb6HkVWDWnkNgPobY1PbZK9WCTRj3v/K3OHnfBXkjB6?=
 =?us-ascii?Q?vjDBj6X9DN1RnblpNLuRBRsp7uCB/ldztoBDOb8Zy+xu2/5LSdfJvRHXJpLK?=
 =?us-ascii?Q?EQK8ELPisrUFO6vQA5GLYwd2Lp0wghmrNeSPoEGzyKR/PsrTL9DGaV2iPRmC?=
 =?us-ascii?Q?T0rKx3yQpbUv4oeMLS1pBkfnO3XuclVZpK/OvXm6OKC9ZgP0HvPGp29XoZ0p?=
 =?us-ascii?Q?7A3uOpyVGvzqYHDvF54ZggjD0Bo0aCje3of7NRGMGr2ZfLhnFVCGqabVpVL+?=
 =?us-ascii?Q?q8weQ0McVHF4G4BwgisDOp5zZ+An2UJNeBBR/j9zaphYhrMEEhQfqIvSwqHe?=
 =?us-ascii?Q?Irap5HY4QkD32hSe+1BTwskzWGE6VGUU0adGVY6DK1kxTNPBr9roOgAsa3A+?=
 =?us-ascii?Q?oJ3989OFR7QZ0e42TF/i+B0r/LMmwZtTN39Zw7Gfb5rsGAx4HORnj21lglWB?=
 =?us-ascii?Q?w+6isyv/btbSQ2YS5CPczIwXNEd0YAo+NE1HKUXT+RpBWX+V6fWb5mUli6SN?=
 =?us-ascii?Q?wNQHNc5mHAXHXpKov3Vm2iP+z47Q1liTo4VUoyrXLbSnRjLDiGsFADOmUTR1?=
 =?us-ascii?Q?0qhc1algGwFL4/yrA6TIJRkENryWlQE8sUNOXq5YF3XoGHvh5PmYjqNhWIfw?=
 =?us-ascii?Q?YJOPsQTIc5BMxexIIpELvDvM/9PhHApRYSqwUHIrGAxCi5NXOUWSVuWtc9eR?=
 =?us-ascii?Q?0JI0M6MQKQSUtEZwhRyBVXV3SfEmthzXYFPaMZnJk+7cYHp0pUmgkOO4ONRI?=
 =?us-ascii?Q?3mhfvFKhGLA83OVtvvCElTP1Ch0ZL1zJY5lMjBcbD/uZ7drAKnor436DFi7Y?=
 =?us-ascii?Q?DIxmr8TPD8yHxuRooWRnvuIzpli58u7O8aR9OBhe/OE6kEiTMM3hR2Y6lFrJ?=
 =?us-ascii?Q?bP/bkJrNFBalG2v8ltYvP9hk2ky18Oko6p+Ycs9SbMYEhoNhIxwv995IWS/P?=
 =?us-ascii?Q?B7jirmMAm7JGI2+7xOTuNc2YfhaFtCRhddJc8rsWB51vAEvHDJ8zxzWy1jZF?=
 =?us-ascii?Q?5I+mE7kOd88xXZHvEH/51xN4vpu0jnuxtfrjKQZmh6X45uCroRcQkvO27YCg?=
 =?us-ascii?Q?3A9JdfifiJopw+NZ5O/DE2+ygIa+MUKgL3/gHASL2UA5C2dxpuEiHfiMln8E?=
 =?us-ascii?Q?pq2fNzDTIx+sQSk1By3SQrME37JeD/cib1GYnv8NONRylFzfNd5GrpKEQZ5/?=
 =?us-ascii?Q?E7Wop94G0WIlMsVUl/ferb4JvKmDl+xzRIjcCrLSHL5XviKLeGg0LXP9G6eD?=
 =?us-ascii?Q?iP2IGz2XtxvDBginbN9GBG2pWK8ZPH9z54TPBVOBBDEZJHDN0YTjopasILjy?=
 =?us-ascii?Q?994fLF3cYm3nW8v/QXy4+N4eTHaow9kQV692xggJGNgyPXKTYVYKj9+bgJR+?=
 =?us-ascii?Q?Nd/FcUVqOwHob0j7gNusy0Ic4gEh86fZpLTy+3Apy2I7wD+3bE1742+wOC81?=
 =?us-ascii?Q?V8kK6IDYDgOiiESyVX7NvpLDNtdz8OGPX8/HcBe37wgoj3X49aqMUH73BXxR?=
 =?us-ascii?Q?XWnlVyQD4vqw9RdWDGWuTKz6KmRFU78Dwg5QmwlFqMbBZgoP54kAIP+nRx8K?=
 =?us-ascii?Q?EbQ2hmIYNzpw3PMbckH3aP/g7/lhncqJMN9F0+Rxi1wYeabnlXLtlnMvlM1m?=
 =?us-ascii?Q?J30uIKgYkP85Ip+0rYbMgkc0JB2koPtlPhRAda70DxWiTVgoQwM2NBM7cgnt?=
 =?us-ascii?Q?xa0u5Ek7X2cZeRAtR1qd63kqQmdNAKdNvdtMp0wQ9ifhDR8c7ZxU0wyBcS/x?=
 =?us-ascii?Q?Pd4+/y5z7e923BFQ7s2oDgpUvwRhlI0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe25c64-c1e6-498e-d9f6-08df11d0cef8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:54:23.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/VLa3gu7KN9kNUHMJbtMujq466O8Dc2vA5V8aYpkk0XEKMPDjytXxuZgmWxZxH4rIn4YYq+RYMP5BnuZRRPLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

On Turing through Ada, the booter, a firmware stage that runs on the
GPU's SEC2 falcon, copies the GSP firmware image from system memory into
the framebuffer. It walks the radix3 table to find each page of the
image, and it reads each level of the table by DMA, a whole 4 KiB page
at a time. The last page of a level is only partly filled with entries,
so the bytes past the last entry reach the booter too.

Nova-core allocated each level at the size of its entries and wrote only
the entries, so the rest of the level's last page held whatever the
allocator left there, and the booter read that stale kernel memory.

Allocate each level zeroed and sized to a whole number of 4 KiB pages,
as Open RM does, and write the entries into it.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/radix3.rs | 50 +++++++++++++++---------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
index 6b8251ed871d..228ed54e6dad 100644
--- a/drivers/gpu/nova-core/firmware/radix3.rs
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -63,22 +63,12 @@ pub(crate) fn new(
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
+                    build_lvl(&data)
+                        .map(|l2| SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNEL))?
                 },
                 level1 <- {
-                    VVec::<u8>::with_capacity(
-                        level2.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level1| map_into_lvl(&level2, level1))
-                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                    build_lvl(&level2)
+                        .map(|l1| SGTable::new(dev, l1, DataDirection::ToDevice, GFP_KERNEL))?
                 },
                 level0: {
                     let level1_entry = level1.iter().next().ok_or(EINVAL)?;
@@ -109,16 +99,40 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
-/// Appends one level of the table to `dst`: one entry per [`GSP_PAGE_SIZE`] page of each
-/// DMA-mapped region of `sg_table`, in region order.
-fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+/// Returns the size of the level that maps `sg_table`: one `u64` entry per [`GSP_PAGE_SIZE`]
+/// page of each DMA-mapped region, rounded up to whole pages.
+fn lvl_size(sg_table: &SGTable<Owned<VVec<u8>>>) -> usize {
+    let entries: usize = sg_table
+        .iter()
+        .map(|sg_entry| usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE))
+        .sum();
+
+    (entries * size_of::<u64>()).next_multiple_of(GSP_PAGE_SIZE)
+}
+
+/// Builds one level of the table over `sg_table`: one entry per [`GSP_PAGE_SIZE`] page of each
+/// DMA-mapped region, in region order. The level is a whole number of pages and every byte past
+/// the last entry is zero, because the booter reads a level a whole page at a time.
+///
+/// # Errors
+///
+/// - `ENOMEM` if the level cannot be allocated.
+/// - `EINVAL` if `sg_table` yields more entries than [`lvl_size`] sized the level for.
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

