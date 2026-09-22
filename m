Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E654B1C6
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083421; cv=fail; b=KFRITMz0HRR/7sca2EOulUspdriW3XDjGjO85xjXyWBQysDYfIsptXVQUodRxjXdkn6SHL0Hv+lCKRQ68UpOXQ5N5FHowPbH+mjbz7bnuS/R5ls1+JEG0+P3rDo91PEEkptGf04EGgjfDws/QJn0PiFRFavYck24y1ua6gK3r2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083421; c=relaxed/simple;
	bh=Xc2sZ16ugqQwTMV6JsIhEvcV9O6DDe5dLccmDVZEEWs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hQEAsFtXYFc6YCGwnn4SISlFu/HgmcaiIqVdFjst3+wT7OgcjVdVsHSSqolVkl6NwSXIxQeCT9yQpvsg3Q2YldFRmeThXeSy72U01oaAukC4/QTKVkXhsnEIiUs9ndiVzAv8Whh08fHTE7Xl+RgXGk2hzYkCEAyFszeYji7pZaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sAB9FDXG; arc=fail smtp.client-ip=52.101.53.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sAB9FDXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvwNggu2C7Ca/yHzKtwyO1SXlmb/RlDFDT+SvIi6MEoWKPTDHEpCtGyc+bA/7FleobTo4nBM5PIo5sx41XQ6uUVT5OR2m1uEUYb/GuXhmCqcj62RCaAkqbSMHSxCcaqlao8d2HVNifXh0Me2eBtgklWH7bI600w8IZHD+Jx4bmrwZy0Pv6ch1OM9E/4+tdOzHmO4Cnu5sDoPOj1Dt67uReb2UeDtiUSsbgj7cimlO48NBpPdXKwI3JwjqimRPUYqKmXfIEtBopS0vMAaBWNY36uwJEYYQI7EViGTk1h2hp4hwZSzB3Ge0KCjfQUwVQJ2CldPc+0MbH/sGW2e8xR4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc2sZ16ugqQwTMV6JsIhEvcV9O6DDe5dLccmDVZEEWs=;
 b=s5yMj2+H6xg+GOrP4bsXuzJ6Uv1piXa6lKEV9Yw3ydjwa8mGBTDCCqrfsrKvmsMCtfKgTeS/QBNbfzLUDtEoygTmpBLRnHFwAxkj3e4FNrMfaR45KN8oXrpX3k0ZrDtIn0Ufz7BJjrCa+iwQQ0IOR5QIXNZXTVk+hViap7N2x9OxcBd2riK5hTB+w7lOMl5RkhYPU0wDubyl6MCCga3KnfTUowpONMyzWDMsvg8EpO0ie7/YHN6jQ51VU0e8R5V8bFgt/jf3gkOCUohmNXmEkPAUrPxiAWKwyR+e3qv7CO+f7YOQuyibh5Pru7PTkCG4YItRDXo9cw8y1OiWImGvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc2sZ16ugqQwTMV6JsIhEvcV9O6DDe5dLccmDVZEEWs=;
 b=sAB9FDXGCaTSLlgMTmKbwx49SzJrxTVBBOtA9UcJ+eFgulc8VWWjb17nytLqdwh+jaOVs3o5PJuklMBI6qSrnWEWFc/YE90wTs10LHnnyvo1wDERi0+UULqT7GY5BsWENLo2saubAv9GcpYLViP/6srb6NqSqLXNTaXGYmR2UdAkPfLMpuFIt4F5rK6h3QGv4WmBr5H5ucrmmP6ajc/1oDjtG4+iJqiv54nfPdW7cK2fpkXGB0Q9m766gHOLArhftB335v+clOy3Bu3iWkXj09OxhpgSlF1Ruis8xKbtT/4Y0t1XrP3lZiB+NmuED7aNSQ569fbDmBEpxsHuMVC21g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 13:23:30 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:23:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:23:27 +0900
Message-Id: <DLLVLWJRODXZ.1WPWHMSMWJLJK@nvidia.com>
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
Subject: Re: [PATCH 1/3] gpu: nova-core: extract radix3 page table into its
 own module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260913195413.742143-1-jhubbard@nvidia.com>
 <20260913195413.742143-2-jhubbard@nvidia.com>
