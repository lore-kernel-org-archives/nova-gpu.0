Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701383;
	b=OBSEquPeK16ksKWB6qpWsyrGEsdGqpkKJME8ZyfupP+IMFHVUOvHmrEOiYI4So2fhhE7
	 BgGu/AgGXyvTl6j9XC0LGAUI4qxt46hInVAnmqyCFbBus6onD3h2fPMF8DvFd2foWFDwi
	 wJu9X/5cR8tJA3SVD4lYiOcYwn8vsk2pcINgSftIlHUkGF1wyuj5SrI3iAUuINf4zSoLW
	 Be1YMGua3fDHVt0CF3HvZhSgwTE/Kzd6/cNoakgzPG+o9nEULA1GXFmYUkHkTAq+wrmpd
	 ls7UwP6qUROqt/AlqRg2um2vzT0n/nIE1lB4Tw7rvkLiSLv3D/gtbVu22CHMXugUMzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701383;
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
	bh=lsVWZ3yZ8A4fjC5I0E9eXi1TKVm7EBqT8G/B8snzOkU=;
	b=42CJl+gaOs+v2k10+TACUP3RfgQgpSvTyZanff3Ob+S/zUTL2YDlEltp3RJ6IGuUayh+
	 t7kiPh3FJcfvBQdpONWnWhLAsH/XKZizMYKj8prGzuHQD2G9T4HEuIorezIIXlqpWHdAW
	 Z6SQhlZWT9INEGfqCiAWSA0dxs9IBGNzV7ZFt5CHQqfKImxn/EaUme20WvvGEghrE4sab
	 Lr9dsqZ5fDAPMpUVjUBDEg0LnoMYeJq6iQqmD2iz7i7O97bWjRUcJu9yxb8V0IRf3ZUfF
	 d1V64tXKnwNisrD8k7/oItav1K1JUBFTacfOkNDcboj3/j4UiMZS6zlzl3PwNdMxfLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z8ZiihmR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.61
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78B606FADE
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A78B606FADE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z8ZiihmR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXTyIw5gBJDTjen4cM45tNqVg7h2DdtlGEapQZXeEtw1dib5OqbE/VO01otX4asH0z1aisuQMegJMNSfsdO10iVNW2+3XbpC6uM1LowASXFMgCaAsvx9GdSryIRZ3KiZaf4zZBlMFzkdmuBwMJJb+GuxrZ1enMuBmGjLlUqgHxAVdtp8GEbp0MbYk1ZbBQB6oHMxQ/D7B5V6lmqWcl+UEKdjFM4Ij4HpxvA3hkTXzOE+dzZRhxfdEyOuVzybOuaPHhps1STC5sghx8jo4HJ/Jfnv0BGOZpRrneL97eOYKJBLYDbOJaxxB1FMZ/rBvzxw5IAH/2gUGb/HD/7LKgU8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsVWZ3yZ8A4fjC5I0E9eXi1TKVm7EBqT8G/B8snzOkU=;
 b=jE/vVXsOpKYWAxqSfLLSABI7c7o9fit3BzRWHjqytc3Byui+iY3Hv8ewsGgEROY1VXoUqymXldz/8jzSW78NGe2NuA/suQ6Bmb9PznB5pQci1v7UOitnSsZeg/OoiMwUaVfRlycgh/S1hmyGaBp8DXGE1guYxxT+bvm2KpspYp4upGnU4pj7G0TzGtIZa/l6b+h1MLYUrtYAVLqqER4QnghhT2IbjidsJDbqExy8N8rZvTyDayGRQGf5zY/SUhJJ+itKJFLrGm88N/e9tsHVsDy2i4m6B/cxRMD6+vZceSPCi5hgYUjqTqGcLpRvLrW4befrEpupqRaIJxugwACw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsVWZ3yZ8A4fjC5I0E9eXi1TKVm7EBqT8G/B8snzOkU=;
 b=Z8ZiihmRIv4r4EGwQq+Exi09+s0YiNN8K6yFOy+RH1nPYXb6Lt9P1FDTia9N49Fdv+s9HW+oCaiHgC8Y5PIIEwpZ0V8CaLzudm/MQ0VQBrMY43tNNtv9hDcCXpUXhqhBpkVrS6uYTfLy4oVg85lSSfqGvdFSrstIcsi+BddsTyPjtOi1pmRmw2gv2aA65MNdXZ3GuRkTjpgTEATLnW6f2MbiSRre+RwMx7y8KjYeZ8lA0qL6Q/gwmHizBR3FCoz2S5B7RItye5jMCvbeLzXDh+i+F1XL3WPhArWXSsvPeOMGT/B2305xWtxgwtrFK+/iTIuPVZRfvCMl0NAGjjdCQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY0PR12MB177289.namprd12.prod.outlook.com (2603:10b6:930:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 10:23:00 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:23:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:42 +0900
Subject: [PATCH 4/7] gpu: nova-core: run the generic bootloader from its
 own type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-4-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY0PR12MB177289:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c02eb0-6e4a-4b58-e62b-08df39946fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|261022115727099003|11063799006|56012099006|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OfXpR1VjseyCqmaWyF1K8bW+Rm8UfU/m/qlrh5oF1Ruv1McJBUn671oS/7neJPNzsh6wr0sK9o0/PxQYCaS7bfD02QUSXUFtlcrn3kskY6i9IEw7ncLppTgLvbPknBu4v4ctb9j/U9nIcEqNT7PAlyhBAS7Plq3OF/U3EcXvlKLlLKiAyyqcxZPFo0tUf4oBO/LOSTZR7zlbppT4yhFEIc5rgIlULWGo4fm/h0bebIf+c0vdNtzf7nh8j4aOAh9+D4GX0HIBQybp4xBZba0/OSVilHnOpYcRW1zW8/XBvjLTLXVCm4mUD3dqRhHiDHgdeKJNeYAZL6op+6BQBvAFYQQ6OhkZl3735S8a1WqK9C9FcXXGKwIv3JsULZuUPjEDSBe4Wk2CJJ30eEtR72WXpJfk2nbuFDfbD83A5BIvy6PFrIsFIrLNd3nEjESDRywn8ZqODsy0Z8dHTBIA7CpCo5qwAoA4kZOYynngnuAaVBhjC5YtIVG5unNb7w/gxJmBIwdpy0CTE0wGSwtmjKRhNLJw8LLkkiG6l5ajk4uTDwIK+hYYBrp9PIneTJitXoX9Rm57mI+K4YHIxc7mIVbGfB6S6lxW85b+76wLt+1jxEOInFuKvGa+eorQldiytZf38+rIOFFBG/Uq4uuemTWqXrdincMeP66zuIDJ9/adXgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(261022115727099003)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTJHN1hsYmJFOWpjSDVOQXpXbXpmU2RrcEtRMGF4UGE5cVNsY05GMjlwTDlR?=
 =?utf-8?B?cUVtUjBJNTRWUUQ4UGhWSzhGa3RNTE9IVzFENWVrRWRqYXpHR3lJQzYrMVBM?=
 =?utf-8?B?SER2ZERqeSttMVZ2M29RSG1QUjQrSFJheXNhVTFMdFNscUdBSUFNWkFZNjRS?=
 =?utf-8?B?NHBaRXVNT3lyNHZ3dGhoOGk1SGVUZWxHSS9pUGN2dUlHcXhUcHhYQnlnYmg0?=
 =?utf-8?B?SUdid29HMkd2cjQ2NkQ0UVpRUVFwRjJ2T21USVhWV2tXcTB0L3lOZXZMMWtl?=
 =?utf-8?B?MFZHYnBwLzkrQWEybEZaRlFsb0lyRXBFSitxMG94K3dYOUtzcXlkZi9WTnJE?=
 =?utf-8?B?UUtFT09OanhWM2VwWnFuWW1uaXZ3UTdFTGEzcTN5VWtEbEFJZzgvVFNRNzUr?=
 =?utf-8?B?d1B6dHRzVHFqcVphRnBvMlBHV0FUVlRyOFREaXlzaXUzMlhGQm5zSUNxeTNj?=
 =?utf-8?B?T2ZOaTVFeG9YTGtjelcwQ2NIYVFrbXlyVWZkbzFoWlNJVkVFWTlLSHNJaU9C?=
 =?utf-8?B?ZDJSVUpzUEdjZEw1akY0MmhwRnRsL25ybFVwNWRHeE5DSkFOblFITWg5RzU2?=
 =?utf-8?B?Sk5QYUNDeDNDUnNwMU42TTBzbUM2aDlFNXJDeGJ1NjdIUEpia2V0MTFSeVhH?=
 =?utf-8?B?MlpScGpVVDFXSDhHVjhIVHhScmxMZ1FmVGx2dHBJOGoyTmRRYkt3czJxMXBq?=
 =?utf-8?B?bEthb05oMnlNckozcFBiSlJRS2NaUVhVRlJoYzZqRGRNREc5SWZsclV4VnIw?=
 =?utf-8?B?b1BlUTVsOWdieEtsZFYyWmdwd3JhVkprT3l6VVlkeU5paVo4eUp0K2d6MC9I?=
 =?utf-8?B?ZEY2VTNYd3crdEcxVE91SGFZckp5MjJNN2l2dGJHckRvWDRCR0N0UzllV2c4?=
 =?utf-8?B?U0x1RENmWG5hUC9rQkxUdDhjaGlyV0tPdGI2RmhaYkRGWWlyZkV0dng4Tk82?=
 =?utf-8?B?V1lHTlp0MkRHd05oeUhzQmxFcCtjSXlmSkNFVmlsZ0g0YjVMTUFITFkzYXpE?=
 =?utf-8?B?aHhtODV4S0NoU3hYeXNCaTk3U3c1TDB4OTJUWHBVdDUxWkIzeCtoMzJZTzhp?=
 =?utf-8?B?elFQTlBhOWV2R29wWGtuNkpQQ1BQQ0RTdXRxZXVUMWZsVi9ITEhWamxzVWdS?=
 =?utf-8?B?d0ZBLzNacldEN2gxUzVMVk1lcDdzalVyZGtJaGRzTU9KdmMzdm5pNTVvM3V0?=
 =?utf-8?B?NjRFWWQreTRIL1dZb3gzSGdyZmdMN3lqeFgycUxzS1IydG0zZm9acG40YWlh?=
 =?utf-8?B?d0RPSS82SW8xSEVQbHRkY3k0b1U3emtCNEtqWHBmTUthcnVIZlNDdTRJbHRt?=
 =?utf-8?B?eWc3OHNOSG5YOUJVNFpmbkY1UENYZUtEZE84cmVOWGZaa2xSMEtqVnVzd1BE?=
 =?utf-8?B?dStaQzhTOWptU2xIbjJha0hLd0kyem1WZWxoMHpyMS9iVW0xVjhkVlQ0Q0g3?=
 =?utf-8?B?UjJIc2Mza1Z5ZCtTVnRhSmZyaHZoVkNSb2F0S056cndpUmVhZGFRV0lRQnps?=
 =?utf-8?B?V05WSG92VllpaGdjcEhzTWZZTHc4Zzh6UmZxd1A3WmpoRzhoNk5vQWJhT1ZY?=
 =?utf-8?B?RW9ZNnNiL0FybWh1TGwzTy91SHZvMTQydjJIQWJ5N290d2VUVG9SVVZpNWdh?=
 =?utf-8?B?QmVrZlRJdkp4cWM5YWgxejY1OU1hUWJmMmRybU54UlAzT0hTV1orRjcxR0NS?=
 =?utf-8?B?ZnBUYVJRRXY1QnRIU1pqLzFYUC9CUVhBWEdRMDVEb3hLQkpEbjlhYk1xWjhj?=
 =?utf-8?B?RkhuNlR5QkFxT25wdjViQStMMUlCc1pzU29HVkk3MUhpY2gxWEVYc25zWlRW?=
 =?utf-8?B?c2VzRWhHaFlUdzErV2ZaVmtBSlR2aW1pTDhoUEY2ek5icGk2TW53THUzeTMw?=
 =?utf-8?B?U3F6eWpZU1orZFpXVW5oa09aNll6WFRnNkdNRnI0SmhWa1A5Y25JOTQ4Zmp1?=
 =?utf-8?B?eHJ3ZTBmNVNDSUdiZjlYMUIzNXlyVlJKN0I2U29BN0lYNDRSWjFPdjAvZWVn?=
 =?utf-8?B?NUpoUmJLc0VEMmVPZFZOZGozdEk4VDNPWUdoaStOQUdDaE1JSk9lTXczZC9G?=
 =?utf-8?B?a0NTMUJrWWVoUkFDakk1dnp4TDZmS3JtbEFZeE45NDF6KzJ1Ykg0S012d0FT?=
 =?utf-8?B?WlhCZlQvWGt4OFFrbXNWVU44OE1sTzg0L3BuV3NxUEE4MWprNDduMVA5Zko2?=
 =?utf-8?B?N3hycklibUFPWVBTbkVmdVY5ZVFsb2RYamV3ejBVdGNFRzdvWGx1dnBCTW1u?=
 =?utf-8?B?N3pyME5aWmZvWE9QTlNnT25nbk5SS2NNUzZMcElFeEtidnNTbitETVNSaE9B?=
 =?utf-8?B?Zm44VUZqbnIyYm5DMmJJUHFoaVdlU1ZLUHZ6K2ljalBRY2VIOGNTdGE3M2pT?=
 =?utf-8?Q?QE65EncLAy7G9BUk0JlfMVDLh4jHIPJh13tt4cYwCynR7?=
X-MS-Exchange-AntiSpam-MessageData-1: jOGMaERnpQwiUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c02eb0-6e4a-4b58-e62b-08df39946fa7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:23:00.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wz5ISkHQNnCP2rh7Sz8ajmUWwZjx1GueLC3RDRAC/UYAaiHLz26MjBg7wPp/9mo97i4C+IPn+eIST0Pb+KXOUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB177289

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader needs a descriptor in DMEM to know what to
load, so loading it into a falcon means loading the two together by PIO
and starting the falcon. The FWSEC wrapper did that through its own
implementation of the PIO loading traits. The r000 load-and-execute
bootloader event will need to do the same thing.

Give the generic bootloader a run method, which pairs it with the
descriptor that it receives, loads the pair by PIO, starts the falcon
with the given MAILBOX0 value and returns the mailboxes once the falcon
has halted. This will allow the FWSEC and r000 load-and-execute
bootloader event to share the same code.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 55 ++-------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 80 +++++++++++++++++++++-
 2 files changed, 84 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index ad798ec5645a..c7bb877fcf20 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -16,22 +16,16 @@
         register::Array,
         Io, //
     },
