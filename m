Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36718372B5A
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861292; cv=fail; b=SAcZUPHkK46+CaoS5M6VqNWUlD3NmuufbAIvGONmBoYBHWRGrBPE+AZortncNXMD3V1kbr5g9YKNN2L717tfhslMFdQCq5GmpH7z/AwnVWNUjId1GWbB9Z/J+GEMOTWHHtjYHHRGAC0/NjmrxId01JGt9ehiOmvuCGbArBkejFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861292; c=relaxed/simple;
	bh=EKYwSeOhYwUBk1VKR5QCcLyWYStqlAoYUnb3O8F3W7o=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=sRUbsoCp1bgdWLruA1ELR8e/nTedqkWHAXvo/0zXld3DWV5A95xvi4F29UpkflAN5+B6qN3iwfjSTLjAsQotWffKCT4bJHwBFs9fWjQk3ldRKzVqLPKu+Mq9Jt2hY6URvJ5ndcOjyjTdVYWWnAYeEMdLYJbviGgoZpsPcKP9IvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jEFAm7mW; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jEFAm7mW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UukNS6WBEP47rVMvce/DHzH+AGhFXEpsroSFAZS7J3ZMB6jTlMX6+OmR95y0ZN3f+1ikoY084k6zGnkttLZv+ESIu5y8YYlC1uFEBGw0exBC/dBqdBiSZG7JqPUDNz6JXazpBqVJ5Fu5Ary3auWhEOFKGCWtirisjwvfCxmrp8PgLFrtZvfg6wA3P4NW/LNEkBWshnN/HQr90gHgGqm/zzAzrOqGN+xZn1SVFAdlZZjQ+h4UmfaOLskQobMl21UcNBJte7Xy89+Chri5bUfHNn5xBdzrOf8Ha144HKSvOMIyAcSYhJD5q2bUfbLKN5SvLMDimN/j1esvAuWoWCuj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyIveAxmfKtNDYV2Lf8sKB8zU2bhlQY9oimuITzCpUo=;
 b=JKKVFB79zGZRrEWpHDypcU3GlfzQJ5pdHXi5qSnF8+6riDrt9qdYWQhapJEOOG9j+NqZVOBZCdI8P1H0CmfWPi9k6tQhMarffs60yC5/xA2KuJBvMqWwknMyc7OmanKEVM5ansgPk0MzAa/hcCmMNZPyl3bk4RWhC34ktk9D3jWtk55VZyVveMcP+/3BuOfb/BOormhCnXlVAY+cdu7l4OPRIwmQirjJfShyvBvWirUcgAJkVEda6ByPvay/2nWSZN8+D9tbjM8tw8W0q21BOANR97U59Sh4JbWtPyIDA+Rosp1EkNRYrrx4V2aom5o8rxU1LhBmtB12WFaRLFwxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyIveAxmfKtNDYV2Lf8sKB8zU2bhlQY9oimuITzCpUo=;
 b=jEFAm7mWyc9du6+bezvnuOjh6WNcwWJDX2q+4KCTk2QPTwur6kNWel4JCOzc1oPzVB6j6xfHdMHO2wb9uQGcvSAZQIem8gksU+ARzxmh82WCWIMmhA8qst79liNNKI3Cr5M9X74FZdVzzIxnVeCSUxAgRuprJC0xy22QiiBGyrmDoU/2hgtoglIYop0kprnPKM3c8jd7tr+Komt+NAIXaDprNd+oqZ6Ai8EF/6mtyXxG8YvE5R7HGs7skdi7Rp7lcvDMvO4GXYI3n5R1d502PxJDqhgsGNF3t7Na81I4/JpiVckvo8D5ggIxNFMabarcbGia09qZynpg6TGo+YSdmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:54:46 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:54:46 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 08 Sep 2026 18:54:12 +0900
