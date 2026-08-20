Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2C48035C
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246945; cv=fail; b=MEI+y8ZZcF1hSk5UAE8az0wbgILew1hXaYcclJ3suvY8xyxCtFSGz1LEOb1B4B33VYZ4Gz27tIdmewSzE0xdMZbLCxB2nGS1PLqZnRJTKa4aTWVcOoigrZm9Gbe4F5eWjDnZMNmfbxFKWlopa8O06MaZvrC7/MdTjfzUoLAvg5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246945; c=relaxed/simple;
	bh=o6+y6gB1tFSutrQ42TZ6lkD5XkQE0oDf/0T2wHjZkaQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/lPSBWSx9On5Hcn5Rpq3pxC70jAfd7FC1A5bvCe/GJ61ap5Lnwa/XqAR2gL55C4Bb3eEYxbCaTZ0c42aZ8+bg8krPobWIKwTCbtbXD6L8Uo/emtj0cnxLOrjHyRgt7NV8AvSuMfigx/G3k5Tv194ZR3t9L2f5NCvo3qeIxoouI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tvw7xHIY; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tvw7xHIY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMtxXCi+iCOgT/yO0OcA0wBzXljo71T9zbxEfa+RIiaEJI1cVw4zUM/6oUAaJs9dIePOITfz2gtW8wqNIxVuzwTso+xL2WIoJXb7eju5/+qxWdmha0C2HEDi7qeB5wpWzVS5YF3gfV16BPMyKUjazQWnPCRKF/+E922NDLmWgPn6V7/ekbyTJSxpXEBW8AAtfI9wFWyBBp3dUHCDn0VXcjJOS6PofRkm/fuM764ICWcOqjyD/cHqFkfK5ja5ktp+ssc6VtC4CPRJVbGPKMBWQB/Gh1xQh37oVeHo86IEl60IJ4REBJLnWrmrY/BcMtiA3PLg5jgFAPzXV+EpC+Wpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ2gciQhXyz66IWZGXSe5BmOdTrfc6smkXqYFsSL0V4=;
 b=eMIj1c5vtJU3R1+EG9q9opoGUyJeaHxoNwI/vmdq9I9XHFNO1ciQhPDN48WJm2o61kYkv458fM3g6YvDmW8xDqUyaFpHmp5dOfwoVDLXOaOngTnd5gLKo1UqqV1YImo9baT/lgdJXDMeWox8z0+YqbykKGB0tBzEvwA3+jdHb9FeupWlUugvgFXDi9xzOCMeLCMVBPCG4m8isfoBo5bg96CXnHt813OFsupTWk7j++vFw4S/b5ifTS4x+d8PSLR3jYqumx5lv5OonOVrQZHF4Mzs4ZAaNCx5HxAsuW0IEfNDey4YEZGMK5ys/KYk82WilUnEDYuvZQZib7EUbOvZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ2gciQhXyz66IWZGXSe5BmOdTrfc6smkXqYFsSL0V4=;
 b=tvw7xHIYUKnh7U38fMtELeYpCNbL17eN9zyqCijaAyGD3xushm1nMsj2hZuQL5jUnnvi6nlVrGzbNF0H0KqqvQ2dU6yD2FkXYu7ySzTX4Yt5BmuYhIL3K9XbQA7wIpug9IzkH9ldI5N5kSz1kBpMCdtBkfSq4NCGiSEONUX00xQJemLbkQYLWw4yOcvdWUKIKBCI/nYbHMihxcfaKP+LKxqepScMUa+rq/S1pyI+7mjiW8Rq/EtBzlxrednDHuJGbPJR2qwMbpvKYvf0/1wmPqJweLpTe4fHijXNdTjOkNnT1qjg0qGamnIbo0uX3X6rrwHF93beMKNjfNV8HwtTJA==
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by IA0PPF73BED5E32.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 17:28:59 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::63) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 17:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 17:28:59 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 10:28:27 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 10:28:26 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 10:28:21 -0700
Date: Thu, 20 Aug 2026 20:28:19 +0300
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
Subject: Re: [PATCH 21/27] gpu: nova-core: gsp: add the GMC boot event
 dispatcher
