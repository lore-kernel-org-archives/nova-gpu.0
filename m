Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AB339861
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279063; cv=fail; b=dt0WO352jJ3MwTfw6zX5oXV2V0byRJOBGG0fEc5qKrHFsS6zJR8HcYF6peNZm2Y+gyl5qK2NoLwHgmDDg/lJVqPKH3lTMjSdXghxS1jeqdFp0ubPJ1otdDoyOaLC1GBgbQAFh0mlPrQxrW0cKRXvN7Qb/yhjsX97nuzh68OrBGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279063; c=relaxed/simple;
	bh=gqc0AIYwrppTl6r9MQc08wCwemwQIhbQiuvmL6guRvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nrJRVsCP6Tw1/XhqJGUQJoFXBZI/Xc4HaaEs2mUSI1I32Mp2DFffrdLopHJSY+OymqqzVaxNt8lxNQUHmSl9c2F3KMTaWK1bHSmbAuHvvdKRke/uW85AVJF4plS40dIoYqwiwVvlOdzPw0CM3vyHjubhR2mraqhxcVUqHP5hQ5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PFpeLHze; arc=fail smtp.client-ip=52.101.48.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PFpeLHze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7J9Xjb6ktX4TYlGtuUdkirkqbKEirhV9Q+ctJJrnJd0rp/MAdM4vqKV9+UUKfMJc9mErlP3vrBLPe+kUxuw93uEAUgxd52YmYi6qBjpQOpBxqpRZW1DG9B1wIgwSXhCrf8GaHgvwqHzhRKb9n0mnDMgcTVmX80f7FjgKfoKktGBzVTQkUuzYYmwfQ99V8yIUgX3dP/QFuepcWwMi26y+5KxObl0bOyqjMmy0+dc33GxiwTiy4OB4fWTxzLLCASeXfDmJNXAppnv0rtoL3IzsEMgc5fCH2/bh24cUsYGhKmul2uqsUmbAMMErWSB8Din7JnS20MgB27xXqsUOfSt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqc0AIYwrppTl6r9MQc08wCwemwQIhbQiuvmL6guRvg=;
 b=ANitkrBwiRlIVFets+kOlpTdVjhdYipogRbhh4sAuYuvPWHTdHYnO3i//o8aB59mEeHTD7bCaDyMviceAU8IAB+pk6tLFmUSn3IpyylnSj8sHhVeUFLOz4EycqIGKmtZRPO/5LNQFd/BxFFebg4dwA+NM/bbonFLikdf3W8ltOcYlgdsSSg0i1uUhC3ZaXHnFwYcoCSd2OKHTTMjrzFAjc+DETy/XtBD3zLpiVb3r7AkyiuePvQsDvxdVxjIcSJe+11DpzMU3ifn+E+rAv7k1SXe/pC7qtJAJvWalAPHa6Tp9i6DcGlGxAqjBeD6PgxuDYarWM8LT+JGSDa499I9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqc0AIYwrppTl6r9MQc08wCwemwQIhbQiuvmL6guRvg=;
 b=PFpeLHzebP2P4Ufu7L89x+ySAZcEZ+6EEpGPwOMDUaBA6QZMT/0jkoo3BCY5vI4TyAHaPDOThIp8tosykkxfHA2zTaIzRDTbtCCsfG/CKBeBswMu6A7K6iOEorBknsQUIeYdfinEahyzpWAOFZXfy+zVgrqFx8p6wKfAFKctFO6R240El2AwGsD6M+40SdPoXGd3LD9hA4HGTCebzjewe41H5LRbTSqhb4xI0Mu/XlMigtr/hBa0UD52GjBK5NLSXAbh8CIRZ0CAd/Y5zUgFFNinyix4+YMefw/oX7Z1zRTEAcKsUmoIuvb/1CZqnVX6+Hu5h9uhMeSrqOM4Coe+iw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 15:44:17 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 15:44:16 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 8/8] gpu: nova-core: update firmware module info for TLV
 images
Thread-Topic: [PATCH 8/8] gpu: nova-core: update firmware module info for TLV
 images
