Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3FB348C70
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115884; cv=fail; b=IKwoMnO9jzawdIpSnp+3hOeqM/TIIW2+74Qa0zLWNyEgUWEXwfXHYymgAM0CSo+XY4tiOe+mVS3K1c4ZUtOqam08+Z93Z1zeDQ32A/4WIk6vcSEEX/CKpbeI779uJ5/to2QYFscAGJgiula226gfRlmk8P5aZTwBqdoQi+wyCvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115884; c=relaxed/simple;
	bh=pBU2tJ6A15DzgD25KWOt9nWtROxPuf4t33XPwvOZj3w=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gPR9pJw0x/tTH839E0BMRx/1mAeEtIUGPEm4vriWXA0g4DDMdqJN/c62aYu6CVCZO78iuc7CQLoyXAI8iNV2EUdNJ/II5SyB30iqeVlnbE3WlWg/LP/RNwZu542Ev97K4cVeKwPxSlJMTDZjWXKaSLVuVSisWoieCsZBunU1JDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Se7/k0Es; arc=fail smtp.client-ip=40.107.200.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Se7/k0Es"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVcjeuqrF7sIMMslyuVP1HgLJen4a5CVPUKs5lF/rdDSDb/kmh1SsX5oSfPGjbg8t7OE8ldBDqRkybthk1KltdnkdT/kJAmB137rbmBe+XoY+nzI8IgXORfFBH0IBYALYyzeplJkGV9VWVSF7BY51lwvPQ2ygJ3gJWRcz48JljSK9r7cP8bJeS9FQulIN3Dpto3F+IT6J59bHDVkOaq7QpjoQgSAczrm3Tux1j1xXm0NXvgaOQiRVCehXfsamGgJj8JUe2FbFn7X5RbYeMuyXv7/6wLsncn8DylWB2FtcvisH9MYmreFFcoiuwySd6qvoq6M3lxenylmOo2DSChNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBU2tJ6A15DzgD25KWOt9nWtROxPuf4t33XPwvOZj3w=;
 b=Ms4Qxjf3PGBotGn6XUdrhA9k7IJHZiRhCTjTel3tJmyD3JMmbx10EnrD1JSdaLrgRnzG+H7YM7KcNrKHPJupSt5dJn88hyDo/LXU/w2JWNhSSaYVuGS8nxXOPD8msYPB7L40zORKBM9o2aydm/QvH+++nSKSy4tbSYzAQnfhlIdLpAQGL5c5snnT5Hd5JceR6xTlo6MAKHf4qFtgTA6bdVp5vDzYfbFnM59B6wuI6ZzOPJxXoqv9teWEqyKzCvvQWF3/znEb/uopaulD5ZXTOe40kLaDIvsHtAXZmvuxgveRJMSUEOe/T1/7vuyOwU8qVmJFMTBSSs7YHwgmU1pvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBU2tJ6A15DzgD25KWOt9nWtROxPuf4t33XPwvOZj3w=;
 b=Se7/k0Esr9LsRhijTy+tiAMbbha+t/3eP4Fv/6Beaf3kdsQ+kv1G9AvpjMA1UMXyhl+FQzmO/2CP/ZufxezmkssgN3vWQINV+7t7wes2AvYBu7zpnHKtuJ3U3vsf0qs9EJriJ0MUiDheXOPbd2UBWCP3FrW9iK7c+z3f2c3phwgbCcPTWBk+mYMy5KzNhLcBkQTmOERhfpPqYC/AN8VYrPG3NCgV1xwLU1cBhtr4Z/jExNnB/RH5zlPhychNroPmUUQf67412yaZu7yEhduMW9reh6FN6vQrkguG0kkfA1c6QlCgJEVK3QKQG7CG4f0aVUVuu0rN8JzwfjFQPHPZew==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 18:24:40 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 18:24:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index: AQHc+QGZGJRxryX2J0aNJYdBUK6JarY4FNCAgAAF+IA=
