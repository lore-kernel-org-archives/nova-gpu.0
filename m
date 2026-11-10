Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306072;
	b=eu4texYrPWcAuNegJhTNmNn2kWyKLDyzSD2d+0dj6K624EhM+DlseI2nSeBKr9GGX1j1
	 Y/4Cu/uvnz0MwUKiybyvndd7kYn8cZbJo9/Zgnds5cdvLq8kfgogAIOCqBGmf4NQBcIPB
	 UPe6Mv4coXpJ++Na3EaVuA8NaALOruQYYXAcYzHLtVLZbhSEex2VUDGCVZCbwUuv1yoiP
	 TioNY4spzgcIj25wGLfkP0l34lFa6LoGOTHSTLWQ2DXOFjjb6bx2evEDTEUMK+HBXxX7y
	 pn8befCQr4Uf8Dm8vi7w/OEmPX8vNs/oD2x04Eben3u33Su/EymuII4oESMGzcRsu/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306072;
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
	bh=KQ7pz3RBqH1RZ9Kp0ueUvPFlO8ZFlajmD8i6yNfqtw0=;
	b=KsMCSJUwjf4g7gNFmFba6Lzerxb1b7iEhpWvOaWtQgZUkoapiaHAWAWiOAjYfLpPkstJ
	 wsX9JFS+ZOF7HCLyA2aT6eAcevJssSCn+TJQqe6O5Jea/8y9wTjDqTnNBXRyJmu6+/mwh
	 ZQbEU5WLbr2OGODKTPimrCAXvN1Fui7RH7T2P/VGHF5y4EMtqNiClDRx8gRppUOTBI+Rc
	 oItioRFCjaiNVR3hZtecQLbTMz82GmmPhVRnGa/Nq2U4vbKfJlNb970SLcY/zzAWRQ4VQ
	 Z1XYYYWrSv8sHgliFRTdA7TwVKPQmvCNozwa91zHZSrjYhFnU1OPgWOZOU2DsiO3gOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="RK/XL+K0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.48
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5D60A5BE8
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A5D60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RK/XL+K0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsvKFk6PuPwQAXF+vzoq39rmhBwsKVDag3PNrRqqVs8vyhz1DIoM4pANeZfUveXduggYJ4Ftph/KMk1cZPR5fIFDYHUlfi2uDwtTwsURlk5UIjbpcj1MthTISWL52aNxGPDXjKEObOPtM2qpMwheP0/AZuWeAjt7Jz1Ft9lmqUpCyQPVti1t7amJCYkhpZD5/7kDOhBc1yRcwkGV+2Gofu2hZVBAVgIEC/0X268f3BRAHgU/njAB6zQU3KqoUULDyKCOdHFoijYQ/QSHYGXUki5zvhres7xDFqgQpxYCRSmcgYoSJEOAIB3UUWIkBC1F2s+bc/Uer84l7LQOQo8Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ7pz3RBqH1RZ9Kp0ueUvPFlO8ZFlajmD8i6yNfqtw0=;
 b=RK6ABfHMjlGrM/WuCfFJpgRkHzvhSHilNzJF1NOluhIL19O13kzzyugvSwaig7YN8fPHuaa4sDvF6stG6M+P5aDtWdQngUWQI9BAbHSlzSsWLwmtWS/Y7rWarQLSJ8Ig+0q7QoK35gX02OIhjfuAbdza9dQ6hdEd9q0uspO452KpdxSeGePHssj6YyGroq47QdOYWm6VxuTqZDTH12skIH/rVx472d/dVmzgY6Q8JnRxAAQtqveBP12FJrxokzpWZSGStYLsyPXJuvRCe/tvUDSrqsrLwFN1d/l9/q3oDE8Wu4gS2aiQo6TUloOKY5/bhUSSd3KZMGF8f9ip1K1kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ7pz3RBqH1RZ9Kp0ueUvPFlO8ZFlajmD8i6yNfqtw0=;
 b=RK/XL+K03wSiNJh7F13chV662fR2UpdJ9mT18iQ/nAKac/6KHnsCWudopWZwfb80lvevCvpYM6w+phrBflikwdH1uE7D0LbLZvIsDBvLKJWdqNspB7IElsEYFM4ChTmvGZBozZiotTJ6IRkV2D5ZtPkLfOowkPQXgjzVgJ671tIOVmNDf5ilO5B+fw5OSVFxtSS2SPivHefv4CG/mvjob1cR12nd9AhlokPVermzOxt+OzNuPVPIMycTOeIbqSrYGXmaBle1j0uqpRPlJiQuvIt1T/to8MXK2qInNTEf+r41DJAl3voZZ81AQn0RmuNNrv3RESsAbUxwRfZ5eI+14A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:08 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:52 +0900
