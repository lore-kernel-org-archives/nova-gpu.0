Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794225512;
	b=BzSRnF+t9hr6KGZqbdeZPaXIjbw+6vU6xNVAIiY6tanhB5CJAAMbiGyBzXvO75iTyyBJ
	 PK4yLfCCnu3jk69n55NOfUeIDzEd0uNIAi9oh6/tGUcCVyiGnGT/40/9yLW8rWVylgv35
	 zw3hy5aL3y+s6P6/wjk7xYsIDhyhzspZAyHsnsy2hi+6bwcCOEe07Kxr3c/UpWSP1GbgO
	 ZRwjFBLdfqPxrUdLrT3F1Uzp2Fg9nnqzsiD9Tgf37qeBx64tfK7IFpslHkxokB6Wm+CqK
	 HnpLgrTROvuDyZzO8fHYNblc3PmdpNuIvB0XabjGSvnDX+ePGUfCfqfJdMT2EVdHiGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225512;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RGvJs1C//6pJGZw1dOq0FsYnJatOX5vyS63LZ1C6llk=;
	b=MskGTTAylLGEbsN5L3bXomoM4+fgega4tgV5JX9sNsOrGL9KCH7+9eJj07UoVis1oMaY
	 43HhrFDUO+GNDrJoJ6nqh26fkW+LzRZwyYybJ2RIxKGICwBWhIv6bs3RBDEDpmPQZBUqq
	 peolxUzXmf7uXWOSu6KOny/EedWbVFlLr6sLlLaePNfFYDyfnyu9bCU21SF2IbuzRRkwx
	 OWMOIv1vIw1YT4OMP4zQOEM00j9T6Df3n52m0oYClWEaniMsPfZ7r+wqfZL7qMXjH0+9i
	 dnoXL8mh1ooZeTrkUk8num1crp0GtSij/1+GE6FWFJax/u7p0zzn7vSXlx1UDe0IcnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=GUqrbWWB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.142
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020142.outbound.protection.outlook.com [52.101.195.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B44606A321
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 11:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=GUqrbWWB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7pGRQQZS/BEZfCQMRcF4a9GIV8GaAdVP98C6SrDjm1I8e3aYkelRsDDyq7lSdIrIw9berAKEiWHLQcNBOf8svHUK6ihupo4U501rBJbxlzvKVAgS/+6Ok0aCI0XweFWNC/IFLiGvO9vaofnmhSewpvDwavZ6j2HmwwkLhAWDBgHxxyFg46w4mVA1VeNsdFr47ogINOLFO/9z6E10sssCuyY4RK7iwYhnbONHFvts+SlP+RJlSDsEYGoykuQrC4iamOOerHtBLk75XP9J7u/L+bKybz+Ce0O07wX6z8qBpBneyWmF3N+d+kvsDP54NMUHYkrBKBANaODeS7JUvkxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGvJs1C//6pJGZw1dOq0FsYnJatOX5vyS63LZ1C6llk=;
 b=KUM9cgJxr33G3x4Xi+AxWzpOAqhWhFy04nm9jexHS/RbHGnvzlZ8yBJidmlzAkaVR6pK2dMhmlSuSmCBBhKStr0cVSeKiubl6ccQL9U4/0P2hHIbop1hbFm1FrEE68XPME2XNHl1r+G2/LpqKoDKZfHalemNyGg76pcz8QFrFjMLWDZkuUsOwqkt+15tHJXKcrxlj2eCFh8qO+eeo1dJH0MiZXoc9qB4eWRH7Q7uph+VlDeeoplkTIZiHFDrQaHV2BEE5FkPY/Gte5uQSUfA9brLyEdxSbhNbWtqXzDk2SKuJu69EwCJIWrY/jZNKWbKZWVWAgh7R/nKZfH4O8ufOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGvJs1C//6pJGZw1dOq0FsYnJatOX5vyS63LZ1C6llk=;
 b=GUqrbWWBfrM9OQruBnYikluXR6XyfH9KBhEWthwZuIkrGQXRPbMByJHWIUpO+UjF7Z0yZDGj0BSFtp8WG9wjvcT30l3Obf5d9NK8LNfDcWcgZqpVMY2bEPTmL2k3CKznolwDP2i/QRcgtD5UkHrlJzM8lguJZ79DZ8oAiPSPZGU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO0P265MB3177.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 11:58:25 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 11:58:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:58:24 +0000
Message-Id: <DMQNUXRVZBH0.K64MBO0EMRD1@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v2 06/12] rust: io: register: implement Copy and Clone
 for RegisterArrayLoc
