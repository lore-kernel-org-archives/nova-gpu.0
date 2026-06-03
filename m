Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DCF30E835
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780462854; cv=fail; b=dXL8seDFgQmNlOSMOXYlWd3knFlzusILtvT5QHojAiq5XIeZJpk8fAA8sUTy1UWICoi/IZTrZaItNk1w/vM1GwPhAp/JR0euznO2ElAxPM9IOQQCJC1D+3y8J05Mut6d2XhIoM7zJdVifwjxUR7AjJs3jYWOJKFs/nwAmxTCBrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780462854; c=relaxed/simple;
	bh=GvEHJv3oNVK5/6e7ucI4FpDNxbcIsTcRwr5Lr+Eceyc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aCxng6+PFMKajt0Nzn+54Fn+GiQdmeHc4hvhriMNIbvomEG6ajtDi+J3sat+lFvnIXqjeeGMeL8XX1jTb6MOc0xWBh3GLgHUzqmN7jTWM2oKlQb47yu1ZNd1/mWO+4OiLKTjkqg0SlKIiZjhFfrKrVxZTldq2uhGs108LXJLAtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A/gtEtIQ; arc=fail smtp.client-ip=40.93.194.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A/gtEtIQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stCXD+Ks00cC0+qPMacbpq/K3zaQcdX+MfI6udWe5rs1KdFzfrph70p0Ve0SdSBglODa8WX7XKVsewvqu171XS5h8wAwsqNYvA3Y74lfBBwDXXpe/Oxwql71Kv6B7IUWSr5kefhfoD36It+MsqGwqGzAJyD8SoPZU5lEIy5TXMpHHBtHg8dm74tot+iXf9d4+NM4A80631Cki85SnwxAJkOti9qMD2ahNDE09Rb8XG6BMQDO/omYnDK3bQFgr9Sb3H3yxZTcmfQLHX4ZRYio+i/YeIEJUKSd247pnwSXX91Kp0tW/TKLHMqVLsRVLiQmP9s3ESEhhg3iUsUilb+cMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s46QZ6pKmKAnYNocnLanCfL4CGdHdhAy/vx8u19bzLE=;
 b=XfAkiDBEGmLeY/1LMEuCmN75xy0RtCvleJH3FUnATPD/75OmS40vRujFIxR/w7Getu/+8WdmFeZdpGErrmMsl+HkX3/IDn8CFWGVVj7WEMPuoMlaH8LCkFLOc6/JyZkdhm0WpHjzPZkmeYmi+X2BcK2Vh+X4JGlTWt45xCN2Qkb7IMjlwPosumewYbZP+NBrxskymVq5/LBlEN2R9pp6ysG+b8xKTqmAvAd5Q7gnZeYYHvuKlUx36sSGI1iM5syQj2cdzKz7fv5QbF81UG/3/zqCBgk+93Znz1ZKwD8tZN2lIB1rtfXgPeqPsvvNWotUiMGKGpmrOlmOZs9BSW7p6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s46QZ6pKmKAnYNocnLanCfL4CGdHdhAy/vx8u19bzLE=;
 b=A/gtEtIQPDyxi008kc+d9j43/pE5tTYKsudKum8J5xhmQqBLAER+WHetRE3Idll81Q1MkuJ2u4KAtyfcmKcqw0qfJLmaKFDN6oahFscdroqJb552x9hHMVpS+jAc9l5aikYtxxDth4RG+6Z63QprVRJZU/GgiZpmm7l0k6p+ZGSeH4gK4eaJbD8+GJbTfZOOkzFqirfdYO+lDm0kMlM2siBZuCFAThTPoInqqyFAMOEmrAr9WN0Aums0Od/DV3VwNkpZiykUq69f39x+bdfsOBXyIcFXeRpPXeQyqgIplfo3rT2E3EfKlkeAxtw0E1OktwEE4L+F8QoTUdbavMD9HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:00:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 05:00:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 14:00:43 +0900
Message-Id: <DIZ5EIGO5AFZ.URLFQS9XRR97@nvidia.com>
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
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-16-jhubbard@nvidia.com>
 <DIYK5AGFFHSP.3PVP7YX854KWN@nvidia.com>
 <DIZ10B6ROZYX.JAM563H7Z5LX@nvidia.com>
 <DIZ55YVSFSHX.22380TVS2TUG7@nvidia.com>
