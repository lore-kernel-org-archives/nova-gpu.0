Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0E17DFFA
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863615; cv=fail; b=ZukGB79l10x9t0xA5RpEDnWM9U+YCM3trL8GOZFGrzt5KojMFpnK18DHQgKyDwl9zBYEfnOxpqQyhWCG36BaY4oSUpU6IO4u9EyIvDD+qHtml8GvCI8I0iG8qCXU4LlGgzPbClcAXWWnuPi//8/fCk4t2eY41K3dkHWBo8VaaNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863615; c=relaxed/simple;
	bh=7OScRDFe3v6Wz5ObFG8JFDfPVbQnZhJoQOGhWhPe9yY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AD+iDQWxiYz4ssHLJ80SrdgaLxGNn0/emO06rV5tdTuV38PgRrV9tFOvFVCZtfbORr5QrbrvBAQ5FAlgrZzrcwlKWyZNj45F8LMhiJxqjHbZe7NcKOqWgOQzShVJy3BYEv/IgqpN2yEU37t9MrGG6aCBBi7l8KWJ4nK2pnJ7cIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dBadmdyY; arc=fail smtp.client-ip=52.101.57.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dBadmdyY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obV81c04wguvqZMrUb/Rco8akTQwW0sytlpXlwomjngLwxXVFmngnE/wFOJ+9YxDYdMR0hrBFuYRU8DJ3NWNUVZqgID4E/B3L10jWr+4Kua4Dk6Hp0gKMA3u051ZYySDrvFuriX0EZ+9vwfVxQvtlrKFFc2aEPg8e88TDFxdplNuJEGKbKPxFXTc23iEAiOyPzKIGRy9AvTmGm9Su+zeJwJNz6oTahm0URNAkqovOSAY/81vfqx+8/UZmEulkI3mInRig9GGWkLnzgnqdl4cnkTPsOl2+Vt7fKp5X6K9qxAwxrFXaI/FQcHYo2Yomft3+Djb/ioiBZVHMIL/t3Pqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OScRDFe3v6Wz5ObFG8JFDfPVbQnZhJoQOGhWhPe9yY=;
 b=gdJtdpaPKBxsyzYAriJYHi9/1OXJIwRx10p13AGD7OhWqmH3Y24OMvnE3DG/kbUeCGcxnMX6nnSHiJSCQH3DE0/m07RrUI94UEjDDGSlaeR4wqM5wFrO1Hg/rwQBXnGBGGz/UjhviVehGdcpFXYuZFAzxNHrZw1ZQczKRUnG7yDa07yrn1fdly7jUYTLE85avRROa+ZhNlRf6NkfLUz06qg+z46P2ybuJap7zDqiS1NxIkQz+GUDx/GMG//Z0UK1XyLLNJn7Mm2Z29N5HCEarA1RQ2B1XXHR01uYHDDVLrll8czWVM1VPvZFmMHyir8Y+1bc7du/nA9vTf4iOzT9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OScRDFe3v6Wz5ObFG8JFDfPVbQnZhJoQOGhWhPe9yY=;
 b=dBadmdyYgcHN01UoPm9/HuJXnx8xVN6M1z03WQzIPUPrdPEE1Yfl0DIAInu/Bqsku07YmQvdZ7LqPRXjpPbGSwpnHgmELNGBeAmxK2gEcqnYQRdClSvAWy5ylz5FzVwlaz/6mD+TnMONtcU4sfskWRlKX5ySwNNc2cviRlOtKGqcmL22DbJb3blHawNAfcEgEpK+qv6HP5TKKFmU5u+hYoeJKNCHH4+viClNbeNu8qm41yxDkWuvA+nr+krtMmxmafP2US0VBTv39PzvdjSVNLXz4LQUUKfAXb9i6HvXnKfSyDehLxfTQpGjyk3HtwQhX5e10E3Wp1CfZqCHn8f1jg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:06:45 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:06:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 23:06:41 +0900
