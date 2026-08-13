Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAE43D4E0
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657044; cv=fail; b=YfWPKMVE+p9pO27ymiMBoWssentWQKuydhOq3jyxT9P1M2fRDHZpBZqcl/ckkf0CvoExwrxQSf9gxlov5b3bgfyMzNB5b1AYHXWCRk2tCxuIYPLYGIftcua6wmRXBIjQ5MVmvDdVtYcG4VtBkJkGrpVzpQxRQYl5OQLhjjufQYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657044; c=relaxed/simple;
	bh=KxF8j+CVYUoIpNQicgMCopiqZMoK/K+7+eUVtb/QZXM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GbeD08meFfYdcwdFcbtSmfAQamC9ZbkFY1rqiKoTXPA+a8ZrmZ71t1ulZDQO+g/uNHxRBjBTio2lfnPWFWotYOI0PyvhDUMG72XWDkTs5fW+QYeeKmwHejzM4bcE74t85Mee1vO/kDG26rXWjWpsrLIVll4PZYj83uO781XvTJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cYdHj8hx; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cYdHj8hx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj6ddmuC3acdXuBwHJpUY1AmEzVZpG9/rB9yaWW2eH8hV+Q/pUJAW2bBsBxgGLqOSVBt9OQbUudGUaQgWEbB0xLpT5sydyT7FVJbxYIp8owv759ecU+/KmR+sDwXiZI+xh3dLTO9vXktxNjsaSqsdjxtq3ki6KPL3oucO1s2PkkMSjQChuSh3oTdmxIB11r6kuW4ZwRBGgdGM3Z9ZGhW/4MHkCYxqqzTBrbKGwY65cl3Ut03bNg1WHKU5aQf5y+L7cXRMEHuyk+o2wUcvCH5wEFAuBIrdy2PrJ0dpWE9JP9H/twECgvkI4XtbgocGMY8xaedQHcDEUgdNl9pIyMvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRG4Z3SPUbFZcFPqhv0hqpAojtTsQXKk8gropS4j4o8=;
 b=N5pWocPoWCz21w+b9cZiAO8+V6ccy0nHm0Z0XuIIxHcQYykwUT+GMpVyOt/Ko+4oDBWFTbRpD/E4WvvSmgdpW129mrbNvovTQff2fBrp0FfxnNp7ML47WLiRR0ZZfu+QA9ZlFFCVi+rgFa3t4RS6sFAvwF4Iajyn55L3XmlPP+W7OhNwJjU4rY19bLr/8uKunV+bMFoSKLak0pyVsvKBEbFjgTntWSKoOiZbjieKvu2W1PoHHWH/zce51NfZsDYz0d9AAwU2NGkNTWftmQUnqUN2F5NqSqA1WObPYTePiAO7miFb0RRSjvdv5isdzUBTTgqQdYcQ9DlC0849UiE5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRG4Z3SPUbFZcFPqhv0hqpAojtTsQXKk8gropS4j4o8=;
 b=cYdHj8hxo/w7gaERJUkUoOUEEfTizFaysoWFmIGAk3OQEsrrRYCYWMzjsAy67oyI4kQPm3Mjd23C75e7sXpa5SpTT6S3sGVKmy3a+0FCdQDXmDNpQJEwwlCqTH5MlxU3Y2de9SnmNH6h7aBqrvL+l2/ZlUq57lLHCaWXw2myWzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB7332.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 21:37:16 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:37:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 22:37:15 +0100
