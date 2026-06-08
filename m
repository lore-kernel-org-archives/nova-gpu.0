Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1E340412
	for <nova-gpu@lists.linux.dev>; Mon,  8 Jun 2026 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956590; cv=fail; b=WkkXX9s885zEMnjYBDGjrwkatao2ZY8SmbnaP4xEJ7mH72hd2QClLI9Gpo3IY4+Njqlw/v1XAi01mJob0aToTlBK7mp6uPYZpHzOZuI1QPWO4iVHw2C61s+GuX4ZUbIBvslD8HPjp8KQh/+xQ2vmphCGYPt9Skj3dJ7tYdPBwQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956590; c=relaxed/simple;
	bh=7Kkkj4YHO7nXOC7py2LLM5RPy9bNftRZxOYZuszgQKw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iXn5w837ojqVSw3wfPvO0k1cVyjl8jtInHXZhgoSJT7RAEou5NrqsWPzZbl7trrJMddy+1eSHeax5MEt/seL0dJUjWB5+BEyEBeRWK94v/84KUSE3vMfgNdiPK0slwZpPQT5HS5wyFBcKYwo7L02is0y17G7fo0ziDg9zt/7gGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lhCQNPSD; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lhCQNPSD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+DQUleYCw9+0wnpdHRs3Kf2pgFfEo5nfqx7mPZtQn1IKFwVd0t0dzH+cLf21e2sPF9ojbJh2hTw70rb1i0ezO4th9YAjM726G374VUdNEQbvoXxLQQNuXIxUjpDUYm9tK0jsertoTtUGAZpkIVxOJcddEL5Wviabh15JPPJc/wX6701x8dEjpEL0dqROUGmSdb6F2T/vgg1zcZm4fC/FfBkdqCpV3M1V4QOdSLaxXReSnfk1pXiqMxZIEh7xp5vHhxlDDu1uHgLmX4iBMURCIXk0n5na58yF3zAn2Q+FxIbBsJpI0EaIuH3t66Z4KNfeR3oAbUjkW8l/1GUMgy4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kkkj4YHO7nXOC7py2LLM5RPy9bNftRZxOYZuszgQKw=;
 b=dhFST1Y5hNj/atHRZhxEjjLm47N8gpGF7u7ZvdRRSm0XngDVv2ou/PthQD04anoJOlJCGeH68hL3dAjQtZfW0MpFeol4p3jd2YjKJsuq0zccIcrfFBdEP1ZAYmzCxeBH+D1YE13TSsNCUIh6Vje32Pv+lnvEH+WDtKIp9g5oOqa2Fc17uoSw3v6CLgycNqGxQGTl/168ztbAJNTdSk5OQCeyNjViWW2IjBbDqxqdLOKgDx9kMBhvOKWrJJwZ201HupIgnSEBUgX6akLuiIPhIk6pauNmpEhNnDUt0zbPsJYVP2/jmrUICOtmixzf2JAGtJ6Th1Vg8oRZRt0B2e588w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kkkj4YHO7nXOC7py2LLM5RPy9bNftRZxOYZuszgQKw=;
 b=lhCQNPSDeGbGaKzGc44t1S49W9G+U+pB7v6T9KbTazzskU4ysFruhtpHfTZmRZotzCo+WmPYqqJgdojrjiR71jpfnzraVYo2rzzm/kzDsvZrkWflN9gFvQH3UN9x055xGYpXoWYuKBkDTbqIdWTPDo9zCcZvhgkQMbMWYNu7TnD2pN6mIHf4CBd2SbzlGurTZ46XcSXKSiWpwKrA/FzJ7VJ31FJudB8RBPjM3R+2v1wKDufRm12XPrlzFzP+U9+2RcgpZjsi8PW9owC7v8/8Ugph6luGcgibCmOrFEj05WY+VrB9s4wv82qc80BKuwfg78Y3qP90WpYxnsKH0NoH2A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 22:09:41 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:09:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Shashank Sharma <shashanks@nvidia.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
