Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0438164A9D
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 00:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445054; cv=fail; b=X4EonSuclN+Am6Uz2t/qxpVQbOhC3frLOnvsiYPyiZYMhpY8j4nxJYnN573oeGpw6wAQ7EaW1FsNhZ+frEvXyFkWxbSrzM9jX2hQrZR0zWIxAMDEiL/W2gadxjkQhMjBVWaCrSDLxKNIAv3DD6MXskbqU9bBO5/JBokf6gppqwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445054; c=relaxed/simple;
	bh=pVUZBJO/6Ric0MSs1FKuaSFBhr/N0+Brr/IoiTS6TLk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KQxbAAfmcjfvPeSnxPKi4EyFUr6g3fZXE9rSWxBBl1r1kH3uBuArtsbb1iKX9o2WUcRjr/QbMorG63JRRu9aIL9bjNMF+XgW4e+QVJqnIfF1Amqo61uEkdiyMKBQud3Ca0C2hG4CSXfN3Da+4epBUH6HsL+a8cRdeEwZ7S/nIIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZnqTPsQj; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZnqTPsQj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXHmLQg+HjlViidGBt4J7Gcy+dDRB4gPfxQbq7R0CWbAwnI+tE4TPaItbdd6V/4PkGS9VVrNMA8dwT/2yvhVXLs4Xzg5bFQA/KMBRml1CCuJFTI6z14ogI6mA/K30otuzDecR5Ky6kGfuAfDelT357BjrWRR+fPbPJS9bHBiLkUKExF5MW5G/d6ybEAZlHWvhyHTSvVQtLhKEqqkfjfeYc2/udii4lNBxDURVcrZL184EzIXv7CxTt0j+JbEHkGqGHHsKCpmH2qiM0tbeeaDW0ZesHRlo4KBCFIZuzKKsBlyj+IMAOrAW5t+IUxIZV7P9QM0fijpfX/syDNOrxFiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVUZBJO/6Ric0MSs1FKuaSFBhr/N0+Brr/IoiTS6TLk=;
 b=O+PwKlFVr70pbdZEZuhBavPG3EMbncVwtptEmRxpDK1NTOl6Bwkr8y7gp650UuoLKKbalbJr/Yphn31jZiK2XqnweA5XDdnWw3ySer1koW0ksLmegG1FSVgwgemBH2LFTbU0IpwR2KVJ/HMi5czxVAshmUcN5kAUvqKRZ3sK/b9mrCWbP5CdtQxQdyhJH41xlv1YPEw/KGLkgWcDAsjcNPRMVNFV5Sxwnc9Pg5U1JU4qRYNLO4cAFkVAjLqtk6NIJwACOl+lfST4PZgRJISYxbtwuSWlOfYfM1uPqTps6uGRcOIl+58Ka1qaEGBqD9O8tbP43mYwoLtS1sT9BVCeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVUZBJO/6Ric0MSs1FKuaSFBhr/N0+Brr/IoiTS6TLk=;
 b=ZnqTPsQj9ZXSTe8e9vvHPHCs+/sOjF7FiV1ChQvzh8rIBdIQ16Mkid821Azm9xRIyfBH6mVOcoJ1sJYKUQO+je2LLtvW3UBBqv/SqjR9XvI+GA8C8f7//uSEIiJcwJyo6mLEx6O44W3cDV++He4FGcKIwynWUeMmLuQT52vk/wUkWM9vBe5fG8IhrSPBIlQYGOKsC0+L0ItAvqwB5TrBTmOH3mK2T8JBibjmYLAjnxcX1VywE+y6cReg3qBs5cYEW61oP9gATTret81T8wS2hd34FjFJPpVMBJUjs9yt7g6Tlhz8c6PzCFE95pBcNOqKyfZWQLoyjIO49Vxh0X2TZg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 00:04:07 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 00:04:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Shashank Sharma <shashanks@nvidia.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Topic: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Index: AQHc8j7paPPAidjKsU+T3R9++h6+EbYr9H4A