Message-Id: <DKO5275TMVI2.1IAOITXHYVH1N@garyguo.net>
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
In-Reply-To: <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba39d79-92a0-4baf-51eb-08def9830b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|7416014|1800799024|366016|22082099003|18002099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZmJ4anzCFo0EOktt+QEV9UDtNpi+Syltd/XHUnQuI/U05fLxnv891NmZpRew31WF/GEUl0dOPu8Nce5fe3ghN5ab/IWfhSH+DkKtj52r0JJP4qW/MiOR742IzbtRLf4oPqTGa1J8/SqxBvJVBkh5suMteQsnHy+PwznoghiBTwHokcMrJ0utkZL0Df5eiltarq3CZ4Y2vvB0ffyzqFpBUYuYbbXu2EFQq/nO+yphzmn+51ZtJJrHBQ90NFCJuUWNnFf+A0OYXUWFiCzJP0rpSVSSS0LgU/BgdQ9ZCMDkeKHPoVWmRKK2UfQrr6OolOQtS8DPpDM27iBPEQSRgWE4VVL+7WJLZik4sp2gu2s8eZUngU67JoWCzjGruc7gPxdj85vuAg03M66NFNjCh/oYTyGk5UtvSQdCsddTs5pmQbrgUlBxkQoUjmZRoo+x5pGVrvKpfPQiR6XnzTyboOSZnfbCxVKrii/n+V2ukFU982PTC7h3jIE59H18xlGqQykrZCUqPBPJyYcC+YyEdBA32TnJx0pDCkFIn7fuILd0SzrAg66q9jY0PzcLAPaedFKCi+hXJe0+usOb0quVDr59qgp2K7FTq0XhyfbxHpW9VtDM1HdlfnfmW6nRBORK+MwTuLaXAeu8fMWGC4E1pvZk8FfZz9B97XtktcD3hMxZpAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBVck1KbkowZHNzK0N6S0NRcTkrdk0yWkdkd3UzUFNUV1FuS2N5aEMvSUhS?=
 =?utf-8?B?Zm1IZUJxVHNGbWtwQmtUV1plaDMyYk51c3drMHpYcERxSlZyZTJ3eWt2SmNp?=
 =?utf-8?B?dEx3eWVpT3QyQUwwVE02TXdCZXlia1JmL1A4VTFmSm5KYkZJMXZzWFZ1UWpm?=
 =?utf-8?B?dmJHS1VsaDhNZjBlUWdXZUV2TUlReXNjSDdGLzA5RlhibXUyd29nMmNVbWF4?=
 =?utf-8?B?c0tkMXcydXRCTmFVcDdndmgwWk94aEhQNFd4aTQ4Wi9YUU9MRUN0UW1FMzdT?=
 =?utf-8?B?OEo3WmptME05RVlpd1RkWlJnNXZ6c3FobTVmK2g3VU5yWE5vVDFkZVkyK3dV?=
 =?utf-8?B?d3ViUlNja2xvdmE0ZmZ0aXFWeDRxVmZCMW1EUmt5WEd3U3dOR3BvS3FXUi9B?=
 =?utf-8?B?Q2sxcU0vVGdrbk1BWUJRTVFRdTQrckhCSHJXMVVKNW9WMzJEWjJhR1lnQWNa?=
 =?utf-8?B?SXFBRjdQMGFGQlNBOFY5NVRySytPdWpDN1BncThEb0dJQldiWjVBTTRyR3I2?=
 =?utf-8?B?SGM0L3EvWmpMQkkxNzBMeEVuUWVxR3d2M2g3b1h5US9meDlxMVBFWjlSU20v?=
 =?utf-8?B?UVo1MVBTc3BtVmViaDdFTUFPdjhJcm93YmlTWnpnVE9IM09vTzIxdk5sdlFM?=
 =?utf-8?B?SUpUekk5R290TnpsMVl3bUVjQUtLanpiYUxqZWU1R3hFNDJ5ZVdrNWt3QkVl?=
 =?utf-8?B?SDgyOGRPNXI2Z3JKdlVRWTUvR3RnUzRkNFdjSU5sMmlzUk1HSnJHUkpwMU5Q?=
 =?utf-8?B?OXVWb0FtSGNScnN5RlJ0REgrVEplK0pwWHpzRjR0UGZFMEh3ZXJXd2lsQ3pv?=
 =?utf-8?B?ejdCNXoxNzdwcDdobU1ma1ZyWmpIdGRSRkxIZ1M2dk9ISlk4aFlFbXRIcnFG?=
 =?utf-8?B?Sm9PODVVdXEzaTJ3eUhNb0FlTnhLRUlwZ0ttQTVvR3pRY2hvMWhpRjF2emVH?=
 =?utf-8?B?b3FSUXY0dno3UXdKRFUxZ01wdThpMVNlLzF5aEQ1VlJJU1FMZ2NkR0UvK3dn?=
 =?utf-8?B?cnlsdU5zQzRPanBFZlUwRTI4OHpmQ2tHU2Mwc2loU0dXUDRwMFk2cm5qUkcw?=
 =?utf-8?B?RHN4TkZ6NnM0bzdxeW16MWZLQ203QjBvMndSN3BiWmJSQzZBekNEWWcwMjZ3?=
 =?utf-8?B?bzlrZk1sbmZoNzJVNzZ0Q3M2eWFYUVpwcWp4VjArekUwOW9VVXpBUXZBUmI2?=
 =?utf-8?B?b2s2SHZzaGFWY2J4RlFDYUE3c0ljS3JpSTR6VUVEbmdiYTQxS0QwVzV2QlpG?=
 =?utf-8?B?VVZXbmFmSGVkd3REb3YxU0RGNngxNlJUZTNmdlZ1aE1xZzNKZ21ZeWhkS0Rk?=
 =?utf-8?B?SXVzLzdack1TLzVpMjBTZ2JTWmc4K1p5b3FXR2xLNGdxRWF3UlpOcHlhMzhS?=
 =?utf-8?B?NzYrTlA1bitwNi8zak9NTlVGam1CaVNkbUZpT0p3QjB1WE5XQVhHWnY4YnVp?=
 =?utf-8?B?dVVJMW0rOE5ObzZRdEx4MlJmbjZEbkR4MG1BMDlCcWlaZ2Q5NEZnazRuRFMz?=
 =?utf-8?B?MVo4bktrTk0wU1JIUDNSMWpGL1R6U3NYQWVFTGNsNHlrL01HbkhxYjBqWTA1?=
 =?utf-8?B?TlRnQUUxYzNPb016R0VobkhSVlphNWR4L1FXWUhGK0NFR21lSnVpaFc1c01r?=
 =?utf-8?B?dCtEVDROUVpsK1NhZGxISEtTbWEvajNFY2RQUUgrdWhCWkE2aUw5ajNoNlB5?=
 =?utf-8?B?d1pXcVhPQVNxN1pHWTRmNWt1RS9uUTd2MXFLQVduZG44cTdyWExCelZhQmk3?=
 =?utf-8?B?YjA1UUxiNWs4c21nME9zQ0R3QjBYVnhXcnQyVnZhaUpXQWJlMFFZQTlxYXZK?=
 =?utf-8?B?NWc2dEJvOWZUSEl0Sk12amlIZ3lSMHFndU9lQWp4dUlWMUxIYjQzeUNTRkVK?=
 =?utf-8?B?b1Zrb3N0MVNNMHdObXdnVFlzV0N4c0JnMnlmNE5ISG10UGptS0xqb2hKdkta?=
 =?utf-8?B?cGlVeENJeE5FM0RXSUZTOFlsYUttanQ5NUkzdEYrRnhXQmN0MGdlMGtwcmx5?=
 =?utf-8?B?b092cHFhQ0UzMWRsT3Y5QUFnWXBOSk1WRE90RWkrbHlBbzc3dlZON3l5YlhG?=
 =?utf-8?B?akhIVW1NODVHN2FzU2FxL08xVk1ETVp3SHJ5Y3pVdkFiSXlMOXZ3cFBsRElr?=
 =?utf-8?B?bnJnTnk4N2ZLTnZYOFdBMm9TcVM4TlN1WkxCQUM1RlBpUXRacnZ1REpvdmwv?=
 =?utf-8?B?TDV5WXJWVlhYMUFGVlFrRGd2ajAzYjV1RGhKV0hiNllqY2cvc2E2YUMxOTFY?=
 =?utf-8?B?Uk90K1RCeVVqOFFJVW9PQkg1QU5kMmhzVE8vSWVYRDVXNXZYMm1rQlZjSFlR?=
 =?utf-8?B?UjYxR1dnb2VObldTOEZFeTNBRTBxd3kzWW50Y1RwcmFIL2RCQmZQUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba39d79-92a0-4baf-51eb-08def9830b84
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:37:16.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2Yv8mUscXLtnaLuNVJur8B7ZPZNGV//i3x1RayO9ak0cf+h02F2OBS9UBEynoAOzfMx+l37uvGlGGyGs+VP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7332

On Thu Aug 13, 2026 at 10:31 PM BST, Danilo Krummrich wrote:
> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> Allocate a single PCI MSI interrupt vector in the probe path.
>>
>> Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
>> fall back to INTx with a dev_warn so the issue is visible in dmesg.
>> The allocation is devres-managed and automatically freed on unbind.
>
> [...]
>
>> +pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::Ir=
qVector<'_>> {
>> +    let msi_types =3D IrqTypes::default().with(IrqType::Msi).with(IrqTy=
pe::MsiX);

BTW, we should convert this to use `impl_flags` so this becomes `IrqType::M=
si | IrqType::MsiX`.

Best,
Gary

>
> I was about to ask if we really need to bother with MSI and shouln't just=
 go for
> MSI-X only.
>
> But then saw that the commit message mentions broken VFIO setups; can you=
 expand
> on this a bit? Which setups is the commit message referring to?

