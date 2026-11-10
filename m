Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306063;
	b=2aikq5DBILUvTov1qpuwxiMdRnEGut9M7KPNKPN6asl5+kVRSB8uthuRFNYk69ggNV+b
	 kh8x3ew4PKB1PqdOsD/9S39XoLGV5GtSYZTr1FhHVXljTehc81FA0c9p2uMQOlf/HSi+n
	 J5KckfPrAEExZ7TXdNUBt1p6Cwlazpbn4v5wrnWj9TGLbDPqTdKcqZN5uSZLmf7MMHVW0
	 HARLRODiSUZS6YWPzXqFK6AeT8dIlzak7Lm4GSGR+dLodSq5O4xEVijYSTj8+Yco6d+A/
	 /KYN/pG2LdkV24FExcCqayeUYjeLaS04hxEQEZz9rV4+lq6H47qOgnEyCvPGNZscGPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306063;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=vgvRi9ecicLADmOqu62xl3p0pByMya30nC2LLSeSlWc=;
	b=JP8MKvu/0/cq/tYj1UKpKMx+2+dynlDP88UW770fmrhUCHLsOsXF6cFViTI0RL3C5vud
	 qc5OX4nw41SEv8Qbn1WI8kzjD3O6uZXSce+UjzjCEd2vAvslP33mKSTLStqWPvvZhtldQ
	 tRt6tQgtR5zqpBg6DIC9UohfTI6OVsaQXqhglm0ez4XEGJr9syhypwycQfFa5kBa8Re+i
	 j0+Pp0Cxt5ciH6HdwV/a5d8nVQ/kZ1IzppS0TOSFa9Z8PYRjnmZgWqgGUWTRMThU6nJSc
	 Fb+Rci4ZuLxpPHcRQbiy3Dzdf+oDg/DwNyZZfGStU2ywyrluPjDHdtw399slr2932WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qY0SoHTy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.39
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBB960A3815
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBB960A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qY0SoHTy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOJUtNH3L3KbS1YWWJyWzJpnmqxVwUAxXKga6DoASnX6GwtSNuKpyY0HQYWwLzJhw1G8bw51jpaKMdGLIC8Vb0rMJ5i5wzNxBDQOU6rMYS2yrbumkhI0aqHKqou3jTrvS8Mq0Pcs3IAIaGOXT9Yi7OHogap7dBt9GlD4Cf++P3cemX2yTGUK60iNvesaaCLlMDWIgCKh82WeqBVK44Vs8/C40gDbw6PoKRzikjUPS4zpP45JCYYaS97SvpAN5wYYd9a8XZPa99OIUTpxYSigw4CIB4stxLiusDk3WDILvw8I58BNNvv9N2Sxut+vrxJLpkRVfezUeL01R80sGAiWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgvRi9ecicLADmOqu62xl3p0pByMya30nC2LLSeSlWc=;
 b=m+pwx/t0poyjUZuznjYxxzix+nDERVo1l7SVPQh9a7/eRIF7V84KmELH2G6j4xf3ikyNFvqNyQlZXk2exLehRifUfAsCt278gw7++ZX01M4C3L8A1Yg5AgtEAJuqpaeHb8MEbg3qHlYYpVGBXzC4Ys17NwXDn1T59gXaV/r3ka+wLjMqvaJm1Hi2tUKQU77kqpaT0+/GeVb3wYdy+BhWUzzAZmY8HGE7UPpP2GvtEJK1qbtSxh0S8yBpvCcPdntrvzlyNSe98JwGdQLgBx4XyvugT4tCcaa7dWzSm528GsSLc6inlC+kdTqDi5qDHjyPrOGremlaNKItjj8ZdYEroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgvRi9ecicLADmOqu62xl3p0pByMya30nC2LLSeSlWc=;
 b=qY0SoHTy5ujgdZ5iJQ/Dq6GGQxBJIFXl3cNzRMABS70QhF94JPCNCjMSjPoQOr8qGGLSJB7Fcj8fIUy9Cs5toY2ulcGmPZAmRBKOvrx7K9bLpqY93INm7Oeas/TIcKLV/nUJXXeseLfu7duWHf8h2OOulPPJ5iuchYhl7zri8r9+6AwvPBgLv8CyJ7VFtSHzXVHyIm5ZgtH3NSfpJrfWIC20EDxeA0bxkg0MHpc3ylwxPdr939iIOA6lpKfVcgVH9obZkelBGP6CvI6C7Dow+FwX4CM3PDPcX2zC2YUk+GNQ4MLb9QTVjxTAabBFvaCYCpg9d9lodW87J78xZ/dlGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:20:57 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:20:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 00/13] gpu: nova-core: generic bootloader and falcon DMA
 changes for r000
