Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865A371D14
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192306; cv=fail; b=SeBZxhH9WVzI9GGZc+9Ix9d6Err/xYSZxZ1Z+9GtECvkGDqG+S38wgbbpF2RTo6gVPOACgLZkGjmarm6BOKexKL/O9AcrSg3E5KcZ2df3SsXjEZDM919w8wkO6KpXk7fzpkhmRJ/qlNo5Gg1c7y8v4PwTl7jAhz3fQ7RNrW6la8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192306; c=relaxed/simple;
	bh=gGkubLw6ja5cxJtPWRFbYrPMi0gnCwgqOWfEHLIAWWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T+f3jEQg40BHWkvQnVw7GzhjctH5J9zQXG2SKYS6fN8wricqdxUxuK7pI6nq5C4c2AYFNjdeOnoPCrmh4XzRCU2SbYfD9GrTCCDLIBRjpTuRaC/R4QxnKYjJbeNh4GYkhyRppWu9ZXKZlobwyW9p4pkWunzOcKVBOkbKfy7UiVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yce/WM1a; arc=fail smtp.client-ip=52.101.46.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yce/WM1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnqrX+CSuquizHUnUC5DfjBSF3iE7hYmlfi0lvFXjOVl5lP/hvr+8DqZSxdsD6X5QlHtVsNPyJtSVeXI3+UKbBxT7l9/IDUkx5/+4iHxEifPdwyfBb8QmTaEZv6GZANzHqdINCrb8ami2/u2L0GVE/OGUd0Jw+RPWeDRYw64VdUlQI6bb1Y6lxDN3091ty8OTYUcp6wsZpi8UM1Hi4WR7pJsT1+oLIan4KBA2ySlI3ykLLv0nl/dQvM8m16awqH1AntwgIA9zw39qBB6oQiD62f98OagnFhl880lWr16w9rCr6Ow9+zKz7i5xTs/trTV//8ak8gg+rJlfXqcZenNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhihRSuT55sxsacfKI09qCF8ft7ZEIYI8l2N6m+RZJg=;
 b=nE+UvEiKlMbC0IHnoiuhWa5nocY2pJe+tqLoOI6xniKupQrk0xHFSjd4kOIvkgv1N/85r3fnrMAt/OsXWeEUBm3z71d5orsW7XfzgOkYmJBCab9C+fDKdUSy9Kqd4+OhiqjZstOOQNTeZzkD+8fDfPNsuZTNBDdGkHCG6WusRWpEzsR9O4on7tGTXtFCfrCvMlGSiK1OoBXGR8LEprTf9UsrbdCVx+KO116ehy9ZiRTL5CtTqWBwmnBEavN5ljUJ57jqkw3K2Ka5Bfq8FFX6XCukcxnPBVMs07XFvMBWlZwinj/iLzOpu1573Z/4upofkC282soWQNDXBBazrS4q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhihRSuT55sxsacfKI09qCF8ft7ZEIYI8l2N6m+RZJg=;
 b=Yce/WM1aioySO6gJyfuS6GNDnDCCTLlbwgBorvnMUQsb4wXpxb86B1QOOs7Xj0FX8m5OX0vUx5zzAr0AuL2HK1ZPgnb6JwlvXzOH0jkJRSSAbzgLj9n0jdem+PXqmiEaX9x7GV+5b9KPzGtTdZ6b8lz6QzUQ40knvgrbpGBGIvHg4RruwTbClI565JL4tA90hMYVaCEMLZpo85cC68aWf5iQVlmHeFXy4J98xpUE816VMlbmRhj+87p5Q/iwXLNbPz8SIjsUxR1+iDzUyRpAXt9BOPbj2gMGQGTApY8e2FWVsQ394GwuFSU7JHI/F4SewEMYBU+tcsvIEua3S+lfvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 20 Aug
 2026 02:18:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:18:20 +0000
