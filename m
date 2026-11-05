Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883051;
	b=4UB8o72MvMBbvA5sx7Lw5wBpnBB8699jxVP3KM6VGpIKnb+eQy9Au5sjc4CztVIxZFmE
	 EuBsh8lo3DBijvXRc07epqc+rX9NQOFxc25loJDnnI+bJJNQ3XTxQTZz6u9umw8irbI9h
	 m7+Mejs2fnv/1eKGkc5FsU8kAeCGHVVbPj6P1i/vvNc21lDrOutaVRJwjG7Yo+8jK1/yk
	 si25OKe0WYMA5PhXWAHfvxNfDvrshXdhQluyJuN6gCFTr4EAz9JsMGkxTKsHe1U28GhsE
	 ApQIyOw0LO2e/lN86olSnzKrKP+pHn4Exn9S2G/iGaToC/XPj3xp2L4GA1npc+ydJ1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883051;
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
	bh=Oi1y6w2G5ZvNH3+Cu+G2qRBlcrOGuP/GF5kCG/BzVkU=;
	b=QsDUuSDLNlysT41Tqnyy4C2X3PJWx2ittQJE9QTKZa5Yd7q2bT3+lLo5Y8lPp69JcW/D
	 M49hmehzWi2oQM85OMwy87ZzXCyespGXqatjCuBSl1+fxAHoyvulW68HdR9Oz4vsTz0jg
	 Z7Je9maVUuekHOBsTMSmLxbTV1Wh9krCWmNyr0sgfwbk7ijJFEw+s6U2Gm7AoBAI4Lc20
	 qeQ6b/TF9KgbCQ/9WtXuSp1e0T3I08hU1TwJiVjvP6YTd+/gaNSt7f58M4JMjTDcWCRJ3
	 DCBeC5e9Ve8UhwR/5lISHnt/CzBFUQR6hm1g13LoiRhp5JrbtM1q0RkQggQsqrpAjnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXCeQG28;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.65
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03045606A326
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 12:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03045606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dXCeQG28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBsUkPpWDzSek7aBqBvs8us5qDo5e7mlsdAwhm2oBSqIBtSCHOEgylVjZySyyi7fAAjyX8tDMwV4ixmYHP2TcjzYIdwsvRReiGun08mbNaLJbQxzoABuk733UExJUfFknZ3rFuEUu3P/zJgwI9Q8ijlggIGH/1MX1XvoQ7NBJSxY0IcBJqg6ynwrvJUBDg3msZGff2B5aVeL2SPkYh+Nzy2BBaqVp9vEk+4jbWNoH70v4xTrQzOZLYx/P1bGMzCMssTtKWoY0IuPV6dSBVOBJx9pJs8CQfLQD/4jKEfMf7eZMDTkZtpvQoGkXXPnukCPSNw5Pxq4gQKUH9Mq1L3Zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi1y6w2G5ZvNH3+Cu+G2qRBlcrOGuP/GF5kCG/BzVkU=;
 b=MUvQIxFkIMKkNcXBZHFxCYWNuSkpQRpKB+ap3Fhw6moSRnZdH6wIXo2/Z2F6mEFaIi4Rxt9T98vCcYs6rhKyZNuUR+53VpN2noxXCEoRUjeW5dBogOEPoE/4xPvUkYfWRO36IwWhZWwoUkNbGU+v81z+kffoSC+e8zBRNxKhqYH2jll+jY3ILVlPq18QAUpKUJXw/g9hbEMOQTRo9exV5TY9fqRVZQIjNrAAwIsaL1NY7m2SkHPkFhhsnrcVZ1VqumZcwDJaOiBc03CIJu7qh2g3+8KP3KyQph7Y3YRPF2liWIJvtEjhaeT2/SMjn2mlahlPYaMOrQXChO3alCvBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi1y6w2G5ZvNH3+Cu+G2qRBlcrOGuP/GF5kCG/BzVkU=;
 b=dXCeQG28829eSvwestMZpOTkcC64ckvDg3rGk+aUrHZ1Wk0/QA/KUfKPNgO8/MHJmD/EQLAWPcJrcUU3lI0jCxTlBZBzIKo+2+WC31N6O60c+FsT1Vbj7C5JkqLWMbViEfYcOY7YPefidZTJY8nGKbQJsCN2o+fC6s0nqfoxsGaJSSyM5PHRIlTCM8hjRckL2QvssMFAyEC4YxzogmNuQdiWz1YMHjfZqCnb9Cu8YPxlmfk6qRqPd0qSIfUcZPZzwbRWmLf4gBNsQRiCfAl+bVt+2HI+57SbrN0ahQEi9rowmrRSUy2x3jW/EW5gvIIkNUOhrYPQ+adaBGx76kexmQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Thu, 5 Nov 2026 12:50:45 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:50:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 21:50:41 +0900
