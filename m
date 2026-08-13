Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147235E1D9
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786661168; cv=fail; b=dAMYgAjKSX4cfxOGoLoLHQpEadwDPaLovq+p8zHjgptrg2uwXGqq4L4wQq2DUHF930pUIJTGMX9mL+DKIoqB6ElMjCiT48KW0zH8Lf2t/J1KSmRH27rcTVo94falzTK2LfkhSx0830tFfg+lzRU5wl2oQaDv/fOBhoK0W6pyWoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786661168; c=relaxed/simple;
	bh=tOfXd0PxfOOyFhU7+F7jMQeVqOIHbsaJIZlZEaV9BXU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S6N7rvRRQB+/f10DKQYKNc51H4Nn8XN835aP9HY/GkNu+ZupaW+n6ZKJo18az9NjNeHSTC5ZAmp0V/baD9L3eitkppr1o2Y2qRqDZk0QRy3w4YUHY5W+ixePK6l6Z3VapHWuvBCQOLP6bknRbJSHQ10OwiBeJGfPDPUYG+GDg14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CoZU4jR4; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CoZU4jR4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbckpAwrpJ+A73YCgKQTU8VbWCzVuZIgqc/j9DUa+aaZ0/g0wdD+SNRa/4CxPYr7Rld7YWHjIdxsvzQjbqMumGD3loltvdlnOwCQ7j/FSiPkiCzuK+3REdNaMNRZmOEfa1CIdj8eUNhmcuXkGXKwVRnFQk+Q2EG6QnRkL0DxcYAkkzv6c6NBjMVTgg41CsjiZoqhUqUz+r4LJoMJ+igp52x/db2B40HmLRM2xcIrUOiSYdA9iLks0NXwpH3Nc0+erIf4f/FTjEOaOPP92bGQril2Z70UFy7HD4mfomUvQGvT8+Oc7QDH9fOM4Da/RZJYDw4/OXNoErYku2YqXVUJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEA2G7lvmRj8eK/eLPuUhCM+4b2sWRn4/ZIhNj4xY48=;
 b=Z+lql2xAr4eedavtTz+Hah7GTwMU6NSA97dZGvLugQzblDsCY+wEU1gKVZCALYiVVIkHiXGstxQgZXApKhb3LHcmSJPH2UkCDJKdnDMjxNLjYp0zgzluRgFLJU30EK2A4f60AB4Ykmr8JkZoJYGGgCZc+UhD+30/Xbc3nnKh4+NlxdXfjMDjqungFYiSexcJa78M4i2eSKGKuO94UAguswc7DUoSKCijgq1uFYcIy38Y06bO2T2U04okAj+N4xyFCHtcipRRtIqUhiG0GvU1gmItqCLv7HQiStJ5g2Lwwa7p5Ml8DzYl1ZBHfX3hEy578rIt5Zot0qKOjvVNYpW1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEA2G7lvmRj8eK/eLPuUhCM+4b2sWRn4/ZIhNj4xY48=;
 b=CoZU4jR45xDZk7CnkikCryBRDfLeMHRcP75C1FP/YD7vpOSHL9wZC+bLhBORKduAka+nKZB7fKL+Vr/KnInsnoIYG3HmHWCcegbPLf4iGpB1mfT1ZIuPHoIHwDGG7kOCGc7c6psXb+1gnMWcXa0Zp8Py7dvCwInKR51gcYTNyqAzcv3DeMB1KFdlqWXxkg6nI0XPgHMCcJNBrfilMUE5zBiicBtKICKBs0sdG6PA9LDqm+ul7ZHS2L/G8xRSv/P8wO19tRD2arHbgukLSHVOgJguASMUwX2VsQZbln5M2XVEOngKucEJC62hKVbcpb+OfLoIiWzwsiXi4HDh6FoowA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 22:46:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 22:46:02 +0000
