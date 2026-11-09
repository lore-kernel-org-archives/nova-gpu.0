Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.209.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794198730;
	b=2moMPWVa2Q0n1HGY36EzguTL7m+7mEHbxXm1taPgEtLWaproCZHqo8Uf/grl/g9EMpAl
	 U6jDFK8GcVpGoENOe69Cn/8bKRK4EXNi2v3RWP7LPMWrFplUxx454WhL11IeVWevNMxSX
	 JVzdM2Jantc2EiGg1YPX7PbI0xHU7ht8pbeywkcwXPQsV+QJcdVenk4+dqFxaIaqE6ZDY
	 yB46RlnobvAFfvNGP6PLCxp+aAIb5h/Qykc68GkfQj71oGddQtx1qKWjbZIvww3H3/URN
	 m7to8KH0zTf7rorYdFm5m4yoX1dWE0JP7cPRcNr7YqnD2Scs4nR4fa/QpDqiAbiN09Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198730;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
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
	bh=EDWQw94GFBz1m/KvPfkL59wiL3GWWDcYfvsx/ryT4jo=;
	b=DB29f9UxJgY1PcjUuCjnoJCPyPbjR1BYsaWhC7QsIvX1eAtHS2ppB0kQvkN1BdtBfXte
	 /yAyVYOzXReRR8XQOZpFp/Km/pIQd4+J+E45L98sQrTMCsOonCc6Uy5QYCCLn7y0bBY0/
	 BkFHAyp3mZsNnz/Dd3ZcxxAF67KZ0p4fCdZUT3vHfvjc2FHGJHdCBCRvmYG5mREVZd0NJ
	 IpgaLQKgtwIlDUti4vXFzTjylUpm0Q2jxVaABQFzdqhfsPEc07QX5CCwLOX0IRYWJzUdC
	 3rD97VpH0nZWrWXAi+vDIHUQsEtSAGrpQOH5dqWNBJho/q492kys6i4RzHWVYDRJvbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OiBPIuhj;
	arc=fail smtp.remote-ip=40.107.209.42
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F23606A323
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 04:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OiBPIuhj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhNZI68z1vgnE2/YjltpfJVecUGVyvkROeTfgsh+3Y8iu6PwBSJjMfhIEQy3phIfMP5P30Nzm6gYqbvF0zmU6ojL5mVCtCQaKoTwUMR73OCYFwZcrIomBxPt+2BRS6iqTpEbUY/IYk+tIA8womnVYsl9fgv17/6oflgua2/yULijzjsrrdOf9bicRXTmI4zk59Qi/Bu7Jigu1YRODxctem6sF0MFT2waDvpX73u9Zh3EfeUwa65yaYL1HCW2TIFBdBslNcGn09GuQl6nQO7CL5jVS+vdH+1HJLyKT/HMSE1T/IozU5lJYijsxt3EOpBftVqIQ0eyxUsQ2eovUWZ6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDWQw94GFBz1m/KvPfkL59wiL3GWWDcYfvsx/ryT4jo=;
 b=PVwow/IxJyoxoQpvvA7HHrmcbPcauCZgWXNSd9WVZPtjRVTJi20u6CBvU/Mgg5KCAxE0N35olVpQcHStRX4VR/9rn4nr37Qmav7rT2Iyn7Dmz7Hl6988TN0/9Gegkve0to2khGng4S1NAZVihty4vAzG+Nu9unNUAhSibl4JpXzdoDMbflXbYiRJlvnx3b4ayW6Yknr3pQh9WJoc4yVZ5e1xzFFvLLvHq38zMgMsbxXdll9CnWRY0DPkzy564KisRXzK9bk/f9GHY8un0CF4txQkDGqrpbAg84Ce+kHh+TywTWKVo9hMkT8bP9MyFIKRBM7XFrhdxN2iy0NI7A4wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDWQw94GFBz1m/KvPfkL59wiL3GWWDcYfvsx/ryT4jo=;
 b=OiBPIuhj/TDqU26Q32gTl2ZAYd3cPirxln2zJLtnYb4sDFWT9vyVcsfc8YaT7aMzdeRrtqG8mMF3OgZ0+BlNmfMweiZgrF++P+SCVCmHR4mFAsAfmCB/0a9KLng3UXixN8tVpB+apxyqXEclIOWyXvEUjiY9kY1EHSPB1cht144HMv/4oH4Xx203Ds5Xn0h1gf++o8sjKonU2BOI/tPe5X2GVwFMT8Pbspi7nE1zQcxmt4vIzxPlJb5C9JfT5m9xXWp/iHhOHcICwr9FwdUuBNbLgpq/iycybQ6D+eUSWZ0+me8HD5Nj4nxd4DTMN+nvBhKHfXBrDKOsRcpxMMYN4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 04:32:04 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 04:32:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 13:32:00 +0900
