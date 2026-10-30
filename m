Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793399234;
	b=FJfyISThF5MQp03ywB7S0V/LiL1VakbuTDTGvxlk1kpblOo63A59Vfm49sAe631rTFQE
	 FE/Catt7xbceWLoeYVqQ6HKWvVuY+j4Tawe+sCISfOmP+VEHBGFxXKeIkQ4iMyN51YR5F
	 QNAIc+HneE7xqkf8S1dt7mu+N1eUpJYM3rZc4o9956JnzChfvJ5ef2LT/MzOfl3bQ8Poh
	 eKublwKFmwlzywp1BKMKTVClIS0DYOv50tI3YoDhqfRa3t9JzCvwqH4ITmplrSMViH8jv
	 2GuwdvWgiIFgWPDEoFonjDs0Oqb/56d/4Tn/RXmAX+cU3gpcSgyyOjY7gulxlYIM4Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399234;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LVQL6Jj9rKv4vs11VK4F++ssGUdMWPWMIB40ReHi7SU=;
	b=CP+f48Pk/TAQnFmqoJBCOhPsPrtXQ7qWnPmQaF+2XNPjzMI+lpCZzErc8YyQ2ogVa3Ye
	 WQ1D+cOTY8h7bAstcCH2jB1K9OietgxakbgQmcMyefkxJgL4QAxWXbqN0ea8/A/j28+Qf
	 AP21N2GuEr8rU8n1UV6AMni/wWgeZgEEGn9Cx5dNF7Xq9eISkKX7WzH3p4/ItmI8+hNtn
	 wg7IwxED10HcOoLUO0VSO2AwjijCKOoUDLl41ylGZ3GBzw2yl2uEPGWi+Bk1FdHmb0twc
	 WxruwoPXtoXVMk8GT9cj0exiPeWrl7Z19iCKy1h3Bom2papJ1MgGOXm6A1YJlk21Rjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jAki38uB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D4606A31A
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 22:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jAki38uB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvJRURshywYOLTqHtrdmOVSCf1b9KD4jctC1Wrf638UwJbHJU71iVr2ab41VDu5ueiCFPGb1hMOFbvLxIX0FHb0bKG0Q6c8sueANd4Ub9jPrvGdkPTc/QyQI9slRic7Fnqz77l1+BCKenaPNP7bsRA3TTJ5qr/S33nLt9BIEeNz8ZICD2r46ntve8CJSsC3tVjZrc8cGf4RlA/vCeGP6xs/o/tQ0ZS8EbDLCFotVscY52FAWaOsnyL8HXibOHUtVjZ0p5fLJwiuCy5BWiYeimwrXeZYT+muMM2CVsbV73iD44shOjWzwPhcjmnfqPbbI5rWkPCRGlmowVqvUSoKVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVQL6Jj9rKv4vs11VK4F++ssGUdMWPWMIB40ReHi7SU=;
 b=ZAgT519yvY9ZMmUZJL/E2ZjUFL6gMKxS7Czk/KE29BI3Ia3ipszHGIA1O4IHJbY56nLJvxk9dSJbMuzCRjiTIdHQZi7XKNSF1MxtzNH2qyh8TkyaJvPEuD/KeGHWEy6QZHVmM5LOZS0MQ8fxSQXw/ZYLsD8vWhfI2AHIy1dQdYquitt1FSAs+lXXsJ6bXJG/rCQILeLEth8hnwY2YMSKjLXRfLQnlLGrGEqTd+t2511xCmlV8sBCner1Dp+2buY4Ub6fwobuhLBcOeQe3KfubitSziGsBQGqKnfjmIrq0dJidA2KYVH2GsiR6NDWPFkW5dMiB5angm3jajvQg3RVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVQL6Jj9rKv4vs11VK4F++ssGUdMWPWMIB40ReHi7SU=;
 b=jAki38uB+qzIBfIaLsNFXMqDHnYPwsYbU5p6wypPBQT60xuHWIppGgYYzRMc6CK/TwnyUNZpoQa2PeYDduC7m9+klVoOqFLKQgUKHs3wm6EAXkqcf5297b5gKN33PhfQhqUIelDxgZcO8VRSMISN4HU6UPKQ8parHjkMSW/1zu572Ie9AWbxosT1//AfFPkVLRqCkaxFU9YtLgSAQjJvFHvHBj4hZeZjtdbK1WpDT9oB2J3g4zKR9v96NjZaxRjdrJGqHbdj8hy09yz32MlJ2rFaVlutahMU9SxW+PoPqrplTPEHTu/ZBd8aF282SYlFpzCUzUOOGcX2YOQklVUuJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 22:27:06 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 22:27:06 +0000
