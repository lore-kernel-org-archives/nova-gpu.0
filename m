Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C22BE05E
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158690; cv=fail; b=Slwb2aQKhOzhnvWBLo5T/R2mW5zDpjYOjYi7uhk7q0jCqkUDGX6w9Lrm1h6OE8oLjq5ZDW1FRnppr89jOqsMYKg0wWPVszqgfB77PnI//OiHMngj2GDgmulvjU+4OaUB6KmVuSz8oHFJ4d7Lk3LewmWgJR8Hv96kvyINQfpsGFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158690; c=relaxed/simple;
	bh=+6CKk6d/yvzp1l/GmiPbfeqiAehWi28n3BXgiz4CWMM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hJg80d+JUS90vqj4oa7I4kluhml9B/o3gRD9hVAMsYVAyaXuSViVW8HxmjWk5t3/NO34V6jjPQTOgXfBZYB2h1R+7nRITusl9Zbg6pq2E8WVqlf8/OcIJY7QsjEq+fDoC38AmfO3lURIuwP7IW6UTAGGCL9YF3RiEsPWSzGkEKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uuJ+zDKW; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uuJ+zDKW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6/6vK6+xMXuP9QZKPnP3UpZUYUpGk9FqfpN2sp/4luXZdPQijichST1i39yr1eOBWd1FuEK/Vdj0GBo/vAGsjVzRMQM1tmssc294XF5qWuUscP146q5rSrfb5HhE/8OiBUK+QohqARrF0BEgTOnQmsPk7+vnY7gWLexNVu24WQC7vS3Ae3g0KjgP7TvQ68KNdG09b6MR7I9ITGoezAkdQxU7hUcoU5PVA0ZZfKDagIwDGouoocPv+dsa5taz7lNSWFXRx1dP82vgofPzqgkjSu015qC/OS40728j42MLDr6cyKjIgI/NwAIbzA6uR+OsmWtrHL7xX+PGeYZKpLP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eINRT29vw5om4y6GQNJNnMpDbHx4+CMNfNp0w0N0Azk=;
 b=yp1jVvOCk05BntXnSKJFfpKlM0k6nlsDaT2sOKJwWAO8cwN5yQ3ASQrV/ngV0AtcS5wBQ5yTWzXQCgX+R0mRwLn0k0sf88jYd1PxoA/16+z2TJ7wb9Hoztog/rQm2q6aCTgGXMCj3lkqUZgAth0+LjIhoMibc4SC1bjC6RgMCiQwpbQUyNa/vQwOgzduLcLfL0lukHIbA07jBZZJvCksZKdygQfLrilxQlEJtGCwkoWbCg93cQv9zIO4WBJ5DMI5EWb4qMHDeqYv1qV/8nXdbNl32gIcqM2t0WMu6a7p3ZucjZNCA29fqGdNm6J75yvImWyQkcxc3jJaNdw7hntchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eINRT29vw5om4y6GQNJNnMpDbHx4+CMNfNp0w0N0Azk=;
 b=uuJ+zDKWB2KdnN+/1TwhiqXKiHck/IzXGphW6/Aax8uUWrpjGIFVoezqevMvPs6GD0QTpL+HxUdTueobtsMpbB1HEpInPZ38FAqI0IyJjinD/CwMdbERSwUssjCNeN9SqFFaPZYEtY8DYxM8MdiPfTcT/QsC/0n5RgySiqOiVpkMTlrVdfq9p9lAh6lTBycMh6IaF4ZsH4b0PbqRw+oInB8XsXvzYgcMEsiOjbf3gGFJZohjlUhtcfbmRSKtW2Li8I7/ONk+CRTZUakSeWxTWFerKE2cJLLrI8uQN6RftUwqybG1oiy0EkT/UN2BVDa12hOytoj4nAc+2R4KGty+oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:22 +0000
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 00/17] nova-core: GPU interrupt support and GSP event delivery
Date: Fri,  7 Aug 2026 20:11:02 -0700
Message-ID: <20260808031120.363869-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: e45f1ab7-494d-4539-ce13-08def4fab940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|5023799004|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JZSQobACHC3BMSlWtPDdqUeYFCAwlT0doH5IbjY376yhQaqNjkwRwtCOHX/FAChq4dFNRTqy2sAMK7rLTtSWfks7gCoid8cY0A7mIKzZQXwOzT97//M6GhS1lXBToL26Q4gO7dbT8W4qSSPZZjKThcWfQFbfZgsmwS+9glliRbpkv9vgFm3KiWSkwZE8gw6rYr6KRyorLG/HFynt1McTKg7hJuaNa4L2W9aMT6TLkyacC56tiIEieszLXnnZUWhlp8djVZfcGxV78ud64E9Z+6JhQO+PRK7ekbZY32wBQF78daCviWAqRRRWSQ2UotGJcBDzM8VYP1luKAFCSTD2WhLX5hKU6iK0c9o02FF0yZ4m9OinpFLs6dKWG+7X5kj5R6NNixN8BUYTBIdtQ7avDSYiD5g4NdDTv1qiSbS1vGXkFhuREc3M+b7TYb0DpCswrskLKIvI2Q0qBT4fymQdq7KkdOOUjAyu1wtpkjmFqHjkd5iDnkkNROPz8ZyGCmrsoCmd+aGZ78MLItGFRUFChfHZf+2+o/PufK3fMurv7vOL8vWEoo8rys7xDOemx5G9RXPGBPUH+MKef4yQU+hDC5Y4Sr/O9ut7eChW90Bv3mt8K9fTyQxSmrJVMCHbPlsph+OEARDE0Wf8WIiAXchrW7qXv+Wx5dvBx3lM1eQDFn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCryfJHvH3L8ZNUWzdExLHAvs4RsAxl0h0tYT75VGGb84FGBR8cehlkm9/20?=
 =?us-ascii?Q?j7r6Pbu/32pRKjescHrkwcqVFFu4OFvy1butWgQ9XJz8ucqdse/EcRqEG3D2?=
 =?us-ascii?Q?pK9dqnF/Xr0cOIjJL+LarLpMJFf2iL32v5pSzwLFDJuS43qTxcMPwO2cL4QO?=
 =?us-ascii?Q?d/Bz911SZEUTZQLXHyOLwHRSyKfgK0FTYo+hxb6rcXjBXr/FiHKUXcmgvKsp?=
 =?us-ascii?Q?S6B4egEV9kTx/pCz+3b50VT2C4z8JCgYnWEw3sq5zxetumKjetr7VlPYgVRo?=
 =?us-ascii?Q?wc07ncMVp73dirmhu9zIX/LxaVsI7YMCM8PiWvQuPZ+m5P/5BVE61cZKjLgD?=
 =?us-ascii?Q?QwsqbgGY2jQIFypXV5N3wH2Wjn0ETt9k9EFHg5Lnn90QY1JD0pi25YNddNVk?=
 =?us-ascii?Q?J25udjh+7nrw3gbdplCkBKSqTy/OZJKMMUKJF7qsUKbZ9WFFTNATYLJdyCDF?=
 =?us-ascii?Q?+qz7N0dA2lWzb5Px9ejfWMSRiNZEmMxKKnt0CmNx/fV1kg3e2LlWEqChQ4sh?=
 =?us-ascii?Q?A5uKmg9Kyz803CSGwFJn06onYIPVTNNJ0dBaWFRUDKc4i47UKvo28mcO5LBh?=
 =?us-ascii?Q?v/1VpNNZB9DHX2lrefWIQG8ILzNU+quna3PD9Lu7OJCvgK3Q+Iyf6pQyxFL8?=
 =?us-ascii?Q?7HTlr6vvYG24nAgWQRYZJ3FbC3hhyzDUYADK5gg1+c5IkA1fl5QBA89OsQfF?=
 =?us-ascii?Q?Dm8AKid30axY14WQFwKicneUEFPSksJCZKBo4pLaaRt2M98Elft5jJWK2lSW?=
 =?us-ascii?Q?FayMIL69yugt8+mggQOhFdeq3L7JUwFyp8wzGUagjJd/NqgqasozYAE0awx5?=
 =?us-ascii?Q?jmOJ5DJVl+T5b6Gi6LeGbSStkrSzJiLjSEzGQ7i1gQ/DeqBX/W/2YFDFzFjW?=
 =?us-ascii?Q?eBkVsPUhBEQlJyrT5bQOZLDSHt/SWLBUH/t8B3hgwwVHPvXoA2gLsvLBqYyn?=
 =?us-ascii?Q?Tg2Ixs6FgyHDddZV/0K0QbtRJ/AkdZ0T6NRVxFoAct52wa4O4cgkY1oBzn0V?=
 =?us-ascii?Q?geaxsMk1LdfJ2ry0idFyaf6ZgAoxUAQ8gfFamIT6kxzKlxDpjSsFXopdGLoC?=
 =?us-ascii?Q?palCkQiw740nayne29rAnt8pW3sBnjMwho9HQQEGIr+byY84w3PKkrt5qNgc?=
 =?us-ascii?Q?cgs9exoq0kT+kq5eFUra3LDCkneusP9G32yRYfNsCUGOTTZahxFMh8vmRDca?=
 =?us-ascii?Q?FviMSddKN2rE1zZEFp8qApS1EC8rNa4k/A/rT42YOIycMehCYViEWDXL5SI1?=
 =?us-ascii?Q?cyceyRTh1Ei/96TfySVgZvEPrmCFRcaq9k31TCzccD4JKuSUmLjuquGZWBGt?=
 =?us-ascii?Q?jLkQ1moC9rrl9UIV+xAAE6XvWZbxY/QPLat0WBVfkg2vZwdfAhgGdJAaeCV6?=
 =?us-ascii?Q?qprmyK8/tpZNZrO/yWxXwGxk6PnjMiT4f4deMauZL/JJcUhN75sOc48SesGF?=
 =?us-ascii?Q?G7YPgIs0H0A3gSFpQvPxjNsdzj+h3yR1/jIBWRUOnZ8r6pKmbSkR21sNLsKn?=
 =?us-ascii?Q?UHzdU8PgbhoTldG4n9runZXNj1sMivCtk4rn9N+oYTn/v3FHyhzEo2Is2Cw6?=
 =?us-ascii?Q?TcOyKOVUsm5Cd12iwIzFlq7N71oSrPxZhoH1YyYJcOJyCirWhS7F7Yzpumti?=
 =?us-ascii?Q?uCnA9nI3CEdnAcrdZDmp1xe3BHShcegKQ7t/5FlRLqKs8adwuggk3ngYQmQE?=
 =?us-ascii?Q?zZiF+md8XGdl7LE3ghBIW/yw0j4firHURubVsCwnapraWiSJrLNlKaaIlRsz?=
 =?us-ascii?Q?QmT53zpZRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45f1ab7-494d-4539-ce13-08def4fab940
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:22.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUl1hjF8mfzEve/AxZO7aMR1GrdXnmsqV/CbE59j2/t0SRsaBk2IHfHT4b86lccER2Zz9NU5CUMJngtk12Qebw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

