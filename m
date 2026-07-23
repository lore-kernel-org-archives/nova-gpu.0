Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68DC2F9D82
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791127; cv=fail; b=Z5ahcv/LrDrl60GN4YlvFyNoQdf/n032trWnV5MHIpgJQ5hGqIWWgS0MaqqVqJMvWwQHaPWZbqfv6FlCHDASYfO58z1pT+wh9u4TB1GWDtcLFeUYnSfAWl7TT/oRiSpm2HajgGCg78MtKK6QojLQl09ylFDRpnOCykqy7VnkKN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791127; c=relaxed/simple;
	bh=QhGND9VdOJt4QlQzHCOIeXOgioG9h3Xw9A92rx8zlSo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f25Ac+6ey73MPRxs3Hhor+K02k5TBUQFx+DvWFVgtzabOq96rFDhlxEHotvgX1n76XoF8uLVqXJk7nYdHft+bnMhStvYG+yB6XEEHzIlBojaP4TvTZsZGPtnPLh2lq5vipi1NdsVMwnct54qakRuytaHzCAfCuV/fzQV+rJXZuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b31TJmDO; arc=fail smtp.client-ip=52.101.46.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b31TJmDO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngVzU50UR5S6y7qBrclQPiHVX57Ww+A3ktfXiI0WETGZ/dgtdipSuLgTg/6nh1gRM0PdmytbgEYUczhNVQQ0G42QY6A2aTDWOf4Pk+DNnb65nka3PosRhUAJyvDflZ9ZsNSMyx7KCIBU8IYS/UAg29Wyg+6VUtOcYSIvV/OogXUgUWyLZ/hc1okMIIRW9Kdow3Dpi3J38hvHDigxVuAom4eLMCkjQ9ZRJ9G+GTVni7t+EWUQ6G0dThF+0ybA0kYL8tbc6sIN59Yz/bJktmTmTDar4KB8ojAe3l0uZfdtJ+SvjsexgqPehQQvT4llrDWSOS3mcVqwy7YetGgQ69zRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhGND9VdOJt4QlQzHCOIeXOgioG9h3Xw9A92rx8zlSo=;
 b=vTFtdN0AHPdJrJigz1qhaqkagoyLomuUw5avv6k+GS5/uKamHWt+KVSitZCVbKrAmSHDaAnEij28irxuEV15EHsAPvJ0tknTHDp/G9x1owfsqXaMbvOIHa8YkqxGl/Ct+xbjPUyuWZn3hypxFzoWl52CjR4AShag0IO4uRJ9vi1jAqVDmFY8GQwb0GzLVBTX/X4BEcWn1hbXlKiA/74frfosh/g+Ms895ubBCcoBxORcz58NUkpdX/o3OCQXCbEi4HWC0UQJGdj/C5VCYzYiGLO3mOnZTf+ekYmpJ9jP8js695VrnFZD9GBQy8WQeGfev0uMyIYn8UCzgYnL0KRL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhGND9VdOJt4QlQzHCOIeXOgioG9h3Xw9A92rx8zlSo=;
 b=b31TJmDOutCIrw6D1wwT76FQx0ZZgUFAWVKtFlGZbkNHgMHfeYZUwpNzmNa1E6tWTr8/vLAII+Xus3Vmafm2YNcPvUz/0xp5BmcdRIJ2V1EI3vX1btWRpOYTKJr/f6j5lB/RBSFcCT5Axyk9tVMsA01Skv/RF2/Gvx+lG25dnKwaXDj8GHrMr+6EiPi7GpitqC8SFpmJBXhvc9vl+ivXo2cwHNvffjxnGbHNX6MWRugyqYyZkoB2NEerGjNfehVSrzG3yLcYTercg8mAOv40jXJOrV16Zo8+89810BDalznt8nJGeM8wmFJ6NpRt8Na2Oc+dIDX822rQdl3+Vpl4ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Thu, 23 Jul
 2026 07:18:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:18:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 16:18:28 +0900
Message-Id: <DK5RN7YHXSHI.1BZPR7ET03Z4S@nvidia.com>
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
Subject: Re: [PATCH v5 5/6] gpu: nova-core: set RMSetSriovMode for vGPU
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
 <20260722073913.1807677-6-zhiw@nvidia.com>
