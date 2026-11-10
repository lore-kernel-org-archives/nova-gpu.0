Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305776;
	b=Dl4BCjD58YqsrfGnz53jvyf1+91SVyY9UW3SUpsrotIuAwqGhUcV0fNeva4UTeN7Enw/
	 byCUpKLuZaGgoJCAW+otwzam3BHqfu0TK2Zgp2L4j+yvKMW5njcF3cKiYPidafrofRoeG
	 qz2MTmInKehSHXOpJFSU1fryD0hLFKAf+le1qKEDxMvDD/S3fK4IKpxVA7VMO1sS8phPf
	 v7IUHdVn/8GW98yvi/GI8mbTraZFhmj+s8Y9HzB7UGRAm/q37HTDzUacIgSbejISU+pWm
	 aHATpZTbksxsBaXweUWRKcpyndjXsWDztsxWP0z4dHX6kzWTW50P8M7iJjxPJiCcpkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305776;
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
	bh=yWJLGCoAKpZc8g4dx45OozLFDFz2qlKqs0WaTo3/ME0=;
	b=4e09VHEB+rdYa0H35Au9nJvxSNKuR3AhOhVc3EKlEgrRXAFXBC/X6rJa+1w3WDX09tl/
	 rX7uKY+Fa3sWsQqk6r62p7fvzHaW+ZBD1Qm6g5pudidQbabZ6mTltAMnfA3cvuO8rtgyB
	 fhlZTIZOWbQEmZIZ2hGKgfo+Ww1b9I3WK7oUVftw4KTd5q3TdMDBsRG4mWZZdlYJS0Tgj
	 LEUToYl29pq5qZT4wD7DotomL5M0o/i8y0ciUnAMGcUa0g7OGBCmb0PY1kRf0YHgYCCdB
	 WvOz7oMpkpKG6r7BcHBIcPJ5jNThqmolZF3sPQ5Hgl8OiTILmjnf8BXXclDACmQFpFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y+fDjdAj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.15
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A37606A325
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A37606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y+fDjdAj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWOJbB8e29vujEnJPEVPB3gW3oLapEB300+TKqf0SBE1fWGPrmAM+E+KLW42ZllRKRtc2+mPY1zfTLEYRPZWPWWG6lssVGIOlxyKaJtGVgbbekAqlLfQGxNHOm4nZ1wWeqhHl6zlQ2OQ5yM24NC/LmzFvUmPV40RmkYrrVdpK6nXMYeKuEcbRCGY4Ou8V4VbDMNw4YGRrHDuzeYo40gxLq1onJ2IBLirMoh0mm+ryegL4GEFg1NhrFrmkzWYgk/16lXtBft72MaIrV4wrbCR/mbdSW49vT8dGcLfGyLKZazLwEU49W7/FHobg9fUVZIAj43Ek4h8f6qLjKrrk+cbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWJLGCoAKpZc8g4dx45OozLFDFz2qlKqs0WaTo3/ME0=;
 b=kLchYBDgHm3otWzUlWtKlGz/3HXSOhoBRKlHN/CRQ8GiFeiQtclljkx9TdcC5JPvEKhLi2Pvd/L32ZalugJO0Q7LKkpPDh6PYkX2G9hdYEZtVOFYZLQ7dQ8u4jgiBWkT3HychmzjB9V4Q2+yI+JOcWXQqjOGvqi3ThMvY6/wUeq/Ouz5y1ivmOipcCwu2hR/Lp1+BPL03I2vPZSYG7XUhYU3hqIIzmush5ZKvIBN2njdkFgDV//fxGFlwypX3OpDHewzvstfJg3eyK2Cf4cBxHRsN4He8GCNPsXI0Ab7PPeHBwe+g/QU7ylxOrVqLwjOQ7igISQ1RnZ4/XFcLfEuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWJLGCoAKpZc8g4dx45OozLFDFz2qlKqs0WaTo3/ME0=;
 b=Y+fDjdAj36U7F5+lBfTNGSxJss8dZ4tlZPjHPBzU38JMLdxFs7aBHgtv6Dhp7ozrT/gXjiSU+rVgZiRi6gBzQbByIZevIZH/mVy1AR5wU2hrKd6SyoJQXkyrxKjgjnORWy+Qu6O3Ziw5Ngq0D6gui7LHyL4HhfiDVLSvJWlUbw5wrZJmjN5b7bsz27eDvEmjVVFzMtwcY7NDcoapB9JvaP9p0h/1ec9DkS+pLYpcPWjjRJMHsIVaPRfXf6z+tjK4Fc/hUtSID7jlDVlu0SUzEkVn/Xd8cbsZrD2/2mukkLmSqOUPH5uxJHByl+bG8JMtKoejcz3Eyj5p7vGy9B2D5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:16:12 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:16:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 19:16:08 +0900
