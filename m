Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628046;
	b=AxQ0HjV1Rwznu/CbkrAfA4EnUrDf06XMdLN3+nUKMEjKqjUnJQJEbeby8OIOlHnwUmig
	 gztcdaM49jGWQETkGZb/jt3+mkNc/ynov+e0UfAeGcHwpPsPf73WaXL3KjR96Omwl63D0
	 U9OiQFKUcrWxlSyOIA3aJS33Pd/fLdeEWuXIsvwhGew21UbPWDYnTeyRAMvxqDLoxf81y
	 Iylk0PTShtduwEczZJUhjvIgwMiiPBrfc4xHgtRxHQb5tcUNWZGk4s5RHRXDmn28ySKkL
	 b4Km0hCXuVh45fXOVPNCsiWoxgM8zHOWq7EpLZDbj6Yy8Jqe10M6zeSPnHzDHpVjjMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628046;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Content-Transfer-Encoding:References:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=mRDn1cL/1SYCyQ55RQwTiHSmxsf05P1xQ/wT4Pde5p8=;
	b=DNmUKlWC22MpKx8wC2KFFgkHmzMzwsUkGpGxyCqLiyOjaj0F6eWYEZcULK1QEei8l7Sh
	 nVQztf0sUQz4bikznjrpU1r5i/1fDETA0oI1uj7Ia+2yUCIn4sUDVlYEd8uNnqC85Jcph
	 LKX1Gael4m9St4/aZ/+j/QLdKJSL6gWXQT3ql/byjeTF2PDwItTucrw9MnSs3Gfwkij2U
	 C+P0gvk915nMUIvXoVgB/kcFnHwitprKi808xdPyBPqxkU6DH9ekvNTi4dl6rn/7wrUe7
	 MZs9iXZaCC73k0Wz03QrqZewitZq6BzKvh/GdAGoxsybsewdZVmOiLshBx/IJPmYQxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sLPHcjvt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.51
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408760A5BE1
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 14:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B408760A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sLPHcjvt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gasIeBKt98JsJpW9XagGGA7ViVgUXOQiWCZzhCMvfIFc6UsU/e/NEWSIQyrqQ/y5Gcx8mbDZeIhpRFfIEsbezWDuFRfBJlUgzPH2wcI7iVrpinQgEZ26O7IK3zp3Ln0VMcrHkYPJOQiQCPEZYuLi+ENtayDLhqKQFS0vTwjb6C9tqQTt9ZugfeXODUYHeZhkwTre+GleDjP597Tg7yXTkvKy2BjJqd12hRIN0FQhrMzNm/DFW5h5LvAZDvx+6bTWnspYUWbLg5pYtGCkdTt1XhSr94yVQKgC0m0OmJ4dVe5itIw2Zwbk19B7uUDNW6oKS9/f8bDMihQ4Q3Zd/DSFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRDn1cL/1SYCyQ55RQwTiHSmxsf05P1xQ/wT4Pde5p8=;
 b=zFKVMU8rUB6RCG/KIr2bz79afd5Ck99q9ecRPu536qTlZIpdSOOSfs9pjHrtIja3J9XRxsu1QVNHrj+cO5zl7fnhR/VKKeyYGLHeOPab2jGPswJYuckMXQqZzVp2XTjFdFmliHMp8QaHHvbmohI8BAf6Do+5ONzJYm0db7BfLWps7mCKbIy77Kr0Q6ICdh5FhCBsFdl73IZvdieY8zpiCMo1cQi/QP2kWK3oKr0setd5J+GXdT7KLlcM7q0/mkS0T7Sb0exWpugonDs8/pEuA//mJXZbKUydV2nT5/oSFRVEUPzuVoy2M0sI0JEpYZfMWosKFlNQMSm7vSn/aldyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRDn1cL/1SYCyQ55RQwTiHSmxsf05P1xQ/wT4Pde5p8=;
 b=sLPHcjvtijrqMxdXsOdN4UKGH2TU/fRvgDAD8z5ql8jz7Sou++UgyiUGWMeLulbzykMGJsjtXFc6sAtXz92hkcwn/Gw5hsvfLJnGgzDpkcYiY/37GLVA9OfYs0aG7joFgdyEttTkcEMWVI9i33+mdBaXBaZrllK3IQ9MWT1t7Mh+rijnFWnZaC5HQhO2RuXC36KILhbUiQkXHPVQ3um7YUK/1Atdi8Id6XDgyJAMUNhendtLOlP18S5TJ/yV4XhrSRwOwd20IkZAprNA1auDvxZeMLLzOGYn01eKdw+CBmuZ0F+DDgcA+TJI07ZTOWLrzgT8lP8IzjsGcCZohgpYfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:00:40 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:00:39 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 23:00:36 +0900
