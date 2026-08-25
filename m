Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E394964F
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628199; cv=fail; b=NbL3nb5PzOX2RKU60Em3UfthcYsWmrFBhdbgHlLb3ZJowk5NusbYgmHFdNexuZguz7KWd8/wxlfJQ1pN4rGxhV4e2gobluFMHVPczokIA5zYy9zEW66AY7g1INvNlAp5o1j9I4HgF1NN7dmOLjY1CN4lftju11Gtz4wTG+HX6bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628199; c=relaxed/simple;
	bh=6urv9RrarDg4fufTJvCnU10CxKNiiZuse8MmVH13ghk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n41z5geZbH00Q/ayRasdLhoKMCWvfG8etSIirLVz5Y+alcegxVH58Nj3QLbxblc0o5IuHbo+ZWU4BiGBQaABaaYKO3n5a5HGMgT+KHBgPEPT7FAMhgARPOw6GGTgge2JGB3OFwYQf/qeeJW6YZSdNs3ujW8TU8USNNlFbLz41zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qltEQzgk; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qltEQzgk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3O93KwQ50WuVft1Nh4n2NfMxnkuuCBDu+aHTLkdbHidsql5nUgVCdlZJoC0XDodJL/fW4sThKnr02W/b/pdvTwC6kQihcfbm0WbLa8eNX+0ufJFOIHjNzGE5gv05TUoPGvc6tJTRs6TuUe+OLAqfSdGbTHbBIaZPFkArTvI5sRuobCUAJpHmQ6YAWt48b/aT+ZxtD1Bb7pT6/HPoG/7zwXqQUxkG4UxARgCUFogkgrozo1U1vuT9kUzqdsKuC1/VZ9rIEAggmvT6J7+gHz0f+FvhqkVJ7xUiXnYq49iJ7A+RqEoDyOtTpmO4nbMkwmOwUgXiZk1KJrhx0ICoybO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6urv9RrarDg4fufTJvCnU10CxKNiiZuse8MmVH13ghk=;
 b=UBURhRszNO7pV65n8vNhAh6gYkM50u5VpKf9GhurKoUYk1gHvsqYCBH7a66sGWGkIcZh4KZ0uf9CRIEnTpp4YtD/tHoebwUd+5CLJ/Gm0/JRv8YDG6udqZ891wPx0TAVikpNqX2zrJT/LQ1/86NdXQK3zROB2sbmx39Pyf+iOM3cfdwKsrGtvLr9L8IqOMS34HPj1gJiveSF6CfVQOGpYl9yyLDLSs+K5TWgIO7fM2OSPFG2aNa2g2lsDmsVNPKRhuZfMsRq+v2Cvyih6TbI9BaIod/qg3GqIEqHeXH+VLAkdGT7TWmzIZUPF2lg/Ihk9kjQzuG/5GaN4o+TvInPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6urv9RrarDg4fufTJvCnU10CxKNiiZuse8MmVH13ghk=;
 b=qltEQzgkX3lY5/QiR48L6hyWGaRcq14rtAAaawmRZUmI97wE7pkActOdzVob+7tuGu9CEjzPeXgc8K4E4Z8YY2C25SED6Yy32Bc9jTct8Ryb7qVLc3ovk9Y+WruKQtWaeRet+kN8Bu0XF52jnYb12lGGuosPsTN7WYnKdOE6rp/Wv8jytX4rqokPqckXXZzxhGfQTk9hvleRxdgxo4syYqrxGzAY5/n934Acc/3S/xHcX5jygWagZL+XzQDIuNHT/E8EqwAwHmkkyJjcX8OnL0el6EhgtYekSqOFP6HPV7/1ww7HfHV5wjSZ/hHYzCv+oTipMITUMm5VePvZ1i6dew==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 03:23:14 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 03:23:12 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
