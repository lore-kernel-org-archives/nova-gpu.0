Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044934;
	b=M6ogUNEzSzDkIqddJ3nx5YR20XtvcHsZS4jXPu7Mxv+MYAoGtto/fOsDVrXxFItFbsPg
	 kETtLMa5vaH1cETjiuaXWwnQuFklUtO8m+NOJzMM6yWjlTMyg0C99+912JA29NZLTVbmv
	 XDjhcUSUNqtycw/GB76iqW3S4fUFQ/QpJ+zDKL0BlgUqj5JaRDuNvegnHjczPJZRkj95c
	 Xc33OtoYhnp4P+FYHVdfHOoO6/7HJYfrTI5mbJhtB3pmJ5dtCQfm1uSfJK0gl2rLeWfep
	 EMZ9NtNVJpYfeQGM90dCgh6LBHjcQHrfpvHAy4yuC2mENIPwcVpXDi/ViM0MfzPzb/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044934;
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
	bh=pSc9p2Ik6Av7IawZjbq2eGpODiN+x4UqQaKdFE464aI=;
	b=pCSoikfb+5pdFNc3hlDkgb+KWyiLFMlb2PILks235Lt8TbKZNrRO9z+Fu8FzME27qA/r
	 Qd+kNm67ZF8YrpcYjLJH9NEoFZeskeYi+ZF3D8Pt6kYjE+gA0EHQj2DZ2DsziTulDX5Rl
	 gKcPhrh+s3uY1be2DqGZwhO+4eL5G1TouwAmH4pJQKoQMUJNha7yuq32HJNvGQdu/QHGg
	 9+5KWG+qALNf6VRJLjAeEFDRwbc33JV9yYQanc0bvvA55CwRdcg7HUaojCN5ABS7LWK6f
	 lO8/iFpG/knoimZVOAFGvw0EO134p5Bez3Vt0WpzOTAjl/A7atZtW9K4epqWnEJpHOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=htpUoL7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CA606A333
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994CA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=htpUoL7C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8f0Luik+/tCHqvwzFNXuaimSgMYJcX3PQgnHcZicYKj2Wd76HZeEDKeQwaVvZy7YsoGOGGI0i6fROWiSXFJdEQ1nTE2emwaYLmMATDZPXXW8dCe0a/HrShZOwSl0wNNWNBht7T211WNUtBZRTc7eiYEBqcQzIrR1Rf7DtOducusyaM5O4tKqQGz5wLtR7E2OUBui6Wf4nTqVDe3iEjImChFM63rtHZwdZeWVt64ZRZRaAKYFA3mQM8nuFqipQtfGE1LldPu1sKRoPTm9YF+0jGdxyJX4hrdhUftXdIqH/vXQYZLkMddTeDg1EJN/+N+U/C8mJ6NszY1p3hZ3rKHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSc9p2Ik6Av7IawZjbq2eGpODiN+x4UqQaKdFE464aI=;
 b=x2iurYTY/h+qWR5npNG+2OpbTQSkxOxTjFXmTggcAkiqJj3a6Jy7rctnfgkI10kpFemy96klLThUlQ4D0NYHlGiL7FmULt8t5HDnYtxM4WQabFwvvZ8KT1S8EgHkeJY+BRKuwK9V4G1ZjEy6Ds4jmaRgqky8fpUNG02Awtn/rauZodBFl+0GGUREBdgFwx7OJa9GRRkWluJ9yObPRTECmtIHgPqqD7h0hkiHV/2QweDQMp+H0DvwBI8YZ7FdnDc1SWbqES9oBKJ0cYbkNAXEt6NLQ6LbyQOjqUstSVY6UheATkadlaoIWvjD59cN/z5A67McQJrbnFXwZzRKIebQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSc9p2Ik6Av7IawZjbq2eGpODiN+x4UqQaKdFE464aI=;
 b=htpUoL7CHj3VZjMFIeKuRmfAVlu+mQkcUFcx8vWG4A/+dgxlNar29ZzLvKyHQOabjJzLNogbzKaDb+5VHb7tKXDOf+Bk6UAdLQ1SOOiH3xmzFZD9AeE4APdaO0MPZ308HRtg0P5yYpRe3uTFFUoGxfA9s4Zuju28ZPqYuKoK47QPt9qkZQaqaUCLoV92MNztZcH/siwHzwwHc3M5EmkqAvDyhzjklRcn1VS07jwETdQJeWcDgkkF2UL9Qku2baNaEJycBZWyfhMD292V9+uzU73M2RFpN676kkxLkaoBqBajlHMuX0OSy6xGT+ehUHOQOowNO6fPWhSli/fu7hxZQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:03 +0900
