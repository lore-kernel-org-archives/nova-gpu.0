Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC20423168
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825996; cv=fail; b=eqJqzFFqhWks3TrW7/+8o9SaFxHVtpGATtL4N5wMrgrQW+KldQcHhx/5kLMWbhYJEnHmY41WpoHfa7Qi7FrPkOMoEC58fB/CS3xGrzwhfimXWPGY8CQZd79GrCcDXRjovW5AkNmvhj/Tuy7Z6X9oZAXwiASyEOGo/Cr1/MMzVkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825996; c=relaxed/simple;
	bh=I9F1CtJ+ru2pRvS9P2+tMe0CkVAHiJ8Zat98tcXIj2g=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=vCF20FOvX4zE3RnOfqY0bgiElNu3M7cmWakm9zj+iu/HPTd9jg52bahGS/hydAByy1ycmNlPL8HUvp3wjTVgu9pwf0s5C3E0VkMpl/Slbff9ZwtFKWG9fXNOSDRJJgoFbCTCvVTMC5T+a1GjSbk+NawnDVug8MWnC8FbcyHpMmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nfe8Xe0t; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nfe8Xe0t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8yYMq5OAIHpVS/y2xFk3hkYqs3rPypRzHYVW7Ygi/+eDAuV9FqzE/9Q+G4AJP9UVMgf3sf6VZkLOZk4pWUxcgUlLw1eMlsqeWjtk7B4BfxqFHVYZgzX5GH6ppGXv/byG86TKJtcQQNhSESI3p7diLCdkvIeFmOwb6eWftz60gopct1tM9d4eY20eaHGl06B7g7rQE2vqsAXpnl0yFUCy8PliOCzwMzPv18uHfUO3BOyPoG7IlGGxCgdq4TolycZSXzhGsN5YRLz/NmYzyz08M+22mdkX00wWtUBpeVqaTH6I/l7qHr21hwhbeu+QkcicZ+34osl77oAWunefDGUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6SkSgZcL6Pod3h19w57CqaP4VFNqJXvBhewZLrZE3Y=;
 b=Biq7V0VzQ3/BQTlvNdJCQk/7uF0u/NKI7qJjTy1khrS3Qd1VVco0sHMDwKZZJREh5t4/zrIjYYNj9d0VrJ8/ZJV3kzT7qlhP2tCJvWq2k/IdXVc/t319eNWliA18aBP1+PLml57fmnC8PsO4cG/El16wBdmRqjYfrkJ4i0SwtcOAeVgvab22iYWbuEk7QreJN4VbLLbg5kcy8UQLINHSkTVFTZXd68TU45eVKHK+KfjGZwcqagYECVREBW5qL4ICcWyVgLa8G4dF/cpzIvl/r6TdThMMldnjUpWbbCqKMgksfenDFfg7slIBk+HIuDi1HGd8VHT6Rc2iXu4MJWqlvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6SkSgZcL6Pod3h19w57CqaP4VFNqJXvBhewZLrZE3Y=;
 b=nfe8Xe0tDkeI8FBdXMKXAgI4mX4m/cWJb20HclRZWhkJbP+BFjtwhSZxi8Bh32A8rex4Fju0O9rWTIDE6Y7MCfhfUd4B4AzvWFvOc3uEKxEL7z66epu4IA0cmLvnzs8yQM7GWoVoqnjDZe4G63YXKJwymIKXFbHKugr+mshp/57QpowPxlcqAE46GI+oTmU8B3Z8Ubk5EB5dsK2ww9H4PAMyFJPkWLLDX3SS40Zh82x8VQ7TOuJ8j9OXMVQuJ9j2ues5WPisjNLlFjXYvF5uz2kYOnFaYxv4kzMEZwqeF1AwnFbbsS9ux0r7EaaWUoq2uIPmz1EzsmsaKHhoUCDaCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:26:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:26:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 22:26:23 +0900
Message-Id: <DJMF2E429W47.22NHGAOO0SG39@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>, "Zhi Wang" <zhi.wang.ai@sent.com>
Subject: Re: [PATCH v2 7/7] gpu: nova-core: reserve larger WPR2 heap for
 vGPU
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
 <20260622194353.1308872-8-zhiw@nvidia.com>
