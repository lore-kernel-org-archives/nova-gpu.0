Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0293A48C5
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769057; cv=fail; b=fFvEiAz44mlg5OKG2nf64iL4ekaBmWtxNIcVhjcVrk00huEKhy/+is18F0/RSssBo6C1ffAN2RE6qm7v2FxrLbKGU3ETD10NiAVnGd3AoXGSrN9vQvhqtPVcXuspbI0a2YDFv6reim4931SV8veZo0Qj9CVkbozWhUe5Fpb5Bto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769057; c=relaxed/simple;
	bh=ApWW0LtupVP5GcKn2PXiEh2duEJ6kVwf1ZwhlRADZLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7NCwPpbO8vw+ArbKt9IrcPKazpsq+jNlSkInMsh6NAH6THGTdCOKqe6o03RApANFUwMZkstaXhz8hda1bSjxW8mx4qF52v67eBJkuessmx7/AYj3A/yG9S2EC9xUUPsvwQvw+iK0J5Dm+oLJsFKSkDPkBAVjU8onhSm7+fG+UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Unfj6NOR; arc=fail smtp.client-ip=52.101.48.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Unfj6NOR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR89YdnBM0d2ajBC2yxY3RMwQxiTN+kx9Bm2m41cU//9I6tqrTTUn6yXQ0uc9O8TMMlV8Yj4WqxZNTC4I7YSzkFFvHN40kG5qf7A/1gxAeeWamCVIMDkGc8I53PLQ7CkHeFl7amI+vJO9ou1ZDdqXtEzgypdYLJ/pT4kcyHUif6DMvba9b5za8pbuHewDS5yYsXTKjkM4OS98HuLLCWizOS831vODKszMSwmThG6LC52/IeXldrRUqdVp/Aan3A0KfWonrqqOFb6btH3Y75spJvbYkN9SvbiSAFPTrBXg+XpAN6Xit/eps4aTiKgMshiHb4cOI48ZTrqcjZ/+7oBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApWW0LtupVP5GcKn2PXiEh2duEJ6kVwf1ZwhlRADZLM=;
 b=IM0UPFHuromgE8kz3QSIXat0pOEWwISLoe+Tjvx0om0SvEc/Yw/dlrpoOvxNwepToIley0qVqOq+sv/MYpVwSXgY10v0kIo0Sgna35CF7xUvZI9fE29aGlt+BE9aPeInCvWC7g4BXJaJfspnBgiQxhDnAEGGVJRdnt3TeJNe1jRrAC2aIq7I4NzUnVgT+7bbJ7s3SkbLXCFIHQoZwcatWR2bGWzi+ZReeNtJUiyiLPt5i/sxxyl4QrzWgNcNbzJJm5A2mDXHbgRZxT5ot1PkR5pCk8QDbQPYy9MDfk/yS952cU9c6h/AM7LEfdTVpjB9DOg4OKJVOUrG9Y0gxbPcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApWW0LtupVP5GcKn2PXiEh2duEJ6kVwf1ZwhlRADZLM=;
 b=Unfj6NORTHSdeDVl2Jwqa2Lh3Ojg1aqCdNzSJUrCUXyNbcY3VbLDsl0gb+NDDpeIRFk8H4GY1T/9A1CTkGsle7V+UZKGJDfVbiz+rXGphX99Mb0gkMqFW2L8cm7T1xFpcdqEFSuUhvR6nbz8U3V2LH/a3lFfKq9lJ4LYliWLb8LGMZHcFdnSFuzTbsCvyTJSyRPHA9dtn1Vz1onNgZKXMgdovKFGjrPurcy9VQUNc2vwLFERCHBKWYxPGqaj5hl1x4SJQBEquf1M/JONM1+/A5KmhiwXR0t8jfztMxCWuyzFkyaqpVUIZOWg7l3uYrZMrWL6mFfht2XLhN8l/dpkVQ==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:04:12 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:04:12 +0000
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
Subject: Re: [PATCH v3 13/33] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
Thread-Topic: [PATCH v3 13/33] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
Thread-Index: AQHdRwocO8tqIbxwFEOWOfNT8nxTFbbU5S8A
Date: Fri, 18 Sep 2026 22:04:12 +0000
Message-ID: <97808ad4a56c5fd5977b61beafbf36d7ed65869f.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-14-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-14-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB8145:EE_
x-ms-office365-filtering-correlation-id: 1fce7c5c-58b4-4b21-6cb0-08df15d0c580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 0pfFtwD0giRevmS/f0ChpqwRL9xiXz1s7R7v1NvlxbYgBdBi+rtzWOHX8DPezOVE42vPdIy8UNlc2F7y0riSI69gkBFoRbgeFcnHkkMlx+Uu3rcxLGuOjm8bAS6JJfo5GsBPgMYovynGOGDSeDsdifmKYjoxIHspm9EURPr8cammucS/Rcmmlyc9vFeC2tqRcNTmcqEqt+2sLD+bCs9wR3kIhRyg+9LKAwS+7ZgfJFgYwY9G68r1gCf3gbuIBnxDezBwS6LtS/LFTHpiuu7eefcHRcBBhvvauuLTWPIf7mP6tSSWUsOwMn3ESOh5NZ6S3bN1TW/MsvaBp56UIVSKpsWBNQ4E6CDZipyxXv5wRBo9PJEl7qEgobZWaK+jQLutNwRAfyb+Tq37VIh7B7zcnx6PR8dK/839tzbNdSROnVKo9Y93GcVU2tj7Nkp3nGldglidbHNhNuSgyL5NbpX9WG85jTa8clLEwgan4+c7vSxBC6yEGVsnPeiDmSoMQosINNKoaozi0N5WXVE99MNKdZaNHhJdl/6KuiIBc+hS+1LE2SxBVdxotP1dt8SEU/krImrCLvLXaSEaD868SkzWhiKZak+Gt4YPwEvuXrUCP04yBq6UThexcXOm0c2TtotwnC0YW1j/CrxeZKiX56mx2zaETuuV3j5464CeU8+XN5Fx70jleoAKXVYYYaTOaNn51W9gxaqGTpFlusLBIN4jBM5ZJjjmJH+UfTlpQpkip/8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWY4R1VZR3hEYlNiTUgvU2NPVFZkeG9zbi8rWmlGMlVJYmY2Ukw1QmpzbTQy?=
 =?utf-8?B?UGhUc0VZMnNzQ0VmL2lYRVpXbDVMTFRoaVN2QllmeURhZFpyOGU1M0tlaXlS?=
 =?utf-8?B?bHJnRHk2d1g1S0xYT1l0bUtUTW92UmxkTkFJWkFFRy9FSHhHRXJIbDlMTEw2?=
 =?utf-8?B?czZKQ3RQaDk4SnNsa285WjkxeEJraDdMbytTdWVWdDM2eEQ4RjAxT0xNUmtN?=
 =?utf-8?B?cGR0VFdQOUl5eDhlaWhKZzViOXB2Y3N4MTZWdVNSd01KTE9VMmRJMy9MZDRJ?=
 =?utf-8?B?Z1J3RmhYY1BjS05sbHVDZGxZOUN0cEh0bzM2Zy9PMGpJcndyWTFHMlFMSm4r?=
 =?utf-8?B?dHMzMlk2NlZaM21uTTZja0tNNUczWUkwbG1memUvUVZ2ZHh5VTcrOFZxWU9C?=
 =?utf-8?B?NU8xSXBGem5BTXFPRTBhS05HSkErS2pxODRnUFhraDJqVnlKdmEyMm9vVlpF?=
 =?utf-8?B?NXFwNnpiZjhqYlpyUHoxODc4M0k1UFd3cmNiSU12MlhjMHhFWHpwbEF5c2Ni?=
 =?utf-8?B?TFpyNEdZbnlqVzZFWDNacWgvZXlOTE85TG1LRkNSbkJaVzcxQzU5dXREMTkx?=
 =?utf-8?B?VnNpNWRiaUdNdXk4UU4rMHBkTDU1eTEvcTNSSmduajFlRlhSNmVSdXNXTjR0?=
 =?utf-8?B?bWFIek1LV1NhNUp6NERoa0t0Y2JpaDU2MHNMYVZmYzBGZDlFY0pTWTNtTzdp?=
 =?utf-8?B?ZnZtcXRTTktwMlhxZ3RJMjlXSjNmWmJvaWJRQVVXOENtMlJ3cXQ1Uzl6ZVZY?=
 =?utf-8?B?RWErTjZHNm11MzYrYnlDcHhLQWxxNys0SGxxWFhBQUdnV1BTdHV6c1ZLaUhI?=
 =?utf-8?B?Rk5HUG1sN0xYYlVlRWlNQ2FWT1NkQjNjTlhDMHhVQmplWlc1SHk3c3ZnUHhP?=
 =?utf-8?B?a1dZOXFLVnFNdldlalM0VGtXN05JYW5sNEVCem82N0wvM0J6eUVVQ1Y2YllQ?=
 =?utf-8?B?cFV4cGNoSXVWb1hQN1dvc21FaDY1akFzQXd5cWJyQUR5M0VneW9rUTFzQVFa?=
 =?utf-8?B?U1M2Z1RwRnpPSElNdjdoM0IzaTFxNGQvMkNYQ3JkZFA1Q3JITXMvMW9uRUZB?=
 =?utf-8?B?MHZZcFNWcmtTb0ExMVlqUDlhdnNub2ZSWksybCtVWGJnMTFhVmRqNFQ1dnhs?=
 =?utf-8?B?M1J5Y1AxT1cxeDVRZE1LMjgwWGZkUUc3RGVIME1MUjNMUzdXSHBNS1B6Mnpx?=
 =?utf-8?B?UERCZko1YWg4YzRLUldHT1FtVm91MEU4Yk40U0QzQ0pWNTN2THBQem5TNGVt?=
 =?utf-8?B?aWhVNHpjQzBmTmNjZmxNQy80SXFkSjg0RURRLzlRVWJ4amMzcHpwbnhCdUdS?=
 =?utf-8?B?Mm11S1M4Q0tvR3ZXYkQvTEVqa3N0Q05VTkpnZm5YUHpXb3pNektnejI5Unk1?=
 =?utf-8?B?dUxld3NZaWUzTm90MkdOOC8zdElVeklaalUvMDltbmJiVjQyV2pzSDAwLy9P?=
 =?utf-8?B?VGF2V0UvTjVqaDl4aHhtVFcrM0pMeUcyMTJSOWd4S3Y2ZWlsSVgveVdWVzhL?=
 =?utf-8?B?UjZpbllsNDd1R3h4eU82SWI2STQyNG1QN21lOVMybzllZjl5TDh2bXZUNUJ1?=
 =?utf-8?B?RW04SWFheGFnT0I1a0YxMVhnZjQxZnFPQkVHdDR4R0o5Z1BNSUMwT1d4ci8r?=
 =?utf-8?B?cmQ4bzUwaHBSeEVKclozTi95M3Q3QktrdUkybHBCRCtZNGo1bHNRaVpFRnJD?=
 =?utf-8?B?anVwRzVyUGlNRDd5clVVMnJOclQ0YStPVkRzeVFoMWw1OHl6anhnd25WemRR?=
 =?utf-8?B?M1hIdlBJWGlldVFLMGs2bUk5SlFEeU41ZENISjRKSjg3ZS9mQk4xNjRzd0sv?=
 =?utf-8?B?WDhrdGcydjBNd1RYSUJxOS9VWWh4MzQ5L3dLY0FmdmNrcGdRUmJvdGNubE0x?=
 =?utf-8?B?SlVZU1B0RHpOR2IweklJNHpOZ0xMb3V0TzBCRDROc1VMc3FkeW4rak1SOWNh?=
 =?utf-8?B?d2IvR2NUWmJMWkRJSExDNmIyQlZaMGZ5TkcvVHVTWDdRU2lRNVp5NXVQeWQw?=
 =?utf-8?B?QndLeU1DT0NqYmNwY1g2cFdVaVFMS2JDUXVHWGNLNUlsSVRsWlRQZmhkcGw4?=
 =?utf-8?B?UHlQRUE0OEpFZUlWTEFvYWtxK3ZzVWkzYk1tMWFMV1o5MzBManFnY3lYYUoz?=
 =?utf-8?B?M3pLOXh5cTZ2aElrRktTb2ZXVTdMVEgwVHd4VWF1VXVxNVhQSnRFMTUyZHFk?=
 =?utf-8?B?M2FmZVVJanYrVVZTLzdTa2dIaUlNcXVNMERwZmZqR0Y5Z09VYkpoNzg3ZUN6?=
 =?utf-8?B?c29uS1lsVHVQc0M5UzBLR0lBVGV6cEhiMENLWm1tNDhlTnhSbEpmYzd5OWUx?=
 =?utf-8?B?TzI5dEtxZlY3bjkvWTIraWdWbkxsVkZOT3R3MlRHRGx6a1Fwdnlpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24A3CD4DC4948B468DA01A7017B99008@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fce7c5c-58b4-4b21-6cb0-08df15d0c580
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:04:12.0739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2c6xQV2a6xfbxb19i2D6y1+u74i2mBelhVKf+pBg2HYG9lw9J3HPPrPyadqoTrOmsslKsD1G7nCACZhCIKk6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJzIGIvZHJp
dmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5ycw0KPiBpbmRleCA5MDE1ZGU5NjVhNTMuLjA0ZTM1
Y2JjYjZmMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5ycw0K
PiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uLnJzDQo+IEBAIC0zODUsNiArMzg1
LDE0IEBAIHB1YihjcmF0ZSkgZm4gbmV3KA0KPiDCoMKgwqDCoMKgwqDCoMKgIH0pDQo+IMKgwqDC
oMKgIH0NCj4gwqANCj4gK8KgwqDCoCAvLy8gUmV0dXJucyB0aGUgc2l6ZSBvZiB0aGlzIGZhbGNv
bidzIElNRU0gaW4gYnl0ZXMuDQo+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBpbWVtX3NpemUoJnNl
bGYpIC0+IHVzaXplIHsNCj4gK8KgwqDCoMKgwqDCoMKgIGxldCBibG9ja3MgPQ0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoA0KPiB1c2l6ZTo6ZnJvbV9zYWZlX2Nhc3QoKnNlbGYucGZhbGNvbi5y
ZWFkKHJlZ3M6Ok5WX1BGQUxDT05fRkFMQ09OX0hXQ0ZHKS5pbWVtX3NpemUoKSk7DQoNCldoeSBp
cyB0aGlzIGAqc2VsZmAgaW5zdGVhZCBvZiBqdXN0IGBzZWxmYD8NCg==
