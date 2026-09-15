Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CC3A4508
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505865; cv=fail; b=FU30QZzevAz558KCIhzKX7h+SY/yAtbMt/MYryRwOv4y44XMqHGjNRk7SrIbmztx8mOtttCvawNOPtleHAU4HqCIkkcwuzh0KFckPNguOibv63b4BFt5EFtdCplrpUKx5K/v8QaDDDXUGiKPPpkLhfJHepWaTCrRnY8W69UUKZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505865; c=relaxed/simple;
	bh=JMxTOmUI+KM6DfhS94K6tOVUJd+UGC6bP6dRvWFurG8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WhTmkMbhxzFMq3zTcDoX5uBcTvlD1s2xj7LVZul5DwQwNVzgLC5iMv20dd9l/ANQIwTFk/aZqzYF2dwuiY1WqLHSSqhyoW1YqY6oUJFWkCo4fP8eoZotV/Hesd+tp922Geb0/++fgi/9SCq3ZON/MlhUD5vHIGYCCnCX1/TrltM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sbHFovWn; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbHFovWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd+jfhD/e2kOcRF1xvYrojQq6NWTXu+4Qeo6qVPd2Esti0Z6QO7U3MCt1NLVuEt2gD902izY1hi9WGUeiBTHK0QTTJdFjACae5DzQb6FbuJdOd9v/xOkC0pTXM1FSrqDF0k8ld18JT64eC3ZTV4zrpDeuqwBw6i92f/+5861jI+cL+YIHmRzaXBYKf2AY7PLKHpXgnNrj6bOtTBt+4M4+l3rRB3gNFdos+6FX+kllUoEsYBZxLvBuxqagaEnMqW0V/bHD2d+xIQk5t9sz+kk/LfccUNG9fhOyGlABeSUBIVuD4FtTfKEFWGYKwhj51fdCK8wb0b5eYfSUHFzbm24fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF6I2bVwKx9QCaToOGE/IeThRJPW8s2vGrmB7NfWS9o=;
 b=IpC0JpTI6+PkCjKND2oGA4IS5IlRxkTiUQNQx9eS05ybzOXaaTbslZK317341vl3N3ZtziwIWS0KRmCjDnU4XEgUDgLxusNa6z4YIfi8Pu/9bT+3hDC8+JrfaZbvgR5e/aaZmuOWuQ1zpZORDXw38pzRWT7coyeveAOnYSLIRSfqWaFNJLkFI24xU8IIEgBIpBVR3u1vqKzS46MjmrA4NagNFSHDlj6jwJiQGlY415xffTEnJlzX0LMzlg3X5qS1QumnaXBYUVZ5NyE+4jGIIETY8d47ssfb8FBvh1TGcvrjbNUDOjPIVmrg9KCSGiBt5pWTMlIqQ8lsVxGa5wI4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF6I2bVwKx9QCaToOGE/IeThRJPW8s2vGrmB7NfWS9o=;
 b=sbHFovWnkHiakTjDYbUAlNmmJdOiXtZkyNnfzB2/9gqHf7rbD8hKgyGOk6npfUAkqbaPXK4UUzYbjJFja/Yh7K8e1W4uqFXswIuYRk/4V+sGh4KbfzpMjrwiaflXCfaoMCr94mbj1jc2xXTGPMrnrewcjVVK/sHfuGUdTcHeDSnPSHRBnCGQVgu5hI4vUj5rPZ+1ATXw5J73D4n0mfUUqeUsSmmC4o1BQ0tIzgh2AbytnI3ivMCZLX6HXdLjhMc5DjJjxZmcYqMdRidpLvxirjX6RXBpw7ukL4V7iAC9PeoTWBDlC2rP9mUTbKrv5cVYpvSS69lEOeY9sdMyE3azAA==
Received: from DS7P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::18) by
 DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 20:57:26 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:25e:cafe::8f) by DS7P221CA0042.outlook.office365.com
 (2603:10b6:8:25e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:57:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:09 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:08 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:01 -0700
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
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH 00/14] Add Rust PCI SR-IOV support
Date: Tue, 15 Sep 2026 23:56:44 +0300
Message-ID: <20260915205659.76841-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: ce757b31-7a05-4918-e7c6-08df136bf2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	CJu7j3SpA4rcXRAADRLf3qePcM7M6HxqW5El+qHamgZpHAON2uvY3+75SLFqfVwEHtixDlXW4+vA4BI6Xjna+oZ4NGMahUd9/+Qu3axNWHlc9w+R81cb0Jzsn81UQHqOI7y8wM89s+Zyn2vSC5EHtGlL7RHULvhOgfekxi9yI4a8nCJkiHQ0bR/aqldmhwkIeikGF6aYFBOZAFZ9DbANa3mc+HPLL0bO32ljJX+DKPUccAYy5Hst/rmmKeQ1EoUfdqfKX8Zd+xxPoTvcIU5DqPUs+ZwGOVADfH74rxtmv2ZXUenksZacIoGJI4CbLEq+dj4XJNqCR/PyA7pchjjT3lUSTBM3XKCjUSRFd4hRWN8HN//fPjpLJUBqXqq28i0W6zH+IYXUmH0qbZpd/T3MrKA4zPqUuPCP/4/ydSl7AZoKzS3FKLdTW7f70EssivS8ic+6613p2pzkBN00/NPUrYfNTSEZxUOABAvzRb4nXvSNOZT+kzhGKqFauPOk/hNqC7vFp17aDfrxHdDV/vrGxXVOwSUnrMef3xuWTmheQ/7xO8QW5+3An8LH3f7F54TAhBOvFBbQVjntmM6itG3U+Gtb17+zfFpcl2Pavw+yX+DT6TU23FGksJVSvo1K0PeIQbrjGcDukphSefUymAW0Vea1JQYUtmiD9lSBvN796DKEXPY56VU1Lj/JBJfVK9BIUD4tYs4NxITVIjHBudkEYg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HrA+kuKvH7DbjsSHa6M6wTBcAH3SJeYM51tbxOHQFki9x4nT84qPKiMhRVt8uFPXxVrn+IiORojKRY+N5xkB2VrjqgTaFtFf/CqMCCy+Pzxd33tVK1erHVBFWST+SDie+FO40Cf3zp2dN2lDf+eEN5qMGPZeocKoa0iENydyuet2fBTZRbF/uA2Ttpv6qRGsr79tS4F4sKlVbn52+MmqdkN8eYaz5OEBFgOomZL3Ka9bOJ4cadWbOxJEoYCfRab+qZqbmR/X3iZmNh58500DWrur4JIVCe5T6mSB8L3qKwGLSP+pf86HjbwO7axM+BgBO8MDYj1PGFPLQ4MjAKF5Na/qbc3OMoaDJWcwBCJh/zbM1qSNI0/FGir6eP7ts+4sx6wHEgmQaxQYORLo4lDYnM+QzHkqr0mb+o02NP2NKwb0PNiFr+86spj+pYuGdh55
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:57:26.1732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce757b31-7a05-4918-e7c6-08df136bf2a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684

