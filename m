Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794977523;
	b=SKYqvxGOtER3wGRP0tUFPWLQtbNSsxLrcUypJffxDz1WJzk7Qnh6/tdF4o7F+s+Lb+Sh
	 hLnK+Tb49GiLWiPYIGyayLIGxgOH53156/BY1LoFweQXaQ9S7xxDbE4Asxf32GOV4tREh
	 c8a5/8s009qKnEpxwXvD3kEJdKp+yiQq1myaUNX931uvk/333lnDRQ+n3iCOOPx14758Q
	 FxhihS6Ye//dLy8uq/Cn5tEArFqYppTbTeIB81eUyNBiH0DQ7Fsxudh4jEZl9Q6g2g010
	 gRD6D4TrGATt1O3sfDnrzX/vghKaLGw+9esYCg2rMfcGwHs0g0KxTrm82Z7q3TXqglA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977523;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=T7+Txowg+8lSVsfCsh7z3cI96NW9UlXRFtQyee5cBeU=;
	b=xsziKNejjgRpxuTjLePsGo2I4aDimcdNF8HbN4764V+VX1N2uykt03REEvMi8aK0ltx8
	 TET6Vr17qECPHMwOZY4vqJ1gMdpzjhz25e7Fu0qDq0I/OWgaeCj3T5Sl73zLYpi0xsBx7
	 zK3DnVykN9PWuJ+sx++xCjZE/InpLHDWvWKVUCW4LPY9nnh5IxVgk6hvCJx63cC+FRhZn
	 7veLkmWMzx7ZsPXHD1Hcu8ce8NmmfpmLYFISegdOPVTETczgizJziMG0Dy+g0OBDCMjuE
	 0rywbt9FsS98HuWAFpFjAKchMVd5SAEHnzC+b/8SJbx7MSaTXihRgAzYW0/NbyrWkhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pq31Inyw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.54
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAA606A335
	for <nova-gpu@lists.linux.dev>; Wed, 18 Nov 2026 04:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BAA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pq31Inyw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB7lFmzx2++mYyBMbVC8D7JTXNEJNuSXmmEjGGJaQiG/KODVQhE2ytZI9pF/zUKBtKkKIwEnM4z1VJ2QaxsoJjIs/HBseIjLOZjXmeLsf9BBoSsJdDZempUM+/Yv/Bj4b2LD+Bieg71WWOfjtt2v8dgsmfNT1EuU8g8BNCJL0G/Pq1vsC3CSVRqVxFyc1wT94YhSY8UkFwCWrlA316j6tOUhtnAnyv3tgXcuq7avLN0uhU+tcorv3eGTmCPB3OUg5SaUD2Xmiu2Jo7gqJghZ4OFpWlMHwESCWHBwqQEWnTkzsZanujhHEfIYkPgmBAGzl/4xNeYeX8THLLuaQaCZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7+Txowg+8lSVsfCsh7z3cI96NW9UlXRFtQyee5cBeU=;
 b=t88R5/C70tc5cwk2fzNAL5ezxM6rWq78e+W3eI7xcZYjTzhvIirmRpnL2nxn0V21b3uDpPYSVKyF+bDAm+PyGHq0eTpShncseyVzzHNTaOyz5O5VQWmLBWIhwPo4Bng/iN/ozD272R/Qg4TTGbCJ/yRYNrZj61wWgs7qDfrwqa06ux+IzSAGAiPZ+y4wUedX/qVMH6jK9bWTNsgmZt8LT4qrU6Us5L3uKFdxWCCI/U9dK+DxlUpR3CyuoL8Oqtuekpy9pXFnzb2a5ANYftgB9NZMdk/wUBHeHqOO1K5fLut/M88N+u+IUQkamIuy54lz3QNQ7IBV7TQlM3ecYwuSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7+Txowg+8lSVsfCsh7z3cI96NW9UlXRFtQyee5cBeU=;
 b=Pq31InywxdubwcZiAn0RArm6oFK35Lv/58gVpRRxlhCzAOI8lM3EBwDj2CnaaE4RLa4rrCKhJy4Ib6dRdS+qiYjyL85kdjxVvlr8ZJXrBftAMUg3LA5DMajYfYbkbtZ7H5sqaFbpehPh5gOHJea2fEyYRnFKVoClXVlLdFxnorcHYEMt5FZDiSohKtUwdkhbrq/6K9XKzUtNBqGR5c0FaOWYLkDc9TccjxDYVQwk/gkeLBkLJsqQfOhG/49w93qAmQ5d6MITSXikzWMXcQvFCpYftYwZOvLk2iSo2M0waSN+KTcBL2IfqSVi8YTZLdyRObjAnXwEE1nffpVZ7liYbg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 04:51:56 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 04:51:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 13:51:52 +0900
