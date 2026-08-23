Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A383338
	for <nova-gpu@lists.linux.dev>; Sun, 23 Aug 2026 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514707; cv=fail; b=JueqmQluqimQVasevKVbrxK3lr6xmKdn0EwNTojx0qFYgJiLrfRBoNNYWnhAI4lAeiBL594ovtGM4hq/dygBLbjBVddoljMmiRMfnTRIhMTivRT6n9X3Y/grqAPDh84LjGdXehfnCz4BW3YTbVrn61LlE7fb3k0JuyiN8Ze0GxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514707; c=relaxed/simple;
	bh=/wy8EAQAoo2rtqCG8agFCSTQdVxOtC0Zux511tZF5Dw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fvvRp3jONwW2Bp7Rt4f0QXSd/MuhQtQynJHvE5ZaMYczUxX35Ba8samYwPZly8ZmP7NQbOFC0pMzHORKmZ9I3xN+ZXKznhl2k3sWz42oBBNqzQkaYYXZ2WaVNIw8dGFibh63SRNXb0xNyjYp8IvhfIF6UMFshR38c5JBHtmH3v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Palq+Wtc; arc=fail smtp.client-ip=52.101.62.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Palq+Wtc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqELdnPsv1eGddou+fbqRAP5Es13iufnIZveZptEV3ZYdabHbokxp7cQ8RvO3oHTyhQpGDd5ARpG6zYMRCVkDeUEG7yjszEdpRrFDlR2bkaG4KKsZx/kFjoRlR7pv+kntTE2qLXJM5w9iG9DM0e+Fms0ZOozUCWWyo2MeWnLae0Djvcgi2LXyj2W4ZSKuWp/XKBpFsQdLiUQEaKwehe4xOAajWpYABsMg+6WF5xG/KQGbzMHdUkv3dEyF66Ge+mkmmMzL6bPBqFznJLRKKk0TG6RzP8EqHbESvl26+Zw+/3sXzYXBUcHYa4eiv0mIYyR/GS1Dh6EL8NHqOOOQx0VgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgA88fgEoZWKlAkbmJ1Xpt0+5aGN4sQIJnzYsLIlNgo=;
 b=vaF1KuNfPfH6edUGWtsznkkGVpDjT0rvV/1L93SXQOrppsCwEkPGMFxUcZHIDQWxYY//nReCvIilAh+uNh8BDYiSfhKTn+mcIp2fafrMjxuS4oMO+Jd6+htGIQ4KOMf2CDLZ51XB7tCDJTyBGvEcQSBn3ld7vS4kDxrcSPlUGaXcoU6USZTjAzStKMp4GWBkDom3Syzr6fX3hOIAsE3XKc4h6Z7wVOzILIXYMc9kByqP3a1aXd2CeDvs2gGRGs65WaIJxY28i855aMNEhEkbsDndKUFd7IK7hUfkd4UIgezSWRLd9pJZZEVyMeINZUKdyZly1E7MuDOYMVCjOI9QKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgA88fgEoZWKlAkbmJ1Xpt0+5aGN4sQIJnzYsLIlNgo=;
 b=Palq+WtcAzmFWyaLkVxz6hIVda2YcH6z4ms4bir4z2dF7t/if63HUc8+MwKPm4itpkzvDVd1vkPvFB8PSn6+eEdyOWdMgSQLbXgquYzu3zEmY4N6Okbw+zTO1B9VHUp0c3yptWgJMSCxLKXFsW3Dio8H+4lfdXTBTOCqCSWIrqg+o/SjLgR3u7lOhP4zYYeKBSAetaEB6kZmPdE8+lNA9CGLCXDD7eq90ZC3h3RoCt+UxGol7gWp4nSvh4mYgqjU4sKMYBtjuNLhaafODB9ceWQ09WPNAfFGDvDBu09YRBLtUrI4obI10bfHbW9D7ZXNFHAAC9kkp6+HXttENOdwow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPFE3F7EF2AE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 19:51:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 19:51:40 +0000
