Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ADE38F94C
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188282; cv=fail; b=ND9D7WOWLnugdt22czoWe8DijOSJIkxA5ctOuek1EVVfUCfiULHmoHmeyZYS5og7zkRvfWK5IdE2wLXHh0GUmIHXz1LNanpLYt0wMtZBHScEd0s+J0WYMSdTRNWjzojkLw/m47NpTWdqOdIvopMavSoZR956q4EPc6tZ+M4pxow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188282; c=relaxed/simple;
	bh=0ZFat5/5PNWi7nAsNvdgiSxqeoHfYpp2B8y0E8JoYaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X7788f+y0f7YRMYKRY0aOewtUkkFVRiSg4Wanu+/dHgqkaqZx5eTnDBmNpwJ8UI8SBzstDHXtW3c+39I2BhtIv7zqbkuInR5lt3LpziYNL7fZnRaMLMjkjjnc0+0tvSBT+mvXqa6NqwmbR9C+rD8dLj7UqdSoO9+IqK4MotzwL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HCGGkS+N; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HCGGkS+N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0VR7LV760EV4iVoZBtv/k+A2xxPI8QZxuO9VKxEVHML5xyhi4lJU1foGV7CoidnDw6PMT9VC5n9UYJTsVptXQVluQIEjK7y2tQ9r1yTKS5/FUzqpV8qtDtaAWT8cgZiOuQ68VJ+xBr291bwmtS/0xjBjudNtgNEVA3varosLT99KVWefu2uej3uB3ebkYt7ISY/C3Tz/oixBQbG2wQNjJBM8JxfKq7NR/4rV1I+w87vuWPrTnOQ0BFieFezZU3mPpQCUMXzUqqoGRCeMW8T2cAMsoOwaK051vIcCdVlQPIu12XIprVr56jDm7+enLd6e5hlAjXeT6jdsWQi5gXcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xn+ThUXOhWoF/HAFKQveMKP3va628g6WbuEiE9af/H8=;
 b=W10vYTXV+/ggv3rOabciAomGZEZbrZth69XB5FYJVk8m5IAz/KfFG/1xE6uWSoTRivEBuQOnTnAkx96e3tH/ovegmSlngzvt+bRuYtglez5Va2q+OBRyO2NhYv0amwOJzmWpM5pGFLCBcV4jmW9Bqq6+yVg1T7JaW/8Chn0JjbywlkO2xDE7sv9gCFoFAQsXK/uvDGWD7OWzbsjJKNkNi2VPZiWQE/2rQexLfLzzWC8FMFtlQgYKqtZsqpNFu4PaxGQnoEihUewfR0bL9bzpezqk5z7wK2At94KwmwD7/xZWgufXJ1BWCFR4uJUSqkNmuxS95WYAGYyt6lXJe3FHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn+ThUXOhWoF/HAFKQveMKP3va628g6WbuEiE9af/H8=;
 b=HCGGkS+N/klPHN0TYT9H+tksAFQbsY5HRUgfya0Sroxc8EaW6CeEMWgkbm1YEc9aW/V9jTTHG7rigPohYG3OSVd5JRYgy2fTzPliovBOaHKh0TmLeNlvBlH+i8jkotzFxdsPFaZ4hGjZN8KaFyI/4PDjP27yvc2gVdmry8Gqow9qTZ4xm/Zm7Q4qzM0Efw41Z7mmL2hnNFapaJtXDuaxkp96LO1OuymunPTpTSzmPQNDMz9Jik5QjuLrXhaVNFQ5q/4HyXQ7amBWN5NhboGa13A0+xi51X6E5JmGm2gE6LQZxJ4/KrwdFR+xL/jIQk7pddhDuTHdkkVoTxqCb3UzNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:29 +0000
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
Subject: [PATCH v4 14/17] gpu: nova-core: add the falcon interrupt registers and their HAL
Date: Fri, 11 Sep 2026 21:43:57 -0700
Message-ID: <20260912044400.677097-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e27e2f-ab19-4f8d-0ca8-08df10888801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	0gArYxy/8S6pCcsa1RyRHPqz5znko8PTfNrYQ0OPKr6nA/yDbgMvPB5WDpIoacOoWoXJEBN/ZvwNYNrMEr/ygBWJ27HE8Wgvi6MrzVuPFGGsbjYd0dZicgg4OeoNsdoVLV1Q0NNiTG0osK9JORMMmkUu4xnZAFvwckAQRg503y+5UIiI7jPt3c7kXFq6ZYriO2uRtQ/7QWGlg0TA3eMk+A88Qa9mF5MvcSD+u3iHg/yFG72bCJlUOvBuLTNvliR+AuwGyhw0aPFHLZa6lS370CTZEz636CJ8gSL/v43KhcQaiIEHAyiQp7yAI0qRgkLIVI5mhcKC/QSDCFurUsFPOJK/C25VMEUWQqg7E0UWmiqV80X8hRKFRKKpTgid+vbvzkxUg6LVh6sNPqb5WXj2152i3W8wOYdkcmlCOqealQWl93NYxCdsY9oenmQZInEbRf1Wp0uCCVUlxJeAmBeAKE3huOjQHQNg5SwtYAZR/NgqMK+/suK7xWer7LSXshiNwwHB5u+wc01BRaSEoMlplZVSZyn8Gp6cPEMyUJCdh9H7hfuZ4riLyefSEELifhRno8dgF6fnO3MwXFdAOj5VzIEUR8Tto8QzwxQWo1IcJ5jL45LFgS0P1+J2nig4OSeqLEiMrBxM4i6GBaSGhUynHCjne7e+vGKpi4V5XEnZ3fc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KBVIVKEFliUABM1X773A7Xe7A1QWMlq7hgrkQDpoUoZcGAfa8uiVQ8UyA2LT?=
 =?us-ascii?Q?sjpQmRbcu7dNqEcKfjl62FQ6GmVbn/ANp+2XSbL/FDzuzQYAOA3OxN0jPEoK?=
 =?us-ascii?Q?tkNGesUOO6q92YI+gGbKL8qHRR7GSfzV58tKJZOSoF2Io+8BR4kaFjKz16NP?=
 =?us-ascii?Q?aZLstoDFCcqL/hS6NUls5chdwFv6gjecNdS3mDQHhUm8iSQ6+G495+03AknZ?=
 =?us-ascii?Q?JfLRaH6ttkZ+1CBXV572vlGKA7v6hi97ILXUBzCk2OvfwmPRFiLKk7vO9mWM?=
 =?us-ascii?Q?VaBngXklI5ch9ZeFfalO49ilyau/sMJtqqbDfZ68W+03DzAKBLZApU7L4ibW?=
 =?us-ascii?Q?4jW35mKQJx+Nj3BGR/5X8GvBYYf+HNkiJqfB/FciZiU16uANa9kghAuLLsQr?=
 =?us-ascii?Q?WjRCUNVuJISNy7HigGLB/mtgnjmAysGUoK/wFhettVbZmS4I2hGer6EEVAQf?=
 =?us-ascii?Q?slLvSHcnptD8kjNcbtbU3S7eohNENigcpHQNiPTW8jIluPmLFGBkA3ikNa1A?=
 =?us-ascii?Q?AIIAx0qSiV1YfPbECcb10rZC4uYjHm81zi4OpTlhF5fRXafWI9MtfqK4xWsX?=
 =?us-ascii?Q?ejYMxGHGfkGLCCutePMvMwonVHUmeUbrBJ0+XdxfEZ3D/ZWqr4OmaIKf4ssy?=
 =?us-ascii?Q?b3go1yOVl/xqMwft4c7GXSlXc3c6cxyN6Xsok/PM1po618nP6PiJYQPHlvEd?=
 =?us-ascii?Q?9Oy54/EyDCO9coJZsueUVzNkFiU05jIP1MIhl2lJF49kjEv/2K5DzVGnif8L?=
 =?us-ascii?Q?AuEZNnQgK4Qf5zKPFb60otK9399VoL1rRxqDEu6yB9QkCO67ntv4XeS8a+kS?=
 =?us-ascii?Q?tmqe0VwG9RNLkw4VriEqA6mpOWCoZnpz2bE9JCvV9QY3jAbPtEYDmBnQ2zme?=
 =?us-ascii?Q?KrWGpn7gZ+PjdWW/ornSUP+w//eKOJ2cR8cpyDZ1mnHrmBg0orW4M76DwkXC?=
 =?us-ascii?Q?VgpZkQTBOF+mm1+xjEoZ1BQdmhSsN1w0XlPfyqHOYpiLyDUA2ZkZyIbgajo5?=
 =?us-ascii?Q?UBIuSW3qxuyXVG/bnvjTMWMPX353SKOvuKjcbLCVqj4TvUy+99N4uP6JP78h?=
 =?us-ascii?Q?hJUWtH8AVZIiqi1BrhAfgXVQMJgsEwpegbMrehj/xZ9QKT25F1Yqfrl6ZVnu?=
 =?us-ascii?Q?KRTA2BdCG69GTmt9rARcqQL6/GwTs8XMAvc5R6YGWYY5GPrkUSPBlG7uY/bS?=
 =?us-ascii?Q?fLdzfHiQ2rsfA/eVm3xiuaojCLZkf+v4R2ATQjXW9rAJZG29GsZGrdoux/lk?=
 =?us-ascii?Q?kbIL+RDlv90ro1hL6rmiZArxBDjgFcw9PtHtVyzQdbTXmZ/Ln7SU7WCPCEfQ?=
 =?us-ascii?Q?r+9bs6gvW19wgex9Wbx2lWWpaVoEso/zlcgM/x6idilnUrHKhFZrspmdYzrg?=
 =?us-ascii?Q?g/sqPxFPg5kWmGIs97j9IX7/44XDLc19itCJvYU5vpvbVIB7awwRoPFF7zf8?=
 =?us-ascii?Q?1IOWiKV3kJNFPDAFeZ90XAZRuu5sIha6kJhN0nE04/I2yQ0DC/dJWVKNhXCr?=
 =?us-ascii?Q?yQyYKsAleb99IShPYIbhhrdGr5tq8NvODXvem+hW5csexMVMi3rItybex3ZU?=
 =?us-ascii?Q?EQ4n49E8HrXcuPQ1LoEL3mHiwVcK4n5Poqt9yPs1pqr+JyLPWqMsKioerTYc?=
 =?us-ascii?Q?0anP/ekUl+PsPFrx0d/V0n80NdffiLSMEqtXD5KYhDXC0NdmWW0A2e7JHuSO?=
 =?us-ascii?Q?AJZN/KqgOnfSSLaMZx7YA5L98XU3D/eCW+Z4LYne09nXnteqhHGvrITLTkY3?=
 =?us-ascii?Q?wfBMM+X0fA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e27e2f-ab19-4f8d-0ca8-08df10888801
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:29.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkZYGNssOcDdqbqUiiK6hkl006Uzir+ukaLe+YMhxY//0Y370ptmfl+/v5UHmGwCHAwRq6IkwO+PeFzVnOteaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

