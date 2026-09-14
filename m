Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080A3E49DE
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372191; cv=fail; b=JSYcLAJcSmx088/lWqnHG+tJBXqqLMmPR6NSmv/QvdeafV+bCT2cenWzK+f070vJRG5bXpTQ7zB2oTImouZb6auoDul5f2xZ9YdtdF0jgLwAtczFxukr/rq/asWqkeaulj/Y6Iia7d6glMCuudBass/RZGq8op7OL9PU9Aa3f8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372191; c=relaxed/simple;
	bh=pRqL6UDnovOjSDq1dj+nvHZwm3Mzvl5hj0z6zQX5P4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=enpvJFtp+J6IQSNtWpv7pGEbeXcRGVCU4HP5fOZQ7nzfT5M4HdDIu46V/8nCV5EqxOUGDESG3W5LxYw3MtGqF/ghZAZruY/kWY9tvws17QsFT0X71sbWD9ivdPvEPD7R4meHdezrP/DDGyHVVRW2ed6l9cOkT4+AYE1s5t2SjRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dzoo484+; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzoo484+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK+I1rwfoKAo9FcbnjoSHOlY5oP/1ffszLjRzFiP8vG7GZiDFUPuXKQsN+2v6fr5JN55hlHo4UiozaKJy2yzuodm7CWUZKz46lLLxPtkupeLjWW3BVPjn2FOuMiWyA3qLlnawCJJO03lpQ0w3TYHBzGT3cUn14baZ0Tmp7aKIQ7UwRu8/Jz8Dj9iCDoEbFSNUqnGbK1YtW29m/SRI20yz3+9XravyVsFZLDCm/CPd4NYqkA44TrnM6QNl2X4eu2P6w2kIi5nYM2wh0kqza/ryGj9zRYMPaWBV5b47J9fqMPWMoYrkAR4BO8Q08VvelDyyexS2nv/txNs2iPsSV+OHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw1s8U009uocRFg7MdKHNu4nhJCQGf+zZbHDexdU26E=;
 b=GVduz1hs/qiJrr41k0Wc9VGPTwf/zEIBV+uslVBGoJ5v1gQBDzcEW0P3I7HZ1yxhC+ucCK2MuL1o57OAd9WFWH0ScuZ5fvwWlX2iVLIYGcW3T9b5oGIuQOXgf9EaOrk6kHbE6Opbro+/VierQoy7yvgOWVsUkjEhxxfzukuQGOFqvzKGstM9AjjLLjq8nAJ9xFuZ9x4qKzmIzCNzGh4z/R8e+rcryTWjy0n1vUf8Byab/v8F99P1kN2OO9gmX0+MYes82G/KSA1qUVZ8T1OvPVsxGZQx9WMq/uZTqzcckKbhPJ81jDvZm8pW9vMys8R+q3Uxu3qvhpWNLpGknm5TZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw1s8U009uocRFg7MdKHNu4nhJCQGf+zZbHDexdU26E=;
 b=dzoo484+5XfCcpst39ckYU6Vw+bhnM5kk6y1SicCqD5zgzlz9ymmyExfjLG+HGQWdW8+9dxC9kMWkkoO2lp2Lpvj/5lqDTHz8fPTOs5H+1TJ6HOybUd/GZScV8qJkLmM8hoUX4OVEHsE3sRU+NY8/d/aOtlJtnNzLCZL71rB4F4kQqQnI4gmFep2Gt6JvO1VH3UKAY0CI66px1ft8WhdFFRzl1w/q0ifgDq5hpR1Xq2c8XEnSDKDXjmlGSYGEknZSPkBIaqS8TPSpLUWh6d2ZyxZNInfkC4Fn/UUWJ32SujcizDNCiLNkrBrjEmFd5TCsYCcEZ9VA4fM3txWCT2r+A==
Received: from BN0PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:e7::25)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:49:38 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::24) by BN0PR03CA0050.outlook.office365.com
 (2603:10b6:408:e7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:49:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:19 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:11 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 00/32] Introduce NVIDIA vGPU manager
