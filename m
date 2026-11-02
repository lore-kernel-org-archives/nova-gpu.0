Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620535;
	b=SYLAvrVOWe0EUMIruB/IbQL6Zwpo/H+Sw/0xoiWHemQ2Up5eOKNB8VpIYUm9tjDdDIhH
	 7qFiZmv+23sTd2xctYhy3PcOHdXWrMxvLvHdJn+EX+qnKj154cjakauDbHY84rKT6Kgga
	 yU9db6aiStqyc18UqMXwvMVopcx+UloY66SOzivxvk7QhEmvbr59lE9CUlNq/nsJ9bNrT
	 LNsTNdE89D/Xv6M32G+uY2OaQj0Vd0HRNA/4QbndbMyiCV/XStydJBAkrAgqUL1QqB78l
	 YzvrYoEV/kQi51/k7aEg3HwEuwoIX8Fk5kPoxLgGka5WNuO3B+ntN1JdSp8NlZFmWDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620535;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=xlqJOxUwZeQIz5DZP/FTRDk4DkOH4po6pdpWqn1sDKU=;
	b=pYIkFOY/+1P3auS0SVIxeBIvHXI/F+YW2n+BM/x3K7wyL9tepzhrcZ6MssMdzzOR46Cb
	 MCP6vWhE8kkYMHijYBQKnfg9w0uDELJDyZ1ADmnNL0nAsfDWGPoFw7qInIZhc7oiWupkz
	 99MqXdaQ9FYb1k92Bur3csi1rFyFFLopSd8aDSjfb9rZ1xkVEjY7cmYy12/IrLv3vtlBz
	 CjNt7/r/JjQrp8Tiorw8A6RJgkGeRobvbLNqXRrIG5kL6yVljmCSKVu/GXC1RKRkrC2NC
	 eC0ksQDknzm1qONI/clRq73uECDiQ0/MVFK6adzI810X9DShKW747OMUvBLzJFslupQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nQEsEpMV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.37
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50574606A326
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 11:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50574606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nQEsEpMV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNprL5WjW9CheH1QkQSOUG5ejLvpvI7qHNCRwoqNC22kX2vl+DdwCCsdj+RuDABbTBE4t42a8Px3rBtcU0eM+h2AvHJd4GagCjV4O0JZhIXty8VNCTn33aYYxv9b3wrhMpOrDhU+7dw43tKkIjHsx/3x2Xp1+aNCT6FJ177t3pvBqBknjJGWdYAfcoA2L5egP0D1Qs7bhKP42lP1lsTYNSYU5rIfl+kNBDWCf3AGKQiHr5CQNnxTzoiG147BZFHlXxpInZoMoNP1XLORwhuSIorUBv8rnVYQQdn/sSAnxUUijChY0EESHNMUi1MSHtwqadAXudmCZWVcETqXhzs5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlqJOxUwZeQIz5DZP/FTRDk4DkOH4po6pdpWqn1sDKU=;
 b=K27uVh2Gg5t+eLnTkyLmH70xjhbneDmJk0P3Va7qaFnb6KXvDCh13tbtStg4xTlKpZiPTJKqrxafw4FPkS9Wyjok0QcjuWb2Dg1z+XvtPeM64c2iEeGspvf8y6P+tAiE7+YIB5tpJFlo45qskijrSD/bwAS+1Eu8w5oU3Yrf3289gmpLH2n/9WG6xLfU4OW1sKR0Qdw4FKlphgG/c6Zo2oDsxoHf16xP4aSIadkNwydNYksej9xgsV+j2r08XdHBEuKumpjqVr252Mj9jsAFOiS/mlgY5WRFUxjvAAPjuBlIjorht4x2kPsRFNOlfw95fBON+KlGDzWOAITkt3+Ejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlqJOxUwZeQIz5DZP/FTRDk4DkOH4po6pdpWqn1sDKU=;
 b=nQEsEpMV7rxkbLyL0uOOv9cJRrqKXkjIgfPFcmNedX47zx4gxVfuwqHGMyA6Zvh1cW+CMq+m3HW0RFlfhdYIyBritWz3VIQZG6WDSuK18Hp8hd1FrCp+rjc9X999r1UalfSQOGzwfPHXdZ8x5UGjBoc/Z872W7em63F/OG1enmb/no1tF+0Fw76Mg7WUg00gV9uDJgaFUA0+JeIBOqHjLz7R3YRwErQf6fN2f1xBFCAahFD2bM544DZ/+aeH7PuIuBcueclOuVmDF4VqFDCdUHQbXmA20dCmKUY+MXwWES4Dxt5iXFG/5FbLUcYX/X+Izsz5ZcUE9XJXbdVn2McW4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS6PR12MB786665.namprd12.prod.outlook.com (2603:10b6:8:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:55:30 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 11:55:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 20:55:27 +0900
Message-Id: <DMKPEV6F91IU.2Q769BRJO6ECJ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: cmdq: compute the queue
 regions from a count and a slot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-4-f2befbcd8ba9@nvidia.com>
 <DMKHKKRR2UIY.1FIJ7GS9VV4B8@nvidia.com>
In-Reply-To: <DMKHKKRR2UIY.1FIJ7GS9VV4B8@nvidia.com>
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS6PR12MB786665:EE_
X-MS-Office365-Filtering-Correlation-Id: 19af0183-35cb-416e-b7db-08df38d8319b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|261021135927099003|261021123027099003|11063799006|5023799004|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HYw8ecifwum+3r6c1X5C9w5vaJzAgCCqUIIgx/FiyjSUoo79aI4li3JOmivnZNCdxq5qWduOf4mjGmS71jnAeVlnHGwWpNW8q6IrWDbF7FULWcK0VvRIQ5Xsx74RZ8oytW/29jtKXn9rKWj2o3qiW/l89KvOZnFR3c+IyTKo6JWAwtcO6Pm3s/LQnZX8wTauLi5rxrVGkpL+N59DIWOryTOIUOOkzINmZ1TiMFS+VUr3nJjxUw1DFEHU2vAAnffXu9HsajBUiQDF6dihiskOqY3yDazpEK54fgiWxeFpRlryDtmpayRNfSJBg1dpqQ7s7O6+pdysJkjyMDhN+TZXnDHUc9OyR6pPW136GQj1A8DmNy/TlvSFeb8DAkUv88IOPG5KCaiSQf90UuWQsJUbZZniYXtv9sIT0QSREpOJtLz4nNyCZkjMT0m6M94VUK/r61gfwUhyFVgcLCUyd+gg6uJTuW18rlBArrUB6drho9SxwNa87k/x6NPzLX+0Z25VYfs7PXjXXT0GkF61cAJjoRu3Vz16Ryw2Z/6qaaUjZ434Q0b0JNUmu5HneneCEK9BR73V5gKhduVvtX38VVdEgqb+h3pP9p15b6S35J8rpAAYK7x/NiGdWN++qFDIILgfXyQI1di1/BeMIlvZkL+Kp93NVRvcmDKJKSgSMnKFHKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(261021135927099003)(261021123027099003)(11063799006)(5023799004)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDI3STgxYVFRKzBZOC8rUjg4ZVBuUnJkYWttUGE4VlZGd2NETS9ia1ovWFht?=
 =?utf-8?B?YmtYcXlYd3lTaFdnVWV6bngvMVVvMHUrT2dVaTFxQ2ljcitqZnZLRHNGMVFl?=
 =?utf-8?B?L050V0ZPdldLL0crM2Z1ZThDTWZLY3JYTDYvaFc0dlliN21CeEpKK1dITDVF?=
 =?utf-8?B?dk9UekljY0Q5MWhmMlFMME1EajFhSllwRVFaMlpBWFJzM2dseUJna0s1clZx?=
 =?utf-8?B?cjFsck91S3BaVml3RGdpbWFxQ21lcHUxZzBiYWxTdTZQVERHRjdkN0RORDFS?=
 =?utf-8?B?bGFHTXVEWVNxVFJ5dXFtMlptaVgzM1NDOXJnLzZFcmpBKzBlU0FRWkNMQ1d3?=
 =?utf-8?B?T1JzSHRaZmEzMmNSRC9rcW9oQUJLS04zaWJMS01Ua2ppVW1yVG1PL1ZCbDZY?=
 =?utf-8?B?My96MkJzeTVrR3pldUJadzIzS0RUeEZFaHBJSmlUb0ZoM0FOandKSk9jY2NU?=
 =?utf-8?B?dmdMOFkyS3JhRzN5cTl6YzYwUEVHNFRySEQrcU1YNGRlb3FnbUtUUjV2T0xU?=
 =?utf-8?B?UkdrTWdkN1pKWExwcWFVNTQ4ajlHVXMxS3U2WDFDZ3BoMEhvdGhiWENncFh2?=
 =?utf-8?B?dHk5TmRhTm9ka01UM3A5cDhGN1A1K1BQYVFmcitBODUxcHgxRFM3LzRmU2RP?=
 =?utf-8?B?cWJkVUlwUWlsUXdydy9rVVFPbnlqSVNNQ25kbU5ndjh6RWlCS0d1Y3RENXM4?=
 =?utf-8?B?THpvZ2hCVW8yNmwydk1lem4yaWlLSFExeThSSVNRbVd6TVpndkI5b2FBVU9Q?=
 =?utf-8?B?dVRpUk11eHJ1aXJJYjluYkQzZGl5UGZ0VGNpOHV4cVlRSFBPUmdKNWRZOTk5?=
 =?utf-8?B?ZjhXZUhSRnFKMVo5bnFiQUEvMXhiRGRJVTVJMjgvczhja0VhTEhvSEloYzFv?=
 =?utf-8?B?cTJqcU1sRkI4MUtsN2JURFRWbFVUblJyM3BEbjhVN0pzQU1ycjh4Z25xZko0?=
 =?utf-8?B?clFIaFlERXY5ejlzcUVXY3FWM3BPWXd2TkNzZ3I2TVA4aTc2QjB0NmFwUnd4?=
 =?utf-8?B?VHhnSDJRZG5XeXA2WjRLcERkbUtzSFA3L091MGh3T09vU3NsWVhGMmhjN2Ny?=
 =?utf-8?B?WjdabTdXd3U5a29iWitodG9rK2JxMjFXQzJjdjlkMzhLOGl3UTBnWENsVTE0?=
 =?utf-8?B?SjY2Y3dFZ3NFMVd5M25KVnpOYVk0Tm81UXRoZWQ5amd3YlBkNzcxREU2VkdQ?=
 =?utf-8?B?c1J3K0tkbENmRVMzRzBRMG4yVk5LOUd1c3FtS2NKMXNyU2gxVWxPL3F1VXNx?=
 =?utf-8?B?VlJEeUp6UDRJS2FyZUVpalR4U3ZWUVdnSzlCdEVPTXJsM3g1Q2JLMzFIdnkz?=
 =?utf-8?B?NHZEK29ORXgyNUkyUWQydUNpMU5ST1MvVGxra2RUcFNXa2h1NFY4N2ZtbG5m?=
 =?utf-8?B?VmsyTXNkRk55YVpUSzlQVlVxcVBVb21JVEcvMERRbjNiNktvQ0U0d2Z1SURT?=
 =?utf-8?B?Y0ZYRHgxa2dEQkh4MzB6N2hta0FNVG5UNUZ5Sm9JelJwMEhBL2xjTFJyYmFN?=
 =?utf-8?B?QnZ3a1hveUFHRC95elAxUHZFRzg2Zy9RakxSb29NM0M2a0dIR3Foa1huTEZs?=
 =?utf-8?B?TUVJQ2hmVEw3NlFtTUJYOHJ1cHZYRjdzbEtSd3cvM1U5bDYraU02UjdRUmN0?=
 =?utf-8?B?ek5WSlZoZm1yT2xqSmZlaldpc0crUitSbFRWN3JlUEkzM0hRK2pGaEZYOWJj?=
 =?utf-8?B?WXNPZWlObkVQeVNDZi9vNzZvZlIvdElldmlCcENiUUtVdG5ubXpLcXNzT2lm?=
 =?utf-8?B?dFNPUE56VVVNeVlONVlPTXY2d3JLeG9DSG15Qis3SlRJcU13bnRyWm4yYkZN?=
 =?utf-8?B?OTJaNXhmNE9hKytOMk1GZDZXWVhjekplQU9VR2xjdmF5U3ZsU1VNMURqNHJi?=
 =?utf-8?B?dUVEaE1tczlhYnRnaW9XbFNQSUVnUXFaRXQ3YStsWHhER3pHVXAwRHpaZjk2?=
 =?utf-8?B?WHB4R0xycktWNEpPNVE3Z1IrZjUwS3hhUTZlRlNWK1VLbFJzSTJkVUx1VUZa?=
 =?utf-8?B?L2xnM0RrSm5KaHI2YjVadmtic0lZRzFhWjNpeDlqMDdrNGNkRlV4ekVvWEgr?=
 =?utf-8?B?Vkp6R0tXOWNnWXhLUmlrdnZ4eXZHRk1MN1RIT0ZSZXVSOERVNXdxdTdhMWFI?=
 =?utf-8?B?Rm1ORWsrMlNiMTVhM2VkVWwyWkVaUXdvTGxhcXNkNS8wQlQ1V1l2TXRoLzlq?=
 =?utf-8?B?b3djZWIweS9CeTNjRjlnWStqdlo5TGJLNjI1ZmljUFFMZkFCVmVyK1RCRTc1?=
 =?utf-8?B?TXlkblkzWkpRU2Vhdk8yQTlGUjNYYmVyMGE3ZnRjVlBEMCtkZ2NrUExzZmVS?=
 =?utf-8?B?dno5SlJPRFRTRUxwcmhxbGl0ejR3NmhLc01yQWZldmxORmR3cmRpYnB4Q0JD?=
 =?utf-8?Q?GrjnEs5GEs4dM0NhyvsLRs9Ol6TMRrkhMCaRoFU9iQ4nj?=
X-MS-Exchange-AntiSpam-MessageData-1: 7m+IcpAWGZ8zBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19af0183-35cb-416e-b7db-08df38d8319b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:55:30.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvZr/X9DBn5Zlj3jlfzsfo5bK2kRDY2o0nfd8iGqFLxuLYVnpgbXDsYC4rH6plTZL/2Xye8bEmMxApRAxPrtdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB786665

On Mon Nov 2, 2026 at 2:46 PM JST, Eliot Courtney wrote:
> On Fri Oct 30, 2026 at 4:41 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> The r000 firmware uses msgq v2, the queue layout that keeps the queue
>> pointers in BAR0 registers as counts that do not wrap at the ring size.
>> The r570 firmware's layout keeps the pointers in shared memory as
>> indices into the ring. The two layouts differ in where a pointer is
>> read and in how the size of the region that the driver may write, and
>> of the region that it may read, follows from a queue's write pointer
>> and read pointer. Splitting a region across the end of the ring is the
>> same in both, and whether a region wraps follows from the order of the
>> two pointers.
>>
>> The functions for the writable region and for the readable region each
>> branched on the order of the write pointer and the read pointer. Each
>> branch chose where the two slices ended, and the function then built
>> the slices with open-coded pointer arithmetic. The SAFETY comments
>> argued the slice bounds branch by branch, so the switch to msgq v2
>> would have had to rewrite the branches and the argument along with the
>> pointer rules.
>>
>> Compute the number of slots in a region and its start slot once. The
>> first slice ends at the end of the region or at the end of the ring,
>> whichever comes first, and the second slice carries the rest.
>>
>> The number of slots comes from one helper per queue, which are the only
>> two places the msgq v2 switch needs to change. The two slices are built
>> with separate from_raw_parts calls over the slots the driver currently
>> owns, rather than by splitting a slice over the whole ring: a reference
>> spanning slots the GSP may be accessing would break the contract of
>> Coherent.
>>
>> No functional changes.
>>
>> Assisted-by: LLM
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> Do you reckon you could tighten up/rewrite this commit message a bit?
> For me it's a bit hard to follow.

Absolutely. And I'll also simplify a couple of others as well.

>
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 96 +++++++++++++++++++-------------=
-------
>>  1 file changed, 47 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index a271114fb54c..7350074a9f96 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -186,60 +186,64 @@ fn new(dev: &'a device::Device<device::Bound>, bar=
: Bar0<'a>) -> Result<Self> {
>>      /// As the message queue is a circular buffer, the region may be di=
scontiguous in memory. In
>>      /// that case the second slice will have a non-zero length.
>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mu=
t [[u8; GSP_PAGE_SIZE]]) {
>> -        let tx =3D self.cpu_write_ptr();
>> -        let rx =3D self.gsp_read_ptr();
>> +        let avail =3D self.cpuq_free_slots();
>> +        let w_slot =3D self.cpu_write_ptr();
>> =20
>>          // Pointer to the first entry of the CPU message queue.
>>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msg=
q.data[build: 0]);
>> =20
>> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
>> -            // The write area is non-wrapping, and stops at the second-=
to-last entry of the command
>> -            // queue (to leave the last one empty).
>> -            (MSGQ_NUM_PAGES - 1, 0)
>> -        } else if rx <=3D tx {
>> -            // The write area wraps and continues until `rx - 1`.
>> -            (MSGQ_NUM_PAGES, rx - 1)
>> -        } else {
>> -            // The write area doesn't wrap and stops at `rx - 1`.
>> -            (rx - 1, 0)
>> -        };
>> +        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu=
_write_ptr`, so the
>> +        // subtraction cannot underflow.
>> +        let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
>> +        let in_before =3D avail - in_after;
>> =20
>>          // SAFETY:
>> -        // - `data` was created from a valid pointer, and `rx` and `tx`=
 are in the
>> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write=
_ptr` and `gsp_read_ptr`,
>> -        //   thus the created slices are valid.
>> -        // - The area starting at `tx` and ending at `rx - 2` modulo `M=
SGQ_NUM_PAGES`,
>> -        //   inclusive, belongs to the driver for writing and is not ac=
cessed concurrently by
>> -        //   the GSP.
>> +        // - `data` was created from a valid pointer to `MSGQ_NUM_PAGES=
` entries.
>> +        // - The `in_after` entries starting at `w_slot` belong to the =
`avail` entries that the
>> +        //   driver is currently allowed to write, and so do the `in_be=
fore` first entries.
>>          // - The caller holds a reference to `self` for as long as the =
returned slices are live,
>>          //   meaning the CPU write pointer cannot be advanced and thus =
that the returned area
>>          //   remains exclusive to the CPU for the duration of the slice=
s.
>> -        // - The created slices point to non-overlapping sub-ranges of =
`data` in all
>> -        //   branches (in the `rx <=3D tx` case, the second slice ends =
at `rx - 1` which is strictly
>> -        //   less than `tx` where the first slice starts; in the other =
cases the second slice is
>> -        //   empty), so creating two `&mut` references from them does n=
ot violate aliasing rules.
>> +        // - The slices do not overlap: `avail` is at most `MSGQ_NUM_PA=
GES - 1`, so `in_before`
>> +        //   is strictly less than `w_slot` whenever it is non-zero.
>>          unsafe {
>>              (
>>                  core::slice::from_raw_parts_mut(
>> -                    data.add(num::u32_as_usize(tx)),
>> -                    num::u32_as_usize(tail_end - tx),
>> +                    data.add(num::u32_as_usize(w_slot)),
>> +                    num::u32_as_usize(in_after),
>>                  ),
>> -                core::slice::from_raw_parts_mut(data, num::u32_as_usize=
(wrap_end)),
>> +                core::slice::from_raw_parts_mut(data, num::u32_as_usize=
(in_before)),
>
> Can we use io_project here? then unsafe as_mut() because they are disjoin=
t
> e.g.
> ```
> let after =3D io_project!(self.mem, .cpuq.msgq.data[panic: w_slot..w_slot=
 + in_after]);
