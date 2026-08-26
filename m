Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9F3E2AB0
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750868; cv=fail; b=myRztxiXEh5x9Hr3hNnZlX0hfF2T5IVbpDUMT/8h0fRHdRxLxS27NU/fTCCRbtkCcu27S4QYvAFLuNyocUNryrNqFmZdOUryByrcxqBnUjDHVlLlisV9+isH12jm6I6dikIgf0rwgL2U6hTuc+1Pzes2DJDQXdTONWvKHOif2wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750868; c=relaxed/simple;
	bh=neI2QDjHG86rRXqf1p5+S2waH/KKrI9uS18+UAd55i8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Mnz3XBfoYzZAC4EUJNcUplWc4dP1zga23iShGvffeTx7P6S3ZwJaq35TYQGHJ7HcIdshB8vK22UlEb8OJBP2N2jn4nBzePqQs5DYaxQeiic/c049Hj8Qfnuf6sk8ECyQhHSQFAEdSn8/o3Y4uI9VaBRW3vUbm0C4a14A39RBHxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UEPWzdSr; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UEPWzdSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obi8zBRzgwtBNDQdWlKJOE3bXC7CFc83dL1YuVM+AsKL/6W/QbQUKyv3U6T1A2wmH+q7Lt617Bq2J3SXGctQMi98NIHQ+ZJQTLKmfkPYM4Th4ooSKb4bwAWTwS8V9/mAXY8g9jiXnST4KRgO8NIQE8ep6TrbEBdxzNRnAXkBsgGVNeyYupcr7BtgKN3eqYKlkBhfFaZabaBYdg0NDbl198/tB6V3yrN6mvXCj0eCJmOeaVSuRLA3OGh/phl2pltIxQ0zxWibcBIzbltYAd3yawxj7b0gYBukE11v6hbLEW12++++icXu9VxoIGDhKmJB3oXBHTKOwJzEYoSElNZBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tf1lsSExEoVSCHURlI22wf28pNUu8wM8VBeKir6i3M=;
 b=eoJaVYFdfXfOZxOTwrHtoR8NEyUj2EjwTDyXWlrwfkEfTRzCOB01nloJUEFuL/r1/KXmaqa2i0JarHmcrr95cY6eIMYFzqbm3GV4r9R/WpTs11zKo6/ulxw4UCWTYMqTg6YXZD7U8d3SbE1g/LD6D0H/MCLDYuX9jYvrKeg55Lu4CueMWDINsNelLD12WGF9wcSlFbI9+/X+A7xJtzn/AfRk49iaeyH06ugDzhIam9QP6gzoyn3bbpcHfcAV/aJI8uKH3JIgKiWmbKC/Gdr5JiIrQsTG4LajRDKok58EIF+yyamaS76UKPi7lFLeYQTbfjz52DO3D3hE8tQUa4x16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tf1lsSExEoVSCHURlI22wf28pNUu8wM8VBeKir6i3M=;
 b=UEPWzdSrmxf0IhtkOuAcfcPPu+JWuFf3rgttjsnEPf0Bo+1ublbw8ZBZrKB2qLO6PbL81GPp1T9efeIHHqcpGE7SGRKGWvHRviY0+3oH11W2/qChO9WY0cAQTFXVqqXhpE9m6VPe2UFRVlsPUZivArBVkl8JpfDVe9BQGfWW+WOyQH5SgIqW+Q6+M2xo32+OZmpBvbAExAwobJDqRX1jOdt5bXaJrciSO5RW4/7FTIZm9OBPkUvp4V+aTXMED1BeJfilbtperR3k0GZU02mQxs6opyauK/C4IGQCzCyxd4giM2GQzWo/28SXH7ODEEUzvid9MCM9/5KQqI+4nPyYDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 13:27:38 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Wed, 26 Aug 2026
 13:27:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 22:27:33 +0900
Message-Id: <DKYWSC1VZHDJ.1H8PTHTJ0NM8X@nvidia.com>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <DKXUBFRQ9JUS.29G1A4GBOMOF2@nvidia.com>
 <DKYTZNAX6ON6.1K1372FFAQOF7@nvidia.com>
