Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97070836
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370483; cv=fail; b=PBaBO2Rvhe6KtXXfNpU0zoyWrMDfXX+fCLJNtVv84rJ1f6kqCfglhnB1CdcuMMEivL2JEw7kHHN/hzn7T4LySn62TmDCxOZN3i36A2hxtj/qWYn2rmyVo9uNajwP7h0lAjLP7wdZ3lFJnSZI9Pf7nJARkOrvOmAW+XHd5yb4c+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370483; c=relaxed/simple;
	bh=wtoqKRYUBQWSWqzJSUtVrDj+/iDRqC3ciNeQgADB6RY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FbUabm+zyQnYBObNgox0tUvAekNPhnyNTqsZ6VPqXuOuQI0z1IW/8OHhEi7h56fbTP9MPTvcz01vvGElZzLQcVpr0q1e1k02kS8sGG/sw7+AdHixU3cUAKVmx/nB7GrqQHNXaT98MMqSCXnhASC0Sl4mKp3LZm20R2KYu+6QciI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rD9f2y/b; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rD9f2y/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcDkI4omQPP8rGkYPJHQqOdJ/hPUzM3M/hx9yiX/K3f/r/ptaa/z1sveHXcs7vMqbROrjei+w7ItsYP5A9p/Jhc0xYkw81BbJqrOOa92Syl7AZPvAT40SN+FLT5D/9IzZwPVNqC53r3YBWYx2VlLnS4Fy9zbT13d7EVIGotWiNtFSXU4MSETngV5dDc3GY/gUb6oyK0u5WmwtaZsDEawH9X0BTEzEIvoKEEY3F7j78SjCgJyFnnDsZBwEJIqEksv8eHEJUB7defq4E9hjPiSbHMh9R3DbQxCURssHxLVro7l5yqDDTXKe04RSGFITJ4v3WN/ICpzEXPb6o5S78vfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trZ3kr50b9gRfdJcbJCZpUxSWY6sT+SAqroMqFOOGqw=;
 b=VMXNPt/QTf6IXcQQ/OoZwSe08sZkfYSn5S81YVfR/ugj2TiVbBYTsthVXHsSrklkruhrruQYpRJDDo3BtHN8rItmw3uCBJL7ul7GXGRhwYhElNcgcw4D4v9FGnajmVD+QuTwD6hmh9IIm84xTyf6L/w7cmg7INvbkHMI2x+XVYigXdWmOitTRfPIwr4vDpbX5bbmFvGekyP5FK6U6/6KE/roO6fro9Ka5O4UagU6uPrQk9b/9oaX5YLu09V074E4ZEgjFAQI2izIIS7e/WiTxYWPfBQgG6FCpxWkVWxm+F6eFo6SKksrbaWfEJWLjA7BYFX2meDjBlpB7TU6MKIvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trZ3kr50b9gRfdJcbJCZpUxSWY6sT+SAqroMqFOOGqw=;
 b=rD9f2y/bIx5kI+xDiulsLU/PCS7a9b/VUNSTMdnaY/jhc6VjN+F1XiHuiRdP0AAZqNLo/JKledpIjWXqSykeptee0zvDcChwJJZhrNWkG8uZdwMgIhwyEcxzU7GPcE9jWXMY4g/4N1SOKuA+8ppuzleEJkP68QdFpb19K6R8b57443nzV3SdLvBjScINBx3Qa4V49Ry5Y2ePD0NSH8/TB+Adol+jC/5ZZAMFx1FzqsE80eOE1QBVd115xxdGoWu+xBHIujj5ziUVzjQEyJJfLv28A4RKYaCDyH+eyOMMUj8hnHcsMQOfVr6JJ/5UkS0CJv7AkMXBee6c3Sa8YLPdNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:13 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 00/22] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Mon,  1 Jun 2026 20:20:48 -0700
