Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346226;
	b=5dzU79W6dWefsCyQ9iHGJKkPWZ2xsyqHH5aIpi4xwWckaHgjOF0zBMSfU08nGqggCHT7
	 5dD/oYDMUMicuG3AOkRnyGMw+ugiW0/3OFUE4ui61xJsMvZYMOOIeHbd6UdL5WcuEyn/5
	 15g4AIcvGBFO61FmLu0ncffDX1en9/ICRYHb2bfNT/0MXmCwMYc+9QVLk1BDOb7dA7+hz
	 sltY8ZNtgROne+K7SC9k3tODLd96O+oRySRaK/KP/+NiJhEOMLHwLwW6SpA5bc5CSjR9F
	 UUVznQdRseUcofqVTm633KvKugKF+f4rgou94p+gDuUNi68dwY7GXIzZ7/iatCg/fqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346226;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=zVnbQGuf0yFKie8k0p81VlUeOIitUox2E18X6eywmHg=;
	b=UkuTkmB1EZYepBaEXtmetmzsdN2hO3ZIZTVG8hd8O2h2UXlAutYOvPd3moPpL5gwvnBM
	 wB8MPEzojJi/4JYIiE4UIOuyteinRkt3yCbzQQL8fGXXuZ2iPh7hfDBYzb/s/RfpO5p0X
	 NmJMEtjvRN1lVBt2gofs58yF5eMueapyx1UXhkQ4jBJcfdw97zq3O5f2V9VIYUqP6pgl0
	 dt1LYWADgPLtpr+ZnB2ijnnuZkWrF3X7EI/x8EHAMkHIO8UQiElCK2u6IQ0FYM0IZb1I4
	 DtQxprB22CPyx0Vc9A8D1uMT2r/TYH4O6rU41lYXR4GJq5rNoC/MTKaSpgSmDU5nfYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E4spyTZ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F05606A331
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F05606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E4spyTZ0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms1E+qM/21wA3ruKRH0beZydF0HVvArCjB1MDC9dikw7fo/yEPt0p4Indtx85FVdcbXQ7Ytj5r3Zn8uq6axE2BL742czwQtCNQSwCvOPTbqD7VPfWpb4FdtGklBudJtOFj9ikAvAj5kWAbkK0WhryiURcArouGm14D60nfDwxELTKyYAjYrNAKEtbJtufbZ5rRX6XO0d5idsBRcXQ4pt+fpuqXnRzMAI7TM+1LRo7TTEGW+X7BM/uHKe5YqhB0hdGTQSIRQqX2t+PXhRMKOQ5wCl3zDkVDeevR60jQdNajf5dQoaOw8a9iRqWv+Sv1Dik1CwNj4wWnVV6BN85bsKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVnbQGuf0yFKie8k0p81VlUeOIitUox2E18X6eywmHg=;
 b=u1Ad2pXdZxJpb16+xFOt5FpiXHDduAEVGwAxloMmcmsH9Uci3aspm9dfS4SH9pQXayraOmZVtmEIz/7JlP7TBU9A5WuNbV0P5WAIhnGQd9HSUvyQa9gFSbBA8MnMhfuh/cfWoJrf2GOfGtmigFcEB6uUij2ERhtGazGWPbSOgnH0Mm2MN92CoQd40dKIKCKxAxMGIs893oq4xiLyib/7XZrGkX8s+86RFP/4wTJZ9WHocY+zcW8hXrUR5X9K7e/rIlgca95CNieTL/8zpPokIgXtMTb8ryXrvXynehK+3sent/Z415/k847zq4RIxjD655vFeoMIkTXm23E5lTP4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVnbQGuf0yFKie8k0p81VlUeOIitUox2E18X6eywmHg=;
 b=E4spyTZ0gvoFCeBeiceEcddivEfGXYUizdIguvKHcFyIrXDcnuExoshaf7LHxmAh9Q0Uom2CcALKHlBEM/RcGNNITFmdL6qJPSN1QZlgAGXrCklQVssQ2qWps49hS1CX4i7FAAUU4x888jSZKdvKfw8C/AUMYnMsXairm4sykNQJ8JGxK40RczBxl7VfAh7+bTUXtsQQKKejpnStF4QcLOYiYVdLInehwIUmPj7HkP3Yy9JmL6uhcs7JA6w2Iq7rWS87N+gW8Cv9V74SCBQsKpBqe2VlB9r9fAgARZyc9NgvOz8xjPjR0kFdJmbTJzeQTLndyuCXinTL4XLogJ3RLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:43:42 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:43:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 30 Oct 2026 16:41:35 +0900
