Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793598414;
	b=pQUk6g9eWkOFxU0GLyhrENf5ou9J6FMQA5zDArgorsNEepeeMBIRXmmW3JcKaBF5k7jf
	 i0F2M3mPIqDYIB6vLCapPSgGrr1FYhdxGthHE6PXsAdebNFj6IOMOW4M1laBpfvY2igSh
	 DXMcEh2G6HASLK5CRJ2HJFmAmBImhI134YXL+FX0vcPZ6cPfb9XFT0mgvRkLnQv3lu6Uk
	 Gliyau0I1yyQLoS+N3YSG+IG2cyg12++XL1QiJDLxZrazs1qPal+D81VHfgLEDXEJ99jr
	 ikHopqI3lmkTKuBZHoRhoNgNb/odOHxWeMygUkFttSwpBI8KHVE95MN7ncvNFXtknsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598414;
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
	bh=o8ed34RJVl0kcaElnRK+vljUwKi4d42jeQ9ACN7mslQ=;
	b=yJESsATiqR7YS+Mqp3JxEJbIkdXqgQT0yzndvndm4OinJXfF9A7b63L03ryVc3kNHm9D
	 hd3aCv9znoFo4xOuZUd16Wc0yqJcdybPlOdVR43QV1JaIhqbtACobysoBfjCVCGpoAveq
	 kf9WBZ6UqA6lhM8bvkbeJicujDgDr+ptmu5P9XOc7RQF/5kSe8/9IosEorAjZqy/ySRVK
	 BU5Rz/MFJkaItskNt8FauMlVdyBfVonejuCyC0D4nfi6y8nqK+juapf6SBz3YCoVRWpDN
	 8VsanvQPq3PDBdyDSX8GuM7k4ASyQDfvkIKk0yAs1B2mcSx1IOCm/4wuwNqh0dhRHtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dw+eoPFE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.25
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00E606A32D
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 05:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD00E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dw+eoPFE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN3nEjKeMTQPhgb32UxaFR3u6HmSkx8M4sTIt8C4TypdqVDD8HtJLAJZlG3Jx3XRgJnabd897GzF29MvoQ0ycyXtIBohWCcjxL+o/zawyfZK77kuugnp0Qg4rJEB4ltn40nQciVolzgwB0AgUhzJsdZp6UKQCrqFbS3BlhZd4YgE3/40VfI5/yNutxohGx8w2k8uDijfN9lRzz7ZmB7Yy6SU56Cev2TFon3dXfsg3NNOd081lAS9IZ0fGNagQ7BvbhmMG68zJtul/czI1hrRfFKJcbw9OGaSVJHxvtMj1FCDjbKJa2eFqQ5yL8MGyBW7/dZULPD2TwIgBgSk7uamNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8ed34RJVl0kcaElnRK+vljUwKi4d42jeQ9ACN7mslQ=;
 b=Ux3jEJTdLA1LF1IvDNjaCMpFb++pZzIaEib/Iiitfd2zl54S+G+WWuHtVnI0R0hu9edECr/u4JRCq0qz+920NUmIdRF/TFytohG8CkWtVcNUtCYypYQGOs8zAWIlKJ/VMZumZWxu2/8Yz3+sJdPUdcqYDwAnwEUYoD8lZFIkJyuVrss8jU5mJkrTRm0PU6Hr0URjrBGjwTqZ4+xdcEg1Euqqbd2IJL7rBn7ogfgwpKLNcX0xIWxXDYeZgxIHrBCBokF3OLRgT8oclKPMSgPexfZHEpM0h0ckS8nGUlA7ftZuEcR70nYLMjR3N4fb+pQz7ujVNkspm+FfZh+v9mLcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8ed34RJVl0kcaElnRK+vljUwKi4d42jeQ9ACN7mslQ=;
 b=dw+eoPFE2EnvhrT6CSLkwIvLK4yoSo0fXipVaxBdoaIYxPMB/S9QuTDooqrh6eBVzWNyJVLq78Oc/sy42qbVibJL0totGYw59r/LcNE93PZ10NEOjtHbTIxJBvCXiu4Rj1z6kqyT+6+0ioBaKvsc59f8ME3AwOk8sS8puR8K23+r5kVZcWN5epi1MlcnTpvOfF9TOHnA6pdIidF8h/aK0VTjTC9yPIxAf3qjsMz1Q9L++ttcTDsPdXSJQlu772dgzFpg3s9cYMbJdTvUF0sTfPDkxorhj0mvI9AkrUbwi8dwUzNAPPRQrEUI0i6h1VYIHzZwIZdHR3G9F8xNqDRbaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 05:46:49 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:46:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 14:46:46 +0900
