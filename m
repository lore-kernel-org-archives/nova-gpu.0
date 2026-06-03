Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4DE3F2106
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 03:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780458816; cv=fail; b=F53Q+3lkKk9skWY3l5EGFgwvh1INO+z18+/kOJfbsFYpOX9Bsc+Wg47dn9/UtqOq+F3kQbrBxsGkSqsTZO5Uv6SxpAG87KNeiPOSjwIf93bI/lasA4/j/30QcNmJCzgxyNb7lNQguADwDs13zvY1vv/YxVfHAwPFDzqEEEB8/Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780458816; c=relaxed/simple;
	bh=oDEA2d7Jdgl3F+dqs/LbzpxpIPVPDHLucd5dGfNoIzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OjaPz2vJs0fQ25Qu/Bsg3qRBbRxm0ujWhP7XNVk+FKH3GPJSHuIwl0fYCOQxI30yT2vLF1vXPXBwBJsB7Ug+7eH+qVUlih27vihey3uwPLOw8tM9WfzKdEbIx1mI8sOBSXqsKCHrLIhy5/brLmM3G+OAmCZ2a5XLHGbSxkieugE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HSO5/B31; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HSO5/B31"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTlgfgDqAlAPA6JrQyJAOdpfHDw6CGALcmQHeGpmZ7RKgBE1JJe1+smRfGHqDL05s0tP9QeOpa7atSZYlYLmLqRbQes++IT97VFozs6xx34taAqTUOj30MCxkRpcy0Gpe9ViFoL14tz+bcDe65yHOvIw93G/nYE1ZuvLcRX92A+Wymqccbj0Xfu1MFx48SBoEbZrCgsRlavwPUtTpcXcegcWk0DJDzoj4bYFhxtwBDMG5OBsGOwIr6SZ08shLl0Jnp4tOtcA0XwYyeCHK8O1VYtl8MGhoGuXafDrDmGi1qBqOX9dyS0xmR3A+pElk3xk2N10Q/dxXY4x0FQSpkfZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBF+SROitPpSEDI1kpN6UcsK9TP1hghX+bRhqZS/7II=;
 b=BPd37nN7R//K/XYf4I7TfqApm9ZeZEk+gMcHfOmL72xWGfZygCO5k9I21S355FLSOd8/MlbPv8NtxAEdI2DZFO73eQ8BJ1UoUptBbNVEQrcniITQWEgdp1XF0MhSaWOBgfBKlLyiHNXeHgDw8qp7WL3DkIbllwLlV/s2TQATiF6dJy255mvu0t0LRyTZXqTb1UpHnVE/Ex2omMKk0lcgtcyAKDwusctWR/L1hZIgmk9mDys06uXqcXC/QAEjZntB/eItBHZlaeJcR64M1c5XnRh/DamjiEsesKTcxPgnPfA7UMMUK8k6cR/2kLM7B42OQun49vflLFsRYX/ulrGK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBF+SROitPpSEDI1kpN6UcsK9TP1hghX+bRhqZS/7II=;
 b=HSO5/B31kC/rBPuKGY2ujC2TG5bKj7VV/MOGlprnkz3Z3UtcgXl2eB2uNA3IHsjjvG/X0YxjhvitngLyckZ4/SpeqUMQR0vO0+J/3JCXNHxzTknDn9a4+wT/dJ5ButeE+0dqi9oeBTDuGBchjp8eWuL7nrhjjb9D/EOasIrso9GnJ+3DsAXoL7PKn/yCIuSyi4NgqFUK/3o3Y4aPaMVDde76VauAOS6uH535esWLfAV9irZPYy4Tc6Bn8DlvscHRVvUUVVX4Dzyke+jdYxqnwnZ4jfxAm1b5khIHc/yWyyMOne7D2In/0tAqbJdVDxo9v1g2MofN6OjmW7NEABgcEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.13; Wed, 3 Jun 2026 03:53:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 03:53:26 +0000
