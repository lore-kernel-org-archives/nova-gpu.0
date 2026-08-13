Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AB43C7BC
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657434; cv=fail; b=bwAH4XqTkL6u0FsZZpgvXVy2EnZ2cO9m4fpLlwc9RiJ6TFAmeWob9QbYp5J5DP7Na5KOS7uwUajoizvvJQ6PPRBfqEULLtpwb78KGaRtjWafbd8Tmbl1m3L1ejH4E41mojk3UmSShrPbFUdle3/O8natoMJhbYGIq463bvH5970=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657434; c=relaxed/simple;
	bh=ynmTGoI5LibBnY3DDmDiK1G1Bpnsg8eBP90pdBrEq18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lMFVgGp3sDASacP/k+sOQJI3iRFjGKlaGxTWGmgmzInMRnCNzOGDCVJuut7+ielDamr+QsgyCybFEQRuvxGTKamQ6W5nJEgqimRI6eRZ6pbkply+4npfQzHNgly6+nj3Vw23xdCMTU/voGpWe44oQPGRvkxaUdw2n5G84dX6QVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tpcU3wD4; arc=fail smtp.client-ip=52.101.193.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tpcU3wD4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4lvKzia4xMJZcTbice+H9lLsRaHO2Z7kxFXtPPSr4U3FT8jlv9cmozLfPAgrDHUuHYRs6vZv79MLjNigA1CbiR2NIGQ6pyi5hw6Tx49aKb6htcO/vne1b6rpwClvXMpg0/yBpH5aIPhIravXDoUyfiADTlvIJ4K24VrMBZG5cUYegGeGGjMC1aEkk6KmxGirBaJRlCl85v1TU/8dcwlforOZv88ZSU55+3i2iU5sID62EbPNF/78REnhHwcdbjVORF3195AmGc+RaRXo5im33cDwcQVQFmK2fkaEkgQLfsjyYxOLqZuwY8aK6ItvsQ6vRF0zsqG/9498PcgxjtR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Isic4nie+U2Gfb3OfVQJ8Rx4l1QuTCJ2hf3zqg7lsjU=;
 b=dIXUwZeWYdmXKATPNkxq2rg2l2V+lvMxTt26yCdROLoNC1qRO4ka9jLnrRCZ1Nf0f9Zfqor+wx8xxKQG6+MvoREQgb32e3PZWNNUqMQe6ecI3AnOI2/vMN8Anuxw65cxwG/Q0Z5Dx1xCL6HzjkNYsO1oC9JGOL5rTG1thh38l76FShWudKvI7vzSmcHyDLkxBO3t5+hpHiBEil4CO1g28Kt1AAy/RPnbzhe2WrJx21EGQAz/BzqbG3KDMxjAReUrNWvcKqVbEBzddC4NEZ6bUQoEifVsG1MysZjBKz7BI7OAvNzGTGEakQCHi5m9NU7J9aGtw1Ubvhv+UHmiULHJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Isic4nie+U2Gfb3OfVQJ8Rx4l1QuTCJ2hf3zqg7lsjU=;
 b=tpcU3wD46Q0Z0tgQSrPED0b3tmxm4KyjQ0BqyHzm5oUXX2VXx1G8e7gQcfDm/DKxrlECww158KMfJ9UvEmWpgDjZ9sDhwhP3uPXkcmbbY3O3t3McZxqGw3UwMENeTGzLhm3PmrLGRw2/nYK0ahZbVC8Pbb2EEeHXYk0pHGDQzPYANnONP9aak1Ng4P/gbhXoZSDS+rTpI7z409FiXt/HyxBX05zmRxl7oo6XOlIP0LQ1oHRYWaR86LE7ltOdhp/JbtMyCQlE9K6Gc0HPWoKaBerSdvfgFHZlRJLi9Tf+ZSJKKxXTcKV/ddiTAqO5fdea9Y3kcKpnc+7nxPWSsFxFzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 13 Aug 2026 21:43:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:43:47 +0000
