Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEF2D063E
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780963237; cv=fail; b=GJ6+xGYmAzXIBln6wsTdEWU2QNIweAdf3DU0IjgqaBntvzajPNppk5MRHUt+LBj+LDVPWD0dzxZBMAdJBt+ZOjkkSYaBhH0eJW9LPPUiwmZLjcYreL6tdrItXc/bUor37Q+zWVCbAf20nMfcF16Mv+VDXqMlie22nYRC1dIaDUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780963237; c=relaxed/simple;
	bh=8lIzDexUvCqIfGv1Wo9oAZ9r1Dbv8F8B50PHeLfFwhk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FE8uyJe747gLq3BkYc3iZCBudXhEjC1yue5NUGdU9xxQVjJUchdiS5yrmfiogVEBuw/JoFEYKjDQtYrJeLO5C1jMy+sYdHy9L5gsughAzdtUsE8vOYfJMxAjgaI4hAh6Fh0aLu7weBoUwobylEhn46ctXOu0N4d9bu+sLM/lafg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OwDg7quX; arc=fail smtp.client-ip=52.101.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OwDg7quX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1tkA23rCILi073VzmMPmmGOTk4LU4K4t12QiXAUu2CTbEcsMLFZELhjfltUS84u1yyWGrrnX/8oCyVaV1KcqhdOL5LYfHmU+0Fn16C6ttCWGTdPn5s95ZjEnoFRNWuN/3DErgsDs5PW+gd3F8yZPUKv9ZolGJzOiEVlDV4hvSa82dmn/gulwj0ofrgePOTpOG2CZvSJTh6V/UYlihUSTHMuvUeK4H2d2q9hjeFkueODQYd85PN4vryV55C3N5UTjI+Ff+BuIffrHPhnbneHkSEFDYX0F/riBuVL4JqWCVHsuKeP+M2iv263iQ2qoyQKMbNu9LgmdQVzJERrGPVR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lIzDexUvCqIfGv1Wo9oAZ9r1Dbv8F8B50PHeLfFwhk=;
 b=ufgU/x6ttaWIOcx00CcpKMlNgo64k8AOVVm3YNZ25QfNGICKFJlPnUd89BbLh31FgTJMExOLVEilSoBjHrsbDSNclGxjsX5QYXfYJy2JHjRcc6hkqfZkgM3XKIgz8xq8eTkH7EYE/RVd535tgUMT+pZjsorSVa1cw5P7X6HJin57sAzCofggUjwB1L8Lg2IWjfjO7P2TjrSVDBtCShKgi0E1cjlf6X2rUPIj6IZt4diEoYDvdkjAnIzMSSKxmTSQsQd9IvKmSu5db2AAzcfERM13DCFkIQ+3qCBo/vAXi23OjTplF5JcaSlF/WafumgGyP2uXm2N0vRX/3//vPyelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lIzDexUvCqIfGv1Wo9oAZ9r1Dbv8F8B50PHeLfFwhk=;
 b=OwDg7quXpsFNhqLtiXyoxlMy0VAUy7/LukK4TXU/TOgqYE8dgsYUBMpoVFw6PeOAD/bU9MvSBisFvpENvnJfGEFiWzp5zVp3UIbZ6WziAc9wBMyyLiodF1ERUZjwQfunR2EtKc+YMhwUb4RSB38Hyaf3ndJuUPmCiU9GbReghxIUpKKWldIDP6DM3dT36WIrJofSlpDNucyhSnSFTKK/cPoBzLRAk33dlk3atdLgmdThG02NowRXGJCycsO4NG/ycz8rDK83H/Lm4kuMWtkhKpxdnUKVsbm9nNGd6Q/0uLQ/ySr0deTZ2BL2sbBbq83nstnkn7l0ZFYXvzE/zWgLxg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:00:31 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:00:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, Shashank Sharma
	<shashanks@nvidia.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, Alexandre Courbot <acourbot@nvidia.com>, Alistair
 Popple <apopple@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
