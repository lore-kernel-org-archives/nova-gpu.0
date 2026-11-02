Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621419;
	b=QYA2p+/a+EFMcajCIOjNSTCNKGPx43DSKdlhmpAve0PTVkSdjNXVlO1eBX9bQOIo0BKK
	 UQTm8RhICkWMYrDsRfySnBjlcr96aalsgQPV8AicYeNwMnv+pF3fPPwAn3GmgBplhTiIf
	 LLu3v80T2EXjdvL7f5klj1IAk9o3EE4TVB+0W1cVp2FYcF/BOi6Ty8OkWyLGcwrPxfRcu
	 kzFHEakwJKRE7xl84DHAYKQTkiinqi+z+coG8Tw75PAutMnCmhqsZeVo0ILd+2sIhBWVX
	 fCeFJYIfpS4gk3vpbULtjAusAS7NnHXg2AYfqK/sNrn2h1fk45850jK1zuCeRv0VDmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621419;
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
	bh=k59YMpHVAbvJbHlfX+62rcCX4HluNH9bNBVRwvo0TtA=;
	b=KJe5U/lZIK9dXFLJr9tmyb1vy5oPATlBt8maXfc2ElcXvY9OlJUoHRfUQRBcw51pJ7Gh
	 BSxO7OiTFc8673fCs9yvREi0gOIhPSjQPv//y056B8P+FOmQA3uKOVfRunphwel9bpoI2
	 IP2/E9VUrmf2zxh7hlbCarTstB9lGw/0mr8rZkmat5XI5RtbjixGPwOjPw5AEHCCbpAsN
	 0V0HYeMnSIYrZxhLE7BbNSqkfQYyTHuFH4TVVT7ckvbVevbLbHvvx4uNj1v4WrIB0A9jM
	 iHtGQfJhIhDtNCAQzlrTEjnBFTIcZhGJyNx9UzqqIg+kFi7RFTeCXnYHS/No71UyVcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="XcRdb/4w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.38
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E4606A33B
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738E4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XcRdb/4w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lACLS3d14b8HGZ7TsKlZ6XZpzjfEHEJhhJSPZOqTwLKAEHjzNbbnD+vhO4oLhaGqmDnPO3/7Av9/5Yw5nTc5lCMTXJH5hY/Z4MS2DeoESwQrXSCpSqh48q/T2jMwVRmzBvBNNTR7fEWl1skn8n58H+RHZQ4VHTuJ5S80CWIchx8S3rji7TBhnbmmYMA9EmbOcJCespiBrju4P0OzsI9pxL/46TzJiqApXM5aM+PK7KDfOQqvdql+Hz/NM9L/I0d6xgjXQCG6ZYXTmzcWAOgu1cFgV59iZ5Oh7B2+lYH8a/Awn/x/Y5egZMPVGM3DOwiIb/Yvj/cUsHBw/uH+IFlnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k59YMpHVAbvJbHlfX+62rcCX4HluNH9bNBVRwvo0TtA=;
 b=dT7dg/mz4rhLc+UFdBzBzjZon+gJ7FKbLV1m+v5lGRPXV90nwm4hpKU+4F/a+BkI55bjlDh0Vbjoau0eEpx4pMhxW8tPrz09y3VWyuNWdCETONXuoxXl0lXizIfJfeSiDj/exvERlS6Tobeus5mbDGKSfhN/If0EEx8aqN2jxgOMr53LZp2LJG3B2kyl7oyYJiNnEP6zMShwTJ5rKLW12EfDvoGbmxaChzAWqmeygUQMWDifkzEi5HuWN8YVJZB6w2tBjRMJAmnN0YlrJ4Y7Nqk7kKj/bqNTqrsWeFvcDRUZ7ijFYtGzdSQA2kCoWLF9/SE88tT8+Wy3CPJpw+ks2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k59YMpHVAbvJbHlfX+62rcCX4HluNH9bNBVRwvo0TtA=;
 b=XcRdb/4w2dMGQd5J91sevx2VS/4rIWfNSroerLO87BUCTnWd6OY++P7pX7+g3bc6aXD0OqsD5P40uU4pfDr638Gslq6GpnOjhrbyBS5cAI+N/qQxw034nJxmKbSsaIH0rcaURnmisMyjbEFX2rsz9KYsCAtuKg1cFwJnWj39X5qAb3UcttqUsQMTFhAGjvUahDUVyVNVZ2yeCsMkBSONsRfa/MHILEGp4ZtEPqwo+RvnsIGRvR1z3jUPkyXV/zLhrv8DkKNHwct9pD/PxjHzdju6p4UaEHvQepZ1nfHWUNthfA8Y/ZaUqpzhAlsp1hctKZcE1xZddm43C8+94CkxjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:15 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:09:55 +0900
