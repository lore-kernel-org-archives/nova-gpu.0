Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2B3AA1A8
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150803; cv=fail; b=NgICjUvoRr+ewHLX1Ar1RadMnmLMbUCD4ozWL8ssrcU5VIcD+lUrQwmxOHB/zm6nLvEd6Dwcf5gkOj45CH6hVPeXF5wbx8NLI98UwZdV+UYGurw/8P38gCCKTlm2reKZ5AptjCSjJib4Wvab5Zj4kFOl/YI7ZP6xT1QdYwhD1DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150803; c=relaxed/simple;
	bh=rVMo9ztlglIQyh8NL0tWYEjgi8Xh5OvDKEZPdBDU9b8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mAINbJCFrBc3cHB/UTTGBPnz+72hJwZgJN2fWnxYKYgcr/BdpToWAjh60Bd/wQjZVL0zOh7gWkzwUF0/8iW+davZi37j9t8XQ9Rg1Kimj9yDHCB7svJHbpcNqKoYPu2Z1fD7EAMqc15s+YemArwxT6KZOFUquek1afJONtlj+Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KniO4TIw; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KniO4TIw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCih8pnu5Ti/A6Vbb3WHsF2MpGzGH/8Ymqnc9UUJt0rzn+bPpUn5QbDlrjGUZphI8tDd+5OO8sn3L/ORCaDuHx7hyYaWoHK7s3G1iBWlN46ub2DsUmS5wY0aj+o1ipozV/YVNXfHaggBeXXJvXcrDCm6bRKzHpNaFWoOgchkQp+RjTxspsdb5EmLX8788T8Q63ri32upuwC7pohNtTRrb91h4+oveA8GLTxbkufZ/gX1XBMkglSaQFsWq6ZI2/Lj8CPodImiCUSczt43CJjKF2Is1QbBnfYv/m7lhj/E+MrWaT47ZgOCdB3fsetMLR/K2N2VmEzCz7KhgxKPBIuvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMK0h0qZIkwn1KlhkC98mHsPBKjVn/Zhk2xMPju9qS0=;
 b=fNqirS48V7mTi/1SKSDz5FOc+aNhfh3h49Mf5FaBFIk8PCJX64ZP2nIrlFto0oLvZv50nRZs+H+kF0AW4GR/0iBJ2zmMg0IL89QHdOQ0lq8R9uQDWEQAJ6hbOP0j1gNKQCce3rk0qRzvzPL9BqpTYGguUZK1KAy1JAvVOScvslyHfkimB+xctKoZTlzjiJDYI4ifVHwH3lRbmxmkipCdnlZx0kqyAHPk1T5r1AXQElc284ID4jfsgWupk2dCet9/IQ/lTJ3yuj6az+nngcTOEAxnqQnK5jl/E7RjT13B/Eo5xGGWhKDQMctWov1VJathskcR903gmwEs1ixUAMOclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMK0h0qZIkwn1KlhkC98mHsPBKjVn/Zhk2xMPju9qS0=;
 b=KniO4TIwS0LN/D54kYBI/URsAfQdZQ/4Jd5QzC7MMJz1XE8+11Xpj4rA9V+4Z+Mnle5k7KIXq1IB3B3fheMazycqOOZBhG5TfbMSk1tC2fjRJMXbSz6pscJkp/qcNEtzPwfzGe2VC2QXdzMI+VMPDw9AK4sZikCm14Ym54Bs7pGOBGIpHuSuYqqxd50K2br6FHCUrPvYWeiaoTk9PArxLF+l7Vc5aRsoU8GDVxNWEUHgYtAryyUaobhS06f6PZxhnAMjmycQnOmW0Cx2KXTiIkgEeRWsWZJGpSVDpJthFvMKWFwG7iGLmasYhoknWr88q/BCYW5KSyM3haSWPxoVdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Mon, 31 Aug
 2026 04:33:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 04:33:14 +0000
