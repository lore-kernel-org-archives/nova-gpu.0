Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FCF382385
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158714; cv=fail; b=T09RxvVqD95nAkyIAfo4jpxciw1cOHYXH22Fpj6O+o1pejym/f6hb0JoqUq9SBugQ2KUm5Efhn5DKqG1627dz+MVYzsHFdz9vR97q0E49Qes4A28VsBxe/A4O7f769fwiPsP7v9Iuj4xD4a/FGPHhwhLp+woZTqUCPtBChyCIiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158714; c=relaxed/simple;
	bh=h4eq9NB9uEDcy2xOoxP6d93Q72R4t6DNrGLfaTOMhF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W9EWmgLLaQO+p/pYP2u95kTspqkaCSkn4ls5zhTUfiQcvEt9hPWH35/cwS2jc0ACprLfNsJP+r9b3m4sRcUsdZZIzajn98+2Dhk7kmq3hVXLtfZKoJ5Re1tJYTSzyl/yC0YGzHBFTXzgvCA1/IkOXB/XuoOfIdtCbkt0pl33KgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y4EK8ZqZ; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y4EK8ZqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w18uPdudQIosvPXY3fxJtpnBqVm6oc/o6KjYYtM9YUDD3liWE7x4wu0Qm37QYSCKuzmzIJ3rsccJCmb+mvPoXte2XedN44nO0sStfIiWjvqzZbOifoMI3SQrkNsG3ong12aDwYjRlqBLQmtIIZO2AV85dX5pU2d4KlCEmpYFkeUJU8vUIvmxIzPhV1/kRwvD9zPPOwRqwdXvCbnNpQbnRmJwd3X9KlnYTj0bLfYTRBUbTH9z2a9nvEWv7kjFrBUgQ5LW4bBf5SK99c+dRajD+3AmTEJ2zAVHrpWLxSMnK40/j20fv7gW0bMSHqUPwfWldNIynXATPa+bAHlcRZnYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvjToK9qKyJuDHO/ZlyLQR+0MXwXOfiDXbSzMcDvSDU=;
 b=dqeS3izav+VSh4+lEdamIr3pALJeCamP3hXdW0xiCyAnHHkXONDOhEhSknOz6txcrFGqsJpEkmcZLKkD8u3fs4R7nV6VM9bRhRmfVyCepfeH/7/fTBArC5qeqbpIV2v5ovoQltU3FKIoyq+3Sxvi5GPvb+WI+ZVjSo1uTr+LSVqaZsGsrRrvncjwLuN8HEps8PHih8ZzVjtzIMGShW3E+Qrnz2BGiK0WuKN4CTQJ/yp9VgTTxjkiKvrT8mzFqHCywuntzV5ZuLs+YwIvwEQisNpXlUB3ObFliu1VHGhugAeOLu31zJbrtkORXFT3vhhikAKjT0RlfNUXuUwENjIo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvjToK9qKyJuDHO/ZlyLQR+0MXwXOfiDXbSzMcDvSDU=;
 b=Y4EK8ZqZA1Qh0QDV121vb6NXCh6HI94opAR7fv4kkr5h3DJyxzC3SeOcfK9Idr683jYZmhGgrJesySZCTOlDQA1P9XAyVBsbFzNl9fThRTn0Ppu+6Qb8Aca/CM0d5hMWFC6dr6rnnDhN9J4DCZzRYWJa/sg00JI9HUcLSiSOoDvF9fXTAOs6YGQxfN8N/bIeQxD51FN5OcZAkXZK+c1s6vmJPxTzXl4H4JuJbYvY8lcdQm9eiLJHotRV+MhRam8qgLZGTcS2GQCQ+TUf9CVhc3GyXcjbv47h08eLSiT/k/e8PdcXfxQGJqmuLnEKCIR8mWjRKn6Dfx/cQUgsMx58MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:42 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 16/17] gpu: nova-core: add KUnit tests for the interrupt tree and HALs
