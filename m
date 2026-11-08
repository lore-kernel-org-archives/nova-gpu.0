Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794149372;
	b=l32a1xe9DRho6QfgvFaDh0GBlaRTd1m8jt+t6CwHitq7Url1bwy74OiU0sLmeHXjjh99
	 UOa7me7CJIUVn65KGtpc4/tnApxcUMSwa6JfXuCcXCLRtQLMglnrsZsT12LA2j0q3vbgA
	 4AyTIypDIhEpXfl22j8Smuaw10+uNvJY5H2+2JX7uqFU7vK+XPNFJxLQdMeVGVRzGodNi
	 /PolIb+YtixsuwMK2n09ktEgj25g8HdknROmcirmftyatdvFj9MAPN3uEeHAbw7oBZ7ax
	 glrZJTCcYHCDoJ9o/8wXLVq1Pjhk0Bon3qvKxePN4eY/M0kVS/5BZqc+F2YNWYkMtWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149372;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:To:Cc:Subject:From:Content-Transfer-Encoding:References:
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
	bh=6GW6WHWVFR61fm6w9tm576QW8yGerAZx+2RYAvDit2s=;
	b=pEgPt4YMw4M3la1WY/uZT/9ln0b35JRGX2CeC6UgJxGgfH5gFf7i2p1GAcHYx4+2GYn4
	 Jja+QNWgEHSvhHhEIkLmKKEk5QcXlXoVtmgdjggZ1na2cP41fxvvs8Nc8KAMzsU9rElGV
	 TxtrQsDNiOcCbfje5QIZxiMZJtvin+6035GWCJOxygGsRGt1PNtmJCi2ashXVWvqK+2NO
	 j7U4sKe5tHWqAimYYEvKiVkEUosnzpJKodNf/ZLPX6c77BTs9me2+mBvsj8dXm01kVUWX
	 DLs6N0IU99bfibL3eMSKXpH2Rh8P7fNqBj1wBa4ZbIA2LFTlsmohiyVW6hN7UQf6Q+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NjariD3u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.28
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51158606A326
	for <nova-gpu@lists.linux.dev>; Sun,  8 Nov 2026 14:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51158606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NjariD3u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3TCIkpPRq/hDEPxSfljKa3RYg0YFLYv1LAQkUvXx/Zp7VmFSKHOoJV4lYGibaV9LfIit258BvOAMK3XDjWH0xmCzhGmEE44OBPgT/ghEkYCFj01vt/HMBXwv9OQRuBI5MqH0cUalGMUPAwbfyfAEHuS5xqoBrsUSMwnjU/5hkbJsqJTgPCwP7IglNsKG3Zl7Dod3CyrjLW5PentkuX1k7oRwGEG+VdFeYTySzwMaUkbWzC3b65eAlhojD5asfon53mcqhucivy4okTQ3c9uB+0dZC0Q3P2VKymdTwN2gd4Zo7p+4KprSuyFmr33qrQ66GWFoRLR30y9NiuAbJwq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GW6WHWVFR61fm6w9tm576QW8yGerAZx+2RYAvDit2s=;
 b=eaKHqAUC1dQjKl+9X1QRHz7U5BgH000Jyj7b3BiYVuMNuDt/rqZ6lZgAAjaAKOJ1iyDnKTDRsTKDa5r1uO5DtdJOthMDVrCr2B6zszLfnOeI+eM6nFaa6Ez/T2EJsdqWs3lGfADNsUU7pWpUt1TPLXvFf1Z8HBXFNMNii7jWmQh5qGo7y+uAXp/4PZXHkeUvRG7in9RTciuYd2fCoXFW6EFmvRYE0KWnTG9U0gqfNKogTTR7uotBDPyYLWBpiJ5Ls5wk/c8QuC+sDmEUmOEHkpIGzzNA+Hs3AzgRg+s8S+qHr9TjCCuRJG+8IrveeJf75lgAku3HGSbRV1r4kWwqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GW6WHWVFR61fm6w9tm576QW8yGerAZx+2RYAvDit2s=;
 b=NjariD3uko/r+VDLtyloMWfcJ7JlKYJDvVPA7emMGlLxYblP0kZpU0qRGdIIuSNAsaQhbUdp2HLCwaU2d5nX8h8fXIc9CNw5h0YUyz6303nCtwt39Bx4sP21NhWnBhXuJihP+LlpikHhYKrYa7CNqTl1+wygy82A/09ZT6o9346LdC2e+xX71ZQkpDCSC8EkOPFZQO7CgR17+kgF5bV5HHGzc56GbwAgY3dsMNVA9tTgHomhGWbz/4n71vz2RE31/fKwkIpKtn6UCBvPwefxAN6qKbHpOD14jf1uGeTvGuRnRtqxd2OMEMN1j6C27tOWy1UQslCL4RAkPaBHv9dPPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS6PR12MB600424.namprd12.prod.outlook.com (2603:10b6:8:499::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 14:49:28 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sun, 8 Nov 2026
 14:49:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 23:49:23 +0900
Message-Id: <DMPWVB9NW65K.278IMZRHOY24P@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: gsp: cmdq: move message trimming
 into its own function
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
 <20261106-r000_rebase_on_cmdq-rpc-v2-4-e481ea2168ef@nvidia.com>
 <DMO0D9ZE05E0.2BGV3A8P7XEWJ@nvidia.com>
In-Reply-To: <DMO0D9ZE05E0.2BGV3A8P7XEWJ@nvidia.com>
X-ClientProxiedBy: OS0P286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::21) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS6PR12MB600424:EE_
X-MS-Office365-Filtering-Correlation-Id: 622136cd-2e9d-4c12-1beb-08df3da77cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DAeFfxQ5g3mHdWkf8fP21lfAhlX431XoHeJs6i3KoN+RfgJLa/PsG7oWCH3rOMhGhKqAvCj7aeDKZCL2VActoRCe3yuahOlRJG+Djj5MoLNM9npZ0w3eWT0ryGu/xAud06KeFlvx94p+eLd38QzAHQHJsT6yr8EFsihSGhJTSvm+UuFWMFiylKoZhEq9HMap2GbBkjZXo8+NWiS6iYOJ8GDNRk9+aILZ7k+tEoCh+GZjx051rY3KfMOzKz8ELCTOmUaEFLHgls3DJVv35T0eWDNsGGr9j/To0v179WFyQ4s+lgsuLexcTPXyWBzXB46pFZP4OwQfAqBAvpRlQzFAfrvlRq3Iz1qE3V+A0kaWpurz3sjz4ZfbzE2ZDAzzsPDP96CrC9jf3gQf1L1CeVBy8e50oixPdf1fNQa04YZIR2SOUmuqJSyT4XCgsYqcU5Yy148MaNer//oECi+zEc9OLo+I+/WVIgZnv1uQ8M9a1bGDXaFILb8y4+crY1j94OWA/FuMSpJrlLi9jWjZuwRcd4x2qLb/VA2Q4yFCxI9c+ebTMSRen9s3vBHaKDbYXgXkKkAAhE8FHsLEujmvXTuXsyPsrL04EN8P+x6lQ1znStce++FEV5lWU+WsASQystqvyfJemyu39k3FfDtG2ZdPvjfsz0kAwbtH5rFPwChBl3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFZMGVUc3Y4S2VXcjhNZzBtU202WWFvNStISjV5a090WlhJL2NoOXpBSDBw?=
 =?utf-8?B?c0tmVG1QTjlFdUdRUE93YkViVStUN2JSenZORVYrVXlFWnBrd0VjbGdRaFYr?=
 =?utf-8?B?aVdDQ0ZBTWtyWGZHNXdSem5hRUxEdkN2RktZMXlKQ0pyTHgvNXpvdnhrSzU4?=
 =?utf-8?B?RU1IQUw2QThIU0plQ3pldlFBdnNqZFZqclN6NHk4TFBaWHh1WSs3S2FHQlFr?=
 =?utf-8?B?bXNWNlBzcW9MOUdkcFhsdjJJN0UwNFFONjNvNXMxYVJWMHVIY2pXRFNRTHE1?=
 =?utf-8?B?MG1zVllkRWJ0TXIxV0pranhJclp0TFFETnVCWUdlekRzS2VMTlN3OVc4SnpB?=
 =?utf-8?B?bGZ4a1E0VEZiTlFzU1lzNHlhMGVkZ0lUV3NDVW96L2VBRGU3RFlTVzVqTjF4?=
 =?utf-8?B?LzNRYk4zMUpUN1RyWkhaVzQwSFJ6eVlrWkVyaVZFTEZxUllIYXlmd3FvVDds?=
 =?utf-8?B?eS9OUkQzdnhqdW5ucGpRcmY1S3BPUTVWak51RldBSzBUTVFhcEZ5akl3YllJ?=
 =?utf-8?B?NFA5MkpTdFoydGVqTXlOR25nbjV5VU5RQXF0cnFVaEMyeVZSd2c1TW1OUnI3?=
 =?utf-8?B?SGJlcHJBSXYyU3YrMTFnNkZNL2QvR2hSMUJTKzBaQU5mV2laTDZiNWNLNDFJ?=
 =?utf-8?B?T2FzTkVjYmQ0OE5LZXhYaEl1clg2aTY3cDBram92Mm52Ymw4dnFoODNzVG9k?=
 =?utf-8?B?RHVHdExCU3BJQnBGMk5GK0xVNTJJUEFyTGhLR1kyb3NxUWIwVzMzU04rNEVr?=
 =?utf-8?B?cndtNldjdWIzY0g4M1JUcWNDY25BRkRRNUgxR1RiMmoyWGRoZVlUTm9MMFFB?=
 =?utf-8?B?L2hCL1ZveTl6QklyMnp2Vm5WRzlUeCt0dWdVMlBVaWYwbDNYWmxDMEVPREtB?=
 =?utf-8?B?V0hzYjVqaFNIbjI0L294YnJrMmY2alNXeEdtcGYyckdNNXdzOFNSVktaTGZz?=
 =?utf-8?B?ZFppT2txM3dEcGJ4azBiK29GSllzbjZjRHRaTS96OEMwSUtqTTdZTkMrTnZj?=
 =?utf-8?B?YklvdGRIMnlYUVhqd0FrT1M1WHhvclN0MGh5bzhyT0dEdVpmeDZQRUFHVU5o?=
 =?utf-8?B?eXFncVM0eHpLTi9EN1ZGSVB0Zy9Pd0pWMk1TUEZJaXVGdmdXdkIvYkkxVG13?=
 =?utf-8?B?WWpUZVVXWHRRQWYrM2MvVmxJSXZXZWJkWmpyanIvMjV1N1BOdXFuNnhZNjA0?=
 =?utf-8?B?bnNYdUo3NEFYVFFTWFBHSmFtbHlEQ3REMHJjYVRXSHBFaFkva0tRQlUvQ2d2?=
 =?utf-8?B?WE5YZFZGMWtvMUQvYVVWYW9aNFB3djJxU29YWHpUVzQ0UUtLdCtqeUVhdk1w?=
 =?utf-8?B?TW1tYmsvVWJ5WUl6WHp1cFhuV0ZhZUF4bDA2YlFDSk1XUTBick5TSUdTdWFs?=
 =?utf-8?B?VVhYazV1QzFYamV1dlFOTzk1cGpKMmFtOGhjS3ZOb2dtdlZ2bXdoNThNQTNj?=
 =?utf-8?B?eDk1ekVqeFR1d0NEdUlWRkpwVzZxamhLOTBKV2ZjRDcvZUoxOVNIS0paT1Vy?=
 =?utf-8?B?QmthR2I1dG94K0xlV3FrL0RKbE8xbkFBTUVNTStLaWtpVUV4OWp3TmtqRHBq?=
 =?utf-8?B?cm14UjhWSmQxeVFwbnd4NnNvMnJFbVNZZFJLa2xheHE4a1ZWUm5aVFFGQity?=
 =?utf-8?B?QW5jZWw0SkowZmZjeGM1d29tVERrZWVmbU9hMmRrQkorUmZTeU1oZjdUTnlB?=
 =?utf-8?B?TGhVMmRnczlQeFFnQ3ZyQ0M4M1RtU2Z6YVVnZzU2b2xIS0RxSzlXQm55bnR6?=
 =?utf-8?B?djkxclRFdSt2VnJ3UysvanRNVXhURW9pNFJBZHV3ZkVPYlBuMFhFVmp3UFcz?=
 =?utf-8?B?US9KeTV0OGdiZmtpZXBPUjVWZUYzODJPcldVUWRzdmpFWUFzT09JaFlZRE5y?=
 =?utf-8?B?MW9WYmtod1ljNmlVNzgwYUJWV3pnMlpFWENydnlqQ2QzajQrSjNDditXMURO?=
 =?utf-8?B?ZTZKRnl3ZjEzd08rVjdFWC92RzhycmhacXE4YUZ4dUtlbXpYVnpSYmh0eGpn?=
 =?utf-8?B?OCs2M1JhdGtQeVJvTTBPWU41KzZ5b0h4VVVRVHBwNEpFM3BkMnhBVGR6Q2Yw?=
 =?utf-8?B?bGc1Q3FRZWRVaXN2bEg1NHV0aDNFOHZadi9uTlRuczZiRkFxZmQvd3pnWml4?=
 =?utf-8?B?NzZ6ZU1KeE54c0hwMHMzT01CQ3pHVFNVOHpGMCtFczg2WEFKM2NEclh1aGRI?=
 =?utf-8?B?Nzl5SGQyYkRpRTl3cWlRMkJXQ2tzOWh5RDFEYWNXQS9UTE93dVdQTFVRMnRn?=
 =?utf-8?B?M0RQNUJXMjN1dy81V2d1b09XQXJMUFRRZWlYejNicUZlaSt1NklHNm1MTWVw?=
 =?utf-8?B?ZEhHNUlBU0JqUmppLzJhc1VnZ1QrVk1wbzV1ZXVaU1cyZkw5M3RGaXV3NjQ2?=
 =?utf-8?Q?grpuDRFG8BfByDuxAWzEy4RQET3LZQAutZ3whv/6nB4OG?=
