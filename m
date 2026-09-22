Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8393812EF
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045057; cv=fail; b=rO6LYZXCENQ5sCDBG9XaMdtC4UboPdYDgzI/DfmuT+3E+AQyYNofTg2wGA9Arqa9kuubjQqKoMRFyb1wQB13f9fhYbccHEI+/8N5O9+0NgUDwxqjPkWU9OXXGkwos3t86xMTj+iVwXlotuZkNPBSPkb4YR5u8++skmTCtyshqxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045057; c=relaxed/simple;
	bh=L0h7bTFxY5GyVA781yeqC+smZ18w9+UZnDPm04qCmcg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lhl3YLPu6UXla2gGdTclINCKltBXAcQrwXuq/UV7BmZQkviPi5iW7+OL3Sw1VeUNQDBciPJ2spUXod04Qts2YUyDmfpnuOXsnY095rawj0gSwtsFIjzoxKqL/hV1ik/NFU0xBRPCHNUycoEhavO7rMRv6yu2FUxHiEvcR9quBu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h5D7yUd+; arc=fail smtp.client-ip=40.93.195.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h5D7yUd+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rstDIv1Ue9raG+WGb/YfQytNcpPKDtVpJaaOOoI2P84e7xH0qTHYqZaKPz00EWQW3Xnx+xF9YRNN6Gt1DxfbaWgEiwdFwXueFVqKcS9YY+JanYS/yNxOvlC2+kCMlqAUWUMoPnwgUev4VHLuauNCt3xFH2y2BK3yWGTCbl3oVdEgdB7mTriyiTTNKHiQCqTYynK8EGsJWvb1qyz7mAj2tFzeNYg8nX+3303nJL2pCPBX3//I/nm+ugB0lQGfyJX5oPm6RoCUTekn+sQn2h7VGZuJ0Vg+hMEgpk1s//7DuiFt+tReTbx9xJcbxebyAwTAmfbRhT1AXcNiKLf/mTcATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SMRm8jfe/6Z5ExJD3vxZGOB/gZcM6CmleFMlO+SUuI=;
 b=KAkbSyhDzKdWdy5O6To3zqgGJHeZ2YJ5gTYdGL4IEn2ZDpwECIvl/Jil2sSLiQWmmfdyad6sZwFLYLbbfPzQOgyHch1CZUPNKquQtB5EDXFVm1CZBNiZ76WQS796+30MOoL+zk2o1oNilE90HD+LJEkfP2HdF4z9F5o5NL7RaotJr7ZLtrkfd0EcBB+o4QD7fGikQBlQHvqUz5Yl6QcFndKL/m9j2IZfuqlgVjU4K6KK/cB3dicCGYYXoyvX6oAhl2g8c6wZOWMjchLEPu0EpHwRd0zzciurqHBO0rac3dspMM6ZY7QO9ecg3LQoBwXqdk4+PVOpkQa1EQsX28wP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SMRm8jfe/6Z5ExJD3vxZGOB/gZcM6CmleFMlO+SUuI=;
 b=h5D7yUd+YuwkEkFUuRlr7l4CcRNr4/hubhUvq65NimrUJ/vOb4ASiMsOBL3ReJ1nkd7nJYieWQ2FcNcdd3znTGeAtuViyaVdtIJDXq8aDtGMucXcDpNZ0PM+LYIyYAR5pECcJTgQUZADEw1W3tqqUZEaJr27r3UIBXfbIGSXvbmK3l0QWDLLPjvszSK2dO57grZj2FylLtTASooegXMZBzln3mHScEAbNXUqzl9Qj8iRsobVWxfKgGmSaOFOpCWnKAeet14ojKxGTLZa3hXCr5Jk5AHsmnJZWPxs4JRgsISQHzliW8DmbqDAJCreaFgIKVhpk+CJzs8dkHABGjjYdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 02:44:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:44:06 +0000
