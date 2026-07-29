Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA515746F
	for <nova-gpu@lists.linux.dev>; Wed, 29 Jul 2026 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785304702; cv=fail; b=c0LmiKV4zIXijQYBtyB7webQctvZp08a2zYFLXyijKExl+RNggNUXL82IUmYeOAdrdM8XlGOD63cvuwkxcMgzR8Yx5Du4SgJLlOJhgl7NlJPuG6rF23vSL1Gkb1TdOZdSrYJamV0OB1VrDZBfS6xern1DiNgrsq86c9vCNShWOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785304702; c=relaxed/simple;
	bh=ZUYUiIzjgCSU/uUNWqQAMmKnHOxSwpaqYQVldLEgwzA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=l1i8fAySu8JP+G7Xzqpqi/j2csibhTg8Y2o8WaHdqhFbgGqCiV+jtd8glOX+QFmBd1Q/VCe16YY61i30zX+OPGq1tlZuDT2kFnUxZiRmQ1BTVL47YM6PSmAgPwrZ4MM7vkDJA8DITpNchIHwzEDy74RKsquSAn+VKyWh4yvqtZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tOZZAZqm; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tOZZAZqm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCc2O6xl5swRmV5TbMhi3vURRxN4dXXHdHCojop6i5PWTwCA9BeVE9xl5UwCaeXkHvwnyscrZx34c4o8I5NH7K+Jd6M2ThWlyiOQSTFOkti0PYVQKQneX9wa68isRCDmCU5VESmCZj0xcgv7spPBMxfOaPM1VFQcoromP+K24+plGKbYu4QhU6519Egbuu8x2XLkx4R1Rx7gCH4OqnJ7GF8I17LVM3FTMI8sPuxtPpXvB3YyFZ68s+eLoCXuke1qFvH03AzmlsW0S2P8OMlU8Ixaa63lV9Ea/sXm/9zEQe2mpnmsoAMVdzdYgd8y0e5+BAnHnbAMLgw2l+GIiXboaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9y3QJbDq+c4jo26K5lUR9hGyTz6nfJoMigJ8ncmCtE=;
 b=EVgOFA9mv53nRxKpMKf1FJY+xXbDlzuGAL+R9GEEwfaoIOK1N+eHYS2kHUHGAt0smrzcbvPoBN5Ywcl2n47ONijWqmIivePnipzjfmvS/ZDaMB7w5kX+LgAj1JZDeUpSSnHBoJxiQg5JFU185dz9GwRRIi6hz5hrQvjqQ3TO+WbK1hnFQolDhzpX8e8WC0iRepK6EFOG8BP9RlBMXvwpP4CrSqdT8p7Cj3D1nefyRai9ggbnMSXj2YYlwVdvG0VRyDItIhzpot0YfD7hHE6ANcYed4xNiLJSaB8kBo+PSiH83xLIAofG+jw0rOye+B0DSAOdnxDcibl/wsZZPNn9UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9y3QJbDq+c4jo26K5lUR9hGyTz6nfJoMigJ8ncmCtE=;
 b=tOZZAZqmKbNJQSJRgO4MJT2JPIt9PR3uS4Dm9SH7ZcAuzU/3Fr5D5uB0STVSAZif+ZsVlJ7nJCN1CHxtuvpMaAL1Dr24sQBvGddgHQ/YKLULBiwaap3OOoVlGz5YaOq+jMbvRKTUdej18+jmFrky925y7XUK7AG18eOz//bnCl4gk/SojswPIauWm4/sUykDE2AqRgK3x6pjJQECJsIMzz4UwUTKqONEz3GJvp9LPMKdqBjVf2K1LGnt2o7LVtUO+I81/OjXCU7mpHWuAEHWCwiwwj004jlU0CNESVMBeHytLR+5huDyfrQDIpY+aVygDLPmlWvcCusdS15f4yW1rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 05:58:17 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 05:58:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 14:58:12 +0900
Message-Id: <DKATP1C14JRZ.1A2PCWTGAVAHY@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] rust: Add support for reserving of ranges of IDs
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260723-chid-v2-0-c35e5e9fb3d9@nvidia.com>
 <amN_ZfhoV9eF03Jr@yury>
