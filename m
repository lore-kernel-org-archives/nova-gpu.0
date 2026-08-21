Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45D2EF67A
	for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787279503; cv=fail; b=drBOkCZrl/vblzEiKSobAT4HBRO9ZOtYAPzDa5jiJmsqmXX6FgZSoAd9c0hs9EsReCvUuSO5y2jpEV31OwaSymLXBAcfb1V8IUtwEvU0MOW62HzGHxu0Vml/B1iG6WBuj55b/k0D3PmfSXOE8iSL1wQIfZzXTtfYuWc4Hj69OYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787279503; c=relaxed/simple;
	bh=5XBU3L7UYnQfaKxK1VAN5RagCzEenHabyRoJLb8yGUI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SOR5KgNC9qXqhm8JmRS6shwnXw0hSWyWZEO0LQMiRhZWEgG0aBLxVqij8z7Ho9owIM/LZoI2/SuvTdYk1Opr/3V7c5rxJfk0RZfMPpxMzsilT49CUsiD8m6fbcDQY1uqYQ4ZsWLfiWwme+pE3wUrZKSb9EOXM3uERidAYoMUSrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m92bFTOs; arc=fail smtp.client-ip=52.101.46.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m92bFTOs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olHwas7eZkbVxyiSxWEVtcSI2RVYPYBpwcnMKKqd5R84lheZ+xZZ0772YSJl4aAmGEFNpjPupKNDbp6UO0jMIJFs1x0Z+jwcu2mIY3LNWD23ge2s1CZLrePcJI9NVA9pBX1uFhpT61JRtjzg+xmlfnFsxxzHHXpvAWIRZbxJohrPY9wVvVeHqirKNT9lj6pN+BhP0owhUcjmMNPpJyIE1Q5agsAqtpYFmxtvlF3XIrIccusg7ZOND1v6zCwe2KQRX/MG+n8yEQWEbt9SL/rWAUELgf92LwEQ0VEu3ZaCrf2enTPXaMZvFAquBpKgxRjQiogE/HR+H7Xu9J7LPvceGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjHKiBhcg2tksSLprNg4IAbv7M6Ml8IEj7Fwy+Ta/0s=;
 b=hztK9d0a4miS5fAPfeRGgaEtcuvG+nL3FHpaDgReQR1Mavx0CqxyHeggum7RO+CbtDo4PbKpvbZg6lZ/rsTE2F3LyYh5PcCgeemo5L4CL6xSzTCDaH81/dre0E1aOKIDA1W/pZ4kYrh5OxjGyrljqdGCrbrix33TSNFkfAlFldqLZn7PLLh4Stjn77Nzmnqlrk1NKBdQOICFUGOHGf51nOZzWBuAyOVZCWq3qsAOYD+l915ZECn0de//edpiIkAfNyaNJd42exUKsSroOoDEjsBf/mbPm9jsYHTEQQz53RAPf6pniXdtFTltXqVcHb78cOWO6yDO0E8n980rlh7XoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjHKiBhcg2tksSLprNg4IAbv7M6Ml8IEj7Fwy+Ta/0s=;
 b=m92bFTOs7FnzBwn3Bix2qXrrbjNiz3XJXg5eTY1FyaOSaLWolpEi0XdCLrNMbrRFI9OKlZ/M3Oa5tYCuWCkf0EzPCjd8g4WwxW9YFWQwSoA6gRLeWdjKIFeh8h55iFV5YXYi123UU2ekPglb50d05/p7X+LRkGg7X3mRIQYaOL7sM2Iw9/7TWVC6Iu3gfMaEpr478f86BGQ3gGItD9ARIFXwZc/RHowDpP9yE5leVlxfnYhSWdOrYjhP/BihKJuy5HxY0CcJbCp/IfJTjur37JChsHL8LuV2SAH1+jq+mpf4GXcH9NsYEBZ3o+ZjRJsiJ1L4CeI1/u79dmdiSWXpJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 02:31:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 02:31:35 +0000
Message-ID: <256ff759-ac15-4058-a2ed-d54b8e8c098f@nvidia.com>
Date: Thu, 20 Aug 2026 19:31:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/27] gpu: nova-core: set MCTP transport header version
 to 1
