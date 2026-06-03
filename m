Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04120468E
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456207; cv=fail; b=ZUXkyduO+PIldDrUtKYJq9xrItxBMIcZWt37rWgo7XPTG+P0gSU8k61eZqlUwn7BrOUIbbN2z1coFaQK+A4FQWNco9R6xZv3P/AKq/pcwLDvfxElk/HtsmEEUSxkOPt0pz3NxmOTgSbUn+iY9s+h/+1SEEyAUihCupt1A5R1Opc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456207; c=relaxed/simple;
	bh=by82sKQ88xNjZYllZnQVwkbIpV6E3eBb94L6lywbCQg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iqre84eKPXxhw1Vg0rSctcgIfNRDwl9Q65bZ8Bri5zZ3IOH0L1P/iKAtRGSDLQnWjkAnDkcpkCxMwwJ8696mHGwRDsNtqX1x89rmcIONDmybuv4XeqfvCS6swh6OIO0lfxJuyYUcd2xRH6lvoIA6+qp/f7618cGUSgRMq/GZ2sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHPy1lDi; arc=fail smtp.client-ip=52.101.52.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHPy1lDi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAAn7vm0dpIIF9zj+CWd0dmjPyYFIpyy0qShlffSi5e/EcqooTR2PNOfZ0PLMHrmm07LXxo8QVT69lqf+VUC+Zg2A8Vp/E0XBkXQQgEf8YdS/PDv/qX383UzsFHBp8N7Aa/nX+6GeQuQyF0q4m9fySuvY+oxJD2miahauWu2r5mG8XkbziGtCSRQWnArVstpt+NcmuNm6zCkc2isKWJ5KDPxs+mwecey+GFcGMpQAdO5xy1BN2Ul5cKbsqh6jvohbAhpMnOQ3e/e7FMGvgIzJDH09YTbtAQo7Z3V+1y+q7SpYd6H9Bie9fBWhCvLHe4YsWmnfgNajUHjePU/DY1idA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by82sKQ88xNjZYllZnQVwkbIpV6E3eBb94L6lywbCQg=;
 b=eCAK+gKkqzqNPonBMvWEW+8LDrY1K4qayiMuxoXYl5jrrLUCkaIu1bJBtCWAOajYXO7jV+vO1TM0zgNmIkFxwuM8CEecu7pIed1AXsH/9qItT19Tohbr5z64aen0I90vv4amUPz8mWaC2kxexFD8hGsJbad0gLnLUG8qKR/JXjyAJvgYoZlXb5X1naMg4pNUmoj3Mz23sAqRkXTyArpfDhZj6rTnVJ5ORs56vfrpYFFLXcJ5RQLwQmR7tTOyg8xSwasJ43KzORi8nJ9Kc0FVGG4EtnUk2TFyHDDAaR3kD27TftwBV8JIJ2dhhUH67D7B8hNWf2FFLfMHDWHsnzRSOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by82sKQ88xNjZYllZnQVwkbIpV6E3eBb94L6lywbCQg=;
 b=mHPy1lDijiD4QjpLjQwY25HbBqcktYYowoS0TgdFvH7d+Hr0BvB3aEoVdBjoYZkXFpLZtQrA0PFv+5IqHXIOaB6cgNPqgMcFeAUN+hOTy3PBFzUAj4WwRcPedB/rIRuhpFY5aqqoD6c7t2BvifN0dxhxmvU7sXvOejvgJo90UWcTLhOQYHhygXgY8rXw6kc8VPsT8+7RpL1J3lLqW0JhGaqEAmOZKo+hD2WKuLZt/6XHuDIGSmJPE019jsKRxZGQD7N9vYVp05xLPh4EFg05s5tJH9wIx1L1WO/Mct178fCJ3y//eiWIBPjh58MOBsBU9XDigYfQHGFYM5ese35s1g==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 03:09:58 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 03:09:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Shashank
 Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, John
 Hubbard <jhubbard@nvidia.com>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "gary@garyguo.net" <gary@garyguo.net>,
	Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Topic: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