Message-ID: <20260820202819.3a3f2792@inno-dell>
In-Reply-To: <20260819035221.336390-22-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-22-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA0PPF73BED5E32:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dba5657-73d7-4855-8822-08defee08529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|6133799003|3023799007|5023799004|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ntKk/p7WkiRqx+xL4v9PLqEGlrO0RghJW2schBM96XOLG1kxQ/z/HIYTFNSvZmOZrLdwPgJQ6QBndUgRsUQoojLcHXGhCt+U+0A4d+gyvwOGmUiQtarL9onQ2V/gfNPSrj0eJX1gdiOW/1aUiu8LF0VTAqU7W/wQH8HtdrflKGmDvT77dVluxdQe2GhT6kJwOdsyqcatM2BQnTrAGH0eWgLUolx278H6W/cM2hzBMpG+3Msfm0akLucSd7JMR2sBFN0mGs+VQgiFdfacXvePe94alVXq1rSlIm5gy83lSV9KeXeOO80coiXAJHf+xmz5Byii6Hsm8gSnf4a5OANWvcze2lZTe8T6nSmAXq7uM9m/07ayA2XuTcDIIUWuPzqec6HSUqDPAYfWVzB+FS+cLm9brnqJBG15rOqaHdKqGwgseDqNbcODP9U06mZQizILisguR82niYd+3ZV7Ls1D6JadH84AjC8RnhwNls5xm//Y0ki3/6GAFCiJQnHwD1dkX4/X9DmnlVX4ZYW2Enqm6VflNkeEDD9W15VbuHOSYQ+Ri4J+zJBDNKbZgTpCq4/3lK2/owWnCAkUZgdW7yKX5t10O+twkZCNTNeZGk0MjvDo/p7qWalta4ojhUnRcB75j1CirIPkFEvfLVxdyRhjy6qpZ8AmC6m2QEPRXuMtxTUQ6dEqceF4bIH4R4Nl4xbBYp5WnTeh64crHiGX2k4+uA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(6133799003)(3023799007)(5023799004)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gQv0EE1qmLZubrcXDElW/0b4dWy2h++DSBPJdcuUZt7H1QYGwNlvboWDiWAS2VkxzapuTXWt8RNyyrUagFXwbOrS8XF6xAJc/S8M0KPzZ2/blE0b31qkRlcVo7RBrgvbipIIOKxQgFL0/Z9blwPZ/CpJgzmWtoyT1cIWG8+9Wjln3mW34zJ+zbR//CcHD5l5E+3rPUQVEEymhbfooGGVA7wp/vygTGkj1i3pXeu/2trzJI2hd5kWeCpAma5g0pyYklJ7iYxNW95kiQta639sQQsjzoi9wbkOZvV6NUNGgiQ59xDqePaPVOEHr325WTtPhF8V9YkHC/w6tepAk+41ZnCJxcUsB4Pj6hrS63oWXy2b0c7PEEQNdHiP+y7YU5+wJ5OoMdNldbaHDwvok9nOOWb6ffdbxbwMM3BRbqlE2P4KItGklLiDDL9TZZA279CO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:28:59.1560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dba5657-73d7-4855-8822-08defee08529
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF73BED5E32

