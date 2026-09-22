Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E83549399
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083433; cv=fail; b=N6lqt0GQYkOZUIOnux84n44z+IcI/1tqAu767pdMRHjP2b8fI1A9vxexput3N0xbuEEaErzuMtaYHFx8xLnYV9a+C6pr+qyYG8teuvHKvczJ1HpyNfHgt1MQS9hxbO0zT7ICBG56LU7H10N14zi+OqD1J33psBjk5P9X1dEtXOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083433; c=relaxed/simple;
	bh=m5EWTPLnajiCNVes6G5geXa6gyRdJsrxTGL3KnMi+wE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=r28XXOBLwDM4cpS8CCGVkvTN+RzgNM4cvrTATtlhrMxX1l8QkrTSHvfLt+KXBKhccjF4aPqS8HwcVyIJwfPyNWWw5hpo2MZ/HrwW8sKFc7V4fak9CeMXYzU7w6EsSXpmH6r0/XwpYjkEd+40Sr3NO4yyK9NU+KkBVk7HmTrQVdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DUQS9qB8; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DUQS9qB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOBwmNZe/twrbgYopdEJtmQBcMTs2AqIuq0uAlD/Kc6R7+dg6s6wjhN5VvneCvN1n/7hoVhkPXrTy7dfLT2OtBltV7yhh3eVGK7DvOXJcUb7YSRWo+TvEKmH1Sn3fVh+tkHX/z4JBV0N32/cNKFbtswCcHs6e8swQMnk/HyvuOS2xE1UnUke/y9KmjjFwV87LQfvfiNJpSHMgR7OCoBz5OhCVlGkMLUYgYdqdrEDyNTSL8T3JgV75JjGjqCAsk5+13t8Pr1tAYeVfBW8HEBS3qgP9VLmkmsrkyPKm42uic+0KgeBCFEVTs8+aFfRkWoxS19kDDmYYCAPPZ1z0A0wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5EWTPLnajiCNVes6G5geXa6gyRdJsrxTGL3KnMi+wE=;
 b=LjglEsB3hAnK42DrhRMlDdlowQnkmSnKK33iHGSwzyoyL4ChyiZV4jKVAB/IsmndvoewUNDW1TJ1gH3tvrJT4g7r4CN5hWr/5rYtnQzam1znFKYRp5uCb08JZJmKQpKP6Id1CDBY/Tgdcqpc/IVqWXm0FIAgSQyqBHItKeen3TfvMtgVKPMxIyaftRrBIP1QvcUzNgJLtMbpnICeN56zNfOUg+5FIU9yUxIPf9k46XyRboIAd4twiPNrVRYIiRzEIE/X0tPkfdBkikjFrGWwMl/xyL7Fjp3hK8RLrlNVYx+qQyWuZQxmk0D6hBioEosYXchObnRK9LZjwUhk0fs5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5EWTPLnajiCNVes6G5geXa6gyRdJsrxTGL3KnMi+wE=;
 b=DUQS9qB8bTOIWIRxsWeovbhK0UBBtVccCQRKov0ixoHocyFfWnJWfXlxNuCfifxAlSFudkHv4q3vuEZcMiw+fOcKmcDEfgTFHa3bx7ESp0lxtWpjgX6asYN9U3BaQ+MdVvE7DuXKMuORN4Hl5WHKUgADDh2BlPlIoV5je90MT2qjnsJlGoHYHEwO86QyVDcyObPJzvyJkblcYEdM4Cmaf0/aQyFRv+6OBuu5n9HCezfTLwLFXstd9P+fRNLmuVq9PDawYXtOr+yLW+D75dPnpCzHAOYQMGzRATRHt6sXhKBMIdwlKE1YgR/VftfJc9AyyekuwlgUftJAlb3j5+U3fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 22 Sep
 2026 13:23:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:23:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:23:42 +0900
Message-Id: <DLLVM3MU2HNN.1XWJYDUX8954I@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 02/33] gpu: nova-core: set MCTP transport header
 version to 1