Message-Id: <DMNAGSL6AZXR.2LDSAZU9GOTEF@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpu: nova-core: run the generic bootloader from its
 own type
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-4-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-4-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d1adf7-0538-4a7e-70c8-08df3b3b687b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|261028144727099003|261026121527099003|261022105027099003|261102123227099003|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	fLWH8JBY6ImoAKyv278pAhMlkVPAhc4t50M0LEQTyJV/hy6mk12dFGFNXaMGWuWm5rQtEIJXBF/gGfx5jXhtjpjI51DSiO+9Y/bXBLmIS/p5PS+F/xrcj/LB8VWVP7iT+Ui682GImkZKNxeY5S9BXMChatt4FcttRK1UBm4MrIZTyKOWiGyr+ma3/kjOI5Sqa3LxMmeR0Vslnzr91mXemTlj51DLSabEgoTmYztfrzHg5nHkG0BA0fMEXJF4tJBzING1f0rEfl+8q0ksZjj8FcPCm7eamNQmZY+ZPJBKZstWrt9zMES2ofvWLKJLfsPo4DqprmMmae+dhuNw82AsBuW1k9QUBu87FmFKUV+tklHt7Xiu9UKt/rNV+t+hHYNy2UFpHjcgbOhvCYJYU5VpiEf8s60gZzT6adCb5n334ASw6/yl4cLL6jgNxe9Pz5Bj2T+3hCbGM1g1SQZphg/a/LocsWK4PSe+1mExMFoT6Z7GdpuPg4FLQ7jxI64M9UVxXGUc5yj2FUxezgYwcwhyAv3eLh0tkycAWVloeV7/qfz1m6M+us//Or3jWpsZ1pRazV1dcaZNCmpDFCjAyVI34KslMeerYL15seGCwB93zmZwIH3IsaU3qRX/LyK+TvjxKZ32flRsJAhFsfRgTjGptzVTpa1T4beuq376G2DNyxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRGdm96N1BydDRSOUg3MU5ZbnUyZHNhYVBwYU9MYmllbXdhWDRSZW9iZ3dv?=
 =?utf-8?B?MVBSdzU0WmNYZHQxNmdHT0E3RmdFR2tHeHNxSWtLQkVuc1RmNXN1TWMvcE9k?=
 =?utf-8?B?YzdSbnlJeUdybGRqWkRtbFpaN2xVakFRNVhtcWppcCs3YkR0TUFqNUpZOGhE?=
 =?utf-8?B?bURhVEZHTXpkNlBVaXpZdnY4QWQyTnZwMnN1cGljUzZidEcvaWJrdUt2a29L?=
 =?utf-8?B?OWF4SXhkL0VKUzBFRDN4ODFQNjBjY09FaE0vcFgweUNOTWMxV3NPUmw0RFZP?=
 =?utf-8?B?bjN6Z2d3WTNkcGNPc3RGdmFENmU2a054eGlCdUpNMFVkblFzN29YWFJTRE11?=
 =?utf-8?B?NWRpRU84S3ZwOFRhYVIxSnRuYlJpUlR4MjJGZG84YmxBTEZWNlpsK09tOXBX?=
 =?utf-8?B?cjNkMTdaLzU2Y1VoVmhwbHo0U0JWeFJINEJ0QkFYU292K2tyc1hrS2VnWjNP?=
 =?utf-8?B?VGVYRk13YTVoMk1RWTVXMnNvRUl0ZjZnbnVmeXlueUJKOGFSK3RQSGZDczdY?=
 =?utf-8?B?SlE4V0wrM1hlNVJ1MGN5bkhkaDFOZDQxN2ZYd2kwSEpTcC9RdnZTamtjOEQ3?=
 =?utf-8?B?OTZaMG9aTkUyUCtwYi9MQ0tuVmJxbkxkNnRQVWJMSGtTaGpDZHhEUzRSQzIz?=
 =?utf-8?B?YXBtdC9GanFXS01KcitzZ0pSY2RqSVN4TUVsL3A2QzdxQWo1TWlRN2FsL3Yr?=
 =?utf-8?B?WkZnQXZmZVQ2VEc3Yk52eEp4R3NOdU1YV1BVS0FIMzZONm5leHlpU0VKenNT?=
 =?utf-8?B?QkNSOHpKc1M5UWl4T2R2ZU5QcnNLaFVCNFBLOXowTHFsSzNsZWFQb2xsY2Zo?=
 =?utf-8?B?VSt3K0R4M20zZXdjaFMxMG5pckJpSnYxaUpyZ3ZwTE92ZlVDYm1qblZrK2g1?=
 =?utf-8?B?UE9tMFY3ck50d2FSb0w0cDM5UVFPOGF2ZEFzSzFXZjI0Yng3ako5enhkaDJj?=
 =?utf-8?B?WmJJcjM1TlFJRnNPRWxWZGI0TGhpaXAvUzJWQkRFTVRDL1hxQmJIa0dwd3hD?=
 =?utf-8?B?cThXckpJdGpCNmZiK2pnTmRlZWloK0d6NkdQYS9wVUk4SGhkdkpKZzZmbmhU?=
 =?utf-8?B?cDFlT3k5UFlBZHhFYzJvdjBJbUZrRUVxT0RsdHFhTFdLcjhRTFp3bElPclNG?=
 =?utf-8?B?YUt2bFAwTXJiOVV3cHNmZDBoS0VwdkVjTTJNM21iQ1pKMnF3bUgrZWIvMHRr?=
 =?utf-8?B?ZHpaVUlqalc2bU1ZU24yVzduRVAvWFk1UTRkQ3d4QTlBUk8zM1Y4WExGdVZM?=
 =?utf-8?B?eXQzQ0ZpQ1FXZDl0ZndGZDRlelIwUjdYckFlYk95aDdrdkVXeXhQRTdSVFNs?=
 =?utf-8?B?b2R1MFF6R01hTzdmUTNZYnNLOVJ2a3ZhUGFkaDFtWnRzVmdPZ1ZxQ0dQVGNT?=
 =?utf-8?B?KzI3UjRvb0o4ZjZWWVZJSm1TM2ZUdWlNcGYxVDZObW8xTGpxR2dXbHpjSVNM?=
 =?utf-8?B?TnJxNlA4U1AxSnh1bS84RTdCL2xTWFFPbE5DNjRnNjJ3TXVuZ1UvamN2NFAx?=
 =?utf-8?B?NHBQeWVreHYwK1FKWUtjZU9TR0dqcHkrMFFYSjlJZytBa1NDM0k0ZWRpZ1FC?=
 =?utf-8?B?VnJUTjB5TmVpaVNsWk9XWU9OUTh6b3BvbUNiZUdtamtyWU50S2ZITHEvVnpZ?=
 =?utf-8?B?TFkvdllwaHhUaUx6U0x5ZWcvdEZndS84bWFtUFRpbDdDSVJNaUh1VTBOc05F?=
 =?utf-8?B?bktrb2V5d0tGdTI2VGM1b2NPZWdCN2E4VDJmRVdHN3J5ZjU2bFpYUFdVUUJX?=
 =?utf-8?B?aHNMdks3MWdMWndKb25EV2F5RXJmVTFPZEtwZDVTZFllbEgvL1hyU0VvTU9T?=
 =?utf-8?B?REg5eFFOTG1NeDFLWUswN3VwckN4MTdFNWp2dE1PenA3dVZML0JvNVYrNXNh?=
 =?utf-8?B?SXZrTGlKZ0JBaTNuTnZ4cVZsNHRJeHJBV0xIdDNBcDN5a2wzUkZxYU83YWIz?=
 =?utf-8?B?Q0R3QWF2SDF0UnlVRW9SeCtNNk03cEMrMzlSY1FSc3BWUXh3WDg5Tjg0eTlO?=
 =?utf-8?B?bmwxNFVyUm1RQzVUMFpianpyOUtPSjhkKzJvUnhsSDB2SEErMkFLUDdhRmxm?=
 =?utf-8?B?Yy9ScDVhdjc1ZnhXS2MzSnNKNUxLcEpXY1pTdDVYSEtTVm9UV0gvZ2hwYmRF?=
 =?utf-8?B?VFJCSDNnMGhobU5zc1BTeUJTbTV6VXVRcTlxdzVoUTJOd3ZRc1h4ZW9uOVB6?=
 =?utf-8?B?M0RBQlZMZUFTQUpYVGk0TE1OSkVFVDc0ZXU5TEFkSW9ieGtHMTQrWE9pOTlW?=
 =?utf-8?B?UnEzbDlFWDNpTWxZT0VDZlAxTzdlRUZYTUpNd2E4MjFzVHloL3hXaUt2R21K?=
 =?utf-8?B?ZldIdXEzM2VHeW5xR0x1b1d5RkxRN2toWTVZZnVJSWkyWG9lQVA2ZG83OFNE?=
 =?utf-8?Q?QPl9pri45AULmEwBqo70KPqmXVjT7UW5adl+UF9hzqgN4?=
