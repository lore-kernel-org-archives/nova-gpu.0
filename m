Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794209018;
	b=hgZO3yIbDL2wO+N9Jj6Ete87viB6X3SOVaDKmEPqeXWJOC3MU2Bcgzm4lOP6u6Ky+o2e
	 B1GzJXAeHEmXNkIp0Qq4WTWju1zNk17MnJgm5anJF3Yd35HhastIXGkwIn+AInGb37Saw
	 hkzCKyzSwDR+/AXfGfHckH/lH88ClhmoAhJc++DWiIlAWbRx7XAVfgEttquvhS7xDp0o7
	 QnnSzKIgcdaDgF3GSrnGSLZhj+0oZuTH8vh0+nX9cesqzVNIcOsRL38iJPpYaZisLM/H7
	 b2puffNh49ZPAlaNaUGJXnw8Btdhj3OffRPC8ilZO+jO4qA5B3SFEFfGXxLfzdPBZCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209018;
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
	bh=1QrWikTQvzrvGrHmovZnhk2EwQVBDZv6IO/+tgWarOk=;
	b=pqh9s+CPPZkyKpycn/VfQEUl9nl67lRbGAlbCpspQWlY386OsuzpRV8OHZuobk/MmWa3
	 TNtJIdSxnRlii15HVBdF3Wifpm3+0JRUJCrPjTLl7duGGX7NzcQUpY9wiDxh74S9xbFD2
	 w8z0HZ4Eg/MbzNbTg9uj4NPUclXY3HoGWZy1DAxHa/QwdIykxofJSZjUONYDcN6w+FRVE
	 RuGxgH/OykALT4IwHE8fXn7PGu/AHBdgOQ2cpPX23US2M57XDRskECx8RPvurcmZTusj+
	 VMgnNwmMd4a5MsoKqhBBduL+m1bf8K3CTS2j4tiPDzKaPTSw5cMFCHaOS+/WnOzdzDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VjQw+tUk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.51
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF6606A321
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 07:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BF6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VjQw+tUk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMLWPg8LIfh1tlNwZF35FF/xfIKTmEQL0HunWARPtlp+Q54Ol/35sRkiNV0RoBQZvOtTpYElGT7+fifws/Px2nC7bVHvHxzkZ+GmPxbI1ZOYMGti305WsPEtRR7/lUKpGkeRADYF1kU9ux5/A10Vs/Z1LYN0tN2RUwh2jhwDx0SxD1WaiwcvJ4FloouiivYLb1ZMpS48JkgBN0h6uXOOUtMVx5iba2MEjhqQGx2D1OPw9qv+B1hNro8ZSpUVuPMQFsGbYBgUCcb0FwTrY9t67LFE3kSNOh/0XIozLprRaK8kNHVdMbM+1DtZVoamvzESHAcoQYYuILqRE5XMHI1DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QrWikTQvzrvGrHmovZnhk2EwQVBDZv6IO/+tgWarOk=;
 b=JUtgK3aQVvMWZmAQdGZ9LXyuUHaGSbGs8FPiNm7m8HC/XOmGzn72LvV7BjCJSD37CR0OPPfBigDfNlsh5Ck5lZs/NhKo7IuOzDIjAzitM9ieLfDkG2SPuEnEiQyOSKpQ49e77kscNFGgLOmRVq7d9vkksMCMdh7hHcxAdf7DLmXqyGhIe87F2Uw3ZR4xWknyMbrZnwodCkiT9MiNIqLPrRQyBtSA3XjhUkFhY51VvAwag5fJICO8Ucr5amkhtXSlTBTA7zfYYsUwGts1r2jQu7c9RBatP2PiLaO/2isXqS7uQQZPg7pGKbgX0Fnnjhh5JAX1UdahnP8zVRgYAVD+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QrWikTQvzrvGrHmovZnhk2EwQVBDZv6IO/+tgWarOk=;
 b=VjQw+tUkbruBNKdZtrjCSzQSJ57utaWKRpW7ckxL5ensfaa2sD09IMfhl4U/C2ntJoQU+G09Zh7zUf3msC+LZ3Gv/7ODbBRIBGkpS+vVnPjapeVPeBm9R2cFymkEy6GM73GrWpAw88+5jjPkQ4PcaDchYlNSZ+G4Z3Qppcx7CsEpkTHSXlLCpU8CcP3ntgZxI69dbD3XkWNa6kSp+OyOOUM2Xoq8c84RoLkcWIXAM0OQ92PO7FDaj8FN9kMbQBeoZWKnSu6w53zgXHGdlkB8tPtRlUR0VZyVWV/5/TG4G59c1JD6dw5vfPNeMtsa3QKaU4ugtkCzFAXnqfPwkBm9Mg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 BN7PPF34483F4BA.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 07:23:34 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 07:23:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 16:23:29 +0900
