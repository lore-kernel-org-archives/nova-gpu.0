Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7B480DED
	for <nova-gpu@lists.linux.dev>; Wed,  2 Sep 2026 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361640; cv=fail; b=vFrKWBIXFbdansE1SNksyqtqy5JYIAgui+dUoCiSXVI6343g5qEqBwBReKEiukmuN07LVWYV/cUFgs7y+n6CQshCJg5eEVYPmFoitMDF9u8Q5uHOpuslj1mWEydaALliASS4SMIDonRW2IvqlWen2FA5z4iRWEhWEC4iIPZjTYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361640; c=relaxed/simple;
	bh=8g/xxuzlCjV0ilqOxtE2d67M1N4xONlhwAiPchSvyQk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=isS1+RIPQUcEalw8P7dBqvAlFKa1oRV6uOSxLwxc4bYv4Q2sDmyzmn0bfEueOaXPxXZcSVvDANuPZjTGSBE6cWh1blPO7U4P7z0NZyk0ryrF3zUW5X2fQEEvMNazSGwnYYzj7kfF2hzRatUFWt2Cvtuux3VSUpTU3jqaP9VuOzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=giGXj2Tw; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="giGXj2Tw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuEK0jYBOl2h0I0DGnRUk1yUkSK8ULQeCZsJTT0aW6VNQtQrqnj2VyPE//VLummooKEJIN9cxna9+A/Sj5ZkNAe8YzIs7VLEe7VpQ7FvLNL6qsGtBVbDMCFiDwX5KtdVLBfUZPDarW62CBhTrVdogvtkLlqGMO4PboKs02Qzu+FNNZCiryUBYag3FBt3etmfOUXSpK+iGY/KNAnwDrGXrwTFvPt2kLXg3BRyvNqqMTVUpDBYip3Yu9yKW4m3j9xtlpWP0Idh57g5GaITPXCbq9Vyotno/qn1YZF4ZJYyegFTFA62EbLWPqYMNdAnmNlAtZjbDuYllbZjNKt0cg+ztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMBKO/5Y0CY9yo210uIu1rRNuQeuo51eejJTAVytjfA=;
 b=bTM6fWo6G03bJPq0ATdMGCLPXhLtS8WFgSSDxpRei0GUP4yziE/vrwSKXoRS3MkG1sxNn2YF6mrusnUeiy+pqdJiqtsJ3rrV7SwqbVGuZQpYXxoSOqfHVz+fH/SeA3VoJKjmc5mYyGvlKjI0ieMfOX/zcILq26GDmjbuilJEwJ6YIysyGvfAEqRuee+oD5iHH2ClpvIywdnMt/1Hc0lsfvKeEQGKhJveQZyr9fI4r9hDv1nmejCLG13VHjVitqOl87NXAqbrgbV78R8bfAdPeaB/eKXqapJzir/M/KwrTvRU319zi1oLJIUyAVEpVPI5uvzMMUTH3gxNI7R7GkLBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMBKO/5Y0CY9yo210uIu1rRNuQeuo51eejJTAVytjfA=;
 b=giGXj2TwU3FjTbCID+dWuRV9ubhr7+G5h6pyDz2sWhzZNxtokCcx/Jr6FAGgiqx6FYZQO6FHpfGLmITg5SQYjcWjJq46cAlBk4gZ4BUuF6NQpqXy5mIaK9UIyQAfGWsKLwbI0IBoxXOhiXDD0ovjjP3cFdJi8+pxfO/elXw5JyCotTAKj6qSosIN4zgW1GWCRQ/kd19XXNSNNF/t8mnAI3du0o19CZz+DdfXUgWdr7T56UZvkMk71q0ZJpofbXwySef2opSkavQcValuMFtx+O1NkL8ol2oHZvMPFPU2dI6PIhWzlr1Y/o1GKDeQGNj9YhGVHcXWc3RSMNr2FlYJJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:07:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 15:07:09 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 00:07:06 +0900
