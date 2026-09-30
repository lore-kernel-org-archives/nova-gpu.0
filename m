Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5989390CA9
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739801; cv=fail; b=XL9AFRcEsq/xwokIQ0ELZjUBHFQ6E4DioSOD6iMxfJq5LTnJJXq3PcmsYzN2ZLnLVu/y0c/8Rt1rsZgscuvAF9ggj7yJFHEm3C+i9NhM6YritbILgp4KLiU92gg0Hcu6yCGCvuTBXZ+8sFRwFif71cnugqbsvyY30bl0pw7fcoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739801; c=relaxed/simple;
	bh=3Muv8VRNfEwUFkZHR7aiKqqN3oOoM8brmA4BE/XtFOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dT8cRZNQQIuExfkHw66YnYrr0XhdJlgl7uwsKHfu/Q1yCeg7dd32BJVMqrrehSqke6kLs8izn6vxeh22wa5uyIt9c9lz9fY0FhLHO22XYILLNSXhMPom0UjvLIGZnaUQHxwnYTYUD2/6/l0XLQYFSm37O3P9KXaZ6vP//FEWyLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UqcSyS2/; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UqcSyS2/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHfHfh5Daha6h4zJYwp5rYcLM4x0f0oxNoluWRc7SFVYGrSgRLi6Fr0YVs7M0AxMj4a/szMdbApnjWAxjYKl3fbmXzxzLixb+J3wNin7jmm/r9OGRvZYIr1BDpDjLYVrw+MyaNkHAQphlT5AOlywhCmO63JHjfsPYUPeYTJ9yhKY6qJfK2YciVEfANnHVDyzE4vWfwfOjKx/zlggdRbVe8zO0Pn5d+IsPwWdlwobA4ZzpP6Jx7zohn5W9Z/eRn5UmcHzfz+XfG8AopQdcxIvVwkYMgeEbAy/EATf32X0lUCvacYkzFl1vqxd5xbZBh7wa+36hyoYUXBdbmix0r9rCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JI9JlyGTTJMDTNkMR010l411eJwx2lYbuk5Hibdjxo=;
 b=jgTmRMqnGAE4B+HCdgCrstRvigulaFemB7NGCarccCfuxhFMSx9nU2+7XPMKn3dbBiXxEbVeBca/F+WK3hNSCI2aXj215kDyW0ifBnnoSwHRLksHG9BwJ/aaOocoPRwOSv0lpsWpKaETPCRVCfm66TB0mWB7EbPcdQzrrmAzQsyxA8lPFewwEVGRMmlOuNOfuwmGau0kXPn4RxkWpBkVC37xiGvg3OOIWhL/Y7ItlVKrBFWq/fmRaNWJryXL1KVjjg+tD9+8vaxnD54aRhwO/ztY9EDeMaqvtnX06IHcC5csOvHo9o3+oFkSTHGhG3qvQNKg8V4U9937uNIBSDjRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JI9JlyGTTJMDTNkMR010l411eJwx2lYbuk5Hibdjxo=;
 b=UqcSyS2/V4GnyFuonrEp9DBCH5TQqWNhnYvCp6XtBE8UAx6rB0hPdLyKgRcCkiCIsgt9UejMRwcdJfN/0VPNIgml1Lu2vZ9ysdamiw8YkWTHxWChCailDv3jPgMPJDE+TGxUo7r3zsIpgOAeWU8AYZpMDACHaDJI3Aas9O79NHfbM9u6LaJzADrw22deWY+FPn+SCNb0/1f6CXhH8DZIALuHY9FAjdnH1scnA71tcZd4SZn8uAea/IZQ+J3Q4iV4J4AkvehpqxKDrESI3vbT61oY3Firi57/wXksCOyPtwoTmsI+bwvCWkHeXmqRmBc4xHSbrM+aKG9OJEIt7Ww1MA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:28 +0000
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
Subject: [PATCH v5 14/15] gpu: nova-core: add KUnit tests for the interrupt tree
Date: Tue, 29 Sep 2026 20:41:47 -0700
Message-ID: <20260930034148.590687-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1083a6-2732-439c-d84b-08df1ea4d982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	78GJhgTIL3ijn12ggmAovM2H5zx5gW9ZkbzBQQr6YJHqOH7L1vBUbRU7XQftqpE7FSMeBxlWRcvlvh+zXPfJbBJFRa0ne9Pr9i6XgBaLfDP/HmCo/mZWbZBn4e85KSGWpsspg6fbPnYpRlHOY+fRy09QB85ehd8WWVENOr6XVlBZ/KS0a5ubtex/ZvHRJuRM4PNqplGQURWOyjBNdfbuvRqlA4lWxJ/xVAd9IXvCl1MJsqdj8Z7xDsHgnaTNKp9Bel12j1MGqoeyiQVuQH6D5A77x7LuxJy/fusPF7fb4P2GF7j9bZ2oryj6XaCJbKOzP7AcZzLUS2MLXMGYGhMe4ShpvcXrfR/f3KMs+sdtCOWOiIP0/SZKuy6GIm+E7JW5/fVrV7ddrTh//x0/sGLtwOTTCcLr5uEJJl5+Q7VhjsnPCuSUCytqLaSdN0FzR7TTi/yIAFn1f5l5fmPNWdX0bAEMddrq1ure0+yltyXzYoA83VmV6YImWi2Lq9HQWZgULEeZMwRnoWfubGQi/5iV8RoPDGYuKm6kJpI40FzJ/tXKbE++hexPGWt5oZRhIfxA82rHp94z4auzeaLQFJUuvv8HBzx9TOW4Rugz9/W7M6jI3ewCYqR6xpkQtUpKZOke92t66/4FZm5b6uBhC5zVkWTnyvg39oNlYV3AIZdtRj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eJmEUDsKHFbdiO9m7Htd56NdvFeAo8nI6tRA0zmCbYxg1EFLbGDgjBAY6v5Y?=
 =?us-ascii?Q?8NxGGSL1xkWcDYhjpzzGskaMFGItD61aYOCp2SvQ+D8k8ffpUlcGiXXV/31/?=
 =?us-ascii?Q?jMQ5apdN4IYpzing+c0MS7SZh9DvHX4Ovw+dx4RslLn95cmZC2iOGHZVB6+n?=
 =?us-ascii?Q?O1YYmcKJvqxufqzrVKHnOfzJQU3AIfGoNE6rGUoLsatscJLTOY8VJbuomVq+?=
 =?us-ascii?Q?PB4sAS/8RaLMQBXHk2sZtJsq/r9BB97ZZ9P451SHwFyVH2+63+Ro5LgNv0in?=
 =?us-ascii?Q?n9sturZQOQp6c3HBNFEuLsurofetxOuxZ7imdwQhaZMKmr0x7gMkeRL/YE88?=
 =?us-ascii?Q?YMK02ZwsbeFXahOGs5nGDHmi5meUivN8RS6YtyqAvAWK2sU+x1emOYafUfFR?=
 =?us-ascii?Q?cjtkwCsBrKWbuWAsS0uME5XJl2NoAyR1BSkdkUpifG8iNU/swpoz331FQ5gX?=
 =?us-ascii?Q?C2xNlu/DmkYqY/G0AHDeZxI49sv9TMl4+cn6TBFOHnQYL0Gk/YtcBZpI+aNr?=
 =?us-ascii?Q?TZKPJ6v+ZRWCD24WkG4cNN6/8Dm2JCJ62q/fCyZyvKvVFK0JHvJwEqrqMqnZ?=
 =?us-ascii?Q?EeWArKl2nsXWn2qIiZUM3KV3UJpPa16UYYGw6wwEJ11bRsK5hlEG0ebhkSy5?=
 =?us-ascii?Q?rZW8Z/zjOH+oghNTy6s00dkcN1bQjDFtP98T7d3XMhUuMlCr2femiAmIDw8Y?=
 =?us-ascii?Q?QukHMyi+37szU/TAipdxwu2YJcHyCmCFAwywtT56hyvwl2Anr3BFehMc0rXA?=
 =?us-ascii?Q?GmAzjdo7rV360ilfw8ywu3JGUjTobaeZZ/DJeW1/M9ylMkV3wURtuKhVmYmD?=
 =?us-ascii?Q?pf7yiFlp483l4Z7V4zMGGSPIMuJJLUvg+EkVd+LieD44HPEYcczb+q/DEzyY?=
 =?us-ascii?Q?Ck4EhKEv2uwKioIyJHTEhuovEtIR4X3VQvx0gOwJD4dR+a4aCqIsBz2LSj2K?=
 =?us-ascii?Q?YPtXr7dgEMvnyMK+r+44KxWZJsXzch+PqEeaYlE+OF8VVwySi4eGHgNObfTp?=
 =?us-ascii?Q?bcQfKfGCFOsNMq34fOW9lLM+dfoxLg55CAcQxeTtLPUbuy9DuL8vV0qpOvHN?=
 =?us-ascii?Q?aLoCw/zEWV+qV8DLZBZsBczTAE1MaesL2r9Keyw21ucoceqj+cn6M7DMhfRc?=
 =?us-ascii?Q?HXaJbHKGK7AMcsI/ySVfwdtM0Z4wlAF5dCebUGuMpQZBGSK8MoacfASM48Ku?=
 =?us-ascii?Q?OdrZZX5Glg2FRAfDxM0g4EG7HbL0nTTI6B9ZAYx1XbRCEa13w1733zYYDDA/?=
 =?us-ascii?Q?VwjyJU7xu6qZv77KalZSdL4PtIyN4na2kZ999QgoheUXwIfNvGqJFTJoq0fE?=
 =?us-ascii?Q?0i7Yy8TOI14lhcUi0fJ9SSWS8IDRQ+7+mm8PqSNmXOCtf+rlOAL730c0LGu/?=
 =?us-ascii?Q?i0RxrWkpjXOFEUgcovw/2nJoxELWOPbY4j25Zgm7muJFbRz/3qR0wJfVHATt?=
 =?us-ascii?Q?0yHzGp3lM9qP6RH2AOaWKSUOb5Aypa1E7hqyC5ouch8eQYyxEpH95GY3oD+V?=
 =?us-ascii?Q?DFj5BqNhpwNev/P6DlRvlyplQhwdfeMyqcIKGFWeOHiKR7Sdg3JypE18lgCi?=
 =?us-ascii?Q?n+4iFcyJ+N0OHjwwMIrlqOGjfZqdBkO5V5LZ/eLa7cLHKy7J4KF3Hi2552/a?=
 =?us-ascii?Q?EYwnyf/nd/CPIDxzmKtsdoG/gp0tBqf7KN1vFsTiTCgfzsJuMpvnqHhsGVX5?=
 =?us-ascii?Q?5YFnxM+NPhx847sPPSJgs88sa0364w7VH7Zml0UcrSVEF6GzTYjgPjIFZXDh?=
 =?us-ascii?Q?0Lw75fB4ww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1083a6-2732-439c-d84b-08df1ea4d982
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:28.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M59XsyupaFRnKlBc5dayBy6OIReFYGxPVxJcblyPKG9bw8hKQ9V/14BegviV4mz/6j9RhzekgPhwBMJuqwMkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The vector arithmetic and the leaf and subtree sets touch no hardware,
so KUnit can cover them without a GPU. A wrong leaf, bit or subtree for
a vector would otherwise show up only as a lost interrupt on hardware.

