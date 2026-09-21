Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C536194D
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972370; cv=fail; b=C2+momknptkxB9Uaa9B85hVdzzd8/jpVHrGAfBBwmNtrVDyKti6PaLh0Wnwsa3xvad4IkMhbNSmtOjAxpxyQZ/2k1MTLMbIE2ipGeGd1eYCLRv8hVG4NyzHAL/qsPY1eFRNyIyvCmV9yIKcK2XfQko7nJjKMgZoj8doYv4jRwy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972370; c=relaxed/simple;
	bh=pZUpq0a8bkrVSt6RfDbQneqXcdZLt/sjoKeT84D97aQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=RLyDkTyQcICypg6m2SuPBsHsrMsjjTFOLJEmN4wyXLVMXx66XtIeWrRGKaPvKRXPYiAfrPlqwxZ2rOa8SHfr3+8CgAbfDKj68FxFrfQai+mgmW/RNHvrbbm0yMLg3F2o3A6m1xDKVdrCULmPjrdc7+ljO9nPzFCDfQnXudRpO9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AjN5x1ZG; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AjN5x1ZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw8UNjsMBr/gGPyXHjDoRLCcLV6y5CX6u3opqkVCOQ30JI8uUzLWrq0t/bASqGTNu5mufnenMKqGY2TEtAQcmstimhKiqPD63h2/KpQtyiO/hKBJzuhL2g7i3OqGFV1M3eTIEycbzYrvxhWocndTu2ob7p5eN+RFjiF9vv7O8ERdNgzS6qB+TNlSJV2yv5UFgMd242RmnE5MjSql9mz7snoLSAlDXSrd8FuxEHvjx0OAK3lv6Lkc9CbBKy1okRhMbx6AMwTP08IIV4WIWjKOtATXvcibXP3gQap7GzlcXOgC0mYv7xVKVAxfw+Q/OPgTTK0/IocIE1qn+5zR85P3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhaFfF/onMUWRkbN7kKLfwv7lgJvqRmBWncdSwuNT84=;
 b=bCRGYfJjmX7AEO4/oqWWd3LCk8uFii3uRH8ruLPlNvcNATRoOcKRsdk90/T/BpJXUvrceSIMnj8GugwEGuRFGlyWSI0AApzlMJcD5cJwa0mRiMSFvgP+nkWK0+YMd8HNTQL58Z4GG+xB11XhrXNcP8+wo0AMpsIuNJVrpET2FGuPNLZvZhZ8BlF7FeRMq+1LHVYKIn6CMqoIy67yOkPz1MpubasAJ48KOZlWErfpRb/MnKqicdVeE9T2YDZVCL1DKdskhFOnqdzn0lvaowBdKY6wJ+TQyHA2/cl/o3vdguKeBeORFH2sp0a9AyIFmJDMHFwGjkaBC8cF3nUaQOrD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhaFfF/onMUWRkbN7kKLfwv7lgJvqRmBWncdSwuNT84=;
 b=AjN5x1ZGHwPlz4yW7BulCPcFbxu84SqwFcaJj0OlNnpEn6sWwj3SS6xZj1vW+D1t8sC5KFb8+Ce7bWaU2PoDqyxkFuIr6WjGRdC+F/hxiZDdrTtGru8aogUvLnbmzy874cz3IB2CABUEcYHIfvPfC1IPP7qdPoTH+dymbVN+uKTJjttrWV0EmA+qf2AtBNJZ7pS1f++KjceI5FvhFhzC3cgRDM4zaUXv2Q29oVCWjn2Prydf8IevSfX98khj84xqN5hc0eAIPC7hOWF9Habbxb0KurWdn0OqQlF/krv2Q0rlZ/jBDSpOquINwt+7QfVo4RB/cxv46E616Z8W2Xx7uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:32:44 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:32:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:32:29 +0900
