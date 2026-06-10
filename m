Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9034D4FE
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115557; cv=fail; b=HURK9XkDJnaqtFVQtMiomXORQVOt9yRX5fjrLhgIzQSS7B5JSYYMGDIcXFVed95U3SJHZFGqrDX86AL9t0c6xkw7Va/MtAbzC7gdA50wEXZzaGim1AUy0rXRTsV4/uRd0ag2llGapZLI46jYYXd0o5wnqKrGX1Iw/+Gmhp1UubM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115557; c=relaxed/simple;
	bh=1QcjLkJkO0H5OdqAc9oAZUufQ033yq/7R1sa+9/UQcg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=opgykDeg5+vFs50yc7NM2JRCyjIGpTW2AFdkt6ZLN0Z25dDj12sa5iTXsIQl4JIegcCffc6xb9WBHpteqpRbV5dKbENY0rcTNAX/LfAu9vFcjLQ7+WlvYsnRkfyyEdroGbOXHChfMSiRDSONHlzv1TDtzPET1fdYudhaGhgBoBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cg0kXPB0; arc=fail smtp.client-ip=52.101.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cg0kXPB0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX97dy9OxG/b3ENzA9aTUW9ew7Zxbu6+oP3BSgLWfI7vnAk12ruFjzs5RUXxz8KPVcGnwFsCDJ1KckhHq729HFFukE2uQTfTQywZgUVRuSg3Df9OWmTaXoQaCkTy2n0G8K4T6OZa85S4LBkqx2ckTFmRVEIMIKOFb3UtOvdlB9rLQcmg4iU353mQS0IMh2apFUOMrvOm1RUO9ydytijUAgLbR4HhHBFoU3WSk5tIX8ZlqHH8Pn10lDgncZ/hLRJdCz4pBOGhc97sB/xOay/RzlfBIvcIptdgUuPKsYRsEpV7jvzqTR/lY0CwdngwM4c2CmLnHk6QFH4K6OxS94JN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QcjLkJkO0H5OdqAc9oAZUufQ033yq/7R1sa+9/UQcg=;
 b=wLAsNYlUGpozcRq42T7GfMUH6dul1GId6dNnCKpQE1XA6VBXzblMxvjCY5rTWgS1cpZluTXZ4BVDWhkN2cl8x3bXwPjoYxvWZtMe/kVojY0gmyGwN3nFX3Zkl+qT6tbmf5d6sJhR9nfMQ7/GXp8YdPjcWQRhtwRGnQrfDwDP7HJoxuCHOgkSayDNMlZYENR60JL/5jHR++uJ8HAcYT8Q50WeIzogonaB2YlnWWCYJ7ugH0MsEJstzvJE5qPuaoi81+VAQGzydnQOxzC2rOTVm5O+SgSsDRLhgpY4Rml0G892Mdg46ZfA6hHMzRMAcrlX/jaBzs1iDAHqK9NOVAueBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QcjLkJkO0H5OdqAc9oAZUufQ033yq/7R1sa+9/UQcg=;
 b=Cg0kXPB0p4rD0mGHeTpPPs6Fyhzq7JGW+ikDG9uMuHWTV+Wp0I4bvezQDx10RQd3e4MNH8jWLPUnZHILYK8tiQJ99lVL075UlH2fOwCDgoWTuHOqsZtWVJgfbrWn0KSoMVCN2UmB8m0iuqiQIJwdTyBRXPznSyvDYL02wkICWe0A+vQqt3AwOvxK+E3VMwyo7dX6jqqRFSW7IpV+j39lHB2vuTfk9LfjohUfdiKs8xbw55YAf8USxTjW6aop2Q3Q5CfIDFyXGwYQzayDRz03mTP1hkycwG+0dp0BE/FpcediV1vUveiVeQ//e3tY+lufKCDu3dRFUM4G2WjHVzNTpQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 18:19:11 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 18:19:11 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Topic: [PATCH 0/8] Transition Nova Core to TLV firmware images
