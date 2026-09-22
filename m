Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013138F254
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044106; cv=fail; b=LhFvbDsqfgxwV8WOyQBP4D/tqnXWOZbYHEBpkJM3RubebG++ZEmMIkzvxmjwJDkxeT/j+qYsyz2FX+jBPzUa1VQZHXxYJ1ZKRTZpIfFkYiwIYn1txnUW7FStya8YlI6Eu8Gx/qT6zEPVRZJqHIzvQrjm+uqQqs7ZjJG4EXOdUCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044106; c=relaxed/simple;
	bh=/gDxKqAgazHQn4PZ3sBQAVk4Q44/RwbdsDED0Ra8gzc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YiFU/o7aSF+Ot4IHigRtxfKzHyNlIfafNDkD6msAXAGbGFJvuzzx/3zpXuUEkKtFdGmfZ7NMGdLzED8z0eKmHpGdF2ENWf0dh4ajX+w1i4CYIikDRR9Re3IsO4tSepfstkwG+lRBIC/Zjv3kZgAkzS8jsBBH3PsKFdoOjSVImks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YAs5puYF; arc=fail smtp.client-ip=52.101.46.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAs5puYF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCkX/MMMvd/DmvvQ5XO8s/VRAM5rgia4Rdhtp6nQB6vjC+edMNdvhh8056emV0fmeKxoSnIfNyBOSB4NXb4lj5mSkiFntIzceIYeH01OBaLfD5n8y248yGt4ukeIbMaOllz53V3LDQRt4wlchiOuwMZsCk2AvSW+cky/DbTdtCZP48gKg71pBFQqDvLxcTpOYpMiPURDyDsoe7Qm5yDBbziAxDz6e5Tu0rgG1ioKoXZbc4HFlsV5f4N9OnCc5g91wI/2G4HgN3k+0T5TbVBusN2rrvgXp8HrJdlw9XrAEKr+wq7MYMLw7VMO10SsqdKakLqwXDdnVlraHjL83mH9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMnuaMSMzk/oW/050DuEpohLP67xSNgZYzMdUaRFw10=;
 b=XNrT0ZzgmaqvYJXCNErVX86u1j8iB8G5HVQNWp63Xou50tEsz8jvoflAM4IAgoxA5EuUYLUhgZ/8BbbhpHg+DN06+p8FOJD3ajmeP5NHHqIvuIh+WakZ/bWjoZZnUiplFhMAD2tNZHVyS5jiFNM1h6quJXoeC3hyOEDQJfAR9HfVq2PIjgooWMu11a+x5Fv5DDtwvw+AQ3wIsjPHzk5Hlgtip5grletLzHdpBEjqpe5pX06I5/xPLSSRB6ESW2mA8IWRvaSYaHCizkfnBgpdoFpC35nc1FZCnVK/WsEYYZKPaj5a6TIsl6QgMfEH+wAlUXLiSyNnH+TyfizlhBFECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMnuaMSMzk/oW/050DuEpohLP67xSNgZYzMdUaRFw10=;
 b=YAs5puYFkZBk4cT9w969BoYrVfPnLk+6vDuGKP3qoJha95dzQGneGMw7sm/P3KJ9QcnLHlJJL//sdniQkeTiMF2R6KKFl4mNupBh8JegVUCSNp5GeDQ8e7syWYTwvtPP0UMAVjpc9o/h1m6OCvgoHStxYbABQMKswUJHMiUcmzbo8heQdrWNBRJOfYrCaHwVnVd6A16pG+x0fpee3Jzunw98wb+53X9KluTR0MxqHyVsMm9F9affBPykl3OobpgBAE7V+bKX72QtUT4xw5P/oswi1N9XSfSZXBcgEl1kFRdi0ZPHnJdPODoLdRyjiqz2It38wpYzlqGCUu1o5+LCkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB7750.namprd12.prod.outlook.com (2603:10b6:208:431::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:28:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:28:15 +0000
