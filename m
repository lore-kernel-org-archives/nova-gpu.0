Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD73AD50D
	for <nova-gpu@lists.linux.dev>; Wed, 22 Jul 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705988; cv=fail; b=Vbi5yYJ8ZYQuX0cvZ4Bgl+IBaqJvH1yY0zZ5EYnqJoH1zc7TxKLWrJJmY+UWOcEe23Qf6DA/6TGiS/OSGKHCol+PRXcclsOtjGBgQOCO3FJfvC5x1iNsYBVQvjHsvqIZZdlD6NSzmZfJFW6hesmpl7JtIqVl7nGoKF433f0VNU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705988; c=relaxed/simple;
	bh=icA3NS+gdySIKVjnsnGLvMqmvzZ/ONIk/gRkwjapGjg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FoaqRMfkOeeuBqIpdSEiMN8X0NkxaCabrnVlRBk9XvVM5kCF9l260RMZxC/uWoK3cIAeeXDIEhqKTsSIZN17G13VTsyfYdzcXiq5vsIr/f1u02xAQ+M1W12A8Ep/ksRRSYUCeilH0MI9hDXz5/B0tBlLZwr4lBXH5P7px5gTCDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OTDfe8dx; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OTDfe8dx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg2T5TgOEHLiaeRAi/jwIwj4AvdmzgM1r6qLXTmZqgcbG21LrVT1+Xruq+fUH3XmwVlhqGTXhaLZj+oxaIJT4nYHq1Krtsuq9cRTq0ux0TThK5DzTCvP7UhmpKVVTttrL9dAyfAIMdLEprfsDItsWKc4tLOhYVXNm3o2skYLYmR/KoJr+NI6dJrrOMNx3GD8xwyB8cBXF+mAlgfkiCGQLb7jJ4Hdw+8sr6k8LWhHg98Ot75dNCSKGWUxe/jmp2w0/QwTDiOmQXYjtTE90YCASPKTkIVjFhIU+TWoFQci0wXRzJqhPhJVBdcKC9kuJsYqU17UudYPcu2HWHZS0f4R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M8j3B17xOlMCh+aGJsioiMO5F1DAzw+mXTT40amtc4=;
 b=SRIO82RaOrzZNtw1DwQqOfeSq7/BjWaFyYdE/6PoIll3JPluqQqyjcdtQE9YV75edDTKGSOSs8i5hPdip9bguU7+XNXPFxk6Tw4/SiV/G+PWdEI+Bt4KVDAsM0dHTA9caahMrLkytE+zyLkyYm9HuNsuz0GEWc/dwGX0O9twKvV1TGyJEbmMdm4vffR0vNBo2R/jQIa5r2e6gpJt24OyIjnQHlSlOQCUnCMcS4j9dHqmAVJaLcolVhVGC0du9zYI8kshUsQdXpoJ+2MZYl1QztY3rQdUYBuHUm5rvpIBeImQ+XuTK1rZxq5Ez9UAZI68rx/XaWSDdDwooDVXmftb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M8j3B17xOlMCh+aGJsioiMO5F1DAzw+mXTT40amtc4=;
 b=OTDfe8dxvEvTypj6lW5Dj7VHHoGedNjo8xI7ifq4D5DAihuCidsHzD4hY+z6DfJGx33WF6cOyKqqawU53HQhDWEoBWk3/E25T+DkoWY8wV6kg3K1Ykcew+8jBUuhX0LhDbd/32d6xZhf2yeapwpfyjhVW+rmEr8ptCGBh8i57q+wC4aaYGKVRypGDh8t3qhwKSFuVg9B3N1PKtDfGPzUj/tPPFOfJ1FO7KohPlLgV3T3qlSlAOg4DSfnYBhpVk0kgxCtA/kWQtPXCy/UwkK/dY6s6jzQNu0GZ08p9l2gzMSCuNlvXjARd1zCFQSf1rSfGtonUnFf4sIWbzCp+bSE+w==
