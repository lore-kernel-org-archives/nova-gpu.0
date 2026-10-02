Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C06233944
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947998; cv=fail; b=M+Vk6i2SP4vS+haDFC4T31HCOKq30uNJwPCkmOlqIYijL85vxfUp6eOc+J7hAMkerIAs546LusQtwzOM6uJk7S2VzbySE3qOLSu17kyoi+FnPpz3og6TX/dA8Li7dU/cjrG1FWTyo+FH/Sks6A4okOm205FW14ghX1vl6lnbiSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947998; c=relaxed/simple;
	bh=IeaRgxFUkkx+qEZemeVofa2QwzJvJeUO/J5m70jBNvk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mfj7KK2xODBkXHCPxmx+YZ9iT3WZFPUV3a9q2tBsDTCVH62abwstX9ooMtELz9lFXmyejPybXxkWjNWry2fmWs6heqO+spvf1dkvr3UdswqnyJRvsNhPxSyYH5BSwvfqDnRihvzK5EyXe2/jxbr1142lSrF4emkq3B1ohOSgWMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tt+aGFaE; arc=fail smtp.client-ip=40.93.195.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tt+aGFaE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0fZETKcr6Tb05ZCrLD1f7RWXb0k++5wlPM6oQD07yhkbHARyz5Qf1xwzfEHn9tZ4YQQ/fKOUp7GCCQweV//s+PeBnhgZ9rhyQ6XozfPaYmzlPL1KQZzwgIxlWh8eIZUe8eJbv+uaut3taIg9vZ4I8zM+92h04HcDdsdkeF6k096JbScOcqrYFYJlYPo3w7WKztJWh7HYISFIHkhPNgN8osLOG0kPio+Ss54JIVT3IBGN1KEemiFpcoCbyT68SGIuFX51jPA56s/UyoXRBMR6z7rnpO3m6aB+jSdF02GlDpLrX+6Fm9yTmeYBMCewwL5Y6gxv6LQnfJMPHAhgqYqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa7l+4G8AJieZcxOrHfki8T5YPjuZyarhIe6+v/78z8=;
 b=oM/3ve3YA7cMcPxNylF5CYf9v6ZSjnVORgUe1t5zGEcTBTmyV7M9yirhU5Kdo5RUqJqAyGP566HyV3/YpPBg/CIpQCyAXbFjuW+81N7zjR/Pf9t6W1NDOCZh1TwwwUW6dD+01YUSdvv/4fxqu8/MinygqFCcxljz4RntRwrJKwR0J9FrdP23kujN6fkgNhDwtnWVrh80YGbS3pcGFhR7FlcGJwsgNOOF8Tf6p9fxNJ7RJQxJjfIpDDmASlpqDPKNcwwVl6CdSbBhxyt/EZI2t8aahZBt/APoRJ/siOEsmsgnxbeHKJu/LA/oNV8fkh7Qsk6udxoL8cLiZoCtTpVRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa7l+4G8AJieZcxOrHfki8T5YPjuZyarhIe6+v/78z8=;
 b=tt+aGFaEKoxqX2wBUrbWZkl8gvT3dHxVlzF3tAOn1lt16Wv1GDubeAXSubx3OH1td3lB0IqIbmgz6CbckHMUzyBaoiF2XQ+txggenwLrDeEyERSe9LYC7J8dTjnfafJGrCKQfarDHCTjtHD8GmLXS6j/2RqL4UM4wHXV8KwtMgf2pFLHmtJWjdZm4NKpGJMEvZX8q/etQFl2+NL3//mxnkm1jI4CINDLdIP6M6DW8O1szgGH7dNpvKc33Pw5E/r07HFllWwyb7e826vZnLPMypyiU7YXs3yhVeHGBZ6z/O0bIIVu8tsgHK/AJutyN1y3wDQHptSs/okxq/kYfHTYdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPF8CAB220A1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:33:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 13:33:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 22:33:05 +0900
