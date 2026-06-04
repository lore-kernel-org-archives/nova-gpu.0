Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595D3F1678
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573468; cv=fail; b=Q//IZ+BWLLDW+cXoKssE/ZUlpgpOnb1djfPSzdFHGV9IUNUdvJqFMCt2Q57f1WVuN6Qw+fHePad667nuhjMt33ST26qlq67Fn3yJzldx1NGm26usCY+a93D/Og7niXH6iUupHRItWOofPKT1fEgfRjePbKyqCE9myVeD3g/YJKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573468; c=relaxed/simple;
	bh=dWjwzHO60uFo0ZwgMJ4q5GEu2A2DU3UFvG5UOE2wNe0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UHZ9dbOpZQ0jMHK8ViIQa6jlgbyzSJXChVwcRl+ffCDK11eW6gWee3VYy5HikCJx7wXn0H5f/QSdk1Mcj0VpSXEtj9a9Bo5wfN+7aFhZtqNT1JJ6Elo1mlcBmxKygHQyzsbxO3oakE3OZ4Az0bq0pmIgwJ4kcyiYhTsLINgeiB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VAecZWMs; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VAecZWMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqe4hRUXGthEMM4MjwTQdEycmHY/6RiqwTBbi42Ibd+EBXhPVQ7sODJ4PIzOKnlWCvhs94Zs6RiaLLxMeDw215Ol9vrkh+tmW4b59mJQkYo9EJhwi4CW2nidv+gx+QnPtWWTfnWMr+Gt3+aZebVVCu8TT81c/b2gB/MoV8ym9U1TPutL3ZUn6MANVBI7UPCYVeMWWKupj9iQQEYY0qYUO7jt8AGJR3j/J9sYFndkO+ssnsbubfWxHFe55jPl+7j1yZf4J0QRhUv/KZSNKXLNDu8qu7nmtchDTusAMADhouu9k/JFk3ANa/ZaRMObEkzjwVaMKIxZ5hVCqHksukgA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxIFkYXLYQweCsNPpM4Mjo2B4sJL7VZHGhmGiKJwL/g=;
 b=ZTIf//UdPi7LwfjzzLYt737v66U0bF2xa+HcUJj4bGLhwtQm72++Ydnl4lmHzuTi5qowkdp9IMXJ73mOXOAopMm7BoK1prA7w3Yc48+TNRLcncQcPBTGn9h/OB8pUEKdZL4c69qOROw0QQvmVf4SYlPUDujIyZLC2NHyeCioDdkiOJ6GhVM0Np8qPqP51pcN7rvv0JyfykIoRAE0GiEAK5kqCTbfQysEnDHR7/MYiWyhK5xuOFIR54QrGEvPJAmtzDc+DrIN4QgprfMclF9qyuIWR0HLfwUHKc+xbhSEM5RJVRy9n2ir1O0/gqD89m9hYe357TITKPa9ZoDAuoiPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxIFkYXLYQweCsNPpM4Mjo2B4sJL7VZHGhmGiKJwL/g=;
 b=VAecZWMsPPzjFZMPJcuAHEuVR7rRJAP3efzh3ZqAjnKxttK0s6mef4GJaAhsqsVb4uE2ErfhvGtsPE/85Nc/+Jeg3zZP0G2FnAuXguk7OLqDBd6rlReXV2FQPkZA1P4ubsbJcqqsZOlOJIqwyoU8tcAU30OWqx8bJURgICfRekt0vuMGoFbp21ZNvLNYEgxFKk1COCSh1Kzi74+6YDXz05a/8o0lc79mW6+aRtXrGS/U4X3l8pGY7gMVqLWoQkNNCeu6HRL4n4Y4VpCmUvfCypCbjDT3MbcCbjFgtaYbVBVPK6RlEfEUVghEa2RZWF+JEOPZGZeYbIPjcLnJy/rA/Q==
Received: from BN9PR03CA0197.namprd03.prod.outlook.com (2603:10b6:408:f9::22)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 11:44:15 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::4d) by BN9PR03CA0197.outlook.office365.com
 (2603:10b6:408:f9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 11:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:44:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:43:57 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:43:57 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:43:49 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 0/9] gpu: nova-core: boot GSP with vGPU enabled on
