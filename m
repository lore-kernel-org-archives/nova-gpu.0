Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF13955CF
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659318; cv=fail; b=Jw+582QaI20Q7Bi9AbOs2UuWNkpXgEuYl+WwlHHBgZgUUO+4BPr/tCe3VVvkzb84ihEz7bAdkZ0JWzh1zb5ymYnFcv+4XN2Q2mZWLf+XvjVicN6giul4+1GStb9yrGSNVzCTPI8cAB0D2I1r6lAxBaFLpg99Qx/PhNZrHL9JOJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659318; c=relaxed/simple;
	bh=48hE24saoXz9VZCRi6T1YLiiAtJ8Iehc/g3V/wYcz/g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lHpcf2vStqsx4UeYdloKj6eFSYkwMR54zcZQ/xWeWAfxbIqXBFXbVQRQqOU31rYBC+SHAsEMZCv/QMl59uTcTC5MqYiu1QmB/2Tfu8CJ3W/iUqYGhr1ljJjYvplYdzzSDOqTgwPm1aAlA4J4uBivdtVQwrYLJTu56ix33vz/cVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=adgvochW; arc=fail smtp.client-ip=52.101.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="adgvochW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI4oup3NcW3Y1oRZyrGVRSXqjzsbWgY49G4fRwQy1GgN81cqoNBUhMSrqbTQzpN0eoE3lKnGb+6nhXCVxqo2UxSDieTKIeGiz4w22nvDzjfVo/rOZkAl1eI+koWkVPxK4f9VEUxSU9bVT69CK8VCivh+UWaT8E/0aQH5V4BaHrj5qH96uGBNrwhsL5jGhfU+aLKxvnQXOsNdyXRu4IPmIDh5qoVeB18hBmoGwog+RXbO6GvxhZrOQx4A8WhUxifJhWFEYQjO83sIlMr+Vu+k2CMGZDy/x2Hvg2v06JBOLUDd1lAE+Arym3MhNWhQI1xYqEMcUOvNKvI4f4aE/IoNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4uuKvNorT2lulgI/7lG3j7xTRD9O6cOezaFWsSQVYE=;
 b=gf17LKbd9bx8vW7VDY5usGCQLAELBikeKhsExJ+a4YsfJriEELCpqbmXVk+rhj2ldpSGzwsS3xH7xNT+jHE5Qj/0oAsrwsy13ecfyZPecoj6OWdpgWua2lBzqifp43dZVgbkrb480obkgt/YJQjcstLGYlFnPpRx8acsd2jHDV/TJIJX3tiQXzH76Mju09qWX3TKKnr82wuNs4ESTWy9isk04Eelv5SkirZBpP11edDpQIiyJnYiHZJnbYEblrSfZomzF3B7PtZl6m+6EGVshl+vwOrhtkEq0VRlsipSr1LMFs4ZpHG3qGFQHfch6zsv2IjR42toro0Jw1ij5zI/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4uuKvNorT2lulgI/7lG3j7xTRD9O6cOezaFWsSQVYE=;
 b=adgvochWDdedIWdbSQ5zcmCe+mnRw3SApFJaflNOQSjV34Nu/FDuH4v650sZ/4qG9O/2Vdc5K7Ec/2bDZqYVt9u84oH4NWvHVNgbNyGGMO36tRaACpri4VbafhnGZ3Jsx8cf/WZ9lhBJ8wlZQ1hmYXUK+LqAytZis9m44NqW6wM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8764.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 12:01:43 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 12:01:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 13:01:42 +0100
