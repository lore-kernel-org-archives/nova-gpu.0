Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227838;
	b=WQ9wMaRV82m/hL0vFv/cXWA3LeZs302BjgULl3KtvmPu/FBjb7OsvMI+buOiz4bgjoIl
	 UVL8Iv357NNN5riaN4mjDZ0FM3CcKd9kUEEeKFWCDHC9ECrd49wgjAc806P7UVFX9yWT+
	 VM1SxuU29/xJYPmm0bzgs6wGmWNP/w3cOW1GzpA4Wi+UaitafeieEsp3Xvslo3hfJW79s
	 RZsJPcpG2bJTLyHLuueXRmEkXgeKSdsFazHySeAUVeNexHbKEok311GHbtKTATIEqiBNS
	 7rf/6NL5yZr+i8BphsCScs/y6zPelW8uGhYX4uZ6Oca2UZOElhvzKbt2I9kroxct/zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227838;
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
	bh=CmrSTBvlN3t+hFkXyprSXOlHUz1sQ1YaSiKvtnWVbHY=;
	b=Rsiyxp+MUynHuwSd4Qsx/PKwza49fNJ2MOndUnTsMfq1AiyNe9kWeihJBAgkxE2uBTt0
	 3GBWlw1Y+P5w5gb3y7LliauR/CPqce/aNuSaEPrsuMVDRs5Sw9KA0jOcMmLwWQStOS/3i
	 1/vAaVlDq473o79+kIQLd2sliJbo2SzqaA8enBI67HKJOXuI+UnvcAPP41g4sOcNNmjv+
	 ub8L+1NQYqjT0g+UzVfEF+z+kFzSfeuJBhm02zLIU1YHbOgQgqqJDl5ZRkC9kTDbpwnXq
	 Tpv8A5O0lm1fTnJVtsg5tr6PE7HcuqQVbViyx02PQrTZMFwAEkru5I5q2Psy+Gn/t5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=YUENKaBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.110
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022110.outbound.protection.outlook.com [52.101.96.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269A8606A325
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 12:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 269A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=YUENKaBj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQOpeOFMHs+wIuERu6ary55TTrfeDB2rO9uVWYa4qphz7nYiHQM+4VC7CuyCPTqFoiBNoFBeIVpZwF9gXVw8n9rhg4kbAgYOCuO2SGGBzQgHP3QmmSDX/Dm1TX/wm1x5LiBy+Az/w7B7Lzyy5GfbFqBit99nIHzdhkdCwFb5YDszhzCAHsW2H3wPwRb3of8HUc1QeaX8SMoWtwoFNw3pkP99iITD6KQwF+SK6JXtfRXZvc41kFy2dBLpGjxjYiJr+9fdW471x8NxrZiSN+d/LR548crWl9KLD5ErvkG/GZSVhbgSNG1swjUCui+riyTFZAnOB8HH59wf6tZP1aT7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmrSTBvlN3t+hFkXyprSXOlHUz1sQ1YaSiKvtnWVbHY=;
 b=Nv4GG+cNlT7cHAazfeSMrx16FCi5YaH/MI2yrfsnPUnqp7c3fcNZGAja5/GiHeQupOpN0V0gPMZ9/5mb1GkTmnuWdEKO46CoLzNub2aECAm0f7+9BaXNN0RqMlFAgutE3K5Wokp7iEGl5snBmL9Sf2+ZgIwKsjt+/Ei821XR3HUOV74QxVg2wYhZoCXI78X4aUNJ0B94Y2fwKkW3q3ZhEhIsplvyEqAj52OLiGugyGUGMdwejEUvoHEWIKVnNuOGVJEySKrUZxUOzMwkSWDLVdYN2IVCICipJ61Jgolzi+ItFhp9pJ+zoN9sTa0ewjE7FvOQ4EZ/m4/84sTNi34CyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmrSTBvlN3t+hFkXyprSXOlHUz1sQ1YaSiKvtnWVbHY=;
 b=YUENKaBjqJtyaPaMt18kahIROdsuHCbwy/1u1iCtNRldVp9WKnDMHGyu2MPHbI/O6H3aAAYexNN4gqPi+Nqhc4cDIix11SInp2mmve9nzCGYfhFJ0TZVLExitBlffx1HlK/WQzz4iupcpj8+BbOWT7aggKUFReqGte/qcULGK+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO2P265MB7275.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:375::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 12:37:09 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 12:37:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 12:37:07 +0000
Message-Id: <DMQOOL2F4M80.2JFB5YXM2J56X@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v11 2/5] rust: gpu: buddy: use Alignment size constants
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0
References: <20261109-chid-v11-0-082aa9bf5a91@nvidia.com>
 <20261109-chid-v11-2-082aa9bf5a91@nvidia.com>
