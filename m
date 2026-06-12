Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E223E2771
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281461; cv=fail; b=RB1Sz+TibZbe7F/aR0H4oe7Wir1iaQT9GTBfomT43S0buhp2XF8ib48x5zCgJ7yWobOVT4DkgR9Fa3k1jdEEQ6GRQkk5jWe0w2Ydy5FTsuQ+WQbZRq+D298fW5rlAlpAZuRef3meStjDLdkfTRO4thE5IcFEcdMeXR/S5yE/TJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281461; c=relaxed/simple;
	bh=Ap6RqenpvHcSbTqcNJjL2zudjue8STPjRTGzbBbB9WY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GrVsmLyxNC8d9k5xOIFlSxKNmjnsb29OBQKgX2nFLyOngpVX+clXshW7B7ckl7kr6dF9fuVm9ByLoSYms3p6QwscGGn5utSwVVf/+8WSQ69vFJlUkeTzMSzBSrCAK+R+Yu+/RbynTy2ARdPT5ZkuRALmt9UIMkOg3A38QWIx+i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=isuGgrLm; arc=fail smtp.client-ip=52.101.56.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="isuGgrLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klpAc4Hm73eyDd3FwUPMUZdjEg5Jn/hO9+6Kn9J81jpP7jWVUX4EDMKIP9AleAUQgY1RLkvbJAqXZB98RmYf6Hydpt97YfGDhH6IrcFH000OoPdBodAF9B0VM72GrvysosQrvOTxuxks5TudsRwmb0RUHFwKbDmVdC6PDNtNxjgRbk2nwYIcnJ3Aff3CAPKs8fZcSVgRrB5HGV/QwG/ezDUGL21QOmyX3cGJP0H0t4QkjY64lOMH3QxDxBZ10gcRRQhMynBVabGlHJupv703X/Rcd1BQLtCMmQPa7Lz6o57P0ny1MzW6ozkeGNJlqswn+cCDdr4Ucko3P01j+Pjp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap6RqenpvHcSbTqcNJjL2zudjue8STPjRTGzbBbB9WY=;
 b=hvLMsG85QTun+wAycDeAxu6mU/qASBApaxKJZg4cHlKUh4vql0EH9Xt09LnP3JX6v0aDyXYXrDI1wk5PUpdMMv0bzvy45ZQjqD4noluycVmpYFiqAsE9pOF+4u4223LsvfXX3yYWdK1T/qamXzHdV7r85nhj/ECNXN8NNinltK3RNlTfMWjgjrSu91xvuobmKtnGyv5lqXklA5j5w/AphdlwQin5R5HrqcHSjQl09rRnCd1CZcg8XD3SpDlPbbx8gIxhV0Cd9cdDzmpqx9WYSUk9J8KsY4eKi/QB4Bzq7nf9l2PaigZOL1hzimeICBHJI2xgJPuDNgQhTo3qrpVqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap6RqenpvHcSbTqcNJjL2zudjue8STPjRTGzbBbB9WY=;
 b=isuGgrLmq+coEq/yFd+jUNm68cb67HDlH23STBUzyDMzue1mOlt0kg+tFXGvmdviux+ZVLhm1oWPcV7LXrldBb2fboXW4WorLCl2ahIFO16I5ni4kGyyXsrr0WuI9TWwT8F9fCqyfq1noGxISPwTjAF7YIxjT7Uefu7+fHUtjQMkNj5476hReEdIT4+l+J0vSrz7OHa0PziSItVfy9iaPOOvF7OSJMjFGPYK99PgnhVWbV5+LiS6PdGPu8eynY45syEUsK31g36DHsWz1t1xpKd0RW/ZA6quKbpIoM67y6Cf1LAh7R2j/KyQwjwHmDSx35GPWDMRMVfPfSMSbbNCQA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 16:24:13 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 16:24:13 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, John Hubbard
	<jhubbard@nvidia.com>
