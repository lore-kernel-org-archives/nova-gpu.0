Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F96126BF7
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 01:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787189458; cv=fail; b=Q8yLlJTiFIs5tt9dkHRpzAvEtMI6Ipt3nj1Sz7Wb2p0T8LtjQ9KFfPdNm7dHXb7nlCUKgagie8b/sO2KMKGitCxieEJUVXClGBAgbmBL2Gb9t0lBPvKK69HJ0+MYw4EWFPeKtQ8CXNydo0J4wDgKcin1GLDaP5dzfHPMep5vgoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787189458; c=relaxed/simple;
	bh=C8Mo7cH4r/8MKh8JhAtFgp4btN59CZbgso+Ni/wVmUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tAcydIGFXt96ebss6axos+xo1TPoWPDAPHHuHHIR2u9zqmzRd4KpA7Dtd81LjdVgz6Y6n1FPAbAlScJ/3ZiCLk8YYz2nRV1mdbThZcl4VLVqFEQW6jYk+3YpG9swiG1yfG7Bao3g6lz/zjo7jAl3GJMM5BVoCTXFX0rAee+B7WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mP7wXETu; arc=fail smtp.client-ip=52.101.85.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mP7wXETu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiO+uYV/2mRmaBGkEyjYfOQcOsU4ID7TcnRYD0DfAi4O+G4zt4Ye8ilqV5V04hKG3Ujo3/uDzVQxCzw0WKk1+deNV/za5rerc/o/axYSvE8z2u982WoZl6eJNCVtOLfQKmUU5b5kRTlmqU/L1t/C3pEDA0wkd8zZ2NYFCs3ZgfDST+5KQiwKXJg5gUoXfvNp9ejBgD7BELkcr6bL5tiL6If9tIjDzDzNTUsNY/uHrQiQMxcsv7l0lRPxpc2gYf1SUy8ZJ+I/8fw4mD6P9WmsJuB+JQ3/za6P+7NUY6VTPet5WwY8U9L6Z416wzkSNt7HZwLKyD3vZCkzpvzA60E3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8Mo7cH4r/8MKh8JhAtFgp4btN59CZbgso+Ni/wVmUg=;
 b=ZeAYFsIBZ4dqAcMV0dkM50jPtp2WP4f3ajcfO948F/y+RfL8kjIW/GMOdL5O7OqwcjAVs9Z2499q1jDgYVhwXlThZ8RdJccP9Y2OsLoMuejhNaogCidR57/PB1LEcjVu2Xya19PoyTOSHn2w0OYMZuKpzxOHjTFE1AM6knc3Piahiyh1A0cW9E9P+eg3DDfHQLLeaxug8WcVBcjyp84PyC0FD51S1aD3xk6c6XsltAbgl8iPXQW+hLN/RApEbadCUM8NyvqsvUCD8uTeR5EE4stalXglmPLJ1pHlvW4gL97UnCJfZhZstkUyl3HEkE6w3pULxTrOn6HajnJiedSi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8Mo7cH4r/8MKh8JhAtFgp4btN59CZbgso+Ni/wVmUg=;
 b=mP7wXETuV9HgWcBVc9/VrQM6ZFrL13KrjPHLm2wudPeyZeb3ZbQYbETjTtVW+so0vlO3VIciW+PF1OJarOviec5vy0sDz0iMBSHDtwBuTPgtLUTrc5WNTVylMWKbsqGCTY7Ge8EYlgwU3zsm7fXW9+5Ujfq22kl3Q3I43LZ4jBOdkYRqTzwO6coJ/b2TdrLzC1M5e6n2CJQz2KobJgCqvLtSNxLQBOeT5BEAlikJaaon+LC/4MTETnuTbHwTxttBOmXT7ASOzFhU8rb1Bw5OAQk/jZzLonpkZgBsSAhBsb+kLkSYG18v8rkrqFQx7QpargmQAI3g7de6dUKAbSg+/g==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 01:30:52 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 01:30:52 +0000
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
Subject: Re: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs log
 buffer dumps
