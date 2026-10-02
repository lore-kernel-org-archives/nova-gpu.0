Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1153E4534BB
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938537; cv=fail; b=XctT8P02Tx9tPl3STv5JGNOLVeZh1blQ+D6dXkwwPhR8jM7IOjP3JCpzZyz+OvZcnE2njs9kHoN9I5kWREMxYAPVB3CxtkZri+ClmFiOTSg5uqfsFq1T8u9p45nYoBaNAe+8tYpew7oUsv2NLFYQhXnK0r3dLfhMChe6Xy9LfSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938537; c=relaxed/simple;
	bh=l09Iu727X3ATfs5R6UkjSJcYtWbIzRs4LcpCvvcmehw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=mvI8tWe1TzRPSkb5Gu8eBdztRGxrs2buvAahuYcGFCEkD3e0XV7jtgYtU2WVRj48ZITzZOo8hgGzV2poSQUWfTD6FiiCmfh4ODZ9emdr9awQxCtLFGHiZ5VjsNhaJfCTsQyTR0rlgST4A2gNV96k/J/V6029CJQSS0nPZG+vyg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SwF2Vysy; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SwF2Vysy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhGiIu69k0TuSU46odnPpWmTVpztzTAWlDZrEUBMGGUZXykTAUYWI1YYPOgakSA+73PVnVCdLE1q29goJB61ZdM4nXNpf1m4G6I5eINl1/zSRxvvxrAf93S+3HOj/ctrqoRxFFqesWBmx1rRLnXSYXVm6pWdonYU7OPUKPA4CIeACf2iMiEn/yYxUSt95eg3aE+BbaqAuiAf3j+YsGJzQ1FPdUMJuugHk3fSvzf3RPIXCrsJN7xZVozv7x1JEjdmjAG1O9X+uSl/MxBP43qpAFvnSckSQnujfc5kW2tFs7X9/pBJ9bJjY8JGBt6ZTWqflcEvLtg9aI67utqmwW84jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znVCw0HQ592BYFegJjIsVcfyDjzxiGrNW3H5pxPnYzc=;
 b=rUW0bbWakKTSLbTaqNJ3Nx8JSmB05aKEUHYhtKuJPVq7K/xvGePlLVMZvn/DJSpU/7p6VrlQOPEGYEpFCrHEBzyBKWVqPKESeQhWlHkAPfjbM5bJSVsDWqPQELe+H70D5FzV8NLfQ8qBWoOaAFh7HwsAIUMxo21oM//WekTaa+q5fYXpJDIaYm1FLmKJm1V/Ll4uRmOl+2LOqV5FBpU0bbAWSaTtBGe/H6ee+oNSomFxtVM494kXqajEVEFjnAvzIMqPScPuyWNpMQ949MvTnh+qFsWjPAvKxJOVhxfXxhSagVpZuUYzuxNwDlljr9E/bvgZMvCKu4bUbCj2hH1uLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znVCw0HQ592BYFegJjIsVcfyDjzxiGrNW3H5pxPnYzc=;
 b=SwF2Vysy0FQkV+lAwMTkGaY33JoQpM9Kp6l34DZgfDH8z2zpDvsDs5I3gDqw6Z0VyRN1flRHivTVbamWpntnZg9VViCfiX2JykFBEISRmbGNswYDEBrwfWAZwzFMjm6kPexFVypKH67ikP/xLM0tsKmRhL8KBaKE6o/Cd3EdeDB6HBQgwDF4ynfK3zAhj6Ma9AoBhvC29xaOlG+H4gaIRh5SSu4wlcLdRdFrSRAhk6wiX85PIeerXg1cHBvUfLyZWSIMevspwiguLrwcUmtOhxJbeJL/EvcPyIuxw/vQfAy0EbMKcOdMS0uF/S8/KR/F5uuxm6z8xKqnCXGWaTkYqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 10:55:22 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:55:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 19:55:19 +0900