Subject: [PATCH v2] rust: maple_tree: implement Send and Sync for MapleTree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4V07Zi2EB6u+A/DYmhHGSOFtNhIC
 P8uYNy5PMm95ywikGcK4pIswlPkwIPbQJ8SYTp0dwK2GwstdS4rWUCP45Ng8kQQyFkIszOAKis
 qq7BNpRbbdfR04/ehvTZfDq/2QWbaXfui4zANfj66Ue27X6L8n4gKFGQpWmMzVDmVtYtsGc9m6
 EWzrusHXS6Yn8sAAAA=
X-Change-ID: 20260907-maple-tree-send-sync-a1479d1ab302
To: "Liam R. Howlett" <liam@infradead.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>, Gary Guo <gary@garyguo.net>, 
 Boqun Feng <boqun@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::13) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbbc14e-c2e8-43a1-2dee-08df0d8f36bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|10070799003|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mmuV15z7kpdoKdxb88DyaaJk/Q2lgOe4S18BDk5pOKdKI2Hi31AHgPbz26e1w6naBURen9VaYXZMH43E1WYiT/cRfDkOmRe6hmzaUj4fSdBEJt3lbpPxKqVyrmh4ljUiSCCPrB5k4t343qkSPBvnQOuaoOa/QjRsgNMgJ6rD8Z06lJY58A4SzA1pMaA92A/jQwqkLVBDxHbC0zQZ+SXEbMQKEkwj08frh2iFt5fIS5UmCzV91q7biOQEM6hsKLjMsU9OFi3n+1Y2OdfSatMhQavAbgdq+AamTaoGAM5puIopyiL7oRUOovZyXnOT6g1FMkaOhQ9QOOVZMp2Q4fRR6AuzpilmQJsILR9LDfx3lIySUstiqUUo4gKb03BkTCJ3GWn0GYfTO6OslB2ddKYeRQ+KquPslrmqamWsGrcqhuUmFTuetv7e+BozTRvj3NEEZNJk7tTXO+uTqE9C0SpeC7tpYFHIRR+CuUqQZ//p+kl8f892CVp/fRpWrZFtYKtqSWjdjp6qiZWT85VSQEhlBED7T2JsafDkK9ZmRZc3DrRHcxtPJ2nr6xfy2JYa348NQQGiM/0757wukBIvyn12opQ1zRgV45MXIHAIbtEt6iFgpaGYjyUvNcZOs73UYfxL/5vB+vmeeXeKfb5pHemt2x4JTtjHTMP6B92UAqlGgn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(10070799003)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjcvNTVyY3lsMDdZbFBTbzJnS3RFYTQ3KzNhejZiWnoybWhtUmVsZDYxMDlk?=
 =?utf-8?B?cmNEWC9Hang5YzNxbVBhNzRKZFVBd2tZNTdZaTNFdzRxMHdBZ2ZWMzZaQW9U?=
 =?utf-8?B?Y2tNY3RSTldoS25od3UzMG8rcW40VGtDSmdyMmNEZDJUWmNNSlpFV01JVTVt?=
 =?utf-8?B?V0JyZkdRaUtySHlSOVNwd0dudWF2bVRBald3WXR1eVFRdm04bkEvSHQra20v?=
 =?utf-8?B?aTMzZDVDZGs5aGdrbFdOWHdqM1FoVVFyZHE5ZjdEUUdMc2VJbGJXbTRBYitx?=
 =?utf-8?B?V0xNM044NEhFdng5ZzZZYTVheTl5RG1Va2xTSHlSZkZNK1BBM2xONXZVTURq?=
 =?utf-8?B?VGxmYVpkc2wvQjhnMXVycXk1VEE4YVBqbFJCMlFjZGNtU2dvNjJBWnBMTCs2?=
 =?utf-8?B?MlpPdmRnUHFLVEJEZ1g2QUFFMWRPSTkvVTFXblZOTTZiSm1pU2I3L3hkNzIx?=
 =?utf-8?B?aGJ0ZDlLb0REcTA3VDVIN2V6NmpWU0lMVDFpVW9aQVpoTEROeTZ6ZHo4MjBi?=
 =?utf-8?B?Si9pYTZ0RTZlcjhPMHQ3endkQjMzRVFscXA4cDdlc2R3dVlsRGoxNEhHVnZi?=
 =?utf-8?B?eVQwRGYvOFUvUHdrZzZSZDBiQkNHcVZDQWhCVFkvdnUwdUFid3lkdzgvTkNW?=
 =?utf-8?B?YjVjVklESllCZStmdlZyTlZSWmk0aFFyVnhLMXoyQm93NTY2eUZIR20rdWxx?=
 =?utf-8?B?bW5zNzVPdkVwSE50V0ltaGdkMjg0dnBZQU1tZVk0WURkdDVFL3RYaUlDYlR6?=
 =?utf-8?B?T09RNUhzdUpkemt0dXJQb1lOejZoZTVxVFVlNkprWmYvTmpSZDFYN1EvMURj?=
 =?utf-8?B?UVVwVEFOOFByN3o0L2gzc1pmck5ab3l3ZlMwUG9zamMvYWlVZ05zSGpUckNU?=
 =?utf-8?B?MVFOeVhKRzdpVHB1U1BTWmFqVExRc3p1dUNYQjRGSmJwZTVPMXg1M2s4Y25L?=
 =?utf-8?B?MDBTUm1vMlNUYWl5YzA1UmtOMGtzZVVsZGZxNjQwOW5adU1MQmgrRW13Z0xk?=
 =?utf-8?B?Y1dPa2l5Q0cybTFNd2lHblRQVlVWM29CMHp4bjcyTzFMbjFSdDVaVXV4eG9v?=
 =?utf-8?B?NUUrUVRoTVBvZWhIWHVxV1RubUU0MEFpSUdacWtzQmMyTnR5SGhqcUQ1S1FS?=
 =?utf-8?B?TzBiNVMxcml2UW40UzFjeDRWT0Z5WWR1ZnB2ZzV5K2tiNUNjRnRqOGZyTFpD?=
 =?utf-8?B?cHRBZzkyWnFlV1hRQWRvSWdKaFBLME5yNUZvc2xCUzBwWUxZQTRXMktVSDFt?=
 =?utf-8?B?WEZuSDdrUS9wWTVqTlVuNk5pdjZCZmlTWS9iT0F3VFMySGRwMFVKbkZ4SWor?=
 =?utf-8?B?U2tYbUtucUFsUSs5Mmx4V0MxOUJ6YmF4Y0tiK2tWbzdPVEl2UXBCSEdDRkwx?=
 =?utf-8?B?RGhqYWVwaTBJbEdMekdYRVN3RVg2L05EOFZXQlNVZmlJellKeUx5SGNENUkv?=
 =?utf-8?B?bHRyVitOY2lmbjdZV0R2SEIrNjJzQlJwL2dJUjY3VE4rWDVNNG0zS2FnRUtJ?=
 =?utf-8?B?amlvbmpjeFo3dnoycVhNY0tlZk0yaDZxRFN1Q3kxNU80N0J3cmVoUXA0cjVq?=
 =?utf-8?B?dGZsY3ZUc1h6NFdKYmdEUkNuNDlxdGJXdnNCRFhON1FueDhYcjMxVEpyenZu?=
 =?utf-8?B?T0l2VmdtdDBBM21EVXV3Z2k4V3lXN3FMbEhyZXlzWUpzR3BFTlZjejUzL3NB?=
 =?utf-8?B?OTNITkNzcjQ3VUNNbFBFZlRON0xobkMxVEFzUURaZGZ0UStUbWF4bDBBQzV1?=
 =?utf-8?B?bE12QkJscjFkUG5GTGRPbEFPL3d6a2FWbnBnMmNVRW1sM3lrWnhPaEdWSjJU?=
 =?utf-8?B?TVE2b05OLy9QWTcwOTBDQlZkNFRiZjY3Zm1sTlhrMHpUbHRuekNIWVJDWDFC?=
 =?utf-8?B?bGxRMDFwWFFxUkh5bGZ2UWJoNE1jMllTdEd6ZUpXcjRPdDdiR3gyTEsrdnFl?=
 =?utf-8?B?dUFvUlhsTW16RUR1WmJlK2dQV0FSVC9tc3ZlZ2lPUUtyNGg4UkJDMFhHZ3dN?=
 =?utf-8?B?N1RzcGRJK2NFVzZGdHk4Smc0bGxWVGRmb0RqbjkrUEJON25JV3BDd0V2Z1pB?=
 =?utf-8?B?YXprTWNDUk0zc1orZFhUdCtIaGRJblE4bVRaczJjSmFxMHZ4cUJJOXVwZE9Q?=
 =?utf-8?B?eDVpdEdFNllBWENiSGxjaktDbngrSlRsU0VHR1ZZeHI0SWJIdWNla1h5djhY?=
 =?utf-8?B?L2ZsdFV3blNpamNhOUJIYkpHU1F5RmFraVd2SDlSZ2FXeUF1QjNXdTdWTEwr?=
 =?utf-8?B?ZEpGNW5zRVdGWTZIMG9GTXJ0MnF1dXBMamdheXd4aXZTa3JjSitFcWdrVEdw?=
 =?utf-8?B?R2lGd3JCa0dwTGcvM3U4MnhKOEVGNEI1dnUvbVJ4R1FBYVJhM09EUG5lZ0ty?=
 =?utf-8?Q?OTqVW4W/5BeTQsPI+BPKBz9brwzQiBOt2ksndoZ55PISa?=