Message-ID: <f595bc9c-dadf-4e62-b694-fe0c0f3e1f4d@nvidia.com>
Date: Thu, 13 Aug 2026 14:43:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] gpu: nova-core: add the GIN CPU interrupt tree and
 MSI EOI registers
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
 LKML <linux-kernel@vger.kernel.org>, Will Pierce <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-6-jhubbard@nvidia.com>
 <DKO56JWE6439.24UKD7BFKQ4TP@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKO56JWE6439.24UKD7BFKQ4TP@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e9d971-67be-4d6d-813e-08def983f49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	qOUMNAyH0C3CWR0Zp4JzzMHq94o5krDw7kqBejunGd0UyoxTRw2nKZ8iwTJERtBIWHYBzbSBNPJE64AxASWbiDSDS6ZIkPfs+r8aLbwyv0wcmhMDBd+6HP3NoZIyiGryTJm6XBlL9rWjU6tLbz2c60+jqzz26KI6Yz2CyJJj8ru21dSNcF7rLT9HENNY9v+PQ4iFxYhawqGtOzAt4eX0e3EIQm9bHRBChG8QYAmmO0MrZ/pIPUNXSe5Nv8NpPbm8a+H/HDScNZ/vISe6Zv5+4TMsFRKfMhJZn0Yh48MSiZITsaLAVH6BCSbLcba5EkOH0LxnVy1QnxtZTDb5XyBx6xpX1GUIYdrlRzUZiHfZkE6Au9ET3ORtFacfWUy7Q4EibcZ8lCwUw6x3WgztDuK42mnV0DKMRDlHC5r0QzE6eu8XtF32XwSpWRfYR7JA618BnpwllvKTgArnBxYQMGtX8/0sjRy7BDsns4rM1LE+NracyVzh7Xej8ydsdAtYB8tqDhzVWGsMEIe0ZJ9sFm5GgHgTUHQ3D+xsZFFDWY0Ihlq//M3XX9Tn3wmImzl6fX0QjGyYkNIFUBOrqDKXLOeAXdTToeDeceHrgYKiQkfmgir+COeIqa50cERJWnGs1ROzk4n2F9tLVoHs13eKkUWlZz9JqgxiNfcBUIQ6RNRAKeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJMeVNzYnJEU0hwVjRnWGNXc2NjUWJkMStWcS9yeE5wRjRHTFdkUjBCVVdE?=
 =?utf-8?B?RVF2MGFNWXlOQjkxeEh6STN1emtpRjMzZmltaE5FMUREMG5sZzd3REQ5emhZ?=
 =?utf-8?B?aXpIU3hvbWYvZFQvYXVBTlhLaHJNT0huSWJSVkQ1VWFXVFoxVFo5UWYwbUgr?=
 =?utf-8?B?b0lmS0RoNUFXMmdUT1ZyUG50enNSdzZoK0p0VHFVZVJyL2NlV0VnRW9PLzVw?=
 =?utf-8?B?WjhCQ2doTzA1NmdIeDdpc3d5SmQ2YWwyUCttOUxwcE1ldEhrTTJoRTJRb2pI?=
 =?utf-8?B?Sm0yN3c2aWFmMHFjeEdVOHB6SEpUK3hFK29ia2ZZY0pMYVJZeTRpYzJuTElC?=
 =?utf-8?B?aExFaEhRSkJaVmgzM2VRVy9PSElXMHNidTROUnprY1owM2tGWU45YlBYbzZ0?=
 =?utf-8?B?aWtTWWloUngyU3B2UGFTNEZYb05YTUh1aFBQbmNxZXNnbFFaald4WHAveFRx?=
 =?utf-8?B?V09CeTZmSENFdGZsbTM5blllT0RMYnNvOWdDcDdWcWI5a2Q3UmVZMWYydlZE?=
 =?utf-8?B?bU5tYWIvcHFLNStYS3ZjZHl0M2tvNVA0YStBTTZOazlSQVhRc3lFb2xQaVlU?=
 =?utf-8?B?cDhXZTJMdnhvWGFQRHc1YmZNRzRjNzNWWHpxOXV0aWxKbmRvTXE3aGZYZDBj?=
 =?utf-8?B?UmdxUEtuYkcrT0dNWjdwRnlmQkVVZkxsVFhGdS9zemlBRjR4NGRmanA3VVRB?=
 =?utf-8?B?aG9yQXZMSEpYQzRRdmhNdnV3SkpzdnR2c0xWRjd2R3hLMDVCdGFJclRWQjU1?=
 =?utf-8?B?MDQ1bUFDdmN4V3RZK2FmZ0IvaEhicGUxM3BvNGE0RDVvaWxoenRBOVRhazN0?=
 =?utf-8?B?RnpLMm1EZWtzZFhHSThvWEpXTlNSSVFUQmU5WXJpS3FtaUl3VFdqK2VOVkhK?=
 =?utf-8?B?czEyRHlMMVhDaFR4VFdIM3huaFd6ak50TTlUcGcxR3R6Y2xSaFY1aEJHUFh4?=
 =?utf-8?B?TnZpM1Z2OFVQUDN5N3Ruem9rVjhsUndzY2tXaVN5QW5WTCtEREdOVFU4MUJm?=
 =?utf-8?B?d1VlMGJ3c3hNSFc3NEgrRkEzeUZSTEx4ZzdOUlRXazJQR1RDNXJFNlRTN3lj?=
 =?utf-8?B?TnBkQ2k0K3RKNzdnemo0RGFWMC9TVUlVNDNTa0Q3Rk11Vmh5WExFWnJNZzha?=
 =?utf-8?B?NWJQbnVxRkJWYVF2ekZEeDZHNDlvSDJWcjQrT1pjbEpieDdOWGVUcE5nY0w4?=
 =?utf-8?B?TXloTzIybjErSDUyQkJEdFFDL3dRUEFINzRuNm4zeW1MVzd6bk10aURDZjdL?=
 =?utf-8?B?aVIrd2RrU0gxSDh1d2MvRHVDV1ZvWmdkVC84M1NkUk1ieWE5QWZHWXBFcEdo?=
 =?utf-8?B?YUh4dHZkT0JGUlh5SkE5aFR6Uzl1dmpBd2oyV2wwdHA0VFVOdkwxUE9MTExx?=
 =?utf-8?B?NCtiaXhSZmFNZ1ZhclhPUElKczBPbW1JUW82RGdUNkZTVWpyb3pXMDdHWDRY?=
 =?utf-8?B?dFhneWhwckk0RG01Q0hoajZ4SVFsb0RBd1FNZmRxOVYwVFFEM2Joc0hsWEFr?=
 =?utf-8?B?UjdnTUlpTjFOU0RacW5KcDRHemZYS1YrYk5iR0JCVDFuQ2E5eWoxazNDWm1p?=
 =?utf-8?B?YjltYnl6SVhZOVdOVWsrSFRWQlRqOXJOZWxybFI2NmliaHJZKzIveU1QbEVT?=
 =?utf-8?B?ODZwdEQ5ZHRYSS9jMHpLSmF1eTk1dHQ2cjFRRjJReTVVcDNWY1J2blg5aUZh?=
 =?utf-8?B?M2lQOFJWRVl5S2YyTzJTdnhaYXc0NllNNmNRQkxGNUZOQVl2dURmSG03ZCtp?=
 =?utf-8?B?QjdlbEFMSHcyelpOUTVtbnRPZmp0OXg0RGc4TVZ1NHd1STJCSFZYNlI5T2tB?=
 =?utf-8?B?clVmQStWa2pLU05vQ2M2WmRXRlhsbkxxYWg1NU5jT01ta3NBZFk4bnlyQmhN?=
 =?utf-8?B?VnMxUEJCWWZzSU1VVGZzMVkyc0pnb2k5VXJoYzVsNkswcm52SHVyM250ZG1m?=
 =?utf-8?B?RzRSWkFPRGVacE55NzBsTzFXNjZlMWZsQnljUlRNM2Z4ZjgzN2doTGh3WGxO?=
 =?utf-8?B?aUtIM2hIbzArMU9kK1VPRGp2ZmtYVmJhZkhQSDNNRjdLRUZjdEV5emdOL3BP?=
 =?utf-8?B?dVY2by8yUkVaWm5KbHhNNnMvZFEyT29mS3hlUGU0NHFQQk52bzBVZHM1U0FK?=
 =?utf-8?B?WEdIaHk4emVBdEpid0h3dDZDOW5zNmh1Q1lJeE9SZU53ejlCa095c05UV0la?=
 =?utf-8?B?L0M5SDdMVEJyd1k3SEZaSHRkN21xWUR2c2htVkhTMmVaR2U4Y1hqbDQzdkdR?=
 =?utf-8?B?RmJIZWxDNG4remRuVzh2TU1XWFZxRmtPbW40RG5ocm92eFFGWkhtUGNtYm5H?=
 =?utf-8?B?ZkFDQ01tOG1GeHVOZURGSUFOMjBKRVlLSnlsczdwY2pVaXNXVU4zZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e9d971-67be-4d6d-813e-08def983f49a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:43:47.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdDEW2I8lCp/PFVR1gF/p3dJlzM7hmzEo96JNwLlZbIuD+PB4tOZUCV7VxcFmYy1DnnTFoQQwmiUBc6Vglo0jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495

On 8/13/26 2:42 PM, Danilo Krummrich wrote:
> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> +register! {
> 
> [...]
> 
>> +}
> 
> I think all of those should only be required from irq/, so let's move them to
> irq/regs.rs

OK, will do.

thanks,
-- 
John Hubbard

