Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C674C14
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 01:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140750; cv=fail; b=VJv6Yywn38uxdUHz1Ln40gcnx+/Xwv1oQtQ6fAVOcOfzr09zqQFCPKzOLt81xPPtOGDV8YnbEglY4Sqecd7LDv5qwNPUjzO2A5oxEjBG8csdAQdaLJMOe7RS+g/ukRrIj6A+3tDdbIEdc/3N4ZjgEKWGwnj/e9C867rJMZAZEi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140750; c=relaxed/simple;
	bh=nQsmuFzM6YkwjHt9LaGTYKIHiOvI67hg3IZU+2V1KyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LrIhsA/1cg663NKlw/1xqwitdoGIoS5yMZT9N2pLDoYyc5x5jQ0N4458ywhGVUmQM0f5EQQQmmvpCeAD+YxMS9VFcKpMnM/LulI8Gy6x7nPLgbLcX4FLEemSFWJVbq154bPpHvhfWSj6kvgNbcLCYdum/NNEZywI/mDv1dJ8UTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lENKBISj; arc=fail smtp.client-ip=52.101.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lENKBISj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1IEEx3KLGCxGVFsszB7i7gt3sYHCa0NCtLRhxdDrkAPIN8WEoHemiXTwrfgAZXVMcSVXy3tKmwX5N3Pvv+HLDby7iq05aiD5QF4/nSVkq5cCbeGf+U5GBSFvZBhmUFr5xKiinUhxLZC8WFCwrLmsHrIliVYVTxJsEgkEkP8yC78vEiu6WjAzFKpuHqeDvONvqdk9gcf4sofff3AloQxJf3AXdpgegZtX674yJaDZgij+NCI3RK4I8cSTGK0HjBqxv5pQ52myehNmWC7+kczA0TXpKIaDTt1rFgTqg1gcT4XnJGzGLYOcNEek74z7yvMmNWOOijfFgZqz7SqpShTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DMTVODs9TJ+pIH9z6L4Z54gnZ61h+1kzndh1LH5vng=;
 b=e1+OSMrOolH3Yy3dgAVzSflQF2529HbkkxWCdPsb+sKDfQmFTH2qhh85EfnH2c8gLMq5zH7b1QllPdm3Csr97w9T+nOe8skUv2Gfhy74xIF5U3vQZ23UAUmijWy6lNptLB3W0e/j99y89t1s5EclaAY0aopDSEbZJxI9nmftws18M/YRHjRAFcECdwKvNDDabTNum8fUUxwZPSeJEQlUoLjOXsdr9YzeRbjVACpmmM3ypwSizQvLp5nHz423o7IiAPwxekFk5ksHeHpIg77JTQoEPcO9CepYYzjdVBJiVhZSAWcEgNgqBJUVdvLn4MeskVpRahmXkNVn5VrKYfn5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DMTVODs9TJ+pIH9z6L4Z54gnZ61h+1kzndh1LH5vng=;
 b=lENKBISjoxw6rjwotE9EBhYsZZ0yMrlwq58s5YFCBRPcRzYG41b/PwjuxQBNXScUaPNGL4Rs73B7aMTLYKMmyWnGL7eyH2WDD17N7wLB+IQPomXKEdlVa7/K++UEptFqqnSIjCxIUNh7NukdQ1C5CLrwWVrUxV0pSXR/1iDsWkEz/QClyZaIyBTxUMzXVcKtE8y0Gxis/OUdaaXTmeqM6cp3vNZIsr4/cw5LjZMJChf1apNC0gFO3LFk0/zxX3sXvYvEMNH+/1U43DQkJTtC0wCSI5j1sISLAyNeqnTSmkOyUihs5vcoH58oGusITnfzwnZix+jwFMxZT+URdwzMtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.11; Thu, 11 Jun 2026 01:19:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 01:19:04 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 1/3] gpu: nova-core: Blackwell: use absolute FBHUB0 flush registers
