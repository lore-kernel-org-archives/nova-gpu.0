Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DC428841
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484231; cv=fail; b=oiVPOA9TPCIe25rNOBzCYrtLhNN2ea3txGjFi3iziCPCqssQLG2rRbX529Waao81UZ8sPat+uG+jmNU+kUClKpwmsfD1JVBzSnG2kxkX1ve5re6Cj/O2S3Lb3cj7xQUHjyNNucXrrZPx3OPf3edyxCDj9z2YrxAR0cUukYaIXVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484231; c=relaxed/simple;
	bh=GJJbdLjhjwy7ITwhTggbNnH+lA8F1uZtLdWZL6+gMfs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EGaW3uWmUC7r+WrdkzezoSDy7NlJcwJYxOIYwkfZhPkXrFyblgWdGvK4KBjNNnJ9xYlRaBqmYSvgLTVMjF+/buJwvOoNHJpkupp/2fzwWN9ebwK4TRYve8RbeRYZsyDIYN3WyFCPo9vZtT4YJnLcz8cb9DZYZw5rxjTJ8GhfvHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kzx+GWIF; arc=fail smtp.client-ip=52.101.53.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kzx+GWIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzlyyPEwN2Hl7pvlMHd6aa1n1xB/YIjwttW996nGylMnOm/BSh6WGaY6U6eG+6O/A5kiCBW6wnytiXdSrQmaGNYEH3wsF1TNxRX3SclV4p54Oe/Q3t00DWHirNics/vDVUfF2Kvp2TDGMr2THvW/317Q3VLNIna/p2ahiS01VH/dTF95vgCUgFUcIBeqJqWYeW9/tdGhs16cPgIxyBzK/YWMgEdfPBV3HyN5HGznAcBoVk0lNQXKBV0C2iyo+NvV9y4f2Vyc+NwfJ8xcaLCErYm5mONejNGhb+l4DRR4u/nvIdAXFXR8NQtFkeYxcl1uYFD1U3lO4kCgyNHvgtPb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N+If9MxZB7jQdS4MKjgIgOKFzzopGPgybyHSjHxm1o=;
 b=HOxOJnr9barwBFzGBxRbJ9ELVRygk7ZXcYa+NFzKPq9L9663fVN/SgTQz0QE0DNW24jN9/nQCwEiHAEw2QOiIt9s639x443+k6DLHVChGB84jr6eXx4zS9rIUMal4acSTRBBNuDtX6dbw1QW6094iUsrhKA4WeOA83llnOScAZAqvZsg24BVUx3xb7hUoOCNuubGScqTAlzKdnNen/MdR4nAMvgxqUaV+m55a4WQULnowXWiuEsu7d6aQETWVNHXmBuMyi+oZnNWMfG/RkeAcn0qEAFuPP707ho03oIWgW5bfI/iaTxlo9YJ4VH5p3fmbJ8shGHZhhs6KDYEgQ090A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N+If9MxZB7jQdS4MKjgIgOKFzzopGPgybyHSjHxm1o=;
 b=Kzx+GWIFNyoip6hzfgMEiVShpy5L2SVNehOAm4VgLBV48T/wy3dqZcNwypa2bAcGGW767F8wdxWEBw5BVaTkI+LUxtLaRzbr1cKzstABG1GU6y26MIEqEVclt2HkGo6eE2LXf9n1sUA64/8bN4Fq07BPu9mRXB+YzJXtDmfnLToMx9Dh2RVQSuzss4xEDi+Qv+L1LXM3+obYFooFoaxF7/5wHszsA4dNJ9g7LpJ0BcXFluIjXtzGYHo6LPOWlDDBW6Klo5eG8lEWdOVTXFhLy6BUkOfEEpx/yUhYq2KPeuhEkSyJAWxUaZCuJXMMvXGdgDymz9t/OYSM45Mp1UraPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Wed, 3 Jun 2026
 10:57:05 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:57:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 19:57:02 +0900
