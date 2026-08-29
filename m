Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED1327BF8
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967313; cv=fail; b=AE750eDJQqdY4VY89mA9p57Fj07OxWeFOJKsCZuFXHfdrvOi5aWbjc986BphtNOOjcNZYbVwsHrNayv02dBoc5tl8qU9fmmSqGE6Oc+ztUAUNZXwJZbKSFgB3Z8yTWOwdRsO/MY/UNgUovWYlPMIfIuSxXgYjzDQZHY4hV83VzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967313; c=relaxed/simple;
	bh=YFAYzF+YOno28oAWEFjb+hTQiBQ8bCmbtN7UlPNtV4w=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYA98nwdCuqd7YcMHNrjRXEiUE8HYg+/B9bIaJ6UZErWJGs+daSdItuFDGe+Jj9x5YnkYr+SPW8UVxUdlOwHWHlyRWRVz+l8w/SjOnb8TSWqzUejqFoRWcyiZTUn9s8majExTjdPTiB7iljwGjb5PDKVLD9AircY7dYVCE6dJso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AF9+RUA6; arc=fail smtp.client-ip=52.101.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AF9+RUA6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl3+Y347A3NDtrgUW26I3cYcYHmzMiEj7FLQ4JCGebqCoA+Uh7bMvhu3mbjROiQBha1dymGHHhPx3zX9EBmSxQDPR3hZuzk7QW7BO61zMfnrBfa10XI/VxbPLpKu4XBKI9s9XGctKnxR8eGOp8UiVQqI7KNpedlRfMuTjd6Hgz772PPGpwpV1+vd5BJGDcEKJ8HaFTbMZXnpG3tXvI0M8llJ5Tq8bZOmS4HLFE4L1dF8F4B5nVhMLrlb+Wwss3c6MD/06nN/cKuuy+jbD4o0lidYOHxp+ticGn/826nBRz3w3A1qbSOr48JsR0XPxE7CXGAQmWY2vXYbxTqHQl+3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNML1lLMhkLv/tMQCO5HC2oCphj2TvBN8CvqOy3UHL4=;
 b=c66uMw9uwi0Q+0GmZTq9dx+2lb+UMT55dgsHr6JQNhbZXbJCFX2EtxI9AfdTXQ5rM6PprGcamqb/Sn3cUj1Q3hNFI+7U0KH/m01brbuDLpd5uhrjCJZ8omE0YPYRFYZzyEHI/rqb6C7wUd8tczo0qAFbBZ/Lv9iwFb40qL50Nd5CNm4ElvCvJM6E0WXUMxH6QNE2wg/WlFrWl59t42o1Yyn5L0qVBPbyvHDR895+LTG+wwQKgMxhEnsSwnGQOXZ0u/Wb24OKgH7CkLLQ1YzxIkcRLju0VT//1zBSuTdN62fge/n0J/yexEnyppMwr07ff/dyj4veB5kd1hngZoKD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNML1lLMhkLv/tMQCO5HC2oCphj2TvBN8CvqOy3UHL4=;
 b=AF9+RUA6qOVHSfp1owoXMiaXGQUR9q/Ecj5Ke+LVZfSlFNWndp82l992kNg6BCbszuIVa756vPGj3rrdPUN2M1m/uttg4EIa+XR2CR7DtgMEqJZ4YkjsIC2DGabOcqHykfw+uB+Jpb7bG42eBPy38MORkOQRrWH4B+SnqyO7psUg8DH6PLGbF+LMopQYNO/T2SQkjc+0mhqbNMRagNmNPpPtBqFS57T5wMytkuk3x2f4oCZODw2ivjinD/BrcFZUmNZoelSg3LikOvr4KBiEgsK3NLgaq5ozpWAx86/q1l8Japz8DmxBEP7pf8o6eAs2qlHP6KVCYn8dI9Lkq6TYcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:35:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:35:08 +0000
