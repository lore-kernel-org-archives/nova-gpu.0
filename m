Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374858;
	b=BxO6aKvD3xvEKwz/8RiE7lj8pqzi6aHk/C8H5ldDW9BDf++9SaeaZm1zgYJdMTJEeZNx
	 b5gZfQe06HjFISVNdX5A5F3Sg3JkZB2/2otPFZz+9tY/eQT+MKVdotPUpMgf1zyD/iEGk
	 mLJWdpI45xWbevTV2wT9LTfXLlnKeTXh1xVkNiRd6LXcsFS3qyZsirLmGsq6olwnQcPui
	 m3DkC9nZyeXuTGh8oSImnsvndxd2VcL66zLTXLjDRLnjrBkKlbXM3nYudgYotAlHLhR65
	 PaoGpWmGKypOjyb8AUoTRYtOIjAV7PNtrG2shex3HBnB+Xl3nzUMAW1xYwWCXD3hFgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374858;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IFzHyPLAngzdUgI7A46bMNNHEIsFL1V3tiTa5OxKjag=;
	b=dbwp/1nG/kDhLl/0ho4iebiTXTP04qx8OwAsToJeAcMek1+UiUD098w9uGrrFFPDbIKs
	 0u1mC46HOeuZ9CkH7hANi7VMf23C6TewyJrhDSXTk6fMjfenXFHvqo6PbyIzDCI0ecJGC
	 SyavuKsD/DCqzEfXnShFjIDSjZRIYvRY8F7CA/1Py7phq7/qhlsMALr0DFRc10BRlyUxb
	 Y+qdsB/9YrHcJWs5ecPA9otN22sB2m4F6shyKWL3W9/gVOohEzBzEj3SYzB9X5QACdlmB
	 F0HAMav6GDarXzL/m/GZDKBV6kQwjoqi7t/rZtr4hkT93nMMr2Fv+1J3fP1BJUqKBFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgAHVyp6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.0
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155D606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 05:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E155D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgAHVyp6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+JVaELrxG6HIFv9iSkAFuTpC5m9MYi4pexKC4UFbB/jr0cVHzEstMn/ZlF10cB2J9aHEiLBfUQ9gb+XQrcInzOXmnaWnFVbvUdIL3uUJ57msEpHV6uQH6QF0g5zyFFKESaeWLCVr4u5Owq9Gudf8H0IUfKC46haTep+HzAj8CEeF28JZd1HMFo2vocernhl83gxPVeJUialGA2KIYRw+PIDdBXWhdvcEpeouEDElDfxgARGrLUXt7au64tZ0xx2QXGd2Ej/f7ShtMkH7UqmxCRkOGpxKOsv//a27vzF9pVnWadMJ0tbARqXwIAtRoWYPesJ0eBKF5aEk2JLDTz1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFzHyPLAngzdUgI7A46bMNNHEIsFL1V3tiTa5OxKjag=;
 b=CjpEtYsPYTNHzuTzPH98jmz1byxEIMA0jDNlIvVDkypIeFnRyMRmjMo5R1LMXP6X4XKXVB6SSqHiRePM55jXCEtf23JHTyD6eYrH1E8t0kHoZxjjvRx7U1raZcD6LgnxvH/f4Bgh5z24HihAz1kmCoFgKwvDHS0jNd92QBsWm8ViLm53O683PxM7+Tu8Q4+F+kgtJ0qsLU/oCUXLSIpMLWKEW48jLlXIrBrVgv11V4fF8Y8O3UpDuOuR5l3Rdid3zVu/KjORjr5hnBlGP8DKsHUIfLiEhLz7kNb4U1dTCYb3NXrSpQECk1L/Bw2ddghiDQtxJQFspRWvMyihurR/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFzHyPLAngzdUgI7A46bMNNHEIsFL1V3tiTa5OxKjag=;
 b=cgAHVyp6ioDh/Ri7XWae/AEjH6rbl+NTMNoW6Htv7j+uTzqkONL64brqra6jdyjmDAjdNs1r2PBfavRcMchppYmc56s80GtWee7ZUPUqxa39/WdK/ul2qwuSGixrGjXKqu6tgdMkP+L9RoArlPOgNvTjqGwUmaXINACX9hSs+SKd3RVYaecwv0YM0k50BDZZakxPa85QFTNhsTmqSopTBXiEQ5mxAjXDzFg+vsUpCVQM1kx0v1MQ3tbGy4qHive8bsHWmGYovZCJN7IJyyQ7FoSFWkgTiq08RwhFGa+oiG6STiKcYzrXUpi/yW/CcAOcyAfuR8vjMtzjGj8/OfKFPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:27:33 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 05:27:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 14:27:27 +0900
