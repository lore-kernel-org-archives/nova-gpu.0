Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164A3ECBE3
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660200; cv=fail; b=fxJu39FAeAAHnvg7VxwP3SUSfcFYNZUD6NSbpbqGJZKXkrA7g+WFJlkbci6+ojXYrdjCfWaR2wUcTZGwaXHtyEREXxM0sFO6yf7Odv8GMc3CfV7g9tYYUu2j7fu2bMELjZEDaPviFNbODst4i/742XNkLqKp9ht6ipBdw+lwwVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660200; c=relaxed/simple;
	bh=WQ0TP2g7Bwu/Uidf74E40PAeIZ3xPF5l9KYWQt0t9so=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jLUEAMXXKw91J4IvIWvdWXR/pM9NUQq+kgze/kC/demk/ForRTqxDORxk4rFCWTpHVicezVZY8GFMzh2TohNc0x3afGaEVm2fMG/uZN2QOBKLixvIfdA3a2207hogcoAGtP1PP/Gbvyhh5kqdN1S88bDkSFWmYK9/K4oy0nGlhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RwhNzSPz; arc=fail smtp.client-ip=52.101.53.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RwhNzSPz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fcd82q0ptsjeUAOIJuOIwha0/Wx7nc5SG4c55gkQBar0bDtZq9Bd0hAnO6wB92XPAqa2OVJVcNFKHs0nVqIb7ZB5akPJr5Pzb+8SPySUcA29L4X6efEeU2k7qnbhp0SOYuuIYQW7ZQke+7O0u3DT5jWgVxSuSIXA63osJiBTCLX9uyYvSMhBp1g9YG9TAeY5k9XNcegErYz/3GJ67wTeQ3xRaPcOt0Zs2ZKpICX4BjWhyNWRzpDI6O2b23H0uh82GzmHSKj6bjeyCAsFyHR0cS0RMllrVCLt0QHOGXS5S7Zijd3MaPNMu0Yn48mlhlM5ONRyxXm82LGBBdgFMDCSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVMA72A+Gc3XCYomJUQDCQkfwVe6ICXeP1u1RHGYF2g=;
 b=dy9Xw3jX1XxvScqQS7VhKQrpKLIbY91CaTK+fZy5+/k1AwQxqPtb3x4YBUc0NXtSXEFOxTUF7AQi9IFnbYAHDG8RvniLP7h/STAbUFepOEZt94MzAo0rMjJyc0I+GjAXy+oeJc+6edg0+2ovfzF9HsfZ4whtzIz5ofAWYhpO39Ex/rJpE2kv/NdryzL7bs8Yz+si8ftYD3JyrFZjobdNDiuFAROPeeaZZ6xRgZUw5MWsdgKJ3169TMNLFVdYnSDRqutx44gC8E8r4svlNpvfwzePBuler5POlQ9lnVht98mj8yoRu8JdYLYjeySrHeIpSYGM1TioB4BD5ev8osDQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVMA72A+Gc3XCYomJUQDCQkfwVe6ICXeP1u1RHGYF2g=;
 b=RwhNzSPzvXPllrcLXbQv2N8ELjz9oag53YaWgNc7Xut3++fUZsB7Q4klrbAXHQ1TvHAdGlVnrUcH6IgcTkX2PV3L0AtGUJ1FwO5fTOx+3I4TR/RqXNJs6EjajQgO/USyv4fYmedSfiOSfXep4UGb6eSJUf9i0EFBa8nF+5+WMOQN0FnSdtBorKML8S7SQfsy0ppespNLiu4mRkzydTu8g9Jmf1jL26f3iAZhZHnhvqvDWYQigoTtb7K6nkBhDnCugwPvj+VTfZE7/o+g/sKU4R8oBzZRkT2TbObUbJiDdY5haJ1JnMe6f/V4MgOqY9hicJg+5RyPNS5lH7zS/w+0yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPF6375781D1.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::995) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 22:29:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 22:29:49 +0000
