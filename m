Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0D344023
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195587; cv=fail; b=dkudTqpYIEPeE5AIG9vGC501EftjxU3iUbFReRKABXUE0x3yQpCWnzYhIeqKhc19chq72B8C8Er9XM+oG3qs8EoPEddAqKkSnXXVruV7FnkmqwL5CB2CoxOAOm5nXIGRnmteja8k8ef2yGrPyzBckLoEZ/E7o3zYb8RV/pPOuyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195587; c=relaxed/simple;
	bh=ArjfQ/NVTjiKFegNCXNHrkWGIsb6cWTW55EtiikxqBE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fu3PCAxPZzCg+DlsYVCVUvUOyjKqIyPsKjU86B0gCjEQrmBsVaOhHrdfs9rSMpwpKsASeTonNhFu+YtA2kckX4zC9OY+x0OOTjl9zOrwPCsDJSk83ZHQ94bh43f4pxIYzl3X095wVpweL4jtnetYJZkCJhIebOnzHNP0nIDvL7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p9JLqIsx; arc=fail smtp.client-ip=40.107.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p9JLqIsx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIkNvVNzPq1gG+V/6TS1+tcoaI0Qmk7dT1FUf1LW4rUYYg7gnQkYLT4xNLhtT+mSruhdLAgVgt7CMwQEyJeD9FaiwpM7H5iTiXYhHnqNQrAZuaPe4WNJ3vfGbaLbiuodXJCGHTU8PBumMKdXiYr6cflFbq7ZA/8XHZz2+ZHx7Zdkv7TYVe0oGDP1Rx5Rip8dGKWIrQg8XjViYw1L7m3UNL6ZOTqZPF/Q8PGh0zDSngM1dFvnQqX0xNQQVei+A2xfKvTiJTKt6gsGuG61qDRo+X1sMmw9P1/AXP0R9D8KiY0S/eextOk1h+RrjWPgfsaVbEpRbPJ/VQElwGvnTd0OBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArjfQ/NVTjiKFegNCXNHrkWGIsb6cWTW55EtiikxqBE=;
 b=IDTU508pxyN1Eskwy747AwLj5EwwUgtH2poKdM5MZYUwVxM3Kyd7YcbxW3+GGgkYcwSJfwolMjDwHO5mULotZGSUV3y39a2KGBFikTEOS/U3WVgQ8j5fh6rBGP3OceWLaMYZTS5VMNdhFZDH3o7qHTOVwkPnN0uHZDc7z4oCc6VBEPEnbJBbKP8qjk3UAvvRg4sVpAiNGeWdW80PfJsgNzZe80qedPKPXB9o3hXv9FVUCPyV5v3J6GmAA0e7W2fC49+/2zpPlJWpJc0FAl4MvoiFl9VOpNduLPHZ6iDNVk+ajMIAwU5D4Kfxgv5piFqs7aP77ZWox+48Rq2DSa2ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArjfQ/NVTjiKFegNCXNHrkWGIsb6cWTW55EtiikxqBE=;
 b=p9JLqIsx+0ctp09cwTCetPn/82ItadHniONaWGhWD3EQzoWo/EPBwboffr/nSkVtvdP1uod2day4k1GMBLcAb95RjZj/VtjQ6JeCV40AWYNPRjCXJssUopIaWovh+vYjeDhcC7PHitkoU89MwDAnSxlyVDNfV7DBlOsDsPw+ynMYcDBKFfjIl09RIjqWNI9g0ynS6If3em23f3YYgE3+WOo0+eDe/VBJ0THxfxsnxMYBxyFKAIsJy354wu6hOXXZhbjHNLY5kuPjU/QSQoo4vHRNTlbjUHI9ADXNX2dcYOmTmoLrGY/HxTVpBRv6SHO1HTKyWpJIHhALrTu4oYOszg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:32:55 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 16:32:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index: AQHc+QGZGJRxryX2J0aNJYdBUK6JarY46wMAgACi4QA=
