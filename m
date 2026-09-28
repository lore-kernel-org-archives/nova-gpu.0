Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCFE4B95CA
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597179; cv=fail; b=bt/UdI2cqFKXlRvaD3kLe5p+cGvQwvKYjC9uZoGC2I+2Qp3rUyThX4b33KzHBwJ27xus+Ka/4TjCtdpWO5TLyJPeq9+rZO4XiSbJAY8MFwbQjQLpg5ab4zKo5DpGAhGyKJ3+d1S7enX0EsrrXA5Pcfu10h1PpuBI5wmf6oY2wkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597179; c=relaxed/simple;
	bh=r3ernBvs6aAwS00lBjrfJSLeifoxdNm9vM9xH3/kUM4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=NmVcB2n6bCKShYs2soshR4r0q1S/thN9/9pJgIX7koI/gyucgqaxNtbVwZCObbEt3ct7RBPfAhghgfmaiAxBBtMCXoXXbSS2jzaYMYoOlR19zpC3Sksd4rj32bxv/yh6HX7Shlgikd1bvK27Hea9j7vOwKf46lc+dMOGGtlfQjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JOayj5HD; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JOayj5HD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRaqWpqDjunoEJg8HDl+9gTAKQi0Zh/yuHyL0F+wYHqjlV/VKUgrfChXPr+1Ft42cvXGQNJN39TFA1mzGx5N8Kk6qAr4djNEGwTr7QBDjJE8kfvLP0rNWnGTemKNXNukdKLGFMaR2Sd8eeFExaklwMSltm6TdFI9Ff+p/nWq9d4eER2KruJpHQtZhPMFEEJK5vjeRkNePXgz9ynC/m0CdZbe2sykKgpqhofHvcCA0SlXfhqrm+DN1wlDqVm4stNxbjNOB1rSMhFew08Ij+weh/CFzt+9UQaj3MduWvdanKBF9rkjzJWHzp5Gp4u8jo5jLAPD7As03kKJ8ld/x9Nrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivCXqtXl21y1iMZPtlXc8t8+mxy0aGroanUMkbrM8bE=;
 b=rf187JexaAZ2OCnRaQvqZ4mEmyWTomH6rOLnziqXRJIZyRC94SlGBMEOQbX0pQjxVDbzu30G5uSv+fQYFf/77TMgomq3ODZALhu++3aVs+N/kVVyfj67k5+spGycTolYWgWMTIyu4QBHKlXXe89wYFUXgP0BWpLrp9tIvCsmvdLTH9iaAbSC5Ch8M8yhKRD41wnLjHlkvFfX6z/F3O7oS9076rNuJ54fAzSZiBZ1bgeZKtfHQhzUOAzkaHriUWm2WU1YisOyyWtNb0HjJt23DeT/mgxBzC7d2R/AwxLQbiD5K2QhN4gjZOLNYdabHoH6oJ5X6YsczWKRe14T/wOlaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivCXqtXl21y1iMZPtlXc8t8+mxy0aGroanUMkbrM8bE=;
 b=JOayj5HDjUd/jeDIuLjpDCAviWdgD+pGz4vIklCaPAeBWyy8yZY/WywkARffJHNOilorc7v+5I5Wfk7gdmUliCqbMFAcqRjZvnCK1XjCM91ANuHc0weU0jxt9WLw1NkbU7IXZ6xh2zHoBCmOsezHYfUWSjX+nTHlTLefdlT6M+InXxtKIFwHMACIJWsE3cxK0MRrNfLspK9AQrJ6gZBMPAhHsi6AsX48CrcBLkiXrTGIDxkbm9F/QMHCAzDh8iZieIa0wEIg1K2HW3d8yMyeOfWdO9jwh54ckD8Xfg0NHd3Wg/WNITulB2ky6NWA2FWQXGD9SnpTs2vRv31BNvDfBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 12:06:12 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:06:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 21:06:09 +0900
