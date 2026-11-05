Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886668;
	b=4a/h7uW9jJ29wAukW7DnebNy11ZA/JQaSigdX7T3r6yJbIS0CBzGJ9iRWwTOiqglI6q3
	 3ELRPbXhukReFemhYeXuSVBAm/9Zd/BdPfYIqetQiGD2SmRDe4HmQi6ax1UnZXddYxXnl
	 LopkKdgYlphJHjhkp3TeSRi3bzVgpNhh1UAlNxVtoM6eF36PiwmKngMZm2i0BRftw65wZ
	 8lFlIhvZXan0PY84K8u6b23lD+do4Bhpv8bzBvnB5tjhPkvomX1wvEow24L5qNKeSs9va
	 Q0abRoqGscjMsmr6yaaHjR2MJgXD2ocihyK/pxDATPz5yFLt1BPjuW0HdcBU+ZHsqXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886668;
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
	bh=cK+pfNJgfzQoHcRNKWj0eQQhYht4DqPPClq7lJ76WvE=;
	b=AyHskfTnfG3spXBwgtGEb9zmcOe59jfPgR702oO9SPzGyYex50oAPslxWkl/k5KfqUWP
	 x6JNHCpyFk3RCV5ZTU5sCvtFiVREpkzh1FMbKJ41tQXhTv4aUzwwffh0oLJJ0Yg9JJik2
	 TaVxIp8kvpPtuxsxwLp8TvLEuSEe60+1wsZ1bTQslJgPlY233xMPOJRYWiIaI0zowvLn7
	 EIxUch1eAaJkOlYggTyC1yidA/44t2676sak6KKyaO9OVZHDTVFyak7FpnODEuajEFVbf
	 cHC6241sB1nn3kGMSGExyJXPAgzD62o2x27BXIzFf4kXFliP7cnDc2T9xYUyblAV9IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UeNS4xcs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.43
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73144606A31B
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73144606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UeNS4xcs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b14nOBdhUb7OaAirOfIhQkqM7yPh1a0PAitnd48GingvEWvjGMVtcLi9VIMszbwd2fkYQTm+C5LuWBZZn21KpE5yu34qOuF0vIuISZgvXlW6m/AAUriEmUwG02155aydx6TaZw40uWUUrS8jBTBSxgB9EcdU7XoyzTi60Z0GBp1OE7qgUIhFZ4g3ColBqgL7uUAAu3lu6PNWMwufIEvDybbqqO60AUPSfXmoRVRu76TlRI+TiCuQmnUNq+96gY4FLsESYiuAVtrcI4or27VFwj9udkwjS0zNcU39L5e1XuE7LS3BQvh3K1j5l4kBipVWlMUM+2K74FglQpbaTlfCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK+pfNJgfzQoHcRNKWj0eQQhYht4DqPPClq7lJ76WvE=;
 b=xF+fLGx11MVBLUGV0s9nk2QH3evMKGHzq07CjCreQxkpCKvd3gex/MuSxjuEsnchlzfD3viqmU8RXoXZRb5+ZuNer+dJDC6Wyq3oL8XhtaP8QmxaNAvzNdL2PMfPwtiUnPT96o8qB5AW8oeCoJSswN1rzon6ASXEmawrAR189k10kCZVOcrm6YPYshORc/moaLzyvjYoiT2/4QoFNgxcDHQY5kE7rJ3OkWBNbBTV/qExIINwezPw3/6PdvWfdjUHekN8qKSyC0vSXEoaLSySitlEJCRVlA450K75RsR8B3SoWcBXR7s5BIehGoIaYBW+Edh9UVkR30F/uTGk7ETmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cK+pfNJgfzQoHcRNKWj0eQQhYht4DqPPClq7lJ76WvE=;
 b=UeNS4xcsAz4dwpCLZTElMZpLKLZx+EyMbRuzRYSduXesN1JOUbNdQec/AhG0WIZi1vw+wdzqgCfl1DMfcB+cW96AtT4ufOT3gUj7XrS6NtsVjAtqzXAa61iJMoQiw6tFEOGgyJoci45sJoWByHIiOvP/6I+ahvbSBSLfjGskdtwSWnnaeGUiq2GiksFeUij9XO8dnxa4neFOH0+mYkNRMDt+ooT9yA99qw2gN+fJAGhOXj8YkC9DFdRyyn1qX7K9K6bxW/ao4R1dA4WrnJsWpNhYP3/Tj7TRHC/20QSQsRLZ/v25GfD1V+A19Bky3gjQIQbacvngO4Jvam31goMPug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 13:51:03 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 13:51:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 22:50:59 +0900
