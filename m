Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55C2DF717
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284632; cv=fail; b=qc3rajNiNA39J+Gu6QT8fs2Au0DypQDlPQcFrrE2o62edG5OzBkxL7I0dCLiHxIBAkW65tbxYm1i7P6HSsv6xG678KJ2pkLG39GzQzUfeMaNqthpm1Y6JIYi0QKA7FmLQZOLbSbOVrsEtIItG9llCSCjhmVu5wRIRepF4QGfCTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284632; c=relaxed/simple;
	bh=jXtHw+7holDtoybJTClw2F+8Fa4JyJ3eW5ZvrfbhLJY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mC9SBXt6cTmWCwxA6t5o3/xtsgcyK7PqYwFj3rEG950hy6t/AaDpjnGEb5/51DalskHz1D3RPngPxqSVSRxWhQKgd+X8lHlTTkHytVH7Gi0Jt2ZsJ71AmmfxOh8754sVgyfjWVa/vhGAQLvMOVxaHLIWfUaBCO9o6kzbOUygmn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gYNIlGIX; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gYNIlGIX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpIaJUyhcWcLFVfB5khuxfJA+j5VLJxlfy49kO0oqHSh1MZMcA4BIAA5/GLBbuSSwB3MYLUjptLTawS2GSPUiXG9y3UUoNyC/FCxuTUSJ9SwyLBPwcO9vHFqw/OrNAG9dVTAftD2VO1R9RO5+d+XqofJpvZPdMNlK1FrKGsPEusU844VH8mUK885Zf+n+OAkaqoFGieRQw0qR6ivBb7Q12oXImtAKNgeypI2StDFibTTWgqasL1q1TG32m4z6cYXbW1+HxIMhH6U1RGOlfH23n0O7RQ2oeOCkwFwrqJMdybC/HrcFDq0gbFsOR6ldh80fO+cpkV7pys5uCTmQx9gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXG/+RV6ED+YUNKRYwdf/gCpmunk6ts/DRjXp0eGW5o=;
 b=Xtom+p1qOPzkaGPT0Qa5GknocqhyVc8RRwJXGqkmsTOu3F5Hb6RklhzD43MscWz9kdeiQkxsOoWcEbhO+RI6nv3/6a5MWcFLsXSyfAxRMRgw6zhdd0vhOWbaQcFVX8TxrkcRm9NaMdYl/E6mWFv3aIuDmwNWNN5ZYQ4PF32W0QJyl/EXGoxNxPv/fBB6mj/nKvV/nSwbQe/fxdnuiCBu1GqvTdbxATDAgVSrZBUbDWXxTG7jGxiUlcT0MU1sSnIUIkE9u446GY7rteHCH8qEI7cxQ06uniFDUPSa5c3R4QPUxSn0YHvbioOFUx102cK9RrixfcPoDVz8NgfHxKNZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXG/+RV6ED+YUNKRYwdf/gCpmunk6ts/DRjXp0eGW5o=;
 b=gYNIlGIX/FGo4BJToomOcWlhfwTXca1fJQUeNbHKCcaLPgNf8CW8Diz2hwrxbB6FkXnp24r8HhkDwz6dEPu8CXPE6SjVQ+6tLqg/lnkDDzVGL6xzcGsMe/OFibLjbiRvZb7Zrvk45cL1hx3hEdNVz8kTHQ6LjGawcZaBnB8DXX1lSh11bORTudQk6wHnnQ9t5rAmrdHR/3d3X7Gh68hm0fhA3nd1gqZL+6MiGYOkU2lqzUKg3VF7akY7lNE4gY95fGXvhMsJk7ypNQNvjZyTLeB2i2jIqCsIiM3DzpAyKop92jDfCIr8Wrg+5IexPQ1fUQSr1pwVebuKENM5Qhn5Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 17:17:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:17:06 +0000
