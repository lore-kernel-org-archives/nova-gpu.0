Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202721;
	b=Wn2dcteXgEFxmwGtGlId6KGalcrL0JhxYCMrCbLrQ3jVFhXRzlT6ly46wPCAYwIavnpo
	 BJQMRgfrp3HR133DWlcwu0jQz9GmpWqsF//kujS9DBr8k7iy3DPPynYu9GN7jCQFildSv
	 Ioz1gcRO1j1226TfVGKoe/fb100k7kaIundJR7shpdphRmOBrj5SCt6K6fcsJrQOUCjqq
	 5ubG9la39a15iwyu60j2v3BLcT3KlPBizlpHL1/y/BhNslrL4XCEKnZAgDGCkCadLW5I4
	 xK5N7NQJDRiM7kXZZVuPck0U4zJRwOSrxm73md0arqDXcOzyw0kNNRPZ9JxOM0KJGDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202721;
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
	bh=wdtQG0rH1cD8twqkSr0Vk75+veLJPaiOI+gm5UKZ87U=;
	b=av3y5xfXvLYjJ8KDwx6MD3W1WytSPCZXEwErm87OEJKIdWaX94JWyzhXncvRCJvxgEA0
	 Y+AFXtDq76XblWFS/AY7zBkRHiS5TulYlgEy62BpR81IwgHs7qsYb4oRYCM+TKc2jv3jr
	 Lifv3RY30zAkAQfZsYY1jBcN8om5e3ucP4AprqE7synWtC6h4fRnMs56PXmRJEX6/Zj2B
	 TcljXfaQtYDKY4ROJwpmWVJtD9QCVUTFCCXK7FH49aGk/ij05Evg56UK66gPGyC9UPwiz
	 nmDsn5u3c4caPggIUpw4Ho2z+VMPjSBTrkvY/PIfir/6LSKVTCMVTYRJjggee7Ypg2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="J78/pBdV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.67
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8C606A31C
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 05:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J78/pBdV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phvHIlU7zf1ANvpAkETCecr2uU8HKlGwcxB2FZFUHQ2kO/SarVzVgwVtYXdh2BLD0WjisZi2gzcBeUiyLYuHWdYpBwKP4cHWmaVtAHhOwPv/Vn/km66FC4EvM+pag6zotbX2rzhRgPuzPc9BzX+AB/eu72T7P2D9TST4oaNbK487r6k9otOZvogXSROsg2SIErccNwU0xgSreDkwa21U35RoFjOoEPrsf+hLGCrGIdY1WsxzwAxuuERXJUyctACM7GKBDN4kfkJvf8bcszQWQd53FBnFxiR2aMozZSw3iAeWE3Jq/YFbCCYVs9g5T++mW6wtbnNhwJCBjo3frCe0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdtQG0rH1cD8twqkSr0Vk75+veLJPaiOI+gm5UKZ87U=;
 b=lHvIUZ4ikkjvrS92iVapL5N1NrgPISecngHfEa7yf+OhlaXzg6CKzqMSqXuA8e2bDYhzkfttoBZ0iYwaPtVd5BAbrSZB70uyMN2H6VQtrABaGS7zkOozQlUM4U8nuUCAUCXNbevL/8e5zTQo//d/AkAJwvx077GhqoF5tBsVxCFUlK9eT2HrAHYAc7XVRex2C2+qT1EQqLTwoSictved6xYa2ZbfZZMOz0Y/fPJWpjpOUXHlwrLuRQbK3+vb+8lOjJuNvqUli3tyFTn7oD7AhkSuaLNvIeqDkbhTgSWQmZsMOkbQIjo5TgkTcwZxyFRt+PQpZV7Vj847NUBjNO90tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdtQG0rH1cD8twqkSr0Vk75+veLJPaiOI+gm5UKZ87U=;
 b=J78/pBdVVrUxd2BNUqHMkp8f6tc0lHGMhCkBqH9hwVQiwa17Vm9X8J+jEH0ZlrxkmOXXvZlfOfOQ272/6ChEmA2hPMxcuwzpEXbOTRK1SUmgm5V7VoeNRBRB1FR1WzRgzAher36KBalhWwaU3TkErDT1aJ6LeTAc9UFGeKbQ7KWuCPjFa7GEEBAynAz42c/oQpOIG2GhZHnGPZcP3aZiYq+akH4cdsObtIZn59osnjmhe8PFkIcZV3URLTeNORcrCNJ5yiPpEQCXTYtH+Sg0zzOufCa+eGLM47SfnJZsXJ1AZnY8Pmx7lNprMMUdQ48nS0OycMPfZ/UR/ebhciOmoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:36:29 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:36:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:36:26 +0900
