Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3133BE638
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370618; cv=fail; b=J65zihied5l4v5ff5cdJ1CeWYGVpbmXp/U0b54jMCMw9JPyse45YZRNkI5n3oZR2U9CpeB41eMdGLNfcMPwTJxm/ockKZ+/noOcrgnAkvX7ZpFGKgWs2zqm7K2mcKroPF228Tof0wSrOy5UTNYZqJSgRF+EPi6NyYpPEx3SdTwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370618; c=relaxed/simple;
	bh=pKdycolrPHRUhp+65O1aNSDUZPv6rCTjO6ugLORdLmA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=boZCnWasPj/6CHis3n+vIFbig+liO5fgu5tzJDdLeieEbLMf8v++1qYSlpf6WiPTXRGed+yTIWtzpI+wtuxxZk4il1hvXC99RD70XjuTFJ08zQ+KoMRQP0lWOmP+YTu8ezjXNhTvReN3jJ+3GZVZ88bmyzcLJL/V2PGgc6/LUJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gHktPlfJ; arc=fail smtp.client-ip=52.101.61.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gHktPlfJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0LOkVl6W0aSIgGv2mwcUyPPrUGKxL0CSk7q3ZWNLSgojFlThErjFXMaFFav9HEH9n7UjCIu/Nc5hVaz1lY6WuwjQlVNSqW02GY/VcXO3ciG7UqPjzZO8wz5GnxYKg1b9VfwoI8NFnQnvt2o07iXoobJMk0ykkiRc9IxbuORwPPolqzBVbvZQIuJmEaWnPNmXUlNf+J74nsL/X/TdvDW7YcceTsRglLD6IbTamFHY7O35CJEkURo7wYiqMmewnhkOXp1NPWDMAVfBVsrkOTZECVCTZfcxFmCqS2YY0aUmmTFRH70w8Ku9Od2SNI8ds+FpT4x+HEEI5WTjFbxFtJtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPuH5NjJCC+ZY7xGUT2LRy+fJnGeHTpDVx5LlhJr/Jk=;
 b=fE/WMm9d3/QDLOPAJgUjE2+zoy76/ZdAC8dMvKGZusU+H5/AIWGSV/NF8fNNvmBNbisUNWDP5ifpOqeMr7nsBNcWKxwiGSoe+J2OupWZvpNoMu39pMEGc6xxZMqoJgvRkr1ktUpMSQxQzaVCWT7OH7Cj92rSUm5OO48xbw3SbjqUUu2dw3xHhENIlqd6vgXoBORNCkKbXlLTaSAwqJxHplYss7/Miq1rBM+znxOqbbHCaF2B2eCBWzm2wPBDGYv5bf0icC67KgoxExYiRL0zg0k2xdnk4RUosSf6bUHp3V5pJ+DSkKlm+jSxSWsIl8QUoH+osDCfyO9s+4RCt1ax6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPuH5NjJCC+ZY7xGUT2LRy+fJnGeHTpDVx5LlhJr/Jk=;
 b=gHktPlfJfvbSKA618Y70Faa/H/9IhFQHaE2mRa7kg2KyusXF/j7Ghwg3K1Y84cGfJMTcgUs+U5ptVvf1yscdZobc7IKRLM/sCokguWj7tC3Cxxmmf6sbieLX4oiQ7DoSdNAppJ6C5DDbFMtzfsDfkFVmTJJtsubYZdrglMfdvjfmeHqwhNFPJC9FN7JeTP9/o16M2/yP3ZR/mmv5qvBZ/bBNuQi41u2zmF6tqxJlCW7Kp1J7LtkTFvMZkeCYQwNwg/3Bd21FhYmg9E4KBSMCDy1YQZWnGnUmsXDqYC0T4fWHoXi3XVJUyrQbfmXiWkG8lWOKe8oLvMfTqaXF9zn+jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 06:56:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.013; Thu, 25 Jun 2026
 06:56:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 15:56:46 +0900
