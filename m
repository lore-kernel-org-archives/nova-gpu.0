Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA69495ADC
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591354; cv=fail; b=mfJEniq8YNhTC7a1OvMPDn0lQbCOLdy9610oZqGqCe8zd50EMJQkoOWQUgiSGXb+xYrnmkIUcWseYB5ZjYvDakgKdRK4pDmzAU2S/oz1yt7pSCM+qcK2Y/lPE/99Zr60gUFIyOFfh66vV366iSIbFsCwnbQ9sLkVOwkoyVLLoko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591354; c=relaxed/simple;
	bh=FpSuFJVfO/Rcs7qdsyEGtzRa/leqg3AZNL62Y5tK2ww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pIjLwyjt+s1c8Ns5+0DvVLWlSjT/WTLzVNJ88sMR8DuctvC5O6x+5Ka5ZhNjVScwoXrxpzc+2Yq+eQihE3Fi5cbghQsA+WkJf9otwLO8gv4MxcLbBiOt0R8yAnKaukFbeNUy0xcLH8gvArd4fj7KJf+YTl4BaIyS6YSgtsPNFN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qjkNmBtC; arc=fail smtp.client-ip=52.101.57.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qjkNmBtC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvO3hzPHAOKHRSn3vvNoMiOhdIjnvenq5HcjeUqSCpXpYEUeIZmlVRRc50wb5TUa6VTLGAatzvu4wMeMLs90NEk9GAAdO5TCiC9Kkyb5xL6tv7J8x6gQlzOd6/0d8+A62icrTvicjZJGajH/mydI4ZTgOw+zSPI4UdBUErRkzWitFK7Cx/oBXdFc0KYPWUxThfmBlhdOisEAOguhNnBiBZFN+loObpgYQeAhtROngvAtOuP2RbfxdeK2bZnYujBBvTfBEHlyIntfZm64pH1JmRXfDuWJU+NKPia3DfScW0YnGStQRtofieVH8xHdpIiDlIwoSBilQDptPJG0H3OdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA+HfP5NnETj1wLJY7nxLX9JNOQJwr6YJEBHiyNxxkE=;
 b=m9DkRQMNQ4cpkby+o7qvtFlWVdf9DWYyiP7eqPoH/OeQQ8AwHvZlv9fux7TQhwStM9g97Jb0ajBwdGqgvELyfPY8l21memLc5w0pGerR0aZL/k0t2I3gKYoOA8oHg+s6BPioaEMCbDY5CNjaGFnvCJkvXYsHz/DTLWWwvCwLOGE/JFWHMwdQZYm6ydm0lFs45YWhZERpV+vbdsCvGWE7JysgzbLLYWBV8rJPgy+MoPvvQQje01IGUqhIhXpyf0tvurYuMyqmKq+2rlBsCxhp9V4IX3J8oT3L0ukCzr5sGVhT/BtsWXhg/qvusu3Ei5n41wNvnmgdYgstDOMqLs3U1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA+HfP5NnETj1wLJY7nxLX9JNOQJwr6YJEBHiyNxxkE=;
 b=qjkNmBtCkTjpbGtLOU5kd4hOW9wc9mOrgWetX/0/R7TeLrHV6M51jyWlk/m8WDujFm6IazqKWFpM4O+OHt7Raw65cEq3QSMKsxy4djDvjSz+0uZyObo5HKF3Xd19IWNmK1aIL3cQPyDl28W712k0iVE58fzCMCkEn4ua9j2xTO5S5WdCoBrTdJQTfy/P2mSqQ3A75tRtJpxCOB+k2OYB4/AO10eDjrSMvgpnahCnE0SN6X/Sd0PcHS1Cs25eH2y0CK8ZVtXSJf4SdD2ZSU81BLgTQ6rfzyK5j9rWhISyS659IVbhgfEbJjbn4tocr1ncIKZAaFF7UUV8r39CcPhn0A==
