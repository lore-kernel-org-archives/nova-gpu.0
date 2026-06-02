Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF33D9DD4
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402888; cv=fail; b=E5F7EnTH3AcGbx3rvoek99wfOOZZcYAAbFuCVZJeeOcv/ClohUUHa8qs9X3VV1ArcFt0ST2Zem1JxOLpshxy92CBTDjsgk4E+Uu+fyxVSJ+ulGs/VJDwhMcMAsnHnUh37TZ8ZFqB/B/HKpriutW83JY4D9hcjjRJ8jypkd7qwXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402888; c=relaxed/simple;
	bh=Td2cG3DIg8dMHaZwvwim8QpGIp6U/j68C8I+1l8paP8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hMNZl5PZPRqaZ667dwkSEonwBz8d1EZHrmJSP255Crk6w/XhALknjCwDih/C9KFxy86BOk2OqcPt6Kpd9W6X00MBx1qNraJtJun7nqkiBzN8vBuA38uNa4LIwNekO9hsIqD/YrBe3TpIUCm7culw/Ivb5COQLTJ4Jwld72uuBss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AshjjbSw; arc=fail smtp.client-ip=40.93.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AshjjbSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYXmoaWmaxD4j7f8aYb9NwVwM4MD8GLQmWpHQSQ0GLasUerlsFD8hQKiXWRq07qiTHsvimSoNlykUS5SdcUdwAx+QgAyPbC2K1xhpdB/bnNZ4DN33hquqhS3h/535BVd5HNOJWXZsEY4iZVFuZfPr6eBazgiGmHhwx7icfIeeotHw4w8aTDGCBbufSUN3/YeyIyyObSVlUg6zXYzRKEBTO0wI0ZF5CAAp633YthMe1Q3VX/7plIpPeqCTOJfcItYDkzcTUUKtsd8+nK916zno+QfVCj8UbcLLOceWcwnNans5Po1ANAXEKML6qVPSun2wDRwLLJMjA3222Rwsf93Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y54gYVhf2wq3rJd77TbgTmAsopUelcA28YsQP6D+nNg=;
 b=awphDRIOdDEnrUYOk2xKtbG48hlROaoQ4lPPrI44E7H2KNdP0zoMFq6U+hbk7/Dvkivj5iJXCV9NKOkP1VEw6788Fenjtyv+7ILwP9zhZ1UFJ5pAUALfNi5d/NuC1M6pUi/oJr+OKjYP+nLEUc7h5r7SUJLjYiEg7zLhI3mEpiV6XV0vczxgxs4wFKM+1sczyyrLy2ok7LHOGJozmZYLa9dyCoquJyJF67HbHzOrP1MECxDnx+yjrX/ervrdC+Q/2swH5CTpU65up+A5splmQdSozX52jNVa+/X0xLho2KDQTe0BI2BM6ghDID2yeyLGSrP/5kDxuszTYjVwTW3sDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y54gYVhf2wq3rJd77TbgTmAsopUelcA28YsQP6D+nNg=;
 b=AshjjbSwG9L8K4loTYGXM+3cjgZv1+XvacTNvhCN8L/eJ6JDkX1GDfgU3EzBgpNfOtVtnKz+yHp5oiXDSZHS8OzfeUUkJ1lgYD/N3NzLtzbz9DVFRtiOP6LannWNbinm7oLuTInsJvYg/vpakLEa0aOUhO30bSSA9njVNDjn6vBf+J+XPcouh/uR03zinx6BIKdB/Ue7e8uMtqCTZxh4v8jqtTaH9ucRQs2R539Z9Ccz2qiy+42ubokSwtOjPov6laQy+Vs6UQ+sgCZ3S+8oipXmAnQfq0C/07TqaekQG0KJ4BEvt1dZL0wZFLPOSxted9kA624CSdHMVvw0GL+Itw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS7PR12MB9549.namprd12.prod.outlook.com (2603:10b6:8:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 12:21:21 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 12:21:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 21:21:17 +0900
Message-Id: <DIYK5AGFFHSP.3PVP7YX854KWN@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-16-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-16-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0003.jpnprd01.prod.outlook.com (2603:1096:405::15)
 To BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS7PR12MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffa1773-c673-4dc6-2274-08dec0a17487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DJLTTiHFMgLUpgWrAmyKrKW93bL8xsj1tmHCfYWTLfj7hi0d8R2+vRGQc3j3l+zGy7gmiJWiTKnQwKdHL3ITkbICQkGiEm5L0SyXLgakdjewZPMS7LXQwsxTLSOAtIx3NBUCaQkkh9JetVnWpcKEle/t8BYMJq+H8umWrZ9wJcXtV5ByCsqK3DORkilPGWhqsoYdXczYW9pU+ldKqgIFNgfdaiNNO2Dcd+IyzayBcdGTSsEA36lJHzi2DlOvVPkRYogUtdanaXkVPO+JH6Ta/nHdRnByPrpIQkZSHyKVtLYdR1imTMQ4xG15kI0vkfLeW9Zb0qapsg37UVoW4uP9bs2IRAv82HNJ4GTqFk6mjMCgKHj5d8gGoHq0YnyLjZPHfY0aFon90N0eSZOUQkYQ2M+J0x+nmz2lW4CPFZAItB4duKr2mGtyEIxmoGlhohe9o6roIyh548HKSdyAK6Sr/M+va9JtEMsgnYnczMUfnhH8PKWaRlt+xZDAK9RuUlvM6uA2lSO3j0sdrl5pcdIm8oZDUpgz3xm76fzPEpfAC9oZ/MvWgZamHP/28Chu2mwO4A5JkN7exMgnh/ATH6ED/1pP+FuZWTVaNqcSAAQa04us1JqVgY95ZOBt9Ky0o+z+u7xysNXQx5ad7nRRpiFeVeNRrSNTqt2mZJnnjF6kzuHLhVJoDwHpopRG0cExgthJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dGNjdUZmtxYnhncmFxN3p4NUZWMGoxMTBTRitWa2tzZy95cXhVaUErcFZH?=
 =?utf-8?B?dVUvUDd2UTBuSGNQNWsyUFJETjFpV0xIbUx4TFplOFdKSGNFRWFLUThJSlZD?=
 =?utf-8?B?QXBjOU5ocVdYV0xHN3ZjVG9VV0g1cnVXdloxalFsUElKZlBlQnVyckdEQVlS?=
 =?utf-8?B?UHRrbWZvZkM4TTNuNjFCVCt5c1JWNFhlVkxtbHAzZDdhMEZETWgzM0JSbHYw?=
 =?utf-8?B?MkxvYlZtMGs5NkhrcTZaUXY5Q05WM240bnVyRFA2VU83U2haTUJrd2Vwd2g0?=
 =?utf-8?B?aXVHWjhoWkE3SThLZzgzYm5PWHFaQVdDai9zKzRrNTZOVmhCVkRraldMVHhD?=
 =?utf-8?B?UUlHNndJWU9uelBnOW51U2taTWl1cVBWT21RTHdua0ttdkRNZUYwaktMVjFX?=
 =?utf-8?B?NTBDUzA3SlRHK0hnNndUVXh3MTFBWllqY29qUTBwcWR1cXM4NkdwamZxTkJ4?=
 =?utf-8?B?OTd1M1NyQ2pRVjlZNUZTODZtUFAzK1NIOVY1RmF5d3ZXL0g0Qm9aRVBiZEZt?=
 =?utf-8?B?eStUNjRYemllN3FGNHBnWlRZcEJ4aHBRNlhkVU1PcWxuMlB1aE1Cb3J6RTdy?=
 =?utf-8?B?UUpqN2xxVFR1NzZUdGt3VjJhWlU2S3pESS84N0d1RWV5OXRJamw0ZGZLWGVO?=
 =?utf-8?B?SWgyRWQydWJMMnlmVjFNYWFDbWNFeURsQnREOGFZNStLL3hkdlRUMVJFcHlR?=
 =?utf-8?B?SXBVUmZPejdVbERib3h5L3BOdThkSS9PRVpuSkVMenRXR0drQmZhUDBic3pU?=
 =?utf-8?B?bmo5dERaQ2R4cFN6N2QwYWZNVHIzUlN2VnloYTJPU2VhbGhCSUg2T0xKQlVK?=
 =?utf-8?B?eEl0NmFvSVlQL3BvSnpDWGFrVDA3MGRwMzJEZ2tGNDlrU0NiMk9XVXVWa0dP?=
 =?utf-8?B?ODhsOFpLTmx5UUZOa0VLT3hib3BjRzhYOGVmVFkrTDVjWllBWis3dUthVnF4?=
 =?utf-8?B?bHhFb3dTOCt4bHI0TXpUOHdERGdzMWR0TzB6ZE5NdDhKaE9XUmdCK3ROa0JP?=
 =?utf-8?B?NmR0RTEzaXYxU09tbi9SWTJrYXhYQjU4VDJPTGFLcUlud1RaT3JYcmwwMVk5?=
 =?utf-8?B?bmp3Yk5JcFdGVnNaTFAvQVhSMUV6YUxrMEYzWW9zaS96Szh6N2RWQ2V5UkIr?=
 =?utf-8?B?dGl2V1ZCNG9pN09zOHZRWThTQm9keithUlVNc3hUcjJqcGN0R0p4MXlyWEgw?=
 =?utf-8?B?aHpvZS9XcUQ4ZEtrcUkyeG5Ea3JIT1N1aE5zc003d0RKZUpycEU2VEJMSGxH?=
 =?utf-8?B?RGtMKzJ4b0J5OE5HdU42THNGYWhSMUZISkZXQ0pZTFB0NHRic0pyTU1CT0RE?=
 =?utf-8?B?c1R3a2czeGRVc1dKdTFOcU15RC9XUGU5OHpKdXlDV3p0aWUxYUczMXZyb0Mz?=
 =?utf-8?B?OXI1Zm1kRTJ4M3dwcHZ4aGNreEM4dWlWZ1VjSGRqdGxXclRUT3c4WXlkVUpp?=
 =?utf-8?B?TGZnQXBFMTRlaDk4bFNWdU1HU1FjWkEzZkhsR01ZRm0zb1F2NXJxUGFacS9U?=
 =?utf-8?B?dGJ5NU1rM09LRDBMUGlLMUtNY29sOGgrUjBOaTlvQWZWTUtrWDZ0c1gzeitl?=
 =?utf-8?B?MWNjdDFudmNwS0tYblNIZzJ2NGRpd3BOQkVEbWUxWWdjTVVMZWFPdUgyc292?=
 =?utf-8?B?RGVjSDNvdzlBNDVlVm9QNnhtdVpIdGhRZHJWdy9lWnAyTUNISFpxVzFJL0Ra?=
 =?utf-8?B?bjlmc2N5cEdQeDJvWG9BZkp4Q1owcHdpVzZWMEZlcld0L0pFeExBd3pjb3hC?=
 =?utf-8?B?dGNxUDNnTHY3aW9qZmxIa1lMWElrY3ZBaW5NVVlhNDUzOStjd1JHYjJUemFp?=
 =?utf-8?B?YmdHMjF3M1orVHVndlJXMEZSbG96ck5wSkM5d3JFZTJXcnkxTSsxU1RXSWlm?=
 =?utf-8?B?UkNTSEY1MlVtVHpOZTVBczVpeWtMZ2g2cG0zcUNEaFZaVHhxZmhqVGo2SEJR?=
 =?utf-8?B?UkpOZVYxb1hBMlZBcVIvVmpzaC9sTUhCSk5MdVJkd2tveXA1UFN5ckNSVUE2?=
 =?utf-8?B?NDM3SnRVa1FxWjZxNGhGb2psQUwzdzBJaTgvcE4zWk0xdUR6cFJGTUdLK3h6?=
 =?utf-8?B?NWZ0bTVnbWJIbllxU0xOY2VRd0lDT0hCYmxCNTZJV1lvN2trRmpxUEhQVWRR?=
 =?utf-8?B?ZVBTLytyRHE1a3o3MWE5ampodVducFZoZk1JSjhnZnZNUGYxQ3d2Sy9rTDBQ?=
 =?utf-8?B?bWVma1cyeFVGOHZ5WDFmb0JydjFEQUlZVEh3eUZoMHJRQ1Y1YWtyd2o0WTZh?=
 =?utf-8?B?NzJjNHZsQzhNWFl5YzEybTVnU0ppSlFnaDh4N2M5SEtJRUNId1VsWi9RYVlQ?=
 =?utf-8?B?enRVTlBBTllPeXhxcWdkYzlkeUpmeTltK2ZIY3pyUjJQNVVZQ3A3Y3Ezb09H?=
 =?utf-8?Q?3Coj1LPW5N/UbzF9W1xcTUGdOhs0/VfWG7cjNzbfF1Ky9?=
X-MS-Exchange-AntiSpam-MessageData-1: PSyDHfQ52eAkjA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffa1773-c673-4dc6-2274-08dec0a17487
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:21:21.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zRICDN3U0UvFNg+R3q3qeFgfBpnyKFJO7/FaOPhrWtw2K1Y1IlKOWQmHlWr2qEPSkgoZZEuwQEGC9+1bQ2OqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9549

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> FSP communication uses a pair of non-circular queues in the FSP
> falcon's EMEM, one for messages from the driver to FSP and one for
> replies, with the driver polling for response data. Add the queue
> registers and the low-level helpers used by the higher-level FSP
> message layer.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
>  2 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index 6b057d958115..0ec1c55213bc 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -112,7 +112,6 @@ impl Falcon<Fsp> {
>      ///
>      /// `data` is interpreted as little-endian 32-bit words. Returns `EI=
NVAL`
>      /// if `offset` or the `data` length is not 4-byte aligned.
> -    #[expect(dead_code)]
>      fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Re=
sult {
>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>              return Err(EINVAL);
> @@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, dat=
a: &[u8]) -> Result {
>      ///
>      /// `data` is stored as little-endian 32-bit words. Returns `EINVAL`=
 if
>      /// `offset` or the `data` length is not 4-byte aligned.
> -    #[expect(dead_code)]
>      fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) ->=
 Result {
>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>              return Err(EINVAL);
> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, dat=
a: &mut [u8]) -> Result {
> =20
>          Ok(())
>      }
> +
> +    /// Poll FSP for incoming data.
> +    ///
> +    /// Returns the size of available data in bytes, or 0 if no data is =
available.
> +    ///
> +    /// The FSP message queue is not circular. Pointers are reset to 0 a=
fter each
> +    /// message exchange, so `tail >=3D head` is always true when data i=
s present.
> +    #[expect(dead_code)]
> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
> +
> +        if head =3D=3D tail {
> +            return 0;
> +        }
> +
> +        // TAIL points at last DWORD written, so add 4 to get total size
> +        tail.saturating_sub(head) + 4
> +    }

In a later patch, `send_sync_fsp` polls this then calls `recv_msg`. But,
structurally it's possible to pass in any size to `recv_msg` and read
more than we are supposed to. What about having `recv_msg` do the
polling to get the size and return a KVec with the read out data,
instead of `send_sync_fsp`? `poll_msgq` could stay private and we can
make it public later if we need to.

> +
> +    /// Writes `packet` to FSP EMEM and updates the queue pointers to no=
tify FSP.
> +    ///
> +    /// Returns `EINVAL` if `packet` is empty or its length is not 4-byt=
e aligned.
> +    #[expect(dead_code)]
> +    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Resu=
lt {
> +        if packet.is_empty() {
> +            return Err(EINVAL);
> +        }
> +
> +        // Write message to EMEM at offset 0 (validates 4-byte alignment=
)
> +        self.write_emem(bar, 0, packet)?;
> +
> +        // Update queue pointers. TAIL points at the last DWORD written.
> +        let tail_offset =3D u32::try_from(packet.len() - 4).map_err(|_| =
EINVAL)?;
> +        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(ta=
il_offset));
> +        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0)=
);
> +
> +        Ok(())
> +    }
> +
> +    /// Reads `size` bytes from FSP EMEM into `buffer` and resets the qu=
eue pointers.
> +    ///
> +    /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0, =
exceeds
> +    /// `buffer`, or is not 4-byte aligned.
> +    #[expect(dead_code)]
> +    pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], siz=
e: usize) -> Result {
> +        if size =3D=3D 0 || size > buffer.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        // Read response from EMEM at offset 0 (validates 4-byte alignme=
nt)
> +        self.read_emem(bar, 0, &mut buffer[..size])?;
> +
> +        // Reset message queue pointers after reading
> +        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0))=
;
> +        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0))=
;
> +
> +        Ok(())
> +    }

I think we can remove the `size` argument and have the caller pass in
an appropriately sized slice (altho obviated by my other comment).
