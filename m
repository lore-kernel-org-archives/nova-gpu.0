Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22D42902A
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666097; cv=fail; b=LwfOFpE7UfWsWHXF0ptjJivDw5KqG/3VS4WaOmgZDLmMGvgV4l31AoMcWrlyDBNTs9CeRH04Nc2xlq6d9kB70Tgv2dzHeAFN5WZXeH2eyNubMVy12ZfJUi1I6kh6SLuF/jhbIjCfpZrWcA1L4NiB1oyfDoqFJNspXNs5Ke+Dl0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666097; c=relaxed/simple;
	bh=cHSiHQc0Fgfr/CABaeXYEG/qAJ2n6D16boMCJQkKpGU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=nNgIpfH5OU/XrZ30pDBVLNwq8+/IPcCKzkGBNKAkxvDIR1smBC+zEx26OmG9ZXIef2cUU5Y6ZlvW4Ul80vt/xC6yxMW4ResGR/7SWVs3QqQUJApUSucpkND/rq/yPtb4Zf34TufNZ8ovObNadhOczU6MMxLDcu3wvLoLHqRhdcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zcz7SFyv; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zcz7SFyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUpDMKvRq4JKDIieVahOQp18jf8CENlHb9XtsNBoyDEiHQd0pTRRrdfLq9/1XhUD3bwxNmxXhANqRPZGeuIHcg1o43uZ0fLl6DwlShlZIrPkALoXfzcBphtG+VEnoPAxN4hs78BDtAnSJbZIym2MA2UUwyk3Mn+ItHwpz/dWYRZvzZdGDdxctVXmirHhdMJ0hkq+L3vCW0JQZbmMmm1yHdSwJ8Gf7LDyrpJNEUJIhLZGW0I3XV8qOycJVqUXYERADlJfMvfIIIR3g8hL42u7LRZp2DHyQaScdG4b34veKRkn2mBziO/mtdXRlLrm9b5EqbRvGlivLZToOaK/qS0CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0sIhNxls4z19nePWhLswS74Ryr+04icSr0rv0wu+Kk=;
 b=sidi5j5ZC7csclW5TnkWYoBC4FWo0Wrr1mZ1p1h4z7PVNB7eCWvx5RHUHjcX8BYB1Ic5CjnVFdTpIwOhJwoo8PE99Bg94wocewU5iT3nOHTplh+exYHvphBM5XRnaUXCRJ0srJjFGGHFZZ+pt14b0pCFtWc8fCj83ehlVPJ5JI7QvvCpcuf2QSxN79lyHnJT9pSTQA5fF0f69x8Qb6ff0ENP362rwEn3U26m9cs8Ya0JTrZZy6roSVoqdYycbgp4xvqvzAb2GM6asSCf1IXmYRhUNqD0kDOip3CWd6FPQgGBt/9hs6huFrqmVZq3QaGYkVB/0WqZbzfetd5Jxj6j2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0sIhNxls4z19nePWhLswS74Ryr+04icSr0rv0wu+Kk=;
 b=Zcz7SFyvV8AS0x+HM9vk4jS9Wd/9ZFosVQQBAFHFyAku9JdGM3L2Gz+8OYByCgyza0yqONvo8B1fj5a5ICsoWJXlhuMyA5PqOysJKNksKSPSwzuMIU7pV5Bcm8tTLKmWPscECUJo2zbWyk6/eBa7v9GIqg5zX4u/XUPwEuPFgJ+UGlSi2/fRJkEH63/ypIyl9XRWev/napM+je9QDz3RwAhWg2HMhkllv0fOF2DfjKbKmc39Jg50H7SL4+zJQJsx6x54E9R0Xfnvh999rGDCi0mHfcL6E4zPdYjDMgaWV0ZaUqtvoplddBVfOpNCy9m3BCVd60F49NhlOlndCn+ZiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Tue, 25 Aug
 2026 13:54:51 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 13:54:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 22:54:47 +0900
