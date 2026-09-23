Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDA4331EBC
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 01:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127374; cv=fail; b=HGxfaqkkEgiWxFlrAoFYhexkTsULfCypXy3ivOC/g/T+bOMKZXz2PqpkjhXS3fr2XYTh2iv2UcmRHoZPypeU2xznDsH2EPFmOHE0Gnq+vmWUNU+id8z3iDxal8YOkwgVdDZM6HwJ64QcFnKEVkfurYLkYPf86RDQ6MY2PkM/D1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127374; c=relaxed/simple;
	bh=MnIVkSsuOKu14l2S4ZeXbj4+zJY4Ovga4wpTUZkke9s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cxy57vLwY8ideZR4ANiKSYGsUDNsKwe6NWZyRM9HqAmdC/CU6AC3IJo5QK/IAJgDwyfF+x6gCvN6dRVaWzLaHBfDzD3xUNVzk6bvbt3LuaCr12lEcOZwd4dls6CAHdUYgFQPfrKqD7NMq/xEAE40rwqdQsj5w5ZGZQmZE2zh8pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S8tkOF7F; arc=fail smtp.client-ip=40.107.200.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8tkOF7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cc/hCieqqjQlHHNPgB77zVaz+LRUzskpHdUfPYDtXEomSeX3mJCyZRH3Erc1wleFmsqpg7t+HP4nkvZd9tdSFQR0HxXX+D22nEP4F3Q4ApwDp/Fs9JvzIU0FEFqXTFGsLWFjeoOhKa/W0NCJH4+WOk4KeMAh9+aKVTx8sO7Sa0DIfxWXYKZgDZiRBD9g5HowuRu2aPwwzR3y/PHwCZqCt0SHTEedw/NJXonDUPgXt6GuY0svuUizGLoGDKmi6QTJBrXK0mpUPuO8hIR3zVfjqHcsmvZQ9yIHQYi+yjBI4PExPcb6Hz1F9sPboKupMNJ25EzwfrEQaOtbyS4Ga/oRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dXQthBbfoOhuIuPWc5NGmSP/60an75psGYi0+tNI0M=;
 b=hkf+Bm24n3cM+EgEB158tQvsR2bUXVo2TIlxsEDeUcfdD6TsOYMWKcyXlcbPPMSZE7aTXCREXS97iAw+O1LpPPpPMvmB2qFaNLuTDd5JHCxHEMF8BlQtobStHjbUz466b/pzs0Dlsx1tx8gS1SO/LuOS3dS0wljDGlguZLmd+wWHbidxkqC1px0CRKghMBJpuVQua4rhE2APoQ4ntNZ55LPzNU4ip6HbbwZy3gMtOCvnZXO4GT4nFyVObDM0TVmcrbbKw4cmzOEv+jdNq1kjwCx9Ha8nUCP3ZeNkp5DwQIbCfrBaEjhIkJTzSi7qWykjyYzeel0qR9wCVIJz15+ASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dXQthBbfoOhuIuPWc5NGmSP/60an75psGYi0+tNI0M=;
 b=S8tkOF7FQVlQbnQezdjKP2QIhOnUb0CU/kd361OhzXJANqnQ7ogUJK21XcWaS1TYd+U+MUeg2n4UcNczncMM3hC1+638pP/fehPBR2WjaZrvhrTg//GoYqSyzLpzq1kGDPUEuL9v+XXrkUUK3XTxWezLOh98WXHb+LxMY/qBagTZyO9J97VDBdGl8Xu3gC9kctARhPqmidHYg7k1+Jx1lcg16Dc07Q6Y4e94enELU2i7e85/TnW98RCOJrQz0SLzNZgZq/LfpYJUIfT9YmcbXxkY9qCrH+0C8szGAIOmVYzwg9mf8O1b6SN5amw9B4VceKPzUOTJ4RItzD3ow5nU8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Wed, 23 Sep 2026 01:34:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 01:34:04 +0000