A falcon has a set of interrupt causes, and it latches each one that is
raised in its IRQSTAT register. On a RISC-V falcon, each cause is routed
either to the host, meaning the CPU, or to the falcon's own RISC-V core,
and IRQSTAT holds the causes of both. Two more registers say which is
which: PRISCV_RISCV_IRQMASK holds the enabled causes, and
PRISCV_RISCV_IRQDEST holds the causes routed to the host. Open RM
intersects the three to get the causes that the host has to service,
and nova-core does the same.

A falcon signals the interrupt tree only when its set of host-routed
causes goes from empty to non-empty. A handler that clears the tree
leaf while a cause is still latched in the falcon leaves that set
non-empty, so no later cause produces a transition, and the falcon's
interrupts stop arriving. INTR_RETRIGGER makes the falcon re-emit its
host-routed causes into the tree, which supplies the missing
transition. Turing falcons do not implement it.

IRQSCLR clears a cause's latch, but it cannot end the source behind the
cause. A cause driven from outside the falcon, such as a fault
containment or ECC error on Blackwell, stays set through the write.

Add the four registers: IRQSTAT, INTR_RETRIGGER, and the two routing
registers. Record the IRQSCLR limit on its existing definition. The
routing registers go in per-chip modules, because their offsets move at
GA102 rather than at the Turing-to-Ampere boundary.