Thread-Index: AQHc8j7paPPAidjKsU+T3R9++h6+EbYr9H4AgAAEtoCAAC83gA==
Date: Wed, 3 Jun 2026 03:09:58 +0000
Message-ID: <a3380acdbff6ca77892143dcb4dd1ea6c085ec8c.camel@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
	 <20260602032111.224790-14-jhubbard@nvidia.com>
	 <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
	 <DIYZGBDIVOA0.1Z6FRXE3D4JBC@nvidia.com>
In-Reply-To: <DIYZGBDIVOA0.1Z6FRXE3D4JBC@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM6PR12MB4452:EE_
x-ms-office365-filtering-correlation-id: 277930f1-c41b-400b-59ea-08dec11d983a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|38070700021|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 rWgdhv2zYZVs4kWg8gQOzp6SsoeBgqVGo+wOyzlNQXTrdbWMORHlvTonBFsVocYutOL4yk0KxLsdrGBq4NCfY6y04+AACUDhMzPlfR9HgJbfDzssMjHgEnBZwio9VytYTubjg7HH1avFzN6tD4TpT4IC3tPgLZ2eEOiNGiliqaazx3KFZY1c+iSc3V5YEPB5kMea5nkpTBLdvFEqczw2aXKiqKlKAGso1io97iwSqbF82U6E8Qa7BF+af1F45mI+gMcoonWKrnb6swDEmG4J2R3abCBLi9KakF69HAMfsfc+1ssGs8n6aJFBfzhwMBuSXwuzMD9CstkqdtIvmhL9lh6xfaFBInp8AhzlQnDnrorWau1zkDTQcQ5YVMXuv4n71wdqIvl6EQrZwxbHNvqjsZR2nrWOHAv97ys+Fhb5UaXS9fdEkRqHrgeZhYKiq0CdMGQkngGK8D6gKndbwi7iR+Da/thm/Q1tM45JvbNL1IsAaG1bd/WhI727xKKX99NhZYwI2CZK6bvaI6qGVc1dEb+EppLsv+ln39WHBGYs5CtvoDN2bTL8V5fmSwxpIBh0h0OrnfwJcxOcix+foMf+7cbYVnRf8SiH2rFHYySfksoS+9HmAD5Hnt0o3cMEcPEnY1qs9uJlLlEU3CO2wioKpzlGRBmUgUI/1tiwUx6lMPKstcnPu6x1zSclXhTM7cVd5Dh8/4ZpZ6LgnLvp1oycLWXgAFusEvSpBJ2hYcODXHLG2O90klpO9tQyGBWJ8ekD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjJob2I4SlMwNGloL2YvTCtWVXZNR0FOOVUxUFQxNjJDWlZFZ1dmYjJlNVlu?=
 =?utf-8?B?Zm1lbzNqTFRJcExQUEdWb1NtRkY0Myt3clBQdERrdFVWNUJsUjRVSmtERWRP?=
 =?utf-8?B?eVErSHpSTzN4c0dsMXhESFhQdWhKS3hRejJPZWJTak1kSUg1aytxYzI1aTE2?=
 =?utf-8?B?bXM5UlN3ZjVsRzRoVVF1eG5PVUR3TGtaelE3Rm1lNVBIUG5HcFJtQjlvamho?=
 =?utf-8?B?eUh3Zk1NT3hodkQzM3ZGMEVyQlNhNXFycDZUSGZtZjdqQ0ZRWjVTekxBamtF?=
 =?utf-8?B?dzF0M0U4S3BwL2hlUktYOEtnRzZqUU16Qi8xR29Rc0c5YnIzMkhka1NpRFhY?=
 =?utf-8?B?L0ZwckoxYlA3L3BzYlNnRGEzbzc1bkhaOWVRUEZNL0dNb2UvazBVT3BZTzJ1?=
 =?utf-8?B?UEY4NnVSTmdNSG1nZWtjdjBpUGdHNHB5WjlITUJvZUZHQk0zbjNrNGpoY1BO?=
 =?utf-8?B?a0g0Z0t5SHl3SWFJNHJReDJ0aWJTbzBQcUJPNU53RGJnTVg5WmNCbk5DSEtN?=
 =?utf-8?B?YkppTUNaMWNCaStIaDZHUzEybzFOQ2cyb1d2T2NNVGpYbWhBOVZXakpiNTBK?=
 =?utf-8?B?aWZuYXJtNGJjczU0SCtUR0phaDF1Y1orMElGNU91ek50RjJkMnFoS2NobXdO?=
 =?utf-8?B?cFk4YlNYcHhRUGozWlgyRGxLRXlOTjd3dk9xUWRQYklubkJjUGpUNUpwNUlW?=
 =?utf-8?B?SWxRZkRDRmh5QnFIT2M4R1hoTE15bW9tSkFrL2tleE1mczM1QnNOQWlxQ2VD?=
 =?utf-8?B?bVZycXN2aWlWNkFHU2UzaENLY2NCUkcyT2pxQ1hYRDEvbHAwYnZ3VnUrZ1JP?=
 =?utf-8?B?SnlXTDhMRVRJSzkzc3RieDdScWhaNzUxc0UrRUVvNE1TdGNERFhwL2hxS09Z?=
 =?utf-8?B?K09LU25zejcrdnROeHQ3Ym5DcDVSQVBaZW93S2ozbmp5UWoycFhiRzUzMnVI?=
 =?utf-8?B?ZXNXZ2lEVFJGL0lvVm82VHBTbExjb1JiRkQ1VzU5c2s0N0s5dGZPcmoxQVYv?=
 =?utf-8?B?QXFjbFcxUjdpOS9PRWdYSktRMFNVS3NKNGRNMnBVV2I1YWdQYzZ4bWVyUXJm?=
 =?utf-8?B?WkdHdkNydFdnNXl0SnlSelVjQkk5Uy91d290bnNESVp3WVJubUlCNzJuc3VU?=
 =?utf-8?B?em9NMExJMXphNUFvbG5VMkVObk9kNlBzRTNTSmZvbVIyTEFFNWtkYVovd1lh?=
 =?utf-8?B?Qk5YUnZndVROVzVORWFkbUFpSEIzczlPUDV6K1ZnZkhHR0FiYTVrZnFwd2Ns?=
 =?utf-8?B?MUpua3YrUm5zbmw2WHNCTXBQc3B2ZVZZZlgxN0FWTDVHZ1dLMnJaRXBlT21P?=
 =?utf-8?B?c04zSUpseVZUeThSNmkzUWNsV2o1MjFtZUVDeml2OFNqMnJLSnVPL2tIQ0dm?=
 =?utf-8?B?MFJXbDVWUFlzaEEvSjhTblR4alVnUU8zTEdhUXpQelRlcHJrNVk5cTV2NEhI?=
 =?utf-8?B?NkVyUno5OHBPaDhscXRBa09CVXZNeVFwalZMNVlRUjAraHphcGVxQ2VIUEY1?=
 =?utf-8?B?cHUrR2lFSUhzTnRtQXhSbnRwK29kZDUvc3BvcVpNVGJveXhtUXYvazBENjNa?=
 =?utf-8?B?azBmb2Z0cWxzM2o5WDhvQm1NdTVPejZaOTRINUJPTUpjU21qUHhJTWRXVXBL?=
 =?utf-8?B?OC8xdG83RXY5OUtwb1Z1NlIzYThuWGxaTFZ3a0FpVzRuRnBrV3d1VEtZQ2dG?=
 =?utf-8?B?endqR0t5NVFlYi85QTJwdXpLdDM3OHUvN2lkYnBmbHNqazRiMnlEMDEzRjZt?=
 =?utf-8?B?TURnQTJWSFF2UVp1ZTJ6WXN4OTJRY1RKWWFGSSszemRJNWNmcHN6dTFhK0Fp?=
 =?utf-8?B?SS9teGVIdDhzNGxxR01BVkxmaTBFMisrRjExbWRiSURmUEVITXh0UDRSUUxH?=
 =?utf-8?B?a0ZuWGFCZVE1eFRHc3RGM2V4eDdoRUU2ZkZibklVTjFDS2FzVGJscmZzQjBn?=
 =?utf-8?B?dEZ6NnJwY29RRkcxUlBUV3REcDk4OE16QUVKMmJhWm0rMjNvMFNDWFk3NzRq?=
 =?utf-8?B?U0FkV25QcW5oNGZkc0tjZ1d1Y2Y4QjFja3ZZV09QN1pwbEJqakNnVnFNTHAv?=
 =?utf-8?B?aVo5NnZVWnQ4TjdkOURaSVRoV1FYWW1mYW9CRURXRGFETjkxaWpVTXFYU28z?=
 =?utf-8?B?czMrVDkydVdRUG9FL2wwVTAvT3E5THNmYkwxNUxaNzd2a0Vvc3g0eGtNNHVn?=
 =?utf-8?B?c3NZbFFpWmlWVUNEbzl1N25GTG1JMExocFJZVTNnQ25sL2dUU2ZuckFmOHdu?=
 =?utf-8?B?MzBkN3FlOTVsR1UrY1NLQnhnQWR5aFhlNHEzTThxMGUwZzMyV2xGK09tZ1J6?=
 =?utf-8?B?d29hTitEakV6aHUvWVNsWmxQU2Q1ck92R1NQc0FudEViQTJkbnFXTGR6OG05?=
 =?utf-8?Q?h4C2irXInS2KWom+fXnRp1YgDvKcWZ/x3BNVCocbw7HXU?=
