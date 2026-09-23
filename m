Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90547DF98
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166074; cv=fail; b=afav/rfLW1/xypDdpaZQZ2/7GLDkBxR11ZWGWrCS/eyJ0A7pODfe24dYm64hhNOWi0SNPZOKgrOQ7Fy2EOAZrfzJieA7SKamUH4Ue8UUYqXXQdpuLdeCnGt7yfH7nE2OVOZ7dtiDp+eKcW69AQh0U0v/uQHUa0Tj+v01NQVabg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166074; c=relaxed/simple;
	bh=pMuaF4uu2dHB120Ji6JGB1m5nTxl7qionDWkh4jCUAg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Dr63vQUCPE0ZGQZ3zrmSPbWkDPBVTk4UbiaN4kB5dFyjG5MippZKjhcBWo7IAXXTHcnQnsf06yyqY5Ykq6+MEzM/VwSZmY0FgVNvygwEi/YiYdDOZGaYQdAj513z7LwTOpdrOLcT/j9uwLqPc44MWZ0+dsR8r44gXXj02N5DPSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e5wb81nW; arc=fail smtp.client-ip=52.101.48.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e5wb81nW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRZ/wgW00t19fxgF09OlDM85WTxLB4NM5wwU3W8c+DjSLdCHH3GlLsrdluIi2cRqlZBwsRpziNk7GsFdZBgP+b3YdyyKL7L6KYzh/0Y7E1ilK8vbQmngM0Xh0a4TzHST4kR8NVL8A5eLFVmEV7qJnr7eh16JCRRoZjorhN6LS4YOdyjDx6A7KnKnY+RwLrD7UO5vq75Ge+1GRNtomDE4bDGaXgH0+0VHTrnf2KNvRGMzgpJMWJ4OS0XOjeaWB0e4xJZv5a+/u/x4EmW9mRLoHqaF6HLLJsrkCHX/B/WyTfGsOCKPulyUVSGaWWM+cx7I7xxFow/ezV9cvuf26nwYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9BDX4srMzRpbu2v3FfW973KAHH9x9yLYGq9cv/+6CE=;
 b=hCeL5hjJsBD+B8jjebzq+WBFl9a2ivUNJTT4nlmsqExwRJZ/m2oylRq4V59dQfsKL8ywuM3FBdI000aIAzGa7LGW3TurJbDIUYY6jcG5JAPRIpijtqj54Rt1uh0Y+AECDDjkD6j5OpGu5+Oxdz3r7/K9Q21o899dBWYl+o7/WJfqx+1uo7mL7XV9Ty9l8GRjBcedmkc/zLVpK56/vMCpPXBn63L+/psAthIcO5Mpx10nJg5tkbxeqsgHN3ZgOYVoRDyifJrUpv1Y8b4bHmRu03oKU7oH5mZi9LGk9j3RIhhefpautgDgg/AZDopkzQW4jZXxNUAdsVmVckOFfAFesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9BDX4srMzRpbu2v3FfW973KAHH9x9yLYGq9cv/+6CE=;
 b=e5wb81nWdyNUSdunYbus9PrgDE2bHSv0+LLLyw9Q1m6WECpwBfGbzBExB0kFKNRWfhcwQLdoSqQrQ0s2r6FgdwtNWrY5Ca/sg8Dr4xOKjg8011ov4G8n33sPhvf+CcdQOjGVGEooAMaE6HKMRl82CfmVQWSELjwuN6mC1wy+zozmAl9RD5VM5Skjn1WnV84J1mtPMznavJD8vrbDG1VXxm+Zz4ehg/w6alprObY+VPaEYbl/QWQrGXT+osC7zb8TR1rWjeZUej8XvoAPLpi957qfexo/Ass4n3Y6mml6kV3p3Fsw69qeJskLAc19Lrd+t/ugc95RTfZxZvSpuW2Vyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 12:21:05 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:21:05 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 21:20:58 +0900
