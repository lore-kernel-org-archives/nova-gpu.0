Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918563655C1
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 19:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206096; cv=fail; b=n8uu3kqDzfMw80KGr3irnIdGQxAGceVToVJx0Q9DP/96hMqocKYALulBgQxpjd3A1AUg1p+Ai6alRzbEjYCW7XMhyVe4UXEhN4xV0IBsJMAsFPcgWkE9t7HGDRzmMDniPmg9SaMvbwf2u5UYfo1b+fp9WQoTywxP+Sc6rw17HUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206096; c=relaxed/simple;
	bh=T/96fV2WjZ6asyJd8qm/2HwJTqNXhIQeD2Dgsd9KdFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ql2fJr8OlLcpL6EpB5KlXTsZ+pKof/U6FtS82lgF4LDoGzJSnVbnGqhnDXkNUxve9IoqZZwHAtkZwhJBl6+6STUG2vRv9x8cvY7TVSxewOqbXNA4aY5iMvn9XDZKfnF2kZDysUPoQJ0wV7Kjs8PzTg7XO49vWpt/yWsjcU39gDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LLPr19DP; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LLPr19DP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svj2Ug5+nOinm4/kPSGry/TAP+qi3dhk1lJIOxkjKuobiwGQthYg/8IZLvDYoenYqCHPs/Ker1BYz1/VUPCJHHc0Qs6cedwIAOI5cEXhqML9eddxT+/plsnDG4u6jZMdL3Gs/kk0m78PZZD6SVgCduP7tcFqXnZaKHhIoJQ7I9kZHk/vPHrGIcABMMhx2iYmHLR3JlohkVLO4bGLaMaFlAbdcY5aWbSHaSg8Aqa7y2I6dK1C41LkvypERDEoSmNoAskPY1bOZjXJBJdD6GkuftfFJmWa6+iPqq7Z3OOLpQlZODy7xMHpGgK3SD1QbiT26fYNTEVNt18aWeGJkPXu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/96fV2WjZ6asyJd8qm/2HwJTqNXhIQeD2Dgsd9KdFM=;
 b=ei60SHP+0KAYoPoNkbTfTi5D3x/kA+ASMCH4KzHlw+RwgcSbjjyG6zvV+amBzS8120EokT15Q58+b8Gsu2LvHQlMoDmK2otTKABIBZKQjDKcTeInbtUjOy+fSXoquw6tEv5wymgKYYNIblvJyiG0x0guuWr+erjU/T1MFznlQwTStpMmR+jTz8zr8GtJDOn6hvq0V4G+J2YDD6CLCwPx+OnRJBV3cDEuY5cgTEOf6KF+MaIwC7AmGBUdxgqxfz/pY7r81rPuvuxuR3Ar9QXb9O86u+A+UhlWmK2fTIUJfIXeq6blC06EoM9kKaQErpWigUwz991TAVMIWcc8KIsBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/96fV2WjZ6asyJd8qm/2HwJTqNXhIQeD2Dgsd9KdFM=;
 b=LLPr19DP98aRZGQ+0uxNGM8kWwHQDqo1WyjKF4v/Jl0sysEID9aPyXbqFqM/k3NbmqzbPD+LcBosNkWys1Tiph3cLThAl2kfkfCWx2nlyA0EFAO0GJf5Thl9eewi9hwrSIizEEjiBkAIQtWPBIyWA0WPDXtI0ONAJLQxdL99Ibzwj7JqYE6nZtCJb2kdNnhMm/DLkwKV2gtadjwGQwaC0XRnYzafe6SsDnTirHJNpxDfXy84gCXmOrZ4gg5nwt6oxYAjPKG3EzdeNQl/8jEjJ6Po+JUF1y72LTyzoF3sMISpDu1bDV7xHEcr0LbpHcuKOMpJxH313aidp4Qt9XgXpw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 19:28:10 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 19:28:10 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index: AQHc+QGZGJRxryX2J0aNJYdBUK6JarY46wMAgACi4QCAAC5GgIAAArGA