Message-Id: <DMQI0G2K6Z3B.1YEH6D2ZILRBI@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/12] gpu: nova-core: falcon: allow DMA transfers to
 read from a framebuffer address
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-10-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-10-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|BN7PPF34483F4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3f0e53-0f06-47f3-481c-08df3e325cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FGJ41r8Ij0uv68WVz29oRsPe9EP5P8BpXveI9nRcgIqlF7snW+Tgwg8lNbKD8E6LtdlNnr0XvUl2bLPxqUxcbJqT+BQnlM+11HgYwbNhjuYkPUtNcnZMSneOn+2TbIFnudSCBfj3MMTUYy+smdneyMbMEas7zD+yThJcIlPJ2LhnWZ9LjpBYb/D1SeN6+3dssK60uvRQ6RIUYtrxCDUyPoGrLJePGsMXuSiWt6D9W0R9+0KIt96+PF+KLrSbGnVGzpMux+oNykqNBttyugB6dc5nG8bC5roCMBAMLkaBmqiuNMCUjS1wAa3E22RgACfmnnh5VyrcE6ho0lJQRCnrC4uv19V43rRCnlWSC2FMo086XaM+jtwADnBuciiS/YS+qHsm+/QapOIhTI9QiXqKbNjxkeWWu8HRjSK4f1X3Tr/gE6whI0HjFrMjxYUqQ3TiiUOKW0hgS2/ucLxR37jrb7yQ5WIo31MB68l7z8MmVRDPDxpZXN9DKrIpEf+fyjVehTtDY1dds8Vj88sy5ftFd31tVqczRpWXDSgiQKUWhL01J44WG2l6TnHjjrjTAaaNXjKIny2c7bKf+dxGg/J+HOsGTTMk5w0QjYuu+LjqCa1VlqSoiCgJeH+wLpQCKlUv0cP5SsZVne1045DNWFBTIQKG21rEBCDvk4y/C8jn+5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUErVVlsL095STJLMkVtZmN1RUpHNStjQ04rem9sVFZWaW5YZW1RRkdHRnZk?=
 =?utf-8?B?NUxMTjlmU3lqdmM5MlNHL3FoVlFGbTJIMHpMdlNUa3grSXg4ZmNNM3lROGpM?=
 =?utf-8?B?UmlwQU9RTnJYbWNMYzNGaG5Ya3ZaYk5LVUtpRXlRRFQzOFQyL0trVTlCUEF4?=
 =?utf-8?B?ZTB0dngxblk4Ky9SSFZiU3BoeEJqdFRzdmxjNFM3eksrYlJzT2I5OWI0Qjlr?=
 =?utf-8?B?SlRxcXNpbEw2NnZzYkIvcEozUmNtTXZmMUs5c1pkNWtBaEFMcE5aRysvT0hs?=
 =?utf-8?B?c3VZSGhqRGI5V2phWDJmNHZZVHU0R3Y0MVc3cUJodnByTjN1VXdmYnlvSGFk?=
 =?utf-8?B?SDBqN0R2akVSczJzSWRBTlVEYVpER2dmV3daR056TkVMb0grUnY5OVdCMW12?=
 =?utf-8?B?MEZBQ0xvaGl5TklScGR6TUZkY2kvUWxnTU1wTXdpWmx2REJJTkxxNHg0NGFZ?=
 =?utf-8?B?dDI1MEZzbTJoRE10RTJ3SlYrczFjQk55SkV2REppNGNvVTVIMDIzc2pad3Fi?=
 =?utf-8?B?MXNEaVR1Zm95UTd1RThFKzl0Nk9EektmQUdIUGlEaEhVK3NzWTVreCtWVUpt?=
 =?utf-8?B?K3ZJcTk1eEhIbXkvVTVhRkRzemYybmdRVFNWNUFuSHVNNldLaE50Y2x6SXN3?=
 =?utf-8?B?MWk2ZU1hU3pDaTFmMHIwRitORGdrZWtHci80eXFxdFlUSW5aeXNRSXFJdEhU?=
 =?utf-8?B?UkE4VkZzOUZ3YU1Vc3NLaDVUQkFMMmk3K0duNmxjTm5UYnF3SGEwYm9aWDVn?=
 =?utf-8?B?SHRrUERscFlDM1hxNFVvbzZXY1c3T2Vid3ZIbzFXK3pVRUErdlVia0FDRlN2?=
 =?utf-8?B?MDBwUnR1ZUdlRmEvTGJJN0R5eUhBRUxRV09KRW41WUhaMGs2ZFViQlQ3em5j?=
 =?utf-8?B?VXBMbXlqM1F4c0hjeXdtWng4S2VoZEZZUTFMUENiUUJnNXRtbHl1VWp3SmRr?=
 =?utf-8?B?eWNYdlp3eVp2Vklyb29GZ3FZcEFOKzRiWHgxQVBUK2JpZEMrajVxNTlzTVF6?=
 =?utf-8?B?VStLbzN3VkpmenYrSHY2d0x1R3BnVTFVbWIzNDlMUWRZZG84S2xLUm5tVysy?=
 =?utf-8?B?MlBxK2RWcFRodmgxZDVXYUN6TFB4QnVhWVoxNnl2U1F0bGZxV2pSWEdWTzRx?=
 =?utf-8?B?QTBCVjlDeFBDUThzUW44Um1OWUFBOTd0b3pLUENIbHRhNUlleldPcVdsVWFH?=
 =?utf-8?B?b1lPY3luQXlsQnloYmU1Tnd3QkV6VjR5MTJvMG92QVI0Z1owSXdCMUZkVDJ2?=
 =?utf-8?B?MWFoRlFmYWppWHdrdHNEOE9hYVJZTG0ramRJWjZtQTVXVExPWS9hSU1ibmFu?=
 =?utf-8?B?QkMxcXdpWmNwQm9tdnk1a3pxUUJ1L0hVcmZzbHB0V0FwNVNBMzRkczdyZkRX?=
 =?utf-8?B?SS9LUmRTUnVWZUc4VTUxY28zNGt4d1E1VmhiUjh4YmJrQXZnU1Vibmw4bW5U?=
 =?utf-8?B?cjU5OTZaZk1vZmorUzdKMFVWV1BZaEVlMVhFSVpRNDMwQXgwWUFaSFJMeHJk?=
 =?utf-8?B?S25SSXBIVEx0YWg3Q0Q5ZklyOUg2S1lXYnVoL1ZmMndsU0c4ek94VndCTE9K?=
 =?utf-8?B?L09RMUNkL2FJb0srWC91YkRyeW5Ra2ZUU2UzcHU3aUtLV05DMGRJTW9JUDBV?=
 =?utf-8?B?di9mQTF6ckllS1NWaU8zOFJpLytpajY1YU8wQndHdnBMOHg0QzBPWG9KeVVC?=
 =?utf-8?B?b21vUzdHQ2dMMGpBQ0c3UlJpOGZxYXFPNGIzSS9uY2w0ZS9xSXQ1WFN1Rmk5?=
 =?utf-8?B?WmpqWDVQK01WekxEdCt4Z1lNdFd5R3k5WCtZbGd5TmNsTnM5M0VKTWlvckQw?=
 =?utf-8?B?UjA3enNDL09FVWFpcmZxaXFkdUZFMklpSElrbU40WmhEeHdydDliUjBYVHNl?=
 =?utf-8?B?a0NWM2ovdnNsbGp5MVdRd3ZVTys4S2ZJRkNNMzZpYkhQZFRiTS8xVEYwZk9R?=
 =?utf-8?B?ZnU3dGtiR2txQit3RXlPMlFMdkVuSmZ1T1orS3QxUWFBNkxIRjN0NFlIR3Bm?=
 =?utf-8?B?Zmp0SnNrbGZXNnNRTE96OUc4cVVIMDVHaUtSdmo0VHlkRzFLc0VOYWZYdnZo?=
 =?utf-8?B?aUxMTHh5SDB2WlQ4UUJpNzIrbGhWczF3QnVvTEVpbnVodzhlR0tQUE9zUHYx?=
 =?utf-8?B?UExuSFY1eWhIcms5N3BLZWNwNVI4bXVFQ1N1Q1dUNXNFVXhEWkpDdmVRYUpz?=
 =?utf-8?B?MjZ2TUJTOG92NlRYWTBwak9nYUlQL0dkWkJwMjBTditOd0VMbDMyT1hPVzRV?=
 =?utf-8?B?dXNDQ0dCcXJCTU1aZ2Z6bVk0OXZHZHZvaFVlUGk4MjdEaGJwUFhOeFhUb09h?=
 =?utf-8?B?ckdsWEE1aHZHR0VRR0xSOWxYcEJZOGlCbnBwTlNRSHVqbEZqUVduNjlDTVZO?=
 =?utf-8?Q?JPcLEBazG0msFq52jfJPGJRCSzqQwuArLWlF44MJYD5fu?=
