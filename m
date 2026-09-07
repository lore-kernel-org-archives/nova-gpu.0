Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13730BB8A
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 04:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754812; cv=fail; b=oZrlBAMjaqLTOOf+pb1YhVA00NjQzSDCNe/0Mr2bmxQf6ZqG3ZqsGfWeiH/CGN2kNCN6Z8GMvSN7LSTVu9eQVEDRRsJ61KG6kxBsutkOnaOzrgFCKg6RmJxpvKqnoF1jO3gSXlon8YYjJj8fQKh1hTSUsJF7gJicqXoCKkzFesE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754812; c=relaxed/simple;
	bh=ChMCxTKctId0meKpWhcwk43YwoVQrl4lW6St3TJEVBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FYiQBOyhldp0TmLRacy9xCplVMqGC24KYxwKU7ZAnyHKW5bTAiSa447P8djeyZeeEyCaK3WmivDjE2y7T6H4dtvCVFwulJwn3NY5V5eu4UbAOKRGUfsVQfWGjCNtilwMLIx/XmoNV/z9QuPdEYSO+5QJJTOt/D74h5ajjIBq8Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iykqeNfM; arc=fail smtp.client-ip=40.93.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iykqeNfM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUAlgaPnKN1kVlz3tIagMwAqSEDmqOYcz6e/Je42gWEjvZSF83Ld+LfXoj3+ksi++47tktCg4+Qd/yv+8cTjEpELZJPHsS5M9TUeZap/A5sHNMAA9kCYkW55aaXBLlEgcfZvVsiP2Rdy2z+DmLkSMWCgELcqJZeaSi6Bf799BMr3AlsAtZNcTfeZKI7kbfcScWh3JL0Cmt4eGtd0Tp4KWv0cvOm9o91tFVoGSFmwfZmD5FxoQCoEDmCl3f7MHbqn+NtAym8+Vo75VkrXMYSrg64bNbqTq2Ld25c3wQdlNBCFIsVJg7q/yPxjmsZJ1i3/qIdA097XqjYtIkBPnzZxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=159DclCg//Taz5sh85loze4JQGzFu13/OanSfpagSio=;
 b=D+2xFFeCEmM+940oDPVbbEvZpJTWFB7LtA+kSX6Pe//vSI6gaal/hC78C/yQLaTFe9LXa2LD7vviLHOqzjymAvuzJeVTpcY8sr9hPFpu+oycLeh0LjZisSOrxsQyyzDb+19BNX6Us8Z5ZDDlAn5kJneiClamE8LwUMY9O273PjHcqSsLrk+zb5FAelV6F1BxC0AgDfJuM0Mtv1rB5erwxJjmAvGdtv6laIKOQrugn83srRHCVyXpJy8R25SILw1quh2+u1jQFjCYOFaM9R8rynbg5bsYhRz0fXNHEEw+Xj8yi+6dgxUI3rOcTllAgMwEedMeMLXFV8vB/iPMKUOIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=159DclCg//Taz5sh85loze4JQGzFu13/OanSfpagSio=;
 b=iykqeNfM62qnUHL6UdGbAwGdXNdeQf1JnZ4s3dxaIFVfrgYBgmylh0i8E4tllaPwgBbvF9mrYLC3JIaFyZpRW57W66G3s4V5es9SSoMnqdetOW7XALrDrEvA1QY+zDuioZepn9B1/B3nv/qWn5MLrtwBXZdSz+69pcMNuYCIYyE/AtCm9+Di9qAv8cg7jNIdFyc+41LSMlC9Q+kva07EjlSfVNfm0ZpISU/LgXsVaaln65BedD4Q8dw9Cte4Zr14aZq3S3cfEy9krUclvkma/7/L2O6yw+BJPfgeitqGOaFvnKjefxM39kcKXm7FUX9yD3CuCxlf2wF1n/AyvAAjQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 04:20:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 04:20:05 +0000
