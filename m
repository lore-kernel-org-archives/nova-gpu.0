Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1A52F28D
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768669; cv=fail; b=T+kcm/EuDRD4bRCQoenkMlwf2WXUfZ3ceexJTLO1DEbTUnEqNaEqXfS3cnbh46joNooXuQx8RPVHhN6++jWhcyO2Xjy5MQJuQ0db/POStok4nIwCtbf+7HjUcBWrEG/cz0ie8P43Txm0aize8wk/w40pZ92tGGKz7HCqzpneT0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768669; c=relaxed/simple;
	bh=UxB9bgmzUI09565rbpjVb1D18lXb0IEcjT2/ZLC9XYs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a0bs0gakiEMxqYTqkjjhWfVEMvJYxtUJQcFwcwrtiMS6KoScQBimgqUMXBlsR5se4pssRcBsrj7tmfFAHmBn5YMWLw2kMX8XgFwF/5GNkUA2GNTvWMkIl4Mu3L07QCQ4Kz6gsjOAA/HOazBBofCw82e32mZFu1cOtdqqYrUjnBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dl6s5vAr; arc=fail smtp.client-ip=40.93.194.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dl6s5vAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg/HW9VZQFbnBWoaT3w6I1nI7BXJeMEMzVfIzhMoT2+TGLJoV7tYO7Ryk1h9ZLKs1N6GcJFZKXAnatzOhUR74mHig4tkowVY+VrYSpf6sxKyEdOraajn8sezk8VtVDM+w/ieFDfW5G6NnWxdeMpKTsmMgBgPEGLJmwXEoGJAHh4dvnlEHBTGBPa25swFJhWNAbzVYgkIbPDP3SIuXnZQvKnu/NGYEBaZp8w5o/d7RYF/dah5uRJtv5viUCgURnE9hdrfSgX8g60RR6NmRZ/JHnozseZL7nLrr0Yy2M8lj/uImY9hqiCWoUQDJT+tUKJDn0XUUhET6FbbtLCNbaOZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxB9bgmzUI09565rbpjVb1D18lXb0IEcjT2/ZLC9XYs=;
 b=hQ+BmIqG50LMN2wS13aGlYNpFL1Xu8TYTLpOC7bmkXF/wyLYnfvjAAI6h5ENIePd4V+dwns+rBYTyOAqA16qMgwCY2DpU1zRvnKddDi3IN4Ga8ecvVbtdbDVhnYvWWX9UHDDutZ4XqaZvlr0T/Ra+nzio/0i6LlJFl0ang4Qt67DDZxXMj4q8qvtc+iO0JH4Aex4bQHXO7Pk4nr5D3HOgAkoUEjFrgpCAx8x8CissBlWrvKUBvATpihFFyLGSkkKgQ/MbBKyMe6YuLkN9bdGK84+X1ihTE4Ar3C3kfBXVTIcxcDMnCumjPhSeUPzuntGYsD+TNVO85Vw2CZKImrHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxB9bgmzUI09565rbpjVb1D18lXb0IEcjT2/ZLC9XYs=;
 b=Dl6s5vArxtW6MYT9QyZWjBVYk1544kzQ2l/XVBaooiM8NjOE95HlBGQd58uDBQmo7N5HUfHGwdUyKaNiaZjun1DbEorJKBaMfQMjyHQKQ/7MpcKsegX/JNJKOuvlprl3bCqRn8cJMIY/xavSWGa4e0ohaRa9eXfoZM3kvBKQaNmWdujSJ87sjuViC4+WS/WMlcqkLqZzm7cgbzac6V7FezkcuYYxll4TaN7C3pywASEk+SsF1UEOE74OeOuyydqE7QV50uKLP7IwdsKr9btdVY7nWRKrJAyBvfXWMTwvm6LpK4/OpF33LCAU21OWQvxG5HkfNpoBGjy/DwQvsDPPGg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:57:42 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 21:57:42 +0000
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
Subject: Re: [PATCH v3 11/33] gpu: nova-core: add GMC transport receive path
Thread-Topic: [PATCH v3 11/33] gpu: nova-core: add GMC transport receive path
Thread-Index: AQHdRwobEz9oZwy990CeCixNE8BAvrbU41+A
Date: Fri, 18 Sep 2026 21:57:42 +0000
Message-ID: <67be0443888888cd67a89aeaa4e6c0ddd452b5c3.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-12-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-12-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB8145:EE_
x-ms-office365-filtering-correlation-id: ced85b94-0319-4474-988d-08df15cfdd4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AzE/OWtB87cdRNDsgZnEt1YOoMDoomX74HOTNlCCVy8L03pbA4Ypwywbs5i+DfifGmNbNIpXJhwXWYmV3UL+JLMl8ND4Dr3A71nrO8njPOk2T6/pZ0Klu8LLYoh6pZ6CILjzY1XLDXHRZWYvArc8zX1BbLOkUjaM/+032w0sKwjovzUdcwcYCkAyH2F2BB8KzGFzO0gSNeHpRiLZfN4MGBe+m49D9nr6BtC/lVrdMotva7iV2KXyuskNeLhYT0GTe8weYdHpyYNDNMR9l0PBRTc8SbHHvxZxIvb0KlFenQOIe8+HY8youpszCrCSxzRmmFmgW0Ip1DQpIXQ3ZYqlsLEAr3tRp1Nx0GJE1EOoEuCcKNLkUUOLdcR/jj2Y30n2bDXrBbrjOl8KCJf4/s1nf7mha3eC+RB3BGJ0Hj/xBgCmL/z/9ZXFLJwpIgVBYN+JWUjWYEzFsaHgBbpdV/YGLt99BiFUTNAb7JmdZI6u4I6LN6UJWTnWMAsVyiAxa3KU4f2sIVbThBC5GAr6hH+M0OhslhIYdHvK4hj3M27ljlyvoZcRXPCIvq81tfDso2YbZf7kBgfyTs84lD0PWqKDi/3VLNGGter4mCtGHwyQHrkM43x/SrJc9MPYgGbESlFYfd9DxopYqc5J6MQuUmwmoHpzI6/fhktZrpbaXZGUMv+U8JxxKN+rm184PhKuxNN3NQ+/rQfJbgNDNLl0oSFm+WkeBaYQs+/1LCnwF+tUq4M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0s2RnVFd0VYQVhlREZmL1Via2hKQXQyU3lLZzRFSVB3d0MvQ0RSUUJSSjI1?=
 =?utf-8?B?S2M0VkZWQVIxaHlsQWMyUHY3SzRkc3FBVm12UkNTRXRBdUFFMGRHZ3RTSG5J?=
 =?utf-8?B?VGEvMVJCNXFraDNSVVlRdXlGSG9yOEVwVW43SmNUZ3dNSUpEVGl3TGc0ejlG?=
 =?utf-8?B?VitnMDVsZEo4M2hlYmhTRFgrSG4zbjdDbFBXN0JzY1FmTkdZL3BWK3JoME0x?=
 =?utf-8?B?dWJLUVBlekdiUTJKM3VOeHIrZUVsMnJaZmhhZU5CZlpjQlZqSGJ0OWs3OVd2?=
 =?utf-8?B?dkNYR3QxWG9wWmgyWUlybEJZcGtyUWIwdHNiYlB2ZUJVa0xGSlN2U2MzWFNn?=
 =?utf-8?B?cFI0T01pZzZOdzJ4ZmNjSXgxb29NSE0rckJUakNDNHJMUXdDNXN6RFBRZStL?=
 =?utf-8?B?N2llR3lSQkZqdXY1RElsdCtkcHBVTkRUcHBKK0VvYUdYR0x1bGxmMWU1WkpY?=
 =?utf-8?B?YUt4N1ZoYjNSdkRIWEg0SlllRys0Ukc1TkpCR2hKK0p2SWEzd3IzQVlQNU80?=
 =?utf-8?B?azhJSEU4YlJUSUZaMlNGeWpOU2VnbU90OXFJTWVLc3BBK2hzWFV2M3hQcng2?=
 =?utf-8?B?N3RadnpqdnczRWV2cUZobW9xNFZSV0JiMEdvbmNpek5BZWVXQ3gxMkVPZENU?=
 =?utf-8?B?Qzh3cnoxWHk0YVBjcU9Fcmh0Snlpb2xNeW45V3hYSUZMd1ZpOGo3VHgrbk9w?=
 =?utf-8?B?OGZNbjY2T2FIUHJsT01EOXIwMTh1M1o1Q2ExOXF6UUNCT2lSQnQrbGgxOFpG?=
 =?utf-8?B?ZHlvTjFhazhYVUtFZHlrWjB3NmNrNFU3QTcwd2JBY0E2N0RvQzlLWjZNQWVt?=
 =?utf-8?B?WUN0VUtWZ2Q0eXVyQjczdENLY2FhTWdTU21OSUlYbnFmQS8zOTdqaVVPU21y?=
 =?utf-8?B?bEk2REk2TVhsdlVUS2RrbFFaRm1sZ3drSXlJU0NVd0xGTHkxNVZ0U2hVSnBi?=
 =?utf-8?B?VE41Tko4d1JrWjJRUUxFQnpEMkVGUDFYaTJqMTEyYUFvTURza3FJUjdRNWVK?=
 =?utf-8?B?ZC9TOGp4dFhWOEVsL1ArcVoveWtCanc2WVhmTXVXTkkyci9HekNYVnZyZWFD?=
 =?utf-8?B?clFWNlQ4Y1EvT0ZsaWsva1RBc29qOXp2cVNtVWt1TXJ6UktsNTI1czQxZkFQ?=
 =?utf-8?B?eGdraFZTaGZoTlBkQlVwQUJTN2dyc1hiMmlkMVZTSC9nb216aHBzbU0reDc2?=
 =?utf-8?B?YlM4MmZmSlY4dGlDdnI1U3ROcVRUYzdER2ZoNVE5QWpsMTlKdDA0UDBDNzdD?=
 =?utf-8?B?dGwwSXIwMnhiNzM5T0xLVTRGNXo1bDJUb3AzRjh0aWdCV2RrbG1ZRFp4L1Jk?=
 =?utf-8?B?Q1FuejBBNFdDUWgrQXIxNllWR0FPRVgzVVlwZlJQZE9Ta29RZ2V1dEJFbGJP?=
 =?utf-8?B?SVRoUFRIU29OUXMxazdocFMwVldsc3VUNlo0TFpiaDdaQVlyTHUwSUhQdWNB?=
 =?utf-8?B?aGlTQzJxMUk4T2QyTTZ2TUJnNGRaWE5ibnQ5N3hxeC9tTU1saC85NDVRaC9S?=
 =?utf-8?B?OTc5eXlhKzVaY0JkdDFTYVBCdHFHU0hKYnhhNmV6MTFSVkRTYzV5aWw4ZHBx?=
 =?utf-8?B?V2dTTENCeEZneUoxcFhiRlFOSDRlUjJKaTJlQzRhSVBGaVFmbU1HQ0NYcEU3?=
 =?utf-8?B?Z1owQi8yVkdlM2ZHYVdWaG5hSU9vbUlKd3N0MTYrRlhkYkkwNkNWMkhtNkdB?=
 =?utf-8?B?cFBYdWNTTkdqV1d3a0ZzSmp6SE5YTXBSMndGZ21UVlpkQ1RMT1F2QTFFNG80?=
 =?utf-8?B?T3Z2d0dXMit6VG9udlpwcHdhdWFZbVFHVWJ3YVRnaGdreWVYczJzUXZhUkFS?=
 =?utf-8?B?dk9VMDBWeWpkRFhOWnNzSHk0Z2xaSTNXL0UvZ0ZrcGJ0Sk42bTE1VENiY3dY?=
 =?utf-8?B?aU9rMUd0VTN3RXNyeExlbDI2MEJMc1NmQWhUVmZNT2FNUUNqZ29KeTlCQWVQ?=
 =?utf-8?B?bzFTN250SVF0OXhCNktDSjlNTncxWEdOZ09RQ2lPeW91c2pNKzdrdytmTDZZ?=
 =?utf-8?B?YlYzR1dJMWVkREZLamZ6eFJmMThxNHhjaFdVbllPVnJwbS80Q1NBdWpHeFdi?=
 =?utf-8?B?TjlleC9LbmpXWGpOT1VRVk1SZXoyaVpvNUFBbTdxZDBIUGlUR1c0L3ZOVnlB?=
 =?utf-8?B?bW5sY2lyd1B4YllScURmQUhaanMrNWFsdmF5akNVcnFkTjZXbjYreisxeTZD?=
 =?utf-8?B?WGdLR0FFVEZxb1NUU21QVWoyZVkrWlNzY1dQeUJ0Ukh5RXVrWTBscDJLRG84?=
 =?utf-8?B?ekVJc2hCbndLajk3cDBNMG9HS1IzTFFrWjVkMHVEcUE1bmVzVFpXeFNZZ3pN?=
 =?utf-8?B?dy8wbUZPWU5IVkUwYjJJNXNlN1F3RTF1TnlPTmxQOTZ3WDJlbk83UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <665D4AC656DED443BBB4229BFC77AD66@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ced85b94-0319-4474-988d-08df15cfdd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 21:57:42.4787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oi7KQYlhML/O2pvGEVWNHz7Kqlp1pKWrsEdYScv7ZH+7zsNuQBMNiTqy9Cw8Ldarx/xHzAhVHXnW5yQHTkMUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KPiArLy8vIFRoZSBjaGVjayBvZiBbYFF1ZXVlRWxlbWVudEhlYWRlcjo6dmFsaWRhdGVgXSB0
