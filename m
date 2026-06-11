Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE036E460
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208111; cv=fail; b=KIgUgq2Rfh4hxZILsQfFlas0RMSu25IC6D2U8kkC1ug9RwQ6f459wTjvBPYVS7zEEfLSUxikSGLSbGAUBzb1DTd1S7sEvbtls8rSmmZaKfnin/BgouWFtLqLGPL9f17I5Wbu8b5lzu5w46W+2YjjjIMHovP3gwg9ubWYXRQV6HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208111; c=relaxed/simple;
	bh=Bsb6yQzNOBHJX6JHbTJmpuIpLgO2e7Z+akePzjUjLy4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=snCq81xvSPYaSs7maoq05in0t5DHR02vRUDq0SXjMATIjCKWWLz3j2JWLVlhQTEbSLNZryl7f0kLfo9PvQx/O8lSYXFRiTz4Xo3eSk3grvBYNzTv09eKmkNoV3Fq7o2q+py+JOWNE2U+CKZm2Ll+Y145QdgBjdFC4k3Wd8z88CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PMQRCRH0; arc=fail smtp.client-ip=52.101.85.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PMQRCRH0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9lmHIYTG3Wuf8RwzstP4W81py9fvq5V9Xn5szqPOPd0Oom+Qpv2ChoN3oHvcWOUFyygCKdXVsvdbak2Yzg5UP1F2b/dV2V18D936Uw1j6RreulhIrFtIFt6X9lMEyYdTKpIDdwd8v6cP8O/HjPQBuplH5YpkuGj4vJWPVYvoYAV/f0+GGWbbL7ec1QszW7TjpOSM5uSSW0U1T5Ey2oXDmDm3IoN1gMoVl+slbt8YvV3jGN4wKJxwuWS3looTgoW6Jy+yX+OSndSWdyVLn58s4I1X8jq5iMWF9vCWIq8UBmmX8+JNxL5WJ5OJxKYSOIQa/CYYyb0I8p8tPClnDPrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bsb6yQzNOBHJX6JHbTJmpuIpLgO2e7Z+akePzjUjLy4=;
 b=RAt1OHtgkTBXbCq1iH7RXcKE7zdIkDrng0+hgbIz3chpzWorhIJJuRYpcS6HDttVCxxxdCg3Ki46AZXrsH9GYdPBAZ6L7RigVhJokNKn+H00Y6bLLhQUO+PSuNd8crPKtY3xVUQz1ibRluumwrJUZmG84yuYRUE9gytbcmCEqy/EKBwwV8DMOfblT3xsDiNr6lnUQJ91gKVdEOLkFUEE6lSiflcgEa6ddJPlr0keqFBlSMhfNO+UAf2uQsdW2pfMYo4CpfiWAJJpWshIzc8Z4DTDzB1JdLK83Gyfqx8+9nTuYugGIznqVJhh/jv0GsLqni42aKGc9ERgED1PK7PQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsb6yQzNOBHJX6JHbTJmpuIpLgO2e7Z+akePzjUjLy4=;
 b=PMQRCRH0AWaFq5ArvZ87X7k2nJ2Zu2R30JVUb30rp1AgNfOmtmopUXE8JvUCB4YRCA5h9+9C1I0zHW+QjN8vae179PSk6FOkySy4jmUEOrYqbLKgxGhWNerVXqhdY/o63LmE4KS+S+CQe4vhGLWUHhA600/eK1623vHkHsiJkMGnrPioHAe/ORGqVxQ8eLAz1+T9i7PFOP+PjOm0/nz9wJzY1Ms+U2Gea0wi3zrL0iAgxEsHxueNAmlRhe7WFeG+4uy3Sd5o0ifgK/Rz4NiZoGQDPIOQEkUqgcOHbvVZOD8o0ymNwQuJHMDl/4IJhuFwXHL/cZyHS59cV3lKobqoDA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 20:01:44 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 20:01:44 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Topic: [PATCH 1/8] rust: firmware: add request_into_buf()
Thread-Index:
 AQHc+QGZGJRxryX2J0aNJYdBUK6JarY46wMAgACi4QCAAC5GgIAAArGAgAABBoCAAAhYgA==
