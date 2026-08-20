Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545B477E58
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243105; cv=fail; b=JfqgOqMUq+o3qKCSeCUiPiSlfonAPFhPO40WounbhpTcGqr6137bdb7N1avEma+L7eHrAFHyFTHw6cL/9ndPpckttNYNEI/mVAwOJLPaVJe+eEyq0FDp781ryeE6AucPvio00G/9vAEyyfW/gN5h8F0Xd3c/aBEkQxQR0R+UQeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243105; c=relaxed/simple;
	bh=efs0pMmzWbeP0oRGDlO5fhMBSWwojyju7C0vUI4e+/0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPO7o1HLjEd9aMlAhyH3JkWfUhOdX80taOai1tgG4TNyZGUVqdcrCfZNIr8Z1blJzDGcM9lkJZnLUqOdYTXSHhBhu/KsqEz9Pl00/iAMeeZp6hIAH0mLR9pGu3GxA7Yb+UTT6aH3LnQEPRn1hcD3FRAYJVNkSNQsLp8LdFFK9Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q6tGB0vU; arc=fail smtp.client-ip=52.101.61.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q6tGB0vU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfVcvU61EXELoY6oq7jmynmlbY43KSQTVQvzCvITIjubQwyPj+9xIiGsauQyBb1ZMqHpA1C7BuQfGtNcr/LyTwE56Rk/gwWEEZU58KYZzQgL+KUnLEZrDl0luGx/W0YzdNcukmeHSvQuWuhNZfzGS+HiYSo7KPobJohleV+bjZmyBY5eYdHnm2LTrG18z6wbYIzbgCwJv2s5IOirwvt6j0sL+fQjjvA/AwTlLROuXOad3VOpoEX5/jiBCB33/QeyQjDTiy/oVI9qWBoZWhLSzWXJJ+CQdAkIR7WrZ3/VTE1qVxd+32sfnW5dir7LaUCu4Uh68pF6FShXk9Y1Z5ctMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdjMhjX3dhmcIUNSkpqAD2jo3YQVU9fQ4682TU7jMrs=;
 b=cBnp4c+Jseua2nG/pTb5oNCprRJ5ub8Fqp/+4dYzpKa21T2Oznko8XqEXTwQFVzOUX8ml5NRlUW4y1jUYRSNF8ZKvqStF4+q3zmtitdgCm+s9uww/lylCMCKh9Y9tV8Th1Z6Kt0XDUK6gFsayuEGTSZTP+Eno1InrKMtmot4U3UbUJtPc9gpRgD6wINGX4FMxF+lCJ7AbeH0uB31DfJqjvhbFoPhbvNIVS0tBsGZGprEqgHBHfNN8OHaMNtL5Si1QjciwGzpxpFFLLg3icdAtIZmQJkQ+L/BbUuLs7sOTTwjRU1hFYaYIytyjYfoN9UX+iE8e+A8diHxFRqbE4HvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdjMhjX3dhmcIUNSkpqAD2jo3YQVU9fQ4682TU7jMrs=;
 b=Q6tGB0vUGHwL9r4Wg8tlhRc/M1JuVNbD69c5Q6LpMtRgxKNcjIGjEC/LDIqhympoCTPtqwBgOHhR3EeRJx//Jp2JevRkO+8B2ca6bNFnkUmJTOgKbce53uBBrynBxOPMFgltkImtlwC5wwNTvBYmYrXBEmycgccYWsn/iYrefAo9rSjIgKAcKmRwvQBIc3NO1yg/eloBFPUJnGheQBb4dp3VtaqD2wExOVyRE+XiOB6IQqdyyUq4bLdASazvOfkZFVoOKCyOOLe/CktUJPVcAHhzoSSSeegWf03YBptqxeAP5u6ak6+vG1CkSdH7fudSb1tWSswmd55i02aYmvbqcw==
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 16:24:51 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::42) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 16:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 16:24:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 09:24:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 09:24:24 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 09:24:17 -0700
Date: Thu, 20 Aug 2026 19:24:15 +0300
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
Subject: Re: [PATCH 20/27] gpu: nova-core: handle the r000 load-and-execute
 bootloader event