Date: Fri,  7 Aug 2026 20:11:18 -0700
Message-ID: <20260808031120.363869-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: eee15560-af60-42f7-6117-08def4fac53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C1w4mbdeRkgjzhkAV7lH9UlbvgkTMO46W31yq33YVlfnsRZNApeyZdPQ9e+ysFksLvcWAzjj8Ey3O/vZQoxB+XME2zJEBCBmdhwprO79Svpd2rbg6QSpE4P4tACH/w0LHXgjXKjf5MPQXHfuJ+U5YBBSPrSPYmQoDRdrRR157QF1uxej020vCUosQujyapQeNvCYfja9o/TqvEtUr+vDrMGNy9mqzsHIovsnBI+Hu7m60hk8PE9WRL0fcVYqbKO8cgBgcEc6C/iGraKLXSmWVZeIkIH4Oo65t73L4j2YLQen4dJYnoJohutKkxpLgCW3gYuLuvebTlUr2DYfPPEYj9dVEAYgWsNBUt+ccRPvDTqfl8S1XNXUSFkoTmfDJIJjFVr3n7iwMsPetw/Y4C1ZtgZuAdyZ/1LxyoLNGE7y6uOAPWD9/yVNb6KfLUA9zcaQHIsy+oSdwd8sbqjwcCgutvz5jyF/NHfE8gZy+tiJuvn564KP345JPiC8qbrEEXtq6uXVLc1z57IPulA8Guz2zS3zjizFDeyOp5FslIRR5nu7nl37DPivmKZs+hdgwJDhRm2eTfgazG2jgrFUqaMquuBpqz+ca3p9y6vbVfvuLZiZODeRPXx6Sybo8Ti4zofFrab06R8TMyYJ9zJxMOO5PmjfHgQxvL4PknzIZ+nymVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xhmJHkQB49mlen9uSbx2GQtKshlRZMEY4K4Pc6oDx8J5vCZ8T+CxCAQQemzn?=
 =?us-ascii?Q?W7RLdrL3f0ZawjbgWg9a8AsSrRCmFWU542Jxc9iUS/uQbIYPDW020LdrNaJn?=
 =?us-ascii?Q?vyLj7hQvxRzY12Sxg9sZH+UoBfhAr6ijSVwabBtYxIL5ZngwDfZMt+93Go6J?=
 =?us-ascii?Q?0lNTYZ+FSdN1H0OpXeHYFWo1wVxuc5Y/HjraSHUJficsbKlSXv4KZtHolV9G?=
 =?us-ascii?Q?r380Kv2wmibp1CI8JKUDgoI0+P6MZQY1+CDrcb5Dv7L61PMjb7fN6cDRBnwP?=
 =?us-ascii?Q?aD5UygDVZsxp/As27pGgvVSiR5lVP/xpM85YoLEiApyL96nNrTmDlgfN0tnh?=
 =?us-ascii?Q?BghZwNhMOfEiIUh2WNH8oG2xChZB51wHC13TsSnJRYtKyoaGZ9fdPUN14eJv?=
 =?us-ascii?Q?/OCbL/lwUQpWHvXEjEniS3iXXEDB+uZpBUzeqU8k9o8tMMij7MlNMzmyHbdi?=
 =?us-ascii?Q?A269Fcn1gevpQgh92oHRrFJMgDtnISUnLs63SO+/2Ajum8njBrrbbbGwkBNI?=
 =?us-ascii?Q?xiP6C+D23sQgJTz+QVUKITtFAZUXWMqnyvNSI9tLk4Wb3To66pNrP4/U+AkG?=
 =?us-ascii?Q?Ty1fiWBjKVvW21JTq6yPHclYfJMd1MPpIhA8ktBU1C4xFGRzxwRaPcJNMuiz?=
 =?us-ascii?Q?bb5w20Ih3u28M4WtK+uM2vd66QHw/XlSqZ1wqGUijzH08po1fZz8HVidNiWH?=
 =?us-ascii?Q?S7ldW0ELn/euUu4OWvPSHsxn2CjLwryxlnXniud0e4rEmxIHuuVzol6OZhzn?=
 =?us-ascii?Q?pPDuYkVJGSFN/sKCl+3YzwIcrJkl+BfpSN/NTVzfnFAK698PJLP5Mkf02n7d?=
 =?us-ascii?Q?53STtV/TR7WbN9UM1c2slpFqSVFEHjHj1dUxqXL1lsl6l0YkqphWXkhVctKm?=
 =?us-ascii?Q?VGPAGvmevj+Gn6tYiAchDxhmwfkBlD1b4iV/dCwN1TO0SrMyJVYmdKJCEYwM?=
 =?us-ascii?Q?UEQqpaMdGWylFjtRX9CfGsKNYthnonUErO4KYzcGYgd89fA6B+WgFA7JSn4G?=
 =?us-ascii?Q?JCijIUe9IXcuOJIaCv5YSf0S8X6TD63F0CeZ25pFVAP6wiV1XYQxx67N1+vJ?=
 =?us-ascii?Q?e0mEk4yUkdMPUtUjsTnnxUxH1hhuri2nPGsgKKcxrxFgD6OVtS/lFi1dbf3t?=
 =?us-ascii?Q?SxIhPKdDuMW+A0oKRAYAMOOuBI9kGJAU+B3rq27Xtoqw4wi8qmJEbxiTGqlh?=
 =?us-ascii?Q?QuQjjXyGx8nua35bzx4GWGL14C4paraXFRWAigqUqthwMfti8PkdphhX13Vg?=
 =?us-ascii?Q?LPV7jIcbGd4QvN/1+NkYFgo/7Mg8JAyceIz5ZRAcorc8eQC9GLaGohxM4HGg?=
 =?us-ascii?Q?PB0z1hG3XbpMPhqi6svToaj0rRyPW/lLN4Ue+kEnk5z9p0MhHn0qbiYuX3qy?=
 =?us-ascii?Q?Zzpd4yllCyLuTEzYj1LkskptEnj1KOJk+FhmfqHRexM1IQ9B6m4quxpFubaI?=
 =?us-ascii?Q?9uSmN8SS8WHtZj4/Cb+rOU4tOwSQ6i/rQxzwYGbObzcy1o16bz8Ej1+uZYQG?=
 =?us-ascii?Q?XnKQkx9ktbFRIr3L4t57LFHdVjvNzYC3ktebS1DB5rOtvtfy/vQWI2QCW/TQ?=
 =?us-ascii?Q?mbiolodCGAcldX7CEbH7BAoekH/L9ws/p/tDTkXRGJZJCkd2nPB0O/SJ5bZQ?=
 =?us-ascii?Q?frVQmLZ2IGk31I0YLhkkISBsVuSbYAxHgdrP+gW0wvcIxcUgY1gKZb8qgkBj?=
 =?us-ascii?Q?YK3fFKS/0u1rshM2dQp7UssPzKidTsxsp72czwGawSc+0OuiNbJo3xcMJqe6?=
 =?us-ascii?Q?j9eRRQG9Gw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee15560-af60-42f7-6117-08def4fac53c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:42.2899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9H24m9QB6EUkV7L11ywjAJn6llu/m2Pm0b4KlRt90jJZEL7l2b1/uXfw1kHlhpqNBCj5r+3T2l9FheIeliR+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

