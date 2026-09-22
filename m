Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE13BCD04
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107550; cv=fail; b=JBGXUveEg9G+n4V7J/eyTGESBSXiC32TsFFb3q6XZR88NERUSbFwJZjjpeVWBLrJ/rEoPN73mHC0bM9/csk887yxTnSX0uZC2E8E0mr0obclHySdpQ0JAENr0vf4pfwT96iuUj8FdOGpu/3+/uvYsZQjMb+q5mxVJY34Pynio6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107550; c=relaxed/simple;
	bh=mraNQxepspVWERF5nfgFR1BLmlBYnybQfmjyA/cou8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SyRfMnJueQ9VgKpvPYj7SJLls/WzWNYFgPoME15qKzGAoWfQmrHwhVikMcZhnM5jz/r8D7bxZMO9TtEvAiBk49GF81CIFoIjayGIAudeNuSJCe+bMeq6hIhCKWXbRMF7V4rFOAhGIwWDEwGpU+fnlXqxAxpYBklqq9BLedR2AGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W5Gl0YqB; arc=fail smtp.client-ip=40.107.209.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W5Gl0YqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b20DKQ4hra8rdTQF07+2ts7eco7SnveaGt8sNSwlta9C+pBVQaahPb6JYC0wzfrz0cZSlZ2XofB0ECKU3QlqwZbBau41XwXz/6Pp9tKxx3kbso8dXvY9WLREksdhK2oWzGCssTrI6VKirE2MrspHiET4t46GhoXGTZYB0E6k3CqsjG43JNKj4f/UaXA+nkJWCp/vTTpxgtplvRc0z9sSKr9h3qrtREhpqrKLwTGRuaxriehqTzJ/OS9uXoPycvGptpVQzZIapEPf3TDu3egCAjZDA3hRE0PDmqm70N6iOS+KXwChnN5ueU90cQ+gJYAI5AGVlWg7S3ebl34s4Bvy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mraNQxepspVWERF5nfgFR1BLmlBYnybQfmjyA/cou8c=;
 b=Zc+9y9mjFdyQ6elnmiMbb/sge+tlumd9A7TkKD+JfIH8nQiKHX9VR0VKL6K73F3FBBZtBDccC26SmJz9vLFG2qiC0K/FsoQ3Y5do/h3uIEGqwPXAGI+VO0L3wyLZNumRPeOirAHuaZJEX0oEXHuMS34NzF11YjD9Bk9PlSVNNoL0++jy32g8xHqr1pyXuPZmFcKQ4CWhwfaHnxALxUtupF1VbxiwOCVXlRGFmYU5Yjr+0uo17N4JSrLKI3ihJm3XJ4g27iK9+v3hdPkWqtmxM0q8UdDImBqXTvjaTjswdrxviyKwavDtsAJWZ12tEkbyEFC2lrdmi9N0RhabaXsQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mraNQxepspVWERF5nfgFR1BLmlBYnybQfmjyA/cou8c=;
 b=W5Gl0YqB3Dto/yatQxshoqLH7uvNCqS+5Jk0PHO6FfamVkjf3lb0caE7/EBlhWjKchSb/R5l7a0FJSFmUxqmj5exu5c/qUy10ceoG3xB5Bj2f7C5T45K7wM6urONOBNVxru1YgcRgEf32v0XbSno3jkY0LQTHu4P+Xxy5e7d8/jcxnKu4wR1jKMA9cyWKgjXuodqzDAkGJg9BVcUR3J6yWVHuPGPaVprV5SJ1McN1Fv/lCP0zWXSzqmdlGazL9mC0JF1L8tXZkRSNXqsxPBuNQ9qQH4HVLr9QfRZPJUrIsWGaoXXRfgdhGaGzm1ov5X10j3dR7RuUfeSibs/yCsXpA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 20:05:40 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Tue, 22 Sep 2026
 20:05:40 +0000
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
Thread-Index: AQHdRwoyp/ECCuyZM0mermlRNdXEOrbU63CAgAT+YYCAASOTAA==
Date: Tue, 22 Sep 2026 20:05:40 +0000
Message-ID: <0a7f3ecc5c609d7a9239c208a5428ed54429fff4.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-22-jhubbard@nvidia.com>
	 <1daf717aa7e597829c47691fd17a7a2d28f99780.camel@nvidia.com>
	 <269ead56-e6b7-4daa-ab5c-3334c72e34c7@nvidia.com>
