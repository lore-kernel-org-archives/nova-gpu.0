Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436193B0580
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770402; cv=fail; b=kXsYwiKDOV3TRMS1f154Zj0Www5GWgSl0XTiWeaIFfApDruvHS9P1k431/KJtePZVmfYnW9FoQU+ysjwPtVQsfbSUUMMVFNDTEuC128D0KZadlgaz1ntR6+9NCaUKpCcEy6kJrfW7ifBi7p18olLx1h5zozEuOhiVzHm4nLBE2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770402; c=relaxed/simple;
	bh=y0fXdflz+sdRNJPK5H4zDxPGKEQia8grBP0KCSSQfEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XiDUSin5oAvPBaLJaE2D4WHk5Nj18sUYIDBw5iTmXGzmRl5oYTCVba24BYsj5IT9lEEr2MovDdnZ8MMaU6gz0/3StiQb7H9vsMsErS01LQhH1OaB9+mqcsmkZQRbcLMjEBSOov4H6+RBKRVgQHl/yifANdIr3PFHbsonqp9CoWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BGOcf2jd; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BGOcf2jd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZ8EVIHqWpFfllMGPt1nGhHUovBRGbMmOPjT9iMSNDJSDa1sZeWYd4qVmnTes6zAJvUepc/FpEq5bLUS/X43rs8opagJK0S2eQ6qjjLoIX6Qtw6/btNgJtTaEGNRBeQ4nIH7kc3EAJZxXP3CJivqFKIOX+rHGGfC20IeDnXQBdSmSLz9ECqyqcn6k7OUljgrR2zsH+XI20uVLULUcyNAHSBsmA3Y/Ue2zlX7UDw8ZsBmZ94sB3u39dMGI+I30iSK9brXLKyQFlwpakUH/E5IXE0XWrVaBaxMrTFnYEjutqwI1jzRok4yHtm+WJbGVr+zjE/u/A4UeKIjpAIKV0Lvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0fXdflz+sdRNJPK5H4zDxPGKEQia8grBP0KCSSQfEw=;
 b=Jc4COmiIv+4fvPjjqkg6j1cwbJ7fXNT3yFb5kziuLCeC8EJTv1Hqc/pXqFJhcDL5hHu5XINNGoZRh3DYbxcWelGyOZbp7cedh8+ByXOkAlyPpH3hdqpqQYpFZc4D9euZJPPujaFhUDvqvP8X7BPZtogqTTFbHa1YTnGh+dOzW3bg8d+F+v/NZOwWswsBP7dl38+mh0eBKz8KCX49w91PVibM2h4185deu0Z+ubtxQ97js9Ot//kTo93bjdV/iRRtGRDpeEVUKC1ta7EdjDU7Pueukm5ZWIPTFqxOKVHvRXg1New3N/BGOmC6zLRhkrkOLEGdbxurbwL9J9TwUDjatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0fXdflz+sdRNJPK5H4zDxPGKEQia8grBP0KCSSQfEw=;
 b=BGOcf2jdpi4FTW4VXeiaEUMUnIHama4ExY2dcN0Puwb4XGS6ndCPCU9rhhjGOQWX8XXNz/da6ty2erK6UvS/pu3DoQIGcPRw9qh/W+77I3WvPazBc4CpvOFWZT3HYTGcDE5pFoIRz+XpDWe2FrmLCMv7nSwNK8qgxgtH+l5mRF6AoVq/KX5+1ytS/hZnfkEtlvq+TVB6DFAHNnuvEIgKCnCgSZHyds8rAlPl8ZafNiWzFmmeHI0l0f6Wlw7yqwpNWvJAQR+/fKDbf66Bmo4TZ0NXo3hrPMrrPVlber0Zz3stAqA8mI6wJfNZmoZnnLf4NquIEcGbtc4KdaQW83ur+g==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by IA1PR12MB161209.namprd12.prod.outlook.com (2603:10b6:208:5ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:26:34 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:26:34 +0000
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
Subject: Re: [PATCH v3 21/33] gpu: nova-core: gsp: add the GSP_INIT request
 builder
Thread-Topic: [PATCH v3 21/33] gpu: nova-core: gsp: add the GSP_INIT request
 builder
Thread-Index: AQHdRwoyp/ECCuyZM0mermlRNdXEOrbU63CA
Date: Fri, 18 Sep 2026 22:26:34 +0000
Message-ID: <1daf717aa7e597829c47691fd17a7a2d28f99780.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-22-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-22-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|IA1PR12MB161209:EE_
x-ms-office365-filtering-correlation-id: 98cb87d2-a0b0-435d-7dcc-08df15d3e594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 NWMfxBmMzkJTJ9IaLP7+N/PuVZ+qZYvwooxy1EV3AkkO1HoPaZgPQTHOWWGIeaeFyD9izKT7DRkLGYQMzQDIQPcshawiFGNifwhNsMaUQJEGjJfHmy/r2+8iP2Z3pGBQmQU04uoHHNlVs3ZWYsqnoO2x4OppPIHqTiuRc/P2COfj3uzuwm1fYOh5Db6PA10AHAQYpkiMy2TmyF7IlPhV/8K2iYmM0xOAOoPRcCMYlXZ/+5u9KnjZrrqH80OcOdXNFwM8ytJoS+vqTygrOyKJpDZO3nBdzo+ynTM2Wuf2BbOz7XFgjNlFwoxK4trDMB9W/SHFp8c0wquzMJB/uePS1+Qz1bjOXYEL7q0NFhwsyAuTOoLphRAlfY5t2Ots6CYTBw6Ofak+MyebW2vk7sq/QyAAqKxB6/JSTIh4QNSOVzC/AzhlCKDBgaCmzjRTrycKmwGGT1IHxgrSICSxhS/IXTHg6G7Jr8fNxpZOqrIQDkoKzlF1io0LvuSbatrN4p0HLL71Vekca7UTlTeZaBYKq4hnkYAHcuJyHGenlDHW+QjMkVMvEHlnfcg986bgTPj7dS6zYwbMV4ltzg/N8Nag3JUo78DCjNDitvsMH5vQL8fQ9WWBD5gUohlmQSD37oGMFY7Jk6wZiVzS2w1uvCZaPsirYzBdpVTV5L+ksfWJACGKSRNs+iBrBoRe/rcWnfcOZJZhfrApQBt7AE9yQEf9UsBlP3AyNukBbmitlKJxvPc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDgweUhwNlE2Tm1Na1BJZXBuaE8yV3pMSWEyVytrQzVFQzZaNjQzcklSZ29J?=
 =?utf-8?B?QjJhR0Q2dXA2RU5SMGZndHhKWUhtTXI0S2l4MXU0KzcwTTZmeTlZcC9XYkUz?=
 =?utf-8?B?QzBRb0NtVTNIQ3JPN28xMzlHc1JDck4xOGhOc2IzSHIyYkR4NlN1eWNvMHRx?=
 =?utf-8?B?elM4bU9OaHVVQTRTOXVTWGJaK3RzSk11L0Uxa0RCaVNXQXlSS1lzeXcxSTFS?=
 =?utf-8?B?ZVp6bVc1RjM4bi9FKzdNQU51eWIzb05leW9TcGRmMnF0UXVISG0zYmc4ZmNO?=
 =?utf-8?B?SFRTU0E5aWdWK2c2NGZpYnI1N1dNYlpVZTdBT09qTlduSmlteWRoZ01vVDNO?=
 =?utf-8?B?cXUyTm1iNzR4c0k1WlJzU21qZHBFbE1rdkxWNDRaTE9YTlhoVnNZenZsR2hW?=
 =?utf-8?B?UVdrb3dSVTNjb0NLbDhJaXJZTis3YkZSQ2RZbkJ0bnVVU04wRjFRZ0RNSUM5?=
 =?utf-8?B?TkhDcERtNFJNUlJ1QXlhdDJxM3JPTE9Tc3ViajNxdHZjSDQzSDU2QXA3QXJ4?=
 =?utf-8?B?QTdjUkpvNkdpUTVvOG1RSFN5Q05xS3VWcitVVUJhM2dzeWRKN1dQSSswL2Za?=
 =?utf-8?B?cWoxQVJrRHR4c21XUTY2bnE1UnZhTmJnTEZES1JPcmEzbVk3SlcwMXhRbGYr?=
 =?utf-8?B?SHJSZ0RyeUJDQ1RhUW5pN3BKTXc3aUFRUXZlUXAwMnJQK1VXVlR1bmxPS0Vh?=
 =?utf-8?B?cHZlZEtvRi9PWjVkK3NNTnBML1pBUE1ab2wzd0NNMVhwRS9kZmxRZW9heU5K?=
 =?utf-8?B?NS9NemJEd1NCcWhnT2VWNlp2eC9FZWZNZjI4QlFGQlJNaTd0OFJYZDM1MFRI?=
 =?utf-8?B?clBFekVYZDdWOUZZTGNyZXoyS1h6WGZQOXR1aWg1WjhoMmd1TXpNSThTN2dw?=
 =?utf-8?B?SmtBS2dnYzVKRGxTd3VaS3ZGdE8rVGY4eW55S1E3eXo2Q2tOSDJxbXB0Y1hI?=
 =?utf-8?B?N2s0YXBLbzdhU1pnemNSRU5paGxDSVhPNjNOVjF0VkRDc0o2TUFkaEIzUjhX?=
 =?utf-8?B?TWd1M2FvcG9JbnltbVZaWUFaOXo5NlZFWEE3N3FiY05mM1pLMjB2aVJtK0hZ?=
 =?utf-8?B?bWE4MDNoazZidGtmRUpBR1pzYVYvN2N1MzhtdStIRGkxK0dKN1FVR3I4SGZI?=
 =?utf-8?B?NXFOOVR3bXBpMEhGa2trVkFic1RLbnBQaCtpTVF5KzhBajQyQ3hRcEc4ZFVY?=
 =?utf-8?B?VllQcWxQOU5yRHdnaHFiMG52K0Y3TnVVOHhGOE5YNDByQUN4YXgvWjhadkpj?=
 =?utf-8?B?bkhXUVBmM05NaW9PYnVySFdFWmxQTVZINThRY2hHT1VLVGxzS1dMWDZLSWFZ?=
 =?utf-8?B?VGpra3dmOWZBeTZrclBoK2hoa1ZnTVNxNlFoS29CQzZMdGFwWkdqMXdOZC9Y?=
 =?utf-8?B?WTJkM0xCR0s1YmNaWEhSN0dlS1BoUDNVbUszQ2kreXlrbmVUMjJTbksvR3JS?=
 =?utf-8?B?MHFOZ2lKeVNMcHJ2RTlMZ0N2a2sxdG5UU0xUV1lvOU4yV0VWd0FWcWs5dVNT?=
 =?utf-8?B?QmNEUHVGRWdqREZ0ZUtZSFlRTlhOdmdiV243dmN2V0JrSDNLYlRPSzRPYWNy?=
 =?utf-8?B?NUxWTEE3NFQwNVR6cUJ6TWFCTlBhUjgrUVBSQ051SVFKN1F1TjhDZXcvNEUr?=
 =?utf-8?B?YVNXRDVPMG9rVEpMT3lKTGpxRmhtQ0tKTUpyV2QxRmNrRVVxc0J2V0RHVkVL?=
 =?utf-8?B?dktscWdGcnpnMGRZeWZicVFSY0ZoeldOR2VuZkhPdS81a3ArU3JLUk93VlQr?=
 =?utf-8?B?VFNKbUIvK2ZaekNycktkdVJOazcxbDExZ0xMbXdRUlZsUmFYS1hnWElKSmR2?=
 =?utf-8?B?ZVg0ZHNFa3lqSjNMai9QblJ6eUlDOGY3bkxSWnh0VHR2cUhoanU0MHZFSThJ?=
 =?utf-8?B?WFliVEE3dVQ2TWx4U3F0N21TVW9TYVFEdGU2dU9ma2I0b2tEMGpkbkZnaW9E?=
 =?utf-8?B?U2Fxb3NFejNaMWhUb2FjZkp0eEVEMmlWNk1qSFFqTmJyRU9iaXNIekJBZ2tt?=
 =?utf-8?B?dEljNldCdW80OWx4dUZZTStCd3dQSmQycUxVNDZVVmRzaVJyeXJ0bGFZd2h0?=
 =?utf-8?B?ejduVUtwcE4rN3ZweElXSy8xZHI5Q0MxNCtpKy9GVlBZUXVDeGNINkdlV1Ns?=
 =?utf-8?B?TmQxeDRkSFppeW9EOVRjTkx6YW9pOWZQU3BkRGJvTW94ZXc5OG94KzNvTUJS?=
 =?utf-8?B?bU10OHdqYnN4cWI1OU5NRk94NVY3MTlKSmgyaHhWaE15TyszU1UvZFhmNkpG?=
 =?utf-8?B?YTBqWGNQRWR4MUhBTkFYZkVFa2RlLzhwd1JpMFJTMGhiZ2t6cVhMTC9hM1Y4?=
 =?utf-8?B?dUEzelExRU5CSGltc1pYUG1JRkVqamxWeERhYkdaSVBqOTZ2cUhMUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74530EF267F1084AB64115BE4FC8DDEF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cb87d2-a0b0-435d-7dcc-08df15d3e594
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:26:34.3308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJLA3RiqsAFdXNotDFtsb9DdmUbl5JQWIht9L57LGmO04BOzHTaXkiXHIkbuFdtmZwbyI8DSnyljoNdzbWN5hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB161209

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KDQo+ICsvLy8gUmVnaXN0cnkgZW50cmllcyB0aGF0IHRoZSBkcml2ZXIgc2VuZHMgdG8gR1NQ
LVJNIG9uIGV2ZXJ5IGJvb3QuDQo+ICsvLy8NCj4gKy8vLyBgUk1TZWNCdXNSZXNldEVuYWJsZWAg
ZW5hYmxlcyBQQ0kgc2Vjb25kYXJ5IGJ1cyByZXNldC4gYFJNRm9yY2VQY2llQ29uZmlnU2F2ZWAg
bWFrZXMgR1NQLQ0KPiBSTQ0KPiArLy8vIHByZXNlcnZlIFBDSSBjb25maWd1cmF0aW9uIHJlZ2lz
dGVycyBhY3Jvc3MgYW55IFBDSSByZXNldC4gYFJNRGV2aWRDaGVja0lnbm9yZWAgbGV0cyBHU1At
DQo+IFJNDQo+ICsvLy8gYm9vdCB3aGVuIHRoZSBQQ0kgZGV2aWNlIGlkIGlzIGFic2VudCBmcm9t
IGl0cyBwcm9kdWN0IG5hbWUgZGF0YWJhc2UuDQo+ICtjb25zdCBSRUdJU1RSWV9FTlRSSUVTOiAm
WygmW3U4XSwgdTMyKV0gPSAmWw0KPiArwqDCoMKgIChiIlJNU2VjQnVzUmVzZXRFbmFibGVcMCIs
IDEpLA0KPiArwqDCoMKgIChiIlJNRm9yY2VQY2llQ29uZmlnU2F2ZVwwIiwgMSksDQo+ICvCoMKg
wqAgKGIiUk1EZXZpZENoZWNrSWdub3JlXDAiLCAxKSwNCg0KRllJLCB3ZSBtYXkgd2FudCB0byBy
ZXRoaW5rIFJNRGV2aWRDaGVja0lnbm9yZSBmb3IgTm92YS4gIEZvciBOb3V2ZWF1IGl0IHdhcyBh
IGJpZyBkZWFsLCBiZWNhdXNlDQp3ZSB3ZXJlIGFsd2F5cyBsb2NrIG9uIGFuIG9sZGVyIHZlcnNp
b24gb2YgR1NQLVJNLCBzbyB0aGVyZSdzIGEgY2hhbmNlIHRoYXQgYW4gb2xkZXIgZmlybXdhcmUN
CmNvdWxkIHN0aWxsIHN1cHBvcnQgYSBuZXdlciBHUFUgdGhhdCBpc24ndCBleHBsaWNpdGx5IGxp
c3RlZCBhcyBzdXBwb3J0ZWQgaW4gR1NQLVJNLg0KDQpCdXQgY29uc2lkZXJpbmcgdGhlIHByb2Js
ZW1zIHdlIGhhZCB3aXRoIEdCMjB4IGFuZCByNTcwLCB3ZSBtYXkgd2FudCB0byBtYWtlIFJNRGV2
aWRDaGVja0lnbm9yZQ0Kbm90IHRoZSBkZWZhdWx0Lg0KDQpJIGNhbiBzdWJtaXQgYSBwYXRjaCAo
b25jZSB0aGUgZHVzdCB3aXRoIHI2MTUgc2V0dGxlcykgdGhhdCBtYWtlcyBpdCBhIGNvbW1hbmQt
bGluZSBvcHRpb24sIGlmDQp5b3UgbGlrZS4NCg==
