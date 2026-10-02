Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D234A5EDA
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947674; cv=fail; b=qld7sXpu3xyoxY1IO9xSv1jPAkAbTAWpI/V7SJrfOl0kIgc3KEkBapMeHLUSKDDx1kP/EgTpFpqMkw8wBHpLDbSc4pVQF9RT0xM31byhUrgGcwmDRGshIOmhYfCoK8lTN1TQQxgq64ZyA/Q/BYenq8ApORYDzXL7wACXa62FUe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947674; c=relaxed/simple;
	bh=NpHjHZtUG2jee6jmSXC6GBdefaP+C4hvvR6fmPLVuxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=T9cC6Jd3mePrsD9izWO3QQf1fW92rA9vyOsdP0vv1Me1CuhtWpe4kouu7ggMxRQFSqv2CDbAsb0K++kaejpaYCw2o1NN4CxgBf314C+iXJ1QPFd3XaC4dlwXp9lFJ7Hz4/JTAcWtNGCm3tW7rpE+JZR3rMdGzJcOuaQ0fK4rZYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nrxdA8W2; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nrxdA8W2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utINlYM5LRT0SWV6ML0atvNfd0pjrOpy8UTxvnagxUIgsIwVmqB9fZFPwfIwra3+6V3oIb6JPlazNQ6MkZds/vtrHbrkI4C/mHmmnBllqx8RzhKE+JTq0czDFJ0no4AUgJKkLbCdaWXPG+lxwzKSWthTOK073wVn1nohwLMcJvrncewGmiukEphWF1hPdocESJP52qAKjve2WfeNQyNAycafw837lpq/e3CDNb5IXmYs2tvEfR7S3ujRCKlO2NFw2WU8LzSiMpVlalt6B5kc3tE79fyDNH1zSXnra+294oJXXSR9xXueZg8DqBYmjg77KIWSvYWTV56WHEDGkX1vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QLpR17xb+1F8d7mcxODk91B6KxMa95wcXsCu1jrOHg=;
 b=Hval1Ajb9mjO7riW4UQtwRmo10w9M/gz69Nl+Jvv0FbKRdyV8yoGB+UVnYhXyaHHF5pJZ3InJmeYo0ECSGR2SxFP9iLjBzsOY8OkxG6KysGizlp6mG36rRxFsukE8Y7Gq8x3MQk5jE/jx1VosRIvZcBbXNauTdxV0KaiJYmKpxvG8Ya8G12BpDS39hy3FXW7WUzKHEJpG25loM5/HrcNNL8c0co5PAbv5i7E9RS7tW3OT5N5ZAZVTgNJgw7oc706LUzo88af+rXwaEV2m2gCMv/7vfW2DNsDH5D+BnKjmOh5pT2RbnpkR50fqzaG+oa6SGhgxpK4QiOh+HokBJCFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QLpR17xb+1F8d7mcxODk91B6KxMa95wcXsCu1jrOHg=;
 b=nrxdA8W2FMQcombvLhygMVf9x5wezpEdQk3N7EwQkcKf/YGjVMn19zZZB4epV/UeH0pzAtyWPDuQkEa9SR/Xyd0Laq429Uyh/m/Q4+UyF3OP/ziNzenPDbOk4iQdSwJeuPC0LO87SkKDXvuGrc4cOCWKgsNlsqREbNFU3Fq8zv7bWmhI9ZUiz7HEcxQ5fAo56KJFHIWWPMF+eL/HJ0GPThxpvsUBIldQxLRXX86eUp8RsvwMHxhLCUEdgTt5Ss8jvM2Lc5I4HxzcKnE3F/QHBfDmGoGrljmeRsGOyEXdN59lCZNtj+mPA3glAjeahVaFh2KEee5myQrCTKQ3mTtY3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPF8CAB220A1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:27:47 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 13:27:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, Boqun Feng <boqun@kernel.org>
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
Subject: Re: [PATCH v5 00/15] nova-core: GPU interrupt support and GSP event delivery
Message-Id: <179094719475.1625745.3162628712540479011.b4-ty@b4>
Date: Fri, 02 Oct 2026 22:19:54 +0900
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPF8CAB220A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff3e6c2-f43a-440f-0fa1-08df2088f28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|23010399003|1800799024|11063799006|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hI2swubCcjxFlt/pYWttmqUWs0ssxyoXjpQVVyjF4CFLjxwyr9mpEys9x01TPkqJhy6x2IWGv//WYgm8MwK3WcCczwam5E7HAEdltuG+OG/Etjky/hfUMMDvGymvbMz1NDwihuaOU3NyjV9z5ckqhu4eahIrD/zd0FUaIkRVylWxcVNDX45PWvc94aADYKhcciGG05/E06farh1GBDlXBWyZgZoRbpLZ/8nyxxt/OJVvLmJhqWbJVjGXD3URrI2tD+ULa+StPjpbelThybGxQ4uSRAkjYlvCSG8jocEp5IubMtcMQhUx5ZZd5tj5UmAHbK5nUkFkZH8SGVM0XV7t3M6OwsSVNtkRDtpoYnCg+2tlTYf6hboBgGuQPcIJb36PfEctOyfSxfkU2cnwAGXfOZkupYusEvHnxcz5ietTKHGuy6aLTh65QkecNNCdYXs4gbNpRFrS6IXX75taztyCuN7Ij7/g4Ql9yKf69gyy2Wc0YplS1Op/H5QmX4CJbCSce2tCL49I2HhcsJjtDPu/kvwytSX1c24Zz9fYThLYHh9+cTq1ok65eAqCcdeNQ9WAbyi7xPLtLitTVmJiWvdlOESIT1vhQHJFazRhs0Qx6Lrvk9dJzuXLSkaFYFYymltnQPoqn6FXIA3fhwqAzz4FJwzKU05v/rtiur9NwhlmRMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(23010399003)(1800799024)(11063799006)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3lkYm11bHFkNnVtMHpEaEMzRnNJa2JLay9QUjhDNERMT2xoUFl4MVM4bStm?=
 =?utf-8?B?MWpKS0NHWTNuLzJVVFFuSVk2bk9pTzhvNlljTDg3cEljSlYwN1FzOTJVVTlP?=
 =?utf-8?B?SHRkRitLZUdyK1JsUFpvRCtLYnU5c1FuMjMyNithQWxyK3hWY1EydmgzbUQ1?=
 =?utf-8?B?dWJkQ3RTbUE3c2dNMHl4cUdaNko1SkozZjE5VlE5L3lnaVlPUFNwL1hmeDha?=
 =?utf-8?B?RmEzR0dLdUJTdUhTVG5ZM0JqZW9rSFV2SE4wTlppUjlQcEhEcjM4VWNVOHU5?=
 =?utf-8?B?dnBvcWgray9WZnV0Sy8zeEZsc1BsZlloUHNqUzkwRE9CZEtqcnM1Z1NjUGZD?=
 =?utf-8?B?NzBLK09MYnNnbjhmUm0vUDVEbmVNYnhqZkpkOVB6UmFIK3lFNHNid1pNZU40?=
 =?utf-8?B?MFgwWkJVZEpUNGVhMDBOcjI0SkxIcHRYSDBIN3NUUUgzeU04eGJMb201WkxE?=
 =?utf-8?B?OGtJVGc0SE1sMTVWTTVaVU10WHU2ZWNLV1JIWXVraFhkQm5WQURsc1YzbW56?=
 =?utf-8?B?clFnajZaRzBuNGRVdUtuNXFoM041aFZ6UHNFakVwRmUxV3h0OGNtOE5DM3lM?=
 =?utf-8?B?RE42OXJtazh5KzMwU0lBYzB0MW16cGJERzZ6bHI3b0xZRkVuZ21yOGR3S2JM?=
 =?utf-8?B?SFZ5OUsvbk1OWWN4ajc2WWgveSt6Ris1dVZxeW84dXF3M2I5ak9Pb0h1a09v?=
 =?utf-8?B?T2VtNXpTa2dPUStQRkFNeVFmdUcrK0FDcmlIb05mdDJxQkQwS3Y2VndMbkEw?=
 =?utf-8?B?a2w5SHJSa1VuQTZIT2V3YnpCRnZYL2x6Q1FIemM4YWIyajVUcGx2WlduYk5S?=
 =?utf-8?B?enZ6eGFvM1NiRnF0dzJRcHFtbWpsTGRiMkJsY0RzcDhBSmpNbkVZOTZOMzhi?=
 =?utf-8?B?UlhJOXl5ZUNnUDZGVlRzVzVybHoxR0dSczNJR1VNZVkrVTYzaDZJaGpCMjhn?=
 =?utf-8?B?eTBzK1BZQnVrOEE5UmVTM0NKMGJyT2xtQkZpMlQ3enFIR3JvdlNBcmR4L0Mv?=
 =?utf-8?B?T1cxYmNxTjVnVnA1M1NSZEdndFIyY1Nid2VjemxNZ3lDd205SCtzUFZRbVpS?=
 =?utf-8?B?K0IxelRRRWpuSnVGR0RGRDdsenZuMmJBRW1hTjZOellaVWJYVVBmeitIUWJL?=
 =?utf-8?B?V0NXdlhIQVJsM1NnWU1yVVdlK0dta1dQZXFVUEhyaGNQU0gvaGY2cW1pcWJU?=
 =?utf-8?B?SGtLbUJISHIvMXhRdEV4VWRjc2FjS21tQllKNmNIb2U4SFJTWnFjcVRIODlJ?=
 =?utf-8?B?ZnBoc1d0eUw5TFdRTUpnbzVQS2ZqZGw2eHRKZmIxUmtOeGRHNlpMblZUcXRk?=
 =?utf-8?B?UG03RDhiOXl3ZTA0QnJpT0NmMi9iY05JL0ppZ0x0b0xWZU9KdUlJVkJoamwy?=
 =?utf-8?B?YnBSN0VBYTZzaUdJK0xuN1VUa1drZVBnWXJqRTJDUms3QUtySkdPWFR3V2lB?=
 =?utf-8?B?Ym43WDUwZkNYYlBWSVJBbXRWckU4ZkhjWi9UZGhadFIzU1ljcmwySlZqampq?=
 =?utf-8?B?NERoVHZ4Vm5oa3VDRUR2UktnM0s0T09lLy9HY0xDbTRsQ0l5Um0rYUVLQUFU?=
 =?utf-8?B?NGtRRG5DMzRucEVIOEo2LyszKzd0YjFBK00xMm4yRUExUkxNR3pabnAzRzMy?=
 =?utf-8?B?YmtPcUN0N0x3QlZlYU1CTlF2QzhuZW1oWTNObktjbHQ2L25VeHoycXZpcHQ0?=
 =?utf-8?B?V3psVjRnTEk0d2xZK2tqQk56L09MTnJaaEg2ZlduRTk1RDFCQWFwL01Mc2hh?=
 =?utf-8?B?NFhuV0FKL3U3NmJPMWh0RWViellMMWJmMThMYzA1bUZQV0k4LzdabUlKMnpa?=
 =?utf-8?B?ZmhBbDZLYVQySlIxWTVGakRxbHJiZ1NDUER5MDRvR05jNWxCRFNvYnNxU29n?=
 =?utf-8?B?cWlzc2NxUmoyRVN2amEzWVpFeERHNGNrQ2ppcDZCS0lXM0Z3cnpEamNPZGhF?=
 =?utf-8?B?Mm9kVEpUSThQL1ZPRkFVczVKbXpWNXRtaUFyWFRpVGpWWi9GVzZjVnVvNDZp?=
 =?utf-8?B?TU1qM2w2OTBZVXVlZEQybit4dWZsTDJvNG9VNm1lRmkreWw2TjFDSG11YTdU?=
 =?utf-8?B?STBvMFZqWHpaZjJjWHRkQlBFN2V2MEZOS1Q5SC9YSy9rQXpiWDk2NXlzM0xI?=
 =?utf-8?B?VE51MU9lWVlVWFBiS3k5K0dxYUdHUDdPdG9FRnhlb0pENmFIQkZESnFuY0Z4?=
 =?utf-8?B?V3pBODI0UWNRUUxxQ09XUGpreVM4Mnp2TXdSaWExNlRuQlNpSkd5d1pXZiti?=
 =?utf-8?B?b3JxV0VtYThteFRNeXFwL0o0V0gzU1FYdnloRm1vaSszU2lMd0Uyd05CS1BI?=
 =?utf-8?B?US9hRXlOOEhEcjF6Z0xwdDhsNmRrTFlDNmFUcTkvNnFzS0JqNW5sdnRhV1hs?=
 =?utf-8?Q?7lww72S0MB+cpTIWLbNW5XO/80OpuPP5UdX74J1yV9g1+?=
