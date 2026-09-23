Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021102.outbound.protection.outlook.com [52.101.100.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B059483BD9
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163029; cv=fail; b=HQx4220e3oXeJrz/poSVZxigdBOnqMddh0J0hj8A5eDelnG2qmFF4kKZtM+sTtc8cC1kqJ+l41PbPuDOS9KtfP9jBVG4wDKUksmw3+NQiYl71dvMPNo7Ix0cJdXUMgyYl0vt876XuY9G8ysyknztRgZjRQIhOWeaOYj6vEkiRWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163029; c=relaxed/simple;
	bh=p5E/t1gtRKx9MD306/JgrHgOR+y3DYgNlwQiUGsRTzE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=t8bpvjOXOh2x3D9rq+j8VrGAtyNIWOApCeXMdp+2NqeVgk5dq1Eiz4jWmA3OeFEztgHyJMJOy+2VzpzXjD8eM3+jAxIE50teYp5ZtqjCGJclVDcLDiMJcnWCcBHNAmCucbeBo0tS1oqVt2Rpw/Dy4Sw2opo8kGALmZMcyRhXxIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DMPLQDmZ; arc=fail smtp.client-ip=52.101.100.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DMPLQDmZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7EaElgo1ZrpqvYTvCFlRR7l5NcFrsW1g8HPfE/kwrlRb8SIgf3fGDaroOXIXC4aUf4JJ46eo1ND4UaWzF5QnmEG+ZeSKO+FrWGKDSuqsdCAPGE62d5fCJeZjc5xHpIc0kLnPdqwt/hOL4wb3oJSXirhXPjXPpPguQi31jD2Iaf98u8NpDF7ItTl7L7x98MM/T5hE8IdhVwYqyjI+53HFPNal3qAr+EZ/+rgB3M4l4B/4vzgrvXGxAqam/YnenJiHaUQAAgHTY87hG3qfJzri3dse5Lk84QBaG/Yt+8OeoM+NLaSQEtTfHy8UocGg2chBVXG8T6ptL268gSB79UV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/j+9VJFu4qcmRrzoGzG5ApHMhHK/LR5OQK6NbligLE=;
 b=dXkwOS5GbsRqMOPxnGV8Oyqucz00+CkjJsk2a0/fZedm3/ItvWMlKZk4ChLWi80Ri1w7gisNvOIIpmCLgMTkV1jVyjwy3UIBm1H+KnsUeR9cPlvHjictfibHl6ZzfaTS2j2ApF5eBGG4Cn/KS9kM3RULCJQFZXAPY2Mra+aKnqUMFgxE0wpg6h0d+9lY80Nl7bVlRcrBpsfaC0eU5H3u6/6hlfmZbZVuAlkSFnPaYIkA1xBkG2wqF6Sj9SF07J+MTDrD6gzLihYKPKGgYtBcqDUvJ0F6d1IG+EMbidvPujtPMbCMXZLfB4hIeTbrgPeRFCuNQMRjl/W66vlUouTgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/j+9VJFu4qcmRrzoGzG5ApHMhHK/LR5OQK6NbligLE=;
 b=DMPLQDmZPZUOkWwAsthwpJwx7u1xPnB6yupbt+C/LcgTygd/XNDiJRx3PzPXQZ6yn0Arpf+0UqmYtuG0dn8ESmqLeDrKNF0dBnJ+z098LwYvcEqLizZZ6qcTyiAKluf36T+vKnLFkBUaoIX/PisMg9lJLctVm83kRD8zLfFOOF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2400.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:30:14 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:30:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 12:30:12 +0100
Message-Id: <DLMNTQWLGXJA.39Z56H8BZMBPR@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions
 from a count and a slot
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-9-jhubbard@nvidia.com>
 <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
In-Reply-To: <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
X-ClientProxiedBy: DU7P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2400:EE_
X-MS-Office365-Filtering-Correlation-Id: af8107d2-3980-42d9-f2a6-08df19660919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003|23010399003|6133799003|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	aSenx7YYCO3uGYQerovX4+4ZYB2rGqEV7eBBJr8N34VO9VVlX9HsIYO3ZO+/X99RwO4FbbpY25n4Gy5p3A4/Roh9cugBnR1LzOSUtfn3IKCjNHxZZeh2QFPK3JGQkYtWuzbtawR2y7ZGpK/ou+/N9GgxuribdXew6L0VLpIwegw+KevF9LF2ogn3V7wASEdxaMUivggtUnrijOpgd8EYMp0Kqqo25eA7dh0KF89MYXmsFdj1RSDQHYSB3dL1fMPYofW10nLh17c9FLvgz06leJHn/oLBfU6w1I2nYYUARcKRoaK5/bqmlg0aDiV1AmgfIpHS9o7D04AGmQxuWIbg7Q9j0gII1ixgoSzF/qCpD+OufLzD6o6dQyM3KQZLWvXPOI2z7H8hVe76FThcD9STLh/q6eWF3OU8U53AP4GsMx94+keVvwblniw5tIX5dUxAosasdhKgTeC8FUsVaRJK8OClresiR/TOo2Qf4H71Tpwj1rlsYxYLbUDbde+PfzLs6OJRhBVebYEsi1sbdYNvRwCYmnuY8sPt64rgl23Bf+Kts0m3nmwO1VvyFOLf3UkMJ1qhf0459AZXFhtCgmV8p4B7yCJV31B3b1Ixa99NAFGQYNAL8x7SdtSqh0TxScpKBKbIgX0jK9ryKoyHWbgXs7NnGA0rMc5JGiZqoJqrscc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk4yeHYyemZkT3MrZ243c2djZVR1M1V1ZktBQVZvTnNvNTd0cjE4UkVBMjlT?=
 =?utf-8?B?bEJ3ZDBERk5SbzB3bFJFc0RKWlhqUVdwSmg1Vlg1RFlvZW9yL0p4dS84ZFdw?=
 =?utf-8?B?d2pzZWlhWTJJRHVlUkc0VVM1clNmaXhwT0RWbWxXbTlWUkFjNjd6QkVyRjFl?=
 =?utf-8?B?SFRFQzE1L1lVUld0YzNOKzFhOHEvanExZmNYVXFab0xvVkhlSTJyM1N2QzJa?=
 =?utf-8?B?VURuQlhVNDNkbHhPc3YzODFNbXFDT0Rrcm9ydm1SblFhbWZ3TlVSbC8yZWJT?=
 =?utf-8?B?UTlLU1hGSmRFdkxqRjROTHVsY0IrTnJZdnUwNzdDSVJGRk5YYjFuSnYyVHRw?=
 =?utf-8?B?NE9kS1R5RTJXK3VqbmlNUFNRaUVSMmZwbC9BMDNRNXlNdTdoNWpYQU5oOWs3?=
 =?utf-8?B?UVNsSEI2NjQ1dlF5UEhsc0o4Y2hPajREaUw1R0hoUDA4ZXJZWUIrdGFLZzNt?=
 =?utf-8?B?cDEyQk80bW5ld3dteDZKcFZuQ2lXRno4Y0RRck9SOWcrcll5RmNsUHhDY2kv?=
 =?utf-8?B?ZWkxV3pTd2ZoZkthL0J6TmtiWTJMMlBUWmpCSzJSOGd3cDhRUndqVzJEM3hB?=
 =?utf-8?B?bzVrSW5rdFlzT0M2UEY0b2lZVHB3OTB6bkEyNEMraTFWMUs3VlhaaDhKN2lU?=
 =?utf-8?B?SHh3WmtRcG5hY2ZKaEU5aFJDdi9jVEQzQUloWlBWZjFVaTJMeFg1bndTVUpz?=
 =?utf-8?B?SkdCckJQZGs0WXZpdGZoRndraVhXeWdSUnZmU0ViQVlxMXJDSFpqUXlwbm9t?=
 =?utf-8?B?Ulg0SlZ2eUs4L2Y4djVLMnorTlVCa3pUdk40YVNDM09SUUNSbllBR1d4MmhM?=
 =?utf-8?B?ZHJPQTB3TnhHRW5nWTRraTVhNExIdmdFOTZYaFhRWThtazI2TURuLzVJMGdG?=
 =?utf-8?B?NEdUM2wwWVlPdGpIZjhrd04vWUM3WEUzdmllM1ovQnluQkdGaWVJamdnc3I1?=
 =?utf-8?B?UE5qY0tmWC8wS09nUDhoNmJLMDA0M2tjSFBNVkc0NDM4d2xlNkloV0dEYjlV?=
 =?utf-8?B?ZUVCS3dmK2RRSUF1bm92WWNrN2hwOG90RHhwZlAxOVRIU081a0Z2QmtKTkVN?=
 =?utf-8?B?eklIbkQrU1oxbXJxMlNpcnhwZEdnZm9rbkJuRkpFK3hGNk9vS0RwaGZ4dmtV?=
 =?utf-8?B?MXNzLzQvaUJKZWU4cUdEYlo5d1lNVW1oTzUxdHNtWmw4UHJYb0RLOGRVbWV6?=
 =?utf-8?B?VXlNQ1FMNEY5RWVmYVVscXRoblVLVkcwQXBLQWpjVjBxSjczMGtESGRRZTAw?=
 =?utf-8?B?dUl6YUJLNjFzSVBCNkNrL2ZxZ3ZMZCt4MTY3aHZFcDdpS0pyTEFVSEFDWGhJ?=
 =?utf-8?B?K2tCNjRqU1BnTlNoV2VZd2VzRU0wa0tDalQzQm0wU3BlMllWN1pDSVpidnFO?=
 =?utf-8?B?VStMb3BpMVJ0a0tzNVFKRUtjcEpLZkx1ZnRzeE1hZXpYOU5YTmVSeGJTZkVi?=
 =?utf-8?B?Q1puNnpaSGM0V29obXlnVjBHbkE5bGUwbno0aDl0YlROWE4yNDdpNjY1SU0v?=
 =?utf-8?B?YTUybVl6ZDZYUDVhOW9SUVhVVzMxc0ljdDk1c2s3WFhhWkZPeGlyS2cxbnhR?=
 =?utf-8?B?OEtqais3WHJaY1phQjQzZkZBcWx1TG5rRjkwMjlWYXoxa3JUbGgrMTlDcUY3?=
 =?utf-8?B?UVRveWlHYlpJd0ZvTE0rZlowSmg5SVltaDFocWRhUUM1TWlDSitkVjhVVzdq?=
 =?utf-8?B?U1RmSkZGTUQ2OEIwbmpJQ1JEU3FNaDl2eEFidFVCRHpSdHZhRGhscmhPUG1j?=
 =?utf-8?B?ak1CS2pyKzRTR0hBUDdKdi9kV09TQ1QwOTJQUU53Z2piSDc3aEo2V21ZMGl2?=
 =?utf-8?B?VU16NjRKU0JFN0M1alVqbjU3TkF2SWhBYkhOTEdkeXB1aTF2bXdkUkN4bHMx?=
 =?utf-8?B?R0NtZjJEMG1ZVytza2I0UlZ3SHFlMFpTMU85NUJOMWxpU0tHRFNnYW1QMk5y?=
 =?utf-8?B?ZTRiWHRITEF2TzlHWGh1VkdkdCt3MXFSRm1OK1FENDliZVEwdm9XK3FFb2c0?=
 =?utf-8?B?SWNqQTcvaUFTdXRPclg4dHdEVUxINXkrOFRtckZTUnNNSnFFWWNjWHBPU2VF?=
 =?utf-8?B?bGl5aDZ4bGNONGN0dFp4T3h4QnJuc25ZRXp3QytmWS9XcEVaNjhmOExHUCtt?=
 =?utf-8?B?bnFqWnFuYW5vdUlqNEw4NWRhNUU2SFZhS1FIODMreEplKzNMZnNnZVlMeVBX?=
 =?utf-8?B?VzVxREVzVzBpdFFyT3RJRjVoL1ltUUZGME9DL2xZOXlwYmRFMzRtbVdFMlNi?=
 =?utf-8?B?M0N0c01MdFhwcGFJblV5em01TWtIeHV5QjdUZjFnTzgzR251aHo2dlpSOW9B?=
 =?utf-8?B?bWRJSnhrejJkQ2krRzhxWk1LeW81UG45b3QwK1ZOWGR6aE9JL2FiUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: af8107d2-3980-42d9-f2a6-08df19660919
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:30:14.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fp4zUFB8L8WKkc9f7cetEfiyjXhcjHFdfvnWvvfZZKsfeycnPz52LoWjVhbh6v2l9DK40rAi0VAOzDlfU63xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2400

On Wed Sep 23, 2026 at 5:55 AM BST, Alexandre Courbot wrote:
> On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
>> The r000 firmware uses msgq v2, the queue layout that keeps the queue
>> pointers in BAR0 registers as counts that do not wrap at the ring size.
>> The r570 firmware's layout keeps the pointers in shared memory as
>> indices into the ring. The two layouts differ in where a pointer is
>> read and in how the size of the region that the driver may write, and
>> of the region that it may read, follows from a queue's write pointer
>> and read pointer. Splitting a region across the end of the ring is the
>> same in both, and whether a region wraps follows from the order of the
>> two pointers.
>>
>> The functions for the writable region and for the readable region each
>> branched on the order of the write pointer and the read pointer. Each
>> branch chose where the two slices ended, and the function then built
>> the slices with open-coded pointer arithmetic. The SAFETY comments
>> argued the slice bounds branch by branch, so the switch to msgq v2
>> would have had to rewrite the branches and the argument along with the
>> pointer rules.
>>
>> Compute the number of slots in a region and its start slot once, and
>> split the ring at the start slot. The first slice ends at the end of
>> the region or at the end of the ring, whichever comes first, and the
>> second slice carries the rest.
>>
>> No functional changes.
>>
>> Assisted-by: LLM
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 120 ++++++++++--------------------
>>  1 file changed, 41 insertions(+), 79 deletions(-)
>
> This looks like an improvement regardless of the r000 switch!
>
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 80e6e79c5f3c..a1c9b7cce255 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -262,107 +262,69 @@ fn new(dev: &'a device::Device<device::Bound>, ba=
r: Bar0<'a>) -> Result<Self> {
>>          Ok(Self { mem: gsp_mem, bar })
>>      }
>> =20
>> -    /// Returns the region of the CPU message queue that the driver is =
currently allowed to write
>> -    /// to.
>> +    /// Returns the region of the CPU message queue that the driver may=
 write to.
>>      ///
>> -    /// As the message queue is a circular buffer, the region may be di=
scontiguous in memory. In
>> -    /// that case the second slice will have a non-zero length.
>> +    /// The ring wraps, so the region comes as two slices, and the seco=
nd is empty unless the
>> +    /// region crosses the end of the ring.
>
> There is a recurring pattern in this series to drive-by rewrite comments
> when there is no real need to do so. The new comment is not even
> marginally better as we lose the temporal nature ("currently") of the
> borrow. This creates churn restating the same thing using different
> words and disrupts the diff, so can we avoid doing that unless the patch
> actually changes what the comment describes?

That's a pretty common thing for LLM to do :)

>
>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mu=
t [[u8; GSP_PAGE_SIZE]]) {
>> -        let tx =3D self.cpu_write_ptr();
>> -        let rx =3D self.gsp_read_ptr();
>> +        let avail =3D num::u32_as_usize(self.free_slots());
>> +        let w_slot =3D num::u32_as_usize(self.cpu_write_ptr());
>> =20
>>          // Pointer to the first entry of the CPU message queue.
>>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msg=
q.data[build: 0]);
>> =20
>> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
>> -            // The write area is non-wrapping, and stops at the second-=
to-last entry of the command
>> -            // queue (to leave the last one empty).
>> -            (MSGQ_NUM_PAGES - 1, 0)
>> -        } else if rx <=3D tx {
>> -            // The write area wraps and continues until `rx - 1`.
>> -            (MSGQ_NUM_PAGES, rx - 1)
>> -        } else {
>> -            // The write area doesn't wrap and stops at `rx - 1`.
>> -            (rx - 1, 0)
>> -        };
>> -
>>          // SAFETY:
>> -        // - `data` was created from a valid pointer, and `rx` and `tx`=
 are in the
>> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write=
_ptr` and `gsp_read_ptr`,
>> -        //   thus the created slices are valid.
>> -        // - The area starting at `tx` and ending at `rx - 2` modulo `M=
SGQ_NUM_PAGES`,
>> -        //   inclusive, belongs to the driver for writing and is not ac=
cessed concurrently by
>> -        //   the GSP.
>> -        // - The caller holds a reference to `self` for as long as the =
returned slices are live,
>> -        //   meaning the CPU write pointer cannot be advanced and thus =
that the returned area
>> -        //   remains exclusive to the CPU for the duration of the slice=
s.
>> -        // - The created slices point to non-overlapping sub-ranges of =
`data` in all
>> -        //   branches (in the `rx <=3D tx` case, the second slice ends =
at `rx - 1` which is strictly
>> -        //   less than `tx` where the first slice starts; in the other =
cases the second slice is
>> -        //   empty), so creating two `&mut` references from them does n=
ot violate aliasing rules.
>> -        unsafe {
>> -            (
>> -                core::slice::from_raw_parts_mut(
>> -                    data.add(num::u32_as_usize(tx)),
>> -                    num::u32_as_usize(tail_end - tx),
>> -                ),
>> -                core::slice::from_raw_parts_mut(data, num::u32_as_usize=
(wrap_end)),
>> -            )
>> -        }
>> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries =
of the CPU message queue.
>> +        // - The returned slices cover the `avail` free slots from the =
write pointer on, which the
>> +        //   GSP does not read until `advance_cpu_write_ptr` publishes =
them.
>> +        // - `split_at_mut` gives two non-overlapping halves, and the `=
&mut self` borrow lasts as
>> +        //   long as the returned slices, so that no other call hands o=
ut the same region while
>> +        //   they live.
>> +        let data =3D
>> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_=
usize(MSGQ_NUM_PAGES)) };
>> +        let (before_w, after_w) =3D data.split_at_mut(w_slot);
>
> This creates a reference over the whole ring, including the parts owned
> by the GSP, which breaks the `Coherent` safety contract that the device
> must not be able to read or write to a live slice. So we'll need to call
> `from_raw_parts_mut` twice, with the correct sizes, instead of
> splitting.
>
> (also `split_at_mut` is panicking and should have a `PANIC:` comment
> justifying why it cannot, but once the point above is addressed that
> call will go away).
>
> I wanted to try it locally and ended up with something that seems to
> work, so let me share it to save some time:
>
>     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut =
[[u8; GSP_PAGE_SIZE]]) {
>         let avail =3D self.free_slots();
>         let w_slot =3D self.cpu_write_ptr();
>
>         // Pointer to the first entry of the CPU message queue.
>         let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.=
data[build: 0]);
>
>         let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
>         let in_before =3D avail - in_after;
>
>         // SAFETY:
>         // - `data` was created from a valid pointer of `MSGQ_NUM_PAGES` =
entries.
>         // - The `in_after` entries after `w_slot` belong to the `avail` =
entries that the driver is
>         //   currently allowed to write.
>         // - The `in_before` first entries belong to the `avail` entries =
that the driver is
>         //   currently allowed to write.
>         // - The slices do not overlap.
>         unsafe {
>             (
>                 core::slice::from_raw_parts_mut(
>                     data.add(num::u32_as_usize(w_slot)),
>                     num::u32_as_usize(in_after),
>                 ),
>                 core::slice::from_raw_parts_mut(data, num::u32_as_usize(i=
n_before)),
>             )
>         }
>     }
>
> It has turned out quite short, which I like! I also opted to work with
> the original `u32` until the very end, as it results in less conversions
> overall.

Possibly take some thing from the old projection syntax rework series?

https://lore.kernel.org/rust-for-linux/20260415-projection-syntax-rework-v1=
-4-450723cb3727@garyguo.net/

Best,
Gary

