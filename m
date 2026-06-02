Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234B3D6462
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404848; cv=fail; b=XzervRpSnAjdroGO9zWLFBhxng/mmS5ptQj48sf34frtirjLVyqxD4/QonX+34Cp9nyQTfBKkiCDEyvDBsv5OPZECtH65aYBfKLQ+Mv3Z3aZ1PENekZYJZh3oVNmR5Vq7N9O+G1AJaJV/Qyv352n0ZMe7Vn0rVRPNu+1bayTebc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404848; c=relaxed/simple;
	bh=DMYJzmyXjwwAMPAgLuID+O87BeoRv6vIVFoeMz8eZFQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dnL0c4jMZ3gC6YDiyiSRUgorrqmLi4BZ2jCxjuq7ihEDH2IhDeaXaiNRPiPXoUrsey8u4EpME1g5F9EYKbOdpRVAUW+t3vzBTWdAajAAmXvyos1CibYG0gRRG4a9yHrCqYNVwI69efisRP+lG6N28S/Og0JgntgMtepC2ffr3GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FTXgKhnZ; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTXgKhnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqPCBQokpAIDJNHOiNKtlC/0wMzuTAAW9KMoAzUPLLfzlhCr/nWY5o1DP6XSXjbBaY0J92ccSXx3zMkB1dc1d9uo+vg4yhpThpIIT4vEfw/TPEoMY03FKrOEmuUCQKxaL27L06pHUbI6Vm+Rz2Snxco+SwmrR8jZUd15KeDMneWjnmadU8yvX7iY/yAuMh5z8VoBq6g2yrsXpnYCdoUQ2ZJMVr3Aomkzda+lrLifBS/IPIcVjyOsH/aNUqg0j58fo2USLXNPTAj97ndZzyd32tP6BWk3E3tkp69b0r6CkNFRiUbD1VuHUSDBgpe0wKUfrQqah2JGl6CRoGt6Jnitjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9/4PcXmSTjqhlO0J8QArb+X56SdcPcTQkvfxghlMhc=;
 b=fn/Y15g3YvkXDsQXtsVV8/zNAdYZ80NizojdnJ4HnediuhFg37cIs1pz8mtVGuMyD5J+xx6ntpDwb79+YfCVKlbDt6EEbmHSyGCd/0QUBAyzPSKl+PL/SknwunGqs2znEu3iUO/cxbVB7w6qe3ad7D7twy+fctU2c9ldPjShWz6Ohw9+5P8T/Kz/xZDioPg8CHtEz6GfDVATYE1Cl9HB/tLcc3BPoXZ8usCpsDXfkNoG4Pv3n/LT4St+WeX1tWWJDHehvQ+W46fCfwD5aeS4mBbXW2aLytPDbtqpv1OLZCd5xsPiAZu7tRWeg58egLHo/olNfg1rk0l0UGXQ1vGFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9/4PcXmSTjqhlO0J8QArb+X56SdcPcTQkvfxghlMhc=;
 b=FTXgKhnZBwExWeYOqX0EgAc1LlkKpO3Ylmt0QF/276ZFdbyTzRDTIRDesC4ZHBHltOkITXsNaQDImabXFmyFbrqzUAxTT7WRbkQB/GE4AABZMygn+QjvoPlSAYrfby6Q8jx5Sm8tVelnChpv2G0hJExd81LBgAWc3YivkKQky16ugGcoIryyGB8byibFTRcBg5akAxvgXxj/Mi/+s/BeBmcS90aRAQxiqGZH4o1JPpstKucQv8ILquH2AOvZIT0lN0fx6CM4ZOFAM8m35GxCwE01bTS8zNcd4WOsXm38FEqMUBV5fSJMwL18LK3Kl4+hEWztqg+o6hopQ6Krj+Cxlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 12:54:01 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 12:54:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 21:53:57 +0900
