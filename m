Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4A2D47F1
	for <nova-gpu@lists.linux.dev>; Wed,  9 Sep 2026 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926402; cv=fail; b=LSOJQ+AozS3t8uemptNKn0NqtqwCCsqLrh2Y/DwxzjqA0bbyLTd5mJF4j4l9IlGJmnai1Mzwor+gdW2UVV8JCI06BtyXsQnBP4wyNG2AWnmPdSULkkSVr/O+GraUtp+Lj+SbNht+fNw+R2PoboYaopNkEyBrkUHi56ByJN7f7v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926402; c=relaxed/simple;
	bh=qqguYGprCpa0swZq37MoqYltEUDcP9tnjkr76A68RQg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jNmQcDKA6PPuP2KeoWFBuOMNESQAtLfFHnVPT9W5kW9rletH3VZPeqa9yUcuLDnyiNE9v8nqalLoT/9RQgZa95ISKtjp1XzUa9a9GvryquIkr2WZy0og4gk1VM/4PeIjqcX8iCxOf2WJg0OXXZmVA7+rmV8oa1C2vqNR2YBk+HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QE5ZCx9l; arc=fail smtp.client-ip=52.101.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QE5ZCx9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh22T9mnO9BHm+gthIAHzPytIy3fIBVj+RWfMTSJzYAlSvwajV2nzMnKwhd0jBVc3dQptoCYvuccNfl4WyFsx3TMjVWjbBjxgKlLxINR/AmjP7DxrpWakerKmigN3ZLgZczgT2W8EKqtazYJoYDedIVscKB0WG8+YU69NN6QMVLnsvMvb5q3bjnff4B2BkdoJXtyZpmwM4doNuyPm7FhCtMb29rPHqhB1lPqFg24R91f/tqDKWJH48gz1f9PNptUx++ISWRNlhSObXIu/T0qyJBQbJ2ngHKxU6WL4cqdpI5+ADSDGVi3PRNzpvKSLVHPSrkOuUX1rauYZXf+i/po5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDNo6ZXTuOpqydKZP/3FiUjabJXPVkcteZcuqk8iuw0=;
 b=yYboB3z0nZ3ZGzxe3YsDJR7CiCre42zJCu9XVN+jJmxD/CQMl8vU6IJnMAD9bZvTfDH2ol7TiM0UwTYtMoWiGaQtJKocCiGf3MmS4G7lr62wn+QR9TjHQPjL3rbLm45vgCQJsu71U5QjflBKOWrEZEMPddxHcQa5l/vgdvUPzZlQMyprSfwgTx/LRu5hKgziM4SKXq4i/9zRnUkXImtwNuQ08H82sQi/EvKf0IXRDkQzGGS9rsZUVyBPjQf69kji4lPs1ZvOypD0dQcYKbh18G9bwLarFlx1C9VEc2jEc2ZV0bXTEIZi4y1R/BIFECuvcNW2cvAgPbBD3QSyEsaAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDNo6ZXTuOpqydKZP/3FiUjabJXPVkcteZcuqk8iuw0=;
 b=QE5ZCx9lRYPpCWN6ZyjFEkTOO7ezNfg8iGaN4DPISJtgcSz0AUpy4RAe8wM6jWQjr7HxowAkmnp23cUXxuTGcr7OZ2U9M2zURKYPjvRL+1retl/4+TkOg6zvR+FGZRFpSnhRkgArVjiJRFHtc2NsgqKrncvZWEn7O5pnYwtjg1PetC3XXquW1TyNfWV2AvtQjD3IzmfveTnj2lGmVcKrFT8LkBF9hYkG5jmzRzs0Hg+HpJsOo49v1nChIG4DYP/uDVqPguG788vMVO+MJa+dlUHO1S5RQY1icQpi//PLDRvFfBRb2UU5MYrNLgDtB9MAoVFgIqxDeXMTLFCbfzPRGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB699018.namprd12.prod.outlook.com (2603:10b6:806:510::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 03:59:55 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 03:59:55 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 00/16] gpu: nova-core: GPU page table, vmm, and bar1
 mapping
Date: Wed, 09 Sep 2026 12:59:38 +0900
Message-Id: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOSY7CMBBFrxJ5TUkeyGBfpcWibJfBCCdpO4m6h
 bg7JvSiN+z+l94f7qxQjlSYae4s0xZLnMZqxKFh7oLjmSD66pnksuMDbyGlTBYLgRCqHSQGy7l
 iFZ8zhfizV32d3r6s9kpueeX/iEzfa91Y3hjbi9yUUlxMQx1Kp4eBvO6wRYWhFVX35CzqOi2FD
 TI4zv5/M83+TPMeEs43giUTQaHRQ/kdHaA49toLtIpLs8lP2dlFqH+nNTuCcMNzAduj9xa5Vcd
 gNsFOj8cTvyFG6y4BAAA=
