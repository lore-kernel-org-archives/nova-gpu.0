Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFF2FD1AA
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192822; cv=fail; b=o1O3Fb3IZJO9Z39qXeKV3zbVZKBOXrccQSSHe3HVYV7ROf56uIhBvN0lqG7yLMeilmCkxrpXqaehbt83KVRoJNzxEHoeudgJjj9Q5/hSKid9IAKNvgTF6SvffSkGrTW17KQAhK7rOYs1ub3OvawIni3AIYiOx8QWq7X9Wa8aPDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192822; c=relaxed/simple;
	bh=FTugPQRrfbct7rWjS9H8VCMg4Av11VT193CIWbz3SyQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtpPIClbPuq159kGGYikmoYAelT6qIQzasPnPUA9vkQhALnQULxkyms52TfL5nI1Ur3ihNfeW2HK2eEO7zqPaNJWmPVLOrwXQDzA/35HCFK5yDc60Pw5CBrEZOO0uOoNBUFbKY1rPCsidLTC1wksO5Zh1bxZJmwdUeZ4PfcVUQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BmH+YPUV; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BmH+YPUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwwHUIzffza6Fu1InOAm4ZgZ0SVvp90wEb4Fnkn1q00LkN5SkA3rCUbUQK/6r16g3FKYsjr8C8Gm+cfVewJXUU9B4xOVci2p2Gzck7SBkTj5cYx0DIeq0mjr6D7rSq88Gga+eNfhIU0yJUqIBukuHwMRldegU5XfOwEXTGMdCr4C5HPOC1GEqz37Bae05D2CwGwKLXkGcrkJspz/zF/LhbB+BmZ5Royp5VSBkX9FJUg+JLrwdzI+UwSxJQaqzlTqyPcY7XDwcSnszjswk9JeAnJDjxn3w1WkG1cIyUz1sVA8QLLffbiUzW5NlMlI7O6r6oaEKOcNzoA/HRFhVYawNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx48iBQUvNFlz6nKXfmU03Hs53L6/hjyacb7VMo6tho=;
 b=rJA8v+MoFleDXuMNDpapVfeCrGMkEtTelt3stONvc0DdU/p69b1JsyI0zyiu0TJmAWnWCl0/Dc4qsM/i4Uvln+TakGB2aJu/bB1ml3sDag6UnkQD1oU0SOPXyNZSEXhdFJQOMsdjztiYWTCg/aNMntTj9i8yzyk3v4K8J8gCiiCkMdQY+YZrhxreTliXv5VS8gT+LqO4D2pvMJBIyeXPc0FN3Mnq5x7JJ3firTD7/e0lvJ4nCNfLV/wdbrUCo9lPF1yc5OPO4I/9j88PisuXtij/JciXh9GY24Iwt3aPmvdSxNEC0ZK1csJ1rQ6iCh0B+T5ZBWJ5LgWMOKxA6uccBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx48iBQUvNFlz6nKXfmU03Hs53L6/hjyacb7VMo6tho=;
 b=BmH+YPUVbZ8XwbB6F0sk8jwKLZb99GQYzxmFhS9sOf7XBRxLE5RByQZXQ745PKrs3TIqfUBuqxLwMz7muCqNzdzUxXYt7VUkKZ/aj+XhRmJqqW0jXcv9WDKhivWmByDR1cNrRtLEt+z5B/YrN3jn/ptSd3m5RaASXq3yPz5LHdI6cvi4vTNa6cFXoC/O/Fap+k0vwhOzM6T8GDNwfeqZyf6BI/QTeRLpWfMLeYU7nsyKU6KNJ8rWmiCPi6CEMBjp+LEc8rs7lbQEIji9uoM2dsdODGPeImw7xY1T1Z9IukyJvG3yeSfIxbxE8l60W0WgFPHIbLOIqd0nCbyeXkVmBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 20 Aug
 2026 02:26:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:26:57 +0000
