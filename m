Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73144C6F0E
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202385; cv=fail; b=Swm42cAR5L/7l/s2fe4rxcw5lxMzhB64T26VQH/nX1lWbyLk4giZeokmDZB0R0Sky27KesWAQFGWVbq3wn/RbzSzC1SifUv+2AdbNPEE+qHnbmuq3oLHD+Jjy6kHfhTmNwNgPbb43fdlZ1jr2R2l3DcdTCs/QRIYKULmre5k3a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202385; c=relaxed/simple;
	bh=atKRxqkWqlFMc8zkQPT1UUofOFVfwZ/qbQ1j5K4sq4Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aZg//8qKcJXtdjO2ZtZg3HTl0Dg4xrttivBDuupfmKFGQCjCMwVLdI8flC9GkwIyaYEozt3CVzkFMaLNFNOz6M83F+OG7mw1+skUF/kCfrACVhDMFaD8PRi6PvUKNqgFEBF/ZgSgOU1BsG/ORsfNCyeMZkVxfxLv8gBIepwHnjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MXrRZ/f2; arc=fail smtp.client-ip=40.93.196.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MXrRZ/f2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKmzctMWxc+Q1WCwORLjpg0+XhIQsbo4Jww6NZIZHsy5cx780HC9VGiAkUYD36PBQbJ903d/qjbcyMRAqRchOqL3GAMjIGnMq01cixg7jjfxyV+O09r7USr4YF59MMTT7hsy31VvPOaT4G1M0S7Nff3H4GJwvw2oLGcRO1+AN1ezinzpkRNDbO5QmkRwaTI2PWzSOUg0stfKu0EMhXxN7u2v2aQ4dtdoXkIWFwTI7+MRmLC234ut9zGdyC3uJJOidZPRuaXPX96zh56EIkwTwIFmmLruxDAKq67OEgZp28fqNLo9z8Gwu8EiN48qDNR+htVQtfALRPn3kWgYRsPeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atKRxqkWqlFMc8zkQPT1UUofOFVfwZ/qbQ1j5K4sq4Y=;
 b=cOyjoeMaMlWjVNT4PQ/65cQRZVja+wheHDZmQtHKQuU7ZHJ2zXfiSqhifHAsD1himmAeH1u896DsMh5yd6ApHaEqwDP6A7dmHWDeje8WOBk93pXScLwC7ZRZdc/fHUMCbvcwYMWKLnfbGGq6tvV+p+e/uQF8kRtF0w3CIIRD0qElwzcFEL+Mo8MgPNPDxD6uMhVKaM6Rhiy8vUfqvZlGRLTJnofpQ3aJVIpVsTtzO1u0cLQ5TUUjNk3Iw//U8VyhZ/TZDPCksa0GPHPOKiVY+0+yD2CXmZXwwOYOec9oWHZ8dmTTEdcXfVTh8HwaKqRlt+LdbkO9Og1kkit1hGf2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atKRxqkWqlFMc8zkQPT1UUofOFVfwZ/qbQ1j5K4sq4Y=;
 b=MXrRZ/f2UOq6EgnmxBoKCQDDIYXFPSwdn3wLIjtjIoVX1UGu6sfLsDG3pIrA/OrJDubIZulzbj58WOR+j5hCpXydruXb2sOIXbpEnL2FV7ArYvcw4HOED9aBOelweevQak46MBhakGGkVcD1MY2HzDdIEBs/VRQJwDii1L/M7jMJX1k4TRn/gFONxegziGcWKddF5+JN6jKXmED9f5cyeee6cFA+3BqNHz6jPhJ0joiwWqXczQJb2b4zpeUJOEdXTkSiIoKsciQJrMOmcFilXXc4IbT1cDYF06HtPYDXE4FZyEhwygt2QxuFL0H+RITRsuuYJfqhwFzgF/xzOFccNg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 18:26:14 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 18:26:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
CC: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Topic: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Index: AQHc+QGVpGov01rLA0+kZCzkLFfG+7Y4Vx4AgAE6LwCAABnPgIAAAnIA
Date: Thu, 11 Jun 2026 18:26:14 +0000
Message-ID: <f55c43fc4cff816a0d10185d17f761051b879ac7.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-3-ttabi@nvidia.com>
	 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
	 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
	 <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
