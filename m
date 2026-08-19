Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3430F7FF
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111552; cv=fail; b=Vy0vjb7gNetpSFSt6flGsE/ujGG58deq2wZeLHRGf8HHeOP3fHOrXdc0aNHpNoBT8u9Tifp3KApa11yS9J/K+Qw39M4reuq6qiO7xlLiaZRSqk6vpfbjdHXstNt7nl17ll6NFi8K4YrEnlegDAhlrb0dftsVbmfZCtHFS4NwXmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111552; c=relaxed/simple;
	bh=YzpqdcRBK3hp1bsiCC7sErqDM1NvkpIeDDsVqxA/tE4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jIcMaB/eXtzv9ScviBxkFU9EjFnt9uFL3/rnaaJBmLvre6+HuOP2PVXlR6vrEhd0ZkXKEsi4zAJOhyF4MJ2DDfvc3hnDww0XeTY0pIIF6yAobV+UfvNDaRj4+MyvaEqa/NK/0jexJsc3fdfcyHnUrE+l2Rwy7DvgOwRnfycYt0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jV/IOU07; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jV/IOU07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKlnfzskqD+Gepcq+dUxYdd8WmIy3yJ6A1rJeFsA1HGbPg7wOVfQzgRZMfuC5lQ7J9eBc3B1oib4MC0wc9TEji8jq4ufeUva0q9C7+rJ4vGfMOXEbbecOhHAX/kt0Wor/1Mc1PRru6Y4AdiLdG2bp+TtmqaYaUYuM4TmsC81QJfQySWtPwq3ZRbZQ9Xe4p/hJlOb2gseghq1LW4VM4qlyLRwbf7+v0Pu6Xf4nvwk4UANyoEY1pajuaPL5je3YUupCQ0ILkm+PkaRxLtBXcMxjun8qy+A5MOoZE/vvC4dSHZgr8EC2pTR501ljbbrlZTAeWpK54WvUUxvvkAvddMOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nByeQmX7J28u2hE/kAu1aCHPgrfD/ydqxFxXTGovaNc=;
 b=qsoGgq3yohKc80MpMMJvMWudHhL8MTgyVcdZGpODkfPJjBoww/zlhd3A6Umx/Q2ZIni1XF3vMJxs2YrNnPmKY6gP64wbxdF3v8zdRo1vPkasnmTTRMUZf0ptexa6dRlEoILOf6fXyHQjszHlPIQs+qPVLnW2EBHjHnrhIwKtu+6Fnn6RhTkwTtgpE37Ule/JTqmntHiTrIKs/LiT5PiD06ROGQTG0Uchv1jAF5rMwCsuhHo4EJqZEvJP1nHlFkY09IfsKYf8/qoW87BfLC/YLk501nUDXtQHLnsuiJ0VjXoXZTKQ2Aa4R0TJOx45WMnBruPs7+mh8lit3SUg+dOEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nByeQmX7J28u2hE/kAu1aCHPgrfD/ydqxFxXTGovaNc=;
 b=jV/IOU07aaa1zU/oJKYjnwMxfDWyJNJafCsFUXISfmjFi5GLsfwlC65cXgGWr5LtVNxdxGXY9fgBGMvrIrsiYCIwToJ5ojeF6haIRDVZ//emAlBrBDzYdnyP+rNVz5tHUpFJ6/yunYFyvjaJeo9UgF8suJXanbzEdW/Ue46URWNCsoroENpoBIaj1VHz1tWfFefuY+heQfTOSHn3wsyr0lf+2SLyqeEUF5wjf6jhAbFfchR49xUon/pvuNO3s801Emi0o1p7LB6ljI4aKwtgbp0XjYgTgg5FTn/AwZ/1gsTOxs/RyN+UiTKWENvmL5W+m0q5NJumsBndSfEbYyzpyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:23 +0000
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
Subject: [PATCH 00/27] gpu: nova-core: boot on the r000 GSP firmware
Date: Tue, 18 Aug 2026 20:51:53 -0700
Message-ID: <20260819035221.336390-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a7ab10-7b57-4cc6-e38d-08defda546ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fDEVhkzKtCAnj4v0PIzKLP/W9AAGctc4Wql4c6/25skWnea5A1fjNluXOR1fC3Pt5cArxi0VJn1IHytTSKq9IoKsdl+F5fCb3LkZNdI24IYslCZB5ataMTOfIFLBTQpUo5TMchMC3XDaNO7lUuzRiQKiH/T7M3yGzwO36c1Er4TZhmwDKD1HiXH8skCEhgNcBA0pJo7G3QPOhGEQbxTOC2UD2uunxDQ0DU6aD6pHs1IJzCkNSiAFbzHmni7CCghXaMDrOtAHbn7iqapfsI5YDzl57ZmIf9AfNhk0XfaqqN9sjVpCf8wAkqHKl3pBT5+Q41UlXElWbF+HlnVO2yG/SJLyCEjttn/nXPMK2gI0h1KyJWmMavx4z1QnXGW9AYV6Z7gwcvonz0D6sUepsANU/N2qfTztReUiP0kOAQCIMEmrt6TwUxHZ92Tf4J9QnvFciX/IFMPbWQilOMZ5iJMWBrEdaperHCuqqCrjRe5wLEDdjYO0twrvLtSzfyl8nOEie/eOS8gidH/jmBLdC+LW7IDM6heU0YRtltbqyW3u1A2AWO3CRC5ro2KOPdaSsJHJFma5CkL1x1PEDK1g446UECZ2yE6EIaLYAaz+qbDW+euRSq9Yl0sf7JJoNJWv+hvPdkbwTrl5o2b9Hlmqb5180QST7Jma4CP+pHHp/o9Gzeo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H7Z+ZeZ1wEHIXJuyWqahZCay4jw8wG90/Poc/SHxzXkgy9nOnwFE+VlvEs1I?=
 =?us-ascii?Q?22cxqJ8+9Mp9CUEngMRql40DdW+u+oBipKxuA7fECeRev1T6GFkGx4yX/cxW?=
 =?us-ascii?Q?IKarmU0JYMF9o6SWCE5mJwS5wPU+pUfMybjf8BcN5mLHjy5OJsf0/wcuskl4?=
 =?us-ascii?Q?CCMB5FLX28OXHo+4iHCCiRKeROgRzBvIKEecMOvGBOPNRLvg2QxXL7hcOBF+?=
 =?us-ascii?Q?2AK+49xVrYs0CZI8Ors77G2NGA0zc4PFuyuFtIECDQ1P2piDhNfSK3K8JKwC?=
 =?us-ascii?Q?m7iQo98zzOnxZtKDxsuGK0D/QGg+AYVQleaC0uN6myw0cD/sxEGFwZwo9YNo?=
 =?us-ascii?Q?6aUHw/1LywE8dXaXMCJP/E0oyXueLUr+QxAlTWAYM68vAY8ZarIQYoqY0Asr?=
 =?us-ascii?Q?Zgs984p3vqwfRoZnzmJ8HkqXRzv6//El9z18+zycazhN8s/So/h0SLacXwgc?=
 =?us-ascii?Q?9FGHaK3wSoqtsh/sR1G+ZGfSxrB/oMRBpKRZHYuk83Rppv41APaephGs+qop?=
 =?us-ascii?Q?c4CaJ2ZtlGJibOw3+JvCSO6MEexfpqn2+wB3RNEVcoraoCEDM/+3W7gyFxpL?=
 =?us-ascii?Q?m2QAKtyy8eq4cGwmsB127EXr8mcvFp7CAE8JxHWvjyuWS2LtG0Ilj435V0zm?=
 =?us-ascii?Q?+SZbcn1AqjGTj9oTNTyVeSBYii5q7vismW/kSrb6OYLRLJYswaom0jUWmV1J?=
 =?us-ascii?Q?MCcMHK24UjaerHk6+eQg4pVOM/SYfq+SqMO0cNDPA+gg/+bI7Pd4vxL3btnl?=
 =?us-ascii?Q?OWws5kjwFhOLIwDMclJfeslg0MkQtlCM8rqQCCSdI+8R61jZZNEJfnkiVV29?=
 =?us-ascii?Q?pqM2TEieYVyL8TaysDPGTvvQUOjy/c5YBe4kKwv9vDeo1iKZho7wRF0tc5JU?=
 =?us-ascii?Q?Tx8ZznDOTNCaOOyZ03JMG8d36rKyp+R/K5/F8VIIDWTtZVamx5k1ZhLNFHtK?=
 =?us-ascii?Q?g1hFBqB7ZQERY/hdDt6EdRE3xds8G1eGsDGG7vYxL9l6MzoPWg3V81lGbmb0?=
 =?us-ascii?Q?J0tQSR1CfrZS5VfC6y8lzmxdv32DtMq/+cwH6VRDj8Ng3EJs/1WpII3if5nz?=
 =?us-ascii?Q?Wg2e0/q7ThZJ9t8otF258mGAMW71bcK1gr4NmTJRReSeBp0ZpCqipigbQkXC?=
 =?us-ascii?Q?DBYBtZN8DnbEYg0a4b13WU9Se+KkwrsS9yzCq7xlx0aJYjHWjPFup3jPYoWQ?=
 =?us-ascii?Q?UTRZEcpRNt/ocMzvZpR80AU+Js4qN5+wGy5wGjre9yTzi3ds0/qJIHdrn2Pf?=
 =?us-ascii?Q?P2i1gjjzcvmCwm6REgkV/D6gSx9yi3eIzDKd3kyvrSlhQTERFzlHCHmPIDcK?=
 =?us-ascii?Q?rXRb1QI0idpwGTTHoZIA0bClGANYQbwEbyU9Lrp7NAmhj7Ogu85v3imdlOk1?=
 =?us-ascii?Q?GwiR+MUSPHjUAB6oo2+e8fTioGgCKBUQY+VA0Nnz3C+QrMR1cfg8sI+HcynX?=
 =?us-ascii?Q?fbIIuD4uQdQPVN2mCq9K1+x/t3V6EbJ/YadhX0X6lIQ3qs5LpO2ktLS/mzkG?=
 =?us-ascii?Q?Lhme7AE20EUsBdCj+0IE9Bztb/AXnqhBdzyEIrCah7ZdUW2BOLll9RKWAANS?=
 =?us-ascii?Q?/IrvMPiZa2O+hBA/XriPdKSUADOEVd3uXP9a4u1qvXkf/rpzOBp0tU4CIKGP?=
 =?us-ascii?Q?0O2ferZe10js7E2XQSOYh3CoWEoaPwS3r/wyaC0e/Hp4D3NHvXpKvb/6qA4h?=
 =?us-ascii?Q?Y3oAhgAB8UIf0AUwGajCN4Tsa5pa11eQompaDDrlpepjqs0cVThAW/vC6HFN?=
 =?us-ascii?Q?Hz7PjnFMOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a7ab10-7b57-4cc6-e38d-08defda546ba
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:23.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iBsBg+MibRUBxNLk5zsR7y1iudAebm1UHNlxSs3hWs40yXWf0+yF+FX5+yISg2tkK3j0bJUptwpUGGn2zzOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

