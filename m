Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835630566B
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973998; cv=fail; b=CfzTt3H/8UyqSVS+pd177XkiXDxVYoiaxaavVkShE4mh7q7LP3GXbpgdAKWvEmXquAi9ZifUzHU2MrDJQhEkeoSjo1MQu8IeQabkHB91p/UUMpTqtfg5Xe59M3FbHIAAU0C3m+hK493OmuIKOXORCfcWIL0v8TqJpH/2nzyYED8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973998; c=relaxed/simple;
	bh=MdXQy1FHr0XUH1f5dgaSGmNdjURGexPWjeQMEzk8yuI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=J8zISHC8gQgs0wIohPOAm+Dp8r/9bIGIfbEVU7MUL6Yya0StaYghfgQGbdBjt5jVylrKWFeTc/y8QVYJOxM5vumEcdPzAFFu0kNNwLyTc9VDDOmoHmonSxRagRQEU4bAzrDgT60i/ZpuhgN3XIqJ0CHu3u35BeshZky72OW/C00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QhZidp1C; arc=fail smtp.client-ip=52.101.193.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QhZidp1C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yID8ercN2tazVlzqUjgKSGrbp7YaUWuHV3iTpD2UWqA6KYan/nfBmXiGX9fjS6YfLiW4sSDSzYLavRD7wfslbgbRVQswvo0tgfTzo6biFpBJoWxtGyFPbNhlXeDG5rPgy5QjBql2BgK1u5opb5aHFBFxsfyHA7JHNMC1zkVqHgMFxVvEism56FP3veQii2VfQb1d6hk7tjqgyqe7RvNijPl8Cx+IPhD80cHCHUt7V7a2C6Iw4tDIWMJ2QkrFj8brfdym1GLDG+I5Nl3y+6prsqayw88A++De+czSjj7P6wadmQmH44Bi7qJ8cXQ/b0RLRQC6V8PKXjHuXYEMwMbpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdXQy1FHr0XUH1f5dgaSGmNdjURGexPWjeQMEzk8yuI=;
 b=oyvrfrBQG/zG0ZD19TpxsTNXX4j9raaOC62tX2JRTRbfRKCLxB/L2l9aOeoSG43AhywolAHfh+graz1u9rVitFw5ibA5yRqOrxToB8QdAHnKYOB5G/ckvMCJqK5ma8/4IAyh1423lopgHIpAlfdVUisuaMymKUVPN4kG61yb3rCSf2D3j87t6HHoDIKbKVEhAINGRYbs0VZdPqDFICqAqckN8XocQQBGblwXAa0Xgrhy3oFOWWn6D8NOp7uT7OqWJKPoMs5N+WsOP1km4aBo4Nlc/fs/DidnE6wHKZu/XJcqBa9HTJLMpi1yE93iuYWTO44ixDOPkC923HpLGtfxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdXQy1FHr0XUH1f5dgaSGmNdjURGexPWjeQMEzk8yuI=;
 b=QhZidp1Cf7x9eAgZvTpY2/UL/NbCYQTEzZ6F0yJ1Pq51Ry9FCC8xdIeNdlYBYyBYrTRKBH3g8p7Fx4FKKzNUmLlKTR3rK8o7wSyQ0hgVYsflfJzs8p+S9mcqDg2II0VKoJhUA+KxqXtpI8n+unACJQzV044CoK+dmb94ZL4qBZXHUKHjBvgTjq5dxoZi/bcegnfwnermQ1GPfpPJEfywk7I/zMmYsoUisU1NUgjFJp9f5GU2XADoraPbftiw2GdGFAygPJhxm6Cm424MsIiOshvd3hm3tUojuUXftOoDBOYUUokBlGkHeiFWpFCEbG8VBBkkRUKmJ4BuzNbAo4qOBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN0PR12MB6103.namprd12.prod.outlook.com (2603:10b6:208:3c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 21 Sep
 2026 06:59:53 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:59:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:59:49 +0900
Message-Id: <DLKSTMX3I4PH.ML71EOUJTXP1@nvidia.com>
Subject: Re: [PATCH v4 00/17] nova-core: GPU interrupt support and GSP event
 delivery
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
References: <20260912044400.677097-1-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN0PR12MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 442e7afe-77bd-4063-923a-08df17adefac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|10070799003|376014|1800799024|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zGf+I/WNRD4a8Uuw088OWW5qCByKQRIewWsrcFqfQ3ifhVkfCFWah7XNu56wi1KCyQy8XcHDWi/pDw52WR4P7qpNsGrbThRBSByxTtx7Ojs44aDn9CoaXpVpgGBMu1NeRQp5C5q4XEDc46m8v//aZGQ5vORnzeaCwdNQS25VWsy4cQVLTyssMqJm5ZXAPXez1jU2F7kxZH+pLd3j8gKvcgdhCINCQmMaPvXt0mljfukY7SApIWZdEo80VMbNuzdi+yofJIW/zB0XxV/5CWtqKTCSEbDh2xdRMlnjyDeeZdRGmvEBFi12Jd3gSaFlpTUDv41aIlXRb5LFmPOAC83RZExFMKHEU3450vTaHKMzwljikHopeoNp01Xlb4k6BRv2yvnMsu6vEM1tTowTYHo2Az7mHxjvDOsV1LQUUzZWVJWen6M94uoRd3BP01sw7xQoJSyiUJM8s+/mIMiATbMl7r1wrEx2wTjli/5xphSFsj8ql7vCGmIfoeBM+yMA+7i91rzOZUVdeYCmYQucA5d0kHzXbv5DedlpqIwhx39lEaCRNYtvkhk2UeLfmKndZb6GEB7yBIrQydBlztamXgIyp6eduJkfs9QTsY9qRGpCG1A/vxwFWYMAd+Dh9SFQ6cEydilsqEF9BpmYAZLkblvlLHQH0qAIayp2lJggrl/26AY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(10070799003)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFZVVmFQclVMZzNvaHQ1cjNpeDFrVENiVTBrVzh2bFFPTGpSaE5nOUNFK2p1?=
 =?utf-8?B?ZXNackFpd0pOenZkR3FUZHJUdWJSenV0ZllOc0FxQitjV29sSmlxNXR2K3pP?=
 =?utf-8?B?SlZ4VUhLeDZvSmMwN2ZWOEtENmk2SG1RRklEQVNKYTNSQmNDV2cvbWhPKzVn?=
 =?utf-8?B?TGl4dWdtQ0U3S09CMks3RFh5UkUzcGRLeHJvekJoOThSL1gycVJyTlNBUENm?=
 =?utf-8?B?Nlpsb3M1NmxKZTY3ZmNGMkhOaTFOQmhqQnJHZEl4N1A1bE9yQXB3VGJFMGNK?=
 =?utf-8?B?eXlJUFlySDFXM3R0LzlNWGNqZTlFL2hKc3hMV1lOM3hVK1YzeWhBRWZJOUNp?=
 =?utf-8?B?dXpGV1dWS3Z4dDExaHl3K3J0dVMxbHo5OTFDc1lDUXFma2tLSGgwSGFsMEFu?=
 =?utf-8?B?NnFpWGNXbm9zK2ZWeDVsNW5XVEJHNWFZMFhPMThzVC8xYUZwRTFPNlFhc054?=
 =?utf-8?B?b2l5d3dkLzZDRHdZRE1nb24vN29HKzh3VjQ5VHR6aWxMWmZ3aDVqcndZd2Vt?=
 =?utf-8?B?eE1ycHEvcHRCdDdnaHA4YWxmWW1kZUlQV2Frdis5K0RSbDZnZXdlRXFrTlkw?=
 =?utf-8?B?RTlGQWROaDN3NXF5OEM3NzlyRkxnYk1lL0Q5SGhzdENtNGU0MU92S2pKUXRQ?=
 =?utf-8?B?RGw3eE01ZXYydGtLdm5uMFMyZXpGeXNVUTJBNWpLVWR4dU5venhiVktRS24r?=
 =?utf-8?B?c0RkNEh6c0RIeEFKWHF0MW4rQUdPeTBjUDZEQzhic3pxNXpaSWFIRFFoazAw?=
 =?utf-8?B?a2diOWpPdW1PMGczcVlOVnIzbHdQS0U5bjZrQlNmc0dVeVM4blppdTlSQ0Uv?=
 =?utf-8?B?MkZnRkgrbGRmaVNCeTB1aGpVTTNEaUxDWFVSZ2wyQ0pWNmwzZ0hmSm5yUWcv?=
 =?utf-8?B?Mi9DM2orT2hKVUxYR0JBNy85YWhTRmNMQVA2WHNXc3I3RC9xdEhKTGhPb2t2?=
 =?utf-8?B?K2hGTTZ6MVhFZzAxUE83dW1TU05rbUtiN3JMQmlWNGNvdjlyaG50dFJtSXEr?=
 =?utf-8?B?cDJrSlNhMVpVOWU5QjNoclBHR3BGMDRYM000eHVXU2o0SDFOdUMrMk1nUFh5?=
 =?utf-8?B?bi92SmxhNUlnaXcxRU51Y0tsS0lyaTdxUnJYcFRLRXF3Zm9KU1RLK3JPeU9h?=
 =?utf-8?B?ZnJmbUxIcFRZWDNKWTRmSXhZOHh2dkRMVVl0WUhnNFQyTXp0RVRIZFZPTHBY?=
 =?utf-8?B?alUwMmdQcnhEQXl0azFEaU1CVzFWVFdjM3VKaTBVbTE4QWtQSFRTNFJ6a3lU?=
 =?utf-8?B?VFd0Z2FJTndIejh2QXI1WHNtTGpVVEIzWE1ia2w2ZUxnSDV0RjNLZElQSVgz?=
 =?utf-8?B?VkJnanArTnN3K2FvUHlnTWV5R0h6M0xIMUN2T0lBMlNvZ2h2R1E2RmpzMGtx?=
 =?utf-8?B?M3o2YWIveGZIdW83K05HajhaVnZUczVzdXpCaVZBUTFSVWR4UzMwTmFjWFdt?=
 =?utf-8?B?clB4UXAzcnhoQkN4bTlmYmxHTXJnYUIzQ2ZoYWlCTFdVaUY4TUFNM01HS1lm?=
 =?utf-8?B?Y09xemM0VDJhVzJYUWwyMmk2dCtFVEk1SjBsaGFub2FyNmU5WXB0ZzhZcEdU?=
 =?utf-8?B?TzEvNU5zSHBOdUpicWltdFpGb25YaWxMamFlckgwc21rQUM0MDIvdzF3Z2cv?=
 =?utf-8?B?NmZRSjNyNExRQXJ6K1ZPNkNvSFFFNXo5eVoxbHE0YXlKY0pvZVdSaDM0aDJL?=
 =?utf-8?B?YmdrUFIrQ2lQOWtpTTRMeEVQdE11WGlYMzF4Qy9TL2JQaTdZRWJ5YUdjckxn?=
 =?utf-8?B?MnBEdkw1YVdCSWxVc2pXL2VDSnZJaEdqb3JUU2VZcU54MEw1azU0VC92ZVZV?=
 =?utf-8?B?UUxvbUgwclZVV09aRUswTzRyS2ExcUwyUUFneVN2anpTSXNJT0RkL3IwYjlU?=
 =?utf-8?B?UTMyNFJ1QXhRWFhFbE85dTMxWTRMSVd0ZXB6eDdhN1IrSlozaTJ1WlNzZGdD?=
 =?utf-8?B?TmFiVWI4R0NWOXN2bTA2UktjOG1MOWRpVHlLbGtpS0s2Nktjcy9RS3ZXYU1I?=
 =?utf-8?B?aDZXbWdjbFhOTXZSTHMwNlJkT2YxbDd5QlFkSGl0NDduNERUbTRFNk5WVVRk?=
 =?utf-8?B?MWdzRHFMT0kvRUozcTdic0VucUxLNXhFeW8rK3lxejFIUzAvZGFrVVlKWTVS?=
 =?utf-8?B?alVDZFBFbHJoYlVTTE80Y0lDbVFqUDhJZVhYTWVFUjNGTjRvcWhDb0hKZ2hM?=
 =?utf-8?B?SWpvQk1SWm5JVzV4NFNsbkliVkhqWlV6SWZoMDA0dHBMRytPTllCOVhLVXg4?=
 =?utf-8?B?S043bW4zTVJyRGdodHlhVjk5Ym1UZzUwV3ZUcUkvWlZZejVxY3JFV2dhZ1B1?=
 =?utf-8?B?c3VVNERKQ2t0aDIzNE05OEhYTCtVWUVOUVN6Qzd4OUJoMmlMMkU1c1Zpbmhh?=
 =?utf-8?Q?UPFOY9dEaIAHs6EH/zjU1ybFNyQtKr2J9bgfZ+7kVsJVE?=
X-MS-Exchange-AntiSpam-MessageData-1: IG38p67J7ZA5hg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442e7afe-77bd-4063-923a-08df17adefac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:59:52.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhZPI7oM7+frUj4zQb1HWBNDveEUcCCb/wHjOP3Og9PdM86rFAlDF+wSLzW7MLyyKJfPBf+eD7F+BAyMt/S2+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6103

On Sat Sep 12, 2026 at 1:43 PM JST, John Hubbard wrote:
> This series adds support for GIN, the GPU Interrupt and Notification
> unit, which is the GPU's interrupt controller, so that GSP events reach
> the driver as interrupts rather than only when the driver polls for
> them.
>
> The handler is threaded. The top half touches only GPU registers, and
> the IRQ thread drains the GSP-to-CPU message queue.
>
> This is based on drm-rust-next at d669686f8170 ("gpu: nova-core: mm: Add
> BAR1 memory management self-tests"), which now includes the PRAMIN and
> BAR1 memory management series from Joel and Eliot. The PRAMIN series
> brought the NOVA_CORE_SELFTESTS option and the assertion macros for
> probe-time hardware tests, and the interrupt self-test uses both.

The design is... halfway there. The bottom parts look mostly ok now, but
the top types are inflexible (a hardcoded set of interrupt vectors known
at probe-time, without a realistic possibility of adding/removing
handlers dynamically), confusingly separated, still not integrated into
the command queue which keeps polling by the end of the series (with the
IRQ handler only draining messages into oblivion), and in the end with
all this machinery we realistically cannot handle more than one IRQ
anyway due to the fact that dropping a top enable guard disables all the
leaves from that subtree.

It is also becoming a bit tedious to describe the architecture through
comments and I'd rather hack the bits that need fixing directly, which
would be a much more efficient use of my time. The HAL patch still doing
ad-hoc matches on the chipset despite my v3 comments consolidates that
impression.

So my hope is that we can we move forward and merge a v5 or v6 as a MVP
for the self-tests and GSP interrupt, and I'll follow-up with the fixes
I want on top.
