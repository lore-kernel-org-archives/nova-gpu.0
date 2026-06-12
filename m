Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FF2F1FE4
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279020; cv=fail; b=VAiagd2jv0fdfrFJW7zPl2sip4xe/AM6wz64QWtlpujQnqJ6mpCPTSwt4Frd+G4PrPMLOUHBFrexhWW3b9AtPyFLgjIDj/nzABKMMFSKXB28yxZDlU7DsNmiHi3OLznbAPWPNZlnkLOb03eErAb4KRh1uDSplYSHmzzmFcriBM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279020; c=relaxed/simple;
	bh=76p8Cd51X9+rBj10uvMXWYQG7YHP0+eB3swP8qYur0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JjpBxaGzx+C//R98wy5SqzDMLD6rO/5M89KOrOAjKeqHvjjx2nZKKctZ3Cry1moD8kwsWyxqGpDXOD8XTlRTcVwvA1u7amT91DxQ+EUV1gxew0bsmKlZ5zCdezTbcibmTk3KIik6EftHh7NZDDVw0uBEziS9kBSK554xxRYpGys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iDKP3vr9; arc=fail smtp.client-ip=40.107.200.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iDKP3vr9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDOUjoCFbY/NDtoHNioYuJCNUteVDUm28S6K5tXKlDmcZAdUSlTsdxVxweGR3yUhs9chT0otSxzb1QI/8AZmbnwbh/HJUHgFUsSxaNuAdrGM+XMJnwfvwXR0yjl3u7BTNTovkranXAGi+zc/BhZ6SIlIoBPYHgwj1oGngSVzv+zJstLuI3u3JQ6uy0yU0DE+/NwyGc0rSt+t2byJfgnz/rAGrphvmYV0D+0csCx/+FALHqP02f72QfwLFQkX9FPkTrTWJVO6Fxa2KLf+lcQe+OwafqDi0nknnbdwoR1qeYqtPOHVJv2B7BqO86H8bt+v8zWtXfGmmCRI2EHy+U0ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76p8Cd51X9+rBj10uvMXWYQG7YHP0+eB3swP8qYur0g=;
 b=o1PREucIo9SMEzop4y7CXUhgxliOo9v7ScuyDVl9fNud9aNEYHfBoZjXgjTztTYeERZC59tKSsKKxZfejVNij/DWmplnLGLmiP1y+91wRQVMtOyx64agfRLwex3XdehxEkC6Bn8getjoosLt37VyBkI8QcK/aQb6jLbWkO6PNPoyweG8W3kIMh9LaqHJelYN0Z0LJpOHZfsdx1pN6Rof0fEyr1zufe84BpjVG0SsSKntlywPn5/E8pDzwgGWsFZ6UF65pNCru0YrxPC6foRLjlA9wG/qwSkmkZfOw5KeCnir1i5IS3H2F3tQ2sF92U6OieUHpwjpFoFOqqRQO3X3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76p8Cd51X9+rBj10uvMXWYQG7YHP0+eB3swP8qYur0g=;
 b=iDKP3vr93STbkolhn3OqmnSe/ipCmNEV/NHImFdr//wl+5Td40e185022lEMnVfL3ZYmbJdNkEisyT9kr6rBMn5Y4loQd8jzn+T2fRa1J0lBL8pQvnTnnzrKZPM1WAGmCNRpYULQGVQJuZoo6ihXwjMh4UB9MOkXxh/kNFfjk4Zi0N6sDgsQb9J/Py/54rFudS51k+C5gDnC9/sDkc7VAbl40YcpWsfNYKj0/buDXs1gmjNlK2oATFwNeADEHIhPjN/ugtXj68FOKGCLvoPoBimwDx4B0UvAEHAIgYZeWk0ruHkXMjLokq4g/mlyGYxj9vGQ70GEe+1s2bSw19ATiA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by BN7PPFEE0F400A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 15:43:34 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 15:43:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, John Hubbard
	<jhubbard@nvidia.com>
CC: Shashank Sharma <shashanks@nvidia.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
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
Thread-Index: AQHc+iCQTqnYSszeFEy8vwxH7+fwF7Y606aAgAA8i4A=
Date: Fri, 12 Jun 2026 15:43:34 +0000
Message-ID: <30e7305062676b72b7400a7e2cf48ff8e78139d4.camel@nvidia.com>
References: <20260612040420.121499-1-jhubbard@nvidia.com>
	 <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