Date: Mon, 14 Sep 2026 10:48:35 +0300
Message-ID: <20260914074907.1399629-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: bb75cd37-b56d-42c5-0f3a-08df1234b9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|5023799004|11063799006|56012099006|10067099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	FDbX0WwEY1V1/kdqwN609Kn1tbzw2H8a2yc/2qqkS08dejjaEL9PPGhGa7Rd3caJZF0giyNMOExnV+dU4Dc4DpBtSn4RugIRNSXknnwwdBmySCZ94oyiCogR6KpfmO895+ypCu9clyOqOsxOoL2uhYHiZa2mcVCt0W8AKpBEQGTztBq5kNZ6GVXqF0NX0Ydwk7zWXcAwgV1iBtfMUrJqC1P5090ErOFlt6g4EoyDxfF8ETxUyF7+sN1ttnmOknM4qIMbl4wp/gV22nkAFOoD1k+w52LVDKepFoIXxldESqPtG54Xw4kKlM4qk+C674WSJ/crcS2E2MM59ZcaN1vZQ15j7/VyQlqSC/Dlh4wYggebPdIsH9DynQERlG2+Bz0+m7c6N0duT3rO5Av7zSXCTE1B9qEQLiIBC13Ks0TGt+rHKJ2kjv443MI2xpv+Swv4elHk9GSvRFHwm6EVbm46MFlHxqZcum272D1fgpCztHgzYec7VhI9p3M/tTHw6j5nfo31fvyaq+lpO6p7v2sWuv6klz5P3ZEljpqhtUXi7UV+ZoGwFahz45rUEw3dbbFZrKkikEvo3HZcpDO5H8FT16o2wVsdb3SIJjPi+e70G9s652T667/pJ2Ye4SRy/AW18VHRPE92yucSdOM1LZ7IpZqKC1A/SwD+XBj4pOR0YwC0ECUR6iCeXp9lNsNTNlZtEbsyWBhjplcN4T6u/y7Tbw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nemMnR0GgmAvPBAArM7BKQSiSAItOlTYGEGbt8N7OlTuAGfN4FsXDqSbbSNY5+wEKPbWFVQq4I+knFQCwl8kgNKMETMwlCSt05QS5N1bchKZamwgEGrlnTPFBBx2WLRuWn2mfBsxCnAaC9RvR5HJnvujDa5oP3L/2mqtGeLtaZBreXb872/aOlAEz1IHRMqMiP3p1lAuQH5amkAUHAoKZVLpvCGIqCBRxz+5q4rcdQObPE+Spec6cUGHFlcIrK3ACxOeCdv7mBDCp3UD86nELElnOI9pIkHkg/whHu2le4Dusp1GTV9qnf5IwsSF1L/aRYApyG2AkWp5DAMA2SMLoQgwFN6gsmeHVX+1X9QFJDACHm73PHIKoKgDcJPKF2J8/JqTOlDFYZpAqJ+2U5qPAnp6RUfNx/5J30SlVgdWJ15BhM4ymqEl1vx7Ov07u8UQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:49:37.0909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb75cd37-b56d-42c5-0f3a-08df1234b9b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

Add the nova-core support needed to create and manage NVIDIA vGPU
instances.

The overall control path is shown below. This v2 posting contains the
nova-core manager; the VFIO lifecycle interface and variant driver are
split out for separate review.

 +-----------------------+         +-----------------------+
 | Linux guest           |         | Windows guest         |
 | NVIDIA guest driver   |         | NVIDIA guest driver   |
 +-----------+-----------+         +-----------+-----------+
             |                                 |
 +-----------v-----------+         +-----------v-----------+
 | QEMU (VFIO user)      |         | QEMU (VFIO user)      |
 +-----------+-----------+         +-----------+-----------+
             +----------------+----------------+
                              |
                      +-------v-------+
                      |   VFIO core   |
                      +-------+-------+
                              |
        +---------------------v---------------------+
        | NVIDIA vGPU VFIO variant driver           |
        +---------------------+---------------------+
                              |
              +---------------+----------------------+
              | binds PCI VF                         | PF lifecycle API
              |                                      | open / close / reset
              v                                      v
     +--------+--------+               +-------------+-------------+
     |    PCI VF(s)    |               | nova-core (PF driver)     |
     |  (virtual GPU)  |               |       vGPU Manager        |
     +--------+--------+               |     VRAM / channels ...   |
              |                        +-------------+-------------+
              |                                      |