Message-ID: <95a59b57-28ab-4137-84a0-0fe78bf41712@nvidia.com>
Date: Tue, 22 Sep 2026 18:34:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/33] gpu: nova-core: firmware: add r000 bindings
From: John Hubbard <jhubbard@nvidia.com>
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
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-5-jhubbard@nvidia.com>
 <576a2ec09fcdec7d3229bb30eac433c4d601e5b9.camel@nvidia.com>
 <dde469d3-aef5-4fd5-830a-6b92ca9d7515@nvidia.com>
Content-Language: en-US
In-Reply-To: <dde469d3-aef5-4fd5-830a-6b92ca9d7515@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f203c1a-2162-47b3-b949-08df1912c0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tzrw8fhyuKhxRaMxUGPSxjhy3axcNrt3DQ26IS+b1TphbPNgzhgZleei6jvgwQtANuLv6ghZExD8GMiz2z0Fv52VaTZW1gzKDkvVnVD77LxQXbV8Vevmp4b2cfvQ9j4eWVUZA7JCEvZkk7SM5h/qB0vJm1dpEg8RLPbZxZi2S5ZpGFQXxuC1A4aNuf3OpQuW5PUWSSq17pFaTOHJjdtmxZAwT3EMVdTtlknFPgk6vXYtt4ppQzAeI339HszrwsGjD7Og8htRQTehDgkOSTnfDPkCHhooafilMHpNvZXmhan6co/TRO9vD1C3FOOxKhgD95y/frds3hbBloAiq31eRNuOTUYnuvLemV1yP+cqlKUZEWr4wTYM9dYLDkexMF1rt7M7Qj1rnOaCWBciAPBKc5k4PZX7ZoY64lt4S/31Hu3lvmhzAYKLiVaxi4BbwXaYOEu1nyr7Bhq2kpA21yz640yL1JfpUM3lKCx5QUunQeu1dSoSXoorYi4dhAAKQAOL/RDqq0cpzB3QJ1mAuVr/H6wzFT4w8aZ0/YXisFS9YBM2dBdy1jpRCq/p8DlYQUEgR52L7ewhopnv7EbVjvo28QcTo39WUNqph+l5suxzGRkg6Hh8oT/rWrPlTv1I51UkasKMl9pR8BdwA5o9OX4uncEbFL0nTljAWntFnPGyZH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDJxVFAzeVNaaE4xR0o0MnB0VGQyZ281VlE2cFFROUlxekNRRkZGdVhhK2li?=
 =?utf-8?B?M1BXdlB3bWxFdC9BOTR0Vlg5Q0U4NDdDd3d4enNCRm5GY0g0eU5CUTZFaXBO?=
 =?utf-8?B?OHlYS250bmVPb0FFZ0ovVmlZV2VOdjJEdzVIOGJQMXUzQzUrM3NiSSt6Z05E?=
 =?utf-8?B?ajZNdEx4aFIrdXFFdHpweTNPMzdoekpaVUwzd3JwUXpuZEVKeWRHWjNzTDRU?=
 =?utf-8?B?dURJclBkNVVsSUNsQUUxOFlJcFpYbFdGT3BhSEQwUVRmMUZ3YTYrdWF6K21C?=
 =?utf-8?B?U2paK1hJdzdDNlhuQkpjT0RhM212dExqaGxzV25MaUREVDdDTzNwZkJnclZM?=
 =?utf-8?B?bEp5K0RpY3BNeTJiTzhzUjY5SVpCZjJhU1JCYnp3em4vczhmYUR0dDcvNkVX?=
 =?utf-8?B?K29ubEQ0Y3J0d1VVQi8xUHo5Q2ZvaE1uUlRtK3JqdFZzNFJoV2cxczlwNnpI?=
 =?utf-8?B?NmtwNFJxbG5QWUNHNW1yZkErQkN2a3NBR3NZT21wanNNODJReENJT1ZlR1hs?=
 =?utf-8?B?bUNmczU0RXcwZHI1ZVNUdHRBWDR3TUtKR1hieW5ubytCdW52YWRKTFdxMlNv?=
 =?utf-8?B?RUZiQXN3M3hGcmRna1k2Tzk4allZT2tBWEQ3MzFVWWpHa2l6cDNQelF6SjB4?=
 =?utf-8?B?M1hhQU1zRDdZN0lSdEZwMFowd0ZsVXJSVG9OQTZXNnBiWldLeGpWaHhpMVN4?=
 =?utf-8?B?SFYxVHNMZHVZNHhXcnVOa045Q0ltR2xmcEJwZkRhNzhLT0QxY2lYNkgvRmxI?=
 =?utf-8?B?NnRGYnhJK2N2Z1dGb1Vld2NsYUhUaFFYcVpuVTN6R3dnRXlRUi80NjF3L0tG?=
 =?utf-8?B?UGNTSUtudUNsVmF5UWIzVzlHQTRWVCtrVFcxT1Y0YkZYL081YzExdHIwSjVr?=
 =?utf-8?B?bjNVaXNwRDMrRTVpZjBqclJVQkh3dTlqdDUyelVLb0thbnVPQ3drZnlJV1pt?=
 =?utf-8?B?MDQvQVpzdFRzc2pHb0Z1L0Jibld5eHp2SUFOdFpDbitKNXhIZ2FwRUpYaDJV?=
 =?utf-8?B?Mm0zNHIzYUdUblVVamNPZDBrSHJqZkdra2xSYlVJV1NuOGsyUnZ5a3hlQ3Bp?=
 =?utf-8?B?WjVPa1ZMOGV6OWx4UDc3anQvbjQ2N2ozZlFoMGdRdzFXZEdNNG9kUm5KdE1W?=
 =?utf-8?B?aHNFQWxJSmt5S2xtaWNHSXJBd1czKzNyU1BxdGEyeU44V3BjKzFmVTUwcXU4?=
 =?utf-8?B?M0Q5Z251R2M1VHhRRUtyZGxVQy9IS3VNR1Ayd04wcnYrMGM2ZEV2WkI1OTF0?=
 =?utf-8?B?cmtjSHlMVmRvaXp0UWQ3Ym1oRldkTS9xSGtkdWlBQm5ESWF5OTVDak1vT254?=
 =?utf-8?B?VnpYOVVwN0U5V0pRQWMwREl0OTJqZlNRWkpSbm1hdXRCV1hFcW1VWkw2ZXIy?=
 =?utf-8?B?dFAvOXdlK1k5dE1aNmRDSGt3cVZxZGlTWHFlWitsSnBraGZzOC9MNkpGaHdP?=
 =?utf-8?B?MUh5N0oxM0N3d3c3SWdhUXpMRDBZNnNHdzJuRWJ3S2VxVUwzcExTTjZpdzFQ?=
 =?utf-8?B?YjJOKytDdU80cEZkRm9FeFFwc3NaVU5Cb1BBT2dxOVBGTy9ISHhzT1pIbVBD?=
 =?utf-8?B?dmlKNzBnWnIrQ0VnWjVWeXlCYkZMYXJ0T29SVHAvM0Y3TEZxY3hLSFRaaGl5?=
 =?utf-8?B?MTV5a2Uvc2s3SGhVSWh0czF1SHpjc1RJbjdXL2plTUMxVG93eTQ4S0FML240?=
 =?utf-8?B?SERDSEptUWxYQnJScmYvNS9xYUZja2NwNjU3NnB0MzhEblhPQmltd3psTzdx?=
 =?utf-8?B?MTlZMVpwN09VaUlJa21DOWorWDd2U05YTDFndmQvV095T3RHQWwyOWtBSkVY?=
 =?utf-8?B?YnVURkQ3cDlFQ3g0NzNOSWlLUno2ODU2UVBBMEJGQVR1UHV3QWRPMmprc3o4?=
 =?utf-8?B?VVJYVEpFczZwOWxSUkM4MDExcnhBY2Jhdld6aDZuWTRSbEZhMFdNTTZtU0x5?=
 =?utf-8?B?cEdDQWduT2VnMlJSNE96ajlsNGVYNXhVMTdnbnVwNVdPQkNyZUg5aXdZVE1o?=
 =?utf-8?B?SFlTNUJtYU1CbERoQy9QMmhCN0JDRDhvWm9Xditzb0VWRXRYVUxjQkcyTDVQ?=
 =?utf-8?B?K2pseU1MKzhEdGdTWnBhcTJFcnZtUmUwc05XeVRpWEk3dkRXNFpaSlduekFO?=
 =?utf-8?B?UFF2Vjdpbk05czZMZGNmck5xWTVXU29vMVIrbjQ2WkJtRmNWVmFRUks1NzlH?=
 =?utf-8?B?TkpOWHludENCcTBhVGFCaStPeEZoT3NmOWpmQ3JoNzBVNXhPdWc4RGxjTEd0?=
 =?utf-8?B?SC9hcTNJbDY4ZkFmTVVoaXdyU1NMOC9ZMHVCNTJoYS9PN2lLM0htNjl5OUt2?=
 =?utf-8?B?bjI3UFF2elFOZDJKcVQ2R1puZU0vcGFhcVRtQ0VGZDEzckdDZHh1dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f203c1a-2162-47b3-b949-08df1912c0b6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 01:34:04.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHfJmNMVqsThAxvjUI03+YVf2E/kVy/PjyGAjKrjweicsk3KFrx3u0rduROT6KQ+lTvFG6Fnb7jHsAzMeFvQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398

