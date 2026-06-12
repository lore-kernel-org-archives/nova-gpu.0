Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB0386428
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275577; cv=fail; b=AdWBNtDsqsgwPu+AGZfZkz6zni9iYUFsjFOzdxjEN1W++p7D6kcRp+vYKCp7rr4IqwMqeT66GmN9IrebgZJO1JOO0u5mnAjwPIyutodOVqNovy1eLo+subWRBF6Ne0RaRdceH17gfoYRXq/vdmZvaqJV03X318+gnp3Xh0p2VbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275577; c=relaxed/simple;
	bh=p7aFyFcgsV1kQpfSSr1Lg8d6jgQ6opynBtjIitDj9aU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qcZEDxPDk/yRhw8vBgb/8s7gIzDJcKwPQSDhPZ5pUMSlZU2S42mFMQtk85N/2ngIUfugki+XK9tehDrs1m66S/Pxa8xE4wmsJ/Eeb/Eti1Cn8S1ZY5efzTWyECqTsHl56X0cHhUpT43pJZWxqeKt66umtXfXjqhpjxRvaK0fvC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X0nZzcja; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X0nZzcja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G00naYAb9dexcisSpVOdKFveQ0gSjygW7wD9XuNeYXR7IKBLhdJIZACVHEmKavitLx3eMM4KyrT9TNnKeszGcDRyndLVi++NpJA0sP1oS8e7WUNXXPm8K+7p9YiQUABQWCZe9BizuzavghGdkiTSbzRWVupHaOQiHvbZMCsgjRAgu4XOf65jaiCZ5Zx6w+0RRqwRpLhgqZQiloTnlU4dgEfD1Ct6WNiuym/E5ez/QCCwEPvU0Cg474qBM/auk3X6p731NjqsyFN7ScSHINWEhXEfgRuPK5eCXM3UtV4weMBzcYdkmJGuUk8kF4G8QXYvw0FAwP9ZeFxU31umu9GscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0uqe+AfY1mfnP/FaVm8CJs2ldK5Y/Bbm29JmUkEd0E=;
 b=OOTIODSVIkqg2esb7hGIVuRW0MZ4FWbIYLKQpoARri6MAmJbvyBPrKunDXmfnAf4fcoGxdiboGyrOgiT6hVwERPkkC/vVXrJHWXNKARqAyNFYeiptMf8RjMxy86sDVUpzphJBI/cvrEzupKKq78lXeEXgPNx/NfFxfeOjd5jvjDoPwJz7Ixoxlz2dL8Il6g6KqaIuR1/s3fCu7umbW6j4WQ881tKfJYdOkynt7BJfiAOdWl2bDKgZw7BuaPkzql5PpPMGnbor0jmYX5wHluxSuKsFFE5Luf8wve9xXbe4K4uwOzf2APCsNrsla74Yf81VW91E8ISxRVIAFKl/LL+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0uqe+AfY1mfnP/FaVm8CJs2ldK5Y/Bbm29JmUkEd0E=;
 b=X0nZzcja+4AsUfv4Qy18HcL9RuBmKG01+sih2ZODup5zna1BcuY0lONSI6XeG85MSEkKSJ/tZp1SvQtEScP/5vFU7XacvDJmWk7PlSL9MAsAUU9l7ZcLE4UP4bh7RzG7eF8KxH8iLM/E/dG/FdASCRGE+gYH+21gFTblwdsYya5ZqYu+RIhwJlSE7LpU31zdrKafMOqeW8BYB+RTYc3O4x9h1kyADZ0UOAQgmlHMP7Ukfub9PhH0oiV4MIjA4+54gEXRDN7fyhrBpXotmEOW6BYybIGeZUScCyRQ1WXokxmKCHtZ/TZDCCYKflWu3sT739YqyIOk1fMwa/Us2FgqfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 14:46:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:46:06 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 23:46:02 +0900
