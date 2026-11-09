Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794200011;
	b=sv3/SZ2zZ8LAqQChALcmiyqfk4HlieOyIrCNYBpuPFDr8rJCIsUyy8mam+67Bd5fT6r0
	 mmGIohehQBVH+WuUMkUrv4FeE+4JtEuPcN7kwK3h3vDFgdT0EWP46UbTTxQYBPwAy/z0T
	 4xVQpwfQX2To45T5cv2PKsUTm/QhwPmH3+LNRCrbL8XmXkfxzrrEcNXCWX8bWXUuxsXoN
	 YX1CCZDM+HE0nGfsqjVGPAxWXGp5aKuwzP6eQd+uO4+Bk5eMUY+Wtq0j06vKnLTYxO33p
	 Qk+5RWulZkzoTMfK3Wbc+DyDr7Q7yU4g0yBXHYuOYs3aob9giyJvB2jlEwZCmA6RQ5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200011;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
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
	bh=hsZ5K6VD/FqLYh5ebvd6gwABLR33jGxhtAfR5wkDtiw=;
	b=AMnkvZdvbT3BiOTCDIp+WixnzTBTu5MYk1hezz5t7JjLu5/AmyXPNYYCBDp31cjVE+Jy
	 hRhgb+s9fGO9YuhvHyzBzHIn/qPyiyHcEWGa7zPtI92inn7LgaLxm+u0z3u3mJGoGSlpU
	 TTLRS1GvpyClPE/ajKGC1JtIiUy4dKJ0ue0btMrHnqkT/ZlBHg+OF1r17B26h7M3u3Z0k
	 mrqC2uBw0znwMsSN3EwlgQIrKBCPnabNClhYzKGZ2TKJ5Subb7Y+n6Tn95USrTZHA2+1f
	 FWzXRdXK3h1Sq3xdBBqZ/vrWjD3V0KZd/CdxIeRFTAVruUcN4vJmMTJOpzynhfuDZhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UcKcMvIG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.32
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB0606A323
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 04:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CB0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UcKcMvIG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnEk5rRFBzFu6pguYAei8CpVbAt6ZQ72cwXXDJhCXB0l/KlAYeudL39OqNGdoY5SDKsbbHeVIHxOP9BgUeoEcl6bzuPuTd3Ui/5V4scI2gEJP3yDQLs+gQc6KzhrlBF6XPS6hMZyQkpq9BOCqekn876mYUuJibkuHnwAC3pAUmLoeSvJletnwG13PN0ZU0RNQ/w7zWz7BLTxUsR7byTrf2KLXgwuraFjDs77HbAID48TTLJu+/oLjoKvcjHgLJ9cgBfSpd3oVAkuAnVzIN80Ax/s0fE6XdSK5hTgRsY0xsBN4+Q78W9+giNqEzXc+2tcyPoPtaoM2qmDUfFW2St/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsZ5K6VD/FqLYh5ebvd6gwABLR33jGxhtAfR5wkDtiw=;
 b=peKtbBSjgaUq9bc/bOQc6pyeBIqxIU6W6x0tt0DqYMNWjN48Sagb/zcd++rrRzzbogU2r4YEmfFTCgQqrBFm5vTtl3XMoyrtGXdU/QPij6hemTrfEwpuTd4ycLMEsCwDJ/u+l6qyczLIc11tTOm/ui0BS/hwedz8aJJjBHdSOxLl0H3g3HQ4lJ/4iPovj4t54p+1Q2f5waYQu2oCnY9DOBEmRiaD3j/RgKN+rACMt+cORndUhANC6aJimo7ZVSOQJY9S2Wc7ukB4vuAxlmFPse8KNnzDBZ3YYrX7g5UnHjtAULTAsMS2UYCRj0LWO2a52+47IETcdajFXmyuE0cLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsZ5K6VD/FqLYh5ebvd6gwABLR33jGxhtAfR5wkDtiw=;
 b=UcKcMvIG22pBnxhCSzRR9EKQNUZDMaQB9AOPc5dHY4taSuPuHswLqNJYZkYoGQZQQMtg6KdNp7r2Bs+7fuY5DCWT9rt+3MPGOgJ8roH61icDzdxqPsr/bZVS2v0afCVicCLXucbN+1L4MdE24YLRTQIoW66ANE8pu4ia68Uj8CZo9bc+047WNb6Q+kP01Bzu/m9+bXBaIPKBSyzJZ9OWluuJSnwiZ+8/3nNvoo5NFXf23oWZ1cTawI1hYb0jozQMDiv5L80znk+yVc7sz0zwz8ZRMM11gJEDKHc7FsJkFhaOpI7kjfR3KE+2kunzbElebcL6votBqa2QOe62oqjLKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.12; Mon, 9 Nov 2026 04:53:27 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 04:53:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 13:53:23 +0900
