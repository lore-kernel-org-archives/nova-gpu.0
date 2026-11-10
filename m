Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305694;
	b=PhWaQXF59H1tzUGit9HxGYLzB9r5jbx9VvfIP+jmaQDMQpmompmBTL0pEhMKCfpHrKAN
	 PLmgBvFwPKW7T0agOCDdB0+JzKT53kAJZ9QkQ/VXc2pQNa/cO2qoOsecKZ9gQSVyf54U5
	 aHeMHXoKHb65C5TjQi6/m4t0rTx2jsVowXHSAgIYwW1NwbtVkbC4RKJP0U2rPflhBSWby
	 ifUQPklvAsfPwwI4mV6fZ1xlOrQnqNbEjoRt7Mydg4YCbb2o+nDP14/nTeE2MA7yQt/Z9
	 VqVBjuHKJgGhQvA/xlx2gYIdLtehqZo7Idbl+/N6IXV8yINAohCAjXgh3/LbE67BBjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305694;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Content-Transfer-Encoding:References:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=9Kx580bdjFfKc47n7nkVpe8IJZx9lzBzvw16KF5viOM=;
	b=n+1qCLlumrLX3aSFehdPEA18Jc/eMw1R+pn+sfnPZNIfvveWKnmVck/bDOCVg/wz7q8a
	 ujRLa5k8Q29PJrw9MuxEYqc4d9oE4XRZxjF6r3IMTxwv84293gGSAbh99ijDLnLbRTqbx
	 HQFThqa7nRUHzTJo1FXY+aC3rGxA/ewdy+ZJQLJ1LltgJBeYpfTd/1D4Ub827oPsSTyFz
	 tRQaAmrTbyDyol19XDuazrOqo/WoMxiMDf+4fLSQU/p3QVl3yEnD8OpVsrFAfxU7n4DOr
	 OztASDJ4cQcpnOa0bCPzLZ9m3m4+PfmAY/lPY1rBTT+VStd+UPZcaxx7XbU/oauftPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="My/o+55Z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCDC606A339
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCDC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=My/o+55Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyuzrz+vo3a2NEC4shXY9Mp3hs5Z41Pyw/csPGYQQA16gMSzE5UcMlKMBq+SWyAjUYQZMtIZgP9YDG6RH/w/l2V+L08u3D3nqahtK2fkpfZ3CZQ8aPLScrqGSuxO0v7/LpZiX/qi0bNNPClFK2/YWt7dPMeHSNFqWPVwhmnwS2jtRyd/WL5XRljBx0cQqMomnXlZc9NKCGEGuK8DZYUqsHa61D7P1/IQIkq3scBY4twYIGJ80SykIfyGj7h3Snp1RbPOARkmSol+YJgBZTJQgk+E8//HwjojW46wvfkXimR5x8FoE/bFW8rKVu8Woz/eRsqXYm/hH/qL+XWFl4gGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kx580bdjFfKc47n7nkVpe8IJZx9lzBzvw16KF5viOM=;
 b=Zq5wRi897CfFy8apbBZebEjUTjW4I7wnzQzyveT87ScFy1TBOrhbI6ZrchAL0cC/YIoAHRX2rgYx/NCmLF95/gFyVh+w25sAPI4L8eXuaCDDtcsEBpUzi013Bjy2GyCIQLrf3JTe4w/EsxHuSEMKE3uE7tXlMNXB5kVMUCQURkpZkcGGryjsrO10cKKMPSxLdvMZRbtFNDTcEm8BBli+AI/MirB/XSuUwdJv3F+rROYVdHiKLMpxB2f3ey7+thKABvrHT6F69TBowxr45QVvS3tYLKcoQGGahdCyFa6yFDI0gfLlXLIi+VIosTxleTWQawimDclIFawFjB4PCAa7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Kx580bdjFfKc47n7nkVpe8IJZx9lzBzvw16KF5viOM=;
 b=My/o+55Z2GrVpi3O8dqbLmWk/54P6L9w2LfTWufBqWjumDcAQh2w+8BkVXC+wSKDPOEPRFEWgVnx267hYb14D3HyGxQiBH1Ec7f87M7EfF93bNtOpFQUarkGZsOxvk0F5Fn1dugFshopSFNyu1YkwVLrZ36LG6M1adbZYbbuOP+W9Oc5avm/DZynLpnFSu5Ua+hXKw6CrugKZlmKQ9tYDeEK1RA+hF4K98SBylZZDIYlBu+PWm+dJGuF8j1LLKrwZq5kElEuhlqwuWU5bZoZIqXZzK77PAJVdcMapDBGinevaVLMG2SY97TUgSOUil8+w8MZaRjaPjfaE5wQT9cTag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:14:50 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:14:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 19:14:47 +0900
