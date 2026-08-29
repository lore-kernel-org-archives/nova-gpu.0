Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BF35E950
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967231; cv=fail; b=c1vB/g5hintTLYoMPTSzkQanMEmnKRVjZdCzHWBKEYWFrOua36dJZyKk4Pf1Z2ViumR798vAPIHUrA1mIZfb4q33fZTdEEgEuaRIHO3nEQoEMC9NmTEOsaXI0wRxjcGwHEYK1rbQOxYUVaQwqNVLwF/eKe9dnRriH0WTxUd6KGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967231; c=relaxed/simple;
	bh=J/dyCHhcrnzOF9fm/msHvuQss/wEPS0PbbH9oV0GBb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MREAb57IN6b1uG29z4kr9KdlfBHC04JVjvZ8IUy7qYsrAGMWNHyMJbXQYmKJ/j3IsPY3GsEXPUhCt7Lb+OeX8oq14nWBvf1D0TIdINB3kjNCP2gUBwfTxdleokUhwUEpq48HxoxHGmP2hJNgkxqL20kXjDmaAShIylzW2DdN0BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GRd1riTA; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GRd1riTA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIPlSnFyGLExKuLKOkQxgnKApVSJpRQjAuLjfDRB48I4c8BeHsw/ULuPjFkaAtFXhnEck6BatZnb4E3IowQBRFxTEnCm6mmNcB9+tjNqL4b8liW5hYXwO7N6B4WXJ8AmwbCJX+PqZEI05vDZ2njnYGDOxW4aR50UX63EdGEWIrGhPwmnl4PCTNhu6KWckV/Vc4kfQrYrgrMKy1lOwtTJikTs0pISqiU+Klu2qhyB5LUe0v9IlA840EGJ7lJCpQQfdzkDWhzpd8tM5LWOCF+TBkEMCjAvs7GTYENuOSGk0Kn0Kr8poO7p3SW31dlIpU/oi88+5Yt6NHGXDkKcTRUcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO3YohQa/XyioYZOC6vqqlO684thwv0yciMuSfUQXNs=;
 b=c3F7wg/gNHSG9m9nZV1yaaj4wmUogAgEgMGLdnQq9XOzv0YBGVUHfv066F1i2MGIqxneX+MS2I2IHzJCW3nt9XWnGDTePF7zhNA6RqwySNRwa9lVKjmQrAuINaQ20kAMR7MnASR+h17Y4LVec75nPpct/CoHPyXGcAYImfqQDWlR8lwuBXpTQSmYyhOGE2sG7bcsSfjZ2PDuN8xr/y3txLd+XgVYFimzriKKC1xj5GwAQKiM9xHh86PA8N25J+H+6qSl2mvRN3EyzCjZNj+QQPgsEYhpoM8DSDO/js/9BoYMRsQdcbxbz9dmLTVZ8zEJWMEb9JgO1WDnO1Q1zG6GEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO3YohQa/XyioYZOC6vqqlO684thwv0yciMuSfUQXNs=;
 b=GRd1riTA197aSPNzeOxt74ieo96QWNvtdpveaqPlTsGlWpwiu2pbqHki/EnNNrkhcTEj5S+OImF4eCMry/t7H1eVf9sji7OuCmsqV/wC3OG9p8BUEzjDgQ4CW0WpUI6yzf8zCD8Wd+AaM1lVvTMmZ23Rnh/fFNZb//sy7e6gXwsEV+YIZXUaddx4M4YXjoG1JVekBJZDyTLMn6Ln98r1R4l2fucc+z94Zscy09mg1E/0ZqH8j+SYGx6tklv3OuU6aIGQILVpPBBtYZYXTdUsuIWFg+QEHryE/YNAqAQ7gEgsfl2njYXTCoxWhADqGDJOW6zkf247Oxql3VtkJ3wQxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:38 +0000
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
Subject: [PATCH v2 12/15] gpu: nova-core: drive GSP events with the SWGEN0 interrupt
Date: Fri, 28 Aug 2026 18:33:31 -0700
Message-ID: <20260829013324.499542-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e9992-5072-44a5-36fa-08df056d8cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|7136999003|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	iknJIOHqGrpnRVXBjr1MlNCVDfnH1WAmCYPxIUVPwG8miubKj6dW9GZVGqbxP7InM/v+/br1sgH/wh49/bwCSkJYbeF7xjWJPSX5srzAPeayIDBkp7Uq5mM76gfVFZ6fkDNNnjsB54qHNHEaEVddLbS1F+Jh/xRDgQBb/3XrQAmyUo8lVUiqq2CnkRu0ZpEPq07yoii2//aDw9rRnLOKO7YwRaKXmqUNWvSZwHUI+0XKNSH4nzeD6NergS9UJb8cZNjYwYH7rRxd0TnKH89mNVTBR8uLZf/mYgc7qq46pyflR6KLa+Plwvif6E9b1OhQu8ffR1SaAgm5zveQ+OOMO6cgZ3hZpLEShjQmvuqPyH6LGGWwyl00HdYfwXlSy8DeY9wUdfzWVBDyqU6uewNmRvW/mUZKIu1qUei2t9DGYb6RWDY2BiHpE+wn5cC9Y+j4dVYhIciq1P/IVdRJN8mUGnjkv2Y1xOXbmogiFN1+vAnmDBwoPddA85KnhidLC+NB8PzdHkgXLD46T4tmE5AMLAPsnogzQCTP0JG5qQL60Ezvz7SF5DaqawCXVNjqV8McRdq6RqbnAr7k9RZuaIs0cLjNkdDpMvL08xzJmanIrrD3BUtONLKLOqrIXBOSJCRJKOiVe4WEFwxfb6TzAPcTaSDzblAwwvgjcMbp1Fedm8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(7136999003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YfUfroCCDMnHEigVqudpWnAgXJfTN13BYocw0kPfR1kZeMkSG1YIOTfuBIs8?=
 =?us-ascii?Q?mVimXsyki3yLK4ts+oVY/8DxaP1pmSrYWFt25kFztsZFGkp/Rd6Vnd/OD5EJ?=
 =?us-ascii?Q?yk4fU51c6XwBYWoMyLfTV+W/4Nqaxq0O63GqHJ6Ai7ul/iLHSyHy4SDp5sFd?=
 =?us-ascii?Q?nKF/+PHabDSEPdFR0/qbBuuH16XFb0mjHIwbIA8yA851avXzVuNbOmnED3fK?=
 =?us-ascii?Q?Odp89ex88Jcpo01zRZ2RgErwSgx3NzMCcS44c+Wv2wHV5qZpZKidqt7Kwrzw?=
 =?us-ascii?Q?pcRNGNQS44OxoC34RSazJgSDK2yqqGFw++EjIOSX5itKCtJErrawQkrmcMsA?=
 =?us-ascii?Q?PMSxyWAOy21JRXGaJOopp1BJxBx6HEa6GCBBBXSnLGvokeHmOV90gileoydJ?=
 =?us-ascii?Q?DOPRMCvCavr+qKvFRPPshew/fLuAWq0UPOrqw8QWD5SV5ZTEorKUSsIs2QFv?=
 =?us-ascii?Q?4fLy9ROuXRKagL13zb8wQB2+QJdY6TSlkIpaipeV3TNE5YmhZRy4YLCLNnJU?=
 =?us-ascii?Q?zwzEeGh7QEaQQ24IUAKEDyl+2uHN0YHDfrs1ZIx2Sq9yJ2RotgvxnXZN1VoS?=
 =?us-ascii?Q?CcClOZezDwCOzaSqP68G6E4MjKjSfrub9UfJMqEwdnJXAAwz6Jx1odbNNjvR?=
 =?us-ascii?Q?NDS95F71OzlcxXm4c+69u8H1CcL1wunFDNZfHP6eHjVkolnw6WJ00mQGjAnw?=
 =?us-ascii?Q?Qzes68LM9g9lyXhUbmrtEMWPNZ8jgSejE3JK/4999P+jhxYj72O2A7pQ8SwC?=
 =?us-ascii?Q?0WEX7ASPdvoD8+21c1AKvH5B97KNDIg/u9yLvLzUbE5ydjQFkmvdfCzV7Ebl?=
 =?us-ascii?Q?69ifeSHg2AywqIjQnq1SLnNAtvWoeGlubQUoZnYUdnd8IDR4+pEsXf5oJ3hq?=
 =?us-ascii?Q?Ah73oPwX8QfOzPbL9opXRcVXLU7iTdoc1AlBFnVoM1Trn5BNgZR5CGLqH5If?=
 =?us-ascii?Q?BepqKTlZ3Adz+YerWd+xOrjdfJkgYSTNg5jf+l6MRlZduBJFaqYeR8Xx1PKl?=
 =?us-ascii?Q?vfXCWWTSdjdly9gEcLKIoahKeKiaHUMHMHOT/gbzhTruYCtI09/SPSyoofXb?=
 =?us-ascii?Q?tXWKrbZwox4X8odGrcs2CDmaUsLebe7e1vZLdOnmvZsjk3sy0dkbSjjJQvDQ?=
 =?us-ascii?Q?aho3C9f3xhVm0d1vDbJ49+mJQQE6RHXSDcuXOsCxih6WZ43rvOojaks9/hpn?=
 =?us-ascii?Q?2rlxRxHxM5XikOUDar7WSV7u+N+JuwQuzhbTqEOixpPiEeDiFOAtFpfFwfZk?=
 =?us-ascii?Q?0MfO9aPMYZ+cdDnks9b94hq6HGoec/Jj8wMOBcfR50a2/VYPNqWByy4xoZdw?=
 =?us-ascii?Q?bEq3ilHMj7DFTkDi08oyPo/D3o+PhnxeLwH1stTMC3qxcTLKXBkFrLAaz+Mc?=
 =?us-ascii?Q?S39LR6gGkfvWRgQIBb0SHT4dUEroLdJ7/gcftlfYcKe2QcWskvgDJV/tgNO+?=
 =?us-ascii?Q?gjObzTkSGvWJGAFaShMCcapQy/ePmm941VRP3eth4LVQ6MIbvWGsdNQgtenz?=
 =?us-ascii?Q?rSZHTqpM/Zn2ev9KI/Qw/kP/21BEbXir9CGYt903QOViMZpWn4cxzHZ6LRvW?=
 =?us-ascii?Q?V50oXT6BVHeMezgNVvAaG06qadXegRQU1aT+AlfQDAm2DMqN2hm7K6RfRe4K?=
 =?us-ascii?Q?lsQG901z6c5HRE/OePMzcorKWkxS8n9JOURJVFCBoV2N/oriekQ98f4Sq/sG?=
 =?us-ascii?Q?vv4aKVGMrZfUQSolAGUVk0DKkTreJzaPMscN42kFOftNhM2fvjv3WLc8TyDd?=
 =?us-ascii?Q?jecvYteCrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e9992-5072-44a5-36fa-08df056d8cc7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:38.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTV10KgCK7Bacm4DuwO5WWNEPay3oISohsiPc45BVajjrPqlrEw3Ob7I3Xe+vXBfRWRCWZt1as34EA7Iz00Srg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