Subject: [PATCH 4/4] gpu: nova-core: gsp: cmdq: compute the queue regions
 from a count and a slot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-r000-cmdq-prep-v1-4-f2befbcd8ba9@nvidia.com>
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: ea577654-4de3-4c95-2c32-08df3659848f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QyJlEUR5jbtVGhWQhvxfafFf5buMXYuSBTijcsecLJoDI9Knj5Mlnf5DXV+5DiO+5ExUbKeYT4bWu+fBwNrOnGxBL9SuOZrFkS0/QMz708CjJw9U2eLhrgLthAF4tEWzByEQBW07sEu8b/Y0RYysgRYAlyavoTCKhvzUoNKExPmDnE59hOwHN7adUZ7Yu1t0W60dFy9I/VMm9S0e0JSLP9tMbHBx1BWj44utGy05v2INdQoDfvirFk2ZchqUTPOTQP0C5c+bxV6iU7CfSnrzRpAxadJHP972BjG9KG8UYPQSKrJiAbDShzCZe+fl2+uSzW7bTNMYS/Hg1CUV4B33s8+IDfNX2NPv1xNsDPtKdoeSTtpYV2et2mV+JpbgtNUsFzdwBVhK+nlGu8uBGLhh0M+w94zE/WHsVQyDCN8SaTf/GiQHreL/XI9gNcOeBI4/hulEKC5Q9YVVXSgK/Bfq/pnk9s3LxZ5/7jgbg2ZXDzW0sIRebsZ6U9eRO7SixvPdnxDnJTaKVbqrLMf45+gYh6TrGMZN4z4H7306+zqgfaM7DTWV1yXboX4pXcim6nz4JH/WHIoksh2Zr4ImliJ0+GXEPgfH4FwgvyJHI+caPo6Gwab2vqNKijMnPmpurzOh/47h+iKDO50QS76EH0nBRhf14eRMq1wIu/DsmCo8RD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3NBdWw5U1hYT1h1M05xM2tYUTY4aXpNdFFnRXZDOS8ySFB3MXFrMWlidFpZ?=
 =?utf-8?B?UkFFLzJqUSs3VWY5N1pqWCtKc0doWUJTWWswZEFjZUtrZDU0RWRsRVRncDJa?=
 =?utf-8?B?bmlVbnBpK0xwK1pqaUZNeWV5MzBVSE1pNUsvQk52MUhjdzNvdEwwTWxRZmZ3?=
 =?utf-8?B?dWQvb0xWakMwWTJXL1pTZ3J5TkxGVTJESVZuM2pZKzE4VzljUzU1ZEFsMnpa?=
 =?utf-8?B?ZXdDV05TV3ZYY2RBbUFVWXIxWVhVRlRNOUVpZm5yWVJxWVBzdVM2d1VRQTZj?=
 =?utf-8?B?dkN4UEtMMlR4TmMxV2c1ckF4Z09qdENnKzkrcERVaXlQT3hKT05ZN213Tm95?=
 =?utf-8?B?eVI2WVZEUXJQbW5SMysxRnJrMGw5cFNvRXI5WUFYSGt2VzVqMUxvVzFWRkpx?=
 =?utf-8?B?YmUraWVPQm1WcUkvMGt6Tmc3aXk1TldjRTgwK0ROa0pLVlAxNGFPT2R1NUhC?=
 =?utf-8?B?V2h5Wm1RV3FEWkt6WGZ5bjVhMVQrYURMdUVXbVhDWG1RZmJ6aDdZTHlLamxY?=
 =?utf-8?B?YXc5UTRYSTBSZkFtSlkrSXQ5MDNCK0tVUzRiQnJqa3NnbGpBZjNMTmFkSTF0?=
 =?utf-8?B?S21aTFRLY1hmWFRRTkgwWDQ3RHZ2Wks4TkRmMDMxQmk5WEJ1SzVvRjBrUy80?=
 =?utf-8?B?MzIweW9JMnJXa3E2YnFZRDc3RmJFTEkyOGZRQWUzSFZMbi9ndlJkc1R1Vloz?=
 =?utf-8?B?dTc5ak5tSEIzTVRuTVc4KzZjLys2dWtLbUQ3WEtrNWxIdjN0UzliZUVSdkRU?=
 =?utf-8?B?TUhHcDNoeHZZSy9McUx1bU5qS3J6V2FiNEpJT3REeHFlb0RmajNvaE1ySkxW?=
 =?utf-8?B?Tm04UjEwbFFEMFVDeSs1ZWVnWGI3ZHR5ZldzTTVWVE5sWWN5dGZSSjRLai9o?=
 =?utf-8?B?dFlvcDl5aVZOMFVMOGRMc3MrUTJzbGNWamtPc1NtNXZobXcrdlVDSFpETXp2?=
 =?utf-8?B?Y2J1azhxdjlPRExsODgyRVh0VUpaN1N4enUwZGpTd25YdVFnUnlnd3dycmV6?=
 =?utf-8?B?eFRmNVBBSXZGcnc4WS9FZDcxdjYveXYxMkdSbno3Umh6Y2UrTktWSmdack5Y?=
 =?utf-8?B?VnNlZEJjVmpYYkp2bWZ0cXZzTXc3NlFqcG50SEdrUkVqaThqQ2hxSDhxb2FZ?=
 =?utf-8?B?ZGRuYzl0VDUzM1RBOHpxWlNMNEdmUkR4Z3FzVGFmS1h5Qzl4cExFcXNkM0Ry?=
 =?utf-8?B?Z0JydjU3cDJzanpOa1lFUVVUM3pxdXFqOTZERDRQT0Rsbm1qcXFjcmF6STcv?=
 =?utf-8?B?TlY4R0JqRXVOWG5ydUtHSk1XR2l3b1hJYlg3WURSb3FFT3ZaNTBjSTFuS3N2?=
 =?utf-8?B?ZHcwM1RJM1dGSHVNRmEvTGNiMVRNMVdhMDhlZys4LzJYWjROYUJVaExzTmli?=
 =?utf-8?B?VC85dWJ3K3V6OXROVHVzYXc2SHFMZ3ZWYXE4MW1MemNlRElxVDI4Q3ovc2ZQ?=
 =?utf-8?B?OUV4eUxOeFVmcmVMZkRXd1BLMjd6US91MTMwcDJVQldkTFdaNXdqVWs3K1g2?=
 =?utf-8?B?YVd4eC9FdCtWZ2tiYlI1SVBOcmJPYjZXajdFOVNYd1RJWnNoeGVTN3JHS1FR?=
 =?utf-8?B?bTI3MGJoMzIxS2ZxMndFS3dzUXg1OXozMGFZY2FYd2FJLytZcTN4dFRUL0g3?=
 =?utf-8?B?dkJQMDRMNnYvcHViS2pSRzg5dlV5a21FNDI1UWJTcnRDTHRib0tFQzJzazZS?=
 =?utf-8?B?RWgrOFFzLzRRY3llaEw3SlJMUXNBNWRjdzJRcnVEYlRwK2pSR1FCeHdrbkZW?=
 =?utf-8?B?WFRjd1RYaURDVjE0aEFRRzdHVElGRjM1ckxHM0d6UG9PdFJsZnFaV1hRbHZH?=
 =?utf-8?B?SzkrZVVzZlJFV0ZTREVYZkQ5UFNLZzQvc3dFUGpyK2FyZFY5bDdwNHBiSUIr?=
 =?utf-8?B?WkRmVmlnTHZyK3VzN21WL1pKY3hUa1ExbUZEUE9tOHZaUE5GdVYxY0lsMitr?=
 =?utf-8?B?OExMYnNRY084dzJNY2diaVZjL1pSblczN0h1ZUQwRGloVXRjNWZVRzNnb1ZJ?=
 =?utf-8?B?RXI5U0RKWVVoMnM2Wkp3TWJqOG55Z25CSHgwVmYrRDB2SjE2SkxsRm84ZHNP?=
 =?utf-8?B?OXQ1SGtidmJWTWEzZTRnZDMxODRqS3hvN3NjMndqMXRqZUUya0JJbGRqZDVO?=
 =?utf-8?B?VjZvNER1Z0JjcEQyKzRhK0dnR1R6eTZ3MVVyTlBVd2dHclE4dkhONWJwL0di?=
 =?utf-8?B?eEpnWXNpTkdoSWd0ZzFQRW5zcWErYzV5UFJRamdxV2Q2d1FHU0NjUFBSNFN6?=
 =?utf-8?B?blJwdC9qTEVUSThkNUNuakdsMGhaSVZDUmw2d1pWWFYxTDA4M2Z6R1U2Z3Ex?=
 =?utf-8?B?Q3JWUlpHbUhhNk80azhXNXZienp0YUxUOWhoNHh2MCt6WHZGdVdMZW9BUURm?=
 =?utf-8?Q?Xj1x6NgNzwK+PEO9ux8C7obpMz4+/yBJov4BFYWPVX+1y?=
