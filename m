Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B93C1D7A
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163634; cv=fail; b=uxBfBEZyq1DzXeSThKRh7gROMs2UtaWcQ6kktpPIOat5SPN2RadfxYTYbyc7+sqOF9yu6yANiheJVJ+nVokKGd+Rh1UaJA4nnB5W5LBNDX8Ux/1yHCGUirtc2CsSoJKOo0NK7HkgeowtUc79SWGy/NRHsOTDMycT/+BtNqNYBXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163634; c=relaxed/simple;
	bh=SorX8pTxEenhs5Gm0Txc2P66P3yWgRvlduQ/4RRK4e4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F9I++vxZ1FMo4AckF63UHVjJHkpQsIje6sTZaajt002wXeONLUC4Bwz6edOYH6YEwUQKx1z/Eei6J7B916KSn8tGrZE0gFIkiKI0d/gujNe8xZa9RFfxaGKaNU2IUmghuGJkcPS3hxFvPSZvwihnmoLJoEB+s1SDTu8KJXXl3GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gs9WtOwZ; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gs9WtOwZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtMLcuoB5nTDFd0V63ou2jF2n1t3L4pTwsKvKAEsHoPoc2djD0KCB5NlvYV7JRoGkiwT7GVXVwp0m6/CoylmUb9i0TqVteWZQ7upnYB9SHIQ9aE4JYctBr2d4pJMXRfQBA0LNrQv+T+fUyYhkB2Wa7Lta23i19+SUQF/fU1Lr0tqka9owgc2apqLOFQYcwnpWqCwmb0Mhk9BXgXdmSX75t1wzQRrIzdRWB4TCr6x7kSoWFxCFIWAntyBnGFlLg3ufjcJFs9dO5drdt0tCKp7BjnWZWnrGAVxIGva57tPlKF27q8bhbhpa9LqEVwqPqvc/ZVF5gxa41lHyRl8vUTc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SorX8pTxEenhs5Gm0Txc2P66P3yWgRvlduQ/4RRK4e4=;
 b=hIbWRBanstr9yHPJWQX1LH0EaMQaSywbfwnT4zhQO3pdszuZiZBikhi9uCM6q182/oL/q9eBtv/tnMVFXl8IkebWAETybEQnrqLQaZAmTMOZKsI8VdtMMcQjIvrZF3//mHxnkF59sX07FwbLY8+V469CBNGhKHRIjGqQbOkVyMFIqr3XBekwhmVqaFRmzBhii/JDa8zI0HoaKAWEhVbnodruJcT2nolsxuSA3YDjdwA3pTyBV0yA7I939Ijru57ZTJXgcXIi/bIAtMGswStxWDQ+X23CQjAu7srk7N6LlkzpPbgMXkiCpYO5efQJGSDfQM4jh8kbSqmaDCafcokLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SorX8pTxEenhs5Gm0Txc2P66P3yWgRvlduQ/4RRK4e4=;
 b=gs9WtOwZN+5tHluzaapyHpvjMWME1vYXTpxqey0M1dQdL2l3B582WccVoVCGzCYQs7bj5tBF5OJLwBtPpCLBUraPuI7YWdBQiumOiHvLmc70GSNFKSgc9yybWZrhcbQEy+WLLcLKhasV9p4chtWqG1H2ipZkQi7qJmpSdsak3Qz9WgTArQhR4ooxAbl+XQtUssj1a4/bJYtOkt2ren7KklG65UQH5ybqAyR21HkRLZkgzr6rI7FnQcaZ1TXCl/CB3WTmzZy/MpMq3vkgIPPpkwebYjHqf135+bJAjccMqJ0vSg5VCWbIaSOuo3B39DW/l6jq1fRscKeFpG3bazRj3g==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 19 Aug
 2026 18:20:19 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:20:19 +0000
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
Subject: Re: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs log
 buffer dumps
Thread-Topic: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs
 log buffer dumps