Message-Id: <DIYKUB4XQKK1.1JSE9PIRG42D7@nvidia.com>
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
Subject: Re: [PATCH v12 16/22] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-17-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b056a28-c136-4cc0-54a1-08dec0a604ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|56012099006|4143699003|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yNMTYPJM4CGttMgjcw2EggbU93AsJL/yb1g87WZjeNivay4Kfm7h/XNeVVHGFKulGSi8ZTnUQyVQ0+I40z5zH8gJQJ8GykG1TiD3GhrQitk4jRhIUrNUlPpHvld4IK+bUQZGH2H954L0ss1LT+xPFI0mcXTO0huOCAJG0n7dwA4tlTmghXz8CH+Hg/GkcGomQxh3iREgRFIUPphWew6xlpKHZQ2ARdIlnmi3B7myXUSS7rtTy8RhFSihdgIrVeC/vYreey5CDSHgr+af/j+w6crqyCC+VWTeZKqS2U36Ai/dyzHR99xpiV1Xm364YpR+wlnSsif/rj3DUFt1OZDO4MQSW0wbPcb7VFVrPTyXNx8C5f/5NIvxCM2gsjyMYTrsfdDyVVev3bI8jxmdf+OfK/azqv+970cV59r1Pb3a3hoT454KC15XNGa29UoOrmHQWNPOc4kIh+dDEnjYQdCtsIOW4VOVBm23Zk6gp8Uh47lVMEHDV/2Y19q/2NwEYp27ZCe8M4b2vKkpt8ih3dV4+qDyiWRm5SAdMsv1XHXgmP0xSlBlq6frzSIRoePpA6rTBSzWXvANyufMwPvpeHyp3HFAq/DfLxmT634Z8JRGFJJWTTmI9NrgyKL34FrcCDKBUd4W5ehFShMPztzq4L6cfGiZSGpJgMbMUmEOsBdvvvVbTJ1dbrvPzLVZzdzi3jwC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk10dXhpSmY3WTVJOU1qdVZWbjhtOE1UVmlDQ25lQjYxZ0hlV0JPMlk2NU45?=
 =?utf-8?B?S2FibVdZaHVnK25BNlEyQ1FKWVdwWllYTUZ3aGlPbUM3RzJCb096bU1LYmd3?=
 =?utf-8?B?MkhjKzZxcGNPem5FdzU4OS9NM1BkQ1YvRE42T1BtQjBOeEJ2SWR4K2J3UEpW?=
 =?utf-8?B?cWNxTVFteVpnOXRnZmt0WmNnM3cyNE14WGZHL1dBR0lyOWd6a3lSRVpoQzZJ?=
 =?utf-8?B?eEFTR3dZY2hIenNDTkdNTkgyekxKL0dILzRUZnhTRXBzc2pQZFZmYnlPcDlk?=
 =?utf-8?B?cjdlb29ISDU4bWNSS25kaUtMR1Z4QjBoTDVySEFjNkFZRmhBL25EbitkZjVT?=
 =?utf-8?B?WnFzR1dtaSttZ21McXR4S2NxL2RGM1hPWSt3QnB0R0laeVh2cmM3ajgwUE5q?=
 =?utf-8?B?ejRWemJ5bnpNajJsVVZ0dCsrZ1V2c1llU2lkcG5XYmFnUEJMTHZraHBEdnZs?=
 =?utf-8?B?Y3V5WFZGWWNtQUNmMjMyVTNUUFhyTkxpbUlyS3pWc0h4ekRZZG9DMjlQTTZP?=
 =?utf-8?B?TnBrZTFVZU9ucEZSRW8wTU01STJRdE52VU5ZTE5YTGhqWnRDVW14MUNHMVkx?=
 =?utf-8?B?T0czUnZMS3NncS95WThxN1UxTDNDVmY2a0pzcnZtRTVVb1dTajRadEFPcnpj?=
 =?utf-8?B?YXVBQUhQT1psdDZSTlNjZU51K09WMCttRENTS0tUVzU5U28wMDA0SmtGODdU?=
 =?utf-8?B?eXBCTmVPbE1qNlpybE1zRzBjWElXMmhaMTByUGxIUnJRQUpQYWd6cldlM1Nu?=
 =?utf-8?B?cVZ6cHptb0E3T1lPTW1zVzU0K243dkRqSVFMa201aTQ5V0pwU05HQkV3cTlL?=
 =?utf-8?B?dnhuUlkzT1lCU3MvWG9aWGM4WVhaaHNsKzF2SUxudGdzcTBSZTVpMGRXMG1S?=
 =?utf-8?B?b2kxTGJYcHRJdXdPVFNJamM1Nkt2YjFLdVNOdGxvbVRub1JVN25kT1lVaG5U?=
 =?utf-8?B?VjVnOTFHZVI5RHRXS3NhZ1VEVXBsV3Rjc1U0U3Y0ZmZycWtLVDNqRGdCVFN0?=
 =?utf-8?B?WGxRd1o3elFVb1ZYWENtam4yaVUzTmxhODI4Rnd4QW50Q2RlWWlmbndUYjlu?=
 =?utf-8?B?ZG9OdkwrVU1rMHR4UTIrYVhJNFdmR2tYbnRIZ09VUGozU0hMVHFpVjBtck9r?=
 =?utf-8?B?V1dBU3dxN3duRytLZDNmNk5CajROZldmcWJLQUhCMGpvZ21tTWxKRkRjemFw?=
 =?utf-8?B?eVpJc1V5MFdVWWNsV3dBRGhnSkNqdkF5ZnY0Z0ZjZFlSL3IyYi9wd1Njc0lZ?=
 =?utf-8?B?cFY0TTdyY0dwamxJekhsbmFXb1BKYXdBSkd3Uk54aEVQeXg1dUFPcVpsMVBk?=
 =?utf-8?B?STJrRGR1SmpQaHVoa3F2cytmT2I4YmowTytwanB6RHBUTUZGUjlLTmpUa3RM?=
 =?utf-8?B?TlNkMXpVSnlacm5sZ0xRT3Y3VElqWXZDd0ZkZEp0bUFkeW90SXcxdTFYTnJD?=
 =?utf-8?B?aTFlY2lxTS9NZytrQ3plQWQvanR1U2JJS3lZdWVaS1NGQ1hRMFpHNCtxSm5m?=
 =?utf-8?B?MGMwRXA2eUZNcERwb215b3dWbm16Z3FPVzJabjJ0QjdoYUd3WlA5SFA4MnNz?=
 =?utf-8?B?RXJ0cDR5b2lSdGhUZDJmZkxQR3VmbzZaMi9QVXViaTBoblRvRmFBbVJaOVpN?=
 =?utf-8?B?R1ZzRFFHWE5jd2RNU0l0eTFHK05ZMHlESHNmdXdySlErTkUyNm0zNHNhbnNQ?=
 =?utf-8?B?UUw5Q29PdjhXY2tPMnNpb2VWSlNraXBGbkZQdk1FYmVXdlpJVGxlWHhLRzhu?=
 =?utf-8?B?NTZGeGJUYjZ0L3JKZXZGQVBaVk92OVZiS1N5bXJtZitiSUt5T2dnbzRqV2Vl?=
 =?utf-8?B?QVNkTFBUSWllRVdRUm15bVZ2WjFNQndoeHgxU3A0NFFzUnpieUR3YXVadzlz?=
 =?utf-8?B?ME9qK1VwL1E1Q0FOOTYyR2ZiU2czR0VJT1JJelF6TWh5S3AxaXJjcDA4ZFVo?=
 =?utf-8?B?WWhjOVhFaU1TaWNIQzBCQ0lBSG5DV245d2tNOVN0UjNKZSt1dGVOblgyWldD?=
 =?utf-8?B?YWE3aDJOVzA5SGJ2bUZycXhZNHFRY1RJNld3RzNEeWJmKzZPRERPVWxFaU1M?=
 =?utf-8?B?UWVMUVlqcjBlbnlFaE1jZUh4eWYxNUZVNG9Lc0ZkSXFVdXR6VTNLSUNlcmRk?=
 =?utf-8?B?MmNCOHRNb3o2OFlueVg5ZXNkUGh4WTF4dVZuZFByTEhucE14cE4ybDl6azFV?=
 =?utf-8?B?YzFqaFZFQzUyRnJwdFRmMXB4blZzRm9wNktZa3VzYlR3ZzBLUnRPSkFZRFFS?=
 =?utf-8?B?LzJtZ0l6Mi9hWDVKc21POXFOcHg2RzRMai9SVDBZZFdlYis2aDdrcVlpVVpN?=
 =?utf-8?B?MjJ3aUhQTWlFYW4rejZpUGxQdlozUExCREVZTXl0Rk9ycVIvM1YvSHdyeE1W?=
 =?utf-8?Q?O+bk+HBvyMqRJWSfrCvRxL5rDMXzgsnCTkIxnsOC0fL1s?=
