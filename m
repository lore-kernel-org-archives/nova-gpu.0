Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793086558;
	b=Sf9JxaBn6YiUYozkiOjt9/GqScexMmXlA/QI520s2GVNipXPc9fLN/sBiwnsw3ouBKkv
	 SmjvfbKfReQ40wY49VRjXv2p/4ZzwOg0fPPoD7NG16Ps/zYM4wR/CloJ4uNk1eqqcRoc/
	 5oMlcWzJEe14FXyFhcg82zzxzj7fWk1jdi3LArv2M7Ci2YmCszEaeigIWvQeLBQt2Fh9V
	 wZJ8SuVY67R2JhHrod/0n7T7IS3UotjfPloFWXohJVOZ8BsuDHkm+CrppLtT3DVbFnlI6
	 YUed7f8PuDoMVB3PDptTkzqfQDGaE9fuUEAIJqkUuTlO42dCWNZv942fE4+1UNo2uMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086558;
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
	bh=tRjUg4XWS3Jn0WUM36LxiUi/2nHlDGjT7YewrHdqClM=;
	b=YGufwXGuGDTyDIzw/xpSCLFmEAVfXIP6lSU89N+kRl5HcMmdNulwObJ9CsnLz5/vOZx1
	 BuMWb5QsHJdLz1ld/dqALXiLb/JBABEc/lWDwuCWlGE1NFM/hU/OanRMU78i6Jz/MFcOQ
	 VFvLtoQWD2fB3J9gwAisY0eoloZNXBcl3zd9M3TtB0HmyF2nArL9z5Skc7XPQakw5jvo6
	 Gvagq7n4CRnpyeE2/a0k8hBOdLa1rDf2XTDuAFibdGWpPPFnwbM32xNpWfXEVbPmd2atx
	 r6uYh4YzP+MvHcMvXGHvmbQtRlz5Bb5TeIv3G9IQmMxrYciXFQ7NopTlXenDNbXWIyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hrnVnMqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAC60A260C
	for <nova-gpu@lists.linux.dev>; Tue, 27 Oct 2026 07:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00BAC60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hrnVnMqN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwwZVXap8nrOUcOq5Cc5o+W08gTweRcl8LlXy01brO/wdtRy8WWdNpUL0q6wDMlHYLailmTtUlTRgcZLd+3xrfBSMbEzacNP3YqCtmgTqeyH2M30on5rt6yndJPngPE4RDLfzywQ7tpAdBZMadi9j+Kr88LYpHIazongcIniq+PCTkKLoxVxmTFI46vpmweKDw0dIkvz6Kdrfqjfj2NrxDJ/8vfOYRTqQZKaWx79mpz9rTLnTMkx3Ucr7ym/AbiUvplOp/0YLKNJ6mjnp8x4EP29A4lkZhi0e6vQPcmkQ1jmtHtOU16PBsyBVP0ies4rcW4BkbR6pLcDODTRib9iQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRjUg4XWS3Jn0WUM36LxiUi/2nHlDGjT7YewrHdqClM=;
 b=k1ubUVioecy0FfauYzomZvoxQgfieHv0CK1FW52RN+4gaiPwW/OO/MEQ/RmO2FZzrwyTV5JZnLfRkpkzxl6nVcQW8Mi+hFRfS83Nse2GqhlBL5FVY8iGUnEB7/FFGIpI8U6rtgqRw+FB3XSRnMcMwXT0LpBL/frHvFC8rF21c2l6iV51UCuWFYW+8ShhDTxKvq17omyWziWqzgIMW8P75mYARuYx6Im2yDIO/St/68VjlNy0GQKsmlc/Ae5IltG9CKxW+4UJyEa0t+s9p3rY8iLV4yRSfXMduFK8TAgXTQGN04gXT1elkDy8glSEx6D3EYAhXnbpzoD5jI6RNbZ92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRjUg4XWS3Jn0WUM36LxiUi/2nHlDGjT7YewrHdqClM=;
 b=hrnVnMqNmg1+caYJMPaZbVoNXuKDbo1rSX68CMONuO161XkF/fseVWjn2vP0Y3FoctKWIFraJlds4ljm4nQxbEImqgxitE4RldwerLeOSULTMmEcLVDuAQMtC6M+tChxvEaB67qzmmcYuCfxSZSHyChpoB8uMYI0Kau/9bTLNfcWJXNcmsVhBznqoP6fEvain9hhKkPnvaH4HCQTlOkvYXoH3DD1q0myQNrwLibU5MKIIqBPSexeJ2UoFG+HavibzFh8IWDJV2WWDwUWbRBibiJ9hOIqyCBAn4OxpIDXNdyBbBbwr5gx4vcVBaSfJspvfi0mKBPit03VkrYQmw4MRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:35:55 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:35:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 27 Oct 2026 16:35:45 +0900
