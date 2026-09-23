Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251747A88C
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195793; cv=fail; b=IDsZA45XPoqRIkL1PXhkbT/tPTVn6hhk7pbV8YQM/qvh6KDSOzvpx33FV/VNRTeYCcwmqA2Vj+7AOLbLiG68R73lxuoJ1sBamkTwEgOTqfkDE5Kh+Y2EG45qNoQAqunFapCzmjMc0J5aV0Crqnr6Chw0gXvBPY5LCE9hSQ4Pw6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195793; c=relaxed/simple;
	bh=BvjIIZLzx3Go3OSWBl+o5fIgVYPjrynkgyrCCuLrC38=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C+8F3TRkLyGMR1yJ2sdZ/e3Z8PnxDjKmxnJQdQ/agIsZwLt0O8MlTTTHcnu8BJuEG38IJX4Aqo1RuHKUQTJBfZfQv12OEPbPi8+Hpl84Dfzd7xAF/HwYkaX4ZRqDnpKXW+7u2/NwjxTaMgHngKhiprgVLW4XyvJMkLYypc/iDAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ermEzO2L; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ermEzO2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGjAhgYWqzU7lrW9i3ubUJF07BdZ+3uOIjJRhJPn4+UVBVi23TioYxIvKCYD8SRWOAOzzilUVYkXtk6jjrsqvnxuINUwNuRDobbdP8ZsFbxWh7Am4DeeKQKdQc7WQmDsXTr+oA7H//ZaO7SxJ6eGkd6tffJPA7bhdSbro6+zcJdOArnpYwPZM1klkIsx82/CeGmgbZ9pMGRtD1V3RefC0FLxu1YFu6tbZN1aoa06qTos/W1PFkgtTmhi4khDvfYfPPD/EsuZIp9mr4XMG8JNW8AaaggBxioLEIwgxKceFBbfTd/PAfz+1W6PaiJX/GryytDDm2SEqst0tRPVgAEifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bCQyRKYGwvki78A5j0amwHXpuz1rpFoDZFjwU68A9M=;
 b=iDNOHy9gje+/rLa4NLBuKLOBxLwlYdvW3a2JYy+BwlWn8tJvvTbu+jE0bsp2jjUFr2P6hhUaHibPc8WK05H7pExQzrSZ9+mNSNKUkJGujJACLj0xrSiUc2b0i0ixWOuEEAleSoCwYHsbJyMreFguLUXo/SyZaqTxoSM2lq9NMRN6KvAR+O8iLje0jI2RVr2AfyoqnXBrdZ7YSQ4vQqD/oifrFAHz6p3VyVVn4cyp/2bEf5dMJXgKmMF8zOlUptm/kx0HvlcxUUfJ2bfU3zsTkc3te6tLXZIusSxVj1O1I2kuMZIPlopAQ92w9wTthlyRM4xNN8J+i0XdM2bnsGPmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bCQyRKYGwvki78A5j0amwHXpuz1rpFoDZFjwU68A9M=;
 b=ermEzO2Lc8aVdkFgiNOn4pTV9Ni83O4+JBIS5FLtF4jghwrmdLf7TMpYGwAlsqu6+NtkeufH53GAEj1pw/c0gtFNhQ6xehc5yDbSDHh9ZIpHziI4HFB7bKsETs/JMxkg1WELpAWZcwe32uoQrAmwIAt5iR/wOygmC05ySyw+j1486yEsO0vQPaIh0JayL9Br2o3w+x2+kIcqPZpCrqzP9T2Uohj5x0d/+/qLauwSV8h+LTNMd4+PhUlssCzvef8+H4LNa2QtuNSvu+jrS6Bb5DOWuPtfuc4Gxihenucn+t515Fi83l6JcfJ5yZ6mrPzf6kcAVTAdzWIeIZOGxVXlmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Wed, 23 Sep 2026 20:36:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:36:27 +0000
Message-ID: <d37e97d3-bddd-42c7-9d0a-b5ae1ce3b395@nvidia.com>
Date: Wed, 23 Sep 2026 13:36:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions
 from a count and a slot
