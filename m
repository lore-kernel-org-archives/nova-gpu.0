Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8D3C2795
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165901; cv=fail; b=oe7FbB1bq75nKujXUgfsL/kDOQOioYP+1vWGGHj6FgBtxZnt6c6SRo8Rd0WmSApQQL1rcRuVA6ElQkuFKSZ7Rq46dqrNWVO5V7VgKZrZL49ukkQXBgL5gPMfdZ1rEQCaG+OmPgvTq9BAIAv3fMUw5+G4h1bbo/fD7pidioJLDYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165901; c=relaxed/simple;
	bh=THRd79pEQ+d+cgfiFKHVdCEhGElQTfhgrhXg5W16oUw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LHX4ZNRQppaL0KkFn+R+k7qFPXgOCWIgn1Oy9SE73ZFr7geoJyJsHxUxDZ3funZqL2BBNykxWF9TuHMs9J10O3Z5xO1UIgR1p+W5OAby3rEq/dmFwNjtDN0IdqyVdtLDeD8F/UJ1WEbMiXlVf/iJmtIztwalQUDHVzM2kdWTZgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U9ma9e3I; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U9ma9e3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCNSrye89kMFEgDUWHG+vy5jvHevIN0xH5lsCV9ig0sVGPg9r0D1M61Mp7lNiS5Z8U6LC2Ic3H3N+JZTGeZ26P393FktqCrcWrbWRxzzA46nnVWEKU/gra+d+2nwOxc2k5DT1hB34CHLjubr/E0TEdHJMrJGoX/E5LXNNJIs6D62p20Z+J1KXYLufh2E1aHVHBMwGsujB1N+YBpddyLfXWDKRRDpLzMohHe0zjLAX8EukGNzieG7khKJk4D+6B7ymnKYpEwCDZN6JjAGNdvKOv1TeAeyMjP3mV976IKs0WT0CvNbSVMVT5KMPJodjrGDbS80V3w36KjKTAyX5rejjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THRd79pEQ+d+cgfiFKHVdCEhGElQTfhgrhXg5W16oUw=;
 b=KECAc4w3ybYzKWyl/ES25gJ5fhdn3Re5mkcVbIa09cFwL5mld0z6tf5a/OkSnpkO2D/rmHXrw938bgMKtEMlAnzcThWc3MAfvPLkSCwWytkTaCRKh1lDH9FMGDQtMETuIgrSiY1iiZfN+XfKPR8LGjhS3RkmN22DbKqGe/Sfmam90pIeujJ66wLgcKgweCmJxwpxEz5jtcKAZjJsRPqIRmIxuhRZU6g7b/3IQiBr/PrfLspPEiW8JWAE+bOFHGq4S/F3Nc5wRcnErr6zzjXO5siM5gNZ8yQ5iYh6l74xf4mnI49c5q/yUByiciG+AQ0r5DrBQ9V/cvF/KhE0MEoAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THRd79pEQ+d+cgfiFKHVdCEhGElQTfhgrhXg5W16oUw=;
 b=U9ma9e3IkZt8kpH3wXunbPMipwmZmo12zxiFlGwZidqUA6TB72xGEAoLVAj+QcHC2Iw5e93caiqA3tfDqZxs36e4GDo2PM0mTcrYKogW3sK+4JETnRe+jutcMGGNN6At2swjk5jRl1ICmF63C1XU5NIYc5pGWmmaw430mojTzmzs5lJuo1ZBjl6XjCWTKzqlm+iM2jY5pTMlz8F5NizbJk1x1n5j+2cFOkySqOi35pI/Y+KPIu967aT7I2Uy/4YTFSiYEm08DYMxMHrUQIXEI55wbLm/GRyocNypTasvSki2yLXAYGjabux9EUCzLBiE0KYtOZvPImBfhjb8Htkfqw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:58:14 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:58:14 +0000
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
Subject: Re: [PATCH 25/27] gpu: nova-core: switch to the r000 GSP firmware
Thread-Topic: [PATCH 25/27] gpu: nova-core: switch to the r000 GSP firmware
Thread-Index: AQHdL44+JUxIxpox1USRI5cHOPMIFbalukKA
Date: Wed, 19 Aug 2026 18:58:14 +0000
Message-ID: <4fc0dc43c7d63158fe4ac6dc0ef375f8a3992a8c.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-26-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-26-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ1PR12MB6194:EE_
x-ms-office365-filtering-correlation-id: 41d522d3-1102-4106-d3df-08defe23d288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 D1QYE7qca7EQdhj9ALj2+ZPubAZApYWnxrOGakTwckgfFCVXQR0tZjWToUBTeuX2CMYNfral6MrN3H4QCMslIeNhB1OSBvf1950VSt/LWhVIUnJRZNdzO6BDJyGBUvX4iyJmGSnGuMsTBNKHn/nE53NsAkOe58f1Ak2deEjEDfcAlOCPl+3BUiK0esbOVh7AgHvUQx//PMN8X9yhEkaVF+mfbRWc+ntmtdVNnn82F71PB5I2wlfCPa/Js84LljIyj5HSdxsWlus3o9DOeMCy1h037eGPF14IWUBbQlAuizJuh/sfwJSUHhU9ICzLaAd0+tElvWnMPZiV84kxahvDKEnke562h1GO7po2m5DtHoQsPyYOptZCK4ZYikT2luZHT7ol6ltDUBqwNijBVyqoxwKGCFovktt2SAZ2a/0D8SCJphoN3aR/pjayK+9QhlNAG8YtUgJW/jNzKtpmX/bSvgukerYzh7zJVoKG5iFx3UELcdlB4QvFKznmswRFDtSIJ/DuQkHlEZnrKuK4KtM92XMcT5yxO0auXT2adWIECjW5WuCXbtV49FhNI9B+yTzqNPxV6jxAfPkQbN9Uf2ypBjGp0RG6KOwfGCJ2eBv+yvof9IcCH4ZhBYthFDi/3mZEUFpxJYoLeY5g/7+79ctMEHdvlrInSJXTf13Adbr5Xm2TZv81Wtwzy/MeSORe0Xj164OSEvBr7TV00b5EQl+bsg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzVoNjZUN21xRzRISVBQTmJqWjE3OHpvdGd6alZNMHhRVW9Rc2o0d0s1enhj?=
 =?utf-8?B?YjZ1ZkRiZkRvNjFnWEVidFVvYUwzcllNU3pmVTBJVGZCYmxqa253bGZ4WWEz?=
 =?utf-8?B?WFdFQTNmVHcxRnRTbmZLd1RpRmhQWlQ3bkJWbmV4eXVxVm8yTEJseHJzUVJs?=
 =?utf-8?B?ZGEwWmFHaHd1MzB1Tm90VTZTS21aUS96UTJvajkwOG5zdjVBaTRZTjFyRUJ4?=
 =?utf-8?B?bExoQU00MkVJV08rNFMrSWwyekxrRFpJVjkxUFRaU3p3bURqcU5XelV4OUZm?=
 =?utf-8?B?cFlyMEQxcDdHT0VCWVltUXV1UWlDTUJDb09SdWxrekgwWHJJSXd1bnNWckRL?=
 =?utf-8?B?MnNLOUZXOVVFUlVYOGpwRXZHa2pEOHE5OTdjOWVWS3IxYjU4QUs2amZyaE1I?=
 =?utf-8?B?Y2QvSmJiT3d5Z3JjWHd6ZU90QUV6anh3a3hkd29CS3owUWVlY3ZYcnVoTTNG?=
 =?utf-8?B?VnBadUZML1NoUkxVR3JzRmpNaEZqRTdub252Vm1XOXBQa3lpL1E4aldiMlJy?=
 =?utf-8?B?Rk8rK0NTRzZUWUVkb1dPdklESkpwK1A5K2s2WjVGU0krTGYyLzVMWThmeWZo?=
 =?utf-8?B?WGdUdWZ3NjVuQnhncHhGbkdHbHhNWTRYSmQ5NHQrY3pQazV3SVQ2UEJscXps?=
 =?utf-8?B?RFFHZmc5cWlaRmdQZ1czRDVxUXFUcFNBQlM3UzJvbHF5NlFKdUlDQ2ZpR1dL?=
 =?utf-8?B?cUJLcjBYYmJDVWdCeHJnRTlXdDBUNXVlRE82NzdHOGtmTFVna21RVnMxbFFh?=
 =?utf-8?B?d0xmeWkxOGtoVUt2OHI1RG83WE1SUGVXWjY2b053MlEzQzlXZTBTN2VFVWlT?=
 =?utf-8?B?WHpNZk83blpzTHFicEN1c01IeDJlZzRTSXFyaFhPTlg4cXZWVS9QdXlYV1RU?=
 =?utf-8?B?MHRRdzZnVXFsc3hHWVNJandIaGpoUm5RZitIeXJlWjBNSjdnWjhrdjRMREpX?=
 =?utf-8?B?c1VHN1d1bjMrbmRTQzdoNFVtUCsvbU8zQW0zcUlDRkQrVmpOejVzK3ZOU3RC?=
 =?utf-8?B?NnZTQUowOGl5dm1HQjZneUVOMzN4d21JSllkcmcvbFRaT1FkdXVIQ0lxOVJC?=
 =?utf-8?B?MDdDQjFyTDdMSmpoU0s2YmhZcHFHZzlnTWJsZTF4ckhlTkhKWDRkckxNRGJB?=
 =?utf-8?B?dkZ4aGRBaHBNVlA2WWpVc0gyZm0xVGpEU3BWeEhFT0R5a1RZYUdUZ3daOGVi?=
 =?utf-8?B?dFdvdnk5WWFsMDA0VnhwUy9SL0ZaRjVEbTRETlpjanY5WWwwN2pTOWgwcG81?=
 =?utf-8?B?VGRnNjdZem9zVU1UZUxPUmlKdjJPR09aYmUwdEVBRTRLYkZJaHY4ZVlVamkv?=
 =?utf-8?B?czFpYmRMdU1JK2pNRmk5U0VyQ2Y3QmlQcG53dWZXcGdTdDcyd1U3YmxYT0hh?=
 =?utf-8?B?U3Bxd0dSRVBjRVdiZkNGSTJXejVyOXNGQ1ZzbjhQb08vcWpyR0dFN015UnFJ?=
 =?utf-8?B?MGVOTVdLQllJbE1DTFBEUEZiWmVrZVVsWVZWdzJPTUVGUWN3M3BjZmhSKzZx?=
 =?utf-8?B?Ty9ocHlEVFRKczNJVmxCNEtDQXNjMUtBSG1KTHcyN2pLNnlMYnlyblVjSkVQ?=
 =?utf-8?B?TWRaWDg1eXM5TTZNUGdFd3hhSnN2SFlsckZyZ01Da011eVpDY3FNR0Ercmh1?=
 =?utf-8?B?cm41VHkxZlc3cUZXWFVVWmxHNEYwSkd6UlhtbzZjNFZDK3lVYzVjaEE5NFRZ?=
 =?utf-8?B?RWdDd0FzK29ueVJib3EzT2F5ZmZMNm9VeWhRSnUwNzBPVTBjRWt3d0srYTdC?=
 =?utf-8?B?eTBndFJENlJPSExTbnc4NEpNVUFkbG5SS3pPT0ZxblF5dHJrVWVPVGQ5M2F5?=
 =?utf-8?B?a3lOT1gyV3dpQVJ4WmZoTjIwbDZ4SXlHWDZtWERBV1FONkxDOFZ6bDNMdHJ4?=
 =?utf-8?B?UlJrWE04THdvNkJRa2hQRkdna2d4bnNXY3VieWtmVWx0ZTllSm5XbVdlNEpn?=
 =?utf-8?B?UFFxOUNGbmNwdUF6bkozL1hVVEJLU0VTTnpWME9vWEZBcTliMFBGenNqV09w?=
 =?utf-8?B?WGNDR1ZwOFN2TitLK0JBRUlPWVNZU3VZWGpzV21GZ3FhSnlJZi95MTc5NU4x?=
 =?utf-8?B?UFpkVklXa2tVeHR3QWJpdVR2cUR4VmlmRVU4OEI0UjVKaGdDUG1JS3cxeEdQ?=
 =?utf-8?B?Q1J1NWhGYythUzUrQm9kTUh4eC91TnZORE1tcXl1SUFzbk1RM1p6VllIaVRv?=
 =?utf-8?B?UG4xSDF0bU9uUzlEYnpiZnRMbjFHcmF2bG0weDdsU20rbXZvSllZeE9xY05M?=
 =?utf-8?B?YU5FWmhSaUx5R1ZqNXljMldGNUJBanl5SEwzQnRvbVQzb2ErS0UrNnlhNlhT?=
 =?utf-8?B?WThMV1dKV0dFbFFVdnpLVnh0cStXVU5BeFlrTHpqMDdFMUlzSms0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5FA56418108F84499B051AF89858529@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d522d3-1102-4106-d3df-08defe23d288
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:58:14.2409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQLeEKF1XBAK+DECF7MTuKFVodTLTNh8DOx5fQsB0xwEOVltpw9tYXrUQrtxu7mMs8ZFFd8VH+7qABpCIrWuwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6CgoK
PiDCoMKgwqDCoMKgwqDCoMKgIC8vIFBlcmZvcm0gdGhlIGNoaXBzZXQtc3BlY2lmaWMgYm9vdCBz
ZXF1ZW5jZSwgYW5kIHJldHJpZXZlIHRoZSB1bmxvYWQgYnVuZGxlLgo+IMKgwqDCoMKgwqDCoMKg
wqAgbGV0IHVubG9hZF9idW5kbGUgPSBoYWwuYm9vdCgmc2VsZiwgJm11dCBjdHgsICZnc3BfZncp
Py5vcl9lbHNlKHx8IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4hKGRldiwg
IlRoZSBHU1Agd29uJ3QgYmUgYWJsZSB0byB1bmxvYWQgcHJvcGVybHkgb24gdW5iaW5kLlxuIik7
Cj4gQEAgLTk2LDE3ICsxMjIsNDEgQEAgcHViKGNyYXRlKSBmbiBib290KAo+IMKgCj4gwqDCoMKg
wqDCoMKgwqDCoCBkZXZfZGJnIShwZGV2LCAiUklTQy1WIGFjdGl2ZT8ge31cbiIsIGdzcF9mYWxj
b24uaXNfcmlzY3ZfYWN0aXZlKCksKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoCBzZWxmLmNtZHEK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2VuZF9jb21tYW5kX25vX3dhaXQoYmFyLCBjb21t
YW5kczo6U2V0U3lzdGVtSW5mbzo6bmV3KHBkZXYsIGNoaXBzZXQpKT87Cj4gLcKgwqDCoMKgwqDC
oMKgIHNlbGYuY21kcQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zZW5kX2NvbW1hbmRfbm9f
d2FpdChiYXIsIGNvbW1hbmRzOjpTZXRSZWdpc3RyeTo6bmV3KGN0eC52Z3B1LnN0YXRlKCkpPyk/
Owo+IC0KPiAtwqDCoMKgwqDCoMKgwqAgaGFsLnBvc3RfYm9vdCgmc2VsZiwgY3R4LCAmZ3NwX2Z3
KT87CgpGWUksIG15IFR1cmluZyBmaXggbW92ZXMgdGhlIHNlbmRfY29tbWFuZF9ub193YWl0KCkg
Y2FsbHMgdG8gYWJvdmUgdGhlIGhhbC5ib290KCkgbGluZSwgd2hlcmUgaXQKYmVsb25ncywgc28g
eW91J2xsIG5lZWQgdG8gcmViYXNlIG9uIHRvcCBvZiBpdC4KCg==