In-Reply-To: <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|BN7PPFEE0F400A9:EE_
x-ms-office365-filtering-correlation-id: bf9a4607-ef04-490f-5275-08dec8995cc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|7416014|376014|38070700021|18002099003|22082099003|4143699003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 hvXzEhDEitMSIXSnaBCWQhAKXvimX6ijaAIQG+OHwZf5SqyOC+BfYOcbTj4cTI05EpcedUcAPnABs+AD2lJKsPhV4jx/5/OOXtk4q7AyWNz3jZQWI9MmGXorEIzgtx03fbn0kNNb3QD6C3XtdLdwoJ+adCcejAIzELYamGTmmA9RCRPCNIDrx4yCkckt7Tn3f3+2C9xN7+9S/R6a21aKhL30zxeqyQe4/voy+CX47kP/ubXQ+SMyOOlANBcYP3v1R/drmiIq+0HSHXR64GkovS8Xt2T2mWzP6HSgOUR75m/BJE9dssQOj2qIwsBJf3GLEMgllWcSuStTDfCTY+Z/LA94/yf9q9316ec6EwSl5C436aGReNZutEf/kt1EzKlJnwO86vIZ6t3DnSqAUFFYkWCxPk6WH5bgVLXThtckL4OxlXZN3pk0YaF1BCr4M0K71BN8FY+Ry1KRhwLUjMM6czcvdNFLBUMuNxYERX2OYvkJfmUWpqdjl0ct6RA2X37q8Qi47JtFXH8fHBzs5+lEzlFlML0CymtzhB3Pq2gzzox5LI/AHuosL+InMSRpFq7EAYIxNUMHT4oY4OKQgyKcvzOdlP1YGqrd6FF1BCi8x5kjrXDJ6R4jOXX7j39+s+mB4brfA5ScTqe+OIzmOoT/3Yd2C2PIgJKY410XkxHqS/43KuVEMUGLSF24YO/XKSociDrTd5HAujFDNyqtwhYBD0lTFSt7Z73JbrALMPOi4//T/UG7AQIJg9x4JjCk3tkd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SThHWWdia0FhUGNZZGduNHo3SHJZT1Q4SEwwMDh3VnNrTFkzbE52TXRLZEJD?=
 =?utf-8?B?ejRkbU9zemhTWjJQemc0YmlkNkNRM1Vwb0F1dnZpbDBZamIzRXlrRC9VQzIr?=
 =?utf-8?B?bkRHOCt5Q09SeVYwSTV6M3BQNjFEVWJIamZFOE1yc1JtWEpkTWxGdHBLTU90?=
 =?utf-8?B?TVdSdzFmbXN6U25FaEl0bHgydytFR1hNSk1VVGhNR1R5UDFsU1B3d2tKVG5l?=
 =?utf-8?B?UUthbDhtTlVEVmJPRlRETVRlc3lNVWFMSVlsWTFrYmtqTGovU21RSXJrTVJH?=
 =?utf-8?B?UFAva2kzb0tUZGVwejNaQzhYK05odENEVHFlMWRmRlNFaWxnRkdjT2RabWxz?=
 =?utf-8?B?QjcwUEJ3YVhyTHFUN0ZvNm9vMjc4MEhYVDJkUXc0Z2tUQ21Xc0N6Vkgyamtr?=
 =?utf-8?B?dnExZ2krSXlpNjZqZ1VHaFBEQTFyVW9xemVmMXpTZEY1WHY5SXMxRENrYnNm?=
 =?utf-8?B?eXJKNlBLd0FPc09QdzliVjZDeEVSTmpFcTFGaFkvaklESHZiNVU1RjlCV3JM?=
 =?utf-8?B?ZE95Y3UzNkNGWVdHRlpZUGcvU1A5U0cweFN3UDlHQmVPVVR0bHE2TWwrcU84?=
 =?utf-8?B?ZjNwMFY2cmxlcm45eFZjZEhmYmhvZlVZSlNsankrbkY3ek1MZnF6cUxoSXpp?=
 =?utf-8?B?RXRtVkhNa1Fpb1lvY3JoNWlKUExtUzR1dFY4dkIrc3graE9rMXdKdnozR0sy?=
 =?utf-8?B?d0J5VGZLdmhIYjZKYzVxVXlxZVZpbUpXTEdwYnptbjBEdno2RXhIQUpicEdk?=
 =?utf-8?B?anZmem9LQmY0cHhHakhibmJyQkx2M3owNHFqVEZoUVNVdjVYay9lMm9IeUlK?=
 =?utf-8?B?T3NleFJmakRBUHpJWFJkalczdGtndjF3ako3U2hSdEM4cGs1VkdBR1lqWmh6?=
 =?utf-8?B?SUVpa2gwbmc4ekNZNWgwcmR2R1NsUDJSeFVwQUxsOS81NVhUZ1B5QjVjTnE1?=
 =?utf-8?B?bjE3M2I3Si9KL3ZMNmVna3pPSTNFamcwZ0VXc1hWWnFlU3p5TmducjdScjhw?=
 =?utf-8?B?UUxVc0JjQ1VhSHFjVG9tQTBsRWtPU3RvY0JINStveWlmZi9LdXVsRVBXcG5E?=
 =?utf-8?B?K01CbENxdzFSYWFRYlJMeXFoRmtxcnRqSWJva203QXE0UW5RbHJsVG5vRFR1?=
 =?utf-8?B?MlA0dmV4ZFlOK3ZobytMMDdydVBXR2FuL2lGWW16QlQwcTVUQUhBZW9QcGFx?=
 =?utf-8?B?RVAwTVlxWmlaZmUvendyM0RJY2dLNDNUYnZvMlNoUzhOTDNGeDZVVjI5a3l0?=
 =?utf-8?B?YjY5VFVZdTZNRkhJa0t0dndHblNseitoTHliUlEzYjFrdUpJcGc3QUFRdVgx?=
 =?utf-8?B?dTl1UkdBcVg5ZXVjY092SFpsaFJuTWdmeThhQjd1UGgvUHgycXdreURSV2hY?=
 =?utf-8?B?THUwdHdzbHhYd2l1MU52WjdpVW16SlYwVlpBdlgvWU5ZY1B3RVFabTZ1M0lP?=
 =?utf-8?B?dWZvV2hwdVkvWVRQQWNpY2R2YlRBNTYrS0hud3NvRk9RSHUvcCtnNExIeWZD?=
 =?utf-8?B?c3B1MWhvb0t6RnhramVxSmNrNEhGdEorbFVtRDcyd3BpM3hsTm01NUU2c09l?=
 =?utf-8?B?bFpzNmJUc2RHOEkwZThtOVhSdFJFckMzWDFQUmFHclRoZWxoNEhDRmVhRGNi?=
 =?utf-8?B?YnIyeS84MlBIVXBTTFlYRFFpNFc5RnBVM0UvREczWWdtRkhVaDF3RFRWTjJK?=
 =?utf-8?B?QUhESG02S0NsQy9KR3F3R2p5TjAzTVRjc2l0VnF6UW81dDBCdzZJaFZweXFZ?=
 =?utf-8?B?ZmFNVFRTMTJGbHRVOGFsQ0hHQ3pJZmRieEFYMWZJS0xuQ0JFYkhiNUprbzg1?=
 =?utf-8?B?U2tHeWljaWFXTW9Eem5ONzRINzYvTkZLakl0NytSRys0WTlxWllEdHVMT293?=
 =?utf-8?B?RVVrMFRCSVVIR1hRcmFkQmpiWWxwU0hsbHc1ZlpKNysrZURLSFJpWEZtQUpq?=
 =?utf-8?B?UFNZZzMwdW1GL21yL0t2ZUNqUlZvdWo2eEEwbzBLMEw2OVg0MFkyWFN6Tm03?=
 =?utf-8?B?bzlrdVBuVG5aclFoZUpTV05KYW5Dd0FPWXZLOWdtWDlGZitUUTczakpLMjJl?=
 =?utf-8?B?VXJmSkpJV3NmT0h3OGdqVURWSGF5eWQvNERjUlJ3amxMbFRhc0hxdVBsdVRX?=
 =?utf-8?B?VXpsZ2tCcHpDaXRINU5sb2dYOFZCMW0vTDRrUlpZZ3FoVHFMUDdWN1Iwd21Z?=
 =?utf-8?B?VVVkd00xL3RVZ3ZMZit6WUI0OUFzTjk3ZzZvL1VsNnRxa0E1VnhSeXRXSlA4?=
 =?utf-8?B?eWM3MFpQYTVxZlJMZlBKb0w3R2VpVllxTEV6RlFqQWVNTE9teWp5ZER5eURS?=
 =?utf-8?B?a3VDMm9ndW9jaGpyUXpGNlVOc2JLS0NVRWVUdU90c0hiQ1FOYlByMmRrb09J?=
 =?utf-8?Q?AlOjASErNDsny2Ud+apunmqcpNNLPJS+v9SURMpzSKhbX?=