Message-Id: <DLTK5WY2S61J.OHM7AVTC58FB@nvidia.com>
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
Subject: Re: [PATCH v5 01/15] rust: pci: declare IrqType and IrqTypes with
 impl_flags
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-2-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-2-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 838dd0cf-ae5c-4caa-0af4-08df1fc539ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zzfUhCqTVdEqUtAYy5p+wFz/QwX0Lx4QLR0Ffg/dD3ahvWriIU3TME/+vlr0IyUWMwlbC5IIkBrPTzvu5GrI6ETHpEWsZ7o3myJCIneqT/uVy/te/RuMC4MrTzHacxVtaTPKDNcuemyt3nkuaPmRJ8vEkOmgs6S42e1GpGsTCHwkEhLsPJ5gnaOe4CJ0lHguEDXGiajlrDzodlqZtP2IuD581OixjxiRaCg5oFm4IsD+n6LhWWdNP/oIBFX1YsfGAQVKYO7HUPgMPjNl2pYYq+GvGssROgXIcTU9IQ4gLGv3kZqBdUSa9oJtULMexPxlwxrjBvwDadOOaw7LaoFhoTMDQcBEJDGLGNMAf6YHCf7J2rlTG1dgVhY3ofqiUIGnRiUatjD7ekzDW2Q3TJ6iKokfMF46IlmSfWQ9VfYgrGDgzLu6mujoY7BJUjWFgHyrvGM/xrlJzJ9arZiQ9Rte2X7eV2I17NsJlW2ktiKZ3nzn3cP/RWB99SMBkvLQxHopw+u3g/BhoADkDfZfOPIqzNha7z8KFybFlZ5UNlUtBW259y1hT4VOFqRR5H7TOME76YNmefELrdM43vU+wYwwpHFzsGpX8IR+aZgjxyWXxYT0CJK/sjMn+HJACUolHVByi7SOR1u044aZpJtZSWwMBVFTUsVDheyS6+ATC1RvT0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRqbzhSYmpqcUY5Skd6Wllpc3V3Z2daY2FEU1FXc3RzaE1pOGtnZVVvWnZM?=
 =?utf-8?B?VEVzclRuUHkySFJjTmRZNG5vbkwrdnp4YVBRSFVCamZxUFFLWWpvWGRvVE4z?=
 =?utf-8?B?R20yYWhzeWVaaEoyN2NuNFNoT2draUV0VVZRTUNYSFp1Ym1IemJXM3BwOUdO?=
 =?utf-8?B?bkhORGxvWDNVTFZuK3p5RkFVT3B6SVpkbVFIeUltcGMzS3ZUK2tJUSs3VWU5?=
 =?utf-8?B?NExmRkNFYnJvZXVETGtVRUNYckFnK0tFTFI5d1JlTHdDOTVIN0N5OE1IVGgz?=
 =?utf-8?B?MEdvUml2WDQvbk5wNWJVY2tham9mOFY1WSsweUgvdk1IZlFOMjVrOFpOY2lj?=
 =?utf-8?B?eDNQZ3FIeDJUWUxFSVpPUlB2UENRTk9tMWZsRk5yTGxWak5XdzRPeGhIWm9V?=
 =?utf-8?B?ZWFmT080K1RCSmo2VHNqYVJMTTl6VjZYWS9VeFFYOXRZcnNEK291UGNvYXlC?=
 =?utf-8?B?UzBPd3JjcVdyK1doYnZ0RFFscVZYS1dteFd6QXJpMExlbnNCdk1QcC9jc2kv?=
 =?utf-8?B?SXQyUlc5bTM1MWxUYm05N0pXa09EaWkrd0dxRHE5UnU1NjJaVlI1STZGTjUv?=
 =?utf-8?B?REl4a2dlMkhndVIwN01DcnRzS2NOV1pCMTBjdlpUSnhSOHBLYk9XUEhPaVpJ?=
 =?utf-8?B?NWRTZDAxZ2taVG5hZmpEZ05ONndIQ3VqbmxlbFVDUHhGNTV0Y0NodXBORkZP?=
 =?utf-8?B?eHJrTzVlUURzeWk3SGVWQkxWdGdwQUhYMURtbnlMWUFWS1hpaEhPaUhmMWho?=
 =?utf-8?B?S3lKWHRhdHB3MkIrWlRZREJjRHh0RWxkOS9FbVFNRTFyRXA2NUM1dWZjUnp0?=
 =?utf-8?B?eExxenhuTFNSbWJaK05FbnRNMTZxa3ZOWkVBdGZjU2RWbkNQaCtVSUlrT2Rk?=
 =?utf-8?B?aDg0cC9LbWtkbXoxNjRrb0NhcG8wa282Sjh5K2dHRm41bTVYcjNEekk4RE1x?=
 =?utf-8?B?eTk1VlVGR3RBcFZUUU5lQTh4aTI0V2ZPYVJQcnN0blJRcXkxeWlob0N4REp4?=
 =?utf-8?B?UnQydS9HaGRpa2ZBY1Buc21iWFFjNWpUS2hGcnRVMHlTM2V0Z3JoaEVET3Nu?=
 =?utf-8?B?Q3E2RDI0M3hjdFJRZnBrL1NJdXB0RC9KOFFxdjhLdE11SXRRSjRNMTMxWWpS?=
 =?utf-8?B?a3JxMEFnZiswQ0tZRXJNVGRKVkN2cEhSQmlLaUN6bUNMMG1GY1Ribnl3NG5i?=
 =?utf-8?B?ZzJTRElVL1E3U1d6V2cvMG1vMmZqM05rS20zL1VwLzJVWFgrRFF1TEFEMDY4?=
 =?utf-8?B?T3JSSU1PZlp0Mlp5SVhoV3dKU3Q3L3QzMnlWWHd5L3Z2SEtKYXByWGhid2FN?=
 =?utf-8?B?ZHRCMk5DNTM1TnpNbTdpZmJvUlphcmo3cGNWR0IyOU0vY2FOaEMraDAxK085?=
 =?utf-8?B?djlqME13WjRDMG11MVk2Q3lnaW9mOERMUHZwbGlQTlpvb1RmOVo3dUs5SVJ3?=
 =?utf-8?B?MHdBVDJNYzR6Z2NCV29WSDZPblV1czVsNjNOalhVV2NFcmRkc2JrbGpQK0t2?=
 =?utf-8?B?bWNzNTdDWHVMK3ZlSVc3ZUNISFczek1pcjRXTkU0clBucGFyblV2M2JPUGx1?=
 =?utf-8?B?bkZBZU9BS2IxR1RBUERFb2ZETG9rdHNvRWRvbkNxYmxLbUczY2J0WW9WK0Zk?=
 =?utf-8?B?NE5tUnVQRzRnTFhaeElTY3NHMmdINHUyZ3Z4N256LzFLYnJ5dmNqUjMvYmpP?=
 =?utf-8?B?NEpQclZzbzVJRFMxdytseVJ1eE4rbnZiU0h3YXRFRmlIQmpyRlNQL1k4QWVL?=
 =?utf-8?B?RGNyanVYeERvVFAvRW9sR3V3RjRtYjdNTzAzWHhMZEs0OHlRREFWQnIzdXND?=
 =?utf-8?B?RWowZ3RGLzZYSk93b1VtNktEUDQ3dE5hdFVCcS9qRzJkcFIrZWlBbU0rSDBY?=
 =?utf-8?B?WmxuWWxpMnpZK2NOVGdlUmhrdjN5V0M2VXBieFh0Mmw4NG9FMXRJZnZSSmEy?=
 =?utf-8?B?T1FycHFqYzJKbnJxeWlBQVhBc0ZaaWJ5QUJFcWNMQjQ3M1hFK2NhVGlsTG01?=
 =?utf-8?B?b2xHelUwakIxN3ZHWEhCRWxIQ0xIVHZVTHFNUzNKVFdvOW1LMjBWUWFBdFAv?=
 =?utf-8?B?NFV5N2RQcHVuSVVHZ29UQnBVWlR5T3lZTXAyUVA5N29rbkRHTzBUREpzWkZK?=
 =?utf-8?B?SDVIdlBLVnl0eE9lRzBoQXByUjBEMHRhVXhIak1kYk1CZ3ljZDQ2UzUvc0lH?=
 =?utf-8?B?SU1jN3RIR3p4aU5WQ3FMZC9lODNlakVmZHdPd0dNcVZlMytpT3BEMHQ3bUtt?=
 =?utf-8?B?YzQvMG8zZXJMV2VJVnQ2RmlZR3hxUGdWQTZGS05nVVQ0Mk1GdjhMQVlqUTkz?=
 =?utf-8?B?TitZWDkvSGZoa2Z6L2Q1aGpaMXFEVFNBaEd2Vm1TaW9iTS9TS1ZhS1RvTE04?=
 =?utf-8?Q?dyVMomCHbcdmMYA3Vnq5H1Q9icb8mpxASDCz3yuHCtaaA?=
X-MS-Exchange-AntiSpam-MessageData-1: /RtOHFNuLQhYeA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838dd0cf-ae5c-4caa-0af4-08df1fc539ca
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:06:45.0159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txZMqXGPyMd/Sop5Irc4CjTZtaK6P8CgodhETc7Bg2pEPZO6ZbYaHSMCg3HOhos9zEBix15qK+dIqkpzleNpdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

On Wed Sep 30, 2026 at 12:41 PM JST, John Hubbard wrote:
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
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Danilo, is this ok if we take this patch through drm-rust-next?
