Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021126.outbound.protection.outlook.com [52.101.100.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526853749FD
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201857; cv=fail; b=AHNUs1z6byAYZB4eV4Y67zqoLCYbUHLdfc3jC/aAqFidK9uOZ4xNHYdGFp8oiH1JHPOOjCd6WCJtFx0QyTsWu6HOaUKsaSggPKiTYILuVo8Xpnq75KAmCiQcnFLyWFq51xWT7qnqzI3dB2Pd861PGkEj/SBQuqZrZcCE4hINrLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201857; c=relaxed/simple;
	bh=nkjn6L/ZhDfZQxOwnwd/FWFQJVagBsvWPii5PLmN5rw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PjLF35yFW4ShpKORzHt8eKoe2WAYkIole9kNVYwbehR+nGM19X1U3MqTaXMJv9X8AI1Fe78lnSq2fDY4fdBFaFQjD7yWCZcchv1SViFx/duw40Uh5U6H3qETvrSBIUvPBYKiP4dw8O9+lPcNP1jnjm8rhqPfxLHRYyYbpuEXtz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n5K+xOXo; arc=fail smtp.client-ip=52.101.100.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n5K+xOXo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIMZVMAzHx5BKVVhnDokOImlh7VvO6u0t5LlamQmU201zofNXOgA7tNKVFOvCrRsyaN5LNwDh8B9AbP4um9AQ33jzlIq1A8V16ubDn0Q56X4ULd4nE6UZ+mcgkZJX6R7ksQo6X/o6FyKQqUxoYspGOImFDcyyYloCYYz7nIw4wPhf0GegOwWpqtM8a/YsVU0IH/pA6Lpo+NA6PhZevhNAy+cW4bGYGLX71C8UPDpC/KUer8RydijkBT+MXgC8zGSmc9Jymn2R6wy8F8H0NgS47bPNjx7DqmhTUpzBDQizpYeemis/vKqtLKrSClY708z5gF74opzYVuHOQAyRdrIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+dd2hYNGSTT1vGP115ttWiroe1i6WD0S3Q+gXW/l2w=;
 b=N89HyPp//gyT4/4mD6cc/tu7H8efxHed+S+ua9RFWCoRfaAMgdFvGkhluUwq1ldMum7650HzlkFtE18/gH/WddyvjA5fx+OBvgqsTJkqnm0jjlxtoLk2r34gV8H2IKbsgLX+DH8O54OUhutU8uKBk/8OjNuBvkoC5fH1SHgJdDRtAyBajhLWb18cUgY5nr0Ww2BszPap/0fZaKj7CzWfA5pEpmxhzXNRhtFzBMOjKK3R5HxRQddVKOzcM+GizxggLHw9A7lYMG14c3+Kmc98UlYvOllIJC0AryJyfGcPRKj0EJH+ZuNuDKfwaNHZhf4rXKNt61N9RucoKOwlvjlnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+dd2hYNGSTT1vGP115ttWiroe1i6WD0S3Q+gXW/l2w=;
 b=n5K+xOXoFXv105XzGShF74WSFd22urfY+l0/RWbMLOG3zjCStHc3MSxmJ3WCG8NA3I7/BWsG3Awp8QsTBpAQhvWBAaCRmXdxdgj/fdkQvY0GCCzvL8YwqRm+UchCxLEQbPEjAdKIcNvfAwR3CkBcTNXZpclOwTugMjTBxktFHfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO3P265MB2092.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:17:30 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 18:17:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 19:17:29 +0100
Message-Id: <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-3-ttabi@nvidia.com>
 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
In-Reply-To: <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO3P265MB2092:EE_
X-MS-Office365-Filtering-Correlation-Id: a18e50fe-fb47-4380-ea7c-08dec7e5b34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|56012099006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	j224CW/1mmsAwEyITv9ygsCw+CcyqKsH4EnBzFz6YGttXi6qLVyZ9b82YYWBrtZq5kdlv93pZnFki1hS7BDqoCknJ/T4t+qzY6/uVLDomXMbSDevkXzl8FEYzEHWrh4o/rmkb2gA54xF2/hS5l0lwBE/aTTHlkgX+XJjE0drip2ioYe4xdhyxs5HxaMPS/NRU/f4naIJ5QyPp9u4isDFTAwgJ1Sd9p3DpDWxSoLQ4GAFlhyCtkZE/BiP8xJeFq3Gilj9AJ3ZRCpqZDSNa1H/kYxgldoWu9kM7cz1/8TVLkzZw17v7OjFxrIweeVJrhjWe0nMQ+lnVPEYmf+NRxX7/VvArvy1ciFISuUJk3RkbE1eTSpIkUgnYBXEFnILTNO4LH0W3nCVRKulYSGalPKatI+B+NDhIJt5zGHGLDJeeQLle5kP5ED2whLdHyKyzF7WrmXluQLzsglR+U+DIVoytIHKF2vOg7TQ9NyPh7F1SNT4DZu7mE9bR+uKweYtZcJsYLriyaQU2w+xbYueZ9VudPuGp/jO0q9SmtwH9qlX9y+poL3kgbFjKCw3JMJedj8jAdN4Hm622M6Z27YL7So+WXZ44NIKr9fNTUkLYP5V+c+VVx76i/tF5CoDMo1A238gadv8fIP9+wLKCMcfMCJmud1AdTVdDwfccPxoc3edpTkA0pfcid7359Dqp73LyZl6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(56012099006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1FScFVTdVhQMU5NQUpjMWMwNG5lemhaS1A4Skl0MWdOckEyL0d3ZUpSVHBS?=
 =?utf-8?B?M002bkFBdkZZWXZHM25PcXJEUEF0SW9jaS80ckhwcm5ENU1mMjlUenl0NzA4?=
 =?utf-8?B?R0hwK0drdzFtTEVLSkF0STdyTkY3cTNXZjFvMzAwcHJjMDlpVUdtWHEwdktr?=
 =?utf-8?B?dDRUZTF1SDJOMW5SWEVmVmtSd3ZQSGxtV2pkYmdDMzJCOVgxcTJaQkc0NG1y?=
 =?utf-8?B?bTNTSmUwNjhoOHk4ZUNwd1NqbXdOeVN6VTd5RmsvcTV2bFJqYkNJUVIwWGYv?=
 =?utf-8?B?MWQvR3Y0NG5kR091dWQyd0Zuc1N1aFBRWEgrRm55TVdjeVBGamZsR3gzTTlL?=
 =?utf-8?B?bXFSbnoyQlFoQitwcC9rWHdTSDRSN0JHNFdXNG0rL1RSWHErNnBBY3VkQ2x0?=
 =?utf-8?B?Q3d3T25zZ21ZVVJNTzYxdHFmT0xQc2o5WWgwYllNUkl2MjQrM3VyNXpxY05C?=
 =?utf-8?B?U2tpUGxISHVTdFMwc0c2MHpTeWNDMFNmZkFLWHlUOWJPVnhWYk0wTm5TWnQ0?=
 =?utf-8?B?Z2NBUWJlRzJ0VlM2TEJqN1pOVWtxNmdDc1hxRGhjemRKK1ZhNEM3Q3QzYThz?=
 =?utf-8?B?UG9SMzB0Z09BYzJvNUNXRVE5cWNzNEh5c3dZMHhHZFVYdndyU0U2UDhHdXE4?=
 =?utf-8?B?MDFPVU5aemhWcWFvTVE2bHJHb28zU0M1Z0FnMU9yc3hqTjdPNnByM2s3UVh5?=
 =?utf-8?B?WWdhQjB4dDZrVFhaVTJQeHdUdFdlbDJTTlB3L0lxdElZdDJLMFB4SWV5WEtD?=
 =?utf-8?B?TVJtbE1wNXI2REVZaVlvU1hZQXp4dnNkQkFiNmlSamRrQWtvOGhGUGM2WWZM?=
 =?utf-8?B?Mk14Q3VhWkNKTVRSUCt5SGQ5L2xhbmo3cWhYQVU1OGRyMGZ3dWgxUkJNazVl?=
 =?utf-8?B?aUZpTWhHY29VcXVmMnhDYVNxSGNNdTFUV3BXdUlRa0FhWjA1OHcxTm1FQ09L?=
 =?utf-8?B?eDJjVUZGT0pKS3BVa1pxNUxzbEN3cTVtRDZFZi9Wb0dycTRiV1FZeTVCYUtR?=
 =?utf-8?B?aVNYZ2t3bHcvTlJJYW5aUThDV3ZCY0lObHZjU1dqbW9LREowWXlrZWtpamJu?=
 =?utf-8?B?QlNmS3Zuc1FyZ292eDROZ3M5WXVHOHdhZVBQVTF3RUp6RWQxU2N1WlIwTS9Y?=
 =?utf-8?B?KzhYNFYrVFl2MW11eW1TSUE1RllTRkRvUTdySXBRSC9ZZVh1cVEwOHRtOWw1?=
 =?utf-8?B?ZmJ0UkloYXR4a2NBNHNjcjg1MWZsM0dUcFJaeVBBNnkwTDFreEs1cGtBbU1U?=
 =?utf-8?B?czYrYWF3Wi82d1hJM2N5SFJqN25nL2JIVnUwaXBmSDcybTJmajJOUG1BMFdH?=
 =?utf-8?B?TFJQdkhOZWpqY2k0dmp2d3p2WDlRYms2dk5uQ2h5Y0UxZzBTaDgreUl0a2lr?=
 =?utf-8?B?enhrbkswMjBWMFJRcWpvRE5HelJaSVhVbE05VXpqTjYybkt3U0gwSW9kUG4r?=
 =?utf-8?B?Q3FwVGhMR3c4RjlPQXhmZC9iZG9qb012MHpyNE1nOTBreDFsUVVWZTBnK2NN?=
 =?utf-8?B?QXd4YkNiaU9KVWxwNVU1VDRrZ3p2QXJyMEZPNFg0cTFVUEJEM3lQYVNLNXAv?=
 =?utf-8?B?WmcrRmxoVGlCTXNGNk9KZGJ5YUgxQUJyYy83aDVhOHUvNlBySElYV3pzc3pt?=
 =?utf-8?B?MDZONmFEYlBpczF3eU1SZ2pxNjZsblZFcWZtS2lHU0xoM2ZXeVk5VUcrZ0Yy?=
 =?utf-8?B?LzRUMXVwdnBDeU9DQjZXcjRlaUQzVDFqa0lyd1A0YmFnQjNqbCtQODl2Tm5G?=
 =?utf-8?B?NHpjYndPRHhrbG44U2c5cXQwWjVCenBiSnZoMHJHdXdCSGNWTEZpUG1DWFlZ?=
 =?utf-8?B?YVY4TytkaFViWTVUK2V4ZlRYekZDT1hxUEJ3eGJYbU1WNE0wVjNxc3Nab2Jp?=
 =?utf-8?B?RmRsRTlHZzY5Y2xnYkJITFVPajVLcHN2R3FxV3U2UTI0VDdFK0xYUDIyYmYy?=
 =?utf-8?B?dmpBRXFIRytDaFpPWkErbHh3Z05hNXFHTzRjc3pMOUhNcjZSUFN3TDUvamd4?=
 =?utf-8?B?eFNEaFRoMUJ5azJxZHpyV0ozVEp3czhNZ3FhVGhlTnhneG80VU5wUkhhWXRn?=
 =?utf-8?B?SVBvUWxCODFTbGhhcEtnRzBZYlBkSGlQT0Uva0dML2RiZlJBL0U0dFdQNkZ4?=
 =?utf-8?B?MTNKeDdwYjd4a0pSSGxJakI3UGN5UWlpa3hrZjhONzFadlY0UHdSRkRYdXNx?=
 =?utf-8?B?dDVrVFM0K0hKdzE5eFEzZTJETlVQOVNVMEJMaUtwL2ZWZHJVU1pCOXBoV21a?=
 =?utf-8?B?TWZMTXN2NzZEYTZiTnVmNk5NaXo3TzRSRi9IelhGOHIyYUF6azA0ODd6Z3ps?=
 =?utf-8?B?MDZlYTJHZlg3UWJPUW02UElzVnRjZ0Q2Zi9NcWNONU1vNUd2VnZzUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a18e50fe-fb47-4380-ea7c-08dec7e5b34c
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:17:30.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/2RK76dlZPxew4vlzLdgE1VLsjT+0tY/nU2ti7ez74vsxEZuuzGBTAk7HRh5aPhdmT0d+7lbCfoo3d4YkjIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2092

On Thu Jun 11, 2026 at 5:45 PM BST, Timur Tabi wrote:
> On Thu, 2026-06-11 at 00:00 +0200, Danilo Krummrich wrote:
>
>>=20
>> > diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core=
/firmware.rs
>> > index 279fbacd0b8e..2749c196416d 100644
>> > --- a/drivers/gpu/nova-core/firmware.rs
>> > +++ b/drivers/gpu/nova-core/firmware.rs
>> > @@ -33,9 +33,11 @@
>> > =C2=A0pub(crate) mod gsp;
>> > =C2=A0pub(crate) mod riscv;
>> > =C2=A0
>> > +#[allow(unused)]
>>=20
>> This shouldn't be needed, it can just be removed when once it becomes un=
used,
>> no?
>
> Technically, yes.  As a convenience, I removed it here so that I wouldn't=
 have to worry about it
> in a later patch.  I find that the patches themselves are cleaner that wa=
y.  I don't want to
> have a patch where the only change to firmware.rs is adding or removing t=
he `unused` statement.
>
>>=20
>> > =C2=A0pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
>> > =C2=A0
>> > =C2=A0/// Requests the GPU firmware `name` suitable for `chipset`, wit=
h version `ver`.
>> > +#[allow(unused)]
>> > =C2=A0fn request_firmware(
>> > =C2=A0=C2=A0=C2=A0=C2=A0 dev: &device::Device,
>> > =C2=A0=C2=A0=C2=A0=C2=A0 chipset: gpu::Chipset,
>> > @@ -48,6 +50,21 @@ fn request_firmware(
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .and_then(|path| firm=
ware::Firmware::request(&path, dev))
>> > =C2=A0}
>> > =C2=A0
>> > +/// Requests the GPU firmware TLV `name` suitable for `chipset`.
>> > +#[allow(unused)]
>>=20
>> Please use expect instead.
>
> Ok, but why should I use `expect` here but `allowed` is for FIRMWARE_VERS=
ION?  As soon as I use
> request_tlv() in patch #4, won't get I get a compiler warning and be forc=
ed to change it to
> `allow`?

The goal is to be able to easily find unused code. If `expect` is used, the=
n
you know for sure the code is unused. If nothing is used then you know for =
sure
the code is used. If `allow` is used you don't know either way.

`#[allow(unused)]` should only be used when it's used but gated behind some=
 cfg
only.

Best,
Gary