In-Reply-To: <20260913195413.742143-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ca90b5-de5d-4d6f-e323-08df18acb196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vXwa5XNd7uSw9mNVWjVeOiMAGLKV+2ySzwioyHvstVLhJsRlMAtFI+mpBaJzDjXtSLBjMH80laHH6UAjDLD6l2FB7qr8Age5rFXKUmTRoliK5qqODs1yDcCljJD+FKSbskWtPcDweXYCyY4zWfQCRSCg4ACV5j8j4cN+R3tIo9UrRRVYiG0aqnKwxVNdLUwrQoyO1YMbka2eb7gdPdrTsft3I6a6UTMSUAr+8R+Phu0FO6HmZ4VPXmOasJlq1SaVg77R8nxjoivs2JmCt/slmlaNZkBFuVMpYZQDmQbF4mCmCdltGXIma6NsreJks7TdzpmYAwGPjpIzD/qrggfl/aO+v/SpK8pO49BIMeGAX9/qfZAjZn9PLC6kOwYVqo/gH764TsiWpUOSCGwW3MQWgUPC4ss2ppIUuv7yvR8KhqOnhCd+IlEdf3iMR2C8BVpHj6sLKkuc2038ekIZ10ceW/fexsaDWcN194SMcX9s8mgEoBhyKfiDQjXAUYrs4aKZ+Yv3YuVIVpPMUjTKAtRCr+DeRDvlXGZpmu8BUXUQ2uMP3c0KEl92RF++TNtma4qNHPVaR+CkSGWXvAIyi3WVtsxvurGJiaaQCDGaIugNoTe9R2ZyHUrQhBWtHNNcqkWhk3TSA8Zq1Nxbx/G3A3FXvSQ755r6xn7HoO7EG0+tuIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFYzYlBkK1ZYRS9JM0syTW5RSVdqUW5DOHh3MkRWbk5DQTlOVXVld1JrR1Vv?=
 =?utf-8?B?REsvS1oxTHdaT0RhcWJhaEJuWDZhSGQrakN1MVdVdVhzZUdoRE9mdVBRMGZR?=
 =?utf-8?B?WjRRVWdkd3FndjVRWjREUm5jUXY4M1B6VzlaNjM0eHdkV29aVDFsQjZuTW9X?=
 =?utf-8?B?M2duZi84UVJmcUdMQVRNOFJqQ2hFdmt2bVdJandNcEtjcmRTV1FzcExaKy9K?=
 =?utf-8?B?SU0zR2FReGpHL0pzeVZpTjUwWUxQaElBdklqTHpRMlBpTjZsZ2lIc3QzVk94?=
 =?utf-8?B?ZCtOK2xhWVNZdklyY1JIaVQ5ZFdBSXk3SGdOVk16cWhyRGRGOVVoczlIcnc4?=
 =?utf-8?B?K3JZaElEMVQvaXc1TkhNNjBIdWdHVVIzTno3VEw4Qys0VjErcWZabllzbkFN?=
 =?utf-8?B?b2xVeFY2UGJMYng0blZPd0VtbitqSjhYREtwMWlvbDJkRWtjT0dLRm5ERlpu?=
 =?utf-8?B?WlJhS24yWkJzWTM4TGM2ZHppaGc0N1gvRitUZ1hVKzdsNTdUZzZReHNRR2g2?=
 =?utf-8?B?bEFqM01aQ2o2OGF2Q1hZUEFJc3Z4TWxmZjdvdVZwRDRYQWZmUTlzUzE2OU1q?=
 =?utf-8?B?M3U5ZFlnOTg0c2RoMStERStQVTJZb1cwcm1udks5RmdIclVaa2x4TlJ5ZXZw?=
 =?utf-8?B?RkR5VEtIeEJnV1NKeVBJeE00b3g3QzIxZUQweERCaVNoVXNCWEdFbTZuNzgx?=
 =?utf-8?B?LzhHT3NDNUQvNjBiVHNodmZ6dUZ2MnJVR3ViZStlUjNiWThzTkUwd0dlMjNT?=
 =?utf-8?B?NkhrcmtLbXFSa1FFeEhBNFNPL1h1SGpOK2hDMEhvY2V2T0M4YmNkQVNIblBW?=
 =?utf-8?B?NFJGTnZWc2IrZ3BNbUFTSGt2SGVrU2pUTkRrVXN4bkhtMXlRQVMzcnpkVzcr?=
 =?utf-8?B?VHd3bEd0M3NNSE1iMmdPL0NuQzJCRjlhaEI4Sk5uVE5nckhOWWNDZ3BXVytt?=
 =?utf-8?B?dEs2czRTVXlTOUxmRGhINGZzRFl6VlNscHdFMHBQVFk2Q2FSMjVLMTk0Zkdh?=
 =?utf-8?B?T1RwL2x4VDl4dmEvVDhUUmNHalY1NjlQQ2Jqb01xeEJUMDY0TlZMUVdab3RV?=
 =?utf-8?B?cjNnR0g5RUlmMEcvNkFOQXNYSHB2anVFS1pLZjBHak1oSUV1YmNCclh3a2ZZ?=
 =?utf-8?B?cnRYWFVsVWdEcy9iVEttZnpoTVZpZFloNDNKTG9xQkhsOEticnJMMVNwcjBW?=
 =?utf-8?B?OG1UL3FROVpELzR6L3dNbTBlYkV1bFp1empWSEdnRXR2Y29FOHE5T2NDSGNE?=
 =?utf-8?B?dzE5aGRwZmxUMkpnWERzSU5lemtvVktvRDNvWVVnQitWdW0rV0pQTU1kcm1C?=
 =?utf-8?B?dUg1cGNQR00rRURCdzUzYmhtVVdaZjZWbFdmQXNGRmZ2OThBaGxJZGVITFow?=
 =?utf-8?B?bmkzTnVZUUVxaVcwanpUQ2VOQnoveXJZRFBTNzA4N0RBeHdETzZUY05md01O?=
 =?utf-8?B?dXNBQlVQRzdETXBJZTIxZFRVc3FZMUY2VjVRc3IvMXBPMFhaTDI1SCtGREh2?=
 =?utf-8?B?dGgwU0QrcUgxemtVWEo2WVdWWnRLeWZ2bDBIQkxnN2c0NFBhZWlCSVA2VENw?=
 =?utf-8?B?VG5iRHl3TUVoWUc4N081bVNIbmkxa2RDenNMWFFXZUJQRzJQZUtnS0swOE5i?=
 =?utf-8?B?bTVBdUVwVTl3aEpnTVF3V1J4TEREQmJsa0NwODlmOUd6dm1qcnhUVVZlMzhI?=
 =?utf-8?B?UnRzNitoaEJWVlJ4WFp6OE82MVcxOWRPWGxNL2VDaVhuUnV1YVZOOUxmVTFC?=
 =?utf-8?B?MVR5S0RudUQybnRXdzlsS1JsTm8wYlgvNzAvMVFMdzRKbEt2NXZFM201ckl2?=
 =?utf-8?B?VS9GSVBoYTRRVEtmSlVxU1NMZnFTbC9NNkx5alIwTHZaQWtvZitSTUR0dlM0?=
 =?utf-8?B?dFF1dHdjMEQrcmptNnpVN1prdmhIS0ExZ2hFY1dqZjhsd0hGWWo3T2UzWmhP?=
 =?utf-8?B?N0UvVit6TnJCRmJMN3lpL2N5ZDZYeDlpT3R2aGRkb2ZHMEo2QXFaWXpsTnNw?=
 =?utf-8?B?ZTZraVdjeFpFYXVDRVBYWGJjcHZWdUxaeXV3TXNBTGJ5YVZpTVVTRnErSUtp?=
 =?utf-8?B?Ti9pdGcvakdlZkdneXUwVjVmT1pHcHRFR09jRkhmakdlVWNZN1g4MFkvWU5L?=
 =?utf-8?B?di8yS2hzWE1uWVJRZDVsQlZFOWJodFlsaDdOSkJ0SWZBeWV4Y1F6MWQ0WmxK?=
 =?utf-8?B?L21GVEhPWTlYVzBhbGc5WkZUcFZ5ck44RTg3R0NmaUp0VW1WQlArNmpybXNQ?=
 =?utf-8?B?K1I2UFM4VVZSQWlhZlhaUnVTczFVZXQ3OCtMenFnRGc2RUY4cmozQjJsM2Rq?=
 =?utf-8?B?NnRSWFZ5ZnZ1ZGsyL2JEalVPZTVITXVwUTZJYlMvS2wrN2x0SUQyOXE0RWgz?=
 =?utf-8?Q?tns7PZLB/Dcx9kgq11m/jjONyTTY9hlao4rmo+YWg6lzp?=
