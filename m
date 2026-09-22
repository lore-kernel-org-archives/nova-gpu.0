Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0013803F1
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045575; cv=fail; b=MjFX3wkBu0z1JUgV0BKruqjTIhmDj/K02eRZVKKB7wqeAXZ6TVRT2oZ9BqqDD9JkNtM8tHgDRHGdp5iIezJlx+kEE1J5HS0STB8UV3T1se/v/ddDk2nZZrIEwv9n32o2Wf0ApVfQ+DBUyQ2MlDDyVkqAZRlGE4/eI8H64DPpIu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045575; c=relaxed/simple;
	bh=RPbgtKudz4ITZK6rWqsCubsYVyRIYZKgso6i09EgObE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cfYmevbwGyEWZLgxlyCy4MV0ypkgwiDsuNdzD0VYCgJlIYgMcA8crju1z+f8OYVvvbEhscPlucn6AnfEGi7x4Sx0Ow/28eyF5ZDuiWnYetvXHJl4L6o7UThg1qHP+skVIoTGKTJ4MjbqWwEuxSFM8U15KfXwqOWZd5N6cIXJprg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hIsl92tf; arc=fail smtp.client-ip=52.101.62.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hIsl92tf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8mWaKTfGUCIg3OL2O5LUeuxUjHi3G+T5B+dsvuApuWth+7gRGOmFmB3GWrSwMIV6W6qV9eJcLLZ5lq/xcUt3VcCOK9RGiyL3+1Vdsp9VH9ixMutGXvXDsOdv+Vnsk2JOCa4t1+R3fXqLer45bM3LT7YuiJXDEhDVNknVZFp2gD4fiH/z3uYzCl9a9o/4PA/M79ytur6lzk6XnMntmeIhJERKWd+61lQhgu+JBU5OIvWRCtcY2gTBKuWIJlllMa1azSsC6qSoY7DAcTTlnY28Tobr1c+ihaH7JbzNiH1aG7iIZu0pPY1GiKym4hj9As8SwsgTBnPMih6QdzsVEG2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UWdwnvkAP/Abq18loqgIG7BKfPnh4nJiMzZKP/1LNk=;
 b=GkUSITU21pMmgUXRuov5ucUAlYCYw7AGWTbcV5pp0yy+iPBNhmdbJWXP8j/TwwkH8jN2HPj2zas4dLMER2cGiLOGJLt6+dHgDp0qWykHvEKj7/v/mkKLrJlPAp7+nKEoTuj4k7rm5lrMgKbv1TUNYhRTwgE/9SJj9gFC934wuM104sX7BMBZ42TE54+bs+gyQacaL9PiS94NCyGkbs+EZFUGBPkSOv7nSMDbg/FKKuITC24ApatDAyDHiU5P63BnP+E4DEe/Cd64SOMQrkr98OiNDnPGoy+VOx/6zJ7RBI9clnZQXbN9Ib5qHe4yEaN//uZjrYdWVYN28joZa+pl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UWdwnvkAP/Abq18loqgIG7BKfPnh4nJiMzZKP/1LNk=;
 b=hIsl92tf3O2B1bW4b2E0CUb8FVOnlJ23PnNVtj4CYykvB19/QzDKwpmCSNSQ8teTpBhOYfyj1thh8+8+idA04gq3xibE5Z8SYGT7IX41zYiiWlUi7xSRTE6YrfQMtJgoPWLSQKbmB8p24BYmAYkHRzLIDTv3GVIHkPf0d0kjkrOSs708tutzkzp2GcuTO8zkbJbNTVb/A2tkw/8tW5e7NFemq355FJBLCeQQ/HPFtBPB1YdeWGE6zUg8g+AN5Lz0H5VqQ7MHRoPbF+eQ6eWeTE1fKaUKeD8hHqnshjfRdbKoQE198M4yMSsUwb0M9Wt2e4iUCpKk/7RipUBN+9Atuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.13; Tue, 22 Sep 2026 02:50:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:50:42 +0000
