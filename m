Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503373;
	b=bWuXWv2Arzv81w0UzVJkwA3Ls6Lpp7OfeZVxu2bgnPI18Jm4MNeQKOSuqNL79oKhDMYl
	 HMTkRatKzgQ8ZaOxvHRi/NjNJbV/xZot/eEs3PqVNSIn/11K7agyINePaH+BmCwCUEUC6
	 Z9a5cixiachklIqyBfUjRZ7GzgYy/n+6qubUNeKOJKLX15eep86gtEw2Z41AlUH8ef89f
	 ICTeZ0cIcRuHY+pH22RS6tXwtUwIyFpGHVE9GiG00htcl6tzy5vRo8JV118ubgyYwwfnD
	 dA9zHBseKeHoHpwjvQNFIKKioNA3MN9LBQzNV4hU1CnTqjV/7bbUGcM5ShT8AuL+JmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503373;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=TCaFgbyqAbFUNpSAyth8LDcMX1ki3QNnl5hrFJ6IPe4=;
	b=sRG7lVj0tnFhbKD4oBrOXlNa0RO2g4wFqTmB9aZ0MhGqDQ6BKBpQ79oDYu0v168Se3jT
	 fBPkeX8+sSiyWnipqe9Xozu9fWhtXOYiRbT9nYXG0glErVKrWw6dyxZpkJN0Nw/dEB0pO
	 M3irGjUufNLwRw9pYyw5obDWBF7WhrVo5TjWNqBkWusLMEF79NBQ1Cnyv2cApU/r15X1q
	 qm00TZHF1YCbFgWMnvxYxEL17XmuhcLX1mhVikdDQcxnoLPrOJ7E/RzE9nA6mGRNs1ym1
	 24EcxTcThbIPQyrL2lwF1+tCOwGR5EUp/RKiCPonhHrbm+F3oW1Q3rA47I6S8Mxk6lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxMej6VN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F852606A31E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F852606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxMej6VN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgwsHGzcf93kOsrZ6lvt+eMbFQ30/4samVGuytAQVVUHLMfA+g8Ff17ekH/ETusTaFxI0/0hHLVhAWyFE6AszYHiY6bEcoBPCZ5J2GIiFOmnUB7oP4MojzZPoeVCPmBo6M02kTuw7Fm1CTgnjRmxPP9dJ5JVpCKOurMFjEYQyYjoT2q+OsIgtkvMbnxjVdSz7lTdnQ2837oTYJ0/BNQmrXZJ4s70umqbNyUFB60B1VJVhxtfmsVUjfxCi2eI+6aZRO6nzdB1uRcC8EfOozZX3LUkyOT3l6/7gvR2HfTp/lSvt80Gepr2+pXmGzd8XRlml45IVRQorJz/1T6S6L6cUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCaFgbyqAbFUNpSAyth8LDcMX1ki3QNnl5hrFJ6IPe4=;
 b=eXyCUE8GBTQDac5hsbC4YyV9NUisCAj4ESDkf8wVdaVN3VGs3uxOEqBVu1fIJZQPFXo9N1tus3XxGGzw7WbQiwsyRdlAdX9AlPuzeZ20YCWnB+LVIdJc6RiOhvQ4tS8a38rjs2d/dZeji1F2wWMbkB7gMsNhoaAltNEflWxqtz5Ih+gaiNtGyfhDFf7aU597etVgmHr5oz8nwb3JB6SB2JoX1s/mSFoIzvALp1MisN40sKCn8C9sgwbLs92r7Fbk4uEB9HULXj9ytxN9+HSstVzqtsu52PvQKiQihe6yFKLXZTOkboM5Gd5Ik8G1ermeljMVQyXj/t0tJYRKQG6Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCaFgbyqAbFUNpSAyth8LDcMX1ki3QNnl5hrFJ6IPe4=;
 b=pxMej6VNwWyOYWxMvuR9IGRcKBrlnUWY3I12Sft5nQBAwLqVKUKRdPx1m3FWLTozB3wL/nTm1krNZctDg52dRGjQWxfs4L7XdIgA97DVlxJNWBZPVRTyOgGgDUTUX1Q8PWT9tCU5rRehsVwWMzbZk8hIy2y2nCw3N8gQhRVT3sk52g7FdoGvkbYDczdy99SDmD9yE149IAam8LylBb6qjbL1IbWto6wYZaHwH4OdNFfsdhKvlEKnwcqF56dsPCAaFPgsEqDDeRpomQhXmWzuc3V0cljsKaH5XxbN2V33Nfhw+u+qTSC1rwfjZRmwnu6XoJDYR2UW7DTOWaZsavsiww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 06:56:07 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:56:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 15:56:03 +0900
