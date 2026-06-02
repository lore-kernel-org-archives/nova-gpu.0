Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43836683B
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384719; cv=fail; b=shOlu04fNHSqQhWSkvdssUlemcKFAds3JiCdOUO4vSG6TU0lcjhGgTFqoH4ohT5da+6ckLo16OW9hMtJDV0vYCUSkrEV25sfuTboJeUiuUNyQTx6oazu55ELNPyzhOa8IAgyAFxQvmAlxA5QoiEhLEOdR4XTSMYQ2+gw8QuvDTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384719; c=relaxed/simple;
	bh=A4G6sMXn/2fI7NWRk5rhMEPZlIWPr9gaj64NhrC1+5k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ROmoq/g8cJNwwovHymmZnbC+rpQtum1W5oxZPLBmXzcGTa60yI90Pi0MCHSS2JVxM6k3crL6Am6PGy8h0vON39oUQe+w44lUVGsHwdQ38ql5uJLylpDqhGFltCrIt6+3+Xb3f5l4rPr8P3031ZR9EdLk9aHRyPF0Lqus+Aw2saA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H55ICdO4; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H55ICdO4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCgyQBiz9XiiwbG0EqTo3XW5rPh7HG/VmQFA6rGmc31wvq3c4GPKlN2y3O24J6UnUleW69DPwWQqQNdmf9d7PygC0gz+0bnm57DhxbSR2yeZdFHykByQ5V3JgrlFSle4tYktG9znVNpjOFgYR5b6yhlHgnYnno+iVrzVP+wI0MlRG1nLdy3hNC1c2RW9Ar2QIGmpVbJMpF86X+sIdl380tjR7pi1b/FhO6HSZr485MdgwGP47qh5+tThu5V+2dEjeEyCLV/AHpRdK6eO2KRjTfmd2/7sMOoa1JGXV69a8VF/SpJ/quUlWzxJnWvxEEUmUjRSOtkttXVOrwN/TE1UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4G6sMXn/2fI7NWRk5rhMEPZlIWPr9gaj64NhrC1+5k=;
 b=p7Kck37BDZZmG9zocPIos16n/mHZSF0SKG7k7pj1Dll3udZ3F8jCwSd4EPOzHldymNwbXA3cH4JGxXgV9sfuOl6rKgDeHYLz4kN6xiLMVvI7vy5p+mlYY5OiK0HA+HWAPOSfFh84OvcnvqqeDUkiO8YinkxFuUHz0aBB6kFiKXdwPPW7am2R/uWyaSPKGO7Wgsv97dfVJ4Xh+xEz8g+2AVGUS6vfvi478vHOMndk+h3Pi0KQzfBYnLgWNzz/hFP5374SC2hoycTrtu35xLGrwxx/YgPfEoDfbgCuHJVIVpSvQ9Yzg8CqWM1deJK9ZcggVDcJ3xs/DL85r7LzgdG0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4G6sMXn/2fI7NWRk5rhMEPZlIWPr9gaj64NhrC1+5k=;
 b=H55ICdO47O2NbGxKC+k3TFD62DPeyE0ZLtRobfMDBYpxcV7NAes84/EbN5TvZbBQyCIiraYS5RwT7VGWv6tu9zmnEqYIO1m40bEJXXHrwO43iIh6JGdzNo/Ws+JiGBJLYHTMB8M6pkcxwIPTmOMcWw8dSQfCzaTY/vBHtqWVFuNOkPGHkz+ffWU52A9uoL/4ynSDa0sjn+f/vioufpEfr7Ts5EOWBs9njWyeoVOpXelhf/VZnWn07DBIInWhpPwChDFsd7vq+JmgM/XGmWmr1PBb9uJd41S0Wqu/GqMvRRy6FIPtJXK+kH+gAEbzeLRRt15Ml0nKyKFlQUG/O8sKBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 07:18:35 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:18:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:18:31 +0900
