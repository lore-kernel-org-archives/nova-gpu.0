Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732603451B5;
	Thu,  3 Sep 2026 03:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407762; cv=fail; b=f0j0uRGpMjNf6nDEsbhMP1LTAExVe+g++j8hYbIGmi9ly13DwVm13YyMiQH4uUCSPQ8XUFv9w+Ziaob+oM+l6aNRfl9bvAFNNEXOPPRI1mmbmtLdSqlq2a+8jC2EutiCsC8mH4L18Zlf5y66iffNKV4lHgbmkfiHD6tTZHQk0Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407762; c=relaxed/simple;
	bh=7DNyb34i93R3VYquS0S07R04TQfQqzDjqqIK0MslFsE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LIcTJfXkc4l4r8Lu8gUW5LWBTzh4dwhY7HiV3s23/8wn3J3ZJeGTtH6rqdl5H1kZRq/nnGLqO7ePRy8knMWD7cB2ThuCE7sxbhekQCrEPa3sQ9NTz9Mz3du/YRMEiDbH+v3PLUiXwm9gw8IwEvjJRhlkDqbkMOcJb5m1v6hEChA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ixR/qQsh; arc=fail smtp.client-ip=40.107.200.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ixR/qQsh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGBAN9Wqus3hCtUIVH3sH74ercd608XkVRtVPHdl+NHiKhX1zC+KrjVVgvD/DmIzOQnEB+hnC5de7JiyQELqld0yYduFyJstvt+7HJUoGM2aBHvHLDKBcYStKGkFNICOhG6pkD5fzdyzzj9PRdV6L/UnoL4F0G83Nm+m5At8zeOt3AW6T86zcAJ0G9y3qOacZPdCr6SnJeTFZ1mrPGuqCJwexIch6ERNc+NR1+TNH0NhmS7UnrN0squufmfY9pDH4PLk1NFQpPRUZc9mOVsFFO+X1BAryTuiKhWD50OKBCWPUNhra39IlLqIxCEjpCp8dVdxODg7rZK0IeGhsogMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1vOireDPPUV+ovBF5BfbBNvTxC2iVcRHGHYAWaiRDg=;
 b=j+VpgBEfK6A7AsThGbHhVEUMJCLhwTDQOLznfIfXKHc5C5BfnAbuqKOJbKssi/u6/dveuJMZ22w7bUeepl8KOazmGm38SdBV0wV6R1GWuOVi4OThCYxPqPtY/pu2si7QK7pfhPBFSFT4FkZRq2NX54S+BvAw9b24aD1wUO3xcKks3Du551cfjscf5ztxdyVBVnxhFANEDY5W15VxclWid/OuzdGMw50e5ZWWmbRYzVFYEaSF2bWWgwKTPQM8vpmyfwiOwnu0yPnxiu/N59aP/AmFMqWQSy+3VmFSlEwF0Ut1BaI2wkiF0hdVXJ7aLmzJwSYvbNXPXTYHOaCHTY39rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1vOireDPPUV+ovBF5BfbBNvTxC2iVcRHGHYAWaiRDg=;
 b=ixR/qQshI7pNaLUaRLs+TVecrRvt1IejCx9b4MnhKwBWLTv7Nf19f5caVH9/2aVExPMX6k7qdEYRewk6G7OP25S5LCAOHNjumQdoQnmLuFy0qC9ZTD4ykrbc5Cc4yAzPlTqUBoie2+amXnR2/hBqKTTN4bQfWOFaCgbmBeyndkPZbsb7M/n2yWAc5B/TW7Rk+ZAZsJjgGAL6OaairYrdnkjrrepYALarlOi5eg4UTKbFc16H15xl2ODM9tshnHPG8Ucz/kN5i356rhWIZIJAh3brL9T6OXI0F6sHQ5Fk0lo8IhL2yRx7lz5OBXG/vwj/KyArkeRLMCuQ0HSajR56Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:55:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:55:57 +0000
Message-ID: <3c3a96a2-4eda-4335-9388-0b35ea5ecd5d@nvidia.com>
Date: Wed, 2 Sep 2026 20:55:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the SWGEN0
 interrupt
