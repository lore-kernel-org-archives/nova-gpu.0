Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306097;
	b=OSWiNg9vxnZTGor0xL2ZPGWeVk2n+RIMzD9HTeFmei/2peS8vIikm/KjQU2Jev0y+fTQ
	 ozwYUmpNjR1TalzI1W/lA234B2sucijkgmEqko9YGa3EDZXGFPtGPO3TOz+0Wiudvcll0
	 rFOpBSspcpon2E+0j9ZgHZBmYuvvV5Y8tTiHXBnpO09b8usl4rLrHH6Jp8QoOq58hrjGu
	 vYlGejHzUioEEJMgY/UUIzEY+DGjBdRWD7b6cnKus6xmdpZL3G/dMelPmRwZYeKpAloVw
	 9/AoZ2oYsUyE1e9WizckQInq3Fn98dXSDCS0TKspua5UlfULnSDGuFlzsb7jhARrdIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306097;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=ruRRWC28gpzzttZxcq3p1hVZfTNzsn+B/hUipzeTXyo=;
	b=BNxQZ+xfosciwVHStXnzg0Vwr+/jLtCpT4Qbh3qjS6kMItedm1wgjc9jSk1q3FYKPtPf
	 5fZpg3Gmvbx7WLdZxS+Q8RsMlFZRyALOmhvhIEBkJiA+x8r8IzQV9oUfbky+PDs13wC8U
	 KkfIppB952piW+vhR9rMkJAijWjxIaaCHiimy/yyxXu3QKxW62iyjuEb+pVN1TFSz9gLp
	 IzJSM0KhwfqOJVJegfM+KyebcML9C4YbX766QhvKeKS91HDVR7fNHEFjdKCaf8sf8rIc9
	 8hyXY08twUFfsKDqPGg2nqEKpagCtIuYWorpEyPifhNF6VqSgErmF+QtHz5E5w3dbLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E3j5FANu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.4
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FD606B9AA
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394FD606B9AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E3j5FANu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxvPoaqjDv/mvOlK/qydhljKD0Nz5cqYsqFsqT2vnoT9lKnYTo0Xy7BAE+aMbsfL/qOEqI1I5UX2hUkNw1cbrl1LwYFN/LY0AgPtmt3HJIs8LmhjtHQobdg3mGmpDLnMUl/gKycG1T7x0drmAQaVz9q6olMBgZuL8vgZ7yyVrkhIYZpc58nhzTBWEsclNrTTyn6FqFx9Dua+7UoXeh6kUyz17d7HN95Ja8EpWca43BXUyGly+TQtwatQj0SfY9g7O9YNXCS08dWAxHgKXHO6oM3OyoQU7Z8Qhjw0bt0eOUNu2SFyIblsB4eAPNiVm4zTPT7bLP++7PwoPvtmhACA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruRRWC28gpzzttZxcq3p1hVZfTNzsn+B/hUipzeTXyo=;
 b=W1ZlUbczfUU+e1xrpmdM1tIA2HgU1KYl8mb+Hg0mzdcltnLpryuSyIgBjMFYKzqnsYYDcjqK7ebnUMa6U2vVef4XvNwptfWs/b2A2coPeUkCbLipU61iuF2E0nRJ5shvaoulCJME8VXsEE6qQy+rQ1FVMoi/Bl/kBDcyr7ul7nJ2k5m4+ENhdhqD2h2PRKbmJvIY2yF+K8l0rUkGkhzaMP++hJIRo8mUqLBfK0PkT3dfuwvvWY0ez5Q8ZteTEILAdrMWgFMkaDFCTZdW5zDl5t+TyRSq3+LyWYPuKgu53/+2ADQ2lCSAH0UOyEapkBGrRJ+ej3Jck5NPiFzLZq8bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruRRWC28gpzzttZxcq3p1hVZfTNzsn+B/hUipzeTXyo=;
 b=E3j5FANu1C56SoXrepwa2eTKjILcEYAOdPwH5eCjqoEcOicZTbxtfoDXY1dW+p3rbIylSWO821/JSUoAgtQ9dxcZs/HwAokoCevCzjUum4301tN30HxAHV/EXwg4SnhS+epSvA+kE1tVD50VPQY7nKpJDgP16UzignXqwkMMbitIgoglWr4bfKMdoO+HH+yref6+YzfcYROxhx5VEIUOn3sse3lTtbiP4Vl2llTfwLcf6FleXTyJMnlPQuiPPDBCDp/07qXfBve5tP0xU6hHpsHa3TqU22Ply4koa1ODLUrM5wimbwyLjkG1tsH4NY06BorwDGhfOslSztfPdfWGdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:33 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:58 +0900
