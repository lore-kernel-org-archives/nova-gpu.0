Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1393B3BEC
	for <nova-gpu@lists.linux.dev>; Tue, 11 Aug 2026 03:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786417768; cv=fail; b=aJaPRAEs3rZDQn0ZvrmL9r6uO9L6lbfK1ym7BxvNf00eqywSv6R9tJtByCeQGsJxT4UthWD3ep0qqEyQ9Qslqrbd4CigSbQMA6AtbrYHcHKVMkLOFTsY54SAMDPwgs8Qp1ssiC30FaNJfEcutfvpUCIwOGiQ+8lwGa3xjQXQg4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786417768; c=relaxed/simple;
	bh=Tm3D2FM9bgMmS7j6ILZwuginLk6WF0i+Gw88v/LZqAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KpZTJWeGzgGLpuzAiHQq9FsebSHZuO36WV/CcLFsAgLV/GhGreQqSZ95BpqVk8Gvf2ebQw5I1JVPPsARPnvamJCQ47kMYyBJabc9gY0oahOX8NUDUlhNfBKlLySFvjodXpSnulr58gUNTNcq9XmYUGVrhnhraOBsn5NRROz8BeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PqPriLpC; arc=fail smtp.client-ip=52.101.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PqPriLpC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQKb3XcQHopwLSEEBphqZ+u1ATXJFdtNw04w3vFMQdZRku0LgK7GOZY7qsLpmVk0IZwdrowH40BB3dxwM/4ZcTKVcgRs3UbiRNbkfv0bIj5dvSZjUTM0LjRT1vun4wV6phSLx5i9GyLLjw8oc2WGvSugbyhdbf2g1OwnnYIuv2w0+VgfHP/f3rG22+65/q0wpv5k41IT+qy+FKJHWRcIFR/kX1cVUpnwVJrYwFdMc88niEC7P/MHAhUK6AGFLfpqP/YLN36cYXowsMtx0VCUkSUygxGWv/Ol501oLpGzfUAvHfBsm1b+Z+S57qHPW5GB5xLf1phXepIf9PHSeOLJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMVSXutmmoDtB9r4TFWDSMU8peFUl3WPiLSXmjH79bI=;
 b=SvyVQDW3wNm42RHHVebwqXKf31iz16ENsOfmZMf3sphXEyCSyiSNxwxwNFE999SRei7cV3TfgqTNvQii5Q+nM1S7q+8AEmzxoRo2H8n7KBS+F/dc3L2Gk9vjGhBk72GlTE4h/U/G+/pHxeA0wPObsYsSD55/6USu5R//nRJ3Ko9J2xV/WFBmEZzbZJdeX/Ek7Ru1PziFThR3EfY3208rb1uKKJ4MuwY/46NDiq1sx93ubqnOL4iz5c0oaeA0ivz2FiMD5sCjcv5VwtUSPuqOWrN4gvC5QsTQ3Y/YCQgI/FKXs2Z9HdwcFw3sYLZvT8xNIE3/fKxQzr7+aBX4Ioor/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMVSXutmmoDtB9r4TFWDSMU8peFUl3WPiLSXmjH79bI=;
 b=PqPriLpCJdxko/IB2qhbs04FY4/OLvrsZUzxOZff4M7p0HEfruHjkxj/9M+qrLqfFkr6XDo/9WLWFFZ5nqiRkNQEUZjdNyVe7ONDUhYPnlwSfPVJqvXNuNdcdhOSwuXDNmjo4WJPFCtibvbJ4uqYHgr4a9RVFdTbo4ojiyz3luTBYuDbT0lhGyrzcx/nBD1rLLfOW6hkBAkfx9Z0MRrzihNYNER9ntosacrL2M+Y7q+46RrV/0Tupgrilc2jW12ImIi8G4IgNz8NSilRPmpKrucqn4NCcy1tB05kX6rkKdDL8wSqi1tsx/JJTUCx+2PFun6vptsSkHRvaxoMK5eQ2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:09:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:09:20 +0000
