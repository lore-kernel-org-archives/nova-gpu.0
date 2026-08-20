Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581483F6C3B
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223255; cv=fail; b=KGIfdazR6oJzasM70GCSkmIBruhF4BCzMkUN8VKLSr94pJNlMKzD7Q19tYqvuCfJvWVNHrMITiTT5QrjXYGn6InVj+4p65J047r5+KHtMMS49ilIyYq47jO2/RNaE8jJJvlsMztiWoHzM1Y68SKvJWKG0CE2fY45+OU7WwZS4jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223255; c=relaxed/simple;
	bh=t//vAPKnFcb+Row1o1toko9xOSCicbPJQRylgLUUSoY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mH7Pclw+oVI+TonkB03jibG9rgbpqkxvaPSHNLQTNUYWKJu4hCMZ55JvH6dm7wT9r/38SZKy49p2po9ft6Gy8aW7AuDaGRuBzmKCNbX2LiWtlB9WCwV6xboLrRKOv5rriUAK8gDCGHcNJfy7J2QdQdkmu3sw8V1mIqEOvI3NmHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Id8GTfad; arc=fail smtp.client-ip=52.101.61.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Id8GTfad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3LKYzkNy4uNYentxlrIuRNAjX7fNl1JrAf4lab77ane6Zf+4mbryq4mInIRD7ck/qj6nBq4YeGv7cTDmUPxPjz8VYmio83WRxEqdGktLIH/+aSoTQZQKL480yTYrsIjTqbiggZLaTkYbO/vZlQb9NSFFfcYRyrx+6MxTbdVk7Lu9B2ZLiAPFgX7cm471sR/tRCu7V5U6tpF7sAMnjvRn4hiZ1CPMz66/v3viVgEO9vTUYnIzN6MA/HxPvN17dAAsycZIOLlqscYd5YnIiLERtNLtK80k6WxQpJw6zmfd3G5I8+hR0BT8ISHHxVtQMa7dG3ODLfGF9qDdUlpDQp7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/pC8imv2ErrdN5uipvJp0qnx3aMP9R5qASifuPri3o=;
 b=FpGbvDWSh7my2Hmz6zANpGDc4o3koTF0RaCENVc+kYbm6NNnX+r0v+iRbUUU1PpbVHLsLsuhu2A0GmTAy2NNUC1R9RxSPlGpyi63uk7PfCxpuOQ41efZp7hvDVFsq8Jm26TdEhZaBXkOdEg+4KHMo+6LZ7wu0mFFh6+02f4jV5AdrqjfwdNYD7E0Nat7KhWw2DtVzT45Xoc4y0+cwhK/kHkBJbBbW+gOJG+gI2HP2c1tuD38ZwYH40izRVuhiRjxX20/1zkTOWTn9ZQSb2Nk8aJQAhGQ+y3hkGmVg8R92EWRlCEgeFaGa0zqrbGKvcRWjuI6eRQ/mxuJc87AXmUZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/pC8imv2ErrdN5uipvJp0qnx3aMP9R5qASifuPri3o=;
 b=Id8GTfad3VPvv2Mx5qjSgpwiqgF+RMzS0/oOkJyY+Ae5/cylOHjpuU5KkPKmMzfuLgQUbhXXcecf3C+qhWoW6+Q5ahfdS90j34vSbo1LhmjhxHktEpyo/T+jvfDbC1uSwXnkngPg4RmeuQTRuUV32obOtPVYenr9AY1i6uEkNJA2dBZ2uP9j/N1nY0JGpkOZMaTIeMqezFUm3vBp+WfM6vbgJi5uZg5UZgHh5jFBcpn53DFURId9hPV72JBfAuONTDMj+0XxfOTrpFSMcqpVlzGIfUhrjSyUdbnJr/SGtGHsm1xIZX3ADOV60yrsw806HYi2Mof9HWM+92XDGIqO5w==
