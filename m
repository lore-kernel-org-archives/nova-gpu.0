Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B262E377EB2
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863833; cv=fail; b=rcUOgj4YnxZ1uLpq6U/p3nW/ExICs2X2Yzsub98NVXpewag1R1m4KQIUKcBIehLwl1ARQzyF3mjW8cDmvSpnuIhbMf+9D6dUwcWqkUp0Vjtjy4n3C+j/D/AtWVKnSx9iKXZKX+01FqBShx45llnljhhvxnrwsGJ6QTTZlITYwT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863833; c=relaxed/simple;
	bh=LT2CZ4zOlTtvDL1hXEeZZul8E3/0lzHlh2LjhrjT+rg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hbQsuaIvatUq42uODml5exD/XzHhrS0VNCWYZCLegc2d3syuzCaDA+eJLoQk3rrgQHNObA9sNDE/uQpsBXxAk3PAjkWmzdgie+pK+HB8xjgCfr0Zm52ixk7Qw0w3sGevqG6FtbIvm5c0Jm1hhpogGXaoEmdTDRPWNMthCMIe2CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AdYkikHK; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AdYkikHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzjIJ6yfzYs/YQnCHl5OBgUrzvj2J8MlO92rqpWvU3ZPnm4+lGQoBzXP8jc6dUvTiyAJ/ASguOCcrf/8xgJY3pJTi3Dv0UxwvxWktzyCyVJpWSMqapVoyQ6qvCDbIgNU6i5u9n1xe9j62medyaTKSXvxZkZDAzb/4FKoe7xigyrOriQClXKDx85HxCDzcpwbBVdaSexbUo0LjgEh30x9O/V9P0OrDwRmgd5LnFr5UnAncKfcHCpaupPb6UPXgH7AUzw5JocXq71YrT05boriih1ojXpzd/ewJPGGLuiKWZ5b9bloXgmru0Vo0Oi7cCz3SJ2Ei9bZvZpY6W+8NwSMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMwuTq+mECU688rtrqQo/a7kmwFN5tOXMkctNqD/SHs=;
 b=NQ4v+GAXrEPSxtygp8Z/S+UvyZkliJUOPR02oWdf3PgWvLOqhruQB57u6JYGii8c/TxkLFKXn31NfHxESo8aeKoWpwlwEigeFTQDY/eh6MuaEIuomRKSPU0D5AhE432yvIIFNITKyanF0MjYOmR9laE9Hm1kMdO17krPSwy/sBFdk7XOOYQpoJnkmMCzEIttxG25bD/t/Xiv9TfH2Ho4Jiw/JzMsGpJa5RPqVYJ5+cjlivoR7C0zUjrRNafFwUFGA9iX4Fmm8nXPgrMdkkkS8Smullp37aJVGmtFCE0y8aNVxwOV/9fgqodt1JoCYNXBDTJXNzrL9JAd2jyk0yF7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMwuTq+mECU688rtrqQo/a7kmwFN5tOXMkctNqD/SHs=;
 b=AdYkikHKY3dmVnMeeBmJqRPY8FoRoFRqf4eAEIViHe8U/ocgyK34lNXjJn4yW9o4G0rCvC/5lv5Gk9SIoIQrH6IXC8YWZito0iIZY5rairfmiA2fcbzFLnc0YY56CO9BaACVvxyjU3aXig2g9ky3MTUaHkIYY6aghD+Cyxk5zNzQdVv9cMD8Pe8eYbsj/adjo41/evkg6WFO9fWUBVB4ZJIK76OXWYSZiVjuGIn7QvUjtHXW8GhR04vZcdzy5njY7xvJfHIq6imp/FErk2DzGBc46J504mSH2Sy6Hk39Em/3C5XvSQWKnik6WDStijTEJDjy+PV5E2YQWxq5Yv5QVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 14:10:24 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:10:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 23:10:17 +0900
