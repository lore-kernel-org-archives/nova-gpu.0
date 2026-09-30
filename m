Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C3380FF2
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739798; cv=fail; b=BidSwPY4uyo9TZIhj1WJ1T3G5jsKgUNKeuJkaUpavTiJ/+2DtDlcmMtGNFqjhtQWOqmf8CAan0LF4tKg4AAOD7wWpmqITReRzl9ingere14rJdtf2B93CTNdGImk6TL5rvJAdgcoPZvQ73uuCVDvWQpfOBkhQfUEhvAOJmFiYQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739798; c=relaxed/simple;
	bh=vZ4eR7TYFqajMCkrB3ywd8V6krVx0LnD0vbifTP/3WI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uUugzQ979qj++8QDf64b+GQMoZTFQuNCuc6+S/ejG/uoFgz8MsPI6j/A4Glm7LDYwE4oYYLZmidsNkPgRiwehAvtLWcY50fwlncpMxGWEk+O790DjuY8JeR18VM3B6en0QogKgp2cvP0/Ag5GX2cQerzZnM7WGRA5hXD6qpJ0xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g5aLG+jn; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g5aLG+jn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlzY9ZGxeEKuKIvSf4wLW0imOji8mOu+gYhxqYyT2rq8n9rwKw1+7KmDGalDkZiKVlMhml5U85CZmVRUSDlxyQieHuAOjk7j2QY6zeuTCNR1zeM31hHk+nY/1rlbYnbzvlyFKUF5YcP9bSfxrGfWcLatZHi1w9VCHWvh9kSqV+Yo7pW+4zLPkp1rgxM/WmT5Ld/EKCASh/Dp+wU7UP5IvuEhK9yVfMEmm/CneMn68oMe19+p8yf8Op4z9wQB8a+N51tEMlZhRuUknJUl6oMCyBHtATwRzwcwKCrKjYKd75JBpOkNJHXazyQAbQnwnYTMA3n+EJu/veSNMSgkTOjM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl/Z2qcde3FaEqu6j1zVEXWeUan9H1YA+j8/EsWOBcI=;
 b=hSXdFairTCIaoLJ54/8Gmc9gOLSRhZrzyYBMQgd0w5ZWUPrBKqt5Zhy3NYjmE8l+9PNQBb00mVJtrBu67kY68fylnU3kVXHQlX46QN2CB5fmindnGaPG05+asJ+T/bbz/r/fVYWiUU1qJRvU5oW5zBfNdCSFAQkRv3tQbCeHhe24tTkLYujzA3AGwppd/+977Tah4cB/jdK5QF58FYA5CN3WPIavYoJ4dOJdNBaVKShBLqmIt7kwSCzNlJw04NgDAwV+28YPpgPUrW/sd2zkN52f8S79JSSW/naGj0EytozdPl6Kzqk6hUGC8+uTZXMSpQNw7FGTtgdvJVU0HH+U1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl/Z2qcde3FaEqu6j1zVEXWeUan9H1YA+j8/EsWOBcI=;
 b=g5aLG+jnScQV7vzheQiflD2uoaQ3OTSSXc6LGfAE9lj6+XcHkenzSo0mNbrYKCASJiBVLaUDKME+i/9zQemhpn0cMkzZafqw8xWB/HN73WNbi6h09af6Of6ZevBxuouWSlzo/VeWD/3Mzvh6FxofOiXiqZSB9yCSh4SzqtlyQulpkugHEjTBiYDhYfJ9niECcQkY6CsPNRpj4pBaci37wPPtKTjSlGgG8NnqIkBGgCAOaqQSxjLtE2DPQA+FHE7uuXZ5DRWFG7o2Fm0JjpCA43GBdbNb1+aJZRUZTbRJoJng0jOMbShMlWx7jdm1mXwWcwS/jm4CczdVSb7hI1Rbrg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:07 +0000
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
Subject: [PATCH v5 00/15] nova-core: GPU interrupt support and GSP event delivery
Date: Tue, 29 Sep 2026 20:41:33 -0700
Message-ID: <20260930034148.590687-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 2305f958-b957-4bff-7b85-08df1ea4ccd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	GBGUWWw1Z0fEf0ITtCtkPiZ3l9xxl0qtd7T4hB6ZGLo3xiMEpaT7EW16mmbnG+vRHAb6E8rhBQdZ8Gj56AWV8RTcV+KHh8aL2odCdzDlBDge3irdayd+WYxXrxcPsogP/LP0SPPU6uh/20ytb0mped/rcRwKvkdnSuiSFZyJkUM8/rWnPF4Dvmex2Fq0EKZWF7x1O1vXj3FCgqi7yyE43cnmh3WEi7y9MUu3rwS6pDmZ+eQRxhWGqWQlnOTNQWgsi1Hs+2z7Sq8kAwwmzUQtYnbmoltJIrUhc82wptwP5EvSiBKwZFiZ365YgRJGpEy80BsitddyQNYO/6gKg4MkH9V19vEt7uc1Rjlgr5pxMQUE1VupZVrY7MBWrEhMDwuoGV00s78uxOflcq422aBhlfuAhOae5QUMxTB3Qubnx2AyrB6HCCvB48UG/elUrRGyWSYDJxAq+fLqKMujwHCyjf8YBWoWX9LBPzvvSrdZAJE0WCc3CMDqQoidp4Yo4J1jC0Ysg6KwLQmTZIAcbZ6/wrh+Ozy0zpoun9Fh87V7k2vbvsfZ0rfZOcQcSXl1DUti98tTCkjmNf985FH0c+YplDPN1cqAEwRQ0Pvy5DKol0UxDyc76ysvphBbt+Fk5tcvG87SggOuroZYzFrkuG9XdYDJjp7LWLYgtG8rC5eBw6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UTf9sNKRB1AVYIfeIunKxy1sQoXl/AzzN7TyMd3PoO1L/OD7ACxwhyXxqrMh?=
 =?us-ascii?Q?8VUAZx4opvKUc7y0mbNlgmk1+ZJrZuCPv2ej2Rs2AJ54GYwr0oxdd6NkEF4m?=
 =?us-ascii?Q?cCwDeF4Pl1Hxp8vqkc4IYo94P/nDdAH2Q0YkjrktLbAajOQCN+cBgmPS3Boi?=
 =?us-ascii?Q?t8PlzFGq7vYpesVzDmVUFHoVGI+pzLSYsKqLoNc5YfJSM99JTdV4M61jIhyQ?=
 =?us-ascii?Q?1XX6gN/sxkorhvlHAfGZnkzmx+ztuZwtSQkSUsrHN0xtdEX9ixPsv6mSXKud?=
 =?us-ascii?Q?L8LMuys6MH9YVwmgbQLDJcUwUX3GZU6akUk5vGNwpuoXPAk0krTJ77aKyFLN?=
 =?us-ascii?Q?HPR2NfbcaxY829j9VbyTSTtKixrumsHsxshwGc1bYl+fZ7fQKAQNhcNT67rZ?=
 =?us-ascii?Q?ctCNbyJNyAY1q9F5hXS/uOqkRi28Z8hOCH9UyttLzls++GKLQ8Znw8gi1Ksz?=
 =?us-ascii?Q?+KKDWDp6CKpsz7s6SL0J2sFV6tUQ2zYJBrBbq2XsDAFIOmdFrroaF/EQxbnW?=
 =?us-ascii?Q?dW8E3qHcYRE/Au/uNsklPlfUS7LP6AwL5n2u2GsZ+cdxn9gTfJ+WIhLU4qwQ?=
 =?us-ascii?Q?Dz9Bbn86+8VN9fiUwNdnc0ZB6+ZnOFyBPvO+KVxTGowUZ+n0rhSA9Nyp++Pd?=
 =?us-ascii?Q?8ix3fSSLRo2N+ucZDOPKIedXOnU8P5n8021CtXLhuLa9r60YsrzSV3B1fKFt?=
 =?us-ascii?Q?LuoaiIV5kiCaYScWA6V+Ss4E+XoMeyLP+i3Imv8Wn3KW2KwcbWPDFop2TN26?=
 =?us-ascii?Q?0Wio6DCwj5vzPTfl+yMjExlIaXWhpS1Ifl6canjQIwl6DC8n/g/lWSpmMpI4?=
 =?us-ascii?Q?A0xwEY5DCskUN/mql629iCUyftsOpoTpRqTSqacjYEEQrkgS31LKd9Emmp8b?=
 =?us-ascii?Q?bWBf7L5Az7AVPgsB3Rmke3LQyqkf1/RyasWqSRuN+JwncSArhjvNrhawSp4f?=
 =?us-ascii?Q?hgp86PaXLPPmc5YykHjDmTF7VggDnrl81kpTO1ma6xie51YvMtatVsUEYiBq?=
 =?us-ascii?Q?PjdcknioPRi7RML41hu45fptdKOO4Vv4cpOrdGdYLr7DH9FTEcB7fTC9AJLu?=
 =?us-ascii?Q?M35Bz7avResAObbX0FBHbaZaLP63OKNRAJ+meuE7F6gL4b0flmlYgB+OCn6k?=
 =?us-ascii?Q?clth2rsRzyITQSc6+AmwOkxhmWDWLRs88gMIYtan8JeOrBBOrQk2MmQ8lHyz?=
 =?us-ascii?Q?7ZtiUGIpuhTWf88y4OmHHRCLmIZll213MfCIrD+mbVT+9sUE78YvTrRXdHCM?=
 =?us-ascii?Q?02mBhVqmVGBB/ivHSaguWMEIGy8G8Z7s6xGdq44Zr08mz3b0Zt+dIw1yy7NU?=
 =?us-ascii?Q?zufYIjm5Du85zSXLV3YxeNi5IelpE8nPvn8Sc0f/YOEf8eFtfrJquHGmezY5?=
 =?us-ascii?Q?Sm/FWwMDSofSsHVpJvtUzImeGu0wk7rroSCunIYEtHW5xhxoKCD0ABwUmNiB?=
 =?us-ascii?Q?l78ObkGvBTOaTTFwQCQxt08kvHSxdSAkHUhYijPCJjgeHfPnoKPJ8OwhH9+a?=
 =?us-ascii?Q?UyzdMcOgDaBMASsx+s+Y7xIeFuNxWXfmIjJoGBwTL6KF7gGviB3pCpK7ERBG?=
 =?us-ascii?Q?S7OfWLHkHjm11V9yZ0siMnSwbFJdV76/a6Ky7SnHPgJWxpWgJczrb9nSLsYj?=
 =?us-ascii?Q?/oVk68RVomZbcSmhScEmTzpjHEbNadVmgAoFFftp3RwUxu/GfqYjzOvUA5J1?=
 =?us-ascii?Q?M5kK0UoK3cgKq26VrEXNYGQozvc0nNbhq29d8zsTTn5OoOHBPyDsLHxYt655?=
 =?us-ascii?Q?2+QksBYKhA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2305f958-b957-4bff-7b85-08df1ea4ccd6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:07.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BHhC5ohDWkIbTRkc/m1/d6chCUAifsdOMGpqxqRP3FjS0Gv+hWW49DB0uUtOK90ie49iUyUwT6gbtXI2W67vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

