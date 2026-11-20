Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200564;
	b=wYedpmH+zjLtVv+jJrGOWzVcW9RqmZ3lEnDNPdTTwXwDP1oZ88S4pG1xKLqA93Whw/0W
	 2upCC6hHwUVeo6Ghaq0iqN/Hcl+ooz0xY/OYy/ABkl+60k+nzvD8Nlbxtv/4+zvzG9dno
	 Exkx/fCXwN3+VHUR9m8/wc/1mjMSq0kk+t1k+zZTtODHVjL4ZvugO1t/gA1wKTOxCdupW
	 gPh3/JfKpbnqog3CPCOKDR/HL0tbx1w/Gb/PUIUNCF8xmWOyWnd6ctqmMoa84otHwsuho
	 90SmHID+Lfq9XlwyIrvt0d8k3jliUm/m82wjkrqlLfuVVh8mQ9g7EZt+/WW9kWFkfxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=u2kps6IArP2eG4oCwi0I4t+BLazI27NZvAQtlogve30=;
	b=t0PLV0ny5ci/QnaQtp3OjWzxf+00vPR5y92Eupztc2cI4irbZKajvIy0EgB/ckOJaMw7
	 wuL+IjvMvQX56qGqG8JoWd3UnzJqhe2o0ypT3tIFmKkXkZH01ZTSthJc8OjhjOUedKSHv
	 ZCuaO0XXxIE/uPvfy4l11mp8r6vzjrqQD/WC3BhyaEROR/m/5O4KJY8nzltAObWYpANKO
	 IdoyMrJUOxgG8JDZ4T/gEXoc/BMbB325oJJiJBetgps7SHCCwjaQJEzYwkas3GUe8wDA+
	 5ht0BTMqAVilEk3ndsECFj/j4m8wBKoU6Imf1Yn1nEAyil2+neWsrQzlkfRSAZez96g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rrHmES34;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC86606A33F
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 18:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC86606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rrHmES34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOoLeSn3eJa3wxYMr1Cap8qO/rWXrdorVL2tgjgKzugNEevGi57YYtSl9Y+kX0ByVX8iAH3h6AS4aK9SzViis3HLwwRTn7IctWedfdVFrJKA6+wDUR3VYQ6E23hLqkdhswigH4yRz5TnCanBAwYwtLJywL4/LykoO0cMhacXW7XtyxWa8ZZtXmlY1I0nBociAdsSx00t5KWg1tmMlrnWpN34Kb+aWzrcGUWpQsD7pBsrbOhqmBezQ0GGTqGPFryZ4rlEVcyHkCE/bXgL5NjS+iDCaC1ztg4jpFawypMMBJ9SrrvvTN/wha688Pisvkhkjk3iLs3BbU4GAYjP0wAOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2kps6IArP2eG4oCwi0I4t+BLazI27NZvAQtlogve30=;
 b=ej2wz1L8c8h/xpY/UKPfVYeu6FJCFOlhesmFNpUofkpIrohs9tkQOsDwdDeq9Yfsf/ua/dM7f/BNCTCsEzdKCAg1UK6JUp2olO6W4uzAhZSqstX/P/4S9pGgVZpF8iLIRiRWj3tyCsYhE+KV7exdA5J35fjwyWbmeUyTNQgPHKT1Rm0/8S6wKwgvvNKrmFuCRzURqvdMcpRQ7ZqSUphaUpFaCq/0MZF/SE/XW2Umb6OEC1K/hH8U2VRVlvH2qPiUQPZsKKAlQgmiv9GEyuJL0hRbk+NJp+N4DAEO15wa2j1ujRaABy+isUsirq2bWrpqGXvpJPRDnLrE9q2xBEJLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2kps6IArP2eG4oCwi0I4t+BLazI27NZvAQtlogve30=;
 b=rrHmES345QKEBHezT4REwxpPwq2OR1rzw3Ohoqa2i5h9epelFMxsffSYji3ICMtyvc83Wj06S1g2ExIp7aSVQxEZmq6pr/INAZZA4z7cNjXPVY6UwJTN5CB4xUC9gjGPl0KrY4yT1Rm3d/1vu5AQ9GNlIB7coe7xwBsk790JQE+HQ2/I3y0mSU7oxWHP5isLPxXUrqwMvB5G4muPn7u4oxxJloTnwQCbQfETAfr6MSweUy/qBDUuJVXAmj2GvDc7fG1Q6XuUyuQxvagjqnffv+0LAwawxZu+ahkYzxtKvN0wateNZagM9f5Iqf3lejuRbwG+BtdF5ygBT+6ILDKUBg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 18:49:20 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 18:49:20 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 2/7] gpu: nova-core: read GSP heap variables from TLV
