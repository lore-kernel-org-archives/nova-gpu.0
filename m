Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABF3546CD
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 05:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758792; cv=fail; b=sXGXTtqHVynAkSm8iNyAtNfHtb7TI/gNCuhnf8z/efo/1OqI34MGtv8+vVA4w9dDuIXb455hqPVvQkgcdtg5eOuLxLU9my+qH1pwC8UQDPSRa7PTnYxFIzNCEyOHirwnEi63giaAo9ZcyVMHQZyLtqkqjeUcHH5kwkzphFH4nsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758792; c=relaxed/simple;
	bh=XFNU9wKa+mYz53Z5n3y4pSRo6HFbHvF7GLO8ItIW23Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=m6kbXOVOYM6OVZw1so87VQdAA/UL7tapYpeUfEeIAgypUXPzwkENn3lnnSo/FTU6N6RANXIXolnvuGSfNA0UimBPHfbeKInPQzaD0OmqG0Fj0LQTR6XJU34nfRQ+f5wsr3CbtlEF7Uzx0UMRi+OOipbJinWqfwe4MeJb8CezSuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OMMu12iJ; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OMMu12iJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwlRKMQlmsEVF96xVF0iMQ0Z5nzmxld8iOZJYJWssCcWj3qGlZmKke32noH4YHPQYC0q3HewQpqKZ16Ke63GgQvGTnxPZi/DrPhSMjcjpCBNbHMegS7RZwu5mLOC5qyX2dSiH8LMa/0CeawkszXAanHfREA1rBEcVBHkAqzkRtI+myH5MUR9o9uM8lc+mnyLgp7nrQKI/EIfyYvOwlZ5rhJfCWECW5eIJdL5ZBKC5UC1Am/nVkPNfwJm7oD+TziZLvTJbsG467SQRnfLSPgA3zVNrPYPo+yTRIG7aMvv/X+4AUDddsIDowhJInmUcclH7YNtxozQ7PQ28d3gB28peA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs6viuj2vdlgXfmkuSLsaBqXDBqgLOYYIeNv1bUs0Ko=;
 b=X76NLqd08g6k7GnPZTCiPKcs58K19tugb6Ch3B7P3ZJy0SUKs1BNTQXrLL2FUCCNKzLddgFVA1LNKNY4hun2rHraxF4ReE6FuadCHRYFTr0opr1GIZ2Rj02gv6ibVYg/z/+roucUt+he+YPNlEy1tgFisv9+IiJD8XbSw07hS9E7AxjMFvs6I+rWoUTKRYaspAkwNxK0BKf8aWNNJ2EY2Nhkpy4h8Q1Eg3ZyOJvtlegRg39MiZMG12tJTOC24L3e7x+DmKR4CrKmYcjIvupk9ndu48xDx7q8MXMYc9UypKhEfWCouLmK9o7pmmZtucrKlio8+OWvjK0QzT4CftqPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs6viuj2vdlgXfmkuSLsaBqXDBqgLOYYIeNv1bUs0Ko=;
 b=OMMu12iJDTGhd2+9lcxHsnQ9Gj9vKuyZA095J0hguqwqquhiuiJP+ps45RmEMahkTnuRomwaA3IrsiV2C+ZDNaRVFk2LNzrCrLqp8shy/8Z1Ujt7WOxG63a+7/I7JZxlc9xaNFDqWNGIsSvI2qjxitXgEUKzVJWbKHnwxDaeCvg4eb/LtPHGedIexZEn7LSpd3+ZYg04BR9bz6ut5DHCeAJKxCIZVnNEoWYBwCFSaZ9+eWEhMHY4XleHUpB+mQjS4J3mvPsEh53dhpqTFuMk6RnDIBnZAN686qsC+tbKVy3O+ir9VvYeq5uD73IpbhG7mHKu0vWH0Z3pfT79lvPEqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 05:26:23 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 05:26:23 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 14:26:20 +0900