To: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-9-jhubbard@nvidia.com>
 <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
 <DLMNTQWLGXJA.39Z56H8BZMBPR@garyguo.net>
 <DLMQ5TVNFSC1.2AGU37ACR0Y9Q@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLMQ5TVNFSC1.2AGU37ACR0Y9Q@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a7bd82-61e4-469d-2a0c-08df19b25762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|11063799006|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IdoCFarsV91pAqwB8AYG7IaivLCvp20HQ4KpNikZ49lKyPmapetVkC37jxIDOlvQUFwWZUGZys9rMcsr+MR9zc+tmYeqBDl31yRniU/QTNEfNvSLCAqwT/7DudgdmtABisLmjWMiov91KgNAi4VmGHsxY4bm4HJhCvXUJAmTNrByFbCiE6PExnf2ZWQ61Sgw3ZgDofbsiW7iaLSmbLOFF2ToXQp9SiMGXz8Hol1/X+UKJn/ZQFRumXz89+HfxLXoY9AcTsFlzuh9p+6M40vSv+dkwotkfjEn+Owa5nJNCs0TaP20Pm0bDi/13uufXKeKn+bo1B2goXW7W5Qit8186U3YHQ6zlVFDbvo2pQ7cbnbnXEF5VUmRGjqcsJc/gOufs24VMt5vMpyuVazAnhj8466J4wo6qboQXiIw7CGrgJ/ZgS19Eo8B7vjptSdip48l19PnLvOJL4p3/DWpsrkknhStQYN2FAq46v1GuGAOaPC6+livr9UpIHbyMp9oPbp8v4DXtfZgC9tdlA8PKTSx3a7SlZa8hNqrb9stLWYBsbRP1PByTt2VaeuOAi2LLoITj5Az/jT94t5x/QExOwMLXNOPBRAdSQiKz1a9tMOoaQm5CxSmnMQCvCvXQty2cnMfwEqUKnSlMnZm7xIhzjFQgoW6dI8/Y20luzASOHyO8Rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1pzbk5rVnpHZGh3MmVrNW52aFIxQVpLempmYWdEQ2ZrUVlXeDUyc0NFYWhV?=
 =?utf-8?B?Rkc2R0FvVm84elhQeUdsbkU1cXBia2c0NjdnRGtPK1hoTzRzK1ZGK2FOYjhs?=
 =?utf-8?B?eFZrdkl5NjV6WmpPN1YwTmtpSWREVFdrd0p6SDFDZlZUcDRuMTl1ZjZyWnN5?=
 =?utf-8?B?V3hGVDJ6ZmRsZ0poNlpZVjAxM2ljUGt6OWw0MVJWRks2WGVjeTFuR3lCZzhY?=
 =?utf-8?B?a2Y5S2VEVVI1UVQyd1g3KzdCRW81MjFUZmpzdU5oTkx6cWFYT1NoSVBINUJ6?=
 =?utf-8?B?a1hOdjhjUUU3M29CWnF1SmMyVzJuQm9pTUxXampPTjNuQTN4aDZza2pQdmRs?=
 =?utf-8?B?eEEvMG1qSXRHOTdSVVpDTGh6WWpWbXNIZm93NFJGc0RrNjNKaTZtYUsrYlJw?=
 =?utf-8?B?UjVUeWVTWGdOWGtPM2pTMXhsM01rLzlDb3FGN2RjbGh2Q0FNbmVQaUVwWXNz?=
 =?utf-8?B?dDZWUFg5clNxRWoyV1cvLzc0ZUQrekcyYW01OWVlRENoQkNtVDRaVWlUQnVD?=
 =?utf-8?B?cnBld1p6cDkyeHlEbzVxZkhwdUNDNDNRTUpyNzZKTEIzUGU5c0dmbHdGVnJO?=
 =?utf-8?B?eEV0ZlQ2OGU5aVZleXRLWnlkYU8wS1hRYmdtcDhhZDA3a1R4cFRKTEg3WFZM?=
 =?utf-8?B?ak9ONi9lTThQeU9Jd3ZhUjZDRUVSV2s2anlaMWFHRmJwOFQza1FTN0o3ZWlL?=
 =?utf-8?B?TVdpTHd1MnFCU2hQWVBIT29jeUplUkVoaWJUb2tIR2VQMEhnOVVYd1I3Y0JJ?=
 =?utf-8?B?MGU0RHBJYlI3ZlNkalFXbXZrL3YrUzRYR3JmUllZMjRtZVFEdmo1MDI3b1RL?=
 =?utf-8?B?dmNmTGJqYUdtbEltcXRpRG9JZ0xmMlIwUFFPc1FOVExOODRKZFBVK25oY2pl?=
 =?utf-8?B?RndKa0kxbmJSN2NQczZYem1DRkl3Y1ZjZXNERVhZam4vckZTSVBuMlNWemZm?=
 =?utf-8?B?T1ZVaS9nY2FQU0gxMGx3Nm1FSXlWMTJnL1pad09aVEtRaHVQVyttR2RRa1dq?=
 =?utf-8?B?TEZ5YjFJeVlCWjRxWEN0b09hT3lsUjlkV2phYmZRcEZmUTJaVVBhY2hWZjNi?=
 =?utf-8?B?Y3F3dTkrN2hYWXJiRUJUS1ZmSUlYTFBhN3dCSnZmb0tsSXo1dlBWTVpDc1Fj?=
 =?utf-8?B?cm90NTJPWFlvbzFCTTlvNFl1YXVURmR1RmlzcEZSbGxzbHdLRWdxUkZGSEFs?=
 =?utf-8?B?VFY0S2hFRllzZUE3bWxEVm1PaHZJbDVkUkZBQWxMZmdxcVRsZDhScDdsNTBH?=
 =?utf-8?B?UUd6U0M0eHh0QUdyMlNIWUZOR0xDdEdjcjNhcko3QTAranFQVmNUOUVHME4w?=
 =?utf-8?B?YTBhKy9IbEhvWVVwZkFyNGl1Tm5ZWEd5VFRaaUVSNkVNQWlWUndhZElpMmla?=
 =?utf-8?B?b0RneGdwV2ZHZko0N2pyaU1PM0JleE9Zck84a0Z5R0hiVXErLzFsdkVMZ1l6?=
 =?utf-8?B?Q3E2Qnd2VGtNS0xIdTNnc0pnZDNxZyt4SUFQSHJYc3FyWGplRXI5V0RCVWZ0?=
 =?utf-8?B?anJWNFh1andmMWN0dHErU3BUWTdNc0ttcG1UOUc1QTNGZGo2Q0xZaVAwSkdI?=
 =?utf-8?B?QjllUVFUSGo5SXpKNW9TZUd2VE9XNlBGRGQwajZsUDI5WFZkNVFwbnBESytZ?=
 =?utf-8?B?MjhJUHNIRUpEaDZsRHRkeGFDbG9ZNzJLZDU2TllIN2sydEV0MTFzaXczamZX?=
 =?utf-8?B?N3dQUTRuckNBQjU2WXFxak1ldUY4cG84V0t5Z0dZcEgzM0NEbEVFNGtSa3FK?=
 =?utf-8?B?K1MwQVZqQW5RTERhK2dHZEpydWpsTk5HY2dPSlcwZkxNWW9hamVUZHNsVzQ4?=
 =?utf-8?B?U0ErQjhWWjc5SUJOZHY5ZWw2d2hsNm1DMWI1VlRXc1ByalZDMzk2T3NFajZx?=
 =?utf-8?B?QkxNSTk0cE01bU9OL01OSkVzUFRtSzRMZzdvWURBSHBoQmh0UjEvTnpzK0FB?=
 =?utf-8?B?dmVvZUkxT1YxSC84N3FUV01WL2dQcngvOEtkSk5KbW9qa0pmL2NJdkR3ZnYx?=
 =?utf-8?B?am9mZVUrenorc0RLTTZXYzFpaXZreDFxU1JBY2J4U3UwYi9zU1dSZ0pnOWhK?=
 =?utf-8?B?NEd3cGlYNkw0b3VWVGlyLzFjcDFUZ2xTYWx5TTNmZlFLWkxtaFVENER0WVNG?=
 =?utf-8?B?TCtLYlRqZmt1VS84aXVKVEs5UkhoZDdhOG5aVktkWFNVaWx6NUtJNkE4VkxK?=
 =?utf-8?B?OWh5cWovdWZsUEtMWmwwbGVlc1JlMCsrbVVaaVhJR3VlL2ovWGRKdFNVd1ha?=
 =?utf-8?B?RlpmMHRyRXMxUFlDd1Z3eGNGbmFRMTkveGVuZmZ5QWpWSTJYWnlrYWlkNHVm?=
 =?utf-8?B?b1l4bGdkVWpnZUFaT1kwcWxpSCtuZHZadnU3L3Vrb1ZoUjhHMkJCUEJya2p0?=
 =?utf-8?Q?y/8HGsMeKUp7CTlY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a7bd82-61e4-469d-2a0c-08df19b25762
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:36:27.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 937bTOYoblZv2dlqkX21sVfJYGegLZKa+A3kPNrUzUICgOLQ/AOaDnjTpu57a/Pg9nLeZG+JMQM4ZLchTt3HCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

