Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CDB25A2A2
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970132; cv=fail; b=eqqSy/xaCd3VRVM5wlZvqDS6buhsHgHfvEnJkQ4XJshwpY7QeYyNkxVXwYtWEu7fCtl/Lxe3nsBV2MaxfsMNeBngGJyhwobbO9MrH0cxtJLIu+KlKXD9X1y+cLLHaAOIyjlb2bMdejd9IRKiN9vlEh69P3E3Rpk3b7flpl/+ZN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970132; c=relaxed/simple;
	bh=GD4qqsiNh8Y6HWCoroFPD3SlSezyM+PEYr2ph8k2ejE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YOT9HR+z6BIYe2ZcvWEaYW2v2e2Ce25JyQgvCNMkkdTMCiyLCt7D7JnpvlChcvVH7qzun57B2Ai01Uzr8zY/6e4BooENuuExOQUsq8qvU0lLbPIerT/N/LXrqp8Ju1kISrIWVyEiOn0UKic1wC3hGAchzDN0uZ0unVtZSsru5g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WdIKUMIP; arc=fail smtp.client-ip=52.101.52.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WdIKUMIP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlhgpetxwUsuJcRsBA+AR959CC/jfLvUa67aTuLHNJyLg2+xu1RCTu5bFBVabeVPKPe062FfyuszJ6LWuzMVmDCFZONEIp1M1aK9iqjPu+B8zI7Gh6hKSq7vpcMfx/AM9/37kEWcaDKPAknYik+jAy5JuvO9L5IM+hAEwlZbeRPgI08Bkt+uoEqYvkJhgbcUnfXa8roIqSvFDot4F3je61+RqBFX8MSQDM+jY4fjdEBMWmS3cfrs6GMWFxx1HtCl8bf0mvwNY0yd28Lucw76zur+tuoANgBFP+nzqbV4IakwdsnzsX0P1fGDnq6wL32DHdenbKnEM2f7cNoX9DhJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIBc+BqloJF27ftda9uctLXKG0PxmV4bT5LOt5zmCmg=;
 b=T3qrm0RMqYjs02naOpobGbBv5QHxMWTnL/a5BlyIFqY2sbjCjYmWD6jO4UPM+vEHeSPtM6WQwf73DWSm9ABdaLlFNtTTZSdOctBgElWxEVU2xwext2DeRa3JscX3z1ZgYRF7Yc/yJKLk4MfrW5Wilsd478u/xJ5dZG9FEJK1GdgWAyRi7XJHzycUdoyCXWw4wIsvNXRc74/BQcRrXjmhNM+gm6++GYjCZOW986VN7GzTyJWo0jkSll0Q6baT77wAwn3YekihnEY6yKw5bwzpjHZtfPjMjuY6BYvX1Z8o5Yxoe6f31Qgp7eJrEKE87WFsqMpYkRRPOVHUigZWw4flHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIBc+BqloJF27ftda9uctLXKG0PxmV4bT5LOt5zmCmg=;
 b=WdIKUMIP1cvVtrrdKN3D8E3u7GGrIUwau5TaM8BJgLWK4yl7vIYg/Kmmns2St/hIk7dzqkcPFgGCDPSvATR1BQ8HdA9XzpcKHtdWKcE0OKD/lTV/V0u6VtkYhRSFbW4ny+IscAqSQQr+NB9tZpdX+oTL2aRj7opdi3QV7pFhHPyMT/KCrLW1NaUMBG2X0u10y89jSxYMRf3aLE4EIwl/0+2w3kLTVm1/JE7e209WQejYSnhbX5GPr+VVImbAQ3YT3VSX2q7Lk0gs50tLHCH7EOzrnDJXiGgubXF4pts1zM9UdthgUgNdnAjSPtPMj8NQreBWgcSxAkSnpDLgxgOoqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 02:22:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 02:22:03 +0000
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
Subject: [PATCH] gpu: nova-core: document the firmware layout and ABI epochs
Date: Fri, 28 Aug 2026 19:21:54 -0700
Message-ID: <20260829022155.543353-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: 969e0ba1-9ec3-44eb-fd6f-08df05745041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|6133799003|10067099003|11063799006|5023799004|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jJat9/yBKFKwx2tknGusIGbQFvusrUox1tjIrZf1JXtzM2UOk3udyFaHIvx9Q7bnMHWC8di13G3nbBEFHu1/124TBxqnx228KvJvWNZXM0YisroQgdFFAGHNpM6nOO7qyTuJuX1bpqtKlGqSqnr7fAsu4bikQeDOaqDyKPoHAomgAk7nYcyNZN4PShZsN/IsQS1ISQNo1vw5ANxf4oUIYWwlY7Ql/aUEGtWxUKfbHMqZqCFgdnhmbwYZ1VnSmh3ku7lq5bGJG6RNcSGrLpvIkL+yXaO8mQlIMGXMpp0Lge1TWVlxdUAa1jMNnZUvK7jpwafcoz1eOQRor3+yF5rwSDC0rIus/KkBOuJz4aUnHFJC3L3zX0v9uUHwbgld4K6Tq+zbmUsmsX7VT3jgLHmkeVG6LgpDgu6Ndhp3MBrb+Sx+BpnjpPHIpEInLbJMFzKszuEyy/aMNzkwnIrw10uWRiENV5jcB71rlzWFHVqRBzVA/Rgmw9mGiI9X7Ebzdp+SFUriSfzmcKJHNEKrLHwSIjeLoNupy9BuuM+OkRdtdkYFdkehFYsDFi2EV4DtjP81l3yVj4V6oETF+eY01us/tBJXoDbzGyS8Woq+lvGO+C73V3R1RYZF0ZFBcAr4uWsywebs5kOSPsCbz3NyNJQmv50Ra9v/5o/Ekb8vz/ETcuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(6133799003)(10067099003)(11063799006)(5023799004)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsEjU5n32JO7fEPLIRmSzOTJE7u55Dgw4RhuCauyWFKsj3gKRKi/h7NSgHEC?=
 =?us-ascii?Q?hOIRkFFUEk3jyXEFwOiTx0w8vvYQ4kA1+4PAA4dL5MmKizXt9x/DomDyfZRn?=
 =?us-ascii?Q?HX9ecSsJigLlBxubzwrJs8aj+GQ54Ei2Ze8sTWrQsg5SMrfpLvWw7RLopsPi?=
 =?us-ascii?Q?GaA/a8ev+tW/zn+VujYsCu9SQFphP1kBrLXryUByRzTBvvAhmQmaybnvPyqZ?=
 =?us-ascii?Q?D34Ri0zXJnw87YePMwdGTy0Ou/oHmK4R6F1ihCa4sAuII9RqHCPI9Eppsf33?=
 =?us-ascii?Q?tzgc871J3RUSGcOdhn2VsA0wpRZTRMIkB4E60wUGaOat6UoXX1N+OCXmPH4l?=
 =?us-ascii?Q?LF/ZeySQrHtyqJbEV9mkiN6UaaCBd7+ZII9uz3CwKFLMXsg6J6qOimP1291M?=
 =?us-ascii?Q?tJXvv6TIlqvsvSuhkDiyp+oo2jGW4Bz6YYiKKvjv7ymYcPowNtWgQAQX/dqV?=
 =?us-ascii?Q?hXTycQFVoeOQYt7Pbi5ti+ywKG5KsNWYlE9rxn4sk+EQIe197MHtM+w4AbTR?=
 =?us-ascii?Q?DCZRm+nPvmVGH+AsyyyJfO9nsmD2X4t3BD/mZuw4p+LTanSlljEBEHcLu2rm?=
 =?us-ascii?Q?9lfzMd/vnw2esQn6mXblADspo9BT2/HuNOqP2yi3WSyAGGV1pD8HFf0FE8pU?=
 =?us-ascii?Q?JWB1jRv0BZl2i7pfAlS7EpMJm9C7oj90zCn3SGpnihX90Msn5yABEu2gVuFp?=
 =?us-ascii?Q?n2cz5dvaIKrUMFT0tHNrDUBm2yyZ35SK3P8GyoiR8J5nIkWSYIj2s9nkewZ8?=
 =?us-ascii?Q?bdPKpa1g3HR/O0i+bDbaSUhtzpPftrevJloW5VLVsi8Cy1fwhq3CBoZujK5W?=
 =?us-ascii?Q?h92mh9RB+jGf+rvZ9vMlszk1U0cLsyel+0AmCEx8uN4ymX13kFwmHZxM2vfi?=
 =?us-ascii?Q?CXYTxRua2wB8UWkSp+qUs3gq8DXyfsS7frFAWp7nAx7CRzxK1nu7LICIK/vE?=
 =?us-ascii?Q?/Iq5JBzTgIeAa5fErS0xiSPQ6w6FiZx9odlnf5K4zQ4+6/on9BTPnLynnXn4?=
 =?us-ascii?Q?nDJMzrNngz8c31qmEXl2v6w5VVsmDa2F7hEDZSNci+oRZzwC4CmO0m5Llc9/?=
 =?us-ascii?Q?mb4BcH7g7sgy2O+INi51ZdFXs/zbXqJzfxrdd8kaxBFsVZLXE7zz2MaPvJIS?=
 =?us-ascii?Q?S9EoaC99kz8Gg0glUlksp/YO2xOMPlkFlRNcg6fPZwYsMAOPhsTYQ4o6PDf5?=
 =?us-ascii?Q?Xj6hycsL5d9qmbhd89QJ6fV/TLDpWVxa2ToYpK2mgSBGCfBK4Hjf0CoJyPLL?=
 =?us-ascii?Q?TDYZoUyhMbyIoZcacPog2N7jesV5VyYLB5fOUHl91AVekGVbNmUWc5+YEDOw?=
 =?us-ascii?Q?0IlJtDWL1swphW6IXJc39GYJjKLVaY3BrCGRJriRl/+HP79n3MJtwYEBOEWT?=
 =?us-ascii?Q?Cyla5HURdoy85/S5YOm1+mX6knX5hUg/dnL00LVFJGNhBM6zxMbzAZy2a6rN?=
 =?us-ascii?Q?vs0vyssSyUxqxqrlC/CH8IrdZw93xxhFGMhyWMGrvZWqG7u4woMKP96YJO5a?=
 =?us-ascii?Q?hztORGp7tntY24oDXlzDnBHW9U6cfQVxvAa33LCSJlG9Yr9Psc0CMak1uR4p?=
 =?us-ascii?Q?FNkzyoDVc+W4OYWjbCxFqLb9mEp8RU4q1ozoqoNMNSW9S3c0Agp+wIKVbJG8?=
 =?us-ascii?Q?pOsKxm0m36KpV7qTOSonRQZNtQlXiUgtd+ksHtE/XnFvK3I3jxt5jIvXQb1s?=
 =?us-ascii?Q?NdLdsB6X7O3lZftvEFtvpab67+iGhkf88HlA8IDHQGX8OagL/wkFnbrVAbuL?=
 =?us-ascii?Q?1ha8ycNAXQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969e0ba1-9ec3-44eb-fd6f-08df05745041
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:22:03.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4HWrVNZ4Uc4s6gIBvPsKo1Or6/BO9LC6lpDgrnNGIxAfyq/D7KfPwCfgiqoD/MjLS4p3wxfCwPqqsuTJPfpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305

