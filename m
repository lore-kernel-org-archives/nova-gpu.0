Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012013.outbound.protection.outlook.com [40.107.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A282E12B94
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750579; cv=fail; b=TEv1AIPyxpZDF6PE4brXJ+tT4pQG4nTQXwLyzAa+iVjpHqbIsKiZLcH8hgmr47wRDre5hn+iMhZOngBu7SETW4cnY1s4iD6zktXvzqSHIvGRcdeCohjRcrkXcsEX42kZjZSSGu1mr2ATxdDPL3KhiIQpIQzm9rAGT2c4qq921oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750579; c=relaxed/simple;
	bh=mZOAQbmuDwkcS1HnF8qDazc78WoUKZ2+IE/snz27P/c=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=eCWd55ChXRHfJtsBxhzUA/m+bOcziSGbj9rk/afagEK3p8ZlA1k0UZqTgGgj2fLmm7HQvGMlC3+qtLzPLTTDszVZjrZhroMOQipuH3Afr24WtdflrsXUXgKe9UUdt35FQPpANK/JVr/pozSzB6zP5c28lB7wN6rtnaCcg6Y1I5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=StazrilN; arc=fail smtp.client-ip=40.107.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="StazrilN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSs66wf7Qo5irwxXTV8zfnTP6MgyCcEykofDdq6BTuLqMwfe+ds3Cfn2H3iVCLcDP4t/1j94qT4IptGYob5E6je+/wkkh010uccV6BFI1DpqbMA37tKGyk+flZ/zbY+yysYh2uRCtlBuldTjqwEcNyPvZR88c6ATPVnq2aKW28N6rGrDdy/glQQOm96QdUqoLDsIjqM7osi6MokBElv3VB9lOveEs9Qz2hy9nRovIiWF3aQwpl7OMBDN4nHx73eWgZEQI5bF/1Bgd64xWAKu9E6hpqx13k3mvtZde8pNz/4xytVaTaLYS8GcZVyt2F7QBxgYg3WzOH3/Y9909XXjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2JejHoXhr8v5KsV4ErYNu/kOb1kUlniqHjdLqPuzLo=;
 b=NbYGLq3Rqeidvj32v2DMwn848taN4SyXNFp9jABtwxvZO1wHu2hcKReJrsslvfZxdCwcdejRaAWj00wjJEINGfzQ19wLDpSvUInkhpJ3sNp9hcCyOO/uBKOre+MadKF+looILtr24H7o0OPdXq8AigVji6sYL5Y8IkcrLd468a4AypvdG/cf5K+7g9nB7FI9HcEu6zecqeYv1gC972VKsSFGBIQY/Wyfi9alzzC58V9ki9ebvudJH8UVgYagzPejatFm/LmtbabbhcOO1z7OnadsyfSXR+xiQIbKDSoZHbyNPrwzO8+cN5o47AnWLH5QCVkMiY8HERZoLa85E6sZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2JejHoXhr8v5KsV4ErYNu/kOb1kUlniqHjdLqPuzLo=;
 b=StazrilNSOvvun1yLx8OWtqeASURd8MMUVXAABlMgPcmHxjKst7GN1/2Lygq8XelzogbTag1fvTKXoJsQB46PHGYP/ikfb9w27U7uG0SP9Cc+3U41ywr/6AWaNoYLWaPs1Gm/qg7R9AvoYM0HbVvpRRLpcQSmzuYHSW/eNg96z/GiwSf/0xRRq+Aun5nM95PTpw0A610DKy3l1jGBSO7sgm8zXKQcBNeGWh9QBawtzdpVJjNFengT0F50HA2jDKyUfuvxxb2ujT/cE4uLd33QLiAu8EzR9PRcIChxU5WmRb0B/GG06kFIHsTFcEgZs5Cu4OwMf+anItMKFXAyfJHDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:09:32 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 03:09:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 12:09:28 +0900
Message-Id: <DL8R5N4DNR4N.EWPCLUIVTGC5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v2 06/31] gpu: nova-core: zero-pad radix3 page table
 levels to page boundary
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-7-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e0de32-ce5a-44d2-708f-08df0c8d701a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10070799003|7416014|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WmUANePA3/a7dDmdGDbDxXmCUE3Hkeix9pMeENwnVUr/LNgyhAW1bLsNbXIRgzcoKclShvMnL2yj1785hK2jxZOWfiLF9flB7a18TrMRr6zLv1PwUj322WZLL7OWIAbkE5SWJ75A79lkI8Ixvovk933fFY0rgk6l1bOIBotfg94lGqaisqSRp0oFdqxhUE3hLjR3rT826p4r2QsbstkO3c3Cf95mjE8wZZuj7j2zlZ+F6X+241xeHFRALmGXl8nZZnAZNRbSnSTlwJxWZLJKEkgsHvewNPqQMy0w4ZjZDfSBu03V4IS0nHBigqfN1dQkyBcpmPR3/TDzlXydO0omH+Gf966v/qfBkKi1V364g97lPo7RjQnKE4KL2zN1AzsLI2mnuni8ZhyL49CTtwsgyphphWLbN1URyrp8Sjx09WyX26K/ulrmmk50MZ0YdB1Q29ScefIg2iZKuZuGwc3trA73iwg+N2bG5dXtZmJRbyHOmJt0sGIluWapsqDn/bV3duY6ZOun6MS/ppnRBAGKVUhHeSHu7l0D3yJMfZtw6AcimWwb/n3MOBYRt8KuQbIx1Y0UCjA2KgTCI4B9rrIZ96oSAcPG9HQjECh7jl1TIXB5m++wYrzaCcYutLGGR4K00HU2bs+RmuAVYePKv2IILmVX8nzoSjlsiBMOWC3LAqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10070799003)(7416014)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVhobTN3SVcreVAyVk9XSFNPeFJPWDZubkpOcXNIeEZQVDF4TTBwZUxmRXZO?=
 =?utf-8?B?blR3M1NGc2pjUUUwZWdiMFVjRVBvQmV1RjhUMzJNZzAyNkdHUEhmb2h5SXlC?=
 =?utf-8?B?Z1djK1hSODloU2lWOE9NZDFkVUoxaUtvU1NjOE0xUUxyd3cxRnkra1lKOEpV?=
 =?utf-8?B?TDNodmQzSFRkZ0RrV3ZKeVE5S0hrTjAvU205cVR4cTFUOWVWWmpKMGh3R1FX?=
 =?utf-8?B?Z2N0dGY0a2RMbUFkOUlEanRoTXRZd0cyQzZ3TlhtMzVQUDkrUHFmN0tuN2R6?=
 =?utf-8?B?OStwVmduN2xjazA1QXdNdlFJY1liamVLZG5TcFcxdUNLTENKZGh6eW1XVzBX?=
 =?utf-8?B?amdHT0NHK09wRTVObnh4MHdBd1ZNVXhPczVMeTdNVWtmMDVNVzZpNzRSeVY2?=
 =?utf-8?B?SHRDNW1waDI0c1JCWmZQbSs1SFhJcDlWenN0elo2N0tETkN3bndNL0NrdWla?=
 =?utf-8?B?N0ZzNXM4MjVSQVFoemlEMHpscDIyZ1dWNkowc2xaNlNESVFVK2ZadlFlVklj?=
 =?utf-8?B?VWVLVlJkbm1PZFJXRDJzeHhOTEI0aVp5ekJTYjRUdTd3RGtlWHNZTm14RXVa?=
 =?utf-8?B?R243cEo4WnZHN0k1aXpxY0ZRN3lJdVptRFZQLzMvRFo1SXNQY3lxT2VSR0Na?=
 =?utf-8?B?VndzZlBoeDBtU2picm9yR3Z2cklvS29QUVoxbG9wdFdYN3dCZFF4QzZScVhq?=
 =?utf-8?B?WHpOV3JGekZLR1lTRitZajQvVEplamZENFZ6bzNqeTd2ZCtTdFZLUW8vcmtw?=
 =?utf-8?B?NFlsSSs0cTJwd1h6dyt3VzNVK0xNbUlkTU0yOXFmcXpBQ2J3Wm80Ny9nb3FE?=
 =?utf-8?B?cVV3K1NXNy9zVForWnZUVlhGT2cvRUEwS0I2VytDalRMR2JYWVJHRDRuWmp1?=
 =?utf-8?B?OUhsbE4vODFaSmJ6MUlEZ1FhR1FhYVNOOFhlTDFuYkgvU1oweWp4RUZKQXly?=
 =?utf-8?B?ZTlqcU12cWVVNzdsei8zNm9WLzJRQjMreUNEL2lvU2FRa0dTYlBDY3Rpdk9B?=
 =?utf-8?B?M1VsMDJza2lodWwzTXBiOGdNcm5uT0d2eHl6M0J2VEpPQTcya3BpandSeCsw?=
 =?utf-8?B?Zk9vTis4YVpNa3N1aG02N3k2RWtobkNDWmZ0N0wzeWRkbU1adzJKeWI2dVB1?=
 =?utf-8?B?MmRnVDdHUVQ3ZzAzQ1pqM0JyZEM1TTJ3cHRCUmxaUjNFQll0NHhRV0FJY1B6?=
 =?utf-8?B?UG1UVEUxekFnZllJM1ZqcXFOL3R5Yis0QWhVTUcwZlRsVVNublM0YWFieHdP?=
 =?utf-8?B?cnFUN3pGeEsyRmpaczJVNTlaUUtaLzBZZmZ5RDRnM2dubGRHVlUzdVp1aFZQ?=
 =?utf-8?B?ellKTDc5MjVZMCt0WXpaMmhWdGZ2eENqclBrSVpmNDRMVkFscVlwdzJlRmd2?=
 =?utf-8?B?VDRQRjBQZzdCUGh5S05yQjhYL2N0aUZ3eTBFVUprS2V3Y2puaWpSOTZ0Vi9G?=
 =?utf-8?B?UHJ4d1Z5WEUrRU82UWF4eFRmOFRhR2J0Z2FadmRSQ2gwMnc4WldDbXE5Z3Ay?=
 =?utf-8?B?RWFTVXM0MlYyeElDTGx5R2xmQ2JVNHhpL2VZcThOSFNXUW1pOUtob2JFRmRu?=
 =?utf-8?B?WXBHSXI4enlLNHcyb1M4NFhzQ2NFRUVIWXJtUlJrcUx6eFlqbzBSZm5VSTE4?=
 =?utf-8?B?ZDNxMWRtWTMwa1RSd1VuVXBCRUFWTkxsTzFqa2Z4QmIrL0d1cGNSSldOTStm?=
 =?utf-8?B?dlNheU5keWJjZFZmK1dxelIwTUxZTXRIejc3bUJoVVdHOUY2QWliNEdWRmhJ?=
 =?utf-8?B?ek9PTElrdzBsVHVSei9pU05HV2o0UVgwK0dVNGRqMVJ1TEx2aFcxUlpLRFZB?=
 =?utf-8?B?UUkwWWJPKzQ2UGJCNkZKQ2pRSHJ2V21CSmQ3ajgrNlZPQlhlU0htd2I5ZU9j?=
 =?utf-8?B?NGFqWUlxYUsyVW9xbXBhcGNwSnRDSDduZXRzRlR1T0xvZXJEd05QeWRIbGx1?=
 =?utf-8?B?U2xYZ1FydnVqcytRWW1uUFNZWi9wVGhybG1CS1RZSTNvSS8zdHBXV2J3NUVl?=
 =?utf-8?B?dWdMUlZQOFE2Q0Y3UVNJQkdKSXFHR29FS2UxVHRpUVJiT3J3YXhrWkdvSFpS?=
 =?utf-8?B?Y2ZYaXpOVlJZbExCUVhmTTh6UEZGT3dtRExqOFJFVHlKWlhPWXlxYytLRjRX?=
 =?utf-8?B?NWhsNHpkRW9ERDFrcUlGMmFUZUc2NDdPSlg4L3kxTWUvRWtCV0d3WHh1ZlVJ?=
 =?utf-8?B?Q05ROEFsTTRnMlIyNVFIZ0RZalRrNlM0bEZpUjFjYmtuVWd3am5nWUNqai84?=
 =?utf-8?B?SWlYSG9HREY3L0tONmtiRFhNMTk3bnRiUVREZVBjMTBTbmhXMEpHMVdEY3Q0?=
 =?utf-8?B?eVRKOWhRdUpqc29UZ3Y4WWdZSlY2R3cvQ3NYY2lENkpNTGlYUHFBZ0VtcG9a?=
 =?utf-8?Q?58y0V0+uTBgwt3wgKVuwB0eusOdd5TjfQBU2+9f6htJQq?=