Message-ID: <7ea2771e-e2de-487c-aebb-317d4cffaf2a@nvidia.com>
Date: Mon, 21 Sep 2026 19:44:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/33] gpu: nova-core: switch to the r000 GSP firmware
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
 <20260918010719.1176945-28-jhubbard@nvidia.com>
 <9dfad8ed0c689a40828a4cdc4562d067ca5bc3bf.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <9dfad8ed0c689a40828a4cdc4562d067ca5bc3bf.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 91295d3a-76db-43e8-84bd-08df18535eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WEPgAL4ivkcx6Endkquls3mC47ORKyZ7KOPDqOXWic0djFNnJ8Pn3QbHXkNTqmDzKXIyamCxljZYVKYbaiWp43cD0+fWzgJx+tPtbemz3BoPe4munotKccrJ4vzTiFDUcqJJ0rnWXXwgjHzWB5So50DqdOtxTGgOi3ViVBPIRfCJ3T98HptrS5SLj2ZTBr2sBBjPj0XpJ5k+2IP2dyykUA8AVBXESF1wSTB1R8D+YyLGwxZ+xDoyP13VobaFBUxek6wn+VNkkQphol2xZZrNejPlTUOPKJhtqSeYDeB/sTLQsGIpMJEXB3DOt3gHt7wUYbyQZMGQd9wYn8N4dB62/fH+XjjzJOvK8+uF/DhVPIHWok2TBeaTCJ9vekgc+OH3neAYzAhUqh+iCSHz0A+V+aZSrBtHjID6kQWbs5B8A19tOIDcpl/xx0iJV0FCnuCAf3yQzp4Ep5k8wORbi/CDVJiMZWCE68I+mxhxUdMB8N6H8o5eTINPV9CLletsJNhUw1X/Pi5At/2P/7P8fobwntVCyZEN13u3LDFRYEpb3xLp9YJAc07l1BfUgf4rpFaMPooJaY7KyG3vxhWciiVbp7mwdyN0XsZHemtBGOyt8aL3F3XDGXC8/3/5aUHkGxI3/Pjd78W4+J5zg+oEOvMovwUH2tnhSbEIdfkCpr6PIhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRqUTArdUVYRVhLcW9Yb01IMVdHSmlzN3QwQUd6UWJJQTB4UWtUcExINEdT?=
 =?utf-8?B?ZDdORGhoK2ppckErS3IwZTNuaVlON3g4aENVaXlqaUQ3TmtXV2crMUN0NVpw?=
 =?utf-8?B?NGhHczhTVUp4aDc4dDJkdUhwTW05dDNlbnl3Y29oZTcreDFkNytJSHdIWVNy?=
 =?utf-8?B?WVlBaERZQ29ON1krYzM3NlpnTnJLUzJObDZYVkZBSS9IMVRNa1dSb1BWY0I4?=
 =?utf-8?B?ZlZRNGd3eGVNTCtKdGRDSk43YnYwMmNOVUdtdzJ4Um5rMTh2eTNaMStHcDBT?=
 =?utf-8?B?eVN2QjlZbWlxRFNaVkRFeTJXUXhNTml1OEt2MlNuRmllWHJ0eUdUakcxMUt6?=
 =?utf-8?B?aGxXSWoyVzc1aHlDRURjUU5oZGF0bllSN1FyL0ZSV09ZYkY2c2d1QnhkdzBn?=
 =?utf-8?B?OGw3SHM3cDBiMHdvekFIN0JzQVhaVFk0a3dnZHB5TUhkSWQxczIzem50dEVC?=
 =?utf-8?B?Q1ZsdlIwNmhuS0ZHRjZFdzcwMktzbCtBTVYxQXJqUWpSOVZtNUx5ZXRPZmVv?=
 =?utf-8?B?SUxaUkFSSDU3MUhkeDV5cWhMQ0FRWm11Kzh4UUhEbmhjT3haUmh4eFZQa29W?=
 =?utf-8?B?OHBDSytNdDMwM2J3a3FyZjg3cHBPdkxLVkM1bDhvU245UEhJZXpxVVlWMWdR?=
 =?utf-8?B?TVQyWjB5K214R0VYaW5nMDhlaFFOdUFKN2YvTW5rTVg2ZkdkanB6MnZIZW1O?=
 =?utf-8?B?M1I3eDN0WURia3JlTjRYOGFSVzYwb2RndjRoR0t2enJDOUhaZmtaWnJSTjhz?=
 =?utf-8?B?UkpXY1RmZ1hhckVLRnNtRzZualpkZDNHVTlLTXYrRkY5L1p4eVJaSnNSV0Iz?=
 =?utf-8?B?TEtBZGl5d0Q4elBJcUtrSWh6azg1QWJlUEQzTnNPeWN3UXRPMXJkRjd4c2p6?=
 =?utf-8?B?YjhCUlBYRm1Vc0FsNURINHIxand0eG1SeGVneTJVSXVvbmdmV1NvNXl0Z3hS?=
 =?utf-8?B?ZC81OHRlN3hPc21nL1MyYVpBZGp4a2JwSS92QzVYaUFBeERRRVZQMk5vazEy?=
 =?utf-8?B?SkNHZFMwbjFJQ2VJaGJLVWpRZ1FqTUYrZGthWEpzOFIzNnhuOElNdEJ4aEJJ?=
 =?utf-8?B?T1FBRXJleWo2bVFLeHRBQWdLMDVTbEJTOFJxQWpiRWtUOHJmWWtodk45RWgz?=
 =?utf-8?B?V2VOTWZocGFiN3FKY2s3MG1FNnVScG5UczFROWJqVnVrNkUzUExscU1vSjNl?=
 =?utf-8?B?d1pLR0VyYmhneGwvNkZ4QlA5UjljKzVkb3pIS3NRUVFNS2N1b0tyT3FWMXpS?=
 =?utf-8?B?MzY5dm16aU9lVlVldnppRVVjMDhnajB1bkwvN2hQRis4Y29QcVJ4UHFmVzVk?=
 =?utf-8?B?L01mSkVtTkhBUWNXYm91b3ltVmFzbXg2a0VRekhrM3lGT0RkOXJ5cnpCRHhK?=
 =?utf-8?B?dXFyR2VQRGpHcG0vQ3pPYzdJRXMzSVR6dEx1YTVWVXRrTHlXbUErTGl2US81?=
 =?utf-8?B?VkYyaXAvUlVaNDRkN1A5N1FWYWJLM0ZwckFrYzJXRm5meXkvNE80QXhjTGxr?=
 =?utf-8?B?OXdwOUpOS2tSUmgrWi96OWpWWVlnTDIxNDBrY3JYVTBGbW9GQm53TU10MW9a?=
 =?utf-8?B?ZU1kazFzVGR4NlRVUmVZdFdZYTlhMS94ZmpwTkJzR0RMT2VtQVpJWmVpaTJk?=
 =?utf-8?B?R3RMSnl5dTNhSUcxaWRRMWJHSlBNUTNSVlFpUWxONm9xNTVOckZ6WEZrRk9h?=
 =?utf-8?B?YUloaEptdXRDWThjZVRTQ0loSGg4ZVZGTTJzOW9Ob3J3OUFBUmZiSlNQa3dq?=
 =?utf-8?B?RnhHc3ZuWmlPOEtBYUpkKzlFeHc3NklWdzZKY0Fsa2pNM0xaMnBmQTE1YVky?=
 =?utf-8?B?NGxVaFl3SDlmMHlKMHRGNlphRHNHLzQra3AzbGlyYWR5NGhaVTZyNm5aTnNj?=
 =?utf-8?B?YlFkVlcxRWtlVldTdy9kNkw1MVYvOFdxZ2pLRVpsdHU3M0hhUC9mWENWdm1h?=
 =?utf-8?B?dmYyZWVnSWZFZVNEb1NDalNVa0cvUFRkdDlpcEF2R0lHMUIxc21GZ1IxenBU?=
 =?utf-8?B?cyt2a3JBbkVySWVWQzg5NUE4aVA5ZXVsRGJjbm5UL21Pd0UvZWV6MHg5SG14?=
 =?utf-8?B?SEN2UjRhNmFyNCtuZUdHRU50aFRQVWNLRTFSL21KT0tpR0lLNzFURGdidTZT?=
 =?utf-8?B?aGNjbFVzSjFmRUpNTW45THI3STV2ZFRPaUdBK1dwSDhxemtqd2cyRlF4Z1px?=
 =?utf-8?B?dVRmdHlMbzhzSEhUd3JDaFZUdVp1SzFUOHVJelpERE5TY1FoTWdWY0pzTitx?=
 =?utf-8?B?R2p1bmdjS25RYmRqRHFVeW5SdlRTUFoxeDRDSEs5OWNrZk0zYm1tWkM5MTJD?=
 =?utf-8?B?ZlhNM1N4VTZSbVQxSFhVbWdUeGdwdnpUUnVwQm9lRUFUTW9vQXRudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91295d3a-76db-43e8-84bd-08df18535eb3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:44:06.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuk12D9PW6xXXGsLYeXsLr3ayZBpr893zcU0P/0QB3G7M4ILla+/yWJ6jcOeKsp+go+c/Mq+bd98cPGq4YIA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

On 9/18/26 3:48 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:07 -0700, John Hubbard wrote:
>>
>> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
>> @@ -79,10 +79,28 @@ fn write_sysmem_flush_page_gb100(hshub0: Mmio<'_, regs::Hshub0Registers>, addr:
>>      hshub0.write_reg(regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
>>  }
>>  
>> -// This PMU reservation size is r570-specific.
>> +/// PMU backing store.
>> +const PMU_BACKING_STORE_SIZE: usize = 9 * SZ_1M;
> 
> I don't see this comment or value removed/changed in this patchset, so is it really 570-
> specific?

Yes, it was r570-specific, and this patch is where it changes: the
hunk removes the comment and replaces the value.

In 570.144 the PMU region is:

    * 8 MiB of backing store
    * 16 MiB of surfaces
    * 4 KiB of miscellaneous memory
    * all aligned to 128 KiB. 

In 615.71.09 the backing store is 9 MiB and the surfaces are 16 MiB + 256 KiB.

(v4 adds the before and after sizes to the commit message.)

thanks,
-- 
John Hubbard