Received: from SJ0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:a03:2ef::15)
 by PHXPR12MB999233.namprd12.prod.outlook.com (2603:10b6:510:3cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:39:41 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::81) by SJ0PR03CA0190.outlook.office365.com
 (2603:10b6:a03:2ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:39:41 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 00:39:26 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 00:39:26 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 22
 Jul 2026 00:39:19 -0700
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
Subject: [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled
Date: Wed, 22 Jul 2026 10:39:07 +0300
Message-ID: <20260722073913.1807677-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PHXPR12MB999233:EE_
X-MS-Office365-Filtering-Correlation-Id: d3846a81-30fe-4d47-2aaa-08dee7c46449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|13003099007|6133799003|18002099003|56012099006|5023799004|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1ZIuxgqY8v9SkuyAYoqOTWWo614sjOIKxHBkX/Pzjkm0QdNwOwwdwPCmbi5ry8JPmUjbmWtCaP1JxcQgtWitRHhUmqJAriFAZTfsCXdExfYLjj5pNROPN+LOezvdfARO9hRGdLV+7ZRplR65U9ApFNeRSMIaQeTycnM/vFpy0qShkOpfGjd6I+coBwUdeSUvLT95hAG0F9dIUxW22J3ieiVWFMGaCvjJ9yiZC0ME06Q/YeabTrc7F7g/8S2wd76euXVx0J9tKlvj8xaOMhncxQh0kuqnNxidC76ISgu7VI67uzq0v1jMVl01smDj2I57forXlRzEkC/gL306FUSBIRNZS7R3kGfHBG6L/RBJ1hxMzLkdEkcW6P8+hcRkBwHlFRXMlYdmh1yToTCRpUldBYi2S6jM8TOsGo3k7pcfF0fmBnVDEwfic5f6iV8/Zev0fzJm/12Hgjkx8WbBEIME7no1neGkxA6QHkTGipHZQu6kwoZNVAPIDAk9rYC4td305wIuzPkb/NsQi1cuPkKz66cWJJJysJwqLfVDleMY7tPphA7fzUo9qWCpRHjZ+ix9nmFgjHfwVJOboGhqm1Z4lEEgW/ynswSywAGzgXdHbNJLMHqy51ul1TnmwGsG8072E2AjhsRg0z/4XWq4e6Cc16FSIHDT3S47VjJrk4jRpxtj9Y/jrLdEs6wIXO9wl/MyyfWI3F8xc58aFTB8U5h9Tw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(13003099007)(6133799003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H9O9EeUhgLg7MTNEaao6EWuuzPzgcKoEbdvnaLG8DE7zl4LCcxdm0FMPIKzUwH+xLXJkIJMTBLBfPLQtdNHmWipAJptBiwo7rtD5uwWwjYSLMzcCpma6rD3lRgWgszj9MWju6AcPdEC3KtizYkQAVrIgMumcnsdO/ZgyvphQz2r0+zOYV6cAIZKjLa4UAH1SKHnhSx2IHutRKut0FkG2hsUYPSLZhP1aU5GPK9rVp9Onf0/CEKtfBy0U2DZVvP/woeraRasfGctdQC6wV8qoSro+5X+yUVlqUo9NuaDYFBb2CCVUCE7GNGrlGNz0TjYBLNlIb5iXKmZJY+rJdHEWqp9e9KAcQUNCyp0s4Lq2Zw37J1FuOmRx0OilPmkYIKsyk5bh5qEsPxbst+IB5nAh5sEVCI4djsYFV/FGZmlNKjBlCec5/ESChKIY0JJRNYW6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:39:41.5022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3846a81-30fe-4d47-2aaa-08dee7c46449
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999233

Booting GSP with vGPU enabled is part of the first milestone (M1)
together with the Rust fwctl abstraction [1] and the nova-core fwctl
driver [2] for upstream vGPU support. It allows us to validate the basic
GSP boot flow with vGPU enabled and upload vGPU types even before the
remaining nova-core dependencies are ready. The nova-vGPU WIP patches
for all milestones can be found at [3].

This version is based on the latest drm-rust-next, which now includes
Alexandre's v6 GSP boot process consolidation series [4].

Changes in v5:

- Rebase on the latest drm-rust-next.
- Move sriov_get_totalvfs() to the Device<Core> implementation and keep
  vGPU state detection on the Core typestate. (Danilo)
- Preserve the VF count as NonZero<u16> in VgpuState and unwrap it only
  at the firmware u8 conversion boundary. (Alex)
- Rename patch 4 to "gpu: nova-core: detect and store vGPU state". (Alex)
- Pass pdev directly to the device logging macros, retaining .as_ref()
  only for the FSP method that takes Device<Bound>. (Alex)

Link to v4 [5]

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
[5] https://lore.kernel.org/nova-gpu/20260709150206.1046839-1-zhiw@nvidia.com/

Zhi Wang (6):
  PCI/IOV: Return unsigned int from pci_sriov_get_totalvfs()
  rust: pci: add sriov_get_totalvfs() helper
  gpu: nova-core: read vGPU mode from FSP via PRC protocol
  gpu: nova-core: detect and store vGPU state
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
 drivers/gpu/nova-core/vgpu.rs                 |  91 +++++++++
 drivers/gpu/nova-core/vgpu/hal.rs             |  25 +++
 drivers/gpu/nova-core/vgpu/hal/gb202.rs       |  15 ++
 drivers/gpu/nova-core/vgpu/hal/tu102.rs       |  15 ++
 drivers/pci/iov.c                             |   2 +-
 include/linux/pci.h                           |   4 +-
 rust/helpers/pci.c                            |   8 +
 rust/kernel/pci.rs                            |  13 ++
 18 files changed, 395 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/hal/tu102.rs


base-commit: 22e77d81d0a9ab3aee1c5538b3f2f8a66930bfa7
-- 
2.53.0
