Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1E487BE
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781146853; cv=fail; b=UNTmOoNCL+MNoCLEL4/h8X+YxCe/v3ZfzOTv06N5g2IbSgIQ4rJH+ekZTHxVhhlAvcTvestv3yi7P3fehsN367BxEzTDv3kQy7DHYKizCcBFXUt1wXyl4XcRGp8a49omx1b7NDr9sspQw5ks9tfirY5/VpYh1UiGMr2vFTQOIuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781146853; c=relaxed/simple;
	bh=6dUCFCEc3r7eUtP6kfa2dIcZDqsjf7bEmRQBRuQSyE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cEh0hwLpyTs/Sk/F6ZAh/6KlnwRIfFAU7YXs5UdgkmGIrSoUNZxuF2XX2Sl7hpUNoySlLCjU/zRI3gv3w2Si8T6NIRyg1mYt2lFcSS5fXB/Ra1K28wmfmUmN81JvnYoP/IPaAr0OzRiiWjOXXB2Y7VBZTgYlV6fXeSghR2u7ToM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WVLtVjZw; arc=fail smtp.client-ip=52.101.48.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WVLtVjZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/DfR9cvUFyqzqUIWQvhG0dfTpJ7K9kiMv/r8xfj9SbDzDNpXF/j+ABgPsyy5r4Bl8ber3uu0rKtkJ6Em394OtgqWvgB7JkDT5CojyyxYfJFYho6WO8NQUGeSUuy5VJUmUPFeMBly2OaHXlCAKB8c5qZZPPlITWvWX9gJ8IoZv0gnpyu8dyxzOe9XMzvdZ1c6D4VuMwrLEiRK0kmDjV54jI2BPsG3PlxR8C8DwsIWQMIUYbDdbugvLwNAFoKVqk0mouJTrCLbjq+IzuCk3v+p6OJGfN9ypE9+xD0sJDdV4oKBJKHs7MpxzIzostixoP8EXNJTMT7/GfVQ5gJNZdqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dUCFCEc3r7eUtP6kfa2dIcZDqsjf7bEmRQBRuQSyE8=;
 b=Aq98juDlHzrBrFQmpiZA1U0NOvdVZF9FFbuSOhV1LHr07DYjEeB2OqVOkCyiV6KwoB5MdTeq817BYSPJ/FJL8CqotWxtEAOg4Jl68y/7q2LqS3ZQILAb8iywxIY7L7zG4kqHLZbH6/oWWvUbq7tE1cwURF5wJaVy8XItzt4fo28fu52gpmRCwDGV4GzGYBZ3tVWTw7+f1CpYUw7jbIPtKSeFbccuYDb9HJjIAq0CNmrgfAHvivd/498PkDpiwy3DjpJCOJ3A0/hZZkBAjRJLfncmU4e0USxbR8YKCnDXBMCB06x0t84D/Um8x5dOeGmjafeqXriD5hP4k3uVS0Kb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dUCFCEc3r7eUtP6kfa2dIcZDqsjf7bEmRQBRuQSyE8=;
 b=WVLtVjZw3dbD3KAr8hjeiDINxq5rRjmgfuMOOKswQfXrc0wHGzX4RDYaDoNPOalVaGAkOzfTrQKTuO1YsGXQW8zRN5q5r5aSoW7Y+v4PP55akjGuDH0SEVa0i0XCir4lwZlr5n27r8PJIPh89fp1KkkJnkeX5KpHvfyHi5u6sEudUaTAlVJ8QUcRn5GmCwB8yiQE4vSNrvlF6r8yXPX8ro5717R8g1fEc8CNlcKPRtzMqAEyvoeRIJlOiHgbEWzy1+52jGkJsAXxh0LPsg4QBgCjPrKDLlFNFqhWs1a4SQnglxXMVOLq5KaCBqJSdr42Q/nAo7LAAoKqh9jFgH97VA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 03:00:46 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:00:46 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Shashank Sharma <shashanks@nvidia.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset table
