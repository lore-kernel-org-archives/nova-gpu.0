Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0331AF14
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693657; cv=fail; b=iUX6xCCfNqwgVa5Vff84/iDRHlR1IO/pBkkI6OazLZEhoDKemmqSKJsnkupvxV0pKPkdZ6iJZV+7KM3NmiWxzmlT3hIW4tCVPC3sETNKMxrmKWwcNKBrhm4jEX4vmo0V7lPprvP+etYujfUvhu+ZYMnXclRrhRETBP5GxuZioRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693657; c=relaxed/simple;
	bh=4Sak2i/EiPPKOb9FaYftQWnsO2nVwg5WlBnq12IbDAk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=chriZkPBsKf20hM1YRusUurM77n349LVc+rIzu6wHFVrbHeuXAxikDwF503XcGQgRV4xHNe9zK+A4QDpuuXqO68/zINmMn8pyNDqV9r3JipLPMeKViLEJnpC2nHrSpbrd3GKCaSJZF2oRzbzrkeP75GK0pHvYbPqYnlLgwix2pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lyIUpwFO; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lyIUpwFO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz/VPFKSRBveeT7bw4FFF2Gda3rn+CwLNl9/wInUatrSss7/9tLuNaP4z9Zqe0pJhj4pij90TI/u0t7lYmCXZodUbq8mVRKbGmC1j54lltXVRrvwWLvtkunqwwqDOlNYFXoig1Fkhetjc4kpUjNPA6MIIoeppqSoYl2mQjADq9XfKB7lXGY0056jnxc1RG5xds6K6Sq76aSpZOVCHg4Nlmoz2v/LZqHea1ZDHVkm/P4NPQ+FKVR+b2mCeGCNTchhcUvJi3lM8hqjzpDO5Jq9uArKTwxTyrkP6SNLwMkruMyr9+nqv5lYu++f4aIY7PKl3CrK2s8LxmGY9otujp0sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD0tFfLMTyYZ6aeAMHUJTi7iOhTbWIbeVMVDaJZQ9Zk=;
 b=uXRJVn55Ry5mnWF0evtB4QcmYtDXSIkzjM0G0GAGSDIqF/ySARa6ynv/cohqTed1W5HIPj6QXGAnbA3tipZ/lwav3fo4tYSEB6b3DC/JkOea9rhmQavMvGAVcj1U+5AKXlPwrejxdLpJIObjrFgqaTcoZ+Uf2g+tHtJpUWL39hMdenTk3kv4su7OpMdpk8BM/2uTzN9z8Nx27/h6GFf26sK4qRhqXBEJ9qGhWZLiLJgLb+1o8t755+L4f48LcvpGvQnOakIBtm+wWab/uhlK/lDg2va43z9BT9emgXCvqqVVPD9hXFb5sUNdzCZQPDLQMvYhdGFTmD/Jku/d8oNhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD0tFfLMTyYZ6aeAMHUJTi7iOhTbWIbeVMVDaJZQ9Zk=;
 b=lyIUpwFO95L1PjFjbMH8QdlVcRGArK6YsGb+y7PcePM0jB164y+n+FQ398Z9Qfhzonzm9psDcWT9Qca16XlCTo3+YQnbs7cUE1lnq4DgrnNIP4oryk4PMzXaNlKx2qKlNOP1IQhTv79/uk+EzfG1KWZ3zIZ97cPLI7UdYIjGvv+e7TYssSL5pq9FQvUejuUNDNVH2jfBYj8x0PXLdlGklHF/1OisXrJAIx7UUKGty/xuNgLI3YGnALvB9Y3SNgrkPCXH2rFztoKkSTGwxBo9MH1gw52cBNA4hCrOmwE2EFmYJ+NcnG6LxhcKkTrDqqy/JlcmxkwhHqbWCJTLDmtzDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:24 +0000
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
Subject: [PATCH v3 00/33] gpu: nova-core: boot on the r000 GSP firmware
Date: Thu, 17 Sep 2026 18:06:46 -0700
Message-ID: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cc7320-10e6-4775-e7de-08df152132a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	GzkeRB1Kky5eaaoFED91U7gPVkSwT0FL4B52n6D2PJAClRJGVD2JTt/0DKgbB5p9Ycl+6T63f6LXdvKVfXvpjE1gW4pIxBRaLzSl0ZkBUvwofNtoxfSHkC6d/HdAupvsnlEgUpO7zDoDbggXT0wt0qbThg4tuT7cXy7MEsUrr3AT+zgQp5HDp1OTVYvIpLhj29RCwGapg/Qx7WD7c3J0wEE2PUEneeMMIMbrECg/RfEfY9BdlcQW2HguYwgZB0imtWemoKZ/lz/06ab8YZFDmSIpG7XfiNPjt7p//YHVXImKzLsvIdYKh71mRzSBNg+MBbc4KgYVKg84yLP0XjzQoHZPLj/Gk3gRgHipCXZyatdrPl+HQ8rQKeu8i9JXl3wS4O5eJks0gHaykuL+f1vjldK8k82J6CT4qyfHBGA698o1A2wgJ5IsnBfbd2TM4pGla7cLPRkIwwwg3VvPsED4HNUK+G22DyNrs+EChp2Ze1PVCoQ/Wjxh8tkJCiw91Xjk6phh5Dd7ndHnrvpUf9RpHPEdMS5017GxlOL97xXGSE8Hyl6YKKappxwji1wYOM3pgTG10oZg6lQ6aWeFTjH8jpznV9uLcbdKKCZZGhMmKWIbkTonMRh9QXDryGlBce/sCa3iuYL9bqMcy412+9iJJnuL8M64ryCtci2xzn+F0gw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZgOlfeEJdMsX367Okr0VVqGt1Lt8K8QM+YFXRu1hgULy6YyDTB3b+jMS9RMi?=
 =?us-ascii?Q?plWGIfM7IAQ8wJrS3UoQ2fEH3R9FgkjMV8yhvSEbb+hCLUmTGvz1HkJ6yeKB?=
 =?us-ascii?Q?cy6ROI5Ljv5C6X9baopPpcePGIY933r8allkKyesHP26KCb6ua8wDLuHId7d?=
 =?us-ascii?Q?bmnF9N2fBg99XrDCi3c68I0GmhgnHb6Bv/9qAB/mPGEsu/F8mQ0EL5DkzP26?=
 =?us-ascii?Q?TTAQYkTRIFS+U2126J/nnLEvs0MklWcTPlO8IqOsbWXHx2MnF0RXqdD5DUH5?=
 =?us-ascii?Q?6/+WIQaKqStAoYRlAdsRDUN2zloaEnKr0YfYBiUBMwxmO2zKvKd414mXfStu?=
 =?us-ascii?Q?gMOmUs7f1zhbALeIfMXbG5U1owwwp4hWAQ4W9LpSZSqaPJNyKhB1fpKmMy3W?=
 =?us-ascii?Q?GGw6K9q24AWtGDMvGclK7U6tEqho3wA4qLguv/+KepnrSfr/poGtaYh1m5A9?=
 =?us-ascii?Q?jK9+ceaBv5iDBbnSrJWQY33jftWxdLEQ2TxVvNd7NU35gGNzg9gR2X2jOc7O?=
 =?us-ascii?Q?XqeinOjZvhBLwSgkjW9gBXgRAaO9u4OcSpboqZAD1O/dVKgagj91eEsQrpOv?=
 =?us-ascii?Q?L7oiuw5d+S3ghA5zNx7e6u6m080rye78PWj0+i+zVdHej2U0o75LwrWhSPHg?=
 =?us-ascii?Q?+7ugwXNDCCRreTWzTNzPsiT9fQaxl65pNYUZg6cNa3d6PI1erE1IQidoUNq6?=
 =?us-ascii?Q?iZ2Cpg5JrprvDOpA6OQw2snUT0ob/NWinUIsVTcSx0qJqDAty6VhGfwpwShq?=
 =?us-ascii?Q?lB01V3qQ6M9FA9dNx3Qgfp8L6t1A7L7FaRNUxDOEv1EhF6CzGGFARzaUzv5q?=
 =?us-ascii?Q?TfI16i94IaiqW3mGbzhaKuUGDLBHtvGiSGGEAl5L++XQYfQ6Bs7yxJb7lKkC?=
 =?us-ascii?Q?UbaTQy521MFuTE9YheNVjjUV+RJHxvYASmjpkLm7O3bASeMtOxRfRBnH30xi?=
 =?us-ascii?Q?4Rjd3olifdD9+7Wmouwyh2ZePVVA5I1uvaeXrrc+Oen05BmxFBQ6PGhQ4i/Y?=
 =?us-ascii?Q?MIc+wGUDT7ViCNIsk3xAApHJxIXThGC3b7tHuE3bWSkcrwLstVDJUszI6M1D?=
 =?us-ascii?Q?8rNeUUeM8zEyzdjTmicuVuXxZMxXeIjVcW4QxGCewhL/bfimdHEBYid27GSq?=
 =?us-ascii?Q?8tSi3STR1BmmjT8LlCRcO7qnVeXIsRjlpGHbzr7cVAkfaPFY/PzgikmcwQVG?=
 =?us-ascii?Q?F0o8zdKMLotbIoTPA4Hnen33yhE5hz/p8tEx5aSxyh8Lf3OeCQFI8ZkIqZ5c?=
 =?us-ascii?Q?qr1Fab/guHS7gBZ2LirEGJHRTdGjHVXIRKC90NnHYAIYHPaIWbiem0Z5NPkB?=
 =?us-ascii?Q?r8YCnGrop0uofEcZ93eePARz+unO3BZY4VE6Y/j0EULwfmpBjLImNdOQfdo/?=
 =?us-ascii?Q?NiScOqEhBGiPRKS5HYZFzSG1qSkUJdujXeWbUdVBhv2INREpVKRsxexNV1VU?=
 =?us-ascii?Q?6R+vQkN2siex0jV2EqNWxx40+OtinhCIlXLON9j9DwqDGT4awwmp0IohJUhN?=
 =?us-ascii?Q?AN3+iJwsrMiPOkSus1cyu6quLovY8JXh493FY7L7/dZjrA5gCaxeO2CXpusd?=
 =?us-ascii?Q?oaQ+wWLg9nyciHVQwzbZXw7f7g3M+w6MN52eeRQGy1OaqKoAfk7OzK+F7mq4?=
 =?us-ascii?Q?Re03L50ya8Z6GYC49hdckEdcJ7hDLlvo2ZcT/AG+e8TgnttaTxBT3Cv+oELv?=
 =?us-ascii?Q?lFAg1C91JKD6sawKxXN/emyU+k5EMqP8ns6g9GyjazAMT3eK+if6srgTdP3G?=
 =?us-ascii?Q?f4XAxbNmbQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cc7320-10e6-4775-e7de-08df152132a7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:24.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pFTmT25utJLrngwtUErZlz4kEsUUbtA0P68Skwlz3prABHhCXj1n5fZLVCwvQDrVcp6K2JbZr6cYaJLoG9+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

