Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414053A75A3
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387908; cv=fail; b=Kyi9UkgWRsfLhWNCRiNlliUt3OrgWq/6+Ub/21TF/VpvTyZHmer5X6a53XiQQTtM1Rm5ls+cXPKbtzECUrpJcz5dH2kLicxQzfXzflSWp6Fp+i1hiuQcEVIqpykGXAl3vzrxfOriDYGcUu7UUohHnNU16oX9H8J0lDeRdmf38Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387908; c=relaxed/simple;
	bh=+vasdZPTxlg8v3ZQfYPfzqnsVcmnPDtGSK8mYPys5c4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Rac52PBzmLw82RmU8mKI601BTXir7AXUmfH2UmLFHOukwzch2GfJvGXkUr8KpDwwW3AYw1d1XcNXfQkAJqWSY9ssvr1+6Eo5Mabo6fgGiMBUrbjFBdtKEXZYGRpzK0459P1CbHPVXxPOJbANYIHoHfms65S3i21Mk71xldDYOGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BUDz9OLR; arc=fail smtp.client-ip=52.101.57.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BUDz9OLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgAxZ0U8A3U9Bg66zHYaBUKpj1W0SNlOJ8QaEfuSm4lDsGQhwEJcpB9kmANCPgenGbBe7oh2CEjiqMj23nbOlljEUvZjSwOqjxfijaDUyrji6njN52C39Bb3sk2yFdapbX6nQiXRbwEyTyDWVNczaM15nnPcZoBf8Gag93PMuBohsG45/0gCI0i1bkqLejRvczArddm9rYjM7yF6nWAhIjN3xQVCWA1RheWrIuDuaR9n02TLGzZOg00Mq1Ag/YmrIATQAMZdKkHYkQsAiJR4hmxwVyphYw/7E0nmWzB1vu72QB3YMZME6vSFQ+KIVyrTXHSlZjCmvPOLXY7OqjUA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMbkzxWPV3v3+9VhJz7ei2+JW/HFOEYKasBuMu0ttVc=;
 b=B8SF9ApCShxXD/JLA3I0A6etVtJbw8ifFUnFrK6pGMMkFxr6SbEWAITz8MQw1VoM4xrgmUv18pFNNRj8TqeO428jgvjNcQbuEMdCzAlEMHyin95mjUWeqEygBMNiIkkJpKnOIEzbnEXP4m0UDRCVVyVfHWrHT4fD/z/Ga+n1WrglFnFL0BLTTmccqVO522XtlIarcktXpNlOXyXxCEHxnA1BmPlyiUntwU60xquye9q+MPrwILj3n4hOuDHK/ign1p8PN/Cf/BKKblbpNRVCoHKSmC5cDK68O3Me6GPWmyxD+1mz1QRJZEALhRLUBhaiO76we7pDPFfgM0IHfDRpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMbkzxWPV3v3+9VhJz7ei2+JW/HFOEYKasBuMu0ttVc=;
 b=BUDz9OLRju9QXfvtgHgwZ+trmFeKmehXVtnxKuwa3kH1Iv4plaUqe1eKvhd/sAetUJ/XtBoHgFUpdfCnp0LtVD61qU0RNF5j+xA4ZnbTNWsQjr1loLkWCqezcbTniKaFVnOPdunYc4aCrssXi+RQ5u1F0Jd/G6A0HFnHZfRg/uy72lzGd+RPt7gIOUT+XQfB+UnorYOINZZW2aFJ1u3gEhFlo5jkgM6dNWwyyhSnJ58lUE8xABmpfM3RxUdaJuQ1T0sVqJjDyLz9pZVAXfhqV1KYzwg1rcX3snQOntNd5VFKe8Mce+MZ1S3zz23w4AECTTP7hvVnNK0UA+/U/y9phg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 08:11:43 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 08:11:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:11:39 +0900