Message-Id: <DMQED5AUZFY8.2PA1KAFPCNBBV@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/12] gpu: nova-core: falcon: widen the IMEM PIO
 offset to 24 bits
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-2-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-2-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: dcea02b1-18e4-45c6-7ef6-08df3e1a6766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GPivYrlKLwVDCCcDNilOog9MBoh9E9gAWDT94mt3JmUuC+CUrUG5SNN0MeLZeQCFF3uk7IfjRQLr5BthgX9jji5T7lUyWNbh/g7WdxZPN8WoCVkNARFWrRyWdd/VWI08n/Tf5qQU41OplMnvYgOLim8QIFvFw7mmriRljvlWeU6ItA+3qMmi011GtlVmHD7FdJHM52+V2kybosOFTtJr6b9otIRZHEDodIjNU5g6eHfh2uYHaXzeo/mJQcAFeEP26aoGXMWcvPPXbn4TBG2DXsxLJaR5OA9RQknYcOXJmbAJ5vneP7We1QM9jrjI9U4cIxIVWBA6R+/9R5PHN5XWBylZJHTcIC1KFiVOSI47WqTOZ/dFtgqCObdPXi+hEpHSpbpdFp7og0+JdpqlLVrgX6STocj1wAPYh5MSzWJqWgWba38DilzGcFDguSD6B1IHTm1imjhaMP8XVG2ZlrqaS1r5j/QTf0XjpDxHoSpyLBVcNpeRSWgJxR0NMC+11iHG4zlK8AJRw46uHiCV+LPJIBAXyky9YKO5GnWqcjoUI2y6l6QTz6rwyHxEsGUjDM5XorxLSFn3c/uI9FPG9Bflqo7CuqH6KN+GgebBTNaMtQpT3Jat6onJl6Zq3JaP/SH3S5uoSd66AufiUhGkIQULkdeBa1kq+uJ+69n6pJtOOX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ZEZ0wvc1dSa0hhb0xKTjM5UVQrQnJmMnp2UGRXYlMrZEQxZFRHZ1B5Mitz?=
 =?utf-8?B?V0NPbmlRaFljZytqdEdLYUx4R2lGaExNWWZMeG1HYXBsckVMNklMNlYxOC9Z?=
 =?utf-8?B?UWZ0WVBRUWRCNjFWdHBkMHhHV3JnUUdKUStYamxCYi8zcXQvMTJBbzI4Ry9m?=
 =?utf-8?B?MlZ6WjlWK01EQ004TUYwOUNCYjNJUkpHbkpVMmZ3cnFLekhqaUdiMlVld3RK?=
 =?utf-8?B?bGZKcFYzL0RuTHErN25IeWJtVWE1V2tCSUZXR0VXcHJ2ZU42ZGFtRTNTcDRB?=
 =?utf-8?B?N0hkcGxIcXBKSlRVTVpsdzcrTzdrTVZ4TXh6Q0I0Ri9NNXp4NnIyMWZ1UUda?=
 =?utf-8?B?V1daSlAxejVTYngwUHN2d1NaMHlIZTY1RjhBbTd4TWtFelh5QkY2UC9Sb0hG?=
 =?utf-8?B?anNPdnNDMTA2TGNvUC9RcFllSzFCUnpOa2pEbExvTU5keFNDTmxBVTV3SHdw?=
 =?utf-8?B?RTFpajN3RHo1N2h4eXFnNUdYK2lMOFhOQm5pWVA5TlQ0bm1OWXNyV0tqcEVJ?=
 =?utf-8?B?b3h3blJDZFRaMkc1cC9FZ1IzWWcyMXgrMmVWb0ZXWFlBUy9kaU9rMUFjd3lu?=
 =?utf-8?B?RGRFbTZrZzArbXgwalRsUmpJclZyMCtlMnE1dkhxNTdqV2RvaUxLTlhpdmxW?=
 =?utf-8?B?aDdGVkhKWm5yL081SEJicDhRNWorMzBseHE4K0xFL2pERHRRazd6Q2dVbGdD?=
 =?utf-8?B?bkhoVDhucHJPOGx0TC9NR3Ewc0lVV1RCS1NTQ205WXJCdTNMM055bzZwTEVx?=
 =?utf-8?B?Y2I1RlBCUlp4QTgycm94R3VwSGJxZ2RnSUlzOUF3dHQrbWhLeXJQb2JNMStJ?=
 =?utf-8?B?ZVMrb00xdk9NOElsUTJTVERvNENEam01YmdEWFF1d0NzL0QvMFphWjdqOTNJ?=
 =?utf-8?B?MlBqN3dLc3UvbEhtZDAreDQzZWVMMmVnU2owVW9aTUJiMHdUdDV5UGNZZG1i?=
 =?utf-8?B?QUwxSytKa20xVUZqSTdXTDRaYytxUHhNUE5zTW9CeWZ2QjIzb0p3elgrdm1O?=
 =?utf-8?B?OVpNRS8rSEltVC9tY1o2V0tJUXc1eGNvVE9SZVdpOXFlRnFGVXRPdDJHbExE?=
 =?utf-8?B?aXBSd2FnTWJqQ0FEK3FiTmtCS1N3VExZU2tweFhYTjRrMG9YNTJWTDErZFJ5?=
 =?utf-8?B?N21nQXZYa0FILzN1bWpvNEpzaVhTZjMvL2c3VGc0Z09pc3pjM2hkSUdybDFn?=
 =?utf-8?B?NlBqWjJwVlI2RzhCNzZGMDdEWHdiM2c3SG53NHUxeHhWQkx4K3RNR2VzUkRZ?=
 =?utf-8?B?WjZ2QlkxTDYxZnJ3eWtMb05LUFJWWFBXQjVZdkViWDdCTXQvaVVqVEhHRWZL?=
 =?utf-8?B?VW56S2Z4b1ZDdm1DT0NZcWZHWmt0UjlxamdZWHB1OUJKb3R5cUR1c2JheVRv?=
 =?utf-8?B?ZnVyamFVT25vZGYzbUhLUDlXWlJFRzZWeWRJbnhkODVRc24wbGRKakUrcGFD?=
 =?utf-8?B?cFN4S1REU3VJNThGNSs4VjU4bGRXTVdUNmRqSk5rQ1ovZDlhQzE5OWFqc3J2?=
 =?utf-8?B?QUNKUnVOZUR0SXVUa1hkdUJtd3hWZVJpWFFOdUEvMUxYei9jUmQvUXBkc010?=
 =?utf-8?B?MnhzbzZPWkdVNjYzQ3RwSThMQUFQNThPSjVJaXBoTnJSakRrTzVsQmJYQXov?=
 =?utf-8?B?YWp1eWdvR2hSMlZXWnU2ZDhXem5jMnZ1RWZpV2VhWTdmaGZ0UkJhSkVWVnVM?=
 =?utf-8?B?aW5oNVBQcTFaaWlGM0ZqTkJWTnVxb2RYVnFnQmxSeHVKTmxLeVRyVTRud3lB?=
 =?utf-8?B?N29ZSXI4TXUxMjlFUEdWaWFvOTk2Y1dnNG1QWXpUQjdKVU1NdWxKQmJaQjJY?=
 =?utf-8?B?MkFnUCtoMmkzTFpQSXI2dFN6elp2WEtKcEQ4TFdVZDBYQUpoTkEyamtiWFk3?=
 =?utf-8?B?ZWtOcGNMMnJFQVd6RXUrR0NjWDdqOUxJUnlTeXhHT3JDYkh6UVNubHQ5VUJp?=
 =?utf-8?B?S1QyUnQwNUdBZFdqNDgrODZQelVMTWxjcXJJUzIrWjQyVEd4djc1dS9SaHF4?=
 =?utf-8?B?djlFd3VVWW9FQy93YnIwOFJXREZ0WWJPSnVLcTRyZkw2akxDYW8ybWEvQkJx?=
 =?utf-8?B?TU1KT1Z1a0Jsai9aZVBmdlJNc3BIa3NpQ0FOQkRuZ1I0NG1POUZzT242WjZz?=
 =?utf-8?B?VlZ2R1psM3ZGMVJyRzJOUFdNNytlb29lbnlSRVNGUCtLRllGOHE5cjg5anFQ?=
 =?utf-8?B?K2RNTUo3UmtKemdPYnFySmVRRkFiUnFGUHJaVFNkYVZSald3aVlwc2lIeXpS?=
 =?utf-8?B?SE05MU5pR2pJZ3NLWmtXNW9oanhpdGlpVHc3c1dHWUh3MDdmK0ZTeTdnSUZE?=
 =?utf-8?B?ME5hYUo2M0ZBWWpXZ3dpdnY3VTdPbTJzNWJYN3E4cnFtbUpTVTczbjI5UXEw?=
 =?utf-8?Q?ZI0kKPa0g3CqA67Wi2Y/yWx5l0rdC4/zNjzsAlrNQUzpw?=
X-MS-Exchange-AntiSpam-MessageData-1: j1K0/rqHCX1QJA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcea02b1-18e4-45c6-7ef6-08df3e1a6766
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 04:32:03.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFOPPaoNDQJHzhGmnsMy7dwAeeXA1XjrG8sb5kn9TWp+QsY07Bt3f/GdII9bhml0F6YxZrXMySrntTBh2GEUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546

On Sat Nov 7, 2026 at 6:47 PM JST, Alexandre Courbot wrote:
> `NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 24-bit offset since GA100
> (16 bits on Turing, with the following 8 bits unused).
>
> Nova declared it as 16 bits and carried IMEM PIO destinations as `u16`,
> which prevents loading anything above 64 KiB of IMEM, a scenario that
> becomes possible once the generic bootloader is placed at the top of
> IMEM.
>
> Widen the register field and carry the destination as a 24-bit `Bounded`.
>
> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
> Link: https://lore.kernel.org/all/DMNAN7KX22SC.QQ5HURCU332A@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

