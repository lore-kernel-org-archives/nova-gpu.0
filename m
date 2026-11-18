Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794976729;
	b=ABeXt7Ij/hI9OF/x1XQwkth0I/lzyB00P5/08PMWYsQaFVftOMb4nnrB/fjTfMs7mhPQ
	 3XKBj+0Td1Fh1oZ4t7ta8Jy5zRtTe0hVksvHRKn08ADUCRtAo5AfbGpG93Q0eVOobCR8g
	 Sq4pu9LGXoxUm4Hg2RL1VrDXun758T3Be/QBZ21twR6vC+UXAIkfM0cgnESPbhRWLH9Mm
	 +3Vic3Ey6AAxK3pQuUpwYg5rGcUvtd6j/yTMJ6k0ZTAdjHWpJ0LDOQUWRBUnOo1Gnl+QD
	 GaVXxiFx2d7NDtjisHgcvsuPtx+dswIyxgKE0vXAFPyoN/X2IPcyhY8E1HFMfBM2Ptg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976729;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=gip4o+Nr+9/TDdW3MEs2uxDKq1ONGg8t0KGMuS0pH7U=;
	b=10NKt3cFPlSLJMoyBrQWb/EYmf6PeX7tgW5qV428bK7lU2j57sSLehqTLyWJR1YwwMhm
	 GlayTaQ5MgBX71rYeI/ht5FlT0cGs16KLxtjJnSCFl+6hiVOVRRgq2rQfRT4xXFqtW10S
	 16sn9paeOj6GRcINGieDocXZQ92dnltRGodn+mqieWPv+ql0ytNOH7pRuRp10n3JRJ5hT
	 45ymDfWqvX7ngWNmL17/ktWfZ3WsyNGcOrJ3wiINuFdg7SNFNhu+U9tTRRnAaAUlzIplr
	 L4RYhcnNZHl5xBETXIx0wu5Cxsd2IfMoyXj5D1Fk3InFTGLoXoWwcq1Dy2/FZd5cisw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XDmwknaa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.62
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9E606A325
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 04:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C9E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XDmwknaa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON1Rv2RnRXg+gdbiL/34PZ1EkR5sUBoK3zI+zHI6vryJrsdofHgsqBmwisOXE3m8HO+2eqAjUm8rCXtyXp3DrbWDTOJd+jep+6AYTQJozKOKazEWC1/JfY60mprotXPOLtTckQ/DIbW71DNpOvNvZlAXxG6ZBiTFi0lhlSlDU0dJdeSq5xHnFwxS0ywqekWw85iEM3XAba6Xo0p60bIZMSd5yJnPg3fCOBrJLbs6Y4Vz4InLuTNPGWNyR3Wy0VgalnU8BvTvv4OOp32WhiPt941SHYBztGck2IBPxtmXj8YQ9Wge7rAdeHNSyHfe1c846uW9s6XIHRs61Wpk+u5GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gip4o+Nr+9/TDdW3MEs2uxDKq1ONGg8t0KGMuS0pH7U=;
 b=B4YbOSkWCU14ZP+GWS+i7oBAzHDP5PB6OaOz+th5XhYWZaQlG4g7QG3s7yBtGdWuyTOVKrakgP/yQNOqF0CEN4Xpg97Cs2KTgaFS0OGYzzESAbpxXZPKnbvrUQks6gHzK5s/qJ4gJ9ReBFESObzNt0Tbq9N/8R7H0kuHskpjUHvBf7ApxD36r8R3zf+ILMQlnNmaqU5+MWGJiffcLkvndPhMZhUkA9LhISEt1qLdEqo+HqMh/oofAKeNTl1lOj2mfQy+9KqJrXZImEd8gmJfh2KD8OAHcjZa6EukUhJMXLD1ULqaB3hYjz6+eFqUTv6b9jMtxZ6dymMfbKbQIpBJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gip4o+Nr+9/TDdW3MEs2uxDKq1ONGg8t0KGMuS0pH7U=;
 b=XDmwknaaT0ONfPp+S9GSS6x51+oYzSm/Ar3xXN3xe+PAnos7+aWsWO5kPFk5OuzcBRMpry+frxu+DqqvxInlvw0mzbhuToszeosE+D5lz5j5rMXVIt+J8DPZEXIQlllN9gHW1xFq8GABFy68qEsPs3sJfES5OTETjqJj6r5dpxieirwTSJKcWwZTxDgp4c129xmPqy9YmifpBeSXp/3NIrfGsMZCkUr0FXmlA1yfamjBiKx33PVUuvS4+Pm5zunGOk+An9HnmWUGB5ztDXGm2jI19tRXXBtlCnoD/dLg0R/I6vWiisxZ1Z1y/i//ylMmLKIHWpDQzW0y4qAtKkY9eA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB177419.namprd12.prod.outlook.com (2603:10b6:806:53f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 04:38:46 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 04:38:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 13:38:42 +0900