Thread-Topic: [PATCH v2 2/7] gpu: nova-core: read GSP heap variables from TLV
Thread-Index: AQHddgRstt3xFaGKIEWnmHG4hDcz0rc2cp8AgADhC4A=
Date: Fri, 20 Nov 2026 18:49:20 +0000
Message-ID: <c5aae732efe84480a6c1639aea7c051cc81262f6.camel@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
	 <20261116195441.940595-3-ttabi@nvidia.com>
	 <DMZSCUUQ58NN.P7J7Q8GN3VKR@nvidia.com>
In-Reply-To: <DMZSCUUQ58NN.P7J7Q8GN3VKR@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|LV8PR12MB9232:EE_
x-ms-office365-filtering-correlation-id: bac4c801-be07-4f56-1687-08df4736fca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261021123027099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +nCrgUamM594xdVav+0BHD5blHbTM8qiUCOzghp/UkmY/UZD2IW4t5yUjOl9LOfKcn0Y8axNapvQ3fy5EbGcIBI1VOJtSei3g1BkVxpoUAajRyx/5z+eNAj1Bmh4bh4mLazFBvgGWfdf8Sf/iIITQ2nZwNAgMErN4GoxAwiFq0NIieTdcc1tCEsYWST1/ROL3BJUOZryP2/mPX24+w/sF5lQXVHacP7pvZzBdDfTrWRR5zARdV0i0woWk9h5kFGoFg2mLvHOEn/tXCGCMdfd8qbhm0EWFFzYqIONdVR4x3IYleIE7yTFl12M3ASIaxyRRXxzc4rpgRvRRC8xIcPxwlJGmR4aHzHs1BAG1C3aLjTFIPzPnyPFkTX8z19F9hKd+bkbcslL9wKUygKgg0f4vrFd70aS/ca/QKvSQOqUkcxpzORzOCfn4cFX5EVHRjnxwVwbC3/U2tSozDZ8dYsQnna1JW1zgaAsgpxHUqElZvJf+Ca//AYnGQRjiIQE4z5QigoVJ1jeng7yv8RyoTJ3+9M0N9dC1dpDRDblJvUMaxRl5fliSdI4nfe9HF3c45aiimOedFp/5Ta8tdYPfp+41OnjpE0czHYX+1ThqHwlsLsHS3WJlVW/D+nQAOdQUxn2fXAEpBy+hvQ44jGb+UVpxFUDX+yUAjv4H7zu77+F6DoJOYTbYQTnOGJXzs2A8ri3DTzvvN1JpyD7cnOFat4EBRcVEQxEONfS4iPPiFsoakU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0lyT3dKYmM0czBvL084TFhmdkwyVkg5eVNNYkZSWnBvQVZ4ekpRa0h3OEg3?=
 =?utf-8?B?aDAvc2M0eVJHN3NjalZqaUxSd3FRRnJxUUV3bzNtL3A2QWdIZjZ3M0c2WGhK?=
 =?utf-8?B?UmlNS0huendmQlNacTJvb0JoSWpidCtzdUNDQWdKS1MwOFRxRmE2Z2t3ZlRr?=
 =?utf-8?B?Vy9JN2tqbWZNdUVxaS9Dak51bGNXK1lXd2JnSDlXZHRpdDluRWhORnl1dUcr?=
 =?utf-8?B?K0dGYkdYVyt3UWJPK1picCtraEZiTEhtWXdwbDMyc1grUUFHc2l6UDY4czRh?=
 =?utf-8?B?WkU3N2pWbTU0TnVuYkJ6V3lkTVJVNDl4S3pGQWdTaFVWdlI4VXpMdXhjaWJu?=
 =?utf-8?B?bFJVdG5NYUc1eU5sT3FaWEJ2MGNwNlgveWxibkJBUk9FZWc5UTJRZUN4eWdX?=
 =?utf-8?B?UGpwK3pFZWM4MGZ6cHA4dktybHlBR0x2UXY2S1duVnhTTTZIMXB2OGo5eHYr?=
 =?utf-8?B?K1dYQW9iMjhSVEFzeVVRTWZBMkg4dmdmOEVSYlBvK3ZSUDRJeXFIZ1lsU1Zi?=
 =?utf-8?B?SWp5clZ6T0sxbHVDeWNXUU5YVlhIampvc21Ga0twS1A1U2IvZVVMZU1rbGNo?=
 =?utf-8?B?WVRTdVcvV2lzVkNPbDVJNnJPMWhXd08xN2h2aDE4S3RneEZ6RFAwNzZteGhB?=
 =?utf-8?B?N1R6b25IQ1V5ZDBtdlFqMDVFdHVPcU16UkNPRkdsb2FRZW5CVFIxTVJkRTVm?=
 =?utf-8?B?TzRzcWE3dm1nVHp2dU02STVjaFNtbjNlZzV0b3E4SE5Lc1c4K1BkU1BQWWt6?=
 =?utf-8?B?TUFTaWlVMU42V1hOdDNSYVN4Z04wTWsxaEdOeGowQ2ZndlJLZElwdXBUSkFU?=
 =?utf-8?B?Sk1ZRWE5U3pvWmlraC9BaldCc2lrZlpWMkZMeDV1UWwrSXdDWVpmRHRKczVs?=
 =?utf-8?B?MDFyQUFhaGRjLzRweE55clAvYlh2c3daRGNLMi96WU1VcjRlNE45V0E5RXQw?=
 =?utf-8?B?d3Q0aXQ3RkEvNC9TOHdia3E5cVMvOUxIUXhDSEQ1RGttYTJ2OHpwYjJPdllh?=
 =?utf-8?B?VzBFVlRncTJJcm5vUjVDV3FLczFNZ05Ed1k4OXN6b2RxdkkvMnJaRHIvTVph?=
 =?utf-8?B?c00ybWxONXAxWHRXUGlHNXBJMDlSc09TOURYa1BiRE8xa2JzVHlYL1RuK3hW?=
 =?utf-8?B?Tmp6QzcvZi9Rd3dPT0ZTZFVmU3NEeTdlQXp1bjIxam9NakhPMHZoTllwdER1?=
 =?utf-8?B?NFUwVS9PN0NUQkhGbVJsUGFnaVFmWFNlUUhWekMzUks5VnllTldhVHp3QWkx?=
 =?utf-8?B?Vy9RTUFReFk4VFUremgra2RoVC9Xc3UwNDluNlh4VVNlVWpDckVmMXUxNkg4?=
 =?utf-8?B?N0ZKRlNHWnI0NDBvYUNIam9URzl1OXliSVd5cDJzNzdMblo1Vy82eGxCc0FG?=
 =?utf-8?B?bFpacVV1eXFqTGs4b0lGNTVhMDlpR0NqVnBPeWxTTUFIaFU3QjRFdzB3UHMw?=
 =?utf-8?B?dThhTXlDWFh4OTl5cXljNmhNSEZycExXSkE2ZklqM25qaXl0cStXcXZmVGVJ?=
 =?utf-8?B?Z2hZRXUvTkZIamJnWmNDa1ZQNHBaek9uRU0zeVl6MlUvNVJCVkU0c0k5V2cw?=
 =?utf-8?B?THpYYkJIMXhQRUMyMGZyaUhZQ1dPNXltOWRuZEoxQStGNjhMdzhjcXFScW01?=
 =?utf-8?B?WEs4Yi9RcEF4MFhkeTFiTC9iY2xSVG94VmYwdHVwVmIxNVBCdjZwV05nelJW?=
 =?utf-8?B?WmpHMStMZkpOc203TytDZ1QrYkUxcVBLSWIzUnE0bnBBeHQxYlZ0Z2E2eFMr?=
 =?utf-8?B?dVVKMFVyaHNZdUNEaGVDMFBmVjFubEVPRDYrNjNic0FFbmdmNE91TmlpZUJI?=
 =?utf-8?B?ZW1TV1YyZ1hxV3UxYVh0NWxSUWpNRWE3Z0hqdFRRY0kvb2U3cFZHNStLQVNY?=
 =?utf-8?B?NjkwRlMwbG9XQzZYc2tIeG5QekZ5bW9hQWFidFBMTStJNlhRZDhsR01DOWEz?=
 =?utf-8?B?MkVHWldSd1IrVmJRQ3dxaEd1RjduQlhqUE80dmd3ZkkyUWhkTXI3QmJSRHBL?=
 =?utf-8?B?U1N4akM0aUZNT1ZSU2JMMnlWTlg2OUJWcHlhMldzQVl4ZXgvZ1NhcWFsNWFC?=
 =?utf-8?B?N1ZmN1FCbGlLeFZPdHVuYitsMk1CamZiVkUvZ1dQazAyclRneCtpWHZsSmRP?=
 =?utf-8?B?b1h0amxFeWVRQWRpQ3dwMDZKakJyd3VIQ3dwcjBlMC83RGFvZjBHUHIyOERt?=
 =?utf-8?B?dEVSeEpKUm5DVXVqSWhoNWVzVWVncVNYUXFsNXgwQzlsaG9DOFZXdFZaU1pZ?=
 =?utf-8?B?TGVJM2FqTnZ0bzl0Ui9ybi9VVjRIVUorR0lqQ2xHb1RHSDRiZUdMM2xUSXQv?=
 =?utf-8?B?NFpzeVhyTUdUQ1BEY2cyMGZHVEg1cnBSTG5YNEdnZVNXNW5NdVlkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6BB26146D9BB449BB2E5A7DEA0A5D1E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac4c801-be07-4f56-1687-08df4736fca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 18:49:20.1489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1il4ptPoU+4Oa7AwG/4INpC02uy7wFYLVlyIg78F2QfONLRg5rA/Cw09ERSjNf3tJlLTlmA+Jp0An59aJ2OgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE0OjIzICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gPiArICAgICNbZXhwZWN0KHVudXNlZCldDQo+ID4gKyAgICB0bHZfZ3NwX2Z3X2hlYXBfYmFz
