Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3392DBF75
	for <nova-gpu@lists.linux.dev>; Fri, 11 Sep 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136093; cv=fail; b=YUA7o4JoYIxoQjHYVsTxuag+k8mx/CV1aVHGATdL0PN0uUUoociqHW+OTSDaOt68vbdA8p8CHvm9uFZrZxk6ZZRP6foiYjAP/0HB2Nk0hiQ2Yw+TTWhbVZawl5SU8v/iSY28v8oqs0k2Kk46IAvUcol0ifgGUdZke/OW1oDsB2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136093; c=relaxed/simple;
	bh=4zbbhBryx+GE2fLbwoRcY82hemh8cQWrAq0A8NOb7sk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MudPI9SnbrYGw8L7PLWWgG3K/MTUoXPxX9Zgspaf9YPxPDZnjyopKBTC1ACF4GisH0m3gICsSxFsOK9FSTlw6skVK9Ddf6Y7caoMh2EfceALhHBo8XIb9HYRfFVbtrKZludppqiVBKHGr+ubOuvVcnMM2kussgjU0ta82KwhEys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dNoBREII; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dNoBREII"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB9o9mu2AUxJvO1obTaTNxHttj8sFOaOHtv1EMYgksVtB2RDLeMXrM0n8Ji8wE0Prqdf/AS9OxKqfEoxR8apYb4lskOm7rLSfNWqm3Jg8DC91uVuzmxJpphMkBKXvd0lH8JXxxz66SzFEaC2xsEkhd07bB1nbgBJVfqOc/Leq2snislAiGAMj0pYJ6v8D6Sllt9nGiGn36OYVdHHPrdD5EZ6ZMcrZqH6Ey7D5dcXcjdImrPa2cnAVYvvDjko2bynceKr3NQJxEzfhbYpFgtzIETZ/nwlcZmo7I41sPuNj708Cg0a2USWYnmbCp03tXTzAj4BBg928MZypR2Wjx5sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWuDRGMnnrYMJ++me90Ap0voaSsbmm0x2HuXFSf6hss=;
 b=KthkOXo+E2ZYEcCCaVbdOijkiGSXklC+OttvcH/Tj+9q/bHNp0cqeSP2b4PUNIzg99nx9vjqHByEn/upCtd98oIdIDFMn6DbwiAYZeRZwzaRKPNAjYe46j47XcmbzjoHwiQV+Qt/mvHLLYuz5GhCF/GvVCM+N/az05ntjqtqrL6ujmIJRD91Y6iS/1WzVspR5BbkciH6RFk/a2R4t/a1m7Nrh3UkDDj225GcBLbKQ3RQSUbsR1vHCTMCtBKMymcGmOv3VyiJKSgU40XS4trgWjPC/XcWfKPbliaxyqGWoNblF1ZKP9CJQ+y3fIzqBr4cVDR7PQoAAMRkniWObN3cJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWuDRGMnnrYMJ++me90Ap0voaSsbmm0x2HuXFSf6hss=;
 b=dNoBREIIvF9LmWfaBTH5+wIWGZxAfQ1PPYFxPpNuMn5dUhvRo/4xx9A+UEjXqNZOooGPeKDsC3Gdc3jHWB5m9upKvPO5CBmYr/XNiTYqakZwE5brq6+r2FfvIBqsJpB7Ie1VEk2z0WMYShUMKz7u649kWKgbRoAh1rhjssUmwp2uNnmBXhRnRATCLsdDZPPInn/djVgMu3ho68fxQVlnU2bodPDwtc/Df2vS7wM5jmrRhrqSmJiGlIQQ4A6J6CVhK4I8DG9zEmHXNRh+rzzVjQRKJno78OKk164dDlumGb99oL7NOZksaAbGlnxcz5G5kXeyFUWKDmHMNJBa3+uCHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:14:47 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:14:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 23:14:44 +0900
Message-Id: <DLCJT6N5P15Z.3A81XS0F2BMAT@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 <maple-tree@lists.infradead.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Boqun
 Feng" <boqun@kernel.org>
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for
 MapleTree
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Alice Ryhl" <aliceryhl@google.com>, "Andrew
 Ballance" <andrewjballance@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
