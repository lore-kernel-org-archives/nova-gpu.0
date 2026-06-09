Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A34219E9
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013270; cv=fail; b=e9zvr/ttK8M1rQdHDjKYYJ3r1uCWu7t96yNdB03CInQ9oyFfeRy7l8SKbwPgAFRQxRYM9BW9VAdwlPbynqSNHpEsihZ84tdLpm9n45O6KZYBVelzJOoCfl+UaxVI32tNhDU0MNfw1u27SaZqWsgAGpGCsSwwsLFmcv/gBxTj4jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013270; c=relaxed/simple;
	bh=COuHBvACCCGA8bnEg9aaZW5t7dlzY3YP96OucDf/aBo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oG+pZqQ9stlRXanry8XpkmUN5cLYi/N16FjKEVFqJaeLWwf/MwxeHgTfU68VH9V6MXRgaYBL2oy00laanMXlv2yRTHx6k6NhmgYUaBzWtHEZwu8U0gaSdz1BmJMGXmyWDpxGy7jSM4UQRLpon4i/EKQidFFFiakXPIXhYV/ezOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rIAOj6Rm; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rIAOj6Rm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=So2bLn/QI3RHFir3J5CwFbM/pWVOwwwYyy7+b+6ohQTJyhSIxqUWXrP0aKknAOoTE/i7gn0Jpx98b5HCBUxMZ8jIyUDz6LV0CmuL48+BBYmuXl2K8mvKVH+vxNGPDvuiS2RiD6fjfksuEMPfu9nTc4Xd7Qj4JAYdtbj/MeET4y5v+ZOVYHAaBq9nTjGwcQ+pcyT+qzxb8SC59B3QSzYCKf2joZupKG2aJ0oyV8SVvY7EcXTSHJb2SyoVqKmWPcwAERDdc4FsNJQe1iwW/8O8TKC/1L0/oMg0IIGCURSaUgRqLoHmeu7UtWEzMIHgf4Melug1+rx0woEZbqc+k1WCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y3R6yllHqQr592cjY3LF0sn4A1wytUett7nHs8vY3s=;
 b=Ddu2hUxNQkl8Rrd3mRWCbJBK7PLsMyKFQyMfJDVGDuKc6T1lA0EapWpzK5D9/DbD5ql5ikgndVUG6rREZUk0VviUdDozFWTusw2SRPAY0L6ECC3/nAdVFXCtvfp10R8qTtuyy7PCoGf8H5DchWVs6+jSN608oSC9fGa7yd9U2lc0kbLDMjLj86sfAn6fz6486ew+cLJ5VowRnZMFR1MI4TaUTfulqQCxqvR8610+F97B4NYbbdm194FsSqa2MLhrtDko5Zioq4nJTPPeGEsHmxxzr4nu20w2qygIVgutWPX6En0/f7oTmYJcKC+KZq0Gd3rqr4StbZYhRyJ10+Jxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y3R6yllHqQr592cjY3LF0sn4A1wytUett7nHs8vY3s=;
 b=rIAOj6RmIVwVN7JJh9/mt5D6X6wvVxJgnPWKYzJZc35yFUUf+0/is3Tk6TP9OhK3Fz0KQgjxbkk/YUURiqbk3qo4hiOt7OB2kFcTgqzDxGjvKIMshiyKaP5r2iGlUhuxqva1MIjlPkW9cXLhpw8coerilZQcg577yqZEodVwVgfhrw4mnrf70Z3uNE24t/QtqFTNgsr0TW8EX8TWK/dHB+IJSMVjMDt5u4qG1HKTWp9nTG1Wms2uraEbAd2GsY4qAaaMX0r/O+bCCJVyziwC5TmQjJLQ96UkeaQpz16jk4ea5LT4VISrp7mdiCfqcf/bVXk9+TYlsd76ekrbivrZKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 13:54:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:54:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 22:54:15 +0900
Message-Id: <DJ4KIA6ZQKT7.1EYTZ35IUMVA2@nvidia.com>
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
Subject: Re: [PATCH 1/2] gpu: nova-core: Hopper: use correct sysmem flush
 registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260603235034.131354-1-jhubbard@nvidia.com>
 <20260603235034.131354-2-jhubbard@nvidia.com>
