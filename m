Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75A3E4507
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047868; cv=fail; b=NbbGybeUmLquB1tRAFfsM0sCFVt65gMR4aJNvNZsl2a41DHeAkCJXSa7XGj23iWNT8R8tgajEjp70WkGulBLvaSfwBPU9X+Pp95frjCkFc0+8PgFBEkvrEqMuvRBVlQm1ogbhwX/7ED0OBos7lTboBMJeycumNZmxzFGE9i4qUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047868; c=relaxed/simple;
	bh=Et5CIALsyBqUE70f29MTmXxWaKGAeS1c/YUlkJXsal8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=I0fIw++GG+lBEjqh7T+7wEneN6KhxSeB4YN9pocxozOxGqU5saGbccEoUHu7oMCyB/zm79fQYS1SxKx6ejiwPmlLwLKQy+Cy6DGZYO2Zk0jvFywN3MOMUUlh2kEVp4oXr8KyIGBJxomZz1DlNBRafyADG8Qkq9d1eRb+IiXMgQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y9OMFZhh; arc=fail smtp.client-ip=52.101.46.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y9OMFZhh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+cm6fdO+h+BToltXE17MiAVlnzMinfyeHIoAB1Vv77Yg5PIft6suV9tIkRniduWqSUe2dyvhxrX9xzXPjCl/qzT9TMWtlyjlXt0XQjCxcN75wPVvbVsikndhiaNdOkKaGDt0Zaq/3PAJrCoqMDw0qFsvcZhFGaMIgoYQRLIkT6lO+qDSIuHlcxTAWhePZUSBZGbc4A2PArMfFWSguuFJcJnPpU16PIinUXkgRZg3nRYt7/Q3yr8uOhce26WYXCWJx0g/r3p3lPyXEF5sAKuAHioedfgv0PjzywNVHCZgqUFTqhFSuWlQQbkJiolw0+CAUtGsQeTZE6f0B8w+aFjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et5CIALsyBqUE70f29MTmXxWaKGAeS1c/YUlkJXsal8=;
 b=a0jiXLfn/3VCl0wbycPBKLhh4/aGtuwUPPN4TxL0GfRGoErfUdo52febcaTC6wXUjsQPQnEQJI37J5T1fZPiyxI+n1IAcNuVq0BUA6knqQcUZSMn/jf/nmKJhpMbIM4+vBQ4Cy5YzTrzq3UbkCeRZzBZ+yzpuPDycw3M/tAlEStU7JjO/TL2PIX0G6RT+kHkkPmnGFVSyQtBJiXXd/2/56pbr52gDDjUoC96LfT2dIbVMuB/SSvqaEk4SaAzJ45r+pIJXiPE4OQ0MMA8ChLhCyuasOLaS1Skh3V14gWQ7VxJnqE4vOgrHWmF6KRhp7OO3kkb9i/ZhoTKlGJkDalAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et5CIALsyBqUE70f29MTmXxWaKGAeS1c/YUlkJXsal8=;
 b=Y9OMFZhh65SKvci0eYfaoygyeAXTyvQrsyzq8pYqVrAWUt2JIpOKhOCwF8JHMF/YwGLLQtQEJgQJ05ckB/eZkHGI8rVM+RsvoEhhgTXyKkFY2SZkB2jzc4IlZeybS6iR3Y7Vx38t4Gn074g/RaM2j0w0J3UiIQzrzXtBwHVGoxIwMWu6hEjAbIXrnnCKrAt3702qKEEFrYUAx5U/8g/F5/asbrGVgbkqE7GNS/JcZp9X9o8U+XHUpw4EG/pHOpshAgaOpwZS6wEwqupvlsEWgrFW1+hr0o9jbSHLa/siTlRJl9Rapu3PTw4zCuAY1oD7gfR+evITRxQG6KpGTvX3bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9135.namprd12.prod.outlook.com (2603:10b6:408:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 23:31:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 23:31:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 08:30:56 +0900
Message-Id: <DJ4WRTZT7IPU.2DI8H3CXN4KWR@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: clean up FSP FRTS comments
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260603235034.131354-1-jhubbard@nvidia.com>
 <20260603235034.131354-3-jhubbard@nvidia.com>
In-Reply-To: <20260603235034.131354-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:379::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: b3643e74-6b0e-4aa1-93af-08dec67f2a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|7416014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Vvr5NTPe3jGyc/3zuSMxp2loB0Y1LtFV/Kas5JuqIEuRqmwMAvyubTeDflG+QLk/6Ve4zR8UmoP2jHy0wQsfvtJqTJ/UmyH2amOhHjr90DpfjSJGlPVslBeHfeFZncTBCuMWpCsiKbF9v1EBeDwtSP8HvjfhFRz6rxCqdBlVBbjnW5qJE4FSDwPa4EZrboa2BhEDHcIdVtT6h1RMsJmb0MIKlYnBI/a35xU1GLdqw3FF3KorXYl+5rTa8aMzDO0SRMHVX5l3hKpsI89Caj6RyXXSOyT4Hw1fcd33Ge59X46ptcxG2CRbab3ruL13YbQzVwaWLvMxJ6CoA7blXttbO88M77R8y/wx/2XnASEotgrENvEnYbLnNwh9Fb0qefO8r8toCXxyPhXw4vqDDy/1JgtVnMn2CGCXZ/QBybLJIdHTbodxY3z9ucSsDRbGszoqGYOwMGVXlnA9adbdfvN60SaAn5RmujSkLoQPuWXB5452iOJBYIci6pLLeiWe4BoM1g6O+/LvzDEX4IkKyBVSXpyxcfj3D0X4LQDJr3QiGy+T9hGexAK1crOs1MVAr65wNAZUUc13//XuD4wp66OKjSlMge9YaojVTC0f8njoQN+2dkaZrz1X2doLIoIl7Jb7GvaO7P9uRkcvLn3quQcNNKA+JcUPq5RaeEWv4dXMZskYBDWzZKPKmbKOFZ3Ag6u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(7416014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG11TDF4eXhCaDNlOHJ1Zjl4QU90NmpwNzRNOGRBWno2R1dtZmFEeTNodVhw?=
 =?utf-8?B?bDkzZ055Q1k1RnF3cVRsWE5uYUZoRFpuT0JjZW11VUM1SldKTC9BTFR5NkhJ?=
 =?utf-8?B?ZkxPb1dmZEtoRXR3Y0ttWU5kbDFKZ2wwamV0RHp3OE9XV014K09YTHdnZ29y?=
 =?utf-8?B?RG5xYThTeGdCcVVGQWRpZm43ODhxUGVrL2VMcVdacEw0OEtQdlNOTTVFR2Yw?=
 =?utf-8?B?YjBIM1kzdWtOZXJWOWtMWEt6KytFMGw1MnRUcENJdE5PNCtpWlQ2Q0FTTDVD?=
 =?utf-8?B?MjR1N2dxNFNCNDRZK0xxRWRUbVZwWjllME52TzlsOFBUQlBycXhTb3Zmd3FL?=
 =?utf-8?B?TW5ab3ZYZDlBanYyQjhBSlpNajFobnNMM21tTll1OG1JSU9BeC80bnBQYWxS?=
 =?utf-8?B?RnVyMXdiK2c0RGcyWHJraFVnTkJISVU2VXQ1Z1lTT1JOSnc5YkFOdWNsN0dP?=
 =?utf-8?B?dzNaKzZYalMyMFhRV1VnVURCZCtldFZCclZYUFBsTmxrOGRUYjNCVlVBNkFu?=
 =?utf-8?B?SGlEUEhYa3YydVBqSmtOdlhUeFZjVkNRQWg5ZHNha2d4dWd3VXAvcjhmN0Fl?=
 =?utf-8?B?cmJqMGRDRCtTRGFBMWYyTnJobmxpUzZiTUJRd29lanNWSjRJeWJvb1hjbmJM?=
 =?utf-8?B?ak8weEZmTHFJcTBrb0ROVUhqekxXbGJhNk5sY1FDbjNVdzZXbXBZbE5HdGV4?=
 =?utf-8?B?NHVBYmFNMDJEMzdlRmhNQmZwemtEQURxQmFaWG83MG1wZktHamVHVGFmREc3?=
 =?utf-8?B?VndaUzFUaDR1aTdES09oQWhsUGszRWlCdUxSZ2xhSmt2RFcxV2xQNWtCb1Fz?=
 =?utf-8?B?ZVpnRTVVNlhwWDl3U0hQWStQRlZVYkFWK0l2UXYrM3RxUGNnZUx5NW42dkla?=
 =?utf-8?B?aDBNaklZdnM0eFVubXJsd085eGY1Ry9jclNwdHZhQXgyRHBvZ0x5MU5Ba0hr?=
 =?utf-8?B?d0grc0NuMUwwbEo1UXBsdFZvT2JGOFNUM2w2ang5Z0t6VnNaR29CckFNNWNS?=
 =?utf-8?B?cDRod0NpdFlwU0JhMnBrMkRXU3g4QnBDZkV0MWRmaldOQnFZb3A4d0wvRmp3?=
 =?utf-8?B?dFY5TjhYTGtxZDN3WW41RElCbGhaU2pHdFdxMlNJdEFITUFKdCsxWSsyMkdY?=
 =?utf-8?B?L25sUjRGaDI3dFIvS3RFanYwbzNMWG1SZnUwM05hZVVQemxJZXZ1M2tFZklm?=
 =?utf-8?B?SXlUWkJGQzdpbGFneC9GbWdXWVFobkMyS2NKL2hZNEM2azFXQjBENjY3Z1NJ?=
 =?utf-8?B?K0ZHWUN2SXo5UmNPaUxTUHB2TTR3c0UvbUZuRVE2ZzNpNVllVDhIb2dWcXEr?=
 =?utf-8?B?Q092TkZGS0V0MFlaeWxIa25jNEZsYnUrLzhmUDlFTHdqV1RBRFFyVm81SGVP?=
 =?utf-8?B?dDdpTnNQSWFhb0lLM2Y1VzFwYVFuNURoaWVsWEdlUkpSck5nYUtyTzlEZDU2?=
 =?utf-8?B?cElWKzB4Q0QweVI5b211ZXJERkF0Z3BnZUozcXp0aGVLQS9Bc1IrS0Y4MU16?=
 =?utf-8?B?NVVYTjBoWi9RZTZSdkdTQmxuWmVVMFZGOFl3VmRDTUgwWDBWbXVQUlFwOFpD?=
 =?utf-8?B?Y0dVYUtFZ0F6T05kSGQvdHNhMU9zM0VtNEpiYVp0WG03bWxPakZXRHJDazk0?=
 =?utf-8?B?VEtPeFZiU01KdlBlVnF0eEtZYkhXTjBlZnVGcGVXeXBTUUZhSkdFandMdU1C?=
 =?utf-8?B?OTB2MHFBMHR1M1hRN0VvcGxQb200MitPcHFHa2wvUXJJNFdMYlpGQ1hOaWl2?=
 =?utf-8?B?R0VSZGNkQlFYcStKQk9STmozL1dBV0xpUzFlT3J5T3R6enVRREdRVWpuVlFw?=
 =?utf-8?B?UWlQcEg3amtERTR4Ykx0ZmtaVWkzWmloNmJpU3J1RGhnTEd4N2RJOHpoeWsy?=
 =?utf-8?B?Q1dyVkwvVVBtWFVGZXRrY2hjNGFCeStUNnRZOEtRMHhwaTcyeVJsd1FFRGpZ?=
 =?utf-8?B?R0tIRmw0U0xFR2sxQlJ0MGNqM2tnYlB5ZCtKdHRQWEpqWjRlZUJSM1F4QzRF?=
 =?utf-8?B?d3cvamY4MUxmeXZOSXRpMkQ3NzNmTXdOc3JSbTE2dFdLbFNGOEdRZkgzanZC?=
 =?utf-8?B?V0RseWM5d3IwemZQRVhvQmpHNzlQRFJWN1lkNndpRnlYV3RMbTg2SGRMSGNa?=
 =?utf-8?B?NTJ5V1VSeTd6NUZQbUx5Qm12WENNTVVYNFdZcWJsSGV3VXhra0Zyb1F3OTNr?=
 =?utf-8?B?VHJubjlOQmFoOXJ1MGNjcFJXVkR4MFZTdEE3SXJpZ3NZSEJ3dnNMa05aVXlp?=
 =?utf-8?B?QUE0MmFxVG5leFM5dlE0cUFqbzg2UXVJcmVMUUZUVjd3K1lUYVo0UTNnUFBh?=
 =?utf-8?B?L1VmdjdkMnphVTFHS2QrZ0k3WUlrQVIzTEhhZmRuTW5rU3VxdmhCQ0pJbEdk?=
 =?utf-8?Q?E+3q5t7dSUAAL823yB3qd86cBIzaGOeiDSEqf6XiYdzDz?=
X-MS-Exchange-AntiSpam-MessageData-1: B9IR3xughHWBng==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3643e74-6b0e-4aa1-93af-08dec67f2a12
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 23:31:00.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a99KeMhRjwpqFFkUQxmRn+DDM0pBaj/cDv74qcALCdqTRPLXoOOZvYoV8rtltYFXiqAnZ/KFsTYCVj4ZxeRouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9135

On Thu Jun 4, 2026 at 8:50 AM JST, John Hubbard wrote:
> Two comments in the FSP Chain of Trust message setup had drifted from
> the code. One referred to a variable name that no longer exists, and
> another described the unused sysmem FRTS fields as future work rather
> than explaining why they are zero. Update both to describe the code as
> it stands.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Pushed this patch to `drm-rust-next`, thanks!