Rust PCI drivers need to enable and disable SR-IOV and share selected
PF-owned functionality with their VF drivers. The shared data must remain
valid while a VF driver is bound, including when the VF driver is in C.

This series builds on Peter Colberg's Rust PCI SR-IOV v3 series [1],
extending it with typed PF registration data and C FFI support. The
registration design follows Danilo Krummrich's Rust vGPU/VFIO PoC [2].
As the discussion on Rust/VFIO support is still ongoing [3], this series
supports both C and Rust sample VF drivers.

Add the PCI SR-IOV operations and callback, managed VF removal during PF
unbind, and typed PF registration data. A pinned registration publishes
the PF payload. Rust VFs borrow the typed data directly; C VFs use an
ABI-checked descriptor and generated C-to-Rust trampolines.

Include Rust and C VF samples and integrate the registration into
nova-core. Nova implements sriov_configure() and publishes PF-readiness
data before VFs are enabled. Document the sharing interface, its borrow
lifetimes and teardown ordering.

[1] https://lore.kernel.org/rust-for-linux/20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com/
[2] https://lore.kernel.org/nova-gpu/DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org/
[3] https://lore.kernel.org/nova-gpu/20260914121217.70fa0d93@shazbot.org/

John Hubbard (1):
  rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (7):
  PCI: add driver flag to opt into disabling SR-IOV on remove()
  rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
  rust: pci: add vtable attribute to pci::Driver trait
  rust: pci: add bus callback sriov_configure(), to control SR-IOV from
    sysfs
  rust: pci: add is_physfn(), to check for PFs
  rust: pci: add num_vf(), to return number of VFs
  samples: rust: add Rust SR-IOV VF driver sample

Zhi Wang (6):
  rust: pci: add typed SR-IOV PF registration data
  rust: add C-to-Rust FFI descriptors and trampolines
  rust: pci: add C FFI support to typed SR-IOV PF registration data
  samples: rust: add C SR-IOV VF driver that calls into a Rust PF driver
  gpu: nova-core: publish typed SR-IOV PF data for VF drivers
  Documentation: rust: explain SR-IOV PF data sharing with VFs

 Documentation/rust/index.rst             |   1 +
 Documentation/rust/pci-sriov-pf-data.rst | 330 +++++++++++++++++++++
 MAINTAINERS                              |   4 +
 drivers/gpu/nova-core/driver.rs          |  34 ++-
 drivers/pci/iov.c                        | 103 ++++++-
 drivers/pci/pci-driver.c                 |   3 +-
 drivers/pci/pci.h                        |   2 +
 include/linux/pci.h                      |  44 +++
 include/linux/rust_ffi.h                 |  88 ++++++
 rust/bindings/bindings_helper.h          |   5 +
 rust/kernel/interop.rs                   |   5 +-
 rust/kernel/interop/ffi.rs               | 252 ++++++++++++++++
 rust/kernel/pci.rs                       | 126 ++++++++
 rust/kernel/pci/sriov.rs                 | 355 +++++++++++++++++++++++
 rust/macros/ffi_vtable.rs                | 148 ++++++++++
 rust/macros/lib.rs                       |  90 ++++++
 samples/rust/Kconfig                     |  26 ++
 samples/rust/Makefile                    |   2 +
 samples/rust/rust_dma.rs                 |   1 +
 samples/rust/rust_driver_auxiliary.rs    |   1 +
 samples/rust/rust_driver_pci.rs          |   1 +
 samples/rust/rust_driver_sriov.h         |  27 ++
 samples/rust/rust_driver_sriov.rs        | 270 +++++++++++++++++
 samples/rust/rust_driver_sriov_c_vf.c    |  61 ++++
 24 files changed, 1972 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/rust/pci-sriov-pf-data.rst
 create mode 100644 include/linux/rust_ffi.h
 create mode 100644 rust/kernel/interop/ffi.rs
 create mode 100644 rust/kernel/pci/sriov.rs
 create mode 100644 rust/macros/ffi_vtable.rs
 create mode 100644 samples/rust/rust_driver_sriov.h
 create mode 100644 samples/rust/rust_driver_sriov.rs
 create mode 100644 samples/rust/rust_driver_sriov_c_vf.c


base-commit: 34a8ecc902e907d7b0596a8d38b437e90eac0701
