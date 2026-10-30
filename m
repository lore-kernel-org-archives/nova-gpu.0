Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346219;
	b=J33atCjYGr1Bqh78Au2I6jE5IuhSF+S2HDboXOWBmDcPHd3cGZCaYTxiTahM+DIr1I59
	 FrgTeLNsX3gAq/j+Qa4K1bWVssrYktT72tVfeXhngr+hmySHlB8Uk6k0hv0mEyu6h9cPV
	 JxHXnnXCccygIldkngMD1/rJGYpOPpzTTCIrHbkQILfe79vTrhjGRt4lLpNJO7eqdgdo6
	 7729hv3f43cOmDdIbAOhca1vfHbP0AU52Vc9rNd5xJcfSQEi1BySZUCiWu2iN95XauUZ/
	 Icll/WXoiP/6GiddL2KZqjIwN3OfQNSWSy3iCYeTOWhxjv3uICOhxXvjyODlIZLWJuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346219;
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
	bh=x5I4QRVzyL4e7PLHZhDQ6qCyhfhSG/qcEta8snTh5C4=;
	b=ote7Uhpyxey/aH0I8fL1g3cACoK8vG9IqRN1kFOizaNPHBOxStw+VcuLtFpWRM9YKHaB
	 zH2q5zoRX4WIEi2kcquq1NLR5TWB9IvHYwxnhiovbR6QEt3kFBYb21B0UGfeOzSPLFglo
	 sOJX25PX7FJRxQc9wQFACc3DcydmY9P8M1eHHU1wLwcJTlXecG3+c9A/xRpeEC8F4gu47
	 q6STi9cOK0uL3mpPBzfuJDkywvo8Duwx88f6NGnXJqOv8zbLvVhdTfqDhSg3c/XwPzklp
	 YPEw66UWBJ7cIfW7FZig6J2X2txtWjwyYR/TFUU0WlTrUirPWya+eHROH3Y6FBFWEsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I3aEmXa5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.1
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85D606A326
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 07:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C85D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I3aEmXa5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWB8CdvXWz5gkciq4VWOnNELYFHr5rEe9iDdwTpmea7WHnYFELRMQnjKeniGfNSGCAu3jsXXvWmGZyzvjVnAlrY/lEzcJnyoE4xQTF9NAdjt0FNglU5l30g27Wefq8bpAjMW8D2CL5T1yUPVgQilfpHRKNX6PRqu8h8hod3EhjwAnl/2AFTRbaNJ9HJ1jru7LmfcjA3zGp9wq+36RXRkljsFbSuzfWtfJNdpXBhy6/84U1qGkiIbzvGvRFUyYyw/Vumn4f3ItyYu5NTgEzcY9+ywc3clyTFlk2ayMugsY3aYIXQ8mj8kVlPMJWxf9+kE+1lWGsNqvA+38PKTwBNfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5I4QRVzyL4e7PLHZhDQ6qCyhfhSG/qcEta8snTh5C4=;
 b=uYQulfdpT/LCImqrrM6b4lWomw8NprF7sVbT1cJh7VAPK7LOrVTSPTR6voNIE48TRi2boplNWZLi+ZIFrLADr3iyVBuHDMwEq6Q2Thaw4eiAiLwwlYMkXRpVXiWl/Dxj83aLcgbQNv9NHYuxBNOgsVATYRMJ3mMPcVN19pP9Ze9zdm1w/H8g+LMZW8avWtcn4vRcREMiX3cPdJuSH5IiVATljUBEKANoJIF0rc8XvtCrWtPQv0uZVjUPp0XuVLOTOgL1fmBTlydPCBnbhZkPkE+5YijHxzt6JGNbfZwN1gIoMRUvFyqPdH9nZlgz3HXWT+WPKVXMVFAxG83KGPHD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5I4QRVzyL4e7PLHZhDQ6qCyhfhSG/qcEta8snTh5C4=;
 b=I3aEmXa5wfZjZSBjamBdaMg9OIoZD6G2+DZvPIhJfMpnfgXBiKjf075WHvn+t77i2sbAFqu5a0drzpftlRoxIPtjyepS7PjY889X/BC6rjVT7drd0fELYJ5y2jodtZ+bF4lwx5jvcn0oWcTlwKI+Y7wMdxYKTX8fSo2Z7LyeX3Xv9osWCaK52dpHKf6vB8pn3rH1WpgfWprrkvyrctdOo014yv5ORoKkqTZvcx9J+Py59q0Pu+yrfk9QqEhmYXkNFEYtBvIQdZ5rT/mxbHfPl0eUdxLTvO7fGA2h7yriz7zN96mWVEfpO4N2LOXlmR+gVZSTSVBzuAHNCICPRPZusw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:43:32 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:43:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 30 Oct 2026 16:41:33 +0900
