Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362E383C7B
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214728; cv=fail; b=iHWFq/wKz/x1UNLmRTOhaYrgVX/XzG9xdMLK5v35/Lf473XjwBlCAfIAysXtGoKfYGP/Wwt2f9fwq48dwouRg9J/uB0AWuV5IecGXcynWEFjosBdD/gQxEwp93uDeBx6yapYFRIwE79X4rs0mtuQ5u4Psb5mEvfzzxJD8GVR1jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214728; c=relaxed/simple;
	bh=VtmpWpIakXmJIV3l1igJL3d6yLNZ2D6HPmdUQSCaafc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jnORv8DaTFwgX4nksMPlvOMiF7+XjpSy+ceh0KwwSen3UX2wFrcaFljQK4RyxEQzkvNE6JlWL+iBF27qUzbTh9/RoEu0XMFjHbvQYnOk0lp9xKrps4PDSnGybT4vEC09ZEo+wFpaTqg3679fm6wAt/SR/3ZLAjJzwocPe0uoMYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z40HylPM; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z40HylPM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4zyIUWs9uPcQ4Uqq2757QuG7n7cHgKgNYShxwIBA/9+h0W+ALCgSA15vY0DbP7O5GrJ8VX4XC/49tZMcKJtUV3XWDQyzLAvKVpTcr9I1VyxmE0XJjD2axuJHhs0X4N2CkabafyWgpoda3uIAhSkUp2W1h+7NV0i7AVf0KVJVuUGEHZs4iPCyrzbB4CT4PWn4pcR6yXX+DGxy5YRa3hl/Zpn8pBI0+FOMIIfwveW7yPNLQEI+HytkTNM74u7OYIcTjHZJg9J+B03tlspoJUH87ITw0bqUa4IzaDuXEg/sk9R2JfG8Zp2jGTyMuEPNLSKtntWcRqRm7AfSFQbTV6fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqUg5XAMEOg3vQb3OYDoW6Tzvl5LYjv5yohONPd+FRU=;
 b=K99GRvoc8/pF9UfXwtDT+TlQHSRqMoZHWv0F1BUebvhw8qKYv2nCNDxFu3veg41tht4x9f58ToJLHLz4H+951oyHSHAdXkOdpXhiTcMUhCNyhMAC9JSujZJr7uzLyc9GkVFzn48lKrGqkTFYUmh8tw4xMArNQJJ4h2Ip0c/of0bvk2cD4LfIhHvwOOdRieG2zSif7Y/kUWOCDEqutqmRnu1HJOB+B+1Dw64Og1bpfhw0JNWNKaZDvCLaAisYDjDMJGmFp9Yio2KRetcOs7VkX4FGDl6SXC+BWMreaL0hwUA0b+n1RnX9nWr4LBrEkJkLeSjPQCp1uCJb3Z+YuFjHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqUg5XAMEOg3vQb3OYDoW6Tzvl5LYjv5yohONPd+FRU=;
 b=Z40HylPM7xgLh2Fk8H98euizlywcWkt11SsefgnWXCOswhW85iN1h4SFqZ01lp4DDRY7vpqX/M9XYo2efMmeMwZd9jfd4AAeIu1zLwfBt9IgNrHxWOMIVTq80fudti2QB2992JrURQbKMTUL7atMED2Q2+7Feq1oJb1UM4mjlTM2uBgnEprAyvyeR4sVdgG4NmfYN+hooBBSjs4nU0q6CiohZwcL/SynhGT2SBS6GNfhbk43Y07cHhKvNcP89ptP7m39iIfE7BiNxRmWeoP1/xO2B+aVECAb1b9y9kTsE1MgZokKHgKQo7cVBW3QN3xondWnoXBQqSYBOR8K8Zmp/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 22:18:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 22:18:41 +0000
Message-ID: <67b67e00-ca4e-485b-bff0-77b2499898bc@nvidia.com>
Date: Mon, 31 Aug 2026 15:18:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] gpu: nova-core: match GSP RPC replies by
 sequence, not just function
From: John Hubbard <jhubbard@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-14-jhubbard@nvidia.com>
 <DL2Q86NR6TJU.3ULD0NQAQ9HF@nvidia.com>
 <d6d3bcba-56d9-4775-9687-ca8e2a0c80ec@nvidia.com>
