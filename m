Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544840;
	b=z0oJApPHN1tniZOSkJ4BAUDrDImxM8tyPnVCFD4RYcrzp9oeOSGoUDjm4ToTtaqKi55I
	 EPnihQtYeIjGAeqEmkj/MX+zAC9B5jgVpJVVRxXkINp9Wheq89jB8QbQWqNCxR42f6vtY
	 dcm7+HymQ6umqNql4tW91i8eq8EiPF+mhe+JRxyY2CecrIZQdhqtxXB23GeCnIeWMhwpW
	 w7ScJz+rBAE8Odug1G+l47K5zdQolUtJQviSlBTJB+aLbXJa+6Ur8s6/d+214nsm9dpB2
	 f2YBP0fOdvP7pE2qZ/g0QYAGHj9xgoXvcArzrxlSKn+wbY7gJ01NKAiDLMBlssKAykw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544840;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8Bfd6/6WeA5v3shdARBjhcpydKyfkWLMy3x5SZ40RaE=;
	b=UMDw/FNmp3A48afdwLYCObX1LerieNCgBsWpJzPJL5drJ3i2piHmyzIN7edWWho8q8qd
	 l/o9RTmrgawnx1CZ8UklCaMmeoYJOlGKvqX1Sak/NTttmGbsAo6c80gCOgMjKG1yTeyWf
	 mCAOX5eXXBmLJsVPBzf/lN55nmHTuFLifULBjoHuoamuCOIX2eeQMaOcPgB7TPmxkq/xB
	 BZAsvaArwX715DJI+tIjfLnUwMXumQvWrDzI/3vp2zz0orZBsRsmUHkVjR23ujcPMC8qo
	 OO5E626YNUEXg92+2Oowv2YRFcCO/NHYnO2C+dIilCgZAwW0ZDk7OhIY5OWoAYN9yaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nI1r0WzV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70730606A321
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 18:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70730606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nI1r0WzV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iy0DXD0c4gd/mKJwt7Tfczvo5hnxjLCtx6rM9fEEQ94I9KnCKVVg2f+4t4Xm6hGz1EOu4hOOqWEXDdZiDzO1+UWIlvlnHAIZJ8VzxEW5AuE+lMKB8jQLkrKwvqMejS2qJE9cbvLX6UrjJFyOc5yFdQ7eKJRrecA0Wvx1RhVWyAP87YgJwu9Sx90rpm3nlsf61NtwmKAl+neMksfnqJMADHkFCL8260Y06KynT4ed89pS6gsJdgG0zEeS7/I/Rjllk9dcm168A2dLnBtbVj68NvcM1oD/lCgjyRXLjAuCIT6l0pJBN/xuHJK9T5jCcxNxI0L7d7zo8XaZ/88wMLPyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bfd6/6WeA5v3shdARBjhcpydKyfkWLMy3x5SZ40RaE=;
 b=aX2pFhcm7HtcxR1LeczAR/MKXa8ynWecnwo0Sfe1wEHMQk8Q9DJ83J0OfCDL/rVgqJB+WLrj8ZdkV3WjQeroTOwsJ3RQea4Rx3knRYHc035JEZLVgz5FO9zhMmp2XqlFAHyPuyzYb2C8lGzTATMY+IIb/qb7QyqCRtWoIvawQKVekbhKGVFPN/vhENrIPGD80Ckn/qSsK8cERORxUFoH3CQWTIGIXWrqAMgkpZ0kXfmiNnD/Y7tcrmLebpH2u5cTZFs+tAZy13m/wWkc6K2N1Yx1MOS9uonloOX4LNla5HYgUyjwMBGF07kJ/1w+o8oUq9lFH/qcVNKJC7f9yYspkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Bfd6/6WeA5v3shdARBjhcpydKyfkWLMy3x5SZ40RaE=;
 b=nI1r0WzV7uNDN/YXoKNh6bB45DbXdy7sN6ziMJTAbG5z4x4fM+WBM223f2hVFkvTR4iYoBbys5OXJKVzCIapDxcLel9/Hy+itw7dIyjXcfLjVpLJ3M93m5oiXw6uOrUUsuh3aAvPb3VG5cGeUNUaj0972DHwrUcfA1ep1RVXIzyjl0K4VrmP/+7jmKB0C+kw8uyFb8xhkfrD6y6hJg9kViA7UdgcAHZhU31WgbqHwt+Bu66qUIsI/+Ww2N2MyLkqBFkJLlBQSlFv/SzfrEVDN6CfBrsiXEQDgoF7PifSeLg3l2X1Mf0Bd71mt/s/l+3OGq3au2FJIzqYf3umwdqsiQ==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 18:27:14 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 18:27:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: read GSP heap variables from TLV
