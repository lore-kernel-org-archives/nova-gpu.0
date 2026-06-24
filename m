Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859B25B0AA
	for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272719; cv=fail; b=Uf4kwr2Zu3Ph+gAPBrzk7pzj+sky0Al0i/GcJa5obYl3u0WPkW3X4M/C1OzaRVMF+XeX6bdqalAJZkiW0YwEa9+viEmO3RMhF3Lp4yy/3SMQCZnEOF35BmechVGxaFPYe0DSk29KnwcUITA5NC5sBF5dPh4O7xb5Y5IB/vVZ1c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272719; c=relaxed/simple;
	bh=i7eQEXJid7VN7y7lxyeIDxCLmWUguYbnt/wADJFgU+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=enpDJeFPgRsDhKzIEHGtExiQ7ercYur1ozHQV9RHB78ay9iJtzaf08AfxxBhTAUjVAYUbrS1GE/xE3n6WjwyHoT7zytSkUJ4ne1QbkUBXYbpPl5wUks/Ua2U1Ny6ndvzwdauKUU150rI5t299/bANlAdmerTWlPjIBLhm3ftem0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZlPOPFkv; arc=fail smtp.client-ip=40.93.196.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZlPOPFkv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFUdIJpjQmgxMioP37dWtJCM79zNhuMyank21u4KwCxmuJmLegysfTUaR90sh8rAgxhogiuUoLvI994g1jcRqdjAbDKQiGswZraLP9nr94tzBcD7ZL2J17eSIRd+UWhkrf+aBaEprlmlG9lLuyhmVtFhXuuwY04xIeBGTM01kGXNdePH+kl17KtASRnO2LxawJVZpyQf6qTjQUY++YSfreIO4CMqL5wurlZTn017Kx8v9mWA4/o7R0V4+nbWUqgWHtk92OgbZfnxXphic44UWIORIcrpTADR46iU8jx5hnG36CukRFtrafNK4BmIVDDtRFay/3LN4BJXHFwIhGjXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gte9JYNbhi6FJyodnSJkbuv9dmHrqHK5SK9EQWJ4jN0=;
 b=HXNfnzQKK5R2xZAgbCn02ENob5PMVf9Sgl75/qqF4LRIXi25tAixcX59B/QNV4V6pNeRR5YNSHoWoLK3Pzs94J7oykCxHIVlNMHb+rWzo+4Bdsj3FB3jVpTDtEy71X8Cgn+Ej/1Kk3CaMp0V5uP7jYtV+3kQLv3k+ulZ+GXM95Wj7JVv2xjAT25rd+q5ZCIB4d5txHk56HujAOUwL6xUqx41zmkW8QZfHa+XR5SmV3LK6v0BkcGT1JgZdhGI6dPO44KKh8USVfRbFrmEH5WNd+hqko9HhMM1OXuqVHJ2ESAq6X79EqCaMfuEh3S531ZAVDGEMIMafA3dmEBji+5ACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gte9JYNbhi6FJyodnSJkbuv9dmHrqHK5SK9EQWJ4jN0=;
 b=ZlPOPFkvyt5bOBcYiLYuaFKTbzyPCZV5hpzwxGIuXBB0wEcgAyLAbjl5wLa89sXdfx6Msfsx9SImBOXDVjm50lVw7erYHFOy7ZcADJTGIim5jW7COyjL269CWjPywzIt3S3R0SK0B2x+I83adviqRMh6MG1lwm4BPF3gfM3mTRc8CwfbKQtuhFc89zN2pN6vNt2X3t9p7TOOooliZztbovXVd3eflDTsBjIMVfE8ZJJ6nIU3aiZJxWMOsdrJufclFU0NHBcZYI6gfkV3XVcmP+OsE4Ks5P7TXAvKTAF+wdnwzCOKQ0xQC9J4cbFSMWE8Et1BctGtV4LaFgeisThD/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Wed, 24 Jun 2026 03:45:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 03:45:15 +0000