Message-Id: <DJ75HKIOTSNB.2TVN5UO6XIVW9@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-4-ttabi@nvidia.com>
X-ClientProxiedBy: TY6P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: a0778a33-52df-4811-ef70-08dec891552b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|3023799007|56012099006|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p1asf/fOjmk7877ARyzOed4Qw/jUflO6F5taNPavBDhdcXmLqLK28d/SysW2R2/R88AcWrmGI/pmcU/Tt0hhcEW//5WAO8HUzHKeZoLlOF6rTRpAiUYAh0F3fHH3vxBUnPz7R8z+fOYrncaCE3JTTxXiFhvM7Ifw1LyEitoqZ0i0TusySDjJozKinv7noqZzysT0IVGVkq2jDohC7SkK36wfxtH9XzazrbowqFbWW/ln47oVBMragn15zhV7YH+uyLBcm7fnbYWmB8ONQM+xh3h+Wsh5D2ui3m4Hh/kA6irKKTBwaZjnr0CzP+F1/AgOG7MEjQJ5FaoAG7f5qs9zff8/3IuI2LAjL89HP3Tbb89abko3gAapTG/qcJ4UEyC+xg43Fi0aiTwMSjPDPHpKRrh+Wjt3VirmFK1dG4ucLcNlR7vZmHXYh15RTMvPGrkbRwvfJpwAcM7ChpXrJdub7472zvAvNagvj/CweA9t7UTDD5fe6o4hmZoIh13+9EaVd+8T9ryS9DT3xqONjAjL4P/XRoKBfSHNYHMachhDG2+W9co+orUl/YTMr2x+2qHl2EjWFur3ys5nvR/3iEtpBW7gRcJNxyHmcLl+WhR2yHS9S8jsr1uBdg31FTLVMpMxGps72iA3Abe5L7eglyrRQU95OKKtacJUhFzorq/QYQHzYOWWo5/c2C0SCBFTPMrN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(3023799007)(56012099006)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGV1MGFTd24xVElyWm9rMjBUZGl3U245OGdmQUxRdmVUQWY5bmU5L2JUR2gx?=
 =?utf-8?B?cWNVTlpzTVhhRTBadDBCUnpZa0ppbjJDbUpGMDBuZDNPdDZNNXJZSVJoWFdk?=
 =?utf-8?B?NEJhSkgxTUpjR1RpTVBvVGVNdERQaDBOZ0NwNFVpSHhmTGViVG5TU2YvSFgv?=
 =?utf-8?B?NFBkVkxTNVRlNCtReVp5ZllxZ0NwQlJ4ZmpWRVErVHozV3RWWkhHVWNCTHEy?=
 =?utf-8?B?NlNzT3ZqcExGOGxCOG5mV2IwdHZHc0RRcWNkci8veTVsaWp5ZCtSQ3N1cHZL?=
 =?utf-8?B?bTN3cjV3ekpMR3NIbGxuZUJ3c2U5MU1RbUxlVy9xOHFoQlA3K01sYnBYT1pa?=
 =?utf-8?B?a29BVDY0TEt0N3BJTml6THRNYlpTeUpFWUtpTWpkVVM4WnNhWG13QzVPZzZN?=
 =?utf-8?B?SzJqTi9RVEtXVWVtQXNEQzdhUHV2RnBEMHlqLzIvR0NMUXNzRElaSG5vTGJH?=
 =?utf-8?B?TkF1amhqRzZvc0E0QnZwYmc3VmgyenRFNXd6VzI2ckRsVzYvVkZCQkZ6M3E1?=
 =?utf-8?B?Y1d2ZFBhMVVjdWpVUFA4aUNxTWx1WHZNV1dMNGxVQWxNZXVEUFVqU2xjZjha?=
 =?utf-8?B?YkF6RGI0cXMzVUVWWXU4VDljbUtwUWlxODNmcEpGT1ZralBYcjhxQTJkMmUw?=
 =?utf-8?B?NjJwVmJQK3BLbkVETU5NUjJuZjFSblhMeGhJSEVvK1JacGVWSFlpYnlqc3Rm?=
 =?utf-8?B?cVNMcWFoWkllWFRsUnBOR3VnN3lHVjh1TGt1eTN6WitObWpjTEZKOXNSS1ps?=
 =?utf-8?B?dDNEdUk4ZU0vanVwaUxMdHFzNzN2YUE4eDFZNjJxYjFVTVJTTVFmeHJ6WHBX?=
 =?utf-8?B?dnptdW5MNEppRi8waURKb2w1YTE4TStrenBhSjVHWDljTlQ3MGdDeUdiNGUz?=
 =?utf-8?B?S05TajJBZ3IxNDI1b3FQc00rNFVyY3R5UWQ5c296a0N6ZlNYWHB5WTNmdkNV?=
 =?utf-8?B?MEtoUmxYVk8wdC9xWE5MN29QNmxOcFpERWN6UGZBWjliaGZNVE1zZVlmUDVs?=
 =?utf-8?B?WHR5UmtKandEenRrbFBuTHM3S1NGQlJyeDZ1V0VQajJ5ZjRwS0NKUGZZd3hF?=
 =?utf-8?B?Z1pCYTFweDhZT3ZielNhbFVHcUZyeWd1ZjRkaVM0UUw3RVVxMVFZajYvdGdz?=
 =?utf-8?B?Vk1USUVVNncvZWcrb2F6azdOQWZldTJ5TzhuYkJETGVqcVNXTngvdyttM1NH?=
 =?utf-8?B?ck13NlZjY3JqZzArV0RDL1JJUlJTamZYSi9PSnpnSmRJS3dzRUI2WGVaT3F6?=
 =?utf-8?B?Z1ZtQndWZXdGK3AvYWM1N2NaWnRvdi9XdEFSandQTWwzU09OK0s2eXhaTlRn?=
 =?utf-8?B?ZlFmWHAxNW5DTDlLUTlOVHd2Wk9JVnJyakw1ZXRUY2JPRlovcEx0Y3laTm81?=
 =?utf-8?B?Q0hpZ21PQWVkYVZIcDhpZDZaYlZrYkMwUXYvd25RSEI1d1gycDlEWDVNRVpY?=
 =?utf-8?B?U3hOZzJvS09IeVo3Y0dZQmN0Qjd4TXRWV2lpdUZCalhIa1FjVGUzQm9vUVdK?=
 =?utf-8?B?d0hNTnQydVVsaTdSSGVpMGF3WUQrUWJEZXh6RE1mbzJZWHAzSmhlekx2b3Yx?=
 =?utf-8?B?VGx2Q1VmWE45bjBkUHdnMDJpSlMyWDVSZk9OVzVDOHlBUFRKVndsdGtpTWN1?=
 =?utf-8?B?cmlJWGdITVFNaGpYSW9aTEVKVFdYWE9sQnMzWkM2L0x6MWFNNXMvVnoxQzdn?=
 =?utf-8?B?bWloNWJ0am1DY0xlOHpoN1ZIbEl2MVZPSGZPaXIxSFFRdmx0bEo5VkIyZHl6?=
 =?utf-8?B?Z3dyK0IvdW14RjlBNzlva2tKODJoNmRWaldsRjZsQllwZ25xU3JLS3BtQnc5?=
 =?utf-8?B?WVlnKzg2bk1leUN5YkVUNU41QnlQTVlqWmozNFJpL2pLVXlwcXBkQ1BiR3dU?=
 =?utf-8?B?dnEwcW5lRGQ2NWg3Y2w2czZDeFowSWpoN1UwSE5BcDRiT21GVm5qeDFIdTlP?=
 =?utf-8?B?UTcwRStkNWxRM0ZkTjEyd20zV1NRdXJzRmt5OVNPSExTaUU0NDlXVCs3Z1dF?=
 =?utf-8?B?NEJQVG9ZQ1F4T1lGUGpRUW54RXR2RUdqVXFSYmxLOXZpaEtoYVpGV2o1aWc5?=
 =?utf-8?B?bjMzb1BENDdVSjJteENpcFliVzY3RjMrUUVaSFZMd2pmVHAzMHFOVUhaNFUr?=
 =?utf-8?B?NGlDVmJzaHd5eWdYY3RHdjBycXRrZjYyZFQ0Ylg2cS91NnVibGV2NE0rSktN?=
 =?utf-8?B?NllUaGJ4QVlqQkp5a2IrUTNoVG9QOFdVM0YyTG5KN3VwOXNtcWpzeVlrT1Nv?=
 =?utf-8?B?L0RoWjNYQUlGb054akF4Y3VTVDZOYmV0aTJmajZaYlM2Rmwzb051RjhOd3Az?=
 =?utf-8?B?Y0RRY0ZUQ0xXWmZpc0k1UnRQd0tKZi9XT21lN1pEN0EvR2VpNFdFdmhDYzg5?=
 =?utf-8?Q?zEQv+pj66meiawjm78/vMi7Pvq+PTrOeQ5a6QnIGLQA2E?=