Message-ID: <d20143f6-701b-4e40-bcd9-7ca3cc94f5ae@nvidia.com>
Date: Tue, 2 Jun 2026 20:53:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
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
 "dakr@kernel.org" <dakr@kernel.org>, "gary@garyguo.net" <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-14-jhubbard@nvidia.com>
 <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
 <DIYZGBDIVOA0.1Z6FRXE3D4JBC@nvidia.com>
 <a3380acdbff6ca77892143dcb4dd1ea6c085ec8c.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a3380acdbff6ca77892143dcb4dd1ea6c085ec8c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ccb629-d1a6-4e61-1111-08dec123aaa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|56012099006|4143699003|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4lKzCNEg/5qOk1gLItRB1C9/x73zHVkP1VpToLPqPda4/WL0B0IQA1k72E5zsbq0AzajRGKecucSA04U/HIAkeg2Sp5isl6yW4Zsm5WPVwylEiYRC0mg9yKzb2suh7qipRNHRVD/YczulbSi92wBO+4jA+QkAR+KV8l6Kaee0rcdJDaMrXlhbwZ/AlmbuXaSMEeUeiVbqrvWbdp4wwUQ5lW6gw1a01/DC4/ObRjQWrDWrAXYLNqtgXYLAfJHXKJ/LN+SWIOIOQCGNW675OVrVM+IqGhIUAIzNl7l6s8noDibP7BulX2p6QvNR0MPrpM1bdyFO5P5qCUgryZpA10K4dbsIHBdkuBgVRH1qgPjyuzBGsi8QKxXBhpdoADEB3VR+jhDTXyQgZmhTsKwtJrV7dxFh9M5sjF4xAWtBSE5nV98O/z+HXmu2DA5vOuUcf6ZfeqgZGYSwQaP0BoCvYuDujaxBydET2uS8ek8IIfhnuz7c6a9LFeO6L8XAF8gtCskHhBD8x6xHlIfu6ibcnwFJr/MFjrTBl8IwjoqwsRGp8m+t5NKw4qm0hu4cyUIYUysQlurJVWxOYmm8JrOQi3mUtA8Z50G+U9OwtYeP2p54Gk6pMU00kNPkgQXrHNySk/Mp96Vfm3RWBlA3m2hvahaYigMfvW0C68hoy4qu7AchJI++n30iJ6BcyEAfx3J9SPt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(56012099006)(4143699003)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDMxb2J3ak1kbkUyTFliOW13bStSdkI4dVlyckdVU2RTaGM1N0MxV1E5eHFo?=
 =?utf-8?B?akRhNnMxWGkxT002bzlVU3ZzanBzL041M3NMa3NXRXRtKyszK1o1bTg3VGR4?=
 =?utf-8?B?UnVDb0p5MDBtcVNMOThxQUJ3Wmd0ZkpDVTdwdSs5S0k3QW00bnd6SjFwR0g0?=
 =?utf-8?B?cmdZYU5jZ0xMR2kvVm1PaG5BOTZSVWtXM3ZNcHd2UDZFYWg4b2tEQXNsU0F4?=
 =?utf-8?B?ZkZsOW1EOENSRGJzOTFYazg1U2tXWWdKM1lGUzRnaGpGc1FMeG9Yck1HcUwy?=
 =?utf-8?B?VERmMVhCQ2J5cFN1SndjT3FJT2l4TEwwSHRXY29qcFFNVTM4YVo5TzRNU3hY?=
 =?utf-8?B?ZEVmeldhVnRwUkZqbG5LVWkyVW9GUUhRVnV5Y09kZGJQeGhtaURScnp5YnJh?=
 =?utf-8?B?NnpkTWNwNUFzaFhqVE9Ta2JvczB3Q1dITTBkZjNXNVRNSHI0WXJoc2JOWHhr?=
 =?utf-8?B?V3grMDhJNVFzVmhXMWlhS1FxM3JpZnZHOFRESlA5bTg2RktlRnhKcCszNEVU?=
 =?utf-8?B?cHRGTXZnd0VOeXNPckRqekxmeFk1NXhEeGFuRzJlS3pYOG5ibEt2NncwVm1X?=
 =?utf-8?B?TzRYbzJ2R2k0SVoza3FXa21HMmJtdTB3YUVkSVNBczVVZUorcDNGNTFRemdI?=
 =?utf-8?B?T2VWYmZVdlpYdVRHcmloK040c0lLeUZtYzRTaHRIRGR2SUI4aEpNeWIvMlRR?=
 =?utf-8?B?ektmdncvZVorenJJMldwZDl3S1dOSHYxSDRsNFNXU1g5c3dUVEJjRFJJQVdU?=
 =?utf-8?B?NnZIRisrcHJjdnhycThWcDlMMzBoZ1NvZlhEaGV5UE9DWTlYd2xuVEI1Y1gv?=
 =?utf-8?B?QlZFU1BFTld3d3hjZm9ZYVVRWHdoVWNvTDcwTXQ4RUEybHhtWjNHUFJ4OFVj?=
 =?utf-8?B?d1FacCtmVExuOExhYkUwdTI2QlU1QmorT1ZLOThKT3hBRGJvMG83VVpGZEEy?=
 =?utf-8?B?V2hyZk5ZRytwYytsT2cvUmJUM0R0bkRFR000UkJJNTQ1RWhsMzZydFJoK0dJ?=
 =?utf-8?B?c0xqaUVqZmlseEpaN1c1Y2cyMytFZEh5NWJXTG1LNzk4S0NwdkJPa1FOa2FE?=
 =?utf-8?B?T2s3ZTlMbHc3cngrQTVNb3NTYWxpQitnSGdnY3pyeTd0TVJNcjFRQWZaazk3?=
 =?utf-8?B?V2NmRVV2YW1nM0FCTUdpZllkeHBJeDNZbWpicXh4TDFxRTF6K1pMT010V0Rx?=
 =?utf-8?B?WmN2QmJVMitUYmhiSnNqRmV0bVpBNktBdVEvVWxzSE1OMDlNcFFQNlpQQ2dp?=
 =?utf-8?B?UXpmN25XWEpub0dLSkF0bzdrR1NYNHZ4V20rTE9yN0p3akZwcWU2V01IWEQ3?=
 =?utf-8?B?QjhmWDFwYzR3UWgwN0dpUmp4MlYzdThDZnBuKzZOdEhkeGRNVTk4U09MYUVm?=
 =?utf-8?B?dHJMazN2eGNzT0grRUlmSnN0THNYeEpsOTJBeVVlNTR3UGVnMGNYK09rbGVC?=
 =?utf-8?B?cEZLUkoxaHlCbE8ydTY1TnRKSnpVL0FNTEpZRldiZXpHbTNxTURHeHMwaWMz?=
 =?utf-8?B?SldhbTFDNnNuK25Dcy9zeXF6Y0dRQ2tqSkFyMWNvaGYvMGlRZWUvbTA0UDQw?=
 =?utf-8?B?M1Vxa0REQ2g4T0d3N0wvWGptcXJtTkd3aXZhd1I3YnNLUS8vYzlJM2dIZFlM?=
 =?utf-8?B?T0UxVGFKREh4cDh0U0U3eCsxV1VxY1V6Skp6SmVhUnQxVmM2NzJ1dEx1eGIy?=
 =?utf-8?B?SElUUEc4VThjTjNRUTc3THBHUWlLc3V3bnZwWlU0dFNQaGkxUkVaNWk2NUdv?=
 =?utf-8?B?WWl5b2t4Q1Z1UjFrSVVKME91SEIzNVoxOHNGa2poUE01Sm82K0Q3Wklnb0lU?=
 =?utf-8?B?Q0orR2JOUHJkMFBob2M0U3VzZ2hCMGlKSHJFREI1WWxJakYraEVwNUdrN3NK?=
 =?utf-8?B?OW16djB1NWZLdkxnREdxMURHNGE1RG44M09YWnh6R0EvYnNRME81UExNeGtO?=
 =?utf-8?B?NFZFQ3JEQVYwMVduQXp6VGViNmRybjJNVlBYaHR1b3pxSHZ6eTlBQmdPdzJO?=
 =?utf-8?B?U1Jyaklrc1k2V1QwT0FxSTJ2QmFtRzZpZ2dza0hCNUFaOUhwUHVwK2VKUkd6?=
 =?utf-8?B?aHRLaVY0cW5JUXNaWVhFbGhqSXJ3UUNJVW8rMFFlRnN3QlJmVHJEMGcvM1Qv?=
 =?utf-8?B?VzZKUVYzN1QxWW4xVEdvNkU0am5ndVR5MlVUVmMwS3VnVmY2dG05bkUrV2ly?=
 =?utf-8?B?SndaTXh1azZZbFVCWGZiUlJBTTVJMjFxejlaZ0ZyQkFaUyt5ZGk1MWs3ci8y?=
 =?utf-8?B?NFBkN1llV1NCWTF6WnA4MVFJNkFDSExiZXlzeGVwVEFTc3NxVWk4Ym9iRFho?=
 =?utf-8?B?WCtZU3J4NW9rNDBIWG9pOFpLK09wY2NtZm1JajVMWGdZbDYzWlczTFN4ZjNN?=
 =?utf-8?Q?5M+p4PY9YDbgkeJ/igwWu0oB+6pftb7QzTxQM8pOTXgsO?=
