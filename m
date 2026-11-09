Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227829;
	b=iLuB6XuvPKonO67NzACMLmx0nMF5KyYXl6nKgRbcFGYmyX9Pt1ZC0v6f5oZMSCPw0qvF
	 Le83PB6AYhmMR/ICDFgstmv00o5hlxPeCxJAKiH5HfX6QyRuIqdgKpK9QXfrUGA3DMaAz
	 +50VMIa5GtiyHpWrZA8GHS910/qvpW/vEcrgYkfEMfIKTesR04mpAtA9CvkEZ24sx8HuL
	 hgNQnwnxUH+wLNQxO2n0IAarkhjCXJFZICa2z4OzNDCwBy26+/IzCh/o4MTcPYLLzm4eJ
	 LyV18MuEVlKIntG3NQZMF+qa1HpidkiI+o5SOxm1xjgnvGkGADOUB5H4A2kFrV2bvIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=205q7PmUZsCjCNW3RfVt2iewGuUqEz/z8BhayIA4GoA=;
	b=4vgnU3zgC355sWX2mWO01N8/lxTtnWHSB2P/eC8Te92kwgAU4CF7WNCvEffYL9kTl4Cy
	 ZAyi6RgAGj1hvPlf7fJREPJt3crLY7hYrIA+xRpnSCEiyJ5ppB9AY7pqq/q3qKmzpcVyQ
	 KvrB9jouudClzcRsHzNMl3mDEXcJd6x5pWurxz/JaWUHm7tcYdgts2777CyaXzFd60e6S
	 h9nOGk9kcUmiG65qDzvT3/22peOVu0x2Ne65TyD5Te3J5cZ2FuEtt/uAaETDNPVDM1L3/
	 fThT7YQDlFqr58qhmWMhFSwnzi11JzLXcdZiDEWMgi2bZg8S2msyEL3o9DfDPFMkGmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b="sN/DF8sh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.91
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D4606A321
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 12:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=sN/DF8sh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZPcoJe6vcnU/yRQsx1e1oz/BBqMAgm1HYl5jMOqSLSaKntxaoneJ/1lBfBhCyuS7gfr2+fagIDUlY0KHyH61iSX9Pziae1V7Bty3pUUfFsR7TouR8XklbG2Ir3MrBxpl2QpnDzPwZfltacVBFqBy7YMAlUkLp5ltVKd201wvSuM10Aw7yCpvxBZllWjyP0S4BghoEh/N7oO62+kaiyGl8Hta4SOe7vHx1MIMlX9H+HAhPmBgI6LTSB6nU1Yii3u1D6OXJia9YEfH5wMf2v3OmQVVt/NYWaKmf3ufUA1YTzUpTOvcpaV5dxaQ5WqjUj5CFgDaYcWmKnP+b5uvBMGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=205q7PmUZsCjCNW3RfVt2iewGuUqEz/z8BhayIA4GoA=;
 b=h0iDQzPx/OtbZP+o5uZGM0N7h0TI5Degd8cbGdU9MyxCK1Y7RFcW/JU41laR5Vt40iy7T8Hpep95xKwdoTVfSfp81OXvJFtIfDaNfy4pDXnCjdApSfLkw1xtLMH9S5WvPOm6COOKZSZJRNrKwYIghIyXpQjCmOJcEj71tEvs4DO8nyTw5/bAAJjqdMzDaTMD7Rr+JCR0Lq6AC6IZRNfNClZ1OIbw+SAXMCzksleWbf4cGTyvoupaeN7UCwqdQ3FBBpxH0ebVKcdJXO/qJLKQF9fDWvOunUSEJ1RVCAneVvsCQCKHl3IQ7RlxkZLybU6MyNbndpnMfNbE8F3g9oltlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=205q7PmUZsCjCNW3RfVt2iewGuUqEz/z8BhayIA4GoA=;
 b=sN/DF8shHy7vIUu+S6ME+9ZCxL+n41ODAK/ySiNE8tkHZiXHgbD6hGzzgruPcKVREI/qdvJnyYsp7ShqTG1cFtBm2Q/GRcCGupsNjlFR37jFM83A6A1Gv4Iyp8CSgcFRNjUkZ1NDFlSu/1ywk48FqnIyKUymweJcd+M2BBS0v5I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB5985.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 12:37:05 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 12:37:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 12:37:01 +0000
Message-Id: <DMQOOI3UIPI8.1F9Q6BQCN3V4C@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v11 1/5] rust: io: use Alignment size constants
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261109-chid-v11-0-082aa9bf5a91@nvidia.com>
 <20261109-chid-v11-1-082aa9bf5a91@nvidia.com>
