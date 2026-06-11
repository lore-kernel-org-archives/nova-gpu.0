Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B03A6EE3
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209465; cv=fail; b=uBLpjPTYRU6+lIMRqAQhhSUYwMvK4QXGSeefQZ4Q6YknBoKcP8oDTyicGs0o8A1Rm3+dZcKTaS1O8+AXNjMKOpHIji9NgeY1qKjE0Sj33cefjlP1fmJLbndKLIeMmBZtQM64Tvi8DH+iPOR6vq+JWBXqtlkBRg1JPfP3sU2nUkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209465; c=relaxed/simple;
	bh=OLkkdhX+l6iqR2zhMrgihPKHCHlLtqT9HXWCajRTTxg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tWvtOpDmhpWf+v6fFS4MrTCtyZINNK26SBDMutRmg7Sh5PpWWctmNGlMcna6dEHlP8LiMmI7lHryn2p1zEAoq2qiPHLogL/js9yV2XePKTTlLw1Um5MmgKBJZb4VldL7oLwkz5k/T3Ql1deH2gX6B5rOVitJqE/fPTxW1VOj1R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bKw/u618; arc=fail smtp.client-ip=52.101.57.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bKw/u618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV4vx7yWBia6s1hZ0FhidFlSGqd7ZRzMGghCHQXHQfmI1JrX3MePfuEmG9A0S/Z7m4c5DQxyedUJa8ron9D1gbHXO6kegIMDlE88fh0jTEn6/C94nsz/0i/IpLZ4Y94iopZtBnsB1xlYINz++L/nVtezhZ1T2pI/c5kxijKOzWTnQ5snnt4UMJMNOukA/5A5PDaWxbfhnjfUFlNcIYG5q/zbwkQ+ww7GGWjYEOVWxUdFql8zeLPDQRnGHLojXjSZoHuGVmjQGfrERaWOYeBWKK2E4YXIdI7jSbiv5wM8n1upmursUM2k+xQG8/PBESjcUQgpTytBcLhtFC0CXh+K7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLkkdhX+l6iqR2zhMrgihPKHCHlLtqT9HXWCajRTTxg=;
 b=lSIjDTP2yUFsQWVqGOD4ntYna62ti2dHB3zPAPGxdy9LTwwQcOuPIo/AtE22ZTX1BCBbxJOvc2gzpiWbUx8YTHds4m1yCij8JbQV0Snn/vNoFV9tCOdtUTdvvf+9HknfUlO3DURTRTx1EBAcexxZTXfvwXqpjyeinayM14Uc3Y/1/xvrW6YF7wpzxxlg18uAQ2LpM6FUK2FoVsCCOjgTYHBWZSnL7UQKLuW5V/DCGOnKI4ZyPzYa9KTmTLLseB4jm1RNKhmSHhHR0KFr2PfZsPQ2Scx8aldZ7Rp7GiIf27M1faJEK8Y7KtTfC0ZrTJKruBtBO09NmhR2hYL5KlgR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLkkdhX+l6iqR2zhMrgihPKHCHlLtqT9HXWCajRTTxg=;
 b=bKw/u618jAXX7zrsA+tO+I0JqW8bIhstbKF48h/2qI/tiv6Gxfobyz69nnrsk6l4GZue+1flUYbIO3DQcEzl5X7ehvIkRQrf+iBYSiXR/YbOSTfj73F/tVm6Wd242mnRvMD4KurBIhYpOZB8pXIQe5EVIt6TXuI6IjllkaEiUhie+qawwm5wgnsFO2z16M8iZVYCkMqWMyck0IVVEY/xCtx+OLN+kELtx1Yvh3y78wB1o3RTbWKBorWgvgc5lZGt0JZqIu0Lnc1o38sj5ZiSwWUniv8Y5EeUdZOCLW45bDkZ9V8dHrXD2q2nwShXJ4KDPvuMtRnvCb4WPEvHUavT0Q==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 20:24:14 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 20:24:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Shashank
 Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset table
