Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F039FCCC
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107890; cv=fail; b=N1WKwqRgXYyqs+NOPAZMCA7S8qGsg0lbE48VY/cUVBUTwHq6N60HOGE5pGo7DcfdNTyXeJDVt6aoosIgeCKCQXuvIpNWs1Szyg+QG8zOuzuy5YcHzIiVZrk/TZ2Q3evIeeMnuiAqR5yiSbpg9E4J04+95rADFQLTuNMrVaiYrdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107890; c=relaxed/simple;
	bh=28avvVWVT46tkWub0KBhLxn1W5j8mTn9s6qI5wlu//A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UhjzNlCk/bQABpAlIGkaO3WhNW10e+f6X6Wors31oiB/LGl51U4R7DQuS9FLlKy9Uzc6pGwpknm7KHZEZBIteMKfit3BSvNP5eEORhZQzia6ziTm+QgcGxRroHiSD/B+mRsXFThtAh82LwCgsdjfB2/6YMkSyb5TfUUJupHJ218=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TcWVZb8p; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TcWVZb8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMl1w2yU022JscoJHKuRvnKJ3NM6FFCVCS6rRbY34l//97z88jLdmrB+fE9RnsR4HwEI63sp4DRxuWDDb+k6JN0DFK5f37sLCmjb8GlAMXV4KEAE/nc3wYZoZZsP9hJkGbBmRrdFBd4Iu5qZmuLGWctzFpnbOTDyivoLi+Iqfg4BHpyfvGH52nnRk4KMY/2NI+Kz7Cp0SQ0KdsRlbTOHN6uaO3qfWKOcB8Lp1h8LiFKaerg1BP9XN3BeYcQeHahrsVA2SjSz7UCnsehC8fisXwdsM8x27cWvvzSMrWtnB5WhpPbqA5XMXsNTaouFNBRhC8cACgG+d+I1ntdXQlFzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28avvVWVT46tkWub0KBhLxn1W5j8mTn9s6qI5wlu//A=;
 b=tD+sq1FoS+5jSHStGCgPbWd+MaWCQ8wUy9m3S9iikyF2oZVl1+7J9AGWfQbpKIxYsMflX6SIYln5oGfvOVKjPvc9ZHLY/Al8vIvZGlSb+QhRxMbHnx3SagwFE4tPh9w7Q/FD9uMHkYej/zu15BQNE7F+qI2/6pzQTuvbGY2J2548g7BBY71tjROrKmm5PQLDzHTy16BRA3VyltETE9xc6HrlwcDxgZzkug0NWqTUzEFA9K5f2A7svapXJaUcAdhTqvnQzlRFzT6nRf1POy0estS2KYHUf02NVAn/XfFexoQxh+gG1GT0IXWwXRsLR/JFzgwmus+dmLp/P/UDloTCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28avvVWVT46tkWub0KBhLxn1W5j8mTn9s6qI5wlu//A=;
 b=TcWVZb8pc0cDrAiL2F4jzI3tn9BKFvKqFE4IEHG3yI+erCX3j0QmCxMsNPN6b0JlMzajYS/1FpPNTSQ5lRMd8ndXeQp5idyI1OrjV1AENu0DIy742YOdh8ygzrlDbMlKNvj5sutl++7GvZqeQl9fwGjPWdOLp0uKiTTTO+x4rXmq4qhkgQX+8zoA/KWq6JZcVtT9ru2lMHgmN5TK7aaOuIMj3BllDHP1LdYFbKnfJ8U9TpSHvOB0nctInefbPN6AxBu3YMmbZyF3bHhlA/3FFWBxsL9VSCCzW7kUHdQ8OpgkU8c2aTWswCk/+Y0/QfXRza9zRwbOSgFTM4yhGCFRTw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 20:11:12 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Tue, 22 Sep 2026
 20:11:12 +0000
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
Subject: Re: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on receive
Thread-Topic: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on
 receive
