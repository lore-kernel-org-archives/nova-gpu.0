Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004B52ED5D
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169629; cv=fail; b=ddsmEhsYZ/aXFfradfLIC9IBc3DPY+6W3uIFBtbfTQGXWntwKnPMJ+O0RVRY6Qxknradj/WDeSViJUWriJc7whbDxVh5VBGnqSGpGBeXhyxrm26oqX9giTgqqXA/hFkrweyEnhfPjYUgGqkOlZVTckGsWWcUWzQcqPUw7E+FXHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169629; c=relaxed/simple;
	bh=mP5D15jUqlmDzYOUjfqolDVnaL92yEmpZ98ftHGunXY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nprky38ic9N3etvIDj3enrXVrXzncSnh5VEdm+zJ7vp+7hkeQIXz0fIH1cW0D5DSpDAnGEQs02nj8ZYMxOPHCRnS1ISD2c6B629sfic+1bJ/OgriJ5ahPdqUHoXWRXFUcfg7eKdSMyU++rH4fvXdjaQB8Bwp+tyBvzlTSdAj8CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ev7S1GbL; arc=fail smtp.client-ip=52.101.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ev7S1GbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep98I6oLCcbUddqYGaOlm+VtUPoLE8eIK+aN6jpRhoMycn4TwAe/FfPGQOPsOaCee0qgT5TZ2yTzz4whktMMLXEJnPzhyNRPZ3QK6NJlelkmG3Pw7il15m1Nd+aYozTPM9xqxSWkN0XZIXB1Jss43cdeODOZGWUZrq5PgiKkAp5uscAJVgU9xRTFsCPS3iDtaDHdGbdzeoobYonNb+da6/2mlYhs0LyrfLqIK0FBQz2wljBn/giO5EJIM8AFVoHM/v3a7Zc2TQyEaGw6Jkb6HdvyR0m9naxf7OBnFhaA6ox+pPTCX51T0mLYG/E6KDhnFsK2f6vnyC9wO9xqwu9s3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImANsdcxyNymVVjTiHCGr2FsQXgsoY/pesH93UAnfRY=;
 b=ASzVIB74niXlJXb47QlWS4C2X4spMfIwBQboHOaFsFd3UEHd9s93boW9qWgLpjMKaCfnbgMaTI36f+RSD2yUx0iI9v6maJAlV3d1F7k+xKXLPhIJEe7yyZQ686sP0uk6Lm8SN55Jcj9Cg+WdlD7J5lC+PuWDAQFXFimkCMSOXb0OQW8QhbvGlaKtcBabwg+kCOseO1JMfvIxeqgnM2IcSfczyvGSm6o0vWdx78JT+pGHXTQxZiuM+p0Y9Hic92ztn2Z4rmiLpIacIBdqGjn+/m1V5fLmf0Xc/ygdwvlFVMZ240HDYzgUji3zG+lSOw6SFNHH1qFJ4BL1ARwUFbYacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImANsdcxyNymVVjTiHCGr2FsQXgsoY/pesH93UAnfRY=;
 b=ev7S1GbLFHA14if6PhNXVIRHMf6L2ugfpvdLVK2pMNaiOWpKrXS8rUorOQsfNawjdQ/VvaHz7u3gl7441SexGPhbdREMP2Z5Nbl5iA5T0kKg/achlw7iDzZrMdVpyVzJEwKmppAIrcK+nuMTGePC2pYggP6yX+BDssPA0LvPlRISE+iq0ngVSffit18lfwEi5aKwGgUypvjJdfPr3LVYnzv38xl0mQrG+DSzdyB2GeNYWl6NJJJ4eXc8BTBGiom59mN+aI1rZuV/guvMFaRJVAHX7DhfW1m8/nxiFPbFhdoXMVaTxLeBBKieD9vjQdamznc40KRade2djIgMmozF8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:20:05 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:20:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 22:20:01 +0900
Message-Id: <DLMQ5TVNFSC1.2AGU37ACR0Y9Q@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions
 from a count and a slot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-9-jhubbard@nvidia.com>
 <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
 <DLMNTQWLGXJA.39Z56H8BZMBPR@garyguo.net>
