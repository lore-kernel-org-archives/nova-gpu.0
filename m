Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701380;
	b=Fvt2DoZfyP22mImRd0ZvlWgcnYPs0NrCfkRQ4Ir92op9P30ElCmNy73Rvuv0oRQB1Ysf
	 GIps+J5e9ZyO7Jm/yH2/tUus73+CrQi/9dde7iwZGrzRcc2pchbSW629zQqlFV7sz8i96
	 QrkSa8bh3VyuYsoxo82VJcdpkRiOEfS+JT7nQ+uYktkM46BZJLNw7xz0QWm2wOgYLv4Qk
	 TvnB+7m14sw/VzitfXEk5VsDCPnfTiERSxSCLyaKm7HZnd1zFA3lwG9j3f4CI8A1E3xzO
	 3Dr0owq8ZKOwPwyQXlO1Fgf2DMVoE+P/K7bFiObDQv8HY0l9AsDWa+3kUzyQ7WdLByQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701380;
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
	bh=I1d/8NJpammsu7c67AtYBmehQ4QWxWQ56HmKx8+3WkM=;
	b=4+MVvmSkFlz3tX5SfEYCh+EQq1JXYaqzJHR7DUr4c1vVx2bKRR9nqCnw77yzPh9BZv2n
	 YRCptmRMll9/rp4hgEQjTcSWoz8d+jgbmdQP1TyacoFT5IPBhcXko4xbTYSAfdXmUivYK
	 vtcIM0Ht/Z+q0jHTeHhRypwzCDyWdba1h/K5tpTyoSmtvsCHJVwJ+0FFrx91rsjJx+dKc
	 WML28FG69eMZR5zwrjcgT2Ii20m8Hn/WxIYFTOFGuLOg5Mcq5LIoJqJW4fWxsnBBepBvE
	 1DDUpjPicQRj5gnvVmlcxdJ+J1b8k7U2vWVeClyelMc+si05XdtR5KinypDKhvacnEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kys4FxCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.47
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B11606A83A
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B11606A83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kys4FxCY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbH06zbe0UkTldKsZYZDPglQVorVXLa4w28eTWEV3q72WVqtrC7FRFw+OtPf7iofIRdPjX8TBdJeluVg9XucVElbUfBcr60ijSclVJDBB+H9aK3vVWYBJhzw+bPPeu02z1V0mo2TfLKu0qoU8t0rLoniodi7rVHgG3PnvWhOT/UJ+sj9zRDxnotTuZe8pO51MnHR8bU9XIkHEqPrFpb5YtG7TnWbegwRVPUuzjwN1c4gRBbOZBFE08HcPARi687MHumpBj8VU6fkjyFf1csnA3EOGwC1qqj03tY8qlZSBbFZy0Ejaqn031yulIToWSEwBldN5mmNyBpzm5p1YKuTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1d/8NJpammsu7c67AtYBmehQ4QWxWQ56HmKx8+3WkM=;
 b=m3SmKiMCSousDugtdS/AwzH0TZlyahLjqiB9yu1HdpRAeZmhMgRI0jV5f7LwjLaoW7xhYH9EfU1tBlpOjZwFK35Cuo0F8kRFUbbUVMSwloQG9Gl0TVwYuSjUDXim1kv+pD4stt2gnxSBlTe7nlBY59RZ2w0rL4vej0v6GbvMbTllRiOfGIKV+WJXFVaRCKoYFfe7UoXwkMDhz6YMV8gQl13Ond7k++JQE+uTlSgvjCSdnlPm2VTwO2eSai7ZmLMiIltdT5Aie3jv8EOmEJHjGPX13NxphCZPU1PfkY5OmN4A4ISpkQN/AJzh+FDh1Z3ZpsmckRC7N8oM24+vIlQw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1d/8NJpammsu7c67AtYBmehQ4QWxWQ56HmKx8+3WkM=;
 b=Kys4FxCYukEH7G36huvLKhojmFjxUHJlAoobyRRl6tCgoddMaHhSYgKNWaEd1JD5MBQPiF5nKA2obt7w34lEeUmrc6KE12sKPXl3vjwXuf7R83k/bzjA+mDQHaF2R5F/0e4SQt9Y7MNAbNjIveLNFyPjt/CyoRik8LaeKFcEAtmTTAHAvMLXRLeZYEIPuNFqWnqk3mrVbcCXRRAqpfSQzcUcj4cSvceS/BLcF9KkWMXcIrUKVsEvsK6DykcJ3Ff5mPBD36y2L6u0QrFbdrbB1xNN0ChHFKSWS1Qb8kx4bxCyGGsp8JX2hFro3/O5g09xFAnRSzxyUjaft0d/aT9HfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 10:22:55 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:22:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:40 +0900