Thread-Topic: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs
 log buffer dumps
Thread-Index: AQHdL44sFLNDJvTpNEm1ZygwAzYtB7alr6oAgABv7wCAAAhcgA==
Date: Thu, 20 Aug 2026 01:30:52 +0000
Message-ID: <5b44cb5bf7a1333a168ba9e390fe14cdd46af093.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-10-jhubbard@nvidia.com>
	 <a1160e753e4514537e322c542930fd0652fcb526.camel@nvidia.com>
	 <e94adf18-ae8a-4c09-93a2-fe406b704057@nvidia.com>
In-Reply-To: <e94adf18-ae8a-4c09-93a2-fe406b704057@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH7PR12MB9175:EE_
x-ms-office365-filtering-correlation-id: 022ad2c7-0d53-48c0-0d77-08defe5aac6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|10070799003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 xH/BKuS3B75fL+DRMOBg3iGI6RRdAqZa4O3Rngs0Rfe3fOGNZykruKVF6mQRkPX9+5/Mxl9aUc9agNy5kz2o+Zvdr3z6OCbp1FgF4FQz2h9VVP8Sj/YqLThvRkYJcz/5xJpozIDOU+OR1F6I8D6eD1wJytOwqRgR0/CMokaXwdJMty9iPJb5mjoi2ejBSxVYsZZaxyBMw3RGS8dWMGMdxH9XAN1IEhGI/WpSdLoLcW8+X+epkPug9FWy51NWveSRv7kbdgGFguwRQAi6SJX+css+spP+BtkPXMM9bh8XvVL6dvEv/lA2ebcodvq5d0sjYveEk2ibCKEGxqvHEyTN3Ck6MIE0MrpYRV6UkB+ouvGIstq+bzpa1q1Ly2hK+c6zTrBa4OYGynfgGjRboHHWOlqWcmOmVX4KSKxZSnDs76Sj+iT6Ta8+nFQgmzyyHoaCeo1D6onThIU1XUZFrh59OEtajENuSLNF3m0dlFIC7qXx2z05Ey89og62VjZMxAcHUL89mXtezN3RqsYQE2jNS0Ntp99ZTC1jKL4NyKjmZJ9sO03aW/XjxdmYVj9AH+HHN7L8BpeQmIkySnQGD7jLQPu8Dt1g0jjHH1GE2bUOd8QBrzrVpBWNhr91n//MuZ92Q3d3vN2NgpBH6lbhNrWveh/pitOfDGNbVrYQkQQZaMNk1hoX4r6QgbDeKfYoHRqb8sQdtZNRBreifRXcsTDlRHm8owdzE4QLW1qyW/oS2Rc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(10070799003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUt1aDlSc252N2RLTnIwNDVRY2V0YWtVcEp2TFVsTlhXWi9LNmJPVk02Qzc4?=
 =?utf-8?B?V0NBcFBhWEVzZWN3dmc3MFQwUGtIcEVTa2ZqQ3pmMStSUFFpVWhYOExyTTJj?=
 =?utf-8?B?cy9DQjJZUHZWeEd6eS9jb2U2UHFWbGVyZCtaVGhDVVZleWNDbVJZU2lmTFp0?=
 =?utf-8?B?NjkrT0o4Vm1YcHhjdWcyRStNcXJyMkQ5NC9BNTVzbERvaDIvYWJsUzZDdWN4?=
 =?utf-8?B?OCtEa2FBRldrT01VejdOeDE5NSsxaFZWV0gvTGlBU29reDNWb2lnVEFVcVc3?=
 =?utf-8?B?Q3BRbll5ZGltOURqS1Frc2FPNDRvbVlkTk90WERJSy8zcmdxR0h2SGxZakc2?=
 =?utf-8?B?VnQwOHlhdS9DeFVKTTNVVG1SdVAzSHJtMkFpS1V0OGlLTzY2WWdnK05OMzVm?=
 =?utf-8?B?ckRzdlFtREU0Rjcra2o4QjRVWElCcVdhS2JBcWZqamh3WS9ZS3E2dWtHUnA1?=
 =?utf-8?B?OGNrcnh1SDRTbEg4Y3VibklwdGVKYXJ2Q083bEpUc1prRUFpUGF2bGpBMkpr?=
 =?utf-8?B?UWFtRXBQbEh0VkhMak0rdGNpVmE2QjNkbVNkK3MvYXhnbjJNK3BlSW5DcXZB?=
 =?utf-8?B?ZG15cmxUZk1CUGppZzFwN0FsSDgzakZVeXhpOU9kelB5TlpKRDcxZ1J6ejdv?=
 =?utf-8?B?K20rR0FVeEQwT0hoZXVPZUlMVXlFeXg2Z3dIQ3RyMDYvY2swTWhOQUJKT2ln?=
 =?utf-8?B?VXpsUEdXa2FiRnE2ZHcvbnEvSFJiblRXdXhFM0FtMDViUFh4dHNKV1Y2dVR6?=
 =?utf-8?B?U1BMSjhnaHM0cjNVV3oxWms5cGsva0JnbzZFWEEza0pnR2ZHK0N2N09IMmZO?=
 =?utf-8?B?bEM5ajhXZzBHeExhVkM4UzVBamhZb2dyVURPcm0vZ2ZZWEVVUnM4TzNkVlFC?=
 =?utf-8?B?REowazhTNDNlZzcxS0dJTll6aERhVTV4MUdDYTI4Q2l2M3g4bzhKWTZiVG51?=
 =?utf-8?B?Y1BmUUxtTEw0dDJ2dHVEM2d0UERSWWU5OGE3Q1pwcnU0aUlkalZoY2NRbmJi?=
 =?utf-8?B?MFlVVFJpR1hPNzRJdUR5eWhPeTZXa0N1R0k0bWRKMFVKTzV0ZDd5M21nMm1H?=
 =?utf-8?B?ZUU0NDg5ck0ybG1tYXV2QXlxMERrQnA0eEhiZWk4WThLT2RpSFFWUkJPcml0?=
 =?utf-8?B?VGpqU3pDWkNYdGRQRVN4S0FiRnlKd1dTUkFLN2M5dFYzdXFsNm5uRzMzOU8w?=
 =?utf-8?B?ZkRrRm1aZjQ4UkR3djdlOXhWc2JkNnViVlJ1Sk4vbDVUN3JaTjRaS1pXb1dT?=
 =?utf-8?B?aUVlbDJzSUY5MFNNQ2RTai82UkFYbS9oTktmemhFa21hSlAxTVB5Z2pvaDBm?=
 =?utf-8?B?MjRIOXYxZnJZKzZnQ1p3bTBkMjA2MXJDVXdNU1dBcm1lalJTRmZzKzNnS2px?=
 =?utf-8?B?TExTQ1drbVdpQXBPd1h4MDFzZ1l2T0I4YjI0UGc0ZlhSRmtONk1RV3hVVmRR?=
 =?utf-8?B?cTF1b1E1Ri9BRjI0U1VZMjQ2N2pKM1M3NHBUMW1nKzBzc0FXRzkzaXZnUGxh?=
 =?utf-8?B?bXBWTzh5TzVWMEdBeUpkMW5NNVgwWER0eUNTNXBtOUVwWmNia2t6aGFGS0xH?=
 =?utf-8?B?dUF3UU1JTDZoZ2hJSzc3U3V6MHlMS3RMQzVmZ3ZGYUFITFJCUnAzMm9VYjZ3?=
 =?utf-8?B?dlJpR3BiZnBrS2Q2Nnc5aloydDRNQldWU3BUa0wzdjhDUmFkZERRazc2TTBu?=
 =?utf-8?B?c1pOY1NYN1hubmVDSmNRVmRPTHJQTllkWWZ1bVkwbEJQK0hGZU9laTVHTVFt?=
 =?utf-8?B?SG5OcWhncHYrRk92WXZGdDUvNlh6M0tnMGhKZHhRTDJ2VENHanJoUU9yY01r?=
 =?utf-8?B?ajFkdXlGK3VNaW45NEZweGZsV1ZqdWd0dFFvRlJWZFhPZDhPb2JNQ3h3c0Rm?=
 =?utf-8?B?emVBcHp3bm5xamJhMkRzWVlBVVdNTGpMNVcxbXY4T3pna29LcEh4U3FqSWVS?=
 =?utf-8?B?MWNhVVI3TXBXc3R1QVAvY05sMkY3b3JCampPR1ZNUDlLZ1RqM2pGb1VGZC8r?=
 =?utf-8?B?dW95RFN5TzIweHJnZlcrY1lZS1FhTU5BUFdIRDNQbVUwVTZISjRReVlKWXpm?=
 =?utf-8?B?ckQzUHlsVFhNWCt1WlFiNW1NbHNxNmxpRmJ2NFVwYW43Nk9LT3FSdXgvaERh?=
 =?utf-8?B?Y0IzdmQ1bEVNNS9jbFBnWndyWFU4TlorY2tTeW9MdWp2V0l5SUM2ais5K0l2?=
 =?utf-8?B?UVA0Sk5zbEorcXpkQ2pSZyt5UnJab1pGZ1F3ZDhQWlRaUzY1SFUwMTNMMUtG?=
 =?utf-8?B?YWh1L3QvdmI3SmlXSUppUVlUdE8zRm50SVlIYm9OSW43UFN3R2FrOFhoV1My?=
 =?utf-8?B?S1VUT2toeklQOXVMYWlMdlp6eEpnWVFRbnd5bnJTN3haU2Y5TkFlajFweDJR?=
 =?utf-8?Q?lSxEpePEehF9wYXaExizFlcamNxInCPbGsKYors0Z9Qe0?=