Thread-Topic: [PATCH v3 2/7] gpu: nova-core: read GSP heap variables from TLV
Thread-Index: AQHdeU9d7gszSRaHsEKwKgzeObSpoLc8zPWAgADDRYA=
Date: Tue, 24 Nov 2026 18:27:14 +0000
Message-ID: <eb1e7d862c7fe50e3e6008d42aace8a823a54666.camel@nvidia.com>
References: <20261121002847.3358679-1-ttabi@nvidia.com>
	 <20261121002847.3358679-3-ttabi@nvidia.com>
	 <DN38NOUGQZJA.WRLJHU4M2TWY@nvidia.com>
In-Reply-To: <DN38NOUGQZJA.WRLJHU4M2TWY@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB6958:EE_
x-ms-office365-filtering-correlation-id: 6357dfce-9a2f-4776-eef4-08df4a588fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 cBTUu4kTvRoBnhzolyMOPQbgW3YKhmQM+hMw50RR5mDXiVTBaRVsQeQmG0wyROAyMRJENjJFLBoRJAYlpTU/lxj4KXflmOBHuFXQVTytxvLkNfzmLL4P8OYuAK/AxCCCT2BV9KhbMGq+wry27eSn5a9ROc+gEy5fV1WEtikC9A74yVy+3n+cwi3jdNSLXYEap2PSWWkxvqjB+S//JOmeLXzGE/bGNsuXEQ2iTl8KkKe1ajR7Fiyo0fXgl1/70F6q7DRb02SeHRJY68tIOPUtpm7tBGRsEsYQZtIMIgv5YKG3Gj4mKqMt1YfFUDwZJ8SJiUVy87M4JIlPCJ7oF7hI7uYY8lFFteivx+MAlUwW0CJ7pqYpTigAnltcl8XPYHxL/eXrZurFTcRyJrmh68t0q9VVSL1UTe93fJWi6xql9eadr98gxZgyZNpZ0+QlEiI4A6H1t9L8oCWuulcTkTRiM0WaKn4gnGWq7E7zEVBXVET7UwE7gCeOpJ5HSmw5Fd1GdiJjuKU0j1Zf6VcuPb0JG2SSPQaDoFj17++4ifbCuk6ZxnvTpIZf/G6niyy//TNejD2RJQNY2SKuStMbEmZy7n6iPfHG3Dk5daHTM1bHgF/ERkARtJxu/g3KHDboSw8T1CLIahfcRBHXkGxWaeWoGIqWQtcoFIAjRFAdwWNW5T66DjpK0QxMDY6zZbvAXg7epjRwgiYguQdL3DNQ/POg1/PDVJ5HeK3LBjK/UJEvI18=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVoxbmFsTVBMeXBUNlRlNDVmcUxJZUVrMTN4bU0yQ1VETDZ4bVNJeWZpTXBw?=
 =?utf-8?B?eStBSlFXdzUrakJoT2x1b3VYcmtHUVY5dkV1bVhwTEg4bnVXZlM1ekdxYndr?=
 =?utf-8?B?ZW40R1dwcjhFYU9GdDhpcW1xOStVUkxPZ0tvQ2JHOUFBcCsreTFUckd4dC82?=
 =?utf-8?B?TmVqeWtQVzFUN3h5YTFxWjhyREc0SUVnc0JPNDNkNFJBRTRFQVNzNGlzN2kr?=
 =?utf-8?B?YWtxby9kT0o0L01nMUMvMzRsQVlkL0Znb2FuWkNVd3VJTmw4cCsrVGpoQ3Br?=
 =?utf-8?B?dDZVekd0eUw4OUVldFhVNnp4TUVncHR1M2dTeDVnb3FaZE9MOUZPai9sVkRZ?=
 =?utf-8?B?akp1Z0dVR0tmY0N5QmFkVlRqbmtlcEYzNGtlZXhIL2ZoS0xETzVJaExqbnlu?=
 =?utf-8?B?UWF4N09qU0JyWXI4bnM3d0xvNG9LNGdMbGwrM0hqME9qeWsrWnN5MGkzbU8w?=
 =?utf-8?B?eVpjQml1bjU2c01jWW1YWnJOY0RzSjdsZWxCQkdmUG95KzNKS2IzTjA2bzI1?=
 =?utf-8?B?MFBDY0FNN0orakxUZmdVaExNODh3dmcyWnBDWndmV0VOU0ROWXRRNHNtNjV0?=
 =?utf-8?B?QXpsRXRMNHl1QUhWYm9jbmZjb1ErUkRxZ2VjeGg4eW5RYjFnbjErUS83M0JW?=
 =?utf-8?B?bjlMVm9YaEc4UzBScDBSLzBVY29IWnd4MDZ4K2UvRnpsZ0g5bmZoSmRseTdm?=
 =?utf-8?B?ZXl3RDFwL0lwQkhXN1pXaWNvYjVFOVp6NGx0dGNmSzN4MkJSS01STi9NWHR0?=
 =?utf-8?B?STFmazIxUE5PMWg4cFhiKzZPbmN1aEVicHNjNDU1S3lHZUluNVdTaE4xdDFm?=
 =?utf-8?B?c0dDQThTcTdQWG9OMXBndmI3bCtsZGdSWTg3RGFTS1FSSHRJbWJNZDJXMDFx?=
 =?utf-8?B?T3pFZjhPVDZzeERSeHJSRzgwN01SSDlHRW9wblRoTDk3YmdLRHBKY096VDdF?=
 =?utf-8?B?TmFnakJ3NWt6WGc3QXNMeHlieUMzZWNuV0E5SEhySU5tTWkreGdBTVFTK1VH?=
 =?utf-8?B?TWxpSHpsczZFQURtNVo5aTR0RXVXbUdzK0hNNjROYjlnUllmaE82aU5FN3hQ?=
 =?utf-8?B?NDR1S1p6R3BiNUhPRGlrSDZLd29RUjhaczZ0Tnd0eXZnckoyelNta0lRUm5C?=
 =?utf-8?B?UG9jVHVLWSt4Z3JQdnpEYzVHeXhJZEg5Z09OUkRjUXJhWWhiQlVyS2xFZDNS?=
 =?utf-8?B?dHJnOVNkbHhXSFNkZGdtalUwaTZnT1pYSVlKNUV1L080TUFCdnNuMzZSTllw?=
 =?utf-8?B?MStRMDFvRlNoY1lnV0JiZURyT3dsOVJNLzU0Lzc1RmFDYTlEQ0xMVGptR1hx?=
 =?utf-8?B?V0Y4MEVPb3JGZXNMd1ZmZzY5LzZnNlVlaWgzZzNKWHNBZG44S0REOEhia0Zp?=
 =?utf-8?B?bUUwck5PT2J6WUVyVDd0WnRURjRTRFpsUVpqRnpyTUlTMFFsaFpVY3NQd1Uy?=
 =?utf-8?B?b25MOXF0c2xjb1FNbjBUMU5zRkQ0TWhSVjQxMkVEcEFjZTl0dGdJQU9wcFhD?=
 =?utf-8?B?TURLZS9JK0NheHNZQndEblBESlFyRW1SNEIwelNraGo4YjR2bFM1a2pZWm54?=
 =?utf-8?B?WlErSDVvQlZtYWxSb1ZNMzlWcFB6blFMMVlGNXN3NGt0OHljaVVWdkVaRkRk?=
 =?utf-8?B?d2l1eC9HbHJzL2R6R05nSkFmY0phUzV5R0hLWGR6dFFUV2ZwUHk5YnBLa0g2?=
 =?utf-8?B?emhaeThwTGRhcnllTUZPRkRubGlMV21DYVpoWnJlcloxaW53ajF6b0J0SEJR?=
 =?utf-8?B?WXNQV2pmdjgwN2dVdFF6TkwrbmRqOE9OenBKUEhzT0NmYk9ZbGVSRXpZbVFC?=
 =?utf-8?B?ZzEzL0ZyWWUvSUg1SnQ2L1o2dGp1WGV4ZmZrcHVnSThFcmR2UWhhTlhnVW5N?=
 =?utf-8?B?V0lUeUtaMFVrZmVHd1M5QWV4ZGdWTVhSYmhFYk1qUTJibkVHTkRBQzV0Q29z?=
 =?utf-8?B?VUN6TkRzU1V6SGZXMzNvSW1qUUM1b3lIY0lmWGVWY0t0amRCUktPMFpXVzNT?=
 =?utf-8?B?RjNsTWJSdm5wMk9QcElZemkrVmRmaGFRRHJpME9CSHA4TXJZYjFKT3JJcklr?=
 =?utf-8?B?WlFESWZabWpmbDd1K3I2dWVENitIVWUyYjlPL2FheG9JSUVOclRJYmhzQlpo?=
 =?utf-8?B?K0NDeGh1ejVSYytwVG1DTTlmM21aaGhib3dFM1VPNjU0V2xUcThVVXNJQTht?=
 =?utf-8?B?LzErSjY1K2ljRmNMbWNZV2xEZXMxWXd3dTlpRnQrWFhkQlFlMmRhVldzTGFP?=
 =?utf-8?B?ajRONDdWOURKUHVGQUFXVGphUHJmVXhUUStSTWp2RndiNXp1RHppWEhmRnNi?=
 =?utf-8?B?R0VQUFlTRzRNT0ZzNmdvSFA3eDlaT2lOK0NiRGJMTG1XMy9GS3ErZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <241D93AEE297AC4CB68D8108BF40F390@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6357dfce-9a2f-4776-eef4-08df4a588fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 18:27:14.0669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWc20/6SD//8aHhtVpPfCDQCCSpKgc+Y5pAZKMhh03RY5gPB8yDdX1lE7BxiUEkQhRED3Y6n7hWHynQtJDTi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