X-MS-Exchange-AntiSpam-MessageData-1: lTSBsQhGCIdVuA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ca90b5-de5d-4d6f-e323-08df18acb196
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:23:30.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfxmyX9AN0eetio0phacg8sGGrrTnMQzBsVMRYZDwmexOfG+QFAFGSVZbjIy4AwovB0lT5wMsdpoWCG8vyBr1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341

On Mon Sep 14, 2026 at 4:54 AM JST, John Hubbard wrote:
> In order to boot the GSP, nova-core loads the GSP firmware image into
> system memory, and the GPU copies it into the framebuffer, the GPU's own
> memory. The GPU finds the GSP firmware image's pages via "radix3", a
> three-level page table of 4 KiB pages that the driver builds. Today the
> table exists as fields within the GSP firmware wrapper, which is fine
> because there is only one radix3 consumer.
>
> The upcoming r000 series[1], however, introduces a second radix3 caller:
> the ucodes firmware image. That is because the GSP has been changed, so
> that it automatically fetches the subset of ucodes that it requires,
> thus reducing the size of the GSP image. This is a helpful change for
> the firmware situation overall, but it will require nova-core to load
> and provide ucodes, in much the same way that it was loading and
> providing the GSP firmware image.
>
> Therefore, split out radix3 into its own module.

This patch does a multitude of renames and comment updates as it moves
code around, which makes it difficult to review with `--color-moved`.

`--color-moved` is a really nice git option that applies a different
color to lines that have just moved instead of having changed; on a
patch like this one I expect to see mostly the "this has moved" color,
which allows me to confirm that no undesirable side-effect has taken
place.

But unfortunately the mix of move and changes turns the `--color-moved`
augmented diff into a Christmas tree of moves mixed with code changes,
defeating its purpose.

So in order to be able to review properly I had to split this patch into
the mechanical move, plus two patches on top to handle the rename and
comments updates.

This makes the first patch's mechanical move easy to confirm using
`--color-moved`, and as a bonus the other changes also become easily
reviewable on top of that.

Anyway, all this to say that this series is merged with a couple of
extra commits (and some removed comments kept as they were useful imho).
Please check the end result of this patch with `--color-moved` to see
what I mean, and let's make sure to keep code moves and changes
separated from now on to make reviews easier.
