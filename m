Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89082D12EE
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939627; cv=fail; b=PflT1god4ODYkYT51ldywU8OOM0vF5jweEuNdQPXkEfbg+rN0wHUZnULdB0V6j1CGlpmhM0i/SNMT2kz0g6u6Jdc3Dld7HOQ1eGQ0JSJ8ZyuKwGOWaEDBDG4FHXTItemwPmMcmub1NGZTZbdYGtoF4Xo6GJwoFmQA00x1aQKyII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939627; c=relaxed/simple;
	bh=qApS4Pxg+E/P5GFtLHKPIXblCR2Ke3kc2/xlFLZyn+Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S/Q5tkhqj0e5PFnehPgDHZskTqPYWMOHvVD84DY4Hs/dPB5IOd3M2Qeb3W+RIig2ZB58qMJuuKHMdu2d7ExM4gg4T1ydMTtPbgVSk2ySIXWF2rPpZI69ZOKQ6vO40OsVn2BLcoYEKjWhzaab23fMpqYbw2MNeki0tGbZNBk5DVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=grRId5Ct; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="grRId5Ct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Adl+wBeSyFjzRnBwm41lpboJNa1vt/EzOeI4Go6aat9lD/SGQUMyuAK5vtTYJG2ClS7kySc+0B9j+IWCw9LD0tUIuhYN3LMtC+RoDbqQ3+HvIpkSWNkwobtkL7eGNg/4g1thpupoiZHM3tDyw8OkLWq1RUaYCkmuCzDZkz94ralNC5191Pt5pUwnMEZtW2SALnPQwNIl31adepCXcBUloProTc89x4TkpQYmqm30UDtFfyQM7MNgWsVT4AY5WkOvrLdAfQPPfBvyc76NhpyMPsBdOylEgRhvfLVRfX151kFY6jIuAl8cfroQWBZirshhStQIvDnVGHGXOE0CLeZfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONyG6CrB6LSLlsnIrmpXHktjIOTDqB8LlPsFSgUIR4c=;
 b=IQnePtj8FP8l/fJ2L0F4Al1AY7lq6FfUwQTN64V9u4XZIvSZait2MG+fbmTrN0P0+7fODvC+YLBe0pCf42Kq1TfuBYQT8wdZS4LlbVOX8e/uUKPeYWqTM7W14lRdCblBXCNlRmW1qvHSahterruedMrG6rBDAsiT2sFM/sM3c1lJdqTpYtkO9slB2FFsQGs4JYxqi4L/ZKTkV/2DTxVSxGNznAYBV9zB7LFXKd2u8ZE129qOVvFZPRL88rVije4rJhvpKZTsfjtLiEh8E+X17qlk1Xsf5YYJT+KjbzXLk5ynDEx23XF7bwab6jo7jRINpeDKWmpVFK0NLITAFvxy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONyG6CrB6LSLlsnIrmpXHktjIOTDqB8LlPsFSgUIR4c=;
 b=grRId5CtDljjYQwMAYGTnqTlFssZ252UJAxnxBkEG84jVifvBdhn9QJAEstL4Zh665aNs7j8opVvWLvQKtI3z3w9v728sKNT8qGPy+cbBNp9Waru6W5mGbZBH+NZBGdrZHdIsdJ1ZyOwzui3zvNpGsyQSLBz7yhMoyCKxeSRIwyxsL0eSPspKC9kmIeBZTNpQRL9AULAv2tDSunoaJOYaeQsgZqUAv8AUgHUSB1JmXRpCmQ6LxYmM+qICVLJVtal2U3OqUI8xkRgR/r4l66eAkI+hlddNkBnzgxFwJZY4eCyAIp1ViXQyJlwtD4UeHFNhiQdacHmHHeEABEyE9ReYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 11:13:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0472.015; Fri, 2 Oct 2026
 11:13:38 +0000
