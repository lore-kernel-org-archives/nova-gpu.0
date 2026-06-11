Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD239344D90
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204047; cv=fail; b=Q2b7Cd2/MagdnpPAQ6tQnfBm1iUT585hZkwfEBTwWRx8HXEN47Y8p5/hjPScmNnZ5RAuDfpPy+HB2mQt+2MSYNoKwgn8JZK9KDtRQenDcViw1xjPwlZRJ+whp/3krQP0edF4BZlA2gq39RYVntX4cT2nswodWjazyZy7vmRO/kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204047; c=relaxed/simple;
	bh=svb8OxH/ClkwJoRG4w6WqdZ5z7VQjrb/EverI3Aro3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dniOnKBUmRhPWDb52iVt5nR8No0/DhnVWB4VR2GBGrkYyNZV+Ol/KrrINf+MRYpWeVB8kZ8fVt2yL0M7vn8e/fyBLin+0sSgZpToOdvEY4Einqe9GAb6kQV2ujjW+KRGaH2bjxsBzKbqa97Fnum3LpYnZewIhxIqn1hZvt9TfVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U7GqZCia; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U7GqZCia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pReJOOM/tYM5XWGASKMRNR3XeTpVaDBqUWEtVEM7NUA/hObgKHVixU6a5bMx398fDzW4oPTPkdZkEIk9kNM6Y6v1p7R2T5V+sV5i2rEQfHV2Vt+z04Gh+O0C5L14wIdaVwUFclnmn8ag/AGgR4Ye8jbeao60H55G4OMMPdxNeV9iWZ/P07ELWIo/pKFo1Hi4FYUUzGl/npziGOlHE79p4rmvhZV8hleEYALcOVeIydN3t5mL9kCaR8YvWFvI35jxuYiTsJ6PXXuFtZcqBNW96zjzqPH/uFS8kkZv+zPsA25ag3lrHP0ZVSZwgAV3TRlbfw9pkrW51JawqcWiJzWPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svb8OxH/ClkwJoRG4w6WqdZ5z7VQjrb/EverI3Aro3Y=;
 b=XXoVqCdGqVm03Qj/r9V8+UI97CTL1HbcNCJbMbrMsNIEan3eoo1ZC4GdPd2FIIDA5QmgCdu1b2kBfGqBjrDt5/I6wbdZEpkN0pq+yZUJuL99i9pdeP+dof/3BtL7T5roE8zeyarjcg1bBZfWslQomczZ1RuxKoL1fLtpx1TnAW7rqzlxdrCoxhoj6wgAPtn8H3ojJv7KJ5p9vh4uQC3mjUBl/yiXtZjRNGrJlv9Blt/lPX9n0HVWT4G6RUox+1WLW5jgbLE7x+yriNkK05UP066rVF/+6KdANYT+OIQltxaEH1VVEO/QTTKnrVHf+bIan+8D0eg8+JuMjXvG0UK1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svb8OxH/ClkwJoRG4w6WqdZ5z7VQjrb/EverI3Aro3Y=;
 b=U7GqZCiaCQ5vvRO/91ZLQBOsQQoIAQ3U8QsUJ6Yz37dRSn90BhIvgrGWobxTE1p8iHV3Nup8S2syGpOxTcHiwJnYcSyZ9D/UThYGLVEOkCBbfih8Hlh/LU/njRtRDC7Dirp2+NmLPog9wFtBZdWmZyKgnxNuJ7JxrQUg0FIuoGsgMm8UMhmSrTztnFYENbLeddyYuloyfH0dhkeQh7Hfc83nFlnsBspQeHwTT3liCnMaMoCuN/L/yFpi9yGA/j14GNg6tVo2wuyMVWag6YzNQ7Kr330pKDXdEWrvICI6B8Y++v46hkq0MB3y1wqb8I4vM+eQoRuCXsIBbBRd4uH4iA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:53:57 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 18:53:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
CC: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Topic: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Thread-Index:
 AQHc+QGVpGov01rLA0+kZCzkLFfG+7Y4Vx4AgAE6LwCAABnPgIAAAnIAgAAEeQCAAANFAA==
Date: Thu, 11 Jun 2026 18:53:57 +0000
Message-ID: <39c34add0996890c934fae2cbc3e8b96e94c3fd2.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-3-ttabi@nvidia.com>
	 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
	 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
	 <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
	 <f55c43fc4cff816a0d10185d17f761051b879ac7.camel@nvidia.com>
	 <DJ6FVVHX14V8.2PE4DOU69H0G3@garyguo.net>