Subject: [PATCH v3 09/13] gpu: nova-core: falcon: allow DMEM DMA transfers
 to request tagging
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-9-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 1283d5e7-e908-4552-78d1-08df3f1464dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OrzzwGskSQgNq4bMH9DX/jrxML9sIDcteWVScpaBEJF8HWTO5Nt6B4yT4J2LKWE3XxIAWUeCIioTxeRAIwK9+Gw+GlkuPx45Wj6cMZ6eisbTk9W8ZzYQRJsQhpAkVFYujhesQKOEqf8LFB+WYB5rOTJ8oaL2s6aIq62RMBlFCOf3cJziJIVqTu/hE7GCtCdjDXzTuFY1HOUOnjZeko696VbaqGevEUgek7dbA2afUpPgi7mBwXL/bunTpEE6KWcjM7nvWdfbWuohg4qMFkLranrjZ+I9yM2NfNtKnwrxxSqW+MgMbRzE/QXBU4QE5oWG1NYmHN7bXwOgPLTeE8D0ETcLPbaoNHtSrG3Da3MddnCJypPa9msXM4JkNuoZ7V9sgb/n+VNnrDQ/idw0lJepQNhPQHaObsUp9G2b/M1HDi9CVF1ZLyaJZkudi6T1c207w36wayFNwmeIbS1VB2nc7DcNk41FFVDn5dzrYEEcaDPjHSq/eAfWoGsBCcX4gti2NEv+u2RiRS4+H2BVvxH3Q/7RhOysi40hbw2Wgwl26/pnNb0IA9c6ILFUILZi5tMjfieHN4bB9evwtA4U8GPQAM0/KuzMJJJtBo06+iJg4G3e7/vwvO4oFsy7hO0GmMdy4P3uky/1JSVRFYf3MdW3v21s5tSNDvjnxRpQ8t3gAZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWV6VHAveWVyT0JMSkpWUm56VFdhQzByN2hDejJSY0kxT0ZSV2dndVJZUVls?=
 =?utf-8?B?K1hPTkxYUlFEVVZqMm5iak9ya2NHTllrSzdncEJjSGpGVG9HMTc0ZmU1VzRx?=
 =?utf-8?B?U1ZvenEya0U3MkkwbS9mYmQ3WlBkS2czaG5oRjhwK0Nzb0ZtQ0lWUGE0RzNT?=
 =?utf-8?B?c0twUXc4cXczdlVxdHVaU2tsMmhlcm1DSEZIVllUYVEzekowZktXcytqdHZO?=
 =?utf-8?B?TE5qR0MxY2k2VXV2c2dPc2xCdXhrQ3YxdXBIYUVuZ0Qwa2czWXEySU5pOVdM?=
 =?utf-8?B?RVg2bkVsblhndHJnZjY2bnZ0VTJxa3lpZmxQZUdUV3lLMjZRQXdxQmp2cGFX?=
 =?utf-8?B?R1RLWG15RnNmdUN3amg1Y0ZhRUlsRTZlU05STEtEa0FRWmpXRmcxTFdwRDJS?=
 =?utf-8?B?bjdFT3I4dkViUCtSWXRTVFlQM1pDVGlsNnF6ZTRINkpONWhIOFlOV2V1aGFn?=
 =?utf-8?B?TkVMaVJwL3dzaHN6Wkl1L2ptTjRtUHVTa3VIeG02QXBTUGpiUlNvM1ZHZjQx?=
 =?utf-8?B?V1E4eEZvVWFPZThDRS9UeTRhU2VIRzFnM1BXbGZzZ2pHNEF3SU4rdjFENGFi?=
 =?utf-8?B?dVV3NFE0NGp3czI0SVNhajZHb2hMQm9JSDUreEF5QUljZVIvOW1JKzI2RUkv?=
 =?utf-8?B?Z1o2d2xHc2xFR2RzWUZyVmdJVzU0aTg1RWJTQ0pmRkJPRUdud2FxcEdRV045?=
 =?utf-8?B?aUxhMHpYU0N6WEZ2d0d0U2FtbFJXalhCeVU4b2VIdkpFSFBEdVFMWEdReksz?=
 =?utf-8?B?Q21LdXB6ZElxZXNGNzRTUTJQUGR1NjdBeDAxNDNNS3gzQnNITEt3REFxUkg0?=
 =?utf-8?B?ZFFYaWFQeFI0MzNRYjRVbGh5UmRTQjNXbE1hK1FpdjIyRVltelJNVURHOXIz?=
 =?utf-8?B?bUdwQkMrMUpISnNJUWc2cXhUQU1udXJMZ21meENWZzB2cVk4T1hwVkc2QmJF?=
 =?utf-8?B?T1JEOXNrOTJLQkozZVlmWDZnOVJxdEdmeExvQ2VxTlJaeTVYR09NWWpPdWg4?=
 =?utf-8?B?aS9hOERJMG1IWlRqVXlTSXo4WTlydzlCNDJzS2N1MWV5NGZHZk5WVW5yZ0tE?=
 =?utf-8?B?OVl6TytaVUNEekpKc2xPQllkREZhU2oxSGk5dmJhTlM0ZHBENEdOemZRRGtV?=
 =?utf-8?B?NkFmWG1FMWJlRG5BdVE3RWlVbG5ycng3TSttT0cwK3F3Z3dZUFJqYXR2UzF4?=
 =?utf-8?B?TFhXM2JPeDZrUkFnaXlnMWhLS2hENmxKNVUxL1NCUnFoYXIyLzA0K3B1UjdH?=
 =?utf-8?B?YlI2YVYvblpyMldLVkpIYjg3aHpweHlSamRVZjRMN3lxK0Y3M1JCTldCR2ZJ?=
 =?utf-8?B?NnJpeUJYL1B5aVNUUldVa0hsWjkzSCt5S3NkNnozOGx4bGptUkFSNjloSzYx?=
 =?utf-8?B?bllDeExqOCtZTklQL3R5Y3hFVTF0T2VpSFpHbXNneDI3a0xjWjluZDBlak4w?=
 =?utf-8?B?eC9uNlE2Q3A5dXFaaFFRb2oxcHlpYy9yTkdVNXpmVlI3TW9aMkVjYndteUtL?=
 =?utf-8?B?VG1qSWk5NnJqakJSRWxoaDJ3WkF2UFRLVGtPbnBxQnVORmN0UkMwTXNNT0Zn?=
 =?utf-8?B?Y21OMURWUW81MTNGeUcrVHV5Y2t1MFovQzMxU0JWOHAxK0tuS01vRHZGcFA4?=
 =?utf-8?B?b1R3NjdiMnZYd1ZaNVZyMXdGcVFUbktpbHJHSHBCOXFjcmpEcHUxVmJ2WlRU?=
 =?utf-8?B?d3NYdVRpQkJBZ3lnbFZuUU0vY2dORmh3TnVpdXl0dGw5ck0wdVZIc2pqVGU2?=
 =?utf-8?B?d0VDMjU5SXM1b0NidUFlaE9zZitJUHRNb2hBaktmbFJOUkhZMXBja3V0WVZY?=
 =?utf-8?B?aXlIck90WkQrYVFwVHhBV296eXFPRGw1d044V3B0cmdsRHBWVEFxYXpuRnJ2?=
 =?utf-8?B?YllhQkxGanRxZ0t6bVhZSEppakRicFdXQXBxMXY4NnBEVytTV29qSG5mNTE0?=
 =?utf-8?B?Q3AyVlZEMkVZaXJReTZpUEYxc3RoUUtDWUoyQnNZSXRacC9jK1NkeGZOU2t5?=
 =?utf-8?B?a2wrdnFaSTVoYzNiWERLWjFrajExSVl2MVp2aTYxeXJOelowSndSbGtOY0oy?=
 =?utf-8?B?TituUVA1WnJ5amtpTENoUEVGTmtIZWpqK3RTRklOU1VMR2Iyd0o3Z09oVmRk?=
 =?utf-8?B?TEJZcWVGZWhuMjFZRGZSWnFvRG5YbXFTOVBpeXFWUHgyVUpMZm1LVk9Qb3pP?=
 =?utf-8?B?RkNhY1ZrQm1KWGF1OGg4ZGVCS0pIay83WkYrUlhLaFd2RkY0OXB4S2U1WTh2?=
 =?utf-8?B?YlNNeTd1VUNBK0R2NFpwWCtDRjcxLzNLTzRBVkR1c0F5UHU3ckRLWDJ1S29U?=
 =?utf-8?B?aWNuMkFnaEE4Tnc2MjNTd0hSNHNDKy9RcEZGMXBWc2hhNDhMZVlVM0pFMUp1?=
 =?utf-8?Q?xjRSUZ/4hJiymG4My/7/8659m0zoAGHd9LW1/NGHVhFWo?=