Message-ID: <8e026a4d-6e8b-4412-9621-4f4e0c441521@nvidia.com>
Date: Mon, 21 Sep 2026 19:50:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/33] gpu: nova-core: gsp: add GMC dispatch on receive
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
 <20260918010719.1176945-13-jhubbard@nvidia.com>
 <83e33dab67a0f571c269262ef052e68eab9dadf9.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <83e33dab67a0f571c269262ef052e68eab9dadf9.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0ec6cd-87ef-4d3b-0b11-08df18544b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4nYW2RhHvEMieR/JkULwjPLWW19p/fLQnOIaoOD4lMPQ5EkW03GD8FMeZulN8+JMM99sI/1OtOTuD9jW6MLaQRYpETjo77v6U03g2hfweqC+mLcimytaGMkEKArkyryijSDeg7RSlDwY4mDs/I8fUehohiRrJ6Yq7HsIzs3dVb973Cm/0LIEVr80N5MfY+l/phMyvuASjxHPOsSJDnkexl0eHlxYCfRyzgeE5J0jfz4E5RMd8bkouvRlIVk4WSQMJqd4/B7J+//AAm9Z4uhRy+S/eKjQUau+Pyfavq+NpuavR+Hq499g5uBVT/2ucaRbl/2DykNdPDmXGdJ38otlQwFD6Lm08GtwNGv8mtIYo8T+m+gR/anm4PHxnGc/RE999SvP3TwyPoNWmdHMTumKTkFVdxAeiuRwqqyYubAVKr9eXJTL2Zv7gUYHbsnkkEeM4wuAgtq+as6BBQ25kB1aQ8IeJQHBteDUHbYrnnT82N3P8ABiEqsOCcsf43eJE1FdH+QLHRX5ErD+YTvmKLghlln2chnLXuaVsfv4PxCl9UflHYRFJFAYCV3XnpF//VRawHqydmSf+ixMfgZdcq/89pWWtgARBBkBWONDQEsnhntnONiPRdzoYLsYVtVVsV/3QPdCzxyxC/mtNmNjqQO02sjPeE68MjzqKlPqBuOQJzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29rNkZqYmlKZ2cyOUVwK0JlTWhGdW9oWVRTYVBpdjE2YjVjTzNTOXEzOUFZ?=
 =?utf-8?B?NnlQWHhtMlR3S2tWRU9PbmdLYlRUQmVmNGozT2lJRXVJZ28ydThoOUkwUWdF?=
 =?utf-8?B?d0tweTYybFUxSGpMTDVwbDVEM1BheGFXYWs5OCtZQkE3NjM1dmVYcTByM2NP?=
 =?utf-8?B?T2xkNnlWQndlVkVaNnN0ODd2cUhJeTU2Y1V6YXlPNWpINWwraWV3MnlEanlz?=
 =?utf-8?B?UU1KUDVFVjVGa3RlMjRUTjF2a2lzZllrTHNQK29FUVByZGFlbmJyMldabTJr?=
 =?utf-8?B?N2tsR0RXSDFlRUZHNTdIYi91ZVhTc1QyWkVVZVZwRlQxT1p1QUhWbXIwbkE2?=
 =?utf-8?B?Mk9FVXF3Mm5sdnY2YmJ0WGNyOEI2dlh0bGlLL0M0bUg3bWtXbThXaU10ak5B?=
 =?utf-8?B?S1J0YXl2OUZpYnM3a2c0YmZMK2puYUJQNWswUHZ3U0lvbVRlKzVma1Bodlc4?=
 =?utf-8?B?SGRGd1pqcVVMVHRjTVZzbXhJdUVvaFFDei8zL3BHckFxekVqZVkxWmhQV2p2?=
 =?utf-8?B?cEVOVGhlSE1WT1lsS1pYTjZGeTBKeUo4c2ErTnVQM255QTZVSlA5UkgwaTNh?=
 =?utf-8?B?OVFZY2RpeHAzdVVMelBTN0FEWFdZMm92K1RwSTJ2QzFLQzhKeHlOb2JxeC9K?=
 =?utf-8?B?QlpPSFJsMzVsLzEzSWxldWVEa2V1Unp1eE0xYjBNckdLNlBhL09OT0FmZitu?=
 =?utf-8?B?VTE1Y2gyZ3BLSXJQZEdudDc5MlpFWEdzY3V1ZmxKZW1mUTRxVkJaeTFEMHZI?=
 =?utf-8?B?VWdBaC9hRFFXdzZtV1BxNGo2TlNycEpiMmt3bVU2Q2p3YUFrRkx3Um1oeEZH?=
 =?utf-8?B?RUhVbjFVQzQyZ3lob1BxNnFYdjdTOEFMQWN6clVlMzMzYm0rcThSV2J2amxs?=
 =?utf-8?B?YUg2ckNPaXpxRE95V3NtbC8rMlI4REFOaXFGS1N4MWhISHNuRGR0STI1YWxl?=
 =?utf-8?B?TFd5QXJhUlE4MmkrVndjNTBkMCtjOHFZRHZ4c0dIMWE3cEkwM0ZQZmpnUGxi?=
 =?utf-8?B?TXJ0WmZLTnQxWERmZWJLZldSUjhONXNEMUtZZWZBZnRUN1lkbE5sQVhuQU96?=
 =?utf-8?B?cmpOSGUyUGJQQmVqYkxwb3VITlNrUURrM2ZTZ05YNTd4ZXhXUGpyNTZKTnBE?=
 =?utf-8?B?N1Z1NVQ1NVVRRVdvSXlNb0RRNEhsWDhmTFh3VkhNQ2UySEs0SFBlVFp1Z0ZB?=
 =?utf-8?B?Nm5JOXpvMk9tcGh4UE9GTXdVTld2MXIvcjltNWlxNm1NT3g4aisyT0VDb3JW?=
 =?utf-8?B?aHlWZVVCeWt5WWE3Wm9Ra3hzK0VYQkdxa2NBV2k4cjFxSXp5N2U0bTA3NVBY?=
 =?utf-8?B?Ly9NVjY4bDh5NG1CaUtqaVhIOVUrNGdjSG5IelR4WUQ5aUJPcHJ1Z3pYRGpw?=
 =?utf-8?B?MjNndDJESUFNejA4YVNmUVM0Z1BjRjZDMFMyam9BQ1A4SHFOV0w0UHAyckNv?=
 =?utf-8?B?RWExRC9wblhjSk5JMUV3WXd2UVBWL0NqdFZwUmF6VU4ySzBEQnErM0tTQlpt?=
 =?utf-8?B?MkVWTGVhN2VsN1h6TmNYM1FFNm9Ba3B0L1FrNkNhd2ZtaUlDL2pHZWk0QXg0?=
 =?utf-8?B?R0hjTDlma2hFejVON0x6WEpZS0ZGREs5RlJEUi9qTkJBbjRKYmxiMnI3UkFu?=
 =?utf-8?B?LzVCOHdwK0M1bjBNT3J6eCsvSzRwVDYyZkFCLzdtNXplRmNnbUNTWGFMYStO?=
 =?utf-8?B?MEl0NnFuYkdnZzBCdUdqOFVkRzlwa3VCOTVDY0xENzduL0x0MExjWXE0bzhK?=
 =?utf-8?B?eG5aeFd3VTJORExCZ0RXL3ZVYTFIUUFkNkFPUDVWSkM0NDFBVW5zTGgrWVVa?=
 =?utf-8?B?V3hkMnNsNkxwNytZZWZQcmE3K1BHNHFpSC9Pem5KWDNmRTh0T1NYbkxHNDFJ?=
 =?utf-8?B?L0hpamx4MXpRZnlmRTRWMEYyL0lXSUNzTVdjdms3U01BUUEzcTkvNGI5UnF5?=
 =?utf-8?B?SWczdFEwWHRPS3N2ZUMwYVZmbXlKQjE2cEtvN2tCem9ZaGM5WCtvcDN0NlhB?=
 =?utf-8?B?cXRNSFZSdlNsRVJ1RjNHZFFialc0bzU1RWQ5c2Jmd2plOGdTYWdTQlBSc012?=
 =?utf-8?B?aTNBRExoNTQvVjQ3cDVlUStIb2FpRk1zYTB1Qno1TWhFN3JKUUkweUJUVXZO?=
 =?utf-8?B?YVBnWEpOQVlJdVcxSjVoL0plWjAxcmhVZ1hzd0FsLzdYMFZKbkkyT2dJWW14?=
 =?utf-8?B?d2hDMDVFZHdyUEd6ZWExaHRZUFBFeFltSWxub1RtSDBtNkxSdDF0dVNoVSsw?=
 =?utf-8?B?MDl1MmUvRTNHVVdFUVpOVGdOcld4MVdoc1l0cFpkSThNMFFteEJFYTBienRS?=
 =?utf-8?B?REtzaXM4ZkltbEQ1TXEzakk2ZjZNRTdobG1CalQvK1BNVHBLRndYUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0ec6cd-87ef-4d3b-0b11-08df18544b05
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:50:42.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0CBnV90mMh8VxBGlK9leOJASR9Jbr89xOJRgf2rtnZOT1nnkCQUSx4F86QaYSSc7xCTSELGU/IMx0L4yF1LgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071

