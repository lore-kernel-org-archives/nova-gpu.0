Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB720D4FF
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629018; cv=fail; b=pv1FgIB/AG7BRdedMBzymjTgUx450KOzfS7TCRZ5AG8sXdIZcqGLO9Ox+0gHnoK0H0hpGRBCoK6tFLALm4cKgRBg846ltGqzzQaLvV7djacsP55NEJGRidMKQw9B9zijihJHFM1OlYDFzTWcTUhNlzDGTak0OkJZkI9Pa0qjlV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629018; c=relaxed/simple;
	bh=TMxJ2EW1l2YGz3Al8XROmhq7XLBDAzuCvwxyUFcm03Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I7A877Hk3p0FC7F/sZIBl3cEvRo+BdCSXgil8mHWkEWLGMSxCPJBKxMkl2fD4z2OfgmaC2SAAsmT6Z/qBMT6mx6vd6hd7p268pxCzBQ3tNYqvY8Qp8YAe+LaHgGd1xWTjUk4szNptuffxb7EZJcEflNyziyNWjSGpKjlJFUVB1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TlQcobDD; arc=fail smtp.client-ip=52.101.48.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TlQcobDD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSj//V77w14Nx06YvjbDFUqbDYvBvfW6YtANcgflkG0WEkJn3S94D4vnrMX8nNmByKOuFrGU3IacnFZIYSEmaqCtmCqavckHQiqrazvaEMH30oNZO+1xrF9wmtZvvxnNdMCOg8+Y4I5DzsVeSTpGezhTrzR2j8RV5FU5KwWVY3zK9Nen0Kx3eltRTa4P4WhyG9ANbTiKK2i1gRpqNdToccjxU4OnX1q6HgXv9fitVE2EeRfjeBvV599LjTZUpppXGcNTWWNmj4TlbYLex4iQPMY2rhW5C1EHloR3Mm+9HWh5sK0xdRmOFWvwdIl3hrrjMSleU4QEl64bKHIFW7kJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytvUaqeXn9OSV4r4i1B8reDFzDr3eFEqCkFnYkgkvYs=;
 b=ZU1G7ONmjybcPHWWrPQByhrPpxx3d9A7b7FQRqPuFc9xTSUfyA1XXDrXd5kqkGSnEJ/u4EyI1iDpOz2Z2nOgPJyr1Kc6a6FRcKK8d2CV33QfaP6w9+ktLIF8H8dM6lWnM7OStsId1SmUbBylLHdVVk80KX8jlvf/DvkCbnMmsgmR2g8+QfCJ0hi3aRSA+k6WLgvuU9AA2D4/9iTvznTqhYnEyyxFI9LOJKCUjxowrB5541GObcYSuxr1RN2WuIr68DLX0PRaaSzaYq//G3SOySoDNmlLuxeXHWHbzYG/0J3zudZ5Eq0nANTwcUoGSqKrpH8A/wpHcpmO6ZGoV0tFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytvUaqeXn9OSV4r4i1B8reDFzDr3eFEqCkFnYkgkvYs=;
 b=TlQcobDDRe87J1FCcaLXExDqg7cCyA3dFzBVCCQtOnt7cJi7t2EnCvIEFYCIKlIYrfPjJp9dLzdcINu1AbLA4t6ieEQ04OY6i0zQ8IR229/WDBrg+LQBluP5nn4drCRak2CXnvxDMzvVrB9xu9soq9NUJ6gSbZbgYWWImvV1Um9pfLlMmKpgkDVYWF27rF7XAZ/Pqef3zTjDyT+wNx00uX/UR6gJcDGvkUuDK3AqIkpS9B+DoA+RH5XNfzfk8fKtY2HC2YCWuGQ48MJsgndKqKAu16jqRuEvhcWMlzbAntOwLR9SN0q9nTlvDkWdqLzakj9Rnq+2ZMxQulKByrQYEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 17:23:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 17:23:32 +0000
