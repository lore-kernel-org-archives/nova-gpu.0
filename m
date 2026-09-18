Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82E32B10F
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 22:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768910; cv=fail; b=Eu5V36kcC1uMKAV9FE6QYKDtDO/wmbuTr1ypT37sbwFdYWgdwx7c4KSlHCYXuF9SgzS3QxXezdXpLtrSyEc3HSYuR4sGnwS/y+utqSw3Jfz4NQ31x3opmizmxmpba2tdUnCwyZWWPYS6QwIx+Ic5CzBg13Sm89rDX9M6fcrUCW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768910; c=relaxed/simple;
	bh=b4LJAvU+IO/qjd/0gak8fHMkDxvp4/Wt/z4RkKWqktI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BYcWJDHl60T8jzbK1tme+eYhEiqgKab4Bmp34IYGMJB6W+yuOzNoA68VnM5O4cCQ7h5iDRScclGjAvWV5znHX0bY/Ty1DNtrC9PQU0h0Bwayo1h3NclGVM2tMrVktUiO3bexRsI5GLMCx2dL3d8hCfNNMt0aSl5dZImQCUs0t5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j5A/PObX; arc=fail smtp.client-ip=40.107.209.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j5A/PObX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqaQEDu7s+gtx9j931aVAXAN0WxfJdbD0MhQMFcOEfBHRaAQEtnZ/HvQsT9zZD7T/tEslk3pAXTSz7bM6zC/sUHZhn3DcKAgQBCUAY5GQ2MDor4KIwRVzevPGyIcn4RQFflDORoa0pQUd5s/ErGuQIwr4Hc3SvD1fnQjJ5Etvta1ozANd35q9rx4i+C6SEya2x5scvmixnNZclM2XNR95qOlAMuag8Ws5U6xqyASb6G6Ua4/qOyMa3ZQnwC9MVVxg69IbFgRvucD7rySVQ36QCb2xVrJ9od/KMUKwro/3LTkggGGo+NdtE4BRjFYw79WaXH1Y5lCttKoCGrPVRw1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4LJAvU+IO/qjd/0gak8fHMkDxvp4/Wt/z4RkKWqktI=;
 b=twwWrOlZHoSv3oxxhYA7gVBaTNyxqtOxUCeI+hcRwInOf4Tv+4fX76GJQW/XjF+4RiqsOhXxo1K44WO2FpBuVRV5yIMbMW8N494w5s9rs7g4qV1TGWRTYNZvelWxMQEW1gSvO4v/UB1+UNHg0m9+L6swgDGBdXw0+k6Iixk6d6x+Ti24WnJk8nDLjZguJRICkkfbxr9gtcRVhu5s+ZrcChPJmc1wIECIsBebvCzAEpe7KhrqMmQuUsPLJMKto0p65jXeEixxrIF6kmwsJgWyaS1odqoMV6jlsdGctLh75jAf/Y8M4wIIP9xfqg+eW+SgUuU9JG+miRZpw7YXonAVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4LJAvU+IO/qjd/0gak8fHMkDxvp4/Wt/z4RkKWqktI=;
 b=j5A/PObX3yqBIiuPaSKgXx1XPb5o0O4D2+ZcGfqQG8buOjhzDvLWuLanSXcv+BdhqrqXBClB7/auk2XsJGDx17qkcB80jPGp2zMPTrrip9YlSW8z0XRAI0Eb8q0Lst9LthlHaySCAQQVc0r8ah78UVDGnfPEPeHAUr7ztnA0gKEvzXCVgZApODfTDZUMAVUkNg8Ojolqkk2dzEZGBmsxtdr1hmw3va7yfvyxhzNRdT6uyIasWvPXLqb/GWsTxRYluHdiNtI74/viOBWXpJC7Tcg5/DF4L6038Mgu8OCFHVUf/D7PgXsVKFDP7T0rprLCDvlp2ZBvRMfTffpHe7GjFw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:01:44 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:01:43 +0000
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
Subject: Re: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on receive
Thread-Topic: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on
 receive
