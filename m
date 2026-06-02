Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B13C1418
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388581; cv=fail; b=ZF+hZHooDWWfYSd7Z/9LxpjplstGlETnEgTYFpSOri9ux6HAvkDU/27PSoLJu7yu0qonZsFCJTMe/syKw9o0RM20AyPws+yO7C24T1SsUaTTmZGthpQJrFbfWobu1esv977dBKL835k7SucbNUia54rhZyF0HSG/lUG6t6KU4Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388581; c=relaxed/simple;
	bh=vpx6RqYaENaNcCWoUcUr0qtlR/8eshR4sLB2b8QNCMg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=qnQvq9gbJYXVSVUE1DlNqVx1Hnt6RNe03FSld+5DyK5j6eSt3XqKknRBNVETdyVatZmyCc+WD4NMOW9xuS1+YMI0OZF3HVJFCYMS3JEv/0PGOe2urclJsWeVnSDG6nnStF/UhjTiPZK7NAWDXKcvxMCqmFqPZMcM3qJSiaskhwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ArFglw2K; arc=fail smtp.client-ip=52.101.52.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ArFglw2K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0nv8p6WrBU4Cv996TAPoi0lB0ApikCjmV14JSlOa7gG8Sa+oAGMR2NWUoMng2wV3auBpgOuTgXYUZX4MRB3Z8KFya27MM5PzFll3mo+GvIePxvpnVxV0bhP8ZTu/vJLseD4RfusFlrdOGdXZway6gc//OVf3tYSL/k8/o2sDlchDZWLc1a/ZtCdrkqjptl4FgFL3JnnV60IGGHqEuPPqESF6wDXk9raUo/W4z6HZRCKddEuCYVminhlqlEwWaWRTz4gYyA8oMSd5AESQiZkICBijeHxlhIVTMrSa9cbS7mYu0Yu4fGpfmA0B2LyER62vv3v/EzCZZxJinbcYBs52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yfKZC7zp0Lt7C59mUT3TSXhRcgh7P/Q2qJk2WEgTb8=;
 b=nOcvXZP3W7bNm0aOmLSeK7sxWyX4nS5+27iJKz+Azan/BVbb87o9Pw76UwZrhDSblhevF7dkPYKKJE9PfC6y+Q9ei+438dV3i8UXyWDQXxPTsJrlZ1GTE91/7+eYT13k8wwzz/O4X5ji77eTrRr96rQPt+Jx15Qm0dBVKYD51kJC2cDm4xRhppx3XXMGfvW5EL5926CKLAOFuU9W3HQpmIG6T3CraMyHIpX2mMn05XW4SX4dLqtV9hGA72jLseouyICNXErzU5ByEpAuAB/YM5GmUBXrTZqJUIlBzlq8OiKWr4X9Q8WuTLaIQDtZvI1sdNUyA2JoY2EnTsEd6wRnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yfKZC7zp0Lt7C59mUT3TSXhRcgh7P/Q2qJk2WEgTb8=;
 b=ArFglw2KRJEUnovBIq0jPQ+mY2o/hy1F859YYrvua767/BbOlVtCvOyde04oFlE9MJp7hvb+Lzhr3DqF3gXb3cA565scSOvkMSaOHI3sgtQOAesgKv/EbtkWZq1/Cbk5dhI6coNiT66XBemYS4zwsU6A9U45MeTVFiZEDu0noA5e3tCUkb3LE5blQK8E5w/GzXSYaFP34XVoOjT4B7C8MWZxFhqQKiE00aGb3KZpWFpuqI2jt0iKcgEQE6HsfIibGQf2W04xF2BEZpQAWVCbUDkyXTlitXZDEIiM1Xiy2SidlfR6Y+Um3eBF3lJ4isbT8z4zNuL7xIKUbC9B4Nxc6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:22:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:22:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:22:45 +0900