X-MS-Exchange-AntiSpam-MessageData-1: iBr3oMk9sXuzcQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff3e6c2-f43a-440f-0fa1-08df2088f28a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:27:46.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kN22yE8I1hCHLuygpk4fa9/VTaGURGYJYRX/hVAgTn9TYA7AU6aQN3UJ8wE1MKgu9f+ejtkPRyrB4sywAH2DqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8CAB220A1

On Tue, 29 Sep 2026 20:41:33 -0700, John Hubbard wrote:
> This series adds GPU interrupt support to nova-core, so that GSP events
> reach the driver as interrupts instead of only when the driver polls.
> v5 applies Alex's review of v4, and makes three of the design changes
> that he had set aside for after the merge. The series is 15 patches,
> down from 17. The two rust/ patches are unchanged.
> 
> GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
> controller, and it latches pending interrupts in a two-level register
> tree. TOP, the tree's top-level enable register, holds one enable bit
> per subtree.
> 
> [...]

Applied to drm-rust-next, thanks!

[01/15] rust: pci: declare IrqType and IrqTypes with impl_flags
        commit: 38c9764d330dfe1d59009179904e313b0923f7b4
[03/15] gpu: nova-core: add the GIN vector, leaf and subtree types
        commit: e6c579b496f2740c447d215ef868dc5f9cc7dc93