Message-Id: <DIYEU5PHRGGB.3Q4G9ZMCITCFT@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
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
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-14-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-14-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 703137aa-5828-47e3-f0d7-08dec07e94d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|3023799007|22082099003|11063799006|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6AV5qn9VVhxBLdfA/Ig9r2r+Rkr1sikZXOpXueREAgIDkGUb6LZD6VYQBsmOAg7FZdQslHXsWO02yLxyZIoSfBQB2Hsq8GLwnQK+76C+ujFiVv2zL/bKhitzvHKJtKkB02E5fZFydPuLR6kdy0qQQutLkSnunsZbgWJe9bROdbVpwQuhTzvLhZ9bvilm5kguU6RLucussFt98NhpG39RVyX/LSLerKh8GXXVSP5m5xD0GH686NgnbMcLCdri80abUIamPHyHrS7hXsa1syHOgZwR7ky1XM+XM8uwT83MvFPHfZm822L1ovXEU5FcuNRdSp/z3v0k2J/7ump2eTfjPEuXtjsQiNdM+SI3UMOQgZ2K6Lij3phF9sto/cnDrpk0RA+y+hnmQ/eqvwlrYu9YBlJU2tJiv8WKk/TUl+yaKw7cKvjlsgYkeeTm8pIyFJdN4TwnDMAHturdODvAU/6isdGWL0kalpGXSwUER3DBlhqig3yWPd11l7txUVU1xg76+8V3fuAaPfuljJlaOy+dynxvm3BcJJYFSN9SbnABseEEx1dIhSUOQ8+ycvp/NnKVyey+XmqmD7DRsRhNDJ2TI6i3U7CyPignA+y0aD/p57vLY4a8NGITiXGg06TRxEPudpffzDMRyioaqtNDsggHNlGJQO/tb3DjYpuh4bkIQZF02HLGCwHviPHVWyf5bk/e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(3023799007)(22082099003)(11063799006)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmVQRU9henhHdzFUdkc5YWozTExjVklETmYxZWcwdzI4U0VHeEdjYzVlNjhM?=
 =?utf-8?B?NVRLT2xEYVlHNmVqMFNmMUtlQVN2aElhK1JFY3NlNnV5dWZhWm1tclh4QkRN?=
 =?utf-8?B?N3FtMlJTOXFoWXZvNW1Qa1RWcmxjMWhxL2FGdlgyQStrQ2tCNXJyaFd0UGVZ?=
 =?utf-8?B?MEpSbXd0NEdIaTRuZlRadUVydnpvMGxiZis3dkVPQlYwUHp4dWRmbDBJZDdh?=
 =?utf-8?B?NGlYazk2a1ErajBZNW9BUjhnKzV0OWNObS9FWnBsMjhyMHFJandWOXRxZXht?=
 =?utf-8?B?NzYySll5M2lRQzZuNEk2Vi91L3lmc2NaVG5heGkrWWY0MFI1aGFiVjlPMkdy?=
 =?utf-8?B?dGE0WXd0US9JZ3cxTWg0UENVd1ZscjFmWXByRGNzcENQaGZPUy9WZ0tBQVBt?=
 =?utf-8?B?amxuejByS25HZDZsYTFYVGZ0a1dacVg2VVV2S29BbFZCWVV5R3drcExYQ1BZ?=
 =?utf-8?B?bEJzenJQSE5rbTNHMDY4NW5RQkJtOFNjbnpyZU8vODI0OWIxQjJxWjdVR1VN?=
 =?utf-8?B?aEkxcHVONFFEYno1bXNDWWFxZDhYNlJDNUo4a1RwdUZYamVvdkNoRHYzZmFF?=
 =?utf-8?B?M0hBb1ZBZDNScy8yL01YNzF0V2oyNGkyMnZxZTd6Nno0NWl4ZDIyK2FSbmxQ?=
 =?utf-8?B?VWdXWkxUaWJhNWNISTRCM3NmYnVMdmNDN0VwUks2eGF1SnlCODZLdW4ycU5k?=
 =?utf-8?B?WkIvTnpNcmNzR2V5a29ieDRmVGg1azRTYVBKVEYyejN6Z045NGpZZTEwZHZa?=
 =?utf-8?B?NjQ3dDdQTzZ6OGt6d1N1WEpNMVJXTzQ5dyt0a1RJSlY4aER1ZlphM3RSRE9H?=
 =?utf-8?B?Y0dVUzVkb3FTNGFjc0xHNnhaOEZJVG00NFVZS29YbG1JNmVYbGpndkp0Ym4y?=
 =?utf-8?B?WkFUeVRONzJRRlAwZkl4aEhsMjM1Y0ZDTGE1bTh4TFBJWSt6dVNZSUg1Rnl1?=
 =?utf-8?B?c2ZESlZLTys0NXVEWXpBOE41dlNQRnozcmVMbnFNckdxMWs1VFFWbmJMY1hS?=
 =?utf-8?B?VkNkS3BMNnFTa1dwY0I5N0dGQjBaejc3UC9ta2hxUS9URDBackt4eUt3OEI5?=
 =?utf-8?B?REFTUWt3T2NLekY3NXdWalFxRnEyWHJwUE1lZ1R1S2U3b0xCcjF6YUorbkdk?=
 =?utf-8?B?NGs0cldIYUR5UThaSjkyanBiY0lzWVdLZ0s4bVdyMGgzUEt2RXd3d2cvdVVm?=
 =?utf-8?B?eEtxNWRCUXZ1R2l1YkhyRVhlM3ByV2pJbWw5NE5CeEo5dDFaYU9HN0lmMS95?=
 =?utf-8?B?YUM3b2E1VWNVeFUyNHZmS0Rob2NnTURjU2o0MEhEMmEzanRDTmJra3ZwZDBO?=
 =?utf-8?B?Z0hRbU5wdXJQT3FRa3l1SlFhOWxuM09hSTZUajA5OUJISjI4TlVBZnlZVmg3?=
 =?utf-8?B?NDM2RXRmZHB4YXllaVMwQWhvOGlPV0krWGJEMmh1cC9kTDVXMTkvaTQySDZI?=
 =?utf-8?B?cUx1M21DTDZrZm1Pam1KRituUjk2ZTBVbjN2UEJwdU51N3NWN2tWZE5vS2Mz?=
 =?utf-8?B?YUZ3dzM0NWlSVEtaT1ozcm05QnJzYkVtdkNRQnAvck5iaVpzVmFHQXpZcmxx?=
 =?utf-8?B?U2RMQk5RVExMamdkRG45ZEgxTlRqRGlnVXg0cUI0YnZSL1ZmU0FWVVJBRWlz?=
 =?utf-8?B?WlBpOEVPRUtkY0FvcGNhN0k1M1d5RHFTR0hxTTlGMndkZ0lETVRkcllGclVs?=
 =?utf-8?B?MzNuTzFUR1dYWndRVkFsZXdRZXBpZldMVFhoWjBmWTVWTW8yM3orUzJ5WXVv?=
 =?utf-8?B?NTFieTBJcGFzYmI2dHJCZUlIVHJkV3RLb2szQlFXczZ1TUkwSEdrUFBvaTdq?=
 =?utf-8?B?RExIZWZ6VkxMSkRKd0xkbm5kWDhqQW90dDJzUDU3c3FFMi9xTnlCVXBub3pu?=
 =?utf-8?B?VFlaQWdLdHpmOGpMZHJQeDV2NWRLN2dPakRlWWtBRlZnUEJUa1BSKzVtUjdp?=
 =?utf-8?B?b1V5VVl1TnJVZWRiZ3hCWkZYVTBmOTRWQi9wMExjL2U2K1JUalZDK1lacm4w?=
 =?utf-8?B?MGpGb2RLaEZ1NG9VWVpXclozd2F6T2JiNWNBMUk5TlRMSzNCZkZMVFk0enQr?=
 =?utf-8?B?VCtLQmFjYm5QRjgwSm5qN3lBeUN3VTNlREJTODh2ZEFnNFNpeW9nSXNzeUhP?=
 =?utf-8?B?MUs5blNsdkpkVDlQVEtFQjYrU2hCTndCd25DeWE5M3FzZmdrNDBpQmlxQmNi?=
 =?utf-8?B?QVhUSTJtRmFuNkdTQlNxQXg2VEY0cDR0ejFKd21FeUxYVThlK2p1OVdMNVJM?=
 =?utf-8?B?SUswTTZGbUVscXE5Ym5nTlpXbFREdU90YlRyckZrbERaZDdwU3h3aE1lalNN?=
 =?utf-8?B?ZGdCbnB6QjA1YWdNNFVnaUVXZ1hvaFJvSHNDZnVPSzEzeE9jdU1NNllQQm1v?=
 =?utf-8?Q?c5Uy4scT1lVJMdi6eNfr9zvvZFLuwr3ZKgYB+WAgZSsj/?=