Message-Id: <DLTK8O9XMNJT.2VDPMGWMTU4TZ@nvidia.com>
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
Subject: Re: [PATCH v5 00/15] nova-core: GPU interrupt support and GSP event
 delivery
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1a1e34-7330-4afa-8f82-08df1fc5bac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FVE6MICMmiZgekw7TNfUcdhUoCI/m8qiv+xccMkVr4M1ewvxhXNbPUTsaQhg7R9eOfgFlJmzXajwXyBjk9jy5h2+CfODNS5Cp85BWrrU5cpdtoepXNrP44tBjZ7ZUd37mYGLBjEGxOqEngyuIpT5QVcyDU1pWXG2cBhnaF+CrDPqUMqlvmyZzOCZaslF9SGNeVjN+LnrfpnLJN7nYGkVoIn07QPdOxw+7dzXEXH2m9hC+RUjjW4AcmJkDuyyWl9PH66q7d2Bp+RctFkGyFioFHsOoG7lK66pll7LK5XIaB0DuFLBN+bXb62ytVkXcRn+RcySgXP/9eZx8mzN+NfAusAp09i+2TCY1LL8tXs29rMS7yR2L85VpgKDE+j8j0phIGZZjCp3bGILTTYMln4cuDRdrEbZc7i+8oeM8LLTmREbv/QVdU4/B9yM4WefCLoDBUnf6BiQBILSvrj7B+ajibPIdG8wUHB3+WDHrcfuSQdkBMawE+eRE7bAQAo3SauQbJ6eHkv+cY2ZQM6vuHXiHqZlsjiot9N0q664D46oY/JHWQKgXYuV0TF7SYIEDBJKHQEX4jMzSectWVKl9UbkLVqxDG8WAu0dBWkJqD+GUGd4KF3mhCyu/G1ZI0DzyD0osaCew63mfS/+0alSc3m9XCGZ57AsIAGLsWnvzV4gD/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekluZGdBSERwQWUwc2pneDExdGFDS3NPU2NtTmhKTWtxTitmUmlONE9ZVStT?=
 =?utf-8?B?bVJzMU1MaEVKUmROdFpTWHVNcTF6U29jUFR5bmtpbVBBNnBKOW1QVHZJcnNI?=
 =?utf-8?B?YnlpZWo2a3FJOENXdlN5aFhzckhleFkyWCtFclcwaXRDc1kyVWpacnhRdGpr?=
 =?utf-8?B?ejl3cmJQWDhxaWNvWVRTWGo2bEtlSlZGWWlDZ2RFVzV0RUk3dVVDd1JROUND?=
 =?utf-8?B?dE1Dd0JSQm13R1F6Zy9zVndNQzlWUTFGU3ZreWkwWWF1VGxtcUFJUXQrQnhy?=
 =?utf-8?B?UjlBOG9hKzN6OElzZFViNzVFSmZJd2JMNEJPMFZsb2l4QW5YOW9EdWhScURG?=
 =?utf-8?B?eENpQWhLZFF1RWpKTEc1NFBTdWJVM203eExtRDNUMzZHOEhjVERpeXJSTXZi?=
 =?utf-8?B?KzVyNWg3SE5kVnA3ZHd6RzNIMTJ3WTRycjcrRXB0YWNBTFoySFVIWTFBR29Q?=
 =?utf-8?B?M2tYTHhyTEFhaWMyZGpCOW5OUnd5ZlJNd05QdFI4dmZkMDV2bStNRHc2cjU1?=
 =?utf-8?B?YlkxdkZoWTNVcXpwN0djOGNIa1NHSlplOEVMSVdVTFl2SlJZNVNSbWNCTjND?=
 =?utf-8?B?R3lvK25LcEZXYVdKNTVlNUxwU2dHSS9oWWxGS0ZIeTFCVjdmQ05PSjZWQXpB?=
 =?utf-8?B?MjM1eHVRSWJVM21UZ0N1a1U2VGJpUHptRFpUdjlZRGJjZFQ3NVplOCtFT2tM?=
 =?utf-8?B?WjdhdmdMUnowZzBEaG5yb2FzRDcxazFIRUFPT25POU9TRlJKLzFDQk9FTjND?=
 =?utf-8?B?Q3JSRitnUGJsaFVXSm5sOTRBWGlPNkpyejdzTFU2VlFPa1A3YTIrbXBOd2ll?=
 =?utf-8?B?U2xYNmNKb1lJSFpHcys2MW5FRGlvYXFVVUZFMTJDcFhWMmRDanJOdkp0Witr?=
 =?utf-8?B?RTZmNFNNbFJ2bFpMTE5hT2YwblRlWGlpN0hhS1RJdjlQQnVsRlpoMnBmdFNP?=
 =?utf-8?B?ZWQrdjlXM2RlRXE0ZUlZc0pubSt0cVlPWEwrcEV4emlwZDNuM3hkUWVkVHhz?=
 =?utf-8?B?ZkFtRDFROG9WaWQwUy8xa2ZleTV5TG5YeVFnQk95SHA0OTN6SllKNm9wU3FX?=
 =?utf-8?B?RWt4cWF3bnlBRlVKa3pMT1lUL0JHeld3dTV6RVdDckpDRWdWNTIvOFZrRE1S?=
 =?utf-8?B?RHd2UnZlTE12ejlnK2IyY1V6UnFuUFNWWFc4bHRlanhJVVpwYzBLRDk2U3h3?=
 =?utf-8?B?QmtuOHJKam03Wit4d2NVejkwb0x4aU5UYUxlYkxSYkwvVzVaem51cUE5Zk9h?=
 =?utf-8?B?eFZQYjcwRHBSdm1QNHpMeVdKSlVxeDZOL0RjbWlFVHVvSlhYZVdTREdvMGc4?=
 =?utf-8?B?L3JuZk5ydmxkcVVWKzdKeVZTZlRqVmpOaFhYcHRlalZzVWpiVE5sMU82dlAr?=
 =?utf-8?B?TlhieWlKaitFNll3L05QQ2MyUUVJdUhRcWwxMzRGT1pXbC9vaWFFWThKYmVY?=
 =?utf-8?B?cEFpenluOElMSUUweWNjRk9RVThnZC94SUN4bi9vUzlJL1BDNENEOGV4OUU4?=
 =?utf-8?B?RUlGZ1dsWFVoWitlWFZPdWZkU1NZbTJ6QmFsMENCd1ZCSGlGR3AxMm5yczda?=
 =?utf-8?B?QkhBR1piR0ttNVludVJLbzZHb0V2QVVjZ05VRG5iaG9TR01xdm13ZnN1ZEN5?=
 =?utf-8?B?YjlzZ1lOeWE5MGNjcFNBZHZsREZjTUJDQW5lVXZOVEJmTENiNEl3TlJmaGdN?=
 =?utf-8?B?QzUxTVhzTDlldEtMdWN1Q3JMbVRSTE5admt2ZGgrdm1wNFVPYkZVRjVuNDlP?=
 =?utf-8?B?SWZaNnltZk01SWE5dUVRdnI1MjEzQjFGajVGakxOQ2lBbnZ6Um4xMmJ2cUJ2?=
 =?utf-8?B?UGFHNldndnh5OXN1N2ZqSlh1VkwxZTRlNlhkaEhyMlY2S3NVZHNabU1QMCta?=
 =?utf-8?B?aHoraWg1R0plUFhuckFNeklIS1YwSXFPMnJqQ0cyYUFnSWplN0RUYW1HYUR3?=
 =?utf-8?B?YnRnVXBCZ3Jvd3N1RTdSZ0ZOY0FVY3QvUTBFbkplWU5yQWlTa1pIY3pUeCtZ?=
 =?utf-8?B?QWx3dlU0VU9NNjVxU3VUMmVCM0tlbzA1MnA5dmxTM2JMM3N1VHh3b1grQVFR?=
 =?utf-8?B?MTRFMGRkZ1pZczhzYVdXZXRDaVgzU0swaWM4cXZiY25ub0tia0ZsTGJCZ21y?=
 =?utf-8?B?VHVrdnc0VEVGNGMxN0daeGtTVWF6ODBwOWxYcUJuQ3VyRTdsM21VWDhndUFN?=
 =?utf-8?B?S3VSR09VaHhwRDBERjNEOU5ySmdrLzJqMTVwK25EZmUzM0dESGhxRjZDWWhh?=
 =?utf-8?B?UXVpeFcvTlJRanJuSndRUVd4Vnp2TGZKSk1JbmkyYmxJTVQ2K0xpRlIzMXdZ?=
 =?utf-8?B?dGZ1V1UyaDNQY05mMXBIQ25mdnM1TGpIS01jcklYOU1XTmxsNFp5V2pzQWFT?=
 =?utf-8?Q?g3JwLz9v7wNieqUzhbq5FQEVkXtaUqT62XQK6bv10Ysty?=
