Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7070395AD4
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196314; cv=fail; b=WZLNdyN7nkRMKuoCJYHbukNsrQ1BFuX3s/bQOBoEo8pCoEGt3Js5AJtsQ7zwNewEsFmvL52Jl+GB56GoVgkPjgaDYh041nKed/6NT1mJRlTUS8Zl6o2CpZpxQEb+KMBCs/XQWqBigkHQf1YJbODp2l6SWdJFrX1mxLgXt0ouY24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196314; c=relaxed/simple;
	bh=LrLgtLcJ31GtNEqAKDlF5wH+NOun593gERBDtgxHjh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JwFiJ2QwGfJ2FGcd5AkqKSFhdtqzqk/PDjwI8IBzyMD4VzhMQdge0nDGa/leMA4D1AWdWJdsoplHIR072vNranf1P7gIghDX8N7AnWXBvQNxZJ4y+VaPbfXajyJSeQO26SPBHPViUL844ovL3jXHdVvtVQ+MOkeElo+oxxaMWic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aEFCuJLz; arc=fail smtp.client-ip=52.101.62.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aEFCuJLz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhmU37PbvxxURsqKJU+l67aYjKdJZmH8Gs+aCEmzHmb66YtIQwzusO+mWdqiKmZ4UFaA8E4mstn3V+tvSxNO4xwqw6cYa6aFA9i4o6jVM6nA4gWUNisjplHX/6QPip5cCeEDHbqN7Vhl22Lor/dmKfhFI0TX7EQ+SzKqQR3n3ZmAM3Fc+GGVEPqSGp7vtONbPH8rohcj4KF4r7WdECPjMha19HWUX5zH7bJa6nKfaa9tvwXj3KGV2CCJ8rns6J4QJz1mXw8Eoh+ub7ixs9sY1Mp9xzBcY7wwfBrX9/YruFL6cow/WyWiGdwlP2satL+NPHkL2LN2j6/7muqrz71U5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrLgtLcJ31GtNEqAKDlF5wH+NOun593gERBDtgxHjh4=;
 b=qA884NgJ4iWQDZdUCKeS4B4w3C6L1B5qP/2NGMYR4XeX/eHBGyfLnChLscCsSZLKtYa/HjR8r6YlUl4NMV2MF/aNdkjBmW1cAtbmC7UDmGxmVKiiE5z0ZEvlb9cTHuiOwEepxMfGRll046faP2SVuu+xrEm/K8dVGuWUwRIkRhX2lCHcHM/8G8JNoYl8zgExilsTNXAsiDMmpnnCjNPh0ZQve71sWymOdy9ejGxj/SIHmp6ycXlqgjs6mIEVbzd/QUqBntRgWM6ToUCOfnJpQeFdzXyNcPY7hknwomtjh+nMN3c5ZfIQpmLHgEVlymGJcbizqfZoiIedimUchV3fqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrLgtLcJ31GtNEqAKDlF5wH+NOun593gERBDtgxHjh4=;
 b=aEFCuJLzTSHbCFdLQb/87Owl98Uad5Fe/+0c1ePOkn3bpHAu4R7zUBroMKzxo96EXRivWGVgWJv1pCWlFZJ+YYV/E+SjrJ76s31Nx2mmF3JJkldBhDQxIwV/tNGcql77KI4RV83NyHN3uRGBLYCBY7668SgbA3N95VTD2+cGr/C5rDuHaNLj6sMXXXbj2Eyle+KZxIsizWq1AEKafwxGlvIrKpEPb78YauqBOVpcjjxWI38aTjAoxzpZmE7HKn/3HMpmq8UTYFOECrZWUgh4vCHJWh56xl83r/MlSIkGIjR3y0zRowZpydITNUcR+x4JOtAeoHxy6l56AjPJu8xXaw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:45:07 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 16:45:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Topic: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Index: AQHc+QGVpGov01rLA0+kZCzkLFfG+7Y4Vx4AgAE6LwA=