This series moves nova-core from the r570 GSP (GPU System Processor)
firmware onto the ABI that the r615 and later firmware releases share.
The driver calls that ABI "r000", because the firmware files carry no
version number in their names.

This should boot up on firmware extracted from NVIDIA's very recent
publicly released r615 branch, although my testing has been so far on a
slightly modified version of that, which Timur Tabi is working on making
publicly available for anyone who is hacking on nova-core. The changes
are small things for ABI stability for vGPU and don't affect this
series.

The GSP runs only one set (version) of firmware at a time, so patch 27
makes the one-commit change over to use r000 firmware. Every patch
before patch 27 still boots r570.

In other words, it is safe to merge this patchset, once reviewers are
happy with it, because publicly available firmware now exists for it.

I've tested on Turing, Ampere, and Blackwell on a single x86_64 test
machine, so far: nova-core dmesg excerpt:

   0000:c1:00.0: NVIDIA T400 4GB
   0000:c2:00.0: NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition
   0000:01:00.0: NVIDIA RTX A4000

Changes in v3:

* Grouped the series into consecuitive sets of patches, each doing
  something related, per Alex and Eliot.

* The three radix3 patches have been removed and sent out as a separate
  prerequisite own series.

* The four debug-logging patches have been dropped (I have them ready
  to post as a follow-up series, though).

