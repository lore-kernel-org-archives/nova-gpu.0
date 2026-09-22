Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE626AC5
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045132; cv=fail; b=uxAZxOBtvtvOQWvHfMmlagJUfD57Nuw86zK1allBWxDl0PBYFzC1racQ0kWvQgnyJPffULahKUGmMwxEcgjOU1obxdwYXNUZEol9j14ZI0D33OHQioQmzmvXnoehVomWnyfDPP8FXZ29Jh5DfaUBQ+VEqQ2YADKGfliDPScOrhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045132; c=relaxed/simple;
	bh=BDHScZUaZpwm9t7qdY6+DlftghgbDdlWqam2YVPnekU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bhq+wVO8KzDB5lqGugvx4C1LM9nWSqYpruebC2wtPkHNhGXr68G52B8c36UvSKmbkqPxvp32RfYVmcjihG7EJarrd+d7sY2tg1WQ54H7Kjls6+z5rbcOjLRNTwnkrxE+4v4kzaDREzfQ6IYNRDwZoKKIhjtwbRYnwhdcH8yXrO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s19G8yLU; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s19G8yLU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6UCNWGnOQ5BuNAg7rozg84ac8AstONf/uCg0tGtYY9TGGyDec0IdZb+YFZPE9sAUpoYbzyCJCiihy1X0fwwOT8N61yz2sTG/3qnP3Ejt4/+tNzcjk3+gD8o2cBMkNKc40qd6BgV9/3/WLF2wNULOBQYn8K7RvzZ7cjM7gG+Yhkm2HifGINAwl4P7hKdG5F+HsqFKO7lhDsOVR758jWlbbwq5/c/HLwef7SCk4RxtIuoIyZrRDLgONJSsQs4g8INMisLOuweUKwDxSHli2vODPTEDlRwla7uhxoR7u+XOzcebyFPxLFo/f9UCaG2ySRTnXgt+/Wj1yRpbGooJ0hGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euSpdUNeZeuRaSXLXBicJnChYpkmw8yPa8J2jqH6sq0=;
 b=WG4cJGT6N3BGFyAE6Ot19DSeANQz0KOCeEdu0IdaOeZj+6bz9GVxItGE6+elanwAJ9Y5EeNZuW+ovOiIbB/ZDbSrcLK4m8sT6uby0wJPn0ge/VBMowoJ3cZBPRwsr/tx7kcIH5gJU+hvThzD27A+0m3OodFpB1VlUQAVkhdwdGuEO02pJHtLaWElhkz5UwWJ9+BLMrqCSO5ZMNy9tnKe+lQCetGBYdiFTbs1szIpZRpUvyRJTweZ0mSwj3Bt558l2AgzTgT49zFsIW8Wker5/iQBDUYXO6SzQrpqF04wil9Tczewgf5YHDo5yor3vReTptM+k9a4o3+HYayQX3lqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euSpdUNeZeuRaSXLXBicJnChYpkmw8yPa8J2jqH6sq0=;
 b=s19G8yLU17cfIVc+RPu9U9Wo2XoHmgNi5G4n/39TmLcLunCE7/tzp06HmtYmx2Y5IA2LuVcQQUrC0DNM59fyUJq4XVHHiIO5IPaL03851W+3OtYqWC/aSddebHrzrsaVDdEkQ/jgCX5pRXq8SEGUeq7w39hC7LWGkObIJqCKE15GV7Ae36T+AZe9dBt5gWltvPGFb5ZbTYdlGFlWO/o1GOtMg/aq9j+18vmqCmTPMEaUL7on6Ef8DP7296IdCpdLeFYeIirfCTR+CNcF2eTqbKAEcZk22cAUHFFnRoCWKEh7B38zwWqqHbDKDbWO4wC5C2MPp4jkKp6C3YfAups3Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 02:45:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:45:18 +0000
