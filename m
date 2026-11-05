Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881075;
	b=PbtmCLunfl7m2JxeVTI2vZm2S6n/ZVLA0P6Xqeqj2BeE/9jgE7TPgl9OcM888F1AreDg
	 azbS6zGP0orNGv5AF4Q3DpD9ZrK4/whGmywe3f3AbzCO36CiLPtVOcMBen05cRYYp+prH
	 PEikKIuidff4OJlpmUCnq1Wssu5XNsFnWW2MmSaxqFHcWkFIyq50q6T7U6gK89FUBvjso
	 cu3qLkX3znlsZJ03MG20EtYGZgm/afrchb/04N2trpTtjOuyf3qP+4z/M0K4C8gDEM9qS
	 x5KYG51sPuE7JxQhALgqT1oMCEvK0E6tZwSfBRhcOsx24DVT+dr1kknWO6Domg1nQNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881075;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=UYCQpsJIZMGbYlDe4X/lKvr/1ee/O16qpRV/G9ggZyk=;
	b=Jhgs3BB7uR2YWgZP3L4hEy+1ranv7H+3dunzIUasOVbWnFw2CvjDsiimyb3WY7dg1uWK
	 w5xs4guQgsUeflxkhnElNuLX//m0q1ux8/bRIp+aO1j5oIHiDnXCoZJjqj/gzbaH1p9HI
	 4iWt3C748jQfxcM4CqPHBPlHpiwh1l5SrvcWXb1UQ8ahwLjzW8fF62Q4QHpAq28oug2nz
	 B98LVZq7lQ4xzbvavIFLg/rM5pvUVFtIaDbfthJ22z2/IRxt7vqLgC01bhBziMpdTYwDZ
	 k4yQmi9nhKXIXt0rpQpJcFmw49+UcBqOV/8yH9z+rslTDrT+16iEwjr4gbICnxO3lVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A9YDV02V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.41
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88603606A329
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 12:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88603606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A9YDV02V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR2s9JUG9BVQyZeoJv6ABtVKoU4uAJRvOny3ZF3virxLSr7UO7PfEhyKXe+8ocCb1lXvUKGJtIjuBMLjgmjcSVbhNC6HFJMFAWxzzbBbfwAePN2q+guKOs7Z4cbtEnU+Wnpo9uxI90kQOnZ2shlehGAiZ2GBzy7jVHEMof/5TAhXSwUGiFbty2FyL+zV46q3ToSHHjRAz4mgTHO0+7ibCJIhRDu1yFXLuNFlx5rpqGCaRuYvof1OrGLvOehQZ4p3yCrT3p82DzAVcViqaVxcgavGXLkvHB5+plnwAckNYJfF7p6Jdw1lbbLCMKM+juAGMx0PAGwBzcxNUoqmNsznaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYCQpsJIZMGbYlDe4X/lKvr/1ee/O16qpRV/G9ggZyk=;
 b=tiIYWsiNxVzE7I8jeANgxeq66isUWirGHIsA+iJjgN7jjOU90qi3RYh8wsmw77ZGC9FzIapCArjVL+9KvScrKwHWN6V6avDVuJ92WpPRIfwel0oT7sAEJ13dBWPdc+5Zu//NUU9Eqpwv8PBYx8fEQ+KYrNYhP0jN1HwhmGzTLmun9d6gFRMug5i0J0qiiIlTAvAv1JzY0YA/vw7ym7YulYnqiNNV3tLBmzgUcW66yCTtQOPVlMwGZX1Ve1KIkeMm5xEhrQYqhUgOANEiqSEBPpO61sZDhKPJhbifCGsXmRwFBT7FSiZ14NkZ802Hczc3V8une2W4MChnN8SidF9xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYCQpsJIZMGbYlDe4X/lKvr/1ee/O16qpRV/G9ggZyk=;
 b=A9YDV02VvmfXpjm6lwEwE+51bv6mg57mufkMzRBuleFlAidNox6Rg/tCGw4FWl0AD1iTXyEhbOcBWvc/LkirnsLyuRQQRt7fk8SgbtRhHAAldmX6G8DD7qo1WCtOr0r7QIudHWjkPielfB1jScLXRc1/vSCJksneATxR+EgvdYVHvnuk33ApckVqolZvhA8hQ03L064EMNBpov0oBtF/oiGrGN6kgaXcpZPYqoQtWJqsRDKcW+BlLSsexfLkzdDUK0hDDyoTLVTesFf8sjrr+W+nfr66yq+5cfTw4OBpTXGwc7PYLm6iZTNdhyYNDSQZ7rdapvV6Puig5GgkH5QapQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:17:50 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:17:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 21:17:46 +0900
