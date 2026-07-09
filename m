Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728422C236B
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609373; cv=fail; b=ReSILLB0XkrgdtKzRMxCv0yKIEpXyVJJoDzc/kjs69xFGm52CvTWDYunxQWxXTDYrx66YuSCt1xeMnqpIyglPGj7iAIk9chr6X9yzLCATY6WkaeZJ9Wnp5AB5OGMra0/8hm7jQTBUfGB921xhmAVdW19f6NmIf8PGjLE001J2EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609373; c=relaxed/simple;
	bh=CG+dKlEzbOMf/lXhrgQrKDmoelhM1y4Lw74kgUVGKXI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XFARRGrNEPfw8JbviSZ2xJ3XFo+I3RskwjfOLE2+70TGpI1293MAHlFpKMd3OT0XdkIgjclkpLdkQoN1RLiLKzToT95ZurtDw67p4jXp1VMJCYLWu4N+2rxXFJQbAwyV7NGpPZbh+5egKTj8HqavsNhlOG/9PXRefF4NWFTAkDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gfL9HuOH; arc=fail smtp.client-ip=40.107.200.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gfL9HuOH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg4ADvswZO4d3KRW43xjQJ3Zrm11Gb42oUdLJNplLYqPXzMM71e8ZkJ6/8JoW8WE9KUxLWSCtyjp96vLRjuiiegc5hAmlYzGd8XuMY7bPIRWYrJxLZD6gtT+Izmlfa5E5Aa6O9J3iEQJiaoeDW7uzefQMG9YiUB/ohEp1BfCkCB7g3VZEiexRivip7gOeqygOCgobBliPqXWMMPVqwD4PeMSh7v8BLK2mqoC57JCAg673pNF7GK4TRAli1uF7MGt2P0bS2Jx3kgT9NeL88F6XXmNLqmlVwBn6T4eKWFHE0FNKgas9WhR1EThZGd0WbglCLPyAAX0It1TKmpaaMPU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNjrcTIug9YuHIHTm+kVYXp5j4fMO+WmMl8u5c9Spqg=;
 b=x2EdqJXjsCgylmiIqHOYgghx1wutGYMB6aN28zVd/ZbFM31HUukG1//ebBh8lInguZ+o4aCQ66r2xFvu2ZxRQD1qc7+NQKCZOehfDTfbMaXLph8DoYAYEmYRDFbezhZFvB8dHXckA+XYYZCo4a6H9Z8k5x+TG5ZZ9uBOOzi3hGCSnmG3VmRzrz7GzS/fGo6ED8YjiEklhNb1U7aodpkKID2s9k6RRXToRLzcjMZ63AT2ZyLeMYcKQL6YERNKR8ZbbzmNLsYO6o4thI5klUmCX/v9IwYTmipDm58ez8/GytCnbWx36/rWMCi8NHJcutRRoZS1L5UczefmF0PnPJmZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNjrcTIug9YuHIHTm+kVYXp5j4fMO+WmMl8u5c9Spqg=;
 b=gfL9HuOHaTBkiN23Xt3Ok2IJwsCeY0ZUp3YbWo/x5y5+cgVklEterVpvaG4dDNGmAj1PmBDAgwDgQKnzCdnu6FmwgwoRX/7CWjYfnTrpxYstY7+qYXfBNq+6GXHep/lm3BfOL/XB3aMU9GpKxYWCH0IBVkmzI4HVmpAStxgr4L0P7XebB9H7YGJPOHdCBmAdccKCnVNeCjXk0VOAnTY/JcicBAdh5lCUf/L4oOncrYdIjGZaw7Df/iDV6tFwUeh0ewnp+Aes860r5oKplhJGkbJT5ebNPGA5ORo9WyPAzpXlLnXfrf0AWxpUIyNIdk5ZxiwW2OOe4otFsmrTP7VSTQ==