Message-Id: <DIYF2NNIBY57.28IZ4I6AMZMHA@nvidia.com>
Subject: Re: [PATCH v12 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-13-jhubbard@nvidia.com>
 <DIYEI7DXE32X.3G5GWVMQNQ4PM@nvidia.com>
In-Reply-To: <DIYEI7DXE32X.3G5GWVMQNQ4PM@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:604:257::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e03d26b-46d6-4c53-ffcd-08dec08021f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	sNrRc2xniASQJ742kKprZTZlxagoaEbYGuMfvOTY+nVVJe0T7mVm1KSJuQL/LCZoZgYaZ1zMrhkovQB2fJpITmnmMnv+7jVvT9IVfeOZP7tW8aLZbQXwlAXTw8aOC6JN3qQF9i7y+YUkMcIVJHYg85cTsBDK4qAHNKzPUjU3nITcKi4MWxz+8D8qvvh8hqoC2h3juHeo5AIraLvaHU67bIhzkH5DxJfN4xWqaNhY1NucxJdcXIjnH94dlK1uSYpiJftwot5T7fVGgrf4oEyaxSf5oe6P4c+oYLEXrZ6DItmkTxANfYE0Zc09272U4AlIE7FDdDle1VSOqhLLPIQZWdESXuZNZVTbWAfBDpapznkmfuneC0fiOsfxGm4wEfo6yYXdy+peu+b9z2Dzwhjm9pFKVyGuVve1YcDMkq5/MUyCinlX9kOEp3zEOlk85IOFLlFzFDtb9GUm/BkU4EavN0IGjdK7kp95Qu5Tf45n5DPxI3ZtFFqajhPCz0iGw7yxRBZCeNWxwm7xHxWuBRTdIs3PpPkt0g2z0fZr3x3GI7QomWRrdwXTV8MfaP0Q3GwW+RK3EBRtezfRuNRWnVyYeRx57NC16Q9Nx8rH9Xb9/aN9Wkf7Zqc7gnlsxoctnKhreuTX319xgQp/V0VJPuIIgPFO62yoakOFFZPFAohq8/92hrWiK63OWXGwn7bibwsP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXlkaVBPT0c4Q3JOZmVBVTVvcEhieUJ3NDdqSzhXWmZ5NCt4NnpucTVCQ2xV?=
 =?utf-8?B?cXNrU2ZVNHNrN0E4L2p0aG93TUxXM1ViZzlLMklpa3poQ3NUbmFyREsyQm1N?=
 =?utf-8?B?U09SbHcvVVJ5cDBLWFRBWUlab2dWNkRzOHhFZDRZMGRWQnE0YkZoUWk1V0lx?=
 =?utf-8?B?RWJtNStYVDZRUlE2cXA1UTNwVEVNTE0wQ29lUUtwUTFwaFlBblJjcElXa2Rm?=
 =?utf-8?B?UGRwaW1tYk44M25pVmd0R0dZTjNacVJUeGRNMkwyOU5FSlk4YjJCb3hsZVF6?=
 =?utf-8?B?TkFKbGZnZHMzak1RTGsrbzdnOXpId3dxN3B0QU5KMUtseEV1N2FMQ2xoUXBX?=
 =?utf-8?B?MVNPTnVVczZkT1hQdVNVN2NxQjRJYkFmeTJ3UjJya1BMbUpIYUsxSnI4dTBS?=
 =?utf-8?B?V3dRcHVoMzlqMW1ZOTZic2xRTGwwUitScmE2cENORGlLMS9UWGNYWWFpbldK?=
 =?utf-8?B?Uk9XWFo5M0tYYkswam1PWWxIREpKeGxQT3Y5NWtkelN3cVppSUhuMWlCak5u?=
 =?utf-8?B?cFBqSkYxVGI2UXovbEVWT1ZRSEV1ZnpDUlB4OUN6SjhHQWFMNXorODY3b1Nj?=
 =?utf-8?B?YWRGMzk3OHNyRUtTaGJYTHIxdlZyQlFadjdjUS9VMlNQejNJYkFZenVvV2E0?=
 =?utf-8?B?NWVzUUJBSUxKZXQ4anVNRHppWE03RDk3MEN0RE82L29DemI0NkNlYW5nOXRU?=
 =?utf-8?B?ai9qOGNzZW45eGI2QlpwS0gxaGVscUtrOStsbVRkaFNkaTBxUkNhdWFkTlVw?=
 =?utf-8?B?R1d1Y2dvVWtSZzJEMlR4Vm0wVk5oMjNkaUJDUjk5TEg5UTNmRU14eks2RGhZ?=
 =?utf-8?B?QjJrYjZEdUw3TmhZVDBnYzk2L0UrajVSUVg1UVpUS0lBYzFhZFBkY3ZpYlVw?=
 =?utf-8?B?WWM0S01rbjAxeTd0VnhZT011dmN2SHJ5NWhjbkVYeVh5cldUWEI0THlKRko1?=
 =?utf-8?B?RTMwTUxBbHFSSU54WTYyeEVhMjMzSUxtUVY0aVZkK0ZLOXQrR1lSRzZPY3hJ?=
 =?utf-8?B?bU9OT2ZlcXYxY3RCZ3JpOUVQRSsxWmtyd1FnaUxBRTg2UGg0SENuRmlVdFB0?=
 =?utf-8?B?VXgzMzJja0txaVBKT2FJVUxMVUxTeW9yTk80MmRta0VDQVkxSmUyYkYxMGZm?=
 =?utf-8?B?OWpqSDRNMU1EblM2dUdhY3V5L3k5OUFDUVpsRCt4Z2xzRGUwdVExVjFGWTNV?=
 =?utf-8?B?Tkx0L3hyZXVIdEErSVdSa2JLUVFoZFptbnpiMkxSRW9idkhnSEtPOW5BY3VN?=
 =?utf-8?B?YmJieFZZeGEzSmduRnBYNjdBalB2RFhkbnhyVUpNNDZvaEtCOTdZOFFvS0Vy?=
 =?utf-8?B?RlJWZG4xVU13bk5DVU8rMkFDMkRxT0Q2ZmR6VXVORjdpVVlDSldkMmlqVndB?=
 =?utf-8?B?L1F6dDdON3ZCaHhwMWtnazlEb1U3ckdUMG9HeVpxOWVGakdyWHhYc2o0eklH?=
 =?utf-8?B?MzdaQjFiWGZ3TWJCUkExVkROMkl4cGRVS0prcy9ZMThrU2swZXduWlBlZW5m?=
 =?utf-8?B?WE9Ca1VrQVpHWk1qT1p6cWJhVExyOFVqc1pldVZjWDNXVjRPanN0SEV3a0Rv?=
 =?utf-8?B?Q1VxYUJCNlBadTZSVjhpbTZ6ekk3UUp4MDY1aEhHUVdlclFBemk3MFcycmpO?=
 =?utf-8?B?RzdTQW1DYjBwb0ZXcXg2VGtDUXFqdVNYTWp0OWlrZ1B1WXJCczZ6Mm94UGt4?=
 =?utf-8?B?c1lNMXFhaTFjaEVLTEhyQzhuRWhxL2NzRjMyY1lTc3ZOQXpCc3FPNUF4cXUv?=
 =?utf-8?B?dmgvbmEvbmpBYXl4WEJ3dVFQWXlQUGlueWtGOXFDRUxYU2ord1NZM2NDMjFU?=
 =?utf-8?B?azdmWUl2YndhWTFOcnZ4Z2MzQmcyVGdSYjhHWmxWakQrbjQ2b3c3eDNleVNN?=
 =?utf-8?B?QlZQM2gwNThYNjdyOTNBdXp4NTcvTFZiOWNmNW5RbXBUUmx2SlVlZFJWOENL?=
 =?utf-8?B?QmtQdllTa0gxMGN0cFNVUitSN01OenltRzM2aXJReGZuK1BxcXNiZWxtcTI1?=
 =?utf-8?B?ZDgvSmJ3cVAzVkNEMCtneWZLN2RpQlN5TkJDWWJ4QzA3Rm5Rb0ozS0h3V1BZ?=
 =?utf-8?B?Ylo1M3ZSeXo3V2Y0bVUrK1NHTHJPVGdENjJuRlgrV0VySkpwMC9sNGdzQ3NJ?=
 =?utf-8?B?Rk44ZjQydEhtTVgyRWNQOTVVZFZPL1BDVmFJRXRsYkVhNVJPOUpZdUJXQmRP?=
 =?utf-8?B?MHVLQkhHb0I0cTJKTmhyZ3M5RDJJOTd5cVo4ME92cEgvcHQ0OXNFbHdCTk94?=
 =?utf-8?B?dSs5NVVuVmM2WXNZeW00YThWSXNrazk3TDNKVzhqaTBJc3ExK2RkNGVhQXpv?=
 =?utf-8?B?YzlkMjZMUCsxUUFHcmpBcXVza0luT2hxNlBGRXlyc0xFZ0FwbGZSL2hZbUcr?=
 =?utf-8?Q?0N4kgh0o8O/ryxbnEi8xXq2dl7gErYwIy+SiItqDzvZDb?=
X-MS-Exchange-AntiSpam-MessageData-1: HTJQSSvQaN2zsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e03d26b-46d6-4c53-ffcd-08dec08021f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:22:49.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx0nztukier2tFhQrdRlzb583FBwMxt56Ae6kbVq6S5CZgZIzLF0UKpvTPaASkwUE7NqpP8iuSwerLql1Y5Exw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

On Tue Jun 2, 2026 at 4:56 PM JST, Eliot Courtney wrote:
> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>> Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
>> driver must wait for FSP secure boot to complete before continuing
>> with GSP bring-up. Poll for boot success with a 5-second timeout, and
>> return the FSP interface only on success so that later Chain of Trust
>> operations cannot run before FSP is ready. The interface owns the FSP
>> falcon and the FMC firmware.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/fsp.rs    |  1 -
>>  drivers/gpu/nova-core/fsp.rs           | 73 ++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++
>>  drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++
>>  drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  6 ++-
>>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>>  drivers/gpu/nova-core/regs.rs          | 36 +++++++++++++
>>  8 files changed, 187 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
>>
>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core=
/falcon/fsp.rs
>> index c4a9ce8a47f8..d9f87262e8b1 100644
>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>> @@ -15,7 +15,6 @@
>>  };
>> =20
>>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
>> -#[expect(dead_code)]
>>  pub(crate) struct Fsp(());
>> =20
>>  impl RegisterBase<PFalconBase> for Fsp {
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> new file mode 100644
>> index 000000000000..f3524137d9f7
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/fsp.rs
>> @@ -0,0 +1,73 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFI=
LIATES. All rights reserved.
>> +
>> +//! FSP (Foundation Security Processor) interface for Hopper/Blackwell =
GPUs.
>> +//!
>> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then=
 FSP, then GSP.
>> +//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usag=
e.
>> +//! FSP handles secure boot directly using FMC firmware and Chain of Tr=
ust.
>> +
>> +use kernel::{
>> +    device,
>> +    io::poll::read_poll_timeout,
>> +    prelude::*,
>> +    time::Delta, //
>> +};
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    falcon::{
>> +        fsp::Fsp as FspEngine,
>> +        Falcon, //
>> +    },
>> +    firmware::fsp::FspFirmware,
>> +    gpu::Chipset,
>> +    regs, //
>> +};
>> +
>> +mod hal;
>> +
>> +/// FSP interface for Hopper/Blackwell GPUs.
>> +///
>> +/// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only retur=
ns once FSP secure boot
>> +/// has completed. It owns the FSP falcon and the FMC firmware, which a=
re used for the subsequent
>> +/// Chain of Trust boot.
>> +pub(crate) struct Fsp {
>> +    #[expect(dead_code)]
>> +    falcon: Falcon<FspEngine>,
>> +    #[expect(dead_code)]
>> +    fsp_fw: FspFirmware,
>> +}
>> +
>> +impl Fsp {
>> +    /// Waits for FSP secure boot completion, then returns the [`Fsp`] =
interface.
>> +    ///
>> +    /// Polls the thermal scratch register until FSP signals boot compl=
etion or the timeout
>> +    /// elapses. Returning an [`Fsp`] only on success guarantees, at th=
e API level, that the
>> +    /// interface is not used before secure boot has completed.
>> +    pub(crate) fn wait_secure_boot(
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &Bar0,
>> +        chipset: Chipset,
>> +        fsp_fw: FspFirmware,
>
> What about constructing FspFirmware inside `wait_secure_boot`? It fits
> the concept of having this Fsp object own and control the FSP. This also
> matches the pattern of Gsp::boot creating its own GspFirmware.

That makes sense, otoh since this method is named after its most
important side-effect its name does not carry the expectation of loading
some firmware image. So after consideration I think it makes sense to
keep firmware loading a separate step - I would say differently if this
was named "new", but then we lose the important fact that this is also
touching the hardware and waiting on it.

At the end of the day, `Fsp` ends up ownning the `FspFirmware`, so the
most important architectural point is addressed.

>
>> +    ) -> Result<Fsp> {
>> +        /// FSP secure boot completion timeout in milliseconds.
>> +        const FSP_SECURE_BOOT_TIMEOUT_MS: i64 =3D 5000;
>> +
>> +        let hal =3D hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
>> +        let falcon =3D Falcon::<FspEngine>::new(dev, chipset)?;
>> +
>> +        read_poll_timeout(
>> +            || Ok(hal.fsp_boot_status(bar)),
>> +            |&status| status =3D=3D regs::NV_THERM_I2CS_SCRATCH_FSP_BOO=
T_COMPLETE_STATUS_SUCCESS,
>> +            Delta::from_millis(10),
>> +            Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS),
>> +        )
>> +        .map_err(|_| {
>> +            dev_err!(dev, "FSP secure boot completion timeout\n");
>> +            ETIMEDOUT
>> +        })?;
>
> nit: this can just be inspect_err(), it will be ETIMEDOUT if it times
> out.

Indeed, I'll fixup when applying.

>
>> +
>> +        Ok(Fsp { falcon, fsp_fw })
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fs=
p/hal.rs
>> new file mode 100644
>> index 000000000000..83d1e7daa998
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/fsp/hal.rs
>> @@ -0,0 +1,27 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFI=
LIATES. All rights reserved.
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    gpu::{
>> +        Architecture,
>> +        Chipset, //
>> +    },
>> +};
>> +
>> +mod gb202;
>> +mod gh100;
>> +
>> +pub(super) trait FspHal {
>> +    /// Returns the secure boot status from the architecture-specific `=
NV_THERM_I2CS_SCRATCH` register.
>> +    fn fsp_boot_status(&self, bar: &Bar0) -> u32;
>> +}
>> +
>> +/// Returns the FSP HAL, or `None` if the architecture doesn't support =
FSP.
>> +pub(crate) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> =
{
>
> nit: this can be pub(super)

Same.

>
> With above changes,
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Thanks!
