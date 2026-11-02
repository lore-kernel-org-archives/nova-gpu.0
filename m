Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621412;
	b=Ilb4b2+3aOEGEcN+ly3JRXMxcMEq5VfyGHJPni7aQpdkB99WlaeuwqHcbM9Yiiv0Uzts
	 EepnAFJeCOmLM+Gt93ciFpKY+OW2ApKgp8MToP+/a1cDMMGreI+MwXj1Ac0LbPTUs6em8
	 S6k/0bFqkU2ERdx7rC7fN+TiZWNtsIT/sM1Z/ls1oiunwhbBm5zibCT4yG6rrLCGi9xoN
	 hBtC9PV5yqZuBUu8mg50uGOyegzhzG8S6v6ydf2NF0b2GoC79exdtm7qhT2BoutPm9+H0
	 YzwLj2v51eX23ppKlJ5SzyqcN2+Z5xAXHqpE84nhFNu52Nxp0QIDj0OyThnPMtwwnaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621412;
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
	bh=EpRXEeBCQBFMPWWum9lfnwwCLDbfGsscHXLSPu94Puw=;
	b=qBnYpm11dzDqrD9JAc59PHZaeeujx0Lr8WXL+up/gfJuzQVnkvlNbmG2yhEBQCWxtTmn
	 BDANAWe1VgtADGFm0wxel8O0paPhCTEBt2y4a0EEkQ/cgq+dHyvjoeCUCycwtobIpDjQu
	 4NEJiWbOCUC38DXeqkeTuilPZXhRsFw6AxJHURlFee3zHDuh5nmoD3Y194qLd6vGf/Vfk
	 tMjH1DYMXp+eJJ9vhRgjrEE3hve6VXyIxeIqL5ofe9NLTxUdxiq1IhNwdMTCOX7J2x7Yk
	 /tjcQOMziqj+jj7CGJTlVPttvTx/NiS3NgpjwohFL5C9KpWVhzdc1GlP0o6rhcZHhAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=psW0nZ0b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.67
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91860A2600
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF91860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=psW0nZ0b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFrOG49hCzuw8txb9xHEo4xbWsDoT1jyXkQS9BjB2jvgbqwrLkSOliGAaGc2mdbS0QsPSJJby8h87fzbrtzMJv8DFxIQaTJOvAsdjBNfIiRuQXjFzBXCHDZM7mp+obW/m5UZaPLdeLQtZ76HorQmKTTEpyiLxb62UZR8Kngm4Uo74Dlpl8dsYe7+2l3/0W5JRhD5muOQ0ReCurq5Qpn8YOU4doaOBtNy4xmiTaOqnsyYiiYifo3lDfx/5KXysuuWM9Q2nMW6KS3oeiIJmAyiyDGjBcH5RxFWG6UBKNFGpZDN9bDRNIwhx+ZVtIAYtig/Ww4161IcDjfEX1uCaNx02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpRXEeBCQBFMPWWum9lfnwwCLDbfGsscHXLSPu94Puw=;
 b=OWHaZDHxOCb515hWkJ1QW6fuDza1CuDEx+VAwa2evHCme/QA2L9Vm2UiqQ1r7VBON/+nsRzBSice9gnrqSEbLGB50uIhJdrRtxTXcgyZ57fjAZ5FKufP4UrZ7YECHO+sWLmR214GeBHV64ysDBB+B3ROAJH7VfB8vXQQCjJxkorJ8vm/mowQ9+VAq56REvK/HC9wKsVLC8Slmzfr2E+UwkVbRNSSPnXR94fqwfVD3dx0lEsg1t5CsWYqzANaJ2FmbhWHFhe11bNMO9BlRQSjOgw8ZAWao92CTINdB26Y6wVku6iHrhJFPyQYpUhde6crtESl0TCs2kFNRY2GYOQ3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpRXEeBCQBFMPWWum9lfnwwCLDbfGsscHXLSPu94Puw=;
 b=psW0nZ0bhumWJKTVeSAOwOsXxgYZ/2ASMbLDHbaKCnRnl6iDJ3De6y7W2JwO4C8wJK8yaWvRVeZdxsdtyG4tZGhCjzJLIaNIfVhbF3mIPSJupRpQAFzXx1IkHu0QZTAF6jxkYCZTeXYWb5lqgFqwXNlBOgrZ668bVddwsxPAfOEGntNA05Jiq7YP+jLiu8mli0AZHcE5OindEhR0wlQF7wA2lRcCgMlENVs98pXQioY3N7Al8brLZIgtQobFR6P6TXas2GxY4CmnGYQz3SNAvEJV5XcldCHqhfrHs0m/cR6FVnT3HlZ04UfViJCt9Pzue7FfE3rT/3+qOCzJtvgAkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:09:53 +0900