Message-ID: <6ce3f5cb-cfdf-4122-9c06-99a07ecee94a@nvidia.com>
Date: Thu, 13 Aug 2026 15:45:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Will Pierce <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
 <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>
 <DKO63NHZUU47.27B9TJ6B1FB8N@kernel.org>
 <39b44d64-928e-4d65-81d5-a06809233c99@nvidia.com>
 <DKO6C2WX7ZRP.XRU16IG7PD5I@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKO6C2WX7ZRP.XRU16IG7PD5I@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7461fc-0d70-4dfc-841b-08def98ca688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mA3A/+Mm0JvEl7EVGW6Bg7LtkcQNzM/6jQszLDVVwwsVE3cjxQ4Dxsa1fun+Dkldj6EXp+RcB9/caczWW5jL/cWSxzrmo/jguxsnkMejnont43A+HnwQe+NGeCcjqcOoeholt67HkaiEfKd/qnyWqTdBa3TecwaazdpJyo8Qyt+0hLFB8S3qBUwO4/8JytHVUgkoUqLQn7OR4jwc0l2PT512AklGMdV/M8Q4n5ttKzi1CxwSF02CdfWdj43vNkY6k2NKqA3Y1y+/dzwIBve4tiJDzXP2OS4hDL84t/aLRvbmwimUjAG7ARh6cuaswKWgQpBfUTjew912KaiA2OSl5+8dNG5WSvKSJ4rtE3kTjUU0lNBjVAwTdNzpGAw9ClwX+3nVJPSPtiLOGa57cP/lbWjpx0FaOlAPcZJ3tZlLwxIs2eCJJhuaoLVs0vsl5MwDb7d6FgYgV1qT3s78CxQBVoQK+CJzgAdLHiyFY0+MxC95bb7CL4bdTDJV52rwshPoc3E9hWWD/5sKa4mRIeuARvf85YGLypzRQKUYQaT43Bg9Io7dpgCF2QWlFZUKbU9EGjDDMQzbZagIXuvWy8HJ1ShU4azWZXfYEwy1XmDaG6jbU8hBAxcbpXy2bxoEt4ImARO+MvcFOfj5FivDj9CpcnoM+zhbAM+BRbCO9l7q0PQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWh0eUhPQldTaGMxVkNjMjVGOUhGUU54QkZuN2pQMzZJa29TODU1Qm04bGlE?=
 =?utf-8?B?OURGZ2pZUHBOb0FIOEJoS01naVdFcWRJQUN6K2E0VFFGeVQxOEJVZERrOTB0?=
 =?utf-8?B?M2lwTHhJekIwS1lFTnk0emxUYlFsdjlpWWhWOUZtNUw4U0xSMnBqMWxTK3VF?=
 =?utf-8?B?cG5ySlhNYm5lOTArbDQvRnpXMTlBNVFUNEFLZVJ1a1p6R0lEUkhjZnJWV2dX?=
 =?utf-8?B?bkxLUG4zQUt4TnZneVVybkJSRFV5USsrcXF0NkdhK2NBamphV21GUEl1dXJX?=
 =?utf-8?B?K1QrMTRVUUpDdVVpNEJkNUJsNW56dW80blR5RTErQ0FZSUczMnNCcVBCV3RR?=
 =?utf-8?B?bUt1VHlRUmhWQjU5YnNmdHFGMHFxbC90dzNNdG4xRnorY3ZPS0xyN1c4Mzk2?=
 =?utf-8?B?d0g4WUxsUXl0bE9HRFVSd2Q2OUtuN2tOQ3U1S1JTU0w3cUNVckpFMG9XMWx5?=
 =?utf-8?B?Y01iWDlGWlhCcFBuRURyeERlYkJ1U1FYa3RtUEppUW9KMklLUjlMK0ZJb00r?=
 =?utf-8?B?ZytrUWMzUHhMOVdNRm8ydVEvNkk3eEVoUVdTVzZZeGJEQkFrTGxsUFIrUjJl?=
 =?utf-8?B?dzBhNlN5dUFwK1V1WkhwM2U0WkxJUmtFZkRHSlp4VFhlZGdwT3lrK3V4N1B1?=
 =?utf-8?B?SDNhTHJRM2o5T0llZzhPUUlIc1FveGhHOW1FajRKMHRmVU5OWUV2UDh0U2F5?=
 =?utf-8?B?OTgrbXo4WjJQUUM3YmJ2TURlWnlkMFlxbW5hRjlxNDBJaEtCa2RzWUQzN1pX?=
 =?utf-8?B?S3B2Rjl4Z3YwNzFtOW5yUlNJTEMyYTF2dmQ3TlB1OE1iTCs0MnpaZVhOTis0?=
 =?utf-8?B?ell4bWZJcGJoelNtWjhFNnFVS2Jnb2gwd1J5TTJ0UW5UL3Nkci8reVZaRjJh?=
 =?utf-8?B?bHhWRGJRQ2JIemlranlJQkpJdWpCaXdvaldIY1UwYnh0SDlOOUtFNnpaN3Qz?=
 =?utf-8?B?NzVHc0pPRmpycFUyckNtalpOUURTWE9CYVpSeXQ5cVBMQ24yZEZaM2VCcU1v?=
 =?utf-8?B?OHRpSUY4L0JhckJ0L0NJKzBnMGE0SnVxV2JVd25SWVJIMjJTZmlPQnA2MXEw?=
 =?utf-8?B?dXlwaVBHdjR1UEc2OGRHQmpaNGdtMEdUQVhkeW1NSmYyWlJiS0crdk9MS21a?=
 =?utf-8?B?NEpSallsZmQ1TnNEbk5UTndBaDBDTC9WQWNmN0RQN3FEZXpycmNMdkdIYjBX?=
 =?utf-8?B?b1N3TzdEaFUyRHlkRlJxdFJQbjB2REk0Vkh4Nk5jRURicUZiVWIzU2hnZ2Zk?=
 =?utf-8?B?RUNIZXJLT0h6R2d1Yk16d3E3Vmkvd3N0Z3paRVQxQnVvZCtlS2I2N0d5aVEw?=
 =?utf-8?B?dTJNbXRzZXlScGlKTzNmL2dTcHBuUWVlby9YZ2hRek9WUGh3ajBSdDR6L2gz?=
 =?utf-8?B?RktRc0xHeTYwR3lremRlN29MYWZGYkZpTTdFcUNtaHQzSDFmVElxK1VsVjZm?=
 =?utf-8?B?UmF1dEFMenN5Nm5seDJ3YmZxR3ZiYVZ3VVk0QTFTdUpZSExXZDRtMVdHdWpR?=
 =?utf-8?B?bUxUZ1Y5Q2Uxc1pBcmsvZ1pwMzh0Um1aR0R3Q1dVeTY5NCtWRndvUnRTTklk?=
 =?utf-8?B?aVl3WTBXTkJxSFl0d1k5V2l1T1dZSmIxYmFIWk9GczJRVHhzd2ZNWll6L3dG?=
 =?utf-8?B?cWRwcXBUQ1dpR2o2MmVhUGRLUGphUUlzcTVoWWpPMGs5eHkxUTBhMWU3RG53?=
 =?utf-8?B?dERURUlmM3lUQlNUOVd4WlErTGp6RlBEbzdSQ284TmZmWStIRGMySGFjalpT?=
 =?utf-8?B?bm9kOE9Bbm9vbGlQUkEzWFNmRjFMNmdrMysrdVBjU3FXWE5RQ2xEMzNadkNj?=
 =?utf-8?B?Z3RiVkx6V3hvc3RsMjBGRG5NYzEzSU9oWlNNV2x3ZTErSHA2eU1LQ0liRGdH?=
 =?utf-8?B?Z2oxT2lmVGpIZHo5aUlCdXZCVUVEYWh2bHBJNHE4UXRvaklSbkg1SnpDZU0x?=
 =?utf-8?B?NmZNMzVBdnA4U3FlTWwrSklCRjhuR0FpL1crU3FGTG84YXFDSzA4V0c4anNx?=
 =?utf-8?B?ZW9zRHRkeUlqSit6NlIvbkJBcTh4QXorUzljcW43cUp2cXB5dHR4bW43UWdD?=
 =?utf-8?B?WDM2VFFHbUxiQTM2SzVVYURBSHdkRGtjeVR3R255clcrWnNQZ0owQ1pmd2F2?=
 =?utf-8?B?K0ppajJRVFZuVU51VTFlcHlXR2o2WE0zdFY4eWgvNUtOTG1HcmtBT05FTFls?=
 =?utf-8?B?TzlQd0pRZzN1dFhxeUNqaENzTEhqdHZsZDNVK1NCd0tzMlRkSytXUWlybU13?=
 =?utf-8?B?Mm9jOG1Pa0lEQXp6eHBJd2lVbFJLOXYzaUpOYW5MdUxjeC9zR25LcmZFaUl2?=
 =?utf-8?B?MHN0eFlCNlRYcnFieU44azloQmZwUlduR0dXL1d3aklSVTN2WkJpQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7461fc-0d70-4dfc-841b-08def98ca688
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:46:01.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5NX6a9ttX8vpLaue2Gy+akUZMPSxh/nuinv8AVcBmE0nm+XBfLfjd8P+9uuuR5ahtGel0Ma4s0Xj0kYKA2/4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824

