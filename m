Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC41FECCD
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966575; cv=fail; b=jMWyh1WNFKS3C9QOfcXQluGJA1Hbf6Q4oYCr6V40Td2y5riP2mcvbHQS8ItCdYq5qKh6/6hYhSBX7sCG64c+bvNqk2Y7R39xP8+FG5EGukPqTs2DBQxXWyuVhHfCGWIZqzFH15ty5lVPv+OaPSJ0FjPmXSh5onkzoHoocs9Ttdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966575; c=relaxed/simple;
	bh=jsnbKZ9PuCwg6rV1iV2AhZEX6q0OtBvf2DMk6vRt1dk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PCQ0myiPbiaXQK4pWirVMxPGD+4sLtjq33CHW/ZETXCxdbSuVG7TiI+rm3InGLJy6bdcWdYCfR87H6sk6EvY4YYzqTxyHu5F3r4YlZw3zGrItmhX2lsvrWOQuSJSw5KdBnOf8n5MtQ25OuG4Y7O+oG9t5SXVQpZpD5wjOV/dNWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dRiX6SXc; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRiX6SXc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rmvc5uP0oroqvClx84T7MyhsL3jneSRhKtYrMK9/erGu4Cv9b82zg/LPADLgbZo8mGY38cN+SNWI9SGiDjZsByF3Wxxa0taveSuFZeufm0I1XiJM+MJcofM+0eFJ8y5qIQTSH8zv5qb6eqoY3Zu9AnwIDWWWmHlue7EMcyoC+FTW8g154AVXciaQUL73QEzGnwRRnKOlEg2hhZ+SKM1nySVNlZlEyEErbZ643WNYd0WwOJmUrmttt0F0o/P0ENqU5g9VjGqVhVZI2b7DEnz0Qt3+ASWqENLbgmvVAkObZwFujUOKfRC1xNBS8Q/1bQfTiNmQS3uX/FYGxy2DDie33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaSi/1X8Aj9v8MJ5iY8dIN196q5JwEAp6g5Ik6Hdl8c=;
 b=sgHJgexylMF2Oms8aVGvIbV/4nAOArcSO70/3DCKBMrRdsTQ/ywXnZ3zt6Y08SlcR2Di6fcaC0amW577nMjBVtkT/u04MuLLtCRr/UuyhFy7eC1SerZeuYxNn0IpxNIEG9Reef40YdHoGOmrI63/EZ8ObpowqK3h9UnupHQ3qth5kiAOTD4BUZpfc+sJVJmTmE7K3N1WUmSaMHpO9TWNPJlD5oIX9OIHF/5+xpIoKdjTY0ugb3yC9UwuhZjYTmq+LiYlqH1Wv7MVKPGeJSmq8oHAUu7PkFm2YUUPHTHNnwZVcgQ0dSG6djl99kCctZvpcWzagM9eRZZ5H3Ws7zFxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaSi/1X8Aj9v8MJ5iY8dIN196q5JwEAp6g5Ik6Hdl8c=;
 b=dRiX6SXc+diV5jYmBGUvPCyJ1bZEXwnSqvh0eTbsf3ToFd6OPkuEzYb2HS2ty3F+h6Q7UBn02Qit7Azf+ByNh+LYy1biIjzEMDopd3HA3D1FplbL5V+l6KUVVA0exXD7QhqsZcXHdQXhkHMWSBxtPLGwfwTgbJjKuXDLuEuFPKW9X111tGxd+HCgSyLfZXUCooSQDxdtJij4zzCqbvJ15ckDllQyztzHPxLhqUF2Efd6T+rmcmjItN2VB1Aox8Rq/w/0zUbRXHctXXqdFOLtteXlIuKUBcBIMFdvowCa5OGDgDjlcHdubou1MdLCu7PEJpzTAoQS4QtdhB7z/d5qAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:48 +0000
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
Subject: [PATCH v2 00/15] nova-core: GPU interrupt support and GSP event delivery
Date: Fri, 28 Aug 2026 18:22:28 -0700
Message-ID: <20260829012243.496697-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 118baea9-8d31-47ff-249e-08df056c091c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	cp9hJvoF1ZEQibA/uHvOQNfddvROJxYaXET2L/9G7kG22qp+81+qQ01oN/p2ak9ejp4ZK8wGBtKWkVJ2awTpe3jJztPFLA9BmnFZrDk5Ko/cW9PtVF18H7SIL2gTVaXIk/hEJIAYbdRcGnA86R6TE4b9QlfI5bYx2d1gG1l0D/L0ty6nes+qKlMBjD8ugluaazhlq1/9xooKbpYJ8Lf3RkPbd4jQysMlEajiQZNbzFHc95SvzzqISNDSkRmO6y39QN79UlhWRrBXQUfaVvE6qpcReBFooa4bejyVSMY4CCpGMHvjQpDJwNpz/Y8Zve/UKHQPI9Qd5UjUY1FJxfyCRVGHaTyDEdCQ8kOOUCO7tfY/ulatLBuqM5JzB9KnUeevbREW8G7n8i9DUNq3KnbIlSPlA7rK2Cwvcum7kuXFtuwjT6RNUn8HU4TXLYUo7gjY9q4SWJGkoVHnlFuruGfHAlZU99jN4a795EX9jsBEHPdmQ4AUGNvdP4kD4tqbmLiRrHhsuh1ZXbGgMLjp4AY+cz2qd68Rd7ONJUSqkOXwDRKrihirCJy1bmDp0UJxDkUaOG2HLW3d3reopxMiRvxC/1brwnsGHYIBLDIZp09T19tXlpGpbNAkwFdc+WMLQHhlEzggIS9Mj51GnguRs5+QD5gkIfsbcmuUN+Qw2weQR0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQtvEx1n3oq+RTVmJ9W6GtqFad1o9gxoiTMZ5GuN52C8CKlGXXFoIuYAM3Qq?=
 =?us-ascii?Q?c9GxsJEAr3PsWo3tcLgYyjqb3T7E/r4ODtj686qAQrnDb9PbbiwE9bfnMcAw?=
 =?us-ascii?Q?GNlg9bRvn3liC4L5d3jRPhgiEVb+hUT5VSzqdRFu41+DVMZ4lcxgdl4Vdslc?=
 =?us-ascii?Q?r7U+bbz42jCO0DQm/iiQERrgfdkgtN5lHlYpG5PzocUbA650713/usuFPFlj?=
 =?us-ascii?Q?g9nvRWqWuZ2LoDeC5oklOlrIS6A/WWT/c5HsDUD2ZbvIiRYDPVoZzhwAL8HK?=
 =?us-ascii?Q?Ov5VJN3cpKXHPDzsoSSGSJYSEELHTsXiWPxYsSvpgP6Sf8BdNQMjtl1G4fgC?=
 =?us-ascii?Q?ybbMpChCT4BqdK5u2y3cGPa0zwowYdWXqRFEwsmwJr0zDOayBJ7bh4hTDbby?=
 =?us-ascii?Q?E8q2JtLCU55aWnYca1U/y5XFhNGp27DKNkm1QMBM0CtaH8gSEdfA0Otv7R9A?=
 =?us-ascii?Q?jOAGxgrTX3Hr2CiRIG8QN/wOx4pQg/tXFCD9G2IEtVnKXn7ZLJ3uE7vtqMFO?=
 =?us-ascii?Q?bxaC55WHTWCYxVWVIm3iyD2rjMPMWece+gQZI8Eh5diXhfW99KwL3sjB32qf?=
 =?us-ascii?Q?lIh3XRhjKbFNm1egkD/jAh0E1upyg/yoYjhr69YWecIY38uDc+5IaUA3TA7u?=
 =?us-ascii?Q?E4ycqCWoHik32eB/fE1ojGG3L3M7WZwWfn7vb8ghQqziBxcoM7U97uid9aIQ?=
 =?us-ascii?Q?HL5HC4Xmolo/ErgWshZhlG/8KWKrSq7rv9rh1b+C0DqrEfe4/gT3frY3eFkU?=
 =?us-ascii?Q?IuhM9SxBTY0NRDl5ugPk4b84D3WJaOqgFC0bfJoaH0fvN1UpddUiCMsQPXaR?=
 =?us-ascii?Q?zhFF0mirsKquQRDN1I6JXpMD7uNKgBwstl/zL79maTeBhvZlULglvbxbZUaY?=
 =?us-ascii?Q?Kx1sE0Q4VBnXM6Uczp+k9GzDLb5EqlrVAQX1zdarCITgEjCNROfP3XWsBMY4?=
 =?us-ascii?Q?O7tUF0bjq81Mqv5qDXQ6v9s58FxCyvHMNWJYflhSvgk/LrM1+u8C63KA2vNu?=
 =?us-ascii?Q?kst5CRotlP7adUfjY2JcFTR4JNGthINUS7JgkbNufRp8ojGZhtdtWOsiU3kS?=
 =?us-ascii?Q?0k6+TG9qmn2I4IX1f1JXkg6qUIDVpQtgWkCsR7p6lZCLK74Nfbl0k69B15ik?=
 =?us-ascii?Q?dKbERgcZ8nAqHnik3gqoA1xYtvsxPbm05S2nVqbhEFOBdYZIJzl0sFlJsQV4?=
 =?us-ascii?Q?kU7ibLJVz/EzOQJOxUxGipHMbSrmq0hbzp9Z8nZJMKkXU7FdCO9wUmL92sai?=
 =?us-ascii?Q?cnTlM6LrjsJtJbWlpv6EdsKO//+x1MhVYsn/mwFWPwJK0geXrhUtRERVYEn1?=
 =?us-ascii?Q?8NzmgYR/r+wao954cN2F+hl9LfsGAqhTQ7brzjIN4iMqL8xnNDo2VnhBeLLL?=
 =?us-ascii?Q?niWEtwAbBBcNjenCW+/m8O4/b+mVwPcGPiCxZ4wL1Va0oTlIOv867uslrHzs?=
 =?us-ascii?Q?hkQft4PcLBn6xEJlVQAjhGzT3oRs2tuuTjIRaNeDXSE1EkfYVpmrRd6cqW4x?=
 =?us-ascii?Q?S7UIjvTg+cRZk98L9qSPYhb5DxnISgHSb0yN6GYLUlLCEI5IY/tkvoEaO5fX?=
 =?us-ascii?Q?FMR4qDcGuhyY3u0ouaX57jjd0YAhgH4qdN9EIJ1iHyYHPs1eGWWJPV+h2P1A?=
 =?us-ascii?Q?lY+X0WibIDdDH7L3IgMpeV17TGWqgwyiRz5TUmDPDcWBKO1DF1oipSusD0Fc?=
 =?us-ascii?Q?f36zPR++ChxZGx7WOgv2cQFd9OfjjXt+dnYG3lat2Qd58JkJD4kJle8QSOkH?=
 =?us-ascii?Q?lDIxUqhgMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118baea9-8d31-47ff-249e-08df056c091c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:47.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lR6RyKXm4i0YXvZciZypfPBwIm1uuZsjhAOB8Do6N2dCGWCMrH15JsRgYXtNXbpS1OdHhyLgxEJuoHflvRa7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