Thread-Index: AQHc+QGbFrXn8F1PkE+S/6aLTyA/o7Y7BtgAgAALyYA=
Date: Fri, 12 Jun 2026 15:44:15 +0000
Message-ID: <6d09cae1c4d292dad860dc1126c4f18930b6072a.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-9-ttabi@nvidia.com>
	 <DJ75TUE8DMNY.3I4RVB7WCTDJE@nvidia.com>
In-Reply-To: <DJ75TUE8DMNY.3I4RVB7WCTDJE@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DS7PR12MB9504:EE_
x-ms-office365-filtering-correlation-id: a9bc1261-a527-4daa-cd92-08dec8997586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|376014|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 6nczGmby+sYBy8e3y4qOQbYkQuAQsO9g3xDKbYEqb9IosLZ8/pmpVRz4rEsgYYJshWsi9Bn5VBu/f/OQVNL9zCKB81zaGG4gi8HE0UI7fo4AYkHelZlN6KzCvyYOyJlI17BiLSF+sMJOGNBkL7+cHMmj3z9bA+oWq7l562PjiXPR21ZVNCe7fikDWaPYwQU8jf/6OMkdgOMqi6HB+MX1kZi2zQZkgh20MdH84nvnaGCkFJCkGeS9lOxNqbWn03FcNYh5p0nlnB12MeE+gt8YdUsXatETvzwaShiInV+HeG4MrdZu+it80QB6jHpy/ZdG5FCAKBshqCBvNAZaJltzmpG4QeJRhwPlNHsrbENtOtSVL2UJEosUc08XFPOCcOdI0l8WSBMmwPVOx9I4r8kl+cNm4Ku7jW+gs8TkIAVhuvoHAiyCFZ19Rcl3AdZEsQ4zK4YQZJMf5o030/dvU9YAf7oVVc5IAhcnvjQMzPMJzRMAQIg5IAeXsTNTLQaHuPzreZR9EA8D4fiaPRsePvWvq+Br5+TBQhbjWNFo01tUOURLarMUHMhIM1z2ihQyRQDWuUSM79fLjrYlVytzzPLE5BpxXZ0UHvZMe8TX3I5rSKDvkKDctkjkSBQD+2FapKeIJE2eIcdjsprvOWffkL9PLiXgYBAbcOKM7TfB/bmRmyKOefs/FHVPJ3raUXGuIcrfksUWA94CSYVRTT1pIiXfBlPD9Ke2qc5QOd3nstlWfvWemUpE079HLE2wLorFcNrd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGxCT1RLU3dudVJwT0Vqclo1clpGYTRyODNKQ1BKRGpjNkg1TUJnaCtXK2pO?=
 =?utf-8?B?Mys0K0RxbDZoVncvblZaTWNCMGlmMmpTcFhmME1oQkNwTmxUT2h1QWxPeUg0?=
 =?utf-8?B?bktZdnQ1L3JzMTJzeWZRbXExaWJhcjJzSXg0ZkUvUHBOS0JBd1RsZkg4Mlkz?=
 =?utf-8?B?NTFSSlR2UGFJOG9mcHlnN2dRbDJyMXBIR1AzQmlQajRSZUs3NVFvbHZub0po?=
 =?utf-8?B?K3VVUlUvWWRpV3VENFRjV0NNYTlYcytDNExIMVBaeGpITVcwOWk0TFpHS2g5?=
 =?utf-8?B?ZmxGdzFGNWwydjFDZDQrWTBycUVXVklVSDA1TlVQMjFCdmlnZlU2ZmVHSGh5?=
 =?utf-8?B?bGgxcGdMUEFEZDJuMUJ3MmpUMUsrQm9PY2RQSGlSN1ZVaHlnc0dsVFFmMHJa?=
 =?utf-8?B?MFVxeEp2dm44dmhwV2g1S3p6bUtHTnUzb0VVb3VyRHRBTHFaSXZEZEM2WHF2?=
 =?utf-8?B?UkRqcHZ6Z3U2RkZEeExiR0grYmt2UkRZY2JCK3dBSEZmNEZBZmxiWWtuc3hh?=
 =?utf-8?B?YUQraklNcmtDOS9ub0FwWEVQN0l5ajRpV3NvUkg2ZTMrS3pRRWhhMUR5M0pJ?=
 =?utf-8?B?VUxGcmxseXpLa0VIb0wxM1kvbWh0TzdMc0RwWEJzem1ILzkrK0ptQ3hOUTJt?=
 =?utf-8?B?RHpFQU5yNnFXVlFYU1MrV0lWZGxHU0M5cEdZeW1NcUNWbGtBaUNiclRtckM5?=
 =?utf-8?B?ellQWFJ6ZEhENElEZHBtTkVLcmtDMXV6dGQyVGRTK055VWJTV1h2ckZIUUdN?=
 =?utf-8?B?Sllsek42VTlZdWtMSzhEZjdUWCtEbzE2T1h6Q25RMlNFY0EwSHV4VGVlei9B?=
 =?utf-8?B?TTlQeHJFaDNHbWJDVVdGbnBCTFp4YVVYMVdSMVRlMEYvZlVEN01pVFluSnVi?=
 =?utf-8?B?MFkvS1Rtenl5YThRVG9wNFJPL2pZN3AwQWZPR2l2THBMVU5sK1lUaEhBMHpV?=
 =?utf-8?B?RDR6UEtJMEJiWVBJcnp5UE41NElrUys0VHZDZnFrSS9tQVJrRFIwMm9SSGEw?=
 =?utf-8?B?NXZaV05nNUJqSTExV015TFoybklDWE1JdTVrTDFwSnR6eGQ2U3NzVVRidUtt?=
 =?utf-8?B?bnNYRHo3dWhYNndXSXdQdGtlSGxOMkEzTE4zSE1ZektQUHVJOS80RWlyNzBj?=
 =?utf-8?B?eUxIZEdYK1JtTG5MVDdOYkRaMXY2NStUR2dOR3loUGZ0TGJuZStuVHc0ZHpy?=
 =?utf-8?B?SlE5alkxQUNzZ2xjWUFadWU4MFpYL1NvQXJWc2hjMWtrMGdVSjRFYUNJMk9X?=
 =?utf-8?B?bzdZcklnVVJwbURmdU53bnBSVFk5czVLUEVGOEFyNWlMZ1lqaWgzbFdVSUpR?=
 =?utf-8?B?SFJHcUpuZjE5ZVhyWVdSb0h3Q2lIN0JsNDdJazdiUDR1d2NqSHdWdkFtazR1?=
 =?utf-8?B?dlExMUlWd0hxUDRzb3dsVmtOL0NFRDNhYUFobk9senh3c29TZmlBSTlnWjRO?=
 =?utf-8?B?dVFmR2phaHRObU1RcHZxZ1JJWnhNV29LVlAwdEVlZnRzNGFyQUJWYjlINWtx?=
 =?utf-8?B?RW5Fb1lwUlMxa1F3Wk5vVE01VTJQd3JrR1pqRE1aaUFiWEg2bm5wV2xxV2dr?=
 =?utf-8?B?ekZ4S0hnMit0SlpSMkFBK0NHTFZrLzQrSUk0QmJLUWoweWRxaFo2MHY1NllF?=
 =?utf-8?B?QWcvbkxFVHZBTUtwZlJMT3JsczU4NkkwRVVKZS9GYytLazV3WE1XcTI0bFh0?=
 =?utf-8?B?V2NOa0Z6RDRxVkVRNXRYaEhzMkU5bmp5eGczeHI1YndUU1Qybnh6MzZrQXJC?=
 =?utf-8?B?cVFrNmF6NjJFS2ZlR296cGJKc1dSR0R6TVprT2pEQTY0aU9NLzh3N0pvYlhy?=
 =?utf-8?B?V21OYms3TTBzVXVPMEpTK1FvMDdlSlBUVGx5QUFMelhsOXM4QXNoeGcwN2Na?=
 =?utf-8?B?d2tLNWx3WEF4OThXYldZa1ZZMVBXZk0rSm13RW9idTU1OWZXWG5BYVQ3TGRp?=
 =?utf-8?B?NWt5NEtkZi9iZElsUjlIbjgzS2VKYS93M3lQNXo0WGc1N3lHUkc1YjBJaVps?=
 =?utf-8?B?WFUzTTUwZlBmVjRJc21wMEFaNDR3NWtRTGlUb1pkbGxDeTYzc1ZZbDN6aVI2?=
 =?utf-8?B?aU91ck9oUnN0SXl6N1ZOQjI4T3hYZkI2Q0U0TlVVdUdiSGI0YUErMzlVT2V0?=
 =?utf-8?B?UUxTR1g3djJIMTNWbVdzL0VjYXVHNmx5QU1ubWxBT052cFA1SVdJdng4Lzdx?=
 =?utf-8?B?eUJLV1NnR2MrNk1xNDdZaHlIRnFLTktQOHEza29tcUJlV2RWTTM2V3JibGVP?=
 =?utf-8?B?blpCbC9LSEdrc1pqVlZSNHA4VWljOVo4bUhYa0lzSEdkbTY0eHNiVytDRnll?=
 =?utf-8?B?SEpkZGMwWHE4M3BVS3JTQ2hHTzRyQVRsTXR2S3B3em5oZkQ5N2xPbXMzU1Br?=
 =?utf-8?Q?qx0zlNJvR30cMXR8xqYIE2Km4zkfLIqC1JknqxsmZqSNB?=