Message-Id: <DMNBQYC8KTD1.31I6CHXMYL2NS@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] gpu: nova-core: falcon: allow DMEM DMA transfers to
 request tagging
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf980ab-8a48-4b79-630f-08df3b43d48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|10067099003|3023799007|4143699003|11063799006|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261021135927099003|261022115727099003|56012099006|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	YK3/Ko77JABonty+vAP4LmChc2vmyNwn6yec6TmMjHTQ6zWPUgr1k1KTBdfPH6oEG9Qulc/oXxj+ocQt2H88L92AMH+SMzUHCoMbWouTx0GOnAgBrgb7EI/kFca0oglLcdhBGCzTcAe/IaLdhE5lhhP33IO7SDHK7XQ60n2mFXkCujrwnnld5DoBfkWY1nJn/MAxkF3ijz+eOPp0nIy1M6sGVnS8lhoDV7R7R7C6Pcrb1CFx7puC6ANT0R0fCsM565IV8xcbfuB6yA4yTLsLTveLEF4Y8vttMMmhQDfWtkd8h51V0YjtbVbrLkhkMiakX1K/Xp17bkOePnKqOPMuKu3kMMVK05R0z6Kcc4jd8zc1larChaKYP8ZlDRaF3Xmhs7dHGqf2qhSQSgQTA8XaLvABNV+5BMFv5B3LGmBHTJMxWKPvLW4NBEx2rSIMWv4IC1KjAWYIQo7hbXN3QsuLmDsD9j5KS8k6kcvuQk94nEVvU+K5d1WT6z8byL8JrB08sq+DSoPSoW1/17QnPUq0y2qmkLw6VXEjTkP8R7hJPZgncmRg0secda6sb0KgXbrlnpMd1t84bASWzYNCZkSbyL9+cdpKJHueCcOCHZN7gX3PIrjg6DlixCnYdkGtY//qFe1JJHCvDqGFEKm3YiMg3ZejJgoIHgxt5AqVT8e8zH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(4143699003)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021135927099003)(261022115727099003)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTRwYWxnUW9DT3hURlR1Sk41MitudWg2OEptVDJmYlRNTktyZ3JOUER6M2Rx?=
 =?utf-8?B?UFJ5cVNXU3MxOWlkcnhoVU5pbGxqTGlKTlVrYmM1OFBwZllmQXlPUTU0Q1VY?=
 =?utf-8?B?RnRWNUFud1gwcFNQYm52Nmt6Z215OWRUdytRZW9RbU5ScWRTNGI4b1ZSU3JL?=
 =?utf-8?B?dmxBejhQOUg0Z0llWmJpVStIT2g2S0RGQ1lmbGpTNjgyRWJqcmZHbllDYkt0?=
 =?utf-8?B?cHNZMXM3dUdzQmdnU3p0MTZ6UCszK1lYTUlRN3J2VnphUmFSQ1htaTFjTEkr?=
 =?utf-8?B?NkJySkVVRUVYc2E0WWx3UDlLNTRYU3p1VHhyY3VnYkVGUHNOQ2E4d2FJblpx?=
 =?utf-8?B?QXZmdUFIQVNEZUlxSFQzR1V6Q2lrbURPQllTMGF3Rjh6aVFxMGM0MWxqczBx?=
 =?utf-8?B?RC93UG91a21FQU1KTlBZdytsa1dMN1VXa1FaazRjeW8xQUVSaEZKOWZ5RDlk?=
 =?utf-8?B?Vlhnb0FHVTJOYit1ZXB0dzJrbHpUQXlLbnpjcEV4RkNpdmoyQ2pLVThnT1VO?=
 =?utf-8?B?SnhhQlZpL2FoVSt1OHNzY1lhZjRzU2FqQjErSUhXM0pubnY2TzNUT2dNQzMx?=
 =?utf-8?B?S2l6QzUrOVBrenNRQWJLOWZwVUwzUEdPbSs0Qldqc0xReFNsb1IvODBnNFVS?=
 =?utf-8?B?cVRKcE45c3A2SXhZQzNmM0ZROHFUMzFWb1FVdms1Nkk3K0NVNitZcHM4cCtu?=
 =?utf-8?B?Y1dXRlhTc0JPRWY4eGtIaHlwVG9lKzczSm5neHJIaE92U0Fsa2pjNVNocG52?=
 =?utf-8?B?VDBhd1NScEFDN0x0RE1IWTJXQnRzY3QyaGhQcldQVVFsdnNxRTZ3dVRqbEhK?=
 =?utf-8?B?UVdKREtIVHk2ckxZZ0FkTG95M2swdTFEQUNtWC9UOFNjR1ZEZHozWWpyVFJy?=
 =?utf-8?B?UEl3bjVUaHBaT2xuelhRNWdIR2x0Qmw1dlhOdEFpTkRKaFpmK2lRVmRDNXhv?=
 =?utf-8?B?bEcwV0pkSFUrV3FWUHAzWklWUEtCVzQ1ZDB2OXBab0hKNitmN3grN1hROCsv?=
 =?utf-8?B?YXRES2NkVHBvRzlTU2ZrN3lNY1FUcHU2R2FSbGJzejNwZDRLYTNyUVpWOFFQ?=
 =?utf-8?B?MzFjSW8xbHAwWDd5dHE2U1Fwem1nOWpOSDhnWEhOMzZscnNSUVdld04rZXV5?=
 =?utf-8?B?Y1hRaFZodUJSTVQ5S2xWdlh5ZFFqbzZwb3JEQ2hPb0RMWDREdzdIM3grNmZO?=
 =?utf-8?B?aEZHNnhSQ01rNlZGREhncXlST0pkT0ZFZTk0R0lrV3hJcGVyY0dvbzJMVW1I?=
 =?utf-8?B?T1d4elN4dzR3aWxPa054UnRGYkNUUHhXbFRXdmMva2RQMkJ5QVV6dTY0QTdp?=
 =?utf-8?B?bWFlQzN0THN2ZlRxTTVCUnFsSFJ3ZHdXV2dwU256RG5kZlRwdUQrcC91ODNF?=
 =?utf-8?B?U0p5Z1lvMWtHYis2aUdON0JOYWdwenhDU1o5TTB2dGRKeDNqWXlwRHhjc2dK?=
 =?utf-8?B?Wkp2QVVDaHJaNWFVcHJrNXRiTzlZdjFLbDFBMFFJN0xlMGdCd21KMUpST2tJ?=
 =?utf-8?B?ZFV2ejZzSGtvNmxqdE1aaElORytWZHduQitiY2puYmE3bGRURzBtb3VyUVRo?=
 =?utf-8?B?MVdBNkxFUFZxYTNWeW55ZHh6b3FURGVlQVNWZEl6NjY0TVVSaWNUVmJCeWFL?=
 =?utf-8?B?UGhEVlkreStaUThyTWZXSFoydzB6UHFvTjJlMmdTTk1lcitjODVwdWFvamRC?=
 =?utf-8?B?NnV5VE5GaEpVQ21XYWZwUG1yY1Y1c0p6RmZmaVpWREpweVZ5eDF6TEViUGoz?=
 =?utf-8?B?cHN3S01kZDNIaDd1NnVVaDlDUGxKUkN0L3NNNzFqUDBOQmtsd0kvUkhFYS9u?=
 =?utf-8?B?MkxjdWxaZlpzWUYyQU1HdWhnU1B5WnZ2dEVPOGljMUZnaDQwdDhTUkM2Um1Q?=
 =?utf-8?B?UE0xVXNkMGpKaGdmSzNvMkZteVYzZEJKNTJUa2xxSEtxSHJVY2pud0hYclB6?=
 =?utf-8?B?cTVsT2VWbUo1T0ZTWjNMNXByT2xuVUJVQ0pPNTM3dlVNUTBoam1WWjBqR1ow?=
 =?utf-8?B?SjNOWUdKaDlBcjRCWXhWUGtOcHArMHZabWp4VUlXK2pXa3lJa2cwb3ZZbm9T?=
 =?utf-8?B?TGtLTDdLakptT20wR0l6TDdCSkV6L0twL3diVDZKZjNxZWJkajM4cWt3OUtM?=
 =?utf-8?B?b0JmbWcyVk0vYko4NWJHdG8xdW9uL1lHY0FGWjE4RU5oTGJMaVREWGg3N2lm?=
 =?utf-8?B?MWM1RE9kd2p1ZWIzbXBxTmczREovN21hTzhtOU9SdGYybVR0dGpiYzgrWkVV?=
 =?utf-8?B?M0RvS0tOWm1iMExlbFJMT0FwQ1BYVGhwcEVnQ1h5RWxOQzZXRytnNkhnMUR1?=
 =?utf-8?B?ajU2QmZuTUxkeGc2REVrQTVMVmZQeHZlbmNSckFEalF2aEJDYmRwOEE0Q1RM?=
 =?utf-8?Q?n076WOjnH7BjBcrIBFYBfwp6CYh5WzFjooY9w7DUeKXtt?=
