Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC83542F6
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972547; cv=fail; b=dfayMM7MUyb4xz6Vepz0GqeNk9qh2laNJLYZaVL266HbpHVltGrx1hA9Wl4Nz/prwkXDZTvymdb2tMtMQKwCSEehSKu93BYrTR663ceYd3gpNAh66k9Yf84LY2z2EaCeNb6u/pdLXORGZtDusSbtX/YfytUoUjNN1LK/DK7pCak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972547; c=relaxed/simple;
	bh=nsVyWlbC2P7GyfPpr5JIAjjpG7c7g4YHFmKLE2nOpYo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BFyVnQc8CZIAJstkZh84Nz160jT+K/mUEbPfrczICr8Nffj2e5OGMOBiqea/5bycBi+5k3fmntKsVMYzbB56FeS3JcHXpPct7kF3rd1vv0TDuOWw12AVaDdLk5jhQqI3vuoKxaPBt5YWY0XVA3ePMEh/lAe69hwzxTJAmjFAyCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Px1lRRYv; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Px1lRRYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKiHNO2HbDp3+L+QOVvqwC3/WaLuTdeTvg+VmYFcN44cq+qrOSN5IEO1irHPCwf5RZ9QOp2ZT8mEAi0UAKSPVf3j8UgoNZf/1UpwLCkjB9dJ/5DWecDoWqDjiem39C/ex0GiyzfzEbMESb1cf4olqp7U4elVH9e+WHU89GXgT4HvaGcbJhaQKTh/Vq8g0jPFfNhg59dvPGyJrM7C0okIALQp18yDWOtmmteBAeHCVm5ar1eO2u3i5v5bgkI3qGdYuNWvtwrKJzLVt8v3KB6699t1KXSEtRFhfT7iR4SfkPYyjRLenJ8DqTZKy4U2iz+1siXv/OOTeuT8PZ4GNehFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XlG1fd+T+8ksrBGrAQQBwdHgxqgJAL4HB7KZmijZoE=;
 b=rLPEIUsVYrKstwcJ398Q4VN9w7q7bdCt8vrRb3RJM/LEteodAd74ccSF91is3ahksomX4+diDHBy/dJTF/ooQ//riud1XCqIG31za5n00Etzi/a3mbhcY7Tos+OtSNBm7avjGV4MH36cd2UTq+/ojroywr/P8brhfl611n8sit7KxG1aqq5nsL6voHZEK9jbkL641V8shKBPtB6PksvHB18oNailK/X+IvlR3lf7M6gE+XzOthVZwo5lDVrn45wCeC1dnzLuHNnfK2wByA8gADkAEN/gBs+G0lp9JtpMgHhxYwy2mFh7AImBjIQx2sIdLbg2b8Pwf8WncIh8OlVQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XlG1fd+T+8ksrBGrAQQBwdHgxqgJAL4HB7KZmijZoE=;
 b=Px1lRRYvZUVi4syLUFsQdyA2LKofUfHP4F/t4cTJcno4Q3e7PzsxB0bmofNImOZrf6ARzAuzzsc6nkp1M6uKhCJH7yvWRkpNwDEIY0WHy72ByQ32x4sExkUMqEgO4425IF2gVfr6/J/MiEoAhNUI31fAh4dJ4wamiGOuMh0i9ovZCH+29k3XWqL7b7ibNjAPamP4M2mQFxIKed2zeT9Si2uJZlPI06tBm5ZV/AURPizCbYPUXax4j3H6MHmZfnPWn8oM0eJorpcIX8kbL23vDmn0vLpg6+GHJd2SR4D87kT35BKt6g3BMNx8bIkhlr6tiZEMCpKa1k05KgaAZhw94A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:42 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:42 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:35:39 +0900