In-Reply-To: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf63eda-6305-4dfe-3e5f-08df100f0908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|10070799003|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U15Xp+T8sxG3+Ziekt9A1y+jMQyICXMaHM2d7IBbH/Wa2gfCMgZYDRLBoe5D2pFY2xClKLqiOjazapOr/jwY4t4Gi8/qzuHFZ5WXyoChJgnb+lPDlVvujkXIzHU6d5YzVRbSuIQf5wgo6h9GEctWJKxai2Q4NiG9JsC6yCsh17Z7xV9nDfjJPvhoFvplT1LeTqanzc9YpPsrbIKe7PEFIF0ly+8QZN2K4vkIq2HQ9HXTo+AaZO6KNitTJdNF684ROybR4IQsL1ZbFk3T3JKiRl6P4tLnM8UibZFkPw/h5nosOeNFloTtsgd57OVHpxczIRFRCy2n5jv4pnF5J+QW79rRk5YUlhvKoKFPiubdx2wzMuKRKoS4U/JzAx2hrJNt/uAu4tm99/YT/WbA1ldmS76d8MISrNztwOjsJUSFWRQ0l5X/cgRR2rYiiT4Ez2pZO6SuN8eYlTWR6pK4BeMezSkibRdHzw0kYuliCUcMCrSFLqeVVwaCXy2FJWAVk6LuwBFLDqSpHhjrYB1YA06IcDvDlCv5+DH6/FEJGf5q6Rji3oMwbBuphIsV4pg4nmuQR8LX1meNpB0WggYk0NxImEsUT8uCt/oRNatkyZIKF9WmkvjHEJCH9lf0TvypZePF0g9/ayw0aXQrdujX57SdjYTGUMlfCTUbc73D0aEnT2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(10070799003)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q085UzNNc3V6QjZSYVU4eWVqZHVoL0hGRzE4YW14Wmp4ejdOVGpyMllIblM3?=
 =?utf-8?B?L1FidUhBd3dMYU5MUUNVSE9jYldqL05PQms0aGdhSVlKT1MrTlQ5MjZIWEYx?=
 =?utf-8?B?SGN3b1oyZDBaWVkwU0lualMvMG5wMmlPbVI1YzJNWXkyRUY1Y1dMamY1NU9o?=
 =?utf-8?B?OW11OUJHRENmc0hTRmljdjNtVmZ0NjdlblRVbG5WT2Q2V2NrQ1Zza2toYU9j?=
 =?utf-8?B?ckJJd3NkWFlUNWJ3U3ZydmtuQUNjTldEeExvcmdYTlBPdkRUSUdTcmdSc2hw?=
 =?utf-8?B?R0Q0NGNRK2VDdlAvOEdDTkdxOFBFd3dGM2lSZHN0R2dtK2o4b1QzT0l5NzNv?=
 =?utf-8?B?NjE3dmh6bGIzb3VjenFCeDV4Y0lqdFI2d1RRUSt4Vm1lTDRtVGdVNWRoVm9Y?=
 =?utf-8?B?OHUvRGVUcjBvcWMvUVpHVG5NTWN2N2JqeFh3dGl3QzUzZ1E5dnZWU1cvR2Mv?=
 =?utf-8?B?aXVUZiszbDBtMDg3bGFZSlNvcDRKU2gwVE9nWjN6ZGlZQmtUUW1IM21maThX?=
 =?utf-8?B?eXVRdVhwck8rZ0cxaXRoTTk0OWxjYVVLWkhtUFhjTnhDdWlUM0NKdTROLzhK?=
 =?utf-8?B?ZTMzMThxNjA2d2hhRFdSZGsyVHZBZlB4U2VVWWgwTXRHSnJtSzQxalRLVldG?=
 =?utf-8?B?UmtGb0JUNENkV3dUUDFHV3JEYXpINnp4SzVPVFcyNnN1bmJINUlwWUJNMFI3?=
 =?utf-8?B?dnRxRW9QUWxMYnRQR2Zzb0oxUVdxb0NWc3ltMWJtdC9VSXpNVEVmblBvUFF2?=
 =?utf-8?B?SzVmdWNGRnpxcjdRdUhpZnhKaEp3LysvWFBoSk8rWkpKajU0bmdjcElmRDdy?=
 =?utf-8?B?YjN0L09UMVk3TXB0MXJiekVTN1dLMzdiWVpPbUdrM3MvYXRZcWREZTJCR0VX?=
 =?utf-8?B?ek9JOTdKd0MvMzBlRDgzdTUyM2lSb25hYW1tY1hUb2c0NVBxQXFFcEdPTWZY?=
 =?utf-8?B?NEdrejU5cENNSDhuSVhsUFJMcUQ0NkdhaEZLWnZCSTU3cGtiM2JZVjJnRkQr?=
 =?utf-8?B?aElEQWM0amNwVmZRbVFBaXVIY2dHZnlsOERiZW1WcitDTGRHbUdndEJvVGVV?=
 =?utf-8?B?S0UvRkV6VjJyL3laclFZUVZrRjdYTFo4VTEzTDdZZ2JScno5S3RkK1dxYk05?=
 =?utf-8?B?bjZxWW5ZMkxPa3FPTEFDUGYvQ2RuNzNrVEJUQjI5M2JFb2cvblNUTXc3M3Vu?=
 =?utf-8?B?d0hPWTRMN0NrT1VTOGxrMDBhM09iQlRiSWxMRjBYQVdNVUxYRWdEMDVtWmhR?=
 =?utf-8?B?SG1lZWpkd1VISFN5Zk4xMHNBVUJ6YkhFR2RES2ptQmdhWWRYUFlVVWgxZzNS?=
 =?utf-8?B?K2xxUnNGdXFad2VKS0xMOUdaWktWcDJTb0pHcHcxUmhIUVljbENpbmJ1VXRL?=
 =?utf-8?B?MFZNSnpjVHAycXBRWjYzWlNRc1c1VVFvd1BjRk5kWVNKZHcyekRzcWo2alYx?=
 =?utf-8?B?OGNhVHloYzhHYWxKbldMZ3ZUcXBPZkxQWVZuTEZHcm9TbmFhQTQ1aGU2V08r?=
 =?utf-8?B?UEVWcDduK25SVWNIeUdWS2NOd095TDRHS2Vibk9ocDRGQjdabC9FanFxM3Zz?=
 =?utf-8?B?SmcvcDlmbkxPSzh1MndQQUhVUGwwblM5bUhvNC83d3VsVmVYeHpUMVl5UStk?=
 =?utf-8?B?TmIvMUEwKzFwVzZYZnVBaFdCQkd3d1NHMmxvWExQMXhqNjRpbzg3RjlUUUtm?=
 =?utf-8?B?ZnVXdmtqQ1p5TE5wMmNkRkVzZEVZRjl2cFB1NTJ1RURYTDk3eWd0Q09pN1FL?=
 =?utf-8?B?RnNzaXJ1aENVZU1NSWNRbHp0NHNKWTR3R3VxODhYRHlmdUZNbm1iWHM0RW9x?=
 =?utf-8?B?WUZsN1VYbnZxekgyOVp6ZXNoZWNWYVRlVzRmRXZpQ01EcFJCMGR3TDhURVZG?=
 =?utf-8?B?UU9IaE5tTEQ1Z1NRQ3NaU1ZyOGovVnluanlleFJsYlVGanMwdkFsclk1YjZ0?=
 =?utf-8?B?aDdyUHVUQnY4dE4xbmhEUkUzWTk5VTZCOGNYTHp5eDBhTzZSYXBZZVFVSE1r?=
 =?utf-8?B?WFhnVExEamIySHpWcFBwcmRHUCtCWnRjcnZ1WmxIU3RHZGRtSVhtMFNrNUJL?=
 =?utf-8?B?YkFkZ3gxUFQrM2VPbFY0WWI0Q0pOSVY4RTdDK2NSSlZqczlTS2V6ZWVnL2Jq?=
 =?utf-8?B?WHNuRXE4SWlad2c5dFJXRDl5NXltOHBiWG9sbFBKS3l2ZEJlajNEb0JiczdM?=
 =?utf-8?B?Mkw0SEhkYzBXa0xLSzBub1FiaSs1ZHZNVEx3TkN3eU5SUkRFazAzMzJsdEs3?=
 =?utf-8?B?eGNhV2s0Q3I5LzJMQ3NIcU1VWGRjRVp4bEs0dHZ4VXY4U0Fub0dHbGhURnJl?=
 =?utf-8?B?ZVZyRWVLQXMvUUU4VVIrd0VjUmFvYmIyQlJEQUtDdDJSQ1RJVGJDMndEV1NC?=
 =?utf-8?Q?kXCYz9bOveRtEnYammIRGZSpQPKnCqYhMLpNRdrGsa4Q3?=
