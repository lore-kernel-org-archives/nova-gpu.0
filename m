Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC62D2488
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161290; cv=fail; b=pcDdwk2OXwfb0gcNmcMrU6IPb97BwS108fJt+xImqkPlmAiVNFmn/mBlfGykqD2n70qS4FKGYsP9Xwk2FXm7/RRc2h1g3iw4jLHwou8wkCruWtW4pfoFZBzmIerECgx8ZDkBxoSFLlop3C1XVCcqg2jSGLEOL8/6QO5xEgn/aCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161290; c=relaxed/simple;
	bh=/IQEPTE7DNerXojNVafDT2DZLCqkp/XgE09gwrDf/gE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uCN+kZ84msbDRYtabY3S1N7U+0K4DjVf46G6ZaOpkqyDZUq0oToX4PIk++9upzasubfQY00YjcddsbnASzgFuVg6jbtLr/7042WeA4skyl6rMcaXNj5PMV8Y5RaB2g7LdXjRE6nTGouQXy4Wp4hJIJsvCcPgQOyoAQTZhm1ZRQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hx/gD85W; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hx/gD85W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v89qGX2Kcj74vQpes78gJ6JDVMBB9/SXBYJ2wcIbeQR1G7jl5vv726/VizweutSfQZmRon8zQAz7SfnO0C02FaIbzJfYMKP9f5OdXyNMaJwEF9jOmGTTy9IHZVWSNM6pFW1oMwL1ZRI1/2sHLJpQJ2N9ydeErOKgilKva3SI2yCG1Mnmsfhbcb8AU1jrTVmrHfnjJoEgSPmFaKtqr60MgFo23duv1PmbIXcDwsOrYJUvxlAQ1GI8NeoOvKPgXpMKr3oDCT9+l7i/jB1Yh6u05hTx586HPH/ZDeqY+deh0/qZW0bueq5Kp4V8uUaMpFmHXE5EmlNO7vL2iM/UuZnqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IQEPTE7DNerXojNVafDT2DZLCqkp/XgE09gwrDf/gE=;
 b=cPpjaowS4fMnuGVK28qNwKNzCDk6KwFHHcUJjzbRDAIP58tmUvE6k3d7qnOOGfcffEN/2hhMQuUqZAboNMnI5BInxk3eDSBpwtgitmJkztg2YoKEVQV0yGJcg+5pJAx1t6h+lgllqbfaoiyRmoeHds36d//1pTA7IuNSbrn2x5lmD7STuNDUi9+kb0Sm+R9Qc0XyBb5pzRyBuzM5bAZguoY9nBQ95S/J1+4UnMYqnDRi+CElplFwB7T5gr3lhW0JGY78FD8D29+fwFBjSL7/ND+FDTrtryfE9oLDzzbuSEdlO7AHjlNnb6bgntwEsJWvPZUWx3XX8atny0H1UmrlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IQEPTE7DNerXojNVafDT2DZLCqkp/XgE09gwrDf/gE=;
 b=hx/gD85WhQEDUV0oo+bYHxfxwx3bj/EM796yjKgS0VfUlK3hwe0R/0Sf9d/TsNYB/uY1Oa7MHii3FCNotki+E7m4rA4H/L7fwXQSpVttvSXF4a0lAbwsvabka9CS3Kwu8g6S+gXbvWLfEcIhwXMpCQP3s5JBHhk6afMFF5eAho8GOGstHE4jGzoe6Zu2yEn8ok5Y7WLfYIGPX974g1FRiksp3feZl/sGaUH7FMgmNJN1YBx+5tUtp5ldNzbPHtxQQTPegDZm4KNQh8SW5sL4+JnQYvsf+wnbsY2c3Bxzlwlx6o3tUfPtg69zaG1ERJNtvyFJAN5+DCLFELyL439e+A==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 19 Aug
 2026 17:41:20 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 17:41:20 +0000
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
Subject: Re: [PATCH 05/27] gpu: nova-core: zero-pad radix3 page table levels
 to page boundary
Thread-Topic: [PATCH 05/27] gpu: nova-core: zero-pad radix3 page table levels
 to page boundary