To: Zhi Wang <zhiw@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
 <20260819035221.336390-4-jhubbard@nvidia.com>
 <20260820123819.20bc6289@inno-dell>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260820123819.20bc6289@inno-dell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 7accc14a-20c4-41bc-efec-08deff2c5226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mc0jI1WTejjbzw/lo12PC7EcKs6Wuq7x86cLmx/C9OPV0ADWrj7GnDKaKPGqxeYIzW/FKDi6VYvjN8Bn6sHRpZ4E8YFRMNZsFPjllb9cIeTxfpa9CX/IedH6eMjnMyAAoGOgRV52sTdPwUCLDdUaPLzF9CrUlU+PivbWeTsIicN6OkQ1ame2ESLpMODH8UvaUuk7sebdAKHPXl09L9j+IA8q/u5L/kYqQnU25AKUk7HTvdK2Z5w9jUPCJ4hB5sIHXwtjjYFt5vfH32vPxle0DhGaLihBhuFZ0t3ORwOSW347pfuSlmIb/c/41iTPXpukLYoSEIQ239sd6YjUr6eWOzQqRpNxDeigfquTpcLvx8/55VdQeeFKr/ORtLhGF2OS3UgK7G/sbRirLgOTB/nnLM6XRltNCoL22eCYkNnn2owZfsnvAqF9045ThRdm39fHOhsa/iEp515EsLwS6JPo03nh1ZukZpBxlwfryQxPWrFtQS7yxgNJxV3sQbs5rmzArovxj0a7WBIF4arzMj424XIhnnrPMg/vvtx/8RUvdO+GWPnOJmHpssHRKZs2AqIlspRH0YUJ/pThmHWIh51u8mSjd7yiek68iJ9pelk3dVew5or8X/Ac8TYe61LtpSI7TIfyy5AVpTQHWq0DeNg1czlBE2YQpAeLJxQ6FtZ3AKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxSVzhLOTNlT1RjQ0lNUkMwNzVkOWFwejVFTVlPSnV6T1NZWlNpamdHaDc2?=
 =?utf-8?B?aFNOdmJGeEJhUlZwRU9sQXIrdGlPb1FKWGZ5UnpzTFNFdlJwNklMbGNxeUdG?=
 =?utf-8?B?VnFBQmJsNkJYL05VcDJib0N3bXBUUkYxMzRPZVJOWEMzYVlYTlRRaFU4dkc5?=
 =?utf-8?B?dDVBUHlKNGZiV0ZLWENBV2hyU0hlc0k0ekRyUk1VV1d4Z2hENk8ySURSRDJw?=
 =?utf-8?B?V1hZZjM5WHp4dW9Wd1ZIZmQrcTZKK2hvVm12SnpYV0xoV2JKRjFpMGQ2Z1d4?=
 =?utf-8?B?V05TTko2VE50bkttamJNVHNRckZyOXJ4VlFYNTU0bVB5TDM3ckQ4Q2dkSkdT?=
 =?utf-8?B?c3VrT2RydVVDVTZ0aTRIdmhSK0ZzVnZNK1B6S3RtMnZUVE5XZ01wTVVyQkhh?=
 =?utf-8?B?VjFaN2R5Tm9SenRYL01HNzJRTzRtcWNGVVREM1lJOGlNV3grb0VhWG5mVFNk?=
 =?utf-8?B?UzFURGI1Q3pzY05hUHRKWjh0MmtoL2hxdm9wNDArYUl3N1NhREJNUEtrclE5?=
 =?utf-8?B?aTJZOFlXK25oVmFvTEdDc3ROdFBEVzBsLzZzclFIcmFKOFoxTVNvYmsrZXVJ?=
 =?utf-8?B?ZzV4WHZ3TzhYYWI0Ni9DR2hNT1MxOXJadW1XbXkxNmlMRXFQam5CSTZwRGwx?=
 =?utf-8?B?bHZrZE5YcnZnY1owaklyeXEvcnl6NlFRc1pQRHBFK09jMlQzb1lTRHprOGsx?=
 =?utf-8?B?Mkk1NFM5Y0xvYXF6ems1elo1SVdVWklaL2pXL3c3VkplSHoweUlrZVV2NnJT?=
 =?utf-8?B?eWpLNndadGhVS3Y5UkZhdTcwTE1Lb25XZGtLa1NUK3A2WktMRW5jRzV2U2k4?=
 =?utf-8?B?UGhPS3VjeHhtTGd2MjdsTXpNSS91Z09TOG1kK2RuN1p1V0ZPM0F5Z2JMMTVk?=
 =?utf-8?B?eW1EV2VaVmFGcWtKSGVFU1R0Z0gzL0tyWkx2cjBiaGVuWU5YYU40ZGttZ081?=
 =?utf-8?B?UUN4bWFQRUg1N3lBa2tiMnFvVFkvYnNibWl1WW9UU0RzbDBiNW9yRExPZnJQ?=
 =?utf-8?B?azAyMU1NeTRadVo2TTZKU3ZKOW1vYUJjVlBTU1VYdDc3UHp1MXNXM0lKQ0Qx?=
 =?utf-8?B?cm8xd1BNOSswcWVTdlNCY0ZUWnZGMzVtekEyYUYzeHdWY0FFV1dZa3Q2UWNt?=
 =?utf-8?B?azRDWjNpYzBsWkZpWHVGVkFtbk1VNStERGxlU3p1Z0UveHkyOUgyMFRYbzFt?=
 =?utf-8?B?V0d3TVE4QTVFMWlQL0cxbTlFNG1IK3RoTVRQb0pqZjY5OG5xWHpQaklFZDNT?=
 =?utf-8?B?NmI1aUkxNkhHOTNxS25QczYrbHN5UzVPQUZlVy9EZGJsZGE4UmNOQkVTaFJO?=
 =?utf-8?B?eGtrSldKbGJJaUE3Ylp1TmttdXBDQzEwSE5KVlo4a2hlZnZFOUlzdnFCalND?=
 =?utf-8?B?OG9uOTRUVjV0UnB5NzV3MmNFYlZGRVZWK1FBT052WFpjMG9rSXBteE5zMEFT?=
 =?utf-8?B?SlpSRDR4QXhqT1ZJSmdsVCs1Lzg2OXEwcTR4ZUtHa0VoeXBoWDYrU2Q1NVBn?=
 =?utf-8?B?UTFNeUtrTU9kTUhwSTRQTkdtUHdnY2RjcnZyc3RHZWxPWGdwN0lvM1VUdGVE?=
 =?utf-8?B?ZjFBazZVdi9jTW9YdGVoYnhZV004UTl5Vm1pMDRJeHlmMHJxYnRteUtFZ2d1?=
 =?utf-8?B?ZTFRUHoreEJXU3B0MXBNcUkxZyt1SXdiNlVTcjFld0lhRVY5R2FGa2JZdFJy?=
 =?utf-8?B?dU1IVG1kVks0Qkd4YkRpbndOeWp6SmRFcEpxdnhjZGFMbzVkL1ZFYkUyRWtL?=
 =?utf-8?B?UkFCVlNybUYycUdWUFVmQzhaaW94VWxNemZ0TnJBcEgrY3ViZzh3VmFUaXVX?=
 =?utf-8?B?Z2hIdHlvZHlaTkdmMG83VFFOVVMzVXdiSHVKaGN3UVZxcmVVSXRWZ1haQkhJ?=
 =?utf-8?B?K21NbFFrZjhMdTRnbDJDY1RWUW9NczJVL2xDVGt5d3hXTGowMDJLMEkrUTFk?=
 =?utf-8?B?TXN1d1J2WVUwWnV1dEJraEFGc2VkL2plVFJFd2tYbExtQjU3bEt2R3hmcFhO?=
 =?utf-8?B?SDhnMVVJOWtKOFZMZGIzY2xRdVl1ZlJhdkdLQWlKaFA0U2ZVV0pDVk5JK3NZ?=
 =?utf-8?B?ajFsbjZKN0NYZi9STXplRGZIcjJIdGhtWGxNbnJ2Wk53QXJZd2F5dlVvYXRj?=
 =?utf-8?B?bFB6KzYxWkY3b1VjSlRTWjJiRWhsUXdwUE04b2RjODl3eDlpT2ZyTXNTb2sr?=
 =?utf-8?B?SGlRODVsb0hNc1grSGZIaHhwMkMxT1oyZ3RBZkVXN2JPVVFjbDNtUFlhNGoy?=
 =?utf-8?B?MTFIVWJFM01PTlF0TU1tWWYrb20vYnh6ZWRZVGRITXl6ekNrbVUzRFJEOFpH?=
 =?utf-8?B?MEdGaVFmeDcxY0p5a3JLM2ZXMGhxS3VrYU5NemdlcnlhM1dWdGJOUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7accc14a-20c4-41bc-efec-08deff2c5226
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 02:31:35.7356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fErpNPoX5mOHGcCawZSh8/Ci+mHlcgBmos2wRhPXIeGj+90VFRDYC6T4ZVklqp+Ia/9TgErnGigv03Nd8KvbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539