ZV9zaXplOiB1NjQsDQo+ID4gKyAgICAjW2V4cGVjdCh1bnVzZWQpXQ0KPiA+ICsgICAgdGx2X2dz
cF9od19oZWFwX3NpemVfcGVyX2diOiB1NjQsDQo+ID4gKyAgICAjW2V4cGVjdCh1bnVzZWQpXQ0K
PiA+ICsgICAgdGx2X2dzcF9md19oZWFwX2Jhc2Vfc2l6ZV92Z3B1OiB1NjQsDQo+ID4gKyAgICAj
W2V4cGVjdCh1bnVzZWQpXQ0KPiA+ICsgICAgdGx2X2dzcF9md19oZWFwX3NpemVfcGVyX3ZtOiB1
NjQsDQo+ID4gKyAgICAjW2V4cGVjdCh1bnVzZWQpXQ0KPiA+ICsgICAgdGx2X3BtdV9yZXNlcnZl
ZF9zaXplOiB1MzIsDQo+ID4gKyAgICAjW2V4cGVjdCh1bnVzZWQpXQ0KPiA+ICsgICAgdGx2X25v
bl93cHJfaGVhcF9zaXplOiB1NjQsDQo+ID4gK30NCj4gDQo+IFNvcnJ5IGZvciB0aGUgcmV2aWV3
IGRlbGF5IQ0KPiANCj4gbml0OiBJJ20gbm90IHN1cmUgdGhlIHRsdl9nc3BfKiBwcmVmaXggaXMg
YWRkaW5nIG11Y2guIFdEWVQgYWJvdXQgbmFtZXMNCj4gbW9yZSBsaWtlOg0KPiB3cHIyX2hlYXBf
YmFzZV9zaXplDQo+IHdwcjJfaGVhcF9zaXplX3Blcl9naWINCj4gdmdwdV93cHIyX2hlYXBfYmFz
ZV9zaXplDQo+IHZncHVfd3ByMl9oZWFwX3NpemVfcGVyX3ZmDQo+IHBtdV9yZXNlcnZlZF9zaXpl
DQo+IG5vbl93cHJfaGVhcF9zaXplDQoNCldlbGwsIEkgd2FudGVkIHRvIGluZGljYXRlIHRoYXQg
dGhlc2UgYXJlIGRpcmVjdGx5IHRoZSBUTFYgdmFyaWFibGUgdmFsdWVzLCBub3Qgc29tZXRoaW5n
IHRoYXQNCndhcyBjYWxjdWxhdGVkIGFuZCBqdXN0IHN0b3JlZCBpbiBHc3BGd0hlYXBQYXJhbXMu
DQoNCk1heWJlIHdlIHdhbnQgdG8gcmVuYW1lIEdzcEZ3SGVhcFBhcmFtcyB0byBUbHZGd0hlYXBQ
YXJhbXMsIGJ1dCBJIGNhbid0IGd1YXJhbnRlZSB0aGF0IHdlIHdvbid0DQooaW4gdGhlIGZ1dHVy
ZSkgc3RvcmUgc29tZSBjYWxjdWxhdGVkIHZhbHVlcyBpbiBHc3BGd0hlYXBQYXJhbXMuDQoNCg==