+-------------v--------------------------------------v----------------+
|                      NVIDIA physical GPU                            |
|            VF resources                 PF / GSP / VRAM             |
+---------------------------------------------------------------------+

On the nova-core side, the PF driver owns the GPU firmware-facing part
of vGPU management. It already detects vGPU mode before GSP boot and
supplies the SR-IOV topology to the GPU System Processor firmware
(GSP-RM). This series extends it to:

  - Retain the firmware-reported VMMU segment size and FIFO engine
    ordering after GSP_INIT, together with nova-core's channel capacity.
  - Add VramBlock and VramRegion ownership plus BarMapping for bounded CPU
    mappings of VRAM-backed control structures.
  - Query GSP-RM through its command queue for the vGPU type already
    assigned to a VF and its properties.
  - Build a layout-validated pool of paired guest VRAM and management-heap
    slots for the vGPU type, reserve contiguous channel ranges, and keep
    live allocations in a per-PF instance registry.
  - Use the typed r000 firmware bindings for control and response layouts,
    message IDs, and firmware-defined region sizes.
  - Handle GMC transactions over the GSP queues, match GMC replies by
    command and sequence, dispatch interleaved RM RPCs from the shared
    GSP-to-CPU message queue, and consume stale GMC messages.
  - Implement the GMCAPI boot, shutdown, and cleanup operations with
    typed channel and resource maps for each plugin instance.
  - Establish the BAR1-backed PluginRpc channel, negotiate its protocol,
    and send the VM configuration and plugin BME-state update.
  - Use per-instance CeUtils channels to scrub guest VRAM on allocation
    and shutdown. If ownership or completion is uncertain, keep the
    affected VRAM and channels out of the allocators.
  - Expose the three per-instance plugin log buffers through debugfs with
    the header needed by nvlog_decoder.
  - Keep resource locking, teardown, and rollback inside nova-core.
  - Select the firmware-defined 48-VM WPR2 heap when a device advertises
    more than 32 VFs.

This is a ground-up rework of the earlier vGPU RFC [1]. In particular,
the vGPU manager has been moved from the VFIO driver into the nova-core
implementation, and the companion VFIO side no longer carries copies of
RM firmware headers. The VFIO driver attaches to the VF and uses its
PF's nova-core state for management, as discussed in that thread.

The patches are organized as follows:

  1-8   Initialize VgpuManager and select the larger WPR2 heap for 48-VF
        devices.
  9-12  Add the memory building blocks.
 13-16  Implement GMC transactions.
 17-21  Add firmware bindings and allocate instances.
 22-29  Implement plugin boot and RPC.
 30-32  Scrub guest VRAM and expose plugin diagnostics.

Changes since v1 [2]:

  - Split the nova-core work into smaller patches and separate the VFIO
    lifecycle interface and variant driver from this series.
  - Separate boot state from VgpuManager and use borrowed GPU resources.
  - Split VramBlock, VramRegion, and BarMapping; separate firmware
    encoding, command submission, and instance lifecycle operations.
  - Include build ID/log-header support and introduce command schemas
    with their consumers.

The series is based on drm-rust-next plus the nova-core r000 GSP,
NVKV v2, memory-management, SR-IOV, Rust bitmap/id-pool, and PCI
abstraction work. The exact base commit is recorded below, and the
complete prerequisite stack is available in [3].

[1] https://lore.kernel.org/kvm/20250903221111.3866249-1-zhiw@nvidia.com/
[3] https://lore.kernel.org/nova-gpu/20260905081116.106613-1-zhiw@nvidia.com/
[2] https://github.com/zhiwang-nvidia/nova-core/tree/zhi/nova-vgpu-wip-nova-gsp-20260914

Alok Kumar (2):
  gpu: nova-core: gsp: decode the FIFO engine table
  gpu: nova-core: vgpu: add VRAM slot allocator

John Hubbard (1):
  gpu: nova-core: add build ID headers to debugfs log buffer dumps