Message-ID: <20260602032111.224790-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: cec00df8-0285-4e3c-26e0-08dec055fffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|18002099003|3023799007|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	xy7ZggPvi513Bjj7EHBBHArZqqHxz9lyZo3h+zEbzo+l/jlmsY2NvtC4RIjlS8yx0rNOwMTelfl+SnnBddMRGnQPwg62//y/8dlnjGZA4VtWcNTw7lJybTGTcOxQH2bReptmFSF7UMPEP1HoBXC2is4G3JNBsKQ2pXxvMz2MC1E1w70RvWYa5g1KK8zcfm0mVJNeyjG0RdRTvoY8MgM+tru+pfAtgiLJh1ihj6F8sVE73IVCz1IJ0nrCbBohjTXJ91TagIXk0w4tpsfj1ICM3wma8q1cUJXeQ2HiAnW+IoAmTPiINPZgpPKRHJX44XW4/36F3xB9o21cil9axX9MLvGxcxsE1M0X3iGfGUUyzpAc2bBS5eDNtE+TIrI6oo7X/hlbh6IrejLSFiNKTg3Rz1wngnEAxkKusvLPkjJCS/LLtiKiqTJNHCedgjGUV7s/WsvA+6UkPBIFduOEwd6n5Z4LJrNvRd6jAhZYq4oVe7tY6OaV0hw2aaPG8TTRzudsqdjS6kfr2OeZmrpNJZSSoIu+e2kDmAim9JOsjzbgOwqwl0i7XHJTkf+t1+7Rn+f06CRbtoOBMxmp+Wek0t2amWpYO0k3/85YaBZN/rArVmLZIBPeCSevWTUJjBNcvnVJsI7BxeYfOHrSBRH4qeEWBlwXVT1i1LJp6dN0+X21ifP2aECPCCzQTxJSOCZQdI4kEOlVHf9Dl+m3bjgEHctV2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+R6vYDHz6N8RHuZzBcGgTT71WWxYp9ouLw048u0/kkerAFBkuc22g8JT8AJm?=
 =?us-ascii?Q?qd1RHv3AxfO2f7ik+7rtUnvgwDc03igpO2W1/5D98qMQnwIBcnBPHWkxyZln?=
 =?us-ascii?Q?XguL6Wo+Kth/srDCLC9fOFz9MvfyUc6mzoaVUpqzyRckb4S9RtnpNiuoIqVF?=
 =?us-ascii?Q?e5NHdmP4QGmLbGKCP2vTq99T2XAVugXGw/mdSjrSBYfGM+cJlpm9tXDwdiSs?=
 =?us-ascii?Q?b9qNHuxhecbNdJUJiwd72KOi8/oyl8Z2lfd59tDaSDjd3aQgCV1wTu14ml+c?=
 =?us-ascii?Q?azrfJGlerTtHzMk8B61U/0bQ6oR/mJUzlmffMOol9RSedxSEIDr/MfzRH061?=
 =?us-ascii?Q?MOxtXj4q4YSJaNj/fAf8rqpvGjUrUoxcgu58B3CY1LvbRouiG+a4uSCv16h/?=
 =?us-ascii?Q?Y+V/EkBgr+k7oVGtuEJhKW2TFeSfcJqJNl0w3W/pEN449MhCGYoBEGjkoa6z?=
 =?us-ascii?Q?2649IbUb5eMVQ9AwKbfMfNR8PGi23/kCw6raEVJecseJWXMsiQq3lO6D+aO/?=
 =?us-ascii?Q?A19yB59ayIP/2FvdcF1xjUCDRBhb2wfZzUpqjplRb5ibMCNeI0WjGXKfGBeY?=
 =?us-ascii?Q?3naRHvy+hwHXvoq1C0Osewn5PKe0rGC50AiUWn3MSPViEyNOaUKpqlhQQImm?=
 =?us-ascii?Q?rSryJTb291x2kWVBgP1qiaFTVwp5H80MUBEgQ8Tg9HJVr/ooQ8G/hblif8LM?=
 =?us-ascii?Q?8eL0QKzOA6lEChjqQ48pMKPxpWplHsJcgl0wxm3VA/R/KyJJUUma7KVEiN4E?=
 =?us-ascii?Q?6aFJ9X1sdhBowIsXGMgqIc+xP1hA0aKF5bfmwl1Ub04xmr4L2bZQL+bPV6Xc?=
 =?us-ascii?Q?d5q8sJ1XxfnuT21wlrkTKc80gaEm7d4kQFqbb36L9L5HluoruEIjO0cWU54M?=
 =?us-ascii?Q?3u7io1h8e9sZeOuJIdLCGfK55Srw+4oECHdtnYCndxD26dTpxtILCxAYCgm+?=
 =?us-ascii?Q?dqG0EEVECmkMZNApd2os8+WqjKN48V+mX8yNIzLMBFHVkv+UZWpK8zmNkuIP?=
 =?us-ascii?Q?brM9s8pLEhw0Oo+1nBF9PrgqPxUMqDt3wYuOd6GIq+sBUVK3hj/m9yQUqcag?=
 =?us-ascii?Q?AUBocYJxdjwATDzXBwniTCarCStvBKunfCXcQnGolvWgZzL3UZazDPR026/A?=
 =?us-ascii?Q?EO7g7QiNuqHRhrKnLUeDQdqK1X3d0ymo/pzh5HhxG0TYLuHlIw6n1dfZV/kf?=
 =?us-ascii?Q?zVqcxtSQDgrmA8itBxPkM1Ewcjpiif4iKwGKHHmtVzhVJD4lmUmCsfQo/KQ0?=
 =?us-ascii?Q?pSJfWfwpTNL105wnkIx80O81YVb8//cQdk/NKE2xzFAGf5CI+DCuJy9xA3/J?=
 =?us-ascii?Q?vX8N4PRvpOMANxu/X42lQIPIydHFzBmqpWk1YGKkqE3rSXZuPpCOjtHEtXKq?=
 =?us-ascii?Q?bvJDRMWTcMBlC6vGainhlHeh4nZeWGKhQV82GnAQa+YDtUmDnpkq2Es6eEA9?=
 =?us-ascii?Q?19OCIFudS6oEOUxW7ZNLXwf2oB1ItNBpcKRKLlDNa/NuI/Objsu5VQOcQQMq?=
 =?us-ascii?Q?tskyR3E/zMgLHXXF71rp7W+PwNQgdF5QvFtK5sVCdY/bHBg2kQaogK11M4G6?=
 =?us-ascii?Q?JYZ7yeGcq8HVqtsUPBpAlUaWl7s9m93CQfaytV/VD1gv+8ZqJHlpFcO3ClsJ?=
 =?us-ascii?Q?eanYrS8YbFwT1luO+d9cteI/PITlUIgLHrN/6nAHzDPDvvJrfCVucOSRoYP/?=
 =?us-ascii?Q?tJ8JKGrrRF6wihb4NVWOpGgnV3aN796gef7bJaXKBwpUhnFb0awZRySlqF9Z?=
 =?us-ascii?Q?WACHalCU4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec00df8-0285-4e3c-26e0-08dec055fffd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:13.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkU1esjdwQyoOesHrP7Y6ZAGo2//MONKpI3BYWZLbJGP72vYsWVdRVDVE1L29+Whxeqcbx37Gegs9WlrpGuTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Changes in v12:

* Rebased onto drm-rust-next, formally picking up the "unload" changes.
  These were already included (I previously neglected to mention that
  dependency), but now v12 applies directly to drm-rust-next.

* FSP is now an owned object (Fsp) rather than a namespace of static
  methods. It owns the FSP falcon and the FMC firmware and is produced
  by Fsp::wait_secure_boot(), which only returns once secure boot has
  completed, so the Chain of Trust methods cannot run before FSP is
  ready. The send/receive and boot methods take &mut self, making the
  Fsp the exclusive token for an in-flight exchange. The FSP falcon stub
  no longer creates the falcon, which is now created and owned by Fsp.
  (Alexandre Courbot, Eliot Courtney)

* Corrected the GB10x sysmem flush register base. The HSHUB0 registers
  were based at 0x00891000, which has no counterpart in Open RM. The
  correct base is NV_HSHUB0_PRIV_BASE (0x00870000), which is the same on
  every Blackwell chip. The HSHUB0 and FBHUB0 flush registers are now
  relative registers with names matching Open RM, and the per-window
  base lives in the GB10x and GB20x framebuffer HALs. (Alexandre Courbot)

* The FSP Chain of Trust version moved from a Chipset method returning
  Option<FspCotVersion> to an FSP HAL method returning u16, dropping the
  newtype. Hopper (version 1) and GB10x (version 2) share a boot-status
  HAL but differ here, so GB10x now has its own FSP HAL. (Alexandre
  Courbot)

