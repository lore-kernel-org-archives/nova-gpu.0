Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A89224AF9
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 00:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788740687; cv=fail; b=RuHQvbcFdK4IAtDNAFTl00NbXZTDIb05XX/AZNpYXSKVxn3S75rogAvOTEex/ICsgQNpovzhDrNcIoGbiIFS0w00a10eh9obcXE8eeXdB+ykNjKilCCaXIaKM00xidhad/NWlR8+ysmB2+JzBb35Lh+XjZvwVWC2i90xl2R51V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788740687; c=relaxed/simple;
	bh=3f3Gt6dlxgx9g7pnbo3/8XtDWcbSbur2R24gZMWiVJ0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=RWSYVxqanXRMPz3SYdxWd5JCguglBZl1ZKDSxLu/NTJg5o+Ria0zC76ZDPZ4xtqUKoxefD0TZ6fL8J+blNTmKlh2lks/gLgcep8Tl+TOsCByNTOe7nO2Q3A4imqfwqStLgFit8twpqTdfZvIHxAdIZIjIZuMwMF7v5g6MAxzqgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nrvblbGv; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nrvblbGv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwP3zfzoTCdXq2WKv/4VVyx5I3wRc+JVW0wtHHOrQ0KgvtZqvCI+Ft0PTNHhaYPtiYUoi+kqni1hqKeQmfFqRcyFYVtDQVO04EFwgIVSb1WMbT/TjhDxBpOKMj4EsRNmuZkB2Voa7A2gPvl0zUw1817wAUmpNbIb/Ss1/41CAf1s7Hvi1R7zmnvDH8xhaNdnb15N1TrPiJfasUk8IYCZd4zm9VKsjWhnNxDYDm5T9o2PMQzb1uC+lowwmbPYhyir2+craBYEknwuC/cn8+1LMBwefSSSEEJjHuTZoYxwTiCZ2Z+iUYsyGA8ZXbY2TAKKMFF/5nqIl8esRro0WYZB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1zN7phipSwsEGfDDd89CiOc0jT74WB86ANrhTAahQs=;
 b=LZHSC+ATzoItVWYHqXDC8piqoNLGBvi3OpQOsfrNkkRGjssUtKUc3rfAJNsIv9dkR6SS6dOUS2wKbEW8Cq4FN5hkrgJfTNs0NQYbiRtRfJcMTyR+cIingwXO6WRRf1rRRm43FdpuCsaj8QbF/fN27Z/2ImXtORXBolVOL8mdfXL5MxCX+jmGxQl0ixIRwkLfVE6nw8EXBBDmQoQOFxLmma8z3masifbJZyzmTN2HWHkJsUbVu1ZwdoXBw9cCjVbXdtd/mbM38gKF5IEc11v2ZLs5qgHZljFbA//OI9vo4FtIl5/QNHg1W0OAEiCnUKWoEMEz5jMTZLD5Ux/DUAb5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1zN7phipSwsEGfDDd89CiOc0jT74WB86ANrhTAahQs=;
 b=nrvblbGvmKkuX/p8CWZe4yhI5eow0vIruvypWo8pnQa6erMG8x0pS0nvfuBM8DZj3bDdAJyCqaK/5xyYxbyUIqn/+ux0l2JuPtDWvVVW7djN8rpKuj9fqcQktrwXPwbSMNeRTbm6UXbaZP9KNnLN1V6XbiFM0RPJHrdT3XXaj2WUk7ND1cm3bZU4l2+uTmh9nSK5TxRHMSGt2JtyxW1+pQz5HwdEa96RaDyoX6gQ0CZ1809PMNhEw8AoZIMFD0IfOflC05Yf0d7O0ALue/12pUOr1sjP13NvnBGFQaVG22qil0Ip/QyzwsoXFS5wPmfGT5Xd73QOWgGX+dJBvdN35A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 00:24:38 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 00:24:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 09:24:35 +0900
Message-Id: <DL8NNDZQDPC7.22UD0A6TQWJ3Z@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v3 06/14] gpu: nova-core: add the GIN interrupt tree and
 allocate its vectors
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-7-jhubbard@nvidia.com>
 <DL7FN5S6RSRI.JDTB3MREKFVA@nvidia.com>
 <8ad883c4-378c-4cec-8f45-a38c97d0c494@nvidia.com>
