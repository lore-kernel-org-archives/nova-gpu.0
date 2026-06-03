Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB58330D25
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 05:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463988; cv=fail; b=bJUGc30PqqcWukLQUqxKJ3JccA1PKOKg6QOnjyaPk1JrFvh0FzUs838WMjP8ndnBCz4sRBULJcKy3zEL58z1QGt+vf3enh/H90Va+8Rp3HFz6jvBxswoJCpbIggVdKSQOJsSUKOQLoHRho1cBejkOnSfuFj2W/zNsOLeI8r3Yvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463988; c=relaxed/simple;
	bh=zxobO15lwDd4mQeuTjQJVhxplSwjn969GnELm1waC4o=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=r6vc/QWiL5uMNCBIEcToLDsF1CdJrjzYHv3jkKxmymHeNfHjTGIn60/zvFrIAtPAkVEwEfjB3X79LFCnSjOy9cTAWZ4Cq6eyEbjF3ibmbHgIG7v9fQRZHVNIrOfXpPcLZUtg3VeniwbGqXuCMLg2C6QSIO83006Y7Zm61+zXpSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nBCv4KSQ; arc=fail smtp.client-ip=40.107.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nBCv4KSQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0tcq72UmKQe1+EPJegjROkN5S6NTfU9QmThaOknom72Se220aYaJFA9sswIm0FsfYROJXETQce11geIXYwJ3SbyHzXihrm4KHzYnSWed+mPO90ORIDHBwBhKspDnZxvTzoWLiZa82GjgeOvrJwXcteHdWDFU6W+jFaD4W3lbjZYzjxNr3E8sP1OKG4+K9Bb2kMLuTbM1Dh8i06EYFtErs/UqO2o1n3Bcf1L9MwOSvDPK7xrLgxMng+LtNSRyGHGXosN/5pFi+6rywpwqlNUPYgKsRQTZeAn+sehtp2wUcjKxaubXHm/9VEV2Uzzd4LkMylklYNNiRbKnk5Vt8sOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIYwaSavpxHFRbFC51+4uRJJ9sE/zsKonkuH+bCdsHw=;
 b=Uo9ZanSVhZ+BWy7gxDiFZ71LeowGtN0k0H/s664rGLSPkLfgBsXk6UcYtZd7Mpi2O7yNxnPbMgEO7iwtCpvPNn49KijSJG+WMyZE+Y43xeIdPwc4TuAmuFcwRl+1X2j4e0ELMJe+VM05hS0fWkNTLonPB0mCZPpXTOKVFNXP1gp6IMDBrywbfoFdaL2CQ0LI1YdBLSfmxWHuDxKFwvbtLH+5dLAT/nW6lNgzxoqQlS8F5eunb+hBZXAt+TBgxqvdc09lI2iK84fBPwTBiRgTdV8J5OclzyG4JjUQnSjSqbu1A+LN2GDx+XatiSddrP6st1dDoUTd5dwfR0DVMIIOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIYwaSavpxHFRbFC51+4uRJJ9sE/zsKonkuH+bCdsHw=;
 b=nBCv4KSQ4NAbrg/uccmeYJCVW0zKRzLaxGKXTboLY44adR+kEAiUx2QZ328JpKnvA1JYOmp7A/oEm8og14s7gL0ltqjS0On28PY0JB6738N0Zn9srloJGE2+LMpK8LOG/BqBgvsX34pJWItaVTIHIlzF4zrVeHxSq+tkAhliv+APBRjledzsL1x2qZYf22rXJumMWo4HbcdO8k6tH/fRqV1PKLVRnGfyEGQ6GK5F0jPlnqhzvv8inVfGYWmtYfRERimMTH1wSw3XqT+nZpOpJs1q5KZA629nO2Diz5G6Y0mCzwpQdJ1YjNKGESSVGuowM2wTL4quu2G2RKR/xca4Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 05:19:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 05:19:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 14:19:35 +0900