Date: Wed, 10 Jun 2026 18:24:40 +0000
Message-ID: <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
In-Reply-To: <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DS2PR12MB9774:EE_
x-ms-office365-filtering-correlation-id: 83ca02e4-62a7-414a-1fa6-08dec71d891a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|56012099006|22082099003|18002099003|4143699003|11063799006;
x-microsoft-antispam-message-info:
 CKONB6OtsdALjH4pnpIZUQ2pi9S38MyIDcGN7SkDfEKu2SWHrAlfpkCIGmhYC2vYBJ94QOVSjYcY6OIpX+vEr/Z/O7cGI7GwbqEAKpnExF+OKIIEKJyP9b6uYhsgckwRiQ+bC60PKnfdCv+IIPe5neCCvrkqKic4ydiOGR/okNJfG6j0QDjmlL1COYRQBaMWCkwj5yr3ShUmOP7VmbTXk7fCHKVFqXD6P+8ZuDYDyPPjdSPKGu8zQoVIOwTaPxO//Adeu3P2bhBZjbAjZIDLxcBWTWJNEIchUbAdFT/8UezP3q52HS1HCIXTjR0GJkTsBZ+rqdkrp/+9ITvH89m5uiY0Qf8NcdIdK/0LFVx54DZKTDaGfEEuh39HODE7kHLYHRAHjZWPP9K/xphyyEMHDCHx31Xsf5zXHEYybWhr9pEgkaVHawB9VGuCwuStGEmx+zSfp/zoKM7q4nuSxwZt77/FfU/dWo7jAZ6yb9/gWRhXqKUNv9qBA8OD6iD/0knM7qLzVpxaui0VSBeHv7M3jiHRqfVOjFkXXoa68V9RzhEpHOMLorVqAJdN5YquddPbx9cGVKDPUKOPSP86VI3EXM/gIZq1ICq3wy06w6LJ0oMfsLlW9KxGuDwPzehhf884m4vJcJ52pvqwCsmzeaMwwpMSmPScBb1905c97v8yG409TSeufz9O0RZb3vFfW4CgxMMIow7EN7gHLovGnukcSZiDOkou8hwIs3pffWda2y7k5lrvllc5Y/XT0TUgKwOR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmJXM2lSMFVPeFhwNU5pUUFwRjd3bDlPMi9FdFJjZm1yTDRiZU5uYUk0TWpj?=
 =?utf-8?B?b1FkZUpHR0NSNGgwelQ3WW1DcHhtZG1ITjJMWGtpcmVHZ3MwbHdMcHpZRHA5?=
 =?utf-8?B?SkgxTm1kTHhNU1cwZS9iY0xOZTZncE5CbXVLZEprRUlzZ3lldzQ4aEVsZzFV?=
 =?utf-8?B?amNOOXo0QWZpT0ZTUW5HWkFtbXNYS3ppNTRRSFFIUUVmVlN2YWxJa05CdXpR?=
 =?utf-8?B?QUQyWkFSdEozSHpzNStFcVRrOGVZMWdNbEdHdFdJVDZaSWdJUVV2SmZIWitk?=
 =?utf-8?B?Q1FmdGNjc1FxMExza2hxZ1NZaUI3NytIVmRYNmNFWnhGQVpLY3lwVEt3UFR0?=
 =?utf-8?B?dHBRcnNxejBzQXFEQ1RJWFU3YmttOVpVRUY5Q1V6RVllU1hpQm1XeTBPWUo2?=
 =?utf-8?B?d0R1a21DWWQ2ME9vWTNTRjlNZmVqNDgrVjIyL243SEc2TGJrMXVNcTBGSzFY?=
 =?utf-8?B?cWE3OWdnY1NlTmVqSWREZHFIRUhnYUxBZUxBV3A1K2J1VHFPRmczeG12Y3Zt?=
 =?utf-8?B?amx6OTVIUUtEWUlwcDkyYy9oOUtFbzFoUm5jbm00TzhkZDl5K2EwYkw1VzEx?=
 =?utf-8?B?MXpnQnoyRGFkQTQxQXd3MWFINDhheE9ZS2toVDQvWDVURnNOaklkT2JTSEFB?=
 =?utf-8?B?eUtzM2hxaUpLN1dWQVg5dGFkd05Sc2JEUERGOEZZY1Rya0JhMWE1eTdqWU1k?=
 =?utf-8?B?M3Vod3hSMkdjbW5xUURISFZWK3llTC8xbUkzWm9HV21oSDV5WlZqOHN6KzNs?=
 =?utf-8?B?K1VJaDU5NGF0cUw1Y1dkVmNXSEVuMjhMcjJ3NWk0M2YrOHQzeE9xUlRIclZh?=
 =?utf-8?B?MG00OTJ2b0cvTEdDb2U5N25tb1JWaTJsSGxqRU9nY01KVGw3dTVQN0tsTGFR?=
 =?utf-8?B?NjFNN3hqOXBjQUQwWVdqRlR0NnJEMWFQNXZuMlZJTER5ZHZrRFRQNWdObVVD?=
 =?utf-8?B?RXkyenlLMVB4YnhtanpNb2paQy9MdFM5YzY5eVBQNkVMVFd4Z0E4V3ozU0hB?=
 =?utf-8?B?UEltYkdCZ0hhelFzY21qR1B6QTBndmovY0RWNFdhSFZCbjlvRURmR1gxVEdR?=
 =?utf-8?B?TnRXVFprTFcwMXdSdkR1MWU2VHhZNzlydlBScmh3NTFXeFp1WGU2eC9KVlg0?=
 =?utf-8?B?Wi9PeFJhazBWSDZiVGtBN01Hc0RzdmxVRVN4OHdobFErZXB2QXA0UmErMWds?=
 =?utf-8?B?ZDI1V2lRb3dZUHdhdlBtd1NEMmdCSytJZ3BjWk5BK1hBSWhsMUFSVHpHQmx6?=
 =?utf-8?B?T0hvZ1RwMEtZSW50OWtYUXhGeW8vNEdHbGlCdDZBUTZGd3BFWWhnamZabE1a?=
 =?utf-8?B?eFdTTUZNOTAzV2Mwdm01cWpTZ041Uy9jZWRBNTdYK1hJRG5aeGxIV2g4RmJ1?=
 =?utf-8?B?WW1XazJ1VUp3Um9abmlwRTVoOEh3UFNhOWpPa29XTDdTcDk3M3RteUN2QlBT?=
 =?utf-8?B?Y2NWUVgzTEZ3RUtqeWg0N25FanZMRkExMzc4RUE4ZzNKMlhNeEZKUGpUZ0NE?=
 =?utf-8?B?SG5YTW4vWThOOVJXZ2c5NC9ORDBIMFg1UVBaTEQ4ZzlOVDNHZFQwT1Y0bWNx?=
 =?utf-8?B?SE41OVdGbTFEL1FueFd5amJNLzBLSUxyU0ZjczZzbU50MEkwY1FYak1UTlZH?=
 =?utf-8?B?aXJndFFDZHU1K2VtSTBpdE0ybTlIemQ5TnNvTTBOYXpLTDduQTlrc1B0QkZ4?=
 =?utf-8?B?dVJySWwvVjUycjFJRjZRRDRaRWRhamE1QVQwUjNRYkw1YTRjK2M1QUVTeHdT?=
 =?utf-8?B?R1ExNjRKMXhPdHdTUHY1Nkx5TU5jOVZGODg3UnZ3RlJza1NVM04rekFweTI3?=
 =?utf-8?B?QXpnb2JkZ2UxQVdIWS82bWUxOUFzbURIa3V6QnA3VCthQm55dlpFVnJsb0g0?=
 =?utf-8?B?aGtKYWpSVW1CblNGdmN2RFg4MmJ5aEVZWXZPVEMzMmxIN3VXdFVDZ1ZlWjBH?=
 =?utf-8?B?M2VLWUZicTlmRTRUTmppTHYxeThBWWRtcGdGeG1FTHNib2ZTUzVOaUVoaGh4?=
 =?utf-8?B?THMzY3E2cUt5SS85bzU3aVZTNVZWUnIwMzJmeVVra1d3VjNrUHhoc2g5eGVM?=
 =?utf-8?B?MUVPL2F5RkNHUFh0Q2NBcUJRWEtkUys0TG5WdEVQL2xUUGFYYWdrdEdyZkpR?=
 =?utf-8?B?REdXb25YYXh1YzJlOEpqeEJIQjBQUDJRNHA0SWttMXdZOE5GWUg1Mkl4NEQz?=
 =?utf-8?B?QVFEbyszYTQ0QXVsNStKWDQ4aHFkQVRXQ05PZHQrS3FkQndwQytReEVuVkVV?=
 =?utf-8?B?RkROc0IyYnVWZ21RbnZFM2hZdDdhUCtwczNGUnBpYWVSaEFnUE4zL1NGdC9r?=
 =?utf-8?B?ODN2bXVpWXl2UFRVaHdaRDVvTXJTaDdldFYzYndzc0hRbWxBdGVTZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <373960F44EC7BA4C951E1C68B10E3BED@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca02e4-62a7-414a-1fa6-08dec71d891a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 18:24:40.0530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nPGZnAOV9BE4npmqIolLg5gt+WPdKD20rbOD5feWiRMCMsBdSd6K+pBwCLItCj2+8ImRp9ebnF8X9G5/1p3uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDE5OjAzICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiAr
cHViIGZuIHJlcXVlc3RfaW50b19idWYobmFtZTogJkNTdHIsIGRldjogJkRldmljZSwgYnVmOiAm
bXV0IFt1OF0pIC0+IFJlc3VsdDx1c2l6ZT4gew0KPiANCj4gSXQgbG9va3MgbGlrZSB0aGlzIEFQ
SSBkZXNpZ24gaXMgdmVyeSBwcm9uZSB0byBtaXN1c2UuIFBhdGNoIDUgb2YgdGhpcyBzZXJpZXMN
Cj4gZm9yIGV4YW1wbGUgZG9lcyBub3QgY2hlY2sgZm9yIHRoZSByZXR1cm5lZCBzaXplLg0KDQpJ
IHdhcyBkZWJhdGluZyBjaGFuZ2luZyBpdCB0byB1c2UgcmVxdWVzdF9wYXJ0aWFsX2Zpcm13YXJl
X2ludG9fYnVmLCB3aGljaCB3b3VsZCAiZW5jb3VyYWdlIiB1c2Vycw0KdG8gdmVyaWZ5IHRoZSBy
ZXR1cm4gdmFsdWUuDQoNCj4gQWxzbywgSSB0aGluayBwZW9wbGUgbWlnaHQganVzdCB3cml0ZSBg
YnVmWy4uc2l6ZV1gIGFuZCB0aGVuIGl0J2xsIHBhbmljIGJlY2F1c2UNCj4gYHNpemVgIGNhbiBi
ZSBsYXJnZXIuDQoNCldoeSB3b3VsZCBpdCBwYW5pYyBpZiB0aGUgYnVmZmVyIGlzIGxhcmdlciB0
aGFuIHRoZSBzaXplIG9mIHRoZSBmaWxlPyDCoFRoZSBrZXJuZWwgQVBJIHJlcXVpcmVzIHlvdQ0K
dG8ga25vdyB0aGUgc2l6ZSBvZiB0aGUgZmlsZSBiZWZvcmUgdXNpbmcgcmVxdWVzdF9maXJtd2Fy
ZV9pbnRvX2J1ZigpLsKgSWYgdGhlIGZpbGUgb24gZGlzayBpcyBsYXJnZXINCnRoYW4gdGhlIGJ1
ZmZlciwgdGhlIGtlcm5lbCByZXR1cm5zIC1FRkJJRy4gIElmIHRoZSBmaWxlIG9uIHRoaXMgaXMg
c21hbGxlciwgdGhlbiBpdCBpcyBsb2FkZXINCmNvbXBsZXRlbHkgYW5kIHRoZSByZXR1cm5lZCBS
ZXN1bHQ8dXNpemU+IGlzIHRoZSBudW1iZXIgb2YgYnl0ZXMgYWN0dWFsbHkgbG9hZGVkIGZyb20g
ZGlzay4NCg0KVGhpcyBoYXMgYWx3YXlzIGJlZW4gYSBwcm9ibGVtIGZvciBOb3V2ZWF1IGJlY2F1
c2UgdGhlIEdTUCBiaW5hcnkgaXMgOTBNQiBpbiBzaXplLCBhbmQNCnJlcXVlc3RfZmlybXdhcmUo
KSBhbGxvY2F0ZXMgYSBjb250aWd1b3VzIGJsb2NrIG9mIG1lbW9yeSBmb3IgaXQsIG9ubHkgZm9y
IHVzIHRvIG1lbWNweSBpdCB0byBhDQp2bWFsbG9jJ2QgYnVmZmVyLg0KDQpTbyBub3csIHRoYW5r
cyB0byBUTFZzLCB3ZSBjYW4gZmluYWxseSB1c2UgcmVxdWVzdF9maXJtd2FyZV9pbnRvX2J1Zigp
IGZvciBnc3AuYmluLg0K
