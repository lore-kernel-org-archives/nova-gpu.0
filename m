Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E060A390CA2
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188286; cv=fail; b=IyrNnr7/4epZLcIway2PgWJA4nAa81m8ZoBmlks/IqnZBV9tlnEvHwctAojV9GPuCKLGbQUqgO9TvtF5+DDUtjAFjXGenCsuEhVfNNh6+tnrGXym2kZnGl2LtfPnapr5nnNb8qvrSgXHwYCpmkAQJ0sQ8LFRkPS4NW4zHRweCbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188286; c=relaxed/simple;
	bh=o+GsA3oYh+ONmBwRn+/sUONCB9cg7kLmGRzi089Fuk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qLcTS9ET7HQkJ3pe8yZJAoh6vvJuLvJ8QZ0xzrySzirCioGBf46xPGWm4ZJld/8Dfd+VMLWOtaXzLpf7R+KfQDrgZQ2vZRloKcATnV98AZ25dV37x0DP1PH0eQnD37/wZB3Bvv6WfZCvCT6IaG/nvDVrS38ZIrAgdGz2Y1KDkJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=upt2t4ct; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="upt2t4ct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKZBG67K/JIkrjFPr7ct29eT/FfxlBRKm+0PqEQTzOZJgcvm6MdAw9HnPuX3hLmeB8FEuBq3zkcfNo2G4dGCBtFNXGVtknp8yrDfK+xS+7iUBs/oLhCCqjSAHJqjvB+jBau8/xYDy+nQfdARHo6AaokVFCHrUKv8QB5KLXF5W20XamjkOYVftY6cpOUVSJ98nuJjEZkIJswqV0xfh2VC8qMBCqIzU1rfm5higRpImk4tCK6CO5t/51G8S03JePYm5xcOvDFcPjV5zxD3LOPWxucmHNjFIBxmDjQ1m+yhYlj9mc/pIKwZj0kCZbQThM/2E8BgiAkxqH4sVjASsw1/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6TOBXuwLLnQOT6UlYObEVbB5C/Y6mAIrB2weR/PR2I=;
 b=o7vgHjNSI/ahCnyhEEcIMEXM0Ba4wirkjv4iYf5sTunfks9mLfs0gmoarIxlSq4FJ+IHaLi/eocfygEcsJHC2ULN1WXuAnwe8QatYZnEwh90+35jFB+7yjw5OfO3eBnX2w3wjDT9ZVP4/841I7hOm2v7BP+hijsgAJFBEPFtovNOUHiML20Jh9hxIb8QWcucziX4vQiPPwmm3HiYDnza/bIcSQ8rHLvrWSdCMTxUk6l9SlEoEk0Yz5qiQF4K0cWw288+sxu4K6G9qdjlhpKeCRCLd1A8cM+Iw/XMKcBv8CTj1E9Bk0mfbJfJqB5pUzqKh0TIefRTPANlDj6aN+lRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6TOBXuwLLnQOT6UlYObEVbB5C/Y6mAIrB2weR/PR2I=;
 b=upt2t4cti9o4uwpOaS7jOQC2PxXuil84+CL/bwr+0a9/MjOJsc70eAaX9dkRKQkEgqjuThLJHEx/+V1kbvar5adS6b9K0tS96rJZw78MAy8JVZVsehhdlImqKMBeUqjRS8r+z16OmB3kD38e0ZoJPKRm2v0CaVwIeuUDJU3BMAuUIuNV9vKe+p45vBhwIqR84/wUWoMjgCqsAx8rMHh2c1BSd1+HAE5DGicolI2W74o4PFICSV8KRKfjmuPUOZemFjss7lSpyIBypyuGzM23SOwo69/uiRXQHflseYzsxBCsOy/zJmKzhq5HTJDSKFM+yOaIEVGUxiEBSZFFKube1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:30 +0000
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
Subject: [PATCH v4 15/17] gpu: nova-core: service GSP events from the SWGEN0 interrupt
Date: Fri, 11 Sep 2026 21:43:58 -0700
Message-ID: <20260912044400.677097-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 54212a59-cca2-43f1-849e-08df108888be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|7136999003|6133799003|3023799007|18002099003|11062099010|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	wNtA+U+C1m9SG8DL1nL7v/N7oqbA5FiqscGX5j774LvX2jrRdZBhEOohuxIE8Pja6Ca/MTRhy9JnHxs6gv5j/w3lgInV1DNOVpQT2ArHE1PZHEmsj5s8aNbTPfJu0IwcKcWKGvoAdUAXsvnwb40Hrv5v4Q8b1n/MRhWVhwN5v/w0nnQ/GgLbmxlqkg8B7Qazir/lMWNBy2A3eEa8X+L4Vd41Ru1hW+sieDzqfhH/WhktD+JNpqaJHqGjOk92riQhf5lw5LJycmOqVffyZhmQ8U/v35rgoRWBNZqA0iv/C3goSOXcWKSQqj6W888aeXbGmKh3jQiqG1lD57Z9dzjlrpdX5YqzQt7NQm72xZWOI61HTvHJhXZnWj2kTV1rf2PV3oxGnM1BNv7ZYqqT0pL2rIyuuFM6UhWOK2vzHb6agvwb1Qa0zPm9d6YqqcOKwtioeJIlsDIiKGziEYW09X5ZPsytiG34Pa8UvVXLXttiwC0+ANf2KLV/Zl8g5920wpgFN2lo6X40qOzsOrjbC2g0ZUdlb+DBj3ut42gup1wE4x1bn9Zvyc3uZ0PMMqqJzkJ8mIiKV9rrsGr7Icqcqt4fj+cnQjVYQZSzpQ/tW1AsDyITw469s9rIx/cWs4e2B4qTwUw2XFGdBIx0hRTX9ix43YPgLKGB8/ZZMaOwfdx9Q3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(7136999003)(6133799003)(3023799007)(18002099003)(11062099010)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Awn5rDE26uxPzGmVr1PMWjArwrjeg328TaP5lyJgu3cujTbCoq78N89i3gfi?=
 =?us-ascii?Q?AE8IWpjMJ8foge8n91AgUfx4N7Jm/PF/l1pMcUXePxkn4mtXU+PSvTHsFN70?=
 =?us-ascii?Q?/t8J5uBRDnrhOOaT9SrLRC08RRX4pVNsVpLt19uykxw3w28nZ6uFwNlEmv+F?=
 =?us-ascii?Q?C2rHS34Mj32FIu9c/bR/RXQE3L/KqsUbhi2NaO6rS+ZEfLNePVm2codoIM4t?=
 =?us-ascii?Q?vqCH3mTVSkV3O9hFh0Ida0rUBnGV44CXOdEjwbc8DsaGhn7MW+CE2jFKu9RB?=
 =?us-ascii?Q?ieM+1n0bNCxMRh/Vk/cFgr/wLov34a2Uf3RTItHZRYCiDoGOpHuVhCWrTGKy?=
 =?us-ascii?Q?GhAuKWpiQ2ZxCd3tMeff6uZNGnhLMycdaB5fcmlZHlGAUN4JF6US+Cp8kGVN?=
 =?us-ascii?Q?o6XVT1NhwhtoVCvcJNP/8afytl4pM8sJReDBOxXPo9xNGEUMJFvdiB3Q2q4/?=
 =?us-ascii?Q?t8pjp3MbZwEe0xPkb2xb2ShnyBIC4G1amSfpCKzpkWwQPD96ANGxPu2VfcF7?=
 =?us-ascii?Q?5wGLcu7ZFYGNUQzvfxkM5Mpv4eVEj5azR5NjiDVe/DQdJss7Ntyik1anwJCX?=
 =?us-ascii?Q?ah+Eleg1NK6/yQdGBdrlwRKNo2dx6jmkXxUMsblW6zTDSuseAFh/npv/tZyq?=
 =?us-ascii?Q?FInOPmJauedAv74Ynb2/As505ZXtv3GqDfWEF5naY5Wlri06N7/5LODzJGsn?=
 =?us-ascii?Q?HzfCAveOrE/Y2qxCiBRePSfiCPqPtMouoFEser/C/aWBZCSSUIOydcQuL9gf?=
 =?us-ascii?Q?UKQ5oKJA63ibYThO/TxFSFKXQA6YOWufbyWE/4eByXxNICjVG419jlFh5vhz?=
 =?us-ascii?Q?BTIomDvb25UdhYltj8CmtZWkiEJZkQBGcbVp0d2YffssQJozQCLaGVOysb8B?=
 =?us-ascii?Q?vvM1bvgxxMcUkYXwlUh4Z9YUA1UsTjiPmMuuBa9BMjgfEy6GQ9giP1Twb1fN?=
 =?us-ascii?Q?UvRiqJeFG2/YHLpPLLrNu1+M6uWgSZUgOKOGfPkP6sCxw0T1zsWDOhclOkjw?=
 =?us-ascii?Q?cSsE4BBImR9FVDEJwbypXl/sX5j/SGlidfA9eGibiy4oiMv1x3ag/ZuOKvhR?=
 =?us-ascii?Q?U9OtvIiLRjvk0zjFGYJZJE79KCnDSNuBEa37XVHqOVp7h33Gv/JgFzlE2ycz?=
 =?us-ascii?Q?0kx8BZVZz5kqcFmOKgBqVwDKrTARD2t9AjwNI3skFkHUcX9gDDjf6Rs7gxD8?=
 =?us-ascii?Q?VsVQKpWISB+g6Bnuyq4ITXPi95YOrCNJJNndQcWf9qzDnVB7RwWe+obnH/04?=
 =?us-ascii?Q?z3yA85uFMrKWXh7O2RiiXVrWces6sNfRKiI2RcDeB3fomlLBasanppCZUahJ?=
 =?us-ascii?Q?wqynCZW4/9PGhbLPyf++YH77fQDc7tlCO7XW2UhxgX8Y2Afz6/P3DMon2GuP?=
 =?us-ascii?Q?Q0gDw4XrR2Ik4HQ7wQUp0+Bu/hwhp+h0CsPfyZTRRIOLr/kKuohK/KaQ2n+Y?=
 =?us-ascii?Q?9a9CMuahBZo0BbZzvv2K1noibbOYMZXKdE0jXHE51nK2NhRt7iHlGy4aXqqv?=
 =?us-ascii?Q?izZ++Av6CaRwFksveHzILZKNhg93mT9S1UCw7SQRGU7GKjwfkjlycJPgMk9A?=
 =?us-ascii?Q?LfIxYNjxW+xyaAT1FQ2Q6iGLZshvW47xu8vTp7JpHQ3VXWA8+tB8gWaRX49L?=
 =?us-ascii?Q?4YqMRwtvZJnM6w3bi8TCS6ndKlWM7fwsmadNZDbA2BapHpL4Q6pqMf/wcTE3?=
 =?us-ascii?Q?yJ+u2Nmlm0LJDcZ/w4SqIn0Y7Kww9ZvyWioNMOM7R4R48NJzkTiUO3mX3e6s?=
 =?us-ascii?Q?h8Uk6/Mbhw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54212a59-cca2-43f1-849e-08df108888be
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:30.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xCOUMioG3qx9YjEzHsndNib50birEZA8Qz31EB+szArnedzIa5aABBjNjn6zWadYO554r3eFGme8PPv+RHTyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