Message-Id: <DN38TM2JOCRB.2FWSW6TESHUT4@nvidia.com>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: add TLV versions of WPR heap
 size functions
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261121002847.3358679-1-ttabi@nvidia.com>
 <20261121002847.3358679-6-ttabi@nvidia.com>
In-Reply-To: <20261121002847.3358679-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2a51a3-63df-48e7-7854-08df49f8039c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|23010399003|366016|22082099003|6133799003|261009223027099003|18002099003|3023799007|56012099006|261102123227099003|10067099003|261026140227099003|4143699003|11063799006|261021123027099003|261022105027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	JTkrZYsn4DFDBOKiwj1v/S5ZCBzVqbva9e6XbEN3QX8b91qJjlLUN9PGoD6aEo7WHTyjWpUuE566Df/1lB/0IRBlwakeZomICfe8xJAKuNmJy0us9z72vg3hSvK4xkLQkjb0mL5ornO03jN/fx5Skj+3rmoubaUQtSOZDWpyVC+4ANPRN08Haq0BzttfIjXdYIqrYcytm9XC6KqpJU/RCbPNEhToEwIgU9HkJh3lkUQiwSp9smLvm7J5ZNX8WvIzwh02WTCaCYghaoEkhyyukHnz+sbi5czAA0phZdU3Hxhch/0r3QOUpsLFw4Qi67itTI0z8BjoUHFuh9lXhKfoIpIvqvjJenZWamXybrC1W0p/Eaoc6I8Lro4LJEuKdWemFAG6hKvFHM87MGL3uGsWsnLSE/BsiMiZ4ZnHV7nFocr8nKfENJ2f7LjCtZ3Zup1KXq1AwK3faYFkzQM1c4C50Q6UdCo91LBuJ4L0adstA6QNydYQJOhktDyTdkihmYDR8nYKs8Cf5GjDLX32SZYLXPeN8zaQHb4neJ3isva9WDW80NQnk5LxBmA9tFZ3qGXfizzqCpharElepwOB2PTNhRBICJpzvMWhsmAQRZgRJNnlDRxKTnhS1EtxZoeOeHBnkmIqLQhjKHsuHxUwsQnWWLaj0UnAWSezETf55zHT0rA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(22082099003)(6133799003)(261009223027099003)(18002099003)(3023799007)(56012099006)(261102123227099003)(10067099003)(261026140227099003)(4143699003)(11063799006)(261021123027099003)(261022105027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJXZVhiK05TNFBYdFNWU1o4MjVPc1ZvYlVCNjVrOEd3dmI1RU1TOElJaTVq?=
 =?utf-8?B?U1J3R2ZkbGdpTE5mM2J5MXYxZldadUdIUFR1cGFnNVpib1BCOE9CM2ZRRUs4?=
 =?utf-8?B?TmF6Y0lyOVNBKzQ2bGNxdkxmYWdacDcxWW5nUGQ4UXNoQkY4T2RyT0IvTUNx?=
 =?utf-8?B?d0xiSE5wTXFwcG9aU01Lb1M4My9ZZ3RKb05jS2doZlpuYTJjdVpXQVYzTFJT?=
 =?utf-8?B?cFdjOXZ4SjV1WkZPdTV6c04wSFNLRGM5b3plcXNta3VoUnBoYVRNRkFxVkJ1?=
 =?utf-8?B?RnJQYUZHYjVTTk1iYnllNjJtWFhGNENPcDZzdUhHQ3l2SEpUWHF5SzNGYkZQ?=
 =?utf-8?B?K21tNGZmSFY3NklQL3BHa0hLN1VFdGlyN0tyM2thdFk4WmRhWWhkaVN0WUwr?=
 =?utf-8?B?ZnlkMTUrQkswdHJRL3pLbytPdGFhZ0RnN3FRTGFyWXhyb3hwNldpc0NxMDI2?=
 =?utf-8?B?WkxMamlyR3VDOWhFT3pMYWdoZVltZmtMWFUvd0NkN2dwd1VUU1phZzFpMmNH?=
 =?utf-8?B?YmhEYTl5bWs1SWRFUlZuRkZpWU91cVNNMVFCOHhVMzZlbkVqMlVzQ3VWT2dH?=
 =?utf-8?B?YXh5RjVaSTYxRTFYbUxLM2hiTmkyRWYrdnRRZmwxMmtrWWtZbUcrN09lcnU5?=
 =?utf-8?B?amJ0ekI4dXNhRWNzSXRlSWtITVhyV3g2MEMxVjBpZTB6bG53N0cwNnBUa2lG?=
 =?utf-8?B?THhSSlhwZXdpNk5nQ2Z0djlVYkxIekFFMHVvY1IwSncray9vcE9vZ2FWS1Mr?=
 =?utf-8?B?Vi9UbFR5OGFlSHo0WUlLS1NYcWtUQTZ2SFJzZE93cCtkQUpGNEZrbXBvQWx5?=
 =?utf-8?B?NGlIUWpiZU9JcUNYS0toY0dmcGZXTTJGZkNjKzhyM09GaWVNOGhTNWszUzds?=
 =?utf-8?B?Z0htbHdlSTU4RnJ5dzdXYnppUGRMM0pIUTAxeU91S0lCcVVjWC9QcCtOTTV1?=
 =?utf-8?B?MEV0cTlHTkJvR2FkRFpiazhiaDNKMVVaOTBxNk1VdE1oU3JuMG9TQjBzcEQr?=
 =?utf-8?B?V0pEVWRraWE4MFcxWWUvNlhnTUVOSmlWdU5TSUhCTWtBc3dIYm9oczhJanNm?=
 =?utf-8?B?MGZlTCswNFNKTktMeitSbGNwbm02ZHNsaUZraDJNdWJWK2lQeHhiSW41VXNG?=
 =?utf-8?B?S3VrMUZXQlE3V2U5RmhyUEtaTWsxdFJCVzV4Znk3cU92YytEdGlaR0RxSHAw?=
 =?utf-8?B?RUNVMldVZVRzSUNXaGJGNE1sUTUvdmtpcnB0K2xEeXRwT2xyRUE0U2M1WnEx?=
 =?utf-8?B?TVZPdkJHaVRyQW9tLzdFWDZxdTJ1QW1XTkVGZUNxR0VEMTk4VnJXNFR4SDZz?=
 =?utf-8?B?dC9kaXpicFBYVXE4OGpUOEVnMU5lM0lRM3lMN05rT1JkMXVublcvcUtLaHhY?=
 =?utf-8?B?N0tXNU1MN3hLNFFSUDZubTNKcmMyWEsxTEgzQmMzaS9BNGFJVXhJUnRWeXFY?=
 =?utf-8?B?ZmNpVzZHdnpBcGRVRVVKWURqTDRzSUZHNUdUOFc0Z2FMYlpWL2Z0THVkK0t3?=
 =?utf-8?B?c1dvUEpsTFNtR0JISEpOLzZacEIwWVJIdWRCV2ZFL2xDaWlRRHowTzJTTkpH?=
 =?utf-8?B?c29BWFJaWG5KVXAxeHdBUDdsOUNxZTlrb3BBbEFYSUdGUXIzOFNTVkNNYk9H?=
 =?utf-8?B?SGFKYjRtNDdYSU10OWtDUXl1NUhwQktBZ0V0WkdvTi9ZQnlid0pQc21vYU43?=
 =?utf-8?B?dGlXTDd1ZHVycUUxQ3Q1S2FDeklVMU43Q2Q2ZGR1cHBKSDFWYS9wQ0g5RUts?=
 =?utf-8?B?RjMrcmlTVEF6MEE2dTd6bDZ0SkpOZHk1OU81WVZhT1pKbkV6cnQ1LzQwQjZW?=
 =?utf-8?B?ditZRndPcEowYWo2bXRwb1c4QTU1anFlVEtMNzFkdzEzcTBMbGpvVXNnNkdu?=
 =?utf-8?B?Qml5cVpNMmc4STNLRXNEMm1CRkkvRHpwaW1uZkRFakRCMmdXeHBmUG5zWFpl?=
 =?utf-8?B?QXBwYXlMenpPTFNpWWFnL0p6Z0xQVVB1eUltdDVNTVBlZ2pKb1RPSDBxL0g4?=
 =?utf-8?B?aXMrUFYrQjZSUmtMdHBKV0dpY0tlU0xHYWNsWVh0a3FMT1g5Z2x1WGlUMVA3?=
 =?utf-8?B?dkNTVWZCNHYzZXcvTzIxbzRvcnR3RTB3ZmsrRE1CZ3VGZ0s0TUR1WUJsT3BV?=
 =?utf-8?B?bHhDNDg3RjRwTDRiUVlGTGRlSjkrajY0ZXlZbUxyUng4V1JVclJvUkdCVkdz?=
 =?utf-8?B?blpRZHJEQjV6Ri8zVmNBYVRleHlzaCtTVVVOOXhoZ1diQ1ZjNkpyZDBLT2I4?=
 =?utf-8?B?SVNnbnp1MUVCWDRmR044RmZlZWM1eHZBZWxJejRsQmxPRnNGM2RZK2NiaCtO?=
 =?utf-8?B?Q05MNjB0MzlRbGdtMVAvUWRGSzBFT2wxUDMrT3ZIb1ZyM3ZncUdKOTl3YlQ5?=
 =?utf-8?Q?QQWu3jdD28Yx7ANoxSWcQnXsFVWni1tMUOkTct9QeZwbU?=
X-MS-Exchange-AntiSpam-MessageData-1: imrd1pxk5a17tQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2a51a3-63df-48e7-7854-08df49f8039c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:56:07.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH+M0Qf0SvBymL6NUK850IaPpjquUVM1UKa/rGMet1R0WsDake84PhAk113Q/W7eRJkoDoE3eh/TL1RojA+Wdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

On Sat Nov 21, 2026 at 9:28 AM JST, Timur Tabi wrote:
> Add TLV versions of vgpu_wpr_heap_size() and wpr_heap_size() to
> GspFwHeapParams.  These complement the same functions in LibosParams.
> We add them to GspFwHeapParams because LibosParams will be removed
> in a future commit, and the driver will use the GspFwHeapParams
> version instead.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 837f7a522429..66f5bb1d0a8f 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -68,13 +68,9 @@
> =20
>  /// Heap memory requirements and constraints for booting GSP-RM.
>  pub(crate) struct GspFwHeapParams {
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_base_size: u64,
> -    #[expect(unused)]
>      tlv_gsp_hw_heap_size_per_gb: u64,
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_base_size_vgpu: u64,
> -    #[expect(unused)]
>      tlv_gsp_fw_heap_size_per_vm: u64,
>      pub(crate) tlv_pmu_reserved_size: u32,
>      pub(crate) tlv_non_wpr_heap_size: u64,
> @@ -127,6 +123,35 @@ fn management_overhead(fb_size: u64) -> Result<u64> =
{
>              .align_up(GSP_HEAP_ALIGNMENT)
>              .ok_or(EINVAL)
>      }
> +
> +    /// Returns the WPR heap size to reserve when vGPU is enabled.
> +    #[expect(unused)]
> +    pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u6=
4> {
> +        //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)

nit: stray commented out code

> +        let vm_size =3D self
> +            .tlv_gsp_fw_heap_size_per_vm
> +            .checked_mul(u64::from(total_vfs))
> +            .and_then(|size| size.align_up(GSP_HEAP_ALIGNMENT))
> +            .ok_or(EINVAL)?;
> +
> +        Ok(self.tlv_gsp_fw_heap_base_size_vgpu.saturating_add(vm_size))

nit: pretty easy to checked_add here too imo

With above changes:
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

