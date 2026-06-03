Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AD392C4B
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483865; cv=fail; b=keKZ6eclo27EyxF6ffnQXVaZvrfbqmIgWSRcIXbS3fa1UeT/QZVaTApTV2tpP9YKwIyATQaW9yCYMADHdjreZ52klnGtyA2MVhy/BTntnhknaTiK79kT+8Ucc3ung0bbDZMcyA9sfzQdqPNAssjcwu9GffM+9WmqyqsQg7ECUro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483865; c=relaxed/simple;
	bh=/N2t0Nge40qcGyqjRuk91rQEdVadEjsybo0b+GtUssg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=I2H+7K3GZ/V3tMyvstYtmefEqW/gQ8vbVaNe1uUUF0+1KeymRT2zVcHlP3QCg2HR1D1HCwLMM9BCW5NRvEYBY8Xptgf8d7ktnDnHSjWBnvylfDxCjvIt1rze9A09eYTcrcRDrMtX+UuGTdFeZl2P2QjZRiDnBcIiZ1+fhsnyaQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BoxrxPdG; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BoxrxPdG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNytf1Si8sGalspM0LFQcp1gHsgNoCwse2LhYDMk/2YCAhcfWcKJwiHG4j2JvsmjKjA6v97mVaTSqIG1ymXUavBtso5rKVA75WUBZMFqBo9btHPLf92OLO2cz2bNYtU/WD3twhDC/72rFLqkLY0nBabjtehsNnwP7AvpdLxwjOMJzAZTuD9kU+MSY7SLrnDTFSHxMUzsA+U4VGS+6xJk8D7CKyZVll21ocC/4qPCy6MgCo6W34HhzCP/WAyhHhgRNtLmAgfJ9j5N9l7SDRYVwAuig4yAYk8YvZu07TgyIZfN/T4Bja6TWQUHf8FXc8R5CqdhMON4ud0Rssappn/EEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N2t0Nge40qcGyqjRuk91rQEdVadEjsybo0b+GtUssg=;
 b=P9nLEFs60iOKm8OElQWu6Isx063DNkm/AtEoLslaYcLaW7xooEddQlecj4cJA+Xzind6o8wqLui5BL8sG+STAj1GPYsa3602pNpPJiRHfNuJdMUcLiJ7h1xPtx6tzlQfppyE81g1GskQyKJwOuJXeChw0gsl0S0Y5IWbsJiBmyIqOhLAzavz/1afHIcvlQdZNiKfVA4g/Lz/ZvjY4g87upIqmIKQxf4f68W6lWJA/jaVXmjnUD18/yhPe+fSG4iagiPUYaWdN2SWgpCGgyLnY+P5C0BwMMfl5qTPaRFSqp3rdUxyHNg1lUb5jXPQ2W5swsia52b9toN4g0BJKQ8MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N2t0Nge40qcGyqjRuk91rQEdVadEjsybo0b+GtUssg=;
 b=BoxrxPdG4T8pTvu3JrYCngpbCsdhYuDKKk6V+jrko9orc9LuYrdzefYuZR5m/DbqvaQ2gGCqSP149AktHHLIDBQ0zHLuRTrJmED/9YN6P+nXN2TyDVS0CLqynYoIr2nfXVCMPpBF2UJ2x6hGf6rmqOPo5IMdlEkPVUZBkTFi5aO7Zuvl8FA5wGookEAp2pnFp+4cdf8dL3H+SKsvMS3D/d+OV03/qOFWXKDy/uEa2JgLFJEhIhKmwqOMptB/rKMljwkRyHU13df7YU6ru5korkmn4x8ZCEvkl0z4AolGYNe37DCKzf5OOmIJ8Jy4DHKjdhIptNOHQHBiVHIKkL6Wfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:51:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:51:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 19:50:56 +0900
