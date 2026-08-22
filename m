Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFDE263F5D
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363703; cv=fail; b=W/2dEjq+saDlgl+XR2umiI1p02pn9hXUF8uERvMoGYATw/aWckYnQ5pEylVjqOS2XcQr56d6cwsmrpjr7QBe8pOcRK3ftE3UkOoJHaoR17oidBp6g00JKnH6ceh02bDqa5ldJjVVX+btfgcNUW45sP8puKcr4jjn42BTLAlFO/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363703; c=relaxed/simple;
	bh=sScDtNzSEl0Dd5Ismflv3bvVmzEer486Nr4iBF1Uml4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nbsh5VQ9z//mkjV0crNFANUCl+gBm6JZ6wqlVS7swhRzbAlP+5j6zvj4jFw3sBhw3G1bnTlVFeR0pvLlO8QDWiHeY0f0GA13JkyxEgZOwcA86TKKgO2zr6qVxoAJuL1RrOlXcBb4qXSY1gMR9nnnUafecOFIotTrk57kvzJlitM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XiUGx7Yp; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XiUGx7Yp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR2hpspqriazaIzGwbgZuwQSHZs4bgqsrfECX/AJ99DXb4x3pM0ioaa1pLHxVolqHRDY5+9QBoEitcMJ3OpinM4948DT+WUA4CHX/PA3qqs0ULoLjEYiaIH1Lx9uvvzauDu+GRa1KtGVRnNbV5DKee+qSeVcMcSEUB8pRTr9IfTvwu3QNm7to3o7PzbMA0ZmQgC7JOLen/LIuTLnaIhPFKydZxv89Rjchwz1QLgGO34+ZE/ppUUmH9jk7otdBl+gYTJqBlD3L3hRSfksOsqDzTbruGr3Ck2kgsh/aW9bXMGW6x8gDO7RbjJPFGDl8MmVOOs8LQXoEEGiPVEWgSnIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx5rWl+rmSw8IKdS4f/YBbygVNCo4rcSVym4Kg6Dnsk=;
 b=Amlghm7aEX2qOMdorEyS0ocsyqqioV4PkIBV5G8wdF+HgRapOaW6MraS7EFdgAPRf1hCjRwC3c+PtDM7Dy9R7BqRNKm3v8b3H+QRybUypuBwN7K5xUgqt5Ut1Yo4Kx7Dm3WX6VmEWXiXhzBZaTNvQesuXGCqQGi6difPJbl3xXCz7wUdfClupc9QzVuobItV6nXghBPcFkVR/VI2GgjcTEiJczV/CngTsmbH0J4w/hAaH0Jm3dk/TjqueDY76llBWNhI+Di5fkLALPRdgUXg6vfgb+MwEtwIT8pfgvJSE22s8StcxoT3tFfgWaXMCGO9pXkEtLHghwML8HrTpueTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx5rWl+rmSw8IKdS4f/YBbygVNCo4rcSVym4Kg6Dnsk=;
 b=XiUGx7YpkoeEWOymYrbilOyU9FFYMGHthlyJWlzbxp0Bt2YrdR45ij84i4Nzdo4AFnjBbpk1WUHbfwpQs9kvioAxrOIiF4x7ncFpKxsheCWhxW/zzss2Z09wu2Hu2woShCcWTUnpQbbx4Ewic08vU2ZodDlP8reinywU7pvRKu6QcL9R4Efdfo6CsFKzs1c8Dxnx8vJyTiiabjLIHFvdv2OqnRDzY4R//EWP9YZoFbeaBbkid6z0amAW+dIdbOQAQprimLSwgaaPodjgNWb+GtFLPNI0h4E4ckw9Ba1K8FiAG4NoaTBa9I4yJVE8wmEdlsrLlmIHrQC1Z4Kpq+scFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:54:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:54:54 +0000
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
Subject: [PATCH v2 00/31] gpu: nova-core: boot on the r000 GSP firmware
Date: Fri, 21 Aug 2026 18:54:17 -0700
Message-ID: <20260822015448.238214-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 0338b67b-739e-4d94-98ed-08defff05c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	g7Z6nHdaZCYq3lUpmRvfpMvA2wpw+BTWHMU82HDU8H3RK8uyuH+WSpvqrNwETToiYDDk7NutNBP2Put0lEMr9uxG7XrZxIFKlFoLn5XgKoOKcIUtm9onGC/81y4S/9kDzXQx9Gdt+MxfBAgblR4ygzRta9kzd8iYLGp4VVH76tDGm5zasYTaoaJX6d2+GhH/SaM/QZd4awjk1LljcqTh9xziCelOu25Ih1InmbPD8wczZ0hcptQOLOFevi6voVuaYt07iBtO/CNo7kfRGRVXSuxri9jcHAmU6QgJve0ICaoY4urJ+xSxZoH9NU9hrs1k+X5VYqwHm1DbNR2aGN2f2JfqWKDIjmPG8Alkew7ikG8kVz2gdxONXTDF5wuUyf/l/7Tkc2Rjo47QsnY3myyZXcQxHGG9AgzjITqusZmgllwICQ4SiIScRRUxOKQV45EfljzSdGud9GvZXMFXMb8LqMI3077Kts7mISUqqKpR/PF1vQSI84cLLJ6xaw4pYL+XaydfJ00qwptCMyNDCnW9wg0qouqA4IUkwbASrPBcXkMMV4ZR2BUd3K9tsIQWuDUDR5kn0/HohAbv3kMVwwF+/baMQ/ugF+YgGyYd6RttIWYsBJkoH4tu1P10F/RfoKBDccIMZOkRN82rb4ggK9c3e1KeJB8RvAjIOwa4jIQHnxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8zrBgHAiUZo0Tm8oTOSepeA6yAxsSVfM9/YY38jpCgO1QB98HaZx24GracuD?=
 =?us-ascii?Q?ZNB14likCrmaCXbKISUk8UYeyUM22k6Ug2pLVP6W+BV3Y64eCO0WTh75d3te?=
 =?us-ascii?Q?TbswDbhGBiL7SI6KRfw1QVNZkkziIYGR2QEwuRl3L7TzHhotN8GolT47YhwM?=
 =?us-ascii?Q?u4cpLfnb3g/uSd3TqwTdl5oth05tawyf9w+7VolEFOfPqKaGZIdm3b1/7OZq?=
 =?us-ascii?Q?raihOxJp7C+PRmmXiJP9zKzEpNmRy/L1aBI4T7sLIO8OKa+5PISHhpyMdrpR?=
 =?us-ascii?Q?jSA0y6NGCQBh+vDIbFLvGy1/yKVg04LCmyXPUBR0wXBZbWJBw+/iAtCjUzPK?=
 =?us-ascii?Q?16ebwHKHBULOecK1PQPautHDCf9yVkWhPMH6hgSdMhwatwQuMnIpjoqta5+3?=
 =?us-ascii?Q?uDwfp8XDfjkznFsSLcXauqJKnhCeE39B+FamQ+ScWFQJGaVhoCWnhQ+jnLnq?=
 =?us-ascii?Q?WauV6KIUXFJM7OMDc0FkbWA+GWtPD9e46TtffP54BFylAelSFn8xzJT/TrSL?=
 =?us-ascii?Q?uowZrOGZ7NjLVSkiC2lz0rRPRtHQtkEUzgKTkxLseYh93bzKKA/Kh2nGAZkm?=
 =?us-ascii?Q?pJlZfZgxfLCyfD6SyZ47Hk8op79P6iHWJX4+1vH5AoO5oxC3FJpCdjL7Rr/o?=
 =?us-ascii?Q?S/pkWHM4koW+8J0CyojEiMT/GJKYSbVDJI9ZxC8hMKbe27i5NLqoBO9XPN8L?=
 =?us-ascii?Q?iZrn/38VSPUbXNvtFVi+q70du9oKnTs6u1elPjm72kgrAHYMKTw+ll7JK99O?=
 =?us-ascii?Q?pOTbc4aAlloYRqW9tbL7ukKLeXgbzAICgciuxRsOAmp2WIYbnPAfP6Xl9z0U?=
 =?us-ascii?Q?K0M+ysu2jmZvkJSkwzAXSZsG+ATkKUZTAdYtYOUkJcq0fsX2F2tLQhZWd18S?=
 =?us-ascii?Q?KjX3dxmfKdQcaipQV05nffP23/AdJR3otyZtEDnCL99z31UWk7b+Ua9IUB6g?=
 =?us-ascii?Q?Huwa/zFshR10F9DcEJpfwnux909eMl0a0vVn0QtvRLyOqQbdIjxUMetzdz+P?=
 =?us-ascii?Q?maPwi+f4ZYKdcFOekLtnONvq2dhO6VrJ9t+sHwFX9ITSlnEVWAfU+cAFQNdL?=
 =?us-ascii?Q?JdJ7iAedtHZc0tzk713UdB5GjLtSN+XmNQEyLSqAp+5ytVvsodfUyt+TYGi3?=
 =?us-ascii?Q?XGY9wq3Er3++Hcl9dZhzaewN+4pZWymQDx4fSpSDWvUzGqipcoafUzR3b6gZ?=
 =?us-ascii?Q?Y3DVtYUM1pHjzp9fARzr3jVIe+/4CVGJJ04bFm0LMKXmBuZB5cHFjip5d449?=
 =?us-ascii?Q?dRD+JwiwCunnaCVUvcltpIkJ+y1DYjFkRSo+CEl3/cBZcyZuYJ1bbeBt/oP3?=
 =?us-ascii?Q?PJQCUZlIZy90N5cTmnaAlPRuXDH5bUK5qbJLN1xw1sgwoHWhRN2lWXeqGpRD?=
 =?us-ascii?Q?tyTiTQ4a1EZAB5NwQ8d17oFJtkSeIu3ZGyIuz8WrEyOYCQ0ZWUGPf0MI41+v?=
 =?us-ascii?Q?XcbpRLXyZJGfEzE1gRpRyD/0nhizDy7YWTymrJdVmcZ/50mkkPzhOA3Dvh9x?=
 =?us-ascii?Q?g0WpBb5erFhdNtsVuP6Mq7O9P6B6a+bMhuAxqJ9Dh6QUSs+DSa+XJDDMFhT6?=
 =?us-ascii?Q?jvLctygGHGi2mXBT2N6rzAn3NCltATHe70CyrYQimyZKIiKTNICrV/8Haa/3?=
 =?us-ascii?Q?hQSztpab+uyIph6qftiYRmyvlIOf/CNgF16RixqmpZ0viLM9isNKxffU3lxG?=
 =?us-ascii?Q?qf+fuHFCvdXXW0kAwCkJ3HGOL8byEbawyDkmSORBqM0pUHvzMfAAFWzrjfBZ?=
 =?us-ascii?Q?Tuk+mg86LA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0338b67b-739e-4d94-98ed-08defff05c42
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:54:54.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6QdJov91ORKOsdirag9g/oldkZZYwnRTBpc/6UmVmHbRyClRepDvRgT3CHqaPDKcy3FvCOzmn6lxZL0MDoK6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