Date: Tue, 10 Nov 2026 19:20:49 +0900
Message-Id: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr2K6tmbaUUBX3sO4oO0gYyKYFquGc
 HdbXKhx+ZL/3h9FIM8UxG4xCk+RA/ddAlwuhG3r7kSSXWKhQRdKAUoPALK5S6gqh9u6WKMpRVp
 fPTX8mEuH45vDzZzJDlnPi5bD0PvnfBVV3v1Xo5IgCR1WjVUIhPsusuN6ZfuLyNmov8XyI+okN
 gZLazdGg3U/4jRNL1RI6unqAAAA
X-Change-ID: 20261103-r000-fw-088d39a643b7
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 62f8673a-ca39-4d1a-37a7-08df3f144f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261102130727099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fsCk0l2SI9t7jbghX3BUwoeQ3P0bfwEnfsLYaw5J2eQcbquby7swR3s8l3/s+pse886aeIGt5i9QEsv8HzxXx2FadqoXr9Wljgq169s0FscdfwJE6mPzjNFlxq1MQqfXReblfXQ4e/AKyNXB/HhpewORih8WHitLjFZ3nFkGmexE2Z/NiQZj63emUqHMdH17OGDWHJVFHdqE/2ky4sQ77Res2tngeN/DRtyq3rtO2IiY30PYK3rW8JFb7RvYvsGe2Q5Cs6mBYEIG/0YkHRcEtfAINPxM8ys3cE6nE9LmIjuguB49BOEO3sjjqO9CbcooI5AEXnYXoQy3JOLKKxUsWLEiOUjmeIm6dHD0bzsqeKLLYFkrC5oi3CJ0P6Ps05Qc+e1dqXkQZhqd6K8ZVLP3/Jx6gKkaV8RRZR7Lan4VSd358KBI9b/h1FjDhf58PAF/PHALkfbueCbK1J5U89NGjSY3KvJ9NlMVqQh/SJbVWbrGjo4q9K6DQnq7QZ9/l8HgBBxjk2zYFZYpGvnUn7UCo4x8qfGBZItIRKZdJ4oE8rFyrezuxrtcsnmVWd7Kl2FkGw3ct7yrcyh8+UbglqZO+XCuY0BaGy9cw+I1ZWzPMcsv20Ug2zzioNFoF5WHFSdqzB/E0RL6bpQ6U9n+CUMsLDuwHj14zGe3mB4SWTJsUSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102130727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yld3dzduRThldnpEa2lmcDNCN09TSklLZTh3WXo2YTd5ampXUzcvbC9FblFo?=
 =?utf-8?B?UGVqNjkxSG9ab0NvUTBCTm9ZTzlmYTB1ZUtoSnNsSGRkN3FXTWpxdnVBQyta?=
 =?utf-8?B?d0YrNGxDTmZCdGt3MHlaMDk0RmpyQnE2VTJuYjdXaEhjQ3F6NUZETm5iYnJ6?=
 =?utf-8?B?bFFPTGhrby9Ud1hzZ2FvWmk3eFlXT2N3REpnTTZ1NUZ4S0dsbkplUTB5VXRt?=
 =?utf-8?B?NE1pYVZOZWpYRGhsbDdHSVRwakV5Zmd6cGtFZ3k1VXhCMElSZVFQWUlITHg2?=
 =?utf-8?B?U01jaFNSSTdETzB4bUdDZzRBYkpycHpSR2JlYkRKR2RYMGQzbkR6NXdwK3pz?=
 =?utf-8?B?c2VCQmVvK3QxV3ppV1A1dkQyVkZibWw4ekViamVFNDRmVHV0S25GcUlwM0Jk?=
 =?utf-8?B?eUhxS3dXaDV0dFFIYy9lQ1l4SlJzQ0hLU3VjaXVKakxDS2ZNYS9VODZxRTRh?=
 =?utf-8?B?V0pEVFNWcFUyeXA0MlhJRnpOZ1dIZVNOMHhiY2lBa09UVHYwdVN6ZU8wblQz?=
 =?utf-8?B?Y21VcWlybmNMSEI4MHpVOXdPY2pCZHlack1FNkZXdHI3OW5zcTVKQm5yRDU0?=
 =?utf-8?B?MUxaOEJHMFc1TU5VTnNUWmdZQlVPVXRSTnM1NCtNekY3RlM3SWNGSlFQejFN?=
 =?utf-8?B?TTcybCtJanYzTWFBVVNpVzh2T1RTWDErZDNqV1hNVjR1REpwSzZpbVNSK1hs?=
 =?utf-8?B?YVJQL2hkb1JpS055OGNCeko1d3c1N1VMc1dvNnNzK21oRkpMb1F0aEVMN0xU?=
 =?utf-8?B?RExUemEzQUJFUkZwWEJzM2hZTUZ5Lzd6cFNqazZSSDRLaTFWSEl1Q3Q2VVJ6?=
 =?utf-8?B?bXoyNWoxeGJITWlIMXZOVzMrd0ttSWljSkdlWXh3Tm9WdHRDZSsvdVZ1MUkz?=
 =?utf-8?B?SmdYVHV2bk9KMVJJdlk5SnoxV1FHQkVLRVE2Y1duZ3ZCZ0E3K0lNS216NTJF?=
 =?utf-8?B?QjRZUk14V3JmWW5HZjNLTEV4azI5eWp6ZityUktPNXUzdElWYWZoNkVMenl5?=
 =?utf-8?B?Z0M0UFVDNFdPOThtNGtMR2FiSXY3SUEwOU85dStLNkl4NzNYeUYvd3NlVXFL?=
 =?utf-8?B?ZUxjMkpub3NUV1VzVWxKSmRONmxoMmpmMkhlMS9rc25nZ2svODFLK3loaEJI?=
 =?utf-8?B?Y05KTFhjeUp0c0pOcUwzckduRUxuM0Q3c2tFQTYwc0liMkhCVy8vWE41ZHRD?=
 =?utf-8?B?RUd4NCtBbk5zYkwrWG82REZpMDFhQjN5VnNrVXNmM2NXMDI4bGFDQ3B4SlFL?=
 =?utf-8?B?ZllLcTFIS2Fob0lFUVJydnA0MXpaRmlpRGpOdmtUZVlTc3dXTFJhYzNGZUdj?=
 =?utf-8?B?NjB4V3BwL0lFeHJtODN6UEtJcGlOQkJGbmZ1VHZYd0ljbnR5N0ZOeGhSS0Nm?=
 =?utf-8?B?SkpkWDhkV25CbFU1N2RVSVc1Ti9MU0k0ZWpMNDJFeWlVMWZPdU1WMFIxMkpZ?=
 =?utf-8?B?cXczaUdPWUhydGhXOGl1ZWxmakRkNHJSTDJDVGp3SnJuRlVpMTE1RW1OYXFl?=
 =?utf-8?B?Q3pjeW1wNlpYeURHUFlUNU9Gd0V0OHJGN3NraUx4NVJPWk5ZM241NFdTT0hU?=
 =?utf-8?B?TTFvRlhzQW9iYmhtU1ZxaWk0bnJjTHZINGdMcFZYRU1XaUxDVWZ3S0xWZ25Y?=
 =?utf-8?B?eXpOcnpZUC94eTQ4ZU80QzlRS2dlSW51N1hJSHJwTWZQSlpnMGNIOWs1dndP?=
 =?utf-8?B?WDVwZE84R1FXUTBLMk44RXZuV2FTR3VVb1h5eEh5aEVMTXAyQXAyKzlDejNT?=
 =?utf-8?B?U1RoalJqUXd3Q0NKYUJMZzBlMHZFTm1pMnFVZWNPN3habEdBaEJSZVE3UkE0?=
 =?utf-8?B?WVhEVzR0MGRwRXdsVlRVakQ1VVdyMHAyODVvUkJ4eUxkRTJNVlVEM1BhU1Fq?=
 =?utf-8?B?TGw1b0FyM2pNZXlnK2pEeTVZQ1JLR0hXM0s2eXpQdUpFNllSTlpCaVB0Y3FN?=
 =?utf-8?B?TFYzUTJ5YlRyWWtJSjZOQ1RoNmdFb2Vua2gvYVFtSitmQngwNnErOWYrWDZz?=
 =?utf-8?B?RG92WFpwVXhCK1g2eU9HdEsrQXlSK2ZIQ0FLcS9YcHhtTGFIZDl4b2FWNVZT?=
 =?utf-8?B?VkxMQzJWUDA0cUJTNWw3a1dxV0hLelBCT3kxN0p3Y0JFYjA1Q05IMGpONWd4?=
 =?utf-8?B?WGZGNWFEMFNsQU5LV3M3UzFwYWx5Q2ZoVnF4Zy9sRTJOY2FSMHhhQjRlMFlK?=
 =?utf-8?B?bGkxMzhQRk5DZ1hmRFFvem9tTlRsbWFuL1ZyYVdCYjB5dFFhVC93LzZrdEJY?=
 =?utf-8?B?M2ltWjBsV01hbWlBNVVNcTQvY0prbzFGN01zRGQ2Q2EzZktCZ2RMSWphbnhI?=
 =?utf-8?B?NlVlck1qQnBrRW5ZNkNIa21BMkE5RkJiM0U4WGVjditMSFE4OVI0d3UwTmxG?=
 =?utf-8?Q?WtGNx+yEJ3gAlTAtdufaul8JLOwEl5YDpjNkzXbkmC83T?=