Message-Id: <DMY256F5KDHV.3LW9NKCD2HB54@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: cmdq: let GMC commands set
 their completion timeout
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261117-cmdq-timeout-v1-0-4b50d0be335e@nvidia.com>
 <20261117-cmdq-timeout-v1-1-4b50d0be335e@nvidia.com>
In-Reply-To: <20261117-cmdq-timeout-v1-1-4b50d0be335e@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB177419:EE_
X-MS-Office365-Filtering-Correlation-Id: f0efda94-9c82-4d01-f89b-08df452dd4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	N9EyHDruU6UtGdkY+4o7Gobremp7rCG4fk69hkmV1xakIXjH5PY6Iv6xA3N2i8ir5boPGeW5eX/U8nTHWrFoR0MgB1lZhWFwgzzHrWTrS174I2A0gx83aC/Dhg5eWI1F8TU8XT6L9oBu0e33e7Fgc63scfXcqh4D243XeLYKNx9zzOsd3XJg2L+Q8saPESd8Q3hIQdR7bvIsOfSOt9bZ2IYcUiu6JccFLbG9fz0xu31REDgJ6eScF+ATo12ykBA0txSYNg9tbWml6jwzURA3egk0MnE4LK53DIHb8ZkS2Wek2q9Tb9l2vyM9hFOibvy4Zf9Ew6wIJmNoWW0jN3JShX7dfdznUiXlMmCwRyQSrGfeK/4Ui5Z3buWQMO5VuoB+eq8Vn/MVTZjOpAgWTy1WjbXlV9UdfOpU39zfJFPJ585Dt9N8UO41d6dttFwrXA9KQatynW/m+ETEGmbf8fuoZvUkGB7NAZsxJTzfTdJjvC7/LXt4yEQzT6maBjwLJSht2a06cA1hRXi6lSk1R+CFQauchiVsUgMxm3k3LMCnDY6sZ3l6+ns/OPy/wDbcFctwThqA24I3dAqq6SYxe7YLQkfqTXw2WcoD7OG/oL8CwPbZc+jW8VYkS/ncHac93p/0Zh+8dx4vmIXpwnI2pzxjngB8HNddsJvsDbHi2PHa0Zs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azV1M1NWWWMyd2VtUnM0dUhyRVZNY0VoRlVabWtIR2hsaVNrd3RXOUsyZXJl?=
 =?utf-8?B?MXpwYkplRHJGdENzWHV4VFpkNGd4ajJrNE8ydXlBajFLNFFJYTJqckIxb0V1?=
 =?utf-8?B?V2djbm5uWmdtek81bkFrMWVidnNNZjUyaHVzcDBXcG92bmF6Ty90QVhWR05P?=
 =?utf-8?B?QVlBRnJTZGcrUGo4TWV0QnRaWEhpYWg0U0xXVVRRTHlIRTR3Y2xwVE52UXkw?=
 =?utf-8?B?M0taOGFNRVZtb3I0Z3ZDM3V3NVJsbFVUaFJ1aFlUYUhMNkwrandFSE1hTVRT?=
 =?utf-8?B?OXUwZWdDcHFzMWdUSEo0SHMvZzgzem96S0dXWFVIVGovK2dROHRESkE5eTlm?=
 =?utf-8?B?MVg5N0Z4bFV0TCt5TkVPaXFJSEl1S29vTnRRK1FDY1lldythMTA4TTZFWTVZ?=
 =?utf-8?B?a2laZFh6eHlsbEZKV05qRUxTaVRQd2dWcjNBT0pzWkFyK0ZGeTR6UjU1aHcz?=
 =?utf-8?B?K3REVzhxcDBWN0FCT1ZuNVZQYml2UXR3VERMaG55eEpUV1B2WUt3WXhiS1Q3?=
 =?utf-8?B?S0RNeDJPb0ZPOXl4ekNVWjJrVHc1SjBnTUczYWR5clM3dHZCR2ZOODdwc3hM?=
 =?utf-8?B?ZzZCNFdyQUNZUkE2SzNVYlQya1ZUNTdHSnFmZDhFSnFVc1BOc1JlMVNJaUwz?=
 =?utf-8?B?SXVQT3hPdE40V3A3YjRGVC9OZ0hXRkJBN05WcVY4NkY3VmoyVWdLMTdOdGpZ?=
 =?utf-8?B?M0xQeDFkVmdORjVlTnk3aWVZcDBwWUxSdlVmRGFvTEdyUHM3MDNmTUt4ZEFI?=
 =?utf-8?B?MjYrRWpzMGRGV3Bod0JqRHBlamVMM21lb2Y3cjE5SXFaQmVhaDBWeC9yRFhY?=
 =?utf-8?B?Z0dJSHpJMFZNYWp5N3dTbC9mRElhM3JRMDk3aUNLYndZdWlCVkxaTHYwWlBZ?=
 =?utf-8?B?KzZxaExkcW9RaWJLcFZ6b1dxeVVTd2t6VkJzV21UWHVxRy96R3FxNktZQUp0?=
 =?utf-8?B?TjUwVlBVM1NZKzVLZm9CR1VYcDdWRFBIa0NwOUhsSGtiZnRiM0dhckpBYW16?=
 =?utf-8?B?TTNrWGhWd1NOSFl0OGZVRWxkSm9BeGZCeDRoVGRHMGFmVkVmTU5YbGJhWEdX?=
 =?utf-8?B?b2FkejM0cWpOYTRxT0JWVDB5V0syWlRUVUNYTUdUY1VhMC9CT1BBcWtmcXgz?=
 =?utf-8?B?NmV0eS9pa0UvWnM3WGlabnh0bWN0YzNKeU40MWxRVjV6SWVmMzdPUWg3dXIv?=
 =?utf-8?B?ekwrbkJoOHlBS0h5QVdCdWFIUFpBUTlhTnoydnBFa3htTWNmbUM5VFI2VitX?=
 =?utf-8?B?Tm5rRjgxclRpVUYzbENabVp5SXEvdDgxNHo2dkh0SHdpU2FUSGRmV1RzMDFq?=
 =?utf-8?B?TVJpRFZnUy9kL3JDR3lCZDZYQ0JDb2t4VUdMM3F4Um9mTVhPSmxIN3dyRy9t?=
 =?utf-8?B?Y3FMeUpRRnVWTURyUGlqczNDSW5IVVhMTVoxRjR3Y3JmZkdaS0FPUktkTXp6?=
 =?utf-8?B?cjlxRkQrWFhsMlN0UjBlaEVkbnBWQ2lGeVhuYWkvYUJRSWk0NnVzSnUyUS8x?=
 =?utf-8?B?TkpjM0hSQ3kxeTF0M3pkUi9sNG1HaktmMnVrcjVicDAxdHZ0RndzYnNObjZn?=
 =?utf-8?B?VktBM2ZOcC9FNUU5QS90dnF2MWRubU9uczZzZHZJelZjUDVydE5MemhrRnpV?=
 =?utf-8?B?VDZBb1RpZ0M0b05ZN2k1dmlZNFNmaEJkTjYyUFRsOE5Qajg1QlJtcHkrNXJC?=
 =?utf-8?B?a1gzSlFQWEVxTXhLTDFYYWtDaFJ5L1VmVWVJUjN4SmN1YzVLaC9SczdUOGFs?=
 =?utf-8?B?aWVWanhEeDB1UTNiaTRqK2xLK3FESG5xd2NJNGJIcGd5RHRWa2dwbTJ1YTlU?=
 =?utf-8?B?dVhvOUhuejdLTC9aL2tCbmwvYTJ4bk4rc0p3S1RNck9Gb3ltWU15blFwQjhO?=
 =?utf-8?B?RE0rVFdZbWNyWG9mWWtxUFRRWldzREp3R3dHT3d0UWV3Q3Q1elJWQVFGclNS?=
 =?utf-8?B?cXBMYTU3RW9CWVZueHpCTHdFWG1zSG5RdTdXVGxrMmw5R1BjYTJjYWZrdW84?=
 =?utf-8?B?S1JaNEhqZWdvTEp3NndCbTcyVnBXUGw4Umc0YXVVZUc2NVg4R056K3NOcCtq?=
 =?utf-8?B?eUdXQnAvSzVCZHI5Rit3K1QzUVdNYytTNmZQM2ExNE5oNkJ4RmtNVmZYQ3Bq?=
 =?utf-8?B?MVRsd3U4ZmtVNkdzR0JFcWVIc3ZUMWZ0KzFYUU04YXRZYStKZTcveU03SEhT?=
 =?utf-8?B?THZCc1NtMUkvd3JRVnk3QTBLaEFRakRFcmErREdzTE9rNGNxRytja3FQaEk3?=
 =?utf-8?B?UFBZZXlWMXo4R1JFNVhTRFQva2prWndZRW1teGp2anZRbkFVTVRTVThvQ3M0?=
 =?utf-8?B?eUZEVUFDMnNYWXBRelZqUERmVmFwNlNIaENBLy9CT2pKMFhvTXRxRnh6NmFC?=
 =?utf-8?Q?zMyt5ngVbTILcHtn7kXHl/Wm1kejBXGnpHKHd/mLeIun6?=
X-MS-Exchange-AntiSpam-MessageData-1: 8REr5F/Ft/3auA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0efda94-9c82-4d01-f89b-08df452dd4ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 04:38:46.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF0s3et0m0khYCjpZxVfkvP2CJA4zDCyeT2OlkluNrzSpwcs0QS2zDE5LJAJMOd5t37V3KnfDjxfEGXsR67RPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB177419

On Tue Nov 17, 2026 at 12:06 AM JST, Alexandre Courbot wrote:
> Every wait on the message queue uses `Cmdq::RECEIVE_TIMEOUT`, but some
> GMC commands (notably r000's GSP_INIT, and a few vGPU commands) might
> take longer to complete.
>
> Make the timeout a parameter of `await_msg_with`, and take it from a new
> `CommandToGsp::COMPLETION_TIMEOUT` associated constant when waiting for
> the reply to a GMC command. The constant defaults to
> `Cmdq::RECEIVE_TIMEOUT`, so existing commands are unaffected.
>
> No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

