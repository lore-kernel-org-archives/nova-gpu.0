Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063B37A481
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188283; cv=fail; b=srYBKuOrQcc+zpuUrNMQ7p+Fg1wA0FhK4zpxBAxlvGwca8eqPOXpnVLToLBfzzobr0/fKz1Q88WAs7j0K8x8K24UuJNxHt1gm7lmlIWYMLgtVX3Alq5iO3t/p6DgoDZjWHRw9kb8/w0XV/mbjHXj0CJZvLKOHKUm0OY86G7qppk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188283; c=relaxed/simple;
	bh=DIy25/b2/wnur/yt33Wq6vHne3nNQyI9BEBRTr587NE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rC1D1W2Ht6J0yiKmkrGlLh47ikpfURom/w/6TSW5m/gyKwgPk9RSYh2H+VntkcBhtuj4ZLq5rJlPmYQud6VTPrZzdg31mJ0e6WDKFdF4jNXs76nz+5H/211VQwyK5ei/0yiTS24WwPVuJ4UKKZeQOGsBa3p4fLXxQ8jbpYccrGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dz5ENJ3U; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dz5ENJ3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkJ2lhnYVt9JbSigYUxX12Cq1U4XaoFUy519YmPS7zlI+D6mm6zmI20hX3RUmd8MpeKus69BGdYdAMI1Y4vdCwRCCwTgCfZLCFTLtTM/1ug8FuqITudmjgUOQ8BgrIoT4BSivgidvMf1ZuuU10XLDrdUWvmpPyqLxaPkSnLqU/wgXKWd+/al8SG9dMq5narQLWqtGNMCNCP3Qja6QPpZeWWsRZiLdIoJ43YgVHczNme/0a7OZbZJRWHfJ+w0u0ARhXKO4FODvvhHAe/qABB4aUm4++6F1BP+h8Snzp1Djkshjy4lMPf+VvWx1HhtQXk7scOKgPKWuEwvqW21M+FY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dv7/7+9hTIe95WgqSRK8NGJCl639mvRp2nzqcSFDqZM=;
 b=uJ9SNM/mxZJ2+mco9gND7XD6VDVInvP5G5FBEGLCzMCYLzGATwXVJl3yySHtBTjB65R6I+sqkTc/jQUApaWSFES3SoeaUDPYYIsz1c+wd8gGwhdUI3CMuv5YozhysqIGnNOS+dDwap3XuYi9MEqFtF6mC1pHq0QXkc9AnwW8CKEEVZ3YtlT8NVTzKxQGBnXJ1ChHluO2wLUJiIruEt7fIGETiIzF3DhQLijbyv2oG2XBLs+gjqUSkmfAj80dQNUzV7d1L66A77omC5EqHOsiCUctdWBuj0w4UI//T/FKC7qutZK+ueFmTXBIQe0PfWq26GlAfq+l8UEJcxZEtQTmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv7/7+9hTIe95WgqSRK8NGJCl639mvRp2nzqcSFDqZM=;
 b=Dz5ENJ3UK8alsncLsL26D74yqV4BYWNCSr1DeE6n3xrOpFtGVyV9zKiUWGIYH+ErBIfr56odlr7xijiTBeBYSuWttAXR6OmSnVDaDsiEgtzEOGiQOqNndpApM74DNoNgp8XSWTDr28djrA4vVixev9/ZyHT9TQpNugprkTZQFV6RZAutjBJ5KF5n/2/vIDPqDg/pM0OseYowxbYX1s7WhjJUBp+mZQZMfk6GTo/scpaFReUSBDXZ2+u87TAUCDSZLB89JDrgstIHSZbXd1tPK7MQSZYaKnGx3K8uyT+7TBL43ykz+ZekWNLb114c0Qk7GjluL0x3Qnb8U6xgj122LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:32 +0000
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
Subject: [PATCH v4 16/17] gpu: nova-core: add KUnit tests for the interrupt tree and HALs
Date: Fri, 11 Sep 2026 21:43:59 -0700
Message-ID: <20260912044400.677097-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 883037ec-661a-4a92-8fc1-08df1088899b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	ThVuRg8F9klSqn2w4T4OYCcZOs1W41TFaPrftFJCNWGSPflr2tXTESIUUmB3StEEjfBnbocUxjSX6P28exG0QlysNqe/t75RGmWasp34ieieCkLSGiJi6CFDZNpfVE8Kp2prLpsqbgYZp4as0KPYzB9MWqmykjBSpX4oKm/jnkGg+Hd/19a/l/pUpnvlrSmQ9psfoQXCKE8UuBFRbGXEZO+5frOCu/E/kqSOe3oyi9PstmQuiW6CEHR2MzF6qrJANSGFVVGtiikodB+sX+da2/pvTsGNqwDtUP+cNLinYrm9YnjZBXVRvefecpor78pkWwkPkYCK06MdHnVbfwrWLcyJLBMk00ZLMZirvjNTErmlxGXkc+Xv8LssS0dXW7gp9cGa4Vvh77ODo12dJLQgWn38ULOPgeHZu2k/rbhzFmerwOxl+2qzesvv220rgFHxN7IVW/YZXxN7AQvbFqwu5TCCeg9p4xi0rBHXRFZTsqmj/x5KO6MtHH12xMA0Rm0KyK+EEAzmV50vkRpjxOXxEgn/1/AKbooBnDdxiruC3orjn3J+UBGbYmL8ZLJJaenJrnHb1jr7kukSMcE8GdM2LxvLP0xbQCGrJ6Iva5/yVFlK53x36qZDz66UgCs1WriX17CV57OJtmqwTRhaF7JR7/ltzIeouKu38rWgG67tkBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d+budcKFwYWvajXD4NMyuxrf/iyIACNbVhCLyjyV5fb/4ZN0UBXXeJY4OIl3?=
 =?us-ascii?Q?ym3JxfSFtg5AUEvycyA6JVjquUSd7QZW4m+lkKsthX0gnJ9l0UrVQRtrquZZ?=
 =?us-ascii?Q?N8sHnS4FjyTy3RZmxhCdpqx7NnMWxS6ExO3JGGy9HdN6m3cYoTS7kZBJq7LS?=
 =?us-ascii?Q?FacWgiZqjje6I6dZ5PBb9swI8lNOhEaodjoyUXTp/bH7faPU6Z1j97T985M7?=
 =?us-ascii?Q?P6ib1OT91hA7+68C/T+NuoxBK4uXY2cs1vAf5poKb20/+T9/6/qOqISf3OXt?=
 =?us-ascii?Q?h0aWJT1V7YlnsZKyyD+VKHlztLpKv8G/pMlox4nahZz1pka3h5dvP3eNv1HA?=
 =?us-ascii?Q?ukEu5vL7K+Kza//cDDpopMqNP8wJpoKXi3ZEpnXuBCT7xDrEscIryGmBYtre?=
 =?us-ascii?Q?4x9jMX7Hb4IA60gRiZ/oot/8PB6p2h1Pmq24hoEQTCZthyTGUG1yZchwqJgC?=
 =?us-ascii?Q?YzwqqCWU7YPzHDtVi1HWG7cD2Ji9ESAESsYSYpKO239xA4w/ZTNdfnNQ1Kkr?=
 =?us-ascii?Q?YMVRPZj2UxN11pqcr6lT03uoD7p6TfTzW2QfixcDJaJ102kn3xoyCACb0oAl?=
 =?us-ascii?Q?pNx0UFwaeRQ3I3XCNsHmCf/p8jPtKC8AsRT6Jy2X+bcBfTA96NydDZZGGZX+?=
 =?us-ascii?Q?3uuqSDQOruERcg8td5b1wwW67oK2y9qZ6i8YMOGaJWCyM1vWXE9QEhrad4PB?=
 =?us-ascii?Q?bQbO8c9NYY7ho3GFQfqvGF7IBAaYWUXRDyJWWOWgZ/Th6M/+/2uyr34rkT9Y?=
 =?us-ascii?Q?bil8Zkap41akhe3IcYq0ncc/gdPjhE08KrleZw32ciCu59ryxg+ANfoagZgB?=
 =?us-ascii?Q?9iRZ2WEGLtthzaa5zChzVPKYAB1eEodkvILLULWBcakohbXc6xWL9x4gtF2i?=
 =?us-ascii?Q?CtzsBu0B70NXJREMP4mz0kZFn0k1JGw+EvfD6FH4KJ3jfZ66DCF5lgJwoEBU?=
 =?us-ascii?Q?8uNju4NPQ6IwKEq2ZXg46QLs7UO4STQNlfpfslDPxWvapxFDNBEtT1lcuJH7?=
 =?us-ascii?Q?S3w6BwXv7JSE+ViudWQFVkdZNjv81X+4T8pj2wsxdR6GCCX6QXr0O2r5L6uh?=
 =?us-ascii?Q?dGOCjzMplBMyG6bjsoD1jiTEpzOK7nyUAgA8y5CH18myc54QnNZUr7uoO4oR?=
 =?us-ascii?Q?3uPgrkfuYoD6D4Qy+Gd2FhM08Wwhd3kptc5tYFAeeVFHSFh+DCTgqVSxywTA?=
 =?us-ascii?Q?y3YgzSjCtujRtXMX/Lz5QTH7+Ix+kknLT20Bs1lvOO6rLJ8ZgR5MJzq/4r2r?=
 =?us-ascii?Q?rR3BKJJK3VdAsxubl1UkcN6Ipu6Pq2opQplc9eMc97IRb8vKFtB1bu876oq2?=
 =?us-ascii?Q?PJcm0pVt++QRnJe5CG27yTFgwXtP9Y53oZ9xVHHaCR9GmDkDpqBWWWEV1UJg?=
 =?us-ascii?Q?5UCuQeDrOoL9rDRu4CBKma8a0Esfnw1XKZTtjCmsfwDEknMcDlEDMNCfDfIK?=
 =?us-ascii?Q?5x7gvAtbYBmsb44M9dkf3Dk+9qmDMq7sq8MNCz3bV0AcC5dw7EK91A4Sd0nN?=
 =?us-ascii?Q?X9pe6t3786SlDCPniaGKZ+eDWt1m0kO9sAGFO+SL7YGRIMVWXBD/FxxhJ+Ei?=
 =?us-ascii?Q?zcqKrwc5MXWkl9IHy3QTUVABHp0unWC0iEhJ95L3mfBE8+T7JNuEqm1U0TIU?=
 =?us-ascii?Q?Eo6+QcOOTR/mgcSS4ah/cvQb5fkEqwU/GabI5nSI7tIOyC2tdcSKlroi2Jm1?=
 =?us-ascii?Q?qHwT7NrV852Zl+7ZP3gc/+2IHHRvwGeZj6TS0QPIzBr0ltqkTlS/QZGAMdAZ?=
 =?us-ascii?Q?ZW2LceMrNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883037ec-661a-4a92-8fc1-08df1088899b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:32.2507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oemG6qSS86hiulwEZzJE+KzSudY8KDD++6FG+cfmNqS60/G496iVfnXFn7bl5puuNMPAG1vs+tRbqFD1WceVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The vector arithmetic and the per-architecture interrupt properties