Message-Id: <DMY2F9PRPI2S.2GP0YHVFIRPIG@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v2 1/7] gpu: nova-core: add Tlv.get_u64
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-2-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-2-ttabi@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::17) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 141b1c90-a2f4-44c7-63a6-08df452fabed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|18002099003|22082099003|3023799007|261102123227099003|261021121427099003|261022075727099003|56012099006|4143699003|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	dHL4SGzVWLAhTglGTExzOqEgLdnktewl4i6kRSzqYpS087nO2gTshyzMGafdFhqfza6rQCOnzBYZ4zq11Mso3ToofuNv9Hf3S99DKODQPLl4AV+seI9rwskIk9ZyzDtlyBK3O89xHvqCY6YS5vZa2lwe/SiXwjYo2E9bWxfG3Fr4RPszvlzdM7XY8TWfuNRZ5t6NetrwoQ+m7sm4/tNgaCvJUYbKPPwdsnCnbAvAAdhResm1vS0AZWrKJL5ftBlvNyBDUvwJv+JVGioMx4z9yxU89yzMwsWiIC/EZyEFzKDRKxJn3fIvgIJoifdHnM1V+ZGWf8IGhP2Icx/1RRb+fG3O67I9PDtDaYbyJZV5EIxKuaEaGQUtFqRuLlXhdnV663KIiYFM5QlOBT+AKaJT3iTeHJlNWQ+Am+jSuWd75nmTIerMIMCBO0cEVJ6y5fPUpWHST0Gc6uwq+9KHb2Qia0ZcqgiQpj9NDh8YTaVXIj3zek8XW4v45tz5fM//EsBMGhKxoEDGtbHIJgvFcKU3rQoEtV2jdS1fB0wCqvi7qkVkIiQzKlCXPL6df7yBGuLgPXMjiTiKn3XAJIn74ThIKviKinkg+vLeLIfY6AIDwaADYIajP0VKnZdVSEWezwOFBAonPsLo3Qc3Chg/JgPgTh5cJ+ynHLkcDraSMrDHRlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(3023799007)(261102123227099003)(261021121427099003)(261022075727099003)(56012099006)(4143699003)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0xrWkxqcXpqR3hsZUxZWXhXMUxMR0ZNdVFicW9iSlZBSSszSFVUSGlZbXM3?=
 =?utf-8?B?VTRRVFNxaFpKc0Q4azllMFhQY2NEWWJqU3dmTERUS3pqUG80L3VHd2FjbDUv?=
 =?utf-8?B?QytVR01ZdDlhVG9WRTFpVVZROEQ5eEJweWRqTnlxQ2V6LzZNRmFPZEpJeTNW?=
 =?utf-8?B?NHNMR2ZnRnZmLzUrcE1saXQ0bmRyK0NkajJ5cThQTzUwWG9TZTNER1BsSW1z?=
 =?utf-8?B?ZkMyaHZMVWRKNmRYM2F3ZHR4QmpqTFQrNVhkS2t3blo1dkdLSDg1cXVuQ0lX?=
 =?utf-8?B?VVdDbWF2TmRSSjByWWVlMWRKRXUvRjY2MDZCWkZRakFaMDFucDFuZm8zeHVZ?=
 =?utf-8?B?T2VybWl2alBwSVZ2TEhaZm5xZlF4Q3poU1ZTa2ZMemJyYnJkRHRjRmxMVEVs?=
 =?utf-8?B?TkRESElWVHFKOVBqRUJrS1Z3c0NCMG5MOG5yWnVLSjBVKzF0Q2UzOVBidmRu?=
 =?utf-8?B?YnNaSWpiUEdQdTRzbDhzbmFlellsK0lyNnB0dmNiM1RLbTJHcXdma0tyMEVh?=
 =?utf-8?B?SHI2Z1dLRlVyNHdqVThYVGdYY3FwYVR3Z3VlT2VhSUJvUUtFUEZtOWlJTTBi?=
 =?utf-8?B?WFB3OWluU1NmQWtia3Bvck02SjBjY1hiV292UzZFSzFRVERaeThUb0FMY2RX?=
 =?utf-8?B?UWdMRVEyQnI3dHdSMFFLbm81Q2U1OVNrTjQwMnlKR0FNNlU3SmRkdHVOcWFR?=
 =?utf-8?B?d3R6YUlvTUJwRGdTb2JWK1YvR0lzc2lpeXUxcWtrS0RKVHoyU2QrWm5Bd3pG?=
 =?utf-8?B?ZndwcG1oMlV2WXo2dCt6NmVqQVRzMVJXYnJDU2NXWjhTV0FsSGpZTjNxN1dv?=
 =?utf-8?B?L0R5VjIrMEhTNzQxSW43TUlLd0FHQzRuaWxvMHd1RjVPbG9JZVgxeDVEQTE5?=
 =?utf-8?B?UzJWR2FGcW81clpGQzFybFFuSFZ0bnY3b3VHd2xqdy9VeXAyeUFKMC80VzFk?=
 =?utf-8?B?NTN5RHI4dk1RM01MME1obkZPem9qNGpDaXZVODU5Z0V0ZFNNTS9YcFZCNHJF?=
 =?utf-8?B?RzUzL3ViNXZWaGcraTY2M0FlOWkwRkdMclhCb1NrVEdBQnNob2RyZVl1Vmk0?=
 =?utf-8?B?ODJ3OFhuenZDNnhMU0Vtc3FGM05jVEhyamZ2cG45Rnh6T1JhVk1mNWJMaDMy?=
 =?utf-8?B?OXlRVkNRN2M3SGQrMk9VNE5sRllHZEE4UkU2YkJDN3dpMFIra2lGNVBpeHdW?=
 =?utf-8?B?a3JTbHhDeHovRWNXcTcxSjNwZ3BJT0ozYTJxL3ZuTVlsL1FWU1E0WEhubEs1?=
 =?utf-8?B?U1gyeTJWRUJEZjVHTTJvY3laeHd4WVdmUFRyVStpdXRvNFFrZXJMK1hocE5Z?=
 =?utf-8?B?Z3RyMG5SeFY2SU96c2YxeVVtYTVnRlVlK2piNXVUQTFDZ0FSRGZiQXduTHdn?=
 =?utf-8?B?ajZFZ2tvNFo0MmQrQUxRbElaT0ZGTFFNUlkyVjl3RWZGTGdCTmF2RlNnMlhL?=
 =?utf-8?B?UFdPTjhxVy92UGlCaVdJQUdHOENKUWQ1QlpBMTdIaUp3QytjaTEycUFqNWIv?=
 =?utf-8?B?ZER1U1VQalRTWUoxN2VOSXpTeVhHdkxRRXdidmErNEtGWHJMT0dMUUVNTysv?=
 =?utf-8?B?ZGRDT0xhaklLQ1lkb1A2cU5LOXNhQ29ka2JTVE1HV2haZ2U0dXM0RnJ0WnlY?=
 =?utf-8?B?Qm5RcnY2d0FjVjcrazEyNUgzdWVEc0YvcFpJcXFaSkovY2svWDFnRlI4NVEx?=
 =?utf-8?B?dU9RTXQxZ3pMVUtlcFRYT2xuemNRSjBJNTlrNUUvM1hiVnJhbXBlK0NpRHh5?=
 =?utf-8?B?UzJHWjNHV0J5KzkyNjZiS05rSWRiQ3FZbGtlcTI4QWJlL3ppaldQNWx4OU1X?=
 =?utf-8?B?T1Uycnh6VlFLY2NmYk5xL3d1MnZpaEp0dXZQTFZ5NldvUndEaGVNVUR6a2N0?=
 =?utf-8?B?MGlhUXM4eHE1cEFObmR3R2pPeEZoYmhMM3ZrRW0zYXRWbDRUcU5pemwrYTI2?=
 =?utf-8?B?SjNHdTdZSGZrczdTV1JZY2RCd251cXE3dnZvLzh6ZlZKaHg4dUxTTm1mbjJz?=
 =?utf-8?B?UWxYUzhTdlF5ZFppaEI1OHhEVk82ZFQ0eC9Qa3FNZWtJb3I2MEt2UjB0RHZs?=
 =?utf-8?B?UVZ0ckIxK2p4bGpnWmViM1NzLzdvcGxrN28xTHFZVThJd2ZWVVpRRi9kQkpj?=
 =?utf-8?B?V0dUMGVSODVuazBaTW9PcEk5dXJkVEZmc0RZM1hvcnJvWDRURFNobUYxaVVD?=
 =?utf-8?B?bVdkRi9nZk5XR1VSd3VHUDFpVWpCRmpIcHJ6ZW40NzMxbklSZVFQWGU5b0di?=
 =?utf-8?B?ZUczQ1BrTmFPOFhPLzRYRFJCRXIvTFhBT1djWmxXVnV1K3dWL0Vsbk5OUW5i?=
 =?utf-8?B?NzZObzFrdGZuV2tBR1dSOTE1dFl4dVIzZjVueEhXaVlPRU1ZbW0wZWFhd0kr?=
 =?utf-8?Q?dtraY+cL3sbGWZ1WzP5kr/4bA6Kz1q/oRPNS0gSpDxaXh?=
X-MS-Exchange-AntiSpam-MessageData-1: 3oVO4b9UwE6juA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141b1c90-a2f4-44c7-63a6-08df452fabed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 04:51:56.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1TlCaub1HBvZGlUb/7d1CwmqjZEwas4Pxv5xD7iKWb2E7YpAfKR3+LSAaA40SCyA+xn5BY+AjOe/cXSXeykfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Introduce get_u64() to support variable-sized TLV integers.  If the drive=
r
> expects that a particular tag might be a 64-bit value, it should use this
> method read it.
>
> TLVs can store unsigned integers in either 32-bit or 64-bit little-endian
> format.  The script that generates TLV files is written in Python, and
> Python integers are arbitrarily sized.  For any given integer, the script
> will store it as a 32-bit integer if its value is less than 0x100000000,
> without any regard to its purpose.  This means that the driver may not
> know until runtime whether a given TLV integer is encoded as four bytes
> or eight.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

