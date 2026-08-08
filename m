Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAE3909A8
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158719; cv=fail; b=rVNL5X2anyJdqbMI8kQuD1qb7Tz1sad7FmhMlYxE+sEOT2aNI9ny51nEU528qAnV9QcEeAXOr2RmtSIZ9iVwUOpzWIKpMwgAT/hQySKAvH14xywVdU/gKFH45BwPiWXvRUq4xp/5UPrDU3mByYvtfaoZqrM1SBH2tXf/FBPl684=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158719; c=relaxed/simple;
	bh=evnDeYWsbDECJwSflo7XxRmeh+7kIQG4DoXHKKaYeTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uEmoS/n1YCHb20Ol5n5/NHxv7v3faHBJlgQxw5xnwakdv6G4V1kPWBu2PjFcxTdkUgcBOu1bN3TMPLaIPyl0Hq0mZUE0YmXR5bBvK22mnx6rGUUKn52iwodUy3Zj6vXMekYGcYZPu7X/FJAeHaTDdAiVeTiMNee6hBnpLMSpcNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YKkSNP2F; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKkSNP2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFhMIjGx6etfch3hLIAHs2r+VpkFC7c0eQP7LlKnp/usQfHqs58NMwtndk65x1ppI71g0824BzDMsOVupTtdPFEEHyGRKs97Gt5wev04FtXtG5Gn3rZRPe0nMIlQ7O6Afvc/mniiMcpqut2a4q4bBw064zhgNjF2r6JZ4HfHBcg1hLs9pEOrh1WmWmRYi2nvLG6FQwm1jh+Ij4aKOkzh7fAQF0ATtNRNf6tatYuBCTdEKkUU/x9fdN5bI0O9sQ03S9czFOGW5llcquzlQj0SMbQ7FzxQz8syPDQD7vb5bGOwHtY+4MkeYbvuA3hsCO5ZqJhuVinmgBHdVwWIoTWI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/X1cb403rOEFwBmvsVJiAiU5RIpM+v9EPxNBHtCrUs=;
 b=P/eR3n2b9VgNQiP5pfAtKQSFABTlTLPv6WRcKCXiN2lH+p9FRlzjVvxWIuFPxS2vH6U8PsUESy+ZXaHl2LVNd70EI4f8Yfnx9y9pLP9XtKzIQpHyVaDsAXpgMiFz1UzPmgzQdUnXMVRFJ9I/gY+/43Su++T4wdpe5HPDaAdE5IVCfgAX4va9miUeTokmienWaZ0AKzPyR4zxO5Re2NF4CAdXcQPjhZtSGscpGmkwbDOHUqyY2+pLK7hTpt1o/y7MEqZeGR4qJpIpm4Nnz6ZIL586Rnwp6RAaeelyQuGcxyWEUWwRSIiQHpUpgUquCwPVmYc42GIckj8idAfUHh2WUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/X1cb403rOEFwBmvsVJiAiU5RIpM+v9EPxNBHtCrUs=;
 b=YKkSNP2F+ohxg37+j2lsyRuMbmgpU7NrbGCGn3Zo4y2YuKlyyIKJ3rx/BJMCZ8fk9XTIcS/f4FjH//16fajgYP+XfFE6oh+YrDUfdffAc3aoIzJWOfuKE8rUWDUsHW8R4u35Co5FuOTXYlqBG5MQtdQeo4lE20jCfJbUwTD6grv70ePc4INsOEnxQGwP6fpwopahrnoc8V3CNy5c7zTuweIYlH98DVTmxgWbVOgQP6yWO9HvPMna6yaOlVg1M2VcWxpfYy6/ON2LEK0tmrUpHzTSRcM47JMe0Zm6DOfRj9cZl+jSfGNvjIlvVcz2wCCYj+uGI0wAvdDqFsn/AxxfsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:43 +0000
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
Subject: [PATCH 17/17] gpu: nova-core: document the GIN interrupt controller and GSP events
Date: Fri,  7 Aug 2026 20:11:19 -0700
Message-ID: <20260808031120.363869-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: fd158c0b-b7dc-4d2e-b50e-08def4fac61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KRcMbcm7YDwHux0tn2Uupm7JUV1PxlaTa64CP/SwgMIaUr3RlrENMORTOdKzMze/z2AigotDyrd6El3+D8iP37xLgXU5LHhrnDO2o/n+hBxyjJFhYmfvDvvZniorJ3yQjrpJvH+H+zbvJaRAf8AA5s6AVtxbUbliPmWfx+KQ03SAYpvS5WCjhvrH3ZbdDrNzdCaEU4GMLGNF54VCo11VOKk+N4KJ/1p2r5Wgqbig1kjZy+J5ot3KXSg6OYNiv4UW1M/Lf7NqA4pW3TDX8L3X5jKN2gu583fw0HKJDWyNzeJvCiOhQRUyVvjcL0j0l6YHVRh18gL7A9ieBnSm2bnmMlClXQOBITlJsq36j/YaazetIm9cOXU0g0LkrcsaCvf36kpCwW7CwuxsTePcQLeDYXqkY/i2oyuLilzaSn2WUsN7PfrK8/6sLr5YNs6U8RQiT/sl3YKFAVAIgM5Y4ZfDMLt+q+PZN8A60i2RT2piiHWpe4yEP0SHrtFLKEBAlTNaEKnyZ8fhNR0PybZ59JFdRigyGfNbRQ5jdy2NIJq8kG2wpoiKW6/yth/DZ0X9NFNlsNkR21EPPOVM/Gi3Xqi6UCNmSaxqaIROiHQUC/DgE+ZS4ufKgY9VO8zoT4Or3jCHgqj2cHnZxy48YpspDRpS5Va96bg8/q9wCc1WZn9UPC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bytvzvEzikjp2h7a1nqvehCRZUhFiCw2/wdyBJzgB0Iv0MYqj07bLJLQZr9k?=
 =?us-ascii?Q?CZcYkuVozP0a/QChgCFQpNnA3xTLxT8lA9n9j3xLtUcQ18TWxoRfi7NYemvl?=
 =?us-ascii?Q?XCfpwa0rPj0NXm+6CZNmB2d3nwo9oG08SgFgNNja2Zsx2Fzq/8sFklgWo9aS?=
 =?us-ascii?Q?8/DgimRtVFVuQxs4oUe85o5MSRXvlXA7W8amjOnuLiuKNVESCKeaxcDWDjp5?=
 =?us-ascii?Q?VfF3yw7nfIKi3zYtvxXn58b50OH6ldlCES80HCA2k0CD+dA0MKQgmptc7Gmd?=
 =?us-ascii?Q?ATJM8/ssjrwor4iiITdkhE8o4yG/Tyws0ZPJ2MJGeKeGWiC1EQw63+3bFznX?=
 =?us-ascii?Q?c4qrysuTfQkK0yQJnNQ8bA5oVQ2fF48cklmW0uh6cri15WBRCxhtaHov3Azs?=
 =?us-ascii?Q?Y30BsMyyP+XGncn+TpvuJRxLT2ZR1x6lDa9tGjkSMJHtuWAeEgi4KZ46AqzY?=
 =?us-ascii?Q?+IlRCCYc9qGuARGVBWkrg0+J/uNEq9ws77sZpB2TmUIsucAiy7mhJTMprMtJ?=
 =?us-ascii?Q?AezB3Rzxqx+I++8TxDy8MXU62Y7OdeDpGK4uSNg4TyZL8l2rJ+mE7JmC6WqE?=
 =?us-ascii?Q?MJMPi7w1JcLRvoCNlpcGGlcEJnbhXXpMnBB7d13oZ3U9svm0d42yur4H7SaP?=
 =?us-ascii?Q?/LRMKmNT4Z+xlPSZ7nhjRzQGY76cx9dnF6+gtVolE4oY1GVIPBIyxUOFc0hU?=
 =?us-ascii?Q?6plJbssaM5T0iSZwzdj1njidEhaFFrh51OiHgXxEyO7pFhfD4eyL4yralbWO?=
 =?us-ascii?Q?jr+ZSQaIl657i9msLGaLMA0WV8m6bQaOsZ1KiovQs3/HyeOjZwzctOVRrtqx?=
 =?us-ascii?Q?xjS3GBmK+2CGl96kS/ZiuR0QS5cO4CsohJTFsBXT3Gaywl57a31TbOf1qnCf?=
 =?us-ascii?Q?xBnGkiEPijIjxLl0hAASE6K6ydeXIIKUZ34Y1JcHJ6i3nqFALmH7eCCi1z89?=
 =?us-ascii?Q?D3aeP+yVJa0peDUCce/w+KGgTlYEhaJ8WztTPaszoO4hW744CHSaIcYNEc+B?=
 =?us-ascii?Q?WKLvGD42H6bDXkvvoiq6ytDCfR7cf8FLUb+Nap2LBlj10eNk66vfLlXzS3Fc?=
 =?us-ascii?Q?9vC7tfXgzQFXcsQ6wT+c37oXOOd0dhQ8WLsg6isunWEp5afrEwbydiFVpKYS?=
 =?us-ascii?Q?B07nHnyd0LI4sN/lquLTrdlpwRq0zDAui7MoynKPExk3Pd0LaHD2/xxO56Y7?=
 =?us-ascii?Q?HjIzTD4mm9XsKRl8k4Ag8CygBX2f/wfRY6XH/+vPfkU6I3vWpCt/Mu2iaUQE?=
 =?us-ascii?Q?EU8kqoVXH5JhrYJetd5+bnAN+BY65TpEokCIBnPxFaOEeiNSPhtK9EqdZzTM?=
 =?us-ascii?Q?D+9PQXWt/MJcxYHBs69PWrYJA9kDILdUomjQZx/RYIiAIWbUv+I+l91X7IHg?=
 =?us-ascii?Q?7by364z13Oh9RWZs5M/DnfsCc1kmzzDfl+esKkdQlLGoVKMUusV7rYJtrVRV?=
 =?us-ascii?Q?9qGabGZFtrhGNAHT76PBN9V8GX62A1B0LRLkUIkhUh2C0u9tYoGWJEfGg5NN?=
 =?us-ascii?Q?MCENdomPTEpLKLYPXSONhfVTUJFkkYDU7NLhLy7hZE5gSc73JFabb2v7JFPJ?=
 =?us-ascii?Q?xmH6i4MOYh0CgnLk6JUDp6SrzgAcCiqykqKSEyqbyj+H8KAaF0qRK72EXk8u?=
 =?us-ascii?Q?FHCQMhi9+XJZfiBI1pj1/KJo6Yx81LUUeDeVWCyfH1zfn9mmhSsNoafxzWot?=
 =?us-ascii?Q?uI+g5JHR+1h9xxq5rrdrZ2Hyu/XspkKg3n3kLaJ1+ihsZpxtqlSUbJNaZKG4?=
 =?us-ascii?Q?0OnisXRHCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd158c0b-b7dc-4d2e-b50e-08def4fac61d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:43.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: In0eOx/lgVn3uyax1Fw3K9XsifWaUxTeFl+Y51XctIOBnE0kDzzcB1xxXWeJmacmmax1m6/StcyEmCNzuk2wYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

