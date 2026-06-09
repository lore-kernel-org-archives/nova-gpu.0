Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB233CF213
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985212; cv=fail; b=Rjnm0R8y5s3l+WkpCIN0Uc2avcn46nUHGCpvhGWOmjZGlbPazrmMnOQJj0Cj+mW7NdGrSs7bgpiTZngk4FWrl3mqAag5h29SCD6YU/QgqqohpRQ1LyIlgLaKTLCD9nID4s/9ckYBHnQQadv/me78ICdXyG6isT+MP9hLZ8x2LWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985212; c=relaxed/simple;
	bh=XVWgXZP8+rDJJCo1+G+1KSSiVkQ701U6p9QpfCcmNac=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=I9lyHXeDcuokKPKGEdFeY2uQZDnWYodMhtuzZR7Kwyejg8xjXd3/gxaAmT2x2XizSWz16rMqg6W/1fQlR9e8faR8OWnplLjwHxFTbvw1a0OOdX3hcpyWR9GaTV1BISYhpgO0jULG0K2TXtldLQiKxLe7zlWPDVxArY38GBamqKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k2jUNP81; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k2jUNP81"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4k+XpbPPyLvWwCe3q9XtNQmMZ23IRLweQbM3GueLo+nF9ed2bJU+Qn1eZiP0fyuipHyopkLJNSK1LoD1oxUwsD1I53gSvlSWuPo0sJ9WlJXZau24p84OtTz8GWnm6nuPoOy9TKg4I9LTPyjFgFK6mHPvbIGGZhs6sKTuJcrX7QN6fsKh4bwH1gPsXm1lufkUh581TBw0QcrO+7AzR+yuYM0kpjYrqeTbpkdpKzM5GLVEsChXt4+AA8DdMon4HMMZ1iQl4VJcyNtmFSXG9Tte9KCxrKfcclO0FnKzm5IYffoRJWCDq2kY+m850OuHkA9Sa5hHJUGOO62RlOxlp0Zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVWgXZP8+rDJJCo1+G+1KSSiVkQ701U6p9QpfCcmNac=;
 b=mEmbN1sJ7pep0WxeDBxMwtCudZl7TmB8z4Qtkftytta310ykD6YmundemBHyuixuw40ObDGH7I1v/ASG8ri1hI8IUXu48udXdp02t73bCOsm49vvekxq9dijJCkhws88dWOQsnTsC+n777oI0I1TgddvJW5OkKgHQNrAsxG56TGpwy3200dJ2tcKyuk9vhPbJB4qLOaIYImR/s9EPtAaT/XDKsiS6uWVz2ZoALso5c29KdOuG5e9kQWyh239Tt73K/uk5Xyx4axe/+MmW5XTMdQ11/P1flxQTBKMlOPB4ILQJGmlz+YdPQfN0z5fyxw2MdBSzl893YQhSVPxQ03x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVWgXZP8+rDJJCo1+G+1KSSiVkQ701U6p9QpfCcmNac=;
 b=k2jUNP818awO74bxBxxuEa1UbjrfeYbx2+YNpxNY79K0wuahUnv5TsHiSA6b9h/RGJB8+RSaOQ/NDQjmoh8PW6NRRbvEiOACmzCuftbk9ORHg6QA5olK0ueHYvAshD738DW8hcIMfDBArzJtEAdyGsJLOk8+48zjGFtcvqOvibVHjFPbSPNVx9MIlbAjEeUFE98EdXXdSRlujswXIE+b17IIqZTWYrJebmw9v5cQg/KaMgVwib/yVKdwCSBlsz8v7LB1B5buoaesBzeNkuNyQjLLQSvTasF87W30xtQ3f+2Q6J3BZtaL4MsXJ93bHUNtn7WjRZ4bZiHY0YuMNjelrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com (2603:10b6:61f:fc00::618) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 06:06:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:06:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 15:06:40 +0900