X-Change-ID: 20260805-mmrebase-113582afb003
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::16) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB699018:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d025fd4-e4a2-406a-a937-08df0e26cedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	R8Nm9A9ZVwZ1oQzChX955Kb0vBQU31Oo/h+49nbOKk4Ucjf3blrES9KuPWJbkMYKRobmWgfhUzqBaeamhk2ZJaYwH1H+8+DTOhNbiFLdzkjBnAP8iCcAbaF2s+pP+fpfB+0HYlJeuFPhQRTyL/LAVeBBj9+9QAFKg/EmTwyPDhTlvZPu9RWtlnMRHMvrl7neM+87hbV+Gv/mOMcdZF1OBvgdHSbnYG2jFiOMs5eASYUjRouyIQtZFWVBHoZ2okVRiJlFVf7JeBX25/TFeg9NsmK1IJ4TSBvxPrYlOq8T1xhUpeDVb+xPTh/AjRg69ZmYbWn7oDt647jBTIdqfuABXJCo1PDTYbNCuzz+TNj8sbSZjg+v330bT3HL6HyuvXTQVXonJ6YT6RqQc//FIN5+38KZ0REyTiG2hXiR0/fwDhyZbP3+5FjStqVSmmTxz8wWIc69pkLTV8jm/PKFjQSrfMiFUBBseE2k7ThEPlC+blFxQs0j2qXWfBeB2z23um0o7EJSx5fRytzujsB7p8l4IvhPiAta8V41j2E5ii67eczO0Pq+cexxFhqhBCdrTe/xQE6gXRqYqsbH1uy22WObapdW6TZlykh/L3N9NRpdLOcPNd9s2uYj8bgt8vXQGjc//M+5Ec553YFzFXKENA1gMEz+gWNp+IfZUqrDlRQsvD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGppNStvTHUxRmpNRTIxOFNCZTRDaUhIMWtGTUUraGpEMCtySDNKWXViTTdl?=
 =?utf-8?B?aVdNNkR3K1g2YnY4SEVHRW9GaUV5ZUVaNDNDbDZ5dXZZSnY3NXhTZVRBNVRL?=
 =?utf-8?B?K1NjM3oxa01ueGovM2kzcmNKOUtJMEYvWnhvRlIzNkR6Y1FGaWlRSURCY2kx?=
 =?utf-8?B?K2dhV20xenJFNDNoUEJQOFFkdjg5QUUxVlowL1oxUlFudkhpNzJid2cxdFlP?=
 =?utf-8?B?K00xZksxMEdEWktSREtWRnFyYlQ2TE5LZTEwdmhYZ1VzSWtTN282V3NrOVRB?=
 =?utf-8?B?TWN3dUhQZVdOa3VpY01LY2t5eEhnMDZLUmNXbTBSTGZYMVpMd2E5VmhWU1Ji?=
 =?utf-8?B?N1RnSWxxaUd6QkxwZWRjaURZeXpTdWlpbEUrZXRadm55ZVIrdFNkVVdENWl4?=
 =?utf-8?B?ZHRENjhwT1QydGRBbVNZaXBHeVhtbkNDU3d6THpNMkdNQ0U4dzdEWmhsNkdV?=
 =?utf-8?B?T0F3M2FGTEZrQWV6Zm1iWUNMWTF3TWxhV2hMSmNtWWhoSCtocWx4cXprUmlK?=
 =?utf-8?B?TEZ0aWlkdFAwaE9BbkdYNDNsZnl5Y3BTTjRRUzBweXVyMERxT0Nkanprc0RB?=
 =?utf-8?B?eTB6aVRYcXEzNFFmTDdweUFjRE5MeGJaVitJeGFORi9IMTF3bzZJSENDK2lB?=
 =?utf-8?B?c09DNHZ6RVNxRXNpYTVsYVh2RHJUeVFkTVZ2aXBETVR0K3pqTkNna3U1SlVw?=
 =?utf-8?B?d2ZTVTBZa2NiK29uN2d0cVVTaExYZFg4ZjlGNXF4b1g4ZHNkWGxPS0dzZ0lJ?=
 =?utf-8?B?WHBrOFpQOFFJVXJJUVdWWU9XRU51SmoxVXVkYVNhRWI1VDdQeWM5eVd6UFpK?=
 =?utf-8?B?UDVHWFlQaEt5dnNscmkwMEZDNWtqdXphUFNnT0NWRCtQM3VRRncrRlMrZHc5?=
 =?utf-8?B?NjR0WFZVSFZKQVZ4MG1aM2FOUGplK1k1RWNhYytlWE9PSGgycG9vT0RsMUl0?=
 =?utf-8?B?QVBhajh2NXNDMW1tM2cyeVRXSU5mTTZtdEhBbEhXeEdqRCs3TE0raEtTZkNC?=
 =?utf-8?B?ZlYzaDMzNm94K0c1NElGekhrRnNPV3U5aVdxMnZGeVA5U2JXRkp6VlVXc3Jx?=
 =?utf-8?B?eDdSV2EyYlphNkpHUHNIOGhqanNLSGFTSXNJMmlGeVJsN3FSb2U2VWo5WkFD?=
 =?utf-8?B?N1BpL05MWGh4WnIreEcrWEJrQUFlc2w5ZU5tVUxNUkp3Z00yRHVHd1hRVG9K?=
 =?utf-8?B?UWV4bm9NMjI2ZTl3N2JPMFRNbjQ4UHlNSWNmVDFYUHFlUVptazNHZjBjbHdB?=
 =?utf-8?B?TGNLRHJMS1BEL2tMOVhYV1RwUzFVa2lPcERwaERFRmk5bmtBRTBLYVBQRytt?=
 =?utf-8?B?a3JZTkdWMndEWGU2dnQzTmZjRHhkUE1DZVNuV0k5U1dCNVJTR3RZUXlaZ0lt?=
 =?utf-8?B?Q0VpamhuekNxL1lOREE0VHhVc3Nsc2cyQlk5RE50UzFKQytYVFE1RTR3Wmo4?=
 =?utf-8?B?SjB6TWlsM29vbkNmS0JVNUs5VHZHZlRjRTEyQUlpMzRVS0xXQURWemw5T1Bu?=
 =?utf-8?B?b043WW1Cb1BFeFQ0Z1hvQVMrMnVlVy8wckFjd3VRRmZwcWlQeHdZOERVUkd1?=
 =?utf-8?B?ZmkwRzV2L0ZUekZqQWNtTlR6dkJFQnVjM0RWTE96VFQ3K25LenZrTzhFK1M0?=
 =?utf-8?B?UUU0ZEg3TGxTV296SWt2SUl5dVlmbFlyVjV3RXpsNEFDYkYvd2VIUzdPak1I?=
 =?utf-8?B?R1hpU0poTUVuYzhuT0l2TGhmeHlCdFY2Z3hPNnJ5RVd3c05kZzZWYkprRFN0?=
 =?utf-8?B?U0pubjJTR0xnZ0RrdlRzc1FaVEtSblZvZlo0ZTM0cEExOVdjYWZQQk9zLzdG?=
 =?utf-8?B?b2ZiWWIyblVZbmc3RHk4WUJnRHJiaE0wVi95N1FobWpIM0QzcFNjYitJL2F0?=
 =?utf-8?B?RW53eUxmcWdtbzk4NHUwVnlEZXVNc3FxRjJibTUxNG5NU0llN3hSVFk0NEov?=
 =?utf-8?B?cjV1TC9ZY0hHUElrZlIzTWdiTlQ5cVNNT3F1dmV0bFZYcXNCOWdUNTNidTM2?=
 =?utf-8?B?RWFlOFQwOE1GQ3crSmxtY1gya2UzcWVwa0JBekNRQytRYVZrNzRacysxb3NM?=
 =?utf-8?B?UmVCYklqemllTTAxbkpmN2xsbVNqQW5HMW1PZmV5eW5HNEdOeVl5bmQ2L0Ew?=
 =?utf-8?B?dUhGQ1gzQmdKdEs3YUVReUVCWVd1Z3c0ZmZHQ1BLdUJjQnBLeWVKZ2Fmc1ha?=
 =?utf-8?B?RmgycjZsTnY4SDNjeFFyaVhYOXJVaXdKK0ZwYit4cWUweUFTWWNoYVFXS28v?=
 =?utf-8?B?SEVid1NSanVqWU5Oc2w3M0RvVE05MmV3RllzQURJQXZ6aFkwOHBrMzNBWjNt?=
 =?utf-8?B?SHlWak45SkpSdHl0NVE2UFNEVk03emV6UCtBb3A5TjZLNzFJRzVuM2lXZHh6?=
 =?utf-8?Q?bRjPi0XCdCiYqNefnH3tOBJMOiJhnS99K/52RCUNcDtTQ?=
