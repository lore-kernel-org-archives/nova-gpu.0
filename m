Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E93859D4
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158712; cv=fail; b=MOxcD/L7WT7vpiAmz7Lc29uWelqAEXTJE7Ln95IHtKMC/eLPFwq/levU51h4CqI43+sT0Wsnt6XRR6N58eB38HPnXxov7pjLsbWneS2GXzPurRFEud1AEZA8wAypHtLX/9P0VxWh1MyS0/mLdZxCiJJvocqXLXRP1PXaCK0HZaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158712; c=relaxed/simple;
	bh=HQWuOFoT++h0cnFD0geb/TyA9SzYG/1gLleQcGkSPVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSA1vF1WNlLnhxTLG96+gonu7umgDLMH2yP9ucRihYUn9R7JyyDWJfH2FRnpCBJnN93NArk3PjlJHaKGRG2kLTvD7kJg0lW07Q97J5+8BG6/NxOVhFSWTHZWD1ijOH04WWgwRAPXouN5cfWKUw54/k8SctkKaFkgWLrNOS1vbmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RwyJDNeg; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RwyJDNeg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXVLH8w3jF1gTVOlUN2hE7CPC87FnGXICRSFiHOcF8ueAZMhJgxGG6hpbL4OJ/OOCp4o7+Ba0hIEO4WvXUko7N7rgo4DkEKgxTPYPAPw4a4Jb/wABWILM+mm215idvhKRrqZMsRneBm9m7Ehr3sh/fGKt3fqBYKh0cURuDtLhCurpnYXmGgqXhEA6YvM4qz4u+aFiOt79jHUUBROUAxdVT09mFH7jbQ0jbPoxiCrKoLR2oZrdAYUl9jce70tD8kD2ecUofHHjuzrZizZSKYmxW0DARz07xaiqFeTh1OVhhwg08GOB8PNvZS9r/NK+0C84zs2BTFue5dOxWjBlaqc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScoaxebdDeSKwNmFRzea1gkoY1lrp1Yc3MscNYzN8m0=;
 b=QTQOdlohKYDggM7DWKpAvJOHe7pxjcpUCFKIj52xXCpkVrZ58Hy7jLwu8pF/Q/OHTcrf3F8402XCruOQa8E5X9jh+WLvoNOOQXK18TPZ9LpQnzkeIXnNDB6Z1bMEOV33hUSIcf3+5SRvGRFh21o/8ZOfi+CotK/QARWhVxHDcNpNvBdxojG7cgpvqo9sJtTtwVMPwyIeHVAWlE53VDwrP+xT7RwltoLFfII5U7AZg5DN0328+pXumS91XoBn5nQRvchpIYzA0jl0HtVtilk62BoPZOSRjN0aUbO3N15b1EsoZYo/F769G2iXJGG+1obS5VACp5vhMYObfg7oI2VdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScoaxebdDeSKwNmFRzea1gkoY1lrp1Yc3MscNYzN8m0=;
 b=RwyJDNeg+1tJE5petxc71IwrHfMKa/Ak9wJ2UwnMaDJUQVinfWd+Csn1VNh3VXL9iOQAhevebK7S7bS8KzDOf1v0G9d8YtCu6Ywep7OwTFlyrPZ4n9GLYST8GK14aEcw9VcRP2HLA4kCmYjMfCYN7pXEPWZPuD8nFTXFhdZgjRdijbLZ/DZG4YcRZL/ZT/P5t3nntiFDfGdNzP+wzsmeVOMLKridVs8q56jxF28mJ2GSJ7kpMtE1fTrH4m9ZulRMI9UH3Rhi8bTRnaX+outR2IsQgR97QGMg7YKkcrWA9G8kCSa9T4FdL0gvMVc83QOWQmebyI1visVTOgwp34GLhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:41 +0000
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
Subject: [PATCH 15/17] gpu: nova-core: retrigger the GSP falcon and clear every latched cause
Date: Fri,  7 Aug 2026 20:11:17 -0700
Message-ID: <20260808031120.363869-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc81f02-64ed-4035-5d3f-08def4fac49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cCX6gwEC1VjrFpWMqjzzmQq2Cae/UWm+GNBiRifnq+V30elkhppsJTCc3ONmLVabxV5PRB2wQd6cYuNfELDJYQoDnTT9/Li6TfVfwpACuEza0kOv1c9TEMbZ+DxUUUjNXR7rOY2Bm7c7zCX3IzJo0fTb8j7QlruQuc6LZuSfJsFAaQc79qiF2yhzTp+gSk90IJDG+1hsflchohhDvKPeO8O9MtOEYvRIYDHvDNbpSbFf9Zh0+OhuLgJzDW6pm5fSlkVgqeQwurFNynREYEFP7j3vIyQ5ltcuHsBbxPdA4GR1rQDHdAM1Lvxt3pFhNMQIOqzzMUTWApNO+0rMMH7Fr2XVvEgyGWHSQS7ax9cHNl4y/BuR/pqCTxZnkpNx8xMZyp9UQIUl1+W4Pu8mgEaJxgwAK+PHGZp3D33lkutrs9lwb5qiXqVV05ICcy22Fxo7oVWz3w2tv1TtdJ6HGK6JFj4cjl6z9xyN0BdMr2Q0aD5i8Ez1Da8U55KHwFhHKxj/OX0AqA3JE0y4I3RdPgoj+aPEeNjd7iL317gN2ONZ/QuW3yoCsnE5dIhEeu/kxz8nqP6ewXy94aRaKtn3NkR/w2vUEB+x7pCPY31UnwTSQ9dZVIwhhpl7Hods3IcFSjl5auWiS09wsb1npA3NyWWHOKwPArcm280R15DD48GNg5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MklkvGorkGODk5ttKgBUSfuuHZRC+0vHkIY+TmI6t9llWLBBFgxqKzFXsCXp?=
 =?us-ascii?Q?5jpQMzBpq4usjNOkor1gGjKQIRYqCWokHjRZHb6Extltug+PHLetBdSMZzpK?=
 =?us-ascii?Q?1b+yUhANjS3t1oYzdfl0cI/ORCsAa17LPSVrJWKL6PcgpSRmkoiXtx2s4s06?=
 =?us-ascii?Q?u5Rp9hgpQAFhGzH6fhlf93MHMXrIdL1G9jGBNzq61qmcFnbwIm9IRAKvzxw6?=
 =?us-ascii?Q?ZUXt7VXT4BGWfy6PBbF2EuLdLqVpULtIIByrYvcK8N+aLWLPmFXinlWBzrJ0?=
 =?us-ascii?Q?Lr+49tROWjljyJpO/V2M/5wfP7JWGRA323zknVWOrBu7A2aDfXKKr7ehraLb?=
 =?us-ascii?Q?lVCCzF461VVcGzvUY4TQ13pBWnmDhV8Mfhg4CW8cWs30KtcdAisdEzQYXu2s?=
 =?us-ascii?Q?B4op6xzOLqg+FTMEM2+225kJwGNtw/Xoby8dzWka0IqciSavJI9EvT1FCyLv?=
 =?us-ascii?Q?kW5rlovgn7f6XfHnL1MfpxzYHWK4AN1yGjqwuw3vHESvmUNdD76xaOk1ov3C?=
 =?us-ascii?Q?9ilvV/KlDb82WwKO/Vud83qhS6e5XWAnZ6ya6/PhkGFhv4NzVCw/FXjLagG3?=
 =?us-ascii?Q?nrj57MdTxR5Z859tgZDZO3PPhfIQIqY56Qm51IrySor5xL86nbWUbFUZLsH4?=
 =?us-ascii?Q?JAOjO8soXo+FPr021S4z4M96CE0bQ2reG0bWgaEdpVOPSfGz8GDpQsyzWx1K?=
 =?us-ascii?Q?zQcBVoANdvWkmnnrtDGe8WVPRKbRLJV+slFu3Pxy6teP3od3SneKRJXhJtwi?=
 =?us-ascii?Q?49RnB5oHFQYZjsopYScm+creKXu+5k+Hv4LAhgtfg6dEfXGSWZui2gxV4cJp?=
 =?us-ascii?Q?vxK6Z1TZOTqlXCkxo0VKHGy2b/R+tZzZBIXNCmd7J0Vlt+QQ/9T4FuR/OVDb?=
 =?us-ascii?Q?1gJWgeaurR+cUl1lHjHl2UePrEQY890gBpIMJj42F+hNXGhlk7gvhljo8Q2U?=
 =?us-ascii?Q?EgmvrJ7W8f/GUfDGtl0EYOV3t8MnxGtio4vQIaGDlkmuSsJupkzLaU6bTjE7?=
 =?us-ascii?Q?rQpDXZoFIeaQoh7b+6056BiPaOR9whjXsKw3v0ZBR3sh3S+jm+N7zrZqBrRt?=
 =?us-ascii?Q?QKVbL9SNiutIny5mCE9WQcGPSUUtrSA9dilIgXxvWll5oqYQ98gZhhLFvL4J?=
 =?us-ascii?Q?ysBtm0ZY7xO+BTIdVCo7CQMVpS/QVqg9N6XW2C7dMZIAA6Uf7qcFPfilVdLd?=
 =?us-ascii?Q?3gJ/+Kqiet0pTV2mK0nKfvSkMD4+C64E/DiZMPHXzEu7O8ESjfYPp421XyEm?=
 =?us-ascii?Q?PwkfCVBuYWQERRRIar4IlhvdemDVo556XsefesVimF7+gPliry6PoDuUwyjz?=
 =?us-ascii?Q?uQ6bhTjdIjD1ORPSCCUO45rQb7GJjwlm03R78q23bALOcbVpIbNUUlvWC3to?=
 =?us-ascii?Q?oxFKAQ6HIrN6cvWHraO6/DQPfsUr9Wsd46/JUZJVNjhuwVUuol2lo22UalI+?=
 =?us-ascii?Q?D52ouoCdbVwksy+tvNlJh48oSULvUzVvk/eQ/OdH5HVVo/nsQ2Bf+mJplDda?=
 =?us-ascii?Q?KtYM6qg5DCqcjHMUIWXwmFgMxtpL1tVnlrkt92RGlidtl/Lo19BwmOMKHkRQ?=
 =?us-ascii?Q?7p/ubMzfPoSVh302vRlTqK8ki4bY7LnUpBRbZiEQKvZe8Pe2bInAcfk+OuQk?=
 =?us-ascii?Q?Bjoea3f7z6rzQihIQKuoGd/iu7FnguMW5ojHrm42hRz6wb+K470vrmIEh834?=
 =?us-ascii?Q?DH1YNG00PIzvZMzJLz5EaP7oDFQhL7nw7mq2pPlspcquAFGweupUJ7RpolYj?=
 =?us-ascii?Q?TPypRIwhIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc81f02-64ed-4035-5d3f-08def4fac49f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:41.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb+IV5Z3m1YEyF5Vy6mKln2DZMEnT/Ujc4kVCRfdwRMYqWH3He0Kk4sIxUAlZ7Wt+ayf44MYWEZ3BMOh9jtz5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