Subject: [PATCH v2 07/12] gpu: nova-core: falcon: introduce and use
 with_fbif_transcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-7-fb37cc5b20cd@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0035.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::8) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a4abd1fd-4a36-41de-c71d-08df3cb4510e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	i80xMMmkof2nm9Q0vA0JTcxiD0E+hluV7XBlxs6cuceJUD7wmy+qQsd/KFZNGqir46HYGx4BEnZmQNtabH2TcMiXyREuP4iyayOGfV6PhA+TzQ2crsrZLPRXX7eCUMt37h9CO6JGV2YjnUFZcTtVpxZYB+yqOPIDVHIgcLfo0EHU4LCRg0bSxIe3hPMfOQEJCM2wKs+osBvSv6otNRRVypmDbo2UHDdStSfRczeDojMl/Uco75I/dyTx3g4YsjgqHNTE5SG1D8mSJE2s9CWL7R28MiHDYdvzgDFh2EmVTiaX3zCETC1ukYYQrbH3lrhTYg1/qhzQCuN6Jif2gIP9tEb46JiM4Lo66/PiIRsiJvbKloC0JAKLFLqTX5tNaED7k5brh1VhNA70iyfrVRNs0tmJc13OLpYriWsDPGqlDiokWwiwSiSOUmze3DQsHWtxxGXf6kMGE/4tSbWpV+2wbAoeBULz/+4+JnOi2zKTMdg94BCdu2CbCQM92zjKCvY4NFHiK37IwCsmAB7KyLZ+cqCf7nVglHeCeNxjbkiGyEGdzplV71qu27Uije2Fn5g0PrfekUZ7zMf396+NamPS6vOn4KvIdFzpc+txALz65zPdaUbOvfjJAs0iGCv9FImo8tqMRVTdSDjXTnHVez6TkWx1yUUIw4VmT7/y5u9UlIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1JUUWtsQ2ZENms1bXV3ZWI1ay9VYjFDTlNsV29JWDVsdkpGTGNvZ1JJUkYy?=
 =?utf-8?B?bWh6Q01GbFB4VDZ5YlFqL0dKK28vbUZFWkEwS0FMWXFXQlZUY2UvTHNiN0Vo?=
 =?utf-8?B?eGhIdVdXQ0xOSEVObWdpOG9zV25qaytCT2oxWEYybW5XbmQ5ajYraC9QcWFU?=
 =?utf-8?B?S3pvRkQ0TFgyRkd0ZGtMMTQ5T2FUL0EvbVlrRUIyUjlhRDVVbDZ4WGVINVU2?=
 =?utf-8?B?R0VmR1B4QnBpYmdHZ0FjbTM0VU03WTlsWEtaYjNxb0N2djNHK2NtaVB1Ujc0?=
 =?utf-8?B?UFJGcElQMnQ3empkNVF0azRnVHNYRVkreWlXSTJnM2FNUHFnQ0R6clk0RUdz?=
 =?utf-8?B?eVRlN3V5SFRuM0VWZFd6RE9HeEQ4dTZuckZuSURCN0hVZTlrMWhjK2NMNVNH?=
 =?utf-8?B?NFZjVzJuUjkwdXg5VkxzTmx0Zm9ESTVMWjVsb24wQnNUU2xpWitvejBUbWl1?=
 =?utf-8?B?SlRidVN6YnFrRVlrdE1xZmlYaWk0UlRDdSt6QWpZZG9rSkRKaGxJa3FxejNm?=
 =?utf-8?B?TjNuZFZrM2toZ2dmdFRWbDk2Z0I2cWY3VXdMNXFUandRL1JFbENHNkVoZGJF?=
 =?utf-8?B?aGtIajhYb1dCZUYrRnhrV3RmQ1VRTmM1TmUyTEdzQWprL2tTaFEyUmJrU3h1?=
 =?utf-8?B?eXo4bDhQQ25qdlhoZlhZcHlEZlZxc3JTZTJ1djlkbmJ0cmgzbEpXQWtqL2tW?=
 =?utf-8?B?b2FCbnFiWFdMdnJEZ1pIM3g3cUthK0JreFF1OUUzalROWkJnMnVuQkZKeUtZ?=
 =?utf-8?B?RWhQbk1tSHVJeUJSVnNSTXdLeW9WMThEaHNpamk3d3QycXp5RlMyWWZ1bXJP?=
 =?utf-8?B?dExzSVBYQ2NkMWp5MmdhRUkwa2oxTVJHUzlOQ2cxMU5ha3ozZHRCMWFHaG53?=
 =?utf-8?B?UDRNVVY2Ny9TNzZ3K1Jlam1PL1J6S0tFWWtVYVFWRnZaYldTelhaN0NFR0Z0?=
 =?utf-8?B?YnFlaWgxSmpLbGx6U09FUCs1M1kwSGZsaCswa01kMVI5V1lxY1M4dXdsNkJJ?=
 =?utf-8?B?VVRCYkw2M3NaU1FqUUxub0t4OVc0Y3NsMHZWRmRKYjJYMldITWlCU0taaVNr?=
 =?utf-8?B?NnpCa0JmU1liSTJGdk1sTGg5WGZSdlF4eFVSeDV1MitndVZjTkk3Y0t1a0Fp?=
 =?utf-8?B?Q2RFblBrRDcvbzF2NWZOSlNTSTlxeDdEREQ0eE45S2JpMVNFa3BuRWd5TFhj?=
 =?utf-8?B?TWJhTThPeHhDRlNqcVlwLzBla29qZitwdktkelZTRlRlV2FlWXlsdDlTT3E3?=
 =?utf-8?B?RkE3STJ1WGF0U3hsbVBOTy9haEdpRHZMSGxSQTJMQkd2NGl3RytsYjZRVWRB?=
 =?utf-8?B?eFE5L0M4NTZQMkpsWkFEUXRXbWU2WDRNNkpyMm5pV052d2oxVUNkZUJrWG9I?=
 =?utf-8?B?KzVpVitIM1QvUWg1N3lvOERIVEJKdUdTK3AxK2NoOHN1b3dKY1NFZlpNNmk1?=
 =?utf-8?B?VDRLUkhTbEkvSnJNZDNENWpqY2NSZDZsekZPNjJ5Q2xVWFlqR2JIek5DbFlV?=
 =?utf-8?B?MHpDVnVlVWhjM2RxcFM1M3E0WXJNOURuSVN2blBYRFQwOXhSdDFUOHJLNURo?=
 =?utf-8?B?bnl2SzZQNWwwSzNOUUsycEtHbG5xZy9JWVA1YUlDUUhsL2lCKzgyR2IvWkd5?=
 =?utf-8?B?bHN0WUtyZ292dGdOM1NnajhjUkdha0tUNjRYUk82MkQvS1pTWWJjWmR3dDJ4?=
 =?utf-8?B?b0FEUC9iaHZvRHVIaW9Tc2FLZ2ppRXY1YXN4QU8yOHdZLzFwaXZHY2ZRbjJl?=
 =?utf-8?B?WklPNk9iME9BTGFEVXlJSDdtQ1pTd1pvMmxnSG0yWERVMkxDc3BrZDJGOHpS?=
 =?utf-8?B?WFoyQnNsb09mNmxYcEVhUVozdVNUOEJ4UXp4eFFvSDVWeC96SkJLM3N4SVJt?=
 =?utf-8?B?QkhKOURxQ1Y3cVoyQmltcWdjelpSVldvN3JCQUQ1cUxLNFozQUZJaUMreVNJ?=
 =?utf-8?B?cTVhZHVTZ2N0M0Z4WjNlMDBST3luU1ZKdm5qZ3dySDR3UExxSGx4VHhXM2R3?=
 =?utf-8?B?MUxmWHhRUmN5UGduQ3ZOU2tKYjBOYTlBOUlRWDhCN2krMHFjZFFQT2x4OGdC?=
 =?utf-8?B?d0N3OHZybU1ndHpxSXAxQkIwbXQ1cUh2bGo4Ym8zNFpsM1lENGZXSjBnZ0Ji?=
 =?utf-8?B?WGRuZjFCKzRNSFFBOU9jMU1LTHBEdzlsUER6N3VwVTd4Y1FKRFU0L1F6cXJy?=
 =?utf-8?B?VGlSTmsyL0U0UFE0UUlTSmE5U2ZHTy82NXZYQ3FtbXJqVERhYnhzc0VMbUgy?=
 =?utf-8?B?VWJxWW1aY0pqTDhyYnBxR3haTThuWG1WRlBVWmZFeTJvVzdaT2paS3prZStN?=
 =?utf-8?B?UlRlQ2lqRGN0TzZleFZXbS9ZQlV0dG5ZQy9ScWlpWVdtV0hROFZ2UCtYTUtz?=
 =?utf-8?Q?CTOyUlpnlmZG5aFpJ5+5M5ECef48G7f7yAc6U6KhelBAa?=
