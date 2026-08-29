Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB53A9630
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966580; cv=fail; b=KIuwLYGmZgAOnBVWSrZcQPwU2WjW5EoMTF44Vwamjl+e0sg6+epKuYGt5EYBKvEmdpZjsb6llY0EeGBCgplMHsqP0UlNbA6JCFpz8zMusTX5e5KSk3m6ifGnqC79v87kozrKdIfqyW8QEj9LHJ8N/f4L5sFHZ33W4+Be2tdT80g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966580; c=relaxed/simple;
	bh=WxYrFRx6cuSzIvQoDB9aMRoEf/00SQtDg7LPAXmOSuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sV+9frD3EIQsmfC2ew3kMIiNY0HxrtvBECgXV0//oS0klPHLjz3u2MbGe9i1gLYR+L0tUHX62mInqANxAnYGXqC+PAD8ubl+1H/azND3DjHq7CUDmvlJcqSHGLteuFBrUrbo3nCENPXRBkiWJcQtpZPK9ZZMCnubr5oKePptksY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gI3dnDGg; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gI3dnDGg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/th6RIyhqsbb/Eym7qcFH4rwSyrfvojhQe2QfKxhcaZnFbEr72uatr6HTyXuosIevznBf4sz/NTUoUx58zcdTTl5G2D7yhUIVKWjhyzqQce9uxBUt9u0qSkR9QeH9uD8+Nnpzn26Ro00GrHgIVIV5yB7298LJCynxscA0da8GsLo0ibhFpApyrJ1YdG6ayFf7zptb7bzHzhJ3UwB53s53oniaknBv6tlP8Ms6Ehe330XbNJx3CCw1V5I75+CTmIuxIV5Bf20iXltc3UWPtXvGrYgvrlIQcylbizxXCtXDCurdoonKVyhM8vgSZdTMZQe88RoqRZNKjRICJDYbIETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibdM4QPTlPbdV9RkNobEMbK0JZY5Dd0tofb4iLFIs7M=;
 b=sk1poa5NQBewzzgxvfAFSrBOV0R2T8GmtaIBPF1R1Bz69YuHJAvAOyF9MBhsaVoYN8m+2WbaKroKNz5fHHb5qySjf6hD98BRhcJ/ndxcagCHWWnwx18LX8bpEvDwpifujg9DJemF8LLYxwwO2FJrY+FnYpUTQEQXUrSQvBwJPMzzCw6e5FFTT6V/2PZ8tY6Aha/21f4hxRAHMawCO/jy0RRN3J9nAWpU4EzPqFYxTXSaIx5LgHrNHQmItuOMGAfdZF0Ash5cGDX69XOEQ/DP21bhvLmwE0NYbV++vkteKxIFRsWsjAjiE0Ic+us205jDXGOiMYIuDx9BwVhTKUN4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibdM4QPTlPbdV9RkNobEMbK0JZY5Dd0tofb4iLFIs7M=;
 b=gI3dnDGgvu+kJr5FH+QFqFuPlgDmhLRVuCs1CZHmU4wrLSMi+Uws8ykbRFCg9aCt5JW/o0z+8dPFa7UqLCCTk7VSYvhZSO/PmMVcoo5m0F68jJ4zqViyEiyauY41dn57aBShJk4tPZf6SOZ9dz0w789BK3So1uyhYr/ZQEkfuqAWSuMIsY6B3x8Kp1UDS8KAsEoPvMcKbweN7M6s+kMnSDm8uP+mE7OLPs5halcd20BS41Zt5o+9dPw9bWTPA/iShtqAOD+QS3ILSWuOilAd7GnA1iEEWDl0IHEK170w1CEJL1alysmah7SrK6iG3dh0b7w4Q8yJBgFqucHBf2nXLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:51 +0000
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
Subject: [PATCH v2 03/15] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
Date: Fri, 28 Aug 2026 18:22:31 -0700
Message-ID: <20260829012243.496697-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfccb28-795a-44c5-2c3c-08df056c0b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QtdkzJXqlBn33tVPe1zpOWFLkeG23HNdXB3iYxeBlqIdVE2hIHnYS3Sn0cnLVEFu7KMnVk+Q0KkuDFdmp97MW8yvzB3/OprUR3iSOxQIPaXyckePZX6Cc8ujCbB3Dc93DU0Cto8H8LwK5jBw56FH4l1LWiyjBedJJVqtqlTdql+uS81XjxxMRWv7kpxvTH5VkOQ1Oecu/tMZdxPza444MEl67bfcGmnmgIwkFNFgHN5aH8do5PCxc7a1v2uBz3jz4FwxdZxX2hdc4879HT66j3AmAf5Pi4mLeV8XHic4FmoZG5GL/RNEzLkQ79WGP4Qkr0jopGKpq2HL1F/zW/CRXaAsbs4HvV/tQPkSrBRXeVnxlqZP82pLWYIDO006ojKSJFBpWl8ciIT4CAGEoJz1atL9oq6QB2AjKB5VOmeWteOWoL/G3rhP7oLAzW/b90K4ZVR+xWrNH03l1uMsg6uWDcQMbw9awoPX7hDxzNGm3y+Qz7cCcPsGFFTi4/pImgupF/ww/jIa8Mlwhs8r0vdBheh/CPKTmso7iAG7l5k13zQ8WjA0kdxORJzg3mkG0lj/EMUH8LcdW+pvfYmprfB9wWkAU7BMw0vKCzLNps5AN//AfcW0tjAeNHrf628O8IaBr32WXSanFbiSM8OmoMESqsqZXZmCouTWnA+h+XMFK+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WLueG0iA/wijZej2p9Ri49c4hi9N/4+g4nOK3E87qwoTSbpCcycn/7HH3PF8?=
 =?us-ascii?Q?PMi+ySTPqCYV6RHGuLrrm/8vRl/zFaojEK+Uvxu7hPmCZgRfIVXBM1rvpfS9?=
 =?us-ascii?Q?oCNW05gj3zA+RtJ9MSS2S0TxTv7zcZkRBftaSl9QjY+XKxdp+vLSHIpczTcr?=
 =?us-ascii?Q?RLkF6RInlgSXZVCbJOkKfYhA3BenzAy/zpepUrzYZHxwOLGd8P7+o9KESxfq?=
 =?us-ascii?Q?Uhdef5/oWotG/qopvxSuqqr19vcI+IYH/vlUVpikkpE9G/r9AptLQD5q4XnD?=
 =?us-ascii?Q?X0rb24d6ROK03ohVMT7yPOa+6NAX/5IiJngCDhuIipfJXMKTPoaEeBQdPeZF?=
 =?us-ascii?Q?SwbqyD4OZVKofrQaXK9WNgXQaUlMFY0k9AzQOcmzz/Rd+LJ5Mrvk0HDGGSa6?=
 =?us-ascii?Q?NWsGO+PEn2VxsVATTCBa1oRBmeNIS5k1uc6aZ7dIwgNPkrj/ax2J4668nZi6?=
 =?us-ascii?Q?A6FrtNJKMwZg+OyHNooviRNSPNZyHWR/FFW5QFEspu9W7x+Tn3vMBWxr0qTP?=
 =?us-ascii?Q?ES+w+RohnUd+fhNkFhc1lzbXAqRE7eOKiNpDrVh+X7cku8cOplGx5hLXXbQ8?=
 =?us-ascii?Q?oYcbO14rq3S/dU57oFETkus3l19PWaiUqpPKOsoR8pdMOtkoPBtdvXX808qZ?=
 =?us-ascii?Q?gftPXY36xEzqJgNSoD23fKrsaopxrSWLS39aTOPH+9cuKfwSfVH0yIG1my3d?=
 =?us-ascii?Q?mDqImsl7kTrYYf0zPxMLoAeRcfAHdT6B6rlZgy92o4adZrsBMQWeT4wQ+DIY?=
 =?us-ascii?Q?9pU60TQAe4Iw8r4y/JqE5jE0ivUAFZZjKt6LQ/PWiswkYUU7/8Bxuj6nLb/9?=
 =?us-ascii?Q?Oymy9eFbZ0MPnwku9P2GqUb2ASR2ZnTUj2zNhfrlQj1bUKfQfngPPgabeOAu?=
 =?us-ascii?Q?jEvPMmSHZCLeXftIW5HBFapOhtlj2/+Gfr9tQZnn/AjpgVkAyADOEVBida+o?=
 =?us-ascii?Q?pw8OxKjxdgO/WQy0+lsYyKuRTRxyPq+dg/Y4TFiZwlUPpS8/F21GGJt6v1Ry?=
 =?us-ascii?Q?bQAlsdrDcKtiHTKKR0zfLmIuxbTb98q06/Anbmg1nlnaR12bHiPgN+2UsZeh?=
 =?us-ascii?Q?KAfgD3nbCOuKUBhHXNCNAsiU9o6RP6zeSaAwZAtE92bL/6GRsnLr0fF+AJr3?=
 =?us-ascii?Q?EM7ixGnHcMdQpiJi273mupLvXrREs0ZqrvqpHUV0f1xPOdtYFzgFGCX4kQ9R?=
 =?us-ascii?Q?i/rebtJAKz4dZHWGsqFMgD8Ttj/Uhq8qF7d04rdkfOtKLO00Jkz8ieOihL31?=
 =?us-ascii?Q?bcTfIOlB8RDOs+71NRQwnWmCJsiFmc7XnpPybb+8j4tUrOu5PVIFUZOggD9+?=
 =?us-ascii?Q?U/l/t9ki58OoEzog4JOAeujG6+lil68S4iminy4RZTG1DzUQTfKgkS0O4f8x?=
 =?us-ascii?Q?f04O3CaR4vGBapgDJ/OwHu5qUbIfpFDywtG8hsv3dAy57xxNH85gQ4EouRlb?=
 =?us-ascii?Q?+Ogq9mE83hLg7Bc9xAxOXOTta/sICMHv5IGK6WQA0HVoLxxdzaPoJZXyZmS4?=
 =?us-ascii?Q?ceFiIOJOOZGZ4chkFaROFuDE4M/Ahmfel45xb+ZakpS7DI9vzs7T/VOg9ozb?=
 =?us-ascii?Q?52LCLXcFGLqFR6+40fp0fkbNyMPlAF/2s5KkKdtNI3rGOz4WRC3x3dh/P72s?=
 =?us-ascii?Q?8ToE9vCEF203S3lXuUb1YJ/ymuJOZunFTkEH7HIq0sGJIvR1YC7MJB30svwY?=
 =?us-ascii?Q?7FyKL84aMO+r8a5gP+HS0sJ7b+Lfrdun9POPtYMVrp28b9ljA8Fr7Tw1iJpk?=
 =?us-ascii?Q?SuUePasPJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfccb28-795a-44c5-2c3c-08df056c0b64
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:51.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7HsknvdexhNqjhjQ0md2xZdMrOg825h4cuf4GQpogOSWw69CLd+p2+uzbf8gRnK0Cvc13yUDiFi9580Y12AMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

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
 drivers/gpu/nova-core/irq.rs       | 11 +++++
 drivers/gpu/nova-core/irq/regs.rs  | 71 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs

diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
new file mode 100644
index 000000000000..6656a1a23d59
--- /dev/null
+++ b/drivers/gpu/nova-core/irq.rs
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GPU interrupt support.
+//!
+//! GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt controller: a two-level
+//! tree of pending and enable registers, one tree per PCIe function.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+mod regs;
diff --git a/drivers/gpu/nova-core/irq/regs.rs b/drivers/gpu/nova-core/irq/regs.rs
new file mode 100644
index 000000000000..a01a78d197bd
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/regs.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::register;
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
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF(u32)[16] @ 0x00b81000 {}
+
+    /// Enables individual vectors within one leaf.
+    ///
+    /// Each `1` written enables the matching vector for delivery to the CPU. Zero bits leave
+    /// their vector as it was.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET(u32)[16] @ 0x00b81200 {}
+
+    /// Disables individual vectors within one leaf.
+    ///
+    /// Each `1` written disables the matching vector. The enable governs delivery alone: a
+    /// disabled vector still latches in `LEAF`.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR(u32)[16] @ 0x00b81400 {}
+
+    /// Enables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`, which spans leaves `2N` and `2N + 1`. Each `1` written enables
+    /// that subtree for delivery to the CPU, and zero bits leave their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET(u32) @ 0x00b81608 {}
+
+    /// Disables whole subtrees at the top of the tree.
+    ///
+    /// Bit `N` covers subtree `N`. Each `1` written disables that subtree, and zero bits leave
+    /// their subtree as it was.
+    ///
+    /// Hardware defines a single-element array here, and its one element covers subtrees 0 through
+    /// 31, every subtree of the widest supported tree. nova-core declares it as a scalar.
+    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR(u32) @ 0x00b81610 {}
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
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..68b5abfe494d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+mod irq;
 mod mctp;
 #[macro_use]
 mod num;
-- 
2.55.0

