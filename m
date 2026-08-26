Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749E3DE426
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742983; cv=fail; b=nLwtZp5fV17rgEZvsVsX+QKThbcLYI3EEHtB3yB4WDx0fgoO929Z/P4+/FH7FqCRuFKVan2WQPGGHpEa5qoKvdcA/PNYjsI9hFOwFWEbggzh/rRPWrt5elFRcru6e8srChV29PDWH8V2Ip0szCmVaXHkzBNBQQgocyd1ZuNW610=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742983; c=relaxed/simple;
	bh=paW/yTDY86Bsgw7FpzN7h/TkjzYA/XFG/ZxX5fWgtoY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PPvdcGFdTI2/xLEZcHLC5ivWJFjYuz1gTAvEoRmYayYb701Ynr37slPOoK+WE4J+t2B7sgStYoF9ARIib+aJGX/vygBp+Ptnid2vVA84XOc61FqtY+8u3EVTUAogUCW+gHHI1WYX1AFVKn2CAAflxXlAM6hs3SBDblUsY3bJmgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PishzKsu; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PishzKsu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX3bhMQrPa6fglYFP4x4S6CTzPc2XPE+zmrYLHn7C22bghlMYOMZ1/wEpill464eTjMrelWqz1/0PVxKQetaVxS+gwnKuh1bAx85Osy3yyLjprJQHdg/JEPiX0aqclfBdhnEUSURXhrxeH9ErE+ZtKD+SKQLoMDc1wblru7KdPEatSpJ32PyFzyhQM0AHx2cpGjOk5Jlat0sgdm96ZfGJjyfJPSJCEUqmehks47PpY1kaZhsygbGhOWN99lysesgYgFUFKE8AhdwF9QwducIWCkZNe6EHjrg1RvsP2hIePnJhuGwtEUHVXAdfASaBRyauO2kpVEthwJvROVvEFSsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XThusqJhR2esRohskm7WRmRg1toKtUVI11FZk5BehMw=;
 b=xZIfOLbin8D6Alh8m7ilmKiIdQ1SN4ogQZUxBuO+I0/bSj60L3D/BiNX4rJ8KonZoRkXlTMOH0Uf3PSiBPe9N9xiVmHWbPVgeEqnvTv3tYn586GkoFTi79vX082LlKcWJoSu79VNHl1bSOGij86kSAWqC4EGEP8hI254Kcakk76g76TUj5KygbZCHAGO4CXc2S0JkpO98XUCrXWaGkNof+iSyN8tbZHC8YHPxXQPUXLEpZNwlWnM1T1yKI3z0mXpojazMxbEGCXgvBl+eYNbO0MQoCZpD01epEJq+V0h2MD0AdTVUvm9KrDF41TR1uIa7Dj9XP/mYoXJpMD9poyf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XThusqJhR2esRohskm7WRmRg1toKtUVI11FZk5BehMw=;
 b=PishzKsuvmK8r4Js6KJlUP46a5D9RsAyKMbJI4n8smfUMJFsXFw/9kzECX495OE90C1VUBWkfPQo/dE+YvYJ/uQOVjN8lPThCVIervAU/YCJZR3OEuon9FHmWFc7WhV+Omj2wYmbfgYWVx+ElzyYTP3bsSyMLPrekaWV+XUGvzfzYeNtSglzqqtR4CpowJsw2F8BDb4nbdPpaSbGTieId9ryqfM2GBc+QesVfJLfU8WUzf6YRaIA7ITgFNqsoqztR4+pjShLA+pD1o7vzTXQ3R/zIt1yy6EfiUaJPgQibGAC92VFXvvx4PLZpc8a4bdkNTrrYbmtwH8P6cdqSCcegw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 11:16:05 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Wed, 26 Aug 2026
 11:16:05 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:16:02 +0900