Subject: [PATCH 2/4] gpu: nova-core: regs: add msgq v2 BAR0 register
 declarations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-r000-cmdq-prep-v1-2-f2befbcd8ba9@nvidia.com>
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
X-ClientProxiedBy: OS0P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 2c2350ca-f383-4c0a-ad65-08df36597f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|3023799007|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cln4H999sVuEJAO0pIk578mXy+NhyP36qzI0ZDaSCOes/p4ccHaiCXXwg3ZArMDF7KRy8uj2ifE7MOX5dQ7irFqtGbYL5ZulwX9+Mbd8sl1reXnzd3S1B7qtwzm4fYszog9rMokcxZwA9nijmrQr1uB0bzI07LbiXmRtszUXCE+iqeANYyXhSMJvpG1CXIicoQDQJxPuMzI6F8+bTTJPJbs7kLbMsIazqAaP9vjJ1bhyryUNUHLn8zh4tYqGOqutuBHpdC05drhwi6vwYwx6VCELjipUyCmVpiHbR5hAxt2283w3UJ3h7bpS2jT5gtU6+//8tRTCmSF96M9+RNxkBZmLU4UYHuq/fDwuJ7QASvEYC+S3ZJstfvATyIvyvVYZKbPjrYwTjJdA9FQS757MlPvBsJt4BVtV8LIL217m5CIQJ0mSKX52zO4ry2yz0O7NdkefHq1Vy9AB9b+pwBsLwtKLtsG/ebbSTimTy0Aq5NDlm34yjt8US7JT5N9x5iKn44EnrS+mLObabAnADJSFCd75A1/NPshTaGRi2V7kHNIEqbEeo1dKEUTcrBAJFesNJH6uNVn0osFavk4cM1NdHLUm2w1E5sZFTlZxg0N9nxVV0CfjMx9c5A4eVvjFT6JTs5zM97YCWnhVezfQ0GAuLe9Q/OKl0iARwGWsRthAZYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU96WnpMRXBacFVUNXpVRzlCaDNKTnh5aWl2aURJQ2JQblFvODhsQ3lLMjBE?=
 =?utf-8?B?M0dhTGdsbkNaUDNVWFJBcXpjdkUzRG1WYnhhVEJtTklwN1AycEgxb0U4TkNH?=
 =?utf-8?B?OWpqWDA4U2FGVTBKL0N1RENZYStSVUpRdU05UVNib3M4VWZBT01iRTJJMGt1?=
 =?utf-8?B?U2dOTXAyRk42emtCemgxbXZrTW1mQ1RMNVMrYUxkZjRCTjYyMDNUS1I1dWVP?=
 =?utf-8?B?a05RZHVHSjljcTdHSTFqcW5nZ0VlellCSUJZMWdtTUZIM1JjUWFsZ0ZyUGJz?=
 =?utf-8?B?S29YYTBucjBFY1g0ZGNRQW5tWkkvV0x4T2w5SE9ob294Ri91d1J5Zm56S2kr?=
 =?utf-8?B?ai9PYnlOajdTeTFDaHVLTVVJUnBjTVRFWDZaZHBENFh3UmJiZnY0eVNUbE9v?=
 =?utf-8?B?WERjT2RSUUd6dGpyd2hEVHplUXhlSnZmamtuempjbXhBSWcvTTB0K25SOG5n?=
 =?utf-8?B?aFdXK0NFbmdmVm9Wd3ZuVFdSemI2Mld1elNVVE45UGtaSHB3ZVpiL3IxUVdt?=
 =?utf-8?B?SWRvdmJ3Umg5a1d4aEhOK0Z3cEdmSmE1dGR0eGMxV05qVTNIU1FOUlBpd3hH?=
 =?utf-8?B?S2RjWmhSNlpQeGJnMUhYLzRObnVoNVZYYUlRS3lvMEZtVDFNMVRESDgzTFRl?=
 =?utf-8?B?TFhXR2dIa0dUZHBFY1VBRVVVVTFJN3JXMS9DVWdDSFNUK3hhVGJtakNDRmla?=
 =?utf-8?B?dU1PV0NHTHZKZzlMMHFLMmw5bGt0eGhtenR5UlV2MGNFTzVSNS84WTdMRmdz?=
 =?utf-8?B?c3ZUWjJxRVBuUmxDLzZVS3NxTzVIblNNenROdlV2T2l2MkxsVU9qcktxZlFh?=
 =?utf-8?B?eEFtT29RcXIrYjc4Qm50ZVpzOStRb2RRYTRPTEtlMVpiTU4yanc1NzZqLzRz?=
 =?utf-8?B?Tlk4dHBrVWkwMHVRTE1WWE05aU41dnpSRWFLZjRaVUhrZW5UU3BuU3J3Vzli?=
 =?utf-8?B?R0pKZmhURmxaSnpmY3hLMCtTclFzMDhCU3gvaGZyZ1ltdXFoZFR6YlovN3Q0?=
 =?utf-8?B?SkxUTlprdkFYSzFYbEU3TWEzNXQzZUFwODNzNUhjUXFiV01lZ09ESDVFbFU0?=
 =?utf-8?B?NDUyeWhzZHd6RUFYL2o4WU9ET25uMzV6OWlTWEJyTkVHK3NXbDdoOEdMSUt6?=
 =?utf-8?B?bG51MUlxY3FPWVVaMThvT3MzZTdMeFliY1h6UTZPcnMxSkV3YUR4TDRRbEJD?=
 =?utf-8?B?c1BJMTdSSWVUcXdBOHR2d216cS8wRnZpR3phNE1PZEtLV3lXQWhVQkpPZmhs?=
 =?utf-8?B?Sm1KdnNkS0FTbEV4NmNuWnBoenFhdnBvdWFYNGkzbldJWUFJV1QrakdvWmYw?=
 =?utf-8?B?dFM0Ty9neWNTd3owR2VTVUpnd1lrUjZ0QWVyVndzUWlRczk4MlBxeTArbjQx?=
 =?utf-8?B?OXZHOGI1S2NlUXRzVDNUd3NmM2dNM2MyQ2ZhTVAxVGdhVFdzdFpwSERyNEtQ?=
 =?utf-8?B?MzhtU2NTT1JtTm85Vyt4MVEyV1JsbmZZT1FlcjFnbktVSjJHUng4TUhIcncx?=
 =?utf-8?B?YmEybU1qbkg0R0hzUFc1dG14VlUzMmY5MnRpVk1rTmZQd3h5ajV2UXYxR1lT?=
 =?utf-8?B?cTR2aGx6UGlpMTR3Y2M2WVhLYmtTQXk4aEgxcEpqR1NhRVlOR00zM2xRWnRq?=
 =?utf-8?B?QWIrR0pjRUFwekJXd3NNbFZOZjR1OEQvbEdxZytPUnljbEZNVFRmQU9pckc4?=
 =?utf-8?B?K2pLQ2FPbHZNc2FyemNxRUI4d1hFK04rWHBoSTRFWlVkcldMdkZOdDcvKzhU?=
 =?utf-8?B?cWNucWdlZG5xWmczV1haSUlYeXR5L3ZaTk5HSy84ZWVLeTFiSmV6cmZlSDRL?=
 =?utf-8?B?RnZQdE16aEtNYjRuelovNFFPc3YwcEhsS0Vva1Z1cGZWU29jR09abVc3OHV4?=
 =?utf-8?B?WFNQTW81TjYwVzRjRWQxam5zcWcvQWh3eDlEMnZockM1YmltMHhjV0FuVi9R?=
 =?utf-8?B?VnJQL3NIV0QwdFJ1bk95TXh5OHA1K0hOU0xEMkRWOUVmaVF5UTN0dk5jWksr?=
 =?utf-8?B?OXNhMVlnQnJIV3dtUjRONHNMSktBTWNyV3k0VmhUY0lXYks4TlVZRDlxS0hh?=
 =?utf-8?B?Q2Vid09rRW13K3p0M3NOdm0razB4T2M4T1RqR01iYVpZYTNHaGJSQm9WSkpt?=
 =?utf-8?B?QjZVaFV6MkZzbWNrMTRCTUZVSTlMSDYyVUcxTHJBM2FrM0ZGMUV1bFEzU0Zr?=
 =?utf-8?B?c25Sb0x3MlpOWFkyanpwRW1hc2FkY2tMemFyK2VpU3J6dGNuOU5rM2hZdlMr?=
 =?utf-8?B?eU9LRzVyVXFpYzZsZDBKdVQ2RWRmZU5FLzdaQi9mSjllOWQzRlVhazB3ZkR2?=
 =?utf-8?B?cmhDK1IwL2trc3VoeW9jUWxoMWN4NmdaM1dLeUVvUnJlQVVTcGlnY3pCaUFC?=
 =?utf-8?Q?UaT7F9g/jE92Wzq1Y3kiaDevMKduHI89Um2XczfBg2Yn3?=
