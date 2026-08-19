Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A83C7E0E
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161082; cv=fail; b=LnPE6ttTPZdTEY7Q/xiICbreYD9cTfz7CA4v+fGVbWqiIjQrBPuYsrhbqzLN50KGe12LjSS3JZ6iVovoi/yofPhw3mNw0s2JeI6KzttmbLcI9atEk0Hlh87fUdvJ98Mdsz4X5A2IU5TkrOMTRJu9UGs0n0hUaIsmtObPw30K26M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161082; c=relaxed/simple;
	bh=wi+NHbrCvEXZ+RQaCn02WXaJXbkiVfKf4b4upOF+eMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eC/389P2goQk1HAKZKm1cbqLqHFYejE6MOsZnHPQ5IpmdcgIcsiYFirXo2CtoXHVT7wm9VOZ804C1XpGtNrUC35XetripMq7UC4xltell2JhtsbXL3K2fHxTelKRaIqCok1fBFICq+ZOrKVM59qB+pHzPj1r6+Q1fHEsogcJwcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XNv6fJdk; arc=fail smtp.client-ip=40.107.209.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XNv6fJdk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8cLw4zbpmWOBcLWDZfcSkpgkRtzfJJTQiBww46QCZw2ZSOo+IZG25OVm9vERydregbP6E0EAjX67v957URrrhhUW1+p10IWjBt4RcvqRWdNUySESq9ZnWSBh9ssBuuYTL+p0FYJHqyOH5ewcaK/fK45qNbhehfe8yJQLNUcDGWkcB8aZCkehreVQekebtdzwUR4XJTN6r/jFe6mykBdj4gVZJ4yqfUvnb5kOXoVJnb7hjBH/a24Lj2wkM9YtedBzyQtof22kMywKZASgy8viBNXC/VIleTvwxgv5DFN3CmQ1Rv+wcUzV0f93sWTgFVrCJyulnxjzUvbGDXN/KjxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi+NHbrCvEXZ+RQaCn02WXaJXbkiVfKf4b4upOF+eMo=;
 b=D3fb/fdqseY5w6kguCwWOaq4GJxeIjwoTpLXGzbntSre8yQxBIj8ZRVxEES0Gf2ds/NIS8Gf5ZzbeQnuVrrWun5sV2zCVqQhx/6wKG1t5eDfNYV8NC398V4tjzGFjVMZ0jdlbyOAOg/9sQLZ9tchxQTdXRsZEK4gsBWO323MGNOWXhUiC3ggCZaCol2b9xJ5xJHjJ44OClM7hNl+32T+B2wkZmwrVfTHIxlZscZTTBHdX5tm/RsP+2WnyZ8sLIt0Yj7LanzDpmvHAK7xfESDMKiTgHHSbDMYEcGp3LhjcbL3CERgMzGbCJArVj/gRz00XScOSauOIkabLKoiookRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi+NHbrCvEXZ+RQaCn02WXaJXbkiVfKf4b4upOF+eMo=;
 b=XNv6fJdkeBlVYC8SN0pu+1wGWU8hKp3ydo9wE+h49jhoNf65ywtEv9AUaEx6PwLM1jlJSB5ARLjGDcldPNMAQ2Kue3s6jeR7H2Pvdtw6L++tkzyzU6E9tgDNMNSKyG/W6JoU/pd4qdaPugCIjT9LHvREwlfV1lPh2nxqLrLrQOKUxGIHBpLMNkLfrwC2Yj2m5J1RZ5RSzw0ADkkP1gFHTRVdB9AePweAj/1a56KX1AwAPsb/jaBMT/bPUaYjl2wf39Ob2QWLMK3Igf6benXEYj+kE7ME+Pm3IoXqUw194B5lATWYa5/EC2Rs8Xvm7idfEmWrAHa5JAEdBHTLhsiO3w==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 19 Aug
 2026 17:37:51 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 17:37:51 +0000
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
Subject: Re: [PATCH 02/27] gpu: nova-core: extract radix3 page table into its
 own module
