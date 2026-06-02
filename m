Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5D3DB980
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400548; cv=fail; b=sBONSIAzUwqD4Dv3em/LSiIUaSbesl5kPZzTXIsnd1edsGf4B0edgZryg0p1ghFLDQIaBvjmPUJshBS/lHdQ91unSUqYGu/NQ/2mgjwR/9e7TFB3ohu7gjqqwmkQ7XMbLRUeBuH0P3Qvm7dDMVVGh5HPZ/W0w771+Sb/gPT/Axw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400548; c=relaxed/simple;
	bh=EQrRDO0ObD46757GfwBkzOn+jT7ChO8ch6fJ9tj3NpQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PkwBeSS+zlpJyluN2Sg/7NTasqcPOSww01yqtFm3ceej3dKb/PQxhCcYkM8+xXyTaixQE51d0QmJXrWOlr3Q6CuGd1GrBcqWwthFVOxt8YnW3TAYxHBeRl2jlGzBku1zpTSRdfp2KhW73JmwZwCrSCl9K6+JkZEdTsxC7lUSH1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QO5UWpz5; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QO5UWpz5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk8G4cRDbSJj2IkrQqC3EQXdfKU2uBWWjYoKqnvSf2E56Z9a9Dr0XYRgMz6SWKU/m8QfCwoi30gZCx5K2tAt9y78N1tHvWsh8GhqS1RRL5ZTEIEi7XArOsvd8j5gakAkE2a1pR7Eq93cPzRBhPXruzOa2StE5QkSNc4qoqVGVKXBtPcbVFs0bR86bD8DG1XF1BbzRip1g/0VgtS5kqZojJWYN2f0vEMzuf+24hJd1a6RVexsPZSGOmqwq23c3wdBJgWhq2Ycc+3uvtgWbARu2JKgeH9AAZO0sjoCD0uJ4URfMJiIny0afO4AYcQYwGuyezRsHm49ZnIn854uuME3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shTir0QWpUOR4uLopGqKwoSjDW2B90VDsDrDsasz9dc=;
 b=P3YkyTxIl4p5bw10BQmbGTe3j29yilKpKxTM/2kJUMHvoN3sohbrrta6ZMT5ZPplk91eJpTp6/hnZuh3owQ0R1W5CB4F8svf09eyWmn649ZpwHBNvw1rjvSPkNVdfptZ4ixQbI9im7qQo1ITyOA4qNYVg68yWXiD6SQFPAR/pl0n+eF+iJwMlFwD4CoovlmdlaOTeI0k4lWwfaJysnwsfoKFtfRm6CvvHiV5btL4wabV2vUDAUSmkw8hcH5N5gxxT20RZC71MeyHs1VzSPSWtAg7DQoliW6uDdnE8h/iGCNHjeBAHyJBLWiFuf77JMuLGdhkJWdjoElK4MORJMlMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shTir0QWpUOR4uLopGqKwoSjDW2B90VDsDrDsasz9dc=;
 b=QO5UWpz5Q7p8HMcH/gpsmOSErTU6TXaPtXtoHMLlKbxVWY4bpjyU9rVccSmPHK2CcuGqFsAhVqL4+KW8QmmlE4okucAWMQpZbI2mmJL2bAkMloaPh1r2eKrFI2nhEvbufOCZ0LqOQ2x2tN3pAUlPR9rmRyL7XVIoas+Hiy970g/MwD6bMPzGhRzsX4mKUbmvULbk4lAZDNor6KGXbgOzsUoYHF1hwW/68cKok9xCTwGERVW40Jc4CScpB7RAqb6Kv1spWNq38IYfZn/RhY8Xonn0VFXI9+uOOxFoMMqMXlI0/BjoY4/s8D3GJyfeag7XEZAZTxquD3vFiObt+/+3DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 11:42:11 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 11:42:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 20:42:06 +0900
