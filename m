Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E613A3F2113
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815954; cv=fail; b=h2ISc7ACCGvCnK1pSK/w1C3V4s4lQtZINMmcA1FJ2LnlgwpWWaZB74N3SZjtiuliWsc6slSHT+RmOYVSXRTKKOXqpTrw3/h+J37XPPJ1X0aTlfVupquhoQoeHaiOoOJg//APkxDaJJ//FSrQ6CNwBYGWUrvOu+RgKQi1CJD+WvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815954; c=relaxed/simple;
	bh=05+CO0EWr6FcvZuexKj8TxFIFff06wcISNPSw/jyFH8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hB03AppuSCGfpqU5eFpTay014y0PhM+g78wBPqWDdZrDqWgu91IyLNka0nzviTQpAJww4I6h60E22EQzX6aAR6dgeAmJ9GAYiairbGfGct1sc6SE76jHd7c5mIKUZd84lImq+LI1ZjsW0Rvo5K8jBpFdXXfvAFZFXRAdsUgLFs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oQ1QFDOA; arc=fail smtp.client-ip=52.101.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oQ1QFDOA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZXjN2I6SGp7YT/G1PdxgIql6KoUFAqjvSvfWPwgug1DdmJS0oz124a+Ni2jG5BN4NP1qTcEQXpkEgpihV2cGeaikmnFJ4qT87ZphJF9HNv6eLSUFvM04vN1Yt/XKo5ng5AHYQd17AhhRog0y5XXNNDqoN1UGMi25igvvVclszPFCMwDFgT3UXGRyyKPHE5Chraph/2uSfqejyCBk99eL3/bVTIEi3WSEFlHiz6RvgggOBoPcdKqA9eucIV+Vju/rHnoUbdveWGm7rivaEpHws3/bDhBNhrTy59ongZcptPptkEiIrKIxbCv+tQ6p9GguRVaEKdMrxI1c7F7odmTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q20L/9ukzn1D/ckOCPXvrMO+Msnq/KLgjxNGzi/COdM=;
 b=GGPP9LehSpoPJz2OdxKn6SLHzKUHNJ2Aw/RDw3beIm4cRz65jJfX7hb5BU2qKCt6/YsOuDowrYilmlTdaWHva6blTRZQEye51+ZdZKUnLDsxWyrjINrSi1D9JWCglFQb06XzEqnpdx1emIQZIdbT4jlsVfxKW1g+Svh4L7wdAAYMrCgvFTsPAGcRqdbnRC4hHzBSUrGw40X8KgDPWXCoVFof8E4/XR4N6KBw5ZBQLchcH/92oNTjWLAayCI+hnHftD09iXgls1nOzFrPsKpZMtktdggX+BUZ7jes7Q+VxSuGSH+b+Xh5fdSWrk1wRBt6UmozBhQe/ALfPQzIXz8fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q20L/9ukzn1D/ckOCPXvrMO+Msnq/KLgjxNGzi/COdM=;
 b=oQ1QFDOATpyxEn5sC6mbhfnrIzrib6IOSw69InFSPbbVoqlcyUJ9rEQsNcNDL9jI8nnrnNCVGMD4bcW3GGaApwFsb7CbzaNE7tFJbvjfDO+k2wzGs9YJ80Z8kYhGbda7Ak11Wbjre+EVaC3T1i9Eq7FISQ7OgA5KIjxlfo3q9c2UhE9u6P1uPZNDe9ctHq11rIoFmh6z7NEPX/SiF9/yY+Cmf5ShBUZJGGs7QEJXev1rus4i0LizHnyZTH+BAlcaWEqT5GU9OmgbmsdRldo16uci2IsO5WkrFziMzPiwLkgSEKlIC4BJ38rLkBhLLtiWgEBvbFCuZ818vu2SiQr5ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 10:39:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:39:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 19:39:02 +0900
Message-Id: <DJMBI9CN2Z67.2T02SR8TAWEC5@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: read vGPU mode from FSP via PRC
 protocol
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
 <20260622194353.1308872-4-zhiw@nvidia.com>