In-Reply-To: <8ad883c4-378c-4cec-8f45-a38c97d0c494@nvidia.com>
X-ClientProxiedBy: OS3P286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1a4::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d7833f83-4e9e-4653-5201-08df0c7666ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|23010399003|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZLvY5IZMME96r80IjP0rwjbRPbk6du9yPxytzEnCzjaBe8QLElnOnTafUKVl4JY2kFHd88n7UOo8PTExXUX1sDw4vLoNy1+UUmLrgcpiJpvBtgSmnCk3AjLsTxxeybk2Pfpye9LHSaMp9nbhokOIXKo3zFOOPmCenMKrLzIialntGe3rryVuhPr2ZA06buleRh7k+kkhPPgqHcBjY5R7psRSEOJs7EmBIEFcJvcxYS+Vl+o9HulOyxFKgbq+DotFGL+MMg07GcA0BRMrOaNB8WGEq+9uADVi9UwfApRqPBkFTH5mNJplbotGiK7h7GxT2sQQshkYG8HmfdU3p7zIHbzhFQTmqGHPiy/Bm43kXXnluAqwc0iYz4jO7BJzOpG0MJeFb3nNTYanihLWuu/zW5T+bxtJS6COKh/cyFUXKnDTFWmsIeSLdPj0uznDPmSRIaQGbkPLx1Lis80QNrsZ4V5Yir1cvDVd9jOlevdSo/v1jJ/16dtYvW+pYHWFP1hRl4/Q1csE+RKsScZ6SU2Mni0K5fLNeMXtlH92nSLn0cop1zGqhPWqg0T3kOFPyIVwh7bDtxaDL5/qIs50fyhowWHXpfHhEM3511vNhJ8olB8vJtNAO0LdG10XzWFyo6RJf8J9zlCV4pffFOSSp/xJrBHn1yiCcOUzz1x6m8RiN6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0p2ZGMydnlrazBlSGhRZmx2U05xSTl2YVllMDNOYSswUDcyWGV6NmpzMXFm?=
 =?utf-8?B?Z2s3bkhzQjJweDRKR0VNcDBSRmtpTWtkdnF0VSs4bXQyRFgvZjhtSnJCVm80?=
 =?utf-8?B?R1JzNW9wc3M3VHVETVJRb2Z6dVFYU1ZhNGZyVzc4aWRoR3dlRTZFVDExUEpT?=
 =?utf-8?B?am5vNVVlNnEyMTB6WTdha0VrMmxwQmUrNVBSL3dWY09iRGowYVBiZTVIUHhL?=
 =?utf-8?B?TGNWTXBSeDFtWWNUT1BRb05BMUVjalNkL3lPUENYQUpqZUFyUGplWFhmdHFi?=
 =?utf-8?B?S3JhQkxXS3hXNVJZVWl4b2pVR2JGby8rWklyRGl5SlhXQ3dtMHpQU2piOExx?=
 =?utf-8?B?eURwUDduZWNJVW1MNEx1NzV2emtLVTgzWTJaTHFYK1FudzRXYjNsQWdLZENB?=
 =?utf-8?B?OXVDVlBRVnZ4eXFRWGszMXNKa0dvbXlBdWVnbE5sVFhKTkpoMU96dXZYOTRU?=
 =?utf-8?B?Q1VWaHMxa20vaFp6ZW1PVFpwYWNhMzRSMEtEc0JmcFNqOVAxa0FZSUd4N1Nx?=
 =?utf-8?B?ajlxOW1zdVkwUlRXT05VY1hJcXhIRzhyT2ltVUdlQzVtcDI2WHNvSGVJR1ZF?=
 =?utf-8?B?a1pVUk5oalJSaklaK0VySUxVOUF1NnNkNmdLK0xVUXZYQ3hJaVlzT2E0WFE1?=
 =?utf-8?B?OFNPMStXdDBzS2o3dFRNbDM5ZnlzT3N0YytkbDBjQ0d0bkZZeFlnTFhWblVK?=
 =?utf-8?B?NmpmNmtMejZSVDhaem1wS2JEMWttM0JTQnEwOHFNd29SaXBuNHk5aU4wRmsw?=
 =?utf-8?B?a1pPeEYrUk04ZW84MXRYakU4N3c4M1NsRGt2dG9HdmExS1dmbEZSMStXLzJ6?=
 =?utf-8?B?bi9LMmhUUTZqcThmUVhSeHRnOExlT0hZd1dpTTEzM3Y2ZjRCbU1OTG9FbGRi?=
 =?utf-8?B?V3pUMzJFYTgyU3dpUlVrZ05DenNYZXVlUjFib2Iyb1RSNGJKcUl2YXJKQkph?=
 =?utf-8?B?YkExdERQbW1nM3IwZHZ4Vlc5bmtkTkpvbkQwSjdZVE1sZjA1MDlDU1Vpcm52?=
 =?utf-8?B?NXBzdzFIR0NTMmZoQk4wVjduRXpKbTZvcmJPMFRJK0VQM3ZZdUdwd09relZO?=
 =?utf-8?B?WnlIYU1oZVU1TVVudEEvQ2tKSHZEb1VHNW92ZUZvL0FBU1FRdEVLYTRJdEF3?=
 =?utf-8?B?bm5jVzZmdml6aUN2VlUzMS9DNHFxOFp0bkJDWWNxL05EdVBpM1VuT0ZZb29Z?=
 =?utf-8?B?Qm5DRmlSOWd5azBXSlFjUlNZaE1mTG56YTVWaXM1QnRjQ1VHMEY5Z3JTd3R5?=
 =?utf-8?B?dlVRYSsraU1Ld1lRb3VsZUIrV1hRY1haWmgvUjkveDFuOWpZRnJldmVzOWda?=
 =?utf-8?B?SnRMQ1R6YmlYRnBMNDBXK2NmZ3U2Y3FiSWtiL1ZyOWlQbmIxWjV0UW5EOStE?=
 =?utf-8?B?Z1M5YW16eEVnOUNSTk4xNTBxT2pzc1RudFA5cDMrSmF0M2Z0MktUejVJejhV?=
 =?utf-8?B?ZlpkSkNNNkdVUVRseGRSb0NBeWdRcWJXSnBzTW1keFRyNWlZODZOK3ljRE45?=
 =?utf-8?B?c0svZ2F4YnNsa09tWms1MUZhcnllK20vZmF5b09GTzNvODdCVWpKSTkwZS9P?=
 =?utf-8?B?UWo1cTR3V3d5ZUd1UnVvZkpQMGtvTWdIU1UzNjlvSVc0ZDRjOHhaVUxKd2xR?=
 =?utf-8?B?RmZqcmtFVEdMNHhhamxDSEVmYTRqL3ZtV3BxZU1qTjBJTDVHU1VUMlhUMExk?=
 =?utf-8?B?UzY4c01qVmwveGtiSUxUcG5jWE9naW1zRlBKeWJiRWpMVWd4MW15bENuWDdU?=
 =?utf-8?B?RFl4L1gyM0svNUVrLzJ1YUlKeWo5ak8rRGVqTk9VcW51NS82dlZEWk5rT1pq?=
 =?utf-8?B?NFdaZHlWNzJnQ2ROOWw3UDVqVldmUEdhYWp6YnpybkhDanE2VkFVRzd2ZEh3?=
 =?utf-8?B?aEJaQmFRT3NXMFNPSytHRFVwV3hxNEZHUGY1a3hQclFqemdVTDJwWnlvZTQw?=
 =?utf-8?B?V2krdjV2MUJLV2tlb1JzNHRmRWxJV09iTHZEaVFCbTBwczA4Tno2Um91Zmpr?=
 =?utf-8?B?ckZIZkJ4cUViTmFhMlNMNU13REZnOVJmQzlhTGZJUyszREJ2KzRVaU83QmU5?=
 =?utf-8?B?eEhULzYrVUlmeHhKSjZlbmtWN1gwWFFrU2drdUpCdzdqenFaaVBWa2c0M1Vr?=
 =?utf-8?B?OUFkQWZ6c05tUlhzNGovMEg1RHoxMTdFYlkzU1ZZMzVSUUEwSHYvK3JKYVY5?=
 =?utf-8?B?bk83Y0IvWUdhSmxLV2JrNDNwL1ErVzFJUDFHT2VQcC9uSDFsZDRqQkw0b2dy?=
 =?utf-8?B?RkJCOU5ndHllMXJiUlRIQkpKWk1CSzlUYTNZc3A2bE8rOWxIWlVQNGUvZmlj?=
 =?utf-8?B?eGFCeEpvWWhOU2duaEkreVp4R2ZrQVZCZ2R6anVPdVczR2JZSXc3U3lhT2xr?=
 =?utf-8?Q?TAelB+AlZqM9F576ZJhuqVB5xHYIVy6ZkgnFG4xMBFbmS?=
