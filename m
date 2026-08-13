Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36543B9DBB
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657413; cv=fail; b=hCpccsPvW7mkfwNzorJRx6RJ4e669OQT3NG8Ln/c7aYgptEtcVSb5DRLJAiq3i9o4V7bFE93DMEnqM3NWcDkYBQlb6zgS0KHZIkE4JrhTGbjbTFgN7D/pu5JQCDe0FWnkR5jMKJSCsL2RZOEZ6JszEF6gDtM7L/NQgS3Fc4SfGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657413; c=relaxed/simple;
	bh=XIBNEIFmMKlaXf4/JujWlyaKhwNP5qKyBaZqWakQSlc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WdCbHeyxkbLfKngBpzIznG3C7yhhX/oYEY6f9qFcnfmLtq6LUxYkXCox9wA+9QXKVpVJxBz8s14E27LQt+gyi4LX3y6vUd3FvVFfFSMdkRYqsuJouTlezKgWUQNk/CUGnibuB/tbIeKXiPY/4ToLPJ6J2CRifQqmqb+PDqPPxw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JsCmApsk; arc=fail smtp.client-ip=52.101.48.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsCmApsk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxM+ASoExeY13EFTQcxHtKDd1/6013PLG0GrpxfjXk0B2j2hDc1QDEbzvlfpmP6Ocg1WVRC8hPhxlsLzCefcIFx+B6o0bJgh4mv+mMG7m5aWyytbUr/cMhd2bsI7Fh9/9FTi2ZDPnfsfbjpwZIlKRu76oTRjsawrvZhLL813Z29LfWxsOXMm0bcRPUm26h0aOsoSCCk7UG4dDLYfT4mT7TM0GLngK767szRJ1EJsZRGcN6CAPcf3YvUFklH0T7UgxVJS2Pxblee6kwlLzYpfZM4gLTLehxXxzAMowyw9Ir0go+ImGb9spP2H1QMOnYuF+Ru11zOPiTChdLUz5Xying==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSNi3MfHc3yskfsEgdswoYbPQbtcyApelpl/n0PxcnQ=;
 b=Jntw0sIAsnURVeVV5h4HfkvnR5CLC3NnIFOchLB8dpvqwYUQ7x5H/DvXZnvCsvjTaYenTjzVkW82xsDeq6XpLwG1tuS/TefgYHNiyyGgldJZkh6U3EOp6VhD6ZFXMd+8PEiEJCfOAS6vOVDE/NIrr1YI0Th+xgjZtu1HqiPfjBi5X6tjs1X9mMwGS+yvemqsTW5//UoKMO9QVTDvkVVlNMyzBhISRAbDftxPVqXxiIzhYfakZqm90TczMby1t2WJLEznlYSrXWqY+hfrDlUVEPkISQMvw8C2qhoHF6IDFPNcgoE9WBoLLjoim+pzS+s6jbpjRwXQB+e5MQGDbNBHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSNi3MfHc3yskfsEgdswoYbPQbtcyApelpl/n0PxcnQ=;
 b=JsCmApskuWdEpdy+XlXncx3Gg87OOl16Bge9SQnUNlbDI7C69idzWMdkApR6gW+BOpG/1phKVtdgB3Zn/aOPXLhByLvmNeby11Qzea8JsJlQFBq0WhkGrCwDtaRnZosz/zE3ilW1uayy2mZ2jsh7l+m4QliGZsKlZkL5Oat5mn5S9PprVPQ6xf8dJmVt+zWZS9r/nkFZ3rNFKhER5qeD7ESpulnG/HMEigaUSHUBJk1O5QtNbYq2VBhyVgxth2c18HJ6rI58j+m4HACAvor6odTxTKtadGEyvgnXMIjLZ+kX+nqefglnUUiV0/0BC8F72R0XY7Ha1jJSTwDLzzpDBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 13 Aug 2026 21:43:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:43:28 +0000