Message-Id: <DMN9RKYJEW4C.2ZIBOYG04RMUG@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-1-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-1-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd59f6f-2b55-42fb-6992-08df3b36cee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|261022115727099003|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261028144727099003|261026121527099003|261102123227099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9I9aqegO//R8QvQNBI78/wnnmyikssCXVXZv+bnpaZ0KsrDJRHoHP3WPV/CAFhO/sYHh4pKisminYJPSQucCBspdbwoPksiQBEF7pRPi5hoQmCB0Lp93cY0xSMqVCbp0w//Nb0xf3Tqe0kIF/W6dvwRwz56SzJ/LYrlictSHX/+YYARmOgjZBvzASBAi99ATtVWwRANbcTv/G/NJXyf1tGslomoYuTRtipyZLBtrdJqRx/soIfTnSVwvnvjuuX69EkYBBS+eRP/og8rY6eGZlUIeNePN535PBBk5SVGUpso7aL65FF5aPUFUJ2QtNKCS2oZnw2uiA0rLBQTBpLVU6DjUQ8FmgnrJQ9ovAKSohYd8nDchCXUdzsTpBbMqlCBITpw69mV3wB9m98I9wQyxZyyiElgM6mAvzgm3BsCLVguQkmlbVZNfSYUOX3w2Ip4MN1ml+B5uCz/zbdbR6GtfsNXYjuoRGIm0GbROLgZZN0lBdXJSBvNkwRyIlpycF073LkroyCwzWqtRGtvokjfv+SchmllrRbPZwEZDgoI+QwE2VWMasCtP0+0yc9vWNeQE8UpWLr1gp9ik93QPdTHI0N4WPecsdRyOYHla0eM/+sHn/oXha8wQ+ygk9syuOSftpo4ycq8i0jKxSlOImUIFSkLl6S1XpMwcf7q5aB62vyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(261022115727099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261028144727099003)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUxhcFl2T0IzQUJzWmxuUmwvV3M2RnVMcHFYTDM5Rlc3eFZYb01hb3hKVWdC?=
 =?utf-8?B?Z2JoaFFoUVhVakdWZE5UWTNFbGw3ZC9ianE4c3FEbnZTRjlIcTB4YXpiYmhi?=
 =?utf-8?B?OGVZZ2xZZmJOSlZOWlJvUkJrYzZUTEVKcUZBSE1xU0RnMlhEaWw1cHc2SXcz?=
 =?utf-8?B?V202M0lFcFV0anVkMUZMbGRwcWhwQ1l6Nkhjd3ZOSmJaYTRkWFVwWjQxVytq?=
 =?utf-8?B?OGZBN3ZOOGwya2IzWmVoY3R5UDFqVWg2LzB3YVYyb2F1ZUJmbXAxaUhHM1Ni?=
 =?utf-8?B?VVgzRzVmTGVENHlsSVNkQTJwTDI2dVlTcVdoekR6cGpZZUV2UDFyZUNyKzgv?=
 =?utf-8?B?eDNnQlFVWW85c0lmWldYa25XUlF6MWxHTVZoL3RUM2ovNGVBUjhwUjhxdUpx?=
 =?utf-8?B?TnErOWFhaFBocjFYK3EyeTE3aTU5WnNkUVc2bjVxczZLTUlRZVB0cTRIVGdj?=
 =?utf-8?B?dncwRFZzblhEYjdpZ0EwL29sZmhiUEM2aEUvVUxtN1U4OE90cnFuQlhUSnRM?=
 =?utf-8?B?emtqMVg4V2o2Tzk5VnFRbmo0QWpQMTVqMFV5Z0V6NU5iYVBWc1JzdEM1cGFD?=
 =?utf-8?B?anZ3TmowKzRaT0xWT1RDNmpuVU1YVkROYWhGNTVwWThHQlNFbnFKQnB4dnZr?=
 =?utf-8?B?b1lPdjcwa2k5SHUwNVNtbUdMN3crbVVZUVAwOHJjOHduTnZVMnZBTHZGcWV2?=
 =?utf-8?B?d1kvREM4OFNsdE1taWVHenFZRmUvTFNCM3BOQVE1RStaMHpjdWRuMVgxMjR6?=
 =?utf-8?B?WWhCaElMVnVDamRHWU51NkxOYnNDR085eWxjOXVUdDF4T2ozZHFaOFh2MXZs?=
 =?utf-8?B?ZmVha0pqTmp2bGVzM2xxdmFGRDQwaExydG14QTdiL3pDS1AyaUk2YmQzRm14?=
 =?utf-8?B?OWovRUFoaFZXU0V3NXBNUmtLK1NoeWNDZjFTRjhGUnZBOEFHYzhOWmxINCs3?=
 =?utf-8?B?NExYaDVHaHZta1c3NkJkR0EvclEzTys4VGJvR2xoL0JyZHhVNjVTQ2IySjRL?=
 =?utf-8?B?RWlEYXZZYVZic21BTjZPejZoZDdFUkRtdlZEczY1UHY3Y3QzMlBXMkE5MnE4?=
 =?utf-8?B?VC95SXcwMmttYjN5MlZXU2JkdTdNQ2dLYWhIUVp3K1FWZkVYSXkvZUdkekpB?=
 =?utf-8?B?RnlBR0M5T0oyb01SSkZVd2xnanl4bXB5VlZRMTdqSXIzSXptanhvRDBGNita?=
 =?utf-8?B?UzJrWVRaeHZRZmRDeXpMaXZYbHIxZmxxZElHWHZYVU12blI0aFFHeTNNdUkz?=
 =?utf-8?B?Y3NWVUY3YzgrdjhZNDZseVR4UURXeXE4MHdHQ1FrQUMybVJ0Q0FMazdMam45?=
 =?utf-8?B?WkpqTzNVeTRnNjJ6Wk01Q1FvdjVkWFYybGFuTkwwS2dHU3ZoVVRaQ05iaEhE?=
 =?utf-8?B?OVp5R2ZTZUExbEl3U2xlYUpzOWF6ZUFNRjlyeDRLZVZJQ3pUaEN3RFVhUGpK?=
 =?utf-8?B?eGxsTjlWSnB4blZMT3lPSTJ6R1ZUWnVuR1lTdWNTUE1MOFVtcG1iM2V2TFRL?=
 =?utf-8?B?N3FTTjdtYzZEZ3YzZlZqYTNqVloyMWJGU0NZNWxuY3h3U1VTU0srYWxYNUR6?=
 =?utf-8?B?bzFoYkE1M3U1RHROSUNkUFArT2EzSEdIK0djSCtRd3RCd1NMNnZZWFREK2xx?=
 =?utf-8?B?WVpPK2hKM1R4K3I3V2xrdlNQRkJpNmd6UmhpdHptMnJjaW5KZWk1aUlrOThH?=
 =?utf-8?B?YkJmdTlxQ2dYUk9CZENFTURacEh5ZXRPNkJnK1FtNFh0SlBobkxWVEZVQWp0?=
 =?utf-8?B?YnBHa0htZzRDUVY3S0NQWDFwSXRkM056TGtLRWp2My9VbWxuVkN2K1k1cVVk?=
 =?utf-8?B?VU1yRXJlRStIeERUSmhNOXUyMTRMNXhGeE9WK1NQY29wWkxMNHRwRWhGZXBX?=
 =?utf-8?B?VmdHbS9NcURkMjJ3OFJXY253aUxzMDZBenVnWE1VQmZkeHI4SnVZMUtWanV3?=
 =?utf-8?B?Lzdxd29NZ1A0YTJWS1ZpTGxjNTNWcTZwajJSNWpzZXRhNHY4c3M3bEE2N1JX?=
 =?utf-8?B?UHMvVkxCOVYvYjAvelY1RWVrSnBwSFJlR3I0TlBGNmxiZzBOdDlWaDlPcGY2?=
 =?utf-8?B?bHpBQUVyRUw1T2VXOXNndDg0Zk1FUFRFUkhVUHFFYXZkb0NadXA5MW1LSlVx?=
 =?utf-8?B?ME1vREEzaFI0Ni9vb0oyS29zY0UvUHJjTFQ2aEdxNEhqd082ZEZpM05RL3NR?=
 =?utf-8?B?UUo0QlRRc0trRDdrMEMxYm1ZTGhFZGNDajRrMENDTjhERTlnSFJoU3JBYUpK?=
 =?utf-8?B?bnp1UGsrTGZVL0c5Sjc2anlwN2wwcUVRT3ZPdG44MktjeFMvcnJrRHVtNGs1?=
 =?utf-8?B?VDEvQzVua1B6VDlZTmROakYwV2hKS1pxSE56OUh3ME5rUG0vVXVYcVREc3BD?=
 =?utf-8?Q?m846W/QvN21Z1b0h0Q5GYwdshDdybfU52QhR9lq4g1/2l?=
X-MS-Exchange-AntiSpam-MessageData-1: +tOFT7XnS98LYg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd59f6f-2b55-42fb-6992-08df3b36cee5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:17:49.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBMhbCIj/lsNna0bl/c+M2HjAW5YoZ1MDp+qDHPdEQv3QFLtrT4YE2ejfkXmqu/7h461imYyupT2EX/+JBDjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic falcon bootloader is a small program that loads a larger
> image into a falcon. The r000 boot protocol needs it to run an image
> that GSP-RM names in a load-and-execute event during boot.
>
> Nova-core used the bootloader only to load FWSEC, so the bootloader code
> was part of the FWSEC code, and there was no way to run it on another
> image.
>
> Move the bootloader into its own type, which FWSEC then uses.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> [acourbot: document boot_addr(); split the change of IMEM placement into
>  its own patch]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

> +impl GenericBootloader {
> +    /// Loads the generic bootloader image for `chipset`, placed right b=
elow the first 64 KiB of
> +    /// IMEM.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if a required TLV field is absent.
> +    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
> +    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
> +    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chip=
set) -> Result<Self> {

nit: this takes a bound device, but it's only for logging so it could
make do with a plain &device::Device.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
