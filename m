Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E24399364
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218734; cv=fail; b=ZwBnWH7CwbtuzCooUcYgqLcQpkxXwck8Z3/KKwHvvV4/iAgu/Or9WQ+pZY5oWKZOIy3zR3Ueme5wTeB1ksegnCsA/4k/aMVBt+oRTuL9a5Gtdt1HCuis5zlz4mqt14EJCeGak+6P/VFWjisG7fUAuS7zWcmpBb0matPSiTXnyF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218734; c=relaxed/simple;
	bh=On5S0dbPwsoRgk+xonNot91oqzZDLdngsX0C2rfQSh4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/YzEtsYEYcPSuuQaRhv6NXGKMDFh5S2rU8VH7CotyobtCMWHZK/JqUQXw+CdBHntPQvD7B1kWPd5AHgjJmCB1zBqynnsKwJW5CUQ3B1YCGRhoAjK7B1Tj0ERH07AoM1Er/wylInXq6SeO4kDr+PCRjxfZxjROsnINayx15e3Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgwSZnwf; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgwSZnwf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvVpI6GLB8oG3OcEynd7P82PA1XdqmsGQ8eXugWsh6MBvMaNy/mIi2nkvIGojsUxdu883mSsbUGoDLcrm3hOpwtgcaIWocBDvWQ3qUhecg1DlOvzQvqRQtDSXdmChDvWja1Bp3kOgUPxCc0aj/3NUHxLaN5VTsIiXubwKJ/o7I0sLzlBfQKcbtj+xu6RVKAIjvGaaJNdpBhHUaHGbNQBKYeuYT1GVMSmf62qckzjinusxQPcWdkkoS6ksNbgTLe1AS3U64PvIAJb3imNFn91BHzjhcpotCMYWXHr6jiFd/vW+J+L9RJAk6UWFBZ4Mql1ezrnZP71iVL+PeRL6COyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMe2zBGyzANEqv1N0B5/P4K0c5rNC68P6IWBuoIuqNI=;
 b=yfHeNpQBGYYAh5qB0clJrzlpMBg6Js/tSvBeckeBdqlPoyGJRTjPtiChXnvjbw//C8JrXSuE9MGD6HW0usEgq4cQ3yVIrr1nsXUxA++vHr+UR4JBAlIvH2ghvy0gjc26w5IPwIDY8CU1NvgQS17dM1O9HR6Cdjle0PH9+zFtsxBwthnXdLcF/d7YFIrSmc2y5SZEpfZhQq7VoEujCf1SSKjfoPLG9gNLgqBz1Qgj7ogGZX26gIygkp3tn6I4K32doezdhCJap/0unbyhSHxcGkgeWODZnFWjj35BuGTLBRmITK1y4UK2UoJv1rwOBrg01ohcWNCDq7h4/teQraZqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMe2zBGyzANEqv1N0B5/P4K0c5rNC68P6IWBuoIuqNI=;
 b=CgwSZnwfRUxPJaIjY/tX6uvstUhkMslkk/eGCvlY/Qc2CXpf0t4+/ZwzG+w4SWP9AnCQ5CaWQ8Wpvz/MC5UKfjyExJ54BUmwj5mjaSIJ4S7cCXQonlQiapuS4zAC88RCSSsc5/SKd+XAWPXweYURS4DcbwtdMNfSeshqo19ls/LCJFRYGd2MYC/gB/Pd2l48i8C6kM0B2yeziFtCgmVBZIIX9wElt6JGV8/ISfJBmfHuZbx9+g3cXKdp9oWXhu8YIyk63Si23Sp2Eu6wfardQbSvcTK6eH3BNUytex1eyv/TkzEizf4Byzug3/+lUSpRvCI+YukhE54d/UOqlwH9+Q==
Received: from SA1P222CA0071.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::18)
 by DS5PPF8002542C7.namprd12.prod.outlook.com (2603:10b6:f:fc00::657) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:38:41 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:2c1:cafe::5f) by SA1P222CA0071.outlook.office365.com
 (2603:10b6:806:2c1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 09:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 09:38:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 02:38:26 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 02:38:25 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 02:38:21 -0700
Date: Thu, 20 Aug 2026 12:38:19 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/27] gpu: nova-core: set MCTP transport header version
 to 1
