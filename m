Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FF345CAA
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138623; cv=fail; b=WQj0f9NDt5prbsIary6Xbm+5TXYNU2YiFrnyNciXQP6A/EXLFhaxbyzHa7MyzAM5qxW/9HbO2fuMwkBch4zaovwLQiMkfB+yfm2oWFFufsREeiakgPS4Ne9bza4lG0XvbKfiNpxcY+0CEebIl/aFYFn+Yt29IMyC4Heh3zHGbe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138623; c=relaxed/simple;
	bh=Nep03Rtkl4oQHGNvFTk+BtJWEWKPCvPvAl0VSWgTFBg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XjdOmdFnbztP6ZE0xVjc+0XaG9eFWCKkQLRM4S43KrRHDU+juY91Ra2zyfuu+3F4z8wos0/5xff3JIxDqL/yILwKP+M5jW5V98DydRUUzrnQp/kx0eA1ciC1ZK3MQWB+AkEz+D1o02PHNg19D+z6Ldq3OwTTulvOSqKbQh0akWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f1/Ex9Bc; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f1/Ex9Bc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAVjzgRkpJOhjTlB9hwyJLP8ZxDHIH+NY9JgVnPEE1LTqoGVxRhjEp9g5iFf9VCBP25EFZ4uNyIgJ0+EuTZo1Ox6TUM9MQYIWEjX+s5ENQ4kGlPMHmWBHoBQJHu94HZSIVxQ8ozjrnFz3Zklgt4+ecyNmtQqNm+QJZ0a/VQyMDfuobPmrrpfL1g+qJjie8j3kHT5IbhjVn/MKeZgsicgnplf7INAeLj7W31PX6185+FUVgUSp4AfmmHvnbNj/MNVMOvBDDurmlPRl0/mpK5ymjzQpT4R8wzm3OXouhQI8GLeC8uP6GmgaV2h4tLQKAXRT6JT6EF3HDfXKHhkjWUXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nep03Rtkl4oQHGNvFTk+BtJWEWKPCvPvAl0VSWgTFBg=;
 b=rY/eQ56eYyNmMGPbYpQKAa86Yh2l/ntsLYLbM4rvxqLFKQSHgV7Nkpo33dyL3HefRGPYXRLGvxTOAHkOSlmxc2seIazziqBoPjC1seDj8BGNkz3qu5BxYxbeDtxDfzpvuBp5znbY4IZ98rlh1XYQJjuu2lWCcsf7R4/5sW8T00qorUKIauor3MeFo686vbawFnr8mP4LTZxyprpo2WwMZFOaFXW2WCMToU+1PidcKXoANwqdVqPnFpacneE//BCNQ8SHUFAPT6heP/VkPwJUQCAGvSS3HfNm9HW5eBAK3N9ObowNW8aGU/N29WMlxt9rYtu07ByPTQf2qNhoSGdUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nep03Rtkl4oQHGNvFTk+BtJWEWKPCvPvAl0VSWgTFBg=;
 b=f1/Ex9BcRxpROHMHZDCmA+VbtKuMO3uokW6m5bK/TEKJQdeb7Mp6P/WxQgJKUFWF2hjQEj3s8GOAroVbYgZtSDgbxskeeR824kdlcwvIOmVbNnJYVJEJgTGxlm/z+oQqSr2Rkmn5hJAjJymFp1zgVKbqbKupIYI+UwddjI0drHbaedGUQjH6P0OKRdgeGdG6Cp3v853yNi6I5K4JPdEJWs/ma1vBpmFWyOVB1TkK30O8aoFDirEO63DjKOTTeJgFpx8IC0WfwWRew4YlOfUik2xjFboDBWxmIzKAb6nz+OQY+YdeJ/rxGbHlUskL8VsD/SDyuxCYx/XbMvPKzBTtmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 31 Aug
 2026 01:10:17 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:10:16 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:10:13 +0900
