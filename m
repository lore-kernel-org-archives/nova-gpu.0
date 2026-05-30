Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC4346781
	for <nova-gpu@lists.linux.dev>; Sat, 30 May 2026 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111331; cv=fail; b=eHVyU8ymYIF1im8MSXF4KqXRQWqO9ZLTUXV9VKwsFaD2ghpkQWBFtYgWooUDFrHjS7n2X+VIHgFg6rg67cfwVq4qXLhXB53mmstAxwrV5ukMo2sUZz5AA5GHzP59EdHnsAf6PSiJ7DqRQOym2rrnOk3nv8PzLXounLPehnVH0Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111331; c=relaxed/simple;
	bh=wKA85ft4rHRn7W10+PLJmLwZ5bdmVBjuRsPoLASW36M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nzKZlnxgG3MpdwaeNdDIjYTDD13bhDqt0Of6n0V86R+HkFHXDuIoI2vGO3G71g65QkFu2vNqJMgsPE1VV4J75tmn9BVIWPZkAyIbGVRJv/n3rCvqBfEFMQGrVv3qHEBoTNeKEsb0+cYeqT3I/osbaIAY3KldHyxLK5JY4nkoRFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mJAtADRg; arc=fail smtp.client-ip=52.101.52.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mJAtADRg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCBsMk28zXjNOcQzqQcDeYD9Mp1kc3NIICUuvjC/zfL33lbOgrpd2GRHXxvsMHH1rNnPkg5VaL5OmMAvDpn+0qrahcnA2LeNcQ5tNyaKGXyNg56dkP7ShK2SmCMeRcqDqRaETjG4hww690lgZmRX4DCzoH3MSuXDyCX1ENk+SZjicgH5pP+jqj7FPXFsT5bODaoMHHOKhDIVkTqB+5niZrsjY8/Mnsnen/ZTFVZRuM+PZWWefeWpO2YhiR0zDergtCGzwG5O6oA+7B7AAiD/Kjd7MgDTDRoG++4d5B5O4eRRSjVHK7tqVvrPU4jo2tFN5Bnb2wNHYPp/3VVi0tfUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKNylq9O22kzQAxajTLTS6cJXdA9vsyU6WWsNEphm9E=;
 b=w2xaLLYc0fdtXbvpWKceGUeUOQ1bM0bu9FMH4S61e1gjMV9MtN3hgfqYn4Qve/GRNWeLGsy0Ph/GUH95dO+Cx/q3QAP08Xf9MLH9h9LR0frQ8MCA6fW76cldqY8UoFUmRVxShsfutaGahyxckEDyPmtxA9/45LaZhhhX+67fPilnEz5592wP+0tfMTG0fq4SBF78EerOG7QBTV2zdA7akxNmYxQIr9k8BKrCuJZ7OcLbPNd0I/y+jc6C73ZiDPM29oVYIotCGtzrTRBviZDR0qGXWYYNyOftXxsPRe9swmsJs27HpuZACFKhepjwt9xqhmicHHQAgSEfKRHs/1AnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKNylq9O22kzQAxajTLTS6cJXdA9vsyU6WWsNEphm9E=;
 b=mJAtADRgjEYbxX8xhrfPYIHYNQ9G0FfyadCu2QFoT3Y1UrLw8L8kCpUfbd2YSx1r1TCzWs+Tqh+x3izJnM5B2qdr28qJpYeSP75ySj9fwV0Fjp1x/77BxMTQ7LvlZQDFuFnp4bz/hwp2FfQL+AfyH823s4EOQ0H6oX9v/kgw1yy6eQuesyOh1tuG8ZTyi1D7qiqRuF3DUFh03iDCu4jtsbLI6usT8TP3tgEIFb8NcYR+q6qvl3AmKL8amg761Hxl6f0bQh8uDVmayeov5v7/l54nasGQaPZkx1grQMCzp8BDbkuWrSvPhGf3M0yq3j70LfkMCtzIDLTPjwvJ9QCfaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Sat, 30 May 2026 03:21:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:21:57 +0000
