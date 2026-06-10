Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE63546FE
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123339; cv=fail; b=R/fTKffWb036OnHONFT0UlUWiVdoZZ2X0JIdHZx6dKpWN6QrGD7O+CqrRRzy/G0nNWKbdPZSXAoT+hrzYmBH4UyE3WMgn0FZ3JOEcW4sKuwQvQd6NQDU/9pm/MuXb5d84b3lcUdJQ/iEUOe5e0RzH5PBH5EYLZnvFceiJY5ejvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123339; c=relaxed/simple;
	bh=06Psmo5aY8V6wQhar6tdIXfViSDnkdZrA0NQfuTPZzo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mcc2nTHGnrhKV6BvRiCcGd7/d3HE2nUWYwMaa/MNyySCes3GFl2GcbQYTQvEds+b6t3U4VzIW5QIBRA5k6H2QGHjNeaVW4408FIfdzaKerdQ0cXMAEr7IleJ/ZHYx0OCz3ahnpjHpd+4wjsNEaWZlRy+7Srg5ABkTeH0gwXUqBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ax8goZ0k; arc=fail smtp.client-ip=52.101.61.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ax8goZ0k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/I6bSbgfA5PnOY8WmJL8lngwkQg9uy+NANt7PwiTfpDk74p4ASHc3OPCHQ97O43jB0OVJxJl2XWS00bCCJFJJKz1th07XZgz+UUBdBCIT1BQAjEUW4kb5n9/VFWUl7W76tRQQlzTbB3NlZ4HIfsKEQQvc0CtY8qFojNNnYuLYNGMoxqExDuPTeHbHkl6omYMx8tnmf1JM1tTtJI0RlG7h0iAotohou7MX6SoHCR8k4FhzKG8DqkroQG1Voolq035TRaup3WPPYmbun4Sx0yo9xhecdwzrl+vBHTgTZxrzeOTXaNqCgPFdqhfOiKuBd73AvIBP5jGSAjkNilFdh/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06Psmo5aY8V6wQhar6tdIXfViSDnkdZrA0NQfuTPZzo=;
 b=nRHxrfdD1A/KIbkQnO8FLvQ780jgsmOBptD2Wr01cyDrAKAHtWeJf6M2i5C67RIt108SAmMYiltFu6pFe9vYb+XbE+7zxuKgSmw0IhfjFVB3yop9Xk5KisJc6NRQ4nDG0co/ZFv5X3w6w51+46tdldqFSkStGZfQZbS+3mPcx6OCot0M3fXrkc1CsYng0cwWoyQtWTIaPief4xxt+ucdZqoP8GFcuBtQW177zrnC4C5734lMgwGziDq6lp+uRzfSEnPKtICi0yylou1e9Jk8uCfrfNOSlwzjXDvCX/QFz1p34BISgjZZgvG3mOsdt2elQsqdMaR3dXuaSpKCzcxwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06Psmo5aY8V6wQhar6tdIXfViSDnkdZrA0NQfuTPZzo=;
 b=ax8goZ0k08bA7G9MR+n1Ne3e07OyhT7vbvLViDmfMBnq65yKInWtr7qo297aV1z/OXFNpqHNUEQbW8La7OtOYGbN61iB5fuig6/gTpw7k4FTp0tc2TQSM30zMZVMV6TorCibuNqSzoape2Q1h1zf9OdI++lD3hu6TrfyvV08hYp1QCQLqBPoclnAEiGas8W/C3iQzGzdHj+CKdSjIvwli0pIRHPQQOeKF7wFTl4Ra2H0AFKuFPjwwUE9ppMNtj6Bif5/98/gCbtM+TZdVCVT+KGuz99aFdtoJ89ejMyNieN4vZUF/7k1tPuLD6wedQ+ycxWjUxcxwC9KuBnQgGJDjQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 20:28:53 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 20:28:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index: AQHc+QGZGJRxryX2J0aNJYdBUK6JarY4FNCAgAAF+ICAACIrAIAAAIoA
