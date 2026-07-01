Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CB23ADB9A
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887231; cv=fail; b=uyqxoN6GKOctKKMnP6YtOmdsa9wRJw+Bf1pkhel8JhrkqFfkz1TO6ELwGYiUlZby7G0sieikZsUA0Z263m6yP91THXgKIJErRtINfY0mgRgpcVppYrgQ5WwfbVCVPQ5wV+EH7re1PnowlHGtO0+fGaWBln6s8IQje0vOIvNEZLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887231; c=relaxed/simple;
	bh=7E6qXRocfMMDeZBC0ZCX4dzslJoBAXl/qSMKIfMlFPk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l2gNfo5YVRfZ7wYTedUJjLr/2bZshNfKOGqWlnc6+WQqga/hzgNxnBJmEYg0uiaVSNhfPqvbWahH36daV3W4TJzBgs1RXQiyJTBnjGpvq+F/5sPoc6L6skPR13ebmTXkfdgqZwtGtrIsmSLlPJkFyCFFQyicIqsmM5Ri4z3+DF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RydX4NQ5; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RydX4NQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+gnTPACYhwt7M9rnyM6pWjf4Jya9Q/bN0Hq76Mi+6wtcI75FUkH5FzafrNvGNyW2qL15cTWZCvb2Zoim7wLhs914HaTvXXwXjXe1iwTu4Wv9xSNPr2qWDQn1pNfH9nfv7zqk1aOh1DGl9AXFGcn1BeP+Z9p4qd1jdscztU2dq6GWhvOdLcm6WQNkmaVynjrf7ka3l8op+vACOuQF8P61kt5hPvrCdi+aH9Mv8MLAgLazHTI0Gh6ge/yrGXUk1KcYN+23++iMjQsZjrZNhGOSgXH0UD4AYsm4sqlP0fdeN+1IFiCIsu4x19gLltyKzYhcDA1IrdnVXm0HRzGk9+uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIveBFWJJ6cVVgE+zVAJl5rCrpyT+t6lF4pR5u6hE5w=;
 b=v+3U6NlZ8zPlo1j2wp73EgzJZzH6vuNsUuDdAznVBhWy/gnYoBDfKoJSu1KgHEzn1XLIvR5ID+i/rxLmmXBCsDtZD0n9dYhGddQQpJABJtcY0UhDl1F86LHYDIatZsHbyfUg7iiEigni5QtuYtcB9Hh+FDzaMEVzj0poL8mhdEM22KQm/Gss1QiV/44rX78TMCw+lJdltwKmfv47MXb2LCyIlzYYix+nHuMCf/7EmamrZ9FK5C1fDG4O1yaqm6f9u9bJ8aAyroh4NhOf8VaDWrC1xgsjpGgzaI5NWNBpQl4LxltZqC6DfVVTrlrEhOU1TE7thRnh0msAabm3yDcD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIveBFWJJ6cVVgE+zVAJl5rCrpyT+t6lF4pR5u6hE5w=;
 b=RydX4NQ5DcHmaM3AwJi+ct7cCtrbeB6TFvEVWnj7w7ghAp8bVqVh56aizzpac4pt7aSgqKLUi8euJsy3ArEsk53S/9RD6WTa23yPtwJqpAgl7305LXdxTccdypiH3RcgUpeS5DsYc8F/2JFSrHdyBND4zK33B8Nm4Ihp1GdNptoYJO/s1lkN9yBpIGTQJRVIPWVjNHlYH3msPM06TsMjXS+pNCTbQ7AvQxRYfi/fF/QnGw2Nb6uH/AEZqvHfK4pn5JiMfpgA8TXHv8XwWYGONviPaJkpqXUDqe6l/oz09bz+6EL82ynVxOiDkzvik86UtLBa/JA5gjApKMRQC79Bbw==
Received: from SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::15)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 06:27:02 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::90) by SJ0P220CA0007.outlook.office365.com
 (2603:10b6:a03:41b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:27:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:26:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:26:39 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:26:29 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v3 0/8] gpu: nova-core: boot GSP with vGPU enabled
