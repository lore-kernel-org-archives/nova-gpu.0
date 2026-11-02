Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793626060;
	b=NGNxVa3KdIB9VqV/eefUUv0W7CBDE3EhZsaqzd15nUca0YYQEv+1CAVaqxtB4MPpmpFT
	 85s4GIX7x5A8cqlvs9XbULN7H2ggNM2hVY16os1i+LqnU7AiOugnbUcECW2sv6/GOVyxz
	 96Nk03E7ghvKjcU23yQOPik3BlknPXgde+2X+xslO2dV1NbPWUwSkTgsps+TPQUwRTyJ0
	 Oe4VvaTFC17q3Shmjvn8mN79qIIukpAQ9Gv5++7PmwVoO3/K+/XLCpJFbKUfrd0eKbTB2
	 NcEgE4f5rXqRxIAWX6eJNTsJZQZ/FDR7NmOiXF2x2JvoKmCCniBrA1eo7yK6YhOMbCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626060;
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
	bh=wL4VRNyM0lAnChGus4Zdcft5lYA8VOMZZskgcWXOMZ4=;
	b=Bl604+SkA78cbjHZanB3AQYIDIKlGroWcPN45OCYIYIfmTQbOigrB8NzL7EYNk3cgDcW
	 vio+lx057rz1CmaEy/I/M4ZKOITmtJe9a7Da1tMl6eISeESh6HY7at320KYZkTf/SOwlc
	 ZWIsc+ScTIcFT7Nl/T/tyyQJV4uxFzxH++RjEzSDyKYN/7bvjKHb/cj7Kr7XSYAcB/mBG
	 ic0MA2ENb4H5AI8BtrOM19eEYe87ABS3a2CulOiQA6PtBqnFBVPyf4vTGSM4hhSgty2Tr
	 sSw2sScTdRY/sl7G02ZPAqPd/kbnNshxK6uL3UyUKVQwuBXou4XLkxvKDTGIgh0b2Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DN1JNVuT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4A6606A327
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 13:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DN1JNVuT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cntpda02lpwBuwHvJLYDFRmpl4rDBuqizLHFPOYxeY9gP12BHTnqcFStaxDpGKDTeZnLTi3urBN5P/AkGI0wwwK0CVJKHBD4U66Ps7EDGkHyXjXEPfc9OX7v+qc6XY0OoDyFs97TaktAIKxSJ1GqiPnxu1gLO+60SjY/HYATpsSjJpRndV/o5FaTqbW0qhbEA68vAnxG1/GP0GfeYbbf6mKL8I7JqRmJ/KYA03jEnUjkNsNzUEYqeS23EooavzabtIHVtzNX90fdGO4CWLQNu2EDdhrLrQ3jL5NTHcoMEyJYq1ILk82vf5ZQQ7fw7UdNwdzGyFLL+3HveLslVyM5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wL4VRNyM0lAnChGus4Zdcft5lYA8VOMZZskgcWXOMZ4=;
 b=MKcH4PFm36vrNDHyBX6e45drC/9SznFw7ODMBzXwporlnkvg59ZnCy4+jdt0ky4HoaIH8QbkQjEuSpKeQPQRVHc24IWn2vM6j+7GNvTiLYzaUx7KIOjgePbPSCYZvdokAtwF9nNjR9NAeJikoAbiMwQjcl4BsVByyze5pGaWZby9aV4Fqe07Gv0EmrSnDF7F6vjk/5aujouKSQtNzNeYmE2RU11u9cC6OBP4w2n4A/UBKYqpVSuJjnucqgyr2kRs5WkJ8JFp/3Ml8hxjTqvWHdTX5RnyA2aVoTQKxnJO5E2gzzXoKa096ZseBnNbSqnMBNC7oI2HrbkGgtUyGktWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL4VRNyM0lAnChGus4Zdcft5lYA8VOMZZskgcWXOMZ4=;
 b=DN1JNVuTJ3H1JfPbHZN7cpehAeSQhK+greC+vniSEn3n6gPU8r9NxVBvqlTvKcMYNncAL3tQG7bEcRyZDJm3MpnZvFSAI+YKtM5pmgaThcc+F3iZ5o4aiiPTAMialWsydzl+/I2Lrt09pPuAorF7Ph3uVVylV1ShWLvsSRlnsBWRjvkrEjAuL/NoDC09ZP/urAqo4Ecl5oUJ1OqWqgVbqtv6tJYoct8IIjgqPJqh8nGUJvCHh7Lyhc9l42+A+vpVP3GuzHGlPPapSmUmSpyXNIXukyh3+tJp/OiCV9fZ/ij+b6croQL9Xwbs2U3no4WMJtmbTci2QgXSocMAak+9cw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 13:27:32 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:27:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:27:28 +0900