To: sashiko-reviews@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Benno Lossin <lossin@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Timur Tabi <ttabi@nvidia.com>, Will Pierce <wpierce@nvidia.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Trevor Gross <tmgross@umich.edu>,
 Gary Guo <gary@garyguo.net>, nova-gpu@lists.linux.dev,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-13-jhubbard@nvidia.com>
 <20260903032815.6BDA71F000E9@smtp.kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260903032815.6BDA71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9b3ed8-67af-4a7b-cc2e-08df096f424d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xVAN8NHY0hzBojjOYjYCrPh3gHcqKlUKmWC+WfL6zxK3WxzvxB5qQHYTMfaTWAPovIejB2UuJCqpQfLiZX8cXjGAcjf1UTt8WbKcT8shlt9NfgzhfgbYnfNE8+Xh6aEK+8qOs6AWufR9RepsrflTcK/P0cBJ/tPozw4ZZIZ2b20wjjIivceGfpTuzzSHEcme/YBxtNzLSSqlrm1xTJPFbBA4L2h2XQI9InkU2Zd0/sR+xXBfsvJDb+P5ejZ5SZVc2ApEwRzC+U/mfWoOTteR+GhegLe4fWZfMnbps1iOq+xgI5tBXsRJzjr1IoxSeQNmO1L6zxjMyZu74gGABVvqDVDIrhAQptob+BkTG4gwXeKeZP1JC4HtLmTnOh3KO53AquI8XixOOos9vL7rkFM8q1bl+eWKpeAocN+hQ5TMuZH1K1K3RjvKOUHa5IdokNdXQqHgAkYkBs3j/ZdEYBXKHO+mMaZTBdYD6SSCzmIqrIE1dW5tcBIkk5QpqMiZBZzhyGMXLyxPQA7UvC00EIe/NqDRMgEEoxflMrqtYe843IxJ2GV11JlkysZfZDPJIMjFErTdwtqltweZp+cPXgFFaMKXfjhZpaTL7+G58JvFtxplw9vwjLBR35v0cVxJ1AahIfuXsHowh9yflSqGOORbbbjzBtWBC+f4Rc+q1LjJTG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0FpZHhYbFV6UE5DZjBvRDQwM2o0RzRpYjlmaWVtZ0h1TDBOL2JYUkFoT0Zj?=
 =?utf-8?B?YklRTnAydlBxY2ZtRUJkNU1nbHByTW1aTFJIbzlNQ0tMYXFPZXlndzU5NFQv?=
 =?utf-8?B?UEFkeDBOQkthWWhWczNxWXovZVllSzRmNG5Eb2ErenFGR0tuL1p4SlpxR1JP?=
 =?utf-8?B?MDQ0cituWGREQURLQmVqQVJsN0dqc3AxeVpjMFR1aXIvMWJtQWxxY2tKdThz?=
 =?utf-8?B?NXBYeWttWTZZbFUyTU9RQTJJYmNWVnF4emhFcDYwc2hCTHJMbFFyYjdMSm9W?=
 =?utf-8?B?LzVxaHhrdHQvNGdIZ1V1eDFOUlpobVJlcmZmSFRHL1dEQUdmdGdlaHFQa3lI?=
 =?utf-8?B?aDNVUTBpekV5QjZsN2UxekF0K1dIQWJGdHAwWGVmTXg2cnRveUI1aUZNazNh?=
 =?utf-8?B?WXp3cEZZV1lnODVXZWFFRXhJeU12TUlLOW1RcEJwK0tNaFY4dHdROEJaV3Zo?=
 =?utf-8?B?RHQ4Rmw0cVZsRnlSRTJjV04rWUI3UlEwYjVVMTVNdElodHB1aUsrZHFjbTNs?=
 =?utf-8?B?ZjNTaFFWQ1dTYzJQcDlXWGZheC8va3g2VVczdlZseEx2OXNXdGpnS3V4cFBP?=
 =?utf-8?B?cTZMTEZkU0ZyRWhQQ0M3dGxjMlZoZDEvUlZ3U09IbjhMYS9KVVpDNHQwSHV3?=
 =?utf-8?B?N2FzVHcyZ09BQXpjeWo0enFTcGhYSjkzK1U5MkFSQldBRGtBWmV0Sms2Z3Yr?=
 =?utf-8?B?Rkd4TGROWU5TbXh4WkJYbzNvU1BrWjBjODJvdG5yNHcvV1BnZHM2MCtVWEdP?=
 =?utf-8?B?d0dJYTJ6eENjZmxNY3RzYzk0OWxac21wSG94Q2lITnNzaTBNRUlVSjNXQ3dJ?=
 =?utf-8?B?bGg5MEh5cmZMQ3k3NGF6Z0JZOEh5TW1qMDdmdEE0RUxXc1VvR2p3aGxJZTRG?=
 =?utf-8?B?WGFyT0g5NzFNMUpaeEdORFo5R1B5L0lBcnVpRVB2QnlFSWNBM245TWVKOCtB?=
 =?utf-8?B?N3A1T01ITElWRm9TdklCUnFLMi9YOEdTeGZralNDa0JQMFZodzE1WU90LzAz?=
 =?utf-8?B?NnRXMDVnSlJwT1E3NkhIZ2hUWCtzYTJIbEZvTUlWbU1QQUZyVU80VThRWHFG?=
 =?utf-8?B?YUU5TUZha0RFakFOdE5RUVlUOWJYdE9EUUkvZzJsdHE2a0ppQmF0NW9OK2p2?=
 =?utf-8?B?MkdlZElJUXVobjFZdHNuQ3YyTytmMmk2QUVnVzMyRGlWenhPelBraHduaW13?=
 =?utf-8?B?UFc3RDBYaWZjRWw3aGp5bU5ndHZ0Ly9sbUltMGs0d0dvVFhqb3lJS0dGRUVl?=
 =?utf-8?B?S0QxODJrMFliWlpZRkZ5Zm5Sa1pqWW5PVlJLQUliazg2Qk92cHRyb3ova29B?=
 =?utf-8?B?RHFBVSt6cVNVWmp5RW9SeUdMOExwamJrR0R4MEJkcTBmMGZBdnhlaUZZZnpJ?=
 =?utf-8?B?S1JDWXBSbGFLd3kzMXlhM2tmZXVkdlN1alpRdHUvcEl3ZnlXcDllcHpyT1Nz?=
 =?utf-8?B?emhrSkVwQzMrYlhFR1BJWW5qdlNqNkN5ekRPZWdYUFYrNXhSSmxlTlRRZUNs?=
 =?utf-8?B?Q2pIbnhlUE4rcUo2THVvZUtqSXp5UHBNV2g5Q01QU0NiZ01NUnptdG5uVDBx?=
 =?utf-8?B?Q2s3em1HSmF5clNBQVk3OUQ4ZkhVejZNbW1BVC8ySFJCRm52L2swYnRRVmVh?=
 =?utf-8?B?djQvRTdEWEtrUDVacXROaTF4N1o5YUdGeTZjMlFDTk1tb28vSXdHOXljTmxV?=
 =?utf-8?B?dTAraW1zOEhPRGpuWkppWC85cElSeGZHL1N2RzBTT0dsa1MvQkJ2Qk4wUlhW?=
 =?utf-8?B?aVkycVcxV0FoK0hGU1pVRTBFOVdEQ3dRNitDTW9yenc1UVVySE9CVHlqMXRs?=
 =?utf-8?B?aDBEM3pwTlM5S2NTdnpFTktWWVV6UHh5ak92eWdURGdxT0ZBVUJuWlhHTEw0?=
 =?utf-8?B?MzlaRXE1QjBOL09SUXR0a214RytpcVJicjFsdk5PR2JNMForbFRDSExXTFds?=
 =?utf-8?B?VC96ck1vYzJuQWw3aUZkM1U4MnlIRjR6elhFcU9LTjlzcjNzRjI1MDl4ZlNT?=
 =?utf-8?B?eFMwRmxYT2ViVGUxWkM3STh2L1ZsMVJRbEI5bUwwSVBFKzNRdGpRMnVHODBN?=
 =?utf-8?B?QjVaaTdOd3dWWlFGZytBTXFmYTlodTlXNWtPa1pQKzVkSFpLbkc1TjkyRCth?=
 =?utf-8?B?Wm5TYkZXcStzc0VDbzFuQTN6SjNvb0dXTzVtZ1VXVjNKMjY0NFIvdis4ZXJa?=
 =?utf-8?B?TUdJVW5pRXJrU2wwRmQxZ1ZyeCtLYzExUmU0QUdEbjgyZXFUTDd5RG5BbXRT?=
 =?utf-8?B?N2hFaktKckRuUEV2OGdhWVBpU2FzVCt5VVc3VXJtaUpiUjU0VjhNVDZQZ3hI?=
 =?utf-8?B?dExNb01kTGxtb3RZZDdXcCtvK2tvVGRHWUdnNEowcUVhaTdHekJYQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9b3ed8-67af-4a7b-cc2e-08df096f424d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:55:56.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+cumvwa5cLrYhdok6UdtKo7aOvsD2BDTFkPebxpCU/9RC01cmtIztAPx7pF9sjRJK+EiEc/yXy+WjoQsomj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654

On 9/2/26 8:28 PM, sashiko-bot@kernel.org wrote:
...

> [Severity: High]
> Does this lead to an interrupt storm if the GSP remains in a fault state like a
> HALT or WDT timeout?

Well, maybe. I can't rule this out at first reading, anyway. I'll take
a closer look.

> 
> If there is no recovery path to reset the GSP, wouldn't the unserviceable
> interrupt immediately re-latch after GspFalcon::clear_intr() is called?
> 
> The subsequent calls to GspFalcon::retrigger_intr() and self.tree.rearm_pci_irq()
> would then force a new edge to the GIN tree and re-enable PCI delivery,
> potentially trapping the CPU in an endless loop servicing the same unserviceable
> interrupt.
> 
> Could the GIN leaf source be disabled here instead when encountering an
> unrecoverable fault?
> 

thanks,
-- 
John Hubbard