Date: Wed, 3 Jun 2026 00:04:06 +0000
Message-ID: <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
	 <20260602032111.224790-14-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-14-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CH2PR12MB9520:EE_
x-ms-office365-filtering-correlation-id: 56407234-efe5-48d2-6e3a-08dec103a162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 kpI9vgKgdyH00ejz5RtlQQF8KfjI8ZkKeQrUY6T4BUjuD9jH5YNmlPaHbO23JTxg7WajezyZaV8g/lEg/5UofrGg3m8GzyD+3dmI2C6MHMLiWLaNOubtaaD9Ao6ubHg8ldH+MRrp0IcGWVfG4pve69SKhRUgoR7TSJAS8o5PXEMGsleO/y7mSpz2zYKW6d/5YJV+ZkvuCGUMRnSNwQfbJWpqBEHfGDLviEu920uN9gFhPLsdK1/q0MGJCT5LOccfueinViTycE7+wemQecGwx3HYhYCt86TpfawDI8QdGKDKWMbFPIpxUN26ybcimtji43rmd3ag2WgLL4T5wUyW+Z5VUnWdkSgXKCFwbixPa6mfBRcPyAJ0HtfPjSFaVqfaVk6DTDeUYwS89zqgQnFJ4f3LF57e2VDkyDJOAao+aRTNIxF7CTLOAS/f2Minw987zm2U3ekxsFB5oHB+cxMmDOMUjdHehcn1wNHF5D6z6R6Z5LuFI2hT6kulr8VVs49Ngx2HMr5CYBNzqcKUQ/zlucg013FFu3q8KMDpJH9rWXmuiEMuBk3kWLHh/Pvds4c7JcjoT/mKPsTqO6n/L1D8qFZsLNsX+0aXru6lel/H2fLeCMXReVj3IIe6uJdmcBWy8wFlQCFZxcr+dzqjyMOF6xSUb1jFwUYmBk0yHJGmTeekXetKh2LKC+al/gDbm2ejmOR2PZkZjRekDrcBR21RUlVrJ3RbReOPNdz6y98D2u9Iu6kM6evEa4bS8p34f6Mm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elJRcjlTbmhEd3FYYWoxZGhSamVlanZrVkd3YzN3ZDlaU2Q2T1NtS2dOeEJ4?=
 =?utf-8?B?d1dOaE1KZjVxZWpuSE9lcnVUT0VyeXdGVmRMaXE0RU41a08xcFpLK2xEOVVr?=
 =?utf-8?B?Nkx0MGFwemdUaytvREh5SCtQTm53dWcxSFJ4RTBzSE1LQ0lpaU92c0EyNk9p?=
 =?utf-8?B?cEhBTTYrNFkxTFd1R1g0akRpa2lVbk5FdUdwVVdMUzRNWDlOenJqMW10clZN?=
 =?utf-8?B?RmRzOVVxc0p3WWE2dTRRNUtnQXMyNGZmTEphaS94MkpvWUV0cHR1N0p3WHB5?=
 =?utf-8?B?MmljMDVldUZHUXBnd0tLajVMOEhDRjg4eDdFbzFVMHllTWN5R1VBMjBBcWg0?=
 =?utf-8?B?YmRQRkhBQnpkblVMMkVjcmlKRnc4bXZFQjdhcHk5RkdtTk0yeFZUeHNKKyt3?=
 =?utf-8?B?bGw1ZnJkODJMWmlNa1NRTGt5ZWh0SVJnMnBJOW12Q1RXVnUzcGZRMTFxVGk2?=
 =?utf-8?B?Znh4MlpPMUVxc3JTK0h4ckp3c3NhSHgwR2JWbjNDQ1lZRFRTUmJaWEtyZjJp?=
 =?utf-8?B?dE5Ta3NhZ2dhWkl0cS8yMzRlZHBBbUNaYjljemNFQmwxTi9DUU1GZDc0TlAz?=
 =?utf-8?B?c1lJMUdzUmNNZ09GT0dXSTB4VmJ3ZllTU2w1dm5GQkFZR2RuQ0RhZEZFdE0r?=
 =?utf-8?B?SHA2L3VHQmFla1dWOXlIK1RaM1hmY2tSQ3BUdEtxV1NzQXY0VUh5V1VvL0NW?=
 =?utf-8?B?MWd6TzlCSzIzVEQ5Zmt0SXczM0pKSHFXZTI4MGtPRnRPTnE0TTl2cHNUbEts?=
 =?utf-8?B?VGN6Z2ZjNmFRVjhyZVhSdk5YckpNMGxZZkNsMFZobDh5QjZzc0V0cFhuc0U5?=
 =?utf-8?B?cVMvUk1EVEZXaUJCWkVKYXF4Q00waEZZdmdZcEtBZ3RLQUZJT1RUSk9TdlFD?=
 =?utf-8?B?ZTh4eUhlYUhjK3E5amVsZHpkSUd4YkM3ZXFhQzcvcjBBcG9yZXBEdlBnVmJL?=
 =?utf-8?B?dnd0L2FCV29odnhIblkvK1ExL2pHeDV2VzI3MUpRVWZtRUFLVWdiaG11TEZB?=
 =?utf-8?B?OFJlVXIwZHpoWG85WEtEQ243WWh0bjN5OGZaeUlTRnV5a25uZVcvem0yd0hS?=
 =?utf-8?B?a2VaU1ZhZFNmY2w3Qm5tOE9id1lScHBRZ3hGVnRuM2owWGdyNEFTN2t4Yjdo?=
 =?utf-8?B?bEVka2lPN09wbzYvUUlqRkFuSUpvaUw5blEzdTlqZzVRbUxCWmFFR2JoazZL?=
 =?utf-8?B?WFI4Ri96ekFBTGJPR2xIVmlqRDlZSUVzb0w5S0pDSWhzYkJydEFadXRRQWNS?=
 =?utf-8?B?RkdFMHpZRzdMSzI2WlE0R0ZmK2J6N1d2VjF5eGZCMk1XYkZiaGkvUU5hNjZQ?=
 =?utf-8?B?RFFvR1MzRjVVNWV2cm5kbXB4RytTVGhxNURqdVAzUmZ6b1J5Z3FncW9qK1Ft?=
 =?utf-8?B?RkgzdnBJYjN6Y3MwZytrZm04bnZtR3g1RHBDOWhFTmljQ1Nqc2hQMUs4bWpM?=
 =?utf-8?B?ZGdLTHIrc25LTUhYZkJRZ1BzRkFOYnRKNzZNRXlvSkdoL3RZYStDL29MZlFu?=
 =?utf-8?B?dzlXTTZGeXNDaURjOFYrZjF0R1FRMVljcllyNHlGMGx1NDl5ZzRDd3M3NVlD?=
 =?utf-8?B?elR2SzVtMThITTMxQVM4ZzMrSG9jaWZ0QU9JaE1zY1Ezb3hZRTJidWliYlR6?=
 =?utf-8?B?aGx1TDRKbjFYcVhEaEEzcGhDU201UDVVN01IQUN5MElZMlhNYnZ6RUo4ZDh1?=
 =?utf-8?B?TXJtZ0JNODNNaU5idEUrem1vaVQ3NWR4UkNmZTdTUUc1QkpMNFdUUThCTStk?=
 =?utf-8?B?WVpBUVRYT09yTE9FY0Ntdnh3SEdoWmhXemlxdTRjZmgwaU9TOUdQd29OZWdO?=
 =?utf-8?B?UVNkQ1BqKzR3Nm5MUjlaYlZaSWZycFZtczJGTTB4eGNMSDBwT0NPeE1wTGQ2?=
 =?utf-8?B?cjBtSEhOVWQyZ001QTBZOVdUbU5vYVNEdnZhQW5UWmhvaTJXaER4NVBmbkY4?=
 =?utf-8?B?WHZONG1WamtqSi9sWGhWd05JWWpJWnNNZ1NUUWRmQ3dQQ3JBdHZack83Tndt?=
 =?utf-8?B?aEsramtlU1FEbzhLNE5TNWcxQzRPQ2V4VlZRWEtHWXRneDQ2TGM1WFZncjNU?=
 =?utf-8?B?c2x1RnMxSzlYR2FZa2tUQ2JTcFdSeGNlZ1JpL28zK0JlV2lOUUlsaXlyRjVP?=
 =?utf-8?B?RCs0a0JVaDE2MlFwTVpzaEo3Ky9FY0tsZllORjI3QzdFaGFwWmlQNXJJVERr?=
 =?utf-8?B?N1pkR1NETlNTKzRhaEl1ZnluanNSWTFRSzBIMjcweWZmMUZLOUlxRkhtQzFZ?=
 =?utf-8?B?UFJJR1BMZURmdmdLU3djNWZZQWJ1dlk2WnVtY1pmVTIyRFErYmhCZ3VlRmxY?=
 =?utf-8?B?MngzeFByTmRPd3JUYlllbUJnNjUxMzhGczBwNjNqK3ZRRzF2c0JLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE0FFB9B323D054AB8B4B247A916D117@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56407234-efe5-48d2-6e3a-08dec103a162
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 00:04:06.8860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqC2jOo3bEVc2kyh6sk6NjhCTdQswAJI+uaEZ8wBtlxIVdtFUmxfXZO/LDhRAot7vYOb2JkFtsDGyBP7zDs3xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520

