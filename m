Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679911D89EF
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 01:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187701; cv=fail; b=fs+88GNjgee+MNxp6ONSaDGaAM6kMsak5VLOUWniuYfoThjtcwAUCQdS5OHDDqvTgniIMfKraX49A8cmqiyhLTfM+BpmkOXyvcUJaqah3QShFbLkFBdM3pzNEwUQWgr/9fPdDKL+wx5LLh/BgS6y/GVJeOFGZXhq+BsbfcZBjPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187701; c=relaxed/simple;
	bh=dJflV40fXeWp41hUwiwd43X4ZwiFG0GvPQ5qoKOlQ9k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hF7BALGEu2ybePNxNFOJtzppWHS1xUyb2auIZI3E4GK8mgBJBUY6MHAYiDXak9dWyMKGKrugBe+MEE36xo0qMWkkrOCKGAWOaJ0AmseDw9Dk3kZYnsm+AjIeKMaqDU0dd9hloCLVNhy1vO2gQjAN86oudUyvGYiat1fEPoOF6MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l+axFFC+; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l+axFFC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psa/w2Q8GZuE/6ogOum+M4e08/fYiZR95wyMagKcIaEixAs3GE3jzDAduReHEqHh6X5BaZ2Cyqgn7nMP3T4E/xQeD+JjUFT/Osva/Zp33BgvJ5xnPJevHuotiOcG5uT/fP7sdgdIJHgOr5HHHcg4g2PSxccM0TsU92NyXXnFcgP7bN6ELRmizqLaT9LstZUCfMuhDETQsZS1mWKEmWGLUm2tmIQEI/f7GPEAnElyVqxeEPyFHiklmX1I9YdnAb8Sl2PDODsZujFQ/TbDonUy38JhAvUqMWXl0S2y1v7XP5p3Attw0444Fxxk/i6IPRD7qoDnYEhulY2Np0FvzNGj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdNyFq1yXM65NoW79QEbcA4TF7NswUccvhstkwmw1Zg=;
 b=oYRgeDfB89GIWi1ztupBod2UK9vbVNvgTETeP9SkqaxKmWGfgtYfjzU+vWrerCpd9Q0dudAh92W2NnjACbQ7EJvZcNBo/Tco7ROA5kxpHmVzJfEZ6/IUgPhJmTB8MNM5w6cvxihPXUBTw1sNEBZX7FsIp/oMFo/98aKSC2UjPvHGHNHZjzoza7KsLVUJ2HSiyhVHrf9/d8BlxU4pfFOSK2jhG2rlL++FABLbhKjfsLk7ueBb6JzOGNmwHQMzLGXDdq9r48MvFZ065h/IPuVJNBRLAVvcu0RCsV8J5AuyJi+31bFbEHK57NEprQPc1OuzDNOwkfyTkLr8Mlb3gDOCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdNyFq1yXM65NoW79QEbcA4TF7NswUccvhstkwmw1Zg=;
 b=l+axFFC+wSr7vQEU4TT8kaoxhamjfWA4th61JqRuA5jJpr5IQ8G0ODvmyOxBbDyXZ2V/X64zkFXqptMDMJaOoJ7nWX21Jh/ZLy+oBYGSGh/Bm2DRMRWBsNi/HUisHJMSx0SFJgiLalYa4QhLsVUGqCvkUdOevMmuwtsw7Byo07UuDQwBGBdDYbCybQrOdbUT+c/fCqdhK/vjv7TAsZ+H9YbyXUvihU/l9wypKViDsFTs38d4DmYzskABXmtsRXduE4UJmOrjZucI89XFHbd+sYmWJ2c7bcpsSXcx380beM/FEdyVjw8Azydm3UI/wf7jh2Q/8kLqH2qoHRnzJ9TGtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 01:01:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 01:01:35 +0000