X-Mailer: aerc 0.22.0
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO0P265MB3177:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e83bd60-b0f6-4e83-1acc-08df3e58c2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10070799003|22082099003|18002099003|10067099003|56012099006|4143699003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SQCg3tCzEoOjLxVcQysjouNletV89SdaZNAZXH5zM9VB1HTnhZ9oTUU38NIQG1T0D2Y69gAKgniKpqAcDRqGAEi4Kh9I+z+1fZyWzL52wHovFhcTzkWWhn2YTYcLtc5Rq2jkdLvFctBe4w6vVJ59JMtVwsLkYNIElGJP4DUskSB1vH7WvYT1A+uV/RoAG5z3XuO0rwJI+Ta9obHOvXFOxzuObMnNTw4fdd6bbV57ty4xoireFIkSR0F1/SsmTkd9PV5y0KCmDFEQZMvejvthk3hsdlRSfbhnrlX/PZvTiuCUhy3p3o+86iBh24G1PgZRtSqwsH8pI94+uW9NnJl7tPVkBEdtzhooGLC1JBAfLiURQUWENJXXJNaOBLEL7/B6/W7YgpWlJz9rVA+Hd4lWdqKTTZZ2FzSWGKy8Y9YtzWNcY+7hEHFXjJLrndEdFYYOsZ/gdbQQ0ZnZULKlMyPWC7J2AmTiXo14JeimYhH7UUK5Naz7LdPyayP3tVX+2Mhh7nP1ibnF6oc8SOMLago0UA5mwgcAoTJoEB2OqX+JOUKPYm0JLRgK6wmw/VGFefq34xnWOgr7BydAB5GvO26LEvaU362LmyQyGqPyR12sK0KHITze4gSrXBE+7OKueWB00bk3LHuZtvxtIvhWWft8bZizdbJQQsiIQo2UC0IPNXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10070799003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2dTV29SVkZ6bWFyd0FuSmMyZi9hY3R0eVNlREJqN3BOejRrMjhGeUZyZ0dK?=
 =?utf-8?B?VXpvdVN6QUZRdTFjM042dE40ellpRTR2R25qbkFzSnVONHZ2cEZFWEJDeitm?=
 =?utf-8?B?dFJ1dzdHYTJBbEtqRTZKVkZVOXJVSlR0R3lMRGRZYk90MStDQVYvMWN3TUVJ?=
 =?utf-8?B?MzYzemRMa3lnRFkvTFU5L0E0SlFqQm90dm9zYVJsbk9halc5RG1GQ2NEVjFv?=
 =?utf-8?B?U2N1dDB2QjVaQTJDakZKcFhxa0s1KzE0S0l1em1kN3FsU0VydlpLanhBcHR5?=
 =?utf-8?B?aGNhdXRXL3hyalNuREpxY3ZveWhLK0xmbE9zMFpTR0xISWNFZVRYa0ozU0JJ?=
 =?utf-8?B?aHRLdDk3dEJOZEt4REx0V3hxc3JvS0R3b0ZZa0lUajdGL0RRMExvVjl2NW9X?=
 =?utf-8?B?NU16QXcvV3hIczkxU1NzSmsxbGQ4Z3hrSDFJU1RiUFJmRjUwN2VsOEFVbUF4?=
 =?utf-8?B?bEovNWxvYU9DZGZUN2IyRGNHUGxRb1ZmeG90emlKQ00xUEZ0aXFxOEl5NHFL?=
 =?utf-8?B?Vk5XVGZVa2JqZ1VVSUsrWVBscFNZRk81MTNCQWM0bTBoNS9Gc05BdTd2YTlv?=
 =?utf-8?B?bVFLT1gzZlN5SWJJWnVaUS9DOENydnNmVFZZTExhbmY4UWFmR0I1NzhYYkVz?=
 =?utf-8?B?VkwrK25XWkUwTGhFYmc2d0J2OEdUUk5NNlRDRi9KL3pxaitkMm5kV3FPTWJH?=
 =?utf-8?B?Rko3Vlo3WVVoZWtxbVVMVlQ3YXM0TVJxSEZEOWpkYmhHRTFLbmFoMklRdDB3?=
 =?utf-8?B?WEI1dTM1b0puZjUzb3IrTENRQTVTT2ZncjR2eDgzZ2lNU3FLcmNDcVRVZHZY?=
 =?utf-8?B?U1MvZVhGdWVwcFkyd1cxQWFOYkZ6V2VlaFVNdjNUOXF6M0trajkrNjYxKzNL?=
 =?utf-8?B?Qjk2SktnYjl5aEk2VEdwc1lOVHFEbENvK015UlREUnNHOTRLMkhiRjNCUVhk?=
 =?utf-8?B?OVZlS1hudW1QWVpFdTJiUk96WTZQdVZaSVR1c2tsc0V1K29iTS9ycko0akRT?=
 =?utf-8?B?eEJBKzRwZjRoMEFISHZzVnVwanZ5ZUFIdENuUWdIazJaMGN5TUpodFVDMWpI?=
 =?utf-8?B?MGVaN0ljSk5jaktZQWtzQ0FPY3lWRHVOeWJ6VFMvYmt5MjRNZWhpSGp3MzhW?=
 =?utf-8?B?YXZiZlZyUnl1aERJNzBwZjNXS29BYkFmSkJRd3NSdW1uSXhvdVFQT1M4SjR3?=
 =?utf-8?B?UTY5MHJrc000dnB3OG9wT1ZCRHVIcVR3SUc5bUh1a2kxbmtXKyt5dE9zZnow?=
 =?utf-8?B?amNSU3BmUTVoSFFXaVBhRFdvcFVQVmVoLzkzYU9SemRud1BGK1A4ZVFpMUZ4?=
 =?utf-8?B?RmlHWDVBaVlRVUUzem96QnE3a21ta05XLzQ1RVIvZWxLdGhkSXBQY0RMc1c4?=
 =?utf-8?B?MFRGeElyeGR2SVVHMFhNRVdISzNsOCtreDF5TkVwQ05xVVRzMEdMWVRwQVk5?=
 =?utf-8?B?cldOZHphQ2srSVBlY080Z0VvdXNKWEx2Zks5VGgxdGZQVVpqQyttZk45Y0RK?=
 =?utf-8?B?ekxjR1JWdHJmM3IySzBOUzk1WVRLemFYczR1WGZXV0FyZUZZTmJMbEdxU2J6?=
 =?utf-8?B?QXN2dGZIZEpkbnFteWV2OGJyYVQ5YXJyOGEwdUNHOUlydXVwbGsyMnB1QmJM?=
 =?utf-8?B?TjV3Yk9PTzJVZm8rZiswZ0NmWGlXZytnemxMTE0xT3B0eE50bnR3a0ZxdmJo?=
 =?utf-8?B?amEzMEg5djFsZFVtS2VYZkRKU1pGTC9EWmpsaW9ydm9hN2E5ZXlSUkxkdXAr?=
 =?utf-8?B?S1ZVU1plVnFmTWF5TmRBNkxrWFoxMk5HdTYra1E3azdNaXVmMGp6cEJwQU1Q?=
 =?utf-8?B?dzltNk1nZFpIWDlGNFRieXNrMzNXMGVpaVZxRUx1VDdTa3NYcmk5ZVZSai9Q?=
 =?utf-8?B?dXJkZlBxdFBYYVhkaXYzZ0diNDZha2ltbGZjeEFialBHWG1OdTlHaEV4NUF2?=
 =?utf-8?B?bUw2eGJ4THRkY3VodGRWRXd4Um52S2lkR2V4YWhxcjUxY09mQjUyZE0zdE5T?=
 =?utf-8?B?SWhkbDAwa3NPa0I2SGlnL2xMalVOMDVYM1ZiTFlyRllvMlkrdEVZMGJlOW9h?=
 =?utf-8?B?Z3RpR1N2bXNhaDUwcTFNanRtN0pkUmJhcStjamp2WUFkYmJNZ05DUzdDUmpQ?=
 =?utf-8?B?czAvSXpzWmlmWlZmcGJZd0dZSHJPMVY3TU5QM0lKYUtXRCtHY3dWcnJOVXpG?=
 =?utf-8?B?Z25iaTRQWXRXY0REbkozRG9sUW1kUHBIWHdFRUoyMHg2UlRzdVZQRWNiUnpi?=
 =?utf-8?B?WENCejJvZThldGM1SHZwUlp0aW81U0ZROVRwR2pzZ2lMZG03QkIwcDBudjA5?=
 =?utf-8?B?aUw1T1I1R2dBU1ZOYmFiWm52MWNWS0xwMFRMaHdiTUR3a2c2MDhEUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e83bd60-b0f6-4e83-1acc-08df3e58c2a2
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:58:25.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbWcuY3cyZQXFwNyZCyc78wKN28da3YZT74yXItsuqDchXp2RzH/c0fYdhkOD3H0C4QUAanVWBX9+oi2ChC9jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3177

On Sat Nov 7, 2026 at 9:48 AM GMT, Alexandre Courbot wrote:
> Register array locations are small values that are cheap to copy, but
> obtaining one can fail. Making them implement `Copy` lets the same
> location be checked once and used for several accesses.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With the `#[inline]` nits fixed:

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/io/register.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> index b6513fa0f412..9e31e68d02cd 100644
> --- a/rust/kernel/io/register.rs
> +++ b/rust/kernel/io/register.rs
> @@ -194,6 +194,14 @@ pub fn try_new(idx: usize) -> Option<Self> {
>      }
>  }
> =20
> +impl<T: RegisterArray> Clone for RegisterArrayLoc<T> {
> +    fn clone(&self) -> Self {
> +        *self
> +    }
> +}
> +
> +impl<T: RegisterArray> Copy for RegisterArrayLoc<T> {}
> +
>  impl<Base: ?Sized, T> IoLoc<Base, T> for RegisterArrayLoc<T>
>  where
>      T: RegisterArray<Base =3D Base>,