X-MS-Exchange-AntiSpam-MessageData-1: g8XBCow8JXtT9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0778a33-52df-4811-ef70-08dec891552b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:46:06.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6fImgFe204RYhwygIomYIYeyCXx/Ayjo/Bepf3P1P29dgKCl4qd+JJ9eQLQgMLCqrDI8K1QJA3OUYL+p+lOOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

On Thu Jun 11, 2026 at 2:49 AM JST, Timur Tabi wrote:
> Add the Tlv struct and supporting types for parsing TLV (type, length,
> value) firmware images. TLV files begin with a 4-byte magic header,
> which must be "NVFW" for Nvidia firmware files.  This is followed by a
> sequence of blocks each containing a 4-byte ASCII tag, a 4-byte
> little-endian length, and a payload padded to a 4-byte boundary.
>
> Tlv::new() validates the entire image up front, so that the iterator can
> subsequently yield blocks without fallible parsing.
>
> Also add accessor methods for the various encoded types that will be used
> by the driver.

Thanks for putting this together, this is quite an improvement.

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  Documentation/gpu/nova/core/tlv.rst | 172 ++++++++++++++++++++
>  drivers/gpu/nova-core/firmware.rs   | 239 +++++++++++++++++++++++++++-
>  2 files changed, 410 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/gpu/nova/core/tlv.rst
>
> diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova=
/core/tlv.rst
> new file mode 100644
> index 000000000000..8223605daa6b
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/tlv.rst
> @@ -0,0 +1,172 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +TLV Tags in Nova Firmware Images
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Nova firmware images use a Type-Length-Value (TLV) format to
> +encapsulate firmware components and metadata. The TLV file begins
> +with a 4-byte "magic" header that contains the string "NVFW".
> +Following the header is a sequence of TLV blocks.
> +
> +Each block consists of a 4-byte tag of ASCII characters, a 4-byte
> +length encode as a little-endian non-negative integer, and a