Date: Thu, 11 Jun 2026 19:28:10 +0000
Message-ID: <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
	 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
	 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
In-Reply-To: <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|LV2PR12MB5821:EE_
x-ms-office365-filtering-correlation-id: 4dd3921b-2521-46a8-1d5e-08dec7ef926f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 XiqAZ+3UqYZzL1oAKgpPLhn3KOfKCVLkd5wR9RMz1a1X2SBdsi6ObJMCe7kQO0SXV39zVwceZWM7aNdDSalRxeysEQfdPHzr50iTCk2lfmqxLFlfSQTXjcNCbVo3H7gJQyi495n429YBIu8kcu+I0r3oRsPCYig6NgQ479pV6jxEuoK1qSrcr4yZo1WA9VRqtGQxn+zlTEmuc6xLeMWF7p+bQCm6hEnILsz9WM/+GNK6qEdmFPwXZupt8ycpBaRMg49z6vcG1FZS5HoxTMnzVBvsGjNgWxakrE7d7ukOdBHW/2Pd2U1YOD744CajqkfKIYNjUd8YQEyn7+FHEAWJMyqeLFt3DGNiG4VJoM3Z0c/GsmhDPYZ2wvD65iVItQbgWXbaQQMM0Ovs4Y4S3UGldRgwY2UdTe0MseXvqTiX3XJjXrT1gSQAY+PzzzBKh4H+MGtkK/GSbNcPVB3N4pJdbxvqPFCJ4dPQBJC92h+lahYsym9B5sESDPo3YVG/z30TGW7Bz0L3SxR+1hNZ+88R4crHPvPiC9BuB3y5w8zG+IsbRVYmdeF1UQH66T6ICe0MQcwKd3L18uPPWSqtpVYtwfSdyi28wK66I74QcYqGrE7ZeD6vVfct2DhHpC5UrP5Qb3qCzCkDbbzbXHSu02GbvozmzKciMXlworuuE1szOiIDxvv4ICXDq4xh1KfTH7KmqHO6iWWOy0LvT9JI2unfa+T3gJsPrav+Xyb3fbt7RFluryRJIi444S09Dhu/bXgc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SElpdTUwdTdQT1RzSHZsOFZDT0t5aTZKeXlybTN6cWNRYmwxYThFeTMzRzFI?=
 =?utf-8?B?dDI5ZU9sajhvT2o4VXYxSmFYeGs4SExtQkVBTldZNk53dFNTSVNRT3FKb2Y0?=
 =?utf-8?B?dTBhVG5xNnFlK2hNOXp1bkdyckRObm5vcXM2dWl5T2pHTFVULzI0bDRBYklF?=
 =?utf-8?B?bzlaY1Q0Tm9HbDlmYUVjSWM2WC9meUVtZFJiRFBHOVMxTk1sRDVBSjFBMDFz?=
 =?utf-8?B?MENELzEySWMzc1FyanpFRnhnY3RzZVk0ejlWS21WOTVHTVlqejF5RVdNdzBO?=
 =?utf-8?B?b1FETHJSc3BtQmFUR3R4SDYyRjFhaTZVcEhhZktWQnk4ZHNrQnRCdStOd1ho?=
 =?utf-8?B?Yzd4dEJ2RysrNzVaWEJwZXZBK0VwUjRUSmtmTXNPTWRsSEphdUdabkRYT3lU?=
 =?utf-8?B?azlGVVIway90Z1BTMGYxclBnNjJlUHV1YjZxQVE3ZTBLaVIzZHNYWGo5Smxl?=
 =?utf-8?B?ZW1WREVGMGNXbzlNL1BTOGZ0czBvcHBNQytaa2ZaU0VWN0RSYVkySkpONEIw?=
 =?utf-8?B?Zk9xbUliODlQNGNFQVFYd2M5eTg5cDBnbzM0STRybUEzVHRkQ2d2VlhrVGdP?=
 =?utf-8?B?bjFQNmZHbDZaYklacFBDK1BLRWhoY2Q0ZFBndGRQNjIzZ3RycDlPc1RwTEpU?=
 =?utf-8?B?MmpaUkdhQVRnTXFhSmRKYlZuZlhLSDNOQXQ0YTY4bUlWWVp2cFN3djhGL00v?=
 =?utf-8?B?UEFiMlNPMVQrd004S0M2djk0ODFIZWkrb0Y4VU1ncENIbjhDRWR3ajhNMERC?=
 =?utf-8?B?SWJOVjJ5T1d3dGIramdsU0t3NUxianQwakdaL1UwT3hKNDNMQkNKUjhHNEtG?=
 =?utf-8?B?eDZjazNsR2lpdC94Y3QzWXZDbGhGN3FxM2h3VjVhWXVMT3c3ZTVjb2txcDd3?=
 =?utf-8?B?REhNQXVnQktLSjc5b25IWVN2enlFMUxhcnZaRkJHMEZsYTJZK0VmTm1kVHZw?=
 =?utf-8?B?a2R4OEdFZmovc0FSTzlNT1lNOHZVc1Jwa2FtT1pPczRjUnRXbTBoRHNsQU01?=
 =?utf-8?B?M0s2QkRENnRDTEtEcWxLY3lLYVhWd0ZiM25GMUpGYUF3M2RHSk9hS2VBRVlY?=
 =?utf-8?B?YVJmcnFsZDcyMHduK29uY0phVWFFNmpjWGwxdHY1cjRId3Vrc2dYRE1iSlFY?=
 =?utf-8?B?VkRjTHFtYVBKenlTSnQ1c2pmY1h3dFdzejE4bGlndjNZSmtmeS9ONDUrNkZL?=
 =?utf-8?B?aTlIZzFneDk4OEpCbG9SdUREV3Y2NllPV3V3Mm9UeTNrVzUvQWZWUUU5MVlJ?=
 =?utf-8?B?NWdhSUcyRGZwcWI2RlFONWZWK245aVc3dFlaMjdQRENGeVBMckxKM1U2UW9U?=
 =?utf-8?B?L2RSMVZTN2xLYUZZaW5uTGcxenhucHNpbXo3ZlcwNFRqbzN2SnJna0RPWklF?=
 =?utf-8?B?QVZMT2g2UG4waFE3dXFvMWRMQXJDRjdHMTRrWms0RkN2bVlzZ0V5cWZNOWI4?=
 =?utf-8?B?b3E3N1lOR3JFTFY4dXdzWjNRY0paVGhhL3V1dGVLWno0UnNpV0Q3azJINmRm?=
 =?utf-8?B?dE9yOFh0U1k5WXRSRnoxcEkxNExIdHlLTURPa3dUMGFPN1NnQ0dRc2xuaEhj?=
 =?utf-8?B?S080TGx6MGZuTkcrckJaalVaQU1xVERLMzNPRGRKR1Q2LzFkM0VWTDJ0VHdo?=
 =?utf-8?B?cHQ4OUV3Q0QyUjhLdVJaenV4c3ZJWEVIeGgza051UGNFNk94TmpYTVFrL1cy?=
 =?utf-8?B?eUdtd2tlZU5WRFZJcWNJNmNiTmlUdWtzVU9ENHRSMjIrYVlCUFVqZ0lSMmRI?=
 =?utf-8?B?V2liWnlwU0JJQVBGQzZKMnI4RXVVRVkvOUp3ZnAyUlRaT3Y1UWVLZkllcW9K?=
 =?utf-8?B?ei9ENWJXd20wY1VQR1hrZkdCbmt0VVJxKyswN0dzWE01TXhnZFhNSDVuWkgx?=
 =?utf-8?B?dEF6M3pmRGRYQTF6dDRKSmRQZlp1T0JWai9hRzJCcFl4YmhPRkxGUFBaRFpT?=
 =?utf-8?B?L0Z2elEvUk5BWGdoTkdhb1BGQTcxQWh4enRoZU1JUWVucTRvQlVEWWZxT0da?=
 =?utf-8?B?TU05MWVGbUlneWJsL3MrdklHc0ZQQVdlVUE1dk1JZG9HMFNIMFhjbGJxekxM?=
 =?utf-8?B?S1NKemVpK29zbTRzTTRPTmxOUXZsQ3V4NXdIMWJXSVB0LzE2K01EdXFncFF2?=
 =?utf-8?B?SzhKTTVsMnR1MldBaHFwNDhOaUE3WjZOWDF1Nnd5aVFOVEZXTlZSU2RzMG4y?=
 =?utf-8?B?QTZXTitrb2VVd2JuNFRhbGJuS01ZYUROano4ZVlaZTFKay9OWmx3WEdjWUhj?=
 =?utf-8?B?UXh2TTFHRjJTd3VBTEw1M0didTBrVlFYbEowQUNHRWdQRmZrK0NkRWVZVFRG?=
 =?utf-8?B?ZHJ3U0IzbWV4UzdQMys1U3dxWXJVdEFmNVBIaE16dGpKZFIvZ3lZamkvaFBo?=
 =?utf-8?Q?PoyFsssoHC6AJAWmbNVoWQ8R4OWi52AqI2L9dIh4ea1Xw?=
