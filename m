Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FE313E24
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209199; cv=fail; b=D929Ux9UdBE4NR9cG65cFuPYySfZt4jw1BLP8z9m8+rdjWEkG0efdaku0483RAjY860h+IQBzKO/GUuJe/ll0z4Fnmh3CmsE4rTlvzbWkR1hDktwwtzlIQQ2HvZz83DnUDkfUNG7yrIBkjOjtYJymP8TgeCrS+fiv501uM1+PJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209199; c=relaxed/simple;
	bh=ZnlyzdHgm5a+Pj8jgXfLS3t/5IR9LqO8FMVJJ2mNBNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dtz8a41OirtR150t3r3c9baB8rH4YRXjPKL1lVM8SK+pzJVmNFoXfa9foaukMgdA1SHQrWd36LhOZuEh4LS5MhSty6SPlntmFCS3tsAZWhx6MvQe/4W7gdKEziq1rHIYbhrvv8YTTZ1jYjJQzftE3QgIIxQTEPaPCBpCnb0j1t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b++9pX1T; arc=fail smtp.client-ip=40.107.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b++9pX1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a73smbuJTtEsdazUGDwNI1RX4YVurrJini1OPAKFM/+VXC203dj93THGqoNrt/9pp95F22ixjAtLiCcgzMy9DGHcC0niP2Kpf/00pADtEp8m71nOz3AQbjEUJWG+KVUP9uRZJv3Rwq5goHAjB3P2tihwbpV1ryDJPhhH6dcDy8auJghz4odl9Id6G3I3D4RDakJfvQvqVkYVAFcYDeze5lvDtzv1eknkxSAsZWt55FGA/+NIq5AvMSd91oC780jG6+NRrc0g2grdVSlXhIk920cIaeKQ4nhNaKiEreAIEqulXJDKen3exOIbRYolO5mFSF0QHsMy5BuRIn21pHHihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb7OcZcZ9EsrRqrysqUSoIA3ZNmU1p2NQyhsMWurAHQ=;
 b=sIV0WO74d87q4ib/tvv0CBEa3g2Zve/7kVNtiF+kiI2jFfMRkzfn5ONQMXDfBSWvQhQyexQraEGE0X6a0Pz8wU0joJc2rX8J1Tjy+/OjkCXJ8yepVrkmvTH/uHOvIVqEYUsLsg54n3yoRMgh3TvztCEgKBOfmT+PxH2/gK2pMvbMk51BMn+fkaQrnZugStOgTjl4v/xhwQgnCD096rWQi9WfzAuaKFtvEROYWIhoyTsy3P3erLRZPXvvknhIeD/4jy0glJd2+aHN5AJeuDfxUIdfckNHCjQ8tleHxzVqNCOxvUV8DXXuyGBNY2/HUp5wySO+k8gzJ+8pigkc0pl4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb7OcZcZ9EsrRqrysqUSoIA3ZNmU1p2NQyhsMWurAHQ=;
 b=b++9pX1TGsJAAxQIVgPE9/JwyfQh+sg+Z8ckk3phoOkkSA92t1w7cMm3RPTcfg8h7O7UAj9hXj87CORoouGuR5khtSi+Y8shq9sTOq/6XpScZTszVNK3/ky+dyNG7x7WfiReF83zewGjojCrK9uGhmgQveiGXocq8OA7lEcJlXxr3qsU3XSWdlK9aipI5ks0ug370wpqn3iUHny8lcFkXUqceLNLHA8OU9xuCOv5Y7es+VvsQBEA+kymRsaPNyva7Lh84fymO4huzadhyQRJdOvMRflBi32h8IKDdckmA/ppMwfncnI+vGwgyPAn8qWOW4sKgqN1N0zcOO5uKJ66QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.17; Thu, 11 Jun 2026 20:19:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 20:19:52 +0000