"little-endian unsigned" would be more precise (non-negative can also be
understood as "signed, but >=3D 0").

> +sequence of bytes, the size of which is equal to the length rounded
> +up to the next multiple of 4.
> +
> +::
> +
> +    +------+------+------+------+
> +    |  'N' |  'V' |  'F' |  'W' |  Magic header
> +    +------+------+------+------+
> +    |  Tag (4 bytes, ASCII)     |  TLV block 0
> +    +---------------------------+
> +    |  Length (4 bytes, LE)     |
> +    +---------------------------+
> +    |                           |
> +    |  Value (length bytes,     |
> +    |  padded to 4-byte align)  |
> +    |                           |
> +    +---------------------------+
> +    |  Tag (4 bytes, ASCII)     |  TLV block 1
> +    +---------------------------+
> +    |  Length (4 bytes, LE)     |
> +    +---------------------------+
> +    |                           |
> +    |  Value (length bytes,     |
> +    |  padded to 4-byte align)  |
> +    |                           |
> +    +---------------------------+
> +    |         ...               |  More TLV blocks
> +    +---------------------------+
> +
> +Values
> +=3D=3D=3D=3D=3D=3D
> +Values are one of three types:
> +
> +1) Integers, encoded in 32-bit or 64-bit little-endian format.
> +2) Strings, encoded as-is and expected to be ASCII only, without a null =
terminator.
> +3) An array of bytes.

I think it's worth mentioning that the type is tied to the tag and not
encoded in the format.

> +
> +
> +Common Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +These tags appear across multiple firmware types.
> +
> +``VERS`` (string)
> +    Human-readable firmware version string, indicates the version of
> +    the firmware.  Present in all TLV files.
> +
> +A TLV image contains either a ``BLOB`` tag (firmware embedded
> +inline) or a ``SIZE``/``FILE`` pair (firmware stored in a
> +separate file).

We will also want to specify what happens when neither BLOB nor FILE
exist, or when on the contrary both or them are present.

> +
> +``BLOB`` (bytes)
> +    If the firmware microcode binary is stored in the TLV, this tag cont=
ains
> +    the actual firmware image bytes.
> +
> +``FILE`` (string)
> +    If the firmware binary is stored as a separate file, this tag contai=
ns the
> +    name of that file, assumed to be in the same directory as the TLV.
> +    This tag is always paired with ``SIZE``, so as to allow the driver t=
o
> +    pre-allocate the buffer before loading the file.

