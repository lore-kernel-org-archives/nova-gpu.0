Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021095.outbound.protection.outlook.com [52.101.100.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E623F58F5
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148095; cv=fail; b=lykKhdiYhwNXQheLBdZh7zwlN6D5EbqY7u0m/g0Z6Ym9g4AQ98iR2ei6YlFJOIduQeel9bsCK2OwpC6RhfOu8RoBu5K4GSg+Wdz2VdmFQEJ9rjsKY0cFaeZ/k1ULL0sSVA5hDP1sgKtyVudqvUGva04oKf8Jlp0aHf8DtuP/Gak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148095; c=relaxed/simple;
	bh=tYByLGBefAzWNJ6HDLXkFI8XStPKsWF9jJw6b6N7iSg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=oqeWE8xjY3jXCyBFEmU+miVYGsp5R9lbr++7JKoMI1qQvQ0wliQomOFuyZgfSy+AH8+Nmln4UEvWCB5qiGevGXTRYC5DmUJBoRvZeaUBp58MdMIy/Si4aUNkqx4NGf/6sOQ0HdFbkEW7pTPBJbwVDXtQ0B7z7YSyKytm0iV33N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eel+viEZ; arc=fail smtp.client-ip=52.101.100.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eel+viEZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJQR70C6yGgW4AqJdGPj5bu8dxKSvvZETc//2legVh/4rSUO2BlJikNl6zHjR4tCvSrH15LzCUHqX2ecOVhvBhuEW8+n8TvSUxbXuP4gRI/yvhcIlFUxd0GjtCsZ4HMf1EV6T4Pde1UyvcpDPLbUwpk56SyhoegfLk92U5zy34bjvCpUcAS9P/x1x8WhKjcvlS0esVW0Nf4m9lrig65fFj4KywqKXiPQ1J0YXAV/0RE1M79qiF8njp93d7lyW5qFFnizhrW5oT0tco6xlYOaNt9DANyoLoE1qA/LH4UDglR/mD4bcMmv9eAsF3xJqEIMBGgSRIA8riLXTkyRwW0diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k26VFJxnRGf16KSdcA3us1K+9tUAX/2luRSoZG7W9M4=;
 b=O7sYnpywFHBkUvx4qjyslTUMRBgTSJmlNPUbaWNmZJDDqohRh3SEmYeE+AnLgdi6k9UU0gfU41dAX9WIAtXOzbTdMQxengrD5fuJYlZxSYB9TAVhPiwE9Amtbyx8PaKzoXNCrb23U4K+0RcHTECHyN1somKxTNfwFkxsZST/UIRpEJiOaCmPVMUSAqQj2IGngo2V3uqm8d3O8yFt8CtH/mtMBM2zvsJN5IGjPnYbX7facJxvaC6IUZ9NhszbfLF/bEc4nEvsW548YCeAf6fgYz+YVznRbiPf7iRDwnK+50lQh3tKMda10SVAPQhS+ZjQtNQp7ZcbSbaOy1Iw9C4rXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k26VFJxnRGf16KSdcA3us1K+9tUAX/2luRSoZG7W9M4=;
 b=eel+viEZxtV5VMxuBPWcvno5euhINoIQD0MDF0Iz3J0kaNza7EdEgcBafFWj/dOYSOLUHAXpe7BxYfzTXUYYQvzKp6dNjBOJ0mS71M1osaRWB6Ro/U2A7j655/LBfZf30eam5vbZaiY4kWGOGbkwMtz2vZ9W9gixAYiYZXfWGbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8937.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 27 Jul
 2026 10:28:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:28:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 11:28:04 +0100
Message-Id: <DK9A6KGK5JQD.3U23MBEMSAXBK@garyguo.net>
Subject: Re: [PATCH 1/2] rust: add functions and traits for lossless integer
 conversions
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260727-as_casts-v1-0-6ea704ff25d8@nvidia.com>
 <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com>
In-Reply-To: <20260727-as_casts-v1-1-6ea704ff25d8@nvidia.com>
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 07101180-9e3a-4d5c-5f63-08deebc9be47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10070799003|921020|6133799003|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fZaHdYRyFcbxZBHPNh3DBttlKolcXiTGiJuX+JZZjczsdptrtFIjT24y0aNvLfrdee7iLTLuxYdLD06NK87Q/rEr2c+O+4z0PnrKWYha6NdsamfiyHLP770X+MTFe3rBS6zjGf0z4Z7QR3rF6CNyzhD8fVngqzDunbS+1wh0VtxZGmMYlwMbfKNjH7KMoW4W1tmb3PbAur2yfg4/TWkX2wNd6pdtaJkodBxMnqbp1oiOZdfJrPCnuNHETpPUs2YKs7Y9dWwqgIl1qlwCk0hr9c2+FZZ0eIzKZY3m8l+nu/02TX2SGEQlU7PpZdfcJq45tu+TR/0u/99yDPLCSfsdXW9qD4/HUL+5CcUPdOoSYtpFYx63ju36z2fcR7viOU9x04ozj4CzkyZmhjyKL15XbPJpU/RoqiT/9RFmYOdk+aTN/wUIvBFvA3cg/B0NCmrIDDszYhGUHiPCqzbPjRyRbYk0+fgnMyFnXUguOsMUqwAnJzxHjFywDEO9u9LbBaclUw/ltYSmMiCoiFmU31CRTW54ccxA4mXgVcTcePzWXpUf/kSMYhPtzMDkA07ax8T40I63PjktlcrjBb0LkZSpDqLEepKzt17E0CxsjET9LrwyxrN3OugznI7+0HSNesOLPEDSEyYZXxxS0XOJJ/x3lpORFadEbslBGmjv1hxhHmPcuXR9ZSAjt58y26NFruopXz2Jz/Kf3s3ZkLptTQRLsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10070799003)(921020)(6133799003)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzFyWTZGbkwyODJTZmczV1E0Q2tqaFNTQkVwM0JSV0Iyais3b1VVY29aNlYx?=
 =?utf-8?B?aEhLbFBkVzI2U3dJckRRSDgrdlRBSDJabWNJMGFLYVJaejFTenoySGxLSVFK?=
 =?utf-8?B?TU84bWdlajdJM1hkMmpFdFNHUEZRRWd0STQ2YUVxdG8xcWVKNzBDMnpWeUk4?=
 =?utf-8?B?blhCelZYTGlOeU1WakY3a09RUHVCMDV2WGtUeWFsN3FDU2kxZzk1bzd6TW5o?=
 =?utf-8?B?TE9UbzQzNDRaUGNQOEpSRktnR3BqUXlpdERPa1lsTG92ZFhhRzhCV3NuQitO?=
 =?utf-8?B?aE1zWTVmRTRyeFFFR0djcmJ1Rm1nbkFxOXVUMEx0UmNOTmxjeTNaM2diQUw5?=
 =?utf-8?B?aDQxVDNFNXdtNUhsMDBTakFpYWVTSDJPcmxlSy9rQmV3aTZLOVRZc3VYV3Ju?=
 =?utf-8?B?eTA4M2dzUjZXRXQzRlJGSHlxWFB1NWJ1c3VSY1BqSGw5Z1pVakpRRXRlUkt1?=
 =?utf-8?B?NFJSd1Ryb2RoTWxQaEtpN2RkWWZZWkR3a3pESkRwcVUydFZreGVkcGRoQysr?=
 =?utf-8?B?WmlaVndvQ0twVHowdUVwMk44UEJLTTVmOTRXMFlKcWVhZWU1SWZwVEY2NGo2?=
 =?utf-8?B?MjVkd0xaU2hmM1ZOM1RvVlQyL2tZbGFVM0RpbzRRRXpkajF5Y1FjR3N5R3lm?=
 =?utf-8?B?UkRMNG83MHNjMVBaWjNiZFJuRzhGN3owc2JEOGtUb05DcXBsRmhiM1pGNTU0?=
 =?utf-8?B?bXNHaHNjUGtIeFoyNituSUZZQTZ6dVR3YWU1WUxkaGNIZExqWVExaHdZKzB4?=
 =?utf-8?B?b3NJTlRleUt2UWx4RGNVa0ZZWnBwZUxiRndEUkY0Z2JkbXNTOWY4citDejVV?=
 =?utf-8?B?WUYyeWI0QmV3aFl4NjByTzZRRnpmU2hIT245OGJwVjhPUGdXdE9zQlhGZDNx?=
 =?utf-8?B?TDc2ZHRrck5HVHc5SmhOMjEvbG5raWhiRStVUXZVSWU2WnJNRHlnSW9DeFRh?=
 =?utf-8?B?dS9XTEFLV0EwTTh0UUhTZElEYTFWbnByZU9FRFhKTTRDeDBhQ3E2VzNISUMv?=
 =?utf-8?B?T1VTcjZ4WStlOTR3cTBSMm5CM0xWUmFacSsyQUpDKzRIWkZZNnI5OExYK0ZR?=
 =?utf-8?B?OFU2QjQvbGUycFh5L1FXb1FxVzRVV2t5WE9ieUNVTjlNeFNyL25mZmRHQTlm?=
 =?utf-8?B?ejRkU0RiSHlpTndrWUhDY0JZcGlaLzZyUG9nR3dvQWtqbGVoZGI0SldZY2wy?=
 =?utf-8?B?VHFza0JLSk5YS1lwWTZzRFpVWVkzT3JpOEU2NjJnam0wRG44bmtUcFZHWkxn?=
 =?utf-8?B?SEoxTVNFdnQ4RlFZL1pseWxlMjhhOFRCbXhZYWVSaVR2bTE3STVoUCtxeDFT?=
 =?utf-8?B?MU5udjR3SzN3TEFUdm1EamJoeWI4eTczWFllUlJsQ2kxQnl3WHVSd1orUUhy?=
 =?utf-8?B?cTY1Z1Ricld3YitTck1TTWE4bWx0am9TajNObEpGM04zOHFJaHllVkRGWnhH?=
 =?utf-8?B?cWNCTFlncXlaMDMwNi9CSHpxSmR1M1BGUnhwWktoRHZnMzhRdFdYR0pRWCtt?=
 =?utf-8?B?R3NvQkdONWh0blMwYmV4UUF1Q0VKbWZXK1hocE1yeUJOM0JkTmhXY3lwdUtt?=
 =?utf-8?B?NlBjQzBTN2xwMEpmRHZjVXFYUmszanJSbUN0WkpXTGRtQnp5Y1doZ1V2VWpy?=
 =?utf-8?B?VlE0cW80ODU5T1p2bUUvTE0wYzBuTCtSRkZocTJKell5eEc2dVVBdnNkTVcz?=
 =?utf-8?B?czBTUzhmNTRMaWpzVXFFMkFVSUJVQldGSk9XKzZSK2JZWUU1a002Sjg3YUR3?=
 =?utf-8?B?TFBxMVc1T2hMcU5sb1hBRWFRbDd2ZXdTbUlaR0J2amR5YVlMRzhIMmFBY3p3?=
 =?utf-8?B?ckVESG9tOUZaUGhWMFJ5b3BvamJHTWh5ZDhRVERxVDRVSHhwVUVJRnFsL1hE?=
 =?utf-8?B?ek9zMlMyNHpXOFZNRkttMFh4YzV3T3gxTDFmYnpaTnFPVGZNSDYvb0FXYWJB?=
 =?utf-8?B?Y1ZLVXp2VXFiTjNnOXVUUnJQWmc1SHhDL1N3N1J1UDNjd1dTcVBsUHNrTE1S?=
 =?utf-8?B?Y3FWK1IvYW1QY2M5SDRTeUdmcjNqeGdLTWx0anQ5SmY4TUFVSXVUeFZCOVdt?=
 =?utf-8?B?Wmd2MjFGS1ZIZ1N1SEVkL1hxSGt2ejd5c3dBaUtLeEdFaDI2dC9keFQwSFZW?=
 =?utf-8?B?d05kdmpGUTJzQjZvYVZLREpRdHJqb2JzMVMrSEFlZnZSSTRHRnp0Ukw1Q0la?=
 =?utf-8?B?ZXc2U2xSOHF3L29xOXRnVHJRTFZBSzlvWTY3VnNuS2Ntc1RDMmJWZHZXUit6?=
 =?utf-8?B?L0pWRE1OVW92cnZ0OFQvQmE4QWFsblgwRThrbzF6TU1VczM2bTJ5L3lkY0M2?=
 =?utf-8?B?elAzODExbC81cVNWclJiY3JhUHl6bGErZjFaYjlZdEVCUFFreUliUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 07101180-9e3a-4d5c-5f63-08deebc9be47
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:28:04.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sh24TqDtLsWlIj/6I7xLMhwCV8EatIWu54+xmVqdt8GfBroS5Tp2eLfoXhUANTs0DfLIPa5TQJC8nNjFZXOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8937