In-Reply-To: <amN_ZfhoV9eF03Jr@yury>
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 835da656-1804-47af-b4fc-08deed36623f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|7416014|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kTXDMq4D76dzDYcnQM9wxwDzAiFF4zahlW1xTqyOBhriE3IUd3OnRz/DK8owpbqv1AMZmH1rA+MUD7uA6sqU2fYL3/YRO0Wh3LaATnjAnVAlqXKYWm7fFcSUoKTFvBT+KBU8zfcYbXVzeGMDVyp87ff/63oD6CQcFLmyq/Gz5qkVd/5BuwEVjitNx7mPDhN//pTktCt73JJ8ljfUKpSwWvXaTROCCLRlra/f2YuxZapmUBZrnIGBovOQ/L4dfeQyAe8OfuS0fXNgJK6/fWjasZhTu/mmlTJRA1g18rMtlr7VHycDYEnGQj99WcR8N5SWj26vCbej9NG3/4nboqcMgFDTcgulY/cIqHK4/gcs5GhMeAZ8x49ynyO5F8n+y8FcCXnEiYEClWi0tGsGRUmlSJVQvgBwRu7fY1eEf/7YcHBtbmNFwlRih8RSy6cTJZNNmeYvVPfjkQ8mFBq1SVP31DOVCf641eeBxp0LexmsnTn531zSM0PXKCi3c+Mgo9YqlzU/eP6RLn1J5yw17sPT2NxkuFiz8CtDjAwNmZYo+qaBZLttR8KFtJ3r9H+6sjDcQK/ySBuEAwK8TgCj7EJXj8QWNaQg7lEb7lpqD4o87hmRcVV9ykQX0wyKoBcXxj0TMUtOsgNGI0a6VwIqhNMmBaC90diH5F9rJyVl1ilrfdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpjVC8xWjBmVGdCbmp5Z1BZcVB1c284bjV6dXpCS05YZEsxczhTQ2p2MkYv?=
 =?utf-8?B?aDZqb2pMSUJuMXJmeTBPWmhzeXlML3hsQzhnUVJ1K1ZEV29abjNqRG9vNGZh?=
 =?utf-8?B?TTNDOENzOEVmR2U5cERESGU5bTJHK1NEOHZTekh0VllqNjM2c1JwN2M3NkFj?=
 =?utf-8?B?N2IzaGQ2V2hzZG5yRDVqSVFVQWwxMi8rRlJ0QkZlWFBVNzZCOFJsalErZ25Y?=
 =?utf-8?B?SHora21ML2Rnc3FjaXl3WkJQOFFwdU5OTThNZEs1S1ZnVE15K1lnNjRIeFN4?=
 =?utf-8?B?bElWN25rV2hZT2NPOG9qUTF5NDZhcGpPMys3aEdhMXZ2RGliNWV5T21Wa2dQ?=
 =?utf-8?B?ODRlaDRsVTc3Z3pBczNPWFZadm8zMWdESm1DZmJOWndUL2I2UEU3UzA1UXdn?=
 =?utf-8?B?WkdPRWhoV3I2L0luNDEzcW5FcHVFbFl4WmVuSzc3RkxlNkJwYUtOYmNrQTJo?=
 =?utf-8?B?dHlVUEZaeWpzdEpoR1BYQmFkL29ORUFxWFlLK29NcEE1Y2dpVFVGS1ZxMDZv?=
 =?utf-8?B?OXBYeFdjUEVLaCszWm5JVElRNDZFbVdJNXdCVW5oQ2IrQUxxMTFyOTQzU2Iy?=
 =?utf-8?B?aWhSSmhUMkpaSUxoSU91WVQ5N1NnYnNtK0ZqQmFyaTZrY1pFSkZ4QUtNMWFk?=
 =?utf-8?B?UmZHZnFsL0tVZmN0VDJuanlnYXRlVXVsMkZpWnB6WHJKYmpSTFA3dy92R2pY?=
 =?utf-8?B?amVtUzJSNEZsVlBmcEd6VnNXSURDdi9RRHRJVjAva2xPR09zQ3Uzd3JRdHZi?=
 =?utf-8?B?Mkl4M25VRkNFN3g4T2lRaUtrYmhvdC9tZ1llZ1hmendobDc1WTBmZ212dVJX?=
 =?utf-8?B?Y0ZuOFVKcXNZNnorTzM4d2RMcFloV1BvWVlpOU4yNHhVRzNLeU83Ri9wenNq?=
 =?utf-8?B?OW9oak02LzVlei83am5ScEg2WFdpOVluWmNIQlRIM0VpOFBYRVhTd0Jpb0tX?=
 =?utf-8?B?bkRWOTFrZHhmckZkTlZ0Y2VDWUV4djJIQkVXUGVlK0dnTHZTK2xxQlBYYzhI?=
 =?utf-8?B?ZXZvd05Rak9XT1RYTUdFY0RxR2ZYZmFoK2xBZnYxeUxuRDNwdjJ6Sk1JZ3E4?=
 =?utf-8?B?aW5Zb0NNSlRDTHNnbUI5amRIYXBNa3ZGaTdYODMxdjFGQklISUkzNHJIaGw5?=
 =?utf-8?B?RjJRZzE0N2h0SEIvd3lPWlBZeTdId0F3UUowZVlBWFVXdG96OFQ3Wm02elZN?=
 =?utf-8?B?K3g1NVBCQ3hmM0VYd2ZFLzhKMkhRT0xCdUNmdzZ5UHBWTzlCVG85M2xxSVdw?=
 =?utf-8?B?c3NuWHdwSDdiYmtqTUF3YVFqcllKWk5zRUtBQ3Jjc3RWZlJpeFg0b051dllq?=
 =?utf-8?B?YXJmM3o3QjFQMmZ1alA5UFk0MkpyWmxydUdnQ0tHTGlMYjJTMmdwdS9ET0x5?=
 =?utf-8?B?eVZGTXB4M1lpcWNyYU5iTFcvN09lbjlYQTFZQVQ3ZWxOQjNYS0Y1QUh5Y0M5?=
 =?utf-8?B?cHl3c3VtbVFyOGZLZzFXTGJCeWpZSHlKWmpJTEYrTDF5aGovNXB5WHpKeTF6?=
 =?utf-8?B?djFGdHkyTnBRbTZMRmZ0M0U4RUZ2d1J1L3ZrOE5zSy9SRVlOU3Vnb2JmMlpI?=
 =?utf-8?B?T0FJTHRLckFwd0Ntc1lsdGlMZzU4YW9lYkNReDg0RGIvTzJUWkt3MGR2NlJx?=
 =?utf-8?B?RDVLeDg3eE1HaVZZOTZaQ2o0UTNiUVpsQXJhM0E1UmMweUVDeUhBZm1kdTFt?=
 =?utf-8?B?bU16cDFRa0lxVDFidVhwN2x1czhTdmdPSUZDRFo5WG9Kc0RkcVYyTk5BVHJK?=
 =?utf-8?B?YVpiRE56TUREQ0dBeDBIY0dWTUJFWWxvS2tua25UOFFJSWIzdFlvcStNSXNH?=
 =?utf-8?B?NzVvalFLeXdhTlNicEh0eTB5d3FIb2ErMEEvdXpMcE9lNjdDYVZsQUkzWDNF?=
 =?utf-8?B?SWFYdHpSQTZwL21zYVRhWGRBQWRHWW94cXJENjJzWHJ5QU9kcGFodkI0Q0lt?=
 =?utf-8?B?cDFreHJQeWFVN1ZYTTF4OSs0dmx0d0FudThjZVBtZk5PNnQ3V1hnYUV1OHRi?=
 =?utf-8?B?Q1VpRUkwR1dwSFMrc2V6UTIxUHd6blg5bjR4TVI2NEE3SHJhbHU5Qk90R1BP?=
 =?utf-8?B?TlBJVG1ocEEySkl5VEJEZGRYSnhpNndNNnNrYS9venluY05peWFMcW9saTlw?=
 =?utf-8?B?M2ZaNkhsYVVFS3E0UWYwZEVaYlNVUkFCWk1kekZwZG5hSUtYYkE4TlhvTWUv?=
 =?utf-8?B?U3R6M1R0dHJ5L1AvZGJxOWIzVGpLdjhmUGliSmVrd1cvWThRcHR6elBYRVdI?=
 =?utf-8?B?Zll0bEFIQ0ljcVRqV0JpdFpWQUhLLzBITVR6ZnNKSGxhRWxoVVRLQXR3TGZV?=
 =?utf-8?B?VFNreXhya1Bzd3JaS0lWUXpwSS8yVEZIUGY0ckY5WWw2N1MzRCtxV1BxK0NU?=
 =?utf-8?Q?zrdv/wGE2qBRB9sdoAZxuMbOTXjCiH+1oLXbse/a1GB/h?=
