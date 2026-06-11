Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D50378D63
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214923; cv=fail; b=FCVwBgaNSnSgt7KKna0VJf5c3OggVZd8O1Fma6uHy1IRq/BQH2/JK28g05g5RPbFmQ1xwW9iBXq1fJpzKw83xNSAGoXxBy8+WtnMcsQWm8vOP3uyDe6p+2s5szagp6PTR6hGelwzUgRwlaJnY5bMZbEZJanlvlUOZ2HN8RLYPkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214923; c=relaxed/simple;
	bh=aKMjINbZ9Qo9CN6Sa9M/nNwscKTYSz8V9OKTSYqWn7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V5xIkiFgRJwLFuv18c8emzTBdoJpQyLpAQ4A/JDSyDa8QbX1Txw3FutJxvmCEh7939dbZVG8O3pnS7D+KxgugkIK9Nu9n+puQCWbzulUIvP0xmni6QPVggSwcbkDa8Oxd74nM1697n4mNsQrrF6PwZlEGsOPVn2VbaatMdmqKTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nwI+KCjr; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nwI+KCjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SocH8T3LpmRKw0KvqgWsb9SpA42t2KysPcVMz1KH56neoMPCc1ar3EpwMpG2FZ+I1sq/VtHDoIK572Tdv1jLly405pWkO/HpwAQ7jIiYbIYzZNWZ+Cqq3qHxpD9J5XbUkee9qnOBTqymDIGs+6KTNXyuWXaac1OH1aHKgseCdGEOn7s3kNSgxtYrZLG7f+Fdr9c19EbWIMxhI4lmpr/NiCSYgy0tzYmmyW5GUN6lsDdCgREFFqNBW69ZT8eGdxsXP11fExIZrH8oMLEa3wP0aD7+U2DnyR/Y0UJ9sjLHQlXEOhRvrAEo0FundZxLOJhki8hyFZj7cNZB1JCHCOITQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwPds4fxu/jf59z5k7oGbbXh4Xu3EADXFfML7m/eKgA=;
 b=gmJ54M+UFwTRnfFTMWP/kFO+Po4I17yV7keZE1EzM9W0fX4y0oN/b0rp1PAQOf8HpGFM12dZyB8l+/OorPXwgqvM7zW7gF9/ZPxoHyfciryn31gcA1RI2zJ2CDNIui4eNlekjtMMkeddevDRZQYtUdutms9QlvvwD1wY3VXzgI5XPR0HPpRhiPgzqHgsCmwx7pyog9xXe30KlSoo+fCFwPwNZXkEvc8vMH1MHWKbktIb1fQDyQRHYVzO8udiSBUVmj2xWN2LwEROlk0HIuYYCSWUCTKDdOu86vi60tfL7Lbqqx2sc3epW4VEPwTAZ75fAkWAv+QQZ1hZ1BY9dc61VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwPds4fxu/jf59z5k7oGbbXh4Xu3EADXFfML7m/eKgA=;
 b=nwI+KCjraJJOChgpJoluyKNdFkVO0V4pnsL/XzAwJ98aJCe+UUHrSQtlLuQoG+ytKNo+tBC3wk0cXT+P/QaNTBQkU0XCl/s+GjEo+Rxgkb1RW8JOnjm8mk0hLsAWQbdIOCDFwLW1Pb6teg4NZJCSPCHcAPGGn1pKvoU6otzAEbrX/qcHpHr/OJoNBoZkqjcITuJ5k+LqbLN5EYgk/Yi+n5avZ75OTgbRwHQxJtViC7liLm0FgR/KTUQTiAudxcs8z2syCW4W91RF6f0alK6a+W6Ps/UwzZ/ADILjMyeIC9+DO8Q4szbCBVUenwlkH52wjcdEog1m+eNIUaUZpzt54A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 21:55:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 21:55:17 +0000
