Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137F3B0584
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769245; cv=fail; b=rZ6uFi9AruJ64Sju1/suS4YD6d7G1h+Ya4HJnOovsphturgpqH8BaOZnndOzHSsKSCWNlHtUYND5HIUoozlxadvI+KjGN3WOPdHHr/+EsdYlCucRo6UyMTBsdtXiI3RQt6uFk2WMPeRJbJdddEL/FkEBKVt4QHQ0HtCzLkZgX9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769245; c=relaxed/simple;
	bh=FSx24Aisi00eq2zsFn51pngrw5Hah5duTr2IMOsiTRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jcbUCUhsvq5WEjUMftKK/mA2swG2hlHDuKn9iDYJeVJlhCkFENDieXhPEpDCE75ucwwykLs3n5ybI1Dl4i6ZHpVPkblNWIp8+jNOGQo4DVaX05t7FFdBCnOcruRgmdbxBUqYUi/nvKgutSv5aJNJb6aBU5LAc/LI6fAPNsj3yjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PtRH7AlV; arc=fail smtp.client-ip=40.93.195.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PtRH7AlV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scsrEupL8OoVhVvSq5CdQgBJozIxTrsWKUi3O8/vKi2gL6LACxF7zd4I/+046wOjdKF+/z7GKLf4quY5mCoI3Rp4+A6srtJqW1PK6Qk3aQisRMvJl/hqDROiPVkvaIoSDSS0cce24IiXfo8fUd8hWTngp7hRGmI0OyfsidSTZUcbER+/o4KZKCPAupII6O3UB2ICWwEOq+umxPIlEtXmiGqlTrvKmchrcgsBcy/EpRRrrFbijdx5lyaFy/wdMLGW6SazdS8bj1phPPk2dge7M359faUfTStpUQCN/5vog9h+3ZjMjF8DG64TQ/BWn3fqDgOtNbwiDQuZRcUTVfXTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSx24Aisi00eq2zsFn51pngrw5Hah5duTr2IMOsiTRA=;
 b=rQt1Mm/jlqZp2Gijv4BsrDJV5eBO3q9S9KrRpFQ2iiGiyUb8l69M6A785hBsYcxaD9aD+AQKUa12kBFf3jY7ArXgUt4B00ML4xhVtIEdX4oCh+uVbuOrxnu51/Ah1TgOS2sL+2cdXWxvhS7lfXkpbvh8HjMFVb01feBqAIkTd51uirQk453DKMrv1aSlkF18ZjD6aBJ2kRa1XR+YwwKysnHUkEOpufoM69oliTvQfYRzWnzcErWk3+XT/KJ4Oky/hjLvtyK/93wT+Nr0+gbzuoiGQQrYavhf4WagEPDRmZPvQzhPBMdIKg3PWMhs+TnGoxmLM+i8fULDk5AtBd3kWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSx24Aisi00eq2zsFn51pngrw5Hah5duTr2IMOsiTRA=;
 b=PtRH7AlVaoLnXmXJ43ENq4YehuJ84eCWXvYT32HvjVo5U/coIAqrWI1dqsDd4aVHFmRj/DNmkuxHTwm3GTMDw7D+1o6LQRV7+QpOf4v8YyEezlZsJKc071FEzfjHHozlzNRpwdY82JXpGPdgd9EUPMPItkLVVFj2ygUbXOpd/CUhBAxYLGvmU7n2w7Acc9p9ja/FMH1paMr9l2TDOvRJCFg7WiB1rl8pbQTZrZm0L62CAX/XzcgR39shFlfHLu5lLBW7Yi4ithRGWa3+DDUtq32cVMrb3UZP3dSAclPfSFZrCfx49TFTZnl+2afGYGEd+zJystwqEuBBahWQ4CXuBg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:07:21 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:07:20 +0000
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
Subject: Re: [PATCH v3 14/33] gpu: nova-core: add the falcon DMA and suspend
 helpers for r000 boot
Thread-Topic: [PATCH v3 14/33] gpu: nova-core: add the falcon DMA and suspend
 helpers for r000 boot