On Mon Jul 27, 2026 at 11:15 AM BST, Alexandre Courbot wrote:
> The core library's `From` implementations do not cover conversions that
> are not portable or future-proof. For instance, even though it is safe
> today, `From<usize>` is not implemented for `u64` because of the
> possibility of supporting larger-than-64bit architectures in the future.
>
> However, the kernel supports a narrower set of architectures, with a
> considerable amount of code that is architecture-specific. This makes it
> helpful and desirable to provide more infallible conversions, lest we
> need to rely on the `as` keyword and carry the risk of silently losing
> data.
>
> Thus, introduce a new module `num::casts` that provides safe const
> functions performing more conversions allowed by the build target, as
> well as `FromSafeCast` and `IntoSafeCast` traits that are just
> extensions of `From` and `Into` to conversions that are known to be
> lossless.

I'm okay with having u32 -> usize casts and usize -> u64 casts, but having
usize -> u32 and u64 -> usize casts like this series do is worrying as it c=
an be
misused from drivers that are supposed to be supporting multiple platforms =
or
core subsystems.

Pointer-size dependent drivers that need these casts should define them loc=
ally.

Best,
Gary

>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@k=
ernel.org/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num.rs       |   3 +
>  rust/kernel/num/casts.rs | 248 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 251 insertions(+)
