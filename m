Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621415;
	b=ebpZicDtzkMR0W4A+1kHW4JpFNOcmMoFwNStsOJ+JY0ddi+5EvDMCc8SR0tTM468zHQE
	 346J3cF8x1sZLkkX2koeB2kSZFcWqENnHYQ4qeTEx8zlm/yM6LAFn3WfZD1AoS1xgrM47
	 q4IDa/ks/9jmuLzJ7WRlO6EcW0Qzb/D6r8oNWcTxUaRQIAYpTSXuK6X+QCThhEEnvtrr0
	 nQ5tlVESe9VpTNHe+aMrI3IoC95sGJjNRAWPxCSjWLYEm5AvmhodamNt8hKERcDZ7udtG
	 1SPs1M09Fxytod/hRfqQbBJSy/GwH1twDkNJOVpRqgXJFOIewxsDBEboZf88WHhV9Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621415;
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
	bh=YlDL+zociQT2RXKesvYziOtt+Wv7kiZKycH5Wc3WLZo=;
	b=sytHEy5DDmLTPEjlbHIP22l3z+CDKDj69kviORicgoeboPy3QXotmPHZEF+H9wYnrSUe
	 krV+WVkJ9JeDzQA2AwifBZSqmKrNFIZHwOYOfsQyVa2XqcKW/Q1v/VGlqp2WM1DlmZw/W
	 MZi13uyEtJGObm4Moi5HW/Uy3BWzzEO+XEbz4tJyNxqEmzxeY1z2IANc2vttsLoJduXU4
	 rHS7Ku+GN/GLQ6xNZEXvdEbqpDulQAUwoX8xB5KYMODJvcyhLQpH1yfMOmx7/L2TFNJ/K
	 XHQVZ/bVrl8a5RJ0olPnahPHAxiNGS5Hwxh5ValE41dXkCAXoVbTLkpt3tfdNtAARUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SHRt8zxD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.32
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAC606A324
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEAC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SHRt8zxD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYTpwIaUboImYu4oa1x2Cpu6oM2Z8wR2vez5px07+br5rfgbnHTgPG2GjZhZj61x6Em8F6Vu497aWwRTLoFcZmLSkofFOZqpStiIH30+/1Lnuv2o6TxkoQygGY2bKw0guG30GjlYJbIFux2bmUZoRIovB9MZ5aeU5g99R+Z0DMaiJpG6m2ui9srP9zcF6PKYK4TSndZFJQ7XgZUNfMzDEHCT5xKmFFD8bUG+yy5DFZZSKBhSt1SZMrrE6wSI735YwvREfRK1JKingSBX0PtEv3Ef1SwmvjuSDlBzdrxfnQ24w9Sed3n4NAPsaVQ49nECD9BIkViAO42OzQIrNw9INQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlDL+zociQT2RXKesvYziOtt+Wv7kiZKycH5Wc3WLZo=;
 b=xeW68m2ySkEobM2EHnH73Ko9a11YuZjH3ifQFhQrI//1F5UVi0PdjDXA/buJYAHoe2MZBDPAu1WrYtu70ATd2tdW7eMP7czYFX29tAfxtfA6+Lxopu6jkFI42WvLT3GdeArKelFV2YFpqxQdVCIzgJv0v7fqgMLjle2R7Li9Nw+VENBJv1OsgGHGgG1IuNDcNuMeRHyGrqIRAOHQNFtBr+hb4V9PNPnMUApOMFqf6QjN4WEHB95p3EL5iAxHL69+zENryIFOcO3ckYP4PwVXCxpY27iub4CzFiZTp53qBFP3oLVNba/XhP2ubAmY30Ye5bcZQLXI616oCFJ2QjH7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlDL+zociQT2RXKesvYziOtt+Wv7kiZKycH5Wc3WLZo=;
 b=SHRt8zxDN+ilkA+oThK+eXU4yaHdKkir41ettW/Q58rDvDmctWScW5U/JNFkOA9p2twzLfGUu6GaeFAHKzvddM5cKaKz+9vzLxaq43FXoW7Y6dpFo8rAWrht1IMpClFUwOa9l8406nAS6DWIVxxNBxH6xvRATFlEovN8Pjzl0LiyDXKhMs7vXZUjwj+Q63Xqvx4OtiIWwn5ZzUOk67vrKKQRHfupTzyOzx4+8249TS99wXdLq4Plsi8zM94E7b4uH0q+fSxXzt/z5UwcHHlCBwWiKlue5LxMRYp/n59A7SPZLjY8QBhxguv+uD0D8L8UUzFSvR3Ym3SHMCDXRuK4Bw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:12 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:09:54 +0900
