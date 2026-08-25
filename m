Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87934F479
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642336; cv=fail; b=kO2wnMRL7kI3PSsCVaakWz2PSWNT3m2VmCpe9oOrQ5ZE2h119/ZpxMlZyah9FI9GnCBhEtDjZUx7Umx2WHXGPVTDxm2nqtPSk8Iym5X5KUg14c3fkMCIO6qEiRy1nSQft1ebCq3ac0iFqMPzwvx+6qzEqx4gCDMLuEs1DwhwMnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642336; c=relaxed/simple;
	bh=q1ds1UVcN5v8Sw814WOioa3qaa2vKfRGk/4jGfksuKM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=K5IGiQ+D3/YMJybSf59Ijbr68VxUvaqzHAFJfVlMRzLHpXigD9X3nbbRRBJncvUtVLTSNRTDOMJBQmblAY81baHgSd0dWPY7Qmj7behAQj4WNkhSJXOSANUKX1RpFKkHR+znteko6gYC33sozuzkMnpe7TCMY0LZkpsD/nvPvU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UKL55ikw; arc=fail smtp.client-ip=52.101.48.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UKL55ikw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9d7s70HzDYE1skvBVaQFWFubHTI0z1CNZgUd/4TcXJXOFf/4Ivq3uHjXY1IRcT9IT34DtGnUd/QjNIC6ZTqSOaiMKwfIif5vHntKPBXBj9/oIi0KtUKUNn5Y9vSh4CqyTK7bJBe++BaxK2X/jaT/spi3QfJJkn5WQLOqim5lOIO8d6DM1EOcHxC/WdZJa+EK1lUN8lZOcnPARXRpl+PtBgKnzvtNd2Y913ALAb/D6TnEXDUH4HBMwpqNOe8SWdEDEagMQMt+vaPpUg0Rxez24wGYBToluP2QLHVZj6MDkfDSngv545ykQN2bPUHiSaUh0V2XpSL4pgnCxRD73MFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVjOxHhyzfmemEGD5eqxhPB55etyHWXdfWxuyRnwbJs=;
 b=IQCYa/WJtwcXacs1qdR77O6ogEtOM5QRtfVKDEgE7W08Aiy/SlG9+1F/vMFULT0loxxQxrCeRddvGijR3f1XE7HFvbc7d42KoJRMFJb7pPPLWezbU7sl5z8kvWgdhrcVPEBNfB/siGfoo7WATsjbQOsiI0eziCS+z3eMfVlmaTwCcPQLJ+ELFsmgdt+lt47uP/hxKANbciFRAmTfQ4PdNNmeqFj2LoLQWTnoADfAh7zz6pU3aU1BjC3wgY3aqC9iKCcb7bsJU/v5rApFqZR07bxW79ipg2cMiAgi9DxOj+1390Aewmpnu5KxV2egNGdQ9lZJXem2SqfvFzPY4yag3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVjOxHhyzfmemEGD5eqxhPB55etyHWXdfWxuyRnwbJs=;
 b=UKL55ikwPXx7EywuasOsR2H4Oj66aDnNtn6V73cMwVtZlmaBzJXSNivbM0zzAuK1nSSgas8ERQF99JLmxQvlowj38y+r/fCXM/OI1+R604+2LTcUuvjhNRGHrzEn0qDBy/mzUZ2iR8zkXw91XKPzL7bym5gRmJUbbTqj9Z569RRtW9Nk5VGtve6+1auuU2bewWgJKtOKVOA483/Auumv6133F2UT8JzWylnpHLyvXlUmCSulPORB6Nau5QxcUTqzsb7an67gqxr1wNdz8xU6eQjMx0jEb0c9KG3tQkwoul4bpLVK5WoAfEx5OGbHlzWzHyPJMa0GInasAI8+StgE/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:18:50 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%6]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 07:18:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:18:46 +0900
