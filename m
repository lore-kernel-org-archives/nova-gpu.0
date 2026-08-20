Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6637D12E
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251084; cv=fail; b=eNSA5a6Xkm0mC51g1parLCEd50urMu4vEVSMxYTZbLIPpLZ9fVrQgvBCJKB8NSHKYRQpEelgrnfKnLa76gdK7o03gi/TzWC8qKCqPF65JVVfJm2NbxCfCV1BZFeFHTrN4WdkQFIoLCuu8t6UJS40LWar+PsZJNdl7L1MCpLB6po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251084; c=relaxed/simple;
	bh=Ky6d/rRl27Zyi+xvP0XwADoQVWkPIzX0So8k77ML+gI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M05LaPODwGLZO1vV1U+XpGDpkLxzWd7RLtI/Xx6GTktvpVvesx4rhh9uNg67vpPRSYCwJLa4gXUG1CXt3eD/fd1yQ0YcaxvEpjaAWOrGKcKcLzt8rSPP9hKhmUwpuWsAUkwfoEYEXRiQWnb5eZ0oRltxciwkltr5PjosspNxbiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TRsGeCRY; arc=fail smtp.client-ip=52.101.57.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TRsGeCRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYwAtUtby1sNjjmO5JVYcGBW68XOqsOUDZUJuAsJ2iLa0xVqoPfE1p1+YuM/EjNympo0ZmAxyRNPXcehWEc4nFA4rVTv6Zpg2ds6gOnQkI6We2TfzZ7sV5O6MAP1wIHhH/tBJhShoUIdG25ehXtP8LVuhey6+ESZ2eTMGQGjAFyEtrnBc52G9NFYY5YaPiisUTPKwpFizsvQxap2xBxbDFZPPlKqcBk+6LewEI89Wo99URbaC2xJIAHHoZJqjG9Xud8ejPJ0vf01INJgZuNSUItKhasHQ06UKrsGg79Q84flYlHR0ct+HmMlL2YiKzVhhgQgiZFxyDeT+7KlqsD3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85JsZaeGZJ0CosuLYm//daqB6SXjhRIRxR8ZSdZ3Piw=;
 b=rRrRqTFbrKx6FxDp6OxbR6cm9jCubrOMDskjLlREhhiNbeCVmJEuPJ+Aia5EfExVtZdTboG9KxplFSmPD+XUM0kgWWeE4CaVu7IGZI29MATxLeB/fupLBj3FICucOmSi5RJ/GA0550ZnRrCN5/q/E+Om2jVD5jvaQb30GQ9OdUHJqA551toGl1Mko08Ee6IrwGBnFGe5JuZMsMJpdO0qBfO6dB8VI9qAiL/a++3dyQIqMv09SlNXhCjBFqNN2y89iRqhDqPDQDTLRl3d68Il1m3BUV7cu3LLqEGpu0C4UvrSNHF86ci1yww/tk7VX9amuMSWaVOENIomi5Q1J3mj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85JsZaeGZJ0CosuLYm//daqB6SXjhRIRxR8ZSdZ3Piw=;
 b=TRsGeCRY5H7rWy0A5ibWfXaOL4prQjtCC8OW8DS4xluraKc5laS5zcRNNzktOXrVh4xXy3SCwNcJfEu6kxoRMSFuGMd4tRoD8XHUo5cxsh3iGPbXfQj41XsP0FAzyPf4y4QOSaqxWrx2uBmtSHRaF5e6XY9J5qi595dXXwrSY6k0dzajDLjOvo1MSMAN2rIOBYxipxftShmjsZB1nAzE0ErlRrTbtwlioiOobKva084UD6CjReNSsDJMSzivFHytTDrmnyZv/ALCx2aIfIclk75pMjxcbsLQQUAgXRGzM5ala1fsZY+/CjRq+rbtT38KJo8mGD7B6je/uck0Lz3MJQ==
