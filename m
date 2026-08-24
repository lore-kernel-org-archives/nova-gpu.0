Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADF3AA4F9
	for <nova-gpu@lists.linux.dev>; Mon, 24 Aug 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560135; cv=fail; b=m8w4meMw2pteHa5xX7D3VNoqVU/P9qL+ss7AICaHLUBY29wh5exKnW42jJ2Gjug+oQMM43sevZPGz2JCWz8hnyW13c6zfdJNv41pqD43PiCOHO1uBpkCkRKglJxPUf/rUk15ufYhX57Qj2qlBrcjo5qnQo9zB7N1nntFeWgaPGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560135; c=relaxed/simple;
	bh=XAzoPRKZM7vNO2m8XkwGCtD2cODYLsjp4XqI1lzUA0E=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=rKWcUscs6vf+iRUqnww/P/TR36v8IwA7WcJvjdsab0LkUPKJIGQCEEjJWbmTJ9uU2oiaHRoYGRoa747/wK7n1ZtBjXOmeVsaJdMEBlxcrf0VL03erFc1yIBQQeGtSnX01BC9emwD3JBQBOJXqC1aTb+Iow+6TxTW/mjuLTDxIAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WlSaV5nv; arc=fail smtp.client-ip=40.93.198.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WlSaV5nv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5FKBuHZrsgIPsUtbNgYEGYAbq0azcEOzA0mm1jX/9IUs0Da+5CIHHdNHRV9nDOozyuWoERV+DCRoyeu4nT48t2HIOXLCJ10qAPURQRdzjQ9ILVxBYCNBcJQ66+Zi935gryFghjt5/vBxPkS5XMkrSZaLJMKb6RKM3+AzdXP9c5G1izSInHKfCKeTmzg47geREme1YEXTaokP6R+UTh1lLb4ItC1jweFbxtZS3da3gH17hTbpQ7PI14vwhMyGCyyJOglUPq73Ys0ZUXphlkgbqohfDsXOyEWKyMtWYHly26Wdw9mXvB2kSxzThvy0XTgGJJRozu/ZJHrrFjfHV8hjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz6nQoK1EB9uJdgwcHlfaywAl0tbQkIxE007rNUFVaA=;
 b=RbvyIFgxTHrN1be1zOTNoAgtj1R/+JiJBie7lO5fo6Jm5Ki82Oly5RbYgSqmcUkS9bBHxGCBPjeIUSA81EpcPiZaur5GzmHvxohFEd4xichwRumpMnb00Et43mH38b72oVlSSuxQ7B/U3FntNlfYrjNNdtWjnyU0tUqQ0b64q6lwru0RlTKIglDJrBDZ0XFsOS6Uw5gg22b/cfaQCQVyd2KHbJNZRp2UHo3PXFdtpc3fw4ytZT0nEADREB1qzmH5nT4IaATi9vT1BulIg3UAHpWZQKd9mvdHw4ZGoFEqG/ffgLiHiDd0Gb8nslWjHC2GKNQDLiJ9Tkx58CmvqjTJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz6nQoK1EB9uJdgwcHlfaywAl0tbQkIxE007rNUFVaA=;
 b=WlSaV5nvKQ2PUluGzrhCDCiAsYVPktCkiPIKZXbzOFG2oCKoQAQy7o5+ohfxiy+QAH3/0/pEX1Z8wYlfy3Ug3JyEZAfVw0oGrdNNn7T1ZRMbAUbtoHDqiI8vkR1auJZTMTMktYai8tbv7kkarVjm5yFeT8Pji8wir/zIm4d6VZdk0w+MFGgQRnv71QG2+iMX5UTlD6oz7EcKin0b0m5/rLf8HWRVsEIAykUiAT6v848CQFNz8t5FS9NM2J5YjlDMv4WTdYcZ5pn8jf+RPQVkXKwAvq8Qv9/2wU5NaqvxsvyO4A9b/72KECIcP4Yz0eIzKLl3oVGZi1UKO1lR58brQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 08:28:50 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Mon, 24 Aug 2026
 08:28:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 17:28:46 +0900
