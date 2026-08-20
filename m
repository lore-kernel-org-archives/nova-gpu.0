Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC22F1FC3
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219661; cv=fail; b=IxJA05OHYA+y6Xixe06ehqOmJOp8+mph3ZMfIwkiBrnS22o80RNi5sVva7ujmtHkjnZi7b2Zi6kcYhhPb0aJS+xLQJIevjWH3IKQbBmdLrKCYTkoAusyi7EKLp5hgLRC1ke7VGDp1YLiWI3yxyQBQFtFUzvCGexmzMRZjjXDEq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219661; c=relaxed/simple;
	bh=BljFVw67JeTz9moNzFpvzCwmRhj9XWGyDZu8g3XY6xo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btoL+JHwPBGcubSbibfr9NPPoazaalMlwhXqH45VjJqJW+ZNO3L1Lm2pq2BHExDFmPqilFVFxR9QTFVLRB9DQ1KgPsuRa/VeRL1TtIwb7Qy63gDjUiy1MWDYtei4OH8dnHjp/Pg71C8079qRAY6TqDhf0nmiwgOBM1ZZ2KCapZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xcsgy0pX; arc=fail smtp.client-ip=52.101.85.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xcsgy0pX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GziOOCWtvTuMEOYU37d+EdlrE8a396LXA/d3mg/da+P/QPzItdFFaNLPf4kGAM7hH7ip73JVB+F0wQ5SG8FcPQX1Ygnqf+qe20klot/esgGFZBrUNnauroyuBpx6mcQC5g6G9mXPpHaCzS8hrpl7sM0TS4O5h9raAXfu2v4ynSDrK1OF5vqZ9YAIkQkG14BZNXnPHkNScbzWJU8r+37HZjlNBb3djcdTxEjdRGrVslQudBWkJ7DVKATWen08lH1AU51ftO9nhM+9tjBY6D3bCj3o/p4DcNMIDFJYLt+r+cFGp6ktfPDdDRBIUADehxGFeT2iAcPoP/BA11yAF+vZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8hmW6bwRUbjQZI0yo/c/N6O4DLkB2CKEHivi9MvW9M=;
 b=Z3O8K2FwLgyRd9wofFlA9LK4/yl7OV3MDMs/Xy+g3flUxxKZpY8saWMJHPMLpyR/VGRbUF96wwaZYLlw7+vR89LJhmZRHZBMSAsNj6njTu0iW53q53zLSSmj5WIhnkqzmxYZ4LkJjSRNJ+1K2r9HWTHPw0+vACzHo9SpiG1N/Zpne5iMZSbSyAcBJIkRfII/VDr19RiYOHKvjBK6ttN5AmvYcWOkCo7sUEGCdUxWaOtKX0UQknhSs85IIlQgwu9ngn4Qy50kLmNlAOGxP/zmHOD4IwUlWLOjRR49r6C/yY8OzOIw+MZy2h1Y/PXWmZ9N2rSkeDsbS88i1PXEK2ihQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8hmW6bwRUbjQZI0yo/c/N6O4DLkB2CKEHivi9MvW9M=;
 b=Xcsgy0pXW2FXsd59vZTZ0yw5G7HhPtjI+aicV4xdRCDDDhNuH3OzvQFmjjtG1G4cdqO3Mq0UoEWQXI/YAaU/0RMvxBQIzMqkH160LeH7ImrPH4DRNPzRpmuFSoRlKWBGecyWoSvLo9haVk1kJzT9QyGpNToVIM71/f16Q3KuQf66fnEXS0a5KTw8W05+tpL20CP5PczOG92UQ3Nm2kcATkT7L+NpGyvdMGYEWfoaMeX168bCwgb66Nd2ASySXTnYXQXgvbySVf80tm4JAIerc+Oo67jkXYtaY1HuL8yDPZikOZzxgRfVcvYpNH644sFJ8rMulTdW+uBrSA7Lkt8Yqw==