Message-ID: <d6d3bcba-56d9-4775-9687-ca8e2a0c80ec@nvidia.com>
Date: Sun, 30 Aug 2026 21:33:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] gpu: nova-core: match GSP RPC replies by
 sequence, not just function
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-14-jhubbard@nvidia.com>
 <DL2Q86NR6TJU.3ULD0NQAQ9HF@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL2Q86NR6TJU.3ULD0NQAQ9HF@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdadef9-d638-4cd7-84aa-08df0718f8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10070799003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9DVXwTHvwvfoeukFz9SL9jP+II228y0nuq8li97C+o6lgk5fetUZGczq3rIOapbt9LD+XOXe9hXCwo5Ho5GVeIntvV/C8EHCHPtxH06GgzPKf/oTigFAHFDP9YmCTAiNxJ5ZRoNr039nQQ+TLc5lIbvTvgHBCof+bU1pdPoD9TcpHEnV/bjFpfViwgNA7To85hAQ5YmGWe8oqGuqwkpEKu1Um8n+EsYwZI1UirdXZ4t4Z9t2mRtrr20IItZLTxFmzBuWC46qKfqyZIkEdTjYz6fupg9xUBWZ4XjiDN4EzyoG9axnStPqDH6Wldb+E3Nywew/j8YYcOTvV2ez2E9rtPQj4c+LO35qIzl/KERP+HAAWANmAsZQ3DHAlChyXHZbmGWT5oQb0g0v/ZoLRzlv6SJ8AwD/386dqsGxcfV7cph32S+zG0aMspYEo1qfCv6nA1enr/wsk9pacE+1Ddk3hFh1pIc2eetyPTIIrYeQxE5r2OMtIVkz93WLfa/z9nIhfWUF5XB1jkAePLVYo1oGk1h62nVV3q2Mu5JpvonNZnqP0+TiMpBNelE+3nk4VuMO8AY1lkBsDgCWB0GBmTfSoIbggXdlUwfeoYycqUhjPLr1xwCHYqMd2w0nDN9JCeoUEJLQe/f8iicDVeu1ceke2RnZi+kJgftWl08JojfJ3ZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10070799003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9UMzNDUGlQWEszaEw2TnlTNzl1YWdFYUlneUpYU3MxQVpSMEdKbm5aKzZX?=
 =?utf-8?B?ZGRJVngzeExSNXU2My8wTERWTFhxdTQ2Mys0QmlzOVNiVjMxZkx5UWNqN0lF?=
 =?utf-8?B?SnBwK2hxV3hMQzNIeTRYbjJRVlFKRUxmMlBUeGgvMTBoL01idXU0WVFWaXRP?=
 =?utf-8?B?SDUrWE1ndzZsNDFrQVp0UXgxZnRsNTZZeXFQbGhhUDdjTE52OXlDZU9KbkRC?=
 =?utf-8?B?YWU1ZmJNMFNBR1prZTMxTlZ6SGYrcTJadTZpSk5QdTlCVDZObWRSNWgwbG1E?=
 =?utf-8?B?ekdnZ0pKd1p4dzN4YnJUNFRWbTZRYVZ2Y2RGR0luVTRudGxLNS8zR21IWlFs?=
 =?utf-8?B?b2JVeVgzeUREYVVneHQ2V2dETU5STVo0ZnVkM0V3RkpzZEZjOTEzWjFodXcv?=
 =?utf-8?B?ZmJRSjBETTZDRmYwRmM5OUlVK0ZGTW9SUDQwbDRLbEJVenZYMWlESHRaWFlo?=
 =?utf-8?B?REc4b1ZzVVBtcmxmdVVpdTlLdlBqL1YzVXpHOWcvUXB5cjN1ZGw5L0Fxdm5j?=
 =?utf-8?B?N2tzTlNJcjRhUnNTMXkyOHpKZVd6UGRnMnV1UGFKcy94dHR4ZGtGdWJmcVc2?=
 =?utf-8?B?dWU4bDdLRkdFbWNoVEVKTHJPZ0NmZnBURFJPbVFEUE0vRkRPUElSam9SdVI5?=
 =?utf-8?B?S3BrMngxUlpPS3BrN1ozcVp3WnNvV1NwbGVHeUhBNjA2K01ubFZHcC9JVDlE?=
 =?utf-8?B?cEc1ZGxVc3dITVR4WmJKYnF2bVY1RExES1dxU1VsMkZyOFNmZkQwNmhGeUV4?=
 =?utf-8?B?YVRtd3NuR3hpM3NkaUdVbThCdUJPVmxGQXE2bWhzcnEvazMvR05aSnFydmtQ?=
 =?utf-8?B?ZGw1dEZDSTJYbytvUkk2ekR4MjN1aXlMZUFqdWp4Z1ExR3lkbXpPc0dWOTdx?=
 =?utf-8?B?Mml4bUR2QXF2VjQ2ZDFHUlJNbm5jaG9jMmhrOHdhU1g3SkhjNzFqUmFsQjdD?=
 =?utf-8?B?NHp5alN5WUlUQTJrQmlERWlJSVNVKy9vS0Y0dS8zQjVKZHgvdkpudUdjQWlI?=
 =?utf-8?B?REJRM0JRV01lejBiRkZielVVb2kwVURiQlozYTBTZUxQbnR5NGFhUjMxeUMx?=
 =?utf-8?B?NDd6SXFrdWh3QVVYaDVoZlFwM04yMmt2Lzk5akJLMTR0YzdUcFM2Nk1oNGly?=
 =?utf-8?B?dTdTMzg1SXE1a2VtVFFFZm1XRnpxRm5IelJBaTN0Y0RtZFJuQ09TZ3NDTklZ?=
 =?utf-8?B?c2lCQmxkN3dkdjBJZEFvaUlEWHY4VnlUV3Ztd3d3SzJZSjhQWW1mV2Z4RUY2?=
 =?utf-8?B?dW52QW1GVVFTbjgzVlNSNWxXQzQ3TXNtRVJlV1c5dkdGanR4K2lxSUVGay8z?=
 =?utf-8?B?Z05LaUtJWnVqVmdJSGlKaFM3NTZXV1lSbmkyWmdiMXFXUE1mamlCM0tFczJQ?=
 =?utf-8?B?cThrUWdsNysxSEpRQkh2RVVCN1RGa3BWSExyYTlhR0JYd3NPRWlUSUx4RDMz?=
 =?utf-8?B?YVYrV1Y4UnFBQllzelpsbDdVK1AybWY0VDFyakJmNlM5VXhzMEtxNG84ZFU3?=
 =?utf-8?B?Q3hSUHhVK05lZ0EwS1kxcmJDdDVLOWlmVzhRWEtPSEYvNXRMZWk1Q2k5MFdr?=
 =?utf-8?B?aHZoQlp4Wm8yczFDL2Y0TFc3WHNHaWdWZjNWUFE2eFNjWGhFQ0ZpQkV3azBo?=
 =?utf-8?B?aXR1eEhIZEVWMzNHL1h3czhyOUFtSlZSZWFVdVlLZTMyeWRYL2JvdXlIU3Fs?=
 =?utf-8?B?ai9BUTV0bHRacXRHMmozdHZUdUZxQllpRnRCTE9ESGlZYVBVbmVNWEdob3Nw?=
 =?utf-8?B?cXFVL0NyUmIyL3IrWHRFYWloeXRKSWF1NVc4OVQwY0d0a2lyby9aQnZGQ3F4?=
 =?utf-8?B?ZDFqRms2ekpGOG5jVk1hM2ZmZGoyNERmVTlSTTZyZitISWRjU28zd1Q5NTgx?=
 =?utf-8?B?V2w2ajl0VGZ5MWRkVjM3WDlJTjJGb1lqRWRVdnVvYklUeXUva3h1V2xaMlda?=
 =?utf-8?B?emNIZUdQZm1MUUxLNDRwanBpYjd0UURTR2tESSs2bk1CWVBNcHI3MWlMQVBR?=
 =?utf-8?B?RC96bnlYRWN6b0VYcTYzOHRacjExdUkvUGJsd1JlYWFqTnY3RDRzbis1YmI0?=
 =?utf-8?B?Yk5rMmNhZWlId1I4bmxvbU9FbG5xSHB1NFF2eENXTThLOU9HaERlOHhUMnMr?=
 =?utf-8?B?RDJjV2ZiM3c0WlkySWJnQ1Q0SW9meHVHWlgxWW8vRG5DSkwxTWRtS1JidktI?=
 =?utf-8?B?dC9PRDhCRmVqbWlxQTAyMkZxa2IrcWlQU2licHUyampBOFhBUGdkWk9NUE9E?=
 =?utf-8?B?a1c5NldYSm0veHNZSEtuRTJZejZDOTZlMUQ0MHdTNXdPYk8yS3VMV0QzaDRL?=
 =?utf-8?B?aDRVMHNnOFRyaEgrazhrakg4Zm1ISy9xY3VSSTN4NmJZN0lZeFJWSFh2cytl?=
 =?utf-8?Q?2dd8biMs3a4XGqDM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdadef9-d638-4cd7-84aa-08df0718f8dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 04:33:14.7313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5unqkLm9y0i+9Xac+gX9xfI+0zjO7YFZnAbbwthUeoaf7xR/1rZG29fpul3tYgb1sJ/olOCLTYjOzAnh+2HPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945

