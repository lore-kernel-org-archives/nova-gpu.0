Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76873382F2F
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115166; cv=fail; b=WJ7MsrBcp0MJTfmv3DuVmLhrU2B7elXLdx/sZfEor0Z/O7BniD6188R5iMZ1GeJDcGnHUULUJnilyf4y9009OqaMp3+raedZwdDUaHo6oNvKNrcG9LpyqpFrV+XnQLxgAN6C4h3L2HRENav82riV7BO6Ss9/DKQb+6cuPya9J+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115166; c=relaxed/simple;
	bh=Y6myvlrR9KA3Bnfwhk/EYIWEZiO4OuSFvkxoQoIu3/c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jz/AjmU7yPcv0UKbZAWRjZDx/EiZS1HpZI579iYW01R38GT3KXOxoVGgMjMA0WHMgJbJv4kE444QTcq8r6K4v9XJ/cdLx9pbZEOjyZDhQPDF0vsQiILRX7RqmaGOj3njsHdTcC9E8niuakNSeW+0w+err+XQiOLvKJBz7ExcVGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W2Hx7cz2; arc=fail smtp.client-ip=52.101.57.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2Hx7cz2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh81/CE7iiBpeYYBmo+gnZDVy7AIdAAnzYHKbOLzLmc+Ko9IwuEkYBQZ+Se9qt1AibxkvjXwC+T/lPLkKskmi7ZRkHEykrQ0muyzW4+Ucn2h2W3/GB06C4J6NCAdGgHCKQoFYVsQXoYkMTN/U6f9reXqR90LmpxoH9ur+5X4pUlvFEoTDfRezv53Gw1OxL3OonD0BvlfDlkNE3xrdDiVBEqjcQuxc7vm6jA5fHoTnXgf/KPOmUTaUu8Pibxe7nsxMwNGcWWS54p5qvvqlPaI/Ui/f4fGGz0R/XgQfu8kkqJ8TEFj6f6UnOHzmBULFPC8G1WSxbtkh3fJv7kODz0Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6myvlrR9KA3Bnfwhk/EYIWEZiO4OuSFvkxoQoIu3/c=;
 b=l7dYTL3SpBtJoYOwbUn75iGacMtkW4RE0cR3gCOMPgFt3yduD4dje8g//T2rv2+uTPn/7TfPtslV96vgp88cq3+hhPpFTx+E660QNRmVGvkJZFG40LcU8eacyBDOzlVYQZWu5rB+HDlL9R5SeTx9cHkrlhvwnKa8xUVu932gin8Swf+IBRnWbjJPI0TT0VgVe7pauUgHQFta385jT+2i+h6UWcd7IszeM+apwNEnFEjJ2YVAR2zZzTbUMjMyOfWej5mxwaYzw6RS7LpVh7R8K0R/Y2imSsitnj4lF4tycnNXnYRwfyjp6j5ltioglelhGzAx1Ut+VR9U574/I+BYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6myvlrR9KA3Bnfwhk/EYIWEZiO4OuSFvkxoQoIu3/c=;
 b=W2Hx7cz2e+gbBJN1tjUCReZzn1hsfhSooLCdGlNF4xHATGLE1mr7HWJwUgFir7BpG8u36XshjW+VP+9dKWnwHO6yL0q0D1llbC9GjxAabJzeqNwVnccTlqgvSYkPr8slHYlsKsLNmsJbzJl26zi+dIVYINYuIzgH9pivfZmuGaDRhV1gWUMekM08IKE3xvFKhqbNFaD0OtXSUdQu4FLug4A0JlG+lMUBczP46f8jhQ48z6wauFf4KEchURR0DYwpRzJf2GT9kJw1df4nVjyH3Dk7R98cOdP3GzgaBiROaE7fFI1hcXC0bmSIhT4XYiJg/kbdVtsmHC/C0opTlumpKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 07:59:21 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:59:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 16:59:16 +0900
Message-Id: <DJFF3KUNHR5T.TQ4AVJEOA1GS@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/13] gpu: nova-core: gsp: move boot code into local
 closure
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260622-nova-bootcontext-v2-0-0ddeafc06f5d@nvidia.com>
 <20260622-nova-bootcontext-v2-3-0ddeafc06f5d@nvidia.com>
