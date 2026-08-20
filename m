Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FCC37CD41
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224385; cv=fail; b=M4bfqPjiNq4aB6njuR7fpg/T55l6qUXxoC9BkNnZ3TjOnogffdRpIwtRhXiiOQZNpkplf4FI3gUH3Jsucjn0CNUTA1YVKRNmpTqEdKtpO7BLaczxavS/EHGlm+M6q4pHg/Fnpi3FBqZZ6MfgeeqrasGMi0nffWly11+1YiyZ2tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224385; c=relaxed/simple;
	bh=LE+WkTqaVm/NiyW/wjuWvWBSmAcZLoCo8XOYwBBiRNY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GedAnt/T2LBW8aqCDfo1jRdKTvHdSDQdMrA8wjYVhBMb5pA+MLnRMojpVficUIJa06w0yOrQCTrpGPorBjdPT7Ojn0gML55FkPJQ/6qfA0X2t8hbA32lmU/clLpTXQ2GnZhrv4FMOlami/wK4YsqUsA85RQcbvxDU9xv44YaYf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ap0gFApl; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ap0gFApl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPNKcOqFDexb26gIYS0zigx/sM5ny3qo+saDrClPuMt5R8za5z3PtNogno9q3yuVsW+lsR68v/UFwkEaL6DK/ZW3oL0oTNLolriWdP9Pi+yl2sDwURIEcZ7rjK2nmpBs64UITRkUJBifwhCDW1Amql5Ikl4RgB/WNU8mpqZ5jxA/KRvTt25WOeDtJldmUWyGjxFEbK2GOZsK4iRiuBuLllc/DG0/fnRQ/dUpB0DU6C0C16EcHM5B5K09PjRm4fmftc9iD6I0yIUW4XKbPjMm6wAeZCkVnVW9FDKrHPs1H18EEoqo+zIw/KXOEehyUVVCF/2jx6Iuvbq6ztlOi+Tv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXrb06k2Rxbpa1RZH9t7Y4SqpieU6TXz+KQ1s/zb6mM=;
 b=fQXk+oCGAtGLl+YA1lP8ZL1/CTijYTI4vMzTKeKNVzekKnhuQE1retczYSshigWxilVfkHBcooUMjBP/FPAKQOmdw5saeHVMW94SB5/VTiyiidNQP0RdZrSrAz8VeA1ZiZoBQI3JnIpz4tCIZaoF8WljYN2anlNJ1lCELCGrXc0azP/SRJsSpHs0tComwgOo3y92LpxYS4n/aHEH2Y0oGAQV2tUrsx5dQoXNDbvVCS1UYjoVN0kXUmRZDrGlHmGBd4k4fSkLDA1Gfbelq+AnXT+lL8NyNx6S7ztJvcgPBIFPtJZqQsus8Xwlmm8moD9dIBsDYrmH6xbJx6zunSfcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXrb06k2Rxbpa1RZH9t7Y4SqpieU6TXz+KQ1s/zb6mM=;
 b=Ap0gFApl9p+fVozuWN98lRlK6qCpmpQK165f8nWPgjMNZKpnrnyL16TgH5PT1N226tPKtzxCeekqSHMH6B9+KiQJghJLMyl1qz5VLapFVftX4NDeBBkS9zQ3YQWv2GknoR6ES1lNmzAorecoQJwkbEAFvO9uE6dbG3Ly8+xOKhwLKGRaaLMGbgkh1ys+Vf5/CYRxg0kisViHRQdhrjLuyKraKa1757gb9005GKF+DKe6A7o+Ke1dGQEzsZdpwZU3ggkgJwrqSzHVAD6M2SXVbSpCKVeADMTBkjDtrpuXtehB3cL3bdiZctqJ6/rZpDHT8lFZJQJSPzD0SjaV70ystg==