Date: Wed, 10 Jun 2026 20:28:53 +0000
Message-ID: <dea5858c3833817c3b7af010634da5476548f299.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
	 <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
	 <DJ5NHI02AF3B.WOW85000DWA6@garyguo.net>
In-Reply-To: <DJ5NHI02AF3B.WOW85000DWA6@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA1PR12MB8948:EE_
x-ms-office365-filtering-correlation-id: 2a52932c-f029-4637-0e31-08dec72ee399
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|18002099003|11063799006|22082099003|38070700021;
x-microsoft-antispam-message-info:
 034mS8sBXZHYo2AoVg7AclkXihmX/ySU9fk0mqs3gtVIdPyHZPOQCauEKC/YZ/Lsj9/0R1SuMNQVSkkTckDO+QN+RHW1gETsZYqy8KOiZ5PoEd79KxKDaF3bGpAiHaTue7HXK7Oe4gnhp6F+VkCmUsyaXdTqOvhUgNizvgOjBvtY+/Ec08r+qQ6IcblCj4wdUDN/5AgIX94yvzKvnQnJ8bhTlP862NTfY8ytD/IviBhv1IwqwMNaPWPvyKMMNBarz4XP2B8Y1cxk3cH9m9ClNiUm/1cM1kUrAXdQsCnATIagZsAqooDY9n/x5RTga+7yeMORSiC5RYel9A0e9hpV7ytX7MKU5Jjzyjc+xKxDoU9M5x2JZfac6RE/UksLwNM8sI5q/32tMqPO9Uc8biPdj6nwVbgxAZTieHUap6vzpItirtjKeq0lCVHeml6vLgpI01id/HAs612/YEyfbVjzh71LlROMwcmmn3erHUmr2VzDAogpytzWAQGcQC1epJEDk1ySSHbNAMwMLvwhK5JHXqvjyUVX+/fzp/x2jFdcs58gAHveFxBgO1QT/fbV0Bzmr/j7KHviquw3qMLNDR1PrwVPV3xx9pxA8uahE1Cb4gPjRWmtk+BYxanPRLqlg2Vl5C876BS60sKMGzlwRyXR/StF2gMUhyVBm6eFe5h7Z3MY/yhgyudKnTW3UnwKR0dWNXZQQEubv4iKqXsu5R4aa+SZH+VY4HlbsOm0ujTO+x2bp9XA7b6nwKuEfxAZ2Xhz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlZBcUpycnNadXk3ODFrTzVVd3FVZEdLbzR2bVVWSE5nQ1NzVHJpUlRXMno5?=
 =?utf-8?B?d1o5YjluNUY3S2hRUHg1cHF3VVFKSTZiTityeERwclZmVHljaU1ONEpTWUFD?=
 =?utf-8?B?K2MzQ21JYkVFUXVTUU9IekRKUlc1L2dSMjNMRlM3d1g2V3NIdU1UQnlMcjZN?=
 =?utf-8?B?K28ySC9FUXp4alE4d293ZkVVQUl1TFdtTU1RZ3AweHhscGVKTkFsTlR4NGRu?=
 =?utf-8?B?NldxVE5LdzVvcXNjYjZpNHZwNmRiYko4dTVBSnZBbXMzRjVwUjFnaUVwSmVL?=
 =?utf-8?B?Ujh1RzVGdkc3K3V4WWtIMEVETS9MVThwODRXY0srT2RLd1kyVXhGR0M3U3pQ?=
 =?utf-8?B?Y3dRQmhpWjl1ZmZ2d1ZMbE1HVVc3TTZOMHlzc1FiZ2wva3A2dnZjMjVpQUpW?=
 =?utf-8?B?UURkVVZVaHpodytsbkRWelFRQWNTMGw3K3BiZFdxSlZVVFZXUXB5b3FDTG9h?=
 =?utf-8?B?a1o4VHRqeXQxTHpmSkJIY1NRMWw3SmNoMWxuTlh6cVBKTHd4Zjl0Tmk2UjVa?=
 =?utf-8?B?L0FEN2pjRnNJV0ZROWJNQjAzQll3bmdSYzloVWc4MXFuUjVnaDh2b2dUMkpW?=
 =?utf-8?B?dStCdElYWVowV3gwUXljcURDblN1VUU4OUd1U3FGdTRYTU1ubkw5NkI0dTNo?=
 =?utf-8?B?TGtxNFRyQXQ2Rkd5YkNjN3dlTlk5enF4MWR4OS9GZjZqS0oxdGNQKzJHRnUv?=
 =?utf-8?B?dWltb0JHWnNtWGFYVS9ncVZ3OTZLVk5EbndYTExzZ3Uwa1NEcUlrRGxhSDNj?=
 =?utf-8?B?TmxtMkZXdFlVT0dSczVlZHFYb0s2RGlmTFRySWpxTFhYdm8xV1VuVXNoRkMy?=
 =?utf-8?B?ZzZIeDFyRUVtdEUxWWtPZXIyTG9BRERQdDdqRHdjY2ZjcHByaDFaL1VSTVJ3?=
 =?utf-8?B?MlhZRHU5Q05uSTlBajNLZU9WVTk0K0lGZVAvRDQwaEkyaEJ4ZjkzK29CZ0tW?=
 =?utf-8?B?ekFvVTMxTWo0WlpiUnVwcXVRL3BOWkJLcGtHV1NQMWF3ZllXNkEvbFM1TGJS?=
 =?utf-8?B?OGdRRm83SVZSU3h2NlVoV0xZVlRXOGlxS0xRN1k1TnlvTmp3ellOUWsrSkg1?=
 =?utf-8?B?TXg1OVkxVVZpT1ZXV3pIZ1A2U0xkUFhDQjZOZUczTy9YM2NFVTJrc05GNElN?=
 =?utf-8?B?UUZTcWJPMEloYnFyd1Nvb1VYbVduTEcyOTh2WnZ3WjhFdzIzcUlUQmJxc3gw?=
 =?utf-8?B?Q2dNalJMd0FuZzZZaG5BaXV3U281OHdPdXlqM05BSXh5SnVYYlY0TWlaN1Z5?=
 =?utf-8?B?WEFVRXlqVDFsWkdGNkNSUVNPaFdLTmRnM1hmUVFSaTNpOCtuNVpVakIvcEli?=
 =?utf-8?B?Nnp5OERjVWU5OUZvS0krWGZWeTFiQ3BQREpNbnJvaHNYZHUvODhCdHIrOGNV?=
 =?utf-8?B?aVMrZjA3bkFXaDVvbForYWRpbE50ZGYrRE1LVWJCWFc3bDVlR1k5STRRcHpV?=
 =?utf-8?B?R0dsTnh3WjVFN0VTY293UVZvT05hdXZXSC9HRks4djlHUkQ2d2xrWEN4K21K?=
 =?utf-8?B?Qnd3L3lOODV2WGZwaHVpWDlKZUpGUmlBMnpJUzN3Y2laRVV5UzM2ZUNnM0hG?=
 =?utf-8?B?aS9EMFRONHR2RHdTQi9YTTNGdndFZlJqWm5yc2F4Mzk0RVlqYXdqVWtadHBQ?=
 =?utf-8?B?bWdqODBteWYrSHUzQlNEb29jYk8veUNHejV5ZGlLc1d6cS93SU9zT1dNSEww?=
 =?utf-8?B?NUp2bWNaZzFpaXlkaXZJMDlYSjVNWjB3Z0RYR1FzUGZQSDBTK0RuQ0VnaDF0?=
 =?utf-8?B?K2E5VlJnNitEUko1NVBHRXUyYnovQ29rbVpobDlUV21GVUU5TkJFL09MRDFB?=
 =?utf-8?B?QXNnd09JRnVNdXpGdjlScnpLMzZ2S21qNU0wbzVHeFkvWm1HQTVwaTBhZjJv?=
 =?utf-8?B?MDA3anN5alhVQjZocWxhQkljQTZrZHRPdUYzNnFMSk1UWU1WbUFlN3RWMEtn?=
 =?utf-8?B?eVRUVk15aXRGNUNJR3laOHVkT1hiTXVKZjdYNFdYZmtGK0tqdDJQd3ZtWDBR?=
 =?utf-8?B?eEN3S1c2eHYxaFVIc29wSVpsVndQSEpoME5ucDJiNVFPdUJXUTBON3N1SXNP?=
 =?utf-8?B?K3c2NUlqOUtvbzB0U3dKSUdWemp3UkoyYjA1UmZSTlBJOUpPWjdMek56Z2Zp?=
 =?utf-8?B?TDI1NTY3azZyZ1FEbTBqVXRiZDB4cDc2cjN6bjNaa1NrYVVBa3hCUjYxQzFY?=
 =?utf-8?B?RDVXWHVkNm90OGpKc0ovakFiS3AvVFZ0b2NIa1VRZTNXTUlIc1VmZjBXeGtx?=
 =?utf-8?B?OXhsckRqR1ZGcVZOOW9wUlVqK0RPbndVcnNEYXpKZTdJNit1TWZCdkpQN1Zt?=
 =?utf-8?B?RmI3RkNDcDlzc25VeXVYVTRnc0lucWF4d2cxREZLZ1crS3FRSDV4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <878801A104A02044834AE6DEFC2D3043@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a52932c-f029-4637-0e31-08dec72ee399
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 20:28:53.3439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGg9RB/gcIVwy/LAU90PM5Y7pJEUo8BV3A12QTUJAZ4H+CMnRtLIykETl1qelzKaFmcnhFOoWqf3M9ghkAy3uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDIxOjI2ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCg0KPiA+
IFdoeSB3b3VsZCBpdCBwYW5pYyBpZiB0aGUgYnVmZmVyIGlzIGxhcmdlciB0aGFuIHRoZSBzaXpl
IG9mIHRoZSBmaWxlPyAgVGhlIGtlcm5lbCBBUEkgcmVxdWlyZXMNCj4geW91DQo+ID4gdG8ga25v
dyB0aGUgc2l6ZSBvZiB0aGUgZmlsZSBiZWZvcmUgdXNpbmcgcmVxdWVzdF9maXJtd2FyZV9pbnRv
X2J1ZigpLiBJZiB0aGUgZmlsZSBvbiBkaXNrIGlzDQo+IGxhcmdlcg0KPiA+IHRoYW4gdGhlIGJ1
ZmZlciwgdGhlIGtlcm5lbCByZXR1cm5zIC1FRkJJRy4gIElmIHRoZSBmaWxlIG9uIHRoaXMgaXMg
c21hbGxlciwgdGhlbiBpdCBpcyBsb2FkZXINCj4gPiBjb21wbGV0ZWx5IGFuZCB0aGUgcmV0dXJu
ZWQgUmVzdWx0PHVzaXplPiBpcyB0aGUgbnVtYmVyIG9mIGJ5dGVzIGFjdHVhbGx5IGxvYWRlZCBm
cm9tIGRpc2suDQo+IA0KPiBSaWdodCwgdGhpcyBpcyBub3QgdGhlIHBhcnRpYWwgdmVyc2lvbiBv
ZiB0aGUgQVBJLCBzbyB0aGlzIHdvdWxkIGluZGVlZCBub3QNCj4gaGFwcGVuLg0KDQpTbyB5b3Ug
ZG9uJ3Qgd2FudCBtZSB0byBzd2l0Y2ggdG8gcmVxdWVzdF9wYXJ0aWFsX2Zpcm13YXJlX2ludG9f
YnVmPw0KDQo+IEJUVywgdGhpcyB0aHJlYWQgc2hvdWxkIGhhdmUgYmVlbiBjYydlZCB0byB0aGUg
UmZMIGxpc3QsIGFzIHRoZSBhYnN0cmFjdGlvbiBpcw0KPiBjaGFuZ2VkLg0KDQpPb3BzLiAgSSB3
aWxsIGRvIHRoYXQgd2l0aCB2Mi4NCg==
