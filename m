Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE102E03EA
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363793; cv=fail; b=YYk+cnDHI6A5zwGQsVUlD0lu7379XeL3KZPmmR4Cu1b+eGpWlz9OBFskFP77MGm+RhsVZIszdbyc9EgpRkn1suPccY/uIcietY0vRrtr8SjPbpGpQOnGgUeV8z2dG9njGsyJ4BxBZrfXNr10vdHd88ieJNHgCXauHdpiqK5I1f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363793; c=relaxed/simple;
	bh=GmXBkENnWlaxFxjKtsupAUYYzoIYd5z+WFSitxVISEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R7UuZM7Z2hpRN8T2GMKZlVK3M/qNTB3NVgiOvP4rXGXqNvZTPpRsV2PtTczNjSqHs74U4B31ro46tByUv04DbzfR4vLTW0dhwG6JY9M+9B0Urwg+09KhzoMqeYIeciyBQL1f+2rVgfFsDOcIHVrklS/R1mpiQaAAI2lLem7XOkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dVXn3IcI; arc=fail smtp.client-ip=52.101.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dVXn3IcI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4cB6NKtGwawnEjYRIFFXIM3zC+xn2ZiLe9EYYTpG0Bd7EwMN3LlFFn2HJnU7bSvFKcdf5TnUZpwlUlgXxnyavIOxX9sm/3i2dyc+0VC5hZKcAiPv+BpdH7+n6fCTDQ0+7qQsD2vjDreId6JdYG8pNQ1xO9TzGeMEeS1JjqgFc2tSwt7VFkNyuB3xFwup5rYPVr/RDkCs7KQsZU4RnkW1f55QMVhXumv5mu8MyvCaPvdsOFvZm05CuN4d8ztBlAhkvE8XxuOK1TRkbfpUMHBTmL1msEmjcaVAFzAA1F1Sm9ZKes7kwddcPNaSnuCtg9C55ut5JlDiASFMCC/KoJXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7y1bw2mLN9uz+UL2N9YbhHqlRcEYiDdy6pQupMYcik=;
 b=Ps/hRAgMYqWkREag/IgS8i2rY3rn/0/oUpZ+GdtVQaNzb/s6yy/BkrZmgXsKwUPBc36tuYPQMoz+XEuYeMnwr3pVhPcgpfS/VQHw55gz7sMgooflMAGuD1r+8rrHluJCkFJe7qVDkczA05rUUs49mT34pr6xNXUrbyQ9DEb3KcQ8HXh6nMQ2n2dCnlF+Uxf0sGozsBZPkEHJTiWw+3vrJAmuvx4r+BhwrQQgIkwfzEQO+8Lvntt2eNpNuZ43hIXid38YnjSFJA8MnvLHawnl7B+1/Z1VzPou44+vx+6pVbOOhlqjsMpIm5rfO6IFshEVJiBNppzkLcULjohc2jV+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7y1bw2mLN9uz+UL2N9YbhHqlRcEYiDdy6pQupMYcik=;
 b=dVXn3IcIIxKOr6bv8q2VBtPK8MjzY0Pj12sf30i1crF/WuxXR7eyDF+k4aBhoQ+UAZRxAlGAi/x3+7ndlOZjLqGoPXM1Ct6pCQPg3bgBizfDVAeHoSfganIUJmhpQPpYmTgIS/UG6z8AKxlTf3wqVPYepSA0pXFsTQ/R6brT+PGG1h+fMjdjfS0n7aZKQsKufVk3VJNfbyY8QJkWwHyuxl3bAsPxV32wQmdoWXtraD7Y5qQ7xveGXZuBywaaYzkqVH6udgMTGpVam1sMpyE2jmbRgLwME7hoakfHHaEwGYzPVfvYswWK8LsEbT5yjiImUyM7/gzNVSQGCmPSTHZzzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:24 +0000
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
Subject: [PATCH v2 28/31] gpu: nova-core: gsp: remove the RPCs that GSP_INIT replaced
Date: Fri, 21 Aug 2026 18:54:45 -0700
Message-ID: <20260822015448.238214-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f9c314-bc7b-4736-56d9-08defff091ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DN9exRdVfZBC1AVJ2zOZTExZWu9uRfe39O+5pw+MeXovRDqy/34ixb2EDNbOMMx+GbLRJRADe6Qg8tqXyz7DfqnBV0xgvSzexZTLJgW5EeahXokiVo8tgLC4ly5FisQX4Vcs38tlR9zhyH6T+oYbdbuRUGL+fGrZQY8/p1PMtSZvKKSijdOxhGPUb8n4FIX14yAEKWMgFdc+m0+3uH4J7yQbmVakPuFwA7fFY0b5LT91Nd+xy1lnpjRW5v2reJh8bFH0EJ+sWIdZn2ILPSMhKuOoCbjZwNNSAdRk7k2ELh91sJ+fPBU436IgzGaUi4kp+zQuN/jBpePaABDyV+zrfN1nmH0XJ1oC9sWGRpzu6REnME6/SrB0TIMZ9TGXjkSwx1rCHwZAh8fvLo4Unhy0gTn/fltexpB0sxU4ZullHkUgtY9YSGYZIx/wvUPe4da60dCEXoak8RMz2/4okqHcJ05/uh3PJr0cUblkEBn5joIO0BjQOEFgtbFRtxS4etvaivONzRecyPQQZMrzLjAXUtkYjFLiESQHUNgY432ud03siccp+aHVWe4sXVro7X8T9UQ6VDZ66sZIYntxRwwm8fVZym6zcBPiZByoFFFLIYZyDeSv0oiI+XLMYLBkfCL5UxHhFnB9n0sGsttdrhZk8naWNAn/Hewm4kwGpEk+eiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W322tbN6BUiWtapd1LyzMWR4fHme6vGhQpda9ae6R3RJIMpRleHyTutDUMf9?=
 =?us-ascii?Q?Kop+Ew9HiRc5MIBofV01Ybr2PV4m8pCZzCTHGoN16v8ckdKKDfwOEg/twMH+?=
 =?us-ascii?Q?H89SkbilJSqsjJInkla+01bofQA/CRd9OTgWRuNrPLwMLKti2ZC71enf9o7J?=
 =?us-ascii?Q?C7uNjTy/g8g4cYF2aHUi0IrOVrvVheFMi3YgEzS0aqa31qhqxoON4UBMiDVx?=
 =?us-ascii?Q?pLjdsDqiMpb0VbVd1M+Irm2FAFgdk2kP31JcwpOdX4XJFnq4Y8UjMSVitm0G?=
 =?us-ascii?Q?AuKfER8nqYxX9G/aS/ozKl1/pSrMsr1oYGlRtq4rvOI4A70lzwZRsYJIRa+h?=
 =?us-ascii?Q?1yJ7y78ddw6hDUniKL6m4ffLSAUFdSWvnxj+fIZPR89vgrUheLFylLVkZAsN?=
 =?us-ascii?Q?sbeDZsiLNHT8ojoKKv4YAUTwOi/DtnrEmKihAVPkd9qc8Tq5rAP9lu77DVzk?=
 =?us-ascii?Q?5isyvZZhPVT8yNx1FQ74XAOvOTn3VXbM5gNzNNIt4Uzx9tmUzqNlWPA3zN23?=
 =?us-ascii?Q?3V1S1QmKSg98a2RbipFloYkKcjG3e/GiP7Er4gvcFA1IpooU+fkmhUma/owM?=
 =?us-ascii?Q?nz/nHjnUTD450YqDsSg15VP7I9S3bQvy0EewwQSozyBhmY1/WXIDYhiHy1u0?=
 =?us-ascii?Q?LZBl4GILvGJKMZCWTgX0O8SU3fkNrR6FJmcDnM6kE5UACW8ZiE0A5YvCvY0X?=
 =?us-ascii?Q?EUI6tVRf/1/LFFZ4BOkG7D/8UGVoNfmCCSJS7yp3UEIvwvB6mZ6T8i2r11qz?=
 =?us-ascii?Q?oPv4KGqlyVlIu4HYDGA4MIvAyXra98oK2uaIvJFoWOoBdkiPVcvDfUMCb0mz?=
 =?us-ascii?Q?qtQ10e5A8qEyG7Q5uWBbjJfup9W6AnOcxXAAsDpgJCUKLo/l3Agobx5KKhzl?=
 =?us-ascii?Q?40nyoY283ixObBaQMVxBz5EOZjC6O5rbgvCtnUBo16akuXtXpD0Wcrw3CcFE?=
 =?us-ascii?Q?loSmUj2GcclMUWBwJUMA+EzIi/viNG/WhY97wUlTMGcrRjwkLcXu0xkrIl8W?=
 =?us-ascii?Q?pRcW0iozH6DyBdUxLAPlaQoxeeqG/TkTNv1yLk2w80e9gkXhdGquM5/Z+vfU?=
 =?us-ascii?Q?4EApUTmAEUhb7KOE769ao5WgBGtSeZImQGu9Nd31clrzqK0h7CilKeWuBKv3?=
 =?us-ascii?Q?1WuDFJ+2yvLTRFVLDKrh/m++bpVU1eEIprETfbuLZmPhHsDX3WPX1oF7s8Hw?=
 =?us-ascii?Q?wJOIQ/GFDQvBkL+TJvFqC5XXOwlSgFeshpdKTiWUzgVY8sWs2ddxV/meUOTh?=
 =?us-ascii?Q?nRXB7h4PI/oSNE7oGliPrR3q4XO629SUgZ7hVAAOFPXMzL4zc9ytIyO+X3P9?=
 =?us-ascii?Q?0yhIoqDn1iTV7KBDDZ+miCxpmzYbeOhI4RqFzzxLXkrZtZlvNRabXxb8528q?=
 =?us-ascii?Q?QXFCXBiuQs5b1bMQ5iZ57AY6H0mtA5Syg5yLOmIHqLkSSnxb6bx4F4MIGHdV?=
 =?us-ascii?Q?aj0Z4LIAL0rHtzocWMtD8PKakq7J2HSWdwQElusbrzbh8zMJ/CQxC8bSGJ+X?=
 =?us-ascii?Q?KbGVAuZNoQKlV1Kb9mdQ8/LL9mUJnGl3ccilP6KvB61koI9ky4MI5412u+nT?=
 =?us-ascii?Q?3kmKIIdJ2NI6sxcDPR9tFs2Q8nh2yu/y5bZ+ZuJAArxWf7yYFpC9cvUhoKLU?=
 =?us-ascii?Q?ECohiAFU1cnYGhjAkb2iaiMTx+akVkIgh4i3uQfQQ9k2uidgZlcquJ/r+qye?=
 =?us-ascii?Q?TmXlgTTwT26MZ2ZVigoTSbruBb71pxxuF1Mexb3xgk8pVFybeaE3NsIHaDmz?=
 =?us-ascii?Q?iA3SBS4Bnw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f9c314-bc7b-4736-56d9-08defff091ec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:24.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg/LzOrZDPDfABtyyTH5L5VLACYpRUGNCJhj7xTtRefag7aC62utsvqktSLiPXAX/Kb6Id1AiR+4ET0yDehNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 boot path folds the system information, the registry keys and