In-Reply-To: <20261109-chid-v11-2-082aa9bf5a91@nvidia.com>
X-ClientProxiedBy: LO4P123CA0503.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::22) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO2P265MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 31da85ba-3fec-44b5-16ce-08df3e5e2b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|7416014|18002099003|22082099003|10067099003|921020|4143699003|261102123227099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	sYklcmIQSB6qoxiJDOsKYl/NG4Z8Rlkeh3sR+zSDGj0tMNKne85YoziDCJtTDYqzwzmNcanx7LosjGwJVnJOIr8CMnCPFKXsdTJo74WXCU1k80seP4tS5oVP/YmvprOb5sukgViWxW+NWALkp0xng6kEo1han2WgkhbJ9D87jvtC53tIwh9lAaqJl5PpExc3+aVyWjQKT5p5scFqdfPenIQyYvEBUdhBZu98F22PJrTDe/655nxzcjsKP4c9o3Si6/0VuypEvtzN0+nUsSnJo32crESNv4ex5sDtg2x5M90LkqVq9lgn0C97fOlyY7PnB1rTHZeWCjYfICFdeB4S8LYs98Y+eaF3t3Gmd6EPqm93x7UbX51c6Sp2oCkidG8KUdqEZn3DJ8nlekG8cuIUATT4ndQ+TzDynWomata1gq8xWYpsqwNJRNbfeJQ3OfCU26MaR2RwkKCZJVx1909KlDWJ/Ak2PjXbXZyTCb2B0oyLophs83qEPbgqf5/biQ9uWJkKIdOYgiApf1d4vo4yhhF5pniQrrasBBUyjAhDi79mVxAjipIQ9eingpYX5wLsUoDFrfVo/S+3eN8uALH9VJoTcljJcBdkocPQ981Wr/IAUsdlAZdyRvQnuExpawKBOWtV8T4LWk7W93fU9Y/natScnyhxLO9VYiV96qEN4KAVl7yHfjkItOooGWg1ttQZOczfcyOyaSH/g0ymgW2eHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(7416014)(18002099003)(22082099003)(10067099003)(921020)(4143699003)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVY2NWh3NjUwNkpDdnV3aU50MnA2bWUrbmhtVHYzclNnN0pVQmUzb21HVi95?=
 =?utf-8?B?RlZzaXJhSUdBV0FkdGhFQjdGQnZuM0ZrUk5UUUhoZVp2dDBYSXV0NEJvV3di?=
 =?utf-8?B?MzJEOTAvMTVCSHZIeHRDRVd1TmN1WjljZkcrODhuVEs0ZE5jQlV6OW9uTkZW?=
 =?utf-8?B?MDN0UFZPYk8rQnl5M2R4YkFpUCtmM250SW5JQ3pobmNYNFF0YkxwNzcyRHZ0?=
 =?utf-8?B?cllrUUJuMTY0Y2RkMlZIQzVzbUZZN3ludE1acWdPSlRpbjNoWHJPcVV4a1R0?=
 =?utf-8?B?MDgxdWFqcmtiMDBkZ2VqSDhkaEZqMU8xTERLdTk2eTJQK2dNeHg5VnQ1SEVX?=
 =?utf-8?B?VmxDYkEzS2s2bFJnV1Y2QXJ2WDU5bFVzSmw2YngydkVLVDFpcUpWcHhvbVl5?=
 =?utf-8?B?UjI0ZHNGT1ZxMjVpY2JaSjB4NG5nTS9qWmVlVTNlZGhtYVNXQWpMWWxJZXBT?=
 =?utf-8?B?QkdPVUhka3g2b2J6ZW9ROG52bG1Rc1VOMm4xUU91QUdJNGJuK2dKL1B2T210?=
 =?utf-8?B?aVdkWTNYN3VNSThaMFIxblNMdm1LMmh4RmdFVm96WnM3M3R1VlJYWWJ3bDN2?=
 =?utf-8?B?OXlObnljeEo4OVVlUFZ4L1V2L2VpWEZFaFFwSHpBd1d5cEhaK3BDcW9qUHEz?=
 =?utf-8?B?S3ZxdWRMSDdQcDcvYnBDa25NYjhmRlRrZ2hMS3A0UkJxTEQrQzRIZU9aVlNS?=
 =?utf-8?B?MVBXWHYyWVYwcnVhL3RtSFIxSGQ0YkxlNWdpc3o2b2h1ZUJtdzMxRmxORWlG?=
 =?utf-8?B?Si9jUHdOYWxqVFppRnNhOGp5alFIYzNSOWpTS1BJSzExVVlsc0dFU3BIV3ps?=
 =?utf-8?B?b3JUSlpEYng5eFNsYWFpNEwvTnBsd2dwVWk5L1BXWjBJMmFkd1pVejMwcEk1?=
 =?utf-8?B?MWZWMENuM1k4d0sxN2Z6cUNybWt4NVp3bEpLK1VvYXhpOUlMR2R6dzNuTGVt?=
 =?utf-8?B?M3Z2V2NBUUlnSTlXNXU5a2xaUmJabjBnczA0WGowVlFmOTBSUW8rcWgrTUFI?=
 =?utf-8?B?aEFsTnEvQVh5K3FEMDhDdUpjN25jTUkwT0JucllSNGlEU2E1NmZYNUZBT01h?=
 =?utf-8?B?dlFtYnphYkh3UG1RRXBEVlF4Y09GSGZFSXU1UElPOERJWEZxZ3dJa3ZMS2RY?=
 =?utf-8?B?eUluNGJic1I4OGRucEgwRFpkVXBoMkowYUovbTlBSiszNFNHcXZvR3BSR0xh?=
 =?utf-8?B?UFRWS0U2eXp0Q3FsN25WMC9QS3dhbHJaOXo2SFVtWE9VemUxOXVwYytXSnVv?=
 =?utf-8?B?UUE2SVpZVTVTUkhpWFhpNFQvMm8wc0RhaW9WZXZlY3NCaUVNSE9DdkZ1d3Y1?=
 =?utf-8?B?WU1UbDhhdGtvM3RmR0dEYmc0bHBOMGY1Q0FaenhKNENUVVR1QmEyWEtkVjcv?=
 =?utf-8?B?RXEzSzZMK2tzSWJ0OFVyM1FVMjVCUU91S2dLRWNjeG9HMkhsQkUrUDFRNVZ5?=
 =?utf-8?B?TE1MdWkrL1dRaDQ2VEtPaUs5TWRneE56ZkZvWjJhT3ozTnBGQ2xhK2dNUkJo?=
 =?utf-8?B?ZEszZXgwd1Z1Szg4NDVBSkFxOHhWZVhZcWJ3RE9FbDM0OWlNa01NRER4OHVM?=
 =?utf-8?B?U1c3aFBsMlNzL2lyVlFLVXJCU3ZjcmFoY0lUdFo1dVY5QStOS2ZUeUVOMTlj?=
 =?utf-8?B?bm1xZGE2M3VGZHNpUFdLSlB2dHNUZ1BxRklLQVhsbU5FdE00NXJrb2pWeWFE?=
 =?utf-8?B?cng4RDdUM1UxOFJMeTRZSWxNaW44RVAvd2p2eTNQZlVJWk9KNEMvbGxWQ09z?=
 =?utf-8?B?VzdBcm9NZ2lJdzdHWTI3Zkx6U204RFgyTFh0WHlhQ1V4aTBBRlZkVjNzWm84?=
 =?utf-8?B?S1hTbWNhTEpvRGkvc3Ara0NWTmpXZysxY0FZa0c1QnM4cW9kWTFkblVzMEds?=
 =?utf-8?B?OE42eS9rejFjSW5xOEdic2Z3b1NYL3Rqc1FWQ1JwOWVDdWNLU2d5TnprbElU?=
 =?utf-8?B?TzE1ZFpiTmxNQUZZVzRBQTJoU2Zlc2k0ZFJvUC9QWHFNa05zVnIxWXRXTGlQ?=
 =?utf-8?B?VENiaE4zV054WW5laWVZNDZFLzNPMG5WRnF3SHhaNGJOQm8ycks5eTlCTjdJ?=
 =?utf-8?B?NHRmNHZ4elF1OVoyRnNOdXMwSDFudEQ5MXl3V0ZKbjVUR1JuRHczdEFZSEIw?=
 =?utf-8?B?U20yaWtEV3NJelA1cTh1UmRwMWtjZmI4Mnkwd3Z5V3o4NmJLUjN3czVCUy9R?=
 =?utf-8?B?OWdkWXdGcE1IdG9RUis3N1JGb3ZZNnZUUUF0YmNPL1VWUmhhakNvZkVSdXhE?=
 =?utf-8?B?WVNvbG5iVlhGRHg1SFhaYis1cHVEaTdXVFNRUFdPeTV0NUViTlJJWW5UNGIv?=
 =?utf-8?B?dDZIbGRHcGFJYkhzOENtN3BNMzNkSm1SOUtqZGRyNWxLREJZSmxiZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 31da85ba-3fec-44b5-16ce-08df3e5e2b56
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:37:08.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CREQm0RVH0tangDQ6CSpCjKJrvgfRXZiAInZHm7HTgxUjt24y9/8RJETOW2Ds+uYRqO1m7KcqmOu4UUTzLU1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7275

On Mon Nov 9, 2026 at 8:32 AM GMT, Eliot Courtney wrote:
> Use `SizeConstants` for Alignment that are implemented now.
>=20
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/gpu/buddy.rs | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