Message-Id: <DL4XADLEOLAO.25L9GDMGB48PW@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v2 15/15] gpu: nova-core: document the GIN interrupt
 controller and GSP events
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-20-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-20-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e60a190-f943-4ae5-653d-08df0903dc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|10070799003|366016|6133799003|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TrtULs23cJ/4a6Uoq0txqHHu9JKzvCzNzsDS1jtY/hEv7hkqb6LxuZOtxOwgcfs8/WrNBxQsaR48/5G8i9M9YFQjAIUKE9PLwTAb7a38IlmHK6U8bNwXgxU4TscdED8sysiFSOb5dpREhRgYeQxESYO8+aYWiwgIOQGuysuAFWKNbw08EJIkJTKUFU77TqP3S5tdS8J4v1YSeAfUXr2pm2DbSWaapz5r7irdVtSSxSCqrk3a9t+4TS51p8ZhdrpvMWr5Jw2qYDEYt9sB6n7v5kkSXyKFf8Y7+89jpA23rnm5JcsMg0Q/THWbHtfWX/Cl5tG66Wg8lLDDDuo1xX+7aw8faqdQvsP1PmdNNGu6EgluScQNUFRh3Lg7oJSJRawhZL7LLtHWtTalmy6clZC117cG/EuLs7vA6lgMWE0KEKwY+OjZzituAB2+4l+jf+JEP8cS02gfpQg0sR/V7CmP0fZxo9UMz/XAlDfJIhnfQUiZ/EAO/7DxhiV6lxbt6+H+dn3vykBlRSXUoiu2LDMD7Cw2YQcKShk9nGiHIM8ZytB4aZvkb7MNGk1RDAUB0EJsneyOmR9FX+mzLvw9b0GViMC6dJRIl79C/GCiWVC77uQ6Ltp15mH9Pt0gy3aQrHvx9xvBUkk6SG9nd1OcZR5LtwGMhpF3C72xaYzrTtP2DKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(10070799003)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBjM0hJNGRyZExVY0J2WUJrdUo5bWV6T0s3OSt4aDVJMGk3TGY1U3J5ZnFp?=
 =?utf-8?B?UEd2VVZjVGFEMHc4d05xRWFMUWJDV1F3N0hWNm5xQUdkYnBGMTNRZ1g0K0sz?=
 =?utf-8?B?b0s2U0s2ckQ1clFLbXVuU3Q1L0NueS9MTkUyYlEycDZRdTg3N01ZUHRlZzNL?=
 =?utf-8?B?aUZQOGpmOUlHTTcycFNDWitjMTJNenlPMm1kMkRyOENiTVBIcXJSV0lvb0Ro?=
 =?utf-8?B?QmtWQVRlQ0NwVkpsa1B5VVpiYmlGbDN0dERDRThOSTdxSG85enRCME1uTkNM?=
 =?utf-8?B?TXdLQ3czK0ZQVTJDZWxCeHB2RnNFSGtyS0hteFRndHdEZUNXQ3dLeXRGK0la?=
 =?utf-8?B?akhVR2tWWnFtZWtxNGZseTZkY2NneFFncUFiRlMvS0E3bTNqaCs5K0E3dGtm?=
 =?utf-8?B?RU13MEJlbTErbkdxK3VVcDkwYWJyM29YN3QxNkwrK05vMlREOENZNmNIUkZz?=
 =?utf-8?B?b08xNFE0T1B1amhINEdNWjRQaGNoUVRMV2RzRlFPdnZYQUdMZXR4aGtVS05D?=
 =?utf-8?B?SzNSZkdKbjNXbkxxMzUyYzFOQU1VajM3a1NGVGZKZ3JJVllBS01BUUtnVHpk?=
 =?utf-8?B?U1h1TGxaNTQ1VGt4dnBRbDdQNTlpTVJOQlVFWHNKalZlK1RPMzM4ZllnQ0JE?=
 =?utf-8?B?Q0pXOTJpNW5Wakk2U2N5TE1Uem9zUmNxWnlEOGFoc2xPUTZaUHJNdTVTOFZ5?=
 =?utf-8?B?aGlScGZFL3JKTkY2N1Bkc0piNEE4TmF5ekkxV2tDWmhOY1J5NmNWTGthOW5E?=
 =?utf-8?B?azBZRHFnQldoMnFPMWJwSTJtdkw5R0VsQjZRaFFvcU9FRyt6cGdwaExKT09Y?=
 =?utf-8?B?bHZLT01XYlByb2htM2VmeTRzTklSYU9aQm1IdUVUd2dqVXAvVk16azF5YjFO?=
 =?utf-8?B?cjBsalFQQ1BvcS9KRjJTcjJGL0tBOEZyZDlTeGNWZGNXbTZaanNSWXFTUHlL?=
 =?utf-8?B?OGd3YUpyREN3UG5LamNWempDaG1yRk9mZVdYQXoySDVYMmJwYlBkVTBqblZT?=
 =?utf-8?B?Mm9pa1dBb1VZaWorNlFLeTR5SzJaWGlRd3k2UVoyT0hqOHE3UmNSWEVnL0lJ?=
 =?utf-8?B?ZlZKUlRBa2pQd0hxR25HNW8rdlVidzF2bndUMUIxRDEwUnovRFhWQkgyd01V?=
 =?utf-8?B?dHVOVHRYbmlma09ackN1N09USHA5UkpnTkZrYVhpTmNpWlVZYUZCa21aUGhG?=
 =?utf-8?B?aEozYXBJNk9oNm1PUkxORXJKUC9xOFFuMURweGIyZ1JvZmZOR2dBL1NhaXcy?=
 =?utf-8?B?cUE2dkRmeTZhRVIxcHkydDZ5VkdNSnlzREMwcDJSVGxqektuZm5BV3ZGMnky?=
 =?utf-8?B?MnJFenBzcGdoMUlreHJOaitJbW1VSDUxYzBQblE3SzF6NFQ4ajVSQ1g4cU5C?=
 =?utf-8?B?RjBnV1B6WlBhN1lKR2oyaXZDM2NRUHNlejIxMTlUNXhqSU1IOVgzVDRhWExm?=
 =?utf-8?B?cmsyTkp0Tm1rTVpLVjEwL2QzQ2dvTlZVeHArUDVQRWtLb1JQSHN2c3VJNmNz?=
 =?utf-8?B?b1lUcTlORVI4S3NEN3c1QVQxNTI2aC84MEJOajZ4MGw4UlJvYmRoNzREV2po?=
 =?utf-8?B?Y3FCcEMwbXBNUkIxLzllejdaTnhJVmxQYkVYdHd5TE5QRHBIT0RNQzg0c1V1?=
 =?utf-8?B?WERhWVhVdXdPOE4vZnB0bzd3dVhIZXVicGpqT0hEbGxxUFNESllVaXRwZ01l?=
 =?utf-8?B?c1h5UFh5bXBiSDZlOG9qSjJmS3diaFE5RWtyWkxEQ1QxQmxiRXpwV3ovSzd1?=
 =?utf-8?B?TmE3dlpxMlUzTUt6dllPMUx5UVd2M2t4OE9SOUloeU13b2YxOGRUYVJtSDhs?=
 =?utf-8?B?L2JUdFFyeExUMDQ2T3phcXlYZG9QVjh1UzN4ZDBNYzUxWmM3cGY4dHNBaVJj?=
 =?utf-8?B?MUtQZUNDOEVtdGF3VmR5UkRSVDFqM25NWVRUaUh6WXFHVE5seCtvMmJQYWNM?=
 =?utf-8?B?ZmNUUVY1ZVl6SGVhS3hhRkNsNXZpNUdsSXJudmwrRGVWaDZBak9qVlFaTEUw?=
 =?utf-8?B?a1NSK3BYcWtVczdWd3pIV2dHUmxLbTRKc0dQTTNMTURwVTdaandacEJYQVRq?=
 =?utf-8?B?SDM3d2xRT0M3QWtzaS9BMUZMVXVORld4S0J6eUNFcWRuNXhEUkdMRTZ6STJi?=
 =?utf-8?B?bTUyUTVhMHNQclFFbnNDeDd4ZHdRY2xCcFM3dTBjalFlY0sraW9QTzhkOUZU?=
 =?utf-8?B?YnRoYWd1dFY3Ty9YcjE5K0NKNnZvd1l6bmRuRHFOZXhCV0E1cHBBSm1lM28w?=
 =?utf-8?B?Sm4vK2NzSnZRQkh0MU1tQWswV2xROXgvcTVjTlhockR4Z3cvMTdiOVBOTlo4?=
 =?utf-8?B?TU5rVjh6cVlxQjViUlM4V2QvQjV6WkxPVTNUZU15aGJ1VjhIL0lYRW9IZTJu?=
 =?utf-8?Q?pB/1D8NlrfkzaJAKh15w6VWKRMcKoCuhMEy+v7zVG85LX?=
