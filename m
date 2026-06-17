Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B942D7BF
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 03:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665796; cv=fail; b=WlN8VRTA+62mj5aILxIc+sdYkQAzlIyAg71VzcknuneoCh6VqdLixROUDqUcvMZKwfUexSivW5XDDeVD4l6DPVBSfhDdjI6slme1/ls2LKi3fKg4VM+zS4o76isrTUSu+4g0WIH2L54vDSBzadRcrmYQ1A2B9YA8QbnfhJKvlog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665796; c=relaxed/simple;
	bh=spqRUdVeXBYtSASMGdT6mrqiLmkotw6PQlPayScUJck=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=XtV4bGFDjrRkB1xOXNSe8foVrYxIt4A12C2rY9I1J5zxAuuCRF5cw91/Unvv9d0MvMoBqGmIQymsW6ZE8ZaWXLxoSzH0+EO1YoHFyi/nX36+vqw2b0lxGx9Qp7HNnUv/jcCcJGo+srRyYyWTyuLJZMKxur7TADzUpzDF/RVOpqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bjCwNyi4; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bjCwNyi4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naq7TjbBf//UbJGtvkjAP2cJsPThY2mlwvr1iHk05mwczDkgFMVm/HNRk6otsM0ath797UZsYdcK9JG2+FvvndkLM6irfk5aldBzDqhcLf0K7WKLdIEVyST/SciqAHupcsUugjMNXCtU+T9/WI2etaih+O62USLqN9jqH8+ahXY62Bf19EtnlBl8cAnsDVIhJVJSYwyqvz2+3tB2S3j7cwL1G55dWDTBJeArdL70GWzpk1idlpw/xvMSlQdkuR0l7NpyS7YbtNXLu2SkrzVmgHRMukmeMTn6CZqDCibKJ1A67nsfvarf8MQYaA4Jplx8lbH4uqrg3Wt1ie9YJAO8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRkIxAoTq5g+8AiyZHTFsOjpP5MLKebtF0FG/398DCE=;
 b=c6v5TPS33gx3VK1Zr5PMlnfPcQYd1LjGCKqnXH2WEh8engNIzcrHmdfPEYzSgkHmD5Zo5M6UoycfXW43p8uoZ9dcoL5fLMhuLDboqU4Fc0+dGkIAc9kmiW1ji5w+hyQyXo+sRKeWGxSEGejiXzKVyxiYrO8n1B+2dogJM77UTqia3lVW0QbvPLaI9eXVzOT1LzxLveMsrjZ3FN8SatbjXRSnGE/7zy931w6LvxooQ8lIe+gh73gl9swv7ZWKf3N2kj8nXAb/w1rSnb4oHwlwmx1+sqAo/wL0iaPkco8V2mLlmJSzECru/cmPalEzgn3QenBm5CVFn5bN/kOz0gJK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRkIxAoTq5g+8AiyZHTFsOjpP5MLKebtF0FG/398DCE=;
 b=bjCwNyi4K3ThY2E27rzC/wQaT3gDx/K6g+4iczx4UdWiYQee8tAdjgttyWunKxrnXlTrWcnInyVwiHVLnqmKVRVGBRJgF4h7Hvkf9zlESQFKanQ4nIA3QFTLP84/fk4TxLMvh9cehU3HtD8CE5iVA1pXvdH0vZt3hqc7gEgTy7PocN+qQqbim1H+5HidNaBNzlt2Zxzxcc1qYagIOffMv0mHDw9pRGfoN5hDNGm5abLEfafo41qURKVY+jOa7rTqCcbkVRx6pBTKGEHQ2c5dQL3k/jPzUagZzdELJNtUldARXdIpRrdvArz7iDg5qHXzUZ4mJGOyK7xmUma/PLs3eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Wed, 17 Jun
 2026 03:09:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 03:09:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 12:09:46 +0900
