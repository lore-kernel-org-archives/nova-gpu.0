Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6D2FD1AA
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 02:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787193093; cv=fail; b=A/xnKUPxO76xUHnPxtiRpLfB8vagTJyqQGBf76MBErzJUCBAiv5nB34dl0jk5yMvsDeh+3ln3cnUX0Z2YAyHYMwc7O9/KySLE/GthdFGIKyKWcOwDxZCJ0azJAkM1rgwa5GCkm5zQB3ouXFoy32fMbOuQG6z9CsoYk7vctMbJmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787193093; c=relaxed/simple;
	bh=tkdZXQNfB85Q3EfVP+fpcFhjsVjbQKhiWpEakYP7dGg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NEf4vtIlw75JLtILNebza5OAvf6FwIN6Dx0ExjM2c24MtbZ/fFtDUFAUj0xfVLf9SJp1eSlCbbIIhjA2A5Hnod+lZWCwuw1EHV4FYwpuvOzARtjl14vaqBv4bAhFal2kGlHxu5M1v2j/9X7nKd+A8jeK9kRzSGRfXcHyf1eJiG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LA644Hk3; arc=fail smtp.client-ip=40.107.209.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LA644Hk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sm2ICNN9bvqDnULsncV4EmiEWSwa3af/P24XMjwfcXSudbPGoovYU09HE6bzGl0vsGFyqdE+uxQGXELjG+41n0KrbE0N/zARBGwKxLxX4GqCDeGs6Ybgiur6goXQHbtoJEWKUSlRRwIwj4LQ2Zmc2fNeik06YujnxzYk1OQXUUN58KqEGCynCDCzm/4ZTt6l1Y/bgpczQHp6jXE85CI2OiwlzlRdHR1/414k7aJ+leQTDn/37ecUXoYiAYfvgkKCfO6XYGbL0y9w9rfkIiomJwdR+Lgk58fU8Oqv3r2nRricEQaDKGafJNsKStXwRIzxr4ojFanaRVvOwvmH/5mr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTkasiy+JSOkwGuu3xOYdHPHVjSPHgFnRLgNof3rYxM=;
 b=Ot9YyooZIwta3jaGDftHdRl8mmISGeV8+7kTWIYcGCAq3VEa9m00SrCnWdRCCc2J8x+rLeRrNAw/3LBxaEdeEoZOgXv7PNu1mQV0Sh7bpWFGwWZBMRTg/8huAa6vvYivBpfNct1ZN7wDWmuhyJh63NegKA0rYoF84IzGU0yVs3LkHUjiUNwBjlHp/Q5KNl/kGuMHzJmMEAH1VEMfjxQb28ELYkyN2cPA+rYsQfWi/t7eexEb0kaBeHD5zVQxUyMIcqD30gNRdzon6t+Ndnl0av9HhyOQBD04FxW9wvB+EachH8+4SLFeZNUD4jVUfboteDR2G/Aa3mswGqk0y5Z7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTkasiy+JSOkwGuu3xOYdHPHVjSPHgFnRLgNof3rYxM=;
 b=LA644Hk3NflQsumS34nQF9062wUzSRc9QPtJiBZC/AfYl7Bdy8a1hg2Fp7Eg0Mpt0yGO4AAplQ/4L01onGLCtzaT73YKzWRTg7I1NziIeqzGg9DmxcaSVDCXnAezHg9lPJEQ36u491xmwgWlqCHU53lc+dN7aqZ7vsJmVMw6m0RvHp+bBNQv/tGZUbh2S/JrhtwDVoiNwEaI+RobYU/nsaGj9UwiTe2ZZZSMwg8QgJ8AeQzqXjGg+X6tOlRrhGTahLxXTSqm//Y3yYbBOcClQn7UarJzLzi9+tpusVC7HNNuqg9kn+3MCtLUiyRIRWPQVrpYYaxEZci6RPOdkmojWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 02:31:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:31:27 +0000