Message-ID: <821c96ee-fab4-4dbb-96d2-b2446a38dade@nvidia.com>
Date: Sun, 6 Sep 2026 21:20:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/31] gpu: nova-core: extract radix3 page table into
 its own module
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-4-jhubbard@nvidia.com>
 <DL8R8THTD7T4.260VNQOBXRHJM@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL8R8THTD7T4.260VNQOBXRHJM@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cc85ca-09b3-4f54-60df-08df0c974b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|7416014|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qFcnOyg9PlROQTcZn9pU9m41haKWwRhhScGfPey7OC4bZbuxUXQK+LPH0HuaO/gH2zQT6MUBTVOKNYMbl0yvUE1AaImLh0PQffPLKF0LKXDW3VxRDaKnkH57MuX3oHxqWeWl/WwKUeWONF28USK3yDXL182GkGSA9Gxnklp820+WJTTscahdhT+Y8l3NYOd2hYj3Oceq4ANBkZ/8St66XqRHj1G0YprYN0Hzk/rlhS7ChmIcmJc8vkH0fzdMcxtEVVggwP9GLdTya+uVn9lalFR0dJ5IyN8qgKnRl0fqL0V32/F7WbENqnZKYZtU0vCIwjDXllZl5/B6trnsePPHaVIG24PbJXPAdHX9187SZjOm/0xJoHWF+k18gWvIBsbmcZm3D9nSbZMeZF7Dy2/oJxppThxqbUXDj3GuPujDIFjiNSVmrGvh8h3zx931/8QR9UAe2QBJG/w+5Mbzvbr4z3k6PFx8oAxFQAzU//lg/4xrNvydiBVknpOlWjZvELe9nQOuMQPUqtLJ69RJeVqy5qkNAMqeKaopIHkrphXyuxwYiU2xrky494DwQvUEu3cqrDohUBoCIjaIQ4saVKN+i3sa+l6UzBSa1SHXgOk5CbKn8mGSc+YtHWcudgxAHE+nz/p7pW0LmPCjabBbXCSZsXG1U/y4KX/dKV/CDyPTG+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(7416014)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VsWDZVK1d0UzJxeWp3eTh6MTFtdk5kTk85SVZxOHM5MU5ZYnZUa1NsbkFL?=
 =?utf-8?B?QUl6WUM5WUpGeVdQSStxQS9VTmVBZU5VdjV4RGE0dHdEVnFnWWFQdmxKNURV?=
 =?utf-8?B?ajlTSm1SMnRtT1oxc0lkZlZxQ004MGZsM2JFaU1qdUZ6eXRLMGNCZ1VDbEVi?=
 =?utf-8?B?eG1hU0E3NVMvc0JkU2F1N3c5MVc1OWhpZ1grbXdYY0NvWWJkaGJFSXVDN2li?=
 =?utf-8?B?bitnRXhMRFVEMm82aXVHc2g2TC91emx0ZWlhM3RqYXJwSGlRQ0VrZ2lUek9a?=
 =?utf-8?B?NW8rZ2R3Qm1pSXUwUHFhbHh4d2xONmdsMUUrVy85OUhwbXQ3dlR3dkRRQ25B?=
 =?utf-8?B?RW9NZjZZc3NSQ3BWTExxb0NNbTVKV01aK1l0VTliajdYMWU1M1Z3WFFnNjM3?=
 =?utf-8?B?UzlsZXMyM3V6SEIwdGRsVWlIM0VpNnBoS29CYzJIY3dLZldoVUtaK3AydlpX?=
 =?utf-8?B?V1BiMWpkRE1ZUVdwaGhpemhiWjQzQmN6Y3hackZKTGh5MXhTQzBqeHAwN0FF?=
 =?utf-8?B?OHVtdE5iTkJQZGtDVC9oWWxoSE1vVmVvdGhTdVUwSkVFdllxZEdkenpvRXBC?=
 =?utf-8?B?b1AwMWU3WEs5SjdiUEJzeTFVbkx6eC82Y1p5cGhFNkNnS05rNVpwdkJXUEkz?=
 =?utf-8?B?aFZsTUMyMitEcDZmVlNBUGhzUHo1cUp1OXRFQStmZW02UHB4RkViKzRaelpU?=
 =?utf-8?B?MzhLZmgzYnhwZ3Z3RHlwZmJIaC9JSDNyZVMrWFRMaUZIcExOZFU0cDA0REV1?=
 =?utf-8?B?SGd5d3hTa0VKdFV4MGI3d0ZvZG9oMmsyL29ZQkQvTkNwdklDaE1RZkJBRlp2?=
 =?utf-8?B?VmlCKytZYXZEOHFsdlJSbDY5blNBS1R2ZzBMWVF3UVFlbnBOb3k0L2tKdERE?=
 =?utf-8?B?ZTgyU1UwWC8zOVJuOTRvbCtyRW51OElrb0thdi9MQk1yc2JhNzBrL2JJRUlq?=
 =?utf-8?B?L3BPMk1vZTFGdk1XMGdLZWNtbVUzVkl2RDRhMjkyQW5DOFVxajhBdUVwV1Ba?=
 =?utf-8?B?V2pQb1RDQy90VkFuc1k0MlF1U1p6ZDZIUHJ5RUs2cEdaT2U3M09JN0F0MHJD?=
 =?utf-8?B?aGhIUk01dUhkREtQcEdRRC9ZK1NkQWFWTXBkVVo2UU9vangvRVNFeEJ1Zm53?=
 =?utf-8?B?eTNsV240RFBCNDBWOEJ0RjUvK20rQmFiUVFDek94RDVMWU1odGd0ZmxndU0w?=
 =?utf-8?B?NXpUYm1oMWEvd25oYVozU3FyRDR1Y1hIcjhjdG1GTVY3VjRzSTIrSm9nVjlN?=
 =?utf-8?B?bkJsbW5HUEhZWUI3NFVHSUZKN3d3THRKd2ZZODVIV1REazRVb3pXMW9rTTZn?=
 =?utf-8?B?UEVlTEN4MFRNWTZWNWhKa21sZi96UUxEUmp6YitMeXZ2YVlkOCt0MllYYlg4?=
 =?utf-8?B?WERYS0o4WjY0UEhJVnkzV2RnSFBHQ2NNZEVoNXAzaDVpbnBIZTl3dDRleGds?=
 =?utf-8?B?dGJ3VzVZVUcyRzBuekRGaXpOYjB0OEJjZkZyWjV2M3NHdnlEdmF5NGMyNnZk?=
 =?utf-8?B?ZkF3UjI3K045eHpQRkFETHY1UmZBZHR6K1ErVVlFUVA4d0FvT2NkZjUrZ3hn?=
 =?utf-8?B?UGtLRW04bzk2Uit1TGY5RVNtY1dqT1dtS0N1aEtqM2doVnRMSnV5MXJ4ZGVl?=
 =?utf-8?B?VXhOZERCMWFaSjZFTXB3Y1Q3WXUrQlJDcnVNbCtQZmZKTzdiREM4ZzF1QzBu?=
 =?utf-8?B?L0V3N0tIdjROU0U0UDgxc3lhMGtDSDFTNzB0eTZXTm14YnRScWV1L0FIWW5G?=
 =?utf-8?B?Q1dJRU5qQnk4ZTlZRWFIUjZ5aS9CeWxkUmdXYkduR1B2L1JpcldoV2drZWhz?=
 =?utf-8?B?c0lDL3plc3ZNemdPTDZDRkFxSytRbzdUeDFxaWl2SitxSDlka2dQZUIrdkUw?=
 =?utf-8?B?QWZrSUk5VkpDYVZ6WHgxbTViWC9pQUd5TE5EQUw5WW9EN1Aya0VzNzExenpX?=
 =?utf-8?B?OUExdWUwSURoL0hPeC9sOXlkOVIyenNOMGp0YU11ZmZ4N3RCWmZvcTdJekdY?=
 =?utf-8?B?Wm9Pd3FrRjg1dkJVdVhRNWU2eTViazlhRTJrN1MzWEQ1TXFnV0VNNHd0bjZI?=
 =?utf-8?B?QXhsTWFEcExKWTZLdWdvTjMwMngxZWpFaFRhUXFYNUNvOHZSaStKUUpXU09H?=
 =?utf-8?B?dUIzYjJWbHNVdHVzaDZJN1hHYjR5b2h5YmQyc0hJSEc0RytyL1ZxeHR1a3ox?=
 =?utf-8?B?emJUTU40djNQMkM0K25kZ05lR3hNZ1REc00wMmUySEc0b1RXdHM0c09tUU1I?=
 =?utf-8?B?OFFBSG83cVAvdWhNTmQ2eEZkWDB5Y3VHbHZ5U1NuQnJLa2xNUzd0MTFVZkZE?=
 =?utf-8?B?UG8vcFBOTUNyVEp0c216dEVLRUdFZ3c3WWp6RlF2RTBQSFBiNFdaWVpycENr?=
 =?utf-8?Q?YtDyCSUvI1gEx4bM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cc85ca-09b3-4f54-60df-08df0c974b5a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 04:20:05.5565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8P1HGABZoz0XW0IV/35Jz0zNchuvDeQ7yFPws6hCSifChErxdNqjoDmT5xPmE5JGMYySCkI0HeSgIJLO5EgOqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287

On 9/6/26 8:13 PM, Alexandre Courbot wrote:
> On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
> <...>
> I was contemplating merging this patch early as it is a reasonable
> change on its own, but unfortunately these two introduced (and unused
> for now) members prevent me from doing so. They are also not related to
> moving the Radix3 code around. Can you introduce them when they are
> actually used?

Sure.

> 
> This would allow me to merge this one and patch 6 (which btw is
> strangely not placed right after this one, with unrelated changes in
> between) early and lighten the series a bit.
> 
> I think patch 11 can also go in early, but I refrained from picking it
> up now to spare you a conflict upon rebasing this series. Ideally this
> one would also have been at the beginning of the series.

Don't worry about conflicts, because lately I can resolve those pretty
much automatically, with today's tools.

Should I sent a separate 2-patch series, with this patch merged in with
patch 6, and patch 11, then? I also would like this series to be
shorter, of course.


thanks,
-- 
John Hubbard