Message-ID: <c80a53dc-93b8-43c3-8aac-4249d25d1790@nvidia.com>
Date: Fri, 30 Oct 2026 15:27:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpu: nova-core: fix stride of NV_PFSP_* registers
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-1-f2befbcd8ba9@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-1-f2befbcd8ba9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: 750c9062-5e43-4f44-b07b-08df36d4edd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261028144727099003|4143699003|11063799006|56012099006|261022105027099003|261021121427099003|261009223027099003|261026140227099003|10067099003|261021123027099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XBIMNqTSNUSDBIBwGmPTFbu2eydwbkxV/9rNIRUGdMNDM2xXJ/+dzkoOXPXMzgYwLZhTltPa8MNiMaBIal+BEyLhRemvlh0eoCUiFUPvKXi/Cf4BA5MhY8x7gCwRIix4JgmlPqBvVUWx67lrD19rPotzbRhmTNvC2uok+BVf9wba+yE4AfATzEILAXqYvVkHltZspWLRNtjp6uCjihCny/AjVxMIyPL3+8fJgb6I7zgxvmA77hZtJoWEnQezXxIUraCmEtW0HcLdnER9G8Jrapg+H/5f5HKZboP5uv9X0Q4RxDFtVVNaasyf5+GNKiel5GYBdpsCw3iwwFDYvyHv+kHOmO2CqbZooLSI6v3Cg3KGIIqnaVMuPn045D1J+4fn4BDNbF2KMgmVjC32dqdyFG2yy+HN6pLu5RUtPZ0Mdoo+Vb2Dvgd31AjcSMihV66eCdIqq8yqbgCQBncTn9Tih+CpPdqYvbTQyzCM1A6R7FeEO2U3Yv2r4W5G2DkH8eCNSapxB3+L0HFAfkhffeDEtbhYr1ztU1qdeu/MW8LWlVCzi5sUE5OaiWHwhVjMbuBd1K1N7LRmRQfrv1zrEquQH/228tA5RG7b9dOO1jigEqlXASvgrjHWvYRsggAl5K/Z62VxjP84ePqPQyTql2YX4zsu/TAl2LORNAKMX9DLEtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261028144727099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(10067099003)(261021123027099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BlbC9QVStkNVFYRHlTRitSZkZwUEwwOEhtd2p4SElrZmV4V0o1K3NTZmNT?=
 =?utf-8?B?N2NWRUpkS2RuYmFNQlVvY3BpSHB5Y0EwZzNlWDNuSHNoa0hrd0k2NUo2bnUw?=
 =?utf-8?B?a3Nsa3hrVitmeTNhZHd0dlArbE04blBmR3EvR3dlLzNIekx4S3BPWTNzYnQ4?=
 =?utf-8?B?RDBNNTN1cU51NWhINnhJUHdxbG5tWFRxV1cxTUJKaVplb3FOYkNWcXlXZHZB?=
 =?utf-8?B?SThmVW0vYkZqZU1XVTZvbU1IYWdOM3JaZ2xNdXY0S0plVG1XUmpISU9zdlg5?=
 =?utf-8?B?aHl3bUNjWkdKdEwxbVM3NVJ4N1grVGYvUFppNUxOUjZNZzJpa1l0aWNmR0lT?=
 =?utf-8?B?TElLSElwb2dnU3R5UjJKblg2Qnc3TjNNOHk2N081OXFKOEZrOG85NFZqaG9p?=
 =?utf-8?B?QXB1OWMxQ01NSU1DVkIwSDZnd3Y4WU81VVZtMU5qeXppNTBCNThDU0xBK0lp?=
 =?utf-8?B?WWNJaHdyUHNVaGwzTWloRHp4Snd6eTAwcmRLVkR6SElmZFhSbWtoSHZRdzRh?=
 =?utf-8?B?L0JhOWRucEZoK2plM2JPSFhsL045SlIzeHAyczkvY2d4Yldoek1uTzNJRWRT?=
 =?utf-8?B?VEVvMFFQdVRwUFlFdk01TWYydlczSXNEeWRHS3RsZkJGVmJtSFAwM1NwR01B?=
 =?utf-8?B?QkxqcnFKWUwzak5wL0JwSnNERVJzRThlTW5vRWt5NEJnWXQyK0tRNjZMaTdn?=
 =?utf-8?B?ZDNHLytRaFhveUIzb05tQzAvK2YxdEVlVUYzNmVNemlwWWZlSkZsS1Bhemxr?=
 =?utf-8?B?LzRIeU1JQi9IbGxDOVpvRzlyV1p1OE9EekZwNDloSWQ3QnVXcW9TdjZWUXU2?=
 =?utf-8?B?RHc0Wm9Mbk4wTjNwV2FPWkNBZVhTWWVlTjZRMHUrcTJqdWhiNm1xdkJmaisy?=
 =?utf-8?B?bXdiVmlxWWdwR1k5NnlBaXVxZ2NiZmp4bmMxbjh6QUdqWEdsbkxVQ3NmR1hM?=
 =?utf-8?B?SHJTcjRYY2g0Zlk0VzdvS1k1ZWpoZGExSkVtN2RlYWUwcWdDODJEMDdrQ1RX?=
 =?utf-8?B?V2w2REpNSGJHY2pESUJzZmhWQTkvR1FYeTlJRWd5RU1KNFVpbHkxMWJDUWxK?=
 =?utf-8?B?U1ZYQVl4NzBEbHpRaXBUdW9QSHFObVgxeTZwajUvVkNNVElCVnRna2t4K3FH?=
 =?utf-8?B?dlMxeU5zMVdCTnRzOGk3V2tUcy93MzlkbmlaT2loWTF6U2o4ckNaMzVyL2tB?=
 =?utf-8?B?YlZpOEFtY1owcldBVHdhdlRPL3VpdnROSFloMlZCbnNHZHlVUEs2QXpJSW9w?=
 =?utf-8?B?ZjRjeVUwd0VoYU8wTHlaV25YS0MybGFBQ2tqRTRUYTdrLy9Ob21BaTA3WjFx?=
 =?utf-8?B?d1pqZERJU0cySnp1WXlaMmFoMFE2RDVtN2krV2RKeC8xcVdKTzdoRWxxclMy?=
 =?utf-8?B?NVJUeStpd0xpREcwdXdFWWpVQnYyamxkZlZUL20zbzVBMUdGbXNqQ21hNXJN?=
 =?utf-8?B?dzgrb0g4Ti82dXA5M2VYQkx3aWhzWitxMDdOREdEMk1sbkpkdTB5NE9wSlBi?=
 =?utf-8?B?b3JLTlFPRkwxQ3NqVlhWUWNqYkladll6Y0Y1WTgxSm5xM2VvbSsyRXNzV0o2?=
 =?utf-8?B?RDN6ZGhiMUJjaVpYOW91UUlDVno2QnZSNXozeW0zeWowdDQ3TmxwVFByVHo3?=
 =?utf-8?B?bnRBWlJjZ08xd0duOW5EUU43YkRvb3FvVTR5V0d3aE9QNkZSWi9saHBPU0pT?=
 =?utf-8?B?ZThQZjByeEZwQ2s1bDFZZkpFUFZHSnRZQUVpUU80ZjZrKzRtUktGWW5JWEdW?=
 =?utf-8?B?ZXB3RkxsalRoL1ROQ0piOXJXYW82cUo2WGZ5aDQyVGh4RnRZa3FYaDRienVx?=
 =?utf-8?B?em5YWVVCTHkvVVRmOFI5ZjUzUVpsKzNMbFRLUzR1Lzg4MUsyWVFhdUdhT0hz?=
 =?utf-8?B?OE41UmpaSXdmbGdPclVDVURRWVJSR1V4TXMxYmNKWEd4Yzk2YjgvczF6aEJ6?=
 =?utf-8?B?eEFoTysyV3RsQVFwSXI3NmFEUG1LOFgvRzBPY0JKb3FEZWYxaFZrdVJZeFBX?=
 =?utf-8?B?UmRONDF0RCtMeHh1VUZWa3FSM0FNVkc3WlRmaUZFZ0JaTDJGblBpNkpSZHZE?=
 =?utf-8?B?V0dYTVZoNnlLUHVMWHkwa0lsMHhieW9qT2NUTDZrRUQ0RGhFZkhBVkQyTGkr?=
 =?utf-8?B?NzkzUEtKWnExV0xNc1ZoemRtRzZYNTVQdDYzNWZFQUp6cVNJVkhBUGw1RjZY?=
 =?utf-8?B?eU5XODlXQUJKSUxoSmUwSWw5eFVMWUNQUHAxNjkxdCtVdkJIL2tDSkxFZnJ6?=
 =?utf-8?B?ak9yZ3NrZlhmYmJXU2FtSUQ3WkFPRytwUUdwWDhwcE5vQTVvWHJGTllHQmty?=
 =?utf-8?B?SlZlOXlnRktRQkl0Mi90YVpOdzgrcXBZV2p2dmI1aEZXeTdvODF1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750c9062-5e43-4f44-b07b-08df36d4edd4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 22:27:06.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBdRpDlKar1CAnbghRiyIE9LBU5bE5V85Tw4dCRfx9uQEWJppQr1Sh4vbz/uhfFxkfzNatyuR2L+5BjLtYGpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496

On 10/30/26 12:41 AM, Alexandre Courbot wrote:
> OpenRM defines these registers with a stride of 8 bytes, so reflect that
> fact in our own declarations. That inconsistency went unnoticed because
> nova-core only ever uses the first register of each array at the moment.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/regs.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> 
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 88662da634dc..df2eddc58efb 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -402,19 +402,19 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>  register! {
>      base: NovaRegisters;
>  
> -    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
> +    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8, stride = 8] @ 0x008f2c00 {
>          31:0    address => u32;
>      }
>  
> -    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8] @ 0x008f2c04 {
> +    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8, stride = 8] @ 0x008f2c04 {
>          31:0    address => u32;
>      }
>  
> -    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8] @ 0x008f2c80 {
> +    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8, stride = 8] @ 0x008f2c80 {
>          31:0    val => u32;
>      }
>  
> -    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8] @ 0x008f2c84 {
> +    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8, stride = 8] @ 0x008f2c84 {
>          31:0    val => u32;
>      }
>  }
> 