Received: from BN9PR03CA0114.namprd03.prod.outlook.com (2603:10b6:408:fd::29)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 11:12:50 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::1d) by BN9PR03CA0114.outlook.office365.com
 (2603:10b6:408:fd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 11:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 11:12:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 04:12:35 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 04:12:34 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 04:12:30 -0700
Date: Thu, 20 Aug 2026 14:12:27 +0300
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
Subject: Re: [PATCH 15/27] gpu: nova-core: add GMC send path
Message-ID: <20260820141227.1376e13b@inno-dell>
In-Reply-To: <20260819035221.336390-16-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-16-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: afcf5047-0224-400a-c658-08defeabf91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|18002099003|3023799007|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nFZpsdER8WGsCmJEqDHJByB/P6ULrAs6d626BHoy/ve0P7+wI6N0afbPF2Cc+LD8vIKivwDJ/k7CTXGoKYFgzghv4Rv1miBMfHmGbZUg1Fd9uZzLmCqamjkknifLf149P0mXWM+wwiQdaot0QhUwneWlIL91tS2lU5NQ1WumuB+o2cnLV6WDoYuN+dy6AAsByac+1KvMkqIQY2U598brQIqDReiMk5/fuAry5H9ZhrCINzx8v357n4UCmXK6nNevbqEV1O6JsoEGUO44mdez55IpFZL2+pWk426qKIHVUDwBZsd4Fk0JVTJPMSqh9O7kTGINOhjJq4tC8VqIwCUDWN8ouLwuShF4AnpVjD9jVYBbWK86w8QcmohpdQEeQ+npDmmDqKUvylPWbqxkh/Hgl/HntOxKV0q9dVRR/7N1OGooaUl++SCLG5FSCfmNyjtGG2/SKBnErWe3L1p0oa3XLnldRsVWY0O6DuhhjM1nC5Ipx+miIEPkh5zfVLYuoG9CXVSTlROzI0MRVq678HTK2bqayLt0ksjaYESOuZNx+V+KvE0yzTb5jw8DxeCp2WynwLCVxdnXGBb7vjwvZqyu6XBITn0mfaMLntneOKqkN73mvbM9UGu4CJdCFQ7v5ULuodc7cXAe1N9gaSly4O3g+f0aYOvMdodl5LiWZZdGH5Ix/2+QVHgpw7LWvsg65ped/2Kd6DZ8hc7Ylmgo19Xjkw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(18002099003)(3023799007)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KHlTE9CUnQ9j7CmppZgiMVQNpCpPFnu0/zMyxvN1GxrCSK1Be12fkuqXnAJ03zXmqDWRlXxkqWeAoi3vFzno5dDIFvL7iTzxnjJnHAd8yyH/W0r1EERs/YQbu7TmnofQxj6gXG33xW8X4Lz2domfbkYZVmQSMuPKtFtEdpBlKkCBcUqFsvJonEMV3qHkU42enjR9dm+PUdJ9DmQcN4Foo9etneqdqqg6jHz3eTRQFTRfMJLzZ0gtIYJf6tbxTcLxPKAkDhrVUrDjd/JLdTKHTJZ9IlsGDeRvvb+VsUZSzgT+GFXgQj2TBA6SdCHBuLFiVxgqVztS4K9tcgeoNFrNrYcopIuAX8mdWbNJatbsS5bSq0sb41YBHFcMzpfxnVuqTiN4pXOcMnuw5fFkx0s+4FhJkfEhyXvNlUlFgGN70g1QNvcVc1KEgPhvNbFcnih4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:12:50.3802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcf5047-0224-400a-c658-08defeabf91f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

On Tue, 18 Aug 2026 20:52:08 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looking good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The r000 GSP-RM boot protocol requires the driver to send GSP_INIT as
> a GMC command. GMC and RPC commands share the command queue and
> sequence counter. GMC queue elements carry a GMC API header and no
> checksum.
> 
> Add the GMC send path needed for GSP_INIT.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 59
> +++++++++++++++++++++++++++++++ drivers/gpu/nova-core/gsp/fw.rs   |
> 1 - 2 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index 0dab3d279426..88b143c6a7b7
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -52,6 +52,7 @@
>      driver::Bar0,
>      gsp::{
>          fw::{
> +            GspGmcMsgElement,
>              GspMsgElement,
>              MsgFunction,
>              MsgqRxHeader,
> @@ -963,6 +964,64 @@ fn send_command<M>(&mut self, bar: Bar0<'_>,
> command: M) -> Result<u32> Ok(rpc_seq)
>      }
>  
> +    /// Sends a GMC API command to the GSP.
> +    ///
> +    /// `command_id` is the GMC command identifier (from
> `GMCAPI_COMMANDS`).
> +    /// `payload` is the command-specific data following the
> [`super::fw::GmcApiHeader`].
> +    /// `max_response_size` is the maximum expected response payload
> size.
> +    ///
> +    /// The command carries the next RPC sequence number, which the
> GSP echoes in its response.
> +    /// The number is consumed whether or not the send succeeds.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EMSGSIZE` if the command exceeds the maximum queue
> element size.
> +    /// - `ETIMEDOUT` if space does not become available within the
> timeout.
> +    /// - `EIO` if the command header is not properly aligned.
> +    #[expect(dead_code)]
> +    fn send_gmc(
> +        &mut self,
> +        bar: Bar0<'_>,
> +        command_id: u32,
> +        payload: &[u8],
> +        max_response_size: u32,
> +    ) -> Result {
> +        let rpc_seq = self.rpc_seq;
> +        self.rpc_seq = self.rpc_seq.wrapping_add(1);
> +
> +        let dst = self
> +            .gsp_mem
> +            .allocate_command::<GspGmcMsgElement>(payload.len(),
> Self::ALLOCATE_TIMEOUT)?; +
> +        let msg_element = GspGmcMsgElement::init(
> +            command_id,
> +            u64::from(rpc_seq),
> +            payload.len(),
> +            max_response_size,
> +        );
> +        // SAFETY: `dst.header` points to a valid, writable
> `GspGmcMsgElement` region.
> +        unsafe {
> +            msg_element.__init(core::ptr::from_mut(dst.header))?;
> +        }
> +
> +        SBufferIter::new_writer([&mut dst.contents.0[..], &mut
> dst.contents.1[..]])
> +            .write_all(payload)?;
> +
> +        dev_dbg!(
> +            &self.dev,
> +            "GSP GMC: send: seq# {}, command_id=0x{:x},
> length=0x{:x}\n",
> +            rpc_seq,
> +            command_id,
> +            dst.header.length(),
> +        );
> +
> +        let elem_count = dst.header.element_count();
> +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> +        Cmdq::notify_gsp(bar);
> +
> +        Ok(())
> +    }
> +
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not
> interpret or validate the message diff --git
> a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index 050a6af8c0c7..56f255a3d49c 100644 ---
> a/drivers/gpu/nova-core/gsp/fw.rs +++
> b/drivers/gpu/nova-core/gsp/fw.rs @@ -1016,7 +1016,6 @@ pub(crate)
> struct GspGmcMsgElement { ==
> core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader) );
>  
> -#[expect(dead_code)]
>  impl GspGmcMsgElement {
>      /// Creates a new GMC message element.
>      ///