Message-Id: <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
In-Reply-To: <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: fab85290-ef47-49d7-a6e2-08df2073a7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10070799003|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xLhUNPzCBTr2oKjyfo1VmPNz10rfWUna4fVvJdl3KWUHyIBW/hRkclICo/5VnaDiE23CFQQIHAEl82QvN6U2FzoLtO/daMk8kZ089+D++JjBgiLFWdM8Jds5yGQUGhsCjL0znYD2cddVvvwj8RbFNScJDVLbcHJyQAu8vbTzTx00YQlDCKWdx82UvHit21HoIULLI6RKROQ5zS1tRACZrtoc4hlirvHJur8CRp9BANLiyj51ajphEYdTyP+8pN7OVCvvBYeaBocH8K8/xRv1Bzgw4QbJxmXAeckL9xcTvaXC317F403b1klUfID7uKCH6w5xurD+pM9Ylu3htieFqIA2sjCgaz/69qX3jXdircjc4MX8auMXdosqjl//pOkfXCjf96g3M8X+7QQgrrcSJlnrbCbXhMxBqMSd3B8leesTZFJLR8iyvVdD3OEtkOJq9hvWtUcPFGk4ki7UOrlGOgvdfVJJCB11K/f65BRVs7YXK0Q+RM6qCMVPhXJ7kfnKIeFGdPsouU/ilAR/kH4A2Bggf+QDq28gvVnE/luVfhvqqfgGYcpiAy1iGsoVq1XVHKHA+MLu1XETxbf9V09+5kre2GtzpqlNR1v8/b5jYqcrG29/4vHAAA9o7XIqCwvQm6fnEDfI4kSPkr3vJ0JD7y7nSadZGJNvut03xxZvg9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10070799003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBRd0ZOMDNjTEU5MjZ3TWRpSnRiajJaaittT1dwSHFWQmtpOVI3a2gzUHcz?=
 =?utf-8?B?WkhuNWpNcURnZG5Qc2tiU21mUVhLK3BiZFJqcHZLTTJoN1M1cjRjZEI1c1VH?=
 =?utf-8?B?M0xtL29aS2MzeGxzZTUrK0NNVHhsV1NBYWJpZjN2ZE4rN0RDQ2VGSGo5TmhM?=
 =?utf-8?B?WXNhUm0vekQreGJRVjhxNUVmZFZ2TlZxamN4c2doUjBlZEVvQk9UcUw2WEht?=
 =?utf-8?B?VU1qSXNtbm1ITHF0RGt1RmVxUTF2dG0vanhmTStBRmNSUzhQRmwzS2hFalVj?=
 =?utf-8?B?cTZSZm96NGdtV2dxckxGUUh3TjF5QUNRQk5jNDZPWVpIQjNBV3Q4alNGZUF1?=
 =?utf-8?B?OGlZRCttZVJqbDI5N2V6M3phMzZBYnVVYUt4dWdNd2hKTTliWUhNTnB1RmJ1?=
 =?utf-8?B?dGZHWUNoTThKTWt5MGRSYXAvTEVGTHRoNTE0dzcwdDhXcThkZFBhbzRjams4?=
 =?utf-8?B?U3M5ekRJUHFKVGNhVm9iaFArQTYxcVNWMkNubEpkb2QxeDh5ZVh2eE0vZEUy?=
 =?utf-8?B?Qng1NXREd3ByYkhYd1hwMDMybkdwOTQrbFVPUmdCYi9HZlRzVm8wd2ZzUGJj?=
 =?utf-8?B?SExrSDZwcWp3cXJyUXdoUHhMZ0lxdE9iVFM4UExPOWZKNXJuaUw2QlJFSHBl?=
 =?utf-8?B?OGZzdzhBV0JlRFlaK0xpOU05aXd2c05rTSthSGx6bFdDbFMxTWppWnFCZzVw?=
 =?utf-8?B?ZExHSjRnbFdEZlRUK1BVWldxYnRWSFM2YU4zMzA3cUF3NVBLVjVCMk1kNnlO?=
 =?utf-8?B?M1IxR0YvVERjd1FLc2hRRGlVdU5McGswT3MzTDhEbnZrSWNEaURVckNmSU15?=
 =?utf-8?B?SC90RUxLYjBWOVRkVVlDajNSSFJlNUxrTWYvc2hZWGRuak5vd2UxaU9GVXlR?=
 =?utf-8?B?R0c0cEc1anNETThnQ0JOV3Rzcm1MbDRmdnhOOVpEWjZoY2NLUzdHSTAyMFJN?=
 =?utf-8?B?U0FBTFUwYzlicmFiZUFwTnZMNDZxMVZJZVA5YjlEVzRadEVSRnhEL0pRazNU?=
 =?utf-8?B?dFVzd0tEM1hLeiswNERQT1RBOU1PK1VtT0hEY1JBOVdKalVTc1pRVWJvejVx?=
 =?utf-8?B?Q0NVYitSR3poYVNtdHlXVFA1endNOHNkWVVaYmdhU2U4aXNlUHVFcm04S01W?=
 =?utf-8?B?Szlza2FtUml0VjZDTTRLOVd5MmlmWmpCOGhrSldGR2JjS3M1VnVEc1JZMzJx?=
 =?utf-8?B?TFZ6V21NQVRoSzdrMVB6UWNIclExQzI3MkJpdk5FaEFUZkowTjZKNEpQVnd0?=
 =?utf-8?B?eHZZSVMxYmRmczFxSldxdTFJRHB4UXFLK2lDem5XRGgyNlZUcVVYM3gwU3Ji?=
 =?utf-8?B?dVVuU0l1VXkxSVVpdHM5SWdyaVQwK0YwNitlKy9VUlRMRDVrQnRweGhtQ0hh?=
 =?utf-8?B?UGNGTVo2Zmx1aDJObkRrdVIwUldYVitpbS8zeGtxTTJvaDRRK0pNc1Z5dHRF?=
 =?utf-8?B?eE16dDJzVDltWTU1cDFXK3RtRWtzd0VvTXNWeVdLYXo1eHJyaFRnb2NSamt4?=
 =?utf-8?B?L0JORVBFSFVJQ2FZYlY1S1NRUzBYbmZ0WG1saTRydWFHdmlwM2prcGNXb01Q?=
 =?utf-8?B?ZXEyVW1mUVBQTjNzamxXOFFQdmRiZTVVRkJJc2ZjUURCL0Jmb0YwNjZ6QXV1?=
 =?utf-8?B?SFRXeUZYZDBwT2RxRFJ1d3pmK3dqMGRNSG9mRDNCRzdTODR4eHlxR3ErMG93?=
 =?utf-8?B?dGpZVHYvbDBEQ3VQMmtVb3ViWjhDaFY0Zm43WU5XRkpzQnpsQWFCdnJNcjhO?=
 =?utf-8?B?VzdZWWFyV0Y0YnExU2pzMmh4TGRKYXVnMjE0ZDVkSkVvdXNNWUZmRTBLZmR1?=
 =?utf-8?B?N2svUDBpd29ZUXJ1UzBDbEpkQnhnZllrVjFMMHU0djBFNFEwc3FpWTlEMnI0?=
 =?utf-8?B?dFNSdEljaHFMZHRJMDBPNmZkWFcwTmNVb2RvUHV4elNKd2ZjZUhURytheE1E?=
 =?utf-8?B?aGp0dFk1NGtWODdDUjd0MmFHc2hqcUorYnUwVWVZUmdrUFAwWTkzQ0dnS3hz?=
 =?utf-8?B?dFc1WS9OZCtXMXRnNzBQWEdvUVR3cDVML0FSNUNTQnM5LzBBcGdncnZlS1hp?=
 =?utf-8?B?YjBqTWROYVhPL01pUTFJdS9ldnJZRzNJVzNFNEw0NUNsSTE4WG1MTE10bnlZ?=
 =?utf-8?B?c04wTElaZHBBMWIzQTVxZkFpVjh1Slk2WUFNSXlKdmFxNUpldU02WnZsN3Zy?=
 =?utf-8?B?UDBxZjlzK3FKNG5ZeG81QkxYaUtrby9EbkF6T1l2U1lncjU5dzZka1pYV3VU?=
 =?utf-8?B?ZVpNQlNBWDYyelBGQi9rVVRQZDkwQ0lpZlVnamZ0RVc2Y0VVNUhZZElMTENZ?=
 =?utf-8?B?eG52VGlBVWtYellrL2pLOGF1Q1VrYXU5OHJHSmNZZkpwVmJJMytrR1pqbnYr?=
 =?utf-8?Q?br6Re6tiihQWIjTJ1D/JU6CTyGupK70YTgJ5MSxKZudmm?=