Subject: [PATCH v2 2/5] gpu: nova-core: regs: add msgq v2 BAR0 register
 declarations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-r000-cmdq-prep-v2-2-c2c2b69bdec0@nvidia.com>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH5PR12MB028906:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee4bdc1-f1d9-4104-ab6f-08df38da3d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|10067099003|18002099003|22082099003|3023799007|56012099006|261021123027099003|11063799006|261021121427099003|261021135927099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	1w1XzIHx2eYalNeq0PDjksDtLt3nvQbESc/h6Md6WdPcFcpRb3WmVrEHIQhWuYjEnSAYw4OWSuhaAbZiulMBuiQlnVnBut325H5VTbLg4wpBOcRyUoldZAquMjcDEx6zMGHmVtgZfm0ZBSbv6KBdtNagDLLbwcL4Gbter4qc3m+hR4mHN4Tu8WAYtq+cNoOgTbJN7rfcW9gv70WxHxjYuY45thp2NZIhlCiAB4AIsbTvPvS7o9rQVRzOcG3itbrXlot9avob2u16QFUfsqEcdP0PLCWpg+Ka6E1G6CvKYmYBLsNxXPIw4v+2QLS1qEtA8Q4vjvzd/jDr4Y6Jab48yB9qcL4xQLTjJUwgVVqEp5B7o0xItUy7ffPFUbwFY2itUJb27gH+HueuZLcxekqL0Io1ZYkdORlPRJKAN6StF0o90uEB1M3iETSAcuUGvkc7cy3TgzgGvsrZ1o8xyAW4C6odypu93OIXFCWSf4B/QPWqS1RCje9KTlKKRLrBctsSAlDJsaJcY0z6WEVdH50oCmSaORkFfPgE6sWzA9WdG9cJRdtqcwK5BUfj6yemH8wORiFiJiyFAb+MRjUvw5oC/EuDQvf5gjCKFgaAWvBh+fTVywvdLHIee5nHlbZwkxYqOa7+Nxjvq9zq7ed1Ho6asyrVZvghxubDHZiPv8oNI80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261021135927099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzNSYXNteTBzcFJ3S0NHbzlrZmgwYXdReE9nOXA5WGx5RjNOSHllcUJwRnlE?=
 =?utf-8?B?Q3E2blExbzcyQm1BcXVHQzYvOXl6MCtKTldhOWFUOVFJMm1rakJpa0hzM0dQ?=
 =?utf-8?B?L2wxNkxFaGlJZyt6REJGWXBjMHp4a21ESVUyYnczdnNuY1YzbjlJYTJHVUFa?=
 =?utf-8?B?OXFmZ2kyZDFlWjkxQTFqd1Y2c0lJS3lzY1FQVzNER2xCZnR2RlNyelo3R3B3?=
 =?utf-8?B?dlRicmsvRXNUUk9jOXc0M20vdDVwMmNWTkZEbmkxU28rYWZDNUt1a0dHSndv?=
 =?utf-8?B?b2wvcnl4V3FMK1JLakVHdytiWmY5b3drL2d1U2JLOWFPeWlZcE10dmZZQytl?=
 =?utf-8?B?Kzg0SzlycWphZkRmWDI1TElIS0JoL2JkMDlpc2hzOXhZSUtkK1drOEdKTFlw?=
 =?utf-8?B?S1A2R1plZVYydmJ5K0w1WGxWZ0pueTYwY3ZtckdFMUxHa1ZldExPNVdSd1cy?=
 =?utf-8?B?U0dpMkFxZ0RMeWtmZjJ6S2M1aVhWT0l0dnM2clpaZ0dRV1ZoYlBCZHpjTUhT?=
 =?utf-8?B?a09CSkxMRU5LTzUvdDhFUmxhekxNTXZUcEo2enV5cC9NZFZ1OGV2VjFBWVJF?=
 =?utf-8?B?TW1XNFg4VWtMK3J5VkhqWXcrRUt6SWFKNnZkbk90WXdmYVBRajJYRlo1WUtY?=
 =?utf-8?B?NlBmZmphMXgvVlR5c1FOTlA1OU9XRTBpQU1tdElEbWlwQ2l2Y0ZKN1k2QnJT?=
 =?utf-8?B?ekw1emJvSW5FL1dvV2svNlJzZUpTRHlNWElYTWJwTzZqK2N4d1hzdUFub1Mv?=
 =?utf-8?B?dmduSUVlaHRUT1AyOVV2a2VjRzJuTEF0S2pZMm8zSnFTRzRGTFVKUUtsMzZo?=
 =?utf-8?B?MC9zZ1NITGtGRDQ4eko3ejFhNWZHdWNmRFJBd2V1d2dVbDJFY0QweUJDSDZQ?=
 =?utf-8?B?aDJOSjIyOEppOVQyeWR5MmVWNnhINVg3QUdSdk83Q3oyTmpJTzRDZXNDeDVZ?=
 =?utf-8?B?NVFLcnQrbk5WcU9wUjVISUNQQ2pPbFBuNHJ2a0RmbmlXUUF0dzM4bXl4UDVt?=
 =?utf-8?B?V2JhVjBGT3hYY3lIcjBxWkRmMGs2WVdIa0cyZXhjei9IZGZHQVlDMkZKQys2?=
 =?utf-8?B?TGRoZDAya2x6NWFCOUozdFJZa3RVV1ZWaFFTQWNNR0lta081RlUyQUcrTTdo?=
 =?utf-8?B?WXRuNmE3NVdpTlJ3SUphYmtPSjlHWWFrSG5NNnRaMm4rUS9lWGNTcU9jNmYx?=
 =?utf-8?B?WjdIZXZVeUEyb3gxTS8zNlR2V3BrR2I5aXZpV21GZFlhS0NUQ28yajdqT1Zn?=
 =?utf-8?B?ZU1Yd0ZFVklqMy9SOXZlMHUxMTJhL1hOZ3FwR2tJbWxiSXBJNGVwZHBHdlNl?=
 =?utf-8?B?UGUzRW9nRWZzck84UTJqS3dOb250MEE2R0NBMEZLQmpmR3JMYlZkT2tnMXZB?=
 =?utf-8?B?azlSSHorYnVHamZJVkR1WktlKys1WlBneHI4NmFCcHlWQ3EzUHFmK2hxWHBM?=
 =?utf-8?B?SkdMb0RoTXBvSzZ4T0E1a2c5ZGJHS2dzMzZSZzVIc3JlWWlRZVNFb1pGNXV1?=
 =?utf-8?B?aWZvUTRhYkxHR2ZlSmhvZWlTVjR5Z0poelpEOGlHMjBVVHJvcEJ6S0hyc0F3?=
 =?utf-8?B?WWJXZlRSUjYrQkNIT2VuRTJCOW5RV0Fsem9JTjlnTDh0QzdyQ3pXMkpZZUYw?=
 =?utf-8?B?Qmw4Z1ZkbUZCcksyUmgvQTlYQUY3OUxpY01JMmE4U0xzd0NOV09iWFh4NkdM?=
 =?utf-8?B?M2psVXFNVkNDSHBQVitadXRRb0VYdHdJOUZkZGUzR3ZGQWhqUCtoM29jcW1v?=
 =?utf-8?B?VnVwOEhocnZwRFdXdVlyZXFqU2FIbU5FSEJ6T2NlNzBqYTAvUmlpdnhtOFVB?=
 =?utf-8?B?Z0o4V3RNWENZYW12eGtqVE1OSnRDaERmRGhPbm9KSnlURm9iZjUzcXU5SkJ0?=
 =?utf-8?B?K2dVRzRwUitrc2g4b0pFZnVRSFppZjdhL2xLcSswbmFZMndpWjcxK1VScmNX?=
 =?utf-8?B?Z1ZxNzJRZ1RRNFI5cXBEVWg2aXpCdW1PNDljUHp0QlBncHBGV3hqNkpzbDk2?=
 =?utf-8?B?Vm5USVNxUldNaWllQk03c1g4MERqc2RZYnp3cGJxQUlWdWwzZmNPald2Tkpa?=
 =?utf-8?B?amhEa1N5SjRBU3IrQmZ5eERJaXVqY3pwTVRTMEpiVUR0YjFlakdYRldHcmJW?=
 =?utf-8?B?dGpmdS9vVStHVTV2YmlneGYrM283TmFlTndaaTc4K0FUZXhQbGR4MWUwU3VJ?=
 =?utf-8?B?TXBzQUZ2YXllKzVqQ0ZVcGJvNEY3U202bUVrUVExZGpRUHNFSFRtVzl2N0d0?=
 =?utf-8?B?QWFHWGpGUkxCUXd3V2QxTm04WlJqRWVJZjV1REs5aURBcVg1T1dMQ2xRY0VD?=
 =?utf-8?B?ZmdVSXRDVkQ1SkZBbzQ4QWN5VGFMNGZxSFFzWmpib2pFTGRhV1hrZlBhQ2VU?=
 =?utf-8?Q?IH5Gm9GXaNkdd81X9fy7MP0LYmK5Fk2kRWs9VdsrGjuT3?=