Message-Id: <DMKHKKRR2UIY.1FIJ7GS9VV4B8@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: cmdq: compute the queue
 regions from a count and a slot
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-4-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-4-f2befbcd8ba9@nvidia.com>
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: d55c5d6e-c3c8-4b00-2cf6-08df38a4b049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10070799003|5023799004|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	adfPIY3E4d9Gsh1JiWbkTg8IwjljrJ0tW7VUKDO3sarP+/pnHZ3i8k9oT0y7xRMxdofr9cUq96WRNQ3Su+ayGszPl9E23AZAxVq6AXyX63pLLrjO1sZuBcf5f23LP7xwhD8S3fB5JK4vwHcw3hLV1ignGa9HWWDeXtgunl97sbKKXwq8nE5TJuat8hDBwrJMwoprIJb+DRFQ28WMGMd3SbSEox6RpbKdIle/d/b1/4vyiCfehjfI/VGRAxNtkE2QekF7E2f4rQc8qiYkoCJ8CdztKQdp4xYeJQY+QRKXVZR4Pmn7LqLGJkacQcZd7MEtm6ibixRvLgLjvr5bRYf9NXrg4B2trKoJU5kmPnFSiBmnN4t4u24joSOGX7qw8Uj4sBYk8FFfI/nNVgVLXX1CJrA/3xylC4tTo2r4zDEuS3kaZ0k39dK+pP90mk/ALrTerkvHnzRLeVqI4v948pBMf4HB4KIFoLpPO4zGXvsHytfv4LQiyIkXWlHyH9wa5+eVICEG6rxYHOyfdeQ0aRzeAHs2f6Wh0IxPE04Bes3++DxxjStGBa1Nr3RYgUsyi/BJM8ti2CO0wFxn/FoWxkJQM3A717VtT0ksaxNFS7u2mN9QB42eY6jcD79Av+3qf+jQ7PN0cGk8UK4DxMshhJnOE5sxDu2wOc250FtX0QPZ09g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10070799003)(5023799004)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU5hNXdwNGRhcHRTTWgvK0NtYS9HSEV3R2dGNU10NEF3YVVEbUUxQkV2SWJa?=
 =?utf-8?B?aVVlemlZaTdsem10ZmhlOHFFc3ZlMEtpam43UVAydXFCb2hhdHZyQWwwZ0Qy?=
 =?utf-8?B?ZnpCckZEQ1lYTVN4N3NHY05kZEZWZlBhbUZuNXY0UVh4MFFLVzBjNjB4VU1U?=
 =?utf-8?B?MHR2bmE3Unk5bWZ4Ym1lS3Y0S29RM21DbEwvMS9SUjNWRUFwTTlUZyt4d2Y1?=
 =?utf-8?B?R2hPbmVPSmk3K05raGZVVkw0MFhlWWcyUVArbGthSWtGYU82NFFwcHRvdWQ5?=
 =?utf-8?B?TUdFdk5tNzFzOXIxWENQbGc1aG8zZ092eXFpSXhEOXE5M0RwUENySk1hY3Rj?=
 =?utf-8?B?TjVGVmtjbjhlRmF6b3NmUmFQb1ZDWWRQYkhkWUZmUk8zRUphTmVRYzdoN3p0?=
 =?utf-8?B?c0ZNSk5sYnhPc1cxa0JyNkpUK1UrQmxTdTZoOWQzdTZsUElIMUdUOEozbnFO?=
 =?utf-8?B?alVFRnlhTWorT053NG16WHl3ZXJUL1l0MlYvZTg4OG9QclBrVTNKZWl4bmxP?=
 =?utf-8?B?Q0I1UXpZZk1jZXJac1JKeFQzSC9kU1dIYm9Gend4VDJlaTRsRi94K0gzWW5Z?=
 =?utf-8?B?Y1g1RENudFNQYURUMlZTekUvYks0RFo1MTN3K2Q4aUdITlprSGVlcURMaEVi?=
 =?utf-8?B?Y0FLZktYVmZyVkJPWDI2dXZaeit0ZFY0VlYrMDhRNFVlcHEzTHJKK2VRaEdx?=
 =?utf-8?B?b2xzUmZibXQ2N3Z4U0doci9iSjJMRGpzdWtPYXphSlFrQ0pBVTZGajhwdzlT?=
 =?utf-8?B?YVdlelR6SkhkOTVlK2xWZ3Y1bjB6WTIvSXNZSkorRGxCc0Z2SmZZTzJtUmJ6?=
 =?utf-8?B?Y3RxcTYzVytkaFRCKzFpSWNyZGg3cTF1L0dSd3R2TXcwajFiOFUzdEg1R2ky?=
 =?utf-8?B?VkRBRjRPK2FOMkcvZGlTdVNiblF6aGhoNURaT2dBZFZTUkpNSkYyYno5aHVx?=
 =?utf-8?B?ZUM0bFZvWHE1TXI2V3lQM3dCV201ajNWdWVDVFFvTWt2NW16dG1aY0NkQjdt?=
 =?utf-8?B?SnRrK0pkdXQxeHhJUXorZG1TYW55UCtoTkZnUXF3eUZYMUNpZzBSSzN6eHdW?=
 =?utf-8?B?ak03QmpUbisrNjVXcWsxSS9iK2NrZjRRS3p5Q1N3cFBiMG13Qm5qZWN1d0lz?=
 =?utf-8?B?SjM0UG5vbjVPeldPa3NXcmFFWnV3dGxwMVBUc0dwT0UxbGc1ZzdRMmRJaWpz?=
 =?utf-8?B?NXdEcEJmdjNuQU9EM1NLUVVTRG12T3psYlQvNkEzbjhlRUtrWEZIQTdseDNZ?=
 =?utf-8?B?bE95RXYrbkZ1cUpDN25HWjZTc1BUU0dDeXlxWmNILzl0cmtEZ0RuRndrZlJ5?=
 =?utf-8?B?N3NOWlpUOGRGZlJ1ZnZaUmRZYU5LbzV4RjBDRXJMLzk3Z0FISHlaOGwvVG9L?=
 =?utf-8?B?ZndwQjhldFd1N3ltQ28vdVA3Z2FvdGo0SS8xcFI5TTE0c21YdHkrVCttdHR1?=
 =?utf-8?B?bkFwWklMbzhueUpINXJ0cVFZNEg3aFNVRERMRjBMeFk5YXE3QVRQQXhPbVVB?=
 =?utf-8?B?bUdCbkdhaDRGNWI1ZExhc2hwVGgwRTFKME5rQm16WkhVdElXRGNQZ25Hc2pl?=
 =?utf-8?B?NWt5aFR5a3ZVdmlsV0dUVk9RRlpTekdsTEMwNHRnNDNVVTBsTjJHd3doSHM0?=
 =?utf-8?B?TVIwZUtOWEZudjdUR081aDROTTdSL2R6SW00RC90K1ArVDA5Y2I5VUZQSE1o?=
 =?utf-8?B?R2FMYmVIUEYvejlDOUEwR1AxbFg1YXE4aE81T2piZVNpSjR2MjZnSU9lY25y?=
 =?utf-8?B?TmYyalhoSGhJQkYrZDdkU2pIbi81Z3lBVjdVRHAvd1VZSEV4OGFIaFh4OFdm?=
 =?utf-8?B?OUdKU0hXU3dEYXNVWGpFUE42SjAyeTNNTlhraWFITHhlTDhKUm9KSFplbVVV?=
 =?utf-8?B?VHFXUDg0YmlTMlJGV2VuL3NWck9MR2RPWkowTXgyZ0tpeEp5M056VnV0bnFD?=
 =?utf-8?B?NzRNZ3kxaXN6aEVha3JRckJpLzJPcW4zZ1VwT2FlcXk2dEtNNXlLaldIWi85?=
 =?utf-8?B?WklSZ1liYVQvVERBaGo4bitjamRCQml6dGZnM01WeTZiYk5MbGxFWjFObG5n?=
 =?utf-8?B?djdBQWVjZmlMMDQxZXI0QUVoUHBzclRBQ2wvU0VwM1k1c1hlbFdNMHdoL0hi?=
 =?utf-8?B?cHJJbEZGckd4RDBDRFhKVGRlbXB5L2VGeWFnWkM5YUtYeHM4WWZpMWc1MVZD?=
 =?utf-8?B?ODB3WEtmOVA5VUg2SDlLWDliU2taRDhKQmRYdzNvU1pQQ0RhSmh0cWVsa2J0?=
 =?utf-8?B?Z05TQXpsRUpSdjJUb3pVV3M1cWRCa0VkTkJTMzN3OXRUNnpMaWxzbm9DZWcr?=
 =?utf-8?B?TmpKZTBhRmpaR2cxdUhqQTVwTzZDb21mT1VlTmQvcVRYTmVtanp1QXkvd3Qy?=
 =?utf-8?Q?lsHYe59yGT5LZFsRFAJNygCz/W1wvuEtanQ3ZXY7ZNIjr?=