Message-Id: <DKYTZNAX6ON6.1K1372FFAQOF7@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <DKXUBFRQ9JUS.29G1A4GBOMOF2@nvidia.com>
In-Reply-To: <DKXUBFRQ9JUS.29G1A4GBOMOF2@nvidia.com>
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae0a46c-3461-45e5-aecb-08df03636bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|366016|1800799024|6133799003|10067099003|11063799006|56012099006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LzEd53yF4TPt4Fpwgq8+hZzwgBRuFdBwsL4R0ScS5+loIL2OdYioBEojhC9jjBb8ENnYOFUQBUOmD26j8ceTjyiCyQdEJQM3fM9NWKGl7gAAWGwtnpRcBUMOD3+HI55/FUPvuj6EZroRwMmEPdY8C/AEdXdmPf5nGM5pB3TRuptgv1Xckd1qaH/Dlmdfg6oD9owf9Uw6l6fPDJhFFBJjHliXjQViu4Z5fpBBO4OWwG0i091GjCdHtuaPUtyYt/5qCOHGnWxrRTZZfR1HJCArG8Sy/5MfTsC9+ErRJc8oy+WbAanZAg17Rlf4cQV6GRn/fv/qlkiqHsaz2FiyaeVApCepJHuG8nu7z8EhYEGNVvDBMn+wnj+xXziGa1nKQRwvtR+7SRfNCtU4H9JD9EYPeHME4NVLHvBK+w3Q+rsITxWe2+21hIGp8cg2m4ZkbOVYsKm+MfOfSKEjSG4Q80wfDRGdm23gAxUcKYnSESM4ke7RwYxupC2N6srMrLrS9wnF4Wl5ztDmfVqMkNSytDJK7SgvV7eB3FzXry1RxlY1QhpFR7kQ7Iw8mqYWFc0EdykR92PsKciG7U/HF76QEFHleRLT8MmdhMkiQ90yDnBBlg02HwD3WySC0DuZ+Vd8y+Ekb/+FR7YRBN09zTMAh3ky+cJrL3JGX7OPz4M7v0b+OKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW81azMxZGZGcENNV2o5eVljTXVnWXFmUXNCbi82TlZVd1lXVDhLNTd4cExE?=
 =?utf-8?B?ZVVwVHJ6SzlhbTBUL215M25GalNrMFR3QWhsdU90WnZsL0VNLzd5eG1nRllq?=
 =?utf-8?B?VERsUHZhZGhIWVBGaStSdnhwZEQwNU9rcGs1YStiU0c5c2kyQXlqZlpuM01v?=
 =?utf-8?B?VWlIejFQOWx6SE8wQVpyL1BBNGh5RzR2Z0NJQmZ4VWJ5WTk1aWVqRGRDNzNs?=
 =?utf-8?B?cHdjL3kxSmY3R2NkMmxJY0p1amEvQXdaaENkMGo1Vy9wRlphZmJhdXZURTk4?=
 =?utf-8?B?SlJaQjNrWWQxUU1hUjVpTXV0TkV1bjkxMlM3azVsVTNVMWdvdzhRV1VyTUxx?=
 =?utf-8?B?M0k5TVJVZ3REbDczY3E5SnJmZ245bmpQcGc1VFFVUzZld2JKMDJQd2dUOE1U?=
 =?utf-8?B?OEtDSmFHMHpGOVZtdVVWOHgxN0l4SmxxYU9VQmE5KzBNTitBdktaTmlvY2RD?=
 =?utf-8?B?SGtnVEVmelNCLzB4K3ErekVCRlhKVXIzQ1U2QkFPMWh5MkR0ZEZoakEyVWp2?=
 =?utf-8?B?eFZIOTNoSzNmdDNNcjdmTmdBRDJsVzBKMnpYMmJMOGRoU012ZCtUeTUrV3Iy?=
 =?utf-8?B?aTA1OTFyd0R3Yk0weXNoN0d5Q0Nkdy9nN2NtUGVORDQwK0VTKzVMSmRKTGVG?=
 =?utf-8?B?SEFyVmY0Qkpya0RKNUdyNTBjbUZ5TS9qS0ZnTURuR2hSMWxGVUNWem95VFg0?=
 =?utf-8?B?b0wzcm13TmNCdUg0YS9lU0VrekxwVWV3LzZNVU5yWkpJdTZLaVY5WmNFcXFx?=
 =?utf-8?B?U29QY3RreHJJaW9qbkVwS2x1alVWNVBoRnlkallVQjdpUXg2NlFZaGxLSDlD?=
 =?utf-8?B?cXRBY1QwS3BZeDVqeHVDSCtldWNadmhjZDhwdkhaYkdUQ28xZHJBOVFWdGdi?=
 =?utf-8?B?aTEvZ2p6dGxGUGd6OXI4RmpvZXZEeFVKWUVRaDlSbHNXaVB3aThIZFZ1OGp6?=
 =?utf-8?B?VDNFbVZnM2RzN3R1MnRHTlBRMkNzRlAxUWQ3b29oWU9wRkJIc0RsaXNZSkpY?=
 =?utf-8?B?SWl1RGRHUURwQ2FrVGNMSkthOVd0SzBxVmNwU1RZQnprYWRIRnBxWC9GQzdF?=
 =?utf-8?B?SlFPYkFIclpOZmFvd0NINkxHdFpmTEtpSXR0c2VaRDRkQm00c3dXZXZ0ZmJo?=
 =?utf-8?B?OFhuSVRhNVRFSHAxOHNMOEFWUjZYS0Y1NTRaQjZBTk04c2I3T0dwTFEvVVVQ?=
 =?utf-8?B?UnVUcTFZNVhWMzdmR2pYWmJmemJyVUk4aVVWTVh2UDhxbGhRK0tzMEFLYmpo?=
 =?utf-8?B?K0ExNmxxdWliQ0E0cGlIYUoxVjQxQnpvVStVdW9nMDBlNWpBVzJTeXNCWi9a?=
 =?utf-8?B?bnEzTzFibHAwd3o3ZzNxVUZIQWx0QnVqZnIrd2dnMHlNU3ZHMUlXYnlGUzlv?=
 =?utf-8?B?TzdqcU4zNVBXVWRiS0FGTGgvV1ExdVRibHVTTlUrRG81T0JsWnFPbldLclBB?=
 =?utf-8?B?cUhLT0luVVdGMXV6a0JqSUFsSUhtN05WRnZ0RnhjU0hPVHU1QU1POWtxOHMv?=
 =?utf-8?B?WkFZUUJtYm16akMyalVBZUp5bkYyY3JBckNPc0JqdXJON3RFdUs0eFBDZ2or?=
 =?utf-8?B?TkhYRnVhclk2YnFBMG41ZnpUQUQyOTVOQ1BheU1Pcis4S2t0VEQ2ZEZqSXZV?=
 =?utf-8?B?aWw2bktVSG14eHRNRWpkdkNmMlpwNWJyK1I5OUZRKzZlZlFNUGc4ZzFob1JZ?=
 =?utf-8?B?RDNGWFlKUWhHa1B1cUhPc3NKSFNiV1ZpVkVPN1NCSDZaSndjNkl3aFR2eXR5?=
 =?utf-8?B?ckRxK1M3SXNDNHRyY0Y4QmQxTFA0REdZcmYwRXZNT2FFOGpEUlJNMkV4TG9R?=
 =?utf-8?B?OWtlVDJhaVE5Q1NQTWRicUdZdDRzb0c1SGpnYUVBR1dwRkhybEJadVFVaFlO?=
 =?utf-8?B?KzF6QkxIRHUwclI3cS9UWSswSEt4T3NHOVRFZm0rakh1S09oelB6eVF3RVB5?=
 =?utf-8?B?V05KS2Z1Vnp4OThpNy9NZGxZcWVIcXR1c1FEd0JxQUg0TGRjaDhrdHZEY1Q0?=
 =?utf-8?B?TnVaQzZUei9lUDdwckRQZ044ajVHMnVIMVVLc0pkekJURG5STjJoZ0dvS2dN?=
 =?utf-8?B?Qzl3QmorUzRNaTBGbWZKTTBTTDJHNytKanYzRkxzd216N3o0bmtKaHpZZnd3?=
 =?utf-8?B?bk1HaGRHWnJrcUlrWjVsZ1hmcXJYVm5VK1RoMERWWW4zeGhuMnNpT3Q2cCs5?=
 =?utf-8?B?d3NpV2hUTk12S0pUTm1aNmdjVGxFV0lYMGQ1eVFhd3ZFdWlyZ0ZSQXN3WTJG?=
 =?utf-8?B?UHFHQVlIc0lKQnR2Vno0TmRQT3Exdyt0VE51V0xpc2xLUTBhNTNrMURYWWJw?=
 =?utf-8?B?NFl3OHB0UjFXSTZ3V3J1bkwxTTdWRnVnNnQ2TldWMkJSbGFYLzhFR2JwU2dv?=
 =?utf-8?Q?PxFhoq+1JcWKdHhiXk54naCe0GYL3xuZT+MDznUlKeR74?=