Add the nova_core_gin_tree suite. It checks that a leaf index stops at
the widest supported tree, that a leaf count implies the right number of
subtrees and vectors, that a leaf count enumerates every leaf in order,
that a vector maps to the right leaf, bit and subtree, and that a vector
beyond an 8-leaf tree is rejected there and accepted in a 16-leaf tree.
It also exercises the subtree set operations and checks that every
supported chipset implements the subtree that carries the GSP event.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 128 +++++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 90d4d11e8ba3..590f921894b6 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -129,7 +129,10 @@ pub(super) const fn from_raw(raw: u32) -> Self {
         Self(raw)
     }
 
-    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
+    #[cfg_attr(
+        not(any(CONFIG_NOVA_CORE_SELFTESTS, CONFIG_KUNIT = "y")),
+        expect(dead_code)
+    )]
     pub(super) const fn into_raw(self) -> u32 {
         self.0
     }
@@ -554,3 +557,126 @@ fn drop(&mut self) {
         clear_top_enables(self.bar, self.serviced);
     }
 }
+
+#[kunit_tests(nova_core_gin_tree)]
+mod tests {
+    use super::*;
+
+    /// A leaf index cannot name a leaf beyond the widest supported tree.
+    #[test]
+    fn leaf_index_bounds() {
+        assert!(LeafIndex::try_new(0).is_some());
+        assert!(LeafIndex::try_new(15).is_some());
+        assert!(LeafIndex::try_new(16).is_none());
+    }
+
+    /// The subtree count, the implemented-subtree set, and the vector count follow the leaf count.
+    #[test]
+    fn leaf_count_derives_subtrees_and_vectors() {
+        assert_eq!(LeafCount::Eight.subtree_count(), 4);
+        assert_eq!(
+            Bounded::<u32, 32>::from(LeafCount::Eight.subtree_set()).get(),
+            0x0f
+        );
+        assert_eq!(LeafCount::Eight.vector_count(), 256);
+
+        assert_eq!(LeafCount::Sixteen.subtree_count(), 8);
+        assert_eq!(
+            Bounded::<u32, 32>::from(LeafCount::Sixteen.subtree_set()).get(),
+            0xff
+        );
+        assert_eq!(LeafCount::Sixteen.vector_count(), 512);
+    }
+
+    /// A tree enumerates every leaf that it implements, in order, and no more.
+    #[test]
+    fn leaf_count_iter_covers_the_tree() {
+        for (count, expected) in [(LeafCount::Eight, 8usize), (LeafCount::Sixteen, 16)] {
+            let mut seen = 0;
+
+            for (index, leaf) in count.iter().enumerate() {
+                assert_eq!(leaf.get(), index);
+                seen += 1;
+            }
+
+            assert_eq!(seen, expected);
+        }
+    }
+
+    /// A vector maps to its leaf, its bit within that leaf, and its subtree. The doorbell (129)
+    /// and the GSP event (155) share a subtree.
+    #[test]
+    fn vector_maps_to_leaf_bit_and_subtree() {
+        let doorbell = GinVector::new::<129>();
+        let gsp = GinVector::new::<155>();
+
+        assert_eq!(doorbell.leaf_index().get(), 4);
+        assert_eq!(doorbell.leaf_mask().into_raw(), 1 << 1);
+        assert_eq!(doorbell.subtree().index(), 2);
+
+        assert_eq!(gsp.leaf_index().get(), 4);
+        assert_eq!(gsp.leaf_mask().into_raw(), 1 << 27);
+        assert_eq!(gsp.subtree().index(), 2);
+
+        assert_eq!(doorbell.subtree(), gsp.subtree());
+    }
+
+    /// Both fixed vectors are within the 8-leaf tree, so every supported chipset implements them.
+    #[test]
+    fn fixed_vectors_fit_the_narrowest_tree() {
+        assert!(GinVector::new::<129>().validate(LeafCount::Eight).is_ok());
+        assert!(GinVector::new::<155>().validate(LeafCount::Eight).is_ok());
+
+        // The first vector beyond an 8-leaf tree.
+        assert!(GinVector::new::<256>().validate(LeafCount::Eight).is_err());
+        assert!(GinVector::new::<256>().validate(LeafCount::Sixteen).is_ok());
+    }
+
+    /// A subtree set reports membership, intersection, and its span from subtree 0.
+    #[test]
+    fn subtree_set_operations() {
+        let gsp = GinVector::new::<155>().subtree();
+
+        assert!(LeafCount::Eight.subtree_set().contains(gsp));
+        assert!(!LeafCount::Eight.subtree_set().is_empty());
+
+        // The GSP needs no subtree above 2, so an MSI-X request covers entries 0 through 2.
+        assert_eq!(SubtreeSet::from(gsp).span(), 3);
+
+        // A 16-leaf tree implements every subtree that an 8-leaf tree does.
+        assert_eq!(
+            LeafCount::Sixteen
+                .subtree_set()
+                .intersection(LeafCount::Eight.subtree_set()),
+            LeafCount::Eight.subtree_set()
+        );
+    }
+
+    /// Iterating a subtree set yields each subtree once, lowest index first, and nothing for an
+    /// empty set.
+    #[test]
+    fn subtree_set_iterates_its_members() {
+        assert!(LeafCount::Eight
+            .subtree_set()
+            .iter()
+            .map(Subtree::index)
+            .eq([0u32, 1, 2, 3]));
+
+        let gsp = SubtreeSet::from(GinVector::new::<155>().subtree());
+        assert!(gsp.iter().map(Subtree::index).eq([2u32]));
+
+        let empty = SubtreeSet::from(Bounded::<u32, 32>::new::<0>());
+        assert_eq!(empty.iter().count(), 0);
+    }
+
+    /// Every supported chipset implements the subtree that carries the GSP event.
+    #[test]
+    fn gsp_subtree_is_implemented_everywhere() {
+        for &chipset in Chipset::ALL {
+            assert!(cpu_interrupt_hal(chipset)
+                .leaf_count()
+                .subtree_set()
+                .contains(crate::irq::gsp::GSP_SUBTREE));
+        }
+    }
+}
-- 
2.55.0

