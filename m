Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0846AEF6
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487632; cv=fail; b=stb6p3hOJX126srFR1hnVMBUXwWjY8A7+QFj4wpb9AASDogqWPHCnZfPhad49PwQ5U8HM7Ovx7zbPyY7fAm6ltVAa/Dy+3ikF6l2vQ8imP4nHqDL865Gar7uG4ENzWGHtsBRsm3ZNa41u6S1Mnb0HEqvM0iG7xpmFBaFrd9PJL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487632; c=relaxed/simple;
	bh=42MXzUfdAYa5/RKR5j0/WHW8ASyWVolubidvPGdqejw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=A6sliNtfr6FndGPYpTk2Dgb8386WEF4VrizSOMbBx4rqPbh6FnDN9JG0OySJcPNGsliKMSPFdTckRBd7qcte+JJhTqGvzxs4sd52knQDnOmwd14zWpZy9ITTnh8pwtiNuhcdflh/A3XViapMwPl8Vup4g34etnP3wvcNTL3RpMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G3dGrrYH; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G3dGrrYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6Dc/kAz2JcFno1U5+Fi57z2oca3/yExmYGR+STWZIj5i8u4wnJxi8EwpD6gPaMvZ65Z8J7gLNafazsEByb4ZWH0CHBNFXS6oWg8j6ulRL8ykEC4DC81bCfDW2Ux1N08K0CxxgVCY6NkI+7FPqS2k7VsnJw/+NDcnqm7GIcBwkEo85+WwO+gMottK9B5ywQuNEZ/cpzsNr7RlI1S1OzG9mbIIwpuDQQblPl9OIOuA5wvhyTMaigsJ21FUw69v7VFJjW6dm7MgOILlgOlMb8i4viTydT5G7MvwqkdXfCs4ZU/Eb69boBCmiRFZPlF3sioJlwdGXV5jwfONFEislq4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=US3RJxUmphPxcMVJw+xS1EjEBsg9LWYdC8ldS0lnO7Y=;
 b=HGvj6jgAL4ej03QyDC1quz7tJaAmF+jzBxHCa550Qzfy2BVqvTvSlHaKS1FVQmGF9mjnXiJzHYZWjTwcNOubKpU6y05DjRTd3UwDayMZCOCrdLYuCb6lKAV2FqHak8TeOl2oI6o3TtHaei06+ufc+VFLOt3lWkiEE4W7Vtsf9uFHnHjOvIhskjGxSDrY1diD1iYGJzWy8ORhVJlvNTBE7gJzqcS4tDeIKn1DK7xdTzv37txEfJfYQqS3IYHOFM4flgPh0xk30JLLOMLx9BSqCr5D2+g3Q4w7xX0qwUJCL6k4MgecVXVRTVrwZ0RGhQHe3i1iO2Eg/mPR8SJvooZr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US3RJxUmphPxcMVJw+xS1EjEBsg9LWYdC8ldS0lnO7Y=;
 b=G3dGrrYHNVZk3YV2F9JLFaG3EaYG/pnAnVL8/Q4jBmraOxoHTDj58fi59uJrdtpfA+oZgRW72Yh9JhV3pnha1/5irUQVUHGBTnbgR2BXB2ZztYwuKy114DTXGo2QOHYInG9NQjfNh+pqosbDejTNnWQYtnftotAArw3y1HRX64ka05jrLEYnFkOTc6wCoiYXlsPGgzSAmrvO/hO0BhAH+mldrEXnvb0R72p+mfoyJ0iYvPlphIogtXLg+f3nb++y3gusoOoXFK8VNn6ZwxFTNnJpHUVaqP4+o2W/LRcnvPoFJM5+yqf5haZWt8/UDCZOvbz6W7YFwBu0AxNFRUKQFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BN7PPF5D27497F1.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 11:53:45 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:53:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 20:53:41 +0900
Message-Id: <DIZE6PDLOCHP.ITQSKNYRZ7H1@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 7/9] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-7-d9f3a06939e0@nvidia.com>
 <DIZC53CCKAUY.2L04G0C2WSVQZ@nvidia.com>