Thread-Topic: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
Thread-Index: AQHc9tIs9PbJ248ymEuz0X+qpSg2kbY1OVuA
Date: Mon, 8 Jun 2026 22:09:40 +0000
Message-ID: <e2c5af1b0caf24f3e2b42a6a80accd175214e697.camel@nvidia.com>
References: <20260607230539.144382-1-jhubbard@nvidia.com>
In-Reply-To: <20260607230539.144382-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB5829:EE_
x-ms-office365-filtering-correlation-id: 6b383119-5b7d-40f2-0555-08dec5aaa333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|56012099006|11063799006|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 GkGo7075B9lKORj32V8/RKx1YYQJmaNwAN7HfD5EAsITf1IwE0TmtVayEUJxnxwW4QotA+OH7vWuCMJ9MvWZWfqWJoWsTrmsFDOTkJqbhK2bAJn0PapcFk7aa2B9BDnbNb4lUWnriMWqUyjqcp50Jdc/fRXsqmYZe7GyPVwl95WKSQkZGQtnvUYwmI9MHeVFj2AEolaLuCKaAKLJ0JSjiCWptZjQsGhNdp8wNKHdyjlSo+xItpYxdDIwIwsgj1MK+hNwTccag8fUG/PXfRhWOWKX5RNq0Z+2hEZs0P3bYwWEglKRBRi/Ob16K0NcCvdxHSQPx+xak7bHapySGrjU9AWytwst2OjUcbf968Lv2VKkgTYg2T7wGHkAvo1Dnvek1y9aElzPllvCJYx9Vb18CtzGyf/3O3DiMUK6E5m2Y8/LhKz9UNXuYjHw0qBBX9e220+1iVsRlmSe/RhVUtGCMKqW4MLtH7raANuvw2sahyjbiAWTneEdjCIoZ0umx06jcyR3WIz9Ht5lzVYUxHu/DccKQS71MkYAXi3kOds122/LbAJImuu4k1Un+kb4OV9r8cAGPe7ewPznSdLxBMsoV88QnvqJhmjZzGptHRp215Lq6dhScorouCmZvRAgSIU7owf6M6JRIE15QiFWDC5xqvxIgnuZNW9pOylYgqWPIZi87nSU2UezDmXEKEqJrKpJoJA/MFud79CqLQhANOmD62q4JoCdVqDNDeXzISaFj/211/FZ+oT5/+S/PLmeoAfU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2FMMmZ3eEY2aE8xZzlqUU5hYzlMSlNKNWswRFRTR2NkV1ZOc2N3L2l5Q2M2?=
 =?utf-8?B?bDVMdjRHYy9IUHVWR05UaVBXeE01OGFjRi9icFVRSTdqclVuSVFzQzlZbjdj?=
 =?utf-8?B?Z0k5eEN5R3dFZmgxaEJiZ21JRElPbXNmWVRyb2JYbkQ5QjNCTVVNV2RmZC8r?=
 =?utf-8?B?d3ZFK0hDVE16d2MrSnQwMDY1dHFlSlpoMEVtQTBZSjE0Rkwydkl3blRuMFRN?=
 =?utf-8?B?aUpzck5iYnlpU3lNT1dTV2plcHc5OWZJOHVPdm0yM1IvaGZ4NCtsM2ZuQUxE?=
 =?utf-8?B?NXVCZkowUGQ0SVhKTkE4NVFHeXVMdGl1dUxUVXR3UExpRHJNWlNpbzBVRWNo?=
 =?utf-8?B?dTNSNE1mUlh6MWwzV25PK0d5QjIvVDNReEgxYW9SOFU5cUdrUTNMcms5UXdu?=
 =?utf-8?B?S3plUXorRmtpR2tXVVVnb0tNNjM0WTlkaFJ6d21WTlcvWWsxY1hEalBWZVFk?=
 =?utf-8?B?dXBKMTY1eHJqdktRdE43MTV5YmJjSkQ0WHBKMEl4bWR0M3RETEp4cEVmS3lZ?=
 =?utf-8?B?UlJ6WWp6LzJZNW5IT2hTTmVVZFlySnB1TEdOdE41UHY2MlNZTjR6MlFib01M?=
 =?utf-8?B?RTdGZTd5dHdTYzdrdUdzNFN2QjE1bGZ1QmdHY2hFazZvZW1xaTE2RXJYUnpV?=
 =?utf-8?B?VVVFVTNuNzgyL2pzQjhJWUhYS2RBSmEvQWJ4cmxFeFBUYm5SWW83Ukoyb0t6?=
 =?utf-8?B?SWd0b3haYUtnVHZUUng2VXhxUFVGNDF4NkZ6aTBORDlndFJpbzFXaXNzNWdt?=
 =?utf-8?B?SUpyNG1NVTJkdTA2cUZZNXpMY05ZZEJZTUZ2RmR6MWl3NFR1OFhIaTZmWldm?=
 =?utf-8?B?MFVENDQ5WTZ4S0d0ZkxVNUx5MHd3cEwrYmhrM1hUb21XM21vcWF5QmdaT2Y5?=
 =?utf-8?B?MXlNNHUzQkNVRVE1bjFYOWpjR2cycXh6Sm1GM0paM3h6WXpHWDFFbXRkSi9P?=
 =?utf-8?B?dm5NQTV3cVoxNmJuSGh0Zk4vV2ExazF4cFdBRTE5SFByblI4RjlIWkZ2dndp?=
 =?utf-8?B?em1mVUs5QzgwWWE4TGhVczdEYzc5bnFZTHpLUDF0S3M0dGVmMFhubUtqQjJE?=
 =?utf-8?B?WURwU2lPTCtRUmZCYzFmQ1U3eXRvRU52K2tkeXFoaGpkN1J2OWhPV095Qloz?=
 =?utf-8?B?Z25na3llSUNwbmsrNzZwamxwUGpHUFAyV2MwdFVER21UOUJqNmFxcmhraHFN?=
 =?utf-8?B?Q1BETUoyVWJidm03UjlVZEVtbnlESkgwbzBKd2xmcUpHK3ltcjZEWTFYT3Zl?=
 =?utf-8?B?Z1p1ZlRLa1lpSHRHVWoxYml5OERFdWhXRlJxWElHd3ZFWXJCSCtxMWpXKzlq?=
 =?utf-8?B?STc2anNDNm5oYUV2T1JwZ0dGc1BZbHNuOURQUndCZ2xPR3FXWWp3Z3pUNlNS?=
 =?utf-8?B?dDZpUW8vaTIvUEk1NzdwYVhkdSszU1haVi81SkhNNElNRXVZWnRPTjEyTGN1?=
 =?utf-8?B?K1E4UjRhSzFkaTdqWnpIR083M0FXUUxoUytubGFTaWsxZis1ME5WZjMwTGp5?=
 =?utf-8?B?eDFyK0dIWkhSWFBtTVFwaURlNjJ5bGR1eENvNDdQQ1ZoVUJQZTNIa1JIVjdv?=
 =?utf-8?B?OHU5VjhZZDdRWUxWS1I5VWpJWDFnV1Fha3orcitqQXNUQ3RUVnVVbStKN3kw?=
 =?utf-8?B?WnRMYWwxekpUc2hwRXpoZXRrRmZnazJxaU9pRm9zb3hSWFJVUGxLTXh2bTRs?=
 =?utf-8?B?N2J2eitmYjQ4N0xWeHMvMitObFFWL3NKVG5Yd3lNQUVBYlVnYnNGaWJBMWhB?=
 =?utf-8?B?S1FOYkF4Q2MzZmhRVEVRL20wZnFzQnQ0elZHVmhoczgzVFZUTGZiUFdwVzhV?=
 =?utf-8?B?cys3V2hEeCtoTkI4WlI4dm5zVmNFQnBrallhcXNVQjAwL3NJVnpTUVlOR2h4?=
 =?utf-8?B?MHlPalBkN3BHeDk4YWx2ZnJzT2Zuc0lRV1FsQkhITnVnWWlQaVYwbm9Dc3FB?=
 =?utf-8?B?MVNCWnF6WGU2enk0VkJ1R081ZmlBNGhOTHVwbTdnNi9Rb1hCYXJaeDR6ajNm?=
 =?utf-8?B?NXdtd2kvcTJLaERiam9saWs3aHk3VCtJQ1N5WVpUTW1PMGtNd2kyNkFEUFdU?=
 =?utf-8?B?QkIzemprMzhkQ1k4NHFPTC9yWnJZdVpld2R4akFkR21nbkhIbERCOEVjL3c5?=
 =?utf-8?B?eTNlMG5wbXZYZzRVMllLL2xPZ2hmQ3FlRW5vTW1UTWlYOHhlNWsva1dvYklD?=
 =?utf-8?B?WjZuektydEJocldTZHBtY2JkQ3hTbDM4c3NhT2lSYW5xRFlKN3A4QW1JV1pF?=
 =?utf-8?B?ZkVBUTVwQXU4VFBRRk5CQnJMcUQrTUFpRXVUZ05RNDFEaFN6dHlYM2Jia1dN?=
 =?utf-8?B?NlpWdU5zVUVUbkFmM2Ryb0xZRnpyaDdJNHpCUWYrT2N0QTA2UVZCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D914381EC883384CBB08BE05DB52799C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b383119-5b7d-40f2-0555-08dec5aaa333
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 22:09:40.6267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54/aIC7rkaoI5S6ouuilowHce/HUHDScKl7CQL9zEAvvmJfiUcM0ZsS1wjOlFV5njNszXbaqjgToNum0GCCCkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829

