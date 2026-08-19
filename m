Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08B1A9F97
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787167515; cv=fail; b=W4phChhmTxyHHBGEsKZVCqsq2f14uDbW7HDzcHV5gG2om6TaI8ZWeoOwjYCLJjWO60MsHN3BhaIQMHg66hpQiaW7C5bFodAPZ34uvNK9nQv/uq8BuxX6rU38CSFUe2Zgae7Um4C+wRDdrJiswEylahPg5yjhhU+jDItHjb0BeFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787167515; c=relaxed/simple;
	bh=CCE7gO9xFYhwk3vIGPI43SvF48gxPj7OknS6pcaQbc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aMt7cd4Pn5CbVMNU4EQZw/uUWIl8uQkm6WBGknwpR+fzzXSki9OKH8j/AJD5AkWY5xBeOHON/rlReb+WDXHzd0LjkBC6M+UMChOsm8Z18USeWutePwZ73jeblj2z5KpOJa7lUQyMc+pgLlJ6zbaT6nqkhSa7DVrrxnp29mykf+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TuFQuXwd; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TuFQuXwd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKD3cfw3Pl5JrhzaGV/7eKcNJtHs2+7tqABTlNDLJBXZ9Io2yk5EV58iwOQhZljuiG/ZqJjkknzoL9ZIvGH/OFaXtA3WGvnhnF4Xc2MKKZmWngIAvWo34qB0PJo9WkPm7p6+WvwzlIjixw1L2DGyLr85t5XZuSQNUq6NCAa8fbid43lHsUI8ZutqxONVfmX3hYy1nbBuKUKIwLDIxhUKMWLvvOYkHuSRJpCow2PxFupCsMUK7bUe012dywTtT+EBWRoo67k9nUAY3ugRZ1POIjQXVybYyu92DmU6PSH8iYW50O4rYgrow/EKgsPeQwcI6LqDbKioO6YYqzl4GGA/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCE7gO9xFYhwk3vIGPI43SvF48gxPj7OknS6pcaQbc8=;
 b=khTGBcKT39F/z4RON6/iS/fmC7aC7Wsj2w4AGGTrhFyvgP/foYgKu2sZ3+ML2I+23gnKBG7YK7S/4/jh7bUNbiRxS1nqH8xY1M2vZrxp/54GRS4NgES+FF7hPoRmr8+OhM0isFOB6/D7E7SD08sKdyzDwj0tr5xsJGj/S05dmYFeat3cSZcnn/0nmu0RzIPu97JozWX++A+xcNxlbE0wHxhS+mFP4pHwZXr+MUEPloe1oQ0nEBe+sGUgoMJ0I8J6cFtaph2dMg6K9sZysPj3Xpv/Gs7mhi0+alZ02+JonEHNbBG6jjKCTfOlq3WgU2dJ04fmwuhU4I6r/u2lnjXNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCE7gO9xFYhwk3vIGPI43SvF48gxPj7OknS6pcaQbc8=;
 b=TuFQuXwdmGZbhEdKWFqSzOSqPnvaaVMIySPmKB8trPuIKDN5jDBmrv7iu8zRnzw72qni2smpj8BmA6zo95TvXSs1RasZUbX6+I0p6pMs+/6+6V63HSj9Z7f/IVm/JARKSgcOwCxkceg11hnSIk1AQNqwY5iBnIAPiHaRaQzx3Y72djoUhjnAEbzy731SQeXyNjpYxQm5s9CJTMyvxUBhLlFK/BT3sA66QfYVDdOWiJKEtS3pE9ZHiPu7VJjzLFoDeouUmSti7V8RfK40r8AjCauoHjAJTXpDRrqGWCMvVWG/Ux17zhlgEOr38tmxz9pgufs0qQP0iXpQ6Midpj1d3g==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Wed, 19 Aug 2026 19:25:04 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:25:04 +0000
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
Subject: Re: [PATCH 00/27] gpu: nova-core: boot on the r000 GSP firmware
Thread-Topic: [PATCH 00/27] gpu: nova-core: boot on the r000 GSP firmware
Thread-Index: AQHdL44m0hQIVwgZwkyAQx/09YNcKbalwcGA
Date: Wed, 19 Aug 2026 19:25:04 +0000
Message-ID: <b50e08bcf867d7d61ba61c7ee3468bedacb742e2.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DM4PR12MB6592:EE_
x-ms-office365-filtering-correlation-id: c97978d1-ac82-4bc8-ca95-08defe279281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|56012099006|10067099003|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 cIUOIjPeeVLdenxNsWBQZYWXmO0tDFlpT+TdKiVFxgRcPtnddFJFRClYQIBH+pQVT7HShIeSIn93L6NbamXLub4yWo73GI7R0f4OoSxfUDQj7DrUqATHIbPfJLFfv3ZcVF6xqRxqPNLWbiz8Jr83cp/QhINWVvdl+HchYsNoM2g7w9QdyRF9Ha4LiO1EDU6EtRR0liyLAMgfN6mRLb0O0hji68/snbbNUfBQpDb/vSZifClQNkqg22mgwFkhmg0M/F9XGnXZy3ErO6mgp9pLLDYXJtLEQ19G43wWQwD/JdC1Qx4Y2ibGMuIcSPrFPDMqJmG+KBVwTklCaF1JXQdDLT2XSQydnbUmz8zH7ovMOhLxtRUGWSuRnIQYmLb4L2gZ6MCdoaM8DOqHAu9dEFRAk0HvR1AkIMuiTuZjN4jPMWr44b02JWFUo9DBNXG7CCY73s7rv5cL9Egqx+7P173eTzRF9SHOp1TAAc6Z/D86nN1NtIP6OUyzwJaW+IeTsAaG/HHaW77/m+ajkEkYQXWc9y5dqHGucMGEHGWsbWcdSSwD0Enqr4+PB6mUU+JdIbHLPVgmvgUnO1G+lwbqmszsYvhuat6PC5fksYsqPOZLDgzZiFe9pp5He78ePtyPDfVwglUpPaPfmqO5ef/nDu8QI6AVZZzeeImZsnUhgoDsO7YO38jmUzsFIsdBvcpf/29Ste3HH5TtmqU6gRR4SMOK5B8zTtksDzrDwIyVG/hpKCU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzNlbHJSamRrd0Q4akVjajFMV1UrNitIeEQxM05hdEpvUC85QWRNNDZtamZX?=
 =?utf-8?B?ZmZCYmtmeWREUnY0ZXZmM0dyODdJbnZwNUdCSmd0MDhSSE0vOEVZNEZ5bUJl?=
 =?utf-8?B?YTEzOEVXWUZBQWo2eE5mbE1Qem5KeDRuY0NyQXViem9lL2RTNXZFcHZNTkU1?=
 =?utf-8?B?dFlDblJoVjRTM0tuY2g5S0ZnclBjNVZLZEVnQU5ZUFdVeG9Sanp5RGRBRW1t?=
 =?utf-8?B?andLUEU5UEsweWJ0OVdYczNQNWxna0ZMU21tTFJTc1FDT09FbFJjU3NTZ1Y3?=
 =?utf-8?B?YkxoWXRKRGZYVEZCQzhpUG50cVIxcjhtWnVTTmk5QmJwclFkc1puUm1aRTVW?=
 =?utf-8?B?MERiSGpuVnhDT3cvSTVLdzA5Q3l5VzlKdWp1djNVeS9rYzMrdzB1S01yTFdL?=
 =?utf-8?B?aFEwbVdwZXpvK1VsdGRzZmxzZk5NUzd0c0hUTDhhNUJpZmMwWlg2S0NzMHl6?=
 =?utf-8?B?ZFc4ZWMwcHZzb0pUUGRmT3hFUEQranRDTXlyY3BLVWxvRzlaVktwYXFjUGlC?=
 =?utf-8?B?bTBkYldweW8wWEVpcy9vdHZrbnE2eHllOHVQcGYvbzZVVk5pZ1pMN3VUK3M0?=
 =?utf-8?B?SFZ5WXQ2cC9wQVJvTFlqUXprcnAxeEQvSjR2NkVoMGRWZHFRK1g4N1diYkhX?=
 =?utf-8?B?K0NSSjJnM1pFZ1BnQ0taVzg5bFFUSytZWXJhN2lIeUMwTHpEbC8yV2M0c25K?=
 =?utf-8?B?MkpHKzVVRmVwRG1ib1RoNk5KckwyNVFDNTlwNDkrNTZ2L09HbGFhaU4rU2xZ?=
 =?utf-8?B?VG5ZNkJ4V1lkYzlHcEZKb0NHOHpHanpkUTlyanYxeFF6TnFZTXRXNEZyUzhv?=
 =?utf-8?B?bzBpdVBVcWhpQ2srQ3R4YTMwMlF0M2ZJSW80bDBQVmhZSFR4clFUZDE5TTNt?=
 =?utf-8?B?NTY1U0FWUmo5cWdyUW1lZjk4V3doS1YxYzNEMjFxa0NtWHlvU1l2RXB5djdp?=
 =?utf-8?B?eTVHMXFlSkxLMXNkVXVuajREemhmbkdnN0dwOE5nTnRkSWdrZlNQTzlzNTJt?=
 =?utf-8?B?ZzNjOWg2RmJNeExkcFh5c3MwUklGM3grVkF0UzJ0SUI4dk9Fb0FSd29vVjJX?=
 =?utf-8?B?OExZNGt1QVZLV0kwVlZjdTM0M1EyMms5MWM3UU1rYWxJaXA4cktBaGkxZ3RE?=
 =?utf-8?B?eGhtTG5VK2VTTXBTcUx1elZ3Q0t4bi93Nk5TbHoxSEtmTmlxckZ1b29HcTZF?=
 =?utf-8?B?bW9DYk5keVo1V3I0Q0hWZEZwa2MzVFpidm11clVSd0UwYWRHT2RGenJLeHBr?=
 =?utf-8?B?NmpUM1RnNHp2NmNnWWJkMGZkeVArWm85WWNOeU1XUDhxNWRnbjZpa0FtU1Z6?=
 =?utf-8?B?Sld5anhnWE9DRjNkdnpRdEZ4RmF5SmovYThwczV2VGNmTGpxYkJ6YXBPYWQz?=
 =?utf-8?B?dWZEcmZ2NnY5LzR0K0ltc2tSOXF1VnRjV2tGa2dJRzR2aTNHZDZIcXllNUxB?=
 =?utf-8?B?Qyt6TjlicGZkdXJIQTRrMTRsbUhGUDljbE14Njh1M1NIUE5PbzU5MHZXZXg5?=
 =?utf-8?B?UGZEWTJBVXNPT1I0YXF1WHJVWXBla0g0M2R4VU5CREpjOHRLaUZQMzdmNnRk?=
 =?utf-8?B?dWdvVlROYTZJRjRweDNtSW9WQjFzeEpXM3dhc2ZsdWtaUXFTeGwrSXJsd2Zl?=
 =?utf-8?B?WkIvL2U2N0NQQVN6eUE1Qm1pQ1ZZcnZySGpUK0J1MXllOWFkNm5PZ25aQzhS?=
 =?utf-8?B?V3cxVjJCcjlVR255MGZhQ0FZZW15VjdGOStEK1hCc1lJcHFDanVLWjVxQU1W?=
 =?utf-8?B?QjJNSXNJY3FsbGMyWmVNcXlBQ21mQi94V1RqZnNvNkwyWkxEcFhueGkvc2xs?=
 =?utf-8?B?L3BSUmNPQ2pZNFZFQld5cnZMdzRPNys0RXF4M2lnL1RGeVZtSmRrcHZUM25J?=
 =?utf-8?B?ZjBiRnBsSDd2UHlmWnVIKzZkSnJNWDZjd2dUV1BnenNmeGZGZ3hXMDVzSWEz?=
 =?utf-8?B?WWx4VDYwRnNsV0xjNjdhNW1aa1JJeVYvdHA5S2tFdkZCb3V2dDY0WG9yT2dp?=
 =?utf-8?B?ZytHcE13YjlmbEpVR0hvbi9jS0NjTGpPbklQSVNsYlVRdXVlYWZnenRoS2l5?=
 =?utf-8?B?dGtKcmU1anE3dkRJVFpLN0xITTBLSWlnY3doTVBFUXRTLzA1cVdmRVJzMi9j?=
 =?utf-8?B?VGFmVjlxWHE5NFhHRDQrQTlSS3hJbGNUbW8yNjk1cFZ6Y2Mrd2lPcWR0S21p?=
 =?utf-8?B?NC9MZGtLeTZaTXBzVkxUY1htZlkzaGhLdFNDdWVjZElHOTQzSG5yK3V3ZkQx?=
 =?utf-8?B?ZVZselJ2S2Z1NUZ6NmhTaFhKS29oY24wamdiUk1jMU1KRVJpV2VKN3pnTVlD?=
 =?utf-8?B?UzBValY1bndtRENZYUFERldYMUZ0VUVBRmRmM0pDWjhHdUd5d3hCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AB6E8924E4DE347B0BF05C09515554A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c97978d1-ac82-4bc8-ca95-08defe279281
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 19:25:04.8152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Siv0mvNGRbrD7QJI0nc/ys30b/xuud9aCaGnWM6IDHUQEeUYeaNZdhWcVk8fC0WsbVI6gijaNgYfEGS1kPzbVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE5vdmEtY29yZSBib290cyB0aGUgNTcwLjE0NCBHU1AgZmlybXdhcmUgdG9kYXkuIFRoaXMgc2Vy
aWVzIG1vdmVzIHRoZQ0KPiBkcml2ZXIgdG8gdGhlIHIwMDAgZmlybXdhcmUgQUJJLCB3aGljaCBp
cyBzdGFibGUgYWNyb3NzIHJlbGVhc2VzLCBzbw0KPiBmaXJtd2FyZSBmaWxlIG5hbWVzIG5vIGxv
bmdlciBjYXJyeSBhIHZlcnNpb24gbnVtYmVyLg0KPiANCj4gVGhlIGFjdHVhbCBmaXJtd2FyZSBp
cyBub3QgeWV0IHB1YmxpY2x5IGF2YWlsYWJsZSwgc28gdGhpcyBzZXJpZXMgaXMgZm9yDQo+IGVh
cmx5IHJldmlldywgYW5kIHNob3VsZCBub3QgYmUgbWVyZ2VkIHVudGlsIHRoZSBjb3JyZXNwb25k
aW5nIGZpcm13YXJlDQo+IHNob3dzIHVwLg0KDQpJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIG5l
dyBib290IHByb2Nlc3MgZm9yICJyMDAwIiwgc28gRldJVzoNCg0KUmV2aWV3ZWQtYnk6IFRpbXVy
IFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQo=
