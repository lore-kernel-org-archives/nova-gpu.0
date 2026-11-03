Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793748777;
	b=tvc4NDu9nKxXB3Cc+faTcg7zCDsVBVT5Ve0WUQZkJHLW+jNFiZi610on0eKJFyWoDfug
	 xlR4IR5TISZgkS4zJ8ir27a3ajrgc5lf4s7hIkAdU3HOtkTVPU8fOaqYYBVWFHZAG2/bJ
	 YohjhiBaJ0xIoDyxoP8miHm1x1rSLz1GiO5iwSsmJibZBhgvP6yykDDo/m+wn+XdQ7daF
	 tQ3JMJKdHJWhb6jfqzrsiKhJ1BWPIO1eXoGc/FDrNdfQ4yfgaEAcZtnx6cMK4WVJsosAY
	 uuGooIYBhOH/q1KOlzPvenZM2XK3g3lEDvchY1HN4RgNDpOQS1H5FiXsn+7fe3sqogw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HK3vvHiZlr8nPeneHkQnzXrwdiOjXuo8QUqYWS9+Pjg=;
	b=Z0S9puIH9NvhmzHdBL6fswhCkPgLIwyu7OWcHnZxzsNIPnIKPnyAW0tkSX5TRpQpVJBa
	 u+gbm+It904CFjaoQGpt0pImNRbQkVlXCU6YzJV6DiQ4MgCXvS8J7HyBwdUyKeJ/flmDB
	 utfKF3tJOG7Y4aeWm5myAk+a94BGec8kj/9Wm2BpzPQxFkV5Fp5UZucFUJU70R592VZpq
	 oJAbAeYk+bfqBcuv5GK5h8xaaA9aL+EfdgJU3GZChbwKvYSRM7/foQN95OzPTAjKnvdFL
	 i2h4WRxAFZOLnI/uyvNLwv7CSJf2RniJZkLt3H0HNnEnow9GUrVgPrJth7T24uNRNFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mFoUnaq9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.18
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8A606A324
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 23:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mFoUnaq9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywiC31KX0RMMku29vkrFiUnhzpwiDiQjsth8tXQ70fNgiscfDcBDEW+UYW1EkJCs2VU3aAo/3haFJdm3BECk6XpVka9+YxVY/TwKNcgn6e+Ivb/1gRSDghGlzyRHgMIJ6/Ol0nAzOCaLpIuYDVmCoLAe79oBzPCu69+O1m0PGVdMzJLzLMJhgZPx7jDU4mnJdbZ/uju/IMq8t4L4VDKl+KuGSyobNWFs9kWErA69D3HKnrgEy92sq0f+WAlt61r3NXDVpbx3usc3Wm2+PU0Q0hWOjh2x1FVpfWGF/1ySaGpaXi63vE7Lkrw30d8btOdjNtT3s/3LPCiRMetqdDSwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK3vvHiZlr8nPeneHkQnzXrwdiOjXuo8QUqYWS9+Pjg=;
 b=QTiM3DXZndG9oBAIM77aigOtJ+a+wRvrVgpI+W6fDT0GarzzxZmdg2w7LIqG8P1YiGJEm85SLG+++RIrWcrNVVDMr6e0ARr9PYAJngWaOzJOU0T0VFauHvjR4bh6WmXF3RMg721+oNabU7uAPQD1fgCfKXFBkL0Pu8j/JXqMpcekbZyF1Cr4Uy4fg8TTkpylaT7OiHZQLug4H4voksQbmOcdYBy9U+XksLuLjZ5XADmL7BdsyR7cEoA0X6xxQpU1nanjmBqpd1OaBGmRqAzgW53hjaulBHDKTf8oARxDZXLKBBjPFEt9GqZLn6c3GU9JGweo6XEZ5M9CWDw04hh9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK3vvHiZlr8nPeneHkQnzXrwdiOjXuo8QUqYWS9+Pjg=;
 b=mFoUnaq9iEQziPe7djRNw371vSudXUNSNA8sKvCJiW4XRzL47+s9Y94R6CT8VOqUAK/FpohNv8tRCs8E2lAcJh8/YaiIqDi7pYnHQ1NCw+rRZIUYDIT+6CVIuDe0QBdO/XYC0y2DCBYOBP3S1dDGBkUfoy8KSnJKUP7oYLt2vD11ZGEHa1MpUaAlD06qMdgR4bN339gReT2znYMrBM2+la6kkBdSyJDSOlkUagGP9o+BXZbJp+yS1BpEIT5iVFFFLqp2oy0EPQe6HtIfEpBTKuqSmbPZpfoMZts4qAgPTlyrIkIRFH9tFCh38gyDjgHhsHN4EbESLWvH/k27WuLhFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 23:25:11 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 23:25:11 +0000