Message-ID: <78bf8241-9bbb-4f19-8e89-e7d521a1d17d@nvidia.com>
Date: Wed, 19 Aug 2026 19:18:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/27] gpu: nova-core: zero-pad radix3 page table levels
 to page boundary
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
 <20260819035221.336390-6-jhubbard@nvidia.com>
 <acdbae4ba36a2ec1b0afac774543b924ddfd65de.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <acdbae4ba36a2ec1b0afac774543b924ddfd65de.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b86f86-5091-41d8-2efa-08defe614db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|7416014|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9M248jbbaWTgMCcJd0N3yQn1CooSlb7Ss4zwgZHXGZthh8I5EOGzlefH6ZzX/ex+CXSaU5h/vD74PrC0p/J+20oAfSq38478TK/5EKyZfRfM06tcsgSHG4bglUMBVEi3dWFTxJKXHigc3C+4sXCC0HBgtlz8wu+ogUj0g6eUEkVIb7gLTJaT5mww70JvHOd6PKCsb3aAUxLMyKfYIssCiTZR8JbQENrScBwT0GnohwsxQfvd2/4ywXaHl2vfOQ13xGJbad+Hu0uMfKKcHAIYLSvorc8punX7xN8XIn23eOZGI1Z2Phz0fhnvrWSyv+d6QOawczHmbQB1nnQOR7lhFlcML1NDXd1kTiZTSv1SM0GIs19zflT1A0t4bTcJv6X2+aaR53NphDj0nZQJNIYszykeR5vTsBt3B9GtwL9xJ174ie2hizmaO6NnFxtnNPnlVaO8DK6/Ba5cQQsMiApof/G734nZktM6lp5M+GPsZtvl06d3mgMWN+QSmulmha31Pi59JtPp4OE90ft7c9HNhBCiO3h89ZWx2lkK3RoErdq6r2MdZ05XMvHzDXtiK9xDR2PAA/HBWJdKv0t/21Yu8+sBQg83T2P5aXRKj3eBxYwtNGEadXp96ddE9q0rjUfWJxi/eSERlhwRkAeJUJ/EUqMb/Q13L5cE1UKb6J/QtMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pEaG1zVldxT0JPL0VxU21hWGhtTzNKOEJ5Wmlyd3paTnRQaWtzZTJBSlV1?=
 =?utf-8?B?azh1aU91Zi9Qcng5cVlzcmVvTDJQM1l0MlFpMnBIMW9GS1RnMXo5cml3VkdH?=
 =?utf-8?B?K2NUNW5LcWtCdGdTbVV6WkF4U3o0ZlQzMFM4aTc4c2paditJYWtLeUU5cDRa?=
 =?utf-8?B?MnNHTmg0ZWRsZlhITkZhd3hhbkhmR0V3WlZnQ0tpNXA5ZVl2cVV2S0JJNWgx?=
 =?utf-8?B?NG5LTFRxNVlpTWVJRVA2VU9LTzBwUlNXWlAveGRuNWRzaXFSRVNzczFnTjY0?=
 =?utf-8?B?YU1NeHhZTCs3ZmR3YzNrdDQ0RXE0anU4cmFOdzFVOCtGZEhyQXpZc3Rzcmxs?=
 =?utf-8?B?eXMzMWY0OHRGSnJWLzBlWjhVSjVFYW5remZOVWlETXU3VHhXeG9PK05aMUU2?=
 =?utf-8?B?K0srem95Z1d0NFkyOXpqektQM1I1aU9zVEpKSzUya0xDYjlxbXdORExXVldt?=
 =?utf-8?B?TldWM2tsQmx3VVZDMVAzMUMrVFJlOXU2M2hjNXhPb0syeHlmN0Q0YitMNm04?=
 =?utf-8?B?ZS9hSkJUMlVGTlBTSmN4TDdDdys3UXcxaG84NHZPS1lIT3ZMRi9BNU9ZNDRz?=
 =?utf-8?B?ZENBQWdtYXMyVlVJaXVZT0VyRmIxTjJFZHZYMmdOUmIxVlhBOXRGUStkc0tw?=
 =?utf-8?B?S2NlTEVsQXNWRTFDQjFIR0d6cHU4Vyt2WEhXMDNjWnRFK2haSlFZaHpNQm44?=
 =?utf-8?B?bFRKOURxTkkva25aVG9XclpHdExqdHROWXNoaXFYaFhaRHRTZ1YyRUU0SlBy?=
 =?utf-8?B?Y0FtZ2RYRWhXRy9samVNS0lWTnkxU0VMMVA4WnA4L2p1czFnbXVrRytGU2M1?=
 =?utf-8?B?cXpEaWtCN24yT0Z2VThNTmt1UWE5aWNiMG9EVzd5dWlMbDE0V1h1RU1zVWRz?=
 =?utf-8?B?RHB6cGN0YU9VWTFlV3NKYi9KdkdZSlJLUHE2UjB5ZWg3SlZ2OHZGVS9sVzUy?=
 =?utf-8?B?UndMRXI5dE13US8yNGhBa0VHdm9iQ2dJWFpFb2k2NnVwREJrZnM1cENQK3B2?=
 =?utf-8?B?Z3hoM25oMnhQUEw0VStVOTI0OHNhYXBsR2FOZHZIeVV0aDlOcmR0ajNTTW0x?=
 =?utf-8?B?c0tpeWtCcWtBMUNSWDhzMnFldnpaOWc1UlBKWER1RDB2aFFGT3haVGJqQnBa?=
 =?utf-8?B?d2NKb0dicWd1V0Z0VC9uRElIeGZuWVJZN2FDSFZ5STNHcUJYOTR0RThpRlNV?=
 =?utf-8?B?ZE9vNHh0MS9yMWZCai9rbGpVRkZJak9EdlNaYmlrYlN0Qm9IZURzb0JZY0V2?=
 =?utf-8?B?bzQ3VnJadWlCYzFLY2NoVTluNittemY2ZXBxTnBid2JIWmZXMkIwUGZSZUFq?=
 =?utf-8?B?bFhKZWF6a3pKV2NhTmN6a0taNlc4azJzd0V2d05wR095WlMyQXIvSnlaaVA4?=
 =?utf-8?B?S1RzWkcxN0NMVjdnaXE5d3pobGViaFhUVUNVQ2tHMEsxejEyN1Y3Zkg0MXZ2?=
 =?utf-8?B?QjFBdE93Zis0dS9YdDBFUGRYSTFSejBsU3hWaEltUHo1c3ZNL3FBeVE2UWpG?=
 =?utf-8?B?MWNYWEhZNWRicEs0TlBEby9KbDdwaEpvVThHUG9IU0lRMUZrWnkyZ09JMTRP?=
 =?utf-8?B?VFBTaGxYay9vVGdOeVJjcXVwK3plalVlaW9OMUN3OFdHM1ZWUVZBWndRZzEx?=
 =?utf-8?B?OU1pV1NHT1c4cTRiQ2xEeGRDZFpPV2lhdktFa0M2QVdrNmkrNGRPUDNuU296?=
 =?utf-8?B?aWx6OVN3OS9rcXFzQkQ4WUQvZnE3eWIxN3lrcXQ1RDIyb0F3YnpaR2tuVm5Z?=
 =?utf-8?B?TUt6ajgyUXRzZUJEcnVZOWRINXQ5UjhyRjRiQm1ESnRNMGx1ajRZR0x4dlUy?=
 =?utf-8?B?Mzhaa01BcDlvYzBBTjNrMjJkSExESW9sa25nWGpGT3owdEw1Z0FSdzBhbnd2?=
 =?utf-8?B?UER3bGQ5UHFCK2trVFRNamFLZ09xQ1NvSzVNSlBYeXpic1hmTEhXZ00zcVZF?=
 =?utf-8?B?ZnZ0TVgxZCtHNUpjR25pamV4aXJFaFhMazc0NC96eUlxMDdMTWtsSGRORnZ4?=
 =?utf-8?B?RVpMZU11Z1FLWjg0Ni9ERkdFMm9oSGM1THcweWJPQUt1Ym9pZ0FnRWNaTzc1?=
 =?utf-8?B?aGNhcHNjUm1VOFMxa3FkTEkvRkdnQ3l1c2hDRjQvakk3cFBKbmJsSmhGSzRO?=
 =?utf-8?B?L1ZpUFc4UFdIdDZwem1LWGNVYXZIdzUxeWpUbmprMTZvUldySHB0bHMvZlVq?=
 =?utf-8?B?d3pVZVVEOHBSV1RlZ2QrNnF4SjVZOE9mYnNVMm9McUt4TFVld2kxRm5VWTZL?=
 =?utf-8?B?dy9LOG5MSUpxZEd2NTFwY2E5ZFBlaTRseXJwS1R1bmdibDBncGdBRElUYTZi?=
 =?utf-8?B?N3RRTUJaSTZoSUZhWGpsaU91a0sxQ2FxMEFzVktYeE5nK3FzbXYrdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b86f86-5091-41d8-2efa-08defe614db8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:18:20.4146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1plJBxcBeOnF/3/ofbHU3oxP4ljRb7VSYFIW4Cbnd2CdhI8amLMC2gUqPLMcfKRT0FZl2laVLW+HR14vZ3EYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745