Hi,

I'm sending this just a few days after v1, which is soon, but Timur Tabi
and Zhi Wang reviewed the whole series in that time, and that led to
quite a lot of fixes and lines changed. So I think it is helpful to
provide a v2 now, so that future reviewers can avoid rediscovering all
those issues.

Changes in v2, from Timur Tabi's and Zhi Wang's reviews, plus a couple of
small new ones at the end to do better printing of the new GMC API RPC
messages, below.

(Every number below is a v2 patch number. Patches 1 and 27 shifted the
numbering from v1. Patches 30 and 31 are new at the end).

* Patch 1 is new. The Rust PCI abstraction has no accessor for the PCI
  domain, which patch 23 needs.

* Patches 2 and 28 drop the generated bindings that nova-core never
  references, resulting in a net removal of 429 lines.

* Patch 4 documents the MCTP destination endpoint ID and version fields
  in fsp.rst.

* Patch 5 uses checked_add for the per-block DMA offsets.

* Patch 6 allocates each radix3 page table level zeroed at its
  page-rounded size, rather than appending entries and padding
  afterwards.

* Patch 7 wraps the two debug-log counters instead of trapping.

* Patch 8 drops the inline BLOB representation from the TLV payload
  loader, loses two FILE name checks that could not fire, returns
  ENODATA rather than EINVAL for a zero SIZE, and loads the GSP firmware
  image through the same loader instead of open-coding it.