Message-ID: <aa464550-6213-4f34-bdb6-b2517f66dc39@nvidia.com>
Date: Wed, 19 Aug 2026 18:01:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/27] gpu: nova-core: rename the FbRanges elf field to
 fw_image
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
 <20260819035221.336390-11-jhubbard@nvidia.com>
 <58ca3c142f2cde0f5672df71314d2dcb707d08f1.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <58ca3c142f2cde0f5672df71314d2dcb707d08f1.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: cd47c806-fd67-4874-65b0-08defe56950a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	61Y5WbZn1HIOwe0V44fgHrWOeb2ertLqQv/Sg47QBOQtb3DrD4Fr3RJVzF89bhtmt22QmdAndm/QGGOUxtB1ZX8mm2xb+HCuF3D4OdTGUkx0QD0wMg4pZFaUKNFjz+E80WTSkuv4J9A4PmtnAX3J2w2esIW+B98OntxmXeUco1mL0eFuz6+3xQBy5IfbhA+pWyRMzSiHyXUMjuKfS/E+ThWXq254qJzC733atJ+LcU9jD7o5Lw4FMIQcnPOdZHSLczXirIy/+AuSit2/Ld0AsNyAYITYsiJDOtlPNfSeMVkhowsIEOrTH+3VReo+gy1Km18JwZIqkN+buJxM4Ji3NEIrfBCpwGskF6r6W63C3j+ewmtLoCji9KVKPsStu1FSWV+4j/+AstYBHKZzYJcLQAmtDt8iSi4qTp+7LslJdSu7XzXtotTsI2eWwB2hxWClOAy86zVWoel6g8N1Nw5WK14KuL54nQFvQQdMsjiEZ4Rf7Uj8vHvKVKGvycsoTCNZxizxHUBVUCWlibZz3sQB7PelkyDq+B4QL9wW+crMa2UKMQaM7neGGJsoI/Bq11AyJZ3OiHjV+mGcvtqVAjGUl2KAl0sfsMIR0T0+efV8KHafge6VFXPkM3wcWgKqtcUb5kFIlLzR1e9EVsrtiPc4N6lwhryffKqiUEcU0xNfGUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzNsb0dBWWpyMDQzaHRGc0ZQWkJaeVp6STdxRnZLa3BOemZlRmdjWGZrV3No?=
 =?utf-8?B?Z0dBaDFBUmZPN3JmaldlcU80NGNGT3RCWVEwUTNmcmtzRnpCdHllZ0taNnFk?=
 =?utf-8?B?T3AwNEdEb0t5L01EbVpDOWFRdkxDa2JKeWhQM3hQeWxJNVhXeG5tSnRNY1M5?=
 =?utf-8?B?dWZ1dVExaHM1a0cyT1BJYnE4blkyd1ExTVRnN1VQaEhpUTlSV0hGSCtESmYx?=
 =?utf-8?B?cGRQVVJGUjBUMFhWL0lwTHZFTHNBQXV2ek1RRndHQ2M1aVh4TzE4YTBRRDdZ?=
 =?utf-8?B?Q2xDQktWS1RsczloV05BSThrWlFVbzM0anFFcWdJQkFzUmREWVdlZzBBQ2oz?=
 =?utf-8?B?LzNsSGdwZjE2KzlHSFRNT2NwcWVMalRpUTBSY3gwY1EwSWFSemtvQVhhaEdm?=
 =?utf-8?B?SHBWOUVDallVYmpNZGdvMDkwY2svRGtka04xSVQ5S3FaaDUxd3RrQktpREJz?=
 =?utf-8?B?U2JtTHhPUlJKV09xeFJpUk13ZWhYM1BjWlBad2xtaXJZeXBsSVlHRGJMWWhP?=
 =?utf-8?B?aEp3ZU9qZkFqY2VtZWFIclN2SU1mc1Q1eU5Ydlo0TG9NbWlINm41NTg2Z0gw?=
 =?utf-8?B?cDNoK25tYlBDS0N4ZHA5OUZDbzlrTzdKa2F1azhCZUxSMFZlRklHTUVlNUJ0?=
 =?utf-8?B?QlpUSklvNjM2emcrenRoRjRPTVNqaXpaZFE4VkZnNWY1NE1FR3hsV2hjYnMr?=
 =?utf-8?B?bnpkREo4c2tnSnNVWUpTc05haktPWUw2WlVmMXZGNXBLUWhOcng4NUxxcGhR?=
 =?utf-8?B?M3FFMHJsaWdVcmNNdFVsYkRiVVQxRXhBOHlMVS8yRVdxckhiWStBaFR6SEpt?=
 =?utf-8?B?NzVLQ2NPUzBYUnVMcUdBTHVaY3U5NDlYb3hwWVNBbXZXY29OdGpBSmJBNGQr?=
 =?utf-8?B?MFFBT1U4SG13UHJ3bU55czNRZG9DL1dCOHh3blFTbmFUNC9VRjNrQ2Y4Y01R?=
 =?utf-8?B?OWRWUGpuODFBb3AvQmFkc25yUEZ3OFp4akdjaEdzeTBpSk9KeXgxbnArcDNJ?=
 =?utf-8?B?VDdNYmlIcFQ3Qk1uRGtXNEQ2KzVnSWVLVkUyY053cEpFYnRGeFdBSE1hOTZZ?=
 =?utf-8?B?Rk5MeXVySmoxbFZXMmJQcFkwblBIdVVEVjd5UWVhcWdNcEFMMHdMMG9iTlFO?=
 =?utf-8?B?Y1IwNytmT3hmbHZZMnMyU3U0NkpsakoxSW85WVVkQWY1S2F2NWw0UVovNVk2?=
 =?utf-8?B?aExmL1hNZlZCTGRrNTNYS20rbFFicmxFQ3NuM3BUQjZyRTMxa3JqWUQ4bTJG?=
 =?utf-8?B?M3djVDhUWWlRN1d5WGUyN3lPREdBMUNBMzhqY0JFUmxYeEJJOVpPWTNqS21R?=
 =?utf-8?B?ZkJWeWR3RFVPcWZtenB0V1ZWQkkyYVQwNSt0bldZVFBYNnZiVnFTYjNaMm5i?=
 =?utf-8?B?Tm5OaytRNGN0eHV4Vm9JZlRJQWI4UjVnL1N4SFJ6SGh0SjYyTjRQTFNBWTJy?=
 =?utf-8?B?VklRS0hibWZ5RWoyT0RIeFFJTVByN3B2TFoxcGJHeW9MUEI1OEEwb083YTZ6?=
 =?utf-8?B?MHRBN0t0VUxCNm16Wkp5VW5RSnRESWRjbWtnNGwvd1NRaTBUN0NIQkFmeTFl?=
 =?utf-8?B?dlMwT01lZGZDbjdtR29IREc1dlNHWkx0MnBaWUg3cDkxS1FhZ2svZGl5NXBa?=
 =?utf-8?B?bGwwY1JxWUs1UTVYbzlkckxmNGhud0hUbmFGMlAvNTBQc0M0UkhTOW50bDBX?=
 =?utf-8?B?ZndaSkpxK2dna3JDVEVabEo5UUU4anRTc2JnWkxmaGl4R0JzMHBScWcxNHpJ?=
 =?utf-8?B?Q3V1VDBEQlppRkxIcnRlQkNNN2pVclVSa3RST0dWa0JOS0ZUZWJHSVcxbFBo?=
 =?utf-8?B?SGFrMmUraDZuRmppTjI2QkNtVWJtVkl4LythajV3emt1b1NST045c0l0ajg4?=
 =?utf-8?B?d0xRc1BSRmY0RnpjSW9YblN4Wmc5LzAzUjZYY1hGMUxZTDZJbHBITnQ0RUdn?=
 =?utf-8?B?dWQrRjhOQXgxaTJwYzlMTk1PM1dYL3VvclhvOUlQZ3VJUXJmRVJweStacjly?=
 =?utf-8?B?OUU0K1NteEFBVHZJekJXeDZwTExnR2I2b090STdqVjZIRGRHWnFDVjhiTE5I?=
 =?utf-8?B?RTExZERxUW5CcUt2MVpOczArZmJFTlgxREFsRndnWWFGZ1NEUkxMMktkTWpr?=
 =?utf-8?B?QVBIaC9NMGFqL25tSWpMd1EvcjgvZmFKNkIrZnV0bkRjcEtjcXc5OFB1UTNR?=
 =?utf-8?B?VGpzWi9ZRkozaDNPejFIRVNoQkFVcGh5c1h2dlROaXRtdHRPUi9nOHNiT3ZE?=
 =?utf-8?B?TDdBVER4K09lSDI4QStnSDBvT0JWS1piZGdkYXoxUUlXVkRZSjMyZTJJVCts?=
 =?utf-8?B?L3lDTENLbGJpbTlhbExCL01SMHhGeklhUEIvTmFjY1NQY1ZtbjZmdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd47c806-fd67-4874-65b0-08defe56950a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:01:35.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ynvCDAm95RSxaBsxiD7nrI4LKHcmazuotmwe0B3ohMWxxpYWf8N+BtaS+QuyJ/bTLPUhByuGeDw6q5nnPD56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072

On 8/19/26 11:21 AM, Timur Tabi wrote:
> On Tue, 2026-08-18 at 20:52 -0700, John Hubbard wrote:
>> The framebuffer region this field describes holds the GSP firmware
>> image. It is an ELF under 570.144 and is not one under the firmware this
>> series moves to, so name the field for what it holds rather than for its
>> current format.
> 
> It's not an ELF under the 570 either.  It's only an ELF with non-TLV.

Yes. I'll fix that to reflect that.

thanks,
-- 
John Hubbard