Thread-Index: AQHdRwobkPO5UiwseUug+kMOJXPLqrbU5H4AgAUHuwCAASKzgA==
Date: Tue, 22 Sep 2026 20:11:12 +0000
Message-ID: <5c9ead14a4673faa2f87d9676e2fd43488a32839.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-13-jhubbard@nvidia.com>
	 <83e33dab67a0f571c269262ef052e68eab9dadf9.camel@nvidia.com>
	 <8e026a4d-6e8b-4412-9621-4f4e0c441521@nvidia.com>
In-Reply-To: <8e026a4d-6e8b-4412-9621-4f4e0c441521@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SA1PR12MB7224:EE_
x-ms-office365-filtering-correlation-id: 781965d2-c9c0-475d-bc3d-08df18e5a626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 yZdeWhh/6Gj2TMJ/8NqmMlUo5fAacxPWcpEzxHeX6EC8Xou+p+EO/Os5LhoE3zjT2GPzceFv4QKjgTLvoEKqc8tiuzdK8WpClwwNSbNafbZpZdG6asErMfn99PQcLnLNptW2yOskzvKwKALDsMXe/+Xlgz2j3dl8bxxHms+qnJOuVTxtXjdQBxIRDeq/nlssFgV/f4mpSj+3RpVM+jnBiR+rsRf2P1s3zz3oR8zhmOVavdVuikD9i2Byko8c1ucIxR/NB5vjDbaznQ8/DDvJhWlbuvQnZSajFlQfA6PxZDoqHVuLbfqREBLeIy1waU31OKuUDYeOkE//F7qDkX2Y0lu6St9W6UIOQ4SLc8aN9JOnhFNsYa6gN7i3YLgufbf6B+92tuDqh+saKprrp1X9sdwLY+3nXE8GNLiUquQpbKFqJPwVR1u6XKeQCgng/CRqUwsVO51M2QLAxLwvTwbW2S3FZgYgH+4n56amZi2Z3bZUgZxGi7zh6z4i/HqjgvM3z1IHZGBNOcA5PRs+6S5Zb0+fj2Yy7rfOuKfwskKFNaELLdQF76d1QAkJ+0nVezY8Po7G/wZJqCO4LwWpGUuxOtHqp+iREHxuaJGIwXuGaQusxmSsRbAiWJZ3KGBI6BQwBlMf4COMtXX81SZVrgDvqfCiN8uHmgJ3ReQT6KkHChaPM7Pja4HhzqzYJHwMaFNTnp1UBXyRvjG5s0m/IrjmIbtXxmqFOAWVzrtrRc2IyDw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzFTallMZGduQzZiRExmTTJlUWZIOElRWWZvTjdQTW9XeEltVldKVlVXVnRZ?=
 =?utf-8?B?WEMxdmZhSWVhajZkQlY2ZXA0VGZxZmx2UUJ2dkpmaXVIWE9lcS9menhCZGlD?=
 =?utf-8?B?RG9nMkFCMjZDRVFiS0hQTUlmeVRZeVllQmRXa1JGSTJlY0JaWEQyMFZhdmVH?=
 =?utf-8?B?a0RRM0dpN0N4bEh6MElxNkovb3Zsazc4SlRoRHl1dTAyK3hLWW9jaGZORlp0?=
 =?utf-8?B?S2c3UU5mTDRLanBGRmhqVHVzdHFJRWd1cWY0TjdYcHE0R2xobXhzc2Z2S2RZ?=
 =?utf-8?B?RXIwcGc1V0FQNGJXK2NUQXJPdjB6RDZSQk96SnBVWjNxSTJsdDY4OWhPZGVJ?=
 =?utf-8?B?cXV2Rll5RjFoeWVFeHNZalZoUmJVMW5hbUNSZ3dwVGRDejUzV1FweW93TWZv?=
 =?utf-8?B?RithL2krNXlmQ0JoTUhRc1o5Rk1EQ3RGdXpiQjdLN1dvNUEwUExkMlFERXFn?=
 =?utf-8?B?ZzNMUXRYV3lEVlFiMXNYVXFXUHJ3Nk1CTWRqTHl1MU81SGd6K3BNc2NlRnBJ?=
 =?utf-8?B?UHBoYTRIQm5NV05oeXRXMmJGaFozdXVhaUlOYStxbWVjVVhML2NqanBHcXFJ?=
 =?utf-8?B?aW9IelJRYS9HekZDZGdQMS9jSnRFMHdVM0c1eExSRVV6aFJPaHBmTmc3TFFZ?=
 =?utf-8?B?emd3WktkaDl6YjBsbDFWV0FOVHhjT0hKampTbzM1MnRuQUNGUzl6NXVuNmhI?=
 =?utf-8?B?MDhRTFIyMUUrMVlKWGMwajRLaDJGYnVGNTlQWHRnTUxmbjkxajFLN2V4RHlS?=
 =?utf-8?B?eWluTGpwWUF1TFhaVmVHSUVXTVY1cnFWT2hUVDBweUV1dGxVNFc4NmhtaWty?=
 =?utf-8?B?dmsrYkRMMDY5RXZXampvekxld3RrVU94NzJpaTRJbWxNYzVLVDBPL3JJVkFt?=
 =?utf-8?B?bm9XNnBzUWtBV040RjBiSTk0aWNwTVRMd0wvUk9FYzdEVWxYeFNId3BpVFpS?=
 =?utf-8?B?N2JFb2RWVGtmaGg1Q1BsU2U1dzNaRDRWeU1OUjd5MUlhNUpldkhUWDJWSmd5?=
 =?utf-8?B?N3NNVVIwS0JtcXcyWlpvb2hTWmFsOXhoTUtUNGc5aGo3dFExWDJkdERFTklV?=
 =?utf-8?B?a3BaVzJNVFJZbVVXanovK0ppdXhHbEhObEFMWDFSSDB2Z2Qvc1ZXSFNrKzdw?=
 =?utf-8?B?bCs5Tis1TEY5b1hEMGw2S0p1NHdUVXJCZlQ5TnF3UjdQOEM3ZHJSTG5HN2gz?=
 =?utf-8?B?RzJ0WHlzSmQyZUtwTDFFQ2daRVltZHZXT3I0TG5KWjljWjZkbVlZSzh2YXFN?=
 =?utf-8?B?UDlaR2tXS3JHNTF2OFZDUWpXTTlDaHlFZ1Bub2puY2IvRkF4R2Nkb2dzamYy?=
 =?utf-8?B?VW1veStkQy9WWTVEQ0xRNmhzekhQSlN2eUczR0Q1Q0tZeHZTeU1wZi9PVEQ2?=
 =?utf-8?B?SlI1RndxbGVZemZzYkNCWUVjdWZDa3RDNEFScHYvcU4yTlNNQnVpT2ZScnVJ?=
 =?utf-8?B?MERSY0VWOTY3V0h5T3BEdGVNY3VYZFc3MllnYjgxZkRieThFRTVrN3ZjVmx6?=
 =?utf-8?B?ZzZ5TVJCaVJ3dkhZUXhGbEJTMlpTUUhMZGtmTUQzY1RrbXVCcWRSdmhnMEo2?=
 =?utf-8?B?Zm1ORy9Md3BVUGVISGNPQ2RpaSsvMlRBV0Y1empWZ0lKUHExQTA4ZHZQcTVI?=
 =?utf-8?B?L2dGTzR5T05LbVdXNFFyM3k3UTczT1FES2Y3VVd0OGhhL1F1VkFtY1lYN0Fk?=
 =?utf-8?B?UjVoK3UxY0MrS25uZUpVWnB3empDQWVuanh0VVlZWldvbzVNWmp3d0RJTG11?=
 =?utf-8?B?c201RWdYc1dUUFV2VEhYbFFsZUw1VHBtVi92Q0Q1V1BrVHpQazlkU3NvNGZn?=
 =?utf-8?B?a3VrdkhMK3VkOCsrOEp1Q29CZG9FQjhlU1hpa3pTcFBkeERBYkEvWEFFeFFl?=
 =?utf-8?B?VWFXRkFiM0lCN2k5SzQvdmMvZGhVbE50Y1pPWkZxMHFjR3VRd3BZbEtLQlg3?=
 =?utf-8?B?NmFEK05NZ1NFb2xKbndpMEZXR1JjUDZlRldNaStZd29qVlNuaVJyL2orbDM1?=
 =?utf-8?B?cTNhMzVVL0JMbXlpNU9Ta04rNzVGSzdHZFdwT1JRaDMyRUxsNDdUMjFpZGE1?=
 =?utf-8?B?d004L2h6WWVmVkk0bW45dU9DalN0b2Q5Ykx2dnh4dTd4czdISk1WK2k2NnB1?=
 =?utf-8?B?MnB1OWVMMUtsVlVKSkFvNUNyV1pKVTlwVmMvZ3FkRENudllZUzkrc2NybWM1?=
 =?utf-8?B?aTIzYTJ5THhvWlJ3bTE2VW5FWkxJNHgwMjRyYjZVa2hGTnd2c3Z0M0V3ckkx?=
 =?utf-8?B?OGpxQmp4Ym5jUUZRVTVEdmZPSldTNUo3S1F3MTlwbUhWeG1Bdk96ZlpiZlF2?=
 =?utf-8?B?ZnBxL051aDFNblh6aC9RalNCTUlKRWdmUzl4c2YyQ2gwWkV5Vk9qZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68AE511402F8354B9FC9E65FFE6AFEC2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 781965d2-c9c0-475d-bc3d-08df18e5a626
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 20:11:12.3717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZayj4B6WKk0G4x/7ep+gJZSXlQ73LTu+EsyZxrHxga3vSEje3LEgLKk4GlpNHrSyFRrHJXmBA+e8CO5BIFADA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224