[04/15] gpu: nova-core: add the GIN CPU interrupt tree and MSI EOI registers
        [acourbot: keep item that doesn't need to be exported private.]
        commit: 2ef55e142d29970641e9be04897457bb98a8eaca
[05/15] gpu: nova-core: add the per-architecture GIN CPU interrupt HAL
        commit: 4022bcaa34e2115e175f6a64022ec19a186b0d72
[06/15] gpu: nova-core: add the GIN interrupt tree and allocate its vectors
        commit: 939b40877cb883de1fa335e950ff1a3f3bf113ed
[07/15] gpu: nova-core: wait for GFW boot in probe, not in the Gpu constructor
        [acourbot: move code to associated function, move relevant hunks to next
        patch.]
        commit: 94ddc4b4843da8b1858535b13318346cb950800d
[08/15] gpu: nova-core: add an interrupt delivery self-test
        [acourbot: move relevant bits of previous patch into this one.]
        [acourbot: remove reference to self-test section of documentation.]
        [acourbot: replace completions with atomic polling code.]
        commit: 9cb3f5d56e81fd97a82ef361b210bc2322daaaa7
[09/15] gpu: nova-core: log GSP events instead of discarding them
        commit: 0c551cdc465b9c99da33a21d6ee3b274cfda7006
[10/15] gpu: nova-core: return ENOMSG for an unmatched GSP message
        commit: d3cb3ed1a2ddd7cb77d9d270d82d3177ee744d1f
[11/15] gpu: nova-core: bound a GSP wait by a single deadline
        commit: 621b455c56376f5469d896b58c2316236a3f939d
[12/15] gpu: nova-core: add the falcon interrupt registers and HAL methods
        [acourbot: remove implementation-specific comments on interface doc.]
        [acourbot: make constructor take boolean instead of having two methods.]
        [acourbot: add NVIDIA copyright headers to modified files.]
        commit: e727d1c382a0cb2e10fd7aabef9217d1a37c80c7
[13/15] gpu: nova-core: service GSP events from the SWGEN0 interrupt
        [acourbot: trim comment leaking unneeded implementation details.]
        [acourbot: make Subtree crate-visible here instead of in earlier patch.]
        commit: 476abf9f669d87f993429ebb42668169464c907c
[14/15] gpu: nova-core: add KUnit tests for the interrupt tree
        commit: 306279ce974d396136544aa88027ee921ac09540
[15/15] gpu: nova-core: document the GIN interrupt controller and GSP events
        [acourbot: cut the last 3 sections.]
        commit: df718311a84188e26d499301c3921e4c392d557e
