Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794365967;
	b=cT+XoN3B28sssj2ERnT0aWflWkLkjAcaeKBPPvtgejYK7h8CO+wP4KN3dBSMLO/mD+pr
	 cXALna+0+2Ev0wBcNs0fREFwDscqgL3aEJihdLtrakge4RGbzmnOpqHAVXQA60al4kYvQ
	 8HSo2rY4lZEZkaCIqSBRbJJi0tkRAuA56Is/s5dmATt9G0GNRMWPDksmjlApqdXMAaop8
	 eLYgTJPOEUA5Q3uiCvywSDlpr8/IjaKtfzjYniyf3TFtFHvjR6Pqr045c4LNlJswfsth/
	 P3MqvBducH5iSEiliNeJGWF/FHGGwlKabFR1I+iCU4/iRxTgS7Go/YvE4Xdlp7MKSQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365967;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Nn958gZlcZBXi7+SoF7+7ppErQ8wjmZ01I79ONZhDlA=;
	b=C0YZ8dCX530aXBP06/rd3jfhkixKVIpVF6LHy7wiJgBJ2eQ8veQM2PIp4ghd135RsQoC
	 bv71a4LP10QbPjSdE7nV0LhNN0UCmxDaHeYiHepM19IZ9K/ER1HQMDD5nxQAbcmz7XGW4
	 3/L3++44Z/j9p/aimMJ9NRkBqzJZyhN+R8pTuq21fwiAsw+JR2dB2eG3HUP5fsB3yxvaI
	 snxgt/s+VQejjzNCDJ8J/Faq0Hnttpf3sPud6tkePtmYoVCnKFsG24sOAoEwmKI0fdQII
	 klWdfsoJ2yYElYSPCWkdAYhkpeo+Z/rsZzVqXDdMGWrOFHp4PXIJA21HgWET9XwNB7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EhOxQvB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.24
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB81606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 02:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EhOxQvB2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDR1Nkcsg61NVU/P/LtTgei6ke1dAVEhuAAD8Q8teE8WwYFlU4uyEvbJ4GyXEEvvtZRPS0GPgsHC/Jri+Td+0Ia3wX2rsVvuaFTXNfRfvTFq75WTaVOhns5sU0btsbkfX67Gk++NG1YYLlhKm8Ybu1zKWV13Ph/i9IgPc1uQ2++Bl99nfdJFsWwmQa+TbSylYForRicpiRZtsbl5gF4TZxrOVplkAbnzU1P3uyzrW/TWk401xHEBszk7asNFKczgZic1Y+MbldpDQy8VWu2fubSDsajKbGYI9rz67Sk1jRGDpGHl4vsAl/Wl4J3gshW2J1i0cMijWxNmss9fXcfR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn958gZlcZBXi7+SoF7+7ppErQ8wjmZ01I79ONZhDlA=;
 b=R5BwYe/csAuL1rN8n5hW+HzPj5nMjOrvK4rHwblioVAYA+ceH5xcml33Q3UNcuSkW1ql4sXwy3RhuqhrXnhbO5Z2jYc2qtNUUMbe8Xih84hObfbymrEDEFWt1oY4vJvtS6eY831H0wk4VviVZJGGQdSXRdgonR7mZx6EmSm5/cJ3NIIcTBmCz00GiAtLYINnlxnhHct83ZgsXjPZA6qga0h9OQ0Ye1QdvTwFczu0E0klXWtC5DUDsayvm6ca5O/EJtabCNiREf+1BIfOOUscIkqSb+drXX4VNb82/1Gm3FUeIAqvz5ZKD13gi2ZHyAghWj6ajo58MMn3TX1Tm4xyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn958gZlcZBXi7+SoF7+7ppErQ8wjmZ01I79ONZhDlA=;
 b=EhOxQvB2j2tfXfWB6dYvWEKXZehIuTJh0p4jrjGbn6BZBPB0yPq8ALKTXd6DMnJxyojewRH2KmWumiBvt9vBMS6LLA8OCjuauy8LwJgl19uRvBWcVMoIsQBPkosL4EyjGrZBqU4yOJWliyREvGFmWvv3TBnzODNz97K7jrsQe4QJAMdeLy9CYGZfbSA8iDfMmCNcrZ5WahzE7jxhwqJaQxMQ+uPbnuhCLy/ZeLbGNdpFGU0Urp3gCfdPoyKt4q9ozXAvCwc9sE5mTEW83+Pr+UOnT3QTLmOCP/XGMZz7Cp8XQByee+5JscCTWplZfQfQJz2h6V45pt/dTITahFKrJA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 02:59:21 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:59:21 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
