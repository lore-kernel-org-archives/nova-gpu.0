Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286F033B6CC
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157512; cv=fail; b=ZTVFE7eUJvlGxhnA3Ei4XxkiUh1Mho3u+kyxvjgNcIiCSuvmLQ7tWz8IokEX3erjCZ088JEc49EZBQxS22XW1uf8CB3Ji5Y8tVawKeiX+EWBUMQoz2dFCGwLBWKsmnaq1gqTf0+uUZMpUgavvwRVD1oahNehc3TlIRDjJoFNGZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157512; c=relaxed/simple;
	bh=gT0e47vHD1PxriK6usssiHa7XSQgYJGWNyAofD8Frz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d6GximB/bVRtbbvzjTpPkahZ9p67nutigDoaZLmc19QZC5pT6+j/kNzYCpYipe1/gL/9xy/H3Fsna/tyYZc8O4gAe27ZkTn/aFY2Mr3D29Q3gPousdGdDO4JWbMm2n6+8IN2gebWQMD4VN26Q2Shko8FdmwC/KYJiOcYygGrlKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fn0btgXR; arc=fail smtp.client-ip=52.101.53.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fn0btgXR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSovFtBb2MUwsLa9SrLkHMcfETsM6RLpss6HMleDx9PdDPhmD5YRCYx2DoPbIVQnitwvhKs51iuWdL2igKaSjcx4uUrtrrshaPLuSLa8zo+Hoi43SDhlaBcSkB3cYGJyXqoA1t9S4ms/vn7jlUOgBI79+sunOAJw/JPv+TFgOHLbIn+wb4whtli/JSFSPxzJXVB3mMU+l8uLlEC0o1/xKQbCYtHEJuW+P5qNRWQh8YkbOIpb8Ae2YWM1EtULUcZsHBzbY1yO9Ydd6aa/Fi+njoglVd2SnZYf9fcRWke1/YVpkIU19wxlX8Sotmaanm+kt6Uol36KSLomK0Np0xY+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=732XuNbLjU9qMBEIYf9e38kedQIGtMpF+pz5YB/bqYU=;
 b=etMROchQKy54Y+zj71iOWlP0RTi3s4p0/MlxeH7ZANNlIEkLOkxquJqubf/5HwGBAHm0d+POOv8FUPcsa/Y2V9msN7VTb2aNpCEafZKb2l9qVeI5+lj5008i1HLaC7/I6VEIsV0co+ONqnqO9OUs/cW+hF6BNjzX0hNuRSkraMGL7AHiULeVDm06RtB4pIc/aQH/8ZIxUIu3BUPtkCCJSbfxRbA0dldBf+4MAOHc8N3SzNuE+Ny2/ZTj1vpaS84/oGQfaALa8+w8rjmgY7p0GHEO3qnETSFuaYYk/i/irg5RcpM8YlEEbwjtv5A241GG3RIODbrd+oh9mIkn9Pf/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=732XuNbLjU9qMBEIYf9e38kedQIGtMpF+pz5YB/bqYU=;
 b=Fn0btgXRD6gDmNgfgp7x9SWTABLoYRWlspQV7sJe+bPVscnFtgSzEdo+roAEnAbzUV50vi+XwatRtmLtPHCC+nK0Ujopi8IlKQJv6q9Xev9LRjNCD1GCfvJa+q57WZPVim2rWOa19MVzv5iy2/igSBcjPT9d85N0vI8U9JPcM8Al+wAHUSI5ftcNSpIqmIP/FQ4hWmVZEeBoVwGLHtgKOF0JLDFT4FcJA+oAI3TQLyx1pBPS2118Jz9y5/zcCZiszxtf8fQ/9oVME2zjJl71braUrX4NBpnAPBA/Mm0WCErD8WVtCbREymHgq51VnWv7QtNHp9g72DOndi4At3K2EA==