Message-Id: <DIZ5SYLSQ358.1SIQT8367GRRL@nvidia.com>
Subject: Re: [PATCH v12 19/22] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-20-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-20-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3P301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1cf0a5-d0d3-435c-f034-08dec12fb5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|3023799007|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Eh1JzzJV9bPtR6CGkpkMnIU56bQ0ToJdih/8WoL9Y4FU4cbr9Fkr1TU+KE2Xi8iVvIbZlELbCPgXMn668w5GwFpzeDyembNWNd5HK7MMUqPWUf8+J86ARz3cvoxqCNfDCOGaFhE8BKYi77dTa/FYHxbcnGLZJsDA4YC/EzBnfeXq7iPBSVtx0amoHKNR52vQOPQZlLnrcMtC+jjvSeP2H9PRGA2aIIQUkpeOh+OPpUxPDJLqFFpEgIB3jUp8xR6/BIQ/tpawVeTue7vtOWzu2Z8jeuRm+0ezwHgTMG9QV8ITAvgXlfvLU1HtBBf/b19DtINf+jmP+GU4fX9x/N9RRrvRuCBSBoUTC5oXZq4rnn765nf0Zn1deTKQFh4JFPUG7PHb2nzmlHGirFITE8M4ib88R+9eUsX00/RMRjiIVN/1/0EKlJ9djYkvCNH1PsEO8UK0GOjsesKDBSMqrR3mg2Oq/p0UyX6NUp6ugkWIip2nDto1Um0jDRB44XZFCfcWbjabhdQVk1VguainYl8C4XKNehqjKwzI+4m4K5kQkuZOdzPBP+zIcAkJULNufj+YWF5mjryo0IIN3NdFahxWjikVAa0iyzOmbhWVU1MifIQQLlmhsdUC9j6LqU0XcDrTg6SiwGefbcrQSjAk/6DKQMQvCokywTOzA3FqiaOVz2CDOTK71awlHAoAim+ulriZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1AxQ2kzS3FjSEp5Q0xaUmlyZGpiRG9LRlQxRzZmRnlsSTBsUmMxclZYTVRx?=
 =?utf-8?B?dWFnaVB1ZGtoOWtkaTg0YUNMVUI2bDZ3RWl3amVxRFZNSHNFelFMQW5aWE9D?=
 =?utf-8?B?SFFUbHFFblo2VXZ3VjlCVWI4YW41RWJoeVByZTRZYlhJRDRjVVkzbVE3QVFp?=
 =?utf-8?B?UW1MNWxtRXU0ejB4MXVvMFY3WGh3eUExcTZxOFFMRjhYYWU1TGQxZUIvQzVN?=
 =?utf-8?B?Mzc3SVNtaWhGaUNyaHNOM3EyNkd1N0o2ME8zRjY0UXgxSE9MQXlOb2k1WG9p?=
 =?utf-8?B?RFZHR1l1S1BXN3N4a0JyaDZ4Vzc3UC9ZQ2pSUWo2cTFNeW9pTWdqalFQYXZ3?=
 =?utf-8?B?cnhlWHNaTEllSGtIUEZxejZLSC85eFhLakdwRVFvbktIL3VieERhcEJOOXRr?=
 =?utf-8?B?QlN6VldTZDU4NmYzR3pRb2RhQk1KTWRKWitPc09jRWUyMnpmT000SW1SVllz?=
 =?utf-8?B?VFRNUlBjYnZmdDliMEl3WGRsQ2NTaWg5VWVZRHA4Y1lqWUcwaWFmZm9rak5L?=
 =?utf-8?B?NjZtQXNXUE10d3BKWm8zL3p1c3hINHdjc1p4UXVJd0cyTkxRR2FIWDhESTV3?=
 =?utf-8?B?bWdEMTREMTVUWndZMXl0L2lkR3oyNUhEZXdyMW5qK1lvYlhQNkVkVWx6VTln?=
 =?utf-8?B?Wm9yL0hJT2RBcjZxc2R1ZnVRQTJZRmNCVS9xdzhxRlFEK0t5dFZtNmE4ckhG?=
 =?utf-8?B?dGY3SDdWZ3VPYmhscENtVWlmN2ZXYlJQU2dtekxJYmlzcDdFeGwzOE55eHlG?=
 =?utf-8?B?bkRkYkREVW5Gd3I1dzIxSkZjcS91cFNJelUvaU55YlBsNGZZOUdzWXdaWXVK?=
 =?utf-8?B?aHY5L09NTkdkWnAzdHFUQWlYMjhJb1lEN2gvQ1BjNm1GeFpwcTR1TlNRazI0?=
 =?utf-8?B?amE2bStQc25ZVjNZdSt6VTByM3ZUNEVYQ0hKeDFYNmVBUHVVeDNHbDZ6ZUhr?=
 =?utf-8?B?eHhGcVlyQUFOenNXWWxMOGVJU0xMeWFtMWdjZmdlOUZZS1FBVUxLLzlBbFZj?=
 =?utf-8?B?K1BUcHZyN3UrR050Qk94UTJLeWo3NFVYRTRaRzBEcUV5WlVxaVRlS3pXUzB4?=
 =?utf-8?B?ZFArcVNUZ1NtRmxOcFNsMzRDTTc5aFMwYTRQM204ZXc0blZwbXJaTU1TQ05r?=
 =?utf-8?B?MUJDOGVkcm1DaGZlRDE4NklHRmpVZDljRU1qakdhd1Y2TS9rMkMrTSszS2o2?=
 =?utf-8?B?SmpzOVFKdmRwK2hxQTVwMm9NUnZ4R25xMDBvVklvNmplbXJZYWlKcld3NEhX?=
 =?utf-8?B?RTNabEF3eDU0UHdUMFh4RkwxRmNYRndHaDNlalc2RE0zVHhLU0lqdDV5anFM?=
 =?utf-8?B?QmFTVmxLMUo2RVV1VmxPM2UyT2h6ZHlJeSsxWnliU1oxVk5EYktvR1hnTXFU?=
 =?utf-8?B?OHJxdXVDZjJGcHl0Vm13aDl3YlkzcThKRTJsQjJJYjZqTDZ6dXVBRjg2SEhm?=
 =?utf-8?B?VEpycTBIRzdLNDZBQklZUjNHc3k5RFc2U1FLYWduZFROcWRPNjF1aXFKYXNB?=
 =?utf-8?B?WkVHRys5NlNDWHhRSnFpUGQ2blZyOUtGQkRSRnB0NWxsUUFIdThySFRFOXky?=
 =?utf-8?B?QlBidVZEZzBJRjM1SG1zQW8va3JpVzFtOUEvNGx3cVIrVjBqTkZzWGFRL0V4?=
 =?utf-8?B?ak5zRmxJaFBnU1hFOFZ0bExyOTRkVzRlRlVNMUZYdG1Pemt4ZFJIVE9Cbng4?=
 =?utf-8?B?WFpwdUNEUHhvZU5UK1FyM1BsYUlyUmdISU1YQU4ybXZCWHArRlhVODNGYnA3?=
 =?utf-8?B?RDZTZmpNakFoMCtKZVdkckJMQkliWjk2Rms4SldNVzh6L3ZNOExHanZlQVIz?=
 =?utf-8?B?ZVo3KzBGMk00aFNGTXF6Y0UxbllKc3NsYjZJdTJLQ2tVb1ZObXBHMUdlZzN5?=
 =?utf-8?B?N2tZbmxEL25xNWkwVnI5eUZlMkZYSHRlT0sydHg1a3MrRU1nUkxnd2ZXRmxO?=
 =?utf-8?B?RzZqZ3owNXRvdzVoWERZOVl2ck1BYnozdjZFenRJOG9lUTREbDNNTW9kMHA0?=
 =?utf-8?B?cDcyZGNvbHJsM09objIvMUFBWDF1Y21Jbk9PZ256QldiT1FGeHlNN05ndU1M?=
 =?utf-8?B?bmdjR1VLZ0thQmcwZVBhbjZUUlVLQWJkNzJUQ1RGdWhpTzJXUVBDNWRKZlFj?=
 =?utf-8?B?SUdIZWpiZUYrQit6c2F5QzJtRC9hbTNkamd5Yk9pSTYybUNlcEd3eTk0c3hR?=
 =?utf-8?B?VnJzM0VDR1Bsd1owNjJHYmlRcVlNK3I3NlpjT1E1RXdKNTlZWTl5WVI2dk9Z?=
 =?utf-8?B?TW1uN0ovcXFBS1ltVkJtYTFZMlUva1FZekx2TkNENEpqMnNIbzh3RnBEdFcx?=
 =?utf-8?B?UzMrZWgzM24rVVFpelh4bHlSRW5ncEpiRVFTS3YxS2dsVitmWlNuUlZxb3N3?=
 =?utf-8?Q?91loVuu+C0XzZlOIzJfTkqkJO/5BY3d7fxirwpIHBcC4G?=