the static GPU configuration into the GSP_INIT request, whose reply
carries that configuration back to the driver.

The set-system-info, set-registry and get-static-info commands stayed
behind after the switch, unreachable and marked dead, along with the
payload structures that encoded them.

Remove the three commands and their payloads, and keep the decoded
static configuration that the GSP_INIT reply fills in. Drop the
generated bindings they were the only users of. The message-function
entries stay, because that table catalogs the wire protocol rather than
what the driver implements, and already names many functions nova-core
never sends.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                  |   8 -
 drivers/gpu/nova-core/gsp/commands.rs         | 178 +--------
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 164 +-------
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 351 ------------------
 4 files changed, 3 insertions(+), 698 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a8262b3b7192..700842240c22 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -398,14 +398,6 @@ pub(crate) fn new(
         })
     }
 
-    /// Query the GSP for the static GPU information.
-    ///
-    /// The r000 boot path gets the same information from the `GSP_INIT` reply instead.
-    #[expect(dead_code)]
-    pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
-        self.cmdq.send_command(bar, commands::GetGspStaticInfo)
-    }
-
     /// Returns a shared handle to the GSP command queue.
     pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
         self.cmdq.clone()
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 26ea07dc4a28..67dbe5848bca 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -24,7 +24,6 @@
             Cmdq,
             CommandToGsp,
             MessageFromGsp,