Message-Id: <DIZCUNW7DGR2.WQA6I6B4MTE9@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 2/9] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-2-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-2-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3a6cce-9d76-4159-661e-08dec15dffd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	OJSC492SC9l2rysHb2qb+cTXFExlshDe9G9xC+iGujuVYZqvIHo2hRz/GSSuMwRcQ0wTS/I5QF5HGt5cnsoK5IAB1yNC8ak+p8Ov5u9ovx4YXmGm4hnou5JsLvUWVN7brc8p37Yt4eg7xDdyZ+HB28NziMMad7COo2ykIMsfU8780jkDa3jA0XewX8V8MnLd07kjniokcS288KQzhPLoKo1dAzLNSGHjvspOq1k9XjDO9L7sW3lGaUYhX2sxr7s1eQBkghcsnnEDf+SLm44zi3JwVLK/6p9oKBDxuJfNpl+a8o8BV6NHf/M/W4IgfpJASVfJfZ/p+i6pt6iks9qRkR0r0j3GE5Y60kLgA3745B1Sq0NTXNtQ/qlLJtdNbzg7KP0hw6zeRKa7qgDwVeZRJIovCrQly7Twtd02gi1PCMzko3X+5xqU6xDRuAE9mtKXTN9MMDKZ4n/nuMpQfMLNscRnUbo1oG5xQe6JobbobcfDw+MjIunlXPruSM9yyoRzdkvoEsgcek0Euidc8aZ9Y4eid/c9VnTHhmtJPpUp2Wr6CKNsU0M11LWduYJYifNSkPQZZ28+npW3ubt0UXAAQZ9nlrEBs6tiVjCNolXZxO6LNRPuHhfdCoA2SoOuV8EGwIQoyA5RUhiJcfwVChxlWSNN3CtiaILTQVTb53EZKiaaoH+HUGYBRHgrVLMJ+O19
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cllWN3QzYkkyVlRzakV4L2JVNmFkWk0wcHAvdnZrR29jNzU5Uk5rWVJiVW1D?=
 =?utf-8?B?d1dMaWZMY1U3OGJpalRBNGpDblJDL0g3cTJvZTBPMDlPWk96TFQxbjBIeHBZ?=
 =?utf-8?B?VHE0R05HUm0zU0RaMTJKcDdlRGVucU5pYk9lampFTVRtR2tjNVdTWnQwMmkr?=
 =?utf-8?B?NTd1SHRTNnBjYnA2SkNEOW9uc1gyV0JyOUk3bVJRdCtrZFVUWWZmanE5bFYv?=
 =?utf-8?B?ZitXTi8yM2lrZTI4cFFkT0xoczlSZ0NoZERRRWdmaitZMEFIUW01NDFvUS90?=
 =?utf-8?B?UHo0VHlsb05BWS9xWVBpbDRIdXJSQ3U4aENXeEoyaWRCSytZUkQ5WTNOeVhE?=
 =?utf-8?B?bm9kaVorWUQ1Mk5rWW43VXVieG9yQXlzNkFUVnZTc0FKNTZWUlBrK0w0WXYx?=
 =?utf-8?B?UG9kcTljeVhtNiswTnJDUk85eWdOQ2FnbnhrUkJ5bmZVZlJvblFMMzFmS25k?=
 =?utf-8?B?V2l5OUNSQ0ZoczJwc01aWnlFWmpWbUNROVVIR1VuRnl4MWdGNGZZZWM2QVp3?=
 =?utf-8?B?Q1pTTW9EU1QyOUNpVmZWeHlaMHk0Sk1vTmtnV1R5Q3FYN1N2YzFxUmEyK2xu?=
 =?utf-8?B?V041WWsrZlVYR3g3aUduRUszYXBOc3BCaW11ZnNKL3dRbFhlc1Z2ekh6UXg0?=
 =?utf-8?B?NzQzUmhOTGQ4dGlKRFpjOXlFUjBKRncrOXhkMjR3NkRkNDlUS3J0U1d5eDNH?=
 =?utf-8?B?TkdwaFlBUlA2ZTdRaVZFSTBhRkxRQ3M5dVpPSnZsNjZwY0pkZndmUERHb1Yy?=
 =?utf-8?B?bjRVT3VVaFd1a05WQUtUQmFlTnlxK1NjY3hwTTZyQVowZjlmY1lWYTFYL0Vw?=
 =?utf-8?B?WVIxbjJCcG9Ed0ZHSkZ0bXZtNEEyZ0VRajVFU2RzWFZQbUVSM2Z6TU5ZaThv?=
 =?utf-8?B?N3JtdWdXdGJUNERNTTd3bUM4eWcvblZwVHZiclBuZGpFalZINCtsM3FyRzla?=
 =?utf-8?B?V1JEYXJ4cHhXeW5PMldWS0FyZUFLeHZRVWppR1c4blVaYWZoVGFIUGFabzJt?=
 =?utf-8?B?MFhDdHRTdFViMW9NcjJDRnVCSHo4Q0UxYVNYbTRPT21Pb1RMbVlUazZTaEZv?=
 =?utf-8?B?Sk5UOG5tNFNYWUR6TEZqZDZmMWRKQktPc2lzNmNxc2Zoai9qUmwzZStxYlRB?=
 =?utf-8?B?Z0gyWTczM2hKc2ZVSnlQc3dZUDdYcW02VzQrM0g1UUlCRWMzYWZMZTZCdUFS?=
 =?utf-8?B?TGFobHRGUisyZXppTmFBTndXRXA1aGxzYmI0NWxFWVovdTF0VjRXdmdRRlZq?=
 =?utf-8?B?cmI0M2pvMDJrMWVBRC9ieGNTMGZZYW83aGlpWWZxK1FqdTR3U0JZTDlIOEkx?=
 =?utf-8?B?QlJNczFlR2tGQWZYRTlrZHlGcWs0bVFYTHloeWxjUkRBZmVhOG5LUTFyUEsx?=
 =?utf-8?B?a0lXMFoxN1J3bEh3eFB5QlBYL0duUlZYSTNwVWFNbEZ3bmpVcGRDNXA1NldC?=
 =?utf-8?B?K1lJcHpBVktyYkh2cldGak5vMUFBVjIrNVV6OElBVHJPaVRoYUs0SlRJeHhu?=
 =?utf-8?B?V3VQdnluNlBEU24yenQ3YWlaR1VzcGFFY0QzY1pqdjZqdk1xTSt5RW9JSGF2?=
 =?utf-8?B?SVVuWlgxN1BwbEJzRXc0V1RoMUxCbFh5QU92RzhMTEVETFRja05CTEVGOXlC?=
 =?utf-8?B?a0N1ZysyaUJjL2RZYUJOUVRRUlZ2Y1FaTmFHNFo0MGFjc2lHY1p0Z1lKWktp?=
 =?utf-8?B?aDZJQ3N6ZE9CVngxa1hod0ZabnFJcjNIRWl6MnpieDdXSjBheDg3R01Mby96?=
 =?utf-8?B?UHpaZVYvVkdrSU5jdzVnSFR0Y1NVVG9MYnQxZy83NXBkOFJ6US9MNEdLc3hC?=
 =?utf-8?B?Qno5M2s4TVJxbUxQKy9lekk5UGtWWE5sZHVqaXRJMDNDKzBlOVNzL0g3TFhn?=
 =?utf-8?B?T2xCME5SOHEzWDB3dlR6UEVFTUkxdEl5WVlaYVpPdkhqbWxrWFkxMFdoMW1P?=
 =?utf-8?B?WS94WVg1SlBVNGprcVR6aVJiVFF5dzRPUzJFSEh2RFduNWx3aTRtU21maWVD?=
 =?utf-8?B?MVc1R2JOTmFOT1lrcTZkejVSQm40YUIxZlNta1dOMDFXT0V5Q3JyZ2R4ei9E?=
 =?utf-8?B?a3A3aGhYMjErb1ZpS25VdzMyK0lyc2FtVTRjeWFBTEFyUlJYeld1eW4yekRT?=
 =?utf-8?B?eSt5TFhuQkR1YzVNZUh6NzFVQ3BjbjNVVDdIb3h5RzNxQk9vUzRjeEF3dzYw?=
 =?utf-8?B?TGRyTHI5RXZ0UXhiTzVrM2pYZDNpSnh1NzVPV1ZrR3ZvSURNUmY5clVCS1BG?=
 =?utf-8?B?V3BkWGtqODhhYnBmMEg4SDlFcjNIcUNNcjV3R3hPeXhmcVNqNldzMGRodDIz?=
 =?utf-8?B?blBEWDVYSTJ0c29FOEpNd05sc2FNLzRlamRpcEdjSXdxMExFNC9MMDRCaEd2?=
 =?utf-8?Q?kCiRfgKLmtR/5KOsZ/A/03VB6ZY75Rsl+p+23h/ws2lA9?=
X-MS-Exchange-AntiSpam-MessageData-1: SZ57T2uthcj0GQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3a6cce-9d76-4159-661e-08dec15dffd5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:51:00.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9lANs0yl/bujlorOZafhLQOU+j4Maym6ykLkRI6QEuSaciSI6C7TIRYx9/Wz3aGNoUVkSvRIHa1sn0fPdJocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> FSP communication uses a pair of non-circular queues in the FSP
> falcon's EMEM, one for messages from the driver to FSP and one for
> replies, with the driver polling for response data. Add the queue
> registers and the low-level helpers used by the higher-level FSP
> message layer.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