Message-Id: <DJHXNCN5G5BN.12UU16RF1GQHP@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Tim Kovalenko" <tim.kovalenko@proton.me>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] gpu: nova-core: falcon: store bar and dev in falcon
Content-Transfer-Encoding: quoted-printable
References: <20260624-drm-bar-refactor-v1-1-7062899163c5@proton.me>
In-Reply-To: <20260624-drm-bar-refactor-v1-1-7062899163c5@proton.me>
X-ClientProxiedBy: TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a82626c-bc74-4dae-0674-08ded286ee1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|23010399003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	B469OKfM4XrKUH29avBZ/d0CUwSktX+mrRf8/wP8Soxlb5AyaaV9D3zCZ/6VfAqKUjtqI+yxnm747WuLBvIiW7e7b1ax1X9fuITmFvmyyNHen1ceZ3UwXl6/UemR12RH0HgCP3SVqEDcIyedqrhdNMehT/iC+wPq5EvU3/azoY5e+6KNIHhecGcv8HabR207fsgJRgVeNqW8iJak94HMjF0raXhydDQuRLetLUH7R4Jn0yDLk+5EZKISJ2MV0VteWAELe/pv/dVM2lL6ox7MMgmUvPl67Hi1E39pIJmYTmS0tf2vVVbK47nzRJ8XYPtQI7yCZ0YagFJHErNtxY4+mBKALI+KG0f/jgSnjFxA3YVarDXgugFqxmfmCcf2QDNfLBqscc75G9uPWV0fhOVlLBT3qxDzuKFh8OfTrfkLRp7vg3RJZxHcNAvzGtXgFFIfQXVqgLJaLeaMme3q7AyVm2zwPGzGOusCg8xCpcVxyD+NcF/3RpLfP2TQXFRAxUP9MmMk0mi2yqXA4+vWe3qP8AmtnTfc8oMDyu705/FVLozTWM80XLLGHqOVGjjK2XFvFJ7GB13NvtBbiBwZz8P9dIJoafCfiVMCoDnMuKW07/sEOC3jqcALbTPiEG1xG/K2liqMDxc+d9597AipiY0mWzKt+wJKkfYlrHmQtO5Xtas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JFdGUwS0xrK3ZsODhjUUxYekFTQ0FuSVg4U0ZiL0NMT3lPL0N1cXk0a0tz?=
 =?utf-8?B?Yk4ySDU4M0pldWhxVzl0L010TEVMYVkzQW9HWndjUWdsY2pWSmg4QlJxYnVX?=
 =?utf-8?B?emhFTExJbkloNm94RmcvSE91ZjlYT2Voc0RxMGYzWW1jSU9aOXVkbno3blpr?=
 =?utf-8?B?MmdqcnQ0MHIxdDJQNGQzZHNJOUpLbFYrSS9ncms2UnlsaWl1S28ySzFlZWVI?=
 =?utf-8?B?OGtBTXZDYWpTS3M5T204dU5xZkRramtNNk9qSVNyais3VlU0eVoxWTNPdXRh?=
 =?utf-8?B?Qm1tMDd2NUVFQndpOTl1OW0rS2VEZEZ3ZWd3bFY1U1hscnpkSDVFSVpid0Vw?=
 =?utf-8?B?U0pKTWJTV3J3VzZJaWZYYjRBa3hGSkdDenIzMXlJeDk4WXFhMDFSZEFWejBM?=
 =?utf-8?B?cnNyQnovUGRpNnkyQTZwQWFZbW5sWENhTHdjVnZkMXRYTDBPYWdpRjRnZ2t0?=
 =?utf-8?B?V0YwREJuaHhucGpxdmt6L2VUdE43MGYxVFd6dVA1M0VEQXpyaCt2cGppS0FG?=
 =?utf-8?B?Yitod0xLOUFWaDFienRZNWJXeXpScXd4V1FZNVE0aHNkbTZ5blU3NVVWNkVq?=
 =?utf-8?B?UTgwUkZkUG1iYzJBL3hkQXI0RHlXKzgrYnNSVWxVZHNuY0M2NzhVVUY3czN5?=
 =?utf-8?B?UlBGS0VZRUpUMjhtVVBFa2psRnpRaHJ3ZWh5RGw2dlIxKzBZTkhGYThFa3lk?=
 =?utf-8?B?NFVSNGRUam5wSkZhSFo5ZHNKLzUzU1N2enYvZXVHN1RSbmxCeVptclBEMHJI?=
 =?utf-8?B?bThVY3N4clJ2OHlZRFgweGNuQ1A2TVdxV1pHaUdDejBjTmNaY29pdGhUUUs3?=
 =?utf-8?B?ZVh2WmhNWmZvRGNtUS9yQ2hyMll4SWNBK3ZRendVNVpYc3AwN054VHRZVUtE?=
 =?utf-8?B?b0xsR0hXc3d2L0ZZTHpjTUNmUzJrNkgxa1c5TVdWbEhBZzhTbmh5Z2VCMnZE?=
 =?utf-8?B?cHFNZlVzTzErbW5ETDRqV2lCdG5USmlHOFhKMFBDYy9JMTFsVXBsWmhMSGZG?=
 =?utf-8?B?d2dBVWNwbVFYRjIxYU5mcFA4bERuMGh0NkJsb3M1RnJ4cExJOTE0UHdCaWtY?=
 =?utf-8?B?WnRnZDhlZWxBTS82c2hpaVJUay96SUxNaWd1K3p6bU9TN3ZRVmZwWVVVdnJL?=
 =?utf-8?B?ZjRWY1ljUFVwTEV0eDZTU0YxRk1UU3J6RmVSOGMyeDRiTU5zN0ZsY09BV0Jn?=
 =?utf-8?B?dnBhMzVjUEFtRXdDU0VSMkd1VFNyYjF5SXl2cFpuWEdYUitwa29oM2hMbUVS?=
 =?utf-8?B?d1U3OHZqTUFHZUkyai9zQnRDbmFTMUY1WmdYTEZYc2NCeG5NS0dScVZaZ0I5?=
 =?utf-8?B?R21Ta3REeVNFVGpmdDdXeC9VcUd2czNuM3dxb0ZLOUI1SWRTN205OTVNeUNI?=
 =?utf-8?B?NmU0OW1xTXRIUkRLblhFeWMzMldPUnNuLzB3K2YvWGZncDNxRWVrRXlPSjJ5?=
 =?utf-8?B?ZGRhc2lBNnZaa083dTNEb0lkcXZOSmY0UG1BczcvWFVtN1ZCY2Z2d2k1am1W?=
 =?utf-8?B?MXFuWE9LbEFnZXVTcllBdERXZWp2VnZVUmJML01iN1VvVlgwQWwyT3hOUmNt?=
 =?utf-8?B?K0JOUVYxbDlXK3M1Wk4zL3dpRWQxaTFLQ0lubmxjWktLeFNuTGJmb2NxbjhU?=
 =?utf-8?B?enBBQndIQkhGRDlRNUx2dFBYL2N0cjRxd3dkcTZ2d2o0T2pNSTdXT3haTkFz?=
 =?utf-8?B?M1ZhZ3lRdGdWMFBwNUpLTFhhQUROSWR3UlFxKzk2VHpCcjUzcVNOMW1NK0hQ?=
 =?utf-8?B?a3RWUGVSM1RaWnBGWnhrQ2JQU21VeURMTndESFB0WTVGT3hNYzY4S09QZmlR?=
 =?utf-8?B?cG1WdWNvM2VrVGVRbW92MGl6czlQckhLZ0dXMkY5RlE0ODJLNnM0UC9INUVX?=
 =?utf-8?B?aU9PYVZtSkZXOUNLSGdGdkMwc2UvOVFkdm9HR0xIVjZNMkNXS1lCc0ZsUWJu?=
 =?utf-8?B?QU1HWFUzUHIyUkU3YjNXb215ZTlOd0RXVDFCbG8wRWZua3FVamVvN2hjMmgx?=
 =?utf-8?B?RnR0SmFCdGVMWWh1OWo5anhBYnFieE5ZdjNNbEMrT2ErZW1xZlpKazlXVWND?=
 =?utf-8?B?UkRRVmJZWm5XWGMvWkt1eFAvRW9rc2N2TzNWbFR4b0orS2hIb3hlMGI0Q1ZB?=
 =?utf-8?B?UWhnMXlGelU1SUgvZEd5VFNSNDdmU0hOMjdIbmFHQ3RGaFE5VDZ6SXpVV0FJ?=
 =?utf-8?B?ZmdoTFpCeC90T1U5OWNCWVM0WEI2QVFDck9YbkQ1VzRLUkV2YmZPN0ZCS3Vi?=
 =?utf-8?B?MlZZa091d1crUityTDBleVd2YldheFVXcW9HVEdkUE55Y0R6UCtuRjdzU200?=
 =?utf-8?B?UXNEcHpVVytlaEh1emVtZjM3U3VUTmVEeGkyRXMyWUVDdkh1bUlUSHhaMjJH?=
 =?utf-8?Q?CFkJqBi78FbanoQoXndoLmmwJbN8MTIwgYaGqP/hhwKiz?=