Message-ID: <ceb5210c-5de4-4479-89ef-75cea45a0b7d@nvidia.com>
Date: Tue, 23 Jun 2026 20:45:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] gpu: nova-core: add SizeConstants trait for SZ_*
 constants
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260604003930.145465-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260604003930.145465-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 17400548-618f-401f-ba11-08ded1a3004b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dp2ZFo5cNUBXQx01cfC7FxVKRRJ2vXEaITk/l5Mdgujo83SQqfoMelHNXY6Qsj0IK9T+NFkJElp26eDwxudgjTdArM1WLzoLAjb2k6cnblTanO1QEI5jZahEu13sEU9oqRdM2vK3D4QIjQ2hlrE3sbsEljxOnQkHm93inzDi7l4p74bl3Z/UGxCPvBKWuAjsJtoJsq0y4nx7VNoM3UiPLXJJ6W3I6zwH1tpruL4FfTIuy7flfxPLp9mRLAtml0orKfuuu6cmORueOupPw26NpWSCdxER9BR/beELf6ye4XKwLyG/mJInGvHGIJklTgoCyN4MqMY0/Xcy+mx/4jgfCrYO3aBLZY9xdTVbQuV33ko8Arhm3GKzilFDlrz4rLBpPXBnVJhWXO6rs4Qrkc4h/WbOhGflvFVGw0CBzh/LXOUNu/XxFHt+3BQIQ/ggEev8dxX8E809R+/P4s7iZjNtJpKpty6tms4JLalL0k0twD29v7Fzc9zOA1uOl3fYjqt8w34uisowJjzZe0hpCryqXYE7SdqopecHJf32SgXwdUfJMtBMkrL5/cvWLf/fRZkIZXxUpAgi0dzi8xqZo31oV/UFds/m6cFWR1jge4cZdxXI0R9Z4IW7XTyWLOH/lWOVjqmMDjN5Bgk2QhiRcPDDmUirnH80PB6BkPpPw8i4KNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2dkZzE4cE5iUmpIM3A4cnhreUVvL2RXN1JSMENUcG9SSjZmS3FuQzlMYjVa?=
 =?utf-8?B?akxuUW05WDE4WGZka09BWVVRU2RVcjRjN0I3OUwyOWVWWUIyR1J3U3ZlbHZ2?=
 =?utf-8?B?TzBXbVdKYzNudFFRM1pycWFpd1dqa2Q0QjQ3cWJjWTZDYzZENWpLSWgxUG5D?=
 =?utf-8?B?SUZwbk5vbklqR0JPaGFkVDRiVXNNOHExVm5WNU5Yc1BCWUtGUlJralJkZUMv?=
 =?utf-8?B?TSsvbThiK2ZaaXJ4MU4ydjdXcVVaNzY0ZFFodE5rK0JOTE1SMjVLNTJsK2tT?=
 =?utf-8?B?cHFBTkhxZlI3QkdQcU5WT09mR2hLZ0xIWFFPdVBzcytRRTE0ZWhsQVc5YWpw?=
 =?utf-8?B?VEpRRncwYzRBSFZQMTlReUV1NjF0Q2V0eDh1M0Rnc0YvNHBSWndVTzluY25u?=
 =?utf-8?B?Yk1PL0tRaHhRcGg0WW5UUDY4VEdXTUVPS1dkTVh5ZmNOUDdHZWQwa1JtaWRG?=
 =?utf-8?B?UVhCR0Q5NGx2RjBrQkROWHJ6TFF5c29mTG02WkxWUWVjN2JmMHoxMkc3Mkpv?=
 =?utf-8?B?cUhnVGRyR0VsYUY4Ykt0MHo0OFNTWGdDajZZUW0xQzV1TVczYlIxblNGWGtn?=
 =?utf-8?B?ODRlbmpuMFoxaWVmWXNOZENuT2Y5M3lHYUlDSXRNQnU3WXo2ajdpRWxzVWlG?=
 =?utf-8?B?a1JQVGIvakNmbXJILy81QWVQbWF4c2ptQmI3UWhQaGZIQTM3R3dXc20yZlBB?=
 =?utf-8?B?UllycjZDUzhYcmZCaUhjdHBXOWdaWnJ5eTB4NVEwQW5SK0hrSkhHVWg4RGx0?=
 =?utf-8?B?amVvVTFoOWUxU3V0MThhcHUydUpxaFZadEpSMzB6Z2pmajZKN1U4UjFRTFJa?=
 =?utf-8?B?Qk5RMEI4K1l4NnpUM2xwalU4SVNQY0dSc1QzQ0xsRWRBUisyMTE4bk9aMEM1?=
 =?utf-8?B?aC9sTVBGbHBXNnhrYVl5Qk9MTC9ObG55U282SE9MVlhUVFpmZytXWW5ON3My?=
 =?utf-8?B?czNQTFkwRGtWc0J5Vm9nZkk0YzFGRFdMNEJvMXlLL2Q5aXJuUnBNVVR6OUlr?=
 =?utf-8?B?T3FCc2dBN3p4ZExycWlGRU5hWkhzWDZlaHZBS0JUenhjRU9JYWEzZFI4OVhj?=
 =?utf-8?B?WWJaRnUvK0kzSVVrTDlKMzdYd0E4cEJLalVpQ01HWmtDOEoyWkpMSWJNMDI2?=
 =?utf-8?B?MTQzZThkUU92WXg1WnJsd0FURVdDTVJVdUlPQTI0eEYrYTZaaE5EUUMxT2Mz?=
 =?utf-8?B?OGtSQndJekFSL29JWXY1VTVLWCtnNkVEK0J0NGdTZjBDd2pYb1pHRWwzZmxW?=
 =?utf-8?B?bHBnZklsWG5GYyt1eFpjZEJ2c0I1aFVqSklzS0IxQ3RTLzltWm13UDBheGdt?=
 =?utf-8?B?TTZsY0pnZ21KekVpRWV3Y3FXN3JPU3Bjd0dTRm1KUUJoY28vVHdOMTBwdytT?=
 =?utf-8?B?TmVNT2pvVXR3M1AyYTc1SGtUWDZ0ZDNxY0tvQnFqeitYRGZFL3FSeGtiQlIz?=
 =?utf-8?B?Q2JROW1pQ1lQWjV0Y21md2VYa21majI1ZFZ2SlFaN0drMWN0V2hKZmlwVFo5?=
 =?utf-8?B?R2ZrZ1lXYURhYitneFYxWkFwQzlCdVc3ZnN5QjcwWE9XWDZ0Nm9JR0RXN3U3?=
 =?utf-8?B?eFpxVW9PTGQ2a3RXWXlDNElad0p4citzaHNSS0JjdTZGQnQ0cDNIZVNXYjU0?=
 =?utf-8?B?TWlybmdhNm50ODFoczU3a0R3UHZiV21FOEM5dU9zVldzNDFDcUJaUnlrR3ZW?=
 =?utf-8?B?Wlp0NThVU2ZaUG16elRnNWwwRjZRUHB1eS9vUEg3ejVnSlE1aUNnd0d0aVRa?=
 =?utf-8?B?ZmZzYUs5K3drOHRBa2l2ZG1wMkRWUkkyYk8yeWplazdxNnhnelVQZDhuZ1F1?=
 =?utf-8?B?cnBxZGJySGcvTGQwc0ZmY1lBbGx4V01qVnJEY1VmK0doV0EyVFA4VWZkV0ow?=
 =?utf-8?B?RVZwTGRBTGJFM2JENWZJR0VoN08ra1lIbXhIalk2TGE4SWxhc2sxbUphUHJW?=
 =?utf-8?B?T0p0WUczMEg4Z1crQ0FzZnhneHFVeFdpbCtTRk16T2N6aDBCdE1iQ2RTRWkr?=
 =?utf-8?B?Mjl0SFZaQy9WNFRvTE1yNUxnTE9JTnpCeTV5R2x3TXBONkxkU3QwSVRxQy91?=
 =?utf-8?B?ZGlETzlNRjN3Y1lWS0J3eXhpWm0wMkxvTjVwTWVXaGc2M2UrWGVzMmlPSjVh?=
 =?utf-8?B?T3hrdnZpM0JhWDZxWUVjbUFDb2RvY1pCaHJ1UEs1YkpVRldkOVptNkI2K0c2?=
 =?utf-8?B?MTl0dW00U1RlYU1GWXV6Q01vNmIrTjNjNVpFOGVBdVlEeVg3bmF1anVkYzNT?=
 =?utf-8?B?dVl1KzJUMVN2QnhKTkh5Vkt0ZjJld2FzTGZaYmlYUkdGTUVrWmFrREVvRDNZ?=
 =?utf-8?B?TTNmcW1YdTRYUkdwOWJ6Q0NoNU56amRSZjhIazNaeGhybmVCV3o4Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17400548-618f-401f-ba11-08ded1a3004b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 03:45:14.9826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGD+tC2AcwyyS7Fj+Cj3F2Ljk/AyPI/sE/fy0bFcSB9yYBZlYOZ9oxdKMIc5bF1sbXX335fEGVkJRAOsguDF7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234

On 6/3/26 5:39 PM, John Hubbard wrote:
> v6 is here:
>     https://lore.kernel.org/all/20260411024118.471294-1-jhubbard@nvidia.com/
> 
> Changes in v7:

And actually, the subject line should have said [PATCH v7..., but
I somehow omitted that by accident here.


thanks,
-- 
John Hubbard

> 
> * v6 patch 1/2 was already applied as commit 98e508e5b016 ("gpu:
>   nova-core: use SizeConstants trait for u64 size constants") on
>   drm-rust-next, so this series is now a single standalone patch.
> 
> * Moved the todo entry to Documentation/gpu/todo.rst per Danilo's
>   suggestion.
> 
> John Hubbard (1):
>   gpu: add todo entry for device address type wrappers
> 
>  Documentation/gpu/todo.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> 
> base-commit: 99676aed1fec109d62822e21a06760eb098dc5f4