Subject: [PATCH v2 4/5] gpu: nova-core: gsp: cmdq: compute the queue
 regions from a count and a slot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-r000-cmdq-prep-v2-4-c2c2b69bdec0@nvidia.com>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0233.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH5PR12MB028906:EE_
X-MS-Office365-Filtering-Correlation-Id: a82a0d45-6241-4a77-1d79-08df38da40ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|261021123027099003|11063799006|261021121427099003|261021135927099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	Fih9t4zfVAmkKAbTB7XrfO+FhnrbxcOxEkciykuyXCT6mOVoUdj5fpbkMrOkUcnXilQ79ft2FdRk1YCQ2OI2nO8Qx4sl15HA1UxbmAohnZO53Ou1twPpt/RC01H2qWQ6H9vf7IfOllj0jGXFMCIhUi6cbCofdEThDoHzw5/wZiymF2nqMXgyIuyfaDJ4JEyx+RKm+0pTuZU69PiOKcMbYvrySE+Z+zRJuNd6vSiG6udDDZJQtaJ0y1PmmraAYIkx5Jd9jCNKIXvS/D69gR2cEr/MPkdcfC+a16lwJJeug1ExiycNaI+GkQ3X/HpNfPeTrsG26lfge6I6ox7SFhjJfVD3DZBcEDFrjj2jViyMmBxwPFmwELXaUwIZyRmvXM3uW+MDNrrGD30L3WiMGjTz59GvUCNc3h9l8e+KfanOf5WgZewFSelRVL2nikM66Nhc4lrsDB4Sd0IxCf3tbTLs/aujGEZPOhzajAxjLZDNOTPzcCBd3zhfiWc52UDFjBEwf5jGKDWfz/SdaB4RnDkWyuCB3Jss5ycd/jIDO6nFi+wgIMuWyOwBE8qhJ4/lfFgtO24kXRExi7duUYgohiTeJv7v7toQ2Iik9DxsvOoQbcKxx8uBIf68GURFLcl43h05UV2v5hQ45RCWEZb8WwZLzZ+Ph791KA6pIMGseDQ0w34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261021135927099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDJZdHo1ckNjU0RBeUtxejhOQ2c4cHh0ZEw3YmJtYjNIelQrUEF6eTZ0dHdr?=
 =?utf-8?B?L0RrQzdWS1ZNWHJRYURNaGdSb2VyUENWR2VRYitPLzhqR0pWUkJuVmp1OWJq?=
 =?utf-8?B?QXhrUUVwZXU3UG5US2ZFcjdMcmdmRDlsUEd1S1k1TkZtZW9INXR4WDZnajZ2?=
 =?utf-8?B?OUMrOVRlSG04dGRzaUJCcGZ5SWg3TVR0NWdTbXprbHA0eVQ5cml1citBWjA2?=
 =?utf-8?B?ZVVIZ1hJWWhvNmdSSStUVGNBRWRiZThHdWZOS01ZOVU2bjRlK0wvekJiNzRK?=
 =?utf-8?B?TWZPMTk4ekpCODFVcFUwRUwrcjNtcDFvZUxObUFZNnlMcWFyNkwxOXNSY0R4?=
 =?utf-8?B?Z1pPNjdad3ZxY2w2MEVNUms5QllYd0EzcHpYZWkwaWRZb25ZTFM0anZqODds?=
 =?utf-8?B?am9LYkZDdDlrZjRHeFRURm05bmdKMnZ4NUFKMFZVbU5uekp6eW5PRVkxdXll?=
 =?utf-8?B?ejlQNW9EdVh6U3piVnJpR3FNSlZYRWVWeTFra0tybTEyRGtPY01rQi9nUjlS?=
 =?utf-8?B?dDVyU3l4VTBUK2JKWkZHMWVnNGcxTlBMM1VqODdCbFV3OFlQa1JSZHp4eExH?=
 =?utf-8?B?TEo4TWxEK3hzTkgwZFg5TVMzU3ZCcnAzVUp1bmY0dFE4enV1TFB2RGFhUkly?=
 =?utf-8?B?QzgzRmpoRHVPTTR0UmxFZzBZKzR0TGxQL2ZPaUkvbXE5bnJhaE9STEF6Tm1P?=
 =?utf-8?B?YnJBK0RyUW5jRmNreXNjOTlQYVZnblIzMnZHY0V5cnZGbVp6R2RoUXovSGUy?=
 =?utf-8?B?RG92ZnhPTUVlYnRLMDVWajRYa3cvVC8zVUwrOWx0VTFPMkpFNE1ycTk1WFhF?=
 =?utf-8?B?cXo1bFVzV3pmcTdQcndpYWJlWWxuMHNJQmdnT2p4WVovL2UwaFVublAvOGtQ?=
 =?utf-8?B?T3l3dVplRVRhY3F3MWRPM3R6UlR4dm1SbnNxWlJ3UEhxOUNlOVdoS21NRTU5?=
 =?utf-8?B?Q3RHMlRlY0RwYTBvWms5M0JwT3l3bWRLRmhRbzk2akd2ZGxCUlJkVFJDNXJY?=
 =?utf-8?B?dEljbDZ5SzVQU2FtRTcrS2FWMDZzRVdXN0NZYUhkRFN1K0ROZmtWdE41bURW?=
 =?utf-8?B?Um43cTBFWEw5cHZ4YUdTc3E3V0d0TUdEdHlLL3BMTTVEdEl1VU41ZWYrNDBI?=
 =?utf-8?B?ZDJvdFhIMUpPTERKdGlxNUhLMGxXY1pXYnUvaEZlODd0SkQyaXg3WHZqUUNU?=
 =?utf-8?B?Z3Z4QitVTFliTEV4cWdGa2IxVmRjTnppSjQ5bUxZUTRNbk9XNDZObEoyU2w5?=
 =?utf-8?B?RmUvSTJjWkJtQkl2YmRnK1hsWkVnQ2h4N09iRHBKUENYUUlaRERwckNTN3JG?=
 =?utf-8?B?Nm5DNHFpRnc2QW1VRlFCcHR6YkE3dFlNcGZNNFpnVGpmcWJJZFlCaXpjaDdR?=
 =?utf-8?B?aFpoemNuazVjZVBGUkVSOGEyYW5VaU81b2dMbHdiMkNRbmdoVTg5V3djbVpX?=
 =?utf-8?B?NjhPaXl1VVZDNzByYW16YUw1NUVxU2VTSEgxVXNrWGlDSlpsOFlGaEFsa1pE?=
 =?utf-8?B?Z0JsbUdIcXZUelJTZUhmL3pVUGhSd2RXY2Jyb3lVQnZweEVhS3FXVFZQRlQ0?=
 =?utf-8?B?ZVZja0lra053WGMxM3FXNzcvNSs4UzFvc1RYL3BQQmhFMldxVSsyNjJ0M3dM?=
 =?utf-8?B?RnJpVjVtUjFnQk5keVh2dy9pMVlET3lVM1JRKzJuU1Y0M2dJbmsybk03MXB2?=
 =?utf-8?B?Vm4zSUNjdm1KQWtXeWZmdGtDYmRwWkxXZnZKL081NEtSSlVyK2x1Rkw5dUFR?=
 =?utf-8?B?T050MDEybmNMVUxkdzFxQk1OWWEyRjFXdmt3Z2hDVk03UVZSNVNwNzI4bzJC?=
 =?utf-8?B?NWVtMDdWaTdHYk4zZk9FOUVjTi85MjIxdFdzSWloQVJUVXREaG9CdzFlcEFL?=
 =?utf-8?B?dStBOE91L29ReXQzaHN3ZHVKRE0rcjdCTDZ3VnNkOFhGMjRqL1V0SG1NZGlj?=
 =?utf-8?B?MlpWM2szRVdXWkdoZ0hSQWhXR0JSWTkxWXB3T2JaWm1zYVdldHFkMUh2bDJ5?=
 =?utf-8?B?d3JyMmFPcjRGUEFoak1SOFFsZEZwWER0cFVBZHZxNVl6a3h2YTJ5L2huYnBL?=
 =?utf-8?B?b0VjSm5QUEJDZTlNdTJ0NERlZC8zK3JKbmYzd3h1Nm5qZnRJNklZWnhpcEpV?=
 =?utf-8?B?Z2tTVFAxMEpvVm5nVTR2My9abDZZVDN6eUk3QVk3RFVrcVM1U2taWklCZ21L?=
 =?utf-8?B?ZlpNbEo4MFBFMnVXU1kwQ2svVVhmTktGVXI4UGx2NFRsZmxMWHlmM2pDVzlZ?=
 =?utf-8?B?NnhuM3ptNXNIay9GekFrckNGeXpTQVNncVZhWjlMYzd4Q25DdDNvU1JmaW93?=
 =?utf-8?B?ZlE1RHpWV3ZZRVpaYkloOERQUGF2dFFQM3FOR0M0QlBYaFpsaEpxdHJlTzNv?=
 =?utf-8?Q?VfcTAL7UHK2DyedQJdf7JRZ75hwszkbnD+5+uPYBetD0r?=