Message-ID: <20260820192415.4c9b9097@inno-dell>
In-Reply-To: <20260819035221.336390-21-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-21-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: d98fe865-c3eb-40eb-3264-08defed78e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|56012099006|4143699003|11063799006|10067099003|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RVGIUknpMqFMMAfeSG5xU/hTygZNRoq2Oar5SfFHhNW99XQuafxKW2jJ3vVdozpNmCQNActG7sXjC8SxjeNYtP0zGLgd/D+962SKkX/sWo9838EbRRwKe0lkG22SUqXeCjFeMRNklrsw0lDYVk0p70xhsK9lGc+feOF0CHULPVY6CCS0IUvfvOxgf8md4EhqeofW/DP2Onmf2Iyk/PwT8gWRKQQQWy5fyXKG0I3uCqe1AVEZuvKNDyvGCY+GyVQ/QqhKqO4y/4lZwxdT8T0UMkYu9b0PuGrl0EWoTCu/KSGXQG4KC96leZYL4f2cJ0Ioy6PsvioO57uWXXK6jd5N3jse6Lci/l5REv8kplAGkxYqsf0hiUFBjQEJg6B+UqzM04deSQ0gxWLq5xy3tFDU5k83Ah80I0Y0ml5dNGrmVKZGNCH6ug0Ibg5BFGFd+uNdhkLih1d6fItOppCHdHwN1C4LipPpyJet53plQ/zthuxwef4nfIswLB7swd2ti/kzHeqPwD3krbs2SS0RU+yGgTxskyDTOKyGbt53EEzZj8DIjDGjDa1VJ+PxNR6W/PJkAhpoIS5DYowiQo/tT5obnowTgkPjHGddh8zh84WXK8PfAlQRivDaIn3NgKJpAwmcCyy5JaKqIMETV6So8aEpM64KuhImpU1PyNB8vBxBGqE9CUxgkByGV++WgYv1khphAhGYHqKISTdPZOxU/NBqig==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lDWDcMeXL16qFWia6xEIFqTY0D2uhlEvBoxrwUxe4LFSlcI3ygtddl4b3lkqu1Ccdt/7nWQaAK0rsrlFODT0CppUdORQ43S+SYXJ1afTaHYeWm0bmB67C+tq+jLE079+yjeVRyByedYHoupRYd+WyFXa20sWgoe+4UMqzl3+bQsBeaCI5cOSJwXRpQPPNhU7qdaar117omFZJmaexXaqLgaEQU5Udr4gSr/UsYP7eLuPdOiFq91WHJP9/fd8o5ij/ESNsBeaZOxsrSBYIVxmAeFFjMm/p93D7crT5pat2llwY7TZkaEkL/A2/IzsSlr9Ci7ZgC2wdjhbId4slUIFd6msnHJe4yYOjlw4S0fSsBjIdP4wbFulmL01hKSqjurNo21xfmjHBckySgGxWwqRM3wUyayksJ/qOSWmsncDPkcwjBSYHwC+c3Qerjl/n554
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 16:24:49.3451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98fe865-c3eb-40eb-3264-08defed78e78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707

On Tue, 18 Aug 2026 20:52:13 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

snip