Message-Id: <DMQFQH7J9JW7.15D95LXV1PZ7E@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/12] gpu: nova-core: falcon: introduce and use
 with_fbif_transcfg
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-7-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-7-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d156c-6a93-4acb-2962-08df3e236791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+6Tf6Xv2mqmvyLqhufnnDAgWI5P1Up7wjqrJh5ZraMGfiC+64jA4ORsNKiUfmCKLmJyJKl+5ETP0ge48/HfnOe4guvITp7AexVn7zBLLeHMTaApER/4XwC1H4Q8tW6mMdoVDhe/UpoH40hAFNvivTNntUduB2rDGWStnvgbhRMCSqMvw7CIxSFxtW8sdQn5GKc9XopOoncWnSZhvwfe/ICXzp6QyelMTk+4Xt2Uuu4BLu/HPh83fbt9tbHT6tE5QjuxUBtSmjPYFTH+YorZbdnn3u4QkiWvqdueXjSz7nD0gvR5gzQCEtuFXOoD7yIbFm/rdB88PqNrD41Fh4OKKVFAX0oTWCXx9qaPEs5+xhy5ls2cLt7qsWPqq90e/hTZxw5MTF5UKRpeSYkwl/mLLfSyYOwgarQvpAD9xzQaH3x7tEsxecqIeATkQGYUL5EQzZST+UJbXgnUROOxJBPih1/t2CeVQ/M4+VkTBaLNgZprj43PVE+Yu8R7Sw2j+/JX7cfqDjOR0hc53oHQSAlvfCGPBqUNZuUQGJEjWWk1rmNhdEMMEBxAGfza5yfqz+wjw40jtUK9yBXC9IgGNS9YOMOS4UFsOQSg7o8AJkclgzEnzg0fkQYAZ1gUIksGYGP6IJApF0cKM3m6H8i2oRg1R2Dj9BgN8Hg27tXegwFY9IVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elNKTCtNUmtJbkx2eElxVnJXVktXWDhQcWMxbUdCUU5oQ0hQdEN3Y0JONUVG?=
 =?utf-8?B?bHNNVzRVRW9TWlB0bk8vNmIvdk05NGNxWDRuMExIT05QR2Y0Vnl3L0FieFAw?=
 =?utf-8?B?cnEyZnNZZjFJNmJiN1ZmdEdySkR5cGk2ZUt0THNhZ2p0UENweG1ta2czcjRz?=
 =?utf-8?B?aVh3VFVxellLY1ZSa2FBK0txaEZINTBVWkdRcklyN2xkU2J5UTlac3g5L0RD?=
 =?utf-8?B?TFdXSmxsM1dHMTJyM3EvclpYMmVKVFExT0E2ZFZjVzVZYSt5UloyOEVjSVhK?=
 =?utf-8?B?UDZkWlRSa0JQUlNySS91YzlJdFc1bStSMHpvNWN0bzhaTFltSzNIM0xYTUh6?=
 =?utf-8?B?Q0puRVRaMllVcnpxN083Rk1UZ1RPYUNia1QrUGVGbG1MNlkrVDQ5UUZ0ODlQ?=
 =?utf-8?B?SUp5YmRqQUttVllhM1ArNmFTTHBtOWh2VUxrbisxMjYwQ013b1hSc2ZyeEFs?=
 =?utf-8?B?SzNwd3JuNzd5T3IvU2RzUkdrcHVVQ1VreE15cmtON3BCbWFOdnR2M2plQ1Vl?=
 =?utf-8?B?aWt6NjErZkU1NmxCTllsazkyeU5rSnQvVFhnNmxVZ0NqOG5uTlczbVRNeHk4?=
 =?utf-8?B?clQxUExUQnVlaENHcmFhYmRRM3JPU1pHWTAyMXdlaXY2N1pSckdkdytFRW4r?=
 =?utf-8?B?NFlqOEhMeGU4bFlZS09FZXRiaUIxNzVZWDBsSmxDT3pHajRNQlE1UGR5ZlZ3?=
 =?utf-8?B?Sk5IVjBEdElzUk5RTHZueXRnMTdFVmY1ekozOXp1ajZqM2xQd1NHd2R4Nkwr?=
 =?utf-8?B?UGtiUS8wN2xLZC85R0E5Z210RkFJTWxPeGoxQktIMjV2Z3gyUjVSV3dUUFpD?=
 =?utf-8?B?VkczSDdiKy9WbWFSclZTOGlpbThkdDlGcHEyUDNhQlhvOWRuZHEzNG0rZG1o?=
 =?utf-8?B?OEZQQkFQdnp6Sjh1aVh4WmNCL1VxSWwyYldaNEpxNzF4NWVoc0pyY0VCVWli?=
 =?utf-8?B?SXJXTWJOWDNoekNWN0d2SUIxM3g1L3ZjeG1pVjFpcCtaRGYrNXJicXlOMVVo?=
 =?utf-8?B?M2dzR2FNaVNDd1F0QzNEeHZ1RTltYVhqRlBPVm1FUVJBdituLzFUSzdKNEh2?=
 =?utf-8?B?U1FSM2RZR2RVSlFmQXk5bG5TRFFxaVF5eVI1TDdBZzR0RVc2UHFCODZWSEE1?=
 =?utf-8?B?bU95U05NRWZXYTNENUR4Y0N1N3JzeWhwcm1FWGxUMXZUU0NLUjNrb0Z1aG9k?=
 =?utf-8?B?VCtURUNiNkdGYW10T1l3ZzIyTWFFRzE1L3o3c0pFREEzMmRoanNrSFdaQkI1?=
 =?utf-8?B?ZFFyelh5c3NubURCdm1iUHEwUHJMZUZBaytUTFV5dHRPZitwdjQvVzlqazJy?=
 =?utf-8?B?VVdYK3lVb2ZYMllNWHkwdXgzNGh1TXVaelg0eHlzSGZoVkQ1cm8rZ2hxNG5O?=
 =?utf-8?B?QlYwQ2JwQlRhdUtOUEZGZGVIZC9PTjRPRkg2ZGZ4eDRHQmpBMjl2NUkwUDhM?=
 =?utf-8?B?eFVYZHVBbFVJL3dUUTB5UjdZRlYvVEdXZHhKVG1RTjhodWhOOE5iZXRjbmN3?=
 =?utf-8?B?MFRncjhBU0dFMU9aaytJeXFUenUrYjFOUGlZNzRoOUt2VEhoYmVFcy85eFR0?=
 =?utf-8?B?cXRBczM2NkZxWnNaL1FyM1dpVlM5ZXRkOVhTdnkyUmJ6Vlg4R2xJZ2x0cEdr?=
 =?utf-8?B?YlBwUUZLMEJWQkovODZML1E5VTU5eGdLSGh6N3NNeUxwK2tSbmU3OTJJaGhZ?=
 =?utf-8?B?Y2ErWjRNUC9VRHdaandJY1lYMjFQeTIyTTdXN0gvMnpXWTkvdTdsakhwNUx0?=
 =?utf-8?B?bzZJMXA3TktNL0ZRNEFVMlZHS2NmRGQ0UUlHejJXSnUvWGUzWlVxYjErRTgx?=
 =?utf-8?B?NW9IcDJJQjRhWmdlSk9Hd0NXb1l0YXI0a1g3cnVQRU5uUUhQK2V1TzZCK2ho?=
 =?utf-8?B?NVRJdUl2OGRFNkJMK1NlbEtkZ3k4NEV2MVpYcnlLNjJITFNLVTBZbEtSK01L?=
 =?utf-8?B?N2JMdi9JR1dGL2EzOSt4bEVXdk9ETzlrSUZGSGtCdHE3UkVSZlcrUlpzNmlJ?=
 =?utf-8?B?S1dTcGVsUElHTkRBMWZXTFFhOHVWbDM4clpXaGc0cWR0Qjljb3BzUlIvaHhE?=
 =?utf-8?B?bFFDTkR6azlDUzB1aFpTL0d6VUpoOXo3MDNONFJKWk00dWZUbnRQd0tHekJ1?=
 =?utf-8?B?RGE4VkNWbEx0K3lUYW90WlZqWlBYQ2QxK2F2SFFMd1lMYUw4MmFFc2FXVWM3?=
 =?utf-8?B?bWh0MmlJcnV4Y1k1YlFhMk9XU0lKS0dycEwwaWd4OGgxMVNPcHl5WmpRT1RU?=
 =?utf-8?B?ei9yUjJicWdaLzIwWEYrVEpuWWJCWkNmelArcWM3M3ZGV1Q3ZmYvcGFEcE1P?=
 =?utf-8?B?L2JOWml4NVJkSElsWnR3TE13dDlIc3BjMXBUeGdtSVJ4SStkNE41aEZUZXA5?=
 =?utf-8?Q?Wh6YdABM7uTvifbSQ1CO891JTfCu++0IXwVIqGDqUsnbp?=