Content-Language: en-US
In-Reply-To: <d6d3bcba-56d9-4775-9687-ca8e2a0c80ec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6bda25-0958-4154-3394-08df07add056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	72dmsjppWmOkMC69MAGyRCgWHl7PVnFe5bh2pxU/vwBlqMPfLinKYOSblo6+ubgdaUSnvaFgmbRS/XR4PfazgzytSVaJEUABUKcsiH8HUZkurVatoZDThQKUT058cqqnHC65PIHGKyBcmIzczWjdr5gWwfx0sp+Iv1OE3FYhbFvX4e90Y/NZH/Sj9UAHPMkRaX3noSYe67l6XRD/OnnG/wsHHZk3vS6U7McNtFsqe+BMSZXcGnfFRnDOD8i+X+ftG4v6K7Usj8jC32RKDnVGWLNnIENtsZE5aIuWDgLm1evLkhyJvL4rGJTtmS4JTLSKJDDgnEfA3fz/Tutuea6kBWXsB2cl1owIyNSp5EhPiBuRzrp+ySl0yPiLcO6+Ejn+p7yhn+yzZgAravpBP98GhtlWRVmzNItokKFtiK9+P9dYdzZokVrM9loYc7rtIMzqulLOgEO6rj1SN97DdjF0CDSCioZhi7Fe0/r9VWyUybfsTu9Q/Z/KIeSkid7u4ai+ZNf1IhGCKisr0seTCa8OFW4j7QWq1GxDXDlI0dtQkGot6HVlGzj+H9nLE3dxc65b5HRGnV8qkePKyX4M+7E7YDp/JhDx964Lbi1htWWp5Or5/S/Qn7PoQR+IMhP53nvUUIQIzLeppS2/6u20fc95nH+SVgpQz32q869iAk/9wSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDFGeGE3NEMvUTlhNlpQaTNWRUJxUFpZR05MaFp1N3o0UHRrd3JkSlVxNmI4?=
 =?utf-8?B?d0wxb3JFeFJEak5OcGp5SGdxbGVkZUh2a2xVMklENlZySVA5Y0NETTBTTFVN?=
 =?utf-8?B?ZElOdlN1cmVzNW5iVlExU2FRZ0g4dGd3cnlQWEFBTm8yczE3THZWRkl2dmtL?=
 =?utf-8?B?c01CVm91a0FWZG0yMWRLTnNxVjlsWjFRNWZVcVYvR2l5UHFITzFwWTFnbkVK?=
 =?utf-8?B?bDE5QUVqNnROblFQL3pXT1dEVHdGczJ5OUtONTFVaW9BNTB3d1dReVZpTTRw?=
 =?utf-8?B?VmM2eXVPOVo2dnVJeStoOTl6L1RSMENraDZlM0Y4MmNYUmZNcGZhTFBxb0t4?=
 =?utf-8?B?QVlpYlMxdlVIY2xhS3NTcVhmV2NOY0JWVmxDRUhjdGdhTzJhTzBBbnlPaG56?=
 =?utf-8?B?b3EyK3BPdXFEOFYxODFDc2czTWczYlRrR3o1OGN5SUxaanNZdDh6S3Vyd0xO?=
 =?utf-8?B?aGtYdnErT05kT0Q0a09ZZmNFZm9MbTd0UTFyRTNNR01NbVJLalVselN2QWhO?=
 =?utf-8?B?NTUrWnJzN1RDb2hUeVdSTWo2MlNUUGl2UEJTZ0kzTzRIbnUwRWY4SXpxQ2dQ?=
 =?utf-8?B?eGN0NVIyNkRpL2xGdGxLQ21uL1dpL3lOalQyc1RabXkrdjJ2ejhUSDdjUlhi?=
 =?utf-8?B?ZFdIbjI4WFNRaFo1aUFITFVTTkZXUXZyWXUyZzRjcEpwRDhPMzR2R2kzOUtw?=
 =?utf-8?B?d1d3SmtFK2prYjFLUnpPT1RWUUM0L2FPS0dsQnBrRy8zOUwxK2NnbVdjZVBI?=
 =?utf-8?B?MVpKWjBtSEUrWEVmellYblhmWnMyOS9BUTZvNlVlWC9lVFY3emd3V0NBNDh0?=
 =?utf-8?B?UXArSzAzZ1l0UjBJY1BORVhWa2ZCWllwYU4zTzl6M3dpeU1aUTB6RkE2ZGI4?=
 =?utf-8?B?Qjd3WHpzL3pRWFNmSEVPNW9ocnNCbmVuWjhzOEdwU2tPM0RobTQrVnN3Z0NP?=
 =?utf-8?B?bTlTNEpuRXZtU1dTY1lhRG1mZTcwQzYwcHhOZitpcGtkZ013c0NFNCtTdndV?=
 =?utf-8?B?cS9SclZ6U0N5QlZRMCt6VHBSQUV5WHN0ZnVaSGxJZ1J6Z3Uwc3B3SFlHbzNU?=
 =?utf-8?B?M25BV2lFYWQzUnhwNGJ0Zk92Mk9zRnNpUmNWTzliOC9yUTlYZDJFckdsMmp0?=
 =?utf-8?B?ck83U0h5VU1GQklMc1JVUTB5ZWZkeWlyQTh4VThIVk5SSWFrWVpETlZva2tl?=
 =?utf-8?B?YzM5Nk9lNFZwSTNyamJoSVo1TnF1NGV4T0lYK0tlaDhnSUN6QWJxeUJKcm9L?=
 =?utf-8?B?bkNYOWRsT0VlQVlIVk9VU1R5U3dDZXl0eTA3d2xxbjVidEhxNkhBank0NUdG?=
 =?utf-8?B?U255UnYxb2IyOHBCUzJmSFBtMGt0NHZMNjA4NGlLWjZtR09FVkphRXc4WVFX?=
 =?utf-8?B?bFNTUEdnclZ5eWJZNEZveXo3bjJra0tDeHRrUVVzMGlBV3RQMG1SWWZHNm04?=
 =?utf-8?B?Y252VUlURHFRaDBQKzJQNlA5ZHpNZ0dPUDF2UC9EU01HRHVlOVFCaHJTZXdx?=
 =?utf-8?B?OTdiNG1VMHBrYzF5eEVSVnJlL1hISTdxRG85KzdieUFvYThLdkVhbmRSVytv?=
 =?utf-8?B?NTFrYndocThRZ296WkJoMXp5TWVkSGNJZlZ2VGhYcWo5MVI5NytXbC9OVEsy?=
 =?utf-8?B?UFdqVExtTmZ0Q2xHYXRtZkUyeWFaR0V6b1FlR01ZNVNTYVZRMDRuMFY2a3ZI?=
 =?utf-8?B?dTRkbGM0bzdQdzdBbDZZT3RxMjB3R3ZuQ1FZZ3M0dUxibkIyYmhsbXMzanNQ?=
 =?utf-8?B?bHJIbnBiWktEdXhydGVOMkZCL2ZYYkl1Y0pxNG1FMHNQTWhVMUwwOTJlNVFV?=
 =?utf-8?B?UmE0OWJiUDFnRWZNeVhNYU9lQXJSeVJZWVZMemlzRURwNUJsNW9VdkV3SWRL?=
 =?utf-8?B?KzBhRHNXMzlaU0NFRlhObVBTKzV3SkNjdGZVbXJyTjdYSTVadG93aDIxVVNM?=
 =?utf-8?B?SnQrYXU0eEtQU21od2I2TjdMSzdTUFU1ZlJSOXZSMWlaMTV0YmgrczFUZDI5?=
 =?utf-8?B?STNqS2JjM0ZsdjZqbGt2OFRNL0hpb0hRQjBmdjV1bW03bENWeWVsWURsbjZ1?=
 =?utf-8?B?KzhYRzJ2YU4xODNlS3Y0cnNiYXhYTXdobzcvYnVCVW5OL0xrTG5uekh3WWEy?=
 =?utf-8?B?ZjYvUVFUbUFabHI3SnpIdXpFMVdCd0dFY2QzSUJ2cklUNWVkdXEvbzZsWWlE?=
 =?utf-8?B?K2wwYWs0L0lZTllicUN0YW8rY0UyUjFnc1k2YUE4bnVEUTFrR1RtUkdOeFF3?=
 =?utf-8?B?ZUU0RnFqS3dEZ2g3ZEFoNFlXNjhtMHFpQ2JCQ0JPMVA5bkZUVkduOWo3b1Qz?=
 =?utf-8?B?YkZWRUFvWkg4MjdhZ1VHejl3RTN0RnI4Rk42K0ttck1GYWdFSmdzZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6bda25-0958-4154-3394-08df07add056
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 22:18:41.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOx7NvqxcJRoE9W6bHzA20FhPm5txdPbKPa3Ibgq0Y6nN5CrXz6T5X2FiMIZzE0568vWU1/aPwyad9dRiF9ERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473

