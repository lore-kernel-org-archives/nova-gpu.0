Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB54457DE
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230066; cv=fail; b=MZIKnyMoSSLuiLClkWaHPJqr5R0mt5UyKEGa6U8LuRDXMPUAJUGffu+5zeGIfgNmrI54S9xF4qiotZhlmC/pEUenD0xf0o6ka6dXvfs6bsxsx7nMrDzXXFVeQhUAT1um9pXstGhY2FalnQJKrGcA6GBScCrFezKtbMPdGYBNsvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230066; c=relaxed/simple;
	bh=1gNCseKG4hiZMknptYCOHLvZzGDZeveQeb7uP4147aU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5wIQ9Ft399ykMhbTiTN+1BCU/BqKl/TtEdX6LkonWbu1smKIiyIb16xu+ljQV17CBlKB2/YcLf/6zz8ZNAyem4R8pAc+2GPyQjXU+ffaYWlcAg5ZpBNQ7X/P2H/7IoaaVVZfe+OFKy30WWV8RUC5vW85He1fp18SrDmZOrZ/wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TQZnPb8D; arc=fail smtp.client-ip=52.101.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TQZnPb8D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igAZLE8wD5n8tSWjUF4x48XuEKY1UpXWEWFQSuf0t4CQrdQoaLaRwO3ftt0w5lQElXBu+5IddZgbOewez+NvrQ99DuNFWWG+tj9Pps+MZngWdgd2VDdnAUm3GjmkzIG1K8KxnSxwAXyhEqVnMV6X1BLeg+tkrCFypjLeF0zUfVuYTt/XNxee+3RLhXnH3r/Oz4xpoPLeZW5ngp68VtkYubTqc0fdUBp+r6Ug/I2VFfLOzBpZELB60ApdTgWC9SAuuP4imMwV0OGa1u/hcdrk9sKAG9bFLcplqQ7adX4QZo95SFclzKPGPVCtpLyPW20kZQbIG660moPlDumwMioRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6k4Z/RwI2Y7wvdbRMlqGbzkBzNYSldtbLrjHWP43Hs=;
 b=m8xKqQ1aZUQCFyDhw36sfe6n/nCJD7cFsj5yhE8wPyM0WQ/fmx9GISML9pX0GwpNygyyff3SRdVRJc6/MEueDIB/W+BhRr0iZEx1IzrLsSsXUo6jOGhWXKrb6icoMLpS6gmvBZ4dUV3jBpimfkSxV2XsxjGFoIV/rmafiZ8IBj3d3Y9SOTBrGUW9MkGGRpyRFg3DESPeQLauZwfYITk7G78Ef7IjPF2c6QOFwdAYQgyfpyNVCZa7x5x4mY8UjweVRky4Dc/m/t/exL2ZUCLccdd9v9yP/ZCLvVbV+ZqN4C9BsvWoXN83LwsjmWi3uUivkdQOTPspGQ672atiVvkyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6k4Z/RwI2Y7wvdbRMlqGbzkBzNYSldtbLrjHWP43Hs=;
 b=TQZnPb8DhS933AXM1pVgqp1eFZXQ3zCAj3LfUa+tqkpGurPa7DdXpm3PcyofOyu2850mKGCP1gqfoEx8JuNSjNfNAxLwJCw4H0gWIW9O2IE0k6ztZmOoz4QwcR6s2K1iS5J9/oqEHpBug9vVQKEAmqdi+cb2ny0h6LT8tuWLBILvkb+pOqmcEEJRljZYkmCNWedc2eqrxc8T4H4kUjjhhq9iMhYUbGctPksB7rPlArwy5SdYH+bN4V499vblPkQuhfVvVzpB7DGKD0fn5Uyto4pmEeYDlCP+R14Lu+X4OetrBJiaQgDVyFAp4N0222ZHPMkKKaVakirn8X0nHLiJMA==