In-Reply-To: <269ead56-e6b7-4daa-ab5c-3334c72e34c7@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|BL4PR12MB9478:EE_
x-ms-office365-filtering-correlation-id: c8ee1972-a478-4283-4156-08df18e4e02e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|22082099003|18002099003|11063799006|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 GJcBbmyEVqVVl5j/JKtkhlq6rCIEgYNjI3SkPhfP3aXJFaxByqg2RsHVDLz6MgrBRwJ9B6aIRA5oxP2l+YShl1fUA+9CmdDbwCriqMRFKuch9TOizng5GCScuOxgrgNiYweu7P+kieF6RfYSSt9K2hPH8wpAAg5t/QRKN+cjpsGk9Em6RuCAxSeVoVVsgv7a1gJ3UAUCf0ckuo+YkGLA0rDmGgz0C7CEKPjWy0h9v23OarDGY6aDwZBIU+eZpuBn1RRzin6mBoui5FVpVuTDy0qgQky8Cfw05tK7BGinWvour8dJHS1iKWdwKe/2jkRjUa/COqOQDMIcacCXhY2m3ueK+8zRb2EKB6pYMq1mugNKtsHPx2pMEwtGtZXlt/w3gR4caimnysyt8lcOPbUuZs9Lj4fVnXZEG/9aPPVY+BTq08SM1R/mqSvBoTA3ITO+UK8uQHAIp59gfXnJfyj7ef/1yx9Pir4rxL3ncMNd0EVbBKiFG3ZaH9FOyg6TpZGIQq0CTJFvkqLeoTB8UqzEpvw505Uq09cDBDZsURgMpyzBqNukLJxGqg6gzwCgjo8qjGfGn6YEjYYuNfdfGHrH4gtusTtznK6ipvLBE4QXGUxnBZ4cIyA8ii0sg16tYJpk7lw0+utylE+Ks8NtbFl4M79+5AVSq9dN+Egtn5XKuG/rQO17ocEcFqGMbU8iHFm72yW3oPiQ3V/DpASLbPy2Cq0qmkMgO9w6qRTNohTTB4M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0JDVXorNWcvcGozZTN1TU4rTFdrbnRtdHNPa1RKWUFwbzZLcUlFZk9GS1E1?=
 =?utf-8?B?akdGVGlUUGdwMDRxMGVKT28yN2ZFUHkyVXVNYmJ4cE5FNkVOV2RtTlRReFFS?=
 =?utf-8?B?d01ZcGJBeEpMNTdqTE5PVUhGTXg1Zi9lRDRsTkJRbk43TGJkankzVEpzZzlZ?=
 =?utf-8?B?U3lGV0ZsUUsyeGNvbkhaOHkvTndsd1ZYZUFkeDV0Mk9Qczk1ZlhNZUZURHYw?=
 =?utf-8?B?a3BRWWJFQjZRU1VtQnFlNlNueFFBeWUwMUJGdVh4Z2dOTFV5K3VSanVhWWJC?=
 =?utf-8?B?Mk83Q0hVckU3K1FrUHNaRjJPMzB5RVcrN1F2Qmp5NExUZXErS2RoMlhJWWNB?=
 =?utf-8?B?VWtQNmxIaUlNR0dMR1c5U2xRMzc5SUdJaCtVTHMxVHRYdzYrdGI3NkJoRnhI?=
 =?utf-8?B?VjUxQ1hhYXRtSmtIM0JTMDZaUG4venFINi83dDY3cEpFRmFQLzVraUR2bFl3?=
 =?utf-8?B?c1Buc2JreTdmUjJpY3pvOHFWVUNpYlBEKzk2TzAwRjJZZFNxUitPclVsbXRk?=
 =?utf-8?B?TFNhUmpybFhTVnVtVTRkMUtZY1BweU1USUR6RkVmN2J1ajFZUHNLTi9tN01B?=
 =?utf-8?B?NDd3ODBDWlFMRzZiRHdhcC9LZkdJbndoNkNRNEhPZUQ0YVkwVFpYTnV6dDIr?=
 =?utf-8?B?T0NFYi9YQ0FoNFA2czh6eUNhRFhwOG9nOFU3dEtLeERUSWw2RFFmaUppb3Ja?=
 =?utf-8?B?enlRZWk0cm9qV0YzSFliUjdUNmN1Rk5ZWnVnSmNnYTZqUGdoY3ZQTVkzZE01?=
 =?utf-8?B?T3dQeGlyWWgvL2VmL0tFeEthTlRCeklvcFlpdnNEa0VJU0V5WEJjYWtFWTZW?=
 =?utf-8?B?UTk2d1poVnArcitEMkdyN0RxTjZ5QlhEUmVtV0xRWm4vSU9wMjlwQVhBNjV5?=
 =?utf-8?B?NnNSTWlHZzJUWkp5dHJBU3V0OUlnVit5bUd6QnRxMVF5dDg1VjB5SERqb1NZ?=
 =?utf-8?B?c1lHMmhINE1yK1BNU05MSFVFanlqK2cvYnk4RWQ0UFVUTE1Ua0FDM2dKeGpk?=
 =?utf-8?B?YXhFY0VVbzZkeGk3d2ZuU0lPZUt3WEltbHJ1WW9KY25zbGQ4dUxIU0F0Q0lU?=
 =?utf-8?B?WjlsY2s1dWl6c3ZZWmJnSHI3clhIVi9RaXZLNm5Qa1R2M3VGRGRxZnJzWUtV?=
 =?utf-8?B?WVdLdHlDeitwNEpDRUY3a1NtM2ZIdWIwRnhtbEM1TzVuT1ZQRXRSMGFuMXph?=
 =?utf-8?B?Z0lIaWt1RDdDem1nVlByV2Q5UG42UEdPTG1KZ1RLNDY1ZTV3WkJvTTJDZmFw?=
 =?utf-8?B?V2VucmVGZWIweHVxc1ZoeEFXWVI3U1dQYSs4Ti9DSGUzcExlMHVKK1o1MkRT?=
 =?utf-8?B?bEFEaFl5T3I1MGJIaER6TnRTNDdNWmdHYkRXL1J0bnpvY1lCTXl2cm5JR29E?=
 =?utf-8?B?eXdLNi9MTTNIRmg0NW5HbjVFRzRoMjFFdXljZUFScWJxNkUwOElUOE1kaUk5?=
 =?utf-8?B?TU55VktndjN0bzRYdnNNV0Q1SHlNd1YvQUUyQ2M1TTF1a1NBdms0Y2NHWnVE?=
 =?utf-8?B?RUhwcHBtbFlpUlZSRE5sbTJqS1RocVdvMS9rTEt0dEFrWnhxNm5UMEp4VTk2?=
 =?utf-8?B?TWJxR1gwdEtUTGJwK2t5L1JGUHpDeFNCd2duekpqOEdVSW9oYlJ2eWhCS3VG?=
 =?utf-8?B?TThpTThueHI2SkUzbEZMS3l4dWZTRTV4a2VEL1FnTVMvV1hPK3JtVkQ0eFJW?=
 =?utf-8?B?YUQrYWlvd1lFSkhjNEUxYVM3eFdXMmUvQXlDUkdqZFk4b3ZqSUdOSVh1d295?=
 =?utf-8?B?S3ZzZjBGRy92TkdzeUdqWjZPMFpwOUhXQ09KK0dsUjRJOGRSNDZqRkxkVXVs?=
 =?utf-8?B?N1pSV2ZqVXFpYnNyZHBSZWZMOGJaMkZqV0dTSm5HK1RESkRmYjhLdTk1VG5J?=
 =?utf-8?B?SmhudU9BS1h2OWZDb1pHUjE4N2JyelVmRk44UkUzdDArSVBZcWZFazJCWjU0?=
 =?utf-8?B?bEt3cmgrblE1Zm1JWGFXaUttdVBBbEM5eEMrWFd2c0JWRWZnZEFtcFZqNU1q?=
 =?utf-8?B?WTdsbkFyK0F5cFM3V0J1bXVldHhBenkyTm8wR1JUTEJLcDRJVXNoNzExSlJ0?=
 =?utf-8?B?UHgrdldnckRQcnJTUTBEUVVPUXQwRXN6UUR1OHZkVit1VWhBVjVPcjRTbzRV?=
 =?utf-8?B?ZzRhUGZ3RkNqVTdlczlBR1ppT05hamx1ZzRsNUV4UldJWkptRGxtRjRwZDFa?=
 =?utf-8?B?N3FYMkFBYzU3OXBRc0JDVkJRU3VVeGJvWWw1Z0dvdDRQUmgxTGRTOFl6NlVE?=
 =?utf-8?B?WWdtTExPbDNua1lFMnhCc09uZmdkZUtxcWNqc0o4Q1ZBRFRxaDlyTEJRZTZt?=
 =?utf-8?B?Zm05YTlJV2Z1WndKeC8vRE8zZVEvU241aEZUUkxLRDd5Q2pZcjBkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A5BDFDC79CFC749ADFC66FEE13FA6C8@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ee1972-a478-4283-4156-08df18e4e02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 20:05:40.2136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeHN3tLw8CFSGf4WZkGlyj1oCgI1frJMgHVygogXhkAAS0LYD8nkO+wQhtgPbc7sv+/W7ZC/tFdndHcR/gEOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9478

