Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011041.outbound.protection.outlook.com [52.101.52.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53AD368287
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046309; cv=fail; b=BMkp/4b/gQFNH7Nozl3KRpi4FZJ8Lr9mNvMp5kX2/GJVCT0BmPMVZkGQHeZQgYz2SC5IwtXo7UbqMpl1phTRu/zZ5UG6LX1oJ6YfxNXfPEMqlj/7I42YE5aeGiEGBXpxBNmDtTdl/ALCiEpV0TDW70EoPG8KIhz2RxY4PBsZJoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046309; c=relaxed/simple;
	bh=ylPJQYLugI8cSeBVES7Ib3q/n6BtkzYA6YFOjY0SyIk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=etOGrjH1maqZ0lkxPvKBA5I4i1pBoO8Nkk7XYPBtoSml/w0w6vzXTGBwtqh/l8oXtKQZLlRReqzTlre71x0B8e2MNa63UFSsrQUC8661bcLlf+cAv7gjh1jvNROgmKUzvT81sMVvAiIAupfdggApsXXTaS1eb5rZqAuaV6mfK8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nq7+5aJe; arc=fail smtp.client-ip=52.101.52.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nq7+5aJe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/EZqay/BoA5jaGHI/pJb6nworTw+Jln4rzSHnsyryPK3+6ZuJRpAOQH3Zk0MgETseks7mjvDdtrFIlUEn3/dEEXW3RKzMm7JQGzZryAaJ/cMjmA/UFdRtgaLmNo83bM1/92SCVjsQgj1oIpo3CPaTyIaJhzKCqOyijI5Js71l/2qp9Gqk2J8gAV09UpzYZJOCSQF/dQg4ownGxpw9XMoFJjSyQVxz0Wlr7rd+CaFp5LYmZ55g9BgHcSWcqFxzPfZ/xluGKlElNMDmTfGAnqLzvU8ZZKtyoGNLU/uf7zUoAngcK7pTSC3OUWOepVzF8OA5zr88KmIjG3lg43kmR4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylPJQYLugI8cSeBVES7Ib3q/n6BtkzYA6YFOjY0SyIk=;
 b=uRl0H8mtDLXff0j0pe1IqBNuRczWJ/jJp89izHQjky5a/Ig4GkW514tKoO5YaMzviGJ35TfsatESRsBPo1ILwqygBXog7RmuwPdZXOxdc/bg0N/CVrcy03rUA4WXPeppHL6kxc3qmdlWK8Yn6Y8yiNIkQk6a136EAE89gQRwotFWzFX6bCAnFLzl5vHzrpsd3Hw7DXIVUaeXYDAco4EdRlfDmrm0jPgm1tKaD0HBXI8TlmtMROodht7NYVi5iZlSg2PS69C3Q2RonvhU03jDpHCNnOIllRY2RhpsrXsnGzDb66W7K4STlzTJlD+tbwo5wRZGFLtt4YL0vT6pyNMA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylPJQYLugI8cSeBVES7Ib3q/n6BtkzYA6YFOjY0SyIk=;
 b=nq7+5aJerY5LfJJSOHwxuVYEIEhO/iXXdnANrJQmZJ8IwezC3C39m872pjCOjzfMYXA7MxTbNs7Exxpv+Q6KUgn+SxBPup75+UiYCWj6s0G6nIBfkyrLPF8aKJiU1crMkoY3oxsMSOGmEsNywOLH1/LqEWsBzGb135qd4rWhfYBauIz+hwJSNAv8UzCJbFgE5IOmXJxn0C5vp60MT3czeO9V2K2ZMgqcYlxcfEyV1aUOqbwC24vZJlfMCHTs6ie6F/pM+rVZxBvdUviu/1EwiqpGj2ydUZJPHO/Mh54a/CpWvMztNCXlLvgOneKD9cn6H0BYkbwW8GwSunolc73nKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 23:05:02 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 23:05:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 08:04:57 +0900
Message-Id: <DJ4W7XGCAWB7.3GK19T8LAZC0R@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: clean up FSP FRTS comments
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603235034.131354-1-jhubbard@nvidia.com>
 <20260603235034.131354-3-jhubbard@nvidia.com>
In-Reply-To: <20260603235034.131354-3-jhubbard@nvidia.com>
X-ClientProxiedBy: DB3PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:8::21)
 To BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 09538c7e-15ec-4427-4015-08dec67b898b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|10070799003|366016|7416014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5ynF4MRQRbiG5GYrVpDaIQeDmxZ/Tf1p9WFOZaJbnnGZsnAYkwVY5b5THO+QXZgDmJdgWynfNloBphd8Oo/H9s2wiljJ+A/Prax/kj5/uQ/RSQnAdsiIaVOyu9QMlxFEXZ4MueWITxNPrNeJz/mjH62Ju9Jk9h9yX1Ncc+jriFvdsA7RHwQTR087CTJFvMJuvYQS0yzd6cw67VQdAAUrhpL6gCHulLgh3KZObNkGbQE4GaisIe3tDiB/83Lx4o4VNvOla+3hVubR/7N/mfFtiyB3e1PDvvbDKdeUEwKrvpyIpuHgp81KI/DxwpF+FrU6zpIqlnXdwxk6Pa1bUzYzHcreKbtCFSIXHkj1EUt+pT0NakOBsFKr3STsusTO2o5cQdAJSzXzmwdFclIPD3m+EG2cgBRGjw5sX2aZusswJVPYKoHz3njTJ58bLHI5LvfbGgv/zY62J0QVXkhPMdRL2osu+izkl58uJFAtCBsHnSORE4bRGjbXtImP+Q4+tlmw99SZB4dwNGcvCRUyOfYpqy2u1UzMSrvVzCd9dEJe/ZErZ6lXBqj55IH6ZVz80RyzDVRkhdwWakLilq33huhAzOpbU/oCsijKNlGP1WCkAtAokH3oOgg9N0DIwd+wTcWfGB3/9igjRaBEaZf74CtC0j24uvv3oc/8CNxOfyMbP8084aLtGit+9GcfuqaRjxKe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0orRmRuOWZSdlN3ZTB5MXkxeXcrRTVhRXhiRmxJSHNMUVpPYWEyZFBrSmd1?=
 =?utf-8?B?bytla29yY1djQWR4TkJkWXZaRzdYdzFFLy9jaGFVTFpHSWNZTy9OamNSSXJs?=
 =?utf-8?B?NG01UFM2Y1NIVUZvRzZ2REpnNGR0TGQ2V0hLbjdrM3FFSk0veUNWcWxseU5E?=
 =?utf-8?B?akZMNUJOVHJ1MXRON1E4QU9kdVFkdmZxdU5aU0l3TmZBVHFEcWZDcGd6emd1?=
 =?utf-8?B?ZDhnR2crbzNPODhwUmN6Vk50UXYyN1E1dnJtQnFlZWJFOWVRUWxqeVpYZGtm?=
 =?utf-8?B?ODg2RkFLMDhONElveDNLV3d5ZWQ3T3YzbG5UcjFOMFhsVmZ0TVV1K3E2KzE3?=
 =?utf-8?B?VTcxZGJLeVNvd0pQemVlNUt6TWQ3bFpxU1h3Vzc3NDl2WW9sYS9QYUY3YmEv?=
 =?utf-8?B?NkNmbEVCZUpGNzhnV2xEd0NpbTliaHBoaGFLR28zeTFIVC9OSnBGTFgvUjl2?=
 =?utf-8?B?c2Z0RzNWS1FzN05zZkdOUGVlcjA0bVJYaG8rTmVUNnlCOW9LSiszVVNYNG4v?=
 =?utf-8?B?NHY0N21lbW5jOE5XVFNYenhtVjN6Wkw2Q2pQSkp6UitiMVFwYWdyTU9ybXY1?=
 =?utf-8?B?VTl3bkplQm4vVE95K3d3WXpSZjlibzM1eWY2T0lBRnUvSWtCb0YxQjMxSXNV?=
 =?utf-8?B?QllBOVFSMGk5cVFkZDVGMkgyTGt6TUp5U2QxT2VzMitDOSs4cG85UEdpRS95?=
 =?utf-8?B?azN0TlFLZWcwcENnOUUvRHJXTnZkN1lFaGFqV0ZnTUdVM2ZZMmhhZHZuRW5H?=
 =?utf-8?B?WXZ0V2tGdS9RS3d2TlZyakRmejhmMVF5Qm94bzJvWHUzTjNLUXl2K0h4cmcz?=
 =?utf-8?B?NkliZkxWTmZ4SjVoS1RHWEZ2bWJmOGFtcFBHSnd3L1hZR1g1aDdGTVBHcXox?=
 =?utf-8?B?NTBlZVZvOFk0aGhZRDNFK2NVRkdJRVBITkVEV2hUcXZ2V0x5NmErUjlWMm0z?=
 =?utf-8?B?ekFtVkNyVmUrVTFqY3F0dUZoSndUdWNKSkp4aURiN0RzVmI2QVBhQlBoOENL?=
 =?utf-8?B?bjJCdVVRMGRka3JHaFRVdGRsYlAwMHRCVXVnV3N1amtaalZPR002czFnZ1o0?=
 =?utf-8?B?Qko2U0pEVkhIRFAxOUtGN1NHcUxTaTZ2cmlTK0pVQXRjWXgvcWEwcUJIVlhl?=
 =?utf-8?B?cjl0OHVnZHRqbFFzem5NcnZOelVFeXlNNEVEZ0l4VWtoMlVsSWxXcU0wNEdJ?=
 =?utf-8?B?dmpua3VjZGxWK2lWRHVZVGliSjhVbjhwOFg2dm9FNTN1RUVZTVdkK2pObU1q?=
 =?utf-8?B?S0JPM1FDRXBad2h4cFJoUHA2MFliY1loUW4xVXBaUm5UeFVOQWlIdllkQ2dG?=
 =?utf-8?B?OTJaWmZBcFZwZi9vVmR2N091THRCaEtDN0RDWjkwVHBFWW9QUjRSVExNYmxn?=
 =?utf-8?B?c2F4a2dNb2ZZeWowNFlxbWUwZ0FYN2wyczJkcy9QTTNtT2laZnRHUmlVeXQx?=
 =?utf-8?B?eFVqWnZwNFBGendhMVNqY1o1U3N0RGNRdS8xVUFKS3NMZHFJb3JTZ2ovSUJB?=
 =?utf-8?B?bk5aejMrbG9FRUZPSjlGTm9xNjBSN1BKVnVRemV3Q0xsS2FhTVVQb1lOYjl1?=
 =?utf-8?B?aHZ2dXVoTnVGQmhBUlV0bFFHc1hZOHkwaXNtMW4yUWlkN0RtYVQ3OC9TZy85?=
 =?utf-8?B?UmpIYVZITE5KU2twbjdGejF0QXZleXl1czlSNVlyQldyS3RENUhhbWorZXAy?=
 =?utf-8?B?aURFT24zR2hIT1I1Rm0wR3JpR2VJVTVKYTFSZGM3Y1dnd0NJMlMwNm9Fa2FF?=
 =?utf-8?B?QzVXejhmRTFQZEZqQXovOGIyam80cVdDT3I3MTYwUXJhOFVJMmI3cXNxWVlv?=
 =?utf-8?B?ZzZrUE9wTEQvOTdSYVhmYmtlTzVLTTV1bzR1ZThWeS9JWkpxVDNkQ3Qzcy8x?=
 =?utf-8?B?aUpVbEkwY1BEbFhhR1RGYW9Qd3h1ajVaaEEzY05kMUI1SVFEMTVnakRSQWth?=
 =?utf-8?B?OWF1cnFReDNLL1B6b0JGYU43SDZIbFRvTXNTa2pIV1JieG92VFRKSGoxQ2xE?=
 =?utf-8?B?SGYxT2ZOa0FxL3FCMkZJY1I5ZHpJblpBcUhOTHU4RGFQaU9xejU4LzBTclVH?=
 =?utf-8?B?eE0wQ1QxeU1Fb2FPYmNacThDa3NMcll2QUhob25tajI2SW4xRnMyVFMzbjNN?=
 =?utf-8?B?bm9KRmNTQ0phSEYrZWl2YzhZVVAraVBmRFRsSkdka1o0QzFWTWFXcktCMTI2?=
 =?utf-8?B?SHNCVHQ0dHQ2ZWo0ZGtlWVlLbDdoMmp3NTNEMGVLSE51RTh1ZS9UZ1BqVmxr?=
 =?utf-8?B?cmRRUU92emhJY1MxWjBSeXVrTi9palZKMmNzWjlRY3lHY1picmxLZWphc3Nn?=
 =?utf-8?B?eVgvUStXZTZ4VHNwWkJVMDlpQnk5SENRK2U4dlFVUjRhelBsMDllZ1JsckJE?=
 =?utf-8?Q?A7zbTghOPQH4xLgj6LKx3jrNVpfQ3VN737gRY+j+TchgN?=
X-MS-Exchange-AntiSpam-MessageData-1: 15v9o7h022jlWA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09538c7e-15ec-4427-4015-08dec67b898b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 23:05:02.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZD3rfG4O41EzIImRa17YZGsjKDRU7guKuGvJMcBT/v95HW1YzAASOUFKmKZLeMvuO51D3KjnwHk6+e51LrlQ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591

On Thu Jun 4, 2026 at 8:50 AM JST, John Hubbard wrote:
> Two comments in the FSP Chain of Trust message setup had drifted from
> the code. One referred to a variable name that no longer exists, and
> another described the unused sysmem FRTS fields as future work rather
> than explaining why they are zero. Update both to describe the code as
> it stands.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

