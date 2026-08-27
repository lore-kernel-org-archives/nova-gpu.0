Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B70257459
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787791064; cv=fail; b=ddW2OXh9KtHJXDNK4e4q4EA2Ql64IGfuYHbuPXncvUGYMIA5kHIwZd+4DniE/5I2o9VclphA7rKd7Fpy6UbesU1e19sq4pGKxJ7DI5eXf+rHC0BhKpCAdnQV2O8wAi11p4Xl5NAwitMtDg+OFfULZ0q4TqiLy5H5ibRCBBhGKY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787791064; c=relaxed/simple;
	bh=gnoHAlnoSp7F9lZ5XLaDvDYXdKft0zE0lKMt250FO2o=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Mxy5HRM/Ci1oyAkp8jkLsDNFrbGkmWaWJ0ICv0WlriXEq0EDaGFZS9+XcXpd6qXASA6BvAoxM7qM2YBbJkXr4XkcpeKc8dqQYB93fOnr8CcqwZV1nKueMPmaTaKohtFFLik0GzbrcFKJbdkUbHDitqBEg2S1/Hl8zLLVknUaMjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G4jfHFDc; arc=fail smtp.client-ip=52.101.43.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G4jfHFDc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJje40C6lA+hiM1kM98mjMZLlRq6AAB8nIulg8R65oc9qL0zSuZuiAMvP5TY8sOtEeiFdP93JupuGhkXoerH/xZy7b+uHsUDtI/cppVHSSvXSCUDXFRfyshZ9xWsx9wyJmG3jyXiTQ5SNYmicghamf2wpGdT9/psZ9wkuZ3lsebjcmqHkP+rhalzKd/jwabmROe3SOLiZgVtSbau/S4YzS/tOz//DfwO9ToXDMKMimX9Av0CSaHT6ieY/cRd95ADDKQCT/haFh41yyF8OnlSj0tHXM/hmsURpnKgOLi76m1CUaIuggS7St8jLVtnj0eXRj/2gn0oo+y3LYL/DKzgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxx4Pclp+Y9jeA4mHNRrOikG1pck/z+VjJoE0TbgGQM=;
 b=Y1vPvFwczzFqr5od1l75Btcw9fTDDMgjI97UWjBpJFfS9k/TKtrZIGr7gZwZ1hO6al2TTJV3ezyFmhCM2Yg75bf2m5Ki9iAWP1tQGy5A9D0CqBuPvJJym5Enj/RfdLTHe7e5AcUlrpHUg8UV2+t0slWMHc0Gmb4a6x66MYXw8zTJNd5/SA2KbYcgN10wfQ/o1TxmAXoVXoyGa6P8qpyzV/2+nZfKnSUky2LWgfbmjdVkcUznWrXQuy2+v/wuagIrn35RGkWCm3GwYf51rhBCVyK4riTqNBb5TngHej1ebtBj3WDh6dzClauEQrL3mgwYXMq0a1ujpWxbUMlU0VXo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxx4Pclp+Y9jeA4mHNRrOikG1pck/z+VjJoE0TbgGQM=;
 b=G4jfHFDceC0VgT/s0Qd4c4+EAlxWeWD6xKDGy7e57sKMy6fo+HOAwpm5A2rCoJIV0qyqwqmgWRJJv8UuXrPV/sk4JL5F7bAA6mC+vGNbYptXHESBqihgF+ak3O+liPYWjLhb2cDx2sGpuaVjm/xUeQxHFIv73pChRrabb+h7HvWfWy/rDRBQ1Yx2itiu5QC+UFhngyB9ZYRmyFUjMPAaQIEwmSh3JJvTHTC8od5sCL8/5n6wIRYTdQO5bEjxaGoD1Jq5X71+R/Bu0M5wsTg7DMsbOxazRY88SGDIEFQlkhaCd1a34Va/vlLIFMm2g+tiLQ9oTeVNzbWSm1iDeOajhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 00:37:39 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Thu, 27 Aug 2026
 00:37:39 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 09:37:34 +0900
