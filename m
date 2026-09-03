Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00765372046
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405345; cv=fail; b=SZxdxOuj2/R0lxGA1IF36SCgfSi2FzdQ9lIGolmK0/WFO05VymFU8Ua0YJGgvTnUYWtadvodI7qxYE/bXl/3zPicnjRTIEJ3VIrSOX4ZD+tc2VLaeV03ebvSUgmkQxQ2IeMigyp4mNCvpmw8BIDAx8JHgT1HOPr4XFVl8D+v4XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405345; c=relaxed/simple;
	bh=94DWsfvNnQwxHLozwDMnMXwnkpgcrDkAxOQSKrxsQCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UHALWb/ipjVKsHrUhofqVt/j6rKKhjkIW8smF9NqVEjeMPxupas+hOdBtJkrK0XN+hsn324BLvXoOWQihV03jl9A3Qv8P6LJ/nAFZqXPJurpZ+z4rFhPsLDVeccbConXj3lBCmv7ujmwoeckZJB489MLe5D22WnMeUKU3VgUv8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NMJfCZmk; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NMJfCZmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl4+6xbG0w3sTzA+Oa0kMkDyCF1DDBLv1AxmXULXB0TBklA7oI8yx/pdFAAcFhY6/pB/0PIbvnRMr4fTcpj0f+x3EII0zVYcyppjHWNSZ/xOagRhDnHxIELSxygB7FOjTRvIUdC2aTliEtmh8EJ6R8usoqL4pKsYv8GFx+JZ7b1G0eiMAhrkInGmIAKthCS96VtUi4oKY1NDNv0Y9oUxzNmVMwS6zDuoTI0/VGMhYnb8Vf9znn1+s/Xk7fE+aMa+qFSMy7jPlz0lflHqhAwWN0xcSNHy7DtNXdA4kG6YyEhRjNQ7lnu6k2lQXIGmj2KSVzT0/NGBUQYhD4mi3Qo9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwaKpc4UeqAEbuhPLhIP9D6qh4pSpgGkqZ3MVndj+wI=;
 b=nNiwDPZSRRWs49lz/eh/eH7gJ5mnBpYO/QkXKCzH6E2aldILMRfnL+X7MVqnw5xnx+AKk9waCH973etDIpOw9xdnHhPzxz4nBpoOQ5jYPiemIUJHeunNVkPZZ3s4xLDjfWoqxTdYNRd6CGLM0kVqrecuueiDekP+t30Oid+2zbxFYQltYWQwKAQ1Jq/IXBEhEtv6BeQa+9ZL3gV1ulnrRn9kCZFX4fGWjvr4BOqjIsVDGopzQ/3pL5KxNpf52MNSbGiplPpcY6iD8bUl/ccv1+VaOo8TbecT2rtPI8GyCWB5MH1WVtXxGTBo/npnsqHch7dmwazvtre/ynZ8/wZDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwaKpc4UeqAEbuhPLhIP9D6qh4pSpgGkqZ3MVndj+wI=;
 b=NMJfCZmkDJBcVMDg/TmC45qQJtDvTMI5kmTKo+ech/18xZFPevOJFhOsBe1bbQTZ1/7k4P5DPCHrKB174jXQGSyXrymCZqHJtIqPtZ4/NFjtdk3R0kR4/auWodE30r0SCmTgpqbK5lincJF8Pjrga+/ooAKos6di0/rofYB19Oh46c5Rr0CI4z2Q4vFlHczS5c+ToAVCEbqLwWFpgGMYJDITGldFNwCnSuajz2/sVaU34l9HFWQHfrT6fnxDEEvKPN1D3b15L8GwEu1XjQsMJBcxxyWxpPZIva2AO3MgRHA5QMN0SLdvZl0aZYbUTsUjdKtnxbh8TT9VanpWucXUhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH0PR12MB8487.namprd12.prod.outlook.com (2603:10b6:610:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 03:15:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:34 +0000
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
Subject: [PATCH v3 13/14] gpu: nova-core: add KUnit tests for the interrupt tree and HALs
Date: Wed,  2 Sep 2026 20:15:12 -0700
Message-ID: <20260903031514.1515905-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c69edf-1cd2-4799-f592-08df09699e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bU5woDpqeG9WmcjQ6/eBT5qAc5gEvlUu4vGsxJMYBM2B/rRwobJoKdmbx5S7OORUjmnFrsjOaRMGItbI9AVpHj8KR0uiEVnCBh43yr7o0u5I4vJNgbm/K8xNzKOlLaiSAJ1hNboFTkSM2Uy66h6Yj40kOtVcAZ8VUT2n5TfZ86BIWVPUh0do5gqnHYEq9VXKQU7apCtIrguv9Py81lhrw7zFCiGTAAdHUZZOTTyWpKnSVrjRWZ6Ib2I7gZwN/TRXTFWcD63Dp3GhxzjJRmxrD/Ivv1kNSv1ntsv4T4NitXYiszm2PkVPk7C9v78e6Xxw7lFKPHimYM36duxxKpD2azqprbobYphAboTGim6PxbmhknQqKKniH674paaSx8s/7MOFm8SwT/x/RXThXVa0SL/bSaYNxMew7JnKBmVcDjPjsLJFl8IOpaNb7s7QNwryaSdn/RsfstG/p48WCNcKsjcFvFspoRqQBPVSpmN7G/DR3XgbavS0A3tcH991Rh+vTZJaRf9Lork7rsHB0XBxG7xHcVMtDweRv/0IkTHN226R3D8vkQSqod/bonbIupDMkgDOwFNDQ1U3jV4DDeTD2N6Vikoa3RysgHtxLu9FlIxGw6/Wi5JonPRrqsaQu2HJBcORiwgxWzK1ew34DMb1wKb13pbUc9xPKqIa6WLjzTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cJcVd7hqo0CWGrLatoC/Jl4vN5gp5uuA53OVA7AbKFE/YHutEhOuhCYmMGAC?=
 =?us-ascii?Q?cidVA/QQagTWsYCvJAayC7pL6mrjfD2RI5o0Cgq4LC7WVauG+JeI8HCKT/Sl?=
 =?us-ascii?Q?Ee77XJP0EEsGCyPUSHJWv66iJ83lMNVttIiwODvjQA0RTdwTCJOFxAofrGwC?=
 =?us-ascii?Q?TDOn6R0ip7UVsWBBWzorOU3KTRAWmt9GLJr1oOU00K9xfNIEdMKolXjkQsvz?=
 =?us-ascii?Q?0bowZMOacLetfdir+fR81drPkQkn619q62maJDAqjcozxo6j2UvSJS5VOFNe?=
 =?us-ascii?Q?73okBFO8fn3zi7OU3vYUSsK7cdEyQqThhNvqy36q5sNGWHHCfe0orXCq6fNV?=
 =?us-ascii?Q?5CzT4BRMlNeFAE/H8p6crIXRcsXESsXcb5MjEm8jfwVn1Lvu8r/AeNK1Lb9X?=
 =?us-ascii?Q?joHTBNOPwj9guTk5YWZCwUxsqbk/Ai6IYQ1v43PfCoOdIoPegYwhGC1RIqjR?=
 =?us-ascii?Q?2ahvROyrL64wEiLoqRzf841sxETdlE355v+Sh9k8We3rqiRzYAwaA/RF4HBK?=
 =?us-ascii?Q?H0GUt+fHVElp8zhvJU/CNfM5+eRJBeWFo+vIupV4nPUwGdzx1Fp0i8o+WUdR?=
 =?us-ascii?Q?QvwAboZ/rF0A6TkqLvThtJg9KSbtuI5S4+GHSuVHVzL6LMmZNGFwO5Ms+9m0?=
 =?us-ascii?Q?q6iXOP6VQl1j97RwvwCzfLhL5/FxlkGY7EzCITV467iis3dDas/2SltPm4jV?=
 =?us-ascii?Q?jHg3CWPKpkrpA2vFdgEVEqu2sa7rp2HrRyhGP8sLloYFPoRjffZ7nBLemBAv?=
 =?us-ascii?Q?niP4/6pxsxL7r1O1xMCGxeO8nuMFalO+TMjfcqdiRoa9eOtFyEi2YB/D3LVX?=
 =?us-ascii?Q?MifiPqFCNJcE7fw3jDICqLzRfxFhnpn2TWbt5haC9M6Co/Eyy16JXruR4R0o?=
 =?us-ascii?Q?g6rl/+alT7daOUFF4lPTyTvNU5BOgd1mC740kiX13li3ZarRg4ibw9kMs/Nl?=
 =?us-ascii?Q?BG6EPxG30dhwf5B1fy9ug6g+3p92A8NifB0ddXxf/EfWbN1C6H/Oi62q7xiE?=
 =?us-ascii?Q?aidf/HEOneBOVIozswI1Yb5laT7w6C0So50VzKnU8nRzRuAXUnpjFYQU3Vs2?=
 =?us-ascii?Q?pjOWmmEJpZN5DgbEQHcF8H57rOE2CTiL8euXgR8a0qp7+ptyVjQqZ5TEDDJk?=
 =?us-ascii?Q?lMaNJoqK1YtPrA8OeAP6Be8fJbdU3v7W6NZb/nRq0gKH2TtTmR4IvGv49rpK?=
 =?us-ascii?Q?wYGUj0yC3lUkPzgEXgXBfUimCKuMrdiCdwF4DMf8LnZRMGt8EipEv8CO1pA4?=
 =?us-ascii?Q?BmD3txEw0NchouODh06dQLFCypGuNIuw8Zv7caeYGbruJMIa7qHu3Gm5UZY9?=
 =?us-ascii?Q?94wO6NwRNi7lktyCIjtRtaUxhAQrJfKV/5ejjbVtb/slvS13XTmISHjcovC+?=
 =?us-ascii?Q?fMBnez43ikJqXVOTGh1BY98IjZqBKm9JLXDJNmU2UbS0evnWYHnDkf5wD37P?=
 =?us-ascii?Q?cdmZydLA+PZoyP6HADH7i4IvSdRVL8W+nCf0rwfNZGkyxM/Io6WDQkkBFdB5?=
 =?us-ascii?Q?RkONNBi4uVZR2fObvOeZyCrXM/NSRzufZwy3iS5yIFRbiUuLbBMvowCMMvWW?=
 =?us-ascii?Q?K/fwXUuZAFhFiR3t/HWs4yGb+J5CBxuwFjGsMhjv+ImDS0GpMe5B/nVaFYKL?=
 =?us-ascii?Q?sgYxZquHmQlJbq1DLBHSrsEgewLYqkebkGTBgLpVnV/d5Klj2Me+hsluVgf+?=
 =?us-ascii?Q?VQf3GkDU+lBmeieJT7AsYb3DwK00KqfIm2wzOirrue1bfHpjAHLu49SmniiI?=
 =?us-ascii?Q?uQrq9mX8zw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c69edf-1cd2-4799-f592-08df09699e27
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:34.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0k/55jD6j7KxhiNQMEaesS5IneQynLFdXbIMbC33LmK93FgzrbEln2Rv6hhKKgQsDgmGukA5o3M5vTXQiCA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487

Neither the per-architecture interrupt policy nor the vector arithmetic
touches hardware, so KUnit can cover both without a GPU.

Add three suites:

* nova_core_gin_tree covers the vector arithmetic: the leaf index
  bounds, the leaves and subtrees a leaf count implies, the leaf and bit
  a vector maps to, the check that rejects a vector outside the tree,
  the subtree-set operations and iteration, and that every supported
  chipset implements the subtree carrying the GSP notification.

* nova_core_gin_hal covers the tree size on each family, and the rearm
  method for each family and MSI type.

* nova_core_falcon_hal covers two per-chipset falcon gates: whether the
  interrupt retrigger register exists, and where the RISC-V interrupt
  routing registers sit. GA100 falls on a different side of each, and
  shares the Turing HAL, so neither gate can be keyed on the HAL.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs         |  43 +++++++
 drivers/gpu/nova-core/irq/hal.rs            |  64 ++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 131 ++++++++++++++++++++
 3 files changed, 238 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 5272b3b63ae4..aa89b553ef53 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -146,3 +146,46 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
 
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
+
+    /// GA102 moved the RISC-V interrupt routing registers. GA100 kept the Turing offsets even
+    /// though it is Ampere, so the two gates in this module do not agree on GA100.
+    #[test]
+    fn riscv_routing_offsets_split_at_ga102() {
+        for chipset in [Chipset::TU102, Chipset::TU116, Chipset::GA100] {
+            assert!(has_turing_riscv_routing(chipset));
+        }
+
+        for chipset in [
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert!(!has_turing_riscv_routing(chipset));
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
index 07604458dbbb..e844ade089e5 100644
--- a/drivers/gpu/nova-core/irq/hal.rs
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -104,3 +104,67 @@ pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInterruptHa
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
+                hal.pci_irq_rearm_method(MsiType::MsiX),
+                PciIrqRearmMethod::TopEnableCycleSubtree
+            );
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 62c0bbda61b2..a6da9900f9da 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -531,3 +531,134 @@ fn drop(&mut self) {
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
+    /// A tree enumerates every leaf it implements, in order, and no more.
+    #[test]
+    fn implemented_leaves_covers_the_tree() {
+        for (count, expected) in [(LeafCount::Eight, 8usize), (LeafCount::Sixteen, 16)] {
+            let mut seen = 0;
+
+            for (index, leaf) in implemented_leaves(count).enumerate() {
+                assert_eq!(leaf.get(), index);
+                seen += 1;
+            }
+
+            assert_eq!(seen, expected);
+        }
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
+    /// Iterating a subtree set yields each of its subtrees once, lowest index first, and yields
+    /// nothing for an empty set.
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