Thread-Index: AQHdL44sFLNDJvTpNEm1ZygwAzYtB7alr6oA
Date: Wed, 19 Aug 2026 18:20:19 +0000
Message-ID: <a1160e753e4514537e322c542930fd0652fcb526.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-10-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-10-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ0PR12MB6806:EE_
x-ms-office365-filtering-correlation-id: 52e8d7e3-142f-4944-3448-08defe1e86cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info:
 ARdRy6ivQCe2m+zuLhmEk8ZJEdpzwLwxNJOxtExKPm3FL5iL/exaEUBNI1+AnHsETLHn0OrcYzGMuYMAzfNsjziH3wsHgz8goUPZjfp9z1ix1liZ0az0mvMUePrVy6e4WRb5qoDSrEnxLlJuJvrOgaamK/VOPD78wJL5ahyRrT8RLCgH9G51iXyMeZKZWefuLSdkfYPAKGxNcHDv1c/aRx0evh1Hso4gSNdjLubajzqMNdsx816G3UOqP7lBSN2PLCQZKPFt403p7bh1Mh+0wOqn/FleB0F5Nr9LzeJiN6vmJ9xFBWlHii5VQ5y7BlvvW+qnfMjY2/hdjtaRTliyAgJYbIr/BseksIHI3Jl0Up0HauHjigzI0LCW6C6qPktOwvn0cGR4Z4fDq7IW614IiN/ckEQEKJi3C+l6LgmrL+/TPSnwG49Rdyz8h3L1pHdC4xoXRFZ2vxgwlPnO+jemv0NYI3Ecc8p1dh5kfZb1ouapVespVZ2OPw3XDSPngr1Yb7iUk+p8nk/IYNRYT8C/LsXacxYlZvg0jLovkxrmyPb4KF7rIBJAluf6pCKaNlr/Y1rgAvo8BJ3ZvA3C9h4+PVMJFtXIEIRh9t7tkadLgOwkQsbOdfywbvpTOA7yqThqiRy1FfHjN6tWZIlJperdBvIxzBNJfWtdS9Uenkjm+sr9uCk1cx2eixzaURfNUVWtGXHwDy1p67hIDbR306U6wg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RW9jV1pKa3F0K2JGQ1pzQTJITTZSa0p0SGJwbnJjaVFuNUowbDNwWmdtbHlD?=
 =?utf-8?B?ZFVZNmJ4TzZQL2ZuM2RYNGQvdzVFSExGdW1RVTdQL1EvREJmMHRxZGpTaDA4?=
 =?utf-8?B?bFNOS3N3L25iRzIyeWJvRmhZSlVGZ0hYVjQ0Rk1qSVpmdUZKckhFUzhKS2pk?=
 =?utf-8?B?RXR2TWE3Ylh2anlraTVDT2NGNXd0cG1wK3l5V0YzcGRJWnAzSzkwUkZEQW5u?=
 =?utf-8?B?bWkxNC9EZnhJTklCcTY4SlIxZERLUzBTVWg1UjdreEhiZzRyR0tOTXE2M3Qz?=
 =?utf-8?B?WXNhWDZ5MC9VaTU0M05TQThnK0RWK3M0QUdOUmFhbGRnSFBzN1BzMVIzcU50?=
 =?utf-8?B?ZUx0Mi9aakF4Tzkya2Z5VWxwTzdFYWN2Qm5tV3JjaHIxRks1VWlwNjBpcG9Z?=
 =?utf-8?B?STFLQXJxM3FiSnl3SXdVRHhuSW45ZVpidlJKV09vVWF4OG1ZT0o2S3M5TEUx?=
 =?utf-8?B?WEd0NEhaSzRvb3dGdVJQYnNHa2VIdzZyS2craEJMQXV0bmFJMjMrcW1YZ1NY?=
 =?utf-8?B?dmhPUU1NaWlDM1VRdmFma2pMTnFZRVZRSGFQU2RXY1dTZjFWdjFvUlZJMEhP?=
 =?utf-8?B?YlhFWXZGMmdoSkpSeGpSWDdlcytuYkY5dnRLbm9GNVBUNS9CTzlZdzNZQ0li?=
 =?utf-8?B?cmJid29HUUJBMlF2czk5cnV5MDVBQmNEbWdiQjdTTW9tR3hJQXplWDdsK2Z0?=
 =?utf-8?B?UGpPQmxmN3hpL1JpQ2cwMWplOXFORkU5RURTM1ZkbEVpTWFWRXZod21ZUThi?=
 =?utf-8?B?QWN3RURNWWwwbDRHSEJrUDBKLzczQmwwZnRMekcwTGp1TXBWVUhCbW5wVHI3?=
 =?utf-8?B?SzhZSlF5RnY3QmY1NFVFZ0oxSHBQbmlwYlhJRWpieU4wcHBCTU1hbWozTmo5?=
 =?utf-8?B?MXdhWFdRbHFlN3pDZkU3K09IODc0T2ZVQmZYbFFjRVdIN3RTeHpRTlRTd29K?=
 =?utf-8?B?dncwN2FITCs1WDdTM0JIcUFmMlVqNXY5Z3BOTHYyNERFRUkyNlBBaEpRS2pX?=
 =?utf-8?B?U1BDWklRMFExZmV0emhRejMvNTVxWnFka3dLNnloVXlEeUVob3lpOG43UGkr?=
 =?utf-8?B?b3d3WHM4K1ZGdWV4MmZ3b2RSdkszSHBqckY3VVJzYWd5VjQ3THBVWkdXZ2lv?=
 =?utf-8?B?bVIzMXFVMjJpZGR0VGozZkNkeFZHbnNLSHloSWRHelVTZ2xCQ1JyV3NXdGJK?=
 =?utf-8?B?MDFlSEh3ajllSlFwb0hhZDMxMDh1ZUNmWFlKVkV6V2FNSjgyVDFrUUQ1b25Q?=
 =?utf-8?B?S2dHejE5djk0MzkvZ0dNZXFpak1oa1dscVlRRldEUnVla2IzZVN2QkJhS3B5?=
 =?utf-8?B?SXdnYVA2TUhWOTIyRjVzN1NhcjJJWWhmU0lQbnA3YmdtQTQyY0J6aVhaU21p?=
 =?utf-8?B?amMrSk05cWRrTEZISWlsejNnVkwveFo4QXBTSHpXYzhJLzgwTGZ1Q3ZUM2Zt?=
 =?utf-8?B?c2NHSUZ2RVpZSkJyY2FMQ0FyRkxndmM2RC94elB3TURrSzZWUEQyZExobzhi?=
 =?utf-8?B?NmpUK2tkZXB0SkZvMW1DRUFxM3dMdzM3dGl6Mm1WMktsSG5oRHd0Q2IrMC9q?=
 =?utf-8?B?emJEOEhna2JvNVhjU2J0Y0k1NWdWNGc4VVEvZlhMSjJmeGVCUXQ0b1hpRkgx?=
 =?utf-8?B?R0tiaEl3cGN3aGRCTGlTRUZ0bm5Kdnp2SEdOcU1FNm1TdldSMXVrY1JUYVZJ?=
 =?utf-8?B?NThGWk9jK3FiRmtMOTJUWHNpVytrcTZqOXZ2aGtXalNBTWxsejArR241Sk5z?=
 =?utf-8?B?UUFKMThJM0o5RWd5T09BTWN0RWgrak1uaC8zZVJtTHlNS1h4S2EvWWltd2ZX?=
 =?utf-8?B?TWJlSldsL2NMM1NpU0ZJVHRZWGhLeXRwRklYRGtiZVV4cUh6elpLZzNtZkJi?=
 =?utf-8?B?RjhIazRoZnpiVm8zV1NyWnNNRkFOOWVGQWJzWHFKQ0VRL05VaXB1OHFxbVFS?=
 =?utf-8?B?MVhuVU5icnNSaWZGVEJERms4TGdTZzVIWHZ1SkxoQ2ZtZW5iSEMvZHZIN3Mr?=
 =?utf-8?B?VnhiVkNMTjBQcHNyeHJRQkxpVVpJaFhmWWsyK1c1SGI5eDZGRnlENFFrTUwz?=
 =?utf-8?B?cGhTZWNTLytCS0lxNzZpNmE1aU9LTzlIMkZnSmxJMFNyd2NEV1p6Ym1xUVNz?=
 =?utf-8?B?SFpGTGl5T1dQNkdEWGpUNW1YTE1wQk1Ga2ZZU3h6TjBiUDlJWHFFdlcyUVRm?=
 =?utf-8?B?L2Naa01mNTZ6U0NscXFlbTNLOEdTNzVqaTBlRXlXVzlNVmpiMzF6eGJpZnJv?=
 =?utf-8?B?M1krN2dwbk5NVkNpOUl0NEZ5Y0c4aGRWTmVqT0VtSGpOU1hqNVFOdDBWclVI?=
 =?utf-8?B?TGFWZmJWMWtZZlY2cktqOC9NT0FwbHdiVHlBenozeUw3bCtrZThTZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <864AD642CB23A844B8D4FEEE5189B66F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e8d7e3-142f-4944-3448-08defe1e86cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:20:19.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDUhsptrA4CU7ycqJ5jHCBqUPyNQ57CK/JUiLJHeuumEn+ViTwCez/q4fCCRGNiSNVznjV2btok89pMSPCkJdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQoN
Cg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlLnJzIGIvZHJp
dmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlLnJzDQo+IGluZGV4IGRmZDQxMzY0Y2M3Ny4uZTBi
ZWZlODRhYTNlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUu
cnMNCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlLnJzDQo+IEBAIC0zMSw2
ICszMSw0MCBAQA0KPiDCoHB1YihjcmF0ZSkgbW9kIHJpc2N2Ow0KPiDCoHB1YihjcmF0ZSkgbW9k
IHRsdjsNCj4gwqANCj4gKy8vLyBNYXhpbXVtIGxlbmd0aCBvZiBhIGJ1aWxkIElELCBtYXRjaGlu
ZyBPcGVuIFJNJ3MgYEJVSUxEX0lEX01BWF9MRU5HVEhgLg0KPiArY29uc3QgQlVJTERfSURfTUFY
X0xFTkdUSDogdXNpemUgPSAzMjsNCg0KVW0sIEkgcmVjZW50bHkgbWFkZSBhIGNoYW5nZSB0byB0
aGUgc2NyaXB0IHRoYXQgZXhwYW5kcyB0aGUgYnVpbGQgSUQgZnJvbSBhIDMyLWJ5dGUgaGV4wqAN
Cg0KWzNdIHRhZz0iQkxJRCIgbGVuZ3RoPTIwDQogIDAwMDAwMDAwICBiNSA5YiBiNSA2YyA3NiA3
ZSAxZSAzNCBlZiA4NiA0NSBjNiA3MyAzMSBmNiBhNiAgfC4uLmx2fi40Li5FLnMxLi58DQogIDAw
MDAwMDEwICA1YiA4YSA1YyAzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fFsuXD58DQoNCnRvIGEgNjQtYnl0ZSBzdHJpbmc6DQoNCls3XSB0YWc9IkJMSUQiIGxlbmd0aD00
MA0KICAwMDAwMDAwMCAgMzkgNjUgMzcgNjQgMzkgMzUgNjYgMzUgMzIgNjIgNjMgMzAgMzYgNjYg
MzcgNjMgIHw5ZTdkOTVmNTJiYzA2ZjdjfA0KICAwMDAwMDAxMCAgNjYgMzEgNjEgMzQgMzYgMzcg
MzcgMzUgNjEgNjQgMzQgMzUgMzAgNjMgNjMgNjMgIHxmMWE0Njc3NWFkNDUwY2NjfA0KICAwMDAw
MDAyMCAgNjUgNjYgNjYgMzQgMzUgMzUgNjUgMzQgICAgICAgICAgICAgICAgICAgICAgICAgIHxl
ZmY0NTVlNHwNCg0KSSdtIGFzc3VtaW5nIHlvdSB3YW50IG1lIHRvIGNoYW5nZSB0aGF0IGJhY2s/
ICBJIGRpZG4ndCByZWFsaXplIHRoZSBidWlsZCBJRCB3YXMgYWN0dWFsbHkgZ29pbmcNCnRvIGJl
IHVzZWQgYnkgdGhlIGRyaXZlci4NCg==