On 8/19/26 10:41 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:51 -0700, John Hubbard wrote:
>> diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-
>> core/firmware/radix3.rs
>> index b60611c7bea0..f14ad4e82d3d 100644
>> --- a/drivers/gpu/nova-core/firmware/radix3.rs
>> +++ b/drivers/gpu/nova-core/firmware/radix3.rs
>> @@ -67,22 +67,18 @@ pub(crate) fn new<'a>(
>>              Ok(try_pin_init!(Self {
>>                  data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
>>                  level2 <- {
>> -                    VVec::<u8>::with_capacity(
>> -                        data.iter().count() * core::mem::size_of::<u64>(),
>> -                        GFP_KERNEL,
>> -                    )
>> -                    .map_err(|_| ENOMEM)
>> -                    .and_then(|level2| map_into_lvl(&data, level2))
>> -                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice,
>> GFP_KERNEL))?
>> +                    let level2 = VVec::<u8>::with_capacity(lvl_size(&data), GFP_KERNEL)
>> +                        .map_err(|_| ENOMEM)
>> +                        .and_then(|level2| map_into_lvl(&data, level2))?;
>> +
>> +                    SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL)
> 
> Could you use the new Vec::zeroed() to get a buffer that's already all zeroed-out?

Yes. The incremental diff below does that, and is passing my runtime tests:

<blueforge> linux-github (nova-core-run-on-r615-or-later-v2)$ git d -- drivers/gpu/nova-core/firmware/radix3.rs
diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
index f14ad4e82d3d..b0630fd96c01 100644
--- a/drivers/gpu/nova-core/firmware/radix3.rs
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -67,16 +67,12 @@ pub(crate) fn new<'a>(
             Ok(try_pin_init!(Self {
                 data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
-                    let level2 = VVec::<u8>::with_capacity(lvl_size(&data), GFP_KERNEL)
-                        .map_err(|_| ENOMEM)
-                        .and_then(|level2| map_into_lvl(&data, level2))?;
+                    let level2 = build_lvl(&data)?;
 
                     SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL)
                 },
                 level1 <- {
-                    let level1 = VVec::<u8>::with_capacity(lvl_size(&level2), GFP_KERNEL)
-                        .map_err(|_| ENOMEM)
-                        .and_then(|level1| map_into_lvl(&level2, level1))?;
+                    let level1 = build_lvl(&level2)?;
 
                     SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL)
                 },
@@ -110,7 +106,7 @@ pub(crate) fn size(&self) -> usize {
 }
 
 /// Returns the size, in bytes, of the page table level that maps `sg_table`: one `u64` entry per
-/// 4KB page it spans, rounded up to the page boundary that [`map_into_lvl`] pads to.
+/// 4KB page it spans, rounded up to a whole number of `GSP_PAGE_SIZE` pages.
 fn lvl_size(sg_table: &SGTable<Owned<VVec<u8>>>) -> usize {
     let entries: usize = sg_table
         .iter()
@@ -120,26 +116,34 @@ fn lvl_size(sg_table: &SGTable<Owned<VVec<u8>>>) -> usize {
     (entries * size_of::<u64>()).next_multiple_of(GSP_PAGE_SIZE)
 }
 
-/// Build a page table from a scatter-gather list.
+/// Builds a page table level from a scatter-gather list.
 ///
 /// Takes each DMA-mapped region from `sg_table` and writes page table entries
 /// for all 4KB pages within that region. For example, a 16KB SG entry becomes
 /// 4 consecutive page table entries.
-fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+///
+/// The returned buffer spans a whole number of `GSP_PAGE_SIZE` pages, and every byte past the
+/// last entry is zero. The booter DMAs each level a whole page at a time.
+///
+/// Returns `ENOMEM` if the level cannot be allocated, and `EINVAL` if `sg_table` spans more
+/// pages than [`lvl_size`] accounted for.
+fn build_lvl(sg_table: &SGTable<Owned<VVec<u8>>>) -> Result<VVec<u8>> {
+    let mut dst = VVec::<u8>::zeroed(lvl_size(sg_table), GFP_KERNEL).map_err(|_| ENOMEM)?;
+    let mut entries = dst.chunks_exact_mut(size_of::<u64>());
+
     for sg_entry in sg_table.iter() {
         let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
             let entry = sg_entry.dma_address()
                 + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
-            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+
+            entries
+                .next()
+                .ok_or(EINVAL)?
+                .copy_from_slice(&entry.to_le_bytes());
         }
     }
 
-    // The last page of a level is only partly filled, and the booter DMAs each level a
-    // whole page at a time, so no entry past the last valid one may hold a stale address.
-    let padded = dst.len().next_multiple_of(GSP_PAGE_SIZE);
-    dst.resize(padded, 0, GFP_KERNEL)?;
-
     Ok(dst)
 }



thanks,
-- 
John Hubbard