In-Reply-To: <DIZ55YVSFSHX.22380TVS2TUG7@nvidia.com>
X-ClientProxiedBy: TY4P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a62020-6379-41fc-a0e7-08dec12d12b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|3023799007|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tSlExWR1Kx76MgJ4ssXjToqyVHlR5ZLugQjBxJBBqN8dp8EVf/2CDTDc2vFBB18SRr+vuPJ9zOHbnalEYluNA1iERrEK75Ov3OExRmaKlSyZ5L0RBC/FvgPlp25U1cWMkh+KyErW7VM9TsAZNiMolyjOpO80fr7m2lEoZ4oitZP3LmWQIkb/vxhoGkDdL0GwAmx40WEj5JaPhzj92NQEKd4b9dQgEsmtQHKArtmLHBGSrRThH394roXCFkbruZ0GX5iWWSQvqxj2Ese5ciYgdio/aHd2A8AaesV6LSQLzY5a6feesOD0oqhLz9rlFor0+Ii8GVmYplzzAcoMdwdmqusFGzTsNIkRdPKeKXHo7MmM+dDJG5/C5iCmMauUyfI4s0bdQgW93Dkyni2flM6JhSyWZqVLLKC8e3Sy2I5tzvJXpN9vvwXE/52+CYZ6WI4beA1Rg0XPQtpoZfvAyRzY0A2DKANfcZK6gLUihzWeheEpeG9dP8641/UFBl7f4KV6wWVA0TH6Tit+k2MGDaw3yuCl1wLMm+S602nmw0r0amZA14RTHNPI1AGbd/TulULGYdA3NqzXklpOVS+vIAh6bQUGNJTWzNUZ207JAsFisld3F+xdK6JNum0fBcEUur+1zqrfezhVQdaMutWCccZ77hvqLofGPbu+fujU3t57VUMMtIDpCc0O7E1VKiINHnmD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(3023799007)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE52cVZXZStPRkVSamh2eHZXM2swZTU1aW04WUt4Y1ZBdHVnZEhONllEOTFq?=
 =?utf-8?B?VERldy9BR1VjNXZSRDRNTFhOTXVyMFJwK3hSczB1KzlPMU8vQWNwVVY1WjlR?=
 =?utf-8?B?K2dCUTA0NzllMTFoNExMTlVhTlFCVHk3NjVIZTRPQVp5aFVTMlRZeFhvV29C?=
 =?utf-8?B?aHdVR3c5Tmo0eDgwa0IxR3FicC9BYWROL2xHVERKdW5LZXNQTUxNVnlyTFRz?=
 =?utf-8?B?dnRRL1M5VFc5cFk3M0QwRXkvWTI2VXVtcjlsU0N4OEVJQkVwakphUmhqaEJh?=
 =?utf-8?B?aFZQWXVBNXA3Z3RyWHNQemVlWDJlV0xSRDQ1K05PUzEzL1I3dDhuQUxBaUpl?=
 =?utf-8?B?a0c1d3RXNVB5RFVWK1JSdkRGSjRCZWFpNTVIUHlJc25qOEFrS2xqcTB4NWoz?=
 =?utf-8?B?cVFYNFNSQ3d2cytVbW9DM2orVkUyQU5QblI5SS9kb1p5eks1WlpBR3ZvY3VV?=
 =?utf-8?B?R3Zic0trOUVra0I2bFYvcmp3RGJkczFheWFEVmYzcFFvYWZOQk0rbzl5dFYw?=
 =?utf-8?B?ZWhmZmh1WDJvdWhISitGVDA5UzZKcFNzY1JoQi9lb0MwVEhkRmF2UFQyYjEr?=
 =?utf-8?B?S3U3ckRoQURscnhtUDRVVnNvaGR0QVVQcFEwZzFmWHlxSEo5eE10bElQQzE5?=
 =?utf-8?B?S09pU3k1RkQrMWVESGFZd0Z3OTRQSXFXRFh2aFBKZ1hTU3A4NWRLSVFrN3Q0?=
 =?utf-8?B?QVhnUGFQZzVxNS9SSldUcDI5elVwSkYwdzIrdTBranRiT1QyM3hJanJrTkw4?=
 =?utf-8?B?OGU4S3k5dExEWGJGRHgrdTJQVE94b0dEbWxsZjBjdFY0K1V3YXh1RCtNV2x1?=
 =?utf-8?B?NmFOL2U3djR3bmwrUWR5dmVmVnFUbldBRS9VdU5UbDVEVHZicGltYXNRbU1U?=
 =?utf-8?B?RDNZY3JVTTY1N2I0dHd2cFFFUHVJbW5wYWRISWZvbkxJb0NqVlRQQ2k4dXY5?=
 =?utf-8?B?cGtZNWV4ZzNjTGVxUWdwOFRqQjlXbE1xQ0p4SitTdzIxYkpqT2tneSs2ekdR?=
 =?utf-8?B?UnE3QXM3QTMwdVpPcENaZ1MzN2dOcVBVTXhKNmNiZjVnai9aa3JkV3JMNmlO?=
 =?utf-8?B?Nms1OUY3UUFvTVNmaUNmVmxKaUhaZ29ESjNqVkFHTExuQVRKNEcyVGtqWTMy?=
 =?utf-8?B?ajR4bE5QQVFFM0Iva0RnS1J1Z01LeTk2SlgyNE9YRU5pU1c1Tk1qV01XeXhY?=
 =?utf-8?B?Qm5tY1VoV2dQb0hTTTFXSXZNdEI0OEsvck9xbmpaWkxhUkhWc2NnajJEdHFV?=
 =?utf-8?B?YmpHbFBLbUdzNkFRb1Vud0VUK2E4L1I3cWRrSlNSbS9Vbkp3ZlhiNGx0M0xr?=
 =?utf-8?B?anNlaFhpZDhYRndnc3ZzY1hSL2ppQ3FEYjNWOFVKOHlBc0RiZ3liNlpPbzZK?=
 =?utf-8?B?UkFDMHRQbDExSjFWeGtPQ3AyYW1HN25lLyt3KzVkTFhSTklBR0JQOFo2TVVB?=
 =?utf-8?B?bTE0Y3NjVTQzY2d0MzUvU0pVb3RtTllWaGl0YThWZVpjaGVReW5YT1JFQngv?=
 =?utf-8?B?N3MrWVRiNmdnS1RxRENKZXBDZndxWHRtVW1TdW1tb0gvRWZzaUdlZVhBUkJ1?=
 =?utf-8?B?dnNGVGo1NlE5RnFic0p0UGd5KzFHQmFTWnJzclIyV3AxZ1g3OExNRUVTamZR?=
 =?utf-8?B?TTVrN3RjOWpZUmoybEpTbldtN1dZdGdraWp3UXJPM2g0QUUxOFFYMi9BUHl5?=
 =?utf-8?B?L2p2bUd1VVRXUSsxYURIRFpBTnlqckhNN2xKZW5Ha2JuYmpoOGZWR3NnNm9z?=
 =?utf-8?B?eDN6eWh4ckFNZ05JMXQzYXRBQ2h5QS81UCtPeldDNzlHalpoTFRXeXdoMklO?=
 =?utf-8?B?Y2xmT08yN1dpWlJ1WWNWL1dOZTZaSHJMNlp1NGpITlhjT01IQjU1UGVRVi9J?=
 =?utf-8?B?akFVQ2l4RlBNNG9IQ25DS0xvbzFsUk0waWJadysxNFdRM2YrTjFLR0NiYTdl?=
 =?utf-8?B?Y1NVckNTenNJSUI5eC9CTE9hczgwN0dZYldKbzI4YnJSejlrZ0dua0FybHRS?=
 =?utf-8?B?VU1hZUwvaXFHbklRWm9iMCs3Qyt3Y2RFME5RZEVwTDUySk9MaFptQnUrVUlX?=
 =?utf-8?B?TU4ra0RBT0FTZlRRdVk5cUxNb2hVRDlMK2t5dVZSeVFYbkhaMGw2NDhBVHBv?=
 =?utf-8?B?TzUwamFST1JhbjVkOWR4WXZRSzZ0NFNRZDFJTlNRc1gzREJsUGp3UDRzMmxI?=
 =?utf-8?B?cWhNcHNPVmlCNGVqL0RqQ3MzWFUwaU1kOWdjVHRmSEpVTnNLM2JaSm1takRW?=
 =?utf-8?B?RTZDU1psVWdHd0U3VkZWZ3pIL1l3N3FsUWgrMExyV2p5UHU0ekZBend5UnJ2?=
 =?utf-8?B?eWNMYjFFZTdEejVUcVN6cWRpS0VheE1CM1hUNWRzRzVDcUJDOHlEeStacjE5?=
 =?utf-8?Q?jRFe2b3jWnRtYHdnqQZvBtvbBBEwJuJH7U7fPi+0pJpNP?=
