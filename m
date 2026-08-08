Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBD03806C9
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158718; cv=fail; b=rDcQh600/DQfIRvO0QzETWVzdJ7i3r4hLyEOgl2bAT+h16/DaHRApzOW4wbP8LhlXixiDq/+tdhQ48AyQ5bC2x+cVLcyVsOH0ZzMeUbs7WNvnuD8k4oubU2kNbiR81IKKhidJ7zCpAeu9TksJ5C8R1cUgf1KM6tQA6zHH8EZ2f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158718; c=relaxed/simple;
	bh=a8ZAZSugf0VJ7yO6Jm4Ulkwb/9LQJjcPDILD/wJmxTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuXYd43HWb1Y8yWTRbDm+bVF5LjW41aP/79ynCa4W6TB+8mMB06zLIb8jlYgefI3BuU9avyHDVsWViMfAJSGgh9jEWnseBm2kZxbNlNJP/jaA/+SVd6yYFhT6e1BeRxMo9lCGHyxKumwzlX97zudV4yRUi7mvq+TjBEfQ6Gw9TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OmZXvQdv; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OmZXvQdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAzs3m7h4vffSjeUIGT40FhBYq2qObecTm9rnfQToU0N8SMC6Q5pgf29ZYS5T7CBkuWIbgqIgUKQMCX+C0KxI2Ta0ClQ+hIcU7tGYp/YNlzMkLQSgIR0rsEUM7JzPLARwH/63jPanZoxq3QspV31UeNIamGNXfrhpbNrkKUAlqtdeSmTmoltt/Ek8krlJhqC3h36JDGRe0AFpG8qVBfzECzl9Vwy0LGP2OMMlZEuWgeXKpfyo8NFgstDjugFlw21BoFR6VZdGbywyuxNkaQe4C+Z6+O4I4ByfpDbl0g3sWBNRL+aPZKrjKOeoVtUUq07fm7PrxlPaZNtzLxGwmJNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKHPP3vp4p6e224uudtoDkHbPQb2z0AiAZYy3ybFZc0=;
 b=P21Fy1T2hAm76UGrJIgOzobWuATSZd6zcwNZrztS/jJcviPa/ZtS9Sqzu6uGrDOsonbPGry7Cmf8o50y3g8Z+POc1mLdquhvOsQLmEX4iNFEn9b7uZ8vJhbAqGWjIIhZ0ibVG2bshoL02XL/6SR1LmQimVqbRHtVLI4tBGJkdM1Cd80KzBA5vsC+ywpITyn1XlFviwP9WWlXue9130FczTfRvCD2OUGtW1888rUmuLPJeAuKXLxunnfEzJMzBo/w0MMRLbptUxFKO0rLVBS6nSGKLDLw6OpLS7mRiIW/eWuy/800A9a1Div1yQudkBcat5XA6ZyhL+5wL211PDYsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKHPP3vp4p6e224uudtoDkHbPQb2z0AiAZYy3ybFZc0=;
 b=OmZXvQdvOwCmuOR1OsTp2jTqRcR3dxz1RtgzeroLrts93GXvCro65qeKSTjf3euASNpYmjRNorXkCzwm/rfygjpHbSJ/xOreowUtAE+DzuMDs9a9vJ2bsnUdlu8i/qXgMRB0KucZqm/Goa45CmHp/PoT5F2RCUCiPoGb1uSruHyhE/FvCxWBmsH+34+d32RpsuEXQ4aMZ3U1rlK7543QA9srcPXEavZnPjI4Kvaj16Soc3gTwkBqEK01u4WuJgfKNH/MsQhWe+E0rggkAieLBeboJPLDnjOiJm30w9RQ1t0r7ngcWKIObQptIqKUkVdXr2uatfdg5YNFtNnJqLsNGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:40 +0000
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
Subject: [PATCH 14/17] gpu: nova-core: drive GSP events with the SWGEN0 interrupt
Date: Fri,  7 Aug 2026 20:11:16 -0700
Message-ID: <20260808031120.363869-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: ab31e852-f8d6-4fbb-40a1-08def4fac3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|7136999003|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|11062099010|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eTs5t1cjw+mUn5nKAIO7tPTCQkJxtErASWAn8k81wcyCxiibhyIR2Q1F1Bca/xagCtqKM/aSbYv8qGYqw2GIWENN5wovoJomzPPPw5YWCGNDDbR4QvvTfQPJsqmWaNwUMTRmpH8vvsCP+CEKhTVXHxxntXwnNsSh2cJcTj/vICMZxD7GcC3JV/I25+AQLBT+eICkZOYLrdMKyL3CJEyiT/5Bk5dIJLGluojJ9hj26m6AhjtyhsNTe2iTgXb82r/Nlsu50kCp+RNkR+93Kla65BgB8Z5le0eO2LlmbxJ07j+2rEjwZrEbQfAGeL2jfVj9dkLpObzWm+vUa/HGg3EHwSpMoNSdyNBzWt9umWbwaJ8iLd+B/CzG4EFLQc0Ne3qmQL3Xm5uXnI1x0ltMjuYsLQOuuGcodc3KvrcwJSdGd9in3lhEs5+joNtBd5IY8tf6tCtIWHq4C+FuTWi45XvnJp9+kNj4HvUNCOECz4T1wHWYuJBwJZuBcdWik7Op7UxYpwlgqRZbX/pVSBG3TplpSWgM1rcJNfYMPav7uDzgWj/RCbabuLp85zYhF/x9Th2RaTb9xh7RcSGLaBdwABZausyWGwmokWmB/avEogUQktwXHVN95RKUU4NO7j7xg2X7wpE9sStpXzrEjLfNXeeJlXLQVikDPkdV9iP0Ld0pc18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(7136999003)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(11062099010)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yq1tm8J+Zmao7sZ+WXMvABW0tfD7etuPIl1PcgpzMbQZ/urnRDEHB8v+28Eo?=
 =?us-ascii?Q?3L8GtNggqNyu7grAU7Y2fol+Ilypykv/td+VKmene/hSXlpAURhZqnqF+slO?=
 =?us-ascii?Q?o70R3E2SYLXuf1Zzau5RCs60zKpOG0BNeiG1UQDMO/Yb6zYOKFL8uJypuI/D?=
 =?us-ascii?Q?+rpR1vjT9piMp7cnyxIFpd7j/jX7s141v6LNOtzFk7J9slgwaArJAa3AYkDL?=
 =?us-ascii?Q?AvSR5bDD9AJ5Dg9K4LY7OYTPYDeTLWTGOr4HHaJ30tkXA0E0lcY2nlZ07ENx?=
 =?us-ascii?Q?wg+r9tvCXMmfZfhm5CklHBG+JHmb22GrfvoeNtkV1gatOql1ZpbHpEYSIua5?=
 =?us-ascii?Q?FWS1jTSyieA4S5jGZidx4ndfZAZ25wP48HLCeZpN1Fo78R5c5JzNL9x6rmEn?=
 =?us-ascii?Q?eOUoJylp/ORz62mnplA5eeGswzmm6oAVAV//jA2/g2ej8cLP9DVe54Yr6IIC?=
 =?us-ascii?Q?Vc1F3oV9BbONFh8OcSygPFsff3ZoyIitkepKggGCXvBZr93SEjDErV7/X3lK?=
 =?us-ascii?Q?63zZ1XakzXFXrva3majt9s7mhcJ5ZJDw7prLuyxqGOI9JqyUbqVrgKb+t6+J?=
 =?us-ascii?Q?xMHtWaIG1Q6rneN12sS/1JHocsi6upfHi0HAyXempXWINMlKboAhUf+9MaZf?=
 =?us-ascii?Q?0mBzTQ89Pw8Ylr59C5hKJzaf0EmSUT2Q/GoUdMxBuVhbHl2s+baROrGQsqQ2?=
 =?us-ascii?Q?oH7baCjdDIIWbf1tU8s+lwClYxj9HxspnvZ6maRKSU+6C63y71AVY5p+zajU?=
 =?us-ascii?Q?xtOpP5F8SYOyqi2Wf6WQHVxOzdWDE8wNUw+BCFVqagNZ5hALB6SBMJNV9uEx?=
 =?us-ascii?Q?GXrGJrmG4okEato0kYNxfG4Y6qJrFUnTG13th1uFhozmD/m1aThjzdfknMkK?=
 =?us-ascii?Q?MZcLmQooYVLv+wcCMwyaxr72jp74Ma1VRZJJOsAP6+udh+vFEvQnGmy/l4ld?=
 =?us-ascii?Q?ndybhNFMAcBUHwYktlUaxILuayTWQmP513nDM3n1r9oUnE2Mn0wpiegPikfi?=
 =?us-ascii?Q?6LdkzoSaID3LKqu3BxnHvJ6b3z0bx8uNAYCSPIiI7qNdaW3ivuMOGGLKLnNf?=
 =?us-ascii?Q?2LWAmLsOGaq7ubj9wvz+WcPcWqxKj5wZLlAloRmHQjkgb8zUrljycgQu+bLF?=
 =?us-ascii?Q?eEoB2xZPqPLBobS7lN8HdLS5kR5GTgROyuiel1RRlW9uqwH6wOrO2enRcBBu?=
 =?us-ascii?Q?c2OwV3ViQ1BPkTAZRqBQFy+TkYaz/qbadNXy3l72R238PKZ8pWhVmxLBLXp7?=
 =?us-ascii?Q?WZd1Ha79MzrU9961laWZrZzm03/vy+dloaGFzJsKPilq95BZ7doVyiHHdOLl?=
 =?us-ascii?Q?93+pMdmodQuHa3FwmsSTHe82oErgPWbvSawVufDw6JysGP31uszkL/1oGy09?=
 =?us-ascii?Q?6xUJh7VktqHL6XIF3KTS7Uzpl7+NlWmHcXWpjnovgVkS+SmechjIfVaK7jM2?=
 =?us-ascii?Q?Bsmr5+8FQ8FlsxAQSHY+B9c3D0Ebn0A01DkZVA1tYyhFKAXUY81xStA6OGc2?=
 =?us-ascii?Q?fla+hjI6OWLDp76x9Xx20aO7d62RKZmcX5U5/IbvuHBwfZl7cFE3GctJus/P?=
 =?us-ascii?Q?soD/6yhJXtsljjGQUXHxtn8M3ftUrEr0axYdPXKzA2khp7kBV6DwO1zH0mUQ?=
 =?us-ascii?Q?ByRKMu7TEbjxtJoGrzNUSNjEXS3vJLNjZjiCCBkwAWfnPfR/4CtWpRJJE6aU?=
 =?us-ascii?Q?Tc4arvWVo0YNqAQUCoLbN1quK/JrwVhogKgJOZP5hHks4FGSbP7bzFA8/3DD?=
 =?us-ascii?Q?DNdnwVRZrA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab31e852-f8d6-4fbb-40a1-08def4fac3d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:40.0883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: criVTmNYPYgKluSNhZssFbsFqwlF8ck0tpAoFVf7e+BVevb9iztG6j2m4oG4CD+zH6g84/ly7t+IJm9JrNcxLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

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
 drivers/gpu/nova-core/driver.rs             |  54 ++++-
 drivers/gpu/nova-core/falcon/gsp.rs         |  35 ++-
 drivers/gpu/nova-core/gpu.rs                |  22 +-
 drivers/gpu/nova-core/gsp.rs                |  17 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           |  42 ++++
 drivers/gpu/nova-core/irq.rs                |   1 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  |  30 +--
 drivers/gpu/nova-core/irq/gsp.rs            | 239 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |  18 ++
 drivers/gpu/nova-core/nova_core.rs          |   1 -
 drivers/gpu/nova-core/regs.rs               |   4 +
 11 files changed, 433 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5738d4ac521b..3fbf117a99ee 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -18,13 +18,22 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::{
+    gpu::Gpu,
+    irq::gsp::GspIrq, //
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
@@ -78,14 +87,51 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
+            // A PCI device has one interrupt vector allocation, so it is made here for every
+            // subtree nova-core services, and each handler takes the vector for its own subtree.
+            let vectors = crate::irq::alloc_vectors(pdev, crate::irq::gsp::GSP_SUBTREE)?;
+            let gsp_vector = vectors.vector_for(crate::irq::gsp::GSP_SUBTREE)?;
+            let irq_type = vectors.irq_type();
+
             Ok(try_pin_init!(NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
                 // SAFETY: `bar` is initialized before this expression is evaluated
-                // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
-                // stable address, and is dropped after `gpu` (struct field drop order).
-                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
+                // (`try_pin_init!()` initializes fields in the order they appear here), lives at a
+                // pinned stable address, and is dropped after `gpu` (struct field drop order).
+                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }, vectors),
+                // Quiesce the interrupt tree before registering the handler below.
+                _: {
+                    // SAFETY: as for the `bar` borrow above.
+                    let bar = unsafe { &*core::ptr::from_ref(bar) };
+                    crate::irq::gsp::quiesce(bar, gpu.chipset(), irq_type);
+                },
+                // Register the permanent GSP SWGEN0 handler before enabling the interrupt.
+                //
+                // SAFETY: `bar` is initialized before this expression is evaluated, lives at a
+                // pinned stable address, and is dropped after `_gsp_irq` (declared first, so
+                // dropped first), so the handler's borrow stays valid for its whole lifetime.
+                // `_gsp_irq` is stored in `NovaCore`, whose `Drop` runs `free_irq`, so the
+                // registration is never leaked.
+                _gsp_irq <- unsafe {
+                    GspIrq::new(
+                        pdev,
+                        gsp_vector,
+                        irq_type,
+                        &*core::ptr::from_ref(bar),
+                        gpu.cmdq(),
+                        gpu.chipset(),
+                    )
+                },
+                // Enable the GSP notification now that the handler is registered, then drain any
+                // messages the GSP posted during boot before relying on the interrupt.
+                _: {
+                    // SAFETY: as for the `bar` borrow above.
+                    let bar = unsafe { &*core::ptr::from_ref(bar) };
+                    crate::irq::gsp::enable(bar, gpu.chipset(), irq_type);
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
index d5df0ebf67ae..9700eff6db86 100644
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
     regs,
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
+        vectors: SubtreeVectors<'gpu>,
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
index 5b449759b333..ddf322f2e623 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -10,6 +10,7 @@
 
 #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
 pub(crate) mod doorbell_test;
+pub(crate) mod gsp;
 mod hal;
 mod interrupt_tree;
 
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
index fae770339fd7..bfdfee732892 100644
--- a/drivers/gpu/nova-core/irq/doorbell_test.rs
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -28,11 +28,14 @@
     time, //
 };
 
-use super::interrupt_tree::{
-    vector_leaf_bit,
-    vector_subtree_mask,
-    LeafIndex,
-    Tree, //
+use super::{
+    interrupt_tree::{
+        vector_leaf_bit,
+        vector_subtree_mask,
+        LeafIndex,
+        Tree, //
+    },
+    SubtreeVectors, //
 };
 use crate::{
     driver::Bar0,
@@ -56,8 +59,8 @@
 
 /// Subtree carrying the doorbell vector, and the only subtree this test services.
 ///
-/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the allocation, the subtree it
-/// enables, and the handler together.
+/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the subtree it enables and the
+/// handler together.
 const DOORBELL_SUBTREE: u32 = vector_subtree_mask(DOORBELL_VECTOR);
 
 /// Index of the subtree carrying the doorbell vector. Under MSI-X this is also the index of the
@@ -184,17 +187,18 @@ fn drop(&mut self) {
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
+    vectors: SubtreeVectors<'_>,
 ) -> Result {
-    // The allocated interrupt type decides how the handler rearms delivery, so the vectors are
-    // allocated before the tree is built.
-    let vectors = super::alloc_vectors(pdev, DOORBELL_SUBTREE)?;
+    // The interrupt type decides how the handler rearms delivery, so the tree takes it from
+    // probe's allocation.
     let vector = vectors.vector_for(DOORBELL_SUBTREE)?;
     let irq_type = vectors.irq_type();
     let tree = Tree::new(chipset, irq_type, DOORBELL_SUBTREE);
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
new file mode 100644
index 000000000000..1fce315410f3
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -0,0 +1,239 @@
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
+use super::interrupt_tree::{
+    LeafIndex,
+    Tree, //
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
+pub(crate) const GSP_INTR_0_VECTOR: u32 = 155;
+
+/// Leaf and bit index of the GSP notification vector within the interrupt tree.
+const GSP_LOC: (usize, u32) = super::interrupt_tree::vector_leaf_bit(GSP_INTR_0_VECTOR);
+
+/// Leaf holding the GSP notification vector.
+const GSP_LEAF: usize = GSP_LOC.0;
+
+/// Bit of the GSP notification vector within its leaf.
+const GSP_BIT: u32 = 1 << GSP_LOC.1;
+
+/// Subtree carrying the GSP notification vector, and the only subtree nova-core services.
+///
+/// Probe allocates PCI vectors for this subtree, and the GSP handler names it as the subtree it
+/// serves, both when it takes its vector and when it rearms.
+pub(crate) const GSP_SUBTREE: u32 = super::interrupt_tree::vector_subtree_mask(GSP_INTR_0_VECTOR);
+
+/// Clears the interrupt state that GSP boot left behind.
+///
+/// Disables every vector in every implemented leaf, clears the falcon's SWGEN0 latch, clears the
+/// tree's pending bits, and rearms PCI interrupt delivery. On return no vector is enabled, so the
+/// tree delivers nothing.
+pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::IrqType) {
+    let tree = Tree::new(chipset, irq_type, GSP_SUBTREE);
+    tree.disable_all_leaves(bar);
+    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched.
+    // Clear it before the tree drain below, so the drain clears the tree state the clear sets.
+    // Messages already posted raise no interrupt of their own, and the caller's queue drain
+    // covers them.
+    GspFalcon::clear_swgen0_intr(bar);
+    tree.drain(bar);
+    // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cycle methods, but pre-Hopper
+    // MSI rearms through a configuration-space write instead. An interrupt delivered before probe
+    // leaves delivery un-armed on that path, with no handler to have rearmed it.
+    tree.rearm_pci_irq(bar, GSP_SUBTREE);
+}
+
+/// Enables the GSP notification vector at its leaf.
+///
+/// The GSP interrupt is delivered from this point on.
+pub(crate) fn enable(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::IrqType) {
+    let tree = Tree::new(chipset, irq_type, GSP_SUBTREE);
+    // A message posted after `quiesce` latches this leaf bit while the vector is still disabled,
+    // so enabling the vector raises that interrupt rather than losing the message.
+    tree.leaf(LeafIndex::new::<GSP_LEAF>()).enable(bar, GSP_BIT);
+}
+
+/// Threaded IRQ handler for the GSP SWGEN0 event.
+///
+/// The top half clears the GIN leaf and reads the falcon SWGEN0 latch. The IRQ thread drains the
+/// GSP-to-CPU message queue, which takes the command-queue lock.
+#[pin_data]
+pub(crate) struct GspInterrupt<'a> {
+    /// Borrowed BAR0, for GIN and falcon register access from interrupt context.
+    bar: Bar0<'a>,
+    /// The GSP command queue, drained by the IRQ thread.
+    cmdq: Arc<Cmdq>,
+    /// The GIN interrupt tree for this chipset.
+    tree: Tree,
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
+            tree: Tree::new(chipset, irq_type, GSP_SUBTREE),
+            dev,
+        }? Error)
+    }
+}
+
+impl irq::ThreadedHandler for GspInterrupt<'_> {
+    /// Top half: clears the GIN leaf, takes the falcon SWGEN0 latch, and rearms PCI interrupt
+    /// delivery.
+    fn handle(&self) -> irq::ThreadedIrqReturn {
+        let bar = self.bar;
+
+        // Only service our own vector: require the GSP bit in the leaf and clear just that bit, so
+        // a co-pending vector in the same leaf stays pending for whoever services it. The subtree
+        // stays enabled, so there is no whole-tree disable and enable.
+        let leaf = self
+            .tree
+            .leaf(LeafIndex::new::<GSP_LEAF>())
+            .read_pending(bar);
+        if leaf.pending_bits() & GSP_BIT == 0 {
+            // Nothing to service, but nova-core is the only consumer of this PCI interrupt, so
+            // skipping the rearm here would silence every later interrupt as well.
+            self.tree.rearm_pci_irq(bar, GSP_SUBTREE);
+            return irq::ThreadedIrqReturn::None;
+        }
+        leaf.clear_vectors(bar, GSP_BIT);
+
+        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
+        let status = GspFalcon::take_swgen0_intr(bar);
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
+        self.tree.rearm_pci_irq(bar, GSP_SUBTREE);
+
+        ret
+    }
+
+    /// IRQ thread: drains and dispatches the GSP-to-CPU message queue.
+    fn handle_threaded(&self) -> irq::IrqReturn {
+        if let Err(e) = self.cmdq.drain() {
+            // A queue that fails to drain cannot advance past the message that failed, so every
+            // later notification would repeat this failure. Disable the source instead.
+            self.tree
+                .leaf(LeafIndex::new::<GSP_LEAF>())
+                .disable(self.bar, GSP_BIT);
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
+/// Wraps the threaded IRQ registration so that teardown disables the GSP source at the interrupt
+/// tree before `free_irq` runs. This closes the window, including a probe partial-unwind, in which
+/// an interrupt could be delivered to a handler that is being freed.
+#[pin_data(PinnedDrop)]
+pub(crate) struct GspIrq<'a> {
+    #[pin]
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+    /// Borrowed BAR0 and the interrupt tree, used by the teardown to disable the GSP source.
+    bar: Bar0<'a>,
+    tree: Tree,
+}
+
+impl<'a> GspIrq<'a> {
+    /// Registers the GSP SWGEN0 threaded handler on `vector`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must not leak the returned value: its [`Drop`] runs `free_irq`.
+    pub(crate) unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        vector: pci::IrqVector<'a>,
+        irq_type: pci::IrqType,
+        bar: Bar0<'a>,
+        cmdq: Arc<Cmdq>,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let dev: ARef<device::Device> = pdev.as_ref().into();
+        try_pin_init!(Self {
+            // SAFETY: the caller guarantees the returned `GspIrq` is not leaked, so this
+            // registration's `Drop` (`free_irq`) always runs.
+            reg <- unsafe {
+                pdev.request_threaded_irq(
+                    vector,
+                    irq::Flags::TRIGGER_NONE,
+                    c"nova-core",
+                    GspInterrupt::new(bar, cmdq, chipset, irq_type, dev),
+                )
+            },
+            bar,
+            tree: Tree::new(chipset, irq_type, GSP_SUBTREE),
+        })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for GspIrq<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        // Disable the GSP source before `reg` drops and runs `free_irq`, so no interrupt reaches a
+        // handler being torn down. This `PinnedDrop` runs before any field drops, so the order is
+        // disable-then-free_irq.
+        let this = self.project();
+        this.tree
+            .leaf(LeafIndex::new::<GSP_LEAF>())
+            .disable(this.bar, GSP_BIT);
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 73f5afadea3e..f4f1494cddba 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -135,6 +135,8 @@ pub(super) fn leaf(&self, index: LeafIndex) -> Leaf<Idle> {
     ///
     /// `EINVAL` if `vector` lies outside this tree (`vector >= num_leaves * 32`). `EOVERFLOW` if
     /// `vector` does not fit in the trigger register's vector field.
+    // Only the interrupt self-test injects a software interrupt.
+    #[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
     pub(super) fn trigger(&self, bar: Bar0<'_>, vector: u32) -> Result {
         if crate::num::u32_as_usize(vector) >= self.num_leaves * 32 {
             return Err(EINVAL);
@@ -143,6 +145,22 @@ pub(super) fn trigger(&self, bar: Bar0<'_>, vector: u32) -> Result {
         Ok(())
     }
 
+    /// Disables every vector in every implemented leaf (`LEAF_EN_CLEAR`).
+    ///
+    /// Boot, or a driver that ran before this one, can leave leaf enables set for vectors
+    /// nova-core does not service, and such a vector delivers to nova-core's handler once its
+    /// subtree is enabled.
+    ///
+    /// This clears enables outside the subtrees nova-core services, so it is a probe-time
+    /// operation only.
+    pub(super) fn disable_all_leaves(&self, bar: Bar0<'_>) {
+        for index in 0..self.num_leaves {
+            if let Some(index) = LeafIndex::try_new(index) {
+                self.leaf(index).disable(bar, u32::MAX);
+            }
+        }
+    }
+
     /// Clears every pending bit in every implemented leaf.
     ///
     /// Disables this tree's serviced subtrees at `TOP` across the walk, then enables them,
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
index 1db92d36c5ac..2a0489472a66 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -196,6 +196,10 @@ pub(crate) fn usable_fb_size(self) -> u64 {
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