In-Reply-To: <20260722073913.1807677-6-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 018763e3-fed7-42fc-c726-08dee88a999a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|10070799003|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	rJY+FsZTejKz072ACUzLjv31SOpoSqBLhFP62yQtMQr7qeGbiAG+9UyRYQU5PmNrPR4W3KCqEW6Y8qUoG3t5EKBnMOcQD/HHGneBQPXCFune59hoqpZGbfqYwXSGWDD7x+yVVs+yFXdygTELiqhCFkFLn941Kpgco58zLRPom8KRCwFSAtN8knPbevXQko2x4hItUuChYawNuoR8b+xLtIji9/P5czI4S/BSeNwzGzYBTrU7OToGX2PemUCVUOlI58ATX4W6aqPgiQP+aptiHRwM4AHfDOmDl5pp6SCTK/z61SFAllxllyuNrqO+6ArJQfvB3F8Z3Ch+FETHTDeTm3cl2H2lRNRsCLJeJGFvuCPFvzu2fVjw2TPnDVuHp8tQkLISERG+X/x8JLkj9b1KJ+oSpuJcTGQnlaptUnrPg7lJWCtQ0DJTkeHK+e0C/546gPRJutam9fIT/tpavMknaRWxkD3mdQJVG3hn5FWM30S9WUbT3LxUJjljRN/zhJYGWN9Ua2yACPUh+da8pxJm7PF/INai1v+/H4x4rDpc6hnJynTFIQsZCkAzh7SEIk2ecsuBndQ3HrZkvEzatG224fyWpy5Vt5qZmAxe6xwUF0VvdnvGzxYY558lSJJ6MwKePR2f+X6XkffwT+0leynMj4WT+hmpCs6r+0JrB8fVK4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(10070799003)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0grNnFKU1htK3BaWEdNZXZqbU1JNFdIeU1RZ0MreFlsc21NOUtWMk5PZ1Bw?=
 =?utf-8?B?SlRESGQwMHVPRmI1TDNHZTlxODh4enp5bFp4R2dJNEUzeERlcGJjajVZczFH?=
 =?utf-8?B?Nk9YZlFjVC9XVWpkdHVSdHBGQThrUXRnZWRDZlJ5VDMwNFUrTkNUUDFiUG9y?=
 =?utf-8?B?SEtJL0RYQXJWQU5WWU5QMzNSOU10a2NVc01IV2RMRUdJeW5kcStvOGVkc21C?=
 =?utf-8?B?ZGhDZGZTUTdiV1BkTXZxNnY2eS94bVpsTFRiUzE1SlRrSjBGYkZISXM5VTBC?=
 =?utf-8?B?V3FnTkdPZHlEQmxBZkRxRHV5NmZySTlKYTQxa0g3SHBNM0lWYmw3TVVRaVEy?=
 =?utf-8?B?OVMvRE96YWVTQ3I3VjBLcFNtcnNXRzM4cFA5eXh2c1BDam9kN09SWTdnSnpN?=
 =?utf-8?B?dXlNV2M4Ymo2NFByZ2M5dXZqdVdOMXgwWUpZS0psWHlveHR2VDZQbHJNRFlk?=
 =?utf-8?B?THltNnBlaU0rVXBDanozMXIrNTM3YXhFK1VPY0haZ0pXQklQS0lwUDVJSHVl?=
 =?utf-8?B?Y1hwUTFPOWl4cksvSURMQ3Z4QWlnZDk2V0MxODdaVXdPRG9BZm5HQk9GODN2?=
 =?utf-8?B?ZEpaTVJZUnFUbWFBWkdaeC9BZ09XMVBXMzl5QXhrN0ptV0FoMGJvSW14L0Jy?=
 =?utf-8?B?V0ZyZmRMWFRrY0V5K1F6Ukd4UWpFQkdxZ0x0cXZpYmw3a1ZrcEVIc1E2VDJ6?=
 =?utf-8?B?RUMxcU92NzhCaHdPWjhpUExvY2FXdFNSa0pJaDdwOFNvVDVSRGhSYXExUjNj?=
 =?utf-8?B?VWNFQTR0RVlXb1cza1V3OTJaRVZPSldUOWxueXBNNkNLMy9mcm9EY3FUcHFE?=
 =?utf-8?B?NlZYVXlDZkhTZ09wS3NqYkZoc3dwcHlGb1d6N0xPZmczMFU0ZDFGV0ZSWTI3?=
 =?utf-8?B?YnpPQi9aQ0FxM1ErbHZnNStZUkJ0a28vUmNYWDVaWEl1MVhydDF6QmVLeDk4?=
 =?utf-8?B?SUc1VVdOTXhsMU43cDRxMFFYc3B4WmZTUGtEaUY2cWpYU0pBamxaVStubHNx?=
 =?utf-8?B?TXlSM0R5WGZYSDZlRy9JSTZYR2pja2t5dmtaMTlkbWY2amZWVjN2akdjR3Fa?=
 =?utf-8?B?akR0QmQ3dzU5YXIvNDdzcCtHSnFOU0NoQVJmbnVtTTk4RzNiNWNENE9uR0p3?=
 =?utf-8?B?ai9OcENwaExpUWtWVXMxR1FZUzhPd1NYaG1ya3RTTEVjNlVtWG56VldiZlhB?=
 =?utf-8?B?d0hscjlMcXBiOGh4MUxqZzJZS1AzL291OCtkK1dzQmRJZ3lNUUpDclpUclJ5?=
 =?utf-8?B?bHRtTlJSNlBocjVRZUIwQlZ6S1VDa2ZoTFdTNDZwM1JWLzgvQ0RlREhBcHpl?=
 =?utf-8?B?Yzg3dnA0YXJ5RSsxaWcrK2NlSWVORzJCTTd3c0xRZGRnK0FvUDk1NDBIYUFK?=
 =?utf-8?B?VGJaRTRKV0pGZS81RkdTTDlaZ0cvTDZkWlluZzFEVFVXdGFqSzhUVWFzMFVu?=
 =?utf-8?B?c0hZVzJHd1ZZU3pzbEY2akRRZDZqREVXZTZ1UWtlbzNQUmRaVERlOFJ0T1pZ?=
 =?utf-8?B?WlgxL2sxb1dwUEZoNEJzNnBuVmZqQXZaVHcvYnpQaTQwMEdRVml6RG5yNHJY?=
 =?utf-8?B?dHU5bW40OEJhT2FVRGNhK29iTjhvM3dwOG5EWnM5SnBtajJwZ0xuR3NlQUla?=
 =?utf-8?B?TGxqcEdoUjBWM1hncTR3b3FodTJTaDkxaGF6SW9Rcm9lcWk2bnNZK210UWYy?=
 =?utf-8?B?N2d1YmJRSWkzbnZRUzRTUk1QQXlNZld2dlhVVU9DV0czcVIxUDRGL2pOTllE?=
 =?utf-8?B?WkVYOTJPcjFUZ2NBWXhxRkZtRTlUdktLZGtHeFdScktKRksrY0pldzN1ZjhW?=
 =?utf-8?B?Mm04cWtOWTBUemZlUSsyUVovaUNsbm05OXR4elVaTE5JMjA0U2ZRUWFvck5M?=
 =?utf-8?B?RFl4VWc3UWJpeXdoOGpoYmR6TGQ1cnlSYTdFeG1tSlcxMi9uMHRCNDIvcGNH?=
 =?utf-8?B?RUhidENqTFN5RW4zbDhyckhtbnkyY3pNU2lTTGE0WEZFWWt5ZXUvT0RocUM0?=
 =?utf-8?B?Ly9kdHlVRUhGUWdSLzhNc2hOK0pBbkNVbVRic09oem9CdUNnZmZiUHgweG1V?=
 =?utf-8?B?QVhuUUx2dUtXTlRMdytqSHFVUDFQNHROaXF5S2VoTEROUTBRSGEwWVhtVXNi?=
 =?utf-8?B?bVBWWWp6eVFVNGc3clU3azlKTTVkYUpodlRtYVh1WGhYallXSDRPREo4MjZC?=
 =?utf-8?B?S1dZUktBSTgydHd5OUVhUWRMRWwxNkVNL1JXWFVCU28yaU0wQW5LQ0I5S1pt?=
 =?utf-8?B?YlBVbWVlVDQxelZiMjNYdVF6SUMwa0w4N3E0MWM4aHp2cERLek5kTTZ3Q2Zz?=
 =?utf-8?B?eUYzZ1puK0UwTkRzeDBnNVRCK29rZEJtYmZodDA2THNVU1JHSU8xWDljNTVj?=
 =?utf-8?Q?n6gsuzEUfM5fUuH7SQ5dJsXOXBINhOO5qFafFZKfvJ8gl?=
X-MS-Exchange-AntiSpam-MessageData-1: Yy7iU3QeDxdWVA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018763e3-fed7-42fc-c726-08dee88a999a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:18:31.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tyiSATQ6flxc3Lfy/k54I+XKDcGoid01rCUPYiNlxY4p1PTcmqX4ywhO8NKVYLgNEgFJhTf0GzfXFRAN9juzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724

On Wed Jul 22, 2026 at 4:39 PM JST, Zhi Wang wrote:
> The GSP registry setup needs to advertise SR-IOV mode when nova-core boot=
s
> GSP for an enabled vGPU configuration. Without the registry entry, GSP-RM
> is not told to initialize in the mode required by NVIDIA vGPU.
>
> Append RMSetSriovMode to the SetRegistry command when the vGPU state
> detected before GSP boot is enabled. Keep the existing registry entries
> unchanged for non-vGPU boots.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

I have submitted a patch [1] to fix the bug raised by Sashiko, as it was
there before this series.

[1] https://lore.kernel.org/nova-gpu/20260723-nova-registry-size-fix-v1-1-8=
f471ba00ab4@nvidia.com/