Subject: [PATCH v2 3/5] gpu: nova-core: gsp: cmdq: ring the GSP doorbell
 from the queue memory
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-r000-cmdq-prep-v2-3-c2c2b69bdec0@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:405:370::6) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 27a5f65a-4d3c-4b48-57e9-08df38da3ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|10067099003|18002099003|22082099003|3023799007|56012099006|261021123027099003|11063799006|261021121427099003|261021135927099003|261022105027099003|261026121527099003|261026140227099003|261022115727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	RdM8uO17NJc2XpJz3b/pzIqhAs9Qe5gpYk0FiaDA3ZOva7Mp6b7Rkf1y4svIyQy4TPCj5q8nBdDeJi9bqZVDmR3c81q000CZqp/JWhVHLef3Hx5d+7xr3JGCe30YRgwxlvD9L+mfjD7myFo42VFKWPjT8MrbHMRiAQleEQO153z/ZOtnJwtMsdjsN+2bgQlVIfFS1ctD1EXC8El2t4ImaJKi4ZnNQDrAxf2UQv19M6BTaTrP3J/xKJhoLFGeB8jVijg7Kcq4C4DxEvHY8BksKSujkIZDL0AQFxXKzgoa0609RXN5UH+vJrzCNVynaBIgYrzl7yYong5xtZx82ankb2eVyq1FNk6YBc5/jHLiF1HcHiU49u7btZdy+jgoUw7M12ZBYbbUBQrJYCyh2zXHqA4YfhiKOSNnBQS4Whl8L23zPr7X0aKuxq3O5m04K09HPFvU5xfP4nK42QraHxlrBafZD4m5zK8lk5UHgcV9rGrweXp+6mAzvF9byf0S8KoLzpAeXMdv23j9sPkxIvqS+6HdbgYnIuL0uvo/udvUGd1cGyMIpWS2mtHjADlSEdXbj2J8RPPZKDVO1b2TOSe6upGXTm1G4AEQYikvL3T1I7t1L3jWTBSzeyQyR31GczA24ZaJPu5uSZAImZ/zIrYCR919RKIR2WAJDji3eQc6pKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261021135927099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022115727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVWZEVXbjRvZkZyUnBmaEpGbWRMTU56YnNkWTNJRFhKV3U1aFZ2ek9NNEZp?=
 =?utf-8?B?TVZEa2x4Mitzb2RoMnE4MDZINHZ0dmwyanFMSlZVdDBtN2pOaGpKcXRqWjVT?=
 =?utf-8?B?YjU4cXlZcE1uNC9BR2RMbi9kYmtRRFBJcWNFMFkzTU0yb3RDZ0IzSUNuOWtk?=
 =?utf-8?B?Rithdkd1dnBRRVBtTFN4LzlwUDcwY3JPQW4vZ2ozMmhrbXkwZ2lEOUZoME0w?=
 =?utf-8?B?a01ONnJ5QkFGK1dPRUdlVjluNUhmTVh1RTRZbVg1SXhjSHc1U1JZTE9ySnJa?=
 =?utf-8?B?STBtTnIvb3U1RzBWMTVCSGZrclFjRjhGakxQOWxXTHhiOFJ2OFRrVUtwK0pI?=
 =?utf-8?B?NG96VklWVGhUWkJkeXZRRmNKOTBJVlhqWE9FQ0tBTTJvN1FPV1pNQkFZc0J6?=
 =?utf-8?B?WkMySmg1R25Gd1ZwZkYvMklvMFY4ZDZQSHFFcUNvbnk4TGFFRTJ6bzdvL3hj?=
 =?utf-8?B?T0YvbWVnYXdVSTRLQzc3TUtOQ29vL1FzZUU1ZzMwZjRUMGhCOHZUa0RPUSs2?=
 =?utf-8?B?M3hxL3dtTjg0QUlzQ0FhQVFHVXdQZEZGWW1xaHpuUzBaNVBCMDJlZElqRVp1?=
 =?utf-8?B?REZMTWNwNjY0S2ZYYkhZOWJVMTloU3ViNEZUUlhvbFpKVlIxdEZzazV1bGR4?=
 =?utf-8?B?a2hHREZNYXVWcmRPNzRDZldQMmcwN3VORlNDN0JjeXJPclJnWmwvbnFQOWRG?=
 =?utf-8?B?aWhMekI4UWkwUm9JRkdBUFNSSFRIaXZhNHVXSDJNV1JKL0xyTGhGcFRaWkds?=
 =?utf-8?B?UWRZWUcxZzlJRERJMkhMMFFLZEZXUDVtZkN2bm54OE9PaVFVRTA3S3hIbFRm?=
 =?utf-8?B?VytkOVZnK0MwVFovVnRBUi9ZSmtRbHdoZXRsdmJIZ1NZS01TbVUvRXRudzFZ?=
 =?utf-8?B?Q09lUUVjcjV0T3hoWDhhdlRVMGVyZUpOTG1ONC8yLzF0T1lyRUdoZy96UzRn?=
 =?utf-8?B?TjBHU3N3QUw3eEdZQWdkU3VyTmxDQ1N0ekdRWm9adm5uVVUzbzNCZmNudkFu?=
 =?utf-8?B?NFhIUzdGTmhiK293SG1VQ1F6WTFTem5XK0NEdVhJWXl3TERDZEpXSlMzNUl3?=
 =?utf-8?B?SmlRREszUVBiRUdGUll3ZWZQL1JQc1VSbmcweUJuZWc5UjVMRmcyeWJkV24y?=
 =?utf-8?B?aDFNdTJUYjhKL21ySFc3aTREc0thQ0Fsak9tbUxyQ3JadHVDdmg5aXY0YUlz?=
 =?utf-8?B?V0pMdGF6Q0dMekZZUTBEWkU5NTI4dWFISXVBZ3pVMDFWMVpvUVNnc2N5UHNx?=
 =?utf-8?B?dHIrUlRxcEJtM0p4Z0FZbUJ1blFkaFgxdnJrT1ZrT1ZxRFpBWGYxV0JTcGxG?=
 =?utf-8?B?RHc1RGRINzV3dDhHOTVObnhqT0hBL05lM3dUdFVwWThJZS9EZWpBNGxGS2Fo?=
 =?utf-8?B?RzBLY3k2MWkwZUcrbEFDdnZtV1FXa1R2cGc3OEt5S0xEaW1BNGxScmExZTU0?=
 =?utf-8?B?WEVwaE5BZDlPbndKeTFjaGFuSFFDVUJWSmtTWFk3dEtOZFFreGlFMkE0cllN?=
 =?utf-8?B?bENBN1RWZjd6NVBwNWd2dlIyUjNJb0FnVzU1cG1GVnMyM0ZhRFRpdkRPUFE2?=
 =?utf-8?B?Vmdya1BPM0dYbU5KZ1d6Yy9pRWIzUEg4cCtvOEh1cGhTcy9YNEI0aEUyTzIw?=
 =?utf-8?B?VXY4MnJnUFU4VFB5My9iYjVvSzFNVUFNbnlQVkRpQ3pydi95SFR0R0l2dzZ1?=
 =?utf-8?B?aGFITVF5b2F5WHgxem1vMEM5SzhRZGhhaEROM2k5ckJ4TmEvUE8vT1Rzb2lj?=
 =?utf-8?B?ZDQyZ1pOVFY5azdRbXIwYURSaUlNeHRlL1ZhOG5PMlpSSmlYaGloQkp5YWFv?=
 =?utf-8?B?U3liTm5xOXpzVGVKbHUvWkZISkJKdGtYNDh0QzI3Uk94WFg0Mndvalh3aG9j?=
 =?utf-8?B?bVpaVmxEUDRKalRUNkpkZ2dxVVZuTHF5NUNqNmx2bUtuMjF1NEVHVlkzWGdS?=
 =?utf-8?B?RktkSlk0UjBtR2pHR2U2cUswZVVvcngrVnFKK1F0cVRCdzZ6UmVCcG1mdlI4?=
 =?utf-8?B?R1ViZzBncXAyZC96citJdTRwbjA1WUczQThDZUVNa2tyNE5RbVNPODA2K1kz?=
 =?utf-8?B?OWg3bGxudlRyM1d1bGNCOVEvRnN4REtFUkdJMmZXc2lnTUNkM2p1NE0yc0ZS?=
 =?utf-8?B?eFNrNHdpVjhEQXhmREh2Q1kvK2d4TVF4SzVPRHlrSVhjQU1KQkV2cU9jR1BI?=
 =?utf-8?B?UnN2bzB6WEpud1Q4YjFQUzNVNExHdUQ1TE00ZmdacjZuVENXU05kcWVzUkVG?=
 =?utf-8?B?VFlLNWRzK3B0SXFrY1N2QThXc2dQMjJUcDNqNXFESEIyU0EwZGJ1c1d1L29O?=
 =?utf-8?B?V3ZxME94aVRmT2pUc1FzYWkvMFdzZmhNYWMxdkFmYVgxS2UxbWhNTDNaRHFa?=
 =?utf-8?Q?u8a9m951QWNk3Hsq/N+qOwS5mP3KeGz8GErGDQkn0/GOk?=
