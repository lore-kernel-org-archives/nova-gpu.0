Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879EA3DAAB1
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742075; cv=fail; b=iCGr60xuJHn5Zm4iplZCuR54e1YyUG/tD9uIV8a6jXoJsXeMWBbSCyOjBp9T7EYePwXVgfFdhhaXgeK2zGd9Kuwi0duRbLRZ59kCrtaN1e77yFfKq+DXu9nsvDazlN3vcj2aEdrEJzlNDV85a+83RRY7MsTmGp3ErhVySGj07O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742075; c=relaxed/simple;
	bh=jogvURyRTHI7c6x/f3zHFS9pAfm8WeTNWR9OFYrDreU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jqNZTSg48LJ8YArp7epCsSeStW/Fm8/LVo+ke/B/mxWXQSOpkCQfh6CvPQXATWfMVNfXqGogFlTDqmw29pQueCETkSzZ6lQUIuzfLKQKHdyQ/EA784vR4ElJBVNYttRl+v26QqIP169922SYNcaZ2c2S5IgM1hSqZsGdnj63U6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sJnh85pe; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sJnh85pe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYu+VK8NxLYVs7lZCQ5cKA9gbgYAZV2OuUPNZOETJd1Pqi6sO4oHBJ8k87Z0Mtgr4gn2rWhbTJU2AHeYal/ZCtw0hSyRCcvb1Iznw3qfTesX6Lt2eTXBBij8ytUPUmMfNh1b8xzUTPqVl2L+N+xWEL1bE2rSWLEofIoCeJ0owg5DVsC4C7YRD7EAl+vHa+1qVE5m9R/zNr9sCDUmIbbCCa3e7HzJFeKHP9+B01Cb+JvPDoNa6udz6ARGwA8Qs1yg1F+v7GOaUhdgPU787w8af2Y/yXbZXfXnV6aKzwCdPyeoTf1zMV29Z4SmndE7T6prnelKJxYaFHLAkZTlwZ0m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X94mMFvX1/O0icrK2AnoUFVBrBmL58b/NmJSnb0QB5Y=;
 b=VS6+R+yfIK0N5KZl008HSvKiiAGpcNk3EzvkWVsxzr9e9S4ncO0HMtoBq7G6vUgNi7EagsVgtwqmFYnHBxKXcC1aNSPyExlgiEEc1Zwzx2RKrZJdISkiJoK7ubINYziUT6VejQoOPsf26VMpTsY17gQzm6JQ/x+xWFhBmFh8K4ERBbf2LLU/1+q34UEMp0y2Vv/tldV/yec00Li29gM28ycXUQigYkPSCjbxXarqhffenJeXfPGhFAl3fK6+rVQCttWQ3heuC++Rrk3+OCKTgC3N2FVY5c4gFBeJUZRnMaXGZ28mozOtJ6+e7yfciTxMLkSX8W5+YhmhS1vqWqkMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X94mMFvX1/O0icrK2AnoUFVBrBmL58b/NmJSnb0QB5Y=;
 b=sJnh85pe/a5XEDt6lsBt1gYVJfUyK/JwkEx/VzWWrzPOjlEeuFrIdjdRBGpl+h4NZNqdnhAJVuI2z2dudryJ+vQohKyCgpRjkPfZyP3VNoP3KgAS6uXvIZ5M1JZV9m2QzTjEQy/3viVSmxe7L2NRZLimg5TON5HaH72eSyvGOjQ7AqRJPZrmSeFzZr9I2aAKZTCczpGJi7MwIuD4Rpm1fkI2UcFi62iZVnV+tKfaDsoX98TOLxr/NZBlFcwqez2PQFTi2fYMb1zfFRh3Y4k5PS2HRhH979JPoTPTMiWgVoYOpwQ2YqPBp0mdrpn+V7gXBzqE1BWV9tr49U7Wz4mqWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SJ2PR12MB7896.namprd12.prod.outlook.com (2603:10b6:a03:4c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 11:00:54 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Wed, 26 Aug 2026
 11:00:53 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:00:45 +0900
Message-Id: <DKYTNXT3VX96.1L07CIR9SASUX@nvidia.com>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
 <DKY3F6MT327X.2BYD1IDZP8F81@nvidia.com>
 <DKY3P0L34CTV.10MQOAMUR38SO@garyguo.net>
In-Reply-To: <DKY3P0L34CTV.10MQOAMUR38SO@garyguo.net>
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SJ2PR12MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: ffab7440-57e5-47d5-34e3-08df03614c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|7416014|376014|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Uk+CvLDqa5LmwJKG70Oh3vCgdTfLxbVZWI+FR715GKGMqg9wIh7YuXuRTSyQxh/TXqbAjgw0Diq+EgW1my5Rs3/VgzxPq0LAbfKiHZr2UolyAwfpzRxMPZ0QpkpFNpH7goKiuK8B2Aj473u3+m+WgqnHkAF89l4r1Wa40VLP0sOlyltEdrm4j4P7sqeR7Rh0ype+kum5fxsJqJTbemjgEIM/xNu0QcSPM9ry7nAd0qBwlkYW57hk9GIPGFDiNkGeySUa4V7Nbg/9epm8JwrZOS0QkNXOWDJxFutO46dEaOG0/JpCtrCva+heKRuf2m+34NPTzhY4eLw4+bJ3lEnkNKPbIUDno6F5bqTyvmWMqdpSCtYK6/QUTDxmYmbauRg+nZOlQXMilwCaNrOOC2cATNqNs03tsYLaGPK2x1dl7BDf8owmyWX4MLI/2NCoKG37UmsUXy9/zmmd0fPJPjl+umHd/wApRWpj+5YGdHadt3+LalphmP5V+BlldXdXAHrBVtqFIKqsWU+wlPTHe5rdcepplhqHa4A8FPIVp1YdV1ey5YKOjYNyzm7iywH4ArVmub19Tnj0ZbM7GdPSDUv2BwVLI07eDiOraXOscuuLSwCu3D7S+kFL6JIGdVk6FaatllUcBs3Nxzu2CRVVpK5S9A6CCANQ/a+X7Vpbe6yFEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(7416014)(376014)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTNhcjNNZjFzdjU0eDNWejg4Si82R3crVUs3QldxUjc4dXVzUXQ3S3JIZDg0?=
 =?utf-8?B?MEdJUkNuVEMxYUFrMWZVang3SzBkTHViTHFzc2x5bXFpaXVxRTU3TytHclRI?=
 =?utf-8?B?WHpKZzljTFdGWmNRY2NWSTVpckJBTmJidHBSL2Yvc050ZWE0UGFhcnNVNE9k?=
 =?utf-8?B?NU0rbXp2K3NwcHdDejh4dGNZempRYTJRRjNIc082cXRUTkdhS0xpMTZBZTdi?=
 =?utf-8?B?Mm45MkpTTnZGWEJZWWQ2c2R4NS9aTGhYMURZcGt2OUZ3NStWcnZ5THBoOG5M?=
 =?utf-8?B?cnhiUUsrSE00NXlyR25SUko4WW9xcVQxK0FDZFU3WC9renB1SWlHU09QMGc0?=
 =?utf-8?B?ejJmWlpBNDBWd05PUHJtL09UUHJhbjhxQUZWNkFORHJmcXhVdjZVQStkRDBK?=
 =?utf-8?B?UFhKQ0R0Mkk4N1M4aTVSMVdTOTlKc0hmVStsaUkyZEtuSWh1OGJ4ckVzY245?=
 =?utf-8?B?TC9ES3FDd24xRGFSbVVEbE9JcC9qdFpWRzdzK1ZicG1VOE9pV1R4aFd4T0lS?=
 =?utf-8?B?UVNYS1JBWGFqcVVBb0hJdnJiSWpTTCswdVZ3bVo3RUJWSngyKzhEang1VWFq?=
 =?utf-8?B?bW5PK3JnU2xHejNqMU0zU2pYQU9zUE43aDRDQmNpVFc3dFFTcW5WK04yNnJC?=
 =?utf-8?B?VFNOK2lPR2JUMHZoTWdNTUxvNEtqdlA5NzVWNyszWUJEQTVPVmpyRlBuSFI4?=
 =?utf-8?B?WEl5STIwNDlPTURIRjBxbnk4UGRzM1N1RkplTDNRdmdKR3dsRElHamNwNkNl?=
 =?utf-8?B?UkJjVFArenJqd3FZWUxKeEtrQS9JQzBaYzg0aFVuMUZLNlNNYVRISzZjOWZK?=
 =?utf-8?B?WGdMOE1QRkpPOXN2UUl0dEJTdFZrOHJMMklRWS9aSjhjZFl6NUgxNndwMFMx?=
 =?utf-8?B?ZFhSRitaQzBJM2JVR283eHhzY05ZU2l3RFE3TTdOREQrakN1U0M2NWJ0YkMv?=
 =?utf-8?B?c3hxRkloMnVtdUFYT2NOU2dHT05FUUJRRnNqQjA4UksvMWtSdXgzYUdKbUdG?=
 =?utf-8?B?eGJ2Sy9tSTFTbjd0WXB3MXlTV05zNmtrUElTemkrRThNay9UNHJDNWp1Rmtq?=
 =?utf-8?B?dEZYWGM2YzRkU0ZTMHI2Vk8ySm4xbFhwWGtiL2M0WUg3STd3d3hsWG5JQkNZ?=
 =?utf-8?B?WHE0SmhpOTZWZkxBTXV5bkM0MlhvOXo5MXVLVHdUVGpEL3BOd0FFcEJES2NY?=
 =?utf-8?B?Yys3NmV5VGZSNlpvZ0dacGQvQXI4T09UeXROcFlSUHFQK2VNQVQ5amlGdVZ2?=
 =?utf-8?B?aVB3UmJ6K0NHa3VBdThvRnp1KzFOM1NjU3oyRjBsOW5IQkFFcVdCZ3JUb3k4?=
 =?utf-8?B?YzgxRVczUWs4WkhIQml4NTBtazZBTHljaEdGQ0hhWWNRdzkwbWNpRDVnOGNi?=
 =?utf-8?B?OXMvZ1NKQ3ZocW1Tb2YvOHF5VGpJZWFQaGZuaHBoTzBrMng2R2w1NEJ3Z1lE?=
 =?utf-8?B?c05EcnFod0JuM0U3ZWdZTzN3WEg3UFV0bnUxempXRElObVBVMERIYzMwVWR0?=
 =?utf-8?B?VVc2M2NOMVVoZ0gwSGtMcVZFTSsxM3B0K0g2ZTZFN085TVRSMmFNSEl5N2Y1?=
 =?utf-8?B?TWtxTEJrTW1mczEySXZYUFJhMWNSd1FvRnBpeG15SjUxRHJBOTE0TGhxUlA0?=
 =?utf-8?B?VWpha2RuOWZmakJXaDY0YUlyUXdtYVhlL3ZWTTk3MjRFSUJQZGpyY0gwSFY0?=
 =?utf-8?B?TVpGNDc2YVByQTMvRWZsVGV1TlZldDNaaUhGcHNuKzNqSUdYQ0lIbkRkbExW?=
 =?utf-8?B?M1Urc092WnpIVWZlejdCcjJuUFV5elhCSFRMbGo4eXVVVWxITXV2YmZVV0Fk?=
 =?utf-8?B?R1RISTVQQUFuQ2xUSnF3TG9laDJ3OVFXUGh0cWQ3clFrUEtYM2J2czZqQlFw?=
 =?utf-8?B?MmdMem9oUFp6M09pQlFxbVVYSmc3djJkaFNON01jM0IzZHdvWXExSTFVTUFn?=
 =?utf-8?B?TVlGVkJWNW1LY0Yxek5LYkZZZnQyMnFjdmY3RGk3clBJcHJ1QmJ4Q1JtN24z?=
 =?utf-8?B?TFIwOVFNOFNWdUI3c1RWVlRKY1BoOFA0WGNiN01pT3FHbjdzbkVsZHBXd0xY?=
 =?utf-8?B?ME83YU52anRoVkYya3VKQ0NObE1wOWR6S1l6b3N0czl1UTkxS290MFZsamRJ?=
 =?utf-8?B?MlFHeUt3MHc5T0ZjdXBSWnF3dUp0a0NoVk16RzhQaEJxQUZ4aVVrN0U4MGZy?=
 =?utf-8?B?NEp5ZW1FbGV1cVBKeEFCRUhWMFZaRTZWZUlGNzRiK2dZYi82MEVGRDZwY0Ux?=
 =?utf-8?B?YWEwRGpOcFhJMHQ0ZHdrS0greXNJV3FTRzVSMTFoOUIvWFdSNkQvL0JOeFVm?=
 =?utf-8?B?SlY0aEtReEt0ZkgwYmJDa2R5bUxjejd0b2lFNDhNT0pwWTBpY2JWNGlsZmQ4?=
 =?utf-8?Q?I7zlfs7j0IYN2OoXV9pL6hqvify0X7dj7MTeE35W0NpdX?=
X-MS-Exchange-AntiSpam-MessageData-1: UGUB4qmYxVlXvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffab7440-57e5-47d5-34e3-08df03614c0f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 11:00:53.4622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4ojtO9fGTckaT4d2Dh6eLlPsAA9K1CQKKo+n0O9RnVvX+pUfrsFOl3HjXzM9uyMpGyWTV/UrgreqwpL6g/U3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7896

On Tue Aug 25, 2026 at 11:39 PM JST, Gary Guo wrote:
> On Tue Aug 25, 2026 at 3:26 PM BST, Alexandre Courbot wrote:
>> On Tue Aug 25, 2026 at 9:01 PM JST, Gary Guo wrote:
>>> On Tue Aug 25, 2026 at 9:25 AM BST, Miguel Ojeda wrote:
>>>> What I wouldn't want is a raw `as`, because the point of the saga we
>>>> started a long time ago is to introduce better tools that allow us to
>>>> get rid of the almighty `as` into weaker (i.e. safer) options, even if
>>>> some uses of `as` may be "obviously right".
>>>
>>> I think that is rather a linting issue, not something that warrants ext=
ra code
>>> in kernel. We have been requesting some extra clippy features and I thi=
nk that
>>> is the correct way to go, not add a ton of methods and macros. Yes, it =
wasn't
>>> moving on clippy end, but I could add a feature to klint instead?
>>>
>>> Do you think we still need all these extra function and macros if we
>>> can get clippy (or klint) to enforce CAST comments?
>>>
>>> I can imagine the following rules that would practically solve all the =
footgun
>>> of `as` numerical casts without having to use awkward syntax:
>>>
>>> * widening casts are allowed
>>> * narrowing casts is disallowed unless CAST comment exists, except wher=
e its
>>>   value is constant and truncation does not happen.
>>
>> These rules classify casts by width, but the footguns really are about
>> which values are actually being converted.
>>
>> In particular for value narrowing we still end up with CAST comments,
>> whose existence a lint can check, but not their correctness (for
>> instance, a bindgen-provided constant that changes in a breaking way).
>> `const_as!` lets us drop them altogether.
>
> The rule says "except where its value is constant and truncation does not
> happen".
>
> So I'd imagine just writing
>
>     bindings::FOO as u32
>
> and *NOT* have CAST comment, and a warning being generated if truncation
> happens.

I can see a use for a lint that warns about `as` expressions without a
CAST comment, yes. But the warning should be unconditional imho -
otherwise an `as` without a CAST comment could be intended as
non-truncating, or it could just be an omission from the author of the
code, and there is no good way to tell.

`const_as!` basically provides everything we need to document intent and
verify the behavior of non-truncating casts, and I think it is useful to
keep as much as possible at the compiler level. KLint is not part of a
regular build, and enabling it involves some effort that not everybody
will go through. `const_as!` emits an error exactly when we need it to,
without any extra tool, and is both simple in its implementation and its
use.

I am also not sure whether KLint could cover something like this, that
requires post-monomorphization analysis:

    fn f<const N: usize>() -> u16 {
        N as u16
    }

Generally speaking, I believe a sane policy is to delegate tasks to the
lowest layer that can do the job. Here the compiler is clearly capable.