Message-Id: <DL2Q8IITGG0A.OPFPUGO6GY04@nvidia.com>
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
Subject: Re: [PATCH v2 01/15] rust: pci: declare IrqType and IrqTypes with
 impl_flags
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829012243.496697-2-jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-2-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:604:222::10) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 358f24c3-bce3-4eb9-c174-08df06fc9e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|11063799006|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	u/RkQAmaXegSlo/at50DhPliNRjpp0++GWmFyYFvKy+28zZUWMTvfXuk8wtFuegkBNNa8GsfzKdbzNtL2MY4xRl1Uofped/FmYkDGGul6VUAd2A3VsLPljt9cp8s7DwYM7Kf6gD1Zn6/OlmtEN5GGXJ9n0l1MpYkqEYxSKBhcnLbbUyh7P4qS8YY4k/HEyrlveSZDr52iuYXhwDX4S5vCbqcdMEqAk219a5S0dQSvFSELeCjvti1BDCYbAQmuMVkJM/mCm7/RqG+TtEQV54wc3GDKaJupUAhegOUthENtlVl+6cU7Of9nSBNaiY4FPMf3RSuCfbriZEGveA9+mkxNn66YO1lOYbJW5ppa0sXK3weCxuHZnEEb6u9VeZJiaw3hyyceLBfJQLCb4QjIt3JdnDZwtveWRaXYGLU5s54ifIzuRaszZo5myTQwIdkKRu1wGfBzpJzOwPLpc4XUmXBDN2+WGs34jHd4tmG8RVT0gyeG4GhpMsHT3OKUOsc1IDNizZWccA/vWtUsAfxZzlq1SDdnJpNXCm1Zd9EEiDfCRsTZRPqeGlR+LDv8z/xwBs+sl1izWb46CX3aNTq5KXZhZrNPUDOJdu9a65Lya4dmoKrSukf9cGWNYKR2OzYFGwzFzxQ27Olf/2A6T3oKRGz+MG+lbQ9O9b14H98KeFVFos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEg1emVZY3R1QitkU0Nadk1BWnZHVE5mdlNmOUdGRWpHODZwZkFmaHpXQXR6?=
 =?utf-8?B?K0JaanEzSWdWckFQa2oxV29JSWxrcDdmN2hTaUpxd2hFUlBMMCtTSG9od0xI?=
 =?utf-8?B?WmdHN2g0RkFXVVk4eGljdzd3NkhoVmsxUjBXR1YrM1RKVHQyOVVnQ1l5ZFhH?=
 =?utf-8?B?aGtISlhoMGN4c0VhdncxMUl2ekJnbDdWZ3QwU0JJaWJ0cXRQOTNST0wrMVlj?=
 =?utf-8?B?Q29JZkpTWTRSVDNLamJYN1l5ZjJxUXlSM1dLQ05CVWovSnpUODlhTzdMMTZ1?=
 =?utf-8?B?bDhXeGJzckljSUQ1T1ZjSmV3NUhPeExqT2xCaHVzb2lGSVNtM0ZZRkMyMjRx?=
 =?utf-8?B?Mngzdk91anR4QkdDa2RRODlEc1JIVW1McDlXUFZqZzEyOXNrL3FDaDVtcU85?=
 =?utf-8?B?Uys1OWk1RG9LR0lHREpCcWpvRVE3V3hqV093SklRSmZnYkI1ZThVOHJFRGhq?=
 =?utf-8?B?VVFuOUlsSnJ4ZExOU3JvY2VmVXJhOThRQmV5aVhGQ05hSTY0Z3RYUHVKK0k4?=
 =?utf-8?B?Mzc4TWpBWnhMOEVXQkQyYnVTQ0ZBOVBvRkFKWmdmS0pkRHJLUU1DMzUwM1R3?=
 =?utf-8?B?S1plSktIeUI4dEtpdzZtNEVJaFVWQ0tWSkVMdmNuY0lLN1FuZGxONE0xRUlL?=
 =?utf-8?B?QlU5SU9wRHYzU2pmVW5Qb0VLVEdwUDdsL3A4WmwxYngyUXpxM2doWXhHeS9s?=
 =?utf-8?B?RnUrUlpvNGhkQUdPTHNIUTNVUS9WUnFtWXhxcWp5VXR4THdpOTgwL0U2UlFX?=
 =?utf-8?B?bDdlQ3p2eE92eGFDQzk4TWt1SGpKM0YrSUFXaUNQUjBjMDVGMDk1bzhIelRT?=
 =?utf-8?B?eDc0UnZwdkw2UHBkcHBad2lyK1hKYVJ5NHZpekpiUFhOcGNkSG8wNGV3L0dW?=
 =?utf-8?B?VnhPVDg5Y1pyMWtjTVNKeGJuV3N4Z2oyL1JOQU80UGNjNWVucTJnNVo2ZlIx?=
 =?utf-8?B?aW43TGhtWHMwWXFJZDNpN1BTSVo2TWhmSDY4RmluOXJ1OHE4elJ0Mm9NWVVy?=
 =?utf-8?B?dy9iWG9mUXYzbjE4NTJIWHBmNXhydzk1aHEvZStxQ1hXT1d0ZUU4T2R1NUxT?=
 =?utf-8?B?RFJjUTExWG9GR1FuOHd6S0dxdVJJVkIwQ0dReENmQmI0UU5qQVNBN3NSWjhT?=
 =?utf-8?B?eGE4a3ZSMkhzeUJjc3I3Sm5RMnVaVlpDdXJhSW1lUytsT1lmWjBSeFJ4S1Y2?=
 =?utf-8?B?V2g0MXZ5cFhwYnVmZFVYLzc3WlFCczRpUDVmd0M2cHJjL1dFcVJrcnRyZjBh?=
 =?utf-8?B?OHliZmpZTncvSjJhdzIydnVoQVhBZ0t5T0U4aXJYcHVyS1NrV0tNRGEzU01m?=
 =?utf-8?B?aWs2UE1WeUJFTWoxUWhNYWJmc3A5ZDM0QmZ6NUltdkJJUjIwWllUY1BJa3Ns?=
 =?utf-8?B?Z0k2UzJGTVd2cXdyckJXbzB1YzJBQmpEcVZNS1VrVi9MbmcrY2MxbjhqZ0VV?=
 =?utf-8?B?TW9kSlhmL2xZa0NET2hHNlFjMG5NeWZSU1dUMWlidTB3anJCNVJQTW1rcXBD?=
 =?utf-8?B?aHlBcHl1bndFN0FTTmJWN0pGNEJnS2VxKzBKeFdlL1pNSU9vWngwVUVuVGZY?=
 =?utf-8?B?eWorK0VCVzN1M09VUUhVQWhwL0VwMjdiT2VlMllIcUd6bWdzMUdmZVNtamZt?=
 =?utf-8?B?ZnpFaExJK05vVWNBUWYvODYzUFlsSzZReEtsM01oSUpYc3dEajBIS0JrSE9t?=
 =?utf-8?B?enB6MkFCNjh6N0Mxb3lpZ05sTTNMNm1zR0xMS2hvSmg0QTZ4MC9wVTM0L1VS?=
 =?utf-8?B?dUJiejQ0b3UrdkdqR3FpdkFQY0MxMHZTYzdRNDBYVG8vVGJHM0pFMTY1bi9Q?=
 =?utf-8?B?ODI0OU9NOVVVWFA2K0MxZGgwN21ERVZ6ZWFHdEpaYVh0ZzloZGxrajNKQXJN?=
 =?utf-8?B?U045ZEZ5dFpQSndhUXYvNGNHZEM5MWd6dWRoL1FYbG83QUVUdnNsRFpVdkxC?=
 =?utf-8?B?cjlqczllU0xXa01FbE9IaHhPRnl4aC8vdG5wdDNXM0tTeURHNzExSWJaMHZD?=
 =?utf-8?B?OHBmd2pnMzJHZWEwai9OR3dORGl4MTFOSjVZOW94NWVWSStaQzBqYzNSdnpS?=
 =?utf-8?B?U2NOUS9oOC9jRGZOTDZkQUtOb2F3NSszbmdGRnhOZjRaL01Sb0lxMno4d0Jh?=
 =?utf-8?B?dTF0RTIrOGdYcUhMS0dVT2tGcmNhRXV3VkxvM2dlSkpEeUliaTNZdmF6SjJw?=
 =?utf-8?B?cVBNcitmVVhiQkhNekFKNGtpR3hoZE5LOTJTbVlqTGduUVFPa09ZYmliUU5T?=
 =?utf-8?B?S0NtazJPMHg5bE95RC9YOGdrNVNCNU9XN2hKaHkyd3lLYTRhKzdXRG5ibnRk?=
 =?utf-8?B?YkJ6ZDg5Nmd0clB2NVpXVDg1U1pNQlFIbkJLWHM3SGZ2SGFockNjMWd5YzZL?=
 =?utf-8?Q?ANvFI+GRDCe0wj85aywy3hJ6a5wLtw6YsA5Jq1OSq83id?=
X-MS-Exchange-AntiSpam-MessageData-1: wG7bjnxqWz/FIQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358f24c3-bce3-4eb9-c174-08df06fc9e15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:10:16.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INF/UKKZ3UlMQvDUnh1n5x0vB/O2DG9QX9GOVq/SrgAuwdZXUNhTngFtq1PM8Am3qLfdTjEcxm0rZPnyVJf4sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Sat Aug 29, 2026 at 10:22 AM JST, John Hubbard wrote:
> The kernel provides impl_flags! for declaring a bitmask type alongside
> the enum of its individual flags, generating the bit operators and the
> containment queries.
>
> IrqTypes open-coded that pattern with a with() builder, so a caller
> naming two interrupt types chained two calls onto IrqTypes::default().
>
> Declare both types through impl_flags!, so the same set reads as
> IrqType::Msi | IrqType::MsiX.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Much better indeed.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