X-MS-Exchange-AntiSpam-MessageData-1: n5PSMEVIch9Avg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf980ab-8a48-4b79-630f-08df3b43d48f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:51:02.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMzr/IUP0I2I34Ruh7hAfuKxx6pJYx/nwR2d1bwjQGCke0GnGqE/9KLvG5jhtkCGa1bu9n4JIAnt95GopYGoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> Add a tag flag to FalconMem::Dmem and set DMATRFCMD's DMTAG bit from it.
>
> This is needed for the r000 load-and-execute event which specifies
> whether DMEM should be tagged or not.
>
> No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

It would be nice if this explained what the tagging was.

> ---
>  drivers/gpu/nova-core/falcon.rs | 20 +++++++++++++-------
>  drivers/gpu/nova-core/regs.rs   |  2 +-
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 1bceb38c33c6..f48f2eabab0f 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -131,8 +131,9 @@ pub(crate) enum FalconMem {
>      /// Non-Secure Instruction Memory.
>      #[expect(unused)]
>      ImemNonSecure,
> -    /// Data Memory.
> -    Dmem,
> +    /// Data Memory. If `tag` is set, a transfer into DMEM also tags eac=
h block with its source
> +    /// offset, which is then the DMEM virtual address of the image.
> +    Dmem { tag: bool },
>  }
> =20
>  bounded_enum! {
> @@ -529,9 +530,9 @@ fn dma_wr(
>          // code addresses in the firmware (and the boot vector) are virt=
ual.
>          //
>          // For DMEM, the start offset is folded into the DMA address.
> -        let (src_start, dma_start) =3D match target_mem {
> -            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load_=
offsets.src_start, 0),
> -            FalconMem::Dmem =3D> (0, usize::from_safe_cast(load_offsets.=
src_start)),
> +        let (src_start, dma_start, tag_dmem) =3D match target_mem {
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load_=
offsets.src_start, 0, false),
> +            FalconMem::Dmem { tag } =3D> (0, usize::from_safe_cast(load_=
offsets.src_start), tag),

I am not sure, but is it correct to have `src_start` as zero for
tag=3D=3Dtrue here? Surely something should change based on the value of ta=
g
w.r.t. the addressing.

>          };
> =20
>          let dma_address =3D {
> @@ -568,7 +569,8 @@ fn dma_wr(
> =20
>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
>              .with_size(DmaTrfCmdSize::Size256B)
> -            .with_falcon_mem(target_mem);
> +            .with_falcon_mem(target_mem)
> +            .with_set_dmtag(tag_dmem);

Instead of taking tag_dmem out of FalconMem and using
.with_set_dmtag(tag_dmem), let `with_falcon_mem` set it? It looks like
it's always just passed through.