In-Reply-To: <20260603235034.131354-2-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:604:25::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: b8382d80-d886-46d0-b41d-08dec62e9a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Rbqu5p2W0qpYDsXAgKKDwZdxYc0o2sLQzWxFeXvuECgsabvFv8on7z8xMisQSI8D0v4V2yviskf5pk/8we28bAgCG9NhdgbjAJKfByeimXDoWHObrpdQH/epQLnE+fRPYsJYpKHYLPyISsL68RU92FGg0t4Ucd2GiRTSkzjJlwvjzaJwpphIniWKf/3KKUy8k5Fm/Erwv3cmxUHgwPy//YnnAbWMZemNLmfMEn9QRy/4duwhm6NhmnI/3HnG3+DE3/Hofeoh7I2QVIuKhs2+c1uFL6IIAGeF6LfOL/RUNO0MdsPPxj5bEv72CqxD6XRfnu0lWqKnw4X3tcq0cXf3JN/373Y0m1s11TSGWFJdLtNE8+zj75ziCD6f8PXcmq5QEIZNUW41vN0//VSy/yGgFryohVc5jm0gdgjxOrz8GsfpjIHOy9zutBLlkRt80zVYt9APVAKLW4m+74CN1VzBQP28bnKkabQDsGgc3T6aUdpqEs5aax+8m9j3UkN5vvM9AAFHX3ZMHxT8+n6AtjPUBIqyrqmJP9Psrmx9scGfp85dcUTtyqAZ+oncJY7Sd6Vo+vrPDqLupP7Id+lN6snpM2aqWjZzfaIpbA/rL3zOKuHcl8ADLkaYf2xXyzBUd/Hw4dPAEampsolIoTbcscdquaKRp6EtpZCZF43PYfKw2nm+W9YpdUOd/VqJ1I7yXBtP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUVaRXl4V0V6QXRUbjZVUW1KNHgySkRidktLMi82MktpbHVuVS9hRWQ0NFE1?=
 =?utf-8?B?OS9xZDlubjVMcS9Jck9IZTc3MUtORVJBaHhiSHpBYmxueW13bmhMbnQ1WVpm?=
 =?utf-8?B?MGgxOW8yR2pnTGRpYk0rNjlUWWFzMHhDYkEvMFlIdkV6cmZQdm5YYklndFE4?=
 =?utf-8?B?cCs4VkNNVUVNbEtTWEFhL05uOG4xMVNlNFhkU1pvUEtHVkhGOFZGRnMwby9q?=
 =?utf-8?B?Uk1xcEhheHBDUGZSNkRobkRGRUR5T2x0eUhtVUxZUE05c3FScmQyWmtkdWxM?=
 =?utf-8?B?RWJXYzNlVVdVTUU0OHFJRStHaW9RdzlYZ3l4WUNiRmVvNzV0MEFRRTlkaFVl?=
 =?utf-8?B?ZjM2OXNkbittaVBkSWo4Wm5QbW1vSzRERTFqeDgwM0l4S1hoNnU1ZytXV0p4?=
 =?utf-8?B?VGtCdk5taklNRkJ3SmZlTVJJT0dlMWFnb3UxdnEzbU1JUWdmMEs4ZWxYYW04?=
 =?utf-8?B?Q21DTE1zcVQwbDNPanVPUWV6TFR2WGUzNW0vT01UZkF5VXpKT2RqZ1FkODcw?=
 =?utf-8?B?Y3ZHam5pWThnSzhuZVBDZ3paZElzUy96VXN0cWI4UGRyWm1rYTdKTVJuMU1Y?=
 =?utf-8?B?ZVJqWW1tcDJNVmlKUmVTM1lRalFtOUhuOFhmMWNTYitHSmFUVFR4b3kzMkhv?=
 =?utf-8?B?R3ZXQVBtbzJMVm1zQjhOa1N3cWsrZlFlR29oNC9yaFVPZFNER0dSQ3U2OHJZ?=
 =?utf-8?B?V0p1UXhxM1RERVBpdk9jaVQzYitXb1E3ZldtQ2RiWjY4SytBSjFPU1ZaQVdo?=
 =?utf-8?B?QjdBeGNqS1poMjZPT3RUcUg0bnRsWTZmQnB1RkowcHVGejBEUWJZeHlvUmxl?=
 =?utf-8?B?VFY2NXB0bE5XS0dFUjd5N1NZU0lmZVNoUmFrL2IwZDdLT3JzL3ZORExYd0U2?=
 =?utf-8?B?akorbk5DMzdlUGg3ODY2eGIyMkE5cGZlQ1p4N0pOL2hNN3FHcWQ4c0haOG1S?=
 =?utf-8?B?Q2w0ZzQzNGNnOWd1Kyt0WXRXODFPdDE0RWhzdTRneEtSa2czSGZuZHlRMTJ1?=
 =?utf-8?B?SmxXTDhFbFZSRlZzS0ZmRGVLRU16MWx1SWNJR3hYd25jS3Z3UExPSXl5MGRT?=
 =?utf-8?B?azVPNENXOVlhVTB6QjRUbnBkRmNJczc4MFBSQzllMVhtS2w3cmVNckVxSW9E?=
 =?utf-8?B?ZDkwckRMRHVZdkdPV2QzM3FIQUFPZUJxeHVQVXhnczBKdjk1UEJWbTBzYkNu?=
 =?utf-8?B?QVgya1VybjRZZGtlV0N3akd2NStGR2I2YjN4N0FkeGZNSlBLdlpwVU9rU3Iv?=
 =?utf-8?B?YXlLRll0c1crL1RvZnlheTRpZS9PQTA1Y2VzaEpKQXlYNGkvQ0svd2piWWQ0?=
 =?utf-8?B?ZUp0VHlSb2hXVldNamdlYXhndkR6cTlrVXJmWGx2cWMxSVdLSmx2RVdCN0JY?=
 =?utf-8?B?TnVFM2ZTT2N6eWo5d3VOU3ZQamJzc3cvajVBaEVoYUJLYVVzaStTMnZ3NDc3?=
 =?utf-8?B?Y2NpK3YxSVgwQVpETm0yL1ZzSStYL2l2STNnbEp6MUtKbFpvQ3o0WE1RQ0R4?=
 =?utf-8?B?MEV1REIyV3B3ZWRVTW1aWFJ6cXF2Mml1WnViWUpCcXUrdDJ6Y2s4aG5aUU5P?=
 =?utf-8?B?TmsvMkFKSVpOQkhJY1JYdytnZFdaNXRwVm5rVzExRkFDZ1NjdG96NWRleGZh?=
 =?utf-8?B?aFFWSWNiM0c1cUpFNGxMQ0Z2aVZLbW5RbWIwcm5wbzBJWGl1MkdSdjlrV05n?=
 =?utf-8?B?NWdzaWNNakdHMkdXbXpjNnlkK2U5aFBMRkpJeTcxa09oV1VDOFY2NmM0Q29B?=
 =?utf-8?B?anRpb3BSVTRVU3VWaFVHcnhyT0Fsa0FSQnhEUEJxZFJKMjNGWEhGZ0t1QVJF?=
 =?utf-8?B?SzRsRGg0S3phYlBUUFcwOSt6Y1NiV3JqVFBnc3RPaE01U1V5NnM2c0o0b0Vq?=
 =?utf-8?B?OFlzdzB6TDlEK3ZwNjVPbzl2TUQ5NEdhc0dkRzVsOWtYOHA5YkZCL0xrL0Zw?=
 =?utf-8?B?NnM1RExPSUcyQ29KU05WT1pjZHF5QmpJSGhnRm8xK25HZlBHNHZ5QzErRjdQ?=
 =?utf-8?B?RFJFQWRQNXhneFNVUWZBVkJKODU1RE9MSzlISFFFdTUzb05pRTcwMTBURVFN?=
 =?utf-8?B?SngzQSt2aS9yd1ovelNVZlRvUlg3SGFxK3pTZVJFcGVBVk1RRUpnYWJwMmNY?=
 =?utf-8?B?R2huNmdHN1ZIeVZaKzB2QUdGTDg3emNTblJZSkZFS2wwT2RsNFpiVXY5SGto?=
 =?utf-8?B?ZUVKUkFzUWIzdy9YdHNPSFBtbHdmamlxZTF4RnRsVmExaDFsKzBWazV6eTN3?=
 =?utf-8?B?MGRpeFNsMmM1NDZFa3JFanZNNlZXOW1rZGRiUU1pRmE4RlVtT2FITTRuQzJL?=
 =?utf-8?B?WC9YaG9tUFlUbEFWTERCZzN5TkJ3N2FuU24wQUJ3dDFQTzRpOEVGSHZFVldP?=
 =?utf-8?Q?E65r3o3yueTgxtN33LUqrPzK8ceTHPW+rBa4QJuEf/Onc?=