aGF0IGEgcXVldWUgZWxlbWVudCBoZWFkZXIgZmFpbHMuDQo+ICsjW2Rlcml2ZShEZWJ1ZywgQ2xv
bmUsIENvcHkpXQ0KPiArcHViKGNyYXRlKSBlbnVtIFF1ZXVlRWxlbWVudEhlYWRlckVycm9yIHsN
Cj4gK8KgwqDCoCAvLy8gVGhlIGZpcnN0IHdvcmQgaXMgbm90IGAiTUNUUCJgLg0KPiArwqDCoMKg
IEJhZE1hZ2ljLA0KPiArwqDCoMKgIC8vLyBUaGUgTUNUUCBoZWFkZXIgY2FycmllcyBhIHZlcnNp
b24gb3RoZXIgdGhhbiB0aGUgb25lIHRoYXQgdGhpcyBkcml2ZXIgdXNlcy4NCj4gK8KgwqDCoCBC
YWRNY3RwVmVyc2lvbiwNCj4gK8KgwqDCoCAvLy8gVGhlIE5WRE0gaGVhZGVyIG5hbWVzIGEgdmVu
ZG9yIG90aGVyIHRoYW4gTlZJRElBLCBvciBhIG1lc3NhZ2UgdHlwZSBvdGhlciB0aGFuDQo+ICvC
oMKgwqAgLy8vIHZlbmRvci1kZWZpbmVkLg0KPiArwqDCoMKgIEJhZE52ZG1WZW5kb3IsDQo+ICvC
oMKgwqAgLy8vIFRoZSBlbGVtZW50IGxlbmd0aCBpcyBzaG9ydGVyIHRoYW4gdGhlIHF1ZXVlIGVs
ZW1lbnQgaGVhZGVyIGFuZCB0aGUgbWVzc2FnZSB0b2dldGhlciwNCj4gb3INCj4gK8KgwqDCoCAv
Ly8gYWJvdmUgdGhlIG1heGltdW0gZWxlbWVudCBzaXplLg0KPiArwqDCoMKgIEJhZExlbmd0aCwN
Cj4gwqB9DQoNCkNhbiB5b3UgYWRkIGEgY29tbWVudCBzb21ld2hlcmUgZXhwbGFpbmluZyB3aHkg
d2UncmUgYWRkaW5nIGEgbmV3IGVycm9yIHR5cGUsIGluc3RlYWQgb2YganVzdA0KdXNpbmcgdGhl
IHN0YW5kYXJkIGVycm9yIGNvZGVzPw0KDQo+IC3CoMKgwqAgLy8vIFZhbGlkYXRlcyB0aGlzIGhl
YWRlciBhZ2FpbnN0IHRoZSBleHBlY3RlZCBOVklESUEgTlZETSBmb3JtYXQgYW5kIHR5cGUuDQo+
IC3CoMKgwqAgcHViKGNyYXRlKSBmbiB2YWxpZGF0ZShzZWxmLCBleHBlY3RlZF90eXBlOiBOdmRt
VHlwZSkgLT4gYm9vbCB7DQo+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBoYXNfbnZpZGlhX3ZlbmRv
cihzZWxmKSAtPiBib29sIHsNCj4gwqDCoMKgwqDCoMKgwqDCoCB1ODo6ZnJvbShzZWxmLm1zZ190
eXBlKCkpID09IE1TR19UWVBFX1ZFTkRPUl9QQ0kNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICYmIHUxNjo6ZnJvbShzZWxmLnZlbmRvcl9pZCgpKSA9PSBWZW5kb3I6Ok5WSURJQS5hc19yYXco
KQ0KPiArwqDCoMKgIH0NCg0KV2hlbiB3b3VsZCB3ZSBldmVyIHJlY2VpdmUgYSBub24tTnZpZGlh
IG1lc3NhZ2U/ICBOb3JtYWxseSB0aGlzIGNoZWNrIGlzIGRvbmUgaWYgd2UncmUgcmVjZWl2aW5n
DQptZXNzYWdlcyBmcm9tIGFuIGV4dGVybmFsIHNvdXJjZS4NCg0K