X-MS-Exchange-AntiSpam-MessageData-1: /Vds1DamxMJWTA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835da656-1804-47af-b4fc-08deed36623f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 05:58:16.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwbTzcA6JCb+Fn6PViOYNUXGqv96zes8aBLrnNBNX64kcYV575JTsX1+K0vBBoBFNbltVoBAbL2Ish7cUYG4oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891

On Sat Jul 25, 2026 at 12:06 AM JST, Yury Norov wrote:
> On Thu, Jul 23, 2026 at 05:59:09PM +0900, Eliot Courtney wrote:
>> Add support for reserving of ranges of IDs, with a usage in nova-core
>> for channel IDs. This entails adding bindings for the C bitmap
>> API for ranges of bits, then users of that in `IdPool`, and finally a
>> user of `IdPool` in nova-core, `ChannelIdPool`.
>>=20
>> Channel ID tracking is needed for allotting ranges of channel IDs to
>> vGPU guests, and later for regular host channel ID reservation.
>> nova-core needs allocation of a contiguous sequence of IDs with a
>> specific length and sometimes a specific alignment [1].
>>=20
>> About the tradeoffs between different data structures:
>> - IDA/xarray do not support allocating a contiguous sequence of IDs
>>   (ida_alloc_range() allocates a single ID within a range, not a contigu=
ous
>>   sequence).
>> - A maple tree works, but is not as good a fit. The ID space is small
>>   (limited to 2048) and aligned allocation needs an alloc_range()+erase(=
) retry
>>   loop (plus a Mutex around it, or new mas_empty_area() bindings) that
>>   essentially reimplements bitmap_find_next_zero_area(). See the maple t=
ree
>>   version at [2]. For 2048 IDs a bitmap is also considerably faster and =
smaller
>>   [3].
>> - The bitmap API natively supports aligned contiguous area allocation
>>   (bitmap_find_next_zero_area()).
>>=20
>> This is based on drm-rust-next.
>>=20
>> [1]: https://lore.kernel.org/all/84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nv=
idia.com/
>> [2]: https://lore.kernel.org/all/20260710-chid-maple-v1-1-4ee869055268@n=
vidia.com/
>> [3]: https://lore.kernel.org/all/20260717053241.916441-1-ynorov@nvidia.c=
om/
>
> If you refer my test, I'd like to make sure you've reviewed it and
> tested in your environment. Please send the appropriate tags.