touch no hardware, so KUnit can cover both without a GPU. A wrong leaf
count or rearm method for one family would otherwise show up only on
that family's hardware.

Add three suites:

* nova_core_gin_tree covers the vector types. It checks that a leaf
  index stops at the widest supported tree, that a leaf count implies
  the right number of subtrees and vectors and enumerates every leaf in
  order, that a vector maps to the right leaf, bit and subtree, and
  that a vector beyond an 8-leaf tree is rejected there and accepted in
  a 16-leaf tree. It also exercises the subtree set operations and
  checks that every supported chipset implements the subtree that
  carries the GSP event.

* nova_core_gin_hal covers the CPU interrupt HAL: the 8-leaf tree on
  Turing through Ada and the 16-leaf tree on Hopper and later, the
  configuration-space rearm for pre-Hopper MSI, the TOP-enable rearm
  for Hopper-plus MSI, and the single-subtree rearm for MSI-X on every
  family.

* nova_core_falcon_hal covers the falcon interrupt HAL: which chipsets
  have the retrigger register, and which routing offsets each uses.
  GA100 appears on the Turing side of one split and the Ampere side of
  the other, because it has the retrigger register but keeps the Turing
  routing offsets.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs         |  48 +++++++
 drivers/gpu/nova-core/irq/hal.rs            |  64 ++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 135 +++++++++++++++++++-
 3 files changed, 246 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 3f1f509eccbd..70bddcaf4266 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -171,3 +171,51 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
 
     Ok(hal)
 }