T24gTW9uLCAyMDI2LTA5LTIxIGF0IDE5OjUwIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
SG93IGFib3V0IHRoaXM6Cj4gCj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVycihzZWxmLnBvaXNv
bihmbXQhKAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkdNQyBlbGVtZW50IHNlcSMge30gaGFz
IHBheWxvYWQgc2l6ZSB7fSBpbiBpdHMgR01DIEFQSSBoZWFkZXIgYnV0IHt9IGluIFwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXRzIHF1ZXVlIGVsZW1lbnQgaGVhZGVyIiwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhlYWRlci5nbWMuc2VxdWVuY2UsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBoZWFkZXIuZ21jLnNpemUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXls
b2FkX2xlbmd0aAo+IMKgwqDCoMKgwqDCoMKgICkpKTsKPiAKPiBJdCBuYW1lcyB0aGUgZWxlbWVu
dCwgc3RhdGVzIHRoZSBmYXVsdCBhcyBvbmUgc2VudGVuY2UsIGFuZCBwdXRzIGVhY2ggbnVtYmVy
Cj4gbmV4dCB0byB0aGUgaGVhZGVyIHRoYXQgaXQgY2FtZSBmcm9tLiAKPiAKPiBTYW1wbGUgb3V0
cHV0OiAKPiAKPiDCoCBHU1AgcmVjZWl2ZTogcXVldWUgcG9pc29uZWQ6IEdNQyBlbGVtZW50IHNl
cSMgNyBoYXMgcGF5bG9hZCBzaXplIDk2IGluIGl0cyBHTUMgQVBJIGhlYWRlciBidXQgODAgaW4g
aXRzIHF1ZXVlIGVsZW1lbnQgaGVhZGVyCgpTdXJlLCB0aGF0J3MgZmluZS4gIE15IG9ubHkgY29u
Y2VybiB3YXMgdGhhdCB0aGUgb3JpZ2luYWwgdGV4dCBkaWQgbm90IG1ha2UgaXQgY2xlYXIgdGhh
dCB0aGUKdHdvIG51bWJlcnMgYXJlIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lLgo=