T24gTW9uLCAyMDI2LTA2LTAxIGF0IDIwOjIxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICsvLy8gU2l6ZSBvZiB0aGUgRlNQIFNIQS0zODQgaGFzaCwgaW4gYnl0ZXMuDQo+ICtjb25zdCBG
U1BfSEFTSF9TSVpFOiB1c2l6ZSA9IDQ4Ow0KPiArLy8vIE1heGltdW0gc2l6ZSBvZiB0aGUgRlNQ
IHB1YmxpYyBrZXkgKFJTQS0zMDcyKSwgaW4gYnl0ZXMuDQo+ICsvLy8NCj4gKy8vLyBUaGUgRk1D
IEVMRiBgcHVibGlja2V5YCBzZWN0aW9uIG1heSBiZSBzaG9ydGVyLCBzbyB0aGUgcmVtYWluaW5n
IGJ5dGVzIGFyZSB6ZXJvLXBhZGRlZC4NCj4gK2NvbnN0IEZTUF9QS0VZX1NJWkU6IHVzaXplID0g
Mzg0Ow0KPiArLy8vIE1heGltdW0gc2l6ZSBvZiB0aGUgRlNQIHNpZ25hdHVyZSAoUlNBLTMwNzIp
LCBpbiBieXRlcy4NCj4gKy8vLw0KPiArLy8vIFRoZSBGTUMgRUxGIGBzaWduYXR1cmVgIHNlY3Rp
b24gbWF5IGJlIHNob3J0ZXIsIHNvIHRoZSByZW1haW5pbmcgYnl0ZXMgYXJlIHplcm8tcGFkZGVk
Lg0KPiArY29uc3QgRlNQX1NJR19TSVpFOiB1c2l6ZSA9IDM4NDsNCg0KSG93IGNhbiB3ZSBiZSBj
ZXJ0YWluIHRoYXQgdGhlc2UgbGVuZ3RocyBhcmUgcmVhbGx5IGZpeGVkPyAgSSBjYW4gYWRkIHRo
ZXNlIGxlbmd0aCByZXN0cmljdGlvbnMgdG8NCnRoZSBzY3JpcHQgdGhhdCBnZW5lcmF0ZXMgdGhl
IGZpbGVzLCBidXQgSSB3YW50IHRvIGJlIHJlYWxseSBjZXJ0YWluIHRoYXQgdGhleSB3aWxsIGJl
IGNvcnJlY3QgZm9yDQphbGwgdGltZS4NCg==