* Patch 9 gives the log buffer a single const page-count parameter.

* Patch 11 corrects its commit message.

* Patch 15 asserts the GMC API header layout against GMCAPI_HEADER from
  the bindings, rather than against a hardcoded size.

* Patch 17 checks the MCTP version, the NVDM vendor ID and the declared
  element length, which is what Open RM checks on arriving elements.
  Patch 27 is new, and extends the same checks to the RPC receive path.

* Patch 18 requires the GMC header's payload size to match the length
  the transport header declares.

* Patches 20, 21 and 22 use expect rather than allow for
  clippy::too_many_arguments, or drop the attribute where the lint
  cannot fire.

* Patch 21 restores the FBIF aperture only once the loaded image halts,
  as Open RM does.

* Patch 23 sends the PCI location as domain, bus and device, which is
  what GSP-RM decodes, rather than the bus, device and function that
  PCI_DEVID packs.

* Patch 28 also removes the SetRegistry command, which the GSP_INIT
  payload replaced.

* Patch 30 is new. GMC debug lines printed a bare command id, so print
  the name next to it: GSP_INIT (0x10001).

* Patch 31 is new. GSP-initiated events number their sequence from
  0x8000000000000000, which printed as seq# 9223372036854775808, and
  the GSP_INIT reply was labeled an event. Print the sequence with that
  bit cleared, and label a reply as a response.