Nova-core boots the 570.144 GSP firmware today. This series moves the
driver to the r000 firmware ABI, which is stable across releases, so
firmware file names no longer carry a version number.

The actual firmware is not yet publicly available, so this series is for
early review, and should not be merged until the corresponding firmware
shows up.

Beyond drm-rust-next, the series sits on these patchsets:

* The GIN interrupt controller series, which needs Danilo Krummrich's
  PCI and irq rework and Joel Fernandes' wait_for_completion_timeout().

* Eliot Courtney's NVKV encoder and decoder, which GSP_INIT is built on,
  and his Vec::push_init.

I've created a branch that has everything, for reviewer convenience,
here:

  https://github.com/johnhubbard/linux/tree/nova-core-run-on-r615-or-later-v1

Patch 25 makes the big switch from r570 to r000 in one commit. Before
that commit, everything works on r570. After that commit, only r000 is
supported. Patches 1 to 24 add the pieces the switch needs, and patches
26 and 27 delete and clean up after it.

Tested on TU117 (Turing, T400), GA104 (Ampere, RTX A4000) and GB202
(Blackwell, RTX PRO 6000), covering PCIe probe, chipset and GPU name
readback, the interrupt delivery self-test, and the KUnit suites.

Also, the vGPU team has tested an earlier, nearly identical version of
this patchset (minus the cleanups at the end), and it works there too.