Message-Id: <DKY2QN4BPX8W.17VUMXZL2I5CS@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
In-Reply-To: <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
X-ClientProxiedBy: OS0P286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 59452646-524f-4b7b-877b-08df02b06e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|23010399003|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Z6IEjyqe/61b39H7KsNUtOzHxMwzttn+Bw9hoZQ4EYs9TakR/hP/Iyc+3uve2TuDb5vYMp13BFsMFDySS1P+y/OttMlYORX/sOvuqcHIv54sh6ZLTbJbTZieO2cjcTQp7+ib9dbqvWnVZtEwxTqqbqJ/lttVEZYarpQfY/oR9FUEfOtsaA+5Mh9/wZViW8Hi5dBO/We6jLPH65tmbNXSFLzihkDOiVAtgYbS4wTWSjYCIcvF/w1OWJNUjGNJFAe+irPQqFzIO7j2TpK+QTbWAIl/f+CgyBZes7bOslotOKLwDnb/yB8qWQu46AJBjI0suSMd07mgLWVD1xyJc4RPJ9n2mIsYDcAQa8Jp658a287EcNquSmcBRthK/8y8UyXvbkHXwSgVyeZ/yo+eU5yJJyGD3SLDvy/6oS4T94wc9ngVbCNRjTMNRISX9nEc8YGlJxprkoIruUcNX9aOYSy61faZmAa84yP75u4ElWaamK82VevVKzYpqkWOWg87/WTRcbeEmTfGc00N7BdHr9bcCISmv4e2Dvh3LUrtq66ozH5jxuMwBdeRZll4zAfCVOvKrTbOzz8EA6fRw1unrekgHzmr5wQwiBgZh2lOJVM8tEOy1zb2Y+h37BZ2Ma0rNvq+SLW15cnfWHKaxfTavTC8cxlmHzHxJu3Q39xFQR2/Ho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVQ5ODJCYW92bkx1Q2I5aXQrYkVkR0ZHT2JueDZVK1UvK0lQMVRlTERCUUtD?=
 =?utf-8?B?dmxzam9GWE9ZZUJsVytJSTZDeDkxTjJtdGVmeGZ1aW4yZ0NpYVdTYzB2b204?=
 =?utf-8?B?TGljZW5qdHRTb0xFS2Z4aEdsU29PNy9DbU1iZmlkcXcvMkxXV3ZFZmdrczEz?=
 =?utf-8?B?Ty9yY0sxSUkxK0wvSklmVlA0a1VKdHM4Nzk0UjhGbkZJeldURXJVTnVsUVZZ?=
 =?utf-8?B?cFdqMDlIeXhNb05LaHdtSWJvTXpZeG43Qk1XMUFzT0hxTDlpQjRqZEVZNUg5?=
 =?utf-8?B?YkVGejlqTUVVS2UxaGJNTE9JdUdhb28wY0ZGcEkwM0FodERsYmhqY1Y5Y0I0?=
 =?utf-8?B?M1dpOEVJRFFoaytRQXlGeXRzOFZ4dEd2cHZZVlExWk5DVVRMUkZpd1VlSnQ4?=
 =?utf-8?B?aGZDVlhXbm1FZCtKUUVFT3BBVldZSDZVUDVUVkVaekpqRFgxN2crV2VBaXh4?=
 =?utf-8?B?S3JlNnZjZmoyQmJYK1A0d1QzWUN5aWg5MmVIMkFpbW00ZXJVY0NXeWQ4MWh0?=
 =?utf-8?B?QStEY1c2YzduTVFHL01LRWkxNFYwNnlZaWdvYlY3ZGRmQk9rblNhQzQzMjBO?=
 =?utf-8?B?Ny83WnhkSXg0RE5kVFRIN3RWYlNmS216QTJyd1VnUUJOWWZDWjVBcGdpMVoz?=
 =?utf-8?B?blRXZDd6SUlabTN3Y2kvdTBCM21QYkdWNVFaTEZKV0JNbFBNeHNVa1BlWTAy?=
 =?utf-8?B?S2cvT2lIRXUwWmZVNUxLVEU1dmxDNXpxdUhRb05QbDFLdWFNMzJxUFJvNTNo?=
 =?utf-8?B?NkI5aFo3QnBaNEMxQWRuSVlHQW5YdTR4VFRLanZWaUJ1ZFZvTmx6akRGR0pO?=
 =?utf-8?B?Y3NzdFd3a2VkNlphTGQvbWpLVnV0YWZhM05JREs5c3FDTEZiamZYd3BEdEY1?=
 =?utf-8?B?U084RDVYTFFsMnVHK3hHbWVhNS9LUlUrS3VtU0Z4RC93RzBoVEpXZjMyb2J4?=
 =?utf-8?B?SlFod1VWeVAycVZsc1ZJWUJJQ0wwaTNIVnJqTEZuUVJqTjdFQ1JCMzhuUnhK?=
 =?utf-8?B?THlyNGZwQnF1YTJBNlNCbWZ6THN0TzBwM2FYMVhld2R5RkNwM244TFkxbnZS?=
 =?utf-8?B?cVV5LytQeXMzZTFUZ0JqYXRjZG1hd3h0MDFzQ1BRSXVkNk1Oam1JbkNTVld6?=
 =?utf-8?B?WHhXSFNMZFpuemw4WThoN0oxYmsydUxOdDA1ZHJScU9LdDhNQ21SN3ZjL1I3?=
 =?utf-8?B?TENrRUNMcWdFb0tQbmduOGZZQnc3MVNJYStkZmx0QmN3bHRUYXJsdFVmWUFG?=
 =?utf-8?B?SjFxek81dEIxNUNSTU5lWmRSTFk2UkVHK2pncVlIRmxSaHkrUkJYN2UrMW4x?=
 =?utf-8?B?dXdjM1dtRFdjYXNsUVU2SnQ2YTZTV1BBTmQxUDBCSG1jLzYyWnVobzNIT3BL?=
 =?utf-8?B?MlpMUmpZRHN3dEQ0aXB0MUR0MktyUW5hRUE1dHRKNUl5YzJaZU5HazZQcFZ6?=
 =?utf-8?B?SDlLeXVRQ3BESEh2cFlLQ0cwbGFhMnBuZWc0TUFNeWY3MXY4TnA1NHROVDZr?=
 =?utf-8?B?VlZ3UktWUHFZcm1ZYlR4dkl6OUhBTVFuWmo2REJ3Wm5RKzFXYjVVZkRLM2NZ?=
 =?utf-8?B?cm9XM1IvT1FPbTg1UUJRcFd1OU92am9IT1V5eUhKVzZtOEV3LzBnMW4yNExO?=
 =?utf-8?B?Yks5bVFhNTAvMlVYZjhRNkVaVkZWOWFla0RaWXBxTG4xbXR6MzNwbnUvVlhO?=
 =?utf-8?B?MFduMERkS056VERKRTNWZDU2RXVTT3lEVU9BT1F1MmJxY0IyWnpTb21EeERF?=
 =?utf-8?B?K2NtR0NCb2ZnZjVRWG9rODRSUGxpcXEvOFkvdmVKWDF6RWppbjErUXBCYWdH?=
 =?utf-8?B?bHpiQVlVZGt4SDM4QUk4cERtdGdKV3B1V0lhUjdXeVRKNUUzTDF0dzNyZGRJ?=
 =?utf-8?B?K280cFhvK2pqS3NEMy9ya1RJcnlIcHFVS0IwektYaHhTNUhyVGNaRGI5ZWJ0?=
 =?utf-8?B?R25DbkZRbnNjMlM1WVV0UFBmVXFPRkQ0ZGFMbDR1SjNyZ2c1dVNSVmFIUC9h?=
 =?utf-8?B?S1k0b1VMaWJZRG9VaFRJckpZWVRuK0hPNEZUaDd5cm0yV25nazBUNW1oWktk?=
 =?utf-8?B?aHVDK3lTR0U5R2ljUUtEdEFqU1NxQ2d1Tzk3cE5QbEUwRTVRMkV4d3NvQlMx?=
 =?utf-8?B?bFRDZTdOWFY5MGFzenNVeEdPTjZoYzZBWTlQUHlTa1U0TWRYaUgvQkpmSnYy?=
 =?utf-8?B?bTJaL3ViNVBZZnpVZWJaSDN6SDBoaFFYK0pqTTM4SG04UEZHMFVoY1ZhTXo4?=
 =?utf-8?B?U0UrVTZQc1l2QVVEcWNncnkrU01DOFFiUEx0MEFYUTZHQlNHUjhrdG90N25G?=
 =?utf-8?B?ZGkycVltS251K0RJcTBUYkhuMFRJOWZXck5KV0F4dXlmWFEvSnkrcDVXc3hu?=
 =?utf-8?Q?RoiG8ERg6vezu2rDUP3NMAaO+I1zE006/xEWq6a2nJJ4R?=
