Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80CC377016
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192537; cv=fail; b=odg0ex3s5U0yf63MQ3leNosmJKkalMacC6xwQ2DgBT1YB8uEUDyYZUmbDOEAqerf3kVMtPrXdPaELOgkPUaIgSH8jiMT384WcqzLoZ6lBc12XfGBvq+j73KhwW/6J6OHceGfg1UFo/8NQi2exnUfu9k8JL7khxCYkexpnkttq9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192537; c=relaxed/simple;
	bh=g9yTAUQAk9DC4LY/W6mSg4X6BXuxnGUcNfKihKWErEc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVqbDCuYVzsNRkIESPyTjgsGDyjn2CC4aEYFRs3fHD5mwTGb+OK6tkLQqUvLNaC+UaPahL5o+55nPS5Hp5MxC7uj00ixUysFXD+UYmL0XvPrzSxrvM7ZemrlXF1QusI3fl9GMMWh3yw/p7ud7EBCNK5XHzgNCIvwkG/kc5P8sSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X5BkGNWP; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X5BkGNWP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPAe6SLlGc4TR6p2BqDTLkxKwfasUT5dKG7HheYCd52n0bxMrP3034OCgbmZ6vRrLCrjR+m5z7QCETd05e797/Dox8cKTQRMFn3cuGr950WfMadEbIVb9wR4sMBpSG2cmk7EeDJ/1Lfy+gpb69J7f0LY8jekwmt6pmFYr6KpaHpI3YZlKxqiqra3yZoBRYpr61jNRx1KcACgj2pE7ovWbSmg2N4KmsnTcTk/bN6c68I/zbIjyhyhPJbun1so/JvL68EcABFWnXrollY13se/femRrAKRF4evWCIk7FmwzQGkwS5QZgd39r9oRJRepZFtnke5GLh4/z1fcoCQIFHV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lERribFNn6G3KJOW+OfObJmElXm2L6whQcYQVZNuQw=;
 b=ngn/XJ4h4EbOueQ3Sd7Ro5vnimEBJ9r4tseSbGiL77jmV4DrEy6yI9hdpdxrhzovOa+LjinNLguWhvneVutfNTwYHn2/q4+FVjAbp302qYn32xNwHRXMZz7Kj5z/YfuBu8KiIVJm6YszrVINRFcWLeclDX3BdVie3+3ldEhy5g/zcBAEAZ0z89J/dPe4XlfeEUMYCKnSUvMBwK+7DRQ2RPpg5uTIcxIUrsYrVotJMSHf7+hhldotb0cCbRi7406igoI3ekQeR6vf3oVHxXBIJc14y11U6LhrhMOcH6eVr1Xap9wFJauCsdPjtTdCwS4kWAU7Rz5lGTab4sFsPDVLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lERribFNn6G3KJOW+OfObJmElXm2L6whQcYQVZNuQw=;
 b=X5BkGNWPEISXFysNnokNt07qqVRDfqNqWR2bnB5OTr9mu7M7Zn3DGBZDp26xp07D+W4req6cy0JKg4jlKTmRWzry6t/xYtWHAtGUkwVXw/KUG0MxzauJyhY8mbP+cVLss3z46ivFNbeKl5p3bXSfU20s3SxvtxL4tz8qDGo//19xwMrPFG/lA1chfSknzsapg4LEY4d56edw3G14lxc6XWPZ0PsmsjrNTLE21l02EuS9Sps4p75yJZbPjtKOvk9eom51PEuhlCF2yrM2CHmlY8EUZQ5Wy9rXYA1vTJWMnzOBhZUaHVgO0yh8ac1b1f/ILMwruIJ6f/BYvIu4jYAJ5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 20 Aug
 2026 02:22:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:22:10 +0000