+
+#[kunit_tests(nova_core_falcon_hal)]
+mod tests {
+    use super::*;
+
+    /// Turing falcons have no retrigger register. GA100 and every later chipset have it.
+    #[test]
+    fn intr_retrigger_gate_per_arch() {
+        for chipset in [Chipset::TU102, Chipset::TU116] {
+            assert!(!falcon_intr_hal(chipset).has_intr_retrigger());
+        }
+
+        for chipset in [
+            Chipset::GA100,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert!(falcon_intr_hal(chipset).has_intr_retrigger());
+        }
+    }
+
+    /// The RISC-V routing offsets change at GA102, so GA100 still uses the Turing ones.
+    #[test]
+    fn riscv_routing_offsets_split_at_ga102() {
+        for chipset in [Chipset::TU102, Chipset::TU116, Chipset::GA100] {
+            assert_eq!(
+                falcon_intr_hal(chipset).riscv_routing(),
+                RiscvRouting::Tu102
+            );
+        }
+
+        for chipset in [
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert_eq!(
+                falcon_intr_hal(chipset).riscv_routing(),
+                RiscvRouting::Ga102
+            );
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
index ede9a10ccda6..03852918013d 100644
--- a/drivers/gpu/nova-core/irq/hal.rs
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -88,3 +88,67 @@ pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInterruptHa
         }
     }
 }