Message-Id: <DLKSB4FK3UEE.531C393VK0ZV@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v4 08/17] gpu: nova-core: add an interrupt delivery
 self-test
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-9-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-9-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 05005f87-36e5-4cab-09e4-08df17aa8edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	BndMtJ8s5v7WMfxTy+4JW4ptUDJRavJWX+mPyHzwTbBwhYScPrMPcUXFFwdFt71VVdx+WRq8aPY6wQVO3NwEWWq6kUmv7QWb2/RZgzA7P96R9X8ntA8x79oTXkcIuo9Ao3m8VsuvpmbLzI9zyLCAUsV+W11yLo1UTe6bLVkvFaDisDDeTOZsNTFPx8D0IlnvDyeCUjkty93qtbEUwwXDRgu7A0mguCV8IcO9TTtqK5eO16ocWg53S/eM/H1AGdj9l6visLnhyeEs35jSzlhXYMoqtAC6DUNc5iLDxrjL0ELlt51Gj7pi/q3BKAfbUUvOPFuE0D/dU5zr4JUZzq2SWGA2rNQd4d9moP7K0Fb2lAw5/bgFmrrGnoV6qhSYOQ/dvuH+ZTWznrS56ZuViCr35OPC0xuV4kHRpNIz9ZAnR5X7z9RCyZbMkt9aFX2M6xMPCBrpHtkDOKewETWVy9mQug3kx3VfElDLOC4uq8suRYdgWREo4M7mwzDsQ9fWdWZKUVc3GG9Rmzu3rvTUXSsg8WOnapfqLm6BYMencGxLjIK526IgrKMbok7OxSMmmKe4ZeFXv6eZHkiF+3j8iwstP0X/rivddAbqDJpy1yZFGae+D51Vjp1mwZg2lM/jJguo3hMJ/CcCItR+iKwDBuEGYUoqImXIrlvIPAm3Q6pPrC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDJiWWpuQ25USldraVhERUUwMzhaZmM0UkJRZlg0SjFSdXhIR2dpYi8rU2Vz?=
 =?utf-8?B?bmxsNXZpOVBKZUJUMnVxTGZURmErT2pUS1hqU2w2djdCOGFuUy91MWlYYWZS?=
 =?utf-8?B?dStDNEVNV2c5SUpEZUhGYm5xWlZPNDZsSEhZbDhkMzZVbmYxOXBKRjlTV3pJ?=
 =?utf-8?B?VWVTcXVtdjNuekdYOTI4M085MGlOSlZ1MlEyc2hXcnVYUCtOV3hNQmo1L3Q5?=
 =?utf-8?B?Y1dBR1JYSGdnMzEvSEQvMFFYV2NCZ1Boc0xYU0NkazU0Mm5Xbkh1NCtNTXJo?=
 =?utf-8?B?NzMwUHZqVElJOGd3TC8vUXRpSGdDNUx4Qm9zMmV4TEJMUmREcWRpTy9DdXI5?=
 =?utf-8?B?a0hlZ1lOVnE3cXNBVGFtVlVtSThSM05XbUlJOC9iWjJjMVhGbmVEeWxaS1do?=
 =?utf-8?B?a1YzK2VlV1dhMEVFbDdidGNQNGlLQnp0M21OZVNETkt3NitLbzZadGZLZTB0?=
 =?utf-8?B?czh6dlYyMDN5cXVEaGxUcm9idGU0eE5Md1ZCaFBVNUFvYm9QVW55TUQ2UEdK?=
 =?utf-8?B?bmx5cDdqakduNmFaa1ZOVmVtSmV5UEhjZVhralJlR2ZZRGpBUWt3SGxVQ0NB?=
 =?utf-8?B?Um1ZL3ByemRoOUUyeHJGQ0xRMWFGQ1ZkcENkSDdPdEJZZDkvcHNMVVVwSjVM?=
 =?utf-8?B?ZzNxbUExYmRqa3VONDlyYThqNWNPbWQwdG9VdVk2TzFnR2VqV1F4bFhQWHRq?=
 =?utf-8?B?bmVnM3B2clNyaEUzdEhDbzBEQmMySUNJSnYrWkh2bi9vcWo2RENWaXFaamhN?=
 =?utf-8?B?eXh1dnBBMGQ1RFR3dEZ4cnVva0xvUnpWSkJNcHQyZEl3bHp5cjdFMGwyNGYz?=
 =?utf-8?B?Z0pmQ3hTbTBBL3Z0VEY3STBrTSthWWN5UjhSVlhsRXQ5bEtjZzFFbHg3ckhz?=
 =?utf-8?B?S0NUL2xkL3dKSjk4L0sxdnQrQnFYVXpONkN5anQrSU9Eb3FDZ3R1NnB0NkRR?=
 =?utf-8?B?Z2ZlNi9xN1dRZGxBZGl5QWVJSEFOS0FNOXpnUXhBaG9WU3hoVklZdnM1N082?=
 =?utf-8?B?d0ovVm1KemNCTmIzRTZUM3VxRDJqSS9aTHRRMFI0NG9DSHV5Vmt6ejBIcFpV?=
 =?utf-8?B?ay84RFpaaDBOajVHbmpCNUo4bFo2NUlTQzZ0bXNRZS9iY0xyd2Z5eWJmL291?=
 =?utf-8?B?bGVWekU5bUZ2cE5nOHRoVGYyRW9DUEYzbUJVUXZ1TDBxUzhQdzMyVDBKUndp?=
 =?utf-8?B?MTJoNWwwWXFBMzFra1EvSTEyRzZ3YkRsaFphYWdGMEJSWGhNYmpMbEpJRFhs?=
 =?utf-8?B?MzZKWkR4NDVUR05LRVVLVXN5c2JGVGJKdmNZMFFmRUYreE5Qa1RiaWQ1S3l4?=
 =?utf-8?B?UzJ4dmJWdVZSZnJ3cE5jZFM5K3pjcnBWMGphMk4rdVBJK1NwRWhhZ0pZQ1dG?=
 =?utf-8?B?N05HQ1lqRXhxOGxjRDBiR3Znc2w2WnVaL0pONnpsK3hxK1BxWml0S0NhYTZy?=
 =?utf-8?B?VjNaSmhBbzRuSllBL0Vud0Zsd25ydkNqcWdTaUdkd2hzcVhrTUZ5K0hwUFQ2?=
 =?utf-8?B?WE5MOHdLNFNFUnhoTTlodEVGeVF3UHhoZXo1TVpvOFU3cksxZmNMSENGMlBi?=
 =?utf-8?B?TnVCQ2tJc2FFNVcrQnFxNTluemJINzd0TmpBVjlDMU5OY0lvRlNFak1xRzh1?=
 =?utf-8?B?SitRekdJeFkvT2xWaFRwcDF6dkQ1dFQrOXRvZ3Bza1FsajRmbFNRT3J6WHRM?=
 =?utf-8?B?cVU0c2hxc1NKNE5UblVISkpVN3VpcFBIR1RSNEY5aFdGVlhJNEdSeFZOQjJ4?=
 =?utf-8?B?bkt2bjJmVFVUeFF0VXpHVXlDQ3lTR3U1Y3hKZEowNkpTUzFDQmFMSGl3Y0hO?=
 =?utf-8?B?NlpEWThjTS8wQUQzWUo0RjRrUmlZdUw2bTBCaUZ0WEdtQVBXa2ZMMURzSkxJ?=
 =?utf-8?B?aUZNL3lrQTYyaVh3cWpsQzNQRkQyOUw1YVFLNzZDek5Pa0RmdmErMUtiU0lM?=
 =?utf-8?B?V2VxOVRqVGtIUUIwTWNYNUthcXNFTkNlSjlKRkVlYnF3cWZYMEZQQm1wQ0E0?=
 =?utf-8?B?TWxGVERUVjdVemhCaG1oT09QN29yZTB1Q2orSUJmOEE1S291Nkc4YWJqaXkz?=
 =?utf-8?B?K1ZSRTZTR0JxTXFwb0pOSDR4Q2RSSFNIYXVmbURKUEhjWnJ6Q05icTNOaEhw?=
 =?utf-8?B?TmgzdDQ3aHd0TTYzcHI0N0xWSUZnM25RMTBBNTlKS3BiS0RRUjNVWThjdmx0?=
 =?utf-8?B?c0JCN3hQa050Qk9WVm1jK1NXQ3BpbFI2N3A0NTFOU2FFaFRaVmZ4QWVaRU8x?=
 =?utf-8?B?U2dmQVlVWElNckd3QnE5cTF4MTBQN1FyTjZXcllRWFNVQUNwOXlsd1JiWmhr?=
 =?utf-8?B?YjE4SVduUnpXaFZMc0lKSFV6TUxwb3BBanVBcXI1M2NCMDFBNnpRV1pxTTBm?=
 =?utf-8?Q?q4WBSbJHmTyNrvdqhxcdzg5B+0MgjYquVm1OHfnp2IPAZ?=
