Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201232;
	b=b9R4VrLz6ERybClScMUFX9SuUq6fBaEpsBbKgyKnzHA0bfG+7BKxtiAUTXXjtYU7/ceA
	 QEEBrDNxiyAQyQrb3CZcW4Qw5zth4U2j4FrKCxQZ8OHQ25hbTcPnfvVo94Gc5ts2FZejl
	 WMNA+4suGps/gtPrlEv4Znu5tsKtb4stz+u7RR4U6d+yZB5xzmUfnOcQyjyii/eapApfZ
	 FyJJQK6z5tr4KTGeHE+CNoiJQDnrHLe1VH/qs/fBaJetJEFlaJhoz0ykx+7Sv12+RA11p
	 9RPGYmj9g4DHtPgX+qq7/83Mp4birAwlVeYvMjkbJCzAn2JbmJcd7K4O6sAefXxj8Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201232;
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
	bh=+lgmV+KIHjGHZJv6GRokSE7pgKAcejDJNsPjWzcxI6o=;
	b=yhCXphdR4MhkTpSrmJiUFlcS37Q2EO0fFKV89XmzReLOPW2wQcaxexnn+7GTBplKExYu
	 QHA1AKKkEgI9Y/RkIykRjMwdSP26ScqSXULWhZO7t2Xjk7Ht2zBkz2WTzHNwgkXqkJVnL
	 6Uio+cNpVp9I7UX90IUlfN0r1AAc1grgTWQZrQoxv2yax/UQq9dNgIylfluWVuFnshiZb
	 nGb+JPklhFZqAUUVfX2D/gq3OzHwF5f+OgiiVYpLcIlJ34F2ppHu4swF+zX7pvuGrMFop
	 fOg2CwWGyEbz6PXMWIhAeQM1NeFQd/oyQi7S6qYd5t2Yem1MBJOM4Hq0Zcj27+Sp0IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DTeoES1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.66
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A57606A31C
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 05:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DTeoES1I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oex5Aa1fJyKLSAFfztwa5epZaH0YBLwLFOg+GzLto/hJkvYs/ewo+XSrGSGBbCsmbZqmxZmlPSTHdHG/vvhjOTWK+ae5gKV7tqW4OLrRjwTUbeh1hzuBQtbcdc5s2OQx0rVdXSpzgTelY/45TMgv05pOk3e29wfW8e3nZrsohXzCDd9AhQ1ASJU5Ra+RhyE4Lx8OLVATWDVdt2cC/i7c7JI+A5UnSVlyy1uQvb3mLsmTiN9jWREKamb0vTVlH6n5ISpNXniMKDFSN/rbXqYGb8IEeucHbmBX5h36UO8ichcmmUkRoY7KDn9ryaYP8xoMUiThm/STIgyvsAZ3g+5LGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lgmV+KIHjGHZJv6GRokSE7pgKAcejDJNsPjWzcxI6o=;
 b=oK5U1LCsucsqEH8S2A18FuhIx4Q/6XBNEeMeifa8HhExKKEgfjiP3RLOUmMJC/ukw6cSy1qH4k2PwH2pOmfU58wMr9762q0w2eD+Y5hF5b16XK/kAmWs3wetsa+BfO/leToa2Mzjloqx+kQaHKqVKL8TESuGSA2N26uoo/1LP1WKHaP13rxo4z4nC2JTQKEjMRIshzASflm4t6UzjLkZtieXh2jeJtanTjx96Gtr6Z8BYIr1OYi6Gl0g7KGPxf/QxaDbqrvlYPixHRJOAyGLftcNmEWjx6U3olPixyX2RotZfM3DjMeFgmXe7o0xpLYHqaUb5nkc95K0HgPpMglb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lgmV+KIHjGHZJv6GRokSE7pgKAcejDJNsPjWzcxI6o=;
 b=DTeoES1ILC5fxXUTNUu8QSFds/IH664LFFwc/JmdylqyX8KtfJUOzmNg+nzbmtVWYQpXIC8p0XBGxuKIsuUB2ff40CcCVA8Q4bVOx2oGClLyXzFOjmS80NytB00sP8YyQAvto85wswhuHe8CmjY7LJ3O7/p2DM3pINsUVef262dkNDBnq55S7Z7ggVAkFUBafeEBtwiaC2F2zvmV1f0w4aa14YwsoWalGYBdWfTUbWt9C2Wky1SnDJqM5BC1HWXkY0IL9AhAbcucbSti3OsJT47ftsLv8nZLAGh3sFQ+H5F4v7hj2I7Hthn4NwpU92sbwEJ/EI1Oq+lTx5isC84QKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.12; Mon, 9 Nov 2026 05:00:47 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:00:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:00:44 +0900