X-MS-Exchange-AntiSpam-MessageData-1: 6uY++iZfjZKp3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2350ca-f383-4c0a-ad65-08df36597f21
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:43:32.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FX7Fj4vaqTptgaymA64SjXSLJqGgIHMs1bo+N+qpFbsas0z8H/1O1G+6YPPSydqQPos+JhMWd6J5iltFRFxLWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

From: John Hubbard <jhubbard@nvidia.com>

Msgq is the pair of ring buffers in shared memory through which the
driver and GSP-RM communicate. The command queue carries commands from
the driver to GSP-RM, and the message queue carries messages from GSP-RM
to the driver. Each ring buffer has a write pointer and a read pointer.

Msgq v0, which the r570 firmware uses, keeps both pointers of each ring
buffer in that ring buffer's header, in shared memory. Msgq v2, which
the r000 firmware uses, keeps the four pointers, two per ring buffer, in
four BAR0 registers instead:

    NV_PGSP_QUEUE_HEAD    command queue write pointer
    NV_PGSP_QUEUE_TAIL    command queue read pointer
    NV_PGSP_MSGQ_HEAD     message queue write pointer
    NV_PGSP_MSGQ_TAIL     message queue read pointer

The GSP numbers its queues 0 through 7, and each numbered queue is one
such pair of ring buffers with its own four pointer registers, so the
hardware has 32 pointer registers in all. Nova-core uses queue 0 only.

