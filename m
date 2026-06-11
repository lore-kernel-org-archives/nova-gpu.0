Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92D48B37F
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203220; cv=fail; b=i2cn/W9W+8MPJ3a6AT02r2EqKz8qI3Xomrzvm6Bvy5abKygtrdl8n0q5FtdpLNLICpvEaJEUkOqTl1GcyLatHVIJTrI6VyBXAG+DVx6YwQTLp44Ykg5VKfJfnEtNCQ0LjNAIIvzFuIOL36L8awJOgo+6Ac//sEN8TeRDgMOZpBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203220; c=relaxed/simple;
	bh=UlkhOlcrJPnJGUPpLuQxcFcYwpH8tn0ebV7+XLHDPlE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lD+gtVfTxE0OicaVXVzT15nIqjhgCSC4U1RGiFfjCIq5S0KwiIdpj2zPkuPL5c5un7QdSXOLuHlu1rEhQFixQF6bf1Yz8g7KT72JhU2FE0+EyxO/+Ydf5d10hXKs+Zn/2xLifD3GIH8ZpDWioSyopIWCeIJwOLUyOl0T0BDms/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SF5AEJ4G; arc=fail smtp.client-ip=40.107.209.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SF5AEJ4G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtxqCLjLTDkwzUmiDGldsraN82VKxp3KdwegVuQWok6Q3mJhKfeoTd0NDdDHeNQzTTecHYYDfICAKI1euqD4hzXVgQtHjAAXEE0jkKadRfoCrDZXInOPQWgrWRk6jQv9+AgisGV4+2KZ8K5ofg1LLYwd1URVW6MlOS3WJ+/YSHXUBkoF73cruls+KfY2LBaksZE9ySVqJTtZc1TlNKG6e26nKztnEB03gr2RLQLu3n5MoI5lHP4sbu34dPXhdBDQLSp8lt3gZMH0K0p8GF2MZdfq8FzjAQytuAzq7G8OTdExRbv10jYbo6xllxP9MQq/Ywr5R/YY3dAB0bwgMt0ZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaiD/6qii6cJ0h0PEYqMw7LYkn8QrDpkdBzFW6JBgwg=;
 b=MetmjUKSToXlpoayaxH0HgayGzBP8aKof2f7xOWhqQVLsRX4eFCyretx1JU24MLjsAB87ZmZ0TQ+6MMQqsDfLm7m4W2kOeKmydYWaKx53XoiPS+2eAPhVKPoTrRIweC3V9kNQqCg5deYVlgIVQcEkLtH5FDgD57uFl8vUTHPkKFZUN/SOBbSJjdDAqAII399gnoKZJSPslGO/pupojzm3taagVWaTmGNtgZ/08Q4pbmlI4oIaJt/QDFLLCyeKVkqIdhudjmkA5s2zua9/Ju76i+O27eGmfpZzekWs2iHPZ5UU+812dRgPe1u3AjoaLYreB5Q+5YVnQdrOmWcHN6YyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaiD/6qii6cJ0h0PEYqMw7LYkn8QrDpkdBzFW6JBgwg=;
 b=SF5AEJ4G4SpzhC3OpRryNeJ1fL/EHMp+nw6le+3jeOl6ak4DlA8NC9N9Q/+0Nio+AJil74HMhlCJ5AR68ovhlShEPQzhDarkvXK7EoipUjMZF+iNz+eeVP24jIdbjbZ6a/KNHXnsBXKOFsHb+ylZtRbRmbBqued3XFS09e24TeLeoKLqfRwWtBK/jq70La9W0vtFIH61GgjLgWjxJmyJHkzcS02lO4x904zqezFzebRaNc8M54GH98SQmpf5OqbpFaR2H4rmHWMnMDet6ESN5mFKW/phQsKiCwndDXIZIAM2BJ4cyBOu/WQ+jDQA+ZGerAaPj8J2u1QA773jX3sMOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB999228.namprd12.prod.outlook.com (2603:10b6:806:4db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:40:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 18:40:16 +0000
Message-ID: <d2c4bb21-db0b-40ec-aa53-c1c68ec3a049@nvidia.com>
Date: Thu, 11 Jun 2026 11:40:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 nova-gpu@lists.linux.dev, Eliot Courtney <ecourtney@nvidia.com>,
 zhiw@nvidia.com
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
 <DJ5Q9J19NVQO.15OGQVSCIKO06@kernel.org>
 <DJ60RSEY0KDF.6DPM9OTEHPC9@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DJ60RSEY0KDF.6DPM9OTEHPC9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB999228:EE_
X-MS-Office365-Filtering-Correlation-Id: 4082d8a5-a731-4e68-5be4-08dec7e8e190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hSqMEAm6pBwyjdNedO2jb7i8bn8PJ5oi2rnAH1bX0rnGt+GNCXl0JRjAC2RqTfX2NouB8HpcLstsesG5YCBidct8yetrSlpJTsy+NVcuVlKAhVsRzNRcoENfSx9X19+njoq7BxO1svR06C0QTN7CjdsLbkPhRJZWs4Q6kM7pcUtbq4AlwM95Shr+HkefY4hIDu+Bk6zJRgee+T9XEZFyTqeNXgcoQNDKlWt8JZHl3npZqJWUToDtNj627SwEX6UXUeF1gqqyRXOHxIx3VYJ0K3nCAn4NLyAgSLXtkONerb+9AbnsJlS0yoIedBWtKpFWB9rBza+wR+rPgDqQrbGAasoJu9KDH9SaecDIKzIi/H0s4WZfH92Gm8xlFv+Ua44EREzIJMCgzCZuTU4xFKkoluaUOb0tGMpxV7wtP2lc25lDq94UTK5Ze3vHv+QY8Dx9Uzn5W5Dy4RAbHweF90NOILrbSAgRJ6RK5OkrOcsVF4OetD2807uVnyN3SNEny6mmt8t18zOX9vNK2Vhfs6gMRQ+wDguDL0b4eQM2Lokp5VojcC/g+Oy9nWxkNyuF9jQf+aT9bn7lA8/vc5MhBsFWVYHN6DqdAj/hco8be+3gZjs+PJuk1OF/hZ1L1xr2bk9zLODxP2UbObjBC8tpmKD5HKZFzewIs9fgURtXuz050f0XJru5zeeLbY7oBDBNhCAj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTJUc1QvVlpac1VVVGM4Q2tVVnp3Tm9xbjAvN2dpck56ZW1JbU1oTGNwRWxk?=
 =?utf-8?B?WVZwbWRoR3VJTjZCNkszendWMUhxVjhJeUl0OEw3R0pMOWJzODVMUEkzbFFJ?=
 =?utf-8?B?Zy82TGtUcHNZY0tLdytzaldXbHRYNkZzRWY4YUV5bGV5cVg2eWxSZE5ZdjJa?=
 =?utf-8?B?QUlFcTE3L1VjUVU2RkxHOU1HTWx3VHI3aWR0bmo1NnB0d2w0V0tCSE5lL1Nu?=
 =?utf-8?B?cCswbmhMK25ldkZEbHh1Ukd4ZDBVM0ZieHRhWEprUC9LcW4yRFBYV29WZ2x1?=
 =?utf-8?B?MmpHM3JNNkV5S0poZHE1czI4RWFKQVV4V3NDQmN6dkVrOXdJZloveVZJSHVK?=
 =?utf-8?B?NlEzbFVUQW54THRTNUNOdkM0QTJTQzh1Wks1WEJqRW1UYStNQ2NuNFFqUkZx?=
 =?utf-8?B?SEpBREFvTkNTbHFsbWN2TUdqTFdOOXZ6N2dNLzdnbXkvd1VOQnVYWXk5ZFkz?=
 =?utf-8?B?RUVlNzlmcGZGQXA2eHZtZEdiWkp2b09qd3Y1N2JWTW56RkNGOGZJckhQS0hZ?=
 =?utf-8?B?eVpHbWQvdUI5V3pCaU95eFRycjFZMSt1Y2ZsQ1M3ek9wNzNldVFDU0pRQnIw?=
 =?utf-8?B?Ujg5eTk2V2ZuZzJiekY1S0luWjM1dGpzYnlMYnlLNlF1SGJKekJHZzBRa2hU?=
 =?utf-8?B?TWU5d2p6eDVQeWlyMXEzS3NBUWkyNXV0S0RJR1E2U2RuRHFPNFN4a250a29B?=
 =?utf-8?B?SmRHZEFJd0s3bXhqcjhlWlBBM2Z6RVVlWnhHMGxIK091alBjRDczWmVTMnlp?=
 =?utf-8?B?UGZsMnZ3TE9JVXNsQWtDTjlNSXRYOUhVSmRrMU5VeTdjQkhxVmZra2FWQzhn?=
 =?utf-8?B?WDJLeUJRdUkwdTVFK0FUMXUwVEhicVc1dWEyaXVCNlRxSjJBK2VqV1VWMlpU?=
 =?utf-8?B?ZFVweWN1STRvMjdtNEZweUdTRTNYRHZYeHA1Sm5TZG94QitOQTgzcXkxeU5N?=
 =?utf-8?B?S1VYYjY3ZmdZMTZreDUxcEsyeWpDRUFLTmZUUXNmcFY5TTk4VzkzUFk1UjQ1?=
 =?utf-8?B?Yi9vWCtOcUF6L2lYMmZXNU5hNnVNbG92MlpPZHhxTjEvdmdHdzRqUkFKRWF3?=
 =?utf-8?B?bXFFNHpFT0prSWJaYzVpVENHaENQenA2SVlLTHM1VDhDNlpNUk1GL3RBMEhh?=
 =?utf-8?B?cVdXTnR4d0NDT2pGRXQ3RWZhZ3pRWStYV0pmWVlHQlRWQjdFRC95dnZJVXB4?=
 =?utf-8?B?NS9taWZGVHJQWE8vU0VRYUQ3aThJdkJwVVpYcXp0M3R2c1Y3WnhSUTU0VkZF?=
 =?utf-8?B?MWVrd3M3T2t6TWttdHRCZVF2S3hhWUNoM0xDL1VHcVMySXM3SzNYdnRoejVR?=
 =?utf-8?B?OUd5YjMvcUsxT2xXaEV4dEdoMHJ4VStIN1dCMSt4c0w1aWZzcitkWW92QUtC?=
 =?utf-8?B?VDF5V2ZYNVJSb3NCVHlpM1lLYXRzUm9NbEJkT2RPVEdaQkF0eDlvMVdOWTlO?=
 =?utf-8?B?RitKeDUrNzBxVHNxV09yUFhCS1ZPbFUrUjJQVzU3ZHM1anJQYlo4ekVpYy83?=
 =?utf-8?B?bUY3NXBqdXlRR1hsWUpIaVZRcVR3Q3l0UTI2THluSHEyUWpzamhrdm1OWGt3?=
 =?utf-8?B?Tm9YVWtpV1MrOGJsbHdnTUQyb0tIOHVNTlkwRFlSVW5pUkFBNTByNzB2Mlho?=
 =?utf-8?B?WHdtQll5R3l3SU5oOWhaTWJ2eVZUNVFnaVRFcDI0ODZzRGVQYmd4OUJ5RnR2?=
 =?utf-8?B?dGxralhHTE1oZngwT0pSRmNpc01jcGhNTlhZRHJvS1JJOXJPa05iL1NTbm5B?=
 =?utf-8?B?Y0JxcUJSREt0TksyYTVzY1NndE45VWMrOVNGMEJvdWFhZ2xJUGlSdjVHbHM2?=
 =?utf-8?B?MGJOdjNnSjVZOWw5SnNSdE5takJ3bzhUNm82cEpoMWlTTXcrQlA5b1podnN4?=
 =?utf-8?B?ZkRwOVFENERqTXc4UFppRzJYcmFuTzJGRkszVzBDNmFyb0ZydmdndUR0UCtz?=
 =?utf-8?B?eGlJRERwaTlkdmR4cWV5TzhDbDlXVFg3RWpqRFl5Ny8wMndZUEZESFBxYTJt?=
 =?utf-8?B?ckZKSk9tRzJ2MytxNmg4djZxM0JGdXJzRFgvRW1YSWpqL0JSZ0RFbjR3ZVZ3?=
 =?utf-8?B?ekVmZkdIM2VSQmdkTGwwUEV5WCtWVnA5RkJXb3B4RVNjQXl4czRKY0RtaDdR?=
 =?utf-8?B?RnRKd1laYlAwc3NpK1loNW5IbjhLWFJIRFZ5QXRRdjFuRFdWQWRDWTFkaUEx?=
 =?utf-8?B?N0p6bExjTXljUnVMN3dCZnY0S2dzeDBhUmxsWjI0ZXpNTVRtMXdad2dOSHhu?=
 =?utf-8?B?djVkSk5NRVVxdGpKVVY5NWt2SHNRYmdpUFRXL01maTlzVkxlQlA0TmRYbWp0?=
 =?utf-8?B?citvK1V0dElTRkpnNWluRmJubVhrVVFKS3BMa0dra1ArdStUWUZ6Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4082d8a5-a731-4e68-5be4-08dec7e8e190
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:40:16.5541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQX7T53ydnH3cJYWdq5pN+vLPWtM/XLNwG92Hyse55DL7f7h5cbjdq0vL5fgd1bLUjRCwNcMDsiRU82z95LPzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999228

On 6/10/26 11:51 PM, Alexandre Courbot wrote:
> On Thu Jun 11, 2026 at 7:37 AM JST, Danilo Krummrich wrote:
> <...>
>>> +        let len_arr = <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok()?;
>>> +        let length = u32::from_le_bytes(len_arr) as usize;
>>
>> Here and in a couple other cases, nova-core depends on !CPU_BIG_ENDIAN, so that
>> shouldn't be necessary.
>>
>> I'm not concerned to keep it for documentation purposes, but it may be a bit
>> inconsistent with the rest of the driver.
> 
> While relying in the little endianness is useful for things like using
> `FromBytes` on data structures, I think it still makes sense to handle
> it in cases like this one where it is easy to do so.
> 

Ah no, we don't want to add code that is not useful, even if it is easy.
We should not have code in Nova that is "aspirational"!

Also, it's actually worse if we are inconsistent about LE/BE throughout
the driver, because then no one knows why the code is (sometimes!) there.

> Code moves, and in the (remote :)) chance that TLV takes off and other

Not all by itself. Some thought is required.

> drivers want to pick it up, this is one less fix to pick.

This sort of reasoning leads to over-engineering, which is of course
a sin. :)

Build things correctly for their intended use, and be clear, clean
and concise. Then if and when it gets promoted to more general use,
that's the time to make any changes.

thanks,
-- 
John Hubbard

