Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75960400E09
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221601; cv=fail; b=iANPtN5EomDZKtZXUwZKykGjTqtGFlCVhmRok4QehDb4jGCVLRLaIFEU9/ohCoCMGf/VXuUsR1cnw6e13HLd7A15VFWVKvlpxKuDsFSH4wolOM2QdWfTKYJsGvtwMKME34UgXHmxmKtpLKGh1BXxL1AoENblyI5P3QrgeQseu+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221601; c=relaxed/simple;
	bh=alIn+NPo+Q05NZuoN2kbPEUIXrLl1Gvv2UwmBL/lm0I=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuYOnVyUAWvR5OfdLmtw/Pk0XAvptZvlCd4uFr0mR4aAYsQVAg45j6TfeKPzqhKJ5mZw/EwUf2yR9bh+60BcJsll+sKRfkqkCyuisWcB9WkfBsytgQuHy3FWpx2jgM4TmcINsVekXQG4+4PYFQo3wiwfGo0PSyBqnhmg49mCI3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r5gg1hRH; arc=fail smtp.client-ip=52.101.57.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r5gg1hRH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2gJ92WOiriBY78qnWLc6mVdEM3SzI70QZl9T5bHNE4IE7C7lL98FRUorbAEeTT9r5d3SiZmBlU1qOH9/0dKN+JWF/Ypqa5Q8Pt7CCh6XNsvXaJg9g67ERSkyRjkAOAAGybcoiod7D2bLhzahJOwusAOzkBVmUHPiv9G5CbXlMyMk1Av9x8c/daLdIF6P6zQd10WlWW9SYFmL12jqlP7thjJIVBMbJQLSSXO0C+W2S2KXCnsL9mNWulQjQO4uDqcum8qSmlHCcTfu1VNRJeRcaEVcqE6uVoBNOtIOsRaT3Ftk0QDI+KXS8CV0v30rJXhwHH4Acp5m2S8R0qXPAVoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4YO4rIrH+EKdkkXpTEVhbjluKhvxzMvGGEN4+lZXuc=;
 b=v9fmzfVo21GCcMIdgOTCipd60RPMk0M18QSJ2eRV5EhMNFe+nmg+udA9eUZSS3rMW/8hs0LecFCAGMC5TMfZnZRu72m3V50oLnmJokHu7PQ+luysnJMpSlXHldwpWBnKi9ngqI6prORaHKsx8nPcXt0Vcffp3eT/1BtgR22ppmlHi0mBP0useNVS9aEWGy9d9tJcNDEkMCotpoKt/u+w9Oi1AnLajdfqwTdcoTjoT3AioSAhzjgfnwkvI3MXxl29DuW7rCXVMEGZWXUJ+6b2GIPrVJz784l6cuJzldvk6gRcC6ILzx5Tfioxw/KrMJaALqMd8966kkvPhjWv2n7Qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4YO4rIrH+EKdkkXpTEVhbjluKhvxzMvGGEN4+lZXuc=;
 b=r5gg1hRHdWQwqklh1rLMFdQ0Qo7C+rhIvB9kDVxkKNqjk6PoWnEzPDC0PoqETZ7Mgy6xlZ/v+B0WHdL8ghL/qLXWQbpoXQDp64aC1nVdUGmq7863mo2vB6kflxT9eNH3QEtr0sWENftH+aLIWHa1UUFIUHXikoLUS1b8rHSoFFitna450LKSMVoYZn11BCozDnL5hNHoX1rSjkPRH6e4yLTLK4bY7jgfWNsfVNNKT4DSgXiaUr+lxmCqyIVYUpim5NeHMFGEuYF1X8i+KLGEi24Z86YyfHi9G0Ud0VLknkLxI2y4jXOWsUjH/7B7IMTpM3QtNcF2zc/eHBXuqxtZaQ==