X-MS-Exchange-AntiSpam-MessageData-1: eQwi3QRTR4zTwQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1a1e34-7330-4afa-8f82-08df1fc5bac8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:10:21.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6BNy8/ZCkDfpMmoLQUlivzzA5raGkQqolQmJVyUtgJ5DJAkHqJ3PheqORpLDOlt/lY8LtA+LYbBTSNAeWAgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

On Wed Sep 30, 2026 at 12:41 PM JST, John Hubbard wrote:
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
> The design uses a threaded IRQ handler. The top half reads and writes
> only GPU registers, while the threaded bottom half drains the message
> queue.
>
> Still TODO after this: retrieve the dynamic interrupt routing tables
> from GSP, and use those, instead of the simple, hard-coded approach that
> was done here for these first two interrupts.
>
> The series is based on drm-rust-next at commit 658c5f0042e6 ("gpu:
> nova-core: use a single try_pin_init!() block in probe()"), and it
> carries no prerequisite commits.
>
> The patches, as applied to drm-rust-next, are on a git branch:
>
>     https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tre=
e-v5/

This revision is a quite significant improvement, and although there are
still a few things I want to fix before applying (notably on - guess
what - the HAL :)), this is in the drive-by-upon-apply range. I'll leave
a few review comments for the sake of completeness, but there should be
no need to send a new revision, unless I missed something important on
my first pass.
