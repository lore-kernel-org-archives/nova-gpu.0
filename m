Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C7351C1C
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042717; cv=fail; b=o9y7PRk6SVFG4zn5hbbMPAL88VQpMYNFEBOR2r0S0VGel6ThDTcQ77ZithiWmVKwQAF/fBD70af8xNc8S6FJ9nhJQ+3q2YfChqhoIpm5sjKffpOIJsI4uiQBWOoaAe439IH0oSr+WNRevS6LMRNZf318K+85ZCyn/UCv6aoIzQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042717; c=relaxed/simple;
	bh=kek0g9hr6jIK/qRm45CJYL+HVoTWtwBkiWhuYLi2jDo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aji6qevw2ra4YtQE2aDGGBMSJB328xYWqGpB8UzDnKVy1PTYPRQVTyp2dCTURYJHX9q11ciHUrBYisFW+aPuT4Rb0AyaW3/4grH9YswREB3qdVvPm+EnK2XDzepCKNpSS+lLfjRwCtRiLgP1AELlA2sG92eXS49uSOzKyOyk+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M9VQ893Z; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M9VQ893Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbQZRYzfFcNiZOldpqPFH4IJlg/LbWX8lYMnhKZh8SnMsbzTRejkNvquE7BqbrF3zHu1YQdir9bRVqw5o88Ss8MUui+N4WzItY05+JkZCmRxIW4lGzxskSp8vcAdybPaRbfvi2yWCLGY1MhDdurvydaq4RV/UkbbmDYX55AI0AZNn48LPVnvXjlMA1Dna2rZ7lM7Dn60ErqjNYOo1NRsZr9TStT2MnSf3Mq7NFRrdrGx7JVLHckFlbuMypEShvzW05BT00eVzD6U301x1lIjE0wOHJZxPiht7LNcXMPdCmqCINjMW8Su53//XmZOTmfVQYQhHlqCjwvR9uvdkqfR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sf/nI3ItqwE6hn6O5LNsg+8G6J3sIe2bL0knXpsf/as=;
 b=V7N59RWa6RUSmgGNCIkxPhic/dN4KC7ldjB83XV7PV9BZ8zY3pAHtuRggi45APRJOuQ7cnsstQsAurR0xzmAah/RZ8N9uDtCzJRsxvqLBOy5r2uKNRnuTEPYFDZLdz7ti4N944oLl2DWrezjnAEJ11JDe1+cMLtreffxmjHfB4jVpkKBY1r3tsc6FowvhnP/3OeIXO5XzY1Oc5i+KKZvM3zRWKEQJav8gLUug1ccssngsKcTIFIORO4vuYqDLnYpBYi5XQzV2RATZm/eaUqEmzYqoZbMg+cvf+Q2D3DHcj2KcGAdK7Oe5LhDhzpebBYwac3wXkdVf7L6ZCNSNuiNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf/nI3ItqwE6hn6O5LNsg+8G6J3sIe2bL0knXpsf/as=;
 b=M9VQ893Z5Xmhj6sW9NwRmKZ0USI4Kzxel4Dmv/xTpLSBe/ZsK3XtB+4/SMYPTpGTYv2gugCHUJt5ojDELqfPDk1qK22sgL6LwOh1DgIVulT1lqXwEIVihSKtiJZJPDc4wMSA4kClkzs/HGJzrP2vyK37gc2dp0qK0JVUGe547Ae2AsUv41y4CvWbKV09unvp+JLzTtUrCYkaMbn59hc+nWNcREpxqL9jir08tUR96Y4X/XPhArZdi2jJzYCX+XqqUewtJbO5F8FBEzP3h8bcyzKbMuc+Py4eMsbm2S2v4vwvJT1r1/SSK1C6BC56dOjBogaLfMgnPOSFpPhl0STrfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:05:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:05:08 +0000
