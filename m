Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879E51C35A
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753358; cv=fail; b=ViPTSUL7YuNB5zFN0ks/iVTjMAOjiniqvXmWa9YTAFhzJ57qyX5TdvKqlExbiRjCdltbxzpkQnCJo8gmEl0VJ/c+DH5kaO4o+5nPyPP+ni86PjV3kZ4eORA/CkWWPUFtgpDKTAo5v3wBsmul6rqkUaWwSzmhixD7OIxb+XxDcQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753358; c=relaxed/simple;
	bh=Mv8SAKeTe8L+CftyxPQAmxwcJtmj4XvmThX2Gxtygk0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PktERL3IotnL+54uh1vlEyzoNXdEU9saKkR3khiIsqvG2mTelX5xhe5//a1I7MvLjd6XFtqAgbot7qJKV3e9/Rz1mm+Cbpn2WKVAPLwRYvTiyxIw1O44/IBm/p9KKpK101APfHJqLWeC0eiFJpHOhxZtH0YVYor6dBQvcOy5A88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JeQTMtPq; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JeQTMtPq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrbShLVTT3DwDbwJVJeBdMEqUnKQpyjBydgNOQEshC+6flI97/QirN9K4hIOhu0gT/8fU/OXus+BpU0tTAw059DWO4grjrLMGFNKhpGndl/P+bICg5kUcF8pEn/6+Ddx7rVNlaG50/vgDQS7qXk5YOZY0uVEcRZUBBshMJxWhUDZm7sK9VLWdfscCrijbvkLw6wikDXAPeUVdDfAA6kjH7Kf+kH+hqrzTFt88tThrQyF6pvRAcxX2HNcQK1usG9UTMA0pZckIHnaATNKa+fe/FQDJBicTKMMHDOao5iIJMlsrFYaft+85AYrNw6GQ7Mm4BOhS6XzfOit22cFGc9wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv8SAKeTe8L+CftyxPQAmxwcJtmj4XvmThX2Gxtygk0=;
 b=GUum8FimJqTXi8/jDL1aDjFnilf1b5vcJolbGjdgFhei23BaSJmRP0u4bsmy7vQfncsSBIppViKFNtaZAQ5q319L1zl/bn+rGI0i+j+ilY5fvz6ic6jNCYX4Mew0REQMggXoCDyMQq+jeMYO+mZW1UlsBydkXgYAjE81IpITpZuosDpNhLj28O37Rvv3HLw//SZzdMQSsOi1vXH+2Wu+1oDd/SB8X6tzYVmM5z02290ZmkKMok4WOJL+rjs85bl+0bxvY+9PMJqeSBk2uyP6wxDSIhMjI3hieBIFHn4O0OpHYGBI/Tkk8dKIJGMERHMNRk4fJP9LL7gfF/EIRL9CUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv8SAKeTe8L+CftyxPQAmxwcJtmj4XvmThX2Gxtygk0=;
 b=JeQTMtPquxpdBRyeMv9Bci43474Y+eH7ZGFnUWgIgTZ6bo7OvdwRBL3BcpmhhvYkn9GMMeabQjqJdo26kFV2UYTNvyeAUi1tzQ9MoW0+QD58hKjqiZ5ZKaYnXs9sbYaL6DMQ5uDPad156kBvuCK8zfR6qyWF6pIiLkw+xCp3SUJ6JUO3wYODlbuDdNc9KNe5lFKguovitI+nk4G6IDDcjMbcWL8HEjU+jVx3hQIPd4hETJPl9iSB7LxmPCGeSy08uTepvfLwn1doEf0NnG83MVWSvEiJjBBgvv1Dna6BLVHyEbOItsMjDMVlVeCOl09wUx0GepdQ59woSGoDz2OWxw==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 17:42:26 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 17:42:26 +0000
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
Subject: Re: [PATCH v3 04/33] gpu: nova-core: firmware: add r000 bindings
Thread-Topic: [PATCH v3 04/33] gpu: nova-core: firmware: add r000 bindings
Thread-Index: AQHdRwoXvmJEnKY7cEmsXAZppr6EM7bUnA2A
Date: Fri, 18 Sep 2026 17:42:25 +0000
Message-ID: <576a2ec09fcdec7d3229bb30eac433c4d601e5b9.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-5-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-5-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SN7PR12MB6911:EE_
x-ms-office365-filtering-correlation-id: 8b1249ac-19f8-417a-5030-08df15ac33eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 +IU/Exht8+r/eqUVxExqlcdRrYTFQNspF7cEgZxdoZc1+Fc2sI3kFYfw2PXmXcTTYaT8Vn0ccYRXKhYulCZfUTs3Xv2RRzEjdpHZu+fGqcouZShsmqtR2fuFz1oPgriDv/jyPLCNFVc/cUQtEF+KVv3FOnmH7Hk7PeVmiCUNrO8KC3Y2lU7JLH+DaY7KAPd1yoVQKyt2UCUlxDQaedhMvgsGdF6poEPa008IN/K9tbrEpznc73xVPXYVkdz2hoeXBI018JWeXW5EqEwc7RUS9d9/ixlix+M4I4EQfL28WR3y3mv7jGkKQoUbaZt4pETzhF9IqS5I0HUQZ54JOke9BlRWp4zvFep1E3UThSRVhYJTlA+bUfoHViMUVXVcrt3yaJLp+TNQoT3sQ7A82qvQkYMy4rlHdEzKyNyug6i0675KkwU5am6hH0j3BtmejSojoLg61resOSY/fISm6t19Y1lZuInplSxfXMtOSuPd+6V8rlrrZgNyZtojjTbVw9+zmsUiUhxbx+lzBlpbz/h50m5Cz6EG+3Jqq7A2c3m37/UVa8UpqMwDEoU2MdU4yazQLQxVoHEJRpkVjiW6OmEUAq561zUeVz6Y1gAw6bNZBtdbsgAiRGIB4vHY+IvrLUTzZqxoT8Cog0RZdTfPoRrCshp6IAYJuAPY2QceuTMXNHWLaJo2K9EoT+zR8Vip5qfjN0ZuJjPgrJS7QQ+d5+zEqdZoFa4axaNjQxokQ9hFnPw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjlaNWthbWFqUit4dzBSSTh1ZjYyaHJGdWVhNWxBaFBHREgvbjYzd2VieHRC?=
 =?utf-8?B?YjhucmluR0lXM1RGKzMwSWhZRU1RbktTWXdJb29pR2FBc3craDkyZEt0ekgv?=
 =?utf-8?B?T25uNUNFZjE0MWJsOW1yMDkzdGxYMmo2cjFNbDRkaTl0TWRxNmRBV3ZpejNi?=
 =?utf-8?B?VGp2Z3BubmMrbHBqNS9Fa3hBZks2aGVpaEdFbDNYMWdvQ1pjUnNQejlPYXlO?=
 =?utf-8?B?MGkxYlNsUEhNa0FTaHpESENQWUxIMS9iVE5qbjcrb0psKzhZKyt0Wk9NZmNM?=
 =?utf-8?B?WUluWWZHNkNNbFhGblBPZWYxQXlGVUtFcGc4eko1bEhGVytJT2FOQUIvQzVT?=
 =?utf-8?B?eG9zLzhtNlhFcWpxMjI5RlJNdVVQeW9Md1doeDB3RnBXQmJlVzRnL1ZYWHoy?=
 =?utf-8?B?aEZuNE1ZMEF3ZVZRcnh0MDhXREdGWUN6ZDkraVpXeTJCaHB0cFVCUnF2TWNT?=
 =?utf-8?B?STVuVFNQeisvSTkrSmtXdDJ2ZnpQNGpCNmVqb1ZwTGNWRldMbWVvdjI0dVJz?=
 =?utf-8?B?eURDVjN6enEzSTRVK2IrRUIvM3k1QmNWRG1Wdk9KaVFUSVZHS1RxNTlLVFVJ?=
 =?utf-8?B?VlRibkx0YTAxVVdGNUJRNFBvQ2h2bHMyaVNUUThEek1QUEkxeDBKbXIxMWd3?=
 =?utf-8?B?SGJVMzBRZlZBbGtVVVg4U25xeGRHZmdHalpaQmxQRDAzV29KMTVQRGc1Yy85?=
 =?utf-8?B?b2o5WjhjWEc1bUJLS3kwOThVMHNjUzlZY29DT00vQnVnOHQ1Wkd5YlJ1MGJZ?=
 =?utf-8?B?QnlDK2ovTWtycE56WHhEbkFsTTRnUEtZWjY3a0cvc2ZQWjdCandOYXFBR1p0?=
 =?utf-8?B?VUNxNGw4c3R1TG1UbWVZTTg0eTBLbWRiNVQreEw5L0VTN0J2WXdZb2x0ekww?=
 =?utf-8?B?b1NxcE5tK3paejBHb002SDJuckZGek92dW95U05mcjQxbUI1Y3c5VUJjTlVv?=
 =?utf-8?B?WUw0MVBLQ29XdHRkcG0yR2g5a1dtNnV1bUJ3c3ZwSzZUN1BKTHVieFdJVnBl?=
 =?utf-8?B?UHlPZTNmUU03OE9RY2FncVVtQXR4ZzZKaUlMZ0pkd0N3U2I2eUlDOHUxMW5u?=
 =?utf-8?B?d3JaK3ZZY0h4ZW8wUHhvcVp3d2hNZlVHWnZ6VkJQQVZEeWRDR1BsMlR1SjNy?=
 =?utf-8?B?OTMzQkhRWmR0TERydUZhYmo0NlA1U2NYUklKK2hkajVZcVNUNkFIOFExS0Qz?=
 =?utf-8?B?UjdUN2pSbnpQdTY2MFR5WjdDSGVsanV5QkgyUWRkaGYzUHdMekRTUVVjSHFG?=
 =?utf-8?B?T1MyRVpwbnhranFHUTBZb0JXcWJheTl5STIxMmljbEkzbW5hTkhWL1J2OFlz?=
 =?utf-8?B?WEpCTzlpb3RDdTg5anVRQkM3VmFOQXNMVENWaE9BSTkxVGZIS2JjcTRCTndl?=
 =?utf-8?B?OHBDelhNenVhbFFhYVBybnk5R25kMGhnUEl5T1BhT01HVjBQcUNpVDRHM1ds?=
 =?utf-8?B?NERxQk9BTWFETU91aGxpNEZPbnczbjIxakkrNTJoT0FTUHpyWlQrZlAyMVND?=
 =?utf-8?B?dnM3eitwK21uUDUvS0ltcmswdXZpNlM0Yml2bVFYVjNYSkRFR1czdklhYWVV?=
 =?utf-8?B?WjR6MG9KajJYVWI0RGtSMUJFWVhaNUYxL0F2b3dlUURiOFFpMEF3Qlo2RFBZ?=
 =?utf-8?B?YVdzdmthbStWZEJ5akFNVml0OVkzek45YW9PTWFTaXB2TWRXQ2FObmpVMlBs?=
 =?utf-8?B?dEpnQ0NpMEFMdS9BNlJTT21Bc2w0bjJoNS9HOVpITE9YV3BCRzZ3bTlvUHpS?=
 =?utf-8?B?UlMreG4xUG5kMkZhajR3T1l6RFZIaGErMmpzTXpzcExBaHkyV0Jsc25KUy90?=
 =?utf-8?B?cnlXcndhcng4QW9RSkt3YXI4NDVpUXFsVTFoOFFSKyt6ZjlGNHl6WGVoa0lp?=
 =?utf-8?B?TXdiZVBPKytKZVpJR0JuMFRBMmN4SFhGMEdlWjVwVGJjZUJteUdBRFZjZHlN?=
 =?utf-8?B?bnZGa05NdHk3RFlyamsvdUtCQkFRUmdTRnBTL0VxQ3h3S0hVQk5adWljV3l3?=
 =?utf-8?B?d1FReTBKQVM2TVVNWDhNNTRQU0NpcCt3Tzg0S2Y4WDBkRlF4Y09yQmN2a1Rv?=
 =?utf-8?B?akxNVFFub0pqSVJNNXVYNTRIMFdpU3RlemJLZWpRRm5jaXcrK0dSRUV5T21R?=
 =?utf-8?B?R0I1NFpSVjhJQXMxdXcyU3UwSlA5TW84K0NORkh1bytTelh2L3FMQUxzYjRR?=
 =?utf-8?B?RmgyWXBFS2ZucWJBZTRNS0E1eHJLVDl6THBqTEZQSm1MSUp3Znd2VjNuQWcv?=
 =?utf-8?B?emo5OWJzSHJSVWtuZ1hScklqNWpuQnhtOTVKbzVKNnNPV3RVUk5CNFg5UEhG?=
 =?utf-8?B?dHhYVWxZN1I5WFd4TTJWamNCcFhuT2ZlSytjcElFcklTdGhXd0tiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E40F9C62D66502478B89639148FA8174@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1249ac-19f8-417a-5030-08df15ac33eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 17:42:25.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qk5qTPZ52pMg1KjGNsIcS6lyNY+JwhIDbwAcnD4MDVwbejT08ydUB8zvNhVCE/sFRxrPkIRZLVWSbXOm61U6YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE5vdmEtY29yZSBib290cyB0aGUgcjU3MCBHU1AgZmlybXdhcmUsIHJlbGVhc2UgNTcwLjE0NC4g
