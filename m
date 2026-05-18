Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F68391845
	for <nova-gpu@lists.linux.dev>; Mon, 18 May 2026 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127923; cv=fail; b=OGfQRsUUvbm5v25c3RnKFKjkOXrUwGfIUKQiIqqCnDfax5bKqIoFicW3u/H5mFwOnS6N8eF1DaMZ6SQ3EFRlhBglN5v+7QNTnR7+BfvaNg63gI/gnzggvBfrIs7taqT8O/p9H9X+glmYoSPSEyva/36PuVF0rsL9Eqq2CgO44JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127923; c=relaxed/simple;
	bh=YdO94D5HQGXeoG+Kjpnrd6A3C6abVKBJaFqDpl9UhT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hCqCGBaM2AyOZT8PckWaX5h/u3ZWg9l4Yx1iAAkqk0b3w42oFxm0CBED4q9NZZGcv347PfZTHLq4NNWa1bjupzUFcPBGcHJxz2pouwY9S62g23/lbWUBFeiLQXH50MkLbusQXXShGxudj7RBeIIKkrNdxLd4Bvia1wr1AtG0+nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P07Z9nid; arc=fail smtp.client-ip=52.101.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P07Z9nid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buq5Bh4GqaqDO9x8YZJpHN+g8+6Tc6TeITeDcDnX9zP5FqIAIMMrAHzoBGqZPzFHWg3usf7IEgYOeDrVJhqgv3+26MURpvlc7F5d2tP7P8xjHCa96OzYS1n3uU/FYiJyujX94B8ECxN9dVE7PvW+BnrixOWjNOYFDz1U51BkSC0KkQfqnXlju0Fi5lpHf8PwD0iaKeEB822ufoYUVWhZJlJIaedi6l1UAuANx77zYG54/h1E/ivyJ7we7ptzPR+kWRmJctS0lO5d/kx/vNqc2YQfpuKqcq5GakcWyNgqJrWPdYUBu5UuoDvYbBYaNMNTNAL2X2rHCiPV/JC7kumxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti4xHkGQEpkCiFe+USXjhdGWwVMHjk8dHMk0Gkm9Ol8=;
 b=VtasI23U1UoKyuUbqdSl7RM0Jw8teFkNevIc4t/3pXEPM/0alOLdY0aE3W5Rm+iB9iKeT4FeuRj0k208JsKKh9EJsaHNepN3Lf6hbObqTheyb8oxThxjRMIGbMlxBsf/YLGDwAjbj9/WcSw9gF8jwsuXre/OndUH+havRfzSg+dxSJ8TQwOgI/MTDPaYtQrZDoj8gt1u+EXT6OHpvFpsWRtpWZbC25M6Igv0TC5yOlMJyS8alV8KAQE3d024HwQn4lPlnsv6BoTCNGPwtQjzFEx9xM4NNRGV2YxHsMdZawcEzm5nwR8blrGqpUULeiLLOws3cZgdsOUp3ZWM4uuJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti4xHkGQEpkCiFe+USXjhdGWwVMHjk8dHMk0Gkm9Ol8=;
 b=P07Z9nid2o4YEb5ckBftsnKsdJhq0DohrCEpM6JmFf4jDyihjdr7QrvSWmKA5dzQIdJqWX3vbMBKoZ62Q04lWdpeT8BIkd156EDma5M1f4QKiMGDb5draqtLanL6GTYrAhWOrZIAHswyOAlxsccY07LC32LfBKkIxMFvF87hYoY+KCHa50dGYeF+K112+jIiA+pjtyfe2++Ap4IXuZumEH3ruDbKq57aEeo4RT5K2iuO1aM9vQoLW2hcKYjGeeTWA/TRFuW0oeVZyXjrzNEYT+kghvm7Hesy4sgXHWtcfUa3kdgWN53vhvpankIgA0FrJoLLUL7JCqJhZzW9jVLPxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 18:11:45 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 18:11:44 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Nikola Djukic <ndjukic@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andrea Righi <arighi@nvidia.com>,
	Andy Ritger <aritger@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>,
	alexeyi@nvidia.com,
	Eliot Courtney <ecourtney@nvidia.com>,
	joel@joelfernandes.org,
	linux-doc@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 09/16] gpu: nova-core: mm: pagetable: Add MmuConfig trait
