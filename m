Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4D4C8C50
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607072; cv=fail; b=n294GWYaMY0IqCrdfqVIICpAKS35TiNNDAM2iyjnw8WP5Jf6HvGBJJ7bGKtGR0SY9cSpYvBNVnlGnZVd5/t53i3+PFOliJliLHnNOlgXhHJQ0OvPz9LuXH/emgUL+7WDs32fKoXl8FBTNNlD0R3xwqpDylKRx7yQG58R5O4blAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607072; c=relaxed/simple;
	bh=BZ/YcxblcBGTk7W2TOMYUlS1lvolbnpFk/luSRJav/k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JNmqvxL3dFlcHDv9S/LFUVH/WeSqpprwWUR4mTDcYVSP5CQkgqCL4i4RaMAVYAHVTttPtVw+GFER6oc6rxQ5/d5mXlc0oVKqnU+IezwIJ/PfQw363+SXzo2Kf4zDu86UsqNLuc+WnIeRAgLG8geoEBxfGvYtFwQkDDqQUntouwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HvNrLaOb; arc=fail smtp.client-ip=52.101.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HvNrLaOb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZVvLRNgzbbM/e4Nj9Scbf1eudbBlMaI++zwQhWWoPpGXmb3V6wq7Ehs3M03jDAUIFpx2HzTnVi8PmJsq8PWk6TG1e1K0vJ3RekCPIjTf12bOfZSg+6llnkd1B6l1BgAJKGFOhsrjQ09Nm3FcJq36adnF/ST5Lh4YhmDAETpdOCGfJs+jkpQ7TYBWhhXEZAYF4tTNxCUz3js611qwQUsY9SUKZNfcCGEIzjNb/FmtD99DIBr4Esnjq0nl7loHuhonM8eFADTeeKrJjB0quSWuHEMkVPANXVuUweXnSdwkBuP/hbLPFN160QflAx9wtSkdB5tH4Lg77QRn1neFx0+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QsxUJnLVu3BidItVXAhknMzIuYMCgVU1Y3SLMLaNzg=;
 b=E6Dpx8CjexXkpijZow8vFs+jSCK/R4PfnupjBC3ByEJ21IRlqCsREnq1HbvqGvErkeEjfdy4muVCXCLW4sKUVvuxNlgs6ESG67s7E1WG+Ii1/doywySuiwP3UO7veU31/zj6ctTUDWfA94GquYxmw9SEb2pBFsxdOfFc93XNSDvw0Oc9y1y1UWiv+Rx6sc12f8/+Dadn1VFB0beXbY757B4wAIFYwW6YJvj7JFhYXCeGU+P8aCugmdt45aGC7PAL1iDRU9lW9zFtG8IK1iLJzdjJ/fscfsizN76GWlhD2/M4sc6JZCQHJjJNxNXahBBvD4CIa+FBHqny6bDIg0iTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QsxUJnLVu3BidItVXAhknMzIuYMCgVU1Y3SLMLaNzg=;
 b=HvNrLaObgpRAukBx9IFoHMGV5CgWAqEI9RKiQFJUsPXzXAbuBUzKtKxyjbV9q2K8ycAH46BROkLgD+Gis5hkIpiMv6W8bFv0GivfhGOTk0BV/ik3ftFyqlisEyW9CdiXJhdzS8Hgf7IUmkQmNzbC/iEkaUFmJO9znMo6IVX5+sIdnSqK+XHJz5zm0QieNMq2yh4EIRAHSThSG50QiupWiBvp/uLnK9w2J3iIUxV8TOphoBTz8+yLC9VIlKR4LvBGBRItnpDtQvqJk8ApB7zNOq3Z35Yt0BuQU439dGCQt4I+dCEIa9r4Wke5CtDKDCI1AzhBGkur4C5Ez1wwNLvRsw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH6PR12MB893224.namprd12.prod.outlook.com (2603:10b6:510:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:51:06 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:51:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 23:51:03 +0900
Message-Id: <DLR188QS41OV.37M9IIQN5128P@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 17/33] gpu: nova-core: add the r000 load-and-execute
 bootloader handler
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-18-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-18-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH6PR12MB893224:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a29253-d762-4a85-ced8-08df1d6fec79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|23010399003|1800799024|366016|4143699003|10067099003|3023799007|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7QzH4XoUB0rga9u0CrYKjIhr8fWS6m41pQxtnC7393C1LhMKaCUEb1NMtxxRd2gBktqA8mIOH83Dm20RJUGHfKtpKWPajKht8rR/ElCNX+MM0tlM/6I86YTTlGNMTnrIUciwSTgh2wKNiB8cPks6sQXOxyI6r6FgFPfACiXMdxhHNTNbH7chfe3uUZJjw5prFmkplssozjyt4jZh9YaPeR3gTi3zcm5yXRmcPxoa1TipSQzZH4Wt9HJhU7h1rNs80wUzLCWeUiEj0dpCMx7s5QJmqQwa7IKo4/ZfXiFwu5bGrscVrn02w+7DDxA5vKWp9Exz5PG/tO6Dn7N3IfeeId2spEgE0e7F5ttBd97aXEhUOjNpi6l8zg6NvJenbjO6k19CtG/K3X/g/OTd/3LfKcIvdbUg5k1kFsmwrn81klOrLyJZ03Ujhf9tvZMmDIhLpYocUGvFt41v0zutRWefIeFkdM1J+IEbrn5I307UZxhRr0AVTn4wH18y2n3YXRqJ6GWVHM10NZZ6ZBwzKOa9/kiRf0Y1CQ+qrdG/beacZvaNfBXUh1sNwdOYNcef/CgLxYdbY7ne2Ul3lTbPRg7p0hzTt7SbFjUBBr74UcBSXGOSokDRoD7Hs0CGlEWuyWI9F7VJY13WXv4PJr8YY5OqFUdj06oENea8MNTn5yfcKpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFdmZVlVaUpMWWpyL0hYYVJoTlJOL3lJMkpsbkRZck1SNTM2Rm44cHg1UDB6?=
 =?utf-8?B?MmJDSE1qZmpDN1NaOGpWbWxLUE0zVEQyRTZibWM3Mzh2OVd0MlRXd1pZSUtF?=
 =?utf-8?B?UzEwdFNJUC9NQnVBSVdNQVdBa3FiMkZySlZKYXJoZjdmWUIvYjlZOU4rZFJH?=
 =?utf-8?B?c3dnRUpFVXE5WkxHc053ZzN3OTBaTTdDOFpSaGN5MFdnYmJ4V3htT2o1QWN0?=
 =?utf-8?B?WHZzbXluOWJNUDRMZThjdjNTYVcrQnFnWEJjNDYvVzZYWUZSMVpSM210T09S?=
 =?utf-8?B?R29sVXY1RVYrODFOQ1pKWU1uSXl3SVl6N3BuREVMR3lKOTBxZjcyZGtacUpZ?=
 =?utf-8?B?MW5VM25LRnJaSC95UWN4dHlMNWFFazlRNE1tRU41OHJBRis1VGZEVEtvTGF3?=
 =?utf-8?B?Q1IzQ2crLytsQ3pmcHVDQkNDWVM2YjRKN1pocWw5TTRDQmIyb2FSYVJldWQw?=
 =?utf-8?B?Ri85dVRyQ1A3L2hFSENLSjVFN1FoQ3pXY2hGdytkL0svL3cyZkNEMHJtVDdD?=
 =?utf-8?B?M3k2V3ZlbWRQQ0o0RHoxNXBUZFZHSklwWGlRYzZVK1lhVHZVSGhZZnFmZFZl?=
 =?utf-8?B?SUxUNXdMTUNPRi9OVmtFbytOeEVnc2tFRnZUc0owYjFzVGtJWnhHVkNmaE91?=
 =?utf-8?B?NFB5VTlYby9HdXgwWTE0d203TGVOL20vVE91dGxhVzF2UzhoR1BOZFFJNTc1?=
 =?utf-8?B?NVc4d2wyemp5ZGh1WnJvRlVYSDlKRC9wN3dPZGVYQzI0aUEyTEh4SzdoaUhT?=
 =?utf-8?B?RnR3aEpBNG16NmpRUmxFR2JOSGNmRXZWZzQ1djB4bkFwNzBiaEdvc3dBbkFz?=
 =?utf-8?B?ckZIY3NIRTRuV3VqWG9FWmEwQXdnTk9pU0V2UjNkS05VRm40dEd5TDBUMkxI?=
 =?utf-8?B?RE9TZkpIWUoxdWMwQ01YUEFJMzBvbDA2N3VDTFJVNlZVVG0rNUNGaTc1Q3d2?=
 =?utf-8?B?azlGcFI5RWU5T2pPLzArWDkybllKMng3N25LNjE5WVo3K0VnMkxST2JGbFFl?=
 =?utf-8?B?LzVsaUp4UXRBZDRVaW5KSVhvbWo4bzJNa3I3Z0NPazVpd2xlY3hmUmE5YU80?=
 =?utf-8?B?bW5HVFM1ZnVzSFBWQjJnMi8yWkozM2xTdVdQZ2kvMjN6dWErdjFDQlJaaVRP?=
 =?utf-8?B?ME9RWEIxUFpGbkFpdlJFUlUwSStURXZVSXcxU0U0a00vbElGd1ZOanRyWk5R?=
 =?utf-8?B?TldYT0g2aVQxWThnY0F1WS9Kd3hnamFoQTFFTFdrdGJSWHRXNS9NQUVWT2pO?=
 =?utf-8?B?NU5FZDZCaTc4VDhsT3VhYWFNdjlxSDJxVm5scGlKWmNla2VFaE9FSjAza1pD?=
 =?utf-8?B?bHJDaFFGWFhSNU5FQjdXR0lXZnBLK0Nic2NPTW5xUnNyVmRlM3Ewdndwc1Mv?=
 =?utf-8?B?U09Zalh0MVNYcDVVTmhIQVI5aWNLcjUzdFdIREVjT0ROV2ZsbEdXa29OaGkx?=
 =?utf-8?B?aUlZYUtiVFFYamRsbEVPVWlkcWVhWXNIMVNUQ0hMMXQyR2syMkxhZlA2ZEEz?=
 =?utf-8?B?eU5ra2RsOXZ6SGZQMzdoeWJTR2JxckE2YVdNU0F5M25CZFlhTzY0WEQrSUNK?=
 =?utf-8?B?LzYvZWF3SnVmMmhtRHQwSGIvWHB1V3V1KzN0UlpwQUZ3VERYUFlKOGt0dkxq?=
 =?utf-8?B?YnNYUnZTek1CTEthSEdCSWdBWEwzT2xiR3l5ZDlLS0pBblY3VUs1cU43SVpZ?=
 =?utf-8?B?VGtHcm9xb1d0dUVpZWtwMFdsNnhzVnE3NjZpNTJiRjB6L3o0VjFFRGxoUkx1?=
 =?utf-8?B?NlFjZDVzOHk1N1dEUDdicjlqcGJreUhVSlJvTWFaVW93eVNVL2Y0RVhyZjN4?=
 =?utf-8?B?SWlpN0dNZkZ0UFZDQ0ZjT1ZtaUZVelFXV2dYTHUwU2RJU1dUNFRGUk55cjFW?=
 =?utf-8?B?WW90OGtXakV2OFhrb29BREpxZHpHZlBhamZNNHhmMHM5MUFnYW5sbTZvQlZS?=
 =?utf-8?B?QW94M0J0akJ3dHNudThkOVNLbEJlZ0JEM0JHRHV2azZJbnAvUXFRd2ZPc2N2?=
 =?utf-8?B?Q09yS0R2VlZ2NE5wUXQxUUx5R1pXZWRpQklHbkM3T1pqelowSDFQNkpvMHMy?=
 =?utf-8?B?VEpFZXYrbHdzaUR6b1NQVElVdy9MVEFvMHpYbm8raFZ0b1VsbnloQlI2OXpl?=
 =?utf-8?B?cXNJNjIwbHBaVUN2VVJBL3NnaWxWTGUrVnUram5hcEhKZ1FDUFZ0anJFa3Jl?=
 =?utf-8?B?cUJHMlVNdDN3MVFCazFwM0RVZVF3bjVlWDU2NjA4UVU3WlYwMkF5U1J0MTNz?=
 =?utf-8?B?WFloN1grRVp6V0NCNVdZUGladDl2NlRMZGpPUE8rUVBlc0ZmYWhubVhsM3RV?=
 =?utf-8?B?Y2dPRkl0c3pKY1p6UkxRT3BCUjYzbnM2N0Zlak9SZklrTXl3dXY1OHRrblJj?=
 =?utf-8?Q?rMqnGP1s9rYOCnj1WMrgEgGsQcD/b+8xAn35Jc9coycTd?=