Message-Id: <DMRGA5G0Q00Y.22IKP8FGI185B@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] gpu: nova-core: place the generic bootloader
 at the top of IMEM
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-3-fb37cc5b20cd@nvidia.com>
 <DMQETIYO7A62.263CE3B815QGF@nvidia.com>
In-Reply-To: <DMQETIYO7A62.263CE3B815QGF@nvidia.com>
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e0664a-dc82-447f-824b-08df3f1374ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021121427099003|261022115727099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gUnWaRzJWYrCnwW4cileAdeTs+mRVVhcaaWPx09trIb1N/l9cRL43w2iA6+a8qREN3TAi1qGjnFhsZn0XNae8vpAj7bJqMAlyOY7IHdVl7jb+YjtjytohGK3khYPBO34TeqwBJxvqUVPhA8EaGyQPwTDfS8eI5+4rWvOzXzpa/UC5uTXR2ERLm3cYPiLy55W4Dkw6petqddNQ5rWtxcaQhxiMZT1Nft9UPMbO4ob9mMQAU8Cd2jyM1zY3VZtuFybi0ntnbNAxZnP89151tGIvh/hbPvxf+vtsgHStmh9dLxQa7+jDV6b2l8t1VZ+bCmSwGlrvLhtbIqSIWG2RMimXfN37JkBl6S74Cw/nfgwmkwfTQRGYnX5DqdmqDw8pdIpUw3ZAtUWClAplPHj5RsX6At5Fzdb3RcE63ygJvaKzvPadDdzUAmlpnnhq4JTbYb4eOSye8zfOW+OudeRrDdgevs+arKmPS7R0YJYardagR5mMAy9tWVGAPwybdTopM1RpWQUqyKRcRQhjmoJ4zJR5xaI+6GRbJ0clIwaAsrRB0NL1zYGETKYNOzD331WS/UkzIiPJ18x0BAJRK6RUgPckZFYcJr3ko07hk6/ogb7b92qNxcjFq8YWLZkUSrblN8Wkj1JH4xsBHrwF7r1XrwttQikSgHXkNNwDD2KdE28j7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261022115727099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUYwMVk3OVFzeGN4bkR4VHNNRC9BTXFMQ0NobTJLT1Vld2drMHd2ZWk3ZlpU?=
 =?utf-8?B?Y1oyNktZdEZnLzZKVE1rNW54T1d5MXJMZGpBaXZWc1E2NkF0cE94bTZPRFA4?=
 =?utf-8?B?N1JNcHEvZUg1c1RmY1Z2MnkwYWZBck8vQXMxUlNlYlU3M0UrdGYwdTdYZWtm?=
 =?utf-8?B?UkJHb1Y2ZzlLcldNNElhZ0xZc1Y2aHZFd2o0OWNuNUYwL0gvR0Rrd1REK2Vh?=
 =?utf-8?B?YldTcVJKRjYvbVlpWHYrU2piNm1VUnBna2xEMnpYeUlHTUFQd0ptNDRGUkxD?=
 =?utf-8?B?TEVoaG9aQzdVd3VXZGl2Mzh6TlpaR0dUMS9rN3VnMmJsNi9EcTcxdzhZQndS?=
 =?utf-8?B?dTk1WFVZMWI0MThmeVRPT2NjYVFlOEppQ2UxdzZsQkwzYlo4YkthVkdIQ2lG?=
 =?utf-8?B?eURrK0JMTkc0NVZMaGVtMUlMQ2dVZDFiMlRSWnRCQUErZWpOdEdVMkM0V1hi?=
 =?utf-8?B?OWdpU0t1RndEeTRLVHBpQTI3VmtLRjIwdVg3RXhhUHo5QTRSaWVGMXhnUmQ0?=
 =?utf-8?B?ZXdkSDNNbjROVHhZNUNwUU9kS0hWMkZ3V1htVk54SlJXSUxKWWtnVEN2cWh4?=
 =?utf-8?B?MTlXUlRYUkcrM3F4Nm51bmZrOGhvdFYyM1JMblRCMHk3NjZFc2RKVG1MMXp1?=
 =?utf-8?B?RzVLSWY3MStYYjdNd2dTc1VOMjJObXF5N1F2bm12SUFzN1hNN1NvQ0xKeHFS?=
 =?utf-8?B?RmxTSFRCVm9pdXR2NTllZnE5RTVyOEtubHk5TUNOZjh3dnV5NmhWbmIzUHJS?=
 =?utf-8?B?eHdEVzRoQ1U2NUIxeXEwWGl0b2VIY2thb0x2c1llcm1UdzltNnJuckFncWZr?=
 =?utf-8?B?cCtIZGRHMnFOSXdSQzBZMk1pajUrTW8vSzlUcWIrSUFHbnNWS2NtQjhwbWpD?=
 =?utf-8?B?dVJ5NU43VUxoekxLOXZrWlBTZGpqSklTVUpjRTBtclhJMkRiMlc0a3VaaHhW?=
 =?utf-8?B?L3hVUkxna3FOUkVlVCsyaGtxdVdrc3hQQVh6a0FiUHp2OWVIb3p1Ujgwd1JE?=
 =?utf-8?B?Z0E5ek9YYlp4UCswcEhnNHFNMVJzVFY0Uk16MmxZU1MxMFpKbFErYXd0a1Fn?=
 =?utf-8?B?NUVhczVxUFJaV2dOZzN4ZEFiZ043TFFRa0N2UFNWSU9vekk1N2UvZFpncEtR?=
 =?utf-8?B?Y3REYkU5dENzWGFXUVRlZTkveGVvOEFpbnFoYjBqdGp1TWVmVmYrV1NTd01R?=
 =?utf-8?B?dHhDWVZoeEhBMFZsMzlsNWY1UTBpMTJ2aG9Gb0tTSG5hT3lNZTFFMnVwL3hN?=
 =?utf-8?B?QnJmUVJ3MXRmRzlZNllXV2tRbGVFVWVteUlPb3FMT0hQdVlCRG5rUjJOM21m?=
 =?utf-8?B?UDAxdVNMYnhuYm01VVVLa2N4NXpmbTAyblJHcmFEeUJzdkh4MDl0dDl0bUhF?=
 =?utf-8?B?YU4xeFRLL2Z0U2lFNHlIVDFNRkEyQ3o3bUtvYTM0T3V5OTUwYVJXVnBDN0J2?=
 =?utf-8?B?YXRROEkrUTJBWnNKZmJvRWV4c3RhOEplSlFUbE9KNk9sV2dGbmdwajNYOW1C?=
 =?utf-8?B?YzhpemNoanVFdC83L2lHRzVvKzNVM3FXRE55UkYxclROdGY2aVRic2xpcjlB?=
 =?utf-8?B?YW5IL3RTdU5GZG5kTXc5VEQ3bThVcEQ2UmJXUzJwU3pBK1h5NTdBVDBUcE5q?=
 =?utf-8?B?YnVWVzZtVGZDSVB3bkNheXdweXZJZ2REeWVWV09qTDhqdkZQcFhsM1Z6V2VN?=
 =?utf-8?B?dllXak1TalhtZHYzajZIRWNGOG9uOW5jWmdyVXFDVW5xbjZvOEtWdnp6ejdp?=
 =?utf-8?B?NC9PTU8xUXBwa0gwSTkyWENnNE13cXZURWhqYW16TVJQeGgxd09hV0hHN3lx?=
 =?utf-8?B?R1BYekhaV3BiZk9OMGlHZlM3ejQzelNSd2JPRDM2d0ZLNlhrODFxaE9ocFhI?=
 =?utf-8?B?OWNXMkNXT3RJUjhzYk9ISUl5bGhnWmo1Q2FzaWNPQ3pYZ2UrVmlNNFAzT2Yv?=
 =?utf-8?B?dnpWdEFxQjh2Y3crdUdsenQxQ3ptQTBxaVBxTDhUcTY4a0IrRUl6WWl6Znlv?=
 =?utf-8?B?K0xheGMyaW5NUlFUTkhmcTJKY0NRa2MycEVBSDgyTHlKdmNzTmltL3pGSCti?=
 =?utf-8?B?MmRCdjFQbm1HVGg3TEdRWXZsbWZPUnpGOXAzV1UyM0diN3BlcnQ2cEdtR3F2?=
 =?utf-8?B?a3Q2WTlkcDIxRFNzOGo0YS9PSi80VzM4QXdONERITkg1ZnppLzNGYnpONlBZ?=
 =?utf-8?B?QTUxWExhUGFncW90QVVrK3hlaEdDSUUvM2ZQV0xyQ042VktBSFhnMm1BYmJ6?=
 =?utf-8?B?WkRBZE0yWmk3SWI3dlNxanR0RnVucWh4eUFDQ2l2Y3h2b3NGdHlvdzN6c2hV?=
 =?utf-8?B?empJRVliYjBRVEJHWnU3aXM0cmh5bStiajZsbzBFc2lqKysvRnBFZWNwd0I3?=
 =?utf-8?Q?wszUhpz1AazLei1sPuXc78cYNDk8s2uwv8Bzs1Xl4s/9S?=