X-MS-Exchange-AntiSpam-MessageData-1: J40d7GwtTuM9SA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e0de32-ce5a-44d2-708f-08df0c8d701a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:09:32.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7fxmUo2Re8b3t3h/a+nL6lh+FsUuyVqR6mn1uyauAL31R0V+5WTkqbAF+/dtSYKRF8wgJPYXSUO6sEgeH2ZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208

On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
> GSP-RM allocates the whole radix3 page table region in one block and
> zeroes it before writing entries. The booter reads each level a full
> page at a time when it walks the table, so every byte of a level page is
> firmware-visible whether or not it holds a valid entry.
>
> The driver allocates each level separately and writes only the valid
> entries, so the last page of each level is only partly written. The
> booter reads the whole page regardless, and a non-zero word in the
> unwritten remainder is indistinguishable from an entry.
>
> Allocate each level zeroed, sized to a whole number of GSP pages, and
> write the entries into it.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/radix3.rs | 50 ++++++++++++++++--------
>  1 file changed, 33 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-=
core/firmware/radix3.rs
> index b60611c7bea0..b0630fd96c01 100644
> --- a/drivers/gpu/nova-core/firmware/radix3.rs
> +++ b/drivers/gpu/nova-core/firmware/radix3.rs
> @@ -67,22 +67,14 @@ pub(crate) fn new<'a>(
>              Ok(try_pin_init!(Self {
>                  data <- SGTable::new(dev, data, DataDirection::ToDevice,=
 GFP_KERNEL),
>                  level2 <- {
> -                    VVec::<u8>::with_capacity(
> -                        data.iter().count() * core::mem::size_of::<u64>(=
),
> -                        GFP_KERNEL,
> -                    )
> -                    .map_err(|_| ENOMEM)
> -                    .and_then(|level2| map_into_lvl(&data, level2))
> -                    .map(|level2| SGTable::new(dev, level2, DataDirectio=
n::ToDevice, GFP_KERNEL))?
> +                    let level2 =3D build_lvl(&data)?;
> +
> +                    SGTable::new(dev, level2, DataDirection::ToDevice, G=
FP_KERNEL)

Or alternatively:

    level2 <- {
        build_lvl(&data)
            .map(|l2| SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KE=
RNEL))
    },

I don't feel strongly about this, I just think it describes the flow a
bit better when there are no fleeting local variables. Feel free to keep
your version if you prefer it.

(also applicable to `level1` below)