Message-Id: <DMRGB6PDW9CV.2G3COXLN6VKOJ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/12] gpu: nova-core: falcon: allow DMA transfers to
 read from a framebuffer address
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-10-fb37cc5b20cd@nvidia.com>
 <DMQI0G2K6Z3B.1YEH6D2ZILRBI@nvidia.com>
In-Reply-To: <DMQI0G2K6Z3B.1YEH6D2ZILRBI@nvidia.com>
X-ClientProxiedBy: OSTP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:224::9) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 08469673-7d39-4e4f-0897-08df3f13a524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|4143699003|56012099006|261021135927099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	r3PZBGvn54HsKYBVx0tAQfkABxZKIs+9+3agxUspjPlyoMSGHDZpKkglxJrZXFj8MuJA+GEHw9dtOlCvqPk4MoUxDw0XiUXNyF3VfLgm9UOw/rvgUuLUaRrC0VrE+L/tZXLw63Eie5Ty3qzwn74fPTJ7ALL3o2HatGOMnpCrWiHYZAdOThI3le+0IU9wjVfo569CfL/QSAuLkUHqmCO8fsX/mGn3y7oJ2gbwR9KiRRfR7mSw4pxfeb5nrPDY/wihfEDb2sAQE99mslTGAKIGIO88KDlCMKl9h2b2UBG5BAiWVBV7C3/okddSRkgFmv0yWmmo1FDfcPLZmNV9uaF8QL8ZGkR4o3go4xlXJHTKH9bHmNjuwge0GRYCieIClHKCRE90a1pldS4wiJVRHXa10iemuyPAG5ow0plMv1nnsCURFIS0WEhj7AnNrU1x0NcG4Hfa+/Cy6wSdxvmn3wWbkQ7W10rpx5gB0JlY6JH3zLUwa74DxM0nrOY8VIVzHDpQVN2JTW/l9f+r2iFQ1PHevrRN3B/l4mZbifVZqBEFKrZAr8bMM0M5hNUEfc0fAHtQeRXGsaSoLn/LZ1iWkhGuA384Hafxtw+CNxE19Oi3StO1Fzq2WM7QDSUGihPoNdqwslqq6hJGNyj3QkGOE8fjrr00T/wvC4kjdpAngkGPF9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021135927099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ulkvd21tMU03MVZuUDNVSTBlK3phQ2gyb1B6Q0Z2bFBmTHRZVFY0RlpJK2FV?=
 =?utf-8?B?ekhpNzNLL1NNSjFBdjlTU3dhYlpXMWJvN2t5VW54R2NEMlJic2VDTnRNN1ho?=
 =?utf-8?B?dFk2MzB5ZmVydG0zN2dRUTlsbmd6RWVWWHhIYUpGeThTK0JyMlcvQXUwWks5?=
 =?utf-8?B?YkVTZlFKL2xZMXpoTDcvWk1DRXVRSmdmcStQQm5kdHdFYjJNclU5alJjTTZS?=
 =?utf-8?B?QUZEYWk3RGFwMzY1aUFmRHlOUndkUlk3Nlp1MEF1UG11SHlWTnE2bzlKR2Vj?=
 =?utf-8?B?RzI5aTJZbExPalV0WStmNlkxU1VzRGhwc0RJTTQxTlFQeFBuak5hRi9FajBk?=
 =?utf-8?B?SEtVbVFYeEk4cGJkdkRTUkhzcWFOcS9IZkd3dUlWZUhyK2lIdE9NVVcyeG9R?=
 =?utf-8?B?bFpNZXI1Z1BsTVNMekl1TnJNOGZlQnRiNFZUNHR0WEVFQnp3QTE5RFJRd0pC?=
 =?utf-8?B?Tkt4aEhJaUhNNWFpNlVkZHB0cWdIZFhWWlY5QTNIdndybGtxL2JOREt3d3B6?=
 =?utf-8?B?OCtNaVc2dWo0OHBBWlF2WVFEYkZGL3R4cE5KQUkxd0U2OWhJWW5SdUpHQTJN?=
 =?utf-8?B?TEZVS1dlS0U5djNVQUo1YXkzcXQwdU9FZVV6REhTd29MRnAyUmlQWWZhanJ6?=
 =?utf-8?B?QmVJc0I2QXBiYng0a090UWZQMFVyZTNNTi9Qb3J3T2lkS2dkZkZYR1JUY01Z?=
 =?utf-8?B?Q2VjRnRRNzlGejE2aDBFTkV5TEpUTGVVWjd6SUcrR3JMM2MzcjRxa2JrMTZm?=
 =?utf-8?B?U3BrN2wvZlhqN1JmY3AwSW43SldoMzRQVEZrWmdWZ1VRRHBjY2JLQktPSGRU?=
 =?utf-8?B?aFdkeExXYU5XS3NrRnlUV0xjSzJ4R2JVc2NDTGhyOW1Jb1owakNlL2dYYXEw?=
 =?utf-8?B?TWR6OGpaTUFhNWhUaktrRTZXd3ZkWFNJMWxmWnU3dlhYVDZmRk5aclJrSDcy?=
 =?utf-8?B?bUc1ZllDQkxsNzhmRzNBQlJPZzFtdFBPY0EzcllLaGdJdkZWeW54RHBScHFF?=
 =?utf-8?B?ZVhzS09HLzhJaVUrcjhHRUhORTVYcWFwMmhZTnVOT1kvNFRkckJzdk5Eb2Uy?=
 =?utf-8?B?NDhXdFpXUGRSUGNPRW5sdFJ1VUZZVlIxU0lNRnBuMU15MEJzZUl2RWl2WDZ6?=
 =?utf-8?B?b3NuTUNmWVZPZFJzOC9XVWxkTU55aG1DZHBvVWdQQkc0Z0U3OEhRTitTN2x6?=
 =?utf-8?B?MVU1U2FGQkxiV0pLY2NUZy9PZzdId0lJQ3VVaWZ6c2l0ZUVsa0dzajhXcU9E?=
 =?utf-8?B?bTI5NEt0SURCcTNBQVBYTkpmQU00eWlzK1V5R3RsdnFzcThSWmRTSEsxUTkx?=
 =?utf-8?B?clZmdHllSXp5RERPR3hDanRsWm5sdk45NDhCNWIzTjcyMW5UOUFDTXZwbTI2?=
 =?utf-8?B?TUUwZ2c2ZUREMW5mZVNwSHE0QkV2UlN6MEp0eVp5bldwdVBhY0J1ZVZnZnhR?=
 =?utf-8?B?ckU1RFdYYXg0M2h2K3Z2SmFUQ3BlUUVXaVcrTWtsNXhVMXlJRjE3NjR4MEJU?=
 =?utf-8?B?Q1daNC9Lc3A2TlJSaS9TaWgzbk96N0toVjNKV05mZ1UzVTlPVkdzV0lCeEdr?=
 =?utf-8?B?NzhMVHBNZUxrSG5JSmdCSGRvbWUweEcwVlpvdUd1YURZWnQzQ2dPcWEwSnBw?=
 =?utf-8?B?NEJlc3hMUFlxUFlrOXRMZmlDR3lXZzMxS200TEF0YWRTS2ZPZDdkb2ZZVmMw?=
 =?utf-8?B?cXBBQlUzOXhTamZjQ2hjTW1uMHNpWFRyRDZ3aFIrZ2tieGhkL3ZIa3RZRFov?=
 =?utf-8?B?TjVXWlZUd2p2anNiQm1MRkZ5UW1xbDRNM3RLTFNEbWE3S1VDWGtSSWVvbFBy?=
 =?utf-8?B?OERJMEx0ZEttQlEzTld3amVWRjltd01VOHJoMTZZdUthR3RrOStqL2lNVUU2?=
 =?utf-8?B?U3VUbFhFbiswZmt5VCtHS0FWUE9kODJMS1lGNDY0WDVjMG1DS0RDcFJuNzJQ?=
 =?utf-8?B?ZGwwd0VkVE5McEt1RGJOeEJnYW9VRlE5T1B6SnpEemdLakc1d1J0alFWQWU4?=
 =?utf-8?B?TzE0cjN5MWZ2RTlJQzZWYzkzeEVNUTJFT0JkVlpuNkN4ZkcvQUNBbFZpb2lM?=
 =?utf-8?B?UlU4V2RsOTQ2ZGltTTBDMllObjc0a0tQUUI4L2E3UTR2Sk00Ri9vUTFuS1hL?=
 =?utf-8?B?SFUvb1Z5RW9FTlc4cW9pNnlLeVA5b0Q5enc3YjZwYzk5VFJFQXF6djVzaFd0?=
 =?utf-8?B?WDcwZlJhcm1pYm42REZwZ2JqMWV6R3VhQlJmVjBYZ0hxcWYvVjNiNWRzOUxR?=
 =?utf-8?B?dFU3UVU4L3NTVEpwNGxaNkVjaFd3WG1FUTBBOW0rcEo1WlEzbmpQRWNUVTRJ?=
 =?utf-8?B?UHVtemEzZG5HbDVqUVRXQWY5cG4yZFdqa3ltUnZkOGN2RytVWEh2ekt5OG9z?=
 =?utf-8?Q?R3SKqru9DQbIqqw/+6lJBuuMRew9paoRO34KkxtjK/1+a?=
