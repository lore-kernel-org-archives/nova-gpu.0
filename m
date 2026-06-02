Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8653B9D84;
	Tue,  2 Jun 2026 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387250; cv=fail; b=Pl/te3ynyLdyvGhNkZByIFX2+w8BUz4RZq6ZAsr9DVUfFXhH3l3S/NiDgtcHyomCBgt+GNB4RudWHj+eMxQgmJb5vrDZIHpog4TpSeI32gML+CHarGutRW6+uL0LoI7QoVEn4xYRFZBzL1BU1TeubasTv0AXEJ2KfXEr332SN0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387250; c=relaxed/simple;
	bh=JRm7RQD3+dk5EN78RUekBUpB0EWaYSBeboXwPwvWBcs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=eCzNxrXoJ8pMfO1n/nfOFtfW7YAnLZXEmJJCKLKeJX66xrw5FNz5751n8zwnadOQ9ccFgUVDffZ/zUA716QJ8G01YvnUwoH+lotTEBHQ9E3og4q97ojbJ+H27oCQD7fNBQ1Qx6VS8dQuAh+JwBUIHTu0ZVg+wih3YeNsgpWD9/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eftD9KpN; arc=fail smtp.client-ip=40.107.208.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eftD9KpN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8swOr9jyBMT/5aQPTcTIDYE7+gYdi/EIL80unIiqKXfeys/5xTAWVRsWXmWooSH78iW5/iHCrOMfqwzt2mCFe+Q8A1mX0ErlBDZVz6QkaQWldwShscaRak9wFZE95nZooF83kklu8BrEX7RBzM1wjm2uBYKIY4sS4rb3BiUWg3Y811362G+Vj4+E8+tzDqu5NNxAYpNSn9S33hCbI7C88k9yZcCsbZtfr7Fobmlxipas3ecXUiynEyIWKQ5Zh1F+L8Gd7lP86q8RRyrr/CfvQEKCQzz/0LP58W9idERhYUV5dGqfLT3Kw8eoFoopwGvM2nmwDdLf/DPKSbsQT53/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laD9usHVThERXoXIH3pMOBSv3aJH4icHC0Jl90CbFAg=;
 b=lLcMGhxdyG3orSnd/e7zmsjkKIvpqd6lSpQUkKgxeX1oKpt9Tj/U9BoiBBDRgiK0i/JH5ADhY2LUpQBapLVT4WDb/9iJWwzhbXzUJjLDfyq0Vv+B4PFtfR4LpvdCTce+zJFovsmCU2A9dSOYoyzN7OJRlblY0BL02NRbjJ7mJZRAntjm1tim8lb4aZvN/C5tzkoAKp0fqQfVReiFWRqrz3/Td72DVeqOcS2E44rvWjiNpbvhR+saSPDGldfuz1/Zelsi1NNM8DA9MIeVgx9K6p5r/uYX+RzwQZdlPPvfB9WHmeXPS7wzG+sjRYtFtxrqsCoocKSG13Dnmbap32jS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laD9usHVThERXoXIH3pMOBSv3aJH4icHC0Jl90CbFAg=;
 b=eftD9KpNrBvCeadOQf8gT7qCzf5WKIhRHHs6kH0mk2GGgP7URpdBOdrXP+lOT1UwNSukYRVxfNRcMZ60XFXeL9zsUYDg3rRUIV2HmQb8n6HZ8tPmOKE628jZ7cLk3Ukp0f+hXfuM4briHdvtEXCA0N7fbRdP5aPHg1yBENgtWZ8Dsfyodpw0zUEyVZKTuY/+Cu3+CixevU05ZzjLTRl6Uo2smTJD21/hBAuHzlm09KhnXAWGZcl1Dht0Tp0IAtyj+2O7xnWflmBCPebnvfOvKZkJOw26KlbdmSFRDCoEpbRMq/0rUt4hmchQ8DnmG1Gcm317jgESJr6OPu8AdflKjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 08:00:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:00:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:00:41 +0900
