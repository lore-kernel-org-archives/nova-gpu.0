Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A33C2790
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388805; cv=fail; b=QSXoPW2RCxDhZx/hQtCvJTMW6KZ1xHOksFJdKlcmc8yMURqVdKv1msfB1euk3FqIwFWnH5SySih1ytONDaRrlBO8eywz13zRR+eW5Go0qrUPZtmuo6rY5wA4HRonVbnIOQ0zDZOJ2mAzoDE/jcF3zR4SE6zz04HrpTk5VNcHAxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388805; c=relaxed/simple;
	bh=MhbGxUS2dVda3F1WpJaVKZePAOPXLNHzCeWzwJ2nzms=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JsNx3gKHOmaNa127Iijpm20uvJ9TAz7negg8Dwb7JZhwx+Ep7njnNoNkkgy+oaXjhiOHfQtTj0KA8lJo+rFF8ivvJk0XOC5r7VLrPgroE+Nl5sLi2dP0VsJRxhJBXovST3aiqIunoqhlvklN9FhuxCavhUfmCD6UgPpEUntDoNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=okl5tZH3; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="okl5tZH3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miI07ZvmuRgS/JdKbwot1/Pb6Ky1RZaSM0b5tAcahVPXki4zCaIiTvmaRLAqG4zrWz7tmS8TanzwWmixFk11g9iyWhy1nOnCY1cWe3UKkQlquw+7HhlerDKYyfeD4tTxtYCYWPSmO0GxulFaMYGJLXQzkvkWuxomLOO+/lPUMjai/JC4d61IgOU6Ny1rXww2fhS0iP7bZ8KIm/Ald95F4gLuv1Hyk69J05aBh/Z6kqWHsJ3nF3HF5Z9vXnPWFBWUfNobCbRDJX3tWAfFlqg1ghMayMwurhIRFNd230MKRdEWkguT7Vf513z4ccjCokJ8APpjXJU6Er3YgKI2femAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhbGxUS2dVda3F1WpJaVKZePAOPXLNHzCeWzwJ2nzms=;
 b=YvFL2BSTlYsxWxd11eAwKKzeVu0RPBeEsxCVerC1FHyXG5sBpCkvU+JipkThQLDBLsh2lH5rbVYZHV4Fq2XzmpwzxJlbijuOd3nYT0GJ/YImg+CCPGawUarrgdRndMWqWAYZDFxKUG/vUqeAOQvhxqC2h4cuLswMg6nobUuZtooSSY8W4IAGUsxJirUPoKh40uF7pgIhYto5loW9xqrU5RwrPWboJzTRJksVMTmh752tQz8NWsxDmgXZYv330xoTgiAMnONu7xRHXZn1YUKm1cekvtMthlhPxD1TK3QLaxEcdyo6Qr1cr0i74VQUK4YAfidueEWI42YxcaD+zZZroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhbGxUS2dVda3F1WpJaVKZePAOPXLNHzCeWzwJ2nzms=;
 b=okl5tZH3m7q/Hkhy59iMRUVSKLfmOGFWAD+Zroa296DVGHSr5u/AaN2sZyKp0WSwi1elpzdhcLwJfAc+/8ILgaQYrUXlHtBucN2I9qCdtGrHtugug+886rpZZ/naIJelTWjxlbaL7D4GulSgZ2IIzLbOtAeJ7Q0+KvkgqnjfxIgtUjERCLInBlxnPZhVBeki8qSdaPmCn48sVneP1NSmYWYafXHFLSlEXMLnCUXAf747iu+et/Ul7ngiQiitmNabAbHfg9SK5dQQ/B30odmvLoQTRZ735Iq3hKKUokZ3R87BNj35N+KLJ3vD2dBFVXQ/tVMvxfQHwXhV+o0v5xo9CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:26:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:26:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:26:35 +0900
Message-Id: <DIYF5LJZQ650.DFK5ZRCM8DRV@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-7-jhubbard@nvidia.com>
 <DIYDKL3XRQK3.37X8K75SZ0DKE@nvidia.com>