Message-ID: <94a7eb3d-d1bc-4e50-bf75-d14896a51302@nvidia.com>
Date: Sun, 23 Aug 2026 12:51:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/31] gpu: nova-core: add optional ucodes firmware
 loading
To: M Henning <mhenning@darkrefraction.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-9-jhubbard@nvidia.com>
 <CAAgWFh1vEGzyFHDWUpH19VYZVa98siwV3sm2Yf5x5jW2uP+d9g@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAAgWFh1vEGzyFHDWUpH19VYZVa98siwV3sm2Yf5x5jW2uP+d9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPFE3F7EF2AE:EE_
X-MS-Office365-Filtering-Correlation-Id: efac7fc9-61af-404a-8c48-08df014ff2e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|23010399003|18002099003|22082099003|11063799006|5023799004|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	t0St1u44IbkB4qmqMB1przpM2acZKjUGtPbszF3FA5+vqlJRiAxSqZplr8IGWxfTlcy/+nFf3JXIr2I6RSiWDhjstLdDJyuRW9ofkeDFOl8rD0RK3P9PzGj4jcM9akLQL1a1u8oZP6l2oK8wUrktnc8Cb5enwfImwx7JrO8xoTfbC/XHYAuntnG04SQEOZ6qiwAFKh/JK4hf2izrvkLEchE/6KxtzLHR8KKQ1RGzRt0vsiEawG35stOOkmLV/mltlnB1LSN6B4C9wNiJN11WoQfro6g0E9VXIlBPuCAw/UQtk5Gra4FQtLYAhdlJtvFb3OjUuYTmCXqUn2AV+xp+SSbfNk3PrOEhd4C1TchF5nq3JfeOVcHGMxsdWTEkvDl1HymKv/pvOpVC/+umjRKlZyeeI5s91IuCAukFxaTDe2i+5QXO5s8eAG/17f0h2W1m1L/kL8+yDvx82WSAnzXc6FrCAbXSBeja2iMFVJyGsYoqVUHkKvpn4PcBB1m/SEcMuydNCxosJSKUu0Iw2qcaSRuEEPCg0iydR0ZUc4m7fHa3NDKU5+0z0Jhj3V5jTURgfR7M/QIYeUEERWxk4/TjllSPc1/31cU7kUqVf3Elg9D5TH6TpT/dnnPAcP8dirpTt6iE4tHgPFlfSGpAUbCFqIdH6E5xdLFR1oX6QhZukr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDh4b0lRNUoxY05jdHY0aStJdHUxdHFlT0lxU0ZrQUc3UnU1UHYranZRYXg2?=
 =?utf-8?B?QVJpOE9vRnhJanEvZlFOUy9HSEIyUmVUZmVkSkp3VE9uQk5GaDcrdDVwUlZI?=
 =?utf-8?B?WWVGZFVtWnp1SDd1aEhwUzZCQlBrYnB6ZVpaL0lHY3ZuNDhZTUV6S1FLakJD?=
 =?utf-8?B?ZXFDRmdCSkNveDU3OC83NnIxc0VRTzFJMEZ0REdBZnNpeEQ3TlRpTmJ6VHAx?=
 =?utf-8?B?WE9YY2hkbUhJUUtmMzBzc2RINWxXOHNWaDZHSVM4YmZ1YS85cjhvMFVnd3d4?=
 =?utf-8?B?MnJ1MXBSMVlzRnZYQ1IzakpTWHZiYkRZZCtCZnR4dmRTcE5NN0twZ0FHNGhO?=
 =?utf-8?B?THgybzB0Q2ZWcHdwRDc2Q3k1ZmFOUms0SkRrUFpMbG5wRitpZnNNN0pCUG1Q?=
 =?utf-8?B?c1crVnRMWHRia3dWTHFsVUQza3FxejVPUTkxZVp5WjBKOFhQaVQzRHcrUUl2?=
 =?utf-8?B?TXMrY0ZnTmZiRHU3SlM5anlqT1Y3WHFTR2xRcUwzcTM0TzFHZmEwS1hUOFZr?=
 =?utf-8?B?a096b2xJNHJ5Q2xqR28zNDFwMGFaRWFVTEVoYlkyeXVpa053UWZ5QnhseHBa?=
 =?utf-8?B?OVltemJBK1kvTC9oNVBZTFVDY1RYeGRwaVRya3ZrNGVZVFA2R3B5UzhuY3dy?=
 =?utf-8?B?djlsakpxeGpDdFlET25YUnYyeFFZNnAwZDdXU1IrN09HbVVLYlNDczJVMzI4?=
 =?utf-8?B?TmY5NDN5TnBOVFozY1p4VGZqOE1nY1FRalVtVHlZN0RpM0UxVHl1dDQveXRN?=
 =?utf-8?B?aUVqZThtaW5ObEU2Mmg4MFA5bVRTVno1cnlwdkg1b3h5aDgrVDdEdDR0ekxw?=
 =?utf-8?B?cHVJWjBJMVVFN3FCNmZMN2RFQUMzK0VvL2YvSk8vNUkwNVZmbCtVV0tPeVk3?=
 =?utf-8?B?bE9saVdPR3lDUkdTM0p2b1dXSExJYXg2NWJCUnQrOURwSFRYbWxUTldyNldT?=
 =?utf-8?B?UDJiMzR5V056bkxLR2dwSno1Yk9WOXpYVHRsdThwY2RCRm5jdyt3MXJNdFFy?=
 =?utf-8?B?NHo1K2NsYXNYeEVnUEt3ZWlrc0p3VGFZZ1VWUEFhK1ZvcjdSTUhHdU82L0R4?=
 =?utf-8?B?UW43QzdBd2dEaVp1L0NQVlQrZGhpNmxyOU5OVko1YUhLQlk0M2VqQWE1TEJ4?=
 =?utf-8?B?eHMydzZTc3ZyMnFFNW1EMzNEckJEQWxJSmZSMENZczZHV0pwR0l1cU0ybGZN?=
 =?utf-8?B?Y2hkSE1LN2FSTWxBL1B6ekJIcHRabDZnL092YlMwd1M4c2JwdEt5bnY2dmtD?=
 =?utf-8?B?MXZIckthVms4TW1Lb3FScVgwRTE2dDZxVWVmYlN5NDVvSUgwR2ZsSzlrbjF4?=
 =?utf-8?B?ZVhqeFF1Uk8zcVZsVXhBd0pheWNFYlMzTzFmSTVLa1FtTFUzQ21TLzA5cXpM?=
 =?utf-8?B?N3RURzJBTEV3K1NRdGc0M2ZDTnIyaGFBZzVtazdPU29xeFA5RzBWd3dDSEJj?=
 =?utf-8?B?Q0g3RmU1bUNCWGpjOU5jUEFpcUFrWEl6c20zVzJDYUw1djhVcnJpdDNSTWlw?=
 =?utf-8?B?L1BmRUgyZk56aERhdVNNOEkwc2crdnQxajQ1NmNyUS96VzRQbEFIT2Q5MlhT?=
 =?utf-8?B?TjRuREd1Zy9JNndiZUlES3MyRHkxNlZvQitVbk9NbW1GVWM5dG9vNkNoeEQy?=
 =?utf-8?B?ZkZUMnB2NXg2OG91b1Z2UFdBY2MwVDZGT3F3SG5tTXBoUnpuMWxTRzdoT0xD?=
 =?utf-8?B?QWsvZ0Jyd1V6eU1GcmJhZ3dzMFJybjFydzREb0M2UXIzMC9VVTZOQ3dyb1hx?=
 =?utf-8?B?MS9ZTW82WXY1bS8xWnZkZjY1eEZ4NFc0NXROemd6ZW1iL01zZTA3VXNqSTlT?=
 =?utf-8?B?TlNob0xGaU92TndWQVNMRHAzSE4yQVdrbnNlOFRrMzV2RVI3UXNvSXdqRGhW?=
 =?utf-8?B?SU1UUURPbHg1RGZSaGYxeW45ZStGS3ptY24weTczR1BGNW5hemJld084SnB1?=
 =?utf-8?B?SFM5cmtUeTJyc1RtVjFVUkZKRFZmalZYcHp4Z2VRMXl2R3BsNHB1bDlGaEJH?=
 =?utf-8?B?d1djTTFXdCsxUVNENVVEYytNa1plbjZCcUxKTXQ3OHA4Umd3a2FsK3hXTWZM?=
 =?utf-8?B?VjRXYVdTZlFVMVhLc3lBNEh0VU52MGQzQVpZeFYzVXRxQUNJWXlIVWd4N0dr?=
 =?utf-8?B?L010MUloQUR5d1E3V1pMVGZ5bmh4ZEhtTms5bjVyKzNvTGNCS2hUTk5PWnd5?=
 =?utf-8?B?MjlkOTFuUEhTYjhmQXM1bHUrbE1UK3lGU0NyMm5MYndzK3hlYXhzWFMwYlVX?=
 =?utf-8?B?Q3hDNGJxK2VjSXNqdXBCeG5iL29hTEIxV0laZktyeUNxTjFwSVJpZnVRUlJ3?=
 =?utf-8?B?d09tSmlJQU5RQ2V4b0p0WitZWkpPZEFma3FraE82aUczVURCNnFsWDE0VWhI?=
 =?utf-8?Q?JbEkYjzbqwBIKU6w=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efac7fc9-61af-404a-8c48-08df014ff2e2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 19:51:40.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ox+8rwA7+rViakIiBo4U8WironPaLzuRfTrgJbeUh+VuFq+rYyRg5WQ4szWjfsLukqnWGx8YjrTVLmRXsP6krg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE3F7EF2AE