Zhi Wang (29):
  gpu: nova-core: gsp: pass boot context through setup helpers
  gpu: nova-core: gsp: decouple boot context from VgpuManager
  gpu: nova-core: vgpu: detect boot state independently
  gpu: nova-core: gpu: add a channel ID pool for vGPU
  gpu: nova-core: gsp: expose the VMMU segment size
  gpu: nova-core: vgpu: initialize runtime parameters after GSP boot
  gpu: nova-core: vgpu: reserve the 48-VM WPR2 heap
  gpu: nova-core: mm: borrow BarUser for temporary BAR1 access
  gpu: nova-core: mm: add VramBlock
  gpu: nova-core: mm: add VramRegion
  gpu: nova-core: mm: add BarMapping
  gpu: nova-core: gsp: dispatch RM RPC messages during GMC receive
  gpu: nova-core: gsp: add synchronous GMC transactions
  gpu: nova-core: gsp: add status-only GMC transactions
  gpu: nova-core: gsp: wait for GMC completion events
  gpu: nova-core: vgpu: add r000 plugin bindings
  gpu: nova-core: gsp: factor out NVKV payload conversion
  gpu: nova-core: vgpu: query VF assignments and properties
  gpu: nova-core: vgpu: add instance create/destroy
  gpu: nova-core: vgpu: encode vGPU boot requests
  gpu: nova-core: vgpu: add GSP plugin communication buffers
  gpu: nova-core: vgpu: add instance boot and shutdown
  gpu: nova-core: vgpu: initialize GSP plugin RPC buffers
  gpu: nova-core: vgpu: add GSP plugin RPC transactions
  gpu: nova-core: vgpu: negotiate the GSP plugin RPC version
  gpu: nova-core: vgpu: send GSP plugin configuration parameters
  gpu: nova-core: vgpu: update the GSP plugin BME state
  gpu: nova-core: vgpu: scrub guest VRAM with CeUtils
  gpu: nova-core: vgpu: export plugin log buffers via debugfs

 drivers/gpu/nova-core/fb.rs                   |  28 +-
 drivers/gpu/nova-core/firmware.rs             |  34 ++
 drivers/gpu/nova-core/firmware/gsp.rs         |  16 +-
 drivers/gpu/nova-core/gpu.rs                  |  68 ++-
 drivers/gpu/nova-core/gpu/channel.rs          |   4 +
 drivers/gpu/nova-core/gsp.rs                  | 206 ++++++-
 drivers/gpu/nova-core/gsp/boot.rs             |   4 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 287 ++++++++--
 drivers/gpu/nova-core/gsp/commands.rs         | 105 ++--
 drivers/gpu/nova-core/gsp/fw.rs               |  26 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  39 +-
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 175 ++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |   2 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |   2 +-
 drivers/gpu/nova-core/gsp/nvkv.rs             |  35 ++
 drivers/gpu/nova-core/gsp/nvkv/encode.rs      |  12 +
 drivers/gpu/nova-core/mm.rs                   |   6 +-
 drivers/gpu/nova-core/mm/bar_user.rs          | 145 ++++-
 drivers/gpu/nova-core/mm/vram.rs              | 140 +++++
 drivers/gpu/nova-core/regs.rs                 |  33 +-
 drivers/gpu/nova-core/vgpu.rs                 |  85 ++-
 drivers/gpu/nova-core/vgpu/commands.rs        | 333 +++++++++++
 drivers/gpu/nova-core/vgpu/fw.rs              |  70 +++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     | 457 +++++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 495 ++++++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs  | 169 ++++++
 drivers/gpu/nova-core/vgpu/instance.rs        | 538 ++++++++++++++++++
 drivers/gpu/nova-core/vgpu/log.rs             | 171 ++++++
 drivers/gpu/nova-core/vgpu/scrubber.rs        | 162 ++++++
 drivers/gpu/nova-core/vgpu/vram.rs            | 146 +++++
 30 files changed, 3783 insertions(+), 210 deletions(-)
 create mode 100644 drivers/gpu/nova-core/mm/vram.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/instance.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/log.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/scrubber.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/vram.rs


base-commit: 9ff5fd561368ebc3cf1b82a930823ace445564cc