Message-ID: <3b662dd1-6802-4a0b-8c0b-576ac75775b7@nvidia.com>
Date: Wed, 19 Aug 2026 19:26:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/27] gpu: nova-core: add LIBOS3 log buffers and state
 monitor buffer
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
 <20260819035221.336390-9-jhubbard@nvidia.com>
 <06fd54f6d47564a7dc0a106c4225e042c6d624d8.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <06fd54f6d47564a7dc0a106c4225e042c6d624d8.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c9fb23-2af5-4ba2-1b7e-08defe6281c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|7416014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IJXAoutR1lVyCzydeL167/3nHRX06NXE7cJI00xp1IlZSQM4VYebASX4hwzsTK3ajCieNJuOl+miSIigF7KpwGftgyUsR/BwZxTCd/6RZIOy3lUaU1BzHJv32CCKPzXWkjL5abQtjo7BQOILR3jqINwBP1YzI4LK1E3OgMPgdlva2wR4lP/FuFKjWdglheSXBLnPFeGmFTTk/dFsOmpmnCQkY8dljz+s1DODybDmnaNKdNotK+JcXMp0D3N2jujhKPDH4n7Vkld/toQnhNX1aqCLgjPNcoAa2Mt/XoaCc9jG1H+AyLSwPezjXBAvmokzjsMuA5UJpNJI5c8ua5rnZJq4z97YyHBUgfbXyKQjc4zRCKqsUZJUPPDscl6BxQx4abr303QgWe/MBiE8Mq7Ffhb3TFgAQhmw0D9M2lnxvQw4CDoC9TwcLuOm1HMKbue3d2NlNNKCXawTkwO6f77q0kXS31A/OcmNPTiiaqmQJooHsd5ruLtBh9vzXGPFEZe0X09HkQBID7vz1SV8cE0+Y4fL8Jz+p41BPUW99+je8zRkp0fBffnTBLiQqEAmxpIUjmjgSk3yXWhaMb+P7LcNwzhY3HvOFW0SEsX3xZx+J8bCqB4NW6m8ZrCPnPWwlQ/rE9yhYm4T71Yyi17tY/pUUytyHvFps9TWChLzJWtQZTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhGbllpQ0hHNXNQQk5kb1VRdUZnSTB6STFvOU5Nb2FhZlF6b05icmxmVUdQ?=
 =?utf-8?B?VDN5VEVLYXNFc2dsOGQyNFJkdDBEMmJRb0ZNNkx5THVVYWpmZkQ5VUZkZ01N?=
 =?utf-8?B?VWdmcVlOS2dlZ1NvNE5LV1dveTUwMUIrdm9yMFh6YVJ2akN6MWlTOTBvQTJF?=
 =?utf-8?B?bDd2TzM0Mmpjak1CbDRpc08wM2FRMkd5SzkwdE1ZZHpsWEQzdmtLVGJFMUw4?=
 =?utf-8?B?ajYrMmlKYkVxcW45RDQ3MWZ2TGNHTmo3Qjl4cXRVaHVQVmlQSTRlcWNBb0kz?=
 =?utf-8?B?NjgyTm84ZUVGNi9jdStnVFFVWk1PRTQxS0lEWThtMGF1NXVuNUU1WnNtS3h5?=
 =?utf-8?B?Mm5abkNmTHh0L3ZkMHhVSFlGY05ZSjc5dDNtSEkyS0labDFLQiszc1U4bFpU?=
 =?utf-8?B?U3FBT2pJaGUvWGNzTFo2U3RNYkpQeUJaUTgwTWZuZlJ4VFNoOXl4MjNTRUtp?=
 =?utf-8?B?QjA5TUsrQWxnTGVHNFVMTlJYUlg4V0ZOM2hnUWxvNlRCTjZtUDJkYi91ZUJt?=
 =?utf-8?B?MXNJQjhqRjFyeG9zdmpoN21JVnduS0xwUGY3UkpOamx5Q0tvS1RaT3FsZ0Na?=
 =?utf-8?B?RnVWVnJ1WUM4OFFXQjY0RzB2WVNsdlBiVTVkd01uU3BqKzF5ZGpEL2VvcFho?=
 =?utf-8?B?OEJjd0lmNFZOS3hZdnJRLzFVS1kzT0RvdEJmaWtpUmtzYVBSSG5qaVg1d2FD?=
 =?utf-8?B?UmVKREIwZjYrNTFINXpLVTlPbkZSMXEwYXhKZGMxMVk1RDFib0NPOHQxeFh3?=
 =?utf-8?B?eDZlQ1R4MUNLNk5hYkRyWERYSHRSQzc2SnBEdXRzZTVLVlArd0tOM2xibE1N?=
 =?utf-8?B?SjFmVXlqZndVZVQzSUNaVW04bkNnSkhEWno2SUY4TVpWLzVROFNzeDQ3QzVw?=
 =?utf-8?B?SXcxOVg5Q2ptcUwrM3JJSHByVTJ2SGZCay91emU0T3p5YWR3S0hGWTgwT2pa?=
 =?utf-8?B?ZE9WMXJVd1NFK0ZBYWlZQmU5RXY4Qmp2UGNaU3d1YTV2cTE2SFZ4T0dqY2xj?=
 =?utf-8?B?TDFYb05sTFJBU2RqUnBHSVFESzNmTVVzcU1RZUdveWcvZGE1OUVmcFdtclBn?=
 =?utf-8?B?WnNQOCtKQ3E1bjIvckJ2MFhWVW5vNmIzQXVIRytCb3BmbThOMkN1eUllRlJl?=
 =?utf-8?B?MzJxbzFmWm5hUG5LcDBGNjY4WnY0WXpnL2xPSXZqc3I5TFR0QVR2V1pFZGx5?=
 =?utf-8?B?U0VodlVGS1NZNFAyZ3lYa1h5K0xGT2xvcUJ1cEhvV2F6NTIzc3Y2VmJvZW9l?=
 =?utf-8?B?Z0tmRnJmNm81U3J1VmtiSlZJbHREQVFxR2lLbVBCcUY3clNRUE43Y3ZKdVNO?=
 =?utf-8?B?M09tWHNJNVl0WlJ5aFk0bVpScUJqTTB5Qk52c2VjQkVNc1Q1bFZyZHVwQUFM?=
 =?utf-8?B?Vksxc1ZVSHFuUm52UkpaaCtJa1g2UEdHUk8zUlo0cUEzSGdFRTFNNTJMWnpJ?=
 =?utf-8?B?ZmdsMldRUFNqQTdwb0JoRllZOWp4Y1NjYm1XRVo0VytLYVljem1tRGs5WUFY?=
 =?utf-8?B?cXNDdTVqK2VsWmhMdnc0SVp6Z2RMRmpQUUVhRFBqaWFCL2txWnhTQXlibmow?=
 =?utf-8?B?dFprYzFDWGsxUEI2RE4yOTh1disxUmpuMDA0SGFQeS9sWDVOZU0xWFBiQ056?=
 =?utf-8?B?MzZUZkFKKzd2V2NYRi80UW93cXhLakhjNGJTUG1CcmVJdE92eEQ4K1k1K0lY?=
 =?utf-8?B?bFRQZEFKUkVqUzQxZWdMNlhNOFhkWGN4alE3bms2UWZmcE1lUzdDcGdldzBv?=
 =?utf-8?B?Tkw3OEVyNUhiLytOZndlRG1HMDVwQmJ2cEJXYS9WN0VGdWd1KzJkazhLL2lG?=
 =?utf-8?B?TnpCUWNyQzl6VlVXeEI2NlFjU1BSMGQ2OWprbGxnQnI2ZXNsTkNhT0N4OUU0?=
 =?utf-8?B?cy9XbUNPMk05VXdpOEFnV2h6dlN3dEI3L0doRlBKaWUxUUJQTXhxYjJ0NlB4?=
 =?utf-8?B?R3FwTjVqazh0S1Q4TUtNTUpiSkI1ODA1V3VleWxoaXZXZTNKamx2WEdTZnpR?=
 =?utf-8?B?NDZjQ0VZd1VQWkx2SG0wcmlHNXEreFFXWWlVV2k3bncrTnRQSmxGWVF4Mjdx?=
 =?utf-8?B?N2N4L0J3dzdKZjJ1SlE0TkQvQysxeWJWVzRrc2xPc3dENitrRG4zRTJXNjNn?=
 =?utf-8?B?MzhPRjJRalBNQ0MxaWtxa254eGR1ZDFVY3k3WlNrV3hEYmtQNlVKcXhScEVY?=
 =?utf-8?B?djA3elF5Rm55Rjh0M1N6cHJtMEVjRmZpZ0V3bUxZUzFzSldHeFlDd2M5ZzZU?=
 =?utf-8?B?L2FYNzE1ZTF1RDBLdU9TMmlDSTUySmk5M2pFbVlhK2JkRnJXS2prZzhrNkpy?=
 =?utf-8?B?Mk16dkdHNlNoWUtma1BDUmhiQUo5cGR6YXhvaEYyeFB3RnppMytiZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c9fb23-2af5-4ba2-1b7e-08defe6281c8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:26:57.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZT0yKo2Yir9RUqRV6IigMxe+54pveU9x8n5p9VrUfd+p3lcAvvrtmEEE1rNHzUD7DIIpVKsbgYDuiaawTXvUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745

On 8/19/26 11:12 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
>> +/// Matches the registry defaults for the init, interrupt, RM, and MNOC tasks
>> +/// (`NV_REG_STR_RM_GSP_LOG_BUFFER_SIZE_TASK_*_DEFAULT`).
>> +type TaskLogBuffer = LogBuffer<LOG_BUFFER_SIZE, RM_LOG_BUFFER_NUM_PAGES>;
>> +
>> +/// Log buffer for a task that GSP-RM gives a single page.
>> +///
>> +/// Matches the size GSP-RM hardcodes for the root and RM state monitor tasks.
>> +type SmallLogBuffer = LogBuffer<GSP_PAGE_SIZE, 1>;
>>  
>> -impl LogBuffer {
>> +impl<const SIZE: usize, const NUM_PAGES: usize> LogBuffer<SIZE, NUM_PAGES> {
>>      /// Creates a new `LogBuffer` mapped on `dev`.
>>      fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
>> +        build_assert!(SIZE == NUM_PAGES * GSP_PAGE_SIZE);
> 
> Why do we need to specify both NUM_PAGES and SIZE?  We can always derive one from the other.

OK yes. As long as we use NUM_PAGES, it works. I'll do that.

thanks,
-- 
John Hubbard