X-MS-Exchange-AntiSpam-MessageData-1: 39IoET9F9aNBYg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8382d80-d886-46d0-b41d-08dec62e9a28
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:54:19.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQOb0yjJf+A7TanhqGwDjENJArQUSrN1qyDuHauTR3Y4t6vlqCxo4taxtk5F5dOJiDt/ZZAa8iVwuD6jwrr6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437

On Thu Jun 4, 2026 at 8:50 AM JST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 0f49c1ab83ad..a57e95140ec0 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -131,6 +131,22 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->=
 kernel::fmt::Result {
>          23:0    adr_63_40;
>      }
> =20
> +    /// Low bits of the physical system memory address used by the GPU t=
o perform sysmembar
> +    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
> +    ///
> +    /// Unlike the Ampere `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` registers, whi=
ch encode the address with
> +    /// an 8-bit right-shift, the Hopper FBHUB registers take the raw ad=
dress split into lower and
> +    /// upper halves. Hardware ignores bits 7:0 of the LO register.
> +    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00100a34 =
{
> +        31:0    adr =3D> u32;
> +    }
> +
> +    /// High bits of the physical system memory address used by the GPU =
to perform sysmembar
> +    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
> +    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00100a38 =
{
> +        19:0    adr;
> +    }
> +
>      pub(crate) NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE(u32) @ 0x00100ce0 {
>          30:30   ecc_mode_enabled =3D> bool;
>          9:4     lower_mag;
> @@ -179,15 +195,16 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -=
> kernel::fmt::Result {
>          19:0    adr;
>      }
> =20
> -    // GB20x sysmem flush registers, relative to the FBHUB0 base. Unlike=
 the older
> -    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address =
with an 8-bit
> -    // right-shift, these take the raw address split into lower and uppe=
r halves. Hardware
> +    // GB20x sysmem flush registers, relative to the FBHUB0 base. Like t=
he Hopper
> +    // NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR registers, and unlike the old=
er
> +    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers (which encode the address=
 with an 8-bit
> +    // right-shift), these take the raw address split into lower and upp=
er halves. Hardware
>      // ignores bits 7:0 of the LO register.
> -    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base =
+ 0x00001d58 {
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base=
 + 0x00001d58 {
>          31:0    adr =3D> u32;
>      }
> =20
> -    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base =
+ 0x00001d5c {
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base=
 + 0x00001d5c {

Since we are switching the name to `FBHUB0`, wouldn't it make sense to
make this an absolute register as well? Because now this reads like a
FBHUB0 register using Fbhub0 as its base, which is redundant.

I know I am the one who suggested making it relative, but after looking
at OpenRM again it doesn't really seem to make sense - there is really
only one base here, and the register is defined as an absolute one
anyway. So my bad for suggesting this in the first place.

If we do this, maybe split into two patches:

- Rename `NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI` into
  `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI` and make it absolute to
  align with OpenRM,
- Introduce Hopper's `NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI` and use it.

This keeps the changes local and simple, as renaming makes things harder
to track.

As a side-note (not for this patch), we may want to move registers move
aggressively into sub-modules. The Hopper register seems to be only used
on Hopper, so it would make sense to me to move it into a `gh100`
submodule when we eventually move these definitions under `fb/regs.rs`
as is the plan.

Or maybe we can have an even more aggressive policy (which iirc has
already been mentioned on another patchset) of defining the registers
directly into the HALs themselves. Subsystems like `fb` only ever access
their registers in the HALs, so for them at least that could make a lot
of sense.
