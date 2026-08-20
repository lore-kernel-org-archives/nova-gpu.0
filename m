Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9C43C7A2
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231012; cv=fail; b=I++Ue56Qdl/TsDKKYGS5KAdpcrxbaOpkn7ouzVL8nf4nTOKI273PXE/q97aI9meiTHPVv5IIYdyIXvMS0bcY61UGKJ2CgW4tqs1/n6/0rP/Qh7AGcqsS7NoZtsGlwOlMzbKk8RsVhkzJaVuYNPOX1ENW1IHYsPnm37l/R2XJKmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231012; c=relaxed/simple;
	bh=Tct0sQAod2YNUa3yhKDgGOdN6TH/c/Kd0iDehFZelec=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChEmbreDWhy1yyaaLiGDlslVlW6Qz4mywznNYUjacZIxXrZXG0doBAxBPMiTNdgIpdrwV94XGiLJBAhZ98hs/g2ZuP1mOi1LUDz1/ngXvccGDrHaklNMlke9h1tw9salvP7BmAxKUfRvh/CFKHlO59q+yjrgdR0/Js97MhsACR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OoIIO8LV; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OoIIO8LV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoiL0VJCdNtbIbU6xf15+C1py5g5sKnTWMb8bgUaxoqZauW1u2CX0PdhnEXYskhSpdLAo1lhA2jc4owep+LkD3zatUfCxMvyWmQUrIW4lGa5yzdKHGjVNXDKaCsS1Mg5nDaFa7R0oF9P3LmXQf7bWag78OjxHZUez+25OrlEmgF51RMfBr03/IF6rcGbtfsvU22l2nk8zRVU/IIciynZKMQHGA9rV1A01jMwEsKxKB5ic0bDym7WfFrk2eL3GP/rzFHNVqOgNnzVQFDjBjvWMnH5elmjQE0qOm2OOV01RT/AoXDxI11fFqubE4sWzg3238oWVS7L4M56lkwhWGcY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HByEMOLDy+3Qwb5XZsIKmkVLEMBcT22415j50mIYAg=;
 b=uWHMZBcM40PgAS+wJ2+J7GnDzR0NMcthwUnTqGyoGpKQX9bBhfRm5wMVxAO6eLc/uWjQbzzFjXlPYfIJ34PPo/AYkE0o+dLeNpGplUq9rR+VZ/a8IeNwgAEwQowPyGpXvIEti2CTG2CNXvBCt0VQn9vDWrp9BdcbUABywuvbmn1pzMVJCT42NwwYb3HLST2bZxT6FGf8EZbgSOxq6Wdp1Jnu9c5DzqK6UwBkj1Ov3n9wwdFu2JQfBVd5S3/GYYcBqqYSSUMBUYgYNjz+JmFV8AzRKqNcLAPEVi8QkzLkarQqKB65i3ySMK5B1V+bEm63Sb9INH70p1J2QUkV+jCKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HByEMOLDy+3Qwb5XZsIKmkVLEMBcT22415j50mIYAg=;
 b=OoIIO8LV0FgjbUtGU88pai9VhmWwQvqUBZfRHz8ggvnCQbkOB/h8rJxVaIxbscGLJkLI3ieM3Xaa/XbTHL5vknCbB0LJoZNIEiy4RTE98CjXebQmRxslohidCHqJdrwqeF1newOEOqiI07jPZHuLaQS+Gm4AtmZo4lHCO31mgLXQA6D4lx6Eu3GmT9JkViPyrRTNWGqByTC+Av3IoVvcmzgT6IjbLGvjSJj4m/zHCEVZpyZAyDn5JXaXXWvJx+pex59WFBAMbO7CNz9RauUbToQLVexYsFFU+uUhzyhnKnhDYV++hMylTOxRaZPIEcfcYLmKyVwB9mdMLUp2gqtBRA==