Message-Id: <DMS4SP3IZR1Q.161SA3OVYSZNJ@nvidia.com>
Subject: Re: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110231053.1352163-1-ttabi@nvidia.com>
 <20261110231053.1352163-2-ttabi@nvidia.com>
In-Reply-To: <20261110231053.1352163-2-ttabi@nvidia.com>
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: e0280c77-e883-476b-0b31-08df3fb47cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|10067099003|11063799006|5023799004|4143699003|56012099006|261022075727099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mKW6ZzrKStgXUQ9Q80Dt2r9qhLTFZyOBYQeDobnJ7nW3UDhZjO3n3gYNpmH/IWIm+UyfLuEIq+88J3SpmvxcpSYHhGxKe+L2gKvRNob3ZxZ3TKFGjtUQq703JscgNSsE6KjacnjI/P2aRjbz6usQahCkb1nxlNlPjXTo6gYKg+1BdRSCMNLm7FRt67MhMrSRPkebemzqUPMHTXK8W+/kua66vwqaWaenGrYzbZxweo4q/Idan85Z9+Wq2iTXe+oEyWqD10hh8NdUPN7D4rWT1LAK0ECiQO4Ep8xDBW90/G7g3JwBHPMU7zIcDpcpvZd8x49mtenU6eQ1sa8TZNShF2AhGJIhLWNTVnTCacr6BXZWcDNU5RZNONa5P5VrQAWEtbpF6CR8z/fWamUnUjR4Hzu3gxLbPsa/hltHqJq1KgGEKhr/vNUHweCmtUpGBoI9hcK0XucmCmoRlqiqRew08zlM+vuSByb5vM4FJYq4cOydWRMeCJBwwTtM2dkbzsjvdCsxhwnBUhRa7ShRYimYfDZwm6Ypc8Nv6G68o3FaJxTg5ZdSOhxw4MsSxUtiCIvNXgFbeyt7JoeEsxFYgqf2fuxlPIT71Vmd7lnWz9+x6z8Jw+6qk+ZNeLUsV6w+MQCF74mDZwMzBaThTHHvLsrZnPC8j0oh2qtEg0uod2KNWKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkE2YXRCdnZRaDFXRGthd2U5S0RqV0kxcU00aTI3dC9QczNmdFlLL3p2WHJI?=
 =?utf-8?B?Snp6UllsaXJTMDVkd2I4b1I5RUF1UmZxMHEvcTFldmNMZTRSNzdYLzVtN3dE?=
 =?utf-8?B?RlArWlpwSnNZaGV5bDB6K1RTZWU2WkJDYnh0SlZTcWZoZ04wbGxGYlVsL1RJ?=
 =?utf-8?B?bERUbnNNbXRLdi9Mams1UGllNDhjUGY5VEdnbkFUd1k4MzF3azhab290a3hD?=
 =?utf-8?B?MHRTd3hwS2NyR0hEMUFiY3FxSmZHcDN4RkdIdHgwQWRLdnV5WDNzN3FUVVlQ?=
 =?utf-8?B?Uk9ycFNDZWduVmZYSDYxaXdDdWduWk5pRmVDekNQM2kzWHNyVFI2YjBXY3cx?=
 =?utf-8?B?VGV3NUxQOGxRbGdIZnVwVlM5S09SQnc3SkpoalJ6QitaNk9XVVBxU2xNUjN4?=
 =?utf-8?B?eWxoSDMxUDNPczNMZUNUdWZ3b2Nnb2lSQ1VzWDY4cUh4emo2eXhGYlVlRzI0?=
 =?utf-8?B?YmVVNzZCa3pHajZiRmtjKzlCL3NKN3VYckd3Zk9NMXFGUU1GczU5a29OaUxY?=
 =?utf-8?B?ZE1VYnRUamJSdEJZY1ZkZkxkSmphV3A5clFnYXIrSjlOaTVwdytoN0JBd1No?=
 =?utf-8?B?bWVGT0pBMzVOTE1iSHlUZlprSjY5NWhOcnByRXBWUTQwSFdaSmtTZmtMUHAv?=
 =?utf-8?B?aVpTZnhiTXFsenFCWlVGSnRveTVBdFV2NDZHUUcvRS9aYWY0bis2U0syckZI?=
 =?utf-8?B?MGdvVmpvYytwUUFObTQwTWFwcUFIMjNOd052TGFkRHF3d0dzUGk1d052ekda?=
 =?utf-8?B?eE4xZDZDdjQ3a2kzeFFEdTRQckFyNmFMUzY3Mm9qeHZscUNkNWFxVzhjc24x?=
 =?utf-8?B?aWpORGZ2REtzSlhpcVFzTnBOUEhqWjRoelE0WWVIejZteEpwaG9uNTlXeUJu?=
 =?utf-8?B?alJRZ1JkWU9BNlliUEJBbVRCU1hybWRZaUR6N0h4VHpoR1g2OGFROTVoK2wv?=
 =?utf-8?B?QlBvK2gxcE50QkZGL0ZkMm5RQ09acG1HQXhKWkVaMVRaRlZ5TUpiUzlBamhW?=
 =?utf-8?B?WFNpaktJRUY1WitjZW1lWFhDOVVzQ0RyZ3BkUVhIaTNjb1g3dXU3Qm1pdWRH?=
 =?utf-8?B?K1I5c1ZmQmsxNjVzYTRzYnE3dGdoelZNK0w0eFQ3TGFsdkVZRFlqTXVOWmpV?=
 =?utf-8?B?UUdsRkR1aDg5b1JBSFI0emEzc1NSRjFveFhBbkNCdkMxZ3ROaGVMcGt4VWN1?=
 =?utf-8?B?aU9YcVJWdnJRZnA2dGp4ZnJlVFhrbnBxL25zcFdVMndFUnh2ckNDMFJxSG14?=
 =?utf-8?B?b3ZnV3lVQ2hTY1phaW9HR0szbUZ5TnNGOWR4MTkvUXgveE4xSWFNUkd5MFla?=
 =?utf-8?B?VTZuMHBrNFVGQUZDbmE0TlRUdXh2S1oxOGFBR3orU1JNLzVGdDVVUDBDRk1B?=
 =?utf-8?B?eVpuL1JmTW0wdkJidUtUMUp1cTJ1d0Q3eWUxMEpVdnFiMXo0NU1tcVFnTHZz?=
 =?utf-8?B?L2dyQXovWVZCYTR0R1RjeG1tRE1KdS95cjlOckZjWmZTWmh1Z3RuMW4yb1U1?=
 =?utf-8?B?ejRDSE9UbS9tZmpGc29XcVFldmRLVlcvK1B5aVVuZGdRSUd0NXlFWGNFamxM?=
 =?utf-8?B?NXMyWjM1NzBVajNzREd4ZXBDSE5JSjMzRWJ2a05MY1VIdkpqOVVwYTAyQ1BH?=
 =?utf-8?B?SWlsSFNZRnZzV1d3R0VjR2xyL3BIOE5odzlVMGVySkVHOExhVGpqNFpRVjRr?=
 =?utf-8?B?MW9JZlYxYkl2WXVyWUJwWEFDdHAwZHdma3BxRFdXRnRxQ01mcHpNOW5CV1ll?=
 =?utf-8?B?Z1ZKZklxdm1tcHczVEJQdTEwVWVTd1lnbnNQQlJCM1k2b1FtTFhJR2hrS3k5?=
 =?utf-8?B?c1Q1Y3liQmMxY3hKT3BzSVNBMTdwWXJWblpOODFndlBoUFpVRzN2K0Nlc1Bk?=
 =?utf-8?B?eXNOT21qMk5PS09BVEswSmQvLzc3UWx4YUlSeGIxenFQTFBZUGxodDdjVU1r?=
 =?utf-8?B?VkJUV1puQ0lndUFram1GMmJSbTFvTUtkcktzbGJNRmtnb0RhWEpoaEFkbWlO?=
 =?utf-8?B?N1ZwWVBMOUpkazUzQ3pReXFWcjRGNEVCdkRhRStIRWk4dis2OURRRFBjSzJ4?=
 =?utf-8?B?MHBDOTBUYjNKRmdkcDlvTTNkeFdXSWpmWHZaaHl6dER5aE9MWVZBUlJOdGFw?=
 =?utf-8?B?bDl5VlMrSEQwZW1SQ2hMb3pGSXJha0VGaHR5bFFzVGE0b24wUFF1ZHdhbXJm?=
 =?utf-8?B?Z0N0YUw3UDN4eUptYzJvaVBOclZDclJWTTA3Z0FRZ1lFREZQQ0VCZ0lNem8w?=
 =?utf-8?B?NjFmaWhUOXFVMW5qWVZZMGNYL3pSck1qR24vV29FSnhNcU5UQlRtZWdZSm4r?=
 =?utf-8?B?V0ozdWs5U1NUb1djZFo4R3ZtM21PSjRJWXFSdjBLb0J6R1hmVnFYdjdHeEp2?=
 =?utf-8?Q?Mr+QR4KOhbiho/HG8BCQ7ExMGUTub5J9Ai5troB+X3G2N?=
