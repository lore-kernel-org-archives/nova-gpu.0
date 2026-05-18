Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508523955F0
	for <nova-gpu@lists.linux.dev>; Mon, 18 May 2026 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127447; cv=fail; b=rzBKEEvqfbnufWqkO7yrygSES/k4rtHgpQG2fCtYmRnYLin+rOv77jUKlfEy4eGze8Vp3svK00nxyCPV1RvxGUIrqV3R9UXIC3k5eqRzqwf3BcmNnCfZ3F2MA7JvXZB43sou4W3YZ4mqwhV7LDLUG6KbFj8Ur0bXxNFu4FIFYmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127447; c=relaxed/simple;
	bh=gYhP8aUKv46XJ7xDho/R0IiDt/JCsaRpLlJUTamz2N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nT06PDTmKJSnHcR5fvez/wjfubRXGcNenDkrYgdX2Y9/oUj/WYMiDBMwY26PmADsgvqTsBUu6265KO8nsjgVFog1/yTync2FyO5Xf6CthtM6GNxePfn6L9qGjCN/zJwen7l2ADO8sSqg35poswVpM0gm+EdDHZrGCsCzRjgSXpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QpSWxFXA; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QpSWxFXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaUCjYQvQUa6Irw3EKnfqXYfmCcAN8qju5V6ov+gqg+gF35UBVqOBH2R41H1KeVyZFVTLRieMiNaNgXkCA7oo51EIMgPWTL9QArXAlV0NGgE9I7MIc59Mw55XxHTxMUoGrhwDe1E9YYOkF8NpZ1SwAGVRfCxCyz3RjBEBjkEtjp01HGhgdplAx0eQ9eG2zVnuyQlFtDQEbKO8GoD233HwkahnjzmgxZEe7qJMK0me/64IWHocav9w5omLMn82uhuztDv6hEqPEp2XaLO4/DivIKs3L4gnxDExs67Ot4OxeNlrTlYVoe16cbz9ASUE97abd0a/ae9B2lPTn0oJZUDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARcRpFm4E5Cjy0m1MySiaF9HN6pLs66tKUV7WT0V/Ns=;
 b=uRxkfLLBdFllyJ8bTdud9ebrtNrvXv/SyRgWhQHHu+5mpBtSXCaCcCuokzPisd7azGWpa67F1He20LQ0ZWLXI9TAlfolaph92VL04V+BsEOoD0NhKCxugr/bR9iBLBn89+ha6GgzrNgV3MznlkCfS5B+L61148WZGwxmEOk/iB4RrzOEY4kwDBImbVke4FfHbj9ox//ZBu6YYs5bfVo3SBrLrGE6MRK+budM2bIxHH+ck1JmQYSYKxCjnqmrAVo20u0nMz9MME/dO+syidx+/ODOTpnhn1BaNCXKAfn3BGw73pa265hcR9IulduSZifxY1wOgVrRZ3076ilK/peo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARcRpFm4E5Cjy0m1MySiaF9HN6pLs66tKUV7WT0V/Ns=;
 b=QpSWxFXAyfRckZKXDm6JuoqL5ENOsCHMBkfY5ZMjkGER2BVVC+BjG/5v5j3H9Sa3dp24koqepmwgz6Mwu58SZJ8vogyhsf9P2YFF1p3zcykIan0iBzcC440AL+gl4dt+ekTJgJNgxc1iCM9ilR00akZZPC64ISe1+bF1MGSpm6iGYgXPyYiSNRBFztK2OXJGdLApnmViyb3mS3isduYKZLFXBXRsyqKt9k/YD4mKpvMarQa1mxYXwsTuQ33ILvOFFmXBl//WMhsNEOFhKak+RiNQkThHHar4xUA9Ph7gXt88jBmDnphyUchL+vtKS8f0ktsVAfabDg6jUkEix8tX+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 18:03:56 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 18:03:56 +0000
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
Subject: [PATCH v1 07/12] gpu: nova-core: mm: Add VramAddress type and conversion traits
Date: Mon, 18 May 2026 14:03:37 -0400
Message-Id: <20260518180342.2387845-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180342.2387845-1-joelagnelf@nvidia.com>
References: <20260518180342.2387845-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:208:23c::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DSSPR12MB999212:EE_
X-MS-Office365-Filtering-Correlation-Id: 604d55f3-8e53-4544-968a-08deb507d3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2RWd6nImMn2mhzsZBgOXWSbAhLV4oweSYUJUGbGfSUSV8K4wdNujNwMgfuhjHg4oUNC/iWkjN5nMGDYZ9UL/dOf07eUEN02D21em9x/PzS2pBd7CmqhcjGouXZYT0sgiPfX+SaV9NQa8W+EMYur7nkWAHzqvGNhSHrWrp//OGWntDpeYWY2nu/IPxH/HsYcymHlkAU82dj9KkJiM/VHCkJ/PeEq5i39M0McPgAu7KrurIfcUF2+QLDdhKlrwHET6+4NI/imY3D0oz4C3EUPAPR7ljzNCIiR8/QU1oahR1MnQt0Id/3rHnPSEn+5zEprBUGIookH3oV29HltKOXw2JL4R3r2EdNpBO9DmOSzN+7GCXWLt5j9s3qAeMfA03RuGcD5JbN9G3mztyewKTw+2PSeJv47wpVq7ffA0vTWd14Cqx2/rohOp9t51cccTBxhB29oFPYoYQA6aWxOHvHDbh4i5VOnvgtXC96XritI5upQLQe7nQ9vkqqnZb/J3CaZXGWs4HNjcKJ2KgOo30vpcS9/Wdn7L9K0J/VYnNeiSJpGphgZ0ONfUvqucrfdZIwCDcSH/a1i+VMjFms9YOM26nVPBERCyLou1bC15g07BpVl2OQ1VByH1APx271mMb05wXsNl4eAaNAYgeK8JlCqPxH/GDfWj6NVbbQVys7QLQoN8GslChE/9IJQ13EaEe5lW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gGkmRLLC7BHw6c63ntbDDTulT1gjXjOOn+Urs0vNHzb0YoXQfy/wNhd1lV6b?=
 =?us-ascii?Q?6iziCZ8FhXkGRNDuMuRJmWRHxG6Gv2Fpg6DvzXddeVY7B1Dq78YSD5lw41ik?=
 =?us-ascii?Q?1yJhkNe7wTBLfTBKvFSRMmzfTT/+5rMUwYJs9fa47alR3Okua73wwBbywBcW?=
 =?us-ascii?Q?YVWF3Km6/N68hM2yidAGXy8T+gRDc0u6EVyzh5awT4gquDweWZq7jaX9Tdy1?=
 =?us-ascii?Q?PvMPEaUH2SjJOVAdvjjpxwEPK6eoSpH8dGHpsbDEySepCwy9DjMQimoI0Hmn?=
 =?us-ascii?Q?AzHEGbM9najtDLt1YCyRpgL05hrdnPi1eGvNKesWLH6nLNObLkTW9pHiaw0Y?=
 =?us-ascii?Q?HKN9/+T6/DdycopPTOVv5wlsfaJzO1fEshbordthH3pmpEdMtwKj/cjXZ2De?=
 =?us-ascii?Q?7DFlLhFm9e12MiQzVMTL6BrkUFGozeDQ1PFbEQYsW88ssZ/GdeA3CYi9IpKd?=
 =?us-ascii?Q?hFHUnbLLvxIcScI36ssbnoUOd8NgNkeUWovmt41NtLxdZhU+ekxWJz6eQNF5?=
 =?us-ascii?Q?7oBKuQmFUQMS3TOGpoX1XTqslkaFs2U1D2mCsRHr5F5zaqeoF7jzFw+NZmHk?=
 =?us-ascii?Q?SpVCKEzWPhEJ8FUE5ILOvj8Ab2Ye/AVnwFAYaxy3iDuwMQfZvE3zHjgMZR7W?=
 =?us-ascii?Q?BuuF/sGWCVO5HOL3BzH0Pj24v+IlbZJzC/OVqhRCa4UNI/SbrGGu3jrf1hOK?=
 =?us-ascii?Q?Mqiwd1EeivnULNn801yWxsQ6TR+HJxvF0BbSlHitwCvI7WTgfhGx3IPLUXk/?=
 =?us-ascii?Q?2hoTWPx+F8tBTaFsO6bPn26+OL3suRXCsMmDG3UMjcp6W27SR7qYjZYjyv5w?=
 =?us-ascii?Q?/uiovpQz1kAWkUGxeBf+o0Kap8GEosFl4oXA38JPjgaZVVZwUdxBDdP/FZyG?=
 =?us-ascii?Q?rOYK+tM7pT65zttb4MDzn+Rx2uF1wCMGfrAbUqYQlN/ho74AJWWn6bz1cizk?=
 =?us-ascii?Q?x4jFBLfaMqcQZVR8PW05R+5O7KaVoA+DXW7DacChbGH3xXm9kEO50vmvsLA6?=
 =?us-ascii?Q?CixH3/Cj49RNKjxPatdN9L/nhRpf3VlCunBDCtNcKPvczxr40petsPOL6RAy?=
 =?us-ascii?Q?eX847lW/cEVcIM7DxgRyznseU8Fi2YQSogXCOXpyIQsZVmYzdQH4Cqefxb1D?=
 =?us-ascii?Q?UDDPA8fSJ0gl8cn1fV9HPeCV+Rm/xNop+qOUdha19XPV4mFO0/7wKd//YNvK?=
 =?us-ascii?Q?MxE+4BFW99opJBwmYu578mv6Tz+k6Do7R31lIVC9Lr0fsXMbR+F8z9MRzdKN?=
 =?us-ascii?Q?4au96brbOsHNfvC3AIxJmBWBXsMD+a4o50dwLo98uIe7a68t2ugo5+qp/Ljo?=
 =?us-ascii?Q?9upBo9KJqOJPNhrs3ccC78j0WUoSe+ffBJnu5UekB5Sv3IXHCj2kWF6bwUJA?=
 =?us-ascii?Q?8OC+7LiS/QZI3guvuuZgHuSXCNaOdnYRdbcLZ0DbFQsKfS+24oCQBpUYt9WR?=
 =?us-ascii?Q?ZGibkjf38qhR6UzJ0BmoE6adYDF88ZXapcnl05tij5T8P4bjGpHH0o1X0qd9?=
 =?us-ascii?Q?U2jajxVEfWzuoCUbiEfR5CLVTfRhCx3KznKQVu4cCDKEjU1sxRVvujzK06Gr?=
 =?us-ascii?Q?upJjkWHBrvzLlueI5FQzQIf0s5piQCsRZpImYAVnB2QeCQud5NbJBwlZjuF8?=
 =?us-ascii?Q?Udfa+E+TmPdN3ymij+q6zPPXwNIGFvhhrGvo4z8d+uFAvRtmbdl1yFlJbPXO?=
 =?us-ascii?Q?3grhz1Wm+T8zkUIrPO5kurXC6/fdjGIzPEAYwWhJIkTphnwbqCMHIfYvmeXb?=
 =?us-ascii?Q?uLodllxZGw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604d55f3-8e53-4544-968a-08deb507d3ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:03:56.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYfIqSyw/5wVZkwG/UszyxE/PLTLfYwjBnSl9bNRuEbqeDr3lBTs3PvSz+rwEq7rsz9caIgLxVdYKE7ybohAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999212

