Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D48306B08
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204260; cv=fail; b=m6CUTKz+n40CXbjF8p7bfkJ00GXrQDDTLyCw1yLpvOpBI8jLDdHaSBoIEqiP5dY710/PJhcEnTU8bsGh2N7mWOygRid7wLoseTUkdYDy+Q/HhfCUx5Uq6r6Jm08PrvOyvSn6jqbycTp+W8wCzlfveBFvqOZ6tDjmz77ci08erW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204260; c=relaxed/simple;
	bh=xV0nRjrpdX/XjvsNtSvqIuup3hR7t2DGIanMxgRGzug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TskH4qYn19TLBAxjXePn3Y8PhW38Q/Af6XgLGtwlsDHan9C3Zei0oVcM8870eSUigJVyqnQcFfq0hfG31Kin29nxO+c94mWvINqX2+ShewI9aqr9n5vDMwwDiz3ZOKy1881bgwNu8/JRuHiu4c18Ba5it1Zr4SXyct9B62LpPUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pWeI1G+B; arc=fail smtp.client-ip=40.93.198.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWeI1G+B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVaEbOYPrSWn0r9si0NTHQaxkte4rtLk7MluIJHXH0m03l7CBO98u1LszSt1BwWGmrGMUYEgRSwGOi+LUT1e8dnHhA9vRJ41YpYabp/4tVPyWeJERgKYse1DRXagIwEWVnQpruYjZgZD6P81BuFJaG10NEieFj+Vtp9RwOuhFXW9UkicArDkUuoR7TxKo1OJM6D72NBaPpSgu9wVaeUVJrU3xWht3PzkWLMuhixtMklFyb6ly6ypYvrqn0iiJ+gG4IGCpHrQAX2HSel+kR0SCxez3uGaLTinJ8OG1G0u3YGi1MRPkLzVTXx7osJ3yIJq/9oo/WYejXEtkeBQmnIh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV0nRjrpdX/XjvsNtSvqIuup3hR7t2DGIanMxgRGzug=;
 b=J//CJdMQjRYi54miN4ESrswsJQW3qKdfoy/ZezXXq/kryQKSTlbE1BvKLWgWlyplzeLHyZF819b5fXpoSYh7qU8U2wbWuQ/vog21KWnKdDmA1DkPsnPCQizM+NYtI1PLSpiRdmsTZ0aInhTpyQTGoo08FN3UqladCyepvmDejvSBXHIYmBLTsVw2jSCXRdTxN8cGEPbONsI9znt1cpAfXhwAh8mTN8MHBbasPDlRJGNe+NN1rUlJyc4a/jeA/paI8pk0e9xNmVzgbInRDzuOwHA9nz3D6oXc6Sp5Qy8qIDXyf2oujq6EcGYDZgiP6rOsmWVkrBgEPnG8G0VzNL463A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV0nRjrpdX/XjvsNtSvqIuup3hR7t2DGIanMxgRGzug=;
 b=pWeI1G+Bd9y0Fw9Uz/CKNGCCN5h+520qiSRg8mOJnCZ8JBEZ5m57fnAGN66UkU11U69B+8dN75L9wEAXLgTptR3+D7Bm/jiUsY7fhKxDCKmCoAb49bGHMDmvCN0ucGJKZMSVPwqsb1ItjK8/bV3gLXnuVG+r0smIh1y37ECPt2Lxg5lT1ikKHGxTj7iLCeDkLY73arHgpal/kiQRf1Hhe8f8kz+mdl76ppll6VsT6fIbv2rN9I89QWFCwsSghg/QUExVxTfp1/d6tmmNtH9zfcm9Jh8OTSj/uDULF71fd6EQNquAdHLKrHd2VpnYbxw+6lyhO+2LejCPm8a0EwdLQA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 18:57:32 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 18:57:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Topic: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Index: AQHc+QGVpGov01rLA0+kZCzkLFfG+7Y4Vx4AgAE6LwCAACPnAIAAARiA
