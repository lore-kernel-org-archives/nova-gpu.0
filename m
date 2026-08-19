Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDF3CD8D4
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164887; cv=fail; b=rSWQWlcveOB2kH4q8YTeXAiHz/8JIcwAMw1RM9YOP0ybuITll7BJjAUPQCCPWf82+7pIyDhW4V14lyC9b6ijqcJG2CLWbHDk8xizjM1aWuUsDbte3QVaTHiyS9FcrxQWfdrLRxOuYror7Z1dFfp4fLmt4HnrOZJGs8DcSDt0I0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164887; c=relaxed/simple;
	bh=ceweX9NiwPVDAui7nqkHA3cf55KlafYh2o/KzvV1iJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oPpNcDWKVuZY65ujWpKntJ5Oy1aUFD3zzHJwbNJjxmXxDVPwHOiyYDe7QS4TBu6mNEvvNQTc6W6ePw/4RtkrgGyHe6On2LZPV8R/H4C7J8FI6m4fQXUWiA0NYrB2tRUfGVqU3kcciVlqAqHCD+J07woNx/zOJP/yLQNbqadSQd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AShdCbUX; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AShdCbUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZPBFT76SpJqhRk06Peod6T1pOtMMSD8Z+lLeGFcGHdRx37H9XQm6LSL8igtCBDCXee+yDPrATkbPARpKVphX+i/3fYIswzKWz9PGCdzDrtS3JNV+WnHoEfo51hZS4fudclSKaXe1gPvB2sBsNIHUJILtMfdsvlMnUJJ8LAXq87HczcQuVGkRQZ8zIvYqL8oD9lH5gvSZC0i6KqI6aDGBmwm8MV5SFS7S/pVzuvje8hoQj6y8bJH5W258QjbF8lfZwruwe3Lmif1Ktrhben+m6oBts8Sb2ChAn7N7XWPKamACIDcRRPiZOKygKUts4NustrFB/ioppc4hin3Hj9rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceweX9NiwPVDAui7nqkHA3cf55KlafYh2o/KzvV1iJ0=;
 b=DuH3QW7rMR/mPpn9XHXGH82tk9HFHcuFuSB1kqeAx558cdgr8HfzXZQTAVxExzzHqOVUjuhjl5oX7NuTiH1GkHs0U8UrH0iDpopFqJxobtvQmRp3QPgYG9WclBj9tOPhTI+E+SizescwwI9miSJh8ttl54GRWTdEbraUbenHFs4Ze3Qa2sbBuV/Km99ioDbDgwG36XXHNNq0K3mMVKSPzmOSWvLDC9/7N7tKnveyRkF8bs4PTGIHQqGiaFcsq7nJPURv4im5+4j0eCEpCHTbj/zS4oDVQEfyRO6vNjyUvaogB5eJqTl89p70a/WAgM+54qX+4dvlsbNUQu5Ua3MAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceweX9NiwPVDAui7nqkHA3cf55KlafYh2o/KzvV1iJ0=;
 b=AShdCbUXnd0WdxQbj+zxrF6+kKpoDwY2ksmRaDS+UYRFbjNdK1TYw/fxzDh83rqjScLiN0m8Lqyqdw2AT/sV/M6WhrYW4Jc7CWcydEgyhPNj3njLOhFsQtxpCV9lKk2SB9mtacUDVF6e2np+3cTofeWkQiGQRGWMD6fJ1SEA5a79u5Ro0TBvLBq47BcOP+dTuq86ANOEE0XqiQCSyKwCJh5hnq/g6d9HSKgeKgXum6IpmlX7XwIa6whzv5NU3LQE3aIgHpQaDSngPw1kz0tNiNLcYvSUo0BP5C1GIqmLfJpkr7pf4T3QIYSkq8QlMchMZEaq1c+8WdbcPMp/QIVqnw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:41:21 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:41:21 +0000
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
Thread-Index: AQHdL44ruw9aKPevk02GOz1XRgU1PraltYoA
Date: Wed, 19 Aug 2026 18:41:21 +0000
Message-ID: <010aa9b1c5f8bda067db5c13268d3cdadc6d581c.camel@nvidia.com>
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
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH0PR12MB5605:EE_
x-ms-office365-filtering-correlation-id: 7586ddd8-1e52-4485-1c7c-08defe2176e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 iZdkDTGLor/vZttQVdPp4IwNBGHu0xqg9frZeiq5NPO/HWy9VVXmk01U6PJt+ZmQ+3ZZRTrasZdaVtJ7aC0mgbCQIIbxsfqCojKY2Ivc9JqTZxRkhAsZavfxO7/jL9j9PA/8N6AZbz2PsFC6zQCypT9iId87sDuEZxy01+gg78cQz+2J5pj8BQ3qRfMDdWz+r7zLTsHfUY1aUZ15YfbrlRttrzzgVEGu5ODUicXtPre58wNJDIlUoduJmmENyEsVKDCcT+BC0v1oRWMnOACm/CKW2gncuOuz2ZwZMLvHwfE7jZ4wKUQgCY4LGY/vizTkpo6bQsh5gTH37UaQj19qdBg6+d/KSYjLnGOi1y/KwvxcjptK2tgAHaUudThsT+8pJ1nBdcumnFs2h8Mgetn5DbiL9Pb41X4XJvn/crc3Cgrv/bwPZ8SEtNLg2SwJIvn8dZL+nRgMKMraz+UzEJDuyk9F3VKG0YyYIjGyl51EYS6apvsHM4PessmJW2eoiFeoEDhC4qdDoDlbDvn9yREwOoF5Ly0TVFvOO7tNGLq+1DxLnNpmFucqAO/zvYAnxKwHGN7WlNA69D2xxb/GSFMxT+jcBTnSLKGhge9whfXjDfLVLLoNqaQ80LTBLYvR1AYfFitPPeNpWmxvnd7LVz+Emwo9TvlV7eJOgiSFaTZ4xk8P0GY5TgTXrz+H0jPVShcy4tnGzvM1aaJBZ0U/TDVwn3y9OsZB9FNR3Ngs7pcPknI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3Z2NTFBd2lVZDVCQk9NYnJnU2FKSG9IaStUQ3JoZ3czVE93M0RXMWc1Unla?=
 =?utf-8?B?d00wNmIyWlRkYyt6Z2RRVnRMd0ZhM1IzNUlXZGh2MTRtYU9GU1BQTnJFZW1M?=
 =?utf-8?B?d0Izem9lV0VTYThreW96aGducWtBNk1ONi8vdmpuY1FjMGxTa2V5WHRvOTZR?=
 =?utf-8?B?a1FNdlQ2K3l6c2JRVVNEU2lXbFFrRmVtY3NSYUs0VzBHVnRnTWlRUlpDaVBs?=
 =?utf-8?B?Vm5tbmJDT2VZTVhUMFcwbG5VOE5ET21kRVVTY08rUW1obDZaamNzcFdzUWNm?=
 =?utf-8?B?aVkyQnFwR2tWeENTUUJCa0s0ZlBmOVVrQjVSOGVvVUpZanl5WERqU005SmNo?=
 =?utf-8?B?UEVFQTBqVDhOMDFFUVFxQ3NkQmRSc05RaW1lVmxJR2tSQ1pRQ1d6RjlmclpR?=
 =?utf-8?B?Q3Z2dEZlVTdwdVNrM0FFN3NXY25lVjZ1NVpyVnJxUVM3UURHeXNWZXZsVzJn?=
 =?utf-8?B?amxXOVlKRndyU2FsNmN1cTVLQkc5VExVaG8zQm94L3ZzZlBXQU42bExhM1ln?=
 =?utf-8?B?R1NmT3RVb0pnZFJGeFU2NHA3S0phY21SWXkyOVhpUGI0QmdGeXI3WUdRbFJZ?=
 =?utf-8?B?K3E5YTVtTWdDZ09BV2hpQXU4R1VZdkpPZWFQM0ljbHE3OUtRcHJ0Nk0wSlB5?=
 =?utf-8?B?V3E0SUQ4MzJGQ2l2dDdRR1FoalZrazlTSXduSGtla0xUWlY4TFVvT0dhVjll?=
 =?utf-8?B?K1JuYnZGV3FUeEp1dTZMZ3NtQ3RnWVYxcmpiWmpDNmF1OWM2bXNsdTVWTksv?=
 =?utf-8?B?ZGRXTzZBWFFkTmN4YUhUNktDTFExYnNFbm1idXl6aDBzcUlJTHgzQVhoZmdO?=
 =?utf-8?B?VzhCQ0tzNSs5aG9xdTc3K1J6WVI2bVBYL1RINkJJTWFNL2d3WHl5cnlOL2hj?=
 =?utf-8?B?akJEcnRsSVFzREU5SU82UHBWbTJjOXpRbUg4N0FRYUd6bEQzM1hNZ3QveGUx?=
 =?utf-8?B?RFprSVBUSHhTU0x6TG1jZXNjNzV1ZmZYUStuMHNuZjFkZ2JGVVM1Ri9IOTFk?=
 =?utf-8?B?Yi9hemJDU0Nza1BKTWhZODlKM3NjV29iQ1JrcjFSSE1MMEtQbjM2NFllOFRU?=
 =?utf-8?B?RmFWRzlIWmdKbDFRbzlqZm1yQnpzMnVwb2lvQVJCeU1USlJBSTJXR0R5MGNE?=
 =?utf-8?B?a1dTVC9HMzkyNnZxTDR3S0pyVFdNMUhlVzRhNFNLajBHM1NGZUtYVVZWZFdT?=
 =?utf-8?B?aUVNdVRBOXVNQThISmhzMUljL3dmWXJSVTkydXJscVYyMlZPazc3bExQTGI5?=
 =?utf-8?B?aUVHTkpjbCsyM25rdVZpbHRrc1cxQWg4eWpBcG5EM0xWRDBDQ3lrc0hWYXFj?=
 =?utf-8?B?WXd6Y1hYdUk1dDg3a20vVmVTejlEQ2RjbWxGRUkzUXZTbDlkYThTcnJXakV3?=
 =?utf-8?B?OGowVjN5T3ZHM05QeTVGWHhDMWY2U2dyRnlWQmZOWEVSM3dUc054UWhHbkhS?=
 =?utf-8?B?ZTV5YjgyNUk2cW5xNmIxUHRHYTg3RjRuQ1IxdnRwcUV2QXZJL3U5WFpSS1Jy?=
 =?utf-8?B?cTJlVDBSZEFUSlF1ZzFUSTlnZkZpM1dnRXZZQ0xrZklJUklGRm11TkZLeHdS?=
 =?utf-8?B?ekVIM25rNzdrMDdBOERXVFFBT2wzaEdqZjhQYVBSNW11OVYwbFYxZnVRak40?=
 =?utf-8?B?dkZJWmg3eXppUFpTZFVPYnZRSFNnZlVEQ3NlRUlFMGFBd0kvOXY4ZnhKcWdK?=
 =?utf-8?B?T1ZSL2FENGF0QVlKRldrdjRFdDRjMWpWT21IV2d2R0pPZDlPOWxkTlhlUy96?=
 =?utf-8?B?OFVLd3hRNSs1K2toYitPaXpUaEIyYXZsVGRYWlNQbnUrb1dndFpld1UycFFM?=
 =?utf-8?B?QmxvK3Z0SnFxeUFmY28yazhDR0tVbm4vc0hBdmpMWTNQaytMcGF0Nm5iY0I2?=
 =?utf-8?B?UGk4Z25RTjA2MHY2NkFiVnRrSkRhMjZsS1oxZUJPN29ZNTYyRUxtT09yWDNa?=
 =?utf-8?B?Y1VjcGJpbEFZcVdhSHVpUlJQQWxicHA5c2hKZXNNL2d2U1V2RitrbHdDRWNN?=
 =?utf-8?B?TU1DRlVacFJzTlI4N1JUOVU5UldDY0pubS9hU0FUMXVpQ1V6aHZYWXdsSEIr?=
 =?utf-8?B?dllrVC8yRzJwSEZTbEhkbS9SbEtJeW9FcCttMUdSNFErZDE4U1ExOXowaVpR?=
 =?utf-8?B?SjF6MjJVcVZOUW9hTi9xaHhUOHBUeDd0UXZXVWxlb1hxMjF5SUt2UUc5YXFa?=
 =?utf-8?B?Tmp0N242T3FNNzNLN3RNWnQyN2d6Y1hCVnZnL3o1czBzU29hazdZdzJqSVNI?=
 =?utf-8?B?S2VmL2p5OGhzb1VwQnhtNHEvb293WTVvc0k1ZDloa212VUZhRlkwd2NhQXhk?=
 =?utf-8?B?aVFPUG1wdkdvQ2NDRkxheVBPK1p0OXdnbWZyQmJxNFh2N041L3lxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5222DE6FBB255140B6B43B4E850CA4B3@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7586ddd8-1e52-4485-1c7c-08defe2176e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:41:21.4140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxZ+/uxeYIvQljKBZXoiMUGYfOToN7IAUUV7M7Bt3B6LBOkzSAZYzat/xB/uY1R0FqX5M9X94M16OP8L88+C2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICvCoMKgwqAgLy8vIExvYWRzIHRoZSBwYXlsb2FkIGRlc2NyaWJlZCBieSB0aGlzIFRMViBpbnRv