-            NoReply,
             QueuePointers, //
         },
         fw::{
@@ -49,185 +48,13 @@
     vgpu::VgpuState, //
 };
 
-/// The `GspSetSystemInfo` command.
-///
-/// The r000 boot path folds this into the `GSP_INIT` payload instead.
-pub(crate) struct SetSystemInfo<'a> {
-    pdev: &'a pci::Device<device::Bound>,
-    chipset: Chipset,
-}
-
-#[expect(dead_code)]
-impl<'a> SetSystemInfo<'a> {
-    /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
-        Self { pdev, chipset }
-    }
-}
-
-impl<'a> CommandToGsp for SetSystemInfo<'a> {
-    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
-    const IS_ASYNC: bool = true;
-    type Command = fw::commands::GspSetSystemInfo;
-    type Reply = NoReply;
-    type InitError = Error;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev, self.chipset)
-    }
-}
-
-struct RegistryEntry {
-    key: &'static str,
-    value: u32,
-}
-
-/// The `SetRegistry` command.
-///
-/// The r000 boot path folds this into the `GSP_INIT` payload instead.
-pub(crate) struct SetRegistry {
-    entries: KVec<RegistryEntry>,
-}
-
-#[expect(dead_code)]
-impl SetRegistry {
-    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
-        let mut entries = KVec::new();
-
-        // RMSecBusResetEnable - enables PCI secondary bus reset
-        entries.push(
-            RegistryEntry {
-                key: "RMSecBusResetEnable",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
-        // any PCI reset.
-        entries.push(
-            RegistryEntry {
-                key: "RMForcePcieConfigSave",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
-        // in the internal product name database.
-        entries.push(
-            RegistryEntry {
-                key: "RMDevidCheckIgnore",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
-            // RMSetSriovMode - required when vGPU is enabled.
-            entries.push(
-                RegistryEntry {
-                    key: "RMSetSriovMode",
-                    value: 1,
-                },
-                GFP_KERNEL,
-            )?;
-        }
-
-        Ok(Self { entries })
-    }
-}
-
-impl CommandToGsp for SetRegistry {
-    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
-    const IS_ASYNC: bool = true;
-    type Command = fw::commands::PackedRegistryTable;
-    type Reply = NoReply;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.entries.len() as u32, self.size() as u32)
-    }
-
-    fn variable_payload_len(&self) -> usize {
-        let mut key_size = 0;
-        for entry in self.entries.iter() {
-            key_size += entry.key.len() + 1; // +1 for NULL terminator
-        }
-        self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>() + key_size
-    }
-
-    fn init_variable_payload(
-        &self,
-        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
-    ) -> Result {
-        let string_data_start_offset = size_of::<Self::Command>()
-            + self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>();
-
-        // Array for string data.
-        let mut string_data = KVec::new();
-
-        for entry in self.entries.iter() {
-            dst.write_all(
-                fw::commands::PackedRegistryEntry::new(
-                    (string_data_start_offset + string_data.len()) as u32,
-                    entry.value,
-                )
-                .as_bytes(),
-            )?;
-
-            let key_bytes = entry.key.as_bytes();
-            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
-            string_data.push(0, GFP_KERNEL)?;
-        }
-
-        dst.write_all(string_data.as_slice())
-    }
-}
-
-/// The `GetGspStaticInfo` command.
-pub(crate) struct GetGspStaticInfo;
-
-impl CommandToGsp for GetGspStaticInfo {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Command = fw::commands::GspStaticConfigInfo;
-    type Reply = GetGspStaticInfoReply;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init_zeroed()
-    }
-}
-
-/// The reply from the GSP to the [`GetGspStaticInfo`] command.
+/// The static GPU configuration, as decoded from the `GSP_INIT` reply.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
     /// Usable FB (VRAM) regions for driver memory allocation.
     pub(crate) usable_fb_regions: KVec<Range<u64>>,
 }
 