Message-ID: <6cf683ee-d7ba-4f8d-90e8-e85d4f195d55@nvidia.com>
Date: Mon, 21 Sep 2026 19:05:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] gpu: nova-core: add the r000 load-and-execute
 bootloader handler
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
 <20260918010719.1176945-18-jhubbard@nvidia.com>
 <6086c0a0e05afdcf1d81dc822e4ad0de54e75c70.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6086c0a0e05afdcf1d81dc822e4ad0de54e75c70.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 798aea57-af82-4b28-45a2-08df184ded4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+dgMCpuUc1l7rIDVc0/oy25xNw+xmZdZrOi5GQv/5hW+R/Lava/gVBoz2R76F8mVlspTYACXY0EM6VN+3CPLDiJXQWwWBE8Bu77WT0o6QPfLjq5CaV35WYpZxOv2I3R5U4fTR29nmU9c+kAo1CBpJLpeaZB5yWizG4rmCqx+8AbpDFBBIKHEusLSwUuDyC6+TtNtGicFs0HZq6AyD3VI0DqFum6equkSQQpnV/AjhrQ30aYOsZ9QHN8kWzJetuCvQdlV8XatYnf4a4ooutvN97a8hHfJS6q+F4E+m/6iXL+N1Q3/k6dcQflDZZF7vuBgiSak+D3+LDQgFWfpdgno9AXf2MdQVwQ09pETccHTa+4LA2CBmDGCYzsozMNs8zgNks5/0fGx4RIDtfaFLSGLUfpueUIIJoFVYDEUTJu+2AL+L7qfsENpCi/helwgO3k4r6ReFNq2LNJEIHZLUGLVubBOOEP9gxyuitcOuV0u3rVE4ghEiDFnLbvXPqLJILgbDmghii0TgdFkSBXBPkJKlIWZlxQQzMT+mp9M9ltqckMoJh7ewDa3VEh5l5DFPpLb1vzir8iNlv7sGgZ1px6gK8lvC1D9Z2MkIeISBmsuwZj+m/YnxGp7IfNZrdZ7vxWZUmWMm6S2hLNHeic7N0mtAL2NdEMhx498KdItZwj2E1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXYrTUlGL3hweVZqWnZlY3YxOHlLSWVYdEhZZkQwU1pHZ3pVL01kTElrVEhN?=
 =?utf-8?B?ZUdPZDd5RnlBWWpTSVR0WEFUYThsdlpIalRnaU5vam40b0IxT1J2RGtVUmZY?=
 =?utf-8?B?VHYxZ1JVMlFqL1d3aTBjdHdhNTA2K24zbVltenh0cnFtbmNhZFVYOEhELzhk?=
 =?utf-8?B?K2dsYUFpWU5MQmVpY0dFb3hSWFdNaGE4RkVwSUxZaTZiYWF6dnJmdFcxaHdl?=
 =?utf-8?B?VGZKdzJJRTlNNFNwSjVpZ2pZSXVoOE5OQmQxaGJ1RjNKY1ZQQytCTnB6SGwx?=
 =?utf-8?B?Nk9PMGtyNm9TengxRUFpY1dXaEVGNXdqK0tIeTd0WDF6ejdwZUVhclFDeGFT?=
 =?utf-8?B?emYyM3F2QjRmRlRraXo0dW5lQXdUR0xkU1RYbGJZUXNXZjQvTS9udWRTWU5O?=
 =?utf-8?B?THdmY2ZFSUg2UUtnWGdrNEdXNkVRVjZvc2tPbU9FL3dmZGVyeTFpbEplM2Vv?=
 =?utf-8?B?SkNHTjBGTjFxUHJUZVNpM3V6bHY5bDNTMndUREJQajQ1Vm5HQUF1NFFTT3pl?=
 =?utf-8?B?em84c2REWS9ZejVBNE1TNTVWdkx6eitSL1RYamZ5RUZDWDd6bzlMU1BGaGI5?=
 =?utf-8?B?aTdmUzh1S0xkMmpPRWtkRXQ2dStndWlydGlsOHowU215aVhLQW0wZE9TZW5D?=
 =?utf-8?B?cCtrZyt6cjV0R1NncFNJVFRqZkR4eGVZMXp5cjR1MDYwa2thZ3pFajljcHF1?=
 =?utf-8?B?czdqZUdJSTBqbEdDU3FLaDJvblhhcng1dWxuVHZSQXkrNGxiMlk4QldHZkVp?=
 =?utf-8?B?d2xuQXlDcjc4RmxJckdPNTllcXB4QUVHL1Zhamg3dmZhL3VGNEIwMk5DOFpu?=
 =?utf-8?B?OExNd00rSHI4c1l1NVBLUGt5cklhd2hUdkxWblp5cnlPeGFteHdSaGxsUFZp?=
 =?utf-8?B?Y0dUc0EyUzNMZGF2MDZJZTIzMlRlSFVKZCs2QW1QMjZBVnIzSVZaUnVOemtJ?=
 =?utf-8?B?SjZJSFo5RHd0ZGlIRXZvbjczZW5xM1BiWWVFaDZuM3FMREhoNTNDQW0zTnFO?=
 =?utf-8?B?YU83aE90ZkpiMEVPV3hjSmM0cXh3L2xIY05DRzE0QytpV1dzZDJOVEtMK1ZI?=
 =?utf-8?B?OWpzd0ZSZXlQK3JXZVphVFlMMFhiYy9pT0RoRTNZUm5CWWhhazU4Z0dGVU43?=
 =?utf-8?B?VHM1bjBzRTdOQ2JpTnZRNWJndGZpN1NGNSsvUHNuTjZqaWc0dVdGeWhiaUFK?=
 =?utf-8?B?Zk0wWVhlanRSN2RyZ0hXemNpbk8xY2gwOFpXOStvakxaQWN2OXZyVVgybVpp?=
 =?utf-8?B?Tld5UHl6c05jeW9lMWYxYmZYL1RORGFLY2hWN0ZaaWgvWHJTUXRBS0VpSy9B?=
 =?utf-8?B?d2RCdFBTWkVXS1k5OEJSdDN5Yk5mbFM2MXFJRXMyY3lwV04vVW5sb1VXUnlE?=
 =?utf-8?B?R2x5QloyZjVwNkdEU0o1NVBpSjYrQVJGME04UmtmbVZXdFMrb3RUUnB1SFhV?=
 =?utf-8?B?WFlMUVBDKzFTRnJzNGVka1BLTW41d1c3a0xQNVRJZEtuRG0wVDVha2p4Nm5O?=
 =?utf-8?B?aHV0WVNxTHVkM2c0ZjczMStTRHRQSU82NHFYcTRHd080MjA1b0twazNWMG40?=
 =?utf-8?B?TWR2MzhaUU9LKzByZS9ZZURQUUF1QVovM0wxZFNKWXUwREtNOExoK21PUCtp?=
 =?utf-8?B?WDBWRjRQT01ZYysvUTd4MFlKSmh2TEcwcCtqZW5FSUt6UDZmenFHQW9Pa05W?=
 =?utf-8?B?RlUra1Y2S04zVU9iOFNXR1o3TVlPL2dEM1lPUTZLT3pyYkZUU1BPSjFKN29C?=
 =?utf-8?B?NTBhVldCVWQ3MDdkUFpPeEVoOERCdnJwbkRVUVJoUUNaazZXOWE5SmhnN1dV?=
 =?utf-8?B?K0l4OWRiYzNYZlJ6ckg4cnVWNzVRVTNMNnJqTEIzaC9VVzJEU3VyMTE4ekcr?=
 =?utf-8?B?WjNjdmNzckNhNURHcURHQ1Q1Q20wVWtKRWVQZGt1dExnVWdCVjg1SzB2VHpD?=
 =?utf-8?B?OXQ0aVpHSjVnTDhNTlFCUDRsbytieTFKelpob3RpWStURzVySzlNbWNpMS9p?=
 =?utf-8?B?c1RNLzhSaDZ1S01oRUlJTisrYjgzUU9sd0JBRldsMk5Ic0I0dUVON044U0tL?=
 =?utf-8?B?dDF6aEFPWjNwZTRZQVJ5aEZhTUFHaGlxSEUyQ0pSLy9TUXErYmd2NTRNaXFt?=
 =?utf-8?B?SDcxSE9zYkNXSzFrS1YwdGlTdUdNWmcxNlZmMzhKeTRZeEhtR3VwWlgwM0Zi?=
 =?utf-8?B?bHlWcHVrOXkwRkhFRElad2NDbVpWZDZQcEh6RWRkS1R4a0RoeitFK3BvSWVa?=
 =?utf-8?B?QjVxMm0xUCtCQjNUYUQzdEN0WG9GbFZxL1ZvNnhvMDNFcFlsbVFEeE1aZEtR?=
 =?utf-8?B?ZkhrV2puUGdrUHprcjZJeHhEQjEyeVBseXhmbHE5dkVnSGdsTzVjZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798aea57-af82-4b28-45a2-08df184ded4d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:05:08.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNc6IsFhsv55aXNlT6WxuvC2sI7HBN5y73dPB8lOGs+Zr2o7ZVqTDI0nBGp4fch7/BTWfoJW2U7xnWW0JkMHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424