X-MS-Exchange-AntiSpam-MessageData-1: MDoLIQ4SOA5jrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59452646-524f-4b7b-877b-08df02b06e8a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:54:50.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9VTgFPOtz9PPflMj0Hn4qiwCDLBCEZzP1xiqnj2OU/XxWiQPMko0wsZGsZAajIfiVsz0VBvNqQnh6A7Pr63rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411

On Tue Aug 25, 2026 at 5:25 PM JST, Miguel Ojeda wrote:
> On Tue, Aug 25, 2026 at 4:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT=
 }>();
>>
>> into
>>
>>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32=
);
>
> Hmm... I have been following the discussion and listening to both
> sides of the argument.
>
> The macro interface looks obvious enough, and we could consider adding
> it to the prelude.
>
> Having said that, macros have a cost too when they introduce new
> "syntax", so since the beginning we have tried to minimize their use
> to where we feel is worth it.

Ideally we could write it like `const_as!(MEM_BLOCK_ALIGNMENT as u32)`
but unfortunately declarative macros won't let us do that. That being
said there might be a better syntax.

>
> The former line above is not perfect by any means, but it is
> nevertheless syntax that one needs to already know. Personally
> speaking, I don't care if I have to write the former or the latter, to
> be honest, so I am OK with both ways. But I worked with C++ TMP in the
> past, so my eyes may be desensitized. :)

I also don't mind the turbofish. Actually I like how it unambiguously
signals that something is evaluated at build time. But in this case the
macro seems justified to me as we are trading 9 different
macro-generated declarations for a single one that is much more obvious
to discover and use. The declaration site of the previous helpers was a
paste-party that is difficult to read and edit.

`const_as!` also has the benefit that it can probably survive the
`TryFrom` constification, as I don't believe we will want users to
sprinkle unwraps in their const blocks.

Another bonus, especially if we add it to the prelude: `const_as!` also
covers expanding conversions, so we can also replace many of the e.g.
`u8_as_u32` calls with it, with `FromSafeCast` covering the non-const
cases. This leaves the `*_as_*` family of functions only needed for
const fns that need to expand a parameter, for which there are no
in-tree users at the moment.

>
> Apart from readability concerns, we are saving here a few characters;
> getting possibly different codegen (forced textual inline), and maybe
> having better or worse compiler-side time/memory/disk numbers. Is that
> about it? It would be good to measure any actual difference.

I don't expect much difference between the two, but will try to gather
some metrics for v2.