In-Reply-To: <DLMNTQWLGXJA.39Z56H8BZMBPR@garyguo.net>
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 6805712a-d068-47ce-15f5-08df1975616a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|10070799003|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xvsJeelLrG55QhCrgKjEVZQurW2fpinisyBiVZdD6EVCn3YEAXjRulr0a8o8zAKVDzKqgpFb2LmytIAItcLF6Liw7xAZG3xzXk06Sozz12IUsIhB0zvG4PNkZDWtP/p/lENKWdJQxS2W6Y1EKsWfy9IpKz2owPyE2HrPT7RJ1MyECwmrQknP5iDpEb5AX5C0+YS9rfVgaRknTYRXL93AgzrCDsx/+5/m2KkYfXlT5arbewgLhOB/PAiOwQLmoTACmRLU5itFo0TcFtFxIYrAFL3ntRnO8tPwGDAvVbANXnrYJwZBxwwNYHv8q+2ga3JENejWBEnB1FIYKxBlRuCScCTc9a27lLZwxs8Dha9VpMv8lHDCsXiFr9rAyQT+384KwMHeHdLQglD4GUlA1AWyanCUKmAMDGAI760TngA1hGLeFWQPIr9V3wCbqEH905BUjzJ1KAzaOkuAmP7KTQZTkGFvDb7KOLKE+vsMbhlut+IG21b90f74R+SiqkRb3DGh/05SAIwt48dOSyXQWO03uVU0G+r2FfTXQGVR8HOQmCwjG5QIOhOiNon6wFvGWCofzIxZc29bClfvZ6XaJSuxD0+c2v5Wzys2xFWeNwm58Cops+bG3TE6NonoJPiD+G6pYyKPqra5FzReftW0Mr2c2bhr905veXkB49Cg2jKEx8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnYzRXlxWGdoS21DbnVTRTR4VjVyQVNpSTVZc0NLTW1pbFdaWS9QWWZtQUlt?=
 =?utf-8?B?YWJvdFlSa3hTZTVyU2EweGZ0VnMrMGVXZk9wTmVxaUpMRU9ScmlXRnVqbUVw?=
 =?utf-8?B?WXFTVkFrWGU1YzhYYk1YMlFyZ2MrZlQ0WmdxN1pRQ2JEWFU5c2t5MnRLV09L?=
 =?utf-8?B?a2VuUjZPUEoxNm1nKzd2cVJLdFZjSld0d25ta0srKzBvY2tvMHRTdVc4Ym85?=
 =?utf-8?B?N3NONFVTVUNxTm4ySmU3cURyemhlQzhpMXhKcVdXR2s3eTA0REdlbEEva1A5?=
 =?utf-8?B?Y3N1a3hCUTZrRXdUMHV6TEtnbjJaSS9IYXRlcXZUVGdSdG5VUUwzTStpZHJ0?=
 =?utf-8?B?TGk1aHp4ZE9URXZtaGRXWW1DRHc2dXJlRE1WWVhHOGxJMndGWHdoTHo1b2kz?=
 =?utf-8?B?cE1FeHFqRUgvSXJISFp6ZlM0MWQ2UWRRZ09OdXg0RzJlVEs0L2ZGcmxzUEFM?=
 =?utf-8?B?VDN4ZmpQMGx3enBOa2QzZXc1MHlwR1YxczJWeWpvSm1VMXJLYm1IY1FXU1BR?=
 =?utf-8?B?OFBVdm1TaTIvYzc5bUFyQXJHK21BSkpjeFBEVUJ6dFcrZkVmcFdudTd1OEVM?=
 =?utf-8?B?SUJJd3dONmx4cmtWS3l3enQ4VGQ2ZzFQQTZxejdqcllJSmxxZ3VHZWhLRHpU?=
 =?utf-8?B?cEpUTktpMENJelNqb2hGaTQwczQzYnIrV0V3YjhJTUdyTnM1MWxIR2ZPd1hR?=
 =?utf-8?B?YlhFU2FaQU1OdXdsSXQ1cjdwTnZpUitvZE9JL3dNREZ2RmEwVnl4ano1NCsz?=
 =?utf-8?B?K2ZzNGtYckdlMFd0c1BCc1UxUG1tbVJQR3RCMExmajFFNEZwOW5ETlhNY1VT?=
 =?utf-8?B?M012bkU4RUdsZGNPcDd5bm5HQk5EcTlCZUdtYjh3M2ZsL05DMkVLODFSRGti?=
 =?utf-8?B?VWV1RUhubEtCRW95WDdZOEpQSXhMaVMxdkFkZUZ5MnNIRjVSQ0tXOGtSNzRX?=
 =?utf-8?B?K0VVZVpsZjhBVll1YkpjTEtyQ2tXZWpNVHlMaFI3aWNDSU5FckM5azB1SXdv?=
 =?utf-8?B?U2V2S09DUExCQUh3akRObDIwQVdLTWEyY0dLUFFrdUQzSjAyL3ZrSnVDb0Q1?=
 =?utf-8?B?V0tGbVlVUkRaM01YZVBCdGN0RmdkVGxvUEFlR1N2bHkzMUV1MStjRlVtdEl5?=
 =?utf-8?B?aXBHbFZyRHc2U0o3WlhVVkpLaDJDU2Z4ZEN1UEtqV1pLK1NLYUMwRzc0VkZ2?=
 =?utf-8?B?ajFzMWVsNkJLTVNZbnpRK2F3bE9tN0VjclFZSms4dlZwNGpuYjVhYVRiNWxU?=
 =?utf-8?B?d2Jzd3BkRmpkYlVCUEJrOXhmaHVSejRqam9hNUk2c01lRFFyaGp6VGFIYlhN?=
 =?utf-8?B?MDJRd0pZa1AxY09hcjhldEJ1OVhaV1Y4YnFkS2crWVJLUTZLdlptVnExNjFT?=
 =?utf-8?B?NEpoc3lZdXFUVXNtTmRrU2xiaE1RcDMrYS80NEpLcjNLMS9PZ0EwR3MxcmZn?=
 =?utf-8?B?dStwcXpQOGsvQlRwTVBDZ2IzMzczYXY2S2V2T05sNmxtOE5DY1RCR1R2cDRE?=
 =?utf-8?B?VWRjVE5LSUpCenM5RVhDMWhLWEdIdXk3U3hVaWl2NFE5WFRYdHRZeHhDQWdQ?=
 =?utf-8?B?c3crYk1oWnE5cFNaUXd0eUZGdnMzbkd3blVoSjdCMkh0WkU2MVhtK01XdUxu?=
 =?utf-8?B?VEJTUnVwZTUyeVlDZGhpbGU1a2JNbDJ3NkxNck5GeFd2TGY1T0tCb0IxT203?=
 =?utf-8?B?UTNZbkhrYldVbFJhVEM2dUQ5T0NXeG51Z1VwdXFQZldTdkNZUlQ5NE01aVlS?=
 =?utf-8?B?c3hJb2tnMktYb0M2TTMzMnd3cTJnRG5NQ0JMd01JdFhJMGZmRTIwWjZrMTVL?=
 =?utf-8?B?dEhPYUcwWnZZM2EvK1NOQjIwbTl6Z1RselIvb0NZckludEl3REh6ck1lcXNt?=
 =?utf-8?B?V2ZmMDRpUVlTQjcwVmRhcFFDR2pYd0Q2RDR1bG1jRzNQWU1TbFR4d01CSzYw?=
 =?utf-8?B?dnlrVDlKYTVoT1laWEN5TmhXT21WUDg0YVFuUkg2M1F3NGVielRLNHFrTi8r?=
 =?utf-8?B?VVljZnQ5aThJb1E0NlBUaVN5bU5NMTYveE5jSEJCMXA3b3lZM2JWbHEwSFdt?=
 =?utf-8?B?bDZHWnArTzlSVU5HMStENktwQ1dveU1QWFFTcDdaaWNLMnAya3JiZzRqa3hh?=
 =?utf-8?B?dGlsM0RGbENrTk5zbnVXOVVsc3NtVXI5clF3azJqV0Q0YlZhSUpyTFc2Vk1s?=
 =?utf-8?B?NzNDdUVWVGhYL3lWRUhTeUMrcmJiSldQYkQ4WFJYRmNBMUkzSHNKeVRZTjZ2?=
 =?utf-8?B?VjNhbENtRnhRWk9ScHhVWlBPWFBOUFRMZlQ3Q0RCSHJ3dy8zWXBwY2xTYlhi?=
 =?utf-8?B?cVlyeDBLcTMrUU5CRzgwRVlBazdtbjRpSll2Z0g4dnpxNmlZQnRnMk85UjAr?=
 =?utf-8?Q?M75LEDuhFFqjB9BzxBexr3zRPco4P3gp84gbl0wzn/Bwe?=