A falcon signals the interrupt tree when its set of enabled causes goes
from empty to non-empty. While any enabled cause stays latched, later
causes produce no signal, and Turing falcons have no INTR_RETRIGGER
register with which to supply one.

The GSP handler cleared its GIN leaf bit and then cleared the falcon's
SWGEN0 latch. A cause that arrived between the two left no record: the
leaf clear discarded it, and the falcon had nothing left to signal.
Swapping the two clears moves the window rather than closing it.

The handler serviced SWGEN0 or reported an unserviceable cause, never
both, so a HALT co-pending with SWGEN0 stayed latched. nova-core's probe
cleared the SWGEN0 latch before draining the tree, so a message posted
in between set a leaf bit that the drain then erased. In every case the
GSP went silent for the life of the device.

Write the falcon's INTR_RETRIGGER register after every clear of the GSP
vector. That supplies the missing signal from whatever causes remain
enabled. Turing falcons have no such register, so skip the write there.

Handle every cause the falcon reports on one invocation, masking the
ones with no recovery path so the re-emit does not raise them again.
Clear the SWGEN0 latch after the tree drain instead of before it.
Neither of these depends on INTR_RETRIGGER, so both apply on Turing.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 36 ++++++++++++++++++
 drivers/gpu/nova-core/falcon/hal.rs |  8 ++++
 drivers/gpu/nova-core/irq/gsp.rs    | 57 ++++++++++++++++++-----------
 drivers/gpu/nova-core/regs.rs       | 20 ++++++++++
 4 files changed, 100 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f9d9e8e0386b..6ee5c1ef1af7 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -16,11 +16,13 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal,
         Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
