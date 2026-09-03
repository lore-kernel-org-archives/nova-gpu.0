Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACBA331EB8
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404789; cv=fail; b=EX/K4p87+RNMt7rgqAWKvG51reqsW9p0VGukjiC+InwqyaojXJDh7sx9oTKSLJp6Clu9FoXpZPTUv+D/VqDcWcCPk2iLLeWC5jvTFH54q1Zx98l4bTUvXq696AfixfV8pUZpwNFxW9xFRIf/gkG8lmASMfk6eYzhjlZiCBYHp1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404789; c=relaxed/simple;
	bh=3xYOi5xRM54jIuTwcGDBScIn+jP6XPvllAxPWGRJlm8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qERFBp17k6bxPpcRCIFimUP54Ax+yzbv2O7gVf0WxpQBEqypyzFy8chz2ksHK9SKaCsrp0rKwzfaL6WyyA/z1FUtJGIhj8YQrSFppTRyICprGslg2xLpJKbyyQ40V1/zFNayjrfJAhZllnxJc3axdhyCSCbdq9+oXUjUpIO6WXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JkkAaeDJ; arc=fail smtp.client-ip=52.101.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JkkAaeDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5T1prdZxVDc8Vyz3bPGNyfMZ1FUG5fJNJtwJRSjxMBEJ58kI9E7hx+XevXBd0gH4qYSJThvC4o7bJD9VsG15ekgQdsKBjq5LHzteHqiWlwVT1i6m+AII7B6M4F9Z6e/Lpc9NO83qlFDd/w67dSbWVQELvat2bO5sb5YTGInZXBuCx8DYC1s2M07roTbJPHjxCDIZ0OuGP5tgulqhVoYJBoYix2X/c4plPWt0hG9KMkJw2yy/VI9hl1HN7ctoPUDcmdUeXZvKJDUICvSAMsMmd6IUKxcL4zjZDXrdl7SCwhuT9U0EKxYmwjBS2Q2jrm7gVT7Pl9PAYJuDmZIxRnhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaf9nWp555RISOonBvngP+z5iNySYFkJKTwzPkGxwzo=;
 b=RLU0c2MCjmuSBfo3aUR4MsPaIMYzJncCjxbn61XKo5wInmqQrtOYVb+Ba/USS63EftpppPfS/j7XvA4Ieu89tNGwgE5Mki9vty0XYx4O0toRi/d8557gkHyEV0xDN75KdhPMzU6DMASGoLAGNWe5FzSrfLzKs9C4qdzBPdcy+LuVgLORzrYtNfnF3MpKbrjYR6DIs8r8xm3v438QA7pzLLF7tv2ojrl4z76USEgiB8Wbmw8Mm28aH4ZOjzvDsjCgy6cF+HnJVJ7fNNCqgxZ6GWsQxY7Re160sAwJ/S/Jl3VTgw6BM9/NbEQwH3ApXpZfuFfzIDt7onLXLwU0fIKuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaf9nWp555RISOonBvngP+z5iNySYFkJKTwzPkGxwzo=;
 b=JkkAaeDJ9EfZjvhqKMzhqfnjKgy0zq0qfz18QdjIRv0jaqSsSZqh+C6cq7jvAvHw6xRZS5aG/Digx1WubYDoi/7ok0mREgqb5QPlCR2ishdewzAow7KXgXq7hl4Am1ZNdwN6Yiyy5FzMNZ7XeQQ6dorsu5ikVCYBBX216Gqn0z3WvuUljStf5zWfZuh2s+UVxxx+W5JpUWHVqiy2Nd7WPJn9akJzaFLuqEqIcwvhYDT5k7H+i8CcIx1m0HleBtYpxaxBHyQDMLPBttIL3gCpJNc3nXWj7mi7RhFYWdDzQi9olaFf+hsvqVanFIK1KSIe4TV3FGelVpdfwXGcpNsdLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:06:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:06:21 +0000