X-MS-Exchange-AntiSpam-MessageData-1: kJ7AvanZRbyoDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a5f65a-4d3c-4b48-57e9-08df38da3ee9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:12.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rM50VTYLRqQUX0q83r2zft4piz7zu/hC3E7hSHEMiZ6T1xsTUExwepWx8eNnWwT1RaH8tzg5Myy9jclM4xBWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

From: John Hubbard <jhubbard@nvidia.com>

A command reaches GSP-RM in two steps. The driver advances the command
queue's write pointer, which publishes the command, and then writes
NV_PGSP_QUEUE_HEAD, which interrupts the GSP so that it reads the queue.
In msgq v0, the write pointer is in the queue's shared-memory header, so
the two steps are two writes. In msgq v2, the write pointer is
NV_PGSP_QUEUE_HEAD itself, so one register write does both.

Nova-core split the two steps across two types. The queue memory type
advanced the write pointer in shared memory, and the command queue type
then rang the doorbell through a BAR0 mapping that it held for that one
purpose.

Move the BAR0 mapping into the queue memory type, and ring the doorbell
at the end of the operation that advances the write pointer in order to
prepare for the switch to msgq v2.

No functional change intended.

[ acourbot: slightly reword and trim commit message. ]

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 52 +++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 07b21a6f4504..90e26c4dcc28 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -157,11 +157,16 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
-struct DmaGspMem<'a>(Coherent<'a, GspMem>);
+struct DmaGspMem<'a> {
+    /// The queues, mapped for the GSP.
+    mem: Coherent<'a, GspMem>,
+    /// MMIO mapping of PCI BAR0, for the doorbell register.
+    bar: Bar0<'a>,
+}
 
 impl<'a> DmaGspMem<'a> {
     /// Allocate a new instance and map it for `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+    fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         const MSGQ_SIZE: u32 = cv!(size_of::<Msgq>());
         const RX_HDR_OFF: u32 = cv!(mem::offset_of!(Msgq, rx));
 
@@ -172,7 +177,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let gsp_mem: Coherent<'_, _> = gsp_mem.into();
         PteArray::init(io_project!(gsp_mem, .ptes), gsp_mem.dma_address())?;
 
-        Ok(Self(gsp_mem))
+        Ok(Self { mem: gsp_mem, bar })
     }
 
     /// Returns the region of the CPU message queue that the driver is currently allowed to write