Message-Id: <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
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
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
In-Reply-To: <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: f17903e0-1212-4172-63a7-08df02a0a14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BOqPow6YOyKidWqxwqaFkuHugYtlqA+mEHOQFWuoYl3NI9zI2Qb32mf0yo9z7c7UAKH5wIOlXJYXxJ+eI2rW142E5I+NvBZtLonayYetHCPUaNzpAMPwGR/OrM9gwFbTKQpxOWxGDTd8mr9aGVK2GNYRMpmDB4vB12F4FS/n8nW7K4YVh/aeOHSpYmE8g+gwxD2qck6YtwbQYn+f0kCDxLbv0pHBOzcHjykCutfHimZphfxFdp5dQUo16ox0bX8z2fvWZnm0+po3UhkYX8OW3jwaQ4ruOqjNMUV2+aaS0W6fGpxfHOQ1hJ8goJPa9IPnGimTgJ28+JpxyyEcmn+6VOfjyIjYoD89ajYwDnxDP3a+lVhS4Oc21PPfGrQm6oKzOlD3flD8Aeh2GTriS0N/RtNAv1SQYlovxgD8syR7zRFdgTMfu36OhgpsHZzTdWjpcVVj4QK6yA7XbTQSG4Dl+TznfBjsJ63HnbnmNhhEARDoUvIq7ec8XUkIOtLnplwqFGUNsxDhb7g2xRRbDQ7KijOkrn3Sx1vM2G2OcVPfq4n4YtTD+SRlsjFQUt3kmq7Hyn1TF4tZGLgPDBQ+zWiSOR5kCLBRwAY7D3GeYoLqiQfUwFJR3CiJhupbyhmrMJO6bjJWlUN4yruPfKUFm3Bj3Bs7CSh2jQr3GTUIfhvfCzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0ZqcTdCQlNJaXZmTC9FV01uZFl0RFFKSEZvNjZLV3lCaG15a2NFcDJPc0tF?=
 =?utf-8?B?V0ZsZmV6YmJmUnlLdXM4STZvUVZhL2F2RnNqTjNDbkJjNDNpTTZyd0JRNVhE?=
 =?utf-8?B?N25NbHhvZmdCTmlBMWNIbm5IYTdZVnFFVFFheTEvK3pHSGF1aVZMVmlXUm12?=
 =?utf-8?B?NUt6TnZwOGVPVGFBRHZ3T25wc01WeGtQd3YvdXQ4WkhFS2hYbDMyQ2tiUExX?=
 =?utf-8?B?VmtNWEdzc0M1dlNlbEZFR2JoU2hlQTR2Yk1TZ3ZDK1hFQzFIc2Jhd3BXN00z?=
 =?utf-8?B?c25GeHZDb2RkZzlBREdnUEE4Y0xPaVRVa0xXK1lDVXpqN0N4eW9vT0Jtam5y?=
 =?utf-8?B?N3d6TFZlYVdIZlpsOWZ2TTlzeDRVc1ltMm5ySXM1YUZzbjBNYm8wK3FUVDVa?=
 =?utf-8?B?d1NrMG1qam5rRS9QWGFDRDd4TUlrdDZTUkxlNlVQNk51aHdTR0NwWDRoQUxL?=
 =?utf-8?B?bGVFZldOdkwwdm5MejQ3YnBLK1NKQmdFNitZU2gybVlRV1A5UkRGNTdyMGx0?=
 =?utf-8?B?ZDJMM1JseTVCdTIrbzVQRWlwZTlWTHNpV1Awc09odlptc3lUcE1mQXNVbW85?=
 =?utf-8?B?VGZwaGcvYzJrQmxOMkdON21oYThQQlg4RlZQcGxVZjZ2YWpFMy9pYncxeDBh?=
 =?utf-8?B?YWlXZDVPcmlncS9YZmFmbWRDdVRpS3hyeTNmWkhMbVI3MUZrUkhBbzlNN3dz?=
 =?utf-8?B?dXRnT0c0bUorTEpJdTNHQS9GdlFKdm8wRGJDeVlxK2hkcXJIRDRpbWxPdGJh?=
 =?utf-8?B?bGhydFVmSDJHUVMxQ2c3TG1qSXIxL0FJb3pyTmFHTUo4eFREdlB2dTFDVjFH?=
 =?utf-8?B?V0FqM0NBRE9UeUVmL215Z25jaGFCVXA5ZWQ2T2Q5RDFQN2xVeEZlcDY3L0pJ?=
 =?utf-8?B?NTZiWG45cjAzcHV3OGxVODZ5d0JsSHZLS1VFRFo3MkN2Vkp1S2FIb3pEMmJH?=
 =?utf-8?B?WCtzUVNVd1JKNHQyOHBvOFczU3B0VXQ0NEs2QWl6anNHQktUbnRhKzJTUWVV?=
 =?utf-8?B?NGdGUU1zSXA3Wm5Kd0haZWlxc3NCWk5iSVhzaHlXY1IzdCtGeWFONXFCbmMz?=
 =?utf-8?B?anBlZkJQK0ZtMlU4OGUyOTlDTHhrc2NLNFo5Z2VzTTJzQWs1SjZZMTlxN09u?=
 =?utf-8?B?QTFZL2pzQTdKbEhEeWJhMnAzdDNCWEtQb0djamxGN0VJOTNOUzI4QXFlSkVj?=
 =?utf-8?B?MjFOT3pJS2dwWjJ5WXo3ZkdRRHZWMnByd3VFUWJBamdCNmd0NTI4am4ycjha?=
 =?utf-8?B?UmlyTTZTc0tkdGRMd1RJRUJmUGVwWVJzK3d3aHVUek8xbkNZcWNyTVI0clM5?=
 =?utf-8?B?cEJCL1d6ZlRVeFJ4NjZ1eE9lbXRkaXkrbTJJRDdrMStlWFF6WC9YYXN2WkVQ?=
 =?utf-8?B?TTJ4UHllc2RubEFYSWQ3OUxNVjVMdEh3bWwwTUpwYU56TnFackpMK3dNWGZU?=
 =?utf-8?B?TmJ6TkpXYktjQWFYUW1YbFVDYXJmNUpFV1dQM3QzOEx6cWowTWhma2l0M0hq?=
 =?utf-8?B?WHlJOS80SFdkcENtcXkyVUtRd3NUWGFuSXlBU2VEOVZERWRpV1M3K1dIZSt5?=
 =?utf-8?B?UUJaeldmcVNTdDRQM3p6MWFXTzB3S3VWZWNwdi8xTFBNbVRLQkhZcWtibUR0?=
 =?utf-8?B?cjhWakhjSEJ1VXNTTEJycW1jdUlhTzJtS3RPSmtlVEhhMlRVQzgvcm5qMUk3?=
 =?utf-8?B?YWZ5bHp2OEJZS3lMTXJCWnBTSjBrL2VpTWJuQlRQQ1NTaE9TRjNwUnRtaVov?=
 =?utf-8?B?MVI0ZTVhbTIzdU4yeDE1T3kxTjBrUFdSeVFhN2dkTWR2MVVWSXJRa3hKQ2hp?=
 =?utf-8?B?ZmRHZEZVVmRYaTlWVnpjQTlqTkgvNUc4RGwydXlBbmt3WHhBZkdQWm1La2Vw?=
 =?utf-8?B?ams5N1hsM0l6VjZWR1d0d3VFanJUWnVKZFBZeHR0YkpWMzBvM2x4c3hZMXp1?=
 =?utf-8?B?dHd6OFNHTDRLWVV5WVU3elVYQXNqdFBjSldGY0trQ3VOTGlFdWtvTDVzOEJQ?=
 =?utf-8?B?NDA3cUFVYUlrTkZIandGcHFWMC9sVXJrYkFyUTdLTlJ4T0RLOVlpekhGalZp?=
 =?utf-8?B?VVRKcFJ4RlRmUlpLc2xpVTA2OE5IdU5DbGZDZVJLT09DNzdYNGxiKzlFZUxU?=
 =?utf-8?B?RzdnWW1JS2JhTitxSHNLVTdTVGN6MU1LWDkrRTNDV1ZiRndlY2phRjZrNkNE?=
 =?utf-8?B?b3llSVpvMzl0cWRnUFd5OHc3RTlYWXlaVWRUd25abnY4RjdiNXd1ekJaN21G?=
 =?utf-8?B?Ti9GOTBzNVB3Q1RTL0FTOXVmT2NrVSthbFhUbE12U01IS3padW13RzZXZXph?=
 =?utf-8?B?UTZMYm9JR0RkRVgyczlPRDgvWndmY3FOYThzN2E2L2JyS0dlN3Zidz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f17903e0-1212-4172-63a7-08df02a0a14c
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:01:43.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPs/iPZxvzZO/h/bYXAcCoT3gCY+Il4lH10G5uSqWIs8kS1LMezVASS1QBcv/FDwUs3123JPuYd+85hVTA7pBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8764