Subject: [PATCH v3 03/13] gpu: nova-core: move the bootloader DMEM
 descriptor out of FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-3-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b0015375-c509-4882-b288-08df3f1455a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|5023799004|56012099006|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yYwbjVwihLK3p62x52Hz4pHQmxWn5sWsWgv0lcuZU6w9fhDHqiqiMit101x2NGi5arUU6z13I6QKjcT5ivaTb2Nd/FD7PiAM9b/6oQWTHCvsvmaV3Qz9lgLrj0Rnu8PIG7kfv9N/LyewqYS77nAvpMkr9RdJf8kPPheq4CpWOwF6nC2pzvETe9TKhJ0wUagaIocwO2DWutI38LYQzezOqA+yQfE7Bz+kYIEBQagEiSHoe5YTveVDW+wvk3/g5WgHwPHfwacdOhawdx2JHN9hkLZlI3J2WDFlA0oNUUia9aSjTwLUjKKSraXV/+0GWkw0482arrDE7uUj3Ofs6JeM41wypyKdOrkbmWedInI6lf5ZgStjsoktdfNX3RSqOKujfr1TDg1nKXQAnD8T4mG8FAtUnfXr3efB8rQVwFqhGECpi2krTQPa6BnWf1dypzDqin6lJOz5Ly4Hkqvk14YZTRdtMwwjSJGwFAOmUaIUdzRK9qbfpNnN4ClNV8/LuguD12YaE4L24Pe5dms2hOUuNM4cYx1L2hJsthJtoLdnELBeOT2Te1OQE36Tovb0xVe6cAR9wihnLCbRevFavWvbgB63hCyRzO7BqVHNK7rHR+0wyLvDm7xohWk+9mTRkZaIL/GeirIwRpft9TcXqpw9M+VUHY7nCrfnWd+7/iWDqDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2J5bE1iMEtua3dETjEyNjUzYWxuSk1qeDA5NGJTdXZuV3VoRDRoL3lrTGhT?=
 =?utf-8?B?NVhmaXFzWEs1K3BNdWhxMmJPTU5PaTd6cDdldThWQ1pVZkdidEI2SDRvNlls?=
 =?utf-8?B?VVoyY09lUUJmTWpTcCtrZXVWaXBPZ0NQVklMVGRoOGYwYUM0UWJETDBVVVQv?=
 =?utf-8?B?VEZqdUxtbFMvR3kvdHlwWkRaOFRmWHV4TzNXZHBqdXNVeEtHd1J6aHc5azZ6?=
 =?utf-8?B?ODFlMFczUlZtU081am8yTk1iWWU3Y0VicTVQeFNkNzV3LzNNL21zc1RaSFRp?=
 =?utf-8?B?SEtIQWN5bEUyWkJzd01KL2pVdFQzczRXcFpRK2tpYkNiNzVsa0Zwc08vSEd0?=
 =?utf-8?B?Zi9zODZaVmI3K3h4ZzR0dm1zaUl1R1JUQzlwMVJpMEVHS3FEeTVFRnJlVEcx?=
 =?utf-8?B?czRvQS9CRlN0bXVBcUoxWVRKWjNtQWk4T25KVXdJWHZPQmZaTDMrK2NSWE1t?=
 =?utf-8?B?ditWNjFKKzh2aXFjbmJlUXcxNWdVWTl4OC9yT2lCY2lOMVZTMW01WWl5OHc2?=
 =?utf-8?B?VkZCdnZob3R6WjNOaElRc3MyaDNFUXpzSWNOdmZaZ0haRGZuMUxUazl0aG5w?=
 =?utf-8?B?OWJ1cFZ4MWpjazJzWm5BMjA0TGUwa3Voc01jSDZ6MGYyTlRhM3VrRjBZdUtS?=
 =?utf-8?B?dEluckZ0RGJQZ0FsT2F4MEt1UXlDZGVudWJqSnNJdkc1TUtqcGlHS2pmMDdY?=
 =?utf-8?B?aVluTWZhOVQ0TDc1bHo4bUV5Vm5IdXRZSXFsWW9xUlFoYnJhTE5Cb0M0Qmpo?=
 =?utf-8?B?T3RveWdCc3I2TTlpdGZkK3h5cmJyeWVRTXA3SGxmY2g4T2dRYTFGSXRER1dp?=
 =?utf-8?B?aEp3bDlJOTZOM2FkSkVFWFRWMTl1cGF3a2ZCcVcvY3NxbERCanNWd3NncG1x?=
 =?utf-8?B?K2hnblZlT1JYL2JxYUhSN1lubUkzV1VOYWVUQXo0N1B6OURWSkZOa2tlV3I1?=
 =?utf-8?B?aE5qa3NENG91WG1qK2VoTXFXODR1enA4L1c5cUNhVjVCTVNHUHhnZk9LL3JY?=
 =?utf-8?B?Mkk1alFlQnQ0UEYwcCtpUXVPSFppVHRNWkJCWUxhRW4zdEV4RTVDdVhLYWtP?=
 =?utf-8?B?LzM4d3NKanozUzh0eWhXV05GM2hadDB0OGJqNVB6VzNhTzR2ZVpSZnZlWmVU?=
 =?utf-8?B?a1k5VWwxZWYxRDFrcCs2bDBtOVBtN0ViRkZkL2FSN2JMckVyZVd4NnY4WmpC?=
 =?utf-8?B?YnBYWnE3YWxEYXU3cmYwbHVMVG5HcHQ3YXRweXoraWp0b09IWmZtZnZlSngz?=
 =?utf-8?B?Y1pkK3ZJYjNTS0ZUaGduNGtsV2QzQytpT2l2Uy9ZTFJTMmM4MWpsR1NaS1Ex?=
 =?utf-8?B?SzMvYVRpK2pKOERHS21KOVJHWXBSbnd0eFlnbG9aaXJ0b1Y4Z2pWMFVldE5y?=
 =?utf-8?B?cnBFdVBucUlBSHEwUUhMKzhSQkVGamU3ek9PRmdKZ09SV1IvMEl5aHBmZzBs?=
 =?utf-8?B?SVM0RVhjdkwxS3BIK3gvQjQ2QmM1MmF1dXBhTURkeGJ0Q051UXZNWDlJV3d1?=
 =?utf-8?B?dzYvRUdNRjRrNVZuYW1LMHM5ZmVpa1F1bGJPbldqRXIyMzhzdkJ1aUlOZEpj?=
 =?utf-8?B?YUlIcVpKekcyUUVUMGdIaGlYT0F2K1F3WXFLVGpBQzFoR08ya295eXFQQW5U?=
 =?utf-8?B?NG1rVXd5aDBST1F0cUhoSHJEcVV5V1U3TU1Jc2RKYzI0THN3Um8ycXNKZEJ2?=
 =?utf-8?B?enV4ZGQ2eGZHZ2hzOTYrc28rTXV4UUprd05KQ2dJdjkwcnZucGkxeG4ydlMz?=
 =?utf-8?B?VEczZEhMME9zOG9CR20wQ09aV3lvcm11RlJISXQ3QnFVbmlzKy9NeTZPbVY0?=
 =?utf-8?B?MUc1SzU4SEpPVUt5NkxFUG5yMmNmVXZzWm9mejYrUjlYa1NvOCttRzFoendJ?=
 =?utf-8?B?ajVxV3BUUitUZXhJVThtakJ6SXNZbnVsMnlGaFJud3YrSWc1Z2hjT1N3UFRP?=
 =?utf-8?B?NUhHNmFJbVZEUnUwaHpKOCs4RHdYMUNSUFlVTytYVXpkTUxyb0RVaUtTRjV0?=
 =?utf-8?B?M2VaQ1NwdW5RdnJtaTJ1TEs3U1dVTENxVmNiSjFJNlhpbEpoSlB5R3k4Vmhl?=
 =?utf-8?B?ekxPMU1vN0Y5Q3U3Y1Q4YmJhRFN0M2h1dGtqZW1WVTJyMktnaGd0NmdJOW9a?=
 =?utf-8?B?NEs3WWpvT1lNYS80WjFZc1NnRzBmNWlsY0pYZWVEcnlFSkxsbFF5clVkeGJt?=
 =?utf-8?B?UVkyWThKczkvdXdjNDlmYkxKcW1xRkxFZXF3OVREaTlSMlZlbTJtUnZaMEZq?=
 =?utf-8?B?bG1oU1hpaE5yejJLa2hSbTZxL0p5elBhWWg1M000Tkl3V3EwVDg0ZEt2cFl1?=
 =?utf-8?B?WTFaNmc4TDZZT0Q1M2F0YUtLSDJ0cndGYzhNQzAzYlFUV0hlWGx4dmVoV25E?=
 =?utf-8?Q?LVzY/lTAgDAAF94LQQobItuY0V0WEW+ivS2QAmCk+CGsN?=