Nova-core boots the 570.144 GSP firmware today. This series moves the
driver to the r000 firmware ABI, which is stable across releases, so
firmware file names no longer carry a version number.

The firmware is not yet publicly available, so this series is for early
review, and should not be merged until the firmware ships.

Patch 26 makes the switch in one commit. Before that, everything works
on r570. After patch 26, only r000 is supported.

Beyond drm-rust-next, the series sits on these patchsets:

* The GIN interrupt controller series, which needs Danilo Krummrich's
  PCI and irq rework and Joel Fernandes' wait_for_completion_timeout().

* Eliot Courtney's NVKV encoder and decoder, which GSP_INIT is built on,
  and his Vec::push_init.

* Timur Tabi's "gpu: nova-core: write initial RPCs before booting
  GSP-RM", which patch 26 builds on.

* Timur Tabi's "rust: error: add remaining error codes", which supplies
  ENODATA and arrived in the 7.3 Rust pull as b93fb6e76ec1.

A branch with everything applied:

  https://github.com/johnhubbard/linux/tree/nova-core-run-on-r615-or-later-v2

Tested on TU117 (Turing, T400), GA104 (Ampere, RTX A4000), AD102 (Ada)
and GB202 (Blackwell, RTX PRO 6000), covering PCIe probe, chipset and
GPU name readback, the interrupt delivery self-test, and the KUnit
suites.

The vGPU team tested an earlier version of this series, minus the final
cleanups.


