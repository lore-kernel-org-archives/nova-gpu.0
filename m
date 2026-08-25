Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021101.outbound.protection.outlook.com [52.101.95.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596923D6473
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659485; cv=fail; b=AesQgXAw5m2N8xkAM8LrFVrrvV5zCOoULfw5/AGkTv6NHay7gCw8RS83fNfMlDyEuM+4dmSve6pvVol+YIgBEsMptilznnPS7H7H2y1VHLwIAoua+nWUyEXPdzYHsZS9x0aaHX/usrKApLa7wSheotBDWAhHBEGkbIIQHAx95qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659485; c=relaxed/simple;
	bh=yKPtsEfFeimj1HOps+07Zq/8iEXCVVV+7VtMBCNVmfI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=i6m4vRLlzKgy+CAQ7350ZyfhoL/I1pWBi3SC2CVt2ilnmaoYx60qymbx9NwUWw0UXn3RWSU/3t70kggI5ZEMgCUzSDtYi/tnz4d/jjkeDiba3GbS7+bCOPzhAHl2AAupGj/faJ6P5meliWRvoqVsDHEGJEhyYShHEpmdD80WSIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PWbEPWlY; arc=fail smtp.client-ip=52.101.95.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PWbEPWlY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncWW7y/nqXDr1SBPkdqEU422Md/d+ccPgzChlJBbLUV4elJvbpMYHEhFwP6oR+jQ/SupgLlIjj4gij2V8RjS9MnMoguxA68ttYwB+dGQ4XQTfQrLv9zpsUTgdap8lAAimAjPXiWNzyFsfLg4d6p5omhIkNb/A2vqQLZv14nmbUz+p+w9xK6i3itaFNL0i2JlRGQO/64Cb1UAZay0OkFPO4JKpR0UKxYYQaJR3436GbsDivwKoOTmyAkXk7vVrIZ43vmIbhxIS/Phu9wsanCTz6+H4hJkl5HPrwQmY60lA1gtfsaptCmU8J8FCuEzBoatTJwwZGqFAifprm33X0ZMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOuV3vSm2X7P5OA/826l6VB1bn7VuOkNptMh6oU4xfI=;
 b=ltJFQWrrBFA7v4lg3WCiAWhpbVj00SQTO0GWhRLdGJuVvZT3hoE73ChwgDFtClMBfKdMCaI4ClDYZtV9U3NJYm93FpnECSkjco+fQSKsLDKt8l/LD/fJNYZ9oeMJr3lsfxcH7g9Eup2s2n6nWLME1Dl0BbhXC/VngxwXGvsKIRudF5E7xMtgSRYsFg1MehFxNaLUsWKp3J2nHVO7Y+uPCPsHEJbLheUaj03Qx86T7VfxZMGRDYCFMVM1rX4s9V6ztIHxjznCVif+IahJYLxv/+ZOyiInfmeEsVYKg0q7Y4EMhVOoOjNijxgcbZdVMZGfIHvxbqmiWIVk3k1eRPQe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOuV3vSm2X7P5OA/826l6VB1bn7VuOkNptMh6oU4xfI=;
 b=PWbEPWlY2dUtlOkuygsMDyz+JT+WOwR02un3FufXkbAuxEV96NFbFcvmbZ9053YP4pkDgoZ9b7Pm4Ms5de2M4rqMa9Asmwnl7YRKbfcCrh1rd9pczLiet3Z16rX2ciweuKg80WBGrAPLvQhJ85yoF1aXx5+gUxYlpDXpa1GTpDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB3540.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 12:04:39 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 12:04:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 13:04:38 +0100
Message-Id: <DKY0EB8KAJDY.2EEBBMI5N6YA7@garyguo.net>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB3540:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4c3691-ab8c-4305-a5f5-08df02a10a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	VOlWAhtwrz2BGtFxC8wMXpDs7q9nJL/g+KpNLDjpTdEOOjygANt8dBeFj5Iz40CB93HT9BQdXWEmxviRO3LW4hTXtnFm+P1FkEmANTX2Ytyc+L3k/5dfH1j8o4fPTVfIjy9qEWM0ptMtl3MgKUvI14oj08EDAhbUBGHBuqU4PWVuGQhxWpH+5VeZUvIHl4d1lZBtWa6xiim6NoBryLEnXynhLCkB8w4VxCBY1+8mbIM7k1whn2sBzNQ4T9N+JIPQmaeHrtqXZGkuzCuSfz8Yjfu7Qdk6it1MiWzuG/ISHtAf3bPcVOX1nVvVFgPDTIAgcCi/37rKEo4qYTiHreyLqZGmyNblAgE+iOCyzKLn/5MKrfBQXuhjmMqp3/ftYpazZZ+7LZROE3orOVK5izs/rMKB5SoQegUVA4oyIt9oJ8oykyw6bsmD7FDtg9jbZw5vOgCW/parKfTh+HF6Oymnclkk8OVErOGcTCes4M4XsdkF5y8wR7JoE6aC/DWgiIU8QZBt37F4C7RLpgJ2dlC3vmfXkVH8gh1E4JXJ89z4eZkDe/dFnj7ySOWsueN+TeWWxtc8985Rmrp/ecNpGI70r9fr8mJqP8eS9VF23bpmtGq4B/bU+Uw3/LVARkGhS37qXrUZjV4lP6OfHSAQ/s5XYNhl8cxT6njEUpMnv9twryGr0iaV/e0+Oc8ui8nnZntusS8avVcAS7i1V6sFdqWXFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9kSjJOaW96UU9aZ3NUNitVOXo2NGNjaFVzdmNwODZWNHpqR0xaYU1DYVFv?=
 =?utf-8?B?L1gzd3hrVmFodkczaHRRcEtidlJUbGJhc2Rza1k1V0ZxaDVZVTNoSU1kZ2Ev?=
 =?utf-8?B?eU5rdEtxZG04emt6cGNZSUNjdG1SMjcxcWVSUXhvTmd6STMvbjFueWNjK012?=
 =?utf-8?B?UFowQllGb2REdzd2ZjgxWnYzVUd3aEIxNjc3ejk0MzY3dUN3UXdjZ0o3cDM3?=
 =?utf-8?B?NVdIWVlDUUZZSVU1L0d3NEhLMWUyYWhZZ1hJdzdaVXlvK3NSRWQvL1VHa3RX?=
 =?utf-8?B?VmNCd3c0UnN4Q21RV1VVTDRzdk1Obk9QKzdDcXZiN1FxbHNYWnIzblI5S3g2?=
 =?utf-8?B?VlZybUtBTUZTYVFFelZMRWRCeTdwcTI5WC9KcVBxQ3U2R0lVS25VS3pjbUMv?=
 =?utf-8?B?VVQ5dHY5S3FHWXM3THU2eUx1WHg4RVF1U25PbVkrcGxlcGRhV1J4OXNWT3Nh?=
 =?utf-8?B?Sk5hSlNTS0lyL3dQNjJrOHN6TVdJcW5GVlA5VmxXMEgzdWJxdHBjbGlJUmxX?=
 =?utf-8?B?YkxQczBHUEgwRUF6UWdSc1BPTkZTUy9QYjBlc25qZ1ZEMDFGS0diNEt4eU1C?=
 =?utf-8?B?Q2tRVDI4UTZUdVBZanJWeVVZL3JkdUQ0WC94N3J0c1V5blE2UUVCT0UwNjVC?=
 =?utf-8?B?Uzk4UGRneWVDd3phUUg1V3dkQ0UxWDR0ekZoVEtNalVTTDZHS2dsRURSN25H?=
 =?utf-8?B?K3JVWlp6K2V2N1Fvb0NLYjZsL0FzWS9FUGhnbGUwWkI5VTRRTWcvdUUvNDRS?=
 =?utf-8?B?czNFQkYyNjlvTVNrbU9ya1U2Qlh6azNJYUZPeGcyUVdIc3NDL2dYS3plVFZT?=
 =?utf-8?B?aTV6aHF1eGRTOEF5UnBkVGFLVFNUWDl2RkMvcEZ5RW51YjhjZGJOTEZQUWlz?=
 =?utf-8?B?VG9LQ1dJZi8xV3ZrRTBEV2JWSkVnSXR1U1JNdEV6WER0MGFEbG1jZmkxdnRR?=
 =?utf-8?B?NDJrQmp4RWVUVW5vQndNNTdVUXZjNFlrQk5vRzNCMExpZ3lCcWxLNlk0bzdR?=
 =?utf-8?B?M3ArNVBXSjR2cVgvVU1kQ0dpUEJXRnlkcDkyMHo2NFB5OEMwV0owS0ozcEEw?=
 =?utf-8?B?WUlhTXJnbThYbitiWHdPYXhUQlNpUU04c2p3R2ZHc1NsNlo3V2Rkc09Gbld5?=
 =?utf-8?B?RDRleTlMNnkzZmdRUU1xS2l6Zm9HamNmZE9JOWJIa3FGOHdUMW5ycWJBTmxL?=
 =?utf-8?B?anJrd0JEUkE1NC90cll5RnJOanFKczNpL01KSWZqb1ZuS3cxSGpzN0k5d2Rn?=
 =?utf-8?B?K2NlbWV1bjVqWXdiQ05lREJSZE9FTWJFb2JzRFlmOHpES3ZjWDd5aUNXaVcv?=
 =?utf-8?B?d05VbDhYMXpmdzYxb2xOeGk1T1ZJNnVjL3lPb1NTVThhWDJSTS91Rzd0aHdv?=
 =?utf-8?B?eklUN0dFdWxsWm5JSWNCMHBnWjd5cVQ1OVFpRTd2OEYxbzhvbU5EcmdHWkZL?=
 =?utf-8?B?YTFkd2loMjdFUStqR1JEQ015dThCVW9IcUtRYXlTL1pXVnJLTWtEWmlHQmIz?=
 =?utf-8?B?dE5RblpYV05yck1udnhTdlYvTVdmelV3NWNHZFI3d2FPVUdHbHNoM0wwNkcy?=
 =?utf-8?B?cTBia2dzUHNyajRwRFllaHo3K1dDOU9BK3JuTFlJa3J2bzloekVmaXlzNFUv?=
 =?utf-8?B?TWtTZWpXRmwyOGFVdEk1dldWK0I5NGJ6Wlo3Szk4WEhGcTJoUHBWSHAySC8w?=
 =?utf-8?B?ZGR4RE0vSUorbmhuZnBWRjZ4cFEyOWVEQllJR0hiWDZCQiszK2NBai84VnNW?=
 =?utf-8?B?R21XQUJlZDFLaHQzTkgzN0ExdC9YN2hIWVhQemg2eE45NVY2dm5BRW9GMW0x?=
 =?utf-8?B?RmxZSHlHVW56T2VyNHpzcDR4ODJXWWxFVjhYYi84UWNoZmQ1am5WakFKeFJZ?=
 =?utf-8?B?Y2FaeGVZRGxoNFBJR2ltZFQweEFMMGkyWmFtVXQxU3pwMDZnRzFnb1RDazg5?=
 =?utf-8?B?ZFpLc21sVFZMNHIvNFRUY0pFamlTbkkwMVpjdDRlTjE5VTlMajFEU1pzZnFC?=
 =?utf-8?B?NzRVcTJoNWFJaWxGYVVBVGhwOHNoRE9LWDRhZ01CRzdVVjNmekVzaUhXN3Jn?=
 =?utf-8?B?cmVnZ3h4WGUranNMSmkyMXVyeTdUcklvUXp1SGc3Z0UxZUgvOHlCaEppTkVI?=
 =?utf-8?B?ODlLNWF4dlhhbVAzS3A0S0FySXZRNFBUTEllQW40TlNVYWszUWhZei80UUdn?=
 =?utf-8?B?WXdhbHhHTzJydnFnYmd5MktaM2d4WXE2VTg2UlNmeFkzRXNmM05wV1haVlBL?=
 =?utf-8?B?UW9hUG1TNjVDUDc4ZE42cmtrMkJjZURkUXZkUXRhUWx4UXBsei9RN0NDSnVl?=
 =?utf-8?B?cC9SODQ0VE80MTl3Z3dqeVErdit1RU9jOXEwR3k5NDA1RUdiOHEwQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c3691-ab8c-4305-a5f5-08df02a10a55
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:04:39.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/Vm7xq7M0rRMbexgyXjeA/pmt8L8ousw2FE0X6KAvrSSSUx2efXNJSpvIkkFtYp/F0p3OUhpApX5ChuNcil/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3540

On Tue Aug 25, 2026 at 3:44 AM BST, Alexandre Courbot wrote:
> The casts module features a series of const converters (e.g.
> `u32_into_u16`) that narrow the type of a const expression provided that
> its value can be proven to fit into the destination type at
> compile-time.
>
> These functions are numerous (9 of them), generated by a macro and thus
> not easily discoverable, and cumbersome to use as they require a
> turbofish and const expression between `{` and `}` braces.
>
> Replace them all by a single `const_as!` macro that expands to a const
> block verifying the lossless nature of the conversion at compile-time.
> This turns e.g.:
>
>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT =
}>();
>
> into
>
>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32)=
;
>
> This makes things easier to read and understand, while shifting the
> burden of checking the conversion's validity from reviewers (via a CAST
> comment) to the compiler.

Thanks, I like this much better than the methods (for reasons that I explai=
ned
in my reply to Miguel), and also that this looks nicer.

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/casts.rs | 129 +++++++++++++++++++++++++++++------------=
------
>  1 file changed, 79 insertions(+), 50 deletions(-)

