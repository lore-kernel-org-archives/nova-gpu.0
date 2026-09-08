Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A438333A
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861250; cv=fail; b=OSmh6iuDZwWj6TkrWSKSGDbzIHDo4E67hDBQRtf+xIwsMKWi2L7e1BZ6WEAXitYiaZsKpfaoUClrJjH9HPGVny7nBBFVtMIFarO9k/4vccAYirCsaL3AT10gZwOp6rG6Ax4YFs/2XYsUWA9gLZ54EMjTUwgMJpX+pFDVLoM9J68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861250; c=relaxed/simple;
	bh=BaE5cGVWFab11wLQQJy2f0a0LxNlYn3yafFEbO3jJCY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ue4Gy69Uc1aH12q4z8Vv3L0NBYfgYepPJmWnKZETZEwPD/nKJteimamRc/JllzKBdMSFTR2fck+Pd9IIYpid4Sy/VA4XdvA0Rr8Iok2CKQykrH8b/d7M6FGurrkDqUAZ1c4YAhfwRvwlnVJgazN8/vA3K6DSZ68S0BJmuLFgyFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=muSr0zx6; arc=fail smtp.client-ip=40.93.194.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="muSr0zx6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjYgf4sbU+v5vhH/I8Zlr6b9+xPYnFxATAa5C0hc4RwOOGFR5J/+Lz06K0FJOiHTBEy9soRve8XyG8WRtvrPhzahwKInCTFfQoOLw51aiF7X9MzcI12Vq9p/o4LzraMvsLyyX/Ii198+6S07JwF+RVJpwR91usUDnaqBA8Ru8w9ffosbzqqUo6Owr32dde2hhrmcJgruOuRTd9YZVygEcg6Fi9K3V2XcmFrJKz4zV/HlLy/OOuFlL5joWOR0RezqAP8ovVAK8iRHZ5oCndiB8qMFwUh1b5VclsfLpZl5ySzzXHd4LkjGj0FGCfOUU5SYOv9J1HDiWoIeqI+RR6Ru3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaE5cGVWFab11wLQQJy2f0a0LxNlYn3yafFEbO3jJCY=;
 b=f/kYFvacyS68vNRaW8FcUVUJia3lxniMM9h5mgXR1IqxMxNR9ra0NZSClMNvSxAIE0K9ao4eI6hiXWomf1hUJ0ysNrGKZm/PMjdSNY/iaYJIOO6ywPBDno9Az4t/OgTcxiHgNmRLU3edy+nx0iNwKHHhZiiIXVeeHaZkR5mDG5JrSBQ7rmmu8kLnUc2hUxeR+wgc3QtJmzNTPlcdp5v/hpf9VP1G4E6y5/MnhVUTi9zTJ7sU5fW3hbmgTTNtcgaDWQHQjrBA5WqArF99RGEKM1NHNrC73Jba22IQ6oeDl5tCcoTQCRWELsirM9jgPo9ECFh1o9lg0B7hIZc4jRqA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaE5cGVWFab11wLQQJy2f0a0LxNlYn3yafFEbO3jJCY=;
 b=muSr0zx64DKOuqMB5NbbUZxOS990eSy7cey4MmDQpj6n3y8jfuyCDGXSfKkLPDMx/y5DB4GfRlkulLMc53NF+SyXXXMAEhTJGceIPUIGB309l9cEwY/Pyq0Kfd6ZtueWWX/7XfZzY2MwCk82Fcm7uedHxvnLVse3qbApAKSIt9TdnQSgke68xqAxGtEGslR5IZ5X5c1GSKeHfpxtOL5v7rABgKUIweLvxgzyhT09iApZJX4Jx7hmRYI3pH8h2mYg5vpAX4f574Q1ubWNBYIamf7wJXK9wX4SkYBzUCgqySdEO58uny4oi6u4PHFdujD7eMB2+m07RTFH3YyeNbnIAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:54:04 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:54:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 18:53:58 +0900
Message-Id: <DL9UDVV2GBI3.2SYKM26URXAWH@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, "Andrew Ballance"
 <andrewjballance@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, <maple-tree@lists.infradead.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Gary Guo" <gary@garyguo.net>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH] rust: maple_tree: implement Send and Sync for MapleTree
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
 <CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com>
