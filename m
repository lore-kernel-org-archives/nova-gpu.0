Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390778;
	b=olyjmOTOKbF4yEkHbndcTkwHpgtyqc49Tt4U40xvBx3V1rk+TBCcSeo0C33pMcLK8H/5
	 n+KWY0ju+nRBuEM2P6Y/TSmgZDWXp//lOysMePJKcLmxULvxQrcPIRkHEzOatnfgaxAMd
	 /JqMg86cpgugqGMyrN+ptam9ypYUkNe4NIl66rDvBr07Nldec6bBS+gFbJVsdSB6sXFBG
	 O5fGVOE7Rkhn8PA5GT4dskOuED5L9I+2tWsQTpNT7jThrkbKvvoBIU2FDhrHnDAZObDAt
	 cyJA6NaPGU3fKfM3ykzRrr+wNdgxLrvyz6h4shxjXPrJiXgdlluHsednYNKaam1HkaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390778;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SdhRWh7k3xNLlyD+HHTgoBv1iS6P3q5aSPf/cstv8hI=;
	b=Y3rDT3n7RFt4AfXiSGN//x8/kmsj8QDFwwNf8SJ+QC5c9kdqDleZ0WaLTCYf2gsVEJlb
	 y/NVL3Gt//fqoBGRoKD2b+0/GUuAnH94FMNuGKe9BqWGFrwLFqYAtdiZOgFAJu1A90nO3
	 bAdVXMmjGxrfu4r/siBlBnTCoJgc2NRYRMzW0zMQPTCk5elUfhBz+63margpC6EWMhZyR
	 sZceqZSQ4XwtOOwAZUlCI0UbDkxb71SAQD6CXwdGAy97fW3QspIVNtnwwsM0KwUTVyw1q
	 dBfCfR9jRK6fHzpjGnL7NW08VptsoCDaBUxnLN7bet24pOJE3M8CDK/bGB/ob7UU9lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=g4FUvZ34;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.91
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021091.outbound.protection.outlook.com [52.101.100.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C6606A324
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5C6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=g4FUvZ34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMXZ/Oye61TAYdAPxhvHCmyRPGAPm6FVIGkRI+pb3mZZja2ojRTlZpkVtyBht/W7KrnJrk8xK3aNMpK3rKCIcXLGkM+JWLtp6IHxwCZDEg80mC/4g0j2x7D/gFcq6+fDi1ocwaCbJ+d+HaJdGIQ/Yt7Juu01ovwA3/rT/dEvufA71CZPg5spXTS9lGBTqcBhjJ5uE9xrLcRj2vQWI5YH8WwoS9ZxPZ21iA4THULLb9KQ+vznGD4dC7mrAVwnXbUKG6JCfZnf1AyuLJ11km0eZvWHgQs8WJ/MtJeYginfaPeiNPTMOcYnGJZChUMPumCU/MUstXVPQTo9nBoMsquCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdhRWh7k3xNLlyD+HHTgoBv1iS6P3q5aSPf/cstv8hI=;
 b=l65FSyfi5xar0A56VvueqaGcPoKhK16/LiIEpLYy3H4nysE7e0U6QYjjImz439g+8RLpa2vPjjgGsovL2zvIkftxBpOXQGcCjr2Qt4YcUgnRaKIxxaZpOMXgAmcVO79jWkDB+Id5RYBVGMM1xi+2VwA6VqrEKpfbbOhkSfsaOMxQKUD5XV/2MQZg82W33qwfNZzcxBHTU/dyQySBb5KcCviS3IEr66boe9b42WKDmgw2kUSPEdKhyWVFtn6aBIsSGWtxdTImY7sDsJHBCD6dkNX3N3q67oZHharQPU3uKJU5aoqc2W5c3tAv3EN5NXnff587hi83hkIMRYyxkRwAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdhRWh7k3xNLlyD+HHTgoBv1iS6P3q5aSPf/cstv8hI=;
 b=g4FUvZ34czqr0MEu/XOpdt241LSXkR2uNlthbiohrgXP8XbqcQzflFAnNlMWT7XU2reITmvy0BRix74aVOJgxr2OHYhrNG/XLhjAH+gkzkws1LHrq56/tnCOel0vI5kRohksJQr3aFoeB+mNfQGIOhufZiSvWTBpuUN14VLYfoc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LOBP265MB9156.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:52:53 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 09:52:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 09:52:52 +0000
Message-Id: <DMSAFWOHB29R.3G082C94OM7AQ@garyguo.net>
Cc: <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] rust: drm: return impl PinInit from
 DriverFile::open()
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <daniel.almeida@collabora.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <work@onurozkan.dev>, <brauner@kernel.org>,
 <lyude@redhat.com>, <j@jananu.net>, <alvin.sun@linux.dev>,
 <deborah.brouwer@collabora.com>, <laura.nao@collabora.com>,
 <beata.michalska@arm.com>