Date: Wed, 10 Jun 2026 18:18:59 -0700
Message-ID: <20260611011901.84517-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611011901.84517-1-jhubbard@nvidia.com>
References: <20260611011901.84517-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bba2e89-57b5-4efb-b5be-08dec7576d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ogiRnEfXVeH0lcWOucGm85AbJFYAvUisR+Sphd93qR8BIofIlXA0nVIghpUvKU7mgytLywsBhgzn05oLwfYnqGKNvTpXFyNADmAqk2/QAkUs7KHIgDp5wKxdXp8raJE3LLF3D82eu9Wa2rBRXr3zsAAU+tC0FD7o3lFrmp1aNMjkoyBktoYk8AsaUma5KqQKGPdaIa8w4gU/n/wBhMwZeRO80HZUn3ev+vI1jHghaP5sAbPL5o6pJy4olVdtziySqbBAqPivoRPd0hTCVSs1TL+/090W6oITqaW1B3aqP071KBJv8rxnRJEQYLkFgaecFOLACSSjeBqKIkIOP0KUN2MH3iXif22XvhuW32Sv/M7UI8S5sligYkDC6/GQrxjgys3I+lnIfiFk+LMdMyfyzstY2D/dE5EOlA2s9TuRlCdHG2roARl5v2FAQhaOvXd59brvCiMB4aXUgiY9O5uIltc2nX7s59mKC22fwz4su4jSqSvFjNyfJFG7jGAiV9m9PFKOm+32Urvgc/SCocMqcI9MMMMWv/WADKqddafGTDjl9pRyIUKtEFj3+sAql71Sdzs0c7i6vw+0fKcaFVOKs6o5gQh14Vzl+KEsCI3M3YW0gFGR9D8fOERlDUvzKkoSDcBmrl3sKWwFr1+8HVU1PVcNORFfYFrhu4OUIlH/xC9hzBiG6FJELBUVT0Fdnm5h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jGy25KAZl2VGJNliXiszfEUjQ7JJ9VKR+GyNt6GOhVjeTIFV00CPqQlqjF5M?=
 =?us-ascii?Q?wzQdWp/kBxr7Fw0Q95XpB6zWRlMq4jNmKyggrb2WB32dSLLyazs16OhoL60d?=
 =?us-ascii?Q?XyIDjce/8DhOXX+K4fri/zWdJafwnMTebnzP6qhe3efhHby/5drJbWVR//1D?=
 =?us-ascii?Q?U9AsLuB440c+CoeuRnEfia8CBylc2fhW8hvfbH/Gk3V0C2H1OieAvIQuEBLu?=
 =?us-ascii?Q?/7hebqYKmG/1d5FyxfYISrpUjmpnFbWG2NQkWNSlkuwT3PLq4v6mLlQl+CYO?=
 =?us-ascii?Q?3RS0ze5MsK9kICZ0x67D7BjVp/OoOJRiCK+2W1VfPKUs8JYUghRe1VkNdc+n?=
 =?us-ascii?Q?KOqNEt5WS6erqoLmHVaVN1r8GlVCzbJOc/bqbGed/WGTpBmjCBiKxa9nfPU/?=
 =?us-ascii?Q?EHIAjkZLygPPOF6hFTZJjKH3rebNG3hchZ/6wGvGX/tRDcFQGLRbG47YFcMv?=
 =?us-ascii?Q?jXWPT2FGwsvvhGxKazc/C9T+9awXZ28neXittBL3/qlItiK2lptU23Lr9cQ1?=
 =?us-ascii?Q?oannCYocOIE7X7yvGmCcvqD09dIiIIh9jRuFoRJonWq8qGPYKslkIfVs2xY7?=
 =?us-ascii?Q?tNxwkTx/Sf1/CU9jYYnL1W8/k1KejGdJtZaMpGvKPkRn8bgg+cHuBUE42ar5?=
 =?us-ascii?Q?KL14NJv62IY9G6F1D5ldduUTsIDtjVzb99lPI02j/nEEjmQ+Qwnc5td7+cuU?=
 =?us-ascii?Q?hc0a/Xc2VhYBdyvMNWzr7mAK/bZmylL/K+KvDrhCXL8SxRfdR3BQ1Bii2eoC?=
 =?us-ascii?Q?0X0r4MX4aSpQs5IN4LzymtaVoZZiB1tTYYgucSmV8cuocrG38Fua42h+yIsh?=
 =?us-ascii?Q?bm5kEK+q8u8cfnwm2sHhvFQp26O7adlNSHNCv6XIbMUo09ZKgOfIpZ+mWKxO?=
 =?us-ascii?Q?a6VLCGI0m8UmsasyopmpJwZJ8icE9QY4bBI8lNuSTcGmAHpHj60zDenrEJ/D?=
 =?us-ascii?Q?Yh6nzONu7rFVcpu+GY8eqr7Zt9mIhY4mUiwsAtj8Cqw78yj48Q3qywbVMKYy?=
 =?us-ascii?Q?ftL4VYFnw4jFR7JXOViZkhN2aVNOayWyaYcAtuV1xXnNf5lMWsSFzoqpGaLK?=
 =?us-ascii?Q?QFrQKfpiDbb3ewUY8uLLqEgK8Vgz/wVdJlcT/dTYczYRjCJfkCfJHXG5/xxc?=
 =?us-ascii?Q?hemNDmwH39FYMeJuNXUOLtUE0V4xjN/ptraZSRJ1arQXMIE2FhDkKmY7oKHu?=
 =?us-ascii?Q?NdyuVUkAW6sU3df7MOxyRPhctaZX94xF5K/JlZfdlQqwg+r2PNztFwXsNkeu?=
 =?us-ascii?Q?JwZNBCknltdqbkfFnxzCBBIOGXrq+0A0djluyBJFskfsv9BaRuA8OpiR6Nrm?=
 =?us-ascii?Q?lJPCg1HXHtLFTL/E6odxTyMG6vQwbn49goEZPpZieDEX/5/y9Y0xKC7mXz9E?=
 =?us-ascii?Q?eXU7roEybcLbot73mgGc3TVfuaZvEAojA0/SpBXJQ498UnUpUSXn+AZPinZG?=
 =?us-ascii?Q?rCL1sdvWzDY59Uqj9UptVNfra+6/c+pw0DaF6VAKHZh4jeNkJ7qX+DZjfiu9?=
 =?us-ascii?Q?7T2FWKv7+0siYgoLse3Jv6pMbsgpJe0+l+dPqE5KYhMBY/HYRtdnSm+xsHgk?=
 =?us-ascii?Q?ISr+kiTM/5U1trhebeSRtgrMuqvFBo2gphtRlRjJC7KtL4m/+BXNzMLn/HEN?=
 =?us-ascii?Q?91t6uIv1qsDfqV4B9kWRWrRH6PdwjkEtBmk6usyGmwhDYD0ak1VK7+jhNmDX?=
 =?us-ascii?Q?acQYBTFrfGdda8JE1EAOrjl1Q7/MA/Sh8KvaUFOxSKYjqvZhQejVsezEjs1H?=
 =?us-ascii?Q?mSEpI4CDDA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bba2e89-57b5-4efb-b5be-08dec7576d65
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:19:04.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2ZMjtOaEmLsROz/WFF0FIyuvfOOdUhlaEoguMFyc5DqOo1YEa1wKtxA++X8Gw7CkoJMQcLN4xnu+WdPZmZLQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060