The GSP posts events, logs and error records to the GSP-to-CPU queue and
raises the falcon SWGEN0 output. GSP boot polls for its own
notifications, which leaves the latch set and pending bits in the tree.

nova-core drained the queue only while polling for a command reply, so
an event sat unread until the next command was sent.

Service the queue from a threaded handler on the GSP notification
vector. The top half runs in hard interrupt context and touches only
registers: it clears the GIN leaf, takes the falcon's SWGEN0 latch and
rearms PCI delivery. Draining the queue takes the command-queue mutex,
which can sleep, so the top half wakes the IRQ thread to do it.

Quiesce the tree, clear the latch and rearm PCI delivery before
registering the handler, so none of that boot state reaches it.
Pre-Hopper MSI rearms through a configuration-space write that the tree
drain does not perform, and an interrupt delivered before probe leaves
delivery un-armed.

Move the vector allocation out of the self-test and into probe, because
the vectors are allocated once for the whole PCI device rather than per
handler. The self-test and the GSP handler each take the vector for the
subtree they service.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs             |  55 ++++-
 drivers/gpu/nova-core/falcon/gsp.rs         |  35 +++-
 drivers/gpu/nova-core/gpu.rs                |  22 +-
 drivers/gpu/nova-core/gsp.rs                |  17 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           |  42 ++++
 drivers/gpu/nova-core/irq.rs                |   1 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  |  34 ++--
 drivers/gpu/nova-core/irq/gsp.rs            | 215 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   1 -
 drivers/gpu/nova-core/nova_core.rs          |   1 -
 drivers/gpu/nova-core/regs.rs               |   4 +
 11 files changed, 394 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5738d4ac521b..3b713d621bd1 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -18,18 +18,36 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::{
+    gpu::Gpu,
+    irq::{
+        gsp::GspIrq,
+        SubtreeVectors, //
+    },
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
+    /// GSP event interrupt registration.
+    ///
+    /// Declared first so it is dropped first: `free_irq` runs (waiting out any in-flight handler)
+    /// before the GSP is unloaded (`gpu`) or the BAR mapping is released (`bar`).
+    #[pin]
+    _gsp_irq: GspIrq<'bound>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
     #[allow(clippy::type_complexity)]
     _reg: auxiliary::Registration<'bound, ForLt!(())>,
+    /// Self-referential borrow of `vectors`, so this does not have to be repeated in the
+    /// constructor. Will go away with self-referential pin-init.
+    vectors_ref: &'bound SubtreeVectors<'bound>,
+    /// PCI interrupt vector allocation. Dropped last (struct field drop order).
+    #[pin]
+    vectors: SubtreeVectors<'bound>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -79,13 +97,42 @@ fn probe<'bound>(
             pdev.set_master();
 
             Ok(try_pin_init!(NovaCore {
+                vectors: crate::irq::alloc_vectors(pdev, crate::irq::gsp::GSP_SUBTREE.into())?,
+                // SAFETY: `vectors` is initialized above, lives at a pinned stable address, and
+                // is dropped after all fields that use `vectors_ref` (struct field drop order).
+                vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref().get_ref()) },
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
                 // SAFETY: `bar` is initialized before this expression is evaluated
-                // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
-                // stable address, and is dropped after `gpu` (struct field drop order).
-                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
+                // (`try_pin_init!()` initializes fields in the order they appear here), lives at a
+                // pinned stable address, and is dropped after `gpu` (struct field drop order).
+                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }, vectors_ref),
+                // Quiesce the interrupt tree before registering the handler below.
+                _: {
+                    // SAFETY: as for the `bar` borrow above.
+                    let bar = unsafe { &*core::ptr::from_ref(bar) };
+                    crate::irq::gsp::quiesce(bar, gpu.chipset(), vectors_ref.irq_type());
+                },
+                // Register the permanent GSP SWGEN0 handler, which enables the interrupt.
+                //
+                // SAFETY: `bar` and `vectors` are initialized and pinned (see above). `_gsp_irq`
+                // is declared before `vectors` in the struct, so it is dropped first, ensuring
+                // `free_irq` runs before the vectors are freed. The registration is stored in
+                // `NovaCore` and never leaked.
+                _gsp_irq <- unsafe {
+                    GspIrq::new(
+                        pdev,
+                        vectors_ref,
+                        &*core::ptr::from_ref(bar),
+                        gpu.cmdq(),
+                        gpu.chipset(),
+                    )
+                },
+                // Drain the messages the GSP posted during boot, before relying on the interrupt.
+                _: {
+                    gpu.cmdq().drain()?;
+                },
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index ae32f401aeb0..f9d9e8e0386b 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -14,6 +14,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     falcon::{
         Falcon,
         FalconEngine,
@@ -36,14 +37,40 @@ impl RegisterBase<PFalcon2Base> for Gsp {
 
 impl FalconEngine for Gsp {}
 
+impl Gsp {
+    /// Clears the GSP falcon SWGEN0 interrupt latch.
+    ///
+    /// The latch holds until it is cleared, and the GSP drives no new edge into the interrupt
+    /// tree while it is set, so a caller that consumed a notification by any means other than the
+    /// interrupt handler must clear it or no further notification is delivered.
+    pub(crate) fn clear_swgen0_intr(bar: Bar0<'_>) {
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true),
+        );
+    }
+
+    /// Reads the GSP falcon interrupt status, clearing the SWGEN0 latch if it was set.
+    ///
+    /// Returns the status as it was read, before the clear. The GSP raises SWGEN0 when it has
+    /// posted messages in the GSP-to-CPU queue. The interrupt tree routes every falcon cause to
+    /// a single vector, so the rest of the status identifies a cause other than a posted message.
+    pub(crate) fn take_swgen0_intr(bar: Bar0<'_>) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let status = bar.read(regs::NV_PFALCON_FALCON_IRQSTAT::of::<Self>());
+
+        if status.swgen0() {
+            Self::clear_swgen0_intr(bar);
+        }
+
+        status
+    }
+}
+
 impl<'a> Falcon<'a, Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self) {
-        self.bar.write(
-            WithBase::of::<Gsp>(),
-            regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true),
-        );
+        Gsp::clear_swgen0_intr(self.bar);
     }
 
     /// Checks if GSP reload/resume has completed during the boot process.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 589b4b210a22..932e39e012f0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,7 +10,8 @@
     num::Bounded,
     pci,
     prelude::*,
