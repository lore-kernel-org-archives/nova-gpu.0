Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214999;
	b=Lc0OyvZhtZxdmNPmfU7ZQeJCoXbWU3jA9U7+EhUg4DwfkAXdjViek5N8/kOajzqWfG7H
	 S0EImgF2f1XrxNZWyaDKdOLJ8pZ5acfgcWhb4oKYp5DINpRogGsbgjAMV3OvJlxM84CQ2
	 IL+a6YBE8Qh+IK+Tnl/A8e41J6hpKbTnYXVjDSk8K2dpDhkoAOGnK2Um99tGxdWvczVd9
	 I+gMSPu3wZOFFawj56FTUK7MBlvaCIiWcK9GhkhyXcFF7k9V1ONKNQXXJkY4uHbPhsFdm
	 pKj2t3J7sR+1qFDWfMGsvfjbgApM+fybyWE8NI8qk2njZsdV+jdYXtbZiNlp8LiWkVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214999;
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
	bh=xECV3MssEVOfHK4KSnMfISmpKF3pb5QsJ3GQiVQVZWg=;
	b=GoWI9+wBqvSG0flWADIvH1UIOOZl3hcXH47V9CoSBxWHbuHMIRX5vzXwC1oTWgQFwOXN
	 Sp6fz3Ad7qvEBSBkhDKISpf4yXW9bci2k2SgpMscMe35hUvvzXuYmlN5HR6I4OZMUyl2b
	 3TBvwgtrBbNSrJYz77ZYEAzXwsTCuxvFLzIp75jCI7IDjro0juWVlOnb0Qmv5V2xogH60
	 5pxtCJPz5bLFwSA+bRie7clTinzvdZ5r9s/fzEZ+CDt7PpVvNeQkGUs6Sq2nDahrM5Dbc
	 KiqR08SbomRwNNR9BTRdL+HQcaB4A5axM1jQRmC8r9jZwtSy/woBiBcusErk7Ykt2TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WqgAN3Vv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.14
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE4606A6A3
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 22:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEE4606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WqgAN3Vv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/GAj6gsV3xKptcAD9Y0IXJdVRVG69108sNPh7he5OuOX4CnA/fkUHBLQX9h6bKqUQaOT/opMzlHrr+WqdBDCtfDW5jjt1WK/3xFRETWgngqVx//L5UXgxKnTsLm1vvbJzNS9erACItcGsPsOElOhcKG7Fd2TEmiMg3WEME9whIPBzccgw8CfdMKfiNXUbe2pXnpdrbaWVjd8D6EMbsCao3bmKxFnmJ6x2rv2DxnCmPcDHgvuClJh2ww3CNEXzlmxm8IV7Ig5qT2FriQ1jweRjKOA14pozpw1i3R+rdHQDLVYWN9w+4bo+AlHlAohuyk8fqr2ZKmuX4yOM0K23GGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xECV3MssEVOfHK4KSnMfISmpKF3pb5QsJ3GQiVQVZWg=;
 b=u1xVYU1KhzhbZFcmyNRKXba3g4Vqen1OPD7S0ip4OTCUpL6zlc6+8zJo6uqmqCW5DuvaOgh9qxrPzIwAlDIoOcruEgFpIE41fApV1eX7rsvtWDi8ygFK3RQxaDPazC96umMLWnBhQrktcfF8Y1/Cf5wSRBWg+zYXQ8ZypdJzNi2ArA4hDIczerHPhW1172KVkM2is/oX623czGeejhcIA6NS0BNccIEkuYVhl353OvlKMgw+qlK2lTPzmd3IkGRp4WfLo3U5t0W900Vm9A+wPZOh9sXYXwn7bUa0csLMuQHtEj5R8KJuQwvlzs5cmSE6jlFDpp6MxIYPWTXPsAeUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xECV3MssEVOfHK4KSnMfISmpKF3pb5QsJ3GQiVQVZWg=;
 b=WqgAN3VvLD2e+jVvSveIDI2HRDVKFu3LHLz323lzHIHvjlHfNFwmHYOaj5t2Q6oCSk0UgrFtC3MPQPuo9XPfjEmbiJaGZdyk9waDys1QC75zKE3drzGNs6TNw9ESKYYDknPIqgfpqberjgM+w8ztCzM9JMXQvfSVZ97V2hx11+9aJYsXXcZKtbeCUCi3i4JJ/cymwxO+ae0m68uaWWE/1ONkxaon5MjI3UA3cyGqlExtQIFBQt6YyvZaKe+Ofu61M3FYaw/KjXfpecqMgZ24LSkCFT8KB0/82YapKDt/m42+pspuYwI7TWjqtb5UwZEYtn8WutCJS0JCONkFcngtSA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 22:49:51 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 22:49:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add TLV versions of WPR heap size
 functions