In-Reply-To: <20261109-chid-v11-1-082aa9bf5a91@nvidia.com>
X-ClientProxiedBy: LO4P123CA0499.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::18) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e12fcd7-4206-43d0-be21-08df3e5e2778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|7416014|1800799024|22082099003|18002099003|921020|4143699003|56012099006|10067099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	hAdsWiYqpbCpHuFnESr+YyafIKucFuJl+6klP32Ys5axdin1sO9XpmEWL+5AJJsNPmnMtsnX7RLaniYJLb/7ug8hHlSsW4XeBWIAXEI6mMffwqoXX9GW/g2drIlVG8cgqzIvILp7Gr29ozfWfvl98aGqn4vFcUkR9pstFwEGcvZG/WrzHCvT7qQIfEwejztZh/hTwHO663daLdkdf2a83K5sWsbkd1+ucGp8kLrymRqn1li6IO9qdoiexGiXMgR7ZBnPu8/nUINWtBKB37EKo+RSS1TmI45O0uCyvDTT2W/47Fgdrumeauo35YSOu948fKdzICzfA25zIxGoGaFGP6hlVx3NTuymic14n+fyeYATXlVqRfjAbE8dEvpuJYx5u87nPGwOsKdUzNPSFAYqlXAOvmjZ+cD7Spc+1Mz3BjE0NcWI9Q/7JHgIECQwscWhQKSQcGeRCAFMWhWYsItnX7VGeTJB8vFiaVTbNwyByD32bvW2TSiCoEWzm5Vr83E3BY+ql5dTXNI+M5T0GYIvDyB8dmsjVKUPgsHDxe9JGPTnOEm2ONbe8lwv/Ujh0RjBiOUnXZ152LFWi7Edq9yQZeRNmUyWoRHvuJ6tjhAPU0Y1RIbBiCZ3UGpWamLY1wcW1E/Rf32WSahsqyorhhBbAA+jK/hH6H74uhWBGuAwi5PmCUxL6S0gYYzCRW8DUbXskni33yRRJh4o+9nr39/uuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(921020)(4143699003)(56012099006)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1hhUVlvaGVwcENkRzFuazk4Q1NXY1BDQkQ4SXhibTgwaXE0YUo0Y2pwdXlR?=
 =?utf-8?B?SDZGbFdZVkFUb3Raa2hsT3huTDdmazE3SkhGbjZHNnRlVVJlT0xMT1ZEak1M?=
 =?utf-8?B?WC9aQ2VnQUkzOHdCUWRmbWRKdVJDd0E2cXIxbWROTFZJZlFNM255aEFaSGJY?=
 =?utf-8?B?UFY3azQ5UXRLVUlhekxsRWZUd29PUEhXMmhLSjhaYWtUUTFtM3Y0Q2cyNnBn?=
 =?utf-8?B?Zk9iV1FFSjYvREV4OTRDYlQ1QUZyZGh6RXM5aFU0NnpZaCswZUYwdmVWWFRl?=
 =?utf-8?B?Vjh6bW5RVWgvVUs5aVFHYkJmRVpuV2l0NXRJQ255bkRVdlJnZ1pGdDNaMlJD?=
 =?utf-8?B?WlNaWC96RXZ0T1I4a1czMVFNczRTZGxSUTdZTVB0Umh0NSswQTFHb0xFSzhB?=
 =?utf-8?B?Z0YzUGRsUGJUVnlUUHNRS1RvZURpb1FiWExrMU9DS3dtUFVmY0JqUDlhYjFq?=
 =?utf-8?B?SFQ5Q0lDNjJBdi9tSStyTmoxK0NGYkpqSlRETlRVOVVPOWJzc01BOXZtNXpX?=
 =?utf-8?B?cWdCMTAvdEs4S1AvNlRhZVFQYTNaeTRWenpidkhLMlRCbWxkanpkd2h3K2VP?=
 =?utf-8?B?TzZMMVgzbmk5QTZJOENEQXFDTW1sQWdtczRHS215MkNSK1NNUUQyVWNVY01K?=
 =?utf-8?B?RFM1M0FxZ2F4N0JUU3Y3VXVxR0tjaDhvMWNBM2ZPcWNFVUhuZWVYSS9zQldS?=
 =?utf-8?B?QmtkdVR3NXJZeDEvSlppT3QxS1VLK0dZMTFXYVVPZWtHQ2tRd2ZvaEhIamNa?=
 =?utf-8?B?UUlmOTVjVng0MzFRWjRrcGk5dHY3dEJwR0huL1NPb3BHbmphenUreEpGYWQz?=
 =?utf-8?B?bEIwc2tUeTJKcitRQ2NsSW9oZ045YTcwdmVLVXA3T29IbjZLYTFtcmYxTVlJ?=
 =?utf-8?B?QVIxMzBlb1AvQ09RTVVWWFdLMW9oaXVtMlFPMmlFOE1oMG9ET0xVdjY2MlBm?=
 =?utf-8?B?ZGorNmN6Z3l0Zkoxd1YzdkxKRWVlRUV5N1hmWnVtL0lRb2xIL1VJK3AzeUdr?=
 =?utf-8?B?RS9ENEVQc0Z3SE5GZTJNSUs5ODFPUStHTTBBcDBSbVVqbE5CVjcxOGdOZG9P?=
 =?utf-8?B?S1VWOGxpSEJHdklIVnF0ZkFDQndESjBXVmkrTzR4enJPMkQ1L0I0YmltNTZM?=
 =?utf-8?B?RE00MkplUFAwZ1RLcDhEQmhWaGkrNXk1VUZseVpzL3JSWVJoTll6eGp1eDkz?=
 =?utf-8?B?SnJCcjdmUnZkL3Z4dlZ2Z2J6K2ZHcG9Mek1BMm5VL2FwRFczcytobi93TDZo?=
 =?utf-8?B?WHFUZHJ3OUpSR2tpMVMvK0NvMEI3STRHd3dQSHBWdEdtbEg4ZnlzZEdkK1hl?=
 =?utf-8?B?UXlDeENvRXZoOWpLa0pvY1VCZ0d3SVd5YWYzSm1HaUJtenpBcW13eVRWeFl3?=
 =?utf-8?B?RkJZZ0h3NGRKdUdaTHFZdkpmSkdnVXRMMDJ5bDRaR2daaHZoTXJJTk1oUFc0?=
 =?utf-8?B?dHlvWExMcXp4YnFvWk0yYitvcG5nVytjY3VzZzhBamlZU2wzVmdMenNVS1Zz?=
 =?utf-8?B?bSs4S0lZTFY1Y3E0YVRXMDZtM1p0YkNDRENZWkp6NXpNMHBCSHloSTFwdzhL?=
 =?utf-8?B?Mm1IWktoUjdBQm14SVU3am93YjZtV240L3lxYVVzTUVLZ2YxYXJZcVJWU0J1?=
 =?utf-8?B?LzhIUEpzMXFvaEVyK2tjTnJkUlRxQXc4eDl1RHFFdFh3Z09JeUZjb2FTbFhk?=
 =?utf-8?B?eGZDazh4Z2wrRC9Pc3ZnV2pIdm50eFU0OXFnRWZDTExCcVduZWJnSU4ySEFI?=
 =?utf-8?B?cm5TY3podEU4VWFKUE4vVG9Lb2EwVDhJeUlEVWM3RFIyb1RHNXR0ZFFaaHFt?=
 =?utf-8?B?OUIyRzdsNEIwc0hHLy90dWJ3WmIvaVNwVjBTVU91OGxPanFqU1hHU1NJQkgr?=
 =?utf-8?B?MExYZDJDYlJ3ZjRxR2hNRDdMdklqY2Y1MC9LSnVSQXlWSk5kMHR2Yk5vRTgw?=
 =?utf-8?B?WnNrdzBFeW1pTXc5bUZXUW5adWhKYUxaNGtCb09UVWtPT0xnTk80cVlla3p5?=
 =?utf-8?B?dlZTVlpjSERQajRMalJVYk1DMDZ4TTFEZXg4QUVZb0Q1Yzg4Ti9HMk1LdG0x?=
 =?utf-8?B?a25TSVd5bXZhK0NNUk5vVTlWWnZuNUI4eDZKMkdFSy9aZzI3b3B3cXNWQzhx?=
 =?utf-8?B?d2VWMXNoOXByZHU0VExaL1VCUkZ5aVZWdjdzU3dGT1lyZjBJQnVyYkk4cDB3?=
 =?utf-8?B?RDkzMVB6R1UxYmQ3eDBZWDM2SFNMNlREWmZlY2R6Q2IvTEFWTVRvZWlDZmd4?=
 =?utf-8?B?OWJqRWhla0dqbUVSVGxBT2VvWGMxYVRYNEVKWGJBeHd6aTBEcXF3NGlJUk9K?=
 =?utf-8?B?SndOSGk0M0M3REpxRVk0bzdpYzhRcTREbDZjTEJMUnNUdVNUeXAwUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e12fcd7-4206-43d0-be21-08df3e5e2778
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:37:02.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veYQpQhgPJ9e7kSwSMLRNKupCC2pa5WTYWvZfp+gmAPsM0eR8+6SN/Jb/er0FiakOQf1eSYmXMFq/APO4Ww9Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5985

On Mon Nov 9, 2026 at 8:32 AM GMT, Eliot Courtney wrote:
> Use `SizeConstants` for Alignment that are implemented now.
>=20
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/io.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

