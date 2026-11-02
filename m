Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793623145;
	b=vPNr9N96IrvharS9D2ipVsLa6k28S5CXw3f7hLu5dbj08sUKAKqaNXrS4hK+IbliVoAG
	 WsKDaKc+01S4iiMWXWepj0DfzqNeOJ/XKg9zwp8tKTDDtHvQDm2/lp1oRItDx/ChIBZZ5
	 LhifCNzoRBkKtr0fIE+BetmVfb7NI+OwQf1wytQeyr9X3hXxvuhRcIXvH4sbjIKc/uCQD
	 alOuBXbwwz4Cgkr7bO6y8clzeSbdscZ9TcOR0F0QVX6TDxgoa3ju93X1U/TNIu/yg3TYx
	 wtq/L2XlFOosYGuwDT6wp2t97XsDiN+YBGi76mjiepMcUy73Loc/ickjP1oMzFw1r2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623145;
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
	bh=MqBlzWYoKbUNlLj9uNNQ44XkoW/8HeV9Hzrxpro8hwI=;
	b=RvL9eXyUDw4leznnb3rTtMZiwiP+w9fCr6v95CcMv5L97/7yje3JUp88gbS1rxZ8gc72
	 j8IxIkXY0bjtAyWFbcXMqtkRvAnCmcW51JKo+c5epTDwgz1ag+AhFMqOjpy0L8R3e5h0X
	 6XXOCqX1mmDWDkuIr686DjGgBa2qGnPHDvUS8K423p7fFa/8zukg5dC460WnrnCaygkiL
	 rOZB/BDpEv6dC2ERfur0JKJkEZ+e+5CUcgw6zboqMl+o10Tk1fsKfc3nhNgTMSnaAqG69
	 rexhsWe7Wh6a2GpvVYWfKAb0cOy13m/6VGDIQQYiWsFMsuNx8nzBQaeldHjCKYSoILA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dulWF2K5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE1E606A331
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE1E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dulWF2K5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHuOu7l4tD+2Ylhj6v6unMnqBLtI8gUz3MxDa5Rkvgp5oicyAzub3Y5rUgV8IZJjX7fHDumu6UF4nxcTKIoYfFxKYRccxx3PdLVtoHf+/MYmhogrOl2bonKy5qtbI8B/ztrMIMFIzUx8Vf+mebSqtB8CvuwQjqPLs6Q36EPcWcB24RXuHAbRU0uIW2Gg2F4qb/hxASFinWVcQDuIYuz+jBkX0EHzeShXIQKfxYfgEhh6KQ6p+kl/YUAccdqYhhgHD3dXkHMlOQ3woiL20ejBr9VEYTTmsKqAmg9QB44kKr5gLBFaLrICvH5XoOcyXjehS5Dvo6ZWyrnPsvfuGDoQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqBlzWYoKbUNlLj9uNNQ44XkoW/8HeV9Hzrxpro8hwI=;
 b=Md6FU3uOYkIQN78rfUFokxu35lTqyzVfrFtllQOEB2ARnESdAn/9Q80rwLaLK4FynCbKHwrECHLxWZRjhDdpuSGKW94hcddNr+WSeljrR+l1+9csuLQ/P+bz9WmnVOaoBheowFmCXq3vJeV2Lxz6a9kclX6yQFIHb0MTM2wha2FPKeUFQVa9VvQka48+wWVwLoGDcQiu9mLzlyYJtkiY+RCLFx0lkXoAq8CLDgpFA//O3BV606AGIVdyfYKkg2A5EVQCH1yq5D/cHOfWeW1iyHt/JnkZhUjwkB+1oweLV3rAmnS8boYElfjkdZMTiyow2nWrO11YrXsPRJ0JDhq3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqBlzWYoKbUNlLj9uNNQ44XkoW/8HeV9Hzrxpro8hwI=;
 b=dulWF2K5vp5X7MTUq/8wXf9fY2Pkhqmd1BTH+bpLRQVTjafp6cWPTpO09hI21HJmYWO4/YuiPaKzDSmmrzMawXH0/r8RHNFRLX/sxMGE25Hb4Gu0PQWMqF2AQBWk/eFxywwr6kLn6P+ljNsSZVpP4T/OiY0800w62I6BWVEGmUoBmge6LUa5nv76JHCcooGnviTmb6nwY3ipIqmZ12g5STB78MksJBlrE2ubnLKyvzV/kriQff8V4BOA4XQAdfA+ZnyiIUdjm8ugd+/8xgJlmJv6V3q2VqJQAXzyR5cATpcZfrRVn89+KVL+WmlcvUbBmsBJ4yiT/4zm2LNVO2T4WA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS6PR12MB797799.namprd12.prod.outlook.com (2603:10b6:8:4f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:39:00 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:39:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 21:38:54 +0900
Message-Id: <DMKQC4Q6U4RM.21P0QP6K5ORUQ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: cmdq: reduce sleep delta in
 wait_for_msg
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
In-Reply-To: <20261102-cmdq_wait_msg_timeout-v2-1-50bc4534b659@nvidia.com>
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS6PR12MB797799:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc22a45-c1b9-4c7a-f500-08df38de453c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|11063799006|56012099006|261009223027099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261022115727099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hfibdSkDKC8yQqeieYsfN6OF189KcyJTozVqjVQAn4b84vQh5AtZU+OAiJRoLpqo92m1M7XPH3t8THmKQaZmhVHuYUhUV72a60Rphpz1cuTMhh3per/UPP2D/kQIQ0O5kMWtWBMLoedu9GmjPtSVO+Gdj4tETrH0KW3t8aAkPT1U5X9TxfIn70PjBiDiePo+IpbQ0zW49IaoaYH5jHlaL9C72DrMiYdMSnp0YhKmB+vVusEY30ALBS8sNcsPBGbemTFFFKLqPMtRvGUlyVXAEaVuQ/b2PwvLbF/qHRZkw2OIxFsy82SqECVFjhB8GygJnfJV+DbK+V1/xf3o8LF74R0I11j6vW7uvwZ2PJ57TKEdQmiKAhnr6lqHA6ByFxrdCdvBSyLPOyDUe92Ifqd8KxZWNkVQihE+3fY++2vhwsZm7zHu3aZQ05gPfNfm5A/hsK+/Ig+qggw6Wt5qB5d9CPqAfZ25q+hxDqUrjGhn+/wHTZcM0pZifCtN1XUCQZ3ZMVisbBnoKIOikUuh7/3KXvyh9mVFKDtjnZClQUKArTenMvcdiAy3xVVOaZW0r1FEb9fmzDg2/r/5hxaGUQCyp4Vsm4tpa0zeXdGEhXNz/EQiKItNOsSXqfqyauRQld3k4CWgohrfSqqscC2edS6HEBNZsXh9cQR9d6dmWPerlxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0Q5UjhibGxHQ2FTdjMzR3VjTEtTYmlZUnh5NldXVmpmdFVQK3paalN1MmpR?=
 =?utf-8?B?aTF3dS9qVzlvOVNVT1VHanFiZlhocTR3N0FRZUdzRGoweHMrVlBIcERxVUVl?=
 =?utf-8?B?SFJVMTVYNHU0dEVjYWN3enAxb0tKOVQyZnJoVEJJUmRNSTRsbVNNbTJrSmJF?=
 =?utf-8?B?VjdiTzhoY0pva2RvQk42ZDhvSDVNc1hVOE5YSlFuSXJXNWt3NnZ2VTQ4WDRX?=
 =?utf-8?B?Z0E0TnZKUkQ0a01SSm1EbHA4WXgvVitnUnBnbDdaL2p4dE9DSXNMVG9DaXNT?=
 =?utf-8?B?ZHptRFF0L1loQXh4UHFURjE0NzkrZWxKWFEreGU2eFd6RlhVZjgyMzR4ZjB6?=
 =?utf-8?B?a0J3WVJzL2ZBT1J2bTVyNm9YNDU4MzN3N3pmQjAxWTJLZHB5VDV3akNIa1ZN?=
 =?utf-8?B?ZERqWW5WYnh4WE1oR3R1NWFHUFFwOVdobUdyemhDaVByMnRLMnRrUWVwbXo4?=
 =?utf-8?B?N2RpeUEzTnBRSk1nN0oydVYzcitKRlVPdkNMbEFpc3UvL2xIdHdyNjlRdkdQ?=
 =?utf-8?B?SjRUemxiOUU3d1pkdDlGRmtqVVFVL2xVUEw1a1BXNUdpQ0VabHhFakZpcEtH?=
 =?utf-8?B?ZFVDMDRXR29Uazhkc2lPTXFhZG9DVWo3bk1wdEpSZkFNeUtRSlhYb01ucWRM?=
 =?utf-8?B?Qm5VOVMzODlza0x2VUVrU3dsaE1Bem9VWWdoMnJKRllhOUR5MFVYNStsNVQ3?=
 =?utf-8?B?OHI3NHY5Qjg1N1hYMlBEWXVBYklFVEsxRVJ0SEt0WUIxU0JIV0FxalJkeXhD?=
 =?utf-8?B?VUVOd3ZGdytKWVZNNkFjUmliWDZjY01YMlp2cy9YeE9HTlRrMFpoQjZIb1VD?=
 =?utf-8?B?YzB2TEJQSkE4U2xMU3JNUzhaUmhhNU9vcXQ1UCtWbnRhSkwvT2liRi9iaitH?=
 =?utf-8?B?c3l4YVVRcTltWDJLVzE2a24xOXZleUhtU2lyNStxUnhHYTI5cFpzOUhIRXJG?=
 =?utf-8?B?b29odGp2ajlkZVcyZzBhR3ZtVFBRQUdaeWVTZ2RNNFBMWXJjZlJpRi9WWENo?=
 =?utf-8?B?L2VOVTlrS3h5NklsNDhJT1FkSytRVytDY3VJRk5ycWN6NnJMTkJZZ0hiUFRk?=
 =?utf-8?B?RDRrcVZqb2xqV1dPS3NzbGlmMnRIVC8yc2FXUGU4UWRXZlE1ems5eDBDeS96?=
 =?utf-8?B?TWVIa2RKeVhXSGEvNmx3RXFVTnQ3SGx3eVM5ak5WN2Zid3dxK2c1d2dCN0tl?=
 =?utf-8?B?NGVtSGFlSUtwV2M0VDg4NXZyU0MrVzFIbmF1MW1oNnFKK0h0eEVSUUJiV2hF?=
 =?utf-8?B?WWVWN2cxQkZHRGpIekY5T0VlOTE3RytLOG9SMk11bTRtUlV3a3NHNy9Dakt5?=
 =?utf-8?B?Q2tGellVaVBWeXZVWHZoOG51aEdvM2dVUXZlRTA1b2RXZ3psRW5ubVk5bTN1?=
 =?utf-8?B?SUVMTDFBWnlBL3Q0SlFvTjBUbndxWm9nTy9mWGFNcERoZnpDSGlidDVIZHFt?=
 =?utf-8?B?dlRadXEvTHhYbC92Z0V4K0p2SGhJUGtuL3Z6TUROSzFDVWh1N1MzWXBkUy80?=
 =?utf-8?B?b2FPMitxRm10RG1jdy9wZUk0d0VBM0Y1aE56djNCZ0wxQkhZUDg4aHYzZkQw?=
 =?utf-8?B?ZEFUa1FQVHZFY2ZTT3prdUliTmkxNUYwT2VYT1Y0c0hjeDlINXgvQXMrVE84?=
 =?utf-8?B?VmtZM2VqSHZKcmI0d1FUL2hBY0NIYWxWeW5QSXBWb3BWWmc0UGtYZmY0VHpW?=
 =?utf-8?B?cWdVamppekdBbFdTdXo0M3ZDQm1CcDNVcTg3amwybi8yYTk1M1NhNk1DMU4y?=
 =?utf-8?B?NVVlTFJXb3MrZFFvRytPeEI0ZFl1anFxaFVOWllQMGVmZnJxMG1QL21sNEo1?=
 =?utf-8?B?eHlMR0tMWnN6akZ6Z0NVeW5JOVRWd2J4bWd4SWttdXFBWE9PaEVGTDRBLzgx?=
 =?utf-8?B?RUMrRzY1MnRyNkFyQndqVFZxcTV6TXRaaXkySmFzUnZLZHNJb3NKRHJDQTZj?=
 =?utf-8?B?azIyaXVRalJHbGsvSGdvR1RObi83Znd2WHlOZnZMM2s1dUpMRk5MTVpBL2w3?=
 =?utf-8?B?NWtjYmtRNXdabzJMQ0RiZy9JY2hoN1NvWFlvOWRBN3FuOXhyVFAra0V1cDgz?=
 =?utf-8?B?dERDR3djWnlmczFyTlI2enNTMkxvUXNmL1JHbThRcGJTNzRTbjVnb3U2MjRK?=
 =?utf-8?B?ZHgzbkRLbEhmSlRrU2JmeEo3Wm1JS1BMbkx4N2wydzRYb2Zjbmc5Y28vbGk1?=
 =?utf-8?B?NGo2ZHViNitGdDJVMlE2MUpWOThNRnYrTEtSUEY2UERrWTFmYUxDQTZNQmY2?=
 =?utf-8?B?WEkvT3haTm1zRjVJTjBNT0hRejZWTXRtU0VnSzUyQkYwRmpLMFBQWFc3MkY5?=
 =?utf-8?B?VXZOYStEVVZ6ZW9NdC9TYU1VQnVNRHdNWHg0SXlScURVNU0yQjlPdjh1SVNx?=
 =?utf-8?Q?85YC50C5zbCYCYp5onF7hYsHkqIioEtFcTGkuwORlDdos?=
X-MS-Exchange-AntiSpam-MessageData-1: J0NWm9s+kVZ81A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc22a45-c1b9-4c7a-f500-08df38de453c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:39:00.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMbbGJYBjg5zaefLmLUQTQyKkWCpZgg65t4VG7Aq+lam9ELn6lIV/D66nsWJPmiDthoI92a3KyPb21HAuVbMYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB797799

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
> ---
> Changes in v2:
> - Wait for 1 microsecond. (Eliot)
> - Link to v1: https://patch.msgid.link/20261030-cmdq_wait_msg_timeout-v1-=
1-a1e628d2732c@nvidia.com
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