Subject: [PATCH 2/7] gpu: nova-core: place the generic bootloader at the
 top of IMEM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-2-e3d38fc130e3@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 690b3c2d-5cd3-42d0-8489-08df39946bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|261022075727099003|11063799006|56012099006|261009223027099003|261102123227099003|261021121427099003|261022115727099003|261021123027099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TkTO9o8G2tYoWuJcs7rKp9ldxCM43wXh5NdiUw1lz6YMpQGU88jYS4QQFtMjO4wPGegMLCsp8uEbXo2a/tUhEFKaPABa0m0cexwJxQTDapBhvPu02rYxz6SyphFxR8sAhpZqbQKbkOFTTf1oCRg7Cfx+pJnohDNYXBSBFER0dd8VX6W74Rs/F2Qg8zRTX8CnfHfPxjft0I/nl62sfC08bYUjYjA/Dcy8c895Su6oiEZQjd957GNCMZAzb1mRmj8ms9uF2THZzHrwJ3qN+WUwav1hBbhCYO+vRSgp6tRcGuKOv+CoZj3RPRY5X8biGPebVW6ikCTqRwmhqKSms67aYQUNe1MwaxpGcoiGx3PKasgwueVQf1d0u7zzBdS0QEYZoMj7rdcPdBkaL5EdE/DWEer5jAyrL4D1/S7VWzaNI5Y/FHGm+rj23Ia5Ia/BPhq77w4eQnHeRltHferRzBWi1eA2/c+vhi9JkfwYr+Up4YNUIlMiOGjiRDaA13Qx6QEmJBAcYg6GkP2eXE2/SAql1G9fHPlVFSpcIJgeUFAUMLOIdlVjxJMM5iZkEWzZ1GAlSjDbwP1bo+ir50d83A7PytUmje7g932riZzLywwE3WvRcLRzJD0JfhKlgH2E2nG3O1ozHm5huZWkDG5Rwwa7OdzRvEOTWQxcH6M0wYc39u0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261022115727099003)(261021123027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NThIRjRoUHdGbk5lZktBbUZUK0JjTkJaZjMyeHVLRVQ0VTZSbUs5bUtxd2xW?=
 =?utf-8?B?cWlrL2ljcXVmaG1SM2RHY2ZXeHllZDZuYlZ6VlBjUU8wdnduV0NIVkRjNEt1?=
 =?utf-8?B?VjJ0Nm5jbjlnSFVuWnRIZm5yNXdwdXZuamIxbDFDby9BcmVXUVdmbCtXNTlF?=
 =?utf-8?B?NDZwbXdLVmozRU9SYjZZZkp4ZDAzSE9UeDNmQ096emlCUmxobFpNdUVRNzlM?=
 =?utf-8?B?dzUvK2lBZVhMaEQrYm1FTjJ0TUZSYzgvanhnV1l3Nk5LNlMrb0hXNzlycXp2?=
 =?utf-8?B?cG0xSlVDK2M4a2drd1p3Uk14VTBOMnpPZzFnVW5YTjk2QmtkcjdzQVhtQ1p5?=
 =?utf-8?B?SXV4eENGYk4rSjBNcC9WUjJNbU54bEdnYzN0aXUwSGxaWkNjQldEMGg1VFhP?=
 =?utf-8?B?TFhlaEViWW0wSXlJUGNkcTkyQzhFU1JxZFRGa0lpSVVXWWxsenhNWmtDamNM?=
 =?utf-8?B?bXBSclJhUHVHL3VMc2xiMlNObVRmSURZM1JmeEh2dkVDRkdpSnViaEtKYWNu?=
 =?utf-8?B?YUxCZ2I5djFneVljT01IeTZvZVB0MmorZnhPUU1FYy9mQ3U1OEhreDA1TjdX?=
 =?utf-8?B?amlrOTE5Wk93d1NKbnBWQ2I0VXE2N25UUGMzOWl5VUhnYWxZTWppaUxGeGwy?=
 =?utf-8?B?ekd4RDQzODlOaUVvdGIvRFJPd2thVlI3RFlXZEgwbTV0SDBRekZ6V09KUjFi?=
 =?utf-8?B?TjROclBZZStNUWlhQTJrU2RCelJWK2s4UkRCTks3THhjV0dTQ3A1OVgxUVBR?=
 =?utf-8?B?b2tUODRxeTJKcGhtaEp6elI4aXhva2JQTGFXa0EvdzNYc01wbnRxenlUVm0z?=
 =?utf-8?B?ZUR2MHhBVTZNTURtdzdabU8xUjM0cHhtRFBRMTFWaXBJdVQ2RmN0S1BRMm9s?=
 =?utf-8?B?bEgxMnVESGNidVhzU1M3RERZbU42MThDcUtJc1d5YWcrRTl1dmhycjlCdXhw?=
 =?utf-8?B?cDBWSm9qOVBVcTdIaFBzYVQzZmhXSStSanhFT0hJQ1J0ZGsya0loeTk3SkRq?=
 =?utf-8?B?WXZubnlyenMrUkkrWXhKTXFQSWtWNzZleUNvL3JLc0VkcVgvYXFCTEJoVmpK?=
 =?utf-8?B?VzZwQUdJTG9vemNvMmUwY1pxekdBOEhZam01K3VSazgzcHdxVXdFQmprQ3g1?=
 =?utf-8?B?c1JtK3grL1Nwa0NVYTBsMHdTSmlrUzRyUUxqMFJ0UVpUU29COHdpU0ZGMXFh?=
 =?utf-8?B?NHNQLy8vaU1NMW9UQXE5cnZPWFQyS3lUUE5uUnpSK3NSZFJCWjJyU1V4aGw4?=
 =?utf-8?B?U0JmN2JCMTA0WmhSWHlQV2o5VFJUUUtlRHkwcHI0Q01VeStHUVVGSlJnWmZi?=
 =?utf-8?B?bnZFQTZDTkhDZjlRa2xmY0RUV3B5dU5Nek0xM3N4WWI3WURoUld5bzlicDNJ?=
 =?utf-8?B?VmRTVkppUTRLdlRDN3NSK01kcFE4K3AyNk0remxPQ2RQTE5rTFYvYWcwdGRi?=
 =?utf-8?B?bkgyYmlYVklQc3Bhclk1bjRmSVROM0plK2VhZnVHV1k0QWZ5eU41OW5mVE5E?=
 =?utf-8?B?bWdZbUxFdFNRRGI5aW14aG8xRUVrMm96Wnh0cTF4TGE0TXJPbzhaVUZoMEIr?=
 =?utf-8?B?SDZFSkwrbU13WUx2UE5ZNlN3cFdDeE0wOWgrRnErakxXMGZtanVkY0Y0dG5J?=
 =?utf-8?B?djE1QWJzdHAwMkJRQ2pEcDFBTzNIdGF6RXg1UWUzb0poaEkyWlk5YldURE5n?=
 =?utf-8?B?UUdjcWx5bWJkb1ZwYkp4MTdPdTY3VFk4SGNwSTVibkU3eGZGMlR5ME1aRFBX?=
 =?utf-8?B?YXNMbWIvcE4vTlJ4dXNuRkZPU1k4bFNtamV2bUY2K2JRbmxVRlJraEh5RUZk?=
 =?utf-8?B?WDhsTElWOGlWUmdDeGxEaVdjWWxSbDFzTTM5UlkxSXg0VUc4aVZkWkJnTld5?=
 =?utf-8?B?UmpyYmZRdVo4ejVpaXUxcUJzNGhGWFJkMWkvVU1CcEZJd0swbHR2N2ZhN1pr?=
 =?utf-8?B?bjBiZk0rY3ZvNUNwcDRsOVFqS2RQdm9oUk1Zay9HQlNJcEJvd3ovYkVOOWk3?=
 =?utf-8?B?QkxEa1RHemcvNVhuQ0tkN09xS0svdWQ5UlVXM2dDVldBOElhREZHdHJFUW0x?=
 =?utf-8?B?dGtNRi9GYlc5cGc3MzRlRmw3Vml4R0ZyU2dIK2JkNUhEUmdxWVVZVXNBQW5Q?=
 =?utf-8?B?SmNUSE03Q0NSOHBUR3NGWXkzd0JjR05HaFFhOXh2WmQrdGg2RDdaM1NEK3ht?=
 =?utf-8?B?bEVJVGRrQ1kxa1B0c2NIQ1ZnV296WXZ5TzkxaDMrYXlpT3dLTXI1cDhSTGRG?=
 =?utf-8?B?WGQrTnkvdkQzWHpvTkRKTjdEaituN3RwaThJWmpkYTU4YXptSE9Hb2lCK2o2?=
 =?utf-8?B?dmhYcUUzRGZzeVZpaDBSVVNOQStuNS9XWXlnL1pxOXhFNkFzbG9DbTg0dlFI?=
 =?utf-8?Q?t9GqcqZeHVu/kFJaXk2gPaz/1m2MHibyZ4tlZKTExLEVP?=
X-MS-Exchange-AntiSpam-MessageData-1: 5WUZi4RLTdB3wQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690b3c2d-5cd3-42d0-8489-08df39946bb9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:53.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohV/aVmO93R9QlmR9WCoOznFJ0MOE+gA+/Bi6qT1fxc5pV9Phl3DVnngaVTatyjDFVrDd3v+5ohpXjgpSRggqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620

From: John Hubbard <jhubbard@nvidia.com>

The generic bootloader was loaded right below the first 64 KiB of IMEM,
on the assumption that every falcon it runs on has a 64 KiB IMEM. The
r000 load-and-execute bootloader event can name any image for it to
load, and the bootloader must then sit above the blocks that the image
occupies, that is, in the last blocks of IMEM, regardless of its size.

Place the bootloader at the top of the falcon's IMEM, using the IMEM
size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
[acourbot: split out of the patch separating the bootloader from FWSEC;
 convert the IMEM size with usize::from()]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                    |  7 +++++++
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  3 ++-
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 23 +++++++++++++---------
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |  6 ++++--
 drivers/gpu/nova-core/regs.rs                      |  5 +++++
 5 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0b377bd6524a..1bceb38c33c6 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -382,6 +382,13 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM in bytes.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks = usize::from(self.pfalcon.read(regs::NV_PFALCON_FALCON_HWCFG).imem_size());
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.pfalcon.update(regs::NV_PFALCON_FBIF_CTL, |v| {
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 59f57714fcfb..3943948d74bc 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -108,8 +108,9 @@ pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &'a Device<device::Bound>,
         chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
     ) -> Result<Self> {
-        let bootloader = GenericBootloader::new(dev, chipset)?;
+        let bootloader = GenericBootloader::new(dev, chipset, falcon)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index b1ed6c2ccf7d..d51948c6a2b8 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -8,13 +8,14 @@
 use kernel::{
     device,
     prelude::*,
-    ptr::Alignable,
-    sizes, //
+    ptr::Alignable, //
 };
 
 use crate::{
     falcon::{
         self,
+        gsp::Gsp,
+        Falcon,
         FalconPioImemLoadTarget, //
     },
     firmware::tlv::{
@@ -36,15 +37,19 @@ pub(crate) struct GenericBootloader {
 }
 
 impl GenericBootloader {
-    /// Loads the generic bootloader image for `chipset`, placed right below the first 64 KiB of
-    /// IMEM.
+    /// Loads the generic bootloader image for `chipset`, placed in the last blocks of an IMEM of
+    /// `imem_size` bytes.
     ///
     /// # Errors
     ///
     /// - `EINVAL` if a required TLV field is absent.
-    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
+    /// - `EOVERFLOW` if the image does not fit in IMEM.
     /// - `ENOMEM` if the padded copy of the code cannot be allocated.
-    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
+    ) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "gen_bootloader")?;
         let tlv = Tlv::new(fw.data())?;
         dev_dbg!(
@@ -68,9 +73,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Resu
             ucode
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+        // The top of IMEM, above the blocks that the bootloader loads the image into.
+        let imem_dst_start = falcon
+            .imem_size()
             .checked_sub(ucode.len())
             .ok_or(EOVERFLOW)?;
 
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index e90db1a23032..1b17ece53bd6 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -165,7 +165,7 @@ fn run_fwsec_frts(
         )?;
 
         if self.needs_fwsec_bootloader {
-            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset, falcon)?;
             // Load and run the bootloader, which will load FWSEC-FRTS and run it.
             fwsec_frts_bl.run(dev, falcon)?;
         } else {
@@ -223,7 +223,9 @@ fn build_unload_bundle<'gpu>(
         // Load the FWSEC SB firmware, as well as its bootloader if required.
         let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bios, FwsecCommand::Sb)?;
         let fwsec_sb = if self.needs_fwsec_bootloader {
-            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(fwsec_sb, dev, chipset)?)
+            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(
+                fwsec_sb, dev, chipset, gsp_falcon,
+            )?)
         } else {
             FwsecUnloadFirmware::WithoutBl(fwsec_sb)
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88662da634dc..b7070282d692 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -181,6 +181,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ 0x00000108 {
+        /// Number of 256-byte blocks in this falcon's IMEM.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;

-- 
2.56.0