X-MS-Exchange-AntiSpam-MessageData-1: hF1gFfOJhNj+kQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d1adf7-0538-4a7e-70c8-08df3b3b687b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:50:45.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aErD/fv+0uA0x0EsEI4gS4Ky3CxZJyhAA+xCBJRed0g5yVYb3YHG/ZvlYLZLV7VsIPY+Ckj85UQCaxftDQyXlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic falcon bootloader needs a descriptor in DMEM to know what to
> load, so loading it into a falcon means loading the two together by PIO
> and starting the falcon. The FWSEC wrapper did that through its own
> implementation of the PIO loading traits. The r000 load-and-execute
> bootloader event will need to do the same thing.
>
> Give the generic bootloader a run method, which pairs it with the
> descriptor that it receives, loads the pair by PIO, starts the falcon
> with the given MAILBOX0 value and returns the mailboxes once the falcon
> has halted. This will allow the FWSEC and r000 load-and-execute
> bootloader event to share the same code.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 55 ++-------------
>  drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 80 ++++++++++++++++=
+++++-
>  2 files changed, 84 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers=
/gpu/nova-core/firmware/fwsec/bootloader.rs
> index ad798ec5645a..c7bb877fcf20 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
> @@ -16,22 +16,16 @@
>          register::Array,
>          Io, //
>      },
> -    prelude::*,
> -    transmute::AsBytes,
> +    prelude::*, //
>  };
> =20
>  use crate::{
>      falcon::{
>          gsp::Gsp,
>          Falcon,
> -        FalconBromParams,
>          FalconDmaLoadable,
>          FalconFbifMemType,
> -        FalconFbifTarget,
> -        FalconFirmware,
> -        FalconPioDmemLoadTarget,
> -        FalconPioImemLoadTarget,
> -        FalconPioLoadable, //
> +        FalconFbifTarget, //
>      },
>      firmware::{
>          fwsec::FwsecFirmware,
> @@ -50,11 +44,10 @@
>  pub(crate) struct FwsecFirmwareWithBl<'a> {
>      /// DMA object the bootloader will copy the firmware from.
>      _firmware_dma: Coherent<'a, [u8]>,
> +    /// The bootloader that copies the firmware.

nit: doc change looks like it should be in a different patch

>      bootloader: GenericBootloader,
>      /// Descriptor to be loaded into DMEM for the bootloader to read.
>      dmem_desc: BootloaderDmemDescV2,
> -    /// BROM parameters of the loaded firmware.
> -    brom_params: FalconBromParams,
>  }
> =20
>  impl<'a> FwsecFirmwareWithBl<'a> {
> @@ -127,7 +120,6 @@ pub(crate) fn new(
>              _firmware_dma: firmware_dma,
>              bootloader,
>              dmem_desc,
> -            brom_params: firmware.brom_params(),
>          })
>      }
> =20
> @@ -136,13 +128,9 @@ pub(crate) fn new(
>      /// The bootloader will load the FWSEC firmware and then execute it.=
 This function returns
>      /// after FWSEC has reached completion.
>      pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falco=
n<'_, Gsp>) -> Result<()> {
> -        // Reset falcon, load the firmware, and run it.
>          falcon
>              .reset()
>              .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: =
{:?}\n", e))?;
> -        falcon
> -            .pio_load(self)
> -            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmwar=
e: {:?}\n", e))?;
> =20
>          // Configure DMA index for the bootloader to fetch the FWSEC fir=
mware from system memory.
>          falcon.pfalcon.update(

Does it make sense for the generic bootloader to also do this step
(falcon.pfalcon.update())? This appears to be something that's part of
what the generic bootloader expects to be done no matter what, and it's
doable just from `BootloaderDmemDescV2` which it already gets.

Modulo answer to above question,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