Received: from BL1PR13CA0393.namprd13.prod.outlook.com (2603:10b6:208:2c2::8)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:37:49 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::2a) by BL1PR13CA0393.outlook.office365.com
 (2603:10b6:208:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 18:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 18:37:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 11:37:31 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 11:36:50 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 11:36:45 -0700
Date: Thu, 20 Aug 2026 21:36:42 +0300
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
Subject: Re: [PATCH 23/27] gpu: nova-core: gsp: send GSP_INIT and decode its
 reply
Message-ID: <20260820213642.483b9cce@inno-dell>
In-Reply-To: <20260819035221.336390-24-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-24-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec45a22-7199-4319-f1dc-08defeea22de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|56012099006|10067099003|3023799007|6133799003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jqnpP3PuYdwQJ4J1rASYKUxZOc7Y6r2E87pfLWZVQcS91XLa1Snj+9om/VLnfgEPMaF3oHe46/STwTZwvRXoLm9GGHDLTYhS+4LOV4hmmkulKHTaVt/j88zugH3zz2/XWNXqdmQm01BLqtBjOfunTmtFve/HbAxXgxzN9D4KtPVh9CVGTaC+gxY/b7HHUKzfOAGKYlxv6loc1i7fnqCvI/jV+WtrN5MCb4LNkKS0Mez6h6ErE9P1mK2t5J/Oz2iA5RkT8ZUv7O2b7O0w7CobdLuQTLonvjJ6UKLAWhwZy3Y3jVIT736BREC0ZGjQZdGbfWhRYQ0tqDhIRN4OKr/z3FzfCJEdCDcKXSw03QPNZA0HjwR5w91XoXTzZxq1JK+EjFryLVQSYa+4SrV3lO5yM344RgThE/xx9YA/HS93lUf3VEK6JvHjKGkWywbWlF5NYELYFksKbq8/gBLu66A7Y0me73hVe7NPlGHvJ2IeT2S9rMxcTOrt882vJqXh6BFV85qr2dfgtEJFLKD+7JNxId7ErNn6rSDvgl8PKVCD/rMkKekSVwNB+rGx81eW851robi19LKxVXmyC5mR+T4lTAIPGEUjBuyjJ7wY2DHNiHY9q7lyp556ykrW2IUPmWcRRdZGnTi6pCOOIjjDiISfgYdOD5MS8+kDs3Dr+1WMQIPxVPHKsAx2HASx4yOIGftYFAg4UT7lBPFXwjISdelyvg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(56012099006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3b4ys+nTuSIt+9tLnElMcGrf/uQcLAV92FHoioVW0eI/WZlmthAe/BsN38n0MFsErlbDRLSQddwF3XUI7SI/tLhWdGOdeyFKCEW2mmMZgQAi4W9KTgjm1o9wHcUwT8vY3yt+9AkTjiWJPLjnctuRi+2Hy/V1g67F8kn6OuGq6Yd69IBcdAsZ5ZULEbEPULXJ/GXnvqxCa2fSAOEzhBnWGTUYdGbFrCg3TVZHrtO2jnOn/QpZEGs5Bs2NEVTyacasHdCijmnvmflfax+z7ZgiNkWq2tDT8puRL7Fv+4a/JuH0earwPzXvd1WVuQ2MT7C7QUDMHk+lxIlH8i8NTqh5N6OPDAoWCLtVADd85FJwQSVokViHtGcx1CWo7h8GDRifas9jkBzZ0VHeuIOk+WLAyPf5o3k5c2Mz+HvfGBj8tJhBDT0SC4Qb43E7r8LFR00W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:37:49.2045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec45a22-7199-4319-f1dc-08defeea22de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234

On Tue, 18 Aug 2026 20:52:16 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looks good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> GSP-RM answers a GSP_INIT request with the static GPU configuration,
> and that reply is also what signals it has finished starting. It
> raises load-and-execute events in the meantime, so a caller must
> handle them rather than wait through them.
> 
> Nova-core can build the request but cannot send it: the GMC sender is
> private, and the receive path drops the field carrying the reply
> status.
> 
> Add the sender and the receive-side status field it needs, and decode
> the reply into the static-info type the RPC path already produces.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs        |  49 ++++++--
>  drivers/gpu/nova-core/gsp/commands.rs    | 140
> ++++++++++++++++++++++- drivers/gpu/nova-core/gsp/fw.rs          |
> 4 + drivers/gpu/nova-core/gsp/fw/commands.rs |  35 +++++-
>  4 files changed, 213 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index 7da61bc9ad92..82ff46620911
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -790,22 +790,43 @@ fn receive_msg<M: MessageFromGsp>(&self,
> timeout: Delta) -> Result<M> self.inner.lock().receive_msg(timeout,
> None) }
>  
> -    /// Receives one GMC event from the GSP and passes its command
> id and raw payload slices to
> -    /// `handler`.
> +    /// Receives one GMC element from the GSP and passes its command
> id, the `max_resp_or_status`
> +    /// field, and the raw payload slices to `handler`.
>      ///
>      /// This method may sleep while waiting. The [`CmdqInner`] mutex
> stays locked across the wait /// and across the `handler` call, so
> `handler` must not call back into this [`Cmdq`]. ///
>      /// See [`CmdqInner::receive_gmc_and_dispatch`] for return
> values, queue state, and errors.
> -    #[expect(dead_code)]
>      pub(crate) fn receive_gmc_and_dispatch<R>(
>          &self,
>          timeout: Delta,
> -        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
> +        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
>      ) -> Result<Option<R>> {
>          self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
>      }
>  
> +    /// Sends a GMC API command to the GSP without waiting for its
> response.
> +    ///
> +    /// A caller that expects a response reads it with
> [`Self::receive_gmc_and_dispatch`], which
> +    /// lets it handle the events GSP-RM interleaves before the
> response arrives.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EMSGSIZE` if the command exceeds the maximum queue
> element size.
> +    /// - `ETIMEDOUT` if space does not become available within the
> timeout.
> +    /// - `EIO` if the command header is not properly aligned.
> +    pub(crate) fn send_gmc_no_wait(
> +        &self,
> +        bar: Bar0<'_>,
> +        command_id: u32,
> +        payload: &[u8],
> +        max_response_size: u32,
> +    ) -> Result {
> +        self.inner
> +            .lock()
> +            .send_gmc(bar, command_id, payload, max_response_size)
> +    }
> +
>      /// Waits for an unsolicited GSP event of type `M`, dispatching
> any other event that arrives /// first.
>      ///
> @@ -1005,7 +1026,6 @@ fn send_command<M>(&mut self, bar: Bar0<'_>,
> command: M) -> Result<u32> /// - `EMSGSIZE` if the command exceeds
> the maximum queue element size. /// - `ETIMEDOUT` if space does not
> become available within the timeout. /// - `EIO` if the command
> header is not properly aligned.
> -    #[expect(dead_code)]
>      fn send_gmc(
>          &mut self,
>          bar: Bar0<'_>,
> @@ -1383,9 +1403,13 @@ fn wait_for_gmc_msg(&self, timeout: Delta) ->
> Result<GmcMessage<'_>> { 
>      /// Receive the next GMC event from the GSP and dispatch it
> through a handler. ///
> -    /// The handler receives the GMC command id and the raw payload
> slices that follow the
> -    /// [`super::fw::GmcApiHeader`] (two slices because the circular
> buffer may wrap). It returns
> -    /// `None` for an event it does not handle.
> +    /// The handler receives the GMC command id, the header's
> `max_resp_or_status` field, and the
> +    /// raw payload slices that follow the
> [`super::fw::GmcApiHeader`] (two slices because the
> +    /// circular buffer may wrap). It returns `None` for an element
> it does not handle.
> +    ///
> +    /// `max_resp_or_status` is a union: GSP-RM writes an
> `NV_STATUS` there when the element is a
> +    /// response, and the maximum response size when it is a
> request. Only a handler that knows
> +    /// which one it asked for can read it.
>      ///
>      /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this
> keys on the GMC command id, /// which is the form the r000 firmware
> uses for boot events. @@ -1401,7 +1425,7 @@ fn
> wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
> fn receive_gmc_and_dispatch<R>( &mut self,
>          timeout: Delta,
> -        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
> +        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
>      ) -> Result<Option<R>> {
>          let message = self.wait_for_gmc_msg(timeout)?;
>          let header = message.header;
> @@ -1420,7 +1444,12 @@ fn receive_gmc_and_dispatch<R>(
>                  length,
>              );
>  
> -            handler(command_id, message.contents.0,
> message.contents.1)
> +            handler(
> +                command_id,
> +                header.gmc.max_resp_or_status,
> +                message.contents.0,
> +                message.contents.1,
> +            )
>          } else {
>              dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue
> element\n"); None
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs
> b/drivers/gpu/nova-core/gsp/commands.rs index
> 0c3832ccf726..d55faf1a4e04 100644 ---
> a/drivers/gpu/nova-core/gsp/commands.rs +++
> b/drivers/gpu/nova-core/gsp/commands.rs @@ -20,6 +20,7 @@
>  };
>  
>  use crate::{
> +    driver::Bar0,
>      gpu::Chipset,
>      gsp::{
>          cmdq::{
> @@ -32,13 +33,18 @@
>              self,
>              commands::{
>                  GspInitRequest,
> +                GspInitResponse,
> +                GspInitResponseSchema,
>                  RegKey, //
>              },
> -            MsgFunction, //
> +            MsgFunction,
> +            GMCAPI_CMD_GSP_INIT, //
>          },
>          nvkv::{
> +            Decoder,
>              Encodeable,
> -            Encoder, //
> +            Encoder,
> +            UnknownKeyPolicy, //
>          },
>      },
>      sbuffer::SBufferIter,
> @@ -311,6 +317,136 @@ pub(crate) fn build_gsp_init_payload(
>      Ok(encoder.finish())
>  }
>  
> +/// Size of the buffer GSP-RM may fill with static configuration,
> matching the allocation Open RM +/// makes in `kgspSendInitRpcs`.
> +const GSP_INIT_MAX_RESPONSE_SIZE: u32 = 48 * 1024;
> +
> +/// Sends `GSP_INIT` and returns the static configuration its reply
> carries. +///
> +/// GSP-RM interleaves load-and-execute events between the request
> and the reply, and those events +/// drive the falcon loads that let
> it finish starting, so each one is passed to `on_boot_event` +///
> rather than skipped. The reply arrives only once GSP-RM is up, which
> is what makes it the +/// signal that boot is complete. +///
> +/// `payload` is the blob from [`build_gsp_init_payload`].
> +///
> +/// # Errors
> +///
> +/// - `EIO` if GSP-RM reports a failure status, or if the reply is
> not a whole number of NVKV +///   words.
> +/// - `ETIMEDOUT` if neither the reply nor another element arrives
> within +///   [`Cmdq::RECEIVE_TIMEOUT`].
> +///
> +/// Errors from `on_boot_event` and from decoding the reply are
> propagated as-is. +#[expect(dead_code)]
> +pub(crate) fn gsp_init(
> +    cmdq: &Cmdq,
> +    bar: Bar0<'_>,
> +    payload: &[u64],
> +    mut on_boot_event: impl FnMut(u32, &[u8]) -> Result,
> +) -> Result<GetGspStaticInfoReply> {
> +    // Qualified because `zerocopy::IntoBytes` also gives `[T]` an
> `as_bytes`.
> +    let payload = AsBytes::as_bytes(payload);
> +
> +    cmdq.send_gmc_no_wait(
> +        bar,
> +        GMCAPI_CMD_GSP_INIT,
> +        payload,
> +        GSP_INIT_MAX_RESPONSE_SIZE,
> +    )?;
> +
> +    loop {
> +        let reply = cmdq.receive_gmc_and_dispatch(
> +            Cmdq::RECEIVE_TIMEOUT,
> +            |command_id, max_resp_or_status, payload_0, payload_1| {
> +                if command_id == GMCAPI_CMD_GSP_INIT {
> +                    Some(decode_gsp_init_reply(
> +                        max_resp_or_status,
> +                        payload_0,
> +                        payload_1,
> +                    ))
> +                } else {
> +                    // A boot event. Keep waiting for the reply
> unless handling it failed.
> +                    match on_boot_event(command_id, payload_0) {
> +                        Ok(()) => None,
> +                        Err(e) => Some(Err(e)),
> +                    }
> +                }
> +            },
> +        )?;
> +
> +        if let Some(reply) = reply {
> +            return reply;
> +        }
> +    }
> +}
> +
> +/// Decodes the `GSP_INIT` reply, whose `max_resp_or_status` field
> carries an `NV_STATUS`. +fn decode_gsp_init_reply(
> +    status: u32,
> +    payload_0: &[u8],
> +    payload_1: &[u8],
> +) -> Result<GetGspStaticInfoReply> {
> +    if status != 0 {
> +        return Err(EIO);
> +    }
> +
> +    decode_gsp_info(&nvkv_words(payload_0, payload_1)?)
> +}
> +
> +/// Joins the two halves of a wrapped payload into the `u64` words
> an NVKV stream is made of. +///
> +/// # Errors
> +///
> +/// - `EIO` if the combined length is not a whole number of words.
> +/// - `ENOMEM` if the buffer cannot be allocated.
> +fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) ->
> Result<KVVec<u64>> {
> +    let bytes = SBufferIter::new_reader([payload_0,
> payload_1]).flush_into_kvec(GFP_KERNEL)?;
> +    let words = bytes.chunks_exact(size_of::<u64>());
> +    if !words.remainder().is_empty() {
> +        return Err(EIO);
> +    }
> +
> +    let mut out = KVVec::with_capacity(bytes.len() /
> size_of::<u64>(), GFP_KERNEL)?;
> +    for word in words {
> +        let word: [u8; size_of::<u64>()] =
> word.try_into().map_err(|_| EIO)?;
> +        out.push(u64::from_le_bytes(word), GFP_KERNEL)?;
> +    }
> +
> +    Ok(out)
> +}
> +
> +/// Decodes the static GPU configuration from an NVKV stream.
> +///
> +/// # Errors
> +///
> +/// - `EINVAL` if the stream is malformed or omits a required key.
> +/// - `ENOMEM` if the decoded regions cannot be allocated.
> +fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
> +    let decoder = Decoder::new(words, UnknownKeyPolicy::Ignore);
> +    let decoded = KBox::try_init(
> +        decoder.decode(GspInitResponseSchema::default())?,
> +        GFP_KERNEL,
> +    )?;
> +
> +    let mut gpu_name = [0u8; GspInitResponse::MAX_GPU_NAME_LEN];
> +    let name = decoded.gpu_name();
> +    gpu_name
> +        .get_mut(..name.len())
> +        .ok_or(EINVAL)?
> +        .copy_from_slice(name);
> +
> +    let mut usable_fb_regions = KVec::new();
> +    for region in decoded.usable_fb_regions() {
> +        usable_fb_regions.push(region, GFP_KERNEL)?;
> +    }
> +
> +    Ok(GetGspStaticInfoReply {
> +        gpu_name,
> +        usable_fb_regions,
> +    })
> +}
> +
>  pub(crate) use fw::commands::PowerStateLevel;
>  
>  /// The `UnloadingGuestDriver` command, used to shut down the GSP.
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> b/drivers/gpu/nova-core/gsp/fw.rs index 4772af362117..6958ee3a2e4e
> 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -979,6 +979,10 @@ pub(crate) struct GmcApiHeader {
>  /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries
> flags. const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
>  
> +/// GMC command that hands GSP-RM its system information and
> registry keys and returns the static +/// GPU configuration. Its
> reply is also what signals that GSP-RM has finished starting.
> +pub(crate) const GMCAPI_CMD_GSP_INIT: u32 =
> r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT; + /// GMC command
> asking the driver to run the generic falcon bootloader against a
> descriptor the /// GSP supplies. pub(crate) const
> GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 = diff --git
> a/drivers/gpu/nova-core/gsp/fw/commands.rs
> b/drivers/gpu/nova-core/gsp/fw/commands.rs index
> bfd756813c64..00e40a435053 100644 ---
> a/drivers/gpu/nova-core/gsp/fw/commands.rs +++
> b/drivers/gpu/nova-core/gsp/fw/commands.rs @@ -402,7 +402,7 @@
> pub(crate) fn new( /// Schema for the `GSP_INIT` response.
> #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))] #[derive(Default)]
> -    struct GspInitResponseSchema => GspInitResponse {
> +    pub(crate) struct GspInitResponseSchema => GspInitResponse {
>          gpu_name:
>              Array<u8, { GspInitResponse::MAX_GPU_NAME_LEN }, {
> Self::GPU_NAME_STRING_KEY }>, fb_regions: Accumulated<FbRegionSchema>,
> @@ -420,7 +420,7 @@ impl GspInitResponseSchema {
>  
>  /// Payload of the `GSP_INIT` response.
>  #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
> -struct GspInitResponse {
> +pub(crate) struct GspInitResponse {
>      gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
>      fb_regions: KVVec<FbRegion>,
>      bar1_pde_base: u64,
> @@ -428,7 +428,36 @@ struct GspInitResponse {
>  }
>  
>  impl GspInitResponse {
> -    const MAX_GPU_NAME_LEN: usize = 64;
> +    pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
> +
> +    /// A region with no tag is general-purpose memory. A tagged
> region is reserved for a
> +    /// firmware-internal use that the tag identifies.
> +    const FB_REGION_TAG_NONE: u32 = 0;
> +
> +    /// Returns the GPU name, which GSP-RM sends with its NULL
> terminator.
> +    pub(crate) fn gpu_name(&self) -> &[u8] {
> +        self.gpu_name.as_slice()
> +    }
> +
> +    /// Iterates over the FB regions the driver may allocate from.
> +    ///
> +    /// A region qualifies when it is untagged, unprotected, and
> supports both compression and
> +    /// isochronous access, which is the same set the RPC path
> selects from
> +    /// [`GspStaticConfigInfo::usable_fb_regions`].
> +    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item =
> Range<u64>> + '_ {
> +        self.fb_regions.iter().filter_map(|region| {
> +            if region.limit >= region.base
> +                && region.tag == Self::FB_REGION_TAG_NONE
> +                && !region.flags.protected()
> +                && region.flags.support_compressed()
> +                && region.flags.support_iso()
> +            {
> +                region.limit.checked_add(1).map(|end|
> region.base..end)
> +            } else {
> +                None
> +            }
> +        })
> +    }
>  }
>  
>  nvkv_decode! {