In-Reply-To: <DKYTZNAX6ON6.1K1372FFAQOF7@nvidia.com>
X-ClientProxiedBy: OS0P286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: cf48c366-2479-47c3-ad40-08df0375cb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|23010399003|1800799024|366016|6133799003|3023799007|56012099006|10067099003|5023799004|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/4K5Ezj7W9Axzu3DAhr+5inchQHUFd4EHEmHOLUu6tTH+haNbZndeBeiMeI3IAFactILKGzeaLHq6+v9hY2ZOc4oLl+KUoIhOxBpIeeeb+bdHEfI+od0Umxstf91qqzr3TiALzssV3yowqIeDoyPGJuTk2boyuhNnalKvKiUXQ04JvIH6vo/Qiw0jP6m6+DVtMGPV2byZpr8Z6qmZZvsu0FqDDIwMenPkr171/PWDHZ/t3eFdfWCP1dLD63UU4ZG+ybtw+/hAHOk4D8hELxi0XV5Nto9865vHnPoHZbIipYs+mjZ1q3qGgGoPkELMOytbCHHnFVC3mbyhVwQWCY29oaFNOLrF7R+H3kqf5JCRS27ERlJrFMNwW2fPTVNZ3kJ6/xKEPd2IC60v9oYSTVAulDNYq1NMWICeG6D/2g/EzaDLzrtv+llJfKTAs1d2aJAbG5Q43raEsmEwwrFfX23Fdta+LlpVdB524FnqVRPgrAnyvd+PTki9ALEz2oSPZ2wag/7lAz1wBx1yJN4muKtbJzzToVNUpaLP9W2+oAuWqE4wScLN1I0DbI/EwJ0C7Ekz4d9HYesojC9zQ6HAEQfNxx+8XT6oOjyfWhik5mWS9yh2R/Z7rS8gkQHvZsUY5HCNvjIRXt9pqLtMBwU/ko/D9hNRHrEBMWOvN46UUZ+w9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFIWTRMNmduNW4vNWVodjdlWmZURmJVYkw4dGZTckJiQzRTU3A4b2FQa1Zx?=
 =?utf-8?B?eXJscHluUmhhTFI0SEFHVkFCMk5QWjc3L01wcExOU1hBa0I5cmhtL01NcHNi?=
 =?utf-8?B?Qm5XRlhwVjBoMHl0V2QrUVlQTzZOOWRKYklxRnh6WjEzS3V4TC9YTWs2TnM1?=
 =?utf-8?B?Z3VaR2lrdVkxaXIvaFZHMjNzQzVtK2VBMjV4cHFRdHBYdnliZ1UzRnd2cU5F?=
 =?utf-8?B?aVdCWmYwSmtRMFJ1ZEFwVStGYWh5b2RLaUowOVo5dUJuUXFhNWxWN3BOVnV1?=
 =?utf-8?B?N1hUaE53aXc1N3BvMk5IWDNaWjdJTXUxQXVUNzFpM1lMMENGZnM2TmtiSWZv?=
 =?utf-8?B?Y3pUQnpTYWp3VCtOT2xQV0pCVGlyWWNHU0I1aUhXV0Z2TG05eU1VbllOWVNq?=
 =?utf-8?B?MUV0TXBGaGV5aVBuam9ndEhmSG8vSXFlbm40OXNqWi9aTVhhbG95WjVJYlI2?=
 =?utf-8?B?TU1TRGhNRXRab3Q0VW9DWDk0dGdGOERpUGNjVDgxc01Jd2hFTEJ2TjlFMEFQ?=
 =?utf-8?B?QXFvZE9DS1VoUHEwdXQ3S1hoNk80b0ZBVEYvcWp1WkU3SCsrVU9WMFF1MDNw?=
 =?utf-8?B?TUcvS1hWQmlqL2hEL2JObVc3SEl4dzhjTGRsSFVMRFRmM2Mzbm94MzZjVkIx?=
 =?utf-8?B?WmI2Q092NFd0RVl6YnhSYkhySEhjQlRkZHRORTVrT1piRlp2VWw2WkZSRnE3?=
 =?utf-8?B?cjdRV3lqVkNKNTBlTHlOek0zZjdlWFhhV1ZCVmFJdWpTNHJMYkdlSGxtMi80?=
 =?utf-8?B?N2Evc2E2cGFsaHFhK0pqUXVyZndWdHMrTEYvbGExeEZ1WFVzK3E5UUVZNGRL?=
 =?utf-8?B?b2FIYUNNdS9leEt1dGtkcjdUVTFObmFYVU56aXF4MVZmeDVLdHlWSUtMaDBv?=
 =?utf-8?B?dCtJRnp4UGJ5SmhtVUwyaFVLQkphUm1NanhNdkoxdmc0dG0rNkE1MHo2eE9p?=
 =?utf-8?B?UEQxOFl6T3Mxa2ZkTytydFJEeDJYQnJoSi9qUzJoUDNjTkd2dW8vZE1mZHBG?=
 =?utf-8?B?SXBjd2Vhb3NXVmxCK0s4Z2NQY1hMUHVmeGdJSjhkdHJZaFRpYjUveEg1dmth?=
 =?utf-8?B?R0c3TFhBRUtwWkRubDJxMzRySUZWWjhVdklKVUg2VHhOZ0Vjam10RFNhTjNu?=
 =?utf-8?B?MjVOcjUyWXZFMXFFaXVyZk1xcEFabnNPTVhUS2puN1BqeTcycUU1VEc1bkdM?=
 =?utf-8?B?bE1WbTJnd1JERUhZWUdRV0pqazVNdS9XTWZBRE1xNGlFQ3h1RnR4RkRLTzYw?=
 =?utf-8?B?dnd4b2VISGhEdzNaSGs3akNlSmRabjNIeGtUZUtLVjZMTzdRQVd6SGZCNVNG?=
 =?utf-8?B?Q3hjd3B5YjE4eXRaMGpGaVZKSnpqcXJRb240UHhQb0pCV2w4VmdSN2RyWU9N?=
 =?utf-8?B?VCt2dXhLd1IzTXNCM0VmT2Rwd29tTlRlRlNFam1xd1JyNVQ5RkhNeUFXL3JM?=
 =?utf-8?B?VjNyM2tJTysvang2NGcxNmNBVUtjSTRRaTkxQ0RrVStNSTVLRHI0dG1wTFlG?=
 =?utf-8?B?VUdnM2tOck02bysrSXhENlNsNHR3clZnRTZHQ2RhMTJMY0NoY0M5Y1pkR2tj?=
 =?utf-8?B?TWFHWXZUSnZuUlQzeDFYZXpFVmFYL0t1VHUxMGh5K2pST3JGU3B4K1hLV1M1?=
 =?utf-8?B?S1l3ZUZoNVJkOHJwQXhFRU55blFVcVpCYzJWaUZGZExPNk85enQ5N2l1TEdw?=
 =?utf-8?B?bXA2dW1ZQTJoWDNOMXo5SkdCckt5Y3JyeWlxanp6Yzc5czhoZUlHd0hKMU54?=
 =?utf-8?B?RzYweWxORTgzQ0lNUW01SGxtbUdRa3VOWE5TRGdOYUxxRFk4d2pUZnhxa3BJ?=
 =?utf-8?B?QUd1VlJIWVo3Yml6aU5HTmUwWmU3SEZHZFNVOHZQbkRtcWI5NTFCR1FIWS9h?=
 =?utf-8?B?TDJkK2dUVURBOERNOENRV1F1TjNoMTkzQXhzS29wNTR2djV5M2EyeGlhMHA5?=
 =?utf-8?B?VHZUN04zQ1dkNEVRZU5qZEpKOUNjMk5YWDViVFlIMk9DdTdQVWR1UEV4U21L?=
 =?utf-8?B?dUFZTGFrMUhGd3dUcDhoZDlmSDRCaHlvWFFEL2lHbFNPMk5oUGpLTjRUMjc1?=
 =?utf-8?B?OFB2cTBXWUJpeU5ZMEI0dStwTHA2d0pNSTJvcjM1WHhjenNxeFBqNW9GK0Ry?=
 =?utf-8?B?QXRLaHR1enQ3Q2hyOXpRVDVYR2s5OGw2SHZuUjVST0o1YXlvWURFc040MDEz?=
 =?utf-8?B?OHJwRjBSYnoxRUhoa1JMc29mMTZHdnJhUC82dkIxNWJPZE42L3VIeWlLaEwz?=
 =?utf-8?B?enhaQ0ZpZis5bG94L1R3TzhnNTFvNFlGdkEyQ0hHaStrVVVsNzZWUThuMDZX?=
 =?utf-8?B?OGk0TnBHcHFROTVuaTlaMHhxSERmY0NKdG5LMk1FNjUyRjQ0eHJWODBhdEtG?=
 =?utf-8?Q?AqlzLp8LO0Kl7ZiI6UNLJUFJfv/VwUZVscbi8HaIj+/Wa?=
