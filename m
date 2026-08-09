Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5A3451CE
	for <nova-gpu@lists.linux.dev>; Sun,  9 Aug 2026 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786311738; cv=fail; b=otxLuKfazRZA2xfx41EN0eNfE0nBeawcfyO24vdGhzE+d36CZjqW3N5sE5vbJDidGyYYJzzMNOSsOAAjHE2gNODfmhxSHe3fzPa3Pi07ECf5lajwMsUT5kD5WYZwOqyCgb61W+W+8sSS7aqnlcbzQ/PjU9DRDnoKd9WM42nG/4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786311738; c=relaxed/simple;
	bh=LFqKFh9LKqGC9HkacENsi3pCF2MDxWxPaqA/JPkdLxI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NlnLs9pDycua69wmZtG1hzkHuHGykMzRVvlG9YaJ+Cxp9NBZ4V2vXQQxB3dZHnFfwvKQfNX3Lg3nS6q5lfi3JU+hNdfqBC+byZ1R85RlSGvxm+fLyhsg9uK8/XA5hwC/w8LBPBn043mjc3z8nmRQ1CHaCx+HIUGuhAOvgsuXBrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lkn2q6Re; arc=fail smtp.client-ip=52.101.85.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lkn2q6Re"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApaN0IktVqUA4ID+sJqJk4Pwu02r87ZNaEN/vEcYI2CCzW2yd8nDCn4S9yIsbgmBHFlR/u2BMGEvVuMGXV9ZM0XoEaQJKFPxjdQe4DzCSe8oYtf/MDiv08eyzbeHAu70+GwmU80DefRiL+93siqgVbAugfPReQZ4RP3gWZNRbhpgYaYZEFuLsF1IdvUYzuSvOaQVu8SknArmIL/RDEctSZQ13deY36I+uxDAB6iAg0ZUZjlYPaei9lEEsZTnqHR859ZL6OSpjfaCZLM3PSO5/gLccnqFK6IpaKYIjGMm4+nj/zSVwqd0WZuH82PyJ4NPFl6EjllekWTR5z7nR8MKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA4NcGdiKhMumWBIvqtw/OOp8Ccc/TYMHlKbuJMt49U=;
 b=VQEniLCm1gDHkS0hYda17SrENr/9+Y+FKaO/pta/bV0F85Bx9t+Ia1u4cswivFSe//f5BJ38peRNKBaipoxugNMROpjH4Nq8/52nwKnbYIbSmNXC7MTpPR+jWVUSZHl+6a1QQpQcShgZescPfOGafMxbKUFVpc8LtD/LGIxDnL+NN86bDviVczuFGowEpPHSo40r+PO7SUQd4XYa7dy0jGtIV2/Ihj6fLi+pNq+1QGZNCYtReiVN3ay3sQ07UVRxb7+qOhei+4jx4PUqSGZmPrpHsGTy9Yj2L8QWJS48gQZPaobUMT6WkA9ngoZ1Deat3WSfCaD0+JUKRP3Oolec5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA4NcGdiKhMumWBIvqtw/OOp8Ccc/TYMHlKbuJMt49U=;
 b=Lkn2q6ReNagpOxH2wuTgcPtcfylIBvIr1Y+yf0IgWc1zsvkKxCtq9caczq4SgZFcA7q2ioUr5q+6Oom21wJOeeQeY/OTFB/Jyge+c7vDbtDvCHalLDchW8ARdeRoNDxK7Ff3anUSadaTAvMcR7F23TRhsWxVfaSXQKf46nbmxnsOzzl5giI6ieTdr9vOLmXZhl9xjllWcqIB9bl4C/uOXPlzi+h19V7BUtcDEsUX/Xd01Q70cQZv/kEfnPYcv37ulU6zwvOWBKjyDk/2vMurh559inEsablm265pPUiV3nwekWLLvqZVvr4uZCzc/T82FEo2kx2A1Oqrc4aBBBu20g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Sun, 9 Aug 2026 21:42:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 21:42:09 +0000