> +    /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
> +    ///
> +    /// The driver does not copy the image the GSP asks for. It
> writes the descriptor the event
> +    /// carries to DMEM offset 0, places the generic bootloader in
> IMEM, points the requested FBIF
> +    /// aperture at wherever the image lives, and runs the
> bootloader, which does the copy from
> +    /// the descriptor and jumps to the image. The aperture is
> restored afterwards.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if the payload is shorter than the parameter
> block, the descriptor is not the
> +    ///   size this driver mirrors, or the event names a context DMA
> slot or an aperture that does
> +    ///   not exist.
> +    /// - `ETIMEDOUT` if the GSP does not suspend, or the image does
> not halt, in time.
> +    #[expect(dead_code)]
> +    #[allow(clippy::too_many_arguments)]
> +    fn handle_load_exec_bootloader(
> +        payload: &[u8],
> +        bootloader: &GenericBootloader,
> +        gsp_falcon: &Falcon<'_, Gsp>,
> +        sec2_falcon: &Falcon<'_, Sec2>,
> +        bar: Bar0<'_>,
> +        dev: &device::Device,
> +        bootloader_app_version: u32,
> +        libos_dma_handle: u64,
> +    ) -> Result {
> +        let params =
> LoadExecGenericBootloaderParams::from_bytes_prefix(payload)
> +            .ok_or(EINVAL)?
> +            .0;
> +
> +        let desc_size =
> +
> u32::try_from(core::mem::size_of::<BootloaderDmemDescV2>()).map_err(|_|
> EOVERFLOW)?;
> +        if params.dmem_desc_size != desc_size {
> +            dev_err!(
> +                dev,
> +                "Load-exec descriptor is {} bytes, expected {}\n",
> +                params.dmem_desc_size,
> +                desc_size
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let ctx_dma = params.ctx_dma()?;
> +        let fbif_target = params.fbif_target()?;
> +        let transcfg = || {
> +            regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>()
> +                .try_at(usize::from(ctx_dma))
> +                .ok_or(EINVAL)
> +        };
> +
> +        gsp_falcon.wait_for_processor_suspend().inspect_err(|_| {
> +            dev_err!(
> +                dev,
> +                "Timeout waiting for GSP suspend (mbox0={:#x})\n",
> +                gsp_falcon.read_mailbox0()
> +            );
> +        })?;
> +
> +        gsp_falcon.reset()?;
> +        gsp_falcon.dma_reset();
> +
> +        let saved_transcfg = bar.read(transcfg()?);
> +        bar.update(transcfg()?, |v| {
> +            v.with_target(fbif_target)
> +                .with_mem_type(FalconFbifMemType::Physical)
> +        });
> +
> +        let run = (|| -> Result {
> +
> gsp_falcon.pio_load(&bootloader.with_descriptor(&params.dmem_desc))?;
> +
> +            // Also clears the suspend bit that
> `wait_for_processor_suspend` polls, so the next
> +            // load-and-execute event does not read this one's
> suspension.
> +
> gsp_falcon.write_mailboxes(Some(FLCN_ERR_BINARY_NOT_STARTED), None); +
> +            gsp_falcon.start()?;
> +            gsp_falcon.wait_till_halted().inspect_err(|_| {
> +                dev_err!(
> +                    dev,
> +                    "Timeout waiting for the loaded image to halt
> (mbox0={:#x})\n",
> +                    gsp_falcon.read_mailbox0()
> +                );
> +            })
> +        })();
> +
> +        bar.update(transcfg()?, |_| saved_transcfg);
> +        run?;

TRANSCFG was restored only when the transfer is successful in OpenRM [1]
(also r000 firmware), I think that is reasonable since if the HALT is
not received, the controller is in stale and might still be active on
memory read/write until it got reset.

I guess we should follow OpenRM's scheme, e.g.

run?;
bar.update(xxxx);

[1]
https://github.com/NVIDIA/open-gpu-kernel-modules/blob/main/src/nvidia/src/kernel/gpu/gsp/arch/turing/kernel_gsp_falcon_tu102.c#L556

> +
> +        Self::core_resume(
> +            gsp_falcon,
> +            sec2_falcon,
> +            dev,
> +            bootloader_app_version,
> +            libos_dma_handle,
> +        )
> +    }
> +
>      /// Handle a `GSP_LOAD_EXEC_HS_BINARY` event.
>      ///
>      /// The GSP asks the driver to run a high-security binary that
> it has already placed in the @@ -347,6 +448,64 @@ pub(crate) fn
> unload( /// points it at local framebuffer.
>  const HS_BINARY_CTX_DMA: u8 = 0;
>  
> +/// Number of FBIF context DMA slots a falcon has.
> +const NUM_CTX_DMA: usize = 8;
> +
> +/// Parameters for loading and executing the generic bootloader.
> +///
> +/// Sent by GSP-RM as the payload of
> `GSP_LOAD_EXEC_GENERIC_BOOTLOADER`. The descriptor carries +/// the
> code and data addresses, while `addr_space` and `cpu_cache_attrib`
> say which FBIF aperture +/// reaches them. +#[repr(C)]
> +struct LoadExecGenericBootloaderParams {
> +    dmem_desc: BootloaderDmemDescV2,
> +    dmem_desc_size: u32,
> +    addr_space: u32,
> +    cpu_cache_attrib: u32,
> +    _reserved: [u32; 4],
> +}
> +
> +impl LoadExecGenericBootloaderParams {
> +    const ADDR_SYSMEM: u32 = 1;
> +    const ADDR_FBMEM: u32 = 2;
> +    const NV_MEMORY_CACHED: u32 = 0;
> +    const NV_MEMORY_UNCACHED: u32 = 1;
> +
> +    /// Returns the context DMA slot the bootloader is to fetch the
> image through.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if the slot is outside the FBIF `TRANSCFG` array.
> +    fn ctx_dma(&self) -> Result<u8> {
> +        let ctx_dma = self.dmem_desc.ctx_dma;
> +
> +        u8::try_from(ctx_dma)
> +            .ok()
> +            .filter(|slot| usize::from(*slot) < NUM_CTX_DMA)
> +            .ok_or(EINVAL)
> +    }
> +
> +    /// Returns the FBIF aperture that reaches the image.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if the address space and cache attribute pair is
> not one this driver maps.
> +    fn fbif_target(&self) -> Result<FalconFbifTarget> {
> +        match (self.addr_space, self.cpu_cache_attrib) {
> +            (Self::ADDR_FBMEM, _) => Ok(FalconFbifTarget::LocalFb),
> +            (Self::ADDR_SYSMEM, Self::NV_MEMORY_CACHED) =>
> Ok(FalconFbifTarget::CoherentSysmem),
> +            (Self::ADDR_SYSMEM, Self::NV_MEMORY_UNCACHED) => {
> +                Ok(FalconFbifTarget::NoncoherentSysmem)
> +            }
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}
> +
> +// SAFETY: The nested descriptor is `FromBytes`, and every other
> field is an integer type for +// which all bit patterns are valid.
> +unsafe impl FromBytes for LoadExecGenericBootloaderParams {}
> +
>  /// Parameters for loading and executing an HS (High-Security)
> binary. ///
>  /// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_HS_BINARY`. The
> firmware

