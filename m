Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C938AC8A
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967235; cv=fail; b=aOQ82ce+RgUSTGGHXifkmeChbXDqBTAkrBUXypzxGD1RI318PYEQkioRj9e9+gLDtbFNlWjZvDRAB0uYNRRaWETlQBMWCAHvgZjyvR8CcsYQ/H0cN5zlBt3/M+8ES3znaCmjs710WrKkOrzj8H6Aw7LkKpTeYs72UkPJ+7MtPxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967235; c=relaxed/simple;
	bh=2egL3ZyqdBWKKkEQkTqM6cUmYnj2oTA2wg/EfhdCipU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c/ce2jqhKt5oFLHY7+UrN0YWk2sAh5pC0uA5+gKuuANxmxsb7ant8Z7535UY5oblcAJ/g0ZdtUWeqYz5Vk50/90shnPuJfuJTiGxzxYB+/Fblcw3ayoKAvyyyI5FNfinKlN6WlmsUSf7EqFo2mX4ifxJA3QJBlD+r03itSfu7so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OgBMtIHE; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OgBMtIHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7sCrRSUku97AeTgNgdryupMSkZJFJ8ZJ7mDPy69vez7B9OdhmdBm0wv1rBTNy4B5ZmN5FTFw/4TyWXBz5VYqSVWK/YtNOtryHvILGqTJghnM4iuBtKY+GLAzYg9kQ6IDKVTSfnc2YaYeQgIcxaKfWDwqPxrgYxDOx7m970OMSe+ZG0CJeVEvGVt5wMkbpomxlLP2bEhpPGlWy4qeZRZN6Gb0mvbfqvY+teOt8ymQDTAFug4JsfUssXeL4rrqZsXwSfjDvPUULTStTRXSrAW8Ub7xMO9TuyX2quMugz17vVjIOEBCN5qu/IjplXLjxlo8OB36vEvC8EPvQnnKEnQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+KMev0mAAQ09bBL9hHweW0zxJpovDPdwWNeG6Sc4cE=;
 b=xiHtjPJMP/wkz7cptV2ZZivB4dj8l3u9U3n574DT5UmNNXV3PuhRlUdqNuDFnPC8kaqZ2XeRUrgM12UIRuddaJH9zhUvY1QMJxxNCHp6dWfFTi80PsosAR7sEMWgplR0PMXSatArCHLmLKk6WjV6U6jXVNILwATKpzUyiJOxi55lXp0ZwRn8cmQjtZ7uIZmTg+YrIGLNbk1uTHvnOIs34rwAPhQLcfZJag4Bb/jr4bTgGoJ2erC81ppUp301wP7g2UifeYHDpSf/tZLTDFeBmk/kEK1etJGSQl2zjuZvhKRQyoubhCMf+G9rpNn7+7UriL1wkbTIF8mzUnnEGepyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+KMev0mAAQ09bBL9hHweW0zxJpovDPdwWNeG6Sc4cE=;
 b=OgBMtIHEDSACduCEIY3zHclo/lIDxegjfgYp5S/ZzJpLXwqy/voeT94NpY6lr9B3iifvNVD8FYnqrWBzzVlBkbm6OptApEXP+TlFnL8fzVJp6L6BLInEll7mlqjlncXlPAxufMCJQ7EBcPPOBo6XFYHegQhawo36kr+CFvXFUPJcjBAIaZqikU/V0LSlgR8UPUjvS1RMTshd2xvKx+ZWGrT77ZsmMdGTBBUQZP9WFHGl5pTbVWgZtxgBXQc1hzKse0qnxGIvIfxLmHz/K86vw1KsaZWUhge3ZDM3IrcbJYg0R5LPyfO2SZdasg5MslcZqsLit2sF9Gw/Tu4Trjg9Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:41 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v2 14/15] gpu: nova-core: add KUnit tests for the interrupt tree and HALs