Message-ID: <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>
Date: Sun, 9 Aug 2026 14:42:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
 <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: d3faae8e-277b-4dfe-f0e2-08def65f10b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|10070799003|1800799024|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2+agBWSX0wp0GS/d4yirOk+Llp2YYDFBzxPRMW+CAB8s1EATDLm4mAyHz3mFPXGmb2j6tpiUPB72SkUIhYt8GHr44Y9Uuk8Gy0M8m/DRj5W6Nsqhmw85B5VttigCK+5dcfRXoeJR4X3SKKb/NktxUNrrF2dd7fRiowUad0bC5YtjL6LYqZAsfkk9jIy+Ql8/FHuO17weF4W/XC1+1oS7wP/cRKZ0TQqDB/Ctpz1Hp1jZZYPoIqE3DZwjZMzm/632nxLSUuNFv2FqEG6oH87ppRuoQp1RR4GM8FIBhXp3rOf6riV9nHGj8GMNe/sPkQMC6H4l8SH00FOro8A8e7vMGF9SdVfdmRFXX8bmiBNK2un1+mgRK75WhJlkxyM9DfEj7exzFaRvllTH9j7NM/BF48AtBWHCi0CqPHiHu9RyuNlMoL/krMquHSJVg6rVmOqwdJ74pBr0BEYLZq6m9KK2gZiIirfOZL2jTQTRH8X+wkrAZuhsWvQ0l6lEongSKOVMh5dp1ZEKddxMxKr1LICPHqmN9QMeNF+AZzSzROQR2DOX9/Sretqu657tQ05IDbPvDoTAaHr4znTd9+blWC1UCngmgkSlgkipiVOaL9CYXJuPPkrQ0CPai3MS0Y5xvIbHJ2QjjFMFYo46tXhcydryswblzT9o9hsaGcZx+bjOU7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(10070799003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWhlc0ZuUUd6SmR4UEp5YnpPeDk1eTlML2lvVTR2Tmw3UngzN2JiYm1TNnlV?=
 =?utf-8?B?RTBld1Y0a1F6bkVuek9qazc0Mng3R09aUU5rUzJJUmh3R25QRjYwcG5KVE5h?=
 =?utf-8?B?NVJPUDNpYW9DTGdBcjFURGZKMlk4aDJoS0x5ZEljS1cycTBBVmxFbVEwUTFY?=
 =?utf-8?B?emxRaGZZVUNqcEdGNlgyeWlQSk83TkFtRnFsZlVGZUFJUm1LYm1jZjZ6b0lE?=
 =?utf-8?B?cGVmZzV3bHl6c0xPYVovMHZRdkc2aitNd3RzWEMzTGpoUEw5RlN0SHRZdFVt?=
 =?utf-8?B?QmZTL2IwYnJnc045MkRTUE9hUnR1MWwvUWozeGdRT1lUc0NCUnpzUzBTd2FZ?=
 =?utf-8?B?TWxYcG04cjk1RnYvTng5QkJJbWh5ZFdnYmhLZTQ2YXE1YnRlcURkMkJBVXBF?=
 =?utf-8?B?QXMzaENFUlRZTkZhT3N2MUozZll1U3BBcHFiRXU4Si82NmFacjlLb3AySDkr?=
 =?utf-8?B?RDhCc2ptUVhJRERPWitLL2NaZjJ5amFiaXFudFhpV3RCdGpTd3ZKTXZ6S2xG?=
 =?utf-8?B?bGpOcFQ1ZER3ZzNQL2ZmRE5LdXFPQjI0QUdGaUR1V3NwQkJtekkvREU5UWRZ?=
 =?utf-8?B?NG5GNEt4MkVIbWdwWlFjSGNyeGEvTWx6K01aeGw5SiszSkdyM1AzU2NOaE8r?=
 =?utf-8?B?aS9jV016NzlkMzlKYlZPL1J2U0hIWWphcjg3UXBFU0dFN3UxcEo5QnExdzNL?=
 =?utf-8?B?TUhiVTgvS29rZFVNRXVQbm1DU2w2U1IxVEh1dW42aTJUVEM5dW5QK3h4Y01v?=
 =?utf-8?B?WmlEalZ4MzBRUlNwaGVVWjlrU05udWxuK3BEV2d2MkhzY1pieEU4NXJBOE8x?=
 =?utf-8?B?ZVBESTJYNGRScGRBZGIrR2JacjBXdDNXSGVjdU1MSUJqN0IyT3VJT0VmNy9l?=
 =?utf-8?B?TkJWNGlDWlFBWnhuM29NQUZTZXUrNkRyVEpOTW5QMllSUXNjN1lzTUpoU0h5?=
 =?utf-8?B?TlV4SnZxdlY3SlFCdDg5T0k1aElpekt4aSsxNGxqeW1IaU12eUgxbHB1OE5I?=
 =?utf-8?B?dHRpVXJFVUpMOHNOdU05dmg3RnVjRERyd0wwUHhNbHFoU1NubTFteGxPYWRS?=
 =?utf-8?B?VEtrcXNFVnhNZHE0QmwrZlBIT1dNQkFmTTFZSlZlRUQ2VGdEbDFoMjR6TnR6?=
 =?utf-8?B?V2Vza3Z2WmtaVEtCSWtiT09iSzQ2bTVDVEEwK3U4bmlTRjVKbThxUlU5d24r?=
 =?utf-8?B?SWkyY0p3VTFRU0RORzI5aGcvSTArWkhoSGFkY2VOam9BQmM4Z241bG9RUjg4?=
 =?utf-8?B?Z2FlR0RNa2VkOGZCWXptQ3hLbzZCUUJpck80b3NZbjR4UmxBbzhmNUpPY0Rr?=
 =?utf-8?B?aXpDZkpwNUlBUk1xYkZDaVR2NGVCdTE4L1poNHVIdm1TWlF3Sit1eVdWWU9t?=
 =?utf-8?B?ZXhhZU1UeVN2TDhHVUZ0S3lJbHRMU01ZNkdpVjNEMDZuZDUxSGU4czBiejZa?=
 =?utf-8?B?NHZaWEJwK3kyOHFINlNtWWlKRlRYT3VqOVFaQzBXWWFmcUd4SDJkM1V0OWtw?=
 =?utf-8?B?M05nbC85ZHBoYlVFblk4TVk4YytlM21GeExIQ0hCZWMyeE9xZVYzeTl0ZDZq?=
 =?utf-8?B?dEh2ZUludHNMT3dzUDYxZE4wQldFQTJtVyswV0tJZk1pbThtYnl6Y3Qvemdh?=
 =?utf-8?B?YWJJU0NQVThzTzI2cHNzaldxSk80OHJoU2Y3TG8rSnYxcWVzRUlia0ZkN0lV?=
 =?utf-8?B?OXpYUEdyMklDQ1FlMUZ2a3hUMFNRNkFaWDFnUnpDcTNPbm9YOUd5dXRnY0dL?=
 =?utf-8?B?T1d1cEJCT0VXb21xV3d4SVlwQ1NZaDVNd1JuS2U4LzBkNTZnUEp4ZXRHeCth?=
 =?utf-8?B?MXRqcG5Kb0w3b1F5MEE4bERzQ1lDZXYwdjZ2d1pRWEZJRDhVbUV4YjNUaGlL?=
 =?utf-8?B?Yk11dC9ZNnY0NmpocWt1djhxVmRvZVdoVldyV3dKbGI1SWEreUZITUM4WFpH?=
 =?utf-8?B?L0MxL2lESitpZ2pCV3lCV0E2Q1lxajJkNUlZNWxzVS9Bc2U1dnJxYTdnOThT?=
 =?utf-8?B?VXhpYnBick53MHVaNXNVZXphQmVOa0s3anhnRXl5SGZEY1liWWpZUnpqNzJL?=
 =?utf-8?B?ckpyQXJpbm5LRFYrYVdZWFJvNjFEZWVicVRTU0JuZVJrWG9qZi85cW5LL2p5?=
 =?utf-8?B?M2VSbXp1N0kvM1NqdGludmtvL3MzOHZ4NGRvdWw3QW9DdU45OVI0aC9WZjcy?=
 =?utf-8?B?NnhZM2VKSXlkRENiQVBaWnpJTlMzL1ZjT2ZHa0ZSVlppWXRCY2FLdHFidU1v?=
 =?utf-8?B?L3hITW1lQzMxSGE1R0cyRThUd2E0eldzNUwrUVFIY2Y4Q2NmaUt3bStOMEVq?=
 =?utf-8?B?NWdJVStyeDUrcjRGMzJKZzljQ240NW84dTc0eE1RUHA2bW5GTzRDMkxqT2pG?=
 =?utf-8?Q?sjNWWCIXUbqX0Hq8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3faae8e-277b-4dfe-f0e2-08def65f10b8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 21:42:09.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uNPNFba8Ae0wrrMwWofty/hSISQqm+qIlUgelyjpVmunTmtzh3KyizD2TAA8OWZpsXWrXMTOMuu9Hxd8iwgng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

On 8/9/26 6:24 AM, Danilo Krummrich wrote:
> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
>> index 4ebf256dff23..87ccd0cec69f 100644
>> --- a/rust/helpers/pci.c
>> +++ b/rust/helpers/pci.c
>> @@ -24,6 +24,17 @@ __rust_helper bool rust_helper_dev_is_pci(const struct device *dev)
>>   	return dev_is_pci(dev);
>>   }
>>   
>> +__rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
>> +{
>> +	if (pdev->msix_enabled)
>> +		return PCI_IRQ_MSIX;
>> +
>> +	if (pdev->msi_enabled)
>> +		return PCI_IRQ_MSI;
>> +
>> +	return PCI_IRQ_INTX;
>> +}
> 
> Rust helpers should only be transparent wrappers of existing functions / macros.
> 
> In this case this can be easily lifeted to include/linux/pci.h, as it should be
> a useful addition in general.