In-Reply-To: <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM4PR12MB7766:EE_
x-ms-office365-filtering-correlation-id: 85c61033-1571-4432-3471-08dec7e6ebf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003|5023799004|11063799006;
x-microsoft-antispam-message-info:
 1oWaIgS/ZQ9OLrClQWmw/xo9Tr1bHyUcriZrKmgbbZ2m+FPreEd2IX1zbfikrCqZ1WCCg7iBJr9SZYBlgyUmbpZbYdMcM5ALe4vsAWyhoyXaalu2EBhzJaOj0c6iIxVERxGDet0sZkIBYvl3qYm7uoNML0MZSsXcG0GydvM4Ks0hG6FhlhgtaSUvQCKiyF6fcdr22K7V12y6XHtcfWX+PizamGCVEC8MdNWhxY/OzeEYPsjW3+qqb+qbiNAW5gscshPSWCzZcdNV9kwXzN/vfhpGTfGGCXsw2+6Mtc/zNtf8Tun28o24YoYH04Oh3o+bceJxHuPu9J7iV8ndVBGLFZxrJVxYTcNcsTkie0RyT36ZSNyHg2dQpJlSJW9eom0BMY8mNXEC8W0Wjj5kMrhN0/xbKbVoY3YEb5GpHPPbkDblaEzAUovP79dvIiNQjcmCus4gvhgjQHobfFBMcqqzooSRygiC13UH7WpM9bvZd9Z653B9WKeAPAmnOS1B3J0Rni4riA6GAl6PZlxFaVllf7X/JmzxxgynIrnS4Eq/1IEoX3AXnvw+RMQU9Wib78wdpz0rngNXV+8o8dzt1G4w5NGhwzY7D1XFOch1LJ2wYnmNfNJfGBtkn9YunrKIzkGL+BY5p6g53hahlYjgM5vMsHlMaSbEAJm7uGWSrOTzyUQLtUTQCdDUEYs1D3BAMJuS1+ye2/mM8E0Tui9mytofFt1Uoy8nwBorTRxxQSSJLZNDd8q8953f+AlmOKIMb47y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mld5NFlJUVVubXplZGc2eUxKaC9HZHJGajY1Y1VIWDFBYkJKMVh2RFE2WS91?=
 =?utf-8?B?eUlMQ2Q2bjdKeGQzZXhHaVR1dEthdWIzTlFIN05kN2JwOElmWm0vMkVKQVF5?=
 =?utf-8?B?N3p2b1pCRUhaTkZ5dklIUzFnNkI2dXF2T2FWbCtwekNhb2d6Mit3UVlPOUYx?=
 =?utf-8?B?VThWdWg3UHBIL0pER1BtczYrbE14eHVTcU5RUWovWVliV1F5RXZTY0h1MzNM?=
 =?utf-8?B?UGRrWDl0UUNDQTNPSDdpaDNpL1VDYjM1OEQ5WkRaMS9QUHNjT2dnRXF4cDQ5?=
 =?utf-8?B?RUh3bHRjTXFjNDFiaGtHTXlVcDNOUGE3OGVQNEROUnJUNW52QXplNTE2U3lj?=
 =?utf-8?B?d09wQlRPSkJmRHBYU3JzeEZnWHAzQVByWk1sUFpHbWxkM2MyMUlWYUZudnVy?=
 =?utf-8?B?V3pkcFNNU0c2L0tKSzdSR1pZUjlDS0kxZjJRWkZzTUN0clo5cFNXRDRhb0tu?=
 =?utf-8?B?dU5VOTJHZWp6RHJranZFTmo3L1BoWDZnVmJpZWp6NklZTFZTSFFBT0VPMnJw?=
 =?utf-8?B?cmV3eS80bTFwY2IvellySWN6b3k5R3JNNUNFWGMzWWRZdWpMc0xrZkxacnlZ?=
 =?utf-8?B?UFo5TzJ3OUljd3JQTHUyMGVTbGlGd2Mzb1FzSlJWZ1BQU1krQ3lpejd1UVFE?=
 =?utf-8?B?SE9ZejNuSzNLaFVCYlN2c0k0dDY5c2hOT3ZIdXdrL1l5S3dKV1d6VEM1UEVX?=
 =?utf-8?B?SmQwNEdEeXByTkNaSHRiZks2SzBJOWsycmhNOGtDaFdTSFhGeGtYVmFJNDV0?=
 =?utf-8?B?OGtGRnJueUdaUW0zTWNVM1dUU29aSVpJSFJxVVhyS0pRdlR5VFpSZ2VhU2FR?=
 =?utf-8?B?U0VIeEpnN1Z3aU5ndm9sN1VmOXV6MFY4aDVwaUc3UzFQckVBU1B4ZU5ZSE9a?=
 =?utf-8?B?MmRyWUVCdU5LZHpkWFJVUU96OFJraFRjV2cyUEhGanErUHBtWktKeXFLOFlm?=
 =?utf-8?B?YVV5U1ZMQmVDWURVeGp1Q1dDYnpuMENjSVMzLzBlWmIyckZGakNqRE9sRXBT?=
 =?utf-8?B?WDdxT0JVMzJhcitReWp1a1duVi95NCtCS3ZkTk93MjZPZjNqVG44TllpVGtw?=
 =?utf-8?B?dGdoNUZTbFcrTHgvU0NJQ1VVQkZLUnhUQzQvTlM1TEJwb083QUUvSjJqN0ZN?=
 =?utf-8?B?bjNiaVIvMktuUEZiN2d1UVpiKzNHQ1J0ZUEyMGJYaUZSZ1NXcXBHeUxtY1lZ?=
 =?utf-8?B?UjlpRGxxL0RnYzRyaVhtdHdNeTgvT0dGR3VQOTJpM1BRektYUEFPOWRjRWRk?=
 =?utf-8?B?MmxYQzdSb21lMGhhZDNtL2lhUlk5SVh4VGpxRVFYYjBqMHlrdEZ5SmZrK2xD?=
 =?utf-8?B?Tk1MN2FheDFVR05HM212WnZ1YlJXait5MzBFczdabkNhUzF6T0w4VGZZUWk1?=
 =?utf-8?B?UzZvYTRrWVpIeXVYQTE3VEF1VUhSVHB6VVM5cHVkMmRiRkN3cGR6WDVxS1Yz?=
 =?utf-8?B?REZ2eHVsNFRPeXJvNFdDS3VrMnltK0VlTW1PeFB4d0EyKzhlZlpnYmZkUXZ6?=
 =?utf-8?B?bXZwd1pFYU8zTFBUNWdIUGtKdk1mODd6NFV0bUNFanluN0NDRmdpd1M5YTVj?=
 =?utf-8?B?Qkd3NVA5NVA1dGZiZUNBcjhnUTNNNTg0RVpOd2ZOTkpKUmdhaThOczZUYnpN?=
 =?utf-8?B?ZDUvZzBieDV3TFkrbzAvTzJIR1A5LzNSMHhXWEg3bTZPd0FEME9ReFVVaEgr?=
 =?utf-8?B?UWlYbmcyWWJDNlhVcmUyYnJGbUtZL0tmME5ZVU1VRnFGdFRFYVNWT0Fuamxi?=
 =?utf-8?B?dU1mZVVEOXVqdTlSQ2RGTzVuYkNwSmlOazVQRjJveTExZU80TVNkSDJYb3hH?=
 =?utf-8?B?UGJkTk1udEQ3aiszWVpRWlMzOWI2eEJ6ak5DaU5Uak5aL3hHOXZZc2JoQThK?=
 =?utf-8?B?dVhFOCtVWkFPZVZwN0JYM2RnUzZORnRQVVpBODc2bzBMRlZxc3cvcjAzam9m?=
 =?utf-8?B?SmNPLzlkRUd5SVdLbzliaisxWVpaWFk4cWR4VllQQWdWSnB3WktlQjZJb3ZW?=
 =?utf-8?B?U3p5R0EwejZpN3VSTU5mTjVUOFI2ZzRDVThXaEVPZVAvTTd3UHFVMCtpVnVO?=
 =?utf-8?B?elV2cXpqS0R3K0xaNzNabFY1YjQwYU1CdERaNy9Cak04c0pHMnQ0Sml5d3N6?=
 =?utf-8?B?ZEVHVXZmcE05ZHl1VWN4SmtLTG13ejZTRlJkYVlpTUV4bFRjNFJna3YyQlhy?=
 =?utf-8?B?K1M3eWpXVkx0WjZjWFM2aTFNYlMyRjlGL2pZbWVtdzZHYitGNVVjMXVkMmJ6?=
 =?utf-8?B?UjJwZzhhamRGYnB3UmlzQ1lCd1oyanVrRVgzNTkrTlMzak1ZWmk2SFB6YWxJ?=
 =?utf-8?B?ajczcEpQaUd1RkZ5REpEWncra0EvVk9pRWNHbXhoYmVLN2dkWEJsM1hBTnlj?=
 =?utf-8?Q?WtJ1GJsgk5sO9oHy1Q/MPcnejzWdiONCc3npLqVOHc8H2?=