John Hubbard (27):
  gpu: nova-core: firmware: add r000 bindings
  gpu: nova-core: extract radix3 page table into its own module
  gpu: nova-core: set MCTP transport header version to 1
  gpu: nova-core: add Falcon helpers for r000 LOAD_EXEC events
  gpu: nova-core: zero-pad radix3 page table levels to page boundary
  gpu: nova-core: distinguish async GSP RPC traffic in debug logs
  gpu: nova-core: add optional ucodes firmware loading
  gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
  gpu: nova-core: add build ID headers to debugfs log buffer dumps
  gpu: nova-core: rename the FbRanges elf field to fw_image
  gpu: nova-core: regs: add msgq v2 BAR0 register declarations
  gpu: nova-core: gsp: add msgq v2 internals
  gpu: nova-core: generalize allocate_command() for variable headers
  gpu: nova-core: add GMC API message types
  gpu: nova-core: add GMC send path
  gpu: nova-core: add GMC transport receive path
  gpu: nova-core: gsp: add GMC dispatch on receive
  gpu: nova-core: separate the generic falcon bootloader from FWSEC
  gpu: nova-core: handle the r000 load-and-execute HS binary event
  gpu: nova-core: handle the r000 load-and-execute bootloader event
  gpu: nova-core: gsp: add the GMC boot event dispatcher
  gpu: nova-core: gsp: add the GSP_INIT request builder
  gpu: nova-core: gsp: send GSP_INIT and decode its reply
  gpu: nova-core: gsp: pass the remaining log buffers to GSP-RM
  gpu: nova-core: switch to the r000 GSP firmware
  gpu: nova-core: gsp: remove the retired system-info and static-info
    RPCs
  gpu: nova-core: firmware: delete the r570 bindings

 drivers/gpu/nova-core/driver.rs               |   2 +-
 drivers/gpu/nova-core/falcon.rs               | 152 +++-
 drivers/gpu/nova-core/fb.rs                   |  18 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs         |  25 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs         |   5 +-
 drivers/gpu/nova-core/firmware.rs             |  44 +-
 drivers/gpu/nova-core/firmware/bindata.rs     |  37 +
 .../nova-core/firmware/fwsec/bootloader.rs    | 112 +--
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 215 +++++
 drivers/gpu/nova-core/firmware/gsp.rs         | 124 +--
 drivers/gpu/nova-core/firmware/radix3.rs      | 145 ++++
 drivers/gpu/nova-core/firmware/tlv.rs         |  56 ++
 drivers/gpu/nova-core/fsp.rs                  |   3 +-
 drivers/gpu/nova-core/gpu.rs                  |  23 +-
 drivers/gpu/nova-core/gsp.rs                  | 284 ++++++-
 drivers/gpu/nova-core/gsp/boot.rs             | 549 +++++++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 792 ++++++++++++------
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |   1 +
 drivers/gpu/nova-core/gsp/commands.rs         | 293 +++++--
 drivers/gpu/nova-core/gsp/fw.rs               | 740 ++++++++--------
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 200 ++---
 .../gsp/fw/{r570_144.rs => r000_00.rs}        |   2 +-
 .../gsp/fw/{r570_144 => r000_00}/bindings.rs  | 548 ++++++++----
 drivers/gpu/nova-core/gsp/hal.rs              |  22 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  18 +-
 drivers/gpu/nova-core/gsp/regs.rs             |  30 +
 drivers/gpu/nova-core/gsp/sequencer.rs        | 379 ---------
 drivers/gpu/nova-core/irq/gsp.rs              |   2 +-
 drivers/gpu/nova-core/mctp.rs                 |  18 +-
 drivers/gpu/nova-core/regs.rs                 |   8 +-
 30 files changed, 3131 insertions(+), 1716 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs
 rename drivers/gpu/nova-core/gsp/fw/{r570_144.rs => r000_00.rs} (95%)
 rename drivers/gpu/nova-core/gsp/fw/{r570_144 => r000_00}/bindings.rs (73%)
 delete mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

-- 
2.55.0