X-MS-Exchange-AntiSpam-MessageData-1: Y4Kz9aZyCZ8dgQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0280c77-e883-476b-0b31-08df3fb47cdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:27:33.6017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hfqbgfdm5jkOLS5ypMyvU6sZSaLAyINjC5FKD7WSaG70vZAI25N/77qjqJCZOe4JwTTDI8MeA/89sR2Z2KMgKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379

On Wed Nov 11, 2026 at 8:10 AM JST, Timur Tabi wrote:
> Introduce get_u64() to support variable-sized TLV integers.  If the drive=
r
> expects that a particular tag might be a 64-bit value, it should use this
> method read it.
>
> TLVs can store unsigned integers in either 32-bit or 64-bit little-endian
> format.  The script that generates TLV files is written in Python, and
> Python integers are arbitrarily sized.  For any given integer, the script
> will store it as a 32-bit integer if its value is less than 0x100000000,
> without any regard to its purpose.  This means that the driver may not
> know until runtime whether a given TLV integer is encoded as four bytes
> or eight.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/tlv.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-cor=
e/firmware/tlv.rs
> index 7f278903dc8b..75d8f907421b 100644
> --- a/drivers/gpu/nova-core/firmware/tlv.rs
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -257,6 +257,23 @@ pub(crate) fn load_file(
>              .ok_or(EINVAL)
>      }
> =20
> +    /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
> +    #[expect(unused)]
> +    pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
> +        let value =3D self.get_bytes(tag)?;

`get_u32` is using `self.find`, but this is using `self.get_bytes`.
Probably they should use the same one, particularly since when the TODO
to use ENODATA is done the error behaviour would differ between these
two functions.