X-MS-Exchange-AntiSpam-MessageData-1: eDVeGcN/WQJsCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf48c366-2479-47c3-ad40-08df0375cb8e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:27:37.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJDHu9MNH3s3Al2WetyIUBqigGyDBsOFmp+wRLAGvP6sISAgXXX86PzMSZUxEHaVq0S53602l+jvmEnhFeX5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611

On Wed Aug 26, 2026 at 8:16 PM JST, Alexandre Courbot wrote:
> On Tue Aug 25, 2026 at 4:18 PM JST, Eliot Courtney wrote:
>> On Tue Aug 25, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
>>> The casts module features a series of const converters (e.g.
>>> `u32_into_u16`) that narrow the type of a const expression provided tha=
t
>>> its value can be proven to fit into the destination type at
>>> compile-time.
>>>
>>> These functions are numerous (9 of them), generated by a macro and thus
>>> not easily discoverable, and cumbersome to use as they require a
>>> turbofish and const expression between `{` and `}` braces.
>>>
>>> Replace them all by a single `const_as!` macro that expands to a const
>>> block verifying the lossless nature of the conversion at compile-time.
>>> This turns e.g.:
>>>
>>>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMEN=
T }>();
>>>
>>> into
>>>
>>>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u3=
2);
>>>
>>> This makes things easier to read and understand, while shifting the
>>> burden of checking the conversion's validity from reviewers (via a CAST
>>> comment) to the compiler.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/num/casts.rs | 129 +++++++++++++++++++++++++++++----------=
--------
>>>  1 file changed, 79 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/rust/kernel/num/casts.rs b/rust/kernel/num/casts.rs
>>> index 7e6c7dec747d..a4a18a6f2ba8 100644
>>> --- a/rust/kernel/num/casts.rs
>>> +++ b/rust/kernel/num/casts.rs
>>> @@ -20,10 +20,8 @@
>>>  //! - Two extension traits, [`FromSafeCast`] and [`IntoSafeCast`], pro=
viding conversion methods
>>>  //!   similar to [`From`] and [`Into`] for conversions that are safe t=
o perform in the kernel, but
>>>  //!   not supported by the standard library.
>>> -//! - Another series of const functions (e.g. [`u64_into_u8`]) support=
ing the conversion of a const
>>> -//!   value from a larger type into a smaller one, provided the value =
fits into the destination
>>> -//!   type. This is useful if a constant is defined as a larger type, =
but needs to be used as a
>>> -//!   smaller one.
>>> +//! - A [`const_as!`] macro, losslessly casting a constant expression =
between any two integer
>>> +//!   types, with conversions that would alter the value reported as b=
uild errors.
>>>  //! - An [`arch`] sub-module, defining more conversion functions that =
are only guaranteed to be
>>>  //!   lossless for a given pointer size. These can only be used in cod=
e that is specific to a
>>>  //!   given pointer size.
>>
>> Can we add guidance somewhere in this file on when to use const_as! vs
>> when to use the u8_as_usize etc ones, when both could work? e.g. use
>> const_as! if you can, otherwise use the function version, or, use the
>> function version if it's sufficient (types alone are enough to prove)
>> otherwise use the macro.
>
> Yes, that's a very good idea and the use we are currently doing in Nova
> is also not consistent. Basically I think that the priority should be,
> in order of preference:
>
> - stdlib's `From`,
> - `FromSafeCast`/`IntoSafeCast` (for non-const contexts)
> - `const_as!` (for constant expressions including narrowing)
> - `*_as_*` (for const fns with a runtime value)
>
>>
>> [...]
>>> +#[macro_export]
>>> +#[doc(hidden)]
>>> +macro_rules! const_as {
>>> +    ($v:expr =3D> $into:ty) =3D> {
>>> +        const {
>>> +            #[allow(unused_comparisons, unused_assignments, clippy::as=
_underscore)]
>>> +            {
>>> +                let v =3D $v;
>>> +                let r =3D v as $into;
>>> +                // Pin `back` to `v`'s type so `as _` casts back to th=
e source type.
>>> +                let mut back =3D v;
>>> +                back =3D r as _;
>>> =20
>>> -                N as $into
>>> +                ::core::assert!(
>>> +                    back =3D=3D v && (v < 0) =3D=3D (r < 0),
>>> +                    "value does not fit into the target type"
>>> +                );
>>
>> What about giving some text on what doesn't fit where? e.g.
>> ::core::concat!("`", ::core::stringify!($v), "` does not fit into `", ::=
core::stringify!($into), "`")
>
> Will do.

... actually, that's probably not needed. Compiler diagnostics already
print the faulting line verbatim, so the expression is fully visible.
Stringifying it would just duplicate information that sits on the very
next line.
