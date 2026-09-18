Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A823128CC
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771739; cv=fail; b=CkEHQvcxlEMhJJQbuhV0kznmY4uKtX1C6462PpbufHNQ5j+dEbaU8qZCvL1NBkwsMr+toHMIffumxccjzLwwdc2KKYKjkLg9uct4dxAjXXwHVJmzu9+BzI4hrMjzjmWma6VD0VDcxKFDnhL+lRnfYOhesjEB2Hc/2rv9cu6314g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771739; c=relaxed/simple;
	bh=waUg78Pxdrgk59W30ZnnNp9Isc6c/MuLiHjAYs3eMpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YKJkl0JBF7t/eqeeBCrB3Rb0cxnsqISz0GuPURLW1jNtGy4aUQBch//Rkf2lAku9XeSgxYxE7O6IsGMTBZDqVHq0+tk2d4ZChLRViFQSAaqtcPGDwipzv2L0axmboopPIoxJKAh2xDpHpj1AITcO8X3jzY51jeRQlzvb/PYit9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OyXcO/vl; arc=fail smtp.client-ip=52.101.56.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OyXcO/vl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyGtWXBrxPdH+TqSkaQ2aGSB8J9cv/Joi6ili0RpsuBIgxuANIJ7Cyj0kWeReAa0W1HbYzF6P24tnixYDq6TwB78d01dxsPeHyZ1MHTK08SUVlcvefZfryiP81HRht3pb2QxlaFe3uKUdTyTi0r1bVbyBLUIRGUiYjLj4rJLQmpdr4qaoJqPgGxGWkOBYvRSVQXiWnn732XMweO5/rKGVxZEC66Er6BSmMcdybTPkxXvG2iGZHAeWT3t/LtFeMxab8vi5K2Quvy6aYlHqYejXJP/j9D1ylJanwEaLbMJCHNHL39rSdzNDOOI1X32zSmgxa6paDRRleby3tG05/4z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waUg78Pxdrgk59W30ZnnNp9Isc6c/MuLiHjAYs3eMpo=;
 b=eDSLJ7IBnQzoT7G0Ka7lIl51ooz0D8HuolCgUcacCojdjQjgLUVlGatyYfC294NC7TOSi1fYSQZCG66ISQQBLyAqONZi1zoaxuwX6PG2sScJXuwUgxkiTc5DHFxHU5wUuDIuXz9PGoBRHYE+R7+0Sj1iKfeY7WuIiLNCrSwKQH/LBzMmEZz4mLOAA52M8DfAk4p26Olyf7LUDnzGZiL0CXgjr9fat2jD4Ap5U3q1XgOP3KP14MJZfCuk2LHECdaSj0R89pBWMX6kEwEcLOxkCH4fMafO2qwtW/G1/ANFXJuaus/nxek4/NWvvPYDxMlrCNzgyyCHumFBSU2pPKZuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waUg78Pxdrgk59W30ZnnNp9Isc6c/MuLiHjAYs3eMpo=;
 b=OyXcO/vlB2ErLYIwSQ2RqUgMUZz+K98RQckM8rryq9Idp8cNl4wmYUEb2Q3lsOjawYtA24dpSlLB72wRRSUgY6Vb7+dMEBihXClZTHnKLYt2XVU9uUY52lY7VDymqG1Q+ZYirVOM1hXhP7Tu419Dj94Ps6rB9FIlvI4dzHWFTAcdw8fGj+F8uak4HB/GDCjEGNZPboLEwdJmKAjFj/Z4HcnG/1iVYIYDcQVEv1upGQxgctQRYEXY3Rx+EuK8GehrHkg5d/R1HdIYqKK7YAUDyBzN2eiyWUZIojl72FZVbmh1SGlYIFc+Uu+M2vAXcFPs9vrouYsoqi2WAh7cWm6TYg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:48:47 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:48:47 +0000
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
Thread-Index: AQHdRwpFpZN1FCVnA06a1Z2w0g4zTrbU8aOA
Date: Fri, 18 Sep 2026 22:48:47 +0000
Message-ID: <9dfad8ed0c689a40828a4cdc4562d067ca5bc3bf.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-28-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-28-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|CH2PR12MB4309:EE_
x-ms-office365-filtering-correlation-id: 8302ad45-3c4f-4e1f-d9ae-08df15d6fffb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|11063799006|18002099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 XGv4PR2F7segXQxpHa+n8pQjU8ykG5LemlcNQ/D3QUHNJ4qunwXgITimjh4P1dYR953HGwKCqxrq51xzTp5c8oCxPAUyLey/BUmbCN5FJOrMuBkfk2Ogtv5+p2L8RA9E3NyxGBh/JMVGGD+gcuQQcg3/Q6o6E8ylAKRYiRQm2ySjAOp2venadx5wJmo6ly6zZ1W3ptxjlr0sSS4HV/ToUjPPbB85RpndmaHHYE+F/qpCL51BiyH/lFgohpTvkpPgHHiKnAXJpjkzIEEoCHTRlwi7ys/10OA5s/Bp0CmRj8NSHeysAhU54VYUybwUqBW+zZnNdDuawXDvL7yMdbgmUZo1LuZMHOVmMJUhT4DorRual3gUKqVWlo9nkL7yw6QP4oB8QZpp+lBSbeKuDBjxFJgSCmS/8tpR/X8kWL0swsB1D9fz5z39YjTGpsAF4r0luxajv601HIvsd3K03kAhHnhi2kCweV4vmujIC3lFRuyuhppST90/A17kuCsUCAhZ9ezQIg92528lb2oXsh/ZLdNaeznKcVE8Z5/J6DiXbsuFKyh9LLYquikD46UzeQlycPLWEGRUGScNk9qr2sYpz9iG3KAT48Vwhh/NsH0gfdU4D6CSTyKeglYFYwsRIJCK7Bz3WlRTPYmvFEo7ZrGwFYtDNZCgNYu6fmW9bP+Qk9fF4WZubxq6ujP0LBd0dVRZorvYvjMlQUoBlHGjm7j0FA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sk1HUTRLdmZ5cUJlMERpRnpOR2dJK0dITkxNbkh1V25DSVFLcVZSNEpmK3Rn?=
 =?utf-8?B?OVVuQ3hBZVNqUHdyck4vTS93VEVReGxSRmRENi9LSHlrZjAvNWYrV2hCTnVC?=
 =?utf-8?B?TzZmeTJoYUFQOVRKNjBTVXhZZ280VkEwMElhcFZ6VkdYYlBmcjhhUHpNTUtK?=
 =?utf-8?B?UHhDNmZZMGJnR1ZRQUtvdmpLUUs2bGhrVjR1bW15ai9sWVE2d1JvejF3eXAw?=
 =?utf-8?B?TTkyems2VE8yZlVpRHdjb3dpSEVQb3Rka3ljNjROTDNNQWR2RjBuZkZPTzZv?=
 =?utf-8?B?U25KaDFIUnBJQUduOExaQjdFZDQ4bXlDd21pMjUzZGNkVXg2YkcrOHZOSFVi?=
 =?utf-8?B?NUNDSjkwUlNhMTBOL1ExaFRuZE4rbTQwcDg5WkF0ZmkxOWF1OHpXZjAyd1l2?=
 =?utf-8?B?bGN2LzUxU1JOSmRYamw3UlFJbENHdnBRcDFvT0kzdXF1ZzRnekRhMkhqUk05?=
 =?utf-8?B?WWU3VnluZ0RqMFM5OSt5cjRjY0J5bXpGWFhyZjdpaGhWbFZrcWhPK1YwdEEx?=
 =?utf-8?B?aWJOV3RCQk10aGRJTjNLWE0yTlVpSjBSZTN1R3puRUJxMTlhT2tpZ24vRjF6?=
 =?utf-8?B?UHJ0bldkeTR4OGt0Z2RTNHhRanQraStZbGowRHVRbnNuUndWeFdWUW9sa01i?=
 =?utf-8?B?VDBDVEJud2ZuZ25FUXBIaDcySzZyZFJpUXMvcklEUVpWK1JsNFA1Y3pnY29l?=
 =?utf-8?B?citzWVRRUWxOUzhjMjUyMm53eENLa1VpUEhPdFY2NkZFbE4rTVJIcjlzNDRY?=
 =?utf-8?B?bFJiZmR1VUJqNEE4RDFGVlJudGhGcSt3NHltcGhvR3ZxOXZubGVSZ0JkVzk2?=
 =?utf-8?B?NGxBREdIT0h1dVRsdGNqTVJwY21mZWFOWEtzNzdvazgrSzVxQ29XTDJwNEly?=
 =?utf-8?B?bkxNZjFXTVpMQWsvcktvVGFodHpEQkJFYlkzRC9rKy94eE5mbUFveTkybHBy?=
 =?utf-8?B?ckV3WGtYVytvcFNjTWlxdlh2OWxTNDZFaFRzK1dleHRnbWZVUkdJOE5BNEEx?=
 =?utf-8?B?YWNSeDhTdUZTR2Zld0g3T0tsM1UwM1AyQ1YzcDBDZDdIOGU5WHBnWFUxNUJK?=
 =?utf-8?B?MUh1TnIzcFVVSzB4MlVqY0JUZm8zUTBkR0FvdGhvMEwxV0RBY3JtaEVhQXI2?=
 =?utf-8?B?dEd4TFMwWjZZeGJOVjlhMURvZWlXbEJlTHVpRjRTbTZOMFFnV2VCem9sTWhu?=
 =?utf-8?B?dVJIRUJwWmdpUkFoMTNBSGhEclNGY3RyV0pOc1FoV2dPN0RUekFTNW5EdlVO?=
 =?utf-8?B?SWhYUlRESUVKSHlJVU9lcUVEOWpoYXF4ZnJ1eERHOXVIYzZkNVg1d3FWVWJl?=
 =?utf-8?B?K3lIZzVPZ1B3MHpVWWljTUVhcURKdGZkOSszMU5RWjlGZUhVcEJ1ZjNSemxL?=
 =?utf-8?B?VVNhLzlLUXJNeEtrUzM2OGt4WXEwaG9ia3FlTVJzeGozZ0piMHNPc2RuSm43?=
 =?utf-8?B?VkEydktaMjkzQllxU0dOWlVJVU41bGhmVWZZRnVmUFpDNm9wL3lGVTJ3N0xL?=
 =?utf-8?B?Q0dNWVRXdVBkM2w4NEt2bWJ5VUNtZ01Qa1lZS2lwQ1ZubFZ5US96TzNuay9Q?=
 =?utf-8?B?VzJITlpDREduUC9iMU5zVkxiSXFkUmNhZXlCQ2RGRno0VzUyeVMva3ZtNmsz?=
 =?utf-8?B?UklHZG5Ka2Z5aFFjUVhrQkM2NUQrTlN5dnZHbEEvQitmZlJ6NkxWRXM1ZnFB?=
 =?utf-8?B?a2JOTjZLS1hlMXVtaDRSdzFjdkcvcDZ2QXh2UW5FMi9GQXpvS1pYd3diQnZ6?=
 =?utf-8?B?Z3hLd210Ulg2Z1lvckxWUlRjWlZHWEdLYWtZOFArWUhTTVExMW4zNGQwdGJB?=
 =?utf-8?B?UjNLQ1hNWStvQ2EzOXBJRWxYclNHMG8zNU5zSXQ1V3BNckcxYi8yK3dtYnNM?=
 =?utf-8?B?RkRFdG1hck9FRWQwTWlkVG13NlZiOFhsUjY4bGlNSjBzSkFCSEkycklTOThq?=
 =?utf-8?B?NExYQlltd21zWkFDcExvOGs1VzRJR2xYRG9IUWZheE1XMlhXYlpMaDdGNlkr?=
 =?utf-8?B?QUJUa0lwY1FxenNmVlJzdFZ6SFhHdWFCL1hGMXE5ZGRJR3VDV1AycG9nalBT?=
 =?utf-8?B?NWNSd1c3NW5USWt3OFpFbDN5bFMrK3FVZXp6WmsrOCszMjBOTHNZRERIV0Ex?=
 =?utf-8?B?aGNOb05vWGs3ZU8vN1dMRUNXWk14SUdoWWQvNlRWZjVRTVRWSk9jT3J3a1Vy?=
 =?utf-8?B?N0JrMzM1WnR4S2d4UHl6YUhXeG81Z0p4WDFoeFlzazlyTmVPbGp4Y0l5K29M?=
 =?utf-8?B?UGVmQ3JRYUR2ODRQNWY3OGFhQi9HK0lxMjlsOFkyUW1GMGhMYndYcXJUS251?=
 =?utf-8?B?Y3lRSjhJL3RnSVAveGRNVmhSWUx4dXJ1enBOQ0poQmw5RXNoei9Udz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A5F7419C6F5B14DB4DD0A8BB2BAE8A1@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8302ad45-3c4f-4e1f-d9ae-08df15d6fffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:48:47.1385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1I88BbHtGBuO46i27z7GYNJYItHDYs4EijU0nQHYhyPpfugWo2wHxYvsSikbywVLsY1LbXOxahiFQ9Cbe+z5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmIvaGFsL2diMTAwLnJzDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L25vdmEtY29yZS9mYi9oYWwvZ2IxMDAucnMNCj4gQEAgLTc5LDEwICs3OSwy
