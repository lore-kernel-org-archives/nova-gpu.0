Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C12941A
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 01:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187773; cv=fail; b=YfyRsr5Fy62vsM3hrl9yJOrqTKvxn3nZmi7ga5e4mn/QxZg4uRDQ3vABFMoKlveHXX23A1WLXBHe045KZI8Gd7G8X80MoxXWq4hTn40jxkgIZM9lDo8F/3shnk1Bdh+UF9dUxn9vwpAaCQUgl9Z+t6u5wJFkyfg9WuFX9tRtu5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187773; c=relaxed/simple;
	bh=G5cO8+ipdJGZ0u7Mpld5SI9Lqqx/qYvfSSeP5NY/1ZI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gBVUn59kthvBSxJzyWeoS2zlRWYHvI57ryH21fkIH7asqWbnq+2tZ3UdJ1GQdEx7jc0gJvyexs64LV1IznUyJirkTa7+KXoQmhQkqcFxGOMFFPuBl43/eZogoqoN8AORvrk/8i9D7LPWHAiDKput5NSmA2+BnvFLxPrHMK/p0Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bpDneW2H; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bpDneW2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeMumwflnjGiWjP/zvNKsyZ61hBc4CMhWhAfFNyQQL+v3H2trMH7zIzBUxoxEcVa1N3WrB3ofeygZrIY1PJZxCGvRld+A0p8646t+3aboCyuamZwrwRsCRe80enj1l0i3adsm71539PAGF9hUAXqum5R6UbUd6mVp5nXG6dZngtyKDdiYGxEcw5+v89jECxJIlHqY0TtI6BW7f7zFagSX4vvMUtQ8qH43uY16w4KkqNE/gMSbn+NIn5CMyUjNpOwmjTQaqI/G4eeGbdeIGKl2KHK4Our7pkiFfdywIxX4bZ4h2bP3Vsk13HAv14d/NCll6s2lMj60RbGMmMv8d2V/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGI5a2yNry7BP0dKfTIsaurYkvKc8aqlNdMP2s82EAU=;
 b=kU8avyYQBPncXNuZpccqM5qeyUHalUEloC3lZzJzYHxxHnWic0DHpdlUDMneUbR0XTc+PDOye3R/76tK39/CGm4qrPlO2u85+AKlE+hqHlxFvSAXbgHRSW/D7PmVqsuaBqgpdjXoaNYK9jh5vn1IS2w4/Q6VpElR/MgGA5h7FmrSguDDr9ObigbI3VdwXWmRMeULN7mXVzAWNi/5zrLMCnvepAdEB87NocEruB313v1w6KQ6jfUekpIsxeD6niJsTtYDvPr8zNsGkeT5e3LTN8fpJjLKFlLdptj01rBDM/IICtft0ZN86LCLsNz0QA/u5sLZ7oSOz3ZfttGKnGDtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGI5a2yNry7BP0dKfTIsaurYkvKc8aqlNdMP2s82EAU=;
 b=bpDneW2HEs3gd2k396FS6ZiqQlV2V1lDbho3MOr9WpJFa0ck20HQlKSyyDJpsquvke4n4Yz3CCeEM7Il06WOt0itEQGpGwGHuEsbgtELs3gXUbsL1WqY7PS4LODC6IM9UYDoYUss8MGtuX2+CxtwPpZqA9CrrMNhB8aamamueFWPwWCpaNAXUpfhks5sVxvTZfqWUvL6GCebGWJgEfST69BOwHx84NPDlplIcsKWxzFBC0Jfu/KMga+fV5b6ipoWg6iXgmmVY7UMvZpHonZwqpgXXt+vC5FiPTyZn/+rPMsM9N0IGLNQ2oMF5lhx8OhIpsRBpYt/yoIj4QiR3gtVbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 01:02:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 01:02:45 +0000
