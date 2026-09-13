Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E36364E96
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 19:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329268; cv=fail; b=DFE9O82UIHkPwJTUydy3b0GDrp3iyK+9GGPwAGsVV5oZ4A5Cx+ZcVax/l9EPLlMYRkjz/4hFHqpswBYrDIN1oSQlxd+SxX13MvtIryzcK6tL/rgWhU+Vsc9EPGNrfa4BCB08umE4pvqLD8chJIauaNtdCLDelYWYfdLYXeVUrfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329268; c=relaxed/simple;
	bh=368nFmApQmu71dczgXAo4+0HS3mCY9pwVbSupyxAK6M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ol8fcS0RiG6aQus5EIEovniRCY4r3nzX3cgPoyMDcDPqOHT6zhzHrbbSzIMx7/MWSVI6dTZNV7+I3yzrsOSdvGS7DA0IRfQFWvjUW1dOiumzeyVwFzirr+qWRKY3InTdGYJmDhhy84LrEyO0+aiswsC15dJTqjv55i/BAwAGxOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E1duVnoS; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1duVnoS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmGfGTqEuGuc8dLmp18w4FdTmfp3RXvfJTreLYatyV1lq6ZzpGYzIYKzbZiazFH1Gw0MsJyNrFItxLdBMQtMP26/izjv7sc6gJa2b3ui167lbHwkIjZn5kAfOYFnQoalSOeP0BHrU8z22AhA+zEazUHr3OVeUGS8/iLJmvp34/I37t21Yr0HcoyuaOtp7ZEewX/ZJBY1xkged1Z7G8RJBUwno+Bvplk52BzeVHBKkxP1zYCkyTteO9nv/5+ZFAugwjbiH6+uHn1Q8CJN/5gHBWAWiiAnMfFMrpcGD2cslPEVygqjoSLXKxN4VckRMhd6VIaLxFf02KAs8IGaFZDpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6Mw0a+9913suSb8d2L0q5fePtTtQbX0/Odr5lEFsAQ=;
 b=abuifWQXEoAhr9lrhKU9DC1mhv/RC1LrGBJIonaQmuXYiZ+1XNii3Xb7ZnKwfnG/hCuT72c6THbSIwCx87I6k8xR7pc58Z2D1JolEqNkrobcP0DXNiwnm3Xag8fM1iLCFQwC1pDqg/2ksqlo6MG1zKjQMlYWFr32Y0yfweqe02aFMeAKVB+hU2Kz4vXO46/EchVOShyZ7OpTqykfZRX6r7Dh3Nz7kqyd8H3JMOAfKz1LdqPuh27EuI0fvbU88T9YKzv0M8+XWGTdK0/1alG1uM7gPKhkKrRWExrqGnjbcnyN7/POPNmWHV7lkq7xpQPkmym3xETXxQkStltBFYytFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6Mw0a+9913suSb8d2L0q5fePtTtQbX0/Odr5lEFsAQ=;
 b=E1duVnoSnFtcDj64n0jnTrDFd1sz2uaK2jQUyRfGCCvmV9FCIFEI9glELCs1GFErR3yTSWS398OZFa1cVLSom0JDqJ0N/u1L+yyS3V/ZJ7tq7T58ZzVxkf+CkTxu19vslIlpZFT6rWq1T6kjLQaQS/vYNtHMcCtulP6+rUhbPivhjN1tGHfUDkTD0OGy6MbqQFAXPprPijoLNunlmbf4yphVEfodvDLShxksN2Rr00TngGCEufI8/QjRVgmKTmfcY7ERIiCPzrwNpnAQB+/GY6PqVsTYiNzrCV5bUPoZwCSBtYnCwEwBj256M9mq4uFLCz/bpTv67l1CQ1fpnd5YtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.8; Sun, 13 Sep 2026 19:54:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:54:21 +0000
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
Subject: [PATCH 0/3] radix3 and ELF cleanup, pre-r000
Date: Sun, 13 Sep 2026 12:54:10 -0700
Message-ID: <20260913195413.742143-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: e05f8452-bcd7-4887-3ae6-08df11d0cd97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|7416014|11063799006|10067099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	H0zeOcdqZ9KabggUpSRyNIHwIXsXctzdyFTa9RERA6EpQKMozNPqMQhb2oZrqDfbxajJ5GtzCl2MxoLDjTC1YsjJ/XmINdLzvIHpP8EDa7EUCCqMsjp1ysLxc9Peub+E/pxZTKDQtzVQe/wq5AAoAxG9KM6nxHLL4/IGs/s83VdO0dMd8t3hkIo/vg3LRdN5qcwuTyGDzRZAuWF+Ut65pBIm6Ph2NviFxyTZEKwbuCV9+pCPxhjKoh38fz6J1VBGTUFMb5ey/JdW55PbdgGQ5IXKUvFmqoXQXcCbWtBBdFfPcmv2TUeFaVM67tbucjYYhSqdZCyldChXIL/a1qsqRM9qC8W3GkPTTMWCP/H5Idqnhi7Dlv4JWXuuA1GT80HyFHElpFOPFItfcj93nij7QxV8MYWVlVYYNJaew3tqbBFB++pZgiZ5wW7LS47HuAFIVpemyd5Yaeklp3Xvyc2mLxYcvgJGOxNl1Og6i1YULdIfeN0GSOMsXGkzcCDvztZTLxbr/2vhZFHHoP0B2La5k06Z1xsDihmVc/cpDcobzZB9bmJWWxFlCjqYd8VgR/o8ZgiXviaQ3uZKnVpJUCCMNghXwMQuSnORMj+xI4sDFzgBY8XCKH+vIs+67ynBotM+0EghG2DHV7y75wuBT7reSgKQzdKbwBU84nBv4X+ORQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(7416014)(11063799006)(10067099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kcmd4wH8Q03EKXfYgJ9UZRJ/EgNBCececzSGKPKQjcSIX2Vq6Azz6m7xQXhh?=
 =?us-ascii?Q?EsXyMpoTylL3PD40C/cfh/oh/xJMq0xZ7sYMKgv8+YDKkGME15LbFTI0Mkki?=
 =?us-ascii?Q?5YMoLtcvFSmsrS1Lg4cReX4hPLvcl/1m+PNDeDsHofepB87LOiPqDinop5MU?=
 =?us-ascii?Q?6wudFmW+lIRiTydJYVJY6U0DrRWv+RYPY5vXlZvctP293J3gMGY+POyvDHab?=
 =?us-ascii?Q?GBMUNksrv+Vd4jMegHL1srcExXBM67Ghh67Sos+TTqbwMl6OTcb+bKNv19LJ?=
 =?us-ascii?Q?CBJCkPHpaLfHITZTx6qYosHWlU+wqIU+opwFvzlpR0/xTOIq95R2OhovJmfj?=
 =?us-ascii?Q?P5fNCioI/YGtgexLEtCyRUTl2E5VjA3D9JIUf9/En5NDbO07+xkBaP1FnUvG?=
 =?us-ascii?Q?M7Aolq8D21eIy8OqoivB7QIUVDWo9jGh5feH1fJgEaRFnOh7Bpj1huCaO7Ty?=
 =?us-ascii?Q?me03y9e59pL1Q68MWyn4/EBIzQPpY+Gb+Kyo6Ge5Q9wBLJXXpokf9ctPfyPl?=
 =?us-ascii?Q?DabwXgSsGTWwrc2bZ/GiFdSXSLirOz5/yqcw70+nX1s+Mcgc3uH4U1ZZeGbD?=
 =?us-ascii?Q?1ofwKpJR3Meb6l3PXe0NOOBABDJylLXamK03Ad7y2/mkjLSuCR4I9AnR/s2N?=
 =?us-ascii?Q?Lyx5LCPeX3DkaJpuqJZNT4L4fN1VCq+vIhvih6CRFZ7vt1CyaCKre9IcqUMQ?=
 =?us-ascii?Q?9OVoUV68OPYKvOij9pQXEaEAHXyuyYBbQqNl4gppiMvS6Y4ZS2euzes+YuNr?=
 =?us-ascii?Q?C8XePg6hfNld+a4bIR2G8qUcEsaoOLHRV4WO/7NeJVZVqnqpa7B4bE3AIA2+?=
 =?us-ascii?Q?VHISNVZSUlXzdskrwBTOuZwEu7mNcj6HCO3HUKOdKUG5dh9cLs7G1i6zDvwG?=
 =?us-ascii?Q?dGcznstZj3dhtQu0odeOdvB5hUgTt8Iqas9YnxxSFHc0rgSUfXD4k+p+o+/R?=
 =?us-ascii?Q?wmmTvImQe/O7v649Ef8pgXXT2Mci/frVd14nLz+i09grHwNnz5A1ynMYhiND?=
 =?us-ascii?Q?vwCe5NJJUsnTaHOhgfg8pMtlceRAHpO/SUC95cdMGeBTVex0agi8+P28OWpE?=
 =?us-ascii?Q?cy/PJ0likiwyEim8yaagvIYhvk6f9HDf+DtMnXlp2jOfGr64DegiVTgo6uMu?=
 =?us-ascii?Q?KiJmziFxpcU5DDVlT2mtIwTRqayuZfnL1qoDhrhykFXZsBss48hUS1cO/E/7?=
 =?us-ascii?Q?Nwr60J4tWRXPfmx7kdoR+nAP1lbJz5hKgLo2ArvDtuaJIAHm/H61gnHGjfHP?=
 =?us-ascii?Q?8TuZ8zFrgZEa5ShYwK4Dw2+gZm6WxpyKSWUNr3zqqOY8NxgQMdnwy22w7zUy?=
 =?us-ascii?Q?iJnbA8gw1b3j10ki25rU+KmeP9wNGZ4Cr6fkyCRc3fmde1nzUHxwUXRdqBb1?=
 =?us-ascii?Q?znF7owJ1DwAAWjO+4Z4S7SgcidCejvv+YIPXGuX9FcjDr4qlTiHH0puYVtnY?=
 =?us-ascii?Q?Z5t29GhlZDpRKLfAFVjz7ZzNyK3AuGqh4zMczxieUZySwL/URfenJ55A1v4L?=
 =?us-ascii?Q?hd0ovlfptv7/2uFIFrMTETSqa50reT/9CCQ2fKWz1U2etr96CdpojY7aNQ/d?=
 =?us-ascii?Q?OPh2wOMAHHIe9svHwdsPpZFMrnojxUl1EfqM6oVSzIo1VfMMWW6V6f0qb+jp?=
 =?us-ascii?Q?aUkFpRwQaCBdTeEyWB+K/XsJD0URbOXHRnC3VFsaTKJ7unsEr3gf1oweZwZR?=
 =?us-ascii?Q?hCsoGGdw/hABpJpGoxTZc5enQma4owXSZvCUXd8uyV2RSutzymXnSJhw54IC?=
 =?us-ascii?Q?SAnORWlHGf1gaPyn2jNqadOVyuCpuS4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05f8452-bcd7-4887-3ae6-08df11d0cd97
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:54:21.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn4lfwFte9dJG5oz0g1zbZmugsHJnzct5mU5GOV2QW9Luo2RqF1BE7fxZ/JiHTXpZC6YJH6ocqfT1ucfLqxxKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

I split these three cleanup patches out of the r000 series [1] in order
to shrink it slightly. r000 will still build on top of these, but
because I have some patch re-ordering and cleanup to do there, let's get
this easier small set posted and hopefully merged in the meantime.

This is based on drm-rust-next at commit d669686f8170 ("gpu: nova-core:
mm: Add BAR1 memory management self-tests"). No other dependencies.

In order to boot the GSP, nova-core loads the GSP firmware image into
system memory, and the GPU copies it into the framebuffer, the GPU's own
memory. The GPU finds the GSP firmware image's pages via "radix3", a
three-level page table of 4 KiB pages that the driver builds. Today the
table exists as fields within the GSP firmware wrapper, which is fine
because there is only one radix3 consumer.

The larger r000 series, however, introduces a second radix3 caller: the
ucodes firmware image. That is because the GSP has been changed, so that
it automatically fetches the subset of ucodes that it requires, thus
reducing the size of the GSP image. This is a helpful change for the
firmware situation overall, but it does require nova-core to load and
provide ucodes, in much the same way that it was loading and providing
the GSP firmware image.

So the first patch splits out radix3 so that it can be called by the two
separate code paths. The other two patches fix problems I found in the
same code.

* Patch 1 moves the radix3 table into a type of its own that maps any
  buffer, and makes the GSP firmware wrapper hold one. No functional
  change.

* Patch 2 allocates each level of the table as a whole number of 4 KiB
  pages and zeroes the whole level. The booter, the firmware stage that
  copies the image on Turing, Ampere and Ada GPUs, reads each level a
  whole page at a time, so today it reads stale kernel memory from the
  unused rest of a level's last page.

* Patch 3 renames the field for the framebuffer range that holds the GSP
  firmware image, from elf to fw_image. After this,

      $ cd drivers/gpu/nova-core
      $ grep -iw ELF

  comes up empty. :)

[1] https://lore.kernel.org/all/20260822015448.238214-1-jhubbard@nvidia.com/

John Hubbard (3):
  gpu: nova-core: extract radix3 page table into its own module
  gpu: nova-core: zero-pad radix3 page table levels to page boundary
  gpu: nova-core: rename the FbRanges elf field to fw_image

 drivers/gpu/nova-core/fb.rs              |  18 +--
 drivers/gpu/nova-core/firmware.rs        |   1 +
 drivers/gpu/nova-core/firmware/gsp.rs    | 107 ++---------------
 drivers/gpu/nova-core/firmware/radix3.rs | 140 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs          |   6 +-
 5 files changed, 164 insertions(+), 108 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs


base-commit: d669686f8170c234edf12212fac9180ea18b1448
-- 
2.55.0

