Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6032ED5C
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192923; cv=fail; b=HCPkBqNUHEH9vAFRrnG9jy7oxZfEDH0KPaR2b03DbKUr3ePOBLqA/jX/je2aGZ5A6PmSTNV5Tl2tFY4Rt8AOzzo8F9K4Q3Dbq4IkiniWjxLYvFq74nh48fPn6Ypo/s5cMfUFzvWqtK4GnIaYTl48t8UFWYNh9U2KF0jm+eVlJe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192923; c=relaxed/simple;
	bh=KtGJ44edQFve8/XfttsM89X5D+I14Cp0BwCYp81qkQM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DkV2lWwgM8oDxdIB78QoNahc0GL+Bc6zForpUwjFp9wyUpeq5IvfaOxsDc49QAKJiOUufjGYWiGnF7mGodGfj1sif053lfbLJKjn27AoSioFI7HDUGr68Aui3Bpim5E52KBtTm8h8c21BLZ0CDA+19DSqce20FQ4zXSgOI+KQxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G9t7I7Sw; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G9t7I7Sw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht644G4qRv8ynfQ47o07FWgxyxmtr/1WbSzgpGQX+6rOt6Xp4J7RXO1xIhVA8+Zn5ghqx/5pPfoVrSBXZKf7+GkMXjhB/ne+k2GXhSNLWSNRfPEwEd2nCAlpMOrAkDK3/XsuZCk8YAPLdxAS5rCcTSkyI9l3Hf1swv6MFvsaqY8Mo81bHkUn9tH8yLDEOzHFn6iqwRq2QMvAFAUiz5T8pgLvDGAVL+uu7092qjWkwogQObfwP3zORJEvSDI0GL3BzAkxwPQVh8/FBSKPXgAllLMnsKPJ/FQ6WgcV3GsdyW16I6mpU2QY8gmR8Nx3/AVvZQP4aK6eepfymvi0CysGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtGJ44edQFve8/XfttsM89X5D+I14Cp0BwCYp81qkQM=;
 b=pFwL/5VB68IijT+tH3lfksJIe2wpByS16gM9vEkwf2zX6dzDZVusk5Zq7OauG0biedGZXUhTIke+3oIwq4tmJRBV4wp18acSQjpxSNekkH7C6TI8HHABcDejpcPid3pxm2qXy1k4Cpi4Xi+00s/TQp+yfplkdDnmkCxzuy+aSgd9+4C7CrwLYv/Vq92fKBzglJ6AMn/B9luN2vt0jGt7Eyh5T57Q64dsMKdUDxE6hYEeHX3T803geMoNMrKLcZMXlflhVoi0Qj/mkmL4ZZuxUI68uei0/eO1Yoy+XFafLqhHSP1iShT8T8cUKNQQxFsHEkUiGw3MvjNwweBJ7NUojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtGJ44edQFve8/XfttsM89X5D+I14Cp0BwCYp81qkQM=;
 b=G9t7I7Sw5oDPEKVvVZ5JMqMTU2YRpt01sIMGdDelrf1IrPv1JNwG0trGy/4ntDL3usmS/vzxXveAh8H2uIdEL7hg1ZzWal80oatY1qnLa/3qn3TOe/zRl6tKbnXQQoAttB666OnifM58Z4Rpswyj5T8NMPYT+83Bm7spXaMm1qbI2PyCKybv+Rpd7aKtOd+29azsWKLfRA6bSFvhqMCVnrZYWJEeNtaZ0Gbc6OlQM9Jt6AK/otivXIYjLZn48oiemJ2h8qJbbiXzhKta7csLjscVKKMvhJ8Q/wlHg8SWfmBuUNxtOnono888bvesWqqLlyJ1jE2Fnp5zKy3HsphZZw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 15:48:34 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 15:48:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Zhi Wang <zhiw@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index: AQHc+QGZGJRxryX2J0aNJYdBUK6JarY4FNCAgAAF+ICAALEWAIAAtaKA