A write to NV_PGSP_QUEUE_HEAD also interrupts the GSP. Msgq v0 uses that
write as the doorbell, so nova-core already declares NV_PGSP_QUEUE_HEAD.

Declare the other three, NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD and
NV_PGSP_MSGQ_TAIL.

All four registers are declared as the arrays of eight that the hardware
defines, with the stride of 8 bytes at which the HEAD and TAIL registers
of a queue interleave, as the NV_PFSP_* queue registers already are. The
existing doorbell write names queue 0 explicitly.

No functional change intended.

[ acourbot: declare the registers as arrays of 8 with a stride of 8. ]
[ acourbot: use "val" for the field name of NV_PGSP_MSGQ as per OpenRM. ]

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  6 +++++-
 drivers/gpu/nova-core/gsp/regs.rs | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e6d9a97130ea..d51797a0a782 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -15,6 +15,7 @@
     io::{
         io_project,
         poll::read_poll_timeout,
+        register::Array,
         Io, //
     },
     new_mutex,
@@ -496,7 +497,10 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
 
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: Bar0<'_>) {
-        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
+        bar.write(
+            Array::at(0),
+            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
+        );
     }
 
     /// Logs and consumes every message the GSP has already posted, and returns without waiting for
diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index 3c410d65e8e4..e3fbbf364b7b 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -9,12 +9,32 @@
 
 // PGSP
 
+// The GSP has eight numbered queues, each with its own four msgq pointer registers interleaved
+// at a stride of 8 bytes. nova-core uses queue 0 only.
+
 register! {
     base: NovaRegisters;
 
-    pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
+    /// Write pointer of the CPU-to-GSP command queue, which the driver advances. A write to this
+    /// register also interrupts the GSP, which makes it the doorbell.
+    pub(super) NV_PGSP_QUEUE_HEAD(u32)[8, stride = 8] @ 0x00110c00 {
         31:0    address;
     }
+
+    /// Read pointer of the CPU-to-GSP command queue, which the GSP advances.
+    pub(super) NV_PGSP_QUEUE_TAIL(u32)[8, stride = 8] @ 0x00110c04 {
+        31:0    address;
+    }
+
+    /// Write pointer of the GSP-to-CPU message queue, which the GSP advances.
+    pub(super) NV_PGSP_MSGQ_HEAD(u32)[8, stride = 8] @ 0x00110c80 {
+        31:0    val;
+    }
+
+    /// Read pointer of the GSP-to-CPU message queue, which the driver advances.
+    pub(super) NV_PGSP_MSGQ_TAIL(u32)[8, stride = 8] @ 0x00110c84 {
+        31:0    val;
+    }
 }
 
 // PBUS

-- 
2.56.0