Date: Thu, 11 Jun 2026 20:01:44 +0000
Message-ID: <e61af16615724d751ef6e2d176c057797d2c7530.camel@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
	 <20260610174929.744477-2-ttabi@nvidia.com>
	 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
	 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
	 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
	 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
	 <fb77efd6-1a38-4f81-a493-02268be6bb38@nvidia.com>
In-Reply-To: <fb77efd6-1a38-4f81-a493-02268be6bb38@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CY5PR12MB6228:EE_
x-ms-office365-filtering-correlation-id: 54bf03bf-0da2-4748-9402-08dec7f4433b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|38070700021|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 VZYKI/Z47d0Tf0ar2KPh/oaRFejGVn1IMEJZgkbmj9AXhyszP7Oz9Vh7gl1vIZ0olqcXm2bChC4FukgeG+CAHVaHFzlSJMJn6SqGyL/LTdMWH+u9RRQMHNsSVfUH1Ol3A5f8tAIcDksU5K50QjDWsdYztMvAj6ffYTxVV65gGgB9BdPBoP0j4oQvELqEYQq5JcsZEhqZuHJX6Xjg9yP/jQJPcs5bwtyLgU1xRenNQuAjaf9luE0xxNz9Ju2eWsHN4GbmXG7wvDPcMMAIifyIluqzY50EfcCwFENW2T5fWeh8L+umdxajSlU+hWRo+7whggWglCWorgLW9m/MFHfNghRaKsh4cPV1blaF9XxmDcaBxIwWcNl6W9+YHiwiD4e3C2194jlbZQRX5QLDLDTdET1m9xXQoVk8w9GsgCl4y4hmoJ5NINDx4AhovqF1pNhaYqf9t6oZSaF6epRclJdvSy9FtazwfILxnYq5cTx/Rj/GK/eZjv+pwlL+RDN0JkhIs1vX+ZS8a3JZGxGPEW8P/oYbXXMNBxG/1/KRbLRbptYqY3vYMF2IbzJ+F5/8Bu38EKQM+s8Fvs2OpUE7Umh1PebdX1dT7cTTnjs1PWIhgV3IXh5oOAotAgvLTak4qk2teVrE1b7odDLhVzx358ofR4HBT58E8e+horCw5ZX81PT9cTCejFGLLYG9uMnx3NlKHfs9ti8ypekStlvtqi5hgr0bKsnPeH4wSa+xOB2KJnTeGpD4YkCyTeul6KcXf1t2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHFuSWtoVU1HMDJ0ZlhNM1RSVWtmaWJWVHNFYWQ0cU5naXRkdGpFRy9rdzNj?=
 =?utf-8?B?eGdPMy9veTc3ZlhKeTZPdUpndlBTaVU3S01ndytsVzBtQkxSWHdZUlI1ZzZY?=
 =?utf-8?B?WitxRnEzSHJwQTVwYXFzUXo5WUJvTi9MWGRZTnhOUEJoSGJlMlB1K2o3ejA3?=
 =?utf-8?B?djFDTFdYVVBUTGVsaW9RSDFIUUpPN0I2OXhFRUxveWVsMXpyNVdFMGVQZld3?=
 =?utf-8?B?dWJlNldhY2VxTjdCb3FUaHV3MytSczdlajNnZXlTd3VLRHpFeGVTWGdQRTc2?=
 =?utf-8?B?SnNqQ2lrZmpYdFNrSi9uQXlqcjFSYy9YVlZGYk5oaExzUDBmTXhqczVLZ3Uw?=
 =?utf-8?B?cVpodTQ1ZWNBbTVQbFBQQzUyeWo2S2dzNnpkTkt0azF2NkZLMTZubWkzTURt?=
 =?utf-8?B?bFk2Y0U3d2luWVdIUXZUeFlRK3pKV2oxUnJMTW5Vek1BbDJCU01sVDkyVGJx?=
 =?utf-8?B?alV4WGFtK1JDNmVvcXNYcFNLTTQrMzh1QWthaU51WkNmWGFlOU5pVGc2WlNS?=
 =?utf-8?B?NWtTU29VeE5qMFl3akZTT1NVa0d3UThuYXNwQ0QyVm44NnJhTDAvdkYrTUxZ?=
 =?utf-8?B?NUtGSm5iOGdTSklqRUNQa0tOTjU2REY3U2h2QnVaY0dNWER2YXZ2QStUeVp0?=
 =?utf-8?B?NE8vUXpseFN4Zk53UFNvMEhFOWxVZndkR0Rwc1F5MEk1SDlmeWVwby83czNW?=
 =?utf-8?B?OUgvc3dKNnkvV2lkVmlid3dGU2ZVNmFnUEtHNFdUbmxzVmN0RFQ2b09RNXY1?=
 =?utf-8?B?b0VndkYvbGdkaTFBNG9yVjVPUU1xZXJITjdHWEM2eW80QnBvNjNnTlM5TVpo?=
 =?utf-8?B?ZExRbnV4MXd3c28zaFNkOUlsNmxkY1BOaXJzYjNLbHpPTHo2UUhBNENOWkcv?=
 =?utf-8?B?Y05rbXAyWGs1MDN3OW9ibEtseVhXMFRNbVlGTVIrQ09TeFBiMDNVeUhFbGZi?=
 =?utf-8?B?L2cyRTM2QzM3c3IxVlNoRXpqVGpaekdIY2MzYm9yenFERmRuUHRQZkRPeGU3?=
 =?utf-8?B?RGdPa1lvUytpVncrN05mSkRGRWZnQnJIMVRnY0Q2dHJRVDBUM0FReHRMMVdY?=
 =?utf-8?B?S1ZZV2dOdHBzVDQ3Y2dIcHo1L1JkTSs4eHFCeXpKd25kVlgxZVd2WE03OTZO?=
 =?utf-8?B?cUZwVHVDVE5EM1lTdFdaSy9VeVVMNDVKTUFOR2tRZVJHSjhlc04zUE54cWlZ?=
 =?utf-8?B?aGlMYml5ZXN3V1N0QkdRVXZWMjNnRk0yb2ZLQzMxdzlWMk13RG9JcXVyODM2?=
 =?utf-8?B?ekxBMzBVQWRhMk9CdW5mcWgyTHlkQXF4OHlobm5TRmFwTURlRXVxdFdKcXhH?=
 =?utf-8?B?VEdncVJ5NUxUckI2NFl3cys5Y1hRZDJtbFM4cGZGMEpiY3l6VDJhRkdVK21w?=
 =?utf-8?B?MEFxWTRnci9iNkp3RzE3UEhzKzdpcmwySVRBMlVpNy9VdU0xWkNXWmh5d0FX?=
 =?utf-8?B?NStrQmJCaWVmd2pWaEJ1NmxCSVNpSHRNeDBRN3BJRU5la0pIajNqMEJjV1FH?=
 =?utf-8?B?Y29iUDFlNTQ2WkEzcHJYQmFHVS9VZW45MEMwV2ZuTk5xR1B3UG5FbjhVNlJP?=
 =?utf-8?B?aDhQTDJUdzhrNFBhVm90dzFrY0ZiRlF1MHVXeEJQa2w2Q1M1RHllL2xJQXAw?=
 =?utf-8?B?OVhxdHJqZGZaRXEvb21PL1ROTzZwZVBpTi8wSW1Bd0FNSEE3N3lhbFFsWHYx?=
 =?utf-8?B?ZFV0RS9nelZtK1FpS1dIdDhYakpWTUwrMDIrTHA2TTRlSlNHcnhwaHdCZVFW?=
 =?utf-8?B?cTlhdnpKbHFBSVVFL1NtTDZiZ3Z1NUlZNnNvaGlXbDJtNElqTWgraG9NMUJN?=
 =?utf-8?B?U09WalZKZHdxdng0aFMzbElqOVlZdnhMZGg1WUZseDBTQnhqeGtIVUUrNkJr?=
 =?utf-8?B?SEdlTDhZd3hSTXRSZ0paMENtRHdsdWVtYnVVbU40bkNWaHljejBtT004dzVH?=
 =?utf-8?B?dHZTTTY3bU13SlY0VHFyMEpoWEtoMzdjSk8wMXVpMk1IMWV3T2dLaXZsS2FQ?=
 =?utf-8?B?UDJXdnN2MXFuazRLbFFCcEgrcEJmU1E1TTF4cFFPY0d1SjRPK3FNbm1Qa3FU?=
 =?utf-8?B?dzdCUlhiMW5NTnBkS2k3M2xlUXk0T3piNDdBSTRJVWxJbXBHcmFCaHIwOEly?=
 =?utf-8?B?SEhUZjlVaEt3SHpJSmR5ZHBBVDZCS3lSL2cvWGZrbFBhTmRPQ2xJNVlJTzZp?=
 =?utf-8?B?M21zd3JaVTNOYW9hY0VyenAwVzd6eWRxaFkyS1A3dzdHYVo2TWoxdXhLZ3Bp?=
 =?utf-8?B?RlRXc0NOUU9BcUtOR0RPTDU3Uk5YM3lZeEtsZXgzSldKOFFFdzZCWTBWbElm?=
 =?utf-8?B?U3p0dTI4L1dyNUN2MzlzbjFwaldMTlJEeVNBclRDUk9LL1ZTUGVtZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35789896C7BA6E478147D2CFFA8C011F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bf03bf-0da2-4748-9402-08dec7f4433b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 20:01:44.6708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFBmDlcUCGYxBwmtSylyMY0rJWfORj844OepSW2gXprjF1RVv0XkEIyPAF+mt/uwCLLlwNfItOPgnXI6cs0E+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228