On Tue, 18 Aug 2026 20:52:14 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looks good to me besides a nit below.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The r000 GSP boot protocol sends its two load-and-execute events as
> GMC commands, each identified by a command id.
> 
> Nova-core has a handler for each of the two events, but nothing that
> reads a command id and selects between them.
> 
> Add the dispatcher, keyed on the two command ids from the r000
> bindings.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 62
> +++++++++++++++++++++++++++++-- drivers/gpu/nova-core/gsp/fw.rs   |
> 10 +++++ 2 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs
> b/drivers/gpu/nova-core/gsp/boot.rs index d62a5c834ccf..15933ecc061b
> 100644 --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -36,7 +36,11 @@
>      },
>      gsp::{
>          cmdq::Cmdq,
> -        commands, //
> +        commands,
> +        fw::{
> +            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
> +            GMCAPI_CMD_EXEC_HS_BINARY, //
> +        }, //
>      },
>      regs, //
>  };
> @@ -162,6 +166,60 @@ fn core_resume(
>          Ok(())
>      }
>  
> +    /// Dispatch one GMC boot event to its load-and-execute handler.
> +    ///
> +    /// LIBOS2 chipsets send `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER`
> and LIBOS3 chipsets send
> +    /// `GMCAPI_CMD_EXEC_HS_BINARY`, so a given GPU only ever
> reaches one of the two handlers.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if `command_id` is not a load-and-execute command.
> +    ///
> +    /// Errors from the handlers are propagated as-is.
> +    #[expect(dead_code)]
> +    #[allow(clippy::too_many_arguments)]

Should this be expect? So that if we refactored this arugment list in
future and it gets shorter then CLIPPY will tell us to remove the tag
above.

> +    fn dispatch_gmc_boot_event(
> +        command_id: u32,
> +        payload: &[u8],
> +        bootloader: &GenericBootloader,
> +        gsp_falcon: &Falcon<'_, Gsp>,
> +        sec2_falcon: &Falcon<'_, Sec2>,
> +        bar: Bar0<'_>,
> +        dev: &device::Device,
> +        bootloader_app_version: u32,
> +        libos_dma_handle: u64,
> +    ) -> Result {
> +        match command_id {
> +            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER =>
> Self::handle_load_exec_bootloader(
> +                payload,
> +                bootloader,
> +                gsp_falcon,
> +                sec2_falcon,
> +                bar,
> +                dev,
> +                bootloader_app_version,
> +                libos_dma_handle,
> +            ),
> +            GMCAPI_CMD_EXEC_HS_BINARY =>
> Self::handle_load_exec_hs_binary(
> +                payload,
> +                gsp_falcon,
> +                sec2_falcon,
> +                bar,
> +                dev,
> +                bootloader_app_version,
> +                libos_dma_handle,
> +            ),
> +            _ => {
> +                dev_err!(
> +                    dev,
> +                    "Unexpected GMC boot event:
> command_id={:#010x}\n",
> +                    command_id
> +                );
> +                Err(EINVAL)
> +            }
> +        }
> +    }
> +
>      /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
>      ///
>      /// The driver does not copy the image the GSP asks for. It
> writes the descriptor the event @@ -175,7 +233,6 @@ fn core_resume(
>      ///   size this driver mirrors, or the event names a context DMA
> slot or an aperture that does ///   not exist.
>      /// - `ETIMEDOUT` if the GSP does not suspend, or the image does
> not halt, in time.
> -    #[expect(dead_code)]
>      #[allow(clippy::too_many_arguments)]
>      fn handle_load_exec_bootloader(
>          payload: &[u8],
> @@ -268,7 +325,6 @@ fn handle_load_exec_bootloader(
>      /// - `EINVAL` if the payload is shorter than the parameter
> block, or the ucode id does not ///   fit the BROM register field.
>      /// - `ETIMEDOUT` if the GSP does not suspend, or the binary
> does not halt, in time.
> -    #[expect(dead_code)]
>      #[allow(clippy::too_many_arguments)]
>      fn handle_load_exec_hs_binary(
>          payload: &[u8],
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> b/drivers/gpu/nova-core/gsp/fw.rs index 83f7d2042aa1..4772af362117
> 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -979,6 +979,16 @@ pub(crate) struct GmcApiHeader {
>  /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries
> flags. const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
>  
> +/// GMC command asking the driver to run the generic falcon
> bootloader against a descriptor the +/// GSP supplies.
> +pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
> +    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
> +
> +/// GMC command asking the driver to run a high-security binary the
> GSP has placed in the +/// framebuffer.
> +pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
> +    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
> +
>  static_assert!(size_of::<GmcApiHeader>() == 40);
>  
>  impl GmcApiHeader {