Thread-Topic: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Index: AQHc+TKs/PC2gNH6y0qc9KYtbM88g7Y4qpoA
Date: Thu, 11 Jun 2026 03:00:46 +0000
Message-ID: <ccf5f6c3ecf84151fac418cc026be318db7099fa.camel@nvidia.com>
References: <20260610234128.547952-1-jhubbard@nvidia.com>
In-Reply-To: <20260610234128.547952-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DS0PR12MB6437:EE_
x-ms-office365-filtering-correlation-id: 117f360b-a969-4c58-79a1-08dec765a295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10070799003|18002099003|38070700021|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 aYoK/HE3hGeXG/8OYH87IR8MnHQioa4ckGZ48heL7qRpq7xVQ+qLtlRe1VwNQwU6X8XG/5ctE19fjPCnFVDXT564/G0LOMMY5DpaDA0NO9s/6Zj9m04M2O8lllZqKqH53OHOeNKrH6DXzNbfs7//tQDd0Fm3k57f6mjY5oPN1Dpfh0NvzngnQm0rosmnAFivTchDhxjMdGEdCOy8u2AdyY2Nov3VVQJ4MFEXnbOZFVRn4qEC1LwJ5mm2AnvshSb5UaEMQiDppE4LMDq+ve0l5VJdhDRnjs+MHrECOAQAjnnEdD9Ingwx6Y1FaOGux8OeRaCPHgmlGX8hvSTBHO60Kdn4ZV7gG1ActdFzzh0J70jrc42/ANWMC/yFrNA8C5YvRXlYQRPJHaZlk+zbXErA4paulxomDUxf8N34QjBDCDGPKaYTaSG4XzOQOIkhvZm1kIl+btu0ZYw8oLZ8gqXFZhj+PKersFDW0Az704W5VBu7ObMaGmB4h+ObuLMih7KYI94l2crBhrR7QEbHYqcGX2GDtnH1KFvPtEK7Xt8u5gyitFXDaBwAJmxukRe4U7L305oPvvzPmjS2xunbY3PPVQM82mwRCBsJbyoXEzEK+EAwx78hylMxVY8pPVkX3AIFTBJHoDh++13h+X5YMUj7eKP9IjZ9nE68gNm+rPJ6HTo9gztXy0DaT/0VMwlDnstItgNPo4d2TcwsY4t8XWAr/Q3VTzDvTrFHh1D9Il0PexeCr8wOeSEakykoXa8rlGkj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10070799003)(18002099003)(38070700021)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXFoZGhVWjZBQjNVdjNhQmVhWXFRM1lLVy9lUG11N0tBMitlcnZaeG9Ma25V?=
 =?utf-8?B?QmRydENCUEh5c1pOclBDVDIzSU8xQlVwazY4YkxOTzUzR3dxaXFMUUhFWmxo?=
 =?utf-8?B?UkRGeVdEVCtVNlRkZzhMN1pQTzExWGFydzByTTFUWUQ1dVdIZkNjbEtjMzJH?=
 =?utf-8?B?Nk9SckpOc1RvNlpBbXVHcjRtWlVpaUY5SG1PVWZmamhwNXF4cjZCaEgvWmpS?=
 =?utf-8?B?VGQyWmlTaXpRWjhUYm10UHF3aGZoclVNRUVDejdza2ZMdDNHTE5ENUUrWXVk?=
 =?utf-8?B?eTJCczcvUVlVNUlRSW0rTFROSWsrdnRieXFEZzdQOEZObHBTYm8xRVZhcUFi?=
 =?utf-8?B?V3kzczBLTDBETXNSR1lUVkFHR3N2WDE2czhyeDdRaVM1Tmh2UzhXVGppWWR6?=
 =?utf-8?B?V2dtdWpOR2N2RTVUSVhkd1FhbFhPTkYzNnFvOFNvUmhFMGwvdHB0ZmRLaUpX?=
 =?utf-8?B?UEYvbFFVZUdmd2RKZ0pNOGhReDNuWmZMc3hqNnZUNWhoaXhjbGlHbEMzMjlG?=
 =?utf-8?B?QzNQUzJwSXNhRU5SVFlDTDhDM1NKa3l5VnVzaXVBUlF3UHNURXdmamV3ZEJM?=
 =?utf-8?B?dFlLWHliUmVUeHU0WnNWZGRSdEI2OTUvL3RRcldvY0Vvcmg0TGkvbC9nQkNz?=
 =?utf-8?B?OCs0K2lmbW8xMW0yUytCK1dhVFROSWFqaFptakdFMFRYZTU3WlNUVEJ1YWJQ?=
 =?utf-8?B?U3Q0aE4yOHVmeTJyOUdYd2toZXNkcUlPVEtQcWdadzJ4bVlpS1cveWdYYVdr?=
 =?utf-8?B?Um1qd0ZyOHhkZGZIakVwRWU5ZUNMMU5PVE80ZDk0azZyRzMxWWJEYWo3QUVQ?=
 =?utf-8?B?Z0R6emNNY0NBeEVGTGhLN3l2am0xdmFlUy8zUFM2QlZ3cmhUWW5DZ0d4T1Vo?=
 =?utf-8?B?SlBiNkljejhBdE9DbG9XRERYM1NCQnd6YyttTGx0RmZtN2ZuUGpHT0JFTTFP?=
 =?utf-8?B?aEI1ZVQ5TEV5NWVodWdwOThleE8wUGE0ZWY2VjQ0aTZhKzMwNi8zWXRWYWxz?=
 =?utf-8?B?T25mRC9tZDc5Z3kxaHFPSjhNNXBMNnRoNjEyRHZsRUZEbkloenBGQmRtSGpk?=
 =?utf-8?B?Q2IvS01mUmlDS0t1Sk80MXhSZkxRVUljTCtkUllWRFZzM3Nhc1Jja2ZNYTJr?=
 =?utf-8?B?T09ma0dVR2ZkZCtCNDY0Snh5QnVVdDBtSDRCQUYvaXR4cjlROW9ub1VWTkhY?=
 =?utf-8?B?eHhtdDFaaVlxOStiY1hiL3VXUFhVZVdCRXFIdXJ2UEpkdldnQ2M1dW1JWGlN?=
 =?utf-8?B?MDUrS2FhckdGTUFydEdEYXpTQVdwa2krYUtHNG93N3YrQVkrMkFiUzlzUm1R?=
 =?utf-8?B?Um43ZlB0akZwZE1IenpxMHVuTGZxa05ibWhRTTNuY0ZGM3FBZXFYTE1yUzFV?=
 =?utf-8?B?ZXQwMnhKOFplcCt2UUo3WFZGZGc0aUpEb2JCMlg3cjdQOWNabFE5aUNYQW5u?=
 =?utf-8?B?OVNFeTQ4OUZSQXU0N051K1luMitUeWNONnpoVzZVMXV4djVsak96MCsyY2Fh?=
 =?utf-8?B?WlU2alNvMm9LTkc2a3ZXWnBaT2k5U2xka3Yyd2F2S25vTWZ6VnNvWDBDNjF3?=
 =?utf-8?B?UUVvNkI5SC9YN3B1cjdRRngvaXVuZkpqRmxhLzJ5QURROWFNU0NiTEsxNVFG?=
 =?utf-8?B?WVJLci9CUkhJYVVNYmNFN1hKNDZGV0hEMmdGaGdCdGxKbjc5YWpRYTJjWGdG?=
 =?utf-8?B?djRvc3ZtSTZsNkZER3lEUHkwbmxsMHZjM1Vxcnc2OFJ3eG11VlJLN2xockVo?=
 =?utf-8?B?YVJ0OWI5OU9vZktXVmN4Qm5RcllFVFBUWUJtN04yaHVwR1pwekJXcE1BQXN6?=
 =?utf-8?B?bXZRYmt3aFNmbm9WN21Cc2NEcFhKZm1neDl5VlltbG5kdHJOR3VWbWpMVGpo?=
 =?utf-8?B?WjV2UytZV1U4NDFHSHVremNJNnlpbnV3YWVlQzdmLzZYY1VXQmRnOEVhUkoy?=
 =?utf-8?B?Qk0rYVhTdTJwaDNKOFI5T1RJSndKUlBGbW1uaXBBMTFLS0hnMTA4MXdqZEVN?=
 =?utf-8?B?dW5tYk5GUTFyL01wcHVBbTZ5OER4UGpuWC9DaHEyeXN1TkVYYWlJSjFpVDRC?=
 =?utf-8?B?MzBNeHQxaGxPT00xcE9JOG5YU3VKL3Jjc21mQy82UjJsa0hZQnZTQkVsWlMy?=
 =?utf-8?B?SURJSi9MTkNtWk5VT3JKZk4rOEpsMjY5Lzg1OHpLalI0TmxTWXoxajNoMVBO?=
 =?utf-8?B?MytzeE1DMERpRU1nSTdCa2puU2FZaU5JL2J2b2N1L1lxbHhDK0J5WWdxVHpj?=
 =?utf-8?B?d1dQMlh4cGRKUVJ3cG02a1FNRlZCTVozM3VVN2xaZGZhTXZObjZ2Vlhtdk5z?=
 =?utf-8?B?THJZZUFkSEcwSlpVNk1sSHVmN3k4RGQ3YmpkMUFEMGNkRVFJWkV0cXJKSHd1?=
 =?utf-8?Q?UEiT7WnBnu9pXoaOUAvjd2Wdag8i1ySDuf+haI9wCiBPQ?=