X-MS-Exchange-AntiSpam-MessageData-1: hH+f4D0ULEALGw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f8673a-ca39-4d1a-37a7-08df3f144f82
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:20:57.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7mRgn1nXMwEEnOK5kQfrLoVINd8UKLxEUWc1hUyrQWs+02z8Wyx1oHbjYNFG2qkpPmhvvcJcTZXmfPAiBG74Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

This series contains patches 13, 14, 16 and 17 from John's r000 series
v3 [1], that prepare the generic falcon bootloader and the falcon DMA
code for the r000 boot protocol. They are submitted separately as they
do not depend on the command queue work, and are valuable on their own.
A few preparatory patches are also introduced to smoothen the
transition.

Patches 1 to 7 make the generic bootloader its own type, usable with any
DMEM descriptor and not just FWSEC's, and place it at the top of IMEM as
reported by the HWCFG register instead of assuming a 64 KiB IMEM. Patch
6 is a bit of an outlier as it allows register array locations to be
copied, in order to simplify patch 7 which makes sure the generic
bootloader can be used with the r000 boot protocol.

Patches 9 to 12 let falcon DMA transfers read from a framebuffer address
and tag DMEM blocks, check the per-block offsets for overflow, and
simplify the DMA setup flow.

The new DMA capabilities remain unused until the r000 load-and-execute
handlers land.