-    prelude::*,
-    transmute::AsBytes,
+    prelude::*, //
 };
 
 use crate::{
     falcon::{
         gsp::Gsp,
         Falcon,
-        FalconBromParams,
         FalconDmaLoadable,
         FalconFbifMemType,
-        FalconFbifTarget,
-        FalconFirmware,
-        FalconPioDmemLoadTarget,
-        FalconPioImemLoadTarget,
-        FalconPioLoadable, //
+        FalconFbifTarget, //
     },
     firmware::{
         fwsec::FwsecFirmware,
@@ -50,11 +44,10 @@
 pub(crate) struct FwsecFirmwareWithBl<'a> {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<'a, [u8]>,
+    /// The bootloader that copies the firmware.
     bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// BROM parameters of the loaded firmware.
-    brom_params: FalconBromParams,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -127,7 +120,6 @@ pub(crate) fn new(
             _firmware_dma: firmware_dma,
             bootloader,
             dmem_desc,
-            brom_params: firmware.brom_params(),
         })
     }
 
@@ -136,13 +128,9 @@ pub(crate) fn new(
     /// The bootloader will load the FWSEC firmware and then execute it. This function returns
     /// after FWSEC has reached completion.
     pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>) -> Result<()> {
-        // Reset falcon, load the firmware, and run it.
         falcon
             .reset()
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
-        falcon
-            .pio_load(self)
-            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
         falcon.pfalcon.update(
@@ -154,8 +142,10 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
             },
         );
 