Date: Wed, 1 Jul 2026 09:26:14 +0300
Message-ID: <20260701062622.3499033-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2912ae-7f80-4632-ce0b-08ded739c34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|56012099006|11063799006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	i0zdwLpkRjSduqjPdc984D9crB/KE2aojcd2pkTR1hsgmz9hCebrAMDAbryih7sAQUjj/0hgds1o8KbE2u6nrUHmYAwynQnVxQi+hkcaU82hBKzDhMXaCv9+hx76IuHwh8uAfyqadiU7dT1MQDqvsOpw2LU23wc9rfH6rYVCy+nVMHMMRAdmmhZ8Z8GyFEg9vse+ZDTscxTn0CDLyEC9fylhfq6yOJ08ZT1wTX8YFdlGbUjxpic8G5nlRgEgTOQHvaHKIJ8sJfwa2v+FMmtBRFkzNUmWhNe9TdWgp2A3EQoPwBuGlEoX00K/W0FDON73AlgEeMU2L9yJFkSY4Nt44GaH67w4NYR6IuTQTaIv5Ijzd4i1aPwxqFNd4IxqgJ4qF6kPhBnU/BrOib1mP40wOJoXMLWL9Kk5jlXEr4pj8Nu631posTPAQXo+ZTV73CPgnKhqrm7CeMy3DR7TrHnRDZ/SSOdXKCQNelIIOcezdlV+ptvRuqqbK0EmYBt7rS1vHDLQeqGO8OQSef+sP7sLStj+5oY99KLcn8nVNOPqfiQAZ2SS93zzMRXdBmREfApN2tcrHonsL2bBM5fypYiU7aO3tjDW84b1vp00nQznXBYvAHDUYAY3qwJD05Q08RHd3YC6c7fixoa8DzYJ69GDOzcLdkmcWSNhi0ZBK5QVjygwfv1b8r29XXyicWwwpWXDcXIkbLdJURzI0CWBef/mFw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(56012099006)(11063799006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AeDtmk4187iS1E7lVWitmn7XHoAfsjwgC5Y6lEMRWddYgPk15rbDdf9mBCZ5CrW88VpBVPBqrDAaFJb2FJm+uezvu3MItGeOW3mbeCWHbyTkcKse9kXIaDS6es1w1T5husXIvJWQFQCAVxHMlG5WSXl6plG/LfgLLQEeWEyrkdUsotUukWRCPQt/DVS/o7PT65+s3kZ7gntRt+Cka27dohw8nYCB3yoaAO4TLSJ4nyzfd/2FZskSwkWXENyccVU0NwnwfHiAQoKu9e0x1tIbC6viXAzTos9Q3x0a9rajrEAtNI1v/lxubY8UL6Pi01LpxNa5B4CjeSA/vdLQG2cBVfHjlnl904L33l5m0Y5lgEzYmrac4aStrgeEDoBWcG8u3G4WB717DmPB3Nlt9ONO0m+BbKjDdj1LP2TRbygTBsWeITlPlwsfhJ6FV+z+zGvB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:27:02.0039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2912ae-7f80-4632-ce0b-08ded739c34f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511

Booting up GSP with vGPU enabled is part of the first milestone (M1)
together with the Rust fwctl abstraction [1] and the nova-core fwctl
driver [2] for upstream vGPU support. It allows us to validate the basic
GSP boot flow with vGPU enabled and upload vGPU types even before the
remaining nova-core dependencies are ready. The nova-vgpu WIP patches
for all milestones can be found at [3].

This version is based on drm-rust-next plus Alexandre's GSP boot process
consolidation series [4].

v3:

- Split the FSP response header rename from the FSP PRC vGPU mode query
  into a separate patch.
- Change pci_sriov_get_totalvfs() to return unsigned int on the C side
  while keeping the Rust helper as u16.
- Move the vGPU capability gate into a dedicated vgpu::hal module.
- Represent detected vGPU state as VgpuState instead of separate
  enabled/total_vfs accessors.
- Keep total_vfs values below 2 on the disabled path, with an explicit
  comment for the current single-VF limitation.
- Use the generated 570.144 GSP_FW_HEAP_SIZE_VGPU_DEFAULT binding for
  vGPU WPR2 heap sizing, and keep unsupported 0/1-VF states out of the
  vGPU heap path through VgpuState.

v2:

- Rebase on top of Alexandre's GSP boot process consolidation series.
- Drop the FSP response, FSP documentation, and GspBootContext patches
  that are already in drm-rust-next or superseded by the prerequisite
  boot consolidation series.
- Change pci_sriov_get_totalvfs() to return u16 and update existing C
  callers accordingly.
- Make the Rust sriov_get_totalvfs() helper return u16 directly.
- Rework the FSP PRC vGPU mode query to use typed subcommand, object ID,
  flags, request, and response structures.
- Move vGPU state detection before GSP boot into a read-only VgpuManager,
  avoiding Mutex/Cell based mutation during boot.
- Add a HAL method for the vGPU capability gate.
- Split the SetRegistry changes into a dynamic-entry refactor and the
  RMSetSriovMode functional change.
- Rework WPR2 heap sizing to consume VgpuManager, keep the vGPU heap-size
  helper in gsp/fw.rs, and drop the 1VM heap-size special case.

[1] https://lore.kernel.org/rust-for-linux/20260217204909.211793-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20260305190936.398590-1-zhiw@nvidia.com/
[3] https://github.com/zhiwang-nvidia/nova-core/tree/zhi/nova-vgpu-wip
[4] https://lore.kernel.org/all/20260629-nova-bootcontext-v4-0-5539d8469590@nvidia.com/

Zhi Wang (8):
  PCI/IOV: Return unsigned int from pci_sriov_get_totalvfs()
  rust: pci: add sriov_get_totalvfs() helper
  gpu: nova-core: fsp: rename FSP response header type
  gpu: nova-core: read vGPU mode from FSP via PRC protocol
  gpu: nova-core: add vGPU preludes
  gpu: nova-core: build SetRegistry entries dynamically
  gpu: nova-core: set RMSetSriovMode for vGPU
  gpu: nova-core: reserve vGPU WPR2 heap

 drivers/gpu/nova-core/fb.rs                   |  25 ++-
 drivers/gpu/nova-core/fsp.rs                  | 189 +++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs                  |   7 +
 drivers/gpu/nova-core/gsp.rs                  |   2 +
 drivers/gpu/nova-core/gsp/boot.rs             |  17 +-
 drivers/gpu/nova-core/gsp/commands.rs         |  80 +++++---
 drivers/gpu/nova-core/gsp/fw.rs               |   5 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 drivers/gpu/nova-core/mctp.rs                 |   3 +
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/vgpu.rs                 |  79 ++++++++
 drivers/gpu/nova-core/vgpu/hal.rs             |  45 +++++
 drivers/pci/iov.c                             |   2 +-
 include/linux/pci.h                           |   4 +-
 rust/kernel/pci.rs                            |  11 +
 15 files changed, 425 insertions(+), 46 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs


base-commit: 05508fc305cb0311ee21f9629a41f821f5e0216f
-- 
2.51.0