X-MS-Exchange-AntiSpam-MessageData-1: Uuose2ccrNkhGQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05005f87-36e5-4cab-09e4-08df17aa8edf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:42.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGHVSaitQD+w0LRghYj1ZIGP7Z8JMdqyiZKOU/JhGpGQ5CQmGKP6jbrLguyN2aZM9t8raA8UGolnAU9ijA8nkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 1:43 PM JST, John Hubbard wrote:
> A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
> tree's enables, or in the rearm, and every one of those failures looks
> the same: no interrupt arrives, and nothing says which one broke.
>
> Add a probe-time self-test, built under NOVA_CORE_SELFTESTS, that
> latches the CPU doorbell vector through the GIN software trigger and
> waits for a registered handler to service it. One delivery would pass
> with a broken rearm, because the first message-signaled interrupt
> arrives whether or not the driver rearms, so the test triggers twice and
> waits for the first handler to finish before the second trigger. It runs
> after GFW boot and before GSP boot, on a quiesced tree, and fails probe
> unless both deliveries arrive, each finds only the doorbell pending, and
> the leaf ends clear.
>
> The doorbell has the same vector on every supported GPU, so the test
> names it without asking GSP-RM. It allocates the PCI vectors for the
> doorbell's subtree and releases them before returning, so under MSI-X
> the delivery also exercises that subtree's table entry.
>
> Assisted-by: LLM
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig               |   5 +
>  drivers/gpu/nova-core/driver.rs             |   5 +
>  drivers/gpu/nova-core/irq.rs                |   2 +
>  drivers/gpu/nova-core/irq/doorbell_test.rs  | 266 ++++++++++++++++++++
>  drivers/gpu/nova-core/irq/interrupt_tree.rs |   2 +-
>  drivers/gpu/nova-core/nova_core.rs          |   2 +-
>  6 files changed, 280 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 1934f17baa8b..2e11e46c99c7 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -24,4 +24,9 @@ config NOVA_CORE_SELFTESTS
>  	help
>  	  Build the driver self-tests and run them when the GPU is probed.
> =20
> +	  If the interrupt delivery test fails, the probe fails and the driver
> +	  does not bind to the GPU. A broken interrupt path would otherwise
> +	  show up later as a hang, far from its cause. Every other self-test
> +	  logs its failure and lets the probe continue.
> +
>  	  If unsure, say N.
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 15a44f9a6441..4400cae8c8ce 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -119,6 +119,11 @@ fn probe<'bound>(
>                      let spec =3D Spec::new(pdev.as_ref(), bar)?;
> =20
>                      gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, sp=
ec.chipset)?;
> +
> +                    // The self-test disables and drains the whole tree,=
 so it has to run before