Message-ID: <211cc191-828d-4494-92c4-168906a0ede7@nvidia.com>
Date: Tue, 3 Nov 2026 15:25:10 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
From: John Hubbard <jhubbard@nvidia.com>
Subject: drm-rust-next needs a commit from rust-fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d34bdd-4d30-4eef-6e0e-08df3a01b4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|18002099003|5023799004|11063799006|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261026140227099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	HZXRpsdixzh++K+iSxr6VqyRzycSWJg/dEIGGc/GOQZn1Cffq++TIZt5GMCyKkBKMWm9kQO6sL2fwyPNC0cPiNXTmQoMG6KZx2Osy2hRm5KjOfb7cUvzeXir1ESXEDzmLKKZcyGfBO6bZsM2QkROMXV2g4MYq/aJQmsITqPVWIt2RU5dXjznFzxiC/0JCsT8iwjK99pjFvSYZw4LBl4iEc82V5H3yF62KWqvZjj89x8F95X/zACRFK00T+8sNnjGrEzfplktFYftVPpfuNCZZ7HJoNzW7rodKNhVKAItVLg46WCz015O6CalFVnsGJlO7VQyh4Fs7mkXoX7hanA1lDOMmBbWuWtQ/jLoxIkHdqRdgVbLPDCkkjLMbqHB1Pvos1IECnARiYGqI3nnTiJa9ijJ1feuHAAQSz2qnwGoYIhpmIWAoF9QuCtxxsKm7FRhNzTpZvJB0jP6wgSqBH1x0o3N5N5sBEq5a8OyLxw+/WK1kHHG620TdngjEfg02OpaBUqKCtw5LYpNiDon9QmWy8k6/Xb34P7yZMgw7xc7cOxvoNRhqEJVrEyKnjq5yku2ERJO9OPhwSlJD81CG6ROKTVNSHO5qRg1hveprQJO3e4/w7zD3GjQJ538MBZ8CgzZZt5bAjhWXQqBSQe3n+SPcf/uMasnyvtucUDlcPIjIkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261026140227099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHBQUC8zaVlqVWExZGhJV0w5WEJPWUVaYXJpYm0xdUpoVjlVbDBzaEZ0dnVv?=
 =?utf-8?B?VGRiZXVhSWc3S3N1RDMrUzFLN1JnSHptY2lQMWlhNGMrdUZWK3NCcFc3RDdw?=
 =?utf-8?B?OXBCaDFNbnFMQjB5Q2ZKZlVYVE5wWG1RV3luN0FkRzBobWJtODRLdW0zMkdM?=
 =?utf-8?B?ZmhNcGpqemVUUi9QZmlnT1RvYmJUanhRMFZpY1BaRTd0cXhXaXpVcmlpM05o?=
 =?utf-8?B?bStabmVxL2RBU2NZWndRTjFIZFpIa1lBN2FmWmtiS0hyRitnMXd6eG95dkdo?=
 =?utf-8?B?YmZ0R2xsSG1mUEI1WW5DL3JaTDAydzFQWU5tY0cranBueGRTcU5jSCtYSVpl?=
 =?utf-8?B?UjNTMVBxU3ZtY3BMYTZGa0VyTi9jWGNRNHFzSVZ0QzUydEFqSkcxakdyWk1j?=
 =?utf-8?B?bzVMYWlDTG9Dc3pGS1dMZnBnRXY4aDEzVjcwZzhYMWpNTXl6YWtVQmhLc3Bn?=
 =?utf-8?B?aEtwa3AzM2NJVm1DOHAvRkRadHE3cmhRdldNT2wvZ3J1N3lOc2IwK2lwS09V?=
 =?utf-8?B?WURNSlpCVmFUelVuR0ZQUVJEdjlsR25QeEN6Nzh1bDRLcThDNmZYSUV4T3Vu?=
 =?utf-8?B?R25ZU3RWQm1vZHpaNWMwd2hsbkpMbnRiQWRocTFCb2MrSDZMSHpmTjFaQnRu?=
 =?utf-8?B?QWxWTkxjVE1uR3RJbXkrQS9ZY3JEVnY4cVI1WXlRSDVCcm1vbHpjNFZ6U3lP?=
 =?utf-8?B?UkVvLy9jYVIvNVRhMGxnZ2l5M1ZPSzNTTGgwVzlXMnYxdDg3YmhlQXQyem5X?=
 =?utf-8?B?ek1rcWRuWDJjTk8zeC9CVmJYN3VoUWdOZUV2WEtEK2VyR1lZbzE3ZGpaV05M?=
 =?utf-8?B?MXBleTh2RmgwYlZyYWRGZUw2TGxTMkZvMVQ5aXJEcXJrbW1YQlEyUzU4MmlJ?=
 =?utf-8?B?SGpGNVZwZy9kUGNWTzkrMXZyZm1sejNPWExoR3dDVC9PSURzVHhjZkczQ2Vl?=
 =?utf-8?B?TlRQNHYyNTh4aXp4SXVyZThyMlRabnNaNVRYNXhyZW93QmZxRHpiTUhJYTdZ?=
 =?utf-8?B?Sm9Nc0xlemtpNGxQOUlmS2VCR2xmTWxGeTBJUjhnUTZZNmxPNnFXVmd2Vmpy?=
 =?utf-8?B?ZDkvc1NzU1YvZHErcG0rZ3UyM1lnTUhpa0M3RDFrendDZ3FWc0g5amYyR2Ix?=
 =?utf-8?B?V09CbWtFTC9rd2I1cHRJMlNxU05qZ2pieVpaMGdrK25peTg2QTBhVEJWYWNH?=
 =?utf-8?B?eUgvb2ExMHV6MXYwQ1BDWmNUNkRBK1l6dVpwRjN2cHJQc2JLdytlVW9EUW5J?=
 =?utf-8?B?Y2tEaE1DVzYvYi9CSm1qQmYzRGV2RzJYMGZ6ZkwwSFFQdi84ZURBK2tkd0VC?=
 =?utf-8?B?a3RZQzlUUHdsSE55MTdEOVFNcW5nOERjWjJ4Z1ErU1J6ekpVVE1jU0NyeVNx?=
 =?utf-8?B?czUvSHlHZzhzTXMzNldkc2tnZDUzdjlrcTFwdnFTbXJ2Rk1FMS9oUS9MRUhl?=
 =?utf-8?B?VE8rOUFqQmlkc2FEbkF1M09JWWkxVytTY1I0cTVuZUxqNjVaUi9SL0RIdU1r?=
 =?utf-8?B?djRmMVpldmFzWEhQb1NUajcwQXVIV05MVVB6TU9rSGJSN2pXMVYwRWFHcHl5?=
 =?utf-8?B?d3dYVFF4MTZkZjRBNW1aNjJqWGgrRFl5ZnNEY0Vtdkl6MHF5andNeXdSTHdY?=
 =?utf-8?B?K25Fc1NWcldyUy9oMHZXcFFDVkg5M0tEYzRyOVRRTWwzZUYwb3pvWXB3Ujk2?=
 =?utf-8?B?dVdSelg2L2QxcWJEb0FVSEIyWHhMdW5jaXJaanJvQTFwcTduSHVMR0djeDZt?=
 =?utf-8?B?aGxxbHlNT0xoWjJtemdVTTNOVzdXUXlVQWZ2TWxBb3Y0Qi9TcUFiZHljRWgy?=
 =?utf-8?B?UURTSEo4MnhMRXhicjJxbTBFZ0ZYV3BLaFdhMGdSZE9IdzBZRmxhV1hnNzZW?=
 =?utf-8?B?Q0NtOVlHeHJ3Mkw1U3B6bmtteldZNis2aVpDWXE0bXBTeDZuM280Rnh3ZHhq?=
 =?utf-8?B?dVB6QjRxaitXa0d2dWJoWHo4Y1R1ZzNlSnQ2WlBsdXE2Nm1nWXpNUWIyTHQ4?=
 =?utf-8?B?TTRNamhycnlnUWQvK0EwRENZbFNtMCtEd1hIdkJTOGY3clpZa09XVkZEajAr?=
 =?utf-8?B?RzVsTHZHK25obE5IWHJhTTdCWG9YcndweEI0b0MzcWZSckNFVjNGc1lzWEFn?=
 =?utf-8?B?TFhQVE1YZTU4SVludHpvRDlEblZENXZZQi94WGVlUGc0eU05SURHZGs2M0JQ?=
 =?utf-8?B?T0toak5Tb2dlcnhhY3ZPakJxTGFrTC9GY3h3ck84ZGpNR1JoTG5pV2czbE5j?=
 =?utf-8?B?UWRZandzaGR6b2dsTk5Bdm9uL0ZET1NnZUdrYnlQZHMzWWZOZElMV1FGRUho?=
 =?utf-8?B?WDNZalVDc1gyNWEzR3lTMldyZmF6MGZ1YUdFNU9naVZQTEw3SWRzZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d34bdd-4d30-4eef-6e0e-08df3a01b4cb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 23:25:11.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6N8TPRiSuPsPLITDfjHwjiBKbubrKyVa7846ixNAGI+mn9wywgmfqzokutPAKV6A7iMHPVarigkREGENztiK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331