X-MS-Exchange-AntiSpam-MessageData-1: d3WpeE2/DEUN/g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbbc14e-c2e8-43a1-2dee-08df0d8f36bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:54:46.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p1kREomCfNJRkbs7QWbbg5NqMxTez1DLMErBalAB3FCl7LwQxv/BuJEMgBU1R57Z51VsOIp7Tv1Qp7Wf46Ulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211

From: Joel Fernandes <joelagnelf@nvidia.com>

The C maple_tree struct contains a *mut c_void, which prevents Rust from
auto-deriving Send/Sync. Following is an example error message when using
MapleTree in nova-core's Vmm.

This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
causing NovaCore to fail the Send bound required by pci::Driver:

  error[E0277]: `*mut c_void` cannot be sent between threads safely
      --> drivers/gpu/nova-core/driver.rs:77:22
       |
  77   | impl pci::Driver for NovaCore {
       |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
       |
       = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
  note: required because it appears within the type `kernel::bindings::maple_tree`
  note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
  note: required because it appears within the type `MapleTree<()>`
  note: required because it appears within the type `MapleTreeAlloc<()>`
       = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
  note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
  note: required because it appears within the type `Vmm`
  note: required because it appears within the type `BarUser`
  note: required because it appears within the type `Gpu`
  note: required because it appears within the type `NovaCore`
  note: required by a bound in `kernel::pci::Driver`
      --> rust/kernel/pci.rs:294:19

Implement Send and Sync for MapleTree. The tree contains no thread-local
state, and all shared access goes through the internal ma_lock spinlock.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Boqun Feng <boqun@kernel.org>
[ecourtney: also require T: Sync for the Sync impl]
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
This is a repost of Joel's v3 [1]. The upcoming nova-core memory
management changes depend on it.

Compared to v3, I've added Boqun's Reviewed-by from the v2 thread [2],
which v3 didn't pick up.

This is based on drm-rust-next.

[1] https://lore.kernel.org/all/20260511143604.3848176-1-joelagnelf@nvidia.com/
[2] https://lore.kernel.org/all/aftiZGt3HQe0Bf_x@tardis.local/
[3] https://lore.kernel.org/all/CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com/
---
Changes in v2:
- Also require `T: Sync` for the `Sync` impl, so that shared borrows of
  entries (e.g. future RCU readers) are sound [3]. (Alice)
- Kept Reviewed-by tags since e.g. Boqun also suggested the same `Sync`
  change [4] and Gary was asking around the same kind of thing [5]
- Link to v1: https://patch.msgid.link/20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com

[4] https://lore.kernel.org/all/aepRx2jgIKmoRp-r@tardis.local/
[5] https://lore.kernel.org/all/DHYYDQWP4FZ7.3MK090FH4HWID@garyguo.net/
---
 rust/kernel/maple_tree.rs | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index 265d6396a78a..7abe41228cb7 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -16,7 +16,11 @@
     alloc::Flags,
     error::to_result,
     prelude::*,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        NotThreadSafe,
+        Opaque, //
+    },
 };
 
 /// A maple tree optimized for storing non-overlapping ranges.