Thread-Topic: [PATCH v2 5/7] gpu: nova-core: add TLV versions of WPR heap size
 functions
Thread-Index: AQHddgRnMpWw5tveCUS6oAYIB3PVaLc2jgKAgAEI2wA=
Date: Fri, 20 Nov 2026 22:49:51 +0000
Message-ID: <99b9c1fae4220b82bd987b3c2e812e00f8981b0f.camel@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
	 <20261116195441.940595-6-ttabi@nvidia.com>
	 <DMZUFWHFA4V8.I8OXAFEOY9I1@nvidia.com>
In-Reply-To: <DMZUFWHFA4V8.I8OXAFEOY9I1@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH8PR12MB6698:EE_
x-ms-office365-filtering-correlation-id: 4247868c-3b10-4e09-4cd7-08df47589636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021121427099003|56012099006|10067099003|11063799006|4143699003|261102123227099003|38070700021;
x-microsoft-antispam-message-info:
 oWuYV9dj3UQA+oNAyHg9BzBPKvE6k264e9EBJ09oP76J/TrchDEWOgvJX2IGbpv+FZ7ynnc23hJEiZO5Sea+oxGIVi96bxCdGypAo1lnrvqFwpQmfBYKA4AjLAArxOzAdgkYnLCziQy6eIxQXXQc0fP+Da75MxGiqtd3/fcuRtp0s5dq7ucyWxxxZUU9GMQ9WFyYLnZLQaCcKxr+IngWWLhpzcugJEfLoDT/N2Teh86JF8krx6Nf8vRxL/FzjSS9a2Amc9gMn4mZG5nliqXeX5uNUdLNyBdYuwNBONN1Ti32s6MUjwNJhvJ6NSJw6EIgPgKBcLTVkdBkuybFrIM2GJKb+5kZifAZyKXk1SAANF+BIyACsGDgZcwnFBHEYQ0ayGppur29eOU9b8gQOydTJSN+pGI+Oz3VEnuOrKpTzgn0HBiCZn6Qu4rga/dunfkHC/oTtnVLTUDF3TzO6jfdclWaBQFTJD785PbnYj8YslmAAGrKgryJ2+9wt0X8zhbSOIChJmYu/5cUrN/ddWDUCy8MvEc7vu4t4ULdl82dx63FsxcQSMi67zF7FVGbkUPIBHiQnfktvXCVxUxmzGRmx1nbl0MMmSZsOC2c+PVYyg1Xfb9vz5/0Oav69ZsPHSloB/dgdyh/2Gy1bjQuB0hY5+UjH7NJe4g018IogOtVEZzkNFlLOuF361LPpEq1yKekFUT3uaasaHIOEvuf4ySkV3sl+9LylRLAfwP4vNz0MKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(56012099006)(10067099003)(11063799006)(4143699003)(261102123227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEVLektLNHR2U2FCVjU5RnM0enJ3Y1ZWV0xQMnk2SzNpVUhDWTBPQW0xVmJK?=
 =?utf-8?B?RFM0eVdjdjdQQ2ZTOVUzckErT2ZJYUhxSkZ5ekR4ZDFGbUZFSDYzUllqY20v?=
 =?utf-8?B?b1pPSzhrdkY0aDRRV2tVOVR3QkxkZ1NQUng1Nk9rZGJ1K0VZUVdkdEpZNzVP?=
 =?utf-8?B?aVF4WGFSeTZnMDVPRXowVmRqMXlZb002TC9lS3RYTDlVeDFFc1lwYi8wV0RZ?=
 =?utf-8?B?cmxScm41RlJUOFJWbHlzWEx3YjhxZlFsTlNkc2FrYlEvNmV5UCt6cU5aTVp1?=
 =?utf-8?B?RWIwTHhkYUFOcnF5WWxsWklZMDNjTVUzSEVFSkFEQ01WR1RCR2Z5dlpVeVA0?=
 =?utf-8?B?b0l1ckxKTHptUUR1VHpyMGRSNDFabFhnNzNIQmx2SXVucnREczdCQmNGS1hS?=
 =?utf-8?B?dGtLZlhZZEE5dE50Q0lyenk1VEhaT3hkSWFRUG0yT2hSTHlpQ21tRXBjZ0hw?=
 =?utf-8?B?RUJmUjRCNlFWYTh6WTZFYXlSQ24yZGNpKzQzYzJkbEgvVElJL09mTjlOc3Bm?=
 =?utf-8?B?QmdsWlJmMDdLNWRyVE54c3E5N2Z0STFiaWNXM2l3SEtZR2RsMXVNMTc4SnFh?=
 =?utf-8?B?ZzFVWmlHV0t0cGtEaFJWQ0pKU2ZveTlNSngvbnRQNng1ZGRERkhxQm9VRUJi?=
 =?utf-8?B?Q1FpbC90UEFKQnVsK0RoQXo2a1BNNmJRNStqVHQ0ZFovZWNNekM2YUZWWEE5?=
 =?utf-8?B?UkdRaXg0ampuSjBHZVNYM2dxRkM5cjBWbzlnUG9uTWVtb3FVNjVDMTRncGwz?=
 =?utf-8?B?TFlUUzVzSU9aQ0xGcldJQVJCNFVyU2lHMWVoQ3BYZVUvVzNYN2ZOMGdDVEFh?=
 =?utf-8?B?Wmt5MVFta05HVzV4REVKMmFmRS9WS3Fya3hlbVRTbG9qVUhIMEdFdVlvNDQ1?=
 =?utf-8?B?MDk1bUYvRHlrZXRXNkZTOEM4ZDlxVWQzOVBpb216WEYzWTFpRk5oVHZGd3FN?=
 =?utf-8?B?aE5ZbVZoTUVwSk1oL0NBa0VJVWdCWmpKbThqMTBycjFaVGRvMTJFOXdRWDRj?=
 =?utf-8?B?dzkwanVXOW9QN1ZFallOMWR3OEYrNzZXaERTUWF4M0pINFVseTF4Rk1kbzBY?=
 =?utf-8?B?MFh0eUpBOTBTOHoyOTV0eWFtTXoxUGN6MThtSnNOK1hOWXhBYmpCRGJpMm4x?=
 =?utf-8?B?aWE1WTVSV1RqTW1NbTlMT2VSd1d3SlhtYzd1ZXlWTjZUZ1hHRnlWSk82MTly?=
 =?utf-8?B?SzcwQlJtdGkzWXU4Y1hia29iYWh6QzRJQTcwRW4zMlhQSUR1SVRQODFuZEEr?=
 =?utf-8?B?YWpNS1hLZ0dpNHloVEVNcHRPakRmUkFIeisySU10TGhxdEhSU1g2L0Vzb0lL?=
 =?utf-8?B?T09GUTRya2t3WDZqTnJlbkpOWDdHYWxJUkNZazBrd0VLOU9aZmpOd2FnNXBS?=
 =?utf-8?B?L29aQ0lBV2xGZWdJTHI1YzdaWXRBeTVSSkI3TkZtNUlMU1BKSjNNWUJJU3Jh?=
 =?utf-8?B?TXhGazNkTjEyZzV1YUZyR0ZjZjZBSnBqWHlJaEt4WUppNHcybEpDdVFqMndl?=
 =?utf-8?B?Y25CN0IvWFUzVlIzZU05TFloblFLU2NsbGd2U3p1U2k1NWdFRUd2bUxDWFJm?=
 =?utf-8?B?MzRDUlNaQjc0cExaNlVVRDZqOWV4Z0hOK2dHbWtWV3VZSmxqa3R4Mk8zSEo2?=
 =?utf-8?B?RFZWNW9GWjhld1pVNE1FMTFGa0dSQTlGSzl2VFdmRXFLSHJsem85QUZWdjAr?=
 =?utf-8?B?WTl3SU9Xc3hQcXhlSFV2KzRHQ0RPTjBmTHJPaXQrK2lhVWgrWncwdlNsVjRp?=
 =?utf-8?B?Ym1qZ3Vmd25lQzVqcm5MTzBpZFhxTGhOcW1GYW84SkllTCtaeXEwU0R2Tlhh?=
 =?utf-8?B?emRZVENaTytweEN5cUNYQ1BmZHg2bHI1bVNXUkRwK3dZRHJSbEZqRWY1N3VH?=
 =?utf-8?B?VXRvMk5OVmt3UWVWUmV1b2gyNDNGeWM0Y3ZMTEMvVlVJbFhDc2RXQXlid0ZN?=
 =?utf-8?B?OVFacG5DWkNzd1hab0pzSG1HTjdzanhXNmRxK01DYmV3ZG44cmpCYk9uSkZI?=
 =?utf-8?B?WXAxRDNRSnVDWVF3dkwwQTFCcldpYkhSSGVVb3RqSG5meUtsUFVveThiK1Mz?=
 =?utf-8?B?WEs2cjBNWEhkWWJwZklRY3hzcHN5VnNiZ3c5MzkrOTgweWpqbmFZVjRieEFm?=
 =?utf-8?B?U3VweFF2OFhFZzU0djBUYUdsc1Q4Sm1mMysxaFk1MkEwakE0VnM2VWlNalJS?=
 =?utf-8?B?WEtGQ2FRWkhRMU9pMjljeVZER05xeFl0ZUtqNlVBb0xKRUdQUy9GaDVNOU0r?=
 =?utf-8?B?c2pXdW5TWG80d0xYdGhkNkJ4SkhWYmNYTGFNRmJOVkhSMXpvZTdoWGNwTmtw?=
 =?utf-8?B?c3hFSEVUSjJpdE9iUkFuOG05R2FLVDZhcjNDT3pSSGxNdXZlWmFTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EAA319C692B5D4AB361C7EE3E49A65A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4247868c-3b10-4e09-4cd7-08df47589636
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 22:49:51.2695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HT4aZQ+bagHq0NVgIJVum/luIltGnuv8cgVaG97+pFNH5oZAx0ECRmBByH66a8rfdO6FVLR7KY7nQsvtsnKOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE2OjAxICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gDQo+ID4gKyAgICAvLy8gUmV0dXJucyB0aGUgV1BSIGhlYXAgc2l6ZSB0byByZXNlcnZlIHdo
ZW4gdkdQVSBpcyBlbmFibGVkLg0KPiA+ICsgICAgI1tleHBlY3QodW51c2VkKV0NCj4gPiArICAg
IHB1YihjcmF0ZSkgZm4gdmdwdV93cHJfaGVhcF9zaXplKCZzZWxmLCB0b3RhbF92ZnM6IHUxNikg
LT4gUmVzdWx0PHU2ND4gew0KPiA+ICsgICAgICAgIC8vdTY0Ojpmcm9tKGJpbmRpbmdzOjpHU1Bf
RldfSEVBUF9TSVpFX1ZHUFVfREVGQVVMVCkNCj4gPiArICAgICAgICBsZXQgdm1fc2l6ZSA9IHNl
bGYNCj4gPiArICAgICAgICAgICAgLnRsdl9nc3BfZndfaGVhcF9zaXplX3Blcl92bQ0KPiA+ICsg
ICAgICAgICAgICAuc2F0dXJhdGluZ19tdWwodTY0Ojpmcm9tKHRvdGFsX3ZmcykpDQo+IA0KPiBX
aGF0IGFib3V0IHVzaW5nIGNoZWNrZWRfbXVsIGhlcmUgKGFuZCBvdGhlciBsb2NhdGlvbnMpPyBX
ZSBhbHJlYWR5DQo+IHJldHVybiBhIGBSZXN1bHRgIGZyb20gdGhlc2UgZnVuY3Rpb25zIGFueXdh
eS4NCg0KQSB1NjQ6Ok1BWCBjYW4ndCBiZSBhbGlnbl91cCdkIGFueXdheSwgYnV0IEkgZ2V0IHlv
dXIgcG9pbnQuICBJJ2xsIGNoYW5nZSBpdC4NCg0KDQo=