X-MS-Exchange-AntiSpam-MessageData-1: itqwARuUJSp98Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e60a190-f943-4ae5-653d-08df0903dc3a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:07:09.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhOaVE4y41n2GJ0dWWDwScpat7ystsy2uTiitSmuI9HdMPhpaSZ/i42ri5jFMEB3nmMWOxX6+bkDYYHP04AqBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
<...>
> +Terminology
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Three different numbers are all called a "vector" in the surrounding mat=
erial.
> +This document gives each one its own name and never uses "vector" on its=
 own.
> +
> +GIN vector
> +    The GPU-internal interrupt source number, 0 through 511 on Hopper. I=
t is a
> +    bit address within the tree: leaf ``vector / 32``, bit ``vector % 32=
``. The
> +    CPU doorbell is GIN vector 129 and the GSP event is GIN vector 155.
> +
> +MSI-X entry
> +    An index into the device's MSI-X table, 0 through 7 on Hopper. Linux=
's
> +    ``struct msix_entry`` names its Linux IRQ number ``.vector``, which =
is a
> +    third meaning.
> +
> +Linux IRQ number
> +    What ``request_irq()`` takes, obtained from ``pci_irq_vector()``.
> +
> +The remaining terms, each named for the register or the specification th=
at owns
> +it:

Coming to this patch series without any preliminary knowledge of
interrupts handling on NVIDIA GPUs, I would have found it useful if
leaf, subtree, and tree were also defined here.