X-MS-Exchange-AntiSpam-MessageData-1: /pmvHQwSl0zZlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703137aa-5828-47e3-f0d7-08dec07e94d9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:11:43.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OqWoqxYHR81dDOmbF0QBKCVdC0nDSY2hYN4geGDg3SkEYEU+5mtbeANusDhD8NOOiduI9yB38nQxwQMbk2EvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Extract the SHA-384 hash, RSA public key, and RSA signature from the
> FMC ELF32 firmware sections. FSP Chain of Trust verification needs
> these to validate the FMC image during boot.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs | 94 ++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 011be1e571c2..db61905eac9d 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -15,13 +15,35 @@
>      gpu::Chipset, //
>  };
> =20
> +/// Size of the FSP SHA-384 hash, in bytes.
> +const FSP_HASH_SIZE: usize =3D 48;
> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `publickey` section may be shorter, so the remaining byt=
es are zero-padded.
> +const FSP_PKEY_SIZE: usize =3D 384;
> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `signature` section may be shorter, so the remaining byt=
es are zero-padded.
> +const FSP_SIG_SIZE: usize =3D 384;
> +
> +/// Structure to hold FMC signatures.
> +///
> +/// C representation is used because this type is used for communication=
 with the FSP.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(C)]
> +pub(crate) struct FmcSignatures {
> +    pub(crate) hash384: [u8; FSP_HASH_SIZE],
> +    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
> +    pub(crate) signature: [u8; FSP_SIG_SIZE],
> +}
> +
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
>      #[expect(dead_code)]
>      pub(crate) fmc_image: Coherent<[u8]>,
> -    /// Full FMC ELF for signature extraction.
> +    /// FMC firmware signatures.
>      #[expect(dead_code)]
> -    pub(crate) fmc_elf: Firmware,
> +    pub(crate) fmc_sigs: KBox<FmcSignatures>,
>  }
> =20
>  impl FspFirmware {
> @@ -41,7 +63,73 @@ pub(crate) fn new(
> =20
>          Ok(Self {
>              fmc_image,
> -            fmc_elf: fw,
> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>          })
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.
> +    ///
> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware s=
ections.
> +    /// Returns signatures in a heap-allocated structure to prevent stac=
k overflow.
> +    fn extract_fmc_signatures(
> +        fmc_fw: &Firmware,
> +        dev: &device::Device,
> +    ) -> Result<KBox<FmcSignatures>> {
> +        let get_section =3D |name: &str, max_len: usize| {
> +            elf::elf_section(fmc_fw.data(), name)
> +                .ok_or(EINVAL)
> +                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}=
' section\n", name))
> +                .and_then(|section| {
> +                    if section.len() > max_len {
> +                        dev_err!(
> +                            dev,
> +                            "FMC {} section size {} > maximum {}\n",
> +                            name,
> +                            section.len(),
> +                            max_len
> +                        );
> +                        Err(EINVAL)
> +                    } else {
> +                        Ok(section)
> +                    }
> +                })
> +        };
> +
> +        let hash_section =3D get_section("hash", FSP_HASH_SIZE)?;
> +        let pkey_section =3D get_section("publickey", FSP_PKEY_SIZE)?;
> +        let sig_section =3D get_section("signature", FSP_SIG_SIZE)?;
> +
> +        // The hash section is a SHA-384 output: it must be exactly FSP_=
HASH_SIZE bytes.
> +        if hash_section.len() !=3D FSP_HASH_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC hash section size {} !=3D expected {}\n",
> +                hash_section.len(),
> +                FSP_HASH_SIZE
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Initialize the signatures in place to avoid building the larg=
e `FmcSignatures` on the
> +        // stack, then fill each section from the firmware.
> +        let signatures =3D KBox::init(
> +            init!(FmcSignatures {
> +                hash384: [0; _],
> +                public_key: [0; _],
> +                signature: [0; _],
> +            })

This proc macro will generate some code like let field =3D [0; _]; which
it then writes into the final init location, so it's stack-ish storage
although I guess it'll be optimised out.

optional nit: may be better to derive Zeroable and use ..Zeroable::init_zer=
oed()
here.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