Neither the per-architecture interrupt policy nor the vector
arithmetic touches hardware, so KUnit can cover both without a GPU.

Add three suites:

    * nova_core_gin_tree covers the leaf index bounds, the
    subtree-to-leaf mapping and its out-of-range filtering, the vector
    encoding, the masking of subtrees an architecture does not
    implement, and that every supported chipset implements the subtree
    carrying the GSP notification.

    * nova_core_gin_hal covers the tree size on each family, and the
    rearm method for each combination of family and interrupt type.

    * nova_core_falcon_hal covers the falcon retrigger gate. It is keyed
    on the architecture rather than the HAL, because GA100 shares the
    Turing HAL but does have the register.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs         |  24 ++++
 drivers/gpu/nova-core/irq/hal.rs            | 106 ++++++++++++++++-
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 121 ++++++++++++++++++++
 3 files changed, 250 insertions(+), 1 deletion(-)

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
index cf2d1aa080fa..1993e2ef5143 100644
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
@@ -109,3 +110,106 @@ pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInterruptHa
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
+    /// Pre-Hopper parts have an 8-leaf tree, so 4 subtrees and `0x0f`.
+    #[test]
+    fn pre_hopper_tree_size() {
+        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(hal.num_leaves(), 8);
+            assert_eq!(hal.implemented_subtrees(), 0x0f);
+        }
+    }
+
+    /// Hopper and later implement a 16-leaf tree, so 8 subtrees and `0xff`.
+    #[test]
+    fn hopper_plus_tree_size() {
+        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] {
+            let hal = cpu_interrupt_hal(chipset);
+            assert_eq!(hal.num_leaves(), 16);
+            assert_eq!(hal.implemented_subtrees(), 0xff);
+        }
+    }
+
+    /// The implemented subtrees always number exactly `num_leaves / 2`, one per subtree.
+    #[test]
+    fn implemented_subtrees_matches_leaf_count() {
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
+                hal.implemented_subtrees().count_ones() as usize,
+                hal.num_leaves() / 2
+            );
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
index f4f1494cddba..42e72fa8089e 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -302,3 +302,124 @@ pub(super) fn clear_vectors(&self, bar: Bar0<'_>, vectors: u32) {
         }
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
+    /// Subtree `N` covers the two adjacent leaves `2N` and `2N + 1`.
+    #[test]
+    fn subtree_covers_two_adjacent_leaves() {
+        let tree = Tree {
+            num_leaves: 16,
+            serviced_subtrees: 0xff,
+            rearm_method: None,
+        };
+
+        for index in 0..8usize {
+            let mut leaves = Subtree { index }.iter_leaves(&tree);
+            assert_eq!(leaves.next().map(|leaf| leaf.index.get()), Some(index * 2));
+            assert_eq!(
+                leaves.next().map(|leaf| leaf.index.get()),
+                Some(index * 2 + 1)
+            );
+            assert!(leaves.next().is_none());
+        }
+    }
+
+    /// Leaves that fall outside the addressable range are filtered out, never panicking. The
+    /// filter is the [`LeafIndex`] bound, not the tree's leaf count, so this holds even on the
+    /// widest tree.
+    #[test]
+    fn subtree_leaves_out_of_range_are_filtered() {
+        let tree = Tree {
+            num_leaves: 16,
+            serviced_subtrees: 0xff,
+            rearm_method: None,
+        };
+
+        // Subtree 8 would cover leaves 16 and 17, both beyond the leaf index range.
+        assert!(Subtree { index: 8 }.iter_leaves(&tree).next().is_none());
+    }
+
+    /// The production [`vector_leaf_bit`] maps every vector to a `(leaf, bit)` pair, valid leaves
+    /// stay within [`LeafIndex`], and the fixed doorbell (129) and GSP (155) vectors land where
+    /// the handlers expect.
+    #[test]
+    fn vector_maps_to_leaf_and_bit() {
+        // Every vector of a 16-leaf tree maps to an addressable leaf and a bit in 0..32.
+        for vector in 0u32..(16 * 32) {
+            let (leaf, bit) = vector_leaf_bit(vector);
+
+            assert!(LeafIndex::try_new(leaf).is_some());
+            assert!(bit < 32);
+            assert_eq!(leaf as u32 * 32 + bit, vector);
+        }
+
+        // The fixed vectors the handlers rely on: CPU doorbell 129 and GSP notification 155, both
+        // in leaf 4, which is present on both the 8-leaf (pre-Hopper) and 16-leaf trees.
+        assert_eq!(vector_leaf_bit(129), (4, 1));
+        assert_eq!(vector_leaf_bit(155), (4, 27));
+        assert!(LeafIndex::try_new(vector_leaf_bit(155).0).is_some());
+
+        // The first vector beyond the 16-leaf tree lands in leaf 16, which is out of range.
+        assert!(LeafIndex::try_new(vector_leaf_bit(16 * 32).0).is_none());
+    }
+
+    /// [`vector_subtree_mask`] agrees with [`vector_leaf_bit`] on which subtree holds a vector,
+    /// and the doorbell (129) and GSP (155) vectors share one, so a single allocation and a single
+    /// enabled subtree serve both.
+    #[test]
+    fn vector_maps_to_subtree() {
+        for vector in 0u32..(16 * 32) {
+            let (leaf, _) = vector_leaf_bit(vector);
+
+            assert_eq!(vector_subtree_mask(vector), 1u32 << (leaf / 2));
+        }
+
+        assert_eq!(vector_subtree_mask(155), 1 << 2);
+        assert_eq!(vector_subtree_mask(129), vector_subtree_mask(155));
+    }
+
+    /// [`Tree::new`] drops subtrees the architecture does not implement, so a caller cannot enable
+    /// a `TOP` bit with no leaves behind it.
+    #[test]
+    fn tree_new_masks_unimplemented_subtrees() {
+        assert_eq!(
+            Tree::new(Chipset::TU102, IrqType::Msi, 0xff).serviced_subtrees,
+            0x0f
+        );
+        assert_eq!(
+            Tree::new(Chipset::GH100, IrqType::Msi, 0xff).serviced_subtrees,
+            0xff
+        );
+    }
+
+    /// Every supported chipset implements the subtree that carries the GSP notification.
+    #[test]
+    fn serviced_subtree_is_implemented_everywhere() {
+        let serviced = crate::irq::gsp::GSP_SUBTREE;
+
+        for chipset in [
+            Chipset::TU102,
+            Chipset::GA102,
+            Chipset::AD102,
+            Chipset::GH100,
+            Chipset::GB100,
+            Chipset::GB202,
+        ] {
+            assert_eq!(
+                serviced & !cpu_interrupt_hal(chipset).implemented_subtrees(),
+                0
+            );
+        }
+    }
+}
-- 
2.55.0