Thread-Index: AQHdRwodrNLMg66L5UWWpAaHK7EHU7bU5hCA
Date: Fri, 18 Sep 2026 22:07:20 +0000
Message-ID: <e193be63f31c142580482323c9f6a75e0c73d0fe.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-15-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-15-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH7PR12MB6836:EE_
x-ms-office365-filtering-correlation-id: 5606b109-4d19-4a86-efee-08df15d1360a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|10067099003|56012099006|11063799006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 /W8yW1LtKa/NUJHDL1EGfpab7Huo5cBCqLnWDAnPAlhQKeKk9a7y2hQu2ECsIZgzMzvL1LCYLg5VCDVffqWTUZY6+j14OMNyr4zGT4mVTnlsU1qq2tMTA2iql14zJ7iBTnNF5NBQXrocOBHVclIsN2rNU8Yy7Jvu20noXiFiZ07h2GUqWs60dhzCNIVTsBwDfibFz17DkDBbk5gb4myN4DxY0o0ATldS7p3Zx12FHZc3GJCRtsf9YVdzuYrncgYw3HSxM1BlFFEJC2beTiEPDaO91HIVMPzTJKKivVK6QWGWIkQJnrJt1pCUQpknFY5Of3zDMZnfANP72WpnS3iGKVSD/kwPuc8KQybj34dQvHWlyL9BQSND5MSFYrfW82dpSzhbX9MKwqdCgnAejRBV1YmCFkTnma7Kg9szFuOB5ceCSQ6hz09y99SwcKay4a2bEXYKiLhXlnU6j3mYyOweHv1fQL5+viYA0LcXhXQgmKVhp/SRbX9TtgarIFU/aCJYWw6J+pL4xebjK3nHeMkgxbivAQiE4rcaaso8cMn9OkE9c09rxXHS4pVLzczGI2GJotF64jYD7IUk7dA7dV1fp/A+jtSufwerx8GVurwnd8u6rVxqgyAeNfpGKfOQQCz3HttJreRMLN3uHOR//+CJGFDZYJUkK74ZTOScDEgVZt/P4Dzmfw50rURWktTtXQC6p5/tTlEfo+BD6aOgKJxGLHt2qxlIK1TlVJmDpok8YjI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2QySEgramRpci9EK1BWSWl4ZFpxVEw3T2pybGVXQlZ6Rk9IQ2d0aXdHd2Nn?=
 =?utf-8?B?NkZmVk9ON3J4QzhEbGo1bDYyaUZjUWtNc0FCaTFUNHR3NXdjOVdYM1hRazBJ?=
 =?utf-8?B?ZWxlQ3dHNXZveEdOVUpRTGtuTHhTSCtVRWxkRGY1TnRQalZTalFyR3VXbVZZ?=
 =?utf-8?B?bUFldGk5TE40aGtsbFF4elNraHNQbDFkMHVsWlZKRlp6U2kyTExndFRuVlVJ?=
 =?utf-8?B?eVRBd0o2VjlwYnVFUUhCNmJRZFZTZUNSb0FEbWdNUzZNUVNmVnhzQ2djUVNC?=
 =?utf-8?B?RkV1di8ycS9FSkVtbzBnWFZNdysxTDVRTzNZdVAvdW5seG43cnBBYjBlRmN5?=
 =?utf-8?B?NzhJS0Z6UVhCR3U3dlFZNGk3L0k3QTRzanZpNFdqMS95TEZIRTlGUWVqSGJP?=
 =?utf-8?B?WEMwMkxERlhCS2p1OE9ONXE4TnBPWGhRNExzNE5Xa0xJaTV3dk5aYURmMEZP?=
 =?utf-8?B?bEdLemZDOFljZElUUytTakxlNzliVjZxVk0veDhWa3U3cU1ielFCVlR0Mi9Y?=
 =?utf-8?B?VUxyd0l5RTZnNVFOc2Z3N2M4TXRCVnFpaGhFcVYzTHFPWmFrU2FnWjIyalpJ?=
 =?utf-8?B?bVR0eGJlYkF1ZHVwQ3R6RG4xdHJGVElzc0M3N0hZYzBSSE5kNkRjQlVpK1V0?=
 =?utf-8?B?c3lRTHNXZjE4Ymc3RklKZVVUVHNkbkplWTV4blZzbVQ2TVNzRm53MUVPTXY3?=
 =?utf-8?B?eGRURm5iN1ZIbVVMOURoVmxXeWdDbTA4L1lIdGhwaTFXMkRXY3VDcnJYZ2w2?=
 =?utf-8?B?bWVpLy8zTjNoTzJ2RkhENnB1djRuWGU2MDVVdCtDdUpKSktqR2FSOTVFSTB2?=
 =?utf-8?B?LzFrSkNNMDdNNjIrVXArTE9BajI3VGZEZlpHRkxVQmJNSStNK2Myb3A0enc4?=
 =?utf-8?B?MHBPL1JQaU11NHludjFBOGlLN0NneW9hVmxYb2ZUOHlzZ0l6ak9lMURDZTQ0?=
 =?utf-8?B?K3ZPK1VCTTZ5MlpZOXNIaGRmZ1VGWjBRU2JlM0k2VCtvY1Z0STdyRU14Z012?=
 =?utf-8?B?OFJnUWdaNVUxbC9rZWxBUEhtK1RBY1pWMTJmbzA3VEE2QnY2bGJJR3VLSlZC?=
 =?utf-8?B?a29YSjErQTB0MXNkZmZUeDEzRlUzUzZPQ3NjdFdoTmhrL0orMHp5eTVCQi9M?=
 =?utf-8?B?SEh6bDd3b3doUEI2SmVjUmVGUkJQQmliSEZTeFErSnAyWDMza2daVDFzeEpw?=
 =?utf-8?B?bTVUS0NvNEdoNzBIM05SdlNKTHUwcnBlcll3RkR0aTRIQXJWaUIxWDVOY0lX?=
 =?utf-8?B?WkJkRW5mdGRFU0FTZG9KTmw5ZWRIWUpxR2N6STZXbUlSMDZIeHNBb0lWMitL?=
 =?utf-8?B?MU9NcFRlbFJFSDAwYndpL1JqQVlMQ2lKTlA5STlLY2dqREYzQ2xaMGtITXdm?=
 =?utf-8?B?eVczWXRhSVcrNVhRdE5LeFhUaVRkZHRRWEptU2xxOWlWRzBzQ1V5YXdWd0th?=
 =?utf-8?B?VVZwY1hDOGd4WU9aUXpQNjgwUkpTL0JFeFVjeDNsV0Vod2kvUG1Xc3M1ZFZM?=
 =?utf-8?B?T1hPeTZtR0JHTlRzYWVIbDg0N2RmZTF1NXkxclhiWXJCTHFQM1dkZmI4cWJz?=
 =?utf-8?B?bW95Wi9uVGkxZC9XdlVVRmgwUmgrZFdmUVI5VFZKWXE0Vmk1NWc4dzFyMFdj?=
 =?utf-8?B?L3pnMUFPWkhrRWhCVmx0V2p0TitxcFhmb1NKNTNxNklvZ3R3S0lrTW90S3BI?=
 =?utf-8?B?dzM1Y0hCK3ZzY0hSaEFwOU9Xajh3d0RJQmlTTWw2MHhQYTFTTXNyNExCM0I3?=
 =?utf-8?B?VXZHVFN0YzJSN0hLdnhydTdnbXFJQWxXaDcwbnFCOVBmRXJ5aWI1aXpZZlpB?=
 =?utf-8?B?ZHYxRFUvY05GNWhYOVBHd1ZXZjMzK0xpckNvQUFpNjk0SEMzY2JTMjdWNk9m?=
 =?utf-8?B?R293S1NUcS9Zc0ZndUI3NWg5ZjFlTi9mV2lwQXpHbjdiOVhRTnNqNHJCRndO?=
 =?utf-8?B?eFFsVk1DbnNaTjBDaWlwQjRsTktqNTVpN3dqMEJXc2RjeENBSnNsaEVqRHkx?=
 =?utf-8?B?M2NYTmpQQndIbkVxWUcwT1FXRkw2NVM5eEVUVm9mcDk4TUZIM2g1TmJxVHhv?=
 =?utf-8?B?SUdEZFZlcytnTGNUQnlvS0k5aHFMbEdnWDRRK1d5MUkxSlZGY0FNNkU1bDRq?=
 =?utf-8?B?b2puaFNxQ1JwZkhqcTdGMUQ2M3VaV2lqcU1NNzdMQ2xLbWhwQklIbEdlVkV1?=
 =?utf-8?B?dURWVGM2NmIxTW15dm5ObTU4ekxGQVJqdXJpL1F2VDlhcmlETEt3UU9BNFIw?=
 =?utf-8?B?Ky9pWi9BVXRkRCtvSUdTckx0U0N2THN5aFcwS2ZVVU5ibjZTYm5ocGswd1JR?=
 =?utf-8?B?SzVSN0o0bWU0RndTTWJvYjFwUDJSWlptd0hEZmJHTmhENVJUc2Uvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7666A7DFD297F47B18052610E14F880@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5606b109-4d19-4a86-efee-08df15d1360a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:07:20.7579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhtVIfisbafxb3zlgZDVUWF4GDydr0k9RZ3wKAyRWPnoeaSr8hvLE6Zbnlr2/aoHz2zCffjdD4jGFrUfUxVH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