Message-ID: <59900705-fadd-46bb-93eb-8f6d8e7be551@nvidia.com>
Date: Fri, 2 Oct 2026 13:13:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
To: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
 <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e4b9c6-f2b7-45ae-f990-08df2076350c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|56012099006|4143699003|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ohbP5k7XoqKxK3dDGJiix3UV+J1saYo6y5aecpvv3uK7XvSIgtQNlW45S3CbFUeWc10Mi9tvOld+rBupSc8nkMJCXRL5qqJ2ZQBmeAeSR32hCGnr/j8Cp+MwctfIp8MfeMDPeXZTQ0ZbuQg1E7q8NIzhZnffz7+RrZcinZJIbGTrMYH5+pXdF/azfJlnbAf3j0EXlCAZPGECAoe+4Ldk/k8QsU3+8PY3MZKLSYGUZVzzGJ7m2iQAHCqWeTAiRGDX+rCcgW7ZRePZBnbPhBWJJhdYTjFAlv9cDHwYOTNGE9UoiPpAPlO6GjGVqM2I3u6EpB/zvWw+ZgQn8qyYwwxLbhH97UibeDtP/aW4r4c3wWgG11MKVL2pfbB/5d0Msfg0yhCQ8lIa8uKxTuXRPvGa3hjUYLYM54BmuCPcbCn7BhVh7indOSeehlU8ijtL0Ka5cQTLIfYxEwbdcqWYLTW1lCm4vu8g+k8RHFwzyRRECn3W9m6fcBnffY9Fp0XykeHljClvmu5cbVoG5LpsXVQhD28EAyxQXMRmiXN6unMVF42UKaxqIT7Sg4vx6D2TvLQW2nsnH2tuWRs6HOQOrt7bnk7YQczad33RhXvgNgu5Q+g2B3/FYrdpssVCCumdlrrXRZxn0aTmlA18AIi03iReBA0iFfND3ddwYE4xoMom63U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(56012099006)(4143699003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVwMHhpc1BKSDN3R21qYjZYUXNwOENSNHl5SDNlZlMxaWNqd0lxQnBIRnUz?=
 =?utf-8?B?MmZYNjR6U1BVWURBaklIV0ZCMU8xaDhEaHpkalI3VTJBMHZRRGtSZDkxOWNS?=
 =?utf-8?B?Tk01WUVINmNmQjNBd1dqa2NLd2hhVjZEblgwM0NpMVJVLzZLZlpWc1FqMmFC?=
 =?utf-8?B?K1YreWJiZ251UWp2Y1VlaSs3WjE5ckpZcVdnRXZReXh3S1NDNWg4dGk5R1BU?=
 =?utf-8?B?d1B0eDN3ZHBhRFp1YnFhL3d2N3dHNnZwMEtWcFlWdm4rZW1rd0N3RzhnVzVE?=
 =?utf-8?B?d3FDdTFCdmYwL3pqdjhaZTZXVnhGUk9WK3FjaWhHQVdmM29VK2padjdIQUUw?=
 =?utf-8?B?ZTFrTTREcjNSaUZHbFo0K3lGOU5Uc0VOVlVLa1BCaFBXM0ZoRElWUFJjQ3F0?=
 =?utf-8?B?QVN2ekJKeTk3QnpwRVN1RDdKL2k0eFUyUnk1ZFFVazhIYUZUZU5lOEVySW0y?=
 =?utf-8?B?RE12dENzamJkWElOTytmQ3NYZ0FVWDNuM1NPVFh1Sitabkk5ZEo4VEZzcUQ1?=
 =?utf-8?B?bW5WbU9QSmZScHhPdTVoa1VHRnFVODhBT2ZLcjFMTmNmWTNwUGo1YnNsL3hF?=
 =?utf-8?B?VUJGZjJieWsvRjZxanZzb0FTaDN2a05aSnJpWUdCYTkraTNZQnAwSkVmSlpV?=
 =?utf-8?B?MFY5ZkZVeU10TitnRlNnYjRiV0U3c1piQjR4QXMvZDVYbDdvTkVlTkZrK3pJ?=
 =?utf-8?B?Wm1xRStLVHYvN0R5RWtBemFta2prNDJ2WmhPR3l6MkpRUU9vTFJGSW41OVpj?=
 =?utf-8?B?VFo4ZndvTVlDT0Iwc2JaeXM3N2E4b0psYk9EQ1phMXliSkk2MFI3V2h2OWEz?=
 =?utf-8?B?a1Z1MCtFeXBJbVRKSUFQaGFFVjlVZHdRZ1Q4VFFSZkh4bzErT21BRm9Pa0xt?=
 =?utf-8?B?S3lXdnFCZ1hJRG4yaFQxT1VUZmMyMXQ1eWU0YTRpelJGZ3BVNC9qamQvRTYz?=
 =?utf-8?B?blFYS041YXYvN1kxRVpkQ0Y5dW1USzdvMzlJUks2S1NzRjhyblJxSGtxcFpC?=
 =?utf-8?B?K2VTR05KazVONWVJdG9jTlRiWk5VVVpMUWhDcm1YeDB1b0ppbXBZWitJdTM0?=
 =?utf-8?B?T3MwVGxOMEplajZRTzc1UUgrdVVSOXZLSmZnZFdRZzluZktFSmdYQUY4U0xX?=
 =?utf-8?B?NG13R0YvVVJDb3VRUmdxL0xZdGd0aWFsNlVLQkNTVktPUEdWOFpnbkJiYXNY?=
 =?utf-8?B?RjI1d01POVFXUlVobE00eEN5T0hRZnhwUi9XU25wbHlpMkFBSmt1VG14Y0hQ?=
 =?utf-8?B?SWxWellUR2VleDJ4T3FPRGdCOUREWk94S1BMRFZHbElTMm5CRVA0c3hyd1Fx?=
 =?utf-8?B?R0dhSmREQnA5VmJRYnJhUUduMjNqOHAvWk1ST09vSkdhOW05cWFmMHRyUmxG?=
 =?utf-8?B?R2VBRkFCSjJPMzJTWnNDYjBBeVQ4a0M0TXl6cDd2cGNyZ2I4RHZPNmxvMDU0?=
 =?utf-8?B?d3V5MG1nZzdZQXZtd0xzWlVETVRLVnRsOFVtVUZRZDJUazRQdWd2M1NjeGdp?=
 =?utf-8?B?cklyTzN3ZHJrZWZVbnJxOEgrN2E5SzFMa243YUt6Rk1oOFpPU1daa1lMUWVu?=
 =?utf-8?B?cWVvcSs5UTNVQWFScTJTUDErOFBWclNYNStya2FGVmR1WGdydk8rSFF1clhD?=
 =?utf-8?B?UG96NVFNcDRLT2liSHpRS0NnZ2REUjZ4K0hOUnVSMVZmYTc3OXY1Ymp3RVRm?=
 =?utf-8?B?czJCd2FWMTYrMml1amtJamRQSHUzOHBpK0dyMnpoMnJoQ0xCeFFJbURoR2Rl?=
 =?utf-8?B?OHU2ZWt4Wjc4TkdMd2phZThTWDlVYUM3T1dRazRLVHE0dG12RGs5Y2d1aDE5?=
 =?utf-8?B?TVJtdGRETnBmanlDWjc5SHhlcjhqbUk2NE9FU2cxWkhzR0VqanJiUzBsK1BW?=
 =?utf-8?B?d0lVb0k0bDQ1a1hsNFBsaTFvNm9Bd1R4dGhSaGlCcDFkeEpZendGVVpKMGNZ?=
 =?utf-8?B?MFZ0cWdWMXFGNmtOc01KZXFPMVkwN01LeTF2R2c2bzc3SkJ6RnZmSlRYbFVN?=
 =?utf-8?B?VTE4UU54M1g5eXNMSTdTVkowYXRSbDZkckZaYW9Fd1FXM1Z1dllnM3NEQ1BR?=
 =?utf-8?B?dmNHSlpzTFpoTlQ0S2M2ZHltc3QxR1BaZnpONWRQdkRFTkNQR3RhSy9IV210?=
 =?utf-8?B?WldwL2pXTGtoVjQxMndKeHJnd2czYXJ1TmFvdzROT0tKNVh1M0gyVXFvaFFv?=
 =?utf-8?B?YzFLY1FxQjdvWDMxS0ZUNG8zSmkzMTZQSnZTemlDNlQ5blhnVnlDeGMwTUJ4?=
 =?utf-8?B?Q1VURXRWQUkzbTgzbnJiODAvVDR2VlRMWWtDUnEzQ0RwdzdTYWVmTUZkQkFF?=
 =?utf-8?B?MHdkdzdUbytlVTFDWXdYV2hOei8yQ1orUE9IZ0p6bnd3MHl2c1RWdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e4b9c6-f2b7-45ae-f990-08df2076350c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:13:38.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTsWd12TlvXCQC1pp2XmbqGhyfvStzQ21VDupU6DZbSyI6S+V+Pn6XMyjtlKc7IIILmkgQX4UM+I0H+PTSwvjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

On 10/2/26 12:55 PM, Alexandre Courbot wrote:
> On Fri Oct 2, 2026 at 6:50 PM JST, Gary Guo wrote:
>> On Wed Sep 30, 2026 at 4:41 AM BST, John Hubbard wrote:
>>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>>
>>> A driver that runs an interrupt self-test during probe waits for the
>>> handler to fire. wait_for_completion() has no timeout, so a broken
>>> interrupt path stalls probe indefinitely. Add a timeout variant of
>>> wait_for_completion().
>>>
>>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> [jhubbard: return the remaining jiffies]
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> This email should have RfL list CC'ed.

Hi Gary! Apologies, my send-email scripts had drifted into a
nova-centric direction. Will fix.


>>
>>> ---
>>>  rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
>>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
>>> index 35ff049ff078..7e8b3c1c880e 100644
>>> --- a/rust/kernel/sync/completion.rs
>>> +++ b/rust/kernel/sync/completion.rs
>>> @@ -6,7 +6,12 @@
>>>  //!
>>>  //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
>>>  
>>> -use crate::{bindings, prelude::*, types::Opaque};
>>> +use crate::{
>>> +    bindings,
>>> +    prelude::*,
>>> +    time::Jiffies,
>>> +    types::Opaque, //
>>> +};
>>>  
>>>  /// Synchronization primitive to signal when a certain task has been completed.
>>>  ///
>>> @@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
>>>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
>>>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>>>      }
>>> +
>>> +    /// Wait for completion of a task, with a timeout.
>>> +    ///
>>> +    /// This method waits for the completion of a task, or until `timeout` elapses. It is not
>>> +    /// interruptible. Returns the number of jiffies left when the task completed, or [`None`] if
>>> +    /// `timeout` elapsed first.
>>> +    ///
>>> +    /// See also [`Completion::complete_all`].
>>> +    #[inline]
>>> +    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Option<Jiffies> {
>>
>> NACK. Please use the typed `Delta<Jiffy>`, not this old type alias for c_ulong.
>> I asked Miguel to take that late last cycle because I know there'll be new users
>> that want to use Jiffies this cycle!
>>
>> This would avoid you having to do clamping on the max side (but you still need
>> to clamp the value to be at least 0). There'll be a helper method for this, but
>> it isn't available yet.
>> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flapping.org/
> 
> I will drop this patch and replace the code using this new method (which
> is just an optional probe-time self-test) by a polling loop on an
> atomic. That way we can wait for the helper method to be available and
> revisit this with the proper type.

OK, whatever works best. Just in case, I did stage a fixed-up version
of the patch locally (in case I need to send a v6), as per Gary's
recommended Delta approach. It looks like this:

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..7756677cc6d7 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,7 +6,15 @@
 //!
 //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    time::{
+        Delta,
+        Jiffy, //
+    },
+    types::Opaque, //
+};
 
 /// Synchronization primitive to signal when a certain task has been completed.
 ///
@@ -111,4 +119,26 @@ pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
     }
+
+    /// Waits for the completion of a task, or until `timeout` elapses.
+    ///
+    /// This method is not interruptible. It clamps a negative `timeout` to zero.
+    ///
+    /// Returns the time remaining, at least one jiffy, if the task completes before `timeout`
+    /// elapses, and [`None`] otherwise.
+    ///
+    /// See also [`Completion::complete_all`].
+    #[inline]
+    pub fn wait_for_completion_timeout(&self, timeout: Delta<Jiffy>) -> Option<Delta<Jiffy>> {
+        // CAST: the value is non-negative after `max`, so the cast to unsigned is lossless.
+        let timeout = timeout.as_jiffies().max(0) as c_ulong;
+
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        match unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) } {
+            0 => None,
+            // CAST: `remaining` is at most `timeout`, or `1` when `timeout` is zero, so it fits
+            // an `isize`.
+            remaining => Some(Delta::from_jiffies(remaining as isize)),
+        }
+    }
 }



thanks,
-- 
John Hubbard

