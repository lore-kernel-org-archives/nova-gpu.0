Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA852D2D1
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767910; cv=fail; b=g3Nf0Qp8ftc7PSLAzlMeFGgtrL+svoBTBZTcXotABFf7cKsURYkakIqG7oYPX1Ul0UJm9Wpi2SYhQcsKSL2DCW/3I/dBwjph42ZkHxpzRvN3RdbAIZManLCLnptCYbIipGJ4EmnXBpreauC7ll89NjqWGdypyUTcbM2vmrl5l/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767910; c=relaxed/simple;
	bh=8Kzc9cXbsDU4I9WyE1pdI3mDf01u8jjh6PF0NhXUGcw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CyLlfvOrjd7Fa71iFWLw0kLv0KymlOBNv7N2mio/ndFRvNu7l7bEGRxigkymGvaMeAmWum8luXJCXcPr0KNQeefRknK4WQYI35SJV5EYnUy1J4IyLouaFTmpmOPHAnp1BJdMEDrxLCs7aNockEYJ6PoS+SBhUgqMkZcwTOAwy3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XOr3zn3h; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XOr3zn3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlJ5RMYmnkIcquBwVT1vQ7M+1HVhn8ntZu1ZyhKVveuwFpOBdVzL9DUwDe6Ge4EpRVI2nqaQZvgSYY/Pxzr6dsmXTHXcMQusgch36teluov+ONmtdO2sb8gYAvc9xwlwqNyWFAK1IS5lTcHxNBRhp40ts6tC1R7AsKyBbarjYxsAX6CUQXhx3nqEwqmYLIZ5KTC5oqIi2U52pmGjrG/4uz96qOgKfyXOVFnses8+1W+HtS2GwXDnzYENoTAw+Ujn1RhvQwDLdSvLbOo02Fvo0Kio/7UVrHPwg9UrxC63lSAJaHrOaEoAGpw/cU2EGJ4eqq1uMs6yeWrruvFPJE1sNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Kzc9cXbsDU4I9WyE1pdI3mDf01u8jjh6PF0NhXUGcw=;
 b=P9LOTNo3QY+Oo3WNkMFCr/lOmHf2A3DEiOxTgeYRq2T6cGu9/Ep0xm+jOyt6mfVCjtyVtuVghgW62emXYymWaF9614j1k2mUe2iZq5+MAZzPwxQsGKHmVpln8WDmBv17Npx5sPRo9LOkv8X+q/BdAD/KKDcaCeTloAoLTJ/H7sgb1qSUDJbYb/Ot8IAztB+LEvq9Q5DQ17Ry+rVa8KHmkHcPBfXqeWCANpIPYpM0qlykwERZGrkEkwuy1qIXZzHMzxcVcUB/PDp8Dcp9/6F7a80n1CrnuoHU4eSLCH4lviGgYruoOiGmgrWlo4Jc89ceVoBlWzVKmOD+mHU6f6LRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Kzc9cXbsDU4I9WyE1pdI3mDf01u8jjh6PF0NhXUGcw=;
 b=XOr3zn3hbvwbi9SixQvDZTRdZJWX4aSO+3AympJxdjBLPaaGWYZnSWLYYiXuRlSeXHhUBeCVYiayuznCzd9vKZu+lBIeF57NGG6JLEWcVqFnyApsVRhDtJRqsPeMvVqBN9fjOvwxST4ek2LwZIHztd83WqC/8RehNaqzwy0/PnEoIoA9h/fcMpjX7g0cmAHDF9F2L11FICFVjWnMeE3iLC6tigjl0udgLq3/IAbszMAitGJr5oXSdLxj3fbqvJ6vffZjiIHqNOVkcn30ks6RbJ6ux/RW6m3/tXExB46XaQgCNFBS2lxnSnv4PKqp+Gc1vt+mYtBKbuegmsGHnAZ++w==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 21:45:03 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 21:45:03 +0000
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
Subject: Re: [PATCH v3 09/33] gpu: nova-core: add GMC API message types
Thread-Topic: [PATCH v3 09/33] gpu: nova-core: add GMC API message types
Thread-Index: AQHdRwoaAc/t4xZY/EujiOGJQURgdLbU39YA
Date: Fri, 18 Sep 2026 21:45:03 +0000
Message-ID: <4de99bd13d2bd80520288e22de12e4b2907628dc.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-10-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-10-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH0PR12MB7488:EE_
x-ms-office365-filtering-correlation-id: ac5abee5-179d-4120-4d52-08df15ce18c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 /0mVmMydj9lMvu4a7nO1NiSukSNleLGlEsZnJbYWJTEAxHnk+41YwdFgR5JwkuESFZBqx1uXKALi/VVZa8c86dANZdo53zNjuU/7O99tQ+WmgGQqmBsrcF8dCkTdnJxQaXBq/WMXXAIX0fouS1PE3fqgek9PUml0DS8iv5f3A2Vj9d07YUcwycjYLLmk4Ox4gz+c64g4soLy/1Eh2brDHgAd1sFLtVLtDJDxpVMPH8wF3Ehrk2V6DaolrpMw3Jt3wpg3g+ubArwYubBtvl97OwrKKItgCZmoBIHM6D84p/wzVGyNQxuLMVDrIYa2veRRJeUwBVxhWnChAK4cliBMUaRcC1gMNBN1EO+ZzRxeB5mX+98oklop+yJJMR2sMNu5gRxYSe4XcSu3BGdc2YJvtD9R0R6GTjL8J1L5lv1m+DsgPi+pkTrSddJyDR4ULIlIJlQ+bAzK1M8zv+MU6Am25pW524c3WFUigILphYOmMKkVC3FPziG+H9OGqsGhlMBvU4NscMxCoKE3RWxEEdJQICFu3Cayl7kyCsOGqZnkHJCBRxfuR5dhkCZpDKecV4TYkiX05tbghFeDkmIqg63pj5NCfMD/bRSLyrvqr5+W6JZCkdIWo+yFTpeQOeWQhY1QrRw4T8G+OVPN29O0+RGQOdR2b4OUcdFg+0K1oVVUkawaacjzwGL7ikse/KfjaCUBPMhX4DMTC5Cw168VGebLiL2d2ajtH9FpFtFmJ8IEU9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTQrSHBpYzdKVlM3RWJHMC9hS3A4QnVGVkVpYnVQNk90ejNyWkVKR2JzaXJJ?=
 =?utf-8?B?Z3dwbFF2OEVkWXNoaDN3UEg3SHRxWVp6UFBoZmg4c1VpQzBlaFpSdXB6dUxN?=
 =?utf-8?B?YWVTSG9naGVEdWMvVW9QRENNbld1b25ZaEd6Qks3dmQzMGhKR0llSExvZTY1?=
 =?utf-8?B?S05IZ1J0dmpPeXFlQ0NxVWlrMitsN1pMSTR2NWMzc2RBRVhqek1WalFIMENr?=
 =?utf-8?B?MUw4OXdDM3IxbVpGa0pMQTdPVUZ2TGJiTnMzVWpSaHpoeGFocEZpQ0tVZnNH?=
 =?utf-8?B?dktqR1ZVbjFrbTdwdko2anc3SXBsNFcwbVhaZTNBK0dRRVBHYllIendNUUti?=
 =?utf-8?B?N3VSd0lENTdGb2hVS3dNcWM0OU11c0xTQlpUVGU2VEJkTXBIenpDd25GT2Zx?=
 =?utf-8?B?SlVJRzE1YlJjR0JHTmdWQW42NkFrTXVVU3g5QXplbEZDTDR0RXJnYlNhaVl5?=
 =?utf-8?B?cXJqOEkwUzhWTmtJdHJrd0tVTWJscjFGWitIRU1aTUN5M29tN2NPK0lUdFZO?=
 =?utf-8?B?V3cxZmgyQzdzcnlXaUIvYVpvL3JZYWdoM1g0MW9TYzNFWHJITjZSOTMyMWo5?=
 =?utf-8?B?c3lDc2MzSk9Scm5sc3ZTd3AvYU85WjgxcElnem5LaEtuT2QzYWx5MUJzTDdH?=
 =?utf-8?B?SHFldHhGU0psbFYyUGpNRWQvVCtuYVRudnpXeWg4Zzg0NTArbHdrWmY5d1lj?=
 =?utf-8?B?dGNpTTFLWmRmRUtzYzdhZUs2R3pYU2VBK2NOLzZTckgrRCt5dmdJUDlIQkla?=
 =?utf-8?B?cG45K2pOTUVISWxyKzZraHhhQlIxcStsckxTdGdHN0Jzcms0cFZkRStwcWxY?=
 =?utf-8?B?UGQ3ajJrMmlNY1Bxam1MQzR6alJ1ZXNkV2EvTWU2NEh2b2dYenNBNGxoeDJu?=
 =?utf-8?B?anlXbWlLTlJjVVdYWVllYTRKZUxORGxvY2pHVlVudldLNlhuTm16cldLdmR6?=
 =?utf-8?B?TWY2SnRrRUhyWHFVS1pxenZkeXIzamhkTzlLZ2s3Yy9xVEVxSzh4b2h0bkFN?=
 =?utf-8?B?S1laYml0VUpYTDFGWUxEd1JqaXloYzBDdTBqT0N2bXJyVERjZEwzbzRONVBY?=
 =?utf-8?B?RFR0SnRUMWRJSGhpVEFHd1J6QjhnRWZyWFlsckowMmZVQWw4dW80TS9teThi?=
 =?utf-8?B?SXdQV3Rob0pRb0FQN2t5RWNqQVpXWWJ6ZlRjY3NEM1hMVG5OUStUeHhWdDFW?=
 =?utf-8?B?QWhIYi9wUW12cU9SRHlNYVRLb2I5dFB3YWx4M2RIN0hYSW5rRTRvZW9rbXZ2?=
 =?utf-8?B?UnMyQXorRjFaTzZLam5sdDVxZFA4bVFveHQ0c3pCM0VkSjlCYWRsck5ZUVM4?=
 =?utf-8?B?UGRJQjYvOVYzZXloNU84YU9yQmdxcGJ4Vk9JclNaZGZld0pRaGNMZHRzekJL?=
 =?utf-8?B?aXFWd3c4M2l0dElISEF1ZmYvZnAyR09LTDN1Ni85dVVMc1J6VmpkTU5aMndK?=
 =?utf-8?B?L01GeUQzOEhIRk82a2pYVVVRazA0K0xiTk5uMm8wTG9obFNEdTI2a2tBd3Vx?=
 =?utf-8?B?a0ZqaDlOUHM4SGRFRVpDa3VqWUZ3Yy9KNG5xdWxicFltbUQxazhQVzRHVnhv?=
 =?utf-8?B?UER3ZVdzVU0vUUNqU1pTNHFIb0xMSHFFMUxEMUV0M3JXaWJCbXB1L2R4aDFR?=
 =?utf-8?B?VEtZZENvMFl3azBVWnc3NFFBYlJSS1MyTkRFVFpPSlhCR2NNb2Z2V09vOStj?=
 =?utf-8?B?dTkrZzRNZHlQZG0yNCtxQTJOZWcwbkViUzBiSmplUmowUk44UHdrNHFnb2dY?=
 =?utf-8?B?dFVaRGZ5cGJ0V01EU2hHV3BBaGo0VzBIOEJnWDdSdGxTUG5hQW5GNnlBUm1K?=
 =?utf-8?B?UmRuVjdPd09uVUNlVFV5VEdnQWJ5M0FUM1R0WHB6Ym5SdXcvb3N5QktBY1Nz?=
 =?utf-8?B?azR6cVVFNjFuQmxxbGdZcDdiMlBDYWZRNytrZEE4UTc3OHNUQm9rTjg1TzVH?=
 =?utf-8?B?dEtydStiV2lJMldQZzRpSkpWbU9xQjkzV2JPeXp3cEZUOFVnNG02QmtpMGxy?=
 =?utf-8?B?blA5a1ZxelZBVkphaWIyR2hiVnhWQlZVZzF0cnpjN1pCMmluZGo0b09VTGR3?=
 =?utf-8?B?OWN4TGdBNzNnelg1elNoZmNYMWEvTXZQaHEzTHhTUHUrT2pvQmZ6L0ozQlNN?=
 =?utf-8?B?ZlBEd2ZiY05POGEzV1J1OVFiaGlGbENkSVAzOStrTTBGVDh5WUxiUXBtNDhk?=
 =?utf-8?B?Ujd3TG12QkplS1ZGVzFyMEpZTkcvS3dBNVpIRWE5Y3ZodWtENHcyVmI3VXpR?=
 =?utf-8?B?NkFsRVdwVnIrd2NseTNBVmlsVkJaQjVnZnFmMFBQb2huMDNEd0wzMlFkWVdS?=
 =?utf-8?B?UW02a2V1VHc1dWpKMGcwSlVtQUV2NE1mL2M1L0pNTGl0UHc3MExRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E826830E40B02549A8E81F2FEE4453F2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5abee5-179d-4120-4d52-08df15ce18c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 21:45:03.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtSxgzSfAkjdabBOA9qmpGrfwU1HF+E3V7V+TIH2Wcr/XRAiYsgJjpH//3EBODv1RJaE5SsysAvsrsyEdehY2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KPiArI1tyZXByKEMpXQ0KPiArcHViKGNyYXRlKSBzdHJ1Y3QgUXVldWVFbGVtZW50SGVhZGVy