x-ms-exchange-antispam-messagedata-1: AUtmv+F0WhFfpA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D096448FE32DC4409BBCB02E6A8DD9AC@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 022ad2c7-0d53-48c0-0d77-08defe5aac6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 01:30:52.6174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seT98Fjrf7/uGodtsmJSQiMJnTS0ptKmyG2POl7J8uUHmwyMz+ttxN+ff9xEvEbMsbDk5sa5gqzrb5q6hd1tbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175

T24gV2VkLCAyMDI2LTA4LTE5IGF0IDE4OjAwIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gSSdtIGFzc3VtaW5nIHlvdSB3YW50IG1lIHRvIGNoYW5nZSB0aGF0IGJhY2s/wqAgSSBkaWRu
J3QgcmVhbGl6ZSB0aGUgYnVpbGQgSUQgd2FzIGFjdHVhbGx5DQo+ID4gZ29pbmcNCj4gPiB0byBi
ZSB1c2VkIGJ5IHRoZSBkcml2ZXIuDQo+IA0KPiBXZWxsLCBsZXQncyBkbyB3aGF0ZXZlciBpcyBi
ZXN0LiBJZiB5b3UgcmVhbGx5IHdhbnQvbmVlZCBCTElEIHRvIGJlIDY0IGJ5dGVzDQo+IHRoZW4g
SSBjYW4gdXBkYXRlIHRoaXMgc2VyaWVzIHRvIG1hdGNoLg0KDQpZb3Ugd291bGQgbmVlZCB0byBy
dW4gc29tZSBhc2NpaV90b19oZXggY29tbWFuZCBvbiB0aGUgc3RyaW5nIHRvIHR1cm4gaXQgYmFj
ayB0byAzMiBieXRlcywgd2hpY2gNCmlzIHNpbGx5LiAgSSBtYWRlIGl0IDY0IGJ5dGVzIGJlY2F1
c2UgSSB0aG91Z2h0IHRoZSBvbmx5IHVzZSBjYXNlIGZvciBpdCB3YXMgdG8gZGlzcGxheSBpdC4N
Cg==