-impl MessageFromGsp for GetGspStaticInfoReply {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Message = fw::commands::GspStaticConfigInfo;
-    type InitError = Error;
-
-    fn read(
-        msg: &Self::Message,
-        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        let mut usable_fb_regions = KVec::new();
-        for region in msg.usable_fb_regions() {
-            usable_fb_regions.push(region, GFP_KERNEL)?;
-        }
-
-        Ok(GetGspStaticInfoReply {
-            gpu_name: msg.gpu_name_str(),
-            usable_fb_regions,
-        })
-    }
-}
-
 /// Error type for [`GetGspStaticInfoReply::gpu_name`].
 #[derive(Debug)]
 pub(crate) enum GpuNameError {
@@ -258,9 +85,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 /// `RMSecBusResetEnable` enables PCI secondary bus reset. `RMForcePcieConfigSave` makes GSP-RM
 /// preserve PCI configuration registers across any PCI reset. `RMDevidCheckIgnore` lets GSP-RM
 /// boot when the PCI device id is absent from its product name database.
-///
-/// [`SetRegistry::new`] carries the same entries for the RPC path, where the names have no
-/// terminator because that encoding appends one.
 const REGISTRY_ENTRIES: &[(&[u8], u32)] = &[
     (b"RMSecBusResetEnable\0", 1),
     (b"RMForcePcieConfigSave\0", 1),
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index f41b626ad6d1..a37acb419a7f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -14,11 +14,7 @@
     }, //
 };
 
