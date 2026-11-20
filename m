Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214025;
	b=cLXJ5aRvmN+mVlofIw9q7n+h8+tiG6w1AU530GUuz9J2DpNcPBpGAY6BfRFZBrdT5T7u
	 NbRAFRFKA/j5NXYTUM3rY/LnnThvk+zH7t7WAV28D8jwMUdeTtmKEHdV7c03n3CQBHH+N
	 rxNHOBwjfQOy9CO5FJFoxFlMGEMS9gpOam8KI4Oz/2rZoMLRLBYABOeWavK/OiP/zqJ8D
	 DKSdEbQoxGwNBPU4bByClQrJ7OR3EG/uA0sJbc6b+TermUW5Hy69Ng3/s4/o5/XWLpk0d
	 elTEXEFpoTnAu32m6b1448YTeWPpykGNi5PBL2/FE5BnjsXvpTSGTqVPBfXnhdP3zzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214025;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1S2X9l/co3NlWExor4qrt3VYHNmZrET4d5g5xi/+FlY=;
	b=PIKNGvKGGI/bqtcbLoWu0XWE34KjoFlmiYNZ/b9qSi66SW+qOpHRw8t3yFi1OARUNdhN
	 Q6rddmHk8WMQULVtwZ14Rh0nhI+APGiO+M093QLFBErWMb/x56t1Zisri+wGWLLFTmg6t
	 qarB/lcNtH4HB+decVIaHGKiSWpb9PHYk38WrWKx3f1a0DvLbRoJatGGwMsZ3fXWalZP2
	 LYhRCX7sIBGEI74OgfkL7Wjs1Dh7yeOmIIE8UxMqkJ0Djp3/Tgd3TwX4dmg+VQjFAKusH
	 LfRFDLdQBks52I703uSloX6slXUMzZDsMheanjq5Uk6WvJ3RQmKYknq0NTUG683gN1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a6F6c0q0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7692606A688
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 22:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7692606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a6F6c0q0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+hgKHcyIV3y0lt6m6leh7IpgVL7JTBHWn0bjXAP3f5pTe8MYoYUvVhQtRCT05mBMsoJutYqTCWhQAOuCVYEQ8kNToT8ktgK/mLBAldoBIrLaFhHoJcgpWt5uzHGa8tJEfxKpVVDuyMz4WpuT/2Dn0fRDEvOX5B+E5n+tpp5zLUSyg5jbQTFCoUOJQZ9vO+V9+Y1ibY6f0oV8UyUbAvzfbzxVtlA4Gd6FYfq5fnmkiYEUMiuuQi55uo3jy7RjW6l1yu5SHW+Uk+RGycuzLb9ty3UMkJdvzucD/J4pSeEewk3O0u0GKU3B1MRcrZNOLlRG2j/kNZ5phoy8Pna7/L2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S2X9l/co3NlWExor4qrt3VYHNmZrET4d5g5xi/+FlY=;
 b=MgjQjPlVYbtueY+zfBSR5AKq40pg79K/KxlvMdwri4N+VAw/Drp3v3OsNvyDQ23qZ/6g9N2WwNPb1c/Ll2IQSjpsH79TO3CLYGDIW5qKjVgiDC5s4g0kJ9sz9fQ7ZT19YnR4afz6WringLSNBZBt7sVCl367IK052cZRmCIocj0inQIX6nluLmkRlckPtIEV+Vtka02s3H8lQ+2eZm+zO7Oz8VNWdmv8LQk1qJiCQ2nWw9hb5Ql1YaCkYl2d0kUHkv/+TV3GK14KwIHrw2yWlBycQ27r11IWumvK1/QCeZH6+76hQ+tML7xlzCra8cRTCrGOXFfYDwJQKnUQKsDEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S2X9l/co3NlWExor4qrt3VYHNmZrET4d5g5xi/+FlY=;
 b=a6F6c0q0LZ8EsyAAI0ZWTaaghu5MnWVuYnEOEl6H2j+3zF9Bj9wCDDVwMT2eQAsjJBetpwYxTDt25CT+nkxKqSTAyMOWSWIa91naBsdusSg9hh/GNvhgR2T0dCDeZReqmZzE069cNJ9kPHVbKie7OLzm9nfbbCt27cDhUIds4PwolxtIb4Kz5qXzozttkToNFxNbbYNJf/RhxjiBrUnbjq/mLQ81gq1hqDLF3XV91Vn7iVVXobfnsgKaOFVEBX7ZP4Vi2tjmL1oJwBjxhWkUk87Ib7/n0tyOlvn27A+RN1csonaK4+nJbKZLrUo2m6q7KUwrQocg3CrSZAJXbgYeow==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 22:33:40 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 22:33:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: use the TLV heap sizes for pmu and
 non-wpr