Received: from BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 12:47:35 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::69) by BL1PR13CA0100.outlook.office365.com
 (2603:10b6:208:2b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Thu, 20
 Aug 2026 12:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 12:47:35 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 05:47:16 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 05:47:16 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 05:47:11 -0700
Date: Thu, 20 Aug 2026 15:47:09 +0300
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
Subject: Re: [PATCH 13/27] gpu: nova-core: generalize allocate_command() for
 variable headers
Message-ID: <20260820154709.513a7629@inno-dell>
In-Reply-To: <20260819035221.336390-14-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-14-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 716605fd-a9b6-493c-7a9f-08defeb9358f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|10067099003|56012099006|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pzVwMpAR6LKrlT6DVWsKvpxRJYE/R4+SRxyaMgsrXxOKpvzdwcjG4xa9e0322S+B1Z66pPzMBQhpu5Y15TylDpy4KwcleLI1axCdZaD4R8lhur13XAvBW7J8EPufl1Zv+ZwCOBo2Dsk5PQjpTZqzGw7QfXyJcIfFm27/7wh7zvoav29IeMFxzqUpOrgKcCzxXqf4j4r3WmmDaWkAU0qi4u1/UjZlJFljjkM5FNYdCCzefmqrd3+yS/R2SvDJvPQZ0LFqsbeXWrLqRjb9R9liFA09cfu2jBYlt5JTq7zbsnv3hEZSIpfsgDwpSHfTn+pyhSeiQZ46Bqp9/lZ+IjB0fd4GnOHNRCzJS/IlLbaPpsZXj48AOFWr1I01YjLA53CkDHR8/Nwp2EkYFXycfKq5so6EthkGVa7f/keMGmxem0XEA7+Tzrab02RXOQABO6bKi3VEhYbMttZSHwvFNRV+v7POQ8C7uLWF9DwDtVBFkQZnd9NH2zKReECE57X9Tf/+Vzcoe7PHTCVHvQsOT4PsqZE7gl7VqcLr7KRg78YfOy/Cn9asiV5I9U8gKLDPMOQhisl+qcLXXFI55CHdEUJUlxeeQDslXBYcVX9z6Wv2WkHkTb8YaGRZBzGgSTrh61bs25qaGOWFOMzHxA8xjuglME8OEfJ0dhjJi8RwTR1ZLUlVopAlWMB5Rp1QzsHTxHZfFB+tp14lsQnDLESZZz1FqA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nTKgiS0wPvCvO0fiFE1iccroTuFThhDUKKyQQYtbRiicDoIoyqqTCLSZBtcFFLOrqvwxVIn0n4CwjFfijtMVB35It2yBSpOXfboOtKK3jgpyEowqmw+LDITGRn59w1400etJjY6qLvixCdmVcbLA02TWWeY0mBB/a7lxIcDZTr0WQqqK3Shch7Afl9YfU7mPr/EbYSR/H+4/JzYR+UcJZZSy7Sb8PHLyfLJb6/rf1qdyXE1DpXClEbMETN6ocQgT8AbOI5mBm/ecR/zWOTdQSPjYZyQuGn/4OKNlHi0gobrQat5ZWbYe0yR6anFadKo0nHVSFSiFWw4sAoCD+EG+X/EEh47gEq8iscicHrEZWsOxl3Fz56PSoeOdDVCFi7sN+VqMnikDaTlYFaXIRa/OFFDGgikNOr2Fk6OWyIEnNiV7lSdKRE6GPMILfqo4drbG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 12:47:35.2148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716605fd-a9b6-493c-7a9f-08defeb9358f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

On Tue, 18 Aug 2026 20:52:06 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looking good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The GMC command path uses a different message element header from the
> VGPU-style RPC path, but the two share the queue, the space
> accounting, and the wrapping rules. Make allocate_command() and
> GspCommand generic over the header type, defaulting to GspMsgElement
> so the existing RPC callers are unchanged.
> 
> No functional changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index 1d86d2927a94..0dab3d279426
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -365,6 +365,8 @@ fn driver_write_area_size(&self) -> usize {
>      /// Allocates a region on the command queue that is large enough
> to send a command of `size` /// bytes, waiting for space to become
> available based on the provided timeout. ///
> +    /// The type parameter `H` selects the message element header,
> [`GspMsgElement`] for RM RPC.
> +    ///
>      /// This returns a [`GspCommand`] ready to be written to by the
> caller. ///
>      /// # Errors
> @@ -372,13 +374,17 @@ fn driver_write_area_size(&self) -> usize {
>      /// - `EMSGSIZE` if the command is larger than
> [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`]. /// - `ETIMEDOUT` if space does
> not become available within the timeout. /// - `EIO` if the command
> header is not properly aligned.
> -    fn allocate_command(&mut self, size: usize, timeout: Delta) ->
> Result<GspCommand<'_>> {
> -        if size_of::<GspMsgElement>() + size >
> GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
> +    fn allocate_command<H: FromBytes + AsBytes>(
> +        &mut self,
> +        size: usize,
> +        timeout: Delta,
> +    ) -> Result<GspCommand<'_, H>> {
> +        if size_of::<H>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
>              return Err(EMSGSIZE);
>          }
>          read_poll_timeout(
>              || Ok(self.driver_write_area_size()),
> -            |available_bytes| *available_bytes >=
> size_of::<GspMsgElement>() + size,
> +            |available_bytes| *available_bytes >= size_of::<H>() +
> size, Delta::from_micros(1),
>              timeout,
>          )?;
> @@ -390,8 +396,8 @@ fn allocate_command(&mut self, size: usize,
> timeout: Delta) -> Result<GspCommand (slice_1.as_flattened_mut(),
> slice_2.as_flattened_mut()) };
>  
> -        // Extract area for the `GspMsgElement`.
> -        let (header, slice_1) =
> GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
> +        // Extract area for the message element header.
> +        let (header, slice_1) =
> H::from_bytes_mut_prefix(slice_1).ok_or(EIO)?; 
>          // Create the contents area.
>          let (slice_1, slice_2) = if slice_1.len() > size {
> @@ -609,10 +615,12 @@ fn driver_read_area_v2(
>  
>  /// A command ready to be sent on the command queue.
>  ///
> +/// The type parameter `H` is the message element header type,
> [`GspMsgElement`] for RM RPC. +///
>  /// This is the type returned by [`DmaGspMem::allocate_command`].
> -struct GspCommand<'a> {
> +struct GspCommand<'a, H = GspMsgElement> {
>      // Writable reference to the header of the command.
> -    header: &'a mut GspMsgElement,
> +    header: &'a mut H,
>      // Writable slices to the contents of the command. The second
> slice is zero unless the command // loops over the command queue.
>      contents: (&'a mut [u8], &'a mut [u8]),