In-Reply-To: <20260622-nova-bootcontext-v2-3-0ddeafc06f5d@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fa77ac-7c02-4354-3419-08ded0342add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|10070799003|366016|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xqmkM3ABPkBUYtRw20CQ0Uwe5PKILAntB/Z4hMBFTbx8YkIdU4DhXTSqtRW332VS32BIRs9blfsEUoBcJUxjf5lECYQhmgWJwlTXcc14D58pWra5/yNR5yX8F9BugWJS5Sfhzi5PFafELLLMPeufss2OvPiH6QmjvHucYoaSud1sxMGC0D4Ih5WvkP/8COzZozDOtN+eu5IOvfpo8FwQLWtfBiNVIY/Id8pu2sT4J1a7RDg79AGnPoL58bq/IRbRsJsDoQx8dvodaagqwkSOPDJ5MT3oVqBhgueowGrdkVA7W92eWxzga2VQRE0FcJEJ4PI5ifF1TdzUXkYXANAO+I3gZOkVehdvMiSHYuj+6FNaLOgO8f/IY2bDGqiKvt2tpPhe+BQuWHYx53B4qkwYeLeKWg4RrDBn9OtX0hII9yFDm56ZwLKDk5UFe2BlxLtI/TMNqIHXSRHLOEwVtg0D8PDFFEVc2wTiQcKv+TNzie5q3+b+I69GQNpo+4KC1taCmpQbuSjE7dzsnapggCNNO7V5GdCD/rjJnhZvIU/BA6/u97/3APjHZt3BCnyC0yYT5TQDocOKDRlSNsJgVXYeIE95sYzgNAzQ1e17HHTBgKGZf99JkE4UEOq5US3xnnAdcn3kpqw50poZOPNHNsD1CbJob5bsmpvNN/f4IBQ6V0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(10070799003)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdaZThQV0QvR3FEU252dDlsTGFqU2lhbkRzY1VQU3l5YUhyYnRJT0NNalZF?=
 =?utf-8?B?amhsdWdHZEJpcGd2S2FGcEIwSEo0cG5VTzNUWXAzMUsvZnk2bVM2K2VFOFcx?=
 =?utf-8?B?U0E2bTNibUtLcXRkelFtU1VTQW9FRTZQeDZzZHNSV05vS3hrN2hTMWlLUUht?=
 =?utf-8?B?NTgwS1Jzcld0ZzZBVDJ2YXJqdEFHcE5Wcjc2SytwMjZWT3hXUUI5MEdHcmFn?=
 =?utf-8?B?emUzOHFwVWM5Z2dGTyt3Z0xwKzJMa3B2NDVEYUtMTDZ0TkordmJPS1BBQnlr?=
 =?utf-8?B?ZHNlYURaM0NKQUdpSEZweFJZbC9neEJEaWR5cVUyNFJqdGllc0Q3TWdqWVlt?=
 =?utf-8?B?TnA0MjRBRmdTVmVNMk5hRDYrMUJwUnlMNE1ubVhSdVNOUFpiV29JTnZwVk0v?=
 =?utf-8?B?MnVuaWVkNmJHS2tWeTB5b1NyQTBPMUNEeEh2bnVCSWdzbTJERm1ZdjZyd0tX?=
 =?utf-8?B?TzQrZmNCUHI1M0dIemhhUXMxekE0YkNCQWVjQVRncjJ5VUtsalI3WE5xUjV1?=
 =?utf-8?B?akU1TldreWhHZ0QvMWRlMmY1OXZQcnZpSThFcG5qcTN1OWM3YnQxTlZDblNQ?=
 =?utf-8?B?cHV6VU8rbExmWFZNQjNsOStXKys1Ump2ZXRRNXk0eWZZQjBHeDJSMUNtQkZ1?=
 =?utf-8?B?U24xVnZFNmtKc1ZxWEdmdk05Zi8xV1VFSkhrekNUUnpiNGZZOVM2Z0hBeGNH?=
 =?utf-8?B?NlJnMzBFT2VrVk9TRllpYVdPS3FKNmxMOWtJUUlGdUNjRjRsdUUyTUZQNDR2?=
 =?utf-8?B?M0tkMUZObThLMVRaemUxcThha0ExVUNNM3dibGtCbWpzbmdKSkRVL2RKMXN3?=
 =?utf-8?B?aXg1WWZaTkVqZ05JNHJLSExPK2FHTHlSd20rTDBaeGhORVRpS21LT1VjaEJC?=
 =?utf-8?B?OG96QmYrN0lZY3VlY3BBeWEzY0owK1c1SlRhN1dpV3VkY0tLZ1NVNDRPZm5H?=
 =?utf-8?B?cjhSZTl2anJmN0RGMXpkV01BdE5BVmQxWWZKYnNieE5NbVN5TXlMOUVOdjRK?=
 =?utf-8?B?TmpncmNldWZFdmdVSm9vUGxHVTBHWmtPQTNlbTl1SHpKbkNnVlFBYVNVOVg5?=
 =?utf-8?B?VFNXRHBxYTJtKzlvN25QNzlTYUFsUHlwZGFkWm04eXVUQzlxOU1BQjVDb1Zl?=
 =?utf-8?B?ekFGcWoydUduTkJHRmRUdUNJM1F6WW04S254OFJIdzNSenkwQ0U2TFRUZzBS?=
 =?utf-8?B?WkErVzlvdTZzbFhiaEN1bFB5RGpkelI5Wk9JVWYxbjY4WFlTMDFJazZmY0NR?=
 =?utf-8?B?dytJUWs0aXhwVEEvZlR4RG8xY3dHWXo5SUY0RmxubFFPY3NPaVhCYUxWWXBl?=
 =?utf-8?B?aVN6QkpObkVrU3Yrbys1aTVXdGNPNU5NUk8xQ2RNSE1TOUJuMDd2NDNUZmdL?=
 =?utf-8?B?OUhNR0ZLTGdVTXgxeXYwdDk5REgyWkdlblVHSUdPejZ1b29tN0l0WXJEWmpU?=
 =?utf-8?B?ZzN1aWNISGF4MDJPeHZ0MjIveU5hOTdSU1V1ZFBJVmlaaEdnZnkxelFITzkx?=
 =?utf-8?B?N2hEVmRUWEswOVoxb2J1Tld1N0FIYk1RSW9rcEgxMmx3c0NIS2MvZXdyZStr?=
 =?utf-8?B?a2h6cWxiZjZhVHpZNlgrUTNrT2MvOXI5SkNYbm5QbC9GRndkN1krVysyR25M?=
 =?utf-8?B?Mkc2SDJFQStkVFg3UmlMdUs1ZEJoM3ZUUUdXS2FnUWNKMDlHQ0JqOFdmQ21I?=
 =?utf-8?B?cnRMbDViT3FhSzhMRGg2dlpDaGdpK3ZQaVZnMEp5dVpCRnNjSlg3VW4relNP?=
 =?utf-8?B?Y0RBWGlXNVNOVHBHekVPTUdkUllOR1F6VU1TeUdXODRZTkFBYVZkcWxsajY5?=
 =?utf-8?B?QkQwUjlPRXdNczZkbWJzVEN5c0ZiUklwNnF0YUR5TnhmWFpFT2gyYVhCRmtu?=
 =?utf-8?B?dnNLaUp1M3loY25maGtzdkYvOElIRGZtaSt4eGl5MktZNzRMTTAzTzNyc09Z?=
 =?utf-8?B?a2Z6bnIwS05wKzJiTHpsSERsVXk3MFpTNlFocG5GbVdacXdGSVM2WEE5N1Zq?=
 =?utf-8?B?bU5PYmdJNndUM0dEVitIVWNyUi9rN1BMQ2I1WDlBTVF3c09SRS9oR2lYQjZx?=
 =?utf-8?B?Q1pPTE9ZQWFhdVNTcXY2V1dwM092dTQ5MTdGTjJBL2kyaVAwb2xMT3lvWk1u?=
 =?utf-8?B?Zk1kb09SVEk4eHFMdmxoMXB0MFV3SEIzL3hmdlI5andRM3NxQ3BDaWpmeEN4?=
 =?utf-8?B?MVYxbjl3TGVPUXgreVg5aFVFWjVDNk9RU1NXVDhDcDlMODJsODV5THFLQlMy?=
 =?utf-8?B?WmU3VmNiMWpDOVRXSDhWVVZJcnlObGx0aDE5M3k0WGpGUWNSRUxPVFZvdjc0?=
 =?utf-8?B?RmE0TldIakNzeDl5YlNhVkVPenlvTnBKeUV3RXRMUEo1am12ZDBsMGt6dlVB?=
 =?utf-8?Q?ezDdbf9mQYzg7hOAhMTgxgU2q9AmiFNH6hG/CcrHYdaHH?=
X-MS-Exchange-AntiSpam-MessageData-1: b7BgDJ9k9lWbEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fa77ac-7c02-4354-3419-08ded0342add
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:59:21.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3KScnrbjoagO9lwsxnARyB2shgnvpDS9u+Y46/IgVcvgYfZgzN/pOR44J5UX+pdqY5SrUgb7CsdL0Teoth0qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291

On Mon Jun 22, 2026 at 4:10 PM JST, Alexandre Courbot wrote:
> The next patch aims at replacing the cumbersome `BootUnloadGuard` with a
> more local and less intrusive mechanism to run the GSP unload sequence
> upon GSP boot failure. Doing so requires running the boot code in a
> local closure, which changes its indentation and would make other
> changes difficult to track in the diff. Thus, this preparatory patch
> moves said boot code into a local closure that is run upon construction,
> so the next patch does not need to re-indent code that changes.
>
> This is a mechanical preparatory patch to make the next patch easier to
> read. No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

See my response at [1].

[1]: https://lore.kernel.org/all/DJFF1W6VGY4Q.2PV5MEPMFXIDB@nvidia.com/