x-ms-exchange-antispam-messagedata-1: I+XJDeHnWM6MVQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1DC905741CCE24AA76FC4FD30AD86E9@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 117f360b-a969-4c58-79a1-08dec765a295
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 03:00:46.5397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCu//SvIyOhTHKKt1qw9yBDl1fQ7ciR+8RfWU+23KGdnQfXIjO1SRq9tntUwTQX8YPB4bLB8HbnS8Kv6Pkm/9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDE2OjQxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IC3CoMKgwqAgLy8vIFJldHVybnMgYHRydWVgIGlmIHRoaXMgY2hpcHNldCBib290cyB2aWEgRlNQ
IChIb3BwZXIgYW5kIGxhdGVyKSwgd2hpY2ggcmVxdWlyZXMgdGhlDQo+IEZNQw0KPiAtwqDCoMKg
IC8vLyBmaXJtd2FyZSBpbWFnZS4NCj4gK8KgwqDCoCAvLy8gUmV0dXJucyBgdHJ1ZWAgaWYgdGhp
cyBjaGlwc2V0IGJvb3RzIHZpYSBGU1AgKEhvcHBlciBhbmQgQmxhY2t3ZWxsLCBidXQgbm90IEFk
YSksDQo+IHdoaWNoDQo+ICvCoMKgwqAgLy8vIHJlcXVpcmVzIHRoZSBGTUMgZmlybXdhcmUgaW1h
Z2UuDQoNCkFjdHVhbGx5LCBJIHdhcyB0aGlua2luZyB0aGF0IHdlIHdvdWxkIGtlZXAgdGhlICJI
b3BwZXIgYW5kIGxhdGVyIiB0ZXJtaW5vbG9neSwgYW5kIGp1c3QgYWRkIGENCmNsYXJpZmljYXRp
b24gaW4gZGVmaW5lX2NoaXBzZXQhIHRoYXQgdGhlIGNoaXBpZCBudW1iZXJpbmcgZm9yIEFkYSB2
cyBIb3BwZXIgaXMgYmFja3dhcmRzLCBhbmQNCnRoYXQgd2UgY29uc2lkZXIgSG9wcGVyIHRvIGJl
IGFmdGVyIEFkYS4NCg==