Message-Id: <DLMOWLTWLMT2.1CF8Z8JXTRDZ6@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 05/33] gpu: nova-core: regs: add msgq v2 BAR0
 register declarations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-6-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-6-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0cf4bb-ae23-43d8-8e5e-08df196d2177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|7416014|1800799024|10070799003|4143699003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rzFyk55uuXVXC7GVqnJXj0UZ32K1LP7kmag77htxAbWjHigw/29KxdvssDpidTY7ubRJAi2cx/pmUbMWv6SKVyUxYbQeoThCaQp1Xb8L9iqyGsZ67nmfwqwI3HQ3rUXhLgdmUOpgaWpeexsbCxnNV9wfL5utdw9D4wEpDvJfbv/is2tTD4BPRmZhDN4mZ8BYEp0m7I96YMHrRSPDhgxmvMx26z634aoL6VSOe3b0OMlDhObbxQ9g4XnVLKAQ/fcQAET3+3qVTixYp6ajj3Bege4ktPOhFp7O8un/ElGTcjqYhtHknyCdFYtsstaOaKza8Yl1pSPmB67gaG8rfQy2UgZ4MxZTOvJErZTaYc1Qef5Y83ZxfYrkTGvw0cTCXgTn5JKnMiAbakVfSeMx96X4ItOJM/2rZafxZQMouy4UQn4r8oEMg3OvsW8pkS+V0rnVx0+koRXuMp7SMnzEi/tF0LjG95rt6NUc2fpMtThZmfRba5KwViuDw3y54KpWYQpB/NSA2yEFQAImf+ECIoE3cqJHRxr56IQApsD5B/Hcdw2YSSiF25p0fAfHIm8C9TvOT64SYu2ZZmlFzFaHR7U9ekUn8fRzxXUZTD+rqLrWBRhE6/ApQ4RO23shtOLLDI02LDO69tPB0AwrQqPQhqEGwDA1bcgAcgFs4mJ5eT9WY2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(1800799024)(10070799003)(4143699003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YThwSGlWOFpESm50b1NlRjJZWDNIUGdiL2VxSmpNUlAwWS9YdmhOandFemNs?=
 =?utf-8?B?NVYyZmFWOVdtbWNvMHV6bVlTRWxTSVAzd3R0ODNnM2FTSW9ENThIUUQ0Yi9U?=
 =?utf-8?B?WGMwckFkNmJxaHR1ekRBWnBwb1ZaRlBjenAzNU1WcVU0Zi9teWdLMGFQMEtn?=
 =?utf-8?B?WWZCZ0RxMGsvdDVlWE44WWZEeHpvazhJOHVEc3dycmY1MGV0dHNDa2ZwY053?=
 =?utf-8?B?aDlBa1VXWm1kNWhnR2VzVlFNbXErQTdzNm8rQmwrVlZGTjBOY3JFZ0gxS2Ix?=
 =?utf-8?B?bnRBWEhHcmZIV0hwZDFCbVVkZTJ2Z1JBck84U2wySzEzdTRIeWtzUkEyUGx5?=
 =?utf-8?B?Qy9uczllSGhMZFdUVzVocDB4TWE0ZDlnTVRjVXNwUG9uVDBPSjhZYW5hVUhG?=
 =?utf-8?B?UjFXNTFSc3V5bHYrRnB6R0ZGbERwRzN2UjZXSC96RWhpVW83aGRyZk9yb0Na?=
 =?utf-8?B?cFpDYTF3a3p2bkJHb0NiUVJ5emNHR1E5bllCUEJPQVh1NytIMHFtY0QyVkdG?=
 =?utf-8?B?T0tYei9idjltcUZuWTBIaWZ3QnoybHdCZTc0TStCdkVsRWhHRXZFOW5LQlcx?=
 =?utf-8?B?bDRFM0dlSDgxeEZpRUNvektPM1hvc09XcEFvcWMwWEZaRTJaVFU0eithYU91?=
 =?utf-8?B?T3A1QXUwOSs4K0pObEJnQzVkR1hMSzZvS3VETm5TYUVkbkNST3ZUWmtSZ2k0?=
 =?utf-8?B?OTFXYXVTZENaNWI3YzFzUC9VTy9Xc3c0QzZrdTZuMldkRnUyeTZqMzBOckEw?=
 =?utf-8?B?UWNIOGtodjVpUXdpUER6R0Z5R1BPWGExZnhSS2dtME9Yd0t3d1V0MzVKWmVS?=
 =?utf-8?B?OWFUaSt1cFNFN2xZN2xNR2IvbExZMmdoN1FpRkhBNG5oMlBoN3NtWEhPM2sr?=
 =?utf-8?B?emFiZCt6aE85VmNrL3pJc1BqZ2Q5WXNMZEhjcGNSa0hiQmJmSUVlc2t4TFc1?=
 =?utf-8?B?aW40b3lIK1pFQnJ5MWJaZlFIbU9odkhkSkVKa0hMbXVUR1dVc0lrakQ0QklX?=
 =?utf-8?B?ZThmV1p5aWVib0hsSnF1elI0WmxJNzUzUjQrY1JBTUpERk9lSzVkZTVPM1BD?=
 =?utf-8?B?Q0NwNjFpWlQ4VUxvaVQ3cnhXN1pYSUdqMDNZQ3oydTI4UldhWFZWdzFncERS?=
 =?utf-8?B?djIyMkRCWCs3Y0NBdjZWc2RSblRxcFNyMUs3Q3NuaXV2eFdNcjNmc3laelhW?=
 =?utf-8?B?YnplOFQvaU9jOEVPL2l0RjJhRFdobE9Ob28rUEI4N3A4NUR3bmhxV0xCY2po?=
 =?utf-8?B?aUE5OVA0Q1cybWV5TXNpODkwblBOYkQ1WmhpZkV4L0VNRFlBSCtkSk5kdW12?=
 =?utf-8?B?VDltQmRPOS9ad1NvRWEzRnhHVGRjbjU3UlFxb1lmajVLcUtidlVmU0dWSWxX?=
 =?utf-8?B?UzFZMnVLV0ZjeTQ2MkFjZlRka2ZVcVN6TFprdW5kemhqNDJjclhBQXVRbXQ3?=
 =?utf-8?B?L1FraXdIdDVtUDMzdDRFbFJRMFpJWWZnbm4yY1YveE9Id0daMU03blJrQmhM?=
 =?utf-8?B?ZG1QU3U4MlFpWjk0RVN1YWlFU1g0MU5VWEh3VTBtYWs5NGJBSWZJdEZvbis5?=
 =?utf-8?B?YVRkdGpBRDRvK1BWVXZuM3dXZVNWSHFDblNEbCs0V3VhRUxVTS8rZ1puYzBq?=
 =?utf-8?B?SGxIU050OEV6TE0zam8vN1lTb3hhL0EwOHh2TXZRdEZJQk1xNlMrV28xSXNG?=
 =?utf-8?B?a2FKMk1vbktNVUhPL0ZhVFN3YVYvMjkxNWRLRnlhU0xjVWF2cFVNL001OVZY?=
 =?utf-8?B?UlFDdTdZSy85TkYwM1hqWjhiTTlkN3owajlSb29hUXJkNldqT1pFeVowejJa?=
 =?utf-8?B?cHFiblgvS0tYZ2dEUkl5b1VIR3VLdS81Z3NUZkZUcm9FUTE4eVAyQ0gwSlRs?=
 =?utf-8?B?WWFJSUtNV2ozUlFUeHluZmZIa1MzSkpnbGxQTTZJbjIwcGFzT1QvcFdDaW5t?=
 =?utf-8?B?d25zd2RhUWtTNVBJV1hSZEVSYU0vYU1sY1k1OURjWGZzaUFEN1ZWQktNYWlO?=
 =?utf-8?B?aGx0RndRNFV5aGlLVWhtc250QWg4VWxDZG9KbTJnVGNnOTNBdU9kVHZPOGM3?=
 =?utf-8?B?bEN0M0JDclJneThudnNVY0YybXZLRnJpdWFPY09jNFJxTE03bFpaYU1KNHUz?=
 =?utf-8?B?Z3hjWXpQOEdrbVkyRUNjYzl1S2tQRTQvdVM1SnhzZVZwUzF3TkJDbU8wQXk1?=
 =?utf-8?B?R2lWQlJCRjNWZThjUGlLc1AwVnhjY0xKV0ZkaDRxSHd2VUdpeVFFVm41M05n?=
 =?utf-8?B?OWlHMDdORlF3UEtoam9kY2FNOStwMzhna09IREtQWnlGakZtRFVJdW9BRUg2?=
 =?utf-8?B?NmlQL1lHWDBZNjlCRFU4bW9ZRkl4RE1hWG14Z1dGWjJSakRpbllKTmI4NDFX?=
 =?utf-8?Q?0EWHsaFIj7GsU1xFVK8hz7mu4v1tyFQCEB97qAPdpZp3a?=
X-MS-Exchange-AntiSpam-MessageData-1: 7YAC9etIz7a1ZQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0cf4bb-ae23-43d8-8e5e-08df196d2177
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:21:05.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y59V00hilIdgLzwiZmqE+JTCWZ7R/hsqwgO9lKn2DxaqQBFbve6FOrqhJlFKnrHlGcc9CFvOf4jT2ChR8+l5EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> Msgq is the pair of ring buffers in shared memory through which the
> driver and GSP-RM communicate. The command queue carries commands from
> the driver to GSP-RM, and the message queue carries messages from GSP-RM
> to the driver. Each ring buffer has a write pointer and a read pointer.
>
> Msgq v0, which the r570 firmware uses, keeps both pointers of each ring
> buffer in that ring buffer's header, in shared memory. Msgq v2, which
> the r000 firmware uses, keeps the four pointers, two per ring buffer, in
> four BAR0 registers instead:
>
>     NV_PGSP_QUEUE_HEAD    command queue write pointer
>     NV_PGSP_QUEUE_TAIL    command queue read pointer
>     NV_PGSP_MSGQ_HEAD     message queue write pointer
>     NV_PGSP_MSGQ_TAIL     message queue read pointer
>
> The GSP numbers its queues 0 through 7, and each numbered queue is one
> such pair of ring buffers with its own four pointer registers, so the
> hardware has 32 pointer registers in all. Nova-core uses queue 0 only.
>
> A write to NV_PGSP_QUEUE_HEAD also interrupts the GSP. Msgq v0 uses that
> write as the doorbell, so nova-core already declares NV_PGSP_QUEUE_HEAD.
>
> Declare the other three, NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD and
> NV_PGSP_MSGQ_TAIL, each as a scalar at its queue 0 offset rather than as
> an array of eight.

I understand that at the moment we are only using the first of these
registers (and `NV_PGSP_QUEUE_HEAD` was already declared that way), but
technically they are arrays of 8 - let's take the opportunity to declare
them accurately and stop deriving from the hardware definition.