Message-Id: <DLQXPZPJY23T.ZFEU6BCMHDSG@nvidia.com>
Subject: Re: [PATCH v3 13/33] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
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
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-14-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-14-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS4PR12MB999075:EE_
X-MS-Office365-Filtering-Correlation-Id: 513bcd89-e965-4a86-0e0a-08df1d58e386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|1800799024|376014|366016|10067099003|56012099006|11063799006|3023799007|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	54GfZLGLIU1G1gSL1QA3HI0IMXaEcMNYk6A3Ez0AdS+o8c23x+4OJP8nWb3kq4FCTrYpShUD+kW8u+w/MKaQMoXwPEwCcEVrj+uxJyBv4N2WwSe8iSRKFJeuVpjxs6uB/tbxT/fq2qb4OZeW6CT2yHR0J++ZNfwFXvDzMRe9TxlK9T+yQqKiEqrp9HqaRKhrDT3CHYxZPCBsQSQzOeAMLkqRawe1O/VGXj36r3VFmzJ27Ed/VBDFAxQ9mQaCY+bRRZWlyByUNmbxgZvUiC+Sg7kiDTnsWXOIwHMIny9T6VBnVLLi9r/6liWurZBjYqofD6dRNIuAmGXCEZKJaYhCwy/vF1n0cKLRlb18KZztHezit2PFt9nss266JCYVxLgjyKCtVuNdTfmvSutfkrSqoCjyC49D0PlnBlNxL/Nv+PsmjSixDhwAAsZajIU1Cpvx0nbIqOr0CYunVYACSm4xkLCtCXMDEOTYyIucc3LH8XscDStqvQUV+ZnbzUbnymCQUhLwykqmPbYfqmZ+Ipx+UUNBhTUMP7UVlfgcv6oN1ZoQlV8mXMqS+Dxq85tK75vvyL7ibbBKOpW9n0DXokT8trCHksiYT0zb+DPf0VB/qhJDTQGIO+1ATiFnRZvoASzPcBz0tPtnjpLYiRLlj9AEQfS26tU+LsZtkMfeBT1M/Kw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTJMRTVKcGNSRVNoM0tQL29Md0ZaYkRqbWgxQkpXd3V3VDRrTCtma3lPM1Rp?=
 =?utf-8?B?ZlMvTVhtVzA1L1lSb1hFelFKQTMrMFowQUYwWXAweDZPemY4MHNBRE5vaXE2?=
 =?utf-8?B?ZVFLSmVnWk5IVC85ZmlKYXFQeDBQeG5HZU5Wbm9OMTRrbjhzM0ZFemxTMHlL?=
 =?utf-8?B?cmlxZFZyMGZwUzc4RDJ6SkJoY2FqMmdidFpBbGxsdytTa1NpaXlMQ3RMKzZq?=
 =?utf-8?B?OGxuRFdBd1RLa3JMVTByQUxGL1R2YmlCMDFaU2lRMEFPbVc0eVNsZE1MV2VJ?=
 =?utf-8?B?TkN5UUZkVVlObFo4eGFnTE5Vdk53aHhyVWxwOHhCRXM4cUdMcXc1YUh3VWNE?=
 =?utf-8?B?bWhybFdEWmJRRWEyZTdXeURCc3FCUGpEb2w0WE82QlhKUUV5ZVQ3dWNDN3hT?=
 =?utf-8?B?d0ZuVVk5TlhEZ0RkYkZhbU0rbnFQZXpQOUR4VDdwUlVNaVM0RlVRY0xMZUQz?=
 =?utf-8?B?MFZoNWFqY2VvWXBNS09sZVF3NGgrRFc3Z0Nmd2t3anNMZUQ5VDBCYTJrUE1Q?=
 =?utf-8?B?MDhaVmNXcnJvQnA2b0xvbmhmSzlXblM3TzhmeWkxbzdwV0NWZFg5MElzdlJZ?=
 =?utf-8?B?Mlc2NHRSaDc2NktHRXVqQTV4MWxvV003aUR3dHlVYStKRDl2VEZGY3RST0FZ?=
 =?utf-8?B?TWxmbHBST3BML2l3NGgyeVUwYURGQ2hZc01XQUt3Y0JVdWdhdGxoMmJtejJ6?=
 =?utf-8?B?WVJkN2ptQlRmKzBwVlhhVXAwZFhaMlp3azRYR0xtTyt4Wk54OXBCMnlKYVkv?=
 =?utf-8?B?bmR2cGdPNFpnbzNBTGJ6c3dlRVRpb3JWYkdPNHJJQTY4WTlxdkZwZnVrcmkr?=
 =?utf-8?B?bjh2NHJYSlNSeDhpemUrTFZMcDZqWk0rYkgyUVFGQXBBOUxmcU9QQXZseUk4?=
 =?utf-8?B?UGN0ZVlZYXEveXdtbk13WVg0QWNySGQ5blkyallzTk8vMGR1aTFBQy8yVUJr?=
 =?utf-8?B?S2RGYWRPSzgrc1FrN3NIVlVJdkV0UVgxVlVZR2JDRWRXTzBMS0d3UUlUSjRz?=
 =?utf-8?B?R05vRTdFODJsQkZiU2taZy9sdllWSnBWWG5KVkhJVjF3SWtGTHM5UUd2TDZl?=
 =?utf-8?B?d2lQZDZPeW9VdnFPR1FzOTc1RmpIT2c5NVErbDZHVWVhYm9VTVpOQzRqdkhT?=
 =?utf-8?B?OERnSlpRUlJ3SzNCSjJ2ZFFhODFPMXdCNWZlV2c0MDROUHRYV2tmYmFQRUtu?=
 =?utf-8?B?dHhsbXRneS90NEt4clQwMitOSEJ1VW5raERuNEJHOUM1anhxNEErVVdKWUZQ?=
 =?utf-8?B?U28rNWVXWWg2NzBOTUNpTGhsRUJTZWU1M0RUdDN4anlucGVwZjBCQTdxZnU3?=
 =?utf-8?B?dEFkU0JPbXQrZGQ0WWxSeldRdFNnZ1RyWFA4bzF3Wi95THNpZ0dIUVc2TUht?=
 =?utf-8?B?cDNJeER6MXBxWlV3RDhDWXlPN3FBZnBUTXVab3hXY1czUEZuaTZ2bXpKV1Rp?=
 =?utf-8?B?M1N2SkgyR0dydW0xc3gyTGZ4NzdSZkFDVU1uZmVkVGlYY0VhV0ZzM1NHTHkv?=
 =?utf-8?B?KzFob1FpUmM0eityWUNNQVEzVWFQM0xPSXZFMmhjaDJremJmRkhXZHU0K2d3?=
 =?utf-8?B?eVBsTXk5NzBOTkFzZlJlc3VCN1FTN1FSQ3R1SWxWTkR0dXhWaDB3RjlUdUEv?=
 =?utf-8?B?ZUN1MlhFVHlMdnoyRTBQZ3ozd0E2ekgzMDRveGlYbDFCVmFtM1Y4RmdueGc3?=
 =?utf-8?B?M3JnSExyZkd0VXQ0dnE5Qkc1TXNXZXJnT1VvV3ArUVZTNi9EWmxvTk9Vc2Mr?=
 =?utf-8?B?dDNUNnMxMUx3TGhHV3JHMEwzdUxRb21IeWxMMkI2TUNpTlFCU05Xakp2QW1E?=
 =?utf-8?B?eDVhZStiNStVOEN5R2ppSjJ3RkVWT2t1d0ptekdvZEVvNktCY1NraDlWUnZV?=
 =?utf-8?B?dEkwQkZsaFpxNG9kc3ZkaTVmN2JJOVNrekpZK2NYZGlwTXM1MmlZdlUyOC90?=
 =?utf-8?B?Y05vakROaXR5cmwySklySEFROE44WHRocEhNendzS0tLZTVCTW1UaEh0dGR4?=
 =?utf-8?B?Y1lZbVlHaGVhdEpsUXVSQmZEYlBMTmZjYmpvOUF3bWY2cTEwbHpmZE5DVlcy?=
 =?utf-8?B?N1ZuQitDK0UwQ05lRkNmbjk2VEJEMUwzQmtvV1lqRGl5YzZqajVlUm1HWFVB?=
 =?utf-8?B?WDBPTlBuZ1Z5OWJqSWd6SEU2cDIwbVR0V01zaVhVSytlNnpYYlA3dDFqUzBG?=
 =?utf-8?B?SWlXQTdhUnJ2QkIvYWtNUnlubmwyV0ZlMkF1NlE1VFNCNktwVjZKUkNlL2ll?=
 =?utf-8?B?REh4SjRxQmFMMUlxUTJZZEtFemhDKzJ1YldmcEJPM01YamppZDM5TC83dXBT?=
 =?utf-8?B?eXdQeFVJRUtwcndCaElKRmF3dXhxZ01saEQzUDJZMzQ5dzBBa1EvTDM5MGYx?=
 =?utf-8?Q?b/StO485AiGL2RuYzHPk+EqF2WBx36uEAUGH2CltKc4s4?=