* FMC signatures are initialized in place with KBox::init() instead of
  building the 816-byte FmcSignatures on the stack. elf_section keeps
  pub(super) visibility and the FSP size constants stay private.
  (Alexandre Courbot, Eliot Courtney)

* The Hopper framebuffer HAL is now introduced in the larger non-WPR
  heap patch, where it first differs from GA102, instead of a patch
  earlier. non_wpr_heap_size() is no longer a defaulted trait method.
  tu102 exposes non_wpr_heap_size_tu102(), which ga100 and ga102 call,
  so a future chipset cannot silently inherit the Turing value.
  (Alexandre Courbot, Eliot Courtney)

* The FMC firmware image is declared via MODULE_FIRMWARE for FSP-based
  chipsets, so it is bundled alongside the other GSP firmware. (Eliot
  Courtney)

* ELF class detection uses named constants (ELFMAG, SELFMAG, EI_CLASS,
  ELFCLASS32, ELFCLASS64) and drops a redundant length check. (Eliot
  Courtney)

* FSP now expands to "Foundation Security Processor" throughout, rather
  than "Firmware System Processor". (Timur Tabi)

* Collected Reviewed-by tags from Eliot Courtney.

Changes in v11:

* Made the FSP messaging path sound. The FSP falcon's EMEM window is a
  stateful register pair (program an offset, then touch the data
  register), so modeling it as a stateless I/O region let aliasing
  accesses corrupt each other's offset with no unsafe at the call site.
  The EMEM accessors and the send/receive helpers now take &mut self, so
  the falcon handle is the exclusive token for an in-flight exchange,
  and the unsafe Io/IoCapable impls and their unreachable! bounds checks
  are gone. The accessors now program the EMEM offset once and stream
  through the data register using the falcon's auto-increment, matching
  Open RM, instead of re-programming the offset for every word.

* Rebased onto a current drm-rust-next that already carries the v10
  preparatory patches, which are dropped from the series.

* Top of the series: the v10 boot-integration patch is replaced by "gsp:
  enable FSP boot path" (Alexandre Courbot) and "add non-sec2 unload
  path" (Eliot Courtney). The Hopper/Blackwell boot path now lives in
  the GSP HAL (gsp/hal/gh100.rs) and returns a BootUnloadGuard.

* Reordered per review: hardware-differences patches first (DMA mask,
  PCI config mirror, PMU-reserved framebuffer, non-WPR heap, WPR2 heap,
  sysmem flush registers), then the FSP/FMC stack, then GSP lockdown
  release polling.

* Hardware-difference patches are now HAL methods instead of inline
  Architecture matches: the PMU-reserved framebuffer size (patch
  retitled from "calculate reserved FB heap size" to "compute
  PMU-reserved framebuffer size"), the non-WPR heap size (now u32 with a
  1 MiB default instead of Option<u32>, per v10 review, with the GB10x
  value in the GB100 HAL and the larger GB20x value in the GB202 HAL),
  and the PCI config mirror range. The larger WPR2 heap pulls its base
  size from the generated bindings, drops the custom constants that have
  no Open RM counterpart, and matches all architectures exhaustively.