* The big switch-to-r000 patch is smaller and much simpler and therefore
  much easier to review.

* Every commit message and code comment has been rewritten (more than
  once, in some cases), with a much stronger focus on making it easily
  readable.

* A refactoring pass over the whole series, with each defect fixed in
  the patch that introduced it. Most of the fixes either merge
  duplicated code into shared helpers or move code to the type that owns
  it.

* Improved how the switch to msgq v2 is done.

The 33 patches come in groups:

* Patches 1 through 8: prerequisites. They add a PCI domain accessor,
  the MCTP header version, the r000 bindings and the msgq v2 registers,
  and they prepare the queue code for msgq v2 and for a second kind of
  element header.

* Patches 9 through 12: the GMC API types and their send and receive
  paths.

* Patches 13 through 18: the two load-and-execute boot events and their
  dispatcher.

* Patches 19 through 26: the static configuration returned from boot,
  the GSP_INIT request and reply, the LIBOS log and state buffers, the
  ucodes image, the GSP HAL method that loads the generic bootloader
  for the load-and-execute handler, and the GSP_SUSPEND request.

* Patches 27 through 29: the switch to r000, the cleanup that makes the
  decoded GSP_INIT reply the static configuration type, and the
  deletion of the r570 bindings. The switch patch also adds the larger
  framebuffer reservations that r000 requires on GB100 and GB20x.