Message-ID: <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>
Date: Thu, 13 Aug 2026 14:43:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Will Pierce <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 020ce200-86e7-4a54-7721-08def983e908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	+Hz7F9foqzEQ3x5arr/dTZQKJoNKLS/hcH3i4nsdfkOFhTKAZSqJzTBkiimmAYw2WUjgmzdzpK0QOqcskMz94XeBbhONdMLp+13p9kEn282/xGlr9534OnUwIwrJOKju1UsOcR1zobX/AXuPWGipQLGunIuYEvbeq0ua/pYVtgeyk6KlkHersdymB1JwLiTc+2V0aS8IWtK+XKIAHr1eCEouoUyU+5Rv2XfP8joSN1RNhDc41knWJGB0hCdaOfFt7f3nhbqbtKdQFONW97Bzx1udLOFgAN5pJZNTXkLSpgg3Kwx9KxkQFWdwYYyx4xvCMepuil4beqTySWcca2S//DCcisaoOlSMF2ady5GFLlPzX2pP1I8hx/qtNGlddwJD8vlTNPn+h7vrpiAnbviCFLfQA+RuKaRiZZ5hddMKv9sTmFKTj9PvOOkQdYQR+J+EDse4R/BTjHhiqJ/lkfl6mbfB9bzOFyQsZ8KA4xyeifYHnHAvsrb4EvSsh95VsqL6/ZVD7WGY7HkSbeaEl7NLssok0BQbPpDkoPUVEbdQvIFhskvr5cFXM9Jg8bA2hn+JhK8awgqd0qHBVDM7NMVun3YX3Mx64ds0wi8f8WJQB4Cf5uoFLfoj/0dLhPdF8NFJsdn9+ZmLjw11BJW5H5Fh4pOOv9lGestaj1S240D84Gs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHE4bHc2ck1uUTRERjBaSk56dHdZdzNCa0lmVmMySTFCWmxFWEk5M0pTZVZ6?=
 =?utf-8?B?M3JXeDBJeGhuM09DTnprRENhdmJhOTV2ekppRkR0bzBXZnlYZjgwNEJ5aGN4?=
 =?utf-8?B?QzFXRFB6NlJpQUE0UHl0UFF4Q2pkR1oycWZPR29rTXRUME43T0RLeUNxQ2Vu?=
 =?utf-8?B?a290Sm9vcGFzMWtlNVQ0RVBlVlNwQmEzWjV2aWttR1lLYzliVG56RUlvK2gr?=
 =?utf-8?B?aUFXNWE5WVVvUkhSd0NzWjlTOU1XY1lxdFlsdEQ4RlovZ29Qb2YvRm1uREQ4?=
 =?utf-8?B?cTJBV3NGVWtDVkhMam9leHVXMVRaeUxkeDV5ZjFGdEpldUd3dmRBRmNQQTJw?=
 =?utf-8?B?SjZZOTVrcHpZaHVWTXVSWENxZUU0M3VCMVhWL0pteFFPRERSVnAyMjdjY2Rn?=
 =?utf-8?B?YWkwL3JRWE03eGg1TDBVK1E5VTN2K3BxTE5IanZHelBOU09NTU4xZC8waS9u?=
 =?utf-8?B?aXRnek1PY0d4b3BRYWZYTytxTWZsVXdGbTRHTVR2blY2WTJyZ1JQUldxZG0x?=
 =?utf-8?B?QnpOWEw5Tm5UcVVHTkVFQ1dFTVJuSyt2bndUZ1hUSEFTTE83M08rTUJUQXZt?=
 =?utf-8?B?Y0pyZ2VmQUMzWWxlOVZlWWpFR2laN2Y1NDZDMXRjNStleWdmdStWUlN0Z1pY?=
 =?utf-8?B?T2JwNGdPM3FQUUYwck1obW9RZGF5Um1hRU5uTHhNUEFKdEdLNFBUVHM2MEc4?=
 =?utf-8?B?K3JvZDNhZ0Q0Rko3bmYvc3hEcVpWT3luR0lrSnVDYTFuZXVQYzBoUlBoV0pV?=
 =?utf-8?B?eHFKdzUrTElvZVF4aFNDMklyYitmSXZNMk1saWUvV2dWNVZiTHAzQ3d1NG51?=
 =?utf-8?B?a0xPT1Ard2FCWTJXQnJsVXppRGFKT0xQT29Wa3N1T0t2NVhjOEIvamhhSmY2?=
 =?utf-8?B?ZkdLR0xxb0Zva1kybk95VUduQThjd3k2ZjlRS2xieXcxNGh1NzgrL2sxbXoy?=
 =?utf-8?B?ZWxpVFY3cmFnMUFaN2F2U0VFaFJiM2FncWFCczk2VTR6NDJRZmU3YjV1SDFF?=
 =?utf-8?B?ZUVtMGIxRW0yZy9SRUQ4dytPZTZtZVVUZGsrM1o0T2g4TUwzVmJNWlFWeFI3?=
 =?utf-8?B?MWNwbkIwL1h5bWtqQy81bTZUUUdXSkZIcVFHOSt3WE8vbHJTQmpnOXZyQWJM?=
 =?utf-8?B?TUF1ZjhJekdiblRKWUZRVUFPRG8vcWo2QXhBQk0xTktGNWtIbkt2WCtMRDhR?=
 =?utf-8?B?V09uS2VTeStzeUo1RUZCY3VNclZvbUNoUEFqKzFIaDFYRzZld2NGMDFCekNC?=
 =?utf-8?B?cEVxTEFucS8zQ2dDT1F0bWthbUVkUFgzbGQwVjB0MU5rSVZaY2duc1NHWmVE?=
 =?utf-8?B?V292enBoOG5ld21aY01HSktvMEp5amhIbE5QSHJDYUZWR2NDWm1CN3ZDSHBv?=
 =?utf-8?B?YkZSTzgyVUQzeEZiYUdTY2JWaERGNXgrSzZ3bEdYRWJKSUxxZlNaQnZROXhp?=
 =?utf-8?B?VGNCcXdVNkxXVDJZTU8rZXNiY21CZ0dKUXZUbzZPSGRvdW1KNnZiR3ZWaXY5?=
 =?utf-8?B?VnZ4S3JEdEdrMFhGNGRaU29VNWE2OVBNOUJMdjdoTnNEZktKU3V0L3BJeUt2?=
 =?utf-8?B?eWxmUWhzdnVkdldKbStLaHkyK3d0WWdGZytpdnRzV3pVRy9OS3NWUWc1ZWN1?=
 =?utf-8?B?M09DY3BrMzA5N2FXWlBYeHNxSGQ4bkc4MVR4YWs0NEZnSW5yU29SV3UzWVRj?=
 =?utf-8?B?MW5NbHJkNDZYd0ZEb1JzTU9SVFJtamZ0aWg0dHBnNDVIQzFKelMrWWtSSjly?=
 =?utf-8?B?Wk5yMStvN29ZRW5oWTY3UC9td0Vsa2VKV0VuaWltU2YvWHdqb05UaEkzLzJX?=
 =?utf-8?B?NjYxQmdzTVliRVppM29WblFFU1RCQkhIS0FSLzlSM3BiejhnS1BMeW4rWmRo?=
 =?utf-8?B?bjdnQS8yWW5SNmV4Q1FCSDZxazlXR0E2aXhEZHluVkNuVW8wSU9LekRLZ1JY?=
 =?utf-8?B?cXc1M010S05WdUYxVXE4OFlSOFdYMkJNYlBWOGF1V25aSmhwNEFvM3JWLzhx?=
 =?utf-8?B?am5tZG4xRGIxcDhOQjFtenJnSm1kRzVsMWQ3TlV0a0xWMWgyUitTSWw2R25P?=
 =?utf-8?B?QTFjOFpjNnU4Mk12SDk5ejExQzFjUEFUV3NlVCtQY1IxZUFzUTNsOUQwS3Zh?=
 =?utf-8?B?YVJ2UXFQcDFQVTlTTDhmWkx0RWZGUmI4N0U2ZWNOemdQSnV0MUpGRzBTMUc2?=
 =?utf-8?B?bnVLNXhiSXNvVDdobzN0UnlPL1d3K0Uzb25MMGpQcWNqY2xVazN3L3NnWW8r?=
 =?utf-8?B?TmlROHN1OVd5eXlBcGt4VkczaDZpNlAvMVA1Q3QybEV6Mm8vMFRXS2RCNXFo?=
 =?utf-8?B?akltMXpiRHl0MjRMV29tN0RiaWVPUEg2SWhtak4rb29iQXRwWVFIZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020ce200-86e7-4a54-7721-08def983e908
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:43:28.0397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDB2yMumNdhAtaIZ9jzIYxoFi+T2o9KvV4a4WgKG0raeg7L+qeBftv1TWnQ8fgqUCv8BgKWCxI11Ug00WHHlLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495

