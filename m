Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBC0244694
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187935; cv=fail; b=O5IvBtIQ3cjKVWFb8vZvy+vC3pzZNH/Quv/QpkyVvRss6x5kKKMUyhiiwvGHqOLNZ0g1ILs9z40kJsiAMgWx/GeRpy1g0TnIJYBuVDAMYVF6uMj5kngLKnMO2vnyL5oULii5jnq909SGeEoD9cT/eIiVuQfslC4DSZundjA3jjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187935; c=relaxed/simple;
	bh=wQayJSl9mKm0NrGijWv71fj2ISrWHnhGG8SUCEhlKLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YnMxHfjEW4164q0Pqj4KcbszWLRq2pBu1sli3W8jUIy6NwcJheY7qD2D17Ank+42MpulNG9J3amAxxK2/Mo9NmPCn7JH8xeHPSRx9q1U70Qlm3HVtKzYM+wm8wop9oJcaC12QZZh0/w7JRAZIg81Z7mKo6rMqypMNf3R/NJccaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VIfic17F; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VIfic17F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeuK8cYg94XRkpAC2WiDMefqUeSfqJUeKvQIKoQJGsr2ttyHkMCA/U0ahVAxHzkfBkE8ZPjaCHbzjyYtt3dCaoMuFFKnR1/tv4BLyWq7grXWzvfjAiSE64qEVui7ZhRW7cMuDE4hEx5RoGLXZ1MfzJapI9a/DaOWoCr3VUDk+IYkjZvs+vkud7qcySx39dtS/AnuaT53YNidq7BV9Nr+PY4Ut2mk9elFcr5Gi1HEbDqy0Xp0jn3UU7L8aO7dvoiA+jtxspNNxaeGR9PVi16fQumZfc0zKG6B7KShzTa8P6Y+VydJWBPy73pkV9KRrgEmnogQ2Q/YRuhcriPmVE72hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/53z8ITqfXFWC+sMhHhWXHuLi/iQRhPNWaWK6VEnh0=;
 b=mH+HirPLFOQVNiTMbH7NGIvfwwvoYeUv1GE3VUHk28f6wB8JgBOiHY0/gsEdBIU8b0IRDgtansss8Ub6nRj6SQZl3wZbIuMPY3Zo8NPBURNDRTiJIUhESK6zXhCAB8ZY6YAxL20JTHV4skFovUC97IvCK+COqSjMp0tYYW6uqQDY8RfzXWpC60CJCYnww81nk5kOeKfSbBtucXVO8qLMTPIZw12ArHd3SBZoGKO0dmG6H9eC4NiQwCSfXk5Se7vACQhuZrrtKFoK+1/R7mKwH+xG1Nd/D4Rr5zmo4cJPyRLuT0dCGjb72CYazTiCb4k7knu30fSYna5B8BhJN306BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/53z8ITqfXFWC+sMhHhWXHuLi/iQRhPNWaWK6VEnh0=;
 b=VIfic17F542G/EJJYCBbqY98CZq31Xd7JvTXNQ3M06tWDBu1etEvpxpWUJBj5wqr1xwXuRADzgrK1gxtebmuMep5jZt6r78n3GRpiKV+qRvOMvOYAg3iQev86+dvCZKwjhFF9DwVDUgD8lCcsubDj+OaMtEAGNoFG2Lo/sSjaXpkr2LpYhbfXLH8I9zuFAMw32W58r2JYSyE5JO5m9brmz9gYKQyceMt0rfWZqgZlpukAcPSKUgeopFnSruoeGLpof43n/iwrfl/23PbTLdFU7CvxngojkgZD5oUgUKsIfeySI3FgiawT0EEzaLpAnadoUCFtM9uqsHQhOlHI7g1lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 01:05:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 01:05:28 +0000
