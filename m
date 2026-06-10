Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82412110E
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781117947; cv=fail; b=MqZdRbKRr/6tr9KvW+ZxLneVHUDCDsSSiLPRyV95VKokEL3p53u26dCNjx7rCYI2bWB4ihABZdYQUCH/61dsXIFswxT6q6dIsrztoc1bhi0YEANG4JOLPd5yOy92Fa7IfqTierOqBP3PakoDLs3AQr/g3fTJ8+4HINcynkCJ4bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781117947; c=relaxed/simple;
	bh=/V9kf9Jtuw+yACs2TWUyK8sj9ADpoWPDBdMOMRauIyA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QcxM6XZJwBBiX2i47xcqVVoG5p/FUmw+yb2tUjFrdTeDiyUk1N1g5aUtOS4lpEUfiWmbSgAH9M8jtDC0OeCztnM1n7W2kKRZdYpHjgMRjjvwBixioI/Q4lGdtUnTg/f1XaNfGlJP1io96z3RxlzlrokjGX7g7yggMXhlZBAjjjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YFR3tGBG; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YFR3tGBG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcBijFbjpf7qfEBTnmzNu5+SfFDUTdAHvE7DNyzNMG3B8mI4jTEYZ3NkqlqJIeHuatsR2s8Io5WWA98VC+MapUMQxXzp25n761P5i6IuO+8kFRfTAHjllH6TTCyEWHJgsv0GpOEoQip6vLyjteH73ZxwFDWkuP6z7O4UKMPYkb3DjZ7LijwcR5DWKUk6Ng7VCFRC3XsM6nt4fERUvkEwNrVdalJPiFVtiWzMxU2Vw5px5ftTW/z4aFGsFVnrZB22+A654BOmTK2hMotlN0I8R7L+SoN6xCxlY0/ip+avcf7nSboYJ4EIJDniQLlgTbilzIvyZoDz6lEL5ATZH+F9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V9kf9Jtuw+yACs2TWUyK8sj9ADpoWPDBdMOMRauIyA=;
 b=v8hzGrlX0fP0itK2SIkSnpQ2G3BYc1s9ZB7BaA8pTOs2hjsY72MpqhTl18cigJsaFXEJj7woViwsu1iKWNst34qA5N1jALlll7dxYw4aFisMn4ftele0JCdw8MnRoJyn/JWht55JMQCDLQd/pE0u3KnGL7lxBWYAI4H4jw4mb5xHhdROuV0rHXmwERzqmuNg6TFRXWiwwRQIs7R42CxiJw35MZUh/7btqxxHmpt2pooSf/hcuXuqvhQWPzkW1BAV8nO+2m2/1bNQhlvgDvxmjngDFYWQqk2LhQLnM9r+jjfaA6R/Rioj4qW+p7ur2Y6P1qbNs0UF4Uy/zw0Gsh1nKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V9kf9Jtuw+yACs2TWUyK8sj9ADpoWPDBdMOMRauIyA=;
 b=YFR3tGBGxeZwTR91WR66ROtT3FcZvU0gX/kFN/uIz+X3D7jtp724DoJOnzksbheFye13a+OvPq814vgh915zE4QJZHafjBo+h3y8vo1qydd7PU8R9Q7zjqNcxfZjQjzibbdK5JPLMd4VkHE8VO2Suw+nbAbN5yk9dABBD1nshRPWd8h11v6JtlEqRwlh2VRuCYt1WWphDQXk1RV9YFoiXUCnUVXPZMpartI2yB/+dHwjjM+bxOvcnfpneLJswtoJM1/+oyGHg38PlBle8PkBFTyPMLNp4Ows/DtS95hUSuWj4Pivd3VIMRsMdYSry9shyuPsUCPF+j0+ZRV3ik8dpw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 10 Jun
 2026 18:59:00 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 18:59:00 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Topic: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Index: AQHc+QGRtz2UsSKeXU63ddOrzskdkbY4GGIAgAAA3gCAAAshAA==
Date: Wed, 10 Jun 2026 18:59:00 +0000
Message-ID: <ee837d41f188af34e1d78231987b48a9cc287172.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
		 <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
	 <4c9168113597793d01fe9f3d60a5554cc1895433.camel@nvidia.com>