X-MS-Exchange-AntiSpam-MessageData-1: g69ZTdt+9vkwkA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0015375-c509-4882-b288-08df3f1455a1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:07.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqIv0j3gyJ9ClRz5V8LvtZ1DUjq8gAYPFWVugCY6V/vABdUqm6per1CLBoxNyHR1bsbDPmZKJv2ADDHv3mM2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader reads its load parameters from a
descriptor that the driver places in DMEM. The r000 load-and-execute
bootloader event carries such a descriptor, so its handler will need the
descriptor type.

The descriptor was defined in the FWSEC code, which was its only user.
Move the definition, unchanged, into the generic bootloader module.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: keep the fields private, add a constructor and the ctx_dma()
 accessor instead of making every field pub(crate)]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 95 +++++-----------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 94 ++++++++++++++++++++-
 2 files changed, 112 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 80239301bbfa..e7933b5af201 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -35,60 +35,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        gen_bootloader::GenericBootloader, //
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
-#[repr(C, packed)]
-#[derive(Debug, Clone)]
-struct BootloaderDmemDescV2 {
-    /// Reserved, should always be first element.
-    reserved: [u32; 4],
-    /// 16B signature for secure code, 0s if no secure code.
-    signature: [u32; 4],
-    /// DMA context used by the bootloader while loading code/data.
-    ctx_dma: u32,
-    /// 256B-aligned physical FB address where code is located.
-    code_dma_base: u64,
-    /// Offset from `code_dma_base` where the non-secure code is located.
-    ///
-    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
-    /// expected to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    non_sec_code_off: u32,
-    /// Size of the non-secure code part.
-    non_sec_code_size: u32,
-    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
-    ///
-    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
-    /// to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    sec_code_off: u32,
-    /// Size of the secure code part.
-    sec_code_size: u32,
-    /// Code entry point invoked by the bootloader after code is loaded.
-    code_entry_point: u32,
-    /// 256B-aligned physical FB address where data is located.
-    data_dma_base: u64,
-    /// Size of data block (should be multiple of 256B).
-    data_size: u32,
-    /// Number of arguments to be passed to the target firmware being loaded.
-    argc: u32,
-    /// Arguments to be passed to the target firmware being loaded.
-    argv: u32,
-}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
-
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl<'a> {
@@ -140,9 +96,6 @@ pub(crate) fn new(
         };
 
         let dmem_desc = {
-            // Bootloader payload is in non-coherent system memory.
-            const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
-
             let imem_sec = firmware.imem_sec_load_params();
             let imem_ns = firmware.imem_ns_load_params().ok_or(EINVAL)?;
             let dmem = firmware.dmem_load_params();
@@ -154,30 +107,20 @@ pub(crate) fn new(
                 return Err(EINVAL);
             }
 
-            BootloaderDmemDescV2 {
-                reserved: [0; 4],
-                signature: [0; 4],
-                ctx_dma: FALCON_DMAIDX_PHYS_SYS_NCOH,
-                code_dma_base: firmware_dma.dma_address(),
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                non_sec_code_off: imem_ns.dst_start,
-                non_sec_code_size: imem_ns.len,
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                sec_code_off: imem_sec.dst_start,
-                sec_code_size: imem_sec.len,
-                code_entry_point: 0,
-                // Start of data section is the added padding + the DMEM `src_start` field.
-                data_dma_base: firmware_dma
-                    .dma_address()
-                    .checked_add(u64::from_safe_cast(align_padding))
-                    .and_then(|offset| offset.checked_add(dmem.src_start.into()))
-                    .ok_or(EOVERFLOW)?,
-                data_size: dmem.len,
-                argc: 0,
-                argv: 0,
-            }
+            // Start of data section is the added padding + the DMEM `src_start` field.
+            let data_dma_base = firmware_dma
+                .dma_address()
+                .checked_add(u64::from_safe_cast(align_padding))
+                .and_then(|offset| offset.checked_add(dmem.src_start.into()))
+                .ok_or(EOVERFLOW)?;
+
+            BootloaderDmemDescV2::new(
+                &imem_ns,
+                &imem_sec,
+                &dmem,
+                firmware_dma.dma_address(),
+                data_dma_base,
+            )
         };
 
         Ok(Self {
@@ -203,7 +146,7 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
         falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma()))
                 .ok_or(EINVAL)?,
             |v| {
                 v.with_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 16ef2c79a6b1..b7aac9a25a53 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -13,12 +13,14 @@
     },
     prelude::*,
     ptr::Alignable,