In-Reply-To: <DIZC53CCKAUY.2L04G0C2WSVQZ@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BN7PPF5D27497F1:EE_
X-MS-Office365-Filtering-Correlation-Id: c83e6678-8848-4043-e693-08dec166c3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|3023799007|22082099003|6133799003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	p3Gajs9CQvDajUKYcBDtJkztjiPwcqxUKIpiGGrFYZDi3x7DZdXja9PaceJzf3g6J3SUNFyQTwVXeEgxqWBVT5/01KGuSVUTWPbTaRE0IsGkAvA19e0R1Jp3RifqHnLLpIu3WtSm6/FgDeti55ZLxN3Ka/pGnfmZWKtqC146sW5HlogE/G7fruOL2HjujhLWk1Hm94wluI9aEKSy55rDnoczR78Ov5e5QUM6Is5crWWx896CJ92++zhEW29sS9F9Lq1gyHuvivpG/7BdVZTRanoiDBEe8NcGTssSikGpFEQ8RD6adshKgKUClVN2mo37oXrCFuPNyQkBrqywVPXii/8xCVLuG278jr0firrb0zZV60sR70Ri7tDminpcdeY7swgYDJS3GTDjSikGXHX7etl5Y4VIllcgNHb1Ys1Io17h+Ui0e9D3dEPj+0cn8rfQmGbyw7Me9WCItrzTog6GsScu1rqBf5U0xSjTFjTBMsHGgwLCpd3H40eumrkrjOv1fcd1JvSbQtd8Mh5wuJO8ZTzNfxVxL+kR+9v6J4xgT/YuKS1wIYyCvOya26fSTPOd0ZVEEZaS2YTCAzZRzgjL7uOTIhyhHSstzi4k0X/t8j6is6oqDKh/8mAIfiogH3JxFeHsEhNG5jAXQaWDtKDDLIIfp70JDv1FQKQ87CXGkPV3TpgIZ7YWB0snyZwSGjLK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(3023799007)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnFNWW1ESy9XODlndTkvQ25UbDNnNHRQeEl0T0FINURxV1JTdk9vL29Fek1K?=
 =?utf-8?B?TTVqaTlzam00ZE1nNFJWb2d4cXhlc3ZIeit0cXdYb2MyMlpuYW5IaXRBam1K?=
 =?utf-8?B?eXVGQWZTZmpOZ2Y5eG1aVWZxL2VQdk1NY04yWStQOGlnK1VGOGFHWnNtQUJj?=
 =?utf-8?B?MFd0dm9jQzNXNTBpcWJlME9WMjNJNnk2OTBocjgvSkx4VEZhdUZDUzI1dU5z?=
 =?utf-8?B?M2s3UmFJSk94MzZQaDZmcGVINHJQbnRzaFc1S2ZYMEMySXYvTDUvUWh5Ukli?=
 =?utf-8?B?WVhtU2FPd2t4YkFxTkxsZWV2bU5qV1NyR1plUVVoU01tMmNmMS9kNVdiakJl?=
 =?utf-8?B?V3VkSFFqWkFKRmFqRElEcUxPbmhDZDBqNlhFaHMwUThoSVlWNHFZd1lhK3Ix?=
 =?utf-8?B?S01rUmJiRmdxNysrVXplL2ppdlA5dGpQNGEzcW9Kd0dyUGJJeWE5OVk5dkNj?=
 =?utf-8?B?MjJ1d3Rsc3F1ZlAvNmlmVm1za3gvVlk3T3dqekJIL01TeDZoUTJGa0FBbTda?=
 =?utf-8?B?cGtMYkhISldkRUVONURXNk5qYnluZVBoVmdHRzVPdkhnODdxRFRxV1F2b0Ru?=
 =?utf-8?B?eFhwOTRPSS9tSTE3V21ld3pHZFU0dFR3b3pQdzZsczJMNHpzU0JlK1VmV0s1?=
 =?utf-8?B?UWZ0QW50WXVzR2xwZml2ZEZlcWJtSkgrenY2L2MzUHFBcWhRTWRrbFZTaWNJ?=
 =?utf-8?B?dmdBZU8rNitLMGpnb1hoaUkwWXY4REQrRnhmZEJrVFVFN1ZidUZIUStmQXRa?=
 =?utf-8?B?TzZVdUlTNVplb2pmWXo1a0ZUek9vOXlNN1lDelI3OEd6VlFEcnNGY0svOTRJ?=
 =?utf-8?B?S2pKOFVCQ0dDWnhQeWV3THlZY21hc1RmZjNNR0dZM3gvNXRCR3BLV0E2ckJT?=
 =?utf-8?B?RllsRzk2YTl1L2RkSGJTdXFoTmVJcWROMThiYWFYY0JSMHZGVEhSUkxKODJW?=
 =?utf-8?B?ajRxY0hsb21VYmtnd1FZaEVLT0lhbjZrSWRLaDM1S0VNU3JHUllNNlArRElL?=
 =?utf-8?B?UG1sVUFVVFIzUHplZWRwQURDK3JPNjJScHlwbHMzNEFrbXo0c3pDSUFSUW9W?=
 =?utf-8?B?UVV3RmtVTnFsM2V5aU5RQ2xZMzJiK2FreW1iRmlDK1ZQTWNkc2haMmhlbFhK?=
 =?utf-8?B?bzF4eC9ublFLekN0TVFWUVZBc3lYdTNtT1hvazlWaUoweEpzMkxSaHJFUmZZ?=
 =?utf-8?B?VzBITDhvNFFLWjRYNFQrbFRlVktrM0NZUGpVNEk0TkczWGZjdno2RzZhcWwy?=
 =?utf-8?B?MDJKcmJxaEdmSnJISkMzblFwY3BVcElIK25adlBaVXNSWHQ5RE5UMXRaajFr?=
 =?utf-8?B?UTY0ajNSa3UyNlhncXZtZGpjWTFjRzJGdGZZRVRIdG1McmczT1MzajNCNkZs?=
 =?utf-8?B?T2hyS3Rid1pMdVZNNnJBV0lSdUtEekNXeDRzOEVwMXlneVlIU3VnVjhnREMv?=
 =?utf-8?B?QVA2VGV4TWdmTDM1K2JKQ3RJbFBjV1IxSjhPekgrdjZraEw1ZWE2bm9YeDhJ?=
 =?utf-8?B?NkJxM1luV1NjY1VJbjRKbkxYd2FVSGM4YmNVcmpUaHNFdTgrSnlqYWhuRlRD?=
 =?utf-8?B?a3ZYNkc4STJNR3lPMStOSFlldlpYQU42VmQrYWxKNWNGZm55QW9Cd01LMklR?=
 =?utf-8?B?ekdOdUxOWkRLcWJld2JpL242c2VrMlNkVjZPTFg3Y0dsM05pL2d5SmZSdFJu?=
 =?utf-8?B?Q0orWXAvdXp2NzVzbFdwOGdxeXh4QTBxSlRLb0cxQ3MwVnJmeU5YTG9ISjNo?=
 =?utf-8?B?UUJjZ2ZIMGovc08wLzFyRzNpNmkreGlVellHN2h1K2FuYlM0eU93S0FvSlNh?=
 =?utf-8?B?L0dybkFMdU9KU3Q2TzJhSDdtQ1VRTGdrOElUWnRTUmZIS0x0RGdHN1hIZkZU?=
 =?utf-8?B?WCtJTE5tV2s2UC9jbmU2ZzZSWUw1dk9jcEtBcXR3dnE2aEdmbHh3anJwK2JL?=
 =?utf-8?B?dCtDaDlLWEMyd0gwU01DeDh3bStVOWRuV09HOHplaTZOdXZLL3EyMnRmMTVu?=
 =?utf-8?B?Ujcrcm0vT1dWZWdETEdHQ3FhbmltTDMzVzg4azZQTFdlU3FmQUFoeWEvMDdI?=
 =?utf-8?B?MnNoc0pjTjIzZFpyWW1adS90QWNIWVRtSWdHYncycjQ2QUw0U1lnNDJ3enVs?=
 =?utf-8?B?WUJGdTdmNy9XZ1Uxa0RUTHZ5S2tyM25qeUgyeHEwRVlhTlpYM3dvcXJUV3JW?=
 =?utf-8?B?TitjUVY4WUQwVWNablhtbEdpeDZ0RVNFTFh4ZU1nYWNzdjMzNFhKU3lQdkZ2?=
 =?utf-8?B?clVGcDVOdmszK2pwV0lTZmRuQnF5c1BEY014cHM1dTVjN0Vpc1dzR2hjL0RJ?=
 =?utf-8?B?N3FtbjgwZFpmTFVRMDhCTTFxRnl4K1R6djV4a3pvekRSNThta3p6Yk01dmtZ?=
 =?utf-8?Q?z5+YAC5LB5pXR0xX9b9GLmQspsCq7Cs/dcHWxwtnlU+uF?=
