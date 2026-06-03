Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF13E6DF5
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505567; cv=fail; b=HO0lC6dzZKrH1f1exXTzqWmUZuK5SKsKzMi3aufmE+4O5mN+4M07T80Ha+3Cw2LMxfVAQproRx/p8GqKKEQLsVHXCznFhpncarZu2S1y+pk4xK5OZ9Vgj2r6W5Kx7sw56UhicDjRauyP6WSEW4bexcws0rW9J5Eatv7RyRgZarY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505567; c=relaxed/simple;
	bh=l3USbvj1R1qfYfN34f5NlHSZgxgEJ+feGfcmX7+CKsk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rVLhibhiMoroDNuedG11Ap8z4qcNfSfVtLmSbL9yI12Xpa1zqmczJPd1oDXlMVCI8KEk+B4oQhcQhf81qGrFXeEKMaL43MWIvvaUOCcma72VlnN/n7WeAqaNI9WjhBEwtVgzOJt7X4b2Fb62UlQiqvtB6Ijg2OtGoe7JEEGUd78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LHQ07YOb; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LHQ07YOb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZJgdMLZwrARrZr8WluI9Y0vtpY1zr1bulPe76k7XYbdWxTb+ofpoUjvG+oqyAxtDbLIOuZXExYaVCCYRZ/rFx60uKb/YL6e7SaySVyWYwDy110pBBqN0+KJYto15sQGYqWMc2Nq2qh1CpmF78XMev9UuxvLsDuEVDAi+lvpZZg7/njC7GVJwkPZbh54Ea8bJYXBRveG4LUarTu1DhfbQAuD9Qa7iIW8OX9y9KzzeZ1aViISJvioQDrE5cbEpyA0y5TDndcJLd6t8iRJzEIFso7HuU0L5w8QO7abtwZTUUgbsGcku+Aae0+WZH1uE3utF3txKl6FDLvCi8xIJxK0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3USbvj1R1qfYfN34f5NlHSZgxgEJ+feGfcmX7+CKsk=;
 b=VOLseiy1LiCqh6X+PXyY9h8ONMoGRF9HoXSdhw39AdMZLcwIHtDMIoKse11XGc3YjsOxvw5OdyAKeci7ngiVGS29mIllOIEjwMwlqy69PgKfR9YmUwogF7uj9yymQRoVZw8zAXyGjfJOUpVYp4VC5owx3VQGyu2ksq+7B2dhDVEoumhsStytXCBLv3Jxg8/bQI7pV7hCjYYj6QTt++S4u0zMw18bghZKKXhXom9e1kG5VBEYpzK88yjpNclruN+XD+O0eAjl1sXoHS+5VhxtdyTkHswBDhdqy4jjACEfXmaEWYOm7flvchKesuWXUPiHkJww8hwdDsq/iUX9gvjCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3USbvj1R1qfYfN34f5NlHSZgxgEJ+feGfcmX7+CKsk=;
 b=LHQ07YObuYQAR50PH9TrbkNoNHB9M8vvVQ/+cwnDOJtDBK1gXZDYgcz7Qrjw7zxn6lL+an/K+Rh8LBHIxyMJTcL1JnTT5846QIqFDdqMr4M85nYRWwuQIX9pD+juUwGKV1A0+twPUs7IO/EHMe+ow+/WYiJehkees9jQ4LBSAOD6C2OYZ0cWoSeeQV5D0x7aBYgR8PzDzeyYE93owOUsIr1Rw75XsfYrBmnzxjd1T2qcjGap3uEjj+uNikXEZkxzfx2XPV3eI+Or7HSMLaCBtYZQu2/IE5qc78ST+F6H2db+jRzjNUvvsD3Io7VueQtjmdJtoPyzY3B6Ae+cbCkdGA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 3 Jun 2026
 16:52:42 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 16:52:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Topic: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Index: AQHc8j7paPPAidjKsU+T3R9++h6+EbYr9H4AgAAEtoCAAC83gIAADCQAgADZu4A=