Date: Thu, 11 Jun 2026 18:57:31 +0000
Message-ID: <dc671b0b458085943e0da1d45c7b664696e340ec.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-3-ttabi@nvidia.com>
	 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
	 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
	 <DJ6G4KOFPORH.3UBTDZK1MFIC4@kernel.org>
In-Reply-To: <DJ6G4KOFPORH.3UBTDZK1MFIC4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA3PR12MB7808:EE_
x-ms-office365-filtering-correlation-id: def23261-156c-49d4-6172-08dec7eb4ae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 8e4xKBUT4/bsQbrMW/xTadUF/k3mO7jKhOScwceZqECVo+CCYlbmWJiYHsj4rbJ+iKNlKLBg3fHHPHR51l8c+jbeFaZ+19l5qTJ6eui5bTDCeRfy5dSJ29TwUW9Qf93h0rHmPWPhgZ/d1hVOL9O9LnC0OhG7yhbe0F5dpkuzOl8wvGmXHEUqAyF/L7YilWm9RxpZ0Rszjgr5hLXaQBmdR7lYPJpePu4jdHcteu1WW404Rmsft3FxkrYftSj0/JqcASZbU/HaooJ/e3mlUlM5zhrt4pHCZd+cqE00nNCffqIbbePt/uROeW4F6y24347dWZgS3JfR6ComAV0Ss6s+1zc9Tf4vXiTYrlHxY22VThUYnZdT5HVIsWUVFVPGeg//BLKjjKo74zvFCSvu5PF4/CJ9wD1vncEqLVLH6Rb5vU7cLaO5BIr+ydihU9G3yYglbI0eT++DpWtRGJRmZToRzVwnEQRdeoxAJP2WQPs6WQOiq9VavgjNmW2Oc6Il9lCwxUx873DxiKsXIRkMXCqXU4ubl4P/YxamUryYS+UvHpIM94e+G3TgInBFcDzkN7AFoXhHOS1jxViCULFU4Oc8dEkqgFIw5bJJofGONAdXC9JR3/cQwpoK7Cp53CQdava1Zrtia/o2nDy3YULac+p8T8SeHO37XxZfHAuK7HcDUN7S/H7OGRMk6U/6Fml/Ykfzg7kjzBtvMK9gxhDoH2kAX/ayNLdJfgOrCOmboKTVaqN7aQI13t0ijExkBXC6qVxO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b083Mkk2TEhvYXYzY0dBUHhnZ3FUZ1B0RFNlK3lmTXVaU1d5MUVLOHF2ekI1?=
 =?utf-8?B?WXpTQklKY2NEdG0ySSttRVIzWkRIbUpuWGs2ZzE2VHpRNVcyWU4xNjcxSEk2?=
 =?utf-8?B?TUpaYlRQazJ1cGZuQ3FqZWxjWDN5TDE0eVR5cHBuQXVpdVFWNmZBNnIvZjht?=
 =?utf-8?B?SFFGR1lJNk1uWEh0TVBCNm1qUTJVVmYrbHc4Zmx4SENkSnl0MmRDYXJGR3Ux?=
 =?utf-8?B?dldGSU5wWTh6eGI2YmM1VlZ0MnlybisyZWowUVFPWEpZKzQvVWVnQ2JTcHl5?=
 =?utf-8?B?eUJxZGdBOU94Q0ZNU1J4NTRNdHhQUVFKOUhtMUJ2cGdwNDRVaHpzTHRzMiti?=
 =?utf-8?B?RGdEOHV2WERDRnhacnJxNWlpakRwTmNlUHBrd01hb1loSmlvSmxSaUxldXFs?=
 =?utf-8?B?YnpmcWpFUU1OZkNZTEpGbkE0S1U5cU1wdTVUV2FuZ1hrK0ExVUQ5b0NPUUZt?=
 =?utf-8?B?bmtFV1laZFN1ejFURTFWeWVwdlQ2UlllaEl3bXJmSW03dWZSMGxjZDhLSEdn?=
 =?utf-8?B?ZTIvaVpMOFNSRWpUbVEyQzIzcHlIQ1hVNCs0NGhCWkN5RnNiOUwyTEhkM2xy?=
 =?utf-8?B?NkZETUR6RDVkR0ZFaE91RmYwckgwTE5OeWZjcWs4T1FHcGhOVkdKVmdhQWUx?=
 =?utf-8?B?eE1uby84Y2ZOQ003andGZ2krZGpiano2RHd5Sm1sbjVpYWxsRWd1Rnphdk03?=
 =?utf-8?B?eGV1UjgrSzdLaE9lNGRiVVZCMHhRaC9UMkJUVXRXSzhFTHpoMTlnbUVLSERo?=
 =?utf-8?B?Vm9PRzd5SkY4aXM4dFFwQit3REdKaDEvVEY2YmRFbmZyUm5ZOFh6bVZaU2NN?=
 =?utf-8?B?TTRuejd1WFJXRmh0aHdLeVI0dUNocktHSUdFQ0RraGpJZld3bTdDMXdkOWl0?=
 =?utf-8?B?RTZnY1ZmcG8rK0dtY1JFTkxYM3VRN2lWckhnU1lHQXRWTnlVWWpxaWdxTXJw?=
 =?utf-8?B?bzNCZzk0SmRXajNIVi9tQUMyMUdvYWU1VXliS05VSlFFcHhPQ0V3Q3VqaFBw?=
 =?utf-8?B?Mmcxd2dLa0VlUHJnU2VSU1kwVE9yMVR0aitqR2hmVEJwU3pwTTFwbHk1VTV5?=
 =?utf-8?B?TDV1RXlMNkxIK2lrRG45ZzQ5anlzblg3WWd5aWlDS0ZvVUU5OVhnZU56VmZu?=
 =?utf-8?B?dm5QMmQ2VlBPUXBtSlc4dGNRV3UvS25yNURZSUQzbzVXRlZ5VEpkOFFDK0pU?=
 =?utf-8?B?T0ZueW5RaWowLzEvOENFSVBlNkltVHE1dE1zME16TGJOeEpqN0dTcGhrQmlQ?=
 =?utf-8?B?Z05TcjdLMlZvL21UNHJpaTBnQ1Bhb0p3QmhvM1VPdHZnRWpCVmJnMlpDSmFY?=
 =?utf-8?B?MG1vdmkwTGhJanVCNCtPd0dYMUNXd0FOeDBYdGh1UlVzSGFpMmdzMW1YUVQ5?=
 =?utf-8?B?RXhSNGpjb2l6eS9LVWZBZHNyZXNkZzRlQkdOb2l2a2dhUkJ1NGRJeXRoOFlL?=
 =?utf-8?B?ZXl1ZkhDM0ZSZTMySGtpeWxQV3M2Y1V3RnJTcmxGOHNYMS80Uzl3bWhHdFVr?=
 =?utf-8?B?dFowaHhPU0d0RS9NYkNCeXNxZFgvbVo2UW5ieGwwTmxTdjBVZHNBV3ZadHVG?=
 =?utf-8?B?TXYrdzN4ZnVSbUEvVUo1UzdUdEloZEppaHR5VEEyUzBnVnZpdWRHRTBycmRH?=
 =?utf-8?B?MDJlSWM3cHBpcWpYWWNRZkNqajlhSGQzNWhXSEk4eldiVHBaeS9QZzkzRUNh?=
 =?utf-8?B?ZVd0ZzNXYzNWRTFFT012d0dPK0tNSE1hb1JhV05paUlyVEFTaVpIYzNISmk4?=
 =?utf-8?B?NkNQNFNEUUZqNUhsbGxyV2NoaTQwVWRDYnZ4NkJTRmQxcUEyd2FsVXdHZXRR?=
 =?utf-8?B?eEFmSHd1YnNWK094cDM5aEE0RU9vYmt1Z0RqSzE5b2tNa2ZkQ3NHN3lXN3Jq?=
 =?utf-8?B?UUJPYnFjb2d5WGhLVjRicmFhRFcza252Q25FVEhyNHozYnQ4MVpnR3liWllE?=
 =?utf-8?B?b0NrTjVaeVU2NGExTEdXL1RpSC9IMWhBTE52NUlFVkhxWWlEeW1Fd0d4NU1x?=
 =?utf-8?B?SHpJSmQ4L2NVS0lPZ2VxS0NabGo5Qi8wRG5HcmwwdXpuNEF0MlJ3YjB2Zm5C?=
 =?utf-8?B?K2NnczZmTTRleG91bXFkc0ZnOVJNWFczSkVodlBxbE1CK0RqV0xsQTJFcHZ5?=
 =?utf-8?B?ZmdpcmV4L09nbHUyZC9ydXJDWmJiVWI3QlVobzZSZXpTSzNBZ3RkUVhRb2dq?=
 =?utf-8?B?S0g4NHNSUUFNRFBQM0hzNVMwZmdTcFhoRnN3Qy9IaVVWQlJrLy9MUzEwb0Ru?=
 =?utf-8?B?UEg5ZE1QaUpSc3dEUmQwQXpmeUI0S2pCRy9KanZOWllGM2pabW9uSGlvU292?=
 =?utf-8?B?L0wyQXBrYmh6cHR3TkgzcDQ3ZzlQR3l0MkkyUTB6MnBycDRERHRGNVVJWmNE?=
 =?utf-8?Q?faO91ngbYp59ITqTPVjlO0usstsSXeJft5dtkG/77QeJ9?=