IG93bmVkIG1lbW9yeS4NCj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDCoCAvLy8gVGhlIGdlbmVyaWMg
ZmlybXdhcmUgVExWIHJlcHJlc2VudGF0aW9uIGlzIGVpdGhlciBhbiBpbmxpbmUgYEJMT0JgLCBv
ciBhIGBGSUxFYA0KPiBiYXNlbmFtZQ0KPiArwqDCoMKgIC8vLyB0b2dldGhlciB3aXRoIGl0cyBg
U0laRWAuIE1peGluZyB0aGUgcmVwcmVzZW50YXRpb25zIG9yIHNwZWNpZnlpbmcgb25seSBoYWxm
IG9mIHRoZQ0KPiBmaWxlDQo+ICvCoMKgwqAgLy8vIHJlcHJlc2VudGF0aW9uIGlzIGludmFsaWQu
IFJlZmVyZW5jZWQgZmlsZXMgYXJlIGNvbnN0cmFpbmVkIHRvIHRoZSBtZXRhZGF0YSBmaWxlJ3MN
Cj4gK8KgwqDCoCAvLy8gZGlyZWN0b3J5Lg0KPiArwqDCoMKgIHB1YihjcmF0ZSkgZm4gbG9hZF9i
bG9iX29yX2ZpbGUoDQo+ICvCoMKgwqDCoMKgwqDCoCAmc2VsZiwNCj4gK8KgwqDCoMKgwqDCoMKg
IGRldjogJmRldmljZTo6RGV2aWNlLA0KPiArwqDCoMKgwqDCoMKgwqAgY2hpcHNldDogZ3B1OjpD
aGlwc2V0LA0KPiArwqDCoMKgICkgLT4gUmVzdWx0PFZWZWM8dTg+PiB7DQo+ICvCoMKgwqDCoMKg
wqDCoCBsZXQgaGFzX2Jsb2IgPSBzZWxmLmNvbnRhaW5zKGIiQkxPQiIpOw0KPiArwqDCoMKgwqDC
oMKgwqAgbGV0IGhhc19maWxlID0gc2VsZi5jb250YWlucyhiIkZJTEUiKTsNCj4gK8KgwqDCoMKg
wqDCoMKgIGxldCBoYXNfc2l6ZSA9IHNlbGYuY29udGFpbnMoYiJTSVpFIik7DQoNClRoZSBwcm9i
bGVtIHdpdGggdGhpcyBhcHByb2FjaCBpcyB0aGF0IGl0IGFsbG9jYXRlcyBhIGJ1ZmZlciBmb3Ig
dGhlIEJMT0IgYW5kIG1lbWNweXMgdGhlIGRhdGEsDQpldmVuIHRob3VnaCB0aGF0J3Mgbm90IG5l
Y2Vzc2FyeSBpZiB5b3UgZXhwZWN0IHRoZSBUTFYgdG8gaGF2ZSBhIEJMT0IgdGFnLiAgSXQncyBo
aWdobHkgdW5saWtlbHkNCnRoYXQgdGhlIGRyaXZlciB3aWxsIGV2ZXIgbm90IGtub3cgaW4gYWR2
YW5jZSB3aGV0aGVyIGEgZ2l2ZW4gVExWIGhhcyBhIEJMT0Igb3IgYSBGSUxFIHRhZy4gIA0KDQpX
ZSBzaG91bGQgbm90IGVuY291cmFnZSB0aGUgZHJpdmVyIHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGZv
ciBhbGwgaW1hZ2VzLiAgSW5zdGVhZCwgSSB3b3VsZCBsaWtlDQp0byBzZWUgYSBjb21tZW50IHRo
YXQgc3RpcHVsYXRlcyB0aGF0IHRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIHVzZWQgaW4gb25seSB0
d28gY2FzZXM6DQoNCjEpIFdlIHdpbGwgd2FudCB0byBrZWVwIHRoZSBpbWFnZSBkYXRhIGFmdGVy
IHRoZSBUTFYgZ29lcyBvdXQgb2Ygc2NvcGUsIHNvIHdlIHdhbnQgdGhlIEJMT0INCmNvcGllZCBp
bnRvIGEgVlZlYyBhbnl3YXkuDQoNCjIpIFdlIGV4cGVjdCB0aGUgVExWIHRvIGhhdmUgYSBGSUxF
IHRhZywgYnV0IG9idmlvdXNseSBpdCBzaG91bGRuJ3QgZmFpbCBpZiBpdCBkb2Vzbid0Lg0KDQo=