Thread-Index: AQHdRwobkPO5UiwseUug+kMOJXPLqrbU5H4A
Date: Fri, 18 Sep 2026 22:01:43 +0000
Message-ID: <83e33dab67a0f571c269262ef052e68eab9dadf9.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-13-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-13-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB8145:EE_
x-ms-office365-filtering-correlation-id: 32fcfef9-5fad-44b1-37f8-08df15d06cc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 C0DWXd+s4SfFhwb/RikodsLh9D16sbEDLcILJn7AKXN2Bvek+OieaAhbM7WXw3iK4axZZvjgM4WHawnxKDw0viVzAMUgrIx2JNrvayVvLizX2+fl+OmKOrZRrpz7DBtrH23oHfjtnFbPe/7hNWxy/YihRtE/zMv1ojpN06GaYZMgo8hqsH2YCjhv0VX+VrlhwV73Lj2a9i7Bw9/uHL8iO5elId9pPlsc0Tt3kFz8JH0I9ALCPgyAucmW/YlLoLtdzRQ/sDGy10f14I9MlfrxjLn2023H1obRD2ZRaqOa8hOEzDn07nrYLLNhEPXjW5KTRwXym7+Vdcs0NCBJhgQfOl4yhP+pED3bR+VXe+UtDDUQFSyqrYefyyGc+5zXXC3OJgt9SFmKNE2FtB0KFpfFefBzCkRQ6GJu1y/1hf4NYh+pJeJ2hXHT1tg3fkJNVpiUT4M4r7Pr8Se4PrMNeVBRPGi6bguy/vRp3SB9v8XJPMbmDHeAknEdcTKq9mq4gHWRi8bgakXDMHG+Irm3HiIr+QCJtevbcC6LOzPzxTJDFoWDyNfLVZpzKfyB/3igGNMsryqgSc5xw/isoVFyUu4AxNt/enh0Sm6IuvtrmY5FiZ7evtHZlBiDU7bCoVsMXsjvJlNfDP2hWIC/lZ8iUkUSA16PdHYcZDBNJtKSWRS+D1XHNTZCzhTE9rE67u4znD8YS2GwrHVjWV7jKBFVe+Q+guL5ZzNGQcrKMy1go5bYoZI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmdsdU9SbGNOYjRoS1F1OGxnSFh4Rjd2RCtmcDJoTFFOREs5M28rYXVxMjhk?=
 =?utf-8?B?Q1hJVmVNUXhLekRqUGM3TUlOV3hIZm1WRWoySFZlekphbmZnWk5OTmxKTnpK?=
 =?utf-8?B?Z0JNV3ZKbnRUVWtTUVMzdHlMZzJKSTE4cE9pcE9zSlFGYytwaUxYVjlxKzdR?=
 =?utf-8?B?bFJFMFdWcDBKWktuc3VFN1FqOVZEQU9kdlU5bVE2Z2ExdFg4SCs5Y0xLZ3Vj?=
 =?utf-8?B?dktIVU9zZWFyMGJsdEwzVllBYjV0WjRRVytERnRjVXNYR0dnMVd6YjdWSHBs?=
 =?utf-8?B?dnVtTEt0eVdkUXlnUHduMnlVbHpZaTlnY2cvNXR5VmtKSndmK0R2ZUprVjNm?=
 =?utf-8?B?RWN0Unk0cTJZVVdCNVczREgzbGZqWkhVZU4rSkVEUG1QWVFqZStKV2VXdFRj?=
 =?utf-8?B?eTB0TGFJVkc3eURCMWMyY3N4RUR0aDhNSFRWYnhEQTFIYzV1NUNIcVYwRnpB?=
 =?utf-8?B?QUhOTVZsSjVrZWQyL0xPNkV2WUVZcFpQYWU3VzRBSTZDenNKTmdkTlorVSs2?=
 =?utf-8?B?S2ErNno2djRsajVCT1VPRU1scHFqM244V2ErSWFPcW54QnUxeGFsbFNVQ0dB?=
 =?utf-8?B?RXEvN0U0UkdJSXBXdWxFN014M0J5cGZRMlRzTnNEa043LzBEQkdkVlExVURB?=
 =?utf-8?B?Rnltc2FNeGFUSDVFSHA2WGxsRHhSRnhkUVNyOEl3ZjVoVEtWdnU0alJXM05n?=
 =?utf-8?B?dlRzTVdVaDEwU3B5OHVUM2dhOVNTUVJERW5CeE5PemtHSDlScTBPSXdIL2ZJ?=
 =?utf-8?B?MVVZVlI5aWZRUDhFb1pOWlJLaUlQQWZJWXVXNFA2c1V6QXJPTGIvY002Z2Q0?=
 =?utf-8?B?NHlMOXdLYUxCOXpFNk1RUVpIMThSUlB4SGtMNEExZjl4QnZveFBwU0tPZitR?=
 =?utf-8?B?RWNIdkp1U3BKbXRZL1FXREdGTjF6UFIwcmVmL3lzVXB4MDFIaXlJMnJranhW?=
 =?utf-8?B?UGlIeFE2UWhhM2hlZ3ZHVWtYYXhaNktOQTRablZRQXoxd1BVNlllNk9Vd2pT?=
 =?utf-8?B?ZXhLSWFralJrOHhCRGtxOVBZeitHWGJsUDNaNkFlWGhaWlFza2F5bEJrajJK?=
 =?utf-8?B?a3RVMGZ6WU5UcVhaL1pOaDRwSk1QZ2FhbUk4dElRQWdObXNLMWRzek9HdWtq?=
 =?utf-8?B?RTVzY3R3VGRSMzhZWWx5TDZpSHhvbExTZ1pCYURpMEJSZEsrRkRubS9vQnNu?=
 =?utf-8?B?ZU53ZGRYSUtESXRvTEZ1dU8xSjdYY3N4SUZzVjhoUUFPQ0xHczJ5WTdDeEZ6?=
 =?utf-8?B?eGRzSWtvdGttbHd2VGRaVm91alNNUWFKYzYrVHhSUTVlU2NGbWlHWis5Y3NC?=
 =?utf-8?B?cXdBaEpGYWlkMWFXd3ZXOTd3bFFrdG9xR0F4VmV3bXQ4aFRMeWVPRnN5QjRo?=
 =?utf-8?B?aFcvV2psVy9udzFOWGtlNzR3V3JOR3FXSmN6U2tyM0RFUlg2L0x4SXBVd3lr?=
 =?utf-8?B?Lys4QnpCT2FCZUZSRTV2YUZTakxCNm9ldUI3eWZvWGZ3WmFBaUgvQzV0THRM?=
 =?utf-8?B?R29yVkJYa0ViT2NZRCsrK2ZvellRN3RuMVVESmUxYVF0WWsvV1JLYzU5a1Vq?=
 =?utf-8?B?cUNlNzNHeWRHM0JQelpjd2xBdEw3MlF5SFZqWTZyNTR0WkNNYWVwbjFyNmtR?=
 =?utf-8?B?eHRWaFhjcGlBYXg1dWZyNnZOOFkydVJ0amd5eHZicHQxd2NCZmo4UUtNSkZX?=
 =?utf-8?B?MEkvNGZMTVJsajVKblpRTXhWOWxHRkY1eGw3ZkpWMkJ6ZjAvR3VHcUZ5MlJJ?=
 =?utf-8?B?RGZWWllJazNRbkp3eUNyb2FFa29UZERKbmZxd3pEV1plVS9rS3ZMRXdlazhH?=
 =?utf-8?B?UHBtR1YwVk5xMS90NXlZcUlwRzgrelorSzVjT3J5bEFkWjZ1M2Y0NDJJbjNI?=
 =?utf-8?B?RDNhZG56Sjh2TVRudWVLeXA2TXdDR1YrQjFTNU9Ma0Z1Q1Y1N3Z3ZEVxcXR2?=
 =?utf-8?B?T1pTMHo4VDBERHhTUlBqU1pqRnExVXpabUVYRmFsRUhKVnlzbDhIZlczRWN4?=
 =?utf-8?B?VU5vQnlPYTF1Mk1pUS9sYVludmhaWDFoS2Y1dkhHY0lQeGdXWUJBaTM1aW11?=
 =?utf-8?B?eVhTTnBMa3NHV3oydTZyWjIyWUhnT2tyeVoveDVGT2FXVWtwUm9Kc1VzRWZJ?=
 =?utf-8?B?U2FWTUJqa1NqOGJGcEpjL1BqVmVmcW9MWWxoY3RiRTI2VkVEL2J2eTU5bFBE?=
 =?utf-8?B?WFExaHBFOGo3VG55OHowV2diZzJ3Qm1TUEs5ZWhKdDd1bGhSTFZHSHBZQVpX?=
 =?utf-8?B?NGp5T1VuS2h0WmdoR2l6SzhkeHN3VjBwbkNiQVNZNHNQVHRXQ25qNllCdDJT?=
 =?utf-8?B?S2JrdTRQMlVlbFM4TEM3bkZsdEN5S2NFQ0tGQlpna05wbTAzc2ZTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2D21F939521EC4E9727FAC24DA17D3D@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fcfef9-5fad-44b1-37f8-08df15d06cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:01:43.1858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SupZM81G53/lGukZYzkspHupdk6/YncwPpvveuz9b5lei6y5F7VWOmJMM++jydhgnZima27/wYkLKcW8M3HrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