In-Reply-To: <20260622194353.1308872-8-zhiw@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 77098c7f-2042-442f-871a-08ded6ab305b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d3444h0WXYB/KOnWJsxuaYdGnDgXRcxaTtdmNfaKh1RQSxcPOoB7l6L6Yx2/3Ja0Yqn4XQlir72nFi0LK6uwOsFjnz51QvRP9aMm+5sJueoNbPvF9Mu4nak/icx5QCs7tEm5f74rFBRKpUZ9ApYG3KfoiqWZvcLpahXbiSqkzb3Tv5Px4YYQAObVgshJRC4qYiPWKuPkueVxHDywWA2BN0UqiGlpH3L8kTZceHi158176y3RL4fYRzYCiEO28AjOkpVDshSZDHPgdXP5KE7N1hDD5w88mBwnkSc5mfOzUZxfA1Gmq7rXw9xlnARvSw+OxDCFhXOt4gwjEWfz55nYNu8KelsWPYYdbXmRJ5qA+auw3cd+JS6TIQ1l28ETBmKjrZ/mHIlfegQT6ldfuwaZMASzuIoXx33wifNcxExPUOG8/iBVojznIzb5ZqoIM+7GNzbrU3AB0q4SAzyaeP1bvh0Ubb1KVfJzcwptzV3N4h/vFpcTkeeRoXeA4tOlwWzWlwh/ecZQiTsnm+wP3xjPyKWdu1W7r9a1tV/PZuk276AEi/Kr4YmRbpX+ObqCGZ0Xiavd81o8VV+xkhyVNgDxHVT53vIbaBwlab0yuvDu/xwRfkPTA1BKYcsOm5HYXMZOC4aoHIV7S7+9fejM8DUn296VLqjgrNiYCJxSsdMfvao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0FkSzhuR2ZoakdYZnQyalllb0UxNzBxZ3JaS040cmlOdXhnRTlZTVBSdVV1?=
 =?utf-8?B?c1p0MWV5M3B6ZkNzM2xwZFVqY0FNdHErOW0xR2M2NDlrWk4vWmREUW83NlQ1?=
 =?utf-8?B?NkF5UGVybHFXUVFjc011UXBaQ21OM2ppWTV2eEdFQktxbVY2V3E3d05YWVNz?=
 =?utf-8?B?V3VZcDU5c3VVN2RmR1VVRXpsR1VrdDhHM1I4anY5ZTI0Q09DOVZHNy9kd2pC?=
 =?utf-8?B?MjlJaFVkMVR1ZllWb0txOTZWQWtmTllxSW1NamxHRmh3R1c2V0pkenI2SzRy?=
 =?utf-8?B?bmUwc05HUU5VWTlrRWs5cERGU3JBdWIwZ29VWnU5U2grY0p1dmpPZmJxYjVm?=
 =?utf-8?B?VThBeEZsSkpucExDWHR3TWlUc29xYVJxZ3dJRUVuT1pEaXdrNjNHSmtZQU5l?=
 =?utf-8?B?aTJxbTlCejRUT1BLTnBsVEpMOWIwR25pS3JSQjJzOEt2THJ4dVBmSGhkd1Z2?=
 =?utf-8?B?ZEVkUTJCNklCclhnVWd5K1RCRTc3Qi9SQ2F2ZlZ4aUkvSU5JcG9UbFdXZHVp?=
 =?utf-8?B?Z29mU0NweEcwS0NNeFg0NkpNc3BjQ1p3TEozeG12UXVnRkcyMERLUFArSGUw?=
 =?utf-8?B?aU8zekM2T0ZFRmxxSnp6Kyt4cWVSeTI1SmxKbjlxMFlHbjB4ejZtZFVUZksz?=
 =?utf-8?B?bU4wcUxDSzJLT0o1QmNEaHVlWVlFSXpkaGpkWTNQM0FMeDRiRkhlOUVJZmhC?=
 =?utf-8?B?UVp3UFB5Y0NsWnRVNWs2bjI0NEw3c0U4UnVobnVkQ1hPb3daYTFBcHZYS0tJ?=
 =?utf-8?B?WDdCNFk2TmJQVWtUVWRLeHNaY1RiVWY5eGd4T0VJK2xqREhYVGsrL3ZFQnkz?=
 =?utf-8?B?Y3pEMlRwaFM5a3g5ZmZPYWJlOGRzMVVNWFNwMHp4ODEwSCt4WEdvL0xYeC96?=
 =?utf-8?B?RU9VU01YSDQ2VjJWMVJmQnI0Q3hCR2VwZERLY2cyN2pOWXdnamdWWjc5UG5F?=
 =?utf-8?B?UkFjNVpQeE0xV1ZjZFczaFVabkRlTnlSamRpMzM2ZXpDVEVNQ3M4Y3VyeEpX?=
 =?utf-8?B?TjQ3VDdhUDVGclVpMUNvcGZoVWRJaURWdlVPM0VBN3l5R1lVRzRScDhFUzEr?=
 =?utf-8?B?RUx5VzR4c2dzT0RidlBoNStKdk9RSmhPSzA1VXlpZVIxUlhoeldLemFQZDFk?=
 =?utf-8?B?bVkxV014aUhlMm9mWm1kUnQycjdrMHo0bXZjNnZVUzlDdVM4YmRBQUtRa204?=
 =?utf-8?B?U2JiMlN6VVFtTjMwQVYzVlROdEVuUTRUdFVaeVBaMzRlOTVUTnVyR1M5b2ps?=
 =?utf-8?B?SmpwQmNteDhiR3hZcU9pYlFHdG4wekdlajZNWk84OHRGaXlBNGFSNU5BSkhJ?=
 =?utf-8?B?a3ZsZUs5UFZPRHA3S2tISXpkcGRKUllJYUdzeFo5emovV3ZINHcrZjNpT2c0?=
 =?utf-8?B?QmxMcy9PZWJTU0k1MjRTNUZXVHVUTHFkMDRSVHJMUTZvdmJKSitDWTRsUkZs?=
 =?utf-8?B?Z3FFYnNhS3ZtbzhHYkk4OXVyKzk1N1hUUjBQS0lNb3dqMnBBbjJVSlREWm5a?=
 =?utf-8?B?MTZ2MURTamp0cWFOdmYxT21wSThPSldvY2l3cFNYNi9hVEpqSko5cjkvRm12?=
 =?utf-8?B?NmpXNjdNN1A1NktQSzlTTjRpclE5V1M3K3pxVDNIOU5BaVNMcmhsSzlOV0NR?=
 =?utf-8?B?Y3UrSUpSWHJ5RHhJb3hLNHJ6UzBmUTNTZWd1WTlWR1lkRTFkY0VJVllUQzJk?=
 =?utf-8?B?N2dvdVFhVjJZclMvZm9MMUdjaTZuNGtmcXI1MDdTRVdNMkFvQ1lsL01nVzRh?=
 =?utf-8?B?OTg2NVRJRm5RemxSazlXdW9WLzlMaVpCUnA2NFJBSnYxQVh6SlgyUnRLc0pZ?=
 =?utf-8?B?aEQ1Ti9YM0FIYjVMN2dlQ1RrT1FuQitmbXhQZ2dPVDM0ZTNsMml4eEZDMk9F?=
 =?utf-8?B?aTVZTEkzR1FDbGVPZ2huZmNxYWdYam1hS3crS3BiVUsvVmNLZkwwemFuUG9B?=
 =?utf-8?B?czlOWUtOUmhVM2NJUG4vckx1Vy9rOXV1bzFQd1V5SEJCaE5aRmlnViszL2RP?=
 =?utf-8?B?czlDTmUyNVlBVHhCd01rZTBtWG81ZXpaZjROTzl2SXhzdXgxenVkVlF6Tk9k?=
 =?utf-8?B?cUVKcDE3bzBXdUpXMWtzTzBTamdWTCtNMTFGQmFLUjNnTHZXWWhqUlZWYlJV?=
 =?utf-8?B?aDR0dUozL3BtcU00YVNHVDVhYm1zbVlKWGw4YkRZYlJjbU9JQnFUNlVtbFVL?=
 =?utf-8?B?dmZYRTNYc3I4MHBLUDRnL1RVTDJIS21lcTd5U2NYRFEyR241ZHB5MmxBakhv?=
 =?utf-8?B?STVaMXgwenZZbkJEaWxobUh0K05Ob3BtVmtXeVYxWUgyQkVocjVDZHJBNnBU?=
 =?utf-8?B?Y1VjcmoweFRPdnI4WjhReTdpcHlzWkFoeUMrczVaYi9iM3EvSnUwcVF2ZU9m?=
 =?utf-8?Q?e85Ke8zEI5RueARoGmIFxmUukpJWosBE0Z8UGTaWqzU0D?=
