Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157618;
	b=QSElYQbre844Y3UwVqgwtfYHOX4C8Bw+Z/CwbdSMc6pen+dZ3qU3CQzGowkfGV1/kZWu
	 sX6Wx4HJdQsifFHXXS69kVmQ9RbnSd0qImEiZKUj+fpTeQdo6PSX9mM7L2OzROU4qCAPi
	 cG38en4uTpj14NFsp+KNy4ICzNj8+8z3P7/sn5vuodwgyFAKuE0H+ZlUmB/gjzYBb3NoT
	 +nUTjKLA1sUvOWXLzAIIfryk7SxORvBpvg3xcMGBZcyVpC+zQ/5R7AFni3vjGw+tB3Xn3
	 f3oPqXnk3CgZ8Ol9bdTs0raqo672j91Hy4G0Q/42rXhexqvaxPxiYF2d6C0HjPfzTJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157618;
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
	bh=+NvxGuMuPgGjzfrrGYAMlusg6v7pJAIDoBbY9GYzFQg=;
	b=roYnb5ThC7ECmr4pvfWRgNHaygWzte6Hh3mrmsllgnp5Vm9KBMnzl8a0v7l53vbbvRLG
	 OMNP5XJURyvECih4t4gsL2J+4YC5W9O5+aEqZ5T6exczwAxgTDDayQd2BNk8YNTHiunyG
	 0POdLyzVl/RqXNMC0CyHXajxZYiBQisxoBGcq4zqM3xMwVpQa1IIjrg4zaBuGqW4Elahw
	 6vVzb871WRUrxEXAMBW07EfNQO1Pr0V9BvnfVE0rE0ubHmkhkZiakETPRT+SkxVm7NVtY
	 Yi1h0AFxHze2E/y2W84dQV/DCmIhyACcmk3UaIyQPNqEsl9p3oBQa1UMWM/X4OW5gcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sDNedrh2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7F606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 06:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A7F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sDNedrh2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3MTWhSJT9zLrFV/2cAQ5sm9AFN6bqm58ww0kcaNzhJ9Ym8P5i0AhfoRUxnDaPv0ql6pXSJMSYSPwgd6u7qJt8eVJKF23D/XhIGPgWQsQX0E73pMD37MC3AxvQLpeEPiP3ULp3nNYBEnkZmeYswdXAgM6lPoMYq0y7FavMra55YBzz3RxgRcRREJl6TWt8T1f3kk9o+j1OoJER/fRIqblGZ9j7h68Dv5GiVx1CpZ6tOu6Tfd5t1ZhFqkLs0aX/PcPpsdhZ9q8d++SzlDKRRen+d14h/PLlcrH2yMBAsalapod0rYB+PP+Rw9tiVfnTCdm0R7YxfkGhni+tm0J4a4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NvxGuMuPgGjzfrrGYAMlusg6v7pJAIDoBbY9GYzFQg=;
 b=o+xjhEOG/LyiV2T1p7dGkJ1+iGIgdmnVgFtgM2DN7TfnfdwZORJSP5KvkYivGfxJwO3IutS+TALNpS2kkGyE8TpraTI2B1l5FYo8zqcUIawGurhzd41aPl5teZADkStN6auxYnvyeRVBjHrysfn/afPMUdlZriUWC+qjh53UxSvzPSY4b5JrqWQdsCRkiOHv1j34oDUQlH2rHR/FK0hsxm4HW82uBMUbz8PrI0pYS0Nb0mhWScFDu82IGu6EhIr5Zm4bIChy/5soT/T/VX+bbQtkcs2wUgBg5qrjX2lq+5e69nyA08a9htMrAfHmxUXigMQKEg2RwJK8Av1K6EFGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NvxGuMuPgGjzfrrGYAMlusg6v7pJAIDoBbY9GYzFQg=;
 b=sDNedrh2kbU+OBbA/aly48W5+04GSfngDxARW3IGtV+IuZZUrK0A6156/SwyF+r1cojtz48xX8Rm3NVNVkzP8m2cg+OJvd376SpLY3+yoX6aaKj87Au/gCM6K4P2xohteDtX28YkgRjhUjAO+YbF/lIruA4z4JVNzf7vKUFZqSMfBEaSxcjWFYwcVPOn0vzzLWrKrpVmJ/uoehClqBN1VxYCIIG6rYSA5zebkyFB5twQquQy7B658jVq/bdw4f+st2TGJRlpJMjCmqbrWuc9reKGcG9LZpxDxyDvvUIN2acQoVjfn9z7xNf+35vpzo4cvwzVQ0+SmYcReKy7cnB2Sg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:53:34 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:53:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 15:53:31 +0900