X-MS-Exchange-AntiSpam-MessageData-1: YoZQKOjEVKjijQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83e6678-8848-4043-e693-08dec166c3ed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:53:45.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFCTp5HF5Nf3ea663DVEz3OOpmxluz2xFnLUKTNstyNufcRhG5d85aD0/AkESbQFpGmKf7Qi4+I9Qbt0J1DmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF5D27497F1

On Wed Jun 3, 2026 at 7:17 PM JST, Alexandre Courbot wrote:
> On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
>> After FSP Chain of Trust completes, the driver must poll for lockdown
>> release before proceeding with GSP initialization. Add the register
>> bit and helper functions needed for this polling.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/gsp.rs    |  6 +++
>>  drivers/gpu/nova-core/fsp.rs           |  6 +++
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 88 +++++++++++++++++++++++++++=
++++++-
>>  drivers/gpu/nova-core/regs.rs          |  2 +
>>  4 files changed, 100 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core=
/falcon/gsp.rs
>> index df6d5a382c7a..136d6b24103f 100644
>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>> @@ -57,4 +57,10 @@ pub(crate) fn check_reload_completed(&self, bar: &Bar=
0, timeout: Delta) -> Resul
>>          )
>>          .map(|_| true)
>>      }
>> +
>> +    /// Returns whether the RISC-V branch privilege lockdown bit is set=
.
>> +    pub(crate) fn riscv_branch_privilege_lockdown(&self, bar: &Bar0) ->=
 bool {
>> +        bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
>> +            .riscv_br_priv_lockdown()
>> +    }
>>  }
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> index 883ac4f8b811..872898ffe0a3 100644
>> --- a/drivers/gpu/nova-core/fsp.rs
>> +++ b/drivers/gpu/nova-core/fsp.rs
>> @@ -184,6 +184,12 @@ pub(crate) fn new(
>>              resume,
>>          })
>>      }
>> +
>> +    /// DMA address of the FMC boot parameters, needed after boot for l=
ockdown
>> +    /// release polling.
>> +    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
>> +        self.fmc_boot_params.dma_handle()
>> +    }
>>  }
>> =20
>>  /// FSP interface for Hopper/Blackwell GPUs.
>> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-c=
ore/gsp/hal/gh100.rs
>> index f41f3fea15ff..def41745a30f 100644
>> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
>> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
>> @@ -5,7 +5,9 @@
>> =20
>>  use kernel::{
>>      device,
>> -    dma::Coherent, //
>> +    dma::Coherent,
>> +    io::poll::read_poll_timeout,
>> +    time::Delta, //
>>  };
>> =20
>>  use crate::{
>> @@ -33,6 +35,86 @@
>>      },
>>  };
>> =20
>> +/// GSP lockdown pattern written by firmware to mbox0 while RISC-V bran=
ch privilege
>> +/// lockdown is active. The low byte varies, the upper 24 bits are fixe=
d.
>> +const GSP_LOCKDOWN_PATTERN: u32 =3D 0xbadf_4100;
>> +const GSP_LOCKDOWN_MASK: u32 =3D 0xffff_ff00;