Message-ID: <39b44d64-928e-4d65-81d5-a06809233c99@nvidia.com>
Date: Thu, 13 Aug 2026 15:29:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
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
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Will Pierce <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
 <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>
 <DKO63NHZUU47.27B9TJ6B1FB8N@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKO63NHZUU47.27B9TJ6B1FB8N@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPF6375781D1:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c78160-5570-4885-a952-08def98a6289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|23010399003|376014|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	OYXDftz/6VWp0wzge3fMgXa0yMVndFns2kVs/pmzZJ0myLZ7MhJTAqVd+ATXn2e9XMypMlEz4v9KKGrHSR2M8ZfyYZ+romsur76Uq19ySPMTbNx/gOKdN0lTpbwA5157VOJxy+jnWwvHDMI9dLDHOz3wcX+be/T9QoR/eKkvCIgq2tNffwAuSmGDkwyqd0tXH18twk57o4qbWCc/8ad/8v3PLwwsTnDzlnbumrnODz7678WrRqdTf7GvYnEmSoUCIRTGQvOUzCmJEVow4D0kWVfRwb0fgD1Pcti7Nf6fCdQuAzCZNGGHgppKgEce9u8uKMHs9rqtjbpEkDtvASCfyKcG9W6K3SL+1mqpYEaMswfUS22MiDy+nb/0r4Ja4tH855BU/TZkyKFKV/47AmeVJVQxNZ6vfRT4YHAM/sno8KctbkZtYCXQEwjCZ7B8aSYBIDpsmZkvRC042h4TrWH+rZDYAEUChnM5vH9i49qGiWTlAlCNHuXXeLpZd08pOzcAthI8l68//YnAYj+hc9F8/56Jlx1vbJ2OuGEQP9ndJxwmRw59tbaluSv6elq661CszrGFTQbUPScW2p/6JBTqRQocigfB51nvMLY+zufKeIoCSGY3anycmTGBfEWCCn8B07dowybyrHD54zq468zcj8EfauTw5bLEe37sb4mDMzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZYQjM2WGI1NUw0Yk5aZGplT25IdXczckhHRTVPcExGcTM3OFF3MTh0cTFm?=
 =?utf-8?B?MTNzTFN3SDJLcmVPTUUrdUFzRFN3T1FsYUowMHBxWUp5VGNQenkvWCt1RTdW?=
 =?utf-8?B?ZEt4TVdIdVcxbDF6aDZJWmtDVkYvM0J2eVVISlJDcVJBUnBEaUcxTXhwRnlE?=
 =?utf-8?B?MVJ6Njh2RE5LdHYrVHZMR0pTWkRMZVI1dTFCSE96aS9YODBKaEw5N0s5SnVu?=
 =?utf-8?B?SXBNR3UySXV2Y1I0VDR2cUJocFFBQkxnSTZuTjVPbFg4cll0N0xpdEk4RGpV?=
 =?utf-8?B?ZGNPNTBMZk9sVk5KM0hDdk5KejJrbEQ0bVBWL1AzMUVRSE00YWhsTkQ3N1Fi?=
 =?utf-8?B?Ny93cXFUa0NMamJOTjd4MktENkMwb2VUVFAvMiszREt1VFl5dmZmYzcveFJR?=
 =?utf-8?B?bHQ3VGdoTmpUaUtFTHVMazFjM29UZ1FKYW1qdmsranY0SGp1emZRSFFvM01V?=
 =?utf-8?B?b2pzdll3YTlSdkxiUTl5UElPMTU5M2NLU1k4Rm1HVGoxdXpwY3ZmL3N4TTZ6?=
 =?utf-8?B?N2VSQnN4L3lUM0laS0F6UVU3MlczS0lNdkxoczQ2Vk1zM2NzQ2gxWGNtdkpj?=
 =?utf-8?B?MXgwdDRONVM3WVdSOGxJVzdlWHR2OEpZakUxYVhCa3NheUd5VTBST2NZNyto?=
 =?utf-8?B?eUovdkgzb3J5ZGlIYmM5cFRRUURSNFZUUU01cGd5aUZXNVBhZHZlVXFYMTVR?=
 =?utf-8?B?WDBMTDhCMHV6VHUxUXdLdnlEOTV3SHBHVU4xenpvNjZoYVBnNkV1cnRLVldu?=
 =?utf-8?B?bkI0TElCdUZ1RGRObWxVVHdZZE8vaDl2UzdNWUd5cVFQTlJldzc5eHJWckhn?=
 =?utf-8?B?bndDWHVISE9kUUJBVEVSMXdtVncxUHY3LzA1cGtEa1JXUk5kL2RhcDQ2Z2Fm?=
 =?utf-8?B?Q2FtSmZhaUY4RXNyWm5teW5mMTBIVEZ0bTJIQkl0c2tSSm1IUmdCZklwb21C?=
 =?utf-8?B?RnhTUnE5WHFEVXdhTmZZSks4Syt3Q1g2aWwxVXlHMkMySVN3TmI2d3pRNkRa?=
 =?utf-8?B?RkFYK3FhclNXVzJacDdJWWEzU1hXL1d6MkdPcnBPUE1HRGdtREJzR0dBOW1n?=
 =?utf-8?B?QTIwU0w1OUV5U2NJYjRqZXJDS3QrNGRLZzdnbkwyeEkxZHBEUkZHSkpwT2Rt?=
 =?utf-8?B?bXJWalV5aVNGL28yZDVCY2cwbDZlL2oybTF2V0lkSVI4NjBOWW53SldVYTBZ?=
 =?utf-8?B?WVNoamxiL1BvZmdoRlA0dWFJaTI5YkRqTlRWa01XOEFuZ2RhaS8zbjFqbjQv?=
 =?utf-8?B?Z1ZUTjhSNUlkRGtEb0FCTnlodTRBc0g4NXdkeGRQQmxHWFlZOEFOYUFIS3Qy?=
 =?utf-8?B?Q2VmSjFRMVl5bCtDQ05WdTZpV21wdHNMS1ExRE16Wkh1bmRDUmhwNEZRdTRC?=
 =?utf-8?B?UWlSNlBxVDU2c0ViZ2ZiTVZVWVdzODFwbkE2YisvbnpIMDdzcVhndm9JN3B4?=
 =?utf-8?B?Q1VqQ0pkNFNTOG9EK1FtTWxHUFpjRTFTUmRZWUJRTEdiNlhESFlnbWptd3Fp?=
 =?utf-8?B?RG1kUnR1NXJnZnR5QWhUaVpzdm1FVlNoY0NQUkdnc3FBQXBKOWdTNStVUWVx?=
 =?utf-8?B?RUlXLzVNQnBEeTdmT0I5TndOL01KQ0xpVEFON2s2SldYY2tKYXI0VjM3THFz?=
 =?utf-8?B?anV1VmV3emR3MmtYN1A4b3pkeUk4VVZyZUpodkl0d3VJRGZldVAyMGxGRXBp?=
 =?utf-8?B?NUIyclk2c3lZUUtPT3J3SlRGMWI0dkJmeXhmL0p5MkJXNG82UmR1VTd4NkMv?=
 =?utf-8?B?bXc1TGs5N3UvK3lremx0WWIyVmMzMFBZZ2hGRHFvQnRyTGVvTWFUenMyZW5C?=
 =?utf-8?B?NmkrVmZoUVJ1OUJpY3d6WFBMVHJIZ1F5dHpDY01RdVFzbnVHQ2FHK3NMMTNO?=
 =?utf-8?B?R3QwVmpWMm9OdW9yL3dBbEZ4NGRMd3VHZXdqSS9XeE9wS1JJdHplYUZQUnlT?=
 =?utf-8?B?S2ZlOGxIKzdxZUJoZ0tVWXVPK3FZZVd2MnIzbzNZcDZ0VzRiRW1aaElFN3k4?=
 =?utf-8?B?TmxYZkdvL202eUJTcXVSdGs2c1F5WkhwRm5BVENQRDBhMEZWRktzNG9Vb28v?=
 =?utf-8?B?YjgrMHQ5Z1JPUjFyTmh1UnpFWW9NMWxoVnd4c1daMnpFMndrTUF3Y0lKLzhi?=
 =?utf-8?B?TXJmUFMvZW9OVzRCbGVkMllEcVl2dC9qb3lRRjZIZXNnSmhndXNtTVBnbWFi?=
 =?utf-8?B?ejhmQ0ZoeGFxOFJUeXNNeEJ6RE9RM1pzaXlGeW51USsxWGsrWk5hVGdWQVFq?=
 =?utf-8?B?ajh0a3FuYSt5azlLNW1qS2xDSG5KdS9QTVNRTGNJZkkvVTIyaUZXb0xGbitj?=
 =?utf-8?B?NThGYVRvUE9wNFl2UkFGWTFXSS9JQ3dEMFF6ODQwcStjR0pWd3dpZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c78160-5570-4885-a952-08def98a6289
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:29:48.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2hLRCr99nKkG2L8nggP1RYFXHeodR/sstjtfIDt/oz7o4tKsAO+mct6DbUI4lAv0lr5m6sU6bb2eF5gRscDwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6375781D1