Thread-Index: AQHdL44qTtNYnH7FB0qIjMgeCTqgWLalpMWA
Date: Wed, 19 Aug 2026 17:41:20 +0000
Message-ID: <acdbae4ba36a2ec1b0afac774543b924ddfd65de.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-6-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-6-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ0PR12MB6757:EE_
x-ms-office365-filtering-correlation-id: 6a23ae2f-4c70-4cfc-49bf-08defe19146f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|38070700021|10067099003|4143699003;
x-microsoft-antispam-message-info:
 C/b8TjBmblk1r2Z5yT6hl849a9ieUEbz3qxxUBBiu4yefUhXwMYQqclzAAbqj7p4SN4YKMMvkTuwp/amJgvm0jbKOdqMTM4a4FNT+JayDiX3neoAP8w6+zKcBO7iw7LhOLZO0ePrdWakTpiib3P8L9DRHOM4q3t6dx0BO7JnbQolSYt/tKdQLeiF9n5GzAeKx9g5wozWY+2ODbLI7pL7jnb1iLhJO52IMsN7YO/jpoHwYs2IcTza+334mQRxh0+If0dX0lZ5RXr3oeEESo2Nzu2huevVuxGrEFow05fXKCAM0fQy0QctUvPgXLHGWV1ThWwJT53hAaPGesX345ynkoImAxXj4Sgf8IlAkgobDbyq7FBfwKq8av3BdfsHiGWWHNstDLYilcgcZiRkndojdOAwEFbWzwLBAscE21fhZnRSgh2nq3y/s+p3wwPuERnhD2+GRTsWnH8MmP9g8YEtI0I10CGKoWMO7cfDsSHvu5oYZziivhLv8L7bYhU6adQNsUvrHtXaHWOnyrbxh+3r6B2VyIqPkzihpK3H//aVr1FdteB+JWHOTwIASOyCxY0xXKbwYXq8pUUSzyYsp+POigJQnadBsOg/1ydG0jCybKCL4CAdssDjJokPtvzXWlS3orr75hop9ybSwQswh9acROnLD8bUVs0KndPRcS903Apkosy41/Cz2RNQbTEUrKhvPoY0KpS6kIFJMdb51Qinjrn/9lJ0PCTcYu1CHQ4AULU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R00xejBFMTMvRnRReHhHSVIvd1pOV2lleXRsUTZPenAyeTZ2b3NiWGR3d2lG?=
 =?utf-8?B?VFRJZG4rK1RNUVpjcWsxcHQyOXBlZ0pSMitnTFBtRlRLNzBTRElmMU56eGxB?=
 =?utf-8?B?VUJHb1JFSkd0dHBhZWpSLzV1U21QbXp5UTJxQkhXaTdsS2F3Nk1pelhQQjlx?=
 =?utf-8?B?T0QzdytXOVhGNHN4S2RES012QVQwME9qYTJrcGM1RWpZNGlBU2hienRpRmpC?=
 =?utf-8?B?cVc2SHpCMENZY2JDSWpkdUo4aFFEK25USklQcERQcndEU0RBT0l6cVB2NDJR?=
 =?utf-8?B?d1JSY2U1bHJyNlkyQnc0NVI3d2g0NUlmUGJLVXQzM0J5Uk15c2JXamNEVlkz?=
 =?utf-8?B?bmt5aHNLeTZtdG8wVTJENXd4NTkwRVZtVG1BOVZvQ3I1T2VzU0JjNnNoeVda?=
 =?utf-8?B?ZDRCTTNQRE9IbzVvdUdKMUFiV3BFQmZDKzBGdEF0NkU5NmFEcVZUTlZlYTlk?=
 =?utf-8?B?QURTS1MxajY0aS80Z015S0xycFo3Uk8xTlZKbUF4dFVaSFNnanNDSE8yQXNw?=
 =?utf-8?B?SDNwMmpjbjRrZm9KTEpFbWRoYWJaUFo0UkZiaEFCRXREcC9vOGM0L3RaSkNG?=
 =?utf-8?B?RzhlaXA3aXhwVjUyUDVrWEl2SSs4czhlUmp6Yml0M1FONXlKaVM3TXc2MUhV?=
 =?utf-8?B?TmlxZ21rY0JZRmR0Z2xyWHhBb2ZMNWZpMlYzNXVtMVNKMWJOVytRYTZqVHpD?=
 =?utf-8?B?MmlCRHJSV0FWUXRmdHJDQjNQMDJ1eDJVTlNyRGJ3UEdyTGpHRDJJUWtGSzky?=
 =?utf-8?B?UGpLL1dXRGFOc3pCS09RZHl1WHJxOGhJcUp2d05sYXF6akVyWndWb2t3SVF2?=
 =?utf-8?B?elllMnM1eTBHK0ZoV1ZNRHJWR1FyTHpxdkIrNkhPblg1MnlDUjdZMlNjaWhs?=
 =?utf-8?B?MnkzaFcwL3lVSjhMTHd3Q01SdGh6RHYxMzF5Ui9lL29TZjJuVVkvS2QyOHBR?=
 =?utf-8?B?SjN5MGFlWmQ4UUZsT1ZUaEo1UFZ1QmFJQzlIZXBXMkZ0TmU0Q2dnZzlSVHAw?=
 =?utf-8?B?M1ZLb3F3Y2FYcGMrendzSUJxYVlHMFV0Y2ZJZzFoM3dQL01IU251ZDlKUnk0?=
 =?utf-8?B?Yjg0RFVNWUFtV20weCs1eUdJSkJPeVRoakNYTm1QMEZuMmY1L0FZV3hkZTZn?=
 =?utf-8?B?aFYwemhDMjFiQWZ0dHFSQlJpdXRubnJTU3ZRVUgrUWt5c3JtZHlQcHozc2lK?=
 =?utf-8?B?Q3pwdzkzeXJxcW1ZUHVEQzl1TEhJbTFRTWhBMHNLUzRsUEI4d0dndG54dGgx?=
 =?utf-8?B?V3ZkQ3pmd0tPcFNZSHk3Vm1lVlFtcGNOUUs4M1hqUHhTMFZZaVVQOFplai9U?=
 =?utf-8?B?cFNMY0lQcUFJNHBZaWdoazNhd3VFeWlsbStyd0VpS05BYlpoNFZmZnVkWkpE?=
 =?utf-8?B?RWhHU2V0NWUwOCtGYnVRVW9FQnE2OG0yUDYrVXNmd2dxdWw4dlROT3lIRU82?=
 =?utf-8?B?clhoMThkMCtMNzBUN2tvbGVnNXNLaEU4cEFZSSswSVJXMFEzZDhPU1djQjA4?=
 =?utf-8?B?ZHpsaXpKek1pZGdZV0RZUjhpc0N2NndkVjJ5ZnBuTVpienVHbktJelhqNStr?=
 =?utf-8?B?RnpoOFNBQWxidks0cUFNdzZ0bGsrYUJnRmpRcjQyZ2ZzbUJYVTRHZ3U1ZTlp?=
 =?utf-8?B?TzE0N3RaY2dEUEIxL1I4dkMza3o1MDZRTlNLRXNRRkRLUGV6bnd0dXNRMVlt?=
 =?utf-8?B?bEpCVXdNTHZ2VEVaQ1hnRzhLd0FQNDhXT0x6Y3lKM0ZPcUk4S1VVMUgvZWhH?=
 =?utf-8?B?OG8wK1NvRFRBUUZoVFJLS25KV0dIR2JiVG9tRmpSM2Z1bWtoL2pFbHFTNE85?=
 =?utf-8?B?RkcyVTNhYjRWcVdzZ24zQlBMMWpWUWlOa1FIM0o2MGpSSWJvSGtQWk1Nd1ZK?=
 =?utf-8?B?U1BDdThReGFlUnNHblY4dWlpdXlDNTFXZ3BSWjZmcnRjYTZVcDNXeDV1N1gy?=
 =?utf-8?B?UUVaSTcrejJqazU4blBYQU5KS01YZFlFUkNZOTI4ZWNJY0ltR0szUGRQb2Z0?=
 =?utf-8?B?MHZmS1dSbm5FVmhWWGV1Q2VRcmgreUpJcEpiNmx2bHNocWloY1d3NURkenBi?=
 =?utf-8?B?aU1yOUpRNEN2akFXcjNlZzd6OHRTeWF4cTVJUk5LcEd5Y2ZHZFlpREtUYkF3?=
 =?utf-8?B?ODJjdXkrSkN4WTQvemp0UmJpWHV1Wlg1YWhxSElUNENscDA1ejFNcE1Ocm5Z?=
 =?utf-8?B?TGlnb05KbzZEWkZKRGpXc2lSVTVJdk42U2NWbWNGOWFTYnRPMDNkenl4L2tF?=
 =?utf-8?B?NXNNYm90VUxWdzkyZndXUG80d1FWVkRIdzNIRyttWW1SN2NuYWRkZzVzV3d3?=
 =?utf-8?B?OVY1OHFrenhLUmR3dEhXOTJYZTFrK1FacGQ5K0toUW8zWTdaVng0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <598CFEA13D3019418658D4AF62FA90D3@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a23ae2f-4c70-4cfc-49bf-08defe19146f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 17:41:20.3192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SBBRmPmPGrQkdJIBcjfIbHZGFAAKS9veW0/RJEWoBSK+X7UIBwUGi+W9McxKXTjAUjt2RqkmesQYz/buQTd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9maXJtd2FyZS9yYWRpeDMucnMgYi9k