Message-ID: <c4159bbd-fecb-404a-89fa-9465571af889@nvidia.com>
Date: Wed, 19 Aug 2026 18:05:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] gpu: nova-core: extract radix3 page table into its
 own module
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
 <20260819035221.336390-3-jhubbard@nvidia.com>
 <fdbe379e8d152336a2b55671e36c765ba1a1c699.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <fdbe379e8d152336a2b55671e36c765ba1a1c699.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5f9ac1-af8e-4222-2e4f-08defe571fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1nnhC6m32P0AhKlXYT43titIpwi7zMKQj/28s6AAD3yBqudS/n88BNBMIrPZv16DYofb5XgYMwdFaMTrB4TGlegl5WENXuDqud9H8mKnQmD1eRv5XthHzpvA8tz1Pu4HAaLd/0GUi/eEV5MVRrDxiaz81I2QXxKCMLoeP9uRmGiAbq8CzMKRU1zsgRcYSwXhqG4A+LiFz8yNnBmC8RAQckpwn6h/T1/tRsIZcLNB8tSzaYItLrS5X2AKmV3nGClbEvihPuMoyyexpOn2SWMAHQpmcTXWOOfGaT/uHT0gJ9gFKRSoY3GOD0zuH999xZyBOR8sOnPQ4WgHM2dPBPF0qADuMtDU5LlxckPCH2TuTi1wQSqODm5z6MHV6A5PY112Vx8CUKkVtMLdtn2/BSmQYU/lvDhUo+iP03yTvPIQ9Gqg3jaRVkPAi9ZucWudQOMHdH55kORK2n2fzy4AmSQ3n9SUPgDGP3n80oKt9KQ1kbXOBUZTsq6GFOH2RKfcqdj/7/AoIIMTgifeZKIee+5G7P1aJC4FJe0BjwM9lZ0KopwVOPC10xISnjWzNds5hk2N8WD7zPZb/fbC2dte6q04eIs9edmMpvAcRDb3CsFrEob+E6dfjGJA8znQkeoKnL5gma1/Lplu+44+oqXdABvgQp6pyBss2PFuomLUIAI6sjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUNEVGlLZWp0SVF4MDFzcVhBOEUvVnY3UkZkTlFCdmpNU1pDQUxOOUwrUmdN?=
 =?utf-8?B?eFdnTEZ3eGtMZjJXN1BqLzVhU25sbys3TkpmeFhhdlRTcXhsbzhOYkpUREZo?=
 =?utf-8?B?NWdGc0VHdm1RZ2pIS1lwQ1dEY3lyK1JvSHRhR0s5NGM1dzhHOXM3T210RzFl?=
 =?utf-8?B?YithdGRIcG5LQnNKRDM2dWMwN09CTDQzelozc3gzQ3VBUTNXWTdqNTJzUGpQ?=
 =?utf-8?B?alRwRW9pcW1nSzcxL2VFTGZYK0E3TW1XVGNERlNKQ01VTkVoZ2puLy9SbzhI?=
 =?utf-8?B?ZWNEK3BWVy9LbWw5UVRubEEvKzVTRExjVjJ2RVdQNXRoS2gremNrU1NqUDJz?=
 =?utf-8?B?OHR1dXRUSnlFcHFIZzg5N0pNOVlZanEyRFJrK2tDbVhkLzlkVW5YT0d1L1I3?=
 =?utf-8?B?QjYrYU8rcmI3RGhaMUw5SGZGTEMvVXEwR3RldE9kU2JsUnprcFRsS1VNY2dw?=
 =?utf-8?B?dlJzMFRIN1JUNTUxSXArL3pJNUlPTDFiVmZSeWhmdUtWRW1yVXRjdXVvb1RO?=
 =?utf-8?B?T2tWZXhsTXB1T1lpNStrZW5EcHFHUEVhZUl6eVRDN25zWXlDdStkc0VTRE00?=
 =?utf-8?B?bjlKaStBMWlweVc2cXdTajhiY0xOQjltQ25mdWJYcGREVDM1eVlzNXZtQUJY?=
 =?utf-8?B?eE51eTZUYVI4RW5PckxyblNCK1BNRWlIL0dQd3EreEQ2cG5kTFhZWEdld1FY?=
 =?utf-8?B?WjV5bmQ1bk83UHNXT2NMYjdodDdvNlM2T0dHcHp1WThYZzRSNmFJTUpkOVRh?=
 =?utf-8?B?cnJkVTNHdlJlZ2ZvTlg0V2JHYng2WS9XNjhFbERjU1dzVTBENzZFS2Z6dnQ3?=
 =?utf-8?B?bkt1Y2dQajJzUnV2cGJSZlY4WUxRdFNBcVZSL3Z1R0lnMW5PbnZVUVRmUkR6?=
 =?utf-8?B?OUhnM1pldFZYbEF5R0VGdEk0dmdHaEs0SVZLOXhKcTR4a1dQNUFCbitzV3JE?=
 =?utf-8?B?MHRkZjBZQUl6eDZ4QktRZzlsQmo0NTVUR3NocUFGWnYzOHNFYlQwN0JneUZ0?=
 =?utf-8?B?Z1hieXNuZWpCV1hmWnpqaEhOMUxQTUdCMGE5THl0SlhjS2hoV1hEVzdGRHVa?=
 =?utf-8?B?c3lTdHdpWkZYaXNSTTRDREdyRHg5dGl2WTBEbXp2YnBrVXAxaHhFNzVXZzBF?=
 =?utf-8?B?dUpyTFJCQ3djUHNwTHdLVkF5UXNERklhVnFNMm5weFZQdUJUU1M5cnBCeVZH?=
 =?utf-8?B?UmJXUmxKSkdpVnVmMlFnek5GbGdQL2RTb2xqOCtJbm1kSkcvVyt5eUU0dmdI?=
 =?utf-8?B?NDlsVXIvUnpZN2xsZTdzeFhPWC9HVzZsaHFSVm9ya2h3U2VXZDNJMFlsT0lX?=
 =?utf-8?B?UE5pejB4SUVNb3E4clR3ZzFxQ1plRWl5NFdZZHJ6WWlGUC83WWxrSmJKRm9t?=
 =?utf-8?B?c2RaMmdLcFQ3ZDkxSHlSUk93aFFmTXRwWnpDdGRoR0RMbmg5RldnK2ZEemU4?=
 =?utf-8?B?VmVXeE8zWnNVUDJRanRHVjhUbWlhdHJFdWJ3LzlUa0RoQ3BTdWtsbWJRSHlU?=
 =?utf-8?B?RXBhakk2M0F6aVlBeEUxQlBjbWRUWGRGeDBVMUZGcnNrL2xRN3ZEWm56UmxE?=
 =?utf-8?B?VlVJU0laUklHaWNaZTZZc1dTVlEvYjE5VUVKUmJtMkNUaXJRWU42L0duck11?=
 =?utf-8?B?U2FZWFFVUThldW80MVlhYm45MFFvZERFemZJdVI3Qi9lVkFkS3NDTEpwWWhz?=
 =?utf-8?B?ODFWNkdwUW1HTks5UXY4UFdIYkd0Z1pNUDU3TUNmdE5CQkpLL0xHMG03aE13?=
 =?utf-8?B?NjVqQmR0bGpGekpMMWxLTUkzZlZScFF6MFVSUDh2cnA1bVpNYzliZFFuSTBO?=
 =?utf-8?B?RnRKZmZXeS8wdjdIME1LTUx0OGhGekQ0R0kzblBRNTZIeC9PS3FTMDVqMVNL?=
 =?utf-8?B?REFpUENGcnpSVzRSLzVaV3dCYUgxU0tleXlSeTZYZDZ2TzV4VmtzcEF5dmZa?=
 =?utf-8?B?djc4V3Jlcnl4ajJHSDV5TzNpRXB3YldJOUFPdThadC81MVZoQzJvUFEvUXo3?=
 =?utf-8?B?S2RQYzJpWEJTaWIwUjRva0J3UTdzRHJyTUVqM0Z5OG4zMFZKc1hwckZaRWw4?=
 =?utf-8?B?VFFPSTBzVXhseHd0NUJ5UEFMWmt0RTkxZnFRYi9CQ0crcnJGNVJldVowTmV4?=
 =?utf-8?B?b3A5Vkx4c1VwNjZreEpES2dZMHQvVFh1OHFFSVBZNGZmT0d6SWQ2UGoxaitD?=
 =?utf-8?B?SWNFcFlYSXlmcmhLamJxT1dWZlk1V1F4RjlNOWdPSC9iZUJMMlhWbjdLc05H?=
 =?utf-8?B?cmNnYTg4U1ZTSm9JQjVGNnJEUzZsYjRkOGltelhWRlZBWE5GWHUzZ1VlUkh4?=
 =?utf-8?B?N3NiY28vYjFqeUlWdU96WkJkcHVQNWVCYm0vTWpFTFkwMUxxVHFlZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5f9ac1-af8e-4222-2e4f-08defe571fc2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:05:28.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6uQrtJh/vxc2HMnrhBw7RAO7ynULG+eSuffYj/GllYDM9C5B5Rix7OKGhZukFkhcaTmGLlG8VdPO7Jp2D/xbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369



On 8/19/26 10:37 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:51 -0700, John Hubbard wrote:
>>
>>          let elf = {
>>              const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
>> -            let elf_size = u64::from_safe_cast(gsp_fw.size);
>> +            let elf_size = u64::from_safe_cast(gsp_fw.size());
>>              let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
> 
> Just FYI, the GSP images are no longer ELFs.  With the transition to TLV, the actual GSP image
> section is extracted from the original ELF, and that image is not an ELF on GA102+.
> 

Yes. In fact I removed all mention of ELF and elf, by the end of this
series.

> $ file /lib/firmware/nvidia/ga102/gsp/gsp.bin 
> /lib/firmware/nvidia/ga102/gsp/gsp.bin: OpenPGP Secret Key
> 
> It's not a PGP key either.  This is just `file` being confused.

lol 

> 
> I probably should have changed this when I removed all the ELF code in my TLV patchset, but I
> didn't notice it.

thanks,
-- 
John Hubbard