Date: Wed, 3 Jun 2026 16:52:41 +0000
Message-ID: <0b0f4bfabd7ee644cd0da6dd291caca65b56d085.camel@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
	 <20260602032111.224790-14-jhubbard@nvidia.com>
	 <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
	 <DIYZGBDIVOA0.1Z6FRXE3D4JBC@nvidia.com>
	 <a3380acdbff6ca77892143dcb4dd1ea6c085ec8c.camel@nvidia.com>
	 <d20143f6-701b-4e40-bcd9-7ca3cc94f5ae@nvidia.com>
In-Reply-To: <d20143f6-701b-4e40-bcd9-7ca3cc94f5ae@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CY3PR12MB9654:EE_
x-ms-office365-filtering-correlation-id: 90c48731-cb54-4473-0f6e-08dec1908723
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|4143699003|22082099003|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 Bt9GbIwiHXOlYqHE/Nc9LcoxPdpcva+G5RIPH7BjcYkpEg1p3pjQy7R5bzazNnAYj9g8iYAdu51JZa4V7p/ykIzWg4+GTVk1uxnszyh6A4ZbkolikVSRCpflk4F6yFr1rIXbXX4yi28iUO5iUvqlfvzfqkEcBRI92+dxjdSBpK6WqZXRAX++Cwy2/y2k9k0tZ5reXktHq27018+KbajBvj9Hz5eHHpO3MOUu0T0I9vJXC4qHE6ACLqUJomBMfG1cqvh51XHh8A3+JlYb7mA+jzyCMUXy684dkANWY+ofjLHuCLi8FU9uFh6kLXUJuUuxwE54HALZ3J/hOStWy5MBOOUbgAnvQuKxY7cVIydnw69JYRlhjf0Fh+YRLBv+lqNyd9XCAlQteSv6u16WB411JmqgAUpHpQaUJyLxKn+n0IwiHq1q7njFWpdVxfZOxRdbXhrzKeHO5P+Xleg92jZANXIZBvfY3F1Z92/VdjK93APDf0fxpiBiTygPk5VJCGJz1TVm81vMHwpG1lhdO0K2o6rxGxV7POz8gidn40sXW19xT88/CLd0M4KnPl1nbKDnKW3RQMauzoPA9Y9XvcG17XtV8kicfPC4XZcnfsTnTObybEIS7SWjD6O0l624IeGadrjGxwuCUMzi0fprSOpkGDJgUNNA1cJAwwEOv2hYAwod40bdH/kWnD62TecPqPYPW3SxRy/W3cqJMi7RStyslsUIqw4Sp2ax++Hwf1UNHx1HuyWmH+iuLbd4zGAD/aT0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXRGSnhzYm9uaDhDUUZrVW5WT3lERDdGY1FuRlN1UnJQZGxMcGdkOWFhOERR?=
 =?utf-8?B?bXA4TnJYcEpHa0JPcWJTZDhLOWhsMlpHZnEwVTZOUVpkSEV6QXM2eFMvcVVY?=
 =?utf-8?B?MDEwQUJzeGNoaUlBUEVENThNOFp6WkVZYzArcHhqbExTVGVKTFhhM29tUFB2?=
 =?utf-8?B?N0NHVFdhQlFhVS9LcVFhY0NWZVdmTUptclZrU0VFZlpkVTZoclBIVC8yWVVo?=
 =?utf-8?B?VEVRbE42eDBKL2p6Q3k5YkozeUpKa1NVbmNiRWUyVFFkLzVlTFZDY0x1QXNE?=
 =?utf-8?B?b3FJZURSM1N1MWZHT1VMbHdSUmE5NGhsK2YyaDR1Snc3VDY0djFmektUZGNp?=
 =?utf-8?B?dUVWUHZkVnRCck9oU0h1K1p0MmMzRFJoc0dxZDd5cVlidnJsNTQzY0lYSmFk?=
 =?utf-8?B?VjhEVTN5ekI0T2tUN3paNkMwb1hubDRSL1ZvWS95NUovYU91SzFOR1E5NlNS?=
 =?utf-8?B?WExsd3pUcEp1WkxWdGFwMnBqSjhNREUraWVXWkxaRWRTN2RCWVpUZEp1T3Js?=
 =?utf-8?B?czc2YWhUcWVDR09PY3llYXZiV1JjYVlxUlR5SWgyMlFJalpQdE9aVFNsRVZP?=
 =?utf-8?B?WkQ5bFhwY2pDZjNZa04wYjM1aXlQZEJoNmZvMnRpR1daeVdQQlY4MkFDdFNi?=
 =?utf-8?B?MWZXby9EeHFnVW00VUllVDFIVFpMRFdOWTBRWVVCUGJDR3E0eWVCUDR0TU1B?=
 =?utf-8?B?UUJ4RC9EMG56YVhiV0dSUTVGMG5DYTRwVkRHaFI2dVArMWZVL2I1aDhPczlz?=
 =?utf-8?B?NDNXSGNVNnYvQTVwbXR3TERHMXYrN0FSQnJqN1Iwc3p1RUJhNjh0SXl6RU9r?=
 =?utf-8?B?RERlaTRabVhmZkZTVnIwS0crTGNmSjg4Z3JmemppS2RtaTFXSlV6NU9Kb2ZB?=
 =?utf-8?B?V1ljbDd5RDZPSHJueURsMG5ycmxjTXl4M2cvanVDb1ZUMVdtSGNIUDk0TUNs?=
 =?utf-8?B?QkxOQ3I3cFpMRVc2ZldFQnZUL0xHQU1Iak91YTcvUW9CMFhLc0x3SGtxRVV1?=
 =?utf-8?B?T2ZXNHFKeWlmUndMWHRWN01WM1VGK3BSVm01cFBDL1FlU0hzL2xFeFFUSGFT?=
 =?utf-8?B?c2JxUmpDZUVHdEo5V1FrRWU1dVN5M0pZMDc4VkRCVjM5UjA4RnRUQUh2eVpZ?=
 =?utf-8?B?U1JybzhkWWk5dHB3cnVWRTJVODQxV2VTTTFzSU5QU3dXNEJhMTMyd2svRDYz?=
 =?utf-8?B?OTZiK3FPbjBzVmVuSmRPekR2TVJKbC9rTFhnUnVoU2V1RXgyYnpoYmNpM3RQ?=
 =?utf-8?B?Y0dic1lXdEpqeG90bFpybHhteGdUYzltbmtxcXlKaDFHWnpBSjZYS2FtRUFG?=
 =?utf-8?B?Y2d5dDNKUkpQcTJqNzN6WGZNNkpZUmtkUmtHdE00Wmk2QlhPTjFiYnRKR2to?=
 =?utf-8?B?WHNRZHluZkNXSGtmVFRvcXNUREl3Nk1OS2Z1M092TmkyaTAyeHlFQU9QSlE5?=
 =?utf-8?B?UlpVaGxRY2pSOGV6TjR1UHI2YmdQNHMyOWZiMU5hMEtQMDEwckNlMXB1U1g1?=
 =?utf-8?B?Yzc1SXNDQkhhTitjL2hwbUw5STJuZ015YUZmeDZNTzNFSXRkekRUZzAvOTAz?=
 =?utf-8?B?VzZTWUtqTHBtYlNkaUMzNnRDcTBsWHdNZkhaQUV6SERzbHRWanAwTDNEZUdC?=
 =?utf-8?B?elFWd2JVbWpxNXZ0Ylc0blFMbEovUFZtem9MY3hYQTQ2aTMrRlpRcjdNTE9M?=
 =?utf-8?B?aFJzd3I5UWZCRk5yNGhSMDJuUWxFM2Rpdmh3SC9RcUFlS2hGV29yYzhZUkRz?=
 =?utf-8?B?WlN1eElVaWlHNVVhbFowV2FUYVNtYWtMMkpUVGd2RmRrK3Zwc1JjdTUyNlVI?=
 =?utf-8?B?VUtqTzV4L0FXVCtHdmF0amgwSXNKWjQ0OFNlTnY1WXFuNTRZMTNBS2xjVUJM?=
 =?utf-8?B?OWlvRTgySG9wTUpLa094b1pibjl0cG5oVlpzQ25GalNZMnBEZVNsNVFldWdP?=
 =?utf-8?B?TS9IYllvSTBYem82eDhCNHhtZHNwcmNjbjRmMkgraC91RFhhMVJzWUJ6ZkdM?=
 =?utf-8?B?b2s5OWowUUlMaFp3VEJzSklwRzBJWFA4QlJNZ2F3azZHVUdIMTlFUlFFcWg1?=
 =?utf-8?B?TVhjdzhoRFZYRWoybE4xZlA4ejRjRnFmcDFLbEZMWE4yWC9md1pwNWlvSEtX?=
 =?utf-8?B?RmNYSk1tK2NrT3hPS2s4UlNzanZKM3pUSFh6clV4RUZqWkoxVUszd3UrMTlZ?=
 =?utf-8?B?b2NPNUNEMzE3Q1RuODdMeFNoNkZTTGtEWkMyTWJQei85NHdiN0VHbTZ5K1JM?=
 =?utf-8?B?Z2ExaStTcmJReDFZbTZXdVE1YlgzSHBhaWF2ZE1jZVU3bEt2K0s5c2h2NWcz?=
 =?utf-8?B?YmFkTVQzdHJsT1k1T2lIY3B0aU40UzdkNGRwTUhUNnRmQnpJdDEvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A82367678990694EB85846F1A1BCC108@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c48731-cb54-4473-0f6e-08dec1908723
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 16:52:41.9361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePBaLoxeCr0EwM4BPVxT7jVyJSz2sK+J8c4qMsuUsM3E0nivs8oNlKgRTwE9T/3EwXFmiRGLg16na1EnVtn11g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654