Thread-Topic: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
Thread-Index: AQHc9tIs9PbJ248ymEuz0X+qpSg2kbY1RraAgAARnQA=
Date: Tue, 9 Jun 2026 00:00:31 +0000
Message-ID: <2ccadf609a4bcb9b4aad5ec6b6998fc352dc2f12.camel@nvidia.com>
References: <20260607230539.144382-1-jhubbard@nvidia.com>
	 <DJ41FNJHLCJG.4YW9GS4MDX2C@kernel.org>
In-Reply-To: <DJ41FNJHLCJG.4YW9GS4MDX2C@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SN7PR12MB8131:EE_
x-ms-office365-filtering-correlation-id: f66b7d2f-bb9f-40a2-88ed-08dec5ba1f70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 shTyALSu4dNQIuZjsjFpUed01JVuMni1XSNO4LyN/dT5hULDVffoLRypiak7+dA64FuE6AI1yjI1WCL8Pc0Sk8I2DLLiSbxBH54b31Hpuf2hV0so4Yb3eVA7c06GX5sMDWzjnYASb6CgyUCb2Yy/qF0YijNxWAODBrcr5so/ZKpbK2XH8PNaRVt/nhWVX8mFDCNrh4T7EiffNuJmD7YEOT4K7num9k2pyiLnr4lHrtrFeEEvSaGLHo7QReFq7Jy7+xBXBaPR0HCf0QD9TcQxQ8FI1Hl2AjlwswfbEL05ZA1uVdNqAH9EAkkktynKVR2AK/XtpVidpQJ9CGDJR8ILQcdOMw+34WX+RLD35CZsjG92tF2kSX0DwL10pG0TtD7X+mPgugmaOrZRvw1vBweA9aHtcDF8CC2U08Cdis4D7F9ONj77qni61vDd2gCtZE+6ytWnjpgEKg0+47wJ8sdDcx6sIE1pbFva/Z5PR9tELVKu19vvcHOdmWbVuSmf0FMVHWKACTAjpV7w/ZNGD0mv7mNjnaf95N3PIqBH/vp0oiXxS9/UEEV8SYlxNc4cswkGQwfw9tDHD1dSvoCL1ykDMdqavjUuYn6BbbyHv11MGYqTdZREZ2foqJm0e+++lDyaUkyaiNTxqOGenKfTGuGBz34e1Mgh9POfQUlUo+dLjCp1awvdZYyZ8nxec6yyqw+thy1p4DPRxgRdQW2fKIj6HBswHWxZ5DhIHODST3LohLTnYz46BVI3sMikwjqSqKP6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TS9aUlpmMmVCWUJJSTJmM20xVGRGbWE5am1wRnliNVFvalltOGNlZlhrQW1B?=
 =?utf-8?B?b2pxTW9Femp3UjJYSWxGSXhrSEtCUkFyZkpaWEJmNHlqZFZQN0xoRVBaREJn?=
 =?utf-8?B?NFJQejZOYVZoMWhvT0lDWGxLSGVySnFhRGtwbklpelFLUFFNMDhGVW8rV2Z0?=
 =?utf-8?B?bTBFTFRGelE5U2pnclkwdWI1bTByVWtHaERJQmc4SWI2SmMvbmIrVWpaWUM2?=
 =?utf-8?B?dnVtLzEyUTBTU2doOTdud0o3RUxSeExlNmI4d2t2OUNYRmhTQ0lyeEpUeU5C?=
 =?utf-8?B?VW1mT2xPMHUwSW9CQS95bjVYN3ROQ1ZUMEtPRml4Y20yYWQ2K0VpaTVnT29D?=
 =?utf-8?B?YjdTQXNXb0d4NFp2dGI1a1RyU3lmMk5qeWNMSDA1YVVFdUx5aDNoSWUzTTA1?=
 =?utf-8?B?ZGhJRmlHZk9mQk9GU0lzMXNFYzlQTHd3QXR5ajNFSk5RSFJBZHFxNVNmK0hI?=
 =?utf-8?B?ckZFY2REcmVxV1VsZWJDbXlBNlRWTmV4TTI1NWU5ZG0wSDVmN0lPYm1EUzlQ?=
 =?utf-8?B?clI0SCtYcUhucUE1M2VibWVDVExpMHlRNXpEWkNUb3Yzc2dSMlZHK3JPd2JW?=
 =?utf-8?B?L2ZpYWVEUFlxTWZaWUpOcHBPNG96MC9yT0VkODVEem92SHNBeEplQm5SUW9a?=
 =?utf-8?B?TVlQdE1aK2o2bmZqWmtxdDdzSFd5bTQzMGVWeEovMkJwQmRZSXJhRGd1dzJo?=
 =?utf-8?B?S2ZYRUZjZGIySlJGVm5tTWxweitLMEVqMnFXN3V3aU5yM1haWHhFc0hkVHNE?=
 =?utf-8?B?S2J4c3BNSXFFWWJ3OURiNWZHbTlybEtRUmdRMml6UnZ5R1NjaFNBV1FQOEIz?=
 =?utf-8?B?eDJwVmx6SlFxMHJGYUJmSDAyK0NGZFltQWt6YitEWnpKVHlnd3NLM2QweXBn?=
 =?utf-8?B?RHpUZ1djN0JQS09nME5JdXNmUmJMS1I0K0hLdzVSWDVRVFZlUS9ueGJxZWpI?=
 =?utf-8?B?UFdRS3MvRGdha2l6QXhxY0xrRytpUUNiOHNwK1ZjTzl5cmJkNStuYXJCTTZH?=
 =?utf-8?B?LzJvcUtlVE9UZy9MYWFKaXRSWmE1UVBkbzdhWHo1Q1JINkRGMWpjZjY1SENF?=
 =?utf-8?B?L2ozdVNUbXEzQ0N3a3cwQzIyNzQ0ZHhSR0NGeksvbDJWVkNJNzJzMGM0UFd4?=
 =?utf-8?B?ZEJodHhxK1J4a0VMMk9WUzVpZ3ZqYThkTFJQOVJnbU1adDROWlVFQUJuNkJn?=
 =?utf-8?B?M0V1cjU1UVBZSm5ZVjNxd2lqN0ZGdk5OeWNVS205REVsb3RxUHY4OXJtUmtQ?=
 =?utf-8?B?QU53d1FsSXdsYyt1UzYrV1pXMWtZaW5iNno2cDBVTmY3NWpIOEgyZGtMc1J4?=
 =?utf-8?B?V0NEZXRWdzVFZ0ZhKytFM09xeWJRK3JKenQ1ODZ4ZWY3dE5tZVFON3l6ZWVO?=
 =?utf-8?B?dVg4dGRBR2EyaVRjMXRBZ2FLZWc4bFBUSFBzR1NxamloUE8ydFpvK1ZIbkpB?=
 =?utf-8?B?cEhGL0xkMCtuSGxOTFZjSmU5OTJyYXJtOE9oU0ZIQURzSXdCNi9FTjRWa2wr?=
 =?utf-8?B?Z1NQOU14YWtLTU5hMzRrNXVyNWhjbkNqblpyOWxoUkJKbWdUK1RUd0VDdDFn?=
 =?utf-8?B?YXFCUmdSbkVKcDFzODZxWmVxSTZ5Sm02TEVrdk5aMGd2S003NDZoLys0SFdt?=
 =?utf-8?B?cVZkRmcyODl6U010enpMTnRMUEUrbWVObDl1RElwQXhKUHdJTEUzdjU0ajE2?=
 =?utf-8?B?V09IVllMcnFpaTI3aHJVT1RLRWhpa2R1QUthdkM5YU9lSkYxTi9xWGFTUSt2?=
 =?utf-8?B?bW9jZFNTK2xkZkpRbEZhR1hKc1pHcGltbnV1WWo5VngwT2VoSFBnRXBNT3JT?=
 =?utf-8?B?dUFGOGZ1cVlpVjZIZzJRYlNhVVpaMlhVTG0zd3RmNC9EcjVvQllYdnk4anpj?=
 =?utf-8?B?SjdFUXBzdUdRTGxpeUFGeWRkQUtTblhOdUVxOGh0R3MydWlORDJOOTB4WEVs?=
 =?utf-8?B?NDBmU0djS05PR0poUDJ2K3dLclNEMDVwc2VicDRoWHZnR2pGa3d6bmo3WW4v?=
 =?utf-8?B?SW1PZitLbUVPckgrN0Qvak4ycUxmeStwQTV1cnQrNEZ0ZUdRSVJMbkExVkxt?=
 =?utf-8?B?VSttUTdhQmdFOGhYMmgrak1wd3RRWkttUHNFc0dyV3pvYUdhaGQ2MUdXRWZS?=
 =?utf-8?B?QllIM1IycTdITXBhVHV3TVkrOXBRQXpTcXdacTBITU90Z0xDUzRTbkRwekRG?=
 =?utf-8?B?b0s4bW8wUjdTek5mZm9sekQ3QkRKbjc2YkxTMlNJZUhjTis2aS9rVzlTa1RP?=
 =?utf-8?B?Wms1RWhwenAxcm1yaHVaRllSRHQ1Um90L2xyKzdJeXRrSmJZSjdzMDhCaC9t?=
 =?utf-8?B?cytvSHVJSHpCVjJVNHl6VHJqWUhnamFCdkFBVWJNdGdYM1duNFlUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B35C9A8E801AD408A9CF711344F1664@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f66b7d2f-bb9f-40a2-88ed-08dec5ba1f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 00:00:31.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fN8LFWDCSDziBWUSA+vwzGlxLD2WHufl6ImQNbjsTlgqkiYo3Sg5aJglEaQdyUXgZeAygyZ4X0Cw4fWyDBS7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8131