Message-Id: <DMKRDBNW6KIO.OT0T0M6JFRDY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] gpu: nova-core: gsp: cmdq: compute the queue
 regions from a count and a slot
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
 <20261102-r000-cmdq-prep-v2-4-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-4-c2c2b69bdec0@nvidia.com>
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 555b17c5-f84d-4a3c-a731-08df38e50ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261021135927099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	qHAyADeVYwQJw22/+3H9lgk/AL4/c2R2U2E61Us5FE1mIYS/Htj8lLzzHG2q6/tl+Lxi7PnVQj6OvkTvOrtN/D4dQ2pSbRVGmdwSibb/9y9VYVnqagOpFpWOHBARcUXgStw/ZC6XYRwX7e9awboILFGwhLBxLhXXA6J6kLucQgYNnj/aehiYWIYZNxw4gOjjDaIjvsEx6wJtyhTVvcW12+s60stVfEJ4Spf/a4CWS6e1tqnUig6uVjhQDp3LfezVhx9dzQJERCsCa18+5HXc7WlyBk9t4ZAektO9Ffe7/U/Tv/Sr4FBZT3RNeSAytw51CTItWvUgsZ5A6QYowEyBKSOJ1rhUU1HJdrWfsiAuCUF3l1ZYc88RlHb8UxwqXmFfZ8o3rL/0ZQ8Yoh5wyIAGf3npIMIY/QYILdIO8aX9/OE3hcRq/N/HO5fBo9Pt8N9BnMIBhDCGT35RxUOudt5HiDfhln0SMjAJ7Ei/yuHypgdlsAQeqXVOQySe2FTjP+hPNTMgNlL/goEvB9IXEsjsvlIu5QYLeFtxctupIFYIBGhew315yA1ksFIMt7pozkqsqZeiZ/wpoPfit8upgrWxU4zNjoY2PdJSDRY9HdLrj1WYPM03kjjCOTYtafmGU+2v8YpgwH+bngWRuHliqZQ6bAotwHNXkHCclsLRebvyf7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021135927099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG0wYVowZWxNRmhxd1lWVnhDRUV5dHhRRHprMnNDcjUvaExZcmVPeXRnWnly?=
 =?utf-8?B?ZVNORC9ud1c0UkRVSUx0c2lCS3g0aHZRZVhMNFR0K002cXRweC9PendPRkhX?=
 =?utf-8?B?eWxXZUN5NWVIdmhyMnhEdkFjeHcvM2syQmw5V01ZN3FaUVpwcEpZbkt0WmM5?=
 =?utf-8?B?YjFhZnNnb1BNSSs4djNUWXNVQ01mNnk0cFhKcFYzcktPOTlkcTlISG80dFpD?=
 =?utf-8?B?TmxWWXFCa3laVlNsMlQydGpveU9pOWl5RkNkQlRrL1UyaUVqdWNLSGVhclRU?=
 =?utf-8?B?MHVscXF4NXE0OTl6NVhvYS9ObGhVSVo1TVgxUnBqOFBPRzhZeTNDdjJ0Rlg4?=
 =?utf-8?B?UFMzZDdBcXFkYWhBRDZ2dHNaMHJmcFBieDRTQXRleW1HKzNrQ2p6THFDK0tH?=
 =?utf-8?B?cnBwcjFTaEdDZk41amEvWHZCZlUyd3FoWkpNQkhMYVpBY1M5bjlraE1VOFVG?=
 =?utf-8?B?RkZwT1ZkaVA0YzFCOE9YdTJyWDdMU0MveWFaREFkbkp2MnU1QlVzMTYxdzB5?=
 =?utf-8?B?OTRBTnAxeTE5MFEzd1p0RHJIdDlvRnV4cFZYZFczUmFHb054dTJCd0FDL0lE?=
 =?utf-8?B?T3p5WXpXTDdpZnl3OTRzbllzYUx6NmM3Qkd3TUxhcE1VekprNldidENrK2Yz?=
 =?utf-8?B?c0lqUTRPeXZkbUFLckpIM0VkTW1xOTlhOERCM05aMzBsZUlNUEkxWmFrdHFP?=
 =?utf-8?B?S0NOMHBFZHJaU0hIelBXbkJSR0lNdFRqQUpka1d6ZDM1RElhaWtLT3NoVk9S?=
 =?utf-8?B?QkpHdFg2UDFDY3ZraWJEMW5WTENOdzJ5TzdqMTE3QzZSd2JRdXMrb05aK2Nw?=
 =?utf-8?B?ZWQvRjh4RkZtNVpndHNaM1JWSVBPR0xVUEIzQStYTHlnRCs5RDNVOEJWMXBO?=
 =?utf-8?B?K1NtUXdIR2FtcGtiZUpkTXQ3cW8zZzk1Mno2TkJDUWpRak5CTTMrcTBMakRF?=
 =?utf-8?B?UVI2MnZvZytUQTlOc0JMeVB4bmc3REV6Mno4Z2QxcGt5K01BcWYvSGE4ZHZs?=
 =?utf-8?B?R0hUcnRKYjRDR2IyVGdET2tzWG93NFpVNWdPbmdmQ0UzaWhrd2pYdFNqMkQy?=
 =?utf-8?B?T0Jla2RTZ0d0WWlFbmlaVC8xa0VDUFJYMjlXb25LS2RaakR6VmQ3eEEzWWxF?=
 =?utf-8?B?c3RsREYxd0hnSytUczVvaDR5QlJ3RU92Q0trMzVlZTRZRTR1dWpXbldIcXZZ?=
 =?utf-8?B?cTRrSWs4S0NNcFlPb1VvelJla1RzVlBhWHE5SU1TakhyMTNjajdzQnU3Wmp0?=
 =?utf-8?B?NXN4dVJuRXNEcG5pZ0xpWTNSTXhPZnZDa1duTzFhOEtBZS9tTmNLVVNuNGY3?=
 =?utf-8?B?RWRFb1VmUXB5NEZOUlRsS2NKVFNLNlRnMkRSdUl3TVkwWnd0aStzOXk1b29t?=
 =?utf-8?B?YWllcm1rN0lKRnByTWV4L3k5MHBFbEdZV1VWeGJSUG12YkgyRkZNbERZRFpj?=
 =?utf-8?B?NFAxV0RRK0VCK1hoWVBwTndGTVc2WnJTSkt6cDNWVWJicUJ4T0VsaHVjV1Fw?=
 =?utf-8?B?YWQ2NFdyby9NVUNzNisvNVRGL24vN3o1YllvLy9Bemk1NlgwcDRDZHpYOU92?=
 =?utf-8?B?WjVoWUdvN1BOOHBIY0Znd0NwcUt3S3JoWHRDc282OHZad0FhREV3VlVJQ0Vo?=
 =?utf-8?B?NnRjMFRPTld3QjU1dldka2Q3UDJNZUNXOGJMcm1BVFJQeFdEN1diTEtWRnZY?=
 =?utf-8?B?ZXZrbTF3NGZzdy85WlVaSDE0anNIT0labDRvNHBFNXN1WWhHdXUzUEVtbzB1?=
 =?utf-8?B?aHRPNjhlK3pjS0JWUy91VTcwVERNcERZcVVnVEsyLyt2b2Mzc1N6WGdLYThM?=
 =?utf-8?B?Tjh0K1hUUVlvTTBNVzZQdDQxVzIzbTI0SjVQWEkwVFp2dXMrR216K0FIUVZO?=
 =?utf-8?B?ZTg1YXArL2NneXlma3l3UkZneE5SZy9GNTNQUzlaMzRIb0lIREVib0F2UkNS?=
 =?utf-8?B?YlpNTTg0WEx3Vy8wVkZDbGdFVjVEL1VXSC8yZkV0MWU5SU9lOEJKL0RWeXpj?=
 =?utf-8?B?c3c3Mzc1eUlxcDdYWTRlNllmK1pKQjRsbWdEY1FXWGhUb0lpZUg5OWl3TjZx?=
 =?utf-8?B?cC9jVDdHWVl0RG1LQWd1a2tTUUtpVHNFTDE0Y1k2cDQ3WnNDM0d6TmJTZFo2?=
 =?utf-8?B?azcvcjNpQkpBRTFtTXBnME9kcFpUVHR3NjRvQzBwWGJOL05EOVBsTzBuQVQw?=
 =?utf-8?B?bWx4Z0JTcm1tblova00yeUtnc3lGVndiTWZyRUIrNTYzdVFrRFRBQ3gyUUw1?=
 =?utf-8?B?bWhOeHNOdTVUeUllejFLU3ErZkxHTzE2L3dYV3FENndDTWJaOGplYWVnUzFm?=
 =?utf-8?B?aUpIaFVFOHpuMy8zZkZlTWYrYUtHenl6RUNvdStKRlVYRzA0K1NvZkF5WWIz?=
 =?utf-8?Q?4BSDF30VKVtkA6iU4buGBncUY8966+MMcEu1stL6jtlh/?=