T24gVHVlLCAyMDI2LTA2LTAyIGF0IDIwOjUzIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEkgcmVjYWxsIHJlcGVhdGVkbHkgaGl0dGluZyBjYXNlcyBvbiBvbmUgb2YgdGhlIEdQVSBhcmNo
aXRlY3R1cmVzIHRoYXQNCj4gdXNlZCBhIHNob3J0ZXIgbGVuZ3RoLCBidXQgSSBzaG91bGQgZ28g
YmFjayBhbmQgdmVyaWZ5IHRoYXQgaXQgd2Fzbid0DQo+IGp1c3QgYSBicmluZ3VwICJjb25jbHVz
aW9uIiB0aGF0IGRvZXNuJ3QgaG9sZCB1cCBhZnRlciB0aGUgZHVzdCBzZXR0bGVkLg0KDQpTbyB0
aGUgbGVuZ3RocyBjYW4gYWN0dWFsbHkgdmFyeSBieSBxdWl0ZSBhIGJpdDoNCg0KZ2gxMDAgbGVu
KHVjb2RlX2hhc2gpPTQ4IGxlbih1Y29kZV9zaWcpPTM4NCBsZW4odWNvZGVfcGtleSk9Mzg0DQpn
YjEwMCBsZW4odWNvZGVfaGFzaCk9NDggbGVuKHVjb2RlX3NpZyk9OTYgbGVuKHVjb2RlX3BrZXkp
PTk3DQpnYjEwYiBsZW4odWNvZGVfaGFzaCk9NDggbGVuKHVjb2RlX3NpZyk9Mzg0IGxlbih1Y29k
ZV9wa2V5KT0zODQNCmdiMjAyIGxlbih1Y29kZV9oYXNoKT00OCBsZW4odWNvZGVfc2lnKT05NiBs
ZW4odWNvZGVfcGtleSk9OTcNCmdyMTAwIGxlbih1Y29kZV9oYXNoKT00OCBsZW4odWNvZGVfc2ln
KT05NiBsZW4odWNvZGVfcGtleSk9OTcNCg0KSSdsbCBhc2sgYXJvdW5kIGludGVybmFsbHksIGJ1
dCBJIHRoaW5rIGl0J3Mgc2FmZSB0byBzYXk6DQoNCjEpIFRoZSBoYXNoIG11c3QgYmUgNDggYnl0
ZXMNCjIpIFRoZSBzaWduYXR1cmUgY291bGQgYmUgOTYgb3IgMzg0IGJ5dGVzDQozKSBUaGUgcGtl
eSBjb3VsZCBiZSA5NyAoPz8/Pz8pIG9yIDM4NCBieXRlcw0KDQo=