X-MS-Exchange-AntiSpam-MessageData-1: PFsDAO+L2TaFBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a62020-6379-41fc-a0e7-08dec12d12b7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:00:46.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPaN9CBID/gt1yT1lD0BuF00B9qzUP6kX0naZM+rqlRAjdRxPYYdOvOagaJdeYmPn9pOk8YrVMXXR/PiynynnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784

On Wed Jun 3, 2026 at 1:49 PM JST, Eliot Courtney wrote:
> On Wed Jun 3, 2026 at 10:34 AM JST, Alexandre Courbot wrote:
>> On Tue Jun 2, 2026 at 9:21 PM JST, Eliot Courtney wrote:
>>> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>>>> FSP communication uses a pair of non-circular queues in the FSP
>>>> falcon's EMEM, one for messages from the driver to FSP and one for
>>>> replies, with the driver polling for response data. Add the queue
>>>> registers and the low-level helpers used by the higher-level FSP
>>>> message layer.
>>>>
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>> ---
>>>>  drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++=
-
>>>>  drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
>>>>  2 files changed, 80 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-co=
re/falcon/fsp.rs
>>>> index 6b057d958115..0ec1c55213bc 100644
>>>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>>>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>>>> @@ -112,7 +112,6 @@ impl Falcon<Fsp> {
>>>>      ///
>>>>      /// `data` is interpreted as little-endian 32-bit words. Returns =
`EINVAL`
>>>>      /// if `offset` or the `data` length is not 4-byte aligned.
>>>> -    #[expect(dead_code)]
>>>>      fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) ->=
 Result {
>>>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>>>              return Err(EINVAL);
>>>> @@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, =
data: &[u8]) -> Result {
>>>>      ///
>>>>      /// `data` is stored as little-endian 32-bit words. Returns `EINV=
AL` if
>>>>      /// `offset` or the `data` length is not 4-byte aligned.
>>>> -    #[expect(dead_code)]
>>>>      fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8])=
 -> Result {
>>>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>>>              return Err(EINVAL);
>>>> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, =
data: &mut [u8]) -> Result {
>>>> =20
>>>>          Ok(())
>>>>      }
>>>> +
>>>> +    /// Poll FSP for incoming data.
>>>> +    ///
>>>> +    /// Returns the size of available data in bytes, or 0 if no data =
is available.
>>>> +    ///
>>>> +    /// The FSP message queue is not circular. Pointers are reset to =
0 after each
>>>> +    /// message exchange, so `tail >=3D head` is always true when dat=
a is present.
>>>> +    #[expect(dead_code)]
>>>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>>>> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
>>>> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
>>>> +
>>>> +        if head =3D=3D tail {
>>>> +            return 0;
>>>> +        }
>>>> +
>>>> +        // TAIL points at last DWORD written, so add 4 to get total s=
ize
>>>> +        tail.saturating_sub(head) + 4
>>>> +    }
>>>
>>> In a later patch, `send_sync_fsp` polls this then calls `recv_msg`. But=
,
>>> structurally it's possible to pass in any size to `recv_msg` and read
>>> more than we are supposed to. What about having `recv_msg` do the
>>> polling to get the size and return a KVec with the read out data,
>>> instead of `send_sync_fsp`? `poll_msgq` could stay private and we can
>>> make it public later if we need to.
>>
>> The issue I see with returning a `KVec` is that it imposes a dynamic
>> allocation for every message. Granted, this is what the current code
>> does, but now that we have this `&mut self` logic in place that
>> guarantees exclusive access, we can also turn the receiving `KVec` into
>> a member of `Fsp` and keep passing it as a mut reference to avoid that.
>
> I don't have a strong opinion here, but is having a dynamic allocation
> for every message an issue here? AFAICT, this is called once during
> boot. But by having Falcon<Fsp> decide the allocation we make it
> structurally impossible to provide a wrongly sized output buffer, and
> remove the need for the caller to separately poll, even though all it
> wants to do now is wait for the next message whatever size it is. What
> do we gain by delegating the polling and allocation to the caller?
>
> Anyway I don't really mind, I am just trying improve my understanding
> of the conventions for how much we try to avoid allocation in the
> kernel.

The FSP is also used later as the system runs for power management
(although not by this patchset), which made me more wary of doing one
allocation per message, but from what I can see it is never called in a
critical path (only suspend/resume) so I was being overly cautious
indeed.

Not having to worry about the message buffer size does simplify the code
quite a bit on top of being structurally sound, so let's do that!
