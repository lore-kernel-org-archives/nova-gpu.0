Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B04481FD9
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163135; cv=fail; b=djYgJumskWBNNWGdCxeJc0F66fZ8hyst4c6TqkCKg00U/Jh0caxDjJt++0nvLJJi0/gcJdAdZJgg2Y1UmGQWQ9DSEn06XyfYTfIbLUtGZ7gsYyYJyN+BwmtuFkM595oI+aVoFnOKSzI9LHzIrFTxyQTjh5D8fXuQb003//ROtUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163135; c=relaxed/simple;
	bh=R0kTG5amQXo+lmaJJ1M0wSNzWbQUSYetiZrjGRVnm3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pqLMV4UBNvzvFn9pNcmqWOZi15HkHedYtP6QIAQzq/fpeRMCX8ku0r5A7jbp4xAKzbTetDpZegdE1OBr+z9hKUROrHGUCTV3jqELa8BDwwZ/QRPNG6IvvkSRv/eDl0f8L+Xi+f+6bTlhqQ08pV36DIB6LttRf+GSi5UW1cZOz7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sJfNZ9oP; arc=fail smtp.client-ip=40.93.195.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sJfNZ9oP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qz9MAUm1HIEKa0/9ri2TpZtTMRYJWTqw5ak4JyM/Gc4ZQQ2sKFoJuXEAT3ubn45s1FHA6Jd1Zf4ocQJsQI5pHAdx0qNSdTqoI07r8628XqXf3JjQNrfQgR+HpwszNlKTqwVLsArr2TZvf/FUUa6nKbQ05GlgBEXSrEzQSroApliRFUKP+/IAw0iK9K4v63N52t8oHvJk/jwkSgVfleMzCGtJ9BsIOgMhOwWz5GGXJaeVkbykEHk/pqQfurpgnmq0sZgEZUwI30Kry7GT2ql7L8KfgeqsG0ux53LsCrepy5yNyUcBTG+91hz766oiPxgj6NoP3sFObl8uEGxaAEshUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0kTG5amQXo+lmaJJ1M0wSNzWbQUSYetiZrjGRVnm3U=;
 b=XAnmqranyb0yRxcUTxIWE1H5HRYp67ffkloCWNu57H0e5IIX9sv1MAOOYYQVL5x+2QpbTkfHxXjj1RsEJdlb50qDDY8RjOT6509Afr1Vk/3I8QMlIaV1DnVklOmLEUZrmaPR82IU0og6Q05le0r7RX44PneKELXki1XHipsxXDGDqOB1qH1Qdqn/nIvd/pvjV8b2ax86D+hSJ6Mjy6EgT0u2iMwpFtw5VpWMGlH4+86g2BUBAPUYuYyABOEbPtq01VOU7jajeTyuKB5MpVTOiVdWO5b6BGdJl26wNzG9qY74j2qUA87oQk4MFcDsXn2/M2Q7bLANF+r4mXNi1Y5c0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0kTG5amQXo+lmaJJ1M0wSNzWbQUSYetiZrjGRVnm3U=;
 b=sJfNZ9oPFXr3mpF7W6j9VYrtOb4NGSpwXOr+hMv+qBd2/4e2D5fT12x5zfdxMnfY7IKTvI90N+yPlbUjnStMHbntgo1T9LCQxxrJ2BMFLLYzh4a19BE0YvLc9Rp29mvkliR8pPUWgNyB1a/Wa/dGebfOXE4Dl3hTsj5rOHH1cNC5QOj4mZYmT34r3f0rgCBO2v7yq2ysIpi8GPQiY1YbolV7tfUEo1myzAzsycEkEdXfOGm8o3cylSauAT/3IatKSmMTazmFNdj8rApPGM0HpHD/dxti4Qw8m2DW+7ysGsHOB6wfTViDfKY/lqz2jMSkDumDNQ2WfYZOkPAtdwL4JQ==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by LV8PR12MB9666.namprd12.prod.outlook.com (2603:10b6:408:296::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:12:10 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:12:09 +0000
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
Subject: Re: [PATCH 08/27] gpu: nova-core: add LIBOS3 log buffers and state
 monitor buffer
Thread-Topic: [PATCH 08/27] gpu: nova-core: add LIBOS3 log buffers and state
 monitor buffer
Thread-Index: AQHdL44rMHsURoRp7Ee167u8YnBj7ralrWIA
Date: Wed, 19 Aug 2026 18:12:09 +0000
Message-ID: <06fd54f6d47564a7dc0a106c4225e042c6d624d8.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-9-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-9-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|LV8PR12MB9666:EE_
x-ms-office365-filtering-correlation-id: 3465738c-9086-4e55-298a-08defe1d62d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|10067099003|56012099006|4143699003|22082099003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 5C8frxTm3sFPpgfmyKKNp+FVuETTZ8oIb8691HSQTNmC7V1fA6m1WO0k3+c5iEMdvUl0ETo8ReALA3VTR1SykY/Uf4p2vC4baIIBvSFpR8mvA1KmnKZybJ0+WWNWmwqk0r8qnQyVtcw/eTAPw6a+eTRfwsyjUPcpLhhXhtCZ5yLelD2ZaoJijggQa7EyKjX1IU5AhfSiyrmOx+0jJLYS52ZRSjYu4BkZdtOkzCwVtAuE2W5OeAt2eoXOiBi1sYrKjp4lQEfnEYh0TbYeH4tOpbCnVgn3vq5p/l+22uoQ6gvbvThVakRyIpITpSjLQgjrkus5SC3skXeGDVJ3w9rFU0Rc6E3xBAT150X1183Ye0Ll4dUOyytbR2JJn9+5gRVsdGocWf8Ddf4J1OM63FULyG7iuMnt8Lxq2o5KILHxBCMfEBuhWPPbpODPjjuK4blFlVpkgogft55/BAZM18V2CbgbZUS0oESQPClfyGpiTDEGyb7XyLGjjEfG64UXnXJgco/ujElCXvF6JGbqNbu92Bs0EP33ekqznc6EFNBKFXiZ7JENPlxYHZo35w6r/0Go0FakKw/csVHnosIYMpo9Q8xHRtr2VLXkCp6hsXwIqsB7BTdQaaRQl4rAuBQsOfVxrSsz9lImgT7BS97sb0KluzHuOhchUkW70kp4IMuGAh9Av7rRgeWkJVb2xXEgq23FmhwfTD9PdM/KTjZCIX3OZTyjbU0KfhUMKo2IScdWraY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V05kbEVGQTMvZGZpN2dmYTJEdElmdnRXdnNxTjBZZWEvcFBKSVFsNm80NUVa?=
 =?utf-8?B?NGF6STB2dWlQSXdmbTZqWE8vZzNNRWtENFVRU1UxQ3pGSkpUVlBjay9Hd0VB?=
 =?utf-8?B?TVp6ZEFMZWYzQktHTTJybGlCaFNhMHowK0ZOMkhOQWl0SFpzRWt6VzJ6UHZQ?=
 =?utf-8?B?dGVlT3R1YjdQQmV2YlFRQXFhZjVhMUZ3SllEN1RaclQzelFKVXlWQ3Q5YjBk?=
 =?utf-8?B?dzNBMkhMc2FvaUhuSmhHdzJRdHR6QWJIc0YyYUdESWFyWXlqSHVFV0hPZ3F3?=
 =?utf-8?B?NjN0azhEVzI2WkRkaEh6c05zRGYyUmpPZHFVTi9kbFdPSU10dEVWMVI5U25i?=
 =?utf-8?B?SVJZQkYzMnRuOURBQWhFTHVic0Z5SERqYjFvNHpsZ1NWVHlTL29qQTA3WUZy?=
 =?utf-8?B?a1VERXdqdlE1L2J2MWVnZEdVYko0YkVTSGF0NEg3WHBzWU5IWlUxSmFrdVBZ?=
 =?utf-8?B?aHREZzVFbmc0OTJoa2E5K1VpVXVmbUNCZUpXN2lodEZYTVUxeXVCMGw4NTdK?=
 =?utf-8?B?VVpuZWw0T1BhaVlCZWl0K0hjSVFkYjViWjlpckNvZEU2d1pDQUg1T3Z6Ujh3?=
 =?utf-8?B?RnFnVStPVFJvTTRYdHFvWGY0dTZQWFZZdEpYSDI1RlNiY1hvRTIzMENnTUJT?=
 =?utf-8?B?MnUyaW04dFBIUTE2WGRGYTFnTmhEWDRqYXRpNktyTWU4UHg2T1U3MmRVZUZa?=
 =?utf-8?B?eGo4TUY1eG9abnRkUHhBdjhBdTlPTGF3MVI2SWFDMHJ6NzYwV0p4aWdqcmJJ?=
 =?utf-8?B?UWFJTzVMdzdjM1J2c1dWb0gyZnQ1YXRURUMreDd0djU0L2J6aExQYXYreU1K?=
 =?utf-8?B?TVN1cTNYa1pDL3laampwclo1MTV4WUxDeSs5cmFJQWw2WHd4WkdvcU1ha2JP?=
 =?utf-8?B?RTRPNEFiZ3JpdTkxUnExNWJrTk8zQ2owQzVIVkY3N0xDVk5KdzNWK1hzckYw?=
 =?utf-8?B?dzNmNnpiUmtKbU9MNW5ib3JaVElVbGJKVHIzb3pFcFZ6NDk3Q2hLQnZid1ho?=
 =?utf-8?B?b3Y2NDR1S1NsVmlVcHY1WEhxNktDRnV2eHhPeGtmMms4QWFmeUdEaURkeEx4?=
 =?utf-8?B?bnZRS3NBUzBTWFVsMzZUeWZmNnpCdTRCNHZtWFhLWTdZcHdXMTN6a3ZOVytx?=
 =?utf-8?B?bXlNWUxmajJQQlFDYTZnbWRON0VLVlV1VjZIa3hzUzQyM1JhTVJjR1pMUzhU?=
 =?utf-8?B?WklwTXhhZWVuRU9UcWI1ek1TZDRTVWtHSjNDOGp5V1kwSUxqNExGQXlUM1gx?=
 =?utf-8?B?U1Rad2VwbFFHLzZ1NkdEc016MGhRWHJzMjA3VEF5a1ZZbG9vRFRvYlQ4a0RP?=
 =?utf-8?B?dG9zU25nSkVHR0VCSVRyZVp6bndWRnRMcHNtQ3p4U0t0cktRb285disxVmhs?=
 =?utf-8?B?dEVYSUc5OTNEZWF5c01ITnQ0WGJZcjhHc2hXbW9yUUJNVE14OWhydi9xMVk3?=
 =?utf-8?B?OERHR041czZVWm5tMlY3QitjOXFyM1prQkhZSWhnbXc4bkI3MlV1bFV2SnI5?=
 =?utf-8?B?ZGNFOFVMNDRZWkZjVFJJREh6enNGWkJtcFdCOTZlMmROc25MOGNhR2RXZG85?=
 =?utf-8?B?L3krRnRkZ3RiQXJiSk5xazhJR015a0Z0TjhwaFYyREhPVTZxTjB0dXhMbno3?=
 =?utf-8?B?YnR4eWwxNklvQXBEQ1RkcHNDb2plOUVmbGR5ZFRhWEF1alhscFNhdTE4TVRk?=
 =?utf-8?B?RGpYSHBpVUpCODJEbXFVY1Q1THpHbjM4RnRsS05EYzZjZXdyZ2RJQjh2cy84?=
 =?utf-8?B?U3Y4b1I5T0o3ZmEzdklBRUNWYm8zYlo1bmIvRUpVRzhhL1BoaW5QaFllc01B?=
 =?utf-8?B?b01HN2ZMUXVXbEkrMHBQQS9TTmhvZkpjTTVyOHU3UE5lQktCWUxUR1JQUVQr?=
 =?utf-8?B?K0djSFRHcG5TeTJ6Wkp2dlB3UzhZRnVsM2ZCbFNVYjI4REJCOHA2dnhjdmlr?=
 =?utf-8?B?c2dkb0RVQ1FocFQvRUR4NjlNUXNwMU82bUlLaXcwR0g2SE1QN01sYTVNQlJG?=
 =?utf-8?B?d0NTbkRLeUIwTFpzdE1ZcnhDZjdGQm5uZ2xIM3psVEZLS0hoSmRIVHFwdWZy?=
 =?utf-8?B?K2U4V281UGdubDRlU1EzbUZid1ZRdTNVSnVBVXJqM1A5M3FBK1lrWkF6ejhG?=
 =?utf-8?B?SGIyTFNQZ2RZbXNPY2Z6MVJ3bzl3NkJHbGo0U1YyS09paFI5VWlSMUJoN3Ez?=
 =?utf-8?B?K0l6RzZaTFlpZHI2WGh0UmtteTBoZGkvR1JKZFhtVlZENTJ4YXh2RGZ1N0Jq?=
 =?utf-8?B?QTJRUkVremVpQWJXSlRhZGdFOFhYUGVVeE1jbXppNHBqdGRMaThDNE1aS2RM?=
 =?utf-8?B?RFhkWjNuODREb3oyRDR4MmdzdCsrUTV5UGI5dU9OT2svMGxLV2Y4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8618C8EB7D8C014E86A8B3CDC5AA2370@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3465738c-9086-4e55-298a-08defe1d62d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:12:09.8118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNErRBU8SoVlkk6fphPXO7LmFkiku2BUuE7nQtc/NQcPqw/k+xWK/n9374CmEe1lgpRqREUyo0zjPwQbzeo7ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9666

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICsvLy8gTWF0Y2hlcyB0aGUgcmVnaXN0cnkgZGVmYXVsdHMgZm9yIHRoZSBpbml0LCBpbnRlcnJ1
cHQsIFJNLCBhbmQgTU5PQyB0YXNrcw0KPiArLy8vIChgTlZfUkVHX1NUUl9STV9HU1BfTE9HX0JV
RkZFUl9TSVpFX1RBU0tfKl9ERUZBVUxUYCkuDQo+ICt0eXBlIFRhc2tMb2dCdWZmZXIgPSBMb2dC
dWZmZXI8TE9HX0JVRkZFUl9TSVpFLCBSTV9MT0dfQlVGRkVSX05VTV9QQUdFUz47DQo+ICsNCj4g
Ky8vLyBMb2cgYnVmZmVyIGZvciBhIHRhc2sgdGhhdCBHU1AtUk0gZ2l2ZXMgYSBzaW5nbGUgcGFn
ZS4NCj4gKy8vLw0KPiArLy8vIE1hdGNoZXMgdGhlIHNpemUgR1NQLVJNIGhhcmRjb2RlcyBmb3Ig
dGhlIHJvb3QgYW5kIFJNIHN0YXRlIG1vbml0b3IgdGFza3MuDQo+ICt0eXBlIFNtYWxsTG9nQnVm
ZmVyID0gTG9nQnVmZmVyPEdTUF9QQUdFX1NJWkUsIDE+Ow0KPiDCoA0KPiAtaW1wbCBMb2dCdWZm
ZXIgew0KPiAraW1wbDxjb25zdCBTSVpFOiB1c2l6ZSwgY29uc3QgTlVNX1BBR0VTOiB1c2l6ZT4g
TG9nQnVmZmVyPFNJWkUsIE5VTV9QQUdFUz4gew0KPiDCoMKgwqDCoCAvLy8gQ3JlYXRlcyBhIG5l
dyBgTG9nQnVmZmVyYCBtYXBwZWQgb24gYGRldmAuDQo+IMKgwqDCoMKgIGZuIG5ldyhkZXY6ICZk
ZXZpY2U6OkRldmljZTxkZXZpY2U6OkJvdW5kPikgLT4gUmVzdWx0PFNlbGY+IHsNCj4gK8KgwqDC
oMKgwqDCoMKgIGJ1aWxkX2Fzc2VydCEoU0laRSA9PSBOVU1fUEFHRVMgKiBHU1BfUEFHRV9TSVpF
KTsNCg0KV2h5IGRvIHdlIG5lZWQgdG8gc3BlY2lmeSBib3RoIE5VTV9QQUdFUyBhbmQgU0laRT8g
IFdlIGNhbiBhbHdheXMgZGVyaXZlIG9uZSBmcm9tIHRoZSBvdGhlci4NCg==