On 8/13/26 2:31 PM, Danilo Krummrich wrote:
> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> Allocate a single PCI MSI interrupt vector in the probe path.
>>
>> Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
>> fall back to INTx with a dev_warn so the issue is visible in dmesg.
>> The allocation is devres-managed and automatically freed on unbind.
> 
> [...]
> 
>> +pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::IrqVector<'_>> {
>> +    let msi_types = IrqTypes::default().with(IrqType::Msi).with(IrqType::MsiX);
> 
> I was about to ask if we really need to bother with MSI and shouln't just go for
> MSI-X only.

I have an expensive, recent motherboard in my test machine, and it seems to only
expose MSI for my Turing, Ampere and Blackwell GPUs, in the non-SRIOV configuration.
So I'm thinking that MSI-X only would not work.

> 
> But then saw that the commit message mentions broken VFIO setups; can you expand
> on this a bit? Which setups is the commit message referring to?

On Zhi Wang's Big Branch of Everything, he is able to run Windows guests in a
vGPU VM on top of nova-core. That system requires MSI-X. And I broke it with
an earlier internal version of this patchset.

That information probably leaked into my commit message here. I can remove
it. Because I don't think it is based on anything else.

> 
>> +
>> +    let irq_vectors = match pdev.alloc_irq_vectors(1, 1, msi_types) {
>> +        Ok(vecs) => vecs,
>> +        Err(_) => {
>> +            dev_warn!(pdev.as_ref(), "MSI not available, falling back to INTx\n");
>> +            pdev.alloc_irq_vectors(1, 1, IrqTypes::default().with(IrqType::Intx))?
>> +        }
>> +    };
>> +
>> +    irq_vectors.vector(0)
>> +}
> 

thanks,
-- 
John Hubbard