Thread-Topic: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
Thread-Index: AQHdcWjOiyP9OpEkbE+wndp3G5qPlLcoAhqAgAAsXwA=
Date: Wed, 11 Nov 2026 02:59:21 +0000
Message-ID: <8f6caca82e82f457a24984503ef8fe896e0afa32.camel@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
	 <20261110231053.1352163-2-ttabi@nvidia.com>
	 <199d4ffe-780d-416d-9946-f21ef18678eb@nvidia.com>
In-Reply-To: <199d4ffe-780d-416d-9946-f21ef18678eb@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB6714:EE_
x-ms-office365-filtering-correlation-id: f745a33b-c121-41e3-532f-08df3f9fc8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|1800799024|22082099003|18002099003|11063799006|56012099006|261102123227099003|261009223027099003|261026121527099003|261021121427099003|261022105027099003|10067099003|261028144727099003|4143699003|38070700021|261026140227099003;
x-microsoft-antispam-message-info:
 ehEauP3XGJREAFZtd/AJmoW+Xux/XhA1LY0OcMBHIEDISfAqFN78RQ3gzKxUlWw8Wrbjzhn5wn/+559ViW39fxH6fq+XMCCFc1++ITPAWVSZclyeaLuAQ7MvnpvOc4CIorNbTo72OvmiypGyHP6OFQaWv3tr2hSgDCp79oT4qyLOaZtxqV0PPaeF4dpJ++ukzzlAm3CxJubt71sbFCzhRjTWEAJbtc7LXERKk5uHKZHsjGKbhOYO9D8BLKwx2Rn1tFDeRYm6svBqBpgKSi6x9NPtyZacXtT1HI7eo28XiRGdGdOLzhWJEb2ziHJEmpRX2S6/HAKX3TyrjFUsECZxIoqpq0Qz4HS+ozgLbdpy+kHsPBJrxs6pXTlkreRN+XGCD6hzKKGBu7c3OejhyoA9m2M7evVGNmjiC1HalV7F+HBVpwdYx6cw1SzxvGwent6LWyJ4QXqTzv1sNNjijV876TBIyhWMH/gdhXqRzME7PzgTNqqC85h7hin9rDLFbxI2yyQIVy1Y0Qu+LFeklfpbZJGSKp4BDXdRKunIOAtaVZt/YNh0Lwjc7B9Fgw7cNNh5UCDj2+vsHPCF6B8wtEYTH7J0ccoKSkDknhBgT1/N1+KzJlRTHi4z9Bsbt0gHu9RRWBEnsr2sEs0MavEVZzwS8pQk0RH+oQi5ft7xWnCeag/F+pDlTa6X1Ozdb7KV4ONc6tnz50BlvPzga4IWQmNOHUVG2stBs9Bihfvu/UdvATg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261028144727099003)(4143699003)(38070700021)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFVVT3V5VWdMQmtaWThRdG5SaitwNE9vSXQ3QzJUQlQ4M0xzcGVVOHJuc3Qv?=
 =?utf-8?B?aUJUOEpxdXNPQ04vWUMrc2ZqY3c5ekoxbzYzNVNKTG5mQnMxNW9hMTZkTkFo?=
 =?utf-8?B?dXJyMkJaU202djM4dG1jOFNneTBUbi91aEJXallyZ3RBSkdIRWM4blRRTG80?=
 =?utf-8?B?S0xSbWxTNStmUEk5Q0RWRU0ydmN3QitvWVhxdWxvUSt0T3BJcmxUeFdCSi9D?=
 =?utf-8?B?azZwd1JTTXpDODZOc0xFeTFmUjA1QzBwV2tTbVlZRUZ3aDdQRXduYmtnQnFO?=
 =?utf-8?B?NTl5UlkzMGQzcElUTDkzMHFBRksvc2FDenRNZjFHK0VOUkxXQUFKd1gxNkRw?=
 =?utf-8?B?MUdMS0ZicVJ3M2pGK1JZUE05c21FS09WVjlNRHRqQzlQSFpOY3AwQmwwTGFE?=
 =?utf-8?B?MFhTN0IyQURDWERxRTNJT0VQREFXSUZKRmJMRVpsWU5KL2VqY1NRS0ZFZG9k?=
 =?utf-8?B?QUxBQWszUVdYUmsyTVBkeUNNYmVBN3NQc1NKZnlzWWlUa096UytXYThwVnp3?=
 =?utf-8?B?VXhQZUlOa1VEUGtBQVNLQTRmc0V2eVZyZ1pmU3dsQXdpZ3FMeGExeFN1S0Ju?=
 =?utf-8?B?Q1lIRjBVdlZDR2k3NWlWSVlxajFoN05GdW9WVGpkM2R3MlFiWjVnbXB4SjQ2?=
 =?utf-8?B?ZHp4UW5LdzZWN05DZTVHSkRaeUpCeWg1M1FtQk9wTWVXMGtSS1I0a29iOUdN?=
 =?utf-8?B?T2pEUnBrSXBUV2tEemV3S2NDNTM2OHpLUDdTdzZOUDdsRDVNTnZ5SHppRGFy?=
 =?utf-8?B?QnZjN0MrcFVIYVp0QVVHZDh0SUhMY0xxcFowNUlZOUNVUDlDa1I3QUFsWjN1?=
 =?utf-8?B?eVlCMkVlM01DRnNpTWNpUUtTTUMwZkVReTdsRzlqTm0wOVBqOGZCSjhKRXRv?=
 =?utf-8?B?Z0NHaVA1VXJhSnlYckVXTlRtbDJvaS81UDdRMHoxVlNiVnRROHBpZUIvSXZp?=
 =?utf-8?B?YmRvYWN6TFZQZGduTlkxZ1dySG9IbW9GZkRqcFJINFNJQXZYSHcxcnVqRmNl?=
 =?utf-8?B?WFdSaWlQRGlocExFR1lOUXlHQm9XS251Q2x6RXpVT2lOMUdPcCtvbVJUSVBL?=
 =?utf-8?B?UDFiaUhsOWE2UHVGNFc5bzkzVUZBYTBqYVhmaDRMYVFCZnp6VmpKbkdHWDQz?=
 =?utf-8?B?bWJVNHNPN20xeGVESmM0U3BrOTZWekJkUGNQMjh5eGhOUW5VY0NrKzNEbEFl?=
 =?utf-8?B?b0U2dU1FWGJKMXkxbGtvc2NXSXgxd1g5b283WWdndU94RDhiMjk4ck1CQmZz?=
 =?utf-8?B?QWNiSllnUG9ONlY0d24yb0g1K2tUcUVBd0dhOHZBemlseDVCeUt2dml1Mmpn?=
 =?utf-8?B?Zng1KzVIdWpyWUxZNG5GOTF1RHBZcXlCbk9NZ2pkRC9QQnRFS1R1U2JSY2JQ?=
 =?utf-8?B?YlpjcEJUUnVRV2p4L0NPQzdDMEZuaE5ncG85eTBHdWU0Q1ZVQTgyNlpCaktU?=
 =?utf-8?B?Q0I4MS9YSVp5MS83YUlTbnpNMjhhdjJSVG51azVua3haS1ZsVUMvaEdVZnFq?=
 =?utf-8?B?SXBaY0hqTmROc3dPYUtCT05OMjB4bjUvMW5xNlpWUUc2R2NUQWRQN2NPZklE?=
 =?utf-8?B?VU5CNkFOSzd1RWxaNUJXVjNYc0QrRm9nMGhkd1hPblBndGU5Z3piUHM1T3Nv?=
 =?utf-8?B?dUE0QjJqRXBtNzBJWWxFUi9HcXNtSC9hLzNOamM4ZTZYdWd2Yk5oUVprWXpm?=
 =?utf-8?B?ZVZxTlpqL1lzR0g4djRpY2c1dG5OVUFBTENwcmtYck1QQitSQi9OUGhnNDkv?=
 =?utf-8?B?VE96Mys3ZVRTbmI0enFaaWxYcUd6M0ZBcWFmZmpuREZaOHRDV1JzZk96VEpq?=
 =?utf-8?B?UzYxRTV5YkFRbVgyMWdZSlFieDNIeGR2NjJPcVN2ZUNBaXNMN3E5WHZtcEJ6?=
 =?utf-8?B?QXVCdGxXV0ZMVWppVFhXa0c1MExkL1M5TVlFTWdVeGIvMVkwV0E3Smxlb1cy?=
 =?utf-8?B?WXlOeWZWdGFjZnVxVDU0cncrMG0vUHFDTW5ndmRlZit4K1RGYUx0YXVIN0xJ?=
 =?utf-8?B?ZGcxS3JlSTBWQjBnNXZkWUhoV1Vud1Z2NHZ1dUFnYmNPSi85ejVCcGZzVE5B?=
 =?utf-8?B?UGN3b3Y0MU14MkhBem95Y1lKSTVIVDFHMHRiN0pwekkrVWxnemdVcHVBNk8z?=
 =?utf-8?B?QUhCZ2lZZ25SZnJJSjdoZVNOUE9JaFJ2UmJ2WlQ3bVZyOTdCOXlBZ3hYajFV?=
 =?utf-8?B?MDBrbFlHRXFidmJ5alppT2RTRG42YmNnVXpEd1h4c2I3RVFhU0tKVG9VVGdy?=
 =?utf-8?B?M2VRV3lXMjFpMjZYamZyVVBvRTNjYlBQanpmbFQydlVnWDZoQXJMNVdnWUZI?=
 =?utf-8?B?eGJVSEFvbmRPYitrV1dlbE13SHFrNE9SU2tyNjU0WUhzZlFxSXpHaHhUQkRE?=
 =?utf-8?Q?ZdatVKTuVNVw0h/ALw9J2MugPXwJQI11A/SWYqawkLfRU?=