Message-Id: <DL8U2FH0NEG1.Q4LR8LMXZYKE@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 07/14] gpu: nova-core: add an interrupt delivery
 self-test
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-8-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-8-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f64dd3-6095-4898-cde7-08df0ca08e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|10070799003|4143699003|10067099003|7136999003|5023799004|56012099006|11063799006|18002099003|22082099003|11062099010|6133799003;
X-Microsoft-Antispam-Message-Info:
	mSfq7Op/NeLpJ46D8NQsM+7l07SR4IRDmSkxV9Pi83s33hbEZzinjCDapoAWy206ewulp/nTn9DQBhXs29QldpbXeY51qPAcUN/2VwZ+gDyymTeNqRtXrxyx5JGCfju8L9TwXc4xiTud+VDl3FnizPzV0AKalb2v4SyM5y03RHPiHP6ODR2IeDjTOxiA+NyV/DvGItY8iRFciecPtlit8Ii4c1D4q3K03iELPGLmdn3SWm/LGxFKKzVaO5fuzrk9+9+kqgGKJsgqxKhuK1BdsnikN0G9BZ2zKSgGXVRZhtp5xuXOiTUlZPAbNU8mqF3YsAETpBQQU3LN7AuTEU4VWjGOsW/nSXo2q4dy3C2pM9fJjgBCdldWlpfxjcOQ5EH6Zd+ktzCDcuYRzVpDMhbjao2DtD2N4DZpcvhCacWnIhY7uRBNc0NUnmW36BDYoC7K9cctnqe6tK7m12fMBvfcpmJK8h2j/AKeQgmitmExvRfwaIs8fVXURYszFuvQlwRbMUtaaNWN6YAX8EDyqrSvYmf6eIj6bw5DJuIe7gqO0GIqFeAIZO7sHRZliBqTbVCV44UpBqdK6K+ww5l/tKocWqxGPHUzq8G6+ZLmU5Wd+q4GoCwxGkL9AH7K/umv26vHy9WxXvlarc2VOwDP9QqseHmUjtxYQbZa3FW0KVxd070=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(10070799003)(4143699003)(10067099003)(7136999003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003)(11062099010)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWcrc2JidXJraHRVcEhnMjZ4ZW1qNkhxZDNiMG9xa3hXaGNNTWNySS9vZ3RV?=
 =?utf-8?B?a2xWQ3JjL0hIN2IydkRWS2tpMzV6YWFzSlQxRnZJK0l1c08wT3puUXVCTDNV?=
 =?utf-8?B?TUtGN2o2enBaK04xSHBJVEdzTnRORlN4VTB4aE0xR0hVRnlVUmJvSjZBS0U0?=
 =?utf-8?B?aWRNNUY1Um45dlBQc2ZpVUl5U0xYYWtOeUM0OE1Oc2RPcGQ4RXl5NjVUOVFz?=
 =?utf-8?B?eU1adkxBLzFwVk9EeHc3Z0VSQ1drV0pQMVRjcFBqa20wM0I0dkRhTVlHSDMy?=
 =?utf-8?B?ZXIrQlcwZlYzaURmSHF3bTRraFV3cHhkeHNEOVEvMVltRWMyeHFqUko0Qjlq?=
 =?utf-8?B?a2R3ZGxGNStaaWplVHcrOGFReU43N1U3NmNwd1ZkK2E0M2pXUjlLTGRIdDY2?=
 =?utf-8?B?SlZJRUpYdUVCV3JSVWpTL1JUTHRDY28rN3YzMkdaVWJOSTJ0R21Qb0g1RWFM?=
 =?utf-8?B?aVNpWEJqUjdGSWF4ZURsbnRIQlB3QnprSmltTlBxNnJOK1JhRWl3RXZ6WUZE?=
 =?utf-8?B?bGZEL20zb1M4dnhYYlpVVm5QTUpIYzkzR2tEMjh5ZS9uOXREMElaMHNKb3p6?=
 =?utf-8?B?d1pUTVp2bmJvRVVndTA4WlZxdFI2NFA2cFA1N2JiVGxxOFQ3K2Jka2YwTjBn?=
 =?utf-8?B?dDJKL2RnZzlzV2htNjlCeTJkNWovN0ZOT0pjcWcvNk9aRGhGeHBoMnhUWDNn?=
 =?utf-8?B?UzJlVGM4cEdJZDkyQlBtR2gyaDRrVmdGc3JOSkhmcjdZTHpORVJiaUtHeVo3?=
 =?utf-8?B?THpWYUpmNHRsdDZrUURkZm5EdHJXL3d3RXFpUlpEZmZ0aC9TV01Hd0g5cnBQ?=
 =?utf-8?B?M2k5RmdYTTVwZFFIYnZYeTZFZGNoTndkT2VqWnljMm1HcFlua1BGY2E2UDdC?=
 =?utf-8?B?aGVPZFNaaFEzTEt2ajJUcUNmTUVuMEx0WktMdjBBdytNd0pyZUVBT0xjSkRo?=
 =?utf-8?B?Sm9JampGM2hQdGJkOXhkL3d6cEpGeTVtbnVTOHlEWkUzcW5SRnhrR0ZNQWN2?=
 =?utf-8?B?OHpyVlRlOVNyTzFKcXVrWS9Lc0NteVZ1bGxFQzJvdmxSbnZ0Z0V2SWorT1Vz?=
 =?utf-8?B?OWVxQkhZN0ZpTTdQT0d3d1NjU1hMYzljOEtSVVNHRno0dEg4dDFVcDRPQnFr?=
 =?utf-8?B?UkNxcUc2ZE4xWUZFbDVWTEtpcnRYNVV2RUNvQWhHYWthN1g5YWZnTE1LQ2Yx?=
 =?utf-8?B?RGZNVzJrcWpGUDRTREZ5NFNkVUptbTQxK2NSLytCRENpVnpUeGdlbWRBMExC?=
 =?utf-8?B?VzJZMC9iUmpVdHVOTU5VWDRpZ0M5blk1RURrN2lWcTY3ek10SWV6aml0TVRW?=
 =?utf-8?B?NXNQaTlVNUJBUnFKdTZCbFJLMnpqSVRXV3ZmNncxV2RpT2tlSFoyNitxVnBn?=
 =?utf-8?B?UGJZOWVLWE9uYkI1MkNoa0VOWkdWSHFlbFNlZk10T1RHU09VUnBCWFZFT1ds?=
 =?utf-8?B?RXNEc1lUMHpnL1Bab3BwcDJwWDc1RlBCWGEvZklHWW5oZkNWaFl2VmorSjk2?=
 =?utf-8?B?MlplTEE0NDFNTURCbWxCV251WlcrejYvSUE0d1BWaVBCT2RacUJBN01ESWEz?=
 =?utf-8?B?TE1rYlUxRlpvQ1JkZ0ZZZklXeGQvbjRSVXM1MHRsY0lTQU1pR0NrZVNBNUg5?=
 =?utf-8?B?bXQybjF1OEFpTHFLNWYvQnRHM0NFdGtKOWVXU1J1d2ZkNXROamxXRTR6Z2JL?=
 =?utf-8?B?TXM4T0xhak1rOUNUcTNuRUEranhXUlBHRkFGd1NRaHc4THE0Tkp4TmNMWkF5?=
 =?utf-8?B?c2g0NFYzY01ob0M3cFVGaTN4N21BZzR6UnpsWGtTUWtJZXRpaC85b05CMXhH?=
 =?utf-8?B?d2NpUlFEL3lNTXd4OVN6d21rWEVTYTBRaFJ3dmtmZVRGNDRLQXdOOXg3ZEZH?=
 =?utf-8?B?bGw4dDIxSHZlb25STE03bEpzTkV3SnVZT0VjdnFUTXRScFV1TzRxZzdrUkVY?=
 =?utf-8?B?NXFleWREV1ZITzZaSURBS1pnZVhqVGZ4V3FkclpjRVJoWGRsMXN0L0JySS9O?=
 =?utf-8?B?QzE5b29CNzZsWTFEMkxGRDl0TG5pK3ZMUlZPSjIybUNFMEIwRXM1MnJOQStJ?=
 =?utf-8?B?SFVUT0dSUjZ5MHlPR21XTDZzWFN5Mi9DSjN1d0ExOXE5TUpOWDYxNzVxKzdX?=
 =?utf-8?B?MU5xbXQrZlVoNTJHM1NkckJKSSt1Yk5IeDArMFZkTzdIYmRWd0RPblp1RDQ3?=
 =?utf-8?B?c0UwVzc2TWR3a0RyM1lSeldTa01vTTd2Q044S0o2dUx6N1ZzZUk3VDE3aXNN?=
 =?utf-8?B?cUZiVGR1YTRWSlU4YWdid0RnUmJNdXk4ZVk2VExhQ3pTNXNaNnNxeTJKTE9i?=
 =?utf-8?B?dThXUUlqZWJnd09BNFhjSlpMWWNQbnBSbVRETnV5WWk1MVloRGhoMU5wVDl4?=
 =?utf-8?Q?cLy3zETuFPWUz0Kh0OHLWjHbjxxQ4HVdaSgOjeUttKSuN?=