Add the `VramAddress` bitfield-backed type representing a physical address
in VRAM. The bitfield layout splits the address into a 12-bit intra-page
offset and a 52-bit physical frame number, matching the GPU MMU
addressing scheme. also add a few conversion traits required in later
patches.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 3b131aedf2f9..f8a70f93bc03 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -31,11 +31,62 @@ macro_rules! impl_pfn_bounded {
     };
 }
 
+use core::ops::Range;
+
 use kernel::{
+    bitfield,
     num::Bounded,
     prelude::*, //
 };
 
+bitfield! {
+    /// Physical VRAM address in GPU video memory.
+    pub(crate) struct VramAddress(u64) {
+        /// Offset within 4KB page.
+        11:0    offset;
+        /// Physical frame number.
+        63:12   frame_number => Pfn;
+    }
+}
+
+impl VramAddress {
+    /// Create a new VRAM address from a raw value.
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self::from_raw(addr)
+    }
+
+    /// Get the raw address value as `u64`.
+    pub(crate) const fn raw(&self) -> u64 {
+        self.into_raw()
+    }
+}
+
+// Allow VRAM addresses to be printed with the `{:#x}` format specifier.
+impl core::fmt::LowerHex for VramAddress {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        core::fmt::LowerHex::fmt(&self.raw(), f)
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> Self {
+        Self::zeroed().with_frame_number(pfn)
+    }
+}
+
+/// Extension trait to convert a `Range<u64>` of byte addresses into a
+/// `Range<VramAddress>`.
+pub(crate) trait IntoVramRange {
+    /// Convert this range of byte addresses into a `Range<VramAddress>`.
+    fn into_vram_range(self) -> Range<VramAddress>;
+}
+
+impl IntoVramRange for Range<u64> {
+    fn into_vram_range(self) -> Range<VramAddress> {
+        VramAddress::new(self.start)..VramAddress::new(self.end)
+    }
+}
+
 /// Physical Frame Number.
 ///
 /// Represents a physical page in VRAM.
@@ -55,6 +106,12 @@ pub(crate) const fn raw(self) -> u64 {
     }
 }
 
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
 impl From<u64> for Pfn {
     fn from(val: u64) -> Self {
         Self(val)
-- 
2.34.1