Message-Id: <DMKS2OXJWZS7.QBBEUYPIPMQP@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: cmdq: reduce sleep delta in
 wait_for_msg
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
Content-Transfer-Encoding: quoted-printable
References: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
In-Reply-To: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae0af86-a282-4a40-8479-08df38e9ad36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|3023799007|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261022115727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	LByNPpjDJZTHCNi1Yk6GgRJdcDbfRxDBQJ8EBYYMBTN6J/Xf5MFzHcgxJ7M9mvelwmSFaqhvSjZNig0E6xuGSn8jhe8rU1GFJkcnibcZe4q2pimkZSQ2GAouYa9i6H1XfHKmJWLDXww+ZZ17kGMnddlWfK/HXN6kiUVowbp15/B8YGTwNXo9nEMomsiGNmutAh7Syv5hQChNlH1SZPym9x7JwaYwsQ/p5rujwz34OjVCVLKINM2mrqo3T/wyyRV9n9YNN4maeQYm5e1os2mhcsOn7tWNPvY4cp4/DA5QrWAFNIeq899DCJXGZ/W1xOjMBJ897DCcqhIlRxk5KLQW0/bVfOuLu3Z4+1Guw+u/3oXmuY3qsqkGuUgtWjNcq4jJc5qXvaFTc0ZFwlARyAcNQTMDW+1dPL2VcyON3rVuOitcT6CgTjCW0aGxeZLfYGhJtAm5ImZ8p0OLAVI6IBWXovDN/03NsmNSNQnBVyycQawwz2TMGnn9WhA7sl3IxulddoQEEl+PiQJ3p/e1gQdwYPzOTMw66Eg647FgsJ4BskPePcpraRJGtF2bhyMLFDghZEX+Sgchn+2gqGMYSCVjEZZ2q4Uvv44XIpSVAegOYdPon6LvPdg6fGVaA3i65iAipxfpV+tkApnty3MeVxDEC/lDAkT4aQLL8hy8aoFJxjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022115727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WllzZnh5ajNHZEdud1BranZFbGZHcmMzbmo0TEN6VCtPTkRqUm9Oejk5bG1T?=
 =?utf-8?B?b1NlLzI3dkNOUnRiaVYwUVZaZUdGN3VZbWVIWVRIdmxWdTc2M2MyVUpqZFQ2?=
 =?utf-8?B?R1FLY2NvWVE1N01CTGZrVHVnd1hqVzNvZFJROTdhOC8wd0lCSjM1L0NlZTFy?=
 =?utf-8?B?Qkdoa2JYck5pL1JKakp6WDFHQjZlNWFLL3VyUFRnbjF6M1RheTMwRzg5UUhu?=
 =?utf-8?B?UjlWNUtBQkIzbzU3YnZPdHVjUTRBVjZMc01CQU8zTXEvRnZtQzlnSTNnd29o?=
 =?utf-8?B?dElyUU5RTzQvSDB0bWNYVTNZRWU4dTBoV3p3TDVVd0pOUU5aR2MvNkM2RGhI?=
 =?utf-8?B?N04vU0VTWVdTSEV6cCsyUkFqc29KZEpDSXRWTWgvR1VxTzFGZTJNZkdVKzhw?=
 =?utf-8?B?TVVwUlQ3RkJDY0FZMzNvbmJiZDExVFZiem1WVE51eG5rSDZHNVAwb1dhVitm?=
 =?utf-8?B?K0FtZ1FEb0VJUE1CTWRRZDVrcFk3REVldjQ3WDgrb3RQODdKS3A3Y3hVckVj?=
 =?utf-8?B?bnAyeDhSMjdUZTVFcEFqVER3TVM2dmc2WUZSYWozeXM5Y0tIeWZZS2dLRHhN?=
 =?utf-8?B?Y3JmbmROckhma05YOVczMmU4NjNlSVRKOUp3WGdUajVzdUd1dm0yanA1K3BF?=
 =?utf-8?B?VFZLMDdKOW5xeXlHZTJTMmZ5V0JKRUhLM1JZWjhWdWREVlIyR2prMDVLQ0ZY?=
 =?utf-8?B?Y210ekNHYUhIZksvMFdIOC9POHk3VVY5aGU2dzA3T2RqNi9IeEJsQUtXcUhT?=
 =?utf-8?B?eWI4VGRUYVVpcjVFakNacHhUVkx3aU5SYXBqWHRZelNmSENGdmgxU3pHY2t4?=
 =?utf-8?B?TWpONWhyYXpuYkd2QThSMllXL3JHMW5ZcWxPWk1JYWJQeENYOE9oaHVIbk1R?=
 =?utf-8?B?bzF5N3RTazd3c0dIaHFYb0cwMk1XWlI3YlNWdkRsTjIzaXljb1JSK3JTNTFZ?=
 =?utf-8?B?TktnbGZJcHl3U3RtbU96blN2NVVIY0JHZEFYTWVEeFFmeUh4YlFHQ3JqSEJY?=
 =?utf-8?B?Wkk3eDFNcTZwV3kzNjdtUitnM25ZVGVWRWpSclJoSS9ad3oreWt2aTVrUDhk?=
 =?utf-8?B?TjNWaUdPczF1Vy9Ld3NWWHZGMzZVOVBjTmlFR1lNRmxBVG5SMThaT2dLQWo0?=
 =?utf-8?B?THJLNmR0cnR0NFRxR3g0TXEvYWk4MXMvNE53bUNNa3c1Y2ExTnJVSEM0OElN?=
 =?utf-8?B?VkQ4TlBGMEdrTFNRNWRKQUF2bVFVSGRLVHc4YXJCTHdMZzZTQ3g2eE4xU3Ir?=
 =?utf-8?B?elVCeVBiczhUUkxHSWZOQUg2THRReHFXRm1PeW9tRUVKTGhOMGM1a0kxTm5X?=
 =?utf-8?B?SXZFaHZVR0JRcWdIaFFpU3d1ZWxha21WZzNwamI5V3RvNDg0SlFkSkE3aHpE?=
 =?utf-8?B?RGEwUGhHaXhnSXBjT1RTRU40OUJ1ZS9TUmJpQ3R1ZHI2bEZtbnlhRXIvdU9Y?=
 =?utf-8?B?UzFRZ2d4R2N5Q1pLLzVtK1VKTldKSi9VRmRzUUxGMTZKM0ZReENROXdJZ2ZB?=
 =?utf-8?B?a3VrRU4rVGlnekNuQ2ROQUxTS1FDOGV1UWVLdVFETWtJNmhCNTUzQVo2MVNK?=
 =?utf-8?B?dCs4cXF0KzFmZnBGSGFzdWMzNEVFcWdRc2Z4WHNENFJuM09rMi9relhQRGpZ?=
 =?utf-8?B?eExYVnp3NzBwa0pTZE5rVXNiTmF4Vktjd05aZXYrdFc0NFphY3JCK2NwM1Fm?=
 =?utf-8?B?bnBwNlRaL0tlUlM0SjJQZ05DaDR0UEFIUDREdURJNkZKWHA5VzIrVElTZFJE?=
 =?utf-8?B?WXJYY2t1Unh3OGVDNmlxYlRBL29QWjBUemVvT0s3a2NkN3E5cXJoQnEyTStG?=
 =?utf-8?B?YnMrQWVyZUNBUzNuZ2R6WUVJcGo2YXAxRDNVM1YzbEQ4c1JyOTlZaTdXeDFH?=
 =?utf-8?B?Z09aZnF4QkM3eFArWXVUNm9hV3VDWCtRd3AxNEZQQldXei9ZVXN1bXhTdTZU?=
 =?utf-8?B?NzF1MmZFMmROdmRrbEZDSjd3NjFoY0RBbVZlR1BuUWZ5bm9MaFZLbTJyRUdD?=
 =?utf-8?B?TUNrbGJQV25FWExDaTBwaG1wUkpGemN6Rk13RWl0WlRwMzJwUjhvOVVlUmVP?=
 =?utf-8?B?OExEYmxDYnVwekFlblh4M3Z2UUxIYnJkcWVYVERzSHRma3kwSFZ3R2daOUZr?=
 =?utf-8?B?c2pNQXExbTliTnNXM09LZWUyODBTL3FpWHZidHloNnV4N2FXemFZeDRBUjZK?=
 =?utf-8?B?dkZFWFRMWXA1NTNGMGtxb01hVFJCSG5aTHQrRkNaZ0RLL0cyWGxVNVh1SmxK?=
 =?utf-8?B?RUhNUHYxRmRHdndMcHpsRlREd0czb0xZL0YzNUFnRUtxZy9pc090eEZVRHlZ?=
 =?utf-8?B?eldXZGRTdHM2MkpuNVQ0NDNINmhuUHNlcEtJWmN2clNoRVVuRHJtdldSWjFu?=
 =?utf-8?Q?9hRXUG4BqZFOeGj+WSEWeaXcKPkJOkA8XUV632E9+r1Cu?=
X-MS-Exchange-AntiSpam-MessageData-1: 7q4blQ16el0JPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae0af86-a282-4a40-8479-08df38e9ad36
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:00:39.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4YIUYYgsBntulCD7uxWAG1X+JxxuiSgE6le083HIqHQPhkwGJO3BGLr3GXbsEn8EAMCcvDazc+YQienZuDtCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195

On Mon Nov 2, 2026 at 9:30 PM JST, Alexandre Courbot wrote:
> If a message is not immediately available on the queue, `wait_for_msg`
> sleeps for 1 millisecond before checking again. This is 3 orders of
> magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
> (which does not sleep at all and busy-polls) and is way too much, as GSP
> commands are expected to be processed much faster than that.
>
> Reduce the sleep time to 1 microsecond. This effectively makes `fsleep`
> busy-loop with a call to `cpu_relax` afterwards, keeping latency to a
> minimum.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Pushed to drm-rust-next, thanks!
