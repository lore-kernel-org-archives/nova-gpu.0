Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B23CD8BF
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640068; cv=fail; b=YtNv7rJpOyNGCXs06KEhdqJvGMi8183hp80fo9BFh9sINfUEuUmn4HHKDpO/pZO57XQFlb8ipW40cSxd+fxYVlKeKmqc8TM5uA+tSQCXhi9qQPujUi+czazWx7vQ6FXA6Hs2VS+lkHnrQRmWVS2jQ6N0YhdOYTquKaqsGgzG1s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640068; c=relaxed/simple;
	bh=f38Jzd1+7EHhZg3Ed2dDJQypB0K+nhmXuVyFTo/vLhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bEDRjk2GdmW98iB6qnXBO42Gn6M+4Jy4Mqn0OyKsPoDKU1fpj2Wiymb73h6L1e5S/b5CXgvcdJJqOEjS/WNR1Ao8FdTjt96zJX0j/ToagkUPy1l2VMMgr2VcnjQnX+sLnJzY1mHw5XQuCUVdPGTR9gbOzLbt1LXUmbAclCxI3fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mvJlSfyD; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mvJlSfyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8NSdpRIq0jSyMiLPpCfVdNRb80EGH2bq/GIDho8hFwU/DlMQwgLmoHW5A2xAfYX1NZv0x7Rhb5l1Um99OaT48qkEYpW4XvNGdUqbcJHaAl3w/haUPqHmn8AMP7adDDF60G5Jn/P8Xv9+WE1cdwXtl5f/2eFfoHkX54E1SBCemAzD3XJHC38nJuFG8cZEtbmSMILq4ixLouNnE7dfMWLGmX6cxDUuOoCT31ZHi/5RoDgV5UZFdQ/ZEM+uk2q066P5hMiFb8xdiDi9aCxK+yrLXVd/38GtC5nL0WarWy3YaNGBjskHl2CsAIggceouF3sN7TYR1pO0DK8EnycJFstxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1ihB10iiR67ZAbwCmtn2999Cau2AitriUGoSyrWyU8=;
 b=wHkv5L/bhWFCjpUuqsekv7d7+a6U5LimE1kGZC2h2KDoWIL27S04pvQWXynVCZDB9SzGYTBfZXSDXC9/HhjCPQnQQrX1uOrW4HtvuD3XZvYOTxSFjZv0ZjWQZCvfKFEx4iSlyxe/o6kFOhxQOEpUfojTO5nnF2W9dnUdZEUll55NCYbNMyTrqdi9Bd4jsQPzKIw724xR02GDOlvyGi5XJy+YzKGr0WoRs+SG1Y7IkxBtDBxAjeFbSv33QywGSoxx7uCeJK3yDxQMrSMKjKqh+eKDOcN2nPnDm11tA2OSleCd43lCuHOD0zUA4a1S8M58/w09K7gJSeSLu8BkHPwbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1ihB10iiR67ZAbwCmtn2999Cau2AitriUGoSyrWyU8=;
 b=mvJlSfyDocUHdU7Vu/GzUbCKY9+Jx0HCgEGWzg+kPTxGQ+z9F0n9EgZvc26okX7AgLdC4Aq5VqOIVRq8b3ikw5OnWHzAEI+Dxu+BxMMPKZ1LHGos+FE2wjjMmR/RQ3UAAsUf9LK2RSTM1KfE+fBvvSExl8qrxJ21/BnLN7wcMx2fMPDaWgVNKDDC48bQ/6fivd7N6G+Z60wV5wO1DmVuLQs8FQSbJDiCqDBGeR1jpcoWO7QTtq9l5xm1oe7BUEfhshcZ0q3jVrMYS1r1eF3HXRjHPWKunsfMkzNLIBgC8NAsdOVO+wScE65gmiXGWX2WwiGQ7AOgITCNOZ1ZtT15Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by CH1PPF16C2BD7B0.namprd12.prod.outlook.com (2603:10b6:61f:fc00::607) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 06:41:01 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 06:41:01 +0000
Date: Tue, 25 Aug 2026 16:40:55 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	nova-gpu <nova-gpu@lists.linux.dev>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 4/7] drm: nova: Add a GPU info ioctl
Message-ID: <ao0124N2-QCOL2We@nvdebian.thelocal>
References: <20260811050657.646799-1-apopple@nvidia.com>
 <20260811050657.646799-5-apopple@nvidia.com>
 <DKXFCIT7WHBE.1MJV6UKAJ5VEU@kernel.org>
 <f9d3f749-dacb-4cfa-acf7-e748795729a6@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d3f749-dacb-4cfa-acf7-e748795729a6@nvidia.com>