Will do.

> 
> On the one hand there's already open-coded variants of this in drivers (such as
> in [1]), and on the other hand I think it is not that great that drivers access
> fields like msix_enabled directly.
> 
> Related to that, msix_enabled and msi_enabled are fields within a C bitfield of
> struct pci_device, so accessing this under just the Bound device context is
> formally UB (though in practice it shouldn't be an issue).
> 
> However, this makes me notice that pci_alloc_irq_vectors() and
> pci_free_irq_vectors() both mutate those fields.
> 
> Consequently, IrqVectorRegistration::register() is technically unsound by
> requiring a Device<Bound> and instead has to require a Device<Core>, such that
> the C bitfield access is protected by the device lock.
> 
> Now, I think that there's already fields in the struct pci_dev C bitfield, which
> are not protected with the device lock (such as block_cfg_access or
> ats_enabled), so this is already racy regardless.
> 
> However, even if that wouldn't be the case, pci_alloc_irq_vectors() has valid
> use-cases outside of bus callbacks, i.e. where the device lock is not held, e.g.
> in [2] where it is called from a work item during device recovery.
> 
> IOW, just using the Core is the wrong solution (and insufficient anyway); Bound
> is the correct context, but we need to fix the C bitfield issue.
> 
> I've also reported this in [3] for the is_busmaster field and it led to the
> patch in [4]. However, I still think that there's quite some more fields in the
> C bitfield that should be converted to bitops.
> 
> We recently had a similar rework [5] in driver-core that I suggested for similar
> reasons. While not every field would have actually needed bitops, I think it is
> simpler to just use bitops and be safe.
> 
> [1] https://elixir.bootlin.com/linux/v7.1.7/source/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c#L196
> [2] https://elixir.bootlin.com/linux/v7.1.7/source/drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c#L773
> [3] https://lore.kernel.org/all/DJOEYVBS17MJ.1YD3TNGQBWHNK@kernel.org/
> [4] https://lore.kernel.org/all/20260714-pci-dev-flags-v2-1-a1d7dc441cf3@mailbox.org/
> [5] https://lore.kernel.org/all/20260406232444.3117516-1-dianders@chromium.org/

An interesting read, thanks for the write-up and the references!

OK, so I'll leave things using Device<Bound>.

> 
>>       /// Resolves the vector at `index` to the Linux IRQ number that delivers it.
>>       ///
>>       /// # Errors
>> @@ -177,9 +187,21 @@ fn register<'a>(
> 
> Currently this function still uses devres::register(), but we should change it
> to return Self being constrained to the lifetime of the &Device<Bound>.
> 
> This way the IrqAllocation type goes away and the IrqType and cound can be
> directly on the IrqVectorRegistration type.
> 
> It also allows drivers to explicitly manage the lifetime of an
> IrqVectorRegistration, which is something typically used by net and block
> drivers.
> 
> Note that this also requires a borrow chain where irq::Registration keeps the
> pci::IrqVectorRegistration alive.
> 
> This could be done with adding a generic on IrqRequest which defaults to () for
> non-PCI stuff.
> 
> If you prefer, I can also send a patch for this that you could incorporate into
> your patch series, so it doesn't conflict.

Yes, please. Then my patches 2 and 3 collapse into a single patch that
adds count(), irq_type() and an index-to-IrqVector accessor. Or, they go
away entirely if you end up putting those on the type yourself.


thanks,
-- 
John Hubbard