Message-Id: <DIZCZBWGNQ7C.39UOQW2YUPXEF@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 4/9] gpu: nova-core: Hopper/Blackwell: add FSP
 send/receive messaging
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-4-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-4-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: DS1P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:8:453::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: db86c0ca-e98c-4b60-999d-08dec15ed937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vRDBexTlgG9RY0q4uYxG+UQIjDwiXmq1uz71En3K6DW3ZOw0tLuLVn8CJYJ36irJajOXMGjVJCnOQRFlRVx2tgjsaSIh1ZbWydeY9TsClA6/4Vgm2ilLpQv/Z9LJMeiR+v2HjJG18GDOg+QGo36m057qPg07pLRB0fE40lBSADQmAx6WWNaaqzgdXTgVSBQgFcRqz49zIJcYc7sTp418IK6nJd3JxtsIS65bkWfu2Vm2jwBd++zdINDun0JYrDup3vg1cVxtsmVUIXAwXlMHr+rH0yOuMoY5urhOGj339m+dQM0/4IR5maqn1LdiiLgciLkp8exZBG1o7EB6nbC2bUeYAxdL9IPeBsV8tH2r44Fmyh5931oDuviW3fySBe6uWgWdf1J67z87TkttHSPhcXePKVL+n0zsKcx0WYUI+21EbOO9IvibWrwz4YWnRrcbAF0cNqt+71eVETKcMfu/ovgX6hCzhG9DWEG/sK/zAWB397cEOfVHUT81vQzDSeEY+Ke4uj1sYUDN8G5VzLOC9AXFn/AnuwUdzNkG1EbAK3WH2MbmBHy6TAzYd4mDaajGrplCcGaec0ZeF8PgFinyc83gpNl1QV6lMG0qpgKJOsfLW30Stslif8IZvD2j2Y5W893P8/qdy+2fBBpjECojDKXlQBubAPLgofPOOYGtv4VsnZYRgn7ivjEB0VvCaMoE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWUvWjBRQ1dMNGtueUE3dEtnUGlZVkx6WERHbHdzTm5TL01wTVJNK3ArRnBa?=
 =?utf-8?B?dURxZ21pUzh5UjYwRWhCSXNVNStpU3FWVTNNTFBuVEZLcEJEOFZQQU9LMncz?=
 =?utf-8?B?SWFBd1R1Tkd4NEJ2L1BzSHd3L0RPWUdOckdyNDdHWnVoWTVZS2ZvOUNzeGV4?=
 =?utf-8?B?K21nWER5SVgzajZDUHpzdXhGR3B4M1FCWEhKb1ZSYzlMSVVaWTFqOHZjalNv?=
 =?utf-8?B?QUl4YTViS3RKTHhJVUYrL0lCRUhGRkVRMkNOT04wSEVPS3N2V2ppclhRSm40?=
 =?utf-8?B?WGhtbnBmQndtbWs3ZGdJcGkxRi9qL3BWcjFiRjlQZUV4K3hjVklTSXY2eG9W?=
 =?utf-8?B?cDA1MXI4Wnl2czZISXJHclA1OGRHcUVHTmlsOGRtaFJQR0dxb1FDdGZIbG1H?=
 =?utf-8?B?eERXdktmZ09mT2dVVXRFUG5mV1BJVVJEbjRVd3I1bnA3YVpoTXAvbUJNbmdT?=
 =?utf-8?B?aEdpSSt1S29NbUtFUmxmT2YyaFkxZ1BnRlJIV3Q0bEdRbHVtWXdPSUVwVmJy?=
 =?utf-8?B?T01sbi84Ri96akM2RmM1YmhhMUtQd0xDZzBuc0UrM01sOEYxNzQ4S2JLZENX?=
 =?utf-8?B?VEZaUlEyMC9sOHFFWkV5eDJtaVdhbDY3cE13R2RKNTBXcnhrdWNTWnZBOXNE?=
 =?utf-8?B?RHlTSFF2TFBScnBtSThrZ3JpZzFmWFpubG1xUkRObWJBZ2F3eHV3alI1eXlO?=
 =?utf-8?B?RE5XWUl3VEM2K3RuSUFaY3BMemNISDJNTE9oWGJwU3hlTE83QmJzUGV6OWYz?=
 =?utf-8?B?TjJlQTdXM3BhZGdkVWtocE9ocEsyWUlVVGIxRnFWenpMYTlORDZRMVBML2pO?=
 =?utf-8?B?dk9PekxmaHc4Q0NTdll4NWpXTjgwYjM3aFhGbEVySXNNcm9kb1h1K1JLTUR4?=
 =?utf-8?B?TnVzVUdFQzJoeENrbGJRVGt0RmxsNWREdkROdzQxa09wY2w5Tk1UdFlJbFA3?=
 =?utf-8?B?dXJyeGplOTd6eUF1amlOVXFrUSsvTzllTW85aFRmU080UFNYQnpnM3lOQkpr?=
 =?utf-8?B?c0hCdTdlUXFIYXcybmt3bWRINnQ5NVdSZE4rbUYvdzB4L3ZmVUJQRmdJc1lt?=
 =?utf-8?B?Qm1VL1c3cFFXR1dFamwrMHEvVnMzekJZa1hJbDFqTUQrRGVSajRFcGZkUXJV?=
 =?utf-8?B?OGgxaEkxWWgrakNqeC9id3J2UUxCMlJIcHNGS3hJOXNaTFBhQUdYTmM4aUMy?=
 =?utf-8?B?TEpGNmZCYUNUbWswSGV3czJydlVqNzQybzhza1U5dEZabDJiTzJKQU4vY2wy?=
 =?utf-8?B?Uno4TnhLU1dkOVo5bEowc1psOFRwZ0tqcVJid054OElXcmpZN1VYUENCMk1N?=
 =?utf-8?B?cVJXRzFLZnRyYmZIWUhXNGhZMUxEbHZGV2J3YUlyQ2Q4NWxVS000YUwrTzQz?=
 =?utf-8?B?dTVhMS9vNWNjVzFaZ1B3UDRGbEpKQnVhSElyZUJjSXlvblVBQURCTjRJZmow?=
 =?utf-8?B?SyszbXByeFhpRFdrVUVlTFhoRklzM2lxcGlKRHZuQzhHSGtRY0FianhTVHBw?=
 =?utf-8?B?R1pUZG4xV1FNbVJXS0lsS0RVV0xwSERGZ0pqS1V5TGJ3RDc4bHhMUGdWRHZu?=
 =?utf-8?B?MTNibmtXMzZuZUdlWUpDMWh3NEVYMVBmK2NRdm1waUJvZ1BiaG9xSGpSeFR5?=
 =?utf-8?B?OEo5ZFlzcGN6cVJMQ3ArWmtYQ2J4czVhN1BTZlAxZVhZMldhNUFSRlB3dHVz?=
 =?utf-8?B?dnUwTFc1cHlkdGgyWUZZbzNOOTkxSDNtOXBSaW9weXZTcEpQeUY4YlpDTjJH?=
 =?utf-8?B?RG5ZaGxQOVF4NlRPOS9wcE1OVHBnRlJ2YVIwOWdVbXFqQWJpSUV1Z3h1MzJS?=
 =?utf-8?B?ZGJ0ZVZvU1pOakIxZFh2ME1vVDR5eXpDYmNxVWlMMnBMck1pNnhidzROb0hF?=
 =?utf-8?B?d3YzKzA5Q3BmV04yOVdWS2pXUCtDS2xKQXBLMnArcHAxU0tVYmF1YUEwazk3?=
 =?utf-8?B?TjZzdUdLUXZCbHNVTDdWZzFuQzRpL2dUb3lNeFQxdHcyMVVkcmRGYkFOMXJ4?=
 =?utf-8?B?N3VYbGtrMDREVzdWTTJPakdBU3NmSVhaWHVzNVVob0xkQ3F2Yk92ZCt3cmFH?=
 =?utf-8?B?YmplUDVpWWNLbzBYL1FjMXlSdE1iYWtPaDc0MVd4RXZINXI3YzJnbjcyd0dX?=
 =?utf-8?B?NzB3OEFsK0NGdU43dVBvM1JnTDdodU4zY0ZjamtCUGNCR1poODR0R1B2Q1FS?=
 =?utf-8?B?aDJ2akZBNGpoZGRBRm0xOVZ6WE1KRjd4c0tqM3l5Y2ZkdzNsOHJONmZTMDFt?=
 =?utf-8?B?QkVjY0ZMaVovenI3dUVuRjFscHJIZ3dBMUh2Rm1IWmdxeldBY0lBQlBhTlNM?=
 =?utf-8?B?VElIWFVJNVg2TUp4ckw2OGV2c1E5akV1K3AxNnlzeGR1OTV6RWtoT1c3Sk1l?=
 =?utf-8?Q?oPZ5M/mkj9WG1Ja1ETPdSYitjIGBd2LalOaM7BySbF5CS?=
X-MS-Exchange-AntiSpam-MessageData-1: 6hTJ6UolVMXhZw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db86c0ca-e98c-4b60-999d-08dec15ed937
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:57:04.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCwh6CqfI+ZaA7c1wZNzjcLpIFkqc1TpZ1YPzFRN6r+l8IsjPBkEHCSL3lWp0LisK74+GDAsXC5YcQDQxD2acQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> FSP exchanges are request/response: the driver sends an MCTP/NVDM
> message and must match the reply against the request before acting on
> it. Add the synchronous send-and-wait path that validates the response
> transport and message headers and confirms the reply corresponds to the
> request that was sent.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---


> +/// Trait implemented by types representing a message to send to FSP.
> +///
> +/// This provides [`Fsp::send_sync_fsp`] with the information it needs t=
o send
> +/// a given message, following the same pattern as GSP's `CommandToGsp`.
> +pub(crate) trait MessageToFsp: AsBytes {
> +    /// NVDM type identifying this message to FSP.
> +    const NVDM_TYPE: NvdmType;
> +}
> +

nit: this trait can be private (and actually can't meaningfully be used
currently anyway since `send_sync_fsp` is private)

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