Message-ID: <5b9a71c3-4122-4dcc-a863-449849d4100a@nvidia.com>
Date: Wed, 19 Aug 2026 19:22:08 -0700
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
 <921982b605fc1cc6cae2c64e3236d4b8b4a82408.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <921982b605fc1cc6cae2c64e3236d4b8b4a82408.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 514c4c6b-7a98-4b96-3881-08defe61d71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|7416014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0C1eNBhsnT4ooAmu+4dore9TFvLQcdWvyEjaanrjyrkt5D1qLD4v65tiqM9pcHGpBYX13BSif6i6OJ8g2tA67cDwQWExnbP/BNB21KpoDBguUUXTCq9vaeDergTG0q+J5yJmHxQFlUerluywSQ4UVHHeG9xFbXkHcrrTLTDO6R08oTy/Y2yHkfaFnzB+o+ypXXUZsu/ZJmXtHUTgm+L5Xkr4xgi0mr/Bq4aTXjIr60juDDXIrI/olvrlvAmfKTYOSq2le5mcRmShvFrMP031Q1Vo1j0hFRPf7YDi8CefQTRKBGxUmtkB8MSOncK559oaWIpL7thvYFrP4WT2RmZ/eaB6R4aI7XxczOuKPWc44R277acBvG9Jq+wKUMRaZDQ8kNIceMVdyUaANzhkms6m7se3CDrfkdL51CfpjT/IE1DOVMT2NgnYTNA9dgCsvF4Os1cHp+RlEmx+VeFbi1bquFIV3cL8JCv+gj/DfxO3ACu+Uu8lA0ZXf9lHK9SQAeLgMjLg12jClL6bPsVQ0B2VgslmsZnVApamEx4Ir19MTQDlkq2kHlFH4mGGmJ+n5S2ZBYRdk/d37EJQYf8fMIZEMpymn5IYIjgaH9zAxpJA01LbK+PQ7Mf21ZSXDBBwE1eb8tyK3LUCRdgyDNHiRcP/7CDx+scJCZavdF85qaT9z1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hTQUg5ME5ITXdsV2pqbzFaUE9OeVE1R3ZDUlkyNEt2TEpDTDMxV2FNekFW?=
 =?utf-8?B?cGRpb0pBY3pCTHhmYjQ1ZnpTck9VZ2s0ZDVDeUkxcEZlb1pKbmdSc0V1RUl2?=
 =?utf-8?B?UmF1bTJxZE9SNWx6eWZESUMzYXZsZ0U2RnJiYkx1Yy9EczQwVDJqUHNydWNM?=
 =?utf-8?B?ZVFvKy9pWGRpVnZYdlJ0T1psWUFXNzdBbTRqQXNrZytVUWFOY0F6U3NyUXh4?=
 =?utf-8?B?T2FxZ2g1QllKTTZsTmpIckdObnY4RTNLS0luVTVaMEgyQ1RMU0RDM1llVzIv?=
 =?utf-8?B?N2hQOXA4TmVWTnVZR2FJa0p5VnB5TFJrU05mUkF0SGMyUHEzWG0rYVRkcExl?=
 =?utf-8?B?T3BIMStNUDZoZEpyQTJnSmdiUk1aOGdZSEN3aXVvTnhBUjNFRWJPaVgyRElB?=
 =?utf-8?B?N1c2SE1IM0ZHdDlTSTdwMmJwV25ubVNQSUNKRDdCNmVGZ1VNdjRVSjBRYUFp?=
 =?utf-8?B?RlFrbWlUQmU5dGh0U3dHQmFuMlJHZER0VUpsVHdwRHFrWXlLVDdmZjhBQ2hz?=
 =?utf-8?B?cnlhck5nbnFMYTdBbC9ZbXF6MkNkN0tMOUx6b28vbXBYUndYSE56THpUMHNV?=
 =?utf-8?B?TnZob1ZHMVJWTDBCQlRHMVlwRXcxV3cxbHVWSWN3OFpvcXV6d3djbjRpVm83?=
 =?utf-8?B?R0NNNS9nU0FtOFBZWTJMbUdjWGhQakhRWnF6cWJJbDNUbXNVaUhXRkM4cTh1?=
 =?utf-8?B?ci9zWEx1OHZGQ1hsVFg1M2hLbDRBcUJGSUxrS3RqMXoxYm1PZUJ6WmdzSDQx?=
 =?utf-8?B?VW5FRVMwTERwdTFJemZPZjdnTy9uNmRFK0hQcWpNY1h1cC9idmMxb0RWK1p6?=
 =?utf-8?B?RTBpQmpWSGs0NVlDRmQwM2xYUk5FWUF6TXkxUlpOeStnTXpndjJUN3hqbE1F?=
 =?utf-8?B?YzhXT0pIK1krSFVabHRVMGc4L2NqWVdnREZGU0dDWUNKVmpuM2JKTVprNXlK?=
 =?utf-8?B?ZkVrRE9pTXcwSDZLZVU1MXNRQ1QxRUYxMW9McGo0VGgxQW5jZmk3aE1mdEd6?=
 =?utf-8?B?d2tNenRheWxxVGVibVZGM0E0Mnc0UzJvcTE0eDBSRE1PQUphbnlHaGtXbS9J?=
 =?utf-8?B?QnV2ZTlrYVBjNk5QZGxmdDFRcUl1dUZXdThQYWNmNmlTVUdlU250Z050ajF2?=
 =?utf-8?B?bWVPVlgvcDhObElTdXBkS25rbUs0T1Z1OHBhRVM5Nmh2Y3A4RWRvSzIwVE9u?=
 =?utf-8?B?TzBKTUtkRmVpd3JNcFhTMFA4RGdFR2NQdjhCN3AvdFR5dHFYZUY2VmYyVXRN?=
 =?utf-8?B?alJlSXcrU09xbVJIb1dXaHV3OTM1Nis3RWUzN25vZXpzMkRIV2YrUUZ0bmd3?=
 =?utf-8?B?Z296SUNnWkNRbW9XZHBEK1lwSmplaDFKT0V0UTJjb1dkVmVZd29oenRjeWY2?=
 =?utf-8?B?UzhwejdibUpDaVVONFQyOW1OL2hpeG1MMzBJVnVEeTdtMnJOUko2VDdyRkk4?=
 =?utf-8?B?ZWdSUWh2OFVqNmpZSVpmSFRaNHBWcEtIOUhXQVUzeDkxWlo4SVVDTTJRT3I4?=
 =?utf-8?B?V1M4WlZHRWdPNTlKM1Y5L3ZwLzZrMnVOWEZFd09hRE1IcU9LTFQvcFA4Uml3?=
 =?utf-8?B?VURHTXZrTlR5Qk1oRTFDU1hCZzBBWXhuZ3BjU24relFLNi9ERmNFNnZuakQr?=
 =?utf-8?B?VkxScjJQZXh1WlhCSEt2TEFSaEJMM0JVQ2EzWjZrZVZBUm9NWnBHMFNVTTlr?=
 =?utf-8?B?aGpSbjcvNEd5QmwzN2FOTlVTZGN1enVCWGJKcVEvZExZUGhqOU8xNVo1KzBO?=
 =?utf-8?B?eVVaSUtNQ2VGL2FlNE9XRFp5ZjBVdTRUTExLL1Q2M3VCcEFiOHV2YU1YK0F1?=
 =?utf-8?B?RkQ2ZTlDM25UUFRtQ2FxWnV4MVgzdjZCQnFSRlVyN29aMERqUTlaaWFMa3BU?=
 =?utf-8?B?VkZZWXVxaG5ST2dZM2Z2ZU9QazJJQzJVVWdPd3gzaGtpWjVxeHdMellYQUpz?=
 =?utf-8?B?TkZGZHlyYVo3REZ6TGVPajJaMlh1bUExOGtkYzY2WHhGTFdSMjY0WWRtREw5?=
 =?utf-8?B?RVhvZFRpNXJUMVJUYnAramZnVE5iMHRGWmFsR2RZTG41M2VxWEU4c2EyTlpI?=
 =?utf-8?B?WXlGeFhwTkt4N0JqTFhwVlRnelM5RkJma2dVZkE4RmpURURzR01NQ0dJOVZk?=
 =?utf-8?B?TVhRVWxxOHp4Wk1uV2pFblZTbUkyWVRWYUZrc2MrUUpOaDdpaG5lVDMrRWk1?=
 =?utf-8?B?YWtlU21yblUvU1BHaUFTanFRVTRtbVNpcjhueXhVdGJXMDFkcUsrclFPQ1JY?=
 =?utf-8?B?a2lWODNWTGp2dDA4SXBXaUp2ajl2a3IrQmhzL1QzT3g2MjhMcXNsWkg1a2t4?=
 =?utf-8?B?aDl2eUNFd2FBRXd4Q1dibVV2YXZBTEorYXp5NjhLcWFZZDFCZ3JxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514c4c6b-7a98-4b96-3881-08defe61d71c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:22:10.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7nUiXM0ZTwVB840Kv4XyRkjBLGg69VjgQRAcuKRPreRWGNoeWCdR4Rr5ZzOYlLbkCMv2SFLxI0IixOJxlVO5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745

On 8/19/26 10:55 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
>> +                if file.is_empty()
>> +                    || matches!(file, "." | "..")
>> +                    || file
>> +                        .bytes()
>> +                        .any(|b| b == b'/' || b == b'\\' || b.is_ascii_control())
>> +                {
>> +                    return Err(EINVAL);
>> +                }
> 
> I'm not sure if this is needed because request_into_buf() will reject any crazy filename that
> would result from an invalid FILE tag.

OK, mostly yes. I'll simplify the checks down to just looking for empty,
".", "..", or "/".

> 
>> +
>> +                let size = usize::from_safe_cast(self.get_u32(b"SIZE")?);
>> +                if size == 0 {
>> +                    return Err(EINVAL); // TODO: Use ENODATA once available.
>> +                }
> 
> FYI, ENODATA is already in linux-next.
> 

OK, I'll just cherry pick it into my branch as a prerequisite, for v2,
and use ENODATA here and get rid of that TODO. 

thanks,
-- 
John Hubbard