Message-Id: <DMQEZ58Q4KYI.NDPRWOC3F11I@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v2 06/12] rust: io: register: implement Copy and Clone
 for RegisterArrayLoc
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: ad66cb8a-6c99-48bd-5de8-08df3e1e6b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KBzfpIbh2RulWy7/29v5afWMkm9pZIonp6Ho+Rv1idm3OnIHMXLG2OkTQTthOo/roz290MyBILOMHURivX/jgboHX6O04fOsSYACUysxhawVdxmlDcFCYSj0I9D+m6NjAgfYu1fzJpNXwZncomkVb+RxK2aLwFoepsPMbVVarIs453ev8KiPOFt2JxsfeIYtsGlMU2+L/uvn09IdnZtd1WYj9GdV0mDtflXMHoxwzxWy+Y1m0ge/15tHIEaDdVeOjuwuv5MVsoE0oAdi2/xd2qKfn6WkG0GWShjuREfryPiXqeB+XyTeHyHnIM64659tl3fgmqrRUPqTcmrLmRzZJcr+zICxxJcYJlL+y5mEAp6FQa2f8e+MYW1h42RJnuQdXKa7Mv/EEx/AY30I9jpy35buVBOyEhkUMyXzQeZ8zkHjEyGd5qZxiHdcv6zZ1kzdhQ+9KDl1WMNVSfrXEJdhnb9cJYGmKvYndm7SIVJhR76C7BZetGFDw335lEZ6eoXfbGFDTkTyISR250spmzT/SKB5LaXOot73x4rsWYzaeY8vrhJwko9Dlx+ywVM9YoC18lAZ3Sj62rBKttXEjvDQag0wxgndYDIh5zer2G0v9ZiMcE8FQY8A09zxVbahOKnKgx7EmG6kAhGtBDFASpgT/I/vQTdMVehWGg+OH58fEoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtjZXE4aHpXUUhQMG5XR2FQMzVXQ1Z0N29GK051VVJ5T1ZFQkFoOWY3NWFB?=
 =?utf-8?B?V0NjWkQ2QWF3TXRiU0E3Wms2Q1RxaVpwRGwwZkRWQXhLVXQxU1FUOUdsRkc3?=
 =?utf-8?B?akR0djN0L0didVozclR0YmdsTGFBaDJNWUw0dDl1blV6OVZJOUhSelczVHpZ?=
 =?utf-8?B?c1I3ZU1QQ04vazVHM2VMMGwrckdLSWFvcExYOWRuUW1Ra0w2YjQ1SDJYUWFs?=
 =?utf-8?B?SXErT0hFQVZPTGRsMU9LdEZoZG0vV2Vuc09ERVV0ZnJOS0VETldWT052NVB4?=
 =?utf-8?B?Y0U5a0xod2ZDRHN3ZlMxS1RHQ3JpWlYyQ1pkZnB1eDNqNlVVNkNIL2VlSzJD?=
 =?utf-8?B?anoyNUl0TkFlWXBwcVdUYmNMb3NmVFR6TG8ydE1hbTEyTWhsV2lmT2hrOWxF?=
 =?utf-8?B?TVptUDRRMGsxb0pEQnN2SDNTaEN4U3RMYlEvaHQ0NGs5QXFFVGZFNDl5YWll?=
 =?utf-8?B?WWxwQTVxTENaaVhtRjQvV0JiL3o4eEEwSzRsaEdyNExwQTVwRktGSHc2MVFL?=
 =?utf-8?B?N0tFdTZpYytIbENnR3V4WDBUUEhMT2pOY1QydEFSOUhlY0JDZ3FZZ3k5Tnha?=
 =?utf-8?B?aHJjeHhPQTQwaDNURE1VWEprMmhqUGlGWTBMU0x2WDdYMFNqbkJrRmJrd2JY?=
 =?utf-8?B?STE3b1UrTlBsODRrbU42YXQrMDZ1UVB0bEhtRkcxMHBVREVvOG5TS2xNOUpS?=
 =?utf-8?B?dmE5amwrVjJRdHlSTE1DYk1yNGZ5dnlaKzhJTll3aHh3M0NBbUp4d3p0d2k5?=
 =?utf-8?B?aWsxS3JsZ1pDNThtUTZGc2xhSmhHRkxGNHR5NjBaNDVCUlhEcVE3akpzUG5y?=
 =?utf-8?B?Nk9naWxjUllvQzVkdHd3bDJYN05uSTh1MGliTWdYWXRySnl4aXl1NWYzeXJv?=
 =?utf-8?B?MzlyT3ROVUtuYXIwaWl6TEJPSzB3T3hYK2hVRk1vYzNHTmV5dk9lQ0ZrZFdZ?=
 =?utf-8?B?YVNIVW9ibUxETXA0TzJ4SU5mYW5PbFVaUWdmcVhKY1ZVc0N4cm81bnU5Y2R0?=
 =?utf-8?B?NXM2NEZ6L0Q3VlNRS09ibytqQXF4UmZ2Q1NlbVQ1MFFqL3AxRE41eDM1WjBt?=
 =?utf-8?B?OTg2Sk5lTGtBb3gwYUlQSFpqQ3gxdUxkMVRMK0x3WUFUVHBNdTEvV1dlSkRS?=
 =?utf-8?B?ckJkeWIyRkxIb0lTRXRUb2xWbFQwUG5VZHFsVUtaVGFhVUNlQzZxcTFycnZr?=
 =?utf-8?B?Ym5FRGdqUzBPUGVNemdJQTAraGJ6NUVQZXE0K3JWQ1B5SzB4cEYweGx1OUhL?=
 =?utf-8?B?TlZpNlRIN05YU0xrS2NJN3RJQldqbW05YWRWSFQyc09sUUxIWURmNWhvRW52?=
 =?utf-8?B?bDdaSmRDZXZaR1F6aUE4UGZ6eTR4Yk84V2JBRGJnSU5BK0RVb2E5UEFlYzVy?=
 =?utf-8?B?bTZKYjNzdDU4RkNVQlQ4alhUcG92LzFUL0lyRzFkTmNsMk9xNGZCVzRaOC80?=
 =?utf-8?B?dEhBMGlXV0FLcHQ2VVA0eUVTUHA2R01vaW45MkJtZVNxQkpyMlV5cXFsYzdL?=
 =?utf-8?B?RFg5TWZQbTBTL0ZIMU95eGx4Z3RhL0FiN01DS3k5d2g3TzNyak9ZUlorQndo?=
 =?utf-8?B?NWljRlR1RStEaTRBSnFjeFRiUHNYVUVkUldiOXRnOFV4eWhXUEVNV21xYkcx?=
 =?utf-8?B?cjdBVXJiYXlQckR1YmtuamJsMXB0MXd6VE54dXFMQW5IM3luUVFFVGcxSitq?=
 =?utf-8?B?RnpqR0dKTktPS2JoVEhTV2t3QzVBeXJzNWhOcXB2d3FIREt5bTB5a05lTHNN?=
 =?utf-8?B?TGtZTWFTK1BtVVUzZ3RCeExNcGJxNmhPNzVHMTZDdWtPSUFxcVNUZ0NnQXBJ?=
 =?utf-8?B?Zm9adEs5N29jRnNrTFo5dFFHUmFQdkhLYzFRbUszd1RKeHFGTlp1ZnJhZlkr?=
 =?utf-8?B?NW5udkUzc1AxWTU3UW9pOStRRnVIekoxMFV3eWhWbFFaSFNjUHhFaWZJU09i?=
 =?utf-8?B?YWg5ekJmK2VtY2I1LzRNWC9mZVpWUjlGNmlkeGhwbUsyWkQ3cFJITUxVSDVL?=
 =?utf-8?B?eEc5WFp4U2FOR3ZYM2pPZkxYaW5UbGlyN2E3d1RXVkNKaStPUU1MMXErcmY3?=
 =?utf-8?B?ekMwbmlnZVBTZVVaR3VnYUdNMzdYcWQ3dis0cURuVlFUcVBvcko1NVpDM0Vo?=
 =?utf-8?B?THFzUGc4bGNjL2I3MjlLZG9Oa0pjbnpFU2pZOThncWFlR1lUcEhMSHpmV2k3?=
 =?utf-8?B?dVRzM084YWM3dnJFVmkzNjQvNkJDcmVFSFRYSXI5UUJiOVlaYzErR2hYcG9D?=
 =?utf-8?B?dmoyV0Y0UTdYY1FPZElINWRwVnJ0MXBwT2hjTGhIUkZVdC9MRFo5Z0creUhs?=
 =?utf-8?B?dTVndCtvNC85L0orYXdyVGt3eG9PVHZ3Z3pzbnlOVEVCeGhMdjhjK0tRY2xB?=
 =?utf-8?Q?Lpgfgji5YYY8xiGI6TYT970TMGjfa+i62Y7wQ8rU1eu8p?=
X-MS-Exchange-AntiSpam-MessageData-1: JVAPzk6FX0Tp2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad66cb8a-6c99-48bd-5de8-08df3e1e6b0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:00:47.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXPk0jPZE2Lfpst54JiZjQQHPx/F7fjQAp9U37B30EijGLyr46j/ZNdHLwIEoRqLpnkmL8Jtios1adJKiDyLOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> Register array locations are small values that are cheap to copy, but
> obtaining one can fail. Making them implement `Copy` lets the same
> location be checked once and used for several accesses.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
