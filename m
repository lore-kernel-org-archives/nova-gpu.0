Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF03CFF5C
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683324; cv=fail; b=ojsRWC9nzWPBCIcXdZz4TBagNdEYWLiQunt0F1GOi5rGqaQDiDAv0hienFwbzrXu/XJBCb8LxOu5MkBSJGswRgaNi0jy5DWAYSw/9eOhvoquscS3HXfuyu0mzP8Sx8wsZjkgMXvG6wp70WaXUSuiIiglNoMpuqc9tHKypXWEDdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683324; c=relaxed/simple;
	bh=v3Cz8RfzUZL1oDSJmKazbR6abLuCKvIElyVbZipvXa4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFygzLA+6Jp15UDPJOpa7e96ujy3Wny6Q3/1B/gWrdEWCs7gHsZEnBug+WhVEzh61BrqNMVMpzbkcg25lWkGBYmE3BWyQBmxX9mYGcPscE/H6YYQ+mblovZBe5EL5WM5wzfm8GfvwrUqZlwUJN1VtF/MqtuSPX7FRrvUzA73LWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XfcIAa3X; arc=fail smtp.client-ip=40.93.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XfcIAa3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8yVGn2Nm+GuPLsmL0XJbaBO2obhOeGcew2kBanwrjdLvV+PtTZuIigkeLhjL8JNtj5q4wVY3ew8WF+lWMwLAIHMzV2Tr6UAFHTgLUFvki7ObAL+zTCJD6Y5/Y9x8uZzftul2ALhDFJjL0ORVXri/op8bHK0VpBqbLxycMWqBm0ttELTuZW6uLJy6H18AjtaQaSseA5tmIrG32HzoEN8OCWj3VgpgfnHEN4znPKjKJNlj65OA0hvpClia75DkD4fJM7QctNbW+Uj5+qTcbhbZ/uVgtHXWtGGljL2W3JWoqrTQ4Kl/wT1/lhaT6zV8T0BexsVROwnhHxKYkLXxLwpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH4E13Porfm0W1Mdrrscjlt+UMQ0IgYhpRSIN7uCIQo=;
 b=YF3xC5w/encmYmd+RKtjyqQCgt1Axuw2xaQ0fZukRGuqAjJZatwPNAJ4uYPuswP3jaUC5BK2lW3VbffrpYNxDFdPKmy1pvnYPWYVDZkFDf3JCOhDVAaCNeYiLQhUTOuzvJQwn0E6zFbLHtlhVxZ7YboqiI21fOxn01CTlpDRjO9jMBLbTjbq2Dk5Bg8wBFqbzOCDxwn3Y+OU4P7rsQhy1he2hFCn/zZFKxloLZvVJOKopc98sp7VBS5dUPFYkL5TlnxHveeGRnt+3h+YgUWGduZXnoeedXecoQg584E63LFjM/hKjhJmcybI5os8A8Dg+7WGuMAgC3E42w5uazC2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YH4E13Porfm0W1Mdrrscjlt+UMQ0IgYhpRSIN7uCIQo=;
 b=XfcIAa3XRdHQUO287+QuOrna2ZGtgrAOaml5+oCwPU58wAFDOv5qPF4VB6wYLjrVY0bhko3pyvnm5/9VBsDOuHW9ZzwQEYOTyUUlA5IJ2fRy7MbT7RV6B0rVgrROTpx1N3/WnaOuVf9fynK/8Szq6oHc0Q7LNgjtHIEB1sj2UlEcZkMBc/GBYPHQl8uM5IcD9Qo01w/Q/w6+ry1hkuBiYatUGjBZyY03eFQq4DraOZKCdJHf1iG88VLchTT7imZ0hRHA3dZ8Sen980/ZKx0JzyNZBqN/JbTMI+RwfkomG4R/BBhxNO2nBQatJgQu2d/tGVPZM11D3Tyx4zzwTB47Uw==
