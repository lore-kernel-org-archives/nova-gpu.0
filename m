Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04B374E71
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123222; cv=fail; b=gWqXx8tdGmseWIIB/yZroRR/JH62VmHYhQgIt3l7W8FIkH2SzwL8JgHIyQ6Pvdo0eJAXzacJaOUL094IvAxSENC/w4keP9rA/RRaYQCapA2VEEDyV/AS9p0xoT/c4UskXmOqMCQD3jOyUJrUzSCS0DrTLlVdiwLghk0kG7YVqI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123222; c=relaxed/simple;
	bh=No7vV7kjvX33vQiGGj28ICUf02WkOs7dzrFh+DSVUXA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tRlfOn3UCUk6yf4uP6J9PEI9BgexnOuNPizbQBnyWSE+M5iXib/cev4MxrLZj3cgXmSh7XbS9KlbLYXMoD51H7MDY0+czhGRA3mFOmYwvfciZWslixDdMs+gFa5uFyQSZB8CT8cFB4WPMlIKjXHIC287xJjN88dpSZ6WbeawjvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=W2RHVvDq; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="W2RHVvDq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAS5JnsH7pGStj6U5OIGNfgwo5Cb9oQCgMOgl5uiSR57aZk6njr/nI/1S1Wlfj1/26O8orsgEcSk3e/9H5QTe94VRvzbhklDPnm8aJxHcssfIcjvCo+Sqks6Qn0cflq+uDpUk4NI64Dm7tPexQCfcB+PKsFGmlxS0Xl6AEZGRCprQyuz45Qv2BQ8PtkvQwGFrZ47+bdFcJSgMVvTeilKwukgAYeowrKyy5mkTmnN/w3whU9HvH6NLeMeNh5vNebfOPL11AOhV10vCvSeQqi7oJwqAXPmSj9VTst6D726L88hE55SVEeqeDPIxrsWYe3nIuTUiPc98T3GvOd9qlN48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jMCvfF+yQC8SGYI15jEUmb2N2NZCEg3w3N+CeR5k/8=;
 b=V3q3FZxJg88vfdtk5KfhEFoVbgS4PGpctUu0J1lY9S0bFeVTOumMFxFdkjHggtnbD5PuPufczFLvl5qD0TTIAaTrm2Lym3WzfgxIm8lYL7++fX5u3hM8t8E8rBk4A34sMyf7VEem80iPTRd2ewapJYZmnwQm1Q1Rq1TenHY2noXtEwe8luIoUGBDkrYqLO4oAY6JgHc2EOg+n7dR8TX8LkyuCbStCJMW4EIIuG6Cj7+oCgEa+SiV2AdxURCFXOvhcHBB/GNy5nu3KGRXZzOD2PTwgmUrI9Pxf+yJ9RR1Av953rpgHzOD/ZJRs1egrJ/Lqj2ddXnucxh6ZixHx8jSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jMCvfF+yQC8SGYI15jEUmb2N2NZCEg3w3N+CeR5k/8=;
 b=W2RHVvDqsEKeBtytyMKcN1VPsynVl55vwb7iGuaLYphhRhSOaiYouS2cXCz+FMg1ux6noPAhOle6Sy4/gz92fTs+AX1dRXXJmoY5+I5Za8oRKRR7MaxrGS1NXhUf87XiGORzBb2Ox3dz/IfRyqfNt1tSbJPZaUfe6n6DPpMHncM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB3584.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 20:26:57 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 20:26:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 21:26:56 +0100
Message-Id: <DJ5NHI02AF3B.WOW85000DWA6@garyguo.net>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
 <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
