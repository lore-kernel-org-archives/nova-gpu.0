Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BF13A3F7
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775313; cv=fail; b=IsqZ7wjXmPxo9bTzb2juXUnv1Nr8CWyZFk7b5odDX2hTb+Br5eyA5/iiz5p1WaYM1H+am0OOnFhMpmyp8+jRwBuWiSvrN1ZOoB0eI/wfOl3fQ6aNSh9qakeDOlPKCxjZ14jYLvTOP6lfwypp0+PWOU7xSTS3j75RFW++0q/3A/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775313; c=relaxed/simple;
	bh=Vxyej48yl1CeGi+yT8dC8MobvKUAPREO8wVSxsINtbE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=evP8hRF0Rh6VQZMX1LowadyGGQujDgAm+rDTFiczisV42FPrHPqhJDZUhizIzXMFpdkiXB5KNF3qxcp3QDK38kDbFjQyS/Q8jceEWKA+Ld7O2JaAlkYnt2cQIsdFOscHzpC5cR7eRey+r/6u0WE1QKemQCtdDSXw2bgNC/gyeYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=APpsZ6Z3; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="APpsZ6Z3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phpe5PFCeth1aKnp92O+Ukew8r9aBWaMrYrvRiiiKrpspjUvKazrTIsCYeIQNzuJSlrT238dIcMpVu5YFNdBl7o1g+yq3MwX2mueGzgVoI3nj2ABvTLME53+5swXTxqneiZ6AvVhARQoV9lXYFmB83v0C1keFuAs79rC5p/xtXX55d1A4PgtgwwGkUUyy0/8/VneU3NB4+jcuQ/2GFbfFYNvr9DlDcRb9YnqtLqRTLp14TGcS/DBMPEmle8an++NGUbOkr+X3PbIpFuKrmk+mtqLvBQJHT+fM1xD+/Vq5cNtXly4xJi2kn4uVKktA/D2RDrCf33xdzpHRNxqFSBOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXSwTUosZCPxwz+2wjLOPxtZfu1+Ha23peeFvQndANc=;
 b=XBWGx5bRxHaIGhJXgEer1xcqWppJ7leUxMw7Mcv3h4wDtJojnAQxg5KhcbGt7oRb+LKBreZPtfef6GOcFEBTCzk6/rmnfSkL5ciXhHhWVmtaypbOd3A/4QpX5Ns4yYATU3soyh6gI4HG7uQ9ZLLzHUR6eHu+HrAURaF5du5nAN8WJhBTpXmcFyWMu4cfHEoIvjM9MWU3BjJvVFZZzvXpsGZ9ZIasJ9hqBu1mDUArEhUkuOvg8FulKvjnWzA6oYK0GYCWAE1OSdZ3Scm4lhHYsZJXFQ7b8a8kkkcG6j2gFfzdbs1PTIVzprIDCol8c1mRPYvqqgLpSS59fb+OYTOqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXSwTUosZCPxwz+2wjLOPxtZfu1+Ha23peeFvQndANc=;
 b=APpsZ6Z3Q+oWebABgZl8KIZZ9ZS1C5gXQ2/hZyOcPqdIPWUOwlM9r8y1ZKtKlUsLG1Z9KntiFHa3uafwBBC/Fb2gBjimXa3bLiwoC4QX2x6cPmxdkvKF3WZirSnbAIu3RadBw0TpNy3wN//BSutTNCYkS8/lDLO5TwxF9wSJBfcUqI/ZZgnBwsL7a5vWZBxFxSAr1NtKHcBmVaCFLSRVajiL5/LYl6rJYuQI1AwLAlzfEuPnRe0a35w/4jZWEEV5MWWLF3XEwKKJyUAsjamy7QLKnDXra1aB/qlMW70mUcAV28DbybuvhMRgqeVg/fFx4+aG5C3BcEq7DkXg+Lpgfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:55:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:55:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 11:55:03 +0900
Message-Id: <DK5M1J77DNSX.XEAFZJT1POW8@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] gpu: nova-core: fsp: limit FSP receive message
 allocation size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260703-blackwell-fixes-v2-0-8e3d8bc32bb9@nvidia.com>
 <20260703-blackwell-fixes-v2-1-8e3d8bc32bb9@nvidia.com>