IHsNCj4gK8KgwqDCoCBtYWdpYzogdTMyLA0KPiArwqDCoMKgIC8vLyBMZW5ndGggb2YgdGhlIHdo
b2xlIGVsZW1lbnQ6IHRoZSBxdWV1ZSBlbGVtZW50IGhlYWRlciwgdGhlIG1lc3NhZ2UgaGVhZGVy
IGFuZCB0aGUNCj4gK8KgwqDCoCAvLy8gcGF5bG9hZC4gT3BlbiBSTSBjYWxscyBpdCBgbWN0cFBh
eWxvYWRTaXplYC4NCj4gK8KgwqDCoCBlbGVtZW50X2xlbjogdTMyLA0KPiArwqDCoMKgIG1jdHA6
IE1jdHBIZWFkZXIsDQo+ICvCoMKgwqAgbnZkbTogTnZkbUhlYWRlciwNCj4gK8KgwqDCoCAvLy8g
TGVuZ3RoIG9mIHRoZSBtZXNzYWdlIGhlYWRlciBhbmQgdGhlIHBheWxvYWQsIHRoZSBxdWV1ZSBl
bGVtZW50IGhlYWRlciBleGNsdWRlZC4gT3Blbg0KPiBSTQ0KPiArwqDCoMKgIC8vLyBjYWxscyBp
dCBgbnZkbVBheWxvYWRTaXplYC4NCj4gK8KgwqDCoCBtZXNzYWdlX2xlbjogdTMyLA0KPiArwqDC
oMKgIHJlc2VydmVkOiB1MzIsDQo+ICt9DQo+ICsNCj4gK3N0YXRpY19hc3NlcnQhKA0KPiArwqDC
oMKgIGNvcmU6Om1lbTo6b2Zmc2V0X29mIShRdWV1ZUVsZW1lbnRIZWFkZXIsIG1hZ2ljKQ0KPiAr
wqDCoMKgwqDCoMKgwqAgPT0gY29yZTo6bWVtOjpvZmZzZXRfb2YhKHIwMDBfMDA6OkdTUF9NU0df
UVVFVUVfRUxFTUVOVCwgbWN0cE1hZ2ljKQ0KPiArKTsNCj4gK3N0YXRpY19hc3NlcnQhKA0KPiAr
wqDCoMKgIGNvcmU6Om1lbTo6b2Zmc2V0X29mIShRdWV1ZUVsZW1lbnRIZWFkZXIsIGVsZW1lbnRf
bGVuKQ0KPiArwqDCoMKgwqDCoMKgwqAgPT0gY29yZTo6bWVtOjpvZmZzZXRfb2YhKHIwMDBfMDA6
OkdTUF9NU0dfUVVFVUVfRUxFTUVOVCwgbWN0cFBheWxvYWRTaXplKQ0KPiArKTsNCj4gK3N0YXRp
Y19hc3NlcnQhKA0KPiArwqDCoMKgIGNvcmU6Om1lbTo6b2Zmc2V0X29mIShRdWV1ZUVsZW1lbnRI
ZWFkZXIsIG1jdHApDQo+ICvCoMKgwqDCoMKgwqDCoCA9PSBjb3JlOjptZW06Om9mZnNldF9vZiEo
cjAwMF8wMDo6R1NQX01TR19RVUVVRV9FTEVNRU5ULCBtY3RwSGVhZGVyKQ0KPiArKTsNCj4gK3N0
YXRpY19hc3NlcnQhKA0KPiArwqDCoMKgIGNvcmU6Om1lbTo6b2Zmc2V0X29mIShRdWV1ZUVsZW1l
bnRIZWFkZXIsIG52ZG0pDQo+ICvCoMKgwqDCoMKgwqDCoCA9PSBjb3JlOjptZW06Om9mZnNldF9v
ZiEocjAwMF8wMDo6R1NQX01TR19RVUVVRV9FTEVNRU5ULCBudmRtSGVhZGVyKQ0KPiArKTsNCg0K
Q2FuIHlvdSBhbHNvIHN0YXRpY19hc3NlcnQhIG9uIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3Q/DQoN
Cj4gK8KgwqDCoCAvLy8gUmV0dXJucyB0aGUgbGVuZ3RoIG9mIHRoZSBwYXlsb2FkIHRoYXQgZm9s
bG93cyBhIG1lc3NhZ2UgaGVhZGVyIG9mDQo+ICvCoMKgwqAgLy8vIFJldHVybnMgdGhlIGxlbmd0
aCBvZiB0aGUgcGF5bG9hZCB0aGF0IGZvbGxvd3MgYSBtZXNzYWdlIGhlYWRlciBvZg0KPiBgbWVz
c2FnZV9oZWFkZXJfbGVuYA0KPiArwqDCoMKgIC8vLyBieXRlcy4NCj4gK8KgwqDCoCBmbiBwYXls
b2FkX2xlbigmc2VsZiwgbWVzc2FnZV9oZWFkZXJfbGVuOiB1c2l6ZSkgLT4gdXNpemUgew0KPiAr
wqDCoMKgwqDCoMKgwqAgbnVtOjp1MzJfYXNfdXNpemUoc2VsZi5tZXNzYWdlX2xlbikuc2F0dXJh
dGluZ19zdWIobWVzc2FnZV9oZWFkZXJfbGVuKQ0KDQpJcyBpdCBwb3NzaWJsZSBmb3IgbWVzc2Fn
ZV9oZWFkZXJfbGVuIHRvIGV4Y2VlZCBzZWxmLm1lc3NhZ2VfbGVuPyAgSWYgc28sIHRoZW4gSSB0
aGluayB0aGF0DQp3YXJyYW50cyBhIGNvbW1lbnQuICBJZiBub3QsIHdlbGwsIHRoZW4gdGhhdCBz
aG91bGQgaGF2ZSBhIGNvbW1lbnQsIHRvby4NCg0K