Message-Id: <DKX16HGPECRS.3B4NV0GULLREY@nvidia.com>
Subject: Re: [PATCH v2 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU
 is enabled
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
References: <20260804170045.902069-1-zhiw@nvidia.com>
 <20260804170045.902069-2-zhiw@nvidia.com>
In-Reply-To: <20260804170045.902069-2-zhiw@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f204459-93c6-40f5-8dda-08df01b9b926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|7416014|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tTiJUwUoikV/uDenri9hz650fMWzyPXaBdPsS/ttnTabjLyDyQd+eODWtdpHD0tUaxj60biYSftQ8V+ziXorDkrhYkMKbqL3uc7lKq07Zv0R861XFQc5VzgEzjeLKBr7MbHeiDsVyH/yI9RGo0Mdfuviu9qMRJR38XtN2HOH/srsfXYszgZjAzhamG7pe3ZTy7j1aHyEjpEHTkPIQB3jfiTbgu2ppTTnkH+H+qZR4vrzxIXrMZyQKaqOWEIwh3Ynh4SH/pCZaA4mL3qBabSN6kLfkgO+HuF7FZ05pe6T4k93H6L+R3/bplxfk4IzxBCrMziCEwlz//diqRQEE9cmG6mCFOlhEFgKEDW7bsE1QiUkIXc7XDPLUH8RgfmYK11DdT76nDHfiHK3+uI8j5h5yIpDXwCvMa7ahfTE5BnrNR9WRh3Zo/fzf8OLNUluycveXOo5PR0mUobOZDQe4XvS/Iysgt2m50dB/uZyxNwsAJ48hOPcPKFC7qEj9POnrP77fZvYigtQ3siNn3z8Ro61cSNlC8wjJbnAbMoLjrTpatzS6av/yPlie/mttd/owahonP1+OnTaltMy162U1JNI4MSy3+afKrvIkRcUfiBLRDqRDDYLoA0P/GjnJ3KPjwA5w2SmSC8hmEy4JGg7fVUdU3fDUjeuUfpB2rDTY6hBjX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(7416014)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZBOVc4M1BFRWNZRER2Yys3cTdoNStacWp5QTMxREZnejVhWkdjM2dlQjBY?=
 =?utf-8?B?OHRZOFBzUzRKcDVodG9wdTllRHdTOG5EM2J2Vi9SZ0lvbnlQd2pLWFlkbUFm?=
 =?utf-8?B?OHpsSWREekZJTzhBc1U0UDVXV2dtS09MVmxqN0ZwRytQelRiN2ZaOVIwMExm?=
 =?utf-8?B?ZmZ5T3ptYUZIUHlhQ0lVMWtjSUVTSzdoZ2ZyMnJYanhtaUF0QThzSGttU0dD?=
 =?utf-8?B?d3Y1S1Z1T1lSZlJaeFhnQ0ZBZ0lJM0R1azhBaFFzMHdiL3hSOHZ6STZmWEhn?=
 =?utf-8?B?akxXV0VmL0ZGOVhkMjUybTBlbVRVbWMvZEVUNVA5S2lVR1BKcW5TRUpDc2dH?=
 =?utf-8?B?UGdSVEUzNFpOcEpqb3BTSGswNDFwdHFQNENDbDFHNTg3UFhmSHFLTzliRkFk?=
 =?utf-8?B?MTFMWW56WnJvaE5pa29pVHN2UnNmTE9EeHJMd3lYdDd3aHEzK1RlZnpmUW53?=
 =?utf-8?B?VXhIVm5HKytsUUJ2MXRGek1VZC9iSHlSOE8yN3pkQzhheEFDN3BJTmdVTGtJ?=
 =?utf-8?B?Z3JKOEVzMnNUNU5xRU5PWFVBTGx0QXRaV0tyd3lCSm9jOHRnV2VQTTFqRndJ?=
 =?utf-8?B?OWNhQWRGeEhPemVOekdpdlpWRFpKWCtrR05FYjRjM1JUMmhXOUFaalI4SXA0?=
 =?utf-8?B?b014aDhOTHNTRE9JMXpPcnVjVk1waG1TSUFSRURDUnRmVWNhY3BIV3lRZ1Zh?=
 =?utf-8?B?c0ZWTWc1d3pLc2NSZkp0MXJ1Ym90eGNDejB4a1RjVGFvWG1HSG9RMUFxWkFY?=
 =?utf-8?B?SDQweFNLKzMyUmFpZy9yTzF5TnkvRisrT2pDK09KS01kajdTWTNhWHZBTmk1?=
 =?utf-8?B?a3N1SmJreUluR2daaGE0VjREdkxaUml5R3NTMGRqLzdTcU14NGh6OWRRSFdp?=
 =?utf-8?B?TWFPb09pR1Z5c3pSS2NIRVNDY3dlVE8xRUtrd0w5dDEvUHAvWDdtUnVCb0Ni?=
 =?utf-8?B?RjZzZzAzQ0RKVDVHOWs1aUk5dHM4bTJ4VEowM0pLSytwNHhZSGFWK3RPRGZr?=
 =?utf-8?B?KzhLQWRCL0FmaHJPZ2xPNTlNakZlTXBVOXpVUGxucFBRU1daYzI3SzFJVjZh?=
 =?utf-8?B?YmVITklTNGo0TGJLQW1ibE9pa2NaRWtBN0JjZWJtN2FBZTlFQ3pnWlZMd1B5?=
 =?utf-8?B?emFVMWpabllYZlJhY1R0cWNCbFc0dzhRTVJ6VDYwSFQ1dThPclhxSUp3Q01z?=
 =?utf-8?B?Zis0OUJ4ZGphUy85bzRWU0crVENwZDFBRnZjYVJKdzJUSWd2d2ZGMjE5VzdK?=
 =?utf-8?B?WE5lc3JtWnlFN0ZLOXFWTXhiQTNpZ01DNDJkTHovQS9iRW9lb3ZhWmZOWVhD?=
 =?utf-8?B?L1hKQk10Q2JyaVJQUk9ab2VIWWthckdRQmNUMjJCRjh2SGNFOTkyMU5JdXRl?=
 =?utf-8?B?Q0VncStyVVBkM0RlRG9VVHJlSWRBZ0I2c243MEtadGNxc3lGTEcyZjhQQUdB?=
 =?utf-8?B?QmpodlRYN0dOQmRtb3lqa2U0K3hJNFlpa21ydldrbFd5eU85ODJkQVd4RWZu?=
 =?utf-8?B?aWtHUW45TnYvNjl1MGtyWDFpeW9VV1JMN1NIQmsrdE5JWmxOcWVoNHBTb3hC?=
 =?utf-8?B?UGQ3c0pFRWp5WGsxVHNZREt2bkFtT21BVmZmdTJmS3R1aDF3NWNDNnlwRklF?=
 =?utf-8?B?TnZJdGxweGhlMUdVbldoOUI2T3hoUTNlY2ZwNlNKeVF3TmlCVjFUYXlJbTdS?=
 =?utf-8?B?MHp2QVJsVklMYTdRd3phMEwrY0J3QlNqZjI5MDJaa2haK1Rvbnh3MUN5NzVH?=
 =?utf-8?B?bjhEL0sxa0xZZjBnbnFydUtORWRsUkdvVDg2eHhOK2dZdndGTlNxL04waEY2?=
 =?utf-8?B?WTBoQS8xTmhMbm9HWkVoZXVPeUJ0M3FYeFJrKzUyYjJxU2pKMkFmZ2VPQXhO?=
 =?utf-8?B?M08xT3V5VXZjOGQrbEVGY3V5ZVVWUE9ORTRTYWNNSXl2TEJjUzZXamNrQ3VZ?=
 =?utf-8?B?bWdlYWhlODRxL3pHRm5NZFI2cTc2SUFHWE1WeC9FcDZ0TXdtRG5yRm9YeHVT?=
 =?utf-8?B?VzIrb0pGTGJxMitwMnRZRDZjRGtHZXdXclQxeTI1S0Z4czNpOWpNNTdoS21D?=
 =?utf-8?B?azZNYVIweWZCUzlVNFYvV2EzbDlnZEhnMkJLU29pV0JvWVl0LzNCRm9SQnJp?=
 =?utf-8?B?Wlduei9mdkxWL3B0RmtBMFNEckJuYVlHUVFjSTdVOUxncGZ1cXhZY1dhLzBF?=
 =?utf-8?B?d1gzTEExUWl2dVlpNWduZXkvWS9oVnROV2lwWTZheVZERisvbGVjWHkxTWJx?=
 =?utf-8?B?dHZFc2QxRldFR2lIbVFRWmdqVXdzelVqdkJwbTE5dE9HK2I5UDVBNkIwUmlq?=
 =?utf-8?B?eWY2VnFpMnJ6QU5xKzZFTkZqWGt6SXdlNS9CVHR1YW9ibDRwQ29WUzVVQUFM?=
 =?utf-8?Q?kZ9tWgwjH2OHfNc2BI0jF3cVpQLoxNpONgpZ69DUKKGv0?=
X-MS-Exchange-AntiSpam-MessageData-1: H3HTIXnuo5VK7w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f204459-93c6-40f5-8dda-08df01b9b926
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:28:49.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy4OK715iS5gVCTGzNb3v+1vv2kTPDMmOk04+I2Ger4C8qDXEpMf0IrVLNpcwfm69OIcyX+kG4knhmU1dU8BSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

On Wed Aug 5, 2026 at 2:00 AM JST, Zhi Wang wrote:
> GSP firmware requires VF BAR layout information to correctly route
> interrupts and doorbell events to individual virtual functions.
> Without this data the firmware cannot set up per-VF event routing.
>
> When vGPU mode is enabled, read the VF topology from the typed PCI
> SR-IOV extended capability and populate the GSP_VF_INFO embedded in
> the GSP_SYSTEM_INFO command. Keep the VF information builder associated
> with GspSetSystemInfo since it is only used to construct that command.
>
> Link: https://lore.kernel.org/nova-gpu/20260730181404.776028-2-zhiw@nvidi=
a.com/
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

This is looking good IMHO, and actually I would suggest including it
with your PCI extended capabilities' v9: that way, the added SR-IOV
capability gets a user immediately and we can merge both patches in one
go. It is also helpful for review to see the code being used in
practice.

Just one question: we are passing `VgpuState` by value everywhere, which
is ok for now, but is it expected to grow further in the future? Its
name suggests that it could end up storing much more things.

<...>
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs
> index 6dc31d1bf5ae..71feda9c1e69 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -16,7 +16,8 @@
>  use crate::{
>      gpu::Chipset,
>      gsp::GSP_PAGE_SIZE,
> -    num::IntoSafeCast, //
> +    num::IntoSafeCast,
> +    vgpu::VgpuState, //
>  };
> =20
>  use super::bindings;
> @@ -29,10 +30,43 @@ pub(crate) struct GspSetSystemInfo {
>  static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
> =20
>  impl GspSetSystemInfo {
> +    /// Builds the VF topology passed to GSP-RM as part of the system in=
formation.
> +    fn build_vf_info(
> +        dev: &pci::Device<device::Bound>,
> +        vgpu_state: VgpuState,
> +    ) -> Result<bindings::GSP_VF_INFO> {
> +        let VgpuState::Enabled { total_vfs } =3D vgpu_state else {
> +            return Ok(Default::default());

Maybe `Zeroable::zeroed()` for consistency with the `Enabled` path below?