X-MS-Exchange-AntiSpam-MessageData-1: eVnD9zqZsruIAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55c5d6e-c3c8-4b00-2cf6-08df38a4b049
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:46:49.4877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLyeoAZ79R4yJBDIEQjIbsAUU16dA+xXsSJ9P78m/2TsRnH3ySuU53J4CToxdkX/ONOk6I9/r+EQ7X0mtAcCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

On Fri Oct 30, 2026 at 4:41 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The r000 firmware uses msgq v2, the queue layout that keeps the queue
> pointers in BAR0 registers as counts that do not wrap at the ring size.
> The r570 firmware's layout keeps the pointers in shared memory as
> indices into the ring. The two layouts differ in where a pointer is
> read and in how the size of the region that the driver may write, and
> of the region that it may read, follows from a queue's write pointer
> and read pointer. Splitting a region across the end of the ring is the
> same in both, and whether a region wraps follows from the order of the
> two pointers.
>
> The functions for the writable region and for the readable region each
> branched on the order of the write pointer and the read pointer. Each
> branch chose where the two slices ended, and the function then built
> the slices with open-coded pointer arithmetic. The SAFETY comments
> argued the slice bounds branch by branch, so the switch to msgq v2
> would have had to rewrite the branches and the argument along with the
> pointer rules.
>
> Compute the number of slots in a region and its start slot once. The
> first slice ends at the end of the region or at the end of the ring,
> whichever comes first, and the second slice carries the rest.
>
> The number of slots comes from one helper per queue, which are the only
> two places the msgq v2 switch needs to change. The two slices are built
> with separate from_raw_parts calls over the slots the driver currently
> owns, rather than by splitting a slice over the whole ring: a reference
> spanning slots the GSP may be accessing would break the contract of
> Coherent.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Do you reckon you could tighten up/rewrite this commit message a bit?
For me it's a bit hard to follow.=20