Message-Id: <DIYJBADZIEO6.16PWR47AXTG5S@nvidia.com>
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
Subject: Re: [PATCH v12 14/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-15-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-15-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 893f70c1-0339-45a1-cbe2-08dec09bfb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VHKbwKCKwQBKMGpJKpb9XRAZxL7WPfpCYOoHT80ujw8JxbtCnmoCGpv2DchMYbBo/NyoloXFby+l2NYBesVhHAuKLkimfZzvqGuhYGSI4ZZLe8EBgWsYxSCJzj8Dk986obw7TZ9J+vVfIGKjDMPrQ+8Rlhjz3TJcR7d8kq5XT8/KrXXjrfyV7/UBhm+xvzwgVGGREGNqMoLotyMLxMTXdcyRHzeoSpI45TjLLXHX9BTAq3++RImHTGt6nqN136qZlQmXQk5NddXr9dCNZ/sPEZMYbmLgMD3l8tlgaXS9ijEttVI2ajSLmo3TQhNJeIouGufpBdzrKWocJebCDRWD04GiMWNimdgmyhwj78gGZhSmk+rWdoqCmdRv0y6r36qBYe0IgO8wES/I0TfpkLl1tQUJkHtykA6dhPCqt6xS+N0bsStgnLLkvWm7CJHnLigIsb4PQKCWhugPh2brhn2i6MjmSovrrggd8MPpCUinE+vgW7flJcMSEEcPIO1uN5Y/vpwCusAXETVASJRHyEdQCVfg1kfcB4CoceTnOn2qPbXtTuSJ+Cs0qu/DuL/r9kSbc0rW+J89anAlbpXCjHmJW1x3Jg7FuhSU74hkJMwJmCuaqHt6yP95vxMHU1IcZmxNeGS0oqxTvW7x79Vhi23RXsjCVsXJeY96V6DvDz/4tBZwDAy7b/s8rJafagdPw7ZN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG1XMHloVnJ2REJ5TUNBV09wbnI1amhwVXRtWTR1dVFTT2swNmxxK2RtY0Z1?=
 =?utf-8?B?RzNhNU1sQVlXcnFhMlZuN2UzQzhWbjZ6VmVlU1BnZTNBVjE3UkxDUkx6bEd3?=
 =?utf-8?B?NUlIbmtUS2xmL01XYUR4VzFWQWZHL2lNSGFKNjJOcUFCTHdDeThBNXV5T1pa?=
 =?utf-8?B?d3pXczNXcFhCZHlDb1E1L2JwbVJNV2I5WjdPRmVvditWQnc1YTg2MTVwR2lW?=
 =?utf-8?B?Y1gybm1uMVM4MTJSWDdTb2wzZ2ZoRlRGSENGa2szMXo1R2tBakRWWmVXVnFl?=
 =?utf-8?B?VHhueURXK2xiRDZXVTh2dDkwS2tSUmZJSmpBL29md1B5N0Z2ZVBmdjBTWHlN?=
 =?utf-8?B?QktDRVoxL3hBL29ueXAwZWVSY21KMHg0dGNsdXo5NEtyZklyTXo0V1BYL2VI?=
 =?utf-8?B?Um5JZDJCbXVNL0g2czRYVTVhYzFIZ3B0Q2FoMUxkUXQ1U3VkZm96VEJnQm5s?=
 =?utf-8?B?aHFBQW5ERW9RdE9zamJqTEdLSXcrK0NlM3BuRHZ1c1RzNnlINU80dHpqT2VH?=
 =?utf-8?B?bmcrRU1KTEJTWUJLSVRFUnpmWExMb2tZMTlWU1hMcFYxdUpCV1lVMHFqbUtZ?=
 =?utf-8?B?ZElyTytYeFFmVnlKS2tNbW50ZWIzRTFjSmNrcEM1RnNvZ1pMWEYrZE1jTGlv?=
 =?utf-8?B?Sk9weGJVRHJlSkZtbVhpNkdnNE53Si81YlpEVUF5YU51bVZ5NHVMdlFSWDlq?=
 =?utf-8?B?TE1NR09XSm9QUjk2VjBuOWU2ODlhanhkejJjeVJXaHV4Y0VUcURoN1RvUVZG?=
 =?utf-8?B?M0JWNlZVOHVvRzlGMlFpRGtLNlk2cmFxTnNrYUpnZVYzdlorNG5QWEVIZU94?=
 =?utf-8?B?bmI5cUNSaFRMaW9oZ1BUcVU1UHpkZ0MrRDBhbTVJN3VPU3lnUGViZE42WkNS?=
 =?utf-8?B?VzRFVUo3bWxyemtQTkx4cWo1ME1oVFNaTDFqa05JM1BWOXdYbFRWaXlFdUtR?=
 =?utf-8?B?UzEwY09uVGdtRVdwZk8xQjg3Z2FucWNuNkJpaThxSDEwdUNxcmpnSzVIQ3JD?=
 =?utf-8?B?a2JvYW9vM2Z0YXk2OERRaWZtL3VBYWROd2k4SWRoTkpqb2NsZVNObzEzUjE4?=
 =?utf-8?B?ZlJqOGNLa2VqdFNCU2VuaXNBUTBuQUZMTFJJNWs3TFhmYlM5N0V5VGdxaUdW?=
 =?utf-8?B?ZjA3M3hCQU11SFZVLzZmUWxwVkRJY2hYUHhBYzc5VnI0TmVSM2I4azhRbU93?=
 =?utf-8?B?N3RhajZFMUwveGY1YzliWlBPUC9IVGVWY1dJTFI1enJ5RmM2RzNmc3J1dVc0?=
 =?utf-8?B?aVNHL3NzNjkvcmJUZ1dGVENVVzdUb1ZySVFMak11UzlYNmYxM2ZORVdVYllI?=
 =?utf-8?B?MXB5UDZCMEticGtOVFNocThIWDQ1RE8rRHBzLzdaa3VaNEpHODVBMUIvYzhm?=
 =?utf-8?B?czY4NHZWdmRxRVR5RzBOc1hyWTJoUmdnQ2Rka2NGM3AzSGRGRTR5VVRPM1hm?=
 =?utf-8?B?M2toRHRacTNIK0U0cWI1TlFKdVdnbkovbE0wanQwMlBWTFVNRkN3WGxITWV5?=
 =?utf-8?B?dXIwalNkQUxEdTZ3ZHlXRElFUHE0Vko4TXpZSSsxZTlRV2p1enFZQndkWmxW?=
 =?utf-8?B?ckh0ZzM1QnNaZUZjWC9JSWlMTzRlRWxYbkVCUktGa2RDd1FiOXNZaVRIWHVv?=
 =?utf-8?B?QVRZSGZDTTE5Y1dWRlRvQ2tTT0hNYkdvY0FycTBpZE4yUWJIWGdHaHRHTzdF?=
 =?utf-8?B?dWxyRzZ3WmUrWDhuV3BnUnhUUVo2amlPLzJ5TWhmTTY4dmhjOHMyazljd1B2?=
 =?utf-8?B?U2JRRk9oNWdLclVXUDJmVmd4WWFLbmRka0E5OEJXMHl4SXd3dElyRFA4VWV4?=
 =?utf-8?B?bDRwRUNnUWc5NzhlSy91NlpVUVlPblp5cHlnMmQxUDNDOHpUbGcyWExoaW1W?=
 =?utf-8?B?cDBzSVRoQUh0RW9iSUNFOHRleGpCd2VNdFVNT25XL2tLcWxzcHRBZ1MvNUs0?=
 =?utf-8?B?M0plZCtkdzAvYjFPcWw1YWRYTXBSRkJuRm9SbGNQY0I0WGVLRUdzOExwUWl4?=
 =?utf-8?B?dkF5K3F1UXdjZmlrbVk5UjdINll4R3ZqVENyU2FBeTdBQ0tkcEg4MjhDaldz?=
 =?utf-8?B?YXIvNGpmYVBMbTF6c29mc1ZGekpCUTZDNis4K3g5WUxpN2tZeXE3RXdsRW4x?=
 =?utf-8?B?WHdQUXorQ2xYbXZYUDk3VFgwM2Z4Z2pmNHVRMWdmdmNiem42QUsxeWRSYllS?=
 =?utf-8?B?YUsxQUFCd1ZTL2VhdXd0YzFpNzNKV3hjUWdqVnpFMTBWanpFYlRWdGVBU29N?=
 =?utf-8?B?Q1QzRWlIbkd4WEhjcGowOWpLY0J4ekpqVVY2VVN6NWF1bFdCa3BFbU1SLzVi?=
 =?utf-8?B?Zk9Rcm45MldqSmFTQ2JZcTYwd1V3ZjFvNWVVQXdJTEczNGtodDRXWWlzREJ0?=
 =?utf-8?Q?TvXYwWH3XZcNL+otxqNzcqCD+eSr4mXZYY6j7oKc9XAxi?=
X-MS-Exchange-AntiSpam-MessageData-1: KerzfxRt/KmDDQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893f70c1-0339-45a1-cbe2-08dec09bfb6c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:42:10.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoEsEnh2OivsbqrloPLYE2/gH8Txmu54VLOJ79qG+ADDZjTxStTzwbtBHUYN87EADJ/bJUUv7gSeWgCXiIQBEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---


> +impl Falcon<Fsp> {
> +    /// Writes `data` to FSP external memory at byte `offset`.
> +    ///
> +    /// `data` is interpreted as little-endian 32-bit words. Returns `EI=
NVAL`
> +    /// if `offset` or the `data` length is not 4-byte aligned.
> +    #[expect(dead_code)]
> +    fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Re=
sult {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut emem =3D Emem::new(bar);
> +        emem.begin_write(offset as usize)?;
> +        for chunk in data.chunks_exact(4) {
> +            emem.write_next(u32::from_le_bytes([chunk[0], chunk[1], chun=
k[2], chunk[3]]));
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Reads FSP external memory at byte `offset` into `data`.
> +    ///
> +    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL`=
 if
> +    /// `offset` or the `data` length is not 4-byte aligned.
> +    #[expect(dead_code)]
> +    fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) ->=
 Result {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut emem =3D Emem::new(bar);
> +        emem.begin_read(offset as usize)?;
> +        for chunk in data.chunks_exact_mut(4) {
> +            chunk.copy_from_slice(&emem.read_next().to_le_bytes());
> +        }
> +
> +        Ok(())
> +    }
> +}