VGhlIEdTUCBmaXJtd2FyZQ0KPiByZWxlYXNlcyBmcm9tIHI2MTUgb253YXJkIHNoYXJlIG9uZSBB
QkksIGFuZCB0aGVpciBmaXJtd2FyZSBmaWxlcyBjYXJyeQ0KPiBubyB2ZXJzaW9uIG51bWJlciBp
biB0aGVpciBuYW1lcywgYmVjYXVzZSBlYWNoIGltYWdlIHJlY29yZHMgaXRzIHZlcnNpb24NCj4g
aW50ZXJuYWxseS4gVGhlIGRyaXZlciBjYWxscyB0aGF0IEFCSSAicjAwMCIsIHNvIHRoYXQgaXRz
IG5hbWUgZG9lcyBub3QNCj4gY2hhbmdlIHdpdGggZWFjaCByZWxlYXNlLg0KPiANCj4gQWRkIHRo
ZSBiaW5kaW5ncyB0aGF0IGJpbmRnZW4gZ2VuZXJhdGVzIGZyb20gdGhlIHIwMDAgaGVhZGVycyBv
ZiBPcGVuDQo+IFJNLCB0aGUgb3Blbi1zb3VyY2UgTlZJRElBIGtlcm5lbCBkcml2ZXIuDQoNCllv
dSBzaG91bGQgc3BlY2lmeSBleGFjdGx5IHdoaWNoIE9wZW5STSB2ZXJzaW9uIHdhcyB1c2VkIGZv
ciB0aGlzLCBiZWNhdXNlIEkgc3VzcGVjdCB0aGF0IHNvbWUNCm9mIHRoZXNlIGNvbnN0YW50cyBt
aWdodCBjaGFuZ2UgaW4gZnV0dXJlIHZlcnNpb25zLiAgVGhlIHVwY29taW5nIE5WT0Mgc3R1ZmYg
d2lsbCBtaXRpZ2F0ZSB0aGF0LA0KYnV0IGl0J3Mgc3RpbGwgdXNlZnVsIHRvIGJlIHNwZWNpZmlj
LCBqdXN0IGluIGNhc2UuDQo=