Date: Thu, 11 Jun 2026 15:48:34 +0000
Message-ID: <cd7773680564eadbd6093eb469fcbbace07ab1b1.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
	 <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
	 <DJ5YD5P8SRF3.3FFZWZR1F8Z02@nvidia.com>
In-Reply-To: <DJ5YD5P8SRF3.3FFZWZR1F8Z02@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LV3PR12MB9215:EE_
x-ms-office365-filtering-correlation-id: 829a044f-0dbf-4ff3-2983-08dec7d0e50e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 QIkO2Z/cKa34abnOmY51xnqrlrxMmYoQUUjJ+5LvvFiPIa1OiMWp1KQMIE7WqS2ctyOpIn1Hm3xKMM1X5iD896aYbUlrqf7dO3myWP1mpQaNkJTEpzojrHGZB/eqgs+nkMF3WXRwQ0YCiTzWSa/48elz2DH43utjwx9YDnvdsuX1E7tNWMd/+ZQNcl5bhUznhGhv4LZI1w/xLTaHfXISoLj8XS7ivSbzaKt0qAvdYgHbTW9tE1TlMeyjRvACwdZoAzGUUuCTCpvoDaTIKPektORCxUoHJqyamPUkMwnR3hszgYJhXLuUyhqq8mdWbe7SCWKNb0zXqbX6U4eA1CZA2+aCWe/SAMSDwr9qOH4cNFcxop7OmjQMXClyOIg4kIb8tfeYET5MX9bb+cJYrUmzb+uMVdbguozo44EDAp1zAWtJjdfcdThlKCagXqfHjEBKCg+HXGN88I3o+OXcBX15Oc9pIHuWk9iFZBY+flSKcDqM2HCIbCIhi+VGEOL2gHZmz/V9MHm/rZeAqLMXmr6hdKXrS31NAuBNSGWsKZtltdlu569dF4S4c4f1a1i4zDE5NipqVW/Ka5mw+wXFU3XySjmIkUimIcj6nF860oVW5cs4+D99QGi7IcGSRDMneJeGuUOMd7f3AMxwsgjiIsrlo/X7iskiwfRBnzPKkVsKaG296nJAgfiD73d0hLw3PV36uyFYWRWe9C3TKMKwWjpbotYPYx+lhRGQnfeCGt8XSbWR1cRQq1q+lDPU3G0DYiAO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzBtejBCQXE2NUxleEJWVWd3TE16V0MwUTRCQlNjVzV2U2x2WDY3V29NdVZN?=
 =?utf-8?B?RU9RL0orOUU0bkxLMWlIbFFtSEpldVJscUJIaDBGaHdWNEFVNGxCelZGUmdN?=
 =?utf-8?B?bGppSUhLQiszYnhON1U5RlVtTW5LcHAvRE5qc1hJa2N6YktGSEtnTUl2OGU3?=
 =?utf-8?B?RUFTaDFHUDlTNEsrS1k1T2c4UEN0OHFiZFI1Y3FMZFF3cHBCaEMxT0plMEhh?=
 =?utf-8?B?cStmSkhRbEIzWW1hRG1lckZNUWtYQ0prUitIQkJVMGtxeGVUR01Ib1FBUGsw?=
 =?utf-8?B?YzR4b3lLaUhsZlg3dlN0bzRSeUVUd1Y4WmlieTlFQ3Joc3JueGg4TUphNHhQ?=
 =?utf-8?B?Rlp3ZEs4R2ZJUnNxZjFDUkR3Wlp0ZXNiMkFLZW1xWVJSdlJxMzVRYXdJK09O?=
 =?utf-8?B?Vm9OSy9NY1g4WTlLVjZHMFo4a21ndUM0eVhaUHN0TnVSU0JwVytuRU12VzZa?=
 =?utf-8?B?b0tCSjBMNUhvejBrdEpxc3pvMWZnL0xKVks3Zi95Q0dXdnVYSmlHZUNHcld6?=
 =?utf-8?B?UzJXOHJaSXRXN1BIVHRNeEprbEtyUFczVklGQVRhRk1DejVnRDFVQzN2eFBG?=
 =?utf-8?B?YnZJMk5ORE02eGJYNUJ5UTRhSDJqVzVOb3VHK3kxeUVwVVRJbmZhNGtFNW9t?=
 =?utf-8?B?NllzNWJ6Nkx3U2UrVVFnemNOeGR5TDRDUWdKeGF1ODRlUUxmZCtCZmNYdWVR?=
 =?utf-8?B?RkszaUJZSXN1eGo3SXhYNXowT2IwYXd6bU9HZ1hHSjRnMWltNUtNU2M3aG9r?=
 =?utf-8?B?RFRYUHFpM1pBRUV3MXN6ZERaeDNaNzE4WTN2SlVhVDlqK2pLL2g1Zzg1TkNH?=
 =?utf-8?B?amMvRUJidWtNblhYR3F0N1NXWUZjZkN3VE5lTEhqbjhhYWltWGNuaGNvZUti?=
 =?utf-8?B?RWRQcTBub1NRNWhRQkJ0K1BOMTF6TzdtNThEbGtiSHc0ZUsyVnRYWk5hMzR6?=
 =?utf-8?B?RG9uczZ0N3JnZndHYzBmc1Z6T050cWNMR2Q0c2dMOFhwTUkzeVQ0L3NMdThQ?=
 =?utf-8?B?MEFIcmkrVVl4OG1neTBIaVB6Z3A5TUZFZ0M2NkZLQ2pPcU82alJsRXBlajNE?=
 =?utf-8?B?cUhzQ01za0dGWnhRUkdyV0EzcHR4WHZvZXVLS3ZWbFozUnl2NFdDbVI3ZjI2?=
 =?utf-8?B?eUM0OW56QXd2U1hoaVVQcVh0NjNDQ1daNzNxWjBzY21UcnJFdGM3N1VTVThL?=
 =?utf-8?B?dWs5OUUxdlhjZlBKRVJYUk9nNEFRK1hRVmpZVU1YTWZtMXBFUlN2ckt0Ty9u?=
 =?utf-8?B?L3d1UVkwUmJWcFBWMTRnRDlrNnU1SGlnK0JaNmVkRzNYaUU4OUdYVUJDdVBH?=
 =?utf-8?B?Y010aGRjMUVDTjJYRXZIajJGQm1pSTIvZ2txK2tUR2JZMXVCd3UxNkFmRWFG?=
 =?utf-8?B?VnpTbXlpdFpVV2JVNEE5ODNZNlViQkUraktvM2hDVS9ScDdNOXlLMXVvT0dx?=
 =?utf-8?B?ck9UT3dvcG5YN2xmbktvSTlUNnFCY3dKOXppZWl5UTN2WitCRHFqc05SMFRr?=
 =?utf-8?B?em1HY3dsT0tIWlRpOERYY0xqOEYvaXJySm5LN2ljQXo1bmRSdml4RkxzNnVM?=
 =?utf-8?B?U0h0QTZrRHNsVkpQY1FuSjRTK3UydnRrOExHYnFjZlBGMklUemtMNGVJcnk5?=
 =?utf-8?B?ZTN1d2tac25XTmxXL2I5bHZzTjNIaXJkUHhtTUpYMjV3cnh5SCtna3ZOV2ty?=
 =?utf-8?B?M0oxTEFONitNZk1obDZOMUsrMFAyT1ZhV3VkMC9BVHFiNDVtU003UG4vNE5Y?=
 =?utf-8?B?YTJkdnNCYmYybnZDOXBkNEJLV0dtZHQ3TmdJUzJ6ZVpDcHg2bDFGNjVtWWlu?=
 =?utf-8?B?Ryt4VjYvcGMxK2s1ZnRCejFTNlE4cE9pQ29qVENKYW95Nm1TbVVqclJLdGhl?=
 =?utf-8?B?cFpObWtnUDlWOFprVXNOK3RVS3VGdTFZbWpVYVpUekxlZXJ1QWxvZktPTU1k?=
 =?utf-8?B?aFBTdXF5SmxiWkNWbnM2QldHS0pvZjczQTNoNE1yS2dtV0dja1dVaWYxWlYw?=
 =?utf-8?B?dUlSbFdLMzFFTUNPbzlWMUFaRjN2eFU4TnZSc1R6WUFjMmJhU3B3aXpsUjlX?=
 =?utf-8?B?YnBzV0o4NEtBMXVsNitnSTN2SWlTMDB1MyszV2FkUjFPSGNZVTFFZml5Q2cr?=
 =?utf-8?B?Y1dQMTViUWdjcVk4U0RBZWdZK2dQbFZOQWNIUXk0citrMzhWUWdGendFY211?=
 =?utf-8?B?T3E0bWIrcHAvTmYwTjJpY0lPdmhVcVFibno0RkxONUw0RUR2YWJ0QWc5aTU3?=
 =?utf-8?B?RmFXcDBSWFlDN0hDL0tLVUJ1azhBb1Vtb3lRZjQ3V0txTVdlTDUzUktLQ28x?=
 =?utf-8?B?SmxqT0tLcWZhM3RGV3p2ckRSdDVkMFV5YXYvd2VWMmFHdExOWVVaTS9rQWM1?=
 =?utf-8?Q?sX43oX4CAN68Ld+1CHUZ8smKU6Rjbwa/Nej6tEdyUv1zH?=