Date: Fri, 28 Aug 2026 18:33:33 -0700
Message-ID: <20260829013324.499542-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc82c62-5aa8-402d-4b21-08df056d8e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wA3Lz5DKzVS00Kzpt5SwtnleYoZvLnZDZ+5+gWfyRwhOybTb7jbulDOwcoimrUs/zoOsU+tR80kenxF/mdhjJleB2IiovOvGFmoUjZv8yZrT3/+A+AbKznFYcRl4rleqfw7CosVG1ufHsIvmgtkQR5UdhNxh9A+gSi5Evn2Go+9eVcG97zXEAgeMPjYXZ5gCA9z7+++DPjwrLmuRBivVp+n5eR9jWyhvnj4MFA+e2eh6S7DVIC2ePt4sLm4NnuIWm/2Vk0bjnB5o25KxwJ9LrXGNFW0eZI2GeixVo/7cmnMPlXMXLQLD61H0eD2nz8Pl/Z8tIr5E30SdHTxt1XSXi/CDeF6vZ0AanDoVFc/Fp0IvtZIwZxJsu50QDVxd2LlcQlcNcVEapjqzWC0OnndStC9WTcS+2fZjgYUXtBmj9S2NlwMlI//T4N0HaGDVCEecCVhXk4Gcnf8xBpMDfUZja0ToWm8eGtSimFglSKwteOkmLkWwBiCDC1bUaAnFHiOyYLHYdXPkOZcIZ3xHFaL3R38etZKDfH20Mh3VOGaVRyvZTbK8bZ7K87L23QoGEYob97AdBtOw5lwdP4VJrmv6FMy239v3CjofrX+2h33MH2KOMDkKy5jU9jNTTrYzE6yXVKExWG6bV/F9DnJRp9pIc3RPtw9p5x6CLCUaIU6yfL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fzrxRCV+piUSjseOOKMrOGvgeFe4O8qgqHhub2Om5XHGDlG6rFz92XHQ8dCY?=
 =?us-ascii?Q?2lxoVLkxPiI4zfM8WYHhwCDYSUawJlvn17gKyHFid1P/d/FnRQueTSm2PmID?=
 =?us-ascii?Q?kFclLs9eMrO5rBORAKRbyUDkYQm8fEkjn8RVHmIMmaIIw7qgzmbwCVywdg1z?=
 =?us-ascii?Q?sSnQmn/+NMgVa3s84E6N6+zlkycb2Onm5aDIMvMgVUGJZ8XHsZhEiC94Pgct?=
 =?us-ascii?Q?gNMFGK5IQD6tKGGC9NWj/y32fI84yg0BxpdJJQzZflWmJWO6VATBJKQRVQpq?=
 =?us-ascii?Q?2IXRTIMibu9Gns9TcqwpiITgnEw/0gy2xeULN1N/RvWSDydkXob85SdlhHhk?=
 =?us-ascii?Q?LU3LvqIJJ0iRu80Z4wWwV+iEsygjX7RU+08XuY7y6B97cy3diKvQkpuAF9bj?=
 =?us-ascii?Q?058oZCgh1HQQ/nn2izoymtNR8sVvkwHf0mlbUSj4Rao+7OTQdIMo0ak7hmug?=
 =?us-ascii?Q?XlTxzQz5eOO2Yv9OGxbnREkCGcrFYS5mGRdQ+/XvOT+OtBNMvLQmQKdbCjOL?=
 =?us-ascii?Q?CjiGXWEvdAacbuiJyNl3QXVc+6nQ7lVSJgwtFhinb+Ri8eZbAji6rqSUVCU5?=
 =?us-ascii?Q?iVXMDzZtyCgymrr3PggmXOXncMX+N+CAqY/j1ym5ANJnOBKQbUOuVzvZ7vMh?=
 =?us-ascii?Q?oHFJS5IhfJL7B0QOcbASmi3LUY+H/BgGapVbjF2Ei6xdweAuY29W10zTSj8V?=
 =?us-ascii?Q?/2oO//Zaet3M3JQ1y+Rbt2hTvV0baSMc0IqPLi55hVlMUaJfGA49JJ2BpqOu?=
 =?us-ascii?Q?kWof/NKl9j/gm7UFw9EQjqV91GSGrJXHD/7xUq2ZkhMUeNwGSzRcnq8lkYND?=
 =?us-ascii?Q?4vDATr5mxkp5LkvKABssJ1M4OGaMX2minbX1hcr2/Ct/jqUK0H5T3ELZSRfp?=
 =?us-ascii?Q?fC5tYWn7b91hlGhDkS6pab/VvUDynHV1Da7Wv0C8jL/Ot3Qc0DSVKnsnZkRf?=
 =?us-ascii?Q?ZEtkZg7UVQP6K8cvLkxdlhFaNCVb88t2hFT8OUbps+pv98VnEfMnipQgDfqe?=
 =?us-ascii?Q?/KkY2QEi9hcQ0GeXcwPYWjgmVEE3C97UrHxZBnff9crUUBgqqe4PdcUop6OQ?=
 =?us-ascii?Q?9I3GAWCEacB5LGyTIIQAGzWHR2p4r/9iRDfbDh7SYvgJ4h65UloMz9lTr4wX?=
 =?us-ascii?Q?DaHPPwXOABf9PeyBwmvR/y/QOT/dKGmd9YhL6H+F8fcHj56e4iiEeVjlenPP?=
 =?us-ascii?Q?bwLWsmyo6MKfnVqvCCkbdcN2FZ23SQUIIC6T/cJjJJ8A1igSysBLEEUovYpf?=
 =?us-ascii?Q?ZVayWTKo2+XoJ/7V9ooLOQbK8ynrTa7URa9mAtAd6cxLcN1WBZyLKil1w7Qg?=
 =?us-ascii?Q?DEEs2OAPpdm45DD/o3T2MT04cEz9HEmhnn1EjIp6friaMm39JMcHn8oLNKdy?=
 =?us-ascii?Q?u9H1SR+d59Hig5zJOIO8DLWYHaWqFeHjR/Dqr5+UK/OF5Xj1zcLxFbe3IbpR?=
 =?us-ascii?Q?zOIdZL+BXNy96d8FC3ZiYMHnGNvsONfcfcJX3fQmvu3vrnFPD4vtxQdHKL5C?=
 =?us-ascii?Q?PqW4bVtP+GJ4EJZF+qwinA4nXF7p6tquuZtfLLbHXCLJONH4r8HAoxBsaW4m?=
 =?us-ascii?Q?hgOP5iSBO0K+ZScp4BKjZE7HoikyXy1rIzPUcQE7HkX0PtUs0c6peGV47Q30?=
 =?us-ascii?Q?CdeDGCxiSeZt974klF5wdl+HMoBgnX6IgZDeaRD6x7Ue4DmeRV0S1lfsfx+L?=
 =?us-ascii?Q?tObpbliTElxKW+D/CHssPpZP9RDQm7BwWF2TP5neu3B32jsPj/4oH2nZxvE2?=
 =?us-ascii?Q?QpumwSsPDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc82c62-5aa8-402d-4b21-08df056d8e6d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:41.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN2TdD/DN1ra160nRUQSHnnom6sZJGt8M9o9au0oHmDSS5jDoMvKk8+9HDciam6j9OWR18ldYY2iiaIUfW78JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