X-MS-Exchange-AntiSpam-MessageData-1: gPjI5L0JfXs2Zw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1283d5e7-e908-4552-78d1-08df3f1464dc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:33.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMu8grKLw22d1WomWy1NHF48+IpuYV+svsddHDU/4YK0vRxJ9nVbCBKPljlwgxwqlzPBpgROwX4wx+adXs52tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

Add a tag flag to `FalconMem::Dmem` and set DMATRFCMD's DMTAG bit from
it.

Similarly to IMEM, when tagging is requested the DMA engine tags each
DMEM block it writes with the block's source offset, which the loaded
image then uses as its DMEM virtual address. The r000 load-and-execute
HS binary event will provide a DMEM virtual address for images that
need one.

No functional change intended.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 23 +++++++++++++++--------
 drivers/gpu/nova-core/regs.rs   |  6 ++++--
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 299f17b1218a..04da14d48895 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -135,8 +135,9 @@ pub(crate) enum FalconMem {
     /// Non-Secure Instruction Memory.
     #[expect(unused)]
     ImemNonSecure,
-    /// Data Memory.
-    Dmem,
+    /// Data Memory. If `tag` is set, a transfer into DMEM also tags each block with its source
+    /// offset, which is then the DMEM virtual address of the image.
+    Dmem { tag: bool },
 }
 
 bounded_enum! {
@@ -559,13 +560,15 @@ fn dma_wr(
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
 
-        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
-        // code addresses in the firmware (and the boot vector) are virtual.
+        // For IMEM and tagged DMEM, we want to use the start offset as a virtual address tag for
+        // each page, since addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM, the start offset is folded into the DMA base.
+        // For untagged DMEM, the start offset is folded into the DMA base.
         let (fb_offset, base_offset) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
-            FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { tag: true } => {
+                (load_offsets.src_start, 0)
+            }
+            FalconMem::Dmem { tag: false } => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
 
         let dma_base = {
@@ -659,7 +662,11 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
             });
 
         self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
-        self.dma_wr(&dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
+        self.dma_wr(
+            &dma_obj,
+            FalconMem::Dmem { tag: false },
+            fw.dmem_load_params(),
+        )?;
 
         self.hal.program_brom(self, &fw.brom_params());
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index af0bbb92e992..7e997478ab42 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -321,9 +321,11 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 }
 
 impl NV_PFALCON_FALCON_DMATRFCMD {
-    /// Programs the `imem` and `sec` fields for the given FalconMem
+    /// Programs the `imem`, `sec` and `set_dmtag` fields for the given FalconMem
     pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
-        let this = self.with_imem(mem != FalconMem::Dmem);
+        let this = self
+            .with_imem(!matches!(mem, FalconMem::Dmem { .. }))
+            .with_set_dmtag(matches!(mem, FalconMem::Dmem { tag: true }));
 
         match mem {
             FalconMem::ImemSecure => this.with_const_sec::<1>(),

-- 
2.56.0