X-MS-Exchange-AntiSpam-MessageData-1: 3MyfyitJnfCaWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee4bdc1-f1d9-4104-ab6f-08df38da3d27
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:09.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqCQq0GQC7cjaxXKLgTYQYPIU98CcW+28Qrejm3d/f3E0bVW8bxuoj/AhZAg/NQE/a96sB8vkoXsiy4z0JjEBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

From: John Hubbard <jhubbard@nvidia.com>

Msgq is the pair of ring buffers in shared memory through which the
driver and GSP-RM communicate. The command queue carries commands from
the driver to GSP-RM, and the message queue carries messages from GSP-RM
to the driver. Each ring buffer has a write pointer and a read pointer.

Msgq v0, which the r570 firmware uses, keeps both pointers of each ring
buffer in that ring buffer's header, in shared memory. Msgq v2, which
the r000 firmware uses, keeps the four pointers, two per ring buffer, in
four BAR0 registers instead:

    NV_PGSP_QUEUE_HEAD    command queue write pointer
    NV_PGSP_QUEUE_TAIL    command queue read pointer
    NV_PGSP_MSGQ_HEAD     message queue write pointer
    NV_PGSP_MSGQ_TAIL     message queue read pointer

The GSP numbers its queues 0 through 7, and each numbered queue is one
such pair of ring buffers with its own four pointer registers. Nova-core
uses queue 0 only.

