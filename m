Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795158121;
	b=jKfrQvSb4JKe81pKCxxLNKGH0daH+Mb/e3UWKxLWXAQUT2QMKupybaVyS7qYDG80H2J9
	 Urmmrpcy/Eh4goHZt+rZLVFdkCTSmpvFfnnZV+QwKZQG32n9b7VX+6Gj01Fic3PoBbugj
	 rlj2kf/H9LcvJ78V3F/VV0ztBtxpheYAletb4GdelQ0pi8WRVxne+AHE8C3sQBJxHYfra
	 ZyX5xjH6jZIHVHUoxbZ84+/LZuQ61+bg83S+n+IG4mPVsJXRBKbM0TU2trnnXGrapYOs9
	 XQDREE16l+iKbBBUACgCqTbR8Z+Pkbl8TDZ8RO/pQareayY3fiMuBYuE7alU8MNhAsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158121;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jQqLH9Xi/E/0E6B08cCqWRIeWYUMUxo7ZAdBypSHuQ0=;
	b=LU+4h09vHxU/m0aTsUcIPZDsjSmvHpy69gp80x+jUryjJo3tMxG1Rz+MZVAcUr7PpZ/N
	 IYZwbGnLdtl7XCXVXeRu37QFsOT4Dy0sF3o4ZpNiZZ3U27IS0nv5ZxZbY/S/cHifwWI2y
	 EhaBK/ibY87T+vmvD2tVr9B9qaTARn6dooS1pJFkTDQByvmhB7jzRE3RglNZHZ6VSijE2
	 iYarDnji9KZ3tz3eXXlW3lHKVW0qJkwtOFBNyuuqhjc3xA8ea6Sev2/WCwV6Z89zPmmZc
	 TLpiX1S0Rh1TC/5SBUUdKatIUl+olXF52yOb2XvkaSHZKb6PQWedEQdawSJy8euq2Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=REbGLylp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10B606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 07:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E10B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=REbGLylp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeEoAuL6lsfFI2neBQQJenJ/rwIe9BuV3NJ17JgGg3p62Q83ZAxKr5tS5hKn9aJPCtilSUpX/eN8xc9POMIm60AfZ6DbDD3nSBWnRqg1o8tqDpBHaXOWj6yhRytAQqPlWJMXbHmsgmIItMTA6RscRAed+PQbOvvLGUelXRtBBrmcC2zQ+88cLXiizQUKq0PlsGIVHkskOkYV7LPAMzu9RiIbuXMtQzFeat42J1KohICSnlLNipxOJVojwrHoXHaHr6tJf7BhRU4+IzUVDOlg3oppbu19QWRBHxdFRucaziZqIR3SXT6hOq1+dB40l5Tc9Llkq6EyeqVBIEvlxF0U2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQqLH9Xi/E/0E6B08cCqWRIeWYUMUxo7ZAdBypSHuQ0=;
 b=IByf1Df2VETREbCZq3bgGlMT3n8OUMOCNEafHjcA/aCzUm1bYFB16KN7TVc2PcshSzI+P7H3WmcNgfckGmpS7Qh+XPD8uGWwlXLqj85pLCgE+C6jtO+ri7mDAHkVxIorSSsGXGBaa110TwGlQVQ4vl6JKvuek2lRX5w7/P3cP7dXxJjrH2JCsZwm5jzsrVI1CgNZCtMNFEMtRtdVMkN60LHot8OEGEm2zBqHhwihIaInKDQ5ddZ7tToldgMlOZ50QurV5cdEfF+JkxFREjC2pdNpzChwb7uPBVwqAV73gEc26BOCAUprpZr3A5rGK+WVwzC/wM2b7Cx97+yWAYh2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQqLH9Xi/E/0E6B08cCqWRIeWYUMUxo7ZAdBypSHuQ0=;
 b=REbGLylpyWrv1RQjXKLRFDqJTNb0u2DXfmg1ZQZuZtjnTRNfhm5i5coNjUji5EVSOGWeYq39SI6VBciWUALUrt71puHbN2u0erpCmevfq1Sbm4q8lJ7v2LzFVoRwTAZhX49Pk0xZU+NTZrzhY8nm/3AEUG0bf1pjBAKIwIaacW0/1NPmnbH28kpbBVefJ1a2Vma4EJgADXd3PJyTp/kKNrP/lXURR3tOTYLTF7wMDVlZ4Qzvzqh8qEihpq0h5B4oMN2E9ypSIDoGMcL8/pjXVGhgWA2cFF4Yh0rGIF5Nq+tZcGVFg4K/TcTgUz+jSEjrlYPVUTeGivZzbOXmjgBVuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 07:01:57 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:01:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:01:53 +0900