> let before =3D io_project!(self.mem, .cpuq.msgq.data[panic: ..in_before])=
;
> unsafe { (after.as_mut(), before.as_mut()) }
> ```
>
> Same for the other spot. Gary also suggested this on v3 [1].
>
> [1]: https://lore.kernel.org/all/DLMUKFL5CAZ5.2ICMKG94JXP52@garyguo.net/

Yup, I had forgotten about that. Done, thanks for the reminder.

>
>>              )
>>          }
>>      }
>> =20
>> -    /// Returns the size of the region of the CPU message queue that th=
e driver is currently allowed
>> -    /// to write to, in bytes.
>> -    fn driver_write_area_size(&self) -> usize {
>> +    /// Returns the number of slots of the CPU message queue that the d=
river is currently allowed
>> +    /// to write to.
>> +    fn cpuq_free_slots(&self) -> u32 {
>>          let tx =3D self.cpu_write_ptr();
>>          let rx =3D self.gsp_read_ptr();
>> =20
>>          // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invari=
ants of `gsp_read_ptr` and
>>          // `cpu_write_ptr`. The minimum value case is where `rx =3D=3D =
0` and `tx =3D=3D MSGQ_NUM_PAGES -
>>          // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) -=
 1 =3D=3D 0`.
>> -        let slots =3D (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
>> -        num::u32_as_usize(slots) * GSP_PAGE_SIZE
>> +        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
>> +    }
>
> optional nit: it may be nicer (for r000 as well) to have the helper e.g.
> cpuq_free_slots return (u32, u32) with the starting slots and the # of
> slots.

Do you mean by merging e.g. `cpu_write_ptr` and `cpuq_free_slots` into a
single method? These two are called in separate contexts as well, so in
these contexts we would have to ignore half of the returned value (that
we might have performed I/O to obtain). So I'm not sure that it would
really help make the code more readable here.

> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

I won't take it this round as the next revision will change
substantively, but thanks for the review!
