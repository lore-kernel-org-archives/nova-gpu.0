Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044941;
	b=5sHEoGrGg2JQWbaUh8GLokb1gE1NebeMDYu8mk25quJ3iJDvNF/uNwMJny+AR+baOqHC
	 +Wc5moGV2lOp5CBccd0ZCq1pf0izpxaTTPbDoYGB4fvcL+RJ+TflTLyfF8YBcYph3Y8n5
	 05TcyaKHkETbEu4DXBHXeorsSZla2mwSh2rXmucdY45WI0XmOiyFHoRlaBFMfI+An4uxp
	 wr0MxVutBQbIBTEFPlRV86vkuN3TswB+bVlMTFPMEeNAErycRozOK/9Oxsz75/R7Qg0WV
	 ungYb8XvsIsybFAbkBH3x2Rv85dXXpvEwnic28IFitMJflcTO9x2yAfp/O4rSXyRhvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044941;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=PmUgsx9s2vZX2/jUbosgXADsji6GInLoW7KK4Tvruvs=;
	b=k/DK9ZsehMi++PPUkuyX/xCtZWX4bUBOfk+UYTAsuty4kB5iYZL62rR3EIgKhXauys1u
	 U1a4LjqMHBZh8DUYserhm4Jx0JLV5aq6DzParKy3m0bPvJ7tZcEt2KH/OJvCmHMJvacDl
	 iCJktE6A8bClofVkWZ25lK4FFMdiojFqEcfCgEasOtz3dnak6DLh8kT/SRxhCFQ1LzDN1
	 bzelAbQbJmskYz0UTGhw+dFzCMUHQuylNYX/V4w3eoxj3Ln9alQbPLqOLyhAldqvb0DCK
	 vTg6UYMQ3L617ZpKXbm9F+nTYmEkMOpPFBB5It+qEw+yt8tVDYNdrzlZ+ttXH4hq7PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="iQM/Fxip";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.46
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF017606EE81
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF017606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iQM/Fxip
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2hdn/DTxnpDParxiKtHoGEl0PrWDscGXLanu/3m+XFL4dlr5jlf5pE2MBgTaTFDijtQTkCkQSmtYm1DffnhRxki9JOVlIivSd/CCDr1sz9uFG4Y0SSdyg7+8yGT0hhJxt4sFGJ6nyB3EnsuhDeSF+9pmzUSg/TZXoB6OjWVOndlEd8xm4y5ESOt/GaRa/+f7cp3f1YIvO7s9lXMhC2DF6QEJd3I8uZNQurnAx71/z08Nj6W1ZjfrG6MCy2msM+zdp9InI0niC/8TEW949q5pmMFDcx7YbFTd/Twv56VfxsL8Rl70BIAcGzUxv2g7TdRJIXV85fqYIha7SMsHxDdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmUgsx9s2vZX2/jUbosgXADsji6GInLoW7KK4Tvruvs=;
 b=jw9UKnyFmtNzbuxKUx6fqr9kzfdWb8zE05P5RUc9T/U0FQ3tEQQKQYN2b4FwnNlVxUWaoTp1IjVD94XP6YDY3tG5lx3DnTomP+Np/e0plamjKh9qcAPytwrLSJZAUxfkHyvUSLZjYabgdg0TmnnnUw2MqfZlCsolhFhz1o6WP7DqXSS3sVNLYj/E2ELk5hFhkbdLvn6qt93tGad2/t7PkWIjzhtDgfcjvUKBoM2XoiC9nLDOLItN7SdPnXECxDM0iN3B112PDd8KDt6HNt+MkW34qGJUGAwXCoYnGPWi/MzXOUj4aSlCYWarc/kAKsaKIZrUjbi7/ExsUUA1URN4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmUgsx9s2vZX2/jUbosgXADsji6GInLoW7KK4Tvruvs=;
 b=iQM/FxipXLTKpvZaBCr/VXkB0LneMc2sk5zoaOdj3jrCHCR8JkoVJEUY/QGfHfRuZXoOWaT+4MxzpWw+H7463WlVscuSW/DAa/ExYttUZa873nRvXi3ck8I0diGwt9aPm9byFlRckSec66Pcdj739oYShxqFD3yaF/7cD5+6T1dsiaVhulsWfPomoNjXkXTqQMr2uchT7Ne12MTKLsjtiSV8Q01XXXC4OoQk56BAYusrVN6Asi6ig6rPgoH3nrtYrtyszUU1uqddNa+/VXVpvxQgyMz6+lOaEtfYoBfFaLhk3Ok3EoNSMLcyrshLFPXy03Mulvw7N+DeV6p0Sqdebw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:58 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:07 +0900