Content-Transfer-Encoding: quoted-printable
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-3-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc5e3c3-c5a0-43e5-ba49-08df18acba2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|23010399003|3023799007|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E8U6zABYfbkM+h9SA8A5Z87RdnkdOnDtEmxim+4NiEC8sLlhIikI+oLljhLlXZPus/r7flgk7HRDzLjKn+VN3ZxGKQ9wtGQv/r8gneJchHDZs6WM1/VWFgBYiRWCR9E31RL9fWGjNo2qgsq2RwMFzkBnRWieVRSabT9wvhjCHa4Bx3gIjLQ5TAzzpQa2Btc2QW+k/unp3qh0U/1cPl5ILmQi8LwgtzRAsQ6c00pwQRdVIjnsBwZzftQm3FWVUpL5PZ07ffV47rAet7NbUaozKgmxwnawfwKhuyQb5Rw+S/XLhsvb2lXOD+Y/DqUzY2t285hKRFwLcbFMfk18KiBi9NSlYQAOpY0WSKyoY3o75AYTn0ZDweZNbRwBN769opP9e8+z4/IzCyU45C8zLtwtj+ffjQY6jxaHeP42F+96HEFxRHJ9TLfCVU6L+dBdXXGJMF8j/7SfH69ErZgaBwAzI7UdzPnO4FP/BujzuOZDYro4aGVh36hbrCawSlvMpEJW2QI9BlsYMkG3BC7Iwd0O68JfWAmo8tDomgO8TYfNFSAo8HFHlV4y2gLAh/ScnpNu/Azm6G+whBgpFvcApK5ulyA7ySmKjkDKtjAih/lEhakv1cj/Sm5XiQfBWdwLQO4iJildNUKnW0sst17DZ9Y2Nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(23010399003)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1pWFVDb2JWMzA2WGZ4WGhrR2dUeldSL2c2ZzN3Uk0wTittZ3B5aWRmZ25R?=
 =?utf-8?B?Ry9IMmxNZzROZGlkbTEvbDBSV2VDL1paZkVtZk5McTczQ1VFZkhXc014MGlE?=
 =?utf-8?B?elFQaWhWRHFzVEJyLzUyc3B2RiszazduZUtHN1E1bVdMd2E1ZURvZ2FzN0xm?=
 =?utf-8?B?QkpBdTNyZStmazEwRmJxR2ltTFpRbnRjRmRNeEVSRjlFMXhCT2s2WlJ0VlpW?=
 =?utf-8?B?N2Y5MlF2Vng3WjMydHk4b2hDR3dvaEtRUlJMWTRFcm83clhsU0FwbllZb0s3?=
 =?utf-8?B?dThuS0tvcUdQM0t1M1IydmFuTmJCUHBzeklqd3IvQzBHUjJNTnoweG1FK3Zm?=
 =?utf-8?B?Z0l3T2pURjVBdFlJZiswZXZ0Mll1WDkrSURmVUk3SU1BdXQ1ZzgxZ2FHeWNm?=
 =?utf-8?B?MXNXclRxRjZKelFIRmdOa0hnNDhyeFM5SkNsVlloU0RibW9RaHpXOEc4S0Jm?=
 =?utf-8?B?UnZQZWoxbm5KcjV2RWViVDkxenRkN0hOODd3OFVOWkdORjlwcHVaaDlRNnEw?=
 =?utf-8?B?amFCLzk4TDhXY211Wi81SDZSNUo2d2YwNVRPNzN2elo1ZmhuMk1ZZzJLRTMz?=
 =?utf-8?B?dEYwYk1nKzlhZWdQOEZ1b01kWHpmbGUvcTFrbHBYa2plY2NoYzlYUzkxZEpj?=
 =?utf-8?B?bFlPOE0yRjhGLzAwMnRQWGZ6enVDV21MRlJOdGMxRkQzQ1pCUkFlVDg2aHpR?=
 =?utf-8?B?VXVoU0ltSmQ1NlVsTlBnU2tKQU5zeWhCYk5qb0RCMmdJNGtxaFhoSWk0UUQ5?=
 =?utf-8?B?UHVKa09VZGxpTlhKd3UrVW16bHhRc091YStkV0YzM1lNTWltUUhXNndCUzdj?=
 =?utf-8?B?RGtYcjF1aTJ0QjVqbFIzTWRhbmpMQU42QzNITWp6MDZrNGtoOHN4YjU5c0xJ?=
 =?utf-8?B?Z2I0dE1rcG5BQ0tBc1JpWkNaWi93V2dkTUN6ZUprcFA2RVFVV2dhc0haNGRh?=
 =?utf-8?B?UE8wYVJmMDBjUDd2TjhvTHN0NEQvM1czOWRqWkViR1BVVForWFRBTnB2SHd1?=
 =?utf-8?B?RzdiN0dEdVovN1haT0NtQlhWMEJ3amQyUkNEdHozbktTbWx6cGtkUjRvaDI0?=
 =?utf-8?B?SjFSd3cxRm5raTNZaG9QTkljSHBwVFIvejJDNDZuOEtQcVhBSjE3cVY1RlVD?=
 =?utf-8?B?T1JLdVJ4dXlxbjlXOVhjMkwxazEvSlF4VEM5RFEzNXh0Wmg2Y3hQVkxybHdq?=
 =?utf-8?B?eVRkV3dRVU9lN1V5eUVvMnFXMDk0VU1ZTXpQQ05CYUZ0ZUo0Qk1LQTVUUEhU?=
 =?utf-8?B?M3B6dllhOWlHSTRnWEUyaWNpOHNhZG9qU3lBbnRCSlJQdy85L1UwRHlaZmxY?=
 =?utf-8?B?WVJ4c1hLNE5zUkRtRENwZ1JvaDRMa3ZKd3ovR0dsaFpiTWdJR3IzakRDKytC?=
 =?utf-8?B?U05OLzVQL2hDcExVaXhFNHN3a1l0eWxmV1g4cHBtS1VxZjQ3T0FDZEFRbHpQ?=
 =?utf-8?B?ejgyU2s4R01NdTQ3RFFhUEFxQ3h2cWdTRGFoTkJrYThDVDFHMktOcUtpMlFt?=
 =?utf-8?B?RWJ0N2tpSzRzbHFrWkNoOXMzMHY2M05xMmRYYUtaeUFSN3ZtSkU5SWd6YWlB?=
 =?utf-8?B?cE1SMXBVNGFINXpGQ2F2MVZTbVU4VUl3Q24vRWxqUG4rOGJmc29pMnkrckRj?=
 =?utf-8?B?VTYxeG1RQjlNN2tYYkNQcU5qNGVIZ0x4MUQ3SWpraW5QeGxKTTdjTE5ORHlD?=
 =?utf-8?B?NE9zMHUraUxsaDViM2dwNCswTkpNaVdYdVhhbnBRc3RWK2pQbDQxbDFmKzVz?=
 =?utf-8?B?dkhPU0pMZUhaVGtRVlJWVVZ6RWNSZ0VnSzVwK3doWXpYU0UrUzIxZkR1SFRY?=
 =?utf-8?B?NmxYOHlhcUw1NnhCZStqc3ZLVGlxZmFUL0pvRVg5SzJKTDg5cW9KbTBVbS9I?=
 =?utf-8?B?SkJTV2NzUzF5NjNtMVJtM2k1eGtDMSsvUWNWL3hvc2wwbjZvQ1FHRGpJWFpR?=
 =?utf-8?B?VmZDdkxiUUpwZjVlRFdFaVgzNW1ZMHVKalRtc2MwendGb0RWdjl1VHZCa1I2?=
 =?utf-8?B?WnVUbXlWOXR6dnFMQWg3eEx5eUZGK05TaW84Ym9tLzFMdTM5RXluOUFRV3Nh?=
 =?utf-8?B?OGw0NVFZZ0Z1TXllN0t5TDNnQTFXdFpwdXVXZy80dUFnanZIZGpvZjdDYlIw?=
 =?utf-8?B?WnNYS3ZiaWpxYjl0aTAzcnJSaXZwcUNKdDZzeG5FV2Y0aTdlVUdOcE5HMWpS?=
 =?utf-8?B?Q0FYRWZBWnhGSzlWdmRtU3hFTS94V0JuNWFYUHdGaTlwd3VGNUhqSEh5L0o2?=
 =?utf-8?B?YkRTaExhY3hSWkZqSmsvZzAwdmNiMjRsOFdKb1VPS0w4SEpTUlM2VkI1aWk0?=
 =?utf-8?B?clg4U0VOMlQ3ckJCbDBURU9Wa3IzNnJIbWpJNnZ5TEUvQ3VmM2Ird2pWZmRG?=
 =?utf-8?Q?NTofKcCC2xAnARvqyc4BXfytHYC1qwi4vclnFfzqYgmso?=
X-MS-Exchange-AntiSpam-MessageData-1: d1v6LdtxKZ1KVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc5e3c3-c5a0-43e5-ba49-08df18acba2a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:23:44.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1idaPyxvUqQPzrKirETDhKtQcMWzjVh1uP9GF10mWX1uQwBTms5aZHOSDa663J5FRR6SXL+KNat2XdFVgi6XCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> FSP, the GPU's Foundation Security Processor, receives the driver's
> messages as packets of MCTP, the Management Component Transport
> Protocol. It requires header version 1 in bits 3:0 of the MCTP transport
> header.
>
> Nova-core left those bits at zero, so every Chain of Trust request and
> every Product Reconfiguration Control request that it sent carried an
> invalid transport header.
>
> Declare the version field and set it. Declare the destination endpoint
> ID field as well. The driver leaves that field at zero.

If we declare this field we should assign a value to it - the fact that
this value is `0`, which happens to be the default, does not absolve us
from setting it explicitly.

With that line added, this patch has been merged to drm-rust-next,
thanks!
