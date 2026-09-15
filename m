Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ADC282F10
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507128; cv=fail; b=Xi+NVqAr/AzLpLXzeDFdR2LsJv8KH2qWKD3ecXpY7USv7vzRm76hbWzw68P5C11AKg9WjGb6VZsp1jlycGlq4SlUlS8S9ThUto7L5THf5E3xsjyl/kq5rvuRGQyt4O7Uc7z4YZF3bNo37RIo6JW3kWbHtZf68YrjdGLRoiH86V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507128; c=relaxed/simple;
	bh=zkssh7EEGiR3mnv6sHOVW4cjjySsnce82G+iteucu6A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DX8ZDShEKhyDm3tX1VBgeI3cq6NGGwX7cULLhjo1YYaFNAV282tjisCTYntgAdhT0VqsSeeIlK7+Um1Pf8Qvlm90I+oTWaDbgfS/lF5Q1SqWqcg06SGjWOrofaocPmC9dmU4MqSdeWHalcCG3zRTR84aVwPC20+CytXFmcAOcfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UwkLNUtl; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UwkLNUtl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGZfV/+OmaPTKY9C4IXoTckYt6o2CSlP8jKoOv/QxOM9J8SS4mjTRtG+rxxwWFePbuF0YB6+yyTmKjO7PU5XL86fR80DkmIMFCKUdeGoiAhahhk7wmiSNsCn3r8thF6FkLBhtaHkGb8bMfQCvZ0GMkXP6pNju7QtGF7RLcOXIczZCPP0WwNG/Sh5wag+Ziikq1qie2bLVeiSOl7SmGAAYuOsZ5nGDNnpTOyeJFhrFK30leeSiaiQPnp8/auKEzm3N6OKaHcbnBAizagqCJR7M6nAvKmTfCJ+GWhJVLBJ6XTgGw3BsvijWIEWkcENrv7UV39VsmekXfJaKORZZxi5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkbgvLgmGd45t31jcg9ernj2GuwjwjsXONufXeomtTw=;
 b=mHXzCjfC+bf3ms1fFN6JLc6PwghRqMnDOcNFhYhCNq28zjS5cLM+waRQFJpgLCId5Y4hVBpq5DkSSjkL1XfQxLebIthiyEwCLxVFRAt6xPKsZcwfFjFCCCATMmJv7xKK8vKy7KHRHqBPNw8RM32Rc4+nqm7k77cOUiASXSW4Q43H/vVmfyPOgde4qYYu4+y4yeAUpC6dAm5B1iGlrKmWD7fOJ9k1sDDD44dgzk2MJCNGWOR0EYdf1VfgcugN4AZvqBV5DDjnZQRUqNmFqEv/VU92675lYvJimk0f+nlMXl0xMvLEaHiQdie5rE0axv521yRCz89gR7nkffFwjp/d/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkbgvLgmGd45t31jcg9ernj2GuwjwjsXONufXeomtTw=;
 b=UwkLNUtlXv7CPdlJVb9+RHEPGYY3IaGhPJLfPqXOqFRJ8SyMXzDtlbil7X+KwZmN6sl9WIrWwscaaKL02wfVYY6xdP+FGlNGHfKUkl6OJgFcHo0zQnSp66XbUjXjeDHCBnbFJKgIxyIKntMPtT8xp+sG0gCh7HrJqIThPMTWXxhDVUI0BTwRGp7wR7NjfYt2e6Ecdy+iZ8M5kUMtDmX56IUg7sNGzDnAXcumuqEMx6Q1jJqIJPrjeeH2VjzgaOZTW6NI8e1K7D+/87IF3doZDsOHEiaDuYQB+hhsHYkWmfFkwmvLd6/LUsrfWADjJRBfw6S6MccJh106FOqRF2OzGA==
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by SAWPR12MB999317.namprd12.prod.outlook.com (2603:10b6:806:562::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 21:18:41 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:5:1e0:cafe::3) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 21:18:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 15 Sep 2026 21:18:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 14:18:20 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 14:18:19 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 14:18:12 -0700
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
Subject: [PATCH 0/2] Nova vGPU lifecycle FFI and the NVIDIA VFIO driver
Date: Wed, 16 Sep 2026 00:18:08 +0300
Message-ID: <20260915211811.84790-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SAWPR12MB999317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfe9c12-d69c-4989-c580-08df136eea75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|10067099003|6133799003|3023799007|18002099003|56012099006|11063799006|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	XRGqhqmrXb8wBUE3y0UIQH64JfmVuVfJQ1U2bV1D/jvDLfWNKyLynPw30EhYkUlAXrbaWlmur2iXEW07PaAiIWlCVul+u2jCeC060RC/SOZ2M6K1lejAa7XwjlqyJgiJCV/ubq7zb5cB+EBJOilp7krqnEonWB+w3YBS9IqeeNeQ+M04O4+Tc5f29+l9r4IkpMEbf2F0zNNWxBkVe29HDQQzlSf6sDW9aH0+4kslKXNUcprKclmltIe0cDZYAjLbum20NqRdzwyNkoN3c4Tg3QtV8fpM5wXpdM1k15Y1rlvqSBVDFyNZbmpEqOFEhJb75BCDTHB+oGbfMeE3Ay9bdEmodi1HVXXFo7Fu4R+8HIvRk8t/u5F68fpNHjGgmigA2W7gcTkb2dRptaSFMGt/idBlJ0odoVRKooOqX3GK3wKoVG9QB+9Bzli+tStEQWeCcN6XVclH814OEXbgCEXksTzKlrao8gyrs+KdG45VZknD6+0Ypyqjn23MnkodtPtt63T9NlTpHAcWfSCZK1H2ibQKH/F+NCGsZ8F9ic4EVFT1Z5Sd0Zj8YIzVTh/yafiBgW1yugib2nU/CO79LIRQLkpm9SCvQUWVx8+Id6mmsZOKp3SJWcni+RtrebLSgTiOrpXSPBZaKkkPq6NIu194LyG5AQO4f9x3wrFV+ikjamSEm2Sjz5EhtYxykj9LGfClBWyjCDgjipOaSF/7x5ai5Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TalGrazXDlUmk6oAC6t2dlYhfzvF2ZYUojbHqWABR3i4K6P6e/QS9nW5PPx2f/0kMAnY7NpJqpevV2ywBVez9VQxkmanbsJ4IyrpfP8QNfI/urglMqSgb7woujf25+EtxdVL6E/SwY13ml7pnGXIeNnliSz0O5IWiarqK3p1phKLfPXjVlID2YEaQF8hzH0sUChq6aX8nSVUJa0RaBuNll2caFRL0vWtOvRQfyt9gMopa6ixaCmoFhYFicQ8tfDZ04aucbYF01o3ihlSGUx1UPsqEVXMMgPjkQSEAc7sl66BXe6Vv891ED70dW6YWBmC4mOkaPy+HjB9YOKjd7nF3VC0XzL1Kv+bc/Pu/qh2PZMdb2kW8zden0qrKRfip/211z1RrhYn6uGs9/St9qfUcH2fmAYUtqv1NbZJbL11Ij6xke+961aVtgJxvAJMZoFe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 21:18:40.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfe9c12-d69c-4989-c580-08df136eea75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999317