* Patches 30 through 33: the receive path hardening. The receive path
  matches an RPC reply by sequence number, decodes each element by its
  NVDM type, and matches a GMC response by flag, id and sequence.



The series applies on top of drm-rust-next plus four dependencies:

* the interrupt tree series for GIN, the GPU Interrupt and Notification
  unit [1]
* Eliot Courtney's NVKV codec series [2]
* the three-patch radix3 cleanup [3]
* two lint fixes for the generated bindings, both already in mainline

A branch with everything applied:

    https://github.com/johnhubbard/linux/tree/nova-core-run-on-r615-or-later-v3/

[1] https://lore.kernel.org/all/20260912044400.677097-1-jhubbard@nvidia.com/
[2] https://lore.kernel.org/all/20260827-b4-nvkv-v2-0-0de9d5c8658c@nvidia.com/
[3] https://lore.kernel.org/all/20260913195413.742143-1-jhubbard@nvidia.com/


John Hubbard (32):
  rust: pci: add domain_nr() accessor
  gpu: nova-core: set MCTP transport header version to 1
  gpu: nova-core: gsp: give the command queue its own BAR0 mapping
  gpu: nova-core: firmware: add r000 bindings
  gpu: nova-core: regs: add msgq v2 BAR0 register declarations
  gpu: nova-core: gsp: ring the GSP doorbell from the queue memory
  gpu: nova-core: gsp: make command allocation generic over the header
  gpu: nova-core: gsp: compute the queue regions from a count and a slot
  gpu: nova-core: add GMC API message types
  gpu: nova-core: add GMC send path
  gpu: nova-core: add GMC transport receive path
  gpu: nova-core: gsp: add GMC dispatch on receive
  gpu: nova-core: separate the generic falcon bootloader from FWSEC
  gpu: nova-core: add the falcon DMA and suspend helpers for r000 boot
  gpu: nova-core: add the r000 load-and-execute HS binary handler
  gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
  gpu: nova-core: add the r000 load-and-execute bootloader handler
  gpu: nova-core: gsp: add the GMC boot event dispatcher
  gpu: nova-core: gsp: rename the static configuration type
  gpu: nova-core: gsp: return the static GPU configuration from boot
  gpu: nova-core: gsp: add the GSP_INIT request builder
  gpu: nova-core: gsp: send GSP_INIT and decode its reply
  gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
  gpu: nova-core: add the ucodes firmware loader
  gpu: nova-core: gsp: let the GSP HAL load the generic bootloader
  gpu: nova-core: gsp: add the GSP_SUSPEND request
  gpu: nova-core: switch to the r000 GSP firmware
  gpu: nova-core: gsp: make the GSP_INIT reply the static configuration
  gpu: nova-core: firmware: delete the r570 bindings
  gpu: nova-core: match GSP RPC replies by sequence, not just function
  gpu: nova-core: gsp: split the reply match out of the RPC receive path
  gpu: nova-core: gsp: decode queue elements by their NVDM type

