Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BEB3A8722
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 20:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887196; cv=fail; b=OWN09qz2MJW0d+tpdh83G883LsdFBjDchVIMfd2JOq3spiFlqxkZGrC/FVrsry2d8sikFvY0kmfLP2iO2KiQAKgjuT+a5Q/Rqm+nYtPWfo6V8fL/3YgkTbL9Moj3qGdd3cFZHj8e2JVVfhmYOVk+s1uFciRPflC82onFdjnH2Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887196; c=relaxed/simple;
	bh=tb7sClwQFDJhxtpt3kmfcfYyD26lQukGMBZJ6Rhhnls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XbTra3jSwQ7S9HIi0eqpcH1getU7oBxpgATkzIJAfz6aHUEdSs9O25ag+gZYfoFD3YTTMfg9No0rSDwouB+9gahGhIEq27JfXZ5s4pTzCM+cC5o/R8D07aoJIrlfBlXp3fgkcXaW6X/rBz13Y6YfpSHIE0aX/eMM8q2v6RjB44E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YumPaZng; arc=fail smtp.client-ip=40.93.196.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YumPaZng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwiAWr/eYc6pH9Jtx7vZZpGsVISkCQqHGtVH3By4od+ZUWoml8l1j16AFKI15x7Vfn8w4hSkAPqqZQl2beupRNf7hsEqw0Xfi8ibyHdxiAHR4Vu4HWz0a49Be74/rZoC/LeqYZJOZggbTY6vo+JJ+eULgxWGZL+6cqRCuj9t9/vIy8nHZyaMGdmPJENca3Kj1txE+xGhQxbi7r14ow1LdTDr9nRVf7Ch6EX6IzgHU0pog1TZGMyTMuqaeAI4KO7TyQ1aFCHY0WIet+PvZ4iWfnikcPh1qMbwLsZQ+/eqT9INWfumLPMHzLNaATxJwfnemY4838vlZaE0WZrVkoQZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tb7sClwQFDJhxtpt3kmfcfYyD26lQukGMBZJ6Rhhnls=;
 b=JEVik10+ahxMcUfHJwfuMeVWdOCtKe2YYcN3CxKLjWrAwSzSOr162SILPJk63MBByVqyR63SspRJ6lBuMyYv+2Q/Ntb2M72dTtN/daHvwdMWvcmbZEns0qYdBf5uldvFEjcZFrIWFEolI4/GznP3+VXTcvbdW1xXrB1s99zPyfoMV1+0M3xz9zPuJWBTfypKJNqeHRLdciVcjGrn2+B7PL3bsZe6uYzMx5D+Q3gqqxhwYbW0enLhw2UaFhueU7QD22mNUXy4i7z269KafOtwjhk34aKt26bKzLpzn04rhr+5i1VGUnbT4ZCn8Dpxf5WXQxEm7jeTPu4Ey0NEwuznRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tb7sClwQFDJhxtpt3kmfcfYyD26lQukGMBZJ6Rhhnls=;
 b=YumPaZngsUPzfWsgN61KuoYVBbOkVkXPOxlmGT4JHmnKI5WfILG5KZHUg1BN+murcc9xCKvySMgVL99OKJghsyAZ1M9kVkPLKQvpHeOPirSZNS0Ru2CymAMTyjaDDuWwXaafVal86H/CGDJqwRVi9g2wVppG36gm922XyWRe7lUx7noZZ+30icyoCsGv+XUsoCXd/r8rR8lWO+rT6UlKGcQvjvlQAvAcF0I+CAvomce9ZgrSoDKPMInQJYi86xNwx5lZWJRH6cPhLtFYcXCuWZ0+v27NNssqTSeNlaweqAHCV+JcXEqMhuPnkgbsqQB8E2SoCBBGa7e2DiihQIM0lg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 20:39:43 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 20:39:43 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH v3 27/33] gpu: nova-core: switch to the r000 GSP firmware