I'm posting a v2 because there have been some significant changes, as a
result of the v1 review, plus Danilo's new IRQ commits that I've rebased
onto.

This series adds support for GIN, the GPU Interrupt and Notification
unit, which is the GPU's interrupt controller, so that GSP events reach
the driver as interrupts instead of only when the driver polls.

The design uses a threaded IRQ handler. The top half touches only
GPU registers, while the threaded bottom half drains the message queue.

Fine-grained locking is left for a follow-up patchset, I'm working on
that next. For now, there is just a big ugly lock around anything that
even gets close to the GSP message queue. :)

This is based on drm-rust-next, plus the six commits of Danilo
Krummrich's PCI interrupt-vector series [1], which I've cherry-picked
from mainline for now.

There is a git branch with the patches as applied to drm-rust-next:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v2/

Changes in v2:

* Rebased onto current drm-rust-next. The PCI interrupt-vector rework
  that v1 patches 2 and 3 proposed is in mainline now as Danilo's series
  [1], so both are dropped. This series carries those six commits as
  prerequisites until drm-rust-next picks them up.

* nova-core uses the merged API: the driver's device data owns the
  vector allocation under an explicit lifetime rather than through
  devres, and each handler takes an IrqRequest for its own subtree's
  vector.

* Dropped "allocate PCI MSI vector during probe" (v1 patch 4). What it
  added is replaced by patch 6, and its commit message justified MSI
  with a VFIO claim that does not hold. nova-core still allocates MSI-X
  or MSI, and no longer falls back to INTx. (Danilo)