Message-ID: <60cc5acf-e51e-474a-ae78-38c2fb14a55c@nvidia.com>
Date: Fri, 28 Aug 2026 18:35:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] nova-core: GPU interrupt support and GSP event
 delivery
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <1e7ac24e-5a14-4324-8e3b-a84f96af5ec2@nvidia.com>
Content-Language: en-US
In-Reply-To: <1e7ac24e-5a14-4324-8e3b-a84f96af5ec2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: adb5ffe6-39ac-498b-7505-08df056dc23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+VXba48O89Mg/zl+DjTVrQytd/zzOu9gO906Quo8U6daM5k9lHowPzHLsDxbHsUiXwfl0yWl7dJtl3azcLWPcrBSMEN4CZV4rwSUDswlmwhBprwCO0psbgT75X0EKugCzibjW1w9F+0PXtcAzsRuBnnOtfKI7s/Wldsh7McqCe8iyYN2YELksruVjYGuPH/qHkDgD2Fp9Ysj2GNo8AG0tGHO31iZFHHq4D5XzHZgJHn+wRbuZgdN//XYKs3tkRj+tu9xDvZt8NZ2hXKLbYZjLi8y/kgzpE6LwJJLtvy2IM3/8XPX143pTVTlxCN8BmP2LhJ0LdFwiaYyHU5fz960mvfo1BTHcGMyZAyg9tb1ybVTGfwU7sx8C/QOln7HCgcgdsmhcZl0N4CUhuSF1Qk45V3JnpuSs+rDLBNFYcUg6iqQD8jHKG3I7U40paFt6DNRL/cLZJDj+waljZXzcvn32xHXnrylJnRNKufEysWo9gSI1SokJTyu4/4GBq/GgAt/JHLTHI9B+AFopTLIwLC62oWo97UNE21p1Pdy5uEQ9OeJhiUWDdl/NCeHQFpTeA/kqaWLx2sVxnyeu7s5DevogMau+yZwXLoF99Hb0Yz/E6NeEYgEvOJnDCjUu9K0YBojt6w+elOpnV1XMdG8dIBWf9GPg7nVsdQcfnGSKguy9tI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VHTFc2YkxVbTh2ZlovWTM3eVI2ZGFFc01lQmhOVkVpeXZtdmQzYmprbzkr?=
 =?utf-8?B?RmVMblNZOC9UR2dLU1NSM0tZTUFxdVNNOTg4UDY3RWQwYy9KTERNVm4rdzEw?=
 =?utf-8?B?R2NzM1RCNExBS0FpTlFqc0hQSmpubWllYlc1T1I1V0I3QmgyY2hFRytFQ0lK?=
 =?utf-8?B?STF0djI4c2x4ZzhxVmZ1NDd0VzRadmliMG03RFZocVBvTUN5QVlOVTlocEN0?=
 =?utf-8?B?ajB6ODAyaGNqWHVGbGg0TGVDRHIxWXZQV1IzMWd1dWRzMjJDSHJMTzhoWm1K?=
 =?utf-8?B?MHNZQzJjQ3h3SHE2cU1MclhiKzRBUlRUK3IrQ1hQYm5BUmxUZTlZWCtQYkln?=
 =?utf-8?B?QkhhSmNyNDdPYW50YjNhU1VmM2dUTjFJYTBJNVJhNnNxREc5NVZoOTY5SWpU?=
 =?utf-8?B?ZkV3VTg2ejhFYUZjYnlVbDhjMVhOYnVQRTlNcXZQaURFYVBCQkF3bXhXME42?=
 =?utf-8?B?SnlxS085RkZPRVNwbEpZc1MwVnl5aUdwQ3VWVzVnYjVzSXAzSjM1VWF5YzRR?=
 =?utf-8?B?U3dEbW80cGV3c3hGQkhBUUpTRUJlVzY0MytWcFB6RGdhNWR5US95SnRVRlNt?=
 =?utf-8?B?aUI0VXVZeDJCVnh0WU5qTFdScnJSMC8vZ3l2ak5hRmsrOFpFdFJ1QnIrZlky?=
 =?utf-8?B?RnNGTWtDSzZLWUNyU24wdHpYeG8rMXNLNXIreG85L2l3RW1HQnlaQlk3MFJR?=
 =?utf-8?B?K3VIU21iRW5zU1Qrb3dWU0NXdHZ2SzdudkpKUDREMlBsZ0FrRU1Zb3NYQTRj?=
 =?utf-8?B?bUVYcndsYi9YWWVqNnJRZFRBT09kZlZLYWVpWlR2bHZGSkhUVUVySE11M1dr?=
 =?utf-8?B?aGRjbytuR3duVWZoUEF1dE9YeHNGWGQ0ZExMQy9GTkZWREJSZ0hLNm5uYU1B?=
 =?utf-8?B?NFNNeTRTZ0VVVWdHNlpoTzd5bXpZai9OS2xVbWtBbTdmVUFLZVhzdDhkZFlq?=
 =?utf-8?B?M0lIank1bW9rTUh3SnEvVE8vMEVWcUdVYWtidEJ1TUdGUTRZMUFZOTNLMlhz?=
 =?utf-8?B?R2dRY3RsYlNYenJqM0lxWlB1OE9Ed2J5OXFQT0cwTDBjc0RhU0w1enJXdk9y?=
 =?utf-8?B?UDc3Vm92cEVqdnhmaXdqM2kvcE1NaVhMVkxUZjNpS05uaGRjaGhYWGV5dWd2?=
 =?utf-8?B?VlEyT2NieHdER2lmMVZBc3VvSXZhRkREaEUraTEyNnRBUzFMZkQ1Q0VMbTBP?=
 =?utf-8?B?c2VodWhySTNzUzNrTUd5MlNsckZYajhoNWV4K1ZZSEF2SHVoL0ZZWkZBdlpn?=
 =?utf-8?B?bHFwSkF0d2NlR3pWVDhPSjFEWkljS2lwNVNoOXViUFVJSm4rVDZEVytyRGpZ?=
 =?utf-8?B?ckVMcE16QktqUENieWRRMVFWMDljYjhnMGcvMDN4WHZWeDU1dGxqT1VXMGhU?=
 =?utf-8?B?TlR4Nm85L3VvTmtOTHM0bXZjRC9qb2tJYWptb1NtV3NzTGhlNFpCeUNyN3F1?=
 =?utf-8?B?bWFSZXd1Ym1hemVHTG9TUHV1K2hFc0RtRXp4RExDekQ4V3M5ZjlsUTVIM2Uy?=
 =?utf-8?B?QXRsWUMxRGVMbWY3RTFnNDJabzl2YUZ5WEMydTd2ZE9wcTR3amVJREZ1eHdX?=
 =?utf-8?B?T2N6dlJmdHk5bzdCSkNuUEg5RkpOdnR2WWFYWVZlWExOQmQ2bmN6ZEczVlox?=
 =?utf-8?B?TEMxemdBS1VobXZHaVc3dkx2amlxQXE3UmxiRlpGbjNhQStPQjhkNlVZR05i?=
 =?utf-8?B?SHFZYUtCcTRieG4rQStObDBibWc5UXExQWxsYnplNklUNUdwc25meEN2akxM?=
 =?utf-8?B?cTFVeHBrd2NsMllyeDkyVTRlNzZCY0hiSmdUYWJhU2tEUlVxM1VvY2VsbjJZ?=
 =?utf-8?B?SzZkQTJ3WCtXWUk3d0Y4R0NlU3JmUFd4dU1JcXd6MUd3V0Q2MzcvMUpBQzdy?=
 =?utf-8?B?RCtmSG1lNXJpR1ladU1PanRidVhkYmVXQkFuZjNmQ1lzSjNISStwa2c2MFVy?=
 =?utf-8?B?NkRYajY2dThMSWY0TG5xTk9RZlNHdW5nSVdxY2F3S29XVXczUHNJbFJMMmV3?=
 =?utf-8?B?Q0h3YkxjUGNsSkxpdXVhN3ZiTEp3MHJNMFZiZzMyc1V1S3JvYmNISXB2bTYw?=
 =?utf-8?B?WWZKL1NSWmpTNUlNN0paLzgyVXhsNWtsZDQ1VXQ0L3FKYUJMN2RKOU82NlVp?=
 =?utf-8?B?YlJ5WXNnaE52a0ZxUVA0b2J3c0E3MVNHQm9heFUwS1RLMTNpUDVUVzQ1dmJt?=
 =?utf-8?B?VkNSVzNKeGtEUDRhc1JzQ2I2TWplajBVbk1CZ2I1Wlkydk5OVThQUDRDZFFF?=
 =?utf-8?B?Vk9SemZGUlJqS0tVQmMzek45eEx4eUl2NUpWcWlHanozSVltQjRLVFBHQXJn?=
 =?utf-8?B?SktZMGxWRkcyRGFWQzcvNnNYeUlxWlBKUEpzZ1pTNEZreFRjL1Nydz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb5ffe6-39ac-498b-7505-08df056dc23e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:35:08.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTtasE5aGNOGDxUNK9PsIcOpAmwgJErddc+vKwcQV00dANelv1icFrF55u6RYKQQyqmlkGpZ/JsaWPmDLFweFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

On 8/28/26 6:25 PM, John Hubbard wrote:
> On 8/28/26 6:22 PM, John Hubbard wrote:
>> I'm posting a v2 because there have been some significant changes, as a
>> result of the v1 review, plus Danilo's new IRQ commits that I've rebased
>> onto.
> 
> There was a failure in git-send-email part way through. I'll attempt to
> resend, once I figure out what went wrong.
> 
> Only the cover letter and the first 4 patches got sent.
> 
OK, it was an unexplained, intermittent failure, so instead of re-sending,
I simply sent the reset of the series, which worked this time (!).

So the whole series is intact, now. whew.

thanks,
-- 
John Hubbard