Received: from BN1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:408:e2::27)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Thu, 20 Aug
 2026 13:03:21 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::68) by BN1PR13CA0022.outlook.office365.com
 (2603:10b6:408:e2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 13:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 13:03:20 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 06:03:01 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 06:03:00 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 06:02:56 -0700
Date: Thu, 20 Aug 2026 16:02:54 +0300
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
Subject: Re: [PATCH 18/27] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
Message-ID: <20260820160254.3dbc9191@inno-dell>
In-Reply-To: <20260819035221.336390-19-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-19-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f016f8-4b67-415c-a6bc-08defebb6913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|1800799024|82310400026|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VNJnmG0sLkMBcOFXMkJK1nWwlFapKFvqRVAhw0PtW3UYL9/+M7rCVqLKlJcZmShcjrnQn+iLenXBniwir4D0cksyW9/NKXkY+Zyu1rwQwKRjSyUofYNS79afEY7v0FOXb5iw3F2zVAafVU+rEmx+tnpBy6y2Zj/lFQM1JclQFVRXUPnFQSK2g6EMQfkk+bFMNUkns00aBf4uf2V9kk24VoDbCEhWuFjZHB7MH7B6nNH01HZl4r/drG05FvkG0K2LBOOLaTBIxExSW3XHgBT/mxYkAlVs37NTS+ggRtAewElpTfCzO4xj/dBOTCtFGaWI32EVejCZnojLcDkUBWKUD55+pgeLqlhaQ1ZMngkDmWXU/0uXaP2jV7bV1Q5fxXTuJoDsqpHT3aCs24GIMJtsU99DP+SCLIbkmYd0WmtC3M1Y2mR/2WEf/Tk05qbKy0ArWpBbZ39fxxnZv/b47KLc1QiJb1Dasf4uARBBi6agIfeLpPEqE2siQBBIMw/EExOzqjnhDw+1QixoZiprLtcDU0I66QBmMVyiTq1JEFe+KIbqTicbYX1Uer3bt1tIVrnxJOLQM6dk9vm7zc9H4SdPrPAcEOvSZSGnv3aHpc8IZ+4Qj9sTl5GWSQBS3IsH0QOyqqUiS4Bu7I+rdXVw2OfeiBMRKlEfbbIUxg2lzEzyYRnY0WpY4c0+KRSOUdxURxwHnJsz+svCWbpJnKEPefGHNQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t1qYfNtZYlRNozb6fKFnpNA+2vKvppTv2TEVqrx14zejwGKKYMp76Yo/ekvdvyav9eL7TQVcp1Jq7s1he2b/LoIVxh4Q4Szu4cXWJ3SE6FLhwC+hg5LCG/hEb0yC/JK7GYsP3vUrhBKNrtEErnFgAVLaVQCJl4Tovyk5t/FmgbnhMXp7HMoEI1kRHo9JFHjulALmy4U06yRJ/XycD5XsBq7b3nrI0yuFWVJS7LRK3P8OMSzBgrklYyUAQEr7Fa+N2pXwKFktW+w1VLzWwQBDkmi/kLR4H3QkHYTpLTRrGdjd+/LkA6qW0S+JCCUbmwxS7CyT1A6Y5rXVZQf91b8mvwdrg+lzt01MWc9tGBRyjL7PKPDVG+jA4tQgvZ9rGtmKpjC8+TdA9tr0ykpAhFfAj4dkwuVUZokdVDmZeZrMQzFGN9NowE/MvAJcRbD6VY96
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:03:20.6482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f016f8-4b67-415c-a6bc-08defebb6913
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466

On Tue, 18 Aug 2026 20:52:11 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looking good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The r000 GSP boot protocol sends a load-and-execute event for the
> generic falcon bootloader.
> 
> Nova-core stored the image and its load parameters in the FWSEC
> firmware wrapper, which kept the r000 boot path from loading it
> independently.
> 
> Separate the bootloader image and load parameters from the FWSEC
> wrapper. Place the bootloader at the end of the target falcon's
> HWCFG-reported IMEM rather than below a fixed 64 KiB ceiling, so its
> placement remains within bounds on falcons with less IMEM.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs               |  15 +++
>  drivers/gpu/nova-core/firmware.rs             |   1 +
>  .../nova-core/firmware/fwsec/bootloader.rs    |  64 ++---------
>  .../gpu/nova-core/firmware/gen_bootloader.rs  | 102
> ++++++++++++++++++ drivers/gpu/nova-core/gsp/hal/tu102.rs        |
> 6 +- drivers/gpu/nova-core/regs.rs                 |   5 +
>  6 files changed, 135 insertions(+), 58 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs
> b/drivers/gpu/nova-core/falcon.rs index 20a288050c37..b8013d2eb582
> 100644 --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -387,6 +387,21 @@ pub(crate) fn new(
>          })
>      }
>  
> +    /// Returns the size of this falcon's IMEM, in bytes.
> +    ///
> +    /// `NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 16-bit byte
> offset, so the result never
> +    /// exceeds 64KiB.
> +    pub(crate) fn imem_size(&self) -> usize {
> +        let blocks = usize::from_safe_cast(
> +            *self
> +                .bar
> +                .read(regs::NV_PFALCON_FALCON_HWCFG::of::<E>())
> +                .imem_size(),
> +        );
> +
> +        blocks * MEM_BLOCK_ALIGNMENT
> +    }
> +
>      /// Resets DMA-related registers.
>      pub(crate) fn dma_reset(&self) {
>          self.bar.update(regs::NV_PFALCON_FBIF_CTL::of::<E>(), |v| {
> diff --git a/drivers/gpu/nova-core/firmware.rs
> b/drivers/gpu/nova-core/firmware.rs index e0befe84aa3e..9ff764930bcd
> 100644 --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -26,6 +26,7 @@
>  pub(crate) mod booter;
>  pub(crate) mod fsp;
>  pub(crate) mod fwsec;
> +pub(crate) mod gen_bootloader;
>  pub(crate) mod gsp;
>  pub(crate) mod radix3;
>  pub(crate) mod riscv;
> diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
> b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs index
> ec4d92317a93..6670d17b4eeb 100644 ---
> a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs +++
> b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs @@ -14,18 +14,12
> @@ dma::Coherent,
>      io::{register::WithBase, Io},
>      prelude::*,
> -    ptr::{
> -        Alignable,
> -        Alignment, //
> -    },
> -    sizes,
>      transmute::AsBytes,
>  };
>  
>  use crate::{
>      driver::Bar0,
>      falcon::{
> -        self,
>          gsp::Gsp,
>          Falcon,
>          FalconBromParams,
> @@ -39,10 +33,7 @@
>      },
>      firmware::{
>          fwsec::FwsecFirmware,
> -        tlv::{
> -            request_tlv, //
> -            Tlv,
> -        },
> +        gen_bootloader::GenericBootloader, //
>      },
>      gpu::Chipset,
>      num::FromSafeCast, //
> @@ -101,16 +92,12 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
>  pub(crate) struct FwsecFirmwareWithBl {
>      /// DMA object the bootloader will copy the firmware from.
>      _firmware_dma: Coherent<[u8]>,
> -    /// Code of the bootloader to be loaded into non-secure IMEM.
> -    ucode: KVec<u8>,
> +    /// Bootloader that performs the load.
> +    bootloader: GenericBootloader,
>      /// Descriptor to be loaded into DMEM for the bootloader to read.
>      dmem_desc: BootloaderDmemDescV2,
> -    /// Range-validated start offset of the firmware code in IMEM.
> -    imem_dst_start: u16,
>      /// BROM parameters of the loaded firmware.
>      brom_params: FalconBromParams,
> -    /// Range-validated `desc.start_tag`.
> -    start_tag: u16,
>  }
>  
>  impl FwsecFirmwareWithBl {
> @@ -120,29 +107,9 @@ pub(crate) fn new(
>          firmware: FwsecFirmware,
>          dev: &Device<device::Bound>,
>          chipset: Chipset,
> +        falcon: &Falcon<'_, Gsp>,
>      ) -> Result<Self> {
> -        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
> -        let tlv = Tlv::new(fw.data())?;
> -        dev_dbg!(
> -            dev,
> -            "loaded generic bootloader firmware v{}\n",
> -            tlv.get_string(b"VERS")?
> -        );
> -
> -        let ucode = {
> -            let blob = tlv.get_bytes(b"BLOB")?;
> -            let code_size =
> usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
> -            let code = blob.get(..code_size).ok_or(EINVAL)?;
> -            let aligned_code_size = code_size
> -                .align_up(Alignment::new::<{
> falcon::MEM_BLOCK_ALIGNMENT }>())
> -                .ok_or(EINVAL)?;
> -
> -            let mut ucode = KVec::with_capacity(aligned_code_size,
> GFP_KERNEL)?;
> -            ucode.extend_from_slice(code, GFP_KERNEL)?;
> -            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
> -
> -            ucode
> -        };
> +        let bootloader = GenericBootloader::new(dev, chipset,
> falcon)?; 
>          // `BootloaderDmemDescV2` expects the source to be a mirror
> image of the destination and // uses the same offset parameter for
> both. @@ -213,21 +180,11 @@ pub(crate) fn new(
>              }
>          };
>  
> -        // The bootloader's code must be loaded in the area right
> below the first 64K of IMEM.
> -        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
> -        let imem_dst_start = BOOTLOADER_LOAD_CEILING
> -            .checked_sub(ucode.len())
> -            .ok_or(EOVERFLOW)?;
> -
> -        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
> -
>          Ok(Self {
>              _firmware_dma: firmware_dma,
> -            ucode,
> +            bootloader,
>              dmem_desc,
>              brom_params: firmware.brom_params(),
> -            imem_dst_start: u16::try_from(imem_dst_start)?,
> -            start_tag,
>          })
>      }
>  
> @@ -282,7 +239,7 @@ fn brom_params(&self) -> FalconBromParams {
>      fn boot_addr(&self) -> u32 {
>          // On V2 platforms, the boot address is extracted from the
> generic bootloader, because the // gbl is what actually copies FWSEC
> into memory, so that is what needs to be booted.
> -        u32::from(self.start_tag) << 8
> +        self.bootloader.boot_addr()
>      }
>  }
>  
> @@ -292,12 +249,7 @@ fn imem_sec_load_params(&self) ->
> Option<FalconPioImemLoadTarget<'_>> { }
>  
>      fn imem_ns_load_params(&self) ->
> Option<FalconPioImemLoadTarget<'_>> {
> -        Some(FalconPioImemLoadTarget {
> -            data: self.ucode.as_ref(),
> -            dst_start: self.imem_dst_start,
> -            secure: false,
> -            start_tag: self.start_tag,
> -        })
> +        Some(self.bootloader.imem_load_params())
>      }
>  
>      fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
> diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
> b/drivers/gpu/nova-core/firmware/gen_bootloader.rs new file mode
> 100644 index 000000000000..f949223af2d0
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! The generic falcon bootloader.
> +//!
> +//! A small program loaded into falcon IMEM using PIO, which then
> DMAs a larger image into IMEM and +//! DMEM from a descriptor the
> driver leaves in DMEM at offset 0. Open RM's +//!
> `ksec2GetGenericBlUcode` supplies the same image for both SEC2 and
> GSP. + +use kernel::{
> +    device,
> +    prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +};
> +
> +use crate::{
> +    falcon::{
> +        self,
> +        Falcon,
> +        FalconEngine,
> +        FalconPioImemLoadTarget, //
> +    },
> +    firmware::tlv::{
> +        request_tlv, //
> +        Tlv,
> +    },
> +    gpu::Chipset,
> +    num::FromSafeCast, //
> +};
> +
> +/// The generic falcon bootloader image and the IMEM placement it
> was loaded for. +pub(crate) struct GenericBootloader {
> +    /// Bootloader code, zero-padded to a whole number of falcon
> memory blocks.
> +    ucode: KVec<u8>,
> +    /// Byte offset in IMEM the code is loaded at.
> +    imem_dst_start: u16,
> +    /// Tag the first code block is loaded under.
> +    start_tag: u16,
> +}
> +
> +impl GenericBootloader {
> +    /// Loads the generic bootloader image for `chipset`, placed in
> the last blocks of `falcon`'s
> +    /// IMEM so the image it goes on to load has the rest to itself.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if a required TLV field is absent or the image
> does not fit in IMEM.
> +    /// - `ENOMEM` if the padded copy of the code cannot be
> allocated.
> +    pub(crate) fn new<E: FalconEngine + 'static>(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        falcon: &Falcon<'_, E>,
> +    ) -> Result<Self> {
> +        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
> +        let tlv = Tlv::new(fw.data())?;
> +        dev_dbg!(
> +            dev,
> +            "loaded generic bootloader firmware v{}\n",
> +            tlv.get_string(b"VERS")?
> +        );
> +
> +        let ucode = {
> +            let blob = tlv.get_bytes(b"BLOB")?;
> +            let code_size =
> usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
> +            let code = blob.get(..code_size).ok_or(EINVAL)?;
> +            let aligned_code_size = code_size
> +                .align_up(Alignment::new::<{
> falcon::MEM_BLOCK_ALIGNMENT }>())
> +                .ok_or(EINVAL)?;
> +
> +            let mut ucode = KVec::with_capacity(aligned_code_size,
> GFP_KERNEL)?;
> +            ucode.extend_from_slice(code, GFP_KERNEL)?;
> +            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
> +
> +            ucode
> +        };
> +
> +        let imem_dst_start =
> falcon.imem_size().checked_sub(ucode.len()).ok_or(EINVAL)?; +
> +        Ok(Self {
> +            ucode,
> +            imem_dst_start: u16::try_from(imem_dst_start)?,
> +            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
> +        })
> +    }
> +
> +    /// Returns the address the falcon must boot from to run this
> bootloader.
> +    pub(crate) fn boot_addr(&self) -> u32 {
> +        u32::from(self.start_tag) << 8
> +    }
> +
> +    /// Returns the PIO parameters that place this bootloader in
> non-secure IMEM.
> +    pub(crate) fn imem_load_params(&self) ->
> FalconPioImemLoadTarget<'_> {
> +        FalconPioImemLoadTarget {
> +            data: self.ucode.as_ref(),
> +            dst_start: self.imem_dst_start,
> +            secure: false,
> +            start_tag: self.start_tag,
> +        }
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs
> b/drivers/gpu/nova-core/gsp/hal/tu102.rs index
> a5c0ca355493..68a48c882c0f 100644 ---
> a/drivers/gpu/nova-core/gsp/hal/tu102.rs +++
> b/drivers/gpu/nova-core/gsp/hal/tu102.rs @@ -166,7 +166,7 @@ fn
> run_fwsec_frts( )?;
>  
>          if self.needs_fwsec_bootloader {
> -            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts,
> dev, chipset)?;
> +            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts,
> dev, chipset, falcon)?; // Load and run the bootloader, which will
> load FWSEC-FRTS and run it. fwsec_frts_bl.run(dev, falcon, bar)?;
>          } else {
> @@ -224,7 +224,9 @@ fn build_unload_bundle(
>          // Load the FWSEC SB firmware, as well as its bootloader if
> required. let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bios,
> FwsecCommand::Sb)?; let fwsec_sb = if self.needs_fwsec_bootloader {
> -
> FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(fwsec_sb, dev,
> chipset)?)
> +            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(
> +                fwsec_sb, dev, chipset, gsp_falcon,
> +            )?)
>          } else {
>              FwsecUnloadFirmware::WithoutBl(fwsec_sb)
>          };
> diff --git a/drivers/gpu/nova-core/regs.rs
> b/drivers/gpu/nova-core/regs.rs index 5d265b5788e3..5501c36a56af
> 100644 --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -247,6 +247,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
>          31:0    value => u32;
>      }
>  
> +    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ PFalconBase +
> 0x00000108 {
> +        /// Size of this falcon's IMEM, in blocks of
> [`crate::falcon::MEM_BLOCK_ALIGNMENT`] bytes.
> +        8:0     imem_size;
> +    }
> +
>      pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ PFalconBase +
> 0x0000010c { 7:7     secure_stat => bool;
>          6:3     dmaq_num;

