Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE42E7F20
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127844; cv=fail; b=M8MD8I0Th3NQf4sX6USYlY6FCWYuA1tOo3zAR4i1ctWj3hpuyhCb6a4jTyzwYjv3psMxEWLhUT+r6qoiy2ikrPrW9xj1OgzgnYQVSKmDBL4K0TCZkKzI39BAIzbjag+CzZcOlqyCoAf0BKGNg2euN8iAPLdu0CDlSxNozoyPN2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127844; c=relaxed/simple;
	bh=3qeQSIVPuFaPeKJ324ZkBtrVVZovSCf87CXIJrg4QGw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D/0F/Nwa/4mYQKzjMmFUnS8Edf/lQbVKj9TaAi74p2wGdyDtZD40/paGd41N+HdVtasowst2Yb2wQpYOXxjG3y+yQ9WA3NwsdHj8VYhcY8W6WAIZaGYJU1lX2lLVyqXFUOHAOblufRmhub1JJ01Px4WgRkm6QFeyUN5Oau2ut1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r2qOUhIS; arc=fail smtp.client-ip=52.101.56.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r2qOUhIS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxKQW53/mAB1OhQUV0wPz7lRteDY7q97zUB7+aYLyCKkWe6QTyD6cQJzOChpM3wdjXJdvWqKOAskHHuEH5SaTdOIpt6IIjB0dyCO6RsjDfkFtMNS91B673HhiZqpEJbkvq2gVUBZ0jbAsSekw+GTQoXhheF2ibLXuM5AtNfaYIF3kKFSNK1nd6KDskRPiW0pQua7pR+T9QVgouzUUpm+zVVzMYxr/1SVd3JaQ++oAnjpe0Kq73LM92Cv1s1sr3U0IIa6ojLLi68/vZc8BW720azr6H3FSJpfVSt/J7e99k4DHqm8aLHsng/rJQr+SLNLTO2nbK9xHUO64Lg0Q1tHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qeQSIVPuFaPeKJ324ZkBtrVVZovSCf87CXIJrg4QGw=;
 b=ldCt2X79eLNCBBpnjm7GYGiruEaaFCCa6ZMbG5gk+n0HmrrwlgsYmurRdRUihySJ7aoHcyHU7vlrziLrJzqJ3xGKCMU8mb9b7IIP7c7oQdecILS1+ZyIlJlSaCzWWk7lbMUU8i+pXYT4Op0JAVCQGGxvc9g06NBpzKvvM62UKrO/Xk3Xn3F8WPjZETXdGckV3epE1Lyr4qVi9c8B2pFKHRfrw6Qv35KBrjPLMQ0ljx/JiDl1jFhnVLitEenyd9GTHqgMclXAn6qHSGw7kbQgMEU8oE0eUZpm1eMZE94SfC5yz7YNwlBiYpG+QOdtA4kRRJ78+qPthzhLwN+cDkFiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qeQSIVPuFaPeKJ324ZkBtrVVZovSCf87CXIJrg4QGw=;
 b=r2qOUhIS/7quRhUllzLK+m7wxnKAYfNBn+i9Rqfpfx47YF3TJKKtr2hvL7IObz/IUHkykOGHDlpMGSS6CA5vPJJaa810XJS64UvQ7eao9eZifrjqC8d0ymIPvNzroczs9UqvRqlyockjAh3e4NGp22bDdoFMLveIWVFo0SehKxtPb6enZ3x06qR5yC9WcVkKFrFIpsJjqd8fsq7ILZnEvNWgxicUDzIomzX6yt7xCAVHIgRpcFIvretiAzvAtZV8KnLDwMfxwmM2vqWrHFIR1cm0WVXPmyhcpGMNRQp+KRNcOOG+cPMeVqrGvBXQiLuGtcNZaY0L9Ru1MXcMEKfT+g==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Wed, 10 Jun 2026
 21:43:59 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 21:43:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Topic: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Index: AQHc+QGRtz2UsSKeXU63ddOrzskdkbY4GGIAgAAA3gCAAAshAIAAJ82AgAAGSwA=