Date: Thu, 4 Jun 2026 14:43:30 +0300
Message-ID: <20260604114339.1565660-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: db5c6054-6278-49e9-4c73-08dec22e9a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700016|6133799003|13003099007|3023799007|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rn39DoyPQhbAagKWB6fOwx/If+qddZSXivNMG6NVWn8urJ18tlPiVLx5VexPbEDeNs3bC3jWJLMW7G9O1univJtpFHvAOqbHQOM5O6oRXKoFdsRXVILkfwMPpFP/AQ6JTth6reOqwbR59Tu4lcvA/KPAwlJtkYzN7wyvo+6Sq611HrCKVho3f+2/5ZJV39E4fyWM2ouxZ2naxkmwSm0SGqAkNzk6C4Gjub+4YpzVkVISrFd3rHnmd5/A2umV+QiPXDXHp28gIu7gB8cMfTiPF0eFvI9J403Da3+fIGntE73H3QoRobUesC3JFWw1Dc0RicBOEz58BKD2qWW0gftYWPphffTEztHAfU4KpM3YR8NAD6DwwbDN0z+BW2Nyikc89mA2xCCu9PhahcqNeaNjW1eKLlN5/s+QGRPf4z/1kdQlAAPHfApYnirWfJeFU0m/hxRbqR82uqeNS4+T5LOhAQSi0seuzHf+/4QSqjJZlrFiWkLgfpUFvajOIAqz1b01DCdrs7zPEHb4IQYuDDvqqAcwVhFQPd35eZUmEFM92ST/f5UlvgmZdKENuR8UutNUvhCBiE0sWFzrFFN+KK1mlFCvB3eZCl+h8jhFykF2YrJj7hm9VqPbD/XPkj3h9xYgWPGK+C4r2nFecE0/7eoElG6Ds6WV+qEccQ7KJRyAJNBcODFsdpApv9fcAJ5/riONt8hRwCZSJ0tYYk00txvQIWCo07vPyQqJyCNUABTKDiQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700016)(6133799003)(13003099007)(3023799007)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MAJfwKNCylbQQk3Q63krmC2KB/zZKqW8he68H02tOn7k9Weshq2AfSf48G7qiiGrTNV/057b2OFrEC1UN4q3uhbSiviPj2ZRWfghVOS8eIzwZotiNEhS5G3K0QNRr8dh+3UxU71oqnAbRfijz9FAQgK6Xl0p5/n08lk/sZsiHhQlpSYzAZ6wb2XZk7eEwsh+UYJnVAZrhIJlh95NE2MUKrWnWSlcptSfLbwAzGVoOeXoNbcRJl/kphKKDqeNBVUuZca27pU/zf5C+AQ7ImzM8i35lmbNlLxNSZfVGuYxna7idtykB1lwoI2ZI74NhER4EB7pNvQ2TOBBmI1ZnOymml9EK/N3NToOfYI8TDO0g2FpLVlmNlq+MNzLZAGMe6+GJXlmZSgipDXX8DJJkS5xRTYNTpjK2+9vYacm0+heDxdseTV4FcUaPZYOR5nUFszD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:44:14.8291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db5c6054-6278-49e9-4c73-08dec22e9a8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

Booting up GSP with vGPU enabled is part of the first milestone (M1)
together with rust fwctl abstraction [1] and nova-core fwctl driver [2]
for upstream vGPU support, allowing us to validate the basic GSP boot flow
with vGPU enabled, upload vGPU types even before the remaining nova-core
dependencies are ready. The nova-vgpu WIP patches for all milestones can
be found at [3].

v3:

- Consolidate GSP boot parameters into GspBootContext struct, passed
  through the HAL trait methods instead of individual arguments.
- Add vGPU preludes patch (VgpuManager, Architecture::supports_vgpu,
  GspBootContext fields) as preparation for the vGPU boot changes.
- Rebase on top of the latest drm-rust-next.

Dropped patches:

Dependencies still in progress:

- "populate GSP_VF_INFO when vGPU is enabled" - depends on the
  ExtSriovCapability abstraction [4] which is still under review and
  Gary's on-going io projection work [5].

Ada specific:

- "introduce vgpu_support module param" - select vGPU support based on
  module params.

- "load the scrubber ucode when vGPU support is enabled"

v2:

- Adopt early-return style (Dirk).
- Add #ifndef CONFIG_PCI_IOV helper to fix compilation when
  CONFIG_PCI_IOV is disabled, per (Alex).
- Change return type from Result<i32> to Result<u16> to match the
  PCI spec field width, avoiding try_from at call sites.
- GspVfInfo changed to tuple struct (Alex).
- Use unconditional constructor with Option wrapping instead of
  bool parameter. (Alex)
- Use full initialization expression instead of mutating a zeroed
  value.
- Use .chain() pattern in GspSetSystemInfo::init() for optional
  vGPU info. (Alex)
- Eliminate all magic numbers: add vf_bar_is_64bit() and
  read_vf_bar64_addr() to ExtSriovCapability using PCI bindings
  constants (PCI_BASE_ADDRESS_MEM_TYPE_MASK, etc.).
- Use KVec<RegistryEntry> for dynamic registry entry construction
  instead of hardcoded array (Timur, Joel, Alexandre).
- Replace magic numbers 32/48 with named binding constants
  MAX_PARTITIONS_WITH_GFID_32VM / MAX_PARTITIONS_WITH_GFID from
  OpenRM (Alex).
- Use read_poll_timeout() instead of single read for scrubber
  completion check (Joel).
- Use dev instead of pdev.as_ref() in dev_dbg! (Dirk).
- Change scrubber trigger condition from vgpu_requested to
  fb_layout.wpr2_heap.len() > SZ_256M, checking actual heap size
  instead of vGPU flag. (Alex).

[1] https://lore.kernel.org/rust-for-linux/20260217204909.211793-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20260305190936.398590-1-zhiw@nvidia.com/
[3] https://github.com/zhiwang-nvidia/nova-core/tree/zhi/nova-vgpu-wip
[4] https://lore.kernel.org/rust-for-linux/20260409185254.3869808-1-zhiw@nvidia.com/
[5] https://lore.kernel.org/rust-for-linux/20260421-io_projection-v2-0-4c251c692ef4@garyguo.net/

Zhi Wang (9):
  rust: pci: expose sriov_get_totalvfs() helper
  gpu: nova-core: factor out common FSP message header
  gpu: nova-core: return FSP response buffer to caller
  gpu: nova-core: read vGPU mode from FSP via PRC protocol
  gpu: nova-core: add FSP and PRC protocol documentation
  gpu: nova-core: consolidate GSP boot parameters into GspBootContext
  gpu: nova-core: add vGPU preludes
  gpu: nova-core: set RMSetSriovMode when NVIDIA vGPU is enabled
  gpu: nova-core: reserve a larger GSP WPR2 heap when vGPU is enabled

 Documentation/gpu/nova/core/fsp.rst    | 142 +++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 drivers/gpu/nova-core/fb.rs            |  17 +-
 drivers/gpu/nova-core/fsp.rs           | 207 ++++++++++++++++++++++---
 drivers/gpu/nova-core/gpu.rs           |  38 ++++-
 drivers/gpu/nova-core/gsp.rs           |  27 ++++
 drivers/gpu/nova-core/gsp/boot.rs      |  60 ++++---
 drivers/gpu/nova-core/gsp/commands.rs  |  93 +++++++----
 drivers/gpu/nova-core/gsp/fw.rs        |  16 ++
 drivers/gpu/nova-core/gsp/hal.rs       |  23 +--
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  22 ++-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  31 ++--
 drivers/gpu/nova-core/mctp.rs          |   3 +
 drivers/gpu/nova-core/nova_core.rs     |   1 +
 drivers/gpu/nova-core/vgpu.rs          |  47 ++++++
 rust/kernel/pci.rs                     |  12 ++
 16 files changed, 608 insertions(+), 132 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/fsp.rst
 create mode 100644 drivers/gpu/nova-core/vgpu.rs

-- 
2.51.0