> +
> +enable / disable a GIN vector
> +    ``LEAF_EN_SET`` and ``LEAF_EN_CLEAR``.
> +
> +enable / disable a subtree
> +    ``TOP_EN_SET`` and ``TOP_EN_CLEAR``.
> +
> +serviced subtree
> +    A subtree nova-core enables and has a handler for.
> +
> +rearm
> +    Restoring PCI interrupt delivery after servicing an interrupt. It is=
 a
> +    ``TOP_EN`` disable-then-enable cycle everywhere except under pre-Hop=
per
> +    MSI, where it is a write to the end-of-interrupt (EOI) register in t=
he BAR0
> +    configuration-space mirror (see "Rearming PCI interrupt delivery").
> +
> +mask
> +    Reserved for the two places hardware and the PCI specification use t=
he
> +    word: the MSI-X per-entry Vector Control mask bit, which Linux owns,=
 and
> +    the falcon cause masks. It never names a GIN enable.
> +
> +latched, pending
> +    A ``LEAF`` bit records its source whether or not the GIN vector is e=
nabled.
> +    A disabled vector's pending bit never appears in ``TOP``.

IIUC a disabled vector's pending bits doesn't contribute to its
subtree's `TOP` bit. Something like "A disabled vector's pending bit
doesn't signal its leaf in ``TOP``" sounds more accurate to me.