Received: from MW4PR03CA0193.namprd03.prod.outlook.com (2603:10b6:303:b8::18)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 10:26:28 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::a0) by MW4PR03CA0193.outlook.office365.com
 (2603:10b6:303:b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Thu,
 20 Aug 2026 10:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 10:26:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 03:26:12 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 03:26:12 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 03:26:07 -0700
Date: Thu, 20 Aug 2026 13:26:05 +0300
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
Subject: Re: [PATCH 06/27] gpu: nova-core: distinguish async GSP RPC traffic
 in debug logs
Message-ID: <20260820132605.60078897@inno-dell>
In-Reply-To: <20260819035221.336390-7-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-7-jhubbard@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a43e3d-0ecc-422c-80c6-08defea57e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4ssgc4Uu8m0Z2FumAp5KZiqSGjTeWGPruUUMcJuGrSb8k+8+JISA3dSk4LG8Fp59RBsrtK3Sobf1BiJImlBPcwhjNpRBqFYw/QNz98U15RwR92qTi8Ly8enjLWuoy63FMkTPFfavJSDXhWyFFv9KbsyU2M9XGDUAxlyPj1ofwJmQnKCXMh9ceGqyS8e1uoXRRHoX/VerxJ3rfdKI3GZ9Q7k/bqdnnFMgIacQ5cBZLpJD6LHmJzCgLr01eMMZrEJXEejuQFDcrPnIZ+HrSe6LRVGWH1NELoNKUDdds+0FYwGbvpR3+9f2lTyOIMNbQoNcvSqYNII0KvxUF3NkUavtGbZnyBtQgkwx36Qi1/dBpV4xipvc8L2muYR/ak5miSFK3svdtHEcudipWfUhq7rEvCtqRUmQehw0Vlin0L2zzT15r54VK6WHIGpp3B51u+gIvVKp7zhNuMKkgdKUc+crFqI8hFwOt+JcBAszQSk993QaFq69ksf6lnQLY/n4Xf+WwPSwxXEAoPrHGXO9vDKbpSRAnzHWnJ8PBaxfNGYmPzJgr59isAl3Iu2dBUuBFZSpG9B7rI7X5x8cGw61GYOqS1b7CIazjNGhI2ACeCauHv1cDYm2XVreBU7VB8AaO/+ZB//g0fslUO7dv9NF9dbRDtysXLd6n2MdtYRR1kHuZY0b5yZtV8mdpEtabYICWDovNxVLNC2Z5Ns6tRwHotmQvQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gLh//GjKlEgUM+coP8uqbMEeXaEFT58trUlmGUjbdwm8oT8VD5RKVtBMW9bBkyVgsfpSXwbQ9HIWM1wzeORXBMlXbAH7/h8q5HL57e5SD3RjdREihHThWCJPoqtHOa+fVBMmXQVxrQY8if6PWx599S+xuwSAncsEk08fLNTBVr0ZVG5auNK9PO0z7WMtTrBgUGA8sBYjpwfjrsv+qYgsNtB58TRmWEzGSVz2khvRb9ot24F39vrDk7qKWBtMA3sf1r1CEbZDcGlAq6qvLqSUw2Q46XfOibfVagfJaqf43VMVvsY2rh8xzOm8Y4YjhJCOlQik1JhURUIpeZUnWOioCK8EnvunFuwmDKBlcRE5CIZvxrBQEJ8xu2l177RXmVysUcwM0G9CRbkE2RXDFNoKWDZXmVkhXF1K9DzI7PJE51cryi4SZQTN98DmsHp2EFe+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 10:26:27.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a43e3d-0ecc-422c-80c6-08defea57e55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114

On Tue, 18 Aug 2026 20:51:59 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Looks good to me with one nit: should we use wrapping_add(1) for
tx_async_seq/rx_event_seq?

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

Z.

> The receive path logged every message at the transport layer and did
> not distinguish events from command replies. Async sends shared the
> RPC sequence with waited-for commands, and GSP-initiated events
> arrived with that field unset.
> 
> Print a distinct debug line for async send, sync send, event, and
> command reply. Number async sends and events with driver-local
> counters.
> 
> IS_ASYNC selects only the send log line. Every command still carries
> the next RPC sequence on the wire.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs             | 111
> ++++++++++++++---- .../gpu/nova-core/gsp/cmdq/continuation.rs    |
> 1 + drivers/gpu/nova-core/gsp/commands.rs         |   2 +
>  drivers/gpu/nova-core/gsp/fw.rs               |  19 +++
>  4 files changed, 107 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index ac3e6642031a..d3afe3f9bb37
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -87,6 +87,12 @@ pub(crate) trait CommandToGsp {
>      /// Function identifying this command to the GSP.
>      const FUNCTION: MsgFunction;
>  
> +    /// Classifies the send-side debug log as an async send.
> +    ///
> +    /// Default is `false`. Set this only on commands that are sent
> without waiting for a reply. A
> +    /// [`NoReply`] continuation of a waited-for command stays
> `false`.
> +    const IS_ASYNC: bool = false;
> +
>      /// Type generated by [`CommandToGsp::init`], to be written into
> the command queue buffer. type Command: FromBytes + AsBytes;
>  
> @@ -528,6 +534,8 @@ pub(crate) fn new(dev:
> &device::Device<device::Bound>) -> impl PinInit<Self, Err gsp_mem,
>                      elem_seq: 0,
>                      rpc_seq: 0,
> +                    tx_async_seq: 0,
> +                    rx_event_seq: 0,
>                      poisoned: Cell::new(false),
>                  }),
>              }))
> @@ -672,6 +680,12 @@ struct CmdqInner {
>      /// [`CmdqInner::receive_msg`] match that reply to the awaiting
> command. Advances once per /// logical command.
>      rpc_seq: u32,
> +    /// Debug-log sequence for async sends. Those commands do not
> wait for a reply, so this
> +    /// counter is the number printed in the send log.
> +    tx_async_seq: u32,
> +    /// Debug-log sequence for GSP-initiated events. The GSP leaves
> the RPC sequence unset on
> +    /// those messages, so the driver numbers them itself.
> +    rx_event_seq: u32,
>      /// Set once a message with corrupt framing or a bad checksum is
> seen. Such a message has an /// untrusted length, so the queue cannot
> be advanced past it, and every later receive fails /// until the
> queue is torn down and reset. @@ -738,13 +752,24 @@ fn
> send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq:
> u32) -> dst.contents.1, ])));
>  
> -        dev_dbg!(
> -            &self.dev,
> -            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
> -            rpc_seq,
> -            M::FUNCTION,
> -            dst.header.length(),
> -        );
> +        if M::IS_ASYNC {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: async send: seq# {}, function={:?},
> length=0x{:x}\n",
> +                self.tx_async_seq,
> +                M::FUNCTION,
> +                dst.header.length(),
> +            );
> +            self.tx_async_seq += 1;
> +        } else {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: send: seq# {}, function={:?},
> length=0x{:x}\n",
> +                rpc_seq,
> +                M::FUNCTION,
> +                dst.header.length(),
> +            );
> +        }
>  
>          // All set - update the write pointer and inform the GSP of
> the new command. let elem_count = dst.header.element_count();
> @@ -826,14 +851,6 @@ fn wait_for_msg(&self, timeout: Delta) ->
> Result<GspMessage<'_>> { return Err(EIO);
>          };
>  
> -        dev_dbg!(
> -            &self.dev,
> -            "GSP RPC: receive: seq# {}, function={:?},
> length=0x{:x}\n",
> -            header.sequence(),
> -            header.function(),
> -            header.length(),
> -        );
> -
>          let payload_length = header.payload_length();
>  
>          // Check that the driver read area is large enough for the
> message. @@ -877,6 +894,41 @@ fn wait_for_msg(&self, timeout: Delta)
> -> Result<GspMessage<'_>> { })
>      }
>  
> +    /// Writes the classified receive debug line for a decoded GSP
> message.
> +    ///
> +    /// Events print [`Self::rx_event_seq`]. Command replies print
> `seq`. An unrecognized function
> +    /// code prints nothing here.
> +    fn log_received(&self, function: Result<MsgFunction, u32>, seq:
> u32, length: usize) {
> +        match function {
> +            Ok(f) if f.is_event() => {
> +                dev_dbg!(
> +                    &self.dev,
> +                    "GSP RPC: async received: seq# {},
> function={:?}, length=0x{:x}\n",
> +                    self.rx_event_seq,
> +                    f,
> +                    length,
> +                );
> +            }
> +            Ok(f) => {
> +                dev_dbg!(
> +                    &self.dev,
> +                    "GSP RPC: response received: seq# {},
> function={:?}, length=0x{:x}\n",
> +                    seq,
> +                    f,
> +                    length,
> +                );
> +            }
> +            Err(_) => {}
> +        }
> +    }
> +
> +    /// Advances [`Self::rx_event_seq`] after a GSP-initiated event
> has been consumed.
> +    fn advance_rx_event_seq(&mut self, function: Result<MsgFunction,
> u32>) {
> +        if matches!(function, Ok(f) if f.is_event()) {
> +            self.rx_event_seq += 1;
> +        }
> +    }
> +
>      /// Receive a message from the GSP.
>      ///
>      /// The expected message type is given by the `M` generic
> parameter. With `expected_seq` set, @@ -910,9 +962,12 @@ fn
> receive_msg<M: MessageFromGsp>( let message =
> self.wait_for_msg(timeout)?; let function = message.header.function();
>          let seq = message.header.sequence();
> +        let length = message.header.length();
>          let func_matches = matches!(function, Ok(f) if f ==
> M::FUNCTION); let matched = func_matches &&
> expected_seq.is_none_or(|expected| seq == expected); 
> +        self.log_received(function, seq, length);
> +
>          // Every path must advance the read pointer past this
> message, including a failed decode. let result = if matched {
>              match M::Message::from_bytes_prefix(message.contents.0) {
> @@ -938,9 +993,10 @@ fn receive_msg<M: MessageFromGsp>(
>          };
>  
>          // Advance the read pointer past this message.
> -        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
> -            message.header.length().div_ceil(GSP_PAGE_SIZE),
> -        )?);
> +        self.gsp_mem
> +
> .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
> +
> +        self.advance_rx_event_seq(function);
>  
>          if !matched {
>              if func_matches {
> @@ -962,8 +1018,8 @@ fn receive_msg<M: MessageFromGsp>(
>      /// Routes a GSP message that is not the reply a caller is
> waiting for. ///
>      /// GSP-reported errors are logged at error level and
> unrecognized function codes at warning
> -    /// level. Every other known function code is consumed without a
> log line, because the RPC
> -    /// receive trace in [`Self::wait_for_msg`] already records its
> arrival.
> +    /// level. Every other known function code is consumed without a
> log line, because
> +    /// [`Self::log_received`] already records its arrival.
>      fn dispatch_event(&self, function: Result<MsgFunction, u32>,
> seq: u32) { match function {
>              Ok(MsgFunction::OsErrorLog) => {
> @@ -1004,16 +1060,19 @@ fn drain(&mut self) -> Result {
>          while !self.gsp_mem.driver_read_area().0.is_empty() {
>              // A message is available, so this returns without
> waiting. let msg = self.wait_for_msg(Delta::ZERO)?;
> -
> -            let pages =
> -
> u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_|
> {
> -                    dev_err!(&self.dev, "GSP drain: message length
> overflow\n");
> -                    EIO
> -                })?;
>              let function = msg.header.function();
>              let seq = msg.header.sequence();
> +            let length = msg.header.length();
> +
> +            self.log_received(function, seq, length);
> +
> +            let pages =
> u32::try_from(length.div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
> +                dev_err!(&self.dev, "GSP drain: message length
> overflow\n");
> +                EIO
> +            })?;
>  
>              self.gsp_mem.advance_cpu_read_ptr(pages);
> +            self.advance_rx_event_seq(function);
>              self.dispatch_event(function, seq);
>          }
>  
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs index
> 05e904f18097..a606c7be52a7 100644 ---
> a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs +++
> b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs @@ -147,6 +147,7 @@
> fn new(command: C, payload: KVVec<u8>) -> Self { 
>  impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
>      const FUNCTION: MsgFunction = C::FUNCTION;
> +    const IS_ASYNC: bool = C::IS_ASYNC;
>      type Command = C::Command;
>      type Reply = C::Reply;
>      type InitError = C::InitError;
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs
> b/drivers/gpu/nova-core/gsp/commands.rs index
> 61fe93db9e7e..d5575c036eb9 100644 ---
> a/drivers/gpu/nova-core/gsp/commands.rs +++
> b/drivers/gpu/nova-core/gsp/commands.rs @@ -52,6 +52,7 @@ pub(crate)
> fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Sel 
>  impl<'a> CommandToGsp for SetSystemInfo<'a> {
>      const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
> +    const IS_ASYNC: bool = true;
>      type Command = fw::commands::GspSetSystemInfo;
>      type Reply = NoReply;
>      type InitError = Error;
> @@ -122,6 +123,7 @@ pub(crate) fn new(vgpu_state: VgpuState) ->
> Result<Self> { 
>  impl CommandToGsp for SetRegistry {
>      const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
> +    const IS_ASYNC: bool = true;
>      type Command = fw::commands::PackedRegistryTable;
>      type Reply = NoReply;
>      type InitError = Infallible;
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> b/drivers/gpu/nova-core/gsp/fw.rs index d3678f16750a..857d53c77297
> 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -359,6 +359,25 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>      }
>  }
>  
> +impl MsgFunction {
> +    /// Returns true if this is a GSP-initiated async event
> (`NV_VGPU_MSG_EVENT_*`), as opposed to
> +    /// a command response (`NV_VGPU_MSG_FUNCTION_*`).
> +    pub(crate) fn is_event(&self) -> bool {
> +        matches!(
> +            self,
> +            Self::GspInitDone
> +                | Self::GspRunCpuSequencer
> +                | Self::PostEvent
> +                | Self::RcTriggered
> +                | Self::MmuFaultQueued
> +                | Self::OsErrorLog
> +                | Self::GspPostNoCat
> +                | Self::GspLockdownNotice
> +                | Self::UcodeLibOsPrint //
> +        )
> +    }
> +}
> +
>  impl From<MsgFunction> for u32 {
>      fn from(value: MsgFunction) -> Self {
>          // CAST: `MsgFunction` is `repr(u32)` and can thus be cast
> losslessly.