Message-Id: <DMZU9HLPQOF4.11VA3ZHTLR8L6@nvidia.com>
Subject: Re: [PATCH v2 7/7] gpu: nova-core: remove LibosParams
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-8-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-8-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 612f101b-9d20-42ec-6391-08df46d2febe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261021135927099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AwLls0KrwAG/tIoSJKx2fVAGZ+QiByxfekfMJudiIlnjOTl+PONwxtGXyY8lipBmeUqsdEAASdxq+zuf2EShxPR9ICPNJ6zinu2kUhob2YMkUn2iNjcQj1bcUrAz/eSvm7TiIUCVUe4gQK5OGsl7McaH/lEUisy+XlcVleomH4iu7gZjJ0baPyUs5EiZfRj1Zsr9OhmaXhStRY8Wm5ItjYRngExwoodbCJuiJO8FqsZeBWscQMvneZ7TF9JDMD5x20ku9pcmHjAwlT5dQpUbMEo70J8nEra3E1e5OPSjnxs9Xozi2cbpQBnm2xVVIE+7NqxVkhwjtFgHRFudphxEbCUiaIZHiTKDQrOFECF1VQf+1qe4v+Y8k82JtoNN3npsMuun1cKy5EcuVEqb7BR8uRZTOp7ed4/gWskFcUVMTxR1jrOUy5xfug+9fkBdyPkDKNGj36IrikV6Kb2B3makcTjvd2ZbNJMhpQnWUGRr6I4zStwQ5bBita6S270hYDqazB/3eGwbGyaDZVy8Ef9rF9fDB/xQmK0LAmFF2KY5bUaZzhcoh+VjOmpoTgTUGR33XJhilyxndeGuHVqyvA7bXse9wQjFnWApVgARht6ETJSN04esewYt7eKW6EkHRsTY71Uh8tPowTjbTVQogFtZCQIdzdsrCOKfTiqFoiqSJeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261021135927099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENKRVBYUnp1RndpVTh0TUNWV3NGVWtIQkVFcFFNMFE0OS9vaE9TVzVjR2p0?=
 =?utf-8?B?N0UwY3E2MUlMVkEwYVlMa2NnK2srczBIRUFXMjJVUFRTUXFOUXVOKzNzdlZ2?=
 =?utf-8?B?YkZkbithcENTQnY0UzVPT2d3YnIwZGNEemY3cnV6Z2w4OEFPZmdObjZWbG1w?=
 =?utf-8?B?aFpPaktjekN4NUtDVzYxSHlrYWZ6L2ZreFFlZlNBdUJtQ3RJVWpkbUpYdVVr?=
 =?utf-8?B?OFFJYW53Z2FjNTlPTjlwZFBQeHphNFhLZzZoQ21OZ25HWFZKaFQ4V0ljOGN5?=
 =?utf-8?B?M002WjhERVV1b2I0dko3cUFBam5YdnRLNzlFYUEzZ1g0alp0MUM1R21VR084?=
 =?utf-8?B?UEh5Y3JURU00WFJQVzh2eW9NUktDNXlkR0hoZC9JSWE4aHExeEN0QWNDTXRV?=
 =?utf-8?B?Q2NqalpseTBLSFR5c2xEcmlreU9QV2ZHNmY3b3BuVDZoY1c5WmpZV2hDS3dy?=
 =?utf-8?B?Y2VseTVIRDJzaDVUOTVMSXRJQjhaWXBFSkRrVktQUXpaWFZmd0hlRVFPMVJI?=
 =?utf-8?B?RnVnSDlCL0lCODU3MmN4UE9zNXlsb09PdjVmY09WN2YyK1dyTmJGdzVyWFIw?=
 =?utf-8?B?MTJDL1NmeEpFUW9Hcm81TXJ2UkE0NHVLT2JhSmF5WU5iZnc1UFplTFlFRlVh?=
 =?utf-8?B?ZWpHL290YnlFcWM5ZDVJQzFlVHMrQnFmaFUrWjRYYm9zbWlKM1IvNXRFL210?=
 =?utf-8?B?MGFWT1kvSkZVT1BxYjhtaC9sSmtKTC9UZk1RMGswejgwREY2YWV4WmtSZnVE?=
 =?utf-8?B?RGtaYzFMTFV3VGJSTkF6cHVDY3dhLzBtUStQSlZTSTYxaGdla2o2amp2TjR4?=
 =?utf-8?B?dW1BZlQrK3VsaDQxZDhMdG9mZldSdmx6YXBYU0JCQzlLZDRkR1BhVmFuTU5S?=
 =?utf-8?B?UFJZUkZFdjNZbVFhMlkxV3gyQitWYnExSStmNjU0a1JBRWtFZGdqRGZmdUlp?=
 =?utf-8?B?aHp1R2Y3WW5vbHFxTE4wQUM5WGluUm4zTTJPT2NtWE05Y1ozM3BOSDkxSFAv?=
 =?utf-8?B?WHpEUFgzUlZyMFlnd2QwNitDMTR4SjI4ZTMwZ1FobGV1MzNwQVhTZUtHNDBQ?=
 =?utf-8?B?NCs5SVdhZjBjdWttRnB1MWh6NTEzRi91d2lBNmVZYzUreDlpb0lyV25McFpX?=
 =?utf-8?B?WXdrOHd4dlk0bVhQM2h2UHBIQk9PREd2Rkh0cGRqV2w2RStib0dSRk5pcXRW?=
 =?utf-8?B?eW1Fd3plZk9jSkVJMFl4RlcraHNRU1lKQkFMREVnYXVVVzg5UFJUYnJSU0FR?=
 =?utf-8?B?U3FZQ1ZqQWYxd0ZPQ1diSnlIemdDaG9VQklic2d3ZVhmZlhJS3N1aXU5dEJT?=
 =?utf-8?B?ZEk1b29HZ3BFYTlyZlRvbzZqdldmNmcrbExoaW9yNFhjdlBBSFR0RE9ENW5r?=
 =?utf-8?B?Vm5mdUZreXNFdTlaWHFBTzhQeW9jRE5OalBWNWlKcll3bWRnUHZEU0hDNU56?=
 =?utf-8?B?OTM5RnlwMHhFWEEyajZWWTFZMkxKQ1F4NTI5ZzZrdm5uZjBlOWdQNktJanlF?=
 =?utf-8?B?M3YwZ24vVDIxYW5xOFY5NU9wYll5SUFpaXpkVnRpRm5sanJVSElDQldjSGMw?=
 =?utf-8?B?TkFuVUIrZEVVZFR2UEFUY295K0RYa2RLbkg2SCtHUXBSMWpTU05oci9Qc1Bt?=
 =?utf-8?B?ZWtRWEJTaWszdmNLMGVTYmxpQkt2cndJZzhaa0wxSWZDYy90MXNYZXlRYlFx?=
 =?utf-8?B?SStWQlpjV1J0bEp4YlJSTGRPQlZkNk9KWnJDWEdKMEcxMTVnUTZyMU5EWGpW?=
 =?utf-8?B?Yk0wdU84VEFSaGNwZkdTamR0ZUh5VWdvUEpXSDEwblY5Y3g4dWpDd2FIWjdw?=
 =?utf-8?B?bEk5bjFQdHNCVWFGZTg5a3R5OG1EUDRzL1hJYXZjRDJ5U2lSTlJHVnlCSFRk?=
 =?utf-8?B?VDFQNndwdE13R3lIRHNmak9qUEdoQmJ6bnhrL3dsOVRCUnpJdC9WYWUzbFBt?=
 =?utf-8?B?cDRBOGFWR1FHaVJhYUZMVC80V0FQaURvL1lFMmZwdDhmRUkvb2c2VTVUakQx?=
 =?utf-8?B?K0RtdmwzbFhGNEFkRitOaVhiMzI1WXdIVDN2bXNHUjFuTnFHaFErVUJYY3hV?=
 =?utf-8?B?Sk9zMy9mcnpCNlMrbW9kenNQR2xjNFpwR2ZvZUNtL1V4UmU1THVmU00yQzZT?=
 =?utf-8?B?L1Iwa1hEd09PUjZNS3dTa29HTGNqd3R4Z1hwUmp5dEJYOElUSDd4SXRhbDNo?=
 =?utf-8?B?bkMxVldjZHpkeTB5V1NhdVVrWGdESmltT0pxRmhuZUgxNUxUTUt5OGtGU0xC?=
 =?utf-8?B?QzFLYThpNDdjNFZCQzl3dHR2UkNrdU9HdUlMQmpKVmhjMkZKVWQxdjJMeEhQ?=
 =?utf-8?B?ME9qSlMycXFxRHFXN2ttc09wNE9HWjJ6bmovMFd4TEQyRjZQOUIwSVZydVVx?=
 =?utf-8?Q?vo5TOSCgmY+5Xv3tjdZ9U1c8SBI1xsKi+UZoPJRIuHQPY?=
X-MS-Exchange-AntiSpam-MessageData-1: WfB3a8+ltwazsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612f101b-9d20-42ec-6391-08df46d2febe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:53:34.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3Errdyz47lyUxoNCln0FtyaBH4sgjwhtLX9abE4SsmvnDN4MMHxt9PPKmUz1uN+u5+GIBU69w1o+K0A1Ccolg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> All functionality that was provided by LibosParams has now been replaced
> with TLV-based implementations in GspFwHeapParams, so we can remove
> LibosParams and all its dependencies.
>
> This also allows us to remove the legacy methods base_rm_size(),
> client_alloc_size(), and management_overhead().  These were used to
> calculate intermediate values that are now represented by TLV values.
>
> LibosParams and GspFwHeapParams were two types used to hold data and/or
> methods for calculating the heap sides that GSP-RM needs for booting.
> Although they technically represent distinct parts of the equations,
> they were always used together, so it makes sense to merge LibosParams
> into GspFwHeapParams.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