Received: from PH8PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:2cf::24)
 by SAWPR12MB999163.namprd12.prod.outlook.com (2603:10b6:806:4e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 15:02:44 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::5d) by PH8PR07CA0046.outlook.office365.com
 (2603:10b6:510:2cf::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 15:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 15:02:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:15 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:15 -0700
Received: from inno-dell.vdiclient.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 08:02:08 -0700
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
Subject: [PATCH v4 0/6] gpu: nova-core: boot GSP with vGPU enabled
Date: Thu, 9 Jul 2026 18:02:00 +0300
Message-ID: <20260709150206.1046839-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SAWPR12MB999163:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0e83ef-a3f5-48e8-3da1-08deddcb215f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|36860700016|376014|82310400026|13003099007|18002099003|6133799003|5023799004|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/KGNN8d4e94ssvU9dh25GcqTkFS/2esd9mUzuKUNorDev1hrHTchHjfyBC8ociwe43UMWAB/QM0VSS6SXVcOjL3ez8lq107by7naVy3rR2FNhKEcwNFx7wXX5zAzqvLKQ15GUvhoxYfdd3i1qdoHFZOqCdboltqE5uoEZogFkCjjiUdJ91cnNfxtACuip/dm2d/Nb4Ig6ja3noL3JXMLUpEovVBRNXTgS3bJouRQ8nVzYYKIeS6mLoJlXFIpOCnmypD9+wvgrZQSXjOFXPk5DNCbQpkMScY4MdloNVUB0bYYVWLiiU7QZBJsNT13n9gKcka1SFSz+fOL4A518ra+mgd3kKWhaUHqLIndFNdXUxaoXLsdE2s03LMhXV3/v4M18FEu6g6V0tONKOW/MEgHB+H1IjjWu6xmOuP0sQc6PCBiwn9TAjqjZB9xch+qi8FCHp54zJJBxpRcv/2XemIyjiFARNgiGioOaYXycr9aLXt/vJzrUHuyQjk5EpzMhGiCE50NAwFRaOaCPvD3n4HGAMcfKKRyvKM5l6KiU7a9cTAlLEitUVpFIlaJ16jO/nflEVoxDMHsfqmppXHwsbXJFhWoEzd0kfLLIYczG3td8pa8Pida82bqfZMqKk74oWuBIsHdj4p7bBOhOhdp8DVtDE23yq3a9IMgNOwYVX6g57TW9MEQOH8o28P6XcSqbnU/7Z6TbzLOszrLFjWSln13Sg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(6133799003)(5023799004)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UjSyWkA/8aCTRWZpfhmX1MbIBXadCCznW7AuMPad6nu4ym3I4t0OViciEsy4Plxho9SlFtNeSiwIXfW9e1aOgMFTbPBV7n5nO80jMjv1uihJHSP9Tv1m+6VgbrbtsXRREDfiZRf/7xNi3UZ0rbA0NSPrgLyydx/ICOsoRdV1irt31MjCdUCi+5J/aGDviGEg9YU0RCU+sa9xFFiw1Wxc7mL0M5fcM943CE3adOXtFvSeBlbC/L3qWDFPpP4/qTBuefhJXBp5XS8H5igj+H7bT3hdx/qFw7zXe042mT/ssl/p10+iocOs82f6w/Zd3a4BMW4fJUgEdsrRDthK6dkWdrvkE9OhjHrze+LcX4qwQv7GHnOrSFNnJTr3uilFKT0PBn3AxsCCYl65sZFLwjDjjHdUxeDK3uFEW+9ZErdb4ZoyykYZEklthXiIPAsDnbcq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:02:44.0045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0e83ef-a3f5-48e8-3da1-08deddcb215f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999163

Booting GSP with vGPU enabled is part of the first milestone (M1)
together with the Rust fwctl abstraction [1] and the nova-core fwctl
driver [2] for upstream vGPU support. It allows us to validate the basic
GSP boot flow with vGPU enabled and upload vGPU types even before the
remaining nova-core dependencies are ready. The nova-vGPU WIP patches
for all milestones can be found at [3].

This version is based on drm-rust-next plus Alexandre's v6 GSP boot
process consolidation series [4]. The FSP response header rename and
dynamic SetRegistry conversion from v3 have since been pushed to
drm-rust-next, so this series now contains six patches.

Changes in v4:

- Rebase on the latest drm-rust-next and Alexandre's v6 GSP boot process
  consolidation series.
- Add a conditional C helper for pci_sriov_get_totalvfs() so the Rust
  abstraction also builds when CONFIG_PCI_IOV is disabled.
- Return Option<NonZero<u16>> from the Rust SR-IOV helper so callers must
  handle the unavailable-SR-IOV case explicitly.
- Derive Debug for VgpuState and log the complete state when
  VgpuManager is constructed.
- Warn and fall back to VgpuState::Disabled when the optional vGPU state
  cannot be detected, so a detection failure does not prevent a
  bare-metal probe.
- Document vGPU state detection, split the vGPU HAL implementations into
  per-chip modules, and call the HAL method directly through the exposed
  trait and selector.

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
[4] https://lore.kernel.org/all/20260709-nova-bootcontext-v6-0-520cbf8b9b50@nvidia.com/

Zhi Wang (6):
  PCI/IOV: Return unsigned int from pci_sriov_get_totalvfs()
  rust: pci: add sriov_get_totalvfs() helper
  gpu: nova-core: read vGPU mode from FSP via PRC protocol
  gpu: nova-core: add vGPU preludes
  gpu: nova-core: set RMSetSriovMode for vGPU
  gpu: nova-core: reserve vGPU WPR2 heap

 drivers/gpu/nova-core/fb.rs                   |  25 ++-
 drivers/gpu/nova-core/fsp.rs                  | 172 ++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                  |   7 +
 drivers/gpu/nova-core/gsp.rs                  |   2 +
 drivers/gpu/nova-core/gsp/boot.rs             |   4 +-
 drivers/gpu/nova-core/gsp/commands.rs         |  14 +-
 drivers/gpu/nova-core/gsp/fw.rs               |   5 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 drivers/gpu/nova-core/mctp.rs                 |   2 +
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/vgpu.rs                 |  90 +++++++++
 drivers/gpu/nova-core/vgpu/hal.rs             |  25 +++
 drivers/gpu/nova-core/vgpu/hal/gb202.rs       |  15 ++
 drivers/gpu/nova-core/vgpu/hal/tu102.rs       |  15 ++
 drivers/pci/iov.c                             |   2 +-
 include/linux/pci.h                           |   4 +-
 rust/helpers/pci.c                            |   8 +
 rust/kernel/pci.rs                            |  13 ++
 18 files changed, 394 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/tu102.rs


base-commit: d85845b64c0020b2812243a22fa79d57cc1c1e38
prerequisite-patch-id: f0a0ce0462acc6881b0255d041605544baf85636
prerequisite-patch-id: 7f0350ec963632f62c0c11f3f31331fc61bf3d30
prerequisite-patch-id: 49215f9c00b0f49a63066e3f64f87c2d89467907
prerequisite-patch-id: 952b67f6cd6c4c32ad141a83476067761d96facd
prerequisite-patch-id: 04f4e5dfde6f418544eae9d44737521bb1ca571b
prerequisite-patch-id: 33740a010f5ebdf7da99338b809bc84e6477a887
prerequisite-patch-id: 21f6c58981b5644bf060ce927643243f9d22b476
prerequisite-patch-id: 0bd4a3c41b8f8947ee2fb02e181f37f7b7774f88
prerequisite-patch-id: dfefdb3c87a4022b93a1003ebe566f1945a735d1
prerequisite-patch-id: 329ac78d2f0e13b20781e1859a6976cda4db2cf6
prerequisite-patch-id: 92004c279388e29ec036dfa4e69ebfccebab80fd
prerequisite-patch-id: dfd10bc2d272d344b6746ce3a05c73773b743696
prerequisite-patch-id: 1cfa743488bce0038da31b14dbe57297ca6381b9
-- 
2.51.0