Thread-Topic: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Index: AQHc+TKs/PC2gNH6y0qc9KYtbM88g7Y4qpoAgAEiTwCAAAE6gA==
Date: Thu, 11 Jun 2026 20:24:14 +0000
Message-ID: <3507a37e3111b8de7cc921cc346c66ced20697f0.camel@nvidia.com>
References: <20260610234128.547952-1-jhubbard@nvidia.com>
	 <ccf5f6c3ecf84151fac418cc026be318db7099fa.camel@nvidia.com>
	 <9cb7ec57-8084-4c0e-ae08-ee48c0a4f49f@nvidia.com>
In-Reply-To: <9cb7ec57-8084-4c0e-ae08-ee48c0a4f49f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MN2PR12MB4191:EE_
x-ms-office365-filtering-correlation-id: 12e72fc1-5b03-4d0a-f04a-08dec7f767d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|11063799006|4143699003|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 oqbjPoaO0WL+0SfYNBeYkP4jum6wRMWxMYoOho2yy7uvCnLpXxFRnV8NxafVBM2mXZuSvXLWo8XapM+9os5R+keTn3LuGGw8cPFo1dJbK4+onoEkfAIaTdbBl0yfl8jqXmfJkXeP7ZSJhBjeG8x/+5bmyKduxbbjHNV0bpx/ktBApikTiZU1zw9/l2L3mg/TTafi2CbIEYByPJUMSKcrprbZrettCDVzAkPHDp+lFPc65ytjcCPVL4jJ8f4fZfxCCigUJXNEZ9MX8bBIi8YpB+GPYMUk73rVBvTQqzzbJwLu6DH7ZNwiNJ7M+a7s2IS/K8SDXKY8XZbpHcMKEkBMC/zyT2NFUcsNQURig82jT9KJ2W6r5PADzPLn9KnNvgx03N4Rts//uqO2eaDd3kIQS/YaoVA9dZwuewL80wQXOwIJz5oB2xSWQz3sQGqBM/UtA7CU+J3mybcGn21cpJCPsF+MovM0jBjxel4mxirvArggcdGC7ugjX05OGEQ09k7Bb+pag/X1bATiVqyqrat84B5gx7mLrdBkLV50hUHaJsH21Wo/8voHtgupb4YfaFc2JTlC/KiPoPJ0hgEQgJF9K+xzqtMs93zb2ZrwjsKlk19XZa0jJZRI1Hy4DCr+S0nGdGgnnRgDHBK+HF+W2qV4thFMP9p2kaXUy8TzZ+kQU0+IWkcerXobPZox39630AEnougMJq8dCepNli7j71s5WHFu1kUK9X0AHMiWe1kK1NLKmO45wd3z0HPCPGbT7m7C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUNyM2c0WjZ1YU0xZUhuTk9KV2x2K3hpOXdUNnhMQkM3ZWQwaEhUMVZEWUhF?=
 =?utf-8?B?azkrYUduTUloT1F1LzkzTE15Y09VNXBNYmF3eVJlKy9zQlZNMHljbVJmRUlF?=
 =?utf-8?B?T21EM1oreHZKVEx5Qk43NWtWV0YzbHVtRDZpbXBLd2laRGdUcUJEMVFDbXBM?=
 =?utf-8?B?Ui9rTWs1dER2RFlTNk80WFRQZG00aUYyS0M3M1RyZW5ZSU9VOERJcVM1ZDVw?=
 =?utf-8?B?SnlPS09YaXBja2pOa093Uzd6Q2lxS2MxdXhwVWRjbWJiM1RuckZ2ajZnZHZ0?=
 =?utf-8?B?Q1RqY1htdlNSZzlMQk4wWU5iVmgxZDh1a0dvSFlqYWNUcmZxWVluVnoyNmVy?=
 =?utf-8?B?OUoweXlScmdIYURtTWZZY0MwVGlhYlc4UlBrZ2kxSnNLbjJCL05SMW1uSzFB?=
 =?utf-8?B?M1lHY2hJaEJhVnRWUDhSQU1pamwxL09sZ09zMTNZS1diNEx2ZWJoRlBBSVZN?=
 =?utf-8?B?aldabWhlSVhvRUw1bjhBQ00rTVg4a2RKU2lydnhXc1RoMk1xQlBudm54NXpu?=
 =?utf-8?B?L2EvVWRuMkkvUG4wd05YMTZPM1kvVVVvR0MwNXdiZVNTZHNJSXBhckJJMG1O?=
 =?utf-8?B?YWJxeVc4QTBEQTB6dFJ1eVMzY3ZISkEyRVN1RlU1V0lYMmVucXR1SzJLeWdx?=
 =?utf-8?B?K0hVSGE5NDIzUTlQT2p2Tk9Id3VhOURuZDV6REhTRHorSjg1Y0F1dGhRZjJj?=
 =?utf-8?B?ZFNQMFVKOHhXRDFSYmxPTFE5Y29ncjFiUXZCTHFFbS9TVGhJeTYvYndlcEdD?=
 =?utf-8?B?TGFTL3luSWtoK2RyZ0R1OGpqa28rR25TOVJtWS9nVFI4VkdMOUtFeHZodGRD?=
 =?utf-8?B?Rk5ra0RRZ2FuS2tDZ3FIOGkxV2FwUGRHTDRlTk0yaGI0ZTFXbjF6Z0EvUnRu?=
 =?utf-8?B?bWJjOG1jTC9NWDZmaTN5UVlYU2JWcUxCUWg1L0djdUpsdzFEcGhDcCtGN0x1?=
 =?utf-8?B?dExwQk1JOEwrbTdGSG9jKzJ4cFlFdCtXSm5sbW9VSnZRR1cwZGpOWGdoaWhy?=
 =?utf-8?B?b0c0MWJBQjAwMnlPbnI0aS8xcHBMd2luWVY1cW9qNnhVdzJIMDFnSmhiODcy?=
 =?utf-8?B?QWRjM3NhY09GQUZtazJUMDQxbm56WkZPaFdoZW00K1ZCNnp4eUNJV05rUEFT?=
 =?utf-8?B?enlMa3RwQ3pqZmJBMXd3bHRFZkphUE1JWmFpOWZlZXN0QkphUlZEU29POXVT?=
 =?utf-8?B?MEhheWV5RW83MHhpdnIyQzZGOU8relpwWTJJNU5QbnBkUVR2d3M3QWM0NGZt?=
 =?utf-8?B?Qzg3S3hQZnRxa3lqLzZhWmpVT2lrR2w5QUkyaDh2aWladlpycFpxZnFsbnQr?=
 =?utf-8?B?b3NsVFJNWXczWEh5NElNR3llaFpxcGRKM1hObmtEYjJyajdtdXVWb0YvVlA2?=
 =?utf-8?B?STFTNnpPWmxpakF4V3lxcGV2blBRRlRvcExIaTJrMTJDak5JcHhKa21IdTJL?=
 =?utf-8?B?YTdMVi9tazJZUWxNcDVUU05oM2M5a1hnbG84bGt6SndDeG53enRIeC91dSt1?=
 =?utf-8?B?WVd1cjB4cmZ5ZExnWXo2WFlmNVpsRlpURkFNeklldzNsb0dNSGVMS2ZCY3M0?=
 =?utf-8?B?R3RnUjN0Slc3OVZUOHRkLzIzbEdHQVlYbFA5NGhSamZaNHNYdGwyMllLMmQx?=
 =?utf-8?B?MHBmY2xSYW1wVUkvVCszb29BWE95T1EvbEQ0ZUpYZDRLWkJVNlRMd3EvSUtn?=
 =?utf-8?B?RlJWRVlXNCtMV2NzWjBoajBzYUtVSHRseUNHWnhGV05wMXgzaHBTcWxIdWdn?=
 =?utf-8?B?QVc3cThNbUExRml4cEh4Y04vcXlMRTd5VlJQRXRUeHZTZlN0NDVLZUg4bmo4?=
 =?utf-8?B?QWpZcjJtdkl3VkZQT054WnNyOGZpWlNvcmk2bXFqRXIvVzY3b2cwVGJzVXhZ?=
 =?utf-8?B?M0N4VmlPMTNybkpHYTBCaEFLeGp6ejRiR0p6QUwyMmFMUVBNT042OUYxWFZS?=
 =?utf-8?B?NG5OYmJyWERlUkNaWFExRWFEbFBPczFhbmxVQ0ova0hpVFJRWGVHeDVMeld5?=
 =?utf-8?B?NjBlNXhidFhrb29jeVM5b1BWc3p1WHpqRlpBT05uUm9zck51MForMWhWTW51?=
 =?utf-8?B?TjFsZGUvVzcyWDF3aXA2bjBKeXM4UTBqMlVoYTFDSXJ2eUFLOGhzVXpGdzhj?=
 =?utf-8?B?Z0tUaVlJRlVMSy9pVUNqUjUzanVzUyt0cEVmZVArUHQyUlZJMWM4VEtnRUpt?=
 =?utf-8?B?b09HVzNsVlFxREk2d3pzZHBwT1VScEE2Y3k2dFpQb09sRHB3R3VoQUllWGht?=
 =?utf-8?B?cE9zZDlzL010VHZJUFBWakgyazFHZm5UaUxZOEo1Q2NLVDdmQjRVcStjdDdB?=
 =?utf-8?B?ZlZielMyR25PdUlveDJWWi9TeXZ1VnlBMEo4ekVDZ1k5bWpCTXhNdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46B08D723CCEC7449D9BD9628202566F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e72fc1-5b03-4d0a-f04a-08dec7f767d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 20:24:14.5738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUtPsD2FUZRC1lzVcsD9lirg69fmNXvOv/ihqyxzJlonQrNm0y95nFkiWL7ykr+p1ELZIDLXOQvyD8dh9adkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191