In-Reply-To: <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB3584:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2863c0-5478-4ce8-a7c3-08dec72e9e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|23010399003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	R3w04MiPQs88bdBPh6lVQIWveOXiEqaOGMlKpH/ipwsCmGX0AoKwnnBmYdaDhSrz8UPZTXLyoC/uL473/OXJ5vMWidWRkPhXKZ8PtEY1YVB6Mk6MprJr/mAa5rt+7L1GmMv64kPE91RdwX/PUcz/isw3hLzaj7UIhiJGDJ/q8sLybV8B6H9kaqFBD3xC4ulaCOKW3M3+zlecimkEp8VV2ZfuQXfhDGuiXdrITtXaSONhrYeq5tSmmJ2O92cR4VRODoZ7RsQjSe5NDoyFllavfjTY+mzT6p2fiI8/lHtzleO51jCrGUnzg2L58mq+1Nt7jy2mGPHHT8EMF/3gm3nuV7hj3D6SH1FSeXu8f7bTfJ12HuujQSM3SfiHwGQt7NulPRGlnvm8ZtdBGelnGCeoKoyFYRCziMLqa1LHnXZyalRTWgSdtb8xCWkG4REFmIEqEe5BzKEGM21ydbD9hxMV8GmZaHy/2bDApNlGsqsY9N5qWF27205Et/txvAkYYkSZP1Is5C1+4P8xpuAXIe4pyWo+upFXDH/aRzlleu+AUnpuPwOtGWTSgN+gFQMvKtpoEzdNM6SdJ4Kx525vAfj+n9DHaeQy/m9g1qk14HauXlVyxzfvXL5duZFUEoVcOd+josQI31c4X8gqtuQVonWCCOoQht00/+BEhDTLfb8ZY+hYo1Me2V3iyz2LAOXfXyov
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blpCQSs0SHk4dGNpOFpPZytmdEFkRFRnTTBCOUUyQmt2VkhqZUdCZjdZMGRM?=
 =?utf-8?B?Qkd0RVRSd2d0YkFBKytINjdCN1c4Mjg4NW5qZjNIajl4VEZUbllIQTBrMWJy?=
 =?utf-8?B?U1ptN3pBNVltMERJdEpxWURrcE41U1pZNElUb2Q4REF5MUVkZERDM3pyZ01t?=
 =?utf-8?B?dVE4OU9SMEE1T3drM1lUcXRQUTRweEZNL0h0WWhwbWh4YjRmSU4rYzNtdEky?=
 =?utf-8?B?MjMvTnl1MVpuM3VRYVRJVFZUNEtQSDdCTmtyZFNrSlN1T2QzKzVXbGgvYUlw?=
 =?utf-8?B?b0VyUUpHWWFXSFlHVkNWbTdNaFZ3MFBweGlOMGtLYkFtTXhFa25qRHJZUFJp?=
 =?utf-8?B?ZjZhVlRwTDdOeGNnM3E5WkMvMU5ZV3VTbXhEZkxkYUQwTTArMm1nSHRNblRE?=
 =?utf-8?B?WUJSV0lKRVdTemY4Q0V5UzE1VS9xTThRSmViK2U5cmZvYnBhSXRwYU9weGsx?=
 =?utf-8?B?T21rOFhPTEY3VXBESE9uQzdwTUFkRFo0dUZJK0xQRy9qUTdYYmRjbXFETktX?=
 =?utf-8?B?WVV5RTQzdk1yWXV2bm5yN2N6MzNma2k0K0Mvd1lZZVJJOWhOWW5IaTBrbGJL?=
 =?utf-8?B?T1NIRklsYnd4Q0VxQTFQdTNLaDZmeTFmalRTcmIwSDN6SS9CODlJbVNOYXEr?=
 =?utf-8?B?TUdZNHRycms1eU5zOHJMaHNkUlcyVzhiQkU1Z0FhdXZ0b0pwTnlOVm5DMXlI?=
 =?utf-8?B?V2g0WkhCVXF1cURaSDFEc2t4a2RJZFpPNnlVbk5ac1NMOXJFYzdvWHA4cFZ0?=
 =?utf-8?B?QzhHdEFqbDRXNEY5NGYwYU5DUEtUdHUzZlpQT05lSFl4My9ma1lPRmI4eUtr?=
 =?utf-8?B?eVd0UFRtWDVvcWhxNkVRU1k1RE9pdVlkY1BiVE5rOTc5L24zbXJFMVRuMmdy?=
 =?utf-8?B?bDJ5Ullpa09PTXRwWW44NktHRmJYVnB5N0FCZVRwUmNNTlp6dFZPRmZuWXFC?=
 =?utf-8?B?cWp1dGQvRm10UzFEQXlxOUpqL3Z4WTR5ZTZydmx4VnlCSVpDU2lsZ2dHMEN6?=
 =?utf-8?B?bDk4elZPNjlpc3k1dXZ3ano4RXFtZ0J2RDVJdG1KUDJIN0ZzZnNDS0o1bXd5?=
 =?utf-8?B?ZWxmTUltalJEbGxjeVV4bWxVL2JhQngvMzI1UThEdmw3TFJYeEZzOWtONU54?=
 =?utf-8?B?U01oUXBydzdYR2c5N0xNZ0l1d1l4eGRpN1RpbHZaR2FBTXpFRVZ0SnhwZDBP?=
 =?utf-8?B?UVIybm1WOWZlR2h6SEc0U083andNbjgxQVNJRjBDQkhDMTJrT0lJMlJhUG1k?=
 =?utf-8?B?clBRRkRJUHhsNWRoTHp3c2c0Y09sUnZVdTJNdkFuMlRHejVXOGwyb0M1NzE4?=
 =?utf-8?B?cmJTWWUrR3hpNVE3ZlFKbGNxcitlZG9kcEpxczRrNUY2Mk91VmxNN1FKUWRZ?=
 =?utf-8?B?eE1iYUhuV2JKaklOazNXSzRZQTdsZVdJWk5OZ2hZcUNmbm83VGFvb0pHUzV5?=
 =?utf-8?B?djNlNkxqZUt5dDdxSDdXS3BBcmxrUzc4OTl0aFNGMkRkRE5IQ1Q1M2Y5d2tT?=
 =?utf-8?B?bG1SeTZpZGY5emRXNUZlT1FOMVd3ZjlCdEM3cEhTb2FQeUhDOUZPUWMrcVAr?=
 =?utf-8?B?aW90NVdUaXl0cE55UlNZSkRuN0gvcXhvQkVORVh1VHNaS1pWOUd1V1JZdTFm?=
 =?utf-8?B?cWV6T0FDYjEwYllSNi9YK3JqdWRRUktQdzgxTzdGNHY2WG1jTzRsRjlKRDB1?=
 =?utf-8?B?UmdLdkJjcUNMeXJEVFFNVEJTc3VsWUV3WXprV09JOFk1VGF1Y3pPOEdPSklM?=
 =?utf-8?B?UE9OcGJQeE9heUkySDRwUXpOcDdmMWkxSGRJeXJkcTlHMmM5V051TkJFbUNP?=
 =?utf-8?B?bDdNUU16NWR5SU8yK0NQZGZTMXhHcHNWQVh0RjdTdy82WWxuK0xIdWFHYW1M?=
 =?utf-8?B?YnRSRSt2M0pKR3NRQjF3VUpKTlE5VFhqcktqR2FDSXQ4NmZpUU43RGNzbXg2?=
 =?utf-8?B?UWxOMnNDcHZ0QklIK0o0KzM2Q1IxTW03RTUvbEwzaUs0ZEpkNTFqN2RmRE1x?=
 =?utf-8?B?a3dkem5qZ2VWMzlyVWp1cE9tbVUzT20rVW9HK09yYmdZTjVVazRDbEJDYjBQ?=
 =?utf-8?B?bTZ4N2hSUXRGR1FhL2xScmFKK1NyWjM4Qm5iMU9kNjNSSk5Mb2I3c2crdGFn?=
 =?utf-8?B?eGE1eHZueE9IcmlsQ3o1bkVTS3BkTklJby8vcW9pSnBrcFcyL0J6NG53a2kr?=
 =?utf-8?B?NlprcG9ab0xrWGZ0SUt1RWNwVHBCVDJ4UllNVzFhOVhFNVM4UUlwZ0l3WDZl?=
 =?utf-8?B?eHU5SVNkY1cycEZOU3RrZ3RwQU9FL2FPRFVkQUxnNXhtQWxCbnNBRUI2SU9F?=
 =?utf-8?B?eUhvZjNmZjM4T2dhZmllQWNabHJTeDU3ZGJ5ZDg5Z212ZDhqVXRKUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2863c0-5478-4ce8-a7c3-08dec72e9e77
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 20:26:57.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bz39AXroJrZ/9zzELL62DE24oIDceMw4cNKj6nnzK3s/pLvanbUFst72MLqbFk8nWBOfz0LvOi+ZlEE2spaLTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3584