x-ms-exchange-antispam-messagedata-1: H/g8Mf3I5reL+g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CCBCF1B4B3E6A4BA96F553A2B147CCF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 829a044f-0dbf-4ff3-2983-08dec7d0e50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 15:48:34.3026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7X86QRxKu7HnXXUe1/LGzXBu2h0beuv2rld4BQzoyeIqAWQ5Q5nEt+BhFEc7wu1RPJfIlGkkGicCmrpmG7qgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

T24gVGh1LCAyMDI2LTA2LTExIGF0IDEzOjU4ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBUaGlzIGhhcyBhbHdheXMgYmVlbiBhIHByb2JsZW0gZm9yIE5vdXZlYXUgYmVjYXVz
ZSB0aGUgR1NQIGJpbmFyeSBpcyA5ME1CIGluIHNpemUsIGFuZA0KPiA+IHJlcXVlc3RfZmlybXdh
cmUoKSBhbGxvY2F0ZXMgYSBjb250aWd1b3VzIGJsb2NrIG9mIG1lbW9yeSBmb3IgaXQsIG9ubHkg
Zm9yIHVzIHRvIG1lbWNweSBpdA0KPiA+IHRvIGENCj4gPiB2bWFsbG9jJ2QgYnVmZmVyLg0KPiAN
Cj4gSUlVQyBgcmVxdWVzdF9maXJtd2FyZWAgYWxsb2NhdGVzIGl0cyBtZW1vcnkgdXNpbmcgYHZt
YWxsb2NgLiBVbmxlc3MgdGhlDQo+IGZpcm13YXJlIGlzIGJ1aWx0LWluLCBpbiB3aGljaCBjYXNl
IGl0IHJldHVybnMgYSBwb2ludGVyIHRvIGl0cw0KPiBsb2NhdGlvbiBpbiBgLnJvZGF0YWAuIFRo
YXQgbGFzdCBvcHRpb24gaXMgcHJvYmFibHkgdGhlIHJlYXNvbiBmb3IgdGhlDQo+IHVuY29uZGl0
aW9uYWwgY29weSBpbiBOb3V2ZWF1Lg0KDQpJdCBzZWVtcyB5b3UgYXJlIGNvcnJlY3QgYW5kIEkn
bSBtaXMtcmVtZW1iZXJpbmcgaG93IHJlcXVlc3RfZmlybXdhcmUgd29ya3MuDQoNClN0aWxsLCBh
dm9pZGluZyB0aGUgbWVtY3B5IGFuZCBhIGRvdWJsZSB2bWFsbG9jIG9mIDkwTUIgc2VlbXMgbGlr
ZSBhIGdvb2QgaWRlYSB0byBtZS4NCg==