X-MS-Exchange-AntiSpam-MessageData-1: A6wb2PA3LA16BQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82a0d45-6241-4a77-1d79-08df38da40ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:15.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pvqfIJ9OVh0h01F4G9ct4lIdbQFp6XN3K2xkWs2FGKlCnqU19Ht3m73X8K1Ch2bLFlA1ngcUVAicaQS5LblOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

From: John Hubbard <jhubbard@nvidia.com>

`driver_write_area` and `driver_read_area` both branch on the relative
position of the read and write pointers to decide where the two slices
they return end. This works for msgq v0, where the pointers are indices
into the ring, but msgq v2 (used by the r000 firmware) keeps them in
BAR0 registers as free-running counters, so the branches and their
SAFETY arguments would have to be rewritten for it.

Instead, compute the number of slots available to the driver and the
slot they start at, and derive the slices from that. The slot counts
come from one helper per queue, which are the only two places msgq v2
will need to touch.

Use I/O projections to limit the amount of unsafe code to the bare
minimum.

No functional change intended.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 130 +++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 90e26c4dcc28..33cb9174c1e6 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -19,8 +19,8 @@
         Io, //
     },
     new_mutex,
+    num::casts::FromSafeCast,
     prelude::*,
-    ptr,
     sync::{
         barrier::{
             dma_mb,
@@ -186,60 +186,58 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
+        let avail = usize::from_safe_cast(self.cpuq_free_slots());
+        let w_slot = usize::from_safe_cast(self.cpu_write_ptr());
 
-        // Pointer to the first entry of the CPU message queue.
-        let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
+        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_write_ptr`, so the
+        // subtraction cannot underflow.
+        let before_wrap = avail.min(cv!(MSGQ_NUM_PAGES => usize) - w_slot);
+        // Per the line above, `before_wrap` is less or equal to `avail` so the subtraction cannot
+        // underflow.
+        let after_wrap = avail - before_wrap;
 
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
+        // PANIC: `w_slot + before_wrap` is at most `MSGQ_NUM_PAGES` by construction of
+        // `before_wrap`.
+        let after = io_project!(self.mem, .cpuq.msgq.data[panic: w_slot..w_slot + before_wrap]);
+        // PANIC: `after_wrap` is at most `avail`, which is below `MSGQ_NUM_PAGES`.
+        let before = io_project!(self.mem, .cpuq.msgq.data[panic: ..after_wrap]);
 
         // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_ptr` and `gsp_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `tx` and ending at `rx - 2` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for writing and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU write pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        // - The created slices point to non-overlapping sub-ranges of `data` in all
-        //   branches (in the `rx <= tx` case, the second slice ends at `rx - 1` which is strictly
-        //   less than `tx` where the first slice starts; in the other cases the second slice is
-        //   empty), so creating two `&mut` references from them does not violate aliasing rules.
-        unsafe {
-            (
-                core::slice::from_raw_parts_mut(
-                    data.add(num::u32_as_usize(tx)),
-                    num::u32_as_usize(tail_end - tx),
-                ),
-                core::slice::from_raw_parts_mut(data, num::u32_as_usize(wrap_end)),
-            )
-        }
+        // - Both regions are within the `avail` entries starting at `w_slot` that the driver owns,
+        //   meaning the GSP won't touch them until the write pointer is advanced.
+        // - There are no other references possible as `self` is mutably borrowed.
+        // - The regions do not overlap: `avail` is at most `MSGQ_NUM_PAGES - 1`, so `after_wrap` is
+        //   strictly less than `w_slot` whenever it is non-zero.
+        unsafe { (after.as_mut(), before.as_mut()) }
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
@@ -248,39 +246,27 @@ fn driver_write_area_size(&self) -> usize {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.gsp_write_ptr();
-        let rx = self.cpu_read_ptr();
+        let avail = usize::from_safe_cast(self.gspq_readable_slots());
+        let r_slot = usize::from_safe_cast(self.cpu_read_ptr());
 
-        // Pointer to the first entry of the GSP message queue.
-        let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
+        // `r_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_read_ptr`, so the
+        // subtraction cannot underflow.
+        let before_wrap = avail.min(cv!(MSGQ_NUM_PAGES => usize) - r_slot);
+        // Per the line above, `before_wrap` is less or equal to `avail` so the subtraction cannot
+        // underflow.
+        let after_wrap = avail - before_wrap;
 
-        let (tail_end, wrap_end) = if rx <= tx {
-            // Read area is non-wrapping and stops right before `tx`.
-            (tx, 0)
-        } else {
-            // Read area is wrapping and stops right before `tx`.
-            (MSGQ_NUM_PAGES, tx)
-        };
+        // PANIC: `r_slot + before_wrap` is at most `MSGQ_NUM_PAGES` by construction of
+        // `before_wrap`.
+        let after = io_project!(self.mem, .gspq.msgq.data[panic: r_slot..r_slot + before_wrap]);
+        // PANIC: `after_wrap` is at most `avail`, which is below `MSGQ_NUM_PAGES`.
+        let before = io_project!(self.mem, .gspq.msgq.data[panic: ..after_wrap]);
 
         // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `gsp_write_ptr` and `cpu_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `rx` and ending at `tx - 1` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for reading and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU read pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        unsafe {
-            (
-                core::slice::from_raw_parts(
-                    data.add(num::u32_as_usize(rx)),
-                    num::u32_as_usize(tail_end - rx),
-                ),
-                core::slice::from_raw_parts(data, num::u32_as_usize(wrap_end)),
-            )
-        }
+        // - Both regions are within the `avail` entries starting at `r_slot` that the driver owns,
+        //   meaning the GSP won't touch them until the read pointer is advanced.
+        // - There are no mutable references possible as `self` is borrowed.
+        unsafe { (after.as_ref(), before.as_ref()) }
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`

-- 
2.56.0