Subject: [PATCH v6 02/15] gpu: nova-core: gsp: cmdq: simplify framing error
 description
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-cmdq-rpc-v6-2-bed9669724ba@nvidia.com>
References: <20261027-cmdq-rpc-v6-0-bed9669724ba@nvidia.com>
In-Reply-To: <20261027-cmdq-rpc-v6-0-bed9669724ba@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c76699-9779-4d60-24e4-08df33fcef38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10070799003|261026121527099003|261021123027099003|56012099006|11063799006|261022105027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	AHhbVdnJtvkDtELqDcYZr85j1ySNWizpXFeszHPXQBgV4zVda3+SEQAegnHTZ1ymn0iKEKG91EWm+gyOqJV18qjHhmo4tjyx4BKlHc15fEVCVjSWIEk+V4eXXK7lD5xRluJuJeI6l9Wf0aY8Fod/upemXpDeK+MTie8C8p674WbBgZ2Qmp5gIaqHPFxdmuTCthjfXwuI4wkgbeFXzXPM3ZAB0cGtQTauSofCkPFJrYHEG+Ke9AVY1q8sBdoJT8ddDEbp+BpcHkdYO7O2w43wDcsU7rFitgjAHOzNUOc/9NkbOWZ+qla+lDOeYo5Fmzi7w8mwBAatoczFzsYntJglxAXAyfpsCJlO7NxwaN+fMjDpCuJmPW2jeHi9PNqpXsqCeOJxhvTDSyGEtj8NrI2ECZ4iwMl10ZcZ6RG4wgpSMuQrD3YH9QhmPGCcqE0mBROT9OJaWycCv5O8kSA7chduePbJ5alzWFXeCjq2/JzegFa6n4pRGY4+gNhtnzAZiOlzAn0tbhulR5As22+yej6I6XznUr+xemt/4sFPWy4Whh/LqrWtKlscuK5w6A4KzyD7ttCulEyTkhuFjKoh+RRIzDCFpnLs7SzIkg3AUyLYBut9qdtJbV6RQSvG+OeIbDfh8erQsV5qrtfBTasYJ4UL25Xncp02SiNDRchidETwQGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10070799003)(261026121527099003)(261021123027099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3krTnZ0L1JmVEk0dnRWdUtGOUtwdVllQXVpWXJkMjg2Q2VuQXM2eFBwYXFN?=
 =?utf-8?B?eXV4TFM0QlQrSG42dVFFTk14YWx3ZGNpb2JQczlVaktJajYvS0pDcFV6OW9h?=
 =?utf-8?B?WnMzZ2s5dXJxbExjVW0xbEM1TG81R1NlZ1J0QzVLVkVaZnZKclE3bFpMdU8x?=
 =?utf-8?B?OVBNZTAwTVVnM3VKYjlieU1mK2ttc0g1SmlGV0paTmE4eUh0RUlCaXo0ZkEr?=
 =?utf-8?B?N0FyTzNSODdlQ3FJa1ZEWjRsUVRuMjEwTzNtVDN6cmFwYlltRHN6NDVxMnhl?=
 =?utf-8?B?RWUzU0E1d3Juamh3aVdkV3VPcTMzaEdzU2tCMDF1K09WSFVSMTVsVGs5TTc0?=
 =?utf-8?B?cXF1ekdmVzB1VDdjSTFCUnlhSy9HQVlyVnhMZ09CRkhCeERyT0VTSGFvakFU?=
 =?utf-8?B?KzB5bjRucmpwZEROT0JEVFEvTTVXbTlJOFNUVHJkN243cmVVdTJRZTArMEcy?=
 =?utf-8?B?SmdlYWFXSlVlOXkvcnlNV2NVUjNCT2lXQk5tMm9nK2pYZmo5T1lidkE5R0ha?=
 =?utf-8?B?WjlrV3FZRVRWcUxsb0lZUyt0aEpVMzlnbGFCdXF2TUxoMTFkSkVIYkV2Z0hN?=
 =?utf-8?B?LzM3Yk84MlVEQ3dnQlRYQUc2SzU1d1RyRkdzZXFReTB1c0FEdURoRWZoc2g0?=
 =?utf-8?B?cnQ4TVhnUDhxNTNYTzlZUU1jbWQ4aXZTRzJGK25wbkpYRjNxUWtqdFRHUURy?=
 =?utf-8?B?M24yNUVBcks0QjB6RUpCaHB2aWRlcmpMVHZ0eFdiVkUyZEdWRldUcWtFRGZC?=
 =?utf-8?B?NEZjZEFES3pES0N6LzNIQVVrV1Aya3dvaDJFc1ErQjNDaS9IY29pVVB2VG1O?=
 =?utf-8?B?UDZUQTAzdnZQREU3a1Z2RVBtaU5lUmpXVzZjZjJWV0ZJN3pKbWhtc0lYQzRH?=
 =?utf-8?B?enRGSVh5d0c2QzFLYzFHMmZaaUJQMHZKM3crT3N6TVJOVzVjSlFsZ0Y1Y1hh?=
 =?utf-8?B?WDd2c28wcjBBRXV4Q0t1aTlyTXpacmsrQU96YkRWVVB6VEFBMUg3T0FLZkZO?=
 =?utf-8?B?RzIyZ2ZHbGJwTzFITzhSMFd2VW5GRzc5MDJOWVh6UDVJc3o4a2tJbDNLMk1C?=
 =?utf-8?B?ZDRvN0FSZmdhUTZUWjVNZU5vYkdaa2NDaDRNVmEzSUtGUXdFU3hRS0RzbW5h?=
 =?utf-8?B?UDRpZkVkOC9iM0tSWVNFVUpQQzFCV3ZTOVdkOHV4Wlo5VXE0emY0ZVhNSWVo?=
 =?utf-8?B?TEtqQVJEd3pIZGYzZ0hvVVpVRUgyT3BqZDNqcnIvM3h5MW41dFJEd3FjdUsx?=
 =?utf-8?B?ZWQvMzRaY0VmWXBBUDRpVHVpTi84UkgwSXZqRCs0T3NrclhzVWhhemtTUFB1?=
 =?utf-8?B?bDc0TWowcnFRSEVwZXpnZEszbUpRUU02aDhOcGQ4V0h2djQrU3F4MjlZMzl3?=
 =?utf-8?B?cElqOXN4Mml3OGRhYTZSMHpnQzd3TDdnelNvQ3d0cFBEb1Y4TEE1VGxmS2pN?=
 =?utf-8?B?NWY4Y01QME16ektSK2hpRjZWWXZnSmZYZVp0azZlSFIzdnVSK0VHRXduWkR1?=
 =?utf-8?B?bXVEOEJFUm5LNExFS0llaXp6b1d6ZnlXeG9PL3hCRzhiNVNpWjc5RUk4UG03?=
 =?utf-8?B?L0tpRzVjeW91Wi9PK3krTXl3WUw2ankrOFk4c0orWW1Hamp0ZEFacGVMWlJx?=
 =?utf-8?B?emhDYk52K0twU00zNXlSMGY5ekZoamZ5RXpKVGQ0elBucGUvWVUwOXBxd21W?=
 =?utf-8?B?Qm0wOG95VmpBVlZEb2diUEtLRTlYb3RUdFp4Z3ducE9teUhlYXdtTWovdWpT?=
 =?utf-8?B?a0JON3dYbTVHSWl5MmtyTHl6TXZvejBlVTB5cWFWRlArdG5rN0N1ak9wU2tr?=
 =?utf-8?B?dnVtQ2Y3UHZZNHRGcHQyaGRwOFZwTE1BRXkrQWNaT0hOdDNPVUxuZkVqdkl1?=
 =?utf-8?B?dGNjU2pBQXJZd3RXMGk0Z0pBTmMzSVNRRHVhOXMxK21YL1Z3NU1LQTg4clZT?=
 =?utf-8?B?bDlWTnI2c21qdkJrUkJ6YTFDUzBkVTl1NlpWdkl2eWc1TkpWMHFKQm4wRVBD?=
 =?utf-8?B?NXdjTTZJbW9KWGN1SnZhaUJRN1Q0SXpwUS9hVlQ0OXcwaStiR1VEdXZIeko5?=
 =?utf-8?B?WjAwcWVZc2VndGRYYUtDZW90eXJaZXk0aHlXLzhCT000Y2NjcEN4QkgrQitW?=
 =?utf-8?B?UVVqNGlpaU04aG1ha0dDNW04OGxoUHFkRUtyd1VKTTdSZHZJYW5pRm9yT2ZB?=
 =?utf-8?B?dUFhbEttSnVmaDA1L3JQYWM3d2w2YXpEdWNUYWQ3QTRnSnhyUmhEcU12a09x?=
 =?utf-8?B?SnZsb1BkbEF6b0g1Y1lWWjZzWHo4WjhBNlQrN3o4LzVPcTFwU1NVQmJUTjRm?=
 =?utf-8?B?U1o0TmVtcVNiRHNha2EvaFhXb1g0eGhuWG1Oa1pMRFlJaXI5azdpUWFwazgz?=
 =?utf-8?Q?T9HvmM2gIjortnaEafA7EXwjk+AZf2NQHpgEcbBpWFCYz?=
X-MS-Exchange-AntiSpam-MessageData-1: K1zdDuWW6f2gTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c76699-9779-4d60-24e4-08df33fcef38
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:35:54.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQGigQT164YCg17ylLoIHSYtEiKqixLfM/0IywCntBnmBFki0EIHx7tRBYyiaZ71L8BeB2AVWago0ZpIpoaqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451

Use simpler and more precise language to explain the conditions in which
`EIO` is returned.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index accfc1d20d28..1bd15fc0aef2 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -775,8 +775,7 @@ fn send_command<M>(&mut self, command: M) -> Result
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
+    /// - `EIO` if a message fails framing or checksum validation.
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
@@ -849,8 +848,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
+    /// - `EIO` if a message fails framing or checksum validation.
     /// - `ENOMSG` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
@@ -902,7 +900,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     ///
     /// - `ETIMEDOUT` if no message of type `M` arrives before the deadline, however many other
     ///   messages arrive while waiting.
-    /// - `EIO` if a message fails framing or checksum validation (see [`Self::wait_for_msg`]).
+    /// - `EIO` if a message fails framing or checksum validation.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M>

-- 
2.56.0