Subject: RE: [PATCH] gpu: nova-core: write initial RPCs before booting GSP-RM
Thread-Topic: [PATCH] gpu: nova-core: write initial RPCs before booting GSP-RM
Thread-Index: AQHdKPPrVaU2f4BlWk2Vq6QuEmt+xLaskfUAgAGds0A=
Date: Tue, 25 Aug 2026 03:23:12 +0000
Message-ID:
 <MN6PR12MB8568E108EDC3DBDA8E18CB5EC2AF2@MN6PR12MB8568.namprd12.prod.outlook.com>
References: <20260810181243.3036669-1-ttabi@nvidia.com>
 <178753923258.768430.14456476216173796572.b4-ty@b4>
In-Reply-To: <178753923258.768430.14456476216173796572.b4-ty@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DS7PR12MB6072:EE_
x-ms-office365-filtering-correlation-id: cc819c1c-f9cd-4d66-3a5b-08df025831ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 a4/L/N6otsCyuWF1pfmgIUBJCJUfAzezUfFNg//neydx11M67fiChItlB+m1IKXzmijyzGdcuIOIOun0LfYIbG5y9DWJY6zf/XbKDkqSrLREqehqDcDNqT8KWK5N5mjyl2Mi1a6HKnh/6srlq9SP8VYQDK1hgVsx+ficdugpz/Tolj3Yab5GEuZ3LobHcPWaxw2V1ARm4Bc8RM8v7FNLBZgbuoU8ipOSXxVpUkbFrEa+Rgmc9rJtciWa03GkVptaG/ivW4+e7IZCAwxT/+UhjXx/LMkIrAQyhamab0+MmC68z014SQQqUc5kDoRMxH0Ur2TY6/AncKi/u2iyOHTpFtMAkvGRFmH9heGqY3/xfiyBqWweOFt+gnM6h+52Sov8BzUgqLnCaJU2uxXU0dpju0Tr4uCHydRGelT1paSvBJ/+cJ05k3YW16mO2UWI2f4R7PEQk8CdjmjRayUiGoQrXUP3LHm/80EAmI8qstFyUrQygsAq7B079dbqax6eF/1A6qzAS3RBp0+9YAlBAVclBQ3MEtjP7a1ZICWaGIeHyVQU3kOMXhfDRKPe4S+WHpK4633PqTqW3fck6KZ1MpbGU7VNOnRiyZzNKhdD6Rl4Ego+R/7jaEFJdSG+o41xM4cw8HT+3odMWB6uYORvYja9JLAroGXCY6AjgameAlhW60YI63T3FoQrBjT1JhUXG47vjTiH1KSHjbYT1+1uZRpEqGHBS0S9ytuDJXdOh8k0bQs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWFkc2Y2S1lBS1FEeUNvRFE3ZWM5alVxNS9PczRWeDcwaG5xODdYRjcrSmdr?=
 =?utf-8?B?YnBSS3pmZjNYRTFUVzRiRUx3eExmbjk2N0htUnpjQTRXK3JrTVJTRW5wcDFv?=
 =?utf-8?B?NzI5dzUzYmZ0Um16cmJyWTh6ZmpDcGpCWWZXd2Y0Tk9sNnNIaHJBYjUxcGRM?=
 =?utf-8?B?dFh2NlVhMTBjZkRya3l4cHdDSDRQVVR2YTA4NUFidnh6N3RCT1F2OVQvZGFv?=
 =?utf-8?B?ekxwTFl5ZWlJQVU4RVJKSjJqR0ZCM29EcmxuRmoyN2t0d0tQVTUzaXhLVzRv?=
 =?utf-8?B?UUlzZnpSOHgyakYwbDVqVVh3NTg0cXpCeko1UmNJZm1yaE1LbTRoblMvSm11?=
 =?utf-8?B?dlFGd2Z4SWFWTWdMczF3WmQwclZHamoxdXJGZTg5Y0cxSDc5NzZrdzBLZ0JR?=
 =?utf-8?B?emNMRjZRQWNaRW5sRkgvbzBqaUtXYVdOc3N6bUNVdzg5Sm15R29pZFhoZG50?=
 =?utf-8?B?VWJwcUhWbVNaM3dVVkNOeVRwY2dSWEkxeitsbEVkTUgzWENiN0RzQklTM3Jh?=
 =?utf-8?B?N2R0YUR5Vzl1WU1lcFVMQ2Mya3B4TEhTRXFMcGxaL2k3UVBtR2ErbXlmaVl6?=
 =?utf-8?B?Y2xjU0FFdWpMUTJXZVFYTUt0SDF5cUlsUWw3c1E3VGM4UzJjV1BzSmpaYnpG?=
 =?utf-8?B?SnNSMVVGRlpOOHBCRkk5M1JDS0NiYWh1d3JQcE1rTVpjZ1NjQmpzTStGZ3B3?=
 =?utf-8?B?WEdLRXF1aURxTzZDWTNiRnhxalBjRzNTSzBWR0I1cC9HMGZLMDlpVGV4Q0hD?=
 =?utf-8?B?TTZMK1puc0pzNi9EMEZZY1lyRlJtWWFvRjY0UDZUZDJZREg1ekFTbUdHTms0?=
 =?utf-8?B?aWVOTmFIK09GZnBxbEwzUmZBcU81WjAybDhFSE5NQVpqZFBPMUFIZ1dmbnpW?=
 =?utf-8?B?Mk1Ra3NDMXAwZ2hmODhsQ2txMENmbEExK2RKSGFmSEw3d3JYWnNiOFE5M2Ni?=
 =?utf-8?B?ZFVQbjQwWms3WG1GbjVmQ2t3Q0I2cUlxV04xVXF1U0prZHM1bURLcHIxdk1N?=
 =?utf-8?B?ODFPM0dZVUZIQm1xb3pUSVIvNHBMbE5uMmFIdHgrSmNLRWpONjhpSFFaa3hi?=
 =?utf-8?B?TExvdXBjTys4RHJ4ZjR5azdtWFBKWExXejFhTWtiRlpFUFEweHFmY1lBOUFa?=
 =?utf-8?B?VHdFU1J0NEtRYTg0YVJNUm1FVXVEVytpeGtEcWpJQ1p3OUd2eE0xTWFYclIy?=
 =?utf-8?B?bksrNVgxSzh3b3VJT1dvbUtyRFIwVW1OWllVR3grUVAvWGVxTitWbFdROTgy?=
 =?utf-8?B?N3NubUpObnorU3NDVHBNeHlOM1pZU0NLN3ArYU1aa2dvdzFST2QvZHVtM0Zj?=
 =?utf-8?B?VGtDazB0aXZ2c0Ruc0grN1BLUHRyUmtJdC9JOHZLRVlDSWxXN2FpQzZNelJD?=
 =?utf-8?B?d3R4SDBzS0w5UkFxR0haMWQ0TzV6anZTdlZvcGM1NkJSL3Nqd2lnOFhvVW53?=
 =?utf-8?B?aEJPUkN4Z1FIa21qUE5RcmwyQ3pWdlRuVmFPVUdhbmJ4R0l3cWZBWkVIbURr?=
 =?utf-8?B?ODNVSmN4cFFtR2VueC80T3VWYnVoWHE3OENZNWpuMEM0dlhZeld5SUNCRXB4?=
 =?utf-8?B?OG1LdS9WdWJYWlB1bm5KR2JWUGJueHZvUkNFNkJtbDNwbDNRQ1MyUCswa0Jw?=
 =?utf-8?B?S1htZXhYRFhXN3U2cnRJbjRHMU9ZWkFWMUsyR3JVVndvdGk3c1A3OHlYTzRC?=
 =?utf-8?B?d3pqL1hWcWIyOG4raDVGQ1htcGpvNDM1K3JjTkRualhwUXBqQkQ4eCtOTjBa?=
 =?utf-8?B?K2x5cFNTYWhvQkxlT3lrNyt4TUpxWm9EQnlTVTloWndIekl2a0N1OGs5SE9N?=
 =?utf-8?B?eVVtVUs0QmdoZ1FZYkg2TnpJRHI3TitOUTcxN1JnZ2RMTzZ1QzNkeC80Rzdu?=
 =?utf-8?B?NWMzaWtqaEtVcEFwditiQkZ4R0cxSGJDVHVQT0RoTHJYY3JncWtHTzI4R0NM?=
 =?utf-8?B?Z2RDcTlVbmFRTzJPN1c0TlVFWlJLa1FpQkxCQXIyZmpyY1llTFhDbHdPMmU4?=
 =?utf-8?B?L2FtV2NZM2gvaUt5NERKRk5MM1h3d1NZVmlvZnhOelVraGtnQVlTWDRRQTNo?=
 =?utf-8?B?WUsrWXEyeHBqRmVIdGJDdFFPTXVKVHA0Z1NsdWxvbjZGTis5cWFVMm44OVF4?=
 =?utf-8?B?UGpxNjk1aGwxQ05MeWVxcHN5MGdEQmtxY1IyUjI5b1VNaDZjdURTYUxpcFhF?=
 =?utf-8?B?K292WUk0Zi9WWjR0cHozUGpBM0hkbklzcGp1cFIxbGdaQ21QTkkxVWFDbXRK?=
 =?utf-8?B?ckVnVk5BUUZKcmUvazRNNVErdlBQMmZqWlZMSk5xOHppcXF4Z3hHWnVuTnRL?=
 =?utf-8?Q?mO1lA48YeJjFixGJIB?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc819c1c-f9cd-4d66-3a5b-08df025831ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 03:23:12.7962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrRPefSRyyAIbO89xkdnsdYiiu9haG2llwn6F3Kt7GLm9kqmr0EB74qRXJMCKZT2HtkjP5HncjwvVtRIukWO7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072