* FSP firmware handling moved into firmware/fsp.rs: FspFirmware now
  holds parsed signatures (KBox<FmcSignatures>) instead of a raw ELF
  copy, extracted through a get_section closure (per v10 review).

* FSP secure-boot polling uses a per-chipset FSP HAL
  (fsp/hal/{gh100,gb202}.rs) reading the correct NV_THERM_I2CS register,
  instead of a free function in regs.rs.

* FSP Chain of Trust boot was redone around a new FmcBootArgs type, and
  the response headers are strongly typed (MctpHeader/NvdmHeader instead
  of bare u32), with the vendor ID from kernel::pci::Vendor.

* GB10x/GB20x sysmem flush: the HSHUB0/FBHUB0 register details moved
  from module doccomments onto the write_sysmem_flush_page_* methods.

* Commit message cleanups: dropped stale claims, shortened an
  over-length subject, and fixed trailer ordering.

Changes in v10:

* Reordered per review (and direct assistance--thanks again) from
  Alexandre Courbot: the two refactoring patches (factor .fwsignature*
  selection, use GPU Architecture to simplify HALs) now come first,
  before GPU identification. The boot_via_fsp stub is introduced early
  and completed as FSP features arrive. The SEC2 refactoring, PCI config
  mirror, and reserved heap size patches are moved earlier in the
  series.

* Made pmuReservedSize conditional on Blackwell dGPU architectures.
  Open RM only sets this field for Blackwell (Turing/Ampere/Ada/Hopper
  all leave it zero). Added calc_pmu_reserved_size() helper and
  FbLayout.pmu_reserved_size field to route the value through the
  layout instead of using the constant unconditionally. Replaced
  `as u32` cast with usize_into_u32 for PMU_RESERVED_SIZE. (Alexandre)

* Split the GFW boot wait HAL change into two patches: one that moves
  the existing behavior into a GpuHal trait, and a second that adds the
  Hopper/Blackwell skip.

* Removed the Spec::chipset() accessor (no longer needed after
  restructuring). Updated the Copy/Clone commit message accordingly.

* Rebased onto drm-rust-next-staging, which includes
  const_align_up(), "move firmware image parsing code to firmware.rs",
  "factor out an elf_str() function", and "make WPR heap sizing
  fallible" from the v9 series. Series is now 28 patches (was 31).