x-ms-exchange-antispam-messagedata-1: zhvx9vvOst25gA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <775C9E777012E84D81E7C58E401CD70C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f745a33b-c121-41e3-532f-08df3f9fc8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 02:59:21.2503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4b3IKjDP5PQ/uZQGs5P8AxtBCm63WVPpNlFyVmfPjr1AVwMNrumbwBOf/dTlIQWBAxs4lJSaX5/buV6L72ipfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

T24gVHVlLCAyMDI2LTExLTEwIGF0IDE2OjIwIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDExLzEwLzI2IDM6MTAgUE0sIFRpbXVyIFRhYmkgd3JvdGU6DQo+IC4uLg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUvdGx2LnJzIGIvZHJpdmVycy9n
cHUvbm92YS1jb3JlL2Zpcm13YXJlL3Rsdi5ycw0KPiA+IGluZGV4IDdmMjc4OTAzZGM4Yi4uNzVk
OGY5MDc0MjFiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9maXJtd2Fy
ZS90bHYucnMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmlybXdhcmUvdGx2LnJz
DQo+ID4gQEAgLTI1Nyw2ICsyNTcsMjMgQEAgcHViKGNyYXRlKSBmbiBsb2FkX2ZpbGUoDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5va19vcihFSU5WQUwpDQo+ID4gwqDCoMKgwqAgfQ0K
PiA+IMKgDQo+ID4gK8KgwqDCoCAvLy8gUmV0dXJuIGEgdTY0LCBmcm9tIGVpdGhlciBhIDMyLWJp
dCBvciA2NC1iaXQgbGl0dGxlLWVuZGlhbiB0YWcuDQo+ID4gK8KgwqDCoCAjW2V4cGVjdCh1bnVz
ZWQpXQ0KPiA+ICvCoMKgwqAgcHViKGNyYXRlKSBmbiBnZXRfdTY0KCZzZWxmLCB0YWc6ICZbdTg7
IDRdKSAtPiBSZXN1bHQ8dTY0PiB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCB2YWx1ZSA9IHNl
bGYuZ2V0X2J5dGVzKHRhZyk/Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbWF0Y2ggdmFs
dWUubGVuKCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGB2YWx1ZWAgaXMgYW4g
dW5zaXplZCBzbGljZSwgYnV0IGZyb21fbGVfYnl0ZXMoKSByZXF1aXJlcyBhIHNpemVkDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gc2xpY2UgKCZbdTg7IE5dKSwgc28gd2UgbmVlZCB0
byBjb252ZXJ0Lg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQgPT4gdmFsdWUNCj4gDQo+
IA0KPiBBdCB0aGlzIHBvaW50LCB3ZSBoYXZlIGVzdGFibGlzaGVkIHRoZSBsZW5ndGguLi4NCj4g
DQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZpcnN0X2NodW5rKCkN
Cj4gDQo+IA0KPiAuLi5idXQgdGhlbiBmaXJzdF9jaHVuaygpIGNoZWNrcyB0aGUgbGVuZ3RoIGFn
YWluLCBhbmQgYWxzbyByZXR1cm5zDQo+IGFuIE9wdGlvbiB0aGF0IGlzIG5ldmVyIE5vbmUuDQoN
CkluIGFuIG9wdGltaXplZCBidWlsZCwgdGhhdCBjaGVjayBpcyBub3QgYWN0dWFsbHkgZG9uZS4g
IFRoZSBvbmx5IGNoZWNrcyBhcmUgZm9yIHRoZSBtYXRjaA0Kc3RhdGVtZW50Lg0KDQpjbXBxICAg
ICQ4LCAlcnNpDQpqZSAgICAgIC5MQkIwXzQNCmNtcHEgICAgJDQsICVyc2kNCmpuZSAgICAgLkxC
QjBfMg0KbW92bCAgICAoJXJkaSksICVlZHgNCm1vdmwgICAgJDEsICVlYXgNCnJldHENCi5MQkIw
XzQ6DQptb3ZxICAgICglcmRpKSwgJXJkeA0KbW92bCAgICAkMSwgJWVheA0KcmV0cQ0KLkxCQjBf
MjoNCnhvcmwgICAgJWVheCwgJWVheA0KcmV0cQ0KDQpPZiBjb3Vyc2UsIGl0J3Mgc3RpbGwgdGVy
cmlibGUgY29tcGFyZWQgdG8gdGhlIEMgdmVyc2lvbi4NCg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLm1hcCh8JmJ8IHU2NDo6ZnJvbSh1MzI6OmZyb21fbGVfYnl0ZXMoYikp
KSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA4ID0+IHZhbHVlLmZpcnN0X2NodW5rKCku
bWFwKHwmYnwgdTY0Ojpmcm9tX2xlX2J5dGVzKGIpKSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfID0+IE5vbmUsDQo+ID4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gPiArwqDCoMKgwqDCoMKg
wqAgLm9rX29yKEVJTlZBTCkNCj4gPiArwqDCoMKgIH0NCj4gDQo+IEluc3RlYWQsIHdlIGNvdWxk
IHVzZSB0cnlfZnJvbSgpIHRvIGNoZWNrIHRoZSBsZW5ndGggYW5kIGNvbnZlcnQNCj4gdGhlIHNs
aWNlLCBpbiBvbmUgc3RlcC4gWW91ciBUbHZCbG9ja0hlYWRlcjo6cGFyc2UoKSBhbHJlYWR5IHVz
ZXMNCj4gdGhhdCBhcHByb2FjaCwgYW5kIEkgdGhpbmsgaXQgd291bGQgYWxzbyB3b3JrIGhlcmUu
DQo+IA0KPiBTb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gwqDCoMKgIHB1YihjcmF0ZSkgZm4g
Z2V0X3U2NCgmc2VsZiwgdGFnOiAmW3U4OyA0XSkgLT4gUmVzdWx0PHU2ND4gew0KPiDCoMKgwqDC
oMKgwqDCoCBsZXQgdmFsdWUgPSBzZWxmLmdldF9ieXRlcyh0YWcpPzsNCj4gDQo+IMKgwqDCoMKg
wqDCoMKgIGlmIGxldCBPayhieXRlcykgPSA8W3U4OyA0XT46OnRyeV9mcm9tKHZhbHVlKSB7DQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT2sodTY0Ojpmcm9tKHUzMjo6ZnJvbV9sZV9ieXRlcyhi
eXRlcykpKQ0KPiDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgbGV0IE9rKGJ5dGVzKSA9IDxbdTg7
IDhdPjo6dHJ5X2Zyb20odmFsdWUpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPayh1NjQ6
OmZyb21fbGVfYnl0ZXMoYnl0ZXMpKQ0KPiDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEVycihFSU5WQUwpDQo+IMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDC
oMKgIH0NCg0KSSdtIG1vcmUgdGhhbiBoYXBweSB0byBjaGFuZ2UgaXQgdG8gd2hhdGV2ZXIgb3Ro
ZXIgcGVvcGxlIHdhbnQuICBJIHdlbnQgdGhyb3VnaCBzZXZlcmFsDQppdGVyYXRpb25zIG9mIHRo
aXMgY29kZSwgd29ya2luZyB3aXRoIEN1cnNvciB0byBldmFsdWF0ZSBlYWNoIG9uZS4gIElNSE8s
IHRoZXkgYXJlIGFsbCB1Z2x5IGFuZA0KaGFyZCB0byByZWFkLCBiZWNhdXNlIG9mIHRoZSBmcm9t
X2xlX2J5dGVzKCkgY29uc3RyYWludCB0aGF0IEkgbWVudGlvbmVkIGluIHRoZSBjb21tZW50Lg0K