+    gpu::Chipset,
     regs,
 };
 
@@ -64,6 +66,40 @@ pub(crate) fn take_swgen0_intr(bar: Bar0<'_>) -> regs::NV_PFALCON_FALCON_IRQSTAT
 
         status
     }
+
+    /// Masks and clears every interrupt cause set in `status`.
+    ///
+    /// A masked cause leaves the falcon's enabled set, so it neither raises the tree again nor
+    /// holds that set non-empty.
+    pub(crate) fn mask_and_clear_intr(bar: Bar0<'_>, status: regs::NV_PFALCON_FALCON_IRQSTAT) {
+        let causes = status.into_raw();
+
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQMCLR::zeroed().with_value(causes),
+        );
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQSCLR::from(causes),
+        );
+    }
+
+    /// Re-emits the falcon's enabled interrupt causes into the interrupt tree.
+    ///
+    /// The falcon signals the tree on a transition of its enabled causes, so clearing the tree
+    /// leaf while a cause is still latched leaves no transition and no further vector.
+    ///
+    /// Does nothing on Turing, whose falcons do not implement the register.
+    pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
+        if !hal::has_intr_retrigger(chipset) {
+            return;
+        }
+
+        bar.write(
+            WithBase::of::<Self>().at(0),
+            regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigger(true),
+        );
+    }
 }
 
 impl<'a> Falcon<'a, Gsp> {
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7e532889a1f4..f0828b32aebb 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -72,6 +72,14 @@ fn signature_reg_fuse_version(
     fn load_method(&self) -> LoadMethod;
 }
 
+/// Returns whether `chipset`'s falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+///
+/// Turing falcons do not. Ampere and later do, including GA100, whose falcon otherwise uses the
+/// Turing HAL, so this is keyed on the architecture rather than provided through [`FalconHal`].
+pub(crate) fn has_intr_retrigger(chipset: Chipset) -> bool {
+    !matches!(chipset.arch(), Architecture::Turing)
+}
+
 /// Returns a boxed falcon HAL adequate for `chipset`.
 ///
 /// We use a heap-allocated trait object instead of a statically defined one because the
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
index 1fce315410f3..ecd716b92d4e 100644
--- a/drivers/gpu/nova-core/irq/gsp.rs
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -54,18 +54,17 @@
 
 /// Clears the interrupt state that GSP boot left behind.
 ///
-/// Disables every vector in every implemented leaf, clears the falcon's SWGEN0 latch, clears the
-/// tree's pending bits, and rearms PCI interrupt delivery. On return no vector is enabled, so the
-/// tree delivers nothing.
+/// Disables every vector in every implemented leaf, clears the tree's pending bits, clears the
+/// falcon's SWGEN0 latch, and rearms PCI interrupt delivery. On return no vector is enabled, so
+/// the tree delivers nothing.
 pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::IrqType) {
     let tree = Tree::new(chipset, irq_type, GSP_SUBTREE);
     tree.disable_all_leaves(bar);
-    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched.
-    // Clear it before the tree drain below, so the drain clears the tree state the clear sets.
-    // Messages already posted raise no interrupt of their own, and the caller's queue drain
-    // covers them.
-    GspFalcon::clear_swgen0_intr(bar);
     tree.drain(bar);
+    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched, and
+    // the GSP drives no new signal while it is set. Clear it after the tree drain, which erases
+    // every leaf bit and would erase the one a message posted since the clear had set.
+    GspFalcon::clear_swgen0_intr(bar);
     // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cycle methods, but pre-Hopper
     // MSI rearms through a configuration-space write instead. An interrupt delivered before probe
     // leaves delivery un-armed on that path, with no handler to have rearmed it.
@@ -94,6 +93,8 @@ pub(crate) struct GspInterrupt<'a> {
     cmdq: Arc<Cmdq>,
     /// The GIN interrupt tree for this chipset.
     tree: Tree,
+    /// Chipset, for the falcon retrigger, which Turing does not implement.
+    chipset: Chipset,
     /// Device, for logging from interrupt context without taking the command-queue lock.
     dev: ARef<device::Device>,
 }