On 8/20/26 2:38 AM, Zhi Wang wrote:
> On Tue, 18 Aug 2026 20:51:56 -0700
> John Hubbard <jhubbard@nvidia.com> wrote:
> 
> One nit: might be better to update the doc as well.

Yes. Agreed. I'll send individual replies to the patch feedback
as usual, but let me first mention that I've applied all of your 
and Timur's feedback, 100%, to a -v2 branch already.

It's passing tests cleanly, so as soon as I make a few more passes
through it I'll post that. Likely tomorrow.

thanks,
John Hubbard

> 
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> 
> diff --git a/Documentation/gpu/nova/core/fsp.rst
> b/Documentation/gpu/nova/core/fsp.rst index 52d618d22bb8..60c647181da0
> 100644 --- a/Documentation/gpu/nova/core/fsp.rst
> +++ b/Documentation/gpu/nova/core/fsp.rst
> @@ -106,6 +106,8 @@ All FSP messages share a common header format
> consisting of two 32-bit words:
>  - Bit 30: EOM (End of Message)
>  - Bits 29:28: Packet sequence number
>  - Bits 23:16: Source Endpoint ID
> +- Bits 15:8: Destination Endpoint ID
> +- Bits 3:0: MCTP header version (1)
>  
>  **NVDM header** (NVIDIA Vendor Defined Message):
>  
> 
> 
>> FSP requires MCTP transport header version 1. Nova-core leaves version
>> bits 3:0 at zero, so every CoT and PRC request carries an invalid
>> transport header.
>>
>> Define the version and destination endpoint ID fields. Set the version
>> to 1 for single-packet requests, and leave the unused destination
>> endpoint ID at zero.
>>
>> Assisted-by: Cursor:claude-opus-5
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/mctp.rs | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/mctp.rs
>> b/drivers/gpu/nova-core/mctp.rs index 90c642c91a72..03546213da28
>> 100644 --- a/drivers/gpu/nova-core/mctp.rs
>> +++ b/drivers/gpu/nova-core/mctp.rs
>> @@ -42,13 +42,23 @@ pub(crate) struct MctpHeader(u32) {
>>          29:28 seq;
>>          /// Source endpoint ID.
>>          23:16 seid;
>> +        /// Destination endpoint ID.
>> +        15:8 deid;
>> +        /// MCTP header version.
>> +        3:0 version;
>>      }
>>  }
>>  
>>  impl MctpHeader {
>> -    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
>> `SEQ=0`, `SEID=0`).
>> +    /// MCTP specification version 1.0.
>> +    const VERSION: u32 = 1;
>> +
>> +    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
>> `SEQ=0`, `SEID=0`, `VERSION=1`). pub(crate) fn single_packet() ->
>> Self {
>> -        Self::zeroed().with_som(true).with_eom(true)
>> +        Self::zeroed()
>> +            .with_const_version::<{ Self::VERSION }>()
>> +            .with_som(true)
>> +            .with_eom(true)
>>      }
>>  
>>      /// Returns whether this is a complete single-packet message
>> (`SOM=1` and `EOM=1`).
> 