Message-ID: <604ffce9-4325-4a9a-b3e6-1ac14c50eb84@nvidia.com>
Date: Thu, 11 Jun 2026 14:55:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ60QHQPQF70.1SOTS6KEVEQ5C@nvidia.com>
 <78734fd67dde42efa7fe02b031b67686e08b37a1.camel@nvidia.com>
 <DJ6GNNLVSRQ6.KEY8HC7A6T67@kernel.org>
 <2999ddd661da04f41d31b96cba3e8a666dc9d2ed.camel@nvidia.com>
 <fb77efd6-1a38-4f81-a493-02268be6bb38@nvidia.com>
 <e61af16615724d751ef6e2d176c057797d2c7530.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <e61af16615724d751ef6e2d176c057797d2c7530.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c1b8a2-6576-4f54-e4ca-08dec8041fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	KWkCqkiyQGPZ6FfwWFNfJBEmWP2BTG7oTJIxBOjCNuSvM2HWajA3yVwKcWo0fSnCvXOn3IPHJq4lxrJ5JAC8nkTfPLOnKgT71wLQ7aHRy00j8AIN2sy7pOJrbMpfBf6g3xLVgH+QATaclXAgYNxfsgKk08/j2N6cA7YZC8pSvCPoiYkGeOtNcnpsp/S4WzLG3k3tBp7HpzQpoN0fEea4vEdZ1FghdcyrDk2KWkQ3oei31vNIIUzsMQ2t++MfDSZZifSDsBzztQ8E9fp9Jly/yTNpyrcX+apIR7M92sOw0aHTaFQtR0rm6TFIa2v1uFbGZ8fbqsiSw0VkGeGp3d/k03CfsxTXwleIGrV7E1fxCKEoTh0/y0xBCtXBXOnZZ1v+WcPAwQJISNoToIyJzQyt6f19WyF69iM501ojxBmevSFWFQZIAzgA5s7ByyMF1U+0O0Hm86g9zRY3mV3cXI6aTguxbQZRvKTQkPiDwMsbBtKmM6WM/03+JHK+/v1NCBYifi2rHB2faGARhl/7GjgdhexPTp/DDYjSWl69vPJ6j0t6vFiFj8mWH3dvmdq5vNpY9LbdTwfYbqrEa0Sldtt533JFjCHyRNi0DhJZYelcNQdPiqvN8O2ZP3UdetfRPinLYX7HIU6Zglia0iI+8WgQa2qIdft317DtSZ//DrOY/Q2oMXBde7YWgXrjjACjQ1AQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlpYSmxsMkFCZnpsNDF5MDJaOVV0S3lGbjVUVDRtK1ZXbzV6MTZMeHJtMnd0?=
 =?utf-8?B?SkkrM0ZCQktWd0cxM3dhZkFJQVRzMENVbXo3MUFiaWUyQVJ3MUI5enZvdG51?=
 =?utf-8?B?SXRJb3V5Y0J3c0I5dVJqR29HbG16NHRYeW9BZG5HdDNlblZYdHVmVlZkVThV?=
 =?utf-8?B?bVd2bk8zL0pTVGxwTUtwUkJ2RGVZQ2xCZ1Q4NFlrb2dsa09DMnh6NWZ0UmI4?=
 =?utf-8?B?VitlSXpjcEZCUWdGemR4elNDcmZib0V5WTRTdzZFWHZSejNnRjhST1pVM1Qr?=
 =?utf-8?B?ZXBxNFAwRHo5d2tzU1JVbEpOcFV4MDRNYXg1ZURqREo3aWUraG5GbHM0S25Y?=
 =?utf-8?B?aU02WEgwcHl3ZTYyNkVyTEluUjhlNkdmZVJ0enY0RzFQc0NTcFhaQjhkRURD?=
 =?utf-8?B?aG92YURtZ0ZCQ2hMVkRoVDRJS1Y0cFVvaTBhQTFCcHhOaU9VSjVVNHlyVlNX?=
 =?utf-8?B?NU9uc2N0RmgzNW1KZU5qenVPUXIvWVpUZzF3emZCTjRWd2tsbHBnblFITVdN?=
 =?utf-8?B?aGRQS0RJR29CRXY1OWw4cVAreHRzRU50TW90VXVvamI4YlNnMlh6TCtEVlg2?=
 =?utf-8?B?NmdHbjZWSUdlZHppK0pseEZGbXpMNHY3bUtZU2tiRlJIYnFPVzdSSHVDSTN6?=
 =?utf-8?B?c0VHQ3NSRUUvTXNQMEcvTEg2V3pvU21sbDdpd1ZYTFRFYUZRaUNwNmdSUDhs?=
 =?utf-8?B?TDlGRTAzTk81YjB3TDkxM0dDOFdpazAwNXZjZ1dTNm02b1ZKbnpQbXNuY0xS?=
 =?utf-8?B?SW9MVGVlSWxoM2NKWTFnNXM3RGNvTXcvQzRUMVRMVDFoSndNMHluN3NRNy81?=
 =?utf-8?B?YzlyUmdQSVNTN2tlTE1QbnFiM0t0QktIemNYdW1zVWc4MldGL1JKU2JyWWUz?=
 =?utf-8?B?OW0yeEFQWHBsb3NSU1h6NGdqcVdMOUlDTUlwanFKNHZha3Z0d3JLakpKR2pr?=
 =?utf-8?B?QW55YWlKMElaNXJFM3NtZktTZWJpVTlDVjZjbDdhMDNBUUdWaERpVGMvMGJD?=
 =?utf-8?B?S1FhT3hwS3dIc0lla1Q4LzlwK2JOc3YzWDVJSTJKeWJxVnFleW5PRk9jRDZ2?=
 =?utf-8?B?ZGFJVmM5cHRFQ3lZbk1laE9qVUJVVlhHcGhlNHRxNjZSVk5LWmZKUGQ4RVJT?=
 =?utf-8?B?SjBURGdIbTQ1M2h2VHNJOFNIUktFUkZsalI5MXRTdzBzeTduSWY1Z3pxdDJY?=
 =?utf-8?B?bWZ1NVF5MS9XWTNGMi9ISUJwVnFDWjF5TDVpY2d6OEljbEZab0lQWWROU3ZG?=
 =?utf-8?B?QjRXTG9vOVVobk9WVUxBTHA1M2dhN2IxcFlkaGw5NE1ZdTZaejVFajY4MGM0?=
 =?utf-8?B?T1ovRzIxdWFpUThoNzlzaFp3aUQyQWJNN3hpcEVLb0YweHluWmM3V1laQzQz?=
 =?utf-8?B?K0NXRE0xUk9PK0dKT0x0RzJscjdxVmxSS2RwL3ljYTlOa0s2TXZZYlpZQ1Zu?=
 =?utf-8?B?ajVOdFNEOVJUSy82ZlA5djRrNTJWVU1DdllIVE0xYmFtV0VPMGZFaXhlZElz?=
 =?utf-8?B?Q1ExRHhlcEk4ZStYOEp4RStsVHdxTHFtbG9KbnpZaUxHdkdhVXpaYTZYZzdJ?=
 =?utf-8?B?bFRVN1d5cGY1dXR5dEZKUC9vaHoydjd6VUllb1RrY3hvWEtYNkEyQ3V3aENW?=
 =?utf-8?B?aE56NDRPN0pYeGI3ZWkrd0ZydFhqZGRaSlBQaE1jdEhIdEEwalBGNG1ySXBU?=
 =?utf-8?B?Z0YzTVNKaUVHREdlUGIweHRyd3pUT1FsZXJFV3BvbU1YSDg0VEwvdEllYzJY?=
 =?utf-8?B?dzE5VlRhRm1IQmt0dHc1cTdtVGtiamNTSkhmYUN1RGltL3NyZFRma1lBMVF4?=
 =?utf-8?B?aXpSbGkwQmtTZVNGbjJQOVRnWVdsSDdUWC9vNENxdzdVeUM3WkdoQTQvcmx6?=
 =?utf-8?B?VGdtUWZiTWgvQTdCUGpUVHpOWmJzeEJnQ2ZkbXpzZXFKSXRjUVZ6NlBPY0VW?=
 =?utf-8?B?dEJwRzdCcS91SHM0c2ZIcXZaemlRR2I3ZThoelNTazdKS2Y4N0prdHRBQWVP?=
 =?utf-8?B?RlI0aHkxSlNrcnRIUXV4b2ZTRjljYWRwQzdpc2pNVlJYMUxqWXNiSzYrbWVO?=
 =?utf-8?B?dkptNnB5bjBZd29Cbk96My9PS0ZuSnUrQ052Rk5GbFpVK2lSdldBOS9Sdk0x?=
 =?utf-8?B?TWIvZGI1Y2NRa05VR3JYYXVKdGZucWxLQ3phanBwZm92bHRZN2ZHdnRJV3d5?=
 =?utf-8?B?eUxhQit2bjlDVnU3VTFkazdFV3NwVkpaK0I1N0ZOUVltZjlsbmd0ZzNHQWcy?=
 =?utf-8?B?U1ZXMFIxaUdFU1d6VzJXS3MyMnVNWHFGUlBObWx5RFZtZ1BFMzRGbzZhL0Mr?=
 =?utf-8?B?aWdLRmZZNk01Qk1XcDhRbkltdkNpcGZnZXhzeURvTmpKZGxiUWpsZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c1b8a2-6576-4f54-e4ca-08dec8041fd1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 21:55:17.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE1CtMHvDZGUK+eDlR2AlxmoYgMmNFX+ga8cwUmpEiZNYl7g/P19DvIkO8kTUpuLXyWGT/aPaYzf3benkWQxIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907

On 6/11/26 1:01 PM, Timur Tabi wrote:
> On Thu, 2026-06-11 at 12:31 -0700, John Hubbard wrote:
>> Hmmm, interesting. I remain a student of Rust-based design, and am learning
>> that Rust likes to constrain things early in the call stack (often at
>> ctor time, even), so that soundness and correctness don't have to be
>> set up or verified in functions further down.
>>
>> This is one of those things.
> 
> Ok, I can understand that.  There is just one problem, however.  The code will ignore the returned
> slice:
> 
>     let mut fw_vvec = VVec::from_elem(0u8, size, GFP_KERNEL).map_err(|_| ENOMEM)?;
> ...	
>     let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
>     firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
> ...
>     Ok(try_pin_init!(Self {
>         fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
> 
> The returned slice is of no use in this case.  The rest of the code works with the original Vec<u8,
> Vmalloc>.  SGTable::new() can't work with a slice.

I see that Danilo has addressed this point, in the nearby thread, so
I think you're all set, and I don't have anything more to add.

thanks,
-- 
John Hubbard