Message-ID: <9cb7ec57-8084-4c0e-ae08-ee48c0a4f49f@nvidia.com>
Date: Thu, 11 Jun 2026 13:19:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset table
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: Shashank Sharma <shashanks@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260610234128.547952-1-jhubbard@nvidia.com>
 <ccf5f6c3ecf84151fac418cc026be318db7099fa.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ccf5f6c3ecf84151fac418cc026be318db7099fa.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ff0a94-130d-4a5a-d0dd-08dec7f6cb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	QW23Domuj9JQEjKZ9KUi2bmLLaq4yusai053zevNq4oceSbpUicXPKW0VX6+sx6cuZTdEUCTXz9+ZQVW1pcQn66jV2SmBgXnDWGj1JRz9og4jgyqnYaxz2l40l3YJT2fkSONkqhVj9s5+QEF4ywmQkCKnBInOAKSBmE1K+igMiBdWBX8RZaDmrWLThDl9ReCxnxdpk3gA0zeZdAhUDBJbl/dwrsy3v1/2+BNlbIaB/x16fsYsHUO1Egte0RUoX2mQ9C0SKGVduGEXi20sqK7Z5guKnLAFDnuWVbv6aYbs4XeOARvb9XWk5lMH5FwQx5mx0vcFOF3KgaMQ/s3wz0vQpuBd4f9oi0diRgUfptBZgtY8idbgDfYTpbf7g9WrFp5P4yH6pwE0dqacyPU01LgcXIZJ6ml02uEerRxlSKSvLPfZ46hCueHzvwKMcEjJ9Aq/BrFaqWWNqEsf+IYKV8GlzmhdJqhtSiUCpP/RrGTZbFBFEkIR9V4kIv9b0dc5vTtB+z1qETHwaLgt44w2lQYu9umzxzHFudZ7hDLJjaV3lFXlu1jaz4JbMUJIP6Md+mEM26YmRl2eqWOPA7gSxX3aO1QdTWO/nyrY6CCzy0PMMw435oNg4ZBkUavMb37AlxUyU5z5zCp19WS/q5Eb6JmIEUfelknRJgkipIng1f/deaf19LvlmmNx2kjbRh+0Tn9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VrSEVpU0JTMFE4dHZHUHZDYTZiWlpIL2dIczV4N1BsYmlZbVFLQmtiTWxM?=
 =?utf-8?B?OXRxV1RkNHQxOElZN25FM2dUVDQxbTF6eDF4Ui9NdXpKY095NDRBSFZmbm4w?=
 =?utf-8?B?eDVIc2xFUWtmYzdvTnZXS3d2TkJkVXhhSklsakRXVWp1QVJ4T1c1Sk5WbWhC?=
 =?utf-8?B?eHdTNHNiOUdVeFREdFpaZGVFSVVTTDZ2OFpkRDdSTjdJTFMrTSs3R2o1N0Vh?=
 =?utf-8?B?UDFxMVF5L01CaWhKaUJsb0lHYnBQSC9zcktMZTFyOThYd2hnZXpoelhvSEJG?=
 =?utf-8?B?UGRFSVRWTEJlL3Y3ODc1am9HUWYzM1pOSW5vYTZUQnVMeEMwRWV2YnVSY01t?=
 =?utf-8?B?MUlXU2lmUnE0aFVHNFM0QkIvdlZIM1puL0lubm96UTl2REdsVjZ2Y2NJbm1i?=
 =?utf-8?B?aWJaNDNRYTd3amlZMmM5enNwS0VXVXE4V0hoMmdKMCt6OWtjUUw1WUNFS0ZY?=
 =?utf-8?B?RkZrcGJ0YlV5ZTJJcU1ybHhHUW1vN21DMGNIUC9pY2ZsOGlveVZuU1g2RkR6?=
 =?utf-8?B?SUlObyt0STJ5VHgzVXhiaEQwUmlScTRvaGEraER2M0NvaHkzNlQ2YU5XaTdE?=
 =?utf-8?B?SHdYTkdtYzl5dkF1UVlLbkErMlY4cEgzY3dDb3lPMTBPaVF2ZDNFQ1QxNnNq?=
 =?utf-8?B?RlJQNzc5MDd2TmpBSWFvYzNYN0FkM1Q3QUkwWFJLSkFwZUEyQWhsUmRSTXVq?=
 =?utf-8?B?cWFXRWJOdHpoeFMzbW5FQkVRN0RZbElUM1FEMjdIN1ZzU29IeHY3b20wSmtp?=
 =?utf-8?B?UG5IcHpJN2dJSFY4aitlZFNDVEdjdVJUcnBFZm1Ka1RCYk5ZNjFraFdSSUR3?=
 =?utf-8?B?V25Mc0NHZUlHOVhqVlZBTjJzU1lZbktVVFdKRC9QSjUyWElZZlFzSFhHd1Ev?=
 =?utf-8?B?WWxqR3cxTjd3Q3o2MVZ3cGRjNDg2NGcyR2pRcjM4VUFQYnU2d2V3bm9sRG05?=
 =?utf-8?B?REk2ZkVFVVRicGpDVjR3S2RISndFTW03cE5tOXpnU3RreHlaTTBsdGdQekpN?=
 =?utf-8?B?QWVYZkhtdnMvQzd0VUoxTHo1WDE1QWZFZDdReVRTOHBQZGNNTEVVS0VEN0JO?=
 =?utf-8?B?VVV5S1A2NUtDWUtPRnExUmtHMkkrd1RxaUpXUGR2SzdiWXArTXVJc040dG5E?=
 =?utf-8?B?V0w5N2JJYkJpdTlnYTEyWkR5VS9WN3FHVlNWUUdHYTRzMzZpVTBtT2szMkUv?=
 =?utf-8?B?NE90dmgwYkVuSlBieGRScE0vQk5OYnFGdDVLOWZyWTAvNmV4WGV3cHhFOFVq?=
 =?utf-8?B?L29QUGN4b3QzTWxqVm1rYTMrUXFaKy9XbFBKMlFRNFcrdUtyS2JMcTNEVUd0?=
 =?utf-8?B?dUlTOWxveFM3cCs4Y2VvUjljZnFCd1h5amVMRUhhU3hkNWxIZEZGWkdOV3hR?=
 =?utf-8?B?dWtITmIyZ05nbHpQN0RYZUpUUWhwRkRBZHVkNm9JSGRyZWJjbmlzREpFS29h?=
 =?utf-8?B?a2JVMjRQdU1oUjAyUmVQc2xDbUdMNXB6TXV4TU9xb0FwTHFaMDdxRlo1ODJt?=
 =?utf-8?B?ZExjSTdURHUraTFzVm83L0VkRU5SMy9uM2JOd3J5SzBtZlFFUXY1WTNmZi82?=
 =?utf-8?B?Q2FwdUI0S2RIYjNCZUI2WkJtblBtTWI4YmcvN1Z5MGs2TW43N1QrWWRoUkds?=
 =?utf-8?B?blFuUjkzYUorck1wQ2ZYRVN0VmhzWkxkMHpWSytlMUZLMkR4YzVSMmpoSjRl?=
 =?utf-8?B?NzQ2V21MQ0NzRFI5YXIwcnRka2xRVCttbmt2K1h2ZW1lam9PemJ5M2k3NFJV?=
 =?utf-8?B?RVozTExFMWtJNEZQamJJd2t4TG9hZnZCMVNSRW0yaGlwY05ya2laek5keW4y?=
 =?utf-8?B?OWl0OUhSTGdHRUJWYUpSbU16QnJrMjdPek9MT2d2SlVjVlRKSHlPbEgwbGdu?=
 =?utf-8?B?emtjY2hYOElKSlpzcmRkUXZIVFliZ1lteUFObjFLVkNsWjcxTm9LVVpwVTg4?=
 =?utf-8?B?QWpWeGk1YnpKbytHMzFnTlZDb25Bb3hqWW1BZFNxNXQ3SVJ3SDVJdWJJS2Q4?=
 =?utf-8?B?NWxKQlFrajRQNWhERVF2VjZrMU45RFlKL0dxeFJMS3dTWDJEU3ZKN05odzNx?=
 =?utf-8?B?VGVUaGRHMmFuMURxUWlNdmYxTVpoZkxEQ3MzTG5KRFoyc2pUNXVyNlcxUTNv?=
 =?utf-8?B?UVdQTWlMUHlQUUJ4c2xEc0xocVpLTzhsS1IxR0R0WDkzbmRwcTdhbjh4ZGFM?=
 =?utf-8?B?ZXoxN2IzQnRURlU2Z1N4RVNEV3d2SmYveGgvR201ZXBQMUpwUkJqdjFVdFRQ?=
 =?utf-8?B?YWF6WlVvelhPUGhUYmlBVmZVa0JOT1RVejNNNnc2bk9WWmZKRk5UL1VkTHF2?=
 =?utf-8?B?ZXN6aXVJNUkreWtKcW9zVU8rd0NpZk1FUU9SM3c3THN3N1dueGlyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ff0a94-130d-4a5a-d0dd-08dec7f6cb7d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:19:52.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21U2EuyAv2v/srHE8hiU+DVj1Iz2RfilUsgBkYHowRTJ284RnNdiXUhNLZpjsCmpV75XLcV/a803GPVfOOhXtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090