Date: Wed, 10 Jun 2026 21:43:59 +0000
Message-ID: <62a36377aa757f7a0a8bffff81bb79a5aebe8453.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
	 <4c9168113597793d01fe9f3d60a5554cc1895433.camel@nvidia.com>
	 <ee837d41f188af34e1d78231987b48a9cc287172.camel@nvidia.com>
	 <6a59666e-d8f0-49f2-a147-52d2b5c3e17f@nvidia.com>
In-Reply-To: <6a59666e-d8f0-49f2-a147-52d2b5c3e17f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MN2PR12MB4389:EE_
x-ms-office365-filtering-correlation-id: 7ebaf4c8-8256-429b-3d13-08dec7396168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|5023799004|11063799006|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AGAJoph37Ivzo/0Lclqk9ATLSYS4kUYuMMB9KfeWkpYH0yjIj3drR3ngEccBLwl2qOBbV3YNErcnAE6/EGufkeorkcqbXfmGBDlcFyLILyQ2EjDtyi8G1jncDCdapj6OOy+oC6afBtyprAvLtBwonOidfmAD9kv77v5kqTNUDKZiI2mCLSWPmc2CzKXu/ISR182i8yJCo5WyKbDHzS9q+CgDPuduGkSYt6B3IfyFdZsKFNFgrmGr9z+bUzxdVvCumFWUtxPYVIUXMK11FvqtbwbhLJxWnVG7gxIIb84PCL/zUMtyaIeB5DezzaJSlII/ZNrkaRh2AnJtDQGqs1DY3ln1rHEF9UYJcBGThjP4RHXqBdyIkQSqArGTRJjqsJFScuuiiHGuJdq2N2TVISVE/Im9gsI0cgb7C9g2h5dsD2LWTZLicebjSYv0qcoSOPB8unsEYVHrfCqGTwfeTcFJXRsg1Nc0bLsTKIgBFSH0PmBawMN0CQ82TanYTgeN7yc0f0tzH7qmv7ampIEKGPfvaMgbysX9TgiT6FSPZCyQOf6Law6gwf4rOz7LJpH/GjIOLaleemAToraHxMEI6mDsJd4TbnkoBR4BFqcZW/DQ26fkAyKUiCtn82z5Gz8OI3WN0pkT2JrOgB9HzwflgIqkRduBJHWnFqZy2696mSp419ldRWDnfSk9fAOHbL24FaJtAv7UxA/HW4npsCA8oB7Ecz2XmR+c6RfdCsBWnX4oSH8TC/M0mpfM8bSTy3gu1Oza
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWJiMmFkK1RHdDREbjhmRTh5dUVKOWppdjhCMnJRQzRwSUpJODE4cVk0eTJR?=
 =?utf-8?B?QllUczYzWDRFWGk4R204SjRacFNEU2l2NlV6WGxuQm5ENGNrR2RhSzlyTHQ1?=
 =?utf-8?B?cnJsczdDb08ydFUxRWtXeWQ3OG4xOFJTTkhCa21XWUpEWDBjMlVHUDhJRGdM?=
 =?utf-8?B?Q1JmQ0VVb1pERnJIbjJsQXlpTHV2WEI5QlN4VXVJb3BpSUZncjNML2ZJOWJS?=
 =?utf-8?B?VGRKWXI4dnB6QjZZdDcwMExKODJBSDEweGk3dm8vZ1Z3dmZ3TXo4THozeEI5?=
 =?utf-8?B?TDFPMjJ5WW1JajBxUlBneVNqQ3hFa3U4QzJFcFRvRXppRTNRdWxsQ1Jsa3F4?=
 =?utf-8?B?N1NPL09ZL3lmekgzZ3VFbkppRkdQbElrb2I4YzFoYmdsUnZYQ0pjMndLUnkz?=
 =?utf-8?B?ZG5Bek0rM3FNbFBycTFYU1hFOC8wRHlJWTRJa1ZDRGVLRS9VYkEzSXFqa2tW?=
 =?utf-8?B?Y2FsNStxdDYzQzFtQkhabDNRa2NQOUE2RWhPcDRQanIzRUpMeEVvZndEaU95?=
 =?utf-8?B?SnZjQVRrbDBjVkFXLy9XRExSVWRsL2pzcHJpOTltSTJCdjF3WjhYWG1WQnRU?=
 =?utf-8?B?ZnV6ejZoZFNDdUlzZDVDOWRCbXZ5eDFRS0xvdG5hY3VWc3VUSFgwTDJKUkVw?=
 =?utf-8?B?U3RIK2tpNHdxNEZJeFZtQThrRGN3Tk5LclNqTzZ4eWxSQXZEYW9PQ0RwV2dQ?=
 =?utf-8?B?R3YyVThTODhjUW1SV1dLRmhHd2tKRFUvamJtWUdNbmVTSS9OMW9RdUhwb2pY?=
 =?utf-8?B?THFPY1NEcGJ6dWUyR3hSZmRtQ2U0VjFFZSszRVo4MXc1ZzdvVFZ1Z1ZMVFdN?=
 =?utf-8?B?N0pkQTVMajRxaUR2Nm9UV0MrTFhRMGtDdEFmWTZGaUZXYWtTNnA5Z1FpTHdH?=
 =?utf-8?B?YXVkam1BSmRqeWNCKy9XN2QvSmd4WGxacXdUZGVoZXpteGFwb0hINm1lQU9B?=
 =?utf-8?B?SlBsblFZZFl5VkhRbWlrTmNaSVVyZzhQTXcyUzJuL29ab1QzbGJtVlRVK2xG?=
 =?utf-8?B?blJLWUN5ai9GVGoxd05pZEM3Uld5YUE3VDVLQWE2NnBpNlk4MDM3emZFa3Fw?=
 =?utf-8?B?bHZoYXBKOHoyd1B2UUFKQm8vYnBZR1h4dUR3U2g1WVR1K0JIRjFFK0NhWFI3?=
 =?utf-8?B?ckREY3dCcmVQTFMrTUxqSFVMK0hpNzVQMGVDMGlQclBqMm9ScENmZm1nVVQx?=
 =?utf-8?B?OGVSSUpMaWdRdlh3cmJ2d2xGYis4M0orMUR6K0dFMmM4MDdaaEJkcU1oS1RY?=
 =?utf-8?B?bnNQcnVPSS8yRXNHSnl2Ky9ZMWR2UUFqVS9zRlQrNSsyaVAzVlYxV0Z3U1p5?=
 =?utf-8?B?dzRUUXBUU3VKbVErN3d1QWNUOWZxZWpsS201bTU5MEJzb3ZNNGE4bnVCZnly?=
 =?utf-8?B?bEVEam9mNUxISllrUTZvTEtsWndLNkkvU3JSWkNzdVlSOGNOSnJPOVZRNlRB?=
 =?utf-8?B?cXcxZzZibDFuM1VISDcyZG16NDBwUjdUMmFISGorR0lrUjJRUlFtUEtoYkRv?=
 =?utf-8?B?WjRvV1cwTGM0dTJPdHdrMjdpUzVvYzVOOUtlMWg2NnVhU3g4MzMyN1g3dW9P?=
 =?utf-8?B?ME9mQm1xSkVydGYxMVUzV0tFN3V1YS9KakdWdDllT0gxY0lNZ1pjeGhCb1o1?=
 =?utf-8?B?ejAxNkowMGg0TnNFWDR4R0p1SjdleFlrRG1ENWx1akl5N3FVc01JaUh4UmtW?=
 =?utf-8?B?bjZkU2xlWGdTaHpXbHlnN0s4RGQwM1ZjOUk5aDd3VjlzdkYzZmRTV28xL0RL?=
 =?utf-8?B?RklGSmxqUXJFYWpUMC9OWTlQbHRvc1BEWjdvUmxUYWJYWEJzTmFDV1dzU0pW?=
 =?utf-8?B?ZURGT0cwcWgvTVRjbmNSRU1pbTdEeEkzSU00eUVnVFlqWXY5MTJxcW5HSlB4?=
 =?utf-8?B?K1ZZWitRaDJDOUVCNG9NUXVYbDJxc2N0aDFFUTdxUDQ3MHc0UHpHcjBNb3RY?=
 =?utf-8?B?UFhkZlc4NEdGei9ZTDViNFNmUXRkc0VPSzRyVElmZWNwUElhSjB0RlRhdUda?=
 =?utf-8?B?bVowK1ZxeTdQNjFubnZrbzBQVVhyUUJBR3V6aUxOL3BINjJmKzJhSDBleVU4?=
 =?utf-8?B?bTBRQms4T1plUVdaNWErSEVQU3RUbEFtbCtHd3VFdW1RNkF2djVtWDRMR0Z0?=
 =?utf-8?B?REVGeXBMTm5ob2FrY05tOEkyVzJ1S2VPZG16RnZKZHRLS01memovWHgzY1RW?=
 =?utf-8?B?ME1xdzRhdEFEQVlONExGMUZUVDlkWXJ5ckFHN2E1bkx3WG1Od0FNOG1UVWxn?=
 =?utf-8?B?SysrTkhOK3AvS2JUNExPbEo1ODhVT1Q4VjZWZGJrVlRQMnRzL1pFVkZQUE01?=
 =?utf-8?B?WWYydGRxbTI4bS92Z3ZYSm5qQUt5cksvSzZRRFYwOFQxWEhXL1dhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3738BC64B68F0541A999F8D1150C964A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebaf4c8-8256-429b-3d13-08dec7396168
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 21:43:59.4182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqrxWm8bIKkAgA2NU0K6JwAlEQ9kDgleg1+AD2hVhI83xrE620vDzRaAZXj9BLwyIlTjYmv/Qaeg73zn70BvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDE0OjIxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDYvMTAvMjYgMTE6NTkgQU0sIFRpbXVyIFRhYmkgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI2
LTA2LTEwIGF0IDEzOjE5IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+ID4gWWVhaCwgSSBq
dXN0IG5vdGljZWQgeWVzdGVyZGF5IHRoYXQgdGhlIHN5bWxpbmtzKCkgY29tbWFuZCBpbiBteSBz
Y3JpcHQgaXMgYnJva2VuLsKgIEl0IG5lZWRzIGENCj4gPiA+IHN5bWxpbmsgZm9yIGdzcF9ib290
bG9hZGVyLnRsdi4NCj4gPiA+IA0KPiA+ID4gSSdsbCBmaXggaXQgc29vbiBhbmQgZm9yY2UtcHVz
aCBhbiB1cGRhdGUgdG8gdGhlIGdpdCByZXBvLg0KPiA+IA0KPiA+IE9rLCBpdCBzaG91bGQgYmUg
Zml4ZWQgbm93Og0KPiANCj4gWWVzLCBhbGwgYmV0dGVyIG5vdzoNCj4gDQo+IDxyZWRmb3JnZT4g
a3Rlc3QgJCAuL3Rlc3RzL25vdmFfYmFzaWNfdGVzdHMucHkgDQo+IFBDSWUgUHJvYmU6IFBBU1M6
IENoaXBzZXQgaW5mbzogYWxsIDMgR1BVcyBPSw0KPiDCoCBva8KgwqAgMDAwMDpjMTowMC4wOiBO
VklESUEgKENoaXBzZXQ6IFRVMTE3LCBBcmNoaXRlY3R1cmU6IFR1cmluZywgUmV2aXNpb246IGEu
MSkNCj4gwqAgb2vCoMKgIDAwMDA6YzI6MDAuMDogTlZJRElBIChDaGlwc2V0OiBHQjIwMiwgQXJj
aGl0ZWN0dXJlOiBCbGFja3dlbGxHQjIweCwgUmV2aXNpb246IGEuMSkNCj4gwqAgb2vCoMKgIDAw
MDA6MDE6MDAuMDogTlZJRElBIChDaGlwc2V0OiBHQTEwNCwgQXJjaGl0ZWN0dXJlOiBBbXBlcmUs
IFJldmlzaW9uOiBhLjEpDQo+IA0KPiBHZXQgR1BVIE5hbWU6IFBBU1M6IEdQVSBuYW1lOiBhbGwg
MyBHUFVzIE9LDQo+IMKgIG9rwqDCoCAwMDAwOmMxOjAwLjA6IE5WSURJQSBUNDAwIDRHQg0KPiDC
oCBva8KgwqAgMDAwMDpjMjowMC4wOiBOVklESUEgUlRYIFBSTyA2MDAwIEJsYWNrd2VsbCBNYXgt
USBXb3Jrc3RhdGlvbiBFZGl0aW9uDQo+IMKgIG9rwqDCoCAwMDAwOjAxOjAwLjA6IE5WSURJQSBS
VFggQTQwMDANCj4gDQo+IA0KPiBCdXQgYSBmb2xsb3ctdXA6IGRvIHlvdSBoYXZlIGEgcXVpY2sg
InVuZG8iIGNvbW1hbmQgZm9yIHRoaXM/IElmDQo+IG5vdCwgdGhhdCdzIE9LLCBiZWNhdXNlIGl0
J3Mgb25seSBuZWVkZWQgYmV0d2VlbiBub3cgYW5kIHdoZW4gdGhpcw0KPiBzZXJpZXMgZ2V0cyBt
ZXJnZWQsIGJ1dCBhdCB0aGUgbW9tZW50IEkgaGF2ZSB0byBib3VuY2UgYmFjayBhbmQNCj4gZm9y
dGggYmV0d2VlbiByZXZpZXdpbmcgdGhpcywgYW5kIG90aGVyIHRoaW5ncyB0aGF0IGRvICpub3Qq
IHlldA0KPiB1c2UgVExWLg0KDQpJJ2xsIHNlZSBpZiBJIGNhbiBhZGQgYSBjbGVhbi5zaCBzY3Jp
cHQsIGJ1dCBpbiB0aGUgbWVhbnRpbWUsIEdlbWluaSBoYXMgYSBmZXcgaWRlYXM6DQpodHRwczov
L2dlbWluaS5nb29nbGUuY29tL3NoYXJlL2E0YjQ4Mjg3Mzg5ZA0KDQo+IEp1c3QgYSBtaW5vciBj
b252ZW5pZW5jZSwgbm90aGluZyB0byB3YXN0ZSBhbnkgcmVhbCB0aW1lIG9uIG9mIGNvdXJzZS4N
Cg0KSXQncyBiaXR0ZW4gbWUgYWxzbywgc28gaXQncyBhIGdvb2QgaWRlYS4NCg0KPiA+IA0KPiA+
IFNpbmNlIEkgZGlkIGZvcmNlLXB1c2gsIHlvdSB3aWxsIG5lZWQgdG8gdGhpcyB0byBhY3R1YWxs
eSBwdWxsIGl0Og0KPiA+IA0KPiA+IGdpdCByZXNldCBIRUFEXg0KPiA+IGdpdCBwdWxsDQo+ID4g
DQo+ID4gRm9yIHNvbWUgcmVhc29uLCBgZ2l0IHB1bGwgLWZgIGRvZXNuJ3Qgb3ZlcndyaXRlIGxv
Y2FsIGhpc3RvcnkuDQo+IA0KPiBFaD8gImdpdCBwdWxsIC1yIiB3b3JrcyBoZXJlLCBldmVuIGZv
ciBmb3JjZS1wdXNoZWQgaGlzdG9yaWVzLCBhcyBpdA0KPiB1c3VhbGx5IGRvZXMsIG5vIG5lZWQg
dG8gaW52ZW50IGFueSBuZXcgc3RlcHM6DQoNCkxlYXJuIHNvbWV0aGluZyBuZXcgZXZlcnkgZGF5
LCB0aGFua3MuDQo=