Message-Id: <DKZB1C3502I9.1NBE2D1W50UZZ@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC
 firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
 <DKYA3P4E2CRC.3NVNCJ42J2FRN@kernel.org> <20260826111408.34d47a7d@inno-dell>
In-Reply-To: <20260826111408.34d47a7d@inno-dell>
X-ClientProxiedBy: TY6PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa1d8d1-f15b-42d6-819b-08df03d36593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7l5k0KgkxxlyHksQjjRIDYMJ1//Ci/baRG+FK69n9/8DXy3Q81ifAlRfrsmzC84Mqa2Yj2xKvOoNx67tTDej6PQ86Od7bEYcymmcnpQQG4VwYxocX88H23S3r3C1jalSMwxRbZZKMfgM8EAdyrulqH1CyiX21c86GB13NBsZ6os/tGyuazmzrSDfqFZLiKKHMx/EF99arhMSO2nzav1HVqoB74DGYzAriC0DO/+FTMd1SgD0U0/0X2ypbpX74zvA4ybmJ+GXWQxSaOKU2HhiBcC9CdWCDTeXAWa5d2pKwhsg6z1EtAIxVWQZh6QuQJVZ7iz62CROe6IaV82CgkBbNuOloJWM67F27WdfkcnjUxjgWqCCS+kRl4XghE60M0Z9u8y68k0XQ3N9q2J8z966HZMGTlDr0NDdZnbcE1v5nmPOFLmUQqW8X6nIWE35qaloh8L1nNZpajbeHaVdUumRJ5vblA2IbeJxzBn7QzCC3DAZqZ4L9OsmAXMtaGPvvhdlutmKzHzZK4L6VtrQSA9mrSEDopHzy2Xx2fog4t2SxbqE3BTzzL6ePLxjVy7yCDfmBoCOazmdxTgTLf6TydHkfcUhBVxGFd/YaN3dL40NdFY05VRo66om3+M1jCkkJm27Uu17yNBvW9cMgleFcfvqxiYgK6e3N3fBkuPI/diQFBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUhGVUpXTURrb1kzVnZZTDAybnhhYm9oc1hsVWJibHpWdTVxaDhwSEg3aUQx?=
 =?utf-8?B?WFVvdmM3TlFmU05TM3BSblAzdjQrS1Z1a2dWeVpkZnh0ZzVRSkJqemJLMmtK?=
 =?utf-8?B?dnhtbWl2UDRYeElpbFVMc2p0VzhGUE56TDlzKzZxc2k4TE4zVitzOXhuN3BV?=
 =?utf-8?B?MHBzN3BVUUh6MEpXRzNPR2k2OVRVV2ErV0ZPcDhhejV2ZW5FUU5oNFd3YTFr?=
 =?utf-8?B?K09oanFNY1ZsNGdXdXNsd0t1SElIaHhid09XOVptd1p3bHpIbytJODE2T3di?=
 =?utf-8?B?Z2NkQlQwYTVkUG9qWGdDR3Z1Z0FSc2RxcUF1VjRYTjhjODVrWWh0TE9OZ2Zt?=
 =?utf-8?B?TzBJSUNITks3VUREQkNUSVdzWWJTald5YU45Mzg1SlZGaUt5OERPakgzZUs0?=
 =?utf-8?B?Y2M1TGNIdmhSMkFzZlBWeGN1UXhTeWY5aTVMVUFoQTEwd0k0bVJrU0ZVcmRN?=
 =?utf-8?B?U25USUZ6WHNqRDI1ME80TjF1RGdnb3VMT2RRSzFHckt4dGo2S0daQ2dnRlhv?=
 =?utf-8?B?eW0zY1Q4TVU1c0hzZ3RSQkZLYkk5dzZTMUEvT201RmhJQitOSFVNbzAxSUN2?=
 =?utf-8?B?QTZRK3Q5dGFpQmdsZDF1a0Mybk9xTFhQdnBXYXR5Sm01THo3VUtuVDZJUVBH?=
 =?utf-8?B?NSswS0F2Z3FqTkNOOFBBd05PZWVRNDNVMUFoRG5JUm9ndytHMG90QUtENmZZ?=
 =?utf-8?B?anBKaUl0MlA2bTFCaEtVc0p6NGNFVk1LTW8vS3EzZmdRbEduL2E1R3JMdy9I?=
 =?utf-8?B?MFNZTnIxdTdkelY5MDhIZnkya21Kd2xmUnJON1VRVzEvWjZwU0QvT2E5Q2tU?=
 =?utf-8?B?SlVsTERVSXFCbmE2aTBrYUFOVnhSVWhQMkR2S29wVjViRjhsUUdDd1pEZWpa?=
 =?utf-8?B?cWYzeHM4TWlTRG1MWnZPTGFscHgrakhseTAzcGJJOWhxakFNV2xNcXNoQTZy?=
 =?utf-8?B?Q1pRV0R5S0hCaFZ6Q3VFRlIzdS94YjExN0hwUGJwbjBSeWJIa01FeFR6aldB?=
 =?utf-8?B?TWhYbUZpU0lla2o2cjUzNnVSeWFrZUFFSnhlbzUyT1Y3K00vdHJpdi9MWU82?=
 =?utf-8?B?ZFc5ei9ia1UyNldLdFg5dkRoZUtuTllRWjlQTjVPV0dLR3R6S2p2U3pXREdB?=
 =?utf-8?B?bDBuMWFkc1htVVhiVUFCNTJJNW5PZG15a29TZ3JjZWdYZ0UvQUtPSXZJTHJq?=
 =?utf-8?B?bWYyS3RPSG02UFpyYW5zcDZhTzlpa0FHZ2dneTZVcjU3RE9jd1d0SGlVUlVN?=
 =?utf-8?B?YkpSWWpUM3AzdUszazI0UnRScVYzSjhzcnpZd2JkUjZ4ZjNSVmhrWkZXa2lw?=
 =?utf-8?B?Y0hFM0R4bGRKRlQ0T2ptZzZ2VVRXZnlpSzRnRExlTlgweHhpYUtqK3RUejE5?=
 =?utf-8?B?Q3lPK1h0NWdhdEhTak9SbjVscGZwTkRQakFjcDRWNlNFSEF4bDBEOTBCTk4w?=
 =?utf-8?B?N1pSN1gvdlJWMmQzSTRBOUVIWDBCb1craXhQSzAzQmZOeC9DUkJBU3FlREFR?=
 =?utf-8?B?T2hpbGNPVHVqdDdabnhyeGhKOWMwZVd2VEpFeEVLV1Iwbm1KUmFJZ3hNYkNq?=
 =?utf-8?B?RWhPTlFOS2tESjkrK2lkTlA4cWRaK3FXKzE3eWMwTndNei9yL1Nld0tMSUd6?=
 =?utf-8?B?cjNhVVpJZFpzaVpaTTZHTFF4OW1zS2FQRFRhMVFRdDljcTBNazJDbDl2TndW?=
 =?utf-8?B?ZTVSb3Y3ZWY4R25EQUFLbHRmVGpudml4eWYxYWhRRmc2TDYzc0tSZ1VDb3VN?=
 =?utf-8?B?Qm51VzV1ak1yUGtJNEVmNlIxaTJ6NkN2SVZtVFBJbU5ORGlKM0wyOUVqQXBI?=
 =?utf-8?B?WGtpSW1XR0lRNFptQ2VPZk8yQ2NCaFVsVEZGR2JxclZoTERaSVVqOEdyZkJW?=
 =?utf-8?B?SmxuSWliendaUDU5NlR4UmtocjhmK0V3emlzblkrMVNlTk9UZHZYS2lFZS9t?=
 =?utf-8?B?LzIxaHpDRXNsd3FSbmthNFdxODg5eGdodlA0MmljTjM0UzdaQ3NzVGtoRGhV?=
 =?utf-8?B?WDRrUUt5eGw1UkgwUUx6d002R1UwdkJFWXJNbUQ5NkRPR1VxTE5teGVLOWVG?=
 =?utf-8?B?WXJLWDJOWEhKYjA1S0JiUll6RGJvV2lVdTRyY0xJRkc5WkswVWEvWXBFQVVP?=
 =?utf-8?B?ZEFkbU9DbEhkMFBuTG5PZzBvWFhyNGNZaEJUM01lSTJKWVdSa1p2b2hEbnVR?=
 =?utf-8?B?MnByTmNmbEhPTkVTQ0FERk14aHFMVTRYVVNMcXVMWTM1Y2xpYlk5UTcrUHZJ?=
 =?utf-8?B?ZzRlQ1ZtMEI0SXAzTWtCY0xRNWExTHoxU1kvM0Z5TDRubkpLSjNZUStJNWdM?=
 =?utf-8?B?Q1hxUzFPaURqZGV5VUgySTh3WUIvSWlQMDQvSU1LYUl5QUJZc0NISVVMc1lQ?=
 =?utf-8?Q?TfsAQlT5FfO6MySNkEeemfDrTrpg6KjCazmM6WU15qPrh?=