Received: from BL1PR13CA0334.namprd13.prod.outlook.com (2603:10b6:208:2c6::9)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 19:44:59 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::4) by BL1PR13CA0334.outlook.office365.com
 (2603:10b6:208:2c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 19:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:44:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:44:34 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:44:34 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:44:26 -0700
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
Subject: [PATCH v2 0/7] gpu: nova-core: boot GSP with vGPU enabled
Date: Mon, 22 Jun 2026 22:43:46 +0300
Message-ID: <20260622194353.1308872-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: bc90e69a-0660-4196-7679-08ded096be82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	VBaoMEl8rfJiBbL3yZ3whskmURyh/nw1ZZQrgt7u7vlAeHq++bH2nFLb0Vd8DoBKSXTb5SkcmC7IXHsuiAOC1mETEOKD+ikCC0eDSHIhVoeqeCcqaiBol46sy1WMNrNDafVUtlsI/LRuS5BtpIPdUQPeH4ts4OYvudTT02iOFMjq3LDJdXhvzWd3/zBHUI6LqGMffWLRKVimK+wjeGjVI9f9wChrPWA5PuQ3XPXnvlSsDBtfCR3mC1eOclSfVjKr6ZOAa2cOdUrKImNfI62FUGr7INgC2xg8WeYSuZIOWDXPZm3IT1/fHOm3mElI9nmRjs0iqK0TV5TEutcoN1p5gn+WOQFiD5gz1oXBE6qWti4L5gzgd97aZKg3J9HwvmYs9npV/TsCS86KHS8Fe32ylNBAOnxrYzm60u22IVgp2rXm4D/Fa/lrNSoUbB1nga4T6i5YHtvAsyTHMdZalZrLJrRt4eV44bO9cdC+h9+pXYFp4JXmztpqWpWb+fwyt2FnYuhQ/woUpTORdWixzVA3CRxkV3dLfD+vUnjCjD13xmnQg3L8iWDf4A4ZOS7HtJkcPENMhm8n6bDDwVofUZ9M85PCYlJnTo7k+tPUdUwI/r/fsUXYz3JWFsn7o3SX9GCazUZEEt5iald3KbdHw0oat5ds2Rif4Im3sc83Va6yGpvtV6XEo5mMfcjFLs0fhk/UR3Yv97nBEVj2/sCPr5usKw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	56xiiLzCzDiCAi7l8//hXvczBp46e6WKhZOq5RTQI/FUqCq3wYnERh2MRiunECskMTRIOCdhSl+LUMqCda0pZ5FCEc+XRcjPUrgA+PguKm0ZWhlXvS89oa8hyH20ZEqMbluoXpGhJjfWvvcN6Shi8ikVt1VM0fk4wt1INAYNroWU5/ogXIrP4x4mVjS6jIRk1Xz65tH+4fRO00xMSh33OLFO9c3x/Vm4yFiZKBPx48Z/maPtAjq4hGUE2O7E7Il73nABEhZanIKocsxCKEbRmLyr+i/Z8cII2NU5BHtbt+f34YCOmj1S7RioNaA/+BYq7wl3QaypW2TmPVsYqIgvJTKkU6noMOe5Tkwl8yCP85zx4yuvhl4/K4v9GEqp+sOqJV4kBzuL1tWUt5ni6MKieb2kQR9+kllV3RB9/mrp1O+gwfXTsHYS9XgZwzVD84al
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:44:59.1138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc90e69a-0660-4196-7679-08ded096be82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

Booting up GSP with vGPU enabled is part of the first milestone (M1)
together with the Rust fwctl abstraction [1] and the nova-core fwctl
driver [2] for upstream vGPU support. It allows us to validate the basic
GSP boot flow with vGPU enabled and upload vGPU types even before the
remaining nova-core dependencies are ready. The nova-vgpu WIP patches
for all milestones can be found at [3].

This version is based on drm-rust-next plus Alexandre's GSP boot process
consolidation series [4].

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
[4] https://lore.kernel.org/all/20260622-nova-bootcontext-v2-13-0ddeafc06f5d@nvidia.com/

Zhi Wang (7):
  PCI/IOV: Return u16 from pci_sriov_get_totalvfs()
  rust: pci: Add sriov_get_totalvfs() helper
  gpu: nova-core: read vGPU mode from FSP via PRC protocol
  gpu: nova-core: add vGPU preludes
  gpu: nova-core: build SetRegistry entries dynamically
  gpu: nova-core: set RMSetSriovMode when vGPU is enabled
  gpu: nova-core: reserve larger WPR2 heap for vGPU

 drivers/crypto/hisilicon/qm.c                 |   8 +-
 .../crypto/intel/qat/qat_common/adf_sriov.c   |   6 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   6 +-
 drivers/gpu/nova-core/fb.rs                   |  25 ++-
 drivers/gpu/nova-core/fsp.rs                  | 194 +++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs                  |  12 ++
 drivers/gpu/nova-core/gpu/hal.rs              |   3 +
 drivers/gpu/nova-core/gpu/hal/gh100.rs        |  12 +-
 drivers/gpu/nova-core/gpu/hal/tu102.rs        |   5 +
 drivers/gpu/nova-core/gsp.rs                  |   3 +
 drivers/gpu/nova-core/gsp/boot.rs             |  11 +-
 drivers/gpu/nova-core/gsp/commands.rs         |  79 ++++---
 drivers/gpu/nova-core/gsp/fw.rs               |  10 +
 drivers/gpu/nova-core/mctp.rs                 |   3 +
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/vgpu.rs                 |  60 ++++++
 drivers/misc/genwqe/card_base.c               |   6 +-
 .../net/ethernet/cavium/thunder/nic_main.c    |   2 +-
 drivers/net/ethernet/emulex/benet/be_main.c   |   3 +-
 .../net/ethernet/mellanox/mlx5/core/sriov.c   |   3 +-
 drivers/net/ethernet/sfc/ef10_sriov.c         |   2 +-
 drivers/pci/iov.c                             |   2 +-
 drivers/vdpa/octeon_ep/octep_vdpa_main.c      |   4 +-
 include/linux/pci.h                           |   4 +-
 rust/kernel/pci.rs                            |   6 +
 25 files changed, 401 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs

-- 
2.51.0