This series adds support for GIN, the GPU Interrupt and Notification
unit and the GPU's interrupt controller, so that GSP events reach the
driver as interrupts instead of only when the driver polls.

The series builds the path from the bottom up: the GIN register
definitions, a type-state API for walking the two-level tree, a
per-architecture HAL for the tree size and the rearm method, and a PCI
vector allocation sized to the subtrees nova-core services. On top of
that sits a threaded handler on the GSP notification vector, whose top
half touches only registers and whose IRQ thread drains the message
queue.

Driving that queue from an interrupt rather than from a polling loop
exposed three problems polling had hidden, so patches 10 through 13 fix
those before the handler arrives in patch 14.

A few rust/ changes were needed first, patches 1 through 3.

Patch 17 adds interrupts.rst, which is the place to start.

Joel Fernandes wrote the first versions of the tree API and the
self-test, and Will Pierce reviewed the interrupt work and the document.

Based on drm-rust-next plus Danilo Krummrich's "rust: irq: make
Registration compatible with lifetime-bound drivers".

There is a git branch with the patches as applied to drm-rust-next:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v0/

Testing: the 14 KUnit tests this series adds all pass. Probe succeeds
with the delivery self-test enabled on TU117 (Turing), GA104 (Ampere),
and GB202 (Blackwell). All three were granted MSI rather than MSI-X, so
the pre-Hopper configuration-mirror rearm and the Hopper-plus TOP cycle
both ran on hardware. Only KUnit covers the MSI-X per-subtree rearm.