Thread-Topic: [PATCH 02/27] gpu: nova-core: extract radix3 page table into its
 own module
Thread-Index: AQHdL44pir2zlRhAbUGgEQVC+MAjsLalo8wA
Date: Wed, 19 Aug 2026 17:37:51 +0000
Message-ID: <fdbe379e8d152336a2b55671e36c765ba1a1c699.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-3-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-3-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ0PR12MB6757:EE_
x-ms-office365-filtering-correlation-id: 45f366ea-0db4-4916-7e2d-08defe1897df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 hzYtbgQQcWufXapju6A/iSIAWLXnOuZljndXrjHFY9JJo2XTAAdDi3lPf5if3buH6fQmv6bMrHPLjGg15v5xiPK4bpHBjqSllfEac25V9sI4jISH7iZnf0fppJhLysJ+yFI7M5t0oD7rwarfmP3HWeOaxIWAKHbUpbB6JKvUDDN25+T7ohtZVxvv5g+XhHh213Qf4dfPfZoGNF8ePKsEwbhMJV3hxSstiDrydRG34oH3thLzxQIT+xzgdqWM18sdIy1kBgBLyHXWS2jvXZg/0MrsqkDyQ5s1pEuES2whV6KlwXaxLe/LyF5Z2Hj3Jnzh0KyQ7qt3iCZ8awxbJfyFrhhOKnFfS6XDW63nikaq1fVciMjB3mHzixH5EwFAYaBaMrNWaajvUbHujsr9E7raMeWnoqTtuW7f0FcNTGhvmNwOzsx2arH8Ys3DJ5rqgXpJOwXs5c3VXnzuBA6kFtaquB8I5xgcZX2wR1MQQVuWp0/wZAZDVaoOYqJBac+XeN9AE6KmaTI+UcZO7dYxHwogJ8QZ97plEMLc2GJ7g3Dxl6DeA3KO0njDMukgmZ4iATgt3lC27/1UHtIJM3x7VKP/Gv8zx9OimmZX42fyE6bBwH4r1uM8xm1jb6Z/HtmN9ALNGAE8MpHCPpvIP0X5ZRuyOagCaJSo3YVjSua4eXn915LCPGf0BXj7dhFsZTdHNLNEq37n+bXXKWAS11YQqnG1OQOPsCZB78y4nNfEEUy8tME=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L29CQ09ad2JuOVl6Q3IzMHJxMGF0alpiV2xxZGVzTXEvRk1FTStCNXBQdTRq?=
 =?utf-8?B?aWVDb2VCUzY1UDZ3dWFLWUVDNE9aMjBKOXF0QnU5S0Q4cXBoemhRVFQ3THN6?=
 =?utf-8?B?a1Q4VWdmU1dCY3Y0cGUzcUhNdk5hT3R0K0p3VFZ2QkVlU1FDZHNqNkpHdTU4?=
 =?utf-8?B?bktCdlJFUGl0U0d3K0d6NGU4TUxTMFF2dUNUYWZKYnR1ZHZjbDlreHpGVHdG?=
 =?utf-8?B?NVBHZEtLclFaT1JPWVVaOHZpWU1lZmd2QXgxMUoyK29OQ3FWbGJiYWptUThS?=
 =?utf-8?B?Z1ZoUVlMQXFUYkRmZ2FLNFAwY0VnUVQ2djZqekJDWUt3dktjSlVKS1BRSnRU?=
 =?utf-8?B?eWs4TGJJOVg0MkJVZ3N1TGZERlVRVFRyQ1VlNVZxV0xFU0J0VXZxR0VtREdN?=
 =?utf-8?B?NWY1UUlIdHF1cm1paXZZeDRYVG1lanVBQmdKSVF2dmRPdFBicmxHWXBmcXdt?=
 =?utf-8?B?OHhEYlA1bGZmbTNRak5FNnV6SHdGQVZQb2ZzS3pWRzhCS25teXBsOGRsTFhi?=
 =?utf-8?B?UzZNbDJkTEZHTUVrRklyVnZGa0I4TDBKc0ZvSFFoWE5RNm12NC9QNzJlQ3pj?=
 =?utf-8?B?L3NsZ3Exclo3UWhPTlhMWUVVeW5ZOUVOVHZIT29McTA0Z2VqVGYxK2hZMzRz?=
 =?utf-8?B?OXZrWXpHdlArSTNraDMvc0RlcWFneG9NaEx2bUV3VHc4R1cxZGlUdE8vMWgw?=
 =?utf-8?B?eUgrSUpUc2YwOTJzUjlIUHJmTUZnT0N1dHhZRFRHM1A3d2lxb1BCK0JzQ3lt?=
 =?utf-8?B?OVcxRDZOVytydWx4WGNxWkNXUWZwc0wxdTZlYkNyMHZyLzlZUnF1ZGR5ZHlG?=
 =?utf-8?B?cXh2Y3IwR3FSNlJ1aVprb245VnV2SVVFMXVjRGJ2SGhyTjRkdUNQTnRacmFH?=
 =?utf-8?B?dG56M1p1UGl0WUpONEZEc3EybWUvenZYVFd5djFkekZERXVvUmQwZ0V1akpy?=
 =?utf-8?B?S2tya29pTURJM0c3S2ljcG05ZzVOcWpFVFhBZDd1NEhlcG5obkdIZ3dLYnZp?=
 =?utf-8?B?UDlSci9BSmVsM29xV2NnczhwZ0xFZHdSYlFha1VTVUQvMWRiTWtNQ2xvb3gv?=
 =?utf-8?B?N1M2RHJwTitKMGtocmd3L0ZMSFFiYUZ1TXBxUTJ0WW90eVh4ZHJYU3g3WW9S?=
 =?utf-8?B?QUpPT0Q2eDlNY3F1bUZhdlltY1lFdlF3bFlFRGlMVWpzdHplOFFMck94REtu?=
 =?utf-8?B?MWcyYW1YckZTNlozTzRoTVo5SzRKeUFBNWtrRDJTN05IYi9BYnhxeTNvYnYz?=
 =?utf-8?B?dHZFNXhxQTRDeCtIaGVOanZ3MjNoWFVIdzV4R29vM0RZbGhPNXFlT2pHTnRV?=
 =?utf-8?B?Q0U1VVl5SVQ1VXVFVmpjaHFEL2lLUy9GQjRBdCtXMFVOaUF2cEx4N3hPSzFS?=
 =?utf-8?B?Y1dONzVJaSs2Z0VhNDFJZ29sek1ZakF0OEw1U1dZQjZVTkZqZWlqZHdDNy9N?=
 =?utf-8?B?U2dKZ29tUnlZRWU3WVQ2cEYvd0R6NzNITHE4amFENk5wWFVjZFI4QkFsUGxu?=
 =?utf-8?B?TU4yb0RqQjZ2WjBrQ3J1V1BabVZWMUFZOEEvcmdhMG05MlZGa0lHVElsanho?=
 =?utf-8?B?RzJGRXBGR2lDMU5BaEhCNWV3MmkyVjZHRkxDWjgxeG1oY1M4cVkxU3R1VUdr?=
 =?utf-8?B?cFVocUVjVktRMlNwZzJpL1VrbUpQYVFUWU5YQTErNUJlVEd2WWJKSGxYU0U0?=
 =?utf-8?B?LzdTbHB2bGVRbmphVDVVRFdtRXdXZ2RBbk8xdjFubDhJMlkrS25FWngxQitr?=
 =?utf-8?B?WHhzVDMyVTRzdWZNVVJWV2h1c3pqUXVSL3Y2anJQeGNnamU2akRGU2MzcjJl?=
 =?utf-8?B?QVA1L1dlZVlWWEZuK09PQVdDUlJ5RDFMOXVXTjM1eVI0UFI0ZnlCek92ay9K?=
 =?utf-8?B?V1ZYYkN3V29XQkQ4aTFqV1RKeHdacWdEdkRLRXlOUTFFaTVqV0ZNRm9ncldh?=
 =?utf-8?B?cTY1OGNJa0doTXRRTHM1bEhReld6NVluakp4OEh3M2Qxcld6Q2gvNXhLQ202?=
 =?utf-8?B?WlUyNlZPSEtTdW4zNkt5UVNndzJlalVYZk00ZlRpb1FRMzB6UzJYZld2Rlg0?=
 =?utf-8?B?NG5ZZS92TEl6MStkUGIvb0Q1ODNzZnZmWkptV1VHNUl2QWtyVjdiakZaazFi?=
 =?utf-8?B?RWlpMzBYc3llWHpna3dUV2xmSFpXSlNZdm55MThiTlJ6YytCWWc1eDk0K2ZE?=
 =?utf-8?B?MGQxL1RldFRGMlViVmhaWE1iNTljWXQ3UTZmWkZ0T0phb05mU2ZzY0lLQjJo?=
 =?utf-8?B?UXp4NW5NSklLcDFoNnphTFQrRzRWd0NJMitHeTRaZlVVcVJ4Q0N6anQ0SlVL?=
 =?utf-8?B?OXRxeFhKTm9QSDR0c0VLNGludTJ5TFFaUEtvQVN5UFJ0ekJLdUdFdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A0577EBC5C40D4081211C1F5A53B86F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f366ea-0db4-4916-7e2d-08defe1897df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 17:37:51.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2yTO+7sIH8XqU3+NtR+efD7ifQheULqgV8WmOpKtni3gBlZtoSjeGahQg9wWbqjCNvUctOI8GyA7r30SGW6hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KPiDCoMKgwqDCoMKgwqDCoMKgIGxldCBlbGYgPSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdCBFTEZfRE9XTl9BTElHTjogQWxpZ25tZW50ID0gQWxpZ25tZW50OjpuZXc6OjxT