x-ms-exchange-antispam-messagedata-1: gk89iUDHI8R+5Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7919CDCE9A71AD44A17D1EE3C5A8320F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bc1261-a527-4daa-cd92-08dec8997586
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:44:15.9640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UesNjauc0uKZ4KVbDxHvWzVrHuoKo6fp54aOYK1gBEotk1Yx+sq/kge7dJuASACODJY8Yjr9Pqt5xz4VX51AiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

T24gU2F0LCAyMDI2LTA2LTEzIGF0IDAwOjAyICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgdGhpcyA9IHNlbGYKPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5tYWtlX2VudHJ5X2ZpbGUobmFtZSwgImJvb3Rsb2FkZXIiKQo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1ha2VfZW50cnlfZmlsZShuYW1lLCAiZ3NwIik7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubWFrZV9lbnRyeV9maWxlKG5hbWUsICJib290ZXJfbG9h
ZC50bHYiKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1ha2VfZW50cnlfZmlsZShuYW1l
LCAiZ3NwLnRsdiIpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubWFrZV9lbnRyeV9maWxl
KG5hbWUsICJnc3AuYmluIik7Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBGU1At
YmFzZWQgY2hpcHNldHMgKEhvcHBlciwgQmxhY2t3ZWxsIGFuZCBsYXRlcikgYm9vdCB0aGUgR1NQ
IHZpYSB0aGUgRk1DIGltYWdlCj4gPiBsb2FkZWQgYnkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAv
LyBGU1AuIE9sZGVyIGNoaXBzZXRzIHVzZSB0aGUgU0VDMiBib290ZXIgaW5zdGVhZC4KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoCBsZXQgdGhpcyA9IGlmIGNoaXBzZXQudXNlc19mc3AoKSB7Cj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aGlzLm1ha2VfZW50cnlfZmlsZShuYW1lLCAiZm1jIikK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRoaXMubWFrZV9lbnRyeV9maWxlKG5hbWUsICJm
bWMudGx2IikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdGhpcy5tYWtlX2VudHJ5X2ZpbGUobmFtZSwgImJvb3Rlcl9sb2FkIikKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm1ha2VfZW50cnlfZmlsZShuYW1lLCAi
Ym9vdGVyX3VubG9hZCIpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aGlzLm1ha2VfZW50
cnlfZmlsZShuYW1lLCAiYm9vdGVyX2xvYWQudGx2IikKPiAKPiBgYm9vdGVyX2xvYWQudGx2YCBp
cyBhbHJlYWR5IHVuY29uZGl0aW9uYWxseSBhZGRlZCBhYm92ZSwgd29uJ3QgdGhpcyBhZGQKPiBh
IGR1cGxpY2F0ZSBlbnRyeT8KClllcywgZ29vZCBjYXRjaC4gIFRoaXMgd2FzIGEgYmFkIG1lcmdl
IG9uIHRvcCBvZiBKb2huJ3MgcmVjZW50IHBhdGNoLgo=