The NVIDIA vGPU VFIO driver is written in C and needs to invoke lifecycle
operations owned by the Rust nova-core PF driver. VFIO open creates and
boots a vGPU instance; reset resets it and scrubs guest VRAM, and close
shuts it down and releases its resources.

The discussion about implementing the VFIO driver in Rust or C is still
ongoing [2]. In the meantime, this series updates the patches to build on
"Add Rust PCI SR-IOV support" [3] and addresses Alex Williamson's review
comments [1, 2].

The first patch publishes these operations through NovaCoreVfApi in
Nova's typed SR-IOV registration. Managed SR-IOV keeps the operations and
their pinned context alive until the VF drivers have been removed.

The second patch adds the NVIDIA vGPU VFIO PCI variant. It uses the Nova
interface when the VF's PF provides a compatible one and supports
ordinary PCI passthrough otherwise. Configuration-space and BAR handling
stay within the variant; this series does not modify VFIO core.

Changes in response to Alex Williamson's review [1, 2]:

  - Restrict matching to NVIDIA 10de:2bb5 in the 3D display class (0302).
    PFs share this ID with VFs, so matched PFs and VFs without a compatible
    Nova interface use vfio-pci-core passthrough instead of being
    rejected by probe.

  - Store the assigned PCI device ID in vconfig after enabling the
    device, so configuration reads use the core's virtualized value.

  - Enforce the assigned BAR1 aperture for read, write and mmap, using
    the same limit reported by GET_REGION_INFO.

  - Use reset_prepare/reset_done callbacks to cover configuration-space
    FLR as well as reset ioctls. Serialize instance open and close with
    the reset interval. Preserve firmware reset errors for reset ioctls
    and signal the VFIO error IRQ when configured. These callbacks cannot
    abort the PCI reset.

  - Use SBDF naming and document the packed VF address. Remove the
    redundant VF check from open; probe selects the appropriate ops.

Subsystem ID reads remain in the variant's configuration handler because
the core reads that field from hardware. The C driver preserves the
existing VFIO drvdata contract and adds no VFIO-specific pointer to
struct pci_dev.

The passthrough path uses vfio-pci-core defaults. This driver has its own
enable_sriov parameter and does not inherit vfio-pci's other module
options; full module-option parity remains open.

[1] https://lore.kernel.org/nova-gpu/20260908210044.6514a092@shazbot.org/
[2] https://lore.kernel.org/nova-gpu/20260914121217.70fa0d93@shazbot.org/
[3] https://lore.kernel.org/all/20260915205659.76841-1-zhiw@nvidia.com/

Zhi Wang (2):
  gpu: nova-core: vgpu: export lifecycle operations to VFIO
  vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant driver

 MAINTAINERS                               |   1 +
 drivers/gpu/nova-core/driver.rs           |  59 ++-
 drivers/gpu/nova-core/gpu.rs              |  58 ++-
 drivers/gpu/nova-core/vgpu.rs             |   7 +
 drivers/gpu/nova-core/vgpu/commands.rs    |  11 +-
 drivers/gpu/nova-core/vgpu/fw/commands.rs |   1 +
 drivers/gpu/nova-core/vgpu/instance.rs    | 153 ++++++-
 drivers/gpu/nova-core/vgpu/vgpu_api.rs    | 235 ++++++++++
 drivers/vfio/pci/Kconfig                  |   2 +
 drivers/vfio/pci/Makefile                 |   2 +
 drivers/vfio/pci/nvidia-vgpu/Kconfig      |  21 +
 drivers/vfio/pci/nvidia-vgpu/Makefile     |   2 +
 drivers/vfio/pci/nvidia-vgpu/main.c       | 509 ++++++++++++++++++++++
 include/drm/nvidia_vgpu.h                 |  51 +++
 rust/bindings/bindings_helper.h           |   1 +
 15 files changed, 1084 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/vgpu_api.rs
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/Kconfig
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/Makefile
 create mode 100644 drivers/vfio/pci/nvidia-vgpu/main.c
 create mode 100644 include/drm/nvidia_vgpu.h


base-commit: 4c627824f040e6bd4a10bff4b1c353cdfaf1fc15