X-MS-Exchange-AntiSpam-MessageData-1: 1vrOvGGkWNBESg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f64dd3-6095-4898-cde7-08df0ca08e59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 05:26:23.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMy+L4N+F1iA5DmBP34fMBuoJd4/ysTq+zGKOwXW76tJJ3NJ7YLpOZu24Xgbf0eZAu654xh53ZFxvo1ErpBfgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
> tree's enable bits, or in the rearm. Every one of those failures looks
> the same to the driver: no interrupt arrives, and nothing in the symptom
> says which one broke.
>
> Add an optional probe-time self-test that injects the CPU doorbell
> through the GIN software trigger. One injection would pass even with a
> broken rearm, because the first message-signaled interrupt arrives
> whether the driver rearms or not. The test injects twice, and waits for
> the first handler to rearm before it injects again.
>
> Run it before GSP boot on a quiesced tree, and fail probe unless exactly
> two deliveries arrive, each delivery finds only the doorbell pending,
> and the leaf ends clear. Under MSI-X the injected subtree has its own
> table entry, so the delivery exercises that entry too.
>
> Allocate the PCI interrupt vectors alongside the GPU's other resources
> rather than in the test, because the vectors are allocated once for the
> whole PCI device rather than per handler. The test takes the vector for
> the subtree it services.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig               |  15 +
>  drivers/gpu/nova-core/gpu.rs                |  25 ++
>  drivers/gpu/nova-core/irq.rs                |   9 +
>  drivers/gpu/nova-core/irq/doorbell_test.rs  | 301 ++++++++++++++++++++
>  drivers/gpu/nova-core/irq/interrupt_tree.rs |   2 +-
>  drivers/gpu/nova-core/nova_core.rs          |   2 +-
>  6 files changed, 352 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index f918f69e0599..7198fae6b6f4 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -15,3 +15,18 @@ config NOVA_CORE
>  	  This driver is work in progress and may not be functional.
> =20
>  	  If M is selected, the module will be called nova-core.
> +
> +config NOVA_CORE_IRQ_SELFTEST
> +	bool "Nova Core interrupt delivery self-test"
> +	depends on NOVA_CORE
> +	help
> +	  Run an interrupt delivery self-test during nova-core probe. It
> +	  injects a known vector through the GPU interrupt controller's
> +	  software trigger and confirms the interrupt reaches the driver's
> +	  handler, validating the PCI interrupt path from the GPU to the CPU
> +	  with no dependency on GSP firmware. The result is printed to dmesg.
> +
> +	  If the test fails, the PCI probe fails and the driver does not load.
> +
> +	  This is intended for driver bring-up and for debugging PCI, MSI, or
> +	  passthrough setups. If unsure, say N.