Add a HAL for the two properties that follow, the retrigger register
and the routing offsets, which split the chipsets three ways:

* Turing falcons have no retrigger register.

* GA100 has the retrigger register, and keeps the Turing routing
  offsets.

* GA102 and later have the retrigger register, and their routing
  registers moved.

Keep this HAL apart from the falcon boot HAL. The boot HAL is generic
over the falcon's engine type, so obtaining one is a heap allocation,
and the interrupt handler that needs these two properties runs in hard
interrupt context, where it cannot allocate.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       | 80 ++++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 21 +++++-
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 36 +++++++++-
 drivers/gpu/nova-core/regs.rs             | 69 +++++++++++++++++++
 4 files changed, 202 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7e532889a1f4..052610c4a4da 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -1,17 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    io::{
+        Io,
+        Mmio, //
+    },
+    prelude::*, //
+};
 
 use crate::{
     falcon::{
         Falcon,
         FalconBromParams,
-        FalconEngine, //
+        FalconEngine,
+        PFalcon2Registers, //
     },
     gpu::{
         Architecture,
         Chipset, //
     },
+    regs,
 };
 
 mod ga102;
@@ -72,6 +80,74 @@ fn signature_reg_fuse_version(
     fn load_method(&self) -> LoadMethod;
 }
 