Message-ID: <dc8ae5ae-f7f2-444b-868a-1bc89bff7af0@nvidia.com>
Date: Wed, 19 Aug 2026 19:31:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/27] gpu: nova-core: add optional ucodes firmware
 loading
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
 <20260819035221.336390-8-jhubbard@nvidia.com>
 <010aa9b1c5f8bda067db5c13268d3cdadc6d581c.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <010aa9b1c5f8bda067db5c13268d3cdadc6d581c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH8PR12MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cc5833-fb75-412c-7e61-08defe63228d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BE5K6BNeH5vxVyEkazKpEy/SUS7LI5fqRmqqmngsGi7VaZe53udvdKMCQ2PTRYF6VUScvO3T0X5rmMQjcxcHCSv2WgSY5Uh1bwSNDvX8K/fVjmlHbPq5MNIIIoC1z1nrldi0aFe3xjkuWgcuDMQgw22ND+s60JRsSTrWhiEaaPtRVeDxsyPr3RPVWrjoP/hZfYgF9n5KZ1fTVniQVQqfh5WFlUoJXdzTJbFvRw+NFBod8eoVPIg4hZJ5ywS/NvmRWNqOAKpfUCjH3ZPi8WnDSYmPtrndUubp3oCDycxrnxt7+kZzaFkvoCvRS4tgztOyVCxpNpuLv2Zh8zdb0EjDTWP8aR4bnqh1RjUBxVd5IkLiHFVqjg28Ii8hBNYwoqa0uU8wcQqw5h5S9oXg8Dx4tm+0jvXjH7YfIplkov3bp75RUIeynqZxPJe7qjBuNs63EvL/wGcziAdrZE4xjzRRKXi9Va7O95/0pX99j+/DMxj+u6XFXMAco/MfA1EPqCIZh3OmwWVJg8sWSkpKNfSCN/HKteJzmwVXQA3+MAb4PGMs/ublgn9VJvjHBXmLo2sDwi4R4bJWYekz1nVk0xJob2QxJRNlNHNERgc9ZsnIH60R5gkyChVer4SUAjyPgcawRovzrdr81nkv+kRcVYV9R8gvlmIfoK1uVvViT5bUH8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0llQjYxQW51L1Vxa3gyTFoxY2FnRHJGMWZ5a0NmWWhNN0MzZ1d1WTg0bXNS?=
 =?utf-8?B?M3c3VUpJc1hXQmVjYzM2YjN5ZlNQbytleDQ5V2E5NGpBeEZpUFkxOXhpQmZF?=
 =?utf-8?B?dEUwQU11L2tTOGNCbWpVeGdqZHk0L3JoaVNnT3ZFazNOOFdMRnIweDBQeWZP?=
 =?utf-8?B?Q3RPRHNud0hYL0ZjZDB6R2Q5MDVkYW9IVVp1MTgrMktlYm1BNjdReVlDRTVT?=
 =?utf-8?B?aHhSdVppTHgzd3hMWDg0QUNac3F1UDVEbmZLK1FSUGRPMTBRVXZuMkdzZVNs?=
 =?utf-8?B?Sk93MlAyY1BvellsK2lLU1FZczZwVG53UFVYZ0psRzJWVnMvZjJpQzgrdEpV?=
 =?utf-8?B?MC8zc0o4b3pvSFZEMnI0YVhhQWYxYzBsK25NTlI5MGFSdFNEMC9QVG5GQ3h4?=
 =?utf-8?B?MGhZbmI3cERpQm5SVUtYK3lwQkFrSmxkSjUrUmVmYkJpQ0Rybjl5bkdLVG1I?=
 =?utf-8?B?SE5YaXg0YWExMGlqTDEvMTVwbHdVbzRDWGFsZVRxcUVUdnhxeng0S1hVMDlF?=
 =?utf-8?B?R0F1L2ZQM0dhT2p0aXpHZDh5bFN3NzFvK1FGZ3RtbkJUL0pMUTlzcHVFZVlt?=
 =?utf-8?B?K0JBZXdnT2dKdG1seHVNcnBBbG53NFYzRnJLbkFJd0NvckZQS05qZUowYzNt?=
 =?utf-8?B?U0xWSXd0bFdtMDduSC9EdUxqbTJYcmN0aUh5SnVJNjE5M2VOTUhFcFgzT1RH?=
 =?utf-8?B?VTR4cDJ1RmQ5R3Yvck05bURvNEVMRng1dXZnYVpJbzdRNHlXdW9xUjc5TWor?=
 =?utf-8?B?MUM3Q1crWVlPVmZjbGlUdjdwR1M4MmRyalB4Z2F3L1JYOU9LUUM1dXd6Umsx?=
 =?utf-8?B?YzdNbnJCNHZnUDJWdXFib2NHa2tpdm1HTmhLMXRxWGc5cFJVUEFQNjlWK2lC?=
 =?utf-8?B?WVdrWmhEMW1GTk0zaVBCZkZVUWJJK1hzWERiM0hYdmowWi9tY0xSdHNFNzNa?=
 =?utf-8?B?citrZTgzWFBqY0plTWtIMXBjSGlWbXlpOGtLNm5BQ3pmYmtQYTcvUFFtVHAz?=
 =?utf-8?B?bWNpbHArM0I0Uit0UjFQOHhYSjBWcWpWQmpDYXJRay9ucGpFREFuTEpWa1BW?=
 =?utf-8?B?ZGR1VzB4VUtpU2prMDBXMEVJWmNTUUVXT1llUngrMG9kWTBEZ21XUC9ZRkRU?=
 =?utf-8?B?empTREhVcFpqVjJKN2x1TDhodDVVV0ZEY3EyRmY5Yi92RWdBVUdCektzOWRD?=
 =?utf-8?B?dkY3Y284RlhoY2lzc1Y3bDlkcGlyUGg2TDR1QVR4Y3F2aURKUWh1WHFyZDJa?=
 =?utf-8?B?RHdXMkg3UHR2QmVrODZuVjZWeDRmTlRXUWxFMGI3Zmt1R05KRGNYTThUTVQ4?=
 =?utf-8?B?cmNtd1lWWVk0UEVCdElOckV0UmlXMDVpbjd6L2ZveTh1N0FsMlFZUTJmOGRR?=
 =?utf-8?B?TmRpNHhzWml1bHA3OXA2Mkl2M2pMbWZIOTAwZ1RmSmhYVWZrZ0ZoMnNFbGtp?=
 =?utf-8?B?Uys3WkRFQTJCakJNY1gza285M1JmdUZ0dVl5NFZoWFkxMlF0V01TRTZQbnRO?=
 =?utf-8?B?Sm4vTUZSZTFIcDA5ZG9KUTJXYzJXd2M5SXcycUxmVGRJWjVHZHZUV0V6Qnhp?=
 =?utf-8?B?T3RKYWM5M3RkYzZnQzh0VXNhelQ5OXcvQVM0SDFiUW9vQzY3T3VwL3ZpVXB4?=
 =?utf-8?B?aE5JK2g2WVhiSDRnbmdwRVZpZm9XMVprT08rdm93ZEFRMjREVi9ZM2VsYTJW?=
 =?utf-8?B?d0xjc2lGcG5ZNERmelo3U09sUGhCendCeHpIdm9qSWExNW5rUkhtSEx6Z1Br?=
 =?utf-8?B?QW1YaE02S2dPYVlYUjJ6c2tjT3lMV0I0c2JHVnFIZlJLWVpGSHVjTnA4K1hG?=
 =?utf-8?B?N0l5UU1BMUttcWs4cHFzc2VTSDZ1Y2FYT0xrdmwzSGNyL3M5eUZIdUxoeVNP?=
 =?utf-8?B?ZFA5WVlVVVNvRVNxbktZZ3RJRTFVOFdGUzloQ1JhT3R3MkJ4WTB2OWpwVTI3?=
 =?utf-8?B?cDZrSnA5a2NKeFpNQUxXaFYxQWtHZ0IrU2xseS8zQnRxYjJ4RjdENHJnZmdF?=
 =?utf-8?B?bWhQM0VkUlF2K3NCaVFkRjRTSjgvdzV3ZXlKbEhFRjYydXYzNnlzV1RwSW0w?=
 =?utf-8?B?S1o4YmZCUEV1QzFTd0tvQjZVKzZ4UnNYaWdrQTJTUVA0V01ibHNNV3JYeTIx?=
 =?utf-8?B?clRQVTlMWC9FejcrTkJwWFlGTFgzRGRFcUNHN0Via0IzbnFpODlwV2NZTHZp?=
 =?utf-8?B?MW9ZczNVYThRMkd0SDdtRHMwc05JMVFNMkZ6ZDQzTWdSL1l4UW5HQno1L0Nl?=
 =?utf-8?B?aGFvdjRKRm90amNTbHJvaE9iWGM5aXBxUEhoa0ZzSi9VSGZlSGxqMVdBZk5D?=
 =?utf-8?B?OEFDS0ROSlBwMVhBMHNrZHNNY3dJVDBuNHc3ZDVRZEZRZUhoaWd4Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cc5833-fb75-412c-7e61-08defe63228d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:31:26.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtINLbEXRdIl0PPVQ4ejnEvaEnllMgO6zNdqd2rEcVPWYi2Qj57b7sSFzQqaTR5wo3Mys7Vfj0OvUeAfGHFVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766