Message-Id: <DJ4AKA2J4158.1YSOLQE99O7IF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260607230539.144382-1-jhubbard@nvidia.com>
In-Reply-To: <20260607230539.144382-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: f362b2f3-af3b-4ad7-0aa5-08dec5ed47de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1F0FE2sYXiapDBoZd9d2sLUCgWbpOI5e2WxmevT4KA5O8lD6qhdAZsrXab3rwCjJ/viY75uEFnUz/IN9wks/VvZXluU+oAaUoV8PSNpRZIuip9LwEI9PY3tQqs045LPubmWCNzNVfTr0Opb2egsrbd43mTuugdyY2OhylEB7dpkp7maV/cH3lscl9zG5+gdy/r6Yr8l3aIeVPu8fr50JNXKA9nGDPCIBjNHVa+5tbkwKYVfHM6XhXYBT9ebL4zID6wYkUH3GJtUZl3A2fK1cUYxGxH+R1UMzOt+naDr640X3jrd+3LQMNlnTkRQySUBrIdwvKtBMbGflKCvDDS0htm5nCxUICbdtSWfxgtPR+AA0485L91M4Tk81QZrI+GWgjj7mZhVWFjlifrmmofhwBprh5WuK0myfpcJjEMvTcfpqpxs00ljFgtOZHTY2Rn1M1OS0Q/4D1hme8pByK2N5k+dYbssH+kZntl0JBmQq8U878ld8dka+riyqIuLQXUHgQy3YZR1z0V6iCjbFgztncYkSbtRJbVr5BrhOF7+QQDHRF3nHyrHCwf2EhBZ71C8tvS9pmVAH/iZ6t5v8plezLnDLlqdK1AI2ncE+XTNf+4Sqy89TfAzRMmITNWxSogCXawMecjYYNfZtKOSxFHP/LWuWd0S7kG+dfY1jjINI73R8zr3b0WAYWCkgcbe5m/LS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SElrcmNkTVMrUGUvWTBZZmxXN3g0bm14NDlYWm0xdlhXQlpFb1FQVzJ6dUtQ?=
 =?utf-8?B?WkdsNW9EdndSUXpvTXI0WStkZlYrbW5aWWpFWVVVTm9pQ0xITnFvcGJDTzJ5?=
 =?utf-8?B?OGlBVVF3VVlNQ011TEpMQzlUZTNqSGNqZ1FFMlBPd1dqbU1hUHFuWm9sRmRa?=
 =?utf-8?B?azlOYzhlOWNabEk0Nm5NSytEWWh4eENEMGtFNUJrUDcwbEN5THd4d1NrdG81?=
 =?utf-8?B?aWJlT0FWeXdicUcyeUZsTkVUaS91RWdoQ0JQcG1wU2RrNzFsYmJxVFkvRERm?=
 =?utf-8?B?SXl5MWQvY1V4aTJJSGJkSDUrNGZwOGhFeXRwbkZsWU8vSktuQS9JTWNzOGI5?=
 =?utf-8?B?TExkT0ozZ2tVc2o4UXpIWUhaNE16MlpFdS95TG1RekdvUXhpQ2JsZjRvMDU4?=
 =?utf-8?B?R1ozekpvYUkzMzJJL3o5Y05wL1VmdDNYdGh6RWkvU1h5bFRlbUlCcVRYOGQv?=
 =?utf-8?B?eTY0emFGY2dsM1ltd21UYkVySDBKMjhSOTY5eEhrOTNRNytDdGdXWFBTUlE0?=
 =?utf-8?B?UjRVd2hBVi9MYkRuL2REenR1bWNKemE3aC9xQUdoNHdDT0x4N2ZmV2hNVE5F?=
 =?utf-8?B?aHppOHBqUDdnYy9RY09KejRzM2dpWXM4UWxDUi9raXJLN3FHaVVTUjJCTGlS?=
 =?utf-8?B?SjJBZ0RGa2FueU5mbHNvamZxc3p5STNSbFRuVEx2R0dNVjNNQ09wc3REVmNr?=
 =?utf-8?B?azhWV21naVlObUpwRXV4T0J6UFBDTWVDRWFyU2ZOVkwvRnQrUWZqcWxzOU9K?=
 =?utf-8?B?OFFVeEJ1cC9vdGZKQ2VZcGF1WWZCa1NPT3VSOTJqaGdqVmtPQTZEdnBNL2Zq?=
 =?utf-8?B?TU93ZXJwWjBEd2t5R3pMUHFQM1l4M2t1QXNMVDRMbXpnc1JJakJ6aHp5d2J1?=
 =?utf-8?B?TUR1cExOaldPMkJva2RUb3JFYjlUQVBqbU5jSDRlQmpubXJrK3JPZTI5Z1Rs?=
 =?utf-8?B?Y0k1V1BDRXU0RERKZjU4ZW5uSHoxTHdLdUkyK2gzekd1KzlzVk5pZndlMXN3?=
 =?utf-8?B?TWxFUG8wQWpLZkxReUgvYkNEUGE2aWIxWFRTMFlwMHZlSkh3ZDhYbmxFWnNE?=
 =?utf-8?B?OXhtdFcyTk5ySnhmb3laYUN2UzlRS2VSeHJCSTdjSHZ2ZUFTYnhMUXdRbENW?=
 =?utf-8?B?MzU4U242clVPTnV3N2FGdTcxQzZETlZDZmhPQW5nQ0o4UHdhRlBya1NhOVg1?=
 =?utf-8?B?ZytLSDZwbW0wbHliK2MzUEZlVTh0VVVhckc1T0xuZVVUby9qU2YvamxWam1P?=
 =?utf-8?B?c2VkcDZ1WnZ4OW5zYURGNEtPc3pWdFRSeFN2QStQeitjK2YwU05EMFIzKzhm?=
 =?utf-8?B?WEcvRE14Q29kYXFtYUE1aXE0L2RNNWwyWkpvSi9zbWZkempvVGRHQ1JzN3Zl?=
 =?utf-8?B?Qk50QTFHbElOZlBwcStJYkJMa1BBbmJnYno0VG5ueE43Y1J3MXJXQ1hkMVJj?=
 =?utf-8?B?SzYxV3dPeUtkdjNDWEV3ZnByRVgzSFo3SHYrSEdFRnhjeUJ5bk42UEVtMjYy?=
 =?utf-8?B?R3BHMGh5VlBjQlZzUnhkeDJYMlNsQWNSL2srUFRtaDNGTUlSdlRCdUQ3cjg4?=
 =?utf-8?B?NXFuQ2VMVFFrTHhBTi9aNklxaS9TRW9EKzR1dlRib1ZoNVZ5NFNuRGFoSzd5?=
 =?utf-8?B?emlPTi9jYWh3UDM4SXpwOXo0TmtNa3dRSDNQTndxVGxNYytqck0wUjdaNUJ2?=
 =?utf-8?B?bmp1ejllWnM2ZmpTdTUvaTJMUmFiczA4UkhDWkN2VjhCSGlneFc1R2ZPMmY0?=
 =?utf-8?B?SDBuNzcyaVRzdTlQVGlxNEZBYm1qeFA2NU9GZXdEV2JvSVVraTJvVUJIdWxp?=
 =?utf-8?B?VDdGZkdEZElqdmFFb1dpLzI2bnpDR2cyQnZqQVArdkZITzdZeVFyMWQvYUNB?=
 =?utf-8?B?THlSUHByN1FaWnR5eVBpeGNObER0UTNjMWRmWmpwb25Bcnp0VEgxbnQrL1o0?=
 =?utf-8?B?dng3bnFObUhyQkZKZ0h2dU9VWmorZG1hM2Jjc3FMemFzNHUxamFkaVZleTlo?=
 =?utf-8?B?c2ZYeE9Md084ck9ZZ1Ftd3h2aXVNSkJIcEZyUXNkbFhxTjdaWjdTQ1BPRzhK?=
 =?utf-8?B?Njg3bVpvOUZ5Zzdva1RrbDhOVFg3ZG5mNjJGWGFpNjVtUmp6cFk5VlU5L052?=
 =?utf-8?B?UDFxZm1kTmRpYzlqL2J3cFVPUmV1bGVrRlVSZjkzQ05LWTBuRDE0Zk1YU1pj?=
 =?utf-8?B?R0VMQy9ZbVdtcTBEL3Nhem5KWlVoVkhRa29hRTVialJTWGFVbnYwUWNsTWxI?=
 =?utf-8?B?TllVZlhUczZnZElGYXVJME1Mdm1DNzh1MjJMT0ZHai81NUdWdjc0Wk9lN1hR?=
 =?utf-8?B?Ni9QUEV0QW9WS1RKWDVsc085d0h6YlJnekhkMmxWbWUwVFRzNlN3dnJIZG9z?=
 =?utf-8?Q?anhVJR+FIYZjK3P2K/2X5zcxlkbfffGBWg/KWWt2Wyeg2?=
X-MS-Exchange-AntiSpam-MessageData-1: Xwqs428UdwZdrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f362b2f3-af3b-4ad7-0aa5-08dec5ed47de
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:06:44.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxbIc5B7Jv+Si+oOqxSf8b8PpJrTk/gGnwNOyTgWWOT5Zep3p1vV6ToZ0Y6YQlOKX7Gaox0d8sGm1VjQLp5Jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96

On Mon Jun 8, 2026 at 8:05 AM JST, John Hubbard wrote:
> The module firmware table lists booter_load and booter_unload for every
> chipset, but Hopper and Blackwell boot the GSP through FSP and never
> load the SEC2 booter. Those modinfo entries point at firmware files that
> are not shipped for FSP-based chipsets, so initramfs tooling looks for
> images that are never used.
>
> Declare the booter only for chipsets that boot via it, matching how the
> FMC and FWSEC bootloader images are already gated on chipset
> capabilities.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Pushed to `drm-rust-next`, thanks!

[acourbot: make comment on FMC/Booter choice a bit more precise.]