In-Reply-To: <20260622194353.1308872-4-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0189.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: b110e7f3-6e23-4360-cf82-08ded693cf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|23010399003|1800799024|366016|6133799003|11063799006|4143699003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	UX+0sdhMQvKe1fcNUmalA4kpS5eKmLZ7uVORk2pSNWoCkG9qBzXr+WXBsoX99oj82Q7h9agCgxcHfCFsAFerN5N+NWO08g/eIzcVf5fGoe8ZcSbYXK7Vzx039kWnHmSm4KROznfikfXR0KDKjPIBl/xo+cSqOPy3vWVetT9YFswtn3MhpeLhU2edXe9qDWHNtfqQQbTrIhsjEsA6/yLsqV4eWwMXQn3ecwZ9KLrEBDdcQF8a8IfUVBBNZtvmZ61ZXkAvmbwdtg8aiCMWCyuhuCRr+4oq09DRYb9fn32S8BcjaYNOfw6130ZaHB1YTjBwnqKab/fCz9I9RfeovZDsCDfSCxIOKs7/Exwxzvma27xuzn4jWTErrx7RKhn87cfBWgfqljPYOuyed/zd6nQ0HtTUHDg2cFtCWzpbaQ/hQT/4XWM3gwfFKfRXd4laGINkGztL3eszoeZoZeajcQp4DffLMKKaRr3V1BqYsczn4oUYjww3sIFtxe0fYJas4sA3kO1AbsN6pt7XYPkbXSH1C4BKD9IQEcGrz7NA5d41rj3Xgb52PRY1JR/UzdFuFghFrJyN0fAb0V2j/fPWfBnhp4k47glbltO/EMrUz02q5kiWgaHZWmUlJOek/VXP6c68w1FEmslEOmaTQVm/eXYZHo9gx01ChcaKlLY8CrRoAJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzk5TWhSSlhNWVIvTXJwTGpTemxxaDRXUnJTbTdjQS8vMkdxaU45RW9PcmlH?=
 =?utf-8?B?aE1mYUZVWnFvVEpwcG5sRytMV2NWZWl2VVZwOXdsOFBMRFlhK0JBeTNhRUlm?=
 =?utf-8?B?ajE1V1lFTWNiRWhmSjJSMXBJaGd0ak50VWR3d0dzMFdmZDdMZTYvQU00UEFw?=
 =?utf-8?B?aW1qSnBXaGl3STArMUdEaCtid1BEU1hCV29hUDR6MmpRVmc3NnhOMnJmTVJs?=
 =?utf-8?B?WFlpOGZDa2ZWcHhMYy9DRGJERHNKN1JIL3FLS1BnMExaVVJRNzg2WU14Nk9H?=
 =?utf-8?B?WU9jUXYwMXIrbUhGdm1JclBya2FFdGhBaE05bHV2YlpEdXcvRXpiTHdhRkQz?=
 =?utf-8?B?eWwvMWZabHd0cjFUWVBjdXlmNzRiMVJIY0MrV0dQakZRajQ2NW1xMW1jWTFO?=
 =?utf-8?B?TlJ1OEdIaFowRGlPcjlsWEk1V3BrTU45TDdDZlc2NG45TDRzeFUxRGRMYUhi?=
 =?utf-8?B?NndLbFNMamY5ajdsWERlNTd5bzdlbStvSW9JeTFLSFhqYnRjcWhoa0x1MU5D?=
 =?utf-8?B?SGZzUVdnNThUeC9kRlR5V0dlWkZydVgvMktiOUZNN0d2Tk1BeGlHem5YOEF6?=
 =?utf-8?B?ZHdnMnc4cXkvQjltZG03QnhFbk96S1pvMmlpNXd0Y2pjTmZiZDZqaEtuR3V2?=
 =?utf-8?B?d2tVZXVhQVo5cDAvSUhSRkEwRXI2WmVBamFxdCtWcWVxUEZSZllpZ0lueTFT?=
 =?utf-8?B?ekwvaHc2RnBhei96RkNXUWxRNWJUSzhGVCs4NncvT09OcmNoSHN5RG1hcGNJ?=
 =?utf-8?B?ZjBTejA1cEdZMVdDZDBCRTVvNHJJM3pjbUtpMWtmRHR0VFhnRDJPcjlETTRU?=
 =?utf-8?B?bTNjdmNxL05RUXoxdm1qa3FvME1QWjVkTHRQUzBJSUtPSTZiNDVMS1ZTUG1h?=
 =?utf-8?B?ekxrbDcrcUZNNEFuUEYwbmhacmxsSllrVm52UEZJZjdlUTRyODRVa28zb1d1?=
 =?utf-8?B?MldWOUdJRjlNdnRDM0d2cDh5VnRJL28yY2MwNEpwNjlmNjNNMEZ2c1I4eStv?=
 =?utf-8?B?d3ptUzdydEY1c2ZVM2o1aThOTlZoZEtOZVRXWkR6MjJmUWpFdzhFWmhmUko1?=
 =?utf-8?B?VU1odUJhb1FCQzV5d2lkMnc5OG9KUXlNeFhMWk93UjJLRk9QWnhOY1NNb1ZT?=
 =?utf-8?B?T2ZXc2tYU2d6elI2LzR5VkFBbFJlSkFuVHR3OUJ1SmxWNHA4dFhGQURoT0tX?=
 =?utf-8?B?RnpEMkpWTnh6VzhhR2VKc05DdFhzYXdPVFFjTGRYa0dhYUYrSVU0cGhMWDZk?=
 =?utf-8?B?VDEwVUV5clFBZ0pZM1ZkbHV4clQyclpUYzc2WlpDcWZSSzJRQzF1ZGRtVFVB?=
 =?utf-8?B?TnJucGovTUxhM1poSjU0MDdERXpxdTJtQ3FCMURmTDJzTW93ekVQK09HSUNX?=
 =?utf-8?B?SUZqMVQrQW5JemY3bmZXRlRxckhGUW9jT2lobzNXWFZkd2lhZ1RHNTdKWCtJ?=
 =?utf-8?B?RWlZeXl4c21qVWZ6Qm53azQ0dWs0ZU1WK2JaS3BMeDNURFQwVU5Ec1ErYTUx?=
 =?utf-8?B?TUhvSmE3ZnlNeDRTVWhPWkh2cERzZzgzZndKY0xiSUFsUk0xbVQyZ1pDd3c4?=
 =?utf-8?B?OWl4eFNCMTRDK3hpelRPY0R2UFBtd0xENENGZDNHaUFGSUV1dDAwTEpYUnpV?=
 =?utf-8?B?RkRVSXpBMEpyQlNZWUxJODFMb0h0MkNwcFd4UGlpMTlxdS90Mnd0elFMNkpF?=
 =?utf-8?B?c2JLeHpIVSt1d0hOa3U2ekpGbXBCZlBneW5pUy9nTFJBUnhLYzV2N04vZmhm?=
 =?utf-8?B?RGlRNHlSZG1rSmlrZDAxa0U0MEZHM0RhMHRKYWNNaVdzZTg2Rkp3YTJDT050?=
 =?utf-8?B?eUUrQmpTNVNyOVhVdDdUMEhIRTgzdWRoSkdUTWhVYnhPbTB4citseEg2ait1?=
 =?utf-8?B?SmFYU3JubS9pK0xtYzd4eC9HZ0szQ3V0Z0tEbkRtNXZWdnExdzY5ZzNFK3VQ?=
 =?utf-8?B?N2lxZmVwSGdjUGtseUFOdzJ5U1JTSElYNDQ0d2E5bmNDQXNCYmd3Rk5uSE1B?=
 =?utf-8?B?WE44KzZJdVNMcUZWeGJadlQ5cEI0TlJxSFlQMEVycGdaR1g2bHF0cWJGZFlZ?=
 =?utf-8?B?d3NHYUMxc2tDdUNTQUZaWnZYMkVCalB3b3FzeUthczJGTmNEZjBEWlZZOEtl?=
 =?utf-8?B?eFZvczVZK0J6UldVNFlFbXlvMnRCSzNFMU1oYTZ6RFZWbUFWTlFPYUF1aWNX?=
 =?utf-8?B?anVCRWM5blBIOG1QMWV3aEdRVUpHRXhqVjFCaXFlNThCL2FkSytyN2taSEJo?=
 =?utf-8?B?NFdnWlZEMXphQVlKM0ZwRFQ2VmM4RDdkNlJGRkhXWW43WXF4dWVYaGg5NjQr?=
 =?utf-8?B?RC8wY3Y4MFNXTGRrNENzSFVNVXg3ZU5wMUpxcHFVMGpYWXR2Z2x2RHhUZDVB?=
 =?utf-8?Q?25u4dUyUH53tJL7T2weJ52M6I/lNeelS+tNGCoeaaGGYW?=