A write to NV_PGSP_QUEUE_HEAD also interrupts the GSP. Msgq v0 uses that
write as the doorbell, so nova-core already declares NV_PGSP_QUEUE_HEAD.

Declare the other three, NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD and
NV_PGSP_MSGQ_TAIL.

No functional change intended.

[ acourbot: declare the registers as arrays of 8 with a stride of 8. ]
[ acourbot: use "val" for the field name of NV_PGSP_MSGQ as per OpenRM. ]

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  6 +++++-
 drivers/gpu/nova-core/gsp/regs.rs | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 936406004a57..07b21a6f4504 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -15,6 +15,7 @@
     io::{
         io_project,
         poll::read_poll_timeout,
+        register::Array,
         Io, //
     },
     new_mutex,
@@ -496,7 +497,10 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
 
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: Bar0<'_>) {
-        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
+        bar.write(
+            Array::at(0),
+            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
+        );
     }
 
     /// Logs and consumes every message the GSP has already posted, and returns without waiting for
diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index 3c410d65e8e4..e3fbbf364b7b 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -9,12 +9,32 @@
 
 // PGSP
 
+// The GSP has eight numbered queues, each with its own four msgq pointer registers interleaved
+// at a stride of 8 bytes. nova-core uses queue 0 only.
+
 register! {
     base: NovaRegisters;
 
-    pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
+    /// Write pointer of the CPU-to-GSP command queue, which the driver advances. A write to this
+    /// register also interrupts the GSP, which makes it the doorbell.
+    pub(super) NV_PGSP_QUEUE_HEAD(u32)[8, stride = 8] @ 0x00110c00 {
         31:0    address;
     }
+
+    /// Read pointer of the CPU-to-GSP command queue, which the GSP advances.
+    pub(super) NV_PGSP_QUEUE_TAIL(u32)[8, stride = 8] @ 0x00110c04 {
+        31:0    address;
+    }
+
+    /// Write pointer of the GSP-to-CPU message queue, which the GSP advances.
+    pub(super) NV_PGSP_MSGQ_HEAD(u32)[8, stride = 8] @ 0x00110c80 {
+        31:0    val;
+    }
+
+    /// Read pointer of the GSP-to-CPU message queue, which the driver advances.
+    pub(super) NV_PGSP_MSGQ_TAIL(u32)[8, stride = 8] @ 0x00110c84 {
+        31:0    val;
+    }
 }
 
 // PBUS

-- 
2.56.0