T24gVGh1LCAyMDI2LTA2LTExIGF0IDEyOjMxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEhtbW0sIGludGVyZXN0aW5nLiBJIHJlbWFpbiBhIHN0dWRlbnQgb2YgUnVzdC1iYXNlZCBkZXNp
Z24sIGFuZCBhbSBsZWFybmluZw0KPiB0aGF0IFJ1c3QgbGlrZXMgdG8gY29uc3RyYWluIHRoaW5n
cyBlYXJseSBpbiB0aGUgY2FsbCBzdGFjayAob2Z0ZW4gYXQNCj4gY3RvciB0aW1lLCBldmVuKSwg
c28gdGhhdCBzb3VuZG5lc3MgYW5kIGNvcnJlY3RuZXNzIGRvbid0IGhhdmUgdG8gYmUNCj4gc2V0
IHVwIG9yIHZlcmlmaWVkIGluIGZ1bmN0aW9ucyBmdXJ0aGVyIGRvd24uDQo+IA0KPiBUaGlzIGlz
IG9uZSBvZiB0aG9zZSB0aGluZ3MuDQoNCk9rLCBJIGNhbiB1bmRlcnN0YW5kIHRoYXQuICBUaGVy
ZSBpcyBqdXN0IG9uZSBwcm9ibGVtLCBob3dldmVyLiAgVGhlIGNvZGUgd2lsbCBpZ25vcmUgdGhl
IHJldHVybmVkDQpzbGljZToNCg0KICAgIGxldCBtdXQgZndfdnZlYyA9IFZWZWM6OmZyb21fZWxl
bSgwdTgsIHNpemUsIEdGUF9LRVJORUwpLm1hcF9lcnIofF98IEVOT01FTSk/Ow0KLi4uCQ0KICAg
IGxldCBmaWxlbmFtZSA9IENTdHJpbmc6OnRyeV9mcm9tX2ZtdChmbXQhKCJudmlkaWEve2NoaXBf
bmFtZX0vZ3NwL3tmaWxlfSIpKT87DQogICAgZmlybXdhcmU6OnJlcXVlc3RfaW50b19idWYoJmZp
bGVuYW1lLCBkZXYsIGZ3X3Z2ZWMuYXNfbXV0X3NsaWNlKCkpPzsNCi4uLg0KICAgIE9rKHRyeV9w
aW5faW5pdCEoU2VsZiB7DQogICAgICAgIGZ3IDwtIFNHVGFibGU6Om5ldyhkZXYsIGZ3X3Z2ZWMs
IERhdGFEaXJlY3Rpb246OlRvRGV2aWNlLCBHRlBfS0VSTkVMKSwNCg0KVGhlIHJldHVybmVkIHNs
aWNlIGlzIG9mIG5vIHVzZSBpbiB0aGlzIGNhc2UuICBUaGUgcmVzdCBvZiB0aGUgY29kZSB3b3Jr
cyB3aXRoIHRoZSBvcmlnaW5hbCBWZWM8dTgsDQpWbWFsbG9jPi4gIFNHVGFibGU6Om5ldygpIGNh
bid0IHdvcmsgd2l0aCBhIHNsaWNlLg0K