Message-ID: <58d57af2-2fc2-4849-9ca1-119530efc44d@nvidia.com>
Date: Mon, 21 Sep 2026 19:45:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/33] gpu: nova-core: boot on the r000 GSP firmware
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
 <5e63e3635251247d2b93134939e839f3ce5824f8.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5e63e3635251247d2b93134939e839f3ce5824f8.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: abf0d6ad-7f61-4c8b-4128-08df185389d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sD8vnN6dL00pAhMIsoTH0W5C22mT5OSdI1TxVI4wLgQIjosJuligxx6BjjuwgRaNU/MW+juFQPtmYbkzztLrzKLV9202QrcYw8NlrnVniwmJKykx/UXECOGbcmk4qz6ZEkAXNN5j5wfVjF3zgzwjoi2a3jk8EfudvLpYfIg5qmb2533lfiOe96kGojrA+xVfug6okIQiBeyTbabe4XRGyfhfWt0sSNZa7CzPKfHD/CLIinwfroeUY0lzgKBCYO9zXEgm1VaYtpVEa6Binl8OcVCyj9M4ds2fSfpQ+TdaZ8TuwnlUNflMk2hjteyDicm3xRZVKs9xXEIVFcFeV5F+0QVzYR21z5WUcRvQA50SRiBsr3yMVkYq2BgJRFr0m76qOvkvRp6R6ciAB5KJdpBlH0qqa1ttIn4gjnyMtMy2lQvI4z+4HkqUzpxIErMc5y0BmXqS6wOFTx3JuU70/lwmDeGj7NxBvuoeOGkrN88Ah2H6cnVG8AXl4zB/BWMMtiDiKN7hy3Xt04yL9pu0thMmLZmY9xnC6AXvbCxIaY2hGDFAexYfTWwiXjxwPlq7cVXJr55FOxyibtJtEGXK5uvw6xWmXEBWfjemtyk8DVjQQ0xgNnszssGCtXveYRj9T0BMdzjKWtn7SQushDpvsKPAwkEEK/gNWDDom2X8edLDH8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0dHTGFwbzN0TmtJVVJobTQ0c0VwdGZKWXFpUmJoY0ZUMHdkRU4xY2J5Si94?=
 =?utf-8?B?dkY3T0hZdTVHanJmSlBRMExDSnFTV3FoblNxZUYrWXRJa3MwZ2NVK3YweHZI?=
 =?utf-8?B?VnhtRDhtaklhZWRiRXBENWZOSDRiWU9ua1ZBM1FEdlZ1K3JtWFZPUlB0ZzVF?=
 =?utf-8?B?TkJZU2xkZWhiRnhxTHF0bmc0enZTRkwzWERIbzYwamZ4blBadUoyYkV2eVZq?=
 =?utf-8?B?cDRYRkhlMEpQL0xjd2duS1hOZ2hVT1Ntb3E3dDJRbWRRRHJjYTM4RFpEOTZy?=
 =?utf-8?B?NllHT2VQUENQNGR3WThDSHlISGJjeFN4VDZvY1JMQXJFZ3M1Tk9rbUV4bUgy?=
 =?utf-8?B?QlQyT2h0UGtreEtRTjF6cnBGVFdyRExUTWN5VGl3dDk1L1gybHhBYkJZSm5B?=
 =?utf-8?B?eW9EbHNSOVp6YjdmNnVKMytIMkVCOENJWHRxYXpMZzhjR3d3YnlhbVdYbTlS?=
 =?utf-8?B?MkV2c0kvdHZiT3U5RjZWZVRoektJRDFqKzNFWldNNmxYcThVaWhvMXZqMVhi?=
 =?utf-8?B?QWF6OVVXdms4MnJUbFMyZEJmdG5ybldJdjNmbXRnOEdNUWNDa05pVE0yRDFO?=
 =?utf-8?B?QllOS1Byb1A0Um1KZDZwZkIxbUUvSkhRNEpGb29vMXlwamxmZVZhUnlycWw0?=
 =?utf-8?B?eUwzRENIQnIvYnZvVjBwVDVsVWJUZDRLWTU1SzJ1UGhVYkNTZ1ViSDIva0o1?=
 =?utf-8?B?Sk9FWGhHcFVubXh1SVZYRVM2eFloWk4yTm5pbCtwU0FEajNCN29aNEU5UlhW?=
 =?utf-8?B?MEF0M0FwdDNZSmtYRUprcHhsb2dwSkNqTEY3M20xMXB4SzFTK09KWlVkZ0xR?=
 =?utf-8?B?Y29pczdFV1FBNDlsc3dxSC94ZjhMd1UzdU1PRTdPSnR2UzN5Z0dTL2ZST2ww?=
 =?utf-8?B?YWhwd29jSnpQM2dJdEJKQm9aeG9ERlN2L0RTOGw4Z0VkTEVaWnA5dGRwUTVR?=
 =?utf-8?B?RFZYS2RwT0d2T2VudUFkRlBRemlRSmk4aFVnUzQyVFE1cVp2UTFmR3RreGs3?=
 =?utf-8?B?bjFpSldZUTcxandlMUJlc3o3L2ZqQ1lHenR3T1JQT2ptbnFwQm1SdDZzc0hh?=
 =?utf-8?B?SVBMZWRCWlU2dEtlUjM3ZnVGdjlIdTIyQ25oQWdBZHFVZjdKYUZBbXVNdUZW?=
 =?utf-8?B?Z1JiWENHaUlHRFZMdTNFdEk0WEczeUppQ1VFVHFHMzdGRmNGdElZa0JlaFBX?=
 =?utf-8?B?dUZDblRmbjNGT3ZQSldZTU5udGpnLzRLaGlOdFd1VlJUZjdXOWtFUjU5R1Bl?=
 =?utf-8?B?OExmOCtjVUoxVEdIMDBDWU9BWkludVY3Tkh5WmRjbC9Dd3pDNUxaTCtHcXhL?=
 =?utf-8?B?dWZCQ0FrN3c1djRGeXdEZTc2Y2RWemNQNFBqUGdxU3RDUmNiRlU4Zm05bEVF?=
 =?utf-8?B?R21GeDFWL1BhcmVRamR4dGt5bDUvMnBuLzVQWk1PSkNPQWdjR3lQZjRnblVY?=
 =?utf-8?B?RkJTelJPVmdhYyt2NXJGY0ZDNVVjZFdZTURvdUttR0VqTDZ1U1d5OFlNTlNz?=
 =?utf-8?B?ZWdYUVN5dURBWmlIb3hodXZGVTVVS2pXYmNNMURrSktXbDdRMzhXc3hiREVS?=
 =?utf-8?B?Z3RidHlqVk1EV0xKR3NNekJUVUpDVExPd3g0cjVLYUdDZU5MMGZjcllPY3hD?=
 =?utf-8?B?Y1lMdGcwb3c4TGU4N2c2eHZNNzAwMzgzVnVnNDdEQjlzS0g0cmowVjM4a3Az?=
 =?utf-8?B?aW5FV0U4UUhsMlM5ZndKakJzRzdlTTZxaW45S1lvVEFHcnJZMHVjbTl0S2Ur?=
 =?utf-8?B?c01ERU1hZk4zMWJCeEhwb05NUVpFSWxVd3l0V0NOR3JIeVlXUXM1eVZSSW1J?=
 =?utf-8?B?TnhBRWZLdkNuNk0wNXp4cDRrUWVWMVdOREc3ZGNseXY4Z3RqVUlPdnE1Ymow?=
 =?utf-8?B?dlNNZkw3MWhUd0ZTdFZhOS9FVFZDZ2xvdnhZUjd0cVE5b1VaWHU2Q3JncW9h?=
 =?utf-8?B?azVkbWIwU2drczdENDJVd0lvUG85N25OMG12VnVpUkFLczdWZUllOEVpN1hM?=
 =?utf-8?B?VUZnblpPYTZnZ0NmQy91b2RyZ1llRHRpZERtWWpmakExb2E5YjQ5N2QvWHYz?=
 =?utf-8?B?SXJZQUFYU0dDbHhOa2FSMkVNMzlxY0NKVHpSaXd1MnFicllaWTQ5a1p6bEEy?=
 =?utf-8?B?dFc0eDduc0NyY2NJSkJaY3JQYjFJKzlQbjJKbm42Rm1VRitPVjVVdFFYQ0RI?=
 =?utf-8?B?ZkJtWlVUVlpieGwyR29PNHpxY3hSSndLYkVGdjRYN2hLeVhzeUdxcTF1MFVz?=
 =?utf-8?B?eDQvVzdpN1hrVlc5L2o3OEFOb0JDSE5uenRad2NmTjVoTjJNTFFUMVdNTDEr?=
 =?utf-8?B?bW56U1NvM2UwMGNtRk44VytHd2VBa1p4akxGdkhMajk3RmtWbmZwQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf0d6ad-7f61-4c8b-4128-08df185389d5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:45:18.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7iJVC43C6WTnzuWgfELYoCiUKID3O+eKgvc6AeSWuchGTLicxW5HCiL7TBA1kCi1aNgfB2oKDd3o6fl5b879w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

On 9/18/26 4:08 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:06 -0700, John Hubbard wrote:
>> This series moves nova-core from the r570 GSP (GPU System Processor)
>> firmware onto the ABI that the r615 and later firmware releases share.
>> The driver calls that ABI "r000", because the firmware files carry no
>> version number in their names.
>>
> 
> I took another look at this patchset made a few minor comments.  So FWIW:
> 
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> 
> I will test it next week.

Thanks for the reviews! 

thanks,
-- 
John Hubbard