X-MS-Exchange-AntiSpam-MessageData-1: KW8Mb8kdgXpydw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a29253-d762-4a85-ced8-08df1d6fec79
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:51:05.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXRznecBVvj8zWgs3OfhZlvcKR+sAu5zLstUEh9YKljPQwSTjVOR03ntz8oA7IZdnWm4Tvb63DxAOj2L9aRq6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB893224

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
<...>
> @@ -72,9 +80,18 @@ pub(crate) struct BootloaderDmemDescV2 {
>      /// Arguments to be passed to the target firmware being loaded.
>      pub(crate) argv: u32,
>  }
> +
> +impl BootloaderDmemDescV2 {
> +    /// Size of the descriptor in bytes, as the load-and-execute event s=
tates it.
> +    pub(crate) const SIZE: u32 =3D num::usize_into_u32::<{ size_of::<Boo=
tloaderDmemDescV2>() }>();

This constant is only used locally in one method, so let's declare it
there instead.

> +}
> +
>  // SAFETY: This struct doesn't contain uninitialized bytes and doesn't h=
ave interior mutability.
>  unsafe impl AsBytes for BootloaderDmemDescV2 {}
> =20
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns are valid.
> +unsafe impl FromBytes for BootloaderDmemDescV2 {}
> +
>  /// The generic falcon bootloader image and its IMEM load parameters.
>  pub(crate) struct GenericBootloader {
>      /// Bootloader code, zero-padded to a whole number of falcon memory =
blocks.
> @@ -144,4 +161,56 @@ pub(crate) fn imem_load_params(&self) -> FalconPioIm=
emLoadTarget<'_> {
>              start_tag: self.start_tag,
>          }
>      }
> +
> +    /// Returns the bootloader and `descriptor` as one firmware that [`F=
alcon::pio_load`] accepts.
> +    pub(crate) fn with_descriptor<'a>(

This makes us export the `GenericBootloaderLoad` type and is not used
for anything but running the bootloader. How about converting this to a
`boot` method?

If would need to take a few parameters like the `FalconFbifTarget` and
mbox0 value, but that way we don't need to export `GenericBootloaderLoad`.