Message-ID: <20260820123819.20bc6289@inno-dell>
In-Reply-To: <20260819035221.336390-4-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-4-jhubbard@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DS5PPF8002542C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 8327bc8a-8469-4cac-ac02-08defe9ed195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1IHarmUsMsJBVcERHIaoVwoPBweyg08BfB8UC4r3s6FhzIg3VFpCX2lc4Vp5H+e7kKi9AsP0biwP5PuaSl7XDtVhty797hnYRjJLvMVEhr9J4Qkl3Jfzw8zg/VShtQegmAXoYe54XquOpRguEXTpqBdctI1aUuktSStihx9eXZc9kYxEFakaXOo+DkKdqHTuvPOJjfyxs0Q+o+S/uPVigbaY9f0R8/275diBPks+D97Gnf5p1tko7MU8BUOKT6KBPQq1npTZIfnH91lpgxfMfxeGZlh2tdpnu1zUhDCtd783TaOyemqSFuqW8kq1551sp5tiJ3xKOlMCVT3VuGWOXsPDwP8tmfCZx05vg94raZX2pi035GrbShzus2yPBH0lwdxFvZFmibF2p7MC9l+rpSsWvpCjpEWNFSoWOxi66IN5K3xaqgvt+7cbIPeWJvXVxEYkwSuRL9u7C1ASZ0Eay3CXehduCLbIH9I4veD10yMAevLd23/zT3tx37Fg5PR7bnbspHlBeSXk56z/OvWzVobuqpI3porqKUXabj+clqLkWvSJKF0tUNDcV8L84FFpPmrwMqiX/huzmXzzFkeTmUhEC9IR/2L9UuPOldW4Ie7yMNQhtDHQ3izTBl04h3FvnGa3Xy0q/oW7sPxx9FdNDlDD6Th3keoiAQH7DmbVdGivw7UJlEl9fYnSNi6Vcu0uJJuL0cPcwI3eBRr/UHQ24Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G119jQSU6rI/P7iHushEZxtPGppeX3bv9K8wnsG8ZGkywW2h/jXdpyVZTfzMKjHEiai1LbWljW9INVasu42Wqc/Dzz3QnJmoAFCe+C/QhwCvdFb9oM6Lwj3qmNDrGD2Eq00pwhlSi6LeOx5Odf7QbC4eTp2Y4QdTbGluGYGN6ifMg2ml+b0Vy3wMjFstNGzbiQFea1c12w8HIAdnwkaVAJfmzYPb++4TMlThSPoIiJ/IJQE++t2WpRpuU4r+w9+kL8I1evmJDZ2fcAtNW7McvMpnu+hR/8FDxZWxwwEiCiVl+p4ZiefmV6d5985Gy5pTbqh+R8vrgXrJ7D0mfMIg3yb2Qpj5zidsbYKDsR/lZfa8+KeTr4Ba4AqbN4JpO4lwGVKaOPjmboDMMYtfNo8dN2cGXf704WJHAbWlRRGWGgxRL5sTZ/xU8CIaR/MlFq/c
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:38:40.6329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8327bc8a-8469-4cac-ac02-08defe9ed195
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8002542C7

On Tue, 18 Aug 2026 20:51:56 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

One nit: might be better to update the doc as well.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

diff --git a/Documentation/gpu/nova/core/fsp.rst
b/Documentation/gpu/nova/core/fsp.rst index 52d618d22bb8..60c647181da0
100644 --- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -106,6 +106,8 @@ All FSP messages share a common header format
consisting of two 32-bit words:
 - Bit 30: EOM (End of Message)
 - Bits 29:28: Packet sequence number
 - Bits 23:16: Source Endpoint ID
+- Bits 15:8: Destination Endpoint ID
+- Bits 3:0: MCTP header version (1)
 
 **NVDM header** (NVIDIA Vendor Defined Message):
 


> FSP requires MCTP transport header version 1. Nova-core leaves version
> bits 3:0 at zero, so every CoT and PRC request carries an invalid
> transport header.
> 
> Define the version and destination endpoint ID fields. Set the version
> to 1 for single-packet requests, and leave the unused destination
> endpoint ID at zero.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/mctp.rs | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/mctp.rs
> b/drivers/gpu/nova-core/mctp.rs index 90c642c91a72..03546213da28
> 100644 --- a/drivers/gpu/nova-core/mctp.rs
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -42,13 +42,23 @@ pub(crate) struct MctpHeader(u32) {
>          29:28 seq;
>          /// Source endpoint ID.
>          23:16 seid;
> +        /// Destination endpoint ID.
> +        15:8 deid;
> +        /// MCTP header version.
> +        3:0 version;
>      }
>  }
>  
>  impl MctpHeader {
> -    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
> `SEQ=0`, `SEID=0`).
> +    /// MCTP specification version 1.0.
> +    const VERSION: u32 = 1;
> +
> +    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`,
> `SEQ=0`, `SEID=0`, `VERSION=1`). pub(crate) fn single_packet() ->
> Self {
> -        Self::zeroed().with_som(true).with_eom(true)
> +        Self::zeroed()
> +            .with_const_version::<{ Self::VERSION }>()
> +            .with_som(true)
> +            .with_eom(true)
>      }
>  
>      /// Returns whether this is a complete single-packet message
> (`SOM=1` and `EOM=1`).