X-MS-Exchange-AntiSpam-MessageData-1: jd7PgD//7a+wmg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea577654-4de3-4c95-2c32-08df3659848f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:43:41.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiThcdv/xIUabAW38E3SMmAIToGqeNZacmyt6/lAWmLY+cNxLyY/t92UY9X46rbmZUdkf7Nhrr3Bs/st5gk/LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

From: John Hubbard <jhubbard@nvidia.com>

The r000 firmware uses msgq v2, the queue layout that keeps the queue
pointers in BAR0 registers as counts that do not wrap at the ring size.
The r570 firmware's layout keeps the pointers in shared memory as
indices into the ring. The two layouts differ in where a pointer is
read and in how the size of the region that the driver may write, and
of the region that it may read, follows from a queue's write pointer
and read pointer. Splitting a region across the end of the ring is the
same in both, and whether a region wraps follows from the order of the
two pointers.

The functions for the writable region and for the readable region each
branched on the order of the write pointer and the read pointer. Each
branch chose where the two slices ended, and the function then built
the slices with open-coded pointer arithmetic. The SAFETY comments
argued the slice bounds branch by branch, so the switch to msgq v2
would have had to rewrite the branches and the argument along with the
pointer rules.

Compute the number of slots in a region and its start slot once. The
first slice ends at the end of the region or at the end of the ring,
whichever comes first, and the second slice carries the rest.

