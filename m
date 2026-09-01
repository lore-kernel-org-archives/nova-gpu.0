Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89813033F7
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221833; cv=fail; b=TYbpwKcsfGM4b/0S4bR1SA5akxcnTT5naPPMC8tRcshJLE/S08DUASmELCm44E1mqgMHuuqKwd7USsMkUTtqXWhOPrr4rYGtxbjJXD9CVjggkaiBDTEH5/tC6OPnZoDEtewK4zuzFgqZUJwLW9gZzY87FdmIlL9cKd2kglbDg/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221833; c=relaxed/simple;
	bh=gS3yGRUr5twQ/K6/588t9nSV2G8PZ/R8EXA3FDL39W4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=aBk16jFGARkIiBOkqG6x4zHWeT8PdlI9l8P1DFfRLE4SyskZ87AWM4z698XxuZcpCrzu/FxDCnTPmYZ0aYbRY2f8iVBOPSJUKmTK0SaKpN2dZIIGffBHbBA8idG+dKvmwYN7H7UvPHrrhuvsXKMdzcCCxjbSSU9ApYwu9lohthY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WiLKSrBr; arc=fail smtp.client-ip=40.107.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WiLKSrBr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwKVOwOk/ZW7t6PX1DNXe/RcLii0QqxH6ZzSDX/zpzvFAaVAlDUJvcoxPCA729jPnVBgluidSvrdG2C7n/O2H2LCpBVxf6RAwNW0o0+62ZomajnJHxOWsevtujgu3Lj0ByLWRvnV0dtXtbCcDCxddBXUpP+QnzmPVXBAB6Wmmk7sXpN0RyyjFFWIxicP+tw2gpX/Aw8+0xFI2KYj1ooXCtF0vGc1PetNNG50v9HzDlUOD7eer2xmxNVEIjp+kjbQdHkm0WYDMX9Ju9AX5GOdAuh8rsKw/A4IDwqDmPXiobyHTACJlR3lgMJzndQdW/1N/7Y9+RiHx9ElPLMmnwhzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ4YsNd41HCbi+WYVIJIASyzZRnyLTrWn74sBPFO2ek=;
 b=OmFSxKcooEX+BvgmwcDVfsPfIcj/fIHc/11t/cHxHjlKSlh6nbxE0eW29UUc75sAXQR/Jk7BhxBgDni409hk96Eq8uxsEt84MWqzgxoGmtouwzLk6TEtEQnqVCThArNclQHO38oufCIltMzlJ4pa0GKXAlBzpgXPcicpt4y3o+niMwEwa15FiyFU3epFnVhR7TmiOIHHkP/opiXBj8D0lMIuZdNPXZf5KkD6hrIijpZKIvOgWThOL6gSmqo6aZy7ZEjBn18B7ydtdZPVUQcigMOW+VMG41a26EYXnG2JfpZvMrEJQRDux+rqBigUStLYF3sE+DPy4UJUxKTCtuOeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ4YsNd41HCbi+WYVIJIASyzZRnyLTrWn74sBPFO2ek=;
 b=WiLKSrBrJHT2PmCd8odi1qO1LKsyx3MESs4YiQFTRetDnb+HNzHYzy6m567G5obXN66WKyTsaVMBrbxKvvn+tYpJsui21QkSyvY/stMHR6Z3ArMLGpEw2xGEssrb1+mDxEMfU1HDb2wQd+q5ZuRyBWI5mRiBqhfr6/WDTzdn+Ht6sRc8z7ytKsGcPxNw0eGQ/9LpDd7R6mlCJOTWO+s2qD9VE/OKtqOVSOCAkjqRnUQb1Y6VUsWKeyA1ht/stU8+tPzALoyTyHfWrFjgljyWJjC9a+DQtHMe+KLloo6BUtRTNxbkF4sv36HIkMZZsDNg49a+3ktJa/5LOm+3cHXgCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAVPR12MB999122.namprd12.prod.outlook.com (2603:10b6:806:4e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 00:17:07 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 00:17:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 09:17:04 +0900
Message-Id: <DL3JQD7GHL89.3O8DTOC182GL3@nvidia.com>
Subject: Re: [PATCH v2 1/1] gpu: nova-core: correct FSP secure boot
 documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <apopple@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
 <alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>
References: <cover.1787816400.git.zhiw@nvidia.com>
 <946dfa1de304b261950739c6e3da1e2d75eb3525.1787816400.git.zhiw@nvidia.com>
In-Reply-To: <946dfa1de304b261950739c6e3da1e2d75eb3525.1787816400.git.zhiw@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAVPR12MB999122:EE_
X-MS-Office365-Filtering-Correlation-Id: 2279107d-34c9-4640-813b-08df07be5bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|23010399003|56012099006|10067099003|11063799006|4143699003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	j+A3LPFIC5u8GXDw2Gl0NIKUHck23gvTWaPobojvZ0QMqtjOkIuvJnAoIY2acgEEqIeFtGHxiAmEbtVPyVRaYhK1jYOoUpIkwf2kBR2KcBfUzRlHWfw36F+FZVop3796+XnTO6i3/xQQa1Vyv4jJ7i0tx72yMDLphENAhfGG/qky3qluTVckf/QyGDbZ4U5uZR/VoayWKJfSOm1TROy1byj4DQ0gF1INUJWUVxtTxCuW5feEim7tePkMrSFR9Kut5iqZ0wHBJvkkzdui3Tt2fqxdxaACp44iSsm3HwpTyvIGUxBx2hzFrFWWSQB/yM+2a78WtwSYSWeVoBSXa3eWMupxrdU6HwVouGtGtvpRp+rkIDICPtcx0IDMMp6HWuRzjb+e5twGNc3SwJObOTktLyK9i6NXYKQsqOkPbo261aSkGcxYqQTD5ZWehcad//W9TIdeIJbDdvIDeka8rJfUM0lY93M7HC/Z4H88JdwDXwtqJomgMMk/aCbKhrK4nYrZ5K3Yf6lQUhH1wy+Qdk5ZR0YGPRsX1TgxZBFd2hGOy3bO6AaAETbX03/dJhwyrHjspw3g4Gm9Cnc6XEXPuGrhHQFu3h55iZTyeCaM3lG18A/4bkVsraCt+WjN1/NuNtQIbHoGMgH9WWOQGcVEP5gjsyvnWqYDDP8HR7+i3tPP9zM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3hKNjkrSWRQbHlPUHd1bVdxMXZvK2tpWkhLY3FkZlVrWkRDLzNWdmlNbWt6?=
 =?utf-8?B?SjFCbW9LdFQyWTRXRENoV2JzZ29OZUtPeHRoRzFEbzM3ajNzVjIvWnFZTlZV?=
 =?utf-8?B?b0pTbk1BTWJWN3I1aFpiaUE5T2UyZDVGcVpHY3ZCWHJLekNIZGlJNHE1TWto?=
 =?utf-8?B?dHNoSG52bGJvS25zQk80VUx2ZkZDREtvQjlXNmlrUEZMY2NmOGVibVQ0UE5M?=
 =?utf-8?B?UWJjamhXcDNyWE1KYjd4VFJQTmlUWldrRFFMWHB6OFAvdjFmZlgvWmdNRXNR?=
 =?utf-8?B?UlRpWmgxSVowbVVnN1BsaDV6K0k3RjdEYSt1eFNZa0lYWFV5Rk1JSElXQUpW?=
 =?utf-8?B?d3ZWUk04V1MzVFFURDYvVTNKcWRhYURWNDR6ZnplZklEb2pHdGdqaHE1Q3lW?=
 =?utf-8?B?TWp3RmlNN0s3VDhhRkZMUVF4Wm43QUNwZmNERWpJMVFzcThjeDRGcldJaGhX?=
 =?utf-8?B?QmxKc2MrdXFGS0dLbXQ2WHZ1bVZJVTIwTnJobTI2R2J0VGRyb0phaElIbmN5?=
 =?utf-8?B?RU1GL0NaemI0OUVOWXJycDIzeHJTZlRHeDdIWGN2d3NmWnZKSGNPZFZkb0c1?=
 =?utf-8?B?TnRyWjRRWnZ2M0M5ZEpHaVdJR3prT2c1c2FkNlh0RXdtdEpYWiszWjkyRmw3?=
 =?utf-8?B?cHpzRHVKQmNXY2kzM2U2OC90bWoyRUdaNmFVZzdjcVk5NDJNUWFNQ3o2dmlj?=
 =?utf-8?B?cHdqQS9yRUFnbE43WXlxNTZUWVY4WUY1OW51YzJURTVHMXdhYzkxRnlrQW9K?=
 =?utf-8?B?QlIrcDhJOEdUdWYyZEZZa3NRM2RSaXdCNXk5Nm1Ua3plRHQrMnR4ak9Wb0Nj?=
 =?utf-8?B?L1d4UXJsbjJIZTNxVGt5MzV4Y2N2TFVhRWVERmd1cmZITDEwQ1ZoZU90UUJZ?=
 =?utf-8?B?cXJIZWdvUW5hS1JiMlRub1lyUllDQnVIUENrN0NPeVJTQ2pOWm95YlJaTThy?=
 =?utf-8?B?bElnUmdEOVU0Rnp1UGVoNEFzL0h4QjNibzdQekZVVWJkbDNLblYwTzRCeFJI?=
 =?utf-8?B?YVVrWGVXYVJ6REozbGhrSGp4ZFA5dVhzcjV2alRMMFMwL2hBVTFzRkdsWjFI?=
 =?utf-8?B?K1VqbDg0TmxpYVQ2T2RUbTBNQmgvcGplK1JEZUFTcG9GVFNsYmg0d2xYRE9x?=
 =?utf-8?B?WjZuVythVHFmc2UrQmxRYWhKSzNaTEoxWmJWZ1ludmdBc2IvY1NINW0wNUZa?=
 =?utf-8?B?UHZxMEdjUXhXUDJiM3dKYlB4S2sxLzhIeGpwdHhvaEFrZUZXQ3psZGlrRVJV?=
 =?utf-8?B?UmUxS3VDQkxZZlg2c29rdmtya0JRWmg5MTlZaE5lUm9xbC9UeG5HOGFGNndj?=
 =?utf-8?B?ZHFBTU1DdkdjSytwMFE4N0g1a0YxTjZPV082UWdPbG9hdmxrdGp3YkVrRTRo?=
 =?utf-8?B?M2drdHB1VXlYem85TEdDT0gxMHlKbnZNdlJnVGdtbGxIVVA0eklDcDBRbnF5?=
 =?utf-8?B?amVnN1FiTXY1bVNnckRBZzVONUljZXFkNzJINXJmVnJzbnFPUnFuMDZZdFI5?=
 =?utf-8?B?dnh2ajNyZzU0dTUvL0FML3EyMFNtN3dHSUVlaVFVMTdGc3hsTDEvc0JWaVFL?=
 =?utf-8?B?SzVoOU03OWhMSktSME9td1BISGIvNFRtQy9qeWVhREZ0SGdmSkJ4SWJpUzNi?=
 =?utf-8?B?eTdwOUJMTWlLT1RQeEhrQm5vOFMrc2FDZDdRcjNHcXkvZngwQUg2K2ZuQzFx?=
 =?utf-8?B?RTh2Qk5TRnFRR0lFQ3JXTC9TUEdHemJlL1UrZHNONUdmNmQ5eGROb2VwOWpG?=
 =?utf-8?B?U2x0TTdMdFNLbm8vL3ZsS3JZdEI5aTg2ZURvRVBJM0pxSjdnbVhCSHlZR1ZR?=
 =?utf-8?B?SmJmZ0VkckNXbjVhaGlQL1FQcDdsakNHRHhTVjhlbkxKOW85UXUzcldidUZ2?=
 =?utf-8?B?YlFJZ281ajZuakpzMmN5OTBPbGh1NWxWRUQ1K3RhdHl0WHEzOU43cjJRV1J3?=
 =?utf-8?B?WXorcXhkM0djRXJxNWxpOWlDSmJicDdrc3ZRNGpIVDlkZ01TSEYxYUtjNTEv?=
 =?utf-8?B?UEtoSVhPVUZDbEJTUE5VZnA5OVdiUUVPN1BiVzdZaDNDSkIvYUdXbUhneklw?=
 =?utf-8?B?OVFMZGFTV3Y0UjRZZW9pKzF3MWxQdDRXeHZtQ24rSUhyTWIvbXFpMUZIY3lz?=
 =?utf-8?B?bVg0c2JlMFhDZWZuR3hnU1JRTUVUY0FMYUczRENwSnQ1SDBwb21vZlJYbEJq?=
 =?utf-8?B?K3AxRm53aXNLWkh3WHRzUjI2cGJsY1I2dVVpVy9FZy9iUmF4M0ZMQkUxT1pT?=
 =?utf-8?B?Qkl0VlZQUnM3clFldTNQQVZOa3VBck5oRUphNXBqMFZqRjJtUk45V1dXUHJx?=
 =?utf-8?B?N2R3bDlpK28rcldCcHpndW1lV2JIbWtvVHlVMCs3QlYyb080U1h3R1ZzOVBC?=
 =?utf-8?Q?EdCK8PLfhQgo7jAH1vs3TWciNGLVbM2LUNcBjECMBFfH5?=
X-MS-Exchange-AntiSpam-MessageData-1: Ff5DmiJs3yKECQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2279107d-34c9-4640-813b-08df07be5bb5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:17:07.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9COp5QHi7j0hD+ND0bJYIu0sN4zc6gaVa1NnX3pLHQc80XymSK7G5oS53U/h4NoT75DN0VkGogPv0VMvj3tgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999122

On Thu Aug 27, 2026 at 4:46 PM JST, Zhi Wang wrote:
> The FSP documentation still blurs the roles of FSP, GSP BootROM,
> and GSP-FMC in the common Hopper/Blackwell dGPU boot path. It also
> uses incorrect expansions for FMC, NVDM, and FRTS, and describes
> GSP-FMC as an ELF image, while nova-core loads it from a TLV firmware
> file.
>
> Correct those terms and show the FSP-to-GSP handoff in the existing
> message-flow diagram. Clarify that the COT response reports command
> status only, and scope the SEC2 and PRC descriptions to the dGPU
> platforms covered by nova-core.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  Documentation/gpu/nova/core/fsp.rst | 88 ++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 38 deletions(-)
>
> diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova=
/core/fsp.rst
> index 52d618d22bb8..bebe3c8ede2a 100644
> --- a/Documentation/gpu/nova/core/fsp.rst
> +++ b/Documentation/gpu/nova/core/fsp.rst
> @@ -3,8 +3,8 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  FSP (Foundation Security Processor) and Secure Boot
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -This document describes the role of the FSP in the GPU boot sequence on
> -Hopper and Blackwell GPUs, and how it differs from the earlier Ampere bo=
ot
> +This document describes the role of the FSP in the common boot path for
> +Hopper and Blackwell dGPUs, and how it differs from the earlier Ampere b=
oot
>  flow. It also provides a brief overview of the PRC (Product Reconfigurat=
ion
>  Control) protocol used to query device configuration through FSP. As wit=
h
>  other documents in this directory, the information is subject to change =
and
> @@ -42,18 +42,20 @@ On **Hopper/Blackwell** GPUs, FSP replaces this multi=
-stage process with a
>  single message-driven interface::
> =20
>       FSP (hardware root of trust, boots from ROM)
> -          -> FMC (Falcon Microcontroller, verified by FSP)
> -               -> GSP-RM (verified and loaded by FMC)
> +          -> GSP BootROM
> +               -> GSP-FMC (First Mutable Code, running on GSP)
> +                    -> GSP-RM (verified and loaded by GSP-FMC)

The Ampere boot model right above had a nice convention where the
processor running the firmware is explicitly mentioned in parenthesis.
Can we follow that same convention here for consistency?

> =20
> -The driver only needs to:
> +At a high level, the driver:
> =20
>  1. Wait for FSP to complete its own secure boot (polling a scratch regis=
ter).
> -2. Send a Chain of Trust (COT) message to FSP with the FMC firmware loca=
tion,
> -   cryptographic signatures, and GSP boot parameters.
> -3. FSP authenticates the FMC firmware and boots it, FMC in turn loads GS=
P-RM.
> +2. Send a Chain of Trust (COT) message to FSP with the GSP-FMC firmware
> +   location, cryptographic signatures, and GSP boot parameters.
> +3. Wait for the FSP command response, then for later GSP-side boot miles=
tones.
> =20
> -There is no SEC2 involvement, no Booter ucode, and no FWSEC-FRTS stage. =
The
> -entire secure boot is driven by a single FSP message exchange.
> +In the dGPU path described here, SEC2 and Booter ucode are not used to b=
ring
> +up GSP-RM, and FWSEC-FRTS is not run as a separate stage. The driver ini=
tiates
> +secure boot through a single FSP message exchange.
> =20
>  Chain of Trust (COT) protocol
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> @@ -62,39 +64,49 @@ ensuring the GPU reaches a known, trusted state.
> =20
>  The driver communicates with FSP using a message queue (Falcon MSGQ
>  interface). Each message consists of an MCTP (Management Component Trans=
port
> -Protocol) transport header and an NVDM (NVIDIA Vendor Defined Message) h=
eader,
> +Protocol) transport header and an NVDM (NVIDIA Data Model) header,
>  followed by a protocol-specific payload.
> =20
>  For Chain of Trust, the payload includes:
> =20
> -- The system memory address of the FMC firmware image.
> -- Cryptographic material: a SHA-384 hash, RSA-3K public key, and RSA-3K
> -  signature extracted from the FMC ELF firmware.
> -- FRTS (Firmware Runtime Services) region information (vidmem offset and=
 size).
> +- The system memory address of the GSP-FMC firmware image.
> +- Cryptographic material extracted from the GSP-FMC TLV firmware: a SHA-=
384
> +  hash, RSA-3K public key, and RSA-3K signature.
> +- FRTS (Firmware Runtime Security) region information (vidmem offset and=
 size).

FRTS is also expanded as "Firmware Runtine Services" in frts.rst, we
should fix it there as well.

Otherwise this looks good to me, thanks!