On 6/10/26 8:00 PM, Timur Tabi wrote:
> On Wed, 2026-06-10 at 16:41 -0700, John Hubbard wrote:
>> -    /// Returns `true` if this chipset boots via FSP (Hopper and later), which requires the
>> FMC
>> -    /// firmware image.
>> +    /// Returns `true` if this chipset boots via FSP (Hopper and Blackwell, but not Ada),
>> which
>> +    /// requires the FMC firmware image.
> 
> Actually, I was thinking that we would keep the "Hopper and later" terminology, and just add a
> clarification in define_chipset! that the chipid numbering for Ada vs Hopper is backwards, and
> that we consider Hopper to be after Ada.

OK, so here's a diff on top of this patch, to attempt that:

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b9451d0d5e15..0344995b3bb8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -91,10 +91,10 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
-    // Chipsets are listed in chip-ID order, which does not track FSP
-    // capability. Hopper (GH100) and Blackwell (GB10x/GB20x) boot the GSP
-    // via FSP, but Ada (AD10x), whose chip IDs fall between them, does not.
-    // See Chipset::uses_fsp().
+    // Chip IDs are in numerical order, which does not match FSP capability. Hopper (GH100) has a
+    // lower chip ID than Ada (AD10x), but Hopper and Blackwell boot the GSP via FSP while Ada uses
+    // the older SEC2 booter. We therefore consider Hopper to be after Ada, so "Hopper and later"
+    // means Hopper and Blackwell, not Ada.
     // Hopper
     GH100 = 0x180,
     // Ada
@@ -141,8 +141,8 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
 
-    /// Returns `true` if this chipset boots via FSP (Hopper and Blackwell, but not Ada), which
-    /// requires the FMC firmware image.
+    /// Returns `true` if this chipset boots via FSP (Hopper and later), which requires the FMC
+    /// firmware image.
     pub(crate) const fn uses_fsp(self) -> bool {
         matches!(
             self.arch(),


thanks,
-- 
John Hubbard

