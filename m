Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021127.outbound.protection.outlook.com [52.101.100.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC12F8E99
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745975; cv=fail; b=RWHCXtshbW3B3WYWSEcPUnwqF4gfWp2x56AqIvHc+XuD8U1kG61dBkwQT1SNPOKh36ulTQcudUW+2HnX/vcObxDCHFBp5mA2elLizpU9edvTBPHyHbxEohPKWr4qdZdbMtQzptjh/vcZi5m5/pfWXvFEAc1XeM89ABsypwvqvFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745975; c=relaxed/simple;
	bh=ufxuBuC4NE8WNtP80857vm9L0CBHI/7C/RXmPoIM/C8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Qr9pkp67Gman5TpB5neZJWiuNSRpJ8aCANmXKwB9qRH8m2X0uOc4SK7+AI0TGYvVjlT9VjGzcgWRRWtIke6OoPGejwjc+S+BL1zPlhWvzpECztEdnPwHJXTmdJXIjrWJWAoibks7DW9bUMfh5p+6gnXf2U/4Yv4FnVEDDkJQcas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pOYJPjQI; arc=fail smtp.client-ip=52.101.100.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pOYJPjQI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtNLNCWo+gexV37IArT+gR02NURH53+w31t4yRrATN/UVW+2hxZvTC3cgYVFYZmWqi4EZqdMOZtY3dJnscughnLGHw6GNFvTxhHDZdZgP9BGgHesip21C8AeFCvbh56IKpMLUvz9J1oOTKK2NFh9bEOCSpPglg9dZE8VIIPdGh9lWjDR1kIvfPrgNbI2JYNfc+HTnt1IfwaOBGH9AeUeBZPii4jmXBt7akqlhdmX8sGnTHqyiXp/ZfnE3TcLatC2Cd85JVZdQXFtNxtaLsOQ3mSj45jt+cJLECrZRSfkdybfBfnjHr+zBJcwTePB4VF6aUjIZOyM9ryycho96RZP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTeRZKdZP9HyCPmw8I57cFzNQh88/EvzmA7JoquLJJs=;
 b=OSr7+SBakvtf7DGE6B0DN2PZSwzljpFcsGwo2FAp2NJaXCyiWO3UZw6ZfLwG1s44zER0Hw38c+5aV2O5jtCuv0STt/FMib6FNRRJ4xyYqcEBNDqUrHPxanqy/wflxAhLk8G9LHN1s4sILDbkMB7Ts13BroUxQGEtfddeTf6K6Hv8bFg6I9AzyXvyDNohsDbYtn8Qb8trQ5BJiWC0cymppxf0DURoT0B6CEkM/4sZAIb5l1BDWWbXgj3Mbzm7dDOAhBK345oj9gvwj5ympJ8JtVEUjOYxpzcks8XkcnxjxGTEjz5oHoHMaYo8DPgKE3Yu7g42rZ5zBJDUGsHEzcyBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTeRZKdZP9HyCPmw8I57cFzNQh88/EvzmA7JoquLJJs=;
 b=pOYJPjQIh/lVUN/jqdVe+eEUHzasspoggCbyaexIeOpKl2NK33r0lbAK7lBmIIrY1ivRJgCF4KGvzxcYrwoZnsbiQnUO2EGlCQDfJ8ZAaUl4aYZ08A4kKBbExEkH3e/AEwJlwmiYvc7ASZHBXF8pOjX+KxbxvBgX6WkPLW7ij24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 12:06:08 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 12:06:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 13:06:07 +0100
Message-Id: <DKYV1ZJKV57K.2XCTQQBGP18VH@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
 <DKY3F6MT327X.2BYD1IDZP8F81@nvidia.com>
 <DKY3P0L34CTV.10MQOAMUR38SO@garyguo.net>
 <DKYTNXT3VX96.1L07CIR9SASUX@nvidia.com>
In-Reply-To: <DKYTNXT3VX96.1L07CIR9SASUX@nvidia.com>
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ec51d4-8644-4bcb-de80-08df036a6983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|10070799003|366016|6133799003|10067099003|56012099006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QnZiEJPJIc63dgeU1reNogQFIuXsIWQGxLW9pUccd7HOKfzIJYlWMlkdPhoWm9lqUS3jSG3G1y8PhbLI99mbCVB5uJ7bn86VazJ8KaFWxRiPd3q/dOP3PxJ+iUSpuIVaovhpK+fd1mpL22Aa31MX0Z+4TeMMiVJt10CBJUxwQUK9l+Xw3bBO+jmDM4ptoqXyR0LDb1PX/Sb8ZmolBGY6NtJ4bCvlTH8faM3cdo9N3u6FsPU8OyZJJRagNl4ZJgtyOMquMQXA0iANl8iLR8qANzCfy1OJLYw85OVrI4l21FMAA82/BKjzqnDyZIKFiv6q5g/9M1lvjEk8ReI6mM6isfpTwIgOrH2Vv3M6BOfY/yE9PaKS/jnGxolnleNWtJ3aQo2C7/dzCY1g62dgSE0Nzx7Ya+P8i7nR2/EAlTo+DJmMNIBIM1FPlrhDWoBsc/6kaHVRpyYGxVR69j3V6NTtFwRPxzs/iMoGV+MZ9eY0FRKc7nUEsSSlgizzfHSi0q8hr+dugA1KU4GpjglHysAx9rw7FGbMswEzJw/uWUyWb5C8f0cHn8EA41c6SdOwmQQMA9anxt5j0r6Xmug+lkaox6grmUdlKLC0kSoRvt7P/eIhDVpEgtt4owY1otGU8VGOe/apF3AqMAudc2KStFA+qRqXYNqHj3jKjqlp4GTrKBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(10070799003)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0g1bVRNb0Z6cndCRk1QZEFTWVVUald3KzJCM0xnb1N6NXFIZFdmRDUrU1Vl?=
 =?utf-8?B?SHR5ZmcvOGhBYlRYNm43NEdFQklNUGZiRTIvUENYVzZZWDNIdWpWZkxreHgr?=
 =?utf-8?B?WUhHK3AzYTNBYytHU2c5QlBpek8wU0lYS2RuOEZwVFNCdlVlRWNLNlNKeXlD?=
 =?utf-8?B?UkhVVG9GYS9MVFVROEdoTW1la1lqS1hXblBrK0VJYnlhU2wzdjlqYjNiYmRh?=
 =?utf-8?B?NkZ2MnQ1YjN1UXZhdjNUZyszUlJsdFcxVUV1OTFORW1la3NXUDZIK3dUcjZk?=
 =?utf-8?B?N2Z2NVIzazd1QWdoVHMwK080R3IwZlppZjI4d3VNckR5R0xFOGY2Ri9sMHNJ?=
 =?utf-8?B?eGJDL3NRdi9FZXRHeGNtLzZwbTNCSDdMeGp5TDkyekU5Znl4TmowSmRVdWVS?=
 =?utf-8?B?RWtROWt2ZTNNQlNzaUZXZmJNYUJmUWs0VWN3SFAzdFgxczNWWVRxTVFITDEz?=
 =?utf-8?B?UUpuSUQ3N0VReERpd3ZnVzBibmk0cldZL3lTUDJlTjZOTU9kV014a1pQSWRM?=
 =?utf-8?B?bzBmK1NMbCtrTWdBRVBaU1Q4RzNZalR2RllOclpKUlRGVEtOOEQvOWJRaUZ2?=
 =?utf-8?B?K0ZjblVrSVo3SUxDaytOQ1NyZUZNaGswR2YvYzJYcnA5TWJDUGs3QW5KTUxD?=
 =?utf-8?B?RkE3bTZnWkI2MlFsalA2Ull5cW9RY0JiZXNTb0ZSV3FGK0N4aGlWbUlmZ0tp?=
 =?utf-8?B?RXovMFcwOGhRMkhGTzd0cGxXTnkwQWpuSDE2VTJDQk42R3NrelJJeFJ4WkJq?=
 =?utf-8?B?Q3l3NmdMeG90S3RrZ3pkK2xRVHI2T2w5d3ptOWYxNWIvTVhOTFNScXBSano4?=
 =?utf-8?B?b3hpS2NNdFp0SHlud0dYSkQ3aUl3MFAvVzhnQldKaUc0dEllZEN1c3BJQitw?=
 =?utf-8?B?VHNSWWduUGpyakVRQmdabkVyUzh5MlJsUVc0QURVMElaaWI2Z2psMVFDMTBH?=
 =?utf-8?B?NlYwakVyRGFSRTl4M2Fvb0VRSWROcC9ycW9Ud1R0alZuc1BrbmlvNFI4U3hv?=
 =?utf-8?B?RmRuOExuSi9wcGY0eHp0S0ZkRE1BZlNyNlFSeUd5WWozeWpuN0pSRDVySG9T?=
 =?utf-8?B?eGoza1VhQ3dnVVh5MmdyNS9HWkpnSjJWQlRRT1Y0OWdVM1FEOTVPNmZFaklv?=
 =?utf-8?B?ZW8veXRvS3NML2ozOFhiVjBpZ2xKZDhGc1pPTEw0c1pSMU0zU3FVQTU4Wm81?=
 =?utf-8?B?UXVpd1haT1F4d1R4eXEzSGd6bFVmSkp4bFFKR0RVSWgzWXpVV2VQRFBCemJF?=
 =?utf-8?B?eFNyUUZKZzljR21qVHYyRGRhNWNSR3FnSmpSZEh1MmhHb2NzbDZic3UyeW4r?=
 =?utf-8?B?VUlTd1IycWVsUVV4VmdiTys0WTkxNHpYVTlsWXR3TmcwWXRZcGtqVTM1dWlL?=
 =?utf-8?B?bkg2d2RSZkNLaVQwR1g4OHpONGhiL0FJT05YNlA2Z294V1dDRElHaEhrdWli?=
 =?utf-8?B?OS9SZFdpb2VJS0NzQjhpOExQR1ppa2VaWExiMkptZFZGVld1blVxd210R3Rv?=
 =?utf-8?B?TDJxak9aUjNqLy9KY2ZUNzMybDZsSTFucy9ucnBXTGRkeE12cWE2ZHN6aXRP?=
 =?utf-8?B?TEZBVVdyVzhMbUFLc3FLSjBEajYyQlk1OUcvOXJSd2FZMDcrenQ4eWNGSllh?=
 =?utf-8?B?VHhWNkVHVys3bWVOQ0VNeWJPTTdRcmlScVVTR05PSEdvS0VjNGtTWW52bkhJ?=
 =?utf-8?B?RW03Uit4WCswWkI5QWhXWUVReEFZeEgrUTIwSUNVSXhkZkQzMlBaWU03MWdl?=
 =?utf-8?B?bDBTaWE5MDdYaWF0TlBtMi94dFhHdkRJTHIzSW5OQklSTnRVZXY2ejN6YVV3?=
 =?utf-8?B?akNWV21ZRGwrVGNpUGk5WEl0Z0VtQzVjOUpOUm5tRU5MVllRNzJVMXZsZ1lv?=
 =?utf-8?B?d0IvZGpNTTNITUM3d1JBVjArZ2lETUlDNHZpSEw0VjlwZGlZT0dscEY4cjRl?=
 =?utf-8?B?SFBnNy83Zi92ZHhFaXZ5NmRkOHI4MTZpcW5hZFBaVmVrSUN1RU1wL3BWNDRt?=
 =?utf-8?B?MU9TRVlNOFoxZUZFU0hjYlZQMGdCUjhFcW91MmJzQ05VYXRWUFBGVDhHSEx1?=
 =?utf-8?B?R24wSzFQdGRuQVB6TXlPR3V0aWwxWFNTNXVtQkZWTEhmN1NCOU15R3daYWZp?=
 =?utf-8?B?aUJVQytPZGFrM0dUd0tsZzN4ZzZ3OE5iTmlsRlowVE1SZTdWRHowZ1dGaDJ4?=
 =?utf-8?B?S0w5dnVVTlBUR256VVd4VlpxUHF0dVorUE94SmJkeXdRYnJmTUp4NU03dnRT?=
 =?utf-8?B?TUpNdkVIOVovbThyVyt3VW5neGFVNm43SVZDbTF5bWRENlYxeSsrWXJGREpj?=
 =?utf-8?B?aWVlOCtDUWhzQ1loemc1WUpQV0pEYmVOSDlWSXdNcU1YM1RnTHVkdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ec51d4-8644-4bcb-de80-08df036a6983
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:06:08.7467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do2LCJEUtpQm49jw6TDJUToRZKdM4TlUJ6fh4n0Isgv9AqpSs3x9WdLjFEJ/p6RAt43nw/VDrpyIAWxBJR/BtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7406

On Wed Aug 26, 2026 at 12:00 PM BST, Alexandre Courbot wrote:
> On Tue Aug 25, 2026 at 11:39 PM JST, Gary Guo wrote:
>> On Tue Aug 25, 2026 at 3:26 PM BST, Alexandre Courbot wrote:
>>> On Tue Aug 25, 2026 at 9:01 PM JST, Gary Guo wrote:
>>>> On Tue Aug 25, 2026 at 9:25 AM BST, Miguel Ojeda wrote:
>>>>> What I wouldn't want is a raw `as`, because the point of the saga we
>>>>> started a long time ago is to introduce better tools that allow us to
>>>>> get rid of the almighty `as` into weaker (i.e. safer) options, even i=
f
>>>>> some uses of `as` may be "obviously right".
>>>>
>>>> I think that is rather a linting issue, not something that warrants ex=
tra code
>>>> in kernel. We have been requesting some extra clippy features and I th=
ink that
>>>> is the correct way to go, not add a ton of methods and macros. Yes, it=
 wasn't
>>>> moving on clippy end, but I could add a feature to klint instead?
>>>>
>>>> Do you think we still need all these extra function and macros if we
>>>> can get clippy (or klint) to enforce CAST comments?
>>>>
>>>> I can imagine the following rules that would practically solve all the=
 footgun
>>>> of `as` numerical casts without having to use awkward syntax:
>>>>
>>>> * widening casts are allowed
>>>> * narrowing casts is disallowed unless CAST comment exists, except whe=
re its
>>>>   value is constant and truncation does not happen.
>>>
>>> These rules classify casts by width, but the footguns really are about
>>> which values are actually being converted.
>>>
>>> In particular for value narrowing we still end up with CAST comments,
>>> whose existence a lint can check, but not their correctness (for
>>> instance, a bindgen-provided constant that changes in a breaking way).
>>> `const_as!` lets us drop them altogether.
>>
>> The rule says "except where its value is constant and truncation does no=
t
>> happen".
>>
>> So I'd imagine just writing
>>
>>     bindings::FOO as u32
>>
>> and *NOT* have CAST comment, and a warning being generated if truncation
>> happens.
>
> I can see a use for a lint that warns about `as` expressions without a
> CAST comment, yes. But the warning should be unconditional imho -
> otherwise an `as` without a CAST comment could be intended as
> non-truncating, or it could just be an omission from the author of the
> code, and there is no good way to tell.

I think a "no comment means no truncation is going to happen" enforced by
linter is the point? I'd use "unsafe" as the parallel analogy. You don't se=
e if
a function is unsafe or not, you use the absence of "unsafe" block as a
guarantee that there's no unsafe code within a block.

>
> `const_as!` basically provides everything we need to document intent and
> verify the behavior of non-truncating casts, and I think it is useful to
> keep as much as possible at the compiler level. KLint is not part of a
> regular build, and enabling it involves some effort that not everybody
> will go through. `const_as!` emits an error exactly when we need it to,
> without any extra tool, and is both simple in its implementation and its
> use.

Enabling it is quite easy actually, just that it is more involved to packag=
e if
one is not using rustup nor nix. Once it's installed the only thing needed =
is a
RUSTC=3Dklint in make command line.

The bare installation does not however allow you to name the lints so every=
thing
is at the default level and you cannot suppress it. The required feature
`register_tool` is being worked on and I intend to upstream klint support s=
ome
time this year.

Also, as long as we have CI systems to do a build, I think it's not necessa=
ry
for everyone to run it themselves.

>
> I am also not sure whether KLint could cover something like this, that
> requires post-monomorphization analysis:
>
>     fn f<const N: usize>() -> u16 {
>         N as u16
>     }

So for clippy (and likely klint if it implements the feature), it would be =
done
pre-mono so it would require a CAST comment without checking.

>
> Generally speaking, I believe a sane policy is to delegate tasks to the
> lowest layer that can do the job. Here the compiler is clearly capable.

That's why I want to get the task done by clippy/klint instead. Because it =
*is*
the compiler, which is lower layer than a macro.

Best,
Gary