-    sizes, //
+    sizes,
+    transmute::AsBytes, //
 };
 
 use crate::{
     falcon::{
         self,
+        FalconDmaLoadTarget,
         FalconPioImemLoadTarget, //
     },
     firmware::tlv::{
@@ -29,6 +31,96 @@
     num::FromSafeCast, //
 };
 
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    sec_code_off: u32,
+    /// Size of the secure code part.
+    sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    argv: u32,
+}
+
+impl BootloaderDmemDescV2 {
+    /// Context DMA slot through which the bootloader reads the image: physical, non-coherent
+    /// system memory.
+    const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
+
+    /// Creates the descriptor of an image whose code is at `code_dma_base` and whose data is at
+    /// `data_dma_base`.
+    ///
+    /// `imem_ns` and `imem_sec` locate the non-secure and secure code in the image, and `dmem`
+    /// gives the size of its data. The code DMA object must be a mirror image of the target IMEM
+    /// layout, because the bootloader uses the destination offset of each code segment as its
+    /// source offset too.
+    pub(crate) fn new(
+        imem_ns: &FalconDmaLoadTarget,
+        imem_sec: &FalconDmaLoadTarget,
+        dmem: &FalconDmaLoadTarget,
+        code_dma_base: u64,
+        data_dma_base: u64,
+    ) -> Self {
+        Self {
+            reserved: [0; 4],
+            signature: [0; 4],
+            ctx_dma: Self::FALCON_DMAIDX_PHYS_SYS_NCOH,
+            code_dma_base,
+            non_sec_code_off: imem_ns.dst_start,
+            non_sec_code_size: imem_ns.len,
+            sec_code_off: imem_sec.dst_start,
+            sec_code_size: imem_sec.len,
+            code_entry_point: 0,
+            data_dma_base,
+            data_size: dmem.len,
+            argc: 0,
+            argv: 0,
+        }
+    }
+
+    /// Returns the context DMA slot through which the bootloader reads the image.
+    pub(crate) fn ctx_dma(&self) -> u32 {
+        self.ctx_dma
+    }
+}
+
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and its IMEM load parameters.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.

-- 
2.56.0