Message-ID: <10465f38-fded-4600-9b95-ea1097698e69@nvidia.com>
Date: Fri, 29 May 2026 20:21:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/22] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, nova-gpu@lists.linux.dev
References: <20260530030953.740561-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5ad4c2-dc8c-4c9d-4e62-08debdfa9b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|56012099006|22082099003|18002099003|11063799006|6133799003|3023799007|5023799004;
X-Microsoft-Antispam-Message-Info:
	oyTUej5wWWmn5jje0Ib6ndcqbWVX8VNhHwKKcCG9H+oJmk1msFJV5lTrvdn/t+6bcKURCWHwjYmZC+6TdFpMGb5EJApeTp+fHCBxbOow/79VhENrobouzE1JkPw2BD5ZqnHF5jWyPojXLC5qvwCR7ShFQZx/rBF9t6tRStjDCjGTqxVM4VDKbj9N+S2ulexcY+myllg/8abr5/i6GDazpqktgRTGyq111Fw0eUH+o+32WX1+qvttR7Z3zC4EoR8nogdHRB2sWHnAio/TrwQOpEZHJzB/xwEb/nSw4DsO1yRUbwN9IFV2zTV+3yHlHqYghsYfgrRK/ClIrQ7EOEsMBJs4l9FahLyvfRZ4wxmkmV3dVR4eAAe84OX5nax6aAzRjy1vemRFWfGJ+YlXSalqO3uAU9Pq9gw3aqd//xYRpVVLlSqKRK260o5ZDH8UIRYIPNLG3pRQ8DUZRAYI/codAQdlxGR66uOW4fLKHh1OhTZHA8ENbc3YoYYXq5E+XTv0qyjwuclpnvmHDG9enXHoaYjIYCZBxy4bbyST79c8qRn4NueyDhtk9gUFzSVHGvmPG+n+adwztQS/4WWqDUUC75aLEJQoCE4OopnKoaM3/ALuufL+H+kOPJUaYJhPtAbk6V/oja9ol/ZckXluon1/pemrX8/NBWvCuNSyid+xdnrUVVVVjPaRCNsOjZTGZIkFkGLZNwmI4p2Y1oGLdod72A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(56012099006)(22082099003)(18002099003)(11063799006)(6133799003)(3023799007)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WldIaFF2cDFmRXhiTjVqWnhkKzFoRTcvMW5QYW1kMlRtMk9MQ0NxbU9VdHVt?=
 =?utf-8?B?Z2ljeFRTZXMrQkdLTEw2SkFTNHpoV3hMU2xSUTJUbUk5UWFSWm5EVFNXbDJr?=
 =?utf-8?B?c1BnbnZXaUJveWVWZEJZSzBWQ2Y1eDJSUjc2RWVnUzhhd2l0b0hiTFY4Njhw?=
 =?utf-8?B?N0NWRGdPVWxEcTlvSVNxSlBZTUI0ZENvdThaUmN6YUUycWw2c2Fya3lpait3?=
 =?utf-8?B?bytHZmZ4ZEdlZ1B3RDMyUjZLdldaR094b1pRSlRMOUs2KzF2Z3BKUnJhajFs?=
 =?utf-8?B?LzhjNlQzdFEzQXJVMnNCN0U5bUJqWWNHc1A3RmhBdGJHc25RYk1oaFRZK21G?=
 =?utf-8?B?VkxhK0h2M2lWc3gyRS8zYmN0WGI3dWtTMkFuek5YZEx0YWozcmlDR0M1K2ho?=
 =?utf-8?B?WHZtNzZuN2VXejJqbUcwTUoxek5KbFYwMWdidWxRdTRNaVJQMXFkREJpZUdT?=
 =?utf-8?B?NHNPR01jVkt4T1Y4ajNyL3VBaWw5dDRJd20zTEZ2U0xrM1ROOG4valJWN0xu?=
 =?utf-8?B?N2JFRjBZeHJuekY3YlozUHE1ZHVzaEY5VU9Nc1hEa0lCOG5NT0ZONm5RcDZz?=
 =?utf-8?B?U21sQWJKSEtLcXptZDkvL252U0UwUUN0ZUVEWjlnb1BpSEdFVmwwb1VRMWtt?=
 =?utf-8?B?V0o2V2Rmci9pREZJZnpvSXg2d1Z6U1BJOUFoVXlWN2RCWmV5ZW9CcWg3RHdh?=
 =?utf-8?B?Q2ExTDI3KzdDYnFRaEwyZi9YNU1nVGp1KzF5eG54enpRRmlUVUY2L2RqYTUy?=
 =?utf-8?B?alY2TFlCZTkzUUttMndXZ2tadzdCa2R5aVpxOFNmRGkvNW9lYlY1Yy80TEZE?=
 =?utf-8?B?c0ROUytlaUljRHBlTmlDL3hlUGJtMkgvRCtCWVFkRHlnRmFTSXZMWmxsZGpo?=
 =?utf-8?B?dmJlYVpvY0VJdENFMW15NW1NbExpQzRuVGRON2lzMEhzb0xYRE9sSVVyR0VI?=
 =?utf-8?B?QVBpQWhDb1BzZThpaTZNNG9sSWloZHowQllXdHRBeGVGci9lcDV3RWdUZmw0?=
 =?utf-8?B?elJNTVpWRUFVQkRtTGFnRm9vdnVwRUM4RW1WN3BodzdFcHZPazM4VE9BbEFo?=
 =?utf-8?B?aGZtVncrcUk4Yy83VDNITXd3YUlWQzJVSkQ5bW5xNy9Td0M0Z1pva1RveUhU?=
 =?utf-8?B?LzR5dm4veUNXNzUwRmJNWk91VVVFY0RoYWcrN1RQQUlsZER3SkN0YkJaMXpR?=
 =?utf-8?B?ekExb05UbXhhWFhoZExsWXcvVVhOc1VncGEzN25QSEhOaFBVWHl6OVBkWXNE?=
 =?utf-8?B?dWNPTi9kQlBPU0IwSnhxQy9wVnQzeDd0b1VnWW5EcUx1TjAwMVdZbk5TWi81?=
 =?utf-8?B?MnpkYmdJSDFEL3g0bHgraStKWjRYY2Uvb2x3Qm90U0VTZGwwV1F0QllZa0JZ?=
 =?utf-8?B?M0ZCVGZpOUYwZUJCalk5d1Z4SEFvY09TTmZhcVhLWXJlcjVBNmdGTXlEeDRC?=
 =?utf-8?B?MVJyVGxrUkpHUkptMm1MNlFjbWNZOTVlMWxUbEswYkdIbHR4YjI5b3J0dkps?=
 =?utf-8?B?TGp5ZUNFTDNobVd1bDgrSndZVlFkaVVnWnNOUVIvdyt3anI4YS96RERvTlNZ?=
 =?utf-8?B?b0tQamowOXJxQ0RkY0k1Ty9kTUhtRmp3a3NJWHo3VGZGOGRMVUR1Ym11dFEy?=
 =?utf-8?B?ejAxS3RSMjE1dmhxSFJEbDNMZndIYmVBN3RrenRQNU1YTDBGRDlMU1BEd2NR?=
 =?utf-8?B?TVZLK2h0bkxuSHNnZ0tTWXZaZmpjWUU4RmRGNGhjTWdLRjZqUm1FOUIvclY5?=
 =?utf-8?B?QXZLY2o5WVJCRm1FamF1Z1hGWDZNbi81cEFkbnhuVWJLVGI0SmR0QVlYOWJC?=
 =?utf-8?B?VFpPRklDaTZLcGtRQ3g4R3ZrUDNIWTJqc01vQjBmT2ZPbXFGVmw1dVI0VTFp?=
 =?utf-8?B?TWFEREdvc2F6N3VFam1pN0cxMm5tbk1Bb1lLeURhTGFQbDE0Vm9WNS9UdWln?=
 =?utf-8?B?QmdzMkdQVldPbHpYU1NKUnRKS2szaDJ3UG5wWCtpWStjTjNac1NGU1E2YmE2?=
 =?utf-8?B?R3FlTnFvd0JjRnZRRDRzaWZ5aWFKeWUzUmFITHhvNndvWG94T1V0aFY2YUk2?=
 =?utf-8?B?QU5KMTVaODBLQzh2QWw1RGw2YnEwMEhSb1N2QTBYS1pIdU1TVUNhay9Tb1Jj?=
 =?utf-8?B?d09nRThtS0xLMmptVWhEcTQvc3dRbFNoUjFjMktaMlU3YkZRZktGeERScWF4?=
 =?utf-8?B?SUJLanpzSnlPNlVyNm1KQ2JQM2dyUHZUcjU1NjdzSTdrSkVJbWVKVEZXSFdl?=
 =?utf-8?B?S3pTYWZ6N0VWcjg0aUtydktPMWxWTGQxc3ZyaVhwM21DQ0NmUFgxLzVydWZt?=
 =?utf-8?B?S3BLckVJcXdKYm9rRC9aT0VnRFRlTUFIdXY2SzFiS1UwbGVxbWFTUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5ad4c2-dc8c-4c9d-4e62-08debdfa9b2b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:21:57.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIWlZyqhv5DQmgLpOVH998AEE7qCn38IWCHtbRg820AfEupgk+rVAO6lkkPu85GUP2hxQKLA9MM0QR5Gc1LncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484