x-ms-exchange-antispam-messagedata-1: 4n/tcqQWa5JQIQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <8988C8DD81B9F64187F48CB9F11914C6@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd3921b-2521-46a8-1d5e-08dec7ef926f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 19:28:10.0718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNDG9B4suJ00HvfeHbCSpYAjRnPibSh/Y8AsEZcWx6zUZrMR4FUz4PtBXvaSVWox2lmp27h4WAhkZr3PqPIwXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

T24gVGh1LCAyMDI2LTA2LTExIGF0IDIxOjE4ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IFN1cmUgaXQgY2FuLsKgIEl0IGFsbG9jYXRlZCB0aGUgYnVmZmVyLCBhbmQgcGFzc2Vk
IGEgc2xpY2Ugb2YgdGhlIHdob2xlIGJ1ZmZlciBvciBqdXN0IGENCj4gPiBwb3J0aW9uLg0KPiA+
IEFmdGVyIHRoZSBmdW5jdGlvbiByZXR1cm5zLCB0aGUgY2FsbGVyIGNhbiBkbyB3aGF0ZXZlciBp
dCB3YW50cyB3aXRoIHRoZSBidWZmZXIsIHNpbmNlIGl0DQo+ID4gb3ducw0KPiA+IGl0IG91dHJp
Z2h0Lg0KPiANCj4gVHJ1ZSwgYnV0IHRoZXJlIGlzIG5vIHJlYXNvbiBmb3IgdGhlIGNhbGxlciB0
byBjcmVhdGUgdGhlIHN1Yi1zbGljZSBvbiBpdHMgb3duDQo+IGFueW1vcmUsIGkuZS4gdGhlIGNv
cnJlY3QgdXNhZ2UgYmVjb21lcyB0aGUgInBhdGggb2YgbGVhc3QgcmVzaXN0YW5jZSIuDQoNCklz
IGhhdmluZyB0aGUgY2FsbGVyIGNyZWF0ZSB0aGUgc3Vic2xpY2Ugb24gaXRzIG93biBzdWNoIGEg
YmlnIGRlYWw/ICBHaXZlbiB0aGUgcmV0dXJuZWQgYHNpemVgLA0KdGhlIGNhbGxlciBhbHJlYWR5
IGhhcyBhbGwgdGhlIGluZm8gaXQgbmVlZHMuICBNb3N0IGxpa2VseSwgdGhlIGNhbGxlciB3aWxs
IHdhbnQgdG8gdmVyaWZ5DQpgc2l6ZWAgYW5kIHN0aWxsIHVzZSB0aGUgb3JpZ2luYWwgYnVmZmVy
Lg0KDQpUaGlzIGp1c3Qgc2VlbXMgbGlrZSBhbm90aGVyIG9uZSBvZiB0aG9zZSB0aGluZ3MgdGhh
dCBSdXN0IG1ha2UgdW5uZWNlc3NhcmlseSBjb21wbGljYXRlZC4NCg==