+
+#[kunit_tests(nova_core_gin_hal)]
+mod tests {
+    use super::*;
+
+    use crate::gpu::Chipset;
+
+    /// Turing through Ada implement an 8-leaf tree.
+    #[test]
+    fn pre_hopper_tree_size() {
+        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] {
+            assert_eq!(cpu_interrupt_hal(chipset).leaf_count(), LeafCount::Eight);
+        }
+    }
+
+    /// Hopper and later implement a 16-leaf tree.
+    #[test]
+    fn hopper_plus_tree_size() {
+        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] {
+            assert_eq!(cpu_interrupt_hal(chipset).leaf_count(), LeafCount::Sixteen);
+        }
+    }
+
+    /// MSI rearms through the configuration-space mirror only before Hopper. Hopper and later
+    /// cycle the `TOP` enables of every serviced subtree.
+    #[test]
+    fn msi_rearm_method_per_arch() {
+        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(
+                hal.pci_irq_rearm_method(MsiType::Msi),
+                PciIrqRearmMethod::ConfigMirrorEoi
+            );
+        }
+
+        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(
+                hal.pci_irq_rearm_method(MsiType::Msi),
+                PciIrqRearmMethod::TopEnableCycleServiced
+            );
+        }
+    }
+
+    /// MSI-X rearms one subtree on every architecture, since each subtree has its own table
+    /// entry.
+    #[test]
+    fn msix_rearms_one_subtree_on_every_arch() {
+        for chipset in [
+            Chipset::TU102,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(
+                hal.pci_irq_rearm_method(MsiType::MsiX),
+                PciIrqRearmMethod::TopEnableCycleSubtree
+            );
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index eae1a1d4b933..66b7d2b16454 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -122,7 +122,10 @@ pub(super) const fn from_raw(raw: u32) -> Self {
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
@@ -490,3 +493,133 @@ fn drop(&mut self) {
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
+    /// Both fixed vectors are within the 8-leaf tree, so every supported part implements them.
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
+        for chipset in [
+            Chipset::TU102,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert!(cpu_interrupt_hal(chipset)
+                .leaf_count()
+                .subtree_set()
+                .contains(crate::irq::gsp::GSP_SUBTREE));
+        }
+    }
+}
-- 
2.55.0