Shoot, I seem to have used the older, now-wrong script to send this, because
I've only Cc'd rust-for-linux, and left out our nice new nova-gpu@lists.linux.dev
mailing list. 

I'll +Cc nova-gpu@lists.linux.dev just on this cover letter, for now. I hope
this didn't mess up anyone's inbox too badly. 

thanks,
John Hubbard

On 5/29/26 8:09 PM, John Hubbard wrote:
> Changes in v11:
> 
> * Made the FSP messaging path sound. The FSP falcon's EMEM window is a
>   stateful register pair (program an offset, then touch the data
>   register), so modeling it as a stateless I/O region let aliasing
>   accesses corrupt each other's offset with no unsafe at the call site.
>   The EMEM accessors and the send/receive helpers now take &mut self, so
>   the falcon handle is the exclusive token for an in-flight exchange,
>   and the unsafe Io/IoCapable impls and their unreachable! bounds checks
>   are gone. The accessors now program the EMEM offset once and stream
>   through the data register using the falcon's auto-increment, matching
>   Open RM, instead of re-programming the offset for every word.
> 
> * Rebased onto a current drm-rust-next that already carries the v10
>   preparatory patches, which are dropped from the series.
> 
> * Top of the series: the v10 boot-integration patch is replaced by "gsp:
>   enable FSP boot path" (Alexandre Courbot) and "add non-sec2 unload
>   path" (Eliot Courtney). The Hopper/Blackwell boot path now lives in
>   the GSP HAL (gsp/hal/gh100.rs) and returns a BootUnloadGuard.
> 
> * Reordered per review: hardware-differences patches first (DMA mask,
>   PCI config mirror, PMU-reserved framebuffer, non-WPR heap, WPR2 heap,
>   sysmem flush registers), then the FSP/FMC stack, then GSP lockdown
>   release polling.
> 
> * Hardware-difference patches are now HAL methods instead of inline
>   Architecture matches: the PMU-reserved framebuffer size (patch
>   retitled from "calculate reserved FB heap size" to "compute
>   PMU-reserved framebuffer size"), the non-WPR heap size (now u32 with a
>   1 MiB default instead of Option<u32>, per v10 review, with the GB10x
>   value in the GB100 HAL and the larger GB20x value in the GB202 HAL),
>   and the PCI config mirror range. The larger WPR2 heap pulls its base
>   size from the generated bindings, drops the custom constants that have
>   no Open RM counterpart, and matches all architectures exhaustively.
> 
> * FSP firmware handling moved into firmware/fsp.rs: FspFirmware now
>   holds parsed signatures (KBox<FmcSignatures>) instead of a raw ELF
>   copy, extracted through a get_section closure (per v10 review).
> 
> * FSP secure-boot polling uses a per-chipset FSP HAL
>   (fsp/hal/{gh100,gb202}.rs) reading the correct NV_THERM_I2CS register,
>   instead of a free function in regs.rs.
> 
> * FSP Chain of Trust boot was redone around a new FmcBootArgs type, and
>   the response headers are strongly typed (MctpHeader/NvdmHeader instead
>   of bare u32), with the vendor ID from kernel::pci::Vendor.
> 
> * GB10x/GB20x sysmem flush: the HSHUB0/FBHUB0 register details moved
>   from module doccomments onto the write_sysmem_flush_page_* methods.
> 
> * Commit message cleanups: dropped stale claims, shortened an
>   over-length subject, and fixed trailer ordering.
> 
> Changes in v10:
> 
> * Reordered per review (and direct assistance--thanks again) from
>   Alexandre Courbot: the two refactoring patches (factor .fwsignature*
>   selection, use GPU Architecture to simplify HALs) now come first,
>   before GPU identification. The boot_via_fsp stub is introduced early
>   and completed as FSP features arrive. The SEC2 refactoring, PCI config
>   mirror, and reserved heap size patches are moved earlier in the
>   series.
> 
> * Made pmuReservedSize conditional on Blackwell dGPU architectures.
>   Open RM only sets this field for Blackwell (Turing/Ampere/Ada/Hopper
>   all leave it zero). Added calc_pmu_reserved_size() helper and
>   FbLayout.pmu_reserved_size field to route the value through the
>   layout instead of using the constant unconditionally. Replaced
>   `as u32` cast with usize_into_u32 for PMU_RESERVED_SIZE. (Alexandre)
> 
> * Split the GFW boot wait HAL change into two patches: one that moves
>   the existing behavior into a GpuHal trait, and a second that adds the
>   Hopper/Blackwell skip.
> 
> * Removed the Spec::chipset() accessor (no longer needed after
>   restructuring). Updated the Copy/Clone commit message accordingly.
> 
> * Rebased onto drm-rust-next-staging, which includes
>   const_align_up(), "move firmware image parsing code to firmware.rs",
>   "factor out an elf_str() function", and "make WPR heap sizing
>   fallible" from the v9 series. Series is now 28 patches (was 31).
> 
> * Depends on the "rust: sizes: SizeConstants trait" series[N], which
>   adds typed SZ_* constants (u64::SZ_1M, u32::SZ_4K, etc.). The
>   nova-core conversion patch ("use SizeConstants trait for u64 size
>   constants") will be posted separately, but is already included in my
>   git branch. The Blackwell patches that introduce new SZ_* usage
>   (larger non-WPR heap, FSP Chain of Trust boot, larger WPR2 heap) use
>   the trait form from the start.
> 
> * Fixed the PCI config mirror commit message: corrected hex offsets to
>   match the code (older architectures use 0x088000, Hopper/Blackwell
>   use 0x092000).
> 
> * Dropped the never-used nvdm_type_raw() method from the MCTP/NVDM
>   introducing patch.
> 
> * Removed stale Co-developed-by tag from the FSP Chain of Trust boot
>   commit per Alex's request. Rewrote the commit message to remove
>   references to the no-longer-existent fmc_full field.
> 
> * Added missing #[expect(dead_code)] on GspFmcBootParams in the FSP
>   secure boot commit, removed when the struct becomes used in the
>   Chain of Trust boot commit.
> 
> Changes in v9:
> 
> * Rebased onto today's drm-rust-next.
> 
> * Split Architecture::Blackwell into BlackwellGB10x and BlackwellGB20x,
>   after Gary Guo and Sashiko pointed out that GB10x and GB20x are
>   distinct enough to warrant separate architecture variants. This
>   surfaced several bugs where all Blackwell chips were incorrectly
>   treated as a single group:
>   * Fixed the FSP boot completion register address for GB10x. GB10x
>     uses the same address as Hopper (0x000200bc), not the GB20x
>     address (0x00ad00bc).
>   * Made the FSP secure boot timeout architecture-dependent. GB20x
>     now gets 5000ms while Hopper and GB10x keep 4000ms.
>   * Removed chipset-level match arms that were working around the
>     single-variant design in fb/hal.rs, firmware/gsp.rs, and regs.rs.
> 
> * Simplified find_gsp_sigs_section() to return &'static str instead of
>   Option<&'static str>, since the Architecture enum is now exhaustive
>   and every variant has a known signature section name.
> 
> * Moved dma_set_mask_and_coherent from probe() into Gpu::new(), with
>   the unsafe block narrowed to just that call. Gpu::new() now takes
>   pci::Device<device::Core> instead of device::Bound to support this.
> 
> * Dropped the local `chipset` variable in Gpu::new() and accessed
>   spec.chipset() directly, since Spec is now Copy.
> 
> * Changed Spec::chipset() to take self instead of &self, since Spec is
>   Copy.
> 
> * Removed the unnecessary Tu102/Gh100 consts in gpu/hal.rs and used the
>   unit structs directly.
> 
> * Kept a hold on the Firmware object in FspFirmware instead of copying
>   the FMC ELF into a KVec<u8>.
> 
> * Moved the dev_info formatting fix and the GFW_BOOT comment removal
>   out of the Copy/Clone patch and into the patches that actually touch
>   those lines.
> 
> * Added Reviewed-by tags from Gary Guo and Alice Ryhl.
> 
> Changes in v8:
> 
> * Added Clone/Copy derives to Spec and Revision. Removed the
>   unnecessary pin_init_scope wrapping in Gpu::new() that the lack of
>   Copy had forced. Added a Spec::chipset() accessor.
> 
> * Removed implementation-detail sentence from the
>   Architecture::dma_mask() doccomment.
> 
> * Simplified the GPU HAL to two variants (Tu102, Gh100) instead of
>   four. Renamed "Fsp" to "Gh100" to follow the HAL naming convention.
>   Removed the spurious GA100 special case. Moved the GFW_BOOT wait into
>   the HAL method itself instead of returning a bool.
> 
> * Increased the GFW_BOOT wait timeout from 4 seconds to 30 seconds,
>   after Joel found that a different Blackwell SKU required extra time.
> 
> * Removed stray Cc lines from each patch.
> 
> * Fixed rustfmt issues in gsp/fw.rs and gsp/boot.rs reported by the
>   kernel test robot against v7 patches 27 and 31.
> 
> Changes in v7:
> * Rebased onto Alexandre Courbot's rust register!() series in
>   drm-rust-next, including the related generic I/O accessor and
>   IoCapable changes.
> 
> * Rebased onto drm-rust-next (v7.0-rc4 based).
> 
> * Dropped the v6 patches that are already in drm-rust-next: the
>   aux-device fix, the pdev helper macro patch, and the one-item-per-line
>   use cleanup.
> 
> * Reworked the GPU init pieces per review. DMA mask setup now stays in
>   driver probe, with the mask width selected by GPU architecture, and
>   the GFW boot policy now lives in a dedicated GPU HAL.
> 
> * Reworked firmware image parsing per review around a single ElfFormat
>   trait with associated header types. Also added support for both ELF32
>   and ELF64 images, with automatic format detection.
> 
> * Reworked the MCTP/NVDM protocol code to use bitfield! and typed
>   accessors, removing the open-coded bit handling.
> 
> * Reworked the FSP messaging part of the series so that the message
>   structures are introduced in the first patches that use them, instead
>   of as a standalone dead-code-only patch. Also changed fmc_full to use
>   KVec<u8> from the start.
> 
> * Split the WPR heap overflow handling out into a separate prep patch.
>   That patch makes management_overhead() and wpr_heap_size() fallible,
>   uses checked arithmetic, and leaves the larger WPR2 heap patch with
>   only the Hopper and Blackwell sizing changes.
> 
> * Added a code comment documenting the Hopper and Blackwell PCI config
>   mirror base change.
> 
> Changes in v6:
> 
> * Rebased onto drm-rust-next (v7.0-rc1 based).
> 
> * Dropped the first two patches from v5 (aux device fix and pdev
>   macros), which have since been merged independently.
> 
> * const_align_up(): reworked per review from Gary Guo, Miguel Ojeda,
>   and Danilo Krummrich: now returns Option<usize> instead of panicking,
>   takes an Alignment argument instead of a const generic, and no longer
>   needs the inline_const feature addition in scripts/Makefile.build.
> 
> * The rust/sizes and SZ_*_U64 patches from v5 are no longer included.
>   I plan to post those as a separate series that depends on this one.
> 
> Changes in v5:
> 
> * Rebased onto linux.git master.
> 
> * Split MCTP protocol into its own module and file.
> 
> * Many Rust-based improvements: more use of types, especially. Also
>   used Result and Option more.
> 
> * Lots of cleanup of comments and print output and error handling.
> 
> * Added const_align_up() to rust/ and used it in nova-core. This
>   required enabling a Rust feature: inline_const, as recommended by
>   Miguel Ojeda.
> 
> * Refactoring various things, such as Gpu::new() to own Spec creation,
>   and several more such things.
> 
> * Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
>   non-zero sleep intervals (after just realizing that it was a bad
>   choice to have zero in there).
> 
> * Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
>   consistent across patches. Replaced fragile architecture checks with
>   chipset.arch(). Renamed LIBOS_BLACKWELL.
> 
> * Narrowed the scope of some of the #![expect(dead_code)] cases,
>   although that really only matters within the series, not once it is
>   fully applied.
> 
> [1] https://github.com/Gnurou/linux/commits/drm-rust-next-staging/
> [2] https://lore.kernel.org/20260411024118.471294-1-jhubbard@nvidia.com
> 
> Alexandre Courbot (1):
>   gpu: nova-core: gsp: enable FSP boot path
> 
> Eliot Courtney (1):
>   gpu: nova-core: add non-sec2 unload path
> 
> John Hubbard (20):
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
>   gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
>   gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
>   gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
>   gpu: nova-core: Blackwell: use correct sysmem flush registers
>   gpu: nova-core: don't assume 64-bit firmware images
>   gpu: nova-core: add support for 32-bit firmware images
>   gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
>   gpu: nova-core: Hopper/Blackwell: add FMC firmware image
>   gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
>     waiting
>   gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
>   gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>   gpu: nova-core: add MCTP/NVDM protocol types for firmware
>     communication
>   gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
>   gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
>   gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>   gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
> 
>  drivers/gpu/nova-core/driver.rs               |  15 -
>  drivers/gpu/nova-core/falcon.rs               |   1 +
>  drivers/gpu/nova-core/falcon/fsp.rs           | 202 +++++++++++
>  drivers/gpu/nova-core/fb.rs                   |   8 +-
>  drivers/gpu/nova-core/fb/hal.rs               |  28 +-
>  drivers/gpu/nova-core/fb/hal/ga100.rs         |   5 +
>  drivers/gpu/nova-core/fb/hal/ga102.rs         |   7 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs         | 102 ++++++
>  drivers/gpu/nova-core/fb/hal/gb202.rs         |  86 +++++
>  drivers/gpu/nova-core/fb/hal/gh100.rs         |  50 +++
>  drivers/gpu/nova-core/fb/hal/tu102.rs         |   9 +
>  drivers/gpu/nova-core/firmware.rs             | 176 +++++++--
>  drivers/gpu/nova-core/firmware/fsp.rs         | 129 +++++++
>  drivers/gpu/nova-core/firmware/gsp.rs         |   4 +-
>  drivers/gpu/nova-core/fsp.rs                  | 334 ++++++++++++++++++
>  drivers/gpu/nova-core/fsp/hal.rs              |  27 ++
>  drivers/gpu/nova-core/fsp/hal/gb202.rs        |  23 ++
>  drivers/gpu/nova-core/fsp/hal/gh100.rs        |  23 ++
>  drivers/gpu/nova-core/gpu.rs                  |  34 +-
>  drivers/gpu/nova-core/gpu/hal.rs              |  13 +-
>  drivers/gpu/nova-core/gpu/hal/gh100.rs        |  18 +-
>  drivers/gpu/nova-core/gpu/hal/tu102.rs        |  14 +
>  drivers/gpu/nova-core/gsp.rs                  |   1 +
>  drivers/gpu/nova-core/gsp/boot.rs             |   2 +-
>  drivers/gpu/nova-core/gsp/commands.rs         |   8 +-
>  drivers/gpu/nova-core/gsp/fw.rs               |  85 ++++-
>  drivers/gpu/nova-core/gsp/fw/commands.rs      |  15 +-
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  83 +++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs        | 166 ++++++++-
>  drivers/gpu/nova-core/mctp.rs                 | 100 ++++++
>  drivers/gpu/nova-core/nova_core.rs            |   2 +
>  drivers/gpu/nova-core/regs.rs                 | 111 ++++++
>  32 files changed, 1800 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/mctp.rs
> 
> 
> base-commit: 2cfcf9dfb48e932d46c3fa9ae99f1607d1a80162