Received: from CH0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::18)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 10:54:08 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::ac) by CH0P220CA0012.outlook.office365.com
 (2603:10b6:610:ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 10:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 10:54:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 03:53:59 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 03:53:58 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 03:53:54 -0700
Date: Thu, 20 Aug 2026 13:53:52 +0300
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
Subject: Re: [PATCH 14/27] gpu: nova-core: add GMC API message types
Message-ID: <20260820135352.6e387428@inno-dell>
In-Reply-To: <20260819035221.336390-15-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-15-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: c7092c20-280c-4a49-7bfa-08defea95c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x9RaE4k9hjKqySIWEFHEom3t5QmJELXCaAJQkuol5yP6yBzUig2pDFHID8gyM9qez+18XIBU+yBdYCWjMTaXnfBSHaiaVxvv/BSvVqatkcDqHk3Jy7rWJoggPKWcMQ2ssNqW8vTqsUQIy1UetSB2wP/bplpHFrawjqh0khXa31wE0zLtMwQWgv0ivRh7f0h9vXC7nArD+RZXrx9m8VKhwEPr47gm1EBUEoQznYBxO9N6aOo5gCBnCd+7059zHu+UQ/k1d7z6Lch37qvW3SGUSrSn3QFtDX85IzpsblmpWP1aStBgSS6Ec1+TrwxBZ75v5gOMChlx1RVIy5JHPqVoFj7k8yiSFaoQJXCUBiaKPeTAxIwifi7z42hdy0gtLqi/OyTJyzlTCa3gCcCV6REs1F23j1n19Bx2qAvYfwmkxuHp/gZoan/glkR93TiU0J/CgIVnqh/ZNus6xXyqjE+6JIpPGz1y9DstgehNZi5+ROVKAaS0mDoJ3V0DMX6sexFCMFtePyAQQipSlAYqdJrq7z22l4ipqEbywm4EhunhGUWuN+D/SqIM4egGP6fUAKJh0prTct50k+NT542il2H3HYU4dFjojkK07TqAkwkxpRBNCyFA7Bf6L89tGynpiz6OSvYPHBxqtLwHxXDdp2D+gvJnhc001uQV5Ogt0wgb9Ai3VTmagHQWPDm45XW8TavDi7FLCtd1K1/fBnKZK8deeA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MuokwlN9APfbi1her8KJyFmIby9yn7IkAgAhyZUbD55aBxZ2WjV5s6TIjdlTWkYeey9RHv+6MnCe2bhEAMkY3kIeZ3ZXgB+1RWpJJofnt+bnqnRD/nBygGFj7H5nOnnRyffk84E67owfnx1+mvyIfy0X8LWkhetnxZG1s16QloG4usa50FIUei4kwTr/3+Nwh6H/BffrMfNRjT5QNQWysbY6DFdOP/6/8SWZkLDmEg2Mz5aUt63NR2dnzI/u7jXzvvLCDO+SnxPuv7lDUyMG5e2DfHWgpml+0h5VBmZPCo3xsihLKC+BA6Y6mHq4Q+4jbAS9vdK0eiSLdRU2GjvF4TO2xJaRYjPkxaOV2erXBpsTeUI12CE+cr9n0uFmaNqdElpB1S1ce3fe3rCnXRrOLPruw+iWZ/u3TGJdj0p09Q/0GZCVEJhUqOBQ0GRjYhgL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 10:54:08.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7092c20-280c-4a49-7bfa-08defea95c42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532

On Tue, 18 Aug 2026 20:52:07 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

snip

> +/// GMC API message header.
> +///
> +/// Matches the `GMCAPI_HEADER` struct from Open RM. The `command`
> field carries +/// flags in the high byte and a 24-bit command ID in
> the low bits. `size` is the +/// payload size for both requests and
> responses, while the union at offset 16 +/// carries the maximum
> response size for requests and the status for responses. +#[repr(C)]
> +#[derive(Zeroable)]
> +pub(crate) struct GmcApiHeader {
> +    /// GMC command identifier with flags in the high byte.
> +    pub(crate) command: u32,
> +    /// Payload size in bytes.
> +    pub(crate) size: u32,
> +    /// Sequence number for matching requests to responses.
> +    pub(crate) sequence: u64,
> +    /// Request: maximum response size. Response: `NV_STATUS` code.
> +    pub(crate) max_resp_or_status: u32,
> +    reserved: [u32; 5],
> +}
> +
> +static_assert!(size_of::<GmcApiHeader>() == 40);
> +

Should we use the GMCAPI_HEADER in the r000 bindings?

Z.

> +// SAFETY: All fields are integer types with no uninitialized
> padding bytes. +unsafe impl AsBytes for GmcApiHeader {}
> +
> +// SAFETY: All fields are integer types for which all bit patterns
> are valid. +unsafe impl FromBytes for GmcApiHeader {}
> +
> +/// Header for an unencrypted GMC API message in the GSP command
> queue. +///
> +/// The fields before `gmc` match `GSP_MSG_QUEUE_ELEMENT` through its
> +/// `noEncryption` union member. `gmc` occupies the start of that
> member's +/// flexible payload array, and the GMC command payload
> follows this structure. +#[repr(C)]
> +pub(crate) struct GspGmcMsgElement {
> +    mctp_magic: u32,
> +    mctp_payload_size: u32,
> +    mctp_header: MctpHeader,
> +    nvdm_header: NvdmHeader,
> +    nvdm_payload_size: u32,
> +    reserved: u32,
> +    pub(crate) gmc: GmcApiHeader,
> +}
> +
> +static_assert!(
> +    core::mem::offset_of!(GspGmcMsgElement, mctp_magic)
> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT,
> mctpMagic) +);
> +static_assert!(
> +    core::mem::offset_of!(GspGmcMsgElement, mctp_payload_size)
> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT,
> mctpPayloadSize) +);
> +static_assert!(
> +    core::mem::offset_of!(GspGmcMsgElement, mctp_header)
> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT,
> mctpHeader) +);
> +static_assert!(
> +    core::mem::offset_of!(GspGmcMsgElement, nvdm_header)
> +        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT,
> nvdmHeader) +);
> +
> +#[expect(dead_code)]
> +impl GspGmcMsgElement {
> +    /// Creates a new GMC message element.
> +    ///
> +    /// `payload_size` is the size of the command payload following
> this header.
> +    /// `command_id` is the GMC command identifier.
> +    /// `sequence` is the sequence number for request/response
> matching.
> +    /// `max_response_size` is the maximum expected response payload
> size.
> +    pub(crate) fn init(
> +        command_id: u32,
> +        sequence: u64,
> +        payload_size: usize,
> +        max_response_size: u32,
> +    ) -> impl Init<Self, Error> {
> +        try_init!(GspGmcMsgElement {
> +            mctp_magic: MCTP_MAGIC,
> +            // Despite the name, this counts the element header as
> well as the payload.
> +            mctp_payload_size: size_of::<Self>()
> +                .checked_add(payload_size)
> +                .ok_or(EOVERFLOW)?
> +                .try_into()
> +                .map_err(|_| EOVERFLOW)?,
> +            mctp_header: MctpHeader::single_packet(),
> +            nvdm_header: NvdmHeader::new(NvdmType::GmcApi),
> +            nvdm_payload_size: size_of::<GmcApiHeader>()
> +                .checked_add(payload_size)
> +                .ok_or(EOVERFLOW)?
> +                .try_into()
> +                .map_err(|_| EOVERFLOW)?,
> +            reserved: 0u32,
> +            gmc: GmcApiHeader {
> +                command: command_id,
> +                size: payload_size.try_into().map_err(|_|
> EOVERFLOW)?,
> +                sequence,
> +                max_resp_or_status: max_response_size,
> +                reserved: [0; 5],
> +            },
> +        })
> +    }
> +
> +    /// Returns the total length of the message, transport and GMC
> headers included.
> +    pub(crate) fn length(&self) -> usize {
> +        num::u32_as_usize(self.mctp_payload_size)
> +    }
> +
> +    /// Returns the number of elements (i.e. memory pages) used by
> this message.
> +    pub(crate) fn element_count(&self) -> u32 {
> +        self.mctp_payload_size
> +            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
> +    }
> +}
> +
> +// SAFETY: All fields are integer types with no uninitialized
> padding bytes. +unsafe impl AsBytes for GspGmcMsgElement {}
> +
> +// SAFETY: All fields are integer types for which all bit patterns
> are valid. +unsafe impl FromBytes for GspGmcMsgElement {}
> +
>  /// Arguments for GSP startup.
>  #[repr(transparent)]
>  #[derive(Zeroable)]
> diff --git a/drivers/gpu/nova-core/mctp.rs
> b/drivers/gpu/nova-core/mctp.rs index 03546213da28..0ae88bef2a05
> 100644 --- a/drivers/gpu/nova-core/mctp.rs
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -28,6 +28,8 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32,
> 8>> { Cot = 0x14,
>          /// FSP command response.
>          FspResponse = 0x15,
> +        /// GMC API message (GSP command queue).
> +        GmcApi = 0x26,
>      }
>  }
>  