Received: from DS7P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::9) by
 MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 08:01:52 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::3d) by DS7P220CA0015.outlook.office365.com
 (2603:10b6:8:223::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 08:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:01:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 01:01:30 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 01:01:29 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Jun 2026 01:01:21 -0700
Date: Wed, 17 Jun 2026 11:01:18 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
	<apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhiwang@kernel.org>
Subject: Re: [PATCH 4/9] gpu: nova-core: read vGPU mode from FSP via PRC
 protocol
Message-ID: <20260617110118.434aee2f@inno-dell>
In-Reply-To: <DJAC408HKZTR.20UBUA67YKT3O@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
	<20260604114339.1565660-5-zhiw@nvidia.com>
	<DJAC408HKZTR.20UBUA67YKT3O@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 479c901c-7d33-484d-60f7-08decc46b0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|1800799024|23010399003|13003099007|6133799003|22082099003|18002099003|4143699003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	FJqbnvksgIqzToZjLSoFf6PFPGR/LNr9asu+HoiXVouaA7iSMDfUUxw+PtZ2t9tQJpUalkAMRHbpWQTeudgEAObTxoEJPZvetf/za9ZjumdfKXg+dZN4oc7WAzCbgQc5EQcpG11RlHXQys4YscaDqRbkM9UePykbTfWp7V7hnMXRTtZStDzOKbAG72E7DtrCJaH5fdQ3tkHZawGNpCKKkx/z5oQMOn4JZM59w3I8He1fO3DmrURSv0tyIvirAKGunMlOMqgN551nGZjqJf2O4PQEorbGlVfH7/7jxUdS58oMCVBD5PSqBedXJ4uaKrXJ0uX7u7uxPZSDwQtR4PomQ3wwS0QON8LANbd5DxAfj+6fu8APz3BQEu59evaVYv0p5BxGniOwKwWGUR8L2e7MfiOdJsK1Hk4rWAT9+6FZ4V+WJoEj6nBqM03iR5tYaOJ+iH7pM69mJeQiJgOVJRdUN1F1VfGVNRwgegaebUh40nNv42QbmGPiWiciohImetkHoBnKdMM+iwUOknsJw1A8paaqSG+Y48XAS2oiJTUlbhVE6UeOpS2xN4JgGGRVySzmM9I9N82aGEdzHBy24TAJe/nQXIW42yZz9S+u/dfxMXwMHGTcnR4kzwhoLrG5mslinunrw4zWW0sRVWDboEFfrP5UZtfGhHio2hYopShurccdASL7qlYZNsz2VBFzdAnr8tZIx4IyCAnnhGz32ftk6UXDU3DMCQkeFY7X1huEbq2S6JYIeJddbPU+N3tY0w+V
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(1800799024)(23010399003)(13003099007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SztXlyRK/iU1b1YUodFk4J+njVILfIzrnz+qTuWWlEuHQt8XFoHGa3dIi8M8ya7JXhYT2jritGX2XJHtkygoM2jnU4JHwm+KrRxeDuyMPVdJ/STO9KkVba16c0VJcOkOusuv5XZt1c86Whi/ag/F+K/ew/j/OYCtiv7T9NZ2Vc0W7/AfXkodUcWe8Aprv+zDJdD/P8W5VBuDTJYeWmmXf8PFp65FCBdnPzwD69SkIFGG2hYX7CRVRX8W8Prkkb2+Y3oLbOjcqYerQldrNXUOrIl/56EGjkK9u1Yqo5mA+6DjBqVvsBgrHtlaT2+F2uB0qCvB+p5E8nAcshLm4Mj+s4+E9NJ8qHPYoPqTYk7MjOVsa2Ki5aRTw1Qr5uUTSEL8liLdfoonemeCoOgDSrJq3eqmqEAwIchv+McFB28AhhNl5OCeJVoHGX07mxLAjVhy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:01:51.8432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479c901c-7d33-484d-60f7-08decc46b0d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950

On Tue, 16 Jun 2026 17:35:27 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:

snip

> > +}  
> 
> These 3 should be defined as their own enum types, to make sure we
> cannot mix them. For instance:
> 
>     enum PrcMessageSubcmd {
>       Read = 0x0c,
>     }
> 
>     enum PrcObjectId {
>       VgpuMode = 0x29,
>     }
> 
>     (for the flags I guess you will want to use
> `kernel::impl_flags!`?)
> 
> Then, `NvdmPayloadPrc` can have a constructor that takes these 3 as
> parameters and returns the constructed value - that way no risk of,
> say, using the subcmd as an object identifier.
> 

Great idea. Actually, this is what I am looking for - how to
organized those values.

> Btw, is there a public source for these values?

Production reconfiguration knobs are public knowledge where folks
can find from [1]. vGPU mode is a newly added one.

[1] https://github.com/NVIDIA/gpu-admin-tools

> 
> I like the idea of using a `prc` sub-module - to the point where I'd
> suggest moving all PRC-related types to it, and all CoT messages to a
> `cot` sub-module. But doing it in this series would distract from the
> goal, and the `fsp` module is not that large, so let's keep everything
> in it for now and do this as a follow-up.
> 

I see. I can send another series to address above after this one is
done.

> > +
> > +/// vGPU operating mode as reported by FSP via the PRC protocol.
> > +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> > +pub(crate) enum VgpuMode {
> > +    /// vGPU support is disabled on this GPU.
> > +    Disabled = 0,
> > +    /// vGPU support is enabled on this GPU.
> > +    Enabled = 1,
> > +}
> > +
> > +impl TryFrom<u16> for VgpuMode {
> > +    type Error = kernel::error::Error;
> > +
> > +    fn try_from(value: u16) -> Result<Self> {
> > +        match value {
> > +            0 => Ok(VgpuMode::Disabled),
> > +            1 => Ok(VgpuMode::Enabled),
> > +            _ => Err(EINVAL),
> > +        }
> > +    }
> > +}  
> 
> You can even do `TryFrom<NvdmPayloadPrcResponse> for VgpuMode` for a
> better fit.
> 
> > +
> >  /// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
> >  #[repr(C, packed)]
> >  #[derive(Clone, Copy)]
> > @@ -57,6 +95,39 @@ struct NvdmPayloadCommandResponse {
> >      error_code: u32,
> >  }
> >  
> > +// SAFETY: NvdmPayloadCommandResponse is a packed C struct with
> > only integral fields. +unsafe impl FromBytes for
> > NvdmPayloadCommandResponse {} +
> > +/// PRC message payload.
> > +///
> > +/// Sent to FSP to query or modify a device configuration knob.
> > +/// The response includes the common FSP response header followed
> > by +/// a [`NvdmPayloadPrcResponse`] with the knob's current state
> > value. +#[repr(C, packed)]
> > +#[derive(Clone, Copy)]
> > +struct NvdmPayloadPrc {
> > +    sub_message_id: u8,
> > +    flags: u8,
> > +    object_id: u8,
> > +    reserved: u8,
> > +}
> > +
> > +// SAFETY: NvdmPayloadPrc is a packed C struct with only integral
> > fields. +unsafe impl AsBytes for NvdmPayloadPrc {}
> > +
> > +/// PRC response payload containing the knob state value.
> > +#[repr(C, packed)]
> > +#[derive(Clone, Copy)]
> > +struct NvdmPayloadPrcResponse {
> > +    value_low: u8,
> > +    value_high: u8,
> > +    reserved1: u8,
> > +    reserved2: u8,
> > +}
> > +
> > +// SAFETY: NvdmPayloadPrcResponse is a packed C struct with only
> > integral fields. +unsafe impl FromBytes for NvdmPayloadPrcResponse
> > {} +
> >  /// Common MCTP and NVDM headers shared by all FSP messages.
> >  #[repr(C, packed)]
> >  #[derive(Clone, Copy)]
> > @@ -92,6 +163,18 @@ struct FspResponse {
> >  // SAFETY: FspResponse is a packed C struct with only integral
> > fields. unsafe impl FromBytes for FspResponse {}
> >  
> > +/// Complete FSP PRC response including the knob state payload.
> > +#[repr(C, packed)]
> > +#[derive(Clone, Copy)]
> > +struct FspPrcResponse {
> > +    header: FspMessageHeader,
> > +    response: NvdmPayloadCommandResponse,  
> 
> Since you introduced `FspMessageHeader` to factor out `mctp_header`
> and `nvdm_header`, can you do the same for the reponse? I guess in our
> case this is as simple as renaming `FspResponse` to
> `FspResponseHeader` and using it in `FspPrcResponse`.
> 
> > +    prc_data: NvdmPayloadPrcResponse,
> > +}
> > +
> > +// SAFETY: FspPrcResponse is a packed C struct with only integral
> > fields. +unsafe impl FromBytes for FspPrcResponse {}
> > +
> >  /// Trait implemented by types representing a message to send to
> > FSP. ///
> >  /// This provides [`Fsp::send_sync_fsp`] with the information it
> > needs to send @@ -178,10 +261,25 @@ fn new<'a>(
> >  // bytes are initialized.
> >  unsafe impl AsBytes for FspCotMessage {}
> >  
> > +/// Complete FSP PRC message.
> > +#[repr(C, packed)]
> > +#[derive(Clone, Copy)]
> > +struct FspPrcMessage {
> > +    header: FspMessageHeader,
> > +    prc: NvdmPayloadPrc,
> > +}
> > +
> > +// SAFETY: FspPrcMessage is a packed C struct with only integral
> > fields. +unsafe impl AsBytes for FspPrcMessage {}
> > +
> >  impl MessageToFsp for FspCotMessage {
> >      const NVDM_TYPE: NvdmType = NvdmType::Cot;
> >  }
> >  
> > +impl MessageToFsp for FspPrcMessage {
> > +    const NVDM_TYPE: NvdmType = NvdmType::Prc;
> > +}
> > +
> >  /// Bundled arguments for FMC boot via FSP Chain of Trust.
> >  pub(crate) struct FmcBootArgs {
> >      chipset: Chipset,
> > @@ -226,6 +324,53 @@ pub(crate) struct Fsp {
> >  }
> >  
> >  impl Fsp {
> > +    /// Read vGPU mode from FSP using the PRC protocol.
> > +    ///
> > +    /// Queries FSP's Management Partition for the active vGPU
> > mode knob value.
> > +    /// Returns [`VgpuMode::Enabled`] if vGPU support is active on
> > this GPU,
> > +    /// [`VgpuMode::Disabled`] otherwise.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn read_vgpu_mode(
> > +        &mut self,
> > +        dev: &device::Device<device::Bound>,
> > +        bar: Bar0<'_>,
> > +    ) -> Result<VgpuMode> {
> > +        let msg = KBox::new(
> > +            FspPrcMessage {
> > +                header: FspMessageHeader::new(NvdmType::Prc),
> > +                prc: NvdmPayloadPrc {
> > +                    sub_message_id: prc::SUBCMD_READ,
> > +                    flags: prc::FLAG_ACTIVE,
> > +                    object_id: prc::OBJECT_VGPU_MODE,
> > +                    reserved: 0,
> > +                },
> > +            },
> > +            GFP_KERNEL,
> > +        )?;
> > +
> > +        let response_buf = self.send_sync_fsp(dev, bar, &*msg)?;
> > +
> > +        let prc_resp_size = core::mem::size_of::<FspPrcResponse>();
> > +        if response_buf.len() < prc_resp_size {
> > +            dev_err!(
> > +                dev,
> > +                "PRC response too small: {} bytes (expected {})\n",
> > +                response_buf.len(),
> > +                prc_resp_size
> > +            );
> > +            return Err(EIO);
> > +        }  
> 
> IIUC `from_bytes_prefix` takes care of checking the size, so this
> check looks redundant.