On 9/17/26 8:32 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:07 -0700, John Hubbard wrote:
>> @@ -133,6 +141,75 @@ fn core_resume(&self) -> Result {
>>          Ok(())
>>      }
>>  
>> +    /// Runs the generic bootloader on the GSP falcon, as a
>> `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER`
>> +    /// event requests, and then restarts GSP-RM.
>> +    ///
>> +    /// The descriptor that the event carries names the image that the bootloader loads.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `EINVAL` if this chipset boots without the generic bootloader, if the payload is
>> shorter
>> +    ///   than the parameter block, if the descriptor is not the size that this driver
>> defines for
>> +    ///   it, or if the event names a context DMA slot or an aperture that does not exist.
>> +    /// - `ETIMEDOUT` if the RISC-V core does not suspend within two seconds, or the GSP
>> falcon does
>> +    ///   not halt within two seconds of starting the image.
>> +    ///
>> +    /// Errors from [`Self::core_resume`] are propagated as-is.
>> +    #[expect(dead_code)]
>> +    fn handle_load_exec_bootloader(&self, payload_0: &[u8], payload_1: &[u8]) -> Result {
>> +        let Self {
>> +            gsp_falcon, dev, ..
>> +        } = *self;
> 
> Why do you create local variables of two member of LoadExecContext?  By doing this:
> 
>         let Self {
>             gsp_falcon, dev, ..
>         } = *self;
> 
> you force every member of LoadExecContext to implement Copy, even the ones you are not copying
> here.
> 

Oh, that's not true! The ".." skips the other items, so there is no such
copying going on. Only the two named items are copied.

However, this is also just a little too unusual (Nova doesn't do this
little trick anywhere else), so I'm taking your advice and just Not
Doing It anymore, good call. :)


>> +        if params.dmem_desc_size != BootloaderDmemDescV2::SIZE {
>> +            dev_err!(
>> +                dev,
>> +                "Load-exec descriptor is {} bytes, expected {}\n",
>> +                params.dmem_desc_size,
>> +                BootloaderDmemDescV2::SIZE
>> +            );
> 
> So here, why not just do self.dev?

Yes, I'll go back to doing that.

thanks,
-- 
John Hubbard