On 9/21/26 6:51 PM, John Hubbard wrote:
> On 9/18/26 10:42 AM, Timur Tabi wrote:
>> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>>> Nova-core boots the r570 GSP firmware, release 570.144. The GSP firmware
>>> releases from r615 onward share one ABI, and their firmware files carry
>>> no version number in their names, because each image records its version
>>> internally. The driver calls that ABI "r000", so that its name does not
>>> change with each release.
>>>
>>> Add the bindings that bindgen generates from the r000 headers of Open
>>> RM, the open-source NVIDIA kernel driver.
>>
>> You should specify exactly which OpenRM version was used for this, because I suspect that some
>> of these constants might change in future versions.  The upcoming NVOC stuff will mitigate that,
>> but it's still useful to be specific, just in case.
> 
> Yes, good point. I've verified that the bindgen with the publicly
> released r615 provides the same thing as here--as long as I delete
> one unused item from bindgen input. Which I've done for v4.
> 
> I'm about to re-test against stock r615 firmware, which I now realize
> would have been ideal to do earlier. I was feeling less optimistic
> about it at the time, but after looking at some details I think it
> will work for this patchset, just not necessarily for the follow-on
> series that Zhi Wang is posting for full vGPU.
> 
Good news, this series boots up on the stock, publicly released r615 firmware,
just fine!

I tested Turing, Ampere and Blackwell GPUs:

PCIe Probe: PASS: Chipset info: all 3 GPUs OK
  ok   0000:c1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
  ok   0000:c2:00.0: NVIDIA (Chipset: GB202, Architecture: BlackwellGB20x, Revision: a.1)
  ok   0000:01:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Interrupt Self-test: PASS: Interrupt self-test: all 3 GPUs OK
  ok   0000:c1:00.0: passed, subtree 2, 2 deliveries
  ok   0000:c2:00.0: passed, subtree 2, 2 deliveries
  ok   0000:01:00.0: passed, subtree 2, 2 deliveries

Get GPU Name: PASS: GPU name: all 3 GPUs OK
  ok   0000:c1:00.0: NVIDIA T400 4GB
  ok   0000:c2:00.0: NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition
  ok   0000:01:00.0: NVIDIA RTX A4000


thanks,
-- 
John Hubbard

