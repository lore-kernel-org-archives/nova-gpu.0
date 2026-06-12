Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C532B13A
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286639; cv=fail; b=KHRuL3cYszy3PnHNIPNjQRXTE33MJeVzSMCr/bttScAN69wkq6Dal7llZ9BzQwjKIQGlmsXMaBl/9NpgiiCwCvzHbb2O4NxSsO/ULgXJFlJmrLZ5CyqAzVOBo7C3OhjSfoG2VpNjumOjZPInr4KhjJSKPj638IMegJ6z/C7H22A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286639; c=relaxed/simple;
	bh=87JsxtHxKJcmhWKUp0oNFtpTQs68noiEdPgmH/gLvcc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aiow3QG8MdCdLhwX5afmR8oOomyFD0AnK69QZqZdqBPn3/v/YcOQeNIZujEZ5LalorbARGK1dAdBU6LssLzwF5kIEtuCozm9hmab7CJLQiS/CmhcY3pVeYSOED05IjteaEtjyNi5XUSE2z82iv2/MzDSqrs2K36IrXQtZ8yjQNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CEGGBWTC; arc=fail smtp.client-ip=52.101.52.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CEGGBWTC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LubLL21R7FnSKEFN+iOtcs0G7BtkLzzhBff1L5YMQK4yfdKJHxw1UJtyvAfVW/JHqOSH6b1C9h9ngXQY5esBVqio9xhhZao09t3OeSCk7PAVMUHITONs74fGQpmGJY67DA27P34juzATPnVjsLZcbp42cV/d9OR0Zhw7y05fPRT2dBcdeK48p794N0WQBRwCHdvnuiZBAct64qHo82MUcWjKE2VGC5z0bg7tiUvp92sA/ovO/2HW7+e2fliQLeEj5jlfdeR/Ca0YVhYZeSKRTYJDoZ2eDVMFmw3Wsd3BN+/+ICaTcEcq0WX3acIQM+VxOOPk5LlxWY+NhHKhPvvxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87JsxtHxKJcmhWKUp0oNFtpTQs68noiEdPgmH/gLvcc=;
 b=jzHibfjWEJo3qiUxbkux6sXHTBxqy9sfYMCqpjOTTTTMlvJgjLGiBapcZxi1exLDxZS+hZOkCakd+K/Xz/qrbvPRp5NanEekFWKmy/vCyaGHFY6JHDvRYRcVQ56gq13dFC3Xvl9ALkijWNO17UQLL/KihhX+aRkVQzZsBwe30WsgubZHtxqt+Hzfx+N+h1bdirXjdZprtMnEQjunAD8tQ51Ly+3ftXs3s1zcUbQNN1Z4VRdg04k45REXMZHtoBp75sYoSWTA16T3f16wXmDiz2Xq521u2wkT6z9EbAszGjwrZWJMrJLctA7yD5IOqLLfNG2qwA5UZ8Ka7yGxA+/vxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87JsxtHxKJcmhWKUp0oNFtpTQs68noiEdPgmH/gLvcc=;
 b=CEGGBWTC/WI1heNIM5S0XYuwoH38O6udiXh7LiqZGZdcgk3wJlu9+uWP+TcRqtZeYE5+lP8sKFQchoQEp6dbEPeHqd36D8xQ785yYRa4Dmov5S+aWXgDywkAg0DbOIhgg80SHnIkZEjVpedohDF0/2UWc+fm4aXtYeyN4OxKf2YwOk4yJFa8ldczN65SVnWp57DlB7PZI0dz8ybbe/kYeoNt9OlFX7m0cl2fuEeje/Ipr8aIv9l0IVKd8RSLs2bjmx904W25T39zz5cNXP5Hm+WbXPu4j3m+YJzVshYozu6KdhyHC3ebd3tgRuvHVSLxEWg4AHPJwbfKZkM3wwm3Nw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SJ5PPF0AEDE5C3D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::989) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 17:50:32 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 17:50:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, John Hubbard
	<jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Topic: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
Thread-Index:
 AQHc+iCQTqnYSszeFEy8vwxH7+fwF7Y606aAgAA8i4CAAAargIAABLKAgAAOxACAAAlZgA==