X-MS-Exchange-AntiSpam-MessageData-1: kL4ZgEruLiE6rA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08469673-7d39-4e4f-0897-08df3f13a524
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:16:11.8630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEK2BfzsGGLdIoYMG0JpdeKZadKWOEuRuLTboNEv8cGSDOK0tqkCLiTgeP+HkNgpABz8Ynrn9zDR266y0BAt6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

On Mon Nov 9, 2026 at 4:23 PM JST, Eliot Courtney wrote:
> On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
>> The r000 boot protocol has a load-and-execute event in which GSP-RM asks
>> the driver to load a Heavy-Secured binary from framebuffer memory into
>> the GSP falcon's memory by DMA in order to run it.
>>
>> Nova-core's falcon DMA loading method currently only supports loading
>> from a DMA object that the driver has allocated, so there is no way to
>> copy an image from framebuffer memory that an event supplied.
>>
>> Address this by making the source of a falcon DMA transfer an enum,
>> which can be either a DMA object, or a GPU framebuffer address.
>>
>> The framebuffer address source has no user yet, but will be used by the
>> r000 boot protocol.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs | 65 ++++++++++++++++++++++++++--------=
-------
>>  1 file changed, 42 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 00da664887fc..b63265abd263 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -140,6 +140,15 @@ pub(crate) enum FalconMem {
>>      Dmem { tag: bool },
>>  }
>> =20
>> +/// Where a falcon DMA transfer reads from.
>> +pub(crate) enum FalconDmaSource<'a> {
>> +    /// A DMA object in system memory.
>> +    Sysmem(&'a Coherent<'a, [u8]>),
>> +    /// GPU framebuffer memory at physical address `base`.
>> +    #[expect(dead_code)]
>> +    Framebuffer { base: u64 },
>> +}
>> +
>>  bounded_enum! {
>>      /// Defines the Framebuffer Interface (FBIF) aperture type.
>>      /// This determines the memory type for external memory access duri=
ng a DMA transfer, which is
>> @@ -544,13 +553,10 @@ pub(crate) fn with_fbif_transcfg<R>(
>>          Ok(result)
>>      }
>> =20
>> -    /// Perform a DMA write according to `load_offsets` from `dma_obj` =
into the falcon's
>> -    /// `target_mem`.
>> -    ///
>> -    /// `sec` is set if the loaded firmware is expected to run in secur=
e mode.
>> +    /// Perform a DMA write according to `load_offsets` from `src` into=
 the falcon's `target_mem`.
>>      fn dma_wr(
>>          &self,
>> -        dma_obj: &Coherent<'_, [u8]>,
>> +        src: FalconDmaSource<'_>,
>>          target_mem: FalconMem,
>>          load_offsets: FalconDmaLoadTarget,
>>      ) -> Result {
>> @@ -563,23 +569,32 @@ fn dma_wr(
>>          // For IMEM and tagged DMEM, we want to use the start offset as=
 a virtual address tag for
>>          // each page, since addresses in the firmware (and the boot vec=
tor) are virtual.
>>          //
>> -        // For untagged DMEM, the start offset is folded into the DMA b=
ase.
>> -        let (fb_offset, base_offset) =3D match target_mem {
>> -            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMe=
m::Dmem { tag: true } =3D> {
>> -                (load_offsets.src_start, 0)
>> +        // For untagged DMEM in a DMA object, the start offset is folde=
d into the DMA base. For a
>> +        // framebuffer address, the DMA engine adds the start offset to=
 the address.
>> +        let (fb_offset, dma_base) =3D match src {
>> +            FalconDmaSource::Sysmem(dma_obj) =3D> {
>> +                let (fb_offset, base_offset) =3D match target_mem {
>> +                    FalconMem::ImemSecure
>> +                    | FalconMem::ImemNonSecure
>> +                    | FalconMem::Dmem { tag: true } =3D> (load_offsets.=
src_start, 0),
>> +                    FalconMem::Dmem { tag: false } =3D> {
>> +                        (0, usize::from_safe_cast(load_offsets.src_star=
t))
>> +                    }
>> +                };
>> +
>> +                // Upper limit of transfer is `(num_transfers * DMA_LEN=
) + load_offsets.src_start`.
>> +                let dma_end =3D num_transfers
>> +                    .checked_mul(DMA_LEN)
>> +                    .and_then(|size| size.checked_add(load_offsets.src_=
start))
>> +                    .map(usize::from_safe_cast)
>> +                    .ok_or(EOVERFLOW)?;
>> +
>> +                (
>> +                    fb_offset,
>> +                    io_project!(dma_obj, [try: base_offset..dma_end]).d=
ma_address(),
>> +                )
>>              }
>> -            FalconMem::Dmem { tag: false } =3D> (0, usize::from_safe_ca=
st(load_offsets.src_start)),
>> -        };
>> -
>> -        let dma_base =3D {
>> -            // Upper limit of transfer is `(num_transfers * DMA_LEN) + =
load_offsets.src_start`.
>> -            let dma_end =3D num_transfers
>> -                .checked_mul(DMA_LEN)
>> -                .and_then(|size| size.checked_add(load_offsets.src_star=
t))
>> -                .map(usize::from_safe_cast)
>> -                .ok_or(EOVERFLOW)?;
>> -
>> -            io_project!(dma_obj, [try: base_offset..dma_end]).dma_addre=
ss()
>> +            FalconDmaSource::Framebuffer { base } =3D> (load_offsets.sr=
c_start, base),
>>          };
>
> I think this code is simplifiable. The `Sysmem` branch computes some offs=
ets
> based on `target_mem`. But I don't see why this has to be specific to tha=
t
> branch. What we could do (and what openrm does afaict) is just split that=
 out,
> for example:
>
> ```
> let (fb_offset, base_offset) =3D match target_mem {
>     FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { =
tag: true } =3D> {
>         (load_offsets.src_start, 0)
>     }
>     FalconMem::Dmem { tag: false } =3D> (0, usize::from_safe_cast(load_of=
fsets.src_start)),
> };
>
> let dma_base =3D match src {
>     FalconDmaSource::Sysmem(dma_obj) =3D> {
>         let dma_end =3D num_transfers
>             .checked_mul(DMA_LEN)
>             .and_then(|size| size.checked_add(load_offsets.src_start))
>             .map(usize::from_safe_cast)
>             .ok_or(EOVERFLOW)?;
>
>         io_project!(dma_obj, [try: base_offset..dma_end]).dma_address()
>     }
>     FalconDmaSource::Framebuffer { base } =3D> base
>         .checked_add(u64::from_safe_cast(base_offset))
>         .ok_or(EOVERFLOW)?,
> };
> ```
>
> Alternatively I think the following is simpler where you just always pass=
 the
> base of the DMA region and use the offset param
> (NV_PFALCON_FALCON_DMATRFFBOFFS), but it's not what openrm does. That is,
> tag=3D=3Dfalse case it doesn't matter (?) how the offset is split between
> `fb_offset` and `base_offset` is so might as well make it match the other=
 cases:
>
> ```
> let dma_base =3D match src {
>     FalconDmaSource::Sysmem(dma_obj) =3D> {
>         let dma_end =3D num_transfers
>             .checked_mul(DMA_LEN)
>             .and_then(|size| size.checked_add(load_offsets.src_start))
>             .map(usize::from_safe_cast)
>             .ok_or(EOVERFLOW)?;
>
>         io_project!(dma_obj, [try: 0..dma_end]).dma_address()
>     }
>     FalconDmaSource::Framebuffer { base } =3D> base,
> };
> let dma_offset =3D load_offsets.src_start;
> ```

I like your first option because it is basically a no-op with sysmem
(and also the diff looks nicer).

Option 2 makes the code considerably smaller and easier to understand.
The offset we store in `NV_PFALCON_FALCON_DMATRFFBOFFS` becomes bigger,
but that should still be ok as it is 32 bits. We are computing
`end_offset` as a `u32` anyway, so we would have overflow if this was a
problem.

I've tried it with both r570 and r000 and both passed, so since it is
shorter I will add a patch to switch to it (having it in a separate
commit makes it easier to revert if need be).