CC: "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Shashank
 Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Topic: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Index: AQHc+iCQTqnYSszeFEy8vwxH7+fwF7Y606aAgAA8i4CAAAargIAABLKA
Date: Fri, 12 Jun 2026 16:24:13 +0000
Message-ID: <f00293b2b144ac264bcec657429492ca44f99c84.camel@nvidia.com>
References: <20260612040420.121499-1-jhubbard@nvidia.com>
	 <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
	 <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
	 <DJ777VLZB7BG.1DY1X4UOS0MWJ@garyguo.net>
In-Reply-To: <DJ777VLZB7BG.1DY1X4UOS0MWJ@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA0PR12MB8087:EE_
x-ms-office365-filtering-correlation-id: caadf732-1de5-4126-f511-08dec89f0ab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|23010399003|366016|376014|7416014|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 FTAXEs33ywJBQb8qBJFcGhyJQ3HZcmq7s5dV98lbbN9AOCtXgEs52cpcBBvXHrKAhq3hGcRtDPI+fQiah4mUkZO3GTBMEqRGCcdSmNdqFlaobt5W75uEIp+zjzgmn0SXCXn37+LscVL1g+WQfvcTLgaLdqAQ2euKzZBQXZbd0hytdZL+EUAtQAUsRD2iwaD9tNif6ixgEO0NpFX38lfpgYNtMaF50Zzy1/5Yxnh+Jx1Ogf+1u7A6i9gD7VSpK9hRE3ZNS2GqO2Z47zwBsxujaTMsGiqhEVuRbEgMCdFd6adHpBNyU029TGROXzu23ZowCHkj75uEUUiuHRJLJuwFzJEsYJK4OeT0yt4fSJIB6cn0MEiPQyK2zVNFXpHC7JG7QezvwFWbOYye6kMCp3uMTAMjS/wuDrf15ga+ycN7Z+YoVXVypWC6/RMu+vgDSCegWGnT5mp3RRSUyrn5Vmk2kElg+GrpLjDMGPr/5lg1UiprVUyqnOZawt69Slznt9U5qREOXmlH7S/9FYmi2BuIoh66ltKXEBtcQGNaV73muqPLvpUmxS1j7W7ZWXsywGsJb9XtG/CljAWeqS0l+ztpCChY7SGSfIZpRU7rDbzCwR2qE21+4Te+CkC6Jx2vQaK414ltdTsR0dV9Pe/vrDSrwuUFAA4gClQKi82A7bRus0KAYvCSabIbz9lmJ8lWrnC5m4UFJL62gwld2S+azdJQjztNRAY5+HCqJUvCzBbAuweRh6oK5K9BitNU4hYl6tGy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(366016)(376014)(7416014)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjEyK2hLVThndDhHUU52UTJSSmRhVng3UGVrejdNL3pIUlpSaUpXa3JldCt2?=
 =?utf-8?B?R3NzNS9NVXg4dXNJR1huM3Q0UFNVVG13UDRWVmVrYjdkZktzZ1hkY2lrNlY0?=
 =?utf-8?B?UkRkajlBUXZDcm1Ia0dUcHhCaEFBMEhoM1BHM2FkV0JPb0xsR1V6UFA3a1Bq?=
 =?utf-8?B?SG1jZDJ4bU1NdERURFg5Tm9tY0tQZXJVRWJVekc3djBWUjZBUUdYMnZDOTZC?=
 =?utf-8?B?dVN1NSs1MXhPNThTa1RKTDY0UEROVlU1SmRYNkgwdVo3R1Q3M1hydzI0ODVF?=
 =?utf-8?B?am95STJwTGxNR3hhYmRlY091TWlJWkxDTWU5eHRzNDBXOEw0RlE1SWhSOXRN?=
 =?utf-8?B?NGluK2RQa3NEbVBoYlJ3ZFFadWJCQWcvZXZWWm9zNUpFdXVRY3BCK2pKVnoz?=
 =?utf-8?B?S1pKZlc0WlZiY09CTnQ1RHVyQlRIVUpCNGgxWWZUamR6ejArcHkvaTY2Smc4?=
 =?utf-8?B?OE1XVHRXRi80eGhvMkdTalZaeSsyZXZEa3V2TklLaU0yOEF3VjdpTldzTlBn?=
 =?utf-8?B?MXJwV2JDZ1hrMDdQZFNIdXlXcm92WlFmWThyK0NEMWJvY1NMVDNhTFhvVnRD?=
 =?utf-8?B?dk0za1ZDSUZtVE5nQXlERC9kQS9QeTMyWEh5MU9XajhXY2N4QW9sQk9nOTNH?=
 =?utf-8?B?bk1LZm9nWi9MQWJURFh2QXhlRmRsVytFdTNjRkpnMUFUUDVvS25Ib0FaTHM0?=
 =?utf-8?B?cjZjb0RzOGdjTGhCWExvR1pwTi92VDY1MlRZSm1sTXpBVmI2TThsMGU4QUI5?=
 =?utf-8?B?emJGMVFHYlZPK2luR29vc1F4Q24vRXJYQi8zT2liM2ptMVJWTi91czdNQ2Jr?=
 =?utf-8?B?NDZsL0dCRkxnOHQ5N3dHVGYza0pjVkxQUmozSHo1NGRKYVhJaEpBWE9VNE9T?=
 =?utf-8?B?VjVWUEJGWXJYcUcxbmc3ZGlOSjdSeXo3NlEwTWt6YThtT1l4cGJ4dnErM1ZJ?=
 =?utf-8?B?L1UyMDI2S255aFY0VFN1UmJNOWtYU2VWckkzMDVWY2lNMFVZeXJFZlF4ZXg3?=
 =?utf-8?B?amFIMVZIeTBjNElCUkNINWs3RW1vWTdkMGRYdGhXUEtXUHNOcVdJQ08rb0Mz?=
 =?utf-8?B?VTRabHp0d04zY3dzRHkvMkU2OGhiM2tvNDAvYkl6Q0VNc0xrajN0c0VhSkZ2?=
 =?utf-8?B?NjRoS0RlVmovRlgrd1hTYlEzV05OdUczeDRFQjFBa2UrTVZSUFNIUWlpeWpI?=
 =?utf-8?B?RmhpMGR5eG0zTE4zYnp0UVFBSXZJazVSRitaS0lkbGJhak8zZTFwMDJhbEdt?=
 =?utf-8?B?SnZrWkdaTnJNLzFBelY2bml4dkVyWWk0YUtrL2JkTWxUUzE4VkRybldwZHV2?=
 =?utf-8?B?a1BKKzhnTGgzQXFxL09IOVBKM0xhYWJZTWxMb01TQm1yTDljbXNpSTJoY3lq?=
 =?utf-8?B?ekpCaVNJM0dwcTZCS1dUZ2VheVcwNGxaaTlxZFE4YXZDYzVTeWZkckdFMG1q?=
 =?utf-8?B?RDhpcmdhOHZnQ0VxSG9iY0Uya0JIdVF1dDM1MXZLWS9iS2xSWkdpcjhRZ2Uv?=
 =?utf-8?B?MHBWTmFwcnBPMlp0cHlZaU9LUkVBbVhkTkxWMEhMcko5c1ZJQ0Y0ZGUydU5q?=
 =?utf-8?B?bnJXSXJuYmw4NU96eTlacDVUeWlKQkppM0d3NzR2QUY5MzZYRGpzSW9IbUxJ?=
 =?utf-8?B?Sk9SWmhRZkVHdEVYZVpaZDhsMXcvT1k1TVExRU1xV0F0Njc3U01RZms5UzZQ?=
 =?utf-8?B?S2wwNFdodlRha1BKN3NhMmFxeGZkMW16MmhpelRLNFhrdmFxZU9YZVZPUjRN?=
 =?utf-8?B?Qk1jMlVpRDRDMmRja3c2azdNZ0x4RklKWGZWd0RSUzFTVU1ncWVHUTErZFoy?=
 =?utf-8?B?azNhcUdzWHl6TXpyUDhEMnhVRXNGdkkzSUFTYlVXWXpUM1dWcFJoenBqNTZ2?=
 =?utf-8?B?OHVCY1N3SVFuL0g2ZG1Sdkh4WUREamRsSTBXdXladE1yNFBLaFZvMHNoWndy?=
 =?utf-8?B?cGdrK2JJUWdTQm8vakhWZTk2MTNoTFd5OHhqcnJWdDVVZlN5K1FOaVNIZUxF?=
 =?utf-8?B?TG54QWZaK09OcG1keGxuWjA0MWdaem9xY3EvbmFXa2pwYko3dVN1cDlWNDBt?=
 =?utf-8?B?b1paakVIVi93a203Y2o5S2FiTGIrMXhUQ1AydFR6aHpZaWVGVk5oT29ZbGlE?=
 =?utf-8?B?VVA5RXFrbzRPdVBwSGpVQUhadWlmUFJweDRyNHMvaDdYcU5oeGRPQXNhUVlP?=
 =?utf-8?B?WTYzWE1PQ1RZTUphQjhhZmRaRlBwRHRWbityN3ExZEpXRk82K2hXQWlqa3BE?=
 =?utf-8?B?d2M0aTlxTGd0VE96am9ZQzI3bUoxSk1idmtjOGRVS053Nkp1dlhrRmQyZFRa?=
 =?utf-8?B?OEJqSUNGRVFZRWpUeGd2NVpLa3dOWVE1dHpxM0g3bWFlWFZVSnNNV0NzTWl5?=
 =?utf-8?Q?0Usk+GEMq/oVVYf1df40A+kr6q5AIXKG7+bXznJS4MTTv?=
