Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08772345CAA
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 01:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138595; cv=fail; b=LNs3Xtcu+XLvUKmPSFZ0m8Sq9m2kN2SziRV5pvi1+1675ljUzUOe5DbZP4F21GDu5FTIZqgd+sXVynPNa6ntnai/HdfsjD38fk3IF9zZjPahIFYLZt+UokHeEkm//3D5BFCjIIaVDSgUKzVvnlPKymkwZlfQjeQIzk/aAsP4JhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138595; c=relaxed/simple;
	bh=kq1k7BJDp5D0bjzX7ujoJGoGXUv/S2mszNuZ7OJLh3g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hbSEu4a+JomCjpddd5koVMpsgRNbYT+d+XqjbBAkh+pPsoydqORlc53z5z1MopR1MiOIc3zKQBFOOAv6UEPP1qyiTiTT41rVjA6P02o5rj36PiCJvkHz6vIKdCkPjyaMo/hQ+9MdGod9IEKLwat97yFZT2vVVcFTTZA4WCw/x1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bPzibjQE; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bPzibjQE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVm1swMwzWpK82zSJA65FX7DSgvLuloroSxcetzqZQZT4rbucWH/UcWGAVwQRSG3qzzY4o63WSD3aYZL7O5cbBkljAp5QpD+6qqswdUDIV9z6pK1/8xrlRRO3UP/AkHglAr3XhvqeAUcaIb73kNKKpLhkNuJPZNSP8y7vdd/Q5qrxs6jjzyQa8RB2P5cPSAkN7V8i6z3C+62EqhJXBm3DkXSVNDFV19GXB6OYR2Gg35LKT9q0RZqiAA2Y1W01aQhVUxxVjHmROFExMgWHusr7Dsv2ByDQJ9zRUWUHJmUKuXPtdbhTqnCWJRUVMOvL8y5i1tq+yIgCgrF/6DAriaQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kq1k7BJDp5D0bjzX7ujoJGoGXUv/S2mszNuZ7OJLh3g=;
 b=v7rIXsuFw11W5zWfdVgYk58YVc0zfRrQzfoH1uRwAfIOk8qZF4O8Qpc1FXckZEH6hSkRRv8lEDltNIrld1wDobnnKIUhWv4ib4c3i0eymctbd4kmnNlQ8Oktwp05VIsTMyLiMS1cRCHZ2AbNDmi2OvS3HS+7FsBTOChcRdbdsAWNtc2FIJvJ9ht3vcp6K2xPEAi847/hxBGGuHQheipeYJlMCbP44EQy74KiKcf56GsBqFDstp1kd2rAICf3rE2yFf7SjREc+ElKB5gawneRbZLd7K9Jqo3OKlChWaYj5kIViJoUwq8UwFTjifvP975aEzLWX2+DG1FhbeXs3DWoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kq1k7BJDp5D0bjzX7ujoJGoGXUv/S2mszNuZ7OJLh3g=;
 b=bPzibjQERPz7CFFEQaugKnvmkkafcYh+xHlQuXZobBIiJCW1x2Xe/g603+sU8C7ElYdoltSbiQmzWiQp/zbyMbNWxfUG1OSYbMpDasiUX5Y9XSanXF1znEbuaV5tTcwDaLXGuBjxLnBo+pVumx778NdFLmJ3rTufh4K6gPJc/JqAQxXVVXhbyE14BLPoyE8uIptJFn9RkjiE7jYKzENZE55n5VWWMgtyRdinI/QzPGbFJ3u0mNnCo2HO0/WgkUNPJJI3eV31x9QVpYdG8DgxMkZMH86AJPRM9nvSK2CXer51waUjhhZryfCBno/3Fnbx0cyJPJHuixdoGRqvnvViZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 31 Aug
 2026 01:09:50 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:09:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:09:47 +0900