Thread-Index: AQHc+QGRtz2UsSKeXU63ddOrzskdkbY4GGIAgAAA3gA=
Date: Wed, 10 Jun 2026 18:19:11 +0000
Message-ID: <4c9168113597793d01fe9f3d60a5554cc1895433.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
In-Reply-To: <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM6PR12MB4171:EE_
x-ms-office365-filtering-correlation-id: aed04a41-91ca-4bb3-247d-08dec71cc551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 8lqb0VAga9+khFx0BfLgfoU48Hfyr8+EBe0S+Q1oIIE1kJyWriBltVGG4qYkSYmauUBq5VaX/rJPLLYvrHl7Jlt21QtCxeeaGeJjDbwqEfU6tQmdjE2qnb2+hUyEolaNsNUZfXDQs7Byy+PhjW8SFXqSts4S3f6j5q41oZlIZx8DobPM9ECgTCNSB5IF2ePBhFNGjL8B1Jj7Gg29H9IWeCrOyuIk7wry9/Y2wxhfdPfj0Jb7tWDGwcgssS0fL/k4qBvhydS+UX7PovRfdLbhxgTqRxw3x+nvueE4Xh3nWEl+iFFKkOEotVPcfpxOaeed3Vtst36rX+xghzuLiW/+aMOF+61UW6UMzeFTqUG3ufKct3WOjJ1eBM2bl/yq075uasKhFNjs7vCu4WHocePqvOdmdIy9bsXRxYA82FmXF2NKfOss2T4Jz+pyfSNn4FHvSox1Q+q+P7q8UACbp0MgRgDYW2t3v5AgdnrJz2ZQHaRIFGvCJTB7RvMOgBRazfCATGKiYJUTCUcpigLoJwd4EF9rtr1qKpVR/vTH0xJspv1X21GT3HUNFDAoXKbx9xSZBzaLxKLiK/p6LslB3YFKAhBCIkQTnsqkAAukOMuBCJQDY7U6MFFRAmE9zy9IZI3lK+WcKgVc1k7LUgo/XkDMmZ01ZWolG5IQEQ3e2A9fmhRAimLjGk/RWoEyJMxT0dz/QS85ReXs08P4rwKeTjQkgm+XNgEqwU2SYi5IvmeD1daA1Gx6ImkS/5xWjxnHXbnM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGhTUm5QbFFXOUZjNXg5blY1YWxwaFJ4bFZycUYxaXVHSlBGUGMyWlp6NGtY?=
 =?utf-8?B?V0NYbHVvdWdFQzJpa2hVSzlQd2ZldzhwL3JvSzVLZktPcnV3eVNiT1cwbkZC?=
 =?utf-8?B?VXNCM0xkOXRTZzNqMDAvMVJ0cEFhek4vdzdaeXk0UUFGU0h4S3VmSG4wc1NE?=
 =?utf-8?B?dFRtdVZXeW5kdW95enlpY3luV2QybjRmK2I4TmJiSmk5MDZpWGVQWXo0eEdp?=
 =?utf-8?B?eW1ESUFPWWtkbnNNODE2TmJ0UHZSR2ovd0doOU05Y0pUbUhJeFJjdjFOVktn?=
 =?utf-8?B?TFNJNFpxNkt4eXZncktSdTRDR0dUbG8xclQwSEIzZTFGaVdUaklxUFZHNnZm?=
 =?utf-8?B?SnpZNWpQWjVsM2QzOHpSNkhmYVJzbmZjcCtyWCtvcW9iWlB4S2szdGxBMjJD?=
 =?utf-8?B?V3BlMXlNeFdtcytBajUwTXZ3cHVKbjgxbUgxSG9YQkJocGg5YVh4SWtNS0Jr?=
 =?utf-8?B?djZtVnpyeGVDeGNpdi9acFV3bmxnYm9oQm9nbVpGL3pFTnZXVmFFM2lPdTFJ?=
 =?utf-8?B?aFNDZi9PblpOSm9JUVNsbjVMK05JZlZTZVBpNUNXUEpLeWFGcDZHUEJvaG9Z?=
 =?utf-8?B?SDdadWVGeUdVV29WcFpSWUpHMDd2RERXN3JiZms0VVMzUzFvQVJ2VFIzSHB2?=
 =?utf-8?B?dlFzbHpSczRVZ0JOSmRtSy9wSUlVeklJS3lTVWNlcUxIbCtuTzJKUHdCRktl?=
 =?utf-8?B?TFFTZnFLYXJaalUvTStzSzlSbG00b2hLMVZRVFNsUXArSElNZEdtK2YzQkVw?=
 =?utf-8?B?Tmkyb3hNR09lZUJxejhKQ0dmaFdYZm51Mk5KaUZzRW5mSDFhUW5nc3kyclha?=
 =?utf-8?B?V3JVdjhDQmN2OTB6ZytQdytDeDdESXJrWE5tblhZTkpYK2tIYmk5UllOMnBa?=
 =?utf-8?B?Z2VOZjd1N3NRQVQzOFVnaWEzWUprMXNGTTYxa1FzbkZmVGo0Q2wyYWJTeTdD?=
 =?utf-8?B?WHo4UnREN0RMMzduYW9pMktmL0hQcFlpVXl1SDRMbzZyRlk2aTFSVEwvTDAy?=
 =?utf-8?B?Tzg5bWIzc1ZHK241RGpsTGlhbTVqcmF3WXM3QndZdFhRSU9zbTBSUHRHQW1G?=
 =?utf-8?B?K3kzVFFINDJ2VnRhWGRtdHFwNm15b2ZOMitGbFhWdzErS1l3NlBEMktHbDhJ?=
 =?utf-8?B?Z2dNdlJ0Sk5vS0xiQ1hhb2lrNmZxQ01HYUxnN0E5K0RCTUxjSjJ2YjMzWkho?=
 =?utf-8?B?eWQ1OEFGdzRBVzhBQ1FLUGxXeXdZL29PZzI2V01jL1dlQ1dxWkxlUWtLRXJU?=
 =?utf-8?B?b0VVS0grcWhCR0NiNVJlS3lSajN4YlNuaVFBN25KSGlvMkR1ZVluZTR1R1d2?=
 =?utf-8?B?WmdmV0JNc2cwYkxZMTVldTdWTW5Gci8wVXlYTWxKOHFhNVZ0elV2a3ZybmtX?=
 =?utf-8?B?R21ra0hPUWdPUThuMjhHZ2VVQk9ZVzNhNWNiRGRCTi9WRkliQ2J4L1VjLzdF?=
 =?utf-8?B?SWpuUWlZeHhSZEhBL0ZzUXZJUDBGR1JYZGlqUkNNcGVPQzRWODZRVnhqN1gr?=
 =?utf-8?B?TkZaODRqNGF0cnJmYjY0ZUFxQTNrREtvMnZzN0E3V2FJZVpiUVRnaU5yTU9a?=
 =?utf-8?B?ekZJRnh3ZUdRLzFqU1RBendvWkM5ZUdxaGhLUm9TUUJ0VmFIcVUxWEU3c0s2?=
 =?utf-8?B?MlRrMTRnc09WNlBXNzFzN1ZJczJDcmcrMThXeDBrMmk0OFU4QjJ2OUl3MHl6?=
 =?utf-8?B?eXp6TjU1VlJURjlBRzhKZGpWRlI1STdSQ2o3Nm05UjJTVW9BMW1zL21OM1hh?=
 =?utf-8?B?ZFZMNm9pQWttQWJ5cGFtc295dVhJK1JiTlhkalQ0TDZPcVgyQ3paS2h3elg3?=
 =?utf-8?B?T09LaFcvUnFhc3Y5Tkh5MmdSdFpOQ1ZsMHc1ajh2NzNsSm9yWWQrbXMyTCs0?=
 =?utf-8?B?R1RrVnpaeEMxSmpMWGpVWmFjOGRpdThTTVVvL2h5aWo0M3JOUEgraGpPR1pn?=
 =?utf-8?B?OEVJUE9WWG9MMHYyVlVncWMrUmFSNk5ZRVBVQlZNZ0JFOHFjMUs3T2o0cnVO?=
 =?utf-8?B?V3o5VW5CWWxKWHYwQ3lxSXFVRzcwNm1lcW9NVkZlQUZobDRtWll1SDhzeDdU?=
 =?utf-8?B?MXVsTE1qTmRBZG95L20xVFFZSlI2RDJqQmNWVjFwQmIybTBPU3hJNUZRS2l6?=
 =?utf-8?B?eFZOYkFuSHczRHB0MzhkeThUdU1DSzhkai9WdXU4dStWYVIxTS85bEkyc29F?=
 =?utf-8?B?SXg2VWRqSVl5bHpjWG5PNzlncHJMSHpLYmE2Qk9nZ3FkNFU0a0duR0l6S1FM?=
 =?utf-8?B?ZTByNyt1b1hnbXlQQ0E3VVh3QzhxeEI2WEJJcVFmYmxuSGVndDN2N0tUOEFX?=
 =?utf-8?B?SUtEUDZzNUFwNkE2bFE4enhRQUJqWDBUU0FOQVViNFNIRUlCd01ydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00F964A695BF69488AEB4303F9A78E2A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aed04a41-91ca-4bb3-247d-08dec71cc551
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 18:19:11.6149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUU61C0Lqc5enRKNg4f/FtYndPnwLD/WBMo8gcWnQHb7I7BrkHCKMrE8YdwMR9tyGGJImv49fZixKOjsVnBbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDExOjE2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEdldCBHUFUgTmFtZTogRkFJTDogR1BVIG5hbWU6IDIgb2YgMyBHUFVzIE9LLCAxIGZhaWxlZA0K
PiDCoCBGQUlMIDAwMDA6YzE6MDAuMDogcHJvYmUgd2l0aCBkcml2ZXIgbm92YS1jb3JlIGZhaWxl
ZCB3aXRoIGVycm9yIC0yDQo+IMKgIG9rwqDCoCAwMDAwOmMyOjAwLjA6IE5WSURJQSBSVFggUFJP
IDYwMDAgQmxhY2t3ZWxsIE1heC1RIFdvcmtzdGF0aW9uIEVkaXRpb24NCj4gwqAgb2vCoMKgIDAw
MDA6MDE6MDAuMDogTlZJRElBIFJUWCBBNDAwMA0KPiANCj4gZG1lc2c6DQo+IG5vdmEtY29yZSAw
MDAwOmMxOjAwLjA6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciBudmlkaWEvdHUxMTcvZ3NwL2dz
cF9ib290bG9hZGVyLnRsdiBmYWlsZWQgd2l0aA0KPiBlcnJvciAtMg0KPiBub3ZhLWNvcmUgMDAw
MDpjMTowMC4wOiBwcm9iZSB3aXRoIGRyaXZlciBub3ZhLWNvcmUgZmFpbGVkIHdpdGggZXJyb3Ig
LTINCj4gDQo+IDxyZWRmb3JnZT4gZmlybXdhcmUgJCBsbCAvbGliL2Zpcm13YXJlL252aWRpYS90
dTExNy9nc3AvZ3NwX2Jvb3Rsb2FkZXIudGx2DQo+IC9iaW4vbHM6IGNhbm5vdCBhY2Nlc3MgJy9s
aWIvZmlybXdhcmUvbnZpZGlhL3R1MTE3L2dzcC9nc3BfYm9vdGxvYWRlci50bHYnOiBObyBzdWNo
IGZpbGUgb3INCj4gZGlyZWN0b3J5DQoNClllYWgsIEkganVzdCBub3RpY2VkIHllc3RlcmRheSB0
aGF0IHRoZSBzeW1saW5rcygpIGNvbW1hbmQgaW4gbXkgc2NyaXB0IGlzIGJyb2tlbi4gIEl0IG5l
ZWRzIGENCnN5bWxpbmsgZm9yIGdzcF9ib290bG9hZGVyLnRsdi4NCg0KSSdsbCBmaXggaXQgc29v
biBhbmQgZm9yY2UtcHVzaCBhbiB1cGRhdGUgdG8gdGhlIGdpdCByZXBvLg0KDQo=