Based on `drm-rust-next`, tested with TU106 and GA107 using both the
570.144 and 615.71.09 firmware images.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Perform `imem_dst_start` computation in `GenericBootloader::run` to
  avoid requiring a `Falcon` parameter in the constructor. (Eliot)
- Remove unneeded `ctx_dma` accessor. (Eliot)
- Inline `RegisterArrayLoc::clone`. (Sashiko)
- Avoid double-read of register in `with_fbif_transcfg`. (Eliot)
- Rename `dma_end` to more consistent `end_offset`. (Eliot)
- Simplify `dma_wr`. (Eliot)
- Link to v2: https://patch.msgid.link/20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com

Changes in v2:
- Remove `Assisted-by: LLM` tags.
- Widen the `IMEMC::offs` field to 24 bits to be able to load the
  bootloader even if IMEM is larger than 64KB. (Eliot)
- Accept unbound `Device` to create the generic bootloader. (Eliot)
- Fix documentation for GenericBootloader::new and FwsecFirmwareWithBl::new. (Eliot)
- Program `FBIF_TRANSCFG` from `GenericBootloader::run`. (Eliot)
- Bring `with_fbif_transcfg()` from the later r000 patches.
- Use the source offset as tag for tagged DMEM transfers. (Eliot,
  Sashiko)
- Set the `DMTAG` attribute from `with_falcon_mem`. (Eliot)
- Program the FBIF_TRANSCFG register in dma_wr. (Eliot)
- Link to v1: https://patch.msgid.link/20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com

Changes since John's v3:
- Split the IMEM placement change out of the bootloader extraction.
- Keep the DMEM descriptor fields private behind a constructor.
- Replace the exported bootloader pairing type with a `run()` method.
- Make `dma_wr()` able to work with different sources instead of adding
  a second DMA method.
- Split the DMEM tagging and overflow checks into their own patches.

---
Alexandre Courbot (7):
      gpu: nova-core: falcon: widen the IMEM PIO offset to 24 bits
      rust: io: register: implement Copy and Clone for RegisterArrayLoc
      gpu: nova-core: falcon: rename the local variables of dma_wr()
      gpu: nova-core: falcon: allow DMEM DMA transfers to request tagging
      gpu: nova-core: falcon: allow DMA transfers to read from a framebuffer address
      gpu: nova-core: falcon: use src_start as FB offset for all DMA transfers
      gpu: nova-core: falcon: program the FBIF_TRANSCFG register in dma_wr

John Hubbard (6):
      gpu: nova-core: separate the generic falcon bootloader from FWSEC
      gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
      gpu: nova-core: run the generic bootloader from its own type
      gpu: nova-core: place the generic bootloader at the top of IMEM
      gpu: nova-core: falcon: introduce and use with_fbif_transcfg
      gpu: nova-core: falcon: check the per-block DMA offsets for overflow

 drivers/gpu/nova-core/falcon.rs                    | 134 +++++++---
 drivers/gpu/nova-core/firmware.rs                  |   1 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 215 ++--------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 280 +++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs                      |  13 +-
 rust/kernel/io/register.rs                         |   9 +
 6 files changed, 422 insertions(+), 230 deletions(-)
---
base-commit: a7cdb17ca0d7ce67e9f3a52d39edd60f03223729
change-id: 20261103-r000-fw-088d39a643b7

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