Received: from MN2PR18CA0027.namprd18.prod.outlook.com (2603:10b6:208:23c::32)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:29:03 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::93) by MN2PR18CA0027.outlook.office365.com
 (2603:10b6:208:23c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:29:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:28:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:28:47 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:28:38 -0700
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
Subject: [PATCH v3 00/31] Introduce NVIDIA vGPU manager
Date: Mon, 28 Sep 2026 13:28:03 +0300
Message-ID: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4c6c2d-3251-49b4-f455-08df1d4b5169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|10067099003|5023799004|11063799006|6133799003|3023799007|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	5O9+XjIHTSKwWd3Yc+qoxqq8K2wv3bQy0YqTYyl0Um1bO3Qi/TaCL2nX494RtuDAvpG3tzWItsl2XEB7Eiml3ab2x4Bjcs6RjeCktci2/3hBSsiU0/yPIEwawApX/X0Uc7LGOxGQidzvhPmhe5HiYsdGEY4C///evFCK5W5FiN3NiLID40CeCq2v2cGwOcTEr1S3IPBz3I60mtsGVC8Lt4UCmAd/529/PFuSyQG8ZUJUeRKWKlyK7FPNfHJdnHTeWBpFztl/rV8bjSh3mkribwUR2Om2nlFcJMHAlaKFSegsTbsgnWS2kauXkhhkMbcKsyzdyT4Rl2oP5+vUSKEw2BuMwtMHyyR8y62gc+st5v5cYBrBeLzknou5p3QH6TWJ+XsJ6868eaxilGkir8F/7XXrlG2EooeNady9RODY/f3ugxHPb/M5QGqjZx/vxW01S2IHdOEpoAJoPoCJSEQwWDl2RnSk3TBQF3IpesEMuKWqw8EPkdBB0DX666QNEswTFG8YTbumZWfnbvrdtcjO3JsPBDdMFxg9YsCpIsQER2nRGFEXLYXvAvVlhZz9HdE8X/MFeevBnYrLZ+t1WE87raL9DvGLFX7Lk9lOmzSIVb2Nxo9U+wIN2TLEwmadDeFt6+I7+LZS76d6SjOZ+xC/Iybdyb6dv51ZyFBDaP8KFD3om5E6qGFgjxzl2LwHcRrLNOj2eao8c+AHyBD+ZogTJw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(5023799004)(11063799006)(6133799003)(3023799007)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xBB3MKnZnE8xLQMKnoT9dTjg0b0SCXevUiXNmwnT/uasCr8SrHIkZ1LEOO2/U1tVuniYzxPGw4QKZEk9tPYIrB1NsnD1apNZvGhnkouv4NUppEPswZfU/Qyr6y8rsMKRMKonrvJQiJ/ubIGFihFqC5CLtN1uZKqKjQn50//7iVfQx0T/3cHFRdu2KNNwAjJTOHUJg49OcXWzTPA6aZv8C2EZ5pIOCdHMZWWDiGdnDGKTshE6asLKGEsABGTnyozl1YuArkzxUaqyigrnu11k7Qq01hAOBTiMol60qRlALdZvodFnJTHFEGQ4JU+x64YLStMKUYavC4jETuHUi2H15Jw85mK5QplR97F0r0NVcnmHm6G5SRGoVju83ACkQiTQz6yT+6H+MQ3ZV59nCEkDcayH4XtxHZbDQBr2B8rLFQYl8RTW2y5NjTHlfHYDaCFH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:03.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4c6c2d-3251-49b4-f455-08df1d4b5169
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099

Add the nova-core support needed to create and manage NVIDIA vGPU
instances on the current whole-GPU SR-IOV path.

The overall control path is shown below. This v3 posting contains the
nova-core manager and PF-side lifecycle APIs. Typed PF-service
publication and the VFIO variant driver follow separately.

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

The manager queries the type assigned to a VF by GSP-RM, reserves its
channel and VRAM resources, boots and configures the GSP plugin, and
handles shutdown. It also scrubs guest VRAM before reuse and exposes
per-instance plugin logs through debugfs.

Host resources remain owned until firmware teardown and BAR unmapping
complete. Failed creation rolls back through the instance owner; if
firmware ownership is uncertain or teardown fails, the manager retains
the affected resources until device removal.

This continues the rework of the earlier vGPU RFC [6]: firmware-facing
management belongs to nova-core, while the VFIO driver binds to the VF
and uses the PF's services. The companion VFIO driver does not need its
own copies of the RM firmware headers.

The patches are organized as follows:

  1-7   Boot state, runtime parameters and the 48-VM WPR2 heap.
  8-11  VRAM allocation, region views and BAR mappings.
 12-13  Synchronous GMC transactions and completion events.
 14-18  Plugin bindings, property queries and instance allocation.
 19-27  Plugin boot, shutdown and RPC.
 28-30  CeUtils scrubbing and plugin logs.
 31     SR-IOV PF lifecycle APIs.

Changes since v2:
* Rebase onto the newer GIN interrupt/GSP event and r000 firmware stack,
  and drop changes already supplied by the prerequisites.
* Add RAII for BAR mappings and VRAM slots, creation rollback, and pinned
  manager teardown while its firmware and memory dependencies are alive.
* Add the PF-side lifecycle APIs after the plugin-log support.

Previous versions:
v2: [1]
v1: https://lore.kernel.org/nova-gpu/20260905081116.106613-1-zhiw@nvidia.com/

Dependencies:
This series is based on drm-rust-next at 896ed0833627, which includes the
Nova memory-management work, plus the GIN/GSP event [2], NVKV [3], r000
GSP [4], Rust bitmap/ID-pool [5] and PCI prerequisite stack. 

The complete integration tree, including the prerequisites and the
companion VFIO driver, is available at:

  https://github.com/zhiwang-nvidia/nova-core/tree/zhi/nova-vgpu-20260928

[1] https://lore.kernel.org/nova-gpu/20260914074907.1399629-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/nova-gpu/20260912044400.677097-1-jhubbard@nvidia.com/
[3] https://lore.kernel.org/nova-gpu/20260827-b4-nvkv-v2-0-0de9d5c8658c@nvidia.com/
[4] https://lore.kernel.org/nova-gpu/20260918010719.1176945-1-jhubbard@nvidia.com/
[5] https://lore.kernel.org/nova-gpu/20260827-chid-v8-0-bc74c77d0214@nvidia.com/
[6] https://lore.kernel.org/kvm/20250903221111.3866249-1-zhiw@nvidia.com/

Alok Kumar (2):
  gpu: nova-core: gsp: decode the FIFO engine table
  gpu: nova-core: vgpu: add VRAM slot allocator

Zhi Wang (29):
  gpu: nova-core: gsp: pass boot context through setup helpers
  gpu: nova-core: gsp: decouple boot context from VgpuManager
  gpu: nova-core: vgpu: detect boot state independently
  gpu: nova-core: gpu: add a channel ID pool for vGPU
  gpu: nova-core: vgpu: initialize runtime parameters after GSP boot
  gpu: nova-core: vgpu: reserve the 48-VM WPR2 heap
  gpu: nova-core: mm: borrow BarUser for temporary BAR1 access
  gpu: nova-core: mm: add VramBlock
  gpu: nova-core: mm: add VramRegion
  gpu: nova-core: mm: add BarMapping
  gpu: nova-core: gsp: add synchronous GMC transactions
  gpu: nova-core: gsp: wait for GMC completion events
  gpu: nova-core: vgpu: add r000 plugin bindings
  gpu: nova-core: gsp: factor out NVKV payload conversion
  gpu: nova-core: vgpu: query VF assignments and properties
  gpu: nova-core: vgpu: add instance create/destroy
  gpu: nova-core: vgpu: encode vGPU boot requests
  gpu: nova-core: vgpu: add GSP plugin communication buffers
  gpu: nova-core: vgpu: add instance boot
  gpu: nova-core: vgpu: add instance shutdown
  gpu: nova-core: vgpu: initialize GSP plugin RPC buffers
  gpu: nova-core: vgpu: add GSP plugin RPC transactions
  gpu: nova-core: vgpu: negotiate the GSP plugin RPC version
  gpu: nova-core: vgpu: send GSP plugin configuration parameters
  gpu: nova-core: vgpu: update the GSP plugin BME state
  gpu: nova-core: vgpu: add CeUtils commands
  gpu: nova-core: vgpu: scrub guest VRAM with CeUtils
  gpu: nova-core: vgpu: export plugin log buffers via debugfs
  gpu: nova-core: vgpu: introduce SR-IOV PF APIs

 Documentation/gpu/nova/core/interrupts.rst    |  19 +-
 drivers/gpu/nova-core/fb.rs                   |  28 +-
 drivers/gpu/nova-core/gpu.rs                  | 133 +++-
 drivers/gpu/nova-core/gpu/channel.rs          |   4 +
 drivers/gpu/nova-core/gsp.rs                  |  30 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 225 +++++-
 drivers/gpu/nova-core/gsp/commands.rs         |  50 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  22 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  81 ++-
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 175 +++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |   2 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |   2 +-
 drivers/gpu/nova-core/gsp/nvkv.rs             |  39 ++
 drivers/gpu/nova-core/gsp/nvkv/encode.rs      |  12 +
 drivers/gpu/nova-core/mm.rs                   |   6 +-
 drivers/gpu/nova-core/mm/bar_user.rs          | 183 ++++-
 drivers/gpu/nova-core/mm/vram.rs              | 131 ++++
 drivers/gpu/nova-core/nova_core.rs            |   6 +
 drivers/gpu/nova-core/regs.rs                 |  31 +-
 drivers/gpu/nova-core/vgpu.rs                 | 111 ++-
 drivers/gpu/nova-core/vgpu/commands.rs        | 320 +++++++++
 drivers/gpu/nova-core/vgpu/fw.rs              |  70 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     | 471 +++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs | 496 ++++++++++++++
 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs  | 170 +++++
 drivers/gpu/nova-core/vgpu/instance.rs        | 642 ++++++++++++++++++
 drivers/gpu/nova-core/vgpu/log.rs             | 171 +++++
 drivers/gpu/nova-core/vgpu/scrubber.rs        | 173 +++++
 drivers/gpu/nova-core/vgpu/vgpu_api.rs        | 158 +++++
 drivers/gpu/nova-core/vgpu/vram.rs            | 179 +++++
 31 files changed, 3983 insertions(+), 159 deletions(-)
 create mode 100644 drivers/gpu/nova-core/mm/vram.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_comm.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/gsp_plugin_rpc.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/instance.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/log.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/scrubber.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/vgpu_api.rs
 create mode 100644 drivers/gpu/nova-core/vgpu/vram.rs


base-commit: b840061c3893d74b9827f05caffeaf08e707aed5