Message-Id: <DKXUBFRQ9JUS.29G1A4GBOMOF2@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: a66c27f0-83b6-412e-7465-08df02791c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|23010399003|18002099003|22082099003|5023799004|56012099006|11063799006|921020|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5rn51pY0IAlTXdAKpNxoBSUihaC+CGvG/IU1EcEYSIHCh7M6LmLdMFZMLBaaQK8+YPXnyxCkKvEGrq8BsbGBCh8N45ekrZEFKLKOhJ8cwoZfjOJ50oYjEUIi72GVzqeimmvSkcVu1nzkQQwoBMM+9lj3bU/ayNGjoZSy7Iasc/9Q4ZB/qGHdb7DuFHXMj7SUvzFDW0n/I6jLxsNblw6sgm2OvMCD/0UIgve0433nIEnruJjLDeiVj+AgODDaFA3oZhvYfxYzdehm5xPaBxqcqUG1ys5pfgqotTan0OktnS/qQSD+JxEYBUmQn64wdUygrMp55AHAu75BNtE91/mTHBPtJINPoVFMe+ObgoKo2U1R81jVyU1PZBOwRoUSAZQUx717MH+XNj1ok0e5ZlKmPX2fG2qEDCK0XNEYHVew6tUG8b4yjkBhStVSh5+ZGu/WUXf2R/7OTiGNFhG+iMlroZOGCKyGmD49sHYXweP77FxDJbTgUJuNJRtvQEdocbFiCh30ErbYy8GgDCXdP5wWgG1AVo/VqwzGZ1FH61Qhlj/miWQT8VgJmclpTtu/910XtSkKGfEL1QAIDWq+ExnSxhWn7pqJ+c3yreBkdtE1HLLH0C1CuNw0QWhzIPTHjSUCBhwpRvxz/UASpVSXeTxzG4LWrGOsGS5H4evvJg1/JksBOqnaMmsmrC2iIz5r++luGIMJ0K4xQ+LgvKtSNf4WAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(23010399003)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(921020)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEQxQ2hwbmRqV0o3WjFXV1hwcEhoN3NiUFNxcU5FNU1SYThsK0dKQThZN0xl?=
 =?utf-8?B?SEE3cmxNcGU5VmpqY2N0Nm5HemtyUlNwVnZCMy8yWXdjZ1lrSW4rdUU5YTk4?=
 =?utf-8?B?QTR6YWRnMjZxbmhzaUJxUE1Sb2lCU0FqV2hBUExpa0hJYkZldEhPR3hVeEFH?=
 =?utf-8?B?ZndzWFdUN0t2Nnc1S01ROTBuYzNUVXQ1Wjlha0ZyQXB6bEpoSnI0L2x4NWt2?=
 =?utf-8?B?a0tVS0UrZWhibGFHcHEwMzY2dWNVUWVUQnRNSzJieVRWQXlLbUIyaE9McURJ?=
 =?utf-8?B?NVZYb3NWTDdyMHhYc2VqTU8yV3dVdTVrSmQ0bG1qYVA5djIvcjBoaG5YckVU?=
 =?utf-8?B?NmFsTDRITnNYWGJGQnlpK0FWOXVUUUFIb200bWJDSjZuOGdiKzAzaFRLekNx?=
 =?utf-8?B?ZnUxWkgzK0lxQlhydmZKSWxZL05XSk00Sm5TODFXM0VMVmZXRUt0SWNMSDAw?=
 =?utf-8?B?TDRiU0FhMWtlbThqUEVFWWFwbzk0WGlrOTBqNWovdjZRaEpLcVB2ZUhIdE80?=
 =?utf-8?B?elNsanJ2RFE4Vm0vTXA1TlphOGdOZll5MUxKMXlXZ1RBQlBxREVkeTZ0bENN?=
 =?utf-8?B?RzFpM2dleUZ6RHNEZlZvQ1lqL0RZY2RjTjZHanFub0VuNUZRVHljZkdBNFhL?=
 =?utf-8?B?TnVPUThuNmdaY3dsa3B6QVYxeGVmRUFVcWZSdm1EZ29WVWJFV3FsVTFVNXpI?=
 =?utf-8?B?SXlBVUdHQ0ZGR2dmaCthelZEWnJJOEhnaHp3d1BVUjJJcTkrUkZrZ01tak9C?=
 =?utf-8?B?ZGNMQlV0QzI0cGk2dGtMK0RlUk9HTE1rM0Iwb2dYem5KWVVNWGtzUXVoTk5k?=
 =?utf-8?B?Yy93c0hFVVZ1U3JML2ZHcjBzS0ViSGw0TU0zQmtXU3JpWk1RRTE4b0E2ZWJC?=
 =?utf-8?B?UDJidUNHeFN1QjVOMDZFTGdIYTYzSDZudXJOOTJKZUpmQnVNSkhCSmhnMFFu?=
 =?utf-8?B?eUJVYUp6em9BeXVXWkp0YlZTUjFRTTB6WTljTFdXanJYYzN1WXJFZkJIdU51?=
 =?utf-8?B?TDhEb2Y2VGZBMERWUUYzUkRUeFpHblF4NmpPejBhVUU4RU1JVVBTc2FucFlx?=
 =?utf-8?B?ZW1MeDRvY2RBTjhFMjVRTnhvK1NWamIzSjdGd0ppeURCcHl0OVVQOTBqeEJJ?=
 =?utf-8?B?Y2pXYklwNGVxVHQvbkVsN09qeHdXcDUyNnRVcEl3TlhaYk1TdTF1VU55ZUZm?=
 =?utf-8?B?cWQ5NjMvMjNBQkIvTGkySkxzVWQzSEZiUERBZUVYMnZCd1pBaURMcXNWL1lF?=
 =?utf-8?B?RCttSWxTOFlDaDliNDZoTTN3L3pDT1BHVzNPazhicld4YzZHOTIzM3BlOFhx?=
 =?utf-8?B?cjZXVkRJVElyajIwbWJlZjV5WURPdWsyYjFMYVVib0haZnJwdFBDWE5YWW12?=
 =?utf-8?B?TUM4T0UrT21ISXJmRzVwcThQSVBTdVFzb0xUU05DQWg2d3oya1l6TzBEdStR?=
 =?utf-8?B?T1R4Nnp2V1pkWGF4bjBKNTJiYWNEWTlXT2xGaW1vL2txUThEWWprL05sZjdL?=
 =?utf-8?B?MUFZdFE4cmhaR3BOMERCaEE3SkxFQ1JVY2RuQ0QvaFVEckpJZXZJaGluSWZ4?=
 =?utf-8?B?UEJYSEdxemE4aHNkb3oxZjRYVktDVzBuUVU0eHNvcXIrbS9ZZWswU1I5dXhT?=
 =?utf-8?B?eXRoeFR3YXdySE9Pemp4d2ZyRXZxV2lMSUNOcElLdG15RndZUVA4S3Q5N25k?=
 =?utf-8?B?b0lpc1B5Y055RHNEL0t3dVZucm9HOTZEY3JGNnl5ZTRyNmtYdU9pVXZ2NGJs?=
 =?utf-8?B?VlZXaWVHSFlhOUJpMTRMSU1QZm9HaEtyaGkreEdVSWxDZ2ZWK2lSTEpiR3E5?=
 =?utf-8?B?U3J3QWZsdVlNZGU3OWlLcEovRmhzYmpYbUVlZmxmbTlxOEZvaEY1SFZyb3E5?=
 =?utf-8?B?Y3FMWW92blJ3TjVqY2FSaUdtN3IvNXB4V052ZS9RSWdRdE9vRTNQTGV6Yks1?=
 =?utf-8?B?WTdJZ1grRXlHUVNMa0RpR2t2cHRINUhyUldaQVhSVXBUeXMvZUxDVE5kM0M5?=
 =?utf-8?B?aFJXSlNZM2I0NnRXcWcrOUxabU80YUNGaC8zcURaMFExd0hWaHVXU05Ka1lJ?=
 =?utf-8?B?MlRtMFlqQ0pUbDVxNDdHZm1mYWVjZ29GM1ZPd1hYZDE1QnlWV0loRXlzRVZ4?=
 =?utf-8?B?aEoyQ2FQQnJKMFZRZHRid3h5bE5pTTNjbzJrR3Yvb2UwcFk4dWdQRGpHSmlk?=
 =?utf-8?B?QmlkUnMvajNVUkgvVkdqWDh3NVY3TlBPcmFTOG5TazlFNkc1blRudkREMTB6?=
 =?utf-8?B?ZlNvTFNtSmgxUGQ4OUswOFdIN2J2VEdXS3RWV1V1QmpnMjk0aGdkSGZUc2dR?=
 =?utf-8?B?d1Y4UGdMVDFZR0gyaUZsSEpxK3VkOVpGQkNLRjJvV0EwZ1VZVHBEZUd5ZWVt?=
 =?utf-8?Q?9hM1ojSkPLFZ5dVkZOJ6jHiSmjMmVj3cETQkbbtVMJf6S?=