Message-Id: <DJAZT6ZNLZYZ.OJE0UIR4OOBQ@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: reserve a larger GSP WPR2 heap when
 vGPU is enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-10-zhiw@nvidia.com>
 <DJAJGC4LLOK3.YAX75103O00O@nvidia.com>
In-Reply-To: <DJAJGC4LLOK3.YAX75103O00O@nvidia.com>
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f9b939-3394-47fc-fba9-08decc1de4e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|10070799003|1800799024|6133799003|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xx795ATNMenZr2AGOuyFDkBZgc6oAP40p3vC3LsTwLgvu2VRW0W21idbIWStGyy/482/XitH6RaBFAy1LSxe0BFwxAwZaTMgXdFsjqIVFEZnNnuDzfeyfjhCj4mJayZxUmIyNfu7ftHZkZbQQHCWzXLPiulGyJ0jWNrrknaRPrxiIbsdEbLURynjnZCDASgUWRqv4Jtkni4sCB4ZAjgSIunRao/g4tOwJZ6ADgFKydf8xNJiuxMMpZOpkChJ4CC7yG9vY/uc0/m+C4tsvnjZwXb53Tf35p0U+7ZbafYqKpMYqzOSOV367KDvT0kVzZFjfIRjh3s/D+2NnYdA/lETPv0jjwC9AYpWptC6UjJgQA753VUWEDtGgbsZOp7nur+ws1ZCOuVvSNcbL0LpPZ7y5wUldNIpzQqOIjMV6dLdXdOzDAmv2M0LmBdT+Z3F1+EspZlgufACc7oFRBNVziKsSXTBlmsYrDgMWyRRRbqJm0qoRacbFa+yyZwBvliJxgDMFUW8/X6j7FpVhNJP4+px6CJmkwjKXNqOGtbAVntxr7NyMK5pGCVEaJax1hosYsBVtNGH2AoiaCR8xj49GhwhawHJkyhcvsiDxz31++9jJJuZO3/GKGhI/xD3P6SCbnt0Yx8hjhmVNjjgJZEOIqcGjTNhdpEIgt0rBBfqXhi3jg4oP7T1QVHuaFeM6VR8eNug
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(10070799003)(1800799024)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTAvTmpjdldiU3Rxd0Z6MWY2L1ZjKzZFNGEweE5TVW9Fd0tkeXRjL1ptZWw3?=
 =?utf-8?B?MXNmamZiRERNQ3EvaHUybStGZlgrVEUxZGtVRWJwMHBucEZjczlnWENhbHps?=
 =?utf-8?B?clRwYkVjSDVyejR4N2lkM28vRmZaSldsVExBTXpPcjhZejBoQ0MzaEVLWm1l?=
 =?utf-8?B?Ri8vdWZ3SnVuMkZmYjRlZzhtM1FmSEVEVU8xcW0vMm9VOGd5MnhWTjZpR20y?=
 =?utf-8?B?QWhWakVpZEVjZDBpeUxwV2tDNnVOekFBTEdqWGVSTWZXc1NsVXhjaHRSakZh?=
 =?utf-8?B?WGZkcEdGVU1ldFlxRTE4cG9tSXY5K0pTVjY0aE5hSzhSckxxaEhKcGxSUU80?=
 =?utf-8?B?MHhVNVE4T3BQTVJ5K3RaQkhqakhoSjc2N0hlbFhhdmgxWFdGS2NhS2dtZm5Z?=
 =?utf-8?B?WlpVK0pINVRTY1ZMUzRMMHBwdE5lajd1VzN2cFdiNFZoNXNDOExsQXJzMFpy?=
 =?utf-8?B?ZE5nSmprL0prYzJJTUw3Y0FEcDVvYytqOVRHNFl2dTRJVzViZHgzODYzaStK?=
 =?utf-8?B?YmR3dHlHM3FYRUpJaGtYdXpIMWhDdG9hOWRsYTZKSlYrQ0RWeVcrVnUxVE1R?=
 =?utf-8?B?QUtCZTdvbXNTK3p2bDU3TjlCYXRYODFmTHJnMjNqUkNlVlJEUTV5dlZBYU5Q?=
 =?utf-8?B?cVdkWmFQRnJXcTFoWnNHWE16QU0wWnZYZlFGdisvczNyVzFKdGtpam85Y056?=
 =?utf-8?B?K0swS3lRSGxEbTBSK0tlRkZveGZZdjVkSU96ZlV5S3QzQXNoVGFMazdIQUZw?=
 =?utf-8?B?b3p1SThjSWNMaXVDR0Z4UGhvd3RvUndtRXl1Q3h1dzU1Wjc4dTdmU3RwdUVq?=
 =?utf-8?B?eTZMMnQ0OTdKV294b2xOMGVzbTg1NHU5SHhjK0U2cU13V2xIRXVSOWFQbnZi?=
 =?utf-8?B?VEJQVWZ0TlVqcG9uMzAyMi9ReEU1Tkd0V2x1WldGV0U0YW9TdzRtbHM1Tk5m?=
 =?utf-8?B?NDFmQmNxamFtMWllaXhpT3A1NnYwTGlIejZJRGpmUCtrcG8xcDB3NnJWY1Ri?=
 =?utf-8?B?bGtrSUZoalMzeGN6eENMRW1uSHMyMXlkVDB5KzBCdTUxMWZ5ZVpKcHp2RUlF?=
 =?utf-8?B?S3hMWVVNbE9YM2xaOE51T3dEU0NMVll6eHRlQlBzT1dnRkozbjQ1Wkg3bEo0?=
 =?utf-8?B?T0sxQjdSUHpoQTRTTnFwTGZtNlpQZjh0N25EbGZpdnExUktRTkU4cHhsbGNy?=
 =?utf-8?B?QVBpT2theW5BaG5sS2JUT2tEMkVSV0lkSjNWMTRuSG5tN2lPdjdHc3hGbk1a?=
 =?utf-8?B?cnp2WTRCd1RYUWE1YnZ5Sm5VSkY3ZHRQMzFmOFc1UCtDYnJNMjZUSXhMb29S?=
 =?utf-8?B?YXRhWU44ZDhScGFjWlhxREdaa3pndHJxalZzbVZ6bHpLTlpSdUxKVTd2b3hL?=
 =?utf-8?B?dHBJT0JDbGpwbWkrYXZodTV2TE50SmFLeW5pTmYvSFFVK0VqaCtKY3k3Q2Zk?=
 =?utf-8?B?QlhTTkRwbXl5b2dUbm1xKzdtd3NlMUtzRmxIdHduTFBjalM4eFJqeTF5VmFS?=
 =?utf-8?B?NFp5UjJ2RlJhUkNKUUNQb3lKeUNjUWRoT3B0UjNNY2RXOXNVZ0VKVmwwUnRI?=
 =?utf-8?B?UjY4YTFzbHprMmFnaGg5KzVBc0dMcGpiSVhhK2V5SnI3ZDdzNzBwTURSMFpS?=
 =?utf-8?B?M2hHZjkycTYzOHQ1cXhENjhzTGpyWEwybWRtZGtUUTJMNFpRSmsvQ2d2QWQ2?=
 =?utf-8?B?OUhpbU9zS2dXKzhMUFN1RnlKbSszSkZraDd2OGRPOTdHYWtFVGV0UWhkdXgz?=
 =?utf-8?B?VXpzd0J6b21OYW9vVEpTODc0THVuSTd3SmxqSnA3aUVaakt0ei9QbXpyWkdq?=
 =?utf-8?B?a01KVElneUZzckF4Y1p6bEpLYThPc2ZLMmhwSkd0ckozalRZMC9HK09Ba2JW?=
 =?utf-8?B?NzZNNHB4NnkrUnlvUFFYc3ZLUlJBbTR2UkdCbXFBWlQ3NXJTU2FZNXQ4bG5L?=
 =?utf-8?B?Mi94UHhKeDhRNlAya2V5OFlkSDZIaVZ4R2JsQmNQVWlWaEY2MWZnOTU0Ukhi?=
 =?utf-8?B?OW1GWDIxNE9yMUlodjl6MGVNU0NaZW5tNW10NVhFcjhhaFN0N2NJN1hhVFpZ?=
 =?utf-8?B?OUdOTWppMDBtdDJjeEdkWjV1aGYxUUN0L0pXRll2QVBGMGJ0TlVVdDczWExq?=
 =?utf-8?B?SkFSb2JCZHpielFqVVo1MnRiWXNybzVNKzI5R0J2citwbDRqNC8vbmxtcW1O?=
 =?utf-8?B?UEViSVY4Y0krWmtFdG1tUmJZbysyUmdXT3Q1MW9yY05tVTBnb01LZ0oxTEow?=
 =?utf-8?B?L1Z5M1BXZUovZjI2NmNzVENmaElsN0hhY0NsSWF1UzlOWHdBZzBSY3ZoNWlj?=
 =?utf-8?B?UnJKZjMwYm5sdFVSY25qeDFqSGhLZllWNTc2dmtBQzYxZFpNazlVYUVlVkNx?=
 =?utf-8?Q?1cFqn8cyKa637lCAG5/nWdr0wKTfznMdQHWZ/gxntAl1S?=
