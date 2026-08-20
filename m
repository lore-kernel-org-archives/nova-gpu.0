Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F0D44BC92
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254203; cv=fail; b=jSbLymhzI+PLWhL7DkOPxwCmOcWPZfeRkNu2KHsxdOGU7cZo6Vmt7xXfHaTwTzgSv490LvDl0MZsLY2mA30qY+pZMxejgVFwB5KWndE4tYdp2DuJTdMjZVoIBOaBHeUCt0geQpDto37h2cpBLsngzbvEvJdnpVGfjd3JPQtcIN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254203; c=relaxed/simple;
	bh=G4oWT+HjMkPRFRmZ3kGUymYWpTFcDeAYsiVhBqpzDvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=caf+pNwOd1g1mL4bWXUt6TL2+4EJwQ84i0tiTS31tXOq4qe7UKWYyQpQkoW1jhbDz2nwQZP9H32PgVTUdZ333NUXln7fOYwXJ6KxlzFxj5Mn25PfmIj34VYZCAIj1FG1NgzrkdJ4YLjNM+UdoJj0GvqdBl0kAMLWLycMgSVyO7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O6YUpgS6; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O6YUpgS6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpmeqSU/zwbbKR8O190evp+GfqlK7ZJBwDS2Nn12s8F2gkRTB+Undz87QXgNbQqV0FbRB+4RlU7Lu3dZb1sCE6vIbRV+rnzG1e6h3YDekIMz85/MV9OjDmxw8F6ZXOOIYPVWVvAy3xYtBW7LBIiUpQ2J6FHa5TShTjzgYRUOmwuehpcfhfzCERHw9TH2vML+LY+8DucRk3YyigjlR17qhYI7UGGGSAJ5TfNzunxg4au9MFTUpQ2Is0IEojLjnXPg9PmpUNJisvKsL7F7dAA52sLkm4ZN8RINOeB/cnO5GiXNqlRDJLE2wQaaabxPXIygbOuc6u5Mvu3s3FKtkvQ3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBm6fuP7BsB1DHrOzC+DWn7NQFaOhLOQVjasEXnoXj0=;
 b=Q4lOdZfBwQ+llGRiu1ytQts9jp7OubYrz+aItnic+LY3LDGNzxtoxeJEFj5hpfzlirvFB4VI2v8e2MPDvoGwPSnmi/WxQEJkU5KV+ZfVOZRCWSLyhn3UYmeR1W2Wo91otPktFDOJszNhaNyug1pYgpzDGW/LIn9NiGPnNmJjMXwaeTQLRYN0E0LgW42ISIXCRtwIUeRQL8pheP1bV3O6qtL22LC3bbjmzillR9kmVuD2akkMikoFxW3yHgO7MPh0+bGcZvQPycGw7pqozlwLHYdwVHrg4kzuG1FM8aavNKWlaNxdmf1plAsKt3qXKnownIHKb47hqDL0GkBcGIeYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBm6fuP7BsB1DHrOzC+DWn7NQFaOhLOQVjasEXnoXj0=;
 b=O6YUpgS61+PGyoLPIJCXpKFFtduDGxY5sMhAGfu9H7c6YucyFYo4WruTvN3cKgfWs8Cp0sYAoojY9g/IZnjjnq0xX4/rykwGx7jQXR/OIjA6Dr3DuXGBJ1rbTAR8yLltSXlckeUXX5TqcGa9ch4TlAEFFQbYKiu3Fe/FVzj9NMPboofTLIXV1ggZ1KwwUqUyx4CXxCuLTqCjL7F06NtJNCDGITaHwqpuKzN97T8/SF2f4pGUZeSKlzZPD2CfqPIVwZfGnyK1sdcoVo449Bee6+79KqsSayqePIWV6n54BNEl2aPxViptIaxh9ri2ReSzyGj6b0A5nTjcwBeViMaGkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 19:29:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 19:29:51 +0000