X-MS-Exchange-AntiSpam-MessageData-1: LekzluQ1bXrB0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf63eda-6305-4dfe-3e5f-08df100f0908
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:14:47.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T10HP9Rp17SJ/TIEZdnUnbOK63sBWIgK0hcLBtxEbvu1SXtK65XbgLJnMu/FgSbPHOsA2eK2GTpmdnRUCUVLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099

On Tue Sep 8, 2026 at 6:54 PM JST, Eliot Courtney wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> The C maple_tree struct contains a *mut c_void, which prevents Rust from
> auto-deriving Send/Sync. Following is an example error message when using
> MapleTree in nova-core's Vmm.
>
> This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaC=
ore,
> causing NovaCore to fail the Send bound required by pci::Driver:
>
>   error[E0277]: `*mut c_void` cannot be sent between threads safely
>       --> drivers/gpu/nova-core/driver.rs:77:22
>        |
>   77   | impl pci::Driver for NovaCore {
>        |                      ^^^^^^^^ `*mut c_void` cannot be sent betwe=
en threads safely
>        |
>        =3D help: within `MapleTreeAlloc<()>`, the trait `Send` is not imp=
lemented for `*mut c_void`
>   note: required because it appears within the type `kernel::bindings::ma=
ple_tree`
>   note: required because it appears within the type `Opaque<kernel::bindi=
ngs::maple_tree>`
>   note: required because it appears within the type `MapleTree<()>`
>   note: required because it appears within the type `MapleTreeAlloc<()>`
>        =3D note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to imple=
ment `Send`
>   note: required because it appears within the type `core::pin::Pin<Box<M=
apleTreeAlloc<()>, Kmalloc>>`
>   note: required because it appears within the type `Vmm`
>   note: required because it appears within the type `BarUser`
>   note: required because it appears within the type `Gpu`
>   note: required because it appears within the type `NovaCore`
>   note: required by a bound in `kernel::pci::Driver`
>       --> rust/kernel/pci.rs:294:19
>
> Implement Send and Sync for MapleTree. The tree contains no thread-local
> state, and all shared access goes through the internal ma_lock spinlock.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> [ecourtney: also require T: Sync for the Sync impl]
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> This is a repost of Joel's v3 [1]. The upcoming nova-core memory
> management changes depend on it.
>
> Compared to v3, I've added Boqun's Reviewed-by from the v2 thread [2],
> which v3 didn't pick up.
>
> This is based on drm-rust-next.
>
> [1] https://lore.kernel.org/all/20260511143604.3848176-1-joelagnelf@nvidi=
a.com/
> [2] https://lore.kernel.org/all/aftiZGt3HQe0Bf_x@tardis.local/
> [3] https://lore.kernel.org/all/CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tn=
p28V0JDmYg@mail.gmail.com/
> ---

Applied to drm-rust-next, thanks!

[1/1] rust: maple_tree: implement Send and Sync for MapleTree
[ecourtney: also require T: Sync for the Sync impl]
      commit: 9cf1bc8bbc71a6b727ed6def13f125b07cf35210