* Dropped the type-invariant documentation and the SAFETY rewrites from
  the wait_for_completion_timeout() patch, leaving only the new method
  itself. (Alexandre)

* New: declare pci::IrqType and IrqTypes with impl_flags, so a call site
  reads IrqType::MsiX | IrqType::Msi. (Gary)

* New: the GIN vector and subtree newtypes. A vector, a leaf index, a
  set of vectors within one leaf, one subtree, a set of subtrees, and a
  leaf count are separate types now, so a leaf mask cannot be passed
  where a TOP bit belongs. The HAL returns a LeafCount rather than a
  usize. GSP_LEAF and GSP_BIT are gone, along with the
  LeafIndex::new::<GSP_LEAF>() calls. (Danilo)

* Merged the tree API patch into the vector allocation patch, and moved
  both after the HAL. Tree owns the BAR mapping, so no tree method takes
  a bar argument. The Leaf<Idle>/Leaf<Pending> type state gives way to a
  LeafPending newtype that only Tree::read_pending hands out, and enable
  and disable are Tree methods. (Danilo)

* Added LeafEnableGuard and TopEnableGuard. The self-test's teardown
  guard and GspIrq's open-coded destructor are both gone, and probe no
  longer needs a separate interrupt-enable step. (Danilo)

* Moved the GIN and MSI EOI register definitions to irq/regs.rs.
  (Danilo)