The hardware behind nova-core's interrupt support is not obvious from
the code. Delivery is edge-triggered and needs a rearm after every
interrupt, the rearm operation differs by GPU family and PCI interrupt
type, and a vector that latched while disabled is invisible in the TOP
summary register. Three different numbers are also all called a vector,
in GIN, the MSI-X table, and the Linux IRQ API.

Add a design document covering the two-level register tree, how it
reaches the CPU under MSI and MSI-X, and the rules those behaviors
impose on a handler. It also covers the GSP event: the falcon retrigger,
the handoff from boot-time polling to interrupts, and how its messages
are classified. A glossary names each term after the register or the
specification that defines it.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst | 686 +++++++++++++++++++++
 Documentation/gpu/nova/index.rst           |   1 +
 2 files changed, 687 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
new file mode 100644
index 000000000000..d7ddbfd6a0af
--- /dev/null
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -0,0 +1,686 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+=================================================
+GPU interrupt handling: GIN and the GSP event
+=================================================
+
+This document describes how nova-core receives interrupts from the GPU on Turing
+and later parts. It covers the GPU Interrupt and Notification unit (GIN), which
+is the GPU's interrupt controller, and the GSP event interrupt.
+
+Throughout, *CPU* means the CPU and the nova-core driver running on it. The GPU
+also has on-chip processors that run their own firmware and receive their own
+interrupts, and the GSP (GPU System Processor) is one of them.
+
+The register names in this document are the names from the GPU hardware
+reference headers. The CPU tree's registers live in the per-function
+``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` aperture on every supported part, and
+the controller itself has a second name on pre-Hopper parts (see "Register
+naming").
+
+Terminology
+===========
+
+Three different numbers are all called a "vector" in the surrounding material.
+This document gives each one its own name and never uses "vector" on its own.
+
+GIN vector
+    The GPU-internal interrupt source number, 0 through 511 on Hopper. It is a
+    bit address within the tree: leaf ``vector / 32``, bit ``vector % 32``. The
+    CPU doorbell is GIN vector 129 and the GSP event is GIN vector 155.
+
+MSI-X entry
+    An index into the device's MSI-X table, 0 through 7 on Hopper. Linux's
+    ``struct msix_entry`` names its Linux IRQ number ``.vector``, which is a
+    third meaning.
+
+Linux IRQ number
+    What ``request_irq()`` takes, obtained from ``pci_irq_vector()``.
+
+The remaining terms, each named for the register or the specification that owns
+it:
+
+enable / disable a GIN vector
+    ``LEAF_EN_SET`` and ``LEAF_EN_CLEAR``.
+
+enable / disable a subtree
+    ``TOP_EN_SET`` and ``TOP_EN_CLEAR``.
+
+serviced subtree
+    A subtree nova-core enables and has a handler for.
+
+rearm
+    Restoring PCI interrupt delivery after servicing an interrupt. It is a
+    ``TOP_EN`` disable-then-enable cycle everywhere except under pre-Hopper
+    MSI, where it is a write to the end-of-interrupt (EOI) register in the BAR0
+    configuration-space mirror (see "Rearming PCI interrupt delivery").
+
+mask
+    Reserved for the two places hardware and the PCI specification use the
+    word: the MSI-X per-entry Vector Control mask bit, which Linux owns, and
+    the falcon cause masks. It never names a GIN enable.
+
+latched, pending
+    A ``LEAF`` bit records its source whether or not the GIN vector is enabled.
+    A disabled vector's pending bit never appears in ``TOP``.
+
+clear a leaf vector
+    Write a 1 to the vector's bit in ``LEAF``. Open RM spells the same
+    operation ``intrClearLeafVector_HAL``.
+
+pending bits
+    The plain bitmask value read from a ``LEAF`` register.
+
+unit
+    A generic interrupt-raising block. "Engine" is reserved for the blocks that
+    do usermode work: GR, CE, NVDEC, and the like.
+
+The GIN controller
+==================
+
+A GPU has many interrupt sources: the GSP, copy engines, the graphics engine,
+video decode and encode, the MMU fault path, timers, and others. Each one has a
+GIN vector number, which is internal to the controller and is not a PCI vector
+index.
+
+GIN records which vectors are pending in its own two-level register tree and
+raises the PCI interrupt when an enabled vector becomes pending. The CPU's
+handler reads that tree to tell the sources apart, clears the pending vectors,
+and runs the work for each.
+
+How the tree reaches the CPU over PCI
+-------------------------------------
+
+How many PCI interrupts the tree needs depends on the interrupt type Linux
+grants.
+
+MSI has a single message, and every subtree raises that one message. One
+allocated vector serves the whole tree.
+
+MSI-X raises a separate table entry per subtree, so a subtree's interrupts
+arrive on the table entry whose index is the subtree number. Linux masks each
+table entry a driver did not allocate, and a masked entry sends no message: the
+request sets a bit in the pending-bit array and waits for an unmask that never
+comes. A driver that leaves out the entry its subtree raises loses every
+interrupt on that subtree, and loses it silently, with the GIN leaf and TOP
+registers showing the vector pending and enabled while no handler runs.
+
+The serviced-subtree invariant
+------------------------------
+
+Every subtree enabled at TOP must have an allocated PCI vector with a registered
+handler.
+
+MSI satisfies this with one message that every subtree raises. MSI-X needs one
+allocated, unmasked entry per serviced subtree, and a PCI allocation cannot be
+sparse, so it runs from entry 0 through the highest serviced subtree::
+
+    MSI-X, with subtree 2 serviced:
+
+      subtree 0  ->  entry 0   allocated, no handler, stays masked
+      subtree 1  ->  entry 1   allocated, no handler, stays masked
+      subtree 2  ->  entry 2   handler here, and its rearm covers subtree 2
+
+    MSI, with any serviced set:
+
+      every serviced subtree  ->  the one allocated vector, whose handler's
+                                  rearm covers the whole serviced set
+
+The entries allocated below a serviced subtree that the driver does not service
+cost nothing: Linux unmasks an entry only when its interrupt is requested, and a
+disabled subtree raises nothing.
+
+nova-core services exactly one subtree, subtree 2, because both the vectors it
+uses are in leaf 4: the GSP event (155) and the self-test doorbell (129). That
+is also the subtree the resource manager assigns to its ``UVM_SHARED`` interrupt
+category on every chipset nova-core supports.
+
+Interrupt trees
+===============
+
+GIN keeps a separate interrupt tree for each place an interrupt can be sent to:
+
+* One tree per PCIe function. The Physical Function (PF) has a tree, and each
+  Virtual Function (VF) has a tree.
+* One tree per on-chip microcontroller that receives interrupts, starting with
+  the GSP.
+
+Each destination reaches its own tree through its own BAR0 and cannot reach any
+other tree. GSP firmware selects the tree each unit's interrupt is sent to.
+
+nova-core services the CPU tree of one function. The VF trees and the
+microcontroller trees belong to firmware or to virtual functions.
+
+The two-level tree
+==================
+
+Each tree has two levels. The bottom level is the LEAF registers, which hold one
+pending bit per vector. The top level is the single TOP register, which
+summarizes the leaves.
+
+* Each ``LEAF(i)`` is a 32-bit register holding the pending bits for vectors
+  ``i * 32`` through ``i * 32 + 31``. A set bit means that vector is pending.
+* ``TOP`` is a single 32-bit read-only register. Each of its bits summarizes one
+  *subtree*, which is a pair of adjacent leaves. TOP bit ``N`` reflects
+  ``LEAF[2N]`` and ``LEAF[2N + 1]`` as filtered by their leaf enables, so a
+  vector that latched while disabled does not appear in TOP.
+
+A subtree is two leaves, so a part with L leaves has L / 2 subtrees and uses
+that many TOP bits. An 8-leaf part uses TOP bits 0 through 3, and the other 28
+bits always read 0. A 16-leaf part uses TOP bits 0 through 7::
+
+    TOP  (one 32-bit register, and an 8-leaf part uses only bits 0..3)
+
+      bit 0  ->  subtree 0  ->  LEAF[0], LEAF[1]   vectors   0..63
+      bit 1  ->  subtree 1  ->  LEAF[2], LEAF[3]   vectors  64..127
+      bit 2  ->  subtree 2  ->  LEAF[4], LEAF[5]   vectors 128..191
+      bit 3  ->  subtree 3  ->  LEAF[6], LEAF[7]   vectors 192..255
+      bits 4..31: always 0 on an 8-leaf part (a 16-leaf part uses bits 0..7)
+
+    A LEAF is one 32-bit register, one bit per vector. For example, LEAF[4]
+    holds vectors 128..159:
+
+      bit 1  = vector 129  (CPU doorbell)
+      bit 27 = vector 155  (GSP event)
+
+Registers
+---------
+
+All the registers are 32 bits, defined in ``regs.rs`` under the
+``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` names. The leaf registers are arrays
+indexed by leaf number:
+
+* ``LEAF(i)`` holds the pending bits for the vectors in leaf ``i``. Reading
+  returns the pending bits, and writing a 1 to a bit clears that vector
+  (write-1-to-clear).
+* ``LEAF_EN_SET(i)`` and ``LEAF_EN_CLEAR(i)`` enable and disable individual
+  vectors in leaf ``i``.
+* ``TOP`` is the read-only summary: bit N is set when an enabled vector is
+  pending in ``LEAF[2N]`` or ``LEAF[2N + 1]``. A vector that latched while its
+  leaf enable was clear does not appear.
+* ``TOP_EN_SET`` and ``TOP_EN_CLEAR`` enable and disable subtrees.
+* ``LEAF_TRIGGER`` makes a vector pending in software. The self-test uses it.
+
+Mapping a vector to the tree
+----------------------------
+
+Each vector occupies one bit of one leaf, and each leaf belongs to one
+subtree::
+
+    leaf    = v / 32
+    bit     = v % 32
+    subtree = leaf / 2
+
+Both of the vectors nova-core names by number fall in leaf 4: vector 129 at bit
+1 and vector 155 at bit 27, so both arrive under subtree 2.
+
+Enabling and clearing
+---------------------
+
+Each bit of a set or clear register acts on its own: writing a 1 performs the
+action for that bit, and writing a 0 leaves the bit's state alone. No caller
+ever needs a read-modify-write.
+
+* ``LEAF(i)`` is write-1-to-clear. Reading returns the pending bits. Each bit
+  must be cleared before its vector is serviced.
+* ``LEAF_EN_SET(i)`` and ``LEAF_EN_CLEAR(i)`` enable and disable individual
+  vectors in a leaf.
+* ``TOP_EN_SET`` and ``TOP_EN_CLEAR`` enable and disable whole subtrees.
+
+A vector reaches the CPU only when both its leaf enable bit and its subtree's
+TOP enable bit are set. The leaf enable governs delivery and the TOP summary,
+but not the latch: a disabled vector still latches its LEAF bit, and that bit is
+visible only by reading the leaf directly.
+
+How a unit interrupt reaches the CPU
+====================================
+
+A unit does not write a LEAF register itself. Each unit has an interrupt routing
+register, and GSP firmware programs it once at boot. Firmware writes three
+things into it: the unit's VECTOR (which leaf bit it uses), its GFID (which tree
+to post to: the PF or a specific VF), and its destination flags (which consumers
+get it: the CPU, the GSP, or another on-chip microcontroller).
+
+Later, when a unit has an event, three things happen in turn::
+
+    1. The unit sends an interrupt message to GIN, carrying the VECTOR, GFID,
+       and destination flags from its routing register.
+    2. GIN sets bit (VECTOR % 32) in LEAF[VECTOR / 32], in the tree that the
+       GFID and destination flags select.
+    3. If that vector is enabled and its subtree is enabled, GIN raises the PCI
+       interrupt to the CPU.
+
+Because firmware assigns the vectors, nova-core does not hardcode which vector
+belongs to which unit. The one exception nova-core relies on is the GSP event
+vector, which firmware pins to a fixed number (see "The GSP event vector").
+
+Edge behavior and rearm
+=======================
+
+The pieces behave as follows:
+
+* A LEAF bit is a latch. It is set on the rising edge of its source and stays set
+  until the CPU writes a 1 to it. A source that stays high does not set the bit
+  again.
+* TOP is read-only and reports the subtree's *enabled* pending state. A vector
+  that latched while its leaf enable was clear does not appear in TOP.
+* LEAF_EN and TOP_EN are CPU-controlled enables that allow or block delivery.
+* GIN raises the PCI interrupt for subtree N when the subtree's enabled pending
+  state goes from low to high::
+
+    Per vector, in leaf i at bit b:
+        LEAF[i][b] AND LEAF_EN[i][b]
+
+    Per subtree N, across its leaves 2N and 2N + 1:
+        OR of every enabled pending bit  ->  TOP[N]
+
+    Delivery for subtree N:
+        TOP[N] AND TOP_EN[N]  ->  rising edge  ->  PCI interrupt
+
+    TOP_EN applies below TOP, so disabling a subtree halts delivery and leaves
+    what TOP reports unchanged.
+
+Because a disabled vector is invisible in TOP, code that must find every pending
+bit cannot descend from TOP. It has to read the leaves directly. Open RM does
+the same: its stalling-interrupt path never reads TOP, and instead walks every
+subtree it implements reading LEAF registers.
+
+Because delivery is edge-triggered, writing ``TOP_EN_SET`` while an enabled leaf
+bit is still set produces a new edge. A full tree walk uses this: after it
+clears the leaves, it writes ``TOP_EN_SET`` so an interrupt that arrived during
+servicing is still delivered.
+
+A unit that holds an internal level signal high does not produce a new leaf edge
+after the CPU clears the bit, so rearming alone does not re-deliver it. Such
+units have an ``INTR_RETRIGGER`` register that forces a new edge.
+
+Retriggering a falcon
+---------------------
+
+A falcon signals the tree on a transition of its enabled interrupt causes.
+Clearing the tree leaf while a cause is still latched leaves no transition, so
+the vector stays clear however many further causes arrive. Both clear orders
+have that window, so a handler on a falcon vector writes ``INTR_RETRIGGER`` on
+every path that services the vector.
+
+That re-emit must not be able to raise a cause that nothing clears. A cause the
+handler does not service is removed from the falcon's enabled set with
+``IRQMCLR`` and cleared with ``IRQSCLR`` before the re-emit.
+
+``INTR_RETRIGGER`` is absent on Turing falcons and present from GA100 onward, so
+the write is conditional on the architecture. A Turing handler cannot supply a
+transition that went missing, so it must leave no cause latched: it reads the
+status once and takes every cause that status reports, rather than stopping at
+the first one it recognizes. A cause left behind holds the falcon's enabled set
+non-empty, and no later cause from that falcon signals the tree at all.
+
+One window stays open on Turing. A cause that arrives between the status read
+and the clears is not in the status, so it stays latched after the tree leaf has
+been cleared. Open RM has the same window: ``kgspService_TU102`` ends with
+``kflcnIntrRetrigger``, which is implemented from GA100 onward and does nothing
+on Turing.
+
+Rearming PCI interrupt delivery
+-------------------------------
+
+Clearing the GIN state is not enough. A message-signaled interrupt is
+delivered once per edge, and the PCI side delivers no further interrupt until the
+CPU rearms it. Which operation does that depends on the GPU family and on the
+interrupt type Linux granted:
+
+==================  =====  ===========================================
+Architecture        Type   Rearm operation
+==================  =====  ===========================================
+Turing through Ada  MSI    write the configuration-mirror EOI register
+Hopper and later    MSI    clear then set the serviced TOP enables
+Any                 MSI-X  clear then set the handler's own TOP enable
+==================  =====  ===========================================
+
+The MSI forms cover every serviced subtree, because one message serves all of
+them. The MSI-X form covers one subtree, because each serviced subtree has its
+own table entry and its own handler.
+
+INTx is level-triggered and needs no rearm write. nova-core does not allocate it,
+so it never reaches a handler.
+
+A handler must rearm once per delivered interrupt, on every path that services
+one. A handler that skips the rearm receives no further interrupts at all.
+
+The rearm is separate from the TOP restore at the end of a full tree walk, even
+though two of the three forms write the same registers. The walk clears TOP_EN
+on entry so that it can read and clear without new interrupts arriving, and sets
+it again on exit. For the two enable-cycle forms that restore also rearms, but
+pre-Hopper MSI rearms through the configuration mirror, which the walk never
+writes, so the startup sequence rearms explicitly after the walk.
+
+Servicing an interrupt
+======================
+
+nova-core services the tree in one of two ways, depending on which code handles
+the interrupt.
+
+The GSP event handler services one vector, so it leaves its subtree enabled and
+reads and clears only its own leaf bit, touching a single leaf per interrupt.
+
+The startup drain walks the whole tree instead, because it must clear whatever is
+pending across every subtree rather than one known vector. It disables the
+subtrees, clears every pending leaf, then enables them again.
+
+The drain reads every implemented leaf rather than descending from TOP. Boot
+latches vectors while they are still disabled, and those bits do not appear in
+TOP, so a TOP-driven walk would skip exactly the state the drain has to clear.
+
+The two paths as register operations::
+
+    Full tree walk (the one-time startup drain):
+        write TOP_EN_CLEAR = serviced        disable, to stop new interrupts
+        for each implemented subtree N, for i in {2N, 2N+1}:
+            pending = read LEAF[i]           pending vectors in this leaf
+            write LEAF[i] = pending          clear (write-1-to-clear)
+        write TOP_EN_SET = serviced          restore TOP_EN
+
+    Notification, subtree stays enabled (the GSP event handler, and the
+    self-test, which deliberately mirrors it):
+        pending = read LEAF[gsp_leaf]        is our vector's bit set?
+        write LEAF[gsp_leaf] = GSP_BIT       clear only our bit
+        rearm PCI interrupt delivery         see "Rearming PCI interrupt
+                                             delivery"
+
+Two rules for the full walk:
+
+* Clear every pending leaf bit, including bits nova-core does not handle. An
+  uncleared bit holds its subtree in the pending state, and restoring TOP_EN
+  over it produces a delivery edge straight away. The walk writes back every bit
+  it read.
+* Restore TOP_EN only after clearing every pending leaf. Otherwise a still-set
+  bit raises the interrupt again while the walk is still running.
+
+The notification path clears one bit, so a vector pending alongside it in the
+same leaf keeps its bit and stays pending for whoever services it. Both paths
+must rearm PCI delivery for the interrupt they serviced.
+
+Interrupts and notifications
+============================
+
+Two kinds of source use the tree:
+
+* An interrupt means a unit needs servicing.
+* A notification means a unit is reporting that something happened, such as a log
+  record or completed work.
+
+The GSP event is a notification. Its handler leaves the subtree enabled and
+clears only the GSP leaf bit.
+
+The hardware manuals also split the vector space into "stall" and "nonstall"
+ranges. Those name address ranges rather than describing behavior. nova-core
+does not service the stall range.
+
+Per-architecture differences
+============================
+
+The tree is the same on every supported GPU except for its size, and there are
+only two sizes, split at Hopper:
+
+===================  ======  ========  ====================
+GPUs                 Leaves  Subtrees  Implemented subtrees
+===================  ======  ========  ====================
+Turing, Ampere, Ada  8       4         ``0x0f``
+Hopper and later     16      8         ``0xff``
+===================  ======  ========  ====================
+
+Only the lower eight leaves exist before Hopper, so TOP bits 4 through 31 read
+zero there. Hopper and later have 16 leaves, though sources do not populate all
+of them.
+
+The implemented subtrees bound which TOP bits mean anything. That set is wider
+than the set nova-core enables, which is the subtrees it services, per the
+serviced-subtree invariant. The startup drain still reads every implemented
+leaf, because a vector that latched while disabled is invisible in TOP and can
+be in any leaf.
+
+The HAL provides the leaf count, and the subtree count (leaves / 2) and the
+implemented-subtree set derive from it. The rearm method is the HAL's other
+per-architecture value.
+
+Multi-die parts
+===============
+
+On multi-die parts the controller is replicated per die, with an aggregation
+level above the per-die TOP registers. nova-core services the CPU tree of one
+function on a single-die part, so it does not drive the aggregation level.
+
+The GSP event
+=============
+
+When the GSP has output for the CPU (log records, error records, and other
+events), it writes the messages into the GSP-to-CPU queue in shared memory and
+raises SWGEN0, one of the software-generated interrupt outputs of the GSP
+microcontroller (a "falcon" in NVIDIA hardware). SWGEN0 is routed through a GIN
+vector, so it reaches the CPU as a PCI interrupt::
+
+    GSP writes messages into the GSP-to-CPU queue
+    GSP raises SWGEN0
+    GIN sets the GSP leaf bit, and the subtree becomes pending
+    PCI interrupt -> Linux IRQ -> nova-core top half, in IRQ context, which
+                                 must not sleep:
+        read the GSP leaf bit and clear it (subtree stays enabled)
+        read the GSP falcon IRQ status, clearing SWGEN0 if it was set
+        for every other cause that status reports: report it, then remove it
+            from the falcon's enabled set and clear it
+        retrigger the falcon
+        rearm PCI interrupt delivery
+        wake the IRQ thread if SWGEN0 was set
+    IRQ thread, which may sleep: take the command-queue lock and drain the
+        GSP-to-CPU queue, routing each message
+
+A halt and a posted message can be pending together, so the top half handles
+every cause the status reports rather than choosing between them (see
+"Retriggering a falcon").
+
+The interrupt is only the trigger to drain the queue. A thread polling for a
+command reply routes the messages it reads through the same classifier (see
+"Draining and classifying the GSP-to-CPU queue").
+
+If the drain fails, the queue cannot advance past the message it could not parse,
+so every later notification would repeat the same failure. The IRQ thread
+disables the GSP vector before reporting the failure, which leaves the queue
+unserviced until the device is reset.
+
+Enabling the GSP event
+----------------------
+
+SWGEN0 is a latch, and the GSP drives no new edge into the tree while it stays
+set. GSP boot consumes its notifications by polling the queue, which leaves the
+latch set and leaves stale state in the tree, so the handoff from polling to
+interrupts has a required order::
+
+    disable every implemented vector    drop enables left by boot or by a
+                                        driver that ran before this one
+    drain the tree (full walk)          clear stale GIN state from boot
+    clear the SWGEN0 latch              so the next assertion makes an edge
+    rearm PCI interrupt delivery        the walk does not do it under
+                                        pre-Hopper MSI
+    register the threaded IRQ handler   nothing can reach it yet
+    enable the GSP vector at its leaf   deliveries become possible here
+    drain the GSP-to-CPU queue          messages posted before the clear
+
+Clearing the latch makes the first interrupt possible. Messages the GSP posted
+before that clear produce no interrupt, so the queue drain follows.
+
+The tree is quiesced before the handler is registered. Registering unmasks the
+PCI interrupt, and a leaf enable that boot left set would reach a handler that
+services one vector and has no way to service any other. Open RM clears all
+leaf enables at the same point for the same reason.
+
+The latch is cleared after the tree walk, not before. The walk erases every leaf
+bit, so a message posted between an earlier clear and the walk would leave the
+latch set with nothing in the tree to show for it, and on Turing no later
+message would signal the tree at all. Clearing last can instead leave the GSP
+vector pending with the latch already clear, so enabling the vector delivers one
+interrupt whose ``IRQSTAT`` reads zero. The queue drain that follows reads the
+message.
+
+The GSP event vector
+--------------------
+
+The GSP event uses a fixed vector, ``GSP_INTR_0_VECTOR`` (155), on Turing
+through Blackwell. Vector 155 is leaf 4, bit 27, subtree 2. nova-core enables
+that leaf bit and services it, with no runtime vector discovery.
+
+A full unit-to-vector table can be fetched from the GSP by RPC. nova-core does
+not fetch it, because a pinned vector needs no lookup.
+
+Draining and classifying the GSP-to-CPU queue
+=============================================
+
+The queue carries both command replies and unsolicited events. Each message is
+routed by its function code and its RPC sequence number, into one of three
+classes:
+
+* Function code and sequence both match the awaited reply. The message is
+  decoded and returned to the caller that sent the command.
+* The function code matches but the sequence does not. This is a reply to a
+  command that already timed out, so it is logged at warning level and dropped
+  rather than satisfying a later command that reused the same function code.
+* Anything else is an unsolicited event. OS-error and robust-channel records are
+  logged at error level. An unrecognized function code is logged at warning
+  level. Other known events (GSP logs, libos prints, assertion records,
+  lifecycle notices) need no action and are not logged again, because the RPC
+  receive trace already records their arrival.
+
+The read pointer advances past the message in all three cases, and also when a
+matched message fails to decode, so a message is never left at the queue head
+for the next receive to parse again.
+
+Corrupt framing is the exception. A message carries its length inside the
+region the checksum covers, so once the framing or the checksum fails there is
+no trustworthy length with which to skip the message. Such a failure poisons the
+queue and every later receive fails, which the IRQ thread reports before
+disabling the GSP vector.
+
+The classifier is a fixed set of function codes rather than a handler registry.
+The events that need action are handled directly in it.
+
+Both the polling path and the IRQ thread route messages through this classifier
+under the command-queue lock. Replies and events share one queue and one set of
+read pointers, so one lock covers the whole drain. A thread waiting for a reply
+dispatches any event it reads first and keeps waiting, under a single deadline
+for the whole wait rather than a fresh timeout after each message.
+
+One lock means a drain waits for an in-flight command's receive to finish or
+time out. For log and error records that delay does not matter.
+
+Design notes
+============
+
+Register naming
+---------------
+
+nova-core uses the ``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` names for the CPU
+tree on both pre-Hopper and Hopper-plus parts. Any function reaches its own tree
+through that aperture. The Hopper-plus central aperture (``NV_GIN_CPU_INTR_*``)
+configures other functions and is not used by the CPU path.
+
+The controller has two names in the hardware headers and in Open RM.
+``NV_CTRL`` names the tree on pre-Hopper parts, and ``NV_GIN`` names the
+Hopper+ unit that contains the tree along with arbiter logic. This document
+calls the controller GIN throughout, because the tree nova-core drives is the
+same on every supported part.
+
+Type-state tree API
+-------------------
+
+Servicing a leaf has a required order: read its pending bits, then clear them.
+The code encodes the two stages as distinct types (``Idle`` and ``Pending``) so
+that clearing a leaf before reading it does not compile. ``Top`` carries no type
+state, because enabling and disabling a subtree can happen in any order.
+
+The types order the calls on a single handle. They are not a lock and they do
+not coordinate the tree as a whole. Nothing stops two walks from running against
+the tree at once. nova-core does not run concurrent walks: the GSP event handler
+touches only its own leaf and never walks the tree, and the only whole-tree
+walk, the startup drain, runs once during probe.
+
+Threaded handler
+----------------
+
+The drain sleeps: it takes the command-queue mutex and walks shared memory, so it
+cannot run in hard-IRQ context. nova-core uses a threaded IRQ handler. The top
+half clears the GIN leaf, takes every cause the falcon reports, rearms delivery,
+and wakes the IRQ thread if SWGEN0 was among them. The thread takes the lock and
+drains the queue. The self-test does no sleeping work and uses a non-threaded
+handler with a completion.
+
+Shared BAR0 mapping
+-------------------
+
+The GPU, the self-test, and the GSP event handler read the same BAR0 registers.
+nova-core keeps one BAR0 mapping and lets each of them borrow it. An interrupt
+handler is torn down when the device unbinds, so it only runs while the mapping
+is alive.
+
+Self-test
+=========
+
+The self-test runs during driver probe. It registers a real interrupt handler
+and confirms that an interrupt injected at the GPU is delivered all the way to
+that handler, so it needs a working GPU and PCI interrupt path. It is gated by
+``CONFIG_NOVA_CORE_IRQ_SELFTEST`` and runs before GSP boot, so it never touches
+GSP interrupt state.
+
+The parts with no hardware dependency are covered by KUnit tests instead: the
+vector encoding, the subtree and leaf arithmetic, and the per-architecture rearm
+policy.
+
+The test drives ``LEAF_TRIGGER``, a hardware register that every supported part
+implements. Writing a vector number to it latches that vector exactly as its
+unit would, after which the vector takes the ordinary path to the CPU under the
+ordinary enables.
+
+The test drives vector 129, at leaf 4 bit 1. It registers a handler for that
+vector and triggers it twice, waiting for the first delivery before triggering
+the second. Its handler deliberately mirrors the notification path: it clears
+only its own leaf bit and rearms PCI interrupt delivery, rather than walking the
+tree.
+
+The two interrupts cannot coalesce into one, because the second is triggered
+only after the first handler has finished. A handler that fails to rearm times
+out on the second delivery instead of passing. A single delivery serviced by a
+full tree walk cannot detect that, because the walk's own TOP_EN restore
+produces an edge by itself.
+
+The test passes only if both deliveries arrive, each one finds the doorbell bit
+and nothing else pending in the leaf, and the leaf is clear once the source is
+stopped. Anything else fails probe. Requiring the exact mask on the second
+delivery shows that the first handler's clear reached the hardware. The test
+runs before GSP boot on a leaf the drain has just cleared, so no other vector in
+that leaf can be active and the exact mask costs nothing.
+
+The test borrows the allocation that probe made for the serviced subtrees rather
+than allocating its own, and looks up the vector for the doorbell's own subtree.
+A doorbell vector moved to a subtree nova-core does not service fails that
+lookup, and with it the self-test and probe, rather than being misrouted
+silently.
+
+The test exercises the interrupt path from the GPU to the handler without GSP
+firmware, which is useful when bringing up PCI, MSI, MSI-X, and passthrough
+setups. Under MSI-X a pass also shows that the per-subtree table entry routing
+works, since the delivery arrives on the entry belonging to the serviced
+subtree.
+
+Virtualization
+==============
+
+The per-function trees, the GFID routing, and the central ``NV_GIN`` aperture
+support virtualization: each VF gets its own tree, and the PF or firmware routes
+a unit's interrupt to the right function. MIG (multi-instance GPU) partitioning
+adds more structure. nova-core services the CPU tree of one function, and
+implements no VF tree management, GFID routing, or MIG support.
+
+References
+==========
+
+* nova-core source: the register definitions in ``regs.rs``, the interrupt HAL
+  and tree API in the ``irq`` module, and the GSP command queue in the ``gsp``
+  module.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2afa58e8f08d..2130d1caf4c3 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -34,3 +34,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/fwsec
    core/falcon
    core/tlv
+   core/interrupts
-- 
2.55.0