Message-Id: <DLUE2QC7OIL2.1YNWE6LUXAB49@nvidia.com>
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
Subject: Re: [PATCH v5 15/15] gpu: nova-core: document the GIN interrupt
 controller and GSP events
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-16-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-16-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3P286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f7::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPF8CAB220A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f62f9e-3dd2-4836-7114-08df2089b271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|23010399003|1800799024|11063799006|4143699003|22082099003|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7+aJL/dNRP3zOqMxeuCMdMgY86r24yGB8qsrSJcqfFg2veJPaIZ9P7HgoXojaSXDgLfki0DHig/PfhbQR9ohapzVzIT6eKrSikiUYTEXmZXh5+Oon8QPh9XLWwEGxNRlCOnzpKm9S6MwSRUlqoulRttgiVyJzmBikJzHvtDqhf+7o9aG6hEapyvzuBYN0ZtIDKfcjau1iy+nAcfRUO4cKuBYgUyuvXbMR0X9uNY+PG6Vs9oOWOeqAeEdhFIcibQwts/JTv08cYmtJW+pLALjN4cTs77xEdux376vlm7Rw9ZNpoyF2MYr7YCj6lDzJeOpvUs6DUFfwlmvcsJtdHoW74a2gCNnmr3OEq181Dg7hJKhTJZKkL3rJqpnfQskTHoplLdjUiJJb4Ud5z2D1osHqca7TDaCpOzaEAt7ZNC6NwIYFcw1JKE17S7VWuCHe8hAUJEBqiPW8ayxHbbIpSk7pWKSRc+9qyWqxESVnvlTPGAhODoYMRI4o0wNpP3NUUgGIRdntSSwyvhvuAokcts9xJV9y8RkMshSfZAaxgIUi5hThZ1RiV0n626/j2W7MQ4Vh2kfpOgQXlQi0SLPdl8RWvtIBQXxBV5SZFya9nEu743Pn6SqgOi1iHfSxFWXIsgYXhsyX6Jtb6leWyTUieItDuzpeJ/5n2aNHjGVZVDG3DA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(23010399003)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpHTDdROGJmVGdseVdSR0o2YmdMdlJ4MU1BR0huM3FaTlhnQTJNYml4eVdU?=
 =?utf-8?B?U2FkbEdZTm9leHRRT2ZhTVJrUzNqVWRVNGw0LzYyUjFWSUMzSjdoNzBmNTYy?=
 =?utf-8?B?SWF2cUpVREVkZVF5ZXd0bnppYkh5ZFRtSGlaaW1qZ2NHZnFGeWlSbEsvTlh4?=
 =?utf-8?B?RnE1UGMzRzRnNVErVjR1cDdPRWpWTWt0ZTVYc3EzUkxGN00wRURydTRzRnht?=
 =?utf-8?B?U0dwNi9ySFlhNkhaTjg1dm1wMnRhZDlCYjJFRHJyT0g4T1Bodk5DVmZSREo3?=
 =?utf-8?B?dUNELythcVFoSXgxQko3K3ZlLzhNTS9SQkFPV2NrdFFQbmU2VVBNSkNKbTdB?=
 =?utf-8?B?MnBmTldpb2twUkllb2F3bng1dFhwVFNyWldVRHBnbVZ3OUZuZUZIZGlCOXFG?=
 =?utf-8?B?bnFjcE1oUnc1UGNycEh2M1lFRXQxWVJOUm9TTTFsRXZPWldaaU5ZdWlHWXRa?=
 =?utf-8?B?c01YR3AzVTZ4R3lTZTB1bDhJaUZKVVhTcis0N0tTaTdoeFR4RERFSGt1K1V2?=
 =?utf-8?B?OHJPZGxxSHV3QVJTMkYzYXdJdElCc25KWW5yelYzWFZjSWZXUzdISWU0R0Vx?=
 =?utf-8?B?UFFpaHpnSmExSjE0bzFrbVNKdEppMHplVDE5dkpUUVhtY0J4dkxzNW82TkF4?=
 =?utf-8?B?d3B5TndHcnJBNHhXR1dES1h6dDVxQUZNNzcrYnlUVnZaMDJlM2lla1gxSWZ5?=
 =?utf-8?B?aVZ5dVkvVDBqYjJTUUhIcmQvbE5hOC8wYWRZWWt1dkZSUERVUVZXM0dlQ2tj?=
 =?utf-8?B?bytkdkhYM0VuaHdzU0haalhoTDRZa0VKTXVERVJSem1PRy9WckJKT3dTL21I?=
 =?utf-8?B?NHZXL2ZXTFJ0b0ZLdU5wdWUxSStENUdkWlJVbi85V3UyQ2VIQzBOZm0yRzRp?=
 =?utf-8?B?ZENXZFJnZXI0cklZc1ZodkJiTERWQ3I1bjQwQXBwQTFqeDlyZVRQQkdhRld4?=
 =?utf-8?B?V0NDbTRKNlJEZFJQeDkyL0g3Zzk5U1Q1RGxVNmhmTmVDaklsME9ETWxzN3B2?=
 =?utf-8?B?WDhKUEhwV2hxYzV5dTRKc1lsNzNLQ21BQ2t6MGZnWmNrNTBvT1h4azd4akdy?=
 =?utf-8?B?WE51dm03aDRnQlVuTElZeVVJRVJaR3FvbjhHbDZGMjM2bEZTUXY0dkZuWURV?=
 =?utf-8?B?R1p3MEZ1NU5NWDkvSkhkcXNoWUpGSW04S1FPdG4xam1wU2FRR29LMWRFSllV?=
 =?utf-8?B?Y0NxNVptRm1EL3dJb3luNzdhelNwdm45M05kN1YzRjljdUF4OXYyVjhEV3hh?=
 =?utf-8?B?WWhXMFlyU1BOUko3RVNxYWxRYWRNV0FLMWMwUUxUL2h5clFwLzkwY0FabTFY?=
 =?utf-8?B?UjRzb0pjM0dhZUVMbHRLM2Q5ZW9zbHhTLzZTaEs4NnplVGxEeUZLdzJiYWgy?=
 =?utf-8?B?dk8rcGNCVVJ5dkhtaEhoWmRYUTk0YStsK1g1OU03cmV5cnN5b0NtRDZCWHdY?=
 =?utf-8?B?SmtaR2dLU05hVkw5eHR4WmxHUTdjU3UwZ2NCT2VkV2VYTlFVdnM5ZkdCdEVX?=
 =?utf-8?B?dG1ZdytIaDcvTU1EZG9wWURYYTg3Tm9lQjZLdnRESTd1YjFDeFBMbVhkT0Vo?=
 =?utf-8?B?TzEyRU9SWTdQSGdjM2dVK09sV2ljeWE2cTBZc0Q3NEorRndxYVN6R1ZwblpM?=
 =?utf-8?B?TTBlQnNQSTRGd09KS1JQZFNIaytLdjUvUENUZ2RWUWpWbit5UzB3WGx0Tk1Y?=
 =?utf-8?B?UUhlVlJkd1lmbGVhcVBHMXQ2SytGaFpOc0VQTnUxREUvb2Qxa3RNR1VHMW5r?=
 =?utf-8?B?U2k3UzAvWFJrL2xpT2dLUHJ5eHo3ZC9QZExySWZ0ZFpzVTZEejExcXZYOWpw?=
 =?utf-8?B?MHhvL2VsZ0IzSFVYRmhvMFdLcWh5ZnFKMDRRK0FUL2JDSnF5RURWTThKWFhP?=
 =?utf-8?B?WjQ3SVBWaDQwQms4UnVETVVaYUNMK3NtNEhoUHFRWE9Kd3IrT2RnaWd0Q0l2?=
 =?utf-8?B?RUwvZnBweVlCRHVkN3lHR0xScUZEMlN3TXB2MW5KZEFJcSswbEFOaERURWJY?=
 =?utf-8?B?dzdicFN4VkFmNmIrU0lPelZFOTVDT0dxNHRJTFBMb2dKZG1WQSsvZWJnODNn?=
 =?utf-8?B?Z1lqQXd0MzFqclZiTkJJZllPdTYyNkhWa2Q1czY5WkFDaTZJRTh1NGFrdG8y?=
 =?utf-8?B?Nk1zWGlTbFFNUzA3SzhRV0RYWWhGczd3eE9GbFp4OXpFbW5XK0d2c3N3VEpS?=
 =?utf-8?B?cmo4VC83QTZDL0NhMnBuL2crTHMwcVp4aThDL1hjeU9seC9BdW04N1hQN2Vm?=
 =?utf-8?B?bFQxOHNXYTZwWmJPRW95YmNwYm1uVlhGQWtQVjRraUUwR3YvYXpzQ081ZUFG?=
 =?utf-8?B?dklFYWo2dEFla05HVWVFUEZaR0hsWWptZ05kTi85K2JoU2JGRFI1dStwdENP?=
 =?utf-8?Q?0ecSCi7g35ZX1/xzJ7KRMI0M6isf3WYoh4Iboi4eukJ2T?=
