Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B530ACE6
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158699; cv=fail; b=P8O+fFF1Tb1YPqWM78aqGrVdwAfxDmtEPEPhmoa1YqpF1IVAm9ZevFWZAHoDantqTEj1OwbkF/0Bopa0B8umBS+U4NRByme4HP6Y0SbVkSvq5bdx7X6fLkOx55ItX3pHouW6vzFYares3hASQOIR/1yOicvyrdqX9RSY+g3GE8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158699; c=relaxed/simple;
	bh=u9/aNXzBFCNoOvVrnR5pNHyp6udmABnJSoLqqF+0ozM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jf345QmT4R/A+/RsdUjF5/fi1Kn1Bt4+UqpQsyCNhs/zXMHm15RGilqFA+NBXl0NW9q0x0XhI0nEi1IrNJs5kf+gDDNOM7q2R45I2jxpO1iVU+aAJ6gEXPfZe4R6Of4cKk3zK3vMf4QyJw77EMpBj/T4As97u+GtXHTKlFwJS/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JTP6XvF0; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JTP6XvF0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqN6f30xMcQZJBQPsuyy0AD+c8n9KA+LjYj6jBqfvmUy7Tu6DYI3nl68aZD1oxs3RMjGKo2AACh/hGVhtIKn5nRQNweZMzrFXK2rLh0Y5R82pJYxcTjbxrzatPQ+tBkba1wjG0IwqPDutR5l38uC3YknEtY2g5e7lPwJIvDi7RMZa6s0TFT3EVU9D5TEuVWpKGceh5zgNhek68NUjc1HdEwCWKH5x/gSmivYmCq3S5QkvdvjwzOUKwSLgjBSGj5SdEzLR9sVPoco3QpB0msSe1lpzkt8sa9Cg3vbS1O8OT9Ogr0+Xa/emI6RXOzyaUbztrYHmReWzSZBLFtFwPuE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEIIErvbUiC7A9rylDVf2dYikUaWNY3AY1VgeydB62A=;
 b=jSGD7rDEO66HwszQSkRkprFclgo06ovo1IHeu7VUWz2qTSSs7FRHWFicIT51l+JYBJzig+mmQqdeS/Z7On8yGWhclnW7PPA+cGIsHGc6lNvAFClPP5gNaDJaB5A57QLTE2zYBdxVNoCQ30SEI2i7xMXryVHClrqOB2nLLUtFquEVYgU4x7eqTWwnUG7rwIN1n370fcnksfdCutBVcmUnhnH+E332r0UONFsdfbfDEMl1CU7IgZwwrInLALXXhm0oKbCXAcNlGA9JKAE5alQtO8dmh2caIdnmo0x1130WBqMZJPBiLtJ78Nb4NnmdUOrXarB6TtBqibc/4lokOTdkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEIIErvbUiC7A9rylDVf2dYikUaWNY3AY1VgeydB62A=;
 b=JTP6XvF01niVTDdI1K5qNY7rzxMG7syUdoXLQV4PhN+cbm1xF/u9kNdPEEEMuvXQrjWiVGFs+VOttrZmcEuBK7l+h1jGe5EvNspdxSgQ5lnf9divtNyfyFsGAJY47XWD1DtVJYgTv89tFWEn84NkoxhBzxStgjv2A4vzrtpPs1H6QTV/goItffPCiJ4Km89EnMXrpUCHvIjXkjZzsc0V5CBREfb4ocHI/Aj60xlpD9nwooG3GriVotbsHZvkVLJmLUd0v2YcS4Ji8L+CKiIwEdKiK/cPdGuwYmGIANtLZi8Rg++gU/NWFumo5DhU8fkSEC/VLzpyjoiB2qJ8dxMGkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:27 +0000
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
Subject: [PATCH 05/17] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
Date: Fri,  7 Aug 2026 20:11:07 -0700
Message-ID: <20260808031120.363869-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b45592-cd29-4c50-9e8a-08def4fabca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V8ZtmjUKVpBxv3gIwFkxP0hb6j87j6f+DAt+Vn9hQNDxuW+rAIxOb9k2WbY/mSJ6RvjSSI/ZtVbbxDCvlHmMxevGVdb8jAZdH5ZG3R3t8MYDOeWlO8oNjwPrsZ7HMXakIzHgN7SBhzTJuC6dFHIr24XoI9LDTYIeT78DDjJbML8GNjrh4VeT9jQykZWjYyf6zEKt+FOqdoxWo5EbRGqivb6Dbju6Ec0LDTC6Biz8cTiXEhJ32b0cvEA7lekj+vnCtRSfw3q78CxmRzHJtSJvr1kD2sv+pIJcCHnvGdTFkv9n2JcXYiPIVCQ/uTy2mvhq+xO8UoAMQNVA9fe+YpAhpo1QU6KCnPtnwnm1ixODYGp2YnXUjR3uQQbgJWcTUcifzmS+4didUbpddmWL1/Xf/DITYz1VRuWYCTFiAn39XTfQij5vogbgS5oxN3AenEsoiQ5CDrC0kBJOc/x5VYG+0nc9vUTAsH0k6Qf6mjHGa1F85c2r9J6RTL8HcftmtvKAnK0CouZXKZ4qLWpBJp/X0XwlLUO6zYa9V56e9DVXGvlSTu4X0Oc/uembfBho7paBpUeteu9VW9V0YzdKykEPiBGiUe6zK6+9mUdrVFQDpAXmNIvyXLegRFeOd+r47NHxZakW8qxxk/95N/StxIJFOqQ3L2x4M3UV5SWJTh3gxcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aXkCdP6JctiDNu/iT3PlnRjN7p1EsROeZ7A3byavNAbw2FKofLD/bZJLC5BU?=
 =?us-ascii?Q?uMWTfd0oUr2Rg/WfuoZFg/nfPaaiNmYLfFCmV0HGG/v18l+jsWi13CIc4gSf?=
 =?us-ascii?Q?RRCwMheO88qvT6tkkOwFHzr1vdShL0b4cvv4WmoFRitXL4XDWErCfAG/RnyC?=
 =?us-ascii?Q?P2gqISAnF2gGEJ83RcXJAw01CIi47xc72TLYghrzr0nVJ9aHT2lEHGfENvat?=
 =?us-ascii?Q?SiJoue0Wi/YcNMsS/kxoJePGMANu4XfqCTI+RKobOG0tfA13pXpqie+i/jq4?=
 =?us-ascii?Q?M3jtpJwj1gMvrb5bfuiJ8iKQ/tjdBDckvKD9MRVIlLwDBZOZGJZJH5qewC0Q?=
 =?us-ascii?Q?A4SHd9PJ1EXoVErLKYXPAzOlz9dKQTpom1HVHdgfaLLH6RsgDLg5uQS8Jsy+?=
 =?us-ascii?Q?o0mKfB9kbCUuN5DlBUFwXa31qTdu7JDYFk+KKp7dk+MQCTqty9uA1rSe35LZ?=
 =?us-ascii?Q?JeQoqD4Gu7e3guG1YC+lI/qei/2ZleqLLfKyRYsp2yaflH++xL1+/X0Ogfm/?=
 =?us-ascii?Q?udzDZNr+wsJFDRhdJqi0/WhcnVjI2iA4ZDtpgdaSCDGPOGFtYMrVIpvVvkHi?=
 =?us-ascii?Q?VjACyqyOBcTyfqVR0nn+yEpt818WWaKx9vwVaCnNg3jyU7dOGbS2du4xo4EE?=
 =?us-ascii?Q?oKTjhQ7gMYG52tZwjppbi6HY/vW0Y2TGHelwxwxyZfbTbqIpxKypieUvcKnt?=
 =?us-ascii?Q?JuqVcwte0f1c1ZFmpb1DWK5oesYxY9GDbNJjSiQt3d0ZKcERJ98DxdkavYaU?=
 =?us-ascii?Q?6gZmk6ygeApoWTqCbp1tXY4QATjJHJgKVkxcKOy87hC97wxPyvkAK84U5X9Y?=
 =?us-ascii?Q?oMXiKK6jLQTFZP908KLLlwfqfV5VGi4E7wybHejkZPdaui/MG4PvhXfdj5C7?=
 =?us-ascii?Q?oHSe0ki6EjAE23TI60tMWnOS/fWKqZkm0HJ0OKiqN2MRnZffmcZs/lF+DUK0?=
 =?us-ascii?Q?GADHgdn45PQCdJTm+ggQWlvnTyBQ7s7BudkVwEvUl7UDqtptWArELrGeoecE?=
 =?us-ascii?Q?f9EV1dqXh8TbfBYlNqpNWZetIU4t6m+QErMc08ZJLAQ2ELrb57c46ptvG86T?=
 =?us-ascii?Q?KoGAAisc0sb0nIECitejRaB+EzlClTyyhN9FCsC5pMwzJxBqmqHP8SduoUGI?=
 =?us-ascii?Q?I1B75lsWleuUrRD5dmAnrkT9A0O4AT05NGeN8x2PocF62ZmwaxKDDTX8IrCp?=
 =?us-ascii?Q?ET2yj0pGdb98JOvVMzZKScoBexdzZpo/V6OkxsbKnC4Qv1iSw9tZLKsEaStf?=
 =?us-ascii?Q?hy7iM+fEAwsN9BNhyeapu3jqwMEXRVXFPeq32KrYYYnrq2y1zKbMAbOn1n6R?=
 =?us-ascii?Q?Igr0gt/nfTvC1gybMMwW2DWLVA3oXl4vGOb/sMk7nIyFoROkPLfQDXc5fjE5?=
 =?us-ascii?Q?5SYQ3XEKHvqVNKTtzG5T7NtNgZUYjOxLqfV5/oepkYSOasvEOtLqhflD9AFq?=
 =?us-ascii?Q?SzFjCTJ16K7u6cJ5kLvU9u9Ka27RtigODOILmiv1N/0JnVpzghSAXUZGrakU?=
 =?us-ascii?Q?KzbWwDwqK8kGrdLZfgJ6qrtbeReD4zO7kXKQNVst4sWLY52DkiGU8QUczA++?=
 =?us-ascii?Q?9Zg3uum4oUMz6X9UaDwQ7k0q+C6q9Vf74w6Qln0iPWCTK+CyyGqhNhHLlmZd?=
 =?us-ascii?Q?NJjCKgQq9gURpogxxMAxVwEO7gqL2an8vGlGmBDILU2t2qWYN8ZlQVix3FSN?=
 =?us-ascii?Q?oZGN8bM9vpGLT42csIIImOFSVA8AaSwlP5F1+aibUAxxYoitPORn+K3uiToM?=
 =?us-ascii?Q?feuD0SLCbQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b45592-cd29-4c50-9e8a-08def4fabca6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:27.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JT3u8kgRZkXjmHX2z29OZIDsKkD9khhmgfhtKsdSzrGmJc6J+81DVQmNvD9rjDorpPgz5OseAVDRHX/ZDILDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