X-MS-Exchange-AntiSpam-MessageData-1: 5glwjfURIDAmuA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a82626c-bc74-4dae-0674-08ded286ee1c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:56:50.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDP0bqbYIW+XkW7zIIw4aZ0nOkEYVWhUqyw0cyxi4QhJp075tpB/M22gtjVrA/LJgSLPfJ1/11UhFiwz7P/D7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167

Hi Tim, thanks for the patch!

On Thu Jun 25, 2026 at 12:51 AM JST, Tim Kovalenko wrote:
> Store the bound device and `BAR0` mapping in `Falcon` instead of passing
> them through every `Falcon` operation. This simplifies the `Falcon` API a=
nd
> removes repeated `dev`/`bar` plumbing from reset, load, boot, mailbox, DM=
A,
> and GSP/FSP-specific Falcon helpers.
>
> Add a named helper for configuring Falcon FBIF transaction slots for
> physical coherent system memory, avoiding direct `BAR0` access from the
> FWSEC bootloader path without exposing BAR0 publicly.
>
> Future work / questions:

Questions are not something we want to appear in the final git log, so
please move such comments to after the `---` mark. If you use b4, this
is where the cover letter text will be placed on single-patch series.

>
>     - Focused only on the Falcon for this patch - more to follow.
>
>     - Not sure about the FalconHal and if I should modify the Trait
>         - Could be part of the next patch
>         - But it could definitively be simplified