Date: Mon, 18 May 2026 14:11:18 -0400
Message-Id: <20260518181126.2493572-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518181126.2493572-1-joelagnelf@nvidia.com>
References: <20260518181126.2493572-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0317.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 39386694-6d70-4656-b9f6-08deb508eb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	VXsb3nu/ku/3Fci16b7vfA/1KMdhvPyMi3CMpApFDqDJ9yv8s2aieM4VzA86jlIi0krlZg0JGIhqNhBvU6IC6EOSgjkBVGVWfzXbirE5Yv5YE+OidnX93MEgHUF1vP7LEUUklyl1+2YP5LRhRoO1qBK28ZiGEotGJjrKZZNF2C7RWdPwVVOSSHnMi5cOW113fjwt55V4zMBVW3doAis4il5R4bd75icwmWWVKcjRRJN56sRjO+P+8x2l/sKFkrloxJi7KVQKV+NVQSemQKH1HAIqpuZeReGrEdIXUX12CtbzaBV/qxQpjhoxeO8oiCLL1ucJdbF00x149YMbYcHp2aa4NmiIFG8PAP1xR6sumFugGh9C26tKHuVEIhFhWbF4RIe7qt/hkxIfDTiuRmxJXMGtB5XRwwxyFWn+4KRpDbhvBGCIT9NREtgSbCSmqdlIdT9wUH8lhXk1LBOeWnPcpbW4o84Qbc1NfJk3GaMjOsf60alFR6bcdVljgEUi1qDNKDzg4NkdX3kgYwMWFx8vw+buUpsZuEKuWUqMbQrnj8r3AfQ+/1enwE3aWqEBsr5ef8imf1owk9MgsA9gYllJ7OUg5MM8Va1au1cenZm7f5Xf/+xROasvxuookxRE8vkKODCfeZ9uupKH4aJp/T47AGfgtpPt+Q3NKdsNK3qNYdosYeURxRkv+LMrg+0YMeXE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?48ucaoXSFzKXpAyi40q8TPZ7ToM5b/l39pfA4Xu/JLx+JwmjhytxwBLcykO7?=
 =?us-ascii?Q?zdjXuKJ8PRnEdejbYBdBgCCdJUv2AfWcrLkePDBVDFdFayqY/pp2FRb9TxfJ?=
 =?us-ascii?Q?N2Z4YoVnjh6pcKFWYlqjeHTOqDIdn5yqSSGcnaTIPk6DS0uebdQS+/kqd4kn?=
 =?us-ascii?Q?W1YKYu5aOY9lWwvI1GZ7XB8DsF3i5Mq4SkGfM81DPD0S86f3sCWnxCsjggyk?=
 =?us-ascii?Q?62/TZsij4geQg7rdg/yIs1Ny6iNgTaAD75+l25OGCmJZ/g6ZvXsWVWZbCZX5?=
 =?us-ascii?Q?U/tgT1VaUjia9AXtI7a67yAyqLa6K+gMVdaf1y7qTUuRiXmtgpIbRtulbBj+?=
 =?us-ascii?Q?purVy7qPgGaZvVUw/ztJ3VO6CDyATYFEy3bnH6IjQnAUreuZxaz813TiZOI6?=
 =?us-ascii?Q?ts9UjK+hHNRPAAihOF4kTsNFbAy99iN+66F2lWgymrAhsCele7vanUBk0g5Z?=
 =?us-ascii?Q?2Q9zQw7mBFT45Q26z+9KAWyZcEQye7gOLzMobVVfR2vcXLfmpxdQMnEfAIbg?=
 =?us-ascii?Q?Bd3xX7MxrmqdvwYm45o8L5kjVp0paBJ9IpnF41ioz/nD5PyIAZoHpVyZ5lJ0?=
 =?us-ascii?Q?W6bfPljLuOAo9KboZlvkKibxr+mFSbj6+DVrBeLI5XMuYGlTIaiqDFgESvps?=
 =?us-ascii?Q?mEIt2MkglaBPi7s4vTggLr0Bg/zJcl00UzNV5Zw7ncTsZ4vl1zaeS9Y4LGK2?=
 =?us-ascii?Q?pLZ39YhqtaBGlrWJ31Lxx/KJGNX0L1YQuYUdwJnC11P6LWu6S4RQd1nyhZSZ?=
 =?us-ascii?Q?u64TvOtmUNlD3Koyb4mMOpjGsNAeMTzrqVv68PNcgyaWSP7uGrrAQ/xe0Pld?=
 =?us-ascii?Q?y5gStayuV1DZV2ToLtLyyLtLPiEmZ6uOCMAeMQATmqy70HGwdboPVigCoG1p?=
 =?us-ascii?Q?SqatFG9Kow5bN4wDYldx0nNoyqil4TY40zzNxsRx1MClOdGTkcHHiL7rZxCR?=
 =?us-ascii?Q?APyAnnUcHkB7QJTKH0+nb3vcV5a2d74ItUz3zp+XDa8crWu4kBgTLSI2VPkI?=
 =?us-ascii?Q?ulomk1Nc1cF/ML5ZAid3GwffMx7FHiVVuqqNuHlrghgiGAQww/kBEXYL0WY4?=
 =?us-ascii?Q?HE8QCWPfRNUwzG9yNxgmfF03hDH8/1MyOxEVk4ORom29R4lFnF/JL+lo06N2?=
 =?us-ascii?Q?zcy4ywmwuh3RhWUQQbUif2XGZqbw1H7ZxZlNMqGFNhogcM1e8qRIz1E+vu10?=
 =?us-ascii?Q?WQ6Te1NqgS6iVkTcqUg2pJTOmNKAYdVz7HyhbXP9186oBQIGdYRg9ECtQFde?=
 =?us-ascii?Q?ylxsYSHAx7KckobcHsthu7lK+ssGCCz9BSalyNznNsqXffImD5N6rHQqj6yw?=
 =?us-ascii?Q?c4C8VQHx5KysKMHRmFHswK3Xk6klihBbSuUwHU4LJV0bDHAIyk7OzNuxRk/u?=
 =?us-ascii?Q?q50/SZ5ab3GusEq99/73VXZ8uqA3b7kuwocUSj6hcC9pConilottQUGxFxYs?=
 =?us-ascii?Q?4zCbcV+wuG/X9bfw6wN0FKfYREguf1cV8kzpHLdVR/n5U0zAz7UneLWdYjSW?=
 =?us-ascii?Q?1Qs6FBfAzVaRmjLOYEMuVWGytbdVxC5VWVzDXgzv95aUXPs5aqvLigR8qnUg?=
 =?us-ascii?Q?eA8JXSXZ2E/9PAmR9z3ZQueFYd7We54PTjEgvdIa7cuMR3GkWs1yaWQmOM8Q?=
 =?us-ascii?Q?wPgoJAHeqzTPYpiOq60aQMsm68GSSc2nNoOmXm6J28CjuX3puvLLp5dwnw3i?=
 =?us-ascii?Q?dj+g89wB3+mPE1/4GlvrNhAiB9Hvw9SICMznvxdR5lqk2VxlkKpcVj+GEPJU?=
 =?us-ascii?Q?gddrXuwYJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39386694-6d70-4656-b9f6-08deb508eb5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:11:44.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55Qf8SZrRkn54nYtgfJVeexmlXgC9zI0UL1bCaAeQ3zqiBdxTrhAbcZSLHr49WB2u5xaYyZHIk/a+1ctYaa3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