+/// Offsets of a falcon's RISC-V interrupt routing registers.
+#[derive(Clone, Copy, Debug, Eq, PartialEq)]
+#[expect(dead_code)]
+pub(crate) enum RiscvRouting {
+    /// The Turing offsets. GA100 uses them too.
+    Tu102,
+
+    /// The offsets from GA102 on.
+    Ga102,
+}
+
+impl RiscvRouting {
+    /// Returns the causes in `latched` that are routed to the host, meaning the CPU, rather than
+    /// to the falcon's own RISC-V core.
+    ///
+    /// The causes routed to the core belong to the firmware running on it, and the host does not
+    /// service them.
+    #[expect(dead_code)]
+    pub(crate) fn host_routed_causes(
+        self,
+        pfalcon2: Mmio<'_, PFalcon2Registers>,
+        latched: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let (mask, dest) = match self {
+            Self::Tu102 => (
+                pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK).value(),
+                pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQDEST).value(),
+            ),
+            Self::Ga102 => (
+                pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK).value(),
+                pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQDEST).value(),
+            ),
+        };
+
+        regs::NV_PFALCON_FALCON_IRQSTAT::from(latched.into_raw() & mask & dest)
+    }
+}
+
+/// Interrupt properties of a falcon that differ by GPU family.
+///
+/// Separate from [`FalconHal`] because the GSP event handler calls these from hard interrupt
+/// context, where it cannot make the heap allocation that a `FalconHal` takes.
+#[expect(dead_code)]
+pub(crate) trait FalconIntrHal {
+    /// Returns whether these falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+    fn has_intr_retrigger(&self) -> bool;
+
+    /// Returns the offsets of `PRISCV_RISCV_IRQMASK` and `PRISCV_RISCV_IRQDEST`.
+    fn riscv_routing(&self) -> RiscvRouting;
+}
+
+/// Returns the [`FalconIntrHal`] for `chipset`.
+///
+/// GA100 has its own arm: it has the retrigger register, which Turing lacks, and the Turing
+/// routing offsets, which GA102 moved.
+#[expect(dead_code)]
+pub(crate) fn falcon_intr_hal(chipset: Chipset) -> &'static dyn FalconIntrHal {
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_INTR_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => tu102::GA100_INTR_HAL,
+        Architecture::Ampere
+        | Architecture::Ada
+        | Architecture::Hopper
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => ga102::GA102_INTR_HAL,
+    }
+}
+
 /// Returns a boxed falcon HAL adequate for `chipset`.
 ///
 /// We use a heap-allocated trait object instead of a statically defined one because the
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index f9a8444cf840..ff97983f22fe 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -28,7 +28,11 @@
     regs,
 };
 
-use super::FalconHal;
+use super::{
+    FalconHal,
+    FalconIntrHal,
+    RiscvRouting, //
+};
 
 fn select_core_ga102(pfalcon2: Mmio<'_, PFalcon2Registers>) -> Result {
     let bcr_ctrl = pfalcon2.read(regs::NV_PRISCV_RISCV_BCR_CTRL);
@@ -170,3 +174,18 @@ fn load_method(&self) -> LoadMethod {
         LoadMethod::Dma
     }
 }
+
+/// The falcon interrupt properties of GA102 and later.
+struct Ga102Intr;
+
+impl FalconIntrHal for Ga102Intr {
+    fn has_intr_retrigger(&self) -> bool {
+        true
+    }
+
+    fn riscv_routing(&self) -> RiscvRouting {
+        RiscvRouting::Ga102
+    }
+}
+
+pub(super) const GA102_INTR_HAL: &dyn FalconIntrHal = &Ga102Intr;
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 7fc6e83c2566..f79aa85e6a62 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -21,7 +21,11 @@
     regs, //
 };
 