PiANCj4gT24gTW9uLCAxMCBBdWcgMjAyNiAxMzoxMjo0MyAtMDUwMCwgVGltdXIgVGFiaSB3cm90
ZToNCj4gPiBNYWtlIHN1cmUgdGhhdCB0aGUgdHdvIHNldHVwIFJQQ3MsIFNldFN5c3RlbUluZm8g
YW5kIFNldFJlZ2lzdHJ5LCBhcmUNCj4gPiBpbiB0aGUgY29tbWFuZCBxdWV1ZSBiZWZvcmUgYm9v
dGluZyBHU1AtUk0uICBUaGVzZSBtZXNzYWdlIGFyZQ0KPiA+IGV4cGVjdGVkIHRvIGFscmVhZHkg
YmUgcHJlc2VudCwgYmVjYXVzZSBHU1AtUk0gd2lsbCBwcm9jZXNzIHRoZSBxdWV1ZQ0KPiA+IGVh
cmx5IGluIGJvb3QgYnV0IHdpbGwgc2lsZW50bHkgaWdub3JlIHRoZSBlcnJvciBpZiBhYnNlbnQu
ICBHU1AtUk0NCj4gPiB0aGVuIGNvbnRpbnVlcyBib290aW5nLCBidXQgc2luY2UgdGhlIHJlZ2lz
dHJ5IGlzIG5vdCBzZXQgdXAsIGl0IGZhaWxzIHRvIGluaXRpYWxpemUuDQo+ID4NCj4gPg0KPiA+
IFsuLi5dDQo+IA0KPiBBcHBsaWVkIHRvIGRybS1ydXN0LW5leHQsIHRoYW5rcyENCg0KRGFuaWxv
IGFuZCBBbGV4LA0KDQpDYW4gd2UgYXBwbHkgdGhpcyB0byBkcm0tcnVzdC1maXhlcyBhcyB3ZWxs
PyAgSXQgZml4ZXMgYSByZWFsIGJ1ZyBmb3Igb3VyIENJL0NEIGFuZCB3ZSdkIGxpa2UgdG8gZ2V0
IGl0IHByb3BhZ2F0ZWQgZmFzdGVyLg0KDQoNCg==