On Wed Jun 10, 2026 at 7:24 PM BST, Timur Tabi wrote:
> On Wed, 2026-06-10 at 19:03 +0100, Gary Guo wrote:
>> > +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) ->=
 Result<usize> {
>>=20
>> It looks like this API design is very prone to misuse. Patch 5 of this s=
eries
>> for example does not check for the returned size.
>
> I was debating changing it to use request_partial_firmware_into_buf, whic=
h would "encourage" users
> to verify the return value.
>
>> Also, I think people might just write `buf[..size]` and then it'll panic=
 because
>> `size` can be larger.
>
> Why would it panic if the buffer is larger than the size of the file? =C2=
=A0The kernel API requires you
> to know the size of the file before using request_firmware_into_buf().=C2=
=A0If the file on disk is larger
> than the buffer, the kernel returns -EFBIG.  If the file on this is small=
er, then it is loader
> completely and the returned Result<usize> is the number of bytes actually=
 loaded from disk.

Right, this is not the partial version of the API, so this would indeed not
happen.

BTW, this thread should have been cc'ed to the RfL list, as the abstraction=
 is
changed.

Best,
Gary

>
> This has always been a problem for Nouveau because the GSP binary is 90MB=
 in size, and
> request_firmware() allocates a contiguous block of memory for it, only fo=
r us to memcpy it to a
> vmalloc'd buffer.
>
> So now, thanks to TLVs, we can finally use request_firmware_into_buf() fo=
r gsp.bin.