Zhi Wang (1):
  gpu: nova-core: gsp: match a GMC response by flag, id and sequence

 Documentation/gpu/nova/core/fsp.rst           |    2 +
 Documentation/gpu/nova/core/interrupts.rst    |   41 +-
 drivers/gpu/nova-core/falcon.rs               |  203 +++-
 drivers/gpu/nova-core/falcon/gsp.rs           |   10 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs         |   24 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs         |    6 +-
 drivers/gpu/nova-core/firmware.rs             |    8 +-
 drivers/gpu/nova-core/firmware/bindata.rs     |   58 +
 .../nova-core/firmware/fwsec/bootloader.rs    |  160 +--
 .../gpu/nova-core/firmware/gen_bootloader.rs  |  216 ++++
 drivers/gpu/nova-core/firmware/gsp.rs         |   15 +-
 drivers/gpu/nova-core/firmware/tlv.rs         |   40 +-
 drivers/gpu/nova-core/fsp.rs                  |    3 +-
 drivers/gpu/nova-core/gpu.rs                  |   52 +-
 drivers/gpu/nova-core/gsp.rs                  |  156 ++-
 drivers/gpu/nova-core/gsp/boot.rs             |  483 +++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 1036 +++++++++++------
 drivers/gpu/nova-core/gsp/commands.rs         |  368 ++----
 drivers/gpu/nova-core/gsp/fw.rs               |  832 ++++++-------
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  405 ++++---
 .../gsp/fw/{r570_144.rs => r000_00.rs}        |   10 +-
 .../gsp/fw/{r570_144 => r000_00}/bindings.rs  |  691 ++++-------
 drivers/gpu/nova-core/gsp/hal.rs              |   32 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |   24 +-
 drivers/gpu/nova-core/gsp/regs.rs             |   19 +
 drivers/gpu/nova-core/gsp/sequencer.rs        |  379 ------
 drivers/gpu/nova-core/mctp.rs                 |   33 +-
 drivers/gpu/nova-core/mm.rs                   |    4 +-
 drivers/gpu/nova-core/regs.rs                 |    9 +-
 drivers/gpu/nova-core/sbuffer.rs              |    2 +-
 rust/helpers/pci.c                            |    5 +
 rust/kernel/pci.rs                            |   12 +
 32 files changed, 2973 insertions(+), 2365 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs
 rename drivers/gpu/nova-core/gsp/fw/{r570_144.rs => r000_00.rs} (71%)
 rename drivers/gpu/nova-core/gsp/fw/{r570_144 => r000_00}/bindings.rs (71%)
 delete mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

-- 
2.55.0

