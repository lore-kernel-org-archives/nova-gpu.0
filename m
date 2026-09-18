Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012068.outbound.protection.outlook.com [40.107.200.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0CB282F34
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770902; cv=fail; b=blKpdl0tBmKczUMmPcJV7YqlF2kO6+qkFdJ+J69iMcQdk8qj4G4/a3JYNorKSrrjvONkYbRGd7Oytb5VDsO+gu0hU7QY6Zleisa7lyDKomnylk9tZSA2IsAhgpVQRGgp+O4P74CX3b9+bOj3ZTAzQPp7/1tAqnApkXiFOfajf4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770902; c=relaxed/simple;
	bh=OZq4qcWxMMvx7AnZmKkLArXaaEG1gPZp5JLIleciKQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dcjfdYtVyI00gvraykuF5SvqE2cIkBM48l5cnH1llCwYmQJiZuamAEwctJMovusDOnZ+kAqUYIRFOPdrCrORAvf/xd75PYBXfaV7fiClaJCVwlPHtkOu4F2hlwLkCcGekjRxRINxegeeghlcRyfW/LTUq0slF8/q2yVMgRnykv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aVvtb6YF; arc=fail smtp.client-ip=40.107.200.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aVvtb6YF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey/o2kyk337DXXTfBef4SvYIU9xcSGXGr2AVpHRSXDxp95jPLrwzoMjhS4Tgm5b/+sRe4Fg+ya8S/32/bOLhM3/783ZcSBBRym5LsDN9E1LZ/obI8pxdFoAxOegVfSjsD1lw+MG6JoBuO0u4I3gag8BVTRWBqyeIUgVanyAWlA2Biijvxpe9MfTDshvSEmImq3Tnow1emYUkNBq6uEf5d2vi5tvWZr5u6DqAOsmcHTY03KPR8Xf7rVIXFHkI0y958a8ZWB6u4b7h7WYm0UQ+DmcjLKLkh4IT/3p64X6URVPHbzFYrkI7qchoxwHddU4h583H08/aoJFf2qZYBR8GxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZq4qcWxMMvx7AnZmKkLArXaaEG1gPZp5JLIleciKQU=;
 b=Nl8/Dl88vAo9F5W6XVXEvNwPwRggwnYMsrX+CzwuKZi5gJEyMSbITmjg1p1m5Sv9d+MqrMvBx1CQjQjWsPLvoEi/Mel2IlmdXMWEV5UGYHpwe5CsVw5bFFwAtCYjC++ys/tWKbVXA5oETdtzbUVRiwKP8pe7dTOqfgRzcNyev6NooDf68iS+sIL87GphzWOJPhiQIQVb0nDvcgow/nL+WJ4/r9G25KvQaiX7V14lTo1pFWQMc1er2d1Du/5BeXZ3d6XvAltFKwUW55EDPlq/yLU8ZSa43Ie3n8KthOHQVtq4BdQHlR6qHNN2gmCZOID6fG+UgMqpxjCYDxLPRWq+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZq4qcWxMMvx7AnZmKkLArXaaEG1gPZp5JLIleciKQU=;
 b=aVvtb6YFpOK6C+W9tDMLH8NVtgNr6RnFxHKqj4XJyk+XMuMsHrGIzj2WRKJU90TY6DkKwRyUdIAZRvMBRhpg7QwwqsXVkxmwLJMVn7bDCnzlIOZ2HOzzg54xKyY8noDftTJVjfWdILrfc1JOE36u1KNTjivl1vyrOupizSZX8ySJOMxlpxTZLCCgYsvISAlRvM4k5HK0zUjPF0WKumM/l4RU1MDK9+k8kSeYS1MZCXwoOD7GC3PHODgv7zXJJmQZ/RUvxcrWdT93sVeJk+Iz+kXCGOdhLGHVXAH77/36wimTszzP2XH+dKJYmITIc6981Ti+cEKYAT8XSHDiftyJqQ==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by IA1PR12MB161209.namprd12.prod.outlook.com (2603:10b6:208:5ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:34:56 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:34:56 +0000
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
Subject: Re: [PATCH v3 23/33] gpu: nova-core: add LIBOS3 log buffers and state
 monitor buffer
Thread-Topic: [PATCH v3 23/33] gpu: nova-core: add LIBOS3 log buffers and
 state monitor buffer
Thread-Index: AQHdRwoyFF2kOhiOTE+FK2KhQ+B51bbU7caA
Date: Fri, 18 Sep 2026 22:34:56 +0000
Message-ID: <f8b2871a93e71d4ab56f5d7ba6a23600c044b025.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-24-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-24-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|IA1PR12MB161209:EE_
x-ms-office365-filtering-correlation-id: ad215043-8166-441d-eb42-08df15d510d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|38070700021|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 7GceelTdVOYBGewr92MnhNIAcJYLQsjXshQlbGgaRlFWPYXdx56gEXzdHmZatxeHLWMugLKnDTCJ/MEvNs11bWm1SjXAlTdUhezpyHFRsp22SJlx2pimihROjrCRQRli6zC9BYvG0c7bqY+TG5udydM8kBE+eP19M+dUlY3IjYnNnGL/vRq2IYltu+D2MrSwzSggPUg5V49EB2srOgYuT+y9Js3s9/pBpcDXeifwXsHUxIZSS/iNGSuozboaZjbQuPyrQeLzckcN2dTP1vJkiDqt1eY1HYBqWIB9/bCJbRlqWsQculxPwYa47TXW1l8R2fFNbCI2nXK18qrTe6wDxgf7saDwsAV+PN2Y+/ul+B2RE2imRdMzeRCPyzbaVTQ1SvTl7dZ8HsJjO1wM2F7IdSF2V1BycVjfUeo/oOMPWrIMLtvulqmajqS+rYFVv3w78VFCzlXRRppuyNF7VnpReg78esutJHPeHDzh5t0HUN6j2gihVnlMCoh8bBlkDYxle6X6eG6kYqwCS54hCcrCKtRzTDRoCu99vtLhg9gSVac0NZpfqewaD2L25Oqe6CanCTge69VBoKcrZ2YZ28Oe7+VExYNcGs/hBIUmHfizRzbvF7ijW0JNtWIG0KTUeUBoG7YIRL46WTWKZZ6HZ58srqHiblDG7m/3+jb+GwVBmjK23XyHqytz/Ise/wfLQbbdAQ+wm02UQsKz+1dhDExp5y0ZFuDmcQ2//FrPdzsezTo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(38070700021)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzEwQkNSNTlyeFRXU21xYWwwL1BDOEpyYTFNYjl2QkM1QzlJVmRxbG1vTlVm?=
 =?utf-8?B?MGJDbXZMNXJ6eGpvTTVDV3FSZ3JjT0JBWHdCU3BsNnF2TzJPU2djYkJCZGJ6?=
 =?utf-8?B?MVpWNEw3WUZOc3NTT1ZmRVErTVA2RkJGRVpJT0Zac3RlUWpIbmRKMlI0QjRo?=
 =?utf-8?B?Zk1uck5hbmN5ZktZL3ZMdTFSaGpvVndHK2dNZzNwMjRKalRvcWhkMXBhUHMy?=
 =?utf-8?B?dVB0WUFsVERGcWx6aURRd1p4bnBhTzRkWDZPUXFzVmFJRkxGYkRlN21MRkJ1?=
 =?utf-8?B?RjVCYTQ1NlFlK0F4TC9GKzgxWHRCWERPM2ZtV2RMZGRwTGdKVVQ1SU0vNTY0?=
 =?utf-8?B?aXFpU29GUjlLNFNCdzJyMk0wbmIvNEhWVW9BUHk5b2IyV3pUdElkNTAyNEEx?=
 =?utf-8?B?VlAvWXhRS0dxd2J4MXFzZmpqZ0RnUE05eUhRMU9waENDb3dUZStxSm44VVds?=
 =?utf-8?B?MkJvT05rUnVtN1RuQmlVakg3VHFxZWJNdWh4SUcyQkZLem5RN2xkWXBDZGYv?=
 =?utf-8?B?Y29mbFU2d1ViREFyVWMyREp2UmpKV3k4dEJGZTkzM1FkUzNxN3g3VVMxOVB2?=
 =?utf-8?B?RG5YZ2VxRUVEWjJIcHdtM01iWFlYVDY5NFVxTHhZemZFWlpGYmxvK2lYUjVh?=
 =?utf-8?B?SERLRFBPck1jV2lZWVIySkE2MXFDNkpCRXJMOGlWVGVtc280MHFPSjl5V044?=
 =?utf-8?B?dm1hTUREcTVVZjBpQ3N2bUZYODNhNGkydmVteVZTcDNmamp5UlZBNk5oS3NQ?=
 =?utf-8?B?bGNWVU5XOWNKOXpNWlc4OXRyWXJCc2EvQ2pBbTdYcEVZQ1ZtWmxGYTdRY1Bs?=
 =?utf-8?B?U0JBaCt3WmtVUlV2bG5kcTlYcHpYM2FkeDdraFRDMy9vb1VGTm5nNk15aUUv?=
 =?utf-8?B?N01tRnNZTW9YVW5uWHk1UGpSUDlOdGU2Um4vYko1Mmc5T3RKSlNlVmtFZVFn?=
 =?utf-8?B?dk1USE5yRk5XZlBkNkpDRmRUb0V3QUd0RW9YUnVTS3ZOdU8vbktKbXkyRXpE?=
 =?utf-8?B?QXVBazB3bm5rYnpUNGpCNk5tTFZQejdGaTFaSDVrOTdQRC9iNWV1SnJNcDI1?=
 =?utf-8?B?RnFJWkxuN25EMUhPdW5waGN1eG5hbUVKS3lnMkFKNlpDNEVKQ0VVOXpKZG0r?=
 =?utf-8?B?VlczRFNTVm41Z0JWWkJxZFFiaE1LeG5oZWQ3d3I2Q3d0VFdhTDRRbEdJaE1U?=
 =?utf-8?B?VGNySjRQaXI1K25QTDJ3dmRPeFlLSHoxdlgzalZUUjFZVlJNdUdtek1nbTBk?=
 =?utf-8?B?dHlnWXBBa1FpZWIwVURBQTVlME1sNTR1elBRdUtqQVRUTnFHUm1NVlFxbEZL?=
 =?utf-8?B?cWw3VkJyZzg0TlAxOXpaemVENHNucE5VTzRQNXFOTnY3V0trZGtZSC9wYUdy?=
 =?utf-8?B?OHBVRkwrZ0R4cXJVQUxJVlpDRFhjb25TQUJMUlBzUk9pK0cxRWpMWVdPR2tG?=
 =?utf-8?B?TmcvYmRuUzBtL2ZJNWxzK3lqREdTTjVNYS9HcFZkSmhjYnYyS01QMFBkajdJ?=
 =?utf-8?B?eVVRWGM5SjcyRVdPd3NhTTJvd2dpTEVVTTJWZ2xZT1hRWTAzT0dGeitnYlg1?=
 =?utf-8?B?SXVYVlBFME9iVzJvY1RHSUw3a2FNNS96MFpmeWkrUVVYYkNza2owRnZGYkU0?=
 =?utf-8?B?NFh3NFE3dUNSb2ZsUVUxeEJ2NGxhcVkvMEtDN1FzaFAvZ2ZYbzh4YmJ2YmtU?=
 =?utf-8?B?c3JYSGI1L1JXMjR0SHNxdGUxV2hmZHpvOXJmWU41WjdRN21YTjFoQkpVekFZ?=
 =?utf-8?B?K1JWKzB6K09uSFc1ZFNicmh1N21ZWENFZFdzbmJkOENzOHFRVzI4QU10YUF2?=
 =?utf-8?B?Y3BONkl1b240UnF2WlVZVDNSU1N3azB6RzRYNk5ueWdrY3lTcUNsdEZYdEwv?=
 =?utf-8?B?ZTNVWkt0WGlKRU1TajYxRUVEK2VNcnFWR2cxckVBTmlka0FGWEZkazYrYXlx?=
 =?utf-8?B?UDQzSXdOL053c2dDK0I3c1h5SmFwRmdkRGx4ZlZxWTBxSEJqME16ZFJYQUJl?=
 =?utf-8?B?bEtJcnVXZHZWZzFqZGRwVEZhQlFrZ0ZLSlVKVjdsQndDVHdTTVp4eE1uWW1K?=
 =?utf-8?B?Y0ZGRmMrTnFYam5mUEx3SlhYeG9mUis1NWJWbUJaWVhJWXRBMUl6bzA4U2Jr?=
 =?utf-8?B?KzUxc3JOcThnV1JHa3d0NVlIaTVvTFdjcjBxdWZNV09kR3Jwa3ZETlNGcUg0?=
 =?utf-8?B?NHVBZzRXOEY0Mk9aSEIxbHZXZ1VvcW9OL2lwYWVMRzkybHBtTnRYYkJiMUNJ?=
 =?utf-8?B?MFYrKzFqWUV6bVhPZzNhOVhqdzdoK0RqNW1qNTRDdHNaTCtXVmlTUHhQUExm?=
 =?utf-8?B?ZVVsWHd4cHpBRGxtVXV4WkFXT3RGbzRmclZVNUJpTmVrVEozQld2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1412CD4EB353F94FA5EC0CB968D04307@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad215043-8166-441d-eb42-08df15d510d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:34:56.4297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQLoRRiaSUNcj3puYnuFZZ5PSE23o5HPBCjcjIlqAazKedAwtiXuqkuNETAB6/OEC6nR+TPT+dOeePMPJPJF7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB161209

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEdTUC1STSBydW5zIG9uIExJQk9TLCBhbmQgZWFjaCBMSUJPUyB0YXNrIGxvZ3MgaW50byBhIGJ1
ZmZlciB0aGF0IHRoZQ0KPiBkcml2ZXIgcHJvdmlkZXMgYW5kIG5hbWVzIGluIHRoZSBpbml0IGFy
Z3VtZW50IGFycmF5LiBUaGUgcjAwMCBmaXJtd2FyZQ0KPiBydW5zIExJQk9TMywNCg0KRXZlbiBv
biBUdXJpbmc/ICBJIHRob3VnaHQgVHVyaW5nL0dBMTAwIHN0aWxsIHVzZSBMSUJPUzIsIHdoaWNo
IGlzIHdoeSB0aGVyZSBhcmUgdHdvIEdTUC1STQ0KZmlybXdhcmUgYmluYXJpZXMuDQo=