Message-ID: <5dce9a41-c7ce-4731-aa53-51b6bff70459@nvidia.com>
Date: Thu, 20 Aug 2026 12:29:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/27] gpu: nova-core: boot on the r000 GSP firmware
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
 <b50e08bcf867d7d61ba61c7ee3468bedacb742e2.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <b50e08bcf867d7d61ba61c7ee3468bedacb742e2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: f389d1b2-ace1-4404-6eaa-08defef167e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	w8mobui6GnAOtE+QAKeZo+wN+vhqTFMPuiHX72V97KEG2NNQmLJ3DsPbkTFhqfkhAsU8El8fPNBoGMjT0vbrIb3M0jTtU7W5Lha4kvKIWtRr3Q42q/CEuV3RBKIPPImBFxHtRnvm9Qe9bHjtO3m1VMEsAsBpRrJ1lhA8gGdrzPzVrGRg++k+QK0q7kQaEZipCzGY0KjqXAn5aVX0AkfFZZIq33HYrduazuYKz1ehuprm58QAqJeaenumxFYXWdLWAr3ct3tDfJf76Azhw4YcRHQX5KJnpAk5KyXOjFsbhyAkIxF+NqlWtRIe0usS51Xc8s91FVd1V/qNwVIOeBy3Ea1dHWsmvlAgJmZxTJvh+Rcnk9XCPiBZ/91C67gtFqn6dcCwg02teTqPq36u4Sjy9d8ckY1h9MUsGKThMQN95eddEF9NIyIL8ePg+zHkvBg9lcVb7y8lYoR5CeRgvZepwcO1JzFZua2f9ymDYgQFKs170dzBezZUggxU5aljnYPulAJLNka5VBWtbIljpXPtrZPr8Rso3riDt9tL7rXj8KJkL6QzrcltABrizHc7xJrLLzRK7+HPsWUkxSA78npwI9hkgQTWiUXdYxt7uTY3Rq2bI6jpKA67hL5Dw6kGoaeSM3ELIL57fM5GiCKL76llnqWZD9zns/67fkZtU987TnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0RYWFNOT1BlSHZ0VzA3b05leEVCdjA1MTVQTEpUSjdCV3Fjby9lb1hhSGdG?=
 =?utf-8?B?QndjT1VXQUVCRTNoNmxTSVNwM1gySVZEc29ROHl3Mk9EMmJ6QjZOdURGbjFM?=
 =?utf-8?B?aDdjc0VSR1cwNW9CbUpyUXJ1MGZVNzA0Sm9JdEV0TUFoQzNGT2pXUmc2WXJH?=
 =?utf-8?B?bGlmcklhU3dmZVpzZksvbWErbXFvcHZPUmduOVcwUU8yUzhtYXd2SjFVZ1Ay?=
 =?utf-8?B?Q1Jjc0JhVzluaDI5TmJTRWhUZ0hUU1hTQktVZklHaEFsbnlHNnFmWmw0STEw?=
 =?utf-8?B?a3NZalpEdTdISDJ5eENlaXV1T2t2SlJhdjdDV1RUTHdVeXkvTzMxbzdzSEtw?=
 =?utf-8?B?V1JEL3NUMG9PMENLMCtXM2FnaHd2dU5HVnFmYk9odzJ3QW1rb094akxXTDlO?=
 =?utf-8?B?V1V3T3pDTEc4cGpoUkpHMUN6N0JMSHlZTDcwN3RpUjlUZXdZamQ5ekhQellC?=
 =?utf-8?B?NjFSbHgyV1FQVjFvYnB0c3NpcnVmQmVSRFhRckR4eThWb0I1QlVQY2UwNnVL?=
 =?utf-8?B?Q2JqRTRRT0ZjL0dhL3o0NnJVTEwzQS9HNFprTG1LWHV6S3N6L0l1QjU2dURv?=
 =?utf-8?B?eXVCQXQ5eDVmc0tNNnVhamlockxpQklTUXV5WnQ0QWVvR1JqZHdrRDdsTVRv?=
 =?utf-8?B?bTQxYnVtNStIYW53akpBbEREdDFRZCszdUt0RjE2a21VRTd1SjhadnNGT3pm?=
 =?utf-8?B?dFpXNFZpcVd3elFIaTNweWFya2pJbWFibTFpSTRIVkt6TG0xaXdYakVYWGUx?=
 =?utf-8?B?Z3ZIQXN5WkNJV3VFNGp1ME1ad1AxZTNhZTl5NnF0bjZYTXV2SzRUZ3MrQ3Vt?=
 =?utf-8?B?UGhtS2UzOUgvWGE2ZUlSMUZTQW5ONnhxbHlZOUZSSno1KzdROVJ4Q1JqM2Ns?=
 =?utf-8?B?RlRDYjZkdk9RNmtVNlljL0JSVERWNlVpSUNVdWdmaC92TkdWTy9VYUt4RVR0?=
 =?utf-8?B?UFJkblN5RTFoK21sSFBLNHF6SzMwRlhPUmRSKy82Ri9CbUZlaW9aMy9zTHV4?=
 =?utf-8?B?RGg1L0RtVndsT1gwNmNaditLZjJBeVk3TW8zNmgwK040SmdLamx5L0xUT21K?=
 =?utf-8?B?YVZFMjArWmtaOWMyZWFXbGk2YW81M2s1bkJmeGZ6bXVmNngxV0J2SGt4bkJI?=
 =?utf-8?B?ckpRR0crTGlNWW9EZU1IdkpnMzVxa0FZY0ZET3gwejdsWi93UW9lK216TE02?=
 =?utf-8?B?WVFwNk9mMTNxWFVreVlRR3BMenhPUmFySHlDMForQmJDZmFhUmVBeWFqYkUr?=
 =?utf-8?B?Y0ZUNEZGcHhuL0JrQUplR0xKVFhseHk2a2QveENoZ0FWTnJ4R2xXNXYrSEx6?=
 =?utf-8?B?OHBjTy9EZ3NTa2t1TEMwNXFpTHUvNEhsanZNYUpXVkJaVUl4UDhyMUltcW42?=
 =?utf-8?B?S1ZZd3ZGREZzUHd3RGtuSDdBQS9PYmFyU1RyWk13K1M0MHE3Wm1UMlVlWHRY?=
 =?utf-8?B?QlNSNCs5SGprWndpeWpBcWZSYlk1RzRVUVBOVkNnNmpsV1VaS1BkTFVzRUd6?=
 =?utf-8?B?QmYzbjQ0cmpCUEJmSnlnME9Lc24vankzcVc1aVdXei9FMGNTMFh1bHVDYUdI?=
 =?utf-8?B?cVVjcXU0SzhJb1dIMy9zWGZrZmh5bjBBSzdvMVFjQ0ljTW9sdHJKODdaQUJC?=
 =?utf-8?B?ay9BL1pKRGxmYVBwVGNKK2Z1N1pIYkRuM3MyUGFqNzBTU1dCYURrOTJkYUFa?=
 =?utf-8?B?Um1MSGxkbmdGbyt5dnpRQ2VYUDd2dUZlU1Ribkl4d2dOQTFGS2ZIQUtqZjBG?=
 =?utf-8?B?Q3FXT1JNR2EwUVJmNFBwR3dXZFV6STRaL0NlYkNrUWtkSlp5c0RaSll3emx4?=
 =?utf-8?B?SElYQWQ5TlpEMkZJallvMjVmbUNRc3Z5QXgzdnJmWEoxMmtVYTM1VE1KWlQy?=
 =?utf-8?B?NUw1Z21uMUtQSkRXNkpPSGJrenlEeXFtK2V4ejREZnNuTy9sOTFqaXNuTEtB?=
 =?utf-8?B?aVJqSEc5NCtOTEZJZyt1ZXB0K2ZCZFlyeTR1RU8yT3ZKOFU0R2RCS2VjcGZC?=
 =?utf-8?B?RGpkR0Nyc3E2c0VGWXRGbzF3WG1aV0c2Q2RzRk84T1p2b21zeHlkeGVEMDkw?=
 =?utf-8?B?elpSeHQ0ZUxlcGdmaStXZ1RDRU8rWlNadHZDY0xhcDQ1L0hYbWtuc3dEM1JM?=
 =?utf-8?B?NTRkVFJYNlZwTHRabTY0TGVjQU9iOGFqUS8yS2hPMnNCc2VWQW9QaDdqTmEr?=
 =?utf-8?B?NnRXNzRpakdhd0F3WVhLRG03MkRlNWdwdmtDUnY1UmdGNGhjZDJuNmxuQTBs?=
 =?utf-8?B?cTZRN0MrVWpZVnpRdE1TS2UxUHNoeVpJMUJzS1p3VG53RFljdXlESnhXWGI1?=
 =?utf-8?B?SmRsWUFoSEJNTVQrSkswcnhtclIvZ3pRdXgwVUVLTXhDVHF4OWRndz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f389d1b2-ace1-4404-6eaa-08defef167e8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:29:51.8709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 477IuGHMD1LXcBMse5J8rn4f/NEnuxLc4qr3KzK5EHHou94SXSlbjC3mNh4Ap3GMYfvjSiGevNVNQklk8Trq8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284

On 8/19/26 12:25 PM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:51 -0700, John Hubbard wrote:
>> Nova-core boots the 570.144 GSP firmware today. This series moves the
>> driver to the r000 firmware ABI, which is stable across releases, so
>> firmware file names no longer carry a version number.
>>
>> The actual firmware is not yet publicly available, so this series is for
>> early review, and should not be merged until the corresponding firmware
>> shows up.
> 
> I'm not familiar with the new boot process for "r000", so FWIW:
> 
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>

Thanks for the review(s)!

thanks,
-- 
John Hubbard