John Hubbard (31):
  rust: pci: add domain_nr() accessor
  gpu: nova-core: firmware: add r000 bindings
  gpu: nova-core: extract radix3 page table into its own module
  gpu: nova-core: set MCTP transport header version to 1
  gpu: nova-core: add Falcon helpers for r000 LOAD_EXEC events
  gpu: nova-core: zero-pad radix3 page table levels to page boundary
  gpu: nova-core: distinguish async GSP RPC traffic in debug logs
  gpu: nova-core: add optional ucodes firmware loading
  gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
  gpu: nova-core: add build ID headers to debugfs log buffer dumps
  gpu: nova-core: rename the FbRanges elf field to fw_image
  gpu: nova-core: regs: add msgq v2 BAR0 register declarations
  gpu: nova-core: gsp: add msgq v2 internals
  gpu: nova-core: generalize allocate_command() for variable headers
  gpu: nova-core: add GMC API message types
  gpu: nova-core: add GMC send path
  gpu: nova-core: add GMC transport receive path
  gpu: nova-core: gsp: add GMC dispatch on receive
  gpu: nova-core: separate the generic falcon bootloader from FWSEC
  gpu: nova-core: handle the r000 load-and-execute HS binary event
  gpu: nova-core: handle the r000 load-and-execute bootloader event
  gpu: nova-core: gsp: add the GMC boot event dispatcher
  gpu: nova-core: gsp: add the GSP_INIT request builder
  gpu: nova-core: gsp: send GSP_INIT and decode its reply
  gpu: nova-core: gsp: pass the remaining log buffers to GSP-RM
  gpu: nova-core: switch to the r000 GSP firmware
  gpu: nova-core: gsp: validate RPC element framing on receive
  gpu: nova-core: gsp: remove the RPCs that GSP_INIT replaced
  gpu: nova-core: firmware: delete the r570 bindings
  gpu: nova-core: print GMC command names in debug logs
  gpu: nova-core: distinguish GMC event and response debug logs

 Documentation/gpu/nova/core/fsp.rst           |   2 +
 drivers/gpu/nova-core/driver.rs               |   2 +-
 drivers/gpu/nova-core/falcon.rs               | 166 +++-
 drivers/gpu/nova-core/fb.rs                   |  18 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs         |  25 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs         |   5 +-
 drivers/gpu/nova-core/firmware.rs             |  44 +-
 drivers/gpu/nova-core/firmware/bindata.rs     |  38 +
 .../nova-core/firmware/fwsec/bootloader.rs    | 112 +--
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 215 +++++
 drivers/gpu/nova-core/firmware/gsp.rs         | 135 +--
 drivers/gpu/nova-core/firmware/radix3.rs      | 149 +++
 drivers/gpu/nova-core/firmware/tlv.rs         |  37 +
 drivers/gpu/nova-core/fsp.rs                  |   3 +-
 drivers/gpu/nova-core/gpu.rs                  |  23 +-
 drivers/gpu/nova-core/gsp.rs                  | 279 +++++-
 drivers/gpu/nova-core/gsp/boot.rs             | 550 ++++++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 829 +++++++++++-----
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |   1 +
 drivers/gpu/nova-core/gsp/commands.rs         | 386 ++++----
 drivers/gpu/nova-core/gsp/fw.rs               | 899 ++++++++++--------
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 275 +++---
 .../gsp/fw/{r570_144.rs => r000_00.rs}        |   2 +-
 .../gsp/fw/{r570_144 => r000_00}/bindings.rs  | 683 +++++--------
 drivers/gpu/nova-core/gsp/hal.rs              |  22 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  18 +-
 drivers/gpu/nova-core/gsp/regs.rs             |  30 +
 drivers/gpu/nova-core/gsp/sequencer.rs        | 379 --------
 drivers/gpu/nova-core/irq/gsp.rs              |   2 +-
 drivers/gpu/nova-core/mctp.rs                 |  32 +-
 drivers/gpu/nova-core/regs.rs                 |   9 +-
 rust/helpers/pci.c                            |   5 +
 rust/kernel/pci.rs                            |  12 +
 33 files changed, 3217 insertions(+), 2170 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs
 rename drivers/gpu/nova-core/gsp/fw/{r570_144.rs => r000_00.rs} (95%)
 rename drivers/gpu/nova-core/gsp/fw/{r570_144 => r000_00}/bindings.rs (71%)
 delete mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

-- 
2.55.0

