Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC5481652
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668332; cv=fail; b=luZ0hUKoZ4+BA6CdhCGpJtGcHeRs470G88YErcD6q1JuzTheQAynWtpN/q1DKXbTzvpksNc5AZf2A6w9e8qlE5g+8etHQ5TjX67J+BLsSXYTvPrzNFBnD1l+f+znKNan4GsmcKQI4o+EL2kZvKu3w1eJ5OIt/7ZVWE8e+GspdX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668332; c=relaxed/simple;
	bh=45QX+GaMV/MjEqwQZKGCgbAvKBn0hGZHOnHzKs8f4Ok=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=lxMz7QFxp4/5tEyBRxeB7rxnCpHMR//UwRiF2xfdab+ez1F5a7N1DpuIeBl352EyPMlHnvOHRLXHtfmg8zFm3YJNL3pew57xQqB8LobrKR738rOvnBJp8r8s+FuCGn8ZNxkCSwRbzq33gdjAPMhTvFiCWavm9ER6bIeA/nv+XeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hk2KoZKJ; arc=fail smtp.client-ip=52.101.61.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hk2KoZKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAoZDcGEtrf14fuErluaxJOa2lOa08XOUw2ldbfLygY2ZfnqAuMSde97zPT3cgXbURbHVVvgR8lsBseoZzliKuNrrvnrRyD0WEgfo5ijKEYpkTeEqr1Y73dcM0/du8mofRfkthCURK1eTkdI2qDNtB6GlrZ4gCFHZId43JE9ktQbWI5sghf3/xB83cUraSF8+U3eHJHHkNwG1Uc/6Io8UuL0O+JFHfLnyqkgDgMpjIxHsKKjDWJhUAXocWr9LPHMsgyIge+wktf+i5WUSfJhTMEakwlsDEO0AOfNhqU3irVQh6yaUeuThhobPnNAjFPqm8aFaLTLkjW2+TWGYG6wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwVg/bkHGjP7f7uD9AiO7LPW6N/8eNqESRp5sG98gzY=;
 b=ci75iym4/AmgS+el+dL7b/e7Vr1VuBeBwXGoNW1hqQPCCRLLyWJTFnuxeh/zYYnuQRKAplay4a9lBdY3c5NJ1m+ENltIE8WEDNhP30ZQ/2uE7vof/p/RZK7/2cTPIKoJK9WRGiEEqzlCCJpzxpLKz0i2dTTDOjSec1Oc7OMDc/pBMAwuNIDIfeeeKebPz/3vU1yvk0zVQnSBNl7aG76kqmwTRRvnrobLoNXcXYsNvNtKU9+MiGS9buKY0lGHYKf9X6z70cFmc3sr2xsANlv7EH4LUREVijfFeIgekp6glxAuPfjtVR9n7ys82hP/oMcFVkbS3rRBf2aJ33csfC/SYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwVg/bkHGjP7f7uD9AiO7LPW6N/8eNqESRp5sG98gzY=;
 b=hk2KoZKJmf+D31pmbKS0tFJCfUk5djtp9od/YAOgk6kF7lAVbTyJul5DC5X3OqHlqCS1f36v+gVH0Pyy8kBDdcV9pZ/QQQifwhhlR0VpfQRwhO5xFSFJHpbfxGfKksuMlvzcLcYxGeECpWhXbDjyo0XVzvsmlN2GMixH+KRlbt/u3Nglz1ZZT+MUTNlv74TZGrh+N8w8AsUUzo2fbiXqbM+fl6G2ZqDAOPLl4EmiuFK4IdO9dEZ/DmmxU2KMv+F1MYtMUP81Ni+Cp4wcs1EyUZMhdaHwvctHVJcnBErY9f5dUQ9mvTAl9jp51aGzdpg10RBheAQ3mHOQlzrXy5FWCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 14:30:42 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 14:30:42 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 23:30:39 +0900