In-Reply-To: <DIYDKL3XRQK3.37X8K75SZ0DKE@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:604:24::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: c007558f-fd1b-4323-a26d-08dec080ab68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6KhAqznQrGR58pbj2f3VZhrz/NY709wKd/0DR5t3LyXeCGUQ/lQXxUwnUBgAO/eWwQEhNCRb6sKHA/fungzh29aGFjZY/JR53olU1VCfj4jWMTJT1S7yjSf1E20CL9huXkIkXBuu2gBwkncjFLdJ5vD9iKC6VF1tk7DguOKZACSq25Tm2+0IOJKD9COumtIhwytIG1xjH/PsuR5Q4rD/VcAVTDvSoROFL+g2omtNnsGzfLpVvG8mxCXRWjLe1jLLuT0obU6YceziciVp6+jMjQXh/8XAz9APs0Qio/iwtKKLxd47FXNrS8r4wTmhRKcv3gkwRM36kKffZGladEpFeWXDYEqUu+LSPFyYStym/LQ9R1IZqUqqHygGzta+6oVBZ1BWY/AuNQCe/GZr4lgWXl/fCD4OwSTTWnWvW1AGBSbD3xdrIyqkBR5bqog9kEKrNBlnBPkaONtXDaxoz10+oh3lpBOxlkiZs4vrCw1f//mVvRB6aiYOWVxEp2LALS5y/jNhLThPRk99dsIDuP3znGtAwIB8srXxUNgLOD3S9Njn+P3I6WfLG2vEu5us7o/Z9rFiAWktwmroiffuesbXCButqPrYjQeW0gPWz+XjFlZQ56peKI9D8u4IOFbjhvLw2jf47+hE490vabKi9NZO6k5c3ngtZxpUkuGj8ZUmpvXtVAWGoS5ttSiK7FXG1TXs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDE1UHlVUFRVVW8wdEhnaDlZOFR5OVNVaTZLNlIzMEtpT3Y1VnpRbFMwQ044?=
 =?utf-8?B?S2Z0WnFwVGU0MElsTGpQN1JWUVI0d0p2REtqMC80RENheFg0aktRNHNKTHFt?=
 =?utf-8?B?UGhtUGdRVDc3N05QMEN5L0svYS9ZRUlDS0graGNnSmFKU3JwTDdpTkpGeFB4?=
 =?utf-8?B?b210RGtOUlo2ZEJ2MGhkU0RoK3FDNnI0OUxRcGZtRlAyazFiU1d2YUNJWWht?=
 =?utf-8?B?SXhsWncxM1lsa2h0NTdwSXVDRGRremoyNlN5S0svNXRZM2dIdW43RTErbHlX?=
 =?utf-8?B?WTZrN3FCaXk4WU5CYmdjVGp6dlcxVTk5ei84YklJcTd4U042SHlnWXZOT0FM?=
 =?utf-8?B?UUxzMWFvVDBobGFFTDFnbUZEQ1Mwckx3Z2VvRGM3Y2lIT2FkNGYyazR1VG5P?=
 =?utf-8?B?amxEUEtGdnRmbzdZcHV4NWIvUU5tV21vTEE1L1JmZStpRGtLWnR2RlFPQTQr?=
 =?utf-8?B?cllGbUJyRXdSYzN2K24zc2krVlJYUUUvVFdDRGFJWW5KVGx2V0VseE5veUpO?=
 =?utf-8?B?NkNxcGl4OU5PdjJrNlJJYUJoY2kxK2xudndaeStYVm1tZ3pnU3NlalNZNmlD?=
 =?utf-8?B?ak1BQzBFMXNWdWZBazI4TlloU3psMGQvN3lJRmdwSmRBVHp5bUh1Zko2RCtS?=
 =?utf-8?B?bUVOcncybWhMSGdjOXl5NTV2YkUxaTVpUHROcmlrOEZ3ek8wMWt2c1YveWwv?=
 =?utf-8?B?amZZU1VoYzJVQU1hU1J6Z3VrWTladWd1M0lWYUFYTFFtVHJvQVRzemFIRkhG?=
 =?utf-8?B?MFNVM0YvWTQ4NmVxNlQzTlgyR0ZIV0dWRDBFVVZkdEpVdElWZzlGK21XOUpY?=
 =?utf-8?B?ODJodFJ3U0VHYTFiU3dZelR5cjdDOUpwLzBHOE5iY1ptY09mUW5hMSsvaFhY?=
 =?utf-8?B?SXJLRjhNc3NXMDFpZnA3eDdLN1VMTjNNMTVrMmFKR2lYa2lScDlqeTRweFhs?=
 =?utf-8?B?R3ZaVDRuUWNBVUhFcnp3VGpiNkxieFArc0xJVkRpS3p5VUI0Mit4L1crYXk3?=
 =?utf-8?B?eGdTY0g0NFFETStuMjlyWTFXQ200ckdxeHZtalM3YnhReFkrb0s3WktSTkpq?=
 =?utf-8?B?aE5SNVlld3BXTWlCOVY4bHJmeEp5VFVlSGNJTXNmaEVvWm5FZzhlZVdIeGRM?=
 =?utf-8?B?NExkRWh5aERVdUdsUzRxVWtpbzBrUUJoWW5lbXNvd1R6RGpzV1pwc0E3N200?=
 =?utf-8?B?U3EzRFZVdklHeU9pb0dwSWlOSHAzby9sRUQ2YmQ2bEMwL3h2VENVTEl4am1Y?=
 =?utf-8?B?OFdZZlBUQmZGQjlnbDlxQ0xESnU5RFdwL1dtMU4xZk1LVXJVemZzb3JkbUN6?=
 =?utf-8?B?Q3h6U1pHTktXVUVYcmd2KzNMYUF3QTRIeUNHQWZaOWlNZzBEZkErckVRVkJO?=
 =?utf-8?B?eGQwa244bDBxNFBhSEp4ZU51UlI0RTFYUS9DenNRMWZWV0xla3lLYWNSYXk3?=
 =?utf-8?B?dkg3dVMwbmcyN0gwK1hSRkN5VzZvR25sOERRM0hmWWFQV1E1RXA5cy9wRTVN?=
 =?utf-8?B?QXFsNFhPZW9KdWhXRGZxd2ZSNE14U21xTWZDMzRZNWFiRmNPUGpMOVJRNDhK?=
 =?utf-8?B?cHJ0RHAvcEh2RytKTWphQjh5SXJ5Ui9PSkdtRkZ1VXJpTmlHT0E3a2FPMysr?=
 =?utf-8?B?STFQZDFJdkNTZ2N3cHpDMXcwRnJkUWxEL2htMGowZ3F1VXVNclYxdTdESFlm?=
 =?utf-8?B?Q2VVVEI2azRNckhjOSttQnE5NVZVY09La2dGS2NXcTZJZ1U3ZVNYeisxWktL?=
 =?utf-8?B?NTN2Qkc5R2Z5dXhVZExlcmJzV1RGamw3RkNFWkg4a2dnYTQxTWtObmo2YlhI?=
 =?utf-8?B?THB6dDNsOHZhRDVJb2dTcTZiUmcrSzJWL01FYkdUSFM0cHBINzBXUFBLNnVp?=
 =?utf-8?B?VWNxMFRkOU00NWtIYnVsdEZoSnZLdGlZZXhFYWlVR2labk5oeWMxRUVPems2?=
 =?utf-8?B?WmdocDltVzgzaHlHSDhzeU13WlNBNEcxR0Z3TXRzU1RCWlBWa1NmWWVDdCts?=
 =?utf-8?B?dDJhWE9WeGdacjRFOUlTaUFIeUdxRlg1OFUxcGt4S0FxbWdJRUZPUHZ1Q0ti?=
 =?utf-8?B?dm9YWUFjcTlQRkhGbHBjL2tOeElBYVh0aVl1YjQrdHlaYU9jTXdYR1djc0xz?=
 =?utf-8?B?enRrSVVuR0J0b2ZwUDNPZDVvQURRV0t2c3BuY0I2cDRtYi91cW0vOW5zck5L?=
 =?utf-8?B?dHAvV2huRkxRWnJQM25heWZhVG8zdHo5UmJtVXFRb0MzZWJ2VGpHN1EydjBO?=
 =?utf-8?B?NmNOQmI1UzA2OUtvSHM1dmdBQTU0STM5by9ydTdXMHBKbU1mVW9wWVB4ZTJm?=
 =?utf-8?B?d3laSXo4U29ObGozVEtmSVZrNHRUUmQvb3pnalFFUlU1bGhMMmhmbTVzTGgv?=
 =?utf-8?Q?1hJwC8YpJ2ZpHb98ADJ9q5BPSoeumQ+ycOFfVht1oeetw?=