X-MS-Exchange-AntiSpam-MessageData-1: JazuV9x3DLF+aA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7833f83-4e9e-4653-5201-08df0c7666ed
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 00:24:38.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK5VtfAYu2c42qXM4wrn8uoegmFXR/yBXuAc15SmGy9WEWMAoYMbCa/Ftg/LvY371WsdtHjGG5ig5lCj7mE2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

On Mon Sep 7, 2026 at 8:10 AM JST, John Hubbard wrote:
> On 9/5/26 6:55 AM, Alexandre Courbot wrote:
>> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
>> <...>
>>> +impl SubtreeVectors<'_> {
>>> +    /// Returns the interrupt type these vectors were allocated as.
>>> +    pub(crate) fn msi_type(&self) -> MsiType {
>>> +        self.msi_type
>>> +    }
>>=20
>> This method is not needed. It is only used by sub-modules, which can
>> access the private `msi_type` directly.
>>=20
>
> Hi Alex,
>
> Thanks for all these reviews! In addition to applying fixes for each item=
,
> I'm also doing the following for the upcoming v4 spin:
>
> a) Rebasing onto Gary's IO projections, and taking full advantage of them=
.
>
> b) Fixing up all comment prose.
>
> c) Using a type system instead of returning a bare u32 for some of the
> interrupt status reading and clearing.
>
> I'm keeping it up to date, including testing, so it's ready whenever
> you get tired of looking at v3. :)

Still on it, and I'll send some more comments for v3 today. Let's
include them before respinning.

Thanks!