-        let (mbox0, _) = falcon
-            .boot(Some(0), None)
+        // Run the bootloader, which loads the FWSEC firmware and runs it.
+        let (mbox0, _) = self
+            .bootloader
+            .run(falcon, &self.dmem_desc, 0)
             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
         if mbox0 != 0 {
             dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
@@ -165,34 +155,3 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
         }
     }
 }
-
-impl FalconFirmware for FwsecFirmwareWithBl<'_> {
-    type Target = Gsp;
-
-    fn brom_params(&self) -> FalconBromParams {
-        self.brom_params.clone()
-    }
-
-    fn boot_addr(&self) -> u32 {
-        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
-        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        self.bootloader.boot_addr()
-    }
-}
-
-impl FalconPioLoadable for FwsecFirmwareWithBl<'_> {
-    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        None
-    }
-
-    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(self.bootloader.imem_load_params())
-    }
-
-    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
-        FalconPioDmemLoadTarget {
-            data: self.dmem_desc.as_bytes(),
-            dst_start: 0,
-        }
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index a3de545731f5..fe820ac6b49a 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -17,8 +17,12 @@
         self,
         gsp::Gsp,
         Falcon,
+        FalconBromParams,
         FalconDmaLoadTarget,
-        FalconPioImemLoadTarget, //
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
@@ -180,12 +184,12 @@ pub(crate) fn new(
 
     /// Returns the address at which the falcon starts executing the bootloader: the IMEM virtual
     /// address of its first code block.
-    pub(crate) fn boot_addr(&self) -> u32 {
+    fn boot_addr(&self) -> u32 {
         u32::from(self.start_tag) << 8
     }
 
     /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
-    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+    fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
         FalconPioImemLoadTarget {
             data: self.ucode.as_ref(),
             dst_start: self.imem_dst_start,
@@ -193,4 +197,74 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Runs the bootloader on `falcon` to load and start the image that `dmem_desc` names.
+    ///
+    /// The bootloader and the descriptor are loaded by PIO, the bootloader is started with `mbox0`
+    /// in `MAILBOX0`, and this returns the mailbox values once the falcon has halted, that is,
+    /// once the loaded image has run to completion.
+    ///
+    /// The caller resets `falcon` beforehand, and programs the FBIF aperture of the context DMA
+    /// slot that the descriptor names with the location of the image.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the falcon has not halted within two seconds of starting.
+    ///
+    /// Errors from the PIO load are propagated as-is.
+    pub(crate) fn run(
+        &self,
+        falcon: &Falcon<'_, Gsp>,
+        dmem_desc: &BootloaderDmemDescV2,
+        mbox0: u32,
+    ) -> Result<(u32, u32)> {
+        falcon.pio_load(&GenericBootloaderLoad {
+            bootloader: self,
+            dmem_desc,
+        })?;
+
+        falcon.boot(Some(mbox0), None)
+    }
+}
+
+/// The generic bootloader together with the descriptor that it reads from DMEM offset 0, as one
+/// firmware that [`Falcon::pio_load`] accepts.
+struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is unsigned, and the falcon HALs of the chipsets that load it this way
+        // write no BROM registers, so these values never reach hardware.
+        FalconBromParams {
+            pkc_data_offset: 0,
+            engine_id_mask: 0,
+            ucode_id: 0,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.bootloader.boot_addr()
+    }
+}
+
+impl FalconPioLoadable for GenericBootloaderLoad<'_> {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.bootloader.imem_load_params())
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
 }

-- 
2.56.0