* Depends on the "rust: sizes: SizeConstants trait" series[N], which
  adds typed SZ_* constants (u64::SZ_1M, u32::SZ_4K, etc.). The
  nova-core conversion patch ("use SizeConstants trait for u64 size
  constants") will be posted separately, but is already included in my
  git branch. The Blackwell patches that introduce new SZ_* usage
  (larger non-WPR heap, FSP Chain of Trust boot, larger WPR2 heap) use
  the trait form from the start.

* Fixed the PCI config mirror commit message: corrected hex offsets to
  match the code (older architectures use 0x088000, Hopper/Blackwell
  use 0x092000).

* Dropped the never-used nvdm_type_raw() method from the MCTP/NVDM
  introducing patch.

* Removed stale Co-developed-by tag from the FSP Chain of Trust boot
  commit per Alex's request. Rewrote the commit message to remove
  references to the no-longer-existent fmc_full field.

* Added missing #[expect(dead_code)] on GspFmcBootParams in the FSP
  secure boot commit, removed when the struct becomes used in the
  Chain of Trust boot commit.

Changes in v9:

* Rebased onto today's drm-rust-next.

* Split Architecture::Blackwell into BlackwellGB10x and BlackwellGB20x,
  after Gary Guo and Sashiko pointed out that GB10x and GB20x are
  distinct enough to warrant separate architecture variants. This
  surfaced several bugs where all Blackwell chips were incorrectly
  treated as a single group:
  * Fixed the FSP boot completion register address for GB10x. GB10x
    uses the same address as Hopper (0x000200bc), not the GB20x
    address (0x00ad00bc).
  * Made the FSP secure boot timeout architecture-dependent. GB20x
    now gets 5000ms while Hopper and GB10x keep 4000ms.
  * Removed chipset-level match arms that were working around the
    single-variant design in fb/hal.rs, firmware/gsp.rs, and regs.rs.

* Simplified find_gsp_sigs_section() to return &'static str instead of
  Option<&'static str>, since the Architecture enum is now exhaustive
  and every variant has a known signature section name.

* Moved dma_set_mask_and_coherent from probe() into Gpu::new(), with
  the unsafe block narrowed to just that call. Gpu::new() now takes
  pci::Device<device::Core> instead of device::Bound to support this.

* Dropped the local `chipset` variable in Gpu::new() and accessed
  spec.chipset() directly, since Spec is now Copy.

* Changed Spec::chipset() to take self instead of &self, since Spec is
  Copy.

* Removed the unnecessary Tu102/Gh100 consts in gpu/hal.rs and used the
  unit structs directly.

* Kept a hold on the Firmware object in FspFirmware instead of copying
  the FMC ELF into a KVec<u8>.

* Moved the dev_info formatting fix and the GFW_BOOT comment removal
  out of the Copy/Clone patch and into the patches that actually touch
  those lines.

* Added Reviewed-by tags from Gary Guo and Alice Ryhl.

Changes in v8:

* Added Clone/Copy derives to Spec and Revision. Removed the
  unnecessary pin_init_scope wrapping in Gpu::new() that the lack of
  Copy had forced. Added a Spec::chipset() accessor.

* Removed implementation-detail sentence from the
  Architecture::dma_mask() doccomment.

* Simplified the GPU HAL to two variants (Tu102, Gh100) instead of
  four. Renamed "Fsp" to "Gh100" to follow the HAL naming convention.
  Removed the spurious GA100 special case. Moved the GFW_BOOT wait into
  the HAL method itself instead of returning a bool.

* Increased the GFW_BOOT wait timeout from 4 seconds to 30 seconds,
  after Joel found that a different Blackwell SKU required extra time.

* Removed stray Cc lines from each patch.

* Fixed rustfmt issues in gsp/fw.rs and gsp/boot.rs reported by the
  kernel test robot against v7 patches 27 and 31.

Changes in v7:
* Rebased onto Alexandre Courbot's rust register!() series in
  drm-rust-next, including the related generic I/O accessor and
  IoCapable changes.

* Rebased onto drm-rust-next (v7.0-rc4 based).

* Dropped the v6 patches that are already in drm-rust-next: the
  aux-device fix, the pdev helper macro patch, and the one-item-per-line
  use cleanup.

* Reworked the GPU init pieces per review. DMA mask setup now stays in
  driver probe, with the mask width selected by GPU architecture, and
  the GFW boot policy now lives in a dedicated GPU HAL.

* Reworked firmware image parsing per review around a single ElfFormat
  trait with associated header types. Also added support for both ELF32
  and ELF64 images, with automatic format detection.

* Reworked the MCTP/NVDM protocol code to use bitfield! and typed
  accessors, removing the open-coded bit handling.

* Reworked the FSP messaging part of the series so that the message
  structures are introduced in the first patches that use them, instead
  of as a standalone dead-code-only patch. Also changed fmc_full to use
  KVec<u8> from the start.

* Split the WPR heap overflow handling out into a separate prep patch.
  That patch makes management_overhead() and wpr_heap_size() fallible,
  uses checked arithmetic, and leaves the larger WPR2 heap patch with
  only the Hopper and Blackwell sizing changes.

* Added a code comment documenting the Hopper and Blackwell PCI config
  mirror base change.

Changes in v6:

* Rebased onto drm-rust-next (v7.0-rc1 based).

* Dropped the first two patches from v5 (aux device fix and pdev
  macros), which have since been merged independently.

* const_align_up(): reworked per review from Gary Guo, Miguel Ojeda,
  and Danilo Krummrich: now returns Option<usize> instead of panicking,
  takes an Alignment argument instead of a const generic, and no longer
  needs the inline_const feature addition in scripts/Makefile.build.

* The rust/sizes and SZ_*_U64 patches from v5 are no longer included.
  I plan to post those as a separate series that depends on this one.

Changes in v5:

* Rebased onto linux.git master.

* Split MCTP protocol into its own module and file.

* Many Rust-based improvements: more use of types, especially. Also
  used Result and Option more.

* Lots of cleanup of comments and print output and error handling.

* Added const_align_up() to rust/ and used it in nova-core. This
  required enabling a Rust feature: inline_const, as recommended by
  Miguel Ojeda.

* Refactoring various things, such as Gpu::new() to own Spec creation,
  and several more such things.

* Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
  non-zero sleep intervals (after just realizing that it was a bad
  choice to have zero in there).

* Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
  consistent across patches. Replaced fragile architecture checks with
  chipset.arch(). Renamed LIBOS_BLACKWELL.

* Narrowed the scope of some of the #![expect(dead_code)] cases,
  although that really only matters within the series, not once it is
  fully applied.

[1] https://github.com/Gnurou/linux/commits/drm-rust-next-staging/
[2] https://lore.kernel.org/20260411024118.471294-1-jhubbard@nvidia.com

Alexandre Courbot (1):
  gpu: nova-core: gsp: enable FSP boot path

Eliot Courtney (1):
  gpu: nova-core: add non-sec2 unload path

John Hubbard (20):
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: select FSP Chain of Trust version
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling

 drivers/gpu/nova-core/driver.rs               |  15 -
 drivers/gpu/nova-core/falcon.rs               |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs           | 202 +++++++++++
 drivers/gpu/nova-core/fb.rs                   |   8 +-
 drivers/gpu/nova-core/fb/hal.rs               |  19 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs         |   9 +
 drivers/gpu/nova-core/fb/hal/ga102.rs         |  11 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs         | 122 +++++++
 drivers/gpu/nova-core/fb/hal/gb202.rs         |  95 ++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs         |  50 +++
 drivers/gpu/nova-core/fb/hal/tu102.rs         |  17 +
 drivers/gpu/nova-core/firmware.rs             | 189 ++++++++--
 drivers/gpu/nova-core/firmware/fsp.rs         | 133 ++++++++
 drivers/gpu/nova-core/firmware/gsp.rs         |   4 +-
 drivers/gpu/nova-core/fsp.rs                  | 323 ++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal.rs              |  32 ++
 drivers/gpu/nova-core/fsp/hal/gb100.rs        |  23 ++
 drivers/gpu/nova-core/fsp/hal/gb202.rs        |  27 ++
 drivers/gpu/nova-core/fsp/hal/gh100.rs        |  32 ++
 drivers/gpu/nova-core/gpu.rs                  |  28 +-
 drivers/gpu/nova-core/gpu/hal.rs              |  13 +-
 drivers/gpu/nova-core/gpu/hal/gh100.rs        |  18 +-
 drivers/gpu/nova-core/gpu/hal/tu102.rs        |  14 +
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |   2 +-
 drivers/gpu/nova-core/gsp/commands.rs         |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  85 ++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  15 +-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  83 +++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        | 163 ++++++++-
 drivers/gpu/nova-core/mctp.rs                 | 100 ++++++
 drivers/gpu/nova-core/nova_core.rs            |   2 +
 drivers/gpu/nova-core/regs.rs                 | 119 +++++++
 33 files changed, 1882 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: 90cb2bb93b85ba452d4d67295c8bf3cdeea7d937
-- 
2.54.0