GIN is the GPU's interrupt controller. It records interrupt sources in a
two-level tree and signals the CPU over PCI when an enabled vector
becomes pending. Add the CPU tree registers needed to receive GSP
interrupts and to run the software-triggered interrupt self-test.

A pre-Hopper GPU that signals over MSI requires delivery to be rearmed
after each interrupt, by a write to the MSI end-of-interrupt register.
Add that register.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index caeef4d85874..1db92d36c5ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -456,6 +456,64 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
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
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF(u32)[16] @ 0x00b81000 {}
+
+    /// Enables individual vectors within one leaf.
+    ///
+    /// Each `1` written enables the matching vector for delivery to the CPU. Zero bits leave
+    /// their vector as it was.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET(u32)[16] @ 0x00b81200 {}
+
+    /// Disables individual vectors within one leaf.
+    ///
+    /// Each `1` written disables the matching vector. The enable governs delivery alone: a
+    /// disabled vector still latches in `LEAF`.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR(u32)[16] @ 0x00b81400 {}
+
+    /// Enables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`, which spans leaves `2N` and `2N + 1`. Each `1` written enables
+    /// that subtree for delivery to the CPU, and zero bits leave their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET(u32) @ 0x00b81608 {}
+
+    /// Disables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`. Each `1` written disables that subtree, and zero bits leave
+    /// their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR(u32) @ 0x00b81610 {}
+
+    /// Latches a vector from software.
+    ///
+    /// The vector named in the `vector` field latches in its `LEAF` register exactly as a hardware
+    /// source would latch it, and then reaches the CPU under the same enable conditions. The
+    /// register is write-only. Every supported part implements it.
+    pub(crate) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER(u32) @ 0x00b81640 {
+        /// Vector to latch.
+        11:0    vector;
+    }
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
@@ -471,6 +529,19 @@ pub(crate) mod gm107 {
     }
 }
 
+pub(crate) mod tu102 {
+    use kernel::io::register;
+
+    // PCI configuration-space mirror.
+
+    register! {
+        /// MSI end-of-interrupt register.
+        ///
+        /// A `u32` write rearms MSI delivery on pre-Hopper GPUs. The value is ignored.
+        pub(crate) NV_XVE_CYA_2(u32) @ 0x0008_8704 {}
+    }
+}
+
 pub(crate) mod ga100 {
     use kernel::io::register;
 
-- 
2.55.0