With the PRAMIN series merged, there is now a global
`NOVA_CORE_SELFTESTS` Kconfig option - let's leverage it.

(see also if the added assertion macros are useful for this test)

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index e1ac8ee9ba4d..8a9bc4baf9ac 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -29,6 +29,7 @@
>          Gsp,
>          GspBootContext, //
>      },
> +    irq::SubtreeVectors,
>      vgpu::VgpuManager, //
>  };
> =20
> @@ -292,6 +293,12 @@ pub(crate) struct Gpu<'gpu> {
>      /// Must be kept declared *after* `gsp_resources`, as the latter's `=
PinnedDrop` implementation
>      /// requires the sysmem flush page to be in place.
>      sysmem_flush: SysmemFlush<'gpu>,
> +    /// Self-referential borrow of `vectors`, so this does not have to b=
e repeated in the
> +    /// constructor. Will go away with self-referential pin-init.
> +    vectors_ref: &'gpu SubtreeVectors<'gpu>,
> +    /// PCI interrupt vector allocation. Dropped last (struct field drop=
 order).
> +    #[pin]
> +    vectors: SubtreeVectors<'gpu>,
>  }
> =20
>  #[pinned_drop]
> @@ -330,6 +337,12 @@ pub(crate) fn new<'a>(
>          let dev =3D pdev.as_ref();
> =20
>          try_pin_init!(Self {
> +            vectors: crate::irq::alloc_vectors(pdev, crate::irq::SERVICE=
D_SUBTREE.into())?,
> +
> +            // SAFETY: `vectors` is initialized above, lives at a pinned=
 stable address, and is
> +            // dropped after every field that uses `vectors_ref` (struct=
 field drop order).
> +            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref()=
.get_ref()) },
> +
>              spec: Spec::new(dev, bar).inspect(|spec| {
>                  dev_info!(dev,"NVIDIA ({})\n", spec);
>              })?,
> @@ -347,6 +360,18 @@ pub(crate) fn new<'a>(
>                      .inspect_err(|_| dev_err!(dev, "GFW boot did not com=
plete\n"))?;
>              },
> =20
> +            // Validate the MSI interrupt path before booting GSP, when =
the self-test is
> +            // enabled. This runs on a quiesced interrupt tree with no G=
SP state present, so it
> +            // never observes or clears GSP or PRIV_RING interrupts.
> +            _: {
> +                // `vectors_ref` exists for the self-test below, which t=
his configuration omits.
> +                #[cfg(not(CONFIG_NOVA_CORE_IRQ_SELFTEST))]
> +                let _ =3D vectors_ref;
> +
> +                #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
> +                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.=
chipset, vectors_ref)?;
> +            },
> +

The placement here looks a bit off to me. We are creating the vectors
earlier than we need to, and there is a significant issue with passing
them to `run_selftest`. I'll come back to this in `run_selftest`, but
long story short, the `vectors_ref` argument will go away.

This means that you can now do what the PRAMIN series did and run the
selftests from `driver.rs`. Unfortunately you cannot use the same
anchor, as the PRAMIN tests need to run after the `Gpu` instance is
created to obtain the VRAM regions, whereas the IRQ tests are the
opposite and need to run *before* that. So I guess the right anchor will
be right after the `bar` is created, and you'll need to create a local
`Spec` to extract the chipset from, which is no big deal.

Although we may want to check whether the selftest requires
`wait_gfw_boot_completion` to have completed, and move that one out of
the Gpu constructor as well if needed?

Regardless, as a consequence of the selftest acquiring its own vectors,
the creation of `vectors` and `vectors_ref` can also be deferred to
patch 12.

>              // Initialize this early because `gsp_resources` depends on =
it.
>              sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?=
,
> =20
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index f6ba883d72c5..f44897692b74 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -8,6 +8,8 @@
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
> +#[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
> +pub(crate) mod doorbell_test;
>  mod hal;
>  mod interrupt_tree;
>  mod regs;
> @@ -25,10 +27,17 @@
>  use crate::num;
> =20
>  use interrupt_tree::{
> +    GinVector,
>      Subtree,
>      SubtreeSet, //
>  };
> =20
> +/// The subtree nova-core allocates PCI vectors for.
> +///
> +/// Every source nova-core services latches in this one subtree, so a si=
ngle allocation covers all
> +/// of them.
> +pub(crate) const SERVICED_SUBTREE: Subtree =3D GinVector::new::<129>().s=
ubtree();
> +
>  /// The message-signaled interrupt type a vector allocation obtained.
>  ///
>  /// nova-core allocates MSI-X or MSI and nothing else, so the level-trig=
gered INTx that
> diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nov=
a-core/irq/doorbell_test.rs
> new file mode 100644
> index 000000000000..a232a83b62f6
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Interrupt delivery self-test, driven through the CPU doorbell vector=
.
> +//!
> +//! Exercises the whole PCI interrupt path (GPU to PCIe to CPU to handle=
r) with no GSP dependency:
> +//! it injects a known vector through the GIN software trigger and confi=
rms the handler runs. Two
> +//! interrupts are triggered one at a time, which also covers the rearm =
that every delivery after
> +//! the first depends on. Gated behind `CONFIG_NOVA_CORE_IRQ_SELFTEST` a=
nd run before GSP boot, so
> +//! it never observes or clears GSP interrupt state.
> +//!
> +//! See `Documentation/gpu/nova/core/interrupts.rst`.
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
> +use super::{
> +    interrupt_tree::{
> +        GinVector,
> +        LeafEnableGuard,
> +        LeafMask,
> +        Subtree,
> +        TopEnableGuard,
> +        Tree, //
> +    },
> +    SubtreeVectors, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset, //
> +};
> +
> +/// Fixed vector for the CPU doorbell.
> +///
> +/// The resource manager pins the CPU doorbell to this vector on every s=
upported chip, so nova-core

In general we want to say GSP-RM instead of "resource manager" for
precision.

Though actually it looks that contrary to the GSP vector, the doorbell
one is hardwired - which is what allows it to be used before GSP-RM is
running.

> +/// uses the constant directly instead of discovering it at runtime.
> +const DOORBELL_VECTOR: GinVector =3D GinVector::new::<129>();
> +
> +/// Subtree carrying the doorbell vector, and the only subtree this test=
 services.
> +///
> +/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the=
 subtree it enables and the
> +/// handler together.
> +const DOORBELL_SUBTREE: Subtree =3D DOORBELL_VECTOR.subtree();
> +
> +/// Time allowed for each of the two deliveries to arrive.
> +const DELIVERY_TIMEOUT_MS: time::Msecs =3D 1000;
> +
> +/// Interrupt handler installed by the self-test.
> +///
> +/// Services the doorbell the way a notification source is serviced: it =
clears its own leaf bit and
> +/// rearms PCI interrupt delivery, leaving the rest of the tree untouche=
d. It records the leaf's
> +/// pending bits seen on each of the first two deliveries and signals th=
e matching completion.
> +#[pin_data]
> +struct DoorbellTestHandler<'a> {
> +    /// The interrupt tree, which carries the borrowed BAR0 that registe=
r access needs.
> +    tree: Tree<'a>,
> +    /// Signalled by the first delivery.
> +    #[pin]
> +    first: Completion,
> +    /// Signalled by the second delivery.
> +    #[pin]
> +    second: Completion,
> +    /// Count of deliveries this handler has serviced.
> +    irq_count: Atomic<u32>,
> +    /// Doorbell leaf's pending bits observed on the first delivery.
> +    first_pending: Atomic<u32>,
> +    /// Doorbell leaf's pending bits observed on the second delivery.
> +    second_pending: Atomic<u32>,
> +}
> +
> +impl irq::Handler for DoorbellTestHandler<'_> {
> +    fn handle(&self) -> irq::IrqReturn {
> +        // Clear only this handler's own bit and leave `TOP_EN` alone. A=
 full walk disables and
> +        // enables the tree, which produces a delivery edge by itself an=
d would hide a missing PCI
> +        // interrupt rearm.
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
> +        // Rearm before signalling, so delivery is possible again by the=
 time the waiting thread
> +        // triggers the next vector.
> +        self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
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
> +/// Everything the running self-test owns, torn down in declaration orde=
r.
> +///
> +/// That order is what every exit path, including an early error, needs:=
 disabling the leaf stops
> +/// new deliveries, dropping the registration runs `free_irq()`, which w=
aits for a handler still in
> +/// flight, and only then are the tree's subtrees disabled, so a late ha=
ndler cannot rearm them.
> +struct SelftestResources<'a, 'r> {
> +    _leaf_guard: LeafEnableGuard<'a>,
> +    reg: Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>,
> +    _top_guard: TopEnableGuard<'a>,
> +}
> +
> +impl<'a> SelftestResources<'a, '_> {
> +    /// Returns the registered handler.
> +    fn handler(&self) -> &DoorbellTestHandler<'a> {
> +        self.reg.handler()
> +    }
> +
> +    /// Disables the doorbell source and waits for a handler already run=
ning on another CPU.
> +    ///
> +    /// On return no further delivery can reach the handler, so its coun=
ters and the doorbell
> +    /// leaf hold their final values.
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
> +/// Quiesces the interrupt tree, registers a temporary handler, and inje=
cts the doorbell vector
> +/// through the GIN software trigger twice, one delivery at a time. This=
 validates the PCI
> +/// interrupt path from GIN to the ISR without GSP firmware, including t=
he rearm without which only
> +/// the first interrupt would arrive. The handler, its IRQ registration,=
 and all tree state are
> +/// torn down before this returns.
> +///
> +/// # Errors
> +///
> +/// `EINVAL` if the doorbell's subtree is not one nova-core services. `E=
IO` if the doorbell is
> +/// already pending before the test, if the delivery count is not two, i=
f the doorbell bit is still
> +/// set once the source is stopped, or if either delivery found a pendin=
g bit other than the
> +/// doorbell. `ETIMEDOUT` if either delivery does not arrive within the =
timeout.
> +pub(crate) fn run_selftest<'a>(
> +    pdev: &'a pci::Device<Bound>,
> +    bar: Bar0<'a>,
> +    chipset: Chipset,
> +    vectors: &'a SubtreeVectors<'a>,

So here is the problem with passing `vectors`: the vectors created by
`gpu.rs` correspond to the GSP interrupt, while the selftest uses the
doorbell one. By pure coincidence they happen to be on the same subtree,
so the test receives the interrupt as expected, but that's just luck
and we shouldn't rely on that!

`run_selftest` can and should create its own (accurate) vectors and drop th=
em in
the end so the GPU driver takes over afterwards. It's just one extra line:

  let vectors =3D crate::irq::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?=
;

And with that you can also make `Tree::new()` take a `&SubtreeVectors`
instead of two `msi_type` and `serviced` arguments, making the API a bit
more consistent.

> +) -> Result {
> +    // The interrupt type decides how the handler rearms delivery, so th=
e tree takes it from
> +    // probe's allocation.
> +    let request =3D vectors.request_for(DOORBELL_SUBTREE)?;
> +    let msi_type =3D vectors.msi_type();
> +    let tree =3D Tree::new(bar, chipset, msi_type, DOORBELL_SUBTREE.into=
())?;
> +    let doorbell =3D DOORBELL_VECTOR.leaf_index();
> +    let doorbell_mask =3D DOORBELL_VECTOR.leaf_mask();
> +
> +    // Under MSI-X the subtree index is also the table entry the deliver=
y arrives on, so a pass
> +    // shows that the per-subtree routing works. Under MSI every subtree=
 shares one entry.
> +    dev_info!(
> +        pdev.as_ref(),
> +        "interrupt self-test: starting on vector {}, subtree {}, with {:=
?}\n",
> +        DOORBELL_VECTOR.into_raw(),
> +        DOORBELL_SUBTREE.index(),
> +        msi_type,
> +    );
> +
> +    // No delivery may reach the CPU before a handler is registered, and=
 a vector left enabled by
> +    // boot would fail the pending checks below. `drain` leaves the top =
level disabled.
> +    tree.disable_all_leaves();
> +    tree.drain();
> +
> +    // A delivery can be credited to the trigger below only if the vecto=
r starts out clear, so
> +    // refuse to run otherwise.
> +    let pre_pending =3D tree.read_pending(doorbell).vectors();
> +    if pre_pending.contains(doorbell_mask) {
> +        dev_warn!(

This is an error so this should be `dev_err`.

> +            pdev.as_ref(),
> +            "interrupt self-test: failed, vector {} already pending (lea=
f[{}] pending {:#x})\n",
> +            DOORBELL_VECTOR.into_raw(),
> +            doorbell.get(),
> +            pre_pending.into_raw(),
> +        );
> +        return Err(EIO);
> +    }
> +
> +    let handler_init =3D try_pin_init!(DoorbellTestHandler {
> +        tree,
> +        first <- Completion::new(),
> +        second <- Completion::new(),
> +        irq_count: Atomic::new(0),
> +        first_pending: Atomic::new(0),
> +        second_pending: Atomic::new(0),
> +    }? Error);
> +
> +    // Register the handler before allowing any source to fire.
> +    let reg =3D KBox::pin_init(
> +        // SAFETY: the registration is owned by `resources` below and dr=
opped before this function
> +        // returns, so its `Drop` (which calls `free_irq()`) always runs=
 and the registration is
> +        // never leaked or `mem::forget`-ed.
> +        unsafe {
> +            irq::Registration::new(
> +                request,
> +                irq::Flags::TRIGGER_NONE,
> +                c"nova-core",

Let's use `c"nova-core-selftest"` to differentiate from the driver's actual=
 registration.

> +                handler_init,
> +            )
> +        },
> +        GFP_KERNEL,
> +    )?;
> +
> +    // From here every exit must tear down the source, the registration,=
 and the tree. The fields
> +    // are initialized in the order the hardware requires, which is the =
reverse of the declaration
> +    // order that tears them down: the handler is registered above befor=
e either source is
> +    // enabled, the leaf next, and the top level last.
> +    let resources =3D SelftestResources {
> +        _leaf_guard: reg
> +            .handler()
> +            .tree
> +            .enable_leaf_guarded(doorbell, doorbell_mask),
> +        _top_guard: reg.handler().tree.enable_top_guarded(),
> +        reg,
> +    };
> +    let handler =3D resources.handler();
> +
> +    handler.tree.trigger(DOORBELL_VECTOR)?;
> +    let mut completed =3D handler
> +        .first
> +        .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIM=
EOUT_MS))
> +        .is_some();
> +
> +    // Trigger the second interrupt only once the first handler has clea=
red its leaf bit and
> +    // rearmed, so the two cannot coalesce into one delivery and a handl=
er that never rearms
> +    // cannot pass.
> +    if completed {
> +        handler.tree.trigger(DOORBELL_VECTOR)?;
> +        completed =3D handler
> +            .second
> +            .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY=
_TIMEOUT_MS))
> +            .is_some();
> +    }
> +
> +    // Stop the source and wait out any handler still running, so the va=
lues read below are the
> +    // final ones.
> +    resources.quiesce_source();
> +
> +    let count =3D handler.irq_count.load(Relaxed);
> +    let first_pending =3D LeafMask::from_raw(handler.first_pending.load(=
Relaxed));
> +    let second_pending =3D LeafMask::from_raw(handler.second_pending.loa=
d(Relaxed));
> +    let residual =3D handler.tree.read_pending(doorbell).vectors();
> +
> +    // The self-test runs before GSP boot on a leaf that `drain` has jus=
t cleared, and nothing
> +    // triggers the vector after the second delivery, so each delivery m=
ust find the doorbell bit
> +    // and nothing else, and the leaf must end clear.
> +    if completed
> +        && count =3D=3D 2
> +        && first_pending =3D=3D doorbell_mask
> +        && second_pending =3D=3D doorbell_mask
> +        && !residual.contains(doorbell_mask)
> +    {
> +        dev_info!(
> +            pdev.as_ref(),
> +            "interrupt self-test: passed, subtree {}, {} deliveries\n",
> +            DOORBELL_SUBTREE.index(),
> +            count,
> +        );
> +        Ok(())
> +    } else {
> +        dev_warn!(

Here also we should use `dev_err` imho.
