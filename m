Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012051.outbound.protection.outlook.com [40.107.200.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B1C3B8BA4;
	Mon, 29 Jun 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726564; cv=fail; b=SlIkzNM7eqzYjOCrNgXhhoxaQJC27hHAykrwhwLvQhzksnuZkkwThnKpQNBmXo8Y9khvUYycghr+K3PuBBXVDBw2kg2RPlz8dfbCYSE7P8nWX7nU8of+li1QBEJkyPwPIUTzcaVUv0dOw9AlUbBo/KM6I09rIoCZebWZli4PCg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726564; c=relaxed/simple;
	bh=N2ttR5S4APMwcb4KU5RGbbofCaERGyEoSxdF9CGsEL0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IhqTG3JLD0EtpiJt7LP7g93YyqvkWgn25UYWII6sGru4MunLEw4OsDo7+paCptgkMqacvC1NNQx3yqkzgeL/u36VyXLjWmcfbzyMs7wgAQbrnV7smSJJcPG7cxB0P88BhIPoChkTVxEqwX2CAGbAe+7OamnwRCxGABy8gCJXKmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LhzQS5Ob; arc=fail smtp.client-ip=40.107.200.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LhzQS5Ob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn6imjxmfatYTuZdyc4sORaoTKQUlVRNwwU/K6dwXXULzGt3FVp/jk0Ojg/6mE+SwynEr/RxO0vkYUhWtzWg/E84jZzM5EscXqYemmqALmGcubwLyWc/Nj5/MB8/PMbxpZfWI9CM1SxcQ/zEupxID8+hwcTrgj6cqiXHmyTf2adHoLtoEqAVCxQajBlnKOPAdSdVomGtML5rhaVvpUI3MTZ62nP4KpHYP37vL/kK+FP7wyg54M++z0Ur4yUcbKhGeotZi1O8WJwr3MoT1riT9QeqnNu0afMhdd5EhiHyvF+2dHgWgYPeZbfgAZL/D/xpCasgd8u0mOv4OZKrjE3aNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daWjfuSLJVjZV5eveSTqKFLOQdgK/9qk4/WNbnnAUl8=;
 b=VyfO07BmR+hwMr0s39tO9L/Tw2linCO4FpteuqkU6e4oCUck3+Q2a2TTb7K6QTgWWQC+sV1YrH7N18mzTiFEvRyGl8Bba1zn8v9if5656nUNGwja6y+koMgM6L5A9stNmv/zMWDaIesHC42NK/4FYuzwMdzpDSbtvdrvh20nK5qKRLIHhZzGZ1pkn3oBEyVv1Z8Uj+cK2s8IPZ6NcNh98maGsBZO1bsHCmk74wZnA6Hcl7pRGF36MigNIdUnIfINM6DdA5FVJ0d0ioH/OoGe9KrLrDtacxxI6/L25V6E82HnjwtXPpUfI4eHzkOdh3MSGhoZ8g01TH5NZa3Zbc2dwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daWjfuSLJVjZV5eveSTqKFLOQdgK/9qk4/WNbnnAUl8=;
 b=LhzQS5Ob/phFiVxUcUG8M808aapDTGi19M07iPfDpxZnKwpdIsASMnOe2iEYMZBmlPGIJ7AT5y6SbYjl0W3yJbihZGP6MajboAUTNIegAWv5F78llIZxee6azMzbYO33ZSXQhcESsQQj3101liSkRuG8T6b9+w5I6sTooVvucGLSqE4Z2UaKSVcukgT6NxoQ0xDcgPbrSODs1iYWHehkKcKwhVGo6ThK0v4ygurvDaoC0QBAw3cDVBVo4FntWSXy3xJhnc47p8ULQPydrp7svEax/qaF/IT+ti9SZBLklY3ib2iRlUs5hj2FnActmvaYQ6UdbtxZ+8lL5Zsd7YNVKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:49:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:49:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 18:49:15 +0900
Message-Id: <DJLFTLBU57SD.WS14XAGYZYXQ@nvidia.com>
Cc: <sashiko-reviews@lists.linux.dev>, <ojeda@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy
 via the transmute bridge
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "SeungJong Ha" <engineer.jjhama@gmail.com>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com>
 <20260628172200.B116D1F000E9@smtp.kernel.org>
 <20260628182154.712621-1-engineer.jjhama@gmail.com>
 <DJLCGEB0ZTL7.3C1BGJRHW35HC@nvidia.com>
 <DJLDHST0Y4ML.68M47LW7EDG4@gmail.com>
In-Reply-To: <DJLDHST0Y4ML.68M47LW7EDG4@gmail.com>
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b93d88-f414-4ed0-53b2-08ded5c3aff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10070799003|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	vH31ZgX67ocVny1DEwQ6IRApFMCPf+uNmNPfQqfA3CL0U/UQAQ9aLPhHkqhnRdP2p8V/rYRbEpr6WgUinBqZoeQMmylVs9im2j0jsQtmDFzBf3XuwNJ6d5LEhq/BEpHhpJnLMXYKrbpulyWaaRv1h0zXmrtdMW3C7388Naqrwi+5iB+n9ym22dlu0PpTjAgSKKhPHGza2xA8Yaf9z0kPfL4zsLuCIuUedO3QU/CjNW8YE0Zt2REsHjNr6aqDw1K/YX+JtPCEaXiNllzLkNBAUEsdCLJR4VuQnariRw5ZEsqf8ZAtR/EPB/7GntSlobJzoRN5T+3MFFzj32/NWFpwBaRgh6yVnPbZhA/XGnhs/CNBBSZdVmrE+H/2l9HJp2+cyUTH4Fn4y3xHMn+sRsPqcW1RmzbYC4GvLZjQp5SqL36BVaM/sNEMw3Hz2WDkhTv7Qu4OAD7LHx1SCCM8RpAHrZcWDe1o8fLreoMCq3Z9xH8hS1dPHUBPUhEZQh8E7lehxHc6XVFyagPcV45dMvYqPMVtTUeIAmAdVdIpU7K8B3oj1VQ4J30/cBfMH3JLcCpFrK9lit+2MqolBUGx8G/4bKZ/MtlwJUFGrPOuFAvmYlWtqiENOfsZmTO0o2gfDSdd4JoZ2Xyx9jK/dLEvdSbYP53acMAZYrJNmqKpZl6CMvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFIY1RiWG1OTzU3STByOG01UVBnM1BkT1ZoQUVtMnlxd2czMHVkMDJ0OHYr?=
 =?utf-8?B?QWJncXlWQlpQOFVYd0NEM1VSZ2c4aC9KeHEzZkdvZVdwTlBMVFpNQ1pPbjNO?=
 =?utf-8?B?TlNLblB1emlLWld3aU5aenJlbzd2QTF0aEcweHA0VEhONFJvZlhkZEtOY2lk?=
 =?utf-8?B?QnIwK1JlUFRQMHNzTHJEdTNVeXNTN1UxR01jUm1kVndWMGxNckNxS2VxdFI2?=
 =?utf-8?B?alR1dTVEa1pqTVhieWJCSDBYM2pSbTl5cUlrY1QrQnAxeEMxbnBrWVh3ay9l?=
 =?utf-8?B?STlNdlNreDhGd1BDVXBIWWhWVXlxb0s3bHUzKzJBL1dQRnA4ZnRCdzJQQUNS?=
 =?utf-8?B?Q2pOLzNubFFNWDMrZkxCeXU5OFNaUk9TWWdrbWppdk53ckYxWmZBdGFiWlBE?=
 =?utf-8?B?L3R0RFZPRSttejJOQkUzaGVVdEJ5MThnK1o4WDFrK1ZYUzN4V1V0UGpmNUEx?=
 =?utf-8?B?SXJXc2NEVGdZenBrZGFranl3MitPOFc0clBYaVJDSUdBUlJZc20yalNMNkxw?=
 =?utf-8?B?Yy93N1padjNZZmwydTQrMzh0OWQzQmZoMWlzcXI3dHo5VGtBV2xkWnFDMFhV?=
 =?utf-8?B?MzE5cExZa0FLV2ttcXNaZnZwN1lZaWczU3JNVERRK2NrZU1PRitzL2NEWUZs?=
 =?utf-8?B?b1AxbFJ1K3lpTTZnM1BuSWhWMStJMzNTUGJHdm5Uc2pwNmVBV3pER21rMXlS?=
 =?utf-8?B?cnVOU0hMaDhOT3VVVDV2SEpsbGp4V0QycS9FWTMwd2o2SGpHRThyUURkYkkw?=
 =?utf-8?B?WEZqdmtBM2s1c2cvY0hwUlNyaFdid29raEd2UEtlcG9JVnhJaCtJRHM5MUZD?=
 =?utf-8?B?NDJyQWYwbW1qdFBwNDF6NmhFeUR6cG10UVFkN0R6dm9zYUNOdEg4LzZmYzNS?=
 =?utf-8?B?UGhXdkFaazBwaDR4cVFrSkZPTTVqK3UzTURicEJ2TWM4bG9uNE1mN2oyRVdD?=
 =?utf-8?B?S1FqSGpHUzBWNUttZWFzU3JHT3VqWmxwRDBmMWkyaFc4MEhiQTV6VnpZRHgx?=
 =?utf-8?B?Z25mSmVqRGhDTnlWekh3ZnRlUkNKbXg4UzhZTWk2aDM5ZGYrNTFUbGRPMjVI?=
 =?utf-8?B?NTM3ZHBBcVBlM0RRTzUzalFQWDNrR1dZU3l6SjhFcW5FZzZ6amZFUHgrdVIw?=
 =?utf-8?B?cUpsai9QRHJCUVRIUHVXNm8yanBXYWkvQllKcjlSVWZGMXJjUm1KVmowdita?=
 =?utf-8?B?c3pYSGRCOGVDVzRKYTcxeFRHcEFSZ1llSzYweWNOU3h6Yk5rOXRXV3I4Mm5q?=
 =?utf-8?B?a0Nob1J4TURNTnBiSDFyT2p4K1oyRm1WQTdiVFlUTjRxemY5ckwrOVJPMTQx?=
 =?utf-8?B?WloveVU4WjRoKzJqT3JYYzllMmxENVVaQmtYdUR4T2loa1VpRnQ0c0F2SGc2?=
 =?utf-8?B?bit1U3BMTENnNmRadkY1RHQzZHN5aW1JbWZXQXFhUTZ4d08xck8yUldzS0hX?=
 =?utf-8?B?OVZnZmYzZ2hTeGwrbk04cHl3ajlhUGl2TXJrcmtTdUlUZUZjTU5qZVluamNJ?=
 =?utf-8?B?c0ViRXdjaForQk1vc245M2wxTXZsMExrVzVBVzJZd1FSVHNSTm0vRExCeHlX?=
 =?utf-8?B?RHFkRkNSNEVuTzJnKzRPaFF4dzVYM0c0VUh0K2djdDNNdHZzOTRnN0Jrdmpx?=
 =?utf-8?B?RndGTDVjcFY4WkxOTmlQUTJUcm1nSXh3VW5OMGtrYkt1eE5xV2Vkckl2RFYw?=
 =?utf-8?B?RGFIWTlDUGFpSWszVkZ2bXhiRGZiUmovQ1dWY0EyTDhIaFRISHcySkRSU2gw?=
 =?utf-8?B?MlI3UTZaUFA5Rk4wSzFnT1k1R3FwZHpzRDM2K1llK1FhS3pZV3VXbE1BWlNU?=
 =?utf-8?B?UHF4VFlVbjNBb2JOVlJKZ2lOc3NLSzhTTCtGSmJQajJBL0JrWDZmQTVHTEFx?=
 =?utf-8?B?UXdXdUZNMElNTUYvcEN0c2hGUENjOVNMR1NXNzNZREpQTi9BeERvNkZBbStz?=
 =?utf-8?B?T2Y1N3h2T2ovUDBUdWxuVEFaWGt1U3VNbWZ4RXkxVTR0Wk5MZHJCYlhGa1hV?=
 =?utf-8?B?a2xTdm5nVG5QcjhoaDFRdlJ0bDdFMFY3ZUtrblJsR1ErNU16NTdrYkpLQk1n?=
 =?utf-8?B?Y2lmalRVSGovUk9HaDRpSlZCSjFBWmx1ZSs5M1lWdS9mWFRrOVpwRC8vYjB6?=
 =?utf-8?B?K1FnODJMdkwrMUxvL3paOFFFdU1oVUtxa29ScG13REIvdjY3cXUreE02Qyt5?=
 =?utf-8?B?R3ZQdlBzYWFwYk1KVUpiQXIrUk00UUI0U3JNTnVMeE9obzQ3ZEFsREdLM3RZ?=
 =?utf-8?B?Q0NRUkwwSVBXVnBwWnRXdFQ2Sk9zeFhtV1laR0I4L2t4TFk0ZHFFczY3dThN?=
 =?utf-8?B?UHJ6a1dhQlkvMDVYelNTd1g2RGFBZGRHYnU2OFlMSzZGZlRPeXk1Q3ZmM2FZ?=
 =?utf-8?Q?Ne1Tf6OO7YcRAxc4FyIzF5F1Q8VAbb07EU3KyLx20bsxC?=
X-MS-Exchange-AntiSpam-MessageData-1: LKtB2QUEa1uWkQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b93d88-f414-4ed0-53b2-08ded5c3aff6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:49:18.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77CNsJiwwSjPWK547TE5lEDngpv0YeELu/FukTHpcxpS1OPmFublMcRuuj5U/URr0RFFle1rG9hkkssbGrQmOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

On Mon Jun 29, 2026 at 4:59 PM JST, SeungJong Ha wrote:
> On Mon Jun 29, 2026 at 4:10 PM JST, Alexandre Courbot wrote:
>> On Mon Jun 29, 2026 at 3:21 AM JST, SeungJong Ha wrote:
>>> On Sun Jun 28, 2026 at 5:22 PM UTC, Sashiko AI review wrote:
>>>> This isn't a bug introduced by this patch, but could this coherent sha=
red
>>>> memory lead to a time-of-check to time-of-use vulnerability?
>>>>
>>>> The driver validates lengths and checksums by reading fields like leng=
th
>>>> from GspMsgElement, which is mapped directly into shared memory. For
>>>> instance, in wait_for_msg():
>>>>
>>>> wait_for_msg()
>>>>     let (header, slice_1) =3D GspMsgElement::from_bytes_prefix(slice_1=
).ok_or(EIO)?;
>>>>
>>>> However, receive_msg() seems to re-read the header fields directly fro=
m
>>>> shared memory to advance the ring buffer pointer:
>>>>
>>>> receive_msg()
>>>>     self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
>>>>         message.header.length().div_ceil(GSP_PAGE_SIZE),
>>>>     )?);
>>>>
>>>> Can a compromised hardware component modify the message length concurr=
ently
>>>> after the initial validation but before pointer advancement, potential=
ly
>>>> corrupting the host read pointer?
>>>>
>>>> Similarly, send_single_command() initializes a message header in share=
d
>>>> memory and then reads its element_count to advance the write pointer:
>>>>
>>>> send_single_command()
>>>>     let elem_count =3D dst.header.element_count();
>>>>     self.seq +=3D 1;
>>>>     self.gsp_mem.advance_cpu_write_ptr(elem_count);
>>>>
>>>> Does this allow the device to race and corrupt the host write pointer =
by
>>>> modifying element_count before it is read back?
>>>
>>> This is pre-existing and not changed by this patch: it only makes
>>> explicit (via a checked `zerocopy` derive) what the previous `unsafe
>>> impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
>>> layout is byte-identical and the message-handling path is untouched -- =
so
>>> it neither introduces nor addresses this. I'm not familiar enough with
>>> the GSP threat model to judge whether the TOCTOU is in scope here; if i=
t
>>> is worth noting, I can add a TODO comment near the affected reads.
>>
>> So I understand that this as a copy-pasted Claude/Sashiko block, but
>> would also appreciate if the human behind the keyboard could provide the
>> context required to easily understand which part of the code this is
>> about.
>
> Sorry, that reply was an unedited block. Here is the concrete context.
>
> It is the message-queue read path in gsp/cmdq.rs (wait_for_msg() /
> receive_msg() / send_single_command()).
> I haven't touched that logic; this patch only swaps the unsafe transmute
> impls for a checked zerocopy derive. If it's worth noting, I'm happy to a=
dd
> a comment near those reads.

Actually I also realized my mail setup made it so I couldn't see the
Sashiko email you replied to - after fixing this, the context is much
clearer. :)

But yes, as a general rule it is a good idea to quote, especially on
Sashiko emails that do not necessarily reach everyone.