The kernel and linux-firmware are distributed and updated separately, so
a newer kernel has to bring up the GPU with older firmware, and an older
kernel with newer firmware. A firmware release that keeps the interface
nova-core implements can replace the installed files under their
existing names. A release that breaks that interface cannot, because an
older kernel would request the same names and fail to boot the GPU.

Neither the installed layout nor the renaming rule for that case was
documented, so a firmware update and a driver change had no convention
to follow.

Add a document covering the per-chip directory layout and the files each
GPU family needs. It also covers the epoch suffix that an ABI-breaking
release appends to every file of an affected chip, which epoch nova-core
requests, and when an epoch becomes eligible for removal.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/firmware.rst | 234 +++++++++++++++++++++++
 Documentation/gpu/nova/index.rst         |   1 +
 2 files changed, 235 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/firmware.rst

diff --git a/Documentation/gpu/nova/core/firmware.rst b/Documentation/gpu/nova/core/firmware.rst
new file mode 100644
index 000000000000..2757bd176f0c
--- /dev/null
+++ b/Documentation/gpu/nova/core/firmware.rst
@@ -0,0 +1,234 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=============================
+Firmware files and ABI epochs
+=============================
+
+Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+The nova-core driver loads GSP-RM and its boot images from files that
+linux-firmware installs. When a firmware change breaks compatibility with
+the driver, the files it affects are renamed instead of replaced.
+
+Such a break is a last resort, for a fix that cannot be made within the
+existing ABI and cannot wait. In practice that means a critical security fix.
+
+Compatibility
+=============
+
+The kernel and linux-firmware are distributed and updated separately, so
+the installed kernel and the installed firmware can be from different
+releases. Every such pair has to bring up the GPU. An older kernel keeps
+requesting the filenames it was built for. A newer kernel loads whatever is
+installed, including a firmware release older than itself.
+
+A combination that uses an older kernel or older firmware provides only the
+features and fixes that both support, security fixes included. A fix that
+requires a firmware ABI change takes effect only after both the kernel and
+the firmware are updated.
+
+:doc:`../../../driver-api/firmware/firmware-usage-guidelines` states the
+kernel-wide rules for firmware distributed through linux-firmware:
+
+- A newer major version of a file stays compatible with every kernel that
+  loads that major version.
+- A new major version requires the kernel to keep loading the older major
+  versions.
+
+The epoch number defined below is that major version, and adding an epoch
+deprecates no existing file.
+
+Directory layout
+================
+
+The driver requests paths relative to the firmware search path, and
+linux-firmware installs the corresponding files below ``/lib/firmware``.
+Each chip has a directory named with the lowercase chip name, and the images
+are in a ``gsp`` subdirectory::
+
+    /lib/firmware/nvidia/gb202/gsp/
+        fmc.tlv
+        gsp.bin -> ../../ga102/gsp/gsp.bin
+        gsp_bootloader.tlv
+        gsp.tlv
+        ucodes.bin
+        ucodes.tlv
+
+For a chip that uses another chip's image, linux-firmware installs a link to
+that image instead of another copy. The link can be the chip directory
+(``gb203 -> gb202``), the ``gsp`` subdirectory
+(``ga103/gsp -> ../ga102/gsp``), or a single file. The ``gsp.bin`` payload
+above is a link, so one copy of the GSP-RM image serves chips that each have
+their own ``gsp.tlv``.
+
+The driver requests these TLV files for every chip:
+
+- ``gsp.tlv``, the GSP-RM image
+- ``gsp_bootloader.tlv``, the bootloader that loads GSP-RM
+- ``ucodes.tlv``, the microcode images GSP-RM reads at startup
+
+The remaining TLV files depend on how the chip boots the GSP:
+
+- Turing and GA100: ``booter_load.tlv``, ``booter_unload.tlv``,
+  ``gen_bootloader.tlv``
+- Ampere other than GA100, and Ada: ``booter_load.tlv``,
+  ``booter_unload.tlv``
+- Hopper and later: ``fmc.tlv``
+
+A TLV file either stores its image in a ``BLOB`` tag or names a companion
+file that stores the image. The ``FILE`` tag gives the companion's name and
+the ``SIZE`` tag gives its size. A companion file is in the same directory
+as the TLV file that names it. ``gsp.bin`` and ``ucodes.bin`` are companion
+files. See :doc:`tlv` for the format.
+
+Planned move under nvidia/gpu/
+------------------------------
+
+nouveau requests its own GSP-RM images from the same per-chip directory,
+under basenames that carry the GSP-RM release:
+``nvidia/gb202/gsp/gsp-570.144.bin``, ``bootloader-570.144.bin``, and
+``fmc-570.144.bin``. No filename collides today, because nova-core's
+basenames differ from nouveau's. Both sets are installed in one directory,
+and both kinds of suffix are a dash and a number before the extension:
+``-570.144`` is a nouveau release, and ``-1`` is a nova-core epoch.
+
+The planned layout inserts a ``gpu`` component, so nova-core requests
+``nvidia/gpu/<chip>/gsp/`` and nouveau keeps requesting
+``nvidia/<chip>/gsp/``. nouveau needs no change. Under the planned layout,
+nova-core requests paths at the new location, derives companion paths there
+from a ``FILE`` tag, and names the new paths in its ``MODULE_FIRMWARE``
+entries. linux-firmware installs the nova tree at that location. Everything
+else in this document holds under either layout.
+
+ABI breaks
+==========
+
+Most firmware releases keep the interface the driver already implements.
+Such a release replaces an epoch's files as a complete set under the same
+names, stays compatible with every kernel that implements that epoch, and
+needs no kernel change.
+
+A firmware release breaks the ABI when a driver built against the previous
+release cannot boot the new firmware, or cannot work with it after boot. The
+following changes break the ABI:
+
+- removing or redefining a TLV tag that the driver requires
+- changing the command and message interface between the driver and GSP-RM
+- changing the boot parameter or startup argument structures
+- changing the framebuffer regions that the firmware expects to own
+
+Adding a TLV tag does not break the ABI. The parser reads the tags it needs
+and ignores the rest.
+
+Renaming for a new ABI epoch
+============================
+
+The filenames without a numeric suffix are epoch 0, the only epoch that
+exists today. A new epoch renames each file by inserting a dash and the epoch
+number before the extension of its epoch 0 name. The numbers count up without
+limit::
+
+    /lib/firmware/nvidia/gb202/gsp/
+        fmc-1.tlv
+        fmc.tlv
+        gsp-1.bin
+        gsp-1.tlv
+        gsp.bin -> ../../ga102/gsp/gsp.bin
+        gsp_bootloader-1.tlv
+        gsp_bootloader.tlv
+        gsp.tlv
+        ucodes-1.bin
+        ucodes-1.tlv
+        ucodes.bin
+        ucodes.tlv
+
+Adding an epoch neither modifies nor removes any file from a prior epoch, so
+every older epoch stays available under its existing names and a kernel that
+predates epoch 1 continues to bring up the GPU.
+
+Every file for an affected chip is rebuilt at the new epoch, including a file
+whose contents did not change. The images are interdependent and some of them
+are signed, so no file from one epoch may be used with a file from another. A
+suffixed name resolves only to files of its own epoch, so ``gsp-1.bin`` never
+links to an unsuffixed ``gsp.bin``. A TLV names a companion file from the
+same epoch, and the driver reads that filename from the ``FILE`` tag instead
+of constructing it.
+
+A ``FILE`` tag names the conventional companion basename for its epoch,
+meaning ``gsp-1.bin`` for ``gsp-1.tlv`` and ``ucodes-1.bin`` for
+``ucodes-1.tlv``. The driver takes the companion's name from the tag, but the
+``MODULE_FIRMWARE`` entries name the conventional basenames, because they are
+fixed when the driver is built and cannot name a file that a tag chooses at
+run time. A companion under any other name is missing from the module
+metadata, and a driver running from an initramfs built from that metadata
+cannot load it.
+
+What nova-core requests
+=======================
+
+Only epoch 0 exists so far, so nova-core requests the unsuffixed filenames
+and has no lower epoch to fall back to. The rule below takes effect once
+the driver implements a higher epoch.
+
+The driver requests the highest epoch it implements. If that epoch is not
+installed, it requests successively lower epochs down to epoch 0, and uses
+the first installed epoch. A kernel that implements epoch 1 boots a GPU
+whose firmware is still at epoch 0. Refusing to load epoch 0 would not
+install epoch 1 firmware, and the GPU would not come up.
+
+Firmware from a newer epoch has no effect on nova-core, which never requests
+an epoch it does not implement. The driver does not scan the firmware
+directory, and the set of epochs it can name is fixed when it is built.
+
+The driver finds the epoch by requesting the GSP-RM TLV that every chip has:
+``gsp.tlv`` at epoch 0, ``gsp-1.tlv`` at epoch 1, and one name per epoch
+above that. The driver falls back to the next lower epoch only when that
+request returns ``-ENOENT``. These requests use ``firmware_request_nowarn``,
+so a system with epoch 0 firmware installed logs nothing for the higher
+epochs the driver tried first.
+
+The epoch of the GSP-RM TLV sets the epoch of every remaining file for that
+chip, and nova-core requests each one by its exact name in that epoch. A file
+that is missing, malformed, or rejected fails the probe instead of falling
+back to a lower epoch. For a missing file, ``request_firmware`` logs the path
+it could not open::
+
+    Direct firmware load for nvidia/gb202/gsp/fmc-1.tlv failed with error -2
+
+The driver logs the epoch it loaded. When that epoch is lower than the
+highest one the driver implements, the message is a warning: the installed
+firmware lacks the fix that each newer epoch was created for.
+
+The ``MODULE_FIRMWARE`` entries name every file of every epoch nova-core can
+load, because the driver cannot know at build time which epoch it will find
+installed.
+
+Cost of an epoch
+================
+
+The driver keeps a code path for every epoch it can load, and each of those
+paths has to stay tested. A new epoch adds an ABI implementation to the
+driver, a set of firmware files to linux-firmware, and the matching module
+firmware metadata.
+
+linux-firmware keeps every epoch's files because older kernels request them,
+so each retained epoch increases the size of the installed firmware tree. The
+links limit what an epoch adds: one copy of each payload that changed, plus a
+TLV for each affected chip. A distribution that includes nova-core in the
+initramfs for early-boot display copies the firmware named in the module
+metadata, so each epoch increases the initramfs size.
+
+Retiring an epoch
+=================
+
+A kernel needs an epoch when it implements no higher one, because it can load
+nothing else. Every newer kernel finds a higher epoch installed and uses it
+instead. An epoch's files stay in linux-firmware while any supported kernel
+still needs them. The epoch becomes eligible for removal once every kernel
+that needs it has reached end of life, and the longest-supported enterprise
+kernels set that date, a decade or more after the epoch was added.
+
+Removal is proposed on nova-gpu@lists.linux.dev, naming the epoch, the
+kernel releases that need it, and the end-of-life date of each. The driver's
+code path for that epoch goes in the same proposal, because a system whose
+firmware was never updated is still at that epoch.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2afa58e8f08d..3f3cd4b9e97e 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -34,3 +34,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/fwsec
    core/falcon
    core/tlv
+   core/firmware
-- 
2.55.0