Message-Id: <DLKS8PHXT0HV.6FNYAREVUCY2@nvidia.com>
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
Subject: Re: [PATCH v4 10/17] gpu: nova-core: stop re-parsing a bad GSP
 message
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-11-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-11-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 723fd310-016f-4204-1607-08df17aa2480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gAnL7D8miUbLk6PgBiRr9j8IfnI0stS/8wMqukGz9S06c6cKAN+hXU3KJg3S7bVvSW6R2feb06ztls3W2Eiih2dLHU8WLP6KFvD6t5n9/0QgYu/QOq/Qq79P3dr2HDEV3WSTG7NJyJwPIMSbzAAIsGZDNNnxJRzsbMIugQ0Bv1tIat/RIjv29tqc5UWtEltpVUbI36bHow/BiOc6YT3geJdjFlKGRJ1bg0WdDKGSk509ua+GyW70drttj6Tq7moluyvxX11FH5H+uAB9PJnJby3KuZnJdeW4STtEOYbNKYNgsTHiigXUuLSiWdvfJ3Ii218wSxdLjA7jM3VgzOeLsNg+dlPa5TO/TYOYV4JcvJ1wAOCr4Tm5lS7gNIS0IyLmbRz8WmM8OD5xK1puMrUbS+qlGbdfG+ufsHsKhOLBvZtcFfNYtPoTj9K6GxDxGqa8KcMnrP/DSE+ByYyFasA3T5XwW64GH3adsXG6xe/GR3CwKXnnj+QVw9m82TSVpm0uUfk9oQAReZN2AZjDr1FEeLVj5k/XB1T296KW5ROPGOxli9dyeMn8fjc8fc6J63iFVKf7i08ckpNhtf2V001RjI14fQPntFY1iBXWnGXawWo5iRirv2bpMoc8v3e/kkac8rpI4DlO+XQmf7XE9s9a/2m6CnIpFyvcYrhTCJSOPok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnU1NXZrV1JLUnptS2JaY0tZbEMrdGl1UlovL3ZqMTVYSGo5WG1XZ29qTUov?=
 =?utf-8?B?NzNWMk14OGVZVmFOOEVVQklWdWJtN1dpMi9JWFZiZWdRamNramxNR1JjMEdD?=
 =?utf-8?B?VUFxMkVpM0F5a3QrK1pXM0htWmV2b3VWSlJWWEZPdGoxSUsvNVlnbXhOUDUr?=
 =?utf-8?B?TDI5ZnpiWmM1L1BncEsvZWhMY05yU1g4ejFOelFkaUNaOS9RUnFIa2d1VVV0?=
 =?utf-8?B?M3ZCd3lkY0l1VmJLazFvQk1rZXZiRWhKWHlGaUx5T2hLS3czTmYwYWtRQ2tp?=
 =?utf-8?B?VGxYMGNIUTNFTCtUVG5JWlROVWxqbU5Jd2VWcWdNUG9BZ1VVM1hiSzA3QmpY?=
 =?utf-8?B?S29aakluMHR3QVdkSzAwZ1d4YkNYT0UrQlRXMmNBSHlCTmFvV2RQbndWTnB6?=
 =?utf-8?B?OVFPSXhtVG92alVNUGFtM2c5N0tuTWlVRlhKVElRdkR0cDBoQWFGVWFSRVBs?=
 =?utf-8?B?UkVUUlB2RldCUWorVTFzbUZHcWZiSHBmTytKVFJjVW96aXIxNlVZRG1EaHFy?=
 =?utf-8?B?WXc4Njd4QW5tVHRHaE1UUTY1QURyM1htOTN4WFVJTkVkdmVuKzNzVHdoNTla?=
 =?utf-8?B?Z3AvVThsaFpiajAvZDI3UmVuWFBodElNeEtYeFFWMlZCblZHUVV1d1Z0bTBL?=
 =?utf-8?B?dWVDV1FOa0RpRjlsMHhHY0FMUE9EUVAva2lrMHBIMkIxdkoyUmd4SS9oNlZD?=
 =?utf-8?B?czB3NGlJUUcxV2dvRWdiblJOYk5iTklyY2tZS0NMMHFRenRuMVV0WndTNkM5?=
 =?utf-8?B?U0REc0FwY3hCQkwvYkFJWHJPOHBEMHgrT3ZCZnRWRTVCdnJkb2ZCZHIxSlk3?=
 =?utf-8?B?TVZyZllRaUo3R1BkUVJJaFZtVmhkbDkxc1JUc1RuVTg5ZXVDbVU0S1Jhc2Q5?=
 =?utf-8?B?TmlQZGhndk9BSDVXMDBYalR0SEp4czNXLytwK3Y4NDlVN2oyV2xUbUc0VjV1?=
 =?utf-8?B?VmYwNlY5QlRqaVZTNzRGKy9DY3ZEc0lRRTI3ZW1QN3ZONi96cnV6aSs4UnBY?=
 =?utf-8?B?bTMrYkNKZ0hrSURxb1VVREpHemdCRENhdk02V1U2RmJvM0tRUnB1RUJYSGZS?=
 =?utf-8?B?K1pUWC9yZUlvRlRuc1MrNVZheDNldlpjN1Q4cGhtd3FqalhZL0MyY0tXV0tp?=
 =?utf-8?B?TXNWb3lXd0RVN0tCcnNaRnlSOGYrcnlmU2tJamJBaVhYVk5Fb0RxNGMzc3ll?=
 =?utf-8?B?ZUk1dzlBUFNhZFExQWR4UnI2MGhHcnBYRmttNmMxVTdibHltbG1EWjBsQzNO?=
 =?utf-8?B?bkpmUDlrVGYrK3NLZXhxYXluVm4rNFprQXI1VHlEZ2crU1BuTHRydER5Mms3?=
 =?utf-8?B?UVljQ04ycDZBdUFmTG5zczNnSnFMdzdtOXdqemtIZmY4UHIxdUZtQmQ0R281?=
 =?utf-8?B?eWw4UDhKUGs1YlZzU2NUdXIyL2lwaFJ4V2FXczJRNVBPS1lTYkZMWDFCQ1g3?=
 =?utf-8?B?dmdiTHk4eUhTYzFhdEFiMHVuR3VucnkyajdvOU85YlB1dzVNUUQ3MGJBTmhG?=
 =?utf-8?B?TnVRVi9BbWdrZzBoOFloUG5BV052aU8vdWZhY05vWWUrYjZHK0t4WWlMR1Zt?=
 =?utf-8?B?bDZ5WnN4eDMrVG0yUW45Mm1zMG1EbmY0QjNzbjBudXZsK0d0Z3U3c3cwTTE5?=
 =?utf-8?B?dTZtVS9uRFdmZ2M2YlA1bFNRU2hZTXY3bVdhdSs1bjJmdldEdHF6ckN2YTN1?=
 =?utf-8?B?RVV0ZkhDaGVDTG5NbUViOGNHcEtpdUVWTDlLbWNMWWN0a0JKTWo0VXdPeXNu?=
 =?utf-8?B?QVFjL2NHMzUrQjQySlRNd3pwZ1VKcWZSWmpxR0pheXExWmZYTGxpa1BxNmtB?=
 =?utf-8?B?ekRYSTJoUXZNSjhHTU5sWjJQQUF6WitaalZNT0xIQVZjMzV0SFJrOHhITUtp?=
 =?utf-8?B?TU9BOXZrTHJOOHVMT0pmZUJuaTBPbWxrSmhuRUl0ck9uRHZCTitPTUlzOWh6?=
 =?utf-8?B?SzAvbjNUMC9FZ2xkbW1OcEtUSS9QVms5TXhIUTBidEVDdWFTQ0dlN0hnWFBV?=
 =?utf-8?B?ZXlWUEo2bUc5Q1RnbVlQemJtVjZRbHY1ZW1WTTFXYWE4N3ZOajlOZkhjT1pB?=
 =?utf-8?B?V0hBbFhtWHpmdmFhbWxYSk11SVJXV0FCbTZVZHVKL2tJdDRsWlgvQ2N4ekVi?=
 =?utf-8?B?TVpaWEFBamVmY3RxOUJEMis0eS9RQkp6dGtpLzJJU2tndXJDZVIxYk5SZ1Zq?=
 =?utf-8?B?WHFoTkJKZGw5dS9xdVFwTlBTbTh5UDF0WkhteUVrZVJWT092VUs1RlJaUFNX?=
 =?utf-8?B?R2IxSW9DS044TVJzWU5zWDZiRVU2cW05ZU9LMHdIUWRidDZIV2M2QWR2R0Ni?=
 =?utf-8?B?MzVrMzV2V1ZKNUhTamxKc2pRcENuNUFabFZsQThUWU1iMDgrMmorTFlvSVRK?=
 =?utf-8?Q?625ecLGcNuUN5m3uDT3IRWGspBi3FT88MSV0YwgD5vvte?=