Subject: [PATCH v2 11/12] gpu: nova-core: falcon: check the per-block DMA
 offsets for overflow
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-11-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 86aa2697-944b-4a38-c647-08df3cb457d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|56012099006|261021135927099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SD5TnxMBdggySavdC5rlQq/rAKV2vdm9hA25bSqayAaeyooq9Nyv7BBt82U1BnED77DQJ0e5FQkbLugCfF+7QOa5D4Umz5RpppFK7XqW3SSWvQBtdFK9gQKiL0kHWc+zvAFwuVc6pZRE0PyXIXZTOQQmo6PzG+QhEOPoLTKmqnm6n9AIMQVhOWiABkJJP3Cdv8Y8MHOXm2EHkdJg2BMR6x7tMansLUVF38Ln8af7XIBBgs45UdiK4Xz1I4jYJPxIn88uBoKX0TtS7FglBBCjyktRZaOBUEuhiD9k7NtPVH+5WRuRPRxBWWs4rZC/sHz88VMduU2nTe0ugSRzIWOHiz5F9aulm1ixQV9HRmtV1N2SixZnBXLSm3KgURJbu1NIYPV2jtevTJgpP1dmt/pcy+UEBOvjdH+pKkJK7tzhvAW/2Gy+iZSgVwI+YkYwTzLdwpV+wxvg1n+rl0wCXLWwu+OWmsqbeTdS7t/ddBy9AsN6NzQgW1/LQlHbt1ZF/MY0aXicRsSxlSOZFrcVuTcjaYxoSykW9SXfjadPvXQ2VMlFhFDY+3uT3A/KYaSnO5/7H6TDdFUCYRAvy/izD9py7AwTF9xseQBBbRZNuXhjIndRwu/6xIJuinyzc80fLni9iDC8q6t9/RFRgm8OysSxpWM9AyH6MbN1Vt8cP6HBokc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(56012099006)(261021135927099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGxJQjhZem16bTVTUGxLWUFla29JZHMxR0d5eGdIdWNkREo1NnRRdlphMzVq?=
 =?utf-8?B?bDBNeE1VdFZyWjd6S2M1Z016QnRoRkxLTExsVFZjcmNyUVRiZ1VQSUIzV2R3?=
 =?utf-8?B?dDdmNTg2NzFVRWZ0KzBoRWd5NzNheHRTcHI2RUZBRyt4cmlqRHdzWGJKaUVN?=
 =?utf-8?B?akdTdVhwMkI2aFl3dTY3dkxudTdlZTVQeU8zZXpNbXFXOVovZ0g2VnRydzRo?=
 =?utf-8?B?djBwdHRBQnZqRGhGV1grcTVDVHhZZktqRE9vSCs2OU1nQVNTVVZydm1RZHRp?=
 =?utf-8?B?RExybU1lMUMyREJlUFJPR0xZelFVZ0xoUmtDRTlYZG9jaXVUZkVXOUZGMzFW?=
 =?utf-8?B?bGM2QVRVRW1VQ01ZL1UyMzBaZVN6M1pWR1h6NVFIZ3RrdnJiOFRoQWlBVVJB?=
 =?utf-8?B?ZUR3ZmdDOU5hcnc5Z3RMQjNWbjB3Wll4L0hnUTREaW1pdnNkRlJXRlUxUVBU?=
 =?utf-8?B?MGRvNkFrbEdxZFJRUnhwZEhFeUU3WFNOSUltamEvTTdoMG9vU3lIbENKNVN2?=
 =?utf-8?B?Qk05OHNPUnF2c085U08xRXBzdExveURrWjVkUjhOTnJvWEZHbXhwTmJLMlZs?=
 =?utf-8?B?RDAwZnFlOVBpTllGWWZCa0M1Zmd2S1lPb200V2gvdVZ6QnplZ2xpdTNETWsr?=
 =?utf-8?B?UkEwR3JmYllLd1lpL0Z0bDlXcGY4OUVIT1F6ZUFNWFlWbGNtNzNLY2o5MklD?=
 =?utf-8?B?Z2JsTDZXNmdrT0pyUHd5YW0wakNLZlArRmNrZWhUMWtzRkJ4Q1REbnVkM29i?=
 =?utf-8?B?YmN5cUtLaXBwcFdFbG5XYngxUXlGcDI5TnF1NzllN3FsS1FCVVVQU1FCL2JD?=
 =?utf-8?B?WEdYcDVtczI0ak43dUVnbnkraXhpZmZPYzVHSnRHZjl5NUlIMW1VK3QxS0hZ?=
 =?utf-8?B?YkltWDhqTXNmeDRjWDhrcERGd0xtVjFDTkxUU0xzS1JLSUg2Rm5jMW9yb2NY?=
 =?utf-8?B?ZDd6ZGVIbjA5T2JxSEdPVWpZWDhVei9RY1BrelcxbGtEbG54Z2hqYXBpbGZW?=
 =?utf-8?B?VFJhUHkyZDFhTUkxQlhRQndXZlkyOVdiTHllNWFYQllUR0JDN24vRDVZeURO?=
 =?utf-8?B?Zk93SlJLQ0doeXVIT3Y0YlZqTFpkbGI3UGwwQ3Y5ZUJZbU9JTnNJMDRoRldt?=
 =?utf-8?B?RmpESFliVGZwQWNPSU9HazFyNzdlc3hqWVNyTzFsaEJmTmo3RXZNRWwyWFZq?=
 =?utf-8?B?c0Vjd1dGc2g1N1FYMlJacStMTzNGT2syek56TVcxbkFUQ25ZWkl3N09laDBC?=
 =?utf-8?B?RzIvQ0VERDFmLzFZcXR5UkE5a2I5N2c1OTVTNHdaY2NyeVdVSkFrMkR6V1F0?=
 =?utf-8?B?QWNDay9jdEY3QjhDUW5ZeVgrdlFPeVhMd3YxZnFhbDY0UlJkY3JFTkMxd0xa?=
 =?utf-8?B?b21RNkYwRlA4SVpGaDlkemFlKzVYV0dRbGFZTFlzdHgvSUI1Nng1akVmalIr?=
 =?utf-8?B?RklZdzRkc3dOZmJHaERuZ2l5OWhtMGVlQU9TSGVOTG9mdEx4Vkl1cW40cnRk?=
 =?utf-8?B?cm5JTmwzQjFhb1UwMGFqc2FkdTlSWE1LY0VCN3VkanlNQWxaOG5UMG00TWZJ?=
 =?utf-8?B?NVlOMUZDaHZuNUpNTDNFTVNWVzNzMlBmeEhtK2M5QlMxVlFlcmxHV2xvYXZ0?=
 =?utf-8?B?b213QS82VE9TUi9LOCtaajArZkxIMC9iZUh1N0lGZHNyVWxUTkc4NDNaZTRS?=
 =?utf-8?B?TUdxSzR5bHpYejZacnZYSytHQloyV2ZGdlFNQUlmcXhycWFqNCt2VzdkQVls?=
 =?utf-8?B?c3Vta2pCZW4vaHFPZXkzSlovRU1SNTYyTE13bGdibjdjNXRyK2Y2ZjJadzUx?=
 =?utf-8?B?WTkzeTBrUC9VRDJ4bnpiRjdBeHBiaFkxb2hUUXkrampNOU5xaFBkUFhNaTZ3?=
 =?utf-8?B?M2JtUVRjMmhpOXFlcVM3OTl1d0tkaGV5ZFB4Szl0UUZuK1BIOXZwSnZQY2ox?=
 =?utf-8?B?TVU1SXdnOWx4YjhYTTZVYmd4YTFzZWVOU0hxUkhpZ05UNGFhYkR4WlpCeUtm?=
 =?utf-8?B?RnI5R04reXJQODNaKzl4SlZONzVjUnlJaWI1T1JxOFhqNDB1VDAyemZCMlBi?=
 =?utf-8?B?Z2hRR1VUUm1vc3A1dElBWGt3RU9GS2FmTTk2bEwxbXVMMnJ1VFAzN01sRTBB?=
 =?utf-8?B?KzUxQnppcXdIcTIvNWR3Vm1DL2U4dm5XN2k2Y1BJamFHMHRQbGkwUDdZdmk4?=
 =?utf-8?B?WkIyMjVOSTN1dmdNTVVhQ09aMDBlTkFxM29lZFBtQXhoSDdPOVBPVVRFWkRy?=
 =?utf-8?B?YU9GK0U2T0tEK1BsTWZDMDFUL3pSWXU5azBmeHlhV2xzRTFnSVdqUzdsSEJr?=
 =?utf-8?B?Z2pSYUF4aHVaanZ5QWo5QzViTmROQm0xd0pUMENlRDVuYmxDaWRHQ1ZXeEJ1?=
 =?utf-8?Q?WPMKEAemFNqan8H8DBfp+1aXNlgMTBBdUYzA9gSTN1gKw?=
X-MS-Exchange-AntiSpam-MessageData-1: f/RMFPmdqpobJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aa2697-944b-4a38-c647-08df3cb457d6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:57.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/7NL5kXAGlKHXgVMqocNdW3Qq50KuD2kJeXS6xjmvjmnHeqAisXgPm57xeY1jntEWuPeSfp6n3ufBcfcvE6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

Each block of a falcon DMA transfer is addressed by the start offset of
the transfer plus the block's position. The two additions were plain, so
a source or destination offset near the top of the 32-bit range would
have wrapped or panicked rather than failing the transfer.

Add the two with checked arithmetic and fail the transfer with EOVERFLOW
when a sum does not fit.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: split out of the DMA helper patch of v3.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b63265abd263..da860caac20b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -626,10 +626,11 @@ fn dma_wr(
             // Perform a transfer of size `DMA_LEN`.
             self.pfalcon.write_reg(
                 regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
-                    .try_with_offs(load_offsets.dst_start + pos)?,
+                    .try_with_offs(load_offsets.dst_start.checked_add(pos).ok_or(EOVERFLOW)?)?,
             );
             self.pfalcon.write_reg(
-                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(fb_offset + pos),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                    .with_offs(fb_offset.checked_add(pos).ok_or(EOVERFLOW)?),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