Message-Id: <DIYDPH29S6CY.VC7ZIZ9UW2WX@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 11/22] gpu: nova-core: Hopper/Blackwell: add FMC
 firmware image
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-12-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-12-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d049c9-6f9a-47d4-77c6-08dec07728ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	nB2KiTiLTY7TeOUyE83iv2TsT1LInWI8PXrhfpF3PIZWeg/96JJImxc8kQXLB0mVqMz+8h5oX1QPN+R/4nY4uMkjU1QZ8ONwAjPBsUzTYV/6Qr9DM8GNvxdGzzwuQCpHN1DNAbCr6VgeMnsYRjyELyqRCtZoPYF7gP6XBclcGS6Idt/1rDDWZR+ZFS/O/DbdXytd5js4D2hUfdmfIHTKdHTOkgZJIP7yKLiFrINTyCcShtrBfHxZkGJ+AizYpYM4nmPNk5Ev3V73o0dhhwfFhRK5zDkRUFcmmro3k7v+JrluZwrfDzt2iR10nM6xy4t5qmNoxpz+qH7GB9rMTjLLF5tUV9602BOS6/rWKKLn3elt5c5Fscz/CcwvFdYduB9IpBmEup89M9/tmTaSF7uapEUj2OEZaZG5akbHIqK/gHuDOf2Aj3SJ5kCaC2ARJSEgkBKvivv5HEq7+RGT2jJmu6jLRJ5HdrCVCBs+Yopblih6U3ZQyegbWK+3PimYcHxRjB0R1Yl+RmDNsVu0gTSbYHSbNAywV8cPZS3eUQFWA+9NJfVa9kstQXZsnPpvLvePVrV2Xg/V03p4ESQVhfnmcs2nZ8z3WAqNiT+OLe+BeL1CKDxtBFyQQLPeOI2h0L11upli63ZC/OXGBrS6ALVH4nGyrYW28uZhZpQjWXzxrwhnjs/XiGxY0ijTjy8jv5LG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWhpZ0JheDRnbUw5V1dNbUloTWRDVkEvN2hqVU50dVNFL1RxWktlQXl5OU9V?=
 =?utf-8?B?VGI5NVBKeWk3Y0p1c25oSWltQlJ0cEltUDZLRGY5ZDZJTm9kTk5jWWVya2Iz?=
 =?utf-8?B?eFZ5UElNd2NFNmNiKzlrWGNNOGwwYVdURk5rMHJpWFo5aTIrMVh1cUI5ZExO?=
 =?utf-8?B?MUh0OUxjWitTTFBXWWp0L0gzN0xuMjhlc3NqcEtHdlpDN2NYWlgvTUVKdjVw?=
 =?utf-8?B?QXdQL2I1NnZlK04rQ0tHWU9GemkxM09oTHVIR2U3UEx0ZjJhMlRxU05GVUh5?=
 =?utf-8?B?c3UwU0dpeU5mWllLRUNWNGd4emJyNnYwODg4TXBVZWcwdnpyMENDNGU0OW1B?=
 =?utf-8?B?Z2VMNStic2x0Z1R3NHIwNDVpcTgrY0tnS2NjQmo3NXJUSEY0aFpIMnNNK1E4?=
 =?utf-8?B?eVlIOXdPaURjWHpkendiUktHTWMxN2g2WEdLRzFjRmJsNjIybmVxUTNValBR?=
 =?utf-8?B?S3ZSZlY1Q244Qk1ZZ1ZkQ2g3ZDQ0Q2tDeW1mRU55bnhmTk9TVFFTUlBKcTlB?=
 =?utf-8?B?YlphT1VmL0d5YmxPYjJ4Ymk2QmpDUnVoclI3YWdYVE02L2E3aDI0R3d4bWMv?=
 =?utf-8?B?TmNZYUZXS2JVbDM1ZmFoY01qOG40NkVwSTdyTjJIbFJUaXZPRHc1TUpvSTVp?=
 =?utf-8?B?dWNWaHZMaERDVDBsOXFRbHRQdnlMV1UvWklJWk80NkF2TWU4ZWlNcTJDL3h0?=
 =?utf-8?B?Ni9yYnRnZnhIM0h4d3hackM0cUtEQ0VmdGdSbVY1TnZpcWdpVjl6U1pRNlk5?=
 =?utf-8?B?eXA0YzQrVWhHQlY2OHdsVGVhRnFoMERBSVkvcGxhWXkyTDY3SCt0ejJoQy9W?=
 =?utf-8?B?N1FORXRoVXNWbGZ1bGR6S01HaURXNXJDRitIYkJOVkJhakpwU291UnFDODNX?=
 =?utf-8?B?N0pwd0tzUmF6ZTcyVkR3bWMxRGZnd292bTB0bnl0TWU3OWRVSG9XNklOZzhZ?=
 =?utf-8?B?Q0hXRmJ2L2hUMENXdk8wc2xQOER4c0dLeksxQlNQZ0tlSGRiYzJUNGhNRzBJ?=
 =?utf-8?B?QUN3QTNYSTB0SUxFVlVQbFFyS2xNYkpNNzRpZEE4T3NtRFp0T1FoZWVJbGNo?=
 =?utf-8?B?N3poZUo1bm1YOEh5MjBydUVRUW02NEt3OTJIVUlHQzlSZWUya042aEM2R3N6?=
 =?utf-8?B?WUJCMERFZnhPQXVpMzZiUmxpNlZlMkpxNU1zYys5OTQ2aUtqS3ZhSHJkMld4?=
 =?utf-8?B?djFXaEhadlZqdWdMcXgwV1RSRDJGZjRFWUNzemtiRWxocGRWdTZsY1diRFgr?=
 =?utf-8?B?UWtkTjB4eFRjRFY4RDF4SmZ4dkhydDdTQUFsNUt3WkhpM0kvbEoyZ3hSRGE4?=
 =?utf-8?B?cmMxTnM4bVZ0cDlMaXRGc3UyQjFrem93SGthMnZWVGN2QWZsR1dxR2dGNDZ5?=
 =?utf-8?B?NlBNaXBmSVZvRk95Rmdsd3kxOUxxblBPU2gzem0zcSt0YU1oc2ViTlJZeERC?=
 =?utf-8?B?VlYrb3ZpRUh5anFwSHJmdnM1aUxqWGQyemVKT1pOQ05GTlcxdW5mRjcrcHlM?=
 =?utf-8?B?ZUQ1L21uYkNHcTMzeS91aWl6UzNmMCs0QnhNWDh2Y3M3R1pENHNrTXVWZ09W?=
 =?utf-8?B?dkJvZitKeE1oQ0l4SDVJejMzSUhjczVuZnBHSEFhQzUycm5sMGRralM1Y1V4?=
 =?utf-8?B?U3c3UUFnNFVzOElRWk5HN2NaR1pOK2VLWUZrVWJBcnVsbElZT2F6MW9TRjlU?=
 =?utf-8?B?eGhsWm1SM0dlZkFodi91YndVdHZ4ZTB6VE83NEVUVkgwWFFIQ0lqUEs3VERZ?=
 =?utf-8?B?Mm5FZHhjck5WNGltMWNOcGNHNm5sdEk4bG5URDc0QnlkVVBpViszSXMwVDQ1?=
 =?utf-8?B?VGM4T2NHbUhFejgzWmhJK04xUk40L3lKdjNmTzV3ZGdyVEs5dTBYcDhKTE80?=
 =?utf-8?B?Sm1sTnliY3BZTzd1NzZCS3hyb21Hbk1yZlRlZkN5UnFDL1JLT2xONUZxVEwz?=
 =?utf-8?B?TXU0OFNYN2R5Q2lPOWVrMmRRRmswZnRDZUtraFhtbCtvbTZmTGJjbjhXNU1u?=
 =?utf-8?B?aUdzWnVZbHJ5VUhPVDhhczJ3aFJzR1NwQjF4MHUwUis0R1RtMkpvcWhtSSt0?=
 =?utf-8?B?RmlTNjc2NUF0VCs3bjBxSEJBTnlLNWJObFAyWWdjOGgzek1La2FIcVZZZjIv?=
 =?utf-8?B?MldQVHpEQnZYZkJTZlVRaUNMT1l6eGVGUXh5djVYb09Sa3VjMHAvZHkzQ2k4?=
 =?utf-8?B?SDdESDVrQjRFeTcxcGgvSW14Ym94ZW00YVNnR3JrVjc4bXRRZUQ4Z2lBUTgy?=
 =?utf-8?B?UTREM3pSTElrTi9wZllMVnROWjhiTVBCVEJYQVdHT1VYVzdscXBUYWxDekVQ?=
 =?utf-8?B?UDBaYyt1TkJZMmh6dE12Q2tSakxxS1lJYmZyTmg0NVFYV0lDMTRPQUF6Y1Vt?=
 =?utf-8?Q?YIo2xaevpYNCkAmmI8bfkG5mjjdEpPWtpxeHPCpvD++mY?=
X-MS-Exchange-AntiSpam-MessageData-1: vxv9xmwKEwMYZg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d049c9-6f9a-47d4-77c6-08dec07728ae
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:18:35.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1ndfJreYadck5TtOsRy+/R7ZpOLhjjEE73JhnSu+BC5xAwHIYcqpC7D6uabU7H46+/maGCzlpoRJlOjzBCdTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144

On Tue Jun 2, 2026 at 12:20 PM JST, John Hubbard wrote:
> FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
> Load the FMC ELF in two forms: the image section that FSP boots from,
> and the full Firmware object for later signature extraction during
> Chain of Trust verification. Declare the FMC image in the module's
> firmware table so it is bundled for FSP-based chipsets.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