X-MS-Exchange-AntiSpam-MessageData-1: ifc6k14XMGK/sQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723fd310-016f-4204-1607-08df17aa2480
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:32:43.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbzZDmCMSKfwCevKrnDOIgoIv/q++66YG2IGvx3emxypMxwMz6rC+R2oV4ojib6nk7jO/WH70z85Hh/RJ1UPIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 1:43 PM JST, John Hubbard wrote:
> A GSP message carries its length inside the checksummed region. Once the
> framing or the checksum fails, there is no trustworthy length with which
> to skip the message.
>
> Two failures left a bad message at the queue head. A framing or checksum
> failure returned without advancing the read pointer, so every later
> receive parsed the same message again. A validly framed message whose
> typed payload failed to decode returned early and did the same.
>
> Poison the queue on a framing or checksum failure: log what was
> inconsistent and fail every later receive, so the bad message is parsed
> once and recovery takes a device reset. Advance the read pointer past a
> validly framed message whether or not its payload decodes, and warn when
> the payload is shorter than the type it decodes into.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

The idea is nice, but the implementation is a bit too C-like and even
with this patch we are missing cases: for instance `send_command` still
operates , which is technically not an error but introduces a timeout
before the receiving end fails.

Basically the poison flag is here to prevent access to some
functionality if it is set. This is conceptually very similar to the
`Mutex` and should operate similarly, i.e. by wrapping the data it
protects into a dedicated type, and providing references to the wrapped
data only if we are not poisoned.

Here the data we want to protect is `gsp_mem` in `CmdqInner`, so it
would be declared like:

    gsp_mem: Poisonable<DmaGspMem<'a>>,

And now every access to the inner `gsp_mem` is conditioned to it not
being poisoned, and we can't omit checking the flag before accessing it.

Eventually I think `Poisonable` could even be useful in the `kernel` crate.

That's quite a rework though, so I'd suggest to remove this patch from
this series and re-consider it after it is merged, as it is not really
related to IRQ handling and is more a cmdq hardening effort.