X-MS-Exchange-AntiSpam-MessageData-1: tK+MU9JtQy/p5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ccb629-d1a6-4e61-1111-08dec123aaa8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 03:53:26.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERmMIDj6p0BHuWovUyQK0Y7sQAUX9svAhQECVbj+wDY5lqkaAsijSijLb8Ze1sFZizxf/06N7G1SZLUTDGSpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

On 6/2/26 8:09 PM, Timur Tabi wrote:
> On Wed, 2026-06-03 at 09:20 +0900, Alexandre Courbot wrote:
>>
>>> How can we be certain that these lengths are really fixed?  I can add these length
>>> restrictions to
>>> the script that generates the files, but I want to be really certain that they will be
>>> correct for
>>> all time.
>>
>> These are RSA-3072 keys/signatures, which are by convention 384 bytes
>> (or 3072 bits), so I think we can rely on that assumption as long as the
>> content type doesn't change. I am actually surprised that the comment
>> says the section can be shorter - that doesn't sound possible with
>> RSA-30272 .

I recall repeatedly hitting cases on one of the GPU architectures that
used a shorter length, but I should go back and verify that it wasn't
just a bringup "conclusion" that doesn't hold up after the dust settled.

> 
> I'm assuming that maybe they could be RSA-2048.
> 
>> Does the script have a way to validate the length? If so, I agree it is
>> a good idea to do so, to flag the problem before it shows up in the
>> driver.
> 
> Yes, I will add these length checks.

thanks,
-- 
John Hubbard