Message-ID: <c07e7aae-fe20-4631-8ffd-dbce9e3a18a8@nvidia.com>
Date: Mon, 21 Sep 2026 19:28:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/33] gpu: nova-core: add GMC transport receive path
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
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-12-jhubbard@nvidia.com>
 <67be0443888888cd67a89aeaa4e6c0ddd452b5c3.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <67be0443888888cd67a89aeaa4e6c0ddd452b5c3.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af9469b-2a0e-4363-2ca1-08df185127c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tRjS59m/fRpoDznTGU3EVD7QrpqqpnxIMBRTg9hSVSHNGbWbFyj+Cfy88GQkU5KJxxGqLK3OeWAqM0p0EqqEKaJWbndCf5RA6oYuBFeJqakfX9ATAkVZOhf2fMWemI249QdocPWt3yctXYYmdgro4X/LoJsp0593AGfXATNDYuLArGxnF94+flJZpQP0Z7y7L8FRBKHB+Yr15XHU57ehvyuua74yLcjVfhK+m429sbbi2k5qLcCRO51t1Vwa3tZ3ulr9a9DFikR3ILY0hhg40x8qTOhnlLXVWmJqfLt1qA3tmLfC1hqSbLuXHT+0byZPx79OTqohyCDnfPOkdxvvNN80beBkSewWXNjttD/Z1g5lrzGJC32rKLsOSGkPDG6ZvGax+TWjxVhRmywNffUB82j/Y67oCJOtri2Ynn7EuTVKVV0+hDpDmrwlj7qOTgXYc5c0EGlko6Am2KVPLNmc7nZdIDR692pDZ0QBzZb9kY9uWJg4kmReUuue47hvf5uzIUnsPjWy1cRytNyw9j6JVHkwZRyM4H0DTTBxG9aUC06rV5rD1qacEdpgYFE7QCnypCoUoZS7bAH3DwIH8rBa4RQS9CKKi+ZaddOC9uUz7+GQvhpmJDbzkkqb4k1OyWqkr+d2EoazYwkXtIooIFMsFEIlYDtaIcmyBba0YPeTVtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmpVaWFiRkxpMGxhWFhQdHViZ2RkRUJhaDhaTzFrZUhrYW9CWW5PSHJkc2Q0?=
 =?utf-8?B?b1BjYVpPdDkrRWdocVByUGl1MUJEUmN5dWFsdlMvMlF0bGNtWmx5b25wL2lY?=
 =?utf-8?B?cGlpVk9KUlo3aC9hQ1dLMmplZlZQV1VNSGIzSjlFaU45RHdLOGFOKzQ0cGJK?=
 =?utf-8?B?alN2aGp3WWVVR3RRQzVQa2JvVUw4MFI5dFBmcmJ5UDMwTzlqWmNFZ01xQU5T?=
 =?utf-8?B?YTZ0Q3cva0VSazhFVVR3WHgxV2hJV29ZWDM5VTFzS0dBejNRYjl1WmxkSXk1?=
 =?utf-8?B?UzVFUG5aNHhtKzlvbmZBc3A3VDQ1ak5Kb0RWYitEUDVZY1NYaDZjVXZmR3Ry?=
 =?utf-8?B?YU9xbkNLRHp6L0tBT3kzWkZyaDZRZlRoOFBhQTNWUWZqTm9NNU9PT0phaitL?=
 =?utf-8?B?VGJ1NGxFRXpucGNHamdDMGNPRnphTHBPb01CRGVDSHVPVzRrQ044bWVkbWhl?=
 =?utf-8?B?ODNpL0NRWFlla1p5M3g2UHlUSGRxMHlvRFpRM3VoNlUrRE9mZ2Fkd3hsSUJL?=
 =?utf-8?B?SUNtM3ZkN2pXN2xKNDVrNi80V05PNEhid0VoTVArMTRYY3RSSDVZN3JxZmNi?=
 =?utf-8?B?bkgvZDUvL1NEbHUvTG9SWi96OXA3VGYvaEg4ZEtmc2RaTUx3a3ZxYU80aHNU?=
 =?utf-8?B?OFNxNElHVUt4QTdtT3BnajBMUmo0SzQ2RTNoM3dIWDdINnFEMG5CVkJrVW4r?=
 =?utf-8?B?THRsQnlTYkwrV0V5T2d4ekx5TXhUYm54eFg0Q0gyOE9ncGR2VkFmeUJVakhL?=
 =?utf-8?B?dUZHSDdnK29hVjBsbE5RRlVlekp1VENPS2w1RzFHS29EeTJnbHlRMkg0cnVD?=
 =?utf-8?B?RzBXS1dBYWN0YkdDZE83REpxeUp0RVpVTWJvNHRvdkJLa0FGQjRiTlJLbE1z?=
 =?utf-8?B?R2xRUkZySUJNekFWaEt1OEE3NEx3WjNNYmo5RnIyRVp5RzVLeDg4emgxTUVr?=
 =?utf-8?B?bnFWYjgvSDFXOW1nbHp0MlJKVGtjZXpUTlV1ZEkwcmdOQU5xS2FQdVJzSy9C?=
 =?utf-8?B?S2ppMnhubFpNNXNxdTU4UkFoLzNMSDlSYlVGRExLWlo3enN5SVB4cklNSVM1?=
 =?utf-8?B?Q2JjZU1ITlJTRXcrWXIycWZDTkE1dVBYTFF4MU1zYllhc3pEUjlmSXhrK1Rs?=
 =?utf-8?B?aDBiWER2U0RHSVdMdld6a28yazZLcTU0NVoyUmpRdXU2Z2kyNUptckRNelJY?=
 =?utf-8?B?a2czcXdzQ1NCYTFYa2hmaGFUMGVsc2IvZEE0VVUxQnBjenpvWTdvRWlRQVdO?=
 =?utf-8?B?VlZIbFVUQWRsaVJ2UXBjc3VtbmRNeXVxSEc1d3VkWVBuaEUzNXA4Q0x1SGpU?=
 =?utf-8?B?MVdrT09ZdHB1T1pqL3M5ZXNGcFIxalgwZ2NsZy9Hb2hyeUZkR3ZiMXhld3l1?=
 =?utf-8?B?dk9OZzNyN3d4T2w5NTAwQkdiNDdwMC9lNCtmek05N1J2NWtESmx5cEpLV3NR?=
 =?utf-8?B?UTcwalRydUxlU3U3cm5PMnZNd2ZNeCtwcHVZZ3BMWWtvWVlLSm1OMDRvZkxT?=
 =?utf-8?B?aEFnYlZseVozTWhWejVqTGd1QUxPTXpvMkZjQXZqTnoxMm5YN0xFZFBkS3Nm?=
 =?utf-8?B?d1M3ME5NM1lEY0VyU1hzbDR2emdyeFJ5R1NxS1hJM3Q3czgyQW8vTWZHTTR3?=
 =?utf-8?B?eFc5dmlGT2Z5bGR0VTNoS3lpQlpnUmdQM2xFeUN5Qk01UEs0Y0dpVk5lc1kv?=
 =?utf-8?B?Q0hyb0x2Q0lQeEo1L2xmV0piNTNTYllXWVFaMnBYSTRyTXlONE1BMG5EM3Ft?=
 =?utf-8?B?bEYrNDdoeG56V0U2Yy9MRnE4bXc3ZFkrdEhxYllGall1ZVVnNkxTcGlkaEht?=
 =?utf-8?B?NVJDdFJSNnhaODkveFlkMjJyVnFuY0lEbVVENnJDcmgyWjQwUnhCMTZIWmxr?=
 =?utf-8?B?UDhRM25nTU5JS3I4MzA2YnRTbW5JS1VjSlRKZngvaDBVbmFqUGk4YlN6UnhO?=
 =?utf-8?B?OXNGMXZEMGJrTXNlbENRT21KeUw4Nm12MWtMcURodzRCSGcxL1FkRGU5ZnJD?=
 =?utf-8?B?U1Rnd2NseFUyYitRWFVtS2lRTldQbFBPdDI5c1ZHV0RmS04zSjFGVXVzVVFF?=
 =?utf-8?B?UXcvdjJNbFJLY0ZWYW1wYVNtNG5YVEhnSWg5STZUOVIwczdNdXdaMGxNNm0y?=
 =?utf-8?B?RGl2S0E5UURHQW56Sld6V3RybWhQSUtyN2JSNjFEcDJ5L1pwOFZpNzdsbkZD?=
 =?utf-8?B?KzI4RmxESUFQQmplSFhIRzlRbVdFTHgvSUEwcWtEb3ltbzBvdlcxNExmRzZ1?=
 =?utf-8?B?SzY4K2ZZRkhaRHJhbjJOdTRqb25MM2ptVHRrMDlONEd5ZlFoalpDQ3FBTEdj?=
 =?utf-8?B?M1Q3Si9Ddzh6NGJ3T0N2OEtXaU1rSXo5WFpnN09aWEJqbU1lQVRRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af9469b-2a0e-4363-2ca1-08df185127c8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:28:15.0481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqmbL/IA7PdRjtlzg1n9w16U55suH+gRyp5WwRn8aAUsvbfZ2sg9mQumfdNfA6ti3v4GhRNqXyR/hKNlwbQf5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7750