Date: Thu, 11 Jun 2026 16:45:07 +0000
Message-ID: <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-3-ttabi@nvidia.com>
	 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
In-Reply-To: <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH0PR12MB8098:EE_
x-ms-office365-filtering-correlation-id: 9da7a68d-56a9-4686-7bcf-08dec7d8cb71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 lF3okgtLD7gi+JBxjC7qUi8fX8rbSJl9t92S+ikoCvzlRT9TCoaYE9hFteM6hxbeZLS7NWjBzZ5AZpmpYzzJj71St3nO2Py4wvQlk0zDOchjorxhsT5FXBBq+QhcCjVXAVL599ewl8Z7Fn3GH4LAPKOOgJKd5Y2XMbOfh41qooFsdztpSMErLjJzpj3qYec02JlFDxvUMkeL3z+moLsk5PhiZdOMf8UblIma2iPt/Kk0jktjubu0dPbBgM6BVYW7DeutxXJfG6Hy0S/1zdgPECzjGfKrGklrV8UvgDYfbfbNfyej6viOacj7i3N031mIfpITUwnEO6zcRRke1r42JKGREU9AWcsarUQplv1n0FjUJcvtOB8ZPvd3k7tITfRaef41AUXzLT7+23zdqk1r+5y+x8PkLfkwmNd939XqRh2U8t83gyXIePXTZs9EF/nmJ3W/SRzC4daG1X3eKd13ph8RWcyU+881Xwx47jL39QhAzRS5AdT4rH147ASom9nR3783OypC87UE50ttlO8eJdImDk1sON9sV18+gKtO/deZsG93x+n1E1NXZz4E8mTq6LGND2C7DNUx4DDOpy5tKdoYjfpi/eRnQdh7Yj0CXHM8uS1ZAd9hP7vvLgxazFNbAq5Sl6Rr6eZfs8hbpN4s9lQJB7b6NOgEJ7dFlco5wUMtZdMii6n1IW0fxQ0Bcw97Yxv825+Elcm37JDQ2Gp80nxfj+5Jjn4J7mCzi9UHCawndgvBBrZnf+HkUDXolAva
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzJ1RUJhUjZGTm1kaFptTHgvbmlaUm44aEtaZmovSDhTQ0U1a0RSMGZJVk92?=
 =?utf-8?B?cVpBWFNLTnJiTVFvU2sxZEMrUHJweERiRlc4cHlSNkc1Q0dWeElwcHU4R05T?=
 =?utf-8?B?WFVGUE9NTEszNEllZ1pTc200T3c4TnR0ZTA0eGRlUzZvczNIK296UFdLRHVv?=
 =?utf-8?B?TVFrR3lvY1A5NUpoYi9zZ1hwNW5LaGlaZkx1ZXNMRXc3T2Y2ZExKc2p2enc1?=
 =?utf-8?B?ekUwSWdQMFhGWkNXMHN4ZnJiNHRkNUdVUlhDQ0ozRkhiNDFNNWltVEtVOE93?=
 =?utf-8?B?OW5DV29KR2ZGbTcwbXVRMWY0QTd5WGNLa21mZzhnQzNxdll1dDdpb2NQS0Er?=
 =?utf-8?B?WmtJeHVYRHMxR0FnSElwSUthU3hibzVDbFlJamZHVTRxYVFQaDN0MDVHRXVQ?=
 =?utf-8?B?Ly9zSlZ2QTRzRnVZS1dCWVRMMng4Qy9IcHhoYUJ6bVIxaWNVRU95WE9wTmpp?=
 =?utf-8?B?bi9mckVUanNTRUx1WXhkbzhwUlQ2cWYrS3VpMUtIUXkrSSs4TWlISm94dU9j?=
 =?utf-8?B?MUd2bUk4aTg2NU9LWlNHS2hVd2ZxYk5hUEh2NnpLTW1XWTVPeWNGSnJJZm52?=
 =?utf-8?B?RE5ubzNNeFhZN1psZE0xdFkwREpVRkl6azg1a0oxS1FpR25zcThLdTJLYTE1?=
 =?utf-8?B?YUFvSkpXUmpBa3hSWW9MUXJzOWlscTZva2lwQ21uWm1BOXh3UnV0V0l4Q2R2?=
 =?utf-8?B?RlJ2TCttNzBRdDY2RzA2bDBkSzBoNW83RjN1cVlZWmxhT1padmo0OE5GelZp?=
 =?utf-8?B?cDNoUW9EMVlaTzRoQ3ljQWxrUUdFdTk1VFo5d1NSUlNHL0EvZ1hSeTc5bTJR?=
 =?utf-8?B?SURjdVlaSmNINUJ1Mkd3RXVaZGVRSU9jZlgvKzc1U25HM09UR2VrY0dSRWQw?=
 =?utf-8?B?YW9tbDQydGhsY2NGOUxPVTA3RHBkLy9lSWFsWU9lWDduSVQrZEk4Q2RyOWpP?=
 =?utf-8?B?bXVLUXJxa3pSbXhQT3V0ay9veE5HdlRsbFJpT2dxNGlwdk4yajl1L3VTL09N?=
 =?utf-8?B?Qk9wcUQweEFaMzNSQzlpVERxVndwSDdWVTVEdms0UFhETXZkdTViWStuM3Vo?=
 =?utf-8?B?RFcxV1RYUDEvTytFRzQ2VTBPY09mUm9xai9FMklDV3djRUFwWGFUTlBLYUZa?=
 =?utf-8?B?K2FGMzhJREt2VzZSbWZlVTl2RnRTa3VBYTVzMmFKRVNYZzltb0tWZG9RL3ND?=
 =?utf-8?B?S1JrTmY1dE1xL05UeElxSWdUbnJVKzVFa1ZxV3hOOGlzL3dwNm5qU2lVMHp4?=
 =?utf-8?B?Tk9rcC9DSnNobkUyeitEL1RVeUNmRnNyTm9od3FySnN6T2t1M1pmMm1iVFJR?=
 =?utf-8?B?aWtleUs3TU12TGdQRlRtU1lLcUdDN3NNRVlmdVdnWjZFSWN3R3ZuRG5GbnZN?=
 =?utf-8?B?dmVPUnJ4NTllUFlIdnAvS2tPcGx3TjJoUEpHSm1pR2VNRVlNOU8vQzI0NnEz?=
 =?utf-8?B?NTQ2dVdGYXlMZGxoNTNHSU5JRzJKNGFSMXptQ3dBQk9EMXFuK20xeWVoTWNt?=
 =?utf-8?B?dWYvT1V6cDkxRTQxNnJsZC9JdkowUEdKV1BEMktGOGlWSzlHN3EybldORm9T?=
 =?utf-8?B?YzJMNGtHeXBtRFo4cXVOUThBcFVOYkp2S0VhOWxmRFJUNWhBY3c0UFJFbzd5?=
 =?utf-8?B?QWVMVGhqbUsrV3FPUFFpZzQxYW94dDB0SVF3bmZQa0xxamlxL09sZzFyd2FK?=
 =?utf-8?B?cENKZjlXTXQ5T2o3RzNEMzNVck1YdndZL3FubzFNVDJPdnkyV0VVdUF2V1pV?=
 =?utf-8?B?VW9tOHNrcitkZHRrd2VLbzZ0eGkzckhMbk1STnJHRTJMOEMzdUszbWZXSDlO?=
 =?utf-8?B?eHdlc0l2VzdPM0NHRjQvb0dZNDNjZENUZVRpd0ZZNnRVTGo4R1RNcHBPU3N1?=
 =?utf-8?B?WWJwTklBVjlOaU8vS2ZONDd0a2lZUmdyVE5PNmd5M1lVQ0dUMEozSHFta3JC?=
 =?utf-8?B?N0psR3FlMzJwTGhXakpKaURndEJLSnUwUDlicFcxd3RDZkExUFBZZjIwWkk4?=
 =?utf-8?B?QzhidFhuaE9hMFZzaVNCeFdrd1RLMlFWRVNDT3Ivd1R4Q0lKYlNLa210RTdC?=
 =?utf-8?B?MXhZT25aRGs4WXNPdUQyRG1nSVRDSDRrSHRRNUtBQWZqaTk2QlplM29nN1Vu?=
 =?utf-8?B?SEl4UDY2SEdDRTlVWDd3RzVjc0dyRHlrdzhpQ0hyYm5XZmNQY3F5UFdBRkNT?=
 =?utf-8?B?UEdNcDloSUcxU0FkR205SEFSdTc5a0Y5akhBdVBzR3dVMzY0OG84S1Y0T1N0?=
 =?utf-8?B?UFV2RW16c1ZCNGsrTU16c0poVXA2TlkrT2dWeUdpRnRFeHZCcEFOQ3ZGdzhI?=
 =?utf-8?B?YlhjUExQRm5uczRFdkhBSTA1SGp4a3NPdXVNRWJRNFBDSFFZbS9RM3pFa3k0?=
 =?utf-8?Q?ocDFG6+X3wVqJJQJHqP1I34krtOQ7vZ9d3G1yR1JtzoRn?=