T24gVGh1LCAyMDI2LTA2LTExIGF0IDEzOjE5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICvCoMKgwqAgLy8gQ2hpcCBJRHMgYXJlIGluIG51bWVyaWNhbCBvcmRlciwgd2hpY2ggZG9lcyBu
b3QgbWF0Y2ggRlNQIGNhcGFiaWxpdHkuIEhvcHBlciAoR0gxMDApIGhhcyBhDQo+ICvCoMKgwqAg
Ly8gbG93ZXIgY2hpcCBJRCB0aGFuIEFkYSAoQUQxMHgpLCBidXQgSG9wcGVyIGFuZCBCbGFja3dl
bGwgYm9vdCB0aGUgR1NQIHZpYSBGU1Agd2hpbGUgQWRhDQo+IHVzZXMNCj4gK8KgwqDCoCAvLyB0
aGUgb2xkZXIgU0VDMiBib290ZXIuIFdlIHRoZXJlZm9yZSBjb25zaWRlciBIb3BwZXIgdG8gYmUg
YWZ0ZXIgQWRhLCBzbyAiSG9wcGVyIGFuZCBsYXRlciINCj4gK8KgwqDCoCAvLyBtZWFucyBIb3Bw
ZXIgYW5kIEJsYWNrd2VsbCwgbm90IEFkYS4NCg0KVGhpcyBpcyBiZXR0ZXIsIGV4Y2VwdCB0aGlz
IHdpbGwgYmUgZmFsc2Ugd2hlbiBSdWJpbiBpcyBhZGRlZC4gIFNpbmNlIHI2MTAgYWxyZWFkeSBt
ZW50aW9ucyBhbmQNCnN1cHBvcnRzIFJ1YmluLCBJIHRoaW5rIHdlIGNhbiBzYWZlbHkgc2F5Og0K
DQpTbyAiSG9wcGVyIGFuZCBsYXRlciIgZXhjbHVkZXMgQWRhIGFuZCBqdXN0IG1lYW5zIEhvcHBl
ciwgQmxhY2t3ZWxsLCBSdWJpbiwgYW5kIGV2ZXJ5dGhpbmcgYWZ0ZXINCnRoYXQuDQo=