Date: Thu, 11 Jun 2026 16:32:55 +0000
Message-ID: <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
In-Reply-To: <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CY8PR12MB7316:EE_
x-ms-office365-filtering-correlation-id: 13bca071-a5b5-4774-2156-08dec7d7173a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|376014|38070700021|18002099003|22082099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 iX7PT9uypHZjXjyf5WWW7WAXJV38Zq5FTf8+BIdWIFgv/138XR/MkVpZV+86E9vTgpGnspjEhNVXgrHiUjE9OX7H4VYtLCWlVRh1/+CQieOuEbqMcz9A2MXP5//B/32/sBZl05KjvXw6YSdk/UuHTidbf1oVbINNFfpjf/nMOdMM2mcJIM6mt+f6CimIUToZ3bRDpuFGDdNurIyaC+sFccIRo7oVb0jJedwHjgP0ErOtp2quOdu7iaQXIsDvvihnzEFCswzq5Ynrek354VioQaZEEqYfDKG+EwuiQsM/T+Z8tQ2EqBSyvQGxDyLj1qnCQhB0sPhCT/RlWbyKR4gauR6IM90GvSoUihWOI2gudasIko8mJPuL7VlcWW42ejS4jhbK2XHcuiWTmDdokI51tUfkikLpldN80nl4oW/XFb1Mi9XHPdda2OcTaT4XFjV6hy0+nLcbDWKy4f1VctAkM5nY5RoMPtEna5U+tHJaL00hDI3Ijwd6+gywdO7jfKmomYGulKbRiO8nD//RjZqGPbh9GntwHZpgy906UjM2bxkmgMy9mMll7TlrnhRx0tgWyJpPS+n6U/k02/3q8uk/h5sOf5UEvWDWgWjv2ZMBsMc+Z3A3aQbKX7oAjz9ejC0KhDSvyof+1h5vMszN95weAOmSxTQrPKLU0/rrm7z+a/Bf4ymr81KgZhOdEMtl5lW1ZamM5DZs2a+0R7OsSQj4i4/AUfskkus47nEUyWBVbp0MQWAzYYq7hC8aQC9DLmPq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3c4YytnTkx5eUNZUGJvUEQ4a0RuRnFFM24wYjZacnRlSXUzenJHQWNhMkZG?=
 =?utf-8?B?SlRUOFBsRDZNdG04UU1kQjVjai9YUUoxbXd1QkRkSXpGRzZkTmRQNWFYbG13?=
 =?utf-8?B?TnY3Q3UwbG5JN2dSZy9kRGFUdzY1MjdPRVNIblkwRmxOSzJobFNOWFYyU0tJ?=
 =?utf-8?B?Vkt6S0lETmhhTHlhZldLZG5mREliUGRNdTQ5YkRuMm8yRlNDM0E4RVkzektl?=
 =?utf-8?B?Nng0RmRpVWMrZ0Rkc1AxZXBZS0VaekZwTEt4M0tGcHA5cDJQLzhPT2FMeW13?=
 =?utf-8?B?c2s1YkRMamUxRC9VMkpDYzBLQ0xwNXpjcFFYazdKb0cvd09wTXU2amIvM2pR?=
 =?utf-8?B?RmtuTXZ2TklTVEVzbDJlcFF2LzVoL3Yra2Vkd0wrTFppNElOdlo0d2R1dmVU?=
 =?utf-8?B?bnFjZE1UbGcycThXbU11aEI2UmM5T2dwcDEySVpoc3QxcUdGeG5kMFQ5RnRT?=
 =?utf-8?B?eEw0Y1JnSHRKRERHcHFDV2VTSnJQN3JRNlRHMmxGZUQ3TWJlSklkVk9KZ3dV?=
 =?utf-8?B?KzJicjRZSlFuWjR6NHFESjNUK3hSSnNKaVJSNFFJMnJ4a2VORCtVUkpQV1VX?=
 =?utf-8?B?UTR2RlZrdmVTQUJCdDBKQmFoUUxGbTJQVXNKWjAySyt2eXNnbWFid3RWUzNq?=
 =?utf-8?B?VnlrL2pjNVdFK2E5eVlneWNscWI3REVaM1RnL0NoeWJsVVlCdzltL3d6bUdk?=
 =?utf-8?B?QW9PTklLNlZFVTdrUm95RWk0UzlVbThkUElZcjFSYmNHdlVxMDZZRjdocXM2?=
 =?utf-8?B?clJTSU9ZUGZPcmVwNXdHYi9ESVNPTWoycEEzRnR2dllzUGdEYThwSnNpaEUz?=
 =?utf-8?B?dHhFZFhtMjYrUDFQY3BxZzRwZVQxTytOTlk5YnpiWFZ6Qk1HZ3V3bmNxMStI?=
 =?utf-8?B?UUV1TFUvWEl0YjVYYWM3ZWRKcUxTTndSby9WcWp5d2FYeG5rU0hYMTY1RTR4?=
 =?utf-8?B?UVZrdFpDTWVtUWE3dDBoV3RUcUdXRVNvNzBTN2drK3E3TkRxTk5JUzdFeGtR?=
 =?utf-8?B?R2VmNVhnVHVISGhmYkxHWFFoaXpIT0xzeXQ2KzJaaVRZQ0dtL2RQdmNQSUFn?=
 =?utf-8?B?bUxOMzVXVHBFb0lYQVBjRDMyT3pSWTFoNThPYjIyY2dNc2QrelhneFp5QVBP?=
 =?utf-8?B?NTFBRk11ODJWM1VJQnpNN3diNVBYRVFaa3JtU1N0a3RTUWJhZHd3bThCMktq?=
 =?utf-8?B?UGJjbHVIb3pMQzNINWdobVpWSGRYQjZmUFNjWWcyY3c1LysrZmRENVZJYjJY?=
 =?utf-8?B?Z1hZaFc1SUNkelZJQ3ZlaE12TWNxVTFWRC9INThZei9jWFZPK1RsNXAvdDBW?=
 =?utf-8?B?TC9HUlRIdGR0SWg2NUV1Q01pVEVLWXdxeGNCazArREUrSVp6ZC83dnBGcmNa?=
 =?utf-8?B?VmczSzc0WVFRb0Y3NGRUQVZaQjJ3LzViS3lXSklCaXp4dDJRMU9EUGdNbjM2?=
 =?utf-8?B?eVFtU0o2S25PZDhNYTRQMHVXV2Y5N283QWtHNXM4KzczVWY4QTY2Tm9Vaks2?=
 =?utf-8?B?UlhubGpsOXpNTmV2WEpyb04vc2I0bDhKbGtEb2dtYlEyMHRYRGZDTU5zNHVR?=
 =?utf-8?B?bVJkMWhuK3Y0M0h3QkdiOEgyZXNCTTYzMW0yRmpMcTJ0YzUycFQ3RUZXWE52?=
 =?utf-8?B?QjFXcW0vUExTUHlFeXUvNG5adEI2SUlGcEUweG44QjgzalRpWFVGQi9VUHFP?=
 =?utf-8?B?Smx6dEh1WURlUTZQNHFndmh3VHRBTFZUcFNVd3VvSm15VzhEY1NRd1Q4cDJt?=
 =?utf-8?B?dXMwUFEvQXFFQXc0UVYvbWZPTkhiZFJSK1dxalhYM2E0WjdSKzFaaEk4WWpY?=
 =?utf-8?B?MTdURDZPMzNmVU51OEg3U1RnU3pWa09CNEVNbm5jRUJsNDg1c0o0U0hBS3Mx?=
 =?utf-8?B?ZFczbVR0SmMwRU5tWERMNTdQZEJtNmx3by9ENFJ4ZkhCMlplelpSV1Z2OVJT?=
 =?utf-8?B?b1RROXZmSVZ3ZmE3dEQzUysxay9ZTGszR0dzdWorTSt4UWJQMEpqcXRJaXdQ?=
 =?utf-8?B?MkZpZ2dKak13NGVPUndhSmdSOVU3NmIxWVhCNFo2QmVTdWdXVjNFTnF5bUZC?=
 =?utf-8?B?a2NyTVNDVVoyYmhXT3Vxcms1ajVtRFl4NmZWeFkwcVY1R3Fic3BRNHBRRGY4?=
 =?utf-8?B?TUFXcDNTN0FqZTI5QmtHd05PS3UxWDZpeXp5ZG01bHllbldXSmxBSUJBWXd2?=
 =?utf-8?B?aUt3aTdjS0hINXRzL3VwYlh4WDRnQ0lPay9BZ1ByKzlaZVVQSG1PRnNmb0ZT?=
 =?utf-8?B?SDFVUUFNWHA2ZWpESU9NdFdmUDFUU2E5WnJXbHd3NmlOdXNoQ0dvYVJYZ2wx?=
 =?utf-8?B?dk1mUmNYVHF3YjhBNXlrcEtjNVROQlMya2laYXQ2YWNyL0g5ZjBJZVBhcllE?=
 =?utf-8?Q?PYAZur0SRY52BFufwiM+HrUYLUyfZelOtbCpY5wgAGxJ4?=