x-ms-exchange-antispam-messagedata-1: 2taCqPjzsyckhg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CABA8F33F9DE04E8954ACA59CAEAFDF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da7a68d-56a9-4686-7bcf-08dec7d8cb71
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 16:45:07.2224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaoUtJ2PmvzbqpQ3LSeCO+xVR+u/0Lo6hJYF6a4scLa9dQl6LsPriD7KUrYKtSK6XJ3EdjFBOeRoVduY2mLm0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098

T24gVGh1LCAyMDI2LTA2LTExIGF0IDAwOjAwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUu
cnMgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUucnMNCj4gPiBpbmRleCAyNzlmYmFj
ZDBiOGUuLjI3NDljMTk2NDE2ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9ub3ZhLWNv
cmUvZmlybXdhcmUucnMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUu
cnMNCj4gPiBAQCAtMzMsOSArMzMsMTEgQEANCj4gPiDCoHB1YihjcmF0ZSkgbW9kIGdzcDsNCj4g
PiDCoHB1YihjcmF0ZSkgbW9kIHJpc2N2Ow0KPiA+IMKgDQo+ID4gKyNbYWxsb3codW51c2VkKV0N
Cj4gDQo+IFRoaXMgc2hvdWxkbid0IGJlIG5lZWRlZCwgaXQgY2FuIGp1c3QgYmUgcmVtb3ZlZCB3
aGVuIG9uY2UgaXQgYmVjb21lcyB1bnVzZWQsDQo+IG5vPw0KDQpUZWNobmljYWxseSwgeWVzLiAg
QXMgYSBjb252ZW5pZW5jZSwgSSByZW1vdmVkIGl0IGhlcmUgc28gdGhhdCBJIHdvdWxkbid0IGhh
dmUgdG8gd29ycnkgYWJvdXQgaXQNCmluIGEgbGF0ZXIgcGF0Y2guICBJIGZpbmQgdGhhdCB0aGUg
cGF0Y2hlcyB0aGVtc2VsdmVzIGFyZSBjbGVhbmVyIHRoYXQgd2F5LiAgSSBkb24ndCB3YW50IHRv
DQpoYXZlIGEgcGF0Y2ggd2hlcmUgdGhlIG9ubHkgY2hhbmdlIHRvIGZpcm13YXJlLnJzIGlzIGFk
ZGluZyBvciByZW1vdmluZyB0aGUgYHVudXNlZGAgc3RhdGVtZW50Lg0KDQo+IA0KPiA+IMKgcHVi
KGNyYXRlKSBjb25zdCBGSVJNV0FSRV9WRVJTSU9OOiAmc3RyID0gIjU3MC4xNDQiOw0KPiA+IMKg
DQo+ID4gwqAvLy8gUmVxdWVzdHMgdGhlIEdQVSBmaXJtd2FyZSBgbmFtZWAgc3VpdGFibGUgZm9y
IGBjaGlwc2V0YCwgd2l0aCB2ZXJzaW9uIGB2ZXJgLg0KPiA+ICsjW2FsbG93KHVudXNlZCldDQo+
ID4gwqBmbiByZXF1ZXN0X2Zpcm13YXJlKA0KPiA+IMKgwqDCoMKgIGRldjogJmRldmljZTo6RGV2
aWNlLA0KPiA+IMKgwqDCoMKgIGNoaXBzZXQ6IGdwdTo6Q2hpcHNldCwNCj4gPiBAQCAtNDgsNiAr
NTAsMjEgQEAgZm4gcmVxdWVzdF9maXJtd2FyZSgNCj4gPiDCoMKgwqDCoMKgwqDCoMKgIC5hbmRf
dGhlbih8cGF0aHwgZmlybXdhcmU6OkZpcm13YXJlOjpyZXF1ZXN0KCZwYXRoLCBkZXYpKQ0KPiA+
IMKgfQ0KPiA+IMKgDQo+ID4gKy8vLyBSZXF1ZXN0cyB0aGUgR1BVIGZpcm13YXJlIFRMViBgbmFt
ZWAgc3VpdGFibGUgZm9yIGBjaGlwc2V0YC4NCj4gPiArI1thbGxvdyh1bnVzZWQpXQ0KPiANCj4g
UGxlYXNlIHVzZSBleHBlY3QgaW5zdGVhZC4NCg0KT2ssIGJ1dCB3aHkgc2hvdWxkIEkgdXNlIGBl
eHBlY3RgIGhlcmUgYnV0IGBhbGxvd2VkYCBpcyBmb3IgRklSTVdBUkVfVkVSU0lPTj8gIEFzIHNv
b24gYXMgSSB1c2UNCnJlcXVlc3RfdGx2KCkgaW4gcGF0Y2ggIzQsIHdvbid0IGdldCBJIGdldCBh
IGNvbXBpbGVyIHdhcm5pbmcgYW5kIGJlIGZvcmNlZCB0byBjaGFuZ2UgaXQgdG8NCmBhbGxvd2A/
DQoNCj4gPiArZm4gcmVxdWVzdF90bHYoDQo+ID4gK8KgwqDCoCBkZXY6ICZkZXZpY2U6OkRldmlj
ZSwNCj4gPiArwqDCoMKgIGNoaXBzZXQ6IGdwdTo6Q2hpcHNldCwNCj4gPiArwqDCoMKgIG5hbWU6
ICZzdHIsDQo+ID4gKykgLT4gUmVzdWx0PGZpcm13YXJlOjpGaXJtd2FyZT4gew0KPiA+ICvCoMKg
wqAgbGV0IGNoaXBfbmFtZSA9IGNoaXBzZXQubmFtZSgpOw0KPiA+ICsNCj4gPiArwqDCoMKgIGRl
dl9pbmZvIShkZXYsICJsb2FkaW5nIGZpcm13YXJlIGltYWdlIHt9LnRsdlxuIiwgbmFtZSk7DQo+
IA0KPiBQbGVhc2UgdXNlIGRldl9kYmchKCkgaW5zdGVhZCwgdGhpcyBzaG91bGQgbm90IGJlIHBy
aW50ZWQgdW5kZXIgbm9ybWFsDQo+IG9wZXJhdGlvbi4NCg0KT2suDQo=