x-ms-exchange-antispam-messagedata-1: IpE8k0+IcNdcxA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <34ED533935E29749AFEBE8F39D8AF055@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9a4607-ef04-490f-5275-08dec8995cc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:43:34.4839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSWJySYgznNl4EJ9cTg4kWFM6juCh6S1CvYF75s/MsTPRzug+4gyRnzsQ58DivCnkfjtFKJuAS0vscLmiXN/dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFEE0F400A9

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDEzOjA2ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gVGhp
cyB3b3VsZCBiZSBpbmNvbnNpc3RlbnQgd2l0aCB0aGUgZGVyaXZlZCBgUGFydGlhbE9yZGAgaW1w
bGVtZW50YXRpb24/DQo+IA0KPiBJZiB3ZSBjb25zaWRlciBIb3BwZXIgdG8gYmUgYWZ0ZXIgQWRh
LCB0aGVuIHdlIHNob3VsZCBiZSBhYmxlIHRvIGBhc3NlcnQhKEdIMTAwID4gQUQxMDIpO2ANCg0K
VGhpcyBpcyBhIGNvbW1lbnQgYWJvdXQgaG93IHdlIGRlc2NyaWJlIHRoaW5ncywgbm90IGhvdyB0
aGUgY29kZSB3b3Jrcy4gIEl0J3MgYmVjYXVzZSB3ZQ0KZnJlcXVlbnRseSBzYXkgIkhvcHBlciBv
ciBsYXRlciIgdG8gZGVzY3JpYmUgb3VyIEdQVXMnIGNhcGFiaWxpdGllcy4gIA0K