On Tue Aug 25, 2026 at 9:25 AM BST, Miguel Ojeda wrote:
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
>
> The former line above is not perfect by any means, but it is
> nevertheless syntax that one needs to already know. Personally
> speaking, I don't care if I have to write the former or the latter, to
> be honest, so I am OK with both ways. But I worked with C++ TMP in the
> past, so my eyes may be desensitized. :)

What I have issue with is to have things that do not belong to the type sys=
tem
in const generics. Expressive power is really limited in it, so any
expressions involving generic parameter, for example, won't be usable insid=
e the
turbofish. It also doesn't work for custom types, so the approach does not
generalize.

The type/value distinction is one of the biggest change I made to `const {}=
`
implementation, many features of `const {}` is possible (e.g. reference to
generic parameter freely) precisely because values don't flow to the type
system.

Yes const_generic_exprs is being worked on and it'll blur the line between =
type
and values. But we're not there yet, and I think it still worth having a cl=
ear
distinction and we don't put things that don't need to be in the type syste=
m
there.

>
> Apart from readability concerns, we are saving here a few characters;
> getting possibly different codegen (forced textual inline), and maybe
> having better or worse compiler-side time/memory/disk numbers. Is that
> about it? It would be good to measure any actual difference.

The macros are much better than functions in my opinion, because it compose=
 well
with the type system. The all "foo_as_bar" methods also compose poorly with=
 type
alias, where this macro doesn't have that issue. Also, values no longer end=
 up
in the type system to begin with.

>
> What I wouldn't want is a raw `as`, because the point of the saga we
> started a long time ago is to introduce better tools that allow us to
> get rid of the almighty `as` into weaker (i.e. safer) options, even if
> some uses of `as` may be "obviously right".

I think that is rather a linting issue, not something that warrants extra c=
ode
in kernel. We have been requesting some extra clippy features and I think t=
hat
is the correct way to go, not add a ton of methods and macros. Yes, it wasn=
't
moving on clippy end, but I could add a feature to klint instead?

Do you think we still need all these extra function and macros if we
can get clippy (or klint) to enforce CAST comments?

I can imagine the following rules that would practically solve all the foot=
gun
of `as` numerical casts without having to use awkward syntax:

* widening casts are allowed
* narrowing casts is disallowed unless CAST comment exists, except where it=
s
  value is constant and truncation does not happen.

Best,
Gary