This series adds GPU interrupt support to nova-core, so that GSP events
reach the driver as interrupts instead of only when the driver polls.
v5 applies Alex's review of v4, and makes three of the design changes
that he had set aside for after the merge. The series is 15 patches,
down from 17. The two rust/ patches are unchanged.

GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
controller, and it latches pending interrupts in a two-level register
tree. TOP, the tree's top-level enable register, holds one enable bit
per subtree.

The design uses a threaded IRQ handler. The top half reads and writes
only GPU registers, while the threaded bottom half drains the message
queue.

Still TODO after this: retrieve the dynamic interrupt routing tables
from GSP, and use those, instead of the simple, hard-coded approach that
was done here for these first two interrupts.

The series is based on drm-rust-next at commit 658c5f0042e6 ("gpu:
nova-core: use a single try_pin_init!() block in probe()"), and it
carries no prerequisite commits.

The patches, as applied to drm-rust-next, are on a git branch:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v5/

Changes in v5:

* Dropped the patch that poisoned the message queue after a framing or
  checksum failure. (Alex)

* The GSP interrupt handler borrows the GSP falcon and the command queue
  instead of holding a BAR and a chipset. (Alex)

* The per-chipset falcon interrupt operations are methods of the
  existing falcon HAL rather than of a separate falcon interrupt HAL.
  (Alex)

* The PCI vector allocation and the interrupt tree are one type, which
  the Gpu owns and the GSP handler borrows. (Alex)

* The tree reset is a method of the tree, and it disables the serviced
  subtrees at TOP last. (Alex)

* The Gpu holds the TOP enable of the GSP subtree, and the GSP handler's
  registration holds only the leaf enable of its own vector. (Alex)

* The interrupt tree's trigger and the message queue's drain are added
  by the patches that first call them, so the separate message queue
  drain patch is dropped. (Alex)

* The two KUnit suites that tested the HAL dispatchers are removed, and
  the tree suite's chipset check covers every chipset. (Alex)

* Smaller items from the same review (Alex):

  * repr(u32) on the leaf count, and an if/else in the vector check.

  * The interrupt HAL performs the rearm, and the tree holds the HAL
    instead of a leaf count and a rearm method.

  * The GFW comment restored at the wait in probe, where GFW is the
    GPU's boot firmware, and one import group in probe.

  * The self-test handler's clear and rearm grouped ahead of the count,
    and the superfluous dev local removed.

  * A comment at the MSI fallback in the vector allocation.

  * "chipset" for "part", and "OpenRM" for "Open RM".

  * The falcon HAL patch's message no longer claims that a HAL call
    allocates, since there is no separate HAL left to justify.

TESTING: Tested on Turing (TU117), Ampere (GA104), and Blackwell
(GB202), covering probe and chipset identification, the interrupt
self-test, a GSP name query over the command queue, driver unload and
reload, and the KUnit suites. No test produced a GSP fault on any of the
three chips, so the fault path is untested.

Joel Fernandes (2):
  rust: sync: completion: add wait_for_completion_timeout()
  gpu: nova-core: add the GIN interrupt tree and allocate its vectors

John Hubbard (13):
  rust: pci: declare IrqType and IrqTypes with impl_flags
  gpu: nova-core: add the GIN vector, leaf and subtree types
  gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
  gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
  gpu: nova-core: wait for GFW boot in probe, not in the Gpu constructor
  gpu: nova-core: add an interrupt delivery self-test
  gpu: nova-core: log GSP events instead of discarding them
  gpu: nova-core: return ENOMSG for an unmatched GSP message
  gpu: nova-core: bound a GSP wait by a single deadline
  gpu: nova-core: add the falcon interrupt registers and HAL methods
  gpu: nova-core: service GSP events from the SWGEN0 interrupt
  gpu: nova-core: add KUnit tests for the interrupt tree
  gpu: nova-core: document the GIN interrupt controller and GSP events

 Documentation/gpu/nova/core/interrupts.rst  | 679 +++++++++++++++++++
 Documentation/gpu/nova/index.rst            |   1 +
 drivers/gpu/nova-core/Kconfig               |   5 +
 drivers/gpu/nova-core/driver.rs             |  19 +-
 drivers/gpu/nova-core/falcon/gsp.rs         |  47 +-
 drivers/gpu/nova-core/falcon/hal.rs         |  19 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs   |  16 +
 drivers/gpu/nova-core/falcon/hal/tu102.rs   |  49 +-
 drivers/gpu/nova-core/gpu.rs                | 122 +++-
 drivers/gpu/nova-core/gsp/cmdq.rs           | 166 ++++-
 drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
 drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
 drivers/gpu/nova-core/irq.rs                |  29 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 257 ++++++++
 drivers/gpu/nova-core/irq/gsp.rs            | 196 ++++++
 drivers/gpu/nova-core/irq/hal.rs            |  67 ++
 drivers/gpu/nova-core/irq/hal/gh100.rs      |  40 ++
 drivers/gpu/nova-core/irq/hal/tu102.rs      |  43 ++
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 682 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/regs.rs           |  88 +++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 drivers/gpu/nova-core/regs.rs               |  69 ++
 rust/kernel/pci/irq.rs                      |  68 +-
 rust/kernel/sync/completion.rs              |  23 +-
 24 files changed, 2594 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs


base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d
-- 
2.55.0