X-MS-Exchange-AntiSpam-MessageData-1: OAsVT+DJeMseCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d156c-6a93-4acb-2962-08df3e236791
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:36:29.4290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWQaTmYUcWF4bJ5mnT2M8B5zlEJjsApvBIdwC7a6oSX0tLMOZfH4yuNw8BM7Qq/7Dqlja3tpLwMHQIId5c58hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic bootloader programs the FBIF aperture of its context DMA
> slot and leaves it set after the bootloader has run. The r000
> load-and-execute events will need to do the same with apertures that
> GSP-RM chooses, and should not leave them behind.
>
> Add a falcon method that programs an FBIF context DMA slot, runs a
> closure, and restores the slot's previous value once the closure has
> succeeded, and use it to run the generic bootloader. The slot used by
> FWSEC is now restored after FWSEC has halted.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> [acourbot: extract from later patch of the r000 series, convert unneeded
>  call to `update` into a `write`, only check the validity of the DMA
>  context once.]
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs                  | 30 ++++++++++++++++++=
++++++
>  drivers/gpu/nova-core/firmware/gen_bootloader.rs | 28 +++++++++---------=
----
>  2 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index b17a997860ef..ad497a5704ec 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -513,6 +513,36 @@ pub(crate) fn pio_load<F: FalconFirmware<Target =3D =
E> + FalconPioLoadable>(
>          Ok(())
>      }
> =20
> +    /// Programs FBIF context DMA slot `ctx_dma` with the value that `co=
nfigure` returns, runs `f`,
> +    /// and restores the slot once `f` has returned `Ok`.
> +    ///
> +    /// The slot keeps the programmed value if `f` fails, since a falcon=
 that `f` started and that
> +    /// has not halted may still be reading through the aperture.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falco=
n has.
> +    ///
> +    /// Errors from `f` are propagated as-is.
> +    pub(crate) fn with_fbif_transcfg<R>(
> +        &self,
> +        ctx_dma: u32,
> +        configure: impl FnOnce(regs::NV_PFALCON_FBIF_TRANSCFG) -> regs::=
NV_PFALCON_FBIF_TRANSCFG,
> +        f: impl FnOnce() -> Result<R>,
> +    ) -> Result<R> {
> +        let transcfg =3D
> +            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast=
(ctx_dma)).ok_or(EINVAL)?;
> +
> +        let saved =3D self.pfalcon.read(transcfg);
> +        self.pfalcon.update(transcfg, configure);

optional nit: this performs an extra read of the register (can just call
`configure` on `saved`)

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