Message-ID: <51acb6ee-946a-4167-8a27-d14fd2d41555@nvidia.com>
Date: Wed, 2 Sep 2026 20:06:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] gpu: nova-core: drive GSP events with the SWGEN0
 interrupt
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Will Pierce <wpierce@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-17-jhubbard@nvidia.com>
 <DL4WKU4TOA0C.2FGP44BOVFHLV@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL4WKU4TOA0C.2FGP44BOVFHLV@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7c77e8-12cc-46c7-c6aa-08df096854d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n9rnFDS++d4Uwxlw46ZCL7XB9SGl/l0dAkX5+aBaZvccZ38loAGlYmKHLquiwFTg7KxLNK3RBaHGvgCRSk404xzVW3yIB6vbZMop3RweyssJWrF3/ZY8HDoAZ85X8QmMDqkt7TVCDpbxshg/jdquKSrQJEgrAdicpHtWS1zD43UQlaJy3PivEjc0esVGt6stNu2iwDdUSy9mNdU8ko7zAcpoUxmP9tdDkDbiuwqqxs86xYK7s86yCA9bGiwcxt5Gm9tMim0oK+GfF0PWeYyiXQXj8fiP7yiHJNo0CU1NszmNi9F/YitRS8DNQkjrehcDzxM2M1btEqzi8duI/oe+qxtQSJeGA7n6M3c+Lp2D1iIZcDu122Xuz0T6xuR+yvQUefq2RH1HvI00nWRvoUTEGxGHkdZVt9TYXGj1xS91drYIs/qjuZd/QpgOYhAmEIWVRE09PDsJcvxsbO1SertjWJeKEyofUkzJy+wTqjUfrgUWAkNEjimK0wJa4/CjHBEtNQo3gv29ffvuXrReCRhPlrigPtIPaQy88W++aUzk7U9tU8HO6jlsiyorbODfz3jcpCQnJMaq6IN76pk4Ff5E6zmOGF0Qw6GUS5xHxIR028KRGuQs8mSaVxCZlBcRiQ7+Urw09WcRCJFN+J7t9mLbpfLGJ+uB5BFR6MyzYSII30U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkJRSkJDSm1Oc1JUWURrRmRscmUyeGRySkpjc05jR3FTb2ZsWVZ6dCsrVjVV?=
 =?utf-8?B?MkgwNnFRMC9VaVpwdHhXbGZTQmxVb0VMWGR1TCsvamtrenVFNzEyNkw4T214?=
 =?utf-8?B?K1I1eW8zdDJNNmVzVG1pZ3ZPVnpRZGwzSWlncFkxNlpuTDgxY2pWZmY5UTJp?=
 =?utf-8?B?MWRadElXU0lLbG9PSFhYMGlhTERSVE16N0crWVRDM0JOU1pDLzlkSmF5UFpF?=
 =?utf-8?B?M3MyZEQ0UzZlU2o4Y0dRckxJTXVIcWVucnNQL0RnM05YUTRwSTFYNFg3SW5y?=
 =?utf-8?B?VmU2Nm5aVzVkcTJHRVRGajMzOXdQKzBla3JGenFNRGtqN1kvVjdwampoNGU5?=
 =?utf-8?B?Sy9FOW5YWUpaWFI3ajZXM05tR2hROW81aEpJV0s4L29WdW15R0FzNUJFUWlE?=
 =?utf-8?B?T0VyanRKdm1PajhDdFlqTmRMSGhlZ2UyZFo3ZFY2bWR2TmNWakozY2VDSVhV?=
 =?utf-8?B?WkdnQWdnS2IwZFE0NGo0b0kwdis0Y1NxR3hocXNoS3hNVXE4dVFvYlYzVXNa?=
 =?utf-8?B?TjV2TC9HdE1FTEtYc1ljTjZGM2Q4d1poTUxUcGlDNFljUDRYaUxsbWxDZ0Zr?=
 =?utf-8?B?aDMrWG5uQzEySHpWQW5qeGdaRjh4bDRtUm5vWmpKb3pqSDVpQ1N0NnNQL1Ux?=
 =?utf-8?B?R09GL0tRR1pIeVY0RFBjYm9HeHVrZ3VnVjlOOGtKd09oU0hTaFBOQWp4U29k?=
 =?utf-8?B?VlZjZ1dYQkN4TlA5MU11a0JvZ0pYU0ZKbTNZWnJNMDlsUE9DS2poNURNQmxY?=
 =?utf-8?B?SmI5emJLZHlET0dvZTdzdUZKejVaS0RMRFFYdnk3UlFhdjRwVGNsMG1sd3NM?=
 =?utf-8?B?OHQwUHFMZ0c5dE40T2VSZ3BxY1VsT2syamhLRjFCQlFPWFM4am9mMkNuNUEw?=
 =?utf-8?B?U2pKcGkzZGY3Tm9xWkx5STdKa0ZiVVpVZUpSUG0yU01sSEJReXBNYld2SnlE?=
 =?utf-8?B?SnN2WjFSdVB6SDN5a2ZnWlBHSEUvQWRvWVhRRWVZSGFJWWNnd2x5ZzVMczFG?=
 =?utf-8?B?TUt4dWN4UzVyL2FXeDN0eDU3d3o4TDdsME05ZlZwamNzbkhpTzNYQ0VtQXBM?=
 =?utf-8?B?NVAvK2Zab0NNY1QzT21jc0pzQmhFcVVzUHFrdHZBWWhuOU1jMWVSaGtOc0tU?=
 =?utf-8?B?bHhMaEUxTTFoWTVyRkEvRWJNUTNZb0c2L3BUQ1JPZkNKc2NPR29FVEFmU3Q1?=
 =?utf-8?B?M1lVcXVZVzJsQmVrak5SQUcyV1JjWXFwYjBFc2x2dnB4d2g3WHREQXllV0tp?=
 =?utf-8?B?UHFOc2hVeXJTV0NVbUl3Z3lKTFI0NW9KREFDNGc2NWxKQm1Pc2NveDd2ZTZI?=
 =?utf-8?B?Z0dLMlF4d21KTG1BS1pjMEowMWJlbFpkYVVQRmxIVUhrTmdCTWVEc1JYVnAv?=
 =?utf-8?B?L3JoeXB6QkoyODM0azJnZFA5ZVk1amFJMTVUWmk3eU9ZNmJUeVd4M2RFR1Vv?=
 =?utf-8?B?YjB6V25ydHRsenpWSExCK042RFlvRUF0ZzBVcHRMSG5LYVdlbnhBSUkzS0xN?=
 =?utf-8?B?N2JXNERxQnQvdzgyaW5YNE1kYld6YkJZMC9kR1JOckprWjVjQndtajVrOUxH?=
 =?utf-8?B?OXhlOGxVUmNqU3o5dEhsemlPd3ZWb05pRlhSYWdGYSttL0JQNmdBbzF0VGNG?=
 =?utf-8?B?WmNpWlE1NXhlQWpkUHhZKzN0OFRKNjB3d012NEZWdllaYVpNUlhQMitJN2l3?=
 =?utf-8?B?WmtVVFk5Q083dFpCdENFQ3lmc2E2MUVqY3hGYzVYT3FvTk14UGo3NHNSOVdZ?=
 =?utf-8?B?a3FhMWtxOVpCMFY3NDBsamtnT01ob3NsdWlaaW04ay9GSXFsSEUzdnQ1OTBo?=
 =?utf-8?B?OG8zbzZnOUtDc3d0RGtnc05FMGE4WEl3Qks5b3dBY0x4RHBkczZGUzByQXlB?=
 =?utf-8?B?MmlaZko0bVNxSXB5WVhlenlTT1J1bk0vSGllOEk2RmhQRitxaWJOT21DeVFB?=
 =?utf-8?B?YTFXSlJMNGxhL25ja3dHWm1sdDJXOFFldTdpeTFTK3RVRDgrNy9JeEt1SDFp?=
 =?utf-8?B?MHYyVVlTckdNUVZ3eFl0cXI1WU45VUMxa1E3YXFsRkhxRlMvTkdGeXdRSVY5?=
 =?utf-8?B?R05NQ3IySi9mZ09EU25TQmFMMlk3RDYraXZVRnJaUG90bjVhb0dNaUJ6MS9E?=
 =?utf-8?B?bm1XeXJ4YS9CMm95Q01HWjdRak1wME1RSkZCUlpxcDZrRFQ1Q3RDR09BZzRG?=
 =?utf-8?B?ejhHWmhvdktWUG5Fckgrb1RiekRrQU9SdjhFcWhKbTVSRThWeDEzL3I5cnZV?=
 =?utf-8?B?RVI1NVAwOW5kVm9zUmhqNXRqSWZtNlpYb1ZSeW9PczZYZnF4WFFYOStRbllX?=
 =?utf-8?B?MG5qMG5CM1FtYVJFcllYM1V0Z055eVlERUZMaVVSK2VlYVpJSkowdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7c77e8-12cc-46c7-c6aa-08df096854d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:06:21.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz/915OrfW0prs0TfQFmrwDENLjrbaZYdaHjzGqmkY155s3WshI4LmKMPmobwzoI536ytvsdb/9Kj23/rIQAMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359

On 9/2/26 7:33 AM, Alexandre Courbot wrote:
> On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> <...>

> I'll stop here for this revision - I suppose there are more minor
> things, but it will be easier to discover them with the bigger cleanups
> applied.

I'm going to post a v3 with all of your and Danilo's feedback incorporated.

I've been fussing over the interrupts.rst document a bit more, btw, and
maybe it helped a little with readability, we'll see.

thanks,
-- 
John Hubbard