Both `write_emem` and `read_emem` are only ever called with `offset` as
zero. I checked openrm, and it looks like there aren't ever writes or
reads that don't start at zero. So we could simplify the code by
removing `offset` and starting from zero if we will never use a non-zero
offset (given we have auto-increment). This also lets us remove
`EMEM_MAX_SIZE` and some `Result`s.

> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 2cb1f02f35a4..da7a10c0346a 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -475,6 +475,21 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64=
> {
>      pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
>          7:7     allow_phys_no_ctx =3D> bool;
>      }
> +
> +    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
> +    // These provide the falcon external memory communication interface.
> +    pub(crate) NV_PFALCON_FALCON_EMEM_CTL(u32) @ PFalconBase + 0x00000ac=
0 {
> +        /// EMEM byte offset (must be 4-byte aligned).
> +        23:0    offset;
> +        /// Auto-increment the offset after each write.
> +        24:24   auto_increment_write =3D> bool;
> +        /// Auto-increment the offset after each read.
> +        25:25   auto_increment_read =3D> bool;
> +    }
> +
> +    pub(crate) NV_PFALCON_FALCON_EMEM_DATA(u32) @ PFalconBase + 0x00000a=
c4 {
> +        31:0    data =3D> u32;
> +    }
>  }

In openrm, it looks like this register only has offset from 15:2 rather
than 23:0. Is the full 24 bit offset correct?

Either way, we could make the non-divisible-by-4 case unrepresentable by
making this offset 15:2 (or 23:2) rather than 23:0.