Message-ID: <f42de16a-8351-4f11-980f-975b891a1c7b@nvidia.com>
Date: Sat, 5 Sep 2026 10:23:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: gsp: fix a broken doc link on GspMessage
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260905023800.1293631-1-jhubbard@nvidia.com>
 <DL7GA6P85PED.6EMA7BRKKBIX@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL7GA6P85PED.6EMA7BRKKBIX@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dffe36b-3851-458a-df2f-08df0b72687f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZG1rFUlw9douwKmFfqxdHXLgJJM+MiT2HZycolik1+pUqzWio1k/9UnV84Fx/ZhMlWQvEgOS5M16sbTzBhhWcTRxuiJw6iBjzI2S+oxHOFFE2Z6Gd/dF32wL0YmtxxopdKMDdfLt/jloCpsl698PdIDAWe1aJN8KTfb/QbnIc8nN8zmQoPo5wLFWWp4L6i2Ib+wKEU6ILSblBRPXUvlDEIY8hquhQnuBA21WM2QraOq2WZ3g5MWuvNWnuiIbCHvj+bKTDrZIlAEpDsWCRt2bNz2H1/mBnqDGXTb2WdYLOnTqos3d8j+IEkv17ICAu6DoqEZ4koP4vMcVS3/eO8ZGoSrudylwz79KeSLsu6+6AEBRr6+XPtpX/P2gtN20jLNr1Qx++v/YLE0L6JxTpSOKiGXaMDnkB/+UWI0GUyCTnUVJQuPQ/eGuhyDpMb+q/e3YsPNnnJLuDSayO5MRl+FEviPsjcOpx0tq1NeNZ3jQWMoSZKTJT1wpljrN8fIwh2vN2Kzn+tmMVYmYrrx1CZepUzVhMH4daWEJBHYeMRmM6upIFI7IyN85x7cPZBsB+Dn3XvrXOioU/GNpGWQn8zE2m0BJhZCB3I3aqTC8BVpjpMH75FkWrJAE7VzWkDk0tHBUmP7BfwcTqHA0I97RDMVqxgB+FA6sZkqI9JxrS9pDrEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDZSL01maUFBbWZLbmxWQmlFcjRaR1daQVE4V3kyU1ZELzFjMUo0WGJhWGRz?=
 =?utf-8?B?RmxVTHpMaENsUzBIMTlrTzBTSlRZZnlhMzVGSCtKVXJMT2MvWHF0SkhMcGdB?=
 =?utf-8?B?S0p0NHVzc1Z5QkRVTXVGdmtvTHNSa1lGdER5Y0RQZ1U1eUdlWlQrRFIwQytJ?=
 =?utf-8?B?Z0FqbzRRL3FlNlBMTm4zM0VLNkJ5eklkNWxtZ29yTnFzN21mVTZoWGNMdDJ0?=
 =?utf-8?B?SlFjTjVyYmFiWTJxbjA2UldRQnZvdFpIU3dKK0RHRVFMeUlLVjE5UmlLVGcw?=
 =?utf-8?B?dXo2WStNa3ZFTjdwMXBRQW8yYmlIb2o5cHY1T0pIcmY1TE04SmNPSm5TL2h6?=
 =?utf-8?B?RE9GRTcyYzFCSEg4MzBTNU9XZUJVSXBHR3BtK3VQd0ZrTjJCbG5lczQ4Sjh5?=
 =?utf-8?B?TU90RG9LSis4dHgyTDBNOUZpM00zbFQ3NXlUNTZJT2NJY1U3T0JoL3lIKzZT?=
 =?utf-8?B?ejFVbXkvRCs3ckszNWNzUHJqcGttWE9aQUw1bDY5SzZGU1czK1lIQXd6ME03?=
 =?utf-8?B?MER6aTJJcXRIWTNZZjlFQlVNcWRFNHdLNDRTKzhpeWlvbCsvVlVtN25zS2c5?=
 =?utf-8?B?a1dMdCt1QlkvaGptSkc2N1d4S1VyZXphUitoVjZBNFYvZld3SjAybmpXNGgx?=
 =?utf-8?B?OTZsa083SWhnSEZWcjdCS1JXWnB1NVlRRGhrWkZNVUY3bFhKUUE3UjYyMWhh?=
 =?utf-8?B?TGdqQUZ0cDlqbS9va1dGaGo4M3N0S2VjMC9aS0kvYU9wczRVZEFISHBDSzRH?=
 =?utf-8?B?Nzc5dTdZclpMMnRFdUE4SzltTDAwZEdCVU1tLzNsTFgyTTRrL0lXZGhBZ2g0?=
 =?utf-8?B?eFYzZWdhcEJkeFg3MEV1Uy82bnErM0V2eFFCbENxeWlsZHh5TWUwckcyR25q?=
 =?utf-8?B?dHcvMlpRQ0QxdzNHclU4eExJbnc4TldQT1hjQ0pkeUlnRzcxa0Irc3l5RDhS?=
 =?utf-8?B?c2k5Q1gybDNGNHcwQ3NiVGdBY1ZTY0orRGRseGR0ODJmNktEWTB2aGo2OENY?=
 =?utf-8?B?aVVqdUdKMFR5U3BHYWhLbFlXbTBHTHUyOTZCTG9peHVadlBMeEdJeW03ekNr?=
 =?utf-8?B?dzNmZWJOcjMycXRqVVdYdjhmSTdIdUU1RkFoVjlUaE9idnZHdzZib3FXSnBZ?=
 =?utf-8?B?SllVM3BTQ1BMOXVYZ0E2TzEyZTdIWENWM3czazVKM0pNVWdpWGJIY1lXT1BK?=
 =?utf-8?B?VUVMTEZDUE4yN1RCY2NTdW80WGVGUUllQlpEakV2bVRKVGhYM1Z4Rnp4TDlv?=
 =?utf-8?B?OUg3OWhmWHBNam9rK01aVnV0NGVkcE52dnByd0tLV0VvS1dGSWt3RmVISnFS?=
 =?utf-8?B?dXozMVREZmM3VXdRTUtlbWVmWHNLYmFBRWJBQUlsQ1dOTXQrNmxwTE1FaE9z?=
 =?utf-8?B?OEQweElkQU5TREMvV0ZMa0dkSUJjNTNtV0JGMHpvRENZRXh4KzY1VzF2NW9D?=
 =?utf-8?B?YjExM2o0OWlNdzNnSHVHUEM5OVdZaUwwdmVGRldHcnA2YkV6VklNTHl0NFV6?=
 =?utf-8?B?a2RpVnJxRTJBVGo1bi9WU3kxN0theDR1ODZZUnBWZ1BDenJmZTZTM29tOVJz?=
 =?utf-8?B?ZXNIQlNJVlNFRDZrWlp1R3c0cE5HUWJsOVdoK3Y3MTcyK2dCV3ppcFo3RTUx?=
 =?utf-8?B?MGVRMTZkbnNVbW81Mjl4VXg1ZVN1bDJ2MHZJVkNUdjR2MUg2YitwRVJJNlZp?=
 =?utf-8?B?dE5RQ2RORUpQbW5NYTRpeGZiRDhTbmFUWHlrR1pELzMxTnVET0NuK3UwWmlW?=
 =?utf-8?B?bVpNOHJNZWtWamV4b2ZCelFEaHBxM0JTeERsSGduaytGSVNUVXB0VHVyMlls?=
 =?utf-8?B?NGNrdTR1aERHTzAwS3hRTk1UNnJMVmNlaldlWkpxQU9aNzJ0WGRWTVp4Tjl5?=
 =?utf-8?B?NGhuaTdPUmE1UFBnM1dzdWFPTFEyZyswcksxZ2hFY2Z0TThHSFIxWTF5YWJ6?=
 =?utf-8?B?NkFCRWdHa2JCcmpQQ1pNY3hGRklUWlJKenIrQ2pQSUp1cDdBbWRnRzRRa3Nl?=
 =?utf-8?B?Q2JFSkc5VEhlanQ2Tzd0WjA2OVk1QXVCeE9IVFk3Uk1MVmRzQlp2d3FHbVdI?=
 =?utf-8?B?dnBiR214dUJwdTBZdTVpN3VlNEV3b0NMY2RzVWJodDJNYXlqRjJjbmpSQmto?=
 =?utf-8?B?OGFhVXBoWEkvN0drRGVSalhKOXBod1JNRWw5aVZBN05OM2I1TUNRUGR4UlV3?=
 =?utf-8?B?RGp4cm1hYkd3SE4rMFNSdStER2I1cW4zUFR4MS9qN1RGNHY3Z1cwTWF2b0t3?=
 =?utf-8?B?RTQwNXRoNE9PZkZNaVRxQ3ZhREtZazkrS2lDOTkycVhTbHlLODZSLzJ6OVpV?=
 =?utf-8?B?VUVtNk9NK2oyOUdUWVRIcno5Y1pYR1lSOXZHTXlLY2xuL2NJcEFRSmRJUmRY?=
 =?utf-8?Q?jZCCK+zfWS1XMyHE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dffe36b-3851-458a-df2f-08df0b72687f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 17:23:31.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHjDZS4gE0GmNrGbjXpX4H5CjfrLrbg9o0xpr3mi8HZL/BzgagfK7pDTKMqWXyToGDYd38RCQwaZpU9CGJmJkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On 9/5/26 7:25 AM, Gary Guo wrote:
> On Sat Sep 5, 2026 at 3:38 AM BST, John Hubbard wrote:
>> The doc comment on the GSP message type names Cmdq as the type that
>> defines wait_for_msg. That method belongs to CmdqInner, so the link has
>> no target. Nothing catches the break, because rustdoc resolves a link
>> only in an item it documents, and the kernel's rustdoc run skips private
>> items.
>>
>> Point the link at CmdqInner.
>>
>> Assisted-by: Cursor:claude-opus-5
> 
> nit: kernel policy has changed and this should just say "Assisted-by: LLM" now.

So it has! Perhaps Danilo or Alex can change that for me upon applying
this, to save a re-spin.

> 
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 

thanks,
-- 
John Hubbard