In-Reply-To: <20260703-blackwell-fixes-v2-1-8e3d8bc32bb9@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0120.jpnprd01.prod.outlook.com
 (2603:1096:604:258::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 34de02b8-aabf-40d3-1b22-08dee865cd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	C1CtCvta6VUgRLMQ09NzGiyFgw54YW3T5EDyFB0zHgKXKg4hiAgLhxF3ZA98V0dalpQr+efIq8V0fGOiRK99foEHy17UkDJ//RWcnknRJGEVca7GKmaQbXUSIHi4C4BwkngbWWnYZ4pvpF9St96wezAWSa3RSkya4v1NZcdI6KBdvEp+MZ24leMZsbeVLdVEq927JSGU6KAJEyBOSVV/jE/1wTv7QKLCAe9rLqp97GaRZIoM0b0/dTJ8JcZdHPwu05y/wklR4HpDhNLw+V956WfDfvftXBpCD/zQ74CR+9nGatf0/tpLUihAvNysfLcBOOEu2pzQ+x5hKKyb0PySn9wGg2U74JxIlCswnBUFe+md1b4fQM6tbmKebY/ZAuE+NHEENlPmGA/ZOAi0GOcCfedCAuOdi0uHUDS5LBuJ2fmtuZlVBd2mrFi+vDgr/LhHvSKYJx8QbRsJ9Jeewsx02gadWJzSU04cScwv7XPUZOIsz1IZZnew1Rjh49sQuozcn560dGB5a2OQf1YPXcQIpK7uQBjeV7T4DttBtFRP3Ta+Y0JSH/Fd6o4Ufrv7/SpJvpRCh1md9HQU67/wu6A1VFtjqsK2mimlgjcFJ0ls/sxqMOyrlvpuzwIc1H+/eSm9nFpiTwdOmKBt+lP/2GJz1FoN03f9q7vwUPMpy2xxpXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2lOZVFMS0lsV2Z1Um54N0xscVFkWklaWVpsZ1ZvMVVRbXU4U2VhakFJZ2I0?=
 =?utf-8?B?bVA3bklVbmNJdnA5cURsRk5WeUdYTVVPai9PZE11eU1ickJCNVlJQ0tNTGNv?=
 =?utf-8?B?ckVjd3hLeXdld0tNNVRsZWVuLzFjZUt2YkVGQTlhK3dXaExUblovZjFBYTNM?=
 =?utf-8?B?R0VMczVDRDdQVGJWV240RkRHVlNNTGpLMmJaVkpSM2EvVWg1MTdQOGtPWUxN?=
 =?utf-8?B?UVBReSs4dVQ0YzNIWG04T0d0YVhOMnp0TTlPS2l0S3FwRXJYbWJST3hwV1o3?=
 =?utf-8?B?Zk54a241WElDSUlLa2ltMS9YTjAxZ0ZqU2h0Rm1OL05LNFZwSnFVNmIxdHRw?=
 =?utf-8?B?ZTRjWHJzSjZhNmZqMzhUZ1hFczFTYkpxSmdQMjRvTE5yazlCRzZzNlV0eHB2?=
 =?utf-8?B?TC9oUHU5ZHJQSFRSM3FuVTN3NXY0d29Rd3Exa1BvaG53Uk15TVhuM3J1YjhS?=
 =?utf-8?B?S3dhTFFONkpZTHZpd0I2RExpSDNFSVZ4MEhyTkFTVUpmVVdXQXRGT1U1UjVp?=
 =?utf-8?B?dUtJalRoYVZpTlhFSks2TjZxdzFvT25iTXNFRnhnUExaRVhnT3ZEVklYWlM4?=
 =?utf-8?B?OG16bW9CK0xUbDh3NENFenVZdWNnSTR6M2NHczMvL3poKytTQklyc2VpMkFU?=
 =?utf-8?B?UW85ZVFIRmMrQnlrcGFYUklITlExcjh3SUd0ankwQ21ZRU1xbS8wMXJ5clJu?=
 =?utf-8?B?cWFNVzdSM05zUzF4MnNWR1J4TUJ0d0JiMU5iODdyUkQ3VEtQUEs3NmZVaSti?=
 =?utf-8?B?WHd4cEhzTTFkK3daYVlOcS9oZEFna2Fvb2ZkUyttVUhqV3hUbHZFZUpoWEN4?=
 =?utf-8?B?WFRvQ1MxMlRUdFdiZTgxQ2U2RXZ6djg0QWNFVE5HMW9ndkVWeWd2dW5qajFw?=
 =?utf-8?B?TXlZWnFhbWtHYVpwbzBJSjJVdkVJeU4vMzRueFhzUEpZazdNVTd3N1FHbGJF?=
 =?utf-8?B?ek5WR2h2TURFQnRuTFk4aVJpWWVJOXB2OHFOeUdZRXJ2RU9FbjJTT05iaWhu?=
 =?utf-8?B?T3RYY1BuNzI4TEY2dzg2b1ZZcitQT3ZWZG50U1k0eW9MNnFVL1FHYmQyOVMz?=
 =?utf-8?B?SW1BOFIzOFpKVmR6RG8wYTNtWWE0aE44NVAwNDhvQ0hwKzVyN3FNTEVKWlFP?=
 =?utf-8?B?d01aSjZqS2U4aTVmRTZLNkdRTVpzUk5BVTVVU25FTENTb250NjNvQ3RRSjhT?=
 =?utf-8?B?WnRLbzZqU21heXlVM2RoV1lhUVExY1ZiN0s5K1AyS01Pbjh1ZVFOWDJZVTYz?=
 =?utf-8?B?OEUxdnQ2eHNIYUg3aHFxS2dic1JwSHhia1dwS1g4Y1Y3TkI0a0dPSkJjek9Z?=
 =?utf-8?B?NEw2VmhsOGNKKzc3bGhObVNybC9jUmxmNDNzMkxqNTE2VVBIaDd2UWFoUGVQ?=
 =?utf-8?B?cEtVUG41czZVSTl5RjllMytFRVlaWUQ0bVBMdE0wUk9tOHFhMEFxdGk0WkpR?=
 =?utf-8?B?Unc5WUZHL1ZyUkJXYlk5SG00NkhrRXVHMkFrUW14d29MRWRCRHZNVlIvL3pU?=
 =?utf-8?B?L0pDajdTRzNHKzQ5ZVBQNVMwVUt1QlV5WW1zcXFhcmRhM0o4Z0hrZmZsWmNR?=
 =?utf-8?B?UDAvdzZsTlhRbGNnM1pCR2hjMi8yMWI0NGsxVmpYb0dlYkhHeGEzaVczUUhx?=
 =?utf-8?B?enZSUFVKeXY5TUdkWnpxTGwvenpaTk55c1B4YWFNWGVnNE0xSlVUUGUrN0xK?=
 =?utf-8?B?dWVoZVlpWGQzK0Foc2J2UVJoZXE1N2F2MWlDZ3ZiV3JKVElDSXlCZW0yWHMy?=
 =?utf-8?B?OEMzZm51R0o3Zno5RVNMZmFvemR3eWQvanU4bmE0OHdFeUJZbnBYOTdZR091?=
 =?utf-8?B?RnNoREJkeW04UGJSMERadjlULzRIWERZNnNjR3JBd0x2Y1VINGR2WUFRN08y?=
 =?utf-8?B?NXd5RVhFU01hWEdIbzV3TmkyamFiQzRWK1NEcXJzdkhCMk9CSmplalk1cVVa?=
 =?utf-8?B?VEtocEszTzR3VEZGQzRYb3VDSXp4dk5zanRZeE1hWDdjd29Ma3ZKZSsvUWJC?=
 =?utf-8?B?OXJ2MUFVWkhiVWR1SkpQSE1NUWw3bTBveWVaVzNiUUZKRjM3TGt6WXJpT2hj?=
 =?utf-8?B?VWF0cEY3Vjh0MHBxYTdPUm5OQ0hUbHhXOVdJOFd4aUZwNUszVjdqanFtZXV0?=
 =?utf-8?B?OHRPTTNGOVphQXhRMDI2YllBdDdkQ09pTWUrUmFac1hORzdBWkF6R2w5ZTN2?=
 =?utf-8?B?bXlBdGc0TkVCejdaemdzQUxCYjRmdHlBMGhZNm5icGZQRFF6VFhrV00zRXN5?=
 =?utf-8?B?WU9PM3o5QmZDN2pBT3VQdFYwdk91TUtSekxXZ29CZlB4V2EyN1M5eGc3aWFs?=
 =?utf-8?B?citSMlplYk1wMHE3QTB4L2pVKzVoZ28yeUJrMG5wUE16cnZvalVpZ2UxQmUy?=
 =?utf-8?Q?jLKwivSu/S/7AKGqcX2k/GtJNCg3tI1MDyDE8zutNxVzc?=
X-MS-Exchange-AntiSpam-MessageData-1: tYvQSgZH8XRVNw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34de02b8-aabf-40d3-1b22-08dee865cd6b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:55:07.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuaS4CV2DzzmtPkthjoLNEQMuk0B3ki6yrGLV16KnMirHx7LcW9jR4YQxfZ16ArsTM870LdnEE3wddjunx6yJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

On Fri Jul 3, 2026 at 3:22 AM PDT, Eliot Courtney wrote:
> Currently, the FSP receive message code will try to allocate whatever
> was sent without checking it at all. But the actual size allowed is
> limited to 1024 anyway, so reject any messages over that size as bogus.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Merged into drm-rust-next, thanks! With the fix mentioned below.

> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index 53b1079843ae..7cd9604d1f4d 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -34,6 +34,9 @@
>  /// FSP message timeout in milliseconds.
>  const FSP_MSG_TIMEOUT_MS: i64 =3D 2000;
> =20
> +/// Size of the FSP EMEM channel 0 that we can use.
> +const FSP_EMEM_CHANNEL_0_SIZE: usize =3D 1024;

We should use `SZ_1K` here.