The GB20x sysmem flush registers were defined relative to an Fbhub0Base
register window, but there is exactly one FBHUB0 base, so expressing them
as base-plus-offset only adds indirection.

Rename these to FBHUB0 and give them their fixed absolute addresses,
dropping the base struct and its RegisterBase impl.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 26 +++++++-------------------
 drivers/gpu/nova-core/regs.rs         | 19 ++++++++-----------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 038d1278c634..6747ba6c9c13 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -4,13 +4,7 @@
 //! Blackwell GB20x framebuffer HAL.
 
 use kernel::{
-    io::{
-        register::{
-            RegisterBase,
-            WithBase, //
-        },
-        Io, //
-    },
+    io::Io,
     num::Bounded,
     prelude::*,
     sizes::SizeConstants, //
@@ -24,17 +18,13 @@
 
 struct Gb202;
 
-impl RegisterBase<regs::Fbhub0Base> for Gb202 {
-    const BASE: usize = 0x008a_0000;
-}
-
 fn read_sysmem_flush_page_gb202(bar: Bar0<'_>) -> u64 {
     let lo = u64::from(
-        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>())
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
             .adr(),
     );
     let hi = u64::from(
-        bar.read(regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>())
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
             .adr(),
     );
 
@@ -44,15 +34,13 @@ fn read_sysmem_flush_page_gb202(bar: Bar0<'_>) -> u64 {
 /// Write the sysmem flush page address through the GB20x FBHUB0 registers.
 fn write_sysmem_flush_page_gb202(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
     // Write HI first. The hardware will trigger the flush on the LO write.
-    bar.write(
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb202>(),
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+    bar.write_reg(
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
             .with_adr(addr.shr::<32, 20>().cast::<u32>()),
     );
-    bar.write(
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb202>(),
+    bar.write_reg(
         // CAST: lower 32 bits. Hardware ignores bits 7:0.
-        regs::NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(*addr as u32),
     );
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 73339a0cff99..5ab7ccfb9855 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -153,11 +153,6 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 /// The base is provided by the GB10x framebuffer HAL.
 pub(crate) struct Hshub0Base(());
 
-/// Base of the GB20x FBHUB0 register window (`NV_FBHUB0_PRI_BASE` in Open RM).
-///
-/// The base is provided by the GB20x framebuffer HAL.
-pub(crate) struct Fbhub0Base(());
-
 register! {
     // GB10x sysmem flush registers, relative to the HSHUB0 base. GB10x routes sysmembar
     // through a primary and an EG (egress) pair that must both be programmed to the same
@@ -178,16 +173,18 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     pub(crate) NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Hshub0Base + 0x000006c4 {
         19:0    adr;
     }
+}
 
-    // GB20x sysmem flush registers, relative to the FBHUB0 base. Unlike the older
-    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an 8-bit
-    // right-shift, these take the raw address split into lower and upper halves. Hardware
-    // ignores bits 7:0 of the LO register.
-    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
+register! {
+    // GB20x FBHUB0 sysmem flush registers. Unlike the older
+    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers, which encode the address with an
+    // 8-bit right-shift, these take the raw address split into lower and upper
+    // halves. Hardware ignores bits 7:0 of the LO register.
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58 {
         31:0    adr => u32;
     }
 
-    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c {
         19:0    adr;
     }
 }
-- 
2.54.0