On 9/23/26 6:20 AM, Alexandre Courbot wrote:
> On Wed Sep 23, 2026 at 8:30 PM JST, Gary Guo wrote:
>> On Wed Sep 23, 2026 at 5:55 AM BST, Alexandre Courbot wrote:
>>> On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
>>>> The r000 firmware uses msgq v2, the queue layout that keeps the queue
>>>> pointers in BAR0 registers as counts that do not wrap at the ring size.
>>>> The r570 firmware's layout keeps the pointers in shared memory as
>>>> indices into the ring. The two layouts differ in where a pointer is
>>>> read and in how the size of the region that the driver may write, and
>>>> of the region that it may read, follows from a queue's write pointer
>>>> and read pointer. Splitting a region across the end of the ring is the
>>>> same in both, and whether a region wraps follows from the order of the
>>>> two pointers.
>>>>
>>>> The functions for the writable region and for the readable region each
>>>> branched on the order of the write pointer and the read pointer. Each
>>>> branch chose where the two slices ended, and the function then built
>>>> the slices with open-coded pointer arithmetic. The SAFETY comments
>>>> argued the slice bounds branch by branch, so the switch to msgq v2
>>>> would have had to rewrite the branches and the argument along with the
>>>> pointer rules.
>>>>
>>>> Compute the number of slots in a region and its start slot once, and
>>>> split the ring at the start slot. The first slice ends at the end of
>>>> the region or at the end of the ring, whichever comes first, and the
>>>> second slice carries the rest.
>>>>
>>>> No functional changes.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>> ---
>>>>   drivers/gpu/nova-core/gsp/cmdq.rs | 120 ++++++++++--------------------
>>>>   1 file changed, 41 insertions(+), 79 deletions(-)
>>>
>>> This looks like an improvement regardless of the r000 switch!
>>>
>>>>
>>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> index 80e6e79c5f3c..a1c9b7cce255 100644
>>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> @@ -262,107 +262,69 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
>>>>           Ok(Self { mem: gsp_mem, bar })
>>>>       }
>>>>   
>>>> -    /// Returns the region of the CPU message queue that the driver is currently allowed to write
>>>> -    /// to.
>>>> +    /// Returns the region of the CPU message queue that the driver may write to.
>>>>       ///
>>>> -    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
>>>> -    /// that case the second slice will have a non-zero length.
>>>> +    /// The ring wraps, so the region comes as two slices, and the second is empty unless the
>>>> +    /// region crosses the end of the ring.
>>>
>>> There is a recurring pattern in this series to drive-by rewrite comments
>>> when there is no real need to do so. The new comment is not even
>>> marginally better as we lose the temporal nature ("currently") of the
>>> borrow. This creates churn restating the same thing using different
>>> words and disrupts the diff, so can we avoid doing that unless the patch
>>> actually changes what the comment describes?
>>
>> That's a pretty common thing for LLM to do :)
> 
> We're lucky that one highlight of this revision was to remove AI comment
> churn. :)