When the GSP has something for the CPU, it posts a message to the
GSP-to-CPU queue and raises SWGEN0, a software-generated interrupt cause
of its falcon. SWGEN0 is routed to the host and reaches the CPU on GIN
vector 155. It is a latch: while it stays set, the GSP cannot signal the
tree again. GSP boot consumes the GSP's notifications by polling the
queue, so it leaves the latch set and pending bits behind in the tree.

nova-core read the queue only while a caller was waiting for a command
reply, so an event posted between commands sat unread until the next
command was sent.

Register a threaded handler on the GSP vector. The top half runs in
hard interrupt context and touches only registers:

* Read the GSP vector's leaf and clear its bit, leaving any other
  vector in the leaf pending.

* Read the falcon causes routed to the host, and clear the SWGEN0 latch
  if it is set.

* Clear the latch of every other host cause, then retrigger the falcon
  or disable the vector, as described below.

* Rearm PCI interrupt delivery.

Draining the queue takes the command-queue mutex, which can sleep, and
walks shared memory, so the top half leaves it to the IRQ thread and
wakes the thread when SWGEN0 was set.

A host cause other than SWGEN0 reports a GSP fault. IRQSCLR clears a
cause's latch but cannot end the source behind it, and on Blackwell the
fault-containment and ECC causes are driven from outside the falcon, so
they stay set through the write. A retrigger would then re-emit them at
once, and the CPU would take the same interrupt again and again. So
after clearing the fault latches, read the host causes back. If the
clear ended every one of them, retrigger the falcon, so that a cause
latched in the meantime still signals the tree. If a cause is still
set, disable the GSP vector at its leaf instead and log that the device
needs a reset. Disabling loses nothing: while a cause stays set, the
falcon signals nothing further either way.