Message-ID: <a35e3d18-b780-4390-a873-a152a42eba55@nvidia.com>
Date: Wed, 19 Aug 2026 18:02:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/27] gpu: nova-core: switch to the r000 GSP firmware
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
 <20260819035221.336390-26-jhubbard@nvidia.com>
 <4fc0dc43c7d63158fe4ac6dc0ef375f8a3992a8c.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4fc0dc43c7d63158fe4ac6dc0ef375f8a3992a8c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 102db69d-e4fb-47f6-d528-08defe56bee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7hMgPD6upimoPZdLoTv/seMKHTjUJKRzsSREBzDOr9QThF+9y/w6VzSmBUQQmgqJJtP9casAteW9q3XzsaG/bGLcij9XQc0Dy2Jhk1n2pDcyss+W9urzLO4zkFUJW6nwtg7mR2NK9ZxLLbvXhcber6+tVdlLjZs9ZQh2VxtmHh3YDxyUByl1y1/kh/d4H1PA6NjYjohaO/iPKCewkianVzTeueCjRcJEin0yQH+BhCOutUtfGwZF2kNRRj7hGMbCTOVy+rD0YxaZry1qlD/4oKZGfNzv2lecwtvRsUkH304q0ZwjjMv0tRikP9ph31UwWrtAVHSquanzvECV29R3Mk2eDo/NjbswqP7y9kLmAavcUD5N8G/SXUqebnpDcd2dhRnpNi0io9xcINHRquOZ13Jniqz1sm6f0qAcDDLrHEhQaISQ4l8b67WQbwZFkBKkQckq5Wt+TobQSY8Ed4s7OQuxk+Rtaw+Y28vnSvkLT0bmzwAkwDUSYx8oFr23KRgP6QaEvKJCFJpTP1XVJTuARHmXcnlw6D8OGzma6o/jZ0OeX/GpQYAhRbPW92VBhv8+jczSVKql7lR73b8Ztt30zfp1n59DEySCo59Zkzk+6RKjJrpPR60QezdrGTZ+h8GS/JwA4DIX64BomtUW9OTJM6cm+X6ao//p3eglLZRr+B4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3hCSEV5eGtNUmRBK0VmN1gvc2FPQmtJN1pFT2F3bnZIdVNGVkxYUm5VMm9J?=
 =?utf-8?B?TlFWdm5BRjFRc1ZvVGJOdlR6dDNNTTdTM1pwckxzRDMxWWNPU1BsaWU3dnVl?=
 =?utf-8?B?c3VaMGVEZFBuejRJbkEza2NvYmFydTIrWFhkU3F4cXdvRnpGYTFZWE4rZm12?=
 =?utf-8?B?dGJnVjZldEo5ZjhtVTM3Vkd0ckJ5cWJ5T05xajk4V2lvM0NDblFOaDlodWxi?=
 =?utf-8?B?REg0ZlUya0ZjaUlZdEhrNlM4UlRtMythSTlJcC9TanQrazdOWVZlQlMrNkFP?=
 =?utf-8?B?QUFXNndvcXlKcWROb3ZwKzBJa05UaDgxU2pSVWZMVE5ERlp6Tm8rL2ZoU2Q0?=
 =?utf-8?B?Y2JaQS9LeVdjd291dkJpUS9zVDJudUIyVTVUZkRacVQyOVV5SFlTRzJzTmhU?=
 =?utf-8?B?WTdSWWhNSzVvbGhLcWptN2lueDJOVHdlRzRDTlBzK1ZuMlViYWFmQkNNbXZw?=
 =?utf-8?B?UGtMSVZ6dkVnN20vcHFZN0xSVzFOcGI0QTI1TXlVQXhoQXdJcWxOd1docUdt?=
 =?utf-8?B?QlBQK294V0FyMHMvUGNrdGtsRVJpdFROM3oreU0zZDByNisxcGRDcXlvYjdM?=
 =?utf-8?B?UkxNY2M1TW9VSkpJY296WmtJZHpSSG1iMElEM2NmalBqa1krbDVaN2FQeEVW?=
 =?utf-8?B?aGVubkZtNURNVUZDTkxBd1ZGbEJLaE16OTVBcWRJSktoSVNIMkhoaWxKY3JN?=
 =?utf-8?B?MFE2N0NFNTVCcy9pcjZIYURCZmVLaTFWWGhQNE0vN2szZ1lYampRZUQyNGNF?=
 =?utf-8?B?dGJyWldxN2JEQmpyQjE2YlpQL2UzSzZ2TzBjSEFLWWlqUXA3NC90eldaMjlF?=
 =?utf-8?B?UmRrYjdwVkVyQlZLQ3FHcVA5ZUhxUURGRDJKUFZJd3lwR1BrK2tqUFBHdjRn?=
 =?utf-8?B?UVNrbHlOZnd2VHptZXJvU2VTa3FNWVZwcHVzejZWK3BCRTVsS1ZuTWQwVTNT?=
 =?utf-8?B?OTNGVHFVWFpOM2phNWU2QkhNNU1NV1dRRVBOd09rQmJCeHptcXNxNWZvc1Ro?=
 =?utf-8?B?cWZpSnBqbFhWMmNjNHVhZk1ka2N4WmpsNC8rbUdlS1VTT2M5Y1dEcmdNeVRt?=
 =?utf-8?B?NDFkcyt5ZlEzOFJEQUJBU3JsZStFQlVTOGV5SGlWN3lQTHRBYVZwVTl0Y3py?=
 =?utf-8?B?ZFN0M2tnQUFWeUg3WklCTi9PZm9sWDJkajVMRXluSmVCbG8zcjlJRTdhMW1X?=
 =?utf-8?B?RTJuMGZFU1FjOXBubTloZVFkZ2ZpKzNSdDNVY2EvMmNKU00ycENiRVVCa1ZO?=
 =?utf-8?B?bHFlSjdNTzc0czBlR2NnZXAwSmc2U25hbit4TmxkdmFrMGlxRWhLVVdzdENK?=
 =?utf-8?B?dHEvTXJVVFhweXFRNndQU1FmSHFIQ2d0NkVzNzhsSEJnVUVnK3h0ZlBXM1lG?=
 =?utf-8?B?NC9xWmlSS3JPcElMVDJ5Uk8xOEt3MDdMV1dBNEtjS3hDczAySDVNdFZrMjVT?=
 =?utf-8?B?TEJFNnZCYkcyenI2YWJUWE9xQXU4MFE0ak1Jb1JHMFM0cjBjWTVZRkEyZ3R1?=
 =?utf-8?B?N3ZVSlpWNG5GOFNoNG15MS9hWTZFbVlYM01nbVNnRHM1WHNLQjBUb0RHcm5l?=
 =?utf-8?B?UmM2cXFoemdxUDllMUVXVG1oZFlWNlMxTm50N0x1R2JBajV3WWdCVGtZL28z?=
 =?utf-8?B?TG8zdW9mVmhycmpOanZJZUdrOEUwWmNZYlNyUnZoc25zU2pBWU04aGdOMGlE?=
 =?utf-8?B?cEQ0Nm82bEpMZksrRHI1a2JhcUllMXVueUVoa1d0VzJPMno2dE90SlZ2TVkz?=
 =?utf-8?B?bGs5Sk83c0wzTHBWS3pSNmMyVHVhbmlWR3NOeC85TlZXbWl0NFovZHpMZEVm?=
 =?utf-8?B?NExEVXFsUWd5RTh1TU5XOTk1ZTZrY1FrVHc3YXJWTXBqbTg1ZDJTelVXcG0v?=
 =?utf-8?B?UUVDcHNsdW9sSUxzMlVGQzV4dXBjQk0wTjRCV0NUV1BnMzNyRnlCb3JmY1pC?=
 =?utf-8?B?MTZTcDU0MXE3WUVVbmY3Z0w5OHlhTW9GM2NSN1NwU2l6cEJzN2Rzb0tjQlhJ?=
 =?utf-8?B?MU1GYjJrSEJSUjVXNWVJOWY0OWM0TXQ1bm4wdEdwTnoyYXdhSXJ4MTV5TG5G?=
 =?utf-8?B?QjAvM3NaSFFLdHJtbXdEVUdFQ2pnWjJVNkhMWXdtL3JkRGNFMnBBd2J3T0pw?=
 =?utf-8?B?T2llcmtidk1kd3pyQ3FsZ2J4MkpxcHZXMWU2dlJJWm9VV3pVcVpidzBnUEJW?=
 =?utf-8?B?WlNGNFBSVUZNeVVOVXl0cThNYXh4MWNhNlU1alRidXErWDVZeFV3NWd3R1Jv?=
 =?utf-8?B?ZmN3ZVQ0cnRUUDVxdGg0Qnl6Rng4aXVuNWFUUld5clQ3RU5xVmNxbXRLblg0?=
 =?utf-8?B?eEV0ekpPbUdoY2hETGVuczhieU9JZVBoUmVpV0dJR3lZNHZUTFNQQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102db69d-e4fb-47f6-d528-08defe56bee4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:02:45.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFI/tr5jUjm2JJrSz09bBknGdrApKalH5pnWnH7WbfcwgwXueHPqmHitkhwPZfn+0cz5MY00HQIuX2p4RptQ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369

On 8/19/26 11:58 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
...>> @@ -96,17 +122,41 @@ pub(crate) fn boot(
>>  
>>          dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
>>  
>> -        self.cmdq
>> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
>> -        self.cmdq
>> -            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
>> -
>> -        hal.post_boot(&self, ctx, &gsp_fw)?;
> 
> FYI, my Turing fix moves the send_command_no_wait() calls to above the hal.boot() line, where it
> belongs, so you'll need to rebase on top of it.
> 

Thanks for the heads up on that!

thanks,
-- 
John Hubbard