X-MS-Exchange-AntiSpam-MessageData-1: lvVKSBizrVVcPA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77098c7f-2042-442f-871a-08ded6ab305b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:26:27.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeUhjpVvOAkv+3Nip9Q5hABKmO/0W5SZqhLgoWYNydDBpabPY61qrEyCm6kf9XTcuCQ64wnVx7FBjUj7mXCpXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:
> From: Zhi Wang <zhi.wang.ai@sent.com>
>
> Reserve a larger GSP WPR2 heap when vGPU is enabled, using the VF count
> reported by VgpuManager to select the heap size and to populate the VF
> partition count in the GSP WPR metadata.
>
> Use the baremetal heap sizing path when vGPU is disabled. For vGPU,
> reserve 581 MiB for up to 32 VFs and 1370 MiB for larger VF counts.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs       | 25 ++++++++++++++++++++-----
>  drivers/gpu/nova-core/gsp.rs      |  1 +
>  drivers/gpu/nova-core/gsp/boot.rs |  2 +-
>  drivers/gpu/nova-core/gsp/fw.rs   | 10 ++++++++++
>  4 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 725e428154cf..b5b1f6c13edc 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -24,7 +24,8 @@
>      gpu::Chipset,
>      gsp,
>      num::FromSafeCast,
> -    regs, //
> +    regs,
> +    vgpu::VgpuManager, //
>  };
> =20
>  mod hal;
> @@ -171,7 +172,12 @@ pub(crate) struct FbLayout {
> =20
>  impl FbLayout {
>      /// Computes the FB layout for `chipset` required to run the `gsp_fw=
` GSP firmware.
> -    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmw=
are) -> Result<Self> {
> +    pub(crate) fn new(
> +        chipset: Chipset,
> +        bar: Bar0<'_>,
> +        gsp_fw: &GspFirmware,
> +        vgpu: &VgpuManager,
> +    ) -> Result<Self> {
>          let hal =3D hal::fb_hal(chipset);
> =20
>          let fb =3D {
> @@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, =
gsp_fw: &GspFirmware) -> Resu
>              FbRange(elf_addr..elf_addr + elf_size)
>          };
> =20
> +        let vf_partition_count =3D if vgpu.enabled() {
> +            vgpu.total_vfs().try_into().map_err(|_| EINVAL)?
> +        } else {
> +            0
> +        };
> +
>          let wpr2_heap =3D {
>              const WPR2_HEAP_DOWN_ALIGN: Alignment =3D Alignment::new::<S=
Z_1M>();
> -            let wpr2_heap_size =3D
> -                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?;
> +            let wpr2_heap_size =3D if vgpu.enabled() {
> +                gsp::vgpu_fw_heap_size(u32::from(vgpu.total_vfs()))
> +            } else {
> +                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?
> +            };
>              let wpr2_heap_addr =3D (elf.start - wpr2_heap_size).align_do=
wn(WPR2_HEAP_DOWN_ALIGN);
> =20
>              FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOW=
N_ALIGN))
> @@ -265,7 +280,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gs=
p_fw: &GspFirmware) -> Resu
>              wpr2_heap,
>              wpr2,
>              heap,
> -            vf_partition_count: 0,
> +            vf_partition_count,
>              pmu_reserved_size: hal.pmu_reserved_size(),
>          })
>      }
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 6821008d48d9..a159f36bf704 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -26,6 +26,7 @@
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> +    vgpu_fw_heap_size,
>      GspFmcBootParams,
>      GspFwWprMeta,
>      LibosParams, //
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index c607081e8242..dea028f4b434 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -56,7 +56,7 @@ pub(crate) fn boot(
> =20
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset, FIR=
MWARE_VERSION), GFP_KERNEL)?;
> =20
> -        let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
> +        let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu)=
?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
>          let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 4db0cfa4dc4d..2fb72f8dc3c9 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -101,6 +101,16 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coh=
erent<GspMem>, count: u32) {
>  pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D
>      num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
> =20
> +const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 =3D 581 * u64::SZ_1M;
> +const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 =3D 1370 * u64::SZ_1M;
> +
> +pub(crate) fn vgpu_fw_heap_size(total_vfs: u32) -> u64 {
> +    match total_vfs {
> +        2..=3D32 =3D> GSP_FW_HEAP_SIZE_VGPU_DEFAULT,
> +        _ =3D> GSP_FW_HEAP_SIZE_VGPU_48VMS,
> +    }

Note that this is also going to return an (presumably invalid) value if
`total_vfs` is `0` or `1`. Should it return `0` for these?