x-ms-exchange-antispam-messagedata-1: bkTnLAqOi+yRqQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CF339D66882AB4B8EC049A8044EF7CA@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 277930f1-c41b-400b-59ea-08dec11d983a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 03:09:58.4522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBxs+VVtpgfChRun/Vtxu8+xehvD4v+IXUMeQvFBs/VRNgdhxvNx/I6SeKR/0+9cKp6rORU698RraKg++Ul2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452

T24gV2VkLCAyMDI2LTA2LTAzIGF0IDA5OjIwICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gDQo+ID4gSG93IGNhbiB3ZSBiZSBjZXJ0YWluIHRoYXQgdGhlc2UgbGVuZ3RocyBhcmUg
cmVhbGx5IGZpeGVkP8KgIEkgY2FuIGFkZCB0aGVzZSBsZW5ndGgNCj4gPiByZXN0cmljdGlvbnMg
dG8NCj4gPiB0aGUgc2NyaXB0IHRoYXQgZ2VuZXJhdGVzIHRoZSBmaWxlcywgYnV0IEkgd2FudCB0
byBiZSByZWFsbHkgY2VydGFpbiB0aGF0IHRoZXkgd2lsbCBiZQ0KPiA+IGNvcnJlY3QgZm9yDQo+
ID4gYWxsIHRpbWUuDQo+IA0KPiBUaGVzZSBhcmUgUlNBLTMwNzIga2V5cy9zaWduYXR1cmVzLCB3
aGljaCBhcmUgYnkgY29udmVudGlvbiAzODQgYnl0ZXMNCj4gKG9yIDMwNzIgYml0cyksIHNvIEkg
dGhpbmsgd2UgY2FuIHJlbHkgb24gdGhhdCBhc3N1bXB0aW9uIGFzIGxvbmcgYXMgdGhlDQo+IGNv
bnRlbnQgdHlwZSBkb2Vzbid0IGNoYW5nZS4gSSBhbSBhY3R1YWxseSBzdXJwcmlzZWQgdGhhdCB0
aGUgY29tbWVudA0KPiBzYXlzIHRoZSBzZWN0aW9uIGNhbiBiZSBzaG9ydGVyIC0gdGhhdCBkb2Vz
bid0IHNvdW5kIHBvc3NpYmxlIHdpdGgNCj4gUlNBLTMwMjcyIC4NCg0KSSdtIGFzc3VtaW5nIHRo
YXQgbWF5YmUgdGhleSBjb3VsZCBiZSBSU0EtMjA0OC4NCg0KPiBEb2VzIHRoZSBzY3JpcHQgaGF2
ZSBhIHdheSB0byB2YWxpZGF0ZSB0aGUgbGVuZ3RoPyBJZiBzbywgSSBhZ3JlZSBpdCBpcw0KPiBh
IGdvb2QgaWRlYSB0byBkbyBzbywgdG8gZmxhZyB0aGUgcHJvYmxlbSBiZWZvcmUgaXQgc2hvd3Mg
dXAgaW4gdGhlDQo+IGRyaXZlci4NCg0KWWVzLCBJIHdpbGwgYWRkIHRoZXNlIGxlbmd0aCBjaGVj
a3MuDQo=