X-MS-Exchange-AntiSpam-MessageData-1: nEnL/nOmeYvyDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae0a46c-3461-45e5-aecb-08df03636bda
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 11:16:05.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpyrlX70xX83BEfAH+hB4c6zDfgDrE7R2434Y4j9B4kS3Qbyo5mrYfmplu9a1A3B8qLlBwGDxd4Wb2YHdQW6CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

On Tue Aug 25, 2026 at 4:18 PM JST, Eliot Courtney wrote:
> On Tue Aug 25, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
>> The casts module features a series of const converters (e.g.
>> `u32_into_u16`) that narrow the type of a const expression provided that
>> its value can be proven to fit into the destination type at
>> compile-time.
>>
>> These functions are numerous (9 of them), generated by a macro and thus
>> not easily discoverable, and cumbersome to use as they require a
>> turbofish and const expression between `{` and `}` braces.
>>
>> Replace them all by a single `const_as!` macro that expands to a const
>> block verifying the lossless nature of the conversion at compile-time.
>> This turns e.g.:
>>
>>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT=
 }>();
>>
>> into
>>
>>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32=
);
>>
>> This makes things easier to read and understand, while shifting the
>> burden of checking the conversion's validity from reviewers (via a CAST
>> comment) to the compiler.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/num/casts.rs | 129 +++++++++++++++++++++++++++++-----------=
-------
>>  1 file changed, 79 insertions(+), 50 deletions(-)
>>
>> diff --git a/rust/kernel/num/casts.rs b/rust/kernel/num/casts.rs
>> index 7e6c7dec747d..a4a18a6f2ba8 100644
>> --- a/rust/kernel/num/casts.rs
>> +++ b/rust/kernel/num/casts.rs
>> @@ -20,10 +20,8 @@
>>  //! - Two extension traits, [`FromSafeCast`] and [`IntoSafeCast`], prov=
iding conversion methods
>>  //!   similar to [`From`] and [`Into`] for conversions that are safe to=
 perform in the kernel, but