X-MS-Exchange-AntiSpam-MessageData-1: wi4ygBmSwSfIsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b056a28-c136-4cc0-54a1-08dec0a604ef
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:54:01.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrlIzgNHIyUDMfrBpD2Km7MDVdXGJv9eU7UG08YZS5f26mUyyJOHjA70aZhsRa2yX4rHUgRAkUqWEZyCBI1zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
> Device Management) wire-format types used for communication between the

I think NVDM here is "data model" not "device management" (and below).

> kernel driver and GPU firmware processors.
>
> This includes typed MCTP transport headers, NVDM message headers, and
> NVDM message type identifiers. Both the FSP boot path and the upcoming
> GSP RPC message queue share this protocol layer.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/mctp.rs      | 102 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  2 files changed, 103 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mctp.rs
>
> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.r=
s
> new file mode 100644
> index 000000000000..a13146dc0cca
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
> +//!
> +//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
> +//! Device Management) messages between the kernel driver and GPU firmwa=
re
> +//! processors such as FSP and GSP.
> +
> +#![expect(dead_code)]
> +
> +use kernel::pci::Vendor;
> +
> +/// NVDM message type identifiers carried over MCTP.
> +#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
> +#[repr(u8)]
> +pub(crate) enum NvdmType {
> +    #[default]
> +    /// Chain of Trust boot message.
> +    Cot =3D 0x14,
> +    /// FSP command response.
> +    FspResponse =3D 0x15,
> +}
> +
> +impl TryFrom<u8> for NvdmType {
> +    type Error =3D u8;
> +
> +    fn try_from(value: u8) -> Result<Self, Self::Error> {
> +        match value {
> +            x if x =3D=3D u8::from(Self::Cot) =3D> Ok(Self::Cot),
> +            x if x =3D=3D u8::from(Self::FspResponse) =3D> Ok(Self::FspR=
esponse),
> +            _ =3D> Err(value),
> +        }
> +    }
> +}
> +
> +impl From<NvdmType> for u8 {
> +    fn from(value: NvdmType) -> Self {
> +        value as u8
> +    }
> +}
> +
> +bitfield! {
> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA=
 firmware messages." {
> +        31:31 som as bool, "Start-of-message bit.";
> +        30:30 eom as bool, "End-of-message bit.";
> +        29:28 seq as u8, "Packet sequence number.";
> +        23:16 seid as u8, "Source endpoint ID.";
> +    }
> +}
> +
> +impl MctpHeader {
> +    /// Builds a single-packet MCTP header (`SOM=3D1`, `EOM=3D1`, `SEQ=
=3D0`, `SEID=3D0`).
> +    pub(crate) fn single_packet() -> Self {
> +        Self::default().set_som(true).set_eom(true)
> +    }
> +
> +    /// Returns whether this is a complete single-packet message (`SOM=
=3D1` and `EOM=3D1`).
> +    pub(crate) fn is_single_packet(self) -> bool {
> +        self.som() && self.eom()
> +    }
> +}
> +
> +impl From<u32> for MctpHeader {
> +    fn from(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +}

This `From` implementation looks unused in this series and the new bitfield
impl generates this IIUC, so I think we can remove this.

> +
> +/// MCTP message type for PCI vendor-defined messages.
> +const MSG_TYPE_VENDOR_PCI: u8 =3D 0x7e;
> +
> +bitfield! {
> +    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message he=
ader over MCTP." {
> +        31:24 nvdm_type as u8 ?=3D> NvdmType, "NVDM message type.";
> +        23:8 vendor_id as u16, "PCI vendor ID.";
> +        6:0 msg_type as u8, "MCTP vendor-defined message type.";
> +    }
> +}
> +
> +impl NvdmHeader {
> +    /// Builds an NVDM header for the given message type.
> +    pub(crate) fn new(nvdm_type: NvdmType) -> Self {
> +        Self::default()
> +            .set_msg_type(MSG_TYPE_VENDOR_PCI)
> +            .set_vendor_id(Vendor::NVIDIA.as_raw())
> +            .set_nvdm_type(nvdm_type)
> +    }
> +
> +    /// Validates this header against the expected NVIDIA NVDM format an=
d type.
> +    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
> +        self.msg_type() =3D=3D MSG_TYPE_VENDOR_PCI
> +            && self.vendor_id() =3D=3D Vendor::NVIDIA.as_raw()
> +            && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type =3D=
=3D expected_type)
> +    }
> +}
> +
> +impl From<u32> for NvdmHeader {
> +    fn from(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +}

This `From` implementation looks unused.

With above comments resolved,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