x-ms-exchange-antispam-messagedata-1: 85A2kJYLx48ujA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4F4212DE83C44498E49EED032498CD3@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: def23261-156c-49d4-6172-08dec7eb4ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:57:32.0394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P96KBBE9rZNHkR0nvcCnFuSw+zzApdRux9RrdTz4s7dIJdiFupNXbYepAWNct/idFBi02dWFIuSIkgfrOyD3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808

T24gVGh1LCAyMDI2LTA2LTExIGF0IDIwOjUzICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiANCg0KPiA+IFRlY2huaWNhbGx5LCB5ZXMuwqAgQXMgYSBjb252ZW5pZW5jZSwgSSByZW1v
dmVkIGl0IGhlcmUgc28gdGhhdCBJIHdvdWxkbid0IGhhdmUgdG8gd29ycnkNCj4gPiBhYm91dCBp
dA0KPiA+IGluIGEgbGF0ZXIgcGF0Y2guwqAgSSBmaW5kIHRoYXQgdGhlIHBhdGNoZXMgdGhlbXNl
bHZlcyBhcmUgY2xlYW5lciB0aGF0IHdheS7CoCBJIGRvbid0IHdhbnQgdG8NCj4gPiBoYXZlIGEg
cGF0Y2ggd2hlcmUgdGhlIG9ubHkgY2hhbmdlIHRvIGZpcm13YXJlLnJzIGlzIGFkZGluZyBvciBy
ZW1vdmluZyB0aGUgYHVudXNlZGANCj4gPiBzdGF0ZW1lbnQuDQo+IA0KPiBZb3UgcmVtb3ZlIEZJ
Uk1XQVJFX1ZFUlNJT04gaW4gcGF0Y2ggOCB0b2dldGhlciB3aXRoIGl0cyAobGFzdCkgdXNlciwg
c28gYWRkaW5nDQo+ICNbYWxsb3codW51c2VkKV0gaGVyZSBpbiB1bm5lY2Vzc2FyeS4gQW0gSSBt
aXNzaW5nIGFueXRoaW5nPw0KDQpBaCwgeW91J3JlIHJpZ2h0LiAgQXQgc29tZSBwb2ludCBkdXJp
bmcgZGV2ZWxvcG1lbnQsIEkgaGFkIHNvbWUgb3RoZXIgcGF0Y2ggYmUgdGhlIGxhc3QgdXNlci4N
Cg0KVGhhbmtzIGZvciBjYXRjaGluZyB0aGF0LiAgSSB3aWxsIHJlbW92ZSB0aGUgYWxsb3codW51
c2VkKSBmcm9tIEZJUk1XQVJFX1ZFUlNJT04uDQo=