X-MS-Exchange-AntiSpam-MessageData-1: 10JNOxPjF6YK8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b110e7f3-6e23-4360-cf82-08ded693cf1d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:39:05.9411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf0DKkz9kD4Ooy44x0K4XJ5nMMXcACjH8nNfEvi6OD6hdHNpq0DyxZNykbre+l1us8cMvKjchBWnlPbYZvZa7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:
> Add support for querying the vGPU mode configuration from FSP using
> the PRC (Product Reconfiguration Control) protocol. PRC is an API
> system exposed through FSP's Management Partition that allows querying
> device configuration "knobs" without firmware updates.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Thanks, this is looking really solid now. Just one comment below.

<...>
>  /// Common MCTP and NVDM headers shared by all FSP messages.
>  #[repr(C, packed)]
>  #[derive(Clone, Copy)]
> @@ -84,16 +190,27 @@ fn new(nvdm_type: NvdmType) -> Self {
>      }
>  }
> =20
> -/// Complete FSP response structure with MCTP and NVDM headers.
> +/// Common FSP response header with MCTP, NVDM and command response payl=
oads.
>  #[repr(C, packed)]
>  #[derive(Clone, Copy)]
> -struct FspResponse {
> +struct FspResponseHeader {

nit: Can you move the extraction (or rather, the renaming) of
FspResponseHeader into its own patch? We want to stick to the principle
of "one patch does one thing" as much as possible.