Message-ID: <6d08c833-adea-4b34-a9eb-457cc4fc0ba3@nvidia.com>
Date: Mon, 10 Aug 2026 20:09:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
 <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
 <e2aa36cb-984a-4f8a-b6d5-6cb70a31a30b@nvidia.com>
 <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKLMSULDBL2C.1JSX46NQDH1JU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 09033feb-57b9-4b5e-af45-08def755efc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5uDj35GCe4QpWtBbC24fG5J80inkwpuZtpdbJ+XyuF2XYxB37UE5FJ/Hatu2ohLAEg24uFdvqvM7fSwUbwzme7h/1KcD8Flulp8qzsoMKCuR0t8A/+7NVqM2u0La6QCXAClkUkZjgrZrB79CG2yqcBXXCwF1AvuHUG4yiXvzQgPRIbvLBWNNbvPKWiwq8UyGUS5BpLWse8m2c+pNZKze3YqIQ2As8Bx4h7Z5FwcA/WWmC66dGiYAnNhUNVXd/d733N94BlxyD3DRn7AHVIn+ICURSnOWlZZ0KqSRerQ05kgj2rK+BD0vyLMQr60HZaO+GHstlpKZ46TnOfpgQS3HQ01lA7QzRQTPaRbj2uJfg2c+dppWI1Pi7+Fz7YUfKuIzKQtLIL31F1w/vT50Y6KVlH83jXa9VKGoMFEOYL47G/w48mFj+pYNQhAlWyxV2FLeMdBtV6j0iME/QY9gPllZP2kkQDN+L0Bh4kiqsVqR5YptPtxuUSr6Dxo0Z7z8hlmLWsA9W5jhV8nhJeCiagOhMrt6bm4XS6pujfy52hCxev676AcjQvdetbhAWiZ0/6QLUXPNY54X5BxrECnH2hCgGzqW5WVehnAap+dTTbjcOlO+/58hvENZT31/j0729b1p2tji7v1nlAvGLXmlpvhWYqY+2yLwhoX5eUmIKj8gmEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVwZk5WWDhJbDhwRVlWcUZSSm5KWWY3dEZwbzNnVCtHVy85NkV1eVVPMmUx?=
 =?utf-8?B?QVEvTlh0Q1lBWDNuOGIrU3NmTjFqOS8veVJleVF1Wkl2OHR0eDJhaFBsQ1hS?=
 =?utf-8?B?dnowamFaSnVlNzIzaVp4TnNiSXZUdy9HQVpuOFpYaURSRkJiZzZzS0NzZEtK?=
 =?utf-8?B?Ny9zTkpLeE1MVERJc0xQc3BjS241aDlvWDZqZmdFbm45bVVybll6b2g2bkFP?=
 =?utf-8?B?T1JUWjJCTEJVTWY0Z2taWWtERk5jM1FHT214VytoZG9BbElHYWVaTDVQM2d6?=
 =?utf-8?B?N3lYeW4yU0RGVXVhRHRMVHRQUEVKSWZzb0pQY3QzN3AxMTNVNGRHTlY0a2NI?=
 =?utf-8?B?NkhRN29HU3Z0VW5aYjVRelU2ejFHSU8zU2dLTGJJVXJtT05vSDRWOHVsVzE2?=
 =?utf-8?B?TWI2RWdsckVYUitzajQzdGFQYnNDT0FjbnFGMm1MM1ZmOUhZbDFueWdvRVUr?=
 =?utf-8?B?Y0VZdGhxWEhnQ0VQTG1pQU5lelJxd093dVJjUXhQRmNWRUlqVEk3RjhnTnJX?=
 =?utf-8?B?S29sOTBQandyWWlpOGVwMGo4cU1TSmRNM0lBeEhUUFF1TmtxcFlrL00weWxS?=
 =?utf-8?B?RUNRQWlTaEx0aXBBRmxhZEplVTk1djE5dkRCZWJaNmFUcm5YeDFsbmNtV1h2?=
 =?utf-8?B?Ti9tdHRuZXpKOWJrZmxpQVArcDYyZ2ZmdFNPYUtyZE1YNk1LaUlpcjdkVkZn?=
 =?utf-8?B?YjVyVDRnbU44M1hYUFBCMHFQckF4VkkvSHBaQ0tqVmxPaTh6d2w5bEc5Y1BD?=
 =?utf-8?B?NVZUUWh3QllWM0o5TVBBUG5SZ0kycFE2Vk9EMG5iVzhqZlNDaWEybnR2cVdR?=
 =?utf-8?B?ZjJBTjVXeUpTMmZCK1NCd2d3bzZSTUoxcm1JdE1tVzlPYTRsRGZOcTRZL1k0?=
 =?utf-8?B?aDBkK2J5REJIWHQrU1V0OTF5TXJZY3Fvbm4xVXRRdVBpMHN0cXBCamgvSW80?=
 =?utf-8?B?WWtmcVZCSTdEd1dDUURmcnAvV1VTT09IRnVFNk9nRzdsZS8xWnB2VGRhVlow?=
 =?utf-8?B?ZnNrWU5mVFBOQVNuOG5WZG1yem5LbmZpV3ExdDlwZVV1dS8zZmJzSFlqRlJh?=
 =?utf-8?B?SCtQdTZOQ0FHZDEvNkY3ZXEzNTFMY2oyM3RraC9rWEg4RTZNQ0d2QmlxZTZQ?=
 =?utf-8?B?UHByTDY2T053LzMvcXhKTUpGSU10Vk5QVWxWMDhkOTNqNG01SThtV1VHaHZC?=
 =?utf-8?B?K1V0NTl0YktaeDVTcHpDemJPV0syQStTUURndEFzanFSRVRmNFVJeUtJcTFJ?=
 =?utf-8?B?WEF6cDRsU21KK3RJaHJKZjZGNFBVVGhDU1hQZ2xrN29rOWJhWXFzRlViVGtZ?=
 =?utf-8?B?M3Zsc0FScTZNaUNYNytkWks4bHUxYWJiSVo4TThWZUsrN0h2TXp3ZlRuZXRK?=
 =?utf-8?B?d0xvTGliNlV6WTZXOGwxcU40aVpGNnZuVytyZkt2S1NMM3N1UXF6VFBRNXpr?=
 =?utf-8?B?SWw5eEwwd0NJR2pFcDBSeW9jWGgyb21oam1WclZ5R3JjazBzdkZuMzBxZTlQ?=
 =?utf-8?B?aVcrNHZodzV0bFdWTVpyaXVaOVhRU3dMTkNiUWl2NEhvMXEwN1BXUWlCSlZG?=
 =?utf-8?B?bzFSY3BERGVnYVVsZFovd1N0YzFFK3lEcEpqUW8wUlVENFozYXc5ZzlZVGxt?=
 =?utf-8?B?bFNrT1hzWXEvb1ZJWUw0WEJwSWFUb0pCNHZ4Q3diZFU3ajNFL3FFOFVYYmRr?=
 =?utf-8?B?bmtCT21GdExZQWRxS2hyeXMvVGdHdEo5QUM4d3dEZGVWdGdrR25UQUNvWWha?=
 =?utf-8?B?QlVTRHpUZE95UUx0b3FDRDlWVi9CT2JHSEVpSEs0V28xNmk1dnNrbUtYUGFB?=
 =?utf-8?B?b21CczQwL1hLdFoyMVk4Z1lYUjJONW4vWEUzQTU2NkVqODRZM2hYdzd2ZDN2?=
 =?utf-8?B?NHhEYVlsSWNnbFJtWi9iMlVGRkQvNU42S2NqSEFSQTJVblB1L25DNlFzWXVU?=
 =?utf-8?B?aWhSdFM3dHlxUVJlL2xBTTBIbTJkeWlvU0lKTGtwTTBobEN6YVJxcHVSZ0tQ?=
 =?utf-8?B?K3BZengxVEZSdVhKa3ZKbk1ieUJsdFo2SjBIM0NzNU0rNFhkdjBKYnBPTEFs?=
 =?utf-8?B?aUFwSSs5dVRHV0FNSDlpS1J6YXk3YWMxN294VTlkMy9DRDFOMVRrVGRwM3hO?=
 =?utf-8?B?TGpmQVpGMktSOFBLYThaMGs2UDcyVHA5ZFRwRGJhc0NTWW5QaXJzZ2ZFL0Ry?=
 =?utf-8?B?UWgzL2lxNnV0clZJRmd1RU1lMGE2NlF5dzNmUExIaWJzcG81TXkzcks4aEJn?=
 =?utf-8?B?N2ZqU2tzcFhGRzF2amV5Y29xcGY2T21LMUFDbDlVTW1PRFlRd1JVNTJFOFgz?=
 =?utf-8?B?MVhaV0IxK1VSUWNJdFB2WVpDdTlNVzdhc2JiZ05xSTBFZWlzelFLQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09033feb-57b9-4b5e-af45-08def755efc7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:09:20.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42zastMyRILKQVZUniH76Rr0oLaI16WWdW+gcXAtTlTWecuzsQGBKKgoQKUo1ssCaHbU0SBOHsh+EGGAHIDb2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

On 8/10/26 3:53 PM, Danilo Krummrich wrote:
> On Sun Aug 9, 2026 at 11:42 PM CEST, John Hubbard wrote:
>> Yes, please. Then my patches 2 and 3 collapse into a single patch that
>> adds count(), irq_type() and an index-to-IrqVector accessor. Or, they go
>> away entirely if you end up putting those on the type yourself.
> 
> I sent out a patch series [1] for this, applied your nova-core patches on top of
> it and resolved the conflicts with the diff below (also pushed a branch in [2]).
> 
> Note that I optimized for a clean diff and not for optimal code. I think there
> are more improvements we can make; I will comment on the corresponding patches
> of this series.

I've folded your series and the fixups into a v2 work-in-progress branch, here:

    https://github.com/johnhubbard/linux/tree/nova-core-gin-interrupt-tree-v2

Let me know if it would be better for me to post that now, given that the
earlier parts are all different now.



thanks,
-- 
John Hubbard