Cgo+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiByYXdfZG1hX3RyYW5zZmVyKAo+ICvCoMKgwqDCoMKg
wqDCoCAmc2VsZiwKPiArwqDCoMKgwqDCoMKgwqAgY3R4X2RtYTogdTMyLAo+ICvCoMKgwqDCoMKg
wqDCoCBzcmNfYWRkcjogdTY0LAo+ICvCoMKgwqDCoMKgwqDCoCB0YXJnZXRfbWVtOiBGYWxjb25N
ZW0sCj4gK8KgwqDCoMKgwqDCoMKgIHNyYzogRmFsY29uRG1hU3JjT2Zmc2V0LAo+ICvCoMKgwqDC
oMKgwqDCoCBkc3Rfb2Zmc2V0OiB1MzIsCj4gK8KgwqDCoMKgwqDCoMKgIGxlbjogdTMyLAo+ICvC
oMKgwqAgKSAtPiBSZXN1bHQgewo+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBETUFfTEVOOiB1MzIg
PSBudW06OnVzaXplX2ludG9fdTMyOjo8eyBNRU1fQkxPQ0tfQUxJR05NRU5UIH0+KCk7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoCBpZiBzcmNfYWRkciAlIHU2NDo6ZnJvbShETUFfTEVOKSA+IDAgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIhKAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2VsZi5kZXYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
cmF3IERNQTogc291cmNlIGFkZHJlc3MgezojeH0gbm90IDI1NkItYWxpZ25lZFxuIiwKCllvdSB1
c2UgTUVNX0JMT0NLX0FMSUdOTUVOVCB0byBkZXRlcm1pbmUgdGhlIGFsaWdubWVudCwgYnV0IHlv
dSBoYXJkLWNvZGUgIjI1NiIgaW4gdGhlIGVycm9yCnN0cmluZy4K