@@ -240,7 +244,10 @@ pub fn lock(&self) -> MapleGuard<'_, T> {
         unsafe { bindings::spin_lock(self.ma_lock()) };
 
         // INVARIANT: We just took the spinlock.
-        MapleGuard(self)
+        MapleGuard {
+            tree: self,
+            _not_send: NotThreadSafe,
+        }
     }
 
     #[inline]
@@ -302,19 +309,30 @@ fn drop(mut self: Pin<&mut Self>) {
     }
 }
 
+// SAFETY: `MapleTree<T>` is `Send` if `T` is `Send` because `MapleTree` owns its elements.
+unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
+
+// SAFETY: `&MapleTree<T>` allows inserting and erasing entries from any thread, so `T: Send` is
+// required, and shared borrows of entries require `T: Sync`.
+unsafe impl<T: ForeignOwnable + Send + Sync> Sync for MapleTree<T> {}
+
 /// A reference to a [`MapleTree`] that owns the inner lock.
 ///
 /// # Invariants
 ///
 /// This guard owns the inner spinlock.
 #[must_use = "if unused, the lock will be immediately unlocked"]
-pub struct MapleGuard<'tree, T: ForeignOwnable>(&'tree MapleTree<T>);
+pub struct MapleGuard<'tree, T: ForeignOwnable> {
+    tree: &'tree MapleTree<T>,
+    // A held spinlock must be released on the same CPU that acquired it.
+    _not_send: NotThreadSafe,
+}
 
 impl<'tree, T: ForeignOwnable> Drop for MapleGuard<'tree, T> {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants, we hold this spinlock.
-        unsafe { bindings::spin_unlock(self.0.ma_lock()) };
+        unsafe { bindings::spin_unlock(self.tree.ma_lock()) };
     }
 }
 
@@ -323,7 +341,7 @@ impl<'tree, T: ForeignOwnable> MapleGuard<'tree, T> {
     pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
         // SAFETY: The `MaState` borrows this `MapleGuard`, so it can also borrow the `MapleGuard`s
         // read/write permissions to the maple tree.
-        unsafe { MaState::new_raw(self.0, first, end) }
+        unsafe { MaState::new_raw(self.tree, first, end) }
     }
 
     /// Load the value at the given index.
@@ -375,7 +393,7 @@ pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
     #[inline]
     pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         // SAFETY: `self.tree` contains a valid maple tree.
-        let ret = unsafe { bindings::mtree_load(self.0.tree.get(), index) };
+        let ret = unsafe { bindings::mtree_load(self.tree.tree.get(), index) };
         if ret.is_null() {
             return None;
         }

---
base-commit: e6a2c988ed96a5a3af51ed97ecba980521bf2fc0
change-id: 20260907-maple-tree-send-sync-a1479d1ab302

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