An earlier version of this series has serviced real GSP events, in a
setup where the GSP posts them after probe. This version has not been
re-tested there yet. Patch 15's reordering runs on Turing without
regression, but the two races it closes are timing-dependent and I did
not reproduce either one.

One known gap: driver_read_area still reads the GSP producer pointer
with no acquire barrier. Gary Guo's barrier series puts dma_mb(Read) at
exactly that point [1], so let's just wait for his fix to land.

[1] https://lore.kernel.org/all/20260609-rust-barrier-v2-4-30fcc48e1cd0@garyguo.net/

Joel Fernandes (3):
  rust: sync: completion: add wait_for_completion_timeout()
  gpu: nova-core: allocate PCI MSI vector during probe
  gpu: nova-core: add the GIN interrupt tree API

John Hubbard (14):
  rust: pci: expose the whole interrupt vector allocation
  rust: pci: expose the allocated interrupt type
  gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
  gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
  gpu: nova-core: allocate interrupt vectors for the serviced subtrees
  gpu: nova-core: add an interrupt delivery self-test
  gpu: nova-core: dispatch GSP events instead of discarding them
  gpu: nova-core: match GSP RPC replies by sequence, not just function
  gpu: nova-core: recover the GSP receive path from corrupt framing
  gpu: nova-core: bound a GSP wait by a single deadline
  gpu: nova-core: drive GSP events with the SWGEN0 interrupt
  gpu: nova-core: retrigger the GSP falcon and clear every latched cause
  gpu: nova-core: add KUnit tests for the interrupt tree and HALs
  gpu: nova-core: document the GIN interrupt controller and GSP events

 Documentation/gpu/nova/core/interrupts.rst  | 686 ++++++++++++++++++++
 Documentation/gpu/nova/index.rst            |   1 +
 drivers/gpu/nova-core/Kconfig               |  15 +
 drivers/gpu/nova-core/driver.rs             |  54 +-
 drivers/gpu/nova-core/falcon/gsp.rs         |  71 +-
 drivers/gpu/nova-core/falcon/hal.rs         |  32 +
 drivers/gpu/nova-core/gpu.rs                |  28 +-
 drivers/gpu/nova-core/gsp.rs                |  17 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           | 286 ++++++--
 drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs             |  13 +-
 drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
 drivers/gpu/nova-core/irq.rs                |  99 +++
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 328 ++++++++++
 drivers/gpu/nova-core/irq/gsp.rs            | 254 ++++++++
 drivers/gpu/nova-core/irq/hal.rs            | 215 ++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs      |  30 +
 drivers/gpu/nova-core/irq/hal/tu102.rs      |  29 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 425 ++++++++++++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 drivers/gpu/nova-core/regs.rs               |  95 +++
 rust/helpers/pci.c                          |  11 +
 rust/kernel/pci.rs                          |   1 +
 rust/kernel/pci/irq.rs                      | 143 ++--
 rust/kernel/sync/completion.rs              |  34 +-
 25 files changed, 2737 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs


base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-patch-id: 63224325d5ec73f06517bb35f8c366a086bbea19
-- 
2.55.0