Message-Id: <DKY3I3T1E04Z.3GIG7U1L1ZSM2@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
Content-Transfer-Encoding: quoted-printable
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY2WHYIIWOH.ATST6NOVK1PI@kernel.org>
In-Reply-To: <DKY2WHYIIWOH.ATST6NOVK1PI@kernel.org>
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: c120f57f-f58c-43ba-876b-08df02b57120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|7416014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Jq7nbpuezE7tRMZIaIAW6EHL2S7KQkG8CMGaN/c6eInZHySxd+CFVgKDksp+WWZNsMkclakOV4J3DthqDbJY8GZf2bYCvSzkUgnMNuApFts+lGDbSU+rLR3bMVbgYE0ydat6UU5M6DgXbgAQB88WRi9XNJsW5+Y/wwB7ZRvlcfMQe+c626A2S9oK+XfF7QStiahQBK4lYIbXjUIAdbMIAsbSMNwgAjtbSsRHD+gfEAGQECsAEucu/9qLHes2MtNNdzclWyTr1JjoMY7yLHBenEjP4U2UEhZSziT+ofomuHRUlW8ZgiNrSx+AjpvfpOZtSGzo9jjt4rA0AxuTdbRu3Yi1QLmIZ/ehuocnCNii02jdqxKZomdO4iw49At0skGIlVFn85K4bZJ4WfgFH9om5JE+KlTf1b9O+aFEEwOHAzccpVQc12igYDi7NjToulvi6JRql/bd3ljzpOuoMYzTXPSJb9v6EGsQLZne4C0i2vGrfoArprJq/ElT8Lf3J3ABBsztsaaKJCW6qUlHPalP7zY1qIH7JUU8oLOy+BxCYjDgIkYQ26hKwQEMd9bH2CtjsdnpB3nDJ54CAbOaVKBmznhfPPyoYZ4uY8do+4L2RGrmgxpKHZPbbjwUCEpvxSJHObHmhvWpAAxHfdroHPpC47IRrhFaoEdxI0Sy1xarWoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(7416014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkNFT3lVSWljWmJseWtuNGhKbEJGdEVoWDF5WW1LMGNvK3BYT0ZPT0Q0QXdB?=
 =?utf-8?B?QkJUM2p5aDZQeUgxdzFFMms1MEVaZWpaUmt1c2l3Tmw3TERpVW9KM0NmVHYx?=
 =?utf-8?B?Nzc3ZlUySzY0dGZtOTFYRzNkWitIdlNvbUtyckRjSVNtSkV1RXQ0WVJ3QVdU?=
 =?utf-8?B?M3B0R1F2QXl6ZExFNnZxMTRDTGI3VU4rS1JDNGdadmxvRGxMYStLVVBwNzRJ?=
 =?utf-8?B?M1VSL2xDUTA2Z2d4MmRoVStmY3V5K0JGL2g0YkJTMzBwZ1QvN1l2bGs5Znhv?=
 =?utf-8?B?b29HWHFJQzNCbDNzQnpBOVlLdHNMN0J3ZjJjNUhxYnN0VHQyVDFkZ0tWaUEy?=
 =?utf-8?B?eGZKNFo0MlF6UlN6M1puaDk3UnRMRHpYMVZvWEhxMXJKaFcxKzdkaFhLVXlz?=
 =?utf-8?B?Q2ZzSVpxaGJ4UENmZi9Cb2JUN0QvTXBZL01rbkZrdnJYalBjTEhBUFBKSW5R?=
 =?utf-8?B?VTlVQ1VqSTBRUCt3c1F3WjBHN2JVa250WENEVGVpL0dMUk1ITnNzTEkxVlFK?=
 =?utf-8?B?MElEdTdNSkpoZWhRYlMvQm5HL1VLeUhvT2dFY2ZzS015VG5MeHZHTkZtUTlE?=
 =?utf-8?B?ZEFzZE0zdGJFcmVUN0tjSmtEWXNlTGVHazMydWdKb0lCcEwrdU8xa3liWGRr?=
 =?utf-8?B?azdteks5cDhoQnJMTWxmY1dhVnlYK1VOMjNNWHFQdjdkSm1CdUVQMmh1UmJU?=
 =?utf-8?B?dmNTYWo0eUJGdVdHWUppOGIrVEg4NkhlbFJmeWVhY2NEenFoMks5b29OZk9B?=
 =?utf-8?B?Q1BURDBnMjErMUQxYjh3VzRIVFg1UitjTWlPZVdHSTl2VHFSQm4rUEVWSFdn?=
 =?utf-8?B?RndRbmdIWmpuVGt2cEF5K3QrK1g0V1RnVDdSQUc2N2FMcGJvUnl3V2hrVkRx?=
 =?utf-8?B?YUZlazZOVjZKblROcHJKOWU0SkdEcFE5N0l4bmltYURVOXlDaVZRVjBWb0R1?=
 =?utf-8?B?UDBQay9NaEtRZzJhaUNoSWdxMmVRaVdxTnd6L3p3MGFteXBsNHJLRmx3TERs?=
 =?utf-8?B?ZFcwaEpwTm9oMHhuOUVZcE9yWFAyZ016ckxvd3RaRThCUm5YMVJ0UnZVNnBo?=
 =?utf-8?B?bkhBVkFtcWt4SDhTL1pENHZYSTdvcjF5NEU3SVptSnBkb2gxdWNxTERwTTA3?=
 =?utf-8?B?QUlhN0FaMUlFQmFhekFqdnAzRzk4R0k3V1RUSnk4RjQ1czN6TnFvaklIc3NU?=
 =?utf-8?B?dlN6eDdJQzhPbHZvUHRnN1MvTjNoYWxOd3ZrWDlYbVhYM1lweU9VSEtrS3E3?=
 =?utf-8?B?cTZmQlNJOTl3dVNWUk4vdVRjU0Q2TGhFbTE0YkdZeUZZRTZrOEwzamJ1Qmlz?=
 =?utf-8?B?ZklqcXlONFN5WHN1c3BxSmtOTk1PcmxYbTlwY2c1NVpJT09CWXY0TU9Ob2NQ?=
 =?utf-8?B?Ly9JZUt0MkcraHJBa1Eyek10T3RHVlZ0NGZxQmJueGxoNjVCUVpPK1ZLcTNK?=
 =?utf-8?B?R1ptS1Bpd3l4WWRydmlwbG9CUGdEajR2UzUyRktSOFNSYm9QMlVaWUJJVElC?=
 =?utf-8?B?aHowMTZNRmJHQzcxT09nWitheTNXRTIvUVp4ZWwvSjBNdFRNZStmL0JZV0tV?=
 =?utf-8?B?WVBkSkQzTmY0T2svTFpZa3RYdWI1VUZHakFmVkl0VDdCYWFvZXpaQ3BpMS9D?=
 =?utf-8?B?MEJRaFo1UkNyUlVrTndkMlhNallaWFhJMnB4UHVCSkJxMnhVUWF5bTlkaTdG?=
 =?utf-8?B?UDViUGc0cE5ZeEJXK3dyMjVzTjZpL2c1ZU9kN2NYYytuTGxPSGMyRGVJZ0tw?=
 =?utf-8?B?QWpFcjFDVjlncFQ2UTUrVG9nZU94S3lmbXUyU2FKSUZPTnJiY0F2emlHa3hB?=
 =?utf-8?B?UlNOUFFyRlpuaUVaM3dFOHczM3dCVmlEL0lhNGxzUXU4bjZidVZZQm5IMlk5?=
 =?utf-8?B?WGh3ZkdnZDlpMDlZd09kRGxrZWQveHI3UEdKdVZtUHFFZytuTDNuYVhJcU5q?=
 =?utf-8?B?VGpoWnBOQ0ZzaWhuZHlUQ0J0bE9TaXRBN3VrbmtyTHBUR28zMnMxcHRlbmVl?=
 =?utf-8?B?KzBMTktIbXFFbFdJYjNIeGFIQ0ZUQm5LdTZyUmRMRnA3QVdXSmtQcWQvYnNs?=
 =?utf-8?B?Y01RL2N0YUFvWGJBdWJiWEp4eTIyTnZlV2pkQnRwVGRRaURldk8vN1V1c2N3?=
 =?utf-8?B?dFJDYXp4aS9hTkhJM2o1VEt2dFZRMTh5S0FLMVlpcjRJajR2b1Flb1h6V2tN?=
 =?utf-8?B?Y3BzTnExWHVQMDdadkNuK0pyRVFWcjBERHNBR21vaTh4eGYvN1BCcnhQd0Fq?=
 =?utf-8?B?b3FEVWdPRVk0QWNEVTQvQyt5R1QvRnlNN1dSRjhpeGs0clNBTFBEVFJOc3Vy?=
 =?utf-8?B?WlJaaGREZ1NlMUV2Y2VqOFpHcFVyeHFVb2JOL3g3Z0lmaWI2ckQ0ZEhQMjNI?=
 =?utf-8?Q?DaggapzSg3yFo4w9dwBLKsqZkURPhMt/H+KfNrjiamiFm?=
X-MS-Exchange-AntiSpam-MessageData-1: 6ntLfezOsTqRBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c120f57f-f58c-43ba-876b-08df02b57120
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:30:42.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWVeiDcIn1gz5YbCgnodelvGdPcSELPFIfM/Tmvraa0gKwDUK1W3lqiGUk2Xrs9lb9gXMkrQSdm55AVAuRzxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370

On Tue Aug 25, 2026 at 11:02 PM JST, Danilo Krummrich wrote:
> On Tue Aug 25, 2026 at 10:25 AM CEST, Miguel Ojeda wrote:
>> On Tue, Aug 25, 2026 at 4:45=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>>
>>>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMEN=
T }>();
>>>
>>> into
>>>
>>>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u3=
2);
>>
>> Having said that, macros have a cost too when they introduce new
>> "syntax", so since the beginning we have tried to minimize their use
>> to where we feel is worth it.
>>
>> The former line above is not perfect by any means, but it is
>> nevertheless syntax that one needs to already know. Personally
>> speaking, I don't care if I have to write the former or the latter, to
>> be honest, so I am OK with both ways.
>
> As mentioned in [1], I also think it's not great, but I also don't mind h=
aving
> it as is for now.
>
> I guess my main question is how we expect this to evolve. How do we want =
this to
> look like once we have things like const function arguments or const trai=
t
> methods? Is it worth getting back and forth on a macro solution with this=
 in
> mind?

I've thought about this a bit actually. Let's imagine we have a const
`TryFrom` trait. Even with that, we probably won't want users to do e.g.
`u8::try_from(SOME_U32_CONST).unwrap()` every time they need to narrow
something (if only because it would translate into a runtime panic if
somehow moved outside of a const block).

So for the same reason we are considering `nz!` to build non-zero values
efficiently, I expect `const_as!` to remain around in some capacity,
which should make the transition invisible to users.