X-Mailer: aerc 0.22.0
References: <20261107021427.2105374-1-dakr@kernel.org>
 <20261107021427.2105374-7-dakr@kernel.org>
In-Reply-To: <20261107021427.2105374-7-dakr@kernel.org>
X-ClientProxiedBy: LO4P302CA0009.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::17) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LOBP265MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: a48d2c6f-7acb-457a-f21f-08df3fd98dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|10067099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|56012099006|4143699003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	T3tEAce0qjQXdMNN0Ivc1G/qXpMEwhNjtdZBPjjzBV2tihG/UXVM9I2/f3UYmhQAKhrF+2lK0N8t+c2VL32pXtggojSq2gAb3jR7+mXJTS9CWWiaj8KdxEjBePhc59g49zBnXksWZPf011lCZ0X9rCMjqKal5yGPhbd57vGku20APqi1p80gMltaIpaq8hzrod4gHUPtweOqW1Ti32wK6/AhVxWlvv/EatNVmEhA0CCVdki+c4cUvtiznZVIyv8KFBfPYrpjbu0VOP1YQqY/LiVyr2AUB4cgJiSorho21LfPBjwUwJpYkQs7xEekf6M3XmFPwOdji/jsFMF019Cip2tml2w/2ogWFNFmI5XmPTfP8hDaRz8vp9SdEXGyJEzrrCQ6qc6mvVoE05D/ZtMGc+WYtNftHpM47ws2qXLOvCT8GsmAo/kD9Nwdgt93eiy7UGo8N6lLlqi7y0IV7ZG93EAgxX0KI8FS38JZToRK9LtPoXqT04rRaGwMBM7q9OIgrkRpS4iMMmJpiBXoFEeDcreFAZW6r5tM0R2NagpH/zkNJ+x8ZYkBELvVCRygQDEuIqJVlHnTXkyO3S6Vb0zAK35JOtHFeogQ3lXtVorVGTEAfAWj4jjDaSZcuiVIABaWAun/XYmYjxC/OKgqjrXtU/EcfcqmkjeubX49uiJHwtkeXCA322cyAaGgqWEcawx3bBi0LnUP2k89asz75oOoVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(4143699003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1JXWmIrR1FmSGxzd0J5bEFmdkNReHFHMDUzaHJlZXo5cnUyVUlnNHlLL2N6?=
 =?utf-8?B?TDkvMXRhZVVUUDh1bDdKQnlDWnBBV0hYY3ZEak5oL2MxeE1STlc2a0VqbXR6?=
 =?utf-8?B?MlU4UUJGcmRMYm90anNQQTBGcjlJYmQ4WW5JSThmSVo5ZzJJTmN5SjArdm5w?=
 =?utf-8?B?bkRwOGlHZk1rcjV0dFdBWlRmbHBScjcvaWVkMWlRcG51d045V1hwVlF1SjVq?=
 =?utf-8?B?dTlRVjIvdFNEaUFDRzlYZXZsbEFsSWd5WFpYZGlnUjZjbWZPdzZ1Z2R1aEJI?=
 =?utf-8?B?bUxOZE43blhyNlNHMG1jVHVmQlBpRWRvMytUNDE2cDQwUmN4RDBvbEU0amJK?=
 =?utf-8?B?NjVjcS9FUlRZSHgzaFd2THZpS3ZsR0xvQ1loRUw4WnFGRndDVWQyekE3OEZO?=
 =?utf-8?B?UnREbE1iSUxsNkt5aTJNTnRwaC9PL0xmQ3BoUTYxWHAyajY2cHBQWDBHeWxQ?=
 =?utf-8?B?ZmhIZFJQSGlMUWNqYTZXaTQ0Y2VoQzhHSEZhRzFZWUlXUVZ3L2RLOGdZN3o2?=
 =?utf-8?B?Z3ZDaERkOUM2ZmdRSHMyaDluMFJ3bGt5WVJ5SmxJNGhtZ0cxalpuS3ROeC9P?=
 =?utf-8?B?RllJZXdCKyszTzBReVFTMlREOXV4L212UnNYLy9lMW5UU3E3Szdlb1RXNXcv?=
 =?utf-8?B?eUhLdDBhOG1uLzZTWFJYRTZmelFwVHVQUTgzSXc1cTlMcDJSd0FhNWNLUmFC?=
 =?utf-8?B?UDBJdXNOOER6a0h2VjFrZ1p4WG9RUWRNR1FhNEdhYlE0SGR3UVUvQ0pNNkZ0?=
 =?utf-8?B?cU1LNkNRTVRwQi9BdHhzOENWaGFEci9MTWlOZ1M3dGg5Sng4MXFDb294aHBQ?=
 =?utf-8?B?TENlQ1VOYytsWkFJNlhrNDEva003MWxUYWRtTWYvM2tDTUZ5K2U5R1V5Wmlx?=
 =?utf-8?B?VVl0MENxM3BJdE0rM0tuRkRuZmpXQzF5SGdqdDZUaERSY0pQRGUzNGtoUXox?=
 =?utf-8?B?TzF3VjJBdm1KNWMzbThqSkpkbzJ4NVVFMWRCVXJWYzk0bkdRcWlQNlplN0d4?=
 =?utf-8?B?N1FKTWZlbzZFd0lWc2llWVp1eURGcWVpZGlKYmZsaEtmZDRiOFFpaDJsaGZF?=
 =?utf-8?B?Y3ZBc1FKWW5aT3ZlZi9uZDRJWWJWTDZQSkFnYmJnUGlSL1VEeHBaMXA0M1Ax?=
 =?utf-8?B?K0x5VTZSUFBpbGd6c2N6blNHd1RLeUZkZEtCTmIvZjh0N2RSS2QxcGVwQmVG?=
 =?utf-8?B?SWdSYi9qcWxxVWVRVWkra1ZtTi91UGZsd0pnWVg2aFd6VkNqZ2t5VmZNN0Jk?=
 =?utf-8?B?M1VqODZIS05zaDk5MlplSXYyODM2czRrRERBQmQ4cXU2UkRBc3B2K0RHRURJ?=
 =?utf-8?B?U2x0STRDaUJoNHcwSlFDTFV5T0hMeEIzbkJmeUIzc0xRS0FyQkpLUjVQMnYz?=
 =?utf-8?B?Y3FCOWJML3RtYWZhaFQ2RjhiRVV2a0h5QURCTWY3aHdJaHlIdmlobGdOdGlO?=
 =?utf-8?B?VG9YMTdsVGl6alM1NUtROUMxc3BsYjJ6OUdpbERrdFVNNmw1OURId0R4d0lB?=
 =?utf-8?B?THZWUURBZEMzMW5NaERBSUNlemRzZHBOdXNOUHY3WmVNZk9PTWJYc1N3WU8r?=
 =?utf-8?B?NnZxcEJnSFRBTUZDUXNKT3JOUVBSR2ZmMjZsNkZkMkVhYjZXUkVBL0hGVE1n?=
 =?utf-8?B?WVQyRDUyanFVQVhaYko1ejM1ME5EMS82VExleXNPdUY3d1B6NzlCdlFsVFUr?=
 =?utf-8?B?QlIvOVFYQzFRQ2JnVXFhT1F4eW9MeE9DaVNRN0tXeEZrVHdtR2UyTEdLTVQv?=
 =?utf-8?B?ZTF5c0VoMFEwSU1WNGJTeUhwZGtqaE5YM1JDaTU5Qnk2VGVYdHl0R0hOejA4?=
 =?utf-8?B?c2Jxd1RUQmZUcm0vb1BXSW9YYWZoWE5VM2VLbmw5Sk5vNDB6UnJJc2ZLN3hQ?=
 =?utf-8?B?NzNqZHR6WWVEZStsYkoveUxROGc1K2taSktZdnR0R0ZQQ2VGQUUva1J0L01h?=
 =?utf-8?B?TkdieVNOOURSQ2g3MjExTXcySnYxdEhuT3MyaUpSMVd6TTYwWTZ2Wm1STVNJ?=
 =?utf-8?B?RFB5MVIyRmNBNlFMcGJtYjR0WU5RQm9JL2RkUjVMN0gxZk5aNnM5aWM5MGF0?=
 =?utf-8?B?UUIrYVZ1QlZJRVRzYzVORkdkUFozM2dPUjhPbmhXL1QreTYvakxPRktpTVZV?=
 =?utf-8?B?WmdzeDBHUHY0TTdocDJrOEFIWW9MWE5leXE5U21Za2NVb3B4Ri9oNzY1ZG81?=
 =?utf-8?B?MVF6bjVYSDE5dmZvS0JwZzdWaTl1ek9XVVhLa25iYXd2UklML1RTUEFFRFNO?=
 =?utf-8?B?NFVDdUR5NEo2RzhPd25ZMDg5MHBqYnJyenpxMy90RFhHbjd4N29uMzlaRGk1?=
 =?utf-8?B?c1ZHczVCZFV4VnNzenpVVTdidWk4cEp6cHprbmhna1lxaGliNjh2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a48d2c6f-7acb-457a-f21f-08df3fd98dc0
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:52:52.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03Cp5hXt1R1rF2VyxVc4q/mg+Ci69BmDbhL0b7L7o+flw0DnihuXevwX/me+llBYXdIL60UI7b1iA+sC5LHjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9156

On Sat Nov 7, 2026 at 2:03 AM GMT, Danilo Krummrich wrote:
> Change DriverFile::open() to return impl PinInit<Self, Error> instead of
> Result<Pin<KBox<Self>>>, consistent with how bus device private data
> works.
>=20
> Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
> return an initializer and the subsystem takes care of the allocation.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/drm/nova/file.rs | 5 ++---
>  drivers/gpu/drm/tyr/file.rs  | 4 ++--
>  rust/kernel/drm/file.rs      | 5 +++--
>  rust/kernel/drm/gem/shmem.rs | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)