T24gTW9uLCAyMDI2LTA5LTIxIGF0IDE5OjQyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDkvMTgvMjYgMzoyNiBQTSwgVGltdXIgVGFiaSB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYt
MDktMTcgYXQgMTg6MDcgLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToNCj4gPiA+IA0KPiA+IA0K
PiA+ID4gKy8vLyBSZWdpc3RyeSBlbnRyaWVzIHRoYXQgdGhlIGRyaXZlciBzZW5kcyB0byBHU1At
Uk0gb24gZXZlcnkgYm9vdC4NCj4gPiA+ICsvLy8NCj4gPiA+ICsvLy8gYFJNU2VjQnVzUmVzZXRF
bmFibGVgIGVuYWJsZXMgUENJIHNlY29uZGFyeSBidXMgcmVzZXQuIGBSTUZvcmNlUGNpZUNvbmZp
Z1NhdmVgIG1ha2VzIEdTUC0NCj4gPiA+IFJNDQo+ID4gPiArLy8vIHByZXNlcnZlIFBDSSBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVycyBhY3Jvc3MgYW55IFBDSSByZXNldC4gYFJNRGV2aWRDaGVja0ln
bm9yZWAgbGV0cyBHU1AtDQo+ID4gPiBSTQ0KPiA+ID4gKy8vLyBib290IHdoZW4gdGhlIFBDSSBk
ZXZpY2UgaWQgaXMgYWJzZW50IGZyb20gaXRzIHByb2R1Y3QgbmFtZSBkYXRhYmFzZS4NCj4gPiA+
ICtjb25zdCBSRUdJU1RSWV9FTlRSSUVTOiAmWygmW3U4XSwgdTMyKV0gPSAmWw0KPiA+ID4gK8Kg
wqDCoCAoYiJSTVNlY0J1c1Jlc2V0RW5hYmxlXDAiLCAxKSwNCj4gPiA+ICvCoMKgwqAgKGIiUk1G
b3JjZVBjaWVDb25maWdTYXZlXDAiLCAxKSwNCj4gPiA+ICvCoMKgwqAgKGIiUk1EZXZpZENoZWNr
SWdub3JlXDAiLCAxKSwNCj4gPiANCj4gPiBGWUksIHdlIG1heSB3YW50IHRvIHJldGhpbmsgUk1E
ZXZpZENoZWNrSWdub3JlIGZvciBOb3ZhLiAgRm9yIE5vdXZlYXUgaXQgd2FzIGEgYmlnIGRlYWws
IGJlY2F1c2UNCj4gPiB3ZSB3ZXJlIGFsd2F5cyBsb2NrIG9uIGFuIG9sZGVyIHZlcnNpb24gb2Yg
R1NQLVJNLCBzbyB0aGVyZSdzIGEgY2hhbmNlIHRoYXQgYW4gb2xkZXIgZmlybXdhcmUNCj4gPiBj
b3VsZCBzdGlsbCBzdXBwb3J0IGEgbmV3ZXIgR1BVIHRoYXQgaXNuJ3QgZXhwbGljaXRseSBsaXN0
ZWQgYXMgc3VwcG9ydGVkIGluIEdTUC1STS4NCj4gPiANCj4gPiBCdXQgY29uc2lkZXJpbmcgdGhl
IHByb2JsZW1zIHdlIGhhZCB3aXRoIEdCMjB4IGFuZCByNTcwLCB3ZSBtYXkgd2FudCB0byBtYWtl
IFJNRGV2aWRDaGVja0lnbm9yZQ0KPiA+IG5vdCB0aGUgZGVmYXVsdC4NCj4gDQo+IEdvb2QgcG9p
bnQsIGJ1dCBJJ20gbm90IGNvbXBsZXRlbHkgc3VyZSBJJ20gbWFraW5nIHRoZSBjb3JyZWN0IGNo
b2ljZSB5ZXQ6DQo+IHNob3VsZCBJIHJlbW92ZSBSTURldmlkQ2hlY2tJZ25vcmUgaGVyZSwgb3Ig
d2FpdCBmb3IgeW91ciBmb2xsb3ctdXAgcGF0Y2g/DQoNCk5vLCBkb24ndCByZW1vdmUgaXQgaGVy
ZS4gIFdlIG5lZWQgdG8gaW52ZXN0aWdhdGUgdGhlIGltcGFjdCBvZiByZW1vdmluZyBpdC4gIEl0
IHdvdWxkIGJlIGENCnNoYW1lIGlmIHRoaXMgcGF0Y2hzZXQgcmFuZG9tbHkgYnJva2Ugc29tZSBH
UFUgdGhhdCBuZWVkZWQgdGhpcyBrZXkuDQoNCj4gPiBJIGNhbiBzdWJtaXQgYSBwYXRjaCAob25j
ZSB0aGUgZHVzdCB3aXRoIHI2MTUgc2V0dGxlcykgdGhhdCBtYWtlcyBpdCBhIGNvbW1hbmQtbGlu
ZSBvcHRpb24sIGlmDQo+ID4geW91IGxpa2UuDQo+IA0KPiB0aGFua3MsDQoNCkknbGwgYWRkIGl0
IHRvIG15IHRvLWRvIGxpc3QuDQo=