X-ClientProxiedBy: SY0PR01CA0004.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::11) To LV2PR12MB5989.namprd12.prod.outlook.com
 (2603:10b6:408:171::20)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|CH1PPF16C2BD7B0:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6eb9ff-5e23-4965-46e1-08df0273d400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w+KePsGAz8VNdGt6c6yfvuly9mG76r9fDwt7TuaaSU3eLsN+btekhBd+OGped7E/YI+KKdOd2r8wZfI+bG3ftCzP6yxLrG/GPof5mH0118NhdC5z7l0eaT9W3x5HRz9dhl9Ok3LeNq5AOZavWfJ16Ko44Uov/f9J1LShylTfDyRkQb1x+sa80/OgEkWqgTT+SWyAQgeMyIXR4lFZHzFTh0VbsrVEfpS6DiOUNhFK3Hv9dNFPeFmflwNO97odJFRgupUrEgI1Vh2PTaY8PqVDeosLjn074wr/7/wS4kqiP8djosaoubtCYrNTatjuts9Mv/B/BjLwsJLxy+cDDpnIkbvS9fHRwHejAPlwUTWzbq3pReemyUydWXAJ6+qdUonL13CcmpKPsFsGP+LUkau17jUl3gtn/jgim/134PLNqxx9/+vHskQXCucIflYQVZe6ocv1BJAB+V/0TbRxL+9qYfxEbqIreKElQ5CnLwSf6yErcMhVUjhZbvo5qECzoHoob83ooNmXsHeKc9VqsIOGGWL+rNapTEKVAhkI/tbm2sfgM79N9VRvGI+5PWvpIpQSqWpIS1b/CAp4e0cFMYY+E2mAmLlMDvdi/N94YK/Hz7WxPuoZfjLBiPPSWhiwnjmC9srt3Wx63yT3r3EHmwo5WzR0YWlJzMMBLPQSqxp73Gk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QoOXVGSYaKhgFR+vrDoVTcN0XJjxRVIItjfKDLizO9oJkPPA4Iqq+wycg8zy?=
 =?us-ascii?Q?pGASrLqCbV5UrTb/yzBIa9S7sV+KeOAc0+Bwwm0usO4Ht5Ea1Xr+4mjgB1pY?=
 =?us-ascii?Q?LnXK7peHeEpset9iItWocEtsUPGBew92kdDUBKE/6A73oVhvcaffIBJNIlZ3?=
 =?us-ascii?Q?gbO8tC5xLsB1h2FU3qs28WHNXXEDXue+QAieUhHRvd2kPKGHbvKet0lJeA8L?=
 =?us-ascii?Q?JGve9Hm4dts2bGGhHHpKGm8o8h5eQNRJ0w1gEwlxho+lu38W4qHxM/CN6hdB?=
 =?us-ascii?Q?2nLpcTtRRQXGxVCyJlg2VhTFmKrgkojihIHVj/aSSFRkOi2XU7Oj5aFk4Spf?=
 =?us-ascii?Q?7gwFKHXR4GhUachBNcSVdpXxYM09E9+CdL2pid6+Uo7cnXQicMPGVjCQdFwf?=
 =?us-ascii?Q?ufhK6rAECmGUWrnlS93LrPB4kRXWgpqv5IZhaJkc+46GlbkUwGvM6DCDJVae?=
 =?us-ascii?Q?5X0XNEykyPH6jfNik+4aTDOocOfsUJgO6g0boxyV1AeQIJfq6AyFg608Q0yJ?=
 =?us-ascii?Q?A7wIsWlzttLIRbVQ1FB15/jQWIgrRNY9tmkIkCwl4npmx4S0wprpj7CYhSbc?=
 =?us-ascii?Q?I+lNqMQXZjT8o6KCtb6VEZoE/93N7/7nPrdTBUEJkWZCw0Lgk1N+jjfrmJWe?=
 =?us-ascii?Q?A3Ncd+MsHpD8FthYbpqKD4SsjjrWb8Fxe6YSefIqrkkhSGm2PBOA6EHGXkld?=
 =?us-ascii?Q?0iNEwQg2mvmYRo5iaEkmjCcIiqlsrPAsZf4u8mjgMwuyh1yZN7I4hmvQd0Hi?=
 =?us-ascii?Q?FtqCm9ki3hf5+FSDCm56LratTBRLyRUUpbIcshnw/lDztnfjKOBUVzWgv7hC?=
 =?us-ascii?Q?YZwlbBVE3Y9CSlmdgLA4zSVqNOwOLA95qfuO6L2AIAdYtF/PNOCbAZL3MfNs?=
 =?us-ascii?Q?Y+Gf2gkJDpD90YsjaKBxUH8jiZI/mgmPCq5+yrHakxL0QNQN3D+E5cOTMA46?=
 =?us-ascii?Q?p1IZrHT6baVlGI2C3wrCB092yuGQ3wv9th0amK0KatK3Fx2KxcivUP5AfeNN?=
 =?us-ascii?Q?gl6cpfUuf97xXfW9u5hhJoVlrzvvVPcOoOfSASjq1eznLGgC94zhnjI/cl42?=
 =?us-ascii?Q?R/pBEgnPKNnrVBdQAfMohl2vvWzmDP3QuSu4U6Gp4xR/9n493M+pY5soYzvX?=
 =?us-ascii?Q?FVE5AEZYliy3pqNyOs7bfxmy9nM7plH47+9gdk4Nj+iKThZQnXReySVb3MCi?=
 =?us-ascii?Q?KDAzXjnTB7e0TO3vovc1xotmmxtVhbAlYgiXWgP3jnwcU3Ys8OTu4nTBGJHv?=
 =?us-ascii?Q?gNQU+l99A1NxJvwYJBSL6VTZWE73ilPuZJDw4gqn5QNVAZ6gb8mgWf8Kzer/?=
 =?us-ascii?Q?WVlyuK76mSaXfZ3ra5+NtXIhE1T89LbhZGenUCjIYXPnuFNaknAP2BRIqbaV?=
 =?us-ascii?Q?O+K7FRSUrcldGIGueCJLcePAlkKnlPwExYVaqXp2kpWz1Fu7u3OMWyqhuUWp?=
 =?us-ascii?Q?PyLVc/ZJlwxAB6CFh2Ct3hfy6TB8QZToalw2mQdvEEy8vGJO5IOS9NjMWJn2?=
 =?us-ascii?Q?/sC2PEpsvNeyvZCXRckMtaXbilzWc6H5wthcKAdV/iIq+a8IgBJizUP1qQzA?=
 =?us-ascii?Q?pV6yIHrxdjMLCQuGISjU5Fbl83wpo5bbUoCKd3HKAwJaBlvLp3+ZyNt3irg7?=
 =?us-ascii?Q?+pHhq3uFWkk4On1ZY9Bw7OUMTD/uzh6tWyDkNKXQcGC4jJfmrKyeSS8LhnX1?=
 =?us-ascii?Q?6+nOXxC9LoMQJrSNbP9cMphpD+kcxpYz3+k1q8qpugDd2fH+y2NaEdPa0f1Q?=
 =?us-ascii?Q?fAzpt4u9tA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6eb9ff-5e23-4965-46e1-08df0273d400
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5989.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:41:01.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx8/LH4XaLO035gkRNx06thkIxat1eImxpb5EnVn9UhadaTC7opeVlfQaRuYeCWiLWzTSIEGKmsU7hk/Rhi54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF16C2BD7B0