Message-Id: <DL2Q86NR6TJU.3ULD0NQAQ9HF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/15] gpu: nova-core: match GSP RPC replies by
 sequence, not just function
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-14-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-14-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::17) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f90963-14b6-4539-c06e-08df06fc8e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|11063799006|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5rNMuBJ9iwDdY9NNfsufPcQtDT/ijN58km1ruVnPO/k4RQOctV+5o/L10ucBWOKBNR+kw0lZLY+/vXRMcklMe+JNiGLPF54dpNWabzUA1Tevlgz8Td42IjuYYzcwzlWwaFw7WbvSlBGnAUmPMtlQ+rqCmqx4WjpqhqeaCYZpH2r29RWg0E7ZvMosc6CDPvvmTj61D7hYP1REKJ43/yQV4g33q4ecdVZPo9BIJoiLGBacqgOYCYqf0uhI8GThQc+/sErH6rVYOAlj6DXKip+MJJYI4s3JKx+S9EjpweGCi85BFgkTPk7SNkWmZ/Hdj7koaHkb/wgVAJF1mZPztlklcK0L5Zx5SRc/xD0OYns3RD0OLSs1mFw3ImRlXPOubF+bn5KPlaZFnV192tbsIh/dsItlMsmZ2ipYyfBVckPQC81hZTLSPtGga8DHWZWXSr++3j+IAroVpGw6VrZA09rDCCdCBzCT9uPeh9DNCJ8Hk54BV77oZ89uUuqNqeauyIADtFou0+IQZqfm9T2o/tJP++LVbtE5OLNKFgzEx6kNxNidJM+mmuXS3ACFBeOnLweZla2hfccHdo+abNpwrhS7wJAgVwplOdrYfa7lv12oFUVmoFTOgbV6jnx0EEs7zT3s6xUklJinwVUxCsw5ZvmhFcziHL3qzKt8s41xq107lG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjdrNFdUMkJ0V01UZ3hpczF6VEhmSzFHd0hlNGtiNTI0cUVGb1h3bU4yaG1h?=
 =?utf-8?B?THEzVkx4WFFZcnpoNDJzWVVFL3VWWHk3M05icnFHUmx1ck02eHVERVpIV1J1?=
 =?utf-8?B?VUJ3bE5vWUNueHpDMjZySWJBbjcyV3p2dnpldkhUWnBpeDcxQWp0WWZMZTkz?=
 =?utf-8?B?aE94MkxJZE0zeXR3N2w3MHBvTmRmN1F3ekVERXFvY1dWRG82Ylg5cHVLaURt?=
 =?utf-8?B?S0JIRUdpa2ljdWVUdnFYa3ludVZkcVdXTm1KN0tsUGxFekUzd2hnanBXMDhR?=
 =?utf-8?B?YmpPWVpDeEpxanBmSG40OWJRQ3ZJekVxQldXeVJ1THlhWTl5VUNQcGR4WjBh?=
 =?utf-8?B?M3dHTnRLcW5sckxuNkxpMDFUTVQzUVR5TW5NOEtNWHRBQ3pKeG5kTEJ1c2pD?=
 =?utf-8?B?dEtEK2tXMncwOU9RSTBGY0pYUXIvSnRHd2dKOWpRWnNlM1ViMmlvZ0RNNFp1?=
 =?utf-8?B?VEFHOS9ZQ2VYMUtoem95bTg4MnJldDdqS09QL2xJKzFiZFNtcjVkdktReEh2?=
 =?utf-8?B?b1MzUng0amg5TDBxOHRTeTlDRHc3bEpZOS8ybUxONVk1cGJoOXk5Q1ZzekdQ?=
 =?utf-8?B?TE1Jd1pST1N0dFdPSlltNEdRWmxpQmlKZUZmM2l1MGZ4eURUVTM3NndFbDVJ?=
 =?utf-8?B?dG55Qi9UU0pFUXJFWUVoNDlxaG1KU0g4ek9vaDA1OWtLZ0pjZWp5bWRCMk5s?=
 =?utf-8?B?QXZ3OWFJcEJtT1JnaEZId2JnNWxiUGZhcnl2Q1RwQ1EybkhTeUxpY2hGU1VW?=
 =?utf-8?B?KzhxMkhsUHJZZ3R0djFzUVJNNjF2ZjFWL0NrL2gvaGRLWWZaZkc1Z2U4cVNp?=
 =?utf-8?B?OHRTZWtBUU9lc0Q5bmU2V2c2cXIwNSsxMkNKbXl2VElKSHorWC9nbHVHYVdn?=
 =?utf-8?B?TEs4VDNBblQ0OHVSdWZ0QnpRclF3ME5WMEMrcGU1Ny9PeHZNcS9oV0Y3MmFj?=
 =?utf-8?B?TnoydXIwaStTNDJMVkIzRkRzNmUvbXJPdHFURWQ5VjdHRDVJOU1kaitOcHF0?=
 =?utf-8?B?T2hHdElVRm5vS1Qwc2VSUERjc2Z6anVUZ2wwOEZ3MjNTRnZoVXZ4amc4VGdu?=
 =?utf-8?B?MkhoUVUrVE9LRjJtS1Q5aHZXVXAvK05LV04rQkpsRWlWenVHTG0zMU02MzBu?=
 =?utf-8?B?eHdkQUYxQzJLSFNpY2Y0d1RRU2VHSGZzcGJEZTZEUTlpTDR1ZXJSY2hGc3dz?=
 =?utf-8?B?WWIzMThyUlYwcFEvanJZSXpZaERVQW1wOEhrSHpjREpTK2dlbk41TWFMc1R4?=
 =?utf-8?B?QWFjOCtCYTFoaEpDQ2RMYWxDTC85THdBanR2SWRyYlRxUkFESGFUV3I2c0dl?=
 =?utf-8?B?RmtidDZmeU5vUHBZMnFyRkZjSlE3cUhHeUwzV2NibEV6VFdrVTFHQlBBV0hv?=
 =?utf-8?B?QWtidkMxVi92MUVmQnA4byt6LzZDT0NJMzUvWXJ4OXVKT1VXNlVCQytWb0c0?=
 =?utf-8?B?ckhSdkh2T2ljMHVsWStSRDN0ZU5EZ05WVHVHRUhsSzV5UU5PMkdoNFY3Wm1E?=
 =?utf-8?B?TnNrS1A0cWNSOEZqaEVKWHY3VlVZSHBPY0ZKVnVqelhHcmNsd0dMRXZRWEg1?=
 =?utf-8?B?blMyWGRndjM1YVBGQ01YRFEvOUkrV2JDMTNHMW5UR3pBdyt5QUdScVBGVVlx?=
 =?utf-8?B?YU4rWmEyVWM4RzZWc29sY0lCUTVCSmNCS3dnZDFnbFhYMkFjbVgyRUF6elpp?=
 =?utf-8?B?eDhRM2E1eEE2UEtQNnAySU1EZkV6ckxVZ29KdTVuTTVPdHgyTjZId3hUaEJS?=
 =?utf-8?B?ZEhyTjhsajZSbkt1Nm96cS9OblNBcWNKMzMyQW5zaUNseHZINXJLQmpCYlRj?=
 =?utf-8?B?NUl1NFMvQSs3TjNmcVlkM0FpbGJXUENsSGhHOHpCTWZuWCtTZFZULzkwcWVF?=
 =?utf-8?B?NDBEdUIyU05vQ2w4UjY1ekUwcnpUTmdId0tjSDdUdnREMnlYVE5kRW5Fd0ha?=
 =?utf-8?B?UFBMTnoxdHlZWGFVbWFXQW93N1FHZERCd0JPNWluTjBQZ2JkTjlOQTE5SW5M?=
 =?utf-8?B?dWFuS0ZYVko2ZThBN3ZFdW1kYks1cXFWbm05VDJIUjA0ci9CZ0ROY0hWUVFF?=
 =?utf-8?B?M0tMbVBienN4TmZwVzV2MnUwQXZ4eldlTFUwRUQzS1pzVFMwRmpxcWV5TXhO?=
 =?utf-8?B?ZEJOdzRBa0JXZStEbTNEY2NvMUFnVFZjN0UwZXZMTFJVZm43eHZKUWFIVnlo?=
 =?utf-8?B?ZFBpQkpGVGtNbGVOb2hSNGdISXpyaWtodVlaaXFod2NuNkpwQ0lZTGFkR2Y4?=
 =?utf-8?B?UmRXS3hUZTdsK1hQa0FBUURwVy8yYWtmYkpsSEZtbk5HenJYSW0zeXdQV1E1?=
 =?utf-8?B?T1Z2cmhBSmdjUjJORnl1UStRUjA2RjBENUtCa3VDQjFwSVpoQ05jMnU3MURq?=
 =?utf-8?Q?x2LQtNvkdPOvNUJOxuqqH6FCoyRzjJ4XW9O1fGLkEFB/O?=