Have done so - thank you for your help in benchmarking!

> Also, would you like to add it to your series? I can to move it myself,
> but I can defer it to you if you prefer.

Happy for you to take it yourself unless you would prefer me to.

>
> Thanks,
> Yury
> =20
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>> Changes in v2:
>> - Collected Alice's Reviewed-by on patch 1.
>> - Address Yury's comments w.r.t. using __bitmap_set etc directly.
>> - Address Yury's comments w.r.t. following the C names
>> - Additionally check for an overflow case that causes a hang
>> - Added more info to cover letter + patch 4 w.r.t. channel ID allottment
>>   requirements
>> - Add align parameter to ChannelIdPool::alloc_area() plus an aligned
>>   allocation test
>> - Add missing INVARIANT comment when constructing UnusedArea
>> - Link to v1:
>>   https://patch.msgid.link/20260703-chid-v1-0-84fe8259e46e@nvidia.com
>>=20
>> ---
>> Eliot Courtney (4):
>>       rust: bitmap: use function-level cfg on kunit test
>>       rust: bitmap: add contiguous area operations
>>       rust: id_pool: add contiguous area allocation
>>       gpu: nova-core: add ChannelIdPool
>>=20
>>  drivers/gpu/nova-core/gpu.rs         |   2 +
>>  drivers/gpu/nova-core/gpu/channel.rs | 182 ++++++++++++++++++++++++++
>>  rust/kernel/bitmap.rs                | 242 ++++++++++++++++++++++++++++=
+++++--
>>  rust/kernel/id_pool.rs               |  69 ++++++++++
>>  4 files changed, 481 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 71d4e7233f235871b13553e504e591ace6b54373
>> change-id: 20260608-chid-18fa943c6d6c
>>=20
>> Best regards,
>> -- =20
>> Eliot Courtney <ecourtney@nvidia.com>