>  drivers/gpu/nova-core/gsp/cmdq.rs | 96 +++++++++++++++++++--------------=
------
>  1 file changed, 47 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index a271114fb54c..7350074a9f96 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -186,60 +186,64 @@ fn new(dev: &'a device::Device<device::Bound>, bar:=
 Bar0<'a>) -> Result<Self> {
>      /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
>      /// that case the second slice will have a non-zero length.
>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut=
 [[u8; GSP_PAGE_SIZE]]) {
> -        let tx =3D self.cpu_write_ptr();
> -        let rx =3D self.gsp_read_ptr();
> +        let avail =3D self.cpuq_free_slots();
> +        let w_slot =3D self.cpu_write_ptr();
> =20
>          // Pointer to the first entry of the CPU message queue.
>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq=
.data[build: 0]);
> =20
> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
> -            // The write area is non-wrapping, and stops at the second-t=
o-last entry of the command
> -            // queue (to leave the last one empty).
> -            (MSGQ_NUM_PAGES - 1, 0)
> -        } else if rx <=3D tx {
> -            // The write area wraps and continues until `rx - 1`.
> -            (MSGQ_NUM_PAGES, rx - 1)
> -        } else {
> -            // The write area doesn't wrap and stops at `rx - 1`.
> -            (rx - 1, 0)
> -        };
> +        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_=
write_ptr`, so the
> +        // subtraction cannot underflow.
> +        let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
> +        let in_before =3D avail - in_after;
> =20
>          // SAFETY:
> -        // - `data` was created from a valid pointer, and `rx` and `tx` =
are in the
> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_=
ptr` and `gsp_read_ptr`,
> -        //   thus the created slices are valid.
> -        // - The area starting at `tx` and ending at `rx - 2` modulo `MS=
GQ_NUM_PAGES`,
> -        //   inclusive, belongs to the driver for writing and is not acc=
essed concurrently by
> -        //   the GSP.
> +        // - `data` was created from a valid pointer to `MSGQ_NUM_PAGES`=
 entries.
> +        // - The `in_after` entries starting at `w_slot` belong to the `=
avail` entries that the
> +        //   driver is currently allowed to write, and so do the `in_bef=
ore` first entries.
>          // - The caller holds a reference to `self` for as long as the r=
eturned slices are live,
>          //   meaning the CPU write pointer cannot be advanced and thus t=
hat the returned area
>          //   remains exclusive to the CPU for the duration of the slices=
.
> -        // - The created slices point to non-overlapping sub-ranges of `=
data` in all
> -        //   branches (in the `rx <=3D tx` case, the second slice ends a=
t `rx - 1` which is strictly
> -        //   less than `tx` where the first slice starts; in the other c=
ases the second slice is
> -        //   empty), so creating two `&mut` references from them does no=
t violate aliasing rules.
> +        // - The slices do not overlap: `avail` is at most `MSGQ_NUM_PAG=
ES - 1`, so `in_before`
> +        //   is strictly less than `w_slot` whenever it is non-zero.
>          unsafe {
>              (
>                  core::slice::from_raw_parts_mut(
> -                    data.add(num::u32_as_usize(tx)),
> -                    num::u32_as_usize(tail_end - tx),
> +                    data.add(num::u32_as_usize(w_slot)),
> +                    num::u32_as_usize(in_after),
>                  ),
> -                core::slice::from_raw_parts_mut(data, num::u32_as_usize(=
wrap_end)),
> +                core::slice::from_raw_parts_mut(data, num::u32_as_usize(=
in_before)),

Can we use io_project here? then unsafe as_mut() because they are disjoint
e.g.
```
let after =3D io_project!(self.mem, .cpuq.msgq.data[panic: w_slot..w_slot +=
 in_after]);