x-ms-exchange-antispam-messagedata-1: 8wg2R2iAoUOMXA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <18074D8F777CCC4DA4086E784318AE5C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c61033-1571-4432-3471-08dec7e6ebf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:26:14.7770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpKcVUDmJO37vkNxRutmOtab74qrtHlceR13ulgu0JsaCZjA4fAtqEuhp+f2wS1Ud++CiCBIi0+J70Pw9vAqFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766

T24gVGh1LCAyMDI2LTA2LTExIGF0IDE5OjE3ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gVGhl
IGdvYWwgaXMgdG8gYmUgYWJsZSB0byBlYXNpbHkgZmluZCB1bnVzZWQgY29kZS4gSWYgYGV4cGVj
dGAgaXMgdXNlZCwgdGhlbg0KPiB5b3Uga25vdyBmb3Igc3VyZSB0aGUgY29kZSBpcyB1bnVzZWQu
IElmIG5vdGhpbmcgaXMgdXNlZCB0aGVuIHlvdSBrbm93IGZvciBzdXJlDQo+IHRoZSBjb2RlIGlz
IHVzZWQuIElmIGBhbGxvd2AgaXMgdXNlZCB5b3UgZG9uJ3Qga25vdyBlaXRoZXIgd2F5Lg0KPiAN
Cj4gYCNbYWxsb3codW51c2VkKV1gIHNob3VsZCBvbmx5IGJlIHVzZWQgd2hlbiBpdCdzIHVzZWQg
YnV0IGdhdGVkIGJlaGluZCBzb21lIGNmZw0KPiBvbmx5Lg0KDQpUaGlzIGRvZXNuJ3QgbWFrZSBh
bnkgc2Vuc2UgdG8gbWUuICBXaHkgd291bGQgSSBrZWVwIGNvZGUgYXJvdW5kIGlmIEkgZXhwZWN0
IGl0IHRvIGJlIHVudXNlZD8gDQpNYXkgYXMgd2VsbCBqdXN0IGRlbGV0ZSB0aGUgY29kZS4NCg0K
QXJlIGFyZSB5b3Ugc2F5aW5nIHRoYXQgaW4gcGF0Y2ggIzEsIEkgYWRkIGV4cGVjdCh1bnVzZWQp
LCBhbmQgdGhlbiBpbiBwYXRjaCAjMiBJIHJlbW92ZSB0aGUNCmV4cGVjdCh1bnVzZWQpIHdoZW4g
SSBhY3R1YWxseSB1c2UgaXQ/ICBCZWNhdXNlIHRoYXQgc2VlbXMgZHVtYiB0byBtZS4NCg0KVG8g
bWUsIHRoZSB3aG9sZSBwb2ludCBiZWhpbmQgYWxsb3codW51c2VkKSBpcyBzbyB0aGF0IEkgZG9u
J3QgbmVlZCB0byByZW1vdmUgaXQgcmlnaHQgYXdheSB3aGVuDQp0aGUgbGFzdCB1c2VyIGlzIGRl
bGV0ZWQuICBPciBjb252ZXJzZWx5LCAod2hpY2ggaXMgd2hhdCBJJ20gZG9pbmcgaW4gdGhpcyBj
YXNlKSwgYWxsb3cgbWUgdG8NCmFkZCB0aGUgZnVuY3Rpb24gd2l0aG91dCBhbnkgY2FsbGVycyBp
biBvbmUgcGF0Y2gsIGFuZCB0aGVuIGFkZCB0aGUgY2FsbGVycyBpbiBhIHN1YnNlcXVlbnQNCnBh
dGNoLiAgVGhlbiwgYWZ0ZXIgYWxsIHRoZSBjYWxsZXJzIGhhdmUgYmVlbiBhZGRlZCwgSSBjYW4g
cmVtb3ZlIHRoZSBhbGxvdyh1bnVzZWQpIGNsZWFubHkuDQoNClRoaXMgZ2l2ZXMgeW91IGEgY2xl
YW4gc2VxdWVuY2Ugb2YgcGF0Y2hlcywgd2l0aG91dCBoYXZpbmcgdG8gZGVhbCB3aXRoIHBvaW50
bGVzcyAidW51c3VlZCINCndhcm5pbmdzIHRoYXQgd291bGQgaGFwcGVuIGlmIHlvdSBvbmx5IGFw
cGxpZWQgYSBzdWJzZXQgb2YgdGhlIHBhdGNoZXMuDQo=
