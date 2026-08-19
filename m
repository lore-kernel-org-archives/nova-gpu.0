Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4A3A1A35
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787162130; cv=fail; b=RizrfBpE0IGjEZg65ynRo3OW13mZ1Xv/NW4cjFdZ1G7klA7FJRYg8zmjrALxHtOX1Ybu+ZzdKtT7f9eYM5SUqdJ15rhKJzO1k4xURwAuNs/8wKmKHJdKLQuIss8sFUiHpw+zaayiKOkGPeNCNmzqsPeNeVlWuewz1q9gHgDdFuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787162130; c=relaxed/simple;
	bh=InUHSU2VEV75Q6CtobTHhtTTOlhYlh7M0TCxu74vprk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ty690GD0OwjrrnlgNAxxbx0sG4PS2oE0Jddrd2QjfVNk78zXZHfY83cKGxTXVosM9SfZ8csSPTQO7xNK7CVVaVWhfyRUHrTGpGIRUgJ4a2IZ9AKCTiHRmuLKRHQdaaq4X+0cRnG9pXPkREXQJOVW70QWWYQLfL0BLCnr2H6yTZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RgKox0lN; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgKox0lN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGJC0AdQTTSu+4BFGXJA8AEwgZFmFeWYB8jWkCC8Lbeb+A13Kauy8uARNTc6NDAUbK3Icn8HKoi9e69FSQRjAYu6If6VSNbeK+h/BBHg55H7NLzuMn3jwF3QZvy+uR64yyDX5lP6BXLQQT1iglfOjPuKjWcd+eE11xymNnokREY++wK+sWdCPLV73f/2Y+0MAI/xE27UvNJt0hWFU6kJY0nOzKgm7K/16Be1SA7QOWh/vZFPWfeiVCeFW4AARo+fDNQK8E4mACa0he825hkwOdDWWAR8jOZ+pOPQrmqEMGLK6PQHlVPf0ZzfFE+qQ7KwXSYi+DDPtaJxcuD2+nJWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InUHSU2VEV75Q6CtobTHhtTTOlhYlh7M0TCxu74vprk=;
 b=q1muNdkksGYrVMtPerGcVIZIHrsbKvaXFJaEE1314LOcIzmoxVPnJBvSSWueT8mcsDUFzRwHqrbp17YkrdfqZxDQmYXsIKPWSfJFdveF+A6uLNQYQ2/Co9qOpgAUUEAjAUIWZouCzeWbFifDVCYUL06bFZEePUq/jK3IuHAh6f390UUfuvBaIGE65NBaJStooSHPLo23/2fFk9aROcnFbJtMHIWZNjAinjoxCKJWSz0/Sf+rklq6LoXWmqPDvZk6vHl9AukJItcu4rN3zf/g9SFJWaph2PR/Z+/sL7PYFffKbtrZcCckFpIkE/e3kcH0g/QBflEPGINE+OCvUdMULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InUHSU2VEV75Q6CtobTHhtTTOlhYlh7M0TCxu74vprk=;
 b=RgKox0lNvMZmDmKMD3H7Q7NAHStKVLJJl0KEAIw8WuHj+lQEb1Vdi/FLa6HKKdwir697Qb+iA2IhlC+yZV8LRzSBrgTc8+W/6hWQTrvsa1p8Zc2jbfNZdDPMmSmPIs/nuCmMk0bTXHbKu33Pj2NTficF45PMedh4FL6vQO9W2GS6fBZGXinOuBsHq7TkZUI8ShbVbD1HjXmyjZImIGw52mzuCeM++M8WlGVKbf9iXy05VMArTS9HR21aiLzoYyoEsJvbjqDIcJ9cz6nnHG35CojXJhVkCgLjRwNCvUYJya8OF2Dj4oaJ+x0dLMicnyt6nSMi9n/zcOKFVJoMUvU0LA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 17:55:24 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 17:55:24 +0000
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
Subject: Re: [PATCH 07/27] gpu: nova-core: add optional ucodes firmware
 loading
Thread-Topic: [PATCH 07/27] gpu: nova-core: add optional ucodes firmware
 loading