X-MS-Exchange-AntiSpam-MessageData-1: EMwi1c9Pz2Xn7A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6805712a-d068-47ce-15f5-08df1975616a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:20:04.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgjEzN6m9qYEhTfXXh8R3TZvnCI9+eJIHWHeE1fXKFpUqQSMNIdl3Oe40n2JYmoVW+DSe1XzTMWaAavs2O7/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985

On Wed Sep 23, 2026 at 8:30 PM JST, Gary Guo wrote:
> On Wed Sep 23, 2026 at 5:55 AM BST, Alexandre Courbot wrote:
>> On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
>>> The r000 firmware uses msgq v2, the queue layout that keeps the queue
>>> pointers in BAR0 registers as counts that do not wrap at the ring size.
>>> The r570 firmware's layout keeps the pointers in shared memory as
>>> indices into the ring. The two layouts differ in where a pointer is
>>> read and in how the size of the region that the driver may write, and
>>> of the region that it may read, follows from a queue's write pointer
>>> and read pointer. Splitting a region across the end of the ring is the
>>> same in both, and whether a region wraps follows from the order of the
>>> two pointers.
>>>
>>> The functions for the writable region and for the readable region each
>>> branched on the order of the write pointer and the read pointer. Each
>>> branch chose where the two slices ended, and the function then built
>>> the slices with open-coded pointer arithmetic. The SAFETY comments
>>> argued the slice bounds branch by branch, so the switch to msgq v2
>>> would have had to rewrite the branches and the argument along with the
>>> pointer rules.
>>>
>>> Compute the number of slots in a region and its start slot once, and
>>> split the ring at the start slot. The first slice ends at the end of
>>> the region or at the end of the ring, whichever comes first, and the
>>> second slice carries the rest.
>>>
>>> No functional changes.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/gsp/cmdq.rs | 120 ++++++++++--------------------
>>>  1 file changed, 41 insertions(+), 79 deletions(-)
>>
>> This looks like an improvement regardless of the r000 switch!
>>
>>>
>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/=
gsp/cmdq.rs
>>> index 80e6e79c5f3c..a1c9b7cce255 100644
>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>>> @@ -262,107 +262,69 @@ fn new(dev: &'a device::Device<device::Bound>, b=
ar: Bar0<'a>) -> Result<Self> {
>>>          Ok(Self { mem: gsp_mem, bar })
>>>      }
>>> =20
>>> -    /// Returns the region of the CPU message queue that the driver is=
 currently allowed to write