x-ms-exchange-antispam-messagedata-1: L8mC6d7D4kY5jw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <03AC222C7888B54D85286F62B86DA881@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: caadf732-1de5-4126-f511-08dec89f0ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 16:24:13.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSfn7Oa92mvqih9f/XykicX87mCiM1XewJcQSJlWWrAn81XE4SxCXho6zdMaZqBP+EHy7PjKNX1oMHeGN2TPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDE3OjA3ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gSWYg
dGhlIGNvZGUgb2Z0ZW4gbmVlZHMgdG8gc2F5ICJIb3BwZXIgb3IgbGF0ZXIiLCB0aGVuIEknZCBz
YXkgdGhlIGNvbXBhcmlzb24NCj4gd291bGQgd2FudCB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhh
dCB0b28sIG5vPw0KPiANCj4gV2hlbiB3b3VsZCB5b3Ugd2FudCBgR0gxMDAgPCBBRDEwMmAgaW4g
eW91ciBjb2RlPw0KDQpJIGd1ZXNzIEknbSBqdXN0IG5vdCBiZWluZyBjbGVhci4gIFRoZSBwaHJh
c2UgIkhvcHBlciBhbmQgbGF0ZXIiIGlzIGp1c3QgYSBwaHJhc2UgdG8gZGVzY3JpYmUNCkhvcHBl
ciwgQmxhY2t3ZWxsLCBSdWJpbiwgYW5kIHdoYXRldmVyIGNvbWVzIGFmdGVyIGl0LiAgVGhlIHdo
b2xlIHBvaW50IGJlaGluZCB0aGUgY29tbWVudCBpcw0KdGhhdCB5b3UncmUgc3VwcG9zZWQgdG8g
aWdub3JlIHRoZSBjaGlwX2lkIG51bWJlcmluZyB3aGVuIHlvdSByZWFkIHRoYXQgcGhyYXNlLg0K