X-MS-Exchange-AntiSpam-MessageData-1: cljaOcrktIUhyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e0664a-dc82-447f-824b-08df3f1374ae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:14:50.6471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hid0HU/v35qRZh9Hx7rGt7Wme03pwUjs7iPNA80ohE6BnttuJPttujqhBwwhdOkAFJ5WvmTgX6pmNHz7qOG7Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

On Mon Nov 9, 2026 at 1:53 PM JST, Eliot Courtney wrote:
> On Sat Nov 7, 2026 at 6:47 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> The generic bootloader was loaded right below the first 64 KiB of IMEM,
>> on the assumption that every falcon it runs on has a 64 KiB IMEM. The
>> r000 load-and-execute bootloader event can name any image for it to
>> load, and the bootloader must then sit above the blocks that the image
>> occupies, that is, in the last blocks of IMEM, regardless of its size.
>>
>> Place the bootloader at the top of the falcon's IMEM, using the IMEM
>> size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>> [acourbot: split out of the patch separating the bootloader from FWSEC;
>>  convert the IMEM size with usize::from()]
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> [...]
>
>>  impl GenericBootloader {
>> -    /// Loads the generic bootloader image for `chipset`, placed right =
below the first 64 KiB of
>> +    /// Loads the generic bootloader image for `chipset`, placed in the=
 last blocks of `falcon`'s
>>      /// IMEM.
>>      ///
>>      /// # Errors
>>      ///
>>      /// - `EINVAL` if a required TLV field is absent.
>> -    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
>> +    /// - `EOVERFLOW` if the image does not fit in IMEM.
>>      /// - `ENOMEM` if the padded copy of the code cannot be allocated.
>> -    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result=
<Self> {
>> +    pub(crate) fn new(
>> +        dev: &device::Device,
>> +        chipset: Chipset,
>> +        falcon: &Falcon<'_, Gsp>,
>
> optional nit: `falcon` is passed twice in (`new` and `run`), so we
> could call `run` with a different `falcon` (which could have a
> different `imem_size` to the first one). we could just compute
> `imem_dst_start` in `run` and drop `falcon` from `new`.

Good idea. This looks better if we move this patch after patch 5 (which
introduces the `run` method), so I'll do that as well.