Thread-Topic: [PATCH v2 3/7] gpu: nova-core: use the TLV heap sizes for pmu
 and non-wpr
Thread-Index: AQHddgRxHpucy/EFbEejJMKCGgD9crc2id4AgAEIeAA=
Date: Fri, 20 Nov 2026 22:33:39 +0000
Message-ID: <1f88322ae5c6d879b293b2f2a96a36413dbafef3.camel@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
	 <20261116195441.940595-4-ttabi@nvidia.com>
	 <DMZU4K5Y7ARN.24GTSON4AGVVV@nvidia.com>
In-Reply-To: <DMZU4K5Y7ARN.24GTSON4AGVVV@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|CY5PR12MB9053:EE_
x-ms-office365-filtering-correlation-id: b33ceb8b-4fac-4f42-9a89-08df47565374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|261021121427099003|261026121527099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 jcVaRoQmybKevZAP89+PjhAZxNkxw14LfxJSLDA7cP5i7blTNxlmOEUFmgqIIQFsi2tjf2eSC3pOaV6bit2odarj1TVgcrEv5SSMxBDK7qMZp/J1TpxeJVvk+rvD0AygKvQm4JsGHRhPCKtpThUfpm3iZKtf5SFqaTrHwxFoE7tjOiYxvorQywB4czquXVFHoy2Gf1HxxAcmunvyhWp+bKd2ISHNYCz1QqUUZA673m6RGCLoxekkYRE8AgnAMUzaxzvJi+6lYAq3EdQgIZKnRlfGTqw+66lUKGLUHJznw8rOLZUmJRsby/gdmFV3XP21SF6IMHW0d5CJHcIdV4+0dtBJBb5PRUE42CHH7S4DLtEwJMzoE6uKntwxkoYF4w15yLgWXaDAtWFL07D0NxliV/t0Q27Gy/iYgcyDA4bg6a8RcnAZxmndapiy0gsYaafnUltn2soyb67n3FREuNJGOIRrZj1S36rNQ4X0I7h7N3V9XNatqYKBh6OujyR8kPgdDrHS5JdGuQ7b3twCVCnjwk75JLCmIW7OzyTE2R89/NNSyVbSI9M5hBxmH1Kdzlo8rgtz73JHQUONxYSQmKg3S/BhXFJsBIo/wPubDFGMEp3jJMBJe6lmslnR2jNVs5TYb1U4uVGqVqXgF1/k4D2HBgK1NQuTMT7vp0SDDZTMhla0sn2CatCIrJdG9nP7VGu9uEH+VQUnCrOBK8VAAB3XSQE+wlV3zaIvsrbm0vo2k/U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1VJSHA4d05vWndpRlN2VWJCZU9ZWTN2T2hPUjhOb3lsUmtDbytEZHYvV0Vm?=
 =?utf-8?B?NVNuMllLdzAybWx4aitYNElBREExc3FyN3RZMjVmY3N6eWN3WlZqNllGM2Uw?=
 =?utf-8?B?dm5zdnRJekZ3L1Z4akFaNzdSNVJBMWliR0xSSkJzZG40VGJSUVpRb2M5bXA1?=
 =?utf-8?B?K3BWRTlKNVd3cnFNV0ZGV05QVTRQNzNaakNuRDBEWGtIaEdDWTAxa0dFTDA4?=
 =?utf-8?B?cnQvbW44WmJnVUV3RDhVWVVML0h0TFcvZlpiTDJ5c002MEUwSnBYTVYyKytk?=
 =?utf-8?B?bUFCeWFsQS9UbEplQVNhdmRYQ2VqcXhYV2F6dzJ4R2ZUcHlPSXVpdVl0QTBN?=
 =?utf-8?B?ejJKTkNkUjc5aVNKZTBvQmI3ZXRwQWQ4K0htZTVFL3RSanRBT08zUUlPUFY5?=
 =?utf-8?B?MWcreVk1Wk9RaUhlMXB6TUd5RTRKUGx3TUR6MHRqZTRUZWVlTmd6WFRWZkgy?=
 =?utf-8?B?dWxITFp4NEJyQ1dTbVFJbEFpYVhpSlZ6NGgxN3p1b3NVaGFOZlZzMFkvb2tG?=
 =?utf-8?B?NG9NbDBlaUxLYkthWDY5VTFPM2puS2R0NExURVFtQWJxenZ6TVQ1VXB4S0dV?=
 =?utf-8?B?MHlRWUxiQnpZUFJVR21XY0N4U2VGYlFMTFJrTkZoNi9UTDB0eS9waUFqU2c0?=
 =?utf-8?B?Zjk3TkZoVjhGemN0SWNBZzVqbWI4YTFWTjZVbjRIUUI0eGhCdzluL3g0R2JH?=
 =?utf-8?B?ekE2ZHJnb1V1bE15ZHRSZ21GWXNsYWI5Y1J5bm5scXBHL3RBTm9ndmd6czF1?=
 =?utf-8?B?RW9aRlkyc3RGbVptNXQxNnhKSlk5Nk9jNDdod0lYWXJMMUNGWCtYTW5zWVRl?=
 =?utf-8?B?dE1lVDhPYVVQVlpFeXRRUEVYL2FIR0lMUEI4R0Nsb2FEZFpvVzdEU0xDSnll?=
 =?utf-8?B?VTdrT0RWSWZDdVBVYWlXL1VPaS91T2JVclZRaTBqYTJjd0ZvTW9qRVFFZVJn?=
 =?utf-8?B?NTNXVng3TVZXUlVaczN0YVRuMW84bmZITkJCWWZES2JnVWx3OFVjRmJXaGw5?=
 =?utf-8?B?c0IwemhEL3cxemtLYUJMaVRodHRVcHlMTjlvZkg1UTVtNUFNRGJtY2JVZ0RR?=
 =?utf-8?B?T0FIQzRPN0w4VVBWVW9rUHIzUzFBOXpkT3VoWFlaZUtLdHlVUGt1R21rMktn?=
 =?utf-8?B?VkZFd2VjVHNTMGxKRTZWTE5wNGl3VzlRZ0hNYktqaytBc1liampTMC9GZEVz?=
 =?utf-8?B?TThtSG9jQkNEbmhoZDdwOFkwelNyN1M0Wi9pbGljckY5NkJxZ0J1RzVNZTJC?=
 =?utf-8?B?VWZhQ1hqN0F4ZkYxTjJWeHRXZCtaRVZNa2RFSm96N3Q4dEFiM1g0bEVXVDZo?=
 =?utf-8?B?c1E3K04vRnhBdzhDY1hKbWI4QlYvSTdYZGxRd2FKQ1JEYUJPeEZ2MjYxL2ls?=
 =?utf-8?B?Q2g0VlQ3YnJvK2ZCRkVIL0x3OUNlTmF3dHh0SkozSEpSd0IySFlMNnRvS1Er?=
 =?utf-8?B?TEMwWDh6cXcxYUpRQUl0bjI2VXkyWmp5K1dHVzIweU1CQ3ByZVdYeTlLSGxs?=
 =?utf-8?B?NjdjN0VVL0dBTzRPQVh0R0NwNzlpdVAzNGtpYm1YR2d1N0tMT2JXam9mWTRj?=
 =?utf-8?B?TGJoZWk0WWZqSFNISDNjNml3K2NJYmlubndnOHlVV2FaZ3RNcGpLYURYc2Nq?=
 =?utf-8?B?VWlnTS91MWpRNnJWZE84NVhNRjRTb1dmbTRZdjFxL2lUKzNTbk1DRVEwTXBj?=
 =?utf-8?B?MkRoUWd1M1pyUEhJZFMwdXlmajFtVEVJUDh0Q0Q5SHJsU0EzNGR4b0d6OGZG?=
 =?utf-8?B?elBndEV3TFlIQmFFb3Q1anRzMUtESHpCaSszMW40cjVTZUxzNDVvbmh2VXd4?=
 =?utf-8?B?WXJFQTJQc3FFR2tZTHlqZklseWFjVDBFL3VBaHhqNWRHS3J2eGhCV1hMT0Yr?=
 =?utf-8?B?bThieVJpaGoydUI4SEFqQTN0bE1QR1dpbkh2QlozaHprT3kwYlFIQ2FjVnVs?=
 =?utf-8?B?dUJVTk1NWmhqU0J2VEx5OXdmQjYzNHZ6bGJFVmlqU2Rjb2IzcWRLcURpMTJL?=
 =?utf-8?B?cTI3QXE4Z2xCYkdBWkE2ZUVXdnpKQlVaUjZTcGRqMmwwdEtzNjRqM1UrZUtw?=
 =?utf-8?B?dzhHanFWMnZ5RU5LME5WZC9xRWZXUmhSeWQ3UkJvSHBUcmNwLzhsTlUwVXN6?=
 =?utf-8?B?Q1BEK0JLNjZxYzl2U3hZSFRqb3RwQ3NPbjZ5NWptQzRLR2FPb2VEZE52VGZh?=
 =?utf-8?B?YlRrQ3pQTVJJQURhUkxIV1pRZkozbG9NTXkzNDZsZHNnWlQ5NENRcmduczRQ?=
 =?utf-8?B?TDRxSXJoYTZDKzN2VndGdnV4YU53UVJCaVJEaTIyWHZjTW9RYVZDUExCVGQw?=
 =?utf-8?B?UnZHbW1IeENwYXNZc01tNUFjY0JiaFhlVThYYk5QNmhoMDRMS21Idz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0A8D7239558CA4ABF5B5E7EE1AF6B6E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33ceb8b-4fac-4f42-9a89-08df47565374
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 22:33:39.8893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1B47stVqjo3LAApRJwp2qeo+z91Aby9kaJxkhAgjdIdwEhSwVVIgnoYQL8A1ONlnEg35HG0jbZWzhXn4aP0dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE1OjQ3ICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gPiAgICAgICAgICBsZXQgbm9uX3dwcl9oZWFwID0gew0KPiA+IC0gICAgICAgICAgICBsZXQg
bm9uX3dwcl9oZWFwX3NpemUgPSBoYWwubm9uX3dwcl9oZWFwX3NpemUoKTsNCj4gPiArICAgICAg
ICAgICAgbGV0IG5vbl93cHJfaGVhcF9zaXplID0gZ3NwX2Z3LmhlYXBfcGFyYW1zLnRsdl9ub25f
d3ByX2hlYXBfc2l6ZTsNCj4gPiAgICAgICAgICAgICAgRmJSYW5nZSh3cHIyLnN0YXJ0IC0gbm9u
X3dwcl9oZWFwX3NpemUuLndwcjIuc3RhcnQpDQo+IA0KPiBOb3cgdGhhdCB0aGlzIGlzIHVzaW5n
IGEgZmlybXdhcmUgZGVmaW5lZCB2YWx1ZSwgaXQncyBwb3NzaWJsZSB0aGlzDQo+IGNvdWxkIHVu
ZGVyZmxvdywgc28gd2hhdCBhYm91dCB1c2luZyBjaGVja2VkX3N1YiBpbnN0ZWFkPw0KDQpTdXJl
Lg0KDQo+ID4gIA0KPiA+ICBpbXBsIEZiU2l6ZXMgew0KPiA+ICAgICAgLy8vIENvbXB1dGVzIHRo
ZSBmcmFtZWJ1ZmZlciByZWdpb24gc2l6ZXMgZm9yIEdTUC1GTUMgYm9vdC4NCj4gPiAtICAgIHB1
YihjcmF0ZSkgZm4gbmV3KGNoaXBzZXQ6IENoaXBzZXQsIGJhcjogQmFyMDwnXz4sIHZncHVfc3Rh
dGU6IFZncHVTdGF0ZSkgLT4gUmVzdWx0PFNlbGY+IHsNCj4gPiArICAgIHB1YihjcmF0ZSkgZm4g
bmV3KA0KPiA+ICsgICAgICAgIGNoaXBzZXQ6IENoaXBzZXQsDQo+ID4gKyAgICAgICAgYmFyOiBC
YXIwPCdfPiwNCj4gPiArICAgICAgICBnc3BfZnc6ICZHc3BGaXJtd2FyZTwnXz4sDQo+ID4gKw0K
PiA+ICsgICAgICAgIHZncHVfc3RhdGU6IFZncHVTdGF0ZSwNCj4gDQo+IG5pdDogYmxhbmsgbGlu
ZSBiZXR3ZWVuIGdzcF9mdyBhbmQgdmdwdV9zdGF0ZQ0KDQpPay4gIEl0J3MgZml4ZWQgaW4gYSBs
YXRlciBwYXRjaCwgd2hpY2ggaXMgd2h5IEkgZGlkbid0IHNlZSBpdC4NCg0KDQo+ID4gICAgICAv
Ly8gUmV0dXJucyB0aGUgYW1vdW50IG9mIFZSQU0gdG8gcmVzZXJ2ZSBmb3IgdGhlIFBNVS4NCj4g
PiArICAgICNbZXhwZWN0KHVudXNlZCldDQo+ID4gICAgICBmbiBwbXVfcmVzZXJ2ZWRfc2l6ZSgm
c2VsZikgLT4gdTMyOw0KPiANCj4gVW5mb3J0dW5hdGVseSBNU1JWIHJ1c3QgMS44NSBkb2Vzbid0
IGhhdmUgYXMgZ29vZCBhIGhhbmRsaW5nIG9mDQo+IGV4cGVjdCh1bnVzZWQpIGFzIHRoZSBsYXRl
c3Qgb25lLCBzbyB0aGlzIHBhdGNoIHByb2R1Y2VzIHNvbWUgdW51c2VkDQo+IHdhcm5pbmdzLiAg
SWYgeW91IHdhbnQgdG8ga2VlcCB0aGlzIHBhdGNoIHNlcGFyYXRlIHRvIHBhdGNoIDQsIEkgdGhp
bmsNCj4gaXQgbmVlZHMgI1tleHBlY3QoZGVhZF9jb2RlKV0gb24gcG11X3Jlc2VydmVkX3NpemVf
dHUxMDIoKSwNCj4gbm9uX3dwcl9oZWFwX3NpemVfdHUxMDIoKSBhbmQgcG11X3Jlc2VydmVkX3Np
emVfZ2IxMDAoKS4gVGhhbmtzIQ0KDQpXZWxsLCB0aGF0IGRvZXNuJ3Qgd29yayBpbiAxLjk0Og0K
DQp3YXJuaW5nOiB0aGlzIGxpbnQgZXhwZWN0YXRpb24gaXMgdW5mdWxmaWxsZWQNCiAgLS0+IGRy
aXZlcnMvZ3B1L25vdmEtY29yZS9mYi9oYWwvdHUxMDIucnM6NDU6MTANCiAgIHwNCjQ1IHwgI1tl
eHBlY3QoZGVhZF9jb2RlKV0NCiAgIHwgICAgICAgICAgXl5eXl5eXl5eDQoNCkkgY2hhbmdlZCBp
dCB0byAjW2FsbG93KGRlYWRfY29kZSldIGFuZCB0aGF0IHNlZW1zIHRvIHdvcmssIHRob3VnaC4g
IEknbGwgcG9zdCBhIHYzIHdpdGggdGhhdC4NCg0KSG9uZXN0bHksIEkndmUgbmV2ZXIgYmVlbiBh
IGZhbiBvZiBhZGRpbmcgYW5kIHRoZW4gcmVtb3ZpbmcgdW51c2VkLWNvZGUgYXR0cmlidXRlcyB3
aXRoaW4gYQ0KcGF0Y2ggc2V0LiAgSWYgeW91J3JlIHRlbGxpbmcgbWUgdGhhdCB0aGV5IG5vdyBk
ZXBlbmQgb24gdGhlIHRoZSBSdXN0IGNvbXBpbGVyIHZlcnNpb24sIHRoZW4NCm1heWJlIHdlIG5l
ZWQgdG8gcmVsYXggdGhlc2UgcnVsZXMgYSBiaXQuDQoNCkp1c3QgRllJLCB3aGVuIGJ1aWxkaW5n
IHRoaXMgdHJlZSwgSSBhbHJlYWR5IGdldCB3YXJuaW5ncyBsaWtlIHRoaXMuICBJJ3ZlIGp1c3Qg
aWdub3JlZCB0aGVtLg0KDQp3YXJuaW5nOiB0aGlzIGxpbnQgZXhwZWN0YXRpb24gaXMgdW5mdWxm
aWxsZWQNCiAtLT4gZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9udmt2L2VuY29kZS5yczo0OjQ1
DQogIHwNCjQgfCAjIVtjZmdfYXR0cihub3QoQ09ORklHX0tVTklUID0gInkiKSwgZXhwZWN0KGRl
YWRfY29kZSkpXQ0KICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eDQoNCndhcm5pbmc6IHRoaXMgbGludCBleHBlY3RhdGlvbiBpcyB1bmZ1bGZp
bGxlZA0KIC0tPiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL252a3YvZGVjb2RlLnJzOjQ6NDUN
CiAgfA0KNCB8ICMhW2NmZ19hdHRyKG5vdChDT05GSUdfS1VOSVQgPSAieSIpLCBleHBlY3QoZGVh
ZF9jb2RlKSldDQogIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeXl5eXl5eXl4NCg0K