nit: these constants can be moved into impl GspMbox or made local to
`is_locked_down`

>> +
>> +/// GSP falcon mailbox state, used to track lockdown release status.
>> +struct GspMbox {
>> +    mbox0: u32,
>> +    mbox1: u32,
>> +}
>> +
>> +impl GspMbox {
>> +    /// Reads both mailboxes from the GSP falcon.
>> +    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
>> +        Self {
>> +            mbox0: gsp_falcon.read_mailbox0(bar),
>> +            mbox1: gsp_falcon.read_mailbox1(bar),
>> +        }
>> +    }
>> +
>> +    /// Returns `true` if the lockdown pattern is present in `mbox0`.
>> +    fn is_locked_down(&self) -> bool {
>> +        (self.mbox0 & GSP_LOCKDOWN_MASK) =3D=3D GSP_LOCKDOWN_PATTERN
>> +    }
>> +
>> +    /// Combines mailbox0 and mailbox1 into a 64-bit address.
>> +    fn combined_addr(&self) -> u64 {
>> +        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
>> +    }
>> +
>> +    /// Returns `true` if GSP lockdown has been released.
>> +    ///
>> +    /// Checks the lockdown pattern, validates the boot params address,
>> +    /// and verifies the `HWCFG2` lockdown bit is clear.
>> +    fn lockdown_released(
>> +        &self,
>> +        gsp_falcon: &Falcon<GspEngine>,
>> +        bar: &Bar0,
>> +        fmc_boot_params_addr: u64,
>> +    ) -> bool {
>> +        if self.is_locked_down() {
>> +            return false;
>> +        }
>> +
>> +        if self.mbox0 !=3D 0 && self.combined_addr() !=3D fmc_boot_para=
ms_addr {
>> +            return true;
>> +        }
>
> This looks like a bug - if the mailboxes still contain the boot
> parameters address, we will keep going and might return true on the next
> line, which the caller will interpret as an error. OpenRM does the
> opposite check and has an additional test for `mailbox0 !=3D 0`, which we
> can translate into this logic:
>
>     if self.mbox0 !=3D 0 {
>         return self.combined_addr() !=3D fmc_boot_params_addr;
>     }
>
> I'll fix it and add a few comments explaining what the code does as it
> can be a bit convoluted.

Yeah, I agree. I think the logic openrm uses is like:

1. wait until HWCFG2 !=3D 0 && (HWCFG2 & 0xffffff00) !=3D 0xbadf4100
2. wait until mbox0 =3D=3D 0 || addr !=3D fmc_boot_params_addr
3. wait until riscv_br_priv_lockdown =3D=3D 0 || mbox0 !=3D 0

So several things are different to openrm (not sure if they are wrong
though):

1. `is_locked_down` is checking the wrong register (should check HWCFG2
   AFAICT). I think we should name this more like
   'gsp_mailboxes_readable' or something, since IIUC it is meant to test
   when it's valid to read mboxs.
2. other logic is wrong as you mentioned.

Maybe we could structure lockdown_released like this:

// can't read the mailboxes yet (even though we already did but the
// result is actually not valid so maybe this should be restructured)
if !gsp_mailboxes_readable {
  return false;
}

// we can read the registers and we are still waiting for mbox0 to
// be zero
if mbox0 !=3D 0 && addr =3D=3D fmc_boot_params_addr {
  return false;
}

// either lockdown is released or some error happened
return riscv_br_priv_lockdown =3D=3D 0 || mbox0 !=3D 0

I think your suggested change w.r.t. if self.mbox0 !=3D 0; is also
correct. I think we should update the comment on the function and the
function name too to say it returns true on lockdown release OR an error
happened.

I don't know if there's a simpler logic that will work, just commenting
on how it compares to openrm.