OCBAQCBmbiB3cml0ZV9zeXNtZW1fZmx1c2hfcGFnZV9nYjEwMChoc2h1YjA6IE1taW88J18sIHJl
Z3M6OkhzaHViMFJlZ2lzdGVycz4sIGFkZHI6DQo+IMKgwqDCoMKgIGhzaHViMC53cml0ZV9yZWco
cmVnczo6TlZfUEZCX0hTSFVCX0VHX1BDSUVfRkxVU0hfU1lTTUVNX0FERFJfTE86Onplcm9lZCgp
LndpdGhfYWRyKGFkZHJfbG8pKTsNCj4gwqB9DQo+IMKgDQo+IC0vLyBUaGlzIFBNVSByZXNlcnZh
dGlvbiBzaXplIGlzIHI1NzAtc3BlY2lmaWMuDQo+ICsvLy8gUE1VIGJhY2tpbmcgc3RvcmUuDQo+
ICtjb25zdCBQTVVfQkFDS0lOR19TVE9SRV9TSVpFOiB1c2l6ZSA9IDkgKiBTWl8xTTsNCg0KSSBk
b24ndCBzZWUgdGhpcyBjb21tZW50IG9yIHZhbHVlIHJlbW92ZWQvY2hhbmdlZCBpbiB0aGlzIHBh
dGNoc2V0LCBzbyBpcyBpdCByZWFsbHkgNTcwLQ0Kc3BlY2lmaWM/DQo=