@@ -112,14 +113,15 @@ pub(crate) fn new(
             bar,
             cmdq,
             tree: Tree::new(chipset, irq_type, GSP_SUBTREE),
+            chipset,
             dev,
         }? Error)
     }
 }
 
 impl irq::ThreadedHandler for GspInterrupt<'_> {
-    /// Top half: clears the GIN leaf, takes the falcon SWGEN0 latch, and rearms PCI interrupt
-    /// delivery.
+    /// Top half: clears the GIN leaf, takes every cause the falcon reports, and rearms PCI
+    /// interrupt delivery.
     fn handle(&self) -> irq::ThreadedIrqReturn {
         let bar = self.bar;
 
@@ -138,27 +140,40 @@ fn handle(&self) -> irq::ThreadedIrqReturn {
         }
         leaf.clear_vectors(bar, GSP_BIT);
 
-        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
         let status = GspFalcon::take_swgen0_intr(bar);
-        let ret = if status.swgen0() {
-            irq::ThreadedIrqReturn::WakeThread
-        } else {
-            // The tree routes every falcon cause to this vector, so something other than a posted
-            // message fired it, for example a HALT from a GSP crash. There is no recovery path for
-            // those causes, so report the status rather than discarding it.
+
+        // Every cause the falcon reports leaves the falcon's enabled set on this invocation. A
+        // cause left latched holds that set non-empty, and the falcon signals the tree only on a
+        // transition of the set, so no later SWGEN0 would signal at all.
+        let unserviceable = status.with_swgen0(false);
+        if unserviceable.into_raw() != 0 {
+            // The tree routes every falcon cause to this vector, so a cause other than a posted
+            // message also arrives here, for example a HALT from a GSP crash. nova-core has no
+            // recovery path for those, so report the status rather than discarding it, then mask
+            // the cause.
             dev_err!(
                 &self.dev,
-                "GSP interrupt with no SWGEN0, falcon IRQSTAT {:#x}\n",
+                "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
                 status.into_raw()
             );
-            irq::ThreadedIrqReturn::Handled
-        };
+            GspFalcon::mask_and_clear_intr(bar, unserviceable);
+        }
+
+        // The leaf clear above consumed the tree's record of this interrupt, and the falcon signals
+        // the tree only on a transition of its enabled causes, so a cause that arrived while this
+        // handler ran would never reach the CPU. Re-emit to supply that transition.
+        GspFalcon::retrigger_intr(bar, self.chipset);
 
         // Delivery resumes only after this, so it must happen on every path that services the
         // vector, including the fault path above.
         self.tree.rearm_pci_irq(bar, GSP_SUBTREE);
 
-        ret
+        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
+        if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            irq::ThreadedIrqReturn::Handled
+        }
     }
 
     /// IRQ thread: drains and dispatches the GSP-to-CPU message queue.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2a0489472a66..01fde2c5e5a6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -200,6 +200,15 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         6:6     swgen0 => bool;
     }
 
+    /// Masks interrupt causes at the falcon, one bit per cause, in the layout of
+    /// `NV_PFALCON_FALCON_IRQSTAT`.
+    ///
+    /// A masked cause is excluded from the enabled set the falcon signals on, so it cannot be
+    /// raised again by `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+    pub(crate) NV_PFALCON_FALCON_IRQMCLR(u32) @ PFalconBase + 0x00000014 {
+        31:0    value => u32;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ PFalconBase + 0x00000040 {
         31:0    value => u32;
     }
@@ -327,6 +336,17 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         0:0     reset => bool;
     }
 
+    /// Re-emits the falcon's enabled interrupt causes into the interrupt tree.
+    ///
+    /// Write-only. A falcon signals the tree on a transition of its enabled causes, so a handler
+    /// that cleared the tree leaf while a cause was still latched has left no transition behind,
+    /// and this write supplies one. Turing falcons do not implement this register.
+    ///
+    /// OpenRM declares two elements and uses only the first.
+    pub(crate) NV_PFALCON_FALCON_INTR_RETRIGGER(u32)[2] @ PFalconBase + 0x000003e8 {
+        0:0     trigger => bool;
+    }
+
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ PFalconBase + 0x00000600 {
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
-- 
2.55.0