So true! :)

I'll take action to avoid this sort of thing in the future, sorry
about that.


thanks,
-- 
John Hubbard

> 
>>
>>>
>>>>       fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
>>>> -        let tx = self.cpu_write_ptr();
>>>> -        let rx = self.gsp_read_ptr();
>>>> +        let avail = num::u32_as_usize(self.free_slots());
>>>> +        let w_slot = num::u32_as_usize(self.cpu_write_ptr());
>>>>   
>>>>           // Pointer to the first entry of the CPU message queue.
>>>>           let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
>>>>   
>>>> -        let (tail_end, wrap_end) = if rx == 0 {
>>>> -            // The write area is non-wrapping, and stops at the second-to-last entry of the command
>>>> -            // queue (to leave the last one empty).
>>>> -            (MSGQ_NUM_PAGES - 1, 0)
>>>> -        } else if rx <= tx {
>>>> -            // The write area wraps and continues until `rx - 1`.
>>>> -            (MSGQ_NUM_PAGES, rx - 1)
>>>> -        } else {
>>>> -            // The write area doesn't wrap and stops at `rx - 1`.
>>>> -            (rx - 1, 0)
>>>> -        };
>>>> -
>>>>           // SAFETY:
>>>> -        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
>>>> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_ptr` and `gsp_read_ptr`,
>>>> -        //   thus the created slices are valid.
>>>> -        // - The area starting at `tx` and ending at `rx - 2` modulo `MSGQ_NUM_PAGES`,
>>>> -        //   inclusive, belongs to the driver for writing and is not accessed concurrently by
>>>> -        //   the GSP.
>>>> -        // - The caller holds a reference to `self` for as long as the returned slices are live,
>>>> -        //   meaning the CPU write pointer cannot be advanced and thus that the returned area
>>>> -        //   remains exclusive to the CPU for the duration of the slices.
>>>> -        // - The created slices point to non-overlapping sub-ranges of `data` in all
>>>> -        //   branches (in the `rx <= tx` case, the second slice ends at `rx - 1` which is strictly
>>>> -        //   less than `tx` where the first slice starts; in the other cases the second slice is
>>>> -        //   empty), so creating two `&mut` references from them does not violate aliasing rules.
>>>> -        unsafe {
>>>> -            (
>>>> -                core::slice::from_raw_parts_mut(
>>>> -                    data.add(num::u32_as_usize(tx)),
>>>> -                    num::u32_as_usize(tail_end - tx),
>>>> -                ),
>>>> -                core::slice::from_raw_parts_mut(data, num::u32_as_usize(wrap_end)),
>>>> -            )
>>>> -        }
>>>> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries of the CPU message queue.
>>>> +        // - The returned slices cover the `avail` free slots from the write pointer on, which the
>>>> +        //   GSP does not read until `advance_cpu_write_ptr` publishes them.
>>>> +        // - `split_at_mut` gives two non-overlapping halves, and the `&mut self` borrow lasts as
>>>> +        //   long as the returned slices, so that no other call hands out the same region while
>>>> +        //   they live.
>>>> +        let data =
>>>> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_usize(MSGQ_NUM_PAGES)) };
>>>> +        let (before_w, after_w) = data.split_at_mut(w_slot);
>>>
>>> This creates a reference over the whole ring, including the parts owned
>>> by the GSP, which breaks the `Coherent` safety contract that the device
>>> must not be able to read or write to a live slice. So we'll need to call
>>> `from_raw_parts_mut` twice, with the correct sizes, instead of
>>> splitting.
>>>
>>> (also `split_at_mut` is panicking and should have a `PANIC:` comment
>>> justifying why it cannot, but once the point above is addressed that
>>> call will go away).
>>>
>>> I wanted to try it locally and ended up with something that seems to
>>> work, so let me share it to save some time:
>>>
>>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
>>>          let avail = self.free_slots();
>>>          let w_slot = self.cpu_write_ptr();
>>>
>>>          // Pointer to the first entry of the CPU message queue.
>>>          let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
>>>
>>>          let in_after = avail.min(MSGQ_NUM_PAGES - w_slot);
>>>          let in_before = avail - in_after;
>>>
>>>          // SAFETY:
>>>          // - `data` was created from a valid pointer of `MSGQ_NUM_PAGES` entries.
>>>          // - The `in_after` entries after `w_slot` belong to the `avail` entries that the driver is
>>>          //   currently allowed to write.
>>>          // - The `in_before` first entries belong to the `avail` entries that the driver is
>>>          //   currently allowed to write.
>>>          // - The slices do not overlap.
>>>          unsafe {
>>>              (
>>>                  core::slice::from_raw_parts_mut(
>>>                      data.add(num::u32_as_usize(w_slot)),
>>>                      num::u32_as_usize(in_after),
>>>                  ),
>>>                  core::slice::from_raw_parts_mut(data, num::u32_as_usize(in_before)),
>>>              )
>>>          }
>>>      }
>>>
>>> It has turned out quite short, which I like! I also opted to work with
>>> the original `u32` until the very end, as it results in less conversions
>>> overall.
>>
>> Possibly take some thing from the old projection syntax rework series?
>>
>> https://lore.kernel.org/rust-for-linux/20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net/
> 
> Oh yes, I forgot about this patch. Do you mean using `ptr::project` to
> create the final sub-slices, or am I missing something else?