X-MS-Exchange-AntiSpam-MessageData-1: HoIMhFAvvXv26w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4abd1fd-4a36-41de-c71d-08df3cb4510e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:46.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHRjV8kjmLrdA6+KD3irUzWI41AxdfMApVdsLQ2p6co2A4+uQ9ZcgBvSfBihP4ZVy/CGUhTi2vVU4Uql9Geexw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

The generic bootloader programs the FBIF aperture of its context DMA
slot and leaves it set after the bootloader has run. The r000
load-and-execute events will need to do the same with apertures that
GSP-RM chooses, and should not leave them behind.

Add a falcon method that programs an FBIF context DMA slot, runs a
closure, and restores the slot's previous value once the closure has
succeeded, and use it to run the generic bootloader. The slot used by
FWSEC is now restored after FWSEC has halted.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
[acourbot: extract from later patch of the r000 series, convert unneeded
 call to `update` into a `write`, only check the validity of the DMA
 context once.]
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                  | 30 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gen_bootloader.rs | 28 +++++++++-------------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b17a997860ef..ad497a5704ec 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -513,6 +513,36 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
         Ok(())
     }
 
+    /// Programs FBIF context DMA slot `ctx_dma` with the value that `configure` returns, runs `f`,
+    /// and restores the slot once `f` has returned `Ok`.
+    ///
+    /// The slot keeps the programmed value if `f` fails, since a falcon that `f` started and that
+    /// has not halted may still be reading through the aperture.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falcon has.
+    ///
+    /// Errors from `f` are propagated as-is.
+    pub(crate) fn with_fbif_transcfg<R>(
+        &self,
+        ctx_dma: u32,
+        configure: impl FnOnce(regs::NV_PFALCON_FBIF_TRANSCFG) -> regs::NV_PFALCON_FBIF_TRANSCFG,
+        f: impl FnOnce() -> Result<R>,
+    ) -> Result<R> {
+        let transcfg =
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(ctx_dma)).ok_or(EINVAL)?;
+
+        let saved = self.pfalcon.read(transcfg);
+        self.pfalcon.update(transcfg, configure);
+
+        let result = f()?;
+
+        self.pfalcon.write(transcfg, saved);
+
+        Ok(result)
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_obj` into the falcon's
     /// `target_mem`.
     ///
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 1fecb6a5f80e..252f6ac2d14b 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,10 +7,6 @@
 
 use kernel::{
     device,
-    io::{
-        register::Array,
-        Io, //
-    },
     num::{
         Bounded,
         TryIntoBounded, //
@@ -39,8 +35,7 @@
         Tlv,
     },
     gpu::Chipset,
-    num::FromSafeCast,
-    regs, //
+    num::FromSafeCast, //
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -230,22 +225,21 @@ pub(crate) fn run(
         target: FalconFbifTarget,
         mbox0: u32,
     ) -> Result<(u32, u32)> {
-        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(dmem_desc.ctx_dma()))
-                .ok_or(EINVAL)?,
+        falcon.with_fbif_transcfg(
+            dmem_desc.ctx_dma(),
             |v| {
                 v.with_target(target)
                     .with_mem_type(FalconFbifMemType::Physical)
             },
-        );
+            || {
+                falcon.pio_load(&GenericBootloaderLoad {
+                    bootloader: self,
+                    dmem_desc,
+                })?;
 
-        falcon.pio_load(&GenericBootloaderLoad {
-            bootloader: self,
-            dmem_desc,
-        })?;
-
-        falcon.boot(Some(mbox0), None)
+                falcon.boot(Some(mbox0), None)
+            },
+        )
     }
 }
 

-- 
2.56.0