Message-Id: <DMQETIYO7A62.263CE3B815QGF@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] gpu: nova-core: place the generic bootloader
 at the top of IMEM
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-3-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-3-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ab2cea50-80ea-4a21-2fa6-08df3e1d6469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021121427099003|261022115727099003|261022075727099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hdXrEMn+/IOy7zYnoxqYUlGFg6Ho88mA9r42SnLJY2qBFpy4qFkxcLCXBs8RA/3/juYQq4VHtpBlAy9LK/ie2P5EFFAUqA+fAOQ+jpVoFFCNlEozgkSnqP6/EgAaiQgHvZqqHdXIeb4h951iBDXXbxJfqH2XMD5jsUxgHmkTlwYTeLm+CYx1jQ69WnZRIbvy+nijwwkhLG4tYcUBdnB9KbPjnYQz1VrZ0p1CYHvtjKXrv1sti+0NoLDQxm1ZUGm3H2juaZhLB4YSp2D/7vNT6GK7K7C8SKWG/otiy1O1D99PZ+7CAH+e3i80yocs1z0LMOQsMSUqfGGE3oAw7JfG7ZxvBfSTPrIFwCsIg4UOvJRgYh+ttuNzAACwaAlGGGSEOv3P3wor1sWK5Um3Hc8gnCzhOa1bOmjULNzJR1jZiCVX47tdXdmfRNx9S3WNln1kxVKYhR1TLVu0MkxqjoH5ygW9cq21BL5ljSBUJaA9DkkSsW56kStdiX9Rx69UUIuLMGvBgjgvcJ1KZB861FtL23t+AJBk7uuB0canme6BGub6F+T7Se0e5k5oqSAKmF5P4RDQd5hfNu2cZdUzsymoQ2BlcUn2Xse5yVuMeYtAxacIyahk8SAwc45nwH1+tWM+hAwyTa5dXDnAG0wqAUZEip/UFAcBeBGgDoyEgav7nzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022115727099003)(261022075727099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjRWVG9Vanp5TE5UeHlBa0dIV0lRZDU3a1dDcURBOUZpb3RWMWdodi9PVHQ3?=
 =?utf-8?B?cFBldHB0azB5UW1OMmVvcW53MHJOeVhTL0ZQelVHQ1IyQ0s1b0t5NXBaRThx?=
 =?utf-8?B?ZEJTY0oxeU1obExnUEQwenBWSVFrZ3gzRFZScWtVdkRWYSt2Zmp3Q3k2NlZF?=
 =?utf-8?B?SEpacWxPYlZoa25OSkZ4dGhzUFlHT0UyeHZNSFNaN2hDY2JzMmMrNEgzY21V?=
 =?utf-8?B?ZDlyb2RhVHYycHg5Z1dTY080VGpKM0VUQWV6TCtIM0czUzdHS2prcWdRclVB?=
 =?utf-8?B?MjVqYVEvZHdUTjcxU3pZaVlMdU5WTkFPdXFxUFpjVnQ4TnpoeWJGemtVMkFw?=
 =?utf-8?B?TWpyTENCV2t1aHZteTY1UkcwcFdBeE13WVZLZHpDSXVTMDQ1MTVpYmF2SkVy?=
 =?utf-8?B?bUpvZlFlby9yMnBwL0VseE0zd0M0KzdxRGtjNTRqL1RlL01QRFVBVEtWNkpK?=
 =?utf-8?B?KzFqK2t2THJ2bnIvQWU5azg2V24rYy8wckZ3RlNmMkdYNUV1UlFqOGczTHQ4?=
 =?utf-8?B?dmcrMGp6cTNIZHJLZVRYQXRtU3lJYW93cEM4OHJnekZyaE04b1Y0YXJWQjFG?=
 =?utf-8?B?d2NpeGJTeEdjNE44dm1nbUNUS3FiTEEvQXRudzN3MlB2SytQVUlvT1J1UlFL?=
 =?utf-8?B?OEUwL2pYZG40ajFEMEVvRFA0Y0VyazQwc29LeHI4Qm44MEUxcFlsWHZOZEc3?=
 =?utf-8?B?RFREYzZzd2pTbVZiRGpVTDhISW1wUXkwdmcvR3BMZmV1THUzWExXT1k5Z29z?=
 =?utf-8?B?QmhDd1Zvb0dpc290U0d6N1k3dzFKSFFWTWN6YktHbHE5dy9YYVQ2bU82NUpT?=
 =?utf-8?B?bjZLSm1yL2JIMWNHWit1UWVuRzhONmh5bmtqOE00WDYwc3l4UjBkMkVoZEF2?=
 =?utf-8?B?bCtYSFFsTm1MSnJnVTAzMFo3cW0vRjFueWxPV1Q0d0lpMFp6a2N5eW8vWFYw?=
 =?utf-8?B?MS8zOVZpVW0xTDhNMVlFbVorUjZ4WTQ4NTJuYmM5NFBJem1hVm5oRlhwa1ZJ?=
 =?utf-8?B?NzFDcGdYbVk4a2w2UkFadHc1K1V2MEJKbEZUeXlPbWpKZzl6bC9RYjJCbGhS?=
 =?utf-8?B?WEZaS2g0VTM1V3c1cCtOUjVOS0svem1FdUx4dmJzbW5pano2U1Y0ZHN6SVI2?=
 =?utf-8?B?UmsxREJNdHhxaUpQTy9hZjEySjVXM3UyOEJaeWFwL0RIb3NHd1l2UUMrd2o0?=
 =?utf-8?B?VHRrRU4yZEdqZFNORm5yZUQrbkl3WlYxcUxxU0lpVDVZTVUrQ0ZrSHEyc0Ra?=
 =?utf-8?B?MFRxZEt3dHgxVnZYWEFYNzhjVjNpNVNPT2JycDBPTWlMSzV5N055aXZ3S0Nj?=
 =?utf-8?B?VDBJRDc2UXpTTnFLT3d1RUJWa09pT1ZxOGZuZ3NuTzJvUFVnV2xCanBENlpW?=
 =?utf-8?B?TStadWNOSmlSQ0xPNGltL1RMNUMvQlFrZmhNQ3VOcUx5Yk1QbEZTSGZpeXlY?=
 =?utf-8?B?eWp3YjR2ODdLbFp0Rm9KQzBqZHhnMGQwWU1vUWpyb2JiRUFmRHR3MkQ4d2FO?=
 =?utf-8?B?U2YyU3Q3UnRLUUVmNDZxNThweWlZMnB6Z3I3SmNvOGRtanZJYjJLdU05Wkt5?=
 =?utf-8?B?QU9sdVZSUjJtWlVVTk5ocXBuZGV1TWFWKzJpZGROei9lZ0dHWHRtMFR5c0xX?=
 =?utf-8?B?T3dRV0FwdE9OTHkrYlorRGYzOUp3VURoSFdvRmJYZXA0RDdGczd1WjVpYXEz?=
 =?utf-8?B?VzZlaDgvRWdpa21vNEVMNDlod2VtNEtsR0hUU1VKWEJzVGs3UGt1TjRZYmFa?=
 =?utf-8?B?OTZQTjBWaWtjM2VxNk5zTkFETUJJQlFMQlVmQzZubTZDTk45UWhZZ29FUHpR?=
 =?utf-8?B?M082bU8xay9vODNhU3BhTVZuUkhDWkpPY0paei8vMWYyTDh4WHlaT0l0ZEZP?=
 =?utf-8?B?eDhEOUF6ZWdXd1JRd0FZdHU5ejU1Rml3UTNaR1RyNkFpbXNSMDdMMWI1QWY5?=
 =?utf-8?B?c3p4TnkzU3o1UXROS0JlU1lzNmdDRFpycmFKbWRIV29FSUpaK3N2M3dGN253?=
 =?utf-8?B?emRvVFpORmUrWU9MeU8vYWlZUi8vbGgyTXdsd2FFaUE1cFd4aGpRaXd4SVJL?=
 =?utf-8?B?OUc4aWxicFVSSU9QVVdNZ2l4eEJKSGRSVndEMHlmS2JnK3h1ZmdTdEIySXdI?=
 =?utf-8?B?SUx0UHVjR3F6dHFCS3dlK2xSdThtMUxYNXlNZ1pJUmFNY1Jza0k2RnkzSTMw?=
 =?utf-8?B?Um5SY0RzYWtpdk40bi84WkxoTDdjM3o1RVVuSlFxMGN2KzVQeVhqRGZUdUdF?=
 =?utf-8?B?a2hlb0RpRk9jcyttTUdtNlh1bDhyU1ZYOWtlNFlSdVpDdjhaL0theUtVN080?=
 =?utf-8?B?Q2pvYWE2bVFhY1lRZXVSK2hnVitQMWJ4eGpWQUM1RmZPZzRTdkkyWDJRV3Fj?=
 =?utf-8?Q?CT58JMR0Dk/Lmo2Fb4uyIlezcQ9orGqmdg/48ixtgj7Us?=
X-MS-Exchange-AntiSpam-MessageData-1: LmUqRZYn3mDIZw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2cea50-80ea-4a21-2fa6-08df3e1d6469
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 04:53:27.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05nLaOMn2rL0EaKvyCJO87uxbEG1U6SMti3eIiOBxXwlT2Vd5gBUXknpn2z69DwzX3hS26muQaHQiTTvTuqDUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264

On Sat Nov 7, 2026 at 6:47 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic bootloader was loaded right below the first 64 KiB of IMEM,
> on the assumption that every falcon it runs on has a 64 KiB IMEM. The
> r000 load-and-execute bootloader event can name any image for it to
> load, and the bootloader must then sit above the blocks that the image
> occupies, that is, in the last blocks of IMEM, regardless of its size.
>
> Place the bootloader at the top of the falcon's IMEM, using the IMEM
> size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> [acourbot: split out of the patch separating the bootloader from FWSEC;
>  convert the IMEM size with usize::from()]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

>  impl GenericBootloader {
> -    /// Loads the generic bootloader image for `chipset`, placed right b=
elow the first 64 KiB of
> +    /// Loads the generic bootloader image for `chipset`, placed in the =
last blocks of `falcon`'s
>      /// IMEM.
>      ///
>      /// # Errors
>      ///
>      /// - `EINVAL` if a required TLV field is absent.
> -    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
> +    /// - `EOVERFLOW` if the image does not fit in IMEM.
>      /// - `ENOMEM` if the padded copy of the code cannot be allocated.
> -    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<=
Self> {
> +    pub(crate) fn new(
> +        dev: &device::Device,
> +        chipset: Chipset,
> +        falcon: &Falcon<'_, Gsp>,

optional nit: `falcon` is passed twice in (`new` and `run`), so we
could call `run` with a different `falcon` (which could have a
different `imem_size` to the first one). we could just compute
`imem_dst_start` in `run` and drop `falcon` from `new`.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