-use crate::{
-    gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
-};
+use crate::gpu::Chipset;
 
 use crate::gsp::nvkv::{
     nvkv_decode,
@@ -37,159 +33,6 @@
 
 use super::bindings;
 
-/// Payload of the `GspSetSystemInfo` command.
-#[repr(transparent)]
-pub(crate) struct GspSetSystemInfo {
-    inner: bindings::GspSystemInfo,
-}
-static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
-
-impl GspSetSystemInfo {
-    /// Returns an in-place initializer for the `GspSetSystemInfo` command.
-    pub(crate) fn init<'a>(
-        dev: &'a pci::Device<device::Bound>,
-        chipset: Chipset,
-    ) -> impl Init<Self, Error> + 'a {
-        type InnerGspSystemInfo = bindings::GspSystemInfo;
-        let pci_config_mirror_range = chipset.pci_config_mirror_range();
-        let init_inner = try_init!(InnerGspSystemInfo {
-            gpuPhysAddr: dev.resource_start(0)?,
-            gpuPhysFbAddr: dev.resource_start(1)?,
-            gpuPhysInstAddr: dev.resource_start(3)?,
-            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
-
-            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
-            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
-            maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: pci_config_mirror_range.start,
-            pciConfigMirrorSize: pci_config_mirror_range.end - pci_config_mirror_range.start,
-
-            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
-                | u32::from(dev.subsystem_vendor_id()),
-            PCIRevisionID: u32::from(dev.revision_id()),
-            bIsPrimary: 0,
-            bPreserveVideoMemoryAllocations: 0,
-            ..Zeroable::init_zeroed()
-        });
-
-        try_init!(GspSetSystemInfo {
-            inner <- init_inner,
-        })
-    }
-}
-
-// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl AsBytes for GspSetSystemInfo {}
-
-// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl FromBytes for GspSetSystemInfo {}
-
-#[repr(transparent)]
-pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
-
-impl PackedRegistryEntry {
-    pub(crate) fn new(offset: u32, value: u32) -> Self {
-        Self({
-            bindings::PACKED_REGISTRY_ENTRY {
-                nameOffset: offset,
-
-                // We only support DWORD types for now. Support for other types
-                // will come later if required.
-                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
-                __bindgen_padding_0: Default::default(),
-                data: value,
-                length: 0,
-            }
-        })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for PackedRegistryEntry {}
-
-/// Payload of the `SetRegistry` command.
-#[repr(transparent)]
-pub(crate) struct PackedRegistryTable {
-    inner: bindings::PACKED_REGISTRY_TABLE,
-}
-
-impl PackedRegistryTable {
-    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
-        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
-        let init_inner = init!(InnerPackedRegistryTable {
-            numEntries: num_entries,
-            size,
-            entries: Default::default()
-        });
-
-        init!(PackedRegistryTable { inner <- init_inner })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for PackedRegistryTable {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for PackedRegistryTable {}
-
-/// Payload of the `GetGspStaticInfo` command and message.
-#[repr(transparent)]
-#[derive(Zeroable)]
-pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
-
-impl GspStaticConfigInfo {
-    /// Returns a bytes array containing the (hopefully) zero-terminated name of this GPU.
-    pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
-        self.0.gpuNameString
-    }
-
-    /// Returns an iterator over valid FB regions from GSP firmware data.
-    fn fb_regions(
-        &self,
-    ) -> impl Iterator<Item = &bindings::NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO> {
-        let fb_info = &self.0.fbRegionInfoParams;
-        fb_info
-            .fbRegion
-            .iter()
-            .take(fb_info.numFBRegions.into_safe_cast())
-            .filter(|reg| reg.limit >= reg.base)
-    }
-
-    /// Iterates over usable FB regions from GSP firmware data.
-    ///
-    /// Each yielded region is a [`Range<u64>`] suitable for driver memory allocation.
-    /// Usable regions are those that satisfy all the following properties:
-    /// - Are not reserved for firmware internal use.
-    /// - Are not protected (hardware-enforced access restrictions).
-    /// - Support compression (can use GPU memory compression for bandwidth).
-    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
-    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
-        self.fb_regions().filter_map(|reg| {
-            // Filter: not reserved, not protected, supports compression and ISO.
-            if reg.reserved == 0
-                && reg.bProtected == 0
-                && reg.supportCompressed != 0
-                && reg.supportISO != 0
-            {
-                reg.limit.checked_add(1).map(|end| reg.base..end)
-            } else {
-                None
-            }
-        })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for GspStaticConfigInfo {}
-
 /// Power level requested to the [`UnloadingGuestDriver`] command.
 #[derive(Clone, Copy, Debug, PartialEq, Eq)]
 #[repr(u32)]
@@ -390,8 +233,6 @@ impl GspInitRequest {
     const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
 
     /// Describes `dev` to GSP-RM and asks it to apply `regkeys`.
-    ///
-    /// The same identifiers reach GSP-RM through [`GspSetSystemInfo::init`] on the RPC path.
     pub(crate) fn new(
         dev: &pci::Device<device::Bound>,
         chipset: Chipset,
@@ -468,8 +309,7 @@ pub(crate) fn gpu_name(&self) -> &[u8] {
     /// Iterates over the FB regions the driver may allocate from.
     ///
     /// A region qualifies when it is untagged, unprotected, and supports both compression and
-    /// isochronous access, which is the same set the RPC path selects from
-    /// [`GspStaticConfigInfo::usable_fb_regions`].
+    /// isochronous access.
     pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
         self.fb_regions.iter().filter_map(|region| {
             if region.limit >= region.base
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 90c31883b5f9..4861500b2747 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -90,7 +90,6 @@ impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
-pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -385,340 +384,6 @@ impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
-    pub totalVFs: u32_,
-    pub firstVfOffset: u32_,
-    pub vfFeatureMask: u32_,
-    pub __bindgen_padding_0: [u8; 4usize],
-    pub FirstVFBar0Address: u64_,
-    pub FirstVFBar1Address: u64_,
-    pub FirstVFBar2Address: u64_,
-    pub bar0Size: u64_,
-    pub bar1Size: u64_,
-    pub bar2Size: u64_,
-    pub b64bitBar0: u8_,
-    pub b64bitBar1: u8_,
-    pub b64bitBar2: u8_,
-    pub bSriovEnabled: u8_,
-    pub bSriovHeavyEnabled: u8_,
-    pub bEmulateVFBar0TlbInvalidationRegister: u8_,
-    pub bClientRmAllocatedCtxBuffer: u8_,
-    pub bNonPowerOf2ChannelCountSupported: u8_,
-    pub bVfResizableBAR1Supported: u8_,
-    pub __bindgen_padding_1: [u8; 7usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
-    pub BoardID: u32_,
-    pub chipSKU: [ffi::c_char; 9usize],
-    pub chipSKUMod: [ffi::c_char; 5usize],
-    pub __bindgen_padding_0: [u8; 2usize],
-    pub skuConfigVersion: u32_,
-    pub project: [ffi::c_char; 5usize],
-    pub projectSKU: [ffi::c_char; 5usize],
-    pub CDP: [ffi::c_char; 6usize],
-    pub projectSKUMod: [ffi::c_char; 2usize],
-    pub __bindgen_padding_1: [u8; 2usize],
-    pub businessCycle: u32_,
-}
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_NONE: NV2080_FB_REGION_TAG = 0;
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_CARVEOUT: NV2080_FB_REGION_TAG = 1;
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_CPU_RM_RESERVED: NV2080_FB_REGION_TAG = 2;
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_CPU_RM_RESERVED_HEAP: NV2080_FB_REGION_TAG = 3;
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_RM_RESERVED: NV2080_FB_REGION_TAG = 4;
-pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_RM_RESERVED_HEAP: NV2080_FB_REGION_TAG = 5;
-pub type NV2080_FB_REGION_TAG = ffi::c_uint;
-#[repr(C)]
-#[derive(Debug, Copy, Clone, MaybeZeroable)]
-pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
-    pub base: u64_,
-    pub limit: u64_,
-    pub reserved: u64_,
-    pub performance: u32_,
-    pub supportCompressed: u8_,
-    pub supportISO: u8_,
-    pub bProtected: u8_,
-    pub blackList: [u8_; 18usize],
-    pub __bindgen_padding_0: [u8; 3usize],
-    pub regionTag: NV2080_FB_REGION_TAG,
-}
-impl Default for NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
-    fn default() -> Self {
-        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
-        unsafe {
-            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
-            s.assume_init()
-        }
-    }
-}
-#[repr(C)]
-#[derive(Debug, Copy, Clone, MaybeZeroable)]
-pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
-    pub numFBRegions: u32_,
-    pub __bindgen_padding_0: [u8; 4usize],
-    pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
-}
-impl Default for NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
-    fn default() -> Self {
-        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
-        unsafe {
-            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
-            s.assume_init()
-        }
-    }
-}
-#[repr(C)]
-#[derive(Debug, Copy, Clone, MaybeZeroable)]
-pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
-    pub index: u32_,
-    pub flags: u32_,
-    pub length: u32_,
-    pub data: [u8_; 256usize],
-}
-impl Default for NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
-    fn default() -> Self {
-        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
-        unsafe {
-            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
-            s.assume_init()
-        }
-    }
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct DOD_METHOD_DATA {
-    pub status: u32_,
-    pub acpiIdListLen: u32_,
-    pub acpiIdList: [u32_; 16usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct JT_METHOD_DATA {
-    pub status: u32_,
-    pub jtCaps: u32_,
-    pub jtRevId: u16_,
-    pub bSBIOSCaps: u8_,
-    pub __bindgen_padding_0: u8,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct MUX_METHOD_DATA_ELEMENT {
-    pub acpiId: u32_,
-    pub mode: u32_,
-    pub status: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct MUX_METHOD_DATA {
-    pub tableLen: u32_,
-    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct CAPS_METHOD_DATA {
-    pub status: u32_,
-    pub optimusCaps: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct ACPI_METHOD_DATA {
-    pub bValid: u8_,
-    pub __bindgen_padding_0: [u8; 3usize],
-    pub dodMethodData: DOD_METHOD_DATA,
-    pub jtMethodData: JT_METHOD_DATA,
-    pub muxMethodData: MUX_METHOD_DATA,
-    pub capsMethodData: CAPS_METHOD_DATA,
-}
-pub type GspStaticConfigInfo = GspStaticConfigInfo_t;
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct BUSINFO {
-    pub deviceID: u16_,
-    pub vendorID: u16_,
-    pub subdeviceID: u16_,
-    pub subvendorID: u16_,
-    pub revisionID: u8_,
-    pub __bindgen_padding_0: u8,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct GSP_VF_INFO {
-    pub totalVFs: u32_,
-    pub firstVFOffset: u32_,
-    pub FirstVFBar0Address: u64_,
-    pub FirstVFBar1Address: u64_,
-    pub FirstVFBar2Address: u64_,
-    pub b64bitBar0: u8_,
-    pub b64bitBar1: u8_,
-    pub b64bitBar2: u8_,
-    pub __bindgen_padding_0: [u8; 5usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct GSP_PCIE_CONFIG_REG {
-    pub linkCap: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct EcidManufacturingInfo {
-    pub info: [u64_; 2usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct FW_WPR_LAYOUT_OFFSET {
-    pub nonWprHeapOffset: u64_,
-    pub frtsOffset: u64_,
-}
-#[repr(C)]
-#[derive(Debug, Copy, Clone, MaybeZeroable)]
-pub struct GspStaticConfigInfo_t {
-    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
-    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
-    pub __bindgen_padding_0: [u8; 4usize],
-    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
-    pub bPdiValid: u8_,
-    pub __bindgen_padding_1: [u8; 7usize],
-    pub pdi: u64_,
-    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
-    pub sriovMaxGfid: u32_,
-    pub engineCaps: [u32_; 3usize],
-    pub poisonFuseEnabled: u8_,
-    pub __bindgen_padding_2: [u8; 7usize],
-    pub fb_length: u64_,
-    pub gpuNameString: [u8_; 64usize],
-    pub gpuShortNameString: [u8_; 64usize],
-    pub bGpuInternalSku: u8_,
-    pub bIsQuadroGeneric: u8_,
-    pub bIsQuadroAd: u8_,
-    pub bIsNvidiaNvs: u8_,
-    pub bIsVgx: u8_,
-    pub bGeforceSmb: u8_,
-    pub bIsTitan: u8_,
-    pub bIsTesla: u8_,
-    pub bIsMobile: u8_,
-    pub bIsCmpSku: u8_,
-    pub bIsGc6Rtd3Allowed: u8_,
-    pub bIsGc8Rtd3Allowed: u8_,
-    pub bIsGcOffRtd3Allowed: u8_,
-    pub bIsGcoffLegacyAllowed: u8_,
-    pub bIsMigSupported: u8_,
-    pub __bindgen_padding_3: u8,
-    pub RTD3GC6TotalBoardPower: u16_,
-    pub RTD3GC6PerstDelay: u16_,
-    pub __bindgen_padding_4: [u8; 4usize],
-    pub bar1PdeBase: u64_,
-    pub bar2PdeBase: u64_,
-    pub bVbiosValid: u8_,
-    pub __bindgen_padding_5: [u8; 3usize],
-    pub vbiosSubVendor: u32_,
-    pub vbiosSubDevice: u32_,
-    pub vbiosRevision: u32_,
-    pub vbiosOemRevision: u32_,
-    pub bPageRetirementSupported: u8_,
-    pub bSplitVasBetweenServerClientRm: u8_,
-    pub bClRootportNeedsNosnoopWAR: u8_,
-    pub __bindgen_padding_6: u8,
-    pub hInternalClient: u32_,
-    pub hInternalDevice: u32_,
-    pub hInternalSubdevice: u32_,
-    pub bSelfHostedMode: u8_,
-    pub bAtsSupported: u8_,
-    pub bSysL2CacheCoherentMode: u8_,
-    pub bIsGpuUefi: u8_,
-    pub bIsEfiInit: u8_,
-    pub __bindgen_padding_7: [u8; 7usize],
-    pub ecidInfo: EcidManufacturingInfo,
-    pub fwWprLayoutOffset: FW_WPR_LAYOUT_OFFSET,
-    pub bBusResetRequired: u8_,
-    pub chipSubRev: u8_,
-    pub __bindgen_padding_8: [u8; 2usize],
-    pub emulationRev1: u32_,
-}
-impl Default for GspStaticConfigInfo_t {
-    fn default() -> Self {
-        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
-        unsafe {
-            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
-            s.assume_init()
-        }
-    }
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct GspSystemInfo {
-    pub gpuPhysAddr: u64_,
-    pub gpuPhysFbAddr: u64_,
-    pub gpuPhysInstAddr: u64_,
-    pub gpuPhysIoAddr: u64_,
-    pub nvDomainBusDeviceFunc: u64_,
-    pub simAccessBufPhysAddr: u64_,
-    pub notifyOpSharedSurfacePhysAddr: u64_,
-    pub pcieAtomicsOpMask: u64_,
-    pub consoleMemSize: u64_,
-    pub maxUserVa: u64_,
-    pub pciConfigMirrorBase: u32_,
-    pub pciConfigMirrorSize: u32_,
-    pub PCIDeviceID: u32_,
-    pub PCISubDeviceID: u32_,
-    pub PCIRevisionID: u32_,
-    pub pcieAtomicsCplDeviceCapMask: u32_,
-    pub oorArch: u8_,
-    pub bUnstableRpcs: u8_,
-    pub bUnstableEvents: u8_,
-    pub __bindgen_padding_0: [u8; 5usize],
-    pub clPdbProperties: u64_,
-    pub Chipset: u32_,
-    pub bGpuBehindBridge: u8_,
-    pub bFlrSupported: u8_,
-    pub b64bBar0Supported: u8_,
-    pub bMnocAvailable: u8_,
-    pub chipsetL1ssEnable: u32_,
-    pub bUpstreamL0sUnsupported: u8_,
-    pub bUpstreamL1Unsupported: u8_,
-    pub bUpstreamL1PorSupported: u8_,
-    pub bUpstreamL1PorMobileOnly: u8_,
-    pub bSystemHasMux: u8_,
-    pub upstreamAddressValid: u8_,
-    pub FHBBusInfo: BUSINFO,
-    pub chipsetIDInfo: BUSINFO,
-    pub __bindgen_padding_1: [u8; 2usize],
-    pub acpiMethodData: ACPI_METHOD_DATA,
-    pub hypervisorType: u32_,
-    pub virtualConfigBits: u16_,
-    pub bIsPassthru: u8_,
-    pub __bindgen_padding_2: [u8; 5usize],
-    pub sysTimerOffsetNs: u64_,
-    pub gspVFInfo: GSP_VF_INFO,
-    pub bIsPrimary: u8_,
-    pub bIsUnixHdmiFrlComplianceEnabled: u8_,
-    pub isGridBuild: u8_,
-    pub __bindgen_padding_3: u8,
-    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
-    pub gridBuildCsp: u32_,
-    pub bPreserveVideoMemoryAllocations: u8_,
-    pub bTdrEventSupported: u8_,
-    pub bFeatureStretchVblankCapable: u8_,
-    pub bEnableDynamicGranularityPageArrays: u8_,
-    pub bClockBoostSupported: u8_,
-    pub __bindgen_padding_4: [u8; 7usize],
-    pub hostPageSize: u64_,
-    pub bIsCmcBasedHws: u8_,
-    pub bGspNocatEnabled: u8_,
-    pub bS0ixSupport: u8_,
-    pub bWindowChannelAlwaysMapped: u8_,
-    pub pciePowerControlValue: u32_,
-    pub bPciePowerControlPresent: u8_,
-    pub __bindgen_padding_5: [u8; 3usize],
-    pub pf0DeviceControl2Reg: u32_,
-    pub bIsCxlDevice: u8_,
-    pub bReserveZeroFbAddressAsRegion: u8_,
-    pub __bindgen_padding_6: [u8; 6usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub flags: u64_,
     pub sharedMemPhysAddr: u64_,
@@ -953,22 +618,6 @@ pub struct LibosMemoryRegionInitArgument {
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
-pub struct PACKED_REGISTRY_ENTRY {
-    pub nameOffset: u32_,
-    pub type_: u8_,
-    pub __bindgen_padding_0: [u8; 3usize],
-    pub data: u32_,
-    pub length: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, MaybeZeroable)]
-pub struct PACKED_REGISTRY_TABLE {
-    pub size: u32_,
-    pub numEntries: u32_,
-    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct msgqTxHeader {
     pub versionMajor: u16_,
     pub versionMinor: u16_,
-- 
2.55.0