X-MS-Exchange-AntiSpam-MessageData-1: PxCKqqjj3FpBHQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c007558f-fd1b-4323-a26d-08dec080ab68
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:26:39.8820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTgsJXigTEHnpwB7TFMsCkub4UYbJ3Qu6Ym/pSTfkHva0m5gUTxOTnAqDVTRDH3Khx5iRzINswftWCx9HTf/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

On Tue Jun 2, 2026 at 4:12 PM JST, Eliot Courtney wrote:
> On Tue Jun 2, 2026 at 12:20 PM JST, John Hubbard wrote:
>> Blackwell GPUs moved the sysmem flush page registers away from the
>> Ampere/Ada location. GB10x routes the flush through a pair of HSHUB0
>> register sets (primary and egress) that must both be programmed to
>> the same address. GB20x routes it through FBHUB0.
>>
>> Define these registers relative to their HSHUB0 and FBHUB0 bases, as
>> Open RM does, and implement the flush paths in the GB10x and GB20x
>> framebuffer HALs.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>
> This patch looks correct so:
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>
> But it only updates the sysmem flush stuff for Blackwell. It looks like
> Hopper also uses different registers, so I think we should update it
> too (separate patch seems ok to me).

Indeed, OpenRM agrees with you. Hopper support seems to be rather
trivial (just 2 different registers to use IIUC).