@@ -185,7 +190,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let rx = self.gsp_read_ptr();
 
         // Pointer to the first entry of the CPU message queue.
-        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
+        let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx == 0 {
             // The write area is non-wrapping, and stops at the second-to-last entry of the command
@@ -247,7 +252,7 @@ fn driver_write_area_size(&self) -> usize {
         let rx = self.cpu_read_ptr();
 
         // Pointer to the first entry of the GSP message queue.
-        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);
+        let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx <= tx {
             // Read area is non-wrapping and stops right before `tx`.
@@ -331,7 +336,7 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let ptr = MsgqTxHeader::write_ptr(io_project!(self.0, .gspq.tx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqTxHeader::write_ptr(io_project!(self.mem, .gspq.tx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->LOAD ordering needed to order `gsp_write_ptr` read before data read.
         dma_mb(Read);
@@ -345,7 +350,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let ptr = MsgqRxHeader::read_ptr(io_project!(self.0, .gspq.rx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqRxHeader::read_ptr(io_project!(self.mem, .gspq.rx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->STORE ordering needed to order `gsp_read_ptr` read before data write.
         dma_mb(Full);
@@ -359,7 +364,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.0, .cpuq.rx)) % MSGQ_NUM_PAGES
+        MsgqRxHeader::read_ptr(io_project!(self.mem, .cpuq.rx)) % MSGQ_NUM_PAGES
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
@@ -367,7 +372,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
         // ORDERING: LOAD->STORE ordering needed to order `cpu_read_ptr` write after data read.
         dma_mb(Full);
 
-        let rx = io_project!(self.0, .cpuq.rx);
+        let rx = io_project!(self.mem, .cpuq.rx);
         let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqRxHeader::set_read_ptr(rx, rptr)
     }
@@ -378,17 +383,24 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.0, .cpuq.tx)) % MSGQ_NUM_PAGES
+        MsgqTxHeader::write_ptr(io_project!(self.mem, .cpuq.tx)) % MSGQ_NUM_PAGES
     }
 
-    // Informs the GSP that it can process `elem_count` new pages from the command queue.
+    // Publishes `elem_count` more pages of the command queue to the GSP and rings the doorbell.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
         // ORDERING: STORE->STORE ordering needed to order `cpu_write_ptr` write after data write.
         dma_mb(Write);
 
-        let tx = io_project!(self.0, .cpuq.tx);
+        let tx = io_project!(self.mem, .cpuq.tx);
         let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqTxHeader::set_write_ptr(tx, wptr);
+
+        // A write to the head register interrupts the GSP. The pointer itself is in the
+        // shared-memory header, so the value written does not matter.
+        self.bar.write(
+            Array::at(0),
+            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
+        );
     }
 }
 
@@ -468,13 +480,12 @@ pub(crate) fn new(
         bar: Bar0<'cmdq>,
     ) -> impl PinInit<Self, Error> + 'cmdq {
         pin_init_scope(move || {
-            let gsp_mem = DmaGspMem::new(dev)?;
+            let gsp_mem = DmaGspMem::new(dev, bar)?;
 
             Ok(try_pin_init!(Self {
-                dma_addr: gsp_mem.0.dma_address(),
+                dma_addr: gsp_mem.mem.dma_address(),
                 inner <- new_mutex!(CmdqInner {
                     dev,
-                    bar,
                     gsp_mem,
                     seq: 0,
                 }),
@@ -495,14 +506,6 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
         ((sum64 >> 32) as u32) ^ (sum64 as u32)
     }
 
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: Bar0<'_>) {
-        bar.write(
-            Array::at(0),
-            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
-        );
-    }
-
     /// Logs and consumes every message the GSP has already posted, and returns without waiting for
     /// more.
     ///
@@ -522,8 +525,6 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner<'a> {
     /// Device this command queue belongs to.
     dev: &'a device::Device,
-    /// MMIO mapping of PCI BAR0, for writing the GSP doorbell.
-    bar: Bar0<'a>,
     /// Current command sequence number.
     seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
@@ -571,7 +572,6 @@ fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result {
         let elem_count = dst.header.element_count();
         self.seq += 1;
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(self.bar);
 
         Ok(())
     }

-- 
2.56.0