Make the handler registration one of the GPU's resources, rather than
something probe registers, so that it drops before the command queue
the handler drains is freed and before the GSP is unloaded. Before
registering, quiesce the tree and clear the SWGEN0 latch, so nothing
left over from boot reaches a handler that services one vector and
cannot service any other. The quiesce leaves the GSP subtree disabled at
TOP, and the pre-Hopper MSI rearm is a configuration-space write that
does not enable it again, so enable the subtree explicitly. Keep it
enabled for as long as the handler is registered, and disable it only
after the handler is freed, since a handler still in flight would enable
it again through its rearm. Once the handler is in place, drain the
queue once: a message posted before the latch was cleared produced no
interrupt.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs         |  73 +++++-
 drivers/gpu/nova-core/falcon/hal.rs         |   4 -
 drivers/gpu/nova-core/gpu.rs                |  57 ++++-
 drivers/gpu/nova-core/gsp.rs                |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           |   1 -
 drivers/gpu/nova-core/irq.rs                |  43 +++-
 drivers/gpu/nova-core/irq/gsp.rs            | 236 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   4 +-
 drivers/gpu/nova-core/nova_core.rs          |   1 -
 9 files changed, 399 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 4c96ae325fda..dfa08bc6867c 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -5,6 +5,7 @@
         io_project,
         poll::read_poll_timeout,
         register,