On 9/18/26 2:57 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>>
>> +/// The check of [`QueueElementHeader::validate`] that a queue element header fails.
>> +#[derive(Debug, Clone, Copy)]
>> +pub(crate) enum QueueElementHeaderError {
>> +    /// The first word is not `"MCTP"`.
>> +    BadMagic,
>> +    /// The MCTP header carries a version other than the one that this driver uses.
>> +    BadMctpVersion,
>> +    /// The NVDM header names a vendor other than NVIDIA, or a message type other than
>> +    /// vendor-defined.
>> +    BadNvdmVendor,
>> +    /// The element length is shorter than the queue element header and the message together,
>> or
>> +    /// above the maximum element size.
>> +    BadLength,
>>  }
> 
> Can you add a comment somewhere explaining why we're adding a new error type, instead of just
> using the standard error codes?

Yes. v4 adds a sentence to the enum's doc comment: the receive path
logs the variant when it poisons the queue, so that the log names the
check that failed. An errno carries one code and cannot.

Although now that the IRQ series removes queue poisoning, I need to
reconsider this, since I expect IRQ to get merged before this series.

> 
>> -    /// Validates this header against the expected NVIDIA NVDM format and type.
>> -    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
>> +    pub(crate) fn has_nvidia_vendor(self) -> bool {
>>          u8::from(self.msg_type()) == MSG_TYPE_VENDOR_PCI
>>              && u16::from(self.vendor_id()) == Vendor::NVIDIA.as_raw()
>> +    }
> 
> When would we ever receive a non-Nvidia message?  Normally this check is done if we're receiving
> messages from an external source.

No, never, at least, not from a working GSP-RM.

It is basically checking for message corruption.

The FSP receive path makes the same check, and so does Open RM's
GspMsgQueueReceiveStatus() in 615.71.09.

v4 keeps it and adds the missing doc comment on has_nvidia_vendor().


thanks,
-- 
John Hubbard

