Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022112.outbound.protection.outlook.com [52.101.101.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E238B7DC
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667075; cv=fail; b=Fv/o3u3t+uCqUxMpSuaf8sc2EqVYKX2HJmqCS6/vjY9qr8Q+TbfZFwfgKqFF6AQmbGmEuEyxpAGAYvoEpQd1qxijO/1wYbBpRkrahsA2El8SX0vTJVb1+4SiSEqM+/XKBAaogBnwrQAJ4VDD4Z4iWXVFr4d0edVvhXJaIolFW8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667075; c=relaxed/simple;
	bh=fByf89+GgAxDPMEg9q2uFIuExCr49TEIA6jcZV9lHbw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tT58qtkRO2nrBAEYDbpV8N5sb7OiyN/EvOGXQ6WNoM+5kAlcSf+ooKR987/0xNa50TOO2KEray2G7na1QrJdLBXeST8tGgOegvI2ij6NJxOELKrH221L3azYxjX1Mv7dLoWK1TpJK/y6ombmYu2WdhLD8rfgChbVq1qymV6+nG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=i6i4vP16; arc=fail smtp.client-ip=52.101.101.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="i6i4vP16"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIFpxZW5lQFLXqQljsi8r+m3cUklDz9oY9xRu2Jk0Uo3JvT+RKCGw07s+xvRaEGCwz003kv66j9FMxGfHAhEuM6rM0ikZBMqesAm9pMIx8XBaFL6ob0wOiINO7hbfquqzBfvBSrXJe0qtel2+jD8xIvs35S9+ae6XkoMcN4H/9nPZpXJ2f+Nvha7PV7VKH4W/6+B/+AfC0cPsq5Gk63jajZp1XBxsKrIsuUj0D02qOw2UDqMyl/+At4rU2qz+CMzX3+JG2TTBaoCzSnHSsiHCUvrJ6PjWhm0rekzHqriNqxh5LXV6bok6RV8RYOJJmnqxvA3nA4PZ4pT4zc3n0wtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmXFxXBlMxutNyQZu7OSDjFVsrNvyvvRbAJq8T0gvxc=;
 b=iSbnxbiUJMtSQK5n70ZJ85cqVICT46QzuzDgwgcGRH6/F0whm9LQCjVKOILzEBZcXuv3oKKXkUbPEI8Q6+ETSNLSuF/7LqJfYkd+j45qO/aikBQOixoQazuWqTqEMYCrmidDdOstVqK3+cAulJOgMB5C0K7X49V5kzNRTI7WcCZMWv5bOZ64mquRJ0xCG+xjSv2IYbu/RSTZEwkMsOHk2M8yrcArvvuimC58M8S5ND1BFsbPi9auY/4Ala5VnknpTOSprX+kEtVbRgsCy9+DyWVxfitcjY8PMisgR7S2QXvC905o/DH/t102jqMybY/6LfqFgZK67aGf4J1XDcOTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmXFxXBlMxutNyQZu7OSDjFVsrNvyvvRbAJq8T0gvxc=;
 b=i6i4vP16RssDG/YGwIJhjtwZnRM7P6lQ5w5XOX3S5a1Xi6y4fkqxsivuUKAVWRdTcY3TPUcejdDc6jWk9zLvk7VtVWumcRwnJCezvpcJjdb7XK/HmDxplEseYI0I6Jx/P2GBtaMBbgiaaxHqTTGjOj1jThCZbAyLwjauXPEkLe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOAP265MB8984.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:498::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:11:10 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:11:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:11:09 +0100
Message-Id: <DKY336B3OAQC.S7Y5DXYTW3HG@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
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
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY2WHYIIWOH.ATST6NOVK1PI@kernel.org>
In-Reply-To: <DKY2WHYIIWOH.ATST6NOVK1PI@kernel.org>
X-ClientProxiedBy: LO4P123CA0664.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOAP265MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0fde76-0e09-42ea-9016-08df02b2b6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|23010399003|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	VEPlcsuD8SEblVfkQ7XqgOgtopvNGbf5Xa6e/3RmNhb3KyoJAFOHad1FCQeBDvDzL4X+7BIcJVhNhBGJNDqJU4eUDgiXKD4oNqJd5sW/yzxQnUXn4ulB+BiudFwZeHv15z4ooyOtcSeEy9VZzEu825Nx0lPtSxRXMRPdi0HOMR4vtwMEHYyjkP6uzr34xYOJixi3rLOHdDHlyYVwnM05fGZFEvmuBvlWGPBiMqO2trixyEj/tNVHIvQMO3N28V8JRDVoflLVPzCzEWwGMikeQcHG0rkDuNWitFL1629ihfTjnwUVCvN16/DmwCitSiNuocHmBfxI6+2bJz0R92fMzHPD6A9rhB48g+D8jEn+FhaJksxrPe1wuyP1b83VGzFkX366t4UuRQYrNZkOKSlaa9j7ZwMD7lzZ69BOXAcolEXycTjdGWEpgWcXpFt59GvKryPJDAzDGH9pwTPfAmHggMzCLMuhXvVuKFVwKeOk3tm0FS7hdJ65hkh7CzBCmkthd08zVQ+oTk+Cf/xux7oBa+ACgZ7z3s1717ApAneM4GY+MlXFOuJDpb1onaZO5shLLtwK/TZt7N1Aqsf0UWyq/hGC2sJ9LWgHQ2xfc5TiczPNYNp7OBRoWVOaX2FtzVjUH4wMh3yty17vNy9Eu4qkKluuiJjgQM9SusnequReDvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUVTQkxsdS9Dd0hEK3EvdHpLakFTbVVxVUZUV01CYkp3NitjYStxRnZDTDNO?=
 =?utf-8?B?K1h5aHhFOUJSTHg5dUdPcDlGenBNZzZHamNBaXF2N0xtdjVIRVE5akN6Z0U1?=
 =?utf-8?B?M1pjbmxHWksyalpUWUYwYUdyYUs2YnJFZFhPUVFvbE8xcW1KV2FYRDhFSHNk?=
 =?utf-8?B?Zjh5ZklaZEx6SkIzM3IzMXZOcWFjK3EwYUl0Q0hMNnkrdGg4bGNubHZUWk4r?=
 =?utf-8?B?ZnhYR0xmSHB2RkFpWkNNM0I0UzVwOWllL3dqY1RUVFR1WnlodHBKMmFpY3hX?=
 =?utf-8?B?ZmlIWFZRWFR5bHdESS9oSE54RCtCQzIzUmNDUWdmZ3JMSi9td0JVRmU4UStQ?=
 =?utf-8?B?S2k4SW9VYkNvZHFnbVV5ckZ0bEJzdkF4cXJ5QUFScE9QUWJzYVNDblpTSmNH?=
 =?utf-8?B?M3Fjc2dLMWZMM1dzY2VZdFJFTk9Qa0lXNDc4UG1nVk0yQTM4RThIZ1plcHBn?=
 =?utf-8?B?OE1mZHdYQjd1RXRDUDJYejFJMnFndk9NUG1sWnI1VFd3clV6K3VQU1ZCZ2Vq?=
 =?utf-8?B?MmJZN2l1TFE5akUxMnJ4bUJNeHJDSDRrZ3lYNUxwdndMM2lPTk1TcmxxSXFq?=
 =?utf-8?B?M3ZJbmo1VHBlV3JkYnFrdkJxR09uSlY1Q2xZRDc5K2NRNFRERTIvNVA2ZGNX?=
 =?utf-8?B?WHNFeVNIaTJ5ZDVaS2JzUThIVEptOVRUK0NsR3h1dVdzeVJURTZVVHpMMzE2?=
 =?utf-8?B?TVZlK0M1TkNGeDBQSHBPZnl5aGxTcVJwemRxRmFxcDJ1SXR0ZGd3YzhpcFRM?=
 =?utf-8?B?bk9UWG96SU8wZks3dlptSHpNWkVqVlJtTXUrcGxIZGhYRTY0MG12elJNMFFV?=
 =?utf-8?B?T0tzTDJhRTc1bFZaMHc5aXVtM21TNmdHZnNrTUplQllDaENvYkpYS0FkNGNt?=
 =?utf-8?B?OS9NZjRpSDV0R2pSMzAvcitPeVZXdnhMR1NxTkpuOFZsdE9kRTFuNUsyZlUx?=
 =?utf-8?B?bEpKNzJkUVB3eEhWTE56SDRRQjBEZ3RuNjVNYXBGVmRlWG40V05peEVFSnBL?=
 =?utf-8?B?UFlPaTdFbEJiVUhCVnc5a3hZY1JtUmNLUGxvWU9pV2hXSmc2aVhMK21ZSUE0?=
 =?utf-8?B?TVRvS01hSThtNnlzMmh1d055UUVzVUxLU3FvYk14VG5vNThsSm5Xd2VZU2h3?=
 =?utf-8?B?OTNGUld4RFJ6c1hOcGxybWFidmJTbkdYamhaTkdNaXliS0hGQjhML2g0bW5S?=
 =?utf-8?B?YjZIS3BFV0dndG9Fd1RiT05saGU3NXcrRnJNS21CWmQ2L2pybEo5QS9YZ1Ro?=
 =?utf-8?B?Mmp2ZWQ0aTZOZXkwWEh5cXd4OFE1NEdNS2NFMnBwLzlpZU82OFQvcVRWQmdN?=
 =?utf-8?B?WU9rMVZ5UXhUVUhZQVBSQTFHT3ZUdHBWVDNjcE9BcThqNEZycXdxVHRqcFZo?=
 =?utf-8?B?RXNWQU9CbS9xcHNTcjVpMEpneG10WkR5dEQ4TldiMldyUC9lRkRIbWN4SGNv?=
 =?utf-8?B?MlM5V0liR2UwWDZzbldpb21XSW1oVVB5MzJLdTRERm9URGo4dTJ2ME9CV2tl?=
 =?utf-8?B?MUhZbi9QQW8vcXlRYVVCZUYyaldTSnNQSmJ5QzFXTEJoOFRoMUVIUWpubTJw?=
 =?utf-8?B?WTFrVzVsZzl3TlBrM0U2aFM1RGdUVVpLdEY4TXpRSDlHREQ2b2xjeWY5b1Nn?=
 =?utf-8?B?UnNYZFhMYm85VktDaGNybitTOWZGaS84V0tIa3VEY0FzRkpNekNNT0dQdXBp?=
 =?utf-8?B?aEJQV3dQMVBZZnM4VUQvYk8vUDRrZUFhUGtSSFMzUGxWRC95bGx5MmFlS0lZ?=
 =?utf-8?B?akRBR2NVWFFaVWJCdE9CVmFmOC9yZUNBYXpnWjZVblV0R3NkODRiUnRQcUkz?=
 =?utf-8?B?SG9mRVk5UmJxaVNHN2thYVZ4TDlrdE9KWm96K3ZYYXd4QnVwbExhTU81T1JE?=
 =?utf-8?B?c0FFRFVYWmdLYktVVGFlZW5sNzZUNEM3RFFabXYxdTV4NmEvRDFZZThwb1Jy?=
 =?utf-8?B?L3gzNVNIendNRSt4WEdmQm5NOHAvT3VRYVkrbTdlbGR2alVJQ1RUUFRmL2ZI?=
 =?utf-8?B?WUh3THpJaWRDZGxoeDJ5c2VWMEpSZVgydERqVGdPWVlPQWVFcmgxeXNmNWtF?=
 =?utf-8?B?K0VmWXRnZzNPeHVOYUwvRktvWjNpU2p0THY4ZzVXYzg5b0RRV1NaOUxSVXpP?=
 =?utf-8?B?bURaa2EvNzduUEtzZFVIblV4OVJDb09TUERORzhpd3F4bWVzWmhUZkMvK29p?=
 =?utf-8?B?clIxa3RtUEQzamM2Y1FDQ2NGVXRibk5SbGZmMjVKenBqK0RHYVhOYmVyQ0RF?=
 =?utf-8?B?UWQ3elZWVkJLbjh2bkl1eWhYNXN5b0J1SDE2N1RSVEN0OVV2OXJTM0JBVTJ1?=
 =?utf-8?B?cEJsaHJxTTNudjlYZjNvM2pTYzdSQmZ3OThIeGtVQ3ZjMEl5emNXUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0fde76-0e09-42ea-9016-08df02b2b6a3
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:11:10.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCi6HBNWkCWBEl73xWNUvb1GcRyJDdOPxEt9rvXZAuPIGAu2wSPIdorJBtQ2YKQ9AWx0tkvyfoplqHpG1pXF+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8984

On Tue Aug 25, 2026 at 3:02 PM BST, Danilo Krummrich wrote:
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

It's easier to evolve with macros. Once we have const trait, the cast becom=
es

    const { from_expr.try_into().unwrap() }

or

    const { TargetType::try_from(from_expr).unwrap() }

which we can just change the macro to expand to.

That said, whether we want raw

    const { u32::try_from(MEM_BLOCK_ALIGNMENT).unwrap() }

vs

    const_as!(MEM_BLOCK_ALIGNMENT =3D> u32)

is a different question. We probably can have a `const_try!()` macro that
unwraps both `Option` and `Result` in const eval so write

    const_try!(u32::try_from(MEM_BLOCK_ALIGNMENT))

or

    const_try!(MEM_BLOCK_ALIGNMENT.try_into())

Regardless, the "ultimate state" is not going to be turbofish and would tak=
e a
form of expression syntax wrapped in const block.

Best,
Gary