Cj4gwqDCoMKgwqAgLy8vIFdhaXRzIGZvciBhbiB1bnNvbGljaXRlZCBHU1AgZXZlbnQgb2YgdHlw
ZSBgTWAuIEV2ZW50cyB0aGF0IGFycml2ZSBiZWZvcmUgaXQgYXJlCj4gbG9nZ2VkIGFuZAo+IMKg
wqDCoMKgIC8vLyBjb25zdW1lZC4KPiDCoMKgwqDCoCAvLy8KPiBAQCAtMTA5Nyw5ICsxMTEwLDkg
QEAgZm4gcGF5bG9hZF9zbGljZXM8J2E+KAo+IMKgwqDCoMKgIC8vLyAjIEVycm9ycwo+IMKgwqDC
oMKgIC8vLwo+IMKgwqDCoMKgIC8vLyAtIGBFVElNRURPVVRgIGlmIG5vIGVsZW1lbnQgYXJyaXZl
cyB3aXRoaW4gYHRpbWVvdXRgLgo+IC3CoMKgwqAgLy8vIC0gYEVJT2AgaWYgdGhlIHF1ZXVlIGlz
IGFscmVhZHkgcG9pc29uZWQsIG9yIGlmIHRoZSBmcmFtaW5nIGlzIGludmFsaWQsIHdoaWNoIHBv
aXNvbnMKPiBpdAo+IC3CoMKgwqAgLy8vwqDCoCAoc2VlIFtgU2VsZjo6cG9pc29uZWRgXSkuCj4g
LcKgwqDCoCAjW2V4cGVjdChkZWFkX2NvZGUpXQo+ICvCoMKgwqAgLy8vIC0gYEVJT2AgaWYgdGhl
IHF1ZXVlIGlzIGFscmVhZHkgcG9pc29uZWQsIG9yIGlmIHRoZSBmcmFtaW5nIGlzIGludmFsaWQs
IG9yIGlmIHRoZSBHTUMKPiBBUEkKPiArwqDCoMKgIC8vL8KgwqAgaGVhZGVyIGFuZCB0aGUgcXVl
dWUgZWxlbWVudCBoZWFkZXIgZGVjbGFyZSBkaWZmZXJlbnQgcGF5bG9hZCBzaXplcy4gRWFjaCBv
ZiB0aGVzZQo+ICvCoMKgwqAgLy8vwqDCoCBwb2lzb25zIHRoZSBxdWV1ZSAoc2VlIFtgU2VsZjo6
cG9pc29uZWRgXSkuCgpXaGF0IGRvZXMgaXQgbWVhbiBmb3IgdGhlIHNpemUgdG8gYmUgImRlY2xh
cmVkIj8KCj4gwqDCoMKgwqAgZm4gd2FpdF9mb3JfZWxlbWVudCgmc2VsZiwgdGltZW91dDogRGVs
dGEpIC0+IFJlc3VsdDxRdWV1ZUVsZW1lbnQ8J18+PiB7Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiBz
ZWxmLnBvaXNvbmVkLmdldCgpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVy
cihFSU8pOwo+IEBAIC0xMTQ2LDggKzExNTksODkgQEAgZm4gd2FpdF9mb3JfZWxlbWVudCgmc2Vs
ZiwgdGltZW91dDogRGVsdGEpIC0+IFJlc3VsdDxRdWV1ZUVsZW1lbnQ8J18+Pgo+IHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKSkpOwo+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPiDCoAo+ICvC
oMKgwqDCoMKgwqDCoCAvLyBHU1AtUk0gd3JpdGVzIGJvdGggc2l6ZXMgZnJvbSB0aGUgc2FtZSBw
YXlsb2FkLCBzbyBhIGRpZmZlcmVuY2UgbWVhbnMgdGhhdCBvbmUgb2YKPiB0aGUKPiArwqDCoMKg
wqDCoMKgwqAgLy8gdHdvIGhlYWRlcnMgaXMgY29ycnVwdCwgYW5kIHRoZSBkcml2ZXIgY2Fubm90
IGtub3cgd2hpY2guCj4gK8KgwqDCoMKgwqDCoMKgIGlmIHBheWxvYWRfbGVuZ3RoICE9IG51bTo6
dTMyX2FzX3VzaXplKGhlYWRlci5nbWMuc2l6ZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBFcnIoc2VsZi5wb2lzb24oZm10ISgKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJHTUMgc2VxIyB7fTogR01DIEFQSSBoZWFkZXIgZGVjbGFyZXMge30gcGF5bG9hZCBi
eXRlcywgZWxlbWVudCBoZWFkZXIge30iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaGVhZGVyLmdtYy5zZXF1ZW5jZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGhlYWRlci5nbWMuc2l6ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBheWxv
YWRfbGVuZ3RoCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKSkpOwoKVGhpcyBtZXNzYWdlIGRv
ZXNuJ3QgY2xlYXJseSBzcGVjaWZ5IHdoYXQgdGhlIGVycm9yIGlzLiAgSG93IGFib3V0IHNvbWV0
aGluZyBsaWtlOgoKIkdNQyBBUEkgaGVhZGVyIGRlY2xhcmVzIHBheWxvYWQgc2l6ZSBvZiB7fSBi
eXRlcywgYnV0IHNob3VsZCBiZSB7fSIK