X-MS-Exchange-AntiSpam-MessageData-1: MHhAYZz2weCQww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa1d8d1-f15b-42d6-819b-08df03d36593
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 00:37:38.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOJaAtB0b0ZAt5DBWRwBzMsKfP8i3GyVbSA7eYYRXknYH2ltR4O7lgrvqMUKspX1FpLwvAbaeSdYUg6ZWKLW8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

On Wed Aug 26, 2026 at 5:14 PM JST, Zhi Wang wrote:
> On Tue, 25 Aug 2026 21:40:58 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> On Tue Aug 25, 2026 at 10:31 AM CEST, Alexandre Courbot wrote:
>> > The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
>> > itself as running on the FSP. This is incorrect: GSP-FMC is loaded
>> > by the FSP, but runs on the GSP as the loader and verifier of
>> > GSP-RM. FSP secure-boots on its own before the driver even starts.
>> >
>> > Correct the naming and files used to contain the GSP-FMC code, by:
>> >
>> > - Renaming `firmware/fsp.rs` to `firmware/gsp_fmc.rs` (as GSP-FMC
>> > is not the FSP firmware),
>> > - Changing the prefix of some declarations in that file to `FMC` or
>> >   `GspFmc` (interestingly some were already correct),
>> > - Fixing a mismatch (FMC means "First Mutable Code") in `fsp.rst`.
>>=20
>> Good catch,
>>=20
>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>>=20
>> >       FSP (hardware root of trust, boots from ROM)
>> > -          -> FMC (Falcon Microcontroller, verified by FSP)
>> > +          -> FMC (First Mutable Code, verified by FSP)
>>=20
>> That reminds me that I'd like to have a table in
>> Documentation/gpu/nova/ listing and explaining all abbreviations.
>>=20
>
> Thanks for catching this. I got this abbreviation from other patch
> comments.
>
>> In nouveau it's a huge mess and all the abbreviations became rather
>> confusing.
>>=20
>
> ...
>
>> We already have something is fsp.rst, but I think it is misleading
>> and needs to be fixed as well.
>>=20
>
> I just dig some docs, there are multiple FMCs for different
> controllers, here should be GSP-FMC as well.
>
> Alex, you can include the following diff for fixing the chart.

Actually, since you have your own patch fixing the documentation [1],
let's move everything there - can you fold the documentation
abbreviation fix from this patch into yours, since the chart fix also
seems to be there? I will drop that part from this patch when applying.

No need for attribution tag as this is a one-liner.

[1] https://lore.kernel.org/cover.1787754628.git.zhiw@nvidia.com