-    sizes::SizeConstants, //
+    sizes::SizeConstants,
+    sync::Arc, //
 };
 
 use crate::{
@@ -25,10 +26,12 @@
     fsp::Fsp,
     gsp::{
         self,
+        cmdq::Cmdq,
         commands::GetGspStaticInfoReply,
         Gsp,
         GspBootContext, //
     },
+    irq::SubtreeVectors,
     vgpu::VgpuManager, //
 };
 
@@ -323,12 +326,27 @@ fn drop(self: Pin<&mut Self>) {
 }
 
 impl<'gpu> Gpu<'gpu> {
+    /// Returns the chipset this GPU was identified as.
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.spec.chipset
+    }
+
+    /// Returns a shared handle to the GSP command queue.
+    pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
+        self.gsp_resources.gsp.cmdq()
+    }
+
     pub(crate) fn new(
         pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: Bar0<'gpu>,
+        vectors: &'gpu SubtreeVectors<'gpu>,
     ) -> impl PinInit<Self, Error> + 'gpu {
         let dev = pdev.as_ref();
 
+        // `vectors` exists for the interrupt self-test below, which this configuration omits.
+        #[cfg(not(CONFIG_NOVA_CORE_IRQ_SELFTEST))]
+        let _ = vectors;
+
         try_pin_init!(Self {
             spec: Spec::new(dev, bar).inspect(|spec| {
                 dev_info!(dev,"NVIDIA ({})\n", spec);
@@ -352,7 +370,7 @@ pub(crate) fn new(
             // never observes or clears GSP or PRIV_RING interrupts.
             _: {
                 #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
-                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
+                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset, vectors)?;
             },
 
             // Initialize this early because `gsp_resources` depends on it.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 13f361406a6c..43eec3f4f573 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -18,7 +18,8 @@
         Io, //
     },
     pci,
-    prelude::*, //
+    prelude::*,
+    sync::Arc, //
 };
 
 pub(crate) mod cmdq;
@@ -152,9 +153,8 @@ pub(crate) struct Gsp {
     /// Log buffers, optionally exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers>,
-    /// Command queue.
-    #[pin]
-    pub(crate) cmdq: Cmdq,
+    /// Command queue, shared with the GSP event interrupt handler.
+    pub(crate) cmdq: Arc<Cmdq>,
     /// RM arguments.
     rmargs: Coherent<GspArgumentsPadded>,
 }
@@ -173,8 +173,8 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
             // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
             Ok(try_pin_init!(Self {
-                cmdq <- Cmdq::new(dev),
-                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(&cmdq))?,
+                cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
+                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq.as_ref()))?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
                         dev,
@@ -220,6 +220,11 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
     pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
         self.cmdq.send_command(bar, commands::GetGspStaticInfo)
     }
+
+    /// Returns a shared handle to the GSP command queue.
+    pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
+        self.cmdq.clone()
+    }
 }
 
 /// Opaque bundle required to unload the GSP. Created by [`Gsp::boot`], consumed by [`Gsp::unload`].
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 76d51155c49f..ac3e6642031a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -647,6 +647,18 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
             }
         }
     }