Date: Fri, 12 Jun 2026 17:50:32 +0000
Message-ID: <4bcd28483b8d24397ab2910cb546a038aceef0aa.camel@nvidia.com>
References: <20260612040420.121499-1-jhubbard@nvidia.com>
	 <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
	 <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
	 <DJ777VLZB7BG.1DY1X4UOS0MWJ@garyguo.net>
	 <f00293b2b144ac264bcec657429492ca44f99c84.camel@nvidia.com>
	 <b51cd866-2224-4f3e-93d5-d7c4288bf2bd@nvidia.com>
In-Reply-To: <b51cd866-2224-4f3e-93d5-d7c4288bf2bd@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SJ5PPF0AEDE5C3D:EE_
x-ms-office365-filtering-correlation-id: b762da7c-9c78-4abc-c98b-08dec8ab1932
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|23010399003|4143699003|56012099006|11063799006|18002099003|38070700021|22082099003;
x-microsoft-antispam-message-info:
 Zbvyd2+MI6EpKddJXIdV4Mj2iB2GXzI2clTC4Les+vwLAEQPK8nulW7TavIyGJUUSJmVrvtH8fYPdLHShdxWadSqthNZtf95a3XuDwn+AvI8v/EI/EXOuqTapX+5QZoIFbI3b3KccpeMVme3HIHMjAO1+5NNYPRXZVDxNNabB5nxgkCnBm2hDSL81pwwh9QnFWEIWHgp7pYt5rclYc1/y7IOVYGzJ8EKQUHlerhZJqYgLmQvgd+m+FZE4/PECgioFTCdUC6oVqIAmTwVd1c5lPJu5g082Nid5RjD1qr1egDJ8Ot4fr9EEWdZVEI17ida9380CLddgl6GCTpozO4P78cj0oIBtwuCqSpQ8W6DLWzyISMkox58FIgk5ZEBouxXGWCq3qVzNiPuJSkZC+FzaUuIaV0eC4uYWHRIlMY5IEGtZxROWt0xvTyGPxdRSInphsrJdUsgk0IQ+/4Ler5co6KJswEK9Z66zmrgveiGGlIPqwfixeGhjABzNsArY2wlkM5ivuoqH9uSI/h0tiP2fAQEh08mGoSPHwecJN1Kpjab9+62AwKcE0tVuP7c6ljdv6eSCo4kor70B/2Sb7VhguRLXvmBWib8Zbr96ACrADEpZ+2wfdE5TVw9btGKHEBdKH7qa9lTiJMv5V0SyRpsXFsTeMJfiJ5+m43HtwTpMtaMlNOrkRe/H0j9tuHNKz41mAZzZ+IkDbM18awUIgakC2za+YB53FMAEmmXKiNheD+UvgSIxrcoAqNzb3m4in3B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(23010399003)(4143699003)(56012099006)(11063799006)(18002099003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3FpODRpT0xoQ1FlVCtJWVlaYmFjT2I1M0ZxWndwZGRyT1ZzdktDNXdLeXZI?=
 =?utf-8?B?OUt0N0pkZ2JoV3BJR2ZzWDhsWllnTGxWR3NCT0hBNWo0eTRzSi9McGh5RDVN?=
 =?utf-8?B?cWdSRVpQc1R2L01lOE5FUm9tR1huZldEZlpCTDVIVFkyci9qMFdsUWlJcGNG?=
 =?utf-8?B?UUlMbkhMTXpHM1hIb0tnUU0yQTl2YWNqOVFETDFEVW9xam1NU3NEbUQ0L1Nj?=
 =?utf-8?B?SWJkNGc0THI3MWlJbEhIa3ZyR25LNUl3WHlSQm5vM21xLzZsc2VoV1FnM2Vh?=
 =?utf-8?B?aGk0UkJlT0pna0VsV3RZNjBTaUxTYUc1ZFlSbXRDSDdPQ1pUUFptQ1AwNWVs?=
 =?utf-8?B?TEc0NCtnZjY1T3NlZ3A1OGpBUnF3cENmTXhKZml0SFZ5aFVWOUFqdHpJam1E?=
 =?utf-8?B?bjE3aXdsanRGQ25wdDUxKzlJd2RzcENrU1lkNi9rR1VsalJGUkl3eGpNTmNl?=
 =?utf-8?B?MVJLWEFxMkc2YjA3MHJKQlAyWm93TnNnaTVZNzB4bmwrMVNCa0VnRXdQNGxO?=
 =?utf-8?B?bElvWm51bzNJNzlqQ1RQREFzZXpWSFYyNWw3Y1J5TEVlSjVmbmxrdm9hVEZX?=
 =?utf-8?B?MlRBNTRSREtvR3J4YWlpS0NlZFpjYTNibWwyRVBOV05qQjNJT2tiTEtKNVpz?=
 =?utf-8?B?WDNxN3dDZWhtL0JiRTRmNjBSSmxGMk11V3J4L2hUVEx1S0w5SndCSFpHYlU1?=
 =?utf-8?B?V0lPOTVadmprOWQ5TW1aSEgyNzg5d0oxQXBtS1BVMFBVcWhQbnoxbHloTlZx?=
 =?utf-8?B?bXhNOFNFSFVuK2VDZTNkNXc4L01ORTVOaVRQekNWbDlhVWtzSnlmdVNHMFBr?=
 =?utf-8?B?bm8xNmRkbWFWZEpxM3FpR2tSbGVWemJ6S1hyNDlTWk5FQ3hYbEtINFY3K3Ny?=
 =?utf-8?B?MmdsZDA1NGNldlpSSzVhdGtqR0lBMEZqNFlhaUpRVThaNERaUUN4YkJ0R1cy?=
 =?utf-8?B?dXpEVW1iblRMNUJXTzZGSEQrMWs4Syt0Umh2ejBHY21aditubGhZRmhRcWtO?=
 =?utf-8?B?Rk0rQkh6MXlpZzlKREFLeTJuZDRnK3NnWUlGb25zcCttQjJOT0t5bFVHZUYr?=
 =?utf-8?B?bHlmc1NKUHBZV3VQamc4YVB2Ykk2ZFEwNGZLZXN6amJpM0JuQjJUVnpjOXY1?=
 =?utf-8?B?T3ZyQXJJeXBpMHA0S2lGUXRJLzFla0hsNW5mZTREL3FZZEtLVlZBS0ZoelRs?=
 =?utf-8?B?V0gvYWFORE9wY1BtT0tNWm05dlFWTXMxWTc4UEIrZkc2TitWQWw0dUJZN3JR?=
 =?utf-8?B?cElkakNtYmJ1Z0JnZGRYOG5tTy9WeldyRmRSTGFCSXpOVmVuUW9ua0dqR3Ri?=
 =?utf-8?B?S3JjY3U5bWVVVjBWUy9nVWhlQTEwSzcwMVJtSGFkNHhBMjZad0VSQ04vR05q?=
 =?utf-8?B?Vi94Nk5QQlFkWGVsRHpySm5ZRm5EODNEREFCN2I1RitONWorK3N1dWk0ZWc4?=
 =?utf-8?B?YjV6bkMvdklnbkt1N1psS0ZpeVhhM1FFc3RTZlE3WjdNRHd6V2VodnZkbW9j?=
 =?utf-8?B?dTFoeklVZFlVTFdiMVQwQmJ0OHdkbGtmU0M3RUhmc0VBWWIrYVFQRkowOE5C?=
 =?utf-8?B?MlJwOFhuUkNhM3lqeUx4a2FJWmorNVQ4ZEk5TktZU2NsWmk3UnV0QUhHZXJX?=
 =?utf-8?B?YUdwTG9ESmorMjY0eU9vVGFZREtRR1lDYVowR3hmOHhESWY2Y2RiaEJxYnM4?=
 =?utf-8?B?bWRPTGRneGh0NVN2OFA2VjZkamhZR2JNcFhmS0hYcmxnUTFiQSttR3pEcUll?=
 =?utf-8?B?aFZxcjJ3ckR5UkthdTNveForZVV1WDVRdXl5dmFzckQrcUdzeFgyRGlvNWpL?=
 =?utf-8?B?cFA5M2NQNWFYYUt1Q3d0TGF2bE5lRTEvV3BabVVJbmtoa1lBYTNBenlKcUps?=
 =?utf-8?B?R3kvT2VMRmk2anA4M3dWSU5KcDBwYW42VGtSUHJuUzB2Q241NlJ6djBvSjZa?=
 =?utf-8?B?UDFxMXQyN3dSNjJZUEdrelFKWWc5WjZaaFZLSXJ4Vk92RklGQUNSTFllMVhM?=
 =?utf-8?B?ZzNoREZnZXlxdVFWWm1jSzJVMHFzNllFdkpLRm5CUGRiU044Z2hzSkZ5NUJQ?=
 =?utf-8?B?dXdVVC9GM3lRdU8rQU1ZYVA2VGVwUm44aTQrTXhjazJpQmUyemMwa29HazMv?=
 =?utf-8?B?Mnd6aEdocFN3U3FjRjA3dFc4amd3WG4yU3BMYU1Bb0kyWkVFQjVjZnNWV2Jh?=
 =?utf-8?B?QWV4QTQvbUk0VXRVbXJMSjdmSTRIekMyZ2pDTzQ5aFQ4NW45c1lJWDcvMFQ4?=
 =?utf-8?B?blVvZGtOT2xvbTJSZ0wydTVCOFUwSnhmakxIem9PU3FLZ0lIVFhSdWZPb0RW?=
 =?utf-8?B?TklOY2J1OVN6TzlPZ3M4WkRpOFRFU1Nvbll0OWxVOXBjWWRjUXp2Q3FoRDYx?=
 =?utf-8?Q?fCcw3+RCWhp8yhxcIHzVWJbG1YODipSpUMtvgyQL3o+xt?=
x-ms-exchange-antispam-messagedata-1: MlK+JpPFkReBtA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECD2AD3F52E7164C8791D5CD045986C5@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b762da7c-9c78-4abc-c98b-08dec8ab1932
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 17:50:32.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5vUCEuA8dsDVxixlBFPUW7c54/cE8lHrnknkFE4C3ncxRgV+astUVDYQUGdu3QqKarKNJnolP6pLktx8U6Y+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0AEDE5C3D

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDEwOjE3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEFuZCBjbGVhcmx5IHRoZSBjb21tZW50IGhhcyBmYWlsZWQgaW4gaXRzIGdvYWwsIHNlZWluZyBh
cyBob3cgb3VyDQo+IGZpcnN0IHJlYWRlciBoYWQgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIHdoYXQg
d2UgbWVhbnQuIDopwqAgR2FyeSwNCj4gYW55IHRob3VnaHRzIGFib3V0IGhvdyB0byBjbGFyaWZ5
IHRoaXM/IE9yIGlzIHRoaXMgd2hvbGUgaWRlYQ0KPiBvZiB0YWxraW5nIGFib3V0IEhvcHBlciBh
bmQgbGF0ZXIgdHVybmluZyBpbnRvIGEgcHJvYmxlbS4uLj8NCg0KSSBtZWFuLCBpdCBjYW4ndCBi
ZSBhIHByb2JsZW0gYmVjYXVzZSB0aGF0J3MgaG93IGV2ZXJ5b25lIGluIE52aWRpYSB0YWxrcy4g
IFRoZSBwb2ludCBvZiB0aGUNCmNvbW1lbnQgaXMgdG8gcmVjb25jaWxlIHRoZSBsYW5ndWFnZSB3
ZSB1c2Ugd2l0aCB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIuDQoNCldlJ3JlIG5vdCBnb2luZyB0byBz
dG9wIHNheWluZyAiSG9wcGVyIGFuZCBsYXRlciIsIGFuZCB3ZSdyZSBuZXZlciBnb2luZyB0byBt
ZWFuIHRoYXQgdG8gaW5jbHVkZQ0KQWRhLiAgDQoNCldlIHByb2JhYmx5IG5lZWQgdG8gY29tbWVu
dCB0aGUgQXJjaGl0ZWN0dXJlIGVudW0gdG9vOg0KDQogICAgcHViKGNyYXRlKSBlbnVtIEFyY2hp
dGVjdHVyZSB3aXRoIFRyeUZyb208Qm91bmRlZDx1MzIsIDY+PiB7DQogICAgICAgIFR1cmluZyA9
IDB4MTYsDQogICAgICAgIEFtcGVyZSA9IDB4MTcsDQogICAgICAgIEhvcHBlciA9IDB4MTgsDQog
ICAgICAgIEFkYSA9IDB4MTksDQogICAgICAgIEJsYWNrd2VsbEdCMTB4ID0gMHgxYSwNCiAgICAg
ICAgQmxhY2t3ZWxsR0IyMHggPSAweDFiLA0KICAgIH0NCg0KVWdoLiAgTWF5YmUgd2Ugc2hvdWxk
IHN3YXAgSG9wcGVyIGFuZCBBZGEgaGVyZT8NCg==