On 2026-08-25 at 06:04 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 8/24/26 12:34 PM, Danilo Krummrich wrote:
> > On Tue Aug 11, 2026 at 7:06 AM CEST, Alistair Popple wrote:
> >>  include/uapi/drm/nova_drm.h    | 27 +++++++++++++++++++++++++++
> > 
> > Btw. I think it would be nice to have project to play around with and write
> > tests directly on top of the uAPI before we can run the big test suites.
> 
> Yes, I think it's reasonable to do something like that. Seeing a new API
> from both sides, caller and callee, is always illuminating during review,
> for one thing.

Yes, I had meant to do this so thanks for the reminder.
You can of course see the other side of the API here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43352

But that's a user of the UAPI rather than a tester of it which makes it hard to
exercise everything or specific parts of the API. I did actually end up writing
my own standalone test case for these, similar to [1] but never got around to
tidying it up and posting it. Looking at [1] it seems reasonable as a simple
stand-alone test so I will do that ahead of the next revision for this series.

> > 
> > When I implemented the VM_BIND uAPI for nouveau I used IGT for this (but didn't
> > enjoy it too much). It turned out to be very useful to test and benchmark the
> > implementation before being able to complete VK CTS.
> > 
> > When I sent the first nova-drm skeleton, I also submitted [1]; maybe we can
> > extend this further accordingly?
> > 
> > I'm also open for other ideas, but I'd really like to have something like this
> > as we develop nova-drm.
> > 
> > [1] https://gitlab.freedesktop.org/dakr/drm-test
> 
> I was thinking about where this sort of thing should go, and this
> location seems as good, or slightly better than the main alternatives,
> to get started anyway.
> 
> Alternatives include:
> 
> 1) The kernel's kselftests (tools/testings/selftests). These are
> helpful in many cases, but some minor issues include:

Yeah, I don't think these style of tests belong in kselftests if only because
they're never going to be self-contained as at a minimum they will require
specific HW. It might make sense for unit-test style things, but I (think)
Rust-for-Linux already has that covered.

>     a) Oddly tight coupling to kernel code, even though the whole
>        point of these is to exercise the kernel from user space.
>        (Otherwise, these days one would use KUnit.) I've personally
>        working on mitigating the coupling-induced problems and 
>        ran into other, bigger problems along the way, such as:
> 
>    b) Confused build system and an arguably wrong way of invoking
>       the tests (from Make(1) !).
> 
> 2) Some other github-like location to host user space tests for
>    nova. The idea is, do we want to set up a well-known location
>    that people should keep updated? Or let a thousand github
>    small test sites bloom? 

We obviously can't stop a thousand small test sites blooming if people create
them, but I think it would be good to establish a well-known location for core
Nova developers to contribute to at least.

> thanks,
> -- 
> John Hubbard
> 