+
+    /// Drains and dispatches every message currently pending in the GSP-to-CPU queue.
+    ///
+    /// Routes each message the GSP has already posted through [`CmdqInner::dispatch_event`] and
+    /// returns without waiting for more.
+    ///
+    /// # Errors
+    ///
+    /// Propagates a receive error, in particular the `EIO` of a queue poisoned by corrupt framing.
+    pub(crate) fn drain(&self) -> Result {
+        self.inner.lock().drain()
+    }
 }
 
 /// Inner mutex protected state of [`Cmdq`].
@@ -977,4 +989,34 @@ fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
             }
         }
     }
+
+    /// Drains and dispatches all messages currently pending in the GSP-to-CPU queue.
+    ///
+    /// Processes whatever the GSP has already posted, dispatching each message as an event, and
+    /// stops once the queue is empty. There is no awaited reply during a drain, so every message
+    /// is routed to [`Self::dispatch_event`].
+    ///
+    /// # Errors
+    ///
+    /// Returns the receive error that stopped the drain, in particular the `EIO` of a queue
+    /// poisoned by corrupt framing (see [`Self::wait_for_msg`]).
+    fn drain(&mut self) -> Result {
+        while !self.gsp_mem.driver_read_area().0.is_empty() {
+            // A message is available, so this returns without waiting.
+            let msg = self.wait_for_msg(Delta::ZERO)?;
+
+            let pages =
+                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
+                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
+                    EIO
+                })?;
+            let function = msg.header.function();
+            let seq = msg.header.sequence();
+
+            self.gsp_mem.advance_cpu_read_ptr(pages);
+            self.dispatch_event(function, seq);
+        }
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 37dea5abf833..cced226a7582 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -10,6 +10,7 @@
 
 #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
 pub(crate) mod doorbell_test;