In-Reply-To: <CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com>
X-ClientProxiedBy: PAYP264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::9) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 486b762e-fe8c-4c22-1c77-08df0d8f1d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|10070799003|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wR3+i6M2syJkEqeF1eanGxgGdzdGXpy46oZD6piOT0Y4v9NA4XqIlI0GgjIekFS6axorfoFq0foO+h8HyFgLLVidogWudqUL52uNnXqI1cwAnmk+ZfGoah3S3Rq4lpcdUj+b1i417rYBIN0ZUPkC+9Q3NePFxxm3F9gZcVy0HxUzg/WeLi1+J9plsU+PAYdx1PK90vNT2U4zVy0SOus6aw9qksFL7huPF/Cvpq2NsPQL9B+gJ3IxK228TNQdClKanrbYZ7EA1eYrZTRyzppkutVeGu+j2pJHJah4v1AEi9ZhPqYiRCLI6ZbYrXkkjyocdz/y5D1dHHlw4gpZztkZcMOUAaWdTZF7mEO47ZGkWOkBn9mStBvhLnDqZFLmFhrvN/uAglcQBqx15ISXYFNcE5i2vS5waHuvSMG9vDqtjE6fIjxMee5yIS4+SeUHbo/rYdIuggtrWaNUTJkAGviiVgzVH93kIrtKqZ7KSEiTNUYEXGF1iczJy4go7QOqs4lo8iSGOcLlbXWBCe7C1mPS/jTa3nSyy50OiFXtdQuCIZlJ8VZw2q6AjbXw0x3gE6hppsBhlot5ACAE8mYvcS2zLHTpdxvXI9QimF1HvvJS7DNczse0xcCoWpVEOmizG2IiqWe6j2kiYCXQdAanSoFer/hKtlR/rxaLGlkssSArvus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(10070799003)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9RYVQwNlpqa1JMM3pUUGhGVmxEMmord0dpQmVuaWFrUzVydjMybWpPaG93?=
 =?utf-8?B?bDdlY0JsWWtVYXRjWks0L1Y1NjF3WFEvRWNwcUE0WmJ4NGF2OUdWMENiNWNQ?=
 =?utf-8?B?U1hiVHUwVVhOb0VXMEMxVXdBd2xxR1dwZUpPNFFRSW42T055TnpWSmlXOEk3?=
 =?utf-8?B?VTlyZFZ2R2NGUkN2ejlKZ3VtdFhtTzhlbjJtZGVMNFdhRW5WbEltbVpJd3dj?=
 =?utf-8?B?emVvTG5PdFo0N2Irdkk5QUNxM1lSRjJ6R2dDMlhFcUx5NXZZVUFOYTZ4ZUZE?=
 =?utf-8?B?Yi8xVWhodTlFaFZQUk1Mam9yL1crVUlhYUpIbk9Ec0RMKzVqbC9HSGRCZldi?=
 =?utf-8?B?WFVHa2FuT2ozTnZnV3FZZDBLb3FDTUhPWkxYc2lMeFFFMVBVMnpqc3I3bUlH?=
 =?utf-8?B?c0tXbGcydFFmQXRTZENOQ2FZOHVFRmE0OTFjUi9GTEVrbDdHNDJiMm9iekVV?=
 =?utf-8?B?ejJYaFNTU3M3KzNWRHZlNWxKZEhISGFrdWdacjQyeVZudys2L0hYOXdGWVNn?=
 =?utf-8?B?VkUrUGczSW1nOGRrdS9Eelo0WVlhblo3V2RjdXVzVXJid1dDdExCM0hpaVNO?=
 =?utf-8?B?Q0gvR2x4SU45ZTZWU3l3WldZcndIQUZpOWt2eml0UHcxNzFhSlJWRlJvcEZk?=
 =?utf-8?B?V2lPOUNOYU42UjNYai9KTWxPalljMENJUm9nVDZoeldBWkJHVmI3OUs2TGFw?=
 =?utf-8?B?ZXBhekcwa09qN1k0MytLOEE0U3FDM24vOWM2Z0tOalV5VWhxTkpJVXFrNk84?=
 =?utf-8?B?VnVHVDlNbDdONlVkK1ZNT2l3SGhxY3Z5S2FNWkRPbnlLR3RLSGtpYXVCWUJU?=
 =?utf-8?B?bUNqaTRrdlM0YWtNQlhtaFNLWW9BZzViREpJN2VrdTJuOUZ0YU5YTkhNakpN?=
 =?utf-8?B?c1c1ZXA1aktiTGprOGg0andySEZVOFBEZ1B3MDNlMVRiaTJFVWJmbXFEVG0v?=
 =?utf-8?B?MmRwSittc0lVWTBSaGw3QlFvSWFCbjFaVTV2d0haNHJTRGwxM1N4N1BOWWlP?=
 =?utf-8?B?Yk4vMVFDQU1wOE1uWi9tVXBXOGVQVjE2anBkT25WeUlJSnIrNjV4WnVZUEFp?=
 =?utf-8?B?cXJ0d0ZUQ0Fzb0ZyKytyMk5qSm95YjZ4SWR3R3NBNGFHNjRvNzhqWE8wY3BP?=
 =?utf-8?B?UFpCOWZaREhsYUNCRlVycUVSV2ltakF0Z0NIZ2FTc2ZqOGhhcTJzN0IzMkJx?=
 =?utf-8?B?dEdrVlhqVTJoZ3Y1ejdoMVlxZEFyU3lmZUo2NmVSbFFZTEhCTnNJaVU3SGp6?=
 =?utf-8?B?VC9IYUNWQThONDgyMnBYYUNFUEF3RUN4aGxVdXRJTFVRSUdCZGhER1JlSHVi?=
 =?utf-8?B?VWdXeVJvc3NuQjdLQzhLcDBXbVpwUXQxZzB0VVl3Z2FSYXFuY2VNSkQ4N2Zn?=
 =?utf-8?B?QkV2YU9kdVZYZ1B2aXRHOVEzeGVLUXZGRE5VdzRUWWZQYyt1a0xvRjFMWnZ0?=
 =?utf-8?B?dVBJV1IvWjhtb3Bpd1EyNWYwTURpQ2x0eVlzcEdqQzBhS01WWnpudDRvUlFl?=
 =?utf-8?B?N2FOMTJPdG5COTBVL1RsWGw0UkZaWnlHVzQ1U0V4SGlLRERsbUgwaE5LRzNB?=
 =?utf-8?B?emhHN2t6bnJqam00SmxYTkM5b1VqUDJBSi9sQklSdkJiY255UVZYU1BEWnFG?=
 =?utf-8?B?V0ZqcDE5bElTQ1VHUDFpd0g1anc3VGRsRjVTWXJHanJza3kxY20wcDZzbWdj?=
 =?utf-8?B?cVFLMkJRRVQ3Sm9lWWIwajg0SDBua04xZDdtMHhBOGFNelE1cEUwOGZ2bXFw?=
 =?utf-8?B?REZmY2paeDRWbENKY1ZYTjZCeDVvQTcxNE9rL09RdTQ0bU8xV2JrSWJPZ2xV?=
 =?utf-8?B?YzJJZ2ZpZi9VUE42MzBPeVZLSG94dUM0c0cvUzRxTnh3SjBSUVB3S1J3aDRn?=
 =?utf-8?B?VXZIcWR1TjhqWUp1NTR1VkZHVTE1N2kwcy95UU9iR2hFSElCRVMvanJSSC9t?=
 =?utf-8?B?ZXhHdzkyaXhYVThzU3pXR2Y4TjBqSmFNYW0zdmwzNXpEUEtCeEtWU3dROVpI?=
 =?utf-8?B?Z2dwK3lBNUlEVkZJOHBhUVpXUzBxa3V2RWNPOWJkY2svTUQ1RU10VUJLaDJF?=
 =?utf-8?B?RmIvbjFqNU9NSEd6dVBsaHpKVTBRaFNrcS9nNHNsalBCNWhGWlZMMy9aM2xo?=
 =?utf-8?B?Ly94azNUMFhCY1NTM29DQXg1bzliNjZxeDB5Wmg1L2wzanNQR3k2diswbkdK?=
 =?utf-8?B?L2djUHg1WGNIckdKdm5melpNTmJWSm9DbW1CL1ArTzg4bHVhaC9uMXdOR25G?=
 =?utf-8?B?cnVzSmhWV3FCdG55SU5KV0NqUnJkb0dxYkpqREcveFo5bnBTNXN5QUNwK0ZN?=
 =?utf-8?B?TndiOEJuM21Ld2RqVkhoQ09nUlkxZzdocTJ2OGZPV1pyQ3pSRllHbzk5N0Nu?=
 =?utf-8?Q?ha5XEH9BhZShZjstDJhBbb3Ie6S87Cam2bW1rDJBD9+jQ?=
X-MS-Exchange-AntiSpam-MessageData-1: HgTW2ZxidQWmMA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b762e-fe8c-4c22-1c77-08df0d8f1d9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:54:03.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOG/rD9q67YkhWMSi9N3r79tyE01Uyd2g0Qr56Vw9X9hGYTG1KB8rp5esmX19dmM5VRDet80iuQboZ1AVqJIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211

On Tue Sep 8, 2026 at 5:49 PM JST, Alice Ryhl wrote:
> On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>> +// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is se=
rialized
>> +// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not r=
equired).
>> +unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}
>
> This is true now, but will change if load_rcu() from
> https://lore.kernel.org/all/20260116-rcu-box-v1-2-38ebfbcd53f0@google.com=
/
> got merged.
>
> It might be better to just pre-emptively require T: Sync now?
>
> Alice

Yeah that sounds reasonable to me. Thanks!