On 8/30/26 9:33 PM, John Hubbard wrote:
> On 8/30/26 6:09 PM, Alexandre Courbot wrote:
>> On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> ...
>> So I am particularly looking at patches 8-11 at first, because it looks
>> like they can be merged ahead of the rest and are useful on their own,
>> but I am hitting an error with this one when unloading the driver:
>>
>> modprobe -r nova-core
>> [ 3333.123171] nova-core 0000:08:00.0: GSP RPC: send: seq# 3, function=UnloadingGuestDriver, length=0x58
>> [ 3333.148123] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
>> [ 3333.169449] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x78
>> [ 3333.323550] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(UnloadingGuestDriver), length=0x50
>> [ 3333.323551] nova-core 0000:08:00.0: GSP RPC: dropping stale UnloadingGuestDriver reply (seq 0, awaiting Some(3))
>> [ 3338.124152] nova-core 0000:08:00.0: GSP shutdown failed: ETIMEDOUT
>> [ 3338.161317] nova-core 0000:08:00.0: failed to unload GSP: ETIMEDOUT
>>
>> It looks like the GSP sends the UnloadingGuestDriver response with a
>> sequence of 0... From what I can gather from OpenRM, 570.144 doesn't
>> match the sequence number, only the function. Maybe this needs to be
>> part of the r000 series instead, if that behavior is only expected
>> there?
> 
> That sounds likely correct. In order to test this, I thought I was
> being smart by using the r000 as a base, but of course that seems
> to have led to this test hole. Let me go fix it up.
> 

Actually, my existing tests pass with both r570 and r000, but the real
problem was that my test suite did not include unloading nova-core.ko.

With that test added,  I can reproduce your reported failure locally.
Debugging it now.

thanks,
-- 
John Hubbard