Introduce `MmuConfig`, the trait that ties the entry-operation traits
(`PteOps`, `PdeOps`, `DualPdeOps`) together with the version-specific
constants and helpers.

`MmuV2` and `MmuV3` are zero-sized marker structs that implement
`MmuConfig` for Turing/Ampere/Ada and Hopper/Blackwell respectively.
Dispatch is fully resolved at compile time through these markers, so
version-specific code is selected without runtime overhead and without
wrapper enums.

This enables version-agnostic page-table operations while keeping
version-specific implementation details encapsulated in the `ver2` and
`ver3` modules.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs | 109 ++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 3cc546f94fdb..38f4f0c6e8ce 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -19,6 +19,7 @@
 use crate::mm::{
     pramin,
     Pfn,
+    VirtualAddress,
     VramAddress, //
 };
 
@@ -196,6 +197,114 @@ fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Res
     }
 }
 
+/// MMU configuration trait -- encodes version-specific constants and types.
+pub(super) trait MmuConfig: 'static {
+    /// Page Table Entry type.
+    type Pte: PteOps;
+    /// Page Directory Entry type.
+    type Pde: PdeOps;
+    /// Dual Page Directory Entry type (128-bit).
+    type DualPde: DualPdeOps;
+
+    /// PDE levels (excluding PTE level) for page table walking.
+    const PDE_LEVELS: &'static [PageTableLevel];
+    /// PTE level for this MMU version.
+    const PTE_LEVEL: PageTableLevel;
+    /// Dual PDE level (128-bit entries) for this MMU version.
+    const DUAL_PDE_LEVEL: PageTableLevel;
+
+    /// Get the number of entries per page table page for a given level.
+    fn entries_per_page(level: PageTableLevel) -> usize;
+
+    /// Extract the page table index at `level` from `va`.
+    fn level_index(va: VirtualAddress, level: u64) -> u64;
+
+    /// Get the entry size in bytes for a given level.
+    fn entry_size(level: PageTableLevel) -> usize {
+        if level == Self::DUAL_PDE_LEVEL {
+            16 // 128-bit dual PDE
+        } else {
+            8 // 64-bit PDE/PTE
+        }
+    }
+
+    /// Compute upper bound on page table pages needed for `num_virt_pages`.
+    ///
+    /// Walks from PTE level up through PDE levels, accumulating the tree.
+    fn pt_pages_upper_bound(num_virt_pages: usize) -> usize {
+        let mut total = 0;
+
+        // PTE pages at the leaf level.
+        let pte_epp = Self::entries_per_page(Self::PTE_LEVEL);
+        let mut pages_at_level = num_virt_pages.div_ceil(pte_epp);
+        total += pages_at_level;
+
+        // Walk PDE levels bottom-up (reverse of PDE_LEVELS).
+        for &level in Self::PDE_LEVELS.iter().rev() {
+            let epp = Self::entries_per_page(level);
+
+            // How many pages at this level do we need to point to
+            // the previous pages_at_level?
+            pages_at_level = pages_at_level.div_ceil(epp);
+            total += pages_at_level;
+        }
+
+        total
+    }
+}
+
+/// Marker struct for MMU v2 (Turing/Ampere/Ada).
+pub(super) struct MmuV2;
+
+impl MmuConfig for MmuV2 {
+    type Pte = ver2::Pte;
+    type Pde = ver2::Pde;
+    type DualPde = ver2::DualPde;
+
+    const PDE_LEVELS: &'static [PageTableLevel] = ver2::PDE_LEVELS;
+    const PTE_LEVEL: PageTableLevel = ver2::PTE_LEVEL;
+    const DUAL_PDE_LEVEL: PageTableLevel = ver2::DUAL_PDE_LEVEL;
+
+    fn entries_per_page(level: PageTableLevel) -> usize {
+        // TODO: Calculate these values from the bitfield dynamically
+        // instead of hardcoding them.
+        match level {
+            PageTableLevel::Pdb => 4,  // PD3 root: bits [48:47] = 2 bits
+            PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
+            _ => 512,                  // PD2, PD1, PT: 9 bits each
+        }
+    }
+
+    fn level_index(va: VirtualAddress, level: u64) -> u64 {
+        ver2::VirtualAddressV2::new(va).level_index(level)
+    }
+}
+
+/// Marker struct for MMU v3 (Hopper and later).
+pub(super) struct MmuV3;
+
+impl MmuConfig for MmuV3 {
+    type Pte = ver3::Pte;
+    type Pde = ver3::Pde;
+    type DualPde = ver3::DualPde;
+
+    const PDE_LEVELS: &'static [PageTableLevel] = ver3::PDE_LEVELS;
+    const PTE_LEVEL: PageTableLevel = ver3::PTE_LEVEL;
+    const DUAL_PDE_LEVEL: PageTableLevel = ver3::DUAL_PDE_LEVEL;
+
+    fn entries_per_page(level: PageTableLevel) -> usize {
+        match level {
+            PageTableLevel::Pdb => 2,  // PDE4 root: bit [56] = 1 bit, 2 entries
+            PageTableLevel::L4 => 256, // PDE0 dual: bits [28:21] = 8 bits
+            _ => 512,                  // PDE3, PDE2, PDE1, PT: 9 bits each
+        }
+    }
+
+    fn level_index(va: VirtualAddress, level: u64) -> u64 {
+        ver3::VirtualAddressV3::new(va).level_index(level)
+    }
+}
+
 /// Memory aperture for Page Table Entries (`PTE`s).
 ///
 /// Determines which memory region the `PTE` points to.
-- 
2.34.1