>>> -    /// to.
>>> +    /// Returns the region of the CPU message queue that the driver ma=
y write to.
>>>      ///
>>> -    /// As the message queue is a circular buffer, the region may be d=
iscontiguous in memory. In
>>> -    /// that case the second slice will have a non-zero length.
>>> +    /// The ring wraps, so the region comes as two slices, and the sec=
ond is empty unless the
>>> +    /// region crosses the end of the ring.
>>
>> There is a recurring pattern in this series to drive-by rewrite comments
>> when there is no real need to do so. The new comment is not even
>> marginally better as we lose the temporal nature ("currently") of the
>> borrow. This creates churn restating the same thing using different
>> words and disrupts the diff, so can we avoid doing that unless the patch
>> actually changes what the comment describes?
>
> That's a pretty common thing for LLM to do :)

We're lucky that one highlight of this revision was to remove AI comment
churn. :)

>
>>
>>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &m=
ut [[u8; GSP_PAGE_SIZE]]) {
>>> -        let tx =3D self.cpu_write_ptr();
>>> -        let rx =3D self.gsp_read_ptr();
>>> +        let avail =3D num::u32_as_usize(self.free_slots());
>>> +        let w_slot =3D num::u32_as_usize(self.cpu_write_ptr());
>>> =20
>>>          // Pointer to the first entry of the CPU message queue.
>>>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.ms=
gq.data[build: 0]);
>>> =20
>>> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
>>> -            // The write area is non-wrapping, and stops at the second=
-to-last entry of the command
>>> -            // queue (to leave the last one empty).
>>> -            (MSGQ_NUM_PAGES - 1, 0)
>>> -        } else if rx <=3D tx {
>>> -            // The write area wraps and continues until `rx - 1`.
>>> -            (MSGQ_NUM_PAGES, rx - 1)
>>> -        } else {
>>> -            // The write area doesn't wrap and stops at `rx - 1`.
>>> -            (rx - 1, 0)
>>> -        };
>>> -
>>>          // SAFETY:
>>> -        // - `data` was created from a valid pointer, and `rx` and `tx=
` are in the
>>> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_writ=
e_ptr` and `gsp_read_ptr`,
>>> -        //   thus the created slices are valid.
>>> -        // - The area starting at `tx` and ending at `rx - 2` modulo `=
MSGQ_NUM_PAGES`,
>>> -        //   inclusive, belongs to the driver for writing and is not a=
ccessed concurrently by
>>> -        //   the GSP.
>>> -        // - The caller holds a reference to `self` for as long as the=
 returned slices are live,
>>> -        //   meaning the CPU write pointer cannot be advanced and thus=
 that the returned area
>>> -        //   remains exclusive to the CPU for the duration of the slic=
es.
>>> -        // - The created slices point to non-overlapping sub-ranges of=
 `data` in all
>>> -        //   branches (in the `rx <=3D tx` case, the second slice ends=
 at `rx - 1` which is strictly
>>> -        //   less than `tx` where the first slice starts; in the other=
 cases the second slice is
>>> -        //   empty), so creating two `&mut` references from them does =
not violate aliasing rules.
>>> -        unsafe {
>>> -            (
>>> -                core::slice::from_raw_parts_mut(
>>> -                    data.add(num::u32_as_usize(tx)),
>>> -                    num::u32_as_usize(tail_end - tx),
>>> -                ),
>>> -                core::slice::from_raw_parts_mut(data, num::u32_as_usiz=
e(wrap_end)),
>>> -            )
>>> -        }
>>> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries=
 of the CPU message queue.
>>> +        // - The returned slices cover the `avail` free slots from the=
 write pointer on, which the
>>> +        //   GSP does not read until `advance_cpu_write_ptr` publishes=
 them.
>>> +        // - `split_at_mut` gives two non-overlapping halves, and the =
`&mut self` borrow lasts as
>>> +        //   long as the returned slices, so that no other call hands =
out the same region while
>>> +        //   they live.
>>> +        let data =3D
>>> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as=
_usize(MSGQ_NUM_PAGES)) };
>>> +        let (before_w, after_w) =3D data.split_at_mut(w_slot);
>>
>> This creates a reference over the whole ring, including the parts owned
>> by the GSP, which breaks the `Coherent` safety contract that the device
>> must not be able to read or write to a live slice. So we'll need to call
>> `from_raw_parts_mut` twice, with the correct sizes, instead of
>> splitting.
>>
>> (also `split_at_mut` is panicking and should have a `PANIC:` comment
>> justifying why it cannot, but once the point above is addressed that
>> call will go away).
>>
>> I wanted to try it locally and ended up with something that seems to
>> work, so let me share it to save some time:
>>
>>     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut=
 [[u8; GSP_PAGE_SIZE]]) {
>>         let avail =3D self.free_slots();
>>         let w_slot =3D self.cpu_write_ptr();
>>
>>         // Pointer to the first entry of the CPU message queue.
>>         let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq=
.data[build: 0]);
>>
>>         let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
>>         let in_before =3D avail - in_after;
>>
>>         // SAFETY:
>>         // - `data` was created from a valid pointer of `MSGQ_NUM_PAGES`=
 entries.
>>         // - The `in_after` entries after `w_slot` belong to the `avail`=
 entries that the driver is
>>         //   currently allowed to write.
>>         // - The `in_before` first entries belong to the `avail` entries=
 that the driver is
>>         //   currently allowed to write.
>>         // - The slices do not overlap.
>>         unsafe {
>>             (
>>                 core::slice::from_raw_parts_mut(
>>                     data.add(num::u32_as_usize(w_slot)),
>>                     num::u32_as_usize(in_after),
>>                 ),
>>                 core::slice::from_raw_parts_mut(data, num::u32_as_usize(=
in_before)),
>>             )
>>         }
>>     }
>>
>> It has turned out quite short, which I like! I also opted to work with
>> the original `u32` until the very end, as it results in less conversions
>> overall.
>
> Possibly take some thing from the old projection syntax rework series?
>
> https://lore.kernel.org/rust-for-linux/20260415-projection-syntax-rework-=
v1-4-450723cb3727@garyguo.net/

Oh yes, I forgot about this patch. Do you mean using `ptr::project` to
create the final sub-slices, or am I missing something else?