In-Reply-To: <DJ6FVVHX14V8.2PE4DOU69H0G3@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SN7PR12MB7420:EE_
x-ms-office365-filtering-correlation-id: a075afd7-41fb-4b22-e3cf-08dec7eacb0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|5023799004|22082099003|4143699003|11063799006|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 BPSeSapiWa8+3PBgYKhcE6LkGIv9YS9oYoDgNg0U7JwnGmvYJo0oriiCube29bRMbWIXtDrqvkihR7JLHMGBu1m/FKCPTKQos/w6yn9TCWzQybOseVDxHPbD3hYsub0GsRvxKbzfhD4MRZvy3uoiQ/2pBnvOxTe67WElcjKULBlNG6SVbinil20OpIYnGpB3PaiVYiNm+e4hzFm1DaaFdyUYi9tD1JImcH4/0W03J7/nIcmWdrc3mm+AicFY7dvrRroAzUI3NM1G36DE4jy5S1JfAPhaEVQl6cdmbDbRAtEVfz8sOtdJ9RlG5gMShaBe2fptXdCLuOcYVfNuVCH1ac3126LTO/mpM6tJarJL/413viC0QQS9PeRyiUR68HFyIf+TMLScY37FmPuZTYD1SlukO7KuzbLok73k3PwEJmO+vGm6SFwDkWtKJdJjeHvIsI2qvVAVUmOc4mfqOQs+bOlT4/RnwI8t3l9WgKTU92VrKekMJkglWxgheVV21cCK+TK3N9f0EVjIrB0ZgsYjFtkBd0GjFOJ/vjzzED05280ZViAfu9MQi6XuL1LvOYNxlxFhGbAs1/9xhPGGs5ilZJEl5DmJ2wFPGxWsY8krmSuZSIw5q2MGeycvA4r3EwuxAEd4gxpmw1I2FRfzkJwnOU+bXXpCqCdgS8JoLBQ1xTJi20YVko1Uk9Qqcjxdho2zwhuGcXYdrcDFtES7HSHPHbGLDwlv3+Fnma+2pF2vreJJ0XBJPK1BHPGgpAfBR7UG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(5023799004)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVVZZ0h1QTRodE5JdnRtSUJPd2tFZjJSZ1YyK0twMnpsbTJVYnZaTEZGc2tu?=
 =?utf-8?B?NXNLNXZCYkF3czN4cHhWaWp1bE56TldxUEJmcXBNZmpjdDBUMG53WGxkaVdW?=
 =?utf-8?B?VTNGUlkyM2g0bnZ1aEw1Q1JQbkMrbFd5YUtyQmdzQmhrQ2pkeW9zd3RiZ09J?=
 =?utf-8?B?MEFGTkJsSnZVMU1xeWpET0syZDVXYnNuaHBraHBsSG01VEZKT1lDTS9SYTNG?=
 =?utf-8?B?L0hrdm80THVNQklGd3czWlJIWHA1TFpESnBxTFlvS0xUOTVJbHZzN1NrMldY?=
 =?utf-8?B?ZlRiN090Ump0RGVGcHdCdFIyRGUyZGtvckw2Mld2QllreHVseExvSXd4UUw1?=
 =?utf-8?B?WUM5U2hTaFJEUWlibC81T1JoZklRV2k4T2xDc0hnK0p4d0dvSkIzY2lqb1Ba?=
 =?utf-8?B?SWRtTG1obC9QY3pMZHRKS3o1RnZEU3JrTlpySzZlUDNIQnAzbnF5Y0xRSU5H?=
 =?utf-8?B?OEUzbU1NeFdwTGVKRldwZUVhMkVQc2dqWHFLN0V3SkZQRkt1b0QyMDhOdnk0?=
 =?utf-8?B?dzhnZzd1ODRQZzduWHRmZjJabFBMaXV0enZrcVlkZUdlaS85RWU4eHpBZTNr?=
 =?utf-8?B?UXRCWlZKaFd6TmZYVk1mbEJId05rVWgza1RkbTJscWZEVjgrMWJkZ2Mwcis1?=
 =?utf-8?B?dEdVZ1htMVdSdmlXRHhENFlUL1hPVHJLNVYrbnlzRVVxTUJvNGMwSDYzaTRC?=
 =?utf-8?B?SmZNTkt6Y3hoblBjUVNtd2VKWUJMb3ZzWm5yMHNqblVMOWlBZ2Y2ZzRMcHNx?=
 =?utf-8?B?bExpcmtJM3V5RXVCNENNK3pTaHJtQWNNK1RQTkdnTjl6YXN6N25iNTRvSGhx?=
 =?utf-8?B?OTJIRHlHTGxVSlBJL3FBak9TbGFQVkNHbmlXRDd6dGZJeDVXVEdKWi9xU3kx?=
 =?utf-8?B?dzdZR1FaWUpDTk9OdkhHaG5TTVFVam1JQkVWRnUrRHpzSGdndk4wWEdHWkNs?=
 =?utf-8?B?cC9sNXJSUk16WDJKNTdDNGNwSk9oWXY0VXE5aFRTQm5RZDZUQjhTYjdxSlBz?=
 =?utf-8?B?UVVwWmZVcm1pVWlmMkM3SEp2THI3LzduVEVoSE5sV0c1QkwydXMyUGxiZkQx?=
 =?utf-8?B?bnMwUHZOZ29yZEcrL0ZqWWdURnd2ZDg2RXRseWNSQ1lMczVCOXhveE1Zd256?=
 =?utf-8?B?Yktnbm54T2xCSUlGREJXT1Fwc1E5a2JSNVAxY3NidWNuRmhKRS9HN3FWSTZh?=
 =?utf-8?B?dytMaDFyZWVVaDZXRFFWOHdPbm15UGlnRUlvTHBGRzBkcFo5TjJNMEVoTStT?=
 =?utf-8?B?UW81bDRiQmI3cGFyZjVXYUVZdks3SkdBbHhxNEYyRGlLT3BHMXpjK081OW9p?=
 =?utf-8?B?cjA1Z3V2NW1oWVNpb2lsV0JQTGdhTlJ4dTFHSFlZMHJwSTZ3OUNKWi9wT0xH?=
 =?utf-8?B?REEyMzd0RlM2QjJJR2NYcTZrbVFnTFkyMU9IZ3ZXNnYrVmVJNktPYVgvdUVZ?=
 =?utf-8?B?eFIvbTE2TUZTeEJacFZpQXhGK3VrWnpjTTlzZ09YbFFHZW9mWDJsaGVYQmZU?=
 =?utf-8?B?TlNiRUw1NTZrRkxHNlcvRTQ4d0x5UHhkMkdoTHBrUFAvZm5hQWg1MWhqUDFk?=
 =?utf-8?B?djJ3eG93Um1QSzVpNm9WOUhRNml6WXJzNGI4MEdLZUxhWlJJNnpyR0k3eGY1?=
 =?utf-8?B?MlkwOUVaeEpHTms2cU4wdjh0OExaelVlNFhNeHpMVzRGZnI5bmllL01ydFIw?=
 =?utf-8?B?THF6NXZmSElaZUxySmFCMXAzWWY2ek12TXM2a01MRUw2NjloN3VGR3JIeFN1?=
 =?utf-8?B?V0tkQ0gySWtBaHhpOVQ4K2J4RHN5aW8vb1g1N3RQTnF1OTZ2Q0hjUUI3Q3pW?=
 =?utf-8?B?MFFVOW1uWm9tVVVUTXJzNHRSOCtyMitGM0l2dTdDMFdPQW1MNUt3OFJEdGgz?=
 =?utf-8?B?RHBFRXVaeHEreDl4a2hiTFIwS1ZZYnBxa0xORnE1RmdEbWRUUW9DVTRxUEhD?=
 =?utf-8?B?cWd1YXJLd3ZNbzZEeHpGRFlQUmR0a0o3WnREdnBlUHhFeFZoUVdQZUQ1bHdP?=
 =?utf-8?B?SEN5YXpRR1I5clBhWXRoT205R1RUOHhQN1dlaEc3eUNZdWxWQXhpNXdoYWRx?=
 =?utf-8?B?TW9IQitZUi9tZmYrS0gzOEVhQXQ2NjlVQkFTVXRjblBjakorb2ZMV21sMS9m?=
 =?utf-8?B?MEVjbWZCaGNzMC9SYmhqcmd4R0ZPK3dvU001dnZFaS9lbU9yRWlUT3lRNnFK?=
 =?utf-8?B?L29RNDJSaUNrTjNLWnJoeEF6aTZGd1JCYTJIL3hqaWxpUW9JSUxYcWtUUFJl?=
 =?utf-8?B?dDhOeU1uUnVzT1JBaGlvcEhNWStQdUhNdlhBM2theXBTdEJoY0tGQ0lMUmov?=
 =?utf-8?B?QXlIeTFjODArU3NrV1hUVUtKNzVEL3dMRUcrSUtaaHRoekdNOXduaGVoSW51?=
 =?utf-8?Q?nfz46K6k/Eeg+fLCybsCVIWN7OhFoMdBVN7ra6HqQZMo5?=