Thread-Index: AQHdL44ruw9aKPevk02GOz1XRgU1PralqLIA
Date: Wed, 19 Aug 2026 17:55:24 +0000
Message-ID: <921982b605fc1cc6cae2c64e3236d4b8b4a82408.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-8-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-8-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH7PR12MB5806:EE_
x-ms-office365-filtering-correlation-id: e7faba2d-396a-4d0f-c9c8-08defe1b0b82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 U1306TJJPBUv+OwIFGAOQb74NCMXWT0MCL1DEuOnuGT45cxrZR7QR1w1OOjD59tZq4W/AOkFiH01OxorxNqTCoRBwMxPQ6AZNdeabs0sc0s1JHE+6zVin1+Pqzsl1ypsKTZuN7P91TOAc6UMtal0h5uDIRbpXo5DUMRS1UW/x9h8ZbWygTs5rYdBrASYclghRJRR/QkfKLmVm7vO5DWJU8xE1cpjzQODYLxVVU+zcWf8zGXT1kQy3xFo/Td/p4UuKN6sBc6jEgAbjICsrDofZJ5bVtKgE6FBFI+0q0fmsqEUIMnUtGkfTcMWW1/twOh9YfDC7eleArZs3UPO0v1SlL0s7HjbmZmPMtRlMBafanUw6GRccnMGsDS0rvhdiiqaZb3TDEMJoUwnClrTbInorcRREACoarY70iiiCg00PvL+25RCRFS7JRvGLv3/TZ7rKhALO69Z6/2g/9mlU0MmmpIEeofrAWJDC+Tf27sg12KWHFM0WK10vSD4Uy2Fm5TsouaQWtb46fhXZwJeO7+HT+HpqaT3ZPPz1VbD+87oLLHiV3NpVO0TGZhA5S9yVfOVHmI7E4Kxnj0W4EzMl177bwyrquVRTi4LBD9BIi5rnJcoDdDjpLY8UnxiYxJmAJgKyTJRCPLGVnI9Jx3ZdbIjX9BIkts5BIg1hUrsGpM8mtjH0amBPHSCQeS4i6oTYn2l8prqeJPtXBA8Hr3wB+3eGBaBz7DtoX6oOUqjV23a+nc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGl0b3ZROHNISGlWdG9TL3JDeVQzSkVrdmxhY3dMcUs3V2tDbzBIQW5ieW45?=
 =?utf-8?B?WFREbDF5K3dodlRyTkpZWGUyTGZzVDlzUXBseXZVK0xlMDFsa0srNzZBOUdq?=
 =?utf-8?B?bUdtaldkMjV1QVVETFQ3dTFoZVh4Y01LU0E1MjlmbElTV05ubHpYeVVQYjl2?=
 =?utf-8?B?MGgza28vSmE1Z3k2bmkxbDBQbkkyT1EwUktyT0sydW1PTDFtQUFHQzFXenZI?=
 =?utf-8?B?dGpRMjRVdjlBQjd2KzF3ZnhDZUthbkJONzZvbVQ2TTVuTm55Zm9EaWFpdlBU?=
 =?utf-8?B?YUZWMUs4LzlNRzBZbzJpRHVDL3BydlBTdzNJeldlVFBRd0toQjZZdE8wSUxh?=
 =?utf-8?B?TDdGL0VHUEpabHlRTmNtTGRQYjlRTkhIdjRCMmxyNG5FaitoQkoxL1ZtaU9V?=
 =?utf-8?B?alZDNGVQRnpCcVJXQWNnNWVxY00zS1hJZUxuRHoySDV1cXVUTERmSTBONEt4?=
 =?utf-8?B?dEhYbEZsVm15cUhveUxJR0FIRE9NV0R4b2d0VHVZSVppUkNHVmtkK094enEy?=
 =?utf-8?B?dWc3UTJQWGNxQjN2eTJHZFRWV05BN3dTMjlZQmxaS21VbjRyV2xLcW1aODla?=
 =?utf-8?B?TE1XeUYxTlBmdzBIYUtoYWJyUjlzQ00wU0RraWZIRVZVbXNtWUdYMXhpR2Zr?=
 =?utf-8?B?ekRJZ0tCbVZDVXROdGpSMjViVlBPN0ZIQ3U5VnB1dVdiYVhGRlpmcXJyTmIy?=
 =?utf-8?B?Zms5dGhVSFV6WEZrbFBNdUlZRGVOcGhFWkFuMTRyMzdocXlyemo5dlNIR2Na?=
 =?utf-8?B?Yk5TdWt6ck4yblhwKzBKaktNWWNvdS9ueDNGSEIzNVlCWmZ3Z2RhdXJDb0RV?=
 =?utf-8?B?TXpORVlSRUpzVEFSWFh3eW9ZaFFSR1pGZVI5Wjk3anNnZFB0YllLK2tNdFhU?=
 =?utf-8?B?L0ZoVWhaK2RkK2R1bE8yRFREd0JvTXgwVWZ5ZitidlRudHZhYjlsY3haSDAz?=
 =?utf-8?B?Tk9YdXRSVHN1WkJoZ3ZCc1gvQlA0U052QStJRFQ0ZzMxcWNHeU0xOEN4UTJl?=
 =?utf-8?B?dERaM2E5RVphMnZHVERqU0pVTWZmbFVXWTVHcWJJYnRXRFBRSGZQMWRDVzJD?=
 =?utf-8?B?ZWNLV2txQUdlY3gyNllBeTBKVGFzdUdpVE1SRXRGSW5zeTREOFFBM1ZVVUE4?=
 =?utf-8?B?VUsyNVJpbU5VMk9KY2lSODRqZnU4ME04VFFVM1JBK0dCaTl6TmdUZ2xCNHpM?=
 =?utf-8?B?SnZhb0NkQW1pOWJ0c1oybzEyNGVoNnovbXR6VVhQNXMxM1FIRlNOQnI5cExu?=
 =?utf-8?B?T3c4MW91NnhXVkRpbGxlTExHOEhyZEVJeWc4RlVmZGk4a2QxaVFvaFFHVjJC?=
 =?utf-8?B?Q0lWVmZLMmc3dThPdVNlQTNHYXlqb2hvc2ZESVRteDZUWHkydzlNUzlGUzNl?=
 =?utf-8?B?aEtHYkdZM1Z5cFVkWDJoTkxiR21KaTlqTnJHMmE5elFiWDFrQWVsbHE5T0JD?=
 =?utf-8?B?TFVydUw0dEs4YlQ5VXBVU0JXR2MrWUltcDQ2VC9YTmIzVkNnRWpHUm9HRG5L?=
 =?utf-8?B?Y29lRG5CMDh2OTJ2c0ZGTUx5bzB5c1l0ajRlV2laQ1FmVXUyOU9rY1hSSTM0?=
 =?utf-8?B?dUFmQ3BIa0tycmlkbGtRYzNiTUtmdDN4enpnTEZtSHBhOEgxQVdTLzgxV2Nh?=
 =?utf-8?B?Rk1UN3BUU1A4M2RseStHbUNFdkdUYkIwWldwUCt2bG0rSzlMczVvdmx1WVdl?=
 =?utf-8?B?VnZXWjRuNGdpZVA5N3dieWJzc2xIMXpXM055c3J5YkVaL21WaTJseGtHc200?=
 =?utf-8?B?RnpnT095TkkxRUh1cklWSjBNNW1qbWpzbHJSdE5tS2QxNnZXcS9FWXl4UEZM?=
 =?utf-8?B?UjZRUDkxWGJNZFVsd080TXYxZHhKK2NOamNUbFp1SGRwTWZoSVNGNGpDNXJV?=
 =?utf-8?B?MXVvRjRVRGdMMW1maEJjT1Z4MThPaTZQTEhMM0s0MW5PYVh6WTFBWkQvZEQy?=
 =?utf-8?B?K0NidUNHMXpWd1ZLU1p2K2hGVkJ4T0VQUXBzMHVXajNnVnNCekJ4bVZ0dWNo?=
 =?utf-8?B?RndSYXFXWjU1TDRoWkptVFZCNTNiRFNGTmtZMUNzTVpZV2hhcmJ3cXZLU2Za?=
 =?utf-8?B?a1NUMEFQUmRDNjFGUGs1SEpCZ1hyQnpWQmFRbndvVlFyV2E0MzJJUWpnZjhn?=
 =?utf-8?B?OFh1SjY3dWFXQktJclhCaFNwNFA1K3NMekhwazEzUHR3MzFmWStmRnMzbzhV?=
 =?utf-8?B?U01XdmFkNWFIdFpKV1hnM1ZLNFJIZ2JodmtmU0QzZHNYOWhiVDRkcWV6bU81?=
 =?utf-8?B?eTJxd0k1TjVjL0lONVMrU2grQ3QvblNYeGE4dmRiREM2L2pzV21kWHBOS0Ri?=
 =?utf-8?B?a25JcmNVYS9QdXFUZk43aU10NG5jUkV3b05pWXFxSDNyN3hyeHJmQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4A5A20EAF34994B9293C3067382A61F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7faba2d-396a-4d0f-c9c8-08defe1b0b82
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 17:55:24.3229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfLjZLd/vQMf0vRVNEbrHYDbk4I68R5KTHM7vuQkMr8t0vRVyUR2r9Th+vLheAIumUHg/vJodqhH0IuEyvg62A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBmaWxlLmlzX2VtcHR5KCkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgbWF0Y2hlcyEoZmlsZSwgIi4i
IHwgIi4uIikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgZmls
ZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ieXRl
cygpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmFu
eSh8YnwgYiA9PSBiJy8nIHx8IGIgPT0gYidcXCcgfHwgYi5pc19hc2NpaV9jb250cm9sKCkpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIoRUlOVkFMKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KCkknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIG5lZWRlZCBiZWNhdXNl
IHJlcXVlc3RfaW50b19idWYoKSB3aWxsIHJlamVjdCBhbnkgY3JhenkgZmlsZW5hbWUgdGhhdAp3
b3VsZCByZXN1bHQgZnJvbSBhbiBpbnZhbGlkIEZJTEUgdGFnLgoKPiArCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgc2l6ZSA9IHVzaXplOjpmcm9tX3NhZmVfY2FzdChzZWxm
LmdldF91MzIoYiJTSVpFIik/KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IHNpemUgPT0gMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBFcnIoRUlOVkFMKTsgLy8gVE9ETzogVXNlIEVOT0RBVEEgb25jZSBhdmFpbGFibGUuCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9CgpGWUksIEVOT0RBVEEgaXMgYWxyZWFk
eSBpbiBsaW51eC1uZXh0LgoKCg==
