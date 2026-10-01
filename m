Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF882533588
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 21:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889078; cv=fail; b=PlkhcqS3Nf9z3DqxreVgPebe3w3ZPUfZP8tmlWXselXQjrO1/AW3TW12amzyu/Y1UxmrIviyPxBGIMvP9H+r+BznBwbYmx3Rf6U7Pe2Ah6Mii2A4WrMz2gDBr1RA7ggplOIiX/tDD8NTuyKDDPLt9DC4ajR8G3L//PzaGIFyy6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889078; c=relaxed/simple;
	bh=+zAbcQzmgSCCwbMutZ8xmHW7QUfD9A9vBLKczC9VpGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I7i8qaaZQl7DSGD3nn34/OeC5X1eoJpVuWactm6pNHtFidxMVuqWa9g6PnudDT9KB+mtqNvfzmUKVO0uq26mNIeh4/7jQmuApt3uKs4brOfFUOorIWdSFVAQwlTc3evE+lYB0m2B6E6DE9wKrYQ1iehcvdNIVIdVtFawT4FdOpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PXdgQzLR; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PXdgQzLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmdmheafCFTMP2DKnJlUnJ/64iC5IV+lqVbVvv0gRjb5uRi6J9kgMxjOYwUvqkno+HU0aBEw6TUAWzhOhTQDx9SoMbe4X+K4H8Z7RBtp/17vCl5UuVZVNIJoeVDgx4w3/35BxbllJoomDuffPIB7RhTQ+HUGpc590Mq5b8vfDhOGBb936MZNum0I5IaXIdJsoTLtW+hFu1kP7SiysIIPov+Iz36NOBnEAu+p4gsQ0unYjwcmcWKjPqrmiHF26zpDP8FBCjKPgDnyWXsre+RkmahiLvm7K1E3f5LXHYPBE3FCtdiMucUvTbrZ3BijSqd7hkobiJwHOVvvb4y2441nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zAbcQzmgSCCwbMutZ8xmHW7QUfD9A9vBLKczC9VpGs=;
 b=tDJvECfHJ6GtoHxOvekkCq6uLa5I3ImoUY9xtyPlLC63hkQUBwe/yuN2IuALjNq7r7vg16FShpG5IghvJjWvF/eD/Hy6LRS/1IY9t9nY3+6TKLorrLnTqDDD5bq7bHy/jXaJA+uKZ6pkfCGMstUYVNrOq2Ko/cdzOBuRO6JMtgOTN+vVV5LUmmsrY0dkUU2mHh6kHdIDZD2uc46LCN/dRnEw67xFIvGzUWgmGeqHBuwm0UJM9teG0sVn7ijn0dRgifDzIJSrX8CPV/+RkJ4m4b08yiL+gOldb4sl/4iU7t4orcp/MuYH9fOANmSOMLi+D5kv50uFxoJx0Thyq3eqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zAbcQzmgSCCwbMutZ8xmHW7QUfD9A9vBLKczC9VpGs=;
 b=PXdgQzLRr/NsmNhO/nlXOR5vVUWVUN9hA9qGg/uaoyeESo834q5Pe+uFbgSr34DgQ19o4lMdQgX+KSqGAQMKsmFtl0cTi1RHLn1UoZApgjWPqRetlUqFnx1JADLQnO7v6FeQhSm+jj0jouEESsc7nMTcPP7PEIwp+Oj5WU/vNlXRo3/0XQmidA/gjrUNKfkRX4jgAKREuHjNvH9EfJcK3xIGfcA5nE3KwUKcniykA19eH/TvW06Ts3dl3gOTbBlDiuIFClkW7jF0HeMGuZwsrl8ezQNiSdizZLB8hTtqgokZc2Qbh15nkApLqBhbSr7Jupc2qLhIj160uZ107NHt1A==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Thu, 1 Oct 2026 21:11:00 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 21:11:00 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Neo Jia <cjia@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, Shameer Kolothum Thodi
	<skolothumtho@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
	"alex@shazbot.org" <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
	Aniket Agashe <aniketa@nvidia.com>, Surath Mitra <smitra@nvidia.com>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "kevin.tian@intel.com"
	<kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Krishnakant Jaju
	<kjaju@nvidia.com>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"Alok Kumar (SW-GPU - alkumar)" <alkumar@nvidia.com>, "Tarun Gupta (SW-GPU)"
	<targupta@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"zhiwang@kernel.org" <zhiwang@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, Yishai Hadas
	<yishaih@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH v3 07/31] gpu: nova-core: vgpu: reserve the 48-VM WPR2
 heap