+        register::Array,
         Io,
         Mmio, //
     },
@@ -18,9 +19,11 @@
         NovaRegisters, //
     },
     falcon::{
+        hal,
         Falcon,
         FalconEngine, //
     },
+    gpu::Chipset,
     regs,
 };
 
@@ -46,14 +49,72 @@ fn pfalcon2(io: Bar0<'_>) -> Mmio<'_, super::PFalcon2Registers> {
     }
 }
 
-impl<'a> Falcon<'a, Gsp> {
-    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
-    /// allow GSP to signal CPU for processing new messages in message queue.
-    pub(crate) fn clear_swgen0_intr(&self) {
-        self.pfalcon
-            .write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true));
+impl Gsp {
+    /// Clears the SWGEN0 latch in the GSP falcon.
+    ///
+    /// While the latch is set, no later message signals the tree, so a caller that consumed a
+    /// notification by polling must clear it.
+    pub(crate) fn clear_swgen0_intr(bar: Bar0<'_>) {
+        Self::pfalcon(bar).write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true));
+    }
+
+    /// Reads the GSP falcon causes that are routed to the host, without clearing any latch.
+    ///
+    /// Every one of them other than SWGEN0 reports a GSP fault.
+    pub(crate) fn read_host_intr(
+        bar: Bar0<'_>,
+        chipset: Chipset,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let latched = Self::pfalcon(bar).read(regs::NV_PFALCON_FALCON_IRQSTAT);
+
+        hal::falcon_intr_hal(chipset)
+            .riscv_routing()
+            .host_routed_causes(Self::pfalcon2(bar), latched)
+    }
+
+    /// Reads the host-routed causes and clears the SWGEN0 latch if it was set.
+    ///
+    /// Returns the causes as read, before the clear. No other latch changes.
+    pub(crate) fn take_host_intr(
+        bar: Bar0<'_>,
+        chipset: Chipset,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let status = Self::read_host_intr(bar, chipset);
+
+        if status.swgen0() {
+            Self::clear_swgen0_intr(bar);
+        }
+
+        status
+    }
+
+    /// Clears the latch of every interrupt cause set in `status`.
+    ///
+    /// A cause driven from outside the falcon is still set on return, and
+    /// [`Self::read_host_intr`] reports the causes that remain.
+    pub(crate) fn clear_intr(bar: Bar0<'_>, status: regs::NV_PFALCON_FALCON_IRQSTAT) {
+        Self::pfalcon(bar).write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::from(status.into_raw()));
+    }
+
+    /// Retriggers the GSP falcon, which then re-emits its host-routed causes into the tree.
+    ///
+    /// Call this only once every host cause is clear. A cause still set is re-emitted at once, and
+    /// its vector arrives again as soon as delivery is rearmed.
+    ///
+    /// Does nothing on Turing, whose falcons have no retrigger register.
+    pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
+        if !hal::falcon_intr_hal(chipset).has_intr_retrigger() {
+            return;
+        }
+
+        Self::pfalcon(bar).write(
+            Array::at(0),
+            regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigger(true),
+        );
     }