X-MS-Exchange-AntiSpam-MessageData-1: iEG1YV7VAJ0OKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f9b939-3394-47fc-fba9-08decc1de4e2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 03:09:50.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/qCg2rOcmGtuBPFc4/n3x6JuP3KFN4Nf9T6wG1Np86Qj9XGw9esXlUV9dIrohZMHuk68LtjwwZICgbrsTNXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922

On Tue Jun 16, 2026 at 11:20 PM JST, Alexandre Courbot wrote:
> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
>> GSP-RM allocates independent RM sub-heaps for each VF partition inside
>> the WPR2 region. The default baremetal heap sizing is far too small for
>> vGPU instance, causing GSP-RM to hit out-of-memory failures during VF
>> initialization.
>>
>> The host driver must reserve the correct heap size before GSP boots,
>> because the WPR2 region is locked down by the hardware after boot and
>> cannot be resized at runtime. The firmware determines the per-VF carve
>> from the gspFwHeapVfPartitionCount field in the WPR2 metadata header.
>>
>> Select a pre-calibrated static heap size based on total_vfs (174 MB for
>> 1 VM, 581 MB for 2-32 VFs, 1370 MB for 48 VFs) and set
>> vf_partition_count accordingly. Extend FbLayout::new() and
>> GspBootContext to propagate total_vfs through the boot path.
>>
>> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/fb.rs       | 17 +++++++++++++----
>>  drivers/gpu/nova-core/gsp.rs      |  2 +-
>>  drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++++++---
>>  drivers/gpu/nova-core/gsp/fw.rs   | 12 ++++++++++++
>>  4 files changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index 725e428154cf..fb4e6aa9fda4 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -171,7 +171,13 @@ pub(crate) struct FbLayout {
>> =20
>>  impl FbLayout {
>>      /// Computes the FB layout for `chipset` required to run the `gsp_f=
w` GSP firmware.
>> -    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirm=
ware) -> Result<Self> {
>> +    pub(crate) fn new(
>> +        chipset: Chipset,
>> +        bar: Bar0<'_>,
>> +        gsp_fw: &GspFirmware,
>> +        vgpu_requested: bool,
>> +        total_vfs: u16,
>
> `total_vfs` is only meaningful if `vgpu_requested` is true. So these two
> parameters would be better modeled using an `Option`, or maybe even
> better a dedicated parameter type for vGPU settings? Something like
> (please pick a better name if any):
>
>     enum VgpuRequest {
>         Disabled,
>         Requested {
>             total_vfs: u16,
>         }
>     }

If we can implement my suggestion of moving `Fsp` into `Gpu` of patch
7, then this can take a `&VgpuManager` and not require any new type to
express the vGPU state.