Thread-Topic: [PATCH v3 07/31] gpu: nova-core: vgpu: reserve the 48-VM WPR2
 heap
Thread-Index: AQHdTzSXgsS98OFkyUCwVxEirQuNOLbpNE2A
Date: Thu, 1 Oct 2026 21:11:00 +0000
Message-ID: <538203f1d7ec5963d57319a32a8e24476c08bd82.camel@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
	 <e6334d750c07fef971f48f517449fc8d70be75b3.1790580105.git.zhiw@nvidia.com>
In-Reply-To:
 <e6334d750c07fef971f48f517449fc8d70be75b3.1790580105.git.zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DM3PR12MB9435:EE_
x-ms-office365-filtering-correlation-id: 829cd56f-e36a-4ac8-7000-08df20007e71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|38070700021|4143699003|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info:
 vkXPZ3PkAoCp9z43Dfb3VV+zlondvpUOxn7KAxQ/tAHfBtj7XbYeN69iO/g6fjGRBWOVewlO4igEyTC/3HuW2+JMBoXsTu/u0pvY8INfgWKzJ99zXNk+nyfm3eINr6rMClTD/+aHKkH/EXK0ziZHhwOn1bHUntMeEyE82rZ3QhdnDaCdF+jNP7S8bg0pnTx2KFw0KMmwEVZRyxHubwzBmyxqDqqIIse5/g4g4uTW9Uw8xzuydMwl7yKPf2CaMftdzkpdoDxOalMr+kiXNlut9ipViYkexwY3Y5XPf4FNy6ofr4T+JBFng4yz/ux0v/igWyPskMEFZSrAx8ONSHM9s3XYPYVtsLCNORPHbnyIcznwnJ11YxglGkHiJgktdRx9DypWpA6y3PV3Su0BU/qjN4To/Ypz/nHynmfwxUtoge8+tFDgGsTKsqePD/KjOI4sFEd+SuMrCOyQyQ9mQRSN7ufyIMudXZJaOzgIEr91PqMBuRRmz9rMVDG+MZjlHEJlqVFk8r8sYWBmEgX74wp/zuedhOoSHY402I9jIu99VRE7qRgzgEr0X86QD5R0PCoxULPc+1btDnHO1lfgwZHAw6tY1KPMCy7GWrh9tUQH3Q96gZ3kBlhXxglQlV9sIelcrcfXtacjgSNNo/bXfLAeWRKu109HuuJ6NoJGywTPwB0SF85Whl5cnivcqJu0UgHEwnCHmxLnnZrEm5wDH3h6hSs0GjgrV+VmHMGpmQiJS5U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UktPTU90UjdiNkkvdHB4NFJSa00wUDM4cm02WFN6bngydjE0bit0UDFTM3pi?=
 =?utf-8?B?UG5lbDJmN2FndnhLY2xYNGhQK1FjaXVUcHoxUG5xUVN0ZHlpdGRaUU9MU3l3?=
 =?utf-8?B?QWpLUjFCV0t5ZlZoWVJRWndzeHFsd0U1dFFtd3h2b2sxS1Z0WENsVWFETnBK?=
 =?utf-8?B?TmhGei9OR2JaVllMNEpwUHFmSkJmZGpLUVhjVU91NnYvY3o5WXNaUXBuL3di?=
 =?utf-8?B?M0dQbWgxSERuTXVHYnYyTjBBN1NpRmE3RjRsdGdMOVdCQ244RzRjZWJxeEtR?=
 =?utf-8?B?U2Ywc3ZueitTQTFoenZwQ29rODdDODlkbmk4cEFMcFJlbmFNZEJwQkhUR3E4?=
 =?utf-8?B?a1JqS2VqMDBWY0JIOWNRaG5OK3lMTEcyQkI1VVFvOVN6NEhHYjVTaWpnWnhV?=
 =?utf-8?B?QXFwSEV4QVFqenI0d0VhenQ3aStNU05lYnRiQ01vT3p1YUltMjJPcHgvR0sw?=
 =?utf-8?B?ekc0RTIvSWF0c3MyZkhpV00yakx4eEJaUDNYV2tya0h5dDhPZjZKc1hyUkZY?=
 =?utf-8?B?QkE2STVvOTlwUXBpd2t4NGVVSFI2NW4wYTVKdHhzRG95enhzaktlUlBxb1J3?=
 =?utf-8?B?REZsMnM5cWE0NlhqeVRHaHpoYVN2NlVNOERvcnRsUzRhbER3a3hGOS9MKy8v?=
 =?utf-8?B?QThFK3lOcFc5UUpqVlNIeGVIS1J5TWg3YmNMRnVURXlKT1NJaEhnTDE2bCs0?=
 =?utf-8?B?bW51bmV5NjVhdG94SjN5em9ZeU9Hd1Z5WFRZZENIVW9xM0JYRnVPQ29uRGhG?=
 =?utf-8?B?RzN1MXhwaG51cVdKdkJYbVNib01qNU9PUmNPaDBIUWlMQXRMeTl6b1N4S3Nm?=
 =?utf-8?B?YnNROWE0bmtJQWNmd244Y2dRRHBuYnl2b21YUTFja0N5KzdjaW01WWF1cW9Q?=
 =?utf-8?B?MUt4WGw0OFFCVXBMY1lvcHRPckhWVC91c0toYkl1a1M5bEhlalJhaFlRUXQv?=
 =?utf-8?B?cEM4YzdGaVZZOGNtVGZIamt0Z0R4bnNUSTF5OHlEdHZWUFFlUFArRVlCTVNZ?=
 =?utf-8?B?ZXYvVyswcjhlRFdDZ0ZtMU5ENEJPd0VUYkNtVm4zSzBHYmt2OExWbkZXRW0z?=
 =?utf-8?B?V2VqNG1DMHFuZWVyck1rUCtDcUN2c1J4aVlFK1VNeDNZTDdTaGQ2Q1prWUN0?=
 =?utf-8?B?Rk83KzJwcG1kV0V3ZHk1L1dock9RNko4L2xyWWdBWjB1SDNuclNvYWFidTdR?=
 =?utf-8?B?cWd0dzdSczlEeEs0eUxDNU1NZWptQllEMUdFcE5CZzA5dlQxT2V4SkhadXZH?=
 =?utf-8?B?YlE2TENYeDU0Nlp1c1NGWjgxZVdod2VEQ2pQOXVZaXMyM3ZGazc0MEhEZVBq?=
 =?utf-8?B?N3J5SDEvamQzVjcyZGxLeFA4WDZ3d3dCdW5GalVvNkRsQ3JNSjBIbnpaNFJm?=
 =?utf-8?B?WXloT3JVQktmK21uNW4zREY1UDdIQ3VOOWZGcDJzU2hKMG1BYXM5S2ovYjVs?=
 =?utf-8?B?U0F0Qzk2NU9oemVlMlJFWHZTUTRPQmZ2c2thMDQxQkNDbEY2d1NFK05reDRp?=
 =?utf-8?B?NFFQRlpZYmlwaFFCcUxOZHV3SnFxYjhZaDVBNUFDSmMyN0RFVVF0VWN4c0Jm?=
 =?utf-8?B?Q1N6U28vVHlnUm85d0xOeEppQ1RUOUI1Z0pmQlhRN240NXMvdlhBb1NDSUhG?=
 =?utf-8?B?dW5EZG9CdFkrUlQ3aENvSGQ5cjd3M0czQnBKN25FZGNqQ2dBNm9JRkZjSlAx?=
 =?utf-8?B?SEkwVTJPWlg3OEp0U0JoSWRvbW9pY0VvVmJCN0p5Y2xtc0JUZ1ltTUJoZnZZ?=
 =?utf-8?B?YjZDUmM2MUpFSjlOd0F3aHE0TG1LdUZNbldYSkljbWZ6bUFjUG9uRy84eVFN?=
 =?utf-8?B?WUU3UmU5Z2o0K3JndjkzZVlpOEZldU9vZXdQa0M2Nk5Idzh2dGRRbUUyMnZ4?=
 =?utf-8?B?TmozQjQ4dklNTkpPay85emNhb2UzanBFR1dyakllVGh3NEE0aVVyK0FBQWcw?=
 =?utf-8?B?VUtmVVEvdCsxY2UrM3NNUUpDZXg0NzRpK2pMcWk5dlFENi9rUW92aDJnYnh2?=
 =?utf-8?B?ZGVIMDU5NHQ0anNOZUdYc1RPdExHRGNvcUJSNnFaOWwvV2JRVWR1NjBlbXZC?=
 =?utf-8?B?UkMxVlRwY1BVRHZPbjBNMTlucnd2N25ZczRSYThRVmhRWmRiT3kwWU5rdHpZ?=
 =?utf-8?B?Wm1hc1U4dlZmdkZmbjVBUStrUVhaN0ZNWlZaVUxGLzIxK2dKVm1hd3FsMkdt?=
 =?utf-8?B?NXJzdHcybjdFRTcyTTVmVWJxSDZ1MW9WNXh0MDZISElEOXhWUXRtVzZ0TGRO?=
 =?utf-8?B?dVlYTkZKOExRTW5kVzh6M1dsVEFkUkJ5MkNoQTl5UENmWFFTR1lueERrejV4?=
 =?utf-8?B?d0FObG9zYjMzWGNGUFZoZlgycTZzZXFqSVN6TndybFRxQzJRSDlUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEE9D97EECC2F041AACCD81B71A11AE0@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 829cd56f-e36a-4ac8-7000-08df20007e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 21:11:00.3281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyToeckm3f7CE/9QedElYN2bLN8AmeA8rzO78Zarw7pXK7Sj3AdsJwE8w9s/rhmWzezrdtZOc2RE0At0quqctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435