Every HAL method takes the `Falcon` as a parameter, so it is able
to access its `bar` and `dev`. I think it makes sense to remove the
parameters there as well when possible.

>
>     - Also, how far should the refactor go and to what extend add new
>       methods to avoid passing `bar` or `dev` but also not exposing them =
as
>       pub. For `dev`, there's a lot of `dev_err` usage that requires us t=
o
>       pass it as a param.
>         - I've created the `set_fbif_transcfg_phys_sysmem` method to
>           address such issue and remove some code duplication but that
>           method could be made a bit more generic.

If you add new methods, these should come as separate patches, and be
thoroughly thought - `set_fbif_transcfg_phys_sysmem` seems a bit too
ad-hoc to me. It looks like the proper fix for this access to
`NV_PFALCON_FBIF_TRANSCFG` is more something like moving it to
`Falcon::pio_load` or something, but this is a separate problem.

Let's keep the patch focused on `Falcon` itself, and keep the `bar`
argument of `FwsecFirmwareWithBl::run` until we figure out the right way
to address this. We don't need to clean up everything in one go.

>
>     - Also, is there a reason why we are not passing the `GspBootContext`
>       when we need stuff like `bar`, `dev` and both falcons?

`GspBootContext` was recently introduced, and yes we want to use it
more, but there are plans to make it generic and until we know what it
will look like I would like to limit its use. So for this patch, better
to keep things simple and mechanical.

>
> Reported-by: Alexandre Courbot <acourbot@nvidia.com>

This is not a bug, so `Suggested-by:` is more accurate I think.

> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/=
topic/Storing.20driver-bound.20references.20into.20sub-devices/near/5991378=
82

This can be `Link:`, as this patch by itself doesn't fix them all yet.

The patch itself clearly makes things more readable, and looks like what
I had in mind - modulo the addition of new methods that I would prefer
to see taken care of separately. If you can send a v2 that focuses
strictly on falcon and does not introduce new methods, I think that
would be perfect.