On 8/30/26 6:09 PM, Alexandre Courbot wrote:
> On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
...
> So I am particularly looking at patches 8-11 at first, because it looks
> like they can be merged ahead of the rest and are useful on their own,
> but I am hitting an error with this one when unloading the driver:
> 
> modprobe -r nova-core
> [ 3333.123171] nova-core 0000:08:00.0: GSP RPC: send: seq# 3, function=UnloadingGuestDriver, length=0x58
> [ 3333.148123] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
> [ 3333.169449] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x78
> [ 3333.323550] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=Ok(UnloadingGuestDriver), length=0x50
> [ 3333.323551] nova-core 0000:08:00.0: GSP RPC: dropping stale UnloadingGuestDriver reply (seq 0, awaiting Some(3))
> [ 3338.124152] nova-core 0000:08:00.0: GSP shutdown failed: ETIMEDOUT
> [ 3338.161317] nova-core 0000:08:00.0: failed to unload GSP: ETIMEDOUT
> 
> It looks like the GSP sends the UnloadingGuestDriver response with a
> sequence of 0... From what I can gather from OpenRM, 570.144 doesn't
> match the sequence number, only the function. Maybe this needs to be
> part of the r000 series instead, if that behavior is only expected
> there?

That sounds likely correct. In order to test this, I thought I was
being smart by using the r000 as a base, but of course that seems
to have led to this test hole. Let me go fix it up.

thanks,
-- 
John Hubbard