In-Reply-To: <4c9168113597793d01fe9f3d60a5554cc1895433.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CH2PR12MB4280:EE_
x-ms-office365-filtering-correlation-id: 7d4f04cd-3715-4cec-d46f-08dec722554f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|38070700021|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 tRaAmAXT6+J7ahELUuvOuyGcCVR16QXP2OvRD7uNDOT8xREJmBH7uta8ivIRgx/c3RkKlEgs3gayNZGbRshJEj1IaFJXV9KiXbPw0idXH1/hOdQCsvZCmyAaw6iIMSu/Uv5uv89JMwwpmhpu4gNk9AS24ojoX+NzA7eL8QBzN3RwdePlvzVqy5FBpQiuvrikLToGsGWrJ900mvcJagasRg3+jjxLZ75WMIpwQW7yRVn+kEE9LhxAerx4TIdjA9iUMKW0BBos5i0OtLv1eeulKN/ijSlFElDc4PzqlqAuS43pS2wmm9ceuCH//BwrLk6VJ3ONCV3r2R2FV26PS+M+WaXUOL8NXw1MJHbgfnre0jJMYei7mgG7KFNq/WmHiZw6+YhjPaqpwAP/xMjsIOs3J3UHnJ5xdoOBzdCyl9nmEQEVk5h//PjNTT/arA0H6dFglNgMnN4p4KjbnaYxcfCHsiTmShJVEQnuS+bynf+fc/SJLgutYgDeQA7mPGosXJCjHbfIUFep7KzdBhmnVEI0z1r62wMOnUpjSKJ0awIZSeuHNzkvHqpeWQ9LWQNidEZw8Emh7Bka1n1I5/CTWPcnPqwBPLNN3UYsEBx/zRPKyzBGgkGeqrfwc6Y9svNMg4dJO/pDAh8E1WND5+nGYNP5tAxJYLPD1kIr8fBHzQE7wFrDV5GdHShcH/xgk3xOWN5QtN7/TdLLtyop9zDwLpY5VhwunnFmpsUEFAnIgfA0FyrjlfbyDAFs0JaFijwnR+IM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(38070700021)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ry81T0dpS1dRNEUzRkVGUUhWL0FrLzhYZXNoZ1BibEJINWZOUU5rRkI5KzVa?=
 =?utf-8?B?VE1tMUhjZTdhdytDNmtUYlFPYzE0NGdHd0hsTHVMZkVHcHI3Q2dMOUg1QlBZ?=
 =?utf-8?B?RzZQZlcrRzY3eUhXOUhRN0g3akdzRDVMb0NXM1dKalhETUJCT0RiTy9DSjJM?=
 =?utf-8?B?cGNoQ3NOZElYV1NpMy9vL0hYL3liK2FnSzBXM1BYVmQvNjRHM0RIUTI1ek1S?=
 =?utf-8?B?UG1sazJ5UU9NTWtFc2o3eFN5bkl1em1RbjM2YXJtcEZDNE4vQngydzduUDZY?=
 =?utf-8?B?V2c3YmJUclZaZGFxZzBHTjg4SGNyeTZaMk05dy9YbysrRmcydE00d1JDd1JG?=
 =?utf-8?B?Vlp1TWV6b3A0Um9ZVzc3R21mdi8vN0FrTnFMS0NkTkxOS1poY0JFTEpKUm80?=
 =?utf-8?B?WmJUQjQ1Zm9YQWtSME96Wm5ibmNqNGREMjRtS3RJdTBGaUlaRldJbTZqdTF1?=
 =?utf-8?B?amVtK0NVRDJMNnN1ckcvQ1JFV3pMS0svMG5JaVBsSE1vUzhNUmFVVDVTUDBP?=
 =?utf-8?B?aXlPajNROXRjeGV1ZkxQeitNYlF4a1orczBGUk5GQWJDbHN2ZHROc2xmcmN6?=
 =?utf-8?B?MGpucnhuSkhyczBnN0ZqdEhuWkxLZWpyMmdYeWxTckVqR0REYzQxUUFhZStG?=
 =?utf-8?B?bDljMmRGcFRuVTh1REUvc3VLVU43WUFnUlFlRjNMZUNyVHJEOVBENGZXUXVo?=
 =?utf-8?B?OVEwS3g0ZFFOL3lCSVFzTGJlM214VnVza1U2Yi9VTktFb3dpZ1Eyd1l2S3U3?=
 =?utf-8?B?ZGhVUXJPMUZxRHpZK1Bwa3ZvSzZjZ1dTSS93QnFKbWVWUmowMUtZSVhJYm5o?=
 =?utf-8?B?b3NPUkV1NnFOb3dYWFdTeUtja0prTkVBZ3BBVE53LzA2WnFER0tZdkJSQm9a?=
 =?utf-8?B?TzJPOVlSK3RFcVRxRTR2ck4xUzhuaDZld3d2UWx6RXpVaWxzWDgrSHl0Y1pN?=
 =?utf-8?B?QWJ3bUpSTDdKb2ZYU3czZUpWVWRzd2ZQeStCRlRnR0RlemV3Y0wzMUxmOVp0?=
 =?utf-8?B?MWZraHRLNUUycjhQL1R6SWFZTEY0WmF3RHg2NnFwbmNpQllZS1VQMGU2ZDhW?=
 =?utf-8?B?Sm0vMUdRUVJ6VWNEZ2NWQ0RhS1l2b1gzZ0NUanlZZ0Q0LzN3cmVYaEkraFZC?=
 =?utf-8?B?Sjg0NkhSTi9SQmpPL2lNK3UyUVUydGRJV2RxaFNSQzdiL3crQ09TYytPSith?=
 =?utf-8?B?VWw0WjhkTndVNlU1ZTNlQmlNMXowd0lnUFNRVlFic1BFSXIza2w3aW9pSlR5?=
 =?utf-8?B?T3cxV0dGV3VMUTNxU1ZjdGlNdEtQa1pDdFU5eDN6Y1lWWFFCbm1PUlhkZlpT?=
 =?utf-8?B?TDZvTnZxbmpodVFVSUpoY1hWS2FOWERMNzdOOU9iVUZ4UVovUDlQTkRkS3g2?=
 =?utf-8?B?N2doWWJuK2VBTDZIZ0dBY3Z0VkhFaHZxQWhkZlhqVlBieW1sTEl6TzdkZTdT?=
 =?utf-8?B?aE1LczZsaEEvR2hXQWQ1Nm9zczBEaTlnTVNjUmVCbU81aElPemtkYmdIVXg3?=
 =?utf-8?B?UFlKT0ZVQkwxdkFiallzbkhXUFl1SVc0TGl2Q3MrbzdMOWVRQ3lEbjNKMStm?=
 =?utf-8?B?bWdXZ3Z2ZFdIdDhKOGNBRUNzTXZNTkRIRzUzSGpDankyUmhBOEtTS0tPV3ZG?=
 =?utf-8?B?ZG1hVUk2VFZNL2RwUlQzbU5RL1NzQlV1Wm1QMEVUR25PZENId2c3eFJYUVJH?=
 =?utf-8?B?enBZajVxaWNKUnRvRlZKN0NST29ibjhFZ2g4YUI1eXFVSk5zTnNMYkNFR2Ru?=
 =?utf-8?B?c2k2cjZFWmJTVUxjc01ZVlozL2pLN1hqVlZhc2c0WWUvVXFNVG5rUkRwUDlB?=
 =?utf-8?B?dTBBWFFnZVhaOWJ1eFpqeHhLdUVJdzhwc2d2ejhXcTR4Y2NDeGdaVHA1Yno3?=
 =?utf-8?B?UkRROEZuaGhMeCtwbEhlc3I3aXFLSC82T2ZPZDJ4VG5ucTFDRkxSOHVoam1F?=
 =?utf-8?B?QkE4ekt6UDd0TU1jVjhBcFpndWRjMS9oR3JiWFR0YmNQcmFPU0NGSzRwVHdu?=
 =?utf-8?B?dnhTRys2RHZOd1U0SEZWK3VvZ2JhcE5EMExCT2NhM3FTRS9UMVZCSHhIeE1a?=
 =?utf-8?B?ZFZCWlk1UitkaE1ZN2ttcG5kUk05YUw4TEZjRk93SkFiWU5MZjJuanIwMEJJ?=
 =?utf-8?B?d0o0TGFZOXc0bjhjZTExdzlhZ0U1NEVObDNXa21GUW4raTBwdWpVdXJXY0xu?=
 =?utf-8?B?NUxwbjkxanBQVVBjL3ZtUjRKdUh4Tk1rM2lYWElMU2xROEdhSjNVUnVhakJF?=
 =?utf-8?B?NythOEI1WS9keG81b1Y5Qjc1a01vV0pGN2VkWnIzdUVnZmZma1Q2K3cvbHN2?=
 =?utf-8?B?MlB5V0hGYytIMS9mZnRsQ3IvQmhXcjIwNE93MlR0T3prQzVicVc1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ABB69834F10C74693FA049176D8CA2D@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4f04cd-3715-4cec-d46f-08dec722554f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 18:59:00.6714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9U9lmdgN1wOtkl7qOQJG7KACwim1ifPZqt3axSI5NZKHteLVNU8IVbTrLS4bilo9MJi87QXZdFVpkJyYoNVn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDEzOjE5IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBZ
ZWFoLCBJIGp1c3Qgbm90aWNlZCB5ZXN0ZXJkYXkgdGhhdCB0aGUgc3ltbGlua3MoKSBjb21tYW5k
IGluIG15IHNjcmlwdCBpcyBicm9rZW4uwqAgSXQgbmVlZHMgYQ0KPiBzeW1saW5rIGZvciBnc3Bf
Ym9vdGxvYWRlci50bHYuDQo+IA0KPiBJJ2xsIGZpeCBpdCBzb29uIGFuZCBmb3JjZS1wdXNoIGFu
IHVwZGF0ZSB0byB0aGUgZ2l0IHJlcG8uDQoNCk9rLCBpdCBzaG91bGQgYmUgZml4ZWQgbm93Og0K
DQojIGxzIC1sIC9saWIvZmlybXdhcmUvbnZpZGlhL3R1MTE3L2dzcC8NCnRvdGFsIDEwOA0KLXJ3
LXJ3LXItLSAxIHR0YWJpIGFkbWluIDU5MDY0IEp1biAxMCAxODo0OCBib290ZXJfbG9hZC50bHYN
Ci1ydy1ydy1yLS0gMSB0dGFiaSBhZG1pbiAzOTA5NiBKdW4gMTAgMTg6NDggYm9vdGVyX3VubG9h
ZC50bHYNCmxyd3hyd3hyd3ggMSB0dGFiaSBhZG1pbiAgICAzNCBKdW4gMTAgMTg6NDggZ2VuX2Jv
b3Rsb2FkZXIudGx2IC0+IC4uLy4uL3R1MTAyL2dzcC9nZW5fYm9vdGxvYWRlci50bHYNCmxyd3hy
d3hyd3ggMSB0dGFiaSBhZG1pbiAgICAyMyBKdW4gMTAgMTg6NDggZ3NwLmJpbiAtPiAuLi8uLi90
dTEwMi9nc3AvZ3NwLmJpbg0KLXJ3LXJ3LXItLSAxIHR0YWJpIGFkbWluICA0MTUyIEp1biAxMCAx
ODo0OCBnc3AudGx2DQpscnd4cnd4cnd4IDEgdHRhYmkgYWRtaW4gICAgMzQgSnVuIDEwIDE4OjQ4
IGdzcF9ib290bG9hZGVyLnRsdiAtPiAuLi8uLi90dTEwMi9nc3AvZ3NwX2Jvb3Rsb2FkZXIudGx2
DQoNClNpbmNlIEkgZGlkIGZvcmNlLXB1c2gsIHlvdSB3aWxsIG5lZWQgdG8gdGhpcyB0byBhY3R1
YWxseSBwdWxsIGl0Og0KDQpnaXQgcmVzZXQgSEVBRF4NCmdpdCBwdWxsDQoNCkZvciBzb21lIHJl
YXNvbiwgYGdpdCBwdWxsIC1mYCBkb2Vzbid0IG92ZXJ3cml0ZSBsb2NhbCBoaXN0b3J5Lg0KDQpB
bHRlcm5hdGl2ZWx5LCB5b3UgY2FuIGp1c3QgZG8gdGhpczoNCg0KY2QgL2xpYi9maXJtd2FyZS9u
dmlkaWEvdHUxMTYvZ3NwLw0KbG4gLXMgLi4vLi4vdHUxMDIvZ3NwL2dzcF9ib290bG9hZGVyLnRs
diBnc3BfYm9vdGxvYWRlci50bHYNCg0KVGhpcyBzaG91bGQgZml4IGl0IGZvciB0dTExNiBhbmQg
dHUxMTcuDQo=