Message-Id: <DMZUFWHFA4V8.I8OXAFEOY9I1@nvidia.com>
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add TLV versions of WPR heap
 size functions
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-6-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: b040e4d2-9745-48f6-1d13-08df46d42a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|10067099003|4143699003|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xA5o21IkZVR7PfCcX8TyDd6wz+LPKRQbfPBm9NVmQxdd4we0Z9Je2m3oWZAdtyBHUS9F6R+0aeE9iZ4RoYZtz6BqYKbfaKI2LAQHWWAis4x70P2Pufo5iqXpefBjWNhjuOrXEb8Fk+Mx98ZIRi6AybZh6WkftZnIXO2SqFRTd3tFbP0DpuvzlUWZZSPwPh+OgSpkdPWkq0dxylnl42AK0Hse4SUfo6B0k6zV+FI3HphmeaZJadFToRoz8twPgwKMWAu2vfROemlaisgmHh2kIhiBaktppxtFZB3Gkeph6zGj7t1fDv/RzWwY4W+jilCBjmtiRFPNKXZfN8aZcW+pYBQby3DGfAEJNsnyRHk80mzbbIQLG3sohB9uQUHPYVsB3FgfmIWrzyIHPNnuVj+bnUiCK7JAov6dBw334qTY+zu7L57KjqdegHd52VaF9EXySeVMzLvmgYbdkHeOWEQkZ7g0tUj9HodbO61CuOf0i7jWUApa8d2QMQANkOiHbk0H+P8gk+X1HHVuqlXbxD7XxPPGNe+Ztmdl75CJevDM8eV9jhaXnrqrVCJzLo0Y6VwjHbMUqPlVy07Y3RgIzU0VTCbZwhYP0fV1qcw2De7mLX7J9P4RwwjNVPgIekQrIcDcFZ2xyEBToHPxu0dRpuUyuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1lwZlNCSFRvRFZxcDBjcmtsOHgzczFHU3EwWjRXcmVmL0FFNFRHNldkcVo4?=
 =?utf-8?B?V1A3d3RnR2FzbHVYc21HaUptTnNsUE5ua3RaQVc5V2hTejNxdEpOZ25XY1RQ?=
 =?utf-8?B?amFrZG1FQ2crb0x4aTdsWGRkc0p2aEVXZnJjc1Bkbm1zSHlKQVR6d0c2bzVz?=
 =?utf-8?B?QjlZOFVkWm1yYmR5WXlkdzNoSHg3VXR4U1BMcUQyblZyL3RpcDZtNEhNSnpS?=
 =?utf-8?B?V2x0NW0zTmM0SEI1SEVsUWtXR1BDMWFiY0haRGtCMTRNQmpGTTl2U2ZwUzZ2?=
 =?utf-8?B?b0RVTjNPZHVmZVplV0lHeldrNkk2TnJBRW5OSDNlWWp4MC9US0pzMVJqSTFX?=
 =?utf-8?B?Z20yVHBTVFFWK1VHZDN4YnViSExQeG5hWFVxb0Z3TkhDUGtrWS9NbkhjYkxL?=
 =?utf-8?B?MllldUYwZnhQSlE4ZnB2bkVWNmlRcDlFUUZpK3ZmcjNlWDgxcmh5TllTWlFI?=
 =?utf-8?B?S3o2NW91QlJjeWlNOTZGbVlJNGFzWlFoZUFSYVVnN2UwU1dUVDgvMGhWaWlz?=
 =?utf-8?B?R2dzbnhSbE91dDQ1TmlBQ21pZ2F5bDA1Z1VoK1hFRXRjUm9sc0ZKcUE3dWsw?=
 =?utf-8?B?NGNhK3lEY1RDUi9pSnZUR2dLZU9jSTB0Sk9EQ1pYMmVjcFdMNVJDQXg5d0Fm?=
 =?utf-8?B?bW9aU01iVTF2TlBKb1hBWmY3ZUs1Y3NYbUhqMTA0ZlIrVGdzNHRhcTNEaXNJ?=
 =?utf-8?B?cCt3NGhUQ3RJTXhvNS92S0w3U3hEQUh5ODNsMExOdUwvQzlod3k3UWY4SjVy?=
 =?utf-8?B?dTMxbnJVYUhGVjJ5NjNPY1VQTUFNMXpKK1FhdUNLQWJzbjh2MGVvSzg2ZWZT?=
 =?utf-8?B?aUY2bXp6MHU4aXZoY1FNNVlqVUVyb1UrSlFMUTNodEtTMzdOcDdkZ3hBV2lD?=
 =?utf-8?B?VFJhaUVDbW1HdGxISnJuSTJOZCtnZkdPMWdYYnp3bHQvUzFyME5INm40Y1o5?=
 =?utf-8?B?bE1SeC9lQzRrL01LL2s5alNYZ1ZzNlBucEFFb1pSOHhxNlVFOHdNZndkc2JR?=
 =?utf-8?B?cERhZlVPN1kxNkx2R2JQUDYzd3FKNHprdDd4NjlYcnAzeDVhaXZvcFFBTlRp?=
 =?utf-8?B?Z0tMVm5iUU84ZnhqR1dMaGdoZnMxNHFnSVRjUlVaRjlGTVJIaFNQaU5SS0x6?=
 =?utf-8?B?d0sxaDNmZDJqemJaK1ZTZ2FVeDFFOXFQNkVmNURYQTM2MFpVc01nbWJsQmNt?=
 =?utf-8?B?akMvalFTQmJyR09EUU4wWlNDaUhBSEJsNDg2OXZic3M3YjlwUEwvaDBwZm92?=
 =?utf-8?B?TTMya2oxK0JOV0E3VEVxY0ZpWk1WblNKTU5oMVdxZnBRVDZ0Z2ExZ3NsQVF6?=
 =?utf-8?B?dXA0eEFuTE9vejRCRzJjejhXMndSWVVxNDg5dTByeWxxQnFhY2RISTFTcnZ1?=
 =?utf-8?B?TTZxV0FiL09Tei9XWkRsWjNvTlBxWVVwUWNqODlzR2srTTc0Y3VlamtTdno5?=
 =?utf-8?B?dTFiT0V0YjY3dE5naHlzUjc2MHUzR3lpdzdTVDEvTnVpTE9vWjc4bkNyS1Za?=
 =?utf-8?B?T01MYmxBbkVscmpJVDhiWFJNNUhpR0prQlJTYjBVK1MzY1FWbVNCRm03L2dX?=
 =?utf-8?B?bitnbVdmdXZBVlIrQU1IRzJpNUVMWGpXSW1hSDlleTR3aXMwLytBMWtqdmhB?=
 =?utf-8?B?TUsyNVZaV0tBN2ZFVTNOMXBwZVJlTENsdU40K0hzdUNnNlYzU3dBYmZSVXlS?=
 =?utf-8?B?b29CYVc4ZE5nTWtwQnRTTGtFb29nZHovbEQ4bEJGZnZMTGxJRjhFNllqYjBQ?=
 =?utf-8?B?ZkhjWm5nMEg4L0Z4UGtTME5HeDZrMXY0NmRUd1c4OGQyV1oxZEt1S2U2ZVJn?=
 =?utf-8?B?TFNheUxDQ3RUN25PYzJ1YTh0RUNGeVdwaWNGZ1VJTXN6eVdPbnI4eVVtcmlM?=
 =?utf-8?B?dGFUK1R2T0hPV1BuNG16RjY4TFdEcU9PeEJ5ODV6clBFSGFGVEFkNUtOUmhY?=
 =?utf-8?B?cDdQbTZZR3c5Snh1dnhZV1NtVDdESWxkb1BMb3FwblpUd00xLy94Q0pnOHlP?=
 =?utf-8?B?dW9TeEJXdkdBdG1PK3QvTkw3N0MxQzRQbUcvL0pTMVVqMXNpeXkyQ3dGanJw?=
 =?utf-8?B?dTUyNElNOC9NdU5zZWEzeFdvcmF4dWtJbDF6a1dESG1tRFp0THpLZDcxenlQ?=
 =?utf-8?B?NkFjam5FdU90cytEWU9uU0FnMUZZVEIyOEcxdlpsc05Pdm1HY2tzZzZOL0hN?=
 =?utf-8?B?OFQzKytOVmxHYjgySEpKdkV3MFRKWStkaThOYmF0NDRqZlZBa1A2ZTVhdFZP?=
 =?utf-8?B?MW42aEhKQUc3cGZwbTkvOWpNeFVhSFhzMjdUV3p3QzFpTU1jd1NjWTR2V0ZN?=
 =?utf-8?B?MDlDMVJWQVZBL1dEWi9lRjZlR2ZzWGcya3dlMHcydDBQZG13T0pVWkV2dGRV?=
 =?utf-8?Q?xkGt+48+BmjWN85F+3VTCbEAudUaEr81sds8rpuWy28Ew?=