+}
 
+impl<'a> Falcon<'a, Gsp> {
     /// Checks if GSP reload/resume has completed during the boot process.
     pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 052610c4a4da..3f1f509eccbd 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -82,7 +82,6 @@ fn signature_reg_fuse_version(
 
 /// Offsets of a falcon's RISC-V interrupt routing registers.
 #[derive(Clone, Copy, Debug, Eq, PartialEq)]
-#[expect(dead_code)]
 pub(crate) enum RiscvRouting {
     /// The Turing offsets. GA100 uses them too.
     Tu102,
@@ -97,7 +96,6 @@ impl RiscvRouting {
     ///
     /// The causes routed to the core belong to the firmware running on it, and the host does not
     /// service them.
-    #[expect(dead_code)]
     pub(crate) fn host_routed_causes(
         self,
         pfalcon2: Mmio<'_, PFalcon2Registers>,
@@ -122,7 +120,6 @@ pub(crate) fn host_routed_causes(
 ///
 /// Separate from [`FalconHal`] because the GSP event handler calls these from hard interrupt
 /// context, where it cannot make the heap allocation that a `FalconHal` takes.
-#[expect(dead_code)]
 pub(crate) trait FalconIntrHal {
     /// Returns whether these falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
     fn has_intr_retrigger(&self) -> bool;
@@ -135,7 +132,6 @@ pub(crate) trait FalconIntrHal {
 ///
 /// GA100 has its own arm: it has the retrigger register, which Turing lacks, and the Turing
 /// routing offsets, which GA102 moved.
-#[expect(dead_code)]
 pub(crate) fn falcon_intr_hal(chipset: Chipset) -> &'static dyn FalconIntrHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_INTR_HAL,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3d796d6c7013..d1e0da7b8682 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -38,6 +38,11 @@
         Gsp,
         GspBootContext, //
     },
+    irq::{
+        self,
+        gsp::GspIrq,
+        SubtreeVectors, //
+    },
     mm::{
         bar_user::BarUser,
         pagetable::MmuVersion,
@@ -301,6 +306,13 @@ struct GspResources<'gpu> {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    /// GSP event interrupt registration.
+    ///
+    /// Must be kept declared *before* `gsp_resources`, so that the handler is unregistered, and
+    /// any in-flight run of it has finished, before the command queue it drains is freed and
+    /// before the GSP is unloaded.
+    #[pin]
+    _gsp_irq: GspIrq<'gpu>,
     /// Static GPU information as provided by the GSP.
     gsp_static_info: GetGspStaticInfoReply,
     /// GPU memory manager owning memory management resources.
@@ -319,6 +331,14 @@ pub(crate) struct Gpu<'gpu> {
     /// Must be kept declared *after* `gsp_resources`, as the latter's `PinnedDrop` implementation
     /// requires the sysmem flush page to be in place.
     sysmem_flush: SysmemFlush<'gpu>,
+    /// Borrow of `vectors` that `_gsp_irq` holds. A field that borrows a sibling field is
+    /// self-referential, which `pin_init` cannot express, so the borrow is taken by hand.
+    vectors_ref: &'gpu SubtreeVectors<'gpu>,
+    /// PCI interrupt vector allocation.
+    ///
+    /// Must be kept declared *after* `_gsp_irq`, which holds a borrow of it.
+    #[pin]
+    vectors: SubtreeVectors<'gpu>,
 }
 
 #[pinned_drop]
@@ -358,6 +378,12 @@ pub(crate) fn new<'a>(
         let dev = pdev.as_ref();
 
         try_pin_init!(Self {
+            vectors: irq::alloc_vectors(pdev, irq::gsp::GSP_SUBTREE.into())?,
+
+            // SAFETY: `vectors` is initialized above, is pinned at a stable address, and is
+            // dropped after every field that uses `vectors_ref` (struct field drop order).
+            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref().get_ref()) },
+
             spec: Spec::new(dev, bar).inspect(|spec| {
                 dev_info!(dev,"NVIDIA ({})\n", spec);
             })?,
@@ -380,12 +406,7 @@ pub(crate) fn new<'a>(
 
                 bar,
 
-                gsp_falcon: Falcon::new(
-                    dev,
-                    spec.chipset,
-                    bar
-                )
-                .inspect(|falcon| falcon.clear_swgen0_intr())?,
+                gsp_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
                 sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
@@ -409,6 +430,30 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
+            _: {
+                irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vectors_ref)?;
+            },
+
+            // SAFETY: the command queue is a field of `gsp_resources`, which is initialized
+            // above and pinned, so the reference outlives the registration. The registration is
+            // a field of `Gpu` and is never leaked, so its `Drop` runs, and field drop order
+            // runs it before the queue is freed.
+            _gsp_irq <- unsafe {
+                GspIrq::new(
+                    pdev,
+                    vectors_ref,
+                    bar,
+                    &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                    gsp_resources.spec.chipset,
+                )
+            },
+
+            // No interrupt announces the messages that the GSP posted during boot, before the
+            // SWGEN0 latch was cleared.
+            _: {
+                gsp_resources.gsp.cmdq.drain()?;
+            },
+
             gsp_static_info: {
                 // Obtain and display basic GPU information.
                 let info = gsp_resources.gsp.get_static_info(bar)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25ea43f1cbe9..fcfb4210d435 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -152,7 +152,7 @@ pub(crate) struct Gsp<'gsp> {
     /// Log buffers, optionally exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers<'gsp>>,
-    /// Command queue.
+    /// Command queue, borrowed by the GSP event interrupt handler.
     #[pin]
     pub(crate) cmdq: Cmdq<'gsp>,
     /// RM arguments.
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index acee444e898d..f1231569aa33 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -643,7 +643,6 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     /// # Errors
     ///
     /// `EIO` if the queue is poisoned, or if a message fails framing or checksum validation.
-    #[expect(dead_code)]
     pub(crate) fn drain(&self) -> Result {
         self.inner.lock().drain()
     }
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index 7fb7d9f2e237..cafcc613770a 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -11,6 +11,7 @@
 
 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
 pub(crate) mod doorbell_test;
+pub(crate) mod gsp;
 mod hal;
 mod interrupt_tree;
 mod regs;
@@ -25,11 +26,16 @@
     prelude::*, //
 };
 
-use crate::num;
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    num, //
+};
 
 use interrupt_tree::{
     Subtree,
-    SubtreeSet, //
+    SubtreeSet,
+    Tree, //
 };
 
 /// The message-signaled interrupt type that Linux granted.
@@ -56,6 +62,39 @@ pub(crate) struct SubtreeVectors<'a> {
 }
 
 impl SubtreeVectors<'_> {
+    /// Returns the tree of `chipset`, covering the serviced subtrees.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `chipset` does not implement every serviced subtree.
+    fn tree<'b>(&self, bar: Bar0<'b>, chipset: Chipset) -> Result<Tree<'b>> {
+        Tree::new(bar, chipset, self)
+    }
+
+    /// Disables every vector in the tree, clears every pending bit, and rearms PCI interrupt
+    /// delivery.
+    ///
+    /// On return, the serviced subtrees are enabled at `TOP` under a `TOP` rearm method and
+    /// disabled under the configuration-space one. A caller that needs delivery enables them
+    /// itself.
+    ///
+    /// Call this only during probe, with no interrupt handler registered.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `chipset` does not implement every serviced subtree.
+    pub(crate) fn reset_tree(&self, bar: Bar0<'_>, chipset: Chipset) -> Result {
+        let tree = self.tree(bar, chipset)?;
+
+        tree.disable_all_leaves();
+        tree.drain();
+        for subtree in self.serviced.iter() {
+            tree.rearm_pci_irq(subtree);
+        }
+
+        Ok(())
+    }
+
     /// Returns the [`irq::IrqRequest`] for the PCI vector that delivers `subtree`.
     ///
     /// # Errors
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
new file mode 100644
index 000000000000..8996f4215e40
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The GSP event interrupt.
+//!
+//! The GSP posts messages to the GSP-to-CPU queue and raises SWGEN0, a software-generated cause
+//! of its falcon. A threaded handler services it: the top half clears the tree and falcon state,
+//! and the IRQ thread drains the queue.
+//!
+//! See "The GSP event" in `Documentation/gpu/nova/core/interrupts.rst`.
+
+use kernel::{
+    device,
+    irq,
+    pci,
+    prelude::*, //
+};
+
+use super::{
+    interrupt_tree::{
+        GinVector,
+        LeafEnableGuard,
+        Subtree,
+        TopEnableGuard,
+        Tree, //
+    },
+    SubtreeVectors, //
+};
+use crate::{
+    driver::Bar0,
+    falcon::gsp::Gsp as GspFalcon,
+    gpu::Chipset,
+    gsp::cmdq::Cmdq,
+    regs, //
+};
+
+/// The GSP event vector, which has the same number on every supported GPU.
+const GSP_INTR_0_VECTOR: GinVector = GinVector::new::<155>();
+
+/// The GSP event's subtree, the only one that nova-core services.
+pub(crate) const GSP_SUBTREE: Subtree = GSP_INTR_0_VECTOR.subtree();
+
+/// Clears the tree and falcon interrupt state that GSP boot leaves behind, and rearms PCI
+/// interrupt delivery.
+///
+/// On return, no vector is enabled at its leaf and the SWGEN0 latch is clear, so the next message
+/// that the GSP posts signals the tree.
+///
+/// # Errors
+///
+/// `EINVAL` if `chipset` does not implement every subtree that `vectors` services.
+pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, vectors: &SubtreeVectors<'_>) -> Result {
+    vectors.reset_tree(bar, chipset)?;
+    // The latch is cleared after the tree reset. The other order can leave the latch set with its
+    // leaf bit cleared. See "Enabling the GSP event" in interrupts.rst.
+    GspFalcon::clear_swgen0_intr(bar);
+
+    Ok(())
+}
+
+/// Threaded IRQ handler for the GSP event.
+pub(crate) struct GspInterrupt<'a> {
+    /// For the GSP falcon's registers. The tree holds its own copy.
+    bar: Bar0<'a>,
+    cmdq: &'a Cmdq<'a>,
+    tree: Tree<'a>,
+    /// Selects the falcon's retrigger and routing registers, which differ by family.
+    chipset: Chipset,
+    /// For logging. The command queue's device reference is behind its mutex, which the top half
+    /// cannot take.
+    dev: &'a device::Device,
+}
+
+impl<'a> GspInterrupt<'a> {
+    fn new(
+        bar: Bar0<'a>,
+        cmdq: &'a Cmdq<'a>,
+        tree: Tree<'a>,
+        chipset: Chipset,
+        dev: &'a device::Device,
+    ) -> Self {
+        Self {
+            bar,
+            cmdq,
+            tree,
+            chipset,
+            dev,
+        }
+    }
+
+    /// Clears the latch of every host-routed cause in `status` other than SWGEN0, and logs them.
+    ///
+    /// Returns the causes still set after the clear. A cause driven from outside the falcon stays
+    /// set, and only a device reset ends it.
+    fn clear_faults(
+        &self,
+        status: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let faults = status.with_swgen0(false);
+        if faults.into_raw() == 0 {
+            return faults;
+        }
+
+        dev_err!(
+            &self.dev,
+            "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
+            status.into_raw()
+        );
+        GspFalcon::clear_intr(self.bar, faults);
+
+        GspFalcon::read_host_intr(self.bar, self.chipset).with_swgen0(false)
+    }
+}
+
+impl irq::ThreadedHandler for GspInterrupt<'_> {
+    /// Top half, in hard interrupt context. Services the GSP vector only, so another vector
+    /// pending in the same leaf stays pending.
+    fn handle(&self) -> irq::ThreadedIrqReturn {
+        let bar = self.bar;
+
+        let leaf = self.tree.read_pending(GSP_INTR_0_VECTOR.leaf_index());
+        if !leaf.vectors().contains(GSP_INTR_0_VECTOR.leaf_mask()) {
+            self.tree.rearm_pci_irq(GSP_SUBTREE);
+            return irq::ThreadedIrqReturn::None;
+        }
+        leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
+
+        let status = GspFalcon::take_host_intr(bar, self.chipset);
+
+        let remaining_faults = self.clear_faults(status);
+        if remaining_faults.into_raw() == 0 {
+            GspFalcon::retrigger_intr(bar, self.chipset);
+        } else {
+            // Disabling the vector loses no notification: the falcon signals nothing further
+            // while a cause stays set. See "Retriggering a falcon" in interrupts.rst.
+            self.tree.disable_leaf(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            );
+            dev_err!(
+                &self.dev,
+                "GSP falcon cause {:#x} needs a device reset, GSP events are no longer serviced\n",
+                remaining_faults.into_raw()
+            );
+        }
+
+        self.tree.rearm_pci_irq(GSP_SUBTREE);
+
+        if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            irq::ThreadedIrqReturn::Handled
+        }
+    }
+
+    /// IRQ thread. Drains the GSP-to-CPU queue, which may sleep.
+    fn handle_threaded(&self) -> irq::IrqReturn {
+        if let Err(e) = self.cmdq.drain() {
+            // A poisoned queue fails every later drain the same way.
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
+/// The registered GSP event handler and the enables that deliver to it.
+///
+/// The declaration order is the drop order, and it is required: the vector is disabled first,
+/// `free_irq` runs second, and the subtree is disabled last. See "Enabling the GSP event" in
+/// `Documentation/gpu/nova/core/interrupts.rst`.
+#[pin_data]
+pub(crate) struct GspIrq<'a> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    #[pin]
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+    _top_guard: TopEnableGuard<'a>,
+}
+
+impl<'a> GspIrq<'a> {
+    /// Returns an initializer that registers the threaded handler and then enables the GSP
+    /// subtree at `TOP` and the GSP vector at its leaf.
+    ///
+    /// An event that latched while the vector was disabled is delivered as soon as the vector is
+    /// enabled.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `vectors` does not service the GSP subtree, or if `chipset` does not implement
+    /// every subtree that `vectors` services. Otherwise the error from `request_threaded_irq`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the initialized `GspIrq` or otherwise prevent its [`Drop`]
+    /// implementation, which runs `free_irq`, from running.
+    pub(crate) unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        vectors: &'a SubtreeVectors<'a>,
+        bar: Bar0<'a>,
+        cmdq: &'a Cmdq<'a>,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let dev = pdev.as_ref();
+
+        try_pin_init!(Self {
+            // SAFETY: this function's caller must not leak the `GspIrq` that owns this
+            // registration, so the registration's `Drop` runs.
+            reg <- unsafe {
+                irq::ThreadedRegistration::new(
+                    vectors.request_for(GSP_SUBTREE)?,
+                    irq::Flags::TRIGGER_NONE,
+                    c"nova-core",
+                    Ok(GspInterrupt::new(
+                        bar,
+                        cmdq,
+                        vectors.tree(bar, chipset)?,
+                        chipset,
+                        dev,
+                    )),
+                )
+            },
+            _top_guard: reg.handler().tree.enable_top_guarded(),
+            _leaf_guard: reg.handler().tree.enable_leaf_guarded(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            ),
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index f77920a3b30a..eae1a1d4b933 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -117,10 +117,12 @@ pub(super) const fn all() -> Self {
         Self(u32::MAX)
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn from_raw(raw: u32) -> Self {
         Self(raw)
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn into_raw(self) -> u32 {
         self.0
     }
@@ -196,7 +198,6 @@ pub(super) const fn span(self) -> u32 {
     }
 
     /// Returns the subtrees of this set, lowest index first.
-    #[expect(dead_code)]
     pub(super) fn iter(self) -> impl Iterator<Item = Subtree> {
         (0..u32::BITS)
             .map(Subtree::new)
@@ -234,6 +235,7 @@ pub(super) const fn new<const VECTOR: u32>() -> Self {
         Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn into_raw(self) -> u32 {
         self.0.get()
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index abafe4f2968d..cbaef6d3d9f1 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,6 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
 mod irq;
 mod mctp;
 mod mm;
-- 
2.55.0