Wl82NEs+KCk7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBlbGZfc2l6ZSA9IHU2NDo6
ZnJvbV9zYWZlX2Nhc3QoZ3NwX2Z3LnNpemUpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
ZXQgZWxmX3NpemUgPSB1NjQ6OmZyb21fc2FmZV9jYXN0KGdzcF9mdy5zaXplKCkpOw0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IGVsZl9hZGRyID0gKGJvb3Quc3RhcnQgLSBlbGZfc2l6
ZSkuYWxpZ25fZG93bihFTEZfRE9XTl9BTElHTik7DQoNCkp1c3QgRllJLMKgdGhlIEdTUCBpbWFn
ZXMgYXJlIG5vIGxvbmdlciBFTEZzLiAgV2l0aCB0aGUgdHJhbnNpdGlvbiB0byBUTFYsIHRoZSBh
Y3R1YWwgR1NQIGltYWdlDQpzZWN0aW9uIGlzIGV4dHJhY3RlZCBmcm9tIHRoZSBvcmlnaW5hbCBF
TEYswqBhbmQgdGhhdCBpbWFnZSBpcyBub3QgYW4gRUxGIG9uIEdBMTAyKy4NCg0KJCBmaWxlIC9s
aWIvZmlybXdhcmUvbnZpZGlhL2dhMTAyL2dzcC9nc3AuYmluIA0KL2xpYi9maXJtd2FyZS9udmlk
aWEvZ2ExMDIvZ3NwL2dzcC5iaW46IE9wZW5QR1AgU2VjcmV0IEtleQ0KDQpJdCdzIG5vdCBhIFBH
UCBrZXkgZWl0aGVyLiAgVGhpcyBpcyBqdXN0IGBmaWxlYCBiZWluZyBjb25mdXNlZC4NCg0KSSBw
cm9iYWJseSBzaG91bGQgaGF2ZSBjaGFuZ2VkIHRoaXMgd2hlbiBJIHJlbW92ZWQgYWxsIHRoZSBF
TEYgY29kZSBpbiBteSBUTFYgcGF0Y2hzZXQsIGJ1dCBJDQpkaWRuJ3Qgbm90aWNlIGl0Lg0K