x-ms-exchange-antispam-messagedata-1: 5SHHkhv4pba12A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E205E363512A2547952524A11C0B736A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bca071-a5b5-4774-2156-08dec7d7173a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 16:32:55.3511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 776ow7VLK1xVD+0/WxTkC4UQo4Yt2IJ6EBRRl8+XfvOtdIgvVR+EEYhOIwz6Y8iAtPrNGBuwtwYPh1VJ2jMseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316

T24gVGh1LCAyMDI2LTA2LTExIGF0IDE1OjQ5ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiArLy8vIHRoZSBjYWxsZXIgY291bGQgbXV0YXRlIGBidWZgIHdoaWxlIHJlYWRzIHZp
YSBgZGF0YSgpYCBhcmUgb3V0c3RhbmRpbmcgKGFuZA0KPiA+ICsvLy8gYHJlbGVhc2VfZmlybXdh
cmUoKWAgZG9lcyBub3QgZnJlZSBgYnVmYCBhbnl3YXkpLiBSZWxlYXNpbmcgdGhlIGJvb2trZWVw
aW5nIGhlcmUgYW5kDQo+ID4gKy8vLyByZXR1cm5pbmcgb25seSB0aGUgc2l6ZSBsZWF2ZXMgYGJ1
ZmAgYXMgdGhlIHNpbmdsZSBvd25lciBhbmQgYWNjZXNzb3Igb2YgdGhlIGRhdGEuDQo+ID4gK3B1
YiBmbiByZXF1ZXN0X2ludG9fYnVmKG5hbWU6ICZDU3RyLCBkZXY6ICZEZXZpY2UsIGJ1ZjogJm11
dCBbdThdKSAtPiBSZXN1bHQ8dXNpemU+IHsNCj4gDQo+IEJ5IGFkZGluZyBhIGxpZmV0aW1lIHBh
cmFtZXRlciB5b3UgY2FuIHJldHVybiBhIGBSZXN1bHQ8JidhIG11dCBbdThdPmAuDQo+IFRoaXMg
aXMgbW9yZSBzb3VuZCBhcyB0aGUgY2FsbGVyIGNhbm5vdCB1c2UgdGhlIHVud3JpdHRlbiBwYXJ0
IG9mIGBidWZgLg0KPiBJdCBpcyBhbHNvIG1vcmUgY29udmVuaWVudCBhcyB0aGVyZSBpcyBub3cg
bm8gbmVlZCB0byBjcmVhdGUgYSBzdWItc2xpY2UNCj4gbWFudWFsbHkuDQoNClNvcnJ5LCBJIGRv
bid0IHVuZGVyc3RhbmQuICBUaGUgY2FsbGVyIGFsbG9jYXRlcyB0aGUgYnVmZmVyIGFueSB3YXkg
aXQgd2FudHMgYW5kIHBhc3NlcyB0aGUNCnNsaWNlLiAgVGhpcyBmdW5jdGlvbiBpcyBiYXNpY2Fs
bHkgYSBnbG9yaWVkIG1lbWNweSwgaXQgZG9lc24ndCBjYXJlIGFib3V0IGxpZmV0aW1lcy4gIFdo
eSB3b3VsZA0KSSB3YW50IHRvIGFkZCBvbmU/ICBJdCBldmVuIHJlbGVhc2VzIHRoZSBgZmlybXdh
cmVgIG9iamVjdCBiZWZvcmUgaXQgZXhpdHMsIHNvIHRoZXJlJ3Mgbm8NCmtlcm5lbC1hbGxvY2F0
ZWQgZGF0YSB0byByZXRhaW4sIHdoaWNoIGlzIHdoeSBpdCdzIG5vdCBwYXJ0IG9mIHRoZSBGaXJt
d2FyZSBzdHJ1Y3QuDQoNCj4gInRoZSBjYWxsZXIgY2Fubm90IHVzZSB0aGUgdW53cml0dGVuIHBh
cnQgb2YgYGJ1ZmAiDQoNClN1cmUgaXQgY2FuLiAgSXQgYWxsb2NhdGVkIHRoZSBidWZmZXIsIGFu
ZCBwYXNzZWQgYSBzbGljZSBvZiB0aGUgd2hvbGUgYnVmZmVyIG9yIGp1c3QgYSBwb3J0aW9uLg0K
QWZ0ZXIgdGhlIGZ1bmN0aW9uIHJldHVybnMsIHRoZSBjYWxsZXIgY2FuIGRvIHdoYXRldmVyIGl0
IHdhbnRzIHdpdGggdGhlIGJ1ZmZlciwgc2luY2UgaXQgb3ducw0KaXQgb3V0cmlnaHQuDQoNCg==