T24gTW9uLCAyMDI2LTA5LTI4IGF0IDEzOjI4ICswMzAwLCBaaGkgV2FuZyB3cm90ZToNCj4gDQo+
ICAgICAgLy8vIFJldHVybnMgdGhlIFdQUiBoZWFwIHNpemUgdG8gcmVzZXJ2ZSB3aGVuIHZHUFUg
aXMgZW5hYmxlZC4NCj4gLSAgICBwdWIoY3JhdGUpIGZuIHZncHVfd3ByX2hlYXBfc2l6ZSgpIC0+
IHU2NCB7DQo+IC0gICAgICAgIHU2NDo6ZnJvbShiaW5kaW5nczo6R1NQX0ZXX0hFQVBfU0laRV9W
R1BVX0RFRkFVTFQpDQo+ICsgICAgcHViKGNyYXRlKSBmbiB2Z3B1X3dwcl9oZWFwX3NpemUodG90
YWxfdmZzOiB1MTYpIC0+IHU2NCB7DQo+ICsgICAgICAgIHU2NDo6ZnJvbShtYXRjaCB0b3RhbF92
ZnMgew0KPiArICAgICAgICAgICAgMi4uPTMyID0+IGJpbmRpbmdzOjpHU1BfRldfSEVBUF9TSVpF
X1ZHUFVfREVGQVVMVCwNCj4gKyAgICAgICAgICAgIF8gPT4gcjAwMF8wMDo6R1NQX0ZXX0hFQVBf
U0laRV9WR1BVXzQ4Vk1TLA0KPiArICAgICAgICB9KQ0KDQpXaGF0IGFib3V0IGlmIHRvdGFsX3Zm
cyBpcyAxPyAgU2hvdWxkbid0IHlvdSBhbHNvIGhhdmU6DQoNCgkxID0+IEdTUF9GV19IRUFQX1NJ
WkVfVkdQVV8xVk0sDQo=