X-MS-Exchange-AntiSpam-MessageData-1: S/cO/Fd0ofGGwA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f62f9e-3dd2-4836-7114-08df2089b271
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:33:08.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbOgMosbxeZuB/99cXj0zMuIdknOZCR0M3+qNTnwNZLhDfaeMYl9bAwxTIDu50K7pcQgIKmn0oGO1zXWm0XVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8CAB220A1

On Wed Sep 30, 2026 at 12:41 PM JST, John Hubbard wrote:
> The interrupt code rests on hardware behavior that the code cannot show
> on its own: how GIN, the GPU's interrupt controller, records and
> delivers interrupts, what edge-triggered delivery requires of a handler,
> and how the GSP signals the CPU. Some of those requirements come from
> OpenRM rather than from the hardware manuals.
>
> Add a design document that records that behavior, the rules that
> nova-core follows because of it, and the terms that the code uses for
> it. The code comments cite the document by section rather than repeating
> it.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Documentation/gpu/nova/core/interrupts.rst | 679 +++++++++++++++++++++
>  Documentation/gpu/nova/index.rst           |   1 +
>  2 files changed, 680 insertions(+)

I took the freedom to remove the last 3 paragraphs because they read
like filler and didn't provide any useful information. The self-test in
particular should be self-contained (and mostly is) and describing it at
length here carries the risk that the code will eventually diverge from
the doc.

But the rest was informative. Maybe we can give it another pass later to
smoothen it further, but even as-is the document is helpful imho.