Thread-Topic: [PATCH v3 27/33] gpu: nova-core: switch to the r000 GSP firmware
Thread-Index: AQHdRwpFpZN1FCVnA06a1Z2w0g4zTrbU8aOAgAT4vgCAD1GDAA==
Date: Thu, 1 Oct 2026 20:39:42 +0000
Message-ID: <facca1b8335c9ee718fb6e03d477c46e9e0ffb05.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-28-jhubbard@nvidia.com>
	 <9dfad8ed0c689a40828a4cdc4562d067ca5bc3bf.camel@nvidia.com>
	 <7ea2771e-e2de-487c-aebb-317d4cffaf2a@nvidia.com>
In-Reply-To: <7ea2771e-e2de-487c-aebb-317d4cffaf2a@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH7PR12MB9223:EE_
x-ms-office365-filtering-correlation-id: d088f3d9-89c9-4f4a-8bb7-08df1ffc1f7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 SVRDwwnwrDVKmhpr43NZjyQy5fBi+sk3I5tNlGlsvrS+NPSopXYxniR/dCGUn64AWO0IZQwcBNpvoxdz8ROZpea7iZZcq+ZKcVTRSmjXo4CcaVPbanV+xOX/bpJ4rghpCguR6mVkm50FoNQRABsOS4EPQsFkuQfBgMGcDQvZXx1Uze23qYNLzheU+9r11NmOe3r6wuVETO0qN0Dyz9XsXZLcv0p1OKkqYSRLe+o3LID0T1fosrluwgq8rHHBC1PtjFg5JDdgc9C36vtiM/3+JuNpRLbEubxjaJk3xbDyXht9mRvtsaG1WmQ78GpFeoFILWIgpFi+ukV0IvIRb1A/bagYjiMq6tWIDGmpWMJgDC8IxyPLeHQisPtioHZVcbYYBO81Huz8H2Xvaiu2anYt4vOyP+eR7/dcaNswT2MU2Enoi2F3fK15nug9OZjtZGmlyQhPrHgV2V9duAGU7zVDx6pCktkL5hJ7IyX6rubjmcXTpASc1SkPn8+JgBua3vZ38di56zMtgRrt8k7PJLcBzwpMm1bRqVGZ1AjcvKR8ni/twzdVXPpcT2Bd3zpQTdMJVMvT78tWJ7lNmYwfmhmHEQDOhRN3QHq34yQimePGP8c2W0BvrH50SW7gEvHXOshUR/byvWtfkn5EbH1rnxTsyel27liANS4IzoWmYIdLqsas09jpEvTXD7Qszh8xSXPWkoL94fiYnaAUEnJbnv2NLlVrZpizaPc9I45yOU0SLFk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WExSRGhQZGM3L2lDajJVd3h6TGMzOUJhcGdjUENWNi9HUlFEQXJqN3hKZWxI?=
 =?utf-8?B?SVY5MVpDTW8wQmszdWJXTW1rR01Hek10YjlkTDBTaGdYUU1jaHlNcHRMdFdE?=
 =?utf-8?B?SzcyeWNOSnQ0ckhORmIwaG5uemZyaHpaNkJxd0VZUEJVVkR2Q3AvaFJLRnYx?=
 =?utf-8?B?a1hOTzJHQ25BbVZpTkpUTmNNNWlKQXo0M2l5ZllFcHpyZS9LaU9vakRRN3Iy?=
 =?utf-8?B?RHBTRWtaSEQxT0lBbkZWRUdUNFA5NSs1aVFhTjVhd0FZLys4aEZ4OSszSDc3?=
 =?utf-8?B?UmFDekRMYWtGbGZOaWVTeEsyVjU3bFJNdTRUaWcya2JSMldCV1lnY2hGNVRD?=
 =?utf-8?B?emlDcEMvSUMzZVVUdStycVpGMW5INDV1a1l2b0F2eklCWGlGYXR3QlNmL3Ev?=
 =?utf-8?B?aVdQMzZpVGtTeUFmR3JnMHMveFV0TlFuSmVxSGlpUmZQZkRJVS9MRWhxbWN0?=
 =?utf-8?B?WGdkRUtrYXBDWmpWV2NZM3pvNHgxbjJPUVRvYTRYYW1RYzBXQVdMWFY1K2xK?=
 =?utf-8?B?SGZzblhObzl4Z0pHWURLeldYeW82eWxKL0d3L0o4Ny9wYUNFR1Y0NkNrQWdn?=
 =?utf-8?B?QVNVajlMRFJJaDQvNUhIOGdyZlRnZDRRY1hvNEpOTFkrWUcrYkVJUW1NMnIr?=
 =?utf-8?B?TmduY2tmZGphaFEyUStvMFpHR213WVd6UFdxQTEyd1hlZGVPODRqVU5FMFhV?=
 =?utf-8?B?TU1Qc3lVZXQxMzVuMmpyQ2VnZ0VvL2E2b0ZEMU0zRkNYcUNPcmp1cFloL1BB?=
 =?utf-8?B?K2JERVZhdVhzL0VJREhwTGl3Z2VZNlo5RUlQNlhJZU03QXphSWdxeUZCZGJ1?=
 =?utf-8?B?Z3haQUxjamUvRDVYZVZ3d3Jhd05ZMzdMU2ZiY01TNFRidnlRK283cS80RDFt?=
 =?utf-8?B?MmNaOTZOaUJXNEdrVVlXSy80UUlNTEVFSWthNDlzYWJvalU3emVFU1I4UkNw?=
 =?utf-8?B?Ujdib2QzSzBpeHJXaHpnbU5yWlB5UWZZWFZtdGVLWEpKQ2RuUzlZU0RuNytK?=
 =?utf-8?B?eFlIRDl1MWhXTFVwUm1DSkY2S0ovNGZmYnlaMHYwZFZBUDZEZ1VRVWxGRmV1?=
 =?utf-8?B?Y2lsdFNMWEZKWXNjbWZsNUVxNzEyMEtjUzVsRThxWDAramN3WjdDWFZhemR1?=
 =?utf-8?B?M1k5Y1RjMzAxY2RYYzhZSUwyNUxMNDNJb2hoWlhJcEUxNGpsV3E2UEptMWF3?=
 =?utf-8?B?K2JpSjBEVjNLTjNPTndnaWJmYkhkMUdoMUtEWk5NZFMxWEhPWkVCcExPYnJS?=
 =?utf-8?B?UlRYREZmTWpXVXh3M25SNjZtQ2ppdEJtUy9kaGorRkNUNmx1NXRJODc3enFw?=
 =?utf-8?B?aGQwbUJKUFFhcnlHa2xyRFQvOEUyVHJtd3JMckxwYXlYMzNUeFVUMnN4R2ZP?=
 =?utf-8?B?WGJCcDNnTU5Nd3V3WmhwejJqS0lSREU2dzJQaTFZOVF1eFhGVll4bVV0d3FT?=
 =?utf-8?B?VkdtM3FjT2N3MldBVkg0WUs5UWF1RkVkNEcrc0NsWmZMcDNuOUJUQWY5UjZs?=
 =?utf-8?B?YjJJZG9Pa2ZyamdJK1Jkb2NlemExL3ZwZ2xsNWppeGNaWTVUMis0MVR1MXln?=
 =?utf-8?B?ZnF5MzZ1SmlHVFdaUWg1Q0RXNElEUFNkT3luSjFlWmRldDErbGFhS3d5OWEz?=
 =?utf-8?B?S2hWTUo1bXhwU0lHbWk0UVN5MGpXdUluVHk5WWVnbXRnRCtac0Q4ZGRYRnpF?=
 =?utf-8?B?bTJIc1BaY1o0L2FBZnhlanR5Z1VLQVRqZHZNd1hSRGlYTlRkTitJcWFmd1du?=
 =?utf-8?B?WmtrRkpSMEZ5YVpWNzRuWHVNYWdtdXNNdUFNSEhxU3VDUEROc3Jyb2l5MVpi?=
 =?utf-8?B?TnZHaTFJSm5zNjgweTlmNDYwZFBpQlFYaHRDdUNUdlhYYk51TWhGTUF5N0x5?=
 =?utf-8?B?a1M1N0F6UVludHdnMS9oYlcrTFMrdytqTVNrZ3lmR2RZQ0ZGdTNjUnBYZHFk?=
 =?utf-8?B?WDEyd3Y5RkVSSFd5RWxxMG54UEJmVWpPUno3MVJWckZ1d0sxalN1SUkvYjBJ?=
 =?utf-8?B?THlOa0J3cGt0VVFhZCtZZCtTTmxKdzNSVTlNTzhuMzZBTG9xV1dLTnc4RUZH?=
 =?utf-8?B?RWROZjJ3QVk2VFczQWFlTHMzV041eTFvNS9OUndEdmQ4SDJiNmFKWlYxLzJ3?=
 =?utf-8?B?N0g2U3VpMWlRL1FkR0lDY0tocEx4M3NDbUhyaUhLUTdCRVJ5YTk4UmQxTHQ1?=
 =?utf-8?B?ZWdPU1FBWi9mRjFhbGpSSUJrbWVHTENOOHNtc0ZtTVRGTDQyS2ZSN0ErNjg4?=
 =?utf-8?B?N0VJcGFHbWliZWk1VjZ1YSswWHg3YlpMSUNvUkpFN0QrWlA4UjZ0SHFFMHZJ?=
 =?utf-8?B?ekF3aWdLSTVhSzlMdXg2NmJwYnV1cnVvUTVCR0VmTXdZV1FBVTAzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B822FD615083AD409AD724E0BA13E79C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d088f3d9-89c9-4f4a-8bb7-08df1ffc1f7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 20:39:43.0002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W431lYx3q+WzhZmLGUwWzt0Zb1ZDxmJ3W3BBJxzEi8NJKP3MRNDQnzggFdKciiEjP5LG9BZbnV8HG3zH1X+6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223