X-MS-Exchange-AntiSpam-MessageData-1: s2Ygvr6SDTa4sQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513bcd89-e965-4a86-0e0a-08df1d58e386
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:06:12.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRi/9hKNqnLGKPxG7Kt8sVvzg4MaERmZlTcpO9E3GIwacdb/F+kcpRcFPNyx23jhBK+djdsj8w6xW5XW/w0YSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999075

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> The generic falcon bootloader is a small program that loads a larger
> image into a falcon. The r000 boot protocol needs it to run an image
> that GSP-RM names in a load-and-execute event during boot.
>
> Nova-core used the bootloader only to load FWSEC, so the bootloader code
> was part of the FWSEC code, and there was no way to run it on another
> image.
>
> Move the bootloader into its own type, which FWSEC then uses.
>
> Place the bootloader at the top of the falcon's IMEM, using the IMEM
> size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.
>
> Assisted-by: LLM
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This is a very good change to have even without the switch to r000 as it
properly isolates the generic bootloader code. But this change alone is
not the entire story: patch 16 is another part of it, and so are the
bits of patch 17 that touch `fwsec/bootloader.rs` and
`gen_bootloader.rs`. If you extract the relevant bits of patch 17 into a
new patch then you have 3 commits that read perfectly once they are
put in a sequence (i.e. the current patches 14 and 15 should be moved
right after the extracted part of patch 17).