X-MS-Exchange-AntiSpam-MessageData-1: S7/QsHTNWfPGpg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66c27f0-83b6-412e-7465-08df02791c64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:18:50.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usEB6WHws++nbpuFfJEKe3G2JEgP4cjSPg681MWykW8k0UhaRaSdAoo8vkzhWwWcUebImhs0EltGHJExeBghlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

On Tue Aug 25, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
> The casts module features a series of const converters (e.g.
> `u32_into_u16`) that narrow the type of a const expression provided that
> its value can be proven to fit into the destination type at
> compile-time.
>
> These functions are numerous (9 of them), generated by a macro and thus
> not easily discoverable, and cumbersome to use as they require a
> turbofish and const expression between `{` and `}` braces.
>
> Replace them all by a single `const_as!` macro that expands to a const
> block verifying the lossless nature of the conversion at compile-time.
> This turns e.g.:
>
>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT =
}>();
>
> into
>
>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32)=
;
>
> This makes things easier to read and understand, while shifting the
> burden of checking the conversion's validity from reviewers (via a CAST
> comment) to the compiler.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/casts.rs | 129 +++++++++++++++++++++++++++++------------=
------
>  1 file changed, 79 insertions(+), 50 deletions(-)
>
> diff --git a/rust/kernel/num/casts.rs b/rust/kernel/num/casts.rs
> index 7e6c7dec747d..a4a18a6f2ba8 100644
> --- a/rust/kernel/num/casts.rs
> +++ b/rust/kernel/num/casts.rs
> @@ -20,10 +20,8 @@
>  //! - Two extension traits, [`FromSafeCast`] and [`IntoSafeCast`], provi=
ding conversion methods
>  //!   similar to [`From`] and [`Into`] for conversions that are safe to =
perform in the kernel, but
>  //!   not supported by the standard library.
> -//! - Another series of const functions (e.g. [`u64_into_u8`]) supportin=
g the conversion of a const
> -//!   value from a larger type into a smaller one, provided the value fi=
ts into the destination
> -//!   type. This is useful if a constant is defined as a larger type, bu=
t needs to be used as a
> -//!   smaller one.
> +//! - A [`const_as!`] macro, losslessly casting a constant expression be=
tween any two integer
> +//!   types, with conversions that would alter the value reported as bui=
ld errors.
>  //! - An [`arch`] sub-module, defining more conversion functions that ar=
e only guaranteed to be
>  //!   lossless for a given pointer size. These can only be used in code =
that is specific to a
>  //!   given pointer size.

Can we add guidance somewhere in this file on when to use const_as! vs
when to use the u8_as_usize etc ones, when both could work? e.g. use
const_as! if you can, otherwise use the function version, or, use the
function version if it's sufficient (types alone are enough to prove)
otherwise use the macro.

[...]
> +#[macro_export]
> +#[doc(hidden)]
> +macro_rules! const_as {
> +    ($v:expr =3D> $into:ty) =3D> {
> +        const {
> +            #[allow(unused_comparisons, unused_assignments, clippy::as_u=
nderscore)]
> +            {
> +                let v =3D $v;
> +                let r =3D v as $into;
> +                // Pin `back` to `v`'s type so `as _` casts back to the =
source type.
> +                let mut back =3D v;
> +                back =3D r as _;
> =20
> -                N as $into
> +                ::core::assert!(
> +                    back =3D=3D v && (v < 0) =3D=3D (r < 0),
> +                    "value does not fit into the target type"
> +                );

What about giving some text on what doesn't fit where? e.g.
::core::concat!("`", ::core::stringify!($v), "` does not fit into `", ::cor=
e::stringify!($into), "`")

