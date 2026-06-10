Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522883FBED8
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105915; cv=fail; b=ACy6VQjP+hyaeMFJsuxsTvd2xmmuaBJiohKOiFYWAUF4oalKOdcj1V5PBEPO/CVbPiJIIW3kS51nbgdz6hQUCZUTj2ocgvy59r2EKkfDgW4NFwxAUmgcO/V8IuD16pqHy9N6I5BA/KwycLe3lnJDJHv7nkWqwh0wkeUb3awy0y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105915; c=relaxed/simple;
	bh=lEid8PS5h39+dql7iX2hG2PQUXtxFkJ7e2Da0AomXVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Knqtx4IoW+bw8TmpycOFr/GRDbiEa/nhxkdYk3SLC/N9PAROBlmPznqhriOsdqmJCX0H12y8cX5JMapT3/FwiT9mIfWsaxjtXqTsx1mRtO2egdoU6UCJ+vwR3m3Sl9SGfNjif5bU2fkoyZbMcMIUJDZW5HWwT8yddB3VHVVrgjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m5xSDiSA; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m5xSDiSA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/Gj8RHy0yLZea0KLRBc69avuJJOkv+VFIsywr84pX1n/XtmtAT29MEceMjlW9Hb/+KPafBfYPbdAhIEsz2jxBUuwxxU9P6s1rM29BR6P6Egm6yJGLafZlZ4FrPxVSkV2wmhZmk4Zhc97kUNfl8i+xBSElOPpPSiKo2tX5Kx4Q0QsIrxdWk8tDDe9pl2v7Qv19AwCSC+NeTu9Uotcip0O7DSzts2+rlzxvNgWI4WkPkKlym1TSpQLq+5/Ad7vE5J6Px8bp3HGs7NmZ4sRcOfvtxsRHPASXjTNIX/VSk2MpigfF5Wf6lACxQcQRfBtWZZwTfRL44rA3zAGtSqGpZw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEid8PS5h39+dql7iX2hG2PQUXtxFkJ7e2Da0AomXVE=;
 b=JyLP2IkkPpYZk8fLsEnssLGOgP8fpJSlgidI12bSUPQMyV0jGPv8vb+8vuWQt1EeZ0XBo9v/7z7E3trEbk8F3kkoZx7yGaYX8Bg2I/Sr9JnntjZpO+CEbNopS64xlxIbqepPk6C6sshIYOPGCpOlFrGt1HF0YGudYGtKCLBcV/AbNwv95rezzYobpljEpBDhtZ4no0S8aqKttgEr9L5gznpVMCMV7DGTpUmbl6r46jR19Tr6Otqahde6WpH5/z6X6ZS4+jUbVRI7LioVRtIXzXLyho+RZKdkWUIqt2WCamOlEYMJPHRUCLNS29kUdOqYZD14HQq3PnNsBUmPPAKAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEid8PS5h39+dql7iX2hG2PQUXtxFkJ7e2Da0AomXVE=;
 b=m5xSDiSAu2upqBVfs25FgEPT8JiqaxGUy08mlsNRzVBs9vPYUTuZAWFS9IJ4AV5prTY5D23AUB2xcWx6OYnP4HnvhiP+k5tS5kjAyiKybu42lhb/1ucqZnFvlNFYI6lZgVGPNxj5Yfv8f4y5OAbpZzs8sBuJkivSphyJIh3qwoxf5KMQ1fWNp0L8QMG8nufmWmJ6sNxw1VJfk3k436yAHcXK243NelOsfd6Jk+JvpOrgWXoexXRnSjX03I4rTI0hLrogYAW2cQ8+d6Hi3EDgifqnfpNcKIhGzyTVzpDNwETHFtOFChWRdsDlDzux8pdC/6lE9jCoz4+7lGT8W0kxKw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LVUPR12MB999183.namprd12.prod.outlook.com (2603:10b6:408:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Wed, 10 Jun
 2026 15:38:30 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:38:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "lossin@kernel.org"
	<lossin@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Joel Fernandes
	<joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: Extract usable FB region from
 GSP
Thread-Topic: [PATCH 3/4] gpu: nova-core: gsp: Extract usable FB region from
 GSP
Thread-Index: AQHc9+bCvAQjhHSsqUG/iQwqFbCTdLY3lrKAgAABHoCAAFbBgA==
Date: Wed, 10 Jun 2026 15:38:29 +0000
Message-ID: <b561f47d18f48ac2c00153f83d5baa9637f4a552.camel@nvidia.com>
References: <20260609-boot-vram-v1-0-d9382610507a@nvidia.com>
	 <20260609-boot-vram-v1-3-d9382610507a@nvidia.com>
	 <DJ5ANU6OL6X2.D8ZG3LV755I8@garyguo.net>
	 <DJ5AQWO0KMIZ.1EUA18XBRIJC3@garyguo.net>
In-Reply-To: <DJ5AQWO0KMIZ.1EUA18XBRIJC3@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LVUPR12MB999183:EE_
x-ms-office365-filtering-correlation-id: 61890a1c-5e53-4028-c3b4-08dec706524e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|38070700021|5023799004|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 dCVpstDhrzbsGwHely3Z/zOnsjoBu8pirKFWVXnXaUCLKQUCaP7/Nu89jtEWPXR5FZNEKYhzjXv2W+WSL9zYDE9GFWpUCiD7W3y0m7FyrhOKUMUSPPIqzrP9TtM1e6v+dCWbU6dzze+1cYKLmKhHfZy5OyCULrOKeVoUQHM3utk/cgZEWg7Sgk5kT0cEMi1Dsg9mHp6qW7zVNCv+TKnZ0KsAL/XudXaZbk/DMp+dCmSDaQTuOWu2faTddhRpZV9mL9c0FdHjkj4r5M/Eti7riLMn16fTHc0ScOWHi2asfk7Gjd98yYVqJeBu4eJJr3AqlNDcqe4UbvmyiRiK3fOEMpk1kHQy+/1E2vHt0tcMxokn64AZKPVps7TjBXtK11qXs2si2smufYYFnVuT5tv9ofmEWE/DCstSLMvtpwlRYuEJKumb998lLipPZLKfOoq/gSLpbXxWUMySFr+LgE0yBU7jdbzD9v/ZKxnUvaMuXQx2pIeuLLTsKHjFU79WWz9pYdYDwiX0VPyNWwst85f6Y0tJEjwCUZLWubHpDeLRBEPhrW5DjMyq8YOI098aRZPa68s7BpLhhGjOZlAk9Al1RC86nrhTrIu5dBsVRkfhtd2rhHgC65Vel/u2fQGm2j964CStyruZYm3GF4BAoyIt7nESqrLamrAW1Ds27Fg3QhexEqZhG71oYUxc9BKbqm5Vj+qHgFcjBjXnBf90rTNuN84DuIjA9L+B4EwHudfdjvp6hyCdmxgBmeSPa98TjlMS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(38070700021)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MS9zRS9WL0duNnNFY09adXQwdEJqeVpHRXo5SDFNdjRJSHJKeXc0N1IvWGZJ?=
 =?utf-8?B?WDNVd21yVC9WRERLR21vWFpyM1lmTUF0aFlmT3FoK3A1K1JOQXp4TFgwRGw5?=
 =?utf-8?B?M1VVd0QvanFDODBHelRyUVlFK3ByQWJLa1JBRGFkTmtpQjZKZ0VKcFFjYlpY?=
 =?utf-8?B?QTNRRVpXaUJzQk9SbTBUMWVZZ2p3RHVuUXhsNUtwZ2VMZGI4K3dCRlpTOTlI?=
 =?utf-8?B?V1ZmYjJLa1BtZ080Q0NYMVJTTDNubG82MmFEd0w2OTMva21GM1phaXJSSjYz?=
 =?utf-8?B?dmd4dHh0aGhQWkQ2NTlEakRDQjRUaXpNQnhhTnB4QzZLWk5uWW8zUUlzekJa?=
 =?utf-8?B?REhnZmk1RTErdTZvZGJmbUszN1ZITVllV29jSWd6SXBOam5iYUM4NUc3WW5i?=
 =?utf-8?B?V2N4RzN1Y2RZcnZrMGNvWDFoakV5aXV0dEt3aEEvVVAyWDNPSE5NTE5qRW9a?=
 =?utf-8?B?RlA0ZWVPTng1bUhVV2JQVXJNSVQ5Z0NLRER6QUtXd3ZkdzJpUGIwYzRyUFcx?=
 =?utf-8?B?dG8zNVQxdjNJZWtGaDVCeS9PM0JWcFgvUkNiZi9iYlhCSEQxR3YvWmdsRE9t?=
 =?utf-8?B?QnJhYlRzWWtOQThublY1blc1YXFHR0toZDROSTF1aVA0dEEvanYzMW4rZlcr?=
 =?utf-8?B?RnNDNkhwTURobzJNQ2RFREw4NE5ZdXJEWXJPcG5xamRJNHM4UkFyM2d2L0pU?=
 =?utf-8?B?V1FNSzZtNmdkSCsxb0lFMVpDSERXY01rZENwZlFTMWVJUGp4aGUwZTdISFNK?=
 =?utf-8?B?SytOT3JrYStldWVxNUtzUS9uZTVUTE8vakkrQm1HODJPTWttQmRPbVlmOEtv?=
 =?utf-8?B?QkFqM1kvb0Q4UVhqTHlFSGUvNkRDcDFFeUF2YWpmY0RYRERlUzVUYVAzejhQ?=
 =?utf-8?B?cXlaWnB1UEQ3OGVwc1RUMWVtNTBMTnRwQ0JIVHNpYUtBQVZIQ1lGd0J1WmlF?=
 =?utf-8?B?RkYvdG1RZVRyOTRWOHA0Ri9EemE5cHd6V1djZ1pJbWU3bmlmZUNnOWdvTjZ1?=
 =?utf-8?B?bDZieGloWmx2VHpXazNuMjVkMWN3OURzUmY3eDlFMUJpdEMwUXJpSHZaaUht?=
 =?utf-8?B?WWpKMVlwV293eWNtRm5DbGZkNFBlL2ZPZEdOY3dtaXAycnpINlpQV2dLQWNz?=
 =?utf-8?B?VGw1WTJiY2hoOGtIZDhYTk5UYzRCUXVkZ0xPTG1UT3FDTFQzeitVWmxPbzlY?=
 =?utf-8?B?TUlCWGwyS1BTV1d3cFI1cFduME85blBwSUJvMkNGc0dlNEt3ODk3c1VIeFp0?=
 =?utf-8?B?V2FRTVAyeFJqMFlBSTJhaUtIbFRpTHNkYno0a3laVlcvaWlqbUpYcm5VQW85?=
 =?utf-8?B?VE9HQ2lST2lCcFpqTTFOSk1PVS9Pb25ONmN1SFBiYkFjNFdzeFNsR0h0Y00r?=
 =?utf-8?B?QklMQnRmTzViSVJNSldjQUZTSUdNQTU1bWNTNUNxNFluNlQvR3JHMmZwODJM?=
 =?utf-8?B?VzdaamV6dFE3cFAvUG9nMmNROWRwSm1XZ2VWN3B6a3ZqMFhEUTBjemRSWkI1?=
 =?utf-8?B?SWtkR3c2aWlLeS9UUGJSYVBFUG1pYzFUOUZCcUpSbkRucm5sb09DdGNVdGE3?=
 =?utf-8?B?REdsMEt2aDlYRGpxdlFIUTdQWlBPVUk2d0EzUXNJQUNBWHEvMTdlUjRBTkZn?=
 =?utf-8?B?WkpxTDVISU5ONDV0c2lJblBJYnNhVWVSaCsxeE1KVzNMMFUxY2NlcmJBS015?=
 =?utf-8?B?ZlcvVEovM0tYMHBMY1psVWkwY3NBRktBRGVleGpVR1JodmgvSzdVamxpclBK?=
 =?utf-8?B?MDJUK0hsbmFqWld3K2kraW9HbklDSXBLaDR6UTk4UnFlZzlsMi8yYUU0S3dX?=
 =?utf-8?B?SDQ0Wks5QnpIWjdVSFluR0dZbUF1azBQNnhGRXBzUm9nS0l6WCtvQTIzYVFt?=
 =?utf-8?B?UmhMcGQ2cVBUalArRDRDVkFZUlUzZ0ZOR0FXU0dpRlJRVGxldE1qSjN2K0w1?=
 =?utf-8?B?RkFWQWJDalRVTzYrZzN0bEVtQ0xFZkpyTUF4WkNFenpUbmlLT1p0WEttcnNv?=
 =?utf-8?B?KzkycVpCL092OTAySlJvNUpMZVpQcVRJNVU0eFBLU3ptQ0tiRTZIOTlmeVk3?=
 =?utf-8?B?UWRKY2NDbDFBeVU3d3hueTlUSVV2ZDArVkp3bGpWYUYzekNzd0cxekdQY0FL?=
 =?utf-8?B?cHBDaGpuOFRkMWl0OElPWGhyMlRnTzdrRWw2bHdqeXJobysrVnVZcFg5M3gx?=
 =?utf-8?B?ekZDaDMyU1ZQMWZDaFNMUXRJVHFWWWJTSlVHTEMvbnRkSW4rY2RYSXV3UzVj?=
 =?utf-8?B?L3JVZDV4UXlxZFpXekhvVVVWcFlaU05vSDJwSlVqTWoyNkRqaTlqWXpMZHIr?=
 =?utf-8?B?empaRy9ZclVPU2h3YjBOSDQ3S002aUZpakwyVG44Z3VldytzTGdZamJaTENC?=
 =?utf-8?Q?ZtoPtVdlhiahqptFjgwTY83X0a7Qp7ZbiuDnplUgzR2zR?=
x-ms-exchange-antispam-messagedata-1: etx83kmmK1Ki1Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A70DBBB19FBE544B9D534601D71E9354@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61890a1c-5e53-4028-c3b4-08dec706524e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 15:38:29.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6CoDGfumhJKpGeGTtoc5n66TLxSyhSSGtglZ6C3t14e4q7pP7SYqphajnYiZu96Uvt26BEycGx8jPf6drPxsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999183

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDExOjI3ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiBE
b2VzIGl0IGp1c3QgZXNzZW50aWFsbHkgcmVxdWlyZSBhIEZCIHRvIGJlIHByZXNlbnQ/IFdoYXQg
d291bGQgaGFwcGVuIHRvIEdQVXMNCj4gPiB3aXRob3V0IGRpc3BsYXkgc3VwcG9ydCBsaWtlIFJU
WCBQUk8gNDUwMCBCbGFja3dlbGwgU2VydmVyIEVkaXRpb24/DQo+IA0KPiBBY3R1YWxseSBsb29r
cyBsaWtlIEZCIGluIE5vdmEganVzdCBtZWFucyAiVlJBTSIgYW5kIG5vdCBhY3R1YWxseSAiRnJh
bWVidWZmZXIiLg0KPiBJcyB0aGlzIGRvY3VtZW50ZWQgc29tZXdoZXJlIG9yIGFtIEkganVzdCBp
bmNhcGFibGUgb2YgZmluZGluZyBpdD8NCg0KRm9yIHNvbWUgcmVhc29uLCBpbnRlcm5hbGx5IHdl
IHRlbmQgdG8gdXNlIHRoZSB0ZXJtICJmcmFtZWJ1ZmZlciIgaW5zdGVhZCBvZiAidnJhbSIsIHNv
IHRoYXQNCmxlYWtzIGludG8gb3VyIGNvZGUuDQo=
