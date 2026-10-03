Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13B374E41
	for <nova-gpu@lists.linux.dev>; Sat,  3 Oct 2026 01:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991087; cv=fail; b=YH+YXdIWaRDUW9eILT5XGz7uwFin67UCWT5T2sLUDLeLySX6NOYrfcopuE9OElLIxpcPXYamu3xLzAIvHaOONXgDlI3/9xU6s7d4BjfzmMbNgIc2GyUP2oHAQR+6lC2CdZCYWdqMiBIkPlrAZ/XhAeeZUau2L6s22A7FSNqk9tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991087; c=relaxed/simple;
	bh=IZce8Df8VhMwHlpwzf6sroh1padsy+78nscwXvCYoZ4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BSW8BFmlpxj9gatTDOZV1pt0HbaEijSDP9gSGAfYLxlgC/vI5XxEuzsj04A9DsCnlPvOu1IxdszDZr4zTfLI57dSK5KVy8EQjroFpd6SXKdC8r9tmKnWdm9YR0Zxc/AjPg7lz8fTeURg91DRSXA5Q7pCfsD3qeC9MlD7lZyllCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YOaKqxam; arc=fail smtp.client-ip=52.101.53.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YOaKqxam"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7kP/bZaLKAoPlyhGvzDiLy9+68a40gDTMYjC8a5ce2P2NXr8Ak+hHPXKwb3wn31sNywMdC6EzI3dN6qb7cXcqSTaHrDMUliETGnZWycxv6JbPe6MpNJaJPVDOs0m5OohhDxJTh1g1hCnLEQeooXtITDVp4jrMWtwDCSGtXTbzcBrrCRQb7V5+c/NBEAzyUjK3Va0djz7Obo7acXRDkPJOCCXRaqY96No39sU2GtQhr1P3QtTpm+LuWghqrYB6brAmHxEcYB3hvuA8rLwGB9ENHRDP8RMuxvSClZIOSqWy+zrDjcmpT9mCHm4cKEei5NVRSfe61BpIvKz3bMXUn/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPh2b4UchKywiGltIXvyilMR8UjYbD1699pnViMaHIo=;
 b=DQC9fms99lMb/8IWnqB/bacBbW+PaanXX9wrZJgQ6Z8m82RPPSiAb6oucNLvXV0MTBsK2uqQ1tWnMx+biR8oany/hxXcVLEupN5LttT3WR6kLonBEABqli/3Cxgs8PZD6qqQmXDQA2+t7P9SLSLAQpF4PmTIDHhxI1V6vdrNex7hRZA6Kl2IzNl5mwv++jtew21kZ/nSgYWiSaOFAx+BV9mSnSe8cg3kaahCrnVaBa61Wuv87IDwrgQ6AMZzlF9Bj7fKaGF51azU2oGunyZe8/AUMUyLgrGzgKws8+fF4Yg/mHcj1awHQGTBnrVxbODwfQVi7SnXG8yWNLkm8ZNvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPh2b4UchKywiGltIXvyilMR8UjYbD1699pnViMaHIo=;
 b=YOaKqxamq40xyqwcL52s0mpZkABJQcQhhLIW7/tecV2VY2a8OAQbbmtyrx1FqkMfDyS3bWj1rLD+/HwbSBistaBEoTLc5bmnE6nGkWleVDvG/Hw182XYijRcRN5Jhc2uuaSlR2uaat/RO2CU1cu6RG0DjlhaTIH2Fwh/oQRo4g9/VgzskhzqLb+d0eXRbZHU9yGAZJqkzupqY63xP+PE4R2ebCGLP+PusP2tnXF5+Rehec2vFX+sh09WU+LrCeQS5MezvjV2he1sfX82syxP/XJCc6L4D3yt5pmpGlr1iQ0hSKCu5I0YrpZ1nu3yNEcx+2dEl+y/XlsdG/lj992pbg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PR12MB8861.namprd12.prod.outlook.com (2603:10b6:208:487::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Sat, 3 Oct
 2026 01:31:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 01:31:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 10:31:16 +0900
Message-Id: <DLUTCLVNFV8M.1L7IXUA4W5AFO@nvidia.com>
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: Use bar1_resource_index() in
 NovaCoreApi::bar1_size()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20261001005615.77130-1-apopple@nvidia.com>
In-Reply-To: <20261001005615.77130-1-apopple@nvidia.com>
X-ClientProxiedBy: OS0P286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PR12MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: de577a00-25ba-4ce4-e966-08df20ee06cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10070799003|22082099003|18002099003|56012099006|5023799004|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	T4YlW33PHyqfytJi4+A70H5NIK47KL1KJJHNrTQs6uTdAJ7m89RYc/aU5E//NSnoRGndtrfDA7JQXqflH+P0EP8Poo1XYKbndKEmYypVDkvgJzv0gAdQIpWksqsfbkIgBYw/FTAxa4TWMYLakTr8RLsN3OZBl7MbrUNEe/XstqF3hOBYDz43mUUPGZ5m3aHjp5ofFudkrqQAzmYAh2SPTb6YbaK20hXLM04KBLH0Gqk/yQb3zOGqr7S42231zIk6BZdGg3e4vdOmtwUgmm1s+Lg196OltOe1EiT8jxM08LIvnQ3Zxzk/Lg3pelO5Jkm90Lycs/MlvvZDC0P0otp1BgIwycvOwlQWE1VadM4iFAWvMymPAJpuXbHZWBFOZVhLrCQYmTRH6kZvwxc4YOUoSqAsWA3EOoO8C/0ySAicQigkfsyHtM7lguGZdWxNMmw2G9f2K/XVFhvhmmOg3mRVK3UaXbtOtTzSsrPaYzBvuinm59KoxL8krEWFJbyAKzsFzB4LJv3TOmvNLERVOPOFVZggy7D1o0eCI3zaipdgMPt9JMpGlVlUtFneonseT1hlnVvxPEQLpL61g9iaGnJR/xXWxupAq6hebBtgcrUvjJT7bKZCByzhLqqOiW0AP0IvM1cA7Q4NnUcAbEJPLWwuQ+lzMpmMat+CFBQmX9Cx5to=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10070799003)(22082099003)(18002099003)(56012099006)(5023799004)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2IrTGc2UHRQL01lK3doRnRyTDNJaUtxS1R5cFk3aEZwWk5paHFpT2tMNU1w?=
 =?utf-8?B?ZG5vK0RYVWt2TlRld2M1Ri9RMnI4QmZZc1dsSmJvMnBYV2kyMWNQSVdNNm1H?=
 =?utf-8?B?ckIwdVNKbXdENUdPVWZ2Y2gzam1OSmdwTkxMMzlwSGt1dDV3Q3RSMG11NDZL?=
 =?utf-8?B?RXhlVVNBYXNYT1JGRFY2TzUxVE5ycHRBS0RUMjJmWDdUOE9pb0ZrNzQxdzFC?=
 =?utf-8?B?QlhyYnZIS3RKaldCdlQ0cWIxT2w0eldCL1M3V0VKR1B1dnVFaUhDMEtheGRI?=
 =?utf-8?B?V2R6ZVJNUXB3cFhrMTNLWFJuR3cvSmZyeUJQeGNBcVYyTFA2S1Uvd0ZpWjRD?=
 =?utf-8?B?U0IzdURqK2xLN1hCeWxHY255YUVyVlkxdWxVbGNabjN1SHFKR2xkRXBZekM3?=
 =?utf-8?B?emY1Sk9xdlRDTHRDbVk2d0crVWhjZmFkT096dVVDVjZCbWZBWlFHVFRJZFVX?=
 =?utf-8?B?NTZ0S0REeEF1TUpjaUNYKzRpN2FlL2J4WnJTUHh4Nk4yR2tiTWY3SEU0MUJt?=
 =?utf-8?B?VVRvVjY4SWxudDRkb1pKUVJFWUtaY21FWjV4KzR3T3FHb1Q1TEtIOC80SkM5?=
 =?utf-8?B?R3R4QWszTEhQM3A2Uit2Z2tBNnJQRTE3bG5QMFA2Z0ZpV3k2eGFnUS9QRGt2?=
 =?utf-8?B?WXBHSlVzU0pyUHdwanR1VVlZQ0M3TmJoRGhyMTlodlUzcEtDWWpTdFlOTnZZ?=
 =?utf-8?B?Y1BYVW5IVy92MzJSTm1Hd2ZmbVRjSzRrTHVNSHJ5SXovR1NRU3VablN0VkN3?=
 =?utf-8?B?UHhzSTltTFd6UXkyN05aWGZuenp5bEdmT3RuVCtnQnhYRXU3bFhSdUdNYWta?=
 =?utf-8?B?cXBEQ0xlWGVwRjRoRWNCR3pZQ0NBTzRrZ3FrYTV2eEhFclJXMzdseDd2Vm1R?=
 =?utf-8?B?dEZOeWJSNldPdDlHaHJjMkJ3SGtxZ1psNC8wZW4zZlc0UXhhdFlOeUVZZHJN?=
 =?utf-8?B?RVF6b1ZGR2JwUTRrR1hFaHZBTTB1MFk5ZWIzU0gyam85VUxJVEppNk0zT2s5?=
 =?utf-8?B?WDhlVDliL05sMHI5VGtpMm8vZ0QrZUNsT3ZiTW1iaXJMTTNVd0MxR0RUUjJI?=
 =?utf-8?B?UXNOUThLR1oySnU4OStiak4rS2FOendZTlZ0aVoxU1dUTlVWL3BaTWFTNmNE?=
 =?utf-8?B?aXlEWnBPVDZxMENHVUNwQkp2bjhqMWZMNUUyUWF0VlE4MmxXZkxMNFFkMWw1?=
 =?utf-8?B?anNKbFZHSVZMWTlQc25NbWl4cWlaQThxS3ZnYnNWdjV6UGllQmxMem1na0ZT?=
 =?utf-8?B?SzZJZGxWMmxoTzB1VnBucXhFMGdoam1hWE9nT3BlL1ZRTTR4b21KWWVHUUFp?=
 =?utf-8?B?RmZ5Rkw3NlNiU0Nrb2ZrWFdsUFZhK1J1T0ZTSkFNSDNzZVZTZGZEb1ZnUmk2?=
 =?utf-8?B?WGpNeHdGVjhnRlZXRDlmWFlkNVJWUDNtTjNudWtVTmtiK3QzVVlIUGZya0Ux?=
 =?utf-8?B?QVJyWm5GSnF6MWtRSzlTbFhLOFZPZXBkSUlVc1hoZ1MxYi9tcU51QTRwdjBP?=
 =?utf-8?B?aDI0ZWdaZUlIYVFOZzRpRjRaTFJkbUZiWHovUE5LaDJ6eGRKR2o0YlppeWVs?=
 =?utf-8?B?cG5FeGY5RG1VUkkrWWczWDVSOUpKdkZpNGU2V0ttbjJqclV5MGthVUgvU2lZ?=
 =?utf-8?B?dzBnaFgxRlhlbUdubnFXMzJIeEpKQmhvdHNvaGN5WkpvUXMyK1lEV1dsWmdj?=
 =?utf-8?B?bVZXUGVYU3hPUVBsdUQ4RzNTT3NYM01JdGZURWFhaXVLdGVXQzdwQndpN0No?=
 =?utf-8?B?MmpPcnJsekp6NEZDaUZiaE1kbXdnYVk5a0ZtYitIWW9qQVJ6NU5VZXFFWGFy?=
 =?utf-8?B?YmI0N1l4aytNV1RyMEZPZ2dzNjlDZ1BhbU96UVdoRUdRQnhxY3M4anJLNG5V?=
 =?utf-8?B?TlArcVNIVkZZbEpQT2haT0Z3WkxUeEZNZ3c0bmt3Z0pWRXV0T3BhM0dJY0di?=
 =?utf-8?B?Uld5dVpZazM2MThwUkRqNGI1cVhWOWZFaVZZODJTMVFSdGttRnZQUm5nRVMx?=
 =?utf-8?B?TWMzcDA1a3Z6VzE2NzNmejNmaDhINml5MVNBTmUxUEk4TDR0YTNETFlTaTNl?=
 =?utf-8?B?Y0FIeXZpZitzMmF6SXU0bUdLZG1JVnFKSEtZMUxEcTNVTmtUOXprTDN6Q3Vm?=
 =?utf-8?B?NWtjTEtheFZ5TTQ4OXBwRVVoaVM1SFErQzQydjJRUVlMYTdMcEVaS1hWSHhI?=
 =?utf-8?B?UE03eVhZcWZXNmE4TXc1aVQyNFlVZ3pDTHptYWlIWGJoRXU1cXl4MkJWc2Za?=
 =?utf-8?B?RUFQb2dpVmw3RWFEM21qNUlHeVV2bWxDb1ZVTHRheEgwMzdpanpncE1PUVEw?=
 =?utf-8?B?Z2loRHZIZmhrTVZSemVLN0dTQmhRS3ByaWtnbWwzZ2pPWFdGYVp0Rm5BU0pO?=
 =?utf-8?Q?7j3CoTleVJ96VicR95LRixFqE8RP3hGlAHyWWdDRhdLwx?=
X-MS-Exchange-AntiSpam-MessageData-1: CHpZELh/orGwSQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de577a00-25ba-4ce4-e966-08df20ee06cc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 01:31:20.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0IHhtUCmuLb9cz5ZppDzArmLJwLjMyGgZ91f1XUQ1veNLp1S0XdamIobIso5feEEwfOr75HZ8yjBlZhPriw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8861

On Thu Oct 1, 2026 at 9:56 AM JST, Alistair Popple wrote:
> bar1_size() reports the length of PCI resource 1 as the size of BAR1.
> That is only correct when BAR0 is a 32-bit BAR. On Blackwell, and on some
> Ampere GA100 and Hopper SKUs, BAR0 is 64-bit and takes resource slots 0
> and 1, pushing BAR1 to slot 2. Slot 1 is then the upper half of BAR0
> rather than a BAR of its own, so NOVA_GETPARAM_VRAM_BAR_SIZE reports the
> wrong size on those GPUs.
>
> Probe handles this with the new bar1_resource_index(), which it uses to
> map BAR1, so use the same lookup here.
>
> Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE para=
meter")
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Danilo,
>
> Not sure how you want to take this, you could either take it as a
> standalone patch or fold it into my series as the pre-requisite change
> that introduced bar1_resource_index() 159427b21352 ("gpu: nova-core: mm:
> Add BAR1 user interface") comes before my series in drm-rust-next.
>
>  - Alistair
> ---
>  drivers/gpu/nova-core/api.rs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
> index f02c6c7c7e51..cc1d936b002c 100644
> --- a/drivers/gpu/nova-core/api.rs
> +++ b/drivers/gpu/nova-core/api.rs
> @@ -44,7 +44,9 @@ pub fn spec(&self) -> &Spec {
>      /// Returns the size of the PCIe BAR used for accessing VRAM, typica=
lly
>      /// BAR1.
>      pub fn bar1_size(&self) -> Result<u64> {
> -        self.pdev.resource_len(1)
> +        let bar1 =3D crate::driver::bar1_resource_index(self.pdev)?;
> +
> +        self.pdev.resource_len(bar1)

I guess at some point we will want an iterator on `pci::Device` that
returns a `BarInfo` type or something? Zhi has some similar logic in his
SR-IOV series (method `vf_bars` of [1]) and this seems to be a common
mistake code makes when iterating BARs.

Just an idea for a future patch, this one is of course correct.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

[1] https://lore.kernel.org/all/20260906060404.3336193-2-zhiw@nvidia.com/