Note that `request_firmware` outrights reject paths that contain `..`.
These should probably be excluded from the allowed paths here as well.

> +
> +``SIZE`` (u32)
> +    Total size in bytes of the firmware image to be loaded from
> +    the companion file named by ``FILE``.

We also need to specify what happens if we have a `FILE` tag but no
`SIZE` or vice-versa (presumably, this should be an error?).

Another thing I think we should also formally specify: how are duplicate
tags handled?

> +
> +GSP Firmware Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Used when loading the GSP (GPU System Processor) firmware
> +(``gsp.bin``).

Do you mean `gsp.tlv`? (same for other files).

> +
> +``SIGN`` (bytes)
> +    Cryptographic signatures for the GSP firmware, DMA-mapped

That we DMA-map them is out of scope of the file format imho.

> +    for the GSP bootloader to verify before execution.
> +
> +Booter Firmware Tags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Used by the Booter firmware (``booter_load.bin``,
> +``booter_unload.bin``).
> +
> +``DAOF`` (u32) - ``os_data_offset``
> +    OS data section offset within the firmware image (absolute
> +    byte offset). Maps to the DMEM load source.
> +
> +``DASZ`` (u32) - ``os_data_size``
> +    OS data section size in bytes.
> +
> +``CDOF`` (u32) - ``os_code_offset``
> +    OS code section offset within the firmware image (absolute
> +    byte offset). Maps to the non-secure IMEM load source.
> +
> +``CDSZ`` (u32) - ``os_code_size``
> +    OS code section size in bytes.
> +
> +``PLOC`` (u32) - ``patch_loc``
> +    Signature patch location -- byte offset within the firmware
> +    image where the selected signature should be written.
> +
> +``FUSE`` (u32) - ``fuse_version``
> +    Fuse version of the firmware, used with the hardware fuse
> +    register to select the correct signature index.
> +
> +``ENID`` (u32) - ``engine_id``
> +    Engine ID mask identifying the falcon engine this firmware
> +    targets.
> +
> +``UCID`` (u32) - ``ucode_id``
> +    Microcode ID used together with the engine ID to query
> +    hardware signature fuse registers.
> +
> +``A0CO`` (u32) - ``app0_code_offset``
> +    App0 code offset -- start of the secure code region within
> +    the firmware image. Used as the IMEM secure section source.
> +
> +``A0CS`` (u32) - ``app0_code_size``
> +    App0 code size in bytes.
> +
> +``NSIG`` (u32) - ``num_sigs``
> +    Number of signatures included in the ``SIGS`` tag. A value
> +    of 0 indicates unsigned firmware.
> +
> +``SIGS`` (bytes)
> +    Concatenated array of firmware signatures. The size of
> +    each signature is the total length of the ``SIGS`` value
> +    divided by ``NSIG``. The correct signature is selected
> +    using the fuse-version-derived index.
> +
> +Generic Bootloader Tags (FWSEC)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +Used by the generic bootloader (``gen_bootloader.bin``) that
> +loads the FWSEC firmware via DMA on Turing GPUs. Also includes
> +the common ``VERS`` and ``BLOB`` tags.

The common tags are not explicitly mentioned for GSP and Booter - I
think we can remove that last sentence.

> +
> +``CDSZ`` (u32) - ``code_size``
> +    Size in bytes of the bootloader code to copy from the
> +    ``BLOB`` tag and PIO-load into falcon IMEM.
> +
> +``STRT`` (u32) - ``start_tag``
> +    Start tag identifying the IMEM block where execution begins.
> +    The falcon boot address is derived as ``start_tag << 8``.
> +
> +RISC-V Firmware Tags (GSP Bootloader)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Used by RISC-V-based firmwares such as the GSP bootloader
> +(``gsp_bootloader.bin``). Also includes the common ``VERS``
> +and ``BLOB`` tags.

Same here.

> +
> +``CDOF`` (u32) - ``code_offset``
> +    Offset within the firmware image at which the code section
> +    starts.
> +
> +``DAOF`` (u32) - ``data_offset``
> +    Offset within the firmware image at which the data section
> +    starts.
> +
> +``MFOF`` (u32) - ``manifest_offset``
> +    Offset within the firmware image at which the manifest
> +    starts.
> +
> +``APPV`` (u32) - ``app_version``
> +    Application version of the firmware.
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 2749c196416d..888a426b7b41 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs

Since the code for `Tlv` seems to be nicely self-contained, can you put
it into a sub-module (`firmware/tlv.rs`)? This will reduce the amount of
stuff in `firmware.rs` too.

> @@ -11,7 +11,7 @@
>      device,
>      firmware,
>      prelude::*,
> -    str::CString,
> +    str::{CStr, CString},
>      transmute::FromBytes, //
>  };
> =20
> @@ -684,3 +684,240 @@ pub(super) fn elf_section<'a>(elf: &'a [u8], name: =
&str) -> Option<&'a [u8]> {
>          }
>      }
>  }
> +
> +pub(crate) struct TlvBlock<'a> {

`TlvBlock` and its members can be private IIUC.

> +    pub(crate) tag: &'a str,

This should probably be a `&'a [u8; 4]`? `str` is variable length and
technically UTF-8, using a 4-bytes array is the more accurate type.
Doing this also simplifies `parse` a bit.

> +    pub(crate) value: &'a [u8],
> +}
> +
> +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload l=
ength (bytes, excluding
> +/// padding to a 4-byte boundary).
> +struct TlvBlockHeader<'a> {
> +    tag: &'a str,

Same here.

> +    length: usize,
> +}
> +
> +impl<'a> TlvBlockHeader<'a> {
> +    const SIZE: usize =3D size_of::<[u8; 4]>() + size_of::<u32>();
> +
> +    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass =
a longer slice).
> +    fn parse(hdr: &'a [u8]) -> Option<Self> {
> +        let hdr =3D hdr.get(..Self::SIZE)?;
> +        let tag_bytes =3D hdr.get(..4)?;
> +        let tag =3D core::str::from_utf8(tag_bytes).ok()?;
> +        if !tag.is_ascii() {
> +            return None;
> +        }
> +        let len_arr =3D <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok(=
)?;
> +        let length =3D u32::from_le_bytes(len_arr) as usize;
> +        Some(Self { tag, length })
> +    }
> +}
> +
> +/// Sequential scan over [`Tlv`]. Unlike [`Tlv`], this type carries a cu=
rsor (`pos`) into
> +/// the parent blob.  It is not interchangeable with a fresh [`Tlv`] vie=
w of the same
> +/// bytes.

The last two sentences are basically implementation details - are they
needed in a public doc?

