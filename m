Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB40364E85
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405334; cv=fail; b=WzVvqJmqqetmQCoFjEZqIc0DoMAzlhkXJTwY09BMOn8uKOfRQaE0ZhvtZFWfDrsdZIU3qPPbWaoftGxVNq36qxxMdtuhUTpDTTO1wZIMFrby4jnYAY4oDMEY8u2fwqYN9sJsuo4l4rM78VwFQnmEPLn1BSUr9JQlnSpDzghL9iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405334; c=relaxed/simple;
	bh=ACRAs1I42HQh8Z9E43NEitgwVNNeK8a2pDJrx4TL0xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uBoPX/zhKn4Jvr5WahVViW9+a/9e+L6Cd9IGOA+8h+ao5dIr//iH9gC5U2edPW/rCMH6bJBVVYbXtpkEdBUcBwpeIf+Ymr0Kvdy3nPSdOkc/o9p6tq+wc65DUCiXnfUghv6wa2je5NZyDLbkuuzKULVdn3VT/LbLvMs+laKBAxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nVo0RIFO; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nVo0RIFO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XY6/6uEmlIJHZ6yX2EJjtJqX/JeLnHpO3kQkFUw3inp5UzBHwHoFOCE7gYpNHtW2IU67BBwyrgb1zGwvNuz0+bt7eoifyYHtmwjjXOR1XgcZDUntWLokxWHge40S1/SG94suEjDjyCUNDsZe1BwOd5/KX6fimJA/DXBdkL/Br2onVNu2uK59UE/FRcJ5rvxv52xU2Xob3YXmtHObnMoeoLn4Ul3uEcXql2/f4PQs2MI9wQ0r8oWbhWPmgTtDxKyxKj7AdJetaM9runS7T+REti+ix5JC4a58u21919jmvKlMwQRVlwyx6KJv2/6ErvJRcT299HiXypgruzieR1AX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01NRJNxMW/KRrtZHh24YDLf7YmGRjv0RntqHt1X9Hw0=;
 b=QP4oTUIGoaSTbtPrrI2+en02x/25yN8eSLjMqHB3Y1GcRvHuDFCEBfmjCzX35vVO7dR72xNWg7alffedWWCqDyAh79RDTr+gOQAAsiVfnMOXYAI7Y6K2NGRzltOzxrJ8TVgfCyYrrUN8AGI5bL+pxHihE63zOWkHkGt6L1ILtuAOzkaLQjeLBS8a7FmgTNbyGcAcu3gJcEbwtycjC5d0v8STg0vTCQFqNbdyJOKFJFjjO53hHiYswVkXTPPxFjpAibrL/BEhSrm+RWMzFFQ0jDwn9Z9yxRRpatXoLGWq2S5tstgHHKxSZrAmt3Djtcq5rh8pysIcn9VruV5MeVBq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01NRJNxMW/KRrtZHh24YDLf7YmGRjv0RntqHt1X9Hw0=;
 b=nVo0RIFOWLGUYvbU3EfwzrYfWXVy809FF4pNBVAzzXZptI0ITOBdV0Nh7l8vQSrOcBfogrcjY0lb+Xq07S6Nl/ooWOmTm6SHKC1EFQGgM7Gj6oJVMMgJenZaXoX5V3DydbX6UpA8kcVM/owi28ezEyON7HHlH3WrzALVawzSZ7ISQkUhEHmsRzVkDbQFZQM6jcGg4pSfpHnz4EBVx4R77zcR3ceXwwo861R2+K/bOpL4kel0jgsoV1tTg5uuAb22LzV0wlxSgHxSxmiat2Bq054RE8X4/enPYMqElz1tMtwc36J0KHXSQon0WD29+GznlD9dRpoXUMHfsHdUsNf50w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:23 +0000
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
Subject: [PATCH v3 04/14] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
Date: Wed,  2 Sep 2026 20:15:03 -0700
Message-ID: <20260903031514.1515905-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: edad4694-daa7-409c-2dbf-08df0969978e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	n3yJyiBQIO078ZcQKoLhoCYLClgm83xBK0+KLnRQngipaqKaJAF8UppDDVFSUv4ukHT/UgMJu+HF80XTy1cGeGPbss3+A0ni/5Wep/kJC4OCiZ+WccuJTvlg3oSrMjwT6zFvuJMoa9tnb10374aOgk0SwY+vN+iFpzsqcWnm1VAun/8JTr1z+KKbWRc5tAmevRJAi7gAIg2iWE8XCHoD5nfZ60/UwcdQIcxTdazf8hZ69lMSyHynHOY35N5+TP378mcUx2AxhLRXYRvqjg12znnEaaBTAoS4Fr0RU8kEtSegji9Sgz61lDOl98KIJPm9RxrebCu+qvp787NslrhqPO4saU9+KGhRR1/UEXBF7aPXHz0tC6OdwFqVqvl1vgzNt1TFFW+BJcLliDbQLleKhDNud6Fan7iiO86qk6mR2BbxDHzas6SdPzWfX3OzVsQyFnTMWhqL1TirD6Gjl5vxEFj2wenkCB0PhjBKrB319DKlIKXkM3gOb3V9mqHBzaRcyFUMvtlGW573LhqHB5YIF6Sk4SeEdhl5qrG123AsqUtQ4JSmUOb5ufaWA0/wZZk4BXZElXsk7vuC2UPLMk6QyfZ4B8p9WyBRRWJn2Fn243c5vOytbBYYVbVKrAN4KzdbMb1mEdPVdq+jcrlwQ1QhKq6/7bjQxLAt+ENsabplj6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GNcXZ0+kGMsPWvQ1WApxopRexF9Ph8iwea91jNVdtiqknzZbhTQfUOAQoTwT?=
 =?us-ascii?Q?CQKyHb7tUu0npbDN9xUdQSFMorXBB4ueRuz+9wfppL3W7crP5H/nxsi9lP2Y?=
 =?us-ascii?Q?ErnPsoORuFy6/pMZOVRTQAJ+lq7LownpZFpvFnyZaNFh/KHY7Ts9VgQZp7PR?=
 =?us-ascii?Q?H3YDAfE1ervuKs8aJ8yRBml02mRKJqiiwo3NSIkPIQf/NsJXn15pphnu5DC6?=
 =?us-ascii?Q?Rq5Z7/x0cE/e/Nv6xA3hzUv8DV8tRJjf2ZaxcPbTYPlV5/NmglfOGcqYDahI?=
 =?us-ascii?Q?ePfjDTS9+xSeqDAWFNs4mvdoVORQor0OtuEKI1csAU54wh8IwD4mbxLIJXKo?=
 =?us-ascii?Q?GdP1ncd+kiYYKo9HUSF8nfWLEarWWy+hWgyWVFjKK5EsqmywM8knEaSoNoEG?=
 =?us-ascii?Q?V3NSY7IeJl1RzD3RKRbmWMae3waweGd9pTB2qsnwLfXNsf8wk5ZRdnbr2NJP?=
 =?us-ascii?Q?mp3Hkgjun+P4wyGLyrwFTtZuU5RULr/VXeUIb+0F1RjqB0P2Rx0JQ9P9j9LD?=
 =?us-ascii?Q?WgglFj9ULJ87GE5RRnXeBzw4iiToAIBs/ikfMekz7J0WDIs4ScZ1KGZXF7cO?=
 =?us-ascii?Q?jDX3GAVJ/Y0f8/dcLWkkM8I/wGqSHSMot73CLKypoURuPQV1js8KCpYYbtWG?=
 =?us-ascii?Q?JSChIspBVlE5YbtJjcxhPaEIW/1E/FqV3KvtkCT0+tluo7ePboJxmzGDs07Q?=
 =?us-ascii?Q?dUWhB+LA9tFJAU73bDppAo5hDvqLOrJPrGy2BGAA8XR+MlzdRqlHv1/9goxu?=
 =?us-ascii?Q?Acp+hZIjE/9lw5A6UuTfn50scPEfDSd+2slqUXsuYoSwEqJ7g54/+8M6aA1Y?=
 =?us-ascii?Q?V6Z6JeOcacGAmaJNMe1N9yGlkAvoc5aARMv/NrXIvclKkykPhcE974qUh7F6?=
 =?us-ascii?Q?YvGfgazqUC2nOv3lXZJo1iFanpQyKBm+G1lS+cQglgipcI7sUoVVD5wG/Qqv?=
 =?us-ascii?Q?DLIfPkCq5qmaDTS2FzqqFEyZdlzcOxbdXOovYGSWOgOIR8hzm46dFJT2GWRA?=
 =?us-ascii?Q?uFZOg2xFkWk34y13nXWI0PSgEIA6TKz82Er3fvXUNffvLYpFpUuvR6sMCQ/K?=
 =?us-ascii?Q?Pw8fVZEaiSYRweh7Z4TpeT7hS3WIwonOuc+nKILsZ5EIV4JZh9GI15xN/Cu+?=
 =?us-ascii?Q?VsZQgcxFLVOgSTBR7fgPTY/6Qb8OjPIjxTm/7nVYhV9uNK9An4w5aEduo+v/?=
 =?us-ascii?Q?80zn6spPtGQScR1cltbaIHNvw3K3pVyAmqbkTXTB3TsWfJlReP78clwIOsCT?=
 =?us-ascii?Q?xSR/ZL7tG7Q5dt4GBhD89M8cn6az4bfnzFttqPLLl5egYArCVjs4EkyrpQyL?=
 =?us-ascii?Q?/VkPPE40YBkxfYTTp5IzdQR9Tg942ERWzNyAFakKOx3pwG1tPuYBgnZLvVhP?=
 =?us-ascii?Q?GHcish8GzbtZd5GXWJDq436sp2rEqwiDzITi82M7yBUq7kPgad/H0XP9Yu0m?=
 =?us-ascii?Q?gaWpJYRAlaw7GCsgejCLr5ZOjYysm8WYvkQuRkyO1egV3T4A8etdmr+6dRcL?=
 =?us-ascii?Q?soX47AJ6BdpLNjrGZLW2HaWhJdop+A6pva8kGT93rsTORk95mfJlIF/WrDRG?=
 =?us-ascii?Q?EXRNSd6hWHJi/+434OxdkQr6umZ1qnGWdTgPA444wl1FW/rGA4lj4eRyiYKt?=
 =?us-ascii?Q?1qYBJO+1PBCJXwOorq7HlASLFFsY7sVPEDk7e0RvGIwY6jzsZBpgj7h+E4aY?=
 =?us-ascii?Q?4fmdvNwvDb122c9oVPwsQY6xf0Is6G3fEAr6/VJ4Q7J3eOmQ2ukPD6f7hTOo?=
 =?us-ascii?Q?IW+z3zFFAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edad4694-daa7-409c-2dbf-08df0969978e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:23.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNSv9z5lb/2R/uvleOEUqMjTAUKYkoG6VvyNNB7hI5PUIy1t+hIZTFoflMRPUOwiz1yC1aDk0DajP+GWhCLT0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

