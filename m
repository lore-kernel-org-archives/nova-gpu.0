Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022134.outbound.protection.outlook.com [52.101.96.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04332B112
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946112; cv=fail; b=RRvwNxK+1AnM/jrPPrSeb7nv2sWJQDM19yIRBJKeejaEZ0UkEYY9nKsPNDZIdQ5Q5Dvabad/DN0lYNxDsKrPdGTW1hDuUFMWYHkWmWBwjj+l6Q8j6n0Vg5KK4boPHlYmheWloByBznMfCxcCTe9LnLZ2ydT5A90lueFP5AKBde0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946112; c=relaxed/simple;
	bh=D7fyWBgkqrXus/w+NnOZeCqD3kDwp9QkYGO80Yy+ZWw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=jD1G/vMnAiQs3C/NLVZ2H6iL3BPBsjyBKhLcuNhy4ujCmpi1vrJrPT6uVGiYbun1PYPa9sxF+InvVUP3iZX1I9+Pda+rQ5Cy6lydsqof5eJTXHsF6ci8jPJU8xyttUJgtdwxUYxFqSYFxGJX5kCjDkDmFwJwFpYYLFw/h7yeFeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u6B/jYhs; arc=fail smtp.client-ip=52.101.96.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u6B/jYhs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujF7RYp7m9yZENIbNVzS+obbP1yYi0te45zHrsfYw4KLoV4bdL/e6qCEG9ITQ/i/EDd8Fi2T8T6z9LVgMkdzkEe83WyQP6UtyP7fyfQ25SdN+QmkAlz7hWLDNXU9RxMNYE/k5u3EnKSSOS+LBqSbd+R1gDzkrIKB0jDP5rpmUtNoiei34OyjiiIgYv9ZP1295jr0kvZ9t9PdUlKoe9ssi6FWdVJkSWNbZOglWLwSUuzt0gmprptwPWqMAXkqOJByva1APvT+N6Mn/PXfiSqAbq5iMNktzSMT3dSHl86TwoTwwLSUpCoB8iOyLI1nh7RCQ7CBwfIq+6qQ9jD0V/ICYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7fyWBgkqrXus/w+NnOZeCqD3kDwp9QkYGO80Yy+ZWw=;
 b=Wp+bPxpLkggXyCAsHvJ6ofwOfzisKhaCxMCxzptYb1/95dLTW4tDUnJ6nPZXDIh+T3gAF8vW/9cn3IrlXErp7bmMsHELTrMXk6E/UR6phyLqbmfjVtxGigAUJIqcFUrmg6EsxSuoiQUMsKFVgt+JOEGrD7pIR3Bo7YomMLWpIto3u+O1CaN4mZwJpzIpRqxYdCynUyow2kSHPGTaJ0A3PFmwav8gDYkxQlYqQCwyd4bcHC8SM84rl2sPiU15t4TpAvq2duGhkY0hOYoPLysuAtO6qememazg3BUA77PGaVDRCmE5L5ufdE+sK3yWQzu7T/dHd+cxNjAnFKbK2Lohlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7fyWBgkqrXus/w+NnOZeCqD3kDwp9QkYGO80Yy+ZWw=;
 b=u6B/jYhsdU78zBoTI5npxPyzV6NgkTVHnbiNlraI/UcJSMWLycIA81Hf2wLVcitUQ/fjvj5i9NKo1ycD/FAG+5hgW6phfbuq8fVhzL51z7DkRq7kyaveAKRofO9+sqWi3WwYhCj2l4yggxGwFELkbgoNyOsQaq+FUJVdzdbBlSc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB5734.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:01:45 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 13:01:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 14:01:44 +0100
Message-Id: <DLUDEQ98TSVG.1A3CFN13EIPN@garyguo.net>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
 <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
 <DLUAPXVM7NYD.2DOV5B2ALJ6XN@nvidia.com>
 <59900705-fadd-46bb-93eb-8f6d8e7be551@nvidia.com>
 <DLUCD1R3Y143.3BVXITEPZYCPR@nvidia.com>
In-Reply-To: <DLUCD1R3Y143.3BVXITEPZYCPR@nvidia.com>
X-ClientProxiedBy: LO6P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 10071d08-5587-42ea-a4b5-08df20854fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CqG9LdFdibobgBAY3b/T5/hboFaOSe8nlgl1IjXmMfBMRaNKZxWfNGFRaFAigB3bxuMuKQPs8OjvkaB8a/UmgeiSuUOcI9NFvEeWoH5ZePiGe7oy9sF1IexlPi+LyQpMVelgLv3r9vfbfa9FMl7P69q452BuO9Ao2b7hG9tRzOBQqddimjq//0Jdifk0hexbZMnOsK0/CUj21tn2lzuQ+i2iMmf4k9xigcZCdUHYeTRDFYp46ONf3N7dWiij/hLiNSpy99xMle/hv5V0RRBlZWXz2D5P2upO1/lr5FFPKxDAZhrv17IfqZtUOSxqF4MXsns4x9w6z+v7ldXQ10nqJHWerzFnDEpRrBVG+TlevOT3ARVEc844ygbz6Ur6nzrQ3iqKbtCiUmIHgQfDlbQcbADhEi+osa8W2yUdROJmaA3w6F/iwmP8dCylBYGQwuCw9P65eAaIY/gXmhNbQLha6qPVja9VCN+d5QeSrNarCbt3Tm4fTaqz37iutuBUaXz+rY7EYDGpZ4maV6Ke3yIVlx9XRZfIhnA5dbHXi331WhfdIyK6vzjy+F4ofAi8IqjcKtafD2oyGCzkHPPxwP7dRHr+3PCYXOOfNLLAcz/jp1tU1TW2mL5KR1od8iz3C4dDQT+m8mg+iVkEB+iLQp9qkvKTcID/PWWXm+vsY7TgxMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFBiNElnNFZ3QTdwSnBXMVVIR3BVSGl3UHRoczZ4cWRPZGdpVHNIM2dZakVl?=
 =?utf-8?B?V3dkNWFmTHEyWjRjOXV5N2tLSTlYMDNST2hNS3UzdE92ejdUb1ZBa2c0cFdp?=
 =?utf-8?B?ZTkraDU1UEZLK3UzL3hpTFZhV1F1N0ZFQmNtRE5ZOUZPekQ4ZG9Jcng2cWVV?=
 =?utf-8?B?Z3RuOGwrQVJSR1JxUFdPMFV1akk3S2FQUERPWmhGUDVuZk9OaS9zUXpKdzRQ?=
 =?utf-8?B?T21FdWVrdFFNSGppSzVmc25VZkRkb2JmQkdlajJKeHVpVjFRaVJNRTVZVzZG?=
 =?utf-8?B?dnhwbjZ2QjVkMzR2QSs2Vzk3WHByejVKeTMwWEc1Z3hpSlVxY3NNVDI2UE9j?=
 =?utf-8?B?eFZEcHBaVUxWaGRORERlN3FudHJpaUJqT3JVc1VuUHB3a3QzRHJCOHhyb1Nk?=
 =?utf-8?B?VWxiZFdsbEY4aW1uNFhscTNKZHdXU3dBMHVkaDVxRXl6UnFBc0g0akNXNzVi?=
 =?utf-8?B?K2NuK0RCSnBmN0FsOFByUlpNZFEzdTA4aVN0UGhtWTgvQ0RCbC9QQjRLYUtM?=
 =?utf-8?B?cWtUNDRxcW4wMDM1dkhSYllpa2JrMHRBbW1DMHhtWDhCUFZaWXQ1TE0xZXho?=
 =?utf-8?B?VnhSaDhHbEJmTzFGd3A5eWFoeDZWZFBTL0dGa2Evc0NHelZ2OE1iLy9vaTVN?=
 =?utf-8?B?RlpGZmVFV1duS0l3YlVYRW9uMmNHWGl0dWdDQ3BvU1BYMGVCU2FPSkxOMTM3?=
 =?utf-8?B?NUtCWGlBM0dnTXhpenNnZ1dmcU80bUo5OFg4dGNIVCtMVGNiWmFYVlNKdFdn?=
 =?utf-8?B?bWlaT3c2TzVBRk9HSGdPMGtBbkZmbTVISGhwMGVoOEdhcU1CWUc4K001U010?=
 =?utf-8?B?dFRNamFKc2o3aDM4RTN0Zm5WWmtmZ25mTnUyNVB6ZytzeDl6OStvbFd5MWdJ?=
 =?utf-8?B?TEdYU3BPZlpRb05XeCs4d0hleXJ6NDM4S2tmckF6ODFmYWJ5TzUrUzdsMW5k?=
 =?utf-8?B?dCtPdi81cFlqR280ZUZxZGptamhjZ1RyN3JraEVhcml0NWtGQWRUTWZsdDQ0?=
 =?utf-8?B?cXBFZEJvWmI3T2kwMnpOd2Q2MTFyNU15aFhScnJvc2hwK0VaYUhKUTBuOHRa?=
 =?utf-8?B?a2YzQ3BMV0NZZnZZYm84VHVzZ05rWXZaR0hadEt1VmJlSS9NUzk4SUkzS3hy?=
 =?utf-8?B?V3RrOGgvTjBHc2tWNnRqUTA4bjlNNExvc0FLWHYzMkZIRlpBUmVJbWVpWmJP?=
 =?utf-8?B?Uzh1UVZrbnQ5N2JhZXQ2bnFNTHlzanN2d3ROUTNCalpZMmwzb3huZU01TzNQ?=
 =?utf-8?B?MWJXY1dmTmhOdldyd1hlRVZ2VHhiZDM4Wmx3ckhFQ2xOYXUvTXdXTExEYVhI?=
 =?utf-8?B?U1pka25PaTBYVkpzeUpGN0NONnhEOU1nczBvWGR0UzR3QnFEd2hCVXpQTEtq?=
 =?utf-8?B?MlFRWFdCSW10VUFzdUtPZVJCdjdhWFAvcjlWRFZmajBlNHJyWloxR01DM3B1?=
 =?utf-8?B?Q29UUk40NmJhbTdCZGpIQjRKUVpWSU15eTlqRzZBWmg1SzN6WUwwMDFGL0cz?=
 =?utf-8?B?bGs4TEkxRktZZG5uV1c3Z0x2MytWaTJ5cm1DMmIvNnNoODhoV0ZLWS9xSzVT?=
 =?utf-8?B?b0pERUNzNTlWMnl1Skx1ZjhMOTE0ZG5RS3ppZndHcFk4TThRc2txRGZERkx0?=
 =?utf-8?B?VTJTclpQeDJSTVdEVzRPaGg3Vm0rRjk1bTd5cE81bHRrL2RCaEhKb1VZS1FS?=
 =?utf-8?B?VjBCaXlvUE1CSWZVTnloQis5QUVNWXJhQ2k4eU9QYndYZXlPemN0czVJL0VK?=
 =?utf-8?B?Wjh3Q1REaTVBaTV6WXhWTDNWdnBKVjlydU9QTTk0MGV6SjRmcTdMUUEyVk9L?=
 =?utf-8?B?MmRCdTlLNyt0eFNlcm1Ecm1Md05tQzFjdGkvaHJ4bU5BekVhVk5rQmxCS1dr?=
 =?utf-8?B?aElmY1hUOHZtLzJVazV0KzZQdTV0V01RZmxZWGdIcnNUNXNVTGIwT2U3ZmxQ?=
 =?utf-8?B?TDNmVk5EUDkxMUo5QTFjZ3hmK2JObWVJaCtoY0VhaDBoWXlHOUxsZ0dkaGVW?=
 =?utf-8?B?aDRtdjdJdjRlNmRCZ3RDQXhLRDdlYlNqSGJDcGpiVWRrZVNRaWZxMEVkK25w?=
 =?utf-8?B?d2pnckJxODFlUXptQlZUSUlmRjBqaCtWbHRZenN5ekZsTFZqV1FvUGR3SllI?=
 =?utf-8?B?ZDErc2did2JVeVlhZkVtY2E5TDlsTUdTVjhudk5HNUlWZFA2eUlKSkFHNU4z?=
 =?utf-8?B?bEZUejZPVTNSS1ZUaFBrOThMQUJ6ak5pcHZvYlYyQnE5SVpvcnNHbk1neDlj?=
 =?utf-8?B?N2hyM2IwY2FqNmhWR2JLdjNhSGxtTUF6a2xQd0Nvc2NGYnRwVTl3bWRWYlE0?=
 =?utf-8?Q?21a81vIGJxOfloGsuj?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 10071d08-5587-42ea-a4b5-08df20854fbf
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:01:45.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCt/xeKLoajo3ZIfCyem6qTNv5uVUWvEZzcUhypshqWU6IlhC9cIHN1TWb0O/F8+kSeLR+Iyyxh9o7SgG96fCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5734

On Fri Oct 2, 2026 at 1:12 PM BST, Alexandre Courbot wrote:
> On Fri Oct 2, 2026 at 8:13 PM JST, John Hubbard wrote:
>> On 10/2/26 12:55 PM, Alexandre Courbot wrote:
>>
>>> I will drop this patch and replace the code using this new method (whic=
h
>>> is just an optional probe-time self-test) by a polling loop on an
>>> atomic. That way we can wait for the helper method to be available and
>>> revisit this with the proper type.
>>
>> OK, whatever works best. Just in case, I did stage a fixed-up version
>> of the patch locally (in case I need to send a v6), as per Gary's
>> recommended Delta approach. It looks like this:
>
> It's your series so your call, but since the elegant solution will
> involve using [1] which is still under review, I would suggest waiting
> for it to introduce `wait_for_completion_timeout`, moving forward with
> the rest of the series, and revisit using completions once the base code
> is ready to limit churn.
>
> Otherwise we are at risk of missing the -rc6 cutoff for this series and
> that means an even busier next cycle. The polling code is also simpler
> overall than using completions, and for a probe-time selftest polling is
> really not a problem. Nova is not losing anything by not using
> completions for this.

I think putting it in without `.as_jiffies_unsigned` is fine. We can cleanu=
p
later.

But the code shouldn't be using the postfix `.max()` for clamping and shoul=
d be
using `isize::max` or `core::cmp::max` instead to avoid confusion, see
https://lore.kernel.org/rust-for-linux/DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.ne=
t/.

Best,
Gary