On 8/13/26 3:37 PM, Danilo Krummrich wrote:
> On Fri Aug 14, 2026 at 12:29 AM CEST, John Hubbard wrote:
>> On 8/13/26 3:26 PM, Danilo Krummrich wrote:
>>> On Thu Aug 13, 2026 at 11:43 PM CEST, John Hubbard wrote:
>>>> On 8/13/26 2:31 PM, Danilo Krummrich wrote:
>>>>> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> ...
>>>>> I was about to ask if we really need to bother with MSI and shouln't just go for
>>>>> MSI-X only.
>>>>
>>>> I have an expensive, recent motherboard in my test machine, and it seems to only
>>>> expose MSI for my Turing, Ampere and Blackwell GPUs, in the non-SRIOV configuration.
>>>> So I'm thinking that MSI-X only would not work.
>>>
>>> Interesting, I just checked one of my Ada and one of my Ampere GPUs and neither
>>> reports MSI-X in the capabilities. Other devices show up with MSI-X though...
>>>
>>> Are we sure it's not an endpoint limitation? I really thought it's not.
>>
>> I haven't really dug into it, because it seems very clear that regardless
>> of the answer, we need to support both MSI and MSI-X in nova-core, right?
> 
> Apparently we do, and I'm a bit surprised by that. But it would still be
> interesting to know what's the constraint, as this seems to be an endpoint
> limitation. IOW, how can I exercise the MSI-X code?

I'm reasonably sure that it involves changing the BIOS settings, because that's
how I enabled the vGPU case about a year or so ago, when I was verifying that
this test machine could support the vGPU configuration. 

And I vaguely recall some Kconfig settings as well.

At some point, the machine started reporting lots of VFs, instead just the
PFs. But I don't remember what these each reported as far as MSI or MSI-X.


thanks,
-- 
John Hubbard