Message-ID: <b51cd866-2224-4f3e-93d5-d7c4288bf2bd@nvidia.com>
Date: Fri, 12 Jun 2026 10:17:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alistair Popple <apopple@nvidia.com>
References: <20260612040420.121499-1-jhubbard@nvidia.com>
 <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
 <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
 <DJ777VLZB7BG.1DY1X4UOS0MWJ@garyguo.net>
 <f00293b2b144ac264bcec657429492ca44f99c84.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <f00293b2b144ac264bcec657429492ca44f99c84.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bf7180-19b4-4bc2-f923-08dec8a66d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|23010399003|10070799003|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dwjV1Bz6VxrrIB4Gik4r8479GMrKvti9gUQBuQzozuiexDMCC6F58The11we3VkyvNPj7AGKjsDiPxR2P0mEEECKmcJeWty31kIClHGOm6afA6isyzHKgIMaGL0pPROlIChqX4m4JLan8+Hdoz+QgW6vJgWWDzH3SEv/+kOybcTD8XvK2fKtN+0KlAQf5M+8xzIKXHzGe86MRo4g0o/gL3SgBpEc3/UdOi9cwScz1uwU8k7GJP/PcmYbv6bAZKBbmexaUIp6uK73wiC/4EmgBZpYUD1aixRdYigP5xV7MUIRNLM09OcIolnhrBu2UY5WE/jWNEgp0emwt6T2yVLwIrrHVnwvwLicPqx/oKmYrRJuPxbZmyfeHfZGvZ2LvwcsPsMHFUw24UVUTrQgilG+7Pxx6XYbHY4F7y7HfosTTeop+31jR8J3d7AQmd0DgSGsDtrdi4OfKkw1ZH7w6WqlLMFo5S8ZW3ZDooYNSSwkxKElCmOoQ4majWIkJK/C9dehrKeBA3KeMuPqkBeOVPU+75Oeaym969FunpJqjDnXdIghPcG5EQfTxSC2bn3KlVX4pB0JGXxTFZa5hTtXNS+bx71prL1ity9hCg8Sy8Z4SamTLeBT+uxr8a/HihbBQ0zzbLJ7ssscDAmko2BAqAWJjkxj8I2IJ3WLP8zfNU8a7nkIightHw3LMqoZ4LewG0yx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(10070799003)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGt5VVNpMnRUVElXWElUQ0pqWHkrT3RSc3h3VE4wcm4wVm4zMlpCVG96eDZB?=
 =?utf-8?B?bWh4NEdZU0NvdEVOOXp5MFMxQkRrMjRNbUNsUDNKblVFSlZjdUtOeTJjUnNM?=
 =?utf-8?B?TWpQRWhlMHFCRVZuN1ZXOWtMK0w5UW9CWkwyRXVaZERZQ2N4RGZVakFldXRX?=
 =?utf-8?B?S3VLNmNTODNhNkdwZTkzNkFyWE80c0JpbU9OcTNWL3RmdGltSlkxditneC9u?=
 =?utf-8?B?dDk1V25PUWRXaHFnYXc2U3RyWHd1eFlHSHY2bzRGeU16cGtWbG9jREQwMDdm?=
 =?utf-8?B?YUppdVhpd0Fla2k0SHJtY1VGUjRIZ0tuQzY5WnlONjg4ZTMzcG1PKzN1anRW?=
 =?utf-8?B?ZFRVTm04T0hPY1FlYWl5amd5TjNXSXJLUXQramhidk5Xa0x4aFAxcStjTmxv?=
 =?utf-8?B?VXBEU3VkWGIxT1lYckVkVzhWRFdHSDRyRVRkZ2lVWUFXRml1Skljc1phamhx?=
 =?utf-8?B?Wm1jclV1UDErNmg2bXYxRTJQT3o4bjFNeS85NFVmaGROTllPU2prSElnM05j?=
 =?utf-8?B?aXBMMVZrNnFKZjlwQ1JydTJNRmhIMTFWaFdhUTNaU2h6bEw3QTZoQVNidjZ3?=
 =?utf-8?B?Nk9oSXVvcmFnWVV0NzVNNWNlR3NoOFNoK290YkMvQWJtY1VmSEkxMldzTEJE?=
 =?utf-8?B?MGVnMkJwQzhxalYrM0p4Vk5EdGN3aXAxSEo3d2hVUll0TW5ncHhZd2w2Snd5?=
 =?utf-8?B?NHRPcVJiNWtJYmZWZzJScGMxajc1Z3VKNVY4YXg1Uy9JZFpJRlpEZ3gyaHhI?=
 =?utf-8?B?MHFoMk5GaElXMWlMKzFjMXNWWEUySFY3RGY2TzRlNHhUb25vMkNDSjNRRk95?=
 =?utf-8?B?WU5MbHZDQ2xCUERSeTRRbVpEaWs0STFwT2h5TWQwMjhiMHVDVDByb2x2bGtD?=
 =?utf-8?B?QkIwSktxdkIzNHVydVZteWFFckhmQ3pUME9GRjA1aVJGM3JyVytZSmkvR0l3?=
 =?utf-8?B?Y0Q3TGo0NXNxOUkzTHgyanFidXNDTnVlOTZIdUxod1FPelpzNnN4UmIyL2hY?=
 =?utf-8?B?aDZNQzc0ekM1S2NHUHErMGlRYTdvN1JwSnhSQlhPaGprTXNKVlhwR0p2MExu?=
 =?utf-8?B?VFVrWE5WVE1JeUsvYis4dVh6ZkJqZTVhVHovdTFVYkRCb01HZVk2Z0RsclZ6?=
 =?utf-8?B?VU5Xb0dsbFlHa2E2YitoSi9PNnV5allxekZFOEdqM2JLcC9DUGVCOHBEWUNY?=
 =?utf-8?B?eXZkaHRUemo4algzSHFzQkxOdVk4dTJUMHRRMXB5Yko5L3YvSHU2bTZWa0Zp?=
 =?utf-8?B?Vnd0Y2NzWkM4KzgwZ3g2NFBLL2FIcU9EOGhUYjMxZ2xDRUdudXpxbGszMjd4?=
 =?utf-8?B?alI4WGN6QVdVSWVydlhHYVgzVVQ4NThTbVhVRmZNMUQzNERvNS84eDlGVG5w?=
 =?utf-8?B?dmw2MWNQWFlTN0RVVkh4Z0x6ZkhkaHgzRUs1SlZUNGJLODhPQzNKVFBOUDUv?=
 =?utf-8?B?TFpQWVkvQlBFR3lHcUdyRGFUT3RJYlBGYkNXbGI2bWJOejAzYlVLYkVSUFRT?=
 =?utf-8?B?WWloNEZRTXVreFdaZHI4SklDbFlnUG5XcHdtMlArVVp5cVJ6RWNRQUVGRjVE?=
 =?utf-8?B?elBodG1LR1VWb2plRFhvVmVsZVczeGcyTEY3OTlVYzRlMzVEdUZoKzZmM0NS?=
 =?utf-8?B?R1dCK1ptcWNOVHZjMEYyWi9yQi9UaEN6a3RjME9aSzVJQVRlaG9mLzFvZ25D?=
 =?utf-8?B?bFVJb2VRRFFvZ2hmRTNkSUd5SVhWbEU1V2dERjd3S3JySTQvaDVDKzBzTXND?=
 =?utf-8?B?blhQSmhQY3BCNDFyS1NiUXRGeGZreS9tM01Hd3hJSlNGTkxiOHIzQkVncm1G?=
 =?utf-8?B?VWFmYURydEJPVUhMVWRna01vMHJENnFkdmxYZTJWeHU5akhyM1FsRVc1OENv?=
 =?utf-8?B?c3B1WC9jcTFUcDFpamdCMkFaRkd4VU5QM2dRVjRBaGs2ZlF4MWtDNEFnR0k1?=
 =?utf-8?B?ejVhbUgxM21JeXdUeHp6L2VLQ1Q4MTJLUnZHZlpJSHBRRW9Sb2hTRmI3eDhV?=
 =?utf-8?B?NmpGWnhXMnlaekQrYTNtUWFDTHNSY1YwSERsUXF4ays5MG1aNUhWbjJMeWhI?=
 =?utf-8?B?WkxlNCtXTXMyazdMWjRFRHh1dUowM2tlYVRMK0tyWUY2OWVVUzJINXdaS0xY?=
 =?utf-8?B?WVBjMjdROVg2blVUL1FCMlFaZVVMR2k3T1Njek01cDdsNzM2U3JLV0svUUl1?=
 =?utf-8?B?RWhtb29CbTlYVkoydWFEbEpnZFBGeVJsOGRWMDAzcHcrb1RiMjNEYkJjdmp1?=
 =?utf-8?B?dy9oWjBBYlZRUWZXZExsTDZZZ25aREhGalEwNDgvNVU5ZVFaVjJrQ21Ob0xu?=
 =?utf-8?B?OTdEQ0VBL0hQelRCLzU1UXlTTGo3OUl2TkRmSzRRbU4zWkExcllobWg5UFJr?=
 =?utf-8?Q?l7gLmdkehQyDybSxKcq1v3+wJcOp92DP0APHoF9XztLJ5?=
X-MS-Exchange-AntiSpam-MessageData-1: l+r9hjdaBr+WVg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bf7180-19b4-4bc2-f923-08dec8a66d98
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:17:06.4344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPEV6xttrBCtUOuleWNO8W3COGjnXZVlVDpIZv2R6Wsz3Y3JUM4i2VSffhkfr725Ew7Ga1PK++1gRxRjEUJm9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899

On 6/12/26 9:24 AM, Timur Tabi wrote:
> On Fri, 2026-06-12 at 17:07 +0100, Gary Guo wrote:
>> If the code often needs to say "Hopper or later", then I'd say the comparison
>> would want to be consistent with that too, no?
>>
>> When would you want `GH100 < AD102` in your code?
> 
> I guess I'm just not being clear.  The phrase "Hopper and later" is just a phrase to describe
> Hopper, Blackwell, Rubin, and whatever comes after it.  The whole point behind the comment is
> that you're supposed to ignore the chip_id numbering when you read that phrase.

And clearly the comment has failed in its goal, seeing as how our
first reader had trouble understanding what we meant. :)  Gary,
any thoughts about how to clarify this? Or is this whole idea
of talking about Hopper and later turning into a problem...?

thanks,
-- 
John Hubbard