X-MS-Exchange-AntiSpam-MessageData-1: OAPYOOGXhw610Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d025fd4-e4a2-406a-a937-08df0e26cedc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 03:59:55.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVZyZAZShrmD8K35lYdpEt0fMnS3BPoOhQI7HKP6/NH7DxtQLY9ejBAnewKySySr8Asu0rVO27hE3/1SISjSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB699018

I am reposting Joel Fernandes's original series [1]. The rebase adapts
the patches to recent changes in the rust infra, like HRT lifetimes. It
also adapts to the changes I posted in [2]. It keeps Joel's design and
patch split.

From Joel's original cover letter:

  This series introduces page-table types and a Virtual Memory Manager (VMM)
  for the nova-core driver, plus a BAR1 user (with selftests) layered on top.
  The page-table layer uses trait-based generics (PteOps, PdeOps, DualPdeOps,
  MmuConfig) to dispatch between MMU v2 and v3 formats. The Vmm tracks
  virtual-address ranges with a maple tree, and the BAR1 user exposes mapped
  CPU access to VRAM through a small allocation API exercised by the selftests.

This series depends on Joel's maple tree Send and Sync patch [3] and his
PCI resource_flags() accessor [4], which I am reposting separately.

This series is based on drm-rust-next.

[1] https://lore.kernel.org/all/20260518181126.2493572-1-joelagnelf@nvidia.com/
[2] https://lore.kernel.org/all/20260827-pramin-split-v3-0-24b24d7afc52@nvidia.com/
[3] https://lore.kernel.org/all/20260511143604.3848176-1-joelagnelf@nvidia.com/
[4] https://lore.kernel.org/all/20260518180342.2387845-2-joelagnelf@nvidia.com/

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Joel Fernandes (16):
      gpu: nova-core: mm: Add common types for virtual memory management
      gpu: nova-core: mm: Add buddy allocator and TLB to GpuMm
      gpu: nova-core: mm: Add common types for all page table formats
      gpu: nova-core: mm: pagetable: Add PteOps trait
      gpu: nova-core: mm: pagetable: Add PdeOps trait
      gpu: nova-core: mm: pagetable: Add DualPdeOps trait
      gpu: nova-core: mm: Add MMU v2 page table types
      gpu: nova-core: mm: Add MMU v3 page table types
      gpu: nova-core: mm: pagetable: Add MmuConfig trait
      gpu: nova-core: mm: Add page table walker for MMU v2/v3
      gpu: nova-core: mm: Add Virtual Memory Manager
      gpu: nova-core: mm: Add virtual address range tracking to VMM
      gpu: nova-core: mm: Add multi-page mapping API to VMM
      gpu: nova-core: Add BAR1 aperture type and size constant
      gpu: nova-core: mm: Add BAR1 user interface
      gpu: nova-core: mm: Add BAR1 memory management self-tests

 drivers/gpu/nova-core/Kconfig              |   1 +
 drivers/gpu/nova-core/driver.rs            |  45 ++-
 drivers/gpu/nova-core/gpu.rs               |  68 ++++-
 drivers/gpu/nova-core/gsp/commands.rs      |   3 +
 drivers/gpu/nova-core/gsp/fw/commands.rs   |   8 +
 drivers/gpu/nova-core/mm.rs                | 177 +++++++++++-
 drivers/gpu/nova-core/mm/bar_user.rs       | 422 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable.rs      | 422 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/map.rs  | 342 +++++++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 271 ++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 417 ++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 244 +++++++++++++++++
 drivers/gpu/nova-core/mm/tlb.rs            | 120 ++++++++
 drivers/gpu/nova-core/mm/vmm.rs            | 346 +++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs              |  68 +++++
 15 files changed, 2937 insertions(+), 17 deletions(-)
---
base-commit: e6a2c988ed96a5a3af51ed97ecba980521bf2fc0
change-id: 20260805-mmrebase-113582afb003
prerequisite-change-id: 20260907-maple-tree-send-sync-a1479d1ab302:v2
prerequisite-patch-id: 81d532949891e2dd846cca5c420e4ba32e9161a7
prerequisite-change-id: 20260907-pci-resource-flags-b7addba0b34f:v1
prerequisite-patch-id: bdd1c2eb4adbedf1c53f1be61ea958743d2a2660

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