GIN is the GPU's interrupt controller. It records interrupt sources in a
two-level tree and signals the CPU over PCI when an enabled vector
becomes pending. Add the CPU tree registers needed to receive GSP
interrupts and to run the software-triggered interrupt self-test.

Declare each leaf and TOP field with the vector or subtree type it
carries, so a set of subtrees cannot be written to a register that takes
a leaf mask.

A pre-Hopper GPU that signals over MSI requires delivery to be rearmed
after each interrupt, by a write to the MSI end-of-interrupt register.
Add that register.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/irq.rs      |  1 +
 drivers/gpu/nova-core/irq/regs.rs | 91 +++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index f27952ff747b..3066ceeb850c 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -9,3 +9,4 @@
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
 mod interrupt_tree;
+mod regs;
diff --git a/drivers/gpu/nova-core/irq/regs.rs b/drivers/gpu/nova-core/irq/regs.rs
new file mode 100644
index 000000000000..4bb7825207c9
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/regs.rs
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::register;
+
+use super::interrupt_tree::{
+    LeafMask,
+    SubtreeSet, //
+};
+
+// GIN, the GPU's interrupt controller: the CPU interrupt tree.
+//
+// These registers are the two-level CPU interrupt tree at the
+// `NV_VIRTUAL_FUNCTION_PRIV` aperture (base `0x00b8_0000`), which any function
+// uses to reach its own tree. The leaf arrays have 16 entries, the widest tree
+// on any supported part. Pre-Hopper parts implement the first eight, and the
+// interrupt HAL supplies the count for a given architecture. See
+// `Documentation/gpu/nova/core/interrupts.rst`.
+
+register! {
+    /// Latched state of the 32 vectors that belong to one leaf, one bit per vector.
+    ///
+    /// A read yields the vectors currently latched in leaf `i`. Vector `v` occupies bit `v % 32`
+    /// of leaf `v / 32`. Each bit is write-1-to-clear, and a write of `0` does not affect the
+    /// value. Each bit must be cleared before its vector is serviced.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF(u32)[16] @ 0x00b81000 {
+        /// Vectors latched in this leaf.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Enables individual vectors within one leaf.
+    ///
+    /// Each `1` written enables the matching vector for delivery to the CPU. Zero bits leave
+    /// their vector as it was.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET(u32)[16] @ 0x00b81200 {
+        /// Vectors to enable.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Disables individual vectors within one leaf.
+    ///
+    /// Each `1` written disables the matching vector. The enable governs delivery alone: a
+    /// disabled vector still latches in `LEAF`.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR(u32)[16] @ 0x00b81400 {
+        /// Vectors to disable.
+        31:0    vectors => LeafMask;
+    }
+
+    /// Enables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`, which spans leaves `2N` and `2N + 1`. Each `1` written enables
+    /// that subtree for delivery to the CPU, and zero bits leave their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET(u32) @ 0x00b81608 {
+        /// Subtrees to enable.
+        31:0    subtrees => SubtreeSet;
+    }
+
+    /// Disables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`. Each `1` written disables that subtree, and zero bits leave
+    /// their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR(u32) @ 0x00b81610 {
+        /// Subtrees to disable.
+        31:0    subtrees => SubtreeSet;
+    }
+
+    /// Latches a vector from software.
+    ///
+    /// The vector named in the `vector` field latches in its `LEAF` register exactly as a hardware
+    /// source would latch it, and then reaches the CPU under the same enable conditions. The
+    /// register is write-only. Every supported part implements it.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER(u32) @ 0x00b81640 {
+        /// Vector to latch.
+        11:0    vector;
+    }
+}
+
+// PCI configuration-space mirror, pre-Hopper only.
+
+register! {
+    /// MSI end-of-interrupt register.
+    ///
+    /// A `u32` write rearms MSI delivery on pre-Hopper GPUs. The value is ignored.
+    pub(super) NV_XVE_CYA_2(u32) @ 0x0008_8704 {}
+}
-- 
2.55.0