x-ms-exchange-antispam-messagedata-1: HBVc0qMFb1QCQQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <059C8BFF30A9564FA42BAE0D9E34BC18@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a075afd7-41fb-4b22-e3cf-08dec7eacb0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:53:57.5829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc2bi6B+Yj5Z6OzZoMY63WoyTw/T2dUN+XTxCS3PB5PbqldO923l7KD3PwlTLHyR4qxcsZePOysJH7fQHMQdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

T24gVGh1LCAyMDI2LTA2LTExIGF0IDE5OjQyICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiBU
byBtZSwgdGhlIHdob2xlIHBvaW50IGJlaGluZCBhbGxvdyh1bnVzZWQpIGlzIHNvIHRoYXQgSSBk
b24ndCBuZWVkIHRvIHJlbW92ZSBpdCByaWdodCBhd2F5DQo+ID4gd2hlbg0KPiA+IHRoZSBsYXN0
IHVzZXIgaXMgZGVsZXRlZC7CoCBPciBjb252ZXJzZWx5LCAod2hpY2ggaXMgd2hhdCBJJ20gZG9p
bmcgaW4gdGhpcyBjYXNlKSwgYWxsb3cgbWUNCj4gPiB0bw0KPiA+IGFkZCB0aGUgZnVuY3Rpb24g
d2l0aG91dCBhbnkgY2FsbGVycyBpbiBvbmUgcGF0Y2gsIGFuZCB0aGVuIGFkZCB0aGUgY2FsbGVy
cyBpbiBhIHN1YnNlcXVlbnQNCj4gPiBwYXRjaC7CoCBUaGVuLCBhZnRlciBhbGwgdGhlIGNhbGxl
cnMgaGF2ZSBiZWVuIGFkZGVkLCBJIGNhbiByZW1vdmUgdGhlIGFsbG93KHVudXNlZCkgY2xlYW5s
eS4NCj4gDQo+IFdoYXQgcHJldmVudCB5b3UgZnJvbSBmb3JnZXR0aW5nIHRvIHJlbW92ZSB0aGUg
YGFsbG93KHVudXNlZClgPw0KDQpDb21tb24gc2Vuc2U/ICANCg0KSSBjYW4gdW5kZXJzdGFuZCBp
ZiBJIHdyb3RlIGEgcGF0Y2ggc2V0IHRoYXQgb25seSBhZGRlZCByZXF1ZXN0X3RsdigpIHdpdGhv
dXQgYW55IHVzZXJzLCB3aXRoDQp0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgdXNlcnMgd291bGQg
Y29tZSBpbiBzb21lIG90aGVyIHBhdGNoIHNldC4NCg0KQnV0IHRoaXMgaXMgYWxsIGluIHRoZSBz
YW1lIHBhdGNoIHNldCwgYW5kIGl0J3Mgc3VwcG9zZWQgdG8gYmUgYXBwbGllZCB0b2dldGhlci4g
IFRoZSBvbmx5DQpyZWFzb24gSSBhZGRlZCBhbGxvdyh1bnVzZWQpIGF0IGFsbCBpcyBpbiBjYXNl
IHNvbWVvbmUgaW4gdGhlIGZ1dHVyZSB3YW50cyB0byBnaXQtYmlzZWN0IGFuZA0KdGhleSBsYW5k
IGluIHRoZSBtaWRkbGUgb2YgbXkgc2VyaWVzIGJ5IGNvaW5jaWRlbmNlLiAgSXQgc2VydmVzIG5v
IHB1cnBvc2Ugb3RoZXJ3aXNlLg0KDQo=