Neither the per-architecture interrupt policy nor the vector
arithmetic touches hardware, so KUnit can cover both without a GPU.

Add three suites:

    * nova_core_gin_tree covers the leaf index bounds, what a leaf count
    derives, the subtree-to-leaf mapping and its out-of-range filtering,
    where a vector lands in the tree, the bound that rejects a vector
    outside it, the subtree set operations, and that every supported
    chipset implements the subtree carrying the GSP notification.

    * nova_core_gin_hal covers the tree size on each family, and the
    rearm method for each combination of family and interrupt type.

    * nova_core_falcon_hal covers the falcon retrigger gate. It is keyed
    on the architecture rather than the HAL, because GA100 shares the
    Turing HAL but does have the register.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs         |  24 +++++
 drivers/gpu/nova-core/irq/hal.rs            |  83 ++++++++++++++-
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 110 ++++++++++++++++++++
 3 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index f0828b32aebb..6bff9fea1a79 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -107,3 +107,27 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
 
     Ok(hal)
 }
+
+#[kunit_tests(nova_core_falcon_hal)]
+mod tests {
+    use super::*;
+
+    /// Only Turing falcons lack the interrupt retrigger register. GA100 has it even though
+    /// [`falcon_hal`] gives GA100 the Turing HAL, which is why the gate is keyed on the
+    /// architecture instead.
+    #[test]
+    fn intr_retrigger_gate_per_arch() {
+        assert!(!has_intr_retrigger(Chipset::TU102));
+
+        for chipset in [
+            Chipset::GA100,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert!(has_intr_retrigger(chipset));
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
index ee354859b965..c7ecdc44144b 100644
--- a/drivers/gpu/nova-core/irq/hal.rs
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -8,7 +8,8 @@
 
 use kernel::{
     io::Io,
-    pci::IrqType, //
+    pci::IrqType,
+    prelude::*, //
 };
 
 use crate::{
@@ -109,3 +110,83 @@ pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInterruptHa
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
+    /// Pre-Hopper parts have an 8-leaf tree.
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
+    /// Only pre-Hopper MSI rearms through the configuration-space mirror. MSI on Hopper and later
+    /// cycles the `TOP` enables of every serviced subtree.
+    #[test]
+    fn msi_rearm_method_per_arch() {
+        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(
+                hal.pci_irq_rearm_method(IrqType::Msi),
+                Some(PciIrqRearmMethod::ConfigMirrorEoi)
+            );
+        }
+
+        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(
+                hal.pci_irq_rearm_method(IrqType::Msi),
+                Some(PciIrqRearmMethod::TopEnableCycleServiced)
+            );
+        }
+    }
+
+    /// MSI-X gives each subtree its own table entry, so on every architecture its rearm cycles
+    /// only the subtree the handler serves.
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
+                hal.pci_irq_rearm_method(IrqType::MsiX),
+                Some(PciIrqRearmMethod::TopEnableCycleSubtree)
+            );
+        }
+    }
+
+    /// `INTx` is level-triggered and needs no rearm write on any architecture.
+    #[test]
+    fn intx_needs_no_rearm() {
+        for chipset in [
+            Chipset::TU102,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(hal.pci_irq_rearm_method(IrqType::Intx), None);
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 02077184fd17..7277ffcb33a1 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -503,3 +503,113 @@ fn drop(&mut self) {
         clear_top_enables(self.bar, self.serviced);
     }
 }
+
+#[kunit_tests(nova_core_gin_tree)]
+mod tests {
+    use super::*;
+
+    /// A leaf index is a `Bounded<usize, 4>`, so it accepts 0..=15 and rejects 16.
+    #[test]
+    fn leaf_index_bounds() {
+        assert!(LeafIndex::try_new(0).is_some());
+        assert!(LeafIndex::try_new(15).is_some());
+        assert!(LeafIndex::try_new(16).is_none());
+    }
+
+    /// A leaf count yields one subtree per pair of leaves, and 32 vectors per leaf.
+    #[test]
+    fn leaf_count_derives_subtrees_and_vectors() {
+        assert_eq!(LeafCount::Eight.subtree_count(), 4);
+        assert_eq!(LeafCount::Eight.subtree_set().into_raw(), 0x0f);
+        assert_eq!(LeafCount::Eight.vector_count(), 256);
+
+        assert_eq!(LeafCount::Sixteen.subtree_count(), 8);
+        assert_eq!(LeafCount::Sixteen.subtree_set().into_raw(), 0xff);
+        assert_eq!(LeafCount::Sixteen.vector_count(), 512);
+    }
+
+    /// Subtree `N` covers the two adjacent leaves `2N` and `2N + 1`, and an index past the leaf
+    /// register arrays yields nothing.
+    #[test]
+    fn subtree_covers_two_adjacent_leaves() {
+        for index in 0..8u32 {
+            let first = crate::num::u32_as_usize(index) * 2;
+            let mut leaves = subtree_leaves(index);
+
+            assert_eq!(leaves.next().map(LeafIndex::get), Some(first));
+            assert_eq!(leaves.next().map(LeafIndex::get), Some(first + 1));
+            assert!(leaves.next().is_none());
+        }
+
+        // Subtree 8 would cover leaves 16 and 17, both beyond the leaf index range.
+        assert!(subtree_leaves(8).next().is_none());
+    }
+
+    /// A vector maps to its leaf, its bit within that leaf, and its subtree. The fixed doorbell
+    /// (129) and GSP (155) vectors share a subtree, so one allocation and one enabled subtree
+    /// serve both.
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
+    /// Both fixed vectors lie within the 8-leaf tree, so every supported part carries them.
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
+    /// A subtree set reports membership, intersection, and how far it extends from subtree 0.
+    #[test]
+    fn subtree_set_operations() {
+        let gsp = GinVector::new::<155>().subtree();
+
+        assert!(LeafCount::Eight.subtree_set().contains(gsp));
+        assert!(!LeafCount::Eight.subtree_set().is_empty());
+
+        // Subtree 2 is the highest the GSP needs, so an MSI-X request covers entries 0 through 2.
+        assert_eq!(SubtreeSet::from(gsp).span(), 3);
+
+        // Hopper implements every subtree an 8-leaf tree does.
+        assert_eq!(
+            LeafCount::Sixteen
+                .subtree_set()
+                .intersection(LeafCount::Eight.subtree_set()),
+            LeafCount::Eight.subtree_set()
+        );
+    }
+
+    /// Every supported chipset implements the subtree that carries the GSP notification.
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