On 8/23/26 9:26 AM, M Henning wrote:
> On Fri, Aug 21, 2026 at 9:58 PM John Hubbard <jhubbard@nvidia.com> wrote:
>> +        // FILE is a basename relative to the TLV's directory, not an arbitrary firmware path.
>> +        if file.is_empty() || matches!(file, "." | "..") || file.contains('/') {
>> +            return Err(EINVAL);
>> +        }
> 
> This isn't a sane way to check if a path includes a directory
> component or not. You really want to use path-handling apis, rather
> than open-coding this in a way that rejects a few special cases.

I'll drop these checks entirely for v3. Timur wondered whether they
were needed during the v1 review, for the same reason, and I think
you're both right that the check that matters already happens lower
down.

Although, load_file()'s doccomments do claim that an embedded '/'
is rejected, so I'll need to either delete that, or add in a check
for it.

Here's the calling stack:

     Tlv::load_file()
       firmware::request_into_buf()
         request_firmware_into_buf()
           _request_firmware()

and _request_firmware() already does this:

	if (!name || name[0] == '\0') {
		ret = -EINVAL;
		goto out;
	}
	/*
	 * Reject firmware file names with ".." path components.
	 * There are drivers that construct firmware file names from
	 * device-supplied strings, and we don't want some device to be
	 * able to tell us "I would like to be sent my firmware from
	 * ../../../etc/shadow, please".
	 *
	 * This intentionally only looks at the firmware name, not at
	 * the firmware base directory or at symlink contents.
	 */
	if (name_contains_dotdot(name)) {
		dev_warn(device,
			 "Firmware load for '%s' refused, path contains '..' component\n",
			 name);
		ret = -EINVAL;
		goto out;
	}

On the path-handling API: there isn't one to reach for in Rust for
Linux:

rust/kernel is #![no_std], so no Path or PathBuf, and the C side has
kbasename() and the VFS lookup helpers, but nothing that validates an
unresolved name string beyond the name_contains_dotdot() above.

thanks,
-- 
John Hubbard