>>  //!   not supported by the standard library.
>> -//! - Another series of const functions (e.g. [`u64_into_u8`]) supporti=
ng the conversion of a const
>> -//!   value from a larger type into a smaller one, provided the value f=
its into the destination
>> -//!   type. This is useful if a constant is defined as a larger type, b=
ut needs to be used as a
>> -//!   smaller one.
>> +//! - A [`const_as!`] macro, losslessly casting a constant expression b=
etween any two integer
>> +//!   types, with conversions that would alter the value reported as bu=
ild errors.
>>  //! - An [`arch`] sub-module, defining more conversion functions that a=
re only guaranteed to be
>>  //!   lossless for a given pointer size. These can only be used in code=
 that is specific to a
>>  //!   given pointer size.
>
> Can we add guidance somewhere in this file on when to use const_as! vs
> when to use the u8_as_usize etc ones, when both could work? e.g. use
> const_as! if you can, otherwise use the function version, or, use the
> function version if it's sufficient (types alone are enough to prove)
> otherwise use the macro.

Yes, that's a very good idea and the use we are currently doing in Nova
is also not consistent. Basically I think that the priority should be,
in order of preference:

- stdlib's `From`,
- `FromSafeCast`/`IntoSafeCast` (for non-const contexts)
- `const_as!` (for constant expressions including narrowing)
- `*_as_*` (for const fns with a runtime value)

>
> [...]
>> +#[macro_export]
>> +#[doc(hidden)]
>> +macro_rules! const_as {
>> +    ($v:expr =3D> $into:ty) =3D> {
>> +        const {
>> +            #[allow(unused_comparisons, unused_assignments, clippy::as_=
underscore)]
>> +            {
>> +                let v =3D $v;
>> +                let r =3D v as $into;
>> +                // Pin `back` to `v`'s type so `as _` casts back to the=
 source type.
>> +                let mut back =3D v;
>> +                back =3D r as _;
>> =20
>> -                N as $into
>> +                ::core::assert!(
>> +                    back =3D=3D v && (v < 0) =3D=3D (r < 0),
>> +                    "value does not fit into the target type"
>> +                );
>
> What about giving some text on what doesn't fit where? e.g.
> ::core::concat!("`", ::core::stringify!($v), "` does not fit into `", ::c=
ore::stringify!($into), "`")

Will do.