On 8/19/26 11:41 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
>> +    /// Loads the payload described by this TLV into owned memory.
>> +    ///
>> +    /// The generic firmware TLV representation is either an inline `BLOB`, or a `FILE`
>> basename
>> +    /// together with its `SIZE`. Mixing the representations or specifying only half of the
>> file
>> +    /// representation is invalid. Referenced files are constrained to the metadata file's
>> +    /// directory.
>> +    pub(crate) fn load_blob_or_file(
>> +        &self,
>> +        dev: &device::Device,
>> +        chipset: gpu::Chipset,
>> +    ) -> Result<VVec<u8>> {
>> +        let has_blob = self.contains(b"BLOB");
>> +        let has_file = self.contains(b"FILE");
>> +        let has_size = self.contains(b"SIZE");
> 
> The problem with this approach is that it allocates a buffer for the BLOB and memcpys the data,
> even though that's not necessary if you expect the TLV to have a BLOB tag.  It's highly unlikely
> that the driver will ever not know in advance whether a given TLV has a BLOB or a FILE tag.  
> 
> We should not encourage the driver to use this function for all images.  Instead, I would like
> to see a comment that stipulates that this function should be used in only two cases:
> 
> 1) We will want to keep the image data after the TLV goes out of scope, so we want the BLOB
> copied into a VVec anyway.
> 
> 2) We expect the TLV to have a FILE tag, but obviously it shouldn't fail if it doesn't.
> 

OK, let me go tighten this up accordingly, yes.

thanks,
-- 
John Hubbard