The number of slots comes from one helper per queue, which are the only
two places the msgq v2 switch needs to change. The two slices are built
with separate from_raw_parts calls over the slots the driver currently
owns, rather than by splitting a slice over the whole ring: a reference
spanning slots the GSP may be accessing would break the contract of
Coherent.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 96 +++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a271114fb54c..7350074a9f96 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -186,60 +186,64 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
+        let avail = self.cpuq_free_slots();
+        let w_slot = self.cpu_write_ptr();
 
         // Pointer to the first entry of the CPU message queue.
         let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
 
-        let (tail_end, wrap_end) = if rx == 0 {
-            // The write area is non-wrapping, and stops at the second-to-last entry of the command
-            // queue (to leave the last one empty).
-            (MSGQ_NUM_PAGES - 1, 0)
-        } else if rx <= tx {
-            // The write area wraps and continues until `rx - 1`.
-            (MSGQ_NUM_PAGES, rx - 1)
-        } else {
-            // The write area doesn't wrap and stops at `rx - 1`.
-            (rx - 1, 0)
-        };
+        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_write_ptr`, so the
+        // subtraction cannot underflow.
+        let in_after = avail.min(MSGQ_NUM_PAGES - w_slot);
+        let in_before = avail - in_after;
 
         // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_ptr` and `gsp_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `tx` and ending at `rx - 2` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for writing and is not accessed concurrently by
-        //   the GSP.
+        // - `data` was created from a valid pointer to `MSGQ_NUM_PAGES` entries.
+        // - The `in_after` entries starting at `w_slot` belong to the `avail` entries that the
+        //   driver is currently allowed to write, and so do the `in_before` first entries.
         // - The caller holds a reference to `self` for as long as the returned slices are live,
         //   meaning the CPU write pointer cannot be advanced and thus that the returned area
         //   remains exclusive to the CPU for the duration of the slices.
-        // - The created slices point to non-overlapping sub-ranges of `data` in all
-        //   branches (in the `rx <= tx` case, the second slice ends at `rx - 1` which is strictly
-        //   less than `tx` where the first slice starts; in the other cases the second slice is
-        //   empty), so creating two `&mut` references from them does not violate aliasing rules.
+        // - The slices do not overlap: `avail` is at most `MSGQ_NUM_PAGES - 1`, so `in_before`
+        //   is strictly less than `w_slot` whenever it is non-zero.
         unsafe {
             (
                 core::slice::from_raw_parts_mut(
-                    data.add(num::u32_as_usize(tx)),
-                    num::u32_as_usize(tail_end - tx),
+                    data.add(num::u32_as_usize(w_slot)),
+                    num::u32_as_usize(in_after),
                 ),
-                core::slice::from_raw_parts_mut(data, num::u32_as_usize(wrap_end)),
+                core::slice::from_raw_parts_mut(data, num::u32_as_usize(in_before)),
             )
         }
     }
 
-    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
-    /// to write to, in bytes.
-    fn driver_write_area_size(&self) -> usize {
+    /// Returns the number of slots of the CPU message queue that the driver is currently allowed
+    /// to write to.
+    fn cpuq_free_slots(&self) -> u32 {
         let tx = self.cpu_write_ptr();
         let rx = self.gsp_read_ptr();
 
         // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
         // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
         // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
-        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
-        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
+    }
+
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        num::u32_as_usize(self.cpuq_free_slots()) * GSP_PAGE_SIZE
+    }
+
+    /// Returns the number of slots of the GSP message queue that the driver is currently allowed
+    /// to read from.
+    fn gspq_readable_slots(&self) -> u32 {
+        let tx = self.gsp_write_ptr();
+        let rx = self.cpu_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_write_ptr` and
+        // `cpu_read_ptr`, so the subtraction cannot underflow.
+        (tx + MSGQ_NUM_PAGES - rx) % MSGQ_NUM_PAGES
     }
 
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
@@ -248,37 +252,31 @@ fn driver_write_area_size(&self) -> usize {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.gsp_write_ptr();
-        let rx = self.cpu_read_ptr();
+        let avail = self.gspq_readable_slots();
+        let r_slot = self.cpu_read_ptr();
 
         // Pointer to the first entry of the GSP message queue.
         let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
 
-        let (tail_end, wrap_end) = if rx <= tx {
-            // Read area is non-wrapping and stops right before `tx`.
-            (tx, 0)
-        } else {
-            // Read area is wrapping and stops right before `tx`.
-            (MSGQ_NUM_PAGES, tx)
-        };
+        // `r_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_read_ptr`, so the
+        // subtraction cannot underflow.
+        let in_after = avail.min(MSGQ_NUM_PAGES - r_slot);
+        let in_before = avail - in_after;
 
         // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `gsp_write_ptr` and `cpu_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `rx` and ending at `tx - 1` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for reading and is not accessed concurrently by
-        //   the GSP.
+        // - `data` was created from a valid pointer to `MSGQ_NUM_PAGES` entries.
+        // - The `in_after` entries starting at `r_slot` belong to the `avail` entries that the
+        //   driver is currently allowed to read, and so do the `in_before` first entries.
         // - The caller holds a reference to `self` for as long as the returned slices are live,
         //   meaning the CPU read pointer cannot be advanced and thus that the returned area
         //   remains exclusive to the CPU for the duration of the slices.
         unsafe {
             (
                 core::slice::from_raw_parts(
-                    data.add(num::u32_as_usize(rx)),
-                    num::u32_as_usize(tail_end - rx),
+                    data.add(num::u32_as_usize(r_slot)),
+                    num::u32_as_usize(in_after),
                 ),
-                core::slice::from_raw_parts(data, num::u32_as_usize(wrap_end)),
+                core::slice::from_raw_parts(data, num::u32_as_usize(in_before)),
             )
         }
     }

-- 
2.56.0