On 8/13/26 3:26 PM, Danilo Krummrich wrote:
> On Thu Aug 13, 2026 at 11:43 PM CEST, John Hubbard wrote:
>> On 8/13/26 2:31 PM, Danilo Krummrich wrote:
>>> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
...
>>> I was about to ask if we really need to bother with MSI and shouln't just go for
>>> MSI-X only.
>>
>> I have an expensive, recent motherboard in my test machine, and it seems to only
>> expose MSI for my Turing, Ampere and Blackwell GPUs, in the non-SRIOV configuration.
>> So I'm thinking that MSI-X only would not work.
> 
> Interesting, I just checked one of my Ada and one of my Ampere GPUs and neither
> reports MSI-X in the capabilities. Other devices show up with MSI-X though...
> 
> Are we sure it's not an endpoint limitation? I really thought it's not.

I haven't really dug into it, because it seems very clear that regardless
of the answer, we need to support both MSI and MSI-X in nova-core, right?

> 
>>> But then saw that the commit message mentions broken VFIO setups; can you expand
>>> on this a bit? Which setups is the commit message referring to?
>>
>> On Zhi Wang's Big Branch of Everything, he is able to run Windows guests in a
>> vGPU VM on top of nova-core. That system requires MSI-X. And I broke it with
>> an earlier internal version of this patchset.
>>
>> That information probably leaked into my commit message here. I can remove
>> it. Because I don't think it is based on anything else.
> 
> So I guess we can also drop the INTx fallback? AFAIK SR-IOV VFs won't work with
> INTx anyway.
> 
We could drop it. It's there mainly on General Principles, not because today's
GPUs use it.

thanks,
-- 
John Hubbard