X-MS-Exchange-AntiSpam-MessageData-1: AhiaxCx+QC+eVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b040e4d2-9745-48f6-1d13-08df46d42a66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:01:57.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AebH99LCY+F5xhr5RZfT4v2z3ZIwI4c+k9JIPiPNEjq77dzq9LU1rTm9RuNtMgbOUAYjlsTqTK4mBx31VzhhkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Add TLV versions of vgpu_wpr_heap_size() and wpr_heap_size() to
> GspFwHeapParams.  These complement the same functions in LibosParams.
> We add them to GspFwHeapParams because LibosParams will be removed
> in a future commit, and the driver will use the GspFwHeapParams
> version instead.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 837f7a522429..a0277ba6dc88 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -68,13 +68,9 @@
> =20
>  /// Heap memory requirements and constraints for booting GSP-RM.
>  pub(crate) struct GspFwHeapParams {
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_base_size: u64,
> -    #[expect(unused)]
>      tlv_gsp_hw_heap_size_per_gb: u64,
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_base_size_vgpu: u64,
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_size_per_vm: u64,
>      pub(crate) tlv_pmu_reserved_size: u32,
>      pub(crate) tlv_non_wpr_heap_size: u64,
> @@ -127,6 +123,35 @@ fn management_overhead(fb_size: u64) -> Result<u64> =
{
>              .align_up(GSP_HEAP_ALIGNMENT)
>              .ok_or(EINVAL)
>      }
> +
> +    /// Returns the WPR heap size to reserve when vGPU is enabled.
> +    #[expect(unused)]
> +    pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u6=
4> {
> +        //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
> +        let vm_size =3D self
> +            .tlv_gsp_fw_heap_size_per_vm
> +            .saturating_mul(u64::from(total_vfs))

What about using checked_mul here (and other locations)? We already
return a `Result` from these functions anyway.

> +            .align_up(GSP_HEAP_ALIGNMENT)
> +            .ok_or(EINVAL)?;
> +
> +        Ok(self.tlv_gsp_fw_heap_base_size_vgpu.saturating_add(vm_size))
> +    }
> +
> +    /// Returns the amount of memory (in bytes) to allocate for the WPR =
heap for a framebuffer size
> +    /// of `fb_size` (in bytes).
> +    #[expect(unused)]
> +    pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
> +        let fb_size_gb =3D fb_size.div_ceil(u64::SZ_1G);
> +        let management_overhead: u64 =3D self

nit: unneccessary u64 type specified

> +            .tlv_gsp_hw_heap_size_per_gb
> +            .saturating_mul(fb_size_gb)
> +            .align_up(GSP_HEAP_ALIGNMENT)
> +            .ok_or(EINVAL)?;
> +
> +        Ok(self
> +            .tlv_gsp_fw_heap_base_size
> +            .saturating_add(management_overhead))
> +    }
>  }
> =20
>  /// Heap memory requirements and constraints for a given version of the =
GSP LIBOS.