Received: from BN1PR13CA0001.namprd13.prod.outlook.com (2603:10b6:408:e2::6)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:54:13 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::ac) by BN1PR13CA0001.outlook.office365.com
 (2603:10b6:408:e2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 09:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Thu, 20 Aug 2026 09:54:12 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 02:53:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 02:53:55 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 02:53:50 -0700
Date: Thu, 20 Aug 2026 12:53:48 +0300
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
Subject: Re: [PATCH 04/27] gpu: nova-core: add Falcon helpers for r000
 LOAD_EXEC events
Message-ID: <20260820125348.760a1083@inno-dell>
In-Reply-To: <20260819035221.336390-5-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-5-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcb48e6-5a29-4674-4924-08defea0fd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4ah7IvEasfXjhw0QCmUSYrzR0fVLSqHS1R0L98bzx8qucR9Zsj5OHfffWo2fuMjvj1FRyUxyrl0xaXubPHjbFqf6b/LoJM2f7XA3Ck3YaOw3VBE3+Xb3QgrRFPs4FlX4HY+eMMbijbNGH/Tsjqa7eyd2Ua6cK3ZQ/SIAEc4eWauZR2TrHAiFSZQ9qDtVXkp4mSCbDWXnjvC4gOoVQY+ny9i01hW1WWDPA7Oz4JaWihAwYNFVzLF5aKbQ8D1m/C8RBUSjKaxtrX/ZDxKdXgn6jZXO4G9tJJ5iskHFasNQR4zw7lPrN3ZlvuAzt0jqLRDvbg5EcB9W1D+8ewFV2fneONoEkLYbHxV3sTM6Cph6YvV9TVwI/Lj3FgD+0pyvveydDX8Vrw6S31lMy1htl0oGGcIPY+rFogOwGcIceWGLLDzgeP3NAveE30WbJSdlcCmeyQ2EDvmp8V7uTWN4P2sKVC85HjRgkbsP1SZCx7LDgmjGEPViMVKrpQ5oYF45e/D5wylJB90kdfy8EJKdqPEZQmMsFSHbssBfRYj3cUQnuc/NWqdUPbZp/cAa23crOcfp9J+h+y/+OBdZTFQffHAv7SFQJW+q0JvoSOAYkfFnFMiq45D8cbPghkqKiLXiebQ732CG10JfNPK/LyYp51/1Fw2LCkkOpEOEtoiOSlNtAKChnQWaq7x6mMYxxeJZjjBgk6rGdAzFcMch7m0eonjmlg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bM8qfXpubaEJ0b8BQJInw8GPcqPS/9AYyQVhoYmqxAl2uXSaxsieuKrZdreYnF3/LBnYA9kWX0cNFQDXb+/w4Ofwq/7VSRFqdYic3Y3FFpe6tBYDBgsuHapPAMIp4PbnB9TF8mEDb3Sqk9r0M0j6AQHJnv/RX9oAXbb8maD9Sq3UXKTmvDVasW5mprxtj5WMox48Su7HwdPFj2/SQ4i5HDDDZX9rEluJOAnauaD/jI78unICJliYkQ7Ecr5Dqzf4xlm5jF8pxG66QNImcLt15GcbjVxSWF/1GBG5hdvrIljVfZKlKFdziC2HQe2ZadNnOlTvpKIiALbay5jJBW7qqHw3/uS2EgoHebGarCzmkv3kDn9SGQIbEWMy0wmbSNFyyTzSXn1ow+SjmFbOE2hGIeMWsv3CIyLutyKTjIGMuOEXt39jQ6FA86H4ndAOrsGC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:54:12.8275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcb48e6-5a29-4674-4924-08defea0fd3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243

On Tue, 18 Aug 2026 20:51:57 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looking good to me (double checking the flows aligned with r000
firmware) with one nit below.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The r000 LOAD_EXEC events provide addresses for images that the driver
> must copy into GSP Falcon IMEM and DMEM. The existing Falcon DMA path
> creates its source buffer from a FalconFirmware object, so it cannot
> use those addresses. The protocol also reports GSP RISC-V suspension
> through MAILBOX0 bit 31 rather than CPUCTL.halted.
> 
> Add Falcon operations for DMA from event-provided addresses and for
> the RISC-V suspend indication.
> 

snip

> +
> regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed().try_with_offs(dst_offset
> + pos)?,
> +            );
> +            self.bar.write(
> +                WithBase::of::<E>(),
> +
> regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_offset +
> pos),
> +            );
> +

Should we think of using check_add() here?

Z.

> +            self.bar.write(WithBase::of::<E>(), cmd);
> +
> +            read_poll_timeout(
> +                ||
> Ok(self.bar.read(regs::NV_PFALCON_FALCON_DMATRFCMD::of::<E>())),
> +                |r| r.idle(),
> +                Delta::ZERO,
> +                Delta::from_secs(2),
> +            )?;
> +        }
> +
> +        Ok(())
> +    }
> +
>      /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and
> prepare the falcon to run it. fn dma_load<F: FalconFirmware<Target =
> E> + FalconDmaLoadable>(&self, fw: &F) -> Result { // DMA object with
> E> firmware content as the source of the DMA engine.
> @@ -647,6 +763,24 @@ pub(crate) fn wait_till_halted(&self) ->
> Result<()> { Ok(())
>      }
>  
> +    /// Wait until the GSP processor has suspended.
> +    ///
> +    /// The RISC-V GSP signals suspension by setting bit 31
> (`0x8000_0000`) in `MAILBOX0`, rather
> +    /// than through `CPUCTL.halted`.
> +    #[expect(dead_code)]
> +    pub(crate) fn wait_for_processor_suspend(&self) -> Result<()> {
> +        const INTERRUPT_PROCESSOR_SUSPENDED: u32 = 0x8000_0000;
> +
> +        read_poll_timeout(
> +            || Ok(self.read_mailbox0()),
> +            |val| (*val & INTERRUPT_PROCESSOR_SUSPENDED) != 0,
> +            Delta::ZERO,
> +            Delta::from_secs(2),
> +        )?;
> +
> +        Ok(())
> +    }
> +
>      /// Start the falcon CPU.
>      pub(crate) fn start(&self) -> Result<()> {
>          match self
> diff --git a/drivers/gpu/nova-core/regs.rs
> b/drivers/gpu/nova-core/regs.rs index 01fde2c5e5a6..5d265b5788e3
> 100644 --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -264,7 +264,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
>      }
>  
>      pub(crate) NV_PFALCON_FALCON_DMATRFCMD(u32) @ PFalconBase +
> 0x00000118 {
> -        16:16   set_dmtag;
> +        16:16   set_dmtag => bool;
>          14:12   ctxdma;
>          10:8    size ?=> DmaTrfCmdSize;
>          5:5     is_write => bool;