> +                    // `Gpu::new` boots the GSP.
> +                    #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
> +                    crate::irq::doorbell_test::run_selftest(pdev, bar, s=
pec.chipset)?;
>                  },
>                  // TODO: Use self-referential pin-init syntax once avail=
able.
>                  gpu <- Gpu::new(
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index 28f147641024..7fb7d9f2e237 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -9,6 +9,8 @@
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
> +#[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
> +pub(crate) mod doorbell_test;
>  mod hal;
>  mod interrupt_tree;
>  mod regs;
> diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nov=
a-core/irq/doorbell_test.rs
> new file mode 100644
> index 000000000000..a1f8b3cc377b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Interrupt delivery self-test.
> +//!
> +//! The test triggers the CPU doorbell vector from software, twice, and =
checks that each trigger
> +//! reaches a registered handler. It runs during probe under `CONFIG_NOV=
A_CORE_SELFTESTS`.
> +//!
> +//! See "Self-test" in `Documentation/gpu/nova/core/interrupts.rst`.
> +
> +use core::pin::Pin;
> +
> +use kernel::{
> +    device::Bound,
> +    irq,
> +    pci,
> +    prelude::*,
> +    sync::{
> +        atomic::{
> +            Atomic,
> +            Relaxed, //
> +        },
> +        Completion, //
> +    },
> +    time, //
> +};
> +
> +use super::interrupt_tree::{
> +    GinVector,
> +    LeafEnableGuard,
> +    LeafMask,
> +    Subtree,
> +    TopEnableGuard,
> +    Tree, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset,
> +    selftest_assert,
> +    selftest_assert_eq, //
> +};
> +
> +/// The CPU doorbell vector. Every supported GPU uses this number, so th=
e test needs nothing from
> +/// GSP-RM, which is not running yet.
> +const DOORBELL_VECTOR: GinVector =3D GinVector::new::<129>();
> +
> +/// The only subtree that this test services.
> +const DOORBELL_SUBTREE: Subtree =3D DOORBELL_VECTOR.subtree();
> +
> +/// Time allowed for each delivery to arrive.
> +const DELIVERY_TIMEOUT_MS: time::Msecs =3D 1000;
> +
> +/// The self-test's interrupt handler.
> +///
> +/// It clears only the doorbell's bit, rearms delivery, and never walks =
the tree. A missing rearm
> +/// shows up as a timeout on the second delivery.
> +#[pin_data]
> +struct DoorbellTestHandler<'a> {
> +    tree: Tree<'a>,
> +    /// Completed by the first delivery.
> +    #[pin]
> +    first: Completion,
> +    /// Completed by the second delivery.
> +    #[pin]
> +    second: Completion,
> +    /// Deliveries that found the doorbell bit set.
> +    irq_count: Atomic<u32>,
> +    /// The doorbell leaf's pending bits, as read by the first delivery.
> +    first_pending: Atomic<u32>,
> +    /// The doorbell leaf's pending bits, as read by the second delivery=
.
> +    second_pending: Atomic<u32>,
> +}
> +
> +impl irq::Handler for DoorbellTestHandler<'_> {
> +    fn handle(&self) -> irq::IrqReturn {
> +        let leaf =3D self.tree.read_pending(DOORBELL_VECTOR.leaf_index()=
);
> +        let pending =3D leaf.vectors();
> +        if !pending.contains(DOORBELL_VECTOR.leaf_mask()) {
> +            self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
> +            return irq::IrqReturn::None;
> +        }
> +        leaf.clear_vectors(DOORBELL_VECTOR.leaf_mask());
> +
> +        let count =3D self.irq_count.fetch_add(1, Relaxed);
> +
> +        // Rearm before completing, since the waiting thread triggers th=
e next doorbell as soon as
> +        // it wakes.
> +        self.tree.rearm_pci_irq(DOORBELL_SUBTREE);

Let's group the `clear_vectors` and `rearm_pci_irq` together and before
the `count` increase. Having the count increase in the middle breaks the
flow of the IRQ logic and there is no good reason to have it here.

> +
> +        match count {
> +            0 =3D> {
> +                self.first_pending.store(pending.into_raw(), Relaxed);
> +                self.first.complete_all();
> +            }
> +            1 =3D> {
> +                self.second_pending.store(pending.into_raw(), Relaxed);
> +                self.second.complete_all();
> +            }
> +            _ =3D> (),
> +        }
> +
> +        irq::IrqReturn::Handled
> +    }
> +}
> +
> +/// The self-test's handler registration and the enables that deliver to=
 it.
> +///
> +/// Drops in the order that "Enabling the GSP event" in
> +/// `Documentation/gpu/nova/core/interrupts.rst` requires: the vector is=
 disabled, then the
> +/// handler is freed, then the subtree is disabled.
> +struct SelftestResources<'a, 'r> {
> +    _leaf_guard: LeafEnableGuard<'a>,
> +    reg: Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>,
> +    _top_guard: TopEnableGuard<'a>,
> +}
> +
> +impl<'a> SelftestResources<'a, '_> {
> +    fn handler(&self) -> &DoorbellTestHandler<'a> {
> +        self.reg.handler()
> +    }
> +
> +    /// Disables the doorbell vector and waits for a handler in flight o=
n another CPU to finish.
> +    ///
> +    /// The handler's counters and the leaf's pending bits are final on =
return.
> +    fn quiesce_source(&self) {
> +        self.handler()
> +            .tree
> +            .disable_leaf(DOORBELL_VECTOR.leaf_index(), DOORBELL_VECTOR.=
leaf_mask());
> +        self.reg.synchronize();
> +    }
> +}
> +
> +/// Runs the interrupt delivery self-test.
> +///
> +/// Call this only during probe, before GSP boot: it disables every vect=
or in the tree and clears
> +/// every pending bit. On return, the doorbell's subtree is disabled at =
`TOP`, and the test's PCI
> +/// vectors and handler are released.
> +///
> +/// # Errors
> +///
> +/// `EINVAL` if `chipset` does not implement the doorbell's subtree. `ET=
IMEDOUT` if a delivery
> +/// does not arrive within [`DELIVERY_TIMEOUT_MS`]. `EIO` if a self-test=
 assertion fails.
> +/// Otherwise the error from allocating the PCI vectors or registering t=
he handler.
> +pub(crate) fn run_selftest(pdev: &pci::Device<Bound>, bar: Bar0<'_>, chi=
pset: Chipset) -> Result {
> +    let dev =3D pdev.as_ref();

This variable is superfluous, `pdev` can be passed as-is to all of the
macros and will be automatically deref'd.

> +
> +    let vectors =3D super::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?=
;
> +    let request =3D vectors.request_for(DOORBELL_SUBTREE)?;
> +    let tree =3D Tree::new(bar, chipset, &vectors)?;

There is a `vectors.tree()` method introduced later in the series that
we should add earlier and use here instead of calling this constructor.