X-MS-Exchange-AntiSpam-MessageData-1: R9C16zNp0TfB6A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3f0e53-0f06-47f3-481c-08df3e325cb5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:23:33.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXy9Q0Zfk4D7UBu4Gw6FVppoQ4Spw9djPOOhFWvbilpDQWPQWhS7E5kCzzxeq24CF+ME3MUCJ3uLNvjjpwRBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF34483F4BA

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> The r000 boot protocol has a load-and-execute event in which GSP-RM asks
> the driver to load a Heavy-Secured binary from framebuffer memory into
> the GSP falcon's memory by DMA in order to run it.
>
> Nova-core's falcon DMA loading method currently only supports loading
> from a DMA object that the driver has allocated, so there is no way to
> copy an image from framebuffer memory that an event supplied.
>
> Address this by making the source of a falcon DMA transfer an enum,
> which can be either a DMA object, or a GPU framebuffer address.
>
> The framebuffer address source has no user yet, but will be used by the
> r000 boot protocol.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 65 ++++++++++++++++++++++++++---------=
------
>  1 file changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 00da664887fc..b63265abd263 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -140,6 +140,15 @@ pub(crate) enum FalconMem {
>      Dmem { tag: bool },
>  }
> =20
> +/// Where a falcon DMA transfer reads from.
> +pub(crate) enum FalconDmaSource<'a> {
> +    /// A DMA object in system memory.
> +    Sysmem(&'a Coherent<'a, [u8]>),
> +    /// GPU framebuffer memory at physical address `base`.
> +    #[expect(dead_code)]
> +    Framebuffer { base: u64 },
> +}
> +
>  bounded_enum! {
>      /// Defines the Framebuffer Interface (FBIF) aperture type.
>      /// This determines the memory type for external memory access durin=
g a DMA transfer, which is
> @@ -544,13 +553,10 @@ pub(crate) fn with_fbif_transcfg<R>(
>          Ok(result)
>      }
> =20
> -    /// Perform a DMA write according to `load_offsets` from `dma_obj` i=
nto the falcon's
> -    /// `target_mem`.
> -    ///
> -    /// `sec` is set if the loaded firmware is expected to run in secure=
 mode.
> +    /// Perform a DMA write according to `load_offsets` from `src` into =
the falcon's `target_mem`.
>      fn dma_wr(
>          &self,
> -        dma_obj: &Coherent<'_, [u8]>,
> +        src: FalconDmaSource<'_>,
>          target_mem: FalconMem,
>          load_offsets: FalconDmaLoadTarget,
>      ) -> Result {
> @@ -563,23 +569,32 @@ fn dma_wr(
>          // For IMEM and tagged DMEM, we want to use the start offset as =
a virtual address tag for
>          // each page, since addresses in the firmware (and the boot vect=
or) are virtual.
>          //
> -        // For untagged DMEM, the start offset is folded into the DMA ba=
se.
> -        let (fb_offset, base_offset) =3D match target_mem {
> -            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem=
::Dmem { tag: true } =3D> {
> -                (load_offsets.src_start, 0)
> +        // For untagged DMEM in a DMA object, the start offset is folded=
 into the DMA base. For a
> +        // framebuffer address, the DMA engine adds the start offset to =
the address.
> +        let (fb_offset, dma_base) =3D match src {
> +            FalconDmaSource::Sysmem(dma_obj) =3D> {
> +                let (fb_offset, base_offset) =3D match target_mem {
> +                    FalconMem::ImemSecure
> +                    | FalconMem::ImemNonSecure
> +                    | FalconMem::Dmem { tag: true } =3D> (load_offsets.s=
rc_start, 0),
> +                    FalconMem::Dmem { tag: false } =3D> {
> +                        (0, usize::from_safe_cast(load_offsets.src_start=
))
> +                    }
> +                };
> +
> +                // Upper limit of transfer is `(num_transfers * DMA_LEN)=
 + load_offsets.src_start`.
> +                let dma_end =3D num_transfers
> +                    .checked_mul(DMA_LEN)
> +                    .and_then(|size| size.checked_add(load_offsets.src_s=
tart))
> +                    .map(usize::from_safe_cast)
> +                    .ok_or(EOVERFLOW)?;
> +
> +                (
> +                    fb_offset,
> +                    io_project!(dma_obj, [try: base_offset..dma_end]).dm=
a_address(),
> +                )
>              }
> -            FalconMem::Dmem { tag: false } =3D> (0, usize::from_safe_cas=
t(load_offsets.src_start)),
> -        };
> -
> -        let dma_base =3D {
> -            // Upper limit of transfer is `(num_transfers * DMA_LEN) + l=
oad_offsets.src_start`.
> -            let dma_end =3D num_transfers
> -                .checked_mul(DMA_LEN)
> -                .and_then(|size| size.checked_add(load_offsets.src_start=
))
> -                .map(usize::from_safe_cast)
> -                .ok_or(EOVERFLOW)?;
> -
> -            io_project!(dma_obj, [try: base_offset..dma_end]).dma_addres=
s()
> +            FalconDmaSource::Framebuffer { base } =3D> (load_offsets.src=
_start, base),
>          };

I think this code is simplifiable. The `Sysmem` branch computes some offset=
s
based on `target_mem`. But I don't see why this has to be specific to that
branch. What we could do (and what openrm does afaict) is just split that o=
ut,
for example:

```
let (fb_offset, base_offset) =3D match target_mem {
    FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { ta=
g: true } =3D> {
        (load_offsets.src_start, 0)
    }
    FalconMem::Dmem { tag: false } =3D> (0, usize::from_safe_cast(load_offs=
ets.src_start)),
};

let dma_base =3D match src {
    FalconDmaSource::Sysmem(dma_obj) =3D> {
        let dma_end =3D num_transfers
            .checked_mul(DMA_LEN)
            .and_then(|size| size.checked_add(load_offsets.src_start))
            .map(usize::from_safe_cast)
            .ok_or(EOVERFLOW)?;

        io_project!(dma_obj, [try: base_offset..dma_end]).dma_address()
    }
    FalconDmaSource::Framebuffer { base } =3D> base
        .checked_add(u64::from_safe_cast(base_offset))
        .ok_or(EOVERFLOW)?,
};
```

Alternatively I think the following is simpler where you just always pass t=
he
base of the DMA region and use the offset param
(NV_PFALCON_FALCON_DMATRFFBOFFS), but it's not what openrm does. That is,
tag=3D=3Dfalse case it doesn't matter (?) how the offset is split between
`fb_offset` and `base_offset` is so might as well make it match the other c=
ases:

```
let dma_base =3D match src {
    FalconDmaSource::Sysmem(dma_obj) =3D> {
        let dma_end =3D num_transfers
            .checked_mul(DMA_LEN)
            .and_then(|size| size.checked_add(load_offsets.src_start))
            .map(usize::from_safe_cast)
            .ok_or(EOVERFLOW)?;

        io_project!(dma_obj, [try: 0..dma_end]).dma_address()
    }
    FalconDmaSource::Framebuffer { base } =3D> base,
};
let dma_offset =3D load_offsets.src_start;
```