I've tried squashing these 3 patches into a single one and even that
looks pretty decent with `--color-moved`, but it's also fine to keep
3 separate patches if you prefer.

Those patches also still seem to have some doccomment churn, please
confirm whether changing the documentation is actually warranted.

Just one tiny nit on this patch below.

<...>
> +impl GenericBootloader {
> +    /// Loads the generic bootloader image for `chipset`, placed in the =
last blocks of an IMEM of
> +    /// `imem_size` bytes.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if a required TLV field is absent or the image does n=
ot fit in IMEM.
> +    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        imem_size: usize,
> +    ) -> Result<Self> {
> +        let fw =3D request_tlv(dev, chipset, "gen_bootloader")?;
> +        let tlv =3D Tlv::new(fw.data())?;
> +        dev_dbg!(
> +            dev,
> +            "loaded generic bootloader firmware v{}\n",
> +            tlv.get_string(b"VERS")?
> +        );
> +
> +        let ucode =3D {
> +            let blob =3D tlv.get_bytes(b"BLOB")?;
> +            let code_size =3D usize::from_safe_cast(tlv.get_u32(b"CDSZ")=
?);
> +            let code =3D blob.get(..code_size).ok_or(EINVAL)?;
> +            let aligned_code_size =3D code_size
> +                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT=
 }>())
> +                .ok_or(EINVAL)?;
> +
> +            let mut ucode =3D KVec::with_capacity(aligned_code_size, GFP=
_KERNEL)?;
> +            ucode.extend_from_slice(code, GFP_KERNEL)?;
> +            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
> +
> +            ucode
> +        };
> +
> +        // The top of IMEM, above the blocks that the bootloader loads t=
he image into.
> +        let imem_dst_start =3D imem_size.checked_sub(ucode.len()).ok_or(=
EINVAL)?;
> +
> +        Ok(Self {
> +            ucode,
> +            imem_dst_start: u16::try_from(imem_dst_start)?,
> +            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
> +        })
> +    }
> +
> +    pub(crate) fn boot_addr(&self) -> u32 {

Let's give a short documentation to this new method.