+pub(crate) mod gsp;
 mod hal;
 mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
index 3fd8b26e135e..c9712fa1bd18 100644
--- a/drivers/gpu/nova-core/irq/doorbell_test.rs
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -28,13 +28,16 @@
     time, //
 };
 
-use super::interrupt_tree::{
-    GinVector,
-    LeafEnableGuard,
-    LeafMask,
-    Subtree,
-    TopEnableGuard,
-    Tree, //
+use super::{
+    interrupt_tree::{
+        GinVector,
+        LeafEnableGuard,
+        LeafMask,
+        Subtree,
+        TopEnableGuard,
+        Tree, //
+    },
+    SubtreeVectors, //
 };
 use crate::{
     driver::Bar0,
@@ -49,8 +52,8 @@
 
 /// Subtree carrying the doorbell vector, and the only subtree this test services.
 ///
-/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the allocation, the subtree it
-/// enables, and the handler together.
+/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the subtree it enables and the
+/// handler together.
 const DOORBELL_SUBTREE: Subtree = DOORBELL_VECTOR.subtree();
 
 /// Time allowed for each of the two deliveries to arrive.
@@ -153,17 +156,18 @@ fn quiesce_source(&self) {
 ///
 /// # Errors
 ///
-/// `EIO` if the doorbell is already pending before the test, if the delivery count is not two, if
-/// the doorbell bit is still set once the source is stopped, or if either delivery found a pending
-/// bit other than the doorbell. `ETIMEDOUT` if either delivery does not arrive within the timeout.
+/// `EINVAL` if the doorbell's subtree is not one nova-core services. `EIO` if the doorbell is
+/// already pending before the test, if the delivery count is not two, if the doorbell bit is still
+/// set once the source is stopped, or if either delivery found a pending bit other than the
+/// doorbell. `ETIMEDOUT` if either delivery does not arrive within the timeout.
 pub(crate) fn run_selftest<'a>(
     pdev: &'a pci::Device<Bound>,
     bar: Bar0<'a>,
     chipset: Chipset,
+    vectors: &'a SubtreeVectors<'a>,
 ) -> Result {
-    // The allocated interrupt type decides how the handler rearms delivery, so the vectors are
-    // allocated before the tree is built.
-    let vectors = super::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?;
+    // The interrupt type decides how the handler rearms delivery, so the tree takes it from
+    // probe's allocation.
     let request = vectors.request_for(DOORBELL_SUBTREE)?;
     let irq_type = vectors.irq_type();
     let tree = Tree::new(bar, chipset, irq_type, DOORBELL_SUBTREE.into());
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
new file mode 100644
index 000000000000..6366380eef98
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP event (SWGEN0) interrupt handling.
+//!
+//! The GSP firmware raises SWGEN0 when it has posted messages in the GSP-to-CPU queue. That
+//! signal reaches the CPU as a PCI interrupt through the GIN tree. This module provides the
+//! threaded IRQ handler for it. The top half services the GIN leaf and the falcon SWGEN0 latch,
+//! and the IRQ thread drains the message queue.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+use kernel::{
+    device, irq, pci,
+    prelude::*,
+    sync::{
+        aref::ARef,
+        Arc, //
+    },
+};
+
+use super::{
+    interrupt_tree::{
+        GinVector,
+        LeafEnableGuard,
+        Subtree,
+        Tree, //
+    },
+    SubtreeVectors, //
+};
+use crate::{
+    driver::Bar0,
+    falcon::gsp::Gsp as GspFalcon,
+    gpu::Chipset,
+    gsp::cmdq::Cmdq, //
+};
+
+/// Fixed GSP notification vector.
+///
+/// The resource manager pins the GSP SWGEN0 notification to this vector on every supported chip,
+/// so nova-core uses the constant directly instead of discovering it at runtime. The leaf and bit
+/// serviced by the handler are derived from it.
+const GSP_INTR_0_VECTOR: GinVector = GinVector::new::<155>();
+
+/// Subtree carrying the GSP notification vector, and the only subtree nova-core services.
+///
+/// Probe allocates PCI vectors for this subtree, and the GSP handler names it as the subtree it
+/// serves, both when it takes its vector and when it rearms.
+pub(crate) const GSP_SUBTREE: Subtree = GSP_INTR_0_VECTOR.subtree();
+
+/// Clears the interrupt state that GSP boot left behind.
+///
+/// Disables every vector in every implemented leaf, clears the falcon's SWGEN0 latch, clears the
+/// tree's pending bits, and rearms PCI interrupt delivery. On return no vector is enabled, so the
+/// tree delivers nothing.
+pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::IrqType) {
+    let tree = Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into());
+    tree.disable_all_leaves();
+    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched.
+    // Clear it before the tree drain below, so the drain clears the tree state the clear sets.
+    // Messages already posted raise no interrupt of their own, and the caller's queue drain
+    // covers them.
+    GspFalcon::clear_swgen0_intr(bar);
+    tree.drain();
+    // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cycle methods, but pre-Hopper
+    // MSI rearms through a configuration-space write instead. An interrupt delivered before probe
+    // leaves delivery un-armed on that path, with no handler to have rearmed it.
+    tree.rearm_pci_irq(GSP_SUBTREE);
+}
+
+/// Threaded IRQ handler for the GSP SWGEN0 event.
+///
+/// The top half clears the GIN leaf and reads the falcon SWGEN0 latch. The IRQ thread drains the
+/// GSP-to-CPU message queue, which takes the command-queue lock.
+#[pin_data]
+pub(crate) struct GspInterrupt<'a> {
+    /// Borrowed BAR0, for falcon register access from interrupt context.
+    bar: Bar0<'a>,
+    /// The GSP command queue, drained by the IRQ thread.
+    cmdq: Arc<Cmdq>,
+    /// The GIN interrupt tree for this chipset.
+    tree: Tree<'a>,
+    /// Device, for logging from interrupt context without taking the command-queue lock.
+    dev: ARef<device::Device>,
+}
+
+impl<'a> GspInterrupt<'a> {
+    /// Creates the handler for `chipset`, borrowing `bar` and sharing `cmdq` with the rest of the
+    /// driver.
+    pub(crate) fn new(
+        bar: Bar0<'a>,
+        cmdq: Arc<Cmdq>,
+        chipset: Chipset,
+        irq_type: pci::IrqType,
+        dev: ARef<device::Device>,
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!(Self {
+            bar,
+            cmdq,
+            tree: Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into()),
+            dev,
+        }? Error)
+    }
+}
+
+impl irq::ThreadedHandler for GspInterrupt<'_> {
+    /// Top half: clears the GIN leaf, takes the falcon SWGEN0 latch, and rearms PCI interrupt
+    /// delivery.
+    fn handle(&self) -> irq::ThreadedIrqReturn {
+        // Only service our own vector: require the GSP bit in the leaf and clear just that bit, so
+        // a co-pending vector in the same leaf stays pending for whoever services it. The subtree
+        // stays enabled, so there is no whole-tree disable and enable.
+        let leaf = self.tree.read_pending(GSP_INTR_0_VECTOR.leaf_index());
+        if !leaf.vectors().contains(GSP_INTR_0_VECTOR.leaf_mask()) {
+            // Nothing to service, but nova-core is the only consumer of this PCI interrupt, so
+            // skipping the rearm here would silence every later interrupt as well.
+            self.tree.rearm_pci_irq(GSP_SUBTREE);
+            return irq::ThreadedIrqReturn::None;
+        }
+        leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
+
+        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
+        let status = GspFalcon::take_swgen0_intr(self.bar);
+        let ret = if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            // The tree routes every falcon cause to this vector, so something other than a posted
+            // message fired it, for example a HALT from a GSP crash. There is no recovery path for
+            // those causes, so report the status rather than discarding it.
+            dev_err!(
+                &self.dev,
+                "GSP interrupt with no SWGEN0, falcon IRQSTAT {:#x}\n",
+                status.into_raw()
+            );
+            irq::ThreadedIrqReturn::Handled
+        };
+
+        // Delivery resumes only after this, so it must happen on every path that services the
+        // vector, including the fault path above.
+        self.tree.rearm_pci_irq(GSP_SUBTREE);
+
+        ret
+    }
+
+    /// IRQ thread: drains and dispatches the GSP-to-CPU message queue.
+    fn handle_threaded(&self) -> irq::IrqReturn {
+        if let Err(e) = self.cmdq.drain() {
+            // A queue that fails to drain cannot advance past the message that failed, so every
+            // later notification would repeat this failure. Disable the source instead.
+            self.tree.disable_leaf(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            );
+            dev_err!(
+                &self.dev,
+                "GSP event drain failed ({:?}), the message queue is no longer serviced\n",
+                e
+            );
+        }
+        irq::IrqReturn::Handled
+    }
+}
+
+/// The registered GSP event interrupt.
+///
+/// The fields tear down in declaration order, which is the order this needs: dropping the guard
+/// disables the GSP vector, and only then does `reg` drop and run `free_irq`. That closes the
+/// window, including a probe partial-unwind, in which an interrupt could be delivered to a handler
+/// being freed.
+#[pin_data]
+pub(crate) struct GspIrq<'a> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    #[pin]
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+}
+
+impl<'a> GspIrq<'a> {
+    /// Registers the GSP SWGEN0 threaded handler for the GSP subtree in `vectors`, then enables
+    /// the GSP notification vector.
+    ///
+    /// # Safety
+    ///
+    /// The caller must not leak the returned value: its [`Drop`] runs `free_irq`.
+    pub(crate) unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        vectors: &'a SubtreeVectors<'a>,
+        bar: Bar0<'a>,
+        cmdq: Arc<Cmdq>,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let dev: ARef<device::Device> = pdev.as_ref().into();
+        let tree = Tree::new(bar, chipset, vectors.irq_type(), GSP_SUBTREE.into());
+
+        // The fields below are initialized in the opposite order to the one they are declared in,
+        // so that the handler is registered before the vector it serves is enabled.
+        try_pin_init!(Self {
+            // SAFETY: the caller guarantees the returned `GspIrq` is not leaked, so this
+            // registration's `Drop` (`free_irq`) always runs.
+            reg <- unsafe {
+                irq::ThreadedRegistration::new(
+                    vectors.request_for(GSP_SUBTREE)?,
+                    irq::Flags::TRIGGER_NONE,
+                    c"nova-core",
+                    GspInterrupt::new(bar, cmdq, chipset, vectors.irq_type(), dev),
+                )
+            },
+            // A message posted during `quiesce` latches this leaf bit while the vector is still
+            // disabled, so enabling it raises that interrupt rather than losing the message.
+            _leaf_guard: tree.enable_leaf_guarded(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            ),
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 1d26ca408dc3..02077184fd17 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -412,7 +412,6 @@ pub(super) fn trigger(&self, vector: GinVector) -> Result {
     ///
     /// This clears enables outside the subtrees nova-core services, so it is a probe-time
     /// operation only.
-    #[expect(dead_code)]
     pub(super) fn disable_all_leaves(&self) {
         for index in 0..self.leaves.into_raw() {
             if let Some(leaf) = LeafIndex::try_new(index) {
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 65ce547bd44e..68b5abfe494d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,6 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
 mod irq;
 mod mctp;
 #[macro_use]
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3422b49df7a7..e360a6d25c60 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -120,6 +120,10 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         4:4     halt => bool;
     }
 
+    pub(crate) NV_PFALCON_FALCON_IRQSTAT(u32) @ PFalconBase + 0x00000008 {
+        6:6     swgen0 => bool;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ PFalconBase + 0x00000040 {
         31:0    value => u32;
     }
-- 
2.55.0