> +///
> +/// # Invariants
> +///
> +/// `pos` is a byte offset into `tlv.data` that always lies on a block b=
oundary (in the sense
> +/// of the [`Tlv`] invariant): it is either the start of a well-formed b=
lock, or equal to
> +/// `tlv.data.len()` (end of iteration).
> +struct TlvIter<'tlv, 'a> {
> +    tlv: &'tlv Tlv<'a>,
> +    pos: usize,
> +}
> +
> +impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
> +    type Item =3D TlvBlock<'a>;
> +
> +    /// Returns the block starting at `self.pos` and advances the cursor=
 past it, or [`None`]
> +    /// once the cursor reaches the end of the data.
> +    ///
> +    /// The body relies on a number of `unsafe` operations, because [`It=
erator::next`] can
> +    /// only return [`Option`], not [`Result`], so there is no way to re=
port a parse error
> +    /// from here.  That is why the entire TLV stream is validated up fr=
ont in the
> +    /// constructor.  By this type's invariants, `self.pos` is always on=
 a block boundary
> +    /// into already-validated data, so each block is known to be well-f=
ormed, and
> +    /// therefore the unchecked operations cannot fail.

Second paragraph also leaks implementation details and is not relevant
to users.

> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.pos >=3D self.tlv.data.len() {
> +            return None;
> +        }
> +
> +        let tail =3D &self.tlv.data[self.pos..];
> +
> +        // SAFETY: `self.pos` is on a block boundary (`TlvIter` invarian=
t) and the check
> +        // above gives `self.pos < data.len()`, so by the `Tlv` invarian=
t a complete
> +        // well-formed block starts at `tail`.
> +        let hdr =3D unsafe { tail.get_unchecked(..TlvBlockHeader::SIZE) =
};
> +
> +        // SAFETY: same header bytes as validated in `Tlv::new` for this=
 offset.
> +        let header =3D unsafe { TlvBlockHeader::parse(hdr).unwrap_unchec=
ked() };
> +
> +        let stored_size =3D header.length.next_multiple_of(4);
> +        let advance =3D TlvBlockHeader::SIZE + stored_size;
> +        let payload_end =3D TlvBlockHeader::SIZE + header.length;
> +
> +        // SAFETY: `advance` and `payload_end` are exactly the stored an=
d logical payload extents
> +        // `Tlv::new` accepted for this block.
> +        let value =3D unsafe {
> +            let block =3D tail.get_unchecked(..advance);
> +            block.get_unchecked(TlvBlockHeader::SIZE..payload_end)
> +        };

As Danilo mentioned we should get rid of these `unsafe` blocks. I think
returning `None` if an error is met is fine: an error is, technically,
the end of the iteration; and we have validated the whole file in the
constructor, so they won't happen anyway.

> +
> +        // INVARIANT: by the `Tlv` invariant the block at `self.pos` occ=
upies exactly `advance`
> +        // bytes, so `self.pos + advance` is the next block boundary (or=
 `data.len()`).
> +        self.pos +=3D advance;
> +
> +        Some(TlvBlock {
> +            tag: header.tag,
> +            value,
> +        })
> +    }
> +}
> +
> +/// The payload of a validated TLV (type, length, value) firmware image.
> +///
> +/// TLV firmware images start with a 4-byte "NVFW" magic header, followe=
d by a sequence of
> +/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and=
 a data payload
> +/// whose stored size is the length rounded up to the nearest multiple o=
f 4.
> +///
> +/// [`Self::new`] checks the magic header and walks every block: tags mu=
st be ASCII,
> +/// lengths and padding must fit without overflow, and the byte stream a=
fter `NVFW` must
> +/// be exactly partitionable into blocks (no trailing partial header or =
slack). After
> +/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse=
 failure.
> +///
> +/// # Invariants
> +///
> +/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magi=
c): it is the exact
> +/// concatenation of zero or more well-formed blocks, with no trailing p=
artial header or slack.
> +/// Consequently, any offset `o` into `data` that is a block boundary an=
d satisfies
> +/// `o < data.len()` is the start of a complete block whose header parse=
s and whose stored
> +/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` b=
ytes) lies within
> +/// `data`. `data.len()` is itself a boundary.
> +#[allow(dead_code)]
> +pub(crate) struct Tlv<'a> {
> +    data: &'a [u8],
> +}
> +
> +#[allow(dead_code)]
> +impl<'a> Tlv<'a> {
> +    const MAGIC: &'static [u8; 4] =3D b"NVFW";
> +
> +    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if t=
he image is malformed.
> +    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
> +        // Verify that the magic bytes exist and are the correct value
> +        let magic_len =3D Self::MAGIC.len();
> +        if data
> +            .get(..magic_len)
> +            .is_none_or(|magic| magic !=3D Self::MAGIC)
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        // The payload is the contiguous sequence of TLV blocks after th=
e magic.
> +        let payload =3D data.get(magic_len..).ok_or(EINVAL)?;
> +
> +        let mut pos =3D 0usize;

You can work directly with `payload` and avoid storing the position in
its own variable. Just make `payload`'s declaration above `mut`, and
then:

> +        while pos < payload.len() {

    while !payload.is_empty() {

> +            // Get the next TLV block.
> +            let Some(rest) =3D payload.get(pos..) else {
> +                return Err(EINVAL);
> +            };

This can disappear.

> +            // Validate and extract the header (type, length).
> +            let Some(header) =3D rest

s/rest/payload

> +                .get(..TlvBlockHeader::SIZE)
> +                .and_then(TlvBlockHeader::parse)
> +            else {
> +                return Err(EINVAL);
> +            };
> +            // The `length` field of a TLV block contains the actual byt=
e length of the
> +            // value, but each TLV block is aligned to a 4-byte boundary=
.
> +            let Some(stored_size) =3D header.length.checked_next_multipl=
e_of(4) else {
> +                return Err(EINVAL);
> +            };
> +            let end =3D pos
> +                .checked_add(TlvBlockHeader::SIZE)
> +                .and_then(|p| p.checked_add(stored_size))
> +                .ok_or(EINVAL)?;

Here you don't need to add `pos` anymore.

> +            if end > payload.len() {
> +                return Err(EINVAL);
> +            }
> +            pos =3D end;

This becomes:

    payload =3D payload.split_at_checked(end).ok_or(EINVAL)?.1;

> +        }
> +
> +        // INVARIANT: the loop above walked `payload` from offset 0 and =
only stopped once `pos`
> +        // reached `payload.len()` exactly, rejecting any block whose he=
ader failed to parse or
> +        // whose stored extent overran. So `payload` is an exact concate=
nation of well-formed
> +        // blocks with no partial header or trailing slack.
> +        Ok(Self { data: payload })
> +    }
> +
> +    fn iter(&self) -> TlvIter<'_, 'a> {
> +        // INVARIANT: 0 is a block boundary, either the start of the fir=
st block,
> +        // or `data.len()` when `data` is empty.
> +        TlvIter { tlv: self, pos: 0 }
> +    }
> +
> +    pub(crate) fn len(&self, tag: &str) -> Result<usize> {

This method name usually means something different in Rust - it should
be documented (all methods should be, ideally), or even better renamed
to e.g. `tag_len`.

But maybe we can also just remove it, since it can be expressed as
`get_bytes(tag).len()`, and is only ever used in one place...

> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        Ok(tlv.value.len())
> +    }
> +
> +    pub(crate) fn get_bytes(&self, tag: &str) -> Result<&'a [u8]> {

For these getter methods as well, `tag` can be `&[u8; 4]`. Callers can
build a literal using the `b` prefix, e.g.

    let fmc_image_data =3D tlv.get_bytes(b"BLOB")?;

> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        Ok(tlv.value)

nit: can be collapsed into=20

   self.iter().find(|b| b.tag =3D=3D tag).map(|b| b.value).ok_or(EINVAL)

> +    }
> +
> +    pub(crate) fn get_u32(&self, tag: &str) -> Result<u32> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;