T24gVHVlLCAyMDI2LTExLTI0IGF0IDE1OjQ4ICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gPiAtLy8vIEVtcHR5IHR5cGUgdG8gZ3JvdXAgbWV0aG9kcyByZWxhdGVkIHRvIGhlYXAgcGFy
YW1ldGVycyBmb3IgcnVubmluZyB0aGUgR1NQIGZpcm13YXJlLg0KPiA+IC1lbnVtIEdzcEZ3SGVh
cFBhcmFtcyB7fQ0KPiA+ICsvLy8gSGVhcCBtZW1vcnkgcmVxdWlyZW1lbnRzIGFuZCBjb25zdHJh
aW50cyBmb3IgYm9vdGluZyBHU1AtUk0uDQo+ID4gK3B1YihjcmF0ZSkgc3RydWN0IEdzcEZ3SGVh
cFBhcmFtcyB7DQo+ID4gKyAgICAjW2V4cGVjdCh1bnVzZWQpXQ0KPiA+ICsgICAgdGx2X2dzcF9m
d19oZWFwX2Jhc2Vfc2l6ZTogdTY0LA0KPiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiAr
ICAgIHRsdl9nc3BfaHdfaGVhcF9zaXplX3Blcl9nYjogdTY0LA0KPiA+ICsgICAgI1tleHBlY3Qo
dW51c2VkKV0NCj4gPiArICAgIHRsdl9nc3BfZndfaGVhcF9iYXNlX3NpemVfdmdwdTogdTY0LA0K
PiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiArICAgIHRsdl9nc3BfZndfaGVhcF9zaXpl
X3Blcl92bTogdTY0LA0KPiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiArICAgIHRsdl9w
bXVfcmVzZXJ2ZWRfc2l6ZTogdTMyLA0KPiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiAr
ICAgIHRsdl9ub25fd3ByX2hlYXBfc2l6ZTogdTY0LA0KPiA+ICt9DQo+IA0KPiBJIHdvdWxkIHN0
aWxsIGRyb3AgdGhlIHRsdl8gYW5kIHRsdl9nc3BfIHByZWZpeGVzIGhlcmUgYW5kIGdvIHdpdGgg
d2hhdCBJDQo+IHN1Z2dlc3RlZCBvbiB0aGUgbGFzdCBzZXJpZXM6DQoNCldlbGwsIHlvdSBkaWQg
c2F5IGxhc3QgdGltZSBpdCB3YXMgYSAibml0Ii4gIEJ1dCBzaW5jZSB5b3UgaW5zaXN0LCBJIHdp
bGwgY2hhbmdlIGl0Lg0K