T24gU3VuLCAyMDI2LTA2LTA3IGF0IDE2OjA1IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRoZSBtb2R1bGUgZmlybXdhcmUgdGFibGUgbGlzdHMgYm9vdGVyX2xvYWQgYW5kIGJvb3Rlcl91
bmxvYWQgZm9yIGV2ZXJ5DQo+IGNoaXBzZXQsIGJ1dCBIb3BwZXIgYW5kIEJsYWNrd2VsbCBib290
IHRoZSBHU1AgdGhyb3VnaCBGU1AgYW5kIG5ldmVyDQo+IGxvYWQgdGhlIFNFQzIgYm9vdGVyLiBU
aG9zZSBtb2RpbmZvIGVudHJpZXMgcG9pbnQgYXQgZmlybXdhcmUgZmlsZXMgdGhhdA0KPiBhcmUg
bm90IHNoaXBwZWQgZm9yIEZTUC1iYXNlZCBjaGlwc2V0cywgc28gaW5pdHJhbWZzIHRvb2xpbmcg
bG9va3MgZm9yDQo+IGltYWdlcyB0aGF0IGFyZSBuZXZlciB1c2VkLg0KPiANCj4gRGVjbGFyZSB0
aGUgYm9vdGVyIG9ubHkgZm9yIGNoaXBzZXRzIHRoYXQgYm9vdCB2aWEgaXQsIG1hdGNoaW5nIGhv
dyB0aGUNCj4gRk1DIGFuZCBGV1NFQyBib290bG9hZGVyIGltYWdlcyBhcmUgYWxyZWFkeSBnYXRl
ZCBvbiBjaGlwc2V0DQo+IGNhcGFiaWxpdGllcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRpbXVyIFRhYmkg
PHR0YWJpQG52aWRpYS5jb20+DQoNCg==