T24gVHVlLCAyMDI2LTA2LTA5IGF0IDAwOjU3ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBGU1AtYmFzZWQgY2hpcHNldHMgKEhvcHBlciBhbmQg
bGF0ZXIpIGJvb3QgdGhlIEdTUCB2aWEgdGhlIEZNQyBpbWFnZQ0KPiA+ICvCoMKgwqDCoMKgwqDC
oCAvLyBsb2FkZWQgYnkgRlNQLiBPbGRlciBjaGlwc2V0cyB1c2UgdGhlIFNFQzIgYm9vdGVyIGlu
c3RlYWQuDQo+IA0KPiBOSVQ6IFRoaXMgaXMgc2xpZ2h0bHkgYW1iaWd1b3VzLCBzaW5jZSBkZXNw
aXRlIHRlY2huaWNhbGx5IGJlaW5nIHRoZSBzYW1lDQo+IGdlbmVyYXRpb24sIGJ5IGFyY2hpdGVj
dHVyZSBJRCBBZGEgbnVtZXJpY2FsbHkgc2l0cyBpbiBiZXR3ZWVuIEhvcHBlciBhbmQNCj4gQmxh
Y2t3ZWxsLCBidXQgZG9lcyBub3QgdXNlIEZTUC4NCg0KTWF5YmUgd2Ugc2hvdWxkIGFkZCBhIGNv
bW1lbnQgdG8gdGhlIGRlZmluZV9jaGlwc2V0ISBibG9jayBpbiBncHUucnMgd2hpY2ggY2xhcmlm
aWVzIHRoYXQgZXZlbg0KdGhvdWdoIEdIMTAwIGhhcyBhIGxvd2VyIGNoaXBpZCB0aGVuIEFEMTAy
LCB3ZSBjb25zaWRlciBIb3BwZXIgdG8gYmUgYSBuZXdlciBhcmNoaXRlY3R1cmUgdGhhbiBBZGEu
DQo=