X-MS-Exchange-AntiSpam-MessageData-1: rYKt8qk4pK7k9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab85290-ef47-49d7-a6e2-08df2073a7f8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:55:22.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMwxd73rXwUuB9Q84a1bi0q7n3Let441ewP/+fb7mjvqybqOgdIjAEToyeVjWZztuXxYipk0JMr9zNI6w0gasA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

On Fri Oct 2, 2026 at 6:50 PM JST, Gary Guo wrote:
> On Wed Sep 30, 2026 at 4:41 AM BST, John Hubbard wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> A driver that runs an interrupt self-test during probe waits for the
>> handler to fire. wait_for_completion() has no timeout, so a broken
>> interrupt path stalls probe indefinitely. Add a timeout variant of
>> wait_for_completion().
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> [jhubbard: return the remaining jiffies]
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> This email should have RfL list CC'ed.
>
>> ---
>>  rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completio=
n.rs
>> index 35ff049ff078..7e8b3c1c880e 100644
>> --- a/rust/kernel/sync/completion.rs
>> +++ b/rust/kernel/sync/completion.rs
>> @@ -6,7 +6,12 @@
>>  //!
>>  //! C header: [`include/linux/completion.h`](srctree/include/linux/comp=
letion.h)
>> =20
>> -use crate::{bindings, prelude::*, types::Opaque};
>> +use crate::{
>> +    bindings,
>> +    prelude::*,
>> +    time::Jiffies,
>> +    types::Opaque, //
>> +};
>> =20
>>  /// Synchronization primitive to signal when a certain task has been co=
mpleted.
>>  ///
>> @@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
>>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct comp=
letion`.
>>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>>      }
>> +
>> +    /// Wait for completion of a task, with a timeout.
>> +    ///
>> +    /// This method waits for the completion of a task, or until `timeo=
ut` elapses. It is not
>> +    /// interruptible. Returns the number of jiffies left when the task=
 completed, or [`None`] if
>> +    /// `timeout` elapsed first.
>> +    ///
>> +    /// See also [`Completion::complete_all`].
>> +    #[inline]
>> +    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Opti=
on<Jiffies> {
>
> NACK. Please use the typed `Delta<Jiffy>`, not this old type alias for c_=
ulong.
> I asked Miguel to take that late last cycle because I know there'll be ne=
w users
> that want to use Jiffies this cycle!
>
> This would avoid you having to do clamping on the max side (but you still=
 need
> to clamp the value to be at least 0). There'll be a helper method for thi=
s, but
> it isn't available yet.
> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flap=
ping.org/

I will drop this patch and replace the code using this new method (which
is just an optional probe-time self-test) by a polling loop on an
atomic. That way we can wait for the helper method to be available and
revisit this with the proper type.