Message-Id: <DIYELRIY144A.1YAUJUQCLK2JH@nvidia.com>
Subject: Re: [PATCH v12 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "LKML"
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Trevor Gross" <tmgross@umich.edu>, "Timur
 Tabi" <ttabi@nvidia.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <nova-gpu@lists.linux.dev>, "Benno Lossin" <lossin@kernel.org>, "Zhi Wang"
 <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "David Airlie" <airlied@gmail.com>
References: <20260602032111.224790-7-jhubbard@nvidia.com>
 <20260602033059.2B1571F00893@smtp.kernel.org>
In-Reply-To: <20260602033059.2B1571F00893@smtp.kernel.org>
X-ClientProxiedBy: OS3P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f4::19) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0083dd34-ca68-4529-4de3-08dec07d0cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|6133799003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XxnisASLFu3kduhoXS8w5OeXp07Zw1fWZqWyi6QpZ/NYyZkJrjFf5JHVsI0tNz4DuR/lRgB5oAGtHVgEUUV/LqKIs27UUlUBCrznZbgHuapR5RIdtTGELL5o0u80PvRIO5E6STkAEwzI0cK+UjneFqLZtFw+rrrDu4W1uKoezgrGodYpB885FPMjTUG1BAPbOY5oobDSKvo7Rd9pzr/drM5Fjtc1HkOW+8mqKd7EATI7Ui3DdwAu+s6vODUpSoIRHTJ5Gl4Wz1ZrULZ5Oru4JckHxMeq51hUq2HWC/GSVhjmuj9PLz5Hqm+N7P6tDdUxuqJPibnPKTYmdGuP6k4Wax60Vt+RPrr8GIyAE23L/Syg02VHBJ3qEBMs5k06NB0VKu7j2I9nzDbSM1pQuHgxVR1GTC353g5oOZQp7ob1kMghhJA1+cVu47ZCz2QcnkWdeuQ5poxVzLDsDpFCzq9JlU4DxiJfrksdo6maEKBrODlbXf9XHuHfB4pokSo2YDs8JZsZO2KYB8aq/k4t+JwBlqJzpWW93qsVnTXk6/Ml1WA46cHfCrLNv7FzHE9DiPHbKXWoSaxoq116rJitZw3yfsg1S7ksFPYoFom7+/0EyJZ7jEnW8ZBIHbRISnunaHJu06DRDiMpe722IUTqxnMAuxd1xfJE1grIkjj3Lttn4MN8b2amArZ7JcPyB3xY1Nqy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(6133799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjN4WVVnZzN5SVcrVmROaWlLRWhNYlZ4U3p1VG5Kb1pYUGRtTklqaFRjOGhJ?=
 =?utf-8?B?OUFlU3ZQU0JWZnZqd0ljMTJNTTRmUXVzMmJoeTF0aHlmanFhdUw5Z0M5dnRt?=
 =?utf-8?B?MVZFSXh2Ulc0elM2enlNbHFsWFJJSFJKdldUU1J6ekpreHVIamZHaVZZeU9n?=
 =?utf-8?B?VUZSTHZudm93RVRybzFKaGF2dFAwZmlwejdpbkx5TnVwVDcra1hVUmJxVG1O?=
 =?utf-8?B?WHJZK2JmbFMrN25mYmt1WFZRQUNOeCtnSXl2aEdWSGtBUWlYRjEwSG43d2NB?=
 =?utf-8?B?YXpaZTJhVzA3ZWpOR3hETWdIT2wwYzlyV0NDSVFBNVdHK3o0c1kvakx1eXg2?=
 =?utf-8?B?Mm9EUmtUczYvZHJZQmVoMjRkdHl5dTREM0lEWnBiN2MrR1B6Y0tCTzRXOG45?=
 =?utf-8?B?OTRJSy9GNFZaenpHRVVVd043OVYwUDcwL2JEbFlPZ3dFb3FVUTRCYWNzeTc5?=
 =?utf-8?B?blc1VWtCSExmcDlFYS9MTkJmbTJydHNIR0J5RTF1YSt5dFdCYW5sNUJuUHMw?=
 =?utf-8?B?SlU1Q3JYV1oxaTVjMUplM0RNVm5ueXBFUTJVaStISm1FYlhXOVljVEx4UXlh?=
 =?utf-8?B?UHJlclRNdnVjT2dlRnIrQ0p5aWV6ZFI2bzNNVFJHbjQ4SDBnd0lxYzZwekdG?=
 =?utf-8?B?ZlZOZm1xRmRmOUhROXNUditFQWlNMUE2Y0svc25IVG1DUFBnc1hDMksybURC?=
 =?utf-8?B?T0w2N2VCSkFrbTcvQksrUGZTWExNcG1hWjNJelFXTTdTUW5kbmFBT1d0dDZq?=
 =?utf-8?B?d2l0aTUzT1hHbHprU3RHbTNQYlRUbXhqQ1p5bmtMM3NTQVBGekNJNDg1TWVC?=
 =?utf-8?B?OWJib2FORGtVL0psQ0NzQWN6Nis2NzFBYWxLV0VXMFVVeVRiVFV6YVRBVmtw?=
 =?utf-8?B?Q050WFR3V3hUTURQRUJPMU52bnJ0LzRYL2xmM2FKUzFJUzFvdXF3ZmdYa1ow?=
 =?utf-8?B?TmZNSTdDeXAvSXBuaUltNFluUnZlT3EvWjA5elJ0NlF0aklXY2VkTnAzV0pw?=
 =?utf-8?B?U3dqZllNYkpYSEJYcy9GbTNsZUptbktUQ0JMNDFYcWFiUUV1bGhURmhKbTJa?=
 =?utf-8?B?VU9RS0xoVWtBZUtZck5EU202TkV4WUxkdnBQZGpNTDBGRTNpMElGR0gvUUNW?=
 =?utf-8?B?c0p2UEwwa1Uyb2w2cXNoNGEwNlc4eVlIakhxMk9CL0hCMW5pSHNkcTR5WG1J?=
 =?utf-8?B?WSt0SU14ZGxnTC8zSlpFZU5DYmMwZ25aaHd3YVNna1hRTGhHSStDTnAvSVhp?=
 =?utf-8?B?eVhnWFphalNacE9MSFAzNmtzOGxYeW5iVzR2dGQ5NGthaDZJdXM5KzZpalFy?=
 =?utf-8?B?T3BXUkJkc0lpQkI2eHA1cHMrcksrZ2c0RVVPdk9XS1lFN21ld3c0a2FBZlZ0?=
 =?utf-8?B?VmFmYXBkdFdXb2o0eHRYUE5lSTJ4Y1ZUQ242QWhmeitVSUtRYVlzcUsrNS9o?=
 =?utf-8?B?bTA2eUUzNlI3RTA3aCs5Z2dVU1ZrUTJkN2tzeFZlK3lJcnozZnpmajBCTC9R?=
 =?utf-8?B?S0hyWHliNmU1bzZGaFp2MUdFcWczUlRZMGhjaDMxdlY2YXNXTW5DOTRUTXJK?=
 =?utf-8?B?aHJyU25jVmY2L052UFdHSW9nWTNNS2UxZG85cnJIcTZPT0ZicHBlNkN6M1I3?=
 =?utf-8?B?WktPdGZ6QUc0YjdJVGNPckZEUjhpbEV0R2R3alNqZVNpczBWVmliaENRUUV3?=
 =?utf-8?B?a3FuOGdMeE9RN0s0MTEwZTFCVmNqRUJVd1lYRmMwZWg0S2RpcUR6M1hsZVNz?=
 =?utf-8?B?enZDZzJpdHlhQ2pUU3hEeitGSmxPWDgzUHpnMFl2QlUrY1FsUllrQUxKZ1Ba?=
 =?utf-8?B?OWN0TFJ0MkxuTGRTd2tERTR3Ujh5eGNnNm1BeU1YeWNFNmdVNGpNV3lPRzdF?=
 =?utf-8?B?c1F4UWdMdmFXV3ZNT2Y1bXM1L1FtaUl3Yk1QQm9sYk9CYVd3UjgwQSt0Ky9U?=
 =?utf-8?B?TG92L0t2VFlBZ2FtcUljUytKRk5HdHovT1NhOVNIbnBEVGI0NzBlSEs0ZHda?=
 =?utf-8?B?SFFndk1MTmVVeWIzdEl1VmkyYVNhNUt4LzVUcGVjMmFjUlNaeXZQVlA4dlc5?=
 =?utf-8?B?c1dJQ3Z0azBLK1RQaFRUZlFEelIzNVlKQ1hjd05aZXZWb25uZHpCdzFuWHBB?=
 =?utf-8?B?VDRqZHN6cFhLR3diU0cwVXlNRExEZVpQRFZWUWErZ0N0RWVLd1gxYmFpSW92?=
 =?utf-8?B?MWJDVm1vc0ZMOFhjU3VPc1FVajB0T1FpUSsvMXBJK0JTSmMzZWc2UE4zWGts?=
 =?utf-8?B?bTBya2lWMlFtOVhCN2VQUmlqdmtjK2tvU2dpZVlRNU9VNlFQbldkenRtWEJk?=
 =?utf-8?B?SUpHNVNRRWxTeUQvWWh3Zy9CeFJXdXZ5Y1JRZEJlckErNDVNT1U2aElUU2d3?=
 =?utf-8?Q?vLzz8Bm60mhpzFpFFxSok2IUdLp3SHdNjNIgVqN1JHm/C?=
X-MS-Exchange-AntiSpam-MessageData-1: vlgsDK0WucuHFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0083dd34-ca68-4529-4de3-08dec07d0cef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:00:45.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMEOCifnK0STCX0+7yrPsj6V49tyaV4U/cV8zOsOL00Jv8J0HkD3PpyQtTCdvtmD0nvBIVkJyqGM9Wx8iUj0DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

On Tue Jun 2, 2026 at 12:30 PM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Hardware match requirement violation during sysmem flush configu=
ration on GB10x.
> --
>
> commit 4c62a61ec72a7cc29b5d20a82279ea5490f2e759
> Author: John Hubbard <jhubbard@nvidia.com>
>
> gpu: nova-core: Blackwell: use correct sysmem flush registers
>
> This commit updates the Blackwell GPUs to route the sysmem flush page
> registers to their proper locations. It defines the registers relative to
> HSHUB0 for GB10x and FBHUB0 for GB20x, and implements the flush paths in
> their respective HALs.
>
>> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-co=
re/fb/hal/gb100.rs
>> index 8d63350abf8aa..ecea4ff446fff 100644
>> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
>
> [ ... ]
>
>> +/// Write the sysmem flush page address through the GB10x HSHUB0 regist=
ers.
>> +///
>> +/// Both the primary and EG (egress) register pairs must be programmed =
to the same address,
>> +/// as required by hardware.
>> +fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
>> +    // CAST: lower 32 bits. Hardware ignores bits 7:0.
>> +    let addr_lo =3D *addr as u32;
>> +    let addr_hi =3D addr.shr::<32, 20>().cast::<u32>();
>> +
>> +    // Write HI first. The hardware will trigger the flush on the LO wr=
ite.
>> +
>> +    // Primary HSHUB pair.
>> +    bar.write(
>> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::of::<Gb100>(),
>> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr=
(addr_hi),
>> +    );
>> +    bar.write(
>> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::of::<Gb100>(),
>> +        regs::NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr=
(addr_lo),
>> +    );
>
> [Severity: High]
> Does writing the primary LO register here trigger the flush before the EG
> registers are updated to match?
>
> The comments state that the hardware triggers the flush on the LO write, =
and
> that both the primary and EG pairs must be programmed to the same address=
.
> Because the EG pair is written after this primary LO register write, coul=
d
> the hardware perform the flush while the EG registers still contain their=
 old,
> mismatched address?

After confirmation the sequence is identical to OpenRM's, so this
particular concern does not look valid.