X-MS-Exchange-AntiSpam-MessageData-1: I40QjEnD6eipvg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1cf0a5-d0d3-435c-f034-08dec12fb5cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:19:39.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKkRSqpJjfMVadnu6Hd1UtmPHkUzoUpOjy0vtCcPy4HpfOv7FJJDeAbd0yXa41QxRGHfS7NbvCuOAQplBQb2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Build and send the Chain of Trust message to FSP, bundling the
> DMA-coherent boot parameters that FSP reads at boot time.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs         |   2 -
>  drivers/gpu/nova-core/fsp.rs                  | 140 +++++++++++++++++-
>  drivers/gpu/nova-core/fsp/hal.rs              |   1 -
>  drivers/gpu/nova-core/gsp.rs                  |   1 +
>  drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs        |  23 ++-
>  drivers/gpu/nova-core/mctp.rs                 |   2 -
>  8 files changed, 302 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index db61905eac9d..938aa3a3bad5 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
> =20
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
> -    #[expect(dead_code)]
>      pub(crate) fmc_image: Coherent<[u8]>,
>      /// FMC firmware signatures.
> -    #[expect(dead_code)]
>      pub(crate) fmc_sigs: KBox<FmcSignatures>,
>  }
> =20
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 67cf83aba83c..352ef7683cf2 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -9,8 +9,14 @@
> =20
>  use kernel::{
>      device,
> +    dma::Coherent,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +    sizes::SZ_2M,
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -24,8 +30,13 @@
>          fsp::Fsp as FspEngine,
>          Falcon, //
>      },
> -    firmware::fsp::FspFirmware,
> +    fb::FbLayout,
> +    firmware::fsp::{
> +        FmcSignatures,
> +        FspFirmware, //
> +    },
>      gpu::Chipset,
> +    gsp::GspFmcBootParams,
>      mctp::{
>          MctpHeader,
>          NvdmHeader,
> @@ -49,6 +60,35 @@ struct NvdmPayloadCommandResponse {
>      error_code: u32,
>  }
> =20
> +/// NVDM (NVIDIA Device Management) CoT (Chain of Trust) payload, the ma=
in
> +/// message body sent to FSP for Chain of Trust boot.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadCot {
> +    version: u16,
> +    size: u16,
> +    gsp_fmc_sysmem_offset: u64,
> +    frts_sysmem_offset: u64,
> +    frts_sysmem_size: u32,
> +    frts_vidmem_offset: u64,
> +    frts_vidmem_size: u32,
> +    sigs: FmcSignatures,
> +    gsp_boot_args_sysmem_offset: u64,
> +}
> +
> +/// Complete FSP message structure with MCTP and NVDM headers.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct FspMessage {
> +    mctp_header: MctpHeader,
> +    nvdm_header: NvdmHeader,
> +    cot: NvdmPayloadCot,
> +}
> +
> +// SAFETY: `FspMessage` is `#[repr(C, packed)]` with no padding, so all =
of its
> +// bytes are initialized.
> +unsafe impl AsBytes for FspMessage {}
> +
>  /// Complete FSP response structure with MCTP and NVDM headers.
>  #[repr(C, packed)]
>  #[derive(Clone, Copy)]
> @@ -70,6 +110,44 @@ pub(crate) trait MessageToFsp: AsBytes {
>      const NVDM_TYPE: u32;

This should probably be a `NvdmType`.

>  }
> =20
> +impl MessageToFsp for FspMessage {
> +    const NVDM_TYPE: u32 =3D NvdmType::Cot as u32;
> +}
> +
> +/// Bundled arguments for FMC boot via FSP Chain of Trust.
> +pub(crate) struct FmcBootArgs {
> +    chipset: Chipset,
> +    fmc_boot_params: Coherent<GspFmcBootParams>,
> +    resume: bool,
> +}
> +
> +impl FmcBootArgs {
> +    /// Builds FMC boot arguments, allocating the DMA-coherent boot para=
meter
> +    /// structure that FSP will read.
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        wpr_meta_addr: u64,
> +        libos_addr: u64,
> +        resume: bool,
> +    ) -> Result<Self> {
> +        let init =3D GspFmcBootParams::new(wpr_meta_addr, libos_addr);
> +
> +        Ok(Self {
> +            chipset,
> +            fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP=
_KERNEL, init)?,
> +            resume,
> +        })
> +    }
> +
> +    /// DMA address of the FMC boot parameters, needed after boot for lo=
ckdown
> +    /// release polling.
> +    #[expect(dead_code)]
> +    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
> +        self.fmc_boot_params.dma_handle()
> +    }
> +}
> +
>  /// FSP interface for Hopper/Blackwell GPUs.
>  ///
>  /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only return=
s once FSP secure boot
> @@ -77,7 +155,6 @@ pub(crate) trait MessageToFsp: AsBytes {
>  /// Chain of Trust boot.
>  pub(crate) struct Fsp {
>      falcon: Falcon<FspEngine>,
> -    #[expect(dead_code)]
>      fsp_fw: FspFirmware,
>  }
> =20
> @@ -113,8 +190,65 @@ pub(crate) fn wait_secure_boot(
>          Ok(Fsp { falcon, fsp_fw })
>      }
> =20
> +    /// Boots GSP FMC via FSP Chain of Trust.
> +    ///
> +    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], =
sends it
> +    /// to FSP, and waits for the response.
> +    pub(crate) fn boot_fmc(
> +        &mut self,
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        fb_layout: &FbLayout,
> +        args: &FmcBootArgs,
> +    ) -> Result {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipse=
t);
> +
> +        let fmc_addr =3D self.fsp_fw.fmc_image.dma_handle();
> +        let fmc_boot_params_addr =3D args.fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !args.resume {
> +            let frts_reserved_size =3D fb_layout.heap.len() + u64::from(=
fb_layout.pmu_reserved_size);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<SZ_2M>())
> +                .ok_or(EINVAL)?
> +        } else {
> +            0
> +        };
> +        let frts_size: u32 =3D if !args.resume {
> +            fb_layout.frts.len().try_into()?
> +        } else {
> +            0
> +        };
> +
> +        let msg =3D KBox::new(
> +            FspMessage {

We have the same problem as the FSP signatures, this will result in the
`FspMessage` (868 bytes) being created on the stack before being moved
into the `KBox`. And because `FspMessage` is `packed` we cannot use `init!`=
...

So I guess the only way for now will be to zero-init it and initialize
the fields =C3=A0 la C using `chain`. Let me do that in a constructor.

> +                mctp_header: MctpHeader::single_packet(),
> +                nvdm_header: NvdmHeader::new(NvdmType::Cot),
> +                cot: NvdmPayloadCot {
> +                    version: hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?=
.cot_version(),
> +                    size: u16::try_from(core::mem::size_of::<NvdmPayload=
Cot>())
> +                        .map_err(|_| EINVAL)?,

This can be:

    size: num::usize_into_u16::<{ core::mem::size_of::<NvdmPayloadCot>() }>=
(),

to infer the value at build time and avoid the runtime error check.
