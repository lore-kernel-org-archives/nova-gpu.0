Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011048.outbound.protection.outlook.com [52.101.57.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C38233941
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407496; cv=fail; b=PnYcm838LamMEY0avOUlZe9cokkQpVY3jx07mWhjK0SKbratXMzI1BstkIDDVmAWaSZ44F5KJHYeTymkumBcmi3uMVd1FYqr4heraRjz7m/k5/gFhj3/+C6fRpjfETRBEysyOSe0mf1cj3eLrE2b5+BVrCdNCRcxQmj4A7d/Dnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407496; c=relaxed/simple;
	bh=uuSI1KLfbuquuePya5Bf9Xo19dR4c+92FKZQFdQ6SfU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=bhWs9qfBXaUDJE0lbypXd+mjgRHfO/TGbod6H+dowxJLzo22sIXj6tu79cV70EaBuf8nJ92LBYNcqqC3w3MY0+OTDly6Di7NqQ6QcDehhUBCGr5apS78GGP+5mwpXH/ArI/O/4a/wuBtmxlW9A2B7dm/XiQkO38BuXnjnrDdJNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UErI6Ek8; arc=fail smtp.client-ip=52.101.57.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UErI6Ek8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSZRAEhTf9AhxoUnY+YcOb0605YA8n8baGUSoLI8UU2CWQQr6j5AWtnYEfQNDhqMRekeQ61iffwWMKfxXE17E4sAUTyaksUte9HWwv6nQQheKlO8KRtGz5WpeNu8Uis5Y7UVBqn+OVnBHNAOO7V47Yq/1E7bYGfqhEae8S3ogX6o5TKUhTULMem4Dcm5dN2GdmyTQ4Bj+9MmVk/UCHeKzVIcXic0mgit6eAJxiKY/F8HYfFRTQ0v20EN2Gt1bkSIsn45cai1bpyiuVkdJ+1GVE5DlHvUkdmeXDTeD8ckMfGcjmhYHPbwfkzd/SxRR2sSFeNm/wON8EteLG9rhHUdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZbQEgLvcb4NZq20AswTwzCdEhvnCvKGeLrAeIv9OYg=;
 b=sXNJ+Zk2Nc2nu6rXDxV85+cdDG/QZrXelAX5Ex4LJHzdcj61hTSzuremrHeXQ/Snd6PY//Uei9NeSyjwrZXUtHd2Z6QlQZQeW4kcI33kaNbG/Gf/MMJABBAtvjywVS3JdZp/On4NYwkB+gmwcNHFUE4q4pgKixcPI8+9vJTO5RQDXMd9Ey5siZMyOCb1arkZ9W2+SJ47UTdYg0rfkytYv2hr+LzZE+/iRriLfcoEiF5tx+n5XXowFzRnYUADKtN6YbtIEUORqQHD5qJh+DSxtZeKZanOzsj9XUpIt6BkJZngijmF0b0e5tPY2xJ0i0xrw6+8xnn6hVWFYHKZcVq4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZbQEgLvcb4NZq20AswTwzCdEhvnCvKGeLrAeIv9OYg=;
 b=UErI6Ek8utwDnInPbIuewYKl1sFtAqVrXP40BZUhxzIHAwYozMeQgXoxlnJ0bUVTS25LxG0RxcFx7dDgl1QWReETfXALttewFU9g9+OvmWRW1YJkJxFDCiUOva/0HXL1/tGutMvOIv9PKqKe9w2C00XVIUPoAULpYI5y2n63PRw3vFHtk96husl63HtVmftU9LUMQbDC1pOzlNN0M0CutO5dz1Q0l5UhGKV1x1X7yxMetL15N8E2g4aajAFtZHXgufouz6+wmSWHYOOl2EquQwOZBpniyQccWmfk1l+ORQGWph22mz7iXIkui5kwq3a5J6HVdGI2nqshwuj53yzl+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 2 Jun 2026
 13:38:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:38:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 22:37:58 +0900
Message-Id: <DIYLS0464HJX.3HNW2XYI4DWO9@nvidia.com>
Subject: Re: [PATCH v12 00/22] gpu: nova-core: firmware: Hopper/Blackwell
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 01749867-dddf-4716-bbd9-08dec0ac2db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|10070799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tBi5PSu5vzOxUVE+xStCEGPtTWs8We3krG/cpaN2iOtGo3LlYlN7UbBUT6xqFqFIMqgM8vsFlEQ5lLczWcEsWOMEsrxlS92Xsp8Bob5Xp2qB3kBLk+EJBpBqy8z8qdq6vAQun+axcgYWzEuoYkUcSke0l7ptsJ+qiB/Yaq9j2rLTk6XoDcsaW8cer2olHMrtWoKrxZDZqhCp4a3jYS0y7Fk7Cg3H+PX608OEWQvxP6kQcI2ZqXyF0z0EYwAAzPwqvFRdF+jDjIoafSXzE6ibFuXFW+HYS4MPvRybbhvR2KvoE2E0ndp0cjBzeZ5K0ZoUHO6jzDRVohhbgwtEDDQDJF3KVFSJw2yeKgDpSrc4Gw6ybi2zblJ1/07yE+cegVvekSW3DIihZ3yF4prCGOKMaT3hjd5r1LqWh+sTPrSNuBZryEDh0VbGfXxBYHVNFfZ+Z+vnp1/PDYzqk5bz0+1LPwsrtPI4nTWCt6m/fnOuyZamBlCoUhLfOuw7rn/mf9wsrpODZd7ZoXBfADN2VqFcMvIY3hc9ZPKklQWlLg3AJaL8EVncDxr1RL5qlyeRr3BvNKntfWCFbo8Bfy6WUzvpWt7vo4nZuUnW0gbB6fIeBCza4K9auMmqRO4f0rSgAfXh3p5iK82ycuB57Hvf8eS7tm3bXlYLUbSNR7iwtT114veWNtI0wcd6VpNLvTst/CwF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(10070799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjFoK3h6MS9kNGVYOUdWeklpZFJEbDFwVWY2Q1pCSXpVY3JjNnM5bm92dUlu?=
 =?utf-8?B?ajdNb1dZTVVtR2Q5UUpLRmR6TGJSQWJjK1U5MXVpaW45d1dDN1RQUkdxZFZh?=
 =?utf-8?B?RWdVZVpMY1hNRUZYZ0JOQ1dQS0FrWHpZQjJsTHlNTTdUU1NNWE1la2VqYXRr?=
 =?utf-8?B?SFZLSVlKRUl3T1dLM0E1anA1NlNiTk4xY2owRjhxeTQwNExQczRkM2R5Z21j?=
 =?utf-8?B?aEhjQkZjdnV0V0pjc01NVlBVTmhyZ2Jvd1NyNmZmcC83cnhmWXA4OGxrMU5F?=
 =?utf-8?B?UllSVWw0RmFTaUJYZ3lncGFScnRuSXFCdXFraGZxYUd0K3dlRGlHd3AwZDdE?=
 =?utf-8?B?SVhEL1g4U1pBL1hQQWRRR040WElReFl2aU9iMUtjM2lKVFdBV1RpcVhwdTZQ?=
 =?utf-8?B?cmNGQW5KQnhJU3ZQcGNBSUd6T2tyUGlmNUw2d0pwbnRWQ1hWRWwyRnlZL3Nq?=
 =?utf-8?B?THB3UG9Ybkd3QklyZm1QcmFLQis2N2c3cy80OGtvTEhIYUVZUjR3MW5nYXFa?=
 =?utf-8?B?UHA5MnZZWVk0S1Jud09objFsaWFEU3pkNDNjQVRMbHR3WWdQcmYzbjh3L08y?=
 =?utf-8?B?V3ZiYWU4YlNsdVdvYUk3Ympoc2xxL1ZiaGtUT2x1dFZMQ0pPbnRxZUhhQ1hw?=
 =?utf-8?B?bzVhV0lSTk9sUkgvRnVQZHhjVnRoejJvQkdXcUIzQVdIOHlVcmdsSmRwc1V2?=
 =?utf-8?B?bDBoczhuWTQvVXJuQjU5R25UOW81SmM0NVdaTG4vaVpmN05Xb3FNRStpV045?=
 =?utf-8?B?ckRNNFFwckRvNHBZb1J5VytrK3RLei90dTZZcEh1MWJjd3pZMW4vL2x1bmhl?=
 =?utf-8?B?N0l6Mkhob2UzcEhHc1VaMnVVd003aGYvR3pmTGxUUmhvQ2JYVjZORWMwRUJ6?=
 =?utf-8?B?TlBjRHBKSlJQTllFZk44MUp6a2dzR1JFaHZlK0dkVGEwa1dHbDBqc1NUS1Iy?=
 =?utf-8?B?bEt0TU85c0EvTHAvOUpYVjVtdGdDNGJsTng0MmcrN2lGdmpBaVpOVnF2SmRZ?=
 =?utf-8?B?TXBRcUEvRHlUaWlnS3BjOUZ4U3dKWXg2MUVvK3B2WHQxS0wwY3JieWgrb210?=
 =?utf-8?B?RUM2QzFQZDh4QkUxY0dOTHZXV3lySHgzWjFpc0ZERTdRMG5xRk1sWU9rRDBq?=
 =?utf-8?B?Q2MreTZsY1VoMzN0Snk1MkNpajZ0VmlMSS96MGdzSDB3REZvYW8xdVVrcWMw?=
 =?utf-8?B?ZEV0TWJYRmwvNkE0NkVrY2krbUpxTlRxUkZIWVRqVDd1blo5bnVoTlVlclFX?=
 =?utf-8?B?M3ExOHhodjF6T0prVjZLQURlYWtUdEZXdU9DSlZOcGJrblZ6Zi8yNlpWVnQw?=
 =?utf-8?B?T3hFeS9NcnZrMHBNcXNWU2o3Vk9OaDAyWHl4R01aaEcwT1JpeThnTXZ5Y2x3?=
 =?utf-8?B?ZitkUEpsQnFJSFE0SE93Mkp2UUlqRGVSS2ZyYTQyQmNGYXExT2JZK1Rzd2ZI?=
 =?utf-8?B?c0hkYW8rQjVlN3Y3UEYwbDVzVEtQRzI1aHdYVlBZbGdCWjdrYXJWcDR2bE1B?=
 =?utf-8?B?eFd5bUhYNkpVN05ORjBCMU5jRWt1c1lVWmErdnBTbSt2VkNqcVA4MjVyR2Vi?=
 =?utf-8?B?THI5R09BOUxMSXBqQkdjRlFTTmFrTUdhb0gxYjExUE9lN3dka2VYcnhySUly?=
 =?utf-8?B?ZEpKWTQwall3UHAwQWtBWWhPYnczUWswa3p4OUE4RmZValUzL0xkVHRFV1JK?=
 =?utf-8?B?NWFQUEJ4QTFsMjJhaDVjakFBUnR6MlJuNWlpeWhSaFhEYnBHdDV3S29rSC9Z?=
 =?utf-8?B?S2xLSm9NNTVZQ2xaazRCZWhUVWlHbWRMN3hha0pRZjAxT1VYVnJwL2hXS01x?=
 =?utf-8?B?eEFFcUhSTDZLR3RlUWk3ZVg3cW1DNUI5a0xpVFUvQkluOTl2S3ZYN1Rzb2xm?=
 =?utf-8?B?cGlpdG0rUWloS2grWVA3bDEreS9XVTFzcTVaWGRubWxKYXFlZVlVUGZiY0dZ?=
 =?utf-8?B?WGMrWHA4OUYzeENpaUZvYjRQRFA0ZTM4WDhuSGNVR29pTG81WWU5ajlPaGcy?=
 =?utf-8?B?VkhPcXlSR3lXR3g2Rm5kQjNpRlh2SWppNmQ2MkVYL2xjVi9FbnZrSllqdjg5?=
 =?utf-8?B?bkZUeS95WXhhM2F0VHNabHJpQUlzaG45a0JZdmFkMHo3Ti9sYnFsWUNTRkRa?=
 =?utf-8?B?NzFNcVVhcnJVbHd2bUdBY2Ixa3lLazlQZDdMSzdFczZrZi95RDZiK0paR0JT?=
 =?utf-8?B?VFUzeVZ6N1N2VlhrMWZwREhpZ0oySll5bzJMNEZBUERaZXNCV1pUQ3ppNERE?=
 =?utf-8?B?Mi8xRm51L2d5Qm5mN2xKWkF4Z1FzWTBFSUpjT0JNVTc4TWM1S3NCbTVsSFFV?=
 =?utf-8?B?V2QzeVlZcnB3SDJUZHNFTXFaTTg4eHRxMndFSzB4MW10R1JtZGJuWDhoRVdw?=
 =?utf-8?Q?HSb1/NVqYx7yMsWvY1w8mMM1GPzjHcRK804JZzc+ooPI8?=
X-MS-Exchange-AntiSpam-MessageData-1: gMiqGAuNrGChmw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01749867-dddf-4716-bbd9-08dec0ac2db3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:38:07.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlLf3n8qHchbWAAZj9a2k3VfFUxyi8DPCWytzzX/xC4KWO8wVheNX4IUceegCSS7Px9Um9tp/Q4KSM5Fkxw/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

The following patches:

>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
>   gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
>   gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
>   gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
>   gpu: nova-core: Blackwell: use correct sysmem flush registers
>   gpu: nova-core: don't assume 64-bit firmware images
>   gpu: nova-core: add support for 32-bit firmware images
>   gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
>   gpu: nova-core: Hopper/Blackwell: add FMC firmware image
>   gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
>     waiting
>   gpu: nova-core: Hopper/Blackwell: add FMC signature extraction

pushed to `drm-rust-next`, thanks! Let's have another (hopefully final)
round on the remaining ones.