* 13 KUnit tests rather than 14. The tree tests now cover the newtypes,
  and testing those needs no BAR mapping. One test went away because a
  leaf count derives its subtree set by construction.

Tested on Turing, Ampere, Blackwell GPUs.

One known gap: driver_read_area still reads the GSP producer pointer
with no acquire barrier. Gary Guo's barrier series puts dma_mb(Read) at
exactly that point [2], so let's just wait for his fix to land.

[1] https://lore.kernel.org/all/20260813165234.620555-1-dakr@kernel.org/
[2] https://lore.kernel.org/all/20260609-rust-barrier-v2-4-30fcc48e1cd0@garyguo.net/


Joel Fernandes (2):
  rust: sync: completion: add wait_for_completion_timeout()
  gpu: nova-core: add the GIN interrupt tree and allocate its vectors

John Hubbard (13):
  rust: pci: declare IrqType and IrqTypes with impl_flags
  gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
  gpu: nova-core: add the GIN vector and subtree newtypes
  gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
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
 drivers/gpu/nova-core/driver.rs             |  55 +-
 drivers/gpu/nova-core/falcon/gsp.rs         |  71 +-
 drivers/gpu/nova-core/falcon/hal.rs         |  32 +
 drivers/gpu/nova-core/gpu.rs                |  28 +-
 drivers/gpu/nova-core/gsp.rs                |  17 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           | 286 ++++++--
 drivers/gpu/nova-core/gsp/commands.rs       |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs             |  13 +-
 drivers/gpu/nova-core/gsp/sequencer.rs      |   8 +-
 drivers/gpu/nova-core/irq.rs                | 105 +++
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 298 +++++++++
 drivers/gpu/nova-core/irq/gsp.rs            | 232 +++++++
 drivers/gpu/nova-core/irq/hal.rs            | 192 ++++++
 drivers/gpu/nova-core/irq/hal/gh100.rs      |  31 +
 drivers/gpu/nova-core/irq/hal/tu102.rs      |  30 +
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 615 ++++++++++++++++++
 drivers/gpu/nova-core/irq/regs.rs           |  71 ++
 drivers/gpu/nova-core/nova_core.rs          |   1 +
 drivers/gpu/nova-core/regs.rs               |  24 +
 rust/kernel/pci/irq.rs                      |  68 +-
 rust/kernel/sync/completion.rs              |  23 +-
 24 files changed, 2767 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst
 create mode 100644 drivers/gpu/nova-core/irq.rs
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
 create mode 100644 drivers/gpu/nova-core/irq/regs.rs

-- 
2.55.0