cml2ZXJzL2dwdS9ub3ZhLQo+IGNvcmUvZmlybXdhcmUvcmFkaXgzLnJzCj4gaW5kZXggYjYwNjEx
YzdiZWEwLi5mMTRhZDRlODJkM2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3Jl
L2Zpcm13YXJlL3JhZGl4My5ycwo+ICsrKyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9maXJtd2Fy
ZS9yYWRpeDMucnMKPiBAQCAtNjcsMjIgKzY3LDE4IEBAIHB1YihjcmF0ZSkgZm4gbmV3PCdhPigK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT2sodHJ5X3Bpbl9pbml0IShTZWxmIHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRhIDwtIFNHVGFibGU6Om5ldyhkZXYsIGRh
dGEsIERhdGFEaXJlY3Rpb246OlRvRGV2aWNlLCBHRlBfS0VSTkVMKSwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsZXZlbDIgPC0gewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBWVmVjOjo8dTg+Ojp3aXRoX2NhcGFjaXR5KAo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEuaXRlcigpLmNvdW50KCkg
KiBjb3JlOjptZW06OnNpemVfb2Y6Ojx1NjQ+KCksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAubWFwX2Vycih8X3wgRU5PTUVNKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuYW5kX3RoZW4ofGxldmVsMnwgbWFwX2ludG9fbHZsKCZkYXRhLCBsZXZl
bDIpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubWFwKHxsZXZl
bDJ8IFNHVGFibGU6Om5ldyhkZXYsIGxldmVsMiwgRGF0YURpcmVjdGlvbjo6VG9EZXZpY2UsCj4g
R0ZQX0tFUk5FTCkpPwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
ZXQgbGV2ZWwyID0gVlZlYzo6PHU4Pjo6d2l0aF9jYXBhY2l0eShsdmxfc2l6ZSgmZGF0YSksIEdG
UF9LRVJORUwpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLm1hcF9lcnIofF98IEVOT01FTSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuYW5kX3RoZW4ofGxldmVsMnwgbWFwX2ludG9fbHZsKCZkYXRhLCBs
ZXZlbDIpKT87Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
R1RhYmxlOjpuZXcoZGV2LCBsZXZlbDIsIERhdGFEaXJlY3Rpb246OlRvRGV2aWNlLCBHRlBfS0VS
TkVMKQoKQ291bGQgeW91IHVzZSB0aGUgbmV3IFZlYzo6emVyb2VkKCkgdG8gZ2V0IGEgYnVmZmVy
IHRoYXQncyBhbHJlYWR5IGFsbCB6ZXJvZWQtb3V0Pwo=