X-MS-Exchange-AntiSpam-MessageData-1: Yn7KuXqATJiWCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f90963-14b6-4539-c06e-08df06fc8e38
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:09:49.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCksHtOCmgAFHOk2XUmBHtWhqpGS/B1OH2i/3CwBd6XjHJYWDaC02IachB+iAjfKVd5f8TIkF3OIDPrwoUXPTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> The GSP replies to a command by echoing that command's function code and
> its RPC sequence number.
>
> nova-core matched replies on the function alone and never set the
> sequence, so a reply for a command that had already timed out could
> satisfy a later command using the same function.
>
> Give the RPC sequence its own counter, separate from the per-element
> transport sequence, set it on every command, and require both the
> function and the sequence to match before accepting a reply. A message
> with the expected function but a stale sequence is logged and dropped,
> not mistaken for the reply or dispatched as an event. A caller awaiting
> an unsolicited event still matches on the function alone.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

So I am particularly looking at patches 8-11 at first, because it looks
like they can be merged ahead of the rest and are useful on their own,
but I am hitting an error with this one when unloading the driver:

modprobe -r nova-core
[ 3333.123171] nova-core 0000:08:00.0: GSP RPC: send: seq# 3, function=3DUn=
loadingGuestDriver, length=3D0x58
[ 3333.148123] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=
=3DOk(GspPostNoCat), length=3D0x50c
[ 3333.169449] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=
=3DOk(UcodeLibOsPrint), length=3D0x78
[ 3333.323550] nova-core 0000:08:00.0: GSP RPC: receive: seq# 0, function=
=3DOk(UnloadingGuestDriver), length=3D0x50
[ 3333.323551] nova-core 0000:08:00.0: GSP RPC: dropping stale UnloadingGue=
stDriver reply (seq 0, awaiting Some(3))
[ 3338.124152] nova-core 0000:08:00.0: GSP shutdown failed: ETIMEDOUT
[ 3338.161317] nova-core 0000:08:00.0: failed to unload GSP: ETIMEDOUT

It looks like the GSP sends the UnloadingGuestDriver response with a
sequence of 0... From what I can gather from OpenRM, 570.144 doesn't
match the sequence number, only the function. Maybe this needs to be
part of the r000 series instead, if that behavior is only expected
there?