On 9/18/26 3:01 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>>
>>      /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are
>> logged and
>>      /// consumed.
>>      ///
>> @@ -1097,9 +1110,9 @@ fn payload_slices<'a>(
>>      /// # Errors
>>      ///
>>      /// - `ETIMEDOUT` if no element arrives within `timeout`.
>> -    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, which poisons
>> it
>> -    ///   (see [`Self::poisoned`]).
>> -    #[expect(dead_code)]
>> +    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, or if the GMC
>> API
>> +    ///   header and the queue element header declare different payload sizes. Each of these
>> +    ///   poisons the queue (see [`Self::poisoned`]).
> 
> What does it mean for the size to be "declared"?

Yuk! I have written it with better words, in v4, thanks.

> 
>>      fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
>>          if self.poisoned.get() {
>>              return Err(EIO);
>> @@ -1146,8 +1159,89 @@ fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>>
>> {
>>              )));
>>          };
>>  
>> +        // GSP-RM writes both sizes from the same payload, so a difference means that one of
>> the
>> +        // two headers is corrupt, and the driver cannot know which.
>> +        if payload_length != num::u32_as_usize(header.gmc.size) {
>> +            return Err(self.poison(fmt!(
>> +                "GMC seq# {}: GMC API header declares {} payload bytes, element header {}",
>> +                header.gmc.sequence,
>> +                header.gmc.size,
>> +                payload_length
>> +            )));
> 
> This message doesn't clearly specify what the error is.  How about something like:
> 
> "GMC API header declares payload size of {} bytes, but should be {}"

hmmm..."should be {}" assumes that the queue element header holds the right
value, but the driver cannot know which of the two headers is corrupt.

How about this:

        return Err(self.poison(fmt!(
            "GMC element seq# {} has payload size {} in its GMC API header but {} in \
                its queue element header",
            header.gmc.sequence,
            header.gmc.size,
            payload_length
        )));

It names the element, states the fault as one sentence, and puts each number
next to the header that it came from. 

Sample output: 

  GSP receive: queue poisoned: GMC element seq# 7 has payload size 96 in its GMC API header but 80 in its queue element header


thanks,
-- 
John Hubbard