X-MS-Exchange-AntiSpam-MessageData-1: uaFDYxGJ6BHjcQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622136cd-2e9d-4c12-1beb-08df3da77cb9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 14:49:27.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cx1K9zU3jW8GUiulgZ7IqE8gKXNLr9MLlNmjdtZ6AkCUPx+T9xYMvKPioQLgjPB/GEuSBNY85sG7Vwc0aoBVSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB600424

On Fri Nov 6, 2026 at 6:08 PM JST, Eliot Courtney wrote:
> On Fri Nov 6, 2026 at 4:06 PM JST, Alexandre Courbot wrote:
>> Trimming the two driver-owned slices of the command queue to the
>> advertised length of a message is going to be used by both RPC and GMC
>> messages, so factor that part out into a private function.
>>
>> The parsing itself can be improved by leveraging `split_at_checked` and
>> `get`, so use them.
>>
>> No functional change intended.
>>
>> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
>> Link: https://lore.kernel.org/all/DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com/
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs     | 21 +++++++++++++++++++++
>>  drivers/gpu/nova-core/gsp/cmdq/rpc.rs | 20 +-------------------
>>  2 files changed, 22 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 9dd11ac8952b..f3151aa8ea26 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -719,3 +719,24 @@ fn drain(&mut self) -> Result {
>>          }
>>      }
>>  }
>> +
>> +/// Helper function that trims the concatenation of `slice_1` and `slic=
e_2` to `length`.
>> +///
>> +/// Returns the truncated `(slice_1, slice_2)` pair, or `EIO` if `lengt=
h > slice_1.len() +
>> +/// slice_2.len()`.
>> +fn trim_message_slice<'a>(
>> +    (slice_1, slice_2): (&'a [u8], &'a [u8]),
>> +    length: usize,
>> +) -> Result<(&'a [u8], &'a [u8])> {
>> +    // See if `slice_1` covers the whole message, take it entirely if i=
t doesn't.
>> +    let slice_1 =3D slice_1
>> +        .split_at_checked(length)
>> +        .map(|split| split.0)
>> +        .unwrap_or(slice_1);
>> +    // `slice_2` is the remainder of the message not covered by `slice_=
1`.
>> +    let slice_2 =3D slice_2
>> +        .get(..length.saturating_sub(slice_1.len()))
>> +        .ok_or(EIO)?;
>> +
>> +    Ok((slice_1, slice_2))
>> +}
>
> I think .split_at_checked(length).map(|x| x.0) is the same as
> .get(..length), so you can prolly just write:
>
> ```
> let slice_1 =3D slice_1.get(..length).unwrap_or(slice_1);

Oh yeah, I was just too fixated on using `split_at_checked` and didn't
notice using `get` directly was simpler, thanks!

> let slice_2 =3D slice_2.get(..length - slice_1.len()).ok_or(EIO)?;
> ```
>
> Up to you if you want to use a checked_sub or saturating_sub but it's
> locally clear that it won't underflow imo.

Yes, this is indeed super trivial. It's actually one of the potential-panic=
-site
dilemmas where I have trouble deciding what to do.

In the end for this one I've decided to go for your suggestion of using
`-` with a `PANIC:` comment, as the panic site is eventually optimized
away, and the generated assembly is the most efficient.