You can reuse `get_bytes` to avoid repeating this snippet (also applies
to the other `get_` methods).

>
> +
> +        tlv.value
> +            .try_into()
> +            .ok()
> +            .map(u32::from_le_bytes)
> +            .ok_or(EINVAL)
> +    }
> +
> +    pub(crate) fn get_string(&self, tag: &str) -> Result<&'a str> {
> +        let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)=
?;
> +
> +        // Handle the possibility that the value is null-terminated.
> +        let bytes =3D match CStr::from_bytes_until_nul(tlv.value) {
> +            Ok(cstr) =3D> cstr.to_bytes(),
> +            Err(_) =3D> tlv.value,
> +        };

The spec says that strings are expected to be ASCII without a NULL
terminator - and the NULL terminator does not carry any meaning in Rust.
So I don't think we should be doing that check.

> +
> +        // But do require it to be all ASCII.
> +        if !bytes.is_ascii() {
> +            return Err(EINVAL);
> +        }

Btw, is it bad if we allow strings to be UTF-8?

> +
> +        core::str::from_utf8(bytes).map_err(|_| EINVAL)
> +    }
> +
> +    /// Returns the `n`-th fixed-size chunk from the value of the TLV en=
try matching
> +    /// `tag`.
> +    ///
> +    /// The value is treated as an array of contiguous, equally-sized ch=
unks, each
> +    /// `sig_size` bytes long. `sig_size` is the size of one signature. =
 The returned
> +    /// slice is the `n`-th chunk.
> +    ///
> +    /// Returns [`EINVAL`] if no entry matches `tag`, if computing the c=
hunk's offset
> +    /// overflows, or if the value is too short to contain the requested=
 chunk.

This documentation is confusing - it start by mentioning chunks, then
suddenly signature vocabulary is introduced.

> +    pub(crate) fn get_nth_chunk(&self, tag: &str, sig_size: usize, n: us=
ize) -> Result<&'a [u8]> {
> +        let sigs =3D self
> +            .iter()
> +            .find(|b| b.tag =3D=3D tag)
> +            .map(|b| b.value)
> +            .ok_or(EINVAL)?;
> +
> +        let start =3D sig_size.checked_mul(n).ok_or(EINVAL)?;
> +        let end =3D start.checked_add(sig_size).ok_or(EINVAL)?;
> +
> +        sigs.get(start..end).ok_or(EINVAL)

This method is single-use Booter-domain logic, and feels a bit too
specialized for a `Tlv` API. The caller in `booter.rs` could do:

    tlv.get_bytes(b"SIGS")?
        .chunks_exact(sig_size)
        .nth(index as usize)
        .ok_or(EINVAL)?;