-use super::FalconHal;
+use super::{
+    FalconHal,
+    FalconIntrHal,
+    RiscvRouting, //
+};
 
 pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
 
@@ -80,3 +84,33 @@ fn load_method(&self) -> LoadMethod {
         LoadMethod::Pio
     }
 }
+
+/// The falcon interrupt properties of Turing.
+struct Tu102Intr;
+
+impl FalconIntrHal for Tu102Intr {
+    fn has_intr_retrigger(&self) -> bool {
+        false
+    }
+
+    fn riscv_routing(&self) -> RiscvRouting {
+        RiscvRouting::Tu102
+    }
+}
+
+pub(super) const TU102_INTR_HAL: &dyn FalconIntrHal = &Tu102Intr;
+
+/// GA100's falcon interrupt properties: the Turing routing offsets and the retrigger register.
+struct Ga100Intr;
+
+impl FalconIntrHal for Ga100Intr {
+    fn has_intr_retrigger(&self) -> bool {
+        true
+    }
+
+    fn riscv_routing(&self) -> RiscvRouting {
+        RiscvRouting::Tu102
+    }
+}
+
+pub(super) const GA100_INTR_HAL: &dyn FalconIntrHal = &Ga100Intr;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 9978fb2803b0..c6ba226dcfe3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -124,11 +124,25 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 register! {
     base: PFalconRegisters;
 
+    /// Clears the latch of every cause whose bit is written as `1`. Write-only.
+    ///
+    /// The write ends the latch and not the source, so a cause driven from outside the falcon
+    /// stays set. "Retriggering a falcon" in `Documentation/gpu/nova/core/interrupts.rst` names
+    /// those causes.
     pub(crate) NV_PFALCON_FALCON_IRQSCLR(u32) @ 0x00000004 {
         6:6     swgen0 => bool;
         4:4     halt => bool;
     }
 
+    /// Interrupt causes latched in the falcon, one bit per cause, whichever target each is routed
+    /// to.
+    ///
+    /// The causes routed to the host are the ones also set in `NV_PRISCV_RISCV_IRQMASK` and
+    /// `NV_PRISCV_RISCV_IRQDEST`.
+    pub(crate) NV_PFALCON_FALCON_IRQSTAT(u32) @ 0x00000008 {
+        6:6     swgen0 => bool;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ 0x00000040 {
         31:0    value => u32;
     }
@@ -256,6 +270,16 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         0:0     reset => bool;
     }
 
+    /// Makes the falcon re-emit its host-routed causes into the interrupt tree. Write-only.
+    ///
+    /// Present from GA100 on. See "Retriggering a falcon" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    ///
+    /// The hardware headers declare two elements, and Open RM writes only the first.
+    pub(crate) NV_PFALCON_FALCON_INTR_RETRIGGER(u32)[2] @ 0x000003e8 {
+        0:0     trigger => bool;
+    }
+
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ 0x00000600 {
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
@@ -414,6 +438,29 @@ pub(crate) mod gm107 {
     }
 }
 
+pub(crate) mod tu102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Registers;
+
+    // The RISC-V interrupt routing registers, at the offsets that Turing and GA100 use.
+
+    register! {
+        base: PFalcon2Registers;
+
+        /// Enabled causes, one bit per cause. Read-only to the host.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ 0x000002b4 {
+            31:0    value => u32;
+        }
+
+        /// Causes routed to the host, one bit per cause. A clear bit routes the cause to the
+        /// RISC-V core.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ 0x000002b8 {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) mod ga100 {
     use kernel::io::register;
 
@@ -430,6 +477,28 @@ pub(crate) mod ga100 {
     }
 }
 
+pub(crate) mod ga102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Registers;
+
+    // The RISC-V interrupt routing registers, at the offsets that GA102 and later use.
+
+    register! {
+        base: PFalcon2Registers;
+
+        /// Same as [`super::tu102::NV_PRISCV_RISCV_IRQMASK`], at the GA102 offset.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ 0x00000528 {
+            31:0    value => u32;
+        }
+
+        /// Same as [`super::tu102::NV_PRISCV_RISCV_IRQDEST`], at the GA102 offset.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ 0x0000052c {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) const NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS: u32 = 0xff;
 
 pub(crate) mod gh100 {
-- 
2.55.0