X-MS-Exchange-AntiSpam-MessageData-1: UtU/eG4dDb4VfA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555b17c5-f84d-4a3c-a731-08df38e50ceb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:27:32.6585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnDOoLJ5ilRxdb+JSKO3hBHYJXterYI+kr4XMA4S4BpKiK5teKVIN0/SoybU0ixyDj2OAHX9P0IEMH805KlXhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481

On Mon Nov 2, 2026 at 9:09 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> `driver_write_area` and `driver_read_area` both branch on the relative
> position of the read and write pointers to decide where the two slices
> they return end. This works for msgq v0, where the pointers are indices
> into the ring, but msgq v2 (used by the r000 firmware) keeps them in
> BAR0 registers as free-running counters, so the branches and their
> SAFETY arguments would have to be rewritten for it.
>
> Instead, compute the number of slots available to the driver and the
> slot they start at, and derive the slices from that. The slot counts
> come from one helper per queue, which are the only two places msgq v2
> will need to touch.
>
> Use I/O projections to limit the amount of unsafe code to the bare
> minimum.
>
> No functional change intended.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 130 +++++++++++++++++---------------=
------
>  1 file changed, 58 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 90e26c4dcc28..33cb9174c1e6 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -19,8 +19,8 @@
>          Io, //
>      },
>      new_mutex,
> +    num::casts::FromSafeCast,
>      prelude::*,
> -    ptr,
>      sync::{
>          barrier::{
>              dma_mb,
> @@ -186,60 +186,58 @@ fn new(dev: &'a device::Device<device::Bound>, bar:=
 Bar0<'a>) -> Result<Self> {
>      /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
>      /// that case the second slice will have a non-zero length.
>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut=
 [[u8; GSP_PAGE_SIZE]]) {
> -        let tx =3D self.cpu_write_ptr();
> -        let rx =3D self.gsp_read_ptr();
> +        let avail =3D usize::from_safe_cast(self.cpuq_free_slots());
> +        let w_slot =3D usize::from_safe_cast(self.cpu_write_ptr());
> =20
> -        // Pointer to the first entry of the CPU message queue.
> -        let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq=
.data[build: 0]);
> +        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu_=
write_ptr`, so the
> +        // subtraction cannot underflow.
> +        let before_wrap =3D avail.min(cv!(MSGQ_NUM_PAGES =3D> usize) - w=
_slot);
> +        // Per the line above, `before_wrap` is less or equal to `avail`=
 so the subtraction cannot
> +        // underflow.
> +        let after_wrap =3D avail - before_wrap;
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
> +        // PANIC: `w_slot + before_wrap` is at most `MSGQ_NUM_PAGES` by =
construction of
> +        // `before_wrap`.
> +        let after =3D io_project!(self.mem, .cpuq.msgq.data[panic: w_slo=
t..w_slot + before_wrap]);
> +        // PANIC: `after_wrap` is at most `avail`, which is below `MSGQ_=
NUM_PAGES`.
> +        let before =3D io_project!(self.mem, .cpuq.msgq.data[panic: ..af=
ter_wrap]);

It looks like compared to v1, this kept the `after` and `before` names I
suggested but changed the indices (e.g. in_after =3D> before_wrap). It
means that "before" and "after" are being used in two different ways in
this function ("after wrapping" and "after write pointer"). What about
picking one usage for the entire function? Either is fine imo. Same for
the other spot (read side).

With that changed:

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>