Hi Danilo, Alex,

We still need the fix [1] for this problem applied to drm-rust-next,
as of today's (Nov 3, 2026) branch, anyway:


$ make
  DESCEND objtool
  RUSTC L rust/kernel.o
error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 64]>: pin_init::Zeroable` is not satisfied
    --> rust/kernel/block/mq/tag_set.rs:41:49
     |
41   |         let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();
     |                                                 ^^^^^^^^^^^^^^^^^^ the trait `pin_init::Zeroable` is not implemented for `bindings::__BindgenOpaqueArray8<[u8; 64]>`
     |
     = help: the following other types implement trait `pin_init::Zeroable`:
               ()
               (A, B, C, D, E, F, G, H, I, J)
               (B, C, D, E, F, G, H, I, J)
               (C, D, E, F, G, H, I, J)
               (D, E, F, G, H, I, J)
               (E, F, G, H, I, J)
               (F, G, H, I, J)
               (G, H, I, J)
             and 6196 others
     = note: required for `bindings::spinlock` to implement `pin_init::Zeroable`
     = note: 1 redundant requirement hidden
     = note: required for `blk_mq_tag_set` to implement `pin_init::Zeroable`
note: required by a bound in `pin_init::zeroed`
    --> /kernel_work/linux-github/rust/pin-init/src/lib.rs:1688:24
     |
1688 | pub const fn zeroed<T: Zeroable>() -> T {
     |                        ^^^^^^^^ required by this bound in `zeroed`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0277`.
make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
make[1]: *** [/kernel_work/linux-github/Makefile:1423: prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2


[1] commit 57d916a3eb76 ("rust: bindings: derive Zeroable for bindgen's opaque array wrappers")
    from rust-fixes


thanks,
-- 
John Hubbard