let before =3D io_project!(self.mem, .cpuq.msgq.data[panic: ..in_before]);
unsafe { (after.as_mut(), before.as_mut()) }
```

Same for the other spot. Gary also suggested this on v3 [1].

[1]: https://lore.kernel.org/all/DLMUKFL5CAZ5.2ICMKG94JXP52@garyguo.net/

>              )
>          }
>      }
> =20
> -    /// Returns the size of the region of the CPU message queue that the=
 driver is currently allowed
> -    /// to write to, in bytes.
> -    fn driver_write_area_size(&self) -> usize {
> +    /// Returns the number of slots of the CPU message queue that the dr=
iver is currently allowed
> +    /// to write to.
> +    fn cpuq_free_slots(&self) -> u32 {
>          let tx =3D self.cpu_write_ptr();
>          let rx =3D self.gsp_read_ptr();
> =20
>          // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invaria=
nts of `gsp_read_ptr` and
>          // `cpu_write_ptr`. The minimum value case is where `rx =3D=3D 0=
` and `tx =3D=3D MSGQ_NUM_PAGES -
>          // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - =
1 =3D=3D 0`.
> -        let slots =3D (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
> -        num::u32_as_usize(slots) * GSP_PAGE_SIZE
> +        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
> +    }

optional nit: it may be nicer (for r000 as well) to have the helper e.g.
cpuq_free_slots return (u32, u32) with the starting slots and the # of
slots.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