T24gTW9uLCAyMDI2LTA5LTIxIGF0IDE5OjQ0IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDkvMTgvMjYgMzo0OCBQTSwgVGltdXIgVGFiaSB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYt
MDktMTcgYXQgMTg6MDcgLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToNCj4gPiA+IA0KPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZiL2hhbC9nYjEwMC5ycw0KPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZiL2hhbC9nYjEwMC5ycw0KPiA+ID4gQEAgLTc5LDEwICs3
OSwyOCBAQCBmbiB3cml0ZV9zeXNtZW1fZmx1c2hfcGFnZV9nYjEwMChoc2h1YjA6IE1taW88J18s
IHJlZ3M6OkhzaHViMFJlZ2lzdGVycz4sIGFkZHI6DQo+ID4gPiDCoMKgwqDCoCBoc2h1YjAud3Jp
dGVfcmVnKHJlZ3M6Ok5WX1BGQl9IU0hVQl9FR19QQ0lFX0ZMVVNIX1NZU01FTV9BRERSX0xPOjp6
ZXJvZWQoKS53aXRoX2FkcihhZGRyX2xvKSk7DQo+ID4gPiDCoH0NCj4gPiA+IMKgDQo+ID4gPiAt
Ly8gVGhpcyBQTVUgcmVzZXJ2YXRpb24gc2l6ZSBpcyByNTcwLXNwZWNpZmljLg0KPiA+ID4gKy8v
LyBQTVUgYmFja2luZyBzdG9yZS4NCj4gPiA+ICtjb25zdCBQTVVfQkFDS0lOR19TVE9SRV9TSVpF
OiB1c2l6ZSA9IDkgKiBTWl8xTTsNCj4gPiANCj4gPiBJIGRvbid0IHNlZSB0aGlzIGNvbW1lbnQg
b3IgdmFsdWUgcmVtb3ZlZC9jaGFuZ2VkIGluIHRoaXMgcGF0Y2hzZXQsIHNvIGlzIGl0IHJlYWxs
eSA1NzAtDQo+ID4gc3BlY2lmaWM/DQo+IA0KPiBZZXMsIGl0IHdhcyByNTcwLXNwZWNpZmljLCBh
bmQgdGhpcyBwYXRjaCBpcyB3aGVyZSBpdCBjaGFuZ2VzOiB0aGUNCj4gaHVuayByZW1vdmVzIHRo
ZSBjb21tZW50IGFuZCByZXBsYWNlcyB0aGUgdmFsdWUuDQo+IA0KPiBJbiA1NzAuMTQ0IHRoZSBQ
TVUgcmVnaW9uIGlzOg0KPiANCj4gICAgICogOCBNaUIgb2YgYmFja2luZyBzdG9yZQ0KPiAgICAg
KiAxNiBNaUIgb2Ygc3VyZmFjZXMNCj4gICAgICogNCBLaUIgb2YgbWlzY2VsbGFuZW91cyBtZW1v
cnkNCj4gICAgICogYWxsIGFsaWduZWQgdG8gMTI4IEtpQi4gDQo+IA0KPiBJbiA2MTUuNzEuMDkg
dGhlIGJhY2tpbmcgc3RvcmUgaXMgOSBNaUIgYW5kIHRoZSBzdXJmYWNlcyBhcmUgMTYgTWlCICsg
MjU2IEtpQi4NCg0KT24gNjE1LCB0aGUgYmFja2luZyBzdG9yZSBpcyAweDk1MDAwMCwgbm90IDkg
TWlCOg0KDQpOdlUzMg0Ka3BtdVJlc2VydmVkTWVtb3J5QmFja2luZ1N0b3JlU2l6ZUdldF9JTVBM
DQooDQogICAgS2VybmVsUG11ICpwS2VybmVsUG11DQopDQp7DQogICAgaWYgKGtwbXVHZXRJc1Nl
bGZJbml0KHBLZXJuZWxQbXUpKQ0KICAgIHsNCiAgICAgICAgLy8NCiAgICAgICAgLy8gTU1JTlRT
LVRPRE86IGNyb3NzLXJlZmVyZW5jZSB3aXRoIHRoaXMgd2hlbiByZXNlcnZpbmcgbWVtb3J5DQog
ICAgICAgIC8vIGluIHBtdV8yMC5jDQogICAgICAgIC8vDQogICAgICAgIHJldHVybiAweDk1MDAw
MDsNCiAgICB9DQoNCiAgICBpZiAoa3BtdUdldElzU2VsZkluaXQocEtlcm5lbFBtdSkpDQogICAg
ew0KICAgICAgICAvLw0KICAgICAgICAvLyBNTUlOVFMtVE9ETzogY3Jvc3MtcmVmZXJlbmNlIHdp
dGggdGhpcyB3aGVuIHJlc2VydmluZyBtZW1vcnkNCiAgICAgICAgLy8gaW4gcG11XzIwLmMNCiAg
ICAgICAgLy8NCiAgICAgICAgcmV0dXJuIDB4OTAwMDAwOw0KICAgIH0NCg0KICAgIHJldHVybiAw
VTsNCn0NCg0Ka3BtdUdldElzU2VsZkluaXQoKSByZXR1cm5zIFRydWUgb24gR0IxMDAgYW5kIGxh
dGVyLCBhbmQgRmFsc2Ugb3RoZXJ3aXNlLiAgVGhlIHNlY29uZCBpZi0NCnN0YXRlbWVudCBpcyBu
ZXZlciBlbnRlcmVkLCBiZWNhdXNlIHRoaXMgaXMganVzdCBzb21lICNpZmRlZiB3ZWlyZG5lc3Mg
d2hlbiBPcGVuUk0gd2FzDQpnZW5lcmF0ZWQuDQo=
